{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- |
-- Tiny helper module for querying the C environment. All queries on the C
-- environment should live here unless there's a good reason not to do so.
--
-- Currently only queries @pkg-config@.
module Lithon.Effect.ClangEnv (
  -- * Data structures
  ClangEnvError (..),
  PkgMetaDb (..),
  lookupPkgMeta,
  PkgDb (..),
  lookupPkg,
  PkgDbEntry (..),
  PkgName (..),
  PkgVarName (..),
  PkgVarValue (..),
  PkgVersion (..),

  -- * Effect
  ClangEnv,
  runClangEnv,
  getPkgMetaDb,
  getPkgDbEntry,
  getPkgVersion,
  getPkgVar,
) where

import Control.Lens (both)
import Data.Aeson qualified as A
import Data.HashMap.Strict qualified as HM
import Data.Tagged (Tagged (Tagged, unTagged))
import Data.Text qualified as T
import Effectful
import Effectful.Dispatch.Dynamic (reinterpret, send)
import Effectful.Error.Dynamic (Error, throwError)
import Effectful.FileSystem (FileSystem, findExecutable)
import Effectful.Reader.Dynamic (ask, asks, runReader)
import Effectful.State.Dynamic

import Lithon.Effect.Log
import Lithon.Prelude

pkgconfig :: (IsString a) => a
pkgconfig = "pkg-config"

data ClangEnvError
  = PkgConfigNotAvailableError
  | PkgConfigInvokeError Text
  | MalformedPkgEntry Text
  deriving stock (Show)

instance Display ClangEnvError where
  displayBuilder = \case
    PkgConfigNotAvailableError -> "Could not find " <> pkgconfig <> " on the PATH"
    PkgConfigInvokeError t -> "failed invoking " <> pkgconfig <> ": " <> from t
    MalformedPkgEntry t -> "malformed " <> pkgconfig <> " entry: " <> from t

newtype PkgMetaDb = PkgMetaDb
  {db :: HashMap PkgName (Tagged "description" (Maybe Text))}
  deriving stock (Generic, Show)
  deriving newtype (NFData)
  deriving anyclass (A.ToJSON)

instance Display PkgMetaDb where
  displayBuilder (PkgMetaDb db) =
    intercalateTB "\n"
      . map (\(n, Tagged d) -> "  " <> displayBuilder n <> " - " <> displayBuilder d)
      . HM.toList
      $ db

readPkgMeta :: (IOE :> es, Error ClangEnvError :> es) => Eff es PkgMetaDb
readPkgMeta = do
  pkgLines <- nubOrd . lines <$> runPkgconfig ["--list-all"]
  PkgMetaDb . HM.fromList <$> wither splitName pkgLines
 where
  splitName l = case over both T.strip $ T.breakOn " " l of
    ("", "") -> pure Nothing
    ("", d) ->
      throwError $ MalformedPkgEntry ("got a package with no name, but with description: " <> quoted d)
    (n, "") -> pure $ Just (PkgName n, Tagged Nothing)
    (n, d) -> pure $ Just (PkgName n, Tagged (Just d))

lookupPkgMeta :: PkgName -> PkgMetaDb -> Maybe (Tagged "description" (Maybe Text))
lookupPkgMeta n (PkgMetaDb db) = HM.lookup n db

newtype PkgDb = PkgDb
  {db :: HashMap PkgName (Maybe PkgDbEntry)}
  deriving stock (Generic, Show)
  deriving newtype (NFData)
  deriving anyclass (A.ToJSON)

lookupPkg :: PkgName -> PkgDb -> Maybe (Maybe PkgDbEntry)
lookupPkg n (PkgDb db) = HM.lookup n db

insertPkg :: PkgName -> Maybe PkgDbEntry -> PkgDb -> PkgDb
insertPkg n e = coerce (HM.insert n e)

instance Default PkgDb where
  def = PkgDb mempty

data PkgDbEntry = PkgDbEntry
  { name :: PkgName
  , description :: Maybe Text
  , version :: Maybe PkgVersion
  , vars :: HashMap PkgVarName PkgVarValue
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON, NFData)

readPkgDbEntry
  :: (IOE :> es, Error ClangEnvError :> es) => PkgName -> Maybe Text -> Eff es PkgDbEntry
readPkgDbEntry name description = do
  let PkgName n = name

  versionOut <- runPkgconfig ["--modversion", n]
  let version = case versionOut of
        "" -> Nothing
        _ -> Just (PkgVersion versionOut)

  varNames <- nubOrd . words <$> runPkgconfig ["--print-variables", n]

  vars <-
    fromList <$> forMaybe varNames \varName -> do
      value <- runPkgconfig ["--variable=" <> varName, n]
      case value of
        "" -> pure Nothing
        _ -> pure $ Just (PkgVarName varName, PkgVarValue value)

  pure PkgDbEntry{..}

newtype PkgName = PkgName {name :: Text}
  deriving stock (Generic, Show)
  deriving newtype (A.ToJSON, A.ToJSONKey, Eq, Hashable, IsString, NFData, Ord)
  deriving (Display) via (DisplayFrom "pkg-config package" Text)

newtype PkgVarName = PkgVarName {name :: Text}
  deriving stock (Generic, Show)
  deriving newtype (A.ToJSON, A.ToJSONKey, Eq, Hashable, IsString, NFData, Ord)
  deriving (Display) via (DisplayFrom "pkg-config variable" Text)

newtype PkgVarValue = PkgVarValue {value :: Text}
  deriving stock (Generic, Show)
  deriving newtype (A.ToJSON, Eq, Hashable, NFData, Ord)
  deriving (Display) via (DisplayFrom "pkg-config var value" Text)

newtype PkgVersion = PkgVersion {version :: Text}
  deriving stock (Generic, Show)
  deriving newtype (A.ToJSON, IsString, NFData)
  deriving (Display) via (DisplayFrom "pkg-config version" Text)

runPkgconfig :: (IOE :> es, Error ClangEnvError :> es) => [Text] -> Eff es Text
runPkgconfig args =
  T.strip
    <$> readProcessStdoutOrError
      ( \cfg icode (ProcessStdout out) (ProcessStderr lerr) ->
          let code = show icode
              cmd = show cfg
              err = show lerr
           in PkgConfigInvokeError
                [trimmingQQ|
                  Failed invoking $pkgconfig!

                  I got exit code $code when invoking: $cmd

                  Stdout:
                    $out

                  Stderr:
                    $err
                |]
      )
      pkgconfig
      args

-- | Clang for C language; not exclusively clang-the-compiler.
data ClangEnv :: Effect where
  GetPkgMetaDb :: ClangEnv m PkgMetaDb
  GetPkgDbEntry :: PkgName -> ClangEnv m (Maybe PkgDbEntry)

type instance DispatchOf ClangEnv = Dynamic

getPkgMetaDb :: (ClangEnv :> es) => Eff es PkgMetaDb
getPkgMetaDb = send GetPkgMetaDb

getPkgDbEntry :: (ClangEnv :> es) => PkgName -> Eff es (Maybe PkgDbEntry)
getPkgDbEntry = send . GetPkgDbEntry

getPkgVersion :: (ClangEnv :> es) => PkgName -> Eff es (Maybe (Maybe PkgVersion))
getPkgVersion n = fmap (.version) <$> getPkgDbEntry n

getPkgVar :: (ClangEnv :> es) => PkgName -> PkgVarName -> Eff es (Maybe (Maybe PkgVarValue))
getPkgVar n v = fmap (HM.lookup v . (.vars)) <$> getPkgDbEntry n

runClangEnv
  :: (IOE :> es, Log :> es, FileSystem :> es, Error ClangEnvError :> es)
  => Eff (ClangEnv : es) a -> Eff es a
runClangEnv eff = do
  guardWithError PkgConfigNotAvailableError . isJust =<< findExecutable pkgconfig
  pkgConfigVer <- runPkgconfig ["--version"]
  logInfo $ "found " <> pkgconfig :# ["version" .= pkgConfigVer]

  logInfo "resolving pkg-config packages"
  pkgs <- readPkgMeta
  logDebug $ "resolved packagedb" :# ["pkgs" .= pkgs]

  reinterpret
    (runReader pkgs . evalStateShared @PkgDb def)
    ( const \case
        GetPkgMetaDb -> ask
        GetPkgDbEntry n -> stateM \db -> case lookupPkg n db of
          Just mentry -> pure (mentry, db)
          Nothing -> do
            mentry <- traverse (readPkgDbEntry n . unTagged) =<< asks (lookupPkgMeta n)
            pure (mentry, insertPkg n mentry db)
    )
    eff
