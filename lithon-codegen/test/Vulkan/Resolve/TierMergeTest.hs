{-# LANGUAGE OverloadedStrings #-}

-- | The internal-tier merge (reg.py @mergeInternalFeatures@ semantics) over
-- the pinned registry, plus synthetic error cases the registry never
-- exercises.
module Vulkan.Resolve.TierMergeTest (
  unit_mergePinnedVulkanFeatures,
  unit_mergePreservesBlockMultiset,
  unit_vk14TierProvenance,
  unit_orphanTierIsAnError,
  unit_badDependsAtomsAreErrors,
) where

import Data.List qualified as L
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Vector qualified as V
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Backend.Json (canonicalJsonBytes)
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (parseDepends)
import Lithon.Codegen.Vulkan.Registry.Types.Common (Api (..), Raw (..))
import Lithon.Codegen.Vulkan.Registry.Types.Features (
  ChangeBlock,
  Feature (..),
  FeatureVisibility (..),
 )
import Lithon.Codegen.Vulkan.Resolve.TierMerge (
  TierBlock (..),
  TierError (..),
  TieredFeature (..),
  mergeInternalTiers,
 )
import Lithon.Codegen.Vulkan.Xml.Types (noPos)
import Vulkan.Support.Registry (pinnedRegistry, syntheticSpecialized)

vulkanRegistry :: IO (Specialized Registry)
vulkanRegistry = case specialize ApiVulkan pinnedRegistry of
  Failure errs ->
    assertFailure ("specialization failed: " <> show (fmap display errs))
  Success reg -> pure reg

mergedOrFail :: Specialized Registry -> IO (Vector TieredFeature)
mergedOrFail reg = case mergeInternalTiers reg of
  Failure errs -> assertFailure ("tier merge failed: " <> show (fmap (display @TierError) errs))
  Success tiered -> pure tiered

unit_mergePinnedVulkanFeatures :: IO ()
unit_mergePinnedVulkanFeatures = do
  tiered <- mergedOrFail =<< vulkanRegistry
  map (.feature.name) (V.toList tiered)
    @?= ["VK_VERSION_1_0", "VK_VERSION_1_1", "VK_VERSION_1_2", "VK_VERSION_1_3", "VK_VERSION_1_4"]
  -- (own, merged) block counts per public feature, pinned against the
  -- v1.4.356 registry.
  map blockCounts (V.toList tiered) @?= [(1, 42), (3, 33), (9, 26), (2, 31), (2, 25)]
 where
  blockCounts tf =
    ( V.length (V.filter (\b -> isNothing b.tier) tf.blocks)
    , V.length (V.filter (\b -> isJust b.tier) tf.blocks)
    )

-- | Merging moves blocks; it must never invent, drop, or edit one.
unit_mergePreservesBlockMultiset :: IO ()
unit_mergePreservesBlockMultiset = do
  reg <- vulkanRegistry
  tiered <- mergedOrFail reg
  let input = concatMap (V.toList . (.changes)) (V.toList reg.features)
      output = concatMap (map (.block) . V.toList . (.blocks)) (V.toList tiered)
  blockMultiset output @?= blockMultiset input
 where
  blockMultiset :: [ChangeBlock] -> Map LByteString Int
  blockMultiset bs = Map.fromListWith (+) [(canonicalJsonBytes b, 1) | b <- bs]

unit_vk14TierProvenance :: IO ()
unit_vk14TierProvenance = do
  tiered <- mergedOrFail =<< vulkanRegistry
  tf <- case V.find (\t -> t.feature.name == "VK_VERSION_1_4") tiered of
    Nothing -> assertFailure "VK_VERSION_1_4 missing from merged features"
    Just tf -> pure tf
  let tiers = map (.tier) (V.toList tf.blocks)
  -- Own blocks first, then each 1.4 tier in document order.
  L.nub tiers
    @?= [ Nothing
        , Just "VK_BASE_VERSION_1_4"
        , Just "VK_COMPUTE_VERSION_1_4"
        , Just "VK_GRAPHICS_VERSION_1_4"
        ]
  let (own, rest) = L.span isNothing tiers
  assertBool "own blocks precede all merged blocks" (not (null own) && all isJust rest)

unit_orphanTierIsAnError :: IO ()
unit_orphanTierIsAnError = do
  let features =
        V.fromList
          [ synthetic VisInternal "VK_BASE_VERSION_1_0" Nothing
          , synthetic VisPublic "VK_VERSION_1_0" (Just "VK_BASE_VERSION_1_0")
          , synthetic VisInternal "VK_ORPHAN_TIER" Nothing
          ]
  case mergeInternalTiers (syntheticSpecialized features) of
    Success _ -> assertFailure "orphan tier merged successfully"
    Failure errs -> toList errs @?= [TierOrphan{tier = "VK_ORPHAN_TIER"}]

unit_badDependsAtomsAreErrors :: IO ()
unit_badDependsAtomsAreErrors = do
  let features =
        V.fromList
          [ synthetic VisPublic "VK_VERSION_1_0" (Just "VK_MISSING")
          , synthetic VisPublic "VK_VERSION_1_1" (Just "VkFoo::bar")
          ]
  case mergeInternalTiers (syntheticSpecialized features) of
    Success _ -> assertFailure "bad depends atoms merged successfully"
    Failure errs ->
      toList errs
        @?= [ TierUnknownDep{feature = "VK_VERSION_1_0", dep = "VK_MISSING"}
            , TierFeaturePathDep{feature = "VK_VERSION_1_1", path = "VkFoo::bar"}
            ]

synthetic :: FeatureVisibility -> FeatureName -> Maybe Text -> Feature
synthetic apiType name dependsText =
  Feature
    { api = NE.singleton ApiVulkan
    , apiType
    , name
    , number = Nothing
    , depends = mkDepends <$> dependsText
    , protect = Nothing
    , sortOrder = Nothing
    , comment = Nothing
    , changes = V.empty
    , pos = noPos
    }
 where
  mkDepends txt = Raw txt (either error id (parseDepends txt))
