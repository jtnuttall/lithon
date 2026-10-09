{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Codegen.Bindgen.Env (
  BindgenResolutionError (..),
  StaticRefusal (..),
  WiringProblem (..),
  AuthoredRefusal (..),
  Registry (..),
  registryFile,
  BindgenEnv (..),
  BindgenPaths (..),
  BindgenGen,
  getBindgenEnv,
  runBindgenGen,

  -- * The driver's options
  driverOpts,

  -- * Prescriptive overrides
  discoverOverrides,

  -- * Authored headers
  resolveAuthoredInclude,
  loadAuthoredHeaders,
  headerSourcePath,

  -- * Package statics
  PackageStatics (..),
  loadStatics,
  reservedLicenses,
) where

import Control.Monad (join)
import Data.Aeson qualified as A
import Data.Aeson.Key qualified as Key
import Data.Aeson.KeyMap qualified as KM
import Data.Char (isAsciiLower, isAsciiUpper, isDigit)
import Data.HashMap.Strict qualified as HM
import Data.List qualified as L
import Data.Map.Strict qualified as Map
import Effectful
import Effectful.Dispatch.Dynamic
import Effectful.Error.Dynamic
import Effectful.FileSystem.IO.ByteString qualified as EBS
import Effectful.Reader.Dynamic
import Hpack.Yaml qualified as Hpack
import Lithon.Effect.ClangEnv
import Lithon.Effect.Error (runErrorFrom)
import Lithon.Effect.FileSystem (
  FileSystem,
  assertDirectoryExists,
  assertFileExists,
  doesDirectoryExist,
  doesFileExist,
  listDirectory,
  whenFileExists,
  withDirectoryExists,
 )
import Lithon.Effect.Log
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.FilePath (
  dropTrailingPathSeparator,
  normalise,
  splitDirectories,
  takeExtension,
  (</>),
 )

import Lithon.Codegen.Backend.Env (DataDirError, targetDataDir)
import Lithon.Codegen.Bindgen.Driver (DriverOpts (..), PackageInfo (..))
import Lithon.Codegen.Bindgen.Target (
  AuthoredHeader (..),
  AuthoredHeaders (..),
  BindgenTarget (..),
  ParseEnv (..),
  defineMacro,
  includeArg,
  isAuthored,
  unitIncludeArg,
 )

-- | The four registries every target's data directory carries.
data Registry = VersionsJson | AliasesJson | ConstantsJson | UnboundJson
  deriving stock (Bounded, Enum, Eq, Generic, Show)

-- | The registry's file name in @data\/\<key\>\/@, which is also how
-- messages name it.
registryFile :: Registry -> FilePath
registryFile = \case
  VersionsJson -> "versions.json"
  AliasesJson -> "aliases.json"
  ConstantsJson -> "constants.json"
  UnboundJson -> "unbound.json"

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
  | -- | @static\/package.yaml@ of a target that authors C headers does not
    -- wire them into the package: the file, and what it lacks. See
    -- 'loadStatics'.
    StaticUnwired FilePath (NonEmpty WiringProblem)
  | -- | A stale single-file @overrides.yaml@: the prescriptive spec is one
    -- file per header now ('discoverOverrides').
    OverridesLegacy FilePath
  | -- | @overrides\/@ holds something it may not: the entry. See
    -- 'discoverOverrides'.
    OverrideUnexpected FilePath
  | -- | An authored header the target lists, or their root directory, is
    -- absent. See 'resolveAuthoredInclude'.
    AuthoredMissing FilePath
  | -- | @include\/@ holds something it may not: the entry, and why.
    AuthoredUnexpected FilePath AuthoredRefusal
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

-- | What a static @package.yaml@ lacks for a target that authors C
-- headers ('loadStatics').
data WiringProblem
  = -- | hpack cannot read the file: its message.
    PackageYamlUnreadable Text
  | -- | No top-level @extra-source-files@ glob matches these authored
    -- headers' package paths, so @cabal sdist@ would drop them.
    HeadersNotShipped [FilePath]
  | -- | @include@ is not among the library's @include-dirs@, through which
    -- the package's own wrapper C includes the authored headers.
    IncludeDirMissing
  deriving stock (Eq, Generic, Show)

-- | Why 'resolveAuthoredInclude' refuses an entry of @include\/@.
data AuthoredRefusal
  = -- | The target authors no headers, so its data directory has no
    -- @include\/@ at all.
    NoAuthoredHeaders
  | -- | An entry of @include\/@ other than the authored root.
    OutsideTheRoot
  | -- | An entry of the authored root the target does not list: another
    -- file, a directory, or a dotfile.
    Unlisted
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
    StaticUnwired path problems ->
      "The package static "
        <> from path
        <> " does not wire in the target's authored C headers (static/ files are copied"
        <> " verbatim, so add what is missing there):"
        <> foldMap (\problem -> "\n  - " <> unwiredText problem) problems
    OverridesLegacy path ->
      "Stale prescriptive spec "
        <> from path
        <> ": the prescriptive spec is one file per header now. Split it into"
        <> " overrides/<header stem>.yaml files, each named like the header's spec artifact"
        <> " (SDL_main.h is overrides/SDL_main.yaml, pairing with spec/SDL_main.yaml) and holding"
        <> " the version block and only that header's entries"
    OverrideUnexpected path ->
      "Unexpected prescriptive override "
        <> from path
        <> " (overrides/ holds <header stem>.yaml files, nothing else: no subdirectories,"
        <> " no dotfiles, no other extensions)"
    AuthoredMissing path ->
      "Could not find "
        <> from path
        <> " (the target's authored field lists it; its headers live in"
        <> " include/<root>/, one file per listed header)"
    AuthoredUnexpected path refusal ->
      "Unexpected " <> from path <> case refusal of
        NoAuthoredHeaders ->
          " (the target authors no C headers, so its data directory has no include/: list the"
            <> " headers in the target's authored field, or delete it)"
        OutsideTheRoot ->
          " (include/ holds the authored headers' root directory, nothing else)"
        Unlisted ->
          " (the authored root holds exactly the headers the target's authored field lists:"
            <> " no other files, no directories, no dotfiles)"
    TargetInvalid key problems ->
      "target "
        <> from key
        <> " is invalid:"
        <> foldMap (\problem -> "\n  - " <> from problem) problems
    DataDirUnresolved err -> displayBuilder err
   where
    unwiredText = \case
      PackageYamlUnreadable err -> "hpack cannot read it: " <> from err
      HeadersNotShipped paths ->
        "no extra-source-files glob matches "
          <> intercalateTB ", " (map from paths)
          <> " (cabal sdist would drop them; list include/*/*.h)"
      IncludeDirMissing ->
        "the library's include-dirs lacks include (the wrapper C includes the headers through it)"

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
  , unbound :: FilePath
  -- ^ @unbound.json@ (required): the skip ledger's dispositions
  -- ("Lithon.Codegen.Bindgen.Unbound").
  , static :: FilePath
  -- ^ @static\/@: the package's hand-written root files ('loadStatics').
  , overrides :: Map FilePath FilePath
  -- ^ The prescriptive binding specs ('discoverOverrides'): file name in
  -- @overrides\/@ (@SDL_main.yaml@) to its absolute path. Empty when the
  -- directory is absent.
  , include :: Maybe FilePath
  -- ^ @include\/@, the directory holding the authored headers' root
  -- ('resolveAuthoredInclude'), when the target authors any: an include
  -- directory of every hs-bindgen run.
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
      unbound = dataDir </> registryFile UnboundJson
      static = dataDir </> "static"
      name = target.displayName

  assertFileExists versions (RegistryMissing VersionsJson)
  assertFileExists aliases (RegistryMissing AliasesJson)
  assertFileExists constants (RegistryMissing ConstantsJson)
  assertFileExists unbound (RegistryMissing UnboundJson)

  overrides <- discoverOverrides dataDir
  include <- resolveAuthoredInclude target dataDir

  pkgDbEntry <-
    noteErrM (PkgConfigMissing name target.pkgConfig <$> getPkgMetaDb)
      =<< getPkgDbEntry target.pkgConfig

  PkgVarValue includeDirVar <-
    noteErr (IncludeDirUnset name target.pkgConfig (HM.keys pkgDbEntry.vars))
      . join
      =<< getPkgVar target.pkgConfig "includedir"
  let includeDir = from includeDirVar

  PkgVersion libraryVersion <- noteErr (VersionUnknown name) pkgDbEntry.version

  let paths = BindgenPaths{dataDir, versions, aliases, constants, unbound, static, overrides, include}
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
--
-- - The include directories are the library's and, when the target authors
-- headers, theirs.
invocationEnv :: BindgenTarget -> BindgenEnv -> HB.InvocationEnv
invocationEnv target env =
  HB.InvocationEnv
    { extraIncludeDirs = env.includeDir : maybeToList env.paths.include
    , defineMacros = map defineMacro target.parse.defines
    , doxygenAliases = target.parse.doxygenAliases
    , fieldNaming = HB.OmitFieldPrefixes
    , uniqueId = toString target.packageName
    , verbosity = HB.Normal
    }

-- | The target's generation run: the shared invocation environment plus
-- the per-header prescriptive overrides, when present.
driverOpts :: BindgenTarget -> BindgenEnv -> DriverOpts
driverOpts target env =
  DriverOpts
    { invocationEnv = invocationEnv target env
    , prescriptiveSpecs = env.paths.overrides
    , packageInfo =
        PackageInfo
          { name = target.packageName
          , dataDir = env.paths.dataDir
          , version = Nothing
          }
    }

-- | Find the target's prescriptive binding specs: the @.yaml@ files of
-- @data\/\<key\>\/overrides\/@, keyed by file name, each valued by its
-- absolute path. A file is named like the spec artifact of the header it
-- applies to (@overrides\/SDL_main.yaml@ pairs with @spec\/SDL_main.yaml@),
-- and the driver passes it to that header's invocation alone. An absent
-- directory is no overrides.
--
-- Anything else is an error rather than a guess: a stale single-file
-- @overrides.yaml@ ('OverridesLegacy'), and in @overrides\/@ (or in its
-- place) a subdirectory, a dotfile, or a file without the @.yaml@ extension
-- ('OverrideUnexpected'). Whether each file names a bound header is the
-- driver's check, once it has planned the headers.
discoverOverrides
  :: (FileSystem :> es, Log :> es, Error BindgenResolutionError :> es)
  => FilePath -> Eff es (Map FilePath FilePath)
discoverOverrides dataDir = do
  whenFileExists
    (dataDir </> "overrides.yaml")
    (throwError (OverridesLegacy (dataDir </> "overrides.yaml")))
  whenFileExists dir (throwError (OverrideUnexpected dir))
  withDirectoryExists dir \case
    False -> pure Map.empty
    True -> do
      entries <- sort <$> listDirectory dir
      for_ entries \entry -> do
        isDirectory <- doesDirectoryExist (dir </> entry)
        when (isDirectory || not (isOverrideName entry)) do
          throwError (OverrideUnexpected (dir </> entry))
      unless (null entries) do
        logInfo ("using prescriptive overrides" :# ["files" .= entries])
      pure (Map.fromList [(entry, dir </> entry) | entry <- entries])
 where
  dir = dataDir </> "overrides"
  isOverrideName entry = not ("." `isPrefixOf` entry) && takeExtension entry == ".yaml"

-- | Find the target's authored headers: @data\/\<key\>\/include\/@
-- when the target authors any ('authored'), which then holds the
-- authored root and nothing else, and the root exactly the listed files.
-- A target that authors none has no @include\/@.
--
-- Anything else is an error rather than a guess: a listed header (or the
-- root) that is absent ('AuthoredMissing'), and an @include\/@ the target
-- does not author, another entry beside the root, or an unlisted file,
-- directory, or dotfile in the root ('AuthoredUnexpected').
resolveAuthoredInclude
  :: (FileSystem :> es, Log :> es, Error BindgenResolutionError :> es)
  => BindgenTarget -> FilePath -> Eff es (Maybe FilePath)
resolveAuthoredInclude target dataDir = case target.authored of
  Nothing -> do
    exists <- (||) <$> doesDirectoryExist dir <*> doesFileExist dir
    when exists (throwError (AuthoredUnexpected dir NoAuthoredHeaders))
    pure Nothing
  Just authored -> do
    let rootDir = dir </> authored.includeRoot
        listed = map (.file) authored.headers
    assertDirectoryExists rootDir AuthoredMissing
    entries <- sort <$> listDirectory dir
    for_ entries \entry ->
      unless (entry == authored.includeRoot) do
        throwError (AuthoredUnexpected (dir </> entry) OutsideTheRoot)
    files <- sort <$> listDirectory rootDir
    for_ files \entry -> do
      isDirectory <- doesDirectoryExist (rootDir </> entry)
      when (isDirectory || entry `notElem` listed) do
        throwError (AuthoredUnexpected (rootDir </> entry) Unlisted)
    for_ listed \file -> assertFileExists (rootDir </> file) AuthoredMissing
    logInfo ("authored headers" :# ["root" .= authored.includeRoot, "files" .= listed])
    pure (Just dir)
 where
  dir = dataDir </> "include"

-- | The authored headers as the package ships them, verbatim, by path:
-- @include\/\<root\>\/\<file\>@ (generation only; @spec@ never needs
-- them). Empty for a target that authors none.
loadAuthoredHeaders
  :: (FileSystem :> es) => BindgenTarget -> BindgenEnv -> Eff es [(FilePath, Text)]
loadAuthoredHeaders target env = case (target.authored, env.paths.include) of
  (Just authored, Just dir) ->
    for authored.headers \h -> do
      let arg = authored.includeRoot </> h.file
      ("include" </> arg,) . decodeUtf8 <$> EBS.readFile (dir </> arg)
  _none -> pure []

-- | Where a unit's header source is read from: an authored header from the
-- data directory, any other from the library's include directory.
headerSourcePath :: BindgenTarget -> BindgenEnv -> FilePath -> FilePath
headerSourcePath target env basename = case env.paths.include of
  Just dir | isAuthored target basename -> dir </> unitIncludeArg target basename
  _library -> env.includeDir </> includeArg target basename

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
--
-- A target that authors C headers ('authored') ships them in the package
-- and compiles its wrapper C against them, which only its @package.yaml@
-- can say; that is checked here ('StaticUnwired'), not injected, because
-- the statics are copied verbatim. It needs a top-level
-- @extra-source-files@ glob matching every authored header's package path
-- (@include\/\<root\>\/\<file\>@; without one, @cabal sdist@ drops the
-- headers silently), and @include@ among the library's @include-dirs@ (or
-- the top level's, which hpack gives every component).
loadStatics
  :: (IOE :> es, FileSystem :> es, Log :> es, Error BindgenResolutionError :> es)
  => BindgenTarget -> BindgenEnv -> Eff es PackageStatics
loadStatics target env = do
  assertDirectoryExists dir StaticMissing
  entries <- sort <$> listDirectory dir
  for_ entries \entry -> do
    isDirectory <- doesDirectoryExist (dir </> entry)
    whenJust (refusal isDirectory entry) (throwError . StaticUnexpected (dir </> entry))
  packageYaml <- required "package.yaml"
  whenJust target.authored \authored -> do
    let path = dir </> "package.yaml"
    liftIO (Hpack.decodeYaml path) >>= \case
      Left err -> throwError (StaticUnwired path (PackageYamlUnreadable (toText err) :| []))
      Right (_warnings, value) ->
        whenJust (nonEmpty (authoredWiringProblems authored value)) (throwError . StaticUnwired path)
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

-- | What a static @package.yaml@ (as YAML) lacks for the authored headers:
-- see 'loadStatics'.
authoredWiringProblems :: AuthoredHeaders -> A.Value -> [WiringProblem]
authoredWiringProblems authored value =
  [HeadersNotShipped unshipped | not (null unshipped)]
    <> [IncludeDirMissing | "include" `notElem` map dirName includeDirs]
 where
  unshipped =
    [ path
    | h <- authored.headers
    , let path = "include" </> authored.includeRoot </> h.file
    , not (any (`globMatches` path) (stringsAt ["extra-source-files"]))
    ]
  includeDirs = stringsAt ["include-dirs"] <> stringsAt ["library", "include-dirs"]
  dirName = dropTrailingPathSeparator . normalise
  -- hpack takes a single string or a list of them.
  stringsAt fieldPath = case lookupPath fieldPath value of
    Just (A.String s) -> [toString s]
    Just (A.Array xs) -> [toString s | A.String s <- toList xs]
    _other -> []
  lookupPath [] v = Just v
  lookupPath (k : ks) (A.Object o) = KM.lookup (Key.fromText k) o >>= lookupPath ks
  lookupPath _ _ = Nothing

-- | Whether a glob matches a relative path the way hpack expands
-- @extra-source-files@, for the syntax the statics use: @*@ and @?@ within
-- one path component, and a @**@ component for any number of components.
globMatches :: FilePath -> FilePath -> Bool
globMatches glob path = components (splitDirectories glob) (splitDirectories path)
 where
  components ("**" : gs) ps = any (components gs) (L.tails ps)
  components (g : gs) (p : ps) = component g p && components gs ps
  components gs ps = null gs && null ps
  component ('*' : g) p = any (component g) (L.tails p)
  component ('?' : g) (_ : p) = component g p
  component (c : g) (x : p) = c == x && component g p
  component g p = null g && null p

-- | The root license files the generator stages in every package itself:
-- lithon's own (@LICENSE@, "Lithon.Codegen.Backend.Package.RootFiles")
-- and the vendored runtimes' ("Lithon.Codegen.Bindgen.Package"). A static by
-- one of these names would collide with it.
reservedLicenses :: [FilePath]
reservedLicenses = ["LICENSE", "LICENSE_hs-bindgen-runtime", "LICENSE_c-expr-runtime"]
