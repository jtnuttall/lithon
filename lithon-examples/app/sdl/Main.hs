{-# LANGUAGE TypeApplications #-}

-- | The windowed swapchain triangle: SDL2 owns the window and mints the
-- @VkSurfaceKHR@; lithon does everything after — device selection with
-- a present-capable queue, @VK_KHR_swapchain@ over dynamic rendering,
-- synchronization2 submits, and out-of-date/suboptimal recreation.
--
-- The walk deliberately adds the WSI shapes the offscreen gate can't:
-- raw-handle interop at the SDL boundary ('SurfaceKHR' wraps SDL's
-- 'SDLVk.VkSurfaceKHR' @Word64@; @inst.handle@ crosses back the other
-- way), a swapchain rebuilt in place on resize, per-frame sync objects
-- (image-available semaphore + in-flight fence) against per-image
-- present semaphores, and dynamic viewport\/scissor — the pipeline
-- carries placeholder statics (absorbed counts can't express
-- count-with-NULL) that 'cmdSetViewport'\/'cmdSetScissor' override.
--
-- @--frames N@ exits after N presented frames — a headless smoke run:
-- @SDL_VIDEODRIVER=offscreen triangle-sdl --frames 60@ drives the whole
-- loop over @VK_EXT_headless_surface@ on lavapipe.
module Main (main) where

import Control.Exception (throwIO)
import Control.Monad (forM, forM_, unless, when)
import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Data.Maybe (fromMaybe)
import Data.Vector qualified as V
import Data.Vector.Storable.Sized qualified as VSS
import Data.Word (Word32)
import Foreign.Ptr (castPtr, nullPtr)
import Lithon.Vk
import SDL qualified
import SDL.Video.Vulkan qualified as SDLVk
import System.Environment (getArgs)

import Lithon.Examples.Triangle.Shaders (fragSpv, spirvWords, vertSpv)

validationLayer :: ByteString
validationLayer = "VK_LAYER_KHRONOS_validation"

framesInFlight :: Int
framesInFlight = 2

-- | One frame slot: the recording target and the sync pair that
-- throttles reuse. The present-wait semaphores live with the
-- swapchain instead — they are indexed by acquired image, not slot.
data FrameSlot = FrameSlot
  { commandBuffer :: CommandBuffer
  , imageAvailable :: Semaphore
  , inFlight :: Fence
  }

-- | Everything torn down and rebuilt on resize\/out-of-date.
data Swapchain = Swapchain
  { swapchain :: SwapchainKHR
  , extent :: Extent2D
  , views :: V.Vector ImageView
  , images :: V.Vector Image
  , renderFinished :: V.Vector Semaphore
  -- ^ One per swapchain image: present waits on the semaphore its
  -- image's submit signalled; a per-slot semaphore could be re-signalled
  -- while a previous present still waits on it.
  }

main :: IO ()
main = do
  frameBudget <- parseFrames <$> getArgs
  SDL.initialize [SDL.InitVideo]
  window <-
    SDL.createWindow
      "lithon triangle-sdl"
      SDL.defaultWindow
        { SDL.windowGraphicsContext = SDL.VulkanContext
        , SDL.windowInitialSize = SDL.V2 800 600
        , SDL.windowResizable = True
        }

  -- the platform surface extensions this window needs (plus
  -- VK_KHR_surface itself); they must be enabled on the instance
  surfaceExts <- traverse BS.packCString =<< SDLVk.vkGetInstanceExtensions window

  layers <- expect =<< enumerateInstanceLayerProperties
  let haveValidation = V.any (\l -> l.layerName == validationLayer) layers

  let appInfo =
        (nil @ApplicationInfo)
          { applicationName = Just "lithon-triangle-sdl"
          , apiVersion = let ApiVersion v = API_VERSION_1_3 in v
          }
      instanceInfo =
        InstanceCreateInfo
          { next = Nil
          , flags = mempty
          , applicationInfo = Just appInfo
          , enabledLayerNames = if haveValidation then V.singleton validationLayer else V.empty
          , enabledExtensionNames = V.fromList surfaceExts
          }

  withInstance instanceInfo Nothing \instanceOutcome -> do
    inst <- expect instanceOutcome

    -- SDL mints the surface against our instance's raw handle
    surface <- SurfaceKHR <$> SDLVk.vkCreateSurface window (castPtr inst.handle)

    (pd, gfxFamily) <- pickDevice inst surface

    feats2 <- getPhysicalDeviceFeatures2 @_ @'[PhysicalDeviceVulkan13Features] pd
    let vk13 :& Nil = feats2.next
    unless vk13.dynamicRendering (fail "device lacks dynamicRendering")
    unless vk13.synchronization2 (fail "device lacks synchronization2")

    let deviceInfo =
          DeviceCreateInfo
            { next =
                (nil @PhysicalDeviceVulkan13Features)
                  { dynamicRendering = True
                  , synchronization2 = True
                  }
                  :& Nil
            , flags = mempty
            , queueCreateInfos =
                V.singleton
                  ( SomeStruct
                      DeviceQueueCreateInfo
                        { next = Nil
                        , flags = mempty
                        , queueFamilyIndex = gfxFamily
                        , queuePriorities = V.singleton 1.0
                        }
                  )
            , enabledLayerNames = V.empty
            , enabledExtensionNames = V.singleton KHR_SWAPCHAIN_EXTENSION_NAME
            , enabledFeatures = Nothing
            }

    withDevice pd deviceInfo Nothing \deviceOutcome -> do
      device <- expect deviceOutcome
      queue <- getDeviceQueue device gfxFamily 0

      surfaceFormat <- pickSurfaceFormat pd surface
      (pipeline, layout, vertModule, fragModule) <- createPipeline device surfaceFormat

      pool <-
        expect
          =<< createCommandPool
            device
            CommandPoolCreateInfo
              { flags = flag CommandPoolCreateResetCommandBufferBit
              , queueFamilyIndex = gfxFamily
              }
            Nothing

      withCommandBuffers
        device
        CommandBufferAllocateInfo
          { commandPool = pool
          , level = CommandBufferLevelPrimary
          , commandBufferCount = fromIntegral framesInFlight
          }
        \cbsOutcome -> do
          cbs <- expect cbsOutcome
          slots <- forM (V.toList cbs) \cb -> do
            imageAvailable <- expect =<< createSemaphore device (nil :: SemaphoreCreateInfo '[]) Nothing
            inFlight <-
              expect
                =<< createFence
                  device
                  -- signalled so the first wait on each slot passes
                  (FenceCreateInfo{next = Nil, flags = flag FenceCreateSignaledBit} :: FenceCreateInfo '[])
                  Nothing
            pure FrameSlot{commandBuffer = cb, imageAvailable, inFlight}

          sc0 <- createSwapchain window pd device surface surfaceFormat nil
          scEnd <- renderLoop window pd device queue surface surfaceFormat pipeline slots sc0 frameBudget

          _ <- deviceWaitIdle device
          destroySwapchain device scEnd
          forM_ slots \slot -> do
            destroySemaphore device slot.imageAvailable Nothing
            destroyFence device slot.inFlight Nothing

      destroyCommandPool device pool Nothing
      destroyPipeline device pipeline Nothing
      destroyPipelineLayout device layout Nothing
      destroyShaderModule device fragModule Nothing
      destroyShaderModule device vertModule Nothing

    destroySurfaceKHR inst surface Nothing

  SDL.destroyWindow window
  SDL.quit
  putStrLn "triangle-sdl: clean exit"
 where
  parseFrames = \case
    ["--frames", n] | [(k, "")] <- reads n -> Just (k :: Int)
    _ -> Nothing

-- | First device with a queue family that is both graphics-capable and
-- present-capable on this surface (one queue keeps the demo simple;
-- split families exist in the wild but not on desktop parts).
pickDevice :: Instance -> SurfaceKHR -> IO (PhysicalDevice, Word32)
pickDevice inst surface = do
  physicalDevices <- expect =<< enumeratePhysicalDevices inst
  when (V.null physicalDevices) (fail "no Vulkan devices")
  picks <- V.forM physicalDevices \pd -> do
    families <- getPhysicalDeviceQueueFamilyProperties2 @_ @'[] pd
    supported <- V.generateM (V.length families) \i -> do
      canPresent <- expect =<< getPhysicalDeviceSurfaceSupportKHR pd (fromIntegral i) surface
      let qf = families V.! i
      pure (canPresent && qf.queueFamilyProperties.queueFlags `hasFlag` flag QueueGraphicsBit)
    pure ((pd,) . fromIntegral <$> V.findIndex id supported)
  case V.mapMaybe id picks of
    v | V.null v -> fail "no graphics+present queue family on any device"
    v -> pure (V.head v)

-- | Prefer non-linear sRGB in a straightforward format; otherwise take
-- whatever the surface offers first.
pickSurfaceFormat :: PhysicalDevice -> SurfaceKHR -> IO SurfaceFormatKHR
pickSurfaceFormat pd surface = do
  formats <- expect =<< getPhysicalDeviceSurfaceFormatsKHR pd surface
  when (V.null formats) (fail "surface reports no formats")
  let preferred f =
        (f.format == Known FormatB8G8R8A8Unorm || f.format == Known FormatR8G8B8A8Unorm)
          && f.colorSpace == Known ColorSpaceSrgbNonlinearKHR
  pure (fromMaybe (V.head formats) (V.find preferred formats))

-- | The same pipeline as the offscreen gate, retargeted at the surface
-- format and with viewport\/scissor dynamic so resizes don't touch it.
-- The static viewport entries are placeholders: dynamic state ignores
-- their values, and the marshaller derives the (still required) counts
-- from the vectors' lengths.
createPipeline
  :: Device -> SurfaceFormatKHR -> IO (Pipeline, PipelineLayout, ShaderModule, ShaderModule)
createPipeline device surfaceFormat = do
  vertModule <-
    expect
      =<< createShaderModule
        device
        ShaderModuleCreateInfo{flags = mempty, code = spirvWords vertSpv}
        Nothing
  fragModule <-
    expect
      =<< createShaderModule
        device
        ShaderModuleCreateInfo{flags = mempty, code = spirvWords fragSpv}
        Nothing
  layout <-
    expect
      =<< createPipelineLayout
        device
        PipelineLayoutCreateInfo
          { flags = mempty
          , setLayouts = V.empty
          , pushConstantRanges = V.empty
          }
        Nothing

  let stageInfo stageBit m =
        SomeStruct
          ( PipelineShaderStageCreateInfo
              { next = Nil
              , flags = mempty
              , stage = flag stageBit
              , module' = m
              , name = "main"
              , specializationInfo = Nothing
              }
              :: PipelineShaderStageCreateInfo '[]
          )
      pipelineInfo =
        GraphicsPipelineCreateInfo
          { next =
              PipelineRenderingCreateInfo
                { viewMask = 0
                , colorAttachmentFormats = V.singleton surfaceFormat.format
                , depthAttachmentFormat = Known FormatUndefined
                , stencilAttachmentFormat = Known FormatUndefined
                }
                :& Nil
          , flags = mempty
          , stages =
              V.fromList
                [ stageInfo ShaderStageVertexBit vertModule
                , stageInfo ShaderStageFragmentBit fragModule
                ]
          , vertexInputState = Just (SomeStruct (nil :: PipelineVertexInputStateCreateInfo '[]))
          , inputAssemblyState =
              Just
                nil{topology = PrimitiveTopologyTriangleList}
          , tessellationState = Nothing
          , viewportState =
              Just
                PipelineViewportStateCreateInfo
                  { flags = mempty
                  , viewports = V.singleton nil
                  , scissors = V.singleton nil
                  }
          , rasterizationState =
              Just
                ( SomeStruct
                    ( (nil :: PipelineRasterizationStateCreateInfo '[])
                        { polygonMode = PolygonModeFill
                        , cullMode = mempty
                        , frontFace = FrontFaceClockwise
                        , lineWidth = 1.0
                        }
                    )
                )
          , multisampleState =
              Just
                ( SomeStruct
                    ( PipelineMultisampleStateCreateInfo
                        { next = Nil
                        , flags = mempty
                        , rasterizationSamples = flag SampleCount1Bit
                        , sampleShadingEnable = False
                        , minSampleShading = 0
                        , sampleMask = V.empty
                        , alphaToCoverageEnable = False
                        , alphaToOneEnable = False
                        }
                        :: PipelineMultisampleStateCreateInfo '[]
                    )
                )
          , depthStencilState = Nothing
          , colorBlendState =
              Just
                ( SomeStruct
                    ( (nil :: PipelineColorBlendStateCreateInfo '[])
                        { attachments =
                            V.singleton
                              nil
                                { colorWriteMask =
                                    flag ColorComponentRBit
                                      <> flag ColorComponentGBit
                                      <> flag ColorComponentBBit
                                      <> flag ColorComponentABit
                                }
                        }
                    )
                )
          , dynamicState =
              Just
                PipelineDynamicStateCreateInfo
                  { flags = mempty
                  , dynamicStates = V.fromList [DynamicStateViewport, DynamicStateScissor]
                  }
          , layout
          , renderPass = nil
          , subpass = 0
          , basePipelineHandle = nil
          , basePipelineIndex = -1
          }
  pipelines <-
    expect
      =<< createGraphicsPipelines device nil (V.singleton (SomeStruct pipelineInfo)) Nothing
  pure (V.head pipelines, layout, vertModule, fragModule)

-- | Build the swapchain at the surface's current size, passing the
-- previous swapchain (or 'nil') so the driver can recycle it.
createSwapchain
  :: SDL.Window
  -> PhysicalDevice
  -> Device
  -> SurfaceKHR
  -> SurfaceFormatKHR
  -> SwapchainKHR
  -> IO Swapchain
createSwapchain window pd device surface surfaceFormat oldSwapchain = do
  caps <- expect =<< getPhysicalDeviceSurfaceCapabilitiesKHR pd surface
  extent <-
    if caps.currentExtent.width /= maxBound then
      pure caps.currentExtent
    else do
      -- the surface defers to the swapchain: clamp the drawable size
      SDL.V2 w h <- SDLVk.vkGetDrawableSize window
      let clamp lo hi = max lo . min hi
      pure
        Extent2D
          { width = clamp caps.minImageExtent.width caps.maxImageExtent.width (fromIntegral w)
          , height = clamp caps.minImageExtent.height caps.maxImageExtent.height (fromIntegral h)
          }
  let imageCount =
        let want = caps.minImageCount + 1
         in if caps.maxImageCount > 0 then min caps.maxImageCount want else want
  swapchain <-
    expect
      =<< createSwapchainKHR
        device
        SwapchainCreateInfoKHR
          { next = Nil
          , flags = mempty
          , surface
          , minImageCount = imageCount
          , imageFormat = surfaceFormat.format
          , imageColorSpace = surfaceFormat.colorSpace
          , imageExtent = extent
          , imageArrayLayers = 1
          , imageUsage = flag ImageUsageColorAttachmentBit
          , imageSharingMode = SharingModeExclusive
          , queueFamilyIndices = V.empty
          , preTransform = caps.currentTransform
          , compositeAlpha = flag CompositeAlphaOpaqueBitKHR
          , presentMode = Known PresentModeFifoKHR
          , clipped = True
          , oldSwapchain
          }
        Nothing
  images <- expect =<< getSwapchainImagesKHR device swapchain
  views <- V.forM images \image ->
    expect
      =<< createImageView
        device
        ImageViewCreateInfo
          { next = Nil
          , flags = mempty
          , image
          , viewType = ImageViewType2D
          , format = surfaceFormat.format
          , components = nil
          , subresourceRange = colorRange
          }
        Nothing
  renderFinished <- V.forM images \_ ->
    expect =<< createSemaphore device (nil :: SemaphoreCreateInfo '[]) Nothing
  pure Swapchain{swapchain, extent, views, images, renderFinished}

destroySwapchain :: Device -> Swapchain -> IO ()
destroySwapchain device sc = do
  V.forM_ sc.renderFinished \s -> destroySemaphore device s Nothing
  V.forM_ sc.views \v -> destroyImageView device v Nothing
  destroySwapchainKHR device sc.swapchain Nothing

-- | Tear down and rebuild after a resize (idle first: the old images
-- may still be in flight). The old handle is passed as @oldSwapchain@
-- and destroyed after the new one exists.
recreateSwapchain
  :: SDL.Window
  -> PhysicalDevice
  -> Device
  -> SurfaceKHR
  -> SurfaceFormatKHR
  -> Swapchain
  -> IO Swapchain
recreateSwapchain window pd device surface surfaceFormat old = do
  _ <- deviceWaitIdle device
  V.forM_ old.renderFinished \s -> destroySemaphore device s Nothing
  V.forM_ old.views \v -> destroyImageView device v Nothing
  fresh <- createSwapchain window pd device surface surfaceFormat old.swapchain
  destroySwapchainKHR device old.swapchain Nothing
  pure fresh

-- | Poll -> throttle -> acquire -> record -> submit -> present, recreating
-- the swapchain whenever acquire\/present says the surface moved on.
-- Returns the live swapchain so the caller can tear it down.
renderLoop
  :: SDL.Window
  -> PhysicalDevice
  -> Device
  -> Queue
  -> SurfaceKHR
  -> SurfaceFormatKHR
  -> Pipeline
  -> [FrameSlot]
  -> Swapchain
  -> Maybe Int
  -> IO Swapchain
renderLoop window pd device queue surface surfaceFormat pipeline slots = go 0
 where
  recreate = recreateSwapchain window pd device surface surfaceFormat

  go !frame sc budget
    | Just n <- budget, n <= 0 = pure sc
    | otherwise = do
        events <- SDL.pollEvents
        let wantsQuit = any (quitish . SDL.eventPayload) events
            resized = any (sizeChanged . SDL.eventPayload) events
        if wantsQuit then
          pure sc
        else do
          -- a minimized window has no extent to present to; idle until
          -- it comes back rather than spinning zero-sized recreates
          SDL.V2 dw dh <- SDLVk.vkGetDrawableSize window
          if dw == 0 || dh == 0 then do
            SDL.delay 16
            go frame sc budget
          else do
            let slot = slots !! (frame `mod` framesInFlight)
            _ <- expect =<< waitForFences device (V.singleton slot.inFlight) True maxBound
            acquired <-
              acquireNextImageKHR device sc.swapchain maxBound slot.imageAvailable nil
            case acquired of
              Err (Known ErrorOutOfDateKHR) -> do
                sc' <- recreate sc
                go frame sc' budget
              outcome -> do
                -- the payload is Nothing only on TIMEOUT/NOT_READY, which an
                -- infinite-timeout acquire never returns — but the type keeps
                -- the handling honest instead of peeking a guess
                imageIndex <-
                  maybe
                    (throwIO (userError "acquireNextImageKHR: no image with an infinite timeout"))
                    pure
                    =<< expect outcome
                _ <- expect =<< resetFences device (V.singleton slot.inFlight)
                recordFrame slot sc imageIndex
                submitFrame slot sc imageIndex
                presented <- presentFrame sc imageIndex
                let stale =
                      resized
                        || presented == Known SuboptimalKHR
                        || presented == Known ErrorOutOfDateKHR
                sc' <- if stale then recreate sc else pure sc
                go (frame + 1) sc' (subtract 1 <$> budget)

  quitish = \case
    SDL.QuitEvent -> True
    SDL.WindowClosedEvent _ -> True
    SDL.KeyboardEvent ke ->
      SDL.keyboardEventKeyMotion ke == SDL.Pressed
        && SDL.keysymKeycode (SDL.keyboardEventKeysym ke) == SDL.KeycodeEscape
    _ -> False

  sizeChanged = \case
    SDL.WindowSizeChangedEvent _ -> True
    _ -> False

  recordFrame slot sc imageIndex = do
    let cb = slot.commandBuffer
        image = sc.images V.! fromIntegral imageIndex
        view = sc.views V.! fromIntegral imageIndex
        fullRect = Rect2D{offset = nil, extent = sc.extent}
    _ <-
      expect
        =<< beginCommandBuffer
          cb
          CommandBufferBeginInfo
            { next = Nil
            , flags = flag CommandBufferUsageOneTimeSubmitBit
            , inheritanceInfo = Nothing
            }

    barrier2 cb image ImageLayoutUndefined ImageLayoutColorAttachmentOptimal
    cmdBeginRendering
      cb
      RenderingInfo
        { next = Nil
        , flags = mempty
        , renderArea = fullRect
        , layerCount = 1
        , viewMask = 0
        , colorAttachments =
            V.singleton
              RenderingAttachmentInfo
                { imageView = view
                , imageLayout = Known ImageLayoutColorAttachmentOptimal
                , resolveMode = mempty
                , resolveImageView = nil
                , resolveImageLayout = Known ImageLayoutUndefined
                , loadOp = AttachmentLoadOpClear
                , storeOp = AttachmentStoreOpStore
                , clearValue = ClearValueColor (ClearColorValueFloat32 (VSS.replicate 0))
                }
        , depthAttachment = Nothing
        , stencilAttachment = Nothing
        }
    cmdBindPipeline cb PipelineBindPointGraphics pipeline
    cmdSetViewport
      cb
      0
      ( V.singleton
          Viewport
            { x = 0
            , y = 0
            , width = fromIntegral sc.extent.width
            , height = fromIntegral sc.extent.height
            , minDepth = 0
            , maxDepth = 1
            }
      )
    cmdSetScissor cb 0 (V.singleton fullRect)
    cmdDraw cb 3 1 0 0
    cmdEndRendering cb
    barrier2 cb image ImageLayoutColorAttachmentOptimal ImageLayoutPresentSrcKHR
    _ <- expect =<< endCommandBuffer cb
    pure ()

  submitFrame slot sc imageIndex = do
    _ <-
      expect
        =<< queueSubmit2
          queue
          ( V.singleton
              ( SomeStruct
                  ( SubmitInfo2
                      { next = Nil
                      , flags = mempty
                      , waitSemaphoreInfos =
                          V.singleton
                            SemaphoreSubmitInfo
                              { semaphore = slot.imageAvailable
                              , value = 0
                              , stageMask = flag PipelineStage2ColorAttachmentOutputBit
                              , deviceIndex = 0
                              }
                      , commandBufferInfos =
                          V.singleton
                            CommandBufferSubmitInfo
                              { commandBuffer = slot.commandBuffer.handle
                              , deviceMask = 0
                              }
                      , signalSemaphoreInfos =
                          V.singleton
                            SemaphoreSubmitInfo
                              { semaphore = sc.renderFinished V.! fromIntegral imageIndex
                              , value = 0
                              , stageMask = flag PipelineStage2AllCommandsBit
                              , deviceIndex = 0
                              }
                      }
                      :: SubmitInfo2 '[]
                  )
              )
          )
          slot.inFlight
    pure ()

  -- out-of-date is a recreate signal, not a failure: hand the code back
  presentFrame sc imageIndex = do
    outcome <-
      queuePresentKHR
        queue
        ( PresentInfoKHR
            { next = Nil
            , waitSemaphores = V.singleton (sc.renderFinished V.! fromIntegral imageIndex)
            , swapchains = V.singleton sc.swapchain
            , imageIndices = V.singleton imageIndex
            , pResults = nullPtr
            }
            :: PresentInfoKHR '[]
        )
    case outcome of
      Ok r () -> pure r
      Err r
        | r == Known ErrorOutOfDateKHR -> pure r
        | otherwise -> expect (Err r)

  barrier2 cb image from to =
    cmdPipelineBarrier2
      cb
      DependencyInfo
        { next = Nil
        , dependencyFlags = mempty
        , memoryBarriers = V.empty
        , bufferMemoryBarriers = V.empty
        , imageMemoryBarriers =
            V.singleton
              ( SomeStruct
                  ( ImageMemoryBarrier2
                      { next = Nil
                      , srcStageMask = flag PipelineStage2AllCommandsBit
                      , srcAccessMask = flag Access2MemoryWriteBit
                      , dstStageMask = flag PipelineStage2AllCommandsBit
                      , dstAccessMask = flag Access2MemoryReadBit <> flag Access2MemoryWriteBit
                      , oldLayout = Known from
                      , newLayout = Known to
                      , srcQueueFamilyIndex = QUEUE_FAMILY_IGNORED
                      , dstQueueFamilyIndex = QUEUE_FAMILY_IGNORED
                      , image
                      , subresourceRange = colorRange
                      }
                      :: ImageMemoryBarrier2 '[]
                  )
              )
        }

colorRange :: ImageSubresourceRange
colorRange =
  ImageSubresourceRange
    { aspectMask = flag ImageAspectColorBit
    , baseMipLevel = 0
    , levelCount = 1
    , baseArrayLayer = 0
    , layerCount = 1
    }
