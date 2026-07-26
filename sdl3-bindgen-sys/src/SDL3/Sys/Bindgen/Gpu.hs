{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | The GPU API offers a cross-platform way for apps to talk to modern graphics hardware. It offers both 3D graphics and compute support, in the style of Metal, Vulkan, and Direct3D 12.
--
--     A basic workflow might be something like this:
--
--     The app creates a GPU device with @SDL_CreateGPUDevice()@, and assigns it to a window with @SDL_ClaimWindowForGPUDevice()@ although strictly speaking you can render offscreen entirely, perhaps for image processing, and not use a window at all.
--
--     Next, the app prepares static data (things that are created once and used over and over). For example:
--
--     * Shaders (programs that run on the GPU): use @SDL_CreateGPUShader()@.
--
--     * Vertex buffers (arrays of geometry data) and other rendering data: use @SDL_CreateGPUBuffer()@ and @SDL_UploadToGPUBuffer()@.
--
--     * Textures (images): use @SDL_CreateGPUTexture()@ and @SDL_UploadToGPUTexture()@.
--
--     * Samplers (how textures should be read from): use @SDL_CreateGPUSampler()@.
--
--     * Render pipelines (precalculated rendering state): use @SDL_CreateGPUGraphicsPipeline()@
--
--     To render, the app creates one or more command buffers, with @SDL_AcquireGPUCommandBuffer()@. Command buffers collect rendering instructions that will be submitted to the GPU in batch. Complex scenes can use multiple command buffers, maybe configured across multiple threads in parallel, as long as they are submitted in the correct order, but many apps will just need one command buffer per frame.
--
--     Rendering can happen to a texture (what other APIs call a \"render target\") or it can happen to the swapchain texture (which is just a special texture that represents a window\'s contents). The app can use @SDL_WaitAndAcquireGPUSwapchainTexture()@ to render to the window.
--
--     Rendering actually happens in a Render Pass, which is encoded into a command buffer. One can encode multiple render passes (or alternate between render and compute passes) in a single command buffer, but many apps might simply need a single render pass in a single command buffer. Render Passes can render to up to four color textures and one depth texture simultaneously. If the set of textures being rendered to needs to change, the Render Pass must be ended and a new one must be begun.
--
--     The app calls @SDL_BeginGPURenderPass()@. Then it sets states it needs for each draw:
--
--     * @SDL_BindGPUGraphicsPipeline()@
--
--     * @SDL_SetGPUViewport()@
--
--     * @SDL_BindGPUVertexBuffers()@
--
--     * @SDL_BindGPUVertexSamplers()@
--
--     * etc
--
--     Then, make the actual draw commands with these states:
--
--     * @SDL_DrawGPUPrimitives()@
--
--     * @SDL_DrawGPUPrimitivesIndirect()@
--
--     * @SDL_DrawGPUIndexedPrimitivesIndirect()@
--
--     * etc
--
--     After all the drawing commands for a pass are complete, the app should call @SDL_EndGPURenderPass()@. Once a render pass ends all render-related state is reset.
--
--     The app can begin new Render Passes and make new draws in the same command buffer until the entire scene is rendered.
--
--     Once all of the render commands for the scene are complete, the app calls @SDL_SubmitGPUCommandBuffer()@ to send it to the GPU for processing.
--
--     If the app needs to read back data from texture or buffers, the API has an efficient way of doing this, provided that the app is willing to tolerate some latency. When the app uses @SDL_DownloadFromGPUTexture()@ or @SDL_DownloadFromGPUBuffer()@, submitting the command buffer with @SDL_SubmitGPUCommandBufferAndAcquireFence()@ will return a fence handle that the app can poll or wait on in a thread. Once the fence indicates that the command buffer is done processing, it is safe to read the downloaded data. Make sure to call @SDL_ReleaseGPUFence()@ when done with the fence.
--
--     The API also has \"compute\" support. The app calls @SDL_BeginGPUComputePass()@ with compute-writeable textures and\/or buffers, which can be written to in a compute shader. Then it sets states it needs for the compute dispatches:
--
--     * @SDL_BindGPUComputePipeline()@
--
--     * @SDL_BindGPUComputeStorageBuffers()@
--
--     * @SDL_BindGPUComputeStorageTextures()@
--
--     Then, dispatch compute work:
--
--     * @SDL_DispatchGPUCompute()@
--
--     For advanced users, this opens up powerful GPU-driven workflows.
--
--     Graphics and compute pipelines require the use of shaders, which as mentioned above are small programs executed on the GPU. Each backend (Vulkan, Metal, D3D12) requires a different shader format. When the app creates the GPU device, the app lets the device know which shader formats the app can provide. It will then select the appropriate backend depending on the available shader formats and the backends available on the platform. When creating shaders, the app must provide the correct shader format for the selected backend. If you would like to learn more about why the API works this way, there is a detailed [blog post](https://moonside.games/posts/layers-all-the-way-down/) explaining this situation.
--
--     It is optimal for apps to pre-compile the shader formats they might use, but for ease of use SDL provides a separate project, [SDL_shadercross](https://github.com/libsdl-org/SDL_shadercross), for performing runtime shader cross-compilation. It also has a CLI interface for offline precompilation as well.
--
--     This is an extremely quick overview that leaves out several important details. Already, though, one can see that GPU programming can be quite complex! If you just need simple 2D graphics, the [Render API](https://wiki.libsdl.org/SDL3/CategoryRender) is much easier to use but still hardware-accelerated. That said, even for 2D applications the performance benefits and expressiveness of the GPU API are significant.
--
--     The GPU API targets a feature set with a wide range of hardware support and ease of portability. It is designed so that the app won\'t have to branch itself by querying feature support. If you need cutting-edge features with limited hardware support, this API is probably not for you.
--
--     Examples demonstrating proper usage of this API can be found [here](https://github.com/TheSpydog/SDL_gpu_examples)
--
--     Performance considerations
--
--     Here are some basic tips for maximizing your rendering performance.
--
--     * Beginning a new render pass is relatively expensive. Use as few render passes as you can.
--
--     * Minimize the amount of state changes. For example, binding a pipeline is relatively cheap, but doing it hundreds of times when you don\'t need to will slow the performance significantly.
--
--     * Perform your data uploads as early as possible in the frame.
--
--     * Don\'t churn resources. Creating and releasing resources is expensive. It\'s better to create what you need up front and cache it.
--
--     * Don\'t use uniform buffers for large amounts of data (more than a matrix or so). Use a storage buffer instead.
--
--     * Use cycling correctly. There is a detailed explanation of cycling further below.
--
--     * Use culling techniques to minimize pixel writes. The less writing the GPU has to do the better. Culling can be a very advanced topic but even simple culling techniques can boost performance significantly.
--
--     In general try to remember the golden rule of performance: doing things is more expensive than not doing things. Don\'t Touch The Driver!
--
--     FAQ
--
--     __Question: When are you adding more advanced features, like ray tracing or mesh shaders?__
--
--     Answer: We don\'t have immediate plans to add more bleeding-edge features, but we certainly might in the future, when these features prove worthwhile, and reasonable to implement across several platforms and underlying APIs. So while these things are not in the \"never\" category, they are definitely not \"near future\" items either.
--
--     __Question: Why is my shader not working?__
--
--     Answer: A common oversight when using shaders is not properly laying out the shader resources\/registers correctly. The GPU API is very strict with how it wants resources to be laid out and it\'s difficult for the API to automatically validate shaders to see if they have a compatible layout. See the documentation for @SDL_CreateGPUShader()@ and @SDL_CreateGPUComputePipeline()@ for information on the expected layout.
--
--     Another common issue is not setting the correct number of samplers, textures, and buffers in 'SDL_GPUShaderCreateInfo'. If possible use shader reflection to extract the required information from the shader automatically instead of manually filling in the struct\'s values.
--
--     __Question: My application isn\'t performing very well. Is this the GPU API\'s fault?__
--
--     Answer: No. Long answer: The GPU API is a relatively thin layer over the underlying graphics API. While it\'s possible that we have done something inefficiently, it\'s very unlikely especially if you are relatively inexperienced with GPU rendering. Please see the performance tips above and make sure you are following them. Additionally, tools like [RenderDoc](https://renderdoc.org/) can be very helpful for diagnosing incorrect behavior and performance issues.
--
--     System Requirements
--
--     Vulkan
--
--     SDL driver name: \"vulkan\" (for use in @SDL_CreateGPUDevice()@ and SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING)
--
--     Supported on Windows, Linux, Nintendo Switch, and certain Android devices. Requires Vulkan 1.0 with the following extensions and device features:
--
--     * @VK_KHR_swapchain@
--
--     * @VK_KHR_maintenance1@
--
--     * @independentBlend@
--
--     * @imageCubeArray@
--
--     * @depthClamp@
--
--     * @shaderClipDistance@
--
--     * @drawIndirectFirstInstance@
--
--     * @sampleRateShading@
--
--     You can remove some of these requirements to increase compatibility with Android devices by using these properties when creating the GPU device with @SDL_CreateGPUDeviceWithProperties()@:
--
--     * SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN
--
--     * SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN
--
--     * SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN
--
--     * SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN
--
--     D3D12
--
--     SDL driver name: \"direct3d12\"
--
--     Supported on Windows 10 or newer, Xbox One (GDK), and Xbox Series X|S (GDK). Requires a GPU that supports DirectX 12 Feature Level 11_0 and Resource Binding Tier 2 or above.
--
--     You can remove the Tier 2 resource binding requirement to support Intel Haswell and Broadwell GPUs by using this property when creating the GPU device with @SDL_CreateGPUDeviceWithProperties()@:
--
--     * SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN
--
--     Metal
--
--     SDL driver name: \"metal\"
--
--     Supported on macOS 10.14+ and iOS\/tvOS 13.0+. Hardware requirements vary by operating system:
--
--     * macOS requires an Apple Silicon or [Intel Mac2 family](https://developer.apple.com/documentation/metal/mtlfeatureset/mtlfeatureset_macos_gpufamily2_v1?language=objc) GPU
--
--     * iOS\/tvOS requires an A9 GPU or newer
--
--     * iOS Simulator and tvOS Simulator are unsupported
--
--     Coordinate System
--
--     The GPU API uses a left-handed coordinate system, following the convention of D3D12 and Metal. Specifically:
--
--     * __Normalized Device Coordinates:__ The lower-left corner has an x,y coordinate of @(-1.0, -1.0)@. The upper-right corner is @(1.0, 1.0)@. Z values range from @[0.0, 1.0]@ where 0 is the near plane.
--
--     * __Viewport Coordinates:__ The top-left corner has an x,y coordinate of @(0, 0)@ and extends to the bottom-right corner at @(viewportWidth, viewportHeight)@. +Y is down.
--
--     * __Texture Coordinates:__ The top-left corner has an x,y coordinate of @(0, 0)@ and extends to the bottom-right corner at @(1.0, 1.0)@. +Y is down.
--
--     If the backend driver differs from this convention (e.g. Vulkan, which has an NDC that assumes +Y is down), SDL will automatically convert the coordinate system behind the scenes, so you don\'t need to perform any coordinate flipping logic in your shaders.
--
--     Uniform Data
--
--     Uniforms are for passing data to shaders. The uniform data will be constant across all executions of the shader.
--
--     There are 4 available uniform slots per shader stage (where the stages are vertex, fragment, and compute). Uniform data pushed to a slot on a stage keeps its value throughout the command buffer until you call the relevant Push function on that slot again.
--
--     For example, you could write your vertex shaders to read a camera matrix from uniform binding slot 0, push the camera matrix at the start of the command buffer, and that data will be used for every subsequent draw call.
--
--     It is valid to push uniform data during a render or compute pass.
--
--     Uniforms are best for pushing small amounts of data. If you are pushing more than a matrix or two per call you should consider using a storage buffer instead.
--
--     A Note On Cycling
--
--     When using a command buffer, operations do not occur immediately - they occur some time after the command buffer is submitted.
--
--     When a resource is used in a pending or active command buffer, it is considered to be \"bound\". When a resource is no longer used in any pending or active command buffers, it is considered to be \"unbound\".
--
--     If data resources are bound, it is unspecified when that data will be unbound unless you acquire a fence when submitting the command buffer and wait on it. However, this doesn\'t mean you need to track resource usage manually.
--
--     All of the functions and structs that involve writing to a resource have a \"cycle\" bool. 'SDL_GPUTransferBuffer', 'SDL_GPUBuffer', and 'SDL_GPUTexture' all effectively function as ring buffers on internal resources. When cycle is true, if the resource is bound, the cycle rotates to the next unbound internal resource, or if none are available, a new one is created. This means you don\'t have to worry about complex state tracking and synchronization as long as cycling is correctly employed.
--
--     For example: you can call @SDL_MapGPUTransferBuffer()@, write texture data, @SDL_UnmapGPUTransferBuffer()@, and then @SDL_UploadToGPUTexture()@. The next time you write texture data to the transfer buffer, if you set the cycle param to true, you don\'t have to worry about overwriting any data that is not yet uploaded.
--
--     Another example: If you are using a texture in a render pass every frame, this can cause a data dependency between frames. If you set cycle to true in the 'SDL_GPUColorTargetInfo' struct, you can prevent this data dependency.
--
--     Cycling will never undefine already bound data. When cycling, all data in the resource is considered to be undefined for subsequent commands until that data is written again. You must take care not to read undefined data.
--
--     Note that when cycling a texture, the entire texture will be cycled, even if only part of the texture is used in the call, so you must consider the entire texture to contain undefined data after cycling.
--
--     You must also take care not to overwrite a section of data that has been referenced in a command without cycling first. It is OK to overwrite unreferenced data in a bound resource without cycling, but overwriting a section of data that has already been referenced will produce unexpected results.
--
--     Debugging
--
--     At some point of your GPU journey, you will probably encounter issues that are not traceable with regular debugger - for example, your code compiles but you get an empty screen, or your shader fails in runtime.
--
--     For debugging such cases, there are tools that allow visually inspecting the whole GPU frame, every drawcall, every bound resource, memory buffers, etc. They are the following, per platform:
--
--     * For Windows\/Linux, use [RenderDoc](https://renderdoc.org/)
--
--     * For MacOS (Metal), use Xcode built-in debugger (Open XCode, go to Debug > Debug Executable..., select your application, set \"GPU Frame Capture\" to \"Metal\" in scheme \"Options\" window, run your app, and click the small Metal icon on the bottom to capture a frame)
--
--     Aside from that, you may want to enable additional debug layers to receive more detailed error messages, based on your GPU backend:
--
--     * For D3D12, the debug layer is an optional feature that can be installed via \"Windows Settings -> System -> Optional features\" and adding the \"Graphics Tools\" optional feature.
--
--     * For Vulkan, you will need to install Vulkan SDK on Windows, and on Linux, you usually have some sort of @vulkan-validation-layers@ system package that should be installed.
--
--     * For Metal, it should be enough just to run the application from XCode to receive detailed errors or warnings in the output.
--
--     Don\'t hesitate to use tools as RenderDoc when encountering runtime issues or unexpected output on screen, quick GPU frame inspection can usually help you fix the majority of such problems. An opaque handle representing the SDL_GPU context.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Gpu (
  SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBuffer,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTransferBuffer,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTexture,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUSampler,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUShader,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUComputePipeline,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUGraphicsPipeline,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUCommandBuffer,
  SDL3.Sys.Bindgen.Gpu.SDL_GPURenderPass,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUComputePass,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUCopyPass,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUFence,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUPrimitiveType (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_PRIMITIVETYPE_TRIANGLELIST,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_PRIMITIVETYPE_LINELIST,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_PRIMITIVETYPE_LINESTRIP,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_PRIMITIVETYPE_POINTLIST,
  SDL3.Sys.Bindgen.Gpu.SDL_GPULoadOp (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_LOADOP_LOAD,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_LOADOP_CLEAR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_LOADOP_DONT_CARE,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUStoreOp (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STOREOP_STORE,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STOREOP_DONT_CARE,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STOREOP_RESOLVE,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STOREOP_RESOLVE_AND_STORE,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUIndexElementSize (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_INDEXELEMENTSIZE_16BIT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_INDEXELEMENTSIZE_32BIT,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureFormat (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_INVALID,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_A8_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8G8_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8_SNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8G8_SNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16_SNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16_SNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R32_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8G8_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R32_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R32G32_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8G8_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R32_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R32G32_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_D16_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_D24_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_D32_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureUsageFlags (..),
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_TEXTUREUSAGE_SAMPLER,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_TEXTUREUSAGE_COLOR_TARGET,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureType (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTURETYPE_2D,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTURETYPE_2D_ARRAY,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTURETYPE_3D,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTURETYPE_CUBE,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TEXTURETYPE_CUBE_ARRAY,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUSampleCount (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SAMPLECOUNT_1,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SAMPLECOUNT_2,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SAMPLECOUNT_4,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SAMPLECOUNT_8,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUCubeMapFace (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_CUBEMAPFACE_POSITIVEX,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_CUBEMAPFACE_NEGATIVEX,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_CUBEMAPFACE_POSITIVEY,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_CUBEMAPFACE_NEGATIVEY,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_CUBEMAPFACE_POSITIVEZ,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_CUBEMAPFACE_NEGATIVEZ,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBufferUsageFlags (..),
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_BUFFERUSAGE_VERTEX,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_BUFFERUSAGE_INDEX,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_BUFFERUSAGE_INDIRECT,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTransferBufferUsage (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUShaderStage (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SHADERSTAGE_VERTEX,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SHADERSTAGE_FRAGMENT,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUShaderFormat (..),
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_SHADERFORMAT_INVALID,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_SHADERFORMAT_PRIVATE,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_SHADERFORMAT_SPIRV,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_SHADERFORMAT_DXBC,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_SHADERFORMAT_DXIL,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_SHADERFORMAT_MSL,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_SHADERFORMAT_METALLIB,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUVertexElementFormat (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_INVALID,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_INT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_INT2,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_INT3,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_INT4,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_UINT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_UINT2,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_UINT3,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_UINT4,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_FLOAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_BYTE2,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_BYTE4,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_SHORT2,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_SHORT4,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_USHORT2,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_USHORT4,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_HALF2,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXELEMENTFORMAT_HALF4,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUVertexInputRate (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXINPUTRATE_VERTEX,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_VERTEXINPUTRATE_INSTANCE,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUFillMode (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_FILLMODE_FILL,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_FILLMODE_LINE,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUCullMode (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_CULLMODE_NONE,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_CULLMODE_FRONT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_CULLMODE_BACK,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUFrontFace (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_FRONTFACE_CLOCKWISE,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUCompareOp (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_COMPAREOP_INVALID,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_COMPAREOP_NEVER,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_COMPAREOP_LESS,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_COMPAREOP_EQUAL,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_COMPAREOP_LESS_OR_EQUAL,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_COMPAREOP_GREATER,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_COMPAREOP_NOT_EQUAL,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_COMPAREOP_GREATER_OR_EQUAL,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_COMPAREOP_ALWAYS,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUStencilOp (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STENCILOP_INVALID,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STENCILOP_KEEP,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STENCILOP_ZERO,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STENCILOP_REPLACE,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STENCILOP_INVERT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STENCILOP_INCREMENT_AND_WRAP,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_STENCILOP_DECREMENT_AND_WRAP,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBlendOp (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDOP_INVALID,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDOP_ADD,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDOP_SUBTRACT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDOP_REVERSE_SUBTRACT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDOP_MIN,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDOP_MAX,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBlendFactor (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_INVALID,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_ZERO,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_ONE,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_SRC_COLOR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_DST_COLOR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_SRC_ALPHA,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_DST_ALPHA,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_CONSTANT_COLOR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUColorComponentFlags (..),
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_COLORCOMPONENT_R,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_COLORCOMPONENT_G,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_COLORCOMPONENT_B,
  SDL3.Sys.Bindgen.Gpu.sDL_GPU_COLORCOMPONENT_A,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUFilter (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_FILTER_NEAREST,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_FILTER_LINEAR,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUSamplerMipmapMode (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SAMPLERMIPMAPMODE_NEAREST,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SAMPLERMIPMAPMODE_LINEAR,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUSamplerAddressMode (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SAMPLERADDRESSMODE_REPEAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUPresentMode (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_PRESENTMODE_VSYNC,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_PRESENTMODE_IMMEDIATE,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_PRESENTMODE_MAILBOX,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUSwapchainComposition (..),
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SWAPCHAINCOMPOSITION_SDR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR,
  pattern SDL3.Sys.Bindgen.Gpu.SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUViewport (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureTransferInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTransferBufferLocation (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureLocation (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureRegion (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBlitRegion (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBufferLocation (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBufferRegion (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUIndirectDrawCommand (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUIndexedIndirectDrawCommand (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUIndirectDispatchCommand (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUSamplerCreateInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUVertexBufferDescription (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUVertexAttribute (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUVertexInputState (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUStencilOpState (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUColorTargetBlendState (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUShaderCreateInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureCreateInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBufferCreateInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTransferBufferCreateInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPURasterizerState (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUMultisampleState (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUDepthStencilState (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUColorTargetDescription (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUGraphicsPipelineTargetInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUGraphicsPipelineCreateInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUComputePipelineCreateInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUColorTargetInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUDepthStencilTargetInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBlitInfo (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUBufferBinding (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUTextureSamplerBinding (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUStorageBufferReadWriteBinding (..),
  SDL3.Sys.Bindgen.Gpu.SDL_GPUStorageTextureReadWriteBinding (..),
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN,
  SDL3.Sys.Bindgen.Gpu.SDL_GPUVulkanOptions (..),
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_SHADER_CREATE_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_BUFFER_CREATE_NAME_STRING,
  SDL3.Sys.Bindgen.Gpu.sDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING,
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified

-- | [C declaration]: @struct SDL_GPUDevice@, defined at @SDL3\/SDL_gpu.h 411:16@
data SDL_GPUDevice

-- | An opaque handle representing a buffer.
--
--     Used for vertices, indices, indirect draw commands, and general compute data.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUBuffer', 'sDL_UploadToGPUBuffer', 'sDL_DownloadFromGPUBuffer', 'sDL_CopyGPUBufferToBuffer', 'sDL_BindGPUVertexBuffers', 'sDL_BindGPUIndexBuffer', 'sDL_BindGPUVertexStorageBuffers', 'sDL_BindGPUFragmentStorageBuffers', 'sDL_DrawGPUPrimitivesIndirect', 'sDL_DrawGPUIndexedPrimitivesIndirect', 'sDL_BindGPUComputeStorageBuffers', 'sDL_DispatchGPUComputeIndirect', 'sDL_ReleaseGPUBuffer'
--
--     [C declaration]: @struct SDL_GPUBuffer@, defined at @SDL3\/SDL_gpu.h 435:16@
data SDL_GPUBuffer

-- | An opaque handle representing a transfer buffer.
--
--     Used for transferring data to and from the device.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTransferBuffer', 'sDL_MapGPUTransferBuffer', 'sDL_UnmapGPUTransferBuffer', 'sDL_UploadToGPUBuffer', 'sDL_UploadToGPUTexture', 'sDL_DownloadFromGPUBuffer', 'sDL_DownloadFromGPUTexture', 'sDL_ReleaseGPUTransferBuffer'
--
--     [C declaration]: @struct SDL_GPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 453:16@
data SDL_GPUTransferBuffer

-- | An opaque handle representing a texture.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTexture', 'sDL_UploadToGPUTexture', 'sDL_DownloadFromGPUTexture', 'sDL_CopyGPUTextureToTexture', 'sDL_BindGPUVertexSamplers', 'sDL_BindGPUVertexStorageTextures', 'sDL_BindGPUFragmentSamplers', 'sDL_BindGPUFragmentStorageTextures', 'sDL_BindGPUComputeStorageTextures', 'sDL_GenerateMipmapsForGPUTexture', 'sDL_BlitGPUTexture', 'sDL_ReleaseGPUTexture'
--
--     [C declaration]: @struct SDL_GPUTexture@, defined at @SDL3\/SDL_gpu.h 473:16@
data SDL_GPUTexture

-- | An opaque handle representing a sampler.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUSampler', 'sDL_BindGPUVertexSamplers', 'sDL_BindGPUFragmentSamplers', 'sDL_ReleaseGPUSampler'
--
--     [C declaration]: @struct SDL_GPUSampler@, defined at @SDL3\/SDL_gpu.h 485:16@
data SDL_GPUSampler

-- | An opaque handle representing a compiled shader object.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader', 'sDL_CreateGPUGraphicsPipeline', 'sDL_ReleaseGPUShader'
--
--     [C declaration]: @struct SDL_GPUShader@, defined at @SDL3\/SDL_gpu.h 496:16@
data SDL_GPUShader

-- | An opaque handle representing a compute pipeline.
--
--     Used during compute passes.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUComputePipeline', 'sDL_BindGPUComputePipeline', 'sDL_ReleaseGPUComputePipeline'
--
--     [C declaration]: @struct SDL_GPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 509:16@
data SDL_GPUComputePipeline

-- | An opaque handle representing a graphics pipeline.
--
--     Used during render passes.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline', 'sDL_BindGPUGraphicsPipeline', 'sDL_ReleaseGPUGraphicsPipeline'
--
--     [C declaration]: @struct SDL_GPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 522:16@
data SDL_GPUGraphicsPipeline

-- | An opaque handle representing a command buffer.
--
--     Most state is managed via command buffers. When setting state using a command buffer, that state is local to the command buffer.
--
--     Commands only begin execution on the GPU once SDL_SubmitGPUCommandBuffer is called. Once the command buffer is submitted, it is no longer valid to use it.
--
--     Command buffers are executed in submission order. If you submit command buffer A and then command buffer B all commands in A will begin executing before any command in B begins executing.
--
--     In multi-threading scenarios, you should only access a command buffer on the thread you acquired it from.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AcquireGPUCommandBuffer', 'sDL_SubmitGPUCommandBuffer', 'sDL_SubmitGPUCommandBufferAndAcquireFence'
--
--     [C declaration]: @struct SDL_GPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 547:16@
data SDL_GPUCommandBuffer

-- | An opaque handle representing a render pass.
--
--     This handle is transient and should not be held or referenced after SDL_EndGPURenderPass is called.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BeginGPURenderPass', 'sDL_EndGPURenderPass'
--
--     [C declaration]: @struct SDL_GPURenderPass@, defined at @SDL3\/SDL_gpu.h 560:16@
data SDL_GPURenderPass

-- | An opaque handle representing a compute pass.
--
--     This handle is transient and should not be held or referenced after SDL_EndGPUComputePass is called.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BeginGPUComputePass', 'sDL_EndGPUComputePass'
--
--     [C declaration]: @struct SDL_GPUComputePass@, defined at @SDL3\/SDL_gpu.h 573:16@
data SDL_GPUComputePass

-- | An opaque handle representing a copy pass.
--
--     This handle is transient and should not be held or referenced after SDL_EndGPUCopyPass is called.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BeginGPUCopyPass', 'sDL_EndGPUCopyPass'
--
--     [C declaration]: @struct SDL_GPUCopyPass@, defined at @SDL3\/SDL_gpu.h 586:16@
data SDL_GPUCopyPass

-- | An opaque handle representing a fence.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBufferAndAcquireFence', 'sDL_QueryGPUFence', 'sDL_WaitForGPUFences', 'sDL_ReleaseGPUFence'
--
--     [C declaration]: @struct SDL_GPUFence@, defined at @SDL3\/SDL_gpu.h 598:16@
data SDL_GPUFence

-- | Specifies the primitive topology of a graphics pipeline.
--
--     If you are using POINTLIST you must include a point size output in the vertex shader.
--
--     * For HLSL compiling to SPIRV you must decorate a float output with [[vk::builtin(\"PointSize\")]].
--
--     * For GLSL you must set the gl_PointSize builtin.
--
--     * For MSL you must include a float output with the [[point_size]] decorator.
--
--     Note that sized point topology is totally unsupported on D3D12. Any size other than 1 will be ignored. In general, you should avoid using point topology for both compatibility and performance reasons. You WILL regret using it.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUPrimitiveType@, defined at @SDL3\/SDL_gpu.h 621:14@
newtype SDL_GPUPrimitiveType = SDL_GPUPrimitiveType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUPrimitiveType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUPrimitiveType where
  readRaw =
    \ptr0 ->
      pure SDL_GPUPrimitiveType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUPrimitiveType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUPrimitiveType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUPrimitiveType instance BG.Storable SDL_GPUPrimitiveType

deriving via BG.CUInt instance BG.Prim SDL_GPUPrimitiveType

instance CEnum.CEnum SDL_GPUPrimitiveType where
  type CEnumZ SDL_GPUPrimitiveType = BG.CUInt

  toCEnum = SDL_GPUPrimitiveType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_PRIMITIVETYPE_TRIANGLELIST")
        , (1, BG.singleton "SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP")
        , (2, BG.singleton "SDL_GPU_PRIMITIVETYPE_LINELIST")
        , (3, BG.singleton "SDL_GPU_PRIMITIVETYPE_LINESTRIP")
        , (4, BG.singleton "SDL_GPU_PRIMITIVETYPE_POINTLIST")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUPrimitiveType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUPrimitiveType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUPrimitiveType where
  minDeclaredValue = SDL_GPU_PRIMITIVETYPE_TRIANGLELIST

  maxDeclaredValue = SDL_GPU_PRIMITIVETYPE_POINTLIST

instance Show SDL_GPUPrimitiveType where
  showsPrec = CEnum.shows

instance Read SDL_GPUPrimitiveType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUPrimitiveType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUPrimitiveType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUPrimitiveType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUPrimitiveType "unwrap" where
  type
    CFieldType SDL_GPUPrimitiveType "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | A series of separate triangles.
--
--     [C declaration]: @SDL_GPU_PRIMITIVETYPE_TRIANGLELIST@, defined at @SDL3\/SDL_gpu.h 623:5@
pattern SDL_GPU_PRIMITIVETYPE_TRIANGLELIST :: SDL_GPUPrimitiveType
pattern SDL_GPU_PRIMITIVETYPE_TRIANGLELIST = SDL_GPUPrimitiveType 0

-- | A series of connected triangles.
--
--     [C declaration]: @SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP@, defined at @SDL3\/SDL_gpu.h 624:5@
pattern SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP :: SDL_GPUPrimitiveType
pattern SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP = SDL_GPUPrimitiveType 1

-- | A series of separate lines.
--
--     [C declaration]: @SDL_GPU_PRIMITIVETYPE_LINELIST@, defined at @SDL3\/SDL_gpu.h 625:5@
pattern SDL_GPU_PRIMITIVETYPE_LINELIST :: SDL_GPUPrimitiveType
pattern SDL_GPU_PRIMITIVETYPE_LINELIST = SDL_GPUPrimitiveType 2

-- | A series of connected lines.
--
--     [C declaration]: @SDL_GPU_PRIMITIVETYPE_LINESTRIP@, defined at @SDL3\/SDL_gpu.h 626:5@
pattern SDL_GPU_PRIMITIVETYPE_LINESTRIP :: SDL_GPUPrimitiveType
pattern SDL_GPU_PRIMITIVETYPE_LINESTRIP = SDL_GPUPrimitiveType 3

-- | A series of separate points.
--
--     [C declaration]: @SDL_GPU_PRIMITIVETYPE_POINTLIST@, defined at @SDL3\/SDL_gpu.h 627:5@
pattern SDL_GPU_PRIMITIVETYPE_POINTLIST :: SDL_GPUPrimitiveType
pattern SDL_GPU_PRIMITIVETYPE_POINTLIST = SDL_GPUPrimitiveType 4

-- | Specifies how the contents of a texture attached to a render pass are treated at the beginning of the render pass.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BeginGPURenderPass'
--
--     [C declaration]: @enum SDL_GPULoadOp@, defined at @SDL3\/SDL_gpu.h 638:14@
newtype SDL_GPULoadOp = SDL_GPULoadOp
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPULoadOp where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPULoadOp where
  readRaw =
    \ptr0 ->
      pure SDL_GPULoadOp
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPULoadOp where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPULoadOp unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPULoadOp instance BG.Storable SDL_GPULoadOp

deriving via BG.CUInt instance BG.Prim SDL_GPULoadOp

instance CEnum.CEnum SDL_GPULoadOp where
  type CEnumZ SDL_GPULoadOp = BG.CUInt

  toCEnum = SDL_GPULoadOp

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_LOADOP_LOAD")
        , (1, BG.singleton "SDL_GPU_LOADOP_CLEAR")
        , (2, BG.singleton "SDL_GPU_LOADOP_DONT_CARE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPULoadOp"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPULoadOp"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPULoadOp where
  minDeclaredValue = SDL_GPU_LOADOP_LOAD

  maxDeclaredValue = SDL_GPU_LOADOP_DONT_CARE

instance Show SDL_GPULoadOp where
  showsPrec = CEnum.shows

instance Read SDL_GPULoadOp where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPULoadOp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPULoadOp{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPULoadOp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPULoadOp "unwrap" where
  type CFieldType SDL_GPULoadOp "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The previous contents of the texture will be preserved.
--
--     [C declaration]: @SDL_GPU_LOADOP_LOAD@, defined at @SDL3\/SDL_gpu.h 640:5@
pattern SDL_GPU_LOADOP_LOAD :: SDL_GPULoadOp
pattern SDL_GPU_LOADOP_LOAD = SDL_GPULoadOp 0

-- | The contents of the texture will be cleared to a color.
--
--     [C declaration]: @SDL_GPU_LOADOP_CLEAR@, defined at @SDL3\/SDL_gpu.h 641:5@
pattern SDL_GPU_LOADOP_CLEAR :: SDL_GPULoadOp
pattern SDL_GPU_LOADOP_CLEAR = SDL_GPULoadOp 1

-- | The previous contents of the texture need not be preserved. The contents will be undefined.
--
--     [C declaration]: @SDL_GPU_LOADOP_DONT_CARE@, defined at @SDL3\/SDL_gpu.h 642:5@
pattern SDL_GPU_LOADOP_DONT_CARE :: SDL_GPULoadOp
pattern SDL_GPU_LOADOP_DONT_CARE = SDL_GPULoadOp 2

-- | Specifies how the contents of a texture attached to a render pass are treated at the end of the render pass.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BeginGPURenderPass'
--
--     [C declaration]: @enum SDL_GPUStoreOp@, defined at @SDL3\/SDL_gpu.h 653:14@
newtype SDL_GPUStoreOp = SDL_GPUStoreOp
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUStoreOp where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUStoreOp where
  readRaw =
    \ptr0 ->
      pure SDL_GPUStoreOp
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUStoreOp where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUStoreOp unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUStoreOp instance BG.Storable SDL_GPUStoreOp

deriving via BG.CUInt instance BG.Prim SDL_GPUStoreOp

instance CEnum.CEnum SDL_GPUStoreOp where
  type CEnumZ SDL_GPUStoreOp = BG.CUInt

  toCEnum = SDL_GPUStoreOp

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_STOREOP_STORE")
        , (1, BG.singleton "SDL_GPU_STOREOP_DONT_CARE")
        , (2, BG.singleton "SDL_GPU_STOREOP_RESOLVE")
        , (3, BG.singleton "SDL_GPU_STOREOP_RESOLVE_AND_STORE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUStoreOp"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUStoreOp"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUStoreOp where
  minDeclaredValue = SDL_GPU_STOREOP_STORE

  maxDeclaredValue = SDL_GPU_STOREOP_RESOLVE_AND_STORE

instance Show SDL_GPUStoreOp where
  showsPrec = CEnum.shows

instance Read SDL_GPUStoreOp where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUStoreOp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStoreOp{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUStoreOp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUStoreOp "unwrap" where
  type CFieldType SDL_GPUStoreOp "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The contents generated during the render pass will be written to memory.
--
--     [C declaration]: @SDL_GPU_STOREOP_STORE@, defined at @SDL3\/SDL_gpu.h 655:5@
pattern SDL_GPU_STOREOP_STORE :: SDL_GPUStoreOp
pattern SDL_GPU_STOREOP_STORE = SDL_GPUStoreOp 0

-- | The contents generated during the render pass are not needed and may be discarded. The contents will be undefined.
--
--     [C declaration]: @SDL_GPU_STOREOP_DONT_CARE@, defined at @SDL3\/SDL_gpu.h 656:5@
pattern SDL_GPU_STOREOP_DONT_CARE :: SDL_GPUStoreOp
pattern SDL_GPU_STOREOP_DONT_CARE = SDL_GPUStoreOp 1

-- | The multisample contents generated during the render pass will be resolved to a non-multisample texture. The contents in the multisample texture may then be discarded and will be undefined.
--
--     [C declaration]: @SDL_GPU_STOREOP_RESOLVE@, defined at @SDL3\/SDL_gpu.h 657:5@
pattern SDL_GPU_STOREOP_RESOLVE :: SDL_GPUStoreOp
pattern SDL_GPU_STOREOP_RESOLVE = SDL_GPUStoreOp 2

-- | The multisample contents generated during the render pass will be resolved to a non-multisample texture. The contents in the multisample texture will be written to memory.
--
--     [C declaration]: @SDL_GPU_STOREOP_RESOLVE_AND_STORE@, defined at @SDL3\/SDL_gpu.h 658:5@
pattern SDL_GPU_STOREOP_RESOLVE_AND_STORE :: SDL_GPUStoreOp
pattern SDL_GPU_STOREOP_RESOLVE_AND_STORE = SDL_GPUStoreOp 3

-- | Specifies the size of elements in an index buffer.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUIndexElementSize@, defined at @SDL3\/SDL_gpu.h 668:14@
newtype SDL_GPUIndexElementSize = SDL_GPUIndexElementSize
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUIndexElementSize where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUIndexElementSize where
  readRaw =
    \ptr0 ->
      pure SDL_GPUIndexElementSize
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUIndexElementSize where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUIndexElementSize unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_GPUIndexElementSize
  instance
    BG.Storable SDL_GPUIndexElementSize

deriving via BG.CUInt instance BG.Prim SDL_GPUIndexElementSize

instance CEnum.CEnum SDL_GPUIndexElementSize where
  type CEnumZ SDL_GPUIndexElementSize = BG.CUInt

  toCEnum = SDL_GPUIndexElementSize

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_INDEXELEMENTSIZE_16BIT")
        , (1, BG.singleton "SDL_GPU_INDEXELEMENTSIZE_32BIT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUIndexElementSize"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUIndexElementSize"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUIndexElementSize where
  minDeclaredValue = SDL_GPU_INDEXELEMENTSIZE_16BIT

  maxDeclaredValue = SDL_GPU_INDEXELEMENTSIZE_32BIT

instance Show SDL_GPUIndexElementSize where
  showsPrec = CEnum.shows

instance Read SDL_GPUIndexElementSize where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUIndexElementSize ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndexElementSize{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUIndexElementSize) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUIndexElementSize "unwrap" where
  type
    CFieldType SDL_GPUIndexElementSize "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The index elements are 16-bit.
--
--     [C declaration]: @SDL_GPU_INDEXELEMENTSIZE_16BIT@, defined at @SDL3\/SDL_gpu.h 670:5@
pattern SDL_GPU_INDEXELEMENTSIZE_16BIT :: SDL_GPUIndexElementSize
pattern SDL_GPU_INDEXELEMENTSIZE_16BIT = SDL_GPUIndexElementSize 0

-- | The index elements are 32-bit.
--
--     [C declaration]: @SDL_GPU_INDEXELEMENTSIZE_32BIT@, defined at @SDL3\/SDL_gpu.h 671:5@
pattern SDL_GPU_INDEXELEMENTSIZE_32BIT :: SDL_GPUIndexElementSize
pattern SDL_GPU_INDEXELEMENTSIZE_32BIT = SDL_GPUIndexElementSize 1

-- | Specifies the pixel format of a texture.
--
--     Texture format support varies depending on driver, hardware, and usage flags. In general, you should use SDL_GPUTextureSupportsFormat to query if a format is supported before using it. However, there are a few guaranteed formats.
--
--     FIXME: Check universal support for 32-bit component formats FIXME: Check universal support for SIMULTANEOUS_READ_WRITE
--
--     For SAMPLER usage, the following formats are universally supported:
--
--     * R8G8B8A8_UNORM
--
--     * B8G8R8A8_UNORM
--
--     * R8_UNORM
--
--     * R8_SNORM
--
--     * R8G8_UNORM
--
--     * R8G8_SNORM
--
--     * R8G8B8A8_SNORM
--
--     * R16_FLOAT
--
--     * R16G16_FLOAT
--
--     * R16G16B16A16_FLOAT
--
--     * R32_FLOAT
--
--     * R32G32_FLOAT
--
--     * R32G32B32A32_FLOAT
--
--     * R11G11B10_UFLOAT
--
--     * R8G8B8A8_UNORM_SRGB
--
--     * B8G8R8A8_UNORM_SRGB
--
--     * D16_UNORM
--
--     For COLOR_TARGET usage, the following formats are universally supported:
--
--     * R8G8B8A8_UNORM
--
--     * B8G8R8A8_UNORM
--
--     * R8_UNORM
--
--     * R16_FLOAT
--
--     * R16G16_FLOAT
--
--     * R16G16B16A16_FLOAT
--
--     * R32_FLOAT
--
--     * R32G32_FLOAT
--
--     * R32G32B32A32_FLOAT
--
--     * R8_UINT
--
--     * R8G8_UINT
--
--     * R8G8B8A8_UINT
--
--     * R16_UINT
--
--     * R16G16_UINT
--
--     * R16G16B16A16_UINT
--
--     * R8_INT
--
--     * R8G8_INT
--
--     * R8G8B8A8_INT
--
--     * R16_INT
--
--     * R16G16_INT
--
--     * R16G16B16A16_INT
--
--     * R8G8B8A8_UNORM_SRGB
--
--     * B8G8R8A8_UNORM_SRGB
--
--     For STORAGE usages, the following formats are universally supported:
--
--     * R8G8B8A8_UNORM
--
--     * R8G8B8A8_SNORM
--
--     * R16G16B16A16_FLOAT
--
--     * R32_FLOAT
--
--     * R32G32_FLOAT
--
--     * R32G32B32A32_FLOAT
--
--     * R8G8B8A8_UINT
--
--     * R16G16B16A16_UINT
--
--     * R8G8B8A8_INT
--
--     * R16G16B16A16_INT
--
--     For DEPTH_STENCIL_TARGET usage, the following formats are universally supported:
--
--     * D16_UNORM
--
--     * Either (but not necessarily both!) D24_UNORM or D32_FLOAT
--
--     * Either (but not necessarily both!) D24_UNORM_S8_UINT or D32_FLOAT_S8_UINT
--
--     Unless D16_UNORM is sufficient for your purposes, always check which of D24\/D32 is supported before creating a depth-stencil texture!
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTexture', 'sDL_GPUTextureSupportsFormat'
--
--     [C declaration]: @enum SDL_GPUTextureFormat@, defined at @SDL3\/SDL_gpu.h 759:14@
newtype SDL_GPUTextureFormat = SDL_GPUTextureFormat
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUTextureFormat where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUTextureFormat where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTextureFormat
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUTextureFormat where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTextureFormat unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUTextureFormat instance BG.Storable SDL_GPUTextureFormat

deriving via BG.CUInt instance BG.Prim SDL_GPUTextureFormat

instance CEnum.CEnum SDL_GPUTextureFormat where
  type CEnumZ SDL_GPUTextureFormat = BG.CUInt

  toCEnum = SDL_GPUTextureFormat

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_TEXTUREFORMAT_INVALID")
        , (1, BG.singleton "SDL_GPU_TEXTUREFORMAT_A8_UNORM")
        , (2, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8_UNORM")
        , (3, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8G8_UNORM")
        , (4, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM")
        , (5, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16_UNORM")
        , (6, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16_UNORM")
        , (7, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM")
        , (8, BG.singleton "SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM")
        , (9, BG.singleton "SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM")
        , (10, BG.singleton "SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM")
        , (11, BG.singleton "SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM")
        , (12, BG.singleton "SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM")
        , (13, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM")
        , (14, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM")
        , (15, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM")
        , (16, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM")
        , (17, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM")
        , (18, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM")
        , (19, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT")
        , (20, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT")
        , (21, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8_SNORM")
        , (22, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8G8_SNORM")
        , (23, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM")
        , (24, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16_SNORM")
        , (25, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16_SNORM")
        , (26, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM")
        , (27, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16_FLOAT")
        , (28, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT")
        , (29, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT")
        , (30, BG.singleton "SDL_GPU_TEXTUREFORMAT_R32_FLOAT")
        , (31, BG.singleton "SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT")
        , (32, BG.singleton "SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT")
        , (33, BG.singleton "SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT")
        , (34, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8_UINT")
        , (35, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8G8_UINT")
        , (36, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT")
        , (37, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16_UINT")
        , (38, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16_UINT")
        , (39, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT")
        , (40, BG.singleton "SDL_GPU_TEXTUREFORMAT_R32_UINT")
        , (41, BG.singleton "SDL_GPU_TEXTUREFORMAT_R32G32_UINT")
        , (42, BG.singleton "SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT")
        , (43, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8_INT")
        , (44, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8G8_INT")
        , (45, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT")
        , (46, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16_INT")
        , (47, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16_INT")
        , (48, BG.singleton "SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT")
        , (49, BG.singleton "SDL_GPU_TEXTUREFORMAT_R32_INT")
        , (50, BG.singleton "SDL_GPU_TEXTUREFORMAT_R32G32_INT")
        , (51, BG.singleton "SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT")
        , (52, BG.singleton "SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB")
        , (53, BG.singleton "SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB")
        , (54, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB")
        , (55, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB")
        , (56, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB")
        , (57, BG.singleton "SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB")
        , (58, BG.singleton "SDL_GPU_TEXTUREFORMAT_D16_UNORM")
        , (59, BG.singleton "SDL_GPU_TEXTUREFORMAT_D24_UNORM")
        , (60, BG.singleton "SDL_GPU_TEXTUREFORMAT_D32_FLOAT")
        , (61, BG.singleton "SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT")
        , (62, BG.singleton "SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT")
        , (63, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM")
        , (64, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM")
        , (65, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM")
        , (66, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM")
        , (67, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM")
        , (68, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM")
        , (69, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM")
        , (70, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM")
        , (71, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM")
        , (72, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM")
        , (73, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM")
        , (74, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM")
        , (75, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM")
        , (76, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM")
        , (77, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB")
        , (78, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB")
        , (79, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB")
        , (80, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB")
        , (81, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB")
        , (82, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB")
        , (83, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB")
        , (84, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB")
        , (85, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB")
        , (86, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB")
        , (87, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB")
        , (88, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB")
        , (89, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB")
        , (90, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB")
        , (91, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT")
        , (92, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT")
        , (93, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT")
        , (94, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT")
        , (95, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT")
        , (96, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT")
        , (97, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT")
        , (98, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT")
        , (99, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT")
        , (100, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT")
        , (101, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT")
        , (102, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT")
        , (103, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT")
        , (104, BG.singleton "SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUTextureFormat"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUTextureFormat"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUTextureFormat where
  minDeclaredValue = SDL_GPU_TEXTUREFORMAT_INVALID

  maxDeclaredValue =
    SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT

instance Show SDL_GPUTextureFormat where
  showsPrec = CEnum.shows

instance Read SDL_GPUTextureFormat where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUTextureFormat ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureFormat{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUTextureFormat) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUTextureFormat "unwrap" where
  type
    CFieldType SDL_GPUTextureFormat "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_INVALID@, defined at @SDL3\/SDL_gpu.h 761:5@
pattern SDL_GPU_TEXTUREFORMAT_INVALID :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_INVALID = SDL_GPUTextureFormat 0

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_A8_UNORM@, defined at @SDL3\/SDL_gpu.h 764:5@
pattern SDL_GPU_TEXTUREFORMAT_A8_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_A8_UNORM = SDL_GPUTextureFormat 1

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8_UNORM@, defined at @SDL3\/SDL_gpu.h 765:5@
pattern SDL_GPU_TEXTUREFORMAT_R8_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8_UNORM = SDL_GPUTextureFormat 2

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8G8_UNORM@, defined at @SDL3\/SDL_gpu.h 766:5@
pattern SDL_GPU_TEXTUREFORMAT_R8G8_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8G8_UNORM = SDL_GPUTextureFormat 3

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM@, defined at @SDL3\/SDL_gpu.h 767:5@
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM = SDL_GPUTextureFormat 4

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16_UNORM@, defined at @SDL3\/SDL_gpu.h 768:5@
pattern SDL_GPU_TEXTUREFORMAT_R16_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16_UNORM = SDL_GPUTextureFormat 5

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16_UNORM@, defined at @SDL3\/SDL_gpu.h 769:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16_UNORM = SDL_GPUTextureFormat 6

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM@, defined at @SDL3\/SDL_gpu.h 770:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM = SDL_GPUTextureFormat 7

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM@, defined at @SDL3\/SDL_gpu.h 771:5@
pattern SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM = SDL_GPUTextureFormat 8

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM@, defined at @SDL3\/SDL_gpu.h 772:5@
pattern SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM = SDL_GPUTextureFormat 9

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM@, defined at @SDL3\/SDL_gpu.h 773:5@
pattern SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM = SDL_GPUTextureFormat 10

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM@, defined at @SDL3\/SDL_gpu.h 774:5@
pattern SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM = SDL_GPUTextureFormat 11

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM@, defined at @SDL3\/SDL_gpu.h 775:5@
pattern SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM = SDL_GPUTextureFormat 12

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM@, defined at @SDL3\/SDL_gpu.h 777:5@
pattern SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM = SDL_GPUTextureFormat 13

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM@, defined at @SDL3\/SDL_gpu.h 778:5@
pattern SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM = SDL_GPUTextureFormat 14

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM@, defined at @SDL3\/SDL_gpu.h 779:5@
pattern SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM = SDL_GPUTextureFormat 15

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM@, defined at @SDL3\/SDL_gpu.h 780:5@
pattern SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM = SDL_GPUTextureFormat 16

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM@, defined at @SDL3\/SDL_gpu.h 781:5@
pattern SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM = SDL_GPUTextureFormat 17

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM@, defined at @SDL3\/SDL_gpu.h 782:5@
pattern SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM = SDL_GPUTextureFormat 18

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT@, defined at @SDL3\/SDL_gpu.h 784:5@
pattern SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT = SDL_GPUTextureFormat 19

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT@, defined at @SDL3\/SDL_gpu.h 786:5@
pattern SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT = SDL_GPUTextureFormat 20

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8_SNORM@, defined at @SDL3\/SDL_gpu.h 788:5@
pattern SDL_GPU_TEXTUREFORMAT_R8_SNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8_SNORM = SDL_GPUTextureFormat 21

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8G8_SNORM@, defined at @SDL3\/SDL_gpu.h 789:5@
pattern SDL_GPU_TEXTUREFORMAT_R8G8_SNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8G8_SNORM = SDL_GPUTextureFormat 22

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM@, defined at @SDL3\/SDL_gpu.h 790:5@
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM = SDL_GPUTextureFormat 23

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16_SNORM@, defined at @SDL3\/SDL_gpu.h 791:5@
pattern SDL_GPU_TEXTUREFORMAT_R16_SNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16_SNORM = SDL_GPUTextureFormat 24

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16_SNORM@, defined at @SDL3\/SDL_gpu.h 792:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16_SNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16_SNORM = SDL_GPUTextureFormat 25

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM@, defined at @SDL3\/SDL_gpu.h 793:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM = SDL_GPUTextureFormat 26

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16_FLOAT@, defined at @SDL3\/SDL_gpu.h 795:5@
pattern SDL_GPU_TEXTUREFORMAT_R16_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16_FLOAT = SDL_GPUTextureFormat 27

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT@, defined at @SDL3\/SDL_gpu.h 796:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT = SDL_GPUTextureFormat 28

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT@, defined at @SDL3\/SDL_gpu.h 797:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT = SDL_GPUTextureFormat 29

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R32_FLOAT@, defined at @SDL3\/SDL_gpu.h 798:5@
pattern SDL_GPU_TEXTUREFORMAT_R32_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R32_FLOAT = SDL_GPUTextureFormat 30

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT@, defined at @SDL3\/SDL_gpu.h 799:5@
pattern SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT = SDL_GPUTextureFormat 31

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT@, defined at @SDL3\/SDL_gpu.h 800:5@
pattern SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT = SDL_GPUTextureFormat 32

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT@, defined at @SDL3\/SDL_gpu.h 802:5@
pattern SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT = SDL_GPUTextureFormat 33

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8_UINT@, defined at @SDL3\/SDL_gpu.h 804:5@
pattern SDL_GPU_TEXTUREFORMAT_R8_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8_UINT = SDL_GPUTextureFormat 34

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8G8_UINT@, defined at @SDL3\/SDL_gpu.h 805:5@
pattern SDL_GPU_TEXTUREFORMAT_R8G8_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8G8_UINT = SDL_GPUTextureFormat 35

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT@, defined at @SDL3\/SDL_gpu.h 806:5@
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT = SDL_GPUTextureFormat 36

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16_UINT@, defined at @SDL3\/SDL_gpu.h 807:5@
pattern SDL_GPU_TEXTUREFORMAT_R16_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16_UINT = SDL_GPUTextureFormat 37

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16_UINT@, defined at @SDL3\/SDL_gpu.h 808:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16_UINT = SDL_GPUTextureFormat 38

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT@, defined at @SDL3\/SDL_gpu.h 809:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT = SDL_GPUTextureFormat 39

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R32_UINT@, defined at @SDL3\/SDL_gpu.h 810:5@
pattern SDL_GPU_TEXTUREFORMAT_R32_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R32_UINT = SDL_GPUTextureFormat 40

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R32G32_UINT@, defined at @SDL3\/SDL_gpu.h 811:5@
pattern SDL_GPU_TEXTUREFORMAT_R32G32_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R32G32_UINT = SDL_GPUTextureFormat 41

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT@, defined at @SDL3\/SDL_gpu.h 812:5@
pattern SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT = SDL_GPUTextureFormat 42

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8_INT@, defined at @SDL3\/SDL_gpu.h 814:5@
pattern SDL_GPU_TEXTUREFORMAT_R8_INT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8_INT = SDL_GPUTextureFormat 43

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8G8_INT@, defined at @SDL3\/SDL_gpu.h 815:5@
pattern SDL_GPU_TEXTUREFORMAT_R8G8_INT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8G8_INT = SDL_GPUTextureFormat 44

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT@, defined at @SDL3\/SDL_gpu.h 816:5@
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT = SDL_GPUTextureFormat 45

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16_INT@, defined at @SDL3\/SDL_gpu.h 817:5@
pattern SDL_GPU_TEXTUREFORMAT_R16_INT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16_INT = SDL_GPUTextureFormat 46

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16_INT@, defined at @SDL3\/SDL_gpu.h 818:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16_INT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16_INT = SDL_GPUTextureFormat 47

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT@, defined at @SDL3\/SDL_gpu.h 819:5@
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT = SDL_GPUTextureFormat 48

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R32_INT@, defined at @SDL3\/SDL_gpu.h 820:5@
pattern SDL_GPU_TEXTUREFORMAT_R32_INT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R32_INT = SDL_GPUTextureFormat 49

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R32G32_INT@, defined at @SDL3\/SDL_gpu.h 821:5@
pattern SDL_GPU_TEXTUREFORMAT_R32G32_INT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R32G32_INT = SDL_GPUTextureFormat 50

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT@, defined at @SDL3\/SDL_gpu.h 822:5@
pattern SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT = SDL_GPUTextureFormat 51

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 824:5@
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB = SDL_GPUTextureFormat 52

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 825:5@
pattern SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB = SDL_GPUTextureFormat 53

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 827:5@
pattern SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB = SDL_GPUTextureFormat 54

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 828:5@
pattern SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB = SDL_GPUTextureFormat 55

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 829:5@
pattern SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB = SDL_GPUTextureFormat 56

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 830:5@
pattern SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB = SDL_GPUTextureFormat 57

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_D16_UNORM@, defined at @SDL3\/SDL_gpu.h 832:5@
pattern SDL_GPU_TEXTUREFORMAT_D16_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_D16_UNORM = SDL_GPUTextureFormat 58

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_D24_UNORM@, defined at @SDL3\/SDL_gpu.h 833:5@
pattern SDL_GPU_TEXTUREFORMAT_D24_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_D24_UNORM = SDL_GPUTextureFormat 59

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_D32_FLOAT@, defined at @SDL3\/SDL_gpu.h 834:5@
pattern SDL_GPU_TEXTUREFORMAT_D32_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_D32_FLOAT = SDL_GPUTextureFormat 60

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT@, defined at @SDL3\/SDL_gpu.h 835:5@
pattern SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT = SDL_GPUTextureFormat 61

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT@, defined at @SDL3\/SDL_gpu.h 836:5@
pattern SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT = SDL_GPUTextureFormat 62

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM@, defined at @SDL3\/SDL_gpu.h 838:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM = SDL_GPUTextureFormat 63

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM@, defined at @SDL3\/SDL_gpu.h 839:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM = SDL_GPUTextureFormat 64

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM@, defined at @SDL3\/SDL_gpu.h 840:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM = SDL_GPUTextureFormat 65

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM@, defined at @SDL3\/SDL_gpu.h 841:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM = SDL_GPUTextureFormat 66

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM@, defined at @SDL3\/SDL_gpu.h 842:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM = SDL_GPUTextureFormat 67

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM@, defined at @SDL3\/SDL_gpu.h 843:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM = SDL_GPUTextureFormat 68

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM@, defined at @SDL3\/SDL_gpu.h 844:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM = SDL_GPUTextureFormat 69

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM@, defined at @SDL3\/SDL_gpu.h 845:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM = SDL_GPUTextureFormat 70

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM@, defined at @SDL3\/SDL_gpu.h 846:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM = SDL_GPUTextureFormat 71

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM@, defined at @SDL3\/SDL_gpu.h 847:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM = SDL_GPUTextureFormat 72

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM@, defined at @SDL3\/SDL_gpu.h 848:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM = SDL_GPUTextureFormat 73

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM@, defined at @SDL3\/SDL_gpu.h 849:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM = SDL_GPUTextureFormat 74

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM@, defined at @SDL3\/SDL_gpu.h 850:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM = SDL_GPUTextureFormat 75

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM@, defined at @SDL3\/SDL_gpu.h 851:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM = SDL_GPUTextureFormat 76

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 853:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB = SDL_GPUTextureFormat 77

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 854:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB = SDL_GPUTextureFormat 78

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 855:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB = SDL_GPUTextureFormat 79

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 856:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB = SDL_GPUTextureFormat 80

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 857:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB = SDL_GPUTextureFormat 81

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 858:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB = SDL_GPUTextureFormat 82

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 859:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB = SDL_GPUTextureFormat 83

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 860:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB = SDL_GPUTextureFormat 84

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 861:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB = SDL_GPUTextureFormat 85

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 862:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB = SDL_GPUTextureFormat 86

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 863:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB = SDL_GPUTextureFormat 87

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 864:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB = SDL_GPUTextureFormat 88

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 865:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB = SDL_GPUTextureFormat 89

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB@, defined at @SDL3\/SDL_gpu.h 866:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB = SDL_GPUTextureFormat 90

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT@, defined at @SDL3\/SDL_gpu.h 868:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT = SDL_GPUTextureFormat 91

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT@, defined at @SDL3\/SDL_gpu.h 869:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT = SDL_GPUTextureFormat 92

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT@, defined at @SDL3\/SDL_gpu.h 870:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT = SDL_GPUTextureFormat 93

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT@, defined at @SDL3\/SDL_gpu.h 871:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT = SDL_GPUTextureFormat 94

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT@, defined at @SDL3\/SDL_gpu.h 872:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT = SDL_GPUTextureFormat 95

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT@, defined at @SDL3\/SDL_gpu.h 873:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT = SDL_GPUTextureFormat 96

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT@, defined at @SDL3\/SDL_gpu.h 874:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT = SDL_GPUTextureFormat 97

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT@, defined at @SDL3\/SDL_gpu.h 875:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT = SDL_GPUTextureFormat 98

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT@, defined at @SDL3\/SDL_gpu.h 876:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT = SDL_GPUTextureFormat 99

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT@, defined at @SDL3\/SDL_gpu.h 877:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT = SDL_GPUTextureFormat 100

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT@, defined at @SDL3\/SDL_gpu.h 878:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT = SDL_GPUTextureFormat 101

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT@, defined at @SDL3\/SDL_gpu.h 879:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT = SDL_GPUTextureFormat 102

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT@, defined at @SDL3\/SDL_gpu.h 880:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT = SDL_GPUTextureFormat 103

-- | [C declaration]: @SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT@, defined at @SDL3\/SDL_gpu.h 881:5@
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT :: SDL_GPUTextureFormat
pattern SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT = SDL_GPUTextureFormat 104

-- | Specifies how a texture is intended to be used by the client.
--
--     A texture must have at least one usage flag. Note that some usage flag combinations are invalid.
--
--     With regards to compute storage usage, READ | WRITE means that you can have shader A that only writes into the texture and shader B that only reads from the texture and bind the same texture to either shader respectively. SIMULTANEOUS means that you can do reads and writes within the same shader or compute pass. It also implies that atomic ops can be used, since those are read-modify-write operations. If you use SIMULTANEOUS, you are responsible for avoiding data races, as there is no data synchronization within a compute pass. Note that SIMULTANEOUS usage is only supported by a limited number of texture formats.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTexture'
--
--     [C declaration]: @SDL_GPUTextureUsageFlags@, defined at @SDL3\/SDL_gpu.h 904:16@
newtype SDL_GPUTextureUsageFlags = SDL_GPUTextureUsageFlags
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUTextureUsageFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureUsageFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUTextureUsageFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUTextureUsageFlags "unwrap" where
  type
    CFieldType SDL_GPUTextureUsageFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Texture supports sampling.
--
--     [C declaration]: @macro SDL_GPU_TEXTUREUSAGE_SAMPLER@, defined at @SDL3\/SDL_gpu.h 906:9@
sDL_GPU_TEXTUREUSAGE_SAMPLER :: BG.CUInt
sDL_GPU_TEXTUREUSAGE_SAMPLER =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (0 :: BG.CInt)

-- | Texture is a color render target.
--
--     [C declaration]: @macro SDL_GPU_TEXTUREUSAGE_COLOR_TARGET@, defined at @SDL3\/SDL_gpu.h 907:9@
sDL_GPU_TEXTUREUSAGE_COLOR_TARGET :: BG.CUInt
sDL_GPU_TEXTUREUSAGE_COLOR_TARGET =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (1 :: BG.CInt)

-- | Texture is a depth stencil target.
--
--     [C declaration]: @macro SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET@, defined at @SDL3\/SDL_gpu.h 908:9@
sDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET :: BG.CUInt
sDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (2 :: BG.CInt)

-- | Texture supports storage reads in graphics stages.
--
--     [C declaration]: @macro SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ@, defined at @SDL3\/SDL_gpu.h 909:9@
sDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ :: BG.CUInt
sDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (3 :: BG.CInt)

-- | Texture supports storage reads in the compute stage.
--
--     [C declaration]: @macro SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ@, defined at @SDL3\/SDL_gpu.h 910:9@
sDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ :: BG.CUInt
sDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (4 :: BG.CInt)

-- | Texture supports storage writes in the compute stage.
--
--     [C declaration]: @macro SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE@, defined at @SDL3\/SDL_gpu.h 911:9@
sDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE :: BG.CUInt
sDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (5 :: BG.CInt)

-- | Texture supports reads and writes in the same compute shader. This is NOT equivalent to READ | WRITE.
--
--     [C declaration]: @macro SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE@, defined at @SDL3\/SDL_gpu.h 912:9@
sDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE :: BG.CUInt
sDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (6 :: BG.CInt)

-- | Specifies the type of a texture.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTexture'
--
--     [C declaration]: @enum SDL_GPUTextureType@, defined at @SDL3\/SDL_gpu.h 921:14@
newtype SDL_GPUTextureType = SDL_GPUTextureType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUTextureType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUTextureType where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTextureType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUTextureType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTextureType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUTextureType instance BG.Storable SDL_GPUTextureType

deriving via BG.CUInt instance BG.Prim SDL_GPUTextureType

instance CEnum.CEnum SDL_GPUTextureType where
  type CEnumZ SDL_GPUTextureType = BG.CUInt

  toCEnum = SDL_GPUTextureType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_TEXTURETYPE_2D")
        , (1, BG.singleton "SDL_GPU_TEXTURETYPE_2D_ARRAY")
        , (2, BG.singleton "SDL_GPU_TEXTURETYPE_3D")
        , (3, BG.singleton "SDL_GPU_TEXTURETYPE_CUBE")
        , (4, BG.singleton "SDL_GPU_TEXTURETYPE_CUBE_ARRAY")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUTextureType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUTextureType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUTextureType where
  minDeclaredValue = SDL_GPU_TEXTURETYPE_2D

  maxDeclaredValue = SDL_GPU_TEXTURETYPE_CUBE_ARRAY

instance Show SDL_GPUTextureType where
  showsPrec = CEnum.shows

instance Read SDL_GPUTextureType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUTextureType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUTextureType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUTextureType "unwrap" where
  type
    CFieldType SDL_GPUTextureType "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The texture is a 2-dimensional image.
--
--     [C declaration]: @SDL_GPU_TEXTURETYPE_2D@, defined at @SDL3\/SDL_gpu.h 923:5@
pattern SDL_GPU_TEXTURETYPE_2D :: SDL_GPUTextureType
pattern SDL_GPU_TEXTURETYPE_2D = SDL_GPUTextureType 0

-- | The texture is a 2-dimensional array image.
--
--     [C declaration]: @SDL_GPU_TEXTURETYPE_2D_ARRAY@, defined at @SDL3\/SDL_gpu.h 924:5@
pattern SDL_GPU_TEXTURETYPE_2D_ARRAY :: SDL_GPUTextureType
pattern SDL_GPU_TEXTURETYPE_2D_ARRAY = SDL_GPUTextureType 1

-- | The texture is a 3-dimensional image.
--
--     [C declaration]: @SDL_GPU_TEXTURETYPE_3D@, defined at @SDL3\/SDL_gpu.h 925:5@
pattern SDL_GPU_TEXTURETYPE_3D :: SDL_GPUTextureType
pattern SDL_GPU_TEXTURETYPE_3D = SDL_GPUTextureType 2

-- | The texture is a cube image.
--
--     [C declaration]: @SDL_GPU_TEXTURETYPE_CUBE@, defined at @SDL3\/SDL_gpu.h 926:5@
pattern SDL_GPU_TEXTURETYPE_CUBE :: SDL_GPUTextureType
pattern SDL_GPU_TEXTURETYPE_CUBE = SDL_GPUTextureType 3

-- | The texture is a cube array image.
--
--     [C declaration]: @SDL_GPU_TEXTURETYPE_CUBE_ARRAY@, defined at @SDL3\/SDL_gpu.h 927:5@
pattern SDL_GPU_TEXTURETYPE_CUBE_ARRAY :: SDL_GPUTextureType
pattern SDL_GPU_TEXTURETYPE_CUBE_ARRAY = SDL_GPUTextureType 4

-- | Specifies the sample count of a texture.
--
--     Used in multisampling. Note that this value only applies when the texture is used as a render target.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTexture', 'sDL_GPUTextureSupportsSampleCount'
--
--     [C declaration]: @enum SDL_GPUSampleCount@, defined at @SDL3\/SDL_gpu.h 941:14@
newtype SDL_GPUSampleCount = SDL_GPUSampleCount
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUSampleCount where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUSampleCount where
  readRaw =
    \ptr0 ->
      pure SDL_GPUSampleCount
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUSampleCount where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUSampleCount unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUSampleCount instance BG.Storable SDL_GPUSampleCount

deriving via BG.CUInt instance BG.Prim SDL_GPUSampleCount

instance CEnum.CEnum SDL_GPUSampleCount where
  type CEnumZ SDL_GPUSampleCount = BG.CUInt

  toCEnum = SDL_GPUSampleCount

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_SAMPLECOUNT_1")
        , (1, BG.singleton "SDL_GPU_SAMPLECOUNT_2")
        , (2, BG.singleton "SDL_GPU_SAMPLECOUNT_4")
        , (3, BG.singleton "SDL_GPU_SAMPLECOUNT_8")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUSampleCount"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUSampleCount"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUSampleCount where
  minDeclaredValue = SDL_GPU_SAMPLECOUNT_1

  maxDeclaredValue = SDL_GPU_SAMPLECOUNT_8

instance Show SDL_GPUSampleCount where
  showsPrec = CEnum.shows

instance Read SDL_GPUSampleCount where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUSampleCount ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSampleCount{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUSampleCount) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUSampleCount "unwrap" where
  type
    CFieldType SDL_GPUSampleCount "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | No multisampling.
--
--     [C declaration]: @SDL_GPU_SAMPLECOUNT_1@, defined at @SDL3\/SDL_gpu.h 943:5@
pattern SDL_GPU_SAMPLECOUNT_1 :: SDL_GPUSampleCount
pattern SDL_GPU_SAMPLECOUNT_1 = SDL_GPUSampleCount 0

-- | MSAA 2x
--
--     [C declaration]: @SDL_GPU_SAMPLECOUNT_2@, defined at @SDL3\/SDL_gpu.h 944:5@
pattern SDL_GPU_SAMPLECOUNT_2 :: SDL_GPUSampleCount
pattern SDL_GPU_SAMPLECOUNT_2 = SDL_GPUSampleCount 1

-- | MSAA 4x
--
--     [C declaration]: @SDL_GPU_SAMPLECOUNT_4@, defined at @SDL3\/SDL_gpu.h 945:5@
pattern SDL_GPU_SAMPLECOUNT_4 :: SDL_GPUSampleCount
pattern SDL_GPU_SAMPLECOUNT_4 = SDL_GPUSampleCount 2

-- | MSAA 8x
--
--     [C declaration]: @SDL_GPU_SAMPLECOUNT_8@, defined at @SDL3\/SDL_gpu.h 946:5@
pattern SDL_GPU_SAMPLECOUNT_8 :: SDL_GPUSampleCount
pattern SDL_GPU_SAMPLECOUNT_8 = SDL_GPUSampleCount 3

-- | Specifies the face of a cube map.
--
--     Can be passed in as the layer field in texture-related structs.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_GPUCubeMapFace@, defined at @SDL3\/SDL_gpu.h 957:14@
newtype SDL_GPUCubeMapFace = SDL_GPUCubeMapFace
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUCubeMapFace where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUCubeMapFace where
  readRaw =
    \ptr0 ->
      pure SDL_GPUCubeMapFace
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUCubeMapFace where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUCubeMapFace unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUCubeMapFace instance BG.Storable SDL_GPUCubeMapFace

deriving via BG.CUInt instance BG.Prim SDL_GPUCubeMapFace

instance CEnum.CEnum SDL_GPUCubeMapFace where
  type CEnumZ SDL_GPUCubeMapFace = BG.CUInt

  toCEnum = SDL_GPUCubeMapFace

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_CUBEMAPFACE_POSITIVEX")
        , (1, BG.singleton "SDL_GPU_CUBEMAPFACE_NEGATIVEX")
        , (2, BG.singleton "SDL_GPU_CUBEMAPFACE_POSITIVEY")
        , (3, BG.singleton "SDL_GPU_CUBEMAPFACE_NEGATIVEY")
        , (4, BG.singleton "SDL_GPU_CUBEMAPFACE_POSITIVEZ")
        , (5, BG.singleton "SDL_GPU_CUBEMAPFACE_NEGATIVEZ")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUCubeMapFace"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUCubeMapFace"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUCubeMapFace where
  minDeclaredValue = SDL_GPU_CUBEMAPFACE_POSITIVEX

  maxDeclaredValue = SDL_GPU_CUBEMAPFACE_NEGATIVEZ

instance Show SDL_GPUCubeMapFace where
  showsPrec = CEnum.shows

instance Read SDL_GPUCubeMapFace where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUCubeMapFace ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUCubeMapFace{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUCubeMapFace) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUCubeMapFace "unwrap" where
  type
    CFieldType SDL_GPUCubeMapFace "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_CUBEMAPFACE_POSITIVEX@, defined at @SDL3\/SDL_gpu.h 959:5@
pattern SDL_GPU_CUBEMAPFACE_POSITIVEX :: SDL_GPUCubeMapFace
pattern SDL_GPU_CUBEMAPFACE_POSITIVEX = SDL_GPUCubeMapFace 0

-- | [C declaration]: @SDL_GPU_CUBEMAPFACE_NEGATIVEX@, defined at @SDL3\/SDL_gpu.h 960:5@
pattern SDL_GPU_CUBEMAPFACE_NEGATIVEX :: SDL_GPUCubeMapFace
pattern SDL_GPU_CUBEMAPFACE_NEGATIVEX = SDL_GPUCubeMapFace 1

-- | [C declaration]: @SDL_GPU_CUBEMAPFACE_POSITIVEY@, defined at @SDL3\/SDL_gpu.h 961:5@
pattern SDL_GPU_CUBEMAPFACE_POSITIVEY :: SDL_GPUCubeMapFace
pattern SDL_GPU_CUBEMAPFACE_POSITIVEY = SDL_GPUCubeMapFace 2

-- | [C declaration]: @SDL_GPU_CUBEMAPFACE_NEGATIVEY@, defined at @SDL3\/SDL_gpu.h 962:5@
pattern SDL_GPU_CUBEMAPFACE_NEGATIVEY :: SDL_GPUCubeMapFace
pattern SDL_GPU_CUBEMAPFACE_NEGATIVEY = SDL_GPUCubeMapFace 3

-- | [C declaration]: @SDL_GPU_CUBEMAPFACE_POSITIVEZ@, defined at @SDL3\/SDL_gpu.h 963:5@
pattern SDL_GPU_CUBEMAPFACE_POSITIVEZ :: SDL_GPUCubeMapFace
pattern SDL_GPU_CUBEMAPFACE_POSITIVEZ = SDL_GPUCubeMapFace 4

-- | [C declaration]: @SDL_GPU_CUBEMAPFACE_NEGATIVEZ@, defined at @SDL3\/SDL_gpu.h 964:5@
pattern SDL_GPU_CUBEMAPFACE_NEGATIVEZ :: SDL_GPUCubeMapFace
pattern SDL_GPU_CUBEMAPFACE_NEGATIVEZ = SDL_GPUCubeMapFace 5

-- | Specifies how a buffer is intended to be used by the client.
--
--     A buffer must have at least one usage flag. Note that some usage flag combinations are invalid.
--
--     Unlike textures, READ | WRITE can be used for simultaneous read-write usage. The same data synchronization concerns as textures apply.
--
--     If you use a STORAGE flag, the data in the buffer must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUBuffer'
--
--     [C declaration]: @SDL_GPUBufferUsageFlags@, defined at @SDL3\/SDL_gpu.h 984:16@
newtype SDL_GPUBufferUsageFlags = SDL_GPUBufferUsageFlags
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUBufferUsageFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferUsageFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUBufferUsageFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUBufferUsageFlags "unwrap" where
  type
    CFieldType SDL_GPUBufferUsageFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Buffer is a vertex buffer.
--
--     [C declaration]: @macro SDL_GPU_BUFFERUSAGE_VERTEX@, defined at @SDL3\/SDL_gpu.h 986:9@
sDL_GPU_BUFFERUSAGE_VERTEX :: BG.CUInt
sDL_GPU_BUFFERUSAGE_VERTEX =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (0 :: BG.CInt)

-- | Buffer is an index buffer.
--
--     [C declaration]: @macro SDL_GPU_BUFFERUSAGE_INDEX@, defined at @SDL3\/SDL_gpu.h 987:9@
sDL_GPU_BUFFERUSAGE_INDEX :: BG.CUInt
sDL_GPU_BUFFERUSAGE_INDEX =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (1 :: BG.CInt)

-- | Buffer is an indirect buffer.
--
--     [C declaration]: @macro SDL_GPU_BUFFERUSAGE_INDIRECT@, defined at @SDL3\/SDL_gpu.h 988:9@
sDL_GPU_BUFFERUSAGE_INDIRECT :: BG.CUInt
sDL_GPU_BUFFERUSAGE_INDIRECT =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (2 :: BG.CInt)

-- | Buffer supports storage reads in graphics stages.
--
--     [C declaration]: @macro SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ@, defined at @SDL3\/SDL_gpu.h 989:9@
sDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ :: BG.CUInt
sDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (3 :: BG.CInt)

-- | Buffer supports storage reads in the compute stage.
--
--     [C declaration]: @macro SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ@, defined at @SDL3\/SDL_gpu.h 990:9@
sDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ :: BG.CUInt
sDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (4 :: BG.CInt)

-- | Buffer supports storage writes in the compute stage.
--
--     [C declaration]: @macro SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE@, defined at @SDL3\/SDL_gpu.h 991:9@
sDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE :: BG.CUInt
sDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (5 :: BG.CInt)

-- | Specifies how a transfer buffer is intended to be used by the client.
--
--     Note that mapping and copying FROM an upload transfer buffer or TO a download transfer buffer is undefined behavior.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTransferBuffer'
--
--     [C declaration]: @enum SDL_GPUTransferBufferUsage@, defined at @SDL3\/SDL_gpu.h 1003:14@
newtype SDL_GPUTransferBufferUsage = SDL_GPUTransferBufferUsage
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUTransferBufferUsage where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUTransferBufferUsage where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTransferBufferUsage
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUTransferBufferUsage where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTransferBufferUsage unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_GPUTransferBufferUsage
  instance
    BG.Storable SDL_GPUTransferBufferUsage

deriving via BG.CUInt instance BG.Prim SDL_GPUTransferBufferUsage

instance CEnum.CEnum SDL_GPUTransferBufferUsage where
  type CEnumZ SDL_GPUTransferBufferUsage = BG.CUInt

  toCEnum = SDL_GPUTransferBufferUsage

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD")
        , (1, BG.singleton "SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUTransferBufferUsage"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUTransferBufferUsage"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUTransferBufferUsage where
  minDeclaredValue = SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD

  maxDeclaredValue =
    SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD

instance Show SDL_GPUTransferBufferUsage where
  showsPrec = CEnum.shows

instance Read SDL_GPUTransferBufferUsage where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUTransferBufferUsage ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTransferBufferUsage{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUTransferBufferUsage) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUTransferBufferUsage "unwrap" where
  type
    CFieldType SDL_GPUTransferBufferUsage "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD@, defined at @SDL3\/SDL_gpu.h 1005:5@
pattern SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD :: SDL_GPUTransferBufferUsage
pattern SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD = SDL_GPUTransferBufferUsage 0

-- | [C declaration]: @SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD@, defined at @SDL3\/SDL_gpu.h 1006:5@
pattern SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD :: SDL_GPUTransferBufferUsage
pattern SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD = SDL_GPUTransferBufferUsage 1

-- | Specifies which stage a shader program corresponds to.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @enum SDL_GPUShaderStage@, defined at @SDL3\/SDL_gpu.h 1016:14@
newtype SDL_GPUShaderStage = SDL_GPUShaderStage
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUShaderStage where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUShaderStage where
  readRaw =
    \ptr0 ->
      pure SDL_GPUShaderStage
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUShaderStage where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUShaderStage unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUShaderStage instance BG.Storable SDL_GPUShaderStage

deriving via BG.CUInt instance BG.Prim SDL_GPUShaderStage

instance CEnum.CEnum SDL_GPUShaderStage where
  type CEnumZ SDL_GPUShaderStage = BG.CUInt

  toCEnum = SDL_GPUShaderStage

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_SHADERSTAGE_VERTEX")
        , (1, BG.singleton "SDL_GPU_SHADERSTAGE_FRAGMENT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUShaderStage"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUShaderStage"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUShaderStage where
  minDeclaredValue = SDL_GPU_SHADERSTAGE_VERTEX

  maxDeclaredValue = SDL_GPU_SHADERSTAGE_FRAGMENT

instance Show SDL_GPUShaderStage where
  showsPrec = CEnum.shows

instance Read SDL_GPUShaderStage where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUShaderStage ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderStage{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUShaderStage) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUShaderStage "unwrap" where
  type
    CFieldType SDL_GPUShaderStage "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_SHADERSTAGE_VERTEX@, defined at @SDL3\/SDL_gpu.h 1018:5@
pattern SDL_GPU_SHADERSTAGE_VERTEX :: SDL_GPUShaderStage
pattern SDL_GPU_SHADERSTAGE_VERTEX = SDL_GPUShaderStage 0

-- | [C declaration]: @SDL_GPU_SHADERSTAGE_FRAGMENT@, defined at @SDL3\/SDL_gpu.h 1019:5@
pattern SDL_GPU_SHADERSTAGE_FRAGMENT :: SDL_GPUShaderStage
pattern SDL_GPU_SHADERSTAGE_FRAGMENT = SDL_GPUShaderStage 1

-- | Specifies the format of shader code.
--
--     Each format corresponds to a specific backend that accepts it.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_GPUShaderFormat@, defined at @SDL3\/SDL_gpu.h 1031:16@
newtype SDL_GPUShaderFormat = SDL_GPUShaderFormat
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUShaderFormat ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderFormat{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUShaderFormat) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUShaderFormat "unwrap" where
  type
    CFieldType SDL_GPUShaderFormat "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @macro SDL_GPU_SHADERFORMAT_INVALID@, defined at @SDL3\/SDL_gpu.h 1033:9@
sDL_GPU_SHADERFORMAT_INVALID :: BG.CInt
sDL_GPU_SHADERFORMAT_INVALID = (0 :: BG.CInt)

-- | Shaders for NDA\'d platforms.
--
--     [C declaration]: @macro SDL_GPU_SHADERFORMAT_PRIVATE@, defined at @SDL3\/SDL_gpu.h 1034:9@
sDL_GPU_SHADERFORMAT_PRIVATE :: BG.CUInt
sDL_GPU_SHADERFORMAT_PRIVATE =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (0 :: BG.CInt)

-- | SPIR-V shaders for Vulkan.
--
--     [C declaration]: @macro SDL_GPU_SHADERFORMAT_SPIRV@, defined at @SDL3\/SDL_gpu.h 1035:9@
sDL_GPU_SHADERFORMAT_SPIRV :: BG.CUInt
sDL_GPU_SHADERFORMAT_SPIRV =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (1 :: BG.CInt)

-- | DXBC SM5_1 shaders for D3D12.
--
--     [C declaration]: @macro SDL_GPU_SHADERFORMAT_DXBC@, defined at @SDL3\/SDL_gpu.h 1036:9@
sDL_GPU_SHADERFORMAT_DXBC :: BG.CUInt
sDL_GPU_SHADERFORMAT_DXBC =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (2 :: BG.CInt)

-- | DXIL SM6_0 shaders for D3D12.
--
--     [C declaration]: @macro SDL_GPU_SHADERFORMAT_DXIL@, defined at @SDL3\/SDL_gpu.h 1037:9@
sDL_GPU_SHADERFORMAT_DXIL :: BG.CUInt
sDL_GPU_SHADERFORMAT_DXIL =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (3 :: BG.CInt)

-- | MSL shaders for Metal.
--
--     [C declaration]: @macro SDL_GPU_SHADERFORMAT_MSL@, defined at @SDL3\/SDL_gpu.h 1038:9@
sDL_GPU_SHADERFORMAT_MSL :: BG.CUInt
sDL_GPU_SHADERFORMAT_MSL =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (4 :: BG.CInt)

-- | Precompiled metallib shaders for Metal.
--
--     [C declaration]: @macro SDL_GPU_SHADERFORMAT_METALLIB@, defined at @SDL3\/SDL_gpu.h 1039:9@
sDL_GPU_SHADERFORMAT_METALLIB :: BG.CUInt
sDL_GPU_SHADERFORMAT_METALLIB =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (5 :: BG.CInt)

-- | Specifies the format of a vertex attribute.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUVertexElementFormat@, defined at @SDL3\/SDL_gpu.h 1048:14@
newtype SDL_GPUVertexElementFormat = SDL_GPUVertexElementFormat
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUVertexElementFormat where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUVertexElementFormat where
  readRaw =
    \ptr0 ->
      pure SDL_GPUVertexElementFormat
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUVertexElementFormat where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUVertexElementFormat unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_GPUVertexElementFormat
  instance
    BG.Storable SDL_GPUVertexElementFormat

deriving via BG.CUInt instance BG.Prim SDL_GPUVertexElementFormat

instance CEnum.CEnum SDL_GPUVertexElementFormat where
  type CEnumZ SDL_GPUVertexElementFormat = BG.CUInt

  toCEnum = SDL_GPUVertexElementFormat

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_INVALID")
        , (1, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_INT")
        , (2, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_INT2")
        , (3, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_INT3")
        , (4, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_INT4")
        , (5, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_UINT")
        , (6, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_UINT2")
        , (7, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_UINT3")
        , (8, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_UINT4")
        , (9, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_FLOAT")
        , (10, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2")
        , (11, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3")
        , (12, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4")
        , (13, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_BYTE2")
        , (14, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_BYTE4")
        , (15, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2")
        , (16, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4")
        , (17, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM")
        , (18, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM")
        , (19, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM")
        , (20, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM")
        , (21, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_SHORT2")
        , (22, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_SHORT4")
        , (23, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_USHORT2")
        , (24, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_USHORT4")
        , (25, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM")
        , (26, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM")
        , (27, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM")
        , (28, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM")
        , (29, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_HALF2")
        , (30, BG.singleton "SDL_GPU_VERTEXELEMENTFORMAT_HALF4")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUVertexElementFormat"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUVertexElementFormat"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUVertexElementFormat where
  minDeclaredValue =
    SDL_GPU_VERTEXELEMENTFORMAT_INVALID

  maxDeclaredValue = SDL_GPU_VERTEXELEMENTFORMAT_HALF4

instance Show SDL_GPUVertexElementFormat where
  showsPrec = CEnum.shows

instance Read SDL_GPUVertexElementFormat where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUVertexElementFormat ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexElementFormat{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUVertexElementFormat) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUVertexElementFormat "unwrap" where
  type
    CFieldType SDL_GPUVertexElementFormat "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_INVALID@, defined at @SDL3\/SDL_gpu.h 1050:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_INVALID :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_INVALID = SDL_GPUVertexElementFormat 0

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_INT@, defined at @SDL3\/SDL_gpu.h 1053:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_INT :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_INT = SDL_GPUVertexElementFormat 1

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_INT2@, defined at @SDL3\/SDL_gpu.h 1054:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_INT2 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_INT2 = SDL_GPUVertexElementFormat 2

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_INT3@, defined at @SDL3\/SDL_gpu.h 1055:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_INT3 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_INT3 = SDL_GPUVertexElementFormat 3

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_INT4@, defined at @SDL3\/SDL_gpu.h 1056:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_INT4 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_INT4 = SDL_GPUVertexElementFormat 4

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_UINT@, defined at @SDL3\/SDL_gpu.h 1059:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_UINT :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_UINT = SDL_GPUVertexElementFormat 5

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_UINT2@, defined at @SDL3\/SDL_gpu.h 1060:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_UINT2 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_UINT2 = SDL_GPUVertexElementFormat 6

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_UINT3@, defined at @SDL3\/SDL_gpu.h 1061:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_UINT3 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_UINT3 = SDL_GPUVertexElementFormat 7

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_UINT4@, defined at @SDL3\/SDL_gpu.h 1062:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_UINT4 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_UINT4 = SDL_GPUVertexElementFormat 8

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_FLOAT@, defined at @SDL3\/SDL_gpu.h 1065:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_FLOAT :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_FLOAT = SDL_GPUVertexElementFormat 9

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2@, defined at @SDL3\/SDL_gpu.h 1066:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2 = SDL_GPUVertexElementFormat 10

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3@, defined at @SDL3\/SDL_gpu.h 1067:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3 = SDL_GPUVertexElementFormat 11

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4@, defined at @SDL3\/SDL_gpu.h 1068:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4 = SDL_GPUVertexElementFormat 12

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_BYTE2@, defined at @SDL3\/SDL_gpu.h 1071:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_BYTE2 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_BYTE2 = SDL_GPUVertexElementFormat 13

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_BYTE4@, defined at @SDL3\/SDL_gpu.h 1072:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_BYTE4 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_BYTE4 = SDL_GPUVertexElementFormat 14

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2@, defined at @SDL3\/SDL_gpu.h 1075:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2 = SDL_GPUVertexElementFormat 15

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4@, defined at @SDL3\/SDL_gpu.h 1076:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4 = SDL_GPUVertexElementFormat 16

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM@, defined at @SDL3\/SDL_gpu.h 1079:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM = SDL_GPUVertexElementFormat 17

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM@, defined at @SDL3\/SDL_gpu.h 1080:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM = SDL_GPUVertexElementFormat 18

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM@, defined at @SDL3\/SDL_gpu.h 1083:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM = SDL_GPUVertexElementFormat 19

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM@, defined at @SDL3\/SDL_gpu.h 1084:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM = SDL_GPUVertexElementFormat 20

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_SHORT2@, defined at @SDL3\/SDL_gpu.h 1087:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_SHORT2 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_SHORT2 = SDL_GPUVertexElementFormat 21

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_SHORT4@, defined at @SDL3\/SDL_gpu.h 1088:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_SHORT4 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_SHORT4 = SDL_GPUVertexElementFormat 22

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_USHORT2@, defined at @SDL3\/SDL_gpu.h 1091:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_USHORT2 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_USHORT2 = SDL_GPUVertexElementFormat 23

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_USHORT4@, defined at @SDL3\/SDL_gpu.h 1092:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_USHORT4 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_USHORT4 = SDL_GPUVertexElementFormat 24

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM@, defined at @SDL3\/SDL_gpu.h 1095:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM = SDL_GPUVertexElementFormat 25

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM@, defined at @SDL3\/SDL_gpu.h 1096:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM = SDL_GPUVertexElementFormat 26

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM@, defined at @SDL3\/SDL_gpu.h 1099:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM = SDL_GPUVertexElementFormat 27

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM@, defined at @SDL3\/SDL_gpu.h 1100:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM = SDL_GPUVertexElementFormat 28

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_HALF2@, defined at @SDL3\/SDL_gpu.h 1103:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_HALF2 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_HALF2 = SDL_GPUVertexElementFormat 29

-- | [C declaration]: @SDL_GPU_VERTEXELEMENTFORMAT_HALF4@, defined at @SDL3\/SDL_gpu.h 1104:5@
pattern SDL_GPU_VERTEXELEMENTFORMAT_HALF4 :: SDL_GPUVertexElementFormat
pattern SDL_GPU_VERTEXELEMENTFORMAT_HALF4 = SDL_GPUVertexElementFormat 30

-- | Specifies the rate at which vertex attributes are pulled from buffers.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUVertexInputRate@, defined at @SDL3\/SDL_gpu.h 1114:14@
newtype SDL_GPUVertexInputRate = SDL_GPUVertexInputRate
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUVertexInputRate where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUVertexInputRate where
  readRaw =
    \ptr0 ->
      pure SDL_GPUVertexInputRate
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUVertexInputRate where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUVertexInputRate unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_GPUVertexInputRate
  instance
    BG.Storable SDL_GPUVertexInputRate

deriving via BG.CUInt instance BG.Prim SDL_GPUVertexInputRate

instance CEnum.CEnum SDL_GPUVertexInputRate where
  type CEnumZ SDL_GPUVertexInputRate = BG.CUInt

  toCEnum = SDL_GPUVertexInputRate

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_VERTEXINPUTRATE_VERTEX")
        , (1, BG.singleton "SDL_GPU_VERTEXINPUTRATE_INSTANCE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUVertexInputRate"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUVertexInputRate"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUVertexInputRate where
  minDeclaredValue = SDL_GPU_VERTEXINPUTRATE_VERTEX

  maxDeclaredValue = SDL_GPU_VERTEXINPUTRATE_INSTANCE

instance Show SDL_GPUVertexInputRate where
  showsPrec = CEnum.shows

instance Read SDL_GPUVertexInputRate where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUVertexInputRate ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexInputRate{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUVertexInputRate) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUVertexInputRate "unwrap" where
  type
    CFieldType SDL_GPUVertexInputRate "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Attribute addressing is a function of the vertex index.
--
--     [C declaration]: @SDL_GPU_VERTEXINPUTRATE_VERTEX@, defined at @SDL3\/SDL_gpu.h 1116:5@
pattern SDL_GPU_VERTEXINPUTRATE_VERTEX :: SDL_GPUVertexInputRate
pattern SDL_GPU_VERTEXINPUTRATE_VERTEX = SDL_GPUVertexInputRate 0

-- | Attribute addressing is a function of the instance index.
--
--     [C declaration]: @SDL_GPU_VERTEXINPUTRATE_INSTANCE@, defined at @SDL3\/SDL_gpu.h 1117:5@
pattern SDL_GPU_VERTEXINPUTRATE_INSTANCE :: SDL_GPUVertexInputRate
pattern SDL_GPU_VERTEXINPUTRATE_INSTANCE = SDL_GPUVertexInputRate 1

-- | Specifies the fill mode of the graphics pipeline.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUFillMode@, defined at @SDL3\/SDL_gpu.h 1127:14@
newtype SDL_GPUFillMode = SDL_GPUFillMode
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUFillMode where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUFillMode where
  readRaw =
    \ptr0 ->
      pure SDL_GPUFillMode
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUFillMode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUFillMode unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUFillMode instance BG.Storable SDL_GPUFillMode

deriving via BG.CUInt instance BG.Prim SDL_GPUFillMode

instance CEnum.CEnum SDL_GPUFillMode where
  type CEnumZ SDL_GPUFillMode = BG.CUInt

  toCEnum = SDL_GPUFillMode

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_FILLMODE_FILL")
        , (1, BG.singleton "SDL_GPU_FILLMODE_LINE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUFillMode"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUFillMode"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUFillMode where
  minDeclaredValue = SDL_GPU_FILLMODE_FILL

  maxDeclaredValue = SDL_GPU_FILLMODE_LINE

instance Show SDL_GPUFillMode where
  showsPrec = CEnum.shows

instance Read SDL_GPUFillMode where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUFillMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUFillMode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUFillMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUFillMode "unwrap" where
  type CFieldType SDL_GPUFillMode "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Polygons will be rendered via rasterization.
--
--     [C declaration]: @SDL_GPU_FILLMODE_FILL@, defined at @SDL3\/SDL_gpu.h 1129:5@
pattern SDL_GPU_FILLMODE_FILL :: SDL_GPUFillMode
pattern SDL_GPU_FILLMODE_FILL = SDL_GPUFillMode 0

-- | Polygon edges will be drawn as line segments.
--
--     [C declaration]: @SDL_GPU_FILLMODE_LINE@, defined at @SDL3\/SDL_gpu.h 1130:5@
pattern SDL_GPU_FILLMODE_LINE :: SDL_GPUFillMode
pattern SDL_GPU_FILLMODE_LINE = SDL_GPUFillMode 1

-- | Specifies the facing direction in which triangle faces will be culled.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUCullMode@, defined at @SDL3\/SDL_gpu.h 1140:14@
newtype SDL_GPUCullMode = SDL_GPUCullMode
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUCullMode where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUCullMode where
  readRaw =
    \ptr0 ->
      pure SDL_GPUCullMode
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUCullMode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUCullMode unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUCullMode instance BG.Storable SDL_GPUCullMode

deriving via BG.CUInt instance BG.Prim SDL_GPUCullMode

instance CEnum.CEnum SDL_GPUCullMode where
  type CEnumZ SDL_GPUCullMode = BG.CUInt

  toCEnum = SDL_GPUCullMode

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_CULLMODE_NONE")
        , (1, BG.singleton "SDL_GPU_CULLMODE_FRONT")
        , (2, BG.singleton "SDL_GPU_CULLMODE_BACK")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUCullMode"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUCullMode"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUCullMode where
  minDeclaredValue = SDL_GPU_CULLMODE_NONE

  maxDeclaredValue = SDL_GPU_CULLMODE_BACK

instance Show SDL_GPUCullMode where
  showsPrec = CEnum.shows

instance Read SDL_GPUCullMode where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUCullMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUCullMode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUCullMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUCullMode "unwrap" where
  type CFieldType SDL_GPUCullMode "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | No triangles are culled.
--
--     [C declaration]: @SDL_GPU_CULLMODE_NONE@, defined at @SDL3\/SDL_gpu.h 1142:5@
pattern SDL_GPU_CULLMODE_NONE :: SDL_GPUCullMode
pattern SDL_GPU_CULLMODE_NONE = SDL_GPUCullMode 0

-- | Front-facing triangles are culled.
--
--     [C declaration]: @SDL_GPU_CULLMODE_FRONT@, defined at @SDL3\/SDL_gpu.h 1143:5@
pattern SDL_GPU_CULLMODE_FRONT :: SDL_GPUCullMode
pattern SDL_GPU_CULLMODE_FRONT = SDL_GPUCullMode 1

-- | Back-facing triangles are culled.
--
--     [C declaration]: @SDL_GPU_CULLMODE_BACK@, defined at @SDL3\/SDL_gpu.h 1144:5@
pattern SDL_GPU_CULLMODE_BACK :: SDL_GPUCullMode
pattern SDL_GPU_CULLMODE_BACK = SDL_GPUCullMode 2

-- | Specifies the vertex winding that will cause a triangle to be determined to be front-facing.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUFrontFace@, defined at @SDL3\/SDL_gpu.h 1155:14@
newtype SDL_GPUFrontFace = SDL_GPUFrontFace
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUFrontFace where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUFrontFace where
  readRaw =
    \ptr0 ->
      pure SDL_GPUFrontFace
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUFrontFace where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUFrontFace unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUFrontFace instance BG.Storable SDL_GPUFrontFace

deriving via BG.CUInt instance BG.Prim SDL_GPUFrontFace

instance CEnum.CEnum SDL_GPUFrontFace where
  type CEnumZ SDL_GPUFrontFace = BG.CUInt

  toCEnum = SDL_GPUFrontFace

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE")
        , (1, BG.singleton "SDL_GPU_FRONTFACE_CLOCKWISE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUFrontFace"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUFrontFace"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUFrontFace where
  minDeclaredValue =
    SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE

  maxDeclaredValue = SDL_GPU_FRONTFACE_CLOCKWISE

instance Show SDL_GPUFrontFace where
  showsPrec = CEnum.shows

instance Read SDL_GPUFrontFace where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUFrontFace ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUFrontFace{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUFrontFace) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUFrontFace "unwrap" where
  type CFieldType SDL_GPUFrontFace "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | A triangle with counter-clockwise vertex winding will be considered front-facing.
--
--     [C declaration]: @SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE@, defined at @SDL3\/SDL_gpu.h 1157:5@
pattern SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE :: SDL_GPUFrontFace
pattern SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE = SDL_GPUFrontFace 0

-- | A triangle with clockwise vertex winding will be considered front-facing.
--
--     [C declaration]: @SDL_GPU_FRONTFACE_CLOCKWISE@, defined at @SDL3\/SDL_gpu.h 1158:5@
pattern SDL_GPU_FRONTFACE_CLOCKWISE :: SDL_GPUFrontFace
pattern SDL_GPU_FRONTFACE_CLOCKWISE = SDL_GPUFrontFace 1

-- | Specifies a comparison operator for depth, stencil and sampler operations.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUCompareOp@, defined at @SDL3\/SDL_gpu.h 1168:14@
newtype SDL_GPUCompareOp = SDL_GPUCompareOp
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUCompareOp where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUCompareOp where
  readRaw =
    \ptr0 ->
      pure SDL_GPUCompareOp
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUCompareOp where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUCompareOp unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUCompareOp instance BG.Storable SDL_GPUCompareOp

deriving via BG.CUInt instance BG.Prim SDL_GPUCompareOp

instance CEnum.CEnum SDL_GPUCompareOp where
  type CEnumZ SDL_GPUCompareOp = BG.CUInt

  toCEnum = SDL_GPUCompareOp

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_COMPAREOP_INVALID")
        , (1, BG.singleton "SDL_GPU_COMPAREOP_NEVER")
        , (2, BG.singleton "SDL_GPU_COMPAREOP_LESS")
        , (3, BG.singleton "SDL_GPU_COMPAREOP_EQUAL")
        , (4, BG.singleton "SDL_GPU_COMPAREOP_LESS_OR_EQUAL")
        , (5, BG.singleton "SDL_GPU_COMPAREOP_GREATER")
        , (6, BG.singleton "SDL_GPU_COMPAREOP_NOT_EQUAL")
        , (7, BG.singleton "SDL_GPU_COMPAREOP_GREATER_OR_EQUAL")
        , (8, BG.singleton "SDL_GPU_COMPAREOP_ALWAYS")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUCompareOp"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUCompareOp"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUCompareOp where
  minDeclaredValue = SDL_GPU_COMPAREOP_INVALID

  maxDeclaredValue = SDL_GPU_COMPAREOP_ALWAYS

instance Show SDL_GPUCompareOp where
  showsPrec = CEnum.shows

instance Read SDL_GPUCompareOp where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUCompareOp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUCompareOp{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUCompareOp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUCompareOp "unwrap" where
  type CFieldType SDL_GPUCompareOp "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_COMPAREOP_INVALID@, defined at @SDL3\/SDL_gpu.h 1170:5@
pattern SDL_GPU_COMPAREOP_INVALID :: SDL_GPUCompareOp
pattern SDL_GPU_COMPAREOP_INVALID = SDL_GPUCompareOp 0

-- | The comparison always evaluates false.
--
--     [C declaration]: @SDL_GPU_COMPAREOP_NEVER@, defined at @SDL3\/SDL_gpu.h 1171:5@
pattern SDL_GPU_COMPAREOP_NEVER :: SDL_GPUCompareOp
pattern SDL_GPU_COMPAREOP_NEVER = SDL_GPUCompareOp 1

-- | The comparison evaluates reference \< test.
--
--     [C declaration]: @SDL_GPU_COMPAREOP_LESS@, defined at @SDL3\/SDL_gpu.h 1172:5@
pattern SDL_GPU_COMPAREOP_LESS :: SDL_GPUCompareOp
pattern SDL_GPU_COMPAREOP_LESS = SDL_GPUCompareOp 2

-- | The comparison evaluates reference == test.
--
--     [C declaration]: @SDL_GPU_COMPAREOP_EQUAL@, defined at @SDL3\/SDL_gpu.h 1173:5@
pattern SDL_GPU_COMPAREOP_EQUAL :: SDL_GPUCompareOp
pattern SDL_GPU_COMPAREOP_EQUAL = SDL_GPUCompareOp 3

-- | The comparison evaluates reference \<= test.
--
--     [C declaration]: @SDL_GPU_COMPAREOP_LESS_OR_EQUAL@, defined at @SDL3\/SDL_gpu.h 1174:5@
pattern SDL_GPU_COMPAREOP_LESS_OR_EQUAL :: SDL_GPUCompareOp
pattern SDL_GPU_COMPAREOP_LESS_OR_EQUAL = SDL_GPUCompareOp 4

-- | The comparison evaluates reference > test.
--
--     [C declaration]: @SDL_GPU_COMPAREOP_GREATER@, defined at @SDL3\/SDL_gpu.h 1175:5@
pattern SDL_GPU_COMPAREOP_GREATER :: SDL_GPUCompareOp
pattern SDL_GPU_COMPAREOP_GREATER = SDL_GPUCompareOp 5

-- | The comparison evaluates reference != test.
--
--     [C declaration]: @SDL_GPU_COMPAREOP_NOT_EQUAL@, defined at @SDL3\/SDL_gpu.h 1176:5@
pattern SDL_GPU_COMPAREOP_NOT_EQUAL :: SDL_GPUCompareOp
pattern SDL_GPU_COMPAREOP_NOT_EQUAL = SDL_GPUCompareOp 6

-- | The comparison evaluates reference >= test.
--
--     [C declaration]: @SDL_GPU_COMPAREOP_GREATER_OR_EQUAL@, defined at @SDL3\/SDL_gpu.h 1177:5@
pattern SDL_GPU_COMPAREOP_GREATER_OR_EQUAL :: SDL_GPUCompareOp
pattern SDL_GPU_COMPAREOP_GREATER_OR_EQUAL = SDL_GPUCompareOp 7

-- | The comparison always evaluates true.
--
--     [C declaration]: @SDL_GPU_COMPAREOP_ALWAYS@, defined at @SDL3\/SDL_gpu.h 1178:5@
pattern SDL_GPU_COMPAREOP_ALWAYS :: SDL_GPUCompareOp
pattern SDL_GPU_COMPAREOP_ALWAYS = SDL_GPUCompareOp 8

-- | Specifies what happens to a stored stencil value if stencil tests fail or pass.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUStencilOp@, defined at @SDL3\/SDL_gpu.h 1189:14@
newtype SDL_GPUStencilOp = SDL_GPUStencilOp
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUStencilOp where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUStencilOp where
  readRaw =
    \ptr0 ->
      pure SDL_GPUStencilOp
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUStencilOp where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUStencilOp unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUStencilOp instance BG.Storable SDL_GPUStencilOp

deriving via BG.CUInt instance BG.Prim SDL_GPUStencilOp

instance CEnum.CEnum SDL_GPUStencilOp where
  type CEnumZ SDL_GPUStencilOp = BG.CUInt

  toCEnum = SDL_GPUStencilOp

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_STENCILOP_INVALID")
        , (1, BG.singleton "SDL_GPU_STENCILOP_KEEP")
        , (2, BG.singleton "SDL_GPU_STENCILOP_ZERO")
        , (3, BG.singleton "SDL_GPU_STENCILOP_REPLACE")
        , (4, BG.singleton "SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP")
        , (5, BG.singleton "SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP")
        , (6, BG.singleton "SDL_GPU_STENCILOP_INVERT")
        , (7, BG.singleton "SDL_GPU_STENCILOP_INCREMENT_AND_WRAP")
        , (8, BG.singleton "SDL_GPU_STENCILOP_DECREMENT_AND_WRAP")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUStencilOp"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUStencilOp"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUStencilOp where
  minDeclaredValue = SDL_GPU_STENCILOP_INVALID

  maxDeclaredValue =
    SDL_GPU_STENCILOP_DECREMENT_AND_WRAP

instance Show SDL_GPUStencilOp where
  showsPrec = CEnum.shows

instance Read SDL_GPUStencilOp where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUStencilOp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStencilOp{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUStencilOp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUStencilOp "unwrap" where
  type CFieldType SDL_GPUStencilOp "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_STENCILOP_INVALID@, defined at @SDL3\/SDL_gpu.h 1191:5@
pattern SDL_GPU_STENCILOP_INVALID :: SDL_GPUStencilOp
pattern SDL_GPU_STENCILOP_INVALID = SDL_GPUStencilOp 0

-- | Keeps the current value.
--
--     [C declaration]: @SDL_GPU_STENCILOP_KEEP@, defined at @SDL3\/SDL_gpu.h 1192:5@
pattern SDL_GPU_STENCILOP_KEEP :: SDL_GPUStencilOp
pattern SDL_GPU_STENCILOP_KEEP = SDL_GPUStencilOp 1

-- | Sets the value to 0.
--
--     [C declaration]: @SDL_GPU_STENCILOP_ZERO@, defined at @SDL3\/SDL_gpu.h 1193:5@
pattern SDL_GPU_STENCILOP_ZERO :: SDL_GPUStencilOp
pattern SDL_GPU_STENCILOP_ZERO = SDL_GPUStencilOp 2

-- | Sets the value to reference.
--
--     [C declaration]: @SDL_GPU_STENCILOP_REPLACE@, defined at @SDL3\/SDL_gpu.h 1194:5@
pattern SDL_GPU_STENCILOP_REPLACE :: SDL_GPUStencilOp
pattern SDL_GPU_STENCILOP_REPLACE = SDL_GPUStencilOp 3

-- | Increments the current value and clamps to the maximum value.
--
--     [C declaration]: @SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP@, defined at @SDL3\/SDL_gpu.h 1195:5@
pattern SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP :: SDL_GPUStencilOp
pattern SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP = SDL_GPUStencilOp 4

-- | Decrements the current value and clamps to 0.
--
--     [C declaration]: @SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP@, defined at @SDL3\/SDL_gpu.h 1196:5@
pattern SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP :: SDL_GPUStencilOp
pattern SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP = SDL_GPUStencilOp 5

-- | Bitwise-inverts the current value.
--
--     [C declaration]: @SDL_GPU_STENCILOP_INVERT@, defined at @SDL3\/SDL_gpu.h 1197:5@
pattern SDL_GPU_STENCILOP_INVERT :: SDL_GPUStencilOp
pattern SDL_GPU_STENCILOP_INVERT = SDL_GPUStencilOp 6

-- | Increments the current value and wraps back to 0.
--
--     [C declaration]: @SDL_GPU_STENCILOP_INCREMENT_AND_WRAP@, defined at @SDL3\/SDL_gpu.h 1198:5@
pattern SDL_GPU_STENCILOP_INCREMENT_AND_WRAP :: SDL_GPUStencilOp
pattern SDL_GPU_STENCILOP_INCREMENT_AND_WRAP = SDL_GPUStencilOp 7

-- | Decrements the current value and wraps to the maximum value.
--
--     [C declaration]: @SDL_GPU_STENCILOP_DECREMENT_AND_WRAP@, defined at @SDL3\/SDL_gpu.h 1199:5@
pattern SDL_GPU_STENCILOP_DECREMENT_AND_WRAP :: SDL_GPUStencilOp
pattern SDL_GPU_STENCILOP_DECREMENT_AND_WRAP = SDL_GPUStencilOp 8

-- | Specifies the operator to be used when pixels in a render target are blended with existing pixels in the texture.
--
--     The source color is the value written by the fragment shader. The destination color is the value currently existing in the texture.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUBlendOp@, defined at @SDL3\/SDL_gpu.h 1213:14@
newtype SDL_GPUBlendOp = SDL_GPUBlendOp
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUBlendOp where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUBlendOp where
  readRaw =
    \ptr0 ->
      pure SDL_GPUBlendOp
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUBlendOp where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUBlendOp unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUBlendOp instance BG.Storable SDL_GPUBlendOp

deriving via BG.CUInt instance BG.Prim SDL_GPUBlendOp

instance CEnum.CEnum SDL_GPUBlendOp where
  type CEnumZ SDL_GPUBlendOp = BG.CUInt

  toCEnum = SDL_GPUBlendOp

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_BLENDOP_INVALID")
        , (1, BG.singleton "SDL_GPU_BLENDOP_ADD")
        , (2, BG.singleton "SDL_GPU_BLENDOP_SUBTRACT")
        , (3, BG.singleton "SDL_GPU_BLENDOP_REVERSE_SUBTRACT")
        , (4, BG.singleton "SDL_GPU_BLENDOP_MIN")
        , (5, BG.singleton "SDL_GPU_BLENDOP_MAX")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUBlendOp"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUBlendOp"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUBlendOp where
  minDeclaredValue = SDL_GPU_BLENDOP_INVALID

  maxDeclaredValue = SDL_GPU_BLENDOP_MAX

instance Show SDL_GPUBlendOp where
  showsPrec = CEnum.shows

instance Read SDL_GPUBlendOp where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUBlendOp ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlendOp{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUBlendOp) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUBlendOp "unwrap" where
  type CFieldType SDL_GPUBlendOp "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_BLENDOP_INVALID@, defined at @SDL3\/SDL_gpu.h 1215:5@
pattern SDL_GPU_BLENDOP_INVALID :: SDL_GPUBlendOp
pattern SDL_GPU_BLENDOP_INVALID = SDL_GPUBlendOp 0

-- | (source * source_factor) + (destination * destination_factor)
--
--     [C declaration]: @SDL_GPU_BLENDOP_ADD@, defined at @SDL3\/SDL_gpu.h 1216:5@
pattern SDL_GPU_BLENDOP_ADD :: SDL_GPUBlendOp
pattern SDL_GPU_BLENDOP_ADD = SDL_GPUBlendOp 1

-- | (source * source_factor) - (destination * destination_factor)
--
--     [C declaration]: @SDL_GPU_BLENDOP_SUBTRACT@, defined at @SDL3\/SDL_gpu.h 1217:5@
pattern SDL_GPU_BLENDOP_SUBTRACT :: SDL_GPUBlendOp
pattern SDL_GPU_BLENDOP_SUBTRACT = SDL_GPUBlendOp 2

-- | (destination * destination_factor) - (source * source_factor)
--
--     [C declaration]: @SDL_GPU_BLENDOP_REVERSE_SUBTRACT@, defined at @SDL3\/SDL_gpu.h 1218:5@
pattern SDL_GPU_BLENDOP_REVERSE_SUBTRACT :: SDL_GPUBlendOp
pattern SDL_GPU_BLENDOP_REVERSE_SUBTRACT = SDL_GPUBlendOp 3

-- | min(source, destination)
--
--     [C declaration]: @SDL_GPU_BLENDOP_MIN@, defined at @SDL3\/SDL_gpu.h 1219:5@
pattern SDL_GPU_BLENDOP_MIN :: SDL_GPUBlendOp
pattern SDL_GPU_BLENDOP_MIN = SDL_GPUBlendOp 4

-- | max(source, destination)
--
--     [C declaration]: @SDL_GPU_BLENDOP_MAX@, defined at @SDL3\/SDL_gpu.h 1220:5@
pattern SDL_GPU_BLENDOP_MAX :: SDL_GPUBlendOp
pattern SDL_GPU_BLENDOP_MAX = SDL_GPUBlendOp 5

-- | Specifies a blending factor to be used when pixels in a render target are blended with existing pixels in the texture.
--
--     The source color is the value written by the fragment shader. The destination color is the value currently existing in the texture.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @enum SDL_GPUBlendFactor@, defined at @SDL3\/SDL_gpu.h 1234:14@
newtype SDL_GPUBlendFactor = SDL_GPUBlendFactor
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUBlendFactor where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUBlendFactor where
  readRaw =
    \ptr0 ->
      pure SDL_GPUBlendFactor
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUBlendFactor where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUBlendFactor unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUBlendFactor instance BG.Storable SDL_GPUBlendFactor

deriving via BG.CUInt instance BG.Prim SDL_GPUBlendFactor

instance CEnum.CEnum SDL_GPUBlendFactor where
  type CEnumZ SDL_GPUBlendFactor = BG.CUInt

  toCEnum = SDL_GPUBlendFactor

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_BLENDFACTOR_INVALID")
        , (1, BG.singleton "SDL_GPU_BLENDFACTOR_ZERO")
        , (2, BG.singleton "SDL_GPU_BLENDFACTOR_ONE")
        , (3, BG.singleton "SDL_GPU_BLENDFACTOR_SRC_COLOR")
        , (4, BG.singleton "SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR")
        , (5, BG.singleton "SDL_GPU_BLENDFACTOR_DST_COLOR")
        , (6, BG.singleton "SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR")
        , (7, BG.singleton "SDL_GPU_BLENDFACTOR_SRC_ALPHA")
        , (8, BG.singleton "SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA")
        , (9, BG.singleton "SDL_GPU_BLENDFACTOR_DST_ALPHA")
        , (10, BG.singleton "SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA")
        , (11, BG.singleton "SDL_GPU_BLENDFACTOR_CONSTANT_COLOR")
        , (12, BG.singleton "SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR")
        , (13, BG.singleton "SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUBlendFactor"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUBlendFactor"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUBlendFactor where
  minDeclaredValue = SDL_GPU_BLENDFACTOR_INVALID

  maxDeclaredValue =
    SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE

instance Show SDL_GPUBlendFactor where
  showsPrec = CEnum.shows

instance Read SDL_GPUBlendFactor where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUBlendFactor ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlendFactor{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUBlendFactor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUBlendFactor "unwrap" where
  type
    CFieldType SDL_GPUBlendFactor "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_BLENDFACTOR_INVALID@, defined at @SDL3\/SDL_gpu.h 1236:5@
pattern SDL_GPU_BLENDFACTOR_INVALID :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_INVALID = SDL_GPUBlendFactor 0

-- | 0
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_ZERO@, defined at @SDL3\/SDL_gpu.h 1237:5@
pattern SDL_GPU_BLENDFACTOR_ZERO :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_ZERO = SDL_GPUBlendFactor 1

-- | 1
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_ONE@, defined at @SDL3\/SDL_gpu.h 1238:5@
pattern SDL_GPU_BLENDFACTOR_ONE :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_ONE = SDL_GPUBlendFactor 2

-- | source color
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_SRC_COLOR@, defined at @SDL3\/SDL_gpu.h 1239:5@
pattern SDL_GPU_BLENDFACTOR_SRC_COLOR :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_SRC_COLOR = SDL_GPUBlendFactor 3

-- | 1 - source color
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR@, defined at @SDL3\/SDL_gpu.h 1240:5@
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR = SDL_GPUBlendFactor 4

-- | destination color
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_DST_COLOR@, defined at @SDL3\/SDL_gpu.h 1241:5@
pattern SDL_GPU_BLENDFACTOR_DST_COLOR :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_DST_COLOR = SDL_GPUBlendFactor 5

-- | 1 - destination color
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR@, defined at @SDL3\/SDL_gpu.h 1242:5@
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR = SDL_GPUBlendFactor 6

-- | source alpha
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_SRC_ALPHA@, defined at @SDL3\/SDL_gpu.h 1243:5@
pattern SDL_GPU_BLENDFACTOR_SRC_ALPHA :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_SRC_ALPHA = SDL_GPUBlendFactor 7

-- | 1 - source alpha
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA@, defined at @SDL3\/SDL_gpu.h 1244:5@
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = SDL_GPUBlendFactor 8

-- | destination alpha
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_DST_ALPHA@, defined at @SDL3\/SDL_gpu.h 1245:5@
pattern SDL_GPU_BLENDFACTOR_DST_ALPHA :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_DST_ALPHA = SDL_GPUBlendFactor 9

-- | 1 - destination alpha
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA@, defined at @SDL3\/SDL_gpu.h 1246:5@
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA = SDL_GPUBlendFactor 10

-- | blend constant
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_CONSTANT_COLOR@, defined at @SDL3\/SDL_gpu.h 1247:5@
pattern SDL_GPU_BLENDFACTOR_CONSTANT_COLOR :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_CONSTANT_COLOR = SDL_GPUBlendFactor 11

-- | 1 - blend constant
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR@, defined at @SDL3\/SDL_gpu.h 1248:5@
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR = SDL_GPUBlendFactor 12

-- | min(source alpha, 1 - destination alpha)
--
--     [C declaration]: @SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE@, defined at @SDL3\/SDL_gpu.h 1249:5@
pattern SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE :: SDL_GPUBlendFactor
pattern SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE = SDL_GPUBlendFactor 13

-- | Specifies which color components are written in a graphics pipeline.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline'
--
--     [C declaration]: @SDL_GPUColorComponentFlags@, defined at @SDL3\/SDL_gpu.h 1259:15@
newtype SDL_GPUColorComponentFlags = SDL_GPUColorComponentFlags
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint8
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUColorComponentFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorComponentFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUColorComponentFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUColorComponentFlags "unwrap" where
  type
    CFieldType SDL_GPUColorComponentFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 0

-- | the red component
--
--     [C declaration]: @macro SDL_GPU_COLORCOMPONENT_R@, defined at @SDL3\/SDL_gpu.h 1261:9@
sDL_GPU_COLORCOMPONENT_R :: BG.CUInt
sDL_GPU_COLORCOMPONENT_R =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (0 :: BG.CInt)

-- | the green component
--
--     [C declaration]: @macro SDL_GPU_COLORCOMPONENT_G@, defined at @SDL3\/SDL_gpu.h 1262:9@
sDL_GPU_COLORCOMPONENT_G :: BG.CUInt
sDL_GPU_COLORCOMPONENT_G =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (1 :: BG.CInt)

-- | the blue component
--
--     [C declaration]: @macro SDL_GPU_COLORCOMPONENT_B@, defined at @SDL3\/SDL_gpu.h 1263:9@
sDL_GPU_COLORCOMPONENT_B :: BG.CUInt
sDL_GPU_COLORCOMPONENT_B =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (2 :: BG.CInt)

-- | the alpha component
--
--     [C declaration]: @macro SDL_GPU_COLORCOMPONENT_A@, defined at @SDL3\/SDL_gpu.h 1264:9@
sDL_GPU_COLORCOMPONENT_A :: BG.CUInt
sDL_GPU_COLORCOMPONENT_A =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (3 :: BG.CInt)

-- | Specifies a filter operation used by a sampler.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUSampler'
--
--     [C declaration]: @enum SDL_GPUFilter@, defined at @SDL3\/SDL_gpu.h 1273:14@
newtype SDL_GPUFilter = SDL_GPUFilter
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUFilter where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUFilter where
  readRaw =
    \ptr0 ->
      pure SDL_GPUFilter
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUFilter where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUFilter unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUFilter instance BG.Storable SDL_GPUFilter

deriving via BG.CUInt instance BG.Prim SDL_GPUFilter

instance CEnum.CEnum SDL_GPUFilter where
  type CEnumZ SDL_GPUFilter = BG.CUInt

  toCEnum = SDL_GPUFilter

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_FILTER_NEAREST")
        , (1, BG.singleton "SDL_GPU_FILTER_LINEAR")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUFilter"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUFilter"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUFilter where
  minDeclaredValue = SDL_GPU_FILTER_NEAREST

  maxDeclaredValue = SDL_GPU_FILTER_LINEAR

instance Show SDL_GPUFilter where
  showsPrec = CEnum.shows

instance Read SDL_GPUFilter where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUFilter ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUFilter{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUFilter) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUFilter "unwrap" where
  type CFieldType SDL_GPUFilter "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Point filtering.
--
--     [C declaration]: @SDL_GPU_FILTER_NEAREST@, defined at @SDL3\/SDL_gpu.h 1275:5@
pattern SDL_GPU_FILTER_NEAREST :: SDL_GPUFilter
pattern SDL_GPU_FILTER_NEAREST = SDL_GPUFilter 0

-- | Linear filtering.
--
--     [C declaration]: @SDL_GPU_FILTER_LINEAR@, defined at @SDL3\/SDL_gpu.h 1276:5@
pattern SDL_GPU_FILTER_LINEAR :: SDL_GPUFilter
pattern SDL_GPU_FILTER_LINEAR = SDL_GPUFilter 1

-- | Specifies a mipmap mode used by a sampler.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUSampler'
--
--     [C declaration]: @enum SDL_GPUSamplerMipmapMode@, defined at @SDL3\/SDL_gpu.h 1286:14@
newtype SDL_GPUSamplerMipmapMode = SDL_GPUSamplerMipmapMode
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUSamplerMipmapMode where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUSamplerMipmapMode where
  readRaw =
    \ptr0 ->
      pure SDL_GPUSamplerMipmapMode
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUSamplerMipmapMode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUSamplerMipmapMode unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_GPUSamplerMipmapMode
  instance
    BG.Storable SDL_GPUSamplerMipmapMode

deriving via BG.CUInt instance BG.Prim SDL_GPUSamplerMipmapMode

instance CEnum.CEnum SDL_GPUSamplerMipmapMode where
  type CEnumZ SDL_GPUSamplerMipmapMode = BG.CUInt

  toCEnum = SDL_GPUSamplerMipmapMode

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_SAMPLERMIPMAPMODE_NEAREST")
        , (1, BG.singleton "SDL_GPU_SAMPLERMIPMAPMODE_LINEAR")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUSamplerMipmapMode"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUSamplerMipmapMode"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUSamplerMipmapMode where
  minDeclaredValue = SDL_GPU_SAMPLERMIPMAPMODE_NEAREST

  maxDeclaredValue = SDL_GPU_SAMPLERMIPMAPMODE_LINEAR

instance Show SDL_GPUSamplerMipmapMode where
  showsPrec = CEnum.shows

instance Read SDL_GPUSamplerMipmapMode where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUSamplerMipmapMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerMipmapMode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUSamplerMipmapMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUSamplerMipmapMode "unwrap" where
  type
    CFieldType SDL_GPUSamplerMipmapMode "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Point filtering.
--
--     [C declaration]: @SDL_GPU_SAMPLERMIPMAPMODE_NEAREST@, defined at @SDL3\/SDL_gpu.h 1288:5@
pattern SDL_GPU_SAMPLERMIPMAPMODE_NEAREST :: SDL_GPUSamplerMipmapMode
pattern SDL_GPU_SAMPLERMIPMAPMODE_NEAREST = SDL_GPUSamplerMipmapMode 0

-- | Linear filtering.
--
--     [C declaration]: @SDL_GPU_SAMPLERMIPMAPMODE_LINEAR@, defined at @SDL3\/SDL_gpu.h 1289:5@
pattern SDL_GPU_SAMPLERMIPMAPMODE_LINEAR :: SDL_GPUSamplerMipmapMode
pattern SDL_GPU_SAMPLERMIPMAPMODE_LINEAR = SDL_GPUSamplerMipmapMode 1

-- | Specifies behavior of texture sampling when the coordinates exceed the 0-1 range.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUSampler'
--
--     [C declaration]: @enum SDL_GPUSamplerAddressMode@, defined at @SDL3\/SDL_gpu.h 1300:14@
newtype SDL_GPUSamplerAddressMode = SDL_GPUSamplerAddressMode
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUSamplerAddressMode where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUSamplerAddressMode where
  readRaw =
    \ptr0 ->
      pure SDL_GPUSamplerAddressMode
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUSamplerAddressMode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUSamplerAddressMode unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_GPUSamplerAddressMode
  instance
    BG.Storable SDL_GPUSamplerAddressMode

deriving via BG.CUInt instance BG.Prim SDL_GPUSamplerAddressMode

instance CEnum.CEnum SDL_GPUSamplerAddressMode where
  type CEnumZ SDL_GPUSamplerAddressMode = BG.CUInt

  toCEnum = SDL_GPUSamplerAddressMode

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_SAMPLERADDRESSMODE_REPEAT")
        , (1, BG.singleton "SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT")
        , (2, BG.singleton "SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUSamplerAddressMode"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUSamplerAddressMode"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUSamplerAddressMode where
  minDeclaredValue = SDL_GPU_SAMPLERADDRESSMODE_REPEAT

  maxDeclaredValue =
    SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE

instance Show SDL_GPUSamplerAddressMode where
  showsPrec = CEnum.shows

instance Read SDL_GPUSamplerAddressMode where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUSamplerAddressMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerAddressMode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUSamplerAddressMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUSamplerAddressMode "unwrap" where
  type
    CFieldType SDL_GPUSamplerAddressMode "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Specifies that the coordinates will wrap around.
--
--     [C declaration]: @SDL_GPU_SAMPLERADDRESSMODE_REPEAT@, defined at @SDL3\/SDL_gpu.h 1302:5@
pattern SDL_GPU_SAMPLERADDRESSMODE_REPEAT :: SDL_GPUSamplerAddressMode
pattern SDL_GPU_SAMPLERADDRESSMODE_REPEAT = SDL_GPUSamplerAddressMode 0

-- | Specifies that the coordinates will wrap around mirrored.
--
--     [C declaration]: @SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT@, defined at @SDL3\/SDL_gpu.h 1303:5@
pattern SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT :: SDL_GPUSamplerAddressMode
pattern SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT = SDL_GPUSamplerAddressMode 1

-- | Specifies that the coordinates will clamp to the 0-1 range.
--
--     [C declaration]: @SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE@, defined at @SDL3\/SDL_gpu.h 1304:5@
pattern SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE :: SDL_GPUSamplerAddressMode
pattern SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE = SDL_GPUSamplerAddressMode 2

-- | Specifies the timing that will be used to present swapchain textures to the OS.
--
--     VSYNC mode will always be supported. IMMEDIATE and MAILBOX modes may not be supported on certain systems.
--
--     It is recommended to query SDL_WindowSupportsGPUPresentMode after claiming the window if you wish to change the present mode to IMMEDIATE or MAILBOX.
--
--     * VSYNC: Waits for vblank before presenting. No tearing is possible. If there is a pending image to present, the new image is enqueued for presentation. Disallows tearing at the cost of visual latency.
--
--     * IMMEDIATE: Immediately presents. Lowest latency option, but tearing may occur.
--
--     * MAILBOX: Waits for vblank before presenting. No tearing is possible. If there is a pending image to present, the pending image is replaced by the new image. Similar to VSYNC, but with reduced visual latency.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetGPUSwapchainParameters', 'sDL_WindowSupportsGPUPresentMode', 'sDL_WaitAndAcquireGPUSwapchainTexture'
--
--     [C declaration]: @enum SDL_GPUPresentMode@, defined at @SDL3\/SDL_gpu.h 1332:14@
newtype SDL_GPUPresentMode = SDL_GPUPresentMode
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUPresentMode where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUPresentMode where
  readRaw =
    \ptr0 ->
      pure SDL_GPUPresentMode
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUPresentMode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUPresentMode unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GPUPresentMode instance BG.Storable SDL_GPUPresentMode

deriving via BG.CUInt instance BG.Prim SDL_GPUPresentMode

instance CEnum.CEnum SDL_GPUPresentMode where
  type CEnumZ SDL_GPUPresentMode = BG.CUInt

  toCEnum = SDL_GPUPresentMode

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_PRESENTMODE_VSYNC")
        , (1, BG.singleton "SDL_GPU_PRESENTMODE_IMMEDIATE")
        , (2, BG.singleton "SDL_GPU_PRESENTMODE_MAILBOX")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUPresentMode"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUPresentMode"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUPresentMode where
  minDeclaredValue = SDL_GPU_PRESENTMODE_VSYNC

  maxDeclaredValue = SDL_GPU_PRESENTMODE_MAILBOX

instance Show SDL_GPUPresentMode where
  showsPrec = CEnum.shows

instance Read SDL_GPUPresentMode where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUPresentMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUPresentMode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUPresentMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUPresentMode "unwrap" where
  type
    CFieldType SDL_GPUPresentMode "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_PRESENTMODE_VSYNC@, defined at @SDL3\/SDL_gpu.h 1334:5@
pattern SDL_GPU_PRESENTMODE_VSYNC :: SDL_GPUPresentMode
pattern SDL_GPU_PRESENTMODE_VSYNC = SDL_GPUPresentMode 0

-- | [C declaration]: @SDL_GPU_PRESENTMODE_IMMEDIATE@, defined at @SDL3\/SDL_gpu.h 1335:5@
pattern SDL_GPU_PRESENTMODE_IMMEDIATE :: SDL_GPUPresentMode
pattern SDL_GPU_PRESENTMODE_IMMEDIATE = SDL_GPUPresentMode 1

-- | [C declaration]: @SDL_GPU_PRESENTMODE_MAILBOX@, defined at @SDL3\/SDL_gpu.h 1336:5@
pattern SDL_GPU_PRESENTMODE_MAILBOX :: SDL_GPUPresentMode
pattern SDL_GPU_PRESENTMODE_MAILBOX = SDL_GPUPresentMode 2

-- | Specifies the texture format and colorspace of the swapchain textures.
--
--     SDR will always be supported. Other compositions may not be supported on certain systems.
--
--     It is recommended to query SDL_WindowSupportsGPUSwapchainComposition after claiming the window if you wish to change the swapchain composition from SDR.
--
--     * SDR: B8G8R8A8 or R8G8B8A8 swapchain. Pixel values are in sRGB encoding.
--
--     * SDR_LINEAR: B8G8R8A8_SRGB or R8G8B8A8_SRGB swapchain. Pixel values are stored in memory in sRGB encoding but accessed in shaders in \"linear sRGB\" encoding which is sRGB but with a linear transfer function.
--
--     * HDR_EXTENDED_LINEAR: R16G16B16A16_FLOAT swapchain. Pixel values are in extended linear sRGB encoding and permits values outside of the [0, 1] range.
--
--     * HDR10_ST2084: A2R10G10B10 or A2B10G10R10 swapchain. Pixel values are in BT.2020 ST2084 (PQ) encoding.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetGPUSwapchainParameters', 'sDL_WindowSupportsGPUSwapchainComposition', 'sDL_WaitAndAcquireGPUSwapchainTexture'
--
--     [C declaration]: @enum SDL_GPUSwapchainComposition@, defined at @SDL3\/SDL_gpu.h 1365:14@
newtype SDL_GPUSwapchainComposition = SDL_GPUSwapchainComposition
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GPUSwapchainComposition where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUSwapchainComposition where
  readRaw =
    \ptr0 ->
      pure SDL_GPUSwapchainComposition
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GPUSwapchainComposition where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUSwapchainComposition unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_GPUSwapchainComposition
  instance
    BG.Storable SDL_GPUSwapchainComposition

deriving via BG.CUInt instance BG.Prim SDL_GPUSwapchainComposition

instance CEnum.CEnum SDL_GPUSwapchainComposition where
  type CEnumZ SDL_GPUSwapchainComposition = BG.CUInt

  toCEnum = SDL_GPUSwapchainComposition

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GPU_SWAPCHAINCOMPOSITION_SDR")
        , (1, BG.singleton "SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR")
        , (2, BG.singleton "SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR")
        , (3, BG.singleton "SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GPUSwapchainComposition"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GPUSwapchainComposition"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GPUSwapchainComposition where
  minDeclaredValue = SDL_GPU_SWAPCHAINCOMPOSITION_SDR

  maxDeclaredValue =
    SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084

instance Show SDL_GPUSwapchainComposition where
  showsPrec = CEnum.shows

instance Read SDL_GPUSwapchainComposition where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GPUSwapchainComposition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSwapchainComposition{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GPUSwapchainComposition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GPUSwapchainComposition "unwrap" where
  type
    CFieldType SDL_GPUSwapchainComposition "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_GPU_SWAPCHAINCOMPOSITION_SDR@, defined at @SDL3\/SDL_gpu.h 1367:5@
pattern SDL_GPU_SWAPCHAINCOMPOSITION_SDR :: SDL_GPUSwapchainComposition
pattern SDL_GPU_SWAPCHAINCOMPOSITION_SDR = SDL_GPUSwapchainComposition 0

-- | [C declaration]: @SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR@, defined at @SDL3\/SDL_gpu.h 1368:5@
pattern SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR :: SDL_GPUSwapchainComposition
pattern SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR = SDL_GPUSwapchainComposition 1

-- | [C declaration]: @SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR@, defined at @SDL3\/SDL_gpu.h 1369:5@
pattern SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR :: SDL_GPUSwapchainComposition
pattern SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR = SDL_GPUSwapchainComposition 2

-- | [C declaration]: @SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084@, defined at @SDL3\/SDL_gpu.h 1370:5@
pattern SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084 :: SDL_GPUSwapchainComposition
pattern SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084 = SDL_GPUSwapchainComposition 3

-- | A structure specifying a viewport.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetGPUViewport'
--
--     [C declaration]: @struct SDL_GPUViewport@, defined at @SDL3\/SDL_gpu.h 1382:16@
data SDL_GPUViewport = SDL_GPUViewport
  { x :: BG.CFloat
  -- ^ The left offset of the viewport.
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_gpu.h 1384:11@
  , y :: BG.CFloat
  -- ^ The top offset of the viewport.
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_gpu.h 1385:11@
  , w :: BG.CFloat
  -- ^ The width of the viewport.
  --
  --          [C declaration]: @w@, defined at @SDL3\/SDL_gpu.h 1386:11@
  , h :: BG.CFloat
  -- ^ The height of the viewport.
  --
  --          [C declaration]: @h@, defined at @SDL3\/SDL_gpu.h 1387:11@
  , min_depth :: BG.CFloat
  -- ^ The minimum depth of the viewport.
  --
  --          [C declaration]: @min_depth@, defined at @SDL3\/SDL_gpu.h 1388:11@
  , max_depth :: BG.CFloat
  -- ^ The maximum depth of the viewport.
  --
  --          [C declaration]: @max_depth@, defined at @SDL3\/SDL_gpu.h 1389:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUViewport where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUViewport where
  readRaw =
    \ptr0 ->
      pure SDL_GPUViewport
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"h") ptr0
        <*> HasCField.readRaw (BG.Proxy @"min_depth") ptr0
        <*> HasCField.readRaw (BG.Proxy @"max_depth") ptr0

instance Marshal.WriteRaw SDL_GPUViewport where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUViewport x2 y3 w4 h5 min_depth6 max_depth7 ->
            HasCField.writeRaw (BG.Proxy @"x") ptr0 x2
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y3
              >> HasCField.writeRaw (BG.Proxy @"w") ptr0 w4
              >> HasCField.writeRaw (BG.Proxy @"h") ptr0 h5
              >> HasCField.writeRaw (BG.Proxy @"min_depth") ptr0 min_depth6
              >> HasCField.writeRaw (BG.Proxy @"max_depth") ptr0 max_depth7

deriving via Marshal.EquivStorable SDL_GPUViewport instance BG.Storable SDL_GPUViewport

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "x" SDL_GPUViewport ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUViewport
            { x = y1
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , min_depth = BG.getField @"min_depth" x0
            , max_depth = BG.getField @"max_depth" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_GPUViewport) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_GPUViewport "x" where
  type CFieldType SDL_GPUViewport "x" = BG.CFloat

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "y" SDL_GPUViewport ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUViewport
            { y = y1
            , x = BG.getField @"x" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , min_depth = BG.getField @"min_depth" x0
            , max_depth = BG.getField @"max_depth" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_GPUViewport) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_GPUViewport "y" where
  type CFieldType SDL_GPUViewport "y" = BG.CFloat

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "w" SDL_GPUViewport ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUViewport
            { w = y1
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , h = BG.getField @"h" x0
            , min_depth = BG.getField @"min_depth" x0
            , max_depth = BG.getField @"max_depth" x0
            }
      , BG.getField @"w" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "w" (BG.Ptr SDL_GPUViewport) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"w")

instance HasCField.HasCField SDL_GPUViewport "w" where
  type CFieldType SDL_GPUViewport "w" = BG.CFloat

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "h" SDL_GPUViewport ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUViewport
            { h = y1
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , min_depth = BG.getField @"min_depth" x0
            , max_depth = BG.getField @"max_depth" x0
            }
      , BG.getField @"h" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "h" (BG.Ptr SDL_GPUViewport) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"h")

instance HasCField.HasCField SDL_GPUViewport "h" where
  type CFieldType SDL_GPUViewport "h" = BG.CFloat

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "min_depth" SDL_GPUViewport ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUViewport
            { min_depth = y1
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , max_depth = BG.getField @"max_depth" x0
            }
      , BG.getField @"min_depth" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "min_depth" (BG.Ptr SDL_GPUViewport) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"min_depth")

instance HasCField.HasCField SDL_GPUViewport "min_depth" where
  type
    CFieldType SDL_GPUViewport "min_depth" =
      BG.CFloat

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "max_depth" SDL_GPUViewport ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUViewport
            { max_depth = y1
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , min_depth = BG.getField @"min_depth" x0
            }
      , BG.getField @"max_depth" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "max_depth" (BG.Ptr SDL_GPUViewport) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"max_depth")

instance HasCField.HasCField SDL_GPUViewport "max_depth" where
  type
    CFieldType SDL_GPUViewport "max_depth" =
      BG.CFloat

  offset# = \_ -> \_ -> 20

-- | A structure specifying parameters related to transferring data to or from a texture.
--
--     If either of @pixels_per_row@ or @rows_per_layer@ is zero, then width and height of passed 'SDL_GPUTextureRegion' to SDL_UploadToGPUTexture or SDL_DownloadFromGPUTexture are used as default values respectively and data is considered to be tightly packed.
--
--     __WARNING__: On some older\/integrated hardware, Direct3D 12 requires texture data row pitch to be 256 byte aligned, and offsets to be aligned to 512 bytes. If they are not, SDL will make a temporary copy of the data that is properly aligned, but this adds overhead to the transfer process. Apps can avoid this by aligning their data appropriately, or using a different GPU backend than Direct3D 12.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUTexture', 'sDL_DownloadFromGPUTexture'
--
--     [C declaration]: @struct SDL_GPUTextureTransferInfo@, defined at @SDL3\/SDL_gpu.h 1413:16@
data SDL_GPUTextureTransferInfo = SDL_GPUTextureTransferInfo
  { transfer_buffer :: BG.Ptr SDL_GPUTransferBuffer
  -- ^ The transfer buffer used in the transfer operation.
  --
  --          [C declaration]: @transfer_buffer@, defined at @SDL3\/SDL_gpu.h 1415:28@
  , offset :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The starting byte of the image data in the transfer buffer.
  --
  --          [C declaration]: @offset@, defined at @SDL3\/SDL_gpu.h 1416:12@
  , pixels_per_row :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of pixels from one row to the next.
  --
  --          [C declaration]: @pixels_per_row@, defined at @SDL3\/SDL_gpu.h 1417:12@
  , rows_per_layer :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of rows from one layer\/depth-slice to the next.
  --
  --          [C declaration]: @rows_per_layer@, defined at @SDL3\/SDL_gpu.h 1418:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUTextureTransferInfo where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUTextureTransferInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTextureTransferInfo
        <*> HasCField.readRaw (BG.Proxy @"transfer_buffer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"offset") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pixels_per_row") ptr0
        <*> HasCField.readRaw (BG.Proxy @"rows_per_layer") ptr0

instance Marshal.WriteRaw SDL_GPUTextureTransferInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTextureTransferInfo
            transfer_buffer2
            offset3
            pixels_per_row4
            rows_per_layer5 ->
              HasCField.writeRaw (BG.Proxy @"transfer_buffer") ptr0 transfer_buffer2
                >> HasCField.writeRaw (BG.Proxy @"offset") ptr0 offset3
                >> HasCField.writeRaw (BG.Proxy @"pixels_per_row") ptr0 pixels_per_row4
                >> HasCField.writeRaw (BG.Proxy @"rows_per_layer") ptr0 rows_per_layer5

deriving via
  Marshal.EquivStorable SDL_GPUTextureTransferInfo
  instance
    BG.Storable SDL_GPUTextureTransferInfo

instance
  (ty ~ BG.Ptr SDL_GPUTransferBuffer)
  => BG.CompatHasField.HasField "transfer_buffer" SDL_GPUTextureTransferInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureTransferInfo
            { transfer_buffer = y1
            , offset = BG.getField @"offset" x0
            , pixels_per_row = BG.getField @"pixels_per_row" x0
            , rows_per_layer = BG.getField @"rows_per_layer" x0
            }
      , BG.getField @"transfer_buffer" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTransferBuffer)
  => BG.HasField "transfer_buffer" (BG.Ptr SDL_GPUTextureTransferInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"transfer_buffer")

instance HasCField.HasCField SDL_GPUTextureTransferInfo "transfer_buffer" where
  type
    CFieldType SDL_GPUTextureTransferInfo "transfer_buffer" =
      BG.Ptr SDL_GPUTransferBuffer

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "offset" SDL_GPUTextureTransferInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureTransferInfo
            { offset = y1
            , transfer_buffer = BG.getField @"transfer_buffer" x0
            , pixels_per_row = BG.getField @"pixels_per_row" x0
            , rows_per_layer = BG.getField @"rows_per_layer" x0
            }
      , BG.getField @"offset" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "offset" (BG.Ptr SDL_GPUTextureTransferInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"offset")

instance HasCField.HasCField SDL_GPUTextureTransferInfo "offset" where
  type
    CFieldType SDL_GPUTextureTransferInfo "offset" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "pixels_per_row" SDL_GPUTextureTransferInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureTransferInfo
            { pixels_per_row = y1
            , transfer_buffer = BG.getField @"transfer_buffer" x0
            , offset = BG.getField @"offset" x0
            , rows_per_layer = BG.getField @"rows_per_layer" x0
            }
      , BG.getField @"pixels_per_row" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "pixels_per_row" (BG.Ptr SDL_GPUTextureTransferInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"pixels_per_row")

instance HasCField.HasCField SDL_GPUTextureTransferInfo "pixels_per_row" where
  type
    CFieldType SDL_GPUTextureTransferInfo "pixels_per_row" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "rows_per_layer" SDL_GPUTextureTransferInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureTransferInfo
            { rows_per_layer = y1
            , transfer_buffer = BG.getField @"transfer_buffer" x0
            , offset = BG.getField @"offset" x0
            , pixels_per_row = BG.getField @"pixels_per_row" x0
            }
      , BG.getField @"rows_per_layer" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "rows_per_layer" (BG.Ptr SDL_GPUTextureTransferInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"rows_per_layer")

instance HasCField.HasCField SDL_GPUTextureTransferInfo "rows_per_layer" where
  type
    CFieldType SDL_GPUTextureTransferInfo "rows_per_layer" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 16

-- | A structure specifying a location in a transfer buffer.
--
--     Used when transferring buffer data to or from a transfer buffer.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUBuffer', 'sDL_DownloadFromGPUBuffer'
--
--     [C declaration]: @struct SDL_GPUTransferBufferLocation@, defined at @SDL3\/SDL_gpu.h 1431:16@
data SDL_GPUTransferBufferLocation = SDL_GPUTransferBufferLocation
  { transfer_buffer :: BG.Ptr SDL_GPUTransferBuffer
  -- ^ The transfer buffer used in the transfer operation.
  --
  --          [C declaration]: @transfer_buffer@, defined at @SDL3\/SDL_gpu.h 1433:28@
  , offset :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The starting byte of the buffer data in the transfer buffer.
  --
  --          [C declaration]: @offset@, defined at @SDL3\/SDL_gpu.h 1434:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUTransferBufferLocation where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUTransferBufferLocation where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTransferBufferLocation
        <*> HasCField.readRaw (BG.Proxy @"transfer_buffer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"offset") ptr0

instance Marshal.WriteRaw SDL_GPUTransferBufferLocation where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTransferBufferLocation transfer_buffer2 offset3 ->
            HasCField.writeRaw (BG.Proxy @"transfer_buffer") ptr0 transfer_buffer2
              >> HasCField.writeRaw (BG.Proxy @"offset") ptr0 offset3

deriving via
  Marshal.EquivStorable SDL_GPUTransferBufferLocation
  instance
    BG.Storable SDL_GPUTransferBufferLocation

instance
  (ty ~ BG.Ptr SDL_GPUTransferBuffer)
  => BG.CompatHasField.HasField "transfer_buffer" SDL_GPUTransferBufferLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTransferBufferLocation{transfer_buffer = y1, offset = BG.getField @"offset" x0}
      , BG.getField @"transfer_buffer" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTransferBuffer)
  => BG.HasField "transfer_buffer" (BG.Ptr SDL_GPUTransferBufferLocation) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"transfer_buffer")

instance HasCField.HasCField SDL_GPUTransferBufferLocation "transfer_buffer" where
  type
    CFieldType SDL_GPUTransferBufferLocation "transfer_buffer" =
      BG.Ptr SDL_GPUTransferBuffer

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "offset" SDL_GPUTransferBufferLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTransferBufferLocation{offset = y1, transfer_buffer = BG.getField @"transfer_buffer" x0}
      , BG.getField @"offset" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "offset" (BG.Ptr SDL_GPUTransferBufferLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"offset")

instance HasCField.HasCField SDL_GPUTransferBufferLocation "offset" where
  type
    CFieldType SDL_GPUTransferBufferLocation "offset" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

-- | A structure specifying a location in a texture.
--
--     Used when copying data from one texture to another.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CopyGPUTextureToTexture'
--
--     [C declaration]: @struct SDL_GPUTextureLocation@, defined at @SDL3\/SDL_gpu.h 1446:16@
data SDL_GPUTextureLocation = SDL_GPUTextureLocation
  { texture :: BG.Ptr SDL_GPUTexture
  -- ^ The texture used in the copy operation.
  --
  --          [C declaration]: @texture@, defined at @SDL3\/SDL_gpu.h 1448:21@
  , mip_level :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The mip level index of the location.
  --
  --          [C declaration]: @mip_level@, defined at @SDL3\/SDL_gpu.h 1449:12@
  , layer :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The layer index of the location.
  --
  --          [C declaration]: @layer@, defined at @SDL3\/SDL_gpu.h 1450:12@
  , x :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The left offset of the location.
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_gpu.h 1451:12@
  , y :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The top offset of the location.
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_gpu.h 1452:12@
  , z :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The front offset of the location.
  --
  --          [C declaration]: @z@, defined at @SDL3\/SDL_gpu.h 1453:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUTextureLocation where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUTextureLocation where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTextureLocation
        <*> HasCField.readRaw (BG.Proxy @"texture") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mip_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"layer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"z") ptr0

instance Marshal.WriteRaw SDL_GPUTextureLocation where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTextureLocation texture2 mip_level3 layer4 x5 y6 z7 ->
            HasCField.writeRaw (BG.Proxy @"texture") ptr0 texture2
              >> HasCField.writeRaw (BG.Proxy @"mip_level") ptr0 mip_level3
              >> HasCField.writeRaw (BG.Proxy @"layer") ptr0 layer4
              >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x5
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y6
              >> HasCField.writeRaw (BG.Proxy @"z") ptr0 z7

deriving via
  Marshal.EquivStorable SDL_GPUTextureLocation
  instance
    BG.Storable SDL_GPUTextureLocation

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.CompatHasField.HasField "texture" SDL_GPUTextureLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureLocation
            { texture = y1
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            }
      , BG.getField @"texture" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.HasField "texture" (BG.Ptr SDL_GPUTextureLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"texture")

instance HasCField.HasCField SDL_GPUTextureLocation "texture" where
  type
    CFieldType SDL_GPUTextureLocation "texture" =
      BG.Ptr SDL_GPUTexture

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "mip_level" SDL_GPUTextureLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureLocation
            { mip_level = y1
            , texture = BG.getField @"texture" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            }
      , BG.getField @"mip_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "mip_level" (BG.Ptr SDL_GPUTextureLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mip_level")

instance HasCField.HasCField SDL_GPUTextureLocation "mip_level" where
  type
    CFieldType SDL_GPUTextureLocation "mip_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "layer" SDL_GPUTextureLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureLocation
            { layer = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            }
      , BG.getField @"layer" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "layer" (BG.Ptr SDL_GPUTextureLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"layer")

instance HasCField.HasCField SDL_GPUTextureLocation "layer" where
  type
    CFieldType SDL_GPUTextureLocation "layer" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "x" SDL_GPUTextureLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureLocation
            { x = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "x" (BG.Ptr SDL_GPUTextureLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_GPUTextureLocation "x" where
  type
    CFieldType SDL_GPUTextureLocation "x" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "y" SDL_GPUTextureLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureLocation
            { y = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , z = BG.getField @"z" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "y" (BG.Ptr SDL_GPUTextureLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_GPUTextureLocation "y" where
  type
    CFieldType SDL_GPUTextureLocation "y" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "z" SDL_GPUTextureLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureLocation
            { z = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"z" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "z" (BG.Ptr SDL_GPUTextureLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"z")

instance HasCField.HasCField SDL_GPUTextureLocation "z" where
  type
    CFieldType SDL_GPUTextureLocation "z" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 24

-- | A structure specifying a region of a texture.
--
--     Used when transferring data to or from a texture.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUTexture', 'sDL_DownloadFromGPUTexture', 'sDL_CreateGPUTexture'
--
--     [C declaration]: @struct SDL_GPUTextureRegion@, defined at @SDL3\/SDL_gpu.h 1467:16@
data SDL_GPUTextureRegion = SDL_GPUTextureRegion
  { texture :: BG.Ptr SDL_GPUTexture
  -- ^ The texture used in the copy operation.
  --
  --          [C declaration]: @texture@, defined at @SDL3\/SDL_gpu.h 1469:21@
  , mip_level :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The mip level index to transfer.
  --
  --          [C declaration]: @mip_level@, defined at @SDL3\/SDL_gpu.h 1470:12@
  , layer :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The layer index to transfer.
  --
  --          [C declaration]: @layer@, defined at @SDL3\/SDL_gpu.h 1471:12@
  , x :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The left offset of the region.
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_gpu.h 1472:12@
  , y :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The top offset of the region.
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_gpu.h 1473:12@
  , z :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The front offset of the region.
  --
  --          [C declaration]: @z@, defined at @SDL3\/SDL_gpu.h 1474:12@
  , w :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The width of the region.
  --
  --          [C declaration]: @w@, defined at @SDL3\/SDL_gpu.h 1475:12@
  , h :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The height of the region.
  --
  --          [C declaration]: @h@, defined at @SDL3\/SDL_gpu.h 1476:12@
  , d :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The depth of the region.
  --
  --          [C declaration]: @d@, defined at @SDL3\/SDL_gpu.h 1477:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUTextureRegion where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUTextureRegion where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTextureRegion
        <*> HasCField.readRaw (BG.Proxy @"texture") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mip_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"layer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"z") ptr0
        <*> HasCField.readRaw (BG.Proxy @"w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"h") ptr0
        <*> HasCField.readRaw (BG.Proxy @"d") ptr0

instance Marshal.WriteRaw SDL_GPUTextureRegion where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTextureRegion texture2 mip_level3 layer4 x5 y6 z7 w8 h9 d10 ->
            HasCField.writeRaw (BG.Proxy @"texture") ptr0 texture2
              >> HasCField.writeRaw (BG.Proxy @"mip_level") ptr0 mip_level3
              >> HasCField.writeRaw (BG.Proxy @"layer") ptr0 layer4
              >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x5
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y6
              >> HasCField.writeRaw (BG.Proxy @"z") ptr0 z7
              >> HasCField.writeRaw (BG.Proxy @"w") ptr0 w8
              >> HasCField.writeRaw (BG.Proxy @"h") ptr0 h9
              >> HasCField.writeRaw (BG.Proxy @"d") ptr0 d10

deriving via Marshal.EquivStorable SDL_GPUTextureRegion instance BG.Storable SDL_GPUTextureRegion

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.CompatHasField.HasField "texture" SDL_GPUTextureRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureRegion
            { texture = y1
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , d = BG.getField @"d" x0
            }
      , BG.getField @"texture" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.HasField "texture" (BG.Ptr SDL_GPUTextureRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"texture")

instance HasCField.HasCField SDL_GPUTextureRegion "texture" where
  type
    CFieldType SDL_GPUTextureRegion "texture" =
      BG.Ptr SDL_GPUTexture

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "mip_level" SDL_GPUTextureRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureRegion
            { mip_level = y1
            , texture = BG.getField @"texture" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , d = BG.getField @"d" x0
            }
      , BG.getField @"mip_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "mip_level" (BG.Ptr SDL_GPUTextureRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mip_level")

instance HasCField.HasCField SDL_GPUTextureRegion "mip_level" where
  type
    CFieldType SDL_GPUTextureRegion "mip_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "layer" SDL_GPUTextureRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureRegion
            { layer = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , d = BG.getField @"d" x0
            }
      , BG.getField @"layer" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "layer" (BG.Ptr SDL_GPUTextureRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"layer")

instance HasCField.HasCField SDL_GPUTextureRegion "layer" where
  type
    CFieldType SDL_GPUTextureRegion "layer" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "x" SDL_GPUTextureRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureRegion
            { x = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , d = BG.getField @"d" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "x" (BG.Ptr SDL_GPUTextureRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_GPUTextureRegion "x" where
  type
    CFieldType SDL_GPUTextureRegion "x" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "y" SDL_GPUTextureRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureRegion
            { y = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , z = BG.getField @"z" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , d = BG.getField @"d" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "y" (BG.Ptr SDL_GPUTextureRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_GPUTextureRegion "y" where
  type
    CFieldType SDL_GPUTextureRegion "y" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "z" SDL_GPUTextureRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureRegion
            { z = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , d = BG.getField @"d" x0
            }
      , BG.getField @"z" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "z" (BG.Ptr SDL_GPUTextureRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"z")

instance HasCField.HasCField SDL_GPUTextureRegion "z" where
  type
    CFieldType SDL_GPUTextureRegion "z" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "w" SDL_GPUTextureRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureRegion
            { w = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            , h = BG.getField @"h" x0
            , d = BG.getField @"d" x0
            }
      , BG.getField @"w" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "w" (BG.Ptr SDL_GPUTextureRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"w")

instance HasCField.HasCField SDL_GPUTextureRegion "w" where
  type
    CFieldType SDL_GPUTextureRegion "w" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "h" SDL_GPUTextureRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureRegion
            { h = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            , w = BG.getField @"w" x0
            , d = BG.getField @"d" x0
            }
      , BG.getField @"h" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "h" (BG.Ptr SDL_GPUTextureRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"h")

instance HasCField.HasCField SDL_GPUTextureRegion "h" where
  type
    CFieldType SDL_GPUTextureRegion "h" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "d" SDL_GPUTextureRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureRegion
            { d = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , z = BG.getField @"z" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"d" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "d" (BG.Ptr SDL_GPUTextureRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"d")

instance HasCField.HasCField SDL_GPUTextureRegion "d" where
  type
    CFieldType SDL_GPUTextureRegion "d" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 36

-- | A structure specifying a region of a texture used in the blit operation.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitGPUTexture'
--
--     [C declaration]: @struct SDL_GPUBlitRegion@, defined at @SDL3\/SDL_gpu.h 1487:16@
data SDL_GPUBlitRegion = SDL_GPUBlitRegion
  { texture :: BG.Ptr SDL_GPUTexture
  -- ^ The texture.
  --
  --          [C declaration]: @texture@, defined at @SDL3\/SDL_gpu.h 1489:21@
  , mip_level :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The mip level index of the region.
  --
  --          [C declaration]: @mip_level@, defined at @SDL3\/SDL_gpu.h 1490:12@
  , layer_or_depth_plane :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The layer index or depth plane of the region. This value is treated as a layer index on 2D array and cube textures, and as a depth plane on 3D textures.
  --
  --          [C declaration]: @layer_or_depth_plane@, defined at @SDL3\/SDL_gpu.h 1491:12@
  , x :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The left offset of the region.
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_gpu.h 1492:12@
  , y :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The top offset of the region.
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_gpu.h 1493:12@
  , w :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The width of the region.
  --
  --          [C declaration]: @w@, defined at @SDL3\/SDL_gpu.h 1494:12@
  , h :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The height of the region.
  --
  --          [C declaration]: @h@, defined at @SDL3\/SDL_gpu.h 1495:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUBlitRegion where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUBlitRegion where
  readRaw =
    \ptr0 ->
      pure SDL_GPUBlitRegion
        <*> HasCField.readRaw (BG.Proxy @"texture") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mip_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"layer_or_depth_plane") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"h") ptr0

instance Marshal.WriteRaw SDL_GPUBlitRegion where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUBlitRegion texture2 mip_level3 layer_or_depth_plane4 x5 y6 w7 h8 ->
            HasCField.writeRaw (BG.Proxy @"texture") ptr0 texture2
              >> HasCField.writeRaw (BG.Proxy @"mip_level") ptr0 mip_level3
              >> HasCField.writeRaw (BG.Proxy @"layer_or_depth_plane") ptr0 layer_or_depth_plane4
              >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x5
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y6
              >> HasCField.writeRaw (BG.Proxy @"w") ptr0 w7
              >> HasCField.writeRaw (BG.Proxy @"h") ptr0 h8

deriving via Marshal.EquivStorable SDL_GPUBlitRegion instance BG.Storable SDL_GPUBlitRegion

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.CompatHasField.HasField "texture" SDL_GPUBlitRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitRegion
            { texture = y1
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"texture" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.HasField "texture" (BG.Ptr SDL_GPUBlitRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"texture")

instance HasCField.HasCField SDL_GPUBlitRegion "texture" where
  type
    CFieldType SDL_GPUBlitRegion "texture" =
      BG.Ptr SDL_GPUTexture

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "mip_level" SDL_GPUBlitRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitRegion
            { mip_level = y1
            , texture = BG.getField @"texture" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"mip_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "mip_level" (BG.Ptr SDL_GPUBlitRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mip_level")

instance HasCField.HasCField SDL_GPUBlitRegion "mip_level" where
  type
    CFieldType SDL_GPUBlitRegion "mip_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "layer_or_depth_plane" SDL_GPUBlitRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitRegion
            { layer_or_depth_plane = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"layer_or_depth_plane" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "layer_or_depth_plane" (BG.Ptr SDL_GPUBlitRegion) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"layer_or_depth_plane")

instance HasCField.HasCField SDL_GPUBlitRegion "layer_or_depth_plane" where
  type
    CFieldType SDL_GPUBlitRegion "layer_or_depth_plane" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "x" SDL_GPUBlitRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitRegion
            { x = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "x" (BG.Ptr SDL_GPUBlitRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_GPUBlitRegion "x" where
  type
    CFieldType SDL_GPUBlitRegion "x" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "y" SDL_GPUBlitRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitRegion
            { y = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , x = BG.getField @"x" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "y" (BG.Ptr SDL_GPUBlitRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_GPUBlitRegion "y" where
  type
    CFieldType SDL_GPUBlitRegion "y" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "w" SDL_GPUBlitRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitRegion
            { w = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"w" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "w" (BG.Ptr SDL_GPUBlitRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"w")

instance HasCField.HasCField SDL_GPUBlitRegion "w" where
  type
    CFieldType SDL_GPUBlitRegion "w" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "h" SDL_GPUBlitRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitRegion
            { h = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , w = BG.getField @"w" x0
            }
      , BG.getField @"h" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "h" (BG.Ptr SDL_GPUBlitRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"h")

instance HasCField.HasCField SDL_GPUBlitRegion "h" where
  type
    CFieldType SDL_GPUBlitRegion "h" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 28

-- | A structure specifying a location in a buffer.
--
--     Used when copying data between buffers.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CopyGPUBufferToBuffer'
--
--     [C declaration]: @struct SDL_GPUBufferLocation@, defined at @SDL3\/SDL_gpu.h 1507:16@
data SDL_GPUBufferLocation = SDL_GPUBufferLocation
  { buffer :: BG.Ptr SDL_GPUBuffer
  -- ^ The buffer.
  --
  --          [C declaration]: @buffer@, defined at @SDL3\/SDL_gpu.h 1509:20@
  , offset :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The starting byte within the buffer.
  --
  --          [C declaration]: @offset@, defined at @SDL3\/SDL_gpu.h 1510:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUBufferLocation where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUBufferLocation where
  readRaw =
    \ptr0 ->
      pure SDL_GPUBufferLocation
        <*> HasCField.readRaw (BG.Proxy @"buffer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"offset") ptr0

instance Marshal.WriteRaw SDL_GPUBufferLocation where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUBufferLocation buffer2 offset3 ->
            HasCField.writeRaw (BG.Proxy @"buffer") ptr0 buffer2
              >> HasCField.writeRaw (BG.Proxy @"offset") ptr0 offset3

deriving via Marshal.EquivStorable SDL_GPUBufferLocation instance BG.Storable SDL_GPUBufferLocation

instance
  (ty ~ BG.Ptr SDL_GPUBuffer)
  => BG.CompatHasField.HasField "buffer" SDL_GPUBufferLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferLocation{buffer = y1, offset = BG.getField @"offset" x0}
      , BG.getField @"buffer" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUBuffer)
  => BG.HasField "buffer" (BG.Ptr SDL_GPUBufferLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"buffer")

instance HasCField.HasCField SDL_GPUBufferLocation "buffer" where
  type
    CFieldType SDL_GPUBufferLocation "buffer" =
      BG.Ptr SDL_GPUBuffer

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "offset" SDL_GPUBufferLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferLocation{offset = y1, buffer = BG.getField @"buffer" x0}
      , BG.getField @"offset" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "offset" (BG.Ptr SDL_GPUBufferLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"offset")

instance HasCField.HasCField SDL_GPUBufferLocation "offset" where
  type
    CFieldType SDL_GPUBufferLocation "offset" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

-- | A structure specifying a region of a buffer.
--
--     Used when transferring data to or from buffers.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUBuffer', 'sDL_DownloadFromGPUBuffer'
--
--     [C declaration]: @struct SDL_GPUBufferRegion@, defined at @SDL3\/SDL_gpu.h 1523:16@
data SDL_GPUBufferRegion = SDL_GPUBufferRegion
  { buffer :: BG.Ptr SDL_GPUBuffer
  -- ^ The buffer.
  --
  --          [C declaration]: @buffer@, defined at @SDL3\/SDL_gpu.h 1525:20@
  , offset :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The starting byte within the buffer.
  --
  --          [C declaration]: @offset@, defined at @SDL3\/SDL_gpu.h 1526:12@
  , size :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The size in bytes of the region.
  --
  --          [C declaration]: @size@, defined at @SDL3\/SDL_gpu.h 1527:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUBufferRegion where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUBufferRegion where
  readRaw =
    \ptr0 ->
      pure SDL_GPUBufferRegion
        <*> HasCField.readRaw (BG.Proxy @"buffer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"offset") ptr0
        <*> HasCField.readRaw (BG.Proxy @"size") ptr0

instance Marshal.WriteRaw SDL_GPUBufferRegion where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUBufferRegion buffer2 offset3 size4 ->
            HasCField.writeRaw (BG.Proxy @"buffer") ptr0 buffer2
              >> HasCField.writeRaw (BG.Proxy @"offset") ptr0 offset3
              >> HasCField.writeRaw (BG.Proxy @"size") ptr0 size4

deriving via Marshal.EquivStorable SDL_GPUBufferRegion instance BG.Storable SDL_GPUBufferRegion

instance
  (ty ~ BG.Ptr SDL_GPUBuffer)
  => BG.CompatHasField.HasField "buffer" SDL_GPUBufferRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferRegion{buffer = y1, offset = BG.getField @"offset" x0, size = BG.getField @"size" x0}
      , BG.getField @"buffer" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUBuffer)
  => BG.HasField "buffer" (BG.Ptr SDL_GPUBufferRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"buffer")

instance HasCField.HasCField SDL_GPUBufferRegion "buffer" where
  type
    CFieldType SDL_GPUBufferRegion "buffer" =
      BG.Ptr SDL_GPUBuffer

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "offset" SDL_GPUBufferRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferRegion{offset = y1, buffer = BG.getField @"buffer" x0, size = BG.getField @"size" x0}
      , BG.getField @"offset" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "offset" (BG.Ptr SDL_GPUBufferRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"offset")

instance HasCField.HasCField SDL_GPUBufferRegion "offset" where
  type
    CFieldType SDL_GPUBufferRegion "offset" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "size" SDL_GPUBufferRegion ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferRegion
            { size = y1
            , buffer = BG.getField @"buffer" x0
            , offset = BG.getField @"offset" x0
            }
      , BG.getField @"size" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "size" (BG.Ptr SDL_GPUBufferRegion) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"size")

instance HasCField.HasCField SDL_GPUBufferRegion "size" where
  type
    CFieldType SDL_GPUBufferRegion "size" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

-- | A structure specifying the parameters of an indirect draw command.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DrawGPUPrimitivesIndirect'
--
--     [C declaration]: @struct SDL_GPUIndirectDrawCommand@, defined at @SDL3\/SDL_gpu.h 1544:16@
data SDL_GPUIndirectDrawCommand = SDL_GPUIndirectDrawCommand
  { num_vertices :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of vertices to draw.
  --
  --          [C declaration]: @num_vertices@, defined at @SDL3\/SDL_gpu.h 1546:12@
  , num_instances :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of instances to draw.
  --
  --          [C declaration]: @num_instances@, defined at @SDL3\/SDL_gpu.h 1547:12@
  , first_vertex :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The index of the first vertex to draw.
  --
  --          [C declaration]: @first_vertex@, defined at @SDL3\/SDL_gpu.h 1548:12@
  , first_instance :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The ID of the first instance to draw.
  --
  --          [C declaration]: @first_instance@, defined at @SDL3\/SDL_gpu.h 1549:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUIndirectDrawCommand where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUIndirectDrawCommand where
  readRaw =
    \ptr0 ->
      pure SDL_GPUIndirectDrawCommand
        <*> HasCField.readRaw (BG.Proxy @"num_vertices") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_instances") ptr0
        <*> HasCField.readRaw (BG.Proxy @"first_vertex") ptr0
        <*> HasCField.readRaw (BG.Proxy @"first_instance") ptr0

instance Marshal.WriteRaw SDL_GPUIndirectDrawCommand where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUIndirectDrawCommand
            num_vertices2
            num_instances3
            first_vertex4
            first_instance5 ->
              HasCField.writeRaw (BG.Proxy @"num_vertices") ptr0 num_vertices2
                >> HasCField.writeRaw (BG.Proxy @"num_instances") ptr0 num_instances3
                >> HasCField.writeRaw (BG.Proxy @"first_vertex") ptr0 first_vertex4
                >> HasCField.writeRaw (BG.Proxy @"first_instance") ptr0 first_instance5

deriving via
  Marshal.EquivStorable SDL_GPUIndirectDrawCommand
  instance
    BG.Storable SDL_GPUIndirectDrawCommand

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_vertices" SDL_GPUIndirectDrawCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndirectDrawCommand
            { num_vertices = y1
            , num_instances = BG.getField @"num_instances" x0
            , first_vertex = BG.getField @"first_vertex" x0
            , first_instance = BG.getField @"first_instance" x0
            }
      , BG.getField @"num_vertices" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_vertices" (BG.Ptr SDL_GPUIndirectDrawCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_vertices")

instance HasCField.HasCField SDL_GPUIndirectDrawCommand "num_vertices" where
  type
    CFieldType SDL_GPUIndirectDrawCommand "num_vertices" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_instances" SDL_GPUIndirectDrawCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndirectDrawCommand
            { num_instances = y1
            , num_vertices = BG.getField @"num_vertices" x0
            , first_vertex = BG.getField @"first_vertex" x0
            , first_instance = BG.getField @"first_instance" x0
            }
      , BG.getField @"num_instances" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_instances" (BG.Ptr SDL_GPUIndirectDrawCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_instances")

instance HasCField.HasCField SDL_GPUIndirectDrawCommand "num_instances" where
  type
    CFieldType SDL_GPUIndirectDrawCommand "num_instances" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "first_vertex" SDL_GPUIndirectDrawCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndirectDrawCommand
            { first_vertex = y1
            , num_vertices = BG.getField @"num_vertices" x0
            , num_instances = BG.getField @"num_instances" x0
            , first_instance = BG.getField @"first_instance" x0
            }
      , BG.getField @"first_vertex" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "first_vertex" (BG.Ptr SDL_GPUIndirectDrawCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"first_vertex")

instance HasCField.HasCField SDL_GPUIndirectDrawCommand "first_vertex" where
  type
    CFieldType SDL_GPUIndirectDrawCommand "first_vertex" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "first_instance" SDL_GPUIndirectDrawCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndirectDrawCommand
            { first_instance = y1
            , num_vertices = BG.getField @"num_vertices" x0
            , num_instances = BG.getField @"num_instances" x0
            , first_vertex = BG.getField @"first_vertex" x0
            }
      , BG.getField @"first_instance" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "first_instance" (BG.Ptr SDL_GPUIndirectDrawCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"first_instance")

instance HasCField.HasCField SDL_GPUIndirectDrawCommand "first_instance" where
  type
    CFieldType SDL_GPUIndirectDrawCommand "first_instance" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

-- | A structure specifying the parameters of an indexed indirect draw command.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DrawGPUIndexedPrimitivesIndirect'
--
--     [C declaration]: @struct SDL_GPUIndexedIndirectDrawCommand@, defined at @SDL3\/SDL_gpu.h 1566:16@
data SDL_GPUIndexedIndirectDrawCommand = SDL_GPUIndexedIndirectDrawCommand
  { num_indices :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of indices to draw per instance.
  --
  --          [C declaration]: @num_indices@, defined at @SDL3\/SDL_gpu.h 1568:12@
  , num_instances :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of instances to draw.
  --
  --          [C declaration]: @num_instances@, defined at @SDL3\/SDL_gpu.h 1569:12@
  , first_index :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The base index within the index buffer.
  --
  --          [C declaration]: @first_index@, defined at @SDL3\/SDL_gpu.h 1570:12@
  , vertex_offset :: SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^ The value added to the vertex index before indexing into the vertex buffer.
  --
  --          [C declaration]: @vertex_offset@, defined at @SDL3\/SDL_gpu.h 1571:12@
  , first_instance :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The ID of the first instance to draw.
  --
  --          [C declaration]: @first_instance@, defined at @SDL3\/SDL_gpu.h 1572:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUIndexedIndirectDrawCommand where
  staticSizeOf = \_ -> (20 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUIndexedIndirectDrawCommand where
  readRaw =
    \ptr0 ->
      pure SDL_GPUIndexedIndirectDrawCommand
        <*> HasCField.readRaw (BG.Proxy @"num_indices") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_instances") ptr0
        <*> HasCField.readRaw (BG.Proxy @"first_index") ptr0
        <*> HasCField.readRaw (BG.Proxy @"vertex_offset") ptr0
        <*> HasCField.readRaw (BG.Proxy @"first_instance") ptr0

instance Marshal.WriteRaw SDL_GPUIndexedIndirectDrawCommand where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUIndexedIndirectDrawCommand
            num_indices2
            num_instances3
            first_index4
            vertex_offset5
            first_instance6 ->
              HasCField.writeRaw (BG.Proxy @"num_indices") ptr0 num_indices2
                >> HasCField.writeRaw (BG.Proxy @"num_instances") ptr0 num_instances3
                >> HasCField.writeRaw (BG.Proxy @"first_index") ptr0 first_index4
                >> HasCField.writeRaw (BG.Proxy @"vertex_offset") ptr0 vertex_offset5
                >> HasCField.writeRaw (BG.Proxy @"first_instance") ptr0 first_instance6

deriving via
  Marshal.EquivStorable SDL_GPUIndexedIndirectDrawCommand
  instance
    BG.Storable SDL_GPUIndexedIndirectDrawCommand

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_indices" SDL_GPUIndexedIndirectDrawCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndexedIndirectDrawCommand
            { num_indices = y1
            , num_instances = BG.getField @"num_instances" x0
            , first_index = BG.getField @"first_index" x0
            , vertex_offset = BG.getField @"vertex_offset" x0
            , first_instance = BG.getField @"first_instance" x0
            }
      , BG.getField @"num_indices" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_indices" (BG.Ptr SDL_GPUIndexedIndirectDrawCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_indices")

instance HasCField.HasCField SDL_GPUIndexedIndirectDrawCommand "num_indices" where
  type
    CFieldType SDL_GPUIndexedIndirectDrawCommand "num_indices" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_instances" SDL_GPUIndexedIndirectDrawCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndexedIndirectDrawCommand
            { num_instances = y1
            , num_indices = BG.getField @"num_indices" x0
            , first_index = BG.getField @"first_index" x0
            , vertex_offset = BG.getField @"vertex_offset" x0
            , first_instance = BG.getField @"first_instance" x0
            }
      , BG.getField @"num_instances" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_instances" (BG.Ptr SDL_GPUIndexedIndirectDrawCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_instances")

instance HasCField.HasCField SDL_GPUIndexedIndirectDrawCommand "num_instances" where
  type
    CFieldType SDL_GPUIndexedIndirectDrawCommand "num_instances" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "first_index" SDL_GPUIndexedIndirectDrawCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndexedIndirectDrawCommand
            { first_index = y1
            , num_indices = BG.getField @"num_indices" x0
            , num_instances = BG.getField @"num_instances" x0
            , vertex_offset = BG.getField @"vertex_offset" x0
            , first_instance = BG.getField @"first_instance" x0
            }
      , BG.getField @"first_index" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "first_index" (BG.Ptr SDL_GPUIndexedIndirectDrawCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"first_index")

instance HasCField.HasCField SDL_GPUIndexedIndirectDrawCommand "first_index" where
  type
    CFieldType SDL_GPUIndexedIndirectDrawCommand "first_index" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.CompatHasField.HasField "vertex_offset" SDL_GPUIndexedIndirectDrawCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndexedIndirectDrawCommand
            { vertex_offset = y1
            , num_indices = BG.getField @"num_indices" x0
            , num_instances = BG.getField @"num_instances" x0
            , first_index = BG.getField @"first_index" x0
            , first_instance = BG.getField @"first_instance" x0
            }
      , BG.getField @"vertex_offset" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Sint32)
  => BG.HasField "vertex_offset" (BG.Ptr SDL_GPUIndexedIndirectDrawCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"vertex_offset")

instance HasCField.HasCField SDL_GPUIndexedIndirectDrawCommand "vertex_offset" where
  type
    CFieldType SDL_GPUIndexedIndirectDrawCommand "vertex_offset" =
      SDL3.Sys.Bindgen.Stdinc.Sint32

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "first_instance" SDL_GPUIndexedIndirectDrawCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndexedIndirectDrawCommand
            { first_instance = y1
            , num_indices = BG.getField @"num_indices" x0
            , num_instances = BG.getField @"num_instances" x0
            , first_index = BG.getField @"first_index" x0
            , vertex_offset = BG.getField @"vertex_offset" x0
            }
      , BG.getField @"first_instance" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "first_instance" (BG.Ptr SDL_GPUIndexedIndirectDrawCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"first_instance")

instance HasCField.HasCField SDL_GPUIndexedIndirectDrawCommand "first_instance" where
  type
    CFieldType SDL_GPUIndexedIndirectDrawCommand "first_instance" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 16

-- | A structure specifying the parameters of an indexed dispatch command.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DispatchGPUComputeIndirect'
--
--     [C declaration]: @struct SDL_GPUIndirectDispatchCommand@, defined at @SDL3\/SDL_gpu.h 1582:16@
data SDL_GPUIndirectDispatchCommand = SDL_GPUIndirectDispatchCommand
  { groupcount_x :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of local workgroups to dispatch in the X dimension.
  --
  --          [C declaration]: @groupcount_x@, defined at @SDL3\/SDL_gpu.h 1584:12@
  , groupcount_y :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of local workgroups to dispatch in the Y dimension.
  --
  --          [C declaration]: @groupcount_y@, defined at @SDL3\/SDL_gpu.h 1585:12@
  , groupcount_z :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of local workgroups to dispatch in the Z dimension.
  --
  --          [C declaration]: @groupcount_z@, defined at @SDL3\/SDL_gpu.h 1586:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUIndirectDispatchCommand where
  staticSizeOf = \_ -> (12 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUIndirectDispatchCommand where
  readRaw =
    \ptr0 ->
      pure SDL_GPUIndirectDispatchCommand
        <*> HasCField.readRaw (BG.Proxy @"groupcount_x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"groupcount_y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"groupcount_z") ptr0

instance Marshal.WriteRaw SDL_GPUIndirectDispatchCommand where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUIndirectDispatchCommand groupcount_x2 groupcount_y3 groupcount_z4 ->
            HasCField.writeRaw (BG.Proxy @"groupcount_x") ptr0 groupcount_x2
              >> HasCField.writeRaw (BG.Proxy @"groupcount_y") ptr0 groupcount_y3
              >> HasCField.writeRaw (BG.Proxy @"groupcount_z") ptr0 groupcount_z4

deriving via
  Marshal.EquivStorable SDL_GPUIndirectDispatchCommand
  instance
    BG.Storable SDL_GPUIndirectDispatchCommand

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "groupcount_x" SDL_GPUIndirectDispatchCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndirectDispatchCommand
            { groupcount_x = y1
            , groupcount_y = BG.getField @"groupcount_y" x0
            , groupcount_z = BG.getField @"groupcount_z" x0
            }
      , BG.getField @"groupcount_x" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "groupcount_x" (BG.Ptr SDL_GPUIndirectDispatchCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"groupcount_x")

instance HasCField.HasCField SDL_GPUIndirectDispatchCommand "groupcount_x" where
  type
    CFieldType SDL_GPUIndirectDispatchCommand "groupcount_x" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "groupcount_y" SDL_GPUIndirectDispatchCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndirectDispatchCommand
            { groupcount_y = y1
            , groupcount_x = BG.getField @"groupcount_x" x0
            , groupcount_z = BG.getField @"groupcount_z" x0
            }
      , BG.getField @"groupcount_y" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "groupcount_y" (BG.Ptr SDL_GPUIndirectDispatchCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"groupcount_y")

instance HasCField.HasCField SDL_GPUIndirectDispatchCommand "groupcount_y" where
  type
    CFieldType SDL_GPUIndirectDispatchCommand "groupcount_y" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "groupcount_z" SDL_GPUIndirectDispatchCommand ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUIndirectDispatchCommand
            { groupcount_z = y1
            , groupcount_x = BG.getField @"groupcount_x" x0
            , groupcount_y = BG.getField @"groupcount_y" x0
            }
      , BG.getField @"groupcount_z" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "groupcount_z" (BG.Ptr SDL_GPUIndirectDispatchCommand) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"groupcount_z")

instance HasCField.HasCField SDL_GPUIndirectDispatchCommand "groupcount_z" where
  type
    CFieldType SDL_GPUIndirectDispatchCommand "groupcount_z" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

-- | A structure specifying the parameters of a sampler.
--
--     Note that mip_lod_bias is a no-op for the Metal driver. For Metal, LOD bias must be applied via shader instead.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUSampler', 'SDL_GPUFilter', 'SDL_GPUSamplerMipmapMode', 'SDL_GPUSamplerAddressMode', 'SDL_GPUCompareOp'
--
--     [C declaration]: @struct SDL_GPUSamplerCreateInfo@, defined at @SDL3\/SDL_gpu.h 1605:16@
data SDL_GPUSamplerCreateInfo = SDL_GPUSamplerCreateInfo
  { min_filter :: SDL_GPUFilter
  -- ^ The minification filter to apply to lookups.
  --
  --          [C declaration]: @min_filter@, defined at @SDL3\/SDL_gpu.h 1607:19@
  , mag_filter :: SDL_GPUFilter
  -- ^ The magnification filter to apply to lookups.
  --
  --          [C declaration]: @mag_filter@, defined at @SDL3\/SDL_gpu.h 1608:19@
  , mipmap_mode :: SDL_GPUSamplerMipmapMode
  -- ^ The mipmap filter to apply to lookups.
  --
  --          [C declaration]: @mipmap_mode@, defined at @SDL3\/SDL_gpu.h 1609:30@
  , address_mode_u :: SDL_GPUSamplerAddressMode
  -- ^ The addressing mode for U coordinates outside [0, 1).
  --
  --          [C declaration]: @address_mode_u@, defined at @SDL3\/SDL_gpu.h 1610:31@
  , address_mode_v :: SDL_GPUSamplerAddressMode
  -- ^ The addressing mode for V coordinates outside [0, 1).
  --
  --          [C declaration]: @address_mode_v@, defined at @SDL3\/SDL_gpu.h 1611:31@
  , address_mode_w :: SDL_GPUSamplerAddressMode
  -- ^ The addressing mode for W coordinates outside [0, 1).
  --
  --          [C declaration]: @address_mode_w@, defined at @SDL3\/SDL_gpu.h 1612:31@
  , mip_lod_bias :: BG.CFloat
  -- ^ The bias to be added to mipmap LOD calculation.
  --
  --          [C declaration]: @mip_lod_bias@, defined at @SDL3\/SDL_gpu.h 1613:11@
  , max_anisotropy :: BG.CFloat
  -- ^ The anisotropy value clamp used by the sampler. If enable_anisotropy is false, this is ignored.
  --
  --          [C declaration]: @max_anisotropy@, defined at @SDL3\/SDL_gpu.h 1614:11@
  , compare_op :: SDL_GPUCompareOp
  -- ^ The comparison operator to apply to fetched data before filtering.
  --
  --          [C declaration]: @compare_op@, defined at @SDL3\/SDL_gpu.h 1615:22@
  , min_lod :: BG.CFloat
  -- ^ Clamps the minimum of the computed LOD value.
  --
  --          [C declaration]: @min_lod@, defined at @SDL3\/SDL_gpu.h 1616:11@
  , max_lod :: BG.CFloat
  -- ^ Clamps the maximum of the computed LOD value.
  --
  --          [C declaration]: @max_lod@, defined at @SDL3\/SDL_gpu.h 1617:11@
  , enable_anisotropy :: BG.CBool
  -- ^ true to enable anisotropic filtering.
  --
  --          [C declaration]: @enable_anisotropy@, defined at @SDL3\/SDL_gpu.h 1618:10@
  , enable_compare :: BG.CBool
  -- ^ true to enable comparison against a reference value during lookups.
  --
  --          [C declaration]: @enable_compare@, defined at @SDL3\/SDL_gpu.h 1619:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_gpu.h 1620:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 1621:11@
  , props :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^ A properties ID for extensions. Should be 0 if no extensions are needed.
  --
  --          [C declaration]: @props@, defined at @SDL3\/SDL_gpu.h 1623:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUSamplerCreateInfo where
  staticSizeOf = \_ -> (52 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUSamplerCreateInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUSamplerCreateInfo
        <*> HasCField.readRaw (BG.Proxy @"min_filter") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mag_filter") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mipmap_mode") ptr0
        <*> HasCField.readRaw (BG.Proxy @"address_mode_u") ptr0
        <*> HasCField.readRaw (BG.Proxy @"address_mode_v") ptr0
        <*> HasCField.readRaw (BG.Proxy @"address_mode_w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mip_lod_bias") ptr0
        <*> HasCField.readRaw (BG.Proxy @"max_anisotropy") ptr0
        <*> HasCField.readRaw (BG.Proxy @"compare_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"min_lod") ptr0
        <*> HasCField.readRaw (BG.Proxy @"max_lod") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_anisotropy") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_compare") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"props") ptr0

instance Marshal.WriteRaw SDL_GPUSamplerCreateInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUSamplerCreateInfo
            min_filter2
            mag_filter3
            mipmap_mode4
            address_mode_u5
            address_mode_v6
            address_mode_w7
            mip_lod_bias8
            max_anisotropy9
            compare_op10
            min_lod11
            max_lod12
            enable_anisotropy13
            enable_compare14
            padding115
            padding216
            props17 ->
              HasCField.writeRaw (BG.Proxy @"min_filter") ptr0 min_filter2
                >> HasCField.writeRaw (BG.Proxy @"mag_filter") ptr0 mag_filter3
                >> HasCField.writeRaw (BG.Proxy @"mipmap_mode") ptr0 mipmap_mode4
                >> HasCField.writeRaw (BG.Proxy @"address_mode_u") ptr0 address_mode_u5
                >> HasCField.writeRaw (BG.Proxy @"address_mode_v") ptr0 address_mode_v6
                >> HasCField.writeRaw (BG.Proxy @"address_mode_w") ptr0 address_mode_w7
                >> HasCField.writeRaw (BG.Proxy @"mip_lod_bias") ptr0 mip_lod_bias8
                >> HasCField.writeRaw (BG.Proxy @"max_anisotropy") ptr0 max_anisotropy9
                >> HasCField.writeRaw (BG.Proxy @"compare_op") ptr0 compare_op10
                >> HasCField.writeRaw (BG.Proxy @"min_lod") ptr0 min_lod11
                >> HasCField.writeRaw (BG.Proxy @"max_lod") ptr0 max_lod12
                >> HasCField.writeRaw (BG.Proxy @"enable_anisotropy") ptr0 enable_anisotropy13
                >> HasCField.writeRaw (BG.Proxy @"enable_compare") ptr0 enable_compare14
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding115
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding216
                >> HasCField.writeRaw (BG.Proxy @"props") ptr0 props17

deriving via
  Marshal.EquivStorable SDL_GPUSamplerCreateInfo
  instance
    BG.Storable SDL_GPUSamplerCreateInfo

instance
  (ty ~ SDL_GPUFilter)
  => BG.CompatHasField.HasField "min_filter" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { min_filter = y1
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"min_filter" x0
      )

instance
  (ty ~ SDL_GPUFilter)
  => BG.HasField "min_filter" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"min_filter")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "min_filter" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "min_filter" =
      SDL_GPUFilter

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_GPUFilter)
  => BG.CompatHasField.HasField "mag_filter" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { mag_filter = y1
            , min_filter = BG.getField @"min_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"mag_filter" x0
      )

instance
  (ty ~ SDL_GPUFilter)
  => BG.HasField "mag_filter" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mag_filter")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "mag_filter" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "mag_filter" =
      SDL_GPUFilter

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL_GPUSamplerMipmapMode)
  => BG.CompatHasField.HasField "mipmap_mode" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { mipmap_mode = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"mipmap_mode" x0
      )

instance
  (ty ~ SDL_GPUSamplerMipmapMode)
  => BG.HasField "mipmap_mode" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"mipmap_mode")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "mipmap_mode" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "mipmap_mode" =
      SDL_GPUSamplerMipmapMode

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL_GPUSamplerAddressMode)
  => BG.CompatHasField.HasField "address_mode_u" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { address_mode_u = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"address_mode_u" x0
      )

instance
  (ty ~ SDL_GPUSamplerAddressMode)
  => BG.HasField "address_mode_u" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"address_mode_u")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "address_mode_u" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "address_mode_u" =
      SDL_GPUSamplerAddressMode

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL_GPUSamplerAddressMode)
  => BG.CompatHasField.HasField "address_mode_v" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { address_mode_v = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"address_mode_v" x0
      )

instance
  (ty ~ SDL_GPUSamplerAddressMode)
  => BG.HasField "address_mode_v" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"address_mode_v")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "address_mode_v" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "address_mode_v" =
      SDL_GPUSamplerAddressMode

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL_GPUSamplerAddressMode)
  => BG.CompatHasField.HasField "address_mode_w" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { address_mode_w = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"address_mode_w" x0
      )

instance
  (ty ~ SDL_GPUSamplerAddressMode)
  => BG.HasField "address_mode_w" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"address_mode_w")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "address_mode_w" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "address_mode_w" =
      SDL_GPUSamplerAddressMode

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "mip_lod_bias" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { mip_lod_bias = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"mip_lod_bias" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "mip_lod_bias" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"mip_lod_bias")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "mip_lod_bias" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "mip_lod_bias" =
      BG.CFloat

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "max_anisotropy" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { max_anisotropy = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"max_anisotropy" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "max_anisotropy" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"max_anisotropy")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "max_anisotropy" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "max_anisotropy" =
      BG.CFloat

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL_GPUCompareOp)
  => BG.CompatHasField.HasField "compare_op" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { compare_op = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"compare_op" x0
      )

instance
  (ty ~ SDL_GPUCompareOp)
  => BG.HasField "compare_op" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"compare_op")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "compare_op" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "compare_op" =
      SDL_GPUCompareOp

  offset# = \_ -> \_ -> 32

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "min_lod" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { min_lod = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"min_lod" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "min_lod" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"min_lod")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "min_lod" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "min_lod" =
      BG.CFloat

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "max_lod" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { max_lod = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"max_lod" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "max_lod" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"max_lod")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "max_lod" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "max_lod" =
      BG.CFloat

  offset# = \_ -> \_ -> 40

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_anisotropy" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { enable_anisotropy = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"enable_anisotropy" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_anisotropy" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_anisotropy")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "enable_anisotropy" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "enable_anisotropy" =
      BG.CBool

  offset# = \_ -> \_ -> 44

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_compare" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { enable_compare = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"enable_compare" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_compare" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_compare")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "enable_compare" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "enable_compare" =
      BG.CBool

  offset# = \_ -> \_ -> 45

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { padding1 = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding2 = BG.getField @"padding2" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "padding1" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 46

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { padding2 = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "padding2" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 47

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.CompatHasField.HasField "props" SDL_GPUSamplerCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUSamplerCreateInfo
            { props = y1
            , min_filter = BG.getField @"min_filter" x0
            , mag_filter = BG.getField @"mag_filter" x0
            , mipmap_mode = BG.getField @"mipmap_mode" x0
            , address_mode_u = BG.getField @"address_mode_u" x0
            , address_mode_v = BG.getField @"address_mode_v" x0
            , address_mode_w = BG.getField @"address_mode_w" x0
            , mip_lod_bias = BG.getField @"mip_lod_bias" x0
            , max_anisotropy = BG.getField @"max_anisotropy" x0
            , compare_op = BG.getField @"compare_op" x0
            , min_lod = BG.getField @"min_lod" x0
            , max_lod = BG.getField @"max_lod" x0
            , enable_anisotropy = BG.getField @"enable_anisotropy" x0
            , enable_compare = BG.getField @"enable_compare" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"props" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.HasField "props" (BG.Ptr SDL_GPUSamplerCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"props")

instance HasCField.HasCField SDL_GPUSamplerCreateInfo "props" where
  type
    CFieldType SDL_GPUSamplerCreateInfo "props" =
      SDL3.Sys.Bindgen.Properties.SDL_PropertiesID

  offset# = \_ -> \_ -> 48

-- | A structure specifying the parameters of vertex buffers used in a graphics pipeline.
--
--     When you call SDL_BindGPUVertexBuffers, you specify the binding slots of the vertex buffers. For example if you called SDL_BindGPUVertexBuffers with a first_slot of 2 and num_bindings of 3, the binding slots 2, 3, 4 would be used by the vertex buffers you pass in.
--
--     Vertex attributes are linked to buffers via the buffer_slot field of 'SDL_GPUVertexAttribute'. For example, if an attribute has a buffer_slot of 0, then that attribute belongs to the vertex buffer bound at slot 0.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUVertexAttribute', 'SDL_GPUVertexInputRate'
--
--     [C declaration]: @struct SDL_GPUVertexBufferDescription@, defined at @SDL3\/SDL_gpu.h 1644:16@
data SDL_GPUVertexBufferDescription = SDL_GPUVertexBufferDescription
  { slot :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The binding slot of the vertex buffer.
  --
  --          [C declaration]: @slot@, defined at @SDL3\/SDL_gpu.h 1646:12@
  , pitch :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The size of a single element + the offset between elements.
  --
  --          [C declaration]: @pitch@, defined at @SDL3\/SDL_gpu.h 1647:12@
  , input_rate :: SDL_GPUVertexInputRate
  -- ^ Whether attribute addressing is a function of the vertex index or instance index.
  --
  --          [C declaration]: @input_rate@, defined at @SDL3\/SDL_gpu.h 1648:28@
  , instance_step_rate :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Reserved for future use. Must be set to 0.
  --
  --          [C declaration]: @instance_step_rate@, defined at @SDL3\/SDL_gpu.h 1649:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUVertexBufferDescription where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUVertexBufferDescription where
  readRaw =
    \ptr0 ->
      pure SDL_GPUVertexBufferDescription
        <*> HasCField.readRaw (BG.Proxy @"slot") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pitch") ptr0
        <*> HasCField.readRaw (BG.Proxy @"input_rate") ptr0
        <*> HasCField.readRaw (BG.Proxy @"instance_step_rate") ptr0

instance Marshal.WriteRaw SDL_GPUVertexBufferDescription where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUVertexBufferDescription slot2 pitch3 input_rate4 instance_step_rate5 ->
            HasCField.writeRaw (BG.Proxy @"slot") ptr0 slot2
              >> HasCField.writeRaw (BG.Proxy @"pitch") ptr0 pitch3
              >> HasCField.writeRaw (BG.Proxy @"input_rate") ptr0 input_rate4
              >> HasCField.writeRaw (BG.Proxy @"instance_step_rate") ptr0 instance_step_rate5

deriving via
  Marshal.EquivStorable SDL_GPUVertexBufferDescription
  instance
    BG.Storable SDL_GPUVertexBufferDescription

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "slot" SDL_GPUVertexBufferDescription ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexBufferDescription
            { slot = y1
            , pitch = BG.getField @"pitch" x0
            , input_rate = BG.getField @"input_rate" x0
            , instance_step_rate = BG.getField @"instance_step_rate" x0
            }
      , BG.getField @"slot" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "slot" (BG.Ptr SDL_GPUVertexBufferDescription) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"slot")

instance HasCField.HasCField SDL_GPUVertexBufferDescription "slot" where
  type
    CFieldType SDL_GPUVertexBufferDescription "slot" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "pitch" SDL_GPUVertexBufferDescription ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexBufferDescription
            { pitch = y1
            , slot = BG.getField @"slot" x0
            , input_rate = BG.getField @"input_rate" x0
            , instance_step_rate = BG.getField @"instance_step_rate" x0
            }
      , BG.getField @"pitch" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "pitch" (BG.Ptr SDL_GPUVertexBufferDescription) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pitch")

instance HasCField.HasCField SDL_GPUVertexBufferDescription "pitch" where
  type
    CFieldType SDL_GPUVertexBufferDescription "pitch" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL_GPUVertexInputRate)
  => BG.CompatHasField.HasField "input_rate" SDL_GPUVertexBufferDescription ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexBufferDescription
            { input_rate = y1
            , slot = BG.getField @"slot" x0
            , pitch = BG.getField @"pitch" x0
            , instance_step_rate = BG.getField @"instance_step_rate" x0
            }
      , BG.getField @"input_rate" x0
      )

instance
  (ty ~ SDL_GPUVertexInputRate)
  => BG.HasField "input_rate" (BG.Ptr SDL_GPUVertexBufferDescription) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"input_rate")

instance HasCField.HasCField SDL_GPUVertexBufferDescription "input_rate" where
  type
    CFieldType SDL_GPUVertexBufferDescription "input_rate" =
      SDL_GPUVertexInputRate

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "instance_step_rate" SDL_GPUVertexBufferDescription ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexBufferDescription
            { instance_step_rate = y1
            , slot = BG.getField @"slot" x0
            , pitch = BG.getField @"pitch" x0
            , input_rate = BG.getField @"input_rate" x0
            }
      , BG.getField @"instance_step_rate" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "instance_step_rate" (BG.Ptr SDL_GPUVertexBufferDescription) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"instance_step_rate")

instance HasCField.HasCField SDL_GPUVertexBufferDescription "instance_step_rate" where
  type
    CFieldType SDL_GPUVertexBufferDescription "instance_step_rate" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

-- | A structure specifying a vertex attribute.
--
--     All vertex attribute locations provided to an 'SDL_GPUVertexInputState' must be unique.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUVertexBufferDescription', 'SDL_GPUVertexInputState', 'SDL_GPUVertexElementFormat'
--
--     [C declaration]: @struct SDL_GPUVertexAttribute@, defined at @SDL3\/SDL_gpu.h 1664:16@
data SDL_GPUVertexAttribute = SDL_GPUVertexAttribute
  { location :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The shader input location index.
  --
  --          [C declaration]: @location@, defined at @SDL3\/SDL_gpu.h 1666:12@
  , buffer_slot :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The binding slot of the associated vertex buffer.
  --
  --          [C declaration]: @buffer_slot@, defined at @SDL3\/SDL_gpu.h 1667:12@
  , format :: SDL_GPUVertexElementFormat
  -- ^ The size and type of the attribute data.
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_gpu.h 1668:32@
  , offset :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The byte offset of this attribute relative to the start of the vertex element.
  --
  --          [C declaration]: @offset@, defined at @SDL3\/SDL_gpu.h 1669:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUVertexAttribute where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUVertexAttribute where
  readRaw =
    \ptr0 ->
      pure SDL_GPUVertexAttribute
        <*> HasCField.readRaw (BG.Proxy @"location") ptr0
        <*> HasCField.readRaw (BG.Proxy @"buffer_slot") ptr0
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"offset") ptr0

instance Marshal.WriteRaw SDL_GPUVertexAttribute where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUVertexAttribute location2 buffer_slot3 format4 offset5 ->
            HasCField.writeRaw (BG.Proxy @"location") ptr0 location2
              >> HasCField.writeRaw (BG.Proxy @"buffer_slot") ptr0 buffer_slot3
              >> HasCField.writeRaw (BG.Proxy @"format") ptr0 format4
              >> HasCField.writeRaw (BG.Proxy @"offset") ptr0 offset5

deriving via
  Marshal.EquivStorable SDL_GPUVertexAttribute
  instance
    BG.Storable SDL_GPUVertexAttribute

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "location" SDL_GPUVertexAttribute ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexAttribute
            { location = y1
            , buffer_slot = BG.getField @"buffer_slot" x0
            , format = BG.getField @"format" x0
            , offset = BG.getField @"offset" x0
            }
      , BG.getField @"location" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "location" (BG.Ptr SDL_GPUVertexAttribute) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"location")

instance HasCField.HasCField SDL_GPUVertexAttribute "location" where
  type
    CFieldType SDL_GPUVertexAttribute "location" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "buffer_slot" SDL_GPUVertexAttribute ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexAttribute
            { buffer_slot = y1
            , location = BG.getField @"location" x0
            , format = BG.getField @"format" x0
            , offset = BG.getField @"offset" x0
            }
      , BG.getField @"buffer_slot" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "buffer_slot" (BG.Ptr SDL_GPUVertexAttribute) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"buffer_slot")

instance HasCField.HasCField SDL_GPUVertexAttribute "buffer_slot" where
  type
    CFieldType SDL_GPUVertexAttribute "buffer_slot" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL_GPUVertexElementFormat)
  => BG.CompatHasField.HasField "format" SDL_GPUVertexAttribute ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexAttribute
            { format = y1
            , location = BG.getField @"location" x0
            , buffer_slot = BG.getField @"buffer_slot" x0
            , offset = BG.getField @"offset" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL_GPUVertexElementFormat)
  => BG.HasField "format" (BG.Ptr SDL_GPUVertexAttribute) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_GPUVertexAttribute "format" where
  type
    CFieldType SDL_GPUVertexAttribute "format" =
      SDL_GPUVertexElementFormat

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "offset" SDL_GPUVertexAttribute ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexAttribute
            { offset = y1
            , location = BG.getField @"location" x0
            , buffer_slot = BG.getField @"buffer_slot" x0
            , format = BG.getField @"format" x0
            }
      , BG.getField @"offset" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "offset" (BG.Ptr SDL_GPUVertexAttribute) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"offset")

instance HasCField.HasCField SDL_GPUVertexAttribute "offset" where
  type
    CFieldType SDL_GPUVertexAttribute "offset" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

-- | A structure specifying the parameters of a graphics pipeline vertex input state.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUGraphicsPipelineCreateInfo', 'SDL_GPUVertexBufferDescription', 'SDL_GPUVertexAttribute'
--
--     [C declaration]: @struct SDL_GPUVertexInputState@, defined at @SDL3\/SDL_gpu.h 1682:16@
data SDL_GPUVertexInputState = SDL_GPUVertexInputState
  { vertex_buffer_descriptions :: PtrConst.PtrConst SDL_GPUVertexBufferDescription
  -- ^ A pointer to an array of vertex buffer descriptions.
  --
  --          [C declaration]: @vertex_buffer_descriptions@, defined at @SDL3\/SDL_gpu.h 1684:43@
  , num_vertex_buffers :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of vertex buffer descriptions in the above array.
  --
  --          [C declaration]: @num_vertex_buffers@, defined at @SDL3\/SDL_gpu.h 1685:12@
  , vertex_attributes :: PtrConst.PtrConst SDL_GPUVertexAttribute
  -- ^ A pointer to an array of vertex attribute descriptions.
  --
  --          [C declaration]: @vertex_attributes@, defined at @SDL3\/SDL_gpu.h 1686:35@
  , num_vertex_attributes :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of vertex attribute descriptions in the above array.
  --
  --          [C declaration]: @num_vertex_attributes@, defined at @SDL3\/SDL_gpu.h 1687:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUVertexInputState where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUVertexInputState where
  readRaw =
    \ptr0 ->
      pure SDL_GPUVertexInputState
        <*> HasCField.readRaw (BG.Proxy @"vertex_buffer_descriptions") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_vertex_buffers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"vertex_attributes") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_vertex_attributes") ptr0

instance Marshal.WriteRaw SDL_GPUVertexInputState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUVertexInputState
            vertex_buffer_descriptions2
            num_vertex_buffers3
            vertex_attributes4
            num_vertex_attributes5 ->
              HasCField.writeRaw (BG.Proxy @"vertex_buffer_descriptions") ptr0 vertex_buffer_descriptions2
                >> HasCField.writeRaw (BG.Proxy @"num_vertex_buffers") ptr0 num_vertex_buffers3
                >> HasCField.writeRaw (BG.Proxy @"vertex_attributes") ptr0 vertex_attributes4
                >> HasCField.writeRaw (BG.Proxy @"num_vertex_attributes") ptr0 num_vertex_attributes5

deriving via
  Marshal.EquivStorable SDL_GPUVertexInputState
  instance
    BG.Storable SDL_GPUVertexInputState

instance
  (ty ~ PtrConst.PtrConst SDL_GPUVertexBufferDescription)
  => BG.CompatHasField.HasField "vertex_buffer_descriptions" SDL_GPUVertexInputState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexInputState
            { vertex_buffer_descriptions = y1
            , num_vertex_buffers = BG.getField @"num_vertex_buffers" x0
            , vertex_attributes = BG.getField @"vertex_attributes" x0
            , num_vertex_attributes = BG.getField @"num_vertex_attributes" x0
            }
      , BG.getField @"vertex_buffer_descriptions" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL_GPUVertexBufferDescription)
  => BG.HasField "vertex_buffer_descriptions" (BG.Ptr SDL_GPUVertexInputState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"vertex_buffer_descriptions")

instance HasCField.HasCField SDL_GPUVertexInputState "vertex_buffer_descriptions" where
  type
    CFieldType SDL_GPUVertexInputState "vertex_buffer_descriptions" =
      PtrConst.PtrConst SDL_GPUVertexBufferDescription

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_vertex_buffers" SDL_GPUVertexInputState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexInputState
            { num_vertex_buffers = y1
            , vertex_buffer_descriptions = BG.getField @"vertex_buffer_descriptions" x0
            , vertex_attributes = BG.getField @"vertex_attributes" x0
            , num_vertex_attributes = BG.getField @"num_vertex_attributes" x0
            }
      , BG.getField @"num_vertex_buffers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_vertex_buffers" (BG.Ptr SDL_GPUVertexInputState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_vertex_buffers")

instance HasCField.HasCField SDL_GPUVertexInputState "num_vertex_buffers" where
  type
    CFieldType SDL_GPUVertexInputState "num_vertex_buffers" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ PtrConst.PtrConst SDL_GPUVertexAttribute)
  => BG.CompatHasField.HasField "vertex_attributes" SDL_GPUVertexInputState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexInputState
            { vertex_attributes = y1
            , vertex_buffer_descriptions = BG.getField @"vertex_buffer_descriptions" x0
            , num_vertex_buffers = BG.getField @"num_vertex_buffers" x0
            , num_vertex_attributes = BG.getField @"num_vertex_attributes" x0
            }
      , BG.getField @"vertex_attributes" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL_GPUVertexAttribute)
  => BG.HasField "vertex_attributes" (BG.Ptr SDL_GPUVertexInputState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"vertex_attributes")

instance HasCField.HasCField SDL_GPUVertexInputState "vertex_attributes" where
  type
    CFieldType SDL_GPUVertexInputState "vertex_attributes" =
      PtrConst.PtrConst SDL_GPUVertexAttribute

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_vertex_attributes" SDL_GPUVertexInputState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVertexInputState
            { num_vertex_attributes = y1
            , vertex_buffer_descriptions = BG.getField @"vertex_buffer_descriptions" x0
            , num_vertex_buffers = BG.getField @"num_vertex_buffers" x0
            , vertex_attributes = BG.getField @"vertex_attributes" x0
            }
      , BG.getField @"num_vertex_attributes" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_vertex_attributes" (BG.Ptr SDL_GPUVertexInputState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_vertex_attributes")

instance HasCField.HasCField SDL_GPUVertexInputState "num_vertex_attributes" where
  type
    CFieldType SDL_GPUVertexInputState "num_vertex_attributes" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 24

-- | A structure specifying the stencil operation state of a graphics pipeline.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUDepthStencilState'
--
--     [C declaration]: @struct SDL_GPUStencilOpState@, defined at @SDL3\/SDL_gpu.h 1697:16@
data SDL_GPUStencilOpState = SDL_GPUStencilOpState
  { fail_op :: SDL_GPUStencilOp
  -- ^ The action performed on samples that fail the stencil test.
  --
  --          [C declaration]: @fail_op@, defined at @SDL3\/SDL_gpu.h 1699:22@
  , pass_op :: SDL_GPUStencilOp
  -- ^ The action performed on samples that pass the depth and stencil tests.
  --
  --          [C declaration]: @pass_op@, defined at @SDL3\/SDL_gpu.h 1700:22@
  , depth_fail_op :: SDL_GPUStencilOp
  -- ^ The action performed on samples that pass the stencil test and fail the depth test.
  --
  --          [C declaration]: @depth_fail_op@, defined at @SDL3\/SDL_gpu.h 1701:22@
  , compare_op :: SDL_GPUCompareOp
  -- ^ The comparison operator used in the stencil test.
  --
  --          [C declaration]: @compare_op@, defined at @SDL3\/SDL_gpu.h 1702:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUStencilOpState where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUStencilOpState where
  readRaw =
    \ptr0 ->
      pure SDL_GPUStencilOpState
        <*> HasCField.readRaw (BG.Proxy @"fail_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pass_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"depth_fail_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"compare_op") ptr0

instance Marshal.WriteRaw SDL_GPUStencilOpState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUStencilOpState fail_op2 pass_op3 depth_fail_op4 compare_op5 ->
            HasCField.writeRaw (BG.Proxy @"fail_op") ptr0 fail_op2
              >> HasCField.writeRaw (BG.Proxy @"pass_op") ptr0 pass_op3
              >> HasCField.writeRaw (BG.Proxy @"depth_fail_op") ptr0 depth_fail_op4
              >> HasCField.writeRaw (BG.Proxy @"compare_op") ptr0 compare_op5

deriving via Marshal.EquivStorable SDL_GPUStencilOpState instance BG.Storable SDL_GPUStencilOpState

instance
  (ty ~ SDL_GPUStencilOp)
  => BG.CompatHasField.HasField "fail_op" SDL_GPUStencilOpState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStencilOpState
            { fail_op = y1
            , pass_op = BG.getField @"pass_op" x0
            , depth_fail_op = BG.getField @"depth_fail_op" x0
            , compare_op = BG.getField @"compare_op" x0
            }
      , BG.getField @"fail_op" x0
      )

instance
  (ty ~ SDL_GPUStencilOp)
  => BG.HasField "fail_op" (BG.Ptr SDL_GPUStencilOpState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fail_op")

instance HasCField.HasCField SDL_GPUStencilOpState "fail_op" where
  type
    CFieldType SDL_GPUStencilOpState "fail_op" =
      SDL_GPUStencilOp

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_GPUStencilOp)
  => BG.CompatHasField.HasField "pass_op" SDL_GPUStencilOpState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStencilOpState
            { pass_op = y1
            , fail_op = BG.getField @"fail_op" x0
            , depth_fail_op = BG.getField @"depth_fail_op" x0
            , compare_op = BG.getField @"compare_op" x0
            }
      , BG.getField @"pass_op" x0
      )

instance
  (ty ~ SDL_GPUStencilOp)
  => BG.HasField "pass_op" (BG.Ptr SDL_GPUStencilOpState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pass_op")

instance HasCField.HasCField SDL_GPUStencilOpState "pass_op" where
  type
    CFieldType SDL_GPUStencilOpState "pass_op" =
      SDL_GPUStencilOp

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL_GPUStencilOp)
  => BG.CompatHasField.HasField "depth_fail_op" SDL_GPUStencilOpState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStencilOpState
            { depth_fail_op = y1
            , fail_op = BG.getField @"fail_op" x0
            , pass_op = BG.getField @"pass_op" x0
            , compare_op = BG.getField @"compare_op" x0
            }
      , BG.getField @"depth_fail_op" x0
      )

instance
  (ty ~ SDL_GPUStencilOp)
  => BG.HasField "depth_fail_op" (BG.Ptr SDL_GPUStencilOpState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"depth_fail_op")

instance HasCField.HasCField SDL_GPUStencilOpState "depth_fail_op" where
  type
    CFieldType SDL_GPUStencilOpState "depth_fail_op" =
      SDL_GPUStencilOp

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL_GPUCompareOp)
  => BG.CompatHasField.HasField "compare_op" SDL_GPUStencilOpState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStencilOpState
            { compare_op = y1
            , fail_op = BG.getField @"fail_op" x0
            , pass_op = BG.getField @"pass_op" x0
            , depth_fail_op = BG.getField @"depth_fail_op" x0
            }
      , BG.getField @"compare_op" x0
      )

instance
  (ty ~ SDL_GPUCompareOp)
  => BG.HasField "compare_op" (BG.Ptr SDL_GPUStencilOpState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"compare_op")

instance HasCField.HasCField SDL_GPUStencilOpState "compare_op" where
  type
    CFieldType SDL_GPUStencilOpState "compare_op" =
      SDL_GPUCompareOp

  offset# = \_ -> \_ -> 12

-- | A structure specifying the blend state of a color target.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUColorTargetDescription', 'SDL_GPUBlendFactor', 'SDL_GPUBlendOp', 'SDL_GPUColorComponentFlags'
--
--     [C declaration]: @struct SDL_GPUColorTargetBlendState@, defined at @SDL3\/SDL_gpu.h 1715:16@
data SDL_GPUColorTargetBlendState = SDL_GPUColorTargetBlendState
  { src_color_blendfactor :: SDL_GPUBlendFactor
  -- ^ The value to be multiplied by the source RGB value.
  --
  --          [C declaration]: @src_color_blendfactor@, defined at @SDL3\/SDL_gpu.h 1717:24@
  , dst_color_blendfactor :: SDL_GPUBlendFactor
  -- ^ The value to be multiplied by the destination RGB value.
  --
  --          [C declaration]: @dst_color_blendfactor@, defined at @SDL3\/SDL_gpu.h 1718:24@
  , color_blend_op :: SDL_GPUBlendOp
  -- ^ The blend operation for the RGB components.
  --
  --          [C declaration]: @color_blend_op@, defined at @SDL3\/SDL_gpu.h 1719:20@
  , src_alpha_blendfactor :: SDL_GPUBlendFactor
  -- ^ The value to be multiplied by the source alpha.
  --
  --          [C declaration]: @src_alpha_blendfactor@, defined at @SDL3\/SDL_gpu.h 1720:24@
  , dst_alpha_blendfactor :: SDL_GPUBlendFactor
  -- ^ The value to be multiplied by the destination alpha.
  --
  --          [C declaration]: @dst_alpha_blendfactor@, defined at @SDL3\/SDL_gpu.h 1721:24@
  , alpha_blend_op :: SDL_GPUBlendOp
  -- ^ The blend operation for the alpha component.
  --
  --          [C declaration]: @alpha_blend_op@, defined at @SDL3\/SDL_gpu.h 1722:20@
  , color_write_mask :: SDL_GPUColorComponentFlags
  -- ^ A bitmask specifying which of the RGBA components are enabled for writing. Writes to all channels if enable_color_write_mask is false.
  --
  --          [C declaration]: @color_write_mask@, defined at @SDL3\/SDL_gpu.h 1723:32@
  , enable_blend :: BG.CBool
  -- ^ Whether blending is enabled for the color target.
  --
  --          [C declaration]: @enable_blend@, defined at @SDL3\/SDL_gpu.h 1724:10@
  , enable_color_write_mask :: BG.CBool
  -- ^ Whether the color write mask is enabled.
  --
  --          [C declaration]: @enable_color_write_mask@, defined at @SDL3\/SDL_gpu.h 1725:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_gpu.h 1726:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 1727:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUColorTargetBlendState where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUColorTargetBlendState where
  readRaw =
    \ptr0 ->
      pure SDL_GPUColorTargetBlendState
        <*> HasCField.readRaw (BG.Proxy @"src_color_blendfactor") ptr0
        <*> HasCField.readRaw (BG.Proxy @"dst_color_blendfactor") ptr0
        <*> HasCField.readRaw (BG.Proxy @"color_blend_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"src_alpha_blendfactor") ptr0
        <*> HasCField.readRaw (BG.Proxy @"dst_alpha_blendfactor") ptr0
        <*> HasCField.readRaw (BG.Proxy @"alpha_blend_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"color_write_mask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_blend") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_color_write_mask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0

instance Marshal.WriteRaw SDL_GPUColorTargetBlendState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUColorTargetBlendState
            src_color_blendfactor2
            dst_color_blendfactor3
            color_blend_op4
            src_alpha_blendfactor5
            dst_alpha_blendfactor6
            alpha_blend_op7
            color_write_mask8
            enable_blend9
            enable_color_write_mask10
            padding111
            padding212 ->
              HasCField.writeRaw (BG.Proxy @"src_color_blendfactor") ptr0 src_color_blendfactor2
                >> HasCField.writeRaw (BG.Proxy @"dst_color_blendfactor") ptr0 dst_color_blendfactor3
                >> HasCField.writeRaw (BG.Proxy @"color_blend_op") ptr0 color_blend_op4
                >> HasCField.writeRaw (BG.Proxy @"src_alpha_blendfactor") ptr0 src_alpha_blendfactor5
                >> HasCField.writeRaw (BG.Proxy @"dst_alpha_blendfactor") ptr0 dst_alpha_blendfactor6
                >> HasCField.writeRaw (BG.Proxy @"alpha_blend_op") ptr0 alpha_blend_op7
                >> HasCField.writeRaw (BG.Proxy @"color_write_mask") ptr0 color_write_mask8
                >> HasCField.writeRaw (BG.Proxy @"enable_blend") ptr0 enable_blend9
                >> HasCField.writeRaw (BG.Proxy @"enable_color_write_mask") ptr0 enable_color_write_mask10
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding111
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding212

deriving via
  Marshal.EquivStorable SDL_GPUColorTargetBlendState
  instance
    BG.Storable SDL_GPUColorTargetBlendState

instance
  (ty ~ SDL_GPUBlendFactor)
  => BG.CompatHasField.HasField "src_color_blendfactor" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { src_color_blendfactor = y1
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"src_color_blendfactor" x0
      )

instance
  (ty ~ SDL_GPUBlendFactor)
  => BG.HasField "src_color_blendfactor" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"src_color_blendfactor")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "src_color_blendfactor" where
  type
    CFieldType SDL_GPUColorTargetBlendState "src_color_blendfactor" =
      SDL_GPUBlendFactor

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_GPUBlendFactor)
  => BG.CompatHasField.HasField "dst_color_blendfactor" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { dst_color_blendfactor = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"dst_color_blendfactor" x0
      )

instance
  (ty ~ SDL_GPUBlendFactor)
  => BG.HasField "dst_color_blendfactor" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"dst_color_blendfactor")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "dst_color_blendfactor" where
  type
    CFieldType SDL_GPUColorTargetBlendState "dst_color_blendfactor" =
      SDL_GPUBlendFactor

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL_GPUBlendOp)
  => BG.CompatHasField.HasField "color_blend_op" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { color_blend_op = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"color_blend_op" x0
      )

instance
  (ty ~ SDL_GPUBlendOp)
  => BG.HasField "color_blend_op" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"color_blend_op")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "color_blend_op" where
  type
    CFieldType SDL_GPUColorTargetBlendState "color_blend_op" =
      SDL_GPUBlendOp

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL_GPUBlendFactor)
  => BG.CompatHasField.HasField "src_alpha_blendfactor" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { src_alpha_blendfactor = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"src_alpha_blendfactor" x0
      )

instance
  (ty ~ SDL_GPUBlendFactor)
  => BG.HasField "src_alpha_blendfactor" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"src_alpha_blendfactor")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "src_alpha_blendfactor" where
  type
    CFieldType SDL_GPUColorTargetBlendState "src_alpha_blendfactor" =
      SDL_GPUBlendFactor

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL_GPUBlendFactor)
  => BG.CompatHasField.HasField "dst_alpha_blendfactor" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { dst_alpha_blendfactor = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"dst_alpha_blendfactor" x0
      )

instance
  (ty ~ SDL_GPUBlendFactor)
  => BG.HasField "dst_alpha_blendfactor" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"dst_alpha_blendfactor")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "dst_alpha_blendfactor" where
  type
    CFieldType SDL_GPUColorTargetBlendState "dst_alpha_blendfactor" =
      SDL_GPUBlendFactor

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL_GPUBlendOp)
  => BG.CompatHasField.HasField "alpha_blend_op" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { alpha_blend_op = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"alpha_blend_op" x0
      )

instance
  (ty ~ SDL_GPUBlendOp)
  => BG.HasField "alpha_blend_op" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"alpha_blend_op")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "alpha_blend_op" where
  type
    CFieldType SDL_GPUColorTargetBlendState "alpha_blend_op" =
      SDL_GPUBlendOp

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL_GPUColorComponentFlags)
  => BG.CompatHasField.HasField "color_write_mask" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { color_write_mask = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"color_write_mask" x0
      )

instance
  (ty ~ SDL_GPUColorComponentFlags)
  => BG.HasField "color_write_mask" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"color_write_mask")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "color_write_mask" where
  type
    CFieldType SDL_GPUColorTargetBlendState "color_write_mask" =
      SDL_GPUColorComponentFlags

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_blend" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { enable_blend = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"enable_blend" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_blend" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_blend")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "enable_blend" where
  type
    CFieldType SDL_GPUColorTargetBlendState "enable_blend" =
      BG.CBool

  offset# = \_ -> \_ -> 25

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_color_write_mask" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { enable_color_write_mask = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"enable_color_write_mask" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_color_write_mask" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_color_write_mask")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "enable_color_write_mask" where
  type
    CFieldType SDL_GPUColorTargetBlendState "enable_color_write_mask" =
      BG.CBool

  offset# = \_ -> \_ -> 26

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { padding1 = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "padding1" where
  type
    CFieldType SDL_GPUColorTargetBlendState "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 27

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPUColorTargetBlendState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetBlendState
            { padding2 = y1
            , src_color_blendfactor = BG.getField @"src_color_blendfactor" x0
            , dst_color_blendfactor = BG.getField @"dst_color_blendfactor" x0
            , color_blend_op = BG.getField @"color_blend_op" x0
            , src_alpha_blendfactor = BG.getField @"src_alpha_blendfactor" x0
            , dst_alpha_blendfactor = BG.getField @"dst_alpha_blendfactor" x0
            , alpha_blend_op = BG.getField @"alpha_blend_op" x0
            , color_write_mask = BG.getField @"color_write_mask" x0
            , enable_blend = BG.getField @"enable_blend" x0
            , enable_color_write_mask = BG.getField @"enable_color_write_mask" x0
            , padding1 = BG.getField @"padding1" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPUColorTargetBlendState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPUColorTargetBlendState "padding2" where
  type
    CFieldType SDL_GPUColorTargetBlendState "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 28

-- | A structure specifying code and metadata for creating a shader object.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader', 'SDL_GPUShaderFormat', 'SDL_GPUShaderStage'
--
--     [C declaration]: @struct SDL_GPUShaderCreateInfo@, defined at @SDL3\/SDL_gpu.h 1740:16@
data SDL_GPUShaderCreateInfo = SDL_GPUShaderCreateInfo
  { code_size :: HsBindgen.Runtime.LibC.CSize
  -- ^ The size in bytes of the code pointed to.
  --
  --          [C declaration]: @code_size@, defined at @SDL3\/SDL_gpu.h 1742:12@
  , code :: PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ A pointer to shader code.
  --
  --          [C declaration]: @code@, defined at @SDL3\/SDL_gpu.h 1743:18@
  , entrypoint :: PtrConst.PtrConst BG.CChar
  -- ^ A pointer to a null-terminated UTF-8 string specifying the entry point function name for the shader.
  --
  --          [C declaration]: @entrypoint@, defined at @SDL3\/SDL_gpu.h 1744:17@
  , format :: SDL_GPUShaderFormat
  -- ^ The format of the shader code.
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_gpu.h 1745:25@
  , stage :: SDL_GPUShaderStage
  -- ^ The stage the shader program corresponds to.
  --
  --          [C declaration]: @stage@, defined at @SDL3\/SDL_gpu.h 1746:24@
  , num_samplers :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of samplers defined in the shader.
  --
  --          [C declaration]: @num_samplers@, defined at @SDL3\/SDL_gpu.h 1747:12@
  , num_storage_textures :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of storage textures defined in the shader.
  --
  --          [C declaration]: @num_storage_textures@, defined at @SDL3\/SDL_gpu.h 1748:12@
  , num_storage_buffers :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of storage buffers defined in the shader.
  --
  --          [C declaration]: @num_storage_buffers@, defined at @SDL3\/SDL_gpu.h 1749:12@
  , num_uniform_buffers :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of uniform buffers defined in the shader.
  --
  --          [C declaration]: @num_uniform_buffers@, defined at @SDL3\/SDL_gpu.h 1750:12@
  , props :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^ A properties ID for extensions. Should be 0 if no extensions are needed.
  --
  --          [C declaration]: @props@, defined at @SDL3\/SDL_gpu.h 1752:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUShaderCreateInfo where
  staticSizeOf = \_ -> (56 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUShaderCreateInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUShaderCreateInfo
        <*> HasCField.readRaw (BG.Proxy @"code_size") ptr0
        <*> HasCField.readRaw (BG.Proxy @"code") ptr0
        <*> HasCField.readRaw (BG.Proxy @"entrypoint") ptr0
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"stage") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_samplers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_storage_textures") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_storage_buffers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_uniform_buffers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"props") ptr0

instance Marshal.WriteRaw SDL_GPUShaderCreateInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUShaderCreateInfo
            code_size2
            code3
            entrypoint4
            format5
            stage6
            num_samplers7
            num_storage_textures8
            num_storage_buffers9
            num_uniform_buffers10
            props11 ->
              HasCField.writeRaw (BG.Proxy @"code_size") ptr0 code_size2
                >> HasCField.writeRaw (BG.Proxy @"code") ptr0 code3
                >> HasCField.writeRaw (BG.Proxy @"entrypoint") ptr0 entrypoint4
                >> HasCField.writeRaw (BG.Proxy @"format") ptr0 format5
                >> HasCField.writeRaw (BG.Proxy @"stage") ptr0 stage6
                >> HasCField.writeRaw (BG.Proxy @"num_samplers") ptr0 num_samplers7
                >> HasCField.writeRaw (BG.Proxy @"num_storage_textures") ptr0 num_storage_textures8
                >> HasCField.writeRaw (BG.Proxy @"num_storage_buffers") ptr0 num_storage_buffers9
                >> HasCField.writeRaw (BG.Proxy @"num_uniform_buffers") ptr0 num_uniform_buffers10
                >> HasCField.writeRaw (BG.Proxy @"props") ptr0 props11

deriving via
  Marshal.EquivStorable SDL_GPUShaderCreateInfo
  instance
    BG.Storable SDL_GPUShaderCreateInfo

instance
  (ty ~ HsBindgen.Runtime.LibC.CSize)
  => BG.CompatHasField.HasField "code_size" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { code_size = y1
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , stage = BG.getField @"stage" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"code_size" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.CSize)
  => BG.HasField "code_size" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"code_size")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "code_size" where
  type
    CFieldType SDL_GPUShaderCreateInfo "code_size" =
      HsBindgen.Runtime.LibC.CSize

  offset# = \_ -> \_ -> 0

instance
  (ty ~ PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "code" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { code = y1
            , code_size = BG.getField @"code_size" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , stage = BG.getField @"stage" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"code" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "code" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"code")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "code" where
  type
    CFieldType SDL_GPUShaderCreateInfo "code" =
      PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 8

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "entrypoint" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { entrypoint = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , format = BG.getField @"format" x0
            , stage = BG.getField @"stage" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"entrypoint" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "entrypoint" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"entrypoint")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "entrypoint" where
  type
    CFieldType SDL_GPUShaderCreateInfo "entrypoint" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL_GPUShaderFormat)
  => BG.CompatHasField.HasField "format" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { format = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , stage = BG.getField @"stage" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL_GPUShaderFormat)
  => BG.HasField "format" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "format" where
  type
    CFieldType SDL_GPUShaderCreateInfo "format" =
      SDL_GPUShaderFormat

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL_GPUShaderStage)
  => BG.CompatHasField.HasField "stage" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { stage = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"stage" x0
      )

instance
  (ty ~ SDL_GPUShaderStage)
  => BG.HasField "stage" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"stage")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "stage" where
  type
    CFieldType SDL_GPUShaderCreateInfo "stage" =
      SDL_GPUShaderStage

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_samplers" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { num_samplers = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , stage = BG.getField @"stage" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_samplers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_samplers" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_samplers")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "num_samplers" where
  type
    CFieldType SDL_GPUShaderCreateInfo "num_samplers" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_storage_textures" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { num_storage_textures = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , stage = BG.getField @"stage" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_storage_textures" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_storage_textures" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_storage_textures")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "num_storage_textures" where
  type
    CFieldType SDL_GPUShaderCreateInfo "num_storage_textures" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 36

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_storage_buffers" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { num_storage_buffers = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , stage = BG.getField @"stage" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_storage_buffers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_storage_buffers" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_storage_buffers")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "num_storage_buffers" where
  type
    CFieldType SDL_GPUShaderCreateInfo "num_storage_buffers" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 40

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_uniform_buffers" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { num_uniform_buffers = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , stage = BG.getField @"stage" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_uniform_buffers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_uniform_buffers" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_uniform_buffers")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "num_uniform_buffers" where
  type
    CFieldType SDL_GPUShaderCreateInfo "num_uniform_buffers" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 44

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.CompatHasField.HasField "props" SDL_GPUShaderCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUShaderCreateInfo
            { props = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , stage = BG.getField @"stage" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_storage_textures = BG.getField @"num_storage_textures" x0
            , num_storage_buffers = BG.getField @"num_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            }
      , BG.getField @"props" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.HasField "props" (BG.Ptr SDL_GPUShaderCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"props")

instance HasCField.HasCField SDL_GPUShaderCreateInfo "props" where
  type
    CFieldType SDL_GPUShaderCreateInfo "props" =
      SDL3.Sys.Bindgen.Properties.SDL_PropertiesID

  offset# = \_ -> \_ -> 48

-- | A structure specifying the parameters of a texture.
--
--     Usage flags can be bitwise OR\'d together for combinations of usages. Note that certain usage combinations are invalid, for example SAMPLER and GRAPHICS_STORAGE.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTexture', 'SDL_GPUTextureType', 'SDL_GPUTextureFormat', 'SDL_GPUTextureUsageFlags', 'SDL_GPUSampleCount'
--
--     [C declaration]: @struct SDL_GPUTextureCreateInfo@, defined at @SDL3\/SDL_gpu.h 1770:16@
data SDL_GPUTextureCreateInfo = SDL_GPUTextureCreateInfo
  { type' :: SDL_GPUTextureType
  -- ^ The base dimensionality of the texture.
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_gpu.h 1772:24@
  , format :: SDL_GPUTextureFormat
  -- ^ The pixel format of the texture.
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_gpu.h 1773:26@
  , usage :: SDL_GPUTextureUsageFlags
  -- ^ How the texture is intended to be used by the client.
  --
  --          [C declaration]: @usage@, defined at @SDL3\/SDL_gpu.h 1774:30@
  , width :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The width of the texture.
  --
  --          [C declaration]: @width@, defined at @SDL3\/SDL_gpu.h 1775:12@
  , height :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The height of the texture.
  --
  --          [C declaration]: @height@, defined at @SDL3\/SDL_gpu.h 1776:12@
  , layer_count_or_depth :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The layer count or depth of the texture. This value is treated as a layer count on 2D array textures, and as a depth value on 3D textures.
  --
  --          [C declaration]: @layer_count_or_depth@, defined at @SDL3\/SDL_gpu.h 1777:12@
  , num_levels :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of mip levels in the texture.
  --
  --          [C declaration]: @num_levels@, defined at @SDL3\/SDL_gpu.h 1778:12@
  , sample_count :: SDL_GPUSampleCount
  -- ^ The number of samples per texel. Only applies if the texture is used as a render target.
  --
  --          [C declaration]: @sample_count@, defined at @SDL3\/SDL_gpu.h 1779:24@
  , props :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^ A properties ID for extensions. Should be 0 if no extensions are needed.
  --
  --          [C declaration]: @props@, defined at @SDL3\/SDL_gpu.h 1781:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUTextureCreateInfo where
  staticSizeOf = \_ -> (36 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUTextureCreateInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTextureCreateInfo
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"usage") ptr0
        <*> HasCField.readRaw (BG.Proxy @"width") ptr0
        <*> HasCField.readRaw (BG.Proxy @"height") ptr0
        <*> HasCField.readRaw (BG.Proxy @"layer_count_or_depth") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_levels") ptr0
        <*> HasCField.readRaw (BG.Proxy @"sample_count") ptr0
        <*> HasCField.readRaw (BG.Proxy @"props") ptr0

instance Marshal.WriteRaw SDL_GPUTextureCreateInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTextureCreateInfo
            type'2
            format3
            usage4
            width5
            height6
            layer_count_or_depth7
            num_levels8
            sample_count9
            props10 ->
              HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
                >> HasCField.writeRaw (BG.Proxy @"format") ptr0 format3
                >> HasCField.writeRaw (BG.Proxy @"usage") ptr0 usage4
                >> HasCField.writeRaw (BG.Proxy @"width") ptr0 width5
                >> HasCField.writeRaw (BG.Proxy @"height") ptr0 height6
                >> HasCField.writeRaw (BG.Proxy @"layer_count_or_depth") ptr0 layer_count_or_depth7
                >> HasCField.writeRaw (BG.Proxy @"num_levels") ptr0 num_levels8
                >> HasCField.writeRaw (BG.Proxy @"sample_count") ptr0 sample_count9
                >> HasCField.writeRaw (BG.Proxy @"props") ptr0 props10

deriving via
  Marshal.EquivStorable SDL_GPUTextureCreateInfo
  instance
    BG.Storable SDL_GPUTextureCreateInfo

instance
  (ty ~ SDL_GPUTextureType)
  => BG.CompatHasField.HasField "type'" SDL_GPUTextureCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureCreateInfo
            { type' = y1
            , format = BG.getField @"format" x0
            , usage = BG.getField @"usage" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , layer_count_or_depth = BG.getField @"layer_count_or_depth" x0
            , num_levels = BG.getField @"num_levels" x0
            , sample_count = BG.getField @"sample_count" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_GPUTextureType)
  => BG.HasField "type'" (BG.Ptr SDL_GPUTextureCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_GPUTextureCreateInfo "type'" where
  type
    CFieldType SDL_GPUTextureCreateInfo "type'" =
      SDL_GPUTextureType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_GPUTextureFormat)
  => BG.CompatHasField.HasField "format" SDL_GPUTextureCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureCreateInfo
            { format = y1
            , type' = BG.getField @"type'" x0
            , usage = BG.getField @"usage" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , layer_count_or_depth = BG.getField @"layer_count_or_depth" x0
            , num_levels = BG.getField @"num_levels" x0
            , sample_count = BG.getField @"sample_count" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL_GPUTextureFormat)
  => BG.HasField "format" (BG.Ptr SDL_GPUTextureCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_GPUTextureCreateInfo "format" where
  type
    CFieldType SDL_GPUTextureCreateInfo "format" =
      SDL_GPUTextureFormat

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL_GPUTextureUsageFlags)
  => BG.CompatHasField.HasField "usage" SDL_GPUTextureCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureCreateInfo
            { usage = y1
            , type' = BG.getField @"type'" x0
            , format = BG.getField @"format" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , layer_count_or_depth = BG.getField @"layer_count_or_depth" x0
            , num_levels = BG.getField @"num_levels" x0
            , sample_count = BG.getField @"sample_count" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"usage" x0
      )

instance
  (ty ~ SDL_GPUTextureUsageFlags)
  => BG.HasField "usage" (BG.Ptr SDL_GPUTextureCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"usage")

instance HasCField.HasCField SDL_GPUTextureCreateInfo "usage" where
  type
    CFieldType SDL_GPUTextureCreateInfo "usage" =
      SDL_GPUTextureUsageFlags

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "width" SDL_GPUTextureCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureCreateInfo
            { width = y1
            , type' = BG.getField @"type'" x0
            , format = BG.getField @"format" x0
            , usage = BG.getField @"usage" x0
            , height = BG.getField @"height" x0
            , layer_count_or_depth = BG.getField @"layer_count_or_depth" x0
            , num_levels = BG.getField @"num_levels" x0
            , sample_count = BG.getField @"sample_count" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"width" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "width" (BG.Ptr SDL_GPUTextureCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"width")

instance HasCField.HasCField SDL_GPUTextureCreateInfo "width" where
  type
    CFieldType SDL_GPUTextureCreateInfo "width" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "height" SDL_GPUTextureCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureCreateInfo
            { height = y1
            , type' = BG.getField @"type'" x0
            , format = BG.getField @"format" x0
            , usage = BG.getField @"usage" x0
            , width = BG.getField @"width" x0
            , layer_count_or_depth = BG.getField @"layer_count_or_depth" x0
            , num_levels = BG.getField @"num_levels" x0
            , sample_count = BG.getField @"sample_count" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"height" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "height" (BG.Ptr SDL_GPUTextureCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"height")

instance HasCField.HasCField SDL_GPUTextureCreateInfo "height" where
  type
    CFieldType SDL_GPUTextureCreateInfo "height" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "layer_count_or_depth" SDL_GPUTextureCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureCreateInfo
            { layer_count_or_depth = y1
            , type' = BG.getField @"type'" x0
            , format = BG.getField @"format" x0
            , usage = BG.getField @"usage" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , num_levels = BG.getField @"num_levels" x0
            , sample_count = BG.getField @"sample_count" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"layer_count_or_depth" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "layer_count_or_depth" (BG.Ptr SDL_GPUTextureCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"layer_count_or_depth")

instance HasCField.HasCField SDL_GPUTextureCreateInfo "layer_count_or_depth" where
  type
    CFieldType SDL_GPUTextureCreateInfo "layer_count_or_depth" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_levels" SDL_GPUTextureCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureCreateInfo
            { num_levels = y1
            , type' = BG.getField @"type'" x0
            , format = BG.getField @"format" x0
            , usage = BG.getField @"usage" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , layer_count_or_depth = BG.getField @"layer_count_or_depth" x0
            , sample_count = BG.getField @"sample_count" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_levels" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_levels" (BG.Ptr SDL_GPUTextureCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"num_levels")

instance HasCField.HasCField SDL_GPUTextureCreateInfo "num_levels" where
  type
    CFieldType SDL_GPUTextureCreateInfo "num_levels" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL_GPUSampleCount)
  => BG.CompatHasField.HasField "sample_count" SDL_GPUTextureCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureCreateInfo
            { sample_count = y1
            , type' = BG.getField @"type'" x0
            , format = BG.getField @"format" x0
            , usage = BG.getField @"usage" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , layer_count_or_depth = BG.getField @"layer_count_or_depth" x0
            , num_levels = BG.getField @"num_levels" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"sample_count" x0
      )

instance
  (ty ~ SDL_GPUSampleCount)
  => BG.HasField "sample_count" (BG.Ptr SDL_GPUTextureCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"sample_count")

instance HasCField.HasCField SDL_GPUTextureCreateInfo "sample_count" where
  type
    CFieldType SDL_GPUTextureCreateInfo "sample_count" =
      SDL_GPUSampleCount

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.CompatHasField.HasField "props" SDL_GPUTextureCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureCreateInfo
            { props = y1
            , type' = BG.getField @"type'" x0
            , format = BG.getField @"format" x0
            , usage = BG.getField @"usage" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , layer_count_or_depth = BG.getField @"layer_count_or_depth" x0
            , num_levels = BG.getField @"num_levels" x0
            , sample_count = BG.getField @"sample_count" x0
            }
      , BG.getField @"props" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.HasField "props" (BG.Ptr SDL_GPUTextureCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"props")

instance HasCField.HasCField SDL_GPUTextureCreateInfo "props" where
  type
    CFieldType SDL_GPUTextureCreateInfo "props" =
      SDL3.Sys.Bindgen.Properties.SDL_PropertiesID

  offset# = \_ -> \_ -> 32

-- | A structure specifying the parameters of a buffer.
--
--     Usage flags can be bitwise OR\'d together for combinations of usages. Note that certain combinations are invalid, for example VERTEX and INDEX.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUBuffer', 'SDL_GPUBufferUsageFlags'
--
--     [C declaration]: @struct SDL_GPUBufferCreateInfo@, defined at @SDL3\/SDL_gpu.h 1795:16@
data SDL_GPUBufferCreateInfo = SDL_GPUBufferCreateInfo
  { usage :: SDL_GPUBufferUsageFlags
  -- ^ How the buffer is intended to be used by the client.
  --
  --          [C declaration]: @usage@, defined at @SDL3\/SDL_gpu.h 1797:29@
  , size :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The size in bytes of the buffer.
  --
  --          [C declaration]: @size@, defined at @SDL3\/SDL_gpu.h 1798:12@
  , props :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^ A properties ID for extensions. Should be 0 if no extensions are needed.
  --
  --          [C declaration]: @props@, defined at @SDL3\/SDL_gpu.h 1800:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUBufferCreateInfo where
  staticSizeOf = \_ -> (12 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUBufferCreateInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUBufferCreateInfo
        <*> HasCField.readRaw (BG.Proxy @"usage") ptr0
        <*> HasCField.readRaw (BG.Proxy @"size") ptr0
        <*> HasCField.readRaw (BG.Proxy @"props") ptr0

instance Marshal.WriteRaw SDL_GPUBufferCreateInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUBufferCreateInfo usage2 size3 props4 ->
            HasCField.writeRaw (BG.Proxy @"usage") ptr0 usage2
              >> HasCField.writeRaw (BG.Proxy @"size") ptr0 size3
              >> HasCField.writeRaw (BG.Proxy @"props") ptr0 props4

deriving via
  Marshal.EquivStorable SDL_GPUBufferCreateInfo
  instance
    BG.Storable SDL_GPUBufferCreateInfo

instance
  (ty ~ SDL_GPUBufferUsageFlags)
  => BG.CompatHasField.HasField "usage" SDL_GPUBufferCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferCreateInfo{usage = y1, size = BG.getField @"size" x0, props = BG.getField @"props" x0}
      , BG.getField @"usage" x0
      )

instance
  (ty ~ SDL_GPUBufferUsageFlags)
  => BG.HasField "usage" (BG.Ptr SDL_GPUBufferCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"usage")

instance HasCField.HasCField SDL_GPUBufferCreateInfo "usage" where
  type
    CFieldType SDL_GPUBufferCreateInfo "usage" =
      SDL_GPUBufferUsageFlags

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "size" SDL_GPUBufferCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferCreateInfo
            { size = y1
            , usage = BG.getField @"usage" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"size" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "size" (BG.Ptr SDL_GPUBufferCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"size")

instance HasCField.HasCField SDL_GPUBufferCreateInfo "size" where
  type
    CFieldType SDL_GPUBufferCreateInfo "size" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.CompatHasField.HasField "props" SDL_GPUBufferCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferCreateInfo{props = y1, usage = BG.getField @"usage" x0, size = BG.getField @"size" x0}
      , BG.getField @"props" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.HasField "props" (BG.Ptr SDL_GPUBufferCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"props")

instance HasCField.HasCField SDL_GPUBufferCreateInfo "props" where
  type
    CFieldType SDL_GPUBufferCreateInfo "props" =
      SDL3.Sys.Bindgen.Properties.SDL_PropertiesID

  offset# = \_ -> \_ -> 8

-- | A structure specifying the parameters of a transfer buffer.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTransferBuffer'
--
--     [C declaration]: @struct SDL_GPUTransferBufferCreateInfo@, defined at @SDL3\/SDL_gpu.h 1810:16@
data SDL_GPUTransferBufferCreateInfo = SDL_GPUTransferBufferCreateInfo
  { usage :: SDL_GPUTransferBufferUsage
  -- ^ How the transfer buffer is intended to be used by the client.
  --
  --          [C declaration]: @usage@, defined at @SDL3\/SDL_gpu.h 1812:32@
  , size :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The size in bytes of the transfer buffer.
  --
  --          [C declaration]: @size@, defined at @SDL3\/SDL_gpu.h 1813:12@
  , props :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^ A properties ID for extensions. Should be 0 if no extensions are needed.
  --
  --          [C declaration]: @props@, defined at @SDL3\/SDL_gpu.h 1815:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUTransferBufferCreateInfo where
  staticSizeOf = \_ -> (12 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUTransferBufferCreateInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTransferBufferCreateInfo
        <*> HasCField.readRaw (BG.Proxy @"usage") ptr0
        <*> HasCField.readRaw (BG.Proxy @"size") ptr0
        <*> HasCField.readRaw (BG.Proxy @"props") ptr0

instance Marshal.WriteRaw SDL_GPUTransferBufferCreateInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTransferBufferCreateInfo usage2 size3 props4 ->
            HasCField.writeRaw (BG.Proxy @"usage") ptr0 usage2
              >> HasCField.writeRaw (BG.Proxy @"size") ptr0 size3
              >> HasCField.writeRaw (BG.Proxy @"props") ptr0 props4

deriving via
  Marshal.EquivStorable SDL_GPUTransferBufferCreateInfo
  instance
    BG.Storable SDL_GPUTransferBufferCreateInfo

instance
  (ty ~ SDL_GPUTransferBufferUsage)
  => BG.CompatHasField.HasField "usage" SDL_GPUTransferBufferCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTransferBufferCreateInfo
            { usage = y1
            , size = BG.getField @"size" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"usage" x0
      )

instance
  (ty ~ SDL_GPUTransferBufferUsage)
  => BG.HasField "usage" (BG.Ptr SDL_GPUTransferBufferCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"usage")

instance HasCField.HasCField SDL_GPUTransferBufferCreateInfo "usage" where
  type
    CFieldType SDL_GPUTransferBufferCreateInfo "usage" =
      SDL_GPUTransferBufferUsage

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "size" SDL_GPUTransferBufferCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTransferBufferCreateInfo
            { size = y1
            , usage = BG.getField @"usage" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"size" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "size" (BG.Ptr SDL_GPUTransferBufferCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"size")

instance HasCField.HasCField SDL_GPUTransferBufferCreateInfo "size" where
  type
    CFieldType SDL_GPUTransferBufferCreateInfo "size" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.CompatHasField.HasField "props" SDL_GPUTransferBufferCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTransferBufferCreateInfo
            { props = y1
            , usage = BG.getField @"usage" x0
            , size = BG.getField @"size" x0
            }
      , BG.getField @"props" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.HasField "props" (BG.Ptr SDL_GPUTransferBufferCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"props")

instance HasCField.HasCField SDL_GPUTransferBufferCreateInfo "props" where
  type
    CFieldType SDL_GPUTransferBufferCreateInfo "props" =
      SDL3.Sys.Bindgen.Properties.SDL_PropertiesID

  offset# = \_ -> \_ -> 8

-- | A structure specifying the parameters of the graphics pipeline rasterizer state.
--
--     Note that SDL_GPU_FILLMODE_LINE is not supported on many Android devices. For those devices, the fill mode will automatically fall back to FILL.
--
--     Also note that the D3D12 driver will enable depth clamping even if enable_depth_clip is true. If you need this clamp+clip behavior, consider enabling depth clip and then manually clamping depth in your fragment shaders on Metal and Vulkan.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUGraphicsPipelineCreateInfo'
--
--     [C declaration]: @struct SDL_GPURasterizerState@, defined at @SDL3\/SDL_gpu.h 1836:16@
data SDL_GPURasterizerState = SDL_GPURasterizerState
  { fill_mode :: SDL_GPUFillMode
  -- ^ Whether polygons will be filled in or drawn as lines.
  --
  --          [C declaration]: @fill_mode@, defined at @SDL3\/SDL_gpu.h 1838:21@
  , cull_mode :: SDL_GPUCullMode
  -- ^ The facing direction in which triangles will be culled.
  --
  --          [C declaration]: @cull_mode@, defined at @SDL3\/SDL_gpu.h 1839:21@
  , front_face :: SDL_GPUFrontFace
  -- ^ The vertex winding that will cause a triangle to be determined as front-facing.
  --
  --          [C declaration]: @front_face@, defined at @SDL3\/SDL_gpu.h 1840:22@
  , depth_bias_constant_factor :: BG.CFloat
  -- ^ A scalar factor controlling the depth value added to each fragment.
  --
  --          [C declaration]: @depth_bias_constant_factor@, defined at @SDL3\/SDL_gpu.h 1841:11@
  , depth_bias_clamp :: BG.CFloat
  -- ^ The maximum depth bias of a fragment.
  --
  --          [C declaration]: @depth_bias_clamp@, defined at @SDL3\/SDL_gpu.h 1842:11@
  , depth_bias_slope_factor :: BG.CFloat
  -- ^ A scalar factor applied to a fragment\'s slope in depth calculations.
  --
  --          [C declaration]: @depth_bias_slope_factor@, defined at @SDL3\/SDL_gpu.h 1843:11@
  , enable_depth_bias :: BG.CBool
  -- ^ true to bias fragment depth values.
  --
  --          [C declaration]: @enable_depth_bias@, defined at @SDL3\/SDL_gpu.h 1844:10@
  , enable_depth_clip :: BG.CBool
  -- ^ true to enable depth clip, false to enable depth clamp.
  --
  --          [C declaration]: @enable_depth_clip@, defined at @SDL3\/SDL_gpu.h 1845:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_gpu.h 1846:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 1847:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPURasterizerState where
  staticSizeOf = \_ -> (28 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPURasterizerState where
  readRaw =
    \ptr0 ->
      pure SDL_GPURasterizerState
        <*> HasCField.readRaw (BG.Proxy @"fill_mode") ptr0
        <*> HasCField.readRaw (BG.Proxy @"cull_mode") ptr0
        <*> HasCField.readRaw (BG.Proxy @"front_face") ptr0
        <*> HasCField.readRaw (BG.Proxy @"depth_bias_constant_factor") ptr0
        <*> HasCField.readRaw (BG.Proxy @"depth_bias_clamp") ptr0
        <*> HasCField.readRaw (BG.Proxy @"depth_bias_slope_factor") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_depth_bias") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_depth_clip") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0

instance Marshal.WriteRaw SDL_GPURasterizerState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPURasterizerState
            fill_mode2
            cull_mode3
            front_face4
            depth_bias_constant_factor5
            depth_bias_clamp6
            depth_bias_slope_factor7
            enable_depth_bias8
            enable_depth_clip9
            padding110
            padding211 ->
              HasCField.writeRaw (BG.Proxy @"fill_mode") ptr0 fill_mode2
                >> HasCField.writeRaw (BG.Proxy @"cull_mode") ptr0 cull_mode3
                >> HasCField.writeRaw (BG.Proxy @"front_face") ptr0 front_face4
                >> HasCField.writeRaw (BG.Proxy @"depth_bias_constant_factor") ptr0 depth_bias_constant_factor5
                >> HasCField.writeRaw (BG.Proxy @"depth_bias_clamp") ptr0 depth_bias_clamp6
                >> HasCField.writeRaw (BG.Proxy @"depth_bias_slope_factor") ptr0 depth_bias_slope_factor7
                >> HasCField.writeRaw (BG.Proxy @"enable_depth_bias") ptr0 enable_depth_bias8
                >> HasCField.writeRaw (BG.Proxy @"enable_depth_clip") ptr0 enable_depth_clip9
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding110
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding211

deriving via
  Marshal.EquivStorable SDL_GPURasterizerState
  instance
    BG.Storable SDL_GPURasterizerState

instance
  (ty ~ SDL_GPUFillMode)
  => BG.CompatHasField.HasField "fill_mode" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { fill_mode = y1
            , cull_mode = BG.getField @"cull_mode" x0
            , front_face = BG.getField @"front_face" x0
            , depth_bias_constant_factor = BG.getField @"depth_bias_constant_factor" x0
            , depth_bias_clamp = BG.getField @"depth_bias_clamp" x0
            , depth_bias_slope_factor = BG.getField @"depth_bias_slope_factor" x0
            , enable_depth_bias = BG.getField @"enable_depth_bias" x0
            , enable_depth_clip = BG.getField @"enable_depth_clip" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"fill_mode" x0
      )

instance
  (ty ~ SDL_GPUFillMode)
  => BG.HasField "fill_mode" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fill_mode")

instance HasCField.HasCField SDL_GPURasterizerState "fill_mode" where
  type
    CFieldType SDL_GPURasterizerState "fill_mode" =
      SDL_GPUFillMode

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_GPUCullMode)
  => BG.CompatHasField.HasField "cull_mode" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { cull_mode = y1
            , fill_mode = BG.getField @"fill_mode" x0
            , front_face = BG.getField @"front_face" x0
            , depth_bias_constant_factor = BG.getField @"depth_bias_constant_factor" x0
            , depth_bias_clamp = BG.getField @"depth_bias_clamp" x0
            , depth_bias_slope_factor = BG.getField @"depth_bias_slope_factor" x0
            , enable_depth_bias = BG.getField @"enable_depth_bias" x0
            , enable_depth_clip = BG.getField @"enable_depth_clip" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"cull_mode" x0
      )

instance
  (ty ~ SDL_GPUCullMode)
  => BG.HasField "cull_mode" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cull_mode")

instance HasCField.HasCField SDL_GPURasterizerState "cull_mode" where
  type
    CFieldType SDL_GPURasterizerState "cull_mode" =
      SDL_GPUCullMode

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL_GPUFrontFace)
  => BG.CompatHasField.HasField "front_face" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { front_face = y1
            , fill_mode = BG.getField @"fill_mode" x0
            , cull_mode = BG.getField @"cull_mode" x0
            , depth_bias_constant_factor = BG.getField @"depth_bias_constant_factor" x0
            , depth_bias_clamp = BG.getField @"depth_bias_clamp" x0
            , depth_bias_slope_factor = BG.getField @"depth_bias_slope_factor" x0
            , enable_depth_bias = BG.getField @"enable_depth_bias" x0
            , enable_depth_clip = BG.getField @"enable_depth_clip" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"front_face" x0
      )

instance
  (ty ~ SDL_GPUFrontFace)
  => BG.HasField "front_face" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"front_face")

instance HasCField.HasCField SDL_GPURasterizerState "front_face" where
  type
    CFieldType SDL_GPURasterizerState "front_face" =
      SDL_GPUFrontFace

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "depth_bias_constant_factor" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { depth_bias_constant_factor = y1
            , fill_mode = BG.getField @"fill_mode" x0
            , cull_mode = BG.getField @"cull_mode" x0
            , front_face = BG.getField @"front_face" x0
            , depth_bias_clamp = BG.getField @"depth_bias_clamp" x0
            , depth_bias_slope_factor = BG.getField @"depth_bias_slope_factor" x0
            , enable_depth_bias = BG.getField @"enable_depth_bias" x0
            , enable_depth_clip = BG.getField @"enable_depth_clip" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"depth_bias_constant_factor" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "depth_bias_constant_factor" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"depth_bias_constant_factor")

instance HasCField.HasCField SDL_GPURasterizerState "depth_bias_constant_factor" where
  type
    CFieldType SDL_GPURasterizerState "depth_bias_constant_factor" =
      BG.CFloat

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "depth_bias_clamp" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { depth_bias_clamp = y1
            , fill_mode = BG.getField @"fill_mode" x0
            , cull_mode = BG.getField @"cull_mode" x0
            , front_face = BG.getField @"front_face" x0
            , depth_bias_constant_factor = BG.getField @"depth_bias_constant_factor" x0
            , depth_bias_slope_factor = BG.getField @"depth_bias_slope_factor" x0
            , enable_depth_bias = BG.getField @"enable_depth_bias" x0
            , enable_depth_clip = BG.getField @"enable_depth_clip" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"depth_bias_clamp" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "depth_bias_clamp" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"depth_bias_clamp")

instance HasCField.HasCField SDL_GPURasterizerState "depth_bias_clamp" where
  type
    CFieldType SDL_GPURasterizerState "depth_bias_clamp" =
      BG.CFloat

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "depth_bias_slope_factor" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { depth_bias_slope_factor = y1
            , fill_mode = BG.getField @"fill_mode" x0
            , cull_mode = BG.getField @"cull_mode" x0
            , front_face = BG.getField @"front_face" x0
            , depth_bias_constant_factor = BG.getField @"depth_bias_constant_factor" x0
            , depth_bias_clamp = BG.getField @"depth_bias_clamp" x0
            , enable_depth_bias = BG.getField @"enable_depth_bias" x0
            , enable_depth_clip = BG.getField @"enable_depth_clip" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"depth_bias_slope_factor" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "depth_bias_slope_factor" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"depth_bias_slope_factor")

instance HasCField.HasCField SDL_GPURasterizerState "depth_bias_slope_factor" where
  type
    CFieldType SDL_GPURasterizerState "depth_bias_slope_factor" =
      BG.CFloat

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_depth_bias" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { enable_depth_bias = y1
            , fill_mode = BG.getField @"fill_mode" x0
            , cull_mode = BG.getField @"cull_mode" x0
            , front_face = BG.getField @"front_face" x0
            , depth_bias_constant_factor = BG.getField @"depth_bias_constant_factor" x0
            , depth_bias_clamp = BG.getField @"depth_bias_clamp" x0
            , depth_bias_slope_factor = BG.getField @"depth_bias_slope_factor" x0
            , enable_depth_clip = BG.getField @"enable_depth_clip" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"enable_depth_bias" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_depth_bias" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_depth_bias")

instance HasCField.HasCField SDL_GPURasterizerState "enable_depth_bias" where
  type
    CFieldType SDL_GPURasterizerState "enable_depth_bias" =
      BG.CBool

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_depth_clip" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { enable_depth_clip = y1
            , fill_mode = BG.getField @"fill_mode" x0
            , cull_mode = BG.getField @"cull_mode" x0
            , front_face = BG.getField @"front_face" x0
            , depth_bias_constant_factor = BG.getField @"depth_bias_constant_factor" x0
            , depth_bias_clamp = BG.getField @"depth_bias_clamp" x0
            , depth_bias_slope_factor = BG.getField @"depth_bias_slope_factor" x0
            , enable_depth_bias = BG.getField @"enable_depth_bias" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"enable_depth_clip" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_depth_clip" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_depth_clip")

instance HasCField.HasCField SDL_GPURasterizerState "enable_depth_clip" where
  type
    CFieldType SDL_GPURasterizerState "enable_depth_clip" =
      BG.CBool

  offset# = \_ -> \_ -> 25

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { padding1 = y1
            , fill_mode = BG.getField @"fill_mode" x0
            , cull_mode = BG.getField @"cull_mode" x0
            , front_face = BG.getField @"front_face" x0
            , depth_bias_constant_factor = BG.getField @"depth_bias_constant_factor" x0
            , depth_bias_clamp = BG.getField @"depth_bias_clamp" x0
            , depth_bias_slope_factor = BG.getField @"depth_bias_slope_factor" x0
            , enable_depth_bias = BG.getField @"enable_depth_bias" x0
            , enable_depth_clip = BG.getField @"enable_depth_clip" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GPURasterizerState "padding1" where
  type
    CFieldType SDL_GPURasterizerState "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 26

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPURasterizerState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPURasterizerState
            { padding2 = y1
            , fill_mode = BG.getField @"fill_mode" x0
            , cull_mode = BG.getField @"cull_mode" x0
            , front_face = BG.getField @"front_face" x0
            , depth_bias_constant_factor = BG.getField @"depth_bias_constant_factor" x0
            , depth_bias_clamp = BG.getField @"depth_bias_clamp" x0
            , depth_bias_slope_factor = BG.getField @"depth_bias_slope_factor" x0
            , enable_depth_bias = BG.getField @"enable_depth_bias" x0
            , enable_depth_clip = BG.getField @"enable_depth_clip" x0
            , padding1 = BG.getField @"padding1" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPURasterizerState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPURasterizerState "padding2" where
  type
    CFieldType SDL_GPURasterizerState "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 27

-- | A structure specifying the parameters of the graphics pipeline multisample state.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUGraphicsPipelineCreateInfo'
--
--     [C declaration]: @struct SDL_GPUMultisampleState@, defined at @SDL3\/SDL_gpu.h 1858:16@
data SDL_GPUMultisampleState = SDL_GPUMultisampleState
  { sample_count :: SDL_GPUSampleCount
  -- ^ The number of samples to be used in rasterization.
  --
  --          [C declaration]: @sample_count@, defined at @SDL3\/SDL_gpu.h 1860:24@
  , sample_mask :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Reserved for future use. Must be set to 0.
  --
  --          [C declaration]: @sample_mask@, defined at @SDL3\/SDL_gpu.h 1861:12@
  , enable_mask :: BG.CBool
  -- ^ Reserved for future use. Must be set to false.
  --
  --          [C declaration]: @enable_mask@, defined at @SDL3\/SDL_gpu.h 1862:10@
  , enable_alpha_to_coverage :: BG.CBool
  -- ^ true enables the alpha-to-coverage feature.
  --
  --          [C declaration]: @enable_alpha_to_coverage@, defined at @SDL3\/SDL_gpu.h 1863:10@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 1864:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_gpu.h 1865:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUMultisampleState where
  staticSizeOf = \_ -> (12 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUMultisampleState where
  readRaw =
    \ptr0 ->
      pure SDL_GPUMultisampleState
        <*> HasCField.readRaw (BG.Proxy @"sample_count") ptr0
        <*> HasCField.readRaw (BG.Proxy @"sample_mask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_mask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_alpha_to_coverage") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0

instance Marshal.WriteRaw SDL_GPUMultisampleState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUMultisampleState
            sample_count2
            sample_mask3
            enable_mask4
            enable_alpha_to_coverage5
            padding26
            padding37 ->
              HasCField.writeRaw (BG.Proxy @"sample_count") ptr0 sample_count2
                >> HasCField.writeRaw (BG.Proxy @"sample_mask") ptr0 sample_mask3
                >> HasCField.writeRaw (BG.Proxy @"enable_mask") ptr0 enable_mask4
                >> HasCField.writeRaw (BG.Proxy @"enable_alpha_to_coverage") ptr0 enable_alpha_to_coverage5
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding26
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding37

deriving via
  Marshal.EquivStorable SDL_GPUMultisampleState
  instance
    BG.Storable SDL_GPUMultisampleState

instance
  (ty ~ SDL_GPUSampleCount)
  => BG.CompatHasField.HasField "sample_count" SDL_GPUMultisampleState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUMultisampleState
            { sample_count = y1
            , sample_mask = BG.getField @"sample_mask" x0
            , enable_mask = BG.getField @"enable_mask" x0
            , enable_alpha_to_coverage = BG.getField @"enable_alpha_to_coverage" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"sample_count" x0
      )

instance
  (ty ~ SDL_GPUSampleCount)
  => BG.HasField "sample_count" (BG.Ptr SDL_GPUMultisampleState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"sample_count")

instance HasCField.HasCField SDL_GPUMultisampleState "sample_count" where
  type
    CFieldType SDL_GPUMultisampleState "sample_count" =
      SDL_GPUSampleCount

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "sample_mask" SDL_GPUMultisampleState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUMultisampleState
            { sample_mask = y1
            , sample_count = BG.getField @"sample_count" x0
            , enable_mask = BG.getField @"enable_mask" x0
            , enable_alpha_to_coverage = BG.getField @"enable_alpha_to_coverage" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"sample_mask" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "sample_mask" (BG.Ptr SDL_GPUMultisampleState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"sample_mask")

instance HasCField.HasCField SDL_GPUMultisampleState "sample_mask" where
  type
    CFieldType SDL_GPUMultisampleState "sample_mask" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_mask" SDL_GPUMultisampleState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUMultisampleState
            { enable_mask = y1
            , sample_count = BG.getField @"sample_count" x0
            , sample_mask = BG.getField @"sample_mask" x0
            , enable_alpha_to_coverage = BG.getField @"enable_alpha_to_coverage" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"enable_mask" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_mask" (BG.Ptr SDL_GPUMultisampleState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_mask")

instance HasCField.HasCField SDL_GPUMultisampleState "enable_mask" where
  type
    CFieldType SDL_GPUMultisampleState "enable_mask" =
      BG.CBool

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_alpha_to_coverage" SDL_GPUMultisampleState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUMultisampleState
            { enable_alpha_to_coverage = y1
            , sample_count = BG.getField @"sample_count" x0
            , sample_mask = BG.getField @"sample_mask" x0
            , enable_mask = BG.getField @"enable_mask" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"enable_alpha_to_coverage" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_alpha_to_coverage" (BG.Ptr SDL_GPUMultisampleState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_alpha_to_coverage")

instance HasCField.HasCField SDL_GPUMultisampleState "enable_alpha_to_coverage" where
  type
    CFieldType SDL_GPUMultisampleState "enable_alpha_to_coverage" =
      BG.CBool

  offset# = \_ -> \_ -> 9

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPUMultisampleState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUMultisampleState
            { padding2 = y1
            , sample_count = BG.getField @"sample_count" x0
            , sample_mask = BG.getField @"sample_mask" x0
            , enable_mask = BG.getField @"enable_mask" x0
            , enable_alpha_to_coverage = BG.getField @"enable_alpha_to_coverage" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPUMultisampleState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPUMultisampleState "padding2" where
  type
    CFieldType SDL_GPUMultisampleState "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 10

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_GPUMultisampleState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUMultisampleState
            { padding3 = y1
            , sample_count = BG.getField @"sample_count" x0
            , sample_mask = BG.getField @"sample_mask" x0
            , enable_mask = BG.getField @"enable_mask" x0
            , enable_alpha_to_coverage = BG.getField @"enable_alpha_to_coverage" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_GPUMultisampleState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_GPUMultisampleState "padding3" where
  type
    CFieldType SDL_GPUMultisampleState "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 11

-- | A structure specifying the parameters of the graphics pipeline depth stencil state.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUGraphicsPipelineCreateInfo'
--
--     [C declaration]: @struct SDL_GPUDepthStencilState@, defined at @SDL3\/SDL_gpu.h 1876:16@
data SDL_GPUDepthStencilState = SDL_GPUDepthStencilState
  { compare_op :: SDL_GPUCompareOp
  -- ^ The comparison operator used for depth testing.
  --
  --          [C declaration]: @compare_op@, defined at @SDL3\/SDL_gpu.h 1878:22@
  , back_stencil_state :: SDL_GPUStencilOpState
  -- ^ The stencil op state for back-facing triangles.
  --
  --          [C declaration]: @back_stencil_state@, defined at @SDL3\/SDL_gpu.h 1879:27@
  , front_stencil_state :: SDL_GPUStencilOpState
  -- ^ The stencil op state for front-facing triangles.
  --
  --          [C declaration]: @front_stencil_state@, defined at @SDL3\/SDL_gpu.h 1880:27@
  , compare_mask :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ Selects the bits of the stencil values participating in the stencil test.
  --
  --          [C declaration]: @compare_mask@, defined at @SDL3\/SDL_gpu.h 1881:11@
  , write_mask :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ Selects the bits of the stencil values updated by the stencil test.
  --
  --          [C declaration]: @write_mask@, defined at @SDL3\/SDL_gpu.h 1882:11@
  , enable_depth_test :: BG.CBool
  -- ^ true enables the depth test.
  --
  --          [C declaration]: @enable_depth_test@, defined at @SDL3\/SDL_gpu.h 1883:10@
  , enable_depth_write :: BG.CBool
  -- ^ true enables depth writes. Depth writes are always disabled when enable_depth_test is false.
  --
  --          [C declaration]: @enable_depth_write@, defined at @SDL3\/SDL_gpu.h 1884:10@
  , enable_stencil_test :: BG.CBool
  -- ^ true enables the stencil test.
  --
  --          [C declaration]: @enable_stencil_test@, defined at @SDL3\/SDL_gpu.h 1885:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_gpu.h 1886:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 1887:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_gpu.h 1888:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUDepthStencilState where
  staticSizeOf = \_ -> (44 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUDepthStencilState where
  readRaw =
    \ptr0 ->
      pure SDL_GPUDepthStencilState
        <*> HasCField.readRaw (BG.Proxy @"compare_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"back_stencil_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"front_stencil_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"compare_mask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"write_mask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_depth_test") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_depth_write") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enable_stencil_test") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0

instance Marshal.WriteRaw SDL_GPUDepthStencilState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUDepthStencilState
            compare_op2
            back_stencil_state3
            front_stencil_state4
            compare_mask5
            write_mask6
            enable_depth_test7
            enable_depth_write8
            enable_stencil_test9
            padding110
            padding211
            padding312 ->
              HasCField.writeRaw (BG.Proxy @"compare_op") ptr0 compare_op2
                >> HasCField.writeRaw (BG.Proxy @"back_stencil_state") ptr0 back_stencil_state3
                >> HasCField.writeRaw (BG.Proxy @"front_stencil_state") ptr0 front_stencil_state4
                >> HasCField.writeRaw (BG.Proxy @"compare_mask") ptr0 compare_mask5
                >> HasCField.writeRaw (BG.Proxy @"write_mask") ptr0 write_mask6
                >> HasCField.writeRaw (BG.Proxy @"enable_depth_test") ptr0 enable_depth_test7
                >> HasCField.writeRaw (BG.Proxy @"enable_depth_write") ptr0 enable_depth_write8
                >> HasCField.writeRaw (BG.Proxy @"enable_stencil_test") ptr0 enable_stencil_test9
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding110
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding211
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding312

deriving via
  Marshal.EquivStorable SDL_GPUDepthStencilState
  instance
    BG.Storable SDL_GPUDepthStencilState

instance
  (ty ~ SDL_GPUCompareOp)
  => BG.CompatHasField.HasField "compare_op" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { compare_op = y1
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"compare_op" x0
      )

instance
  (ty ~ SDL_GPUCompareOp)
  => BG.HasField "compare_op" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"compare_op")

instance HasCField.HasCField SDL_GPUDepthStencilState "compare_op" where
  type
    CFieldType SDL_GPUDepthStencilState "compare_op" =
      SDL_GPUCompareOp

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_GPUStencilOpState)
  => BG.CompatHasField.HasField "back_stencil_state" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { back_stencil_state = y1
            , compare_op = BG.getField @"compare_op" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"back_stencil_state" x0
      )

instance
  (ty ~ SDL_GPUStencilOpState)
  => BG.HasField "back_stencil_state" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"back_stencil_state")

instance HasCField.HasCField SDL_GPUDepthStencilState "back_stencil_state" where
  type
    CFieldType SDL_GPUDepthStencilState "back_stencil_state" =
      SDL_GPUStencilOpState

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL_GPUStencilOpState)
  => BG.CompatHasField.HasField "front_stencil_state" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { front_stencil_state = y1
            , compare_op = BG.getField @"compare_op" x0
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"front_stencil_state" x0
      )

instance
  (ty ~ SDL_GPUStencilOpState)
  => BG.HasField "front_stencil_state" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"front_stencil_state")

instance HasCField.HasCField SDL_GPUDepthStencilState "front_stencil_state" where
  type
    CFieldType SDL_GPUDepthStencilState "front_stencil_state" =
      SDL_GPUStencilOpState

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "compare_mask" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { compare_mask = y1
            , compare_op = BG.getField @"compare_op" x0
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"compare_mask" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "compare_mask" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"compare_mask")

instance HasCField.HasCField SDL_GPUDepthStencilState "compare_mask" where
  type
    CFieldType SDL_GPUDepthStencilState "compare_mask" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 36

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "write_mask" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { write_mask = y1
            , compare_op = BG.getField @"compare_op" x0
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"write_mask" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "write_mask" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"write_mask")

instance HasCField.HasCField SDL_GPUDepthStencilState "write_mask" where
  type
    CFieldType SDL_GPUDepthStencilState "write_mask" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 37

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_depth_test" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { enable_depth_test = y1
            , compare_op = BG.getField @"compare_op" x0
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"enable_depth_test" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_depth_test" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_depth_test")

instance HasCField.HasCField SDL_GPUDepthStencilState "enable_depth_test" where
  type
    CFieldType SDL_GPUDepthStencilState "enable_depth_test" =
      BG.CBool

  offset# = \_ -> \_ -> 38

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_depth_write" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { enable_depth_write = y1
            , compare_op = BG.getField @"compare_op" x0
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"enable_depth_write" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_depth_write" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_depth_write")

instance HasCField.HasCField SDL_GPUDepthStencilState "enable_depth_write" where
  type
    CFieldType SDL_GPUDepthStencilState "enable_depth_write" =
      BG.CBool

  offset# = \_ -> \_ -> 39

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "enable_stencil_test" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { enable_stencil_test = y1
            , compare_op = BG.getField @"compare_op" x0
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"enable_stencil_test" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "enable_stencil_test" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"enable_stencil_test")

instance HasCField.HasCField SDL_GPUDepthStencilState "enable_stencil_test" where
  type
    CFieldType SDL_GPUDepthStencilState "enable_stencil_test" =
      BG.CBool

  offset# = \_ -> \_ -> 40

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { padding1 = y1
            , compare_op = BG.getField @"compare_op" x0
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GPUDepthStencilState "padding1" where
  type
    CFieldType SDL_GPUDepthStencilState "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 41

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { padding2 = y1
            , compare_op = BG.getField @"compare_op" x0
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPUDepthStencilState "padding2" where
  type
    CFieldType SDL_GPUDepthStencilState "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 42

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_GPUDepthStencilState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilState
            { padding3 = y1
            , compare_op = BG.getField @"compare_op" x0
            , back_stencil_state = BG.getField @"back_stencil_state" x0
            , front_stencil_state = BG.getField @"front_stencil_state" x0
            , compare_mask = BG.getField @"compare_mask" x0
            , write_mask = BG.getField @"write_mask" x0
            , enable_depth_test = BG.getField @"enable_depth_test" x0
            , enable_depth_write = BG.getField @"enable_depth_write" x0
            , enable_stencil_test = BG.getField @"enable_stencil_test" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_GPUDepthStencilState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_GPUDepthStencilState "padding3" where
  type
    CFieldType SDL_GPUDepthStencilState "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 43

-- | A structure specifying the parameters of color targets used in a graphics pipeline.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUGraphicsPipelineTargetInfo'
--
--     [C declaration]: @struct SDL_GPUColorTargetDescription@, defined at @SDL3\/SDL_gpu.h 1899:16@
data SDL_GPUColorTargetDescription = SDL_GPUColorTargetDescription
  { format :: SDL_GPUTextureFormat
  -- ^ The pixel format of the texture to be used as a color target.
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_gpu.h 1901:26@
  , blend_state :: SDL_GPUColorTargetBlendState
  -- ^ The blend state to be used for the color target.
  --
  --          [C declaration]: @blend_state@, defined at @SDL3\/SDL_gpu.h 1902:34@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUColorTargetDescription where
  staticSizeOf = \_ -> (36 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GPUColorTargetDescription where
  readRaw =
    \ptr0 ->
      pure SDL_GPUColorTargetDescription
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"blend_state") ptr0

instance Marshal.WriteRaw SDL_GPUColorTargetDescription where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUColorTargetDescription format2 blend_state3 ->
            HasCField.writeRaw (BG.Proxy @"format") ptr0 format2
              >> HasCField.writeRaw (BG.Proxy @"blend_state") ptr0 blend_state3

deriving via
  Marshal.EquivStorable SDL_GPUColorTargetDescription
  instance
    BG.Storable SDL_GPUColorTargetDescription

instance
  (ty ~ SDL_GPUTextureFormat)
  => BG.CompatHasField.HasField "format" SDL_GPUColorTargetDescription ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetDescription{format = y1, blend_state = BG.getField @"blend_state" x0}
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL_GPUTextureFormat)
  => BG.HasField "format" (BG.Ptr SDL_GPUColorTargetDescription) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_GPUColorTargetDescription "format" where
  type
    CFieldType SDL_GPUColorTargetDescription "format" =
      SDL_GPUTextureFormat

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_GPUColorTargetBlendState)
  => BG.CompatHasField.HasField "blend_state" SDL_GPUColorTargetDescription ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetDescription{blend_state = y1, format = BG.getField @"format" x0}
      , BG.getField @"blend_state" x0
      )

instance
  (ty ~ SDL_GPUColorTargetBlendState)
  => BG.HasField "blend_state" (BG.Ptr SDL_GPUColorTargetDescription) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"blend_state")

instance HasCField.HasCField SDL_GPUColorTargetDescription "blend_state" where
  type
    CFieldType SDL_GPUColorTargetDescription "blend_state" =
      SDL_GPUColorTargetBlendState

  offset# = \_ -> \_ -> 4

-- | A structure specifying the descriptions of render targets used in a graphics pipeline.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_GPUGraphicsPipelineCreateInfo', 'SDL_GPUColorTargetDescription', 'SDL_GPUTextureFormat'
--
--     [C declaration]: @struct SDL_GPUGraphicsPipelineTargetInfo@, defined at @SDL3\/SDL_gpu.h 1915:16@
data SDL_GPUGraphicsPipelineTargetInfo = SDL_GPUGraphicsPipelineTargetInfo
  { color_target_descriptions :: PtrConst.PtrConst SDL_GPUColorTargetDescription
  -- ^ A pointer to an array of color target descriptions.
  --
  --          [C declaration]: @color_target_descriptions@, defined at @SDL3\/SDL_gpu.h 1917:42@
  , num_color_targets :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of color target descriptions in the above array.
  --
  --          [C declaration]: @num_color_targets@, defined at @SDL3\/SDL_gpu.h 1918:12@
  , depth_stencil_format :: SDL_GPUTextureFormat
  -- ^ The pixel format of the depth-stencil target. Ignored if has_depth_stencil_target is false.
  --
  --          [C declaration]: @depth_stencil_format@, defined at @SDL3\/SDL_gpu.h 1919:26@
  , has_depth_stencil_target :: BG.CBool
  -- ^ true specifies that the pipeline uses a depth-stencil target.
  --
  --          [C declaration]: @has_depth_stencil_target@, defined at @SDL3\/SDL_gpu.h 1920:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_gpu.h 1921:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 1922:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_gpu.h 1923:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUGraphicsPipelineTargetInfo where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUGraphicsPipelineTargetInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUGraphicsPipelineTargetInfo
        <*> HasCField.readRaw (BG.Proxy @"color_target_descriptions") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_color_targets") ptr0
        <*> HasCField.readRaw (BG.Proxy @"depth_stencil_format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"has_depth_stencil_target") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0

instance Marshal.WriteRaw SDL_GPUGraphicsPipelineTargetInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUGraphicsPipelineTargetInfo
            color_target_descriptions2
            num_color_targets3
            depth_stencil_format4
            has_depth_stencil_target5
            padding16
            padding27
            padding38 ->
              HasCField.writeRaw (BG.Proxy @"color_target_descriptions") ptr0 color_target_descriptions2
                >> HasCField.writeRaw (BG.Proxy @"num_color_targets") ptr0 num_color_targets3
                >> HasCField.writeRaw (BG.Proxy @"depth_stencil_format") ptr0 depth_stencil_format4
                >> HasCField.writeRaw (BG.Proxy @"has_depth_stencil_target") ptr0 has_depth_stencil_target5
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding16
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding27
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding38

deriving via
  Marshal.EquivStorable SDL_GPUGraphicsPipelineTargetInfo
  instance
    BG.Storable SDL_GPUGraphicsPipelineTargetInfo

instance
  (ty ~ PtrConst.PtrConst SDL_GPUColorTargetDescription)
  => BG.CompatHasField.HasField "color_target_descriptions" SDL_GPUGraphicsPipelineTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineTargetInfo
            { color_target_descriptions = y1
            , num_color_targets = BG.getField @"num_color_targets" x0
            , depth_stencil_format = BG.getField @"depth_stencil_format" x0
            , has_depth_stencil_target = BG.getField @"has_depth_stencil_target" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"color_target_descriptions" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL_GPUColorTargetDescription)
  => BG.HasField "color_target_descriptions" (BG.Ptr SDL_GPUGraphicsPipelineTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"color_target_descriptions")

instance HasCField.HasCField SDL_GPUGraphicsPipelineTargetInfo "color_target_descriptions" where
  type
    CFieldType SDL_GPUGraphicsPipelineTargetInfo "color_target_descriptions" =
      PtrConst.PtrConst SDL_GPUColorTargetDescription

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_color_targets" SDL_GPUGraphicsPipelineTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineTargetInfo
            { num_color_targets = y1
            , color_target_descriptions = BG.getField @"color_target_descriptions" x0
            , depth_stencil_format = BG.getField @"depth_stencil_format" x0
            , has_depth_stencil_target = BG.getField @"has_depth_stencil_target" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"num_color_targets" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_color_targets" (BG.Ptr SDL_GPUGraphicsPipelineTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_color_targets")

instance HasCField.HasCField SDL_GPUGraphicsPipelineTargetInfo "num_color_targets" where
  type
    CFieldType SDL_GPUGraphicsPipelineTargetInfo "num_color_targets" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL_GPUTextureFormat)
  => BG.CompatHasField.HasField "depth_stencil_format" SDL_GPUGraphicsPipelineTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineTargetInfo
            { depth_stencil_format = y1
            , color_target_descriptions = BG.getField @"color_target_descriptions" x0
            , num_color_targets = BG.getField @"num_color_targets" x0
            , has_depth_stencil_target = BG.getField @"has_depth_stencil_target" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"depth_stencil_format" x0
      )

instance
  (ty ~ SDL_GPUTextureFormat)
  => BG.HasField "depth_stencil_format" (BG.Ptr SDL_GPUGraphicsPipelineTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"depth_stencil_format")

instance HasCField.HasCField SDL_GPUGraphicsPipelineTargetInfo "depth_stencil_format" where
  type
    CFieldType SDL_GPUGraphicsPipelineTargetInfo "depth_stencil_format" =
      SDL_GPUTextureFormat

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "has_depth_stencil_target" SDL_GPUGraphicsPipelineTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineTargetInfo
            { has_depth_stencil_target = y1
            , color_target_descriptions = BG.getField @"color_target_descriptions" x0
            , num_color_targets = BG.getField @"num_color_targets" x0
            , depth_stencil_format = BG.getField @"depth_stencil_format" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"has_depth_stencil_target" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "has_depth_stencil_target" (BG.Ptr SDL_GPUGraphicsPipelineTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"has_depth_stencil_target")

instance HasCField.HasCField SDL_GPUGraphicsPipelineTargetInfo "has_depth_stencil_target" where
  type
    CFieldType SDL_GPUGraphicsPipelineTargetInfo "has_depth_stencil_target" =
      BG.CBool

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GPUGraphicsPipelineTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineTargetInfo
            { padding1 = y1
            , color_target_descriptions = BG.getField @"color_target_descriptions" x0
            , num_color_targets = BG.getField @"num_color_targets" x0
            , depth_stencil_format = BG.getField @"depth_stencil_format" x0
            , has_depth_stencil_target = BG.getField @"has_depth_stencil_target" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GPUGraphicsPipelineTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GPUGraphicsPipelineTargetInfo "padding1" where
  type
    CFieldType SDL_GPUGraphicsPipelineTargetInfo "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 17

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPUGraphicsPipelineTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineTargetInfo
            { padding2 = y1
            , color_target_descriptions = BG.getField @"color_target_descriptions" x0
            , num_color_targets = BG.getField @"num_color_targets" x0
            , depth_stencil_format = BG.getField @"depth_stencil_format" x0
            , has_depth_stencil_target = BG.getField @"has_depth_stencil_target" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPUGraphicsPipelineTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPUGraphicsPipelineTargetInfo "padding2" where
  type
    CFieldType SDL_GPUGraphicsPipelineTargetInfo "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 18

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_GPUGraphicsPipelineTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineTargetInfo
            { padding3 = y1
            , color_target_descriptions = BG.getField @"color_target_descriptions" x0
            , num_color_targets = BG.getField @"num_color_targets" x0
            , depth_stencil_format = BG.getField @"depth_stencil_format" x0
            , has_depth_stencil_target = BG.getField @"has_depth_stencil_target" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_GPUGraphicsPipelineTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_GPUGraphicsPipelineTargetInfo "padding3" where
  type
    CFieldType SDL_GPUGraphicsPipelineTargetInfo "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 19

-- | A structure specifying the parameters of a graphics pipeline state.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline', 'SDL_GPUShader', 'SDL_GPUVertexInputState', 'SDL_GPUPrimitiveType', 'SDL_GPURasterizerState', 'SDL_GPUMultisampleState', 'SDL_GPUDepthStencilState', 'SDL_GPUGraphicsPipelineTargetInfo'
--
--     [C declaration]: @struct SDL_GPUGraphicsPipelineCreateInfo@, defined at @SDL3\/SDL_gpu.h 1940:16@
data SDL_GPUGraphicsPipelineCreateInfo = SDL_GPUGraphicsPipelineCreateInfo
  { vertex_shader :: BG.Ptr SDL_GPUShader
  -- ^ The vertex shader used by the graphics pipeline.
  --
  --          [C declaration]: @vertex_shader@, defined at @SDL3\/SDL_gpu.h 1942:20@
  , fragment_shader :: BG.Ptr SDL_GPUShader
  -- ^ The fragment shader used by the graphics pipeline.
  --
  --          [C declaration]: @fragment_shader@, defined at @SDL3\/SDL_gpu.h 1943:20@
  , vertex_input_state :: SDL_GPUVertexInputState
  -- ^ The vertex layout of the graphics pipeline.
  --
  --          [C declaration]: @vertex_input_state@, defined at @SDL3\/SDL_gpu.h 1944:29@
  , primitive_type :: SDL_GPUPrimitiveType
  -- ^ The primitive topology of the graphics pipeline.
  --
  --          [C declaration]: @primitive_type@, defined at @SDL3\/SDL_gpu.h 1945:26@
  , rasterizer_state :: SDL_GPURasterizerState
  -- ^ The rasterizer state of the graphics pipeline.
  --
  --          [C declaration]: @rasterizer_state@, defined at @SDL3\/SDL_gpu.h 1946:28@
  , multisample_state :: SDL_GPUMultisampleState
  -- ^ The multisample state of the graphics pipeline.
  --
  --          [C declaration]: @multisample_state@, defined at @SDL3\/SDL_gpu.h 1947:29@
  , depth_stencil_state :: SDL_GPUDepthStencilState
  -- ^ The depth-stencil state of the graphics pipeline.
  --
  --          [C declaration]: @depth_stencil_state@, defined at @SDL3\/SDL_gpu.h 1948:30@
  , target_info :: SDL_GPUGraphicsPipelineTargetInfo
  -- ^ Formats and blend modes for the render targets of the graphics pipeline.
  --
  --          [C declaration]: @target_info@, defined at @SDL3\/SDL_gpu.h 1949:39@
  , props :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^ A properties ID for extensions. Should be 0 if no extensions are needed.
  --
  --          [C declaration]: @props@, defined at @SDL3\/SDL_gpu.h 1951:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUGraphicsPipelineCreateInfo where
  staticSizeOf = \_ -> (168 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUGraphicsPipelineCreateInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUGraphicsPipelineCreateInfo
        <*> HasCField.readRaw (BG.Proxy @"vertex_shader") ptr0
        <*> HasCField.readRaw (BG.Proxy @"fragment_shader") ptr0
        <*> HasCField.readRaw (BG.Proxy @"vertex_input_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"primitive_type") ptr0
        <*> HasCField.readRaw (BG.Proxy @"rasterizer_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"multisample_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"depth_stencil_state") ptr0
        <*> HasCField.readRaw (BG.Proxy @"target_info") ptr0
        <*> HasCField.readRaw (BG.Proxy @"props") ptr0

instance Marshal.WriteRaw SDL_GPUGraphicsPipelineCreateInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUGraphicsPipelineCreateInfo
            vertex_shader2
            fragment_shader3
            vertex_input_state4
            primitive_type5
            rasterizer_state6
            multisample_state7
            depth_stencil_state8
            target_info9
            props10 ->
              HasCField.writeRaw (BG.Proxy @"vertex_shader") ptr0 vertex_shader2
                >> HasCField.writeRaw (BG.Proxy @"fragment_shader") ptr0 fragment_shader3
                >> HasCField.writeRaw (BG.Proxy @"vertex_input_state") ptr0 vertex_input_state4
                >> HasCField.writeRaw (BG.Proxy @"primitive_type") ptr0 primitive_type5
                >> HasCField.writeRaw (BG.Proxy @"rasterizer_state") ptr0 rasterizer_state6
                >> HasCField.writeRaw (BG.Proxy @"multisample_state") ptr0 multisample_state7
                >> HasCField.writeRaw (BG.Proxy @"depth_stencil_state") ptr0 depth_stencil_state8
                >> HasCField.writeRaw (BG.Proxy @"target_info") ptr0 target_info9
                >> HasCField.writeRaw (BG.Proxy @"props") ptr0 props10

deriving via
  Marshal.EquivStorable SDL_GPUGraphicsPipelineCreateInfo
  instance
    BG.Storable SDL_GPUGraphicsPipelineCreateInfo

instance
  (ty ~ BG.Ptr SDL_GPUShader)
  => BG.CompatHasField.HasField "vertex_shader" SDL_GPUGraphicsPipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineCreateInfo
            { vertex_shader = y1
            , fragment_shader = BG.getField @"fragment_shader" x0
            , vertex_input_state = BG.getField @"vertex_input_state" x0
            , primitive_type = BG.getField @"primitive_type" x0
            , rasterizer_state = BG.getField @"rasterizer_state" x0
            , multisample_state = BG.getField @"multisample_state" x0
            , depth_stencil_state = BG.getField @"depth_stencil_state" x0
            , target_info = BG.getField @"target_info" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"vertex_shader" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUShader)
  => BG.HasField "vertex_shader" (BG.Ptr SDL_GPUGraphicsPipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"vertex_shader")

instance HasCField.HasCField SDL_GPUGraphicsPipelineCreateInfo "vertex_shader" where
  type
    CFieldType SDL_GPUGraphicsPipelineCreateInfo "vertex_shader" =
      BG.Ptr SDL_GPUShader

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.Ptr SDL_GPUShader)
  => BG.CompatHasField.HasField "fragment_shader" SDL_GPUGraphicsPipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineCreateInfo
            { fragment_shader = y1
            , vertex_shader = BG.getField @"vertex_shader" x0
            , vertex_input_state = BG.getField @"vertex_input_state" x0
            , primitive_type = BG.getField @"primitive_type" x0
            , rasterizer_state = BG.getField @"rasterizer_state" x0
            , multisample_state = BG.getField @"multisample_state" x0
            , depth_stencil_state = BG.getField @"depth_stencil_state" x0
            , target_info = BG.getField @"target_info" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"fragment_shader" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUShader)
  => BG.HasField "fragment_shader" (BG.Ptr SDL_GPUGraphicsPipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"fragment_shader")

instance HasCField.HasCField SDL_GPUGraphicsPipelineCreateInfo "fragment_shader" where
  type
    CFieldType SDL_GPUGraphicsPipelineCreateInfo "fragment_shader" =
      BG.Ptr SDL_GPUShader

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL_GPUVertexInputState)
  => BG.CompatHasField.HasField "vertex_input_state" SDL_GPUGraphicsPipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineCreateInfo
            { vertex_input_state = y1
            , vertex_shader = BG.getField @"vertex_shader" x0
            , fragment_shader = BG.getField @"fragment_shader" x0
            , primitive_type = BG.getField @"primitive_type" x0
            , rasterizer_state = BG.getField @"rasterizer_state" x0
            , multisample_state = BG.getField @"multisample_state" x0
            , depth_stencil_state = BG.getField @"depth_stencil_state" x0
            , target_info = BG.getField @"target_info" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"vertex_input_state" x0
      )

instance
  (ty ~ SDL_GPUVertexInputState)
  => BG.HasField "vertex_input_state" (BG.Ptr SDL_GPUGraphicsPipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"vertex_input_state")

instance HasCField.HasCField SDL_GPUGraphicsPipelineCreateInfo "vertex_input_state" where
  type
    CFieldType SDL_GPUGraphicsPipelineCreateInfo "vertex_input_state" =
      SDL_GPUVertexInputState

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL_GPUPrimitiveType)
  => BG.CompatHasField.HasField "primitive_type" SDL_GPUGraphicsPipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineCreateInfo
            { primitive_type = y1
            , vertex_shader = BG.getField @"vertex_shader" x0
            , fragment_shader = BG.getField @"fragment_shader" x0
            , vertex_input_state = BG.getField @"vertex_input_state" x0
            , rasterizer_state = BG.getField @"rasterizer_state" x0
            , multisample_state = BG.getField @"multisample_state" x0
            , depth_stencil_state = BG.getField @"depth_stencil_state" x0
            , target_info = BG.getField @"target_info" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"primitive_type" x0
      )

instance
  (ty ~ SDL_GPUPrimitiveType)
  => BG.HasField "primitive_type" (BG.Ptr SDL_GPUGraphicsPipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"primitive_type")

instance HasCField.HasCField SDL_GPUGraphicsPipelineCreateInfo "primitive_type" where
  type
    CFieldType SDL_GPUGraphicsPipelineCreateInfo "primitive_type" =
      SDL_GPUPrimitiveType

  offset# = \_ -> \_ -> 48

instance
  (ty ~ SDL_GPURasterizerState)
  => BG.CompatHasField.HasField "rasterizer_state" SDL_GPUGraphicsPipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineCreateInfo
            { rasterizer_state = y1
            , vertex_shader = BG.getField @"vertex_shader" x0
            , fragment_shader = BG.getField @"fragment_shader" x0
            , vertex_input_state = BG.getField @"vertex_input_state" x0
            , primitive_type = BG.getField @"primitive_type" x0
            , multisample_state = BG.getField @"multisample_state" x0
            , depth_stencil_state = BG.getField @"depth_stencil_state" x0
            , target_info = BG.getField @"target_info" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"rasterizer_state" x0
      )

instance
  (ty ~ SDL_GPURasterizerState)
  => BG.HasField "rasterizer_state" (BG.Ptr SDL_GPUGraphicsPipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"rasterizer_state")

instance HasCField.HasCField SDL_GPUGraphicsPipelineCreateInfo "rasterizer_state" where
  type
    CFieldType SDL_GPUGraphicsPipelineCreateInfo "rasterizer_state" =
      SDL_GPURasterizerState

  offset# = \_ -> \_ -> 52

instance
  (ty ~ SDL_GPUMultisampleState)
  => BG.CompatHasField.HasField "multisample_state" SDL_GPUGraphicsPipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineCreateInfo
            { multisample_state = y1
            , vertex_shader = BG.getField @"vertex_shader" x0
            , fragment_shader = BG.getField @"fragment_shader" x0
            , vertex_input_state = BG.getField @"vertex_input_state" x0
            , primitive_type = BG.getField @"primitive_type" x0
            , rasterizer_state = BG.getField @"rasterizer_state" x0
            , depth_stencil_state = BG.getField @"depth_stencil_state" x0
            , target_info = BG.getField @"target_info" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"multisample_state" x0
      )

instance
  (ty ~ SDL_GPUMultisampleState)
  => BG.HasField "multisample_state" (BG.Ptr SDL_GPUGraphicsPipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"multisample_state")

instance HasCField.HasCField SDL_GPUGraphicsPipelineCreateInfo "multisample_state" where
  type
    CFieldType SDL_GPUGraphicsPipelineCreateInfo "multisample_state" =
      SDL_GPUMultisampleState

  offset# = \_ -> \_ -> 80

instance
  (ty ~ SDL_GPUDepthStencilState)
  => BG.CompatHasField.HasField "depth_stencil_state" SDL_GPUGraphicsPipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineCreateInfo
            { depth_stencil_state = y1
            , vertex_shader = BG.getField @"vertex_shader" x0
            , fragment_shader = BG.getField @"fragment_shader" x0
            , vertex_input_state = BG.getField @"vertex_input_state" x0
            , primitive_type = BG.getField @"primitive_type" x0
            , rasterizer_state = BG.getField @"rasterizer_state" x0
            , multisample_state = BG.getField @"multisample_state" x0
            , target_info = BG.getField @"target_info" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"depth_stencil_state" x0
      )

instance
  (ty ~ SDL_GPUDepthStencilState)
  => BG.HasField "depth_stencil_state" (BG.Ptr SDL_GPUGraphicsPipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"depth_stencil_state")

instance HasCField.HasCField SDL_GPUGraphicsPipelineCreateInfo "depth_stencil_state" where
  type
    CFieldType SDL_GPUGraphicsPipelineCreateInfo "depth_stencil_state" =
      SDL_GPUDepthStencilState

  offset# = \_ -> \_ -> 92

instance
  (ty ~ SDL_GPUGraphicsPipelineTargetInfo)
  => BG.CompatHasField.HasField "target_info" SDL_GPUGraphicsPipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineCreateInfo
            { target_info = y1
            , vertex_shader = BG.getField @"vertex_shader" x0
            , fragment_shader = BG.getField @"fragment_shader" x0
            , vertex_input_state = BG.getField @"vertex_input_state" x0
            , primitive_type = BG.getField @"primitive_type" x0
            , rasterizer_state = BG.getField @"rasterizer_state" x0
            , multisample_state = BG.getField @"multisample_state" x0
            , depth_stencil_state = BG.getField @"depth_stencil_state" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"target_info" x0
      )

instance
  (ty ~ SDL_GPUGraphicsPipelineTargetInfo)
  => BG.HasField "target_info" (BG.Ptr SDL_GPUGraphicsPipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"target_info")

instance HasCField.HasCField SDL_GPUGraphicsPipelineCreateInfo "target_info" where
  type
    CFieldType SDL_GPUGraphicsPipelineCreateInfo "target_info" =
      SDL_GPUGraphicsPipelineTargetInfo

  offset# = \_ -> \_ -> 136

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.CompatHasField.HasField "props" SDL_GPUGraphicsPipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUGraphicsPipelineCreateInfo
            { props = y1
            , vertex_shader = BG.getField @"vertex_shader" x0
            , fragment_shader = BG.getField @"fragment_shader" x0
            , vertex_input_state = BG.getField @"vertex_input_state" x0
            , primitive_type = BG.getField @"primitive_type" x0
            , rasterizer_state = BG.getField @"rasterizer_state" x0
            , multisample_state = BG.getField @"multisample_state" x0
            , depth_stencil_state = BG.getField @"depth_stencil_state" x0
            , target_info = BG.getField @"target_info" x0
            }
      , BG.getField @"props" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.HasField "props" (BG.Ptr SDL_GPUGraphicsPipelineCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"props")

instance HasCField.HasCField SDL_GPUGraphicsPipelineCreateInfo "props" where
  type
    CFieldType SDL_GPUGraphicsPipelineCreateInfo "props" =
      SDL3.Sys.Bindgen.Properties.SDL_PropertiesID

  offset# = \_ -> \_ -> 160

-- | A structure specifying the parameters of a compute pipeline state.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUComputePipeline', 'SDL_GPUShaderFormat'
--
--     [C declaration]: @struct SDL_GPUComputePipelineCreateInfo@, defined at @SDL3\/SDL_gpu.h 1962:16@
data SDL_GPUComputePipelineCreateInfo = SDL_GPUComputePipelineCreateInfo
  { code_size :: HsBindgen.Runtime.LibC.CSize
  -- ^ The size in bytes of the compute shader code pointed to.
  --
  --          [C declaration]: @code_size@, defined at @SDL3\/SDL_gpu.h 1964:12@
  , code :: PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ A pointer to compute shader code.
  --
  --          [C declaration]: @code@, defined at @SDL3\/SDL_gpu.h 1965:18@
  , entrypoint :: PtrConst.PtrConst BG.CChar
  -- ^ A pointer to a null-terminated UTF-8 string specifying the entry point function name for the shader.
  --
  --          [C declaration]: @entrypoint@, defined at @SDL3\/SDL_gpu.h 1966:17@
  , format :: SDL_GPUShaderFormat
  -- ^ The format of the compute shader code.
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_gpu.h 1967:25@
  , num_samplers :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of samplers defined in the shader.
  --
  --          [C declaration]: @num_samplers@, defined at @SDL3\/SDL_gpu.h 1968:12@
  , num_readonly_storage_textures :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of readonly storage textures defined in the shader.
  --
  --          [C declaration]: @num_readonly_storage_textures@, defined at @SDL3\/SDL_gpu.h 1969:12@
  , num_readonly_storage_buffers :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of readonly storage buffers defined in the shader.
  --
  --          [C declaration]: @num_readonly_storage_buffers@, defined at @SDL3\/SDL_gpu.h 1970:12@
  , num_readwrite_storage_textures :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of read-write storage textures defined in the shader.
  --
  --          [C declaration]: @num_readwrite_storage_textures@, defined at @SDL3\/SDL_gpu.h 1971:12@
  , num_readwrite_storage_buffers :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of read-write storage buffers defined in the shader.
  --
  --          [C declaration]: @num_readwrite_storage_buffers@, defined at @SDL3\/SDL_gpu.h 1972:12@
  , num_uniform_buffers :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of uniform buffers defined in the shader.
  --
  --          [C declaration]: @num_uniform_buffers@, defined at @SDL3\/SDL_gpu.h 1973:12@
  , threadcount_x :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of threads in the X dimension. This should match the value in the shader.
  --
  --          [C declaration]: @threadcount_x@, defined at @SDL3\/SDL_gpu.h 1974:12@
  , threadcount_y :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of threads in the Y dimension. This should match the value in the shader.
  --
  --          [C declaration]: @threadcount_y@, defined at @SDL3\/SDL_gpu.h 1975:12@
  , threadcount_z :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The number of threads in the Z dimension. This should match the value in the shader.
  --
  --          [C declaration]: @threadcount_z@, defined at @SDL3\/SDL_gpu.h 1976:12@
  , props :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^ A properties ID for extensions. Should be 0 if no extensions are needed.
  --
  --          [C declaration]: @props@, defined at @SDL3\/SDL_gpu.h 1978:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUComputePipelineCreateInfo where
  staticSizeOf = \_ -> (72 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUComputePipelineCreateInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUComputePipelineCreateInfo
        <*> HasCField.readRaw (BG.Proxy @"code_size") ptr0
        <*> HasCField.readRaw (BG.Proxy @"code") ptr0
        <*> HasCField.readRaw (BG.Proxy @"entrypoint") ptr0
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_samplers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_readonly_storage_textures") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_readonly_storage_buffers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_readwrite_storage_textures") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_readwrite_storage_buffers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"num_uniform_buffers") ptr0
        <*> HasCField.readRaw (BG.Proxy @"threadcount_x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"threadcount_y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"threadcount_z") ptr0
        <*> HasCField.readRaw (BG.Proxy @"props") ptr0

instance Marshal.WriteRaw SDL_GPUComputePipelineCreateInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUComputePipelineCreateInfo
            code_size2
            code3
            entrypoint4
            format5
            num_samplers6
            num_readonly_storage_textures7
            num_readonly_storage_buffers8
            num_readwrite_storage_textures9
            num_readwrite_storage_buffers10
            num_uniform_buffers11
            threadcount_x12
            threadcount_y13
            threadcount_z14
            props15 ->
              HasCField.writeRaw (BG.Proxy @"code_size") ptr0 code_size2
                >> HasCField.writeRaw (BG.Proxy @"code") ptr0 code3
                >> HasCField.writeRaw (BG.Proxy @"entrypoint") ptr0 entrypoint4
                >> HasCField.writeRaw (BG.Proxy @"format") ptr0 format5
                >> HasCField.writeRaw (BG.Proxy @"num_samplers") ptr0 num_samplers6
                >> HasCField.writeRaw (BG.Proxy @"num_readonly_storage_textures") ptr0 num_readonly_storage_textures7
                >> HasCField.writeRaw (BG.Proxy @"num_readonly_storage_buffers") ptr0 num_readonly_storage_buffers8
                >> HasCField.writeRaw (BG.Proxy @"num_readwrite_storage_textures") ptr0 num_readwrite_storage_textures9
                >> HasCField.writeRaw (BG.Proxy @"num_readwrite_storage_buffers") ptr0 num_readwrite_storage_buffers10
                >> HasCField.writeRaw (BG.Proxy @"num_uniform_buffers") ptr0 num_uniform_buffers11
                >> HasCField.writeRaw (BG.Proxy @"threadcount_x") ptr0 threadcount_x12
                >> HasCField.writeRaw (BG.Proxy @"threadcount_y") ptr0 threadcount_y13
                >> HasCField.writeRaw (BG.Proxy @"threadcount_z") ptr0 threadcount_z14
                >> HasCField.writeRaw (BG.Proxy @"props") ptr0 props15

deriving via
  Marshal.EquivStorable SDL_GPUComputePipelineCreateInfo
  instance
    BG.Storable SDL_GPUComputePipelineCreateInfo

instance
  (ty ~ HsBindgen.Runtime.LibC.CSize)
  => BG.CompatHasField.HasField "code_size" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { code_size = y1
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"code_size" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.CSize)
  => BG.HasField "code_size" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"code_size")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "code_size" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "code_size" =
      HsBindgen.Runtime.LibC.CSize

  offset# = \_ -> \_ -> 0

instance
  (ty ~ PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "code" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { code = y1
            , code_size = BG.getField @"code_size" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"code" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "code" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"code")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "code" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "code" =
      PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 8

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "entrypoint" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { entrypoint = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"entrypoint" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "entrypoint" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"entrypoint")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "entrypoint" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "entrypoint" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL_GPUShaderFormat)
  => BG.CompatHasField.HasField "format" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { format = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL_GPUShaderFormat)
  => BG.HasField "format" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "format" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "format" =
      SDL_GPUShaderFormat

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_samplers" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { num_samplers = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_samplers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_samplers" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_samplers")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "num_samplers" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "num_samplers" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_readonly_storage_textures" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { num_readonly_storage_textures = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_readonly_storage_textures" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_readonly_storage_textures" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_readonly_storage_textures")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "num_readonly_storage_textures" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "num_readonly_storage_textures" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_readonly_storage_buffers" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { num_readonly_storage_buffers = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_readonly_storage_buffers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_readonly_storage_buffers" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_readonly_storage_buffers")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "num_readonly_storage_buffers" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "num_readonly_storage_buffers" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 36

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_readwrite_storage_textures" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { num_readwrite_storage_textures = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_readwrite_storage_textures" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_readwrite_storage_textures" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_readwrite_storage_textures")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "num_readwrite_storage_textures" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "num_readwrite_storage_textures" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 40

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_readwrite_storage_buffers" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { num_readwrite_storage_buffers = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_readwrite_storage_buffers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_readwrite_storage_buffers" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_readwrite_storage_buffers")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "num_readwrite_storage_buffers" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "num_readwrite_storage_buffers" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 44

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "num_uniform_buffers" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { num_uniform_buffers = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"num_uniform_buffers" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "num_uniform_buffers" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"num_uniform_buffers")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "num_uniform_buffers" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "num_uniform_buffers" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 48

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "threadcount_x" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { threadcount_x = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"threadcount_x" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "threadcount_x" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"threadcount_x")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "threadcount_x" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "threadcount_x" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 52

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "threadcount_y" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { threadcount_y = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"threadcount_y" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "threadcount_y" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"threadcount_y")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "threadcount_y" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "threadcount_y" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 56

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "threadcount_z" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { threadcount_z = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , props = BG.getField @"props" x0
            }
      , BG.getField @"threadcount_z" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "threadcount_z" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"threadcount_z")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "threadcount_z" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "threadcount_z" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 60

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.CompatHasField.HasField "props" SDL_GPUComputePipelineCreateInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUComputePipelineCreateInfo
            { props = y1
            , code_size = BG.getField @"code_size" x0
            , code = BG.getField @"code" x0
            , entrypoint = BG.getField @"entrypoint" x0
            , format = BG.getField @"format" x0
            , num_samplers = BG.getField @"num_samplers" x0
            , num_readonly_storage_textures = BG.getField @"num_readonly_storage_textures" x0
            , num_readonly_storage_buffers = BG.getField @"num_readonly_storage_buffers" x0
            , num_readwrite_storage_textures = BG.getField @"num_readwrite_storage_textures" x0
            , num_readwrite_storage_buffers = BG.getField @"num_readwrite_storage_buffers" x0
            , num_uniform_buffers = BG.getField @"num_uniform_buffers" x0
            , threadcount_x = BG.getField @"threadcount_x" x0
            , threadcount_y = BG.getField @"threadcount_y" x0
            , threadcount_z = BG.getField @"threadcount_z" x0
            }
      , BG.getField @"props" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
  => BG.HasField "props" (BG.Ptr SDL_GPUComputePipelineCreateInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"props")

instance HasCField.HasCField SDL_GPUComputePipelineCreateInfo "props" where
  type
    CFieldType SDL_GPUComputePipelineCreateInfo "props" =
      SDL3.Sys.Bindgen.Properties.SDL_PropertiesID

  offset# = \_ -> \_ -> 64

-- | A structure specifying the parameters of a color target used by a render pass.
--
--     The load_op field determines what is done with the texture at the beginning of the render pass.
--
--     * LOAD: Loads the data currently in the texture. Not recommended for multisample textures as it requires significant memory bandwidth.
--
--     * CLEAR: Clears the texture to a single color.
--
--     * DONT_CARE: The driver will do whatever it wants with the texture memory. This is a good option if you know that every single pixel will be touched in the render pass.
--
--     The store_op field determines what is done with the color results of the render pass.
--
--     * STORE: Stores the results of the render pass in the texture. Not recommended for multisample textures as it requires significant memory bandwidth.
--
--     * DONT_CARE: The driver will do whatever it wants with the texture memory. This is often a good option for depth\/stencil textures.
--
--     * RESOLVE: Resolves a multisample texture into resolve_texture, which must have a sample count of 1. Then the driver may discard the multisample texture memory. This is the most performant method of resolving a multisample target.
--
--     * RESOLVE_AND_STORE: Resolves a multisample texture into the resolve_texture, which must have a sample count of 1. Then the driver stores the multisample texture\'s contents. Not recommended as it requires significant memory bandwidth.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BeginGPURenderPass', SDL_FColor
--
--     [C declaration]: @struct SDL_GPUColorTargetInfo@, defined at @SDL3\/SDL_gpu.h 2017:16@
data SDL_GPUColorTargetInfo = SDL_GPUColorTargetInfo
  { texture :: BG.Ptr SDL_GPUTexture
  -- ^ The texture that will be used as a color target by a render pass.
  --
  --          [C declaration]: @texture@, defined at @SDL3\/SDL_gpu.h 2019:21@
  , mip_level :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The mip level to use as a color target.
  --
  --          [C declaration]: @mip_level@, defined at @SDL3\/SDL_gpu.h 2020:12@
  , layer_or_depth_plane :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The layer index or depth plane to use as a color target. This value is treated as a layer index on 2D array and cube textures, and as a depth plane on 3D textures.
  --
  --          [C declaration]: @layer_or_depth_plane@, defined at @SDL3\/SDL_gpu.h 2021:12@
  , clear_color :: SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -- ^ The color to clear the color target to at the start of the render pass. Ignored if SDL_GPU_LOADOP_CLEAR is not used.
  --
  --          [C declaration]: @clear_color@, defined at @SDL3\/SDL_gpu.h 2022:16@
  , load_op :: SDL_GPULoadOp
  -- ^ What is done with the contents of the color target at the beginning of the render pass.
  --
  --          [C declaration]: @load_op@, defined at @SDL3\/SDL_gpu.h 2023:19@
  , store_op :: SDL_GPUStoreOp
  -- ^ What is done with the results of the render pass.
  --
  --          [C declaration]: @store_op@, defined at @SDL3\/SDL_gpu.h 2024:20@
  , resolve_texture :: BG.Ptr SDL_GPUTexture
  -- ^ The texture that will receive the results of a multisample resolve operation. Ignored if a RESOLVE* store_op is not used.
  --
  --          [C declaration]: @resolve_texture@, defined at @SDL3\/SDL_gpu.h 2025:21@
  , resolve_mip_level :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The mip level of the resolve texture to use for the resolve operation. Ignored if a RESOLVE* store_op is not used.
  --
  --          [C declaration]: @resolve_mip_level@, defined at @SDL3\/SDL_gpu.h 2026:12@
  , resolve_layer :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The layer index of the resolve texture to use for the resolve operation. Ignored if a RESOLVE* store_op is not used.
  --
  --          [C declaration]: @resolve_layer@, defined at @SDL3\/SDL_gpu.h 2027:12@
  , cycle :: BG.CBool
  -- ^ true cycles the texture if the texture is bound and load_op is not LOAD
  --
  --          [C declaration]: @cycle@, defined at @SDL3\/SDL_gpu.h 2028:10@
  , cycle_resolve_texture :: BG.CBool
  -- ^ true cycles the resolve texture if the resolve texture is bound. Ignored if a RESOLVE* store_op is not used.
  --
  --          [C declaration]: @cycle_resolve_texture@, defined at @SDL3\/SDL_gpu.h 2029:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_gpu.h 2030:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 2031:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUColorTargetInfo where
  staticSizeOf = \_ -> (64 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUColorTargetInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUColorTargetInfo
        <*> HasCField.readRaw (BG.Proxy @"texture") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mip_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"layer_or_depth_plane") ptr0
        <*> HasCField.readRaw (BG.Proxy @"clear_color") ptr0
        <*> HasCField.readRaw (BG.Proxy @"load_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"store_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"resolve_texture") ptr0
        <*> HasCField.readRaw (BG.Proxy @"resolve_mip_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"resolve_layer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"cycle") ptr0
        <*> HasCField.readRaw (BG.Proxy @"cycle_resolve_texture") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0

instance Marshal.WriteRaw SDL_GPUColorTargetInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUColorTargetInfo
            texture2
            mip_level3
            layer_or_depth_plane4
            clear_color5
            load_op6
            store_op7
            resolve_texture8
            resolve_mip_level9
            resolve_layer10
            cycle11
            cycle_resolve_texture12
            padding113
            padding214 ->
              HasCField.writeRaw (BG.Proxy @"texture") ptr0 texture2
                >> HasCField.writeRaw (BG.Proxy @"mip_level") ptr0 mip_level3
                >> HasCField.writeRaw (BG.Proxy @"layer_or_depth_plane") ptr0 layer_or_depth_plane4
                >> HasCField.writeRaw (BG.Proxy @"clear_color") ptr0 clear_color5
                >> HasCField.writeRaw (BG.Proxy @"load_op") ptr0 load_op6
                >> HasCField.writeRaw (BG.Proxy @"store_op") ptr0 store_op7
                >> HasCField.writeRaw (BG.Proxy @"resolve_texture") ptr0 resolve_texture8
                >> HasCField.writeRaw (BG.Proxy @"resolve_mip_level") ptr0 resolve_mip_level9
                >> HasCField.writeRaw (BG.Proxy @"resolve_layer") ptr0 resolve_layer10
                >> HasCField.writeRaw (BG.Proxy @"cycle") ptr0 cycle11
                >> HasCField.writeRaw (BG.Proxy @"cycle_resolve_texture") ptr0 cycle_resolve_texture12
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding113
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding214

deriving via
  Marshal.EquivStorable SDL_GPUColorTargetInfo
  instance
    BG.Storable SDL_GPUColorTargetInfo

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.CompatHasField.HasField "texture" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { texture = y1
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"texture" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.HasField "texture" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"texture")

instance HasCField.HasCField SDL_GPUColorTargetInfo "texture" where
  type
    CFieldType SDL_GPUColorTargetInfo "texture" =
      BG.Ptr SDL_GPUTexture

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "mip_level" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { mip_level = y1
            , texture = BG.getField @"texture" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"mip_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "mip_level" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mip_level")

instance HasCField.HasCField SDL_GPUColorTargetInfo "mip_level" where
  type
    CFieldType SDL_GPUColorTargetInfo "mip_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "layer_or_depth_plane" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { layer_or_depth_plane = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"layer_or_depth_plane" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "layer_or_depth_plane" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"layer_or_depth_plane")

instance HasCField.HasCField SDL_GPUColorTargetInfo "layer_or_depth_plane" where
  type
    CFieldType SDL_GPUColorTargetInfo "layer_or_depth_plane" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_FColor)
  => BG.CompatHasField.HasField "clear_color" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { clear_color = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"clear_color" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_FColor)
  => BG.HasField "clear_color" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"clear_color")

instance HasCField.HasCField SDL_GPUColorTargetInfo "clear_color" where
  type
    CFieldType SDL_GPUColorTargetInfo "clear_color" =
      SDL3.Sys.Bindgen.Pixels.SDL_FColor

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL_GPULoadOp)
  => BG.CompatHasField.HasField "load_op" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { load_op = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"load_op" x0
      )

instance
  (ty ~ SDL_GPULoadOp)
  => BG.HasField "load_op" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"load_op")

instance HasCField.HasCField SDL_GPUColorTargetInfo "load_op" where
  type
    CFieldType SDL_GPUColorTargetInfo "load_op" =
      SDL_GPULoadOp

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL_GPUStoreOp)
  => BG.CompatHasField.HasField "store_op" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { store_op = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"store_op" x0
      )

instance
  (ty ~ SDL_GPUStoreOp)
  => BG.HasField "store_op" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"store_op")

instance HasCField.HasCField SDL_GPUColorTargetInfo "store_op" where
  type
    CFieldType SDL_GPUColorTargetInfo "store_op" =
      SDL_GPUStoreOp

  offset# = \_ -> \_ -> 36

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.CompatHasField.HasField "resolve_texture" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { resolve_texture = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"resolve_texture" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.HasField "resolve_texture" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"resolve_texture")

instance HasCField.HasCField SDL_GPUColorTargetInfo "resolve_texture" where
  type
    CFieldType SDL_GPUColorTargetInfo "resolve_texture" =
      BG.Ptr SDL_GPUTexture

  offset# = \_ -> \_ -> 40

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "resolve_mip_level" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { resolve_mip_level = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"resolve_mip_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "resolve_mip_level" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"resolve_mip_level")

instance HasCField.HasCField SDL_GPUColorTargetInfo "resolve_mip_level" where
  type
    CFieldType SDL_GPUColorTargetInfo "resolve_mip_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 48

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "resolve_layer" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { resolve_layer = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"resolve_layer" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "resolve_layer" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"resolve_layer")

instance HasCField.HasCField SDL_GPUColorTargetInfo "resolve_layer" where
  type
    CFieldType SDL_GPUColorTargetInfo "resolve_layer" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 52

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "cycle" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { cycle = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"cycle" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "cycle" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cycle")

instance HasCField.HasCField SDL_GPUColorTargetInfo "cycle" where
  type
    CFieldType SDL_GPUColorTargetInfo "cycle" =
      BG.CBool

  offset# = \_ -> \_ -> 56

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "cycle_resolve_texture" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { cycle_resolve_texture = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"cycle_resolve_texture" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "cycle_resolve_texture" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"cycle_resolve_texture")

instance HasCField.HasCField SDL_GPUColorTargetInfo "cycle_resolve_texture" where
  type
    CFieldType SDL_GPUColorTargetInfo "cycle_resolve_texture" =
      BG.CBool

  offset# = \_ -> \_ -> 57

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { padding1 = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GPUColorTargetInfo "padding1" where
  type
    CFieldType SDL_GPUColorTargetInfo "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 58

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPUColorTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUColorTargetInfo
            { padding2 = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer_or_depth_plane = BG.getField @"layer_or_depth_plane" x0
            , clear_color = BG.getField @"clear_color" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , resolve_texture = BG.getField @"resolve_texture" x0
            , resolve_mip_level = BG.getField @"resolve_mip_level" x0
            , resolve_layer = BG.getField @"resolve_layer" x0
            , cycle = BG.getField @"cycle" x0
            , cycle_resolve_texture = BG.getField @"cycle_resolve_texture" x0
            , padding1 = BG.getField @"padding1" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPUColorTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPUColorTargetInfo "padding2" where
  type
    CFieldType SDL_GPUColorTargetInfo "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 59

-- | A structure specifying the parameters of a depth-stencil target used by a render pass.
--
--     The load_op field determines what is done with the depth contents of the texture at the beginning of the render pass.
--
--     * LOAD: Loads the depth values currently in the texture.
--
--     * CLEAR: Clears the texture to a single depth.
--
--     * DONT_CARE: The driver will do whatever it wants with the memory. This is a good option if you know that every single pixel will be touched in the render pass.
--
--     The store_op field determines what is done with the depth results of the render pass.
--
--     * STORE: Stores the depth results in the texture.
--
--     * DONT_CARE: The driver will do whatever it wants with the depth results. This is often a good option for depth\/stencil textures that don\'t need to be reused again.
--
--     The stencil_load_op field determines what is done with the stencil contents of the texture at the beginning of the render pass.
--
--     * LOAD: Loads the stencil values currently in the texture.
--
--     * CLEAR: Clears the stencil values to a single value.
--
--     * DONT_CARE: The driver will do whatever it wants with the memory. This is a good option if you know that every single pixel will be touched in the render pass.
--
--     The stencil_store_op field determines what is done with the stencil results of the render pass.
--
--     * STORE: Stores the stencil results in the texture.
--
--     * DONT_CARE: The driver will do whatever it wants with the stencil results. This is often a good option for depth\/stencil textures that don\'t need to be reused again.
--
--     Note that depth\/stencil targets do not support multisample resolves.
--
--     Due to ABI limitations, depth textures with more than 255 layers are not supported.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BeginGPURenderPass'
--
--     [C declaration]: @struct SDL_GPUDepthStencilTargetInfo@, defined at @SDL3\/SDL_gpu.h 2081:16@
data SDL_GPUDepthStencilTargetInfo = SDL_GPUDepthStencilTargetInfo
  { texture :: BG.Ptr SDL_GPUTexture
  -- ^ The texture that will be used as the depth stencil target by the render pass.
  --
  --          [C declaration]: @texture@, defined at @SDL3\/SDL_gpu.h 2083:21@
  , clear_depth :: BG.CFloat
  -- ^ The value to clear the depth component to at the beginning of the render pass. Ignored if SDL_GPU_LOADOP_CLEAR is not used.
  --
  --          [C declaration]: @clear_depth@, defined at @SDL3\/SDL_gpu.h 2084:11@
  , load_op :: SDL_GPULoadOp
  -- ^ What is done with the depth contents at the beginning of the render pass.
  --
  --          [C declaration]: @load_op@, defined at @SDL3\/SDL_gpu.h 2085:19@
  , store_op :: SDL_GPUStoreOp
  -- ^ What is done with the depth results of the render pass.
  --
  --          [C declaration]: @store_op@, defined at @SDL3\/SDL_gpu.h 2086:20@
  , stencil_load_op :: SDL_GPULoadOp
  -- ^ What is done with the stencil contents at the beginning of the render pass.
  --
  --          [C declaration]: @stencil_load_op@, defined at @SDL3\/SDL_gpu.h 2087:19@
  , stencil_store_op :: SDL_GPUStoreOp
  -- ^ What is done with the stencil results of the render pass.
  --
  --          [C declaration]: @stencil_store_op@, defined at @SDL3\/SDL_gpu.h 2088:20@
  , cycle :: BG.CBool
  -- ^ true cycles the texture if the texture is bound and any load ops are not LOAD
  --
  --          [C declaration]: @cycle@, defined at @SDL3\/SDL_gpu.h 2089:10@
  , clear_stencil :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The value to clear the stencil component to at the beginning of the render pass. Ignored if SDL_GPU_LOADOP_CLEAR is not used.
  --
  --          [C declaration]: @clear_stencil@, defined at @SDL3\/SDL_gpu.h 2090:11@
  , mip_level :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The mip level to use as the depth stencil target.
  --
  --          [C declaration]: @mip_level@, defined at @SDL3\/SDL_gpu.h 2091:11@
  , layer :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ The layer index to use as the depth stencil target.
  --
  --          [C declaration]: @layer@, defined at @SDL3\/SDL_gpu.h 2092:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUDepthStencilTargetInfo where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUDepthStencilTargetInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUDepthStencilTargetInfo
        <*> HasCField.readRaw (BG.Proxy @"texture") ptr0
        <*> HasCField.readRaw (BG.Proxy @"clear_depth") ptr0
        <*> HasCField.readRaw (BG.Proxy @"load_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"store_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"stencil_load_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"stencil_store_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"cycle") ptr0
        <*> HasCField.readRaw (BG.Proxy @"clear_stencil") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mip_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"layer") ptr0

instance Marshal.WriteRaw SDL_GPUDepthStencilTargetInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUDepthStencilTargetInfo
            texture2
            clear_depth3
            load_op4
            store_op5
            stencil_load_op6
            stencil_store_op7
            cycle8
            clear_stencil9
            mip_level10
            layer11 ->
              HasCField.writeRaw (BG.Proxy @"texture") ptr0 texture2
                >> HasCField.writeRaw (BG.Proxy @"clear_depth") ptr0 clear_depth3
                >> HasCField.writeRaw (BG.Proxy @"load_op") ptr0 load_op4
                >> HasCField.writeRaw (BG.Proxy @"store_op") ptr0 store_op5
                >> HasCField.writeRaw (BG.Proxy @"stencil_load_op") ptr0 stencil_load_op6
                >> HasCField.writeRaw (BG.Proxy @"stencil_store_op") ptr0 stencil_store_op7
                >> HasCField.writeRaw (BG.Proxy @"cycle") ptr0 cycle8
                >> HasCField.writeRaw (BG.Proxy @"clear_stencil") ptr0 clear_stencil9
                >> HasCField.writeRaw (BG.Proxy @"mip_level") ptr0 mip_level10
                >> HasCField.writeRaw (BG.Proxy @"layer") ptr0 layer11

deriving via
  Marshal.EquivStorable SDL_GPUDepthStencilTargetInfo
  instance
    BG.Storable SDL_GPUDepthStencilTargetInfo

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.CompatHasField.HasField "texture" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { texture = y1
            , clear_depth = BG.getField @"clear_depth" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , stencil_load_op = BG.getField @"stencil_load_op" x0
            , stencil_store_op = BG.getField @"stencil_store_op" x0
            , cycle = BG.getField @"cycle" x0
            , clear_stencil = BG.getField @"clear_stencil" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            }
      , BG.getField @"texture" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.HasField "texture" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"texture")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "texture" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "texture" =
      BG.Ptr SDL_GPUTexture

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "clear_depth" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { clear_depth = y1
            , texture = BG.getField @"texture" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , stencil_load_op = BG.getField @"stencil_load_op" x0
            , stencil_store_op = BG.getField @"stencil_store_op" x0
            , cycle = BG.getField @"cycle" x0
            , clear_stencil = BG.getField @"clear_stencil" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            }
      , BG.getField @"clear_depth" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "clear_depth" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"clear_depth")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "clear_depth" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "clear_depth" =
      BG.CFloat

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL_GPULoadOp)
  => BG.CompatHasField.HasField "load_op" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { load_op = y1
            , texture = BG.getField @"texture" x0
            , clear_depth = BG.getField @"clear_depth" x0
            , store_op = BG.getField @"store_op" x0
            , stencil_load_op = BG.getField @"stencil_load_op" x0
            , stencil_store_op = BG.getField @"stencil_store_op" x0
            , cycle = BG.getField @"cycle" x0
            , clear_stencil = BG.getField @"clear_stencil" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            }
      , BG.getField @"load_op" x0
      )

instance
  (ty ~ SDL_GPULoadOp)
  => BG.HasField "load_op" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"load_op")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "load_op" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "load_op" =
      SDL_GPULoadOp

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL_GPUStoreOp)
  => BG.CompatHasField.HasField "store_op" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { store_op = y1
            , texture = BG.getField @"texture" x0
            , clear_depth = BG.getField @"clear_depth" x0
            , load_op = BG.getField @"load_op" x0
            , stencil_load_op = BG.getField @"stencil_load_op" x0
            , stencil_store_op = BG.getField @"stencil_store_op" x0
            , cycle = BG.getField @"cycle" x0
            , clear_stencil = BG.getField @"clear_stencil" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            }
      , BG.getField @"store_op" x0
      )

instance
  (ty ~ SDL_GPUStoreOp)
  => BG.HasField "store_op" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"store_op")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "store_op" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "store_op" =
      SDL_GPUStoreOp

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL_GPULoadOp)
  => BG.CompatHasField.HasField "stencil_load_op" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { stencil_load_op = y1
            , texture = BG.getField @"texture" x0
            , clear_depth = BG.getField @"clear_depth" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , stencil_store_op = BG.getField @"stencil_store_op" x0
            , cycle = BG.getField @"cycle" x0
            , clear_stencil = BG.getField @"clear_stencil" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            }
      , BG.getField @"stencil_load_op" x0
      )

instance
  (ty ~ SDL_GPULoadOp)
  => BG.HasField "stencil_load_op" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"stencil_load_op")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "stencil_load_op" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "stencil_load_op" =
      SDL_GPULoadOp

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL_GPUStoreOp)
  => BG.CompatHasField.HasField "stencil_store_op" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { stencil_store_op = y1
            , texture = BG.getField @"texture" x0
            , clear_depth = BG.getField @"clear_depth" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , stencil_load_op = BG.getField @"stencil_load_op" x0
            , cycle = BG.getField @"cycle" x0
            , clear_stencil = BG.getField @"clear_stencil" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            }
      , BG.getField @"stencil_store_op" x0
      )

instance
  (ty ~ SDL_GPUStoreOp)
  => BG.HasField "stencil_store_op" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"stencil_store_op")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "stencil_store_op" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "stencil_store_op" =
      SDL_GPUStoreOp

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "cycle" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { cycle = y1
            , texture = BG.getField @"texture" x0
            , clear_depth = BG.getField @"clear_depth" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , stencil_load_op = BG.getField @"stencil_load_op" x0
            , stencil_store_op = BG.getField @"stencil_store_op" x0
            , clear_stencil = BG.getField @"clear_stencil" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            }
      , BG.getField @"cycle" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "cycle" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cycle")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "cycle" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "cycle" =
      BG.CBool

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "clear_stencil" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { clear_stencil = y1
            , texture = BG.getField @"texture" x0
            , clear_depth = BG.getField @"clear_depth" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , stencil_load_op = BG.getField @"stencil_load_op" x0
            , stencil_store_op = BG.getField @"stencil_store_op" x0
            , cycle = BG.getField @"cycle" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            }
      , BG.getField @"clear_stencil" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "clear_stencil" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"clear_stencil")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "clear_stencil" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "clear_stencil" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 29

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "mip_level" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { mip_level = y1
            , texture = BG.getField @"texture" x0
            , clear_depth = BG.getField @"clear_depth" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , stencil_load_op = BG.getField @"stencil_load_op" x0
            , stencil_store_op = BG.getField @"stencil_store_op" x0
            , cycle = BG.getField @"cycle" x0
            , clear_stencil = BG.getField @"clear_stencil" x0
            , layer = BG.getField @"layer" x0
            }
      , BG.getField @"mip_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "mip_level" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mip_level")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "mip_level" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "mip_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 30

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "layer" SDL_GPUDepthStencilTargetInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUDepthStencilTargetInfo
            { layer = y1
            , texture = BG.getField @"texture" x0
            , clear_depth = BG.getField @"clear_depth" x0
            , load_op = BG.getField @"load_op" x0
            , store_op = BG.getField @"store_op" x0
            , stencil_load_op = BG.getField @"stencil_load_op" x0
            , stencil_store_op = BG.getField @"stencil_store_op" x0
            , cycle = BG.getField @"cycle" x0
            , clear_stencil = BG.getField @"clear_stencil" x0
            , mip_level = BG.getField @"mip_level" x0
            }
      , BG.getField @"layer" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "layer" (BG.Ptr SDL_GPUDepthStencilTargetInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"layer")

instance HasCField.HasCField SDL_GPUDepthStencilTargetInfo "layer" where
  type
    CFieldType SDL_GPUDepthStencilTargetInfo "layer" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 31

-- | A structure containing parameters for a blit command.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitGPUTexture'
--
--     [C declaration]: @struct SDL_GPUBlitInfo@, defined at @SDL3\/SDL_gpu.h 2102:16@
data SDL_GPUBlitInfo = SDL_GPUBlitInfo
  { source :: SDL_GPUBlitRegion
  -- ^ The source region for the blit.
  --
  --          [C declaration]: @source@, defined at @SDL3\/SDL_gpu.h 2103:23@
  , destination :: SDL_GPUBlitRegion
  -- ^ The destination region for the blit.
  --
  --          [C declaration]: @destination@, defined at @SDL3\/SDL_gpu.h 2104:23@
  , load_op :: SDL_GPULoadOp
  -- ^ What is done with the contents of the destination before the blit.
  --
  --          [C declaration]: @load_op@, defined at @SDL3\/SDL_gpu.h 2105:19@
  , clear_color :: SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -- ^ The color to clear the destination region to before the blit. Ignored if load_op is not SDL_GPU_LOADOP_CLEAR.
  --
  --          [C declaration]: @clear_color@, defined at @SDL3\/SDL_gpu.h 2106:16@
  , flip_mode :: SDL3.Sys.Bindgen.Surface.SDL_FlipMode
  -- ^ The flip mode for the source region.
  --
  --          [C declaration]: @flip_mode@, defined at @SDL3\/SDL_gpu.h 2107:18@
  , filter :: SDL_GPUFilter
  -- ^ The filter mode used when blitting.
  --
  --          [C declaration]: @filter@, defined at @SDL3\/SDL_gpu.h 2108:19@
  , cycle :: BG.CBool
  -- ^ true cycles the destination texture if it is already bound.
  --
  --          [C declaration]: @cycle@, defined at @SDL3\/SDL_gpu.h 2109:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_gpu.h 2110:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 2111:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_gpu.h 2112:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUBlitInfo where
  staticSizeOf = \_ -> (96 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUBlitInfo where
  readRaw =
    \ptr0 ->
      pure SDL_GPUBlitInfo
        <*> HasCField.readRaw (BG.Proxy @"source") ptr0
        <*> HasCField.readRaw (BG.Proxy @"destination") ptr0
        <*> HasCField.readRaw (BG.Proxy @"load_op") ptr0
        <*> HasCField.readRaw (BG.Proxy @"clear_color") ptr0
        <*> HasCField.readRaw (BG.Proxy @"flip_mode") ptr0
        <*> HasCField.readRaw (BG.Proxy @"filter") ptr0
        <*> HasCField.readRaw (BG.Proxy @"cycle") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0

instance Marshal.WriteRaw SDL_GPUBlitInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUBlitInfo
            source2
            destination3
            load_op4
            clear_color5
            flip_mode6
            filter7
            cycle8
            padding19
            padding210
            padding311 ->
              HasCField.writeRaw (BG.Proxy @"source") ptr0 source2
                >> HasCField.writeRaw (BG.Proxy @"destination") ptr0 destination3
                >> HasCField.writeRaw (BG.Proxy @"load_op") ptr0 load_op4
                >> HasCField.writeRaw (BG.Proxy @"clear_color") ptr0 clear_color5
                >> HasCField.writeRaw (BG.Proxy @"flip_mode") ptr0 flip_mode6
                >> HasCField.writeRaw (BG.Proxy @"filter") ptr0 filter7
                >> HasCField.writeRaw (BG.Proxy @"cycle") ptr0 cycle8
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding19
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding210
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding311

deriving via Marshal.EquivStorable SDL_GPUBlitInfo instance BG.Storable SDL_GPUBlitInfo

instance
  (ty ~ SDL_GPUBlitRegion)
  => BG.CompatHasField.HasField "source" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { source = y1
            , destination = BG.getField @"destination" x0
            , load_op = BG.getField @"load_op" x0
            , clear_color = BG.getField @"clear_color" x0
            , flip_mode = BG.getField @"flip_mode" x0
            , filter = BG.getField @"filter" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"source" x0
      )

instance
  (ty ~ SDL_GPUBlitRegion)
  => BG.HasField "source" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"source")

instance HasCField.HasCField SDL_GPUBlitInfo "source" where
  type
    CFieldType SDL_GPUBlitInfo "source" =
      SDL_GPUBlitRegion

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_GPUBlitRegion)
  => BG.CompatHasField.HasField "destination" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { destination = y1
            , source = BG.getField @"source" x0
            , load_op = BG.getField @"load_op" x0
            , clear_color = BG.getField @"clear_color" x0
            , flip_mode = BG.getField @"flip_mode" x0
            , filter = BG.getField @"filter" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"destination" x0
      )

instance
  (ty ~ SDL_GPUBlitRegion)
  => BG.HasField "destination" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"destination")

instance HasCField.HasCField SDL_GPUBlitInfo "destination" where
  type
    CFieldType SDL_GPUBlitInfo "destination" =
      SDL_GPUBlitRegion

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL_GPULoadOp)
  => BG.CompatHasField.HasField "load_op" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { load_op = y1
            , source = BG.getField @"source" x0
            , destination = BG.getField @"destination" x0
            , clear_color = BG.getField @"clear_color" x0
            , flip_mode = BG.getField @"flip_mode" x0
            , filter = BG.getField @"filter" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"load_op" x0
      )

instance
  (ty ~ SDL_GPULoadOp)
  => BG.HasField "load_op" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"load_op")

instance HasCField.HasCField SDL_GPUBlitInfo "load_op" where
  type
    CFieldType SDL_GPUBlitInfo "load_op" =
      SDL_GPULoadOp

  offset# = \_ -> \_ -> 64

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_FColor)
  => BG.CompatHasField.HasField "clear_color" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { clear_color = y1
            , source = BG.getField @"source" x0
            , destination = BG.getField @"destination" x0
            , load_op = BG.getField @"load_op" x0
            , flip_mode = BG.getField @"flip_mode" x0
            , filter = BG.getField @"filter" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"clear_color" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_FColor)
  => BG.HasField "clear_color" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"clear_color")

instance HasCField.HasCField SDL_GPUBlitInfo "clear_color" where
  type
    CFieldType SDL_GPUBlitInfo "clear_color" =
      SDL3.Sys.Bindgen.Pixels.SDL_FColor

  offset# = \_ -> \_ -> 68

instance
  (ty ~ SDL3.Sys.Bindgen.Surface.SDL_FlipMode)
  => BG.CompatHasField.HasField "flip_mode" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { flip_mode = y1
            , source = BG.getField @"source" x0
            , destination = BG.getField @"destination" x0
            , load_op = BG.getField @"load_op" x0
            , clear_color = BG.getField @"clear_color" x0
            , filter = BG.getField @"filter" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"flip_mode" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Surface.SDL_FlipMode)
  => BG.HasField "flip_mode" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"flip_mode")

instance HasCField.HasCField SDL_GPUBlitInfo "flip_mode" where
  type
    CFieldType SDL_GPUBlitInfo "flip_mode" =
      SDL3.Sys.Bindgen.Surface.SDL_FlipMode

  offset# = \_ -> \_ -> 84

instance
  (ty ~ SDL_GPUFilter)
  => BG.CompatHasField.HasField "filter" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { filter = y1
            , source = BG.getField @"source" x0
            , destination = BG.getField @"destination" x0
            , load_op = BG.getField @"load_op" x0
            , clear_color = BG.getField @"clear_color" x0
            , flip_mode = BG.getField @"flip_mode" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"filter" x0
      )

instance
  (ty ~ SDL_GPUFilter)
  => BG.HasField "filter" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"filter")

instance HasCField.HasCField SDL_GPUBlitInfo "filter" where
  type
    CFieldType SDL_GPUBlitInfo "filter" =
      SDL_GPUFilter

  offset# = \_ -> \_ -> 88

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "cycle" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { cycle = y1
            , source = BG.getField @"source" x0
            , destination = BG.getField @"destination" x0
            , load_op = BG.getField @"load_op" x0
            , clear_color = BG.getField @"clear_color" x0
            , flip_mode = BG.getField @"flip_mode" x0
            , filter = BG.getField @"filter" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"cycle" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "cycle" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cycle")

instance HasCField.HasCField SDL_GPUBlitInfo "cycle" where
  type CFieldType SDL_GPUBlitInfo "cycle" = BG.CBool

  offset# = \_ -> \_ -> 92

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { padding1 = y1
            , source = BG.getField @"source" x0
            , destination = BG.getField @"destination" x0
            , load_op = BG.getField @"load_op" x0
            , clear_color = BG.getField @"clear_color" x0
            , flip_mode = BG.getField @"flip_mode" x0
            , filter = BG.getField @"filter" x0
            , cycle = BG.getField @"cycle" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GPUBlitInfo "padding1" where
  type
    CFieldType SDL_GPUBlitInfo "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 93

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { padding2 = y1
            , source = BG.getField @"source" x0
            , destination = BG.getField @"destination" x0
            , load_op = BG.getField @"load_op" x0
            , clear_color = BG.getField @"clear_color" x0
            , flip_mode = BG.getField @"flip_mode" x0
            , filter = BG.getField @"filter" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPUBlitInfo "padding2" where
  type
    CFieldType SDL_GPUBlitInfo "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 94

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_GPUBlitInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBlitInfo
            { padding3 = y1
            , source = BG.getField @"source" x0
            , destination = BG.getField @"destination" x0
            , load_op = BG.getField @"load_op" x0
            , clear_color = BG.getField @"clear_color" x0
            , flip_mode = BG.getField @"flip_mode" x0
            , filter = BG.getField @"filter" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_GPUBlitInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_GPUBlitInfo "padding3" where
  type
    CFieldType SDL_GPUBlitInfo "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 95

-- | A structure specifying parameters in a buffer binding call.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindGPUVertexBuffers', 'sDL_BindGPUIndexBuffer'
--
--     [C declaration]: @struct SDL_GPUBufferBinding@, defined at @SDL3\/SDL_gpu.h 2125:16@
data SDL_GPUBufferBinding = SDL_GPUBufferBinding
  { buffer :: BG.Ptr SDL_GPUBuffer
  -- ^ The buffer to bind. Must have been created with SDL_GPU_BUFFERUSAGE_VERTEX for SDL_BindGPUVertexBuffers, or SDL_GPU_BUFFERUSAGE_INDEX for SDL_BindGPUIndexBuffer.
  --
  --          [C declaration]: @buffer@, defined at @SDL3\/SDL_gpu.h 2127:20@
  , offset :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The starting byte of the data to bind in the buffer.
  --
  --          [C declaration]: @offset@, defined at @SDL3\/SDL_gpu.h 2128:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUBufferBinding where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUBufferBinding where
  readRaw =
    \ptr0 ->
      pure SDL_GPUBufferBinding
        <*> HasCField.readRaw (BG.Proxy @"buffer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"offset") ptr0

instance Marshal.WriteRaw SDL_GPUBufferBinding where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUBufferBinding buffer2 offset3 ->
            HasCField.writeRaw (BG.Proxy @"buffer") ptr0 buffer2
              >> HasCField.writeRaw (BG.Proxy @"offset") ptr0 offset3

deriving via Marshal.EquivStorable SDL_GPUBufferBinding instance BG.Storable SDL_GPUBufferBinding

instance
  (ty ~ BG.Ptr SDL_GPUBuffer)
  => BG.CompatHasField.HasField "buffer" SDL_GPUBufferBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferBinding{buffer = y1, offset = BG.getField @"offset" x0}
      , BG.getField @"buffer" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUBuffer)
  => BG.HasField "buffer" (BG.Ptr SDL_GPUBufferBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"buffer")

instance HasCField.HasCField SDL_GPUBufferBinding "buffer" where
  type
    CFieldType SDL_GPUBufferBinding "buffer" =
      BG.Ptr SDL_GPUBuffer

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "offset" SDL_GPUBufferBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUBufferBinding{offset = y1, buffer = BG.getField @"buffer" x0}
      , BG.getField @"offset" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "offset" (BG.Ptr SDL_GPUBufferBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"offset")

instance HasCField.HasCField SDL_GPUBufferBinding "offset" where
  type
    CFieldType SDL_GPUBufferBinding "offset" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

-- | A structure specifying parameters in a sampler binding call.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindGPUVertexSamplers', 'sDL_BindGPUFragmentSamplers', 'SDL_GPUTexture', 'SDL_GPUSampler'
--
--     [C declaration]: @struct SDL_GPUTextureSamplerBinding@, defined at @SDL3\/SDL_gpu.h 2141:16@
data SDL_GPUTextureSamplerBinding = SDL_GPUTextureSamplerBinding
  { texture :: BG.Ptr SDL_GPUTexture
  -- ^ The texture to bind. Must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
  --
  --          [C declaration]: @texture@, defined at @SDL3\/SDL_gpu.h 2143:21@
  , sampler :: BG.Ptr SDL_GPUSampler
  -- ^ The sampler to bind.
  --
  --          [C declaration]: @sampler@, defined at @SDL3\/SDL_gpu.h 2144:21@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUTextureSamplerBinding where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUTextureSamplerBinding where
  readRaw =
    \ptr0 ->
      pure SDL_GPUTextureSamplerBinding
        <*> HasCField.readRaw (BG.Proxy @"texture") ptr0
        <*> HasCField.readRaw (BG.Proxy @"sampler") ptr0

instance Marshal.WriteRaw SDL_GPUTextureSamplerBinding where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUTextureSamplerBinding texture2 sampler3 ->
            HasCField.writeRaw (BG.Proxy @"texture") ptr0 texture2
              >> HasCField.writeRaw (BG.Proxy @"sampler") ptr0 sampler3

deriving via
  Marshal.EquivStorable SDL_GPUTextureSamplerBinding
  instance
    BG.Storable SDL_GPUTextureSamplerBinding

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.CompatHasField.HasField "texture" SDL_GPUTextureSamplerBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureSamplerBinding{texture = y1, sampler = BG.getField @"sampler" x0}
      , BG.getField @"texture" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.HasField "texture" (BG.Ptr SDL_GPUTextureSamplerBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"texture")

instance HasCField.HasCField SDL_GPUTextureSamplerBinding "texture" where
  type
    CFieldType SDL_GPUTextureSamplerBinding "texture" =
      BG.Ptr SDL_GPUTexture

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.Ptr SDL_GPUSampler)
  => BG.CompatHasField.HasField "sampler" SDL_GPUTextureSamplerBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUTextureSamplerBinding{sampler = y1, texture = BG.getField @"texture" x0}
      , BG.getField @"sampler" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUSampler)
  => BG.HasField "sampler" (BG.Ptr SDL_GPUTextureSamplerBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"sampler")

instance HasCField.HasCField SDL_GPUTextureSamplerBinding "sampler" where
  type
    CFieldType SDL_GPUTextureSamplerBinding "sampler" =
      BG.Ptr SDL_GPUSampler

  offset# = \_ -> \_ -> 8

-- | A structure specifying parameters related to binding buffers in a compute pass.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BeginGPUComputePass'
--
--     [C declaration]: @struct SDL_GPUStorageBufferReadWriteBinding@, defined at @SDL3\/SDL_gpu.h 2155:16@
data SDL_GPUStorageBufferReadWriteBinding = SDL_GPUStorageBufferReadWriteBinding
  { buffer :: BG.Ptr SDL_GPUBuffer
  -- ^ The buffer to bind. Must have been created with SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE.
  --
  --          [C declaration]: @buffer@, defined at @SDL3\/SDL_gpu.h 2157:20@
  , cycle :: BG.CBool
  -- ^ true cycles the buffer if it is already bound.
  --
  --          [C declaration]: @cycle@, defined at @SDL3\/SDL_gpu.h 2158:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_gpu.h 2159:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 2160:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_gpu.h 2161:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUStorageBufferReadWriteBinding where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUStorageBufferReadWriteBinding where
  readRaw =
    \ptr0 ->
      pure SDL_GPUStorageBufferReadWriteBinding
        <*> HasCField.readRaw (BG.Proxy @"buffer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"cycle") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0

instance Marshal.WriteRaw SDL_GPUStorageBufferReadWriteBinding where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUStorageBufferReadWriteBinding
            buffer2
            cycle3
            padding14
            padding25
            padding36 ->
              HasCField.writeRaw (BG.Proxy @"buffer") ptr0 buffer2
                >> HasCField.writeRaw (BG.Proxy @"cycle") ptr0 cycle3
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding14
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding25
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding36

deriving via
  Marshal.EquivStorable SDL_GPUStorageBufferReadWriteBinding
  instance
    BG.Storable SDL_GPUStorageBufferReadWriteBinding

instance
  (ty ~ BG.Ptr SDL_GPUBuffer)
  => BG.CompatHasField.HasField "buffer" SDL_GPUStorageBufferReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageBufferReadWriteBinding
            { buffer = y1
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"buffer" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUBuffer)
  => BG.HasField "buffer" (BG.Ptr SDL_GPUStorageBufferReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"buffer")

instance HasCField.HasCField SDL_GPUStorageBufferReadWriteBinding "buffer" where
  type
    CFieldType SDL_GPUStorageBufferReadWriteBinding "buffer" =
      BG.Ptr SDL_GPUBuffer

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "cycle" SDL_GPUStorageBufferReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageBufferReadWriteBinding
            { cycle = y1
            , buffer = BG.getField @"buffer" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"cycle" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "cycle" (BG.Ptr SDL_GPUStorageBufferReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cycle")

instance HasCField.HasCField SDL_GPUStorageBufferReadWriteBinding "cycle" where
  type
    CFieldType SDL_GPUStorageBufferReadWriteBinding "cycle" =
      BG.CBool

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GPUStorageBufferReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageBufferReadWriteBinding
            { padding1 = y1
            , buffer = BG.getField @"buffer" x0
            , cycle = BG.getField @"cycle" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GPUStorageBufferReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GPUStorageBufferReadWriteBinding "padding1" where
  type
    CFieldType SDL_GPUStorageBufferReadWriteBinding "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 9

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPUStorageBufferReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageBufferReadWriteBinding
            { padding2 = y1
            , buffer = BG.getField @"buffer" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPUStorageBufferReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPUStorageBufferReadWriteBinding "padding2" where
  type
    CFieldType SDL_GPUStorageBufferReadWriteBinding "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 10

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_GPUStorageBufferReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageBufferReadWriteBinding
            { padding3 = y1
            , buffer = BG.getField @"buffer" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_GPUStorageBufferReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_GPUStorageBufferReadWriteBinding "padding3" where
  type
    CFieldType SDL_GPUStorageBufferReadWriteBinding "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 11

-- | A structure specifying parameters related to binding textures in a compute pass.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BeginGPUComputePass'
--
--     [C declaration]: @struct SDL_GPUStorageTextureReadWriteBinding@, defined at @SDL3\/SDL_gpu.h 2172:16@
data SDL_GPUStorageTextureReadWriteBinding = SDL_GPUStorageTextureReadWriteBinding
  { texture :: BG.Ptr SDL_GPUTexture
  -- ^ The texture to bind. Must have been created with SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE or SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE.
  --
  --          [C declaration]: @texture@, defined at @SDL3\/SDL_gpu.h 2174:21@
  , mip_level :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The mip level index to bind.
  --
  --          [C declaration]: @mip_level@, defined at @SDL3\/SDL_gpu.h 2175:12@
  , layer :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The layer index to bind.
  --
  --          [C declaration]: @layer@, defined at @SDL3\/SDL_gpu.h 2176:12@
  , cycle :: BG.CBool
  -- ^ true cycles the texture if it is already bound.
  --
  --          [C declaration]: @cycle@, defined at @SDL3\/SDL_gpu.h 2177:10@
  , padding1 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding1@, defined at @SDL3\/SDL_gpu.h 2178:11@
  , padding2 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding2@, defined at @SDL3\/SDL_gpu.h 2179:11@
  , padding3 :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding3@, defined at @SDL3\/SDL_gpu.h 2180:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUStorageTextureReadWriteBinding where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUStorageTextureReadWriteBinding where
  readRaw =
    \ptr0 ->
      pure SDL_GPUStorageTextureReadWriteBinding
        <*> HasCField.readRaw (BG.Proxy @"texture") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mip_level") ptr0
        <*> HasCField.readRaw (BG.Proxy @"layer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"cycle") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding1") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding2") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding3") ptr0

instance Marshal.WriteRaw SDL_GPUStorageTextureReadWriteBinding where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUStorageTextureReadWriteBinding
            texture2
            mip_level3
            layer4
            cycle5
            padding16
            padding27
            padding38 ->
              HasCField.writeRaw (BG.Proxy @"texture") ptr0 texture2
                >> HasCField.writeRaw (BG.Proxy @"mip_level") ptr0 mip_level3
                >> HasCField.writeRaw (BG.Proxy @"layer") ptr0 layer4
                >> HasCField.writeRaw (BG.Proxy @"cycle") ptr0 cycle5
                >> HasCField.writeRaw (BG.Proxy @"padding1") ptr0 padding16
                >> HasCField.writeRaw (BG.Proxy @"padding2") ptr0 padding27
                >> HasCField.writeRaw (BG.Proxy @"padding3") ptr0 padding38

deriving via
  Marshal.EquivStorable SDL_GPUStorageTextureReadWriteBinding
  instance
    BG.Storable SDL_GPUStorageTextureReadWriteBinding

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.CompatHasField.HasField "texture" SDL_GPUStorageTextureReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageTextureReadWriteBinding
            { texture = y1
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"texture" x0
      )

instance
  (ty ~ BG.Ptr SDL_GPUTexture)
  => BG.HasField "texture" (BG.Ptr SDL_GPUStorageTextureReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"texture")

instance HasCField.HasCField SDL_GPUStorageTextureReadWriteBinding "texture" where
  type
    CFieldType SDL_GPUStorageTextureReadWriteBinding "texture" =
      BG.Ptr SDL_GPUTexture

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "mip_level" SDL_GPUStorageTextureReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageTextureReadWriteBinding
            { mip_level = y1
            , texture = BG.getField @"texture" x0
            , layer = BG.getField @"layer" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"mip_level" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "mip_level" (BG.Ptr SDL_GPUStorageTextureReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mip_level")

instance HasCField.HasCField SDL_GPUStorageTextureReadWriteBinding "mip_level" where
  type
    CFieldType SDL_GPUStorageTextureReadWriteBinding "mip_level" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "layer" SDL_GPUStorageTextureReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageTextureReadWriteBinding
            { layer = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"layer" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "layer" (BG.Ptr SDL_GPUStorageTextureReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"layer")

instance HasCField.HasCField SDL_GPUStorageTextureReadWriteBinding "layer" where
  type
    CFieldType SDL_GPUStorageTextureReadWriteBinding "layer" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "cycle" SDL_GPUStorageTextureReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageTextureReadWriteBinding
            { cycle = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"cycle" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "cycle" (BG.Ptr SDL_GPUStorageTextureReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cycle")

instance HasCField.HasCField SDL_GPUStorageTextureReadWriteBinding "cycle" where
  type
    CFieldType SDL_GPUStorageTextureReadWriteBinding "cycle" =
      BG.CBool

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding1" SDL_GPUStorageTextureReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageTextureReadWriteBinding
            { padding1 = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , cycle = BG.getField @"cycle" x0
            , padding2 = BG.getField @"padding2" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding1" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding1" (BG.Ptr SDL_GPUStorageTextureReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding1")

instance HasCField.HasCField SDL_GPUStorageTextureReadWriteBinding "padding1" where
  type
    CFieldType SDL_GPUStorageTextureReadWriteBinding "padding1" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 17

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding2" SDL_GPUStorageTextureReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageTextureReadWriteBinding
            { padding2 = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding3 = BG.getField @"padding3" x0
            }
      , BG.getField @"padding2" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding2" (BG.Ptr SDL_GPUStorageTextureReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding2")

instance HasCField.HasCField SDL_GPUStorageTextureReadWriteBinding "padding2" where
  type
    CFieldType SDL_GPUStorageTextureReadWriteBinding "padding2" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 18

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding3" SDL_GPUStorageTextureReadWriteBinding ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUStorageTextureReadWriteBinding
            { padding3 = y1
            , texture = BG.getField @"texture" x0
            , mip_level = BG.getField @"mip_level" x0
            , layer = BG.getField @"layer" x0
            , cycle = BG.getField @"cycle" x0
            , padding1 = BG.getField @"padding1" x0
            , padding2 = BG.getField @"padding2" x0
            }
      , BG.getField @"padding3" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding3" (BG.Ptr SDL_GPUStorageTextureReadWriteBinding) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding3")

instance HasCField.HasCField SDL_GPUStorageTextureReadWriteBinding "padding3" where
  type
    CFieldType SDL_GPUStorageTextureReadWriteBinding "padding3" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 19

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN@, literal @\"SDL.gpu.device.create.debugmode\"@, defined at @SDL3\/SDL_gpu.h 2363:9@
sDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x65
    , 0x62
    , 0x75
    , 0x67
    , 0x6D
    , 0x6F
    , 0x64
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN@, literal @\"SDL.gpu.device.create.preferlowpower\"@, defined at @SDL3\/SDL_gpu.h 2364:9@
sDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x70
    , 0x72
    , 0x65
    , 0x66
    , 0x65
    , 0x72
    , 0x6C
    , 0x6F
    , 0x77
    , 0x70
    , 0x6F
    , 0x77
    , 0x65
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN@, literal @\"SDL.gpu.device.create.verbose\"@, defined at @SDL3\/SDL_gpu.h 2365:9@
sDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x65
    , 0x72
    , 0x62
    , 0x6F
    , 0x73
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING@, literal @\"SDL.gpu.device.create.name\"@, defined at @SDL3\/SDL_gpu.h 2366:9@
sDL_PROP_GPU_DEVICE_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN@, literal @\"SDL.gpu.device.create.feature.clip_distance\"@, defined at @SDL3\/SDL_gpu.h 2367:9@
sDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x66
    , 0x65
    , 0x61
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x6C
    , 0x69
    , 0x70
    , 0x5F
    , 0x64
    , 0x69
    , 0x73
    , 0x74
    , 0x61
    , 0x6E
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN@, literal @\"SDL.gpu.device.create.feature.depth_clamping\"@, defined at @SDL3\/SDL_gpu.h 2368:9@
sDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x66
    , 0x65
    , 0x61
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x64
    , 0x65
    , 0x70
    , 0x74
    , 0x68
    , 0x5F
    , 0x63
    , 0x6C
    , 0x61
    , 0x6D
    , 0x70
    , 0x69
    , 0x6E
    , 0x67
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN@, literal @\"SDL.gpu.device.create.feature.indirect_draw_first_instance\"@, defined at @SDL3\/SDL_gpu.h 2369:9@
sDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x66
    , 0x65
    , 0x61
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x69
    , 0x6E
    , 0x64
    , 0x69
    , 0x72
    , 0x65
    , 0x63
    , 0x74
    , 0x5F
    , 0x64
    , 0x72
    , 0x61
    , 0x77
    , 0x5F
    , 0x66
    , 0x69
    , 0x72
    , 0x73
    , 0x74
    , 0x5F
    , 0x69
    , 0x6E
    , 0x73
    , 0x74
    , 0x61
    , 0x6E
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN@, literal @\"SDL.gpu.device.create.feature.anisotropy\"@, defined at @SDL3\/SDL_gpu.h 2370:9@
sDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x66
    , 0x65
    , 0x61
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x61
    , 0x6E
    , 0x69
    , 0x73
    , 0x6F
    , 0x74
    , 0x72
    , 0x6F
    , 0x70
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN@, literal @\"SDL.gpu.device.create.shaders.private\"@, defined at @SDL3\/SDL_gpu.h 2371:9@
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x73
    , 0x2E
    , 0x70
    , 0x72
    , 0x69
    , 0x76
    , 0x61
    , 0x74
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN@, literal @\"SDL.gpu.device.create.shaders.spirv\"@, defined at @SDL3\/SDL_gpu.h 2372:9@
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x73
    , 0x2E
    , 0x73
    , 0x70
    , 0x69
    , 0x72
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN@, literal @\"SDL.gpu.device.create.shaders.dxbc\"@, defined at @SDL3\/SDL_gpu.h 2373:9@
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x73
    , 0x2E
    , 0x64
    , 0x78
    , 0x62
    , 0x63
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN@, literal @\"SDL.gpu.device.create.shaders.dxil\"@, defined at @SDL3\/SDL_gpu.h 2374:9@
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x73
    , 0x2E
    , 0x64
    , 0x78
    , 0x69
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN@, literal @\"SDL.gpu.device.create.shaders.msl\"@, defined at @SDL3\/SDL_gpu.h 2375:9@
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x73
    , 0x2E
    , 0x6D
    , 0x73
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN@, literal @\"SDL.gpu.device.create.shaders.metallib\"@, defined at @SDL3\/SDL_gpu.h 2376:9@
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x73
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x6C
    , 0x6C
    , 0x69
    , 0x62
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN@, literal @\"SDL.gpu.device.create.d3d12.allowtier1resourcebinding\"@, defined at @SDL3\/SDL_gpu.h 2377:9@
sDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x61
    , 0x6C
    , 0x6C
    , 0x6F
    , 0x77
    , 0x74
    , 0x69
    , 0x65
    , 0x72
    , 0x31
    , 0x72
    , 0x65
    , 0x73
    , 0x6F
    , 0x75
    , 0x72
    , 0x63
    , 0x65
    , 0x62
    , 0x69
    , 0x6E
    , 0x64
    , 0x69
    , 0x6E
    , 0x67
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING@, literal @\"SDL.gpu.device.create.d3d12.semantic\"@, defined at @SDL3\/SDL_gpu.h 2378:9@
sDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x73
    , 0x65
    , 0x6D
    , 0x61
    , 0x6E
    , 0x74
    , 0x69
    , 0x63
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER@, literal @\"SDL.gpu.device.create.d3d12.agility_sdk_version\"@, defined at @SDL3\/SDL_gpu.h 2379:9@
sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x61
    , 0x67
    , 0x69
    , 0x6C
    , 0x69
    , 0x74
    , 0x79
    , 0x5F
    , 0x73
    , 0x64
    , 0x6B
    , 0x5F
    , 0x76
    , 0x65
    , 0x72
    , 0x73
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING@, literal @\"SDL.gpu.device.create.d3d12.agility_sdk_path\"@, defined at @SDL3\/SDL_gpu.h 2380:9@
sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x61
    , 0x67
    , 0x69
    , 0x6C
    , 0x69
    , 0x74
    , 0x79
    , 0x5F
    , 0x73
    , 0x64
    , 0x6B
    , 0x5F
    , 0x70
    , 0x61
    , 0x74
    , 0x68
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN@, literal @\"SDL.gpu.device.create.vulkan.requirehardwareacceleration\"@, defined at @SDL3\/SDL_gpu.h 2381:9@
sDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x72
    , 0x65
    , 0x71
    , 0x75
    , 0x69
    , 0x72
    , 0x65
    , 0x68
    , 0x61
    , 0x72
    , 0x64
    , 0x77
    , 0x61
    , 0x72
    , 0x65
    , 0x61
    , 0x63
    , 0x63
    , 0x65
    , 0x6C
    , 0x65
    , 0x72
    , 0x61
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER@, literal @\"SDL.gpu.device.create.vulkan.options\"@, defined at @SDL3\/SDL_gpu.h 2382:9@
sDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    , 0x2E
    , 0x6F
    , 0x70
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    , 0x73
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN@, literal @\"SDL.gpu.device.create.metal.allowmacfamily1\"@, defined at @SDL3\/SDL_gpu.h 2383:9@
sDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN :: BG.ByteString
sDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x6C
    , 0x2E
    , 0x61
    , 0x6C
    , 0x6C
    , 0x6F
    , 0x77
    , 0x6D
    , 0x61
    , 0x63
    , 0x66
    , 0x61
    , 0x6D
    , 0x69
    , 0x6C
    , 0x79
    , 0x31
    ]

-- | A structure specifying additional options when using Vulkan.
--
--     When no such structure is provided, SDL will use Vulkan API version 1.0 and a minimal set of features. The requested API version influences how the feature_list is processed by SDL. When requesting API version 1.0, the feature_list is ignored. Only the vulkan_10_physical_device_features and the extension lists are used. When requesting API version 1.1, the feature_list is scanned for feature structures introduced in Vulkan 1.1. When requesting Vulkan 1.2 or higher, the feature_list is additionally scanned for compound feature structs such as VkPhysicalDeviceVulkan11Features. The device and instance extension lists, as well as vulkan_10_physical_device_features, are always processed.
--
--     @since 3.4.0
--
--     [C declaration]: @struct SDL_GPUVulkanOptions@, defined at @SDL3\/SDL_gpu.h 2402:16@
data SDL_GPUVulkanOptions = SDL_GPUVulkanOptions
  { vulkan_api_version :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The Vulkan API version to request for the instance. Use Vulkan\'s VK_MAKE_VERSION or VK_MAKE_API_VERSION.
  --
  --          [C declaration]: @vulkan_api_version@, defined at @SDL3\/SDL_gpu.h 2404:12@
  , feature_list :: BG.Ptr BG.Void
  -- ^ Pointer to the first element of a chain of Vulkan feature structs. (Requires API version 1.1 or higher.)
  --
  --          [C declaration]: @feature_list@, defined at @SDL3\/SDL_gpu.h 2405:11@
  , vulkan_10_physical_device_features :: BG.Ptr BG.Void
  -- ^ Pointer to a VkPhysicalDeviceFeatures struct to enable additional Vulkan 1.0 features.
  --
  --          [C declaration]: @vulkan_10_physical_device_features@, defined at @SDL3\/SDL_gpu.h 2406:8@
  , device_extension_count :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Number of additional device extensions to require.
  --
  --          [C declaration]: @device_extension_count@, defined at @SDL3\/SDL_gpu.h 2407:9@
  , device_extension_names :: BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^ Pointer to a list of additional device extensions to require.
  --
  --          [C declaration]: @device_extension_names@, defined at @SDL3\/SDL_gpu.h 2408:15@
  , instance_extension_count :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ Number of additional instance extensions to require.
  --
  --          [C declaration]: @instance_extension_count@, defined at @SDL3\/SDL_gpu.h 2409:9@
  , instance_extension_names :: BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^ Pointer to a list of additional instance extensions to require.
  --
  --          [C declaration]: @instance_extension_names@, defined at @SDL3\/SDL_gpu.h 2410:15@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GPUVulkanOptions where
  staticSizeOf = \_ -> (56 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_GPUVulkanOptions where
  readRaw =
    \ptr0 ->
      pure SDL_GPUVulkanOptions
        <*> HasCField.readRaw (BG.Proxy @"vulkan_api_version") ptr0
        <*> HasCField.readRaw (BG.Proxy @"feature_list") ptr0
        <*> HasCField.readRaw (BG.Proxy @"vulkan_10_physical_device_features") ptr0
        <*> HasCField.readRaw (BG.Proxy @"device_extension_count") ptr0
        <*> HasCField.readRaw (BG.Proxy @"device_extension_names") ptr0
        <*> HasCField.readRaw (BG.Proxy @"instance_extension_count") ptr0
        <*> HasCField.readRaw (BG.Proxy @"instance_extension_names") ptr0

instance Marshal.WriteRaw SDL_GPUVulkanOptions where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GPUVulkanOptions
            vulkan_api_version2
            feature_list3
            vulkan_10_physical_device_features4
            device_extension_count5
            device_extension_names6
            instance_extension_count7
            instance_extension_names8 ->
              HasCField.writeRaw (BG.Proxy @"vulkan_api_version") ptr0 vulkan_api_version2
                >> HasCField.writeRaw (BG.Proxy @"feature_list") ptr0 feature_list3
                >> HasCField.writeRaw
                  (BG.Proxy @"vulkan_10_physical_device_features")
                  ptr0
                  vulkan_10_physical_device_features4
                >> HasCField.writeRaw (BG.Proxy @"device_extension_count") ptr0 device_extension_count5
                >> HasCField.writeRaw (BG.Proxy @"device_extension_names") ptr0 device_extension_names6
                >> HasCField.writeRaw (BG.Proxy @"instance_extension_count") ptr0 instance_extension_count7
                >> HasCField.writeRaw (BG.Proxy @"instance_extension_names") ptr0 instance_extension_names8

deriving via Marshal.EquivStorable SDL_GPUVulkanOptions instance BG.Storable SDL_GPUVulkanOptions

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "vulkan_api_version" SDL_GPUVulkanOptions ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVulkanOptions
            { vulkan_api_version = y1
            , feature_list = BG.getField @"feature_list" x0
            , vulkan_10_physical_device_features = BG.getField @"vulkan_10_physical_device_features" x0
            , device_extension_count = BG.getField @"device_extension_count" x0
            , device_extension_names = BG.getField @"device_extension_names" x0
            , instance_extension_count = BG.getField @"instance_extension_count" x0
            , instance_extension_names = BG.getField @"instance_extension_names" x0
            }
      , BG.getField @"vulkan_api_version" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "vulkan_api_version" (BG.Ptr SDL_GPUVulkanOptions) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"vulkan_api_version")

instance HasCField.HasCField SDL_GPUVulkanOptions "vulkan_api_version" where
  type
    CFieldType SDL_GPUVulkanOptions "vulkan_api_version" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "feature_list" SDL_GPUVulkanOptions ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVulkanOptions
            { feature_list = y1
            , vulkan_api_version = BG.getField @"vulkan_api_version" x0
            , vulkan_10_physical_device_features = BG.getField @"vulkan_10_physical_device_features" x0
            , device_extension_count = BG.getField @"device_extension_count" x0
            , device_extension_names = BG.getField @"device_extension_names" x0
            , instance_extension_count = BG.getField @"instance_extension_count" x0
            , instance_extension_names = BG.getField @"instance_extension_names" x0
            }
      , BG.getField @"feature_list" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "feature_list" (BG.Ptr SDL_GPUVulkanOptions) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"feature_list")

instance HasCField.HasCField SDL_GPUVulkanOptions "feature_list" where
  type
    CFieldType SDL_GPUVulkanOptions "feature_list" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "vulkan_10_physical_device_features" SDL_GPUVulkanOptions ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVulkanOptions
            { vulkan_10_physical_device_features = y1
            , vulkan_api_version = BG.getField @"vulkan_api_version" x0
            , feature_list = BG.getField @"feature_list" x0
            , device_extension_count = BG.getField @"device_extension_count" x0
            , device_extension_names = BG.getField @"device_extension_names" x0
            , instance_extension_count = BG.getField @"instance_extension_count" x0
            , instance_extension_names = BG.getField @"instance_extension_names" x0
            }
      , BG.getField @"vulkan_10_physical_device_features" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "vulkan_10_physical_device_features" (BG.Ptr SDL_GPUVulkanOptions) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"vulkan_10_physical_device_features")

instance HasCField.HasCField SDL_GPUVulkanOptions "vulkan_10_physical_device_features" where
  type
    CFieldType SDL_GPUVulkanOptions "vulkan_10_physical_device_features" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "device_extension_count" SDL_GPUVulkanOptions ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVulkanOptions
            { device_extension_count = y1
            , vulkan_api_version = BG.getField @"vulkan_api_version" x0
            , feature_list = BG.getField @"feature_list" x0
            , vulkan_10_physical_device_features = BG.getField @"vulkan_10_physical_device_features" x0
            , device_extension_names = BG.getField @"device_extension_names" x0
            , instance_extension_count = BG.getField @"instance_extension_count" x0
            , instance_extension_names = BG.getField @"instance_extension_names" x0
            }
      , BG.getField @"device_extension_count" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "device_extension_count" (BG.Ptr SDL_GPUVulkanOptions) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"device_extension_count")

instance HasCField.HasCField SDL_GPUVulkanOptions "device_extension_count" where
  type
    CFieldType SDL_GPUVulkanOptions "device_extension_count" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.Ptr (PtrConst.PtrConst BG.CChar))
  => BG.CompatHasField.HasField "device_extension_names" SDL_GPUVulkanOptions ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVulkanOptions
            { device_extension_names = y1
            , vulkan_api_version = BG.getField @"vulkan_api_version" x0
            , feature_list = BG.getField @"feature_list" x0
            , vulkan_10_physical_device_features = BG.getField @"vulkan_10_physical_device_features" x0
            , device_extension_count = BG.getField @"device_extension_count" x0
            , instance_extension_count = BG.getField @"instance_extension_count" x0
            , instance_extension_names = BG.getField @"instance_extension_names" x0
            }
      , BG.getField @"device_extension_names" x0
      )

instance
  (ty ~ BG.Ptr (PtrConst.PtrConst BG.CChar))
  => BG.HasField "device_extension_names" (BG.Ptr SDL_GPUVulkanOptions) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"device_extension_names")

instance HasCField.HasCField SDL_GPUVulkanOptions "device_extension_names" where
  type
    CFieldType SDL_GPUVulkanOptions "device_extension_names" =
      BG.Ptr (PtrConst.PtrConst BG.CChar)

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "instance_extension_count" SDL_GPUVulkanOptions ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVulkanOptions
            { instance_extension_count = y1
            , vulkan_api_version = BG.getField @"vulkan_api_version" x0
            , feature_list = BG.getField @"feature_list" x0
            , vulkan_10_physical_device_features = BG.getField @"vulkan_10_physical_device_features" x0
            , device_extension_count = BG.getField @"device_extension_count" x0
            , device_extension_names = BG.getField @"device_extension_names" x0
            , instance_extension_names = BG.getField @"instance_extension_names" x0
            }
      , BG.getField @"instance_extension_count" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "instance_extension_count" (BG.Ptr SDL_GPUVulkanOptions) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"instance_extension_count")

instance HasCField.HasCField SDL_GPUVulkanOptions "instance_extension_count" where
  type
    CFieldType SDL_GPUVulkanOptions "instance_extension_count" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 40

instance
  (ty ~ BG.Ptr (PtrConst.PtrConst BG.CChar))
  => BG.CompatHasField.HasField "instance_extension_names" SDL_GPUVulkanOptions ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GPUVulkanOptions
            { instance_extension_names = y1
            , vulkan_api_version = BG.getField @"vulkan_api_version" x0
            , feature_list = BG.getField @"feature_list" x0
            , vulkan_10_physical_device_features = BG.getField @"vulkan_10_physical_device_features" x0
            , device_extension_count = BG.getField @"device_extension_count" x0
            , device_extension_names = BG.getField @"device_extension_names" x0
            , instance_extension_count = BG.getField @"instance_extension_count" x0
            }
      , BG.getField @"instance_extension_names" x0
      )

instance
  (ty ~ BG.Ptr (PtrConst.PtrConst BG.CChar))
  => BG.HasField "instance_extension_names" (BG.Ptr SDL_GPUVulkanOptions) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"instance_extension_names")

instance HasCField.HasCField SDL_GPUVulkanOptions "instance_extension_names" where
  type
    CFieldType SDL_GPUVulkanOptions "instance_extension_names" =
      BG.Ptr (PtrConst.PtrConst BG.CChar)

  offset# = \_ -> \_ -> 48

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_NAME_STRING@, literal @\"SDL.gpu.device.name\"@, defined at @SDL3\/SDL_gpu.h 2579:9@
sDL_PROP_GPU_DEVICE_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_DEVICE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING@, literal @\"SDL.gpu.device.driver_name\"@, defined at @SDL3\/SDL_gpu.h 2580:9@
sDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x64
    , 0x72
    , 0x69
    , 0x76
    , 0x65
    , 0x72
    , 0x5F
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING@, literal @\"SDL.gpu.device.driver_version\"@, defined at @SDL3\/SDL_gpu.h 2581:9@
sDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING :: BG.ByteString
sDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x64
    , 0x72
    , 0x69
    , 0x76
    , 0x65
    , 0x72
    , 0x5F
    , 0x76
    , 0x65
    , 0x72
    , 0x73
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING@, literal @\"SDL.gpu.device.driver_info\"@, defined at @SDL3\/SDL_gpu.h 2582:9@
sDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING :: BG.ByteString
sDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x69
    , 0x63
    , 0x65
    , 0x2E
    , 0x64
    , 0x72
    , 0x69
    , 0x76
    , 0x65
    , 0x72
    , 0x5F
    , 0x69
    , 0x6E
    , 0x66
    , 0x6F
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING@, literal @\"SDL.gpu.computepipeline.create.name\"@, defined at @SDL3\/SDL_gpu.h 2636:9@
sDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x63
    , 0x6F
    , 0x6D
    , 0x70
    , 0x75
    , 0x74
    , 0x65
    , 0x70
    , 0x69
    , 0x70
    , 0x65
    , 0x6C
    , 0x69
    , 0x6E
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING@, literal @\"SDL.gpu.graphicspipeline.create.name\"@, defined at @SDL3\/SDL_gpu.h 2663:9@
sDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x67
    , 0x72
    , 0x61
    , 0x70
    , 0x68
    , 0x69
    , 0x63
    , 0x73
    , 0x70
    , 0x69
    , 0x70
    , 0x65
    , 0x6C
    , 0x69
    , 0x6E
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING@, literal @\"SDL.gpu.sampler.create.name\"@, defined at @SDL3\/SDL_gpu.h 2690:9@
sDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x73
    , 0x61
    , 0x6D
    , 0x70
    , 0x6C
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_SHADER_CREATE_NAME_STRING@, literal @\"SDL.gpu.shader.create.name\"@, defined at @SDL3\/SDL_gpu.h 2769:9@
sDL_PROP_GPU_SHADER_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_SHADER_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x73
    , 0x68
    , 0x61
    , 0x64
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT@, literal @\"SDL.gpu.texture.create.d3d12.clear.r\"@, defined at @SDL3\/SDL_gpu.h 2833:9@
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT :: BG.ByteString
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x63
    , 0x6C
    , 0x65
    , 0x61
    , 0x72
    , 0x2E
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT@, literal @\"SDL.gpu.texture.create.d3d12.clear.g\"@, defined at @SDL3\/SDL_gpu.h 2834:9@
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT :: BG.ByteString
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x63
    , 0x6C
    , 0x65
    , 0x61
    , 0x72
    , 0x2E
    , 0x67
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT@, literal @\"SDL.gpu.texture.create.d3d12.clear.b\"@, defined at @SDL3\/SDL_gpu.h 2835:9@
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT :: BG.ByteString
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x63
    , 0x6C
    , 0x65
    , 0x61
    , 0x72
    , 0x2E
    , 0x62
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT@, literal @\"SDL.gpu.texture.create.d3d12.clear.a\"@, defined at @SDL3\/SDL_gpu.h 2836:9@
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT :: BG.ByteString
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x63
    , 0x6C
    , 0x65
    , 0x61
    , 0x72
    , 0x2E
    , 0x61
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT@, literal @\"SDL.gpu.texture.create.d3d12.clear.depth\"@, defined at @SDL3\/SDL_gpu.h 2837:9@
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT :: BG.ByteString
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x63
    , 0x6C
    , 0x65
    , 0x61
    , 0x72
    , 0x2E
    , 0x64
    , 0x65
    , 0x70
    , 0x74
    , 0x68
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER@, literal @\"SDL.gpu.texture.create.d3d12.clear.stencil\"@, defined at @SDL3\/SDL_gpu.h 2838:9@
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER :: BG.ByteString
sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x33
    , 0x64
    , 0x31
    , 0x32
    , 0x2E
    , 0x63
    , 0x6C
    , 0x65
    , 0x61
    , 0x72
    , 0x2E
    , 0x73
    , 0x74
    , 0x65
    , 0x6E
    , 0x63
    , 0x69
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING@, literal @\"SDL.gpu.texture.create.name\"@, defined at @SDL3\/SDL_gpu.h 2839:9@
sDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x75
    , 0x72
    , 0x65
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING@, literal @\"SDL.gpu.buffer.create.name\"@, defined at @SDL3\/SDL_gpu.h 2889:9@
sDL_PROP_GPU_BUFFER_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_BUFFER_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x62
    , 0x75
    , 0x66
    , 0x66
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING@, literal @\"SDL.gpu.transferbuffer.create.name\"@, defined at @SDL3\/SDL_gpu.h 2922:9@
sDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x67
    , 0x70
    , 0x75
    , 0x2E
    , 0x74
    , 0x72
    , 0x61
    , 0x6E
    , 0x73
    , 0x66
    , 0x65
    , 0x72
    , 0x62
    , 0x75
    , 0x66
    , 0x66
    , 0x65
    , 0x72
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]
