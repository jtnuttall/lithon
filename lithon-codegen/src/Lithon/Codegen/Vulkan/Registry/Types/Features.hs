{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | IR for @\<feature\>@ and @\<extension\>@ blocks, including the 2025
-- modular-API constructs: @apitype=\"internal\"@ version tiers, nested
-- @\<feature name=… struct=…\/\>@ requirement refs, @\<deprecate
-- explanationlink=…\>@ blocks, and @\<remove reasonlink=…\>@ (Vulkan SC).
module Lithon.Codegen.Vulkan.Registry.Types.Features (
  Feature (..),
  FeatureVisibility (..),
  ChangeBlock (..),
  RequireBlock (..),
  InterfaceItem (..),
  DeprecateBlock (..),
  DeprecateItem (..),
  RemoveBlock (..),
  Extension (..),
  ExtensionSupport (..),
  ExtensionType (..),
) where

import Data.Aeson (ToJSON)
import Data.Aeson qualified as Aeson

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (DependsExpr, ProtectExpr)
import Lithon.Codegen.Vulkan.Registry.Types.Common (Api, ApiSet, Raw)
import Lithon.Codegen.Vulkan.Registry.Types.Enums (EnumDef)
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

-- | @apitype=@: internal tiers (VK_BASE\/COMPUTE\/GRAPHICS_VERSION_1_x) are
-- merged into the public features that depend on them at resolve time.
data FeatureVisibility = VisPublic | VisInternal
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Feature = Feature
  { api :: NonEmpty Api
  , apiType :: FeatureVisibility
  , name :: FeatureName
  , number :: Maybe (Raw (Int, Int))
  , depends :: Maybe (Raw DependsExpr)
  , protect :: Maybe (Raw ProtectExpr)
  , sortOrder :: Maybe Int
  , comment :: Maybe Text
  , changes :: Vector ChangeBlock
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The interface-changing children of features and extensions, in document
-- order.
data ChangeBlock
  = ChRequire RequireBlock
  | ChDeprecate DeprecateBlock
  | ChRemove RemoveBlock
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data RequireBlock = RequireBlock
  { api :: ApiSet
  , profile :: Maybe Text
  , depends :: Maybe (Raw DependsExpr)
  -- ^ May contain @Struct::member@ feature-path atoms.
  , comment :: Maybe Text
  , items :: Vector InterfaceItem
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data InterfaceItem
  = ReqType {name :: Text, comment :: Maybe Text, pos :: Pos}
  | -- | Full @\<enum\>@ schema: bare refs, extension offsets, aliases, …
    ReqEnum EnumDef
  | ReqCommand {name :: Text, comment :: Maybe Text, pos :: Pos}
  | -- | Nested @\<feature name=… struct=…\/\>@ requirement ref; the
    -- comma-separated names are any-of alternatives within @struct@.
    ReqFeature
      { names :: NonEmpty Text
      , struct :: TypeName
      , comment :: Maybe Text
      , pos :: Pos
      }
  | ReqComment Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data DeprecateBlock = DeprecateBlock
  { explanationLink :: Text
  , api :: ApiSet
  , comment :: Maybe Text
  , items :: Vector DeprecateItem
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data DeprecateItem
  = DepType {name :: Text, supersededBy :: Maybe Text, pos :: Pos}
  | DepCommand {name :: Text, supersededBy :: Maybe Text, pos :: Pos}
  | DepFeature {names :: NonEmpty Text, struct :: TypeName, pos :: Pos}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data RemoveBlock = RemoveBlock
  { reasonLink :: Maybe Text
  , api :: ApiSet
  , comment :: Maybe Text
  , items :: Vector InterfaceItem
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ExtensionSupport
  = SupportedApis (NESet Api)
  | SupportedDisabled
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance ToJSON ExtensionSupport where
  toJSON = \case
    SupportedDisabled -> Aeson.String "disabled"
    SupportedApis apis -> Aeson.toJSON (map (display @Api) (toList apis))

data ExtensionType = ExtInstance | ExtDevice
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Extension = Extension
  { name :: ExtensionName
  , number :: Int
  , extensionType :: Maybe ExtensionType
  , author :: Maybe Text
  , contact :: Maybe Text
  , depends :: Maybe (Raw DependsExpr)
  , supported :: ExtensionSupport
  , ratified :: [Api]
  , platform :: Maybe Text
  , protect :: Maybe (Raw ProtectExpr)
  , promotedTo :: Maybe Text
  , deprecatedBy :: Maybe Text
  -- ^ May be the empty string: deprecated with no replacement.
  , obsoletedBy :: Maybe Text
  , provisional :: Bool
  , specialUse :: [Text]
  , noFeatures :: Maybe Bool
  , sortOrder :: Maybe Int
  , comment :: Maybe Text
  , changes :: Vector ChangeBlock
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)
