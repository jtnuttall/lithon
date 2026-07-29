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
  listFilesRecursive,
) where

import Effectful
import Effectful.Dispatch.Static (unsafeEff_)
import Effectful.FileSystem
import System.Directory.Extra qualified

import Lithon.Effect.Error
import Lithon.Prelude

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

listFilesRecursive :: (FileSystem :> es) => FilePath -> Eff es [FilePath]
listFilesRecursive = unsafeEff_ . System.Directory.Extra.listFilesRecursive
