{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

-- | Typed registry identifiers.
module Lithon.Codegen.Vulkan.Names (
  -- * Namespaces, singled
  Namespace (..),
  CommandNSSym0,
  EnumValueNSSym0,
  EnumsBlockNSSym0,
  ExtensionNSSym0,
  FeatureNSSym0,
  PlatformNSSym0,
  TypeNSSym0,
  SNamespace (..),
  duplicateNames,

  -- * Nominal wrapper
  WithNS (..),
  forgetNamespace,

  -- * Useful aliases
  TypeName,
  CommandName,
  EnumsBlockName,
  ExtensionName,
  FeatureName,
  EnumValueName,
  PlatformName,

  -- * Well-known registry names
  pattern VkResult,
  pattern VkDevice,
  pattern VkStructureType,
  pattern VkObjectType,
  pattern VkFlags,
  pattern VkFlags64,
  pattern VK_DEFINE_HANDLE,
  pattern VK_DEFINE_NON_DISPATCHABLE_HANDLE,
  pattern VK_HEADER_VERSION,
) where

import Autodocodec qualified as AD
import Data.Aeson (ToJSON (..), ToJSONKey)
import Data.Aeson qualified as Aeson
import Data.Singletons.TH (genSingletons)
import Lithon.Prelude

-- | The registry namespace a name lives in — the tag dynamic-kind errors
-- carry, and the promoted index of 'WithNS'.
data Namespace
  = TypeNS
  | EnumsBlockNS
  | EnumValueNS
  | CommandNS
  | FeatureNS
  | ExtensionNS
  | PlatformNS
  deriving stock (Bounded, Enum, Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

genSingletons [''Namespace]

instance Display Namespace where
  displayBuilder = \case
    TypeNS -> "type"
    EnumsBlockNS -> "enums block"
    EnumValueNS -> "enum value"
    CommandNS -> "command"
    FeatureNS -> "feature"
    ExtensionNS -> "extension"
    PlatformNS -> "platform"

instance ToJSON Namespace where
  toJSON = Aeson.String . display

-- | Each name occurring more than once in one namespace's pool (ascending),
-- tagged with the demoted namespace — the shared enumeration behind the
-- per-pass duplicate checks.
duplicateNames :: SNamespace k -> [WithNS k] -> [(Namespace, Text)]
duplicateNames ns = map ((fromSing ns,) . forgetNamespace) . toList . duplicates

newtype WithNS (k :: Namespace) = WithNS Text
  deriving newtype (Display, Eq, Hashable, IsString, NFData, Ord, Show, ToJSON, ToJSONKey)

type role WithNS nominal

instance AD.HasCodec (WithNS k) where
  codec = AD.named "WithNS" $ AD.dimapCodec WithNS forgetNamespace AD.codec

type TypeName = WithNS TypeNS

type CommandName = WithNS CommandNS

type ExtensionName = WithNS ExtensionNS

type FeatureName = WithNS FeatureNS

type EnumsBlockName = WithNS EnumsBlockNS

type EnumValueName = WithNS EnumValueNS

type PlatformName = WithNS PlatformNS

-- | The raw registry spelling — the escape hatch for explicit cross-kind
-- minting and 'Data.Text' operations.
forgetNamespace :: WithNS k -> Text
forgetNamespace (WithNS t) = t

pattern VkResult :: TypeName
pattern VkResult = WithNS "VkResult"

pattern VkDevice :: TypeName
pattern VkDevice = WithNS "VkDevice"

pattern VkStructureType :: TypeName
pattern VkStructureType = WithNS "VkStructureType"

pattern VkObjectType :: TypeName
pattern VkObjectType = WithNS "VkObjectType"

pattern VkFlags :: TypeName
pattern VkFlags = WithNS "VkFlags"

pattern VkFlags64 :: TypeName
pattern VkFlags64 = WithNS "VkFlags64"

pattern VK_DEFINE_HANDLE :: TypeName
pattern VK_DEFINE_HANDLE = WithNS "VK_DEFINE_HANDLE"

pattern VK_DEFINE_NON_DISPATCHABLE_HANDLE :: TypeName
pattern VK_DEFINE_NON_DISPATCHABLE_HANDLE = WithNS "VK_DEFINE_NON_DISPATCHABLE_HANDLE"

pattern VK_HEADER_VERSION :: TypeName
pattern VK_HEADER_VERSION = WithNS "VK_HEADER_VERSION"
