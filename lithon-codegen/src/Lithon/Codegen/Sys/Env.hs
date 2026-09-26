{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Codegen.Sys.Env (
  SysResolutionError (..),
  SysEnv (..),
  SysGen,
  getSysEnv,
  runSysGen,
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
import Lithon.Prelude
import System.FilePath ((</>))

import Lithon.Codegen.Backend.Env (DataDirError, targetDataDir)

data SysResolutionError
  = PkgConfigMissing PkgMetaDb
  | IncludeDirUnset [PkgVarName]
  | VersionUnknown
  | VersionsRegistryMissing FilePath
  | AliasesRegistryMissing FilePath
  | ConstantsRegistryMissing FilePath
  | DataDirUnresolved DataDirError
  deriving stock (Generic, Show)

instance From DataDirError SysResolutionError where
  from = DataDirUnresolved

instance Display SysResolutionError where
  displayBuilder = \case
    PkgConfigMissing db ->
      let dbd = display db
       in from
            [trimmingQQ| 
              SDL3 does not appear to be resolvable from pkg-config.

              Here's what I got found with `pkg-config --list-all`:

                $dbd
            |]
    IncludeDirUnset vars ->
      let varsd = from $ intercalateTB "\n" (map displayBuilder vars)
       in from
            [trimmingQQ|
              Could not find SDL's include dir under the expected variable.

              Here are the variables I found for sdl:
              $varsd
            |]
    VersionUnknown -> "Could not determine SDL3 version from pkg-config!"
    VersionsRegistryMissing path -> "Could not find SDL3 versions registry at: " <> from path
    AliasesRegistryMissing path -> "Could not find SDL3 aliases registry at: " <> from path
    ConstantsRegistryMissing path -> "Could not find SDL3 constants registry at: " <> from path
    DataDirUnresolved err -> displayBuilder err

-- | The resolved generation environment: where the SDL3 headers live and
-- which SDL version they belong to.
--
-- hs-bindgen additionally honors @BINDGEN_EXTRA_CLANG_ARGS@ from the environment
-- on top of this.
data SysEnv = SysEnv
  { includeDir :: FilePath
  -- ^ The directory containing @SDL3\/@ (passed as @-I@).
  , libraryVersion :: Text
  -- ^ @pkg-config --modversion sdl3@.
  , pkgDbEntry :: PkgDbEntry
  , versionsRegistryPath :: FilePath
  , aliasesRegistryPath :: FilePath
  , dataDir :: FilePath
  , constantsRegistryPath :: FilePath
  , overridesRegistryPath :: Maybe FilePath
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

data SysGen :: Effect where
  GetSysEnv :: SysGen m SysEnv

type instance DispatchOf SysGen = Dynamic

getSysEnv :: (SysGen :> es) => Eff es SysEnv
getSysEnv = send GetSysEnv

runSysGen
  :: ( IOE :> es
     , Log :> es
     , ClangEnv :> es
     , FileSystem :> es
     , Error SysResolutionError :> es
     )
  => Eff (SysGen : es) a -> Eff es a
runSysGen eff = do
  dataDir <- runErrorFrom @DataDirError $ targetDataDir "sdl3"
  let versionsRegistryPath = dataDir </> "versions.json"
      aliasesRegistryPath = dataDir </> "aliases.json"
      constantsRegistryPath = dataDir </> "constants.json"

  assertFileExists versionsRegistryPath VersionsRegistryMissing
  assertFileExists aliasesRegistryPath AliasesRegistryMissing
  assertFileExists constantsRegistryPath ConstantsRegistryMissing

  overridesRegistryPath <- do
    let path = dataDir </> "overrides.yaml"
    exists <- doesFileExist path
    if exists then
      Just path <$ logInfo ("using prescriptive overrides" :# ["path" .= path])
    else
      pure Nothing

  pkgDbEntry <- noteErrM (PkgConfigMissing <$> getPkgMetaDb) =<< getPkgDbEntry "sdl3"

  PkgVarValue includeDirVar <-
    noteErr (IncludeDirUnset (HM.keys pkgDbEntry.vars)) . join =<< getPkgVar "sdl3" "includedir"
  let includeDir = from includeDirVar

  PkgVersion libraryVersion <- noteErr VersionUnknown pkgDbEntry.version

  reinterpret
    (runReader @SysEnv SysEnv{..})
    ( const \case
        GetSysEnv -> ask
    )
    eff
