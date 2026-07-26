{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}

-- | Poke\/peek roundtrips through REAL generated instances — the property
-- layer the lean @lithon@ package deliberately leaves to the examples.
-- Covers: POD Storable\/CStruct agreement, marshalled records (strings,
-- optionals, vector collapse), a planted Features2 chain, and a union's
-- raw-arm identity.
module RoundtripTest where

import Control.Monad.IO.Class (liftIO)
import Data.Vector qualified as V
import Data.Vector.Storable.Sized qualified as VSS
import Foreign.Ptr (freeHaskellFunPtr, nullFunPtr)
import Hedgehog
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Lithon.Core.Alloc (runAlloc, withArena)
import Lithon.Core.CStruct (new)
import Lithon.Core.Chain (pattern Nil, pattern (:&))
import Lithon.Vk
import Test.Tasty.HUnit (assertBool, assertEqual, (@?=))

roundtrip :: (CStruct a, FromCStruct a) => a -> IO a
roundtrip x = withArena \arena_ -> runAlloc arena_ do
  p <- new x
  liftIO (peekCStruct p)

hprop_extent2dRoundtrip :: Property
hprop_extent2dRoundtrip = property do
  w <- forAll (Gen.word32 Range.linearBounded)
  h <- forAll (Gen.word32 Range.linearBounded)
  let x = Extent2D{width = w, height = h}
  x' <- evalIO (roundtrip x)
  x' === x

hprop_viewportRoundtrip :: Property
hprop_viewportRoundtrip = property do
  let genF = Gen.float (Range.linearFrac (-4096) 4096)
  [a, b, c, d, e, f] <- forAll (Gen.list (Range.singleton 6) genF)
  let x = Viewport{x = a, y = b, width = c, height = d, minDepth = e, maxDepth = f}
  x' <- evalIO (roundtrip x)
  x' === x

hprop_applicationInfoRoundtrip :: Property
hprop_applicationInfoRoundtrip = property do
  nameB <- forAll (Gen.maybe (Gen.utf8 (Range.linear 0 32) Gen.alphaNum))
  ver <- forAll (Gen.word32 Range.linearBounded)
  let x =
        (nil @ApplicationInfo)
          { applicationName = nameB
          , applicationVersion = ver
          }
  x' <- evalIO (roundtrip x)
  x'.applicationName === nameB
  x'.applicationVersion === ver

hprop_imageCreateInfoRoundtrip :: Property
hprop_imageCreateInfoRoundtrip = property do
  mips <- forAll (Gen.word32 (Range.linear 1 16))
  layers <- forAll (Gen.word32 (Range.linear 1 16))
  qfis <- forAll (Gen.list (Range.linear 0 4) (Gen.word32 (Range.linear 0 8)))
  let x :: ImageCreateInfo '[] =
        (nil @(ImageCreateInfo '[]))
          { imageType = Known ImageType2D
          , format = Known FormatR8G8B8A8Unorm
          , extent = Extent3D{width = 64, height = 64, depth = 1}
          , mipLevels = mips
          , arrayLayers = layers
          , samples = flag SampleCount1Bit
          , queueFamilyIndices = V.fromList qfis
          }
  x' <- evalIO (roundtrip x)
  x'.mipLevels === mips
  x'.arrayLayers === layers
  x'.queueFamilyIndices === V.fromList qfis
  x'.format === Known FormatR8G8B8A8Unorm

-- planted chain: poke a Features2 with a 1.3 chain element, peek it back
unit_plantedChainRoundtrip :: IO ()
unit_plantedChainRoundtrip = do
  let vk13 =
        (nil @PhysicalDeviceVulkan13Features)
          { dynamicRendering = True
          , synchronization2 = True
          , maintenance4 = True
          }
      x :: PhysicalDeviceFeatures2 '[PhysicalDeviceVulkan13Features] =
        PhysicalDeviceFeatures2{next = vk13 :& Nil, features = nil}
  x' <- roundtrip x
  let vk13' :& Nil = x'.next
  assertBool "dynamicRendering survives" vk13'.dynamicRendering
  assertBool "synchronization2 survives" vk13'.synchronization2
  assertBool "maintenance4 survives" vk13'.maintenance4

-- union raw-arm identity: peek returns the bytes verbatim; re-poking them
-- reproduces the value
unit_clearValueRawIdentity :: IO ()
unit_clearValueRawIdentity = do
  let v = ClearValueColor (ClearColorValueFloat32 (VSS.replicate 0.25))
  v' <- roundtrip v
  case v' of
    ClearValueRaw _ -> do
      v'' <- roundtrip v'
      v'' @?= v'
    other -> fail ("expected the raw arm from peek, got: " <> show other)

-- string vector collapse (layer names) through a real create-info poke
unit_instanceCreateInfoStrings :: IO ()
unit_instanceCreateInfoStrings = do
  let x :: InstanceCreateInfo '[] =
        InstanceCreateInfo
          { next = Nil
          , flags = mempty
          , applicationInfo = Nothing
          , enabledLayerNames = V.fromList ["VK_LAYER_A", "VK_LAYER_B"]
          , enabledExtensionNames = V.singleton "VK_EXT_debug_utils"
          }
  x' <- roundtrip x
  assertEqual "layers" (V.fromList ["VK_LAYER_A", "VK_LAYER_B"]) x'.enabledLayerNames
  assertEqual "exts" (V.singleton "VK_EXT_debug_utils") x'.enabledExtensionNames

-- the generated wrapper maker allocates a callable FunPtr (and frees it)
unit_wrapperMakerAllocates :: IO ()
unit_wrapperMakerAllocates = do
  fp <- mkPFN_vkDebugUtilsMessengerCallbackEXT \_ _ _ _ -> pure FALSE
  assertBool "non-null wrapper" (fp /= nullFunPtr)
  freeHaskellFunPtr fp
