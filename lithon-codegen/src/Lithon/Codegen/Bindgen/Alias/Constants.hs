{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | The checked-in constants registry for a target's curated layer:
-- @lithon-codegen\/data\/\<key\>\/constants.json@.
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
-- A constant lives with its type, not with its macro: the explicit form
-- may name macros of any bound header (@SDL_touch.h@'s
-- @SDL_TOUCH_MOUSEID@ is an @SDL_MouseID@, hosted with the type in
-- @SDL3.Sys.Mouse@). A C type with no newtype of its own (@size_t@) takes
-- a @native@ scalar instead, and its constants are plain scalar patterns.
--
-- Values are never hand-written. Membership is enumerated by scanning the
-- resolved headers for object-like @#define@s; every member's value (and
-- every group's @sizeof@ and signedness) is then evaluated by compiling
-- and running a probe translation unit against those same headers — the
-- ABI-bake pattern. The generated @_Static_assert@ layer re-asserts every
-- baked value on the consumer's platform, so only /grouping/ can ever be
-- wrong, never a number.
module Lithon.Codegen.Bindgen.Alias.Constants (
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
  ProbeResult (..),
  emptyProbe,
  parseProbeOutput,

  -- * Validation and planning
  FamilyConstants (..),
  ConstantTarget (..),
  ConstantGroupPlan (..),
  ConstantMember (..),
  ConstantError (..),
  ResolvedGroup (..),
  enumerateMembers,
  macroHomes,
  resolveGroup,
  constantProbeInputs,
  planConstants,
) where

import Autodocodec (
  HasCodec (codec),
  JSONCodec,
  object,
  optionalFieldOrNull,
  optionalFieldOrNullWith,
  optionalFieldWithDefault,
  requiredFieldWith,
  stringConstCodec,
  (.=),
 )
import Autodocodec.Aeson (eitherDecodeJSONViaCodec, encodeJSONViaCodec)
import Data.ByteString.Lazy qualified as LBS
import Data.Char (isAlphaNum, isDigit)
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude hiding (group)

import Lithon.Codegen.Bindgen.Target (
  BindgenTarget (..),
  HeaderSpec (..),
  NativeScalar (..),
  ParseEnv (..),
  defineLine,
  includeLine,
  nativeScalarBits,
  nativeScalarName,
  nativeScalarSigned,
 )

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
  -- ^ Rule form: members are the header's object-like macros with this
  -- prefix (SDL: @SDL_INIT_@), and 'suffix' when present, minus
  -- 'exclude'.
  , suffix :: !(Maybe Text)
  , exclude :: ![Text]
  , members :: !(Maybe [Text])
  -- ^ Explicit form, for groups whose prefixes genuinely collide, or whose
  -- members live in another header than their type. Mutually exclusive
  -- with the rule form.
  , native :: !(Maybe NativeScalar)
  -- ^ For a C type without a newtype (@size_t@): the scalar the patterns
  -- are over. Needs the explicit form, with every member from one header;
  -- the probed width and signedness must agree with the scalar.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | The decoded registry, prior to validation against the generated decls.
newtype ConstantsConfig = ConstantsConfig
  { groups :: Map Text ConstantGroup
  -- ^ Target type name (e.g. @SDL_InitFlags@, or @size_t@ for a 'native'
  -- group) -> its group.
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
        "target type name -> membership rule for its macro constants"
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
        "explicit member list (macros of any bound header); mutually exclusive with prefix"
      .= (.members)
      <*> optionalFieldOrNullWith
        "native"
        nativeScalarCodec
        nativeDoc
      .= (.native)
   where
    combineDoc =
      "bitmask = members are OR-combinable bits (docs point at Data.Bits); "
        <> "value = a plain value space"
    nativeDoc =
      "for a C type without a newtype (size_t): the native scalar the patterns "
        <> "are over; needs members, all from one header"

combineCodec :: JSONCodec Combine
combineCodec = stringConstCodec ((Bitmask, "bitmask") :| [(ValueSpace, "value")])

-- | The scalars, spelled as 'nativeScalarName' does (@Word8@ … @Int64@).
nativeScalarCodec :: JSONCodec NativeScalar
nativeScalarCodec =
  stringConstCodec
    (NE.map (\n -> (n, nativeScalarName n)) (minBound :| drop 1 [minBound .. maxBound]))

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

-- | The probe TU: per group type a @sizeof@ line and a @signed@ line, per
-- member a value line, evaluated against the same headers (under the same
-- defines) hs-bindgen consumed. The program touches no library symbols
-- (macros, @sizeof@ and casts are compile-time), so it links against libc
-- alone.
renderProbeSource :: BindgenTarget -> [(Text, [Text])] -> Text
renderProbeSource target groups =
  T.unlines
    $ ["/* GENERATED by lithon-codegen (" <> target.key <> " generate) - constants probe. */"]
    <> map defineLine target.parse.defines
    <> map (includeLine target) target.headers.mainIncludes
    <> [ "#include <stdio.h>"
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
      : ("  printf(\"signed:" <> typeName <> ":%d\\n\", (int)(((" <> typeName <> ") -1) < 0));")
      : [ "  printf(\"value:" <> name <> ":%llu\\n\", (unsigned long long) (" <> name <> "));"
        | name <- memberNames
        ]

-- | What the probe measured.
data ProbeResult = ProbeResult
  { sizeofs :: Map Text Int
  -- ^ @sizeof@ per group type, bytes.
  , signedness :: Map Text Bool
  -- ^ Whether each group type is signed (@((T) -1) < 0@).
  , values :: Map Text Integer
  -- ^ Each member macro's value as the probe's @unsigned long long@
  -- image: a negative value of a signed type arrives as its 64-bit
  -- two's-complement image, which 'planConstants' reads back through the
  -- type's signedness.
  }
  deriving stock (Eq, Generic, Show)

-- | The result of probing nothing.
emptyProbe :: ProbeResult
emptyProbe = ProbeResult{sizeofs = mempty, signedness = mempty, values = mempty}

-- | Parse the probe's stdout.
parseProbeOutput :: Text -> Either Text ProbeResult
parseProbeOutput out = do
  entries <- traverse entry (filter (not . T.null) (T.lines out))
  pure
    ProbeResult
      { sizeofs = Map.fromList [(name, fromInteger v) | (SizeofLine, name, v) <- entries]
      , signedness = Map.fromList [(name, v /= 0) | (SignedLine, name, v) <- entries]
      , values = Map.fromList [(name, v) | (ValueLine, name, v) <- entries]
      }
 where
  entry line = case T.splitOn ":" line of
    ["sizeof", name, v] -> (SizeofLine,name,) <$> integer v
    ["signed", name, v] -> (SignedLine,name,) <$> (integer v >>= flag v)
    ["value", name, v] -> (ValueLine,name,) <$> integer v
    _malformed -> Left ("constants probe: unparseable line: " <> line)
  integer v =
    maybeToRight
      ("constants probe: non-numeric payload: " <> v)
      (guard (T.all isDigit v && not (T.null v)) *> readMaybe (toString v))
  flag v n
    | n == 0 || n == 1 = Right n
    | otherwise = Left ("constants probe: signedness is not 0 or 1: " <> v)

data ProbeLineKind = SizeofLine | SignedLine | ValueLine
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

-- | What a group's patterns are over.
data ConstantTarget
  = -- | A newtype, by constructor name: @pattern X = Constr 1@.
    NewtypeTarget !Text
  | -- | A native scalar: @pattern X = 1@, typed @BG.Word64@ and the like.
    NativeTarget !NativeScalar
  deriving stock (Eq, Generic, Show)

-- | One planned, fully validated constant group.
data ConstantGroupPlan = ConstantGroupPlan
  { typeName :: !Text
  -- ^ The C type the registry names: a newtype, or the C name of the
  -- native scalar's type (@size_t@).
  , target :: !ConstantTarget
  , familyBase :: !Text
  -- ^ The host family: where the patterns are emitted.
  , headerName :: !FilePath
  -- ^ The host family's header.
  , combine :: !Combine
  , widthBits :: !Int
  , members :: ![ConstantMember]
  -- ^ Registry order for the explicit form, header declaration order for
  -- the rule form.
  }
  deriving stock (Eq, Generic, Show)

data ConstantMember = ConstantMember
  { cName :: !Text
  , value :: !Integer
  -- ^ Negative only for signed types.
  , declaredIn :: !FilePath
  -- ^ The header that defines the macro: the host's own, unless the group
  -- spans headers.
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
  | -- | An explicit member is not an object-like macro of any bound header.
    ConstantMemberUnknown {typeName :: !Text, cName :: !Text}
  | -- | Two groups claim the same macro.
    ConstantOverlap {cName :: !Text, groups :: ![Text]}
  | -- | The probe produced no value for a member (or no sizeof or
    -- signedness for a type).
    ConstantProbeMissing {probeName :: !Text}
  | -- | A probed value does not fit the target type's width and signedness.
    ConstantValueTooWide
      { typeName :: !Text
      , cName :: !Text
      , value :: !Integer
      , widthBits :: !Int
      }
  | -- | The minted pattern name collides with something a family exports.
    ConstantNameCollision {typeName :: !Text, cName :: !Text}
  | -- | A @native@ scalar disagrees with the probed C type.
    ConstantNativeMismatch
      { typeName :: !Text
      , native :: !NativeScalar
      , widthBits :: !Int
      , signed :: !Bool
      }
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

instance Display ConstantError where
  displayBuilder = \case
    ConstantTypeUnknown{typeName} ->
      "constants: no generated family declares newtype "
        <> displayBuilder typeName
        <> " (for a C type without a newtype, set \"native\")"
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
        <> " is not an object-like macro of any bound header"
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
        <> " collides with an existing export of the generated bindings"
    ConstantNativeMismatch{typeName, native, widthBits, signed} ->
      "constants: "
        <> displayBuilder typeName
        <> ": native "
        <> displayBuilder (nativeScalarName native)
        <> " does not match the C type ("
        <> displayBuilder (show widthBits :: Text)
        <> " bits, "
        <> (if signed then "signed" else "unsigned")
        <> ")"

-- | Resolve one group's member names. Pure rule application — probe values
-- come later.
--
-- The prefix form scans the host header only; the explicit form is
-- checked against every bound header's macros (a type's constants may be
-- declared elsewhere).
enumerateMembers
  :: Text
  -> ConstantGroup
  -> [Text]
  -- ^ The host header's object-like macros, declaration order.
  -> Set Text
  -- ^ Every bound header's object-like macros.
  -> Validation (Errors ConstantError) [Text]
enumerateMembers typeName group hostMacros boundMacros =
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
       in case filter matches hostMacros of
            [] -> Failure (errors1 ConstantRuleEmpty{typeName})
            names -> Success names
    (Nothing, Just explicit) ->
      let unknowns =
            [ ConstantMemberUnknown{typeName, cName}
            | cName <- explicit
            , not (Set.member cName boundMacros)
            ]
       in failUnlessEmpty unknowns explicit

-- | Each object-like macro to the family that declares it: the first in
-- chain order wins, so a redefinition in a later header never moves a
-- macro.
macroHomes :: [FamilyConstants] -> Map Text FamilyConstants
macroHomes families =
  Map.fromListWith
    (\_later earlier -> earlier)
    [(macro, family) | family <- families, macro <- family.headerMacros]

-- | A group with its host family and members' declaring families settled.
data ResolvedGroup = ResolvedGroup
  { host :: FamilyConstants
  -- ^ The family whose module carries the patterns.
  , target :: ConstantTarget
  , memberHomes :: [(Text, FamilyConstants)]
  -- ^ Each member macro with the family declaring it ('host' itself
  -- whenever its header does).
  }
  deriving stock (Eq, Generic, Show)

-- | Settle where a group lives, shared by the probe inputs and the plan.
--
-- A newtype group's host is the one family declaring the newtype. A
-- 'native' group has no newtype to follow, so its host is the family whose
-- header declares all of its members, which must be a single header.
resolveGroup
  :: [FamilyConstants]
  -> Map Text FamilyConstants
  -- ^ 'macroHomes' of the same families.
  -> Text
  -> ConstantGroup
  -> Either (Errors ConstantError) ResolvedGroup
resolveGroup families homes typeName group = case group.native of
  Nothing -> do
    host <- case [f | f <- families, Map.member typeName f.newtypeConstrs] of
      [f] -> Right f
      [] -> Left (errors1 ConstantTypeUnknown{typeName})
      fs ->
        Left
          ( errors1
              ConstantTypeAmbiguous{typeName, families = map (.familyBase) fs}
          )
    names <-
      validationToEither (enumerateMembers typeName group host.headerMacros boundMacros)
    let hostDeclares = Set.fromList host.headerMacros
        homeOf name
          | Set.member name hostDeclares = host
          | otherwise = Map.findWithDefault host name homes
    pure
      ResolvedGroup
        { host
        , target = NewtypeTarget (Map.findWithDefault typeName typeName host.newtypeConstrs)
        , memberHomes = [(name, homeOf name) | name <- names]
        }
  Just scalar -> do
    when (isJust group.prefix)
      $ Left
        ( errors1
            ConstantRuleInvalid
              { typeName
              , reason = "native groups need an explicit members list"
              }
        )
    names <- validationToEither (enumerateMembers typeName group [] boundMacros)
    let memberHomes = [(name, home) | name <- names, Just home <- [Map.lookup name homes]]
        declaring = Map.elems (Map.fromList [(f.familyBase, f) | (_, f) <- memberHomes])
    case declaring of
      [host] -> Right ResolvedGroup{host, target = NativeTarget scalar, memberHomes}
      _ ->
        Left
          ( errors1
              ConstantRuleInvalid
                { typeName
                , reason =
                    "native members must come from exactly one header, found "
                      <> if null declaring then
                        "none"
                      else
                        T.intercalate ", " (map (toText . (.headerName)) declaring)
                }
          )
 where
  boundMacros = Map.keysSet homes

-- | What the probe must evaluate: for every group that resolves, its type
-- and its members' macros. Rule failures resurface identically (same pure
-- inputs) from 'planConstants'.
constantProbeInputs :: ConstantsConfig -> [FamilyConstants] -> [(Text, [Text])]
constantProbeInputs config families =
  [ (typeName, map fst resolved.memberHomes)
  | (typeName, group) <- Map.toAscList config.groups
  , Right resolved <- [resolveGroup families homes typeName group]
  ]
 where
  homes = macroHomes families

-- | Validate the whole registry against the families and the probe
-- results, producing render-ready group plans (registry order).
planConstants
  :: ConstantsConfig
  -> [FamilyConstants]
  -> ProbeResult
  -> Either (Errors ConstantError) [ConstantGroupPlan]
planConstants config families probe =
  validationToEither
    $ overlapCheck
    *> traverse planGroup (Map.toAscList config.groups)
 where
  homes = macroHomes families

  -- The umbrella re-exports every family, so a pattern name is taken if
  -- any family exports it, not just the host.
  taken = foldMap (.takenNames) families

  -- The steps are genuinely sequential (no host -> no rule application;
  -- no width -> no fit check), so this runs in 'Either'; accumulation
  -- across groups is the outer 'traverse''s job.
  planGroup (typeName, group) = either Failure Success do
    resolved <- resolveGroup families homes typeName group
    widthBits <-
      maybeToRight
        (errors1 ConstantProbeMissing{probeName = typeName})
        ((* 8) <$> Map.lookup typeName probe.sizeofs)
    signed <-
      maybeToRight
        (errors1 ConstantProbeMissing{probeName = "signed:" <> typeName})
        (Map.lookup typeName probe.signedness)
    case resolved.target of
      NativeTarget scalar
        | nativeScalarBits scalar /= widthBits || nativeScalarSigned scalar /= signed ->
            Left
              ( errors1
                  ConstantNativeMismatch{typeName, native = scalar, widthBits, signed}
              )
      _matches -> pass
    when (signed && group.combine == Bitmask)
      $ Left
        ( errors1
            ConstantRuleInvalid
              { typeName
              , reason = "bitmask groups need an unsigned type"
              }
        )
    members <-
      validationToEither (traverse (memberOf typeName widthBits signed) resolved.memberHomes)
    pure
      ConstantGroupPlan
        { typeName
        , target = resolved.target
        , familyBase = resolved.host.familyBase
        , headerName = resolved.host.headerName
        , combine = group.combine
        , widthBits
        , members
        }

  memberOf typeName widthBits signed (cName, home) =
    case Map.lookup cName probe.values of
      Nothing -> Failure (errors1 ConstantProbeMissing{probeName = cName})
      Just image ->
        let value = signedImage signed image
         in failUnlessEmpty
              ( [ ConstantValueTooWide{typeName, cName, value, widthBits}
                | not (fits signed widthBits value)
                ]
                  <> [ ConstantNameCollision{typeName, cName}
                     | Set.member cName taken
                     ]
              )
              ConstantMember{cName, value, declaredIn = home.headerName}

  -- The probe prints @(unsigned long long)(NAME)@, i.e. the value modulo
  -- 2^64: a signed type's negative constants arrive in the upper half.
  signedImage signed image
    | signed && image >= 2 ^ (63 :: Int) = image - 2 ^ (64 :: Int)
    | otherwise = image

  fits signed widthBits value
    | signed = value >= negate half && value < half
    | otherwise = value >= 0 && value < 2 * half
   where
    half = 2 ^ (widthBits - 1) :: Integer

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
        , Right resolved <- [resolveGroup families homes typeName group]
        , (cName, _) <- resolved.memberHomes
        ]
