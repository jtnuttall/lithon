{-# LANGUAGE OverloadedStrings #-}

-- | The three golden layers over the pinned registry:
--
-- 1. @summary.golden@ — counts + per-section digests; any change anywhere
--    trips exactly one digest, localizing drift.
-- 2. @slices\/\<WithNS\>.golden@ — full canonical IR of hand-picked gnarly
--    entities (reviewable diffs for the constructs that matter).
-- 3. @registry.digest@ — digest of the full 30MB canonical dump; the
--    total-coverage tripwire (the dump itself is never committed).
--
-- Regenerate after INTENDED changes with:
-- @cabal test lithon-codegen-test --test-options=--accept@
module Vulkan.GoldenTest (
  test_goldens,
) where

import Data.Aeson (Value, toJSON)
import Data.ByteString.Lazy qualified as LBS
import Data.Char (isAlphaNum)
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Vector qualified as V
import Lithon.Prelude
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.Golden (goldenVsStringDiff)

import Lithon.Codegen.Backend.Json (canonicalJsonBytes, digestText)
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry (Registry (..))
import Lithon.Codegen.Vulkan.Registry.Summary (summarize)
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (Declaration (..))
import Lithon.Codegen.Vulkan.Registry.Types.Commands (
  Command (..),
  CommandDefinition (..),
  ProtoDecl (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Core (TypeDecl (..), typeBodyName)
import Lithon.Codegen.Vulkan.Registry.Types.Enums (EnumsBlock (..))
import Lithon.Codegen.Vulkan.Registry.Types.Features (Extension (..), Feature (..))
import Lithon.Codegen.Vulkan.Registry.Types.Misc (
  Format (..),
  SpirvCapability (..),
  SpirvExtension (..),
  VideoCodec (..),
 )
import Vulkan.Support.Registry (pinnedRegistry)

-- | Entities whose full IR is pinned as reviewable goldens — one per gnarly
-- construct class.
sliceNames :: [Text]
sliceNames =
  [ "VkAccelerationStructureInstanceKHR" -- bitfields
  , "VkTransformMatrixKHR" -- matrix[3][4]
  , "VkShaderModuleCreateInfo" -- latexmath len + altlen
  , "VkInstanceCreateInfo" -- multi-level len (ppEnabled*)
  , "VK_HEADER_VERSION" -- api-collision pair (vulkan vs vulkansc)
  , "MTLDevice_id" -- #ifdef basetype
  , "VK_MAKE_API_VERSION" -- macro define
  , "PFN_vkAllocationFunction" -- structured funcpointer
  , "wl_display" -- category-less external type
  , "VkBufferUsageFlags2" -- 64-bit bitmask w/ bitvalues
  , "VkAccessFlagBits2" -- bitwidth=64 enums block
  , "VkResult" -- negative values + offset extensions
  , "vkUpdateDescriptorSets" -- externsync maybe:path[].field
  , "vkGetPhysicalDeviceProperties2KHR" -- alias-form command
  , "VK_BASE_VERSION_1_1" -- apitype=internal tier + deprecate blocks
  , "VK_VERSION_1_1" -- public feature depending on tiers
  , "VKSC_VERSION_1_0" -- SC feature with remove blocks
  , "VkPhysicalDeviceVulkan11Features" -- name-alias members
  , "VK_KHR_acceleration_structure" -- extension with nested depends
  , "VK_KHR_portability_subset" -- extension with remove block
  , "VK_FORMAT_G8_B8R8_2PLANE_420_UNORM" -- multi-planar format
  , "SPV_KHR_variable_pointers" -- spirv extension
  , "ShaderViewportIndexLayerEXT" -- spirv capability with feature enables
  , "H.264 Decode" -- video codec extending a base category
  ]

test_goldens :: TestTree
test_goldens =
  testGroup
    "goldens"
    ( [ golden "summary" "test/golden/summary.golden" (canonicalJsonBytes (summarize reg))
      , golden
          "full-dump-digest"
          "test/golden/registry.digest"
          (LBS.fromStrict (TE.encodeUtf8 (digestText (canonicalJsonBytes reg) <> "\n")))
      ]
        <> map sliceGolden sliceNames
    )
 where
  reg = pinnedRegistry
  golden name path bytes = goldenVsStringDiff name diffCmd path (pure bytes)
  diffCmd ref new = ["diff", "-u", ref, new]
  sliceGolden name =
    golden
      ("slice: " <> T.unpack name)
      ("test/golden/slices/" <> sanitize name <> ".golden")
      case findAll name reg of
        [] -> error ("golden slice not found in registry: " <> name)
        [single] -> canonicalJsonBytes single
        several -> canonicalJsonBytes several
  sanitize =
    T.unpack . T.map \c -> if isAlphaNum c || c == '_' || c == '-' then c else '-'

-- | Every entity with the given name, across all name-bearing sections
-- (api-collision pairs like VK_HEADER_VERSION yield several).
findAll :: Text -> Registry -> [Value]
findAll name reg =
  concat
    [ [toJSON t | t <- V.toList reg.types, typeBodyName t.body == WithNS name]
    , [toJSON b | b <- V.toList reg.enums, b.name == WithNS name]
    , [toJSON c | c <- V.toList reg.commands, commandName c == name]
    , [toJSON f | f <- V.toList reg.features, f.name == WithNS name]
    , [toJSON e | e <- V.toList reg.extensions, e.name == WithNS name]
    , [toJSON f | f <- V.toList reg.formats, f.name == name]
    , [toJSON s | s <- V.toList reg.spirvExtensions, s.name == name]
    , [toJSON s | s <- V.toList reg.spirvCapabilities, s.name == name]
    , [toJSON v | v <- V.toList reg.videoCodecs, v.name == name]
    ]
 where
  commandName = \case
    CommandAlias{name = n} -> forgetNamespace n
    CommandDef d -> d.proto.decl.name
