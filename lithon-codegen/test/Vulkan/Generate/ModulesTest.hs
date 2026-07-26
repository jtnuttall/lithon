{-# LANGUAGE OverloadedStrings #-}

-- | Module-assignment exemplars over the pinned curated surface.
module Vulkan.Generate.ModulesTest (
  unit_coreEnumPlacement,
  unit_promotedEnumPlacement,
  unit_extensionEntityPlacement,
  unit_flagsCoLocateWithBits,
  unit_handlePlacement,
  unit_wholeSurfaceAssigns,
) where

import Data.Map.Strict qualified as Map
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual, assertFailure)

import Lithon.Codegen.Backend.Hs (ModulePath (..))
import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Curate (Curated (..))
import Lithon.Codegen.Vulkan.Generate.Lower (lowerStructs)
import Lithon.Codegen.Vulkan.Generate.Modules
import Lithon.Codegen.Vulkan.Generate.Names (buildNames)
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))
import Vulkan.Support.Resolve (pinnedCurated)

assigned :: ModuleMap
assigned =
  case buildNames pinnedCurated.registry of
    Failure errs -> error ("names: " <> display errs)
    Success names ->
      case lowerStructs pinnedCurated.registry of
        Failure errs -> error ("lower: " <> display errs)
        Success lowered ->
          case assignModules (pinnedCurated.registry, names, lowered) of
            Failure errs -> error ("modules: " <> display errs)
            Success mm -> mm

lookupDotted :: Map TypeName ModulePath -> TypeName -> Maybe Text
lookupDotted m k = (.dotted) <$> Map.lookup k m

unit_coreEnumPlacement :: Assertion
unit_coreEnumPlacement =
  assertEqual
    "VkResult is core 1.0"
    (Just "Lithon.Vk.Core10.Enums.Result")
    (lookupDotted assigned.enumModules "VkResult")

unit_promotedEnumPlacement :: Assertion
unit_promotedEnumPlacement = do
  assertEqual
    "VkSemaphoreType promoted to 1.2"
    (Just "Lithon.Vk.Core12.Enums.SemaphoreType")
    (lookupDotted assigned.enumModules "VkSemaphoreType")

unit_extensionEntityPlacement :: Assertion
unit_extensionEntityPlacement =
  assertEqual
    "surface transform bits live in the surface extension module"
    (Just "Lithon.Vk.Extensions.KHR_surface")
    (lookupDotted assigned.enumModules "VkSurfaceTransformFlagBitsKHR")

unit_flagsCoLocateWithBits :: Assertion
unit_flagsCoLocateWithBits = do
  let bitsAt = lookupDotted assigned.enumModules "VkMemoryPropertyFlagBits"
      flagsAt = lookupDotted assigned.bitmaskModules "VkMemoryPropertyFlags"
  assertBool "bits block assigned" (isJust bitsAt)
  assertEqual "Flags synonym co-locates" bitsAt flagsAt

unit_handlePlacement :: Assertion
unit_handlePlacement = do
  assertEqual
    "core handle"
    (Just "Lithon.Vk.Core10.Handles")
    (lookupDotted assigned.handleModules "VkDevice")
  assertEqual
    "extension handle"
    (Just "Lithon.Vk.Extensions.KHR_swapchain")
    (lookupDotted assigned.handleModules "VkSwapchainKHR")

unit_wholeSurfaceAssigns :: Assertion
unit_wholeSurfaceAssigns =
  case buildNames pinnedCurated.registry of
    Failure errs -> assertFailure (toString (display errs))
    Success names ->
      case lowerStructs pinnedCurated.registry of
        Failure errs -> error ("lower: " <> display errs)
        Success lowered ->
          case assignModules (pinnedCurated.registry, names, lowered) of
            Failure errs -> assertFailure (toString (display errs))
            Success mm -> do
              assertBool "all non-constant enum blocks assigned" (Map.size mm.enumModules > 150)
              assertEqual
                "every bitmask assigned"
                (Map.size pinnedCurated.registry.bitmasks)
                (Map.size mm.bitmaskModules)
              assertEqual
                "every handle assigned"
                (Map.size pinnedCurated.registry.handles)
                (Map.size mm.handleModules)
