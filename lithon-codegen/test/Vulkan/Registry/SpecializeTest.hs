{-# LANGUAGE OverloadedStrings #-}

-- | The api-specialization pass over the pinned registry: SC-only and
-- disabled content drops, api-collision pairs collapse, and the result is
-- name-unique per namespace (proven by 'specializeToApi' returning Right).
module Vulkan.Registry.SpecializeTest (
  unit_specializeToVulkan,
  unit_specializeToVulkanSC,
) where

import Data.Vector qualified as V
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry
import Lithon.Codegen.Vulkan.Registry.Types.Common (Api (..))
import Lithon.Codegen.Vulkan.Registry.Types.Core (TypeDecl (..), typeBodyName)
import Lithon.Codegen.Vulkan.Registry.Types.Features (Feature (..))
import Vulkan.Support.Registry (pinnedRegistry)

specializeOrFail :: Api -> IO (Specialized Registry)
specializeOrFail api = case specialize api pinnedRegistry of
  Failure errs ->
    assertFailure
      ("specialization failed: " <> show (fmap display errs))
  Success reg -> pure reg

unit_specializeToVulkan :: IO ()
unit_specializeToVulkan = do
  reg <- specializeOrFail ApiVulkan
  -- 402 supported=vulkan + 69 supported=vulkan,vulkansc; 219 disabled and
  -- 6 SC-only dropped.
  V.length reg.extensions @?= 471
  -- VKSC_VERSION_1_0 dropped, the 20 vulkan features remain.
  V.length reg.features @?= 20
  assertBool
    "no SC feature survives"
    (V.null (V.filter (\f -> f.name == "VKSC_VERSION_1_0") reg.features))
  -- The api-collision pair collapses to exactly one VK_HEADER_VERSION.
  V.length (V.filter (\t -> typeBodyName t.body == "VK_HEADER_VERSION") reg.types) @?= 1
  -- Strictly fewer types than the lossless IR (SC-only types dropped).
  assertBool "types were dropped" (V.length reg.types < 2663)

unit_specializeToVulkanSC :: IO ()
unit_specializeToVulkanSC = do
  reg <- specializeOrFail ApiVulkanSC
  -- 69 vulkan,vulkansc + 6 vulkansc-only.
  V.length reg.extensions @?= 75
  assertBool
    "VKSC_VERSION_1_0 survives"
    (not (V.null (V.filter (\f -> f.name == "VKSC_VERSION_1_0") reg.features)))
  V.length (V.filter (\t -> typeBodyName t.body == "VK_HEADER_VERSION") reg.types) @?= 1
