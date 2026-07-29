{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | The @vulkan@ subcommand tree: the registry pipeline.
--
-- @check@ is the CI gate: parse the registry strictly, print every
-- diagnostic, exit non-zero on any error. @parse@ additionally dumps the IR
-- (canonical JSON), a summary table, or single named entities. @generate@
-- emits the @lithon@ package through "Lithon.Codegen.Backend.Emit".
module Lithon.Codegen.Vulkan (
  VulkanCmd (..),
  vulkanCmdP,
  runVulkan,
) where

import Data.Aeson qualified as Aeson
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Vector qualified as V
import Effectful (Eff, IOE, (:>))
import Effectful.Concurrent.Async (Concurrent)
import Effectful.Console.ByteString qualified as Console
import Effectful.Console.ByteString.Lazy (Console)
import Effectful.Console.ByteString.Lazy qualified as LazyConsole
import Effectful.FileSystem.IO.ByteString.Lazy qualified as ELBS
import Effectful.Resource (Resource)
import Lithon.Effect.Clock (Clock, logTimedNF)
import Lithon.Effect.Error
import Lithon.Effect.FileSystem (
  FileSystem,
  createDirectoryIfMissing,
 )
import Lithon.Effect.Log
import Lithon.Effect.PrettyPrint
import Lithon.Prelude
import Options.Applicative (
  command,
  help,
  hsubparser,
  info,
  long,
  metavar,
  progDesc,
  showDefault,
  strOption,
  switch,
  value,
 )
import Options.Applicative qualified as Opts
import System.FilePath (takeDirectory)

import Lithon.Codegen.Backend.Emit (
  EmitEffect,
  EmitError,
  EmitStrategy (HaskellPackage),
  EmitTarget (..),
  emitEffectOptP,
  emitPackage,
 )
import Lithon.Codegen.Backend.Json (canonicalJsonBytes)
import Lithon.Codegen.Vulkan.Curate (Curated (..), curate)
import Lithon.Codegen.Vulkan.Curate.Closure (CurateError, explainName)
import Lithon.Codegen.Vulkan.Curate.Profile (Profile (..), ProfileDecodeError, decodeProfile)
import Lithon.Codegen.Vulkan.Curate.Report (CurationReport (..), prettyReport)
import Lithon.Codegen.Vulkan.Env (
  VulkanGen,
  VulkanResolutionError,
  getVulkanXmlPath,
  runVulkanGen,
 )
import Lithon.Codegen.Vulkan.Generate (GenOutput (..), GenerateError, generate)
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry (
  ParseFailure (..),
  ParseSuccess (..),
  Registry (..),
  parseRegistry,
 )
import Lithon.Codegen.Vulkan.Registry.Summary (prettySummary, summarize)
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (Declaration (..))
import Lithon.Codegen.Vulkan.Registry.Types.Commands (
  Command (..),
  CommandDefinition (..),
  ProtoDecl (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Common (Api (..))
import Lithon.Codegen.Vulkan.Registry.Types.Core (TypeDecl (..), typeBodyName)
import Lithon.Codegen.Vulkan.Registry.Types.Enums (EnumsBlock (..))
import Lithon.Codegen.Vulkan.Registry.Types.Features (Extension (..), Feature (..))
import Lithon.Codegen.Vulkan.Registry.Types.Misc (Format (..))
import Lithon.Codegen.Vulkan.Resolve (ResolveError, resolveRegistry)
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedFeature (..), ResolvedRegistry (..))
import Lithon.Codegen.Vulkan.Resolved.Summary (prettyResolvedSummary, summarizeResolved)
import Lithon.Codegen.Vulkan.Xml.Decode (ParseError)
import Lithon.Codegen.Vulkan.Xml.Load (XmlLoadError, loadXmlFile)

data VulkanError
  = VulkanResolutionError VulkanResolutionError
  | VulkanXmlLoadError XmlLoadError
  | VulkanXmlParseError FilePath ParseFailure
  | VulkanProfileLoadError FilePath ProfileDecodeError
  | ResolveError (Errors ResolveError)
  | CurateError (Errors CurateError)
  | GenerateError (Errors GenerateError)
  | NoSuchEntity Text
  | EmitError EmitError
  deriving stock (Generic, Show)
  deriving anyclass (Exception)

instance From VulkanResolutionError VulkanError where
  from = VulkanResolutionError

instance From (Errors ResolveError) VulkanError where
  from = ResolveError

instance From (Errors CurateError) VulkanError where
  from = CurateError

instance From (Errors GenerateError) VulkanError where
  from = GenerateError

instance From EmitError VulkanError where
  from = EmitError

instance Display VulkanError where
  displayBuilder = \case
    VulkanResolutionError err -> "Failed to initialize vulkan generator: " <> from err
    VulkanXmlLoadError err -> "Failed to load Vulkan XML: " <> from err
    VulkanXmlParseError path err ->
      "Registry at "
        <> show path
        <> " failed to parse with "
        <> show (length err.errors)
        <> " errors and "
        <> show (length err.warnings)
        <> " warnings:"
        <> via @(Errors ParseError) err.errors
    VulkanProfileLoadError pfl err -> "Failed to load profile " <> show pfl <> ": " <> from err
    ResolveError err -> "Failed to resolve Vulkan registry: " <> from err
    CurateError err -> "Failed to curate Vulkan registry: " <> from err
    GenerateError err -> "Failed to generate Vulkan library: " <> from err
    NoSuchEntity name -> "No such entity " <> show name
    EmitError err -> "Failed to emit library: " <> from err

data VulkanCmd
  = CmdParse ParseOpts
  | CmdCheck CheckOpts
  | CmdResolve ResolveOpts
  | CmdCurate CurateOpts
  | CmdGenerate GenerateOpts

vulkanCmdP :: Opts.Parser VulkanCmd
vulkanCmdP =
  hsubparser
    ( command
        "parse"
        (info (CmdParse <$> parseOptsP) (progDesc "Parse and dump IR / summary / slices"))
        <> command
          "check"
          (info (CmdCheck <$> checkOptsP) (progDesc "Parse strictly and report all diagnostics (CI gate)"))
        <> command
          "resolve"
          ( info
              (CmdResolve <$> resolveOptsP)
              (progDesc "Specialize to vulkan and run the resolve passes (phase 2)")
          )
        <> command
          "curate"
          ( info
              (CmdCurate <$> curateOptsP)
              (progDesc "Resolve, then curate to a profile (closure + prune + report)")
          )
        <> command
          "generate"
          ( info
              (CmdGenerate <$> generateOptsP)
              (progDesc "Curate, then emit the lithon package sources (phase 3)")
          )
    )

data ParseOpts = ParseOpts
  { jsonOut :: Maybe FilePath
  , summary :: Bool
  , slices :: [Text]
  }

parseOptsP :: Opts.Parser ParseOpts
parseOptsP = do
  jsonOut <-
    optional
      (strOption (long "json" <> metavar "FILE" <> help "Write the full IR as canonical JSON"))
  summary <- switch (long "summary" <> help "Print section counts and digests")
  slices <-
    many
      ( strOption
          (long "slice" <> metavar "NAME" <> help "Dump one named entity's IR as canonical JSON")
      )
  pure ParseOpts{..}

newtype CheckOpts = CheckOpts
  { profilePath :: Maybe FilePath
  }

checkOptsP :: Opts.Parser CheckOpts
checkOptsP = do
  profilePath <-
    optional
      ( strOption
          (long "profile" <> metavar "FILE" <> help "Also gate resolve + curation for FILE")
      )
  pure CheckOpts{..}

data ResolveOpts = ResolveOpts
  { jsonOut :: Maybe FilePath
  , summary :: Bool
  , slices :: [Text]
  }

resolveOptsP :: Opts.Parser ResolveOpts
resolveOptsP = do
  jsonOut <-
    optional
      ( strOption
          (long "json" <> metavar "FILE" <> help "Write the resolved registry as canonical JSON")
      )
  summary <- switch (long "summary" <> help "Print resolved table counts and digests")
  slices <-
    many
      ( strOption
          ( long "slice"
              <> metavar "NAME"
              <> help "Dump one named resolved entity as canonical JSON"
          )
      )
  pure ResolveOpts{..}

data CurateOpts = CurateOpts
  { profilePath :: FilePath
  , jsonOut :: Maybe FilePath
  , reportOut :: Maybe FilePath
  , summary :: Bool
  , slices :: [Text]
  , explains :: [Text]
  }

curateOptsP :: Opts.Parser CurateOpts
curateOptsP = do
  profilePath <- strOption (long "profile" <> metavar "FILE" <> help "Curation profile (JSON)")
  jsonOut <-
    optional
      ( strOption
          (long "json" <> metavar "FILE" <> help "Write the curated registry as canonical JSON")
      )
  reportOut <-
    optional
      ( strOption
          ( long "report"
              <> metavar "FILE"
              <> help "Write the curation report as canonical JSON (\"-\" = text on stdout)"
          )
      )
  summary <- switch (long "summary" <> help "Print curated table counts and digests")
  slices <-
    many
      ( strOption
          (long "slice" <> metavar "NAME" <> help "Dump one curated entity as canonical JSON")
      )
  explains <-
    many
      ( strOption
          (long "explain" <> metavar "NAME" <> help "Print why NAME is in the curated set")
      )
  pure CurateOpts{..}

data GenerateOpts = GenerateOpts
  { profilePath :: FilePath
  , outDir :: FilePath
  , emitEffect :: EmitEffect
  , reportPath :: Maybe FilePath
  }

generateOptsP :: Opts.Parser GenerateOpts
generateOptsP = do
  profilePath <- strOption (long "profile" <> metavar "FILE" <> help "Curation profile (JSON)")
  outDir <-
    strOption
      ( long "out"
          <> metavar "DIR"
          <> value "lithon-vk"
          <> showDefault
          <> help "Target package directory"
      )
  emitEffect <- emitEffectOptP
  reportPath <-
    optional
      ( strOption
          ( long "report"
              <> metavar "FILE"
              <> help "Write the planning report (census, unpaired creates, retained counts) as canonical JSON"
          )
      )
  pure GenerateOpts{..}

runVulkan
  :: ( HasCallStack
     , IOE :> es
     , Log :> es
     , Clock :> es
     , Concurrent :> es
     , PrettyPrint :> es
     , Error VulkanError :> es
     , FileSystem :> es
     , Console :> es
     , Resource :> es
     )
  => VulkanCmd -> Eff es ()
runVulkan cmd = runErrorFrom @VulkanResolutionError $ runVulkanGen case cmd of
  CmdCheck opts -> do
    registry <- loadAndParseRegistry
    whenJust opts.profilePath \profilePath -> do
      resolved <- runPass "resolve" (resolveRegistry ApiVulkan) registry
      profile <- loadProfile profilePath
      curated <- runPass "curation" (curate profile) resolved
      logInfo
        $ "curation gate passed"
        :# ["extensions" .= length curated.report.selectedExtensions]
  CmdParse opts -> do
    registry <- loadAndParseRegistry
    whenJust opts.jsonOut \path -> do
      ELBS.writeFile path (canonicalJsonBytes registry)
      logInfo $ "wrote canonical IR JSON" :# ["outputPath" .= T.pack path]
    when opts.summary do
      pPrint $ prettySummary (summarize registry)
    for_ opts.slices \name ->
      case sliceNamespace name registry of
        Just rendered -> LazyConsole.putStr rendered
        Nothing -> throwError $ NoSuchEntity name
    unless (opts.summary || isJust opts.jsonOut || not (null opts.slices))
      $ logInfo "parse succeeded (use --summary, --json, or --slice for output)"
  CmdResolve opts -> do
    registry <- loadAndParseRegistry
    resolved <- runPass "resolve" (resolveRegistry ApiVulkan) registry
    whenJust opts.jsonOut \path -> do
      ELBS.writeFile path (canonicalJsonBytes resolved)
      logInfo $ "wrote resolved registry JSON" :# ["outputPath" .= T.pack path]
    when opts.summary do
      pPrint $ prettyResolvedSummary (summarizeResolved resolved)
    for_ opts.slices \name ->
      case resolvedSliceNamespace name resolved of
        Just rendered -> LazyConsole.putStr rendered
        Nothing -> throwError $ NoSuchEntity name
    unless (opts.summary || isJust opts.jsonOut || not (null opts.slices))
      $ logInfo "resolve succeeded (use --summary, --json, or --slice for output)"
  CmdCurate opts -> do
    registry <- loadAndParseRegistry
    resolved <- runPass "resolve" (resolveRegistry ApiVulkan) registry
    profile <- loadProfile opts.profilePath
    curated <- runPass "curate" (curate profile) resolved
    whenJust opts.jsonOut \path -> do
      ELBS.writeFile path (canonicalJsonBytes curated.registry)
      logInfo $ "wrote curated registry JSON" :# ["outputPath" .= T.pack path]
    whenJust opts.reportOut \case
      "-" -> pPrint $ prettyReport curated.report
      path -> do
        ELBS.writeFile path (canonicalJsonBytes curated.report)
        logInfo $ "wrote curation report JSON" :# ["outputPath" .= T.pack path]
    when opts.summary do
      pPrint $ prettyResolvedSummary (summarizeResolved curated.registry)
    for_ opts.slices \name ->
      case resolvedSliceNamespace name curated.registry of
        Just rendered -> LazyConsole.putStr rendered
        Nothing -> throwError $ NoSuchEntity name
    for_ opts.explains \name ->
      case explainName curated.closure name of
        Just explanation -> Console.putStrLn (encodeUtf8 explanation)
        Nothing -> throwError $ NoSuchEntity name
    unless
      ( opts.summary
          || isJust opts.jsonOut
          || isJust opts.reportOut
          || not (null opts.slices)
          || not (null opts.explains)
      )
      $ logInfo "curation succeeded (use --summary, --json, --report, --slice, or --explain)"
  CmdGenerate opts -> do
    registry <- loadAndParseRegistry
    resolved <- runPass "resolve" (resolveRegistry ApiVulkan) registry
    profile <- loadProfile opts.profilePath
    curated <- runPass "curate" (curate profile) resolved
    gen <- runPass "generate" generate curated
    whenJust opts.reportPath \rp -> do
      createDirectoryIfMissing True (takeDirectory rp)
      ELBS.writeFile rp (canonicalJsonBytes gen.report)
      logInfo $ "wrote planning report" :# ["path" .= T.pack rp]
    runErrorFrom @EmitError @VulkanError
      $ emitPackage
        HaskellPackage
        EmitTarget
          { outDir = opts.outDir
          , manifestMeta =
              Map.fromList
                [ ("profileName", Aeson.toJSON profile.name)
                , ("registryHeaderVersion", Aeson.toJSON curated.registry.headerVersion)
                ]
          , effect = opts.emitEffect
          }
        gen.files

-- | Read and decode a curation profile.
loadProfile
  :: (HasCallStack, FileSystem :> es, Error VulkanError :> es) => FilePath -> Eff es Profile
loadProfile path = do
  bytes <- ELBS.readFile path
  case decodeProfile bytes of
    Right profile -> pure profile
    Left err -> throwError $ VulkanProfileLoadError path err

loadAndParseRegistry
  :: ( HasCallStack
     , IOE :> es
     , Clock :> es
     , Log :> es
     , Error VulkanError :> es
     , Resource :> es
     , VulkanGen :> es
     )
  => Eff es Registry
loadAndParseRegistry = do
  path <- getVulkanXmlPath
  res <- logTimedNF "loaded and parsed" do
    loaded <- loadXmlFile path
    case loaded of
      Left err -> throwError $ VulkanXmlLoadError err
      Right root -> pure $ parseRegistry root

  case res of
    Left err -> do
      warn err.warnings
      throwError $ VulkanXmlParseError path err
    Right ok -> do
      warn ok.warnings
      pure ok.registry
 where
  warn = \case
    [] -> pure ()
    warnings ->
      let heading = ["registry parsed with " <> T.show (length warnings) <> " warnings:"]
       in logWarn $ T.intercalate "\n  - " (heading <> map display warnings) :# []

-- | Find one entity by name across the resolved tables and render it.
resolvedSliceNamespace :: Text -> ResolvedRegistry -> Maybe LBS.ByteString
resolvedSliceNamespace name reg =
  asum
    [ canonicalJsonBytes <$> Map.lookup (WithNS name) reg.structs
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.enums
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.bitmasks
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.handles
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.commands
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.constants
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.funcpointers
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.basetypes
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.defines
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.externals
    , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.extensions
    , canonicalJsonBytes <$> V.find (\f -> f.name == WithNS name) reg.features
    ]

runPass
  :: ( From (Errors e) VulkanError
     , NFData e
     , NFData r
     , Clock :> es
     , Error VulkanError :> es
     , Log :> es
     )
  => Text -> (a -> Either (Errors e) r) -> a -> Eff es r
runPass what f a = logTimedNF what (pure (f a)) >>= either (throwError . from) pure

-- | Find one entity by name across the name-bearing sections and render it.
sliceNamespace :: Text -> Registry -> Maybe LBS.ByteString
sliceNamespace name reg =
  asum
    [ canonicalJsonBytes <$> V.find (\t -> typeBodyName t.body == WithNS name) reg.types
    , canonicalJsonBytes <$> V.find (\b -> b.name == WithNS name) reg.enums
    , canonicalJsonBytes <$> V.find (matchesCommand name) reg.commands
    , canonicalJsonBytes <$> V.find (\f -> f.name == WithNS name) reg.features
    , canonicalJsonBytes <$> V.find (\e -> e.name == WithNS name) reg.extensions
    , canonicalJsonBytes <$> V.find (\f -> f.name == name) reg.formats
    ]
 where
  matchesCommand n = \case
    CommandAlias{name = aliasName} -> aliasName == WithNS n
    CommandDef d -> d.proto.decl.name == n
