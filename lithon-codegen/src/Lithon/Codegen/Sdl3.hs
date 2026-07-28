{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
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
  Sdl3Error (..),
  Sdl3Cmd (..),
  sdl3CmdP,
  runSdl3,
) where

import Data.Aeson qualified as Aeson
import Data.ByteString.Lazy qualified as LBS
import Data.Conduit.Process.Typed (ProcessConfig)
import Data.Map.Strict qualified as Map
import Data.Text.IO qualified as TIO
import Effectful (Eff, IOE, (:>))
import Effectful.Concurrent.Async (Concurrent)
import Effectful.Environment
import Effectful.FileSystem.IO.ByteString qualified as EBS
import Lithon.Effect.ClangEnv (ClangEnv)
import Lithon.Effect.Error
import Lithon.Effect.FileSystem
import Lithon.Effect.Log
import Lithon.Effect.Temporary
import Lithon.Prelude
import Options.Applicative hiding (ParseError, asum)
import System.FilePath ((</>))

import Lithon.Codegen.Backend.Emit (EmitError, EmitStrategy (..), EmitTarget (..), emitPackage)
import Lithon.Codegen.Backend.Json (digestText)
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
import Lithon.Codegen.Sdl3.Alias.Constants (
  ConstantError,
  ConstantGroupPlan (..),
  ConstantMember (..),
  ConstantsConfig (..),
  FamilyConstants (..),
  decodeConstantsConfig,
  enumerateMembers,
  parseProbeOutput,
  planConstants,
  renderProbeSource,
  scanObjectMacros,
 )
import Lithon.Codegen.Sdl3.Alias.Names (AliasError)
import Lithon.Codegen.Sdl3.Bindgen (
  BindgenError,
  HeaderResult (..),
  HeaderUnit (..),
  chainHeaders,
  planHeaders,
  preflightGraph,
 )
import Lithon.Codegen.Sdl3.Env (
  Sdl3Env (..),
  Sdl3Gen,
  SdlResolutionError,
  getScratchDirectory,
  getSdl3Env,
  runSdl3Gen,
 )
import Lithon.Codegen.Sdl3.Package (assemblePackage)
import Lithon.Codegen.Sdl3.Versions (
  Versioned (..),
  VersionsRegistry (..),
  decodeVersionsRegistry,
 )

data Sdl3Error
  = SdlResolutionError SdlResolutionError
  | VersionsRegistryMissing FilePath
  | VersionsRegistryDecodeError Text
  | AliasesRegistryMissing FilePath
  | AliasesRegistryDecodeError Text
  | AliasesError (Errors AliasError)
  | ConstantsRegistryMissing FilePath
  | ConstantsRegistryParseError Text
  | ConstantsProbeParseError Text
  | ConstantsError (Errors ConstantError)
  | ToolCallFailed Text (ProcessConfig () () ()) ProcessFailureCode ProcessStdout ProcessStderr
  | BindgenError BindgenError
  | EmitError EmitError
  | PackagingError Text
  deriving stock (Show)

instance From (Errors AliasError) Sdl3Error where
  from = AliasesError

instance From (Errors ConstantError) Sdl3Error where
  from = ConstantsError

instance From SdlResolutionError Sdl3Error where
  from = SdlResolutionError

instance From BindgenError Sdl3Error where
  from = BindgenError

instance From EmitError Sdl3Error where
  from = EmitError

-- TODO: Lower about half of these into aliases/constants modules
instance Display Sdl3Error where
  displayBuilder = \case
    SdlResolutionError err -> "Failed to resolve the SDL3 environment: " <> from err
    VersionsRegistryMissing path -> "Version registry not found: " <> from path
    VersionsRegistryDecodeError err -> "Failed to decode version registry: " <> from err
    AliasesRegistryMissing path -> "Alias registry not found: " <> from path
    AliasesRegistryDecodeError err -> "Failed to decode alias registry: " <> from err
    AliasesError errs -> "Aliases failed: " <> from errs
    ConstantsRegistryMissing path -> "Constants registry not found: " <> from path
    ConstantsRegistryParseError err -> "Failed to parse constants registry: " <> from err
    ConstantsProbeParseError err -> "Failed to parse constants probe output: " <> from err
    ToolCallFailed tag cfg (ProcessFailureCode code) (ProcessStdout out) (ProcessStderr err) ->
      let coded = show code
          cmd = show cfg
          errd = toText err
       in from
            [trimmingQQ|
              $tag: $cmd failed with exit code $coded

              Stdout:
                $out

              Stderr:
                $errd
              |]
    ConstantsError err -> "Constants failed: " <> from err
    BindgenError err -> "Failed while invoking hs-bindgen: " <> from err
    EmitError err -> "Failed to emit library: " <> from err
    PackagingError err -> "Failed to emit library package: " <> from err

data Sdl3Cmd
  = CmdSpec SpecOpts
  | CmdGenerate GenerateOpts

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

data SpecOpts = SpecOpts
  { specDir :: FilePath
  , checkOnly :: Bool
  }

specOptsP :: Parser SpecOpts
specOptsP = do
  specDir <- specDirP
  checkOnly <- checkP
  pure SpecOpts{..}

data GenerateOpts = GenerateOpts
  { specDir :: FilePath
  , outDir :: FilePath
  , checkOnly :: Bool
  }

generateOptsP :: Parser GenerateOpts
generateOptsP = do
  specDir <- specDirP
  outDir <-
    strOption
      ( long "out"
          <> metavar "DIR"
          <> value "sdl3-bindgen-sys"
          <> showDefault
          <> help "Target package directory"
      )
  checkOnly <- checkP
  pure GenerateOpts{..}

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

runSdl3
  :: ( IOE :> es
     , Temporary :> es
     , Environment :> es
     , Concurrent :> es
     , Log :> es
     , Error Sdl3Error :> es
     , ClangEnv :> es
     , FileSystem :> es
     )
  => Sdl3Cmd -> Eff es ()
runSdl3 cmd = runErrorFrom @SdlResolutionError $ runSdl3Gen case cmd of
  CmdSpec opts -> do
    registry <- loadVersionsRegistry opts.specDir
    results <- runChain registry opts.specDir
    syncSpecs SpecTarget{specDir = opts.specDir, checkOnly = opts.checkOnly} results
  CmdGenerate opts -> do
    registry <- loadVersionsRegistry opts.specDir
    results <- runChain registry opts.specDir
    -- Specs and package come from the same chain run, so they can never
    -- skew; both emits respect --check.
    syncSpecs SpecTarget{specDir = opts.specDir, checkOnly = opts.checkOnly} results
    (aliasFiles, macroConsts, aliasMeta) <-
      planAliases registry opts.specDir results
    packageFiles <-
      liftEither . first PackagingError =<< liftIO (assemblePackage aliasFiles macroConsts results)
    manifestMeta <- chainMeta results
    runErrorFrom @EmitError @Sdl3Error
      $ emitPackage
        HaskellPackage
        EmitTarget
          { outDir = opts.outDir
          , manifestMeta = manifestMeta <> aliasMeta
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
  :: ( HasCallStack
     , IOE :> es
     , Log :> es
     , Sdl3Gen :> es
     , Error Sdl3Error :> es
     , FileSystem :> es
     )
  => VersionsRegistry
  -> FilePath
  -> [HeaderResult]
  -> Eff es ([(Text, Text)], [AbiMacroConst], Map Text Aeson.Value)
planAliases registry specDir headerResults = do
  let registryPath = specDir </> "aliases.json"
      families = map (.facts) headerResults
  assertFileExists registryPath AliasesRegistryMissing

  registryBytes <- LBS.fromStrict <$> EBS.readFile registryPath
  config <- liftEither . first AliasesRegistryDecodeError $ decodeAliasConfig registryBytes
  validated <-
    liftEither
      . first from
      $ validateAliasConfig (functionCensus families) config

  (constantPlans, constantsBytes) <- planConstantGroups specDir families
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

  aliasModules <- liftEither . first from $ planAliasLayer validated plansByFamily families
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

-- |
-- Load constants.json, enumerate memberships against the resolved
-- headers, evaluate every value and group sizeof in a probe TU compiled
-- against those same headers, and validate the lot.
planConstantGroups
  :: (IOE :> es, Sdl3Gen :> es, Error Sdl3Error :> es, FileSystem :> es)
  => FilePath -> [FamilyDecls] -> Eff es ([ConstantGroupPlan], LByteString)
planConstantGroups specDir families = do
  env <- getSdl3Env
  let constantsPath = specDir </> "constants.json"
  assertFileExists constantsPath ConstantsRegistryMissing

  constantsBytes <- LBS.fromStrict <$> EBS.readFile constantsPath
  constantsConfig <-
    liftEither . first ConstantsRegistryParseError $ decodeConstantsConfig constantsBytes

  familyConstants <- forM families \fd -> do
    source <- decodeUtf8 <$> EBS.readFile (env.includeDir </> "SDL3" </> fd.headerName)
    pure
      FamilyConstants
        { familyBase = fd.familyBase
        , headerName = fd.headerName
        , headerMacros = scanObjectMacros source
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
            [validationToEither (enumerateMembers typeName cgroup fc.headerMacros)]
        ]

  (sizeofs, values) <- probeConstants probeInputs
  plans <-
    liftEither
      . first from
      $ planConstants constantsConfig familyConstants sizeofs values
  pure (plans, constantsBytes)

probeConstants
  :: (IOE :> es, Sdl3Gen :> es, Error Sdl3Error :> es)
  => [(Text, [Text])] -> Eff es (Map Text Int, Map Text Integer)
probeConstants probeInputs
  | null probeInputs = pure (mempty, mempty)
  | otherwise = do
      SystemTempDir scratch <- getScratchDirectory

      let probeC = scratch </> "lithon_constants_probe.c"
          probeBin = scratch </> "lithon_constants_probe"

      liftIO (TIO.writeFile probeC (renderProbeSource probeInputs))

      env <- getSdl3Env
      _ <-
        readProcessStdoutOrError
          (ToolCallFailed $ "Compiling " <> from probeC)
          "cc"
          ["-std=c17", "-I", from env.includeDir, from probeC, "-o", from probeBin]

      runOut <-
        readProcessStdoutOrError
          (ToolCallFailed $ "Running " <> from probeBin)
          (from probeBin)
          []

      liftEither . first ConstantsProbeParseError $ parseProbeOutput runOut

-- | Resolve the environment, order the headers, and run the chain with
-- specs accumulating in the caller's scratch directory.
-- | Load the empirical availability registry — required, like
-- @aliases.json@: version gating without the empirical corrections would
-- silently trust SDL's lying @\\since@ annotations.
loadVersionsRegistry
  :: (HasCallStack, Error Sdl3Error :> es, FileSystem :> es) => FilePath -> Eff es VersionsRegistry
loadVersionsRegistry specDir = do
  let path = specDir </> "versions.json"
  assertFileExists path VersionsRegistryMissing
  bytes <- LBS.fromStrict <$> EBS.readFile path
  liftEither $ first VersionsRegistryDecodeError (decodeVersionsRegistry bytes)

runChain
  :: ( HasCallStack
     , IOE :> es
     , Environment :> es
     , Log :> es
     , Sdl3Gen :> es
     , Error Sdl3Error :> es
     , FileSystem :> es
     )
  => VersionsRegistry -> FilePath -> Eff es [HeaderResult]
runChain registry outDir = runErrorFrom do
  env <- getSdl3Env
  -- libc headers reach libclang only via BINDGEN_EXTRA_CLANG_ARGS (the
  -- devshell's hs-bindgen hook populates it from the cc-wrapper's
  -- cc-cflags + libc-cflags); without it the chain dies on <string.h>.
  extraClangArgs <- lookupEnv "BINDGEN_EXTRA_CLANG_ARGS"
  logInfo $ "sdl3 environment" :# ["env" .= env, "bindgenExtraClangArgs" .= isJust extraClangArgs]
  when (isNothing extraClangArgs)
    $ logWarn "BINDGEN_EXTRA_CLANG_ARGS is unset; libclang may fail to find libc headers."

  graph <- preflightGraph
  units <- planHeaders graph
  logInfo $ "planned headers" :# ["count" .= length units]

  overridesPath <- do
    path <- makeAbsolute (outDir </> "overrides.yaml")
    logInfo $ "using prescriptive overrides" :# ["path" .= path]
    bool Nothing (Just path) <$> doesFileExist path

  results <- chainHeaders overridesPath registry units
  logInfo
    $ "chain complete"
    :# [ "headers" .= length results
       , "modules" .= sum [length r.modules | r <- results]
       ]
  pure results

data SpecTarget = SpecTarget
  { specDir :: FilePath
  , checkOnly :: Bool
  }

-- | Sync the freshly generated specs (and the manifest recording them)
-- into the artifact directory.
syncSpecs
  :: ( HasCallStack
     , IOE :> es
     , Log :> es
     , Sdl3Gen :> es
     , Concurrent :> es
     , Error Sdl3Error :> es
     , FileSystem :> es
     )
  => SpecTarget -> [HeaderResult] -> Eff es ()
syncSpecs target results = do
  SystemTempDir scratch <- getScratchDirectory
  specMap <-
    fmap Map.fromList . for results $ \r -> do
      bytes <- EBS.readFile (scratch </> r.unit.specFile)
      pure ("spec" </> r.unit.specFile, decodeUtf8 bytes)
  manifestMeta <- chainMeta results
  runErrorFrom
    $ emitPackage
      ArtifactsOnly
      EmitTarget
        { outDir = target.specDir
        , checkOnly = target.checkOnly
        , ..
        }
      specMap

chainMeta :: (Sdl3Gen :> es) => [HeaderResult] -> Eff es (Map Text Aeson.Value)
chainMeta results = do
  env <- getSdl3Env
  pure
    $ Map.fromList
      [ ("sdlVersion", Aeson.toJSON env.sdlVersion)
      , ("headers", Aeson.toJSON (length results))
      ]
