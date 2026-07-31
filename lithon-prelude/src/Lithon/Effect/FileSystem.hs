{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-redundant-constraints #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Effect.FileSystem (
  module Effectful.FileSystem,
  withDirectoryExists,
  whenDirectoryExists,
  unlessDirectoryExists,
  assertDirectoryExists,
  withFileExists,
  whenFileExists,
  unlessFileExists,
  assertFileExists,
  removeDirectoryIfExists,
  listFilesRecursive,
  FilepathResolutionError (..),
  resolveFilepath,
) where

import Effectful
import Effectful.Dispatch.Static (unsafeEff_)
import Effectful.FileSystem
import System.Directory.Extra qualified
import System.FilePath (addTrailingPathSeparator, isAbsolute, isRelative, makeRelative, (</>))

import Lithon.Effect.Error
import Lithon.Prelude
import Lithon.Prelude.Display (Display (..))

withDirectoryExists
  :: (FileSystem :> es)
  => FilePath -> (Bool -> Eff es r) -> Eff es r
withDirectoryExists p f = doesDirectoryExist p >>= f

whenDirectoryExists :: (FileSystem :> es) => FilePath -> Eff es () -> Eff es ()
whenDirectoryExists p f = withDirectoryExists p (`when` f)

unlessDirectoryExists :: (FileSystem :> es) => FilePath -> Eff es () -> Eff es ()
unlessDirectoryExists p f = withDirectoryExists p (`unless` f)

assertDirectoryExists
  :: (HasCallStack, FileSystem :> es, Show e, Error e :> es) => FilePath -> (FilePath -> e) -> Eff es ()
assertDirectoryExists p f = unlessDirectoryExists p (throwError (f p))

withFileExists :: (FileSystem :> es) => FilePath -> (Bool -> Eff es r) -> Eff es r
withFileExists p f = doesFileExist p >>= f

whenFileExists :: (FileSystem :> es) => FilePath -> Eff es () -> Eff es ()
whenFileExists p f = withFileExists p (`when` f)

unlessFileExists :: (FileSystem :> es) => FilePath -> Eff es () -> Eff es ()
unlessFileExists p f = withFileExists p (`unless` f)

assertFileExists
  :: (HasCallStack, FileSystem :> es, Show e, Error e :> es) => FilePath -> (FilePath -> e) -> Eff es ()
assertFileExists p f = unlessFileExists p (throwError (f p))

removeDirectoryIfExists :: (FileSystem :> es) => FilePath -> Eff es ()
removeDirectoryIfExists dir = whenDirectoryExists dir (removeDirectoryRecursive dir)

listFilesRecursive :: (FileSystem :> es) => FilePath -> Eff es [FilePath]
listFilesRecursive = unsafeEff_ . System.Directory.Extra.listFilesRecursive

data FilepathResolutionError = FilepathResolutionError
  { message :: Text
  , source :: FilePath
  , target :: FilePath
  }
  deriving stock (Generic, Show)

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

-- | Resolve a path against a base directory, canonically, refusing targets
-- that escape the base.
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
