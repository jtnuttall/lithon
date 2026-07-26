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
  Env (..),
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
import Effectful.Error.Dynamic (Error, runError, throwError_)
import Effectful.FileSystem (
  FileSystem,
  createDirectoryIfMissing,
  doesFileExist,
 )
import Effectful.FileSystem.IO.ByteString.Lazy qualified as ELBS
import Effectful.Reader.Dynamic (Reader, ask)
import Effectful.Resource (Resource)
import Options.Applicative (
  command,
  help,
  hsubparser,
  info,
  long,
  metavar,
  progDesc,
  showDefault,
  strArgument,
  strOption,
  switch,
  value,
 )
import Options.Applicative qualified as Opts
import System.FilePath (takeDirectory, (<.>), (</>))

import Lithon.Codegen.Backend.Emit (
  EmitError,
  EmitStrategy (HaskellPackage),
  EmitTarget (..),
  emitPackage,
 )
import Lithon.Codegen.Backend.Json (canonicalJsonBytes)
import Lithon.Codegen.Effect.Clock (Clock, renderTimespan, timedWith, timedWithNF)
import Lithon.Codegen.Effect.Log
import Lithon.Codegen.Effect.PrettyPrint
import Lithon.Codegen.Effect.Util (mapDynError)
import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Curate (Curated (..), curate)
import Lithon.Codegen.Vulkan.Curate.Closure (explainName)
import Lithon.Codegen.Vulkan.Curate.Profile (Profile (..), decodeProfile)
import Lithon.Codegen.Vulkan.Curate.Report (CurationReport (..), prettyReport)
import Lithon.Codegen.Vulkan.Generate (GenOutput (..), generate)
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
import Lithon.Codegen.Vulkan.Resolve (resolveRegistry)
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedFeature (..), ResolvedRegistry (..))
import Lithon.Codegen.Vulkan.Resolved.Summary (prettyResolvedSummary, summarizeResolved)
import Lithon.Codegen.Vulkan.Xml.Decode (ParseError)
import Lithon.Codegen.Vulkan.Xml.Load (loadXmlFile)
import Lithon.Codegen.Vulkan.Xml.Types (XElement)

newtype Env = Env
  {dataDir :: FilePath}

data VulkanCmd
  = CmdParse ParseOpts
  | CmdCheck CheckOpts
  | CmdResolve ResolveOpts
  | CmdCurate CurateOpts
  | CmdGenerate GenerateOpts

data ParseOpts = ParseOpts
  { registryPath :: Maybe FilePath
  , jsonOut :: Maybe FilePath
  , summary :: Bool
  , slices :: [Text]
  }

data CheckOpts = CheckOpts
  { registryPath :: Maybe FilePath
  , profilePath :: Maybe FilePath
  }

data ResolveOpts = ResolveOpts
  { registryPath :: Maybe FilePath
  , jsonOut :: Maybe FilePath
  , summary :: Bool
  , slices :: [Text]
  }

data CurateOpts = CurateOpts
  { registryPath :: Maybe FilePath
  , profilePath :: FilePath
  , jsonOut :: Maybe FilePath
  , reportOut :: Maybe FilePath
  , summary :: Bool
  , slices :: [Text]
  , explains :: [Text]
  }

data GenerateOpts = GenerateOpts
  { registryPath :: Maybe FilePath
  , profilePath :: FilePath
  , outDir :: FilePath
  , checkOnly :: Bool
  , reportPath :: Maybe FilePath
  }

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

registryPathP :: Opts.Parser (Maybe FilePath)
registryPathP =
  optional
    ( strArgument
        (metavar "VK_XML" <> help "Path to vk.xml (default: the Vulkan-Docs submodule)")
    )

parseOptsP :: Opts.Parser ParseOpts
parseOptsP =
  ParseOpts
    <$> registryPathP
    <*> optional
      (strOption (long "json" <> metavar "FILE" <> help "Write the full IR as canonical JSON"))
    <*> switch (long "summary" <> help "Print section counts and digests")
    <*> many
      ( strOption
          (long "slice" <> metavar "NAME" <> help "Dump one named entity's IR as canonical JSON")
      )

checkOptsP :: Opts.Parser CheckOpts
checkOptsP =
  CheckOpts
    <$> registryPathP
    <*> optional
      ( strOption
          (long "profile" <> metavar "FILE" <> help "Also gate resolve + curation for FILE")
      )

resolveOptsP :: Opts.Parser ResolveOpts
resolveOptsP =
  ResolveOpts
    <$> registryPathP
    <*> optional
      ( strOption
          (long "json" <> metavar "FILE" <> help "Write the resolved registry as canonical JSON")
      )
    <*> switch (long "summary" <> help "Print resolved table counts and digests")
    <*> many
      ( strOption
          ( long "slice"
              <> metavar "NAME"
              <> help "Dump one named resolved entity as canonical JSON"
          )
      )

curateOptsP :: Opts.Parser CurateOpts
curateOptsP =
  CurateOpts
    <$> registryPathP
    <*> strOption (long "profile" <> metavar "FILE" <> help "Curation profile (JSON)")
    <*> optional
      ( strOption
          (long "json" <> metavar "FILE" <> help "Write the curated registry as canonical JSON")
      )
    <*> optional
      ( strOption
          ( long "report"
              <> metavar "FILE"
              <> help "Write the curation report as canonical JSON (\"-\" = text on stdout)"
          )
      )
    <*> switch (long "summary" <> help "Print curated table counts and digests")
    <*> many
      ( strOption
          (long "slice" <> metavar "NAME" <> help "Dump one curated entity as canonical JSON")
      )
    <*> many
      ( strOption
          (long "explain" <> metavar "NAME" <> help "Print why NAME is in the curated set")
      )

generateOptsP :: Opts.Parser GenerateOpts
generateOptsP =
  GenerateOpts
    <$> registryPathP
    <*> strOption (long "profile" <> metavar "FILE" <> help "Curation profile (JSON)")
    <*> strOption
      ( long "out"
          <> metavar "DIR"
          <> value "lithon-vk"
          <> showDefault
          <> help "Target package directory"
      )
    <*> switch (long "check" <> help "Diff fresh output against the tree; write nothing (CI gate)")
    <*> optional
      ( strOption
          ( long "report"
              <> metavar "FILE"
              <> help "Write the planning report (census, unpaired creates, retained counts) as canonical JSON"
          )
      )

resolveRegistryPath
  :: (Error Text :> es, FileSystem :> es, Reader Env :> es, Log :> es)
  => Maybe FilePath -> Eff es FilePath
resolveRegistryPath = \case
  Just explicit -> pure explicit
  Nothing -> do
    env <- ask
    let vkXmlPath = env.dataDir </> "xml" </> "vk" <.> "xml"
    logDebug $ "checking for vk.xml" :# ["vkXmlPath" .= vkXmlPath]
    exists <- doesFileExist vkXmlPath
    unless exists $ throwError_ "vk.xml not found; pass an explicit path or update the data-dir"
    pure vkXmlPath

runVulkan
  :: ( IOE :> es
     , Log :> es
     , Clock :> es
     , Concurrent :> es
     , PrettyPrint :> es
     , Error Text :> es
     , Reader Env :> es
     , FileSystem :> es
     , Console :> es
     , Resource :> es
     )
  => VulkanCmd -> Eff es ()
runVulkan = \case
  CmdCheck opts -> do
    (_, ok) <- loadAndParse opts.registryPath
    registry <- checkParseResult ok
    whenJust opts.profilePath \profilePath -> do
      resolved <-
        checkPassResult "resolve"
          =<< timedWithNF (logTime "resolved") (pure (resolveRegistry ApiVulkan registry))
      profile <- loadProfile profilePath
      curated <-
        checkPassResult "curation"
          =<< timedWithNF (logTime "curated") (pure (curate profile resolved))
      logInfo
        $ "curation gate passed"
        :# ["extensions" .= length curated.report.selectedExtensions]
  CmdParse opts -> do
    (_, ok) <- loadAndParse opts.registryPath
    registry <- checkParseResult ok
    whenJust opts.jsonOut \path -> do
      ELBS.writeFile path (canonicalJsonBytes registry)
      logInfo $ "wrote canonical IR JSON" :# ["outputPath" .= T.pack path]
    when opts.summary do
      pPrint $ prettySummary (summarize registry)
    for_ opts.slices \name ->
      case sliceNamespace name registry of
        Just rendered -> LazyConsole.putStr rendered
        Nothing -> throwError_ $ "no entity named " <> T.show name
    unless (opts.summary || isJust opts.jsonOut || not (null opts.slices))
      $ logInfo "parse succeeded (use --summary, --json, or --slice for output)"
  CmdResolve opts -> do
    (_, ok) <- loadAndParse opts.registryPath
    registry <- checkParseResult ok
    resolved <-
      checkPassResult "resolve"
        =<< timedWithNF (logTime "resolved") (pure (resolveRegistry ApiVulkan registry))
    whenJust opts.jsonOut \path -> do
      ELBS.writeFile path (canonicalJsonBytes resolved)
      logInfo $ "wrote resolved registry JSON" :# ["outputPath" .= T.pack path]
    when opts.summary do
      pPrint $ prettyResolvedSummary (summarizeResolved resolved)
    for_ opts.slices \name ->
      case resolvedSliceNamespace name resolved of
        Just rendered -> LazyConsole.putStr rendered
        Nothing -> throwError_ $ "no resolved entity named " <> T.show name
    unless (opts.summary || isJust opts.jsonOut || not (null opts.slices))
      $ logInfo "resolve succeeded (use --summary, --json, or --slice for output)"
  CmdCurate opts -> do
    (_, ok) <- loadAndParse opts.registryPath
    registry <- checkParseResult ok
    resolved <-
      checkPassResult "resolve"
        =<< timedWithNF (logTime "resolved") (pure (resolveRegistry ApiVulkan registry))
    profile <- loadProfile opts.profilePath
    curated <-
      checkPassResult "curation"
        =<< timedWithNF (logTime "curated") (pure (curate profile resolved))
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
        Nothing -> throwError_ $ "no curated entity named " <> T.show name
    for_ opts.explains \name ->
      case explainName curated.closure name of
        Just explanation -> Console.putStrLn (encodeUtf8 explanation)
        Nothing -> throwError_ $ "not in the curated set: " <> T.show name
    unless
      ( opts.summary
          || isJust opts.jsonOut
          || isJust opts.reportOut
          || not (null opts.slices)
          || not (null opts.explains)
      )
      $ logInfo "curation succeeded (use --summary, --json, --report, --slice, or --explain)"
  CmdGenerate opts -> do
    (_, ok) <- loadAndParse opts.registryPath
    registry <- checkParseResult ok
    resolved <-
      checkPassResult "resolve"
        =<< timedWithNF (logTime "resolved") (pure (resolveRegistry ApiVulkan registry))
    profile <- loadProfile opts.profilePath
    curated <-
      checkPassResult "curation"
        =<< timedWithNF (logTime "curated") (pure (curate profile resolved))
    gen <-
      checkPassResult "generate"
        =<< timedWithNF (logTime "generated") (pure (generate curated))
    whenJust opts.reportPath \rp -> do
      createDirectoryIfMissing True (takeDirectory rp)
      ELBS.writeFile rp (canonicalJsonBytes gen.report)
      logInfo $ "wrote planning report" :# ["path" .= T.pack rp]
    mapDynError @EmitError display
      . runError
      $ emitPackage
        HaskellPackage
        EmitTarget
          { outDir = opts.outDir
          , manifestMeta =
              Map.fromList
                [ ("profileName", Aeson.toJSON profile.name)
                , ("registryHeaderVersion", Aeson.toJSON curated.registry.headerVersion)
                ]
          , checkOnly = opts.checkOnly
          }
        gen.files
 where
  logTime tag a ts = logInfo (tag <> " in " <> renderTimespan ts :# []) >> pure a

-- | Read and decode a curation profile.
loadProfile
  :: (FileSystem :> es, Error Text :> es) => FilePath -> Eff es Profile
loadProfile path = do
  bytes <- ELBS.readFile path
  case decodeProfile bytes of
    Right profile -> pure profile
    Left err -> throwError_ ("profile " <> T.pack path <> ": " <> err)

-- | Load and parse, logging phase timings.
loadAndParse
  :: ( IOE :> es
     , Clock :> es
     , Log :> es
     , Error Text :> es
     , Reader Env :> es
     , FileSystem :> es
     , Resource :> es
     )
  => Maybe FilePath
  -> Eff es (XElement, Either ParseFailure ParseSuccess)
loadAndParse explicitPath = do
  path <- resolveRegistryPath explicitPath
  root <- timedWith (logTime "loaded and parsed") do
    loaded <- loadXmlFile path
    case loaded of
      Left err -> throwError_ $ display err
      Right el -> pure el
  outcome <- timedWithNF (logTime "parsed") (pure (parseRegistry root))
  pure (root, outcome)
 where
  logTime tag a ts = logInfo (tag <> " in " <> renderTimespan ts :# []) >> pure a

-- | Print every diagnostic; exit non-zero if any error was recorded.
checkParseResult
  :: (Error Text :> es, Log :> es) => Either ParseFailure ParseSuccess -> Eff es Registry
checkParseResult = \case
  Right ok -> do
    logWarnings ok.warnings
    pure ok.registry
  Left failure -> do
    logWarnings failure.warnings
    throwError_
      $ "registry failed to parse with "
      <> T.show (length failure.errors)
      <> " errors and "
      <> T.show (length failure.warnings)
      <> " warnings:"
      <> display (into @(Errors ParseError) failure.errors)
 where
  logWarnings [] = pure ()
  logWarnings warnings =
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

-- | Surface a pass's accumulated errors through the CLI error channel.
checkPassResult
  :: (Display e, Error Text :> es) => Text -> Either (Errors e) a -> Eff es a
checkPassResult what = \case
  Right a -> pure a
  Left errs ->
    throwError_
      $ what
      <> " failed with "
      <> T.show (length errs)
      <> " errors:"
      <> display errs

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
