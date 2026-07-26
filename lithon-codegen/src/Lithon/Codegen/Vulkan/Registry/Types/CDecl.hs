{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Mixed-content C declarations, as they appear in @\<member\>@,
-- @\<param\>@, and @\<proto\>@ elements.
--
-- The XML pre-tokenizes the load-bearing parts (@\<type\>@, @\<name\>@,
-- @\<enum\>@); 'MixedBody' preserves that chunk structure (plus verbatim
-- interstitial text), and 'Declaration' is the parsed structure. Both are
-- kept in the IR: structure for downstream phases, raw for fidelity.
module Lithon.Codegen.Vulkan.Registry.Types.CDecl (
  NameAlias (..),
  MixedChunk (..),
  chunkPos,
  MixedBody (..),
  mkMixedBody,
  TypeRef (..),
  PtrLayer (..),
  ArrayDim (..),
  Declaration (..),
) where

import Data.Aeson (ToJSON)
import Data.Vector qualified as V

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath)
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

-- | A member @\<name alias=…\>@ value: the feature this member mirrors,
-- either a @Struct::member@ feature bit or a bare name (the six
-- VkPhysicalDeviceVulkan12Features members that alias whole extensions).
data NameAlias
  = NameAliasPath FeaturePath
  | NameAliasName Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | One node of a mixed-content body, in document order.
data MixedChunk
  = -- | Verbatim text run (whitespace preserved).
    ChunkText Text Pos
  | -- | @\<type\>T\<\/type\>@ — a reference to a registry type.
    ChunkType Text Pos
  | -- | @\<name alias=…?\>n\<\/name\>@ — the declared name; the alias
    -- marks members that mirror a feature bit or extension.
    ChunkName Text (Maybe NameAlias) Pos
  | -- | @\<enum\>K\<\/enum\>@ — an API-constant reference (array sizes).
    ChunkEnum Text Pos
  | -- | @\<comment\>…\<\/comment\>@ — dropped from 'MixedBody.raw'.
    ChunkComment Text Pos
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

chunkPos :: MixedChunk -> Pos
chunkPos = \case
  ChunkText _ p -> p
  ChunkType _ p -> p
  ChunkName _ _ p -> p
  ChunkEnum _ p -> p
  ChunkComment _ p -> p

-- | The chunk sequence plus the tag-erased source text (comments dropped,
-- whitespace verbatim — define/basetype bodies depend on it).
data MixedBody = MixedBody
  { chunks :: Vector MixedChunk
  , raw :: Text
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

mkMixedBody :: [MixedChunk] -> MixedBody
mkMixedBody cs =
  MixedBody
    { chunks = V.fromList cs
    , raw = foldMap chunkRaw cs
    }
 where
  chunkRaw = \case
    ChunkText t _ -> t
    ChunkType t _ -> t
    ChunkName t _ _ -> t
    ChunkEnum t _ -> t
    ChunkComment _ _ -> ""

-- | A reference to a registry type, with the position of its @\<type\>@ tag.
data TypeRef = TypeRef
  { name :: TypeName
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | One pointer indirection, in left-to-right source order; 'isConst' marks
-- a @const@ qualifying this indirection (the @const@ following the star, as
-- in @char* const*@).
newtype PtrLayer = PtrLayer
  { isConst :: Bool
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ArrayDim
  = DimLit Integer
  | -- | Dimension named by an API constant, e.g. @[VK_UUID_SIZE]@.
    DimNamespace EnumValueName Pos
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A parsed C declaration: @baseConst? structKw? TYPE ptrs NAME
-- (bitfield | dims)@. Covers members, command\/funcpointer parameters, and
-- protos (the full interstitial token alphabet of the pinned registry).
data Declaration = Declaration
  { name :: Text
  , nameAlias :: Maybe NameAlias
  , typeName :: TypeRef
  , baseConst :: Bool
  , structKw :: Bool
  , pointers :: [PtrLayer]
  , arrayDims :: [ArrayDim]
  , bitfield :: Maybe Int
  , pos :: Pos
  -- ^ Position of the declared name.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)
