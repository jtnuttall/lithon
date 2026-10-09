{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The package statics as generation reads them from
-- @data\/\<key\>\/static\/@: the committed SDL set loads with its one
-- license, every file beyond the three required ones is a license staged
-- by name, and a malformed directory fails loudly (a missing required
-- file, a subdirectory, a dotfile, no directory at all, a file that is
-- not a @LICENSE_\<name\>@, a license name the generator stages itself,
-- and for a target that authors C headers, a @package.yaml@ that does not
-- ship or reach them).
module Bindgen.StaticsTest (
  unit_sdl3StaticsLoad,
  unit_staticsLicensesAreTheRest,
  unit_staticsRejectMalformed,
  unit_staticsRejectNonLicenses,
  unit_staticsRejectUnwiredAuthoredHeaders,
) where

import Data.FileEmbed (makeRelativeToProject)
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Effectful (runEff)
import Effectful.Error.Dynamic (runErrorNoCallStack)
import Language.Haskell.TH (stringE)
import Lithon.Effect.ClangEnv (PkgDbEntry (..))
import Lithon.Effect.FileSystem (runFileSystem)
import Lithon.Effect.Log (runLog)
import Lithon.Prelude
import System.Directory (createDirectory, removeFile)
import System.FilePath (takeFileName, (</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Bindgen.Support.Targets (toy2Shims)
import Lithon.Codegen.Bindgen.Env (
  BindgenEnv (..),
  BindgenPaths (..),
  BindgenResolutionError (..),
  PackageStatics (..),
  StaticRefusal (..),
  WiringProblem (..),
  loadStatics,
 )
import Lithon.Codegen.Bindgen.Target (BindgenTarget (..))
import Lithon.Codegen.Bindgen.Target.Sdl3 (sdl3)

sdl3StaticDir :: FilePath
sdl3StaticDir = $(stringE =<< makeRelativeToProject "data/sdl3/static")

-- | 'loadStatics' reads only the static directory; the rest of the
-- environment is inert here. The target authors no C headers, so the
-- @package.yaml@ is only read ('staticsFor' checks the authored case).
statics :: FilePath -> IO (Either BindgenResolutionError PackageStatics)
statics = staticsFor sdl3{authored = Nothing}

staticsFor :: BindgenTarget -> FilePath -> IO (Either BindgenResolutionError PackageStatics)
staticsFor target dir =
  runEff . runLog "statics-test" . runFileSystem . runErrorNoCallStack $ loadStatics target env
 where
  env =
    BindgenEnv
      { includeDir = "/nonexistent"
      , libraryVersion = "0"
      , pkgDbEntry = PkgDbEntry{name = "none", description = Nothing, version = Nothing, vars = mempty}
      , paths =
          BindgenPaths
            { dataDir = dir
            , versions = dir </> "versions.json"
            , aliases = dir </> "aliases.json"
            , constants = dir </> "constants.json"
            , unbound = dir </> "unbound.json"
            , static = dir
            , overrides = mempty
            , include = Nothing
            }
      }

unit_sdl3StaticsLoad :: IO ()
unit_sdl3StaticsLoad = do
  loaded <- either (assertFailure . toString . display) pure =<< staticsFor sdl3 sdl3StaticDir
  map fst loaded.licenses @?= ["LICENSE_SDL"]
  assertBool
    "package.yaml names the package"
    ("name: sdl3-bindgen-sys" `T.isInfixOf` loaded.packageYaml)
  assertBool
    "README.md and CHANGELOG.md are read"
    (not (T.null loaded.readme || T.null loaded.changelog))

-- | Writes the three required files plus the given extras.
withStatics :: [(FilePath, Text)] -> (FilePath -> IO a) -> IO a
withStatics extras k = withSystemTempDirectory "lithon-statics" \dir -> do
  for_
    ([("package.yaml", "name: x"), ("README.md", "# x"), ("CHANGELOG.md", "# Changelog")] <> extras)
    \(name, contents) ->
      TIO.writeFile (dir </> name) contents
  k dir

unit_staticsLicensesAreTheRest :: IO ()
unit_staticsLicensesAreTheRest = withStatics extras \dir -> do
  loaded <- either (assertFailure . toString . display) pure =<< statics dir
  loaded.licenses @?= [("LICENSE_a", "a\n"), ("LICENSE_b", "b\n"), ("LICENSE_c-2_d", "c\n")]
  loaded.packageYaml @?= "name: x"
 where
  -- A license name takes ASCII letters, digits, '_', and '-'.
  extras = [("LICENSE_b", "b\n"), ("LICENSE_c-2_d", "c\n"), ("LICENSE_a", "a\n")]

unit_staticsRejectMalformed :: IO ()
unit_staticsRejectMalformed = do
  withStatics [] \dir -> do
    removeFile (dir </> "README.md")
    statics dir >>= \case
      Left (StaticMissing path) -> takeFileName path @?= "README.md"
      other -> assertFailure ("expected README.md missing, got " <> shown other)
  withStatics [] \dir -> do
    createDirectory (dir </> "LICENSE_extra")
    statics dir >>= \case
      Left (StaticUnexpected path refusal) -> (takeFileName path, refusal) @?= ("LICENSE_extra", NotAFile)
      other -> assertFailure ("expected the subdirectory rejected, got " <> shown other)
  withStatics [(".DS_Store", "")] \dir -> do
    loaded <- statics dir
    case loaded of
      Left (StaticUnexpected path refusal) -> (takeFileName path, refusal) @?= (".DS_Store", NotAFile)
      other -> assertFailure ("expected the dotfile rejected, got " <> shown other)
  withSystemTempDirectory "lithon-statics" \dir -> do
    loaded <- statics (dir </> "static")
    case loaded of
      Left (StaticMissing path) -> takeFileName path @?= "static"
      other -> assertFailure ("expected the directory missing, got " <> shown other)
 where
  shown = either show (const "the statics loaded")

-- | Every file beyond the three required ones is staged as a license under
-- its own name, so a stray file is refused rather than shipped (an editor's
-- backup of a license included), and so is a name the generator stages
-- itself (it would collide at the package root); the message says which
-- rule the name broke.
unit_staticsRejectNonLicenses :: IO ()
unit_staticsRejectNonLicenses = do
  refused "README.md~" NotALicense "must be named LICENSE_<name>"
  refused "NOTICE" NotALicense "must be named LICENSE_<name>"
  refused "LICENSE_" NotALicense "must be named LICENSE_<name>"
  refused "LICENSE_SDL~" NotALicense "a non-empty <name> of ASCII letters, digits, '_', and '-'"
  refused "LICENSE_SDL.orig" NotALicense "a non-empty <name> of ASCII letters, digits, '_', and '-'"
  refused
    "LICENSE"
    ReservedLicense
    "stages LICENSE, LICENSE_hs-bindgen-runtime, LICENSE_c-expr-runtime"
  refused "LICENSE_hs-bindgen-runtime" ReservedLicense "in every package itself"
  refused "LICENSE_c-expr-runtime" ReservedLicense "in every package itself"
 where
  refused name why needle = withStatics [(name, "x\n")] \dir ->
    statics dir >>= \case
      Left err@(StaticUnexpected path refusal) -> do
        (takeFileName path, refusal) @?= (name, why)
        assertBool
          (name <> ": the message says why:\n" <> toString (display err))
          (needle `T.isInfixOf` display err)
      Left err -> assertFailure (name <> ": expected it refused, got " <> toString (display err))
      Right _ -> assertFailure (name <> ": expected it refused, but the statics loaded")

-- | A target that authors C headers ('toy2Shims':
-- @include\/toy2-shims\/toy_thing_shims.h@) ships them and compiles its
-- wrapper C against them, which only its @package.yaml@ can say: an
-- @extra-source-files@ glob matching each (@cabal sdist@ drops them
-- otherwise) and @include@ among the library's @include-dirs@ (or the top
-- level's). The statics are copied verbatim, so one without either is
-- refused, saying what to add, and so is one hpack cannot read.
unit_staticsRejectUnwiredAuthoredHeaders :: IO ()
unit_staticsRejectUnwiredAuthoredHeaders = do
  wired "extra-source-files:\n  - include/*/*.h\nlibrary:\n  include-dirs: include\n"
  wired "extra-source-files: include/**/*.h\ninclude-dirs:\n  - include/\n"
  wired
    "extra-source-files:\n  - include/toy2-shims/toy_thing_shims.h\nlibrary:\n  include-dirs: [cbits, include]\n"
  unwired "library:\n  include-dirs: include\n" [notShipped] "cabal sdist would drop them"
  unwired
    "extra-source-files:\n  - include/*.h\n  - include/other/*.h\nlibrary:\n  include-dirs: include\n"
    [notShipped]
    "no extra-source-files glob matches include/toy2-shims/toy_thing_shims.h"
  unwired
    "extra-source-files:\n  - include/*/*.h\nlibrary:\n  include-dirs: cbits\n"
    [IncludeDirMissing]
    "include-dirs lacks include"
  unwired "name: x\n" [notShipped, IncludeDirMissing] "copied verbatim"
  withStatics [("package.yaml", "name: [x\n")] \dir ->
    staticsFor toy2Shims dir >>= \case
      Left (StaticUnwired _ (PackageYamlUnreadable _ :| [])) -> pass
      other -> assertFailure ("expected the package.yaml unreadable, got " <> shown other)
 where
  notShipped = HeadersNotShipped ["include/toy2-shims/toy_thing_shims.h"]
  wired yaml = withStatics [("package.yaml", yaml)] \dir ->
    staticsFor toy2Shims dir >>= \case
      Right loaded -> loaded.packageYaml @?= yaml
      Left err -> assertFailure (toString yaml <> ": expected it loaded, got " <> toString (display err))
  unwired yaml problems needle = withStatics [("package.yaml", yaml)] \dir ->
    staticsFor toy2Shims dir >>= \case
      Left err@(StaticUnwired path found) -> do
        (takeFileName path, toList found) @?= ("package.yaml", problems)
        assertBool
          (toString yaml <> ": the message says what to add:\n" <> toString (display err))
          (needle `T.isInfixOf` display err)
      other -> assertFailure (toString yaml <> ": expected it refused, got " <> shown other)
  shown = either (toString . display) (const "the statics loaded")
