{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The package statics as generation reads them from
-- @data\/\<key\>\/static\/@: the committed SDL set loads with its one
-- license, every file beyond the three required ones is a license staged
-- by name, and a malformed directory fails loudly (a missing required
-- file, a subdirectory, a dotfile, no directory at all).
module Sys.StaticsTest (
  unit_sdl3StaticsLoad,
  unit_staticsLicensesAreTheRest,
  unit_staticsRejectMalformed,
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
    createDirectory (dir </> "extra")
    statics dir >>= \case
      Left (StaticUnexpected path) -> takeFileName path @?= "extra"
      other -> assertFailure ("expected the subdirectory rejected, got " <> shown other)
  withStatics [(".DS_Store", "")] \dir -> do
    loaded <- statics dir
    case loaded of
      Left (StaticUnexpected path) -> takeFileName path @?= ".DS_Store"
      other -> assertFailure ("expected the dotfile rejected, got " <> shown other)
  withSystemTempDirectory "lithon-statics" \dir -> do
    loaded <- statics (dir </> "static")
    case loaded of
      Left (StaticMissing path) -> takeFileName path @?= "static"
      other -> assertFailure ("expected the directory missing, got " <> shown other)
 where
  shown = either show (const "the statics loaded")
