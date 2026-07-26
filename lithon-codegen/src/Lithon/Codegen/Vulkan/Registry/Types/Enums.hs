{-# LANGUAGE StrictData #-}

-- | IR for @\<enums\>@ blocks and the @\<enum\>@ element schema.
--
-- Value encodings are kept literal: @offset@\/@extnumber@ arithmetic, alias
-- resolution, and bit materialization are resolve-phase work. One 'EnumDef'
-- shape serves both @\<enums\>@ blocks and @\<require\>@\/@\<remove\>@
-- interface items (the schema is shared in the registry too).
module Lithon.Codegen.Vulkan.Registry.Types.Enums (
  EnumsBlock (..),
  EnumsKind (..),
  enumsBlockOfType,
  declaredType,
  BitWidth (..),
  EnumsItem (..),
  UnusedRange (..),
  EnumDef (..),
  EnumValueSpec (..),
  EnumValueType (..),
) where

import Data.Aeson (ToJSON)

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (ProtectExpr)
import Lithon.Codegen.Vulkan.Registry.Micro.Literal (ValueLiteral)
import Lithon.Codegen.Vulkan.Registry.Types.Common (ApiSet, Deprecation, Raw)
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

data EnumsBlock = EnumsBlock
  { name :: EnumsBlockName
  , kind :: EnumsKind
  , bitWidth :: BitWidth
  , comment :: Maybe Text
  , items :: Vector EnumsItem
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The observed (closed) @type=@ vocabulary of @\<enums\>@ blocks. A new
-- kind in a future registry fails loudly, by design.
data EnumsKind = KindEnum | KindBitmask | KindConstants
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Retag a type name as the @\<enums\>@ block that declares its values.
-- Every non-constants @\<enums\>@ block is named after the @\<type\>@ it
-- populates, and every @extends=@ target names such a block — verified
-- against vk.xml: 354\/354 non-constants blocks, 151\/151 @extends=@
-- targets. A retag, not an existence proof: lookups still validate
-- membership. The sole nameless block is @API Constants@
-- (@type=\"constants\"@, 'KindConstants') — see 'declaredType'.
enumsBlockOfType :: TypeName -> EnumsBlockName
enumsBlockOfType = WithNS . forgetNamespace

-- | The @\<type\>@ an @\<enums\>@ block declares values for — the block's
-- name retagged into the type namespace. 'Nothing' for 'KindConstants':
-- @API Constants@ (the only such block in vk.xml) names no type; its values
-- materialize into the constants table. Inverse of 'enumsBlockOfType' on
-- all 354 remaining blocks.
declaredType :: EnumsBlock -> Maybe TypeName
declaredType b
  | b.kind == KindConstants = Nothing
  | otherwise = Just (WithNS (forgetNamespace b.name))

data BitWidth = W32 | W64
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data EnumsItem
  = ItemEnum !EnumDef
  | ItemUnused !UnusedRange
  | ItemComment !Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | @\<unused start=… [end=…]\/\>@ — reserved value ranges.
data UnusedRange = UnusedRange
  { start :: Raw ValueLiteral
  , end :: Maybe (Raw ValueLiteral)
  , vendor :: Maybe Text
  , comment :: Maybe Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | One @\<enum\>@ element, wherever it appears.
data EnumDef = EnumDef
  { name :: EnumValueName
  , spec :: EnumValueSpec
  , extends :: Maybe TypeName
  -- ^ The enum type this value extends (feature\/extension additions).
  , extNumber :: Maybe Int
  -- ^ Explicit extension number for offset encoding; usually implicit from
  -- the enclosing extension (resolve-phase concern).
  , valueType :: Maybe EnumValueType
  , api :: ApiSet
  , protect :: Maybe (Raw ProtectExpr)
  , deprecated :: Maybe Deprecation
  , comment :: Maybe Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The literal value encoding. The optional alias alongside value\/bitpos
-- mirrors the schema (both may appear together).
data EnumValueSpec
  = -- | Bare reference (require\/remove items referencing existing values).
    EvNone
  | EvValue (Raw ValueLiteral) (Maybe EnumValueName)
  | EvBitpos Int (Maybe EnumValueName)
  | -- | Offset encoding; @dir=\"-\"@ negates. Kept literal.
    EvOffset {offset :: Int, negative :: Bool}
  | EvAlias EnumValueName
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The observed (closed) @type=@ vocabulary on individual @\<enum\>@
-- constants.
data EnumValueType = EVTFloat | EVTUInt32 | EVTUInt64
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)
