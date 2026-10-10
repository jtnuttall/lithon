{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Library versions as the bindgen pipeline compares and spells them: the
-- vocabulary under the target record ("Lithon.Codegen.Bindgen.Target"),
-- whose 'Lithon.Codegen.Bindgen.Target.VersionScheme' says how many parts a
-- version has and how it is written in the library's own C, and under the
-- annotations ("Lithon.Codegen.Bindgen.Versions").
module Lithon.Codegen.Bindgen.Version (
  Version,
  mkVersion,
  versionParts,
  versionArity,
  renderVersion,
  versionArgs,
  parseVersionExact,
  parseVersionLoose,
  fitArity,
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
parseVersionExact arity t = case parseVersionLoose t of
  Right v | versionArity v == arity -> Right v
  _malformed ->
    Left ("expected MAJOR.MINOR[.PATCH…] with " <> show arity <> " parts, got: " <> show t)

-- | A version as @pkg-config --modversion@ spells it: any number of
-- dot-separated groups of digits (libmpv reports @2.5.0@ against a
-- two-part scheme). 'fitArity' brings it to a scheme's arity.
parseVersionLoose :: Text -> Either String Version
parseVersionLoose t = case traverse part (T.splitOn "." t) of
  Just (p : ps) -> Right (Version (p :| ps))
  _malformed -> Left ("expected dot-separated groups of digits, got: " <> show t)
 where
  part g
    | not (T.null g) && T.all isDigit g = readMaybe (toString g)
    | otherwise = Nothing

-- | The version at a scheme's arity: trailing parts dropped, missing ones
-- zero (@2.5.0@ at two parts is @2.5@; @3.4@ at three is @3.4.0@).
fitArity :: Int -> Version -> Version
fitArity arity (Version (p :| ps)) =
  Version (p :| take (arity - 1) (ps <> replicate (arity - 1) 0))

-- | A version as a JSON string of exactly @arity@ parts.
versionCodec :: Int -> JSONCodec Version
versionCodec arity = bimapCodec (parseVersionExact arity) renderVersion textCodec
