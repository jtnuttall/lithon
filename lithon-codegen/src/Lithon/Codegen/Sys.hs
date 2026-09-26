{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | The per-target subcommand tree of hs-bindgen-driven @*-bindgen-sys@
-- generation (@lithon-codegen sdl3 …@), generic over the target record
-- ("Lithon.Codegen.Sys.Target").
--
-- @spec@ (steps 1–2 of the artifact flow) runs the per-header chain far
-- enough to produce every header's binding specification and syncs them
-- under @lithon-codegen\/data\/\<key\>\/spec\/@ — the committed,
-- reviewable record of the generated type surface, and the chaining medium
-- between header invocations. @generate@ additionally emits the package.
--
-- Curation lives in @lithon-codegen\/data\/\<key\>\/overrides.yaml@ and
-- the three registries beside it.
module Lithon.Codegen.Sys (
  SysError (..),
  SysCmd (..),
  sysCmdP,
  sysCommand,
  runSys,
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
import Lithon.Codegen.Bindgen (
  Bindgen,
  BindgenError,
  HeaderResult (..),
  HeaderUnit (..),
  chainHeaders,
  getScratchDirectory,
  planHeaders,
  preflightGraph,
  runBindgen,
 )
import Lithon.Codegen.Sys.Abi (AbiMacroConst (..))
import Lithon.Codegen.Sys.Abi.Validate (AbiProblem, LibraryRef (..), validateAbi)
import Lithon.Codegen.Sys.Alias (
  AliasModule (..),
  FamilyDecls (..),
  aliasRewriteMap,
  functionCensus,
  planAliasLayer,
  renderAliasModule,
  renderRuntimeModule,
  renderUmbrella,
 )
import Lithon.Codegen.Sys.Alias.Config (
  ValidatedAliasConfig (..),
  decodeAliasConfig,
  namingRuleText,
  validateAliasConfig,
 )
import Lithon.Codegen.Sys.Alias.Constants (
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
import Lithon.Codegen.Sys.Alias.Names (AliasError)
import Lithon.Codegen.Sys.Chain (
  SysPayload (..),
  bindgenOpts,
  headerPlan,
  sysVisitor,
  ungatedStubReturns,
 )
import Lithon.Codegen.Sys.Env (
  Registry (..),
  SysEnv (..),
  SysGen,
  SysPaths (..),
  SysResolutionError (TargetInvalid),
  getSysEnv,
  loadStatics,
  registryFile,
  runSysGen,
 )
import Lithon.Codegen.Sys.Package (SysPackagingError, assembleSysPackage)
import Lithon.Codegen.Sys.Target (
  SysTarget (..),
  VersionScheme (..),
  includeArg,
  registryDisplayPath,
  validateTarget,
 )
import Lithon.Codegen.Sys.Versions (
  Versioned (..),
  VersionsRegistry (..),
  decodeVersionsRegistry,
 )

data SysError
  = -- | The target's display name, and why its environment did not resolve.
    ResolutionFailed Text SysResolutionError
  | -- | Which registry, the file read, and the decoder's complaint.
    RegistryDecodeFailed Registry FilePath Text
  | AliasesFailed (Errors AliasError)
  | ConstantsFailed (Errors ConstantError)
  | ConstantsProbeUnparseable Text
  | ToolCallFailed Text (ProcessConfig () () ()) ProcessFailureCode ProcessStdout ProcessStderr
  | BindgenFailed BindgenError
  | EmitFailed EmitError
  | PackagingFailed SysPackagingError
  | -- | The versions registry to record the fixes in, and the problems.
    AbiValidationFailed FilePath (Errors AbiProblem)
  | -- | The versions registry, and the decls whose @stub-return@ no
    -- header's gate uses.
    StubReturnUngated FilePath [Text]
  deriving stock (Show)

instance From (Errors AliasError) SysError where
  from = AliasesFailed

instance From (Errors ConstantError) SysError where
  from = ConstantsFailed

instance From BindgenError SysError where
  from = BindgenFailed

instance From EmitError SysError where
  from = EmitFailed

-- TODO: Lower about half of these into aliases/constants modules
instance Display SysError where
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
    StubReturnUngated registry names ->
      "stub-return recorded in "
        <> from registry
        <> " for decls no header gates (their availability is at or below the baseline, or they"
        <> " are not bound functions); nothing was written. Remove it or correct the since:"
        <> foldMap (\name -> "\n  - " <> from name) names

data SysCmd
  = CmdSpec SpecOpts
  | CmdGenerate GenerateOpts

sysCmdP :: SysTarget -> Parser SysCmd
sysCmdP target =
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
sysCommand :: (SysTarget -> SysCmd -> a) -> SysTarget -> Mod CommandFields a
sysCommand wrap target =
  command
    (toString target.key)
    ( info
        (wrap target <$> sysCmdP target)
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

generateOptsP :: SysTarget -> Parser GenerateOpts
generateOptsP target = do
  out <- packageOutP (toString target.packageName)
  pure GenerateOpts{..}

runSys
  :: ( IOE :> es
     , Temporary :> es
     , Environment :> es
     , Concurrent :> es
     , Log :> es
     , Error SysError :> es
     , ClangEnv :> es
     , FileSystem :> es
     , Console :> es
     )
  => SysTarget -> Maybe ProjectRoot -> SysCmd -> Eff es ()
runSys target root cmd = runRethrow @SysResolutionError (ResolutionFailed target.displayName) do
  either (throwError . TargetInvalid target.key) pure (validateTarget target)
  runSysGen target do
    env <- getSysEnv
    runBindgen (bindgenOpts target env) case cmd of
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
            $ assembleSysPackage target statics env.libraryVersion aliasFiles macroConsts results
        manifestMeta <- chainMeta results
        runErrorFrom @EmitError @SysError
          $ emitHaskellPackage root opts.out (manifestMeta <> aliasMeta) tree

-- | Refuse to write (or @--check@) a layout whose growth story is
-- incomplete, or a registry @stub-return@ no gate uses: every struct is
-- checked so one run reports them all, and it runs before 'syncSpecs' so
-- a failing regeneration leaves the committed spec artifacts untouched.
validateChain
  :: (SysGen :> es, Error SysError :> es)
  => SysTarget -> VersionsRegistry -> [HeaderResult SysPayload] -> Eff es ()
validateChain target registry results = do
  env <- getSysEnv
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
  case ungatedStubReturns registry (map (.payload) results) of
    [] -> pass
    names -> throwError (StubReturnUngated library.registry names)

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
     , SysGen :> es
     , Bindgen :> es
     , Error SysError :> es
     , FileSystem :> es
     )
  => SysTarget
  -> VersionsRegistry
  -> [HeaderResult SysPayload]
  -> Eff es ([(Text, Text)], [AbiMacroConst], Map Text Aeson.Value)
planAliases target registry headerResults = do
  env <- getSysEnv
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
  :: (IOE :> es, SysGen :> es, Bindgen :> es, Error SysError :> es, FileSystem :> es)
  => SysTarget -> [FamilyDecls] -> Eff es ([ConstantGroupPlan], LByteString)
planConstantGroups target families = do
  env <- getSysEnv

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
  :: (IOE :> es, SysGen :> es, Bindgen :> es, Error SysError :> es)
  => SysTarget -> [(Text, [Text])] -> Eff es (Map Text Int, Map Text Integer)
probeConstants target probeInputs
  | null probeInputs = pure (mempty, mempty)
  | otherwise = do
      SystemTempDir scratch <- getScratchDirectory

      let probeC = scratch </> "lithon_constants_probe.c"
          probeBin = scratch </> "lithon_constants_probe"

      liftIO (TIO.writeFile probeC (renderProbeSource target probeInputs))

      env <- getSysEnv
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
  :: (SysGen :> es, Error SysError :> es, FileSystem :> es)
  => SysTarget -> Eff es VersionsRegistry
loadVersionsRegistry target = do
  env <- getSysEnv
  bytes <- LBS.fromStrict <$> EBS.readFile env.paths.versions
  liftEither
    . first (RegistryDecodeFailed VersionsJson env.paths.versions)
    $ decodeVersionsRegistry target.versioning.arity bytes

runChain
  :: ( HasCallStack
     , IOE :> es
     , Environment :> es
     , Log :> es
     , SysGen :> es
     , Bindgen :> es
     , Error SysError :> es
     )
  => SysTarget -> VersionsRegistry -> Eff es [HeaderResult SysPayload]
runChain target registry = runErrorFrom do
  env <- getSysEnv
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

  results <- chainHeaders (sysVisitor target registry) units
  logInfo
    $ "chain complete"
    :# [ "headers" .= length results
       , "modules" .= sum [length r.modules | r <- results]
       ]
  pure results

-- | Sync the freshly generated specs (and the manifest recording them)
-- into the artifact directory.
syncSpecs
  :: ( HasCallStack
     , IOE :> es
     , Log :> es
     , SysGen :> es
     , Concurrent :> es
     , Error SysError :> es
     , FileSystem :> es
     , Console :> es
     , Bindgen :> es
     )
  => GuardCtx -> EmitEffect -> [HeaderResult SysPayload] -> Eff es ()
syncSpecs ctx effect results = do
  env <- getSysEnv
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
chainMeta :: (SysGen :> es) => [HeaderResult SysPayload] -> Eff es (Map Text Aeson.Value)
chainMeta results = do
  env <- getSysEnv
  pure
    $ Map.fromList
      [ ("libraryVersion", Aeson.toJSON env.libraryVersion)
      , ("headers", Aeson.toJSON (length results))
      ]
