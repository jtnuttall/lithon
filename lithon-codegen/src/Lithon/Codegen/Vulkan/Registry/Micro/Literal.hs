{-# LANGUAGE OverloadedStrings #-}

-- | Value literals as they appear in @value=@ attributes (enums, API
-- constants, extension SPEC_VERSION/EXTENSION_NAME defines) and feature
-- @number=@ versions.
--
-- Encodings are kept literal — no enum arithmetic happens in phase 1 — but
-- the common C forms are classified so later phases get numbers, not text:
-- decimal\/hex integers (@256@, @-1@, @0x00000001@), all-ones complements
-- (@(~0U)@, @(~0ULL)@, @(~1U)@), floats (@1000.0F@), quoted strings
-- (@\"VK_KHR_surface\"@). Anything else lands in 'VExpr' raw — the
-- whole-registry invariant test pins exactly which expressions those are,
-- so new forms surface as test failures rather than silent text.
module Lithon.Codegen.Vulkan.Registry.Micro.Literal (
  ValueLiteral (..),
  ComplementWidth (..),
  parseValueLiteral,
  parseVersion,
  renderVersion,
) where

import Data.Aeson (ToJSON)
import Data.Scientific (FPFormat (Fixed), Scientific, formatScientific)
import Data.Text qualified as T
import Text.Megaparsec (oneOf, takeWhileP, try)
import Text.Megaparsec.Char (char, string)
import Text.Megaparsec.Char.Lexer qualified as L

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.Common (P, viaMegaparsec)

-- | The C bit-width spelled by a complement literal's suffix.
data ComplementWidth
  = -- | @U@ — 32-bit
    CW32
  | -- | @ULL@ — 64-bit
    CW64
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ValueLiteral
  = -- | Decimal or hex integer, possibly negative ('VkResult' error codes).
    VInt !Integer
  | -- | @(~n U|ULL)@ — e.g. @VK_WHOLE_SIZE = (~0ULL)@,
    -- @VK_QUEUE_FAMILY_EXTERNAL = (~1U)@.
    VComplement !Integer !ComplementWidth
  | -- | @1000.0F@-style float (@VK_LOD_CLAMP_NONE@).
    VFloat !Scientific
  | -- | Quoted string (extension name defines); payload unquoted.
    VString !Text
  | -- | Unclassified expression, kept raw.
    VExpr !Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Total for non-empty input: unclassifiable values become 'VExpr'.
parseValueLiteral :: Text -> Either Text ValueLiteral
parseValueLiteral input
  | T.null input = Left "empty value literal"
  | otherwise =
      Right
        . fromMaybe (VExpr input)
        . foldr firstSuccess Nothing
        $ [ viaMegaparsec stringLitP input
          , viaMegaparsec complementP input
          , viaMegaparsec floatP input
          , viaMegaparsec intP input
          ]
 where
  firstSuccess (Right v) _ = Just v
  firstSuccess (Left _) acc = acc

stringLitP :: P ValueLiteral
stringLitP = VString <$> (char '"' *> takeWhileP (Just "string body") (/= '"') <* char '"')

complementP :: P ValueLiteral
complementP = do
  _ <- string "(~"
  n <- L.decimal
  width <- (CW64 <$ string "ULL") <|> (CW32 <$ string "U")
  _ <- char ')'
  pure (VComplement n width)

floatP :: P ValueLiteral
floatP = VFloat <$> (L.scientific <* oneOf ['f', 'F'])

intP :: P ValueLiteral
intP = VInt <$> (try hex <|> L.signed (pure ()) L.decimal)
 where
  hex = string "0x" *> L.hexadecimal

instance Display ValueLiteral where
  displayBuilder = \case
    VInt n -> displayBuilder n
    VComplement n width -> "(~" <> displayBuilder n <> suffix width <> ")"
    VFloat s -> displayBuilder (formatScientific Fixed Nothing s) <> "F"
    VString s -> "\"" <> displayBuilder s <> "\""
    VExpr t -> displayBuilder t
   where
    suffix CW32 = "U"
    suffix CW64 = "ULL"

-- | Feature/version numbers: @\"1.4\"@ -> @(1, 4)@.
parseVersion :: Text -> Either Text (Int, Int)
parseVersion = viaMegaparsec ((,) <$> L.decimal <* char '.' <*> L.decimal)

renderVersion :: (Int, Int) -> Text
renderVersion (major, minor) = T.pack (show major) <> "." <> T.pack (show minor)
