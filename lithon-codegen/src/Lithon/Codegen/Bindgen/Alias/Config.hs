{-# LANGUAGE OverloadedStrings #-}

-- | The checked-in alias registry for a target's curated layer (SDL:
-- @SDL3.Sys.*@): @lithon-codegen\/data\/\<key\>\/aliases.json@.
--
-- The registry is the deterministic record of every per-function decision
-- the layer makes — flavor classification (with rationale), renames,
-- skips, and the per-header allowlists that curate a header down to the
-- functions worth aliasing. Classification of callback-taking functions is
-- deliberately explicit: generation hard-fails on an unclassified callback
-- function, so a library upgrade that adds one stops the build until a
-- human decides whether its callback is bypassable ('Both') or unavoidably
-- synchronous ('SafeOnly').
--
-- JSON via autodocodec, mirroring the Vulkan profile
-- ("Lithon.Codegen.Vulkan.Curate.Profile"): one codec definition yields the
-- decoder, the encoder, and field documentation.
module Lithon.Codegen.Bindgen.Alias.Config (
  AliasConfig (..),
  AllowEntry (..),
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
  requiredField,
  requiredFieldWith,
  stringConstCodec,
  (.=),
 )
import Autodocodec.Aeson (eitherDecodeJSONViaCodec, encodeJSONViaCodec)
import Data.ByteString.Lazy qualified as LBS
import Data.Char qualified as Char
import Data.List qualified as L
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Bindgen.Alias.Names (AliasError (..), Safety (..))

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
  , allow :: !(Map Text AllowEntry)
  -- ^ Header basename -> the only C names its family aliases. Every other
  -- function of an allowlisted header is raw-only; a header not listed
  -- aliases every function.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | One header's allowlist.
data AllowEntry = AllowEntry
  { bound :: !Int
  -- ^ How many functions the header bound when the list was curated. A
  -- library release that changes the count fails generation until a human
  -- reviews the list against the new census and updates it.
  , names :: ![Text]
  -- ^ The only C names the header's family aliases.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | The census-validated registry the planner consumes.
data ValidatedAliasConfig = ValidatedAliasConfig
  { naming :: !NamingRule
  , safeties :: !(Map Text Safety)
  -- ^ Total over every aliased function (skipped functions and those
  -- outside their header's allowlist removed; unlisted non-callback
  -- functions defaulted to 'Both' — every function exposes both flavors
  -- unless curated otherwise).
  , rationales :: !(Map Text Text)
  -- ^ The registry rationales, surfaced in generated documentation.
  , renames :: !(Map Text Text)
  , skipped :: !(Set Text)
  , allowlisted :: !(Set FilePath)
  -- ^ The headers whose families alias only their allowlist (their
  -- curated modules say so).
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
      <*> optionalFieldWithDefault
        "allow"
        Map.empty
        ( "header basename -> the only C names its curated module aliases; the header's "
            <> "other functions stay raw-only (headers not listed alias every function)"
        )
      .= (.allow)

instance HasCodec AllowEntry where
  codec =
    object "AllowEntry"
      $ AllowEntry
      <$> requiredField
        "bound"
        ( "how many functions the header bound when the list was curated; a different "
            <> "count fails generation until the list is reviewed"
        )
      .= (.bound)
      <*> requiredField "names" "the only C names the header's curated module aliases"
      .= (.names)

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
-- The census maps every bound header to its C functions and whether each
-- takes a callback parameter (mechanically detected on the final C AST).
-- A function is aliased unless it is skipped or its header's allowlist
-- leaves it out. Accumulated hard errors:
--
-- * any registry reference to a function the census does not contain, and
--   an allowlist for a header it does not contain;
-- * an allowlist whose recorded @bound@ differs from its header's census
--   count: the library added (or dropped) functions since the list was
--   curated, so it needs review (the error names the unlisted functions
--   that follow the library's own naming, uppercase after the function
--   prefix, and counts the libc-style rest);
-- * an allowed function its header does not declare, or one allowed twice;
-- * an aliased callback-taking function with no classification (or
--   classified 'UnsafeOnly', which contradicts callback semantics);
-- * an explicit rationale-less 'Both' entry on a non-callback function
--   (that is the default — dead configuration is an error; add a rationale
--   to keep an entry as documentation);
-- * a 'SafeOnly' or 'UnsafeOnly' entry without a rationale (either way a
--   flavor is being withheld; the registry records why, and the generated
--   docs surface it);
-- * a function that is both classified\/renamed\/allowed and skipped;
-- * a function an allowlist leaves out that is classified, renamed, or
--   skipped anyway (it is not aliased, so the entry is dead configuration).
validateAliasConfig
  :: Text
  -- ^ The target's function prefix (@SDL_@), for the stale-allowlist hint.
  -> Map FilePath (Map Text Bool)
  -- ^ Census: bound header basename -> its C functions -> takes a callback
  -- parameter.
  -> AliasConfig
  -> Either (Errors AliasError) ValidatedAliasConfig
validateAliasConfig functionPrefix censusByHeader config =
  validationToEither
    $ failUnlessEmpty
      (unknowns <> allowProblems <> unclassified <> conflicts)
      ValidatedAliasConfig
        { naming = config.naming
        , safeties
        , rationales = Map.mapMaybe (.rationale) config.functions
        , renames = config.renames
        , skipped
        , allowlisted = Map.keysSet allowed
        }
 where
  census = Map.unions (Map.elems censusByHeader)

  headerOf =
    Map.fromList
      [ (cName, header)
      | (header, functions) <- Map.toList censusByHeader
      , cName <- Map.keys functions
      ]

  skipped = Set.fromList config.skip

  allowed :: Map FilePath (Set Text)
  allowed =
    Map.fromList
      [(toString header, Set.fromList entry.names) | (header, entry) <- Map.toList config.allow]

  allowedNames = concatMap (.names) (Map.elems config.allow)

  -- The header whose allowlist leaves a bound function out (raw-only).
  leftOutBy cName = do
    header <- Map.lookup cName headerOf
    names <- Map.lookup header allowed
    guard (not (Set.member cName names))
    pure header

  aliased cName = not (Set.member cName skipped) && isNothing (leftOutBy cName)

  safeties =
    Map.fromList
      [ (cName, classify cName)
      | cName <- Map.keys census
      , aliased cName
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
        , ("allow", allowedNames)
        ]
    , cName <- names
    , not (Map.member cName census)
    ]

  allowProblems =
    [ AliasUnknownHeader{header}
    | header <- Map.keys config.allow
    , not (Map.member (toString header) censusByHeader)
    ]
      <> [ AliasAllowlistStale
             { header
             , recorded = entry.bound
             , actual = Map.size functions
             , functionPrefix
             , apiStyle
             , libcStyle = length libcStyle
             }
         | (header, entry) <- Map.toList config.allow
         , Just functions <- [Map.lookup (toString header) censusByHeader]
         , Map.size functions /= entry.bound
         , let listed = Map.findWithDefault Set.empty (toString header) allowed
               (apiStyle, libcStyle) =
                 L.partition
                   apiStyleName
                   [cName | cName <- Map.keys functions, cName `Set.notMember` listed]
         ]
      <> [ AliasConfigConflict
             { cName
             , reason = "allowed under " <> header <> ", but declared in " <> toText declaredIn
             }
         | (header, entry) <- Map.toList config.allow
         , cName <- entry.names
         , Just declaredIn <- [Map.lookup cName headerOf]
         , toText declaredIn /= header
         ]
      <> [ AliasConfigConflict{cName, reason = "allowed twice under " <> header}
         | (header, entry) <- Map.toList config.allow
         , (cName, count) <- Map.toList (Map.fromListWith (+) [(name, 1 :: Int) | name <- entry.names])
         , count > 1
         ]

  -- The library's own naming (SDL's): uppercase after the function prefix
  -- (@SDL_GetEnvironment@), unlike its libc-style clones (@SDL_strlen@).
  apiStyleName cName =
    maybe False (Char.isUpper . fst) (T.uncons =<< T.stripPrefix functionPrefix cName)

  unclassified =
    [ AliasUnclassifiedCallback{cName}
    | (cName, hasCallback) <- Map.toList census
    , hasCallback
    , aliased cName
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
      <> [ AliasConfigConflict{cName, reason = "allowed but also skipped"}
         | cName <- allowedNames
         , Set.member cName skipped
         ]
      <> [ AliasConfigConflict
             { cName
             , reason =
                 what
                   <> ", but the "
                   <> toText header
                   <> " allowlist leaves it out, so it is not aliased; remove the entry"
             }
         | (what, names) <-
             [ ("classified in functions", Map.keys config.functions)
             , ("renamed", Map.keys config.renames)
             , ("skipped", config.skip)
             ]
         , cName <- names
         , Just header <- [leftOutBy cName]
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
