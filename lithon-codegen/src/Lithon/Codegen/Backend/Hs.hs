{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Shared Haskell-source vocabulary for the emission backend.
--
-- The seed that grows toward a names\/AST\/pretty subtree when a second
-- frontend needs full Haskell rendering (the SDL3 semantic layer); today it
-- holds the module-path type and the Haddock escape the frontends share.
module Lithon.Codegen.Backend.Hs (
  ModulePath (..),
  moduleFilePath,
  moduleNameFilePath,
  escapeHaddock,
) where

import Data.Aeson (ToJSON)
import Data.Text qualified as T

import Lithon.Codegen.Prelude

-- | A dotted Haskell module path, e.g. @Lithon.Core10.Enums.Result@.
newtype ModulePath = ModulePath {dotted :: Text}
  deriving stock (Generic)
  deriving newtype (Display, Eq, NFData, Ord, Show, ToJSON)

-- | @Lithon.Core10.Enums.Result@ -> @src\/Lithon\/Core10\/Enums\/Result.hs@.
moduleFilePath :: ModulePath -> FilePath
moduleFilePath p = moduleNameFilePath p.dotted

-- | The raw-'Text' worker behind 'moduleFilePath', for frontends whose
-- module names never pass through 'ModulePath' (hs-bindgen mangled names).
moduleNameFilePath :: Text -> FilePath
moduleNameFilePath name = toString ("src/" <> T.replace "." "/" name <> ".hs")

-- | Backslash-escape every character Haddock treats as markup, and fold
-- newlines to spaces so a comment can never escape its line.
escapeHaddock :: Text -> Text
escapeHaddock = T.concatMap esc
 where
  esc c
    | c == '\n' || c == '\r' = " "
    | c `elem` ("\\/'`\"@<>$#*&[]{}" :: String) = T.pack ['\\', c]
    | otherwise = T.singleton c
