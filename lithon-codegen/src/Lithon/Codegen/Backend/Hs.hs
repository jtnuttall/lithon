{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Shared Haskell-source vocabulary for the emission backend.
--
-- The seed that grows toward a names\/AST\/pretty subtree when a second
-- frontend needs full Haskell rendering (the SDL3 semantic layer); today it
-- holds the casing\/parenthesization helpers, the reserved-word set, and
-- the Haddock escape the frontends share. Module naming lives in
-- "Lithon.Codegen.Backend.Hs.Module".
module Lithon.Codegen.Backend.Hs (
  capitalize,
  lowerFirst,
  startsUpper,
  parenIfSpaced,
  reservedWords,
  primeReserved,
  escapeHaddock,
) where

import Data.Char qualified as Char
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude

capitalize :: Text -> Text
capitalize t = case T.uncons t of
  Just (c, cs) -> T.cons (Char.toUpper c) cs
  Nothing -> t

lowerFirst :: Text -> Text
lowerFirst t = case T.uncons t of
  Just (c, cs) -> T.cons (Char.toLower c) cs
  Nothing -> t

startsUpper :: Text -> Bool
startsUpper t = maybe False (Char.isUpper . fst) (T.uncons t)

-- | Parenthesize a rendered type or expression iff it contains a space —
-- the emitters' convention for safe splicing into larger source text.
parenIfSpaced :: Text -> Text
parenIfSpaced t = if T.any (== ' ') t then "(" <> t <> ")" else t

-- | Every Haskell reserved word (including the extension-gated ones GHC
-- treats as keywords under the emitters' default-extension sets). One set
-- for every consumer: identifier validation rejects on it, minted-name
-- priming appends @'@ on it.
reservedWords :: Set Text
reservedWords =
  Set.fromList
    [ "case"
    , "class"
    , "data"
    , "default"
    , "deriving"
    , "do"
    , "else"
    , "family"
    , "forall"
    , "foreign"
    , "if"
    , "import"
    , "in"
    , "infix"
    , "infixl"
    , "infixr"
    , "instance"
    , "let"
    , "mdo"
    , "module"
    , "newtype"
    , "of"
    , "pattern"
    , "proc"
    , "rec"
    , "role"
    , "static"
    , "then"
    , "type"
    , "where"
    ]

-- | Prime a minted lower-case name that collides with a reserved word.
primeReserved :: Text -> Text
primeReserved n
  | Set.member n reservedWords = n <> "'"
  | otherwise = n

-- | Backslash-escape every character Haddock treats as markup, and fold
-- newlines to spaces so a comment can never escape its line.
escapeHaddock :: Text -> Text
escapeHaddock = T.concatMap esc
 where
  esc c
    | c == '\n' || c == '\r' = " "
    | c `elem` ("\\/'`\"@<>$#*&[]{}" :: String) = T.pack ['\\', c]
    | otherwise = T.singleton c
