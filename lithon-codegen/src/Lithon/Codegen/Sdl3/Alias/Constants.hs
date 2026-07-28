{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | The checked-in constants registry for the @SDL3.Sys.*@ layer:
-- @lithon-codegen\/sdl3\/constants.json@.
--
-- SDL declares its flag\/constant vocabularies as a bare @typedef UintN@
-- followed by @#define@ members — an association that exists only in
-- lexical convention, never in C's semantic model, so no binding generator
-- can recover it soundly (rust-bindgen delegates to a user callback;
-- sdl3-sys-gen pairs an adjacency default with a hand patch list). This
-- registry is that judgment made declarative: each group names its target
-- newtype and a membership rule — a prefix (optionally a suffix and
-- excludes) or, where prefixes genuinely collide (the two haptic
-- vocabularies), an explicit member list.
--
-- Values are never hand-written. Membership is enumerated by scanning the
-- resolved SDL headers for object-like @#define@s; every member's value
-- (and every group's @sizeof@) is then evaluated by compiling and running
-- a probe translation unit against those same headers — the ABI-bake
-- pattern. The generated @_Static_assert@ layer re-asserts every baked
-- value on the consumer's platform, so only /grouping/ can ever be wrong,
-- never a number.
module Lithon.Codegen.Sdl3.Alias.Constants (
  -- * Registry model
  ConstantsConfig (..),
  ConstantGroup (..),
  Combine (..),
  decodeConstantsConfig,
  encodeConstantsConfig,

  -- * Header enumeration
  scanObjectMacros,

  -- * Probe translation unit
  renderProbeSource,
  parseProbeOutput,

  -- * Validation and planning
  FamilyConstants (..),
  ConstantGroupPlan (..),
  ConstantMember (..),
  ConstantError (..),
  enumerateMembers,
  planConstants,
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
import Data.Char (isAlphaNum, isDigit)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude hiding (group)

-- | How a group's members combine: a bitmask vocabulary (documented with
-- the 'Data.Bits..|.' idiom) or a plain value space. Purely documentary —
-- the emitted patterns are identical.
data Combine = Bitmask | ValueSpace
  deriving stock (Bounded, Enum, Eq, Generic, Show)
  deriving anyclass (NFData)

-- | One constant group: a target newtype and its membership rule.
data ConstantGroup = ConstantGroup
  { combine :: !Combine
  , prefix :: !(Maybe Text)
  -- ^ Rule form: members are the header's object-like @SDL_*@ macros with
  -- this prefix (and 'suffix', when present), minus 'exclude'.
  , suffix :: !(Maybe Text)
  , exclude :: ![Text]
  , members :: !(Maybe [Text])
  -- ^ Explicit form, for groups whose prefixes genuinely collide.
  -- Mutually exclusive with the rule form.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | The decoded registry, prior to validation against the generated decls.
newtype ConstantsConfig = ConstantsConfig
  { groups :: Map Text ConstantGroup
  -- ^ Target newtype name (e.g. @SDL_InitFlags@) -> its group.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

decodeConstantsConfig :: LBS.ByteString -> Either Text ConstantsConfig
decodeConstantsConfig = first T.pack . eitherDecodeJSONViaCodec

encodeConstantsConfig :: ConstantsConfig -> LBS.ByteString
encodeConstantsConfig = encodeJSONViaCodec

instance HasCodec ConstantsConfig where
  codec =
    object "ConstantsConfig"
      $ ConstantsConfig
      <$> requiredFieldWith
        "groups"
        codec
        "target newtype name -> membership rule for its macro constants"
      .= (.groups)

instance HasCodec ConstantGroup where
  codec =
    object "ConstantGroup"
      $ ConstantGroup
      <$> requiredFieldWith "combine" combineCodec combineDoc
      .= (.combine)
      <*> optionalFieldOrNull
        "prefix"
        "membership rule: object-like macros with this prefix"
      .= (.prefix)
      <*> optionalFieldOrNull
        "suffix"
        "additionally require this suffix (needs prefix)"
      .= (.suffix)
      <*> optionalFieldWithDefault
        "exclude"
        []
        "macros the rule must not sweep in (needs prefix)"
      .= (.exclude)
      <*> optionalFieldOrNull
        "members"
        "explicit member list; mutually exclusive with prefix"
      .= (.members)
   where
    combineDoc =
      "bitmask = members are OR-combinable bits (docs point at Data.Bits); "
        <> "value = a plain value space"

combineCodec :: JSONCodec Combine
combineCodec = stringConstCodec ((Bitmask, "bitmask") :| [(ValueSpace, "value")])

{-------------------------------------------------------------------------------
  Header enumeration
-------------------------------------------------------------------------------}

-- | The object-like macro names a header defines, in declaration order.
--
-- A macro is object-like iff no @(@ immediately follows its name —
-- function-like macros are never constants. Redefinitions (platform
-- @#ifdef@ arms) keep their first position.
scanObjectMacros :: Text -> [Text]
scanObjectMacros source =
  ordNub (mapMaybe macroName (T.lines source))
 where
  macroName line = do
    rest <- T.stripPrefix "#define" (T.stripStart line)
    (c, _) <- T.uncons rest
    guard (c == ' ' || c == '\t')
    let name = T.takeWhile isIdentChar (T.stripStart rest)
        afterName = T.drop (T.length name) (T.stripStart rest)
    guard (not (T.null name))
    -- @#define NAME(@ is function-like; anything else (including a bare
    -- guard define with no value) is object-like.
    guard (maybe True ((/= '(') . fst) (T.uncons afterName))
    pure name
  isIdentChar c = isAlphaNum c || c == '_'

{-------------------------------------------------------------------------------
  Probe translation unit
-------------------------------------------------------------------------------}

-- | The probe TU: one @sizeof@ line per group type, one value line per
-- member, evaluated against the same headers hs-bindgen consumed. The
-- program touches no SDL symbols (macros and @sizeof@ are compile-time),
-- so it links against libc alone.
renderProbeSource :: [(Text, [Text])] -> Text
renderProbeSource groups =
  T.unlines
    $ [ "/* GENERATED by lithon-codegen (sdl3 generate) - constants probe. */"
      , "#define SDL_MAIN_HANDLED"
      , "#include <SDL3/SDL.h>"
      , "#include <stdio.h>"
      , ""
      , "int main(void) {"
      ]
    <> concatMap probeLines groups
    <> [ "  return 0;"
       , "}"
       ]
 where
  probeLines (typeName, memberNames) =
    ("  printf(\"sizeof:" <> typeName <> ":%llu\\n\", (unsigned long long) sizeof(" <> typeName <> "));")
      : [ "  printf(\"value:" <> name <> ":%llu\\n\", (unsigned long long) (" <> name <> "));"
        | name <- memberNames
        ]

-- | Parse the probe's stdout back into @sizeof@ and value maps.
parseProbeOutput :: Text -> Either Text (Map Text Int, Map Text Integer)
parseProbeOutput out = do
  entries <- traverse entry (filter (not . T.null) (T.lines out))
  pure
    ( Map.fromList [(name, fromInteger v) | (SizeofLine, name, v) <- entries]
    , Map.fromList [(name, v) | (ValueLine, name, v) <- entries]
    )
 where
  entry line = case T.splitOn ":" line of
    ["sizeof", name, v] -> (SizeofLine,name,) <$> integer v
    ["value", name, v] -> (ValueLine,name,) <$> integer v
    _malformed -> Left ("constants probe: unparseable line: " <> line)
  integer v =
    maybeToRight
      ("constants probe: non-numeric payload: " <> v)
      (guard (T.all isDigit v && not (T.null v)) *> readMaybe (toString v))

data ProbeLineKind = SizeofLine | ValueLine
  deriving stock (Eq)

{-------------------------------------------------------------------------------
  Validation and planning
-------------------------------------------------------------------------------}

-- | The constants-relevant distillate of one header family.
data FamilyConstants = FamilyConstants
  { familyBase :: !Text
  -- ^ The Bindgen base module, e.g. @SDL3.Sys.Bindgen.Init@.
  , headerName :: !FilePath
  , headerMacros :: ![Text]
  -- ^ 'scanObjectMacros' of the family's header, declaration order.
  , newtypeConstrs :: !(Map Text Text)
  -- ^ Newtype name -> constructor name, from the family's generated decls.
  , takenNames :: !(Set Text)
  -- ^ Constructor-namespace names the family already exports (pattern
  -- synonyms, type constructors): the collision domain for new patterns.
  }
  deriving stock (Eq, Generic, Show)

-- | One planned, fully validated constant group.
data ConstantGroupPlan = ConstantGroupPlan
  { typeName :: !Text
  , constrName :: !Text
  , familyBase :: !Text
  , headerName :: !FilePath
  , combine :: !Combine
  , widthBits :: !Int
  , members :: ![ConstantMember]
  -- ^ Header declaration order.
  }
  deriving stock (Eq, Generic, Show)

data ConstantMember = ConstantMember
  { cName :: !Text
  , value :: !Integer
  }
  deriving stock (Eq, Generic, Show)

data ConstantError
  = -- | The group's target newtype is not declared by any family.
    ConstantTypeUnknown {typeName :: !Text}
  | -- | The group's target newtype is declared by more than one family.
    ConstantTypeAmbiguous {typeName :: !Text, families :: ![Text]}
  | -- | Contradictory or incomplete membership rule.
    ConstantRuleInvalid {typeName :: !Text, reason :: !Text}
  | -- | The rule matched no macros in the family's header.
    ConstantRuleEmpty {typeName :: !Text}
  | -- | An explicit member is not an object-like macro of the header.
    ConstantMemberUnknown {typeName :: !Text, cName :: !Text}
  | -- | Two groups claim the same macro.
    ConstantOverlap {cName :: !Text, groups :: ![Text]}
  | -- | The probe produced no value for a member (or no sizeof for a type).
    ConstantProbeMissing {probeName :: !Text}
  | -- | A probed value does not fit the target newtype's width.
    ConstantValueTooWide
      { typeName :: !Text
      , cName :: !Text
      , value :: !Integer
      , widthBits :: !Int
      }
  | -- | The minted pattern name collides with something the family exports.
    ConstantNameCollision {typeName :: !Text, cName :: !Text}
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

instance Display ConstantError where
  displayBuilder = \case
    ConstantTypeUnknown{typeName} ->
      "constants: no generated family declares newtype " <> displayBuilder typeName
    ConstantTypeAmbiguous{typeName, families} ->
      "constants: newtype "
        <> displayBuilder typeName
        <> " declared by more than one family: "
        <> displayBuilder (T.intercalate ", " families)
    ConstantRuleInvalid{typeName, reason} ->
      "constants: " <> displayBuilder typeName <> ": " <> displayBuilder reason
    ConstantRuleEmpty{typeName} ->
      "constants: " <> displayBuilder typeName <> ": membership rule matched no macros"
    ConstantMemberUnknown{typeName, cName} ->
      "constants: "
        <> displayBuilder typeName
        <> ": explicit member "
        <> displayBuilder cName
        <> " is not an object-like macro of the family's header"
    ConstantOverlap{cName, groups} ->
      "constants: macro "
        <> displayBuilder cName
        <> " claimed by more than one group: "
        <> displayBuilder (T.intercalate ", " groups)
    ConstantProbeMissing{probeName} ->
      "constants: probe produced no result for " <> displayBuilder probeName
    ConstantValueTooWide{typeName, cName, value, widthBits} ->
      "constants: "
        <> displayBuilder cName
        <> " = "
        <> displayBuilder (show value :: Text)
        <> " does not fit "
        <> displayBuilder typeName
        <> " ("
        <> displayBuilder (show widthBits :: Text)
        <> " bits)"
    ConstantNameCollision{typeName, cName} ->
      "constants: "
        <> displayBuilder typeName
        <> ": pattern "
        <> displayBuilder cName
        <> " collides with an existing export of the family"

-- | Resolve one group's member names against its family's header macros.
-- Pure rule application — probe values come later.
enumerateMembers
  :: Text
  -> ConstantGroup
  -> [Text]
  -- ^ The header's object-like macros, declaration order.
  -> Validation (Errors ConstantError) [Text]
enumerateMembers typeName group headerMacros =
  case (group.prefix, group.members) of
    (Just _, Just _) ->
      Failure
        ( errors1
            ConstantRuleInvalid
              { typeName
              , reason = "prefix and members are mutually exclusive"
              }
        )
    (Nothing, Nothing) ->
      Failure
        ( errors1
            ConstantRuleInvalid
              { typeName
              , reason = "one of prefix or members is required"
              }
        )
    (Nothing, Just _)
      | isJust group.suffix || not (null group.exclude) ->
          Failure
            ( errors1
                ConstantRuleInvalid
                  { typeName
                  , reason = "suffix/exclude only apply to the prefix form"
                  }
            )
    (Just prefix, Nothing) ->
      let excluded = Set.fromList group.exclude
          matches name =
            prefix
              `T.isPrefixOf` name
              && maybe True (`T.isSuffixOf` name) group.suffix
              && not (Set.member name excluded)
       in case filter matches headerMacros of
            [] -> Failure (errors1 ConstantRuleEmpty{typeName})
            names -> Success names
    (Nothing, Just explicit) ->
      let known = Set.fromList headerMacros
          unknowns =
            [ ConstantMemberUnknown{typeName, cName}
            | cName <- explicit
            , not (Set.member cName known)
            ]
       in failUnlessEmpty unknowns explicit

-- | Validate the whole registry against the families and the probe
-- results, producing render-ready group plans (registry order).
planConstants
  :: ConstantsConfig
  -> [FamilyConstants]
  -> Map Text Int
  -- ^ Probed @sizeof@ per group type, bytes.
  -> Map Text Integer
  -- ^ Probed value per member macro.
  -> Either (Errors ConstantError) [ConstantGroupPlan]
planConstants config families sizeofs values =
  validationToEither
    $ overlapCheck
    *> traverse planGroup (Map.toAscList config.groups)
 where
  familiesOf typeName =
    [f | f <- families, Map.member typeName f.newtypeConstrs]

  -- The steps are genuinely sequential (no family -> no rule application;
  -- no width -> no fit check), so this runs in 'Either'; accumulation
  -- across groups is the outer 'traverse''s job.
  planGroup (typeName, group) = either Failure Success do
    family <- case familiesOf typeName of
      [f] -> Right f
      [] -> Left (errors1 ConstantTypeUnknown{typeName})
      fs ->
        Left
          ( errors1
              ConstantTypeAmbiguous{typeName, families = map (.familyBase) fs}
          )
    memberNames <-
      validationToEither (enumerateMembers typeName group family.headerMacros)
    widthBits <-
      maybeToRight
        (errors1 ConstantProbeMissing{probeName = typeName})
        ((* 8) <$> Map.lookup typeName sizeofs)
    members <-
      validationToEither (traverse (memberOf typeName family widthBits) memberNames)
    pure
      ConstantGroupPlan
        { typeName
        , constrName =
            Map.findWithDefault typeName typeName family.newtypeConstrs
        , familyBase = family.familyBase
        , headerName = family.headerName
        , combine = group.combine
        , widthBits
        , members
        }

  memberOf typeName family widthBits cName =
    case Map.lookup cName values of
      Nothing -> Failure (errors1 ConstantProbeMissing{probeName = cName})
      Just value ->
        failUnlessEmpty
          ( [ ConstantValueTooWide{typeName, cName, value, widthBits}
            | value < 0 || value >= 2 ^ widthBits
            ]
              <> [ ConstantNameCollision{typeName, cName}
                 | Set.member cName family.takenNames
                 ]
          )
          ConstantMember{cName, value}

  -- Every (group, member) pair, resolved permissively (rule failures are
  -- reported by planGroup; here we only look for cross-group claims).
  overlapCheck =
    failUnlessEmpty
      [ ConstantOverlap{cName, groups = sort owners}
      | (cName, owners) <- Map.toAscList claims
      , length owners > 1
      ]
      ()
   where
    claims =
      Map.fromListWith
        (<>)
        [ (cName, [typeName])
        | (typeName, group) <- Map.toAscList config.groups
        , family <- familiesOf typeName
        , Success names <- [enumerateMembers typeName group family.headerMacros]
        , cName <- names
        ]
