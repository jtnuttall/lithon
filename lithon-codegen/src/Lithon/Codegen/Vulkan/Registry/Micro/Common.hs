{-# LANGUAGE OverloadedStrings #-}

-- | Shared plumbing for the registry's attribute micro-grammars.
--
-- Positions inside attribute values are attribute-relative (megaparsec sees
-- only the value text); the enclosing decoder error carries the element's
-- XML path and position. Do not attempt absolute-column math — xml-conduit
-- does not expose attribute value offsets.
module Lithon.Codegen.Vulkan.Registry.Micro.Common (
  -- * Raw-preserving results
  Raw (..),
  rawWith,

  -- * Megaparsec adapters
  P,
  viaMegaparsec,
  rawEither,
  parseDecimal,

  -- * Shared lexemes
  identifier,

  -- * Registry feature paths
  FeaturePath (..),
  parseFeaturePath,
) where

import Data.Aeson (ToJSON)
import Data.Char (isAlphaNum)
import Data.Text qualified as T
import Data.Text.Read qualified as TR
import Lithon.Prelude
import Text.Megaparsec (Parsec, eof, errorBundlePretty, parse, takeWhile1P)

import Lithon.Codegen.Vulkan.Names

-- | A parsed artifact that keeps its source text. Everything the registry
-- parser interprets structurally is stored this way, so IR dumps and later
-- phases can always fall back to (or cross-check against) the original.
data Raw a = Raw
  { raw :: !Text
  , parsed :: !a
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

type P = Parsec Void Text

-- | Run a total parser over an attribute value, rendering failures into the
-- message slot of 'Lithon.Codegen.Vulkan.Xml.Decode.MalformedAttribute'.
viaMegaparsec :: P a -> Text -> Either Text a
viaMegaparsec p input = first (T.pack . errorBundlePretty) (parse (p <* eof) "" input)

-- | Like 'viaMegaparsec', keeping the input alongside the result.
rawWith :: P a -> Text -> Either Text (Raw a)
rawWith p input = Raw input <$> viaMegaparsec p input

-- | Lift any value parser into a raw-preserving one.
rawEither :: (Text -> Either Text a) -> Text -> Either Text (Raw a)
rawEither run input = Raw input <$> run input

-- | A plain (possibly negative) decimal integer attribute.
parseDecimal :: Text -> Either Text Int
parseDecimal input = case TR.signed TR.decimal input of
  Right (n, rest) | T.null rest -> Right n
  _ -> Left "expected a decimal integer"

-- | Registry name lexeme: Vulkan API names, extension names, and C
-- identifiers are all @[A-Za-z0-9_]+@. Deliberately no whitespace skipping —
-- the registry's expression attributes contain none, and a stray space
-- should fail loudly.
identifier :: P Text
identifier = takeWhile1P (Just "identifier") \c -> isAlphaNum c || c == '_'

-- | A @Struct::member@ reference to a fine-grained feature bit, e.g.
-- @VkPhysicalDeviceVulkan12Features::descriptorIndexing@. Appears in
-- @depends=@ expressions and member @\<name alias=…\>@ markup.
data FeaturePath = FeaturePath
  { struct :: !TypeName
  , member :: !Text
  }
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (Hashable, NFData, ToJSON)

instance Display FeaturePath where
  displayBuilder fp = displayBuilder fp.struct <> "::" <> displayBuilder fp.member

-- | Parse a standalone @Struct::member@ value (e.g. a member
-- @\<name alias=…\>@ attribute).
parseFeaturePath :: Text -> Either Text FeaturePath
parseFeaturePath input = case T.breakOn "::" input of
  (struct, rest)
    | Just member <- T.stripPrefix "::" rest
    , not (T.null struct)
    , not (T.null member)
    , not ("::" `T.isInfixOf` member) ->
        Right FeaturePath{struct = WithNS struct, member}
  _ -> Left "expected Struct::member"
