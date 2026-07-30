{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Shared Haskell-source vocabulary for the emission backend.
--
-- The seed that grows toward a names\/AST\/pretty subtree when a second
-- frontend needs full Haskell rendering (the SDL3 semantic layer); today it
-- holds the Haddock escape the frontends share. Module naming lives in
-- "Lithon.Codegen.Backend.Hs.Module".
module Lithon.Codegen.Backend.Hs (
  escapeHaddock,
) where

import Data.Text qualified as T
import Lithon.Prelude

-- | Backslash-escape every character Haddock treats as markup, and fold
-- newlines to spaces so a comment can never escape its line.
escapeHaddock :: Text -> Text
escapeHaddock = T.concatMap esc
 where
  esc c
    | c == '\n' || c == '\r' = " "
    | c `elem` ("\\/'`\"@<>$#*&[]{}" :: String) = T.pack ['\\', c]
    | otherwise = T.singleton c
