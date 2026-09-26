{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Library versions as the bindgen pipeline compares and spells them: the
-- vocabulary under the target record ("Lithon.Codegen.Bindgen.Target"),
-- whose 'Lithon.Codegen.Bindgen.Target.VersionScheme' says how many parts a
-- version has and how it is written in the library's own C, and under the
-- registry ("Lithon.Codegen.Bindgen.Versions").
module Lithon.Codegen.Bindgen.Version (
  Version,
  mkVersion,
  versionParts,
  versionArity,
  renderVersion,
  versionArgs,
  parseVersionExact,
  versionCodec,
) where

import Autodocodec (JSONCodec, bimapCodec, textCodec)
import Data.Char (isDigit)
import Data.Text qualified as T
import Lithon.Prelude

-- | A release as dot-separated numeric parts, ordered lexicographically
-- (SDL: @3.2.0@; a two-part scheme: @2.1@). Every version one target
-- compares has its scheme's arity: the registry codec
-- ('parseVersionExact') and the prose readers
-- ("Lithon.Codegen.Bindgen.Version.Doc") enforce it, and
-- 'Lithon.Codegen.Bindgen.Target.validateTarget' checks the baseline.
newtype Version = Version (NonEmpty Int)
  deriving stock (Eq, Ord, Show)

mkVersion :: NonEmpty Int -> Version
mkVersion = Version

versionParts :: Version -> NonEmpty Int
versionParts (Version parts) = parts

versionArity :: Version -> Int
versionArity = length . versionParts

-- | Dotted, as registries and messages spell it: @3.4.0@.
renderVersion :: Version -> Text
renderVersion = T.intercalate "." . map show . toList . versionParts

-- | Comma-separated, as a C version macro takes it: @3, 4, 0@.
versionArgs :: Version -> Text
versionArgs = T.intercalate ", " . map show . toList . versionParts

-- | A registry version: exactly @arity@ dot-separated groups of digits.
parseVersionExact :: Int -> Text -> Either String Version
parseVersionExact arity t = case traverse part (T.splitOn "." t) of
  Just (p : ps)
    | length ps + 1 == arity -> Right (Version (p :| ps))
  _malformed ->
    Left ("expected MAJOR.MINOR[.PATCH…] with " <> show arity <> " parts, got: " <> show t)
 where
  part g
    | not (T.null g) && T.all isDigit g = readMaybe (toString g)
    | otherwise = Nothing

-- | A version as a JSON string of exactly @arity@ parts.
versionCodec :: Int -> JSONCodec Version
versionCodec arity = bimapCodec (parseVersionExact arity) renderVersion textCodec
