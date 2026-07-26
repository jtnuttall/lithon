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
-- version macros — header truth, independent of any cabal flag. At the
-- current @sdl3 >= 3.4@ floor every guard is trivially true; they become
-- load-bearing when the version-gating work drops the floor to 3.2.
module Lithon.Codegen.Sdl3.Abi (
  AbiDecl (..),
  AbiKind (..),
  AbiField (..),
  AbiEnumConst (..),
  AbiMacroConst (..),
  AbiSince (..),
  AbiOverrides (..),
  StructOverrides (..),
  emptyAbiOverrides,
  sdlBaseline,
  declSince,
  distillAbi,
  renderAbiAssertions,
) where

import Data.Char (isDigit)
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Doxygen.Parser.Types qualified as Doxy
import Lithon.HsBindgen.C qualified as C

import Lithon.Codegen.Prelude

-- | Which C sort an 'AbiDecl' describes.
data AbiKind = AbiStruct | AbiUnion | AbiEnum
  deriving stock (Eq, Show)

-- | An assertable (explicit, non-bitfield) struct member.
data AbiField = AbiField
  { name :: Text
  , byteOffset :: Int
  , since :: Maybe AbiSince
  -- ^ Member-level availability (fields never carry @\\since@ upstream;
  -- this comes from the empirical override map).
  }
  deriving stock (Eq, Show)

data AbiEnumConst = AbiEnumConst
  { name :: Text
  , value :: Integer
  , since :: Maybe AbiSince
  -- ^ Constant-level availability or value-change gate (enumerators
  -- never carry @\\since@ upstream; empirical override map). The assert
  -- is emitted only at or above this version — for value changes, the
  -- baked value is the truth from this version on.
  }
  deriving stock (Eq, Show)

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
  deriving stock (Eq, Show)

-- | The SDL release a declaration's docs mark it @\@since@.
data AbiSince = AbiSince
  { major :: Int
  , minor :: Int
  , patch :: Int
  }
  deriving stock (Eq, Ord, Show)

-- | The oldest SDL with a stable ABI; @\@since@ at the baseline needs no
-- version guard.
sdlBaseline :: AbiSince
sdlBaseline = AbiSince{major = 3, minor = 2, patch = 0}

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
  , sizeSince :: Maybe AbiSince
  -- ^ When set (override map), the sizeof\/alignment asserts are gated
  -- separately from the decl's existence: the type predates this
  -- version but grew (e.g. @SDL_MouseWheelEvent@ 48 -> 56 at 3.2.12).
  }
  deriving stock (Eq, Show)

-- | Empirical availability overrides for the @>= 3.2.0@ floor, loaded
-- from @sdl3\/versions.json@ ("Lithon.Codegen.Sdl3.Versions"). SDL's
-- @\\since@ annotations are the default source but lie in both
-- directions and are absent at member granularity; every entry here was
-- established by compiling against the real SDL release-header matrix.
-- Keys are bare C names (no @struct@\/@enum@ spelling).
data AbiOverrides = AbiOverrides
  { decls :: Map Text AbiSince
  -- ^ Decl-level corrections (lies and missing annotations).
  , constants :: Map Text AbiSince
  -- ^ Enum constants: introduction gates and value-change gates, merged.
  , macros :: Map Text AbiSince
  -- ^ Typed-constant macros.
  , structs :: Map Text StructOverrides
  -- ^ Per-struct member/size gates.
  }
  deriving stock (Eq, Show)

data StructOverrides = StructOverrides
  { sizeofSince :: Maybe AbiSince
  , members :: Map Text AbiSince
  }
  deriving stock (Eq, Show)

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
          Just (Right (base AbiUnion u.sizeof u.alignment))
    C.DeclEnum e
      | named ->
          Just
            ( Right
                (base AbiEnum e.sizeof e.alignment :: AbiDecl)
                  { constants = constsOf ov.constants e.constants
                  }
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
        , sizeSince = structOv >>= (.sizeofSince)
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
        Right AbiField{name = fname, byteOffset = bits `div` 8, since = Map.lookup fname memberSinces}
    | C.FieldExplicit ef <- fs
    , isNothing ef.width
    , let bits = ef.offset
          fname = ef.info.name.cName.text
    ]

constsOf :: Map Text AbiSince -> [C.EnumConstant C.Final] -> [AbiEnumConst]
constsOf constSinces cs =
  [ AbiEnumConst{name = cname, value = c.value, since = Map.lookup cname constSinces}
  | c <- cs
  , let cname = c.info.name.cName.text
  ]

-- | The declaration's @\@since@ version, mirroring the vendored haddock
-- backend's extraction: the first version-shaped token of the doxygen
-- @\\since@ section ("This function is available since SDL 3.2.0.").
-- Exported for the wrapper version gates ("Lithon.Codegen.Sdl3.Bindgen"),
-- which correct it through the same registry as the assert TU.
declSince :: C.DeclInfo C.Final -> Maybe AbiSince
declSince info = do
  comment <- info.comment
  token <-
    safeHead
      [ tok
      | Doxy.SimpleSect Doxy.SSSince inner <- comment.doxygen.detailed
      , Just tok <- [versionToken (paraText inner)]
      ]
  parseSince token
 where
  paraText blocks =
    T.strip (T.unwords [t | Doxy.Paragraph inlines <- blocks, Doxy.Text t <- inlines])

  versionToken t = safeHead (filter isVersion (map (T.dropWhileEnd (== '.')) (T.words t)))
   where
    isVersion w =
      T.elem '.' w
        && T.all (\c -> isDigit c || c == '.') w
        && all (\g -> not (T.null g) && T.all isDigit g) (T.splitOn "." w)

  parseSince v = case traverse (readMaybe . toString) (T.splitOn "." v) of
    Just [major, minor] -> Just AbiSince{major, minor, patch = 0}
    Just [major, minor, patch] -> Just AbiSince{major, minor, patch}
    _malformed -> Nothing

-- | Render the assertion TU. 'Left' if two headers ever produced the
-- same C type (the chain's selection predicate should make that
-- impossible; a duplicate means double-baked layouts worth a hard stop).
renderAbiAssertions :: [FilePath] -> [AbiDecl] -> [AbiMacroConst] -> Either Text Text
renderAbiAssertions includes decls macroConsts =
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
              (c.name <> ": baked value " <> show c.value <> divergence)
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
    , " *"
    , " * #if guards mirror each declaration's documented @since — corrected"
    , " * and refined to member granularity by the empirical availability"
    , " * registry (lithon-codegen sdl3/versions.json) — on SDL's own version"
    , " * macros."
    , " */"
    , "#include <stddef.h>"
    , ""
    , "#define SDL_MAIN_HANDLED"
    ]
      <> ["#include <" <> toText inc <> ">" | inc <- includes]

  familyLines family =
    ["", "/* ---- " <> toText (head family).headerName <> " ---- */"]
      <> concatMap declLines (toList family)

  declLines d = versionGuard d.since (guardRuns outer entries)
   where
    outer = fromMaybe sdlBaseline d.since
    -- Members introduced (or resized/revalued) after the decl's own
    -- guard get nested guards; consecutive same-version members share
    -- one block.
    entries =
      [ (d.sizeSince
        , sassert
            ("sizeof(" <> d.cTypeName <> ") == " <> show d.sizeof)
            (d.cTypeName <> ": baked sizeof " <> show d.sizeof <> divergence)
        )
      , (d.sizeSince
        , sassert
            ("_Alignof(" <> d.cTypeName <> ") == " <> show d.alignment)
            (d.cTypeName <> ": baked alignment " <> show d.alignment <> divergence)
        )
      ]
        <> [ ( f.since
             , sassert
                 ("offsetof(" <> d.cTypeName <> ", " <> f.name <> ") == " <> show f.byteOffset)
                 (d.cTypeName <> "." <> f.name <> ": baked offset " <> show f.byteOffset <> divergence)
             )
           | f <- d.fields
           ]
        <> [ ( c.since
             , sassert
                 ("(" <> c.name <> ") == (" <> show c.value <> ")")
                 (c.name <> ": baked value " <> show c.value <> divergence)
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

  sassert cond msg = "_Static_assert(" <> cond <> ", \"" <> msg <> "\");"

  divergence = " differs from your SDL3 headers (sdl3-bindgen-sys README: ABI verification)"
