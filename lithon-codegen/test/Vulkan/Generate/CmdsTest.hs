{-# LANGUAGE OverloadedStrings #-}

-- | Unit assertions over the command PLAN layer (g5): the census the
-- goldens pin, count-source resolution for every arm, the corner-case
-- matrix (shapes, Maybe-vectors, es variables, bracket pairing), and the
-- planning report. Rendering is covered by the wrapper slice goldens.
module Vulkan.Generate.CmdsTest (
  test_commandPlans,
) where

import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (assertBool, assertEqual, testCase)

import Lithon.Codegen.Vulkan.Curate (Curated (..))
import Lithon.Codegen.Vulkan.Generate.Cmds
import Lithon.Codegen.Vulkan.Generate.Layout (computeLayouts)
import Lithon.Codegen.Vulkan.Generate.Lower (lowerStructs)
import Lithon.Codegen.Vulkan.Generate.Marshal (planStructs)
import Lithon.Codegen.Vulkan.Generate.Modules (assignModules)
import Lithon.Codegen.Vulkan.Generate.Names (buildNames)
import Lithon.Codegen.Vulkan.Names
import Vulkan.Support.Resolve (pinnedCurated)

pinnedPlans :: CommandPlans
pinnedPlans =
  let registry = pinnedCurated.registry
      req what = either (\e -> error (what <> " failed: " <> display e)) id . validationToEither
      names = req "names" (buildNames registry)
      lowered = req "lower" (lowerStructs registry)
      moduleMap = req "modules" (assignModules (registry, names, lowered))
      layouts = req "layout" (computeLayouts (registry, lowered))
      structPlans = req "marshal" (planStructs (registry, lowered, layouts))
   in req "plan" (planCommands (registry, names, moduleMap, layouts, structPlans))
{-# NOINLINE pinnedPlans #-}

planOf :: Text -> CommandPlan
planOf n =
  fromMaybe
    (error ("no plan for " <> n))
    (Map.lookup (WithNS n) pinnedPlans.plans)

countsOf :: Text -> [CountSource]
countsOf n = [b.source | b <- (planOf n).counts]

insOf :: Text -> [Text]
insOf n = [hsType | PIn{hsType} <- (planOf n).params]

marshalsOf :: Text -> [Text]
marshalsOf n = concat [marshalStmts | PIn{marshalStmts} <- (planOf n).params]

outKindsOf :: Text -> [OutKind]
outKindsOf n = [o.kind | POut o _ <- (planOf n).params]

test_commandPlans :: TestTree
test_commandPlans =
  testGroup
    "command plans"
    [ testCase "census (the numbers the report golden pins)" do
        let census =
              Map.fromListWith
                (+)
                [(p.shape, 1 :: Int) | p <- Map.elems pinnedPlans.plans]
        assertEqual
          "shape census"
          ( Map.fromList
              [ (ShapeUnit, 172)
              , (ShapeScalarRet, 10)
              , (ShapeResultOnly, 55)
              , (ShapeFixedOut, 84)
              , (ShapeChainOut, 13)
              , (ShapeSizedOutArray, 7)
              , (ShapeDualCall, 30)
              , (ShapeBytesOut, 9)
              , (ShapeOverride, 2)
              ]
          )
          census
        assertEqual "total = curated minus excluded" 382 (Map.size pinnedPlans.plans)
    , testCase "proc-addr commands are excluded" do
        assertBool
          "vkGetInstanceProcAddr"
          (isNothing (Map.lookup "vkGetInstanceProcAddr" pinnedPlans.plans))
        assertBool "vkGetDeviceProcAddr" (isNothing (Map.lookup "vkGetDeviceProcAddr" pinnedPlans.plans))
    , testCase "arrow len, retained field (vkAllocateCommandBuffers)" do
        assertEqual
          "count source"
          [CSRetainedField{arg = "allocateInfo", field = "commandBufferCount"}]
          (countsOf "vkAllocateCommandBuffers")
        case (planOf "vkAllocateCommandBuffers").bracket of
          Just bp -> do
            assertEqual "with name" "withCommandBuffers" bp.withName
            assertEqual
              "pool free"
              BPoolFree{poolExpr = "allocateInfo.commandPool", freeReturnsResult = False}
              bp.kind
          Nothing -> error "expected a bracket"
    , testCase "arrow len, absorbed vector (vkAllocateDescriptorSets)" do
        assertEqual
          "count source"
          [CSAbsorbedVec{arg = "allocateInfo", vecField = "setLayouts", scale = 1}]
          (countsOf "vkAllocateDescriptorSets")
        case (planOf "vkAllocateDescriptorSets").bracket of
          Just bp ->
            assertEqual
              "free returns Result and is voided"
              BPoolFree{poolExpr = "allocateInfo.descriptorPool", freeReturnsResult = True}
              bp.kind
          Nothing -> error "expected a bracket"
    , testCase "arrow len, optional input array (vkGetAccelerationStructureBuildSizesKHR)" do
        assertEqual
          "count source"
          [CSAbsorbedVec{arg = "buildInfo", vecField = "geometries", scale = 1}]
          (countsOf "vkGetAccelerationStructureBuildSizesKHR")
        assertBool
          "optional array is Maybe"
          ("Maybe (V.Vector Word32)" `elem` insOf "vkGetAccelerationStructureBuildSizesKHR")
    , testCase "shared count with length check (vkCmdBindVertexBuffers)" do
        assertEqual
          "driver"
          [CSInVectorLen{arg = "buffers", lenFn = "V.length"}]
          (countsOf "vkCmdBindVertexBuffers")
        assertBool
          "offsets checked against the bind"
          (any ("n_bindingCount" `T.isInfixOf`) (marshalsOf "vkCmdBindVertexBuffers"))
    , testCase "optional shared-count arrays (vkCmdBindVertexBuffers2)" do
        assertEqual
          "two Maybe vectors"
          2
          (length (filter (== "Maybe (V.Vector DeviceSize)") (insOf "vkCmdBindVertexBuffers2")))
    , testCase "retained input count + bytes out (vkGetQueryPoolResults)" do
        assertEqual "count stays a param" [CSInScalar{arg = "dataSize"}] (countsOf "vkGetQueryPoolResults")
        assertEqual "shape" ShapeBytesOut (planOf "vkGetQueryPoolResults").shape
        assertBool "safe import" (Set.member "vkGetQueryPoolResults" safeList)
    , testCase "safe partition covers long-running driver work" do
        assertBool
          "pipeline/shader/swapchain creation is safe"
          ( all
              (`Set.member` safeList)
              [ "vkCreateComputePipelines"
              , "vkCreateGraphicsPipelines"
              , "vkCreateRayTracingPipelinesKHR"
              , "vkCreateShadersEXT"
              , "vkCreateSwapchainKHR"
              ]
          )
    , testCase "result policy: unwritten payload gates (the acquire family)" do
        let unwrittenOf n = maybe [] (.unwrittenCodes) (planOf n).resultPolicy
            posOf n = maybe [] (.positiveErrWires) (planOf n).resultPolicy
        assertEqual
          "acquireNextImageKHR gates TIMEOUT/NOT_READY (successcodes order)"
          [("VK_TIMEOUT", 2), ("VK_NOT_READY", 1)]
          (unwrittenOf "vkAcquireNextImageKHR")
        assertEqual
          "acquireNextImage2KHR matches"
          [("VK_TIMEOUT", 2), ("VK_NOT_READY", 1)]
          (unwrittenOf "vkAcquireNextImage2KHR")
        assertEqual
          "getQueryPoolResults gates NOT_READY"
          [("VK_NOT_READY", 1)]
          (unwrittenOf "vkGetQueryPoolResults")
        assertEqual
          "profiling lock: TIMEOUT is a positive ERROR code"
          [2]
          (posOf "vkAcquireProfilingLockKHR")
        assertEqual
          "pipeline creates are waived (always written), not gated"
          []
          (unwrittenOf "vkCreateGraphicsPipelines")
    , testCase "arena partition: zero-marshal wrappers skip the checkout" do
        assertBool "vkCmdBindPipeline skips" (not (planNeedsArena (planOf "vkCmdBindPipeline")))
        assertBool "vkCmdDraw skips" (not (planNeedsArena (planOf "vkCmdDraw")))
        assertBool "vkCreateDevice checks out" (planNeedsArena (planOf "vkCreateDevice"))
        assertBool "vkAcquireNextImageKHR checks out" (planNeedsArena (planOf "vkAcquireNextImageKHR"))
        assertEqual
          "arena-free census"
          95
          (length [p | p <- Map.elems pinnedPlans.plans, not (planNeedsArena p)])
    , testCase "bytes-in drivers (vkCmdUpdateBuffer, vkCmdPushConstants)" do
        assertEqual
          "wide count from BS.length"
          [CSInVectorLen{arg = "data'", lenFn = "BS.length"}]
          (countsOf "vkCmdUpdateBuffer")
        assertEqual
          "u32 count from BS.length"
          [CSInVectorLen{arg = "values", lenFn = "BS.length"}]
          (countsOf "vkCmdPushConstants")
    , testCase "dual es-poly array (vkGetPhysicalDeviceQueueFamilyProperties2)" do
        let p = planOf "vkGetPhysicalDeviceQueueFamilyProperties2"
        assertEqual "shape" ShapeDualCall p.shape
        assertBool "dual count present" (isJust p.dualCount)
        assertEqual
          "chain vector out"
          [OKChainStructVector]
          (outKindsOf "vkGetPhysicalDeviceQueueFamilyProperties2")
    , testCase "chain-in + chain-out (vkGetPhysicalDeviceSurfaceCapabilities2KHR)" do
        let p = planOf "vkGetPhysicalDeviceSurfaceCapabilities2KHR"
            esOf cs = [v | c <- cs, v <- T.words c, "es" `T.isPrefixOf` v]
            inEs = ordNub (esOf (concat [constraints | PIn{constraints} <- p.params]))
            outEs = ordNub (esOf (concat [o.constraints | POut o _ <- p.params]))
        assertEqual "shape" ShapeChainOut p.shape
        assertEqual "distinct in es" ["es1"] inEs
        assertEqual "distinct out es" ["es2"] outEs
    , testCase "void** out (vkMapMemory)" do
        assertEqual "shape" ShapeFixedOut (planOf "vkMapMemory").shape
        assertEqual "opaque out" [OKPtr] (outKindsOf "vkMapMemory")
    , testCase "fixed-array param (vkCmdSetBlendConstants)" do
        assertBool
          "vector param"
          ("V.Vector Float" `elem` insOf "vkCmdSetBlendConstants")
        assertBool
          "exact-length check"
          (any ("exactly 4 elements" `T.isInfixOf`) (marshalsOf "vkCmdSetBlendConstants"))
    , testCase "vector-out create with vector bracket (vkCreateGraphicsPipelines)" do
        let p = planOf "vkCreateGraphicsPipelines"
        assertEqual "shape" ShapeSizedOutArray p.shape
        assertBool
          "SomeStruct input"
          ("V.Vector (SomeStruct GraphicsPipelineCreateInfo)" `elem` insOf "vkCreateGraphicsPipelines")
        assertEqual "bracket kind" (Just BVector) ((.kind) <$> p.bracket)
    , testCase "self-destroy brackets (instance/device)" do
        assertEqual "instance" (Just BSelf) ((.kind) <$> (planOf "vkCreateInstance").bracket)
        assertEqual "device" (Just BSelf) ((.kind) <$> (planOf "vkCreateDevice").bracket)
    , testCase "dual bytes with CSize count (vkGetPipelineCacheData)" do
        let p = planOf "vkGetPipelineCacheData"
        assertEqual "shape" ShapeBytesOut p.shape
        assertEqual "dual wire" (Just "CSize") ((.wireTy) <$> p.dualCount)
    , testCase
        "two dual arrays, one count (vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR)"
        do
          let p = planOf "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR"
          assertEqual "dual outs" 2 (length [() | POut _ True <- p.params])
          assertBool "single dual count" (isJust p.dualCount)
    , testCase "mixed fixed-out + dual bytes (vkGetPipelineBinaryDataKHR)" do
        let p = planOf "vkGetPipelineBinaryDataKHR"
        assertEqual "shape" ShapeBytesOut p.shape
        assertEqual "one fixed struct out" 1 (length [() | POut o False <- p.params, o.kind == OKStruct])
        assertEqual "one dual bytes out" 1 (length [() | POut o True <- p.params, o.kind == OKBytes])
    , testCase "overrides" do
        assertEqual "fault info" ShapeOverride (planOf "vkGetDeviceFaultInfoEXT").shape
        assertEqual "pipeline binaries" ShapeOverride (planOf "vkCreatePipelineBinariesKHR").shape
        assertBool
          "sources spliced"
          ( all
              (isJust . (.overrideSource))
              [planOf "vkGetDeviceFaultInfoEXT", planOf "vkCreatePipelineBinariesKHR"]
          )
    , testCase "optional scalar pointer (vkCmdDrawMultiIndexedEXT)" do
        assertBool "Maybe Int32 param" ("Maybe Int32" `elem` insOf "vkCmdDrawMultiIndexedEXT")
    , testCase "report" do
        let r = genReport pinnedPlans
        assertEqual
          "retained input counts"
          [ ("vkGetDescriptorEXT", "dataSize")
          , ("vkGetQueryPoolResults", "dataSize")
          , ("vkGetRayTracingCaptureReplayShaderGroupHandlesKHR", "dataSize")
          , ("vkGetRayTracingShaderGroupHandlesKHR", "dataSize")
          , ("vkWriteAccelerationStructuresPropertiesKHR", "dataSize")
          , ("vkWriteMicromapsPropertiesEXT", "dataSize")
          ]
          (sort r.retainedInputCounts)
        assertEqual
          "unpaired creates"
          ["vkCreateDisplayModeKHR", "vkCreatePipelineBinariesKHR"]
          (sort r.unpairedCreates)
    ]
