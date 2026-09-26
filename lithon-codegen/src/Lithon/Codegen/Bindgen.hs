{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | The @lithon-codegen \<key\>@ subcommands (@sdl3@, @mpv@, …): generating
-- a @*-bindgen-sys@ package from one C library's headers, driven by the
-- library's 'BindgenTarget'.
--
-- @spec@ runs hs-bindgen over every public header and syncs the resulting
-- binding specifications into @lithon-codegen\/data\/\<key\>\/spec\/@. Each
-- header's invocation consumes the specs of the headers it includes, so the
-- committed specs are both the reviewable record of the generated type
-- surface and the chaining medium between invocations.
--
-- @generate@ does the same, then plans the curated alias layer and emits
-- the package.
--
-- Curation inputs live beside the specs: @overrides.yaml@ (the prescriptive
-- hs-bindgen spec), @aliases.json@, @constants.json@, and @versions.json@.
module Lithon.Codegen.Bindgen (
  BindgenError (..),
  BindgenCmd (..),
  bindgenCmdP,
  bindgenCommand,
  runBindgen,

  -- * The per-header visitor
  bindgenVisitor,
) where

import Data.Aeson qualified as Aeson
import Data.ByteString.Lazy qualified as LBS
import Data.Conduit.Process.Typed (ProcessConfig)
import Data.Hash.RapidHash
import Data.Map.Strict qualified as Map
import Data.Text.IO qualified as TIO
import Effectful (Eff, IOE, (:>))
import Effectful.Concurrent.Async (Concurrent)
import Effectful.Console.ByteString (Console)
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

import Lithon.Codegen.Backend.Emit (
  EmitEffect (..),
  EmitError,
  EmitGuard (..),
  EmitStrategy (..),
  EmitTarget (..),
  GuardCtx,
  emitEffectOptP,
  emitPackage,
 )
import Lithon.Codegen.Backend.Package.Emit (
  PackageOut (..),
  ProjectRoot,
  assumeYesP,
  emitHaskellPackage,
  guardCtx,
  packageOutP,
 )
import Lithon.Codegen.Bindgen.Abi (AbiMacroConst (..))
import Lithon.Codegen.Bindgen.Abi.Validate (AbiProblem, LibraryRef (..), validateAbi)
import Lithon.Codegen.Bindgen.Alias (
  AliasModule (..),
  FamilyDecls (..),
  aliasRewriteMap,
  functionCensus,
  planAliasLayer,
  renderAliasModule,
  renderRuntimeModule,
  renderUmbrella,
 )
import Lithon.Codegen.Bindgen.Alias.Config (
  ValidatedAliasConfig (..),
  decodeAliasConfig,
  namingRuleText,
  validateAliasConfig,
 )
import Lithon.Codegen.Bindgen.Alias.Constants (
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
import Lithon.Codegen.Bindgen.Alias.Names (AliasError)
import Lithon.Codegen.Bindgen.Driver (
  Driver,
  DriverError,
  HeaderResult (..),
  HeaderUnit (..),
  Visitor (..),
  chainHeaders,
  getScratchDirectory,
  planHeaders,
  preflightGraph,
  runDriver,
 )
import Lithon.Codegen.Bindgen.Env (
  BindgenEnv (..),
  BindgenGen,
  BindgenPaths (..),
  BindgenResolutionError (TargetInvalid),
  Registry (..),
  driverOpts,
  getBindgenEnv,
  loadStatics,
  registryFile,
  runBindgenGen,
 )
import Lithon.Codegen.Bindgen.Package (BindgenPackagingError, assembleBindgenPackage)
import Lithon.Codegen.Bindgen.Payload (BindgenPayload (..), distillPayload)
import Lithon.Codegen.Bindgen.Target (
  BindgenTarget (..),
  VersionScheme (..),
  headerPlan,
  includeArg,
  registryDisplayPath,
  validateTarget,
 )
import Lithon.Codegen.Bindgen.Versions (
  Versioned (..),
  VersionsRegistry (..),
  decodeVersionsRegistry,
 )
import Lithon.Codegen.Bindgen.Versions.Guards (
  UnusedStubReturn (..),
  retypePrologue,
  unusedStubReturns,
  versionGates,
 )

data BindgenError
  = -- | The target's display name, and why its environment did not resolve.
    ResolutionFailed Text BindgenResolutionError
  | -- | Which registry, the file read, and the decoder's complaint.
    RegistryDecodeFailed Registry FilePath Text
  | AliasesFailed (Errors AliasError)
  | ConstantsFailed (Errors ConstantError)
  | ConstantsProbeUnparseable Text
  | ToolCallFailed Text (ProcessConfig () () ()) ProcessFailureCode ProcessStdout ProcessStderr
  | BindgenFailed DriverError
  | EmitFailed EmitError
  | PackagingFailed BindgenPackagingError
  | -- | The versions registry to record the fixes in, and the problems.
    AbiValidationFailed FilePath (Errors AbiProblem)
  | -- | The versions registry, and the decls whose @stub-return@ no
    -- gated stub returns (and why).
    StubReturnUnused FilePath [(Text, UnusedStubReturn)]
  deriving stock (Show)

instance From (Errors AliasError) BindgenError where
  from = AliasesFailed

instance From (Errors ConstantError) BindgenError where
  from = ConstantsFailed

instance From DriverError BindgenError where
  from = BindgenFailed

instance From EmitError BindgenError where
  from = EmitFailed

-- TODO: Lower about half of these into aliases/constants modules
instance Display BindgenError where
  displayBuilder = \case
    ResolutionFailed name err -> "Failed to resolve the " <> from name <> " environment: " <> from err
    RegistryDecodeFailed registry path err ->
      "Failed to decode the " <> displayBuilder registry <> " registry " <> from path <> ": " <> from err
    AliasesFailed errs -> "Aliases failed: " <> from errs
    ConstantsProbeUnparseable err -> "Failed to parse constants probe output: " <> from err
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
    ConstantsFailed err -> "Constants failed: " <> from err
    BindgenFailed err -> "Failed while invoking hs-bindgen: " <> from err
    EmitFailed err -> "Failed to emit library: " <> from err
    PackagingFailed err -> "Failed to emit library package: " <> from err
    AbiValidationFailed registry errs ->
      "ABI validation failed; nothing was written. Record the availability in "
        <> from registry
        <> " and rerun:\n\n"
        <> intercalateTB "\n\n" (map displayBuilder (toList errs))
    StubReturnUnused registry unused ->
      "unused stub-return in "
        <> from registry
        <> " (no gated stub returns it); nothing was written:"
        <> foldMap (\(name, why) -> "\n  - " <> from name <> ": " <> unusedStubReturn why) unused
   where
    unusedStubReturn = \case
      NotGated ->
        "no header gates it (its availability is at or below the baseline, or it is not a bound"
          <> " function); remove the stub-return or correct the since"
      ReturnsVoid -> "the function returns void, so its stub returns nothing; remove the stub-return"

data BindgenCmd
  = CmdSpec SpecOpts
  | CmdGenerate GenerateOpts

bindgenCmdP :: BindgenTarget -> Parser BindgenCmd
bindgenCmdP target =
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
              (CmdGenerate <$> generateOptsP target)
              ( progDesc
                  ( "Run the chain and emit the "
                      <> toString target.packageName
                      <> " package + spec artifacts (step 3)"
                  )
              )
          )
    )

-- | The target's subcommand (@lithon-codegen \<key\> spec|generate@).
bindgenCommand :: (BindgenTarget -> BindgenCmd -> a) -> BindgenTarget -> Mod CommandFields a
bindgenCommand wrap target =
  command
    (toString target.key)
    ( info
        (wrap target <$> bindgenCmdP target)
        (progDesc (toString target.displayName <> " binding generation via hs-bindgen: spec / generate"))
    )

data SpecOpts = SpecOpts
  { emitEffect :: EmitEffect
  , assumeYes :: Bool
  }

specOptsP :: Parser SpecOpts
specOptsP = do
  emitEffect <- emitEffectOptP
  assumeYes <- assumeYesP
  pure SpecOpts{..}

newtype GenerateOpts = GenerateOpts
  { out :: PackageOut
  }

generateOptsP :: BindgenTarget -> Parser GenerateOpts
generateOptsP target = do
  out <- packageOutP (toString target.packageName)
  pure GenerateOpts{..}

runBindgen
  :: ( IOE :> es
     , Temporary :> es
     , Environment :> es
     , Concurrent :> es
     , Log :> es
     , Error BindgenError :> es
     , ClangEnv :> es
     , FileSystem :> es
     , Console :> es
     )
  => BindgenTarget -> Maybe ProjectRoot -> BindgenCmd -> Eff es ()
runBindgen target root cmd = runRethrow @BindgenResolutionError (ResolutionFailed target.displayName) do
  either (throwError . TargetInvalid target.key) pure (validateTarget target)
  runBindgenGen target do
    env <- getBindgenEnv
    runDriver (driverOpts target env) case cmd of
      CmdSpec opts -> do
        registry <- loadVersionsRegistry target
        results <- runChain target registry
        validateChain target registry results
        syncSpecs (guardCtx root opts.assumeYes) opts.emitEffect results
      CmdGenerate opts -> do
        -- Before the chain: a missing README should not cost a full run.
        statics <- loadStatics target env
        registry <- loadVersionsRegistry target
        results <- runChain target registry
        validateChain target registry results
        -- Specs and package come from the same chain run, so they can never
        -- skew; both emits respect --check.
        syncSpecs (guardCtx root opts.out.assumeYes) opts.out.emitEffect results
        (aliasFiles, macroConsts, aliasMeta) <-
          planAliases target registry results
        tree <-
          liftEither
            . first PackagingFailed
            $ assembleBindgenPackage target statics env.libraryVersion aliasFiles macroConsts results
        manifestMeta <- chainMeta results
        runErrorFrom @EmitError @BindgenError
          $ emitHaskellPackage root opts.out (manifestMeta <> aliasMeta) tree

-- | Refuse to write (or @--check@) a layout whose growth story is
-- incomplete, or a registry @stub-return@ no gate uses: every struct is
-- checked so one run reports them all, and it runs before 'syncSpecs' so
-- a failing regeneration leaves the committed spec artifacts untouched.
validateChain
  :: (BindgenGen :> es, Error BindgenError :> es)
  => BindgenTarget -> VersionsRegistry -> [HeaderResult BindgenPayload] -> Eff es ()
validateChain target registry results = do
  env <- getBindgenEnv
  let library =
        LibraryRef
          { label = target.versionLabel
          , version = env.libraryVersion
          , registry = registryDisplayPath target (registryFile VersionsJson)
          }
  liftEither
    . first (AbiValidationFailed library.registry)
    . validationToEither
    $ validateAbi target.versioning.baseline library (concatMap (.payload.abi) results)
  case unusedStubReturns registry (concatMap (.payload.gated) results) of
    [] -> pass
    unused -> throwError (StubReturnUnused library.registry unused)

-- | Load, validate, plan, and render the target's curated layer.
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
     , BindgenGen :> es
     , Driver :> es
     , Error BindgenError :> es
     , FileSystem :> es
     )
  => BindgenTarget
  -> VersionsRegistry
  -> [HeaderResult BindgenPayload]
  -> Eff es ([(Text, Text)], [AbiMacroConst], Map Text Aeson.Value)
planAliases target registry headerResults = do
  env <- getBindgenEnv
  let families = map (.payload.facts) headerResults

  registryBytes <- LBS.fromStrict <$> EBS.readFile env.paths.aliases
  config <-
    liftEither
      . first (RegistryDecodeFailed AliasesJson env.paths.aliases)
      $ decodeAliasConfig registryBytes
  validated <-
    liftEither
      . first from
      $ validateAliasConfig (functionCensus families) config

  (constantPlans, constantsBytes) <- planConstantGroups target families
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

  aliasModules <- liftEither . first from $ planAliasLayer target validated plansByFamily families
  let rewriteMap = aliasRewriteMap aliasModules
      rendered =
        map (renderAliasModule target rewriteMap) aliasModules
          <> [renderRuntimeModule target, renderUmbrella target aliasModules]
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
        , ("aliasConfig", Aeson.toJSON (rapidhash (LBS.toStrict registryBytes)))
        , ("constantsConfig", Aeson.toJSON (rapidhash (LBS.toStrict constantsBytes)))
        , ("constants", Aeson.toJSON (length macroConsts))
        ]
    )

-- |
-- Load constants.json, enumerate memberships against the resolved
-- headers, evaluate every value and group sizeof in a probe TU compiled
-- against those same headers, and validate the lot.
planConstantGroups
  :: (IOE :> es, BindgenGen :> es, Driver :> es, Error BindgenError :> es, FileSystem :> es)
  => BindgenTarget -> [FamilyDecls] -> Eff es ([ConstantGroupPlan], LByteString)
planConstantGroups target families = do
  env <- getBindgenEnv

  constantsBytes <- LBS.fromStrict <$> EBS.readFile env.paths.constants
  constantsConfig <-
    liftEither
      . first (RegistryDecodeFailed ConstantsJson env.paths.constants)
      $ decodeConstantsConfig constantsBytes

  familyConstants <- forM families \fd -> do
    source <- decodeUtf8 <$> EBS.readFile (env.includeDir </> includeArg target fd.headerName)
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

  (sizeofs, values) <- probeConstants target probeInputs
  plans <-
    liftEither
      . first from
      $ planConstants constantsConfig familyConstants sizeofs values
  pure (plans, constantsBytes)

probeConstants
  :: (IOE :> es, BindgenGen :> es, Driver :> es, Error BindgenError :> es)
  => BindgenTarget -> [(Text, [Text])] -> Eff es (Map Text Int, Map Text Integer)
probeConstants target probeInputs
  | null probeInputs = pure (mempty, mempty)
  | otherwise = do
      SystemTempDir scratch <- getScratchDirectory

      let probeC = scratch </> "lithon_constants_probe.c"
          probeBin = scratch </> "lithon_constants_probe"

      liftIO (TIO.writeFile probeC (renderProbeSource target probeInputs))

      env <- getBindgenEnv
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

      liftEither . first ConstantsProbeUnparseable $ parseProbeOutput runOut

loadVersionsRegistry
  :: (BindgenGen :> es, Error BindgenError :> es, FileSystem :> es)
  => BindgenTarget -> Eff es VersionsRegistry
loadVersionsRegistry target = do
  env <- getBindgenEnv
  bytes <- LBS.fromStrict <$> EBS.readFile env.paths.versions
  liftEither
    . first (RegistryDecodeFailed VersionsJson env.paths.versions)
    $ decodeVersionsRegistry target.versioning.arity bytes

runChain
  :: ( HasCallStack
     , IOE :> es
     , Environment :> es
     , Log :> es
     , BindgenGen :> es
     , Driver :> es
     , Error BindgenError :> es
     )
  => BindgenTarget -> VersionsRegistry -> Eff es [HeaderResult BindgenPayload]
runChain target registry = runErrorFrom do
  env <- getBindgenEnv
  -- libc headers reach libclang only via BINDGEN_EXTRA_CLANG_ARGS (the
  -- devshell's hs-bindgen hook populates it from the cc-wrapper's
  -- cc-cflags + libc-cflags); without it the chain dies on <string.h>.
  extraClangArgs <- lookupEnv "BINDGEN_EXTRA_CLANG_ARGS"
  logInfo
    $ "environment"
    :# ["target" .= target.key, "env" .= env, "bindgenExtraClangArgs" .= isJust extraClangArgs]
  when (isNothing extraClangArgs)
    $ logWarn "BINDGEN_EXTRA_CLANG_ARGS is unset; libclang may fail to find libc headers."

  let plan = headerPlan target
  graph <- preflightGraph plan
  units <- planHeaders plan graph
  logInfo $ "planned headers" :# ["count" .= length units]

  results <- chainHeaders (bindgenVisitor target registry) units
  logInfo
    $ "chain complete"
    :# [ "headers" .= length results
       , "modules" .= sum [length r.modules | r <- results]
       ]
  pure results

-- | The target's visitor: its shims, the retype prologue, and the version
-- gates, in that order ("Lithon.Codegen.Bindgen.Versions.Guards"), then
-- the payload distillation ("Lithon.Codegen.Bindgen.Payload"). The gate
-- tests drive it header by header.
bindgenVisitor :: BindgenTarget -> VersionsRegistry -> Visitor BindgenPayload
bindgenVisitor target registry =
  Visitor
    { passes = target.shims <> retypePrologue target registry <> versionGates target registry
    , finalize = distillPayload target registry
    }

-- | Sync the freshly generated specs (and the manifest recording them)
-- into the artifact directory.
syncSpecs
  :: ( HasCallStack
     , IOE :> es
     , Log :> es
     , BindgenGen :> es
     , Concurrent :> es
     , Error BindgenError :> es
     , FileSystem :> es
     , Console :> es
     , Driver :> es
     )
  => GuardCtx -> EmitEffect -> [HeaderResult BindgenPayload] -> Eff es ()
syncSpecs ctx effect results = do
  env <- getBindgenEnv
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
        { outDir = env.paths.dataDir
        , guard = Guarded ctx
        , ..
        }
      specMap

-- | What every target's manifests record about the chain run.
chainMeta :: (BindgenGen :> es) => [HeaderResult BindgenPayload] -> Eff es (Map Text Aeson.Value)
chainMeta results = do
  env <- getBindgenEnv
  pure
    $ Map.fromList
      [ ("libraryVersion", Aeson.toJSON env.libraryVersion)
      , ("headers", Aeson.toJSON (length results))
      ]
