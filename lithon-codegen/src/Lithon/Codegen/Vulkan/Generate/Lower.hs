{-# LANGUAGE OverloadedStrings #-}

-- | Type lowering (generate pass g2): every struct\/union member gets a
-- 'CType' — a tiny closed wire AST that is the single source of truth for
-- the layout pass (g3) and the ABI gate's C rendering, and later for
-- marshal planning.
--
-- The classifier is total over the curated surface: anything it cannot
-- place is a loud 'LowerError' naming the entity and member, never a guess.
module Lithon.Codegen.Vulkan.Generate.Lower (
  CPrim (..),
  CType (..),
  LoweredMember (..),
  Lowered (..),
  LowerError (..),
  lowerStructs,
  primSizeAlign,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Types.Enums (BitWidth (..), EnumsKind (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBitmask (..),
  ResolvedDim (..),
  ResolvedHandle (..),
  ResolvedMember (..),
  ResolvedStruct (..),
  ResolvedTypeRef (..),
  TypeRefKind (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (ResolvedEnumBlock (..))
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))

-- | Sized scalar wire types. 'PPtrSized' covers platform value handles
-- (HWND, LPCWSTR, …) that are pointer-width scalars, not data pointers.
data CPrim
  = PU8
  | PU16
  | PU32
  | PU64
  | PI8
  | PI16
  | PI32
  | PI64
  | PFloat
  | PDouble
  | PSizeT
  | PChar
  | PPtrSized
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData, ToJSON)

-- | The wire shape of one member under the LP64 64-bit ABI.
data CType
  = CPrim !CPrim
  | -- | @VkBool32@ — wire 'PU32', surfaced as 'Bool'.
    CBool32
  | -- | Plain enum: wire Int32.
    CEnum !TypeName
  | -- | Bitmask (the Flags side): wire Word32\/Word64 per width.
    CFlags !TypeName !BitWidth
  | -- | Member typed by a FlagBits BLOCK directly (registry idiom for
    -- single-bit values, e.g. @currentTransform@): same wire as 'CFlags',
    -- surfaced as @Flags \<Bits\>@.
    CFlagsBits !TypeName !BitWidth
  | -- | Non-dispatchable handle: wire Word64.
    CHandleND !TypeName
  | -- | Dispatchable handle: wire = opaque pointer (POD-disqualifying —
    -- lithon's rich handle type carries a dispatch table).
    CHandleD !TypeName
  | -- | Nested struct or union by value.
    CStructRef !TypeName
  | -- | Any data pointer (all pointers lay out 8\/8; pointee analysis is
    -- marshal planning's business, not layout's).
    CPtr
  | -- | A typed function pointer (carries the PFN_ alias name so field
    -- rendering can surface the real type; layout is always 8\/8).
    CFuncPtr !TypeName
  | -- | Fixed array, multidimensional dims pre-flattened (row-major).
    CArray !Integer !CType
  | -- | Bitfield of the given width over a base unit.
    CBitfield !Int !CPrim
  | -- | WithNS pointer-sized platform value handle (HWND, LPCWSTR, ...):
    -- surfaced as its "Lithon.Core.Platform" newtype.
    CPlatform !Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data LoweredMember = LoweredMember
  { name :: !Text
  , ctype :: !CType
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Every curated struct and union, lowered.
newtype Lowered = Lowered
  { structs :: Map TypeName [LoweredMember]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data LowerError
  = LUnknownExternal {struct :: !Text, member :: !Text, target :: !Text}
  | LUnknownBasetype {struct :: !Text, member :: !Text, target :: !Text}
  | LUnplaceable {struct :: !Text, member :: !Text, reason :: !Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display LowerError where
  displayBuilder =
    displayBuilder @Text . \case
      LUnknownExternal{struct, member, target} ->
        "no size known for external '" <> target <> "' (" <> struct <> "." <> member <> ")"
      LUnknownBasetype{struct, member, target} ->
        "no lowering for basetype '" <> target <> "' (" <> struct <> "." <> member <> ")"
      LUnplaceable{struct, member, reason} ->
        "cannot lower " <> struct <> "." <> member <> ": " <> reason

-- | LP64 sizes\/alignments.
primSizeAlign :: CPrim -> (Int, Int)
primSizeAlign = \case
  PU8 -> (1, 1)
  PU16 -> (2, 2)
  PU32 -> (4, 4)
  PU64 -> (8, 8)
  PI8 -> (1, 1)
  PI16 -> (2, 2)
  PI32 -> (4, 4)
  PI64 -> (8, 8)
  PFloat -> (4, 4)
  PDouble -> (8, 8)
  PSizeT -> (8, 8)
  PChar -> (1, 1)
  PPtrSized -> (8, 8)

-- | Lower every curated struct and union.
lowerStructs
  :: (HasType ResolvedRegistry cxt)
  => cxt
  -> Validation (Errors LowerError) Lowered
lowerStructs cxt =
  Lowered
    . Map.fromList
    <$> traverse lowerOne (Map.toList registry.structs)
 where
  registry = getTyped @ResolvedRegistry cxt

  lowerOne (name, s) =
    (name,) <$> traverse (lowerMember name) (V.toList s.members)

  lowerMember owner m =
    LoweredMember m.name <$> memberCType owner m

  memberCType owner m
    | Just w <- m.bitfield = case baseUnit m.typeRef of
        Just p -> Success (CBitfield w p)
        Nothing ->
          failing
            LUnplaceable
              { struct = forgetNamespace owner
              , member = m.name
              , reason = "bitfield over a non-integral base"
              }
    | not (null m.pointers) = case m.typeRef.kind of
        RefFuncpointer -> Success (CFuncPtr m.typeRef.name)
        _ -> Success CPtr
    | (d : ds) <- m.arrayDims =
        CArray (product (dimSize <$> (d : ds)))
          <$> scalarCType owner m
    | otherwise = scalarCType owner m

  -- The base storage unit of a bitfield member.
  baseUnit ref = case ref.kind of
    RefExternal -> case forgetNamespace ref.name of
      "uint32_t" -> Just PU32
      "uint64_t" -> Just PU64
      "int32_t" -> Just PI32
      _ -> Nothing
    RefBitmask -> case Map.lookup ref.name registry.bitmasks of
      Just bm -> Just case bm.bitWidth of W32 -> PU32; W64 -> PU64
      Nothing -> Nothing
    _ -> Nothing

  dimSize = \case
    RDimLit n -> n
    RDimConst{size} -> size

  scalarCType owner m = case m.typeRef.kind of
    RefEnum -> case Map.lookup m.typeRef.name registry.enums of
      Just block
        | block.kind == KindBitmask ->
            Success (CFlagsBits m.typeRef.name block.bitWidth)
      _ -> Success (CEnum m.typeRef.name)
    RefBitmask -> case Map.lookup m.typeRef.name registry.bitmasks of
      Just bm -> Success (CFlags m.typeRef.name bm.bitWidth)
      Nothing ->
        failing
          LUnplaceable
            { struct = forgetNamespace owner
            , member = m.name
            , reason = "bitmask reference without a bitmask record"
            }
    RefHandle -> case Map.lookup m.typeRef.name registry.handles of
      Just h
        | h.dispatchable -> Success (CHandleD m.typeRef.name)
        | otherwise -> Success (CHandleND m.typeRef.name)
      Nothing ->
        failing
          LUnplaceable
            { struct = forgetNamespace owner
            , member = m.name
            , reason = "handle reference without a handle record"
            }
    RefStruct -> Success (CStructRef m.typeRef.name)
    RefUnion -> Success (CStructRef m.typeRef.name)
    RefFuncpointer -> Success (CFuncPtr m.typeRef.name)
    RefBasetype -> case forgetNamespace m.typeRef.name of
      "VkBool32" -> Success CBool32
      "VkDeviceSize" -> Success (CPrim PU64)
      "VkDeviceAddress" -> Success (CPrim PU64)
      "VkSampleMask" -> Success (CPrim PU32)
      "VkFlags" -> Success (CPrim PU32)
      "VkFlags64" -> Success (CPrim PU64)
      other ->
        failing
          LUnknownBasetype{struct = forgetNamespace owner, member = m.name, target = other}
    RefExternal
      | forgetNamespace m.typeRef.name
          `elem` (["HWND", "HINSTANCE", "HMONITOR", "HANDLE", "LPCWSTR"] :: [Text]) ->
          Success (CPlatform (forgetNamespace m.typeRef.name))
    RefExternal -> case Map.lookup (forgetNamespace m.typeRef.name) externals of
      Just p -> Success (CPrim p)
      Nothing ->
        failing
          LUnknownExternal
            { struct = forgetNamespace owner
            , member = m.name
            , target = forgetNamespace m.typeRef.name
            }
    RefVoid ->
      failing
        LUnplaceable
          { struct = forgetNamespace owner
          , member = m.name
          , reason = "void by value"
          }
    _ ->
      failing
        LUnplaceable
          { struct = forgetNamespace owner
          , member = m.name
          , reason = "unexpected reference kind " <> show m.typeRef.kind
          }

  -- Platform + stdint value types with LP64 sizes. Data pointers never get
  -- here (the pointers check runs first).
  externals :: Map Text CPrim
  externals =
    Map.fromList
      [ ("uint8_t", PU8)
      , ("uint16_t", PU16)
      , ("uint32_t", PU32)
      , ("uint64_t", PU64)
      , ("int8_t", PI8)
      , ("int16_t", PI16)
      , ("int32_t", PI32)
      , ("int64_t", PI64)
      , ("float", PFloat)
      , ("double", PDouble)
      , ("size_t", PSizeT)
      , ("char", PChar)
      , ("int", PI32)
      , ("DWORD", PU32)
      , ("xcb_window_t", PU32)
      , ("xcb_visualid_t", PU32)
      , ("Window", PU64)
      , ("VisualID", PU64)
      , ("RROutput", PU64)
      ]

  failing :: LowerError -> Validation (Errors LowerError) a
  failing = Failure . errors1
