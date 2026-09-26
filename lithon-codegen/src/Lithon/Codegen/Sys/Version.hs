{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Library versions as the sys pipeline compares and spells them: the
-- vocabulary under the target record ("Lithon.Codegen.Sys.Target"),
-- whose 'Lithon.Codegen.Sys.Target.VersionScheme' says how a version is
-- written in the library's own C, and under the registry
-- ("Lithon.Codegen.Sys.Versions").
module Lithon.Codegen.Sys.Version (
  AbiSince (..),
  renderSince,
  versionArgs,
) where

import Data.Text qualified as T
import Lithon.Prelude

-- | The SDL release a declaration's docs mark it @\@since@.
data AbiSince = AbiSince
  { major :: Int
  , minor :: Int
  , patch :: Int
  }
  deriving stock (Eq, Generic, Ord, Show)

-- | Dotted, as registries and messages spell it: @3.4.0@.
renderSince :: AbiSince -> Text
renderSince v = T.intercalate "." (map show [v.major, v.minor, v.patch])

-- | Comma-separated, as a C version macro takes it: @3, 4, 0@.
versionArgs :: AbiSince -> Text
versionArgs v = T.intercalate ", " (map show [v.major, v.minor, v.patch])
