{-# LANGUAGE OverloadedStrings #-}

-- | WithNS-resolution exemplars pinned as units, plus whole-surface
-- validity over the curated registry.
module Vulkan.Generate.NamesTest (
  unit_typeStripping,
  unit_commandStripping,
  unit_valueCasingExemplars,
  unit_pinnedSurfaceMintsCollisionFree,
  unit_mintedNamesAreValidIdentifiers,
) where

import Data.Char qualified as Char
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual, assertFailure)

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Curate (Curated (..))
import Lithon.Codegen.Vulkan.Generate.Names
import Vulkan.Support.Resolve (pinnedCurated)

unit_typeStripping :: Assertion
unit_typeStripping = do
  assertEqual "struct" "ImageCreateInfo" (stripVkType "VkImageCreateInfo")
  assertEqual
    "acronym head survives"
    "PhysicalDeviceIDProperties"
    (stripVkType "VkPhysicalDeviceIDProperties")

unit_commandStripping :: Assertion
unit_commandStripping = do
  assertEqual "command" "createDevice" (stripVkCommand "vkCreateDevice")
  assertEqual "acronym head" "getDeviceProcAddr" (stripVkCommand "vkGetDeviceProcAddr")

unit_valueCasingExemplars :: Assertion
unit_valueCasingExemplars = do
  let tags = Set.fromList ["KHR", "EXT", "AMD", "NV"]
      go = pascalValueName tags
  assertEqual "digit runs" "FormatR8G8B8A8Srgb" (go "VK_FORMAT_R8G8B8A8_SRGB")
  assertEqual "leading-digit segment" "ImageType2D" (go "VK_IMAGE_TYPE_2D")
  assertEqual
    "lowercase after digit preserved + vendor tag verbatim"
    "FormatAstc4x4SrgbBlockEXT"
    (go "VK_FORMAT_ASTC_4x4_SRGB_BLOCK_EXT")
  assertEqual "bit position" "CullModeFrontBit" (go "VK_CULL_MODE_FRONT_BIT")
  assertEqual
    "version digits collapse"
    "StructureTypePhysicalDeviceVulkan13Features"
    (go "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES")

-- | The measured claim the design rests on: the whole curated surface
-- mints without collisions.
unit_pinnedSurfaceMintsCollisionFree :: Assertion
unit_pinnedSurfaceMintsCollisionFree =
  case buildNames pinnedCurated.registry of
    Failure errs -> assertFailure (toString (display errs))
    Success names -> do
      assertBool "types minted" (Map.size names.typeNames > 800)
      assertBool "commands minted" (Map.size names.commandNames > 300)
      assertBool "ctors minted" (Map.size names.ctorNames > 1500)
      assertBool "constants minted" (Map.size names.constantNames > 100)
      assertBool "extensions minted" (Map.size names.extensionModules > 80)

unit_mintedNamesAreValidIdentifiers :: Assertion
unit_mintedNamesAreValidIdentifiers =
  case buildNames pinnedCurated.registry of
    Failure errs -> assertFailure (toString (display errs))
    Success names -> do
      mapM_ (assertShape conid) (Map.elems names.typeNames)
      mapM_ (assertShape conid) (Map.elems names.ctorNames)
      mapM_ (assertShape conid) (Map.elems names.constantNames)
      mapM_ (assertShape varid) (Map.elems names.commandNames)
      mapM_ (assertShape conid) (Map.elems names.extensionModules)
 where
  conid t = case T.uncons t of
    Just (c, rest) -> Char.isUpper c && T.all identChar rest
    Nothing -> False
  varid t = case T.uncons t of
    Just (c, rest) -> Char.isLower c && T.all identChar rest
    Nothing -> False
  identChar c = Char.isAlphaNum c || c == '_' || c == '\''
  assertShape p t = assertBool ("valid identifier: " <> toString t) (p t)
