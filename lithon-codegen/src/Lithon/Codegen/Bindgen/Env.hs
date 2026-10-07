{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Codegen.Bindgen.Env (
  BindgenResolutionError (..),
  StaticRefusal (..),
  Registry (..),
  registryFile,
  BindgenEnv (..),
  BindgenPaths (..),
  BindgenGen,
  getBindgenEnv,
  runBindgenGen,

  -- * The driver's options
  driverOpts,

  -- * Package statics
  PackageStatics (..),
  loadStatics,
  reservedLicenses,
) where

import Control.Monad (join)
import Data.Aeson qualified as A
import Data.Char (isAsciiLower, isAsciiUpper, isDigit)
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
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.FilePath ((</>))

import Lithon.Codegen.Backend.Env (DataDirError, targetDataDir)
import Lithon.Codegen.Bindgen.Driver (DriverOpts (..), PackageInfo (..))
import Lithon.Codegen.Bindgen.Target (BindgenTarget (..), ParseEnv (..))

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
data BindgenResolutionError
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
    -- @LICENSE_\<name\>@, a non-empty @\<name\>@ of ASCII letters, digits,
    -- @_@, and @-@ (so not an editor's backup like @LICENSE_SDL~@): every
    -- such file is staged as a license.
    NotALicense
  | -- | One of the 'reservedLicenses', which the generator stages itself.
    ReservedLicense
  deriving stock (Eq, Generic, Show)

instance From DataDirError BindgenResolutionError where
  from = DataDirUnresolved

instance Display BindgenResolutionError where
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
            <> " license under its own name, so it must be named LICENSE_<name>, a non-empty <name>"
            <> " of ASCII letters, digits, '_', and '-', like LICENSE_SDL)"
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
data BindgenEnv = BindgenEnv
  { includeDir :: FilePath
  -- ^ The directory containing the target's include root (@SDL3\/@;
  -- passed as @-I@).
  , libraryVersion :: Text
  -- ^ @pkg-config --modversion \<pkgConfig\>@.
  , pkgDbEntry :: PkgDbEntry
  , paths :: BindgenPaths
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

-- | The target's data directory and what the pipeline reads from it —
-- the same layout for every target.
data BindgenPaths = BindgenPaths
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

data BindgenGen :: Effect where
  GetBindgenEnv :: BindgenGen m BindgenEnv

type instance DispatchOf BindgenGen = Dynamic

getBindgenEnv :: (BindgenGen :> es) => Eff es BindgenEnv
getBindgenEnv = send GetBindgenEnv

-- | Resolve the target's environment: its data directory
-- (@data\/\<key\>\/@) and registries, and its headers and version through
-- @pkg-config@.
runBindgenGen
  :: ( IOE :> es
     , Log :> es
     , ClangEnv :> es
     , FileSystem :> es
     , Error BindgenResolutionError :> es
     )
  => BindgenTarget -> Eff (BindgenGen : es) a -> Eff es a
runBindgenGen target eff = do
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

  let paths = BindgenPaths{dataDir, versions, aliases, constants, static, overrides}
  reinterpret
    (runReader @BindgenEnv BindgenEnv{includeDir, libraryVersion, pkgDbEntry, paths})
    ( const \case
        GetBindgenEnv -> ask
    )
    eff

-- | Invocation environment shared by every hs-bindgen run.
--
-- - The target's defines and doxygen aliases apply to every header.
--
-- - Field prefixes are omitted per the lithon record style; hs-bindgen emits
-- @DuplicateRecordFields@ + @NoFieldSelectors@ pragmas as needed.
--
-- - Program slicing stays OFF (the seam's default): the headers are
-- expected to be self-contained, so an unresolved reference will fail
-- loudly.
--
-- - The package name is the @uniqueId@: it seeds the wrapper symbol hashes.
invocationEnv :: BindgenTarget -> BindgenEnv -> HB.InvocationEnv
invocationEnv target env =
  HB.InvocationEnv
    { extraIncludeDirs = [env.includeDir]
    , defineMacros =
        map
          (\(name, bodyMay) -> HS.hashDefine (toString name) (toString (fromMaybe "" bodymay)))
          target.parse.defines
    , doxygenAliases = target.parse.doxygenAliases
    , fieldNaming = HB.OmitFieldPrefixes
    , uniqueId = toString target.packageName
    }

-- | The target's generation run: the shared invocation environment plus
-- the prescriptive overrides registry, when present.
driverOpts :: BindgenTarget -> BindgenEnv -> DriverOpts
driverOpts target env =
  DriverOpts
    { invocationEnv = invocationEnv target env
    , prescriptiveSpec = env.paths.overrides
    , packageInfo =
        PackageInfo
          { name = target.packageName
          , dataDir = env.paths.dataDir
          , version = Nothing
          }
    }

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
-- @LICENSE_\<name\>@, a non-empty @\<name\>@ of ASCII letters, digits,
-- @_@, and @-@, and not one of the 'reservedLicenses'. Anything else (a
-- directory, a dotfile, an editor's backup like @LICENSE_SDL~@ or
-- @LICENSE_SDL.orig@) is an error rather than a guess.
loadStatics
  :: (FileSystem :> es, Log :> es, Error BindgenResolutionError :> es)
  => BindgenTarget -> BindgenEnv -> Eff es PackageStatics
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
    | Just name <- L.stripPrefix "LICENSE_" entry, isLicenseName name = Nothing
    | otherwise = Just NotALicense
  isLicenseName name = not (null name) && all isLicenseNameChar name
  isLicenseNameChar c = isAsciiUpper c || isAsciiLower c || isDigit c || c == '_' || c == '-'
  required name = do
    assertFileExists (dir </> name) StaticMissing
    readText (dir </> name)
  readText path = decodeUtf8 <$> EBS.readFile path

-- | The root license files the generator stages in every package itself:
-- lithon's own (@LICENSE@, "Lithon.Codegen.Backend.Package.RootFiles")
-- and the vendored runtimes' ("Lithon.Codegen.Bindgen.Package"). A static by
-- one of these names would collide with it.
reservedLicenses :: [FilePath]
reservedLicenses = ["LICENSE", "LICENSE_hs-bindgen-runtime", "LICENSE_c-expr-runtime"]
