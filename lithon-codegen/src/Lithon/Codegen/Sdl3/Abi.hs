{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- At present, HLINT flags OverloadedRecordDot x.id.y as a redundant `id`
-- application.
{- HLINT ignore "Redundant id" -}

-- | The ABI assertion layer.
--
-- The generated Haskell bakes every size, alignment, field offset, and
-- enum value that libclang computed on the generation host. This module
-- distills that ground truth from the final C IR ('distillAbi') and
-- renders it as a C translation unit of @_Static_assert@s
-- ('renderAbiAssertions') that is compiled into the package via
-- @c-sources@: whoever builds the package re-checks the baked layout
-- against /their/ SDL headers, so divergence is a compile error naming
-- the exact declaration instead of runtime memory corruption.
--
-- Deliberately not asserted:
--
-- * bitfield members (@offsetof@ on them is ill-formed) and implicit\/
--   anonymous members — the enclosing type's size\/alignment asserts
--   still fence them;
-- * anonymous type declarations (their synthesized names are not C);
-- * opaque declarations (nothing is baked for them beyond what
--   'HsBindgen.IR.C.OpaqueSize' carries, and forward decls have no size
--   in C);
-- * macro constants, including anonymous-enum constants (value-only
--   vocabulary; the layout risk this TU exists for does not apply);
-- * @PlatformDefines@ (documented as generation-host values).
--
-- Declarations documented @\@since@ later than the SDL 3.2.0 baseline
-- get their asserts wrapped in @#if SDL_VERSION_ATLEAST@ on SDL's own
-- version macros — header truth, independent of any cabal flag. Members
-- have no @\@since@ section; SDL's convention for a late member is a
-- prose note in its own comment ("(added in 3.4.16)"), which
-- 'fieldSince' reads the same way. The registry corrects both.
--
-- Sizes are asserted @==@ by default: SDL fills most structs into memory
-- the bindings allocate at the baked size. A struct read only inside a
-- named union is asserted as a layout prefix instead ('LayoutPrefix':
-- offsets and alignment exact, sizeof @>=@, or @==@ again under the
-- package's @abi-assertions-exact@ flag) — derived from union membership
-- across every header, overridable either way by the registry. A
-- registry growth gate ('AbiGrowth') keeps the assertion on
-- both sides, each under the struct's layout policy: the baked layout at
-- or above the gate, the recorded pre-growth layout in an @#else@ branch
-- below it.
module Lithon.Codegen.Sdl3.Abi (
  AbiDecl (..),
  AbiKind (..),
  AbiField (..),
  AbiEnumConst (..),
  AbiMacroConst (..),
  AbiSince (..),
  AbiLayout (..),
  AbiLayoutBefore (..),
  AbiGrowth (..),
  AbiOverrides (..),
  StructOverrides (..),
  emptyAbiOverrides,
  sdlBaseline,
  renderSince,
  declSince,
  fieldSince,
  addedInSince,
  versionToken,
  parseSince,
  distillAbi,
  renderAbiAssertions,
) where

import Data.Char (isDigit)
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Doxygen.Parser.Types qualified as Doxy
import Lithon.HsBindgen.C qualified as C
import Lithon.Prelude

-- | Which C sort an 'AbiDecl' describes.
data AbiKind = AbiStruct | AbiUnion | AbiEnum
  deriving stock (Eq, Generic, Show)

-- | An assertable (explicit, non-bitfield) struct member.
data AbiField = AbiField
  { name :: Text
  , byteOffset :: Int
  , since :: Maybe AbiSince
  -- ^ Member-level availability: the registry's @members@ entry when
  -- there is one, else 'commentSince'.
  , commentSince :: Maybe AbiSince
  -- ^ What the member's own doxygen comment says, via SDL's prose
  -- convention for late members (\"(added in 3.4.16)\"); kept apart from
  -- 'since' so a validation error can say where a floor came from.
  }
  deriving stock (Eq, Generic, Show)

data AbiEnumConst = AbiEnumConst
  { name :: Text
  , value :: Integer
  , since :: Maybe AbiSince
  -- ^ Constant-level availability or value-change gate (enumerators
  -- never carry @\\since@ upstream; empirical override map). The assert
  -- is emitted only at or above this version — for value changes, the
  -- baked value is the truth from this version on.
  }
  deriving stock (Eq, Generic, Show)

-- | A typed-constant macro whose probed value the curated layer baked as
-- a pattern synonym (see "Lithon.Codegen.Sdl3.Alias.Constants"). Every
-- baked value is re-asserted against the consumer's headers, exactly like
-- enum values.
data AbiMacroConst = AbiMacroConst
  { name :: Text
  , value :: Integer
  , headerName :: FilePath
  , since :: Maybe AbiSince
  -- ^ From the empirical override map (macro constants' own docs are not
  -- trusted for availability).
  }
  deriving stock (Eq, Generic, Show)

-- | The SDL release a declaration's docs mark it @\@since@.
data AbiSince = AbiSince
  { major :: Int
  , minor :: Int
  , patch :: Int
  }
  deriving stock (Eq, Generic, Ord, Show)

-- | The oldest SDL with a stable ABI; @\@since@ at the baseline needs no
-- version guard.
sdlBaseline :: AbiSince
sdlBaseline = AbiSince{major = 3, minor = 2, patch = 0}

data AbiLayout
  = LayoutExact
  | -- | Offsets and alignment stay @==@ but sizeof is asserted @>=@ (@==@
    -- under the @abi-assertions-exact@ flag): SDL may append fields. Union
    -- members get it because the union's own exact sizeof is the backstop.
    LayoutPrefix
  deriving stock (Eq, Generic, Show)

data AbiLayoutBefore = AbiLayoutBefore
  { sizeof :: Int
  , alignment :: Int
  }
  deriving stock (Eq, Generic, Show)

data AbiGrowth = AbiGrowth
  { since :: AbiSince
  , before :: AbiLayoutBefore
  }
  deriving stock (Eq, Generic, Show)

renderSince :: AbiSince -> Text
renderSince v = T.intercalate "." (map show [v.major, v.minor, v.patch])

-- | The layout ground truth of one non-opaque, named C type declaration.
data AbiDecl = AbiDecl
  { cTypeName :: Text
  -- ^ C source spelling, e.g. @struct SDL_Rect@, @enum SDL_EventType@.
  , headerName :: FilePath
  -- ^ @SDL_video.h@ — for the rendered section banner.
  , kind :: AbiKind
  , sizeof :: Int
  , alignment :: Int
  , fields :: [AbiField]
  -- ^ Structs only; declaration order.
  , constants :: [AbiEnumConst]
  -- ^ Enums only; declaration order.
  , since :: Maybe AbiSince
  -- ^ The decl's doxygen @\@since@, corrected by the override map
  -- (SDL's annotations lie in both directions); 'Nothing' emits
  -- unguarded asserts.
  , growth :: Maybe AbiGrowth
  -- ^ When set (override map), the type predates its own guard but grew
  -- at the end at this version (e.g. @SDL_MouseWheelEvent@ 48 -> 56 at
  -- 3.2.12): the sizeof\/alignment asserts branch on it, the baked
  -- layout at or above and the recorded pre-growth layout below.
  , layout :: Maybe AbiLayout
  , memberTypes :: [Text]
  }
  deriving stock (Eq, Generic, Show)

-- | Empirical availability overrides for the @>= 3.2.0@ floor, loaded
-- from @sdl3\/versions.json@ ("Lithon.Codegen.Sdl3.Versions"). SDL's
-- @\\since@ annotations (and, for members, its \"(added in X.Y.Z)\"
-- notes) are the default source but lie in both directions and are
-- often simply absent; every entry here was established by compiling
-- against the real SDL release-header matrix.
-- Keys are bare C names (no @struct@\/@enum@ spelling).
data AbiOverrides = AbiOverrides
  { decls :: Map Text AbiSince
  -- ^ Decl-level corrections (lies and missing annotations).
  , constants :: Map Text AbiSince
  -- ^ Enum constants: introduction gates and value-change gates, merged.
  , macros :: Map Text AbiSince
  -- ^ Typed-constant macros.
  , structs :: Map Text StructOverrides
  -- ^ Per-struct member/size gates and layout policy.
  }
  deriving stock (Eq, Generic, Show)

data StructOverrides = StructOverrides
  { growth :: Maybe AbiGrowth
  , layout :: Maybe AbiLayout
  , members :: Map Text AbiSince
  }
  deriving stock (Eq, Generic, Show)

emptyAbiOverrides :: AbiOverrides
emptyAbiOverrides =
  AbiOverrides{decls = mempty, constants = mempty, macros = mempty, structs = mempty}

-- | Distill one header's reified declarations. 'Left' only on evidence
-- of a distiller bug (a non-bitfield member whose bit offset is not
-- byte-aligned cannot come out of a conforming C frontend).
distillAbi :: FilePath -> AbiOverrides -> [C.Decl l C.Final] -> Either Text [AbiDecl]
distillAbi headerName ov = sequenceA . mapMaybe abiDeclOf
 where
  abiDeclOf decl = case decl.kind of
    C.DeclStruct s | named -> Just do
      fields <- assertableFields cTypeName memberSinces s.fields
      Right (base AbiStruct s.sizeof s.alignment){fields}
    C.DeclUnion u
      | named ->
          -- Member offsets in a union are all zero; size/alignment is the
          -- whole layout story (SDL_Event's 128/8 included).
          Just (Right (base AbiUnion u.sizeof u.alignment){memberTypes = memberTypesOf u.fields})
    C.DeclEnum e
      | named ->
          Just
            ( Right
                $ base AbiEnum e.sizeof e.alignment
                & (#constants .~ constsOf ov.constants e.constants)
            )
    _notAssertable -> Nothing
   where
    cId = decl.info.id.cName
    named = not cId.isAnon
    bareName = cId.name.text
    cTypeName = C.renderDeclNameC cId.name
    structOv = Map.lookup bareName ov.structs
    memberSinces = maybe mempty (.members) structOv
    base kind sizeof alignment =
      AbiDecl
        { cTypeName
        , headerName
        , kind
        , sizeof
        , alignment
        , fields = []
        , constants = []
        , -- The override map wins over the header's own annotation: SDL's
          -- @\since@ lies in both directions (see sdl3/versions.json).
          since = Map.lookup bareName ov.decls <|> declSince decl.info
        , growth = structOv >>= (.growth)
        , layout = structOv >>= (.layout)
        , memberTypes = []
        }

assertableFields :: Text -> Map Text AbiSince -> [C.Field C.Final] -> Either Text [AbiField]
assertableFields owner memberSinces fs =
  sequenceA
    [ if bits `mod` 8 /= 0 then
        Left
          ( "abi: "
              <> owner
              <> "."
              <> fname
              <> " is not a bitfield but has non-byte bit offset "
              <> show bits
          )
      else
        Right
          AbiField
            { name = fname
            , byteOffset = bits `div` 8
            , -- The registry wins over the member's own note, as for decls.
              since = Map.lookup fname memberSinces <|> commentSince
            , commentSince
            }
    | C.FieldExplicit ef <- fs
    , isNothing ef.width
    , let bits = ef.offset
          fname = ef.info.name.cName.text
          commentSince = fieldSince ef.info
    ]

constsOf :: Map Text AbiSince -> [C.EnumConstant C.Final] -> [AbiEnumConst]
constsOf constSinces cs =
  [ AbiEnumConst{name = cname, value = c.value, since = Map.lookup cname constSinces}
  | c <- cs
  , let cname = c.info.name.cName.text
  ]

memberTypesOf :: [C.Field C.Final] -> [Text]
memberTypesOf fs =
  [ C.renderDeclNameC ref.cName.name
  | f <- fs
  , C.TypeRef ref <- [C.getCanonicalType f.typ]
  ]

-- | The declaration's @\@since@ version, mirroring the vendored haddock
-- backend's extraction: the first version-shaped token of the doxygen
-- @\\since@ section ("This function is available since SDL 3.2.0.").
-- Exported for the wrapper version gates ("Lithon.Codegen.Sdl3.Bindgen"),
-- which correct it through the same registry as the assert TU.
declSince :: C.DeclInfo C.Final -> Maybe AbiSince
declSince info = do
  comment <- info.comment
  safeHead
    [ v
    | Doxy.SimpleSect Doxy.SSSince inner <- comment.doxygen.detailed
    , Just v <- [versionToken (blockText inner)]
    ]

-- | A member's availability from its own doxygen comment: SDL's prose
-- convention for a late member is \"(added in 3.4.16)\" in the
-- @\/**< ... *\/@ trailing its declaration (fields never carry a
-- @\\since@ section). The registry wins over it ('assertableFields').
fieldSince :: C.FieldInfo C.Final -> Maybe AbiSince
fieldSince info = do
  comment <- info.comment
  addedInSince (inlineText comment.doxygen.brief <> " " <> blockText comment.doxygen.detailed)

-- | The version named by the first \"added in\" phrase in prose,
-- case-insensitive, an intervening \"SDL\" word tolerated.
addedInSince :: Text -> Maybe AbiSince
addedInSince prose = do
  let (_, hit) = T.breakOn marker (T.toLower prose)
  guard (not (T.null hit))
  w <- safeHead (dropSdl (T.words (T.drop (T.length marker) hit)))
  parseSince w
 where
  marker = "added in "
  dropSdl = \case
    ("sdl" : rest) -> rest
    ws -> ws

-- | The first version-shaped word in prose ("SDL 3.2.0." -> 3.2.0).
versionToken :: Text -> Maybe AbiSince
versionToken = safeHead . mapMaybe parseSince . T.words

-- | One word as a version: two or three dot-separated digit groups, a
-- trailing run of sentence punctuation tolerated ("3.4.16)." -> 3.4.16).
-- Two groups mean patch 0.
parseSince :: Text -> Maybe AbiSince
parseSince w
  | all (\g -> not (T.null g) && T.all isDigit g) groups =
      case traverse (readMaybe . toString) groups of
        Just [major, minor] -> Just AbiSince{major, minor, patch = 0}
        Just [major, minor, patch] -> Just AbiSince{major, minor, patch}
        _malformed -> Nothing
  | otherwise = Nothing
 where
  groups = T.splitOn "." (T.dropWhileEnd (`elem` (".,;:)" :: String)) w)

-- | The plain text of a doxygen paragraph list (paragraphs only).
blockText :: [Doxy.Block r] -> Text
blockText blocks = T.strip (T.unwords [inlineText inlines | Doxy.Paragraph inlines <- blocks])

-- | The display text of doxygen inlines, markup flattened.
inlineText :: [Doxy.Inline r] -> Text
inlineText =
  T.concat . map \case
    Doxy.Text t -> t
    Doxy.Bold is -> inlineText is
    Doxy.Emph is -> inlineText is
    Doxy.Mono is -> inlineText is
    Doxy.Ref _ t -> t
    Doxy.Anchor _ -> ""
    Doxy.Link is _ -> inlineText is

-- | Render the assertion TU. 'Left' if two headers ever produced the
-- same C type (the chain's selection predicate should make that
-- impossible; a duplicate means double-baked layouts worth a hard stop).
renderAbiAssertions :: Text -> [FilePath] -> [AbiDecl] -> [AbiMacroConst] -> Either Text Text
renderAbiAssertions sdlVersion includes decls macroConsts =
  case toList (duplicates (map (.cTypeName) decls)) of
    [] -> Right rendered
    dups -> Left ("abi: type declared by more than one header: " <> T.intercalate ", " dups)
 where
  rendered =
    T.unlines
      $ prologue
      <> concatMap familyLines (NE.groupBy ((==) `on` (.headerName)) decls)
      <> concatMap constFamilyLines (NE.groupBy ((==) `on` (.headerName)) macroConsts)

  -- Typed-constant sections follow the layout sections: probed macro
  -- values, compared with an @ull@ literal so the usual arithmetic
  -- conversions cover every UintN width.
  constFamilyLines family =
    ["", "/* ---- " <> toText (head family).headerName <> " (typed constants) ---- */"]
      <> guardRuns
        sdlBaseline
        [ ( c.since
          , sassert
              ("(" <> c.name <> ") == (" <> show c.value <> "ull)")
              (quoted (c.name <> ": baked value " <> show c.value <> divergence))
          )
        | c <- toList family
        ]

  prologue =
    [ "/* GENERATED by lithon-codegen (sdl3 generate) - do not edit."
    , " *"
    , " * Every size, alignment, field offset, and enum value baked into the"
    , " * generated Haskell is re-asserted here against the SDL headers this"
    , " * package is compiled with. A failing line means the bindings would"
    , " * corrupt memory under this platform/SDL — the build stops instead."
    , " * See the package README, section \"ABI verification\"."
    , " * A sizeof asserted with >= belongs to a struct the bindings only ever"
    , " * read inside a named union (SDL_Event, SDL_HapticEffect) or one the"
    , " * registry marks layout: prefix. SDL may append fields to it; its known"
    , " * fields stay pinned by offset and the union's own size stays exact."
    , " * Building with the cabal flag abi-assertions-exact makes every sizeof"
    , " * exact again, for checking a newer SDL."
    , " *"
    , " * #if guards mirror each declaration's documented @since and each"
    , " * member's \"(added in X.Y.Z)\" note — corrected and refined by the"
    , " * empirical availability registry (lithon-codegen sdl3/versions.json)"
    , " * — on SDL's own version macros."
    , " */"
    , "#define LITHON_ABI_HELP \". sdl3-bindgen-sys was generated from SDL "
        <> sdlVersion
        <> "; see the README section ABI verification. Please report this at"
        <> " https://github.com/jtnuttall/lithon/issues with your SDL version and platform,"
        <> " and if you are comfortable, open a PR updating the SDL version the bindings"
        <> " are generated from.\""
    , "#ifdef LITHON_ABI_EXACT"
    , "#define LITHON_ABI_PREFIX_OP =="
    , "#define LITHON_ABI_PREFIX_MSG \"differs from your SDL3 headers (exact mode)\""
    , "#else"
    , "#define LITHON_ABI_PREFIX_OP >="
    , "#define LITHON_ABI_PREFIX_MSG \"exceeds your SDL3 headers"
        <> " (growth is accepted, shrinking is not)\""
    , "#endif"
    , "#include <stddef.h>"
    , ""
    , "#define SDL_MAIN_HANDLED"
    ]
      <> ["#include <" <> toText inc <> ">" | inc <- includes]

  familyLines family =
    ["", "/* ---- " <> toText (head family).headerName <> " ---- */"]
      <> concatMap declLines (toList family)

  unionMemberTypes = Set.fromList (concatMap (.memberTypes) decls)

  layoutOf d = fromMaybe derived d.layout
   where
    derived
      | d.cTypeName `Set.member` unionMemberTypes = LayoutPrefix
      | otherwise = LayoutExact

  declLines d = versionGuard d.since (layoutLines <> guardRuns outer entries)
   where
    outer = fromMaybe sdlBaseline d.since
    layoutLines = case d.growth of
      Just g
        | g.since > outer ->
            [atleastLine g.since]
              <> layoutAsserts "baked" d.sizeof d.alignment
              <> ["#else"]
              <> layoutAsserts ("pre-" <> renderSince g.since) g.before.sizeof g.before.alignment
              <> ["#endif"]
      _atOrBelowOuter -> layoutAsserts "baked" d.sizeof d.alignment
    layoutAsserts prov sizeof alignment =
      [ sassert
          ("sizeof(" <> d.cTypeName <> ") " <> sizeOp <> " " <> show sizeof)
          (sizeMsg (d.cTypeName <> ": " <> prov <> " sizeof " <> show sizeof))
      , sassert
          ("_Alignof(" <> d.cTypeName <> ") == " <> show alignment)
          (quoted (d.cTypeName <> ": " <> prov <> " alignment " <> show alignment <> divergence))
      ]
    (sizeOp, sizeMsg) = case layoutOf d of
      LayoutExact -> ("==", \msg -> quoted (msg <> divergence))
      LayoutPrefix ->
        ("LITHON_ABI_PREFIX_OP", \msg -> quoted (msg <> " ") <> " LITHON_ABI_PREFIX_MSG")
    -- Members introduced (or resized/revalued) after the decl's own
    -- guard get nested guards; consecutive same-version members share
    -- one block.
    entries =
      [ ( f.since
        , sassert
            ("offsetof(" <> d.cTypeName <> ", " <> f.name <> ") == " <> show f.byteOffset)
            (quoted (d.cTypeName <> "." <> f.name <> ": baked offset " <> show f.byteOffset <> divergence))
        )
      | f <- d.fields
      ]
        <> [ ( c.since
             , sassert
                 ("(" <> c.name <> ") == (" <> show c.value <> ")")
                 (quoted (c.name <> ": baked value " <> show c.value <> divergence))
             )
           | c <- d.constants
           ]

  versionGuard since body = case since of
    Just v | v > sdlBaseline -> atleastLine v : body <> ["#endif"]
    _baselineOrUnknown -> body

  -- Emit assert lines with per-entry gates relative to the enclosing
  -- guard: entries gated at or below @outer@ are emitted bare; runs of
  -- consecutive entries sharing a later version share one @#if@ block.
  guardRuns outer entries =
    concatMap emit (NE.groupBy ((==) `on` fst) [(gateOf s, l) | (s, l) <- entries])
   where
    gateOf = \case
      Just v | v > outer -> Just v
      _atOrBelowOuter -> Nothing
    emit run = case fst (NE.head run) of
      Nothing -> toList (fmap snd run)
      Just v -> atleastLine v : toList (fmap snd run) <> ["#endif"]

  atleastLine v =
    "#if SDL_VERSION_ATLEAST("
      <> show v.major
      <> ", "
      <> show v.minor
      <> ", "
      <> show v.patch
      <> ")"

  sassert cond msg = "_Static_assert(" <> cond <> ", " <> msg <> " LITHON_ABI_HELP);"

  divergence = " differs from your SDL3 headers"
