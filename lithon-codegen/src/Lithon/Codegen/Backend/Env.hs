{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | The shared codegen environment root: resolving a target's data
-- directory (@data\/\<target\>\/@) absolutely, with an actionable error.
--
-- lithon-codegen declares @data-dir: data@ with no @data-files:@ — the tool
-- runs in-repo via @cabal run@ (which points the datadir at the source
-- tree); an installed binary's datadir is empty by design.
module Lithon.Codegen.Backend.Env (
  DataDirError (..),
  targetDataDir,
) where

import Data.Aeson qualified as A
import Effectful (Eff, IOE, (:>))
import Effectful.Error.Dynamic (Error)
import Lithon.Effect.FileSystem (FileSystem, assertDirectoryExists, makeAbsolute)
import Lithon.Prelude
import System.FilePath ((</>))

import Paths_lithon_codegen qualified

newtype DataDirError = TargetDataDirMissing FilePath
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON, Exception)

instance Display DataDirError where
  displayBuilder = \case
    TargetDataDirMissing path ->
      "codegen data directory not found at "
        <> show path
        <> ". lithon-codegen declares no data-files: and must run in-repo via"
        <> " `cabal run lithon-codegen`, or with lithon_codegen_datadir"
        <> " pointing at lithon-codegen/data."

-- | The absolute, existence-asserted @data\/\<target\>\/@ directory for one
-- binding target (@\"sdl3\"@, @\"vulkan\"@, …).
targetDataDir
  :: (IOE :> es, FileSystem :> es, Error DataDirError :> es)
  => FilePath -> Eff es FilePath
targetDataDir key = do
  dataDir <- liftIO Paths_lithon_codegen.getDataDir
  dir <- makeAbsolute (dataDir </> key)
  assertDirectoryExists dir TargetDataDirMissing
  pure dir
