{-# LANGUAGE OverloadedStrings #-}

-- | Cross-reference resolution and enum-flow classification over the
-- pinned registry.
module Vulkan.Resolve.CrossRefTest (
  unit_typeGraphCountsPinned,
  unit_dispatchLevels,
  unit_swapchainCreateInfoResolves,
  unit_aliasInversionOnEntities,
  unit_pNextTopology,
  unit_bitmaskLinking,
  unit_arrayDimConstants,
  unit_platformGuards,
  unit_enumFlowSpotChecks,
) where

import Data.Map.Strict qualified as Map
import Data.Vector qualified as V
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Types.Enums (BitWidth (..))
import Lithon.Codegen.Vulkan.Resolve.CrossRef (TypeGraph (..))
import Lithon.Codegen.Vulkan.Resolve.Flow (EnumFlow (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (AliasInfo (..), AvailExpr, PlatformGuard (..))
import Lithon.Codegen.Vulkan.Resolved.Commands (DispatchLevel (..), ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBitmask (..),
  ResolvedDim (..),
  ResolvedMember (..),
  ResolvedStruct (..),
  ResolvedTypeRef (..),
  TypeRefKind (..),
 )
import Vulkan.Support.Resolve (pinnedFlows, pinnedTypeGraph)

structNamespace :: TypeName -> IO ResolvedStruct
structNamespace n = case Map.lookup n pinnedTypeGraph.structs of
  Nothing -> assertFailure ("no struct " <> show n)
  Just s -> pure s

commandNamespace :: CommandName -> IO ResolvedCommand
commandNamespace n = case Map.lookup n pinnedTypeGraph.commands of
  Nothing -> assertFailure ("no command " <> show n)
  Just c -> pure c

unit_typeGraphCountsPinned :: IO ()
unit_typeGraphCountsPinned = do
  Map.size pinnedTypeGraph.structs @?= 1485
  Map.size pinnedTypeGraph.handles @?= 60
  Map.size pinnedTypeGraph.bitmasks @?= 237
  Map.size pinnedTypeGraph.funcpointers @?= 11
  Map.size pinnedTypeGraph.externals @?= 77
  Map.size pinnedTypeGraph.commands @?= 752

unit_dispatchLevels :: IO ()
unit_dispatchLevels = do
  levelCount DispatchGlobal @?= 4
  levelCount DispatchInstance @?= 109
  levelCount DispatchDevice @?= 639
  dispatchOf "vkCreateInstance" DispatchGlobal
  dispatchOf "vkEnumerateInstanceVersion" DispatchGlobal
  dispatchOf "vkGetPhysicalDeviceProperties2" DispatchInstance
  dispatchOf "vkDestroySurfaceKHR" DispatchInstance
  dispatchOf "vkGetDeviceProcAddr" DispatchDevice
  dispatchOf "vkCmdDraw" DispatchDevice
 where
  levelCount lvl =
    Map.size (Map.filter (\c -> c.dispatch == lvl) pinnedTypeGraph.commands)
  dispatchOf n expected = do
    c <- commandNamespace n
    c.dispatch @?= expected

unit_swapchainCreateInfoResolves :: IO ()
unit_swapchainCreateInfoResolves = do
  s <- structNamespace "VkSwapchainCreateInfoKHR"
  s.sType @?= Just "VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR"
  surface <- case V.find (\m -> m.name == "surface") s.members of
    Nothing -> assertFailure "no surface member"
    Just m -> pure m
  surface.typeRef.kind @?= RefHandle
  surface.typeRef.name @?= "VkSurfaceKHR"
  availability <- case s.availability of
    Nothing -> assertFailure "VkSwapchainCreateInfoKHR unreachable"
    Just a -> pure a
  display availability @?= ("VK_KHR_swapchain" :: Text)

unit_aliasInversionOnEntities :: IO ()
unit_aliasInversionOnEntities = do
  s <- structNamespace "VkPipelineCreateFlags2CreateInfo"
  map (.name) (V.toList s.aliases) @?= ["VkPipelineCreateFlags2CreateInfoKHR"]
  c <- commandNamespace "vkCmdBindIndexBuffer2"
  khr <- case V.toList c.aliases of
    [single] -> pure single
    other -> assertFailure ("expected one alias, got " <> show (map (.name) other))
  khr.name @?= "vkCmdBindIndexBuffer2KHR"
  -- The alias spelling is loadable exactly via its extension.
  fmap (display @AvailExpr) khr.availability @?= Just ("VK_KHR_maintenance5" :: Text)

unit_pNextTopology :: IO ()
unit_pNextTopology = do
  features2 <- structNamespace "VkPhysicalDeviceFeatures2"
  assertBool
    "VkPhysicalDeviceVulkan11Features extends VkPhysicalDeviceFeatures2"
    ("VkPhysicalDeviceVulkan11Features" `elem` features2.extendedBy)
  assertBool "large pNext family" (length features2.extendedBy > 200)
  v11 <- structNamespace "VkPhysicalDeviceVulkan11Features"
  v11.extends @?= ["VkPhysicalDeviceFeatures2", "VkDeviceCreateInfo"]

unit_bitmaskLinking :: IO ()
unit_bitmaskLinking = do
  access2 <- case Map.lookup "VkAccessFlags2" pinnedTypeGraph.bitmasks of
    Nothing -> assertFailure "no VkAccessFlags2"
    Just b -> pure b
  access2.bitWidth @?= W64
  access2.baseType @?= "VkFlags64"
  access2.bitsBlock @?= Just "VkAccessFlagBits2"
  -- Reserved-for-future masks exist and are legal.
  assertBool
    "reserved-empty bitmasks exist"
    (any (\b -> isNothing b.bitsBlock) (Map.elems pinnedTypeGraph.bitmasks))

unit_arrayDimConstants :: IO ()
unit_arrayDimConstants = do
  props <- structNamespace "VkPhysicalDeviceProperties"
  dimOf props "deviceName" RDimConst{name = "VK_MAX_PHYSICAL_DEVICE_NAME_SIZE", size = 256}
  dimOf props "pipelineCacheUUID" RDimConst{name = "VK_UUID_SIZE", size = 16}
 where
  dimOf s member expected = case V.find (\m -> m.name == member) s.members of
    Nothing -> assertFailure ("no member " <> show member)
    Just m -> m.arrayDims @?= [expected]

unit_platformGuards :: IO ()
unit_platformGuards = do
  win32 <- structNamespace "VkWin32SurfaceCreateInfoKHR"
  win32.platformGuards
    @?= [PlatformGuard{platform = "win32", protect = "VK_USE_PLATFORM_WIN32_KHR"}]
  -- Core entities are unguarded.
  device <- structNamespace "VkDeviceCreateInfo"
  device.platformGuards @?= []

unit_enumFlowSpotChecks :: IO ()
unit_enumFlowSpotChecks = do
  flowOf "VkResult" FlowBoth
  flowOf "VkFormat" FlowBoth
  flowOf "VkStructureType" FlowBoth
  -- App-provided only.
  flowOf "VkPipelineCreateFlagBits" FlowIn
  assertBool
    "some blocks are driver-out only"
    (not (Map.null (Map.filter (== FlowOut) pinnedFlows)))
 where
  flowOf n expected = case Map.lookup n pinnedFlows of
    Nothing -> assertFailure ("no flow for " <> show n)
    Just f -> f @?= expected
