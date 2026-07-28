{-# LANGUAGE OverloadedStrings #-}

-- | Golden layers over the RESOLVED registry, mirroring the phase-1
-- architecture:
--
-- 1. @resolved-summary.golden@ — table counts, flow\/dispatch breakdowns,
--    per-table digests.
-- 2. @resolved\/\<WithNS\>.golden@ — full canonical resolved IR of hand-picked
--    entities (alias inversion, availability, materialized values, pNext
--    topology — the constructs phase 3 consumes).
-- 3. @resolved.digest@ — digest of the full resolved dump.
--
-- Regenerate after INTENDED changes with:
-- @cabal test lithon-codegen-test --test-options=--accept@
module Vulkan.Resolved.GoldenTest (
  test_resolvedGoldens,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.Char (isAlphaNum)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Vector qualified as V
import Lithon.Prelude
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.Golden (goldenVsStringDiff)

import Lithon.Codegen.Backend.Json (canonicalJsonBytes, digestText)
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedFeature (..), ResolvedRegistry (..))
import Lithon.Codegen.Vulkan.Resolved.Summary (summarizeResolved)
import Vulkan.Support.Resolve (pinnedResolved)

-- | Resolved entities pinned as reviewable goldens.
sliceNames :: [Text]
sliceNames =
  [ "VkResult" -- negative offsets, flow, value aliases
  , "VkAccessFlagBits2" -- 64-bit bit values
  , "VkPipelineCreateFlags2CreateInfo" -- struct alias inversion
  , "vkCmdBindIndexBuffer2" -- promoted command: alias availability + supersededBy
  , "VkSwapchainCreateInfoKHR" -- WSI struct: sType, availability, handle refs
  , "VkPhysicalDeviceFeatures2" -- pNext reverse topology
  , "VkAccelerationStructureInstanceKHR" -- bitfield members
  , "VkDevice" -- dispatchable handle
  , "VK_WHOLE_SIZE" -- (~0ULL) constant
  , "VK_VERSION_1_4" -- feature: mandatory device features + merged tiers
  , "VK_KHR_acceleration_structure" -- extension: nested classified depends
  , "VK_KHR_portability_subset" -- provisional extension with platform guard
  ]

test_resolvedGoldens :: TestTree
test_resolvedGoldens =
  testGroup
    "resolved goldens"
    ( [ golden
          "resolved-summary"
          "test/golden/resolved-summary.golden"
          (canonicalJsonBytes (summarizeResolved reg))
      , golden
          "resolved-dump-digest"
          "test/golden/resolved.digest"
          (LBS.fromStrict (TE.encodeUtf8 (digestText (canonicalJsonBytes reg) <> "\n")))
      ]
        <> map sliceGolden sliceNames
    )
 where
  reg = pinnedResolved
  golden name path bytes = goldenVsStringDiff name diffCmd path (pure bytes)
  diffCmd ref new = ["diff", "-u", ref, new]
  sliceGolden name =
    golden
      ("resolved slice: " <> T.unpack name)
      ("test/golden/resolved/" <> sanitize name <> ".golden")
      case sliceNamespace name of
        Just bytes -> bytes
        Nothing -> error ("resolved golden slice not found: " <> name)
  sanitize =
    T.unpack . T.map \c -> if isAlphaNum c || c == '_' || c == '-' then c else '-'
  sliceNamespace name =
    firstJust
      [ canonicalJsonBytes <$> Map.lookup (WithNS name) reg.structs
      , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.enums
      , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.bitmasks
      , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.handles
      , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.commands
      , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.constants
      , canonicalJsonBytes <$> Map.lookup (WithNS name) reg.extensions
      , canonicalJsonBytes <$> V.find (\f -> f.name == WithNS name) reg.features
      ]
  firstJust = foldr (<|>) Nothing
