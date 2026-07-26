{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | The @sdl3@ subcommand tree: hs-bindgen-driven SDL3 binding generation.
--
-- @spec@ (steps 1–2 of the artifact flow) runs the per-header chain far
-- enough to produce every header's binding specification and syncs them
-- under @lithon-codegen\/sdl3\/spec\/@ — the committed, reviewable record
-- of the generated type surface, and the chaining medium between header
-- invocations.
--
-- Curation lives in @lithon-codegen\/sdl3\/overrides.yaml@
module Lithon.Codegen.Sdl3 (
  Sdl3Cmd (..),
  sdl3CmdP,
  runSdl3,
) where

import Data.Aeson qualified as Aeson
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Effectful (Eff, IOE, (:>))
import Effectful.Concurrent.Async (Concurrent)
import Effectful.Error.Dynamic (Error, runError, throwError_)
import Effectful.Exception qualified as EEx
import Effectful.FileSystem (
  FileSystem,
  doesFileExist,
 )
import Effectful.FileSystem.IO.ByteString qualified as EBS
import Options.Applicative hiding (ParseError, asum)
import System.Directory qualified as Dir
import System.Environment (lookupEnv)
import System.Exit (ExitCode (..))
import System.FilePath ((</>))
import System.IO.Temp qualified as Temp
import System.Process (readProcessWithExitCode)

import Lithon.Codegen.Backend.Emit (EmitError, EmitStrategy (..), EmitTarget (..), emitPackage)
import Lithon.Codegen.Backend.Json (digestText)
import Lithon.Codegen.Effect.ClangEnv (ClangEnv)
import Lithon.Codegen.Effect.Log
import Lithon.Codegen.Effect.Util (mapDynError)
import Lithon.Codegen.Prelude
import Lithon.Codegen.Sdl3.Abi (AbiMacroConst (..))
import Lithon.Codegen.Sdl3.Alias (
  AliasModule (..),
  FamilyDecls (..),
  aliasRewriteMap,
  functionCensus,
  planAliasLayer,
  renderAliasModule,
  renderRuntimeModule,
  renderUmbrella,
 )
import Lithon.Codegen.Sdl3.Alias.Config (
  ValidatedAliasConfig (..),
  decodeAliasConfig,
  namingRuleText,
  validateAliasConfig,
 )
import Lithon.Codegen.Sdl3.Alias.Constants qualified as Constants
import Lithon.Codegen.Sdl3.Versions (
  Versioned (..),
  VersionsRegistry (..),
  decodeVersionsRegistry,
 )
import Lithon.Codegen.Sdl3.Bindgen (
  BindgenError,
  HeaderResult (..),
  HeaderUnit (..),
  chainHeaders,
  planHeaders,
  preflightGraph,
 )
import Lithon.Codegen.Sdl3.Env (Sdl3Env (..), Sdl3Gen, SdlResolutionError, getSdl3Env, runSdl3Gen)
import Lithon.Codegen.Sdl3.Package (assemblePackage)

data Sdl3Cmd
  = CmdSpec SpecOpts
  | CmdGenerate GenerateOpts

data SpecOpts = SpecOpts
  { specDir :: FilePath
  , checkOnly :: Bool
  }

data GenerateOpts = GenerateOpts
  { specDir :: FilePath
  , outDir :: FilePath
  , checkOnly :: Bool
  }

sdl3CmdP :: Parser Sdl3Cmd
sdl3CmdP =
  hsubparser
    ( command
        "spec"
        ( info
            (CmdSpec <$> specOptsP)
            (progDesc "Run the per-header chain and sync the binding-spec artifacts (steps 1-2)")
        )
        <> command
          "generate"
          ( info
              (CmdGenerate <$> generateOptsP)
              (progDesc "Run the chain and emit the sdl3-bindgen-sys package + spec artifacts (step 3)")
          )
    )

specDirP :: Parser FilePath
specDirP =
  strOption
    ( long "spec-dir"
        <> metavar "DIR"
        <> value "lithon-codegen/sdl3"
        <> showDefault
        <> help "SDL3 artifact directory (spec/ + overrides.yaml + manifest)"
    )

checkP :: Parser Bool
checkP = switch (long "check" <> help "Diff fresh output against the tree; write nothing (CI gate)")

specOptsP :: Parser SpecOpts
specOptsP = SpecOpts <$> specDirP <*> checkP

generateOptsP :: Parser GenerateOpts
generateOptsP =
  GenerateOpts
    <$> specDirP
    <*> strOption
      ( long "out"
          <> metavar "DIR"
          <> value "sdl3-bindgen-sys"
          <> showDefault
          <> help "Target package directory"
      )
    <*> checkP

runSdl3
  :: ( IOE :> es
     , Concurrent :> es
     , Log :> es
     , Error Text :> es
     , ClangEnv :> es
     , FileSystem :> es
     )
  => Sdl3Cmd -> Eff es ()
runSdl3 cmd = mapDynError @SdlResolutionError display . runError $ runSdl3Gen case cmd of
  CmdSpec opts -> withScratch \scratch -> do
    registry <- loadVersionsRegistry opts.specDir
    results <- runChain registry scratch opts.specDir
    syncSpecs SpecTarget{specDir = opts.specDir, checkOnly = opts.checkOnly} results
  CmdGenerate opts -> withScratch \scratch -> do
    registry <- loadVersionsRegistry opts.specDir
    results@(env, _, headerResults) <- runChain registry scratch opts.specDir
    -- Specs and package come from the same chain run, so they can never
    -- skew; both emits respect --check.
    syncSpecs SpecTarget{specDir = opts.specDir, checkOnly = opts.checkOnly} results
    (aliasFiles, macroConsts, aliasMeta) <-
      planAliases registry env scratch opts.specDir headerResults
    packageFiles <- liftEither =<< liftIO (assemblePackage aliasFiles macroConsts headerResults)
    mapDynError @EmitError display
      . runError
      $ emitPackage
        HaskellPackage
        EmitTarget
          { outDir = opts.outDir
          , manifestMeta = chainMeta results <> aliasMeta
          , checkOnly = opts.checkOnly
          }
        packageFiles

-- | Load, validate, plan, and render the curated @SDL3.Sys.*@ layer.
--
-- Both registries are required: every callback-taking function must be
-- classified (@aliases.json@) and the typed-constant groups are the
-- deliberate record of macro↔newtype membership (@constants.json@) — a
-- missing registry is a hard error with guidance, not a silent partial
-- run.
planAliases
  :: ( IOE :> es
     , Log :> es
     , Error Text :> es
     , FileSystem :> es
     )
  => VersionsRegistry
  -> Sdl3Env
  -> FilePath
  -- ^ Probe scratch directory.
  -> FilePath
  -> [HeaderResult]
  -> Eff es ([(Text, Text)], [AbiMacroConst], Map Text Aeson.Value)
planAliases registry env scratch specDir headerResults = do
  let registryPath = specDir </> "aliases.json"
  registryExists <- doesFileExist registryPath
  unless registryExists
    $ throwError_
      ( "alias registry not found: "
          <> T.pack registryPath
          <> " (the curated SDL3.Sys.* layer requires the checked-in"
          <> " classification registry; see lithon-codegen/sdl3/aliases.json)"
      )
  registryBytes <- LBS.fromStrict <$> EBS.readFile registryPath
  config <- liftEither $ first ("aliases.json: " <>) (decodeAliasConfig registryBytes)
  let families = [r.facts | r <- headerResults]
  validated <-
    liftEitherErrors "aliases.json"
      $ validateAliasConfig (functionCensus families) config

  (constantPlans, constantsBytes) <- planConstantGroups families
  let plansByFamily =
        Map.fromListWith
          (flip (<>))
          [(p.familyBase, [p]) | p <- constantPlans]
      macroSinces = (.since) <$> registry.macroConstants
      macroConsts =
        [ AbiMacroConst
            { name = m.cName
            , value = m.value
            , headerName = p.headerName
            , since = Map.lookup m.cName macroSinces
            }
        | p <- constantPlans
        , m <- p.members
        ]

  aliasModules <-
    liftEitherErrors "alias layer" $ planAliasLayer validated plansByFamily families
  let rewriteMap = aliasRewriteMap aliasModules
      rendered =
        map (renderAliasModule rewriteMap) aliasModules
          <> [renderRuntimeModule, renderUmbrella aliasModules]
  logInfo
    $ "alias layer planned"
    :# [ "modules" .= length rendered
       , "aliases" .= sum [length m.bindings | m <- aliasModules]
       , "constants" .= length macroConsts
       ]
  pure
    ( rendered
    , macroConsts
    , Map.fromList
        [ ("aliasNaming", Aeson.toJSON (namingRuleText validated.naming))
        , ("aliasConfig", Aeson.toJSON (digestText registryBytes))
        , ("constantsConfig", Aeson.toJSON (digestText constantsBytes))
        , ("constants", Aeson.toJSON (length macroConsts))
        ]
    )
 where
  liftEitherErrors heading =
    liftEither
      . first (\errs -> heading <> " failed:" <> display errs)
      . validationToEither

  -- Load constants.json, enumerate memberships against the resolved
  -- headers, evaluate every value and group sizeof in a probe TU compiled
  -- against those same headers, and validate the lot.
  planConstantGroups families = do
    let constantsPath = specDir </> "constants.json"
    constantsExists <- doesFileExist constantsPath
    unless constantsExists
      $ throwError_
        ( "constants registry not found: "
            <> T.pack constantsPath
            <> " (typed-constant groups are explicit curation; see"
            <> " lithon-codegen/sdl3/constants.json)"
        )
    constantsBytes <- LBS.fromStrict <$> EBS.readFile constantsPath
    constantsConfig <-
      liftEither (first ("constants.json: " <>) (Constants.decodeConstantsConfig constantsBytes))

    familyConstants <- forM families \fd -> do
      source <- decodeUtf8 <$> EBS.readFile (env.includeDir </> "SDL3" </> fd.headerName)
      pure
        Constants.FamilyConstants
          { familyBase = fd.familyBase
          , headerName = fd.headerName
          , headerMacros = Constants.scanObjectMacros source
          , newtypeConstrs = fd.newtypeConstrs
          , takenNames = fd.takenNames
          }

    -- Successful enumerations feed the probe; rule failures resurface
    -- identically (same pure inputs) from 'planConstants' below.
    let probeInputs =
          [ (typeName, names)
          | (typeName, cgroup) <- Map.toAscList constantsConfig.groups
          , fc : _ <-
              [[f | f <- familyConstants, Map.member typeName f.newtypeConstrs]]
          , Right names <-
              [validationToEither (Constants.enumerateMembers typeName cgroup fc.headerMacros)]
          ]
    (sizeofs, values) <- probeConstants probeInputs
    plans <-
      liftEitherErrors "constants.json"
        $ Constants.planConstants constantsConfig familyConstants sizeofs values
    pure (plans, constantsBytes)

  probeConstants probeInputs
    | null probeInputs = pure (Map.empty, Map.empty)
    | otherwise = do
        let probeC = scratch </> "lithon_constants_probe.c"
            probeBin = scratch </> "lithon_constants_probe"
        liftIO (TIO.writeFile probeC (Constants.renderProbeSource probeInputs))
        (ccExit, ccOut, ccErr) <-
          liftIO
            ( readProcessWithExitCode
                "cc"
                ["-std=c17", "-I", env.includeDir, probeC, "-o", probeBin]
                ""
            )
        case ccExit of
          ExitFailure code ->
            throwError_
              ( "constants probe: cc failed ("
                  <> T.show code
                  <> "): "
                  <> T.pack ccErr
                  <> T.pack ccOut
              )
          ExitSuccess -> pure ()
        (runExit, runOut, runErr) <- liftIO (readProcessWithExitCode probeBin [] "")
        case runExit of
          ExitFailure code ->
            throwError_
              ("constants probe: probe run failed (" <> T.show code <> "): " <> T.pack runErr)
          ExitSuccess -> pure ()
        liftEither (Constants.parseProbeOutput (T.pack runOut))

withScratch :: (IOE :> es) => (FilePath -> Eff es a) -> Eff es a
withScratch =
  EEx.bracket
    ( liftIO do
        tmp <- Dir.getTemporaryDirectory
        Temp.createTempDirectory tmp "lithon-sdl3-chain"
    )
    (liftIO . Dir.removePathForcibly)

-- | Resolve the environment, order the headers, and run the chain with
-- specs accumulating in the caller's scratch directory.
-- | Load the empirical availability registry — required, like
-- @aliases.json@: version gating without the empirical corrections would
-- silently trust SDL's lying @\\since@ annotations.
loadVersionsRegistry
  :: (Error Text :> es, FileSystem :> es) => FilePath -> Eff es VersionsRegistry
loadVersionsRegistry specDir = do
  let path = specDir </> "versions.json"
  exists <- doesFileExist path
  unless exists
    $ throwError_
      ( "version registry not found: "
          <> T.pack path
          <> " (the >= 3.2 floor requires the empirical availability"
          <> " registry; see lithon-codegen/sdl3/versions.json)"
      )
  bytes <- LBS.fromStrict <$> EBS.readFile path
  liftEither $ first ("versions.json: " <>) (decodeVersionsRegistry bytes)

runChain
  :: ( IOE :> es
     , Log :> es
     , Sdl3Gen :> es
     , Error Text :> es
     , FileSystem :> es
     )
  => VersionsRegistry -> FilePath -> FilePath -> Eff es (Sdl3Env, FilePath, [HeaderResult])
runChain registry scratch outDir = mapDynError @BindgenError display $ runError do
  env <- getSdl3Env
  -- libc headers reach libclang only via BINDGEN_EXTRA_CLANG_ARGS (the
  -- devshell's hs-bindgen hook populates it from the cc-wrapper's
  -- cc-cflags + libc-cflags); without it the chain dies on <string.h>.
  extraClangArgs <- liftIO (lookupEnv "BINDGEN_EXTRA_CLANG_ARGS")
  logInfo $ "sdl3 environment" :# ["env" .= env, "bindgenExtraClangArgs" .= isJust extraClangArgs]
  when (isNothing extraClangArgs)
    $ logWarn "BINDGEN_EXTRA_CLANG_ARGS is unset; libclang may fail to find libc headers."

  graph <- preflightGraph
  units <- planHeaders graph
  logInfo $ "planned headers" :# ["count" .= length units]

  overridesExists <- doesFileExist (outDir </> "overrides.yaml")
  overridesPath <-
    if overridesExists then do
      abs' <- liftIO (Dir.makeAbsolute (outDir </> "overrides.yaml"))
      logInfo $ "using prescriptive overrides" :# ["path" .= T.pack abs']
      pure (Just abs')
    else
      pure Nothing

  results <- chainHeaders scratch overridesPath registry units
  logInfo
    $ "chain complete"
    :# [ "headers" .= length results
       , "modules" .= sum [length r.modules | r <- results]
       ]
  pure (env, scratch, results)

data SpecTarget = SpecTarget
  { specDir :: FilePath
  , checkOnly :: Bool
  }

-- | Sync the freshly generated specs (and the manifest recording them)
-- into the artifact directory.
syncSpecs
  :: ( IOE :> es
     , Log :> es
     , Concurrent :> es
     , Error Text :> es
     , FileSystem :> es
     )
  => SpecTarget -> (Sdl3Env, FilePath, [HeaderResult]) -> Eff es ()
syncSpecs target (_env, scratch, results) = do
  specMap <-
    fmap Map.fromList . for results $ \r -> do
      bytes <- EBS.readFile (scratch </> r.unit.specFile)
      pure ("spec" </> r.unit.specFile, decodeUtf8 bytes)
  mapDynError @EmitError display
    . runError
    $ emitPackage
      ArtifactsOnly
      EmitTarget
        { outDir = target.specDir
        , manifestMeta = chainMeta (_env, scratch, results)
        , checkOnly = target.checkOnly
        }
      specMap

chainMeta :: (Sdl3Env, FilePath, [HeaderResult]) -> Map Text Aeson.Value
chainMeta (env, _, results) =
  Map.fromList
    [ ("sdlVersion", Aeson.toJSON env.sdlVersion)
    , ("headers", Aeson.toJSON (length results))
    ]
