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
import Lithon.Codegen.Sys.Target (SysTarget (..))

-- | Why a target's generation environment could not be resolved. The
-- 'Text' fields carry the target's display name, for the messages.
data SysResolutionError
  = PkgConfigMissing Text PkgMetaDb
  | IncludeDirUnset Text PkgName [PkgVarName]
  | VersionUnknown Text
  | VersionsRegistryMissing Text FilePath
  | AliasesRegistryMissing Text FilePath
  | ConstantsRegistryMissing Text FilePath
  | -- | The target record itself is malformed (its key, the problems).
    TargetInvalid Text [Text]
  | DataDirUnresolved DataDirError
  deriving stock (Generic, Show)

instance From DataDirError SysResolutionError where
  from = DataDirUnresolved

instance Display SysResolutionError where
  displayBuilder = \case
    PkgConfigMissing name db ->
      let dbd = display db
       in from
            [trimmingQQ| 
              $name does not appear to be resolvable from pkg-config.

              Here's what I got found with `pkg-config --list-all`:

                $dbd
            |]
    IncludeDirUnset name pkg vars ->
      let varsd = from $ intercalateTB "\n" (map displayBuilder vars)
          whose = name <> "'s"
          pkgd = pkg.name
       in from
            [trimmingQQ|
              Could not find $whose include dir under the expected variable.

              Here are the variables I found for $pkgd:
              $varsd
            |]
    VersionUnknown name -> "Could not determine " <> from name <> " version from pkg-config!"
    VersionsRegistryMissing name path ->
      "Could not find " <> from name <> " versions registry at: " <> from path
    AliasesRegistryMissing name path ->
      "Could not find " <> from name <> " aliases registry at: " <> from path
    ConstantsRegistryMissing name path ->
      "Could not find " <> from name <> " constants registry at: " <> from path
    TargetInvalid key problems ->
      "target "
        <> from key
        <> " is invalid:"
        <> foldMap (\problem -> "\n  - " <> from problem) problems
    DataDirUnresolved err -> displayBuilder err

-- | The resolved generation environment: where the target's headers live
-- and which library version they belong to.
--
-- hs-bindgen additionally honors @BINDGEN_EXTRA_CLANG_ARGS@ from the environment
-- on top of this.
data SysEnv = SysEnv
  { includeDir :: FilePath
  -- ^ The directory containing the target's include root (@SDL3\/@;
  -- passed as @-I@).
  , libraryVersion :: Text
  -- ^ @pkg-config --modversion \<pkgConfig\>@.
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

-- | Resolve the target's environment: its data directory
-- (@data\/\<key\>\/@) and registries, and its headers and version through
-- @pkg-config@.
runSysGen
  :: ( IOE :> es
     , Log :> es
     , ClangEnv :> es
     , FileSystem :> es
     , Error SysResolutionError :> es
     )
  => SysTarget -> Eff (SysGen : es) a -> Eff es a
runSysGen target eff = do
  dataDir <- runErrorFrom @DataDirError $ targetDataDir (toString target.key)
  let versionsRegistryPath = dataDir </> "versions.json"
      aliasesRegistryPath = dataDir </> "aliases.json"
      constantsRegistryPath = dataDir </> "constants.json"
      name = target.displayName

  assertFileExists versionsRegistryPath (VersionsRegistryMissing name)
  assertFileExists aliasesRegistryPath (AliasesRegistryMissing name)
  assertFileExists constantsRegistryPath (ConstantsRegistryMissing name)

  overridesRegistryPath <- do
    let path = dataDir </> "overrides.yaml"
    exists <- doesFileExist path
    if exists then
      Just path <$ logInfo ("using prescriptive overrides" :# ["path" .= path])
    else
      pure Nothing

  pkgDbEntry <- noteErrM (PkgConfigMissing name <$> getPkgMetaDb) =<< getPkgDbEntry target.pkgConfig

  PkgVarValue includeDirVar <-
    noteErr (IncludeDirUnset name target.pkgConfig (HM.keys pkgDbEntry.vars))
      . join
      =<< getPkgVar target.pkgConfig "includedir"
  let includeDir = from includeDirVar

  PkgVersion libraryVersion <- noteErr (VersionUnknown name) pkgDbEntry.version

  reinterpret
    (runReader @SysEnv SysEnv{..})
    ( const \case
        GetSysEnv -> ask
    )
    eff
