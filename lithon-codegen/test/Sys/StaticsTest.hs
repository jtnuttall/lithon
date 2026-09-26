{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The package statics as generation reads them from
-- @data\/\<key\>\/static\/@: the committed SDL set loads with its one
-- license, every file beyond the three required ones is a license staged
-- by name, and a malformed directory fails loudly (a missing required
-- file, a subdirectory, a dotfile, no directory at all, a file that is
-- not a @LICENSE_\<name\>@, a license name the generator stages itself).
module Sys.StaticsTest (
  unit_sdl3StaticsLoad,
  unit_staticsLicensesAreTheRest,
  unit_staticsRejectMalformed,
  unit_staticsRejectNonLicenses,
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

import Lithon.Codegen.Sys.Env (
  PackageStatics (..),
  StaticRefusal (..),
  SysEnv (..),
  SysPaths (..),
  SysResolutionError (..),
  loadStatics,
 )
import Lithon.Codegen.Sys.Target.Sdl3 (sdl3)

sdl3StaticDir :: FilePath
sdl3StaticDir = $(stringE =<< makeRelativeToProject "data/sdl3/static")

-- | 'loadStatics' reads only the static directory; the rest of the
-- environment is inert here.
statics :: FilePath -> IO (Either SysResolutionError PackageStatics)
statics dir =
  runEff . runLog "statics-test" . runFileSystem . runErrorNoCallStack $ loadStatics sdl3 env
 where
  env =
    SysEnv
      { includeDir = "/nonexistent"
      , libraryVersion = "0"
      , pkgDbEntry = PkgDbEntry{name = "none", description = Nothing, version = Nothing, vars = mempty}
      , paths =
          SysPaths
            { dataDir = dir
            , versions = dir </> "versions.json"
            , aliases = dir </> "aliases.json"
            , constants = dir </> "constants.json"
            , static = dir
            , overrides = Nothing
            }
      }

unit_sdl3StaticsLoad :: IO ()
unit_sdl3StaticsLoad = do
  loaded <- either (assertFailure . toString . display) pure =<< statics sdl3StaticDir
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
unit_staticsLicensesAreTheRest = withStatics [("LICENSE_b", "b\n"), ("LICENSE_a", "a\n")] \dir -> do
  loaded <- either (assertFailure . toString . display) pure =<< statics dir
  loaded.licenses @?= [("LICENSE_a", "a\n"), ("LICENSE_b", "b\n")]
  loaded.packageYaml @?= "name: x"

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
-- its own name, so a stray file is refused rather than shipped, and so is
-- a name the generator stages itself (it would collide at the package
-- root); the message says which rule the name broke.
unit_staticsRejectNonLicenses :: IO ()
unit_staticsRejectNonLicenses = do
  refused "README.md~" NotALicense "must be named LICENSE_<name>"
  refused "NOTICE" NotALicense "must be named LICENSE_<name>"
  refused "LICENSE_" NotALicense "must be named LICENSE_<name>"
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
