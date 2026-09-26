{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | A target's empirical availability registry:
-- @lithon-codegen\/data\/\<key\>\/versions.json@ (SDL:
-- @sdl3\/versions.json@).
--
-- The library's documented availability (SDL: its @\\since@
-- annotations) is the default source for version gating, but it lies in
-- both directions (SDL: @SDL_ProgressState@ claims 3.2.8 and does not
-- exist until 3.4.0; @SDL_StretchSurface@ claims 3.4.0 and exists since
-- 3.2.4) and is absent entirely at member granularity (enum constants,
-- struct fields), when the library documents it at all. Every entry in
-- the registry was established by compiling the generated C against the
-- real release-header matrix (SDL: 3.2.0 through 3.4.16) — never by
-- trusting documentation. The registry is the deliberate, reviewable
-- record of those corrections, exactly like @aliases.json@ records flavor
-- decisions.
--
-- Every version in the registry has the target's arity
-- ('Lithon.Codegen.Sys.Target.VersionScheme'), so the codecs are
-- functions of it ('registryCodec'). They are plain values rather than
-- 'HasCodec' instances: the emitter vocabulary
-- ("Lithon.Codegen.Sys.Version", "Lithon.Codegen.Sys.Abi") must not know
-- about serialization; this module owns the registry format.
module Lithon.Codegen.Sys.Versions (
  VersionsRegistry (..),
  DeclEntry (..),
  Versioned (..),
  StructEntry (..),
  PrologueEntry (..),
  ShapeSpec (..),
  registryCodec,
  decodeVersionsRegistry,
  encodeVersionsRegistry,
  abiOverrides,
) where

import Autodocodec
import Data.Aeson qualified as Aeson
import Data.Aeson.Types qualified as Aeson
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Sys.Abi (
  AbiGrowth (..),
  AbiLayout (..),
  AbiLayoutBefore (..),
  AbiOverrides (..),
  StructOverrides (..),
 )
import Lithon.Codegen.Sys.Version (Version, versionCodec)

-- | One versioned entry: the empirically established availability, plus
-- the evidence note (surfaced to reviewers, ignored by generation).
data Versioned = Versioned
  { since :: Version
  , note :: Maybe Text
  }
  deriving stock (Eq, Generic, Show)

-- | A decl-level availability correction. For a function gated by it
-- (available only above the baseline), @stub-return@ is the C expression
-- its wrapper returns below the gate instead of @0@ — a sentinel the
-- library defines at the baseline, or a polyfill over the wrapper's
-- parameters, which are named @arg1@ … @argN@ in declaration order. A
-- void function's stub returns nothing, and a FunPtr address getter's
-- always returns a null pointer. A @stub-return@ no gated stub returns —
-- on a decl that no header gates, or on a void function — is a hard
-- error ('Lithon.Codegen.Sys.Chain.unusedStubReturns').
data DeclEntry = DeclEntry
  { since :: Version
  , stubReturn :: Maybe Text
  , note :: Maybe Text
  }
  deriving stock (Eq, Generic, Show)

-- | Per-struct member gates and layout policy. @sizeof-since@ gates the
-- sizeof\/alignment asserts separately from the struct's existence (set
-- when a member addition changed the size) and must come with @before@,
-- the pre-growth layout asserted below the gate; growth is assumed
-- appended, since the earlier members' offsets stay asserted unguarded.
-- @layout@ overrides the emitter's derived policy.
data StructEntry = StructEntry
  { sizeofSince :: Maybe Version
  , before :: Maybe AbiLayoutBefore
  , layout :: Maybe AbiLayout
  , note :: Maybe Text
  , members :: Map Text Version
  }
  deriving stock (Eq, Generic, Show)

-- | The ABI-equivalent stand-in a wrapper-C prologue declares for a type
-- name absent from (or unreachable in) older headers. Linkage ignores C
-- types; only ABI shape matters. Spelled @\"opaque-struct\"@,
-- @\"void-ptr\"@, or any other string: the C type the name aliases
-- (@\"int\"@, SDL's @\"Uint32\"@).
data ShapeSpec
  = -- | @typedef \<spelling\> \<name\>;@
    ShapeAlias Text
  | -- | @typedef struct \<name\> \<name\>;@
    ShapeOpaqueStruct
  | -- | @typedef void *\<name\>;@ (function pointers included).
    ShapeVoidPtr
  deriving stock (Eq, Generic, Show)

data PrologueEntry = PrologueEntry
  { since :: Version
  -- ^ The release that declares the name; the stand-in is guarded to
  -- versions below it.
  , shape :: ShapeSpec
  , headers :: [FilePath]
  -- ^ The headers (by basename) whose wrapper TUs name this type: list a
  -- header whenever ANY wrapper in it names the type, gated or not — the
  -- retype class (SDL: functions that exist at 3.2.0 but whose 3.4.0
  -- signatures use a newer type name) as well as version-gated
  -- functions. The stand-ins come only from this family-wide prologue; a
  -- gated stub's own prologue carries includes, never typedefs. A header
  -- whose wrappers name none of the types listed for it fails
  -- generation.
  , note :: Maybe Text
  }
  deriving stock (Eq, Generic, Show)

-- | The registry: keys are bare C names throughout.
data VersionsRegistry = VersionsRegistry
  { decls :: Map Text DeclEntry
  -- ^ Decl-level @\\since@ corrections (lies and missing annotations).
  , enumConstants :: Map Text Versioned
  -- ^ Constants added to pre-existing enums.
  , valueGates :: Map Text Versioned
  -- ^ Constants whose VALUE changed: the baked value is asserted only at
  -- or above the gate (kept separate from introductions for review;
  -- generation merges them).
  , macroConstants :: Map Text Versioned
  -- ^ Typed-constant macros added after the baseline.
  , structs :: Map Text StructEntry
  , prologueTypedefs :: Map Text PrologueEntry
  -- ^ Type names wrapper prologues must declare below their @since@.
  }
  deriving stock (Eq, Generic, Show)

-- | Decode a registry whose versions all have the given arity.
decodeVersionsRegistry :: Int -> LBS.ByteString -> Either Text VersionsRegistry
decodeVersionsRegistry arity bytes = first T.pack do
  value <- Aeson.eitherDecode bytes
  Aeson.parseEither (parseJSONVia (registryCodec arity)) value

encodeVersionsRegistry :: Int -> VersionsRegistry -> LBS.ByteString
encodeVersionsRegistry arity = Aeson.encode . toJSONVia (registryCodec arity)

-- | Project the registry onto the ABI distiller's override vocabulary.
abiOverrides :: VersionsRegistry -> AbiOverrides
abiOverrides reg =
  AbiOverrides
    { decls = (.since) <$> reg.decls
    , constants = ((.since) <$> reg.enumConstants) <> ((.since) <$> reg.valueGates)
    , macros = (.since) <$> reg.macroConstants
    , structs =
        reg.structs <&> \e ->
          StructOverrides
            { growth = AbiGrowth <$> e.sizeofSince <*> e.before
            , layout = e.layout
            , members = e.members
            }
    }

-- | The registry format at the given version arity.
registryCodec :: Int -> JSONCodec VersionsRegistry
registryCodec arity =
  object "VersionsRegistry"
    $ VersionsRegistry
    <$> optionalFieldWithDefaultWith
      "decls"
      (mapCodec (declEntryCodec arity))
      Map.empty
      "decl-level since corrections"
    .= (.decls)
    <*> optionalFieldWithDefaultWith
      "enum-constants"
      (mapCodec (versionedCodec arity))
      Map.empty
      "constants added to pre-existing enums"
    .= (.enumConstants)
    <*> optionalFieldWithDefaultWith
      "value-gates"
      (mapCodec (versionedCodec arity))
      Map.empty
      "constants whose value changed at the gate"
    .= (.valueGates)
    <*> optionalFieldWithDefaultWith
      "macro-constants"
      (mapCodec (versionedCodec arity))
      Map.empty
      "typed-constant macros added post-baseline"
    .= (.macroConstants)
    <*> optionalFieldWithDefaultWith
      "structs"
      (mapCodec (structEntryCodec arity))
      Map.empty
      "per-struct member/size gates and layout policy"
    .= (.structs)
    <*> optionalFieldWithDefaultWith
      "prologue-typedefs"
      (mapCodec (prologueEntryCodec arity))
      Map.empty
      "wrapper-prologue stand-in declarations"
    .= (.prologueTypedefs)

versionedCodec :: Int -> JSONCodec Versioned
versionedCodec arity =
  object "Versioned"
    $ Versioned
    <$> requiredFieldWith "since" (versionCodec arity) "empirically established availability"
    .= (.since)
    <*> optionalField "note" "the evidence, for reviewers"
    .= (.note)

declEntryCodec :: Int -> JSONCodec DeclEntry
declEntryCodec arity =
  object "DeclEntry"
    $ DeclEntry
    <$> requiredFieldWith "since" (versionCodec arity) "empirically established availability"
    .= (.since)
    <*> optionalField
      "stub-return"
      "C expression a gated wrapper returns below its gate (default 0; parameters are arg1..argN)"
    .= (.stubReturn)
    <*> optionalField "note" "the evidence, for reviewers"
    .= (.note)

structEntryCodec :: Int -> JSONCodec StructEntry
structEntryCodec arity =
  bimapCodec growthPaired id
    $ object "StructEntry"
    $ StructEntry
    <$> optionalFieldWith
      "sizeof-since"
      (versionCodec arity)
      "gate for the sizeof/alignment asserts"
    .= (.sizeofSince)
    <*> optionalFieldWith
      "before"
      layoutBeforeCodec
      "pre-growth sizeof/alignment, asserted below sizeof-since"
    .= (.before)
    <*> optionalFieldWith "layout" layoutCodec "exact (default) or prefix (sizeof asserted >=)"
    .= (.layout)
    <*> optionalField "note" "the evidence, for reviewers"
    .= (.note)
    <*> optionalFieldWithDefaultWith
      "members"
      (mapCodec (versionCodec arity))
      Map.empty
      "member name -> availability"
    .= (.members)
 where
  growthPaired e
    | isJust e.sizeofSince == isJust e.before = Right e
    | otherwise = Left "sizeof-since and before must be given together"

layoutCodec :: JSONCodec AbiLayout
layoutCodec = stringConstCodec ((LayoutExact, "exact") :| [(LayoutPrefix, "prefix")])

layoutBeforeCodec :: JSONCodec AbiLayoutBefore
layoutBeforeCodec =
  object "AbiLayoutBefore"
    $ AbiLayoutBefore
    <$> requiredField "sizeof" "sizeof below the gate"
    .= (.sizeof)
    <*> requiredField "alignment" "alignment below the gate"
    .= (.alignment)

shapeCodec :: JSONCodec ShapeSpec
shapeCodec = bimapCodec parseShape renderShape textCodec
 where
  parseShape = \case
    "opaque-struct" -> Right ShapeOpaqueStruct
    "void-ptr" -> Right ShapeVoidPtr
    spelling
      | T.null (T.strip spelling) -> Left "expected opaque-struct, void-ptr, or a C type spelling"
      | otherwise -> Right (ShapeAlias spelling)
  renderShape = \case
    ShapeAlias spelling -> spelling
    ShapeOpaqueStruct -> "opaque-struct"
    ShapeVoidPtr -> "void-ptr"

prologueEntryCodec :: Int -> JSONCodec PrologueEntry
prologueEntryCodec arity =
  object "PrologueEntry"
    $ PrologueEntry
    <$> requiredFieldWith
      "since"
      (versionCodec arity)
      "the release declaring the name; the stand-in is declared below it"
    .= (.since)
    <*> requiredFieldWith
      "shape"
      shapeCodec
      "the ABI-equivalent stand-in: opaque-struct, void-ptr, or the aliased C type"
    .= (.shape)
    <*> optionalFieldWithDefault
      "headers"
      []
      "wrapper TUs referencing this name outside gated stubs (retype class)"
    .= (.headers)
    <*> optionalField "note" "the evidence, for reviewers"
    .= (.note)
