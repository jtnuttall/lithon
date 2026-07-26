{-# LANGUAGE OverloadedStrings #-}

-- | The checked-in alias registry for the curated @SDL3.Sys.*@ layer:
-- @lithon-codegen\/sdl3\/aliases.json@.
--
-- The registry is the deterministic record of every per-function decision
-- the layer makes — flavor classification (with rationale), renames, and
-- skips. Classification of callback-taking functions is deliberately
-- explicit: generation hard-fails on an unclassified callback function, so
-- an SDL upgrade that adds one stops the build until a human decides
-- whether its callback is bypassable ('Both') or unavoidably synchronous
-- ('SafeOnly').
--
-- JSON via autodocodec, mirroring the Vulkan profile
-- ("Lithon.Codegen.Vulkan.Curate.Profile"): one codec definition yields the
-- decoder, the encoder, and field documentation.
module Lithon.Codegen.Sdl3.Alias.Config (
  AliasConfig (..),
  FunctionEntry (..),
  NamingRule (..),
  ValidatedAliasConfig (..),
  decodeAliasConfig,
  encodeAliasConfig,
  namingRuleText,
  validateAliasConfig,
) where

import Autodocodec (
  HasCodec (codec),
  JSONCodec,
  object,
  optionalFieldOrNull,
  optionalFieldWithDefault,
  requiredFieldWith,
  stringConstCodec,
  (.=),
 )
import Autodocodec.Aeson (eitherDecodeJSONViaCodec, encodeJSONViaCodec)
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T

import Lithon.Codegen.Prelude
import Lithon.Codegen.Sdl3.Alias.Names (AliasError (..), Safety (..))

-- | The alias-layer naming rule. Single-valued today; an enum so the
-- registry names its rule and the manifest can record it.
data NamingRule = CamelSegments
  deriving stock (Bounded, Enum, Eq, Generic, Show)
  deriving anyclass (NFData)

-- | One function's registry entry.
data FunctionEntry = FunctionEntry
  { safety :: !Safety
  , rationale :: !(Maybe Text)
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | The decoded registry, prior to validation against the function census.
data AliasConfig = AliasConfig
  { naming :: !NamingRule
  , functions :: !(Map Text FunctionEntry)
  -- ^ C name -> classification. Callback-taking functions MUST appear here;
  -- non-callback functions may (curated blocking\/reentrant additions).
  , renames :: !(Map Text Text)
  -- ^ C name -> unsuffixed alias override (collision\/keyword escape hatch).
  , skip :: ![Text]
  -- ^ C names to leave out of the curated layer entirely.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | The census-validated registry the planner consumes.
data ValidatedAliasConfig = ValidatedAliasConfig
  { naming :: !NamingRule
  , safeties :: !(Map Text Safety)
  -- ^ Total over every aliased function (skipped functions removed;
  -- unlisted non-callback functions defaulted to 'Both' — every function
  -- exposes both flavors unless curated otherwise).
  , rationales :: !(Map Text Text)
  -- ^ The registry rationales, surfaced in generated documentation.
  , renames :: !(Map Text Text)
  , skipped :: !(Set Text)
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

decodeAliasConfig :: LBS.ByteString -> Either Text AliasConfig
decodeAliasConfig = first T.pack . eitherDecodeJSONViaCodec

encodeAliasConfig :: AliasConfig -> LBS.ByteString
encodeAliasConfig = encodeJSONViaCodec

instance HasCodec AliasConfig where
  codec =
    object "AliasConfig"
      $ AliasConfig
      <$> requiredFieldWith
        "naming"
        namingRuleCodec
        "the function-name normalization rule"
      .= (.naming)
      <*> optionalFieldWithDefault
        "functions"
        Map.empty
        "per-function flavor classification; callback takers are mandatory"
      .= (.functions)
      <*> optionalFieldWithDefault
        "renames"
        Map.empty
        "C name -> unsuffixed alias override"
      .= (.renames)
      <*> optionalFieldWithDefault
        "skip"
        []
        "C names excluded from the curated layer"
      .= (.skip)

instance HasCodec FunctionEntry where
  codec =
    object "FunctionEntry"
      $ FunctionEntry
      <$> requiredFieldWith "safety" safetyCodec safetyDoc
      .= (.safety)
      <*> optionalFieldOrNull "rationale" "why this classification"
      .= (.rationale)
   where
    safetyDoc =
      "both = unsuffixed unsafe alias + Safe-suffixed safe alias (the default); "
        <> "safe-only = Safe alias only (unsafe would be UB); "
        <> "unsafe-only = opt out of the safe alias (non-callback functions only)"

namingRuleCodec :: JSONCodec NamingRule
namingRuleCodec = stringConstCodec ((CamelSegments, "camel-segments") :| [])

-- | The registry spelling of a naming rule (manifest metadata).
namingRuleText :: NamingRule -> Text
namingRuleText = \case
  CamelSegments -> "camel-segments"

safetyCodec :: JSONCodec Safety
safetyCodec =
  stringConstCodec
    ( (Both, "both")
        :| [ (SafeOnly, "safe-only")
           , (UnsafeOnly, "unsafe-only")
           ]
    )

-- | Cross-check the registry against the generation census and produce the
-- total per-function classification.
--
-- The census maps every bound C function to whether it takes a callback
-- parameter (mechanically detected on the final C AST). Accumulated hard
-- errors:
--
-- * any registry reference to a function the census does not contain;
-- * a callback-taking function with no classification (or classified
--   'UnsafeOnly', which contradicts callback semantics);
-- * an explicit rationale-less 'Both' entry on a non-callback function
--   (that is the default — dead configuration is an error; add a rationale
--   to keep an entry as documentation);
-- * a 'SafeOnly' or 'UnsafeOnly' entry without a rationale (either way a
--   flavor is being withheld; the registry records why, and the generated
--   docs surface it);
-- * a function that is both classified\/renamed and skipped.
validateAliasConfig
  :: Map Text Bool
  -- ^ Census: C name -> takes a callback parameter.
  -> AliasConfig
  -> Validation (Errors AliasError) ValidatedAliasConfig
validateAliasConfig census config =
  failUnlessEmpty
    (unknowns <> unclassified <> conflicts)
    ValidatedAliasConfig
      { naming = config.naming
      , safeties
      , rationales = Map.mapMaybe (.rationale) config.functions
      , renames = config.renames
      , skipped
      }
 where
  skipped = Set.fromList config.skip

  safeties =
    Map.fromList
      [ (cName, classify cName)
      | cName <- Map.keys census
      , not (Set.member cName skipped)
      ]

  -- Both flavors by default: the safe import always exists at the Bindgen
  -- layer, so the only question is whether the alias surfaces it. Refusal
  -- (SafeOnly) and opt-out (UnsafeOnly) are explicit curation.
  classify cName = maybe Both (.safety) (Map.lookup cName config.functions)

  unknowns =
    [ AliasUnknownFunction{context, cName}
    | (context, names) <-
        [ ("functions", Map.keys config.functions)
        , ("renames", Map.keys config.renames)
        , ("skip", config.skip)
        ]
    , cName <- names
    , not (Map.member cName census)
    ]

  unclassified =
    [ AliasUnclassifiedCallback{cName}
    | (cName, hasCallback) <- Map.toList census
    , hasCallback
    , not (Set.member cName skipped)
    , maybe True (\e -> e.safety == UnsafeOnly) (Map.lookup cName config.functions)
    ]

  conflicts =
    [ AliasConfigConflict{cName, reason = "classified in functions but also skipped"}
    | cName <- Map.keys config.functions
    , Set.member cName skipped
    ]
      <> [ AliasConfigConflict{cName, reason = "renamed but also skipped"}
         | cName <- Map.keys config.renames
         , Set.member cName skipped
         ]
      <> [ AliasConfigConflict
             { cName
             , reason =
                 "explicit both without a rationale on a non-callback function is the default; remove the entry or add a rationale"
             }
         | (cName, entry) <- Map.toList config.functions
         , entry.safety == Both
         , isNothing entry.rationale
         , Map.lookup cName census == Just False
         ]
      <> [ AliasConfigConflict
             { cName
             , reason = "safe-only/unsafe-only withholds a flavor and requires a rationale"
             }
         | (cName, entry) <- Map.toList config.functions
         , entry.safety /= Both
         , isNothing entry.rationale
         ]
