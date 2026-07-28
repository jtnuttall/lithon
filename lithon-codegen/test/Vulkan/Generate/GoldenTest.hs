{-# LANGUAGE OverloadedStrings #-}

-- | Golden layers over the GENERATE stage, mirroring the parse\/resolve
-- architecture:
--
-- 1. @generate\/names.digest@ — digest of the full minted-name maps.
-- 2. @generate\/module-map.golden@ — the complete entity->module assignment
--    (reviewable: every placement change shows up here).
-- 3. @generate\/generated.digest@ — one digest over every emitted file
--    (pre-format: hermetic against the formatter).
-- 4. @generate\/src\/…@ — full pre-format source of hand-picked modules.
--
-- Regenerate after INTENDED changes with:
-- @cabal test lithon-codegen-test --test-options=--accept@
module Vulkan.Generate.GoldenTest (
  test_generateGoldens,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Text.Encoding qualified as TE
import Lithon.Prelude
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.Golden (goldenVsStringDiff)

import Lithon.Codegen.Backend.Json (canonicalJsonBytes, digestText)
import Lithon.Codegen.Vulkan.Curate (Curated (..))
import Lithon.Codegen.Vulkan.Generate (GenOutput (..), generate)
import Lithon.Codegen.Vulkan.Generate.Lower (lowerStructs)
import Lithon.Codegen.Vulkan.Generate.Modules (assignModules)
import Lithon.Codegen.Vulkan.Generate.Names (buildNames)
import Vulkan.Support.Resolve (pinnedCurated)

-- | Emitted modules pinned as full-text goldens (pre-format), chosen for
-- the constructs they exercise.
sliceFiles :: [FilePath]
sliceFiles =
  [ "src/Lithon/Vk/Core10/Enums/Result.hs" -- negative values, unprefixed ctors
  , "src/Lithon/Vk/Core13/Enums/PipelineStageFlagBits2.hs" -- 64-bit mask + literals
  , "src/Lithon/Vk/Core10/Handles.hs" -- rich dispatchables + Unbox recipe
  , "src/Lithon/Vk/Extensions/KHR_swapchain.hs" -- swapchain cmds: dual arrays, acquire, present
  , "src/Lithon/Vk/Result.hs" -- the Outcome vocabulary
  , "src/Lithon/Vk/Version.hs" -- version patterns + header pin
  , "src/Lithon/Vk/Dispatch.hs" -- C shapes, invokers, three tables + inits
  , "src/Lithon/Vk/Core10/DeviceInitialization.hs" -- createInstance/table init/withInstance
  , "src/Lithon/Vk/Core10/CommandBufferCommands.hs" -- arrow-retained count, pool bracket
  , "src/Lithon/Vk/Core10/PipelineCacheCommands.hs" -- dual bytes with CSize count
  , "src/Lithon/Vk/Core11/Other.hs" -- dual es-poly chain arrays, CHandleD members
  , "src/Lithon/Vk/Core13/Other.hs" -- queueSubmit2 SomeStruct array (safe import)
  ]

pinnedGenerated :: GenOutput
pinnedGenerated = case generate pinnedCurated of
  Right out -> out
  Left errs -> error ("generate failed on the pinned registry: " <> display errs)
{-# NOINLINE pinnedGenerated #-}

test_generateGoldens :: TestTree
test_generateGoldens =
  testGroup
    "generate goldens"
    ( [ golden
          "names-digest"
          "test/golden/generate/names.digest"
          (digestLine (canonicalJsonBytes names))
      , golden
          "module-map"
          "test/golden/generate/module-map.golden"
          (canonicalJsonBytes moduleMap)
      , golden
          "generated-dump-digest"
          "test/golden/generate/generated.digest"
          (digestLine (canonicalJsonBytes digests))
      , golden
          "gen-report"
          "test/golden/generate/gen-report.golden"
          (canonicalJsonBytes pinnedGenerated.report)
      ]
        <> map sliceGolden sliceFiles
    )
 where
  names = case buildNames pinnedCurated.registry of
    Success ns -> ns
    Failure errs -> error ("names failed: " <> display errs)
  moduleMap = case lowerStructs pinnedCurated.registry of
    Failure errs -> error ("lower failed: " <> display errs)
    Success lowered -> case assignModules (pinnedCurated.registry, names, lowered) of
      Success mm -> mm
      Failure errs -> error ("modules failed: " <> display errs)
  digests =
    Map.map (digestText . LBS.fromStrict . TE.encodeUtf8) pinnedGenerated.files
  digestLine bytes =
    LBS.fromStrict (TE.encodeUtf8 (digestText bytes <> "\n"))
  golden name path bytes = goldenVsStringDiff name diffCmd path (pure bytes)
  diffCmd ref new = ["diff", "-u", ref, new]
  sliceGolden rel =
    golden
      ("generated slice: " <> rel)
      ("test/golden/generate/" <> map slash rel <> ".golden")
      case Map.lookup rel pinnedGenerated.files of
        Just contents -> LBS.fromStrict (TE.encodeUtf8 contents)
        Nothing -> error ("generated golden slice not found: " <> toText rel)
  slash c = if c == '/' then '-' else c
