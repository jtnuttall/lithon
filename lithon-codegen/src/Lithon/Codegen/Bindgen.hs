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
-- lives in the 'Bindgen' effect; 'runBindgen' brackets it around the whole
-- generation (spec sync and probe compilation read it after the chain).
module Lithon.Codegen.Bindgen (
  -- * Errors
  BindgenError (..),

  -- * The effect
  PackageInfo (..),
  BindgenOpts (..),
  Bindgen,
  runBindgen,
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

data BindgenError
  = DuplicateModules (Set Module.Meta)
  | NoHeadersFound
  | HsBindgenError Text HB.BindgenFailure
  | ModuleShimFailed FilePath HB.TransformError
  | FinalizeFailed FilePath Text
  | ModuleMangleError Module.MangleError
  | BindgenPanic Text
  deriving stock (Show)

instance Display BindgenError where
  displayBuilder = \case
    DuplicateModules dupes ->
      "module name collisions:" <> intercalateTB "\n - " (map displayBuilder . toList $ dupes)
    NoHeadersFound -> "no headers found in the include graph"
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
data BindgenOpts = BindgenOpts
  { invocationEnv :: HB.InvocationEnv
  , prescriptiveSpec :: Maybe FilePath
  , packageInfo :: PackageInfo
  }

data Bindgen :: Effect

type instance DispatchOf Bindgen = Static WithSideEffects
data instance StaticRep Bindgen = BindgenRep
  { opts :: BindgenOpts
  , scratchDir :: SystemTempDir
  }

-- | Bracket a generation run: one scratch directory for the whole
-- lifetime, so spec artifacts survive until consumers (spec sync, probe
-- compilation) have read them.
runBindgen :: (IOE :> es, Temporary :> es) => BindgenOpts -> Eff (Bindgen : es) a -> Eff es a
runBindgen opts eff =
  withSystemTempDirectory (toString opts.packageInfo.name) \scratchDir ->
    evalStaticRep BindgenRep{opts, scratchDir} eff

getScratchDirectory :: (Bindgen :> es) => Eff es SystemTempDir
getScratchDirectory = (.scratchDir) <$> getStaticRep @Bindgen

-- | One seam invocation under the run's environment: base module, includes,
-- prior specs in, artefact ops out.
invokeBindgen
  :: (IOE :> es, Bindgen :> es, Error BindgenError :> es)
  => [FilePath] -> Text -> [FilePath] -> HB.BindgenM a -> Eff es a
invokeBindgen priorSpecs baseModule includes ops = do
  rep <- getStaticRep @Bindgen
  let spec =
        HB.InvocationSpec
          { baseModule
          , includes
          , priorSpecs
          , prescriptiveSpec = rep.opts.prescriptiveSpec
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
  -- ^ Include-graph source path -> in-scope basename ('Nothing' for libc,
  -- clang builtins, anything outside the target's include root).
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
-- include graph (dependency-ordered source paths) that orders the real
-- per-header chain.
preflightGraph
  :: (IOE :> es, Bindgen :> es, Error BindgenError :> es) => HeaderPlan -> Eff es [FilePath]
preflightGraph plan = invokeBindgen [] "Preflight" plan.mainIncludes HB.sortedIncludeGraph

-- | Project the include graph onto the bound header set, in dependency
-- order, minting each unit's typed module name.
planHeaders :: (Error BindgenError :> es) => HeaderPlan -> [FilePath] -> Eff es [HeaderUnit]
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
-- and writes its own into the scratch directory.
chainHeaders
  :: (IOE :> es, Log :> es, Bindgen :> es, Error BindgenError :> es)
  => Visitor r -> [HeaderUnit] -> Eff es [HeaderResult r]
chainHeaders visitor = go []
 where
  go _ [] = pure []
  go priorSpecs (unit : rest) = do
    SystemTempDir specDir <- getScratchDirectory
    logInfo $ "processing header" :# ["unit" .= unit]
    res <- runHeader visitor priorSpecs unit
    (res :) <$> go ((specDir </> unit.specFile) : priorSpecs) rest

-- | One header through the fold: invoke (collecting the artefact bundle
-- and writing the binding spec), apply the visitor's stub edits at the AST
-- level, render with its text edits, finalize its payload.
runHeader
  :: (IOE :> es, Bindgen :> es, Error BindgenError :> es)
  => Visitor r -> [FilePath] -> HeaderUnit -> Eff es (HeaderResult r)
runHeader visitor priorSpecs unit = do
  SystemTempDir specDir <- getScratchDirectory
  arts <-
    invokeBindgen priorSpecs (Module.hsName unit.moduleName) [unit.include]
      $ HB.collectArtefacts <* HB.writeSpec (specDir </> unit.specFile)
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
  :: (IOE :> es, Log :> es, Bindgen :> es, Error BindgenError :> es)
  => HeaderPlan -> Visitor r -> Eff es [HeaderResult r]
runHeaderChain plan visitor = do
  graph <- preflightGraph plan
  units <- planHeaders plan graph
  chainHeaders visitor units
