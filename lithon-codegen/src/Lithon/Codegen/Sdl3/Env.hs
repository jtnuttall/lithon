{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Codegen.Sdl3.Env (
  SdlResolutionError (..),
  Sdl3Env (..),
  Sdl3Gen,
  getSdl3Env,
  getScratchDirectory,
  runSdl3Gen,
) where

import Control.Monad (join)
import Data.Aeson qualified as A
import Data.HashMap.Strict qualified as HM
import Effectful
import Effectful.Dispatch.Dynamic
import Effectful.Error.Dynamic
import Effectful.Reader.Dynamic
import Lithon.Effect.ClangEnv
import Lithon.Effect.Error (runErrorFrom)
import Lithon.Effect.FileSystem (
  FileSystem,
  assertFileExists,
  doesFileExist,
 )
import Lithon.Effect.Log
import Lithon.Effect.Temporary (SystemTempDir, Temporary, withSystemTempDirectory)
import Lithon.Prelude
import System.FilePath ((</>))

import Lithon.Codegen.Backend.Env (DataDirError, targetDataDir)

data SdlResolutionError
  = Sdl3Missing PkgMetaDb
  | Sdl3IncludeDirUnset [PkgVarName]
  | Sdl3MissingVersion
  | VersionsRegistryMissing FilePath
  | AliasesRegistryMissing FilePath
  | ConstantsRegistryMissing FilePath
  | SdlDataDirError DataDirError
  deriving stock (Generic, Show)

instance From DataDirError SdlResolutionError where
  from = SdlDataDirError

instance Display SdlResolutionError where
  displayBuilder = \case
    Sdl3Missing db ->
      let dbd = display db
       in from
            [trimmingQQ| 
              SDL3 does not appear to be resolvable from pkg-config.

              Here's what I got found with `pkg-config --list-all`:

                $dbd
            |]
    Sdl3IncludeDirUnset vars ->
      let varsd = from $ intercalateTB "\n" (map displayBuilder vars)
       in from
            [trimmingQQ|
              Could not find SDL's include dir under the expected variable.

              Here are the variables I found for sdl:
              $varsd
            |]
    Sdl3MissingVersion -> "Could not determine SDL3 version from pkg-config!"
    VersionsRegistryMissing path -> "Could not find SDL3 versions registry at: " <> from path
    AliasesRegistryMissing path -> "Could not find SDL3 aliases registry at: " <> from path
    ConstantsRegistryMissing path -> "Could not find SDL3 constants registry at: " <> from path
    SdlDataDirError err -> displayBuilder err

-- | The resolved generation environment: where the SDL3 headers live and
-- which SDL version they belong to.
--
-- hs-bindgen additionally honors @BINDGEN_EXTRA_CLANG_ARGS@ from the environment
-- on top of this.
data Sdl3Env = Sdl3Env
  { includeDir :: FilePath
  -- ^ The directory containing @SDL3\/@ (passed as @-I@).
  , sdlVersion :: Text
  -- ^ @pkg-config --modversion sdl3@.
  , pkgDbEntry :: PkgDbEntry
  , scratchDirectory :: SystemTempDir
  , versionsRegistryPath :: FilePath
  , aliasesRegistryPath :: FilePath
  , sdl3SpecDir :: FilePath
  , constantsRegistryPath :: FilePath
  , overridesRegistryPath :: Maybe FilePath
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

data Sdl3Gen :: Effect where
  GetSdl3Env :: Sdl3Gen m Sdl3Env

type instance DispatchOf Sdl3Gen = Dynamic

getSdl3Env :: (Sdl3Gen :> es) => Eff es Sdl3Env
getSdl3Env = send GetSdl3Env

getScratchDirectory :: (Sdl3Gen :> es) => Eff es SystemTempDir
getScratchDirectory = (.scratchDirectory) <$> getSdl3Env

runSdl3Gen
  :: ( IOE :> es
     , Log :> es
     , ClangEnv :> es
     , Temporary :> es
     , FileSystem :> es
     , Error SdlResolutionError :> es
     )
  => Eff (Sdl3Gen : es) a -> Eff es a
runSdl3Gen eff = withSystemTempDirectory "lithon-sdl3-gen-scratch" \scratchDirectory -> do
  sdl3SpecDir <- runErrorFrom @DataDirError $ targetDataDir "sdl3"
  let versionsRegistryPath = sdl3SpecDir </> "versions.json"
      aliasesRegistryPath = sdl3SpecDir </> "aliases.json"
      constantsRegistryPath = sdl3SpecDir </> "constants.json"

  assertFileExists versionsRegistryPath VersionsRegistryMissing
  assertFileExists aliasesRegistryPath AliasesRegistryMissing
  assertFileExists constantsRegistryPath ConstantsRegistryMissing

  overridesRegistryPath <- do
    let path = sdl3SpecDir </> "overrides.yaml"
    exists <- doesFileExist path
    if exists then
      Just path <$ logInfo ("using prescriptive overrides" :# ["path" .= path])
    else
      pure Nothing

  pkgDbEntry <- noteErrM (Sdl3Missing <$> getPkgMetaDb) =<< getPkgDbEntry "sdl3"

  PkgVarValue includeDirVar <-
    noteErr (Sdl3IncludeDirUnset (HM.keys pkgDbEntry.vars)) . join =<< getPkgVar "sdl3" "includedir"
  let includeDir = from includeDirVar

  PkgVersion sdlVersion <- noteErr Sdl3MissingVersion pkgDbEntry.version

  reinterpret
    (runReader @Sdl3Env Sdl3Env{..})
    ( const \case
        GetSdl3Env -> ask
    )
    eff
