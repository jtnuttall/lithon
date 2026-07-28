{-# LANGUAGE OverloadedStrings #-}

-- | Tier census over the pinned surface — the measured numbers the POD
-- design rests on.
module Vulkan.Generate.MarshalTest (
  unit_podCensus,
  unit_podExemplars,
) where

import Data.Set qualified as Set
import Lithon.Prelude
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual, assertFailure)

import Lithon.Codegen.Vulkan.Curate (Curated (..))
import Lithon.Codegen.Vulkan.Generate.Layout (computeLayouts)
import Lithon.Codegen.Vulkan.Generate.Lower (lowerStructs)
import Lithon.Codegen.Vulkan.Generate.Marshal (StructPlans (..), StructTiers (..), planStructs)
import Vulkan.Support.Resolve (pinnedCurated)

tiers :: StructTiers
tiers = case lowerStructs pinnedCurated.registry of
  Failure errs -> error ("lower: " <> display errs)
  Success lowered -> case computeLayouts (lowered, pinnedCurated.registry) of
    Failure errs -> error ("layout: " <> display errs)
    Success layouts -> case planStructs (pinnedCurated.registry, lowered, layouts) of
      Failure errs -> error ("plans: " <> display errs)
      Success sp -> sp.tiers
{-# NOINLINE tiers #-}

-- | The design-review census: 88 POD structs in the curated surface. A
-- registry bump moving this number is fine — a code change moving it is a
-- classification bug.
unit_podCensus :: Assertion
unit_podCensus = do
  assertEqual "POD count" 88 (Set.size tiers.pods)
  assertBool
    "every POD peeks (peekability extends into the marshalled tier)"
    (tiers.pods `Set.isSubsetOf` tiers.peekable)
  -- existential chain elements block read-back
  assertBool
    "GraphicsPipelineCreateInfo does not peek (Some-typed stages)"
    (not (Set.member "VkGraphicsPipelineCreateInfo" tiers.peekable))
  assertBool
    "PhysicalDeviceFeatures2 peeks (planted chains read back)"
    (Set.member "VkPhysicalDeviceFeatures2" tiers.peekable)

unit_podExemplars :: Assertion
unit_podExemplars = do
  assertBool "Extent2D" (Set.member "VkExtent2D" tiers.pods)
  assertBool "ClearValue (union)" (Set.member "VkClearValue" tiers.pods)
  assertBool
    "AccelerationStructureInstanceKHR (bitfields)"
    (Set.member "VkAccelerationStructureInstanceKHR" tiers.pods)
  assertBool
    "PhysicalDeviceProperties (char[256] + nested)"
    (Set.member "VkPhysicalDeviceProperties" tiers.pods)
  assertBool
    "DeviceCreateInfo is NOT POD (pointers)"
    (not (Set.member "VkDeviceCreateInfo" tiers.pods))
