{-# LANGUAGE OverloadedStrings #-}

-- | Requirement collection over the pinned registry: provenance, feature
-- rows (including the portability remove), and deprecate-block folding.
module Vulkan.Resolve.RequireTest (
  unit_requirementCountsPinned,
  unit_portabilityWaivesRobustBufferAccess,
  unit_bindIndexBufferProvenance,
  unit_bindIndexBufferDeprecation,
) where

import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Vector qualified as V
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath (..))
import Lithon.Codegen.Vulkan.Resolve.Require (Requirements (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (
  DeprecationInfo (..),
  FeatureRequirement (..),
  InterfaceItemNamespace (..),
  ItemKey (..),
  Origin (..),
  OriginSource (..),
 )
import Vulkan.Support.Resolve (pinnedRequirements)

unit_requirementCountsPinned :: IO ()
unit_requirementCountsPinned = do
  Map.size pinnedRequirements.required @?= 7197
  sum (fmap V.length pinnedRequirements.deviceFeatures) @?= 440
  Map.size pinnedRequirements.deprecations @?= 219
  Map.size pinnedRequirements.removedItems @?= 0

unit_portabilityWaivesRobustBufferAccess :: IO ()
unit_portabilityWaivesRobustBufferAccess = do
  rows <- case Map.lookup "VK_VERSION_1_0" pinnedRequirements.deviceFeatures of
    Nothing -> assertFailure "VK_VERSION_1_0 has no device-feature rows"
    Just rows -> pure rows
  let robust =
        [ row
        | row <- V.toList rows
        , FeaturePath{struct = "VkPhysicalDeviceFeatures", member = "robustBufferAccess"}
            `elem` NE.toList row.paths
        ]
  map (.removedBy) robust @?= [Just "VK_KHR_portability_subset"]

unit_bindIndexBufferProvenance :: IO ()
unit_bindIndexBufferProvenance = do
  -- The core spelling comes from VK_VERSION_1_4 (via a graphics tier); the
  -- KHR spelling from VK_KHR_maintenance5.
  coreOrigins <- originsOf (ItemKey NsCommand "vkCmdBindIndexBuffer2")
  [ (feature, tier)
    | Origin{source = FromFeature{feature}, tier} <- NE.toList coreOrigins
    ]
    @?= [("VK_VERSION_1_4", Just "VK_GRAPHICS_VERSION_1_4")]
  khrOrigins <- originsOf (ItemKey NsCommand "vkCmdBindIndexBuffer2KHR")
  [extension | Origin{source = FromExtension{extension}} <- NE.toList khrOrigins]
    @?= ["VK_KHR_maintenance5"]
 where
  originsOf key = case Map.lookup key pinnedRequirements.required of
    Nothing -> assertFailure ("not required: " <> show key)
    Just origins -> pure origins

unit_bindIndexBufferDeprecation :: IO ()
unit_bindIndexBufferDeprecation = do
  info <- case Map.lookup (ItemKey NsCommand "vkCmdBindIndexBuffer2") pinnedRequirements.deprecations of
    Nothing -> assertFailure "vkCmdBindIndexBuffer2 not deprecated"
    Just info -> pure info
  info.supersededBy @?= Just "vkCmdBindIndexBuffer3KHR"
  assertBool "has a category" (info.categories /= [])
  -- Every deprecate-block entry carries a category and a since atom.
  let missing =
        mapMaybe
          ( \(k, d) ->
              if null d.categories || isNothing d.since then Just k else Nothing
          )
          (Map.toList pinnedRequirements.deprecations)
  missing @?= []
