{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Codegen.Sys.Env (
  SysResolutionError (..),
  StaticRefusal (..),
  Registry (..),
  registryFile,
  SysEnv (..),
  SysPaths (..),
  SysGen,
  getSysEnv,
  runSysGen,

  -- * Package statics
  PackageStatics (..),
  loadStatics,
  reservedLicenses,
) where

import Control.Monad (join)
import Data.Aeson qualified as A
import Data.HashMap.Strict qualified as HM
import Data.List qualified as L
import Effectful
import Effectful.Dispatch.Dynamic
import Effectful.Error.Dynamic
import Effectful.FileSystem.IO.ByteString qualified as EBS
import Effectful.Reader.Dynamic
import Lithon.Effect.ClangEnv
import Lithon.Effect.Error (runErrorFrom)
import Lithon.Effect.FileSystem (
  FileSystem,
  assertDirectoryExists,
  assertFileExists,
  doesDirectoryExist,
  doesFileExist,
  listDirectory,
 )
import Lithon.Effect.Log
import Lithon.Prelude
import System.FilePath ((</>))

import Lithon.Codegen.Backend.Env (DataDirError, targetDataDir)
import Lithon.Codegen.Sys.Target (SysTarget (..))

-- | The three registries every target's data directory carries.
data Registry = VersionsJson | AliasesJson | ConstantsJson
  deriving stock (Bounded, Enum, Eq, Generic, Show)

-- | The registry's file name in @data\/\<key\>\/@, which is also how
-- messages name it.
registryFile :: Registry -> FilePath
registryFile = \case
  VersionsJson -> "versions.json"
  AliasesJson -> "aliases.json"
  ConstantsJson -> "constants.json"

instance Display Registry where
  displayBuilder = from . registryFile

-- | Why a target's generation environment could not be resolved. The
-- 'Text' fields carry the target's display name, for the messages.
data SysResolutionError
  = -- | The display name, the pkg-config package, and what pkg-config
    -- does know.
    PkgConfigMissing Text PkgName PkgMetaDb
  | IncludeDirUnset Text PkgName [PkgVarName]
  | VersionUnknown Text
  | RegistryMissing Registry FilePath
  | -- | A required file of @static\/@ is absent.
    StaticMissing FilePath
  | -- | @static\/@ holds something it may not: the entry, and why.
    StaticUnexpected FilePath StaticRefusal
  | -- | The target record itself is malformed (its key, the problems).
    TargetInvalid Text [Text]
  | DataDirUnresolved DataDirError
  deriving stock (Generic, Show)

-- | Why 'loadStatics' refuses an entry of @static\/@.
data StaticRefusal
  = -- | A directory or a dotfile.
    NotAFile
  | -- | A file other than the three required ones that is not named
    -- @LICENSE_\<name\>@: every such file is staged as a license.
    NotALicense
  | -- | One of the 'reservedLicenses', which the generator stages itself.
    ReservedLicense
  deriving stock (Eq, Generic, Show)

instance From DataDirError SysResolutionError where
  from = DataDirUnresolved

instance Display SysResolutionError where
  displayBuilder = \case
    PkgConfigMissing name pkg db ->
      let dbd = display db
          pkgd = pkg.name
       in from
            [trimmingQQ| 
              $name ($pkgd) does not appear to be resolvable from pkg-config.

              Here's what I got found with `pkg-config --list-all`:

                $dbd
            |]
    IncludeDirUnset name pkg vars ->
      let varsd = from $ intercalateTB "\n" (map displayBuilder vars)
          whose = name <> "'s"
          pkgd = pkg.name
       in from
            [trimmingQQ|
              Could not find $whose include dir under the expected variable.

              Here are the variables I found for $pkgd:
              $varsd
            |]
    VersionUnknown name -> "Could not determine " <> from name <> " version from pkg-config!"
    RegistryMissing registry path ->
      "Could not find the " <> displayBuilder registry <> " registry at: " <> from path
    StaticMissing path ->
      "Could not find the package static "
        <> from path
        <> " (static/ needs package.yaml, README.md, and CHANGELOG.md)"
    StaticUnexpected path refusal ->
      "Unexpected package static " <> from path <> case refusal of
        NotAFile ->
          " (static/ holds package.yaml, README.md, CHANGELOG.md, and LICENSE_<name> files, nothing"
            <> " else: no directories, no dotfiles)"
        NotALicense ->
          " (every file in static/ besides package.yaml, README.md, and CHANGELOG.md is staged as a"
            <> " license under its own name, so it must be named LICENSE_<name>, like LICENSE_SDL)"
        ReservedLicense ->
          " (the generator stages "
            <> intercalateTB ", " (map from reservedLicenses)
            <> " in every package itself; name the library's license LICENSE_<name>)"
    TargetInvalid key problems ->
      "target "
        <> from key
        <> " is invalid:"
        <> foldMap (\problem -> "\n  - " <> from problem) problems
    DataDirUnresolved err -> displayBuilder err

-- | The resolved generation environment: where the target's headers live,
-- which library version they belong to, and where its data is.
--
-- hs-bindgen additionally honors @BINDGEN_EXTRA_CLANG_ARGS@ from the environment
-- on top of this.
data SysEnv = SysEnv
  { includeDir :: FilePath
  -- ^ The directory containing the target's include root (@SDL3\/@;
  -- passed as @-I@).
  , libraryVersion :: Text
  -- ^ @pkg-config --modversion \<pkgConfig\>@.
  , pkgDbEntry :: PkgDbEntry
  , paths :: SysPaths
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

-- | The target's data directory and what the pipeline reads from it —
-- the same layout for every target.
data SysPaths = SysPaths
  { dataDir :: FilePath
  -- ^ @lithon-codegen\/data\/\<key\>\/@, absolute: the spec artifacts'
  -- home.
  , versions :: FilePath
  -- ^ @versions.json@ (required).
  , aliases :: FilePath
  -- ^ @aliases.json@ (required).
  , constants :: FilePath
  -- ^ @constants.json@ (required).
  , static :: FilePath
  -- ^ @static\/@: the package's hand-written root files ('loadStatics').
  , overrides :: Maybe FilePath
  -- ^ @overrides.yaml@, the prescriptive binding spec, when present.
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

data SysGen :: Effect where
  GetSysEnv :: SysGen m SysEnv

type instance DispatchOf SysGen = Dynamic

getSysEnv :: (SysGen :> es) => Eff es SysEnv
getSysEnv = send GetSysEnv

-- | Resolve the target's environment: its data directory
-- (@data\/\<key\>\/@) and registries, and its headers and version through
-- @pkg-config@.
runSysGen
  :: ( IOE :> es
     , Log :> es
     , ClangEnv :> es
     , FileSystem :> es
     , Error SysResolutionError :> es
     )
  => SysTarget -> Eff (SysGen : es) a -> Eff es a
runSysGen target eff = do
  dataDir <- runErrorFrom @DataDirError $ targetDataDir (toString target.key)
  let versions = dataDir </> registryFile VersionsJson
      aliases = dataDir </> registryFile AliasesJson
      constants = dataDir </> registryFile ConstantsJson
      static = dataDir </> "static"
      name = target.displayName

  assertFileExists versions (RegistryMissing VersionsJson)
  assertFileExists aliases (RegistryMissing AliasesJson)
  assertFileExists constants (RegistryMissing ConstantsJson)

  overrides <- do
    let path = dataDir </> "overrides.yaml"
    exists <- doesFileExist path
    if exists then
      Just path <$ logInfo ("using prescriptive overrides" :# ["path" .= path])
    else
      pure Nothing

  pkgDbEntry <-
    noteErrM (PkgConfigMissing name target.pkgConfig <$> getPkgMetaDb)
      =<< getPkgDbEntry target.pkgConfig

  PkgVarValue includeDirVar <-
    noteErr (IncludeDirUnset name target.pkgConfig (HM.keys pkgDbEntry.vars))
      . join
      =<< getPkgVar target.pkgConfig "includedir"
  let includeDir = from includeDirVar

  PkgVersion libraryVersion <- noteErr (VersionUnknown name) pkgDbEntry.version

  let paths = SysPaths{dataDir, versions, aliases, constants, static, overrides}
  reinterpret
    (runReader @SysEnv SysEnv{includeDir, libraryVersion, pkgDbEntry, paths})
    ( const \case
        GetSysEnv -> ask
    )
    eff

-- | The generated package's hand-written root files: @package.yaml@,
-- @README.md@, @CHANGELOG.md@, and the library's license files.
data PackageStatics = PackageStatics
  { packageYaml :: Text
  , readme :: Text
  , changelog :: Text
  , licenses :: [(FilePath, Text)]
  -- ^ Staged verbatim at the package root under their own names (SDL:
  -- @LICENSE_SDL@), by name.
  }

-- | Read the package statics from @data\/\<key\>\/static\/@ (generation
-- only; @spec@ never needs them): @package.yaml@, @README.md@, and
-- @CHANGELOG.md@ are required, every other file is a license staged
-- verbatim at the package root under its own name, which must be
-- @LICENSE_\<name\>@ and not one of the 'reservedLicenses'. Anything
-- else (a directory, a dotfile, an editor's backup) is an error rather
-- than a guess.
loadStatics
  :: (FileSystem :> es, Log :> es, Error SysResolutionError :> es)
  => SysTarget -> SysEnv -> Eff es PackageStatics
loadStatics target env = do
  assertDirectoryExists dir StaticMissing
  entries <- sort <$> listDirectory dir
  for_ entries \entry -> do
    isDirectory <- doesDirectoryExist (dir </> entry)
    whenJust (refusal isDirectory entry) (throwError . StaticUnexpected (dir </> entry))
  packageYaml <- required "package.yaml"
  readme <- required "README.md"
  changelog <- required "CHANGELOG.md"
  licenses <-
    for [entry | entry <- entries, entry `notElem` requiredStatics] \entry ->
      (entry,) <$> readText (dir </> entry)
  logInfo $ "package statics" :# ["target" .= target.key, "licenses" .= map fst licenses]
  pure PackageStatics{packageYaml, readme, changelog, licenses}
 where
  dir = env.paths.static
  requiredStatics = ["package.yaml", "README.md", "CHANGELOG.md"]
  refusal isDirectory entry
    | isDirectory || "." `isPrefixOf` entry = Just NotAFile
    | entry `elem` requiredStatics = Nothing
    | entry `elem` reservedLicenses = Just ReservedLicense
    | Just name <- L.stripPrefix "LICENSE_" entry, not (null name) = Nothing
    | otherwise = Just NotALicense
  required name = do
    assertFileExists (dir </> name) StaticMissing
    readText (dir </> name)
  readText path = decodeUtf8 <$> EBS.readFile path

-- | The root license files the generator stages in every package itself:
-- lithon's own (@LICENSE@, "Lithon.Codegen.Backend.Package.RootFiles")
-- and the vendored runtimes' ("Lithon.Codegen.Sys.Package"). A static by
-- one of these names would collide with it.
reservedLicenses :: [FilePath]
reservedLicenses = ["LICENSE", "LICENSE_hs-bindgen-runtime", "LICENSE_c-expr-runtime"]
