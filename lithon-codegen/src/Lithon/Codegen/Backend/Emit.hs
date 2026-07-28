{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | Target-agnostic package emission: stage, format, digest, sync (or
-- @--check@), manifest bookkeeping.
--
-- Shared by the frontends (Vulkan, SDL3); a frontend supplies its file set
-- and manifest provenance via 'EmitTarget'.
module Lithon.Codegen.Backend.Emit (
  EmitError (..),
  EmitStrategy (..),
  FormatMode (..),
  EmitTarget (..),
  Manifest (..),
  manifestFileName,
  emitPackage,
  emitPackageWith,
) where

import Control.Lens (_1)
import Data.Aeson (FromJSON, ToJSON)
import Data.Aeson qualified as A
import Data.ByteString qualified as BS
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Version (showVersion)
import Effectful
import Effectful.Concurrent.Async (
  Concurrent,
  forConcurrently,
  pooledMapConcurrently,
 )
import Effectful.Error.Dynamic (Error, throwError, throwError_)
import Effectful.Exception qualified as EEx
import Effectful.FileSystem (
  FileSystem,
  canonicalizePath,
  copyFile,
  createDirectoryIfMissing,
  doesDirectoryExist,
  doesFileExist,
  getCurrentDirectory,
  removeDirectoryRecursive,
  removeFile,
  renameFile,
 )
import Effectful.FileSystem.IO.ByteString qualified as EBS
import Effectful.FileSystem.IO.ByteString.Lazy qualified as ELBS
import Hpack qualified
import Hpack.Config qualified as Hpack
import Hpack.Error qualified as Hpack
import Lithon.Effect.Log
import Lithon.Prelude
import System.FilePath (
  addTrailingPathSeparator,
  isAbsolute,
  isRelative,
  makeRelative,
  splitDirectories,
  takeDirectory,
  takeExtension,
  takeFileName,
  (</>),
 )
import System.Process.Typed qualified as P
import Text.Regex.TDFA ((=~))

import Lithon.Codegen.Backend.Json (canonicalJsonBytes, digestText)
import Paths_lithon_codegen qualified

data EmitError
  = UnsafePaths Text [Text]
  | EmitCheckFailed EmitTarget [Text]
  | CommandFailed Text (P.ProcessConfig () () ()) ProcessFailureCode ProcessStdout ProcessStderr
  | ManifestDecodeError FilePath String
  | PackageYamlMissing FilePath
  | HpackError Hpack.HpackError
  | HpackBadResult Hpack.Result
  | UnresolvableFilePath FilepathResolutionError
  deriving stock (Generic, Show)

instance From Hpack.HpackError EmitError where
  from = HpackError

instance From Hpack.Result EmitError where
  from = HpackBadResult

instance From FilepathResolutionError EmitError where
  from = UnresolvableFilePath

instance Display EmitError where
  displayBuilder = \case
    UnsafePaths what bad ->
      let badd = T.intercalate "\n -" bad
       in from
            [trimmingQQ|
              Unsafe output path(s) during emit. Refusing to continue.

              The following paths appear unsafe:
                $badd

              This is a lithon-codegen bug.

              $what
            |]
    EmitCheckFailed target problems ->
      let outDir = from target.outDir
          problemsd = T.intercalate "\n - " problems
       in from
            [trimmingQQ|
              emit --check found drift under $outDir:

              $problemsd
            |]
    CommandFailed fmt cfg (ProcessFailureCode code) (ProcessStdout out) (ProcessStderr err) ->
      let coded = show code
          errd = from err
          cfgd = show cfg
       in from
            [trimmingQQ| 
              Failed when trying to run formatter $fmt: Exited with code $coded

              Stdout:
                $out

              Stderr:
                $errd

              Command: $cfgd
            |]
    ManifestDecodeError path err ->
      let pathd = from path
          errd = from err
       in from
            [trimmingQQ|
               manifest $pathd exists but does not decode:

                 $errd

               Refusing to proceed to avoid orphaning manifest files. Restore it from Git 
               history or regenerate from a clean checkout.
             |]
    PackageYamlMissing path ->
      let pathd = from path
       in from
            [trimmingQQ|
              Wanted a package.yaml file at $pathd, but couldn't find one.
            |]
    HpackError err ->
      let hpack = from $ Hpack.formatHpackError "lithon-codegen" err
       in from
            [trimmingQQ|
              hpack failed to create cabal file:

              $hpack
            |]
    HpackBadResult res ->
      let status = show res.resultStatus
          nWarns = show $ length res.resultWarnings
          warns = T.intercalate "\n -" (map from res.resultWarnings)
          cabalFile = from res.resultCabalFile
       in from
            [trimmingQQ|
              hpack failed to create cabal file $cabalFile with status $status and $nWarns warnings.
                $warns
            |]
    UnresolvableFilePath err -> displayBuilder err

-- | Where and how to emit a generated file set.
data EmitTarget = EmitTarget
  { outDir :: FilePath
  -- ^ Target package (or artifact) directory; staging, the manifest, and
  -- every emitted path are relative to it.
  , manifestMeta :: Map Text A.Value
  -- ^ Run the fourmolu batch over the staged files.
  , checkOnly :: Bool
  -- ^ Diff fresh output against the tree and write nothing (CI gate).
  }
  deriving stock (Show)

-- | The committed record of what generation produced — used to delete
-- stale files on regeneration and to gate @--check@. Digests are computed
-- /after/ formatting.
data Manifest = Manifest
  { generatorVersion :: Text
  , meta :: Map Text A.Value
  , files :: Map FilePath Text
  -- ^ path -> fnv1a64 digest of the emitted (formatted) source.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (FromJSON, ToJSON)

-- | The manifest's location inside the target directory.
manifestFileName :: FilePath
manifestFileName = ".lithon-manifest.json"

data EmitStrategy
  = ArtifactsOnly
  | HaskellPackage
  deriving stock (Show)

-- | Whether the staged file set is run through the formatters before
-- digesting and syncing.
--
-- 'DoFormat' is the only mode production uses (emitted packages are always
-- formatted). 'SkipFormat' exists for tests, which stage into throwaway
-- directories where the fourmolu\/dprint configs are not discoverable.
data FormatMode
  = DoFormat
  | SkipFormat
  deriving stock (Show)

-- | Stage, format, and sync (or @--check@) a generated file set.
emitPackage
  :: ( HasCallStack
     , IOE :> es
     , Log :> es
     , Concurrent :> es
     , FileSystem :> es
     , Error EmitError :> es
     )
  => EmitStrategy -> EmitTarget -> Map FilePath Text -> Eff es ()
emitPackage = emitPackageWith DoFormat

-- | As 'emitPackage', but with control over formatting. Prefer 'emitPackage'
-- in production; 'SkipFormat' is a testing affordance.
emitPackageWith
  :: ( HasCallStack
     , IOE :> es
     , Log :> es
     , Concurrent :> es
     , FileSystem :> es
     , Error EmitError :> es
     )
  => FormatMode -> EmitStrategy -> EmitTarget -> Map FilePath Text -> Eff es ()
emitPackageWith formatMode strategy target files = do
  -- TODO: hoist into an environment
  let staging = target.outDir </> ".lithon-staging"
  checkPaths "While preparing to emit package" (Map.keys files)
  cleanDirectory staging
  let emit = emitWith formatMode staging target files case strategy of
        ArtifactsOnly -> pure []
        HaskellPackage -> do
          unless (Map.member "package.yaml" files) do
            -- XXX: Is this ever used? Is it worth keeping?
            let src = target.outDir </> "package.yaml"
            exists <- doesFileExist src
            unless exists $ throwError (PackageYamlMissing src)
            copyFile src (staging </> "package.yaml")

          cabalFile <- emitCabalFile staging
          pure [(cabalFile, Nothing)]
  emit `EEx.finally` cleanDirectory staging

data Formatter
  = Fourmolu
  | DPrint
  | NoFormatter
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

data FileMeta = FileMeta
  { formatter :: Formatter
  , absPath :: FilePath
  , relPath :: FilePath
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

readFileMeta
  :: ( Show e
     , From FilepathResolutionError e
     , Error e :> es
     , FileSystem :> es
     )
  => FilePath -> (FilePath, Maybe LBS.ByteString) -> Eff es FileMeta
readFileMeta base (mpath, mcontents) = do
  (absPath, relPath) <- resolveFilepath base mpath
  bytes <- maybe (ELBS.readFile absPath) pure mcontents
  let formatter
        | takeExtension relPath /= ".hs" = DPrint
        | bytes =~ ("LANGUAGE[[:space:]]+CPP" :: ByteString) = NoFormatter
        | otherwise = Fourmolu
  pure FileMeta{..}

format
  :: (IOE :> es, Concurrent :> es, FileSystem :> es, Error EmitError :> es, Log :> es)
  => FormatMode
  -> FilePath
  -> [FileMeta]
  -> Eff es [(FileMeta, Text, LByteString)]
format formatMode staging metas = do
  case formatMode of
    SkipFormat -> logInfo $ "Skipping formatting" :# ["stagingDir" .= staging]
    DoFormat -> do
      currentDir <- getCurrentDirectory
      let logMeta = ["currentDir" .= currentDir, "stagingDir" .= staging]
      logInfo $ "Running dprint" :# logMeta
      void $ invokeCommand staging "dprint" ["fmt"]

      logInfo $ "Running fourmolu" :# logMeta
      let staged =
            mapMaybe
              ( \meta -> case meta.formatter of
                  Fourmolu -> Just (from meta.relPath)
                  _ -> Nothing
              )
              metas

      unless (null staged) do
        void $ invokeCommand staging "fourmolu" $ ["--mode", "inplace"] <> staged

  forConcurrently metas \meta -> do
    logDebug $ "reading formatted file" :# ["meta" .= meta]
    formatted <- ELBS.readFile meta.absPath
    pure (meta, digestText formatted, formatted)

invokeCommand :: (IOE :> es, Error EmitError :> es) => FilePath -> Text -> [Text] -> Eff es Text
invokeCommand cwd cmd args =
  snd <$> readProcessOrErrorWith (P.setWorkingDir cwd) (CommandFailed cmd) cmd args

emitWith
  :: ( HasCallStack
     , IOE :> es
     , Concurrent :> es
     , Log :> es
     , FileSystem :> es
     , Error EmitError :> es
     )
  => FormatMode
  -> FilePath
  -> EmitTarget
  -> Map FilePath Text
  -> Eff es [(FilePath, Maybe LByteString)]
  -- ^ Inject extra files, given a staging directory. These override on conflict.
  -> Eff es ()
emitWith formatMode staging target files resolveExtras = do
  for_ (Map.toList files) \(rel, contents) -> do
    let dest = staging </> rel
    createDirectoryIfMissing True (takeDirectory dest)
    EBS.writeFile dest (encodeUtf8 contents)

  extraFiles <- Map.fromList <$> resolveExtras

  let ourFiles = map (const Nothing) files
      allFiles = Map.unionWith (<|>) extraFiles ourFiles

  fileMeta <- pooledMapConcurrently (readFileMeta staging) (Map.toList allFiles)
  entries <- format formatMode staging fileMeta

  let manifest =
        Manifest
          { generatorVersion = T.pack (showVersion Paths_lithon_codegen.version)
          , meta = target.manifestMeta
          , files = Map.fromList [(meta.relPath, digest) | (meta, digest, _) <- entries]
          }
      manifestBytes = canonicalJsonBytes manifest
      manifestPath = target.outDir </> manifestFileName

  staleFiles <- listStaleFiles manifestPath (map (view _1) entries)

  if target.checkOnly then do
    checkEmission target manifestPath manifestBytes staleFiles entries
  else do
    logInfo $ "Emitting staged files" :# ["nStaged" .= length staleFiles]

    written <- fmap (length . filter id) . for entries $ \(meta, _, bytes) -> do
      let dest = target.outDir </> meta.relPath
      createDirectoryIfMissing True (takeDirectory dest)
      exists <- doesFileExist dest
      same <-
        if exists then
          (== BS.toStrict bytes) <$> EBS.readFile dest
        else
          pure False
      if same then pure False else True <$ ELBS.writeFile dest bytes

    for_ staleFiles \rel -> do
      let dest = target.outDir </> rel
      exists <- doesFileExist dest
      when exists (removeFile dest)

    -- Atomic manifest write: the temp lives inside staging (same
    -- filesystem, so the rename is atomic), and a crash before the rename
    -- leaves the OLD manifest intact instead of a torn one.
    let manifestTmp = staging </> "manifest.tmp"
    ELBS.writeFile manifestTmp manifestBytes
    renameFile manifestTmp manifestPath
    logInfo
      $ "emitted"
      :# [ "files" .= length entries
         , "written" .= written
         , "deleted" .= length staleFiles
         , "outDir" .= T.pack target.outDir
         ]

emitCabalFile
  :: (IOE :> es, Log :> es, Error EmitError :> es)
  => FilePath -> Eff es FilePath
emitCabalFile staging = do
  let opts =
        Hpack.Options
          { optionsForce = Hpack.Force
          , optionsToStdout = False
          , optionsGenerateHashStrategy = Hpack.ForceHash
          , optionsOutputStrategy = Hpack.CanonicalOutput
          , optionsDecodeOptions =
              Hpack.defaultDecodeOptions
                { Hpack.decodeOptionsProgramName = fromString $ "lithon-codegen " <> show Paths_lithon_codegen.version
                , Hpack.decodeOptionsTarget = staging </> "package.yaml"
                }
          }

  res <- liftEither . first from =<< liftIO (Hpack.hpackResultWithError opts)

  case res.resultStatus of
    Hpack.Generated -> success res
    Hpack.OutputUnchanged -> success res
    Hpack.AlreadyGeneratedByNewerHpack -> throwError (from res)
    Hpack.ExistingCabalFileWasModifiedManually -> throwError (from res)
 where
  success r = do
    let log = case r.resultWarnings of
          [] -> logInfo
          _ -> logWarn

    log
      $ "hpack succeded"
      :# [ "cabalFile" .= r.resultCabalFile
         , "warnings" .= r.resultWarnings
         ]

    pure $ takeFileName r.resultCabalFile

listStaleFiles
  :: (HasCallStack, Error EmitError :> es, FileSystem :> es)
  => FilePath -> [FileMeta] -> Eff es [FilePath]
listStaleFiles manifestPath entries = bool (pure []) checkedRead =<< doesFileExist manifestPath
 where
  checkedRead = do
    oldManifest <- readManifest manifestPath
    checkPaths
      ("manifest " <> from manifestPath <> ": This is generated output. Try restoring the old version.")
      (Map.keys oldManifest.files)

    let emitted = Set.fromList (map (.relPath) entries)
    pure $ filter (`Set.notMember` emitted) (Map.keys oldManifest.files)

  readManifest path = do
    bytes <- EBS.readFile path
    case A.eitherDecode @Manifest (LBS.fromStrict bytes) of
      Right m -> pure m
      Left err -> throwError (ManifestDecodeError path err)

checkEmission
  :: (Error EmitError :> es, FileSystem :> es, Log :> es)
  => EmitTarget
  -> FilePath
  -> LBS.LazyByteString
  -> [String]
  -> [(FileMeta, b, LBS.LazyByteString)]
  -> Eff es ()
checkEmission target manifestPath manifestBytes staleFiles entries = do
  fileDiffs <- forMaybe entries $ \(meta, _, bytes) -> do
    let dest = target.outDir </> meta.relPath
    exists <- doesFileExist dest
    if not exists then
      pure (Just ("missing from tree: " <> from meta.relPath))
    else do
      onDisk <- ELBS.readFile dest
      pure $ if onDisk == bytes then Nothing else Just ("differs: " <> from meta.relPath)
  manifestFresh <- do
    exists <- doesFileExist manifestPath
    if exists then
      (== manifestBytes) <$> ELBS.readFile manifestPath
    else
      pure False
  let problems =
        fileDiffs
          <> ["stale (delete): " <> T.pack rel | rel <- staleFiles]
          <> ["manifest out of date" | not manifestFresh]
  if null problems then
    logInfo
      $ "emit --check: tree is fresh"
      :# ["files" .= length entries, "outDir" .= T.pack target.outDir]
  else
    throwError_ $ EmitCheckFailed target problems

checkPaths :: (Error EmitError :> es) => Text -> [FilePath] -> Eff es ()
checkPaths what paths = do
  let unsafe = [T.pack p <> " (" <> reason <> ")" | p <- paths, Just reason <- [unsafeReason p]]
  guardWithError (UnsafePaths what unsafe) (null unsafe)
 where
  unsafeReason p
    | null p = Just "empty"
    | isAbsolute p = Just "absolute"
    | any (`elem` [".", ".."]) (splitDirectories p) = Just "dot segment"
    | otherwise = Nothing

cleanDirectory :: (FileSystem :> es) => FilePath -> Eff es ()
cleanDirectory dir = do
  exists <- doesDirectoryExist dir
  when exists (removeDirectoryRecursive dir)

data FilepathResolutionError = FilepathResolutionError
  { message :: Text
  , source :: FilePath
  , target :: FilePath
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

instance Display FilepathResolutionError where
  displayBuilder e =
    "Failed to resolve path: "
      <> from e.message
      <> "\n "
      <> "Source: "
      <> from e.source
      <> "\n "
      <> "Target: "
      <> from e.target

-- TODO: move to extras
resolveFilepath
  :: (FileSystem :> es, Show e, From FilepathResolutionError e, Error e :> es)
  => FilePath -> FilePath -> Eff es (FilePath, FilePath) -- (AbsolutePath, RelativePath)
resolveFilepath baseDir inputPath = do
  realBase <- canonicalizePath baseDir
  let rawTarget
        | isAbsolute inputPath = inputPath
        | otherwise = realBase </> inputPath

  realTarget <- canonicalizePath rawTarget
  let safeBase = addTrailingPathSeparator realBase
      rel = makeRelative safeBase realTarget

  guardWithError
    (from (FilepathResolutionError "Outside base directory" realBase realTarget))
    (isRelative rel)

  pure (realTarget, rel)
