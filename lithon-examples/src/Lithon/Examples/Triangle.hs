{-# LANGUAGE TypeApplications #-}

-- | The phase-3 gate: render a triangle offscreen through the generated
-- binding — instance (validation layer enabled when present), Features2
-- chain readback, dynamic rendering, synchronization2 barriers,
-- copy-to-host — and hand back the raw RGBA pixels.
--
-- The walk deliberately exercises the design's load-bearing shapes:
-- 'withInstance'\/'withDevice'\/'withCommandBuffers' brackets (the
-- continuation receives the 'Outcome'), @'[]@-annotated es-polymorphic
-- queries, a 'DeviceCreateInfo' chain, 'SomeStruct' pipeline arrays, the
-- arrow-len 'allocateCommandBuffers', and raw @Ptr CommandBuffer_T@
-- members.
--
-- __No Haskell debug-utils messenger__: lithon imports commands @unsafe@
-- (by design — see the safe-list), and a @ccall wrapper@ callback firing
-- /during/ an unsafe call re-enters the RTS and deadlocks. Lavapipe's
-- non-conformance warning triggers exactly that at instance creation. The
-- validation layer's default stdout sink carries the diagnostics instead;
-- the gate script fails on any \"Validation Error\" in the output.
module Lithon.Examples.Triangle (
  TriangleFrame (..),
  renderTriangle,
) where

import Control.Monad (unless, when)
import Data.Bits (testBit)
import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Data.Vector qualified as V
import Data.Vector.Storable.Sized qualified as VSS
import Data.Word (Word64)
import Foreign.Ptr (castPtr)
import Lithon.Vk

import Lithon.Examples.Triangle.Shaders (fragSpv, spirvWords, vertSpv)

-- | One rendered frame. Validation diagnostics (when the layer is
-- present) go to stdout via the layer's default sink; the gate script
-- greps for them.
data TriangleFrame = TriangleFrame
  { width :: Int
  , height :: Int
  , rgba :: ByteString
  -- ^ Tightly packed RGBA8, row-major, top row first.
  }

validationLayer :: ByteString
validationLayer = "VK_LAYER_KHRONOS_validation"

-- | Render one @w@×@h@ frame. Fails (via 'expect', a precise
-- 'VulkanError') on any driver error.
renderTriangle :: Int -> Int -> IO TriangleFrame
renderTriangle w h = do
  -- opt into validation only when the layer is actually installed
  layers <- expect =<< enumerateInstanceLayerProperties
  let haveValidation = V.any (\l -> l.layerName == validationLayer) layers

  let appInfo =
        (nil @ApplicationInfo)
          { applicationName = Just "lithon-triangle"
          , apiVersion = let ApiVersion v = API_VERSION_1_3 in v
          }
      instanceInfo =
        InstanceCreateInfo
          { next = Nil
          , flags = mempty
          , applicationInfo = Just appInfo
          , enabledLayerNames = if haveValidation then V.singleton validationLayer else V.empty
          , enabledExtensionNames = V.empty
          }

  withInstance instanceInfo Nothing \instanceOutcome -> do
    inst <- expect instanceOutcome
    withDeviceOn inst
 where
  withDeviceOn inst = do
    physicalDevices <- expect =<< enumeratePhysicalDevices inst
    when (V.null physicalDevices) (fail "no Vulkan devices")

    -- pick the first device with a graphics queue family (the es-poly
    -- query at its no-chain instantiation)
    picks <- V.forM physicalDevices \pd -> do
      families <- getPhysicalDeviceQueueFamilyProperties2 @_ @'[] pd
      let gfx =
            V.findIndex
              (\qf -> qf.queueFamilyProperties.queueFlags `hasFlag` flag QueueGraphicsBit)
              families
      pure ((pd,) <$> gfx)
    (pd, gfxFamily) <- case V.mapMaybe id picks of
      v | V.null v -> fail "no graphics queue family on any device"
      v -> pure (V.head v)

    -- Features2 chain readback: assert the 1.3 features the pipeline needs
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
                        , queueFamilyIndex = fromIntegral gfxFamily
                        , queuePriorities = V.singleton 1.0
                        }
                  )
            , enabledLayerNames = V.empty
            , enabledExtensionNames = V.empty
            , enabledFeatures = Nothing
            }

    withDevice pd deviceInfo Nothing \deviceOutcome -> do
      device <- expect deviceOutcome
      queue <- getDeviceQueue device (fromIntegral gfxFamily) 0
      frame <- renderOn pd device queue
      _ <- deviceWaitIdle device
      pure frame

  renderOn pd device queue = do
    memProps2 <- getPhysicalDeviceMemoryProperties2 @_ @'[] pd
    let memProps = memProps2.memoryProperties

    -- offscreen color target
    image <-
      expect
        =<< createImage
          device
          ImageCreateInfo
            { next = Nil
            , flags = mempty
            , imageType = Known ImageType2D
            , format = Known FormatR8G8B8A8Unorm
            , extent = Extent3D{width = fromIntegral w, height = fromIntegral h, depth = 1}
            , mipLevels = 1
            , arrayLayers = 1
            , samples = flag SampleCount1Bit
            , tiling = Known ImageTilingOptimal
            , usage = flag ImageUsageColorAttachmentBit <> flag ImageUsageTransferSrcBit
            , sharingMode = SharingModeExclusive
            , queueFamilyIndices = V.empty
            , initialLayout = Known ImageLayoutUndefined
            }
          Nothing
    imageReq2 :: MemoryRequirements2 '[] <-
      getImageMemoryRequirements2 device ImageMemoryRequirementsInfo2{next = Nil, image}
    let imageReq = imageReq2.memoryRequirements
    imageMemory <-
      expect
        =<< allocateMemory
          device
          MemoryAllocateInfo
            { next = Nil
            , allocationSize = imageReq.size
            , memoryTypeIndex = pickMemoryType memProps imageReq.memoryTypeBits mempty
            }
          Nothing
    _ <- expect =<< bindImageMemory device image imageMemory 0

    view <-
      expect
        =<< createImageView
          device
          ImageViewCreateInfo
            { next = Nil
            , flags = mempty
            , image
            , viewType = ImageViewType2D
            , format = Known FormatR8G8B8A8Unorm
            , components = nil
            , subresourceRange = colorRange
            }
          Nothing

    -- host-visible readback buffer
    let byteSize = fromIntegral (w * h * 4) :: Word64
    buffer <-
      expect
        =<< createBuffer
          device
          BufferCreateInfo
            { next = Nil
            , flags = mempty
            , size = fromIntegral byteSize
            , usage = flag BufferUsageTransferDstBit
            , sharingMode = SharingModeExclusive
            , queueFamilyIndices = V.empty
            }
          Nothing
    bufferReq2 :: MemoryRequirements2 '[] <-
      getBufferMemoryRequirements2 device BufferMemoryRequirementsInfo2{buffer}
    let bufferReq = bufferReq2.memoryRequirements
    bufferMemory <-
      expect
        =<< allocateMemory
          device
          MemoryAllocateInfo
            { next = Nil
            , allocationSize = bufferReq.size
            , memoryTypeIndex =
                pickMemoryType
                  memProps
                  bufferReq.memoryTypeBits
                  (flag MemoryPropertyHostVisibleBit <> flag MemoryPropertyHostCoherentBit)
            }
          Nothing
    _ <- expect =<< bindBufferMemory device buffer bufferMemory 0

    -- shaders + pipeline
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
                  , colorAttachmentFormats = V.singleton (Known FormatR8G8B8A8Unorm)
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
                    , viewports = V.singleton staticViewport
                    , scissors = V.singleton fullRect
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
            , dynamicState = Nothing
            , layout
            , renderPass = nil
            , subpass = 0
            , basePipelineHandle = nil
            , basePipelineIndex = -1
            }
    pipelines <-
      expect
        =<< createGraphicsPipelines device nil (V.singleton (SomeStruct pipelineInfo)) Nothing
    let pipeline = V.head pipelines

    -- command buffer
    pool <-
      expect
        =<< createCommandPool
          device
          CommandPoolCreateInfo
            { flags = mempty
            , queueFamilyIndex = 0
            }
          Nothing

    frame <- withCommandBuffers
      device
      CommandBufferAllocateInfo
        { commandPool = pool
        , level = CommandBufferLevelPrimary
        , commandBufferCount = 1
        }
      \cbsOutcome -> do
        cbs <- expect cbsOutcome
        let cb = V.head cbs

        _ <-
          expect
            =<< beginCommandBuffer
              cb
              CommandBufferBeginInfo
                { next = Nil
                , flags = flag CommandBufferUsageOneTimeSubmitBit
                , inheritanceInfo = Nothing
                }

        -- UNDEFINED -> COLOR_ATTACHMENT_OPTIMAL
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
                    , clearValue =
                        ClearValueColor (ClearColorValueFloat32 (VSS.replicate 0))
                    }
            , depthAttachment = Nothing
            , stencilAttachment = Nothing
            }
        cmdBindPipeline cb PipelineBindPointGraphics pipeline
        cmdDraw cb 3 1 0 0
        cmdEndRendering cb

        -- COLOR_ATTACHMENT -> TRANSFER_SRC, then copy to the host buffer
        barrier2 cb image ImageLayoutColorAttachmentOptimal ImageLayoutTransferSrcOptimal
        cmdCopyImageToBuffer2
          cb
          CopyImageToBufferInfo2
            { srcImage = image
            , srcImageLayout = Known ImageLayoutTransferSrcOptimal
            , dstBuffer = buffer
            , regions =
                V.singleton
                  BufferImageCopy2
                    { bufferOffset = 0
                    , bufferRowLength = 0
                    , bufferImageHeight = 0
                    , imageSubresource = colorLayers
                    , imageOffset = nil
                    , imageExtent = Extent3D{width = fromIntegral w, height = fromIntegral h, depth = 1}
                    }
            }
        _ <- expect =<< endCommandBuffer cb

        fence <- expect =<< createFence device (nil :: FenceCreateInfo '[]) Nothing
        _ <-
          expect
            =<< queueSubmit2
              queue
              ( V.singleton
                  ( SomeStruct
                      ( SubmitInfo2
                          { next = Nil
                          , flags = mempty
                          , waitSemaphoreInfos = V.empty
                          , commandBufferInfos =
                              V.singleton
                                CommandBufferSubmitInfo
                                  { commandBuffer = cb.handle
                                  , deviceMask = 0
                                  }
                          , signalSemaphoreInfos = V.empty
                          }
                          :: SubmitInfo2 '[]
                      )
                  )
              )
              fence
        _ <- expect =<< waitForFences device (V.singleton fence) True maxBound

        -- read back
        mapped <- expect =<< mapMemory device bufferMemory 0 (fromIntegral byteSize) mempty
        bytes <- BS.packCStringLen (castPtr mapped, fromIntegral byteSize)
        unmapMemory device bufferMemory

        destroyFence device fence Nothing
        pure TriangleFrame{width = w, height = h, rgba = bytes}

    -- teardown (reverse order)
    destroyCommandPool device pool Nothing
    destroyPipeline device pipeline Nothing
    destroyPipelineLayout device layout Nothing
    destroyShaderModule device fragModule Nothing
    destroyShaderModule device vertModule Nothing
    destroyBuffer device buffer Nothing
    freeMemory device bufferMemory Nothing
    destroyImageView device view Nothing
    destroyImage device image Nothing
    freeMemory device imageMemory Nothing
    pure frame
   where
    fullRect =
      Rect2D
        { offset = nil
        , extent = Extent2D{width = fromIntegral w, height = fromIntegral h}
        }
    staticViewport =
      Viewport
        { x = 0
        , y = 0
        , width = fromIntegral w
        , height = fromIntegral h
        , minDepth = 0
        , maxDepth = 1
        }
    colorRange =
      ImageSubresourceRange
        { aspectMask = flag ImageAspectColorBit
        , baseMipLevel = 0
        , levelCount = 1
        , baseArrayLayer = 0
        , layerCount = 1
        }
    colorLayers =
      ImageSubresourceLayers
        { aspectMask = flag ImageAspectColorBit
        , mipLevel = 0
        , baseArrayLayer = 0
        , layerCount = 1
        }
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

  -- first memory type whose bit is allowed and whose flags cover the ask
  pickMemoryType memProps allowedBits wanted =
    let types = take (fromIntegral memProps.memoryTypeCount) (VSS.toList memProps.memoryTypes)
        ok (i, t) =
          testBit allowedBits i
            && (t.propertyFlags `hasFlag` wanted)
     in case filter ok (zip [0 ..] types) of
          ((i, _) : _) -> fromIntegral i
          [] -> error "no suitable memory type"
