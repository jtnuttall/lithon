{-# LANGUAGE StrictData #-}

-- | IR for the @\<types\>@ section: one constructor per @category@, alias
-- forms modeled uniformly via 'AliasOr'.
module Lithon.Codegen.Vulkan.Registry.Types.Core (
  TypeDecl (..),
  TypeCommon (..),
  TypeBody (..),
  typeBodyName,
  AliasOr (..),
  ExternalType (..),
  IncludeType (..),
  DefineType (..),
  BasetypeType (..),
  BitmaskDef (..),
  HandleDef (..),
  EnumMarker (..),
  FuncpointerDef (..),
  StructDef (..),
  Member (..),
) where

import Data.Aeson (ToJSON)

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.ExternSync (ExternSync)
import Lithon.Codegen.Vulkan.Registry.Micro.Len (AltLen, LenSpec)
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (Declaration (..), MixedBody)
import Lithon.Codegen.Vulkan.Registry.Types.Commands (Param, ProtoDecl (..))
import Lithon.Codegen.Vulkan.Registry.Types.Common (ApiSet, Deprecation, Raw)
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

-- | Attributes common to every @\<type\>@ regardless of category.
data TypeCommon = TypeCommon
  { api :: ApiSet
  , requires :: Maybe Text
  -- ^ A header (external types, e.g. @vk_video\/…@) or the flag-bits type a
  -- bitmask draws its values from.
  , deprecated :: Maybe Deprecation
  , comment :: Maybe Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data TypeDecl = TypeDecl
  { common :: TypeCommon
  , body :: TypeBody
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Alias-form vs full definition, shared across categories.
data AliasOr a
  = AliasDef {name :: TypeName, target :: TypeName}
  | FullDef a
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data TypeBody
  = TExternal ExternalType
  | TInclude IncludeType
  | TDefine DefineType
  | TBasetype BasetypeType
  | TBitmask (AliasOr BitmaskDef)
  | THandle (AliasOr HandleDef)
  | TEnumDecl (AliasOr EnumMarker)
  | TFuncpointer FuncpointerDef
  | TStruct (AliasOr StructDef)
  | TUnion (AliasOr StructDef)
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The declared name, whichever category/form it came from.
typeBodyName :: TypeBody -> TypeName
typeBodyName = \case
  TExternal t -> t.name
  TInclude t -> t.name
  TDefine t -> t.name
  TBasetype t -> t.name
  TBitmask a -> aliasName (.name) a
  THandle a -> aliasName (.name) a
  TEnumDecl a -> aliasName (.name) a
  TFuncpointer f -> WithNS f.proto.decl.name
  TStruct a -> aliasName (.name) a
  TUnion a -> aliasName (.name) a
 where
  aliasName :: (a -> TypeName) -> AliasOr a -> TypeName
  aliasName f = \case
    AliasDef{name} -> name
    FullDef a -> f a

-- | Category-less platform\/video types pulled in via @requires=@.
newtype ExternalType = ExternalType
  { name :: TypeName
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data IncludeType = IncludeType
  { name :: TypeName
  , body :: Text
  -- ^ The @#include@ directive text, or empty for bare declarations.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | C preprocessor definitions; bodies stay raw in phase 1.
data DefineType = DefineType
  { name :: TypeName
  , nameFromAttr :: Bool
  -- ^ One define (VK_USE_64_BIT_PTR_DEFINES) names itself via @name=@
  -- instead of a @\<name\>@ child.
  , body :: MixedBody
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Scalar typedefs and platform forward declarations (may contain
-- @#ifdef@ blocks — body stays raw).
data BasetypeType = BasetypeType
  { name :: TypeName
  , body :: MixedBody
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data BitmaskDef = BitmaskDef
  { name :: TypeName
  , bitvalues :: Maybe TypeName
  -- ^ The FlagBits2 type providing this mask's values (64-bit masks).
  , body :: MixedBody
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data HandleDef = HandleDef
  { name :: TypeName
  , parent :: Maybe TypeName
  , objTypeEnum :: EnumValueName
  , body :: MixedBody
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | @category=\"enum\"@ full form: a marker that the values live in an
-- @\<enums\>@ block of the same name.
newtype EnumMarker = EnumMarker
  { name :: TypeName
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Structured since the 2025 restructure: @\<proto\>@ + @\<param\>@s,
-- exactly like commands.
data FuncpointerDef = FuncpointerDef
  { proto :: ProtoDecl
  , params :: Vector Param
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data StructDef = StructDef
  { name :: TypeName
  , returnedOnly :: Bool
  , structExtends :: [TypeName]
  , allowDuplicate :: Maybe Bool
  , requiredLimitType :: Bool
  , members :: Vector Member
  , comments :: Vector Text
  -- ^ @\<comment\>@ children interleaved between members.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Member = Member
  { decl :: Declaration
  , body :: MixedBody
  , comment :: Maybe Text
  -- ^ From the trailing @\<comment\>@ chunk inside the member, if any.
  , api :: ApiSet
  , values :: [EnumValueName]
  -- ^ Permitted values (the @sType@ mechanism); comma list.
  , len :: Maybe (Raw LenSpec)
  , altLen :: Maybe (Raw AltLen)
  , stride :: Maybe Text
  , externSync :: Maybe (Raw ExternSync)
  , isOptional :: Maybe (NonEmpty Bool)
  , selector :: Maybe Text
  , selection :: [Text]
  -- ^ Union-arm selection values.
  , noAutoValidity :: Bool
  , limitType :: Maybe Text
  , objectType :: Maybe Text
  , deprecated :: Maybe Deprecation
  , featureLink :: Maybe Text
  , flagsExtend :: Maybe Text
  , flagsExtendMember :: Maybe Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)
