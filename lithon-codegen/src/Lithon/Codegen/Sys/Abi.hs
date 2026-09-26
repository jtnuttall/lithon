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
-- against /their/ library headers, so divergence is a compile error naming
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
-- Declarations available later than the target's baseline (SDL: 3.2.0)
-- get their asserts wrapped in the target's own version-macro condition
-- (SDL: @#if SDL_VERSION_ATLEAST@) — header truth, independent of any
-- cabal flag. Availability comes from the target's
-- 'Lithon.Codegen.Sys.Target.VersionScheme' readers (SDL: the doxygen
-- @\@since@ section, and for members, which have none, the prose note
-- \"(added in 3.4.16)\" in their own comment). The registry corrects both.
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
module Lithon.Codegen.Sys.Abi (
  AbiDecl (..),
  AbiKind (..),
  AbiField (..),
  AbiEnumConst (..),
  AbiMacroConst (..),
  AbiLayout (..),
  AbiLayoutBefore (..),
  AbiGrowth (..),
  AbiOverrides (..),
  StructOverrides (..),
  emptyAbiOverrides,
  distillAbi,
  renderAbiAssertions,
) where

import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.HsBindgen.C qualified as C
import Lithon.Prelude

import Lithon.Codegen.Sys.Target (
  ParseEnv (..),
  Prose (..),
  SysTarget (..),
  VersionScheme (..),
  defineLine,
 )
import Lithon.Codegen.Sys.Version (AbiSince, renderSince)

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
-- a pattern synonym (see "Lithon.Codegen.Sys.Alias.Constants"). Every
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
-- from @sdl3\/versions.json@ ("Lithon.Codegen.Sys.Versions"). SDL's
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

-- | Distill one header's reified declarations, reading documented
-- availability through the target's 'VersionScheme'. 'Left' only on
-- evidence of a distiller bug (a non-bitfield member whose bit offset is
-- not byte-aligned cannot come out of a conforming C frontend).
distillAbi
  :: VersionScheme -> FilePath -> AbiOverrides -> [C.Decl l C.Final] -> Either Text [AbiDecl]
distillAbi scheme headerName ov = sequenceA . mapMaybe abiDeclOf
 where
  abiDeclOf decl = case decl.kind of
    C.DeclStruct s | named -> Just do
      fields <- assertableFields scheme cTypeName memberSinces s.fields
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
          since = Map.lookup bareName ov.decls <|> scheme.declSince decl.info
        , growth = structOv >>= (.growth)
        , layout = structOv >>= (.layout)
        , memberTypes = []
        }

assertableFields
  :: VersionScheme -> Text -> Map Text AbiSince -> [C.Field C.Final] -> Either Text [AbiField]
assertableFields scheme owner memberSinces fs =
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
          commentSince = scheme.fieldSince ef.info
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

-- | Render the assertion TU for the target, given the library version the
-- layouts were distilled from and the include arguments of its prologue.
-- 'Left' if two headers ever produced the same C type (the chain's
-- selection predicate should make that impossible; a duplicate means
-- double-baked layouts worth a hard stop).
renderAbiAssertions
  :: SysTarget -> Text -> [FilePath] -> [AbiDecl] -> [AbiMacroConst] -> Either Text Text
renderAbiAssertions target libraryVersion includes decls macroConsts =
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
        baseline
        [ ( c.since
          , sassert
              ("(" <> c.name <> ") == (" <> show c.value <> "ull)")
              (quoted (c.name <> ": baked value " <> show c.value <> divergence))
          )
        | c <- toList family
        ]

  baseline = target.versioning.baseline
  label = target.versionLabel

  prologue =
    [ "/* GENERATED by lithon-codegen (" <> target.key <> " generate) - do not edit."
    , " *"
    ]
      <> map bannerLine target.prose.abiBanner
      <> [ " */"
         , "#define LITHON_ABI_HELP \". "
             <> target.packageName
             <> " was generated from "
             <> label
             <> " "
             <> libraryVersion
             <> "; see the README section ABI verification. Please report this at"
             <> " https://github.com/jtnuttall/lithon/issues with your "
             <> label
             <> " version and platform,"
             <> " and if you are comfortable, open a PR updating the "
             <> label
             <> " version the bindings"
             <> " are generated from.\""
         , "#ifdef LITHON_ABI_EXACT"
         , "#define LITHON_ABI_PREFIX_OP =="
         , "#define LITHON_ABI_PREFIX_MSG \"differs from your "
             <> target.displayName
             <> " headers (exact mode)\""
         , "#else"
         , "#define LITHON_ABI_PREFIX_OP >="
         , "#define LITHON_ABI_PREFIX_MSG \"exceeds your "
             <> target.displayName
             <> " headers"
             <> " (growth is accepted, shrinking is not)\""
         , "#endif"
         , "#include <stddef.h>"
         , ""
         ]
      <> map defineLine target.parse.defines
      <> ["#include <" <> toText inc <> ">" | inc <- includes]

  bannerLine l
    | T.null l = " *"
    | otherwise = " * " <> l

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
    outer = fromMaybe baseline d.since
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
    Just v | v > baseline -> atleastLine v : body <> ["#endif"]
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

  atleastLine v = "#if " <> target.versioning.atLeast v

  sassert cond msg = "_Static_assert(" <> cond <> ", " <> msg <> " LITHON_ABI_HELP);"

  divergence = " differs from your " <> target.displayName <> " headers"
