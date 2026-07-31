{-# LANGUAGE OverloadedStrings #-}

-- | The @len=@ / @altlen=@ attribute grammars.
--
-- @len=@ is a comma-separated list with one entry per pointer indirection
-- level (e.g. @len=\"enabledExtensionCount,null-terminated\"@ for
-- @const char* const*@). Entries are: a member/parameter name, a
-- @->@-joined member path, @null-terminated@, an integer constant, or a
-- @latexmath:[…]@ formula (whose plain-C twin arrives via @altlen=@).
-- Commas inside @latexmath:[…]@ brackets do not split levels.
module Lithon.Codegen.Vulkan.Registry.Micro.Len (
  LenLevel (..),
  LenSpec (..),
  AltLen (..),
  parseLen,
  parseAltLen,
) where

import Data.Aeson (ToJSON)
import Data.Char (isDigit)
import Data.List.NonEmpty qualified as NE
import Data.Text qualified as T
import Lithon.Prelude

data LenLevel
  = LenNullTerminated
  | -- | A literal level like the @1@ in @len="geometryCount,1"@.
    LenConst !Integer
  | -- | A name or @->@-joined path into a sibling, e.g.
    -- @pAllocateInfo->descriptorSetCount@ (entities already decoded).
    LenPath !(NonEmpty Text)
  | -- | @latexmath:[…]@, kept raw; @altlen=@ carries the computable form.
    LenLatex !Text
  | -- | Registry-permitted free text we do not model further (kept raw).
    LenOther !Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

newtype LenSpec = LenSpec (NonEmpty LenLevel)
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | @altlen=@: comma-separated plain C expressions, one per level, kept raw
-- (they are input to later codegen, not to this parser).
newtype AltLen = AltLen (NonEmpty Text)
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

parseLen :: Text -> Either Text LenSpec
parseLen input = do
  levels <- splitLevels input
  LenSpec <$> traverse parseLevel levels

parseAltLen :: Text -> Either Text AltLen
parseAltLen input = AltLen <$> splitLevels input

parseLevel :: Text -> Either Text LenLevel
parseLevel level
  | level == "null-terminated" = Right LenNullTerminated
  | T.all isDigit level
  , Just n <- readMaybe (T.unpack level) =
      Right (LenConst n)
  | "latexmath:[" `T.isPrefixOf` level
  , "]" `T.isSuffixOf` level =
      Right (LenLatex level)
  | Just path <- NE.nonEmpty (T.splitOn "->" level)
  , all isIdent path =
      Right (LenPath path)
  | otherwise = Right (LenOther level)
 where
  isIdent t = not (T.null t) && T.all (\c -> c == '_' || c `elem` alnum) t
  alnum = ['a' .. 'z'] <> ['A' .. 'Z'] <> ['0' .. '9']

-- | Split on top-level commas only: commas inside @[…]@ (latexmath) or
-- @(…)@ (altlen arithmetic) do not separate levels.
splitLevels :: Text -> Either Text (NonEmpty Text)
splitLevels input
  | T.null input = Left "empty length specification"
  | otherwise = do
      pieces <- go 0 "" (T.unpack input)
      case NE.nonEmpty pieces of
        Nothing -> Left "empty length specification"
        Just ne
          | any T.null ne -> Left "empty level in length specification"
          | otherwise -> Right ne
 where
  go :: Int -> Text -> String -> Either Text [Text]
  go depth acc = \case
    []
      | depth /= 0 -> Left "unbalanced brackets in length specification"
      | otherwise -> Right [acc]
    c : rest
      | c == '[' || c == '(' -> go (depth + 1) (T.snoc acc c) rest
      | c == ']' || c == ')' ->
          if depth == 0 then
            Left "unbalanced brackets in length specification"
          else
            go (depth - 1) (T.snoc acc c) rest
      | c == ',' && depth == 0 -> (acc :) <$> go 0 "" rest
      | otherwise -> go depth (T.snoc acc c) rest

instance Display LenSpec where
  displayBuilder = displayBuilder . renderLen

renderLen :: LenSpec -> Text
renderLen (LenSpec levels) = T.intercalate "," (map renderLevel (NE.toList levels))
 where
  renderLevel = \case
    LenNullTerminated -> "null-terminated"
    LenConst n -> show n
    LenPath path -> T.intercalate "->" (NE.toList path)
    LenLatex t -> t
    LenOther t -> t

instance Display AltLen where
  displayBuilder = displayBuilder . renderAltLen

renderAltLen :: AltLen -> Text
renderAltLen (AltLen levels) = T.intercalate "," (NE.toList levels)
