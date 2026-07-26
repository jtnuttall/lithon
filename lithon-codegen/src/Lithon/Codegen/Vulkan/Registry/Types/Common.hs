{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Vocabulary shared across all registry sections: API variants, the
-- deprecation marker, platforms, and vendor tags.
module Lithon.Codegen.Vulkan.Registry.Types.Common (
  -- * API variants
  Api (..),
  parseApi,
  ApiSet (..),
  parseApiSet,
  apiSetContains,
  parseApiList,

  -- * Deprecation
  Deprecation (..),
  deprecationTable,

  -- * Platforms and vendor tags
  Platform (..),
  VendorTag (..),

  -- * Re-exports
  Raw (..),
  FeaturePath (..),
) where

import Data.Aeson (ToJSON (toJSON))
import Data.Aeson qualified as Aeson
import Data.List.NonEmpty qualified as NE
import Data.Set.NonEmpty qualified as NESet
import Data.Text qualified as T

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath (..), Raw (..))
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

-- | The registry's API variants (@registry.rnc@ @Api_t@). @vulkanbase@ is
-- the 2025 modular-API base layer that both @vulkan@ and @vulkansc@ build on.
data Api = ApiVulkan | ApiVulkanSC | ApiVulkanBase
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

instance ToJSON Api where
  toJSON = Aeson.String . display

parseApi :: Text -> Either Text Api
parseApi = \case
  "vulkan" -> Right ApiVulkan
  "vulkansc" -> Right ApiVulkanSC
  "vulkanbase" -> Right ApiVulkanBase
  other -> Left ("unknown api variant: " <> other)

instance Display Api where
  displayBuilder = \case
    ApiVulkan -> "vulkan"
    ApiVulkanSC -> "vulkansc"
    ApiVulkanBase -> "vulkanbase"

-- | Which API variants a node applies to. An absent @api=@ attribute means
-- all of them — kept distinct from any explicit list so the transliteration
-- stays faithful.
data ApiSet
  = AllApis
  | Apis (NESet Api)
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance ToJSON ApiSet where
  toJSON = \case
    AllApis -> Aeson.String "all"
    Apis apis -> toJSON $ map (display @Api) (toList apis)

-- | Comma-separated api list; duplicates are malformed.
parseApiSet :: Text -> Either Text ApiSet
parseApiSet input = Apis <$> (parseApiList input >>= dedup)
 where
  dedup apis =
    let set = NESet.fromList apis
     in if NESet.size set == length apis then
          Right set
        else
          Left "duplicate api variant in list"

parseApiList :: Text -> Either Text (NonEmpty Api)
parseApiList input = case NE.nonEmpty (T.splitOn "," input) of
  Nothing -> Left "empty api list"
  Just pieces -> traverse parseApi pieces

instance Display ApiSet where
  displayBuilder = \case
    AllApis -> "all"
    Apis apis -> displayBuilder (T.intercalate "," (map display (toList apis)))

apiSetContains :: Api -> ApiSet -> Bool
apiSetContains api = \case
  AllApis -> True
  Apis apis -> NESet.member api apis

-- | The registry's @deprecated=@ marker vocabulary.
data Deprecation = DeprAliased | DeprTrue | DeprUnused
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

deprecationTable :: [(Text, Deprecation)]
deprecationTable = [("aliased", DeprAliased), ("true", DeprTrue), ("unused", DeprUnused)]

-- | A @\<platform\>@: a window-system or OS integration whose interfaces are
-- guarded by the @protect@ preprocessor symbol.
data Platform = Platform
  { name :: PlatformName
  , protect :: Text
  , comment :: Maybe Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A @\<tag\>@: a registered author\/vendor suffix (KHR, EXT, NV, …).
data VendorTag = VendorTag
  { name :: Text
  , author :: Text
  , contact :: Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)
