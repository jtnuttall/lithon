{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -Wno-orphans #-}

-- | The empirical SDL availability registry: @sdl3\/versions.json@.
--
-- SDL's @\\since@ annotations are the default availability source for
-- version gating, but they lie in both directions (@SDL_ProgressState@
-- claims 3.2.8 and does not exist until 3.4.0; @SDL_StretchSurface@
-- claims 3.4.0 and exists since 3.2.4) and are absent entirely at member
-- granularity (enum constants, struct fields). Every entry in the
-- registry was established by compiling the generated C against the real
-- SDL release-header matrix (3.2.0 through 3.4.2) — never by trusting
-- documentation. The registry is the deliberate, reviewable record of
-- those corrections, exactly like @aliases.json@ records flavor
-- decisions.
--
-- The orphan 'HasCodec' 'AbiSince' instance is deliberate: 'AbiSince' is
-- emitter vocabulary ("Lithon.Codegen.Sdl3.Abi") and must not know about
-- serialization; this module owns the registry format.
module Lithon.Codegen.Sdl3.Versions (
  VersionsRegistry (..),
  Versioned (..),
  StructEntry (..),
  PrologueEntry (..),
  TypedefShape (..),
  decodeVersionsRegistry,
  encodeVersionsRegistry,
  abiOverrides,
) where

import Autodocodec
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Sdl3.Abi (
  AbiOverrides (..),
  AbiSince (..),
  StructOverrides (..),
 )

-- | One versioned entry: the empirically established availability, plus
-- the evidence note (surfaced to reviewers, ignored by generation).
data Versioned = Versioned
  { since :: AbiSince
  , note :: Maybe Text
  }
  deriving stock (Eq, Generic, Show)

-- | Per-struct member gates. @sizeof-since@ gates the sizeof\/alignment
-- asserts separately from the struct's existence (set when a member
-- addition changed the size).
data StructEntry = StructEntry
  { sizeofSince :: Maybe AbiSince
  , note :: Maybe Text
  , members :: Map Text AbiSince
  }
  deriving stock (Eq, Generic, Show)

-- | The ABI-equivalent stand-in a wrapper-C prologue declares for a type
-- name absent from (or unreachable in) pre-3.4 headers. Linkage ignores
-- C types; only ABI shape matters.
data TypedefShape
  = ShapeInt
  | ShapeUint32
  | ShapeOpaqueStruct
  | ShapeVoidPtr
  deriving stock (Bounded, Enum, Eq, Generic, Show)

data PrologueEntry = PrologueEntry
  { shape :: TypedefShape
  , headers :: [FilePath]
  -- ^ The wrapper TUs (by header) whose signatures reference this name
  -- OUTSIDE version-gated stubs — the retype class: functions that exist
  -- at 3.2 but whose 3.4 signatures use a newer type name. Gated stubs
  -- carry their own prologue; these headers additionally get a
  -- family-wide one.
  , note :: Maybe Text
  }
  deriving stock (Eq, Generic, Show)

-- | The registry: keys are bare C names throughout.
data VersionsRegistry = VersionsRegistry
  { decls :: Map Text Versioned
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

decodeVersionsRegistry :: LBS.ByteString -> Either Text VersionsRegistry
decodeVersionsRegistry = first T.pack . eitherDecodeJSONViaCodec

encodeVersionsRegistry :: VersionsRegistry -> LBS.ByteString
encodeVersionsRegistry = encodeJSONViaCodec

-- | Project the registry onto the ABI distiller's override vocabulary.
abiOverrides :: VersionsRegistry -> AbiOverrides
abiOverrides reg =
  AbiOverrides
    { decls = (.since) <$> reg.decls
    , constants = ((.since) <$> reg.enumConstants) <> ((.since) <$> reg.valueGates)
    , macros = (.since) <$> reg.macroConstants
    , structs =
        reg.structs <&> \e ->
          StructOverrides{sizeofSince = e.sizeofSince, members = e.members}
    }

instance HasCodec AbiSince where
  codec = bimapCodec parseSince renderSince codec
   where
    parseSince :: Text -> Either String AbiSince
    parseSince t = case traverse (readMaybe . toString) (T.splitOn "." t) of
      Just [major, minor, patch] -> Right AbiSince{major, minor, patch}
      _malformed -> Left ("expected a MAJOR.MINOR.PATCH version, got: " <> toString t)

    renderSince v = T.intercalate "." (map show [v.major, v.minor, v.patch])

instance HasCodec Versioned where
  codec =
    object "Versioned"
      $ Versioned
      <$> requiredField "since" "empirically established availability"
      .= (.since)
      <*> optionalField "note" "the evidence, for reviewers"
      .= (.note)

instance HasCodec StructEntry where
  codec =
    object "StructEntry"
      $ StructEntry
      <$> optionalField "sizeof-since" "gate for the sizeof/alignment asserts"
      .= (.sizeofSince)
      <*> optionalField "note" "the evidence, for reviewers"
      .= (.note)
      <*> optionalFieldWithDefault "members" Map.empty "member name -> availability"
      .= (.members)

instance HasCodec TypedefShape where
  codec =
    stringConstCodec
      ( (ShapeInt, "int")
          :| [ (ShapeUint32, "uint32")
             , (ShapeOpaqueStruct, "opaque-struct")
             , (ShapeVoidPtr, "void-ptr")
             ]
      )

instance HasCodec PrologueEntry where
  codec =
    object "PrologueEntry"
      $ PrologueEntry
      <$> requiredField "shape" "the ABI-equivalent stand-in declaration"
      .= (.shape)
      <*> optionalFieldWithDefault
        "headers"
        []
        "wrapper TUs referencing this name outside gated stubs (retype class)"
      .= (.headers)
      <*> optionalField "note" "the evidence, for reviewers"
      .= (.note)

instance HasCodec VersionsRegistry where
  codec =
    object "VersionsRegistry"
      $ VersionsRegistry
      <$> optionalFieldWithDefault "decls" Map.empty "decl-level since corrections"
      .= (.decls)
      <*> optionalFieldWithDefault "enum-constants" Map.empty "constants added to pre-existing enums"
      .= (.enumConstants)
      <*> optionalFieldWithDefault "value-gates" Map.empty "constants whose value changed at the gate"
      .= (.valueGates)
      <*> optionalFieldWithDefault "macro-constants" Map.empty "typed-constant macros added post-baseline"
      .= (.macroConstants)
      <*> optionalFieldWithDefault "structs" Map.empty "per-struct member/size gates"
      .= (.structs)
      <*> optionalFieldWithDefault "prologue-typedefs" Map.empty "wrapper-prologue stand-in declarations"
      .= (.prologueTypedefs)
