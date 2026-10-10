{-# LANGUAGE OverloadedStrings #-}

-- | The prescriptive specs as generation discovers them in
-- @data\/\<key\>\/overrides\/@: no directory is no overrides, every
-- @.yaml@ file is one (keyed by file name, valued by its absolute path),
-- and anything else fails loudly — a stale single-file @overrides.yaml@, a
-- subdirectory, a dotfile, a file without the @.yaml@ extension, a file
-- where the directory belongs.
module Bindgen.OverridesTest (
  unit_noOverridesDirectoryIsNoOverrides,
  unit_overridesAreKeyedByFileName,
  unit_legacyOverridesFileRefused,
  unit_strangersInOverridesRefused,
) where

import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Effectful (runEff)
import Effectful.Error.Dynamic (runErrorNoCallStack)
import Lithon.Effect.FileSystem (runFileSystem)
import Lithon.Effect.Log (runLog)
import Lithon.Prelude
import System.Directory (createDirectory, createDirectoryIfMissing)
import System.FilePath (takeDirectory, takeFileName, (</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Bindgen.Env (BindgenResolutionError (..), discoverOverrides)

discovered :: FilePath -> IO (Either BindgenResolutionError (Map FilePath FilePath))
discovered dataDir =
  runEff . runLog "overrides-test" . runFileSystem . runErrorNoCallStack $ discoverOverrides dataDir

-- | A fresh data directory holding the given files (parents created).
withData :: [(FilePath, Text)] -> (FilePath -> IO a) -> IO a
withData files k = withSystemTempDirectory "lithon-overrides" \dir -> do
  for_ files \(name, contents) -> do
    createDirectoryIfMissing True (takeDirectory (dir </> name))
    TIO.writeFile (dir </> name) contents
  k dir

shown :: Either BindgenResolutionError (Map FilePath FilePath) -> String
shown = either show (\found -> "found " <> show (Map.keys found))

unit_noOverridesDirectoryIsNoOverrides :: IO ()
unit_noOverridesDirectoryIsNoOverrides = do
  withData [] \dir -> either (assertFailure . show) (@?= Map.empty) =<< discovered dir
  -- An empty directory is the same.
  withData [] \dir -> do
    createDirectory (dir </> "overrides")
    either (assertFailure . show) (@?= Map.empty) =<< discovered dir

unit_overridesAreKeyedByFileName :: IO ()
unit_overridesAreKeyedByFileName =
  withData
    [("overrides/SDL_stdinc.yaml", "x"), ("overrides/SDL_main.yaml", "y"), ("versions.json", "{}")]
    \dir -> do
      found <- either (assertFailure . show) pure =<< discovered dir
      found
        @?= Map.fromList
          [ ("SDL_main.yaml", dir </> "overrides" </> "SDL_main.yaml")
          , ("SDL_stdinc.yaml", dir </> "overrides" </> "SDL_stdinc.yaml")
          ]

-- | The single-file layout this replaces is refused, with the way out in
-- the message, even when the directory is there too.
unit_legacyOverridesFileRefused :: IO ()
unit_legacyOverridesFileRefused = do
  refused []
  refused [("overrides/SDL_main.yaml", "x")]
 where
  refused extras = withData (("overrides.yaml", "ctypes: []") : extras) \dir ->
    discovered dir >>= \case
      Left err@(OverridesLegacy path) -> do
        takeFileName path @?= "overrides.yaml"
        assertBool
          ("the message says how to split it:\n" <> toString (display err))
          ("overrides/<header stem>.yaml" `T.isInfixOf` display err)
      other -> assertFailure ("expected the legacy file refused, got " <> shown other)

-- | Everything in @overrides\/@ that is not a @.yaml@ file is refused
-- rather than skipped, so a typo cannot hide an override; the same for a
-- file standing where the directory belongs.
unit_strangersInOverridesRefused :: IO ()
unit_strangersInOverridesRefused = do
  refusedFile "overrides/README.md"
  refusedFile "overrides/SDL_main.yml"
  refusedFile "overrides/SDL_main.yaml~"
  refusedFile "overrides/SDL_main.yaml.orig"
  refusedFile "overrides/.hidden.yaml"
  refusedFile "overrides/.yaml"
  refusedFile "overrides"
  withData [("overrides/SDL_main.yaml", "x")] \dir -> do
    createDirectory (dir </> "overrides" </> "nested.yaml")
    discovered dir >>= \case
      Left err@(OverrideUnexpected path) -> do
        takeFileName path @?= "nested.yaml"
        assertBool
          ("the message says what overrides/ holds:\n" <> toString (display err))
          ("holds <header stem>.yaml files" `T.isInfixOf` display err)
      other -> assertFailure ("expected the subdirectory refused, got " <> shown other)
 where
  refusedFile name = withData [(name, "x")] \dir ->
    discovered dir >>= \case
      Left (OverrideUnexpected path) -> takeFileName path @?= takeFileName name
      other -> assertFailure (name <> ": expected it refused, got " <> shown other)
