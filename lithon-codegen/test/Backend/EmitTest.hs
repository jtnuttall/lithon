{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Backend.EmitTest (
  unit_syncThenCheckIsFresh,
  unit_checkFlagsDriftAndMissing,
  unit_corruptManifestRefused,
  unit_unsafeManifestPathsRefused,
  unit_shrinkDeletesStale,
  unit_cabalTrackedAndStable,
  unit_stagingCleanedOnFailure,
  unit_unsafeFilesMapKeyRejected,
) where

import Data.Aeson qualified as Aeson
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Effectful (runEff)
import Effectful.Concurrent (runConcurrent)
import Effectful.FileSystem (runFileSystem)
import Lithon.Effect.Error
import Lithon.Effect.Log (runLog)
import Lithon.Prelude
import System.Directory qualified as Dir
import System.FilePath ((</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual, assertFailure)

import Lithon.Codegen.Backend.Emit (
  EmitError,
  EmitStrategy (..),
  EmitTarget (..),
  FormatMode (..),
  Manifest (..),
  emitPackageWith,
  manifestFileName,
 )

-- | Emit always runs with 'SkipFormat': these tests stage into throwaway
-- directories where the fourmolu\/dprint configs are not discoverable, and the
-- staging\/manifest\/check logic under test is independent of formatting.
runEmit :: EmitStrategy -> EmitTarget -> Map FilePath Text -> IO (Either Text ())
runEmit strategy t fs =
  fmap (first snd)
    . runEff
    . runLog "emit-test"
    . runError @Text
    . runErrorDisplay
    . runFileSystem
    . runConcurrent
    $ emitPackageWith SkipFormat strategy t fs

target :: FilePath -> EmitTarget
target out =
  EmitTarget
    { outDir = out
    , manifestMeta = mempty
    , checkOnly = False
    }

twoFiles :: Map FilePath Text
twoFiles =
  Map.fromList
    [ ("src/A.hs", "module A where\n")
    , ("src/B.hs", "module B where\n")
    ]

expectRight :: Either Text () -> Assertion
expectRight = either (assertFailure . toString . ("unexpected failure: " <>)) pure

expectLeftContaining :: [Text] -> Either Text () -> Assertion
expectLeftContaining needles = \case
  Right () -> assertFailure "expected emit to fail"
  Left err ->
    for_ needles \n ->
      assertBool
        (toString ("expected \"" <> n <> "\" in: " <> err))
        (n `T.isInfixOf` err)

readManifest :: FilePath -> IO Manifest
readManifest out = do
  bytes <- LBS.readFile (out </> manifestFileName)
  maybe (assertFailure "manifest does not decode") pure (Aeson.decode bytes)

-- | The round trip: sync writes the tree + manifest; an immediate check
-- reports fresh.
unit_syncThenCheckIsFresh :: Assertion
unit_syncThenCheckIsFresh = withSystemTempDirectory "emit-test" \out -> do
  expectRight =<< runEmit ArtifactsOnly (target out) twoFiles
  m <- readManifest out
  assertEqual "manifest tracks both files" 2 (Map.size m.files)
  expectRight =<< runEmit ArtifactsOnly (target out){checkOnly = True} twoFiles

-- | Check names exactly what drifted: a mutated file and a deleted one.
unit_checkFlagsDriftAndMissing :: Assertion
unit_checkFlagsDriftAndMissing = withSystemTempDirectory "emit-test" \out -> do
  expectRight =<< runEmit ArtifactsOnly (target out) twoFiles
  TIO.writeFile (out </> "src/A.hs") "module A where\n-- drifted\n"
  r1 <- runEmit ArtifactsOnly (target out){checkOnly = True} twoFiles
  expectLeftContaining ["differs: src/A.hs"] r1
  Dir.removeFile (out </> "src/B.hs")
  r2 <- runEmit ArtifactsOnly (target out){checkOnly = True} twoFiles
  expectLeftContaining ["missing from tree: src/B.hs"] r2

-- | A manifest that exists but does not decode is a hard stop, not a
-- silent fresh-tree assumption (stale tracking would turn off).
unit_corruptManifestRefused :: Assertion
unit_corruptManifestRefused = withSystemTempDirectory "emit-test" \out -> do
  expectRight =<< runEmit ArtifactsOnly (target out) twoFiles
  TIO.writeFile (out </> manifestFileName) "{nope"
  r <- runEmit ArtifactsOnly (target out) twoFiles
  expectLeftContaining ["does not decode"] r

-- | Absolute and dot-segment paths in a committed manifest are refused
-- before any deletion, listing every offender — a mangled manifest must
-- not become an arbitrary-delete primitive.
unit_unsafeManifestPathsRefused :: Assertion
unit_unsafeManifestPathsRefused = withSystemTempDirectory "emit-test" \root -> do
  let out = root </> "pkg"
      outside = root </> "outside.txt"
  Dir.createDirectoryIfMissing True out
  TIO.writeFile outside "must survive\n"
  TIO.writeFile (out </> manifestFileName)
    $ "{\"generatorVersion\":\"0\",\"meta\":{},\"files\":"
    <> "{\"/etc/hostname\":\"x\",\"../outside.txt\":\"y\"}}"
  r <- runEmit ArtifactsOnly (target out) twoFiles
  expectLeftContaining ["/etc/hostname", "../outside.txt", "Unsafe output path"] r
  survived <- Dir.doesFileExist outside
  assertBool "file outside the target dir untouched" survived

-- | Shrinking the file set deletes the departed file and the manifest
-- follows.
unit_shrinkDeletesStale :: Assertion
unit_shrinkDeletesStale = withSystemTempDirectory "emit-test" \out -> do
  expectRight =<< runEmit ArtifactsOnly (target out) twoFiles
  expectRight =<< runEmit ArtifactsOnly (target out) (Map.delete "src/B.hs" twoFiles)
  bGone <- Dir.doesFileExist (out </> "src/B.hs")
  assertBool "stale file deleted" (not bGone)
  m <- readManifest out
  assertEqual "manifest tracks the survivor only" ["src/A.hs"] (Map.keys m.files)

-- | The captured cabal is a tracked entry: check catches a hand edit, and
-- a second sync must NOT classify it stale (staleness is judged against
-- emitted entries, not the input map).
unit_cabalTrackedAndStable :: Assertion
unit_cabalTrackedAndStable = withSystemTempDirectory "emit-test" \out -> do
  let files =
        Map.fromList
          [ ("package.yaml", "name: toy\nversion: 0\nlibrary:\n  source-dirs: src\n")
          , ("src/Toy.hs", "module Toy where\n")
          ]
      t = target out
  expectRight =<< runEmit HaskellPackage t files
  cabalExists <- Dir.doesFileExist (out </> "toy.cabal")
  assertBool "cabal written" cabalExists
  m <- readManifest out
  assertBool "cabal tracked in the manifest" (Map.member "toy.cabal" m.files)
  expectRight =<< runEmit HaskellPackage t{checkOnly = True} files
  -- the regression this pins: a second sync used to judge staleness
  -- against the input map and delete the cabal it had just captured
  expectRight =<< runEmit HaskellPackage t files
  stillThere <- Dir.doesFileExist (out </> "toy.cabal")
  assertBool "second sync does not delete the cabal" stillThere
  TIO.appendFile (out </> "toy.cabal") "-- hand edit\n"
  r <- runEmit HaskellPackage t{checkOnly = True} files
  expectLeftContaining ["differs: toy.cabal"] r

-- | A failing emit (cabal capture with no package.yaml anywhere) leaves no
-- .lithon-staging behind.
unit_stagingCleanedOnFailure :: Assertion
unit_stagingCleanedOnFailure = withSystemTempDirectory "emit-test" \out -> do
  r <-
    runEmit
      HaskellPackage
      (target out)
      (Map.fromList [("src/Toy.hs", "module Toy where\n")])
  expectLeftContaining ["package.yaml"] r
  staged <- Dir.doesDirectoryExist (out </> ".lithon-staging")
  assertBool "staging cleaned up on failure" (not staged)

-- | Unsafe keys in the incoming file map are rejected before anything
-- touches disk.
unit_unsafeFilesMapKeyRejected :: Assertion
unit_unsafeFilesMapKeyRejected = withSystemTempDirectory "emit-test" \out -> do
  r <- runEmit ArtifactsOnly (target out) (Map.fromList [("../evil.hs", "boom\n")])
  expectLeftContaining ["Unsafe output path", "../evil.hs"] r
  staged <- Dir.doesDirectoryExist (out </> ".lithon-staging")
  assertBool "no staging created" (not staged)
