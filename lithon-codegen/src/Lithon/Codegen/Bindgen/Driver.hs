{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}

-- | The target-agnostic bindgen driver: a fold over a library's public
-- headers with caller-provided visitors.
--
-- A target describes its header universe as data ('HeaderPlan': include
-- roots, exclusions, module mangling) and hands the fold a 'Visitor': the
-- ordered edit sets to apply to each translated family ('Passes', a
-- 'Monoid' so orthogonal concern sets compose) plus a finalizer producing
-- the caller's per-header payload. The driver owns everything else —
-- preflight, dependency ordering, spec chaining, invocation, rendering —
-- so a new target supplies configuration and visitors, not a new driver.
--
-- The scratch directory every invocation writes its binding spec into
-- lives in the 'Driver' effect; 'runDriver' brackets it around the whole
-- generation (spec sync and probe compilation read it after the chain).
module Lithon.Codegen.Bindgen.Driver (
  -- * Errors
  DriverError (..),

  -- * The effect
  PackageInfo (..),
  DriverOpts (..),
  Driver,
  runDriver,
  getScratchDirectory,
  invokeBindgen,

  -- * Planning
  HeaderPlan (..),
  defaultSpecFileName,
  HeaderUnit (..),

  -- * Visitors
  Passes (..),
  Visitor (..),
  HeaderResult (..),

  -- * The fold
  preflightGraph,
  planHeaders,
  chainHeaders,
  runHeaderChain,
) where

import Data.Aeson qualified as A
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Version (Version)
import Effectful
import Effectful.Dispatch.Static
import Effectful.Error.Dynamic
import Lithon.Effect.Log
import Lithon.Effect.Temporary (SystemTempDir (SystemTempDir), Temporary, withSystemTempDirectory)
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.FilePath ((<.>), (</>))
import System.FilePath qualified as FilePath

import Lithon.Codegen.Backend.Hs.Module qualified as Module

data DriverError
  = DuplicateModules (Set Module.Meta)
  | NoHeadersFound
  | -- | Override files (by file name) that pair with no planned unit's spec
    -- file: a typo, or the override of an excluded or removed header.
    OrphanOverrides [FilePath]
  | HsBindgenError Text HB.BindgenFailure
  | ModuleShimFailed FilePath HB.TransformError
  | FinalizeFailed FilePath Text
  | ModuleMangleError Module.MangleError
  | BindgenPanic Text
  deriving stock (Show)

instance Display DriverError where
  displayBuilder = \case
    DuplicateModules dupes ->
      "module name collisions:" <> intercalateTB "\n - " (map displayBuilder . toList $ dupes)
    NoHeadersFound -> "no headers found in the include graph"
    OrphanOverrides files ->
      "prescriptive overrides that pair with no bound header:"
        <> foldMap (\file -> "\n - overrides/" <> from file) files
        <> "\nan override file is named like its header's spec artifact (overrides/SDL_main.yaml"
        <> " pairs with spec/SDL_main.yaml); check for a typo, or delete the file of an excluded"
        <> " or removed header"
    HsBindgenError cxt err ->
      let errd = display err
       in from
            [trimmingQQ|
              $cxt: hs-bindgen invokation failed:

              $errd
            |]
    ModuleShimFailed header terr ->
      let headerd = from header
          detail = case terr of
            HB.StubEditMissed label symbol target ->
              "stub edit "
                <> label
                <> " landed on no wrapper of "
                <> symbol
                <> " (expected: "
                <> target
                <> ")"
            HB.TextEditMissed label needle ->
              "text edit " <> label <> " matched no module (needle=" <> needle <> ")"
          detaild = detail
       in from
            [trimmingQQ|
              $headerd: platform shim drifted: $detaild
            |]
    FinalizeFailed header reason ->
      let headerd = from header
       in from
            [trimmingQQ|
              $headerd: the target's finalizer failed.

              $reason
            |]
    ModuleMangleError err -> displayBuilder err
    BindgenPanic what ->
      from
        [trimmingQQ|
          panicked while trying to generate bindings via hs-bindgen:

            $what

          This is a bug in lithon-codegen; please open an issue upstream.
        |]

-- | Provenance of the package being generated; the scratch directory is
-- templated on the name.
data PackageInfo = PackageInfo
  { name :: Text
  , dataDir :: FilePath
  , version :: Maybe Version
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

-- | Everything constant across a generation run. The include roots ride in
-- 'HB.InvocationEnv' — one include plumbing, not two.
data DriverOpts = DriverOpts
  { invocationEnv :: HB.InvocationEnv
  , prescriptiveSpecs :: Map FilePath FilePath
  -- ^ The prescriptive binding specs, from a 'HeaderUnit' @specFile@ (the
  -- file name) to the file's path. A unit's invocation receives its own
  -- file alone and the preflight none, because hs-bindgen reports an entry
  -- as unused in every translation unit that does not parse its
  -- declaration. Each file holds the entries for its own header's
  -- declarations, which loses nothing: later invocations meet those
  -- declarations through the header's generated spec, whose @omit@ never
  -- drops one (it stays an unselected non-root). That holds while program
  -- slicing stays off ('Lithon.Codegen.Bindgen.Env.invocationEnv').
  -- 'chainHeaders' refuses a file that pairs with no planned unit.
  , packageInfo :: PackageInfo
  }

data Driver :: Effect

type instance DispatchOf Driver = Static WithSideEffects
data instance StaticRep Driver = DriverRep
  { opts :: DriverOpts
  , scratchDir :: SystemTempDir
  }

-- | Bracket a generation run: one scratch directory for the whole
-- lifetime, so spec artifacts survive until consumers (spec sync, probe
-- compilation) have read them.
runDriver :: (IOE :> es, Temporary :> es) => DriverOpts -> Eff (Driver : es) a -> Eff es a
runDriver opts eff =
  withSystemTempDirectory (toString opts.packageInfo.name) \scratchDir ->
    evalStaticRep DriverRep{opts, scratchDir} eff

getScratchDirectory :: (Driver :> es) => Eff es SystemTempDir
getScratchDirectory = (.scratchDir) <$> getStaticRep @Driver

-- | One seam invocation under the run's environment: the prescriptive
-- spec (if any), base module, includes, prior specs in, artefact ops out.
invokeBindgen
  :: (IOE :> es, Driver :> es, Error DriverError :> es)
  => Maybe FilePath -> [FilePath] -> Text -> [FilePath] -> HB.BindgenM a -> Eff es a
invokeBindgen prescriptiveSpec priorSpecs baseModule includes ops = do
  rep <- getStaticRep @Driver
  let spec =
        HB.InvocationSpec
          { baseModule
          , includes
          , priorSpecs
          , prescriptiveSpec
          }
  res <- liftIO $ HB.runBindgen rep.opts.invocationEnv spec ops
  either (throwError . HsBindgenError baseModule) pure res

-- | A target's header universe, as data: how headers are discovered,
-- filtered, and named. Planning is pure given the include graph.
data HeaderPlan = HeaderPlan
  { baseNamespace :: Module.Meta
  -- ^ Root of the generated namespace, e.g. @SDL3.Sys.Bindgen@.
  , mangle :: Module.MangleOpts
  -- ^ Header basename -> module leaf (appended to 'baseNamespace').
  , projectHeader :: FilePath -> Maybe FilePath
  -- ^ Include-graph real path (canonical, symlink-resolved) -> in-scope
  -- basename ('Nothing' for libc, clang builtins, anything outside the
  -- target's include root).
  , includeArg :: FilePath -> FilePath
  -- ^ Basename -> the hash-include argument, e.g. @SDL3\/SDL_video.h@.
  , excludedHeaders :: Set FilePath
  -- ^ Basenames bound never (internal, umbrella, GL glue).
  , mainIncludes :: [FilePath]
  -- ^ The preflight include set: the umbrella plus any extras.
  , specFileName :: FilePath -> FilePath
  -- ^ Basename -> binding-spec artifact name.
  }

-- | @SDL_video.h@ -> @SDL_video.yaml@.
defaultSpecFileName :: FilePath -> FilePath
defaultSpecFileName basename = FilePath.dropExtension basename <.> "yaml"

-- | One public header = one invocation = one module family.
data HeaderUnit = HeaderUnit
  { include :: FilePath
  -- ^ The hash-include argument, e.g. @SDL3\/SDL_video.h@.
  , headerName :: FilePath
  -- ^ Basename, e.g. @SDL_video.h@ — the census\/artifact key.
  , moduleName :: Module.Meta
  -- ^ The types module, e.g. @SDL3.Sys.Bindgen.Video@; term categories
  -- hang off it (@.Safe@, @.Unsafe@, @.FunPtr@, @.Global@).
  , specFile :: FilePath
  -- ^ Spec artifact basename, e.g. @SDL_video.yaml@.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (A.ToJSON)

-- | The ordered edit sets a visitor applies to each translated family.
-- Providers see the header's unit and full artefact bundle, so an edit set
-- may key on the reified C declarations (version gates do).
--
-- The 'Semigroup' is pointwise; the LEFT operand's edits apply first, and
-- later edits see earlier edits' output — composition order is meaningful.
data Passes = Passes
  { stubEdits :: HeaderUnit -> HB.HeaderArtefacts -> [HB.StubEdit]
  , textEdits :: HeaderUnit -> HB.HeaderArtefacts -> [HB.TextEdit]
  }

instance Semigroup Passes where
  l <> r =
    Passes
      { stubEdits = \unit arts -> l.stubEdits unit arts <> r.stubEdits unit arts
      , textEdits = \unit arts -> l.textEdits unit arts <> r.textEdits unit arts
      }

instance Monoid Passes where
  mempty = Passes{stubEdits = \_ _ -> [], textEdits = \_ _ -> []}

-- | Everything a target asks the fold to do to each header: the edit sets,
-- then a finalizer distilling the caller's per-header payload from the
-- artefacts and the rendered family.
data Visitor r = Visitor
  { passes :: Passes
  , finalize
      :: HeaderUnit
      -> HB.HeaderArtefacts
      -> [HB.NameableModule HB.RenderedHsModule]
      -> Either Text r
  }

-- | One header's fold result: the rendered family every target needs, plus
-- the caller's payload.
data HeaderResult r = HeaderResult
  { unit :: HeaderUnit
  , modules :: [HB.NameableModule HB.RenderedHsModule]
  , payload :: r
  }

-- | One boot+frontend run over the plan's main includes, returning the
-- include graph (dependency-ordered real paths: canonical, symlink-resolved)
-- that orders the real per-header chain. It gets no prescriptive spec: it
-- only reads the graph, and an entry would draw an unused-entry warning
-- whenever the main includes do not reach its declaration.
preflightGraph
  :: (IOE :> es, Driver :> es, Error DriverError :> es) => HeaderPlan -> Eff es [FilePath]
preflightGraph plan = invokeBindgen Nothing [] "Preflight" plan.mainIncludes HB.sortedIncludeGraph

-- | Project the include graph onto the bound header set, in dependency
-- order, minting each unit's typed module name.
planHeaders :: (Error DriverError :> es) => HeaderPlan -> [FilePath] -> Eff es [HeaderUnit]
planHeaders plan graph = do
  let inScope =
        [ basename
        | path <- graph
        , Just basename <- [plan.projectHeader path]
        , basename `notElem` plan.excludedHeaders
        ]
  units <- traverse toUnit inScope

  case duplicates (map (.moduleName) units) of
    [] -> pass
    collisions -> throwError $ DuplicateModules collisions

  when (null units) $ throwError NoHeadersFound
  pure units
 where
  toUnit basename = do
    mangled <-
      liftEither . first ModuleMangleError $ Module.mangleHeader basename plan.mangle
    pure
      HeaderUnit
        { include = plan.includeArg basename
        , headerName = basename
        , moduleName = plan.baseNamespace <> view Module.metaL mangled
        , specFile = plan.specFileName basename
        }

-- | Fold the chain in dependency order: every invocation consumes the
-- specs generated by its predecessors as external binding specifications
-- and writes its own into the scratch directory, and applies the
-- prescriptive spec whose file name is its 'specFile', if any. Before the
-- first invocation, a prescriptive spec that pairs with none of the units is
-- an 'OrphanOverrides' error: the unit is excluded, absent, or the file is
-- misspelled.
chainHeaders
  :: (IOE :> es, Log :> es, Driver :> es, Error DriverError :> es)
  => Visitor r -> [HeaderUnit] -> Eff es [HeaderResult r]
chainHeaders visitor units = do
  rep <- getStaticRep @Driver
  let overrides = rep.opts.prescriptiveSpecs
      planned = Set.fromList (map (.specFile) units)
      orphans = filter (`Set.notMember` planned) (Map.keys overrides)
  unless (null orphans) $ throwError (OrphanOverrides orphans)
  go overrides [] units
 where
  go _ _ [] = pure []
  go overrides priorSpecs (unit : rest) = do
    SystemTempDir specDir <- getScratchDirectory
    let override = Map.lookup unit.specFile overrides
    logInfo $ "processing header" :# ["unit" .= unit, "override" .= override]
    res <- runHeader visitor priorSpecs override unit
    (res :) <$> go overrides ((specDir </> unit.specFile) : priorSpecs) rest

-- | One header through the fold: invoke (collecting the artefact bundle
-- and writing the binding spec) under the header's prescriptive spec, apply
-- the visitor's stub edits at the AST level, render with its text edits,
-- finalize its payload.
runHeader
  :: (IOE :> es, Driver :> es, Error DriverError :> es)
  => Visitor r -> [FilePath] -> Maybe FilePath -> HeaderUnit -> Eff es (HeaderResult r)
runHeader visitor priorSpecs override unit = do
  SystemTempDir specDir <- getScratchDirectory
  arts <-
    invokeBindgen override priorSpecs (Module.hsName unit.moduleName) [unit.include]
      $ HB.collectArtefacts
      <* HB.writeSpec (specDir </> unit.specFile)
  shimmed <-
    liftEither
      . first (ModuleShimFailed unit.headerName)
      $ HB.applyStubEdits (visitor.passes.stubEdits unit arts) arts.family
  modules <-
    liftEither
      . first (ModuleShimFailed unit.headerName)
      $ HB.renderFamilyWith (visitor.passes.textEdits unit arts) shimmed
  payload <-
    liftEither . first (FinalizeFailed unit.headerName) $ visitor.finalize unit arts modules
  pure HeaderResult{unit, modules, payload}

-- | preflight -> plan -> chain: the whole fold.
runHeaderChain
  :: (IOE :> es, Log :> es, Driver :> es, Error DriverError :> es)
  => HeaderPlan -> Visitor r -> Eff es [HeaderResult r]
runHeaderChain plan visitor = do
  graph <- preflightGraph plan
  units <- planHeaders plan graph
  chainHeaders visitor units
