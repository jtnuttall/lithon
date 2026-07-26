{-# LANGUAGE PatternSynonyms #-}

-- | The GPU API offers a cross-platform way for apps to talk to modern graphics hardware. It offers both 3D graphics and compute support, in the style of Metal, Vulkan, and Direct3D 12.
--
--     A basic workflow might be something like this:
--
--     The app creates a GPU device with @'createGPUDevice'@, and assigns it to a window with @'claimWindowForGPUDevice'@ although strictly speaking you can render offscreen entirely, perhaps for image processing, and not use a window at all.
--
--     Next, the app prepares static data (things that are created once and used over and over). For example:
--
--     * Shaders (programs that run on the GPU): use @'createGPUShader'@.
--
--     * Vertex buffers (arrays of geometry data) and other rendering data: use @'createGPUBuffer'@ and @'uploadToGPUBuffer'@.
--
--     * Textures (images): use @'createGPUTexture'@ and @'uploadToGPUTexture'@.
--
--     * Samplers (how textures should be read from): use @'createGPUSampler'@.
--
--     * Render pipelines (precalculated rendering state): use @'createGPUGraphicsPipeline'@
--
--     To render, the app creates one or more command buffers, with @'acquireGPUCommandBuffer'@. Command buffers collect rendering instructions that will be submitted to the GPU in batch. Complex scenes can use multiple command buffers, maybe configured across multiple threads in parallel, as long as they are submitted in the correct order, but many apps will just need one command buffer per frame.
--
--     Rendering can happen to a texture (what other APIs call a \"render target\") or it can happen to the swapchain texture (which is just a special texture that represents a window\'s contents). The app can use @'waitAndAcquireGPUSwapchainTexture'@ to render to the window.
--
--     Rendering actually happens in a Render Pass, which is encoded into a command buffer. One can encode multiple render passes (or alternate between render and compute passes) in a single command buffer, but many apps might simply need a single render pass in a single command buffer. Render Passes can render to up to four color textures and one depth texture simultaneously. If the set of textures being rendered to needs to change, the Render Pass must be ended and a new one must be begun.
--
--     The app calls @'beginGPURenderPass'@. Then it sets states it needs for each draw:
--
--     * @'bindGPUGraphicsPipeline'@
--
--     * @'setGPUViewport'@
--
--     * @'bindGPUVertexBuffers'@
--
--     * @'bindGPUVertexSamplers'@
--
--     * etc
--
--     Then, make the actual draw commands with these states:
--
--     * @'drawGPUPrimitives'@
--
--     * @'drawGPUPrimitivesIndirect'@
--
--     * @'drawGPUIndexedPrimitivesIndirect'@
--
--     * etc
--
--     After all the drawing commands for a pass are complete, the app should call @'endGPURenderPass'@. Once a render pass ends all render-related state is reset.
--
--     The app can begin new Render Passes and make new draws in the same command buffer until the entire scene is rendered.
--
--     Once all of the render commands for the scene are complete, the app calls @'submitGPUCommandBuffer'@ to send it to the GPU for processing.
--
--     If the app needs to read back data from texture or buffers, the API has an efficient way of doing this, provided that the app is willing to tolerate some latency. When the app uses @'downloadFromGPUTexture'@ or @'downloadFromGPUBuffer'@, submitting the command buffer with @'submitGPUCommandBufferAndAcquireFence'@ will return a fence handle that the app can poll or wait on in a thread. Once the fence indicates that the command buffer is done processing, it is safe to read the downloaded data. Make sure to call @'releaseGPUFence'@ when done with the fence.
--
--     The API also has \"compute\" support. The app calls @'beginGPUComputePass'@ with compute-writeable textures and\/or buffers, which can be written to in a compute shader. Then it sets states it needs for the compute dispatches:
--
--     * @'bindGPUComputePipeline'@
--
--     * @'bindGPUComputeStorageBuffers'@
--
--     * @'bindGPUComputeStorageTextures'@
--
--     Then, dispatch compute work:
--
--     * @'dispatchGPUCompute'@
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
--     Answer: A common oversight when using shaders is not properly laying out the shader resources\/registers correctly. The GPU API is very strict with how it wants resources to be laid out and it\'s difficult for the API to automatically validate shaders to see if they have a compatible layout. See the documentation for @'createGPUShader'@ and @'createGPUComputePipeline'@ for information on the expected layout.
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
--     SDL driver name: \"vulkan\" (for use in @'createGPUDevice'@ and SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING)
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
--     You can remove some of these requirements to increase compatibility with Android devices by using these properties when creating the GPU device with @'createGPUDeviceWithProperties'@:
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
--     You can remove the Tier 2 resource binding requirement to support Intel Haswell and Broadwell GPUs by using this property when creating the GPU device with @'createGPUDeviceWithProperties'@:
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
--     For example: you can call @'mapGPUTransferBuffer'@, write texture data, @'unmapGPUTransferBuffer'@, and then @'uploadToGPUTexture'@. The next time you write texture data to the transfer buffer, if you set the cycle param to true, you don\'t have to worry about overwriting any data that is not yet uploaded.
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
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Gpu.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Gpu (
  module SDL3.Sys.Bindgen.Gpu,

  -- * Typed constants
  pattern SDL3.Sys.Gpu.SDL_GPU_BUFFERUSAGE_VERTEX,
  pattern SDL3.Sys.Gpu.SDL_GPU_BUFFERUSAGE_INDEX,
  pattern SDL3.Sys.Gpu.SDL_GPU_BUFFERUSAGE_INDIRECT,
  pattern SDL3.Sys.Gpu.SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ,
  pattern SDL3.Sys.Gpu.SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ,
  pattern SDL3.Sys.Gpu.SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE,
  pattern SDL3.Sys.Gpu.SDL_GPU_COLORCOMPONENT_R,
  pattern SDL3.Sys.Gpu.SDL_GPU_COLORCOMPONENT_G,
  pattern SDL3.Sys.Gpu.SDL_GPU_COLORCOMPONENT_B,
  pattern SDL3.Sys.Gpu.SDL_GPU_COLORCOMPONENT_A,
  pattern SDL3.Sys.Gpu.SDL_GPU_SHADERFORMAT_INVALID,
  pattern SDL3.Sys.Gpu.SDL_GPU_SHADERFORMAT_PRIVATE,
  pattern SDL3.Sys.Gpu.SDL_GPU_SHADERFORMAT_SPIRV,
  pattern SDL3.Sys.Gpu.SDL_GPU_SHADERFORMAT_DXBC,
  pattern SDL3.Sys.Gpu.SDL_GPU_SHADERFORMAT_DXIL,
  pattern SDL3.Sys.Gpu.SDL_GPU_SHADERFORMAT_MSL,
  pattern SDL3.Sys.Gpu.SDL_GPU_SHADERFORMAT_METALLIB,
  pattern SDL3.Sys.Gpu.SDL_GPU_TEXTUREUSAGE_SAMPLER,
  pattern SDL3.Sys.Gpu.SDL_GPU_TEXTUREUSAGE_COLOR_TARGET,
  pattern SDL3.Sys.Gpu.SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET,
  pattern SDL3.Sys.Gpu.SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ,
  pattern SDL3.Sys.Gpu.SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ,
  pattern SDL3.Sys.Gpu.SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE,
  pattern SDL3.Sys.Gpu.SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE,

  -- * Function aliases
  SDL3.Sys.Gpu.gpuSupportsShaderFormats,
  SDL3.Sys.Gpu.gpuSupportsShaderFormatsSafe,
  SDL3.Sys.Gpu.gpuSupportsProperties,
  SDL3.Sys.Gpu.gpuSupportsPropertiesSafe,
  SDL3.Sys.Gpu.createGPUDevice,
  SDL3.Sys.Gpu.createGPUDeviceSafe,
  SDL3.Sys.Gpu.createGPUDeviceWithProperties,
  SDL3.Sys.Gpu.createGPUDeviceWithPropertiesSafe,
  SDL3.Sys.Gpu.destroyGPUDevice,
  SDL3.Sys.Gpu.destroyGPUDeviceSafe,
  SDL3.Sys.Gpu.getNumGPUDrivers,
  SDL3.Sys.Gpu.getNumGPUDriversSafe,
  SDL3.Sys.Gpu.getGPUDriver,
  SDL3.Sys.Gpu.getGPUDriverSafe,
  SDL3.Sys.Gpu.getGPUDeviceDriver,
  SDL3.Sys.Gpu.getGPUDeviceDriverSafe,
  SDL3.Sys.Gpu.getGPUShaderFormats,
  SDL3.Sys.Gpu.getGPUShaderFormatsSafe,
  SDL3.Sys.Gpu.getGPUDeviceProperties,
  SDL3.Sys.Gpu.getGPUDevicePropertiesSafe,
  SDL3.Sys.Gpu.createGPUComputePipeline,
  SDL3.Sys.Gpu.createGPUComputePipelineSafe,
  SDL3.Sys.Gpu.createGPUGraphicsPipeline,
  SDL3.Sys.Gpu.createGPUGraphicsPipelineSafe,
  SDL3.Sys.Gpu.createGPUSampler,
  SDL3.Sys.Gpu.createGPUSamplerSafe,
  SDL3.Sys.Gpu.createGPUShader,
  SDL3.Sys.Gpu.createGPUShaderSafe,
  SDL3.Sys.Gpu.createGPUTexture,
  SDL3.Sys.Gpu.createGPUTextureSafe,
  SDL3.Sys.Gpu.createGPUBuffer,
  SDL3.Sys.Gpu.createGPUBufferSafe,
  SDL3.Sys.Gpu.createGPUTransferBuffer,
  SDL3.Sys.Gpu.createGPUTransferBufferSafe,
  SDL3.Sys.Gpu.setGPUBufferName,
  SDL3.Sys.Gpu.setGPUBufferNameSafe,
  SDL3.Sys.Gpu.setGPUTextureName,
  SDL3.Sys.Gpu.setGPUTextureNameSafe,
  SDL3.Sys.Gpu.insertGPUDebugLabel,
  SDL3.Sys.Gpu.insertGPUDebugLabelSafe,
  SDL3.Sys.Gpu.pushGPUDebugGroup,
  SDL3.Sys.Gpu.pushGPUDebugGroupSafe,
  SDL3.Sys.Gpu.popGPUDebugGroup,
  SDL3.Sys.Gpu.popGPUDebugGroupSafe,
  SDL3.Sys.Gpu.releaseGPUTexture,
  SDL3.Sys.Gpu.releaseGPUTextureSafe,
  SDL3.Sys.Gpu.releaseGPUSampler,
  SDL3.Sys.Gpu.releaseGPUSamplerSafe,
  SDL3.Sys.Gpu.releaseGPUBuffer,
  SDL3.Sys.Gpu.releaseGPUBufferSafe,
  SDL3.Sys.Gpu.releaseGPUTransferBuffer,
  SDL3.Sys.Gpu.releaseGPUTransferBufferSafe,
  SDL3.Sys.Gpu.releaseGPUComputePipeline,
  SDL3.Sys.Gpu.releaseGPUComputePipelineSafe,
  SDL3.Sys.Gpu.releaseGPUShader,
  SDL3.Sys.Gpu.releaseGPUShaderSafe,
  SDL3.Sys.Gpu.releaseGPUGraphicsPipeline,
  SDL3.Sys.Gpu.releaseGPUGraphicsPipelineSafe,
  SDL3.Sys.Gpu.acquireGPUCommandBuffer,
  SDL3.Sys.Gpu.acquireGPUCommandBufferSafe,
  SDL3.Sys.Gpu.pushGPUVertexUniformData,
  SDL3.Sys.Gpu.pushGPUVertexUniformDataSafe,
  SDL3.Sys.Gpu.pushGPUFragmentUniformData,
  SDL3.Sys.Gpu.pushGPUFragmentUniformDataSafe,
  SDL3.Sys.Gpu.pushGPUComputeUniformData,
  SDL3.Sys.Gpu.pushGPUComputeUniformDataSafe,
  SDL3.Sys.Gpu.beginGPURenderPass,
  SDL3.Sys.Gpu.beginGPURenderPassSafe,
  SDL3.Sys.Gpu.bindGPUGraphicsPipeline,
  SDL3.Sys.Gpu.bindGPUGraphicsPipelineSafe,
  SDL3.Sys.Gpu.setGPUViewport,
  SDL3.Sys.Gpu.setGPUViewportSafe,
  SDL3.Sys.Gpu.setGPUScissor,
  SDL3.Sys.Gpu.setGPUScissorSafe,
  SDL3.Sys.Gpu.setGPUBlendConstants,
  SDL3.Sys.Gpu.setGPUBlendConstantsSafe,
  SDL3.Sys.Gpu.setGPUStencilReference,
  SDL3.Sys.Gpu.setGPUStencilReferenceSafe,
  SDL3.Sys.Gpu.bindGPUVertexBuffers,
  SDL3.Sys.Gpu.bindGPUVertexBuffersSafe,
  SDL3.Sys.Gpu.bindGPUIndexBuffer,
  SDL3.Sys.Gpu.bindGPUIndexBufferSafe,
  SDL3.Sys.Gpu.bindGPUVertexSamplers,
  SDL3.Sys.Gpu.bindGPUVertexSamplersSafe,
  SDL3.Sys.Gpu.bindGPUVertexStorageTextures,
  SDL3.Sys.Gpu.bindGPUVertexStorageTexturesSafe,
  SDL3.Sys.Gpu.bindGPUVertexStorageBuffers,
  SDL3.Sys.Gpu.bindGPUVertexStorageBuffersSafe,
  SDL3.Sys.Gpu.bindGPUFragmentSamplers,
  SDL3.Sys.Gpu.bindGPUFragmentSamplersSafe,
  SDL3.Sys.Gpu.bindGPUFragmentStorageTextures,
  SDL3.Sys.Gpu.bindGPUFragmentStorageTexturesSafe,
  SDL3.Sys.Gpu.bindGPUFragmentStorageBuffers,
  SDL3.Sys.Gpu.bindGPUFragmentStorageBuffersSafe,
  SDL3.Sys.Gpu.drawGPUIndexedPrimitives,
  SDL3.Sys.Gpu.drawGPUIndexedPrimitivesSafe,
  SDL3.Sys.Gpu.drawGPUPrimitives,
  SDL3.Sys.Gpu.drawGPUPrimitivesSafe,
  SDL3.Sys.Gpu.drawGPUPrimitivesIndirect,
  SDL3.Sys.Gpu.drawGPUPrimitivesIndirectSafe,
  SDL3.Sys.Gpu.drawGPUIndexedPrimitivesIndirect,
  SDL3.Sys.Gpu.drawGPUIndexedPrimitivesIndirectSafe,
  SDL3.Sys.Gpu.endGPURenderPass,
  SDL3.Sys.Gpu.endGPURenderPassSafe,
  SDL3.Sys.Gpu.beginGPUComputePass,
  SDL3.Sys.Gpu.beginGPUComputePassSafe,
  SDL3.Sys.Gpu.bindGPUComputePipeline,
  SDL3.Sys.Gpu.bindGPUComputePipelineSafe,
  SDL3.Sys.Gpu.bindGPUComputeSamplers,
  SDL3.Sys.Gpu.bindGPUComputeSamplersSafe,
  SDL3.Sys.Gpu.bindGPUComputeStorageTextures,
  SDL3.Sys.Gpu.bindGPUComputeStorageTexturesSafe,
  SDL3.Sys.Gpu.bindGPUComputeStorageBuffers,
  SDL3.Sys.Gpu.bindGPUComputeStorageBuffersSafe,
  SDL3.Sys.Gpu.dispatchGPUCompute,
  SDL3.Sys.Gpu.dispatchGPUComputeSafe,
  SDL3.Sys.Gpu.dispatchGPUComputeIndirect,
  SDL3.Sys.Gpu.dispatchGPUComputeIndirectSafe,
  SDL3.Sys.Gpu.endGPUComputePass,
  SDL3.Sys.Gpu.endGPUComputePassSafe,
  SDL3.Sys.Gpu.mapGPUTransferBuffer,
  SDL3.Sys.Gpu.mapGPUTransferBufferSafe,
  SDL3.Sys.Gpu.unmapGPUTransferBuffer,
  SDL3.Sys.Gpu.unmapGPUTransferBufferSafe,
  SDL3.Sys.Gpu.beginGPUCopyPass,
  SDL3.Sys.Gpu.beginGPUCopyPassSafe,
  SDL3.Sys.Gpu.uploadToGPUTexture,
  SDL3.Sys.Gpu.uploadToGPUTextureSafe,
  SDL3.Sys.Gpu.uploadToGPUBuffer,
  SDL3.Sys.Gpu.uploadToGPUBufferSafe,
  SDL3.Sys.Gpu.copyGPUTextureToTexture,
  SDL3.Sys.Gpu.copyGPUTextureToTextureSafe,
  SDL3.Sys.Gpu.copyGPUBufferToBuffer,
  SDL3.Sys.Gpu.copyGPUBufferToBufferSafe,
  SDL3.Sys.Gpu.downloadFromGPUTexture,
  SDL3.Sys.Gpu.downloadFromGPUTextureSafe,
  SDL3.Sys.Gpu.downloadFromGPUBuffer,
  SDL3.Sys.Gpu.downloadFromGPUBufferSafe,
  SDL3.Sys.Gpu.endGPUCopyPass,
  SDL3.Sys.Gpu.endGPUCopyPassSafe,
  SDL3.Sys.Gpu.generateMipmapsForGPUTexture,
  SDL3.Sys.Gpu.generateMipmapsForGPUTextureSafe,
  SDL3.Sys.Gpu.blitGPUTexture,
  SDL3.Sys.Gpu.blitGPUTextureSafe,
  SDL3.Sys.Gpu.windowSupportsGPUSwapchainComposition,
  SDL3.Sys.Gpu.windowSupportsGPUSwapchainCompositionSafe,
  SDL3.Sys.Gpu.windowSupportsGPUPresentMode,
  SDL3.Sys.Gpu.windowSupportsGPUPresentModeSafe,
  SDL3.Sys.Gpu.claimWindowForGPUDevice,
  SDL3.Sys.Gpu.claimWindowForGPUDeviceSafe,
  SDL3.Sys.Gpu.releaseWindowFromGPUDevice,
  SDL3.Sys.Gpu.releaseWindowFromGPUDeviceSafe,
  SDL3.Sys.Gpu.setGPUSwapchainParameters,
  SDL3.Sys.Gpu.setGPUSwapchainParametersSafe,
  SDL3.Sys.Gpu.setGPUAllowedFramesInFlight,
  SDL3.Sys.Gpu.setGPUAllowedFramesInFlightSafe,
  SDL3.Sys.Gpu.getGPUSwapchainTextureFormat,
  SDL3.Sys.Gpu.getGPUSwapchainTextureFormatSafe,
  SDL3.Sys.Gpu.acquireGPUSwapchainTexture,
  SDL3.Sys.Gpu.acquireGPUSwapchainTextureSafe,
  SDL3.Sys.Gpu.waitForGPUSwapchain,
  SDL3.Sys.Gpu.waitForGPUSwapchainSafe,
  SDL3.Sys.Gpu.waitAndAcquireGPUSwapchainTexture,
  SDL3.Sys.Gpu.waitAndAcquireGPUSwapchainTextureSafe,
  SDL3.Sys.Gpu.submitGPUCommandBuffer,
  SDL3.Sys.Gpu.submitGPUCommandBufferSafe,
  SDL3.Sys.Gpu.submitGPUCommandBufferAndAcquireFence,
  SDL3.Sys.Gpu.submitGPUCommandBufferAndAcquireFenceSafe,
  SDL3.Sys.Gpu.cancelGPUCommandBuffer,
  SDL3.Sys.Gpu.cancelGPUCommandBufferSafe,
  SDL3.Sys.Gpu.waitForGPUIdle,
  SDL3.Sys.Gpu.waitForGPUIdleSafe,
  SDL3.Sys.Gpu.waitForGPUFences,
  SDL3.Sys.Gpu.waitForGPUFencesSafe,
  SDL3.Sys.Gpu.queryGPUFence,
  SDL3.Sys.Gpu.queryGPUFenceSafe,
  SDL3.Sys.Gpu.releaseGPUFence,
  SDL3.Sys.Gpu.releaseGPUFenceSafe,
  SDL3.Sys.Gpu.gpuTextureFormatTexelBlockSize,
  SDL3.Sys.Gpu.gpuTextureFormatTexelBlockSizeSafe,
  SDL3.Sys.Gpu.gpuTextureSupportsFormat,
  SDL3.Sys.Gpu.gpuTextureSupportsFormatSafe,
  SDL3.Sys.Gpu.gpuTextureSupportsSampleCount,
  SDL3.Sys.Gpu.gpuTextureSupportsSampleCountSafe,
  SDL3.Sys.Gpu.calculateGPUTextureFormatSize,
  SDL3.Sys.Gpu.calculateGPUTextureFormatSizeSafe,
  SDL3.Sys.Gpu.getPixelFormatFromGPUTextureFormat,
  SDL3.Sys.Gpu.getPixelFormatFromGPUTextureFormatSafe,
  SDL3.Sys.Gpu.getGPUTextureFormatFromPixelFormat,
  SDL3.Sys.Gpu.getGPUTextureFormatFromPixelFormatSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Gpu
import SDL3.Sys.Bindgen.Gpu.Safe qualified as Safe
import SDL3.Sys.Bindgen.Gpu.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Video qualified

-- | Checks for GPU runtime support.
--
--     [Returns]: true if supported, false otherwise.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GPUSupportsShaderFormats@.
--                   The safe flavor is 'gpuSupportsShaderFormatsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUSupportsShaderFormats@, defined at @SDL3\/SDL_gpu.h 2200:34@
gpuSupportsShaderFormats
  :: SDL_GPUShaderFormat
  -- ^
  --
  --           [@format_flags@]: a bitflag indicating which shader formats the app is able to provide.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the preferred GPU driver, or NULL to let SDL pick the optimal driver.
  -> IO Bool
gpuSupportsShaderFormats =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GPUSupportsShaderFormats x00 x11)

-- | Checks for GPU runtime support.
--
--     [Returns]: true if supported, false otherwise.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GPUSupportsShaderFormats@.
--                   The unsafe flavor is 'gpuSupportsShaderFormats'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUSupportsShaderFormats@, defined at @SDL3\/SDL_gpu.h 2200:34@
gpuSupportsShaderFormatsSafe
  :: SDL_GPUShaderFormat
  -- ^
  --
  --           [@format_flags@]: a bitflag indicating which shader formats the app is able to provide.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the preferred GPU driver, or NULL to let SDL pick the optimal driver.
  -> IO Bool
gpuSupportsShaderFormatsSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GPUSupportsShaderFormats x00 x11)

-- | Checks for GPU runtime support.
--
--     [Returns]: true if supported, false otherwise.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUDeviceWithProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GPUSupportsProperties@.
--                   The safe flavor is 'gpuSupportsPropertiesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUSupportsProperties@, defined at @SDL3\/SDL_gpu.h 2214:34@
gpuSupportsProperties
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO Bool
gpuSupportsProperties =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GPUSupportsProperties x00)

-- | Checks for GPU runtime support.
--
--     [Returns]: true if supported, false otherwise.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUDeviceWithProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GPUSupportsProperties@.
--                   The unsafe flavor is 'gpuSupportsProperties'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUSupportsProperties@, defined at @SDL3\/SDL_gpu.h 2214:34@
gpuSupportsPropertiesSafe
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO Bool
gpuSupportsPropertiesSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GPUSupportsProperties x00)

-- | Creates a GPU context.
--
--     The GPU driver name can be one of the following:
--
--     * \"vulkan\": [Vulkan](https://wiki.libsdl.org/SDL3/CategoryGPU#vulkan)
--
--     * \"direct3d12\": [D3D12](https://wiki.libsdl.org/SDL3/CategoryGPU#d3d12)
--
--     * \"metal\": [Metal](https://wiki.libsdl.org/SDL3/CategoryGPU#metal)
--
--     * NULL: let SDL pick the optimal driver
--
--     [Returns]: a GPU context on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUDeviceWithProperties', 'getGPUShaderFormats', 'getGPUDeviceDriver', 'destroyGPUDevice', 'gpuSupportsShaderFormats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPUDevice@.
--                   The safe flavor is 'createGPUDeviceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateGPUDevice@, defined at @SDL3\/SDL_gpu.h 2243:45@
createGPUDevice
  :: SDL_GPUShaderFormat
  -- ^
  --
  --           [@format_flags@]: a bitflag indicating which shader formats the app is able to provide.
  -> Bool
  -- ^
  --
  --           [@debug_mode@]: enable debug mode properties and validations.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the preferred GPU driver, or NULL to let SDL pick the optimal driver.
  -> IO (BG.Ptr SDL_GPUDevice)
createGPUDevice =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_CreateGPUDevice x00 (CBool.fromBool x11) x22

-- | Creates a GPU context.
--
--     The GPU driver name can be one of the following:
--
--     * \"vulkan\": [Vulkan](https://wiki.libsdl.org/SDL3/CategoryGPU#vulkan)
--
--     * \"direct3d12\": [D3D12](https://wiki.libsdl.org/SDL3/CategoryGPU#d3d12)
--
--     * \"metal\": [Metal](https://wiki.libsdl.org/SDL3/CategoryGPU#metal)
--
--     * NULL: let SDL pick the optimal driver
--
--     [Returns]: a GPU context on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUDeviceWithProperties', 'getGPUShaderFormats', 'getGPUDeviceDriver', 'destroyGPUDevice', 'gpuSupportsShaderFormats'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPUDevice@.
--                   The unsafe flavor is 'createGPUDevice'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateGPUDevice@, defined at @SDL3\/SDL_gpu.h 2243:45@
createGPUDeviceSafe
  :: SDL_GPUShaderFormat
  -- ^
  --
  --           [@format_flags@]: a bitflag indicating which shader formats the app is able to provide.
  -> Bool
  -- ^
  --
  --           [@debug_mode@]: enable debug mode properties and validations.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the preferred GPU driver, or NULL to let SDL pick the optimal driver.
  -> IO (BG.Ptr SDL_GPUDevice)
createGPUDeviceSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_CreateGPUDevice x00 (CBool.fromBool x11) x22

-- | Creates a GPU context.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN'@: enable debug mode properties and validations, defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN'@: enable to prefer energy efficiency over maximum GPU performance, defaults to false.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN'@: enable to automatically log useful debug information on device creation, defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_NAME_STRING'@: the name of the GPU driver to use, if a specific one is desired.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN'@: Enable Vulkan device feature shaderClipDistance. If disabled, clip distances are not supported in shader code: gl_ClipDistance[] built-ins of GLSL, SV_ClipDistance0\/1 semantics of HLSL and [[clip_distance]] attribute of Metal. Disabling optional features allows the application to run on some older Android devices. Defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN'@: Enable Vulkan device feature depthClamp. If disabled, there is no depth clamp support and enable_depth_clip in 'SDL_GPURasterizerState' must always be set to true. Disabling optional features allows the application to run on some older Android devices. Defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN'@: Enable Vulkan device feature drawIndirectFirstInstance. If disabled, the argument first_instance of 'SDL_GPUIndirectDrawCommand' must be set to zero. Disabling optional features allows the application to run on some older Android devices. Defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN'@: Enable Vulkan device feature samplerAnisotropy. If disabled, enable_anisotropy of 'SDL_GPUSamplerCreateInfo' must be set to false. Disabling optional features allows the application to run on some older Android devices. Defaults to true.
--
--     These are the current shader format properties:
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN'@: The app is able to provide shaders for an NDA platform.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN'@: The app is able to provide SPIR-V shaders if applicable.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN'@: The app is able to provide DXBC shaders if applicable
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN'@: The app is able to provide DXIL shaders if applicable.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN'@: The app is able to provide MSL shaders if applicable.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN'@: The app is able to provide Metal shader libraries if applicable.
--
--     With the D3D12 backend:
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING'@: the prefix to use for all vertex semantics, default is \"TEXCOORD\".
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN'@: By default, Resourcing Binding Tier 2 is required for D3D12 support. However, an application can set this property to true to enable Tier 1 support, if (and only if) the application uses 8 or fewer storage resources across all shader stages. As of writing, this property is useful for targeting Intel Haswell and Broadwell GPUs; other hardware either supports Tier 2 Resource Binding or does not support D3D12 in any capacity. Defaults to false.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER'@: Certain feature checks are only possible on Windows 11 by default. By setting this alongside @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING'@ and vendoring D3D12Core.dll from the D3D12 Agility SDK, you can make those feature checks possible on older platforms. The version you provide must match the one given in the DLL.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING'@: Certain feature checks are only possible on Windows 11 by default. By setting this alongside @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER'@ and vendoring D3D12Core.dll from the D3D12 Agility SDK, you can make those feature checks possible on older platforms. The path you provide must be relative to the executable path of your app. Be sure not to put the DLL in the same directory as the exe; Microsoft strongly advises against this!
--
--     With the Vulkan backend:
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN'@: By default, Vulkan device enumeration includes drivers of all types, including software renderers (for example, the Lavapipe Mesa driver). This can be useful if your application /requires/ SDL_GPU, but if you can provide your own fallback renderer (for example, an OpenGL renderer) this property can be set to true. Defaults to false.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER'@: a pointer to an 'SDL_GPUVulkanOptions' structure to be processed during device creation. This allows configuring a variety of Vulkan-specific options such as increasing the API version and opting into extensions aside from the minimal set SDL requires.
--
--     With the Metal backend: - @'sDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN'@: By default, macOS support requires what Apple calls \"MTLGPUFamilyMac2\" hardware or newer. However, an application can set this property to true to enable support for \"MTLGPUFamilyMac1\" hardware, if (and only if) the application does not write to sRGB textures. (For history\'s sake: MacFamily1 also does not support indirect command buffers, MSAA depth resolve, and stencil resolve\/feedback, but these are not exposed features in SDL_GPU.)
--
--     [Returns]: a GPU context on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getGPUShaderFormats', 'getGPUDeviceDriver', 'destroyGPUDevice', 'gpuSupportsProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPUDeviceWithProperties@.
--                   The safe flavor is 'createGPUDeviceWithPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPUDeviceWithProperties@, defined at @SDL3\/SDL_gpu.h 2360:45@
createGPUDeviceWithProperties
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_GPUDevice)
createGPUDeviceWithProperties =
  Unsafe.sDL_CreateGPUDeviceWithProperties

-- | Creates a GPU context.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN'@: enable debug mode properties and validations, defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN'@: enable to prefer energy efficiency over maximum GPU performance, defaults to false.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN'@: enable to automatically log useful debug information on device creation, defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_NAME_STRING'@: the name of the GPU driver to use, if a specific one is desired.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN'@: Enable Vulkan device feature shaderClipDistance. If disabled, clip distances are not supported in shader code: gl_ClipDistance[] built-ins of GLSL, SV_ClipDistance0\/1 semantics of HLSL and [[clip_distance]] attribute of Metal. Disabling optional features allows the application to run on some older Android devices. Defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN'@: Enable Vulkan device feature depthClamp. If disabled, there is no depth clamp support and enable_depth_clip in 'SDL_GPURasterizerState' must always be set to true. Disabling optional features allows the application to run on some older Android devices. Defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN'@: Enable Vulkan device feature drawIndirectFirstInstance. If disabled, the argument first_instance of 'SDL_GPUIndirectDrawCommand' must be set to zero. Disabling optional features allows the application to run on some older Android devices. Defaults to true.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN'@: Enable Vulkan device feature samplerAnisotropy. If disabled, enable_anisotropy of 'SDL_GPUSamplerCreateInfo' must be set to false. Disabling optional features allows the application to run on some older Android devices. Defaults to true.
--
--     These are the current shader format properties:
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN'@: The app is able to provide shaders for an NDA platform.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN'@: The app is able to provide SPIR-V shaders if applicable.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN'@: The app is able to provide DXBC shaders if applicable
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN'@: The app is able to provide DXIL shaders if applicable.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN'@: The app is able to provide MSL shaders if applicable.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN'@: The app is able to provide Metal shader libraries if applicable.
--
--     With the D3D12 backend:
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING'@: the prefix to use for all vertex semantics, default is \"TEXCOORD\".
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN'@: By default, Resourcing Binding Tier 2 is required for D3D12 support. However, an application can set this property to true to enable Tier 1 support, if (and only if) the application uses 8 or fewer storage resources across all shader stages. As of writing, this property is useful for targeting Intel Haswell and Broadwell GPUs; other hardware either supports Tier 2 Resource Binding or does not support D3D12 in any capacity. Defaults to false.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER'@: Certain feature checks are only possible on Windows 11 by default. By setting this alongside @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING'@ and vendoring D3D12Core.dll from the D3D12 Agility SDK, you can make those feature checks possible on older platforms. The version you provide must match the one given in the DLL.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_PATH_STRING'@: Certain feature checks are only possible on Windows 11 by default. By setting this alongside @'sDL_PROP_GPU_DEVICE_CREATE_D3D12_AGILITY_SDK_VERSION_NUMBER'@ and vendoring D3D12Core.dll from the D3D12 Agility SDK, you can make those feature checks possible on older platforms. The path you provide must be relative to the executable path of your app. Be sure not to put the DLL in the same directory as the exe; Microsoft strongly advises against this!
--
--     With the Vulkan backend:
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN'@: By default, Vulkan device enumeration includes drivers of all types, including software renderers (for example, the Lavapipe Mesa driver). This can be useful if your application /requires/ SDL_GPU, but if you can provide your own fallback renderer (for example, an OpenGL renderer) this property can be set to true. Defaults to false.
--
--     * @'sDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER'@: a pointer to an 'SDL_GPUVulkanOptions' structure to be processed during device creation. This allows configuring a variety of Vulkan-specific options such as increasing the API version and opting into extensions aside from the minimal set SDL requires.
--
--     With the Metal backend: - @'sDL_PROP_GPU_DEVICE_CREATE_METAL_ALLOW_MACFAMILY1_BOOLEAN'@: By default, macOS support requires what Apple calls \"MTLGPUFamilyMac2\" hardware or newer. However, an application can set this property to true to enable support for \"MTLGPUFamilyMac1\" hardware, if (and only if) the application does not write to sRGB textures. (For history\'s sake: MacFamily1 also does not support indirect command buffers, MSAA depth resolve, and stencil resolve\/feedback, but these are not exposed features in SDL_GPU.)
--
--     [Returns]: a GPU context on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getGPUShaderFormats', 'getGPUDeviceDriver', 'destroyGPUDevice', 'gpuSupportsProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPUDeviceWithProperties@.
--                   The unsafe flavor is 'createGPUDeviceWithProperties'
--                   .
--
--     [C declaration]: @SDL_CreateGPUDeviceWithProperties@, defined at @SDL3\/SDL_gpu.h 2360:45@
createGPUDeviceWithPropertiesSafe
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_GPUDevice)
createGPUDeviceWithPropertiesSafe =
  Safe.sDL_CreateGPUDeviceWithProperties

-- | Destroys a GPU context previously returned by 'createGPUDevice'.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyGPUDevice@.
--                   The safe flavor is 'destroyGPUDeviceSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyGPUDevice@, defined at @SDL3\/SDL_gpu.h 2422:34@
destroyGPUDevice
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context to destroy.
  -> IO ()
destroyGPUDevice = Unsafe.sDL_DestroyGPUDevice

-- | Destroys a GPU context previously returned by 'createGPUDevice'.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyGPUDevice@.
--                   The unsafe flavor is 'destroyGPUDevice'
--                   .
--
--     [C declaration]: @SDL_DestroyGPUDevice@, defined at @SDL3\/SDL_gpu.h 2422:34@
destroyGPUDeviceSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context to destroy.
  -> IO ()
destroyGPUDeviceSafe = Safe.sDL_DestroyGPUDevice

-- | Get the number of GPU drivers compiled into SDL.
--
--     [Returns]: the number of built in GPU drivers.
--
--     @since 3.2.0
--
--     [See also]: 'getGPUDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumGPUDrivers@.
--                   The safe flavor is 'getNumGPUDriversSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumGPUDrivers@, defined at @SDL3\/SDL_gpu.h 2433:33@
getNumGPUDrivers :: IO BG.Int32
getNumGPUDrivers =
  fmap Coerce.coerce Unsafe.sDL_GetNumGPUDrivers

-- | Get the number of GPU drivers compiled into SDL.
--
--     [Returns]: the number of built in GPU drivers.
--
--     @since 3.2.0
--
--     [See also]: 'getGPUDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumGPUDrivers@.
--                   The unsafe flavor is 'getNumGPUDrivers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumGPUDrivers@, defined at @SDL3\/SDL_gpu.h 2433:33@
getNumGPUDriversSafe :: IO BG.Int32
getNumGPUDriversSafe =
  fmap Coerce.coerce Safe.sDL_GetNumGPUDrivers

-- | Get the name of a built in GPU driver.
--
--     The GPU drivers are presented in the order in which they are normally checked during initialization.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"vulkan\", \"metal\" or \"direct3d12\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the GPU driver with the given __index__.
--
--     @since 3.2.0
--
--     [See also]: 'getNumGPUDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGPUDriver@.
--                   The safe flavor is 'getGPUDriverSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGPUDriver@, defined at @SDL3\/SDL_gpu.h 2452:42@
getGPUDriver
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of a GPU driver.
  -> IO (PtrConst.PtrConst BG.CChar)
getGPUDriver =
  \x00 -> Unsafe.sDL_GetGPUDriver (Coerce.coerce x00)

-- | Get the name of a built in GPU driver.
--
--     The GPU drivers are presented in the order in which they are normally checked during initialization.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"vulkan\", \"metal\" or \"direct3d12\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the GPU driver with the given __index__.
--
--     @since 3.2.0
--
--     [See also]: 'getNumGPUDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGPUDriver@.
--                   The unsafe flavor is 'getGPUDriver'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetGPUDriver@, defined at @SDL3\/SDL_gpu.h 2452:42@
getGPUDriverSafe
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of a GPU driver.
  -> IO (PtrConst.PtrConst BG.CChar)
getGPUDriverSafe =
  \x00 -> Safe.sDL_GetGPUDriver (Coerce.coerce x00)

-- | Returns the name of the backend used to create this GPU context.
--
--     [Returns]: the name of the device\'s driver, or NULL on error.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGPUDeviceDriver@.
--                   The safe flavor is 'getGPUDeviceDriverSafe'
--                   .
--
--     [C declaration]: @SDL_GetGPUDeviceDriver@, defined at @SDL3\/SDL_gpu.h 2462:42@
getGPUDeviceDriver
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getGPUDeviceDriver = Unsafe.sDL_GetGPUDeviceDriver

-- | Returns the name of the backend used to create this GPU context.
--
--     [Returns]: the name of the device\'s driver, or NULL on error.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGPUDeviceDriver@.
--                   The unsafe flavor is 'getGPUDeviceDriver'
--                   .
--
--     [C declaration]: @SDL_GetGPUDeviceDriver@, defined at @SDL3\/SDL_gpu.h 2462:42@
getGPUDeviceDriverSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getGPUDeviceDriverSafe = Safe.sDL_GetGPUDeviceDriver

-- | Returns the supported shader formats for this GPU context.
--
--     [Returns]: a bitflag indicating which shader formats the driver is able to consume.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGPUShaderFormats@.
--                   The safe flavor is 'getGPUShaderFormatsSafe'
--                   .
--
--     [C declaration]: @SDL_GetGPUShaderFormats@, defined at @SDL3\/SDL_gpu.h 2473:49@
getGPUShaderFormats
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context to query.
  -> IO SDL_GPUShaderFormat
getGPUShaderFormats = Unsafe.sDL_GetGPUShaderFormats

-- | Returns the supported shader formats for this GPU context.
--
--     [Returns]: a bitflag indicating which shader formats the driver is able to consume.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGPUShaderFormats@.
--                   The unsafe flavor is 'getGPUShaderFormats'
--                   .
--
--     [C declaration]: @SDL_GetGPUShaderFormats@, defined at @SDL3\/SDL_gpu.h 2473:49@
getGPUShaderFormatsSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context to query.
  -> IO SDL_GPUShaderFormat
getGPUShaderFormatsSafe =
  Safe.sDL_GetGPUShaderFormats

-- | Get the properties associated with a GPU device.
--
--     All properties are optional and may differ between GPU backends and SDL versions.
--
--     The following properties are provided by SDL:
--
--     @'sDL_PROP_GPU_DEVICE_NAME_STRING'@: Contains the name of the underlying device as reported by the system driver. This string has no standardized format, is highly inconsistent between hardware devices and drivers, and is able to change at any time. Do not attempt to parse this string as it is bound to fail at some point in the future when system drivers are updated, new hardware devices are introduced, or when SDL adds new GPU backends or modifies existing ones.
--
--     Strings that have been found in the wild include:
--
--     * GTX 970
--
--     * GeForce GTX 970
--
--     * NVIDIA GeForce GTX 970
--
--     * Microsoft Direct3D12 (NVIDIA GeForce GTX 970)
--
--     * NVIDIA Graphics Device
--
--     * GeForce GPU
--
--     * P106-100
--
--     * AMD 15D8:C9
--
--     * AMD Custom GPU 0405
--
--     * AMD Radeon (TM) Graphics
--
--     * ASUS Radeon RX 470 Series
--
--     * Intel(R) Arc(tm) A380 Graphics (DG2)
--
--     * Virtio-GPU Venus (NVIDIA TITAN V)
--
--     * SwiftShader Device (LLVM 16.0.0)
--
--     * llvmpipe (LLVM 15.0.4, 256 bits)
--
--     * Microsoft Basic Render Driver
--
--     * unknown device
--
--     The above list shows that the same device can have different formats, the vendor name may or may not appear in the string, the included vendor name may not be the vendor of the chipset on the device, some manufacturers include pseudo-legal marks while others don\'t, some devices may not use a marketing name in the string, the device string may be wrapped by the name of a translation interface, the device may be emulated in software, or the string may contain generic text that does not identify the device at all.
--
--     @'sDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING'@: Contains the self-reported name of the underlying system driver.
--
--     Strings that have been found in the wild include:
--
--     * Intel Corporation
--
--     * Intel open-source Mesa driver
--
--     * Qualcomm Technologies Inc. Adreno Vulkan Driver
--
--     * MoltenVK
--
--     * Mali-G715
--
--     * venus
--
--     @'sDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING'@: Contains the self-reported version of the underlying system driver. This is a relatively short version string in an unspecified format. If SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING is available then that property should be preferred over this one as it may contain additional information that is useful for identifying the exact driver version used.
--
--     Strings that have been found in the wild include:
--
--     * 53.0.0
--
--     * 0.405.2463
--
--     * 32.0.15.6614
--
--     @'sDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING'@: Contains the detailed version information of the underlying system driver as reported by the driver. This is an arbitrary string with no standardized format and it may contain newlines. This property should be preferred over SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING if it is available as it usually contains the same information but in a format that is easier to read.
--
--     Strings that have been found in the wild include:
--
--     * 101.6559
--
--     * 1.2.11
--
--     * Mesa 21.2.2 (LLVM 12.0.1)
--
--     * Mesa 22.2.0-devel (git-f226222 2022-04-14 impish-oibaf-ppa)
--
--     * v1.r53p0-00eac0.824c4f31403fb1fbf8ee1042422c2129
--
--     This string has also been observed to be a multiline string (which has a trailing newline):
--
--     @
--     Driver Build: 85da404, I46ff5fc46f, 1606794520
--     Date: 11\/30\/20
--     Compiler Version: EV031.31.04.01
--     Driver Branch: promo490_3_Google
--     @
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGPUDeviceProperties@.
--                   The safe flavor is 'getGPUDevicePropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetGPUDeviceProperties@, defined at @SDL3\/SDL_gpu.h 2577:46@
getGPUDeviceProperties
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getGPUDeviceProperties =
  Unsafe.sDL_GetGPUDeviceProperties

-- | Get the properties associated with a GPU device.
--
--     All properties are optional and may differ between GPU backends and SDL versions.
--
--     The following properties are provided by SDL:
--
--     @'sDL_PROP_GPU_DEVICE_NAME_STRING'@: Contains the name of the underlying device as reported by the system driver. This string has no standardized format, is highly inconsistent between hardware devices and drivers, and is able to change at any time. Do not attempt to parse this string as it is bound to fail at some point in the future when system drivers are updated, new hardware devices are introduced, or when SDL adds new GPU backends or modifies existing ones.
--
--     Strings that have been found in the wild include:
--
--     * GTX 970
--
--     * GeForce GTX 970
--
--     * NVIDIA GeForce GTX 970
--
--     * Microsoft Direct3D12 (NVIDIA GeForce GTX 970)
--
--     * NVIDIA Graphics Device
--
--     * GeForce GPU
--
--     * P106-100
--
--     * AMD 15D8:C9
--
--     * AMD Custom GPU 0405
--
--     * AMD Radeon (TM) Graphics
--
--     * ASUS Radeon RX 470 Series
--
--     * Intel(R) Arc(tm) A380 Graphics (DG2)
--
--     * Virtio-GPU Venus (NVIDIA TITAN V)
--
--     * SwiftShader Device (LLVM 16.0.0)
--
--     * llvmpipe (LLVM 15.0.4, 256 bits)
--
--     * Microsoft Basic Render Driver
--
--     * unknown device
--
--     The above list shows that the same device can have different formats, the vendor name may or may not appear in the string, the included vendor name may not be the vendor of the chipset on the device, some manufacturers include pseudo-legal marks while others don\'t, some devices may not use a marketing name in the string, the device string may be wrapped by the name of a translation interface, the device may be emulated in software, or the string may contain generic text that does not identify the device at all.
--
--     @'sDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING'@: Contains the self-reported name of the underlying system driver.
--
--     Strings that have been found in the wild include:
--
--     * Intel Corporation
--
--     * Intel open-source Mesa driver
--
--     * Qualcomm Technologies Inc. Adreno Vulkan Driver
--
--     * MoltenVK
--
--     * Mali-G715
--
--     * venus
--
--     @'sDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING'@: Contains the self-reported version of the underlying system driver. This is a relatively short version string in an unspecified format. If SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING is available then that property should be preferred over this one as it may contain additional information that is useful for identifying the exact driver version used.
--
--     Strings that have been found in the wild include:
--
--     * 53.0.0
--
--     * 0.405.2463
--
--     * 32.0.15.6614
--
--     @'sDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING'@: Contains the detailed version information of the underlying system driver as reported by the driver. This is an arbitrary string with no standardized format and it may contain newlines. This property should be preferred over SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING if it is available as it usually contains the same information but in a format that is easier to read.
--
--     Strings that have been found in the wild include:
--
--     * 101.6559
--
--     * 1.2.11
--
--     * Mesa 21.2.2 (LLVM 12.0.1)
--
--     * Mesa 22.2.0-devel (git-f226222 2022-04-14 impish-oibaf-ppa)
--
--     * v1.r53p0-00eac0.824c4f31403fb1fbf8ee1042422c2129
--
--     This string has also been observed to be a multiline string (which has a trailing newline):
--
--     @
--     Driver Build: 85da404, I46ff5fc46f, 1606794520
--     Date: 11\/30\/20
--     Compiler Version: EV031.31.04.01
--     Driver Branch: promo490_3_Google
--     @
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGPUDeviceProperties@.
--                   The unsafe flavor is 'getGPUDeviceProperties'
--                   .
--
--     [C declaration]: @SDL_GetGPUDeviceProperties@, defined at @SDL3\/SDL_gpu.h 2577:46@
getGPUDevicePropertiesSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getGPUDevicePropertiesSafe =
  Safe.sDL_GetGPUDeviceProperties

-- | Creates a pipeline object to be used in a compute workflow.
--
--     Shader resource bindings must be authored to follow a particular order depending on the shader format.
--
--     For SPIR-V shaders, use the following resource sets:
--
--     * 0: Sampled textures, followed by read-only storage textures, followed by read-only storage buffers
--
--     * 1: Read-write storage textures, followed by read-write storage buffers
--
--     * 2: Uniform buffers
--
--     For DXBC and DXIL shaders, use the following register order:
--
--     * (t[n], space0): Sampled textures, followed by read-only storage textures, followed by read-only storage buffers
--
--     * (u[n], space1): Read-write storage textures, followed by read-write storage buffers
--
--     * (b[n], space2): Uniform buffers
--
--     For MSL\/metallib, use the following order:
--
--     * [[buffer]]: Uniform buffers, followed by read-only storage buffers, followed by read-write storage buffers
--
--     * [[texture]]: Sampled textures, followed by read-only storage textures, followed by read-write storage textures
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a compute pipeline object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'bindGPUComputePipeline', 'releaseGPUComputePipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPUComputePipeline@.
--                   The safe flavor is 'createGPUComputePipelineSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 2632:54@
createGPUComputePipeline
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUComputePipelineCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the compute pipeline to create.
  -> IO (BG.Ptr SDL_GPUComputePipeline)
createGPUComputePipeline =
  Unsafe.sDL_CreateGPUComputePipeline

-- | Creates a pipeline object to be used in a compute workflow.
--
--     Shader resource bindings must be authored to follow a particular order depending on the shader format.
--
--     For SPIR-V shaders, use the following resource sets:
--
--     * 0: Sampled textures, followed by read-only storage textures, followed by read-only storage buffers
--
--     * 1: Read-write storage textures, followed by read-write storage buffers
--
--     * 2: Uniform buffers
--
--     For DXBC and DXIL shaders, use the following register order:
--
--     * (t[n], space0): Sampled textures, followed by read-only storage textures, followed by read-only storage buffers
--
--     * (u[n], space1): Read-write storage textures, followed by read-write storage buffers
--
--     * (b[n], space2): Uniform buffers
--
--     For MSL\/metallib, use the following order:
--
--     * [[buffer]]: Uniform buffers, followed by read-only storage buffers, followed by read-write storage buffers
--
--     * [[texture]]: Sampled textures, followed by read-only storage textures, followed by read-write storage textures
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a compute pipeline object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'bindGPUComputePipeline', 'releaseGPUComputePipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPUComputePipeline@.
--                   The unsafe flavor is 'createGPUComputePipeline'
--                   .
--
--     [C declaration]: @SDL_CreateGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 2632:54@
createGPUComputePipelineSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUComputePipelineCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the compute pipeline to create.
  -> IO (BG.Ptr SDL_GPUComputePipeline)
createGPUComputePipelineSafe =
  Safe.sDL_CreateGPUComputePipeline

-- | Creates a pipeline object to be used in a graphics workflow.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a graphics pipeline object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader', 'bindGPUGraphicsPipeline', 'releaseGPUGraphicsPipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPUGraphicsPipeline@.
--                   The safe flavor is 'createGPUGraphicsPipelineSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 2659:55@
createGPUGraphicsPipeline
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUGraphicsPipelineCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the graphics pipeline to create.
  -> IO (BG.Ptr SDL_GPUGraphicsPipeline)
createGPUGraphicsPipeline =
  Unsafe.sDL_CreateGPUGraphicsPipeline

-- | Creates a pipeline object to be used in a graphics workflow.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a graphics pipeline object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader', 'bindGPUGraphicsPipeline', 'releaseGPUGraphicsPipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPUGraphicsPipeline@.
--                   The unsafe flavor is 'createGPUGraphicsPipeline'
--                   .
--
--     [C declaration]: @SDL_CreateGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 2659:55@
createGPUGraphicsPipelineSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUGraphicsPipelineCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the graphics pipeline to create.
  -> IO (BG.Ptr SDL_GPUGraphicsPipeline)
createGPUGraphicsPipelineSafe =
  Safe.sDL_CreateGPUGraphicsPipeline

-- | Creates a sampler object to be used when binding textures in a graphics workflow.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a sampler object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'bindGPUVertexSamplers', 'bindGPUFragmentSamplers', 'releaseGPUSampler'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPUSampler@.
--                   The safe flavor is 'createGPUSamplerSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPUSampler@, defined at @SDL3\/SDL_gpu.h 2686:46@
createGPUSampler
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUSamplerCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the sampler to create.
  -> IO (BG.Ptr SDL_GPUSampler)
createGPUSampler = Unsafe.sDL_CreateGPUSampler

-- | Creates a sampler object to be used when binding textures in a graphics workflow.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a sampler object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'bindGPUVertexSamplers', 'bindGPUFragmentSamplers', 'releaseGPUSampler'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPUSampler@.
--                   The unsafe flavor is 'createGPUSampler'
--                   .
--
--     [C declaration]: @SDL_CreateGPUSampler@, defined at @SDL3\/SDL_gpu.h 2686:46@
createGPUSamplerSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUSamplerCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the sampler to create.
  -> IO (BG.Ptr SDL_GPUSampler)
createGPUSamplerSafe = Safe.sDL_CreateGPUSampler

-- | Creates a shader to be used when creating a graphics pipeline.
--
--     Shader resource bindings must be authored to follow a particular order depending on the shader format.
--
--     For SPIR-V shaders, use the following resource sets:
--
--     For vertex shaders:
--
--     * 0: Sampled textures, followed by storage textures, followed by storage buffers
--
--     * 1: Uniform buffers
--
--     For fragment shaders:
--
--     * 2: Sampled textures, followed by storage textures, followed by storage buffers
--
--     * 3: Uniform buffers
--
--     For DXBC and DXIL shaders, use the following register order:
--
--     For vertex shaders:
--
--     * (t[n], space0): Sampled textures, followed by storage textures, followed by storage buffers
--
--     * (s[n], space0): Samplers with indices corresponding to the sampled textures
--
--     * (b[n], space1): Uniform buffers
--
--     For pixel shaders:
--
--     * (t[n], space2): Sampled textures, followed by storage textures, followed by storage buffers
--
--     * (s[n], space2): Samplers with indices corresponding to the sampled textures
--
--     * (b[n], space3): Uniform buffers
--
--     For MSL\/metallib, use the following order:
--
--     * [[texture]]: Sampled textures, followed by storage textures
--
--     * [[sampler]]: Samplers with indices corresponding to the sampled textures
--
--     * [[buffer]]: Uniform buffers, followed by storage buffers. Vertex buffer 0 is bound at [[buffer(14)]], vertex buffer 1 at [[buffer(15)]], and so on. Rather than manually authoring vertex buffer indices, use the [[stage_in]] attribute which will automatically use the vertex input information from the 'SDL_GPUGraphicsPipeline'.
--
--     Shader semantics other than system-value semantics do not matter in D3D12 and for ease of use the SDL implementation assumes that non system-value semantics will all be TEXCOORD. If you are using HLSL as the shader source language, your vertex semantics should start at TEXCOORD0 and increment like so: TEXCOORD1, TEXCOORD2, etc. If you wish to change the semantic prefix to something other than TEXCOORD you can use SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING with @'createGPUDeviceWithProperties'@.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_SHADER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a shader object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUGraphicsPipeline', 'releaseGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPUShader@.
--                   The safe flavor is 'createGPUShaderSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPUShader@, defined at @SDL3\/SDL_gpu.h 2765:45@
createGPUShader
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUShaderCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the shader to create.
  -> IO (BG.Ptr SDL_GPUShader)
createGPUShader = Unsafe.sDL_CreateGPUShader

-- | Creates a shader to be used when creating a graphics pipeline.
--
--     Shader resource bindings must be authored to follow a particular order depending on the shader format.
--
--     For SPIR-V shaders, use the following resource sets:
--
--     For vertex shaders:
--
--     * 0: Sampled textures, followed by storage textures, followed by storage buffers
--
--     * 1: Uniform buffers
--
--     For fragment shaders:
--
--     * 2: Sampled textures, followed by storage textures, followed by storage buffers
--
--     * 3: Uniform buffers
--
--     For DXBC and DXIL shaders, use the following register order:
--
--     For vertex shaders:
--
--     * (t[n], space0): Sampled textures, followed by storage textures, followed by storage buffers
--
--     * (s[n], space0): Samplers with indices corresponding to the sampled textures
--
--     * (b[n], space1): Uniform buffers
--
--     For pixel shaders:
--
--     * (t[n], space2): Sampled textures, followed by storage textures, followed by storage buffers
--
--     * (s[n], space2): Samplers with indices corresponding to the sampled textures
--
--     * (b[n], space3): Uniform buffers
--
--     For MSL\/metallib, use the following order:
--
--     * [[texture]]: Sampled textures, followed by storage textures
--
--     * [[sampler]]: Samplers with indices corresponding to the sampled textures
--
--     * [[buffer]]: Uniform buffers, followed by storage buffers. Vertex buffer 0 is bound at [[buffer(14)]], vertex buffer 1 at [[buffer(15)]], and so on. Rather than manually authoring vertex buffer indices, use the [[stage_in]] attribute which will automatically use the vertex input information from the 'SDL_GPUGraphicsPipeline'.
--
--     Shader semantics other than system-value semantics do not matter in D3D12 and for ease of use the SDL implementation assumes that non system-value semantics will all be TEXCOORD. If you are using HLSL as the shader source language, your vertex semantics should start at TEXCOORD0 and increment like so: TEXCOORD1, TEXCOORD2, etc. If you wish to change the semantic prefix to something other than TEXCOORD you can use SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING with @'createGPUDeviceWithProperties'@.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_SHADER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a shader object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUGraphicsPipeline', 'releaseGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPUShader@.
--                   The unsafe flavor is 'createGPUShader'
--                   .
--
--     [C declaration]: @SDL_CreateGPUShader@, defined at @SDL3\/SDL_gpu.h 2765:45@
createGPUShaderSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUShaderCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the shader to create.
  -> IO (BG.Ptr SDL_GPUShader)
createGPUShaderSafe = Safe.sDL_CreateGPUShader

-- | Creates a texture object to be used in graphics or compute workflows.
--
--     The contents of this texture are undefined until data is written to the texture, either via 'uploadToGPUTexture' or by performing a render or compute pass with this texture as a target.
--
--     Note that certain combinations of usage flags are invalid. For example, a texture cannot have both the SAMPLER and GRAPHICS_STORAGE_READ flags.
--
--     If you request a sample count higher than the hardware supports, the implementation will automatically fall back to the highest available sample count.
--
--     There are optional properties that can be provided through 'SDL_GPUTextureCreateInfo' \'s @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture to a color with this red intensity. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture to a color with this green intensity. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture to a color with this blue intensity. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture to a color with this alpha intensity. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET, clear the texture to a depth of this value. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET, clear the texture to a stencil of this Uint8 value. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a texture object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'uploadToGPUTexture', 'downloadFromGPUTexture', 'beginGPURenderPass', 'beginGPUComputePass', 'bindGPUVertexSamplers', 'bindGPUVertexStorageTextures', 'bindGPUFragmentSamplers', 'bindGPUFragmentStorageTextures', 'bindGPUComputeStorageTextures', 'blitGPUTexture', 'releaseGPUTexture', 'gpuTextureSupportsFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPUTexture@.
--                   The safe flavor is 'createGPUTextureSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPUTexture@, defined at @SDL3\/SDL_gpu.h 2829:46@
createGPUTexture
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUTextureCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the texture to create.
  -> IO (BG.Ptr SDL_GPUTexture)
createGPUTexture = Unsafe.sDL_CreateGPUTexture

-- | Creates a texture object to be used in graphics or compute workflows.
--
--     The contents of this texture are undefined until data is written to the texture, either via 'uploadToGPUTexture' or by performing a render or compute pass with this texture as a target.
--
--     Note that certain combinations of usage flags are invalid. For example, a texture cannot have both the SAMPLER and GRAPHICS_STORAGE_READ flags.
--
--     If you request a sample count higher than the hardware supports, the implementation will automatically fall back to the highest available sample count.
--
--     There are optional properties that can be provided through 'SDL_GPUTextureCreateInfo' \'s @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture to a color with this red intensity. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture to a color with this green intensity. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture to a color with this blue intensity. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture to a color with this alpha intensity. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET, clear the texture to a depth of this value. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER'@: (Direct3D 12 only) if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET, clear the texture to a stencil of this Uint8 value. Defaults to zero.
--
--     * @'sDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a texture object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'uploadToGPUTexture', 'downloadFromGPUTexture', 'beginGPURenderPass', 'beginGPUComputePass', 'bindGPUVertexSamplers', 'bindGPUVertexStorageTextures', 'bindGPUFragmentSamplers', 'bindGPUFragmentStorageTextures', 'bindGPUComputeStorageTextures', 'blitGPUTexture', 'releaseGPUTexture', 'gpuTextureSupportsFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPUTexture@.
--                   The unsafe flavor is 'createGPUTexture'
--                   .
--
--     [C declaration]: @SDL_CreateGPUTexture@, defined at @SDL3\/SDL_gpu.h 2829:46@
createGPUTextureSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUTextureCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the texture to create.
  -> IO (BG.Ptr SDL_GPUTexture)
createGPUTextureSafe = Safe.sDL_CreateGPUTexture

-- | Creates a buffer object to be used in graphics or compute workflows.
--
--     The contents of this buffer are undefined until data is written to the buffer.
--
--     Note that certain combinations of usage flags are invalid. For example, a buffer cannot have both the VERTEX and INDEX flags.
--
--     If you use a STORAGE flag, the data in the buffer must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     For better understanding of underlying concepts and memory management with SDL GPU API, you may refer [this blog post](https://moonside.games/posts/sdl-gpu-concepts-cycling/) There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_BUFFER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a buffer object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'uploadToGPUBuffer', 'downloadFromGPUBuffer', 'copyGPUBufferToBuffer', 'bindGPUVertexBuffers', 'bindGPUIndexBuffer', 'bindGPUVertexStorageBuffers', 'bindGPUFragmentStorageBuffers', 'drawGPUPrimitivesIndirect', 'drawGPUIndexedPrimitivesIndirect', 'bindGPUComputeStorageBuffers', 'dispatchGPUComputeIndirect', 'releaseGPUBuffer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPUBuffer@.
--                   The safe flavor is 'createGPUBufferSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPUBuffer@, defined at @SDL3\/SDL_gpu.h 2885:45@
createGPUBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUBufferCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the buffer to create.
  -> IO (BG.Ptr SDL_GPUBuffer)
createGPUBuffer = Unsafe.sDL_CreateGPUBuffer

-- | Creates a buffer object to be used in graphics or compute workflows.
--
--     The contents of this buffer are undefined until data is written to the buffer.
--
--     Note that certain combinations of usage flags are invalid. For example, a buffer cannot have both the VERTEX and INDEX flags.
--
--     If you use a STORAGE flag, the data in the buffer must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     For better understanding of underlying concepts and memory management with SDL GPU API, you may refer [this blog post](https://moonside.games/posts/sdl-gpu-concepts-cycling/) There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_BUFFER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a buffer object on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'uploadToGPUBuffer', 'downloadFromGPUBuffer', 'copyGPUBufferToBuffer', 'bindGPUVertexBuffers', 'bindGPUIndexBuffer', 'bindGPUVertexStorageBuffers', 'bindGPUFragmentStorageBuffers', 'drawGPUPrimitivesIndirect', 'drawGPUIndexedPrimitivesIndirect', 'bindGPUComputeStorageBuffers', 'dispatchGPUComputeIndirect', 'releaseGPUBuffer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPUBuffer@.
--                   The unsafe flavor is 'createGPUBuffer'
--                   .
--
--     [C declaration]: @SDL_CreateGPUBuffer@, defined at @SDL3\/SDL_gpu.h 2885:45@
createGPUBufferSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUBufferCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the buffer to create.
  -> IO (BG.Ptr SDL_GPUBuffer)
createGPUBufferSafe = Safe.sDL_CreateGPUBuffer

-- | Creates a transfer buffer to be used when uploading to or downloading from graphics resources.
--
--     Download buffers can be particularly expensive to create, so it is good practice to reuse them if data will be downloaded regularly.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a transfer buffer on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'uploadToGPUBuffer', 'downloadFromGPUBuffer', 'uploadToGPUTexture', 'downloadFromGPUTexture', 'releaseGPUTransferBuffer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPUTransferBuffer@.
--                   The safe flavor is 'createGPUTransferBufferSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 2918:53@
createGPUTransferBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUTransferBufferCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the transfer buffer to create.
  -> IO (BG.Ptr SDL_GPUTransferBuffer)
createGPUTransferBuffer =
  Unsafe.sDL_CreateGPUTransferBuffer

-- | Creates a transfer buffer to be used when uploading to or downloading from graphics resources.
--
--     Download buffers can be particularly expensive to create, so it is good practice to reuse them if data will be downloaded regularly.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a transfer buffer on success, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'uploadToGPUBuffer', 'downloadFromGPUBuffer', 'uploadToGPUTexture', 'downloadFromGPUTexture', 'releaseGPUTransferBuffer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPUTransferBuffer@.
--                   The unsafe flavor is 'createGPUTransferBuffer'
--                   .
--
--     [C declaration]: @SDL_CreateGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 2918:53@
createGPUTransferBufferSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUTransferBufferCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the transfer buffer to create.
  -> IO (BG.Ptr SDL_GPUTransferBuffer)
createGPUTransferBufferSafe =
  Safe.sDL_CreateGPUTransferBuffer

-- | Sets an arbitrary string constant to label a buffer.
--
--     You should use SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING with 'createGPUBuffer' instead of this function to avoid thread safety issues.
--
--     [Thread safety]: This function is not thread safe, you must make sure the buffer is not simultaneously used by any other thread.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUBuffer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPUBufferName@.
--                   The safe flavor is 'setGPUBufferNameSafe'
--                   .
--
--     [C declaration]: @SDL_SetGPUBufferName@, defined at @SDL3\/SDL_gpu.h 2943:34@
setGPUBufferName
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer to attach the name to.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: a UTF-8 string constant to mark as the name of the buffer.
  -> IO ()
setGPUBufferName = Unsafe.sDL_SetGPUBufferName

-- | Sets an arbitrary string constant to label a buffer.
--
--     You should use SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING with 'createGPUBuffer' instead of this function to avoid thread safety issues.
--
--     [Thread safety]: This function is not thread safe, you must make sure the buffer is not simultaneously used by any other thread.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUBuffer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPUBufferName@.
--                   The unsafe flavor is 'setGPUBufferName'
--                   .
--
--     [C declaration]: @SDL_SetGPUBufferName@, defined at @SDL3\/SDL_gpu.h 2943:34@
setGPUBufferNameSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer to attach the name to.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: a UTF-8 string constant to mark as the name of the buffer.
  -> IO ()
setGPUBufferNameSafe = Safe.sDL_SetGPUBufferName

-- | Sets an arbitrary string constant to label a texture.
--
--     You should use SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING with 'createGPUTexture' instead of this function to avoid thread safety issues.
--
--     [Thread safety]: This function is not thread safe, you must make sure the texture is not simultaneously used by any other thread.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPUTextureName@.
--                   The safe flavor is 'setGPUTextureNameSafe'
--                   .
--
--     [C declaration]: @SDL_SetGPUTextureName@, defined at @SDL3\/SDL_gpu.h 2966:34@
setGPUTextureName
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> BG.Ptr SDL_GPUTexture
  -- ^
  --
  --           [@texture@]: a texture to attach the name to.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: a UTF-8 string constant to mark as the name of the texture.
  -> IO ()
setGPUTextureName = Unsafe.sDL_SetGPUTextureName

-- | Sets an arbitrary string constant to label a texture.
--
--     You should use SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING with 'createGPUTexture' instead of this function to avoid thread safety issues.
--
--     [Thread safety]: This function is not thread safe, you must make sure the texture is not simultaneously used by any other thread.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPUTextureName@.
--                   The unsafe flavor is 'setGPUTextureName'
--                   .
--
--     [C declaration]: @SDL_SetGPUTextureName@, defined at @SDL3\/SDL_gpu.h 2966:34@
setGPUTextureNameSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> BG.Ptr SDL_GPUTexture
  -- ^
  --
  --           [@texture@]: a texture to attach the name to.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: a UTF-8 string constant to mark as the name of the texture.
  -> IO ()
setGPUTextureNameSafe = Safe.sDL_SetGPUTextureName

-- | Inserts an arbitrary string label into the command buffer callstream.
--
--     Useful for debugging.
--
--     On Direct3D 12, using 'insertGPUDebugLabel' requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_InsertGPUDebugLabel@.
--                   The safe flavor is 'insertGPUDebugLabelSafe'
--                   .
--
--     [C declaration]: @SDL_InsertGPUDebugLabel@, defined at @SDL3\/SDL_gpu.h 2987:34@
insertGPUDebugLabel
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: a UTF-8 string constant to insert as the label.
  -> IO ()
insertGPUDebugLabel = Unsafe.sDL_InsertGPUDebugLabel

-- | Inserts an arbitrary string label into the command buffer callstream.
--
--     Useful for debugging.
--
--     On Direct3D 12, using 'insertGPUDebugLabel' requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_InsertGPUDebugLabel@.
--                   The unsafe flavor is 'insertGPUDebugLabel'
--                   .
--
--     [C declaration]: @SDL_InsertGPUDebugLabel@, defined at @SDL3\/SDL_gpu.h 2987:34@
insertGPUDebugLabelSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: a UTF-8 string constant to insert as the label.
  -> IO ()
insertGPUDebugLabelSafe =
  Safe.sDL_InsertGPUDebugLabel

-- | Begins a debug group with an arbitrary name.
--
--     Used for denoting groups of calls when viewing the command buffer callstream in a graphics debugging tool.
--
--     Each call to 'pushGPUDebugGroup' must have a corresponding call to 'popGPUDebugGroup'.
--
--     On Direct3D 12, using 'pushGPUDebugGroup' requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     On some backends (e.g. Metal), pushing a debug group during a render\/blit\/compute pass will create a group that is scoped to the native pass rather than the command buffer. For best results, if you push a debug group during a pass, always pop it in the same pass.
--
--     @since 3.2.0
--
--     [See also]: 'popGPUDebugGroup'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PushGPUDebugGroup@.
--                   The safe flavor is 'pushGPUDebugGroupSafe'
--                   .
--
--     [C declaration]: @SDL_PushGPUDebugGroup@, defined at @SDL3\/SDL_gpu.h 3017:34@
pushGPUDebugGroup
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: a UTF-8 string constant that names the group.
  -> IO ()
pushGPUDebugGroup = Unsafe.sDL_PushGPUDebugGroup

-- | Begins a debug group with an arbitrary name.
--
--     Used for denoting groups of calls when viewing the command buffer callstream in a graphics debugging tool.
--
--     Each call to 'pushGPUDebugGroup' must have a corresponding call to 'popGPUDebugGroup'.
--
--     On Direct3D 12, using 'pushGPUDebugGroup' requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     On some backends (e.g. Metal), pushing a debug group during a render\/blit\/compute pass will create a group that is scoped to the native pass rather than the command buffer. For best results, if you push a debug group during a pass, always pop it in the same pass.
--
--     @since 3.2.0
--
--     [See also]: 'popGPUDebugGroup'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PushGPUDebugGroup@.
--                   The unsafe flavor is 'pushGPUDebugGroup'
--                   .
--
--     [C declaration]: @SDL_PushGPUDebugGroup@, defined at @SDL3\/SDL_gpu.h 3017:34@
pushGPUDebugGroupSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: a UTF-8 string constant that names the group.
  -> IO ()
pushGPUDebugGroupSafe = Safe.sDL_PushGPUDebugGroup

-- | Ends the most-recently pushed debug group.
--
--     On Direct3D 12, using 'popGPUDebugGroup' requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     @since 3.2.0
--
--     [See also]: 'pushGPUDebugGroup'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PopGPUDebugGroup@.
--                   The safe flavor is 'popGPUDebugGroupSafe'
--                   .
--
--     [C declaration]: @SDL_PopGPUDebugGroup@, defined at @SDL3\/SDL_gpu.h 3035:34@
popGPUDebugGroup
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO ()
popGPUDebugGroup = Unsafe.sDL_PopGPUDebugGroup

-- | Ends the most-recently pushed debug group.
--
--     On Direct3D 12, using 'popGPUDebugGroup' requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     @since 3.2.0
--
--     [See also]: 'pushGPUDebugGroup'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PopGPUDebugGroup@.
--                   The unsafe flavor is 'popGPUDebugGroup'
--                   .
--
--     [C declaration]: @SDL_PopGPUDebugGroup@, defined at @SDL3\/SDL_gpu.h 3035:34@
popGPUDebugGroupSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO ()
popGPUDebugGroupSafe = Safe.sDL_PopGPUDebugGroup

-- | Frees the given texture as soon as it is safe to do so.
--
--     You must not reference the texture after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseGPUTexture@.
--                   The safe flavor is 'releaseGPUTextureSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUTexture@, defined at @SDL3\/SDL_gpu.h 3050:34@
releaseGPUTexture
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTexture
  -- ^
  --
  --           [@texture@]: a texture to be destroyed.
  -> IO ()
releaseGPUTexture = Unsafe.sDL_ReleaseGPUTexture

-- | Frees the given texture as soon as it is safe to do so.
--
--     You must not reference the texture after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseGPUTexture@.
--                   The unsafe flavor is 'releaseGPUTexture'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUTexture@, defined at @SDL3\/SDL_gpu.h 3050:34@
releaseGPUTextureSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTexture
  -- ^
  --
  --           [@texture@]: a texture to be destroyed.
  -> IO ()
releaseGPUTextureSafe = Safe.sDL_ReleaseGPUTexture

-- | Frees the given sampler as soon as it is safe to do so.
--
--     You must not reference the sampler after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseGPUSampler@.
--                   The safe flavor is 'releaseGPUSamplerSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUSampler@, defined at @SDL3\/SDL_gpu.h 3064:34@
releaseGPUSampler
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUSampler
  -- ^
  --
  --           [@sampler@]: a sampler to be destroyed.
  -> IO ()
releaseGPUSampler = Unsafe.sDL_ReleaseGPUSampler

-- | Frees the given sampler as soon as it is safe to do so.
--
--     You must not reference the sampler after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseGPUSampler@.
--                   The unsafe flavor is 'releaseGPUSampler'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUSampler@, defined at @SDL3\/SDL_gpu.h 3064:34@
releaseGPUSamplerSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUSampler
  -- ^
  --
  --           [@sampler@]: a sampler to be destroyed.
  -> IO ()
releaseGPUSamplerSafe = Safe.sDL_ReleaseGPUSampler

-- | Frees the given buffer as soon as it is safe to do so.
--
--     You must not reference the buffer after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseGPUBuffer@.
--                   The safe flavor is 'releaseGPUBufferSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUBuffer@, defined at @SDL3\/SDL_gpu.h 3078:34@
releaseGPUBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer to be destroyed.
  -> IO ()
releaseGPUBuffer = Unsafe.sDL_ReleaseGPUBuffer

-- | Frees the given buffer as soon as it is safe to do so.
--
--     You must not reference the buffer after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseGPUBuffer@.
--                   The unsafe flavor is 'releaseGPUBuffer'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUBuffer@, defined at @SDL3\/SDL_gpu.h 3078:34@
releaseGPUBufferSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer to be destroyed.
  -> IO ()
releaseGPUBufferSafe = Safe.sDL_ReleaseGPUBuffer

-- | Frees the given transfer buffer as soon as it is safe to do so.
--
--     You must not reference the transfer buffer after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseGPUTransferBuffer@.
--                   The safe flavor is 'releaseGPUTransferBufferSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3092:34@
releaseGPUTransferBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTransferBuffer
  -- ^
  --
  --           [@transfer_buffer@]: a transfer buffer to be destroyed.
  -> IO ()
releaseGPUTransferBuffer =
  Unsafe.sDL_ReleaseGPUTransferBuffer

-- | Frees the given transfer buffer as soon as it is safe to do so.
--
--     You must not reference the transfer buffer after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseGPUTransferBuffer@.
--                   The unsafe flavor is 'releaseGPUTransferBuffer'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3092:34@
releaseGPUTransferBufferSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTransferBuffer
  -- ^
  --
  --           [@transfer_buffer@]: a transfer buffer to be destroyed.
  -> IO ()
releaseGPUTransferBufferSafe =
  Safe.sDL_ReleaseGPUTransferBuffer

-- | Frees the given compute pipeline as soon as it is safe to do so.
--
--     You must not reference the compute pipeline after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseGPUComputePipeline@.
--                   The safe flavor is 'releaseGPUComputePipelineSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 3106:34@
releaseGPUComputePipeline
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUComputePipeline
  -- ^
  --
  --           [@compute_pipeline@]: a compute pipeline to be destroyed.
  -> IO ()
releaseGPUComputePipeline =
  Unsafe.sDL_ReleaseGPUComputePipeline

-- | Frees the given compute pipeline as soon as it is safe to do so.
--
--     You must not reference the compute pipeline after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseGPUComputePipeline@.
--                   The unsafe flavor is 'releaseGPUComputePipeline'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 3106:34@
releaseGPUComputePipelineSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUComputePipeline
  -- ^
  --
  --           [@compute_pipeline@]: a compute pipeline to be destroyed.
  -> IO ()
releaseGPUComputePipelineSafe =
  Safe.sDL_ReleaseGPUComputePipeline

-- | Frees the given shader as soon as it is safe to do so.
--
--     You must not reference the shader after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseGPUShader@.
--                   The safe flavor is 'releaseGPUShaderSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUShader@, defined at @SDL3\/SDL_gpu.h 3120:34@
releaseGPUShader
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUShader
  -- ^
  --
  --           [@shader@]: a shader to be destroyed.
  -> IO ()
releaseGPUShader = Unsafe.sDL_ReleaseGPUShader

-- | Frees the given shader as soon as it is safe to do so.
--
--     You must not reference the shader after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseGPUShader@.
--                   The unsafe flavor is 'releaseGPUShader'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUShader@, defined at @SDL3\/SDL_gpu.h 3120:34@
releaseGPUShaderSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUShader
  -- ^
  --
  --           [@shader@]: a shader to be destroyed.
  -> IO ()
releaseGPUShaderSafe = Safe.sDL_ReleaseGPUShader

-- | Frees the given graphics pipeline as soon as it is safe to do so.
--
--     You must not reference the graphics pipeline after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseGPUGraphicsPipeline@.
--                   The safe flavor is 'releaseGPUGraphicsPipelineSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 3134:34@
releaseGPUGraphicsPipeline
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUGraphicsPipeline
  -- ^
  --
  --           [@graphics_pipeline@]: a graphics pipeline to be destroyed.
  -> IO ()
releaseGPUGraphicsPipeline =
  Unsafe.sDL_ReleaseGPUGraphicsPipeline

-- | Frees the given graphics pipeline as soon as it is safe to do so.
--
--     You must not reference the graphics pipeline after calling this function.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseGPUGraphicsPipeline@.
--                   The unsafe flavor is 'releaseGPUGraphicsPipeline'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 3134:34@
releaseGPUGraphicsPipelineSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUGraphicsPipeline
  -- ^
  --
  --           [@graphics_pipeline@]: a graphics pipeline to be destroyed.
  -> IO ()
releaseGPUGraphicsPipelineSafe =
  Safe.sDL_ReleaseGPUGraphicsPipeline

-- | Acquire a command buffer.
--
--     This command buffer is managed by the implementation and should not be freed by the user. The command buffer may only be used on the thread it was acquired on. The command buffer should be submitted on the thread it was acquired on.
--
--     It is valid to acquire multiple command buffers on the same thread at once. In fact a common design pattern is to acquire two command buffers per frame where one is dedicated to render and compute passes and the other is dedicated to copy passes and other preparatory work such as generating mipmaps. Interleaving commands between the two command buffers reduces the total amount of passes overall which improves rendering performance.
--
--     [Returns]: a command buffer, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBuffer', 'submitGPUCommandBufferAndAcquireFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AcquireGPUCommandBuffer@.
--                   The safe flavor is 'acquireGPUCommandBufferSafe'
--                   .
--
--     [C declaration]: @SDL_AcquireGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 3162:52@
acquireGPUCommandBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> IO (BG.Ptr SDL_GPUCommandBuffer)
acquireGPUCommandBuffer =
  Unsafe.sDL_AcquireGPUCommandBuffer

-- | Acquire a command buffer.
--
--     This command buffer is managed by the implementation and should not be freed by the user. The command buffer may only be used on the thread it was acquired on. The command buffer should be submitted on the thread it was acquired on.
--
--     It is valid to acquire multiple command buffers on the same thread at once. In fact a common design pattern is to acquire two command buffers per frame where one is dedicated to render and compute passes and the other is dedicated to copy passes and other preparatory work such as generating mipmaps. Interleaving commands between the two command buffers reduces the total amount of passes overall which improves rendering performance.
--
--     [Returns]: a command buffer, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBuffer', 'submitGPUCommandBufferAndAcquireFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AcquireGPUCommandBuffer@.
--                   The unsafe flavor is 'acquireGPUCommandBuffer'
--                   .
--
--     [C declaration]: @SDL_AcquireGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 3162:52@
acquireGPUCommandBufferSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> IO (BG.Ptr SDL_GPUCommandBuffer)
acquireGPUCommandBufferSafe =
  Safe.sDL_AcquireGPUCommandBuffer

-- | Pushes data to a vertex uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     For detailed information about accessing uniform data from a shader, please refer to 'createGPUShader'.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PushGPUVertexUniformData@.
--                   The safe flavor is 'pushGPUVertexUniformDataSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PushGPUVertexUniformData@, defined at @SDL3\/SDL_gpu.h 3186:34@
pushGPUVertexUniformData
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Word32
  -- ^
  --
  --           [@slot_index@]: the vertex uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO ()
pushGPUVertexUniformData =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_PushGPUVertexUniformData x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Pushes data to a vertex uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     For detailed information about accessing uniform data from a shader, please refer to 'createGPUShader'.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PushGPUVertexUniformData@.
--                   The unsafe flavor is 'pushGPUVertexUniformData'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PushGPUVertexUniformData@, defined at @SDL3\/SDL_gpu.h 3186:34@
pushGPUVertexUniformDataSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Word32
  -- ^
  --
  --           [@slot_index@]: the vertex uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO ()
pushGPUVertexUniformDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_PushGPUVertexUniformData x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Pushes data to a fragment uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PushGPUFragmentUniformData@.
--                   The safe flavor is 'pushGPUFragmentUniformDataSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PushGPUFragmentUniformData@, defined at @SDL3\/SDL_gpu.h 3208:34@
pushGPUFragmentUniformData
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Word32
  -- ^
  --
  --           [@slot_index@]: the fragment uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO ()
pushGPUFragmentUniformData =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_PushGPUFragmentUniformData x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Pushes data to a fragment uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PushGPUFragmentUniformData@.
--                   The unsafe flavor is 'pushGPUFragmentUniformData'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PushGPUFragmentUniformData@, defined at @SDL3\/SDL_gpu.h 3208:34@
pushGPUFragmentUniformDataSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Word32
  -- ^
  --
  --           [@slot_index@]: the fragment uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO ()
pushGPUFragmentUniformDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_PushGPUFragmentUniformData x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Pushes data to a uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PushGPUComputeUniformData@.
--                   The safe flavor is 'pushGPUComputeUniformDataSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PushGPUComputeUniformData@, defined at @SDL3\/SDL_gpu.h 3230:34@
pushGPUComputeUniformData
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Word32
  -- ^
  --
  --           [@slot_index@]: the uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO ()
pushGPUComputeUniformData =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_PushGPUComputeUniformData x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Pushes data to a uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PushGPUComputeUniformData@.
--                   The unsafe flavor is 'pushGPUComputeUniformData'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PushGPUComputeUniformData@, defined at @SDL3\/SDL_gpu.h 3230:34@
pushGPUComputeUniformDataSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Word32
  -- ^
  --
  --           [@slot_index@]: the uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO ()
pushGPUComputeUniformDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_PushGPUComputeUniformData x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Begins a render pass on a command buffer.
--
--     A render pass consists of a set of texture subresources (or depth slices in the 3D texture case) which will be rendered to during the render pass, along with corresponding clear values and load\/store operations. All operations related to graphics pipelines must take place inside of a render pass. A default viewport and scissor state are automatically set when this is called. You cannot begin another render pass, or begin a compute pass or copy pass until you have ended the render pass.
--
--     Using SDL_GPU_LOADOP_LOAD before any contents have been written to the texture subresource will result in undefined behavior. SDL_GPU_LOADOP_CLEAR will set the contents of the texture subresource to a single value before any rendering is performed. It\'s fine to do an empty render pass using SDL_GPU_STOREOP_STORE to clear a texture, but in general it\'s better to think of clearing not as an independent operation but as something that\'s done as the beginning of a render pass.
--
--     [Returns]: a render pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'endGPURenderPass'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BeginGPURenderPass@.
--                   The safe flavor is 'beginGPURenderPassSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BeginGPURenderPass@, defined at @SDL3\/SDL_gpu.h 3271:49@
beginGPURenderPass
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst SDL_GPUColorTargetInfo
  -- ^
  --
  --           [@color_target_infos@]: an array of texture subresources with corresponding clear values and load\/store ops.
  -> BG.Word32
  -- ^
  --
  --           [@num_color_targets@]: the number of color targets in the color_target_infos array.
  -> PtrConst.PtrConst SDL_GPUDepthStencilTargetInfo
  -- ^
  --
  --           [@depth_stencil_target_info@]: a texture subresource with corresponding clear value and load\/store ops, may be NULL.
  -> IO (BG.Ptr SDL_GPURenderPass)
beginGPURenderPass =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BeginGPURenderPass x00 x11 (Coerce.coerce x22) x33

-- | Begins a render pass on a command buffer.
--
--     A render pass consists of a set of texture subresources (or depth slices in the 3D texture case) which will be rendered to during the render pass, along with corresponding clear values and load\/store operations. All operations related to graphics pipelines must take place inside of a render pass. A default viewport and scissor state are automatically set when this is called. You cannot begin another render pass, or begin a compute pass or copy pass until you have ended the render pass.
--
--     Using SDL_GPU_LOADOP_LOAD before any contents have been written to the texture subresource will result in undefined behavior. SDL_GPU_LOADOP_CLEAR will set the contents of the texture subresource to a single value before any rendering is performed. It\'s fine to do an empty render pass using SDL_GPU_STOREOP_STORE to clear a texture, but in general it\'s better to think of clearing not as an independent operation but as something that\'s done as the beginning of a render pass.
--
--     [Returns]: a render pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'endGPURenderPass'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BeginGPURenderPass@.
--                   The unsafe flavor is 'beginGPURenderPass'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BeginGPURenderPass@, defined at @SDL3\/SDL_gpu.h 3271:49@
beginGPURenderPassSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst SDL_GPUColorTargetInfo
  -- ^
  --
  --           [@color_target_infos@]: an array of texture subresources with corresponding clear values and load\/store ops.
  -> BG.Word32
  -- ^
  --
  --           [@num_color_targets@]: the number of color targets in the color_target_infos array.
  -> PtrConst.PtrConst SDL_GPUDepthStencilTargetInfo
  -- ^
  --
  --           [@depth_stencil_target_info@]: a texture subresource with corresponding clear value and load\/store ops, may be NULL.
  -> IO (BG.Ptr SDL_GPURenderPass)
beginGPURenderPassSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BeginGPURenderPass x00 x11 (Coerce.coerce x22) x33

-- | Binds a graphics pipeline on a render pass to be used in rendering.
--
--     A graphics pipeline must be bound before making any draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUGraphicsPipeline@.
--                   The safe flavor is 'bindGPUGraphicsPipelineSafe'
--                   .
--
--     [C declaration]: @SDL_BindGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 3287:34@
bindGPUGraphicsPipeline
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Ptr SDL_GPUGraphicsPipeline
  -- ^
  --
  --           [@graphics_pipeline@]: the graphics pipeline to bind.
  -> IO ()
bindGPUGraphicsPipeline =
  Unsafe.sDL_BindGPUGraphicsPipeline

-- | Binds a graphics pipeline on a render pass to be used in rendering.
--
--     A graphics pipeline must be bound before making any draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUGraphicsPipeline@.
--                   The unsafe flavor is 'bindGPUGraphicsPipeline'
--                   .
--
--     [C declaration]: @SDL_BindGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 3287:34@
bindGPUGraphicsPipelineSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Ptr SDL_GPUGraphicsPipeline
  -- ^
  --
  --           [@graphics_pipeline@]: the graphics pipeline to bind.
  -> IO ()
bindGPUGraphicsPipelineSafe =
  Safe.sDL_BindGPUGraphicsPipeline

-- | Sets the current viewport state on a command buffer.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPUViewport@.
--                   The safe flavor is 'setGPUViewportSafe'
--                   .
--
--     [C declaration]: @SDL_SetGPUViewport@, defined at @SDL3\/SDL_gpu.h 3299:34@
setGPUViewport
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> PtrConst.PtrConst SDL_GPUViewport
  -- ^
  --
  --           [@viewport@]: the viewport to set.
  -> IO ()
setGPUViewport = Unsafe.sDL_SetGPUViewport

-- | Sets the current viewport state on a command buffer.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPUViewport@.
--                   The unsafe flavor is 'setGPUViewport'
--                   .
--
--     [C declaration]: @SDL_SetGPUViewport@, defined at @SDL3\/SDL_gpu.h 3299:34@
setGPUViewportSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> PtrConst.PtrConst SDL_GPUViewport
  -- ^
  --
  --           [@viewport@]: the viewport to set.
  -> IO ()
setGPUViewportSafe = Safe.sDL_SetGPUViewport

-- | Sets the current scissor state on a command buffer.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPUScissor@.
--                   The safe flavor is 'setGPUScissorSafe'
--                   .
--
--     [C declaration]: @SDL_SetGPUScissor@, defined at @SDL3\/SDL_gpu.h 3311:34@
setGPUScissor
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@scissor@]: the scissor area to set.
  -> IO ()
setGPUScissor = Unsafe.sDL_SetGPUScissor

-- | Sets the current scissor state on a command buffer.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPUScissor@.
--                   The unsafe flavor is 'setGPUScissor'
--                   .
--
--     [C declaration]: @SDL_SetGPUScissor@, defined at @SDL3\/SDL_gpu.h 3311:34@
setGPUScissorSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@scissor@]: the scissor area to set.
  -> IO ()
setGPUScissorSafe = Safe.sDL_SetGPUScissor

-- | Sets the current blend constants on a command buffer.
--
--     @since 3.2.0
--
--     [See also]: @SDL_GPU_BLENDFACTOR_CONSTANT_COLOR@, @SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPUBlendConstants@.
--                   The safe flavor is 'setGPUBlendConstantsSafe'
--                   .
--
--     [C declaration]: @SDL_SetGPUBlendConstants@, defined at @SDL3\/SDL_gpu.h 3326:34@
setGPUBlendConstants
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -- ^
  --
  --           [@blend_constants@]: the blend constant color.
  -> IO ()
setGPUBlendConstants =
  Unsafe.sDL_SetGPUBlendConstants

-- | Sets the current blend constants on a command buffer.
--
--     @since 3.2.0
--
--     [See also]: @SDL_GPU_BLENDFACTOR_CONSTANT_COLOR@, @SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPUBlendConstants@.
--                   The unsafe flavor is 'setGPUBlendConstants'
--                   .
--
--     [C declaration]: @SDL_SetGPUBlendConstants@, defined at @SDL3\/SDL_gpu.h 3326:34@
setGPUBlendConstantsSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -- ^
  --
  --           [@blend_constants@]: the blend constant color.
  -> IO ()
setGPUBlendConstantsSafe =
  Safe.sDL_SetGPUBlendConstants

-- | Sets the current stencil reference value on a command buffer.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPUStencilReference@.
--                   The safe flavor is 'setGPUStencilReferenceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPUStencilReference@, defined at @SDL3\/SDL_gpu.h 3338:34@
setGPUStencilReference
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word8
  -- ^
  --
  --           [@reference@]: the stencil reference value to set.
  -> IO ()
setGPUStencilReference =
  \x00 ->
    \x11 ->
      Unsafe.sDL_SetGPUStencilReference x00 (Coerce.coerce x11)

-- | Sets the current stencil reference value on a command buffer.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPUStencilReference@.
--                   The unsafe flavor is 'setGPUStencilReference'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPUStencilReference@, defined at @SDL3\/SDL_gpu.h 3338:34@
setGPUStencilReferenceSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word8
  -- ^
  --
  --           [@reference@]: the stencil reference value to set.
  -> IO ()
setGPUStencilReferenceSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_SetGPUStencilReference x00 (Coerce.coerce x11)

-- | Binds vertex buffers on a command buffer for use with subsequent draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUVertexBuffers@.
--                   The safe flavor is 'bindGPUVertexBuffersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUVertexBuffers@, defined at @SDL3\/SDL_gpu.h 3354:34@
bindGPUVertexBuffers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the vertex buffer slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUBufferBinding
  -- ^
  --
  --           [@bindings@]: an array of 'SDL_GPUBufferBinding' structs containing vertex buffers and offset values.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of bindings in the bindings array.
  -> IO ()
bindGPUVertexBuffers =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUVertexBuffers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds vertex buffers on a command buffer for use with subsequent draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUVertexBuffers@.
--                   The unsafe flavor is 'bindGPUVertexBuffers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUVertexBuffers@, defined at @SDL3\/SDL_gpu.h 3354:34@
bindGPUVertexBuffersSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the vertex buffer slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUBufferBinding
  -- ^
  --
  --           [@bindings@]: an array of 'SDL_GPUBufferBinding' structs containing vertex buffers and offset values.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of bindings in the bindings array.
  -> IO ()
bindGPUVertexBuffersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUVertexBuffers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds an index buffer on a command buffer for use with subsequent draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUIndexBuffer@.
--                   The safe flavor is 'bindGPUIndexBufferSafe'
--                   .
--
--     [C declaration]: @SDL_BindGPUIndexBuffer@, defined at @SDL3\/SDL_gpu.h 3371:34@
bindGPUIndexBuffer
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> PtrConst.PtrConst SDL_GPUBufferBinding
  -- ^
  --
  --           [@binding@]: a pointer to a struct containing an index buffer and offset.
  -> SDL_GPUIndexElementSize
  -- ^
  --
  --           [@index_element_size@]: whether the index values in the buffer are 16- or 32-bit.
  -> IO ()
bindGPUIndexBuffer = Unsafe.sDL_BindGPUIndexBuffer

-- | Binds an index buffer on a command buffer for use with subsequent draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUIndexBuffer@.
--                   The unsafe flavor is 'bindGPUIndexBuffer'
--                   .
--
--     [C declaration]: @SDL_BindGPUIndexBuffer@, defined at @SDL3\/SDL_gpu.h 3371:34@
bindGPUIndexBufferSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> PtrConst.PtrConst SDL_GPUBufferBinding
  -- ^
  --
  --           [@binding@]: a pointer to a struct containing an index buffer and offset.
  -> SDL_GPUIndexElementSize
  -- ^
  --
  --           [@index_element_size@]: whether the index values in the buffer are 16- or 32-bit.
  -> IO ()
bindGPUIndexBufferSafe = Safe.sDL_BindGPUIndexBuffer

-- | Binds texture-sampler pairs for use on the vertex shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUVertexSamplers@.
--                   The safe flavor is 'bindGPUVertexSamplersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUVertexSamplers@, defined at @SDL3\/SDL_gpu.h 3395:34@
bindGPUVertexSamplers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the vertex sampler slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -- ^
  --
  --           [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of texture-sampler pairs to bind from the array.
  -> IO ()
bindGPUVertexSamplers =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUVertexSamplers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds texture-sampler pairs for use on the vertex shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUVertexSamplers@.
--                   The unsafe flavor is 'bindGPUVertexSamplers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUVertexSamplers@, defined at @SDL3\/SDL_gpu.h 3395:34@
bindGPUVertexSamplersSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the vertex sampler slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -- ^
  --
  --           [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of texture-sampler pairs to bind from the array.
  -> IO ()
bindGPUVertexSamplersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUVertexSamplers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage textures for use on the vertex shader.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUVertexStorageTextures@.
--                   The safe flavor is 'bindGPUVertexStorageTexturesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUVertexStorageTextures@, defined at @SDL3\/SDL_gpu.h 3419:34@
bindGPUVertexStorageTextures
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the vertex storage texture slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@storage_textures@]: an array of storage textures.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage texture to bind from the array.
  -> IO ()
bindGPUVertexStorageTextures =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUVertexStorageTextures x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage textures for use on the vertex shader.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUVertexStorageTextures@.
--                   The unsafe flavor is 'bindGPUVertexStorageTextures'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUVertexStorageTextures@, defined at @SDL3\/SDL_gpu.h 3419:34@
bindGPUVertexStorageTexturesSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the vertex storage texture slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@storage_textures@]: an array of storage textures.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage texture to bind from the array.
  -> IO ()
bindGPUVertexStorageTexturesSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUVertexStorageTextures x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage buffers for use on the vertex shader.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUVertexStorageBuffers@.
--                   The safe flavor is 'bindGPUVertexStorageBuffersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUVertexStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3443:34@
bindGPUVertexStorageBuffers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the vertex storage buffer slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -- ^
  --
  --           [@storage_buffers@]: an array of buffers.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of buffers to bind from the array.
  -> IO ()
bindGPUVertexStorageBuffers =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUVertexStorageBuffers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage buffers for use on the vertex shader.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUVertexStorageBuffers@.
--                   The unsafe flavor is 'bindGPUVertexStorageBuffers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUVertexStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3443:34@
bindGPUVertexStorageBuffersSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the vertex storage buffer slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -- ^
  --
  --           [@storage_buffers@]: an array of buffers.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of buffers to bind from the array.
  -> IO ()
bindGPUVertexStorageBuffersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUVertexStorageBuffers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds texture-sampler pairs for use on the fragment shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUFragmentSamplers@.
--                   The safe flavor is 'bindGPUFragmentSamplersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUFragmentSamplers@, defined at @SDL3\/SDL_gpu.h 3468:34@
bindGPUFragmentSamplers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the fragment sampler slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -- ^
  --
  --           [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of texture-sampler pairs to bind from the array.
  -> IO ()
bindGPUFragmentSamplers =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUFragmentSamplers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds texture-sampler pairs for use on the fragment shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUFragmentSamplers@.
--                   The unsafe flavor is 'bindGPUFragmentSamplers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUFragmentSamplers@, defined at @SDL3\/SDL_gpu.h 3468:34@
bindGPUFragmentSamplersSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the fragment sampler slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -- ^
  --
  --           [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of texture-sampler pairs to bind from the array.
  -> IO ()
bindGPUFragmentSamplersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUFragmentSamplers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage textures for use on the fragment shader.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUFragmentStorageTextures@.
--                   The safe flavor is 'bindGPUFragmentStorageTexturesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUFragmentStorageTextures@, defined at @SDL3\/SDL_gpu.h 3492:34@
bindGPUFragmentStorageTextures
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the fragment storage texture slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@storage_textures@]: an array of storage textures.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage textures to bind from the array.
  -> IO ()
bindGPUFragmentStorageTextures =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUFragmentStorageTextures x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage textures for use on the fragment shader.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUFragmentStorageTextures@.
--                   The unsafe flavor is 'bindGPUFragmentStorageTextures'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUFragmentStorageTextures@, defined at @SDL3\/SDL_gpu.h 3492:34@
bindGPUFragmentStorageTexturesSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the fragment storage texture slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@storage_textures@]: an array of storage textures.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage textures to bind from the array.
  -> IO ()
bindGPUFragmentStorageTexturesSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUFragmentStorageTextures x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage buffers for use on the fragment shader.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUFragmentStorageBuffers@.
--                   The safe flavor is 'bindGPUFragmentStorageBuffersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUFragmentStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3516:34@
bindGPUFragmentStorageBuffers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the fragment storage buffer slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -- ^
  --
  --           [@storage_buffers@]: an array of storage buffers.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage buffers to bind from the array.
  -> IO ()
bindGPUFragmentStorageBuffers =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUFragmentStorageBuffers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage buffers for use on the fragment shader.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUShader'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUShader'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUFragmentStorageBuffers@.
--                   The unsafe flavor is 'bindGPUFragmentStorageBuffers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUFragmentStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3516:34@
bindGPUFragmentStorageBuffersSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the fragment storage buffer slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -- ^
  --
  --           [@storage_buffers@]: an array of storage buffers.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage buffers to bind from the array.
  -> IO ()
bindGPUFragmentStorageBuffersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUFragmentStorageBuffers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Draws data using bound graphics state with an index buffer and instancing enabled.
--
--     You must not call this function before binding a graphics pipeline.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DrawGPUIndexedPrimitives@.
--                   The safe flavor is 'drawGPUIndexedPrimitivesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DrawGPUIndexedPrimitives@, defined at @SDL3\/SDL_gpu.h 3547:34@
drawGPUIndexedPrimitives
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@num_indices@]: the number of indices to draw per instance.
  -> BG.Word32
  -- ^
  --
  --           [@num_instances@]: the number of instances to draw.
  -> BG.Word32
  -- ^
  --
  --           [@first_index@]: the starting index within the index buffer.
  -> BG.Int32
  -- ^
  --
  --           [@vertex_offset@]: value added to vertex index before indexing into the vertex buffer.
  -> BG.Word32
  -- ^
  --
  --           [@first_instance@]: the ID of the first instance to draw.
  -> IO ()
drawGPUIndexedPrimitives =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Unsafe.sDL_DrawGPUIndexedPrimitives
                x00
                (Coerce.coerce x11)
                (Coerce.coerce x22)
                (Coerce.coerce x33)
                (Coerce.coerce x44)
                (Coerce.coerce x55)

-- | Draws data using bound graphics state with an index buffer and instancing enabled.
--
--     You must not call this function before binding a graphics pipeline.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DrawGPUIndexedPrimitives@.
--                   The unsafe flavor is 'drawGPUIndexedPrimitives'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DrawGPUIndexedPrimitives@, defined at @SDL3\/SDL_gpu.h 3547:34@
drawGPUIndexedPrimitivesSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@num_indices@]: the number of indices to draw per instance.
  -> BG.Word32
  -- ^
  --
  --           [@num_instances@]: the number of instances to draw.
  -> BG.Word32
  -- ^
  --
  --           [@first_index@]: the starting index within the index buffer.
  -> BG.Int32
  -- ^
  --
  --           [@vertex_offset@]: value added to vertex index before indexing into the vertex buffer.
  -> BG.Word32
  -- ^
  --
  --           [@first_instance@]: the ID of the first instance to draw.
  -> IO ()
drawGPUIndexedPrimitivesSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Safe.sDL_DrawGPUIndexedPrimitives
                x00
                (Coerce.coerce x11)
                (Coerce.coerce x22)
                (Coerce.coerce x33)
                (Coerce.coerce x44)
                (Coerce.coerce x55)

-- | Draws data using bound graphics state.
--
--     You must not call this function before binding a graphics pipeline.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DrawGPUPrimitives@.
--                   The safe flavor is 'drawGPUPrimitivesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DrawGPUPrimitives@, defined at @SDL3\/SDL_gpu.h 3575:34@
drawGPUPrimitives
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@num_vertices@]: the number of vertices to draw.
  -> BG.Word32
  -- ^
  --
  --           [@num_instances@]: the number of instances that will be drawn.
  -> BG.Word32
  -- ^
  --
  --           [@first_vertex@]: the index of the first vertex to draw.
  -> BG.Word32
  -- ^
  --
  --           [@first_instance@]: the ID of the first instance to draw.
  -> IO ()
drawGPUPrimitives =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Unsafe.sDL_DrawGPUPrimitives
              x00
              (Coerce.coerce x11)
              (Coerce.coerce x22)
              (Coerce.coerce x33)
              (Coerce.coerce x44)

-- | Draws data using bound graphics state.
--
--     You must not call this function before binding a graphics pipeline.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DrawGPUPrimitives@.
--                   The unsafe flavor is 'drawGPUPrimitives'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DrawGPUPrimitives@, defined at @SDL3\/SDL_gpu.h 3575:34@
drawGPUPrimitivesSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@num_vertices@]: the number of vertices to draw.
  -> BG.Word32
  -- ^
  --
  --           [@num_instances@]: the number of instances that will be drawn.
  -> BG.Word32
  -- ^
  --
  --           [@first_vertex@]: the index of the first vertex to draw.
  -> BG.Word32
  -- ^
  --
  --           [@first_instance@]: the ID of the first instance to draw.
  -> IO ()
drawGPUPrimitivesSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Safe.sDL_DrawGPUPrimitives
              x00
              (Coerce.coerce x11)
              (Coerce.coerce x22)
              (Coerce.coerce x33)
              (Coerce.coerce x44)

-- | Draws data using bound graphics state and with draw parameters set from a buffer.
--
--     The buffer must consist of tightly-packed draw parameter sets that each match the layout of 'SDL_GPUIndirectDrawCommand'. You must not call this function before binding a graphics pipeline.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DrawGPUPrimitivesIndirect@.
--                   The safe flavor is 'drawGPUPrimitivesIndirectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DrawGPUPrimitivesIndirect@, defined at @SDL3\/SDL_gpu.h 3598:34@
drawGPUPrimitivesIndirect
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer containing draw parameters.
  -> BG.Word32
  -- ^
  --
  --           [@offset@]: the offset to start reading from the draw buffer.
  -> BG.Word32
  -- ^
  --
  --           [@draw_count@]: the number of draw parameter sets that should be read from the draw buffer.
  -> IO ()
drawGPUPrimitivesIndirect =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_DrawGPUPrimitivesIndirect x00 x11 (Coerce.coerce x22) (Coerce.coerce x33)

-- | Draws data using bound graphics state and with draw parameters set from a buffer.
--
--     The buffer must consist of tightly-packed draw parameter sets that each match the layout of 'SDL_GPUIndirectDrawCommand'. You must not call this function before binding a graphics pipeline.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DrawGPUPrimitivesIndirect@.
--                   The unsafe flavor is 'drawGPUPrimitivesIndirect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DrawGPUPrimitivesIndirect@, defined at @SDL3\/SDL_gpu.h 3598:34@
drawGPUPrimitivesIndirectSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer containing draw parameters.
  -> BG.Word32
  -- ^
  --
  --           [@offset@]: the offset to start reading from the draw buffer.
  -> BG.Word32
  -- ^
  --
  --           [@draw_count@]: the number of draw parameter sets that should be read from the draw buffer.
  -> IO ()
drawGPUPrimitivesIndirectSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_DrawGPUPrimitivesIndirect x00 x11 (Coerce.coerce x22) (Coerce.coerce x33)

-- | Draws data using bound graphics state with an index buffer enabled and with draw parameters set from a buffer.
--
--     The buffer must consist of tightly-packed draw parameter sets that each match the layout of 'SDL_GPUIndexedIndirectDrawCommand'. You must not call this function before binding a graphics pipeline.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DrawGPUIndexedPrimitivesIndirect@.
--                   The safe flavor is 'drawGPUIndexedPrimitivesIndirectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DrawGPUIndexedPrimitivesIndirect@, defined at @SDL3\/SDL_gpu.h 3620:34@
drawGPUIndexedPrimitivesIndirect
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer containing draw parameters.
  -> BG.Word32
  -- ^
  --
  --           [@offset@]: the offset to start reading from the draw buffer.
  -> BG.Word32
  -- ^
  --
  --           [@draw_count@]: the number of draw parameter sets that should be read from the draw buffer.
  -> IO ()
drawGPUIndexedPrimitivesIndirect =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_DrawGPUIndexedPrimitivesIndirect x00 x11 (Coerce.coerce x22) (Coerce.coerce x33)

-- | Draws data using bound graphics state with an index buffer enabled and with draw parameters set from a buffer.
--
--     The buffer must consist of tightly-packed draw parameter sets that each match the layout of 'SDL_GPUIndexedIndirectDrawCommand'. You must not call this function before binding a graphics pipeline.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DrawGPUIndexedPrimitivesIndirect@.
--                   The unsafe flavor is 'drawGPUIndexedPrimitivesIndirect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DrawGPUIndexedPrimitivesIndirect@, defined at @SDL3\/SDL_gpu.h 3620:34@
drawGPUIndexedPrimitivesIndirectSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer containing draw parameters.
  -> BG.Word32
  -- ^
  --
  --           [@offset@]: the offset to start reading from the draw buffer.
  -> BG.Word32
  -- ^
  --
  --           [@draw_count@]: the number of draw parameter sets that should be read from the draw buffer.
  -> IO ()
drawGPUIndexedPrimitivesIndirectSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_DrawGPUIndexedPrimitivesIndirect x00 x11 (Coerce.coerce x22) (Coerce.coerce x33)

-- | Ends the given render pass.
--
--     All bound graphics state on the render pass command buffer is unset. The render pass handle is now invalid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EndGPURenderPass@.
--                   The safe flavor is 'endGPURenderPassSafe'
--                   .
--
--     [C declaration]: @SDL_EndGPURenderPass@, defined at @SDL3\/SDL_gpu.h 3636:34@
endGPURenderPass
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> IO ()
endGPURenderPass = Unsafe.sDL_EndGPURenderPass

-- | Ends the given render pass.
--
--     All bound graphics state on the render pass command buffer is unset. The render pass handle is now invalid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EndGPURenderPass@.
--                   The unsafe flavor is 'endGPURenderPass'
--                   .
--
--     [C declaration]: @SDL_EndGPURenderPass@, defined at @SDL3\/SDL_gpu.h 3636:34@
endGPURenderPassSafe
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> IO ()
endGPURenderPassSafe = Safe.sDL_EndGPURenderPass

-- | Begins a compute pass on a command buffer.
--
--     A compute pass is defined by a set of texture subresources and buffers that may be written to by compute pipelines. These textures and buffers must have been created with the COMPUTE_STORAGE_WRITE bit or the COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE bit. If you do not create a texture with COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE, you must not read from the texture in the compute pass. All operations related to compute pipelines must take place inside of a compute pass. You must not begin another compute pass, or a render pass or copy pass before ending the compute pass.
--
--     A VERY IMPORTANT NOTE - Reads and writes in compute passes are NOT implicitly synchronized. This means you may cause data races by both reading and writing a resource region in a compute pass, or by writing multiple times to a resource region. If your compute work depends on reading the completed output from a previous dispatch, you MUST end the current compute pass and begin a new one before you can safely access the data. Otherwise you will receive unexpected results. Reading and writing a texture in the same compute pass is only supported by specific texture formats. Make sure you check the format support!
--
--     [Returns]: a compute pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'endGPUComputePass'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BeginGPUComputePass@.
--                   The safe flavor is 'beginGPUComputePassSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BeginGPUComputePass@, defined at @SDL3\/SDL_gpu.h 3678:50@
beginGPUComputePass
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst SDL_GPUStorageTextureReadWriteBinding
  -- ^
  --
  --           [@storage_texture_bindings@]: an array of writeable storage texture binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_storage_texture_bindings@]: the number of storage textures to bind from the array.
  -> PtrConst.PtrConst SDL_GPUStorageBufferReadWriteBinding
  -- ^
  --
  --           [@storage_buffer_bindings@]: an array of writeable storage buffer binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_storage_buffer_bindings@]: the number of storage buffers to bind from the array.
  -> IO (BG.Ptr SDL_GPUComputePass)
beginGPUComputePass =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Unsafe.sDL_BeginGPUComputePass x00 x11 (Coerce.coerce x22) x33 (Coerce.coerce x44)

-- | Begins a compute pass on a command buffer.
--
--     A compute pass is defined by a set of texture subresources and buffers that may be written to by compute pipelines. These textures and buffers must have been created with the COMPUTE_STORAGE_WRITE bit or the COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE bit. If you do not create a texture with COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE, you must not read from the texture in the compute pass. All operations related to compute pipelines must take place inside of a compute pass. You must not begin another compute pass, or a render pass or copy pass before ending the compute pass.
--
--     A VERY IMPORTANT NOTE - Reads and writes in compute passes are NOT implicitly synchronized. This means you may cause data races by both reading and writing a resource region in a compute pass, or by writing multiple times to a resource region. If your compute work depends on reading the completed output from a previous dispatch, you MUST end the current compute pass and begin a new one before you can safely access the data. Otherwise you will receive unexpected results. Reading and writing a texture in the same compute pass is only supported by specific texture formats. Make sure you check the format support!
--
--     [Returns]: a compute pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'endGPUComputePass'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BeginGPUComputePass@.
--                   The unsafe flavor is 'beginGPUComputePass'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BeginGPUComputePass@, defined at @SDL3\/SDL_gpu.h 3678:50@
beginGPUComputePassSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst SDL_GPUStorageTextureReadWriteBinding
  -- ^
  --
  --           [@storage_texture_bindings@]: an array of writeable storage texture binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_storage_texture_bindings@]: the number of storage textures to bind from the array.
  -> PtrConst.PtrConst SDL_GPUStorageBufferReadWriteBinding
  -- ^
  --
  --           [@storage_buffer_bindings@]: an array of writeable storage buffer binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_storage_buffer_bindings@]: the number of storage buffers to bind from the array.
  -> IO (BG.Ptr SDL_GPUComputePass)
beginGPUComputePassSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Safe.sDL_BeginGPUComputePass x00 x11 (Coerce.coerce x22) x33 (Coerce.coerce x44)

-- | Binds a compute pipeline on a command buffer for use in compute dispatch.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUComputePipeline@.
--                   The safe flavor is 'bindGPUComputePipelineSafe'
--                   .
--
--     [C declaration]: @SDL_BindGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 3693:34@
bindGPUComputePipeline
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Ptr SDL_GPUComputePipeline
  -- ^
  --
  --           [@compute_pipeline@]: a compute pipeline to bind.
  -> IO ()
bindGPUComputePipeline =
  Unsafe.sDL_BindGPUComputePipeline

-- | Binds a compute pipeline on a command buffer for use in compute dispatch.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUComputePipeline@.
--                   The unsafe flavor is 'bindGPUComputePipeline'
--                   .
--
--     [C declaration]: @SDL_BindGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 3693:34@
bindGPUComputePipelineSafe
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Ptr SDL_GPUComputePipeline
  -- ^
  --
  --           [@compute_pipeline@]: a compute pipeline to bind.
  -> IO ()
bindGPUComputePipelineSafe =
  Safe.sDL_BindGPUComputePipeline

-- | Binds texture-sampler pairs for use on the compute shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUComputePipeline'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUComputePipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUComputeSamplers@.
--                   The safe flavor is 'bindGPUComputeSamplersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUComputeSamplers@, defined at @SDL3\/SDL_gpu.h 3716:34@
bindGPUComputeSamplers
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the compute sampler slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -- ^
  --
  --           [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of texture-sampler bindings to bind from the array.
  -> IO ()
bindGPUComputeSamplers =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUComputeSamplers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds texture-sampler pairs for use on the compute shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUComputePipeline'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUComputePipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUComputeSamplers@.
--                   The unsafe flavor is 'bindGPUComputeSamplers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUComputeSamplers@, defined at @SDL3\/SDL_gpu.h 3716:34@
bindGPUComputeSamplersSafe
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the compute sampler slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -- ^
  --
  --           [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of texture-sampler bindings to bind from the array.
  -> IO ()
bindGPUComputeSamplersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUComputeSamplers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage textures as readonly for use on the compute pipeline.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUComputePipeline'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUComputePipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUComputeStorageTextures@.
--                   The safe flavor is 'bindGPUComputeStorageTexturesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUComputeStorageTextures@, defined at @SDL3\/SDL_gpu.h 3740:34@
bindGPUComputeStorageTextures
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the compute storage texture slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@storage_textures@]: an array of storage textures.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage textures to bind from the array.
  -> IO ()
bindGPUComputeStorageTextures =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUComputeStorageTextures x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage textures as readonly for use on the compute pipeline.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUComputePipeline'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUComputePipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUComputeStorageTextures@.
--                   The unsafe flavor is 'bindGPUComputeStorageTextures'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUComputeStorageTextures@, defined at @SDL3\/SDL_gpu.h 3740:34@
bindGPUComputeStorageTexturesSafe
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the compute storage texture slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@storage_textures@]: an array of storage textures.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage textures to bind from the array.
  -> IO ()
bindGPUComputeStorageTexturesSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUComputeStorageTextures x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage buffers as readonly for use on the compute pipeline.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUComputePipeline'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUComputePipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindGPUComputeStorageBuffers@.
--                   The safe flavor is 'bindGPUComputeStorageBuffersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUComputeStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3764:34@
bindGPUComputeStorageBuffers
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the compute storage buffer slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -- ^
  --
  --           [@storage_buffers@]: an array of storage buffer binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage buffers to bind from the array.
  -> IO ()
bindGPUComputeStorageBuffers =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_BindGPUComputeStorageBuffers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Binds storage buffers as readonly for use on the compute pipeline.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @'createGPUComputePipeline'@.
--
--     @since 3.2.0
--
--     [See also]: 'createGPUComputePipeline'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindGPUComputeStorageBuffers@.
--                   The unsafe flavor is 'bindGPUComputeStorageBuffers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindGPUComputeStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3764:34@
bindGPUComputeStorageBuffersSafe
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@first_slot@]: the compute storage buffer slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -- ^
  --
  --           [@storage_buffers@]: an array of storage buffer binding structs.
  -> BG.Word32
  -- ^
  --
  --           [@num_bindings@]: the number of storage buffers to bind from the array.
  -> IO ()
bindGPUComputeStorageBuffersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_BindGPUComputeStorageBuffers x00 (Coerce.coerce x11) x22 (Coerce.coerce x33)

-- | Dispatches compute work.
--
--     You must not call this function before binding a compute pipeline.
--
--     A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and the dispatches write to the same resource region as each other, there is no guarantee of which order the writes will occur. If the write order matters, you MUST end the compute pass and begin another one.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DispatchGPUCompute@.
--                   The safe flavor is 'dispatchGPUComputeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DispatchGPUCompute@, defined at @SDL3\/SDL_gpu.h 3790:34@
dispatchGPUCompute
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@groupcount_x@]: number of local workgroups to dispatch in the X dimension.
  -> BG.Word32
  -- ^
  --
  --           [@groupcount_y@]: number of local workgroups to dispatch in the Y dimension.
  -> BG.Word32
  -- ^
  --
  --           [@groupcount_z@]: number of local workgroups to dispatch in the Z dimension.
  -> IO ()
dispatchGPUCompute =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_DispatchGPUCompute x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33)

-- | Dispatches compute work.
--
--     You must not call this function before binding a compute pipeline.
--
--     A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and the dispatches write to the same resource region as each other, there is no guarantee of which order the writes will occur. If the write order matters, you MUST end the compute pass and begin another one.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DispatchGPUCompute@.
--                   The unsafe flavor is 'dispatchGPUCompute'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DispatchGPUCompute@, defined at @SDL3\/SDL_gpu.h 3790:34@
dispatchGPUComputeSafe
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Word32
  -- ^
  --
  --           [@groupcount_x@]: number of local workgroups to dispatch in the X dimension.
  -> BG.Word32
  -- ^
  --
  --           [@groupcount_y@]: number of local workgroups to dispatch in the Y dimension.
  -> BG.Word32
  -- ^
  --
  --           [@groupcount_z@]: number of local workgroups to dispatch in the Z dimension.
  -> IO ()
dispatchGPUComputeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_DispatchGPUCompute x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33)

-- | Dispatches compute work with parameters set from a buffer.
--
--     The buffer layout should match the layout of 'SDL_GPUIndirectDispatchCommand'. You must not call this function before binding a compute pipeline.
--
--     A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and the dispatches write to the same resource region as each other, there is no guarantee of which order the writes will occur. If the write order matters, you MUST end the compute pass and begin another one.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DispatchGPUComputeIndirect@.
--                   The safe flavor is 'dispatchGPUComputeIndirectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DispatchGPUComputeIndirect@, defined at @SDL3\/SDL_gpu.h 3814:34@
dispatchGPUComputeIndirect
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer containing dispatch parameters.
  -> BG.Word32
  -- ^
  --
  --           [@offset@]: the offset to start reading from the dispatch buffer.
  -> IO ()
dispatchGPUComputeIndirect =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_DispatchGPUComputeIndirect x00 x11 (Coerce.coerce x22)

-- | Dispatches compute work with parameters set from a buffer.
--
--     The buffer layout should match the layout of 'SDL_GPUIndirectDispatchCommand'. You must not call this function before binding a compute pipeline.
--
--     A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and the dispatches write to the same resource region as each other, there is no guarantee of which order the writes will occur. If the write order matters, you MUST end the compute pass and begin another one.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DispatchGPUComputeIndirect@.
--                   The unsafe flavor is 'dispatchGPUComputeIndirect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DispatchGPUComputeIndirect@, defined at @SDL3\/SDL_gpu.h 3814:34@
dispatchGPUComputeIndirectSafe
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer containing dispatch parameters.
  -> BG.Word32
  -- ^
  --
  --           [@offset@]: the offset to start reading from the dispatch buffer.
  -> IO ()
dispatchGPUComputeIndirectSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_DispatchGPUComputeIndirect x00 x11 (Coerce.coerce x22)

-- | Ends the current compute pass.
--
--     All bound compute state on the command buffer is unset. The compute pass handle is now invalid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EndGPUComputePass@.
--                   The safe flavor is 'endGPUComputePassSafe'
--                   .
--
--     [C declaration]: @SDL_EndGPUComputePass@, defined at @SDL3\/SDL_gpu.h 3829:34@
endGPUComputePass
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> IO ()
endGPUComputePass = Unsafe.sDL_EndGPUComputePass

-- | Ends the current compute pass.
--
--     All bound compute state on the command buffer is unset. The compute pass handle is now invalid.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EndGPUComputePass@.
--                   The unsafe flavor is 'endGPUComputePass'
--                   .
--
--     [C declaration]: @SDL_EndGPUComputePass@, defined at @SDL3\/SDL_gpu.h 3829:34@
endGPUComputePassSafe
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> IO ()
endGPUComputePassSafe = Safe.sDL_EndGPUComputePass

-- | Maps a transfer buffer into application address space.
--
--     You must unmap the transfer buffer before encoding upload commands. The memory is owned by the graphics driver - do NOT call 'SDL3.Sys.Stdinc.free' on the returned pointer.
--
--     [Returns]: the address of the mapped transfer buffer memory, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MapGPUTransferBuffer@.
--                   The safe flavor is 'mapGPUTransferBufferSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3849:36@
mapGPUTransferBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTransferBuffer
  -- ^
  --
  --           [@transfer_buffer@]: a transfer buffer.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the transfer buffer if it is already bound.
  -> IO (BG.Ptr BG.Void)
mapGPUTransferBuffer =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_MapGPUTransferBuffer x00 x11 (CBool.fromBool x22)

-- | Maps a transfer buffer into application address space.
--
--     You must unmap the transfer buffer before encoding upload commands. The memory is owned by the graphics driver - do NOT call 'SDL3.Sys.Stdinc.free' on the returned pointer.
--
--     [Returns]: the address of the mapped transfer buffer memory, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MapGPUTransferBuffer@.
--                   The unsafe flavor is 'mapGPUTransferBuffer'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3849:36@
mapGPUTransferBufferSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTransferBuffer
  -- ^
  --
  --           [@transfer_buffer@]: a transfer buffer.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the transfer buffer if it is already bound.
  -> IO (BG.Ptr BG.Void)
mapGPUTransferBufferSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_MapGPUTransferBuffer x00 x11 (CBool.fromBool x22)

-- | Unmaps a previously mapped transfer buffer.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnmapGPUTransferBuffer@.
--                   The safe flavor is 'unmapGPUTransferBufferSafe'
--                   .
--
--     [C declaration]: @SDL_UnmapGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3862:34@
unmapGPUTransferBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTransferBuffer
  -- ^
  --
  --           [@transfer_buffer@]: a previously mapped transfer buffer.
  -> IO ()
unmapGPUTransferBuffer =
  Unsafe.sDL_UnmapGPUTransferBuffer

-- | Unmaps a previously mapped transfer buffer.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnmapGPUTransferBuffer@.
--                   The unsafe flavor is 'unmapGPUTransferBuffer'
--                   .
--
--     [C declaration]: @SDL_UnmapGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3862:34@
unmapGPUTransferBufferSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTransferBuffer
  -- ^
  --
  --           [@transfer_buffer@]: a previously mapped transfer buffer.
  -> IO ()
unmapGPUTransferBufferSafe =
  Safe.sDL_UnmapGPUTransferBuffer

-- | Begins a copy pass on a command buffer.
--
--     All operations related to copying to or from buffers or textures take place inside a copy pass. You must not begin another copy pass, or a render pass or compute pass before ending the copy pass.
--
--     [Returns]: a copy pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'endGPUCopyPass'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BeginGPUCopyPass@.
--                   The safe flavor is 'beginGPUCopyPassSafe'
--                   .
--
--     [C declaration]: @SDL_BeginGPUCopyPass@, defined at @SDL3\/SDL_gpu.h 3882:47@
beginGPUCopyPass
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO (BG.Ptr SDL_GPUCopyPass)
beginGPUCopyPass = Unsafe.sDL_BeginGPUCopyPass

-- | Begins a copy pass on a command buffer.
--
--     All operations related to copying to or from buffers or textures take place inside a copy pass. You must not begin another copy pass, or a render pass or compute pass before ending the copy pass.
--
--     [Returns]: a copy pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'endGPUCopyPass'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BeginGPUCopyPass@.
--                   The unsafe flavor is 'beginGPUCopyPass'
--                   .
--
--     [C declaration]: @SDL_BeginGPUCopyPass@, defined at @SDL3\/SDL_gpu.h 3882:47@
beginGPUCopyPassSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO (BG.Ptr SDL_GPUCopyPass)
beginGPUCopyPassSafe = Safe.sDL_BeginGPUCopyPass

-- | Uploads data from a transfer buffer to a texture.
--
--     The upload occurs on the GPU timeline. You may assume that the upload has finished in subsequent commands.
--
--     You must align the data in the transfer buffer to a multiple of the texel size of the texture format.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UploadToGPUTexture@.
--                   The safe flavor is 'uploadToGPUTextureSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UploadToGPUTexture@, defined at @SDL3\/SDL_gpu.h 3902:34@
uploadToGPUTexture
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
  -- ^
  --
  --           [@source@]: the source transfer buffer with image layout information.
  -> PtrConst.PtrConst SDL_GPUTextureRegion
  -- ^
  --
  --           [@destination@]: the destination texture region.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the texture if the texture is bound, otherwise overwrites the data.
  -> IO ()
uploadToGPUTexture =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_UploadToGPUTexture x00 x11 x22 (CBool.fromBool x33)

-- | Uploads data from a transfer buffer to a texture.
--
--     The upload occurs on the GPU timeline. You may assume that the upload has finished in subsequent commands.
--
--     You must align the data in the transfer buffer to a multiple of the texel size of the texture format.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UploadToGPUTexture@.
--                   The unsafe flavor is 'uploadToGPUTexture'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UploadToGPUTexture@, defined at @SDL3\/SDL_gpu.h 3902:34@
uploadToGPUTextureSafe
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
  -- ^
  --
  --           [@source@]: the source transfer buffer with image layout information.
  -> PtrConst.PtrConst SDL_GPUTextureRegion
  -- ^
  --
  --           [@destination@]: the destination texture region.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the texture if the texture is bound, otherwise overwrites the data.
  -> IO ()
uploadToGPUTextureSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_UploadToGPUTexture x00 x11 x22 (CBool.fromBool x33)

-- | Uploads data from a transfer buffer to a buffer.
--
--     The upload occurs on the GPU timeline. You may assume that the upload has finished in subsequent commands.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UploadToGPUBuffer@.
--                   The safe flavor is 'uploadToGPUBufferSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UploadToGPUBuffer@, defined at @SDL3\/SDL_gpu.h 3922:34@
uploadToGPUBuffer
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
  -- ^
  --
  --           [@source@]: the source transfer buffer with offset.
  -> PtrConst.PtrConst SDL_GPUBufferRegion
  -- ^
  --
  --           [@destination@]: the destination buffer with offset and size.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the buffer if it is already bound, otherwise overwrites the data.
  -> IO ()
uploadToGPUBuffer =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_UploadToGPUBuffer x00 x11 x22 (CBool.fromBool x33)

-- | Uploads data from a transfer buffer to a buffer.
--
--     The upload occurs on the GPU timeline. You may assume that the upload has finished in subsequent commands.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UploadToGPUBuffer@.
--                   The unsafe flavor is 'uploadToGPUBuffer'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UploadToGPUBuffer@, defined at @SDL3\/SDL_gpu.h 3922:34@
uploadToGPUBufferSafe
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
  -- ^
  --
  --           [@source@]: the source transfer buffer with offset.
  -> PtrConst.PtrConst SDL_GPUBufferRegion
  -- ^
  --
  --           [@destination@]: the destination buffer with offset and size.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the buffer if it is already bound, otherwise overwrites the data.
  -> IO ()
uploadToGPUBufferSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_UploadToGPUBuffer x00 x11 x22 (CBool.fromBool x33)

-- | Performs a texture-to-texture copy.
--
--     This copy occurs on the GPU timeline. You may assume the copy has finished in subsequent commands.
--
--     This function does not support copying between depth and color textures. For those, copy the texture to a buffer and then to the destination texture.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CopyGPUTextureToTexture@.
--                   The safe flavor is 'copyGPUTextureToTextureSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyGPUTextureToTexture@, defined at @SDL3\/SDL_gpu.h 3949:34@
copyGPUTextureToTexture
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUTextureLocation
  -- ^
  --
  --           [@source@]: a source texture region.
  -> PtrConst.PtrConst SDL_GPUTextureLocation
  -- ^
  --
  --           [@destination@]: a destination texture region.
  -> BG.Word32
  -- ^
  --
  --           [@w@]: the width of the region to copy.
  -> BG.Word32
  -- ^
  --
  --           [@h@]: the height of the region to copy.
  -> BG.Word32
  -- ^
  --
  --           [@d@]: the depth of the region to copy.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the destination texture if the destination texture is bound, otherwise overwrites the data.
  -> IO ()
copyGPUTextureToTexture =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                Unsafe.sDL_CopyGPUTextureToTexture
                  x00
                  x11
                  x22
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
                  (Coerce.coerce x55)
                  (CBool.fromBool x66)

-- | Performs a texture-to-texture copy.
--
--     This copy occurs on the GPU timeline. You may assume the copy has finished in subsequent commands.
--
--     This function does not support copying between depth and color textures. For those, copy the texture to a buffer and then to the destination texture.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CopyGPUTextureToTexture@.
--                   The unsafe flavor is 'copyGPUTextureToTexture'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyGPUTextureToTexture@, defined at @SDL3\/SDL_gpu.h 3949:34@
copyGPUTextureToTextureSafe
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUTextureLocation
  -- ^
  --
  --           [@source@]: a source texture region.
  -> PtrConst.PtrConst SDL_GPUTextureLocation
  -- ^
  --
  --           [@destination@]: a destination texture region.
  -> BG.Word32
  -- ^
  --
  --           [@w@]: the width of the region to copy.
  -> BG.Word32
  -- ^
  --
  --           [@h@]: the height of the region to copy.
  -> BG.Word32
  -- ^
  --
  --           [@d@]: the depth of the region to copy.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the destination texture if the destination texture is bound, otherwise overwrites the data.
  -> IO ()
copyGPUTextureToTextureSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                Safe.sDL_CopyGPUTextureToTexture
                  x00
                  x11
                  x22
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
                  (Coerce.coerce x55)
                  (CBool.fromBool x66)

-- | Performs a buffer-to-buffer copy.
--
--     This copy occurs on the GPU timeline. You may assume the copy has finished in subsequent commands.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CopyGPUBufferToBuffer@.
--                   The safe flavor is 'copyGPUBufferToBufferSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyGPUBufferToBuffer@, defined at @SDL3\/SDL_gpu.h 3973:34@
copyGPUBufferToBuffer
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUBufferLocation
  -- ^
  --
  --           [@source@]: the buffer and offset to copy from.
  -> PtrConst.PtrConst SDL_GPUBufferLocation
  -- ^
  --
  --           [@destination@]: the buffer and offset to copy to.
  -> BG.Word32
  -- ^
  --
  --           [@size@]: the length of the buffer to copy.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the destination buffer if it is already bound, otherwise overwrites the data.
  -> IO ()
copyGPUBufferToBuffer =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Unsafe.sDL_CopyGPUBufferToBuffer x00 x11 x22 (Coerce.coerce x33) (CBool.fromBool x44)

-- | Performs a buffer-to-buffer copy.
--
--     This copy occurs on the GPU timeline. You may assume the copy has finished in subsequent commands.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CopyGPUBufferToBuffer@.
--                   The unsafe flavor is 'copyGPUBufferToBuffer'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyGPUBufferToBuffer@, defined at @SDL3\/SDL_gpu.h 3973:34@
copyGPUBufferToBufferSafe
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUBufferLocation
  -- ^
  --
  --           [@source@]: the buffer and offset to copy from.
  -> PtrConst.PtrConst SDL_GPUBufferLocation
  -- ^
  --
  --           [@destination@]: the buffer and offset to copy to.
  -> BG.Word32
  -- ^
  --
  --           [@size@]: the length of the buffer to copy.
  -> Bool
  -- ^
  --
  --           [@cycle@]: if true, cycles the destination buffer if it is already bound, otherwise overwrites the data.
  -> IO ()
copyGPUBufferToBufferSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Safe.sDL_CopyGPUBufferToBuffer x00 x11 x22 (Coerce.coerce x33) (CBool.fromBool x44)

-- | Copies data from a texture to a transfer buffer on the GPU timeline.
--
--     This data is not guaranteed to be copied until the command buffer fence is signaled.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DownloadFromGPUTexture@.
--                   The safe flavor is 'downloadFromGPUTextureSafe'
--                   .
--
--     [C declaration]: @SDL_DownloadFromGPUTexture@, defined at @SDL3\/SDL_gpu.h 3993:34@
downloadFromGPUTexture
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUTextureRegion
  -- ^
  --
  --           [@source@]: the source texture region.
  -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
  -- ^
  --
  --           [@destination@]: the destination transfer buffer with image layout information.
  -> IO ()
downloadFromGPUTexture =
  Unsafe.sDL_DownloadFromGPUTexture

-- | Copies data from a texture to a transfer buffer on the GPU timeline.
--
--     This data is not guaranteed to be copied until the command buffer fence is signaled.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DownloadFromGPUTexture@.
--                   The unsafe flavor is 'downloadFromGPUTexture'
--                   .
--
--     [C declaration]: @SDL_DownloadFromGPUTexture@, defined at @SDL3\/SDL_gpu.h 3993:34@
downloadFromGPUTextureSafe
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUTextureRegion
  -- ^
  --
  --           [@source@]: the source texture region.
  -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
  -- ^
  --
  --           [@destination@]: the destination transfer buffer with image layout information.
  -> IO ()
downloadFromGPUTextureSafe =
  Safe.sDL_DownloadFromGPUTexture

-- | Copies data from a buffer to a transfer buffer on the GPU timeline.
--
--     This data is not guaranteed to be copied until the command buffer fence is signaled.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DownloadFromGPUBuffer@.
--                   The safe flavor is 'downloadFromGPUBufferSafe'
--                   .
--
--     [C declaration]: @SDL_DownloadFromGPUBuffer@, defined at @SDL3\/SDL_gpu.h 4010:34@
downloadFromGPUBuffer
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUBufferRegion
  -- ^
  --
  --           [@source@]: the source buffer with offset and size.
  -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
  -- ^
  --
  --           [@destination@]: the destination transfer buffer with offset.
  -> IO ()
downloadFromGPUBuffer =
  Unsafe.sDL_DownloadFromGPUBuffer

-- | Copies data from a buffer to a transfer buffer on the GPU timeline.
--
--     This data is not guaranteed to be copied until the command buffer fence is signaled.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DownloadFromGPUBuffer@.
--                   The unsafe flavor is 'downloadFromGPUBuffer'
--                   .
--
--     [C declaration]: @SDL_DownloadFromGPUBuffer@, defined at @SDL3\/SDL_gpu.h 4010:34@
downloadFromGPUBufferSafe
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> PtrConst.PtrConst SDL_GPUBufferRegion
  -- ^
  --
  --           [@source@]: the source buffer with offset and size.
  -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
  -- ^
  --
  --           [@destination@]: the destination transfer buffer with offset.
  -> IO ()
downloadFromGPUBufferSafe =
  Safe.sDL_DownloadFromGPUBuffer

-- | Ends the current copy pass.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EndGPUCopyPass@.
--                   The safe flavor is 'endGPUCopyPassSafe'
--                   .
--
--     [C declaration]: @SDL_EndGPUCopyPass@, defined at @SDL3\/SDL_gpu.h 4022:34@
endGPUCopyPass
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> IO ()
endGPUCopyPass = Unsafe.sDL_EndGPUCopyPass

-- | Ends the current copy pass.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EndGPUCopyPass@.
--                   The unsafe flavor is 'endGPUCopyPass'
--                   .
--
--     [C declaration]: @SDL_EndGPUCopyPass@, defined at @SDL3\/SDL_gpu.h 4022:34@
endGPUCopyPassSafe
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> IO ()
endGPUCopyPassSafe = Safe.sDL_EndGPUCopyPass

-- | Generates mipmaps for the given texture.
--
--     This function must not be called inside of any pass.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GenerateMipmapsForGPUTexture@.
--                   The safe flavor is 'generateMipmapsForGPUTextureSafe'
--                   .
--
--     [C declaration]: @SDL_GenerateMipmapsForGPUTexture@, defined at @SDL3\/SDL_gpu.h 4035:34@
generateMipmapsForGPUTexture
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command_buffer.
  -> BG.Ptr SDL_GPUTexture
  -- ^
  --
  --           [@texture@]: a texture with more than 1 mip level.
  -> IO ()
generateMipmapsForGPUTexture =
  Unsafe.sDL_GenerateMipmapsForGPUTexture

-- | Generates mipmaps for the given texture.
--
--     This function must not be called inside of any pass.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GenerateMipmapsForGPUTexture@.
--                   The unsafe flavor is 'generateMipmapsForGPUTexture'
--                   .
--
--     [C declaration]: @SDL_GenerateMipmapsForGPUTexture@, defined at @SDL3\/SDL_gpu.h 4035:34@
generateMipmapsForGPUTextureSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command_buffer.
  -> BG.Ptr SDL_GPUTexture
  -- ^
  --
  --           [@texture@]: a texture with more than 1 mip level.
  -> IO ()
generateMipmapsForGPUTextureSafe =
  Safe.sDL_GenerateMipmapsForGPUTexture

-- | Blits from a source texture region to a destination texture region.
--
--     This function must not be called inside of any pass.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BlitGPUTexture@.
--                   The safe flavor is 'blitGPUTextureSafe'
--                   .
--
--     [C declaration]: @SDL_BlitGPUTexture@, defined at @SDL3\/SDL_gpu.h 4049:34@
blitGPUTexture
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst SDL_GPUBlitInfo
  -- ^
  --
  --           [@info@]: the blit info struct containing the blit parameters.
  -> IO ()
blitGPUTexture = Unsafe.sDL_BlitGPUTexture

-- | Blits from a source texture region to a destination texture region.
--
--     This function must not be called inside of any pass.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BlitGPUTexture@.
--                   The unsafe flavor is 'blitGPUTexture'
--                   .
--
--     [C declaration]: @SDL_BlitGPUTexture@, defined at @SDL3\/SDL_gpu.h 4049:34@
blitGPUTextureSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst SDL_GPUBlitInfo
  -- ^
  --
  --           [@info@]: the blit info struct containing the blit parameters.
  -> IO ()
blitGPUTextureSafe = Safe.sDL_BlitGPUTexture

-- | Determines whether a swapchain composition is supported by the window.
--
--     The window must be claimed before calling this function.
--
--     [Returns]: true if supported, false if unsupported.
--
--     @since 3.2.0
--
--     [See also]: 'claimWindowForGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WindowSupportsGPUSwapchainComposition@.
--                   The safe flavor is 'windowSupportsGPUSwapchainCompositionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WindowSupportsGPUSwapchainComposition@, defined at @SDL3\/SDL_gpu.h 4069:34@
windowSupportsGPUSwapchainComposition
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window.
  -> SDL_GPUSwapchainComposition
  -- ^
  --
  --           [@swapchain_composition@]: the swapchain composition to check.
  -> IO Bool
windowSupportsGPUSwapchainComposition =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_WindowSupportsGPUSwapchainComposition x00 x11 x22)

-- | Determines whether a swapchain composition is supported by the window.
--
--     The window must be claimed before calling this function.
--
--     [Returns]: true if supported, false if unsupported.
--
--     @since 3.2.0
--
--     [See also]: 'claimWindowForGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WindowSupportsGPUSwapchainComposition@.
--                   The unsafe flavor is 'windowSupportsGPUSwapchainComposition'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WindowSupportsGPUSwapchainComposition@, defined at @SDL3\/SDL_gpu.h 4069:34@
windowSupportsGPUSwapchainCompositionSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window.
  -> SDL_GPUSwapchainComposition
  -- ^
  --
  --           [@swapchain_composition@]: the swapchain composition to check.
  -> IO Bool
windowSupportsGPUSwapchainCompositionSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_WindowSupportsGPUSwapchainComposition x00 x11 x22)

-- | Determines whether a presentation mode is supported by the window.
--
--     The window must be claimed before calling this function.
--
--     [Returns]: true if supported, false if unsupported.
--
--     @since 3.2.0
--
--     [See also]: 'claimWindowForGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WindowSupportsGPUPresentMode@.
--                   The safe flavor is 'windowSupportsGPUPresentModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WindowSupportsGPUPresentMode@, defined at @SDL3\/SDL_gpu.h 4088:34@
windowSupportsGPUPresentMode
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window.
  -> SDL_GPUPresentMode
  -- ^
  --
  --           [@present_mode@]: the presentation mode to check.
  -> IO Bool
windowSupportsGPUPresentMode =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_WindowSupportsGPUPresentMode x00 x11 x22)

-- | Determines whether a presentation mode is supported by the window.
--
--     The window must be claimed before calling this function.
--
--     [Returns]: true if supported, false if unsupported.
--
--     @since 3.2.0
--
--     [See also]: 'claimWindowForGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WindowSupportsGPUPresentMode@.
--                   The unsafe flavor is 'windowSupportsGPUPresentMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WindowSupportsGPUPresentMode@, defined at @SDL3\/SDL_gpu.h 4088:34@
windowSupportsGPUPresentModeSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window.
  -> SDL_GPUPresentMode
  -- ^
  --
  --           [@present_mode@]: the presentation mode to check.
  -> IO Bool
windowSupportsGPUPresentModeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_WindowSupportsGPUPresentMode x00 x11 x22)

-- | Claims a window, creating a swapchain structure for it.
--
--     This must be called before 'acquireGPUSwapchainTexture' is called using the window. You should only call this function from the thread that created the window.
--
--     The swapchain will be created with SDL_GPU_SWAPCHAINCOMPOSITION_SDR and SDL_GPU_PRESENTMODE_VSYNC. If you want to have different swapchain parameters, you must call 'setGPUSwapchainParameters' after claiming the window.
--
--     [Returns]: true on success, or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'waitAndAcquireGPUSwapchainTexture', 'releaseWindowFromGPUDevice', 'windowSupportsGPUPresentMode', 'windowSupportsGPUSwapchainComposition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ClaimWindowForGPUDevice@.
--                   The safe flavor is 'claimWindowForGPUDeviceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClaimWindowForGPUDevice@, defined at @SDL3\/SDL_gpu.h 4120:34@
claimWindowForGPUDevice
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window.
  -> IO Bool
claimWindowForGPUDevice =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ClaimWindowForGPUDevice x00 x11)

-- | Claims a window, creating a swapchain structure for it.
--
--     This must be called before 'acquireGPUSwapchainTexture' is called using the window. You should only call this function from the thread that created the window.
--
--     The swapchain will be created with SDL_GPU_SWAPCHAINCOMPOSITION_SDR and SDL_GPU_PRESENTMODE_VSYNC. If you want to have different swapchain parameters, you must call 'setGPUSwapchainParameters' after claiming the window.
--
--     [Returns]: true on success, or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'waitAndAcquireGPUSwapchainTexture', 'releaseWindowFromGPUDevice', 'windowSupportsGPUPresentMode', 'windowSupportsGPUSwapchainComposition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ClaimWindowForGPUDevice@.
--                   The unsafe flavor is 'claimWindowForGPUDevice'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClaimWindowForGPUDevice@, defined at @SDL3\/SDL_gpu.h 4120:34@
claimWindowForGPUDeviceSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window.
  -> IO Bool
claimWindowForGPUDeviceSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ClaimWindowForGPUDevice x00 x11)

-- | Unclaims a window, destroying its swapchain structure.
--
--     @since 3.2.0
--
--     [See also]: 'claimWindowForGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseWindowFromGPUDevice@.
--                   The safe flavor is 'releaseWindowFromGPUDeviceSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseWindowFromGPUDevice@, defined at @SDL3\/SDL_gpu.h 4134:34@
releaseWindowFromGPUDevice
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window that has been claimed.
  -> IO ()
releaseWindowFromGPUDevice =
  Unsafe.sDL_ReleaseWindowFromGPUDevice

-- | Unclaims a window, destroying its swapchain structure.
--
--     @since 3.2.0
--
--     [See also]: 'claimWindowForGPUDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseWindowFromGPUDevice@.
--                   The unsafe flavor is 'releaseWindowFromGPUDevice'
--                   .
--
--     [C declaration]: @SDL_ReleaseWindowFromGPUDevice@, defined at @SDL3\/SDL_gpu.h 4134:34@
releaseWindowFromGPUDeviceSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window that has been claimed.
  -> IO ()
releaseWindowFromGPUDeviceSafe =
  Safe.sDL_ReleaseWindowFromGPUDevice

-- | Changes the swapchain parameters for the given claimed window.
--
--     This function will fail if the requested present mode or swapchain composition are unsupported by the device. Check if the parameters are supported via 'windowSupportsGPUPresentMode' \/ 'windowSupportsGPUSwapchainComposition' prior to calling this function.
--
--     SDL_GPU_PRESENTMODE_VSYNC with SDL_GPU_SWAPCHAINCOMPOSITION_SDR is always supported.
--
--     [Returns]: true if successful, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'windowSupportsGPUPresentMode', 'windowSupportsGPUSwapchainComposition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPUSwapchainParameters@.
--                   The safe flavor is 'setGPUSwapchainParametersSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPUSwapchainParameters@, defined at @SDL3\/SDL_gpu.h 4161:34@
setGPUSwapchainParameters
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window that has been claimed.
  -> SDL_GPUSwapchainComposition
  -- ^
  --
  --           [@swapchain_composition@]: the desired composition of the swapchain.
  -> SDL_GPUPresentMode
  -- ^
  --
  --           [@present_mode@]: the desired present mode for the swapchain.
  -> IO Bool
setGPUSwapchainParameters =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_SetGPUSwapchainParameters x00 x11 x22 x33)

-- | Changes the swapchain parameters for the given claimed window.
--
--     This function will fail if the requested present mode or swapchain composition are unsupported by the device. Check if the parameters are supported via 'windowSupportsGPUPresentMode' \/ 'windowSupportsGPUSwapchainComposition' prior to calling this function.
--
--     SDL_GPU_PRESENTMODE_VSYNC with SDL_GPU_SWAPCHAINCOMPOSITION_SDR is always supported.
--
--     [Returns]: true if successful, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'windowSupportsGPUPresentMode', 'windowSupportsGPUSwapchainComposition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPUSwapchainParameters@.
--                   The unsafe flavor is 'setGPUSwapchainParameters'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPUSwapchainParameters@, defined at @SDL3\/SDL_gpu.h 4161:34@
setGPUSwapchainParametersSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window that has been claimed.
  -> SDL_GPUSwapchainComposition
  -- ^
  --
  --           [@swapchain_composition@]: the desired composition of the swapchain.
  -> SDL_GPUPresentMode
  -- ^
  --
  --           [@present_mode@]: the desired present mode for the swapchain.
  -> IO Bool
setGPUSwapchainParametersSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_SetGPUSwapchainParameters x00 x11 x22 x33)

-- | Configures the maximum allowed number of frames in flight.
--
--     The default value when the device is created is 2. This means that after you have submitted 2 frames for presentation, if the GPU has not finished working on the first frame, @'acquireGPUSwapchainTexture'@ will fill the swapchain texture pointer with NULL, and @'waitAndAcquireGPUSwapchainTexture'@ will block.
--
--     Higher values increase throughput at the expense of visual latency. Lower values decrease visual latency at the expense of throughput.
--
--     Note that calling this function will stall and flush the command queue to prevent synchronization issues.
--
--     The minimum value of allowed frames in flight is 1, and the maximum is 3.
--
--     [Returns]: true if successful, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPUAllowedFramesInFlight@.
--                   The safe flavor is 'setGPUAllowedFramesInFlightSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPUAllowedFramesInFlight@, defined at @SDL3\/SDL_gpu.h 4192:34@
setGPUAllowedFramesInFlight
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Word32
  -- ^
  --
  --           [@allowed_frames_in_flight@]: the maximum number of frames that can be pending on the GPU.
  -> IO Bool
setGPUAllowedFramesInFlight =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetGPUAllowedFramesInFlight x00 (Coerce.coerce x11))

-- | Configures the maximum allowed number of frames in flight.
--
--     The default value when the device is created is 2. This means that after you have submitted 2 frames for presentation, if the GPU has not finished working on the first frame, @'acquireGPUSwapchainTexture'@ will fill the swapchain texture pointer with NULL, and @'waitAndAcquireGPUSwapchainTexture'@ will block.
--
--     Higher values increase throughput at the expense of visual latency. Lower values decrease visual latency at the expense of throughput.
--
--     Note that calling this function will stall and flush the command queue to prevent synchronization issues.
--
--     The minimum value of allowed frames in flight is 1, and the maximum is 3.
--
--     [Returns]: true if successful, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPUAllowedFramesInFlight@.
--                   The unsafe flavor is 'setGPUAllowedFramesInFlight'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPUAllowedFramesInFlight@, defined at @SDL3\/SDL_gpu.h 4192:34@
setGPUAllowedFramesInFlightSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Word32
  -- ^
  --
  --           [@allowed_frames_in_flight@]: the maximum number of frames that can be pending on the GPU.
  -> IO Bool
setGPUAllowedFramesInFlightSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetGPUAllowedFramesInFlight x00 (Coerce.coerce x11))

-- | Obtains the texture format of the swapchain for the given window.
--
--     Note that this format can change if the swapchain parameters change.
--
--     [Returns]: the texture format of the swapchain.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGPUSwapchainTextureFormat@.
--                   The safe flavor is 'getGPUSwapchainTextureFormatSafe'
--                   .
--
--     [C declaration]: @SDL_GetGPUSwapchainTextureFormat@, defined at @SDL3\/SDL_gpu.h 4207:50@
getGPUSwapchainTextureFormat
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window that has been claimed.
  -> IO SDL_GPUTextureFormat
getGPUSwapchainTextureFormat =
  Unsafe.sDL_GetGPUSwapchainTextureFormat

-- | Obtains the texture format of the swapchain for the given window.
--
--     Note that this format can change if the swapchain parameters change.
--
--     [Returns]: the texture format of the swapchain.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGPUSwapchainTextureFormat@.
--                   The unsafe flavor is 'getGPUSwapchainTextureFormat'
--                   .
--
--     [C declaration]: @SDL_GetGPUSwapchainTextureFormat@, defined at @SDL3\/SDL_gpu.h 4207:50@
getGPUSwapchainTextureFormatSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window that has been claimed.
  -> IO SDL_GPUTextureFormat
getGPUSwapchainTextureFormatSafe =
  Safe.sDL_GetGPUSwapchainTextureFormat

-- | Acquire a texture to use in presentation.
--
--     When a swapchain texture is acquired on a command buffer, it will automatically be submitted for presentation when the command buffer is submitted. The swapchain texture should only be referenced by the command buffer used to acquire it.
--
--     This function will fill the swapchain texture handle with NULL if too many frames are in flight. This is not an error. This NULL pointer should not be passed back into SDL. Instead, it should be considered as an indication to wait until the swapchain is available.
--
--     If you use this function, it is possible to create a situation where many command buffers are allocated while the rendering context waits for the GPU to catch up, which will cause memory usage to grow. You should use @'waitAndAcquireGPUSwapchainTexture'@ unless you know what you are doing with timing.
--
--     The swapchain texture is managed by the implementation and must not be freed by the user. You MUST NOT call this function from any thread other than the one that created the window.
--
--     [Returns]: true on success, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'claimWindowForGPUDevice', 'submitGPUCommandBuffer', 'submitGPUCommandBufferAndAcquireFence', 'cancelGPUCommandBuffer', 'SDL3.Sys.Video.getWindowSizeInPixels', 'waitForGPUSwapchain', 'waitAndAcquireGPUSwapchainTexture', 'setGPUAllowedFramesInFlight'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AcquireGPUSwapchainTexture@.
--                   The safe flavor is 'acquireGPUSwapchainTextureSafe'
--                   : can block on swapchain availability.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AcquireGPUSwapchainTexture@, defined at @SDL3\/SDL_gpu.h 4259:34@
acquireGPUSwapchainTexture
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: a window that has been claimed.
  -> BG.Ptr (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@swapchain_texture@]: a pointer filled in with a swapchain texture handle.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@swapchain_texture_width@]: a pointer filled in with the swapchain texture width, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@swapchain_texture_height@]: a pointer filled in with the swapchain texture height, may be NULL.
  -> IO Bool
acquireGPUSwapchainTexture =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_AcquireGPUSwapchainTexture x00 x11 x22 x33 x44)

-- | Acquire a texture to use in presentation.
--
--     When a swapchain texture is acquired on a command buffer, it will automatically be submitted for presentation when the command buffer is submitted. The swapchain texture should only be referenced by the command buffer used to acquire it.
--
--     This function will fill the swapchain texture handle with NULL if too many frames are in flight. This is not an error. This NULL pointer should not be passed back into SDL. Instead, it should be considered as an indication to wait until the swapchain is available.
--
--     If you use this function, it is possible to create a situation where many command buffers are allocated while the rendering context waits for the GPU to catch up, which will cause memory usage to grow. You should use @'waitAndAcquireGPUSwapchainTexture'@ unless you know what you are doing with timing.
--
--     The swapchain texture is managed by the implementation and must not be freed by the user. You MUST NOT call this function from any thread other than the one that created the window.
--
--     [Returns]: true on success, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'claimWindowForGPUDevice', 'submitGPUCommandBuffer', 'submitGPUCommandBufferAndAcquireFence', 'cancelGPUCommandBuffer', 'SDL3.Sys.Video.getWindowSizeInPixels', 'waitForGPUSwapchain', 'waitAndAcquireGPUSwapchainTexture', 'setGPUAllowedFramesInFlight'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AcquireGPUSwapchainTexture@.
--                   The unsafe flavor is 'acquireGPUSwapchainTexture'
--                   : can block on swapchain availability.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AcquireGPUSwapchainTexture@, defined at @SDL3\/SDL_gpu.h 4259:34@
acquireGPUSwapchainTextureSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: a window that has been claimed.
  -> BG.Ptr (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@swapchain_texture@]: a pointer filled in with a swapchain texture handle.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@swapchain_texture_width@]: a pointer filled in with the swapchain texture width, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@swapchain_texture_height@]: a pointer filled in with the swapchain texture height, may be NULL.
  -> IO Bool
acquireGPUSwapchainTextureSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_AcquireGPUSwapchainTexture x00 x11 x22 x33 x44)

-- | Blocks the thread until a swapchain texture is available to be acquired.
--
--     [Returns]: true on success, false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'acquireGPUSwapchainTexture', 'waitAndAcquireGPUSwapchainTexture', 'setGPUAllowedFramesInFlight'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitForGPUSwapchain@.
--                   The safe flavor is 'waitForGPUSwapchainSafe'
--                   : blocks until the swapchain is available.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitForGPUSwapchain@, defined at @SDL3\/SDL_gpu.h 4283:34@
waitForGPUSwapchain
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: a window that has been claimed.
  -> IO Bool
waitForGPUSwapchain =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WaitForGPUSwapchain x00 x11)

-- | Blocks the thread until a swapchain texture is available to be acquired.
--
--     [Returns]: true on success, false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'acquireGPUSwapchainTexture', 'waitAndAcquireGPUSwapchainTexture', 'setGPUAllowedFramesInFlight'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitForGPUSwapchain@.
--                   The unsafe flavor is 'waitForGPUSwapchain'
--                   : blocks until the swapchain is available.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitForGPUSwapchain@, defined at @SDL3\/SDL_gpu.h 4283:34@
waitForGPUSwapchainSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: a window that has been claimed.
  -> IO Bool
waitForGPUSwapchainSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WaitForGPUSwapchain x00 x11)

-- | Blocks the thread until a swapchain texture is available to be acquired, and then acquires it.
--
--     When a swapchain texture is acquired on a command buffer, it will automatically be submitted for presentation when the command buffer is submitted. The swapchain texture should only be referenced by the command buffer used to acquire it. It is an error to call @'cancelGPUCommandBuffer'@ after a swapchain texture is acquired.
--
--     This function can fill the swapchain texture handle with NULL in certain cases, for example if the window is minimized. This is not an error. You should always make sure to check whether the pointer is NULL before actually using it.
--
--     The swapchain texture is managed by the implementation and must not be freed by the user. You MUST NOT call this function from any thread other than the one that created the window.
--
--     The swapchain texture is write-only and cannot be used as a sampler or for another reading operation.
--
--     [Returns]: true on success, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBuffer', 'submitGPUCommandBufferAndAcquireFence', 'acquireGPUSwapchainTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitAndAcquireGPUSwapchainTexture@.
--                   The safe flavor is 'waitAndAcquireGPUSwapchainTextureSafe'
--                   : blocks until a swapchain texture is available.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitAndAcquireGPUSwapchainTexture@, defined at @SDL3\/SDL_gpu.h 4329:34@
waitAndAcquireGPUSwapchainTexture
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: a window that has been claimed.
  -> BG.Ptr (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@swapchain_texture@]: a pointer filled in with a swapchain texture handle.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@swapchain_texture_width@]: a pointer filled in with the swapchain texture width, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@swapchain_texture_height@]: a pointer filled in with the swapchain texture height, may be NULL.
  -> IO Bool
waitAndAcquireGPUSwapchainTexture =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_WaitAndAcquireGPUSwapchainTexture x00 x11 x22 x33 x44)

-- | Blocks the thread until a swapchain texture is available to be acquired, and then acquires it.
--
--     When a swapchain texture is acquired on a command buffer, it will automatically be submitted for presentation when the command buffer is submitted. The swapchain texture should only be referenced by the command buffer used to acquire it. It is an error to call @'cancelGPUCommandBuffer'@ after a swapchain texture is acquired.
--
--     This function can fill the swapchain texture handle with NULL in certain cases, for example if the window is minimized. This is not an error. You should always make sure to check whether the pointer is NULL before actually using it.
--
--     The swapchain texture is managed by the implementation and must not be freed by the user. You MUST NOT call this function from any thread other than the one that created the window.
--
--     The swapchain texture is write-only and cannot be used as a sampler or for another reading operation.
--
--     [Returns]: true on success, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBuffer', 'submitGPUCommandBufferAndAcquireFence', 'acquireGPUSwapchainTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitAndAcquireGPUSwapchainTexture@.
--                   The unsafe flavor is 'waitAndAcquireGPUSwapchainTexture'
--                   : blocks until a swapchain texture is available.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitAndAcquireGPUSwapchainTexture@, defined at @SDL3\/SDL_gpu.h 4329:34@
waitAndAcquireGPUSwapchainTextureSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: a window that has been claimed.
  -> BG.Ptr (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@swapchain_texture@]: a pointer filled in with a swapchain texture handle.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@swapchain_texture_width@]: a pointer filled in with the swapchain texture width, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@swapchain_texture_height@]: a pointer filled in with the swapchain texture height, may be NULL.
  -> IO Bool
waitAndAcquireGPUSwapchainTextureSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_WaitAndAcquireGPUSwapchainTexture x00 x11 x22 x33 x44)

-- | Submits a command buffer so its commands can be processed on the GPU.
--
--     It is invalid to use the command buffer after this is called.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     All commands in the submission are guaranteed to begin executing before any command in a subsequent submission begins executing.
--
--     [Returns]: true on success, false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'acquireGPUCommandBuffer', 'waitAndAcquireGPUSwapchainTexture', 'acquireGPUSwapchainTexture', 'submitGPUCommandBufferAndAcquireFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SubmitGPUCommandBuffer@.
--                   The safe flavor is 'submitGPUCommandBufferSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SubmitGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 4357:34@
submitGPUCommandBuffer
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO Bool
submitGPUCommandBuffer =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_SubmitGPUCommandBuffer x00)

-- | Submits a command buffer so its commands can be processed on the GPU.
--
--     It is invalid to use the command buffer after this is called.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     All commands in the submission are guaranteed to begin executing before any command in a subsequent submission begins executing.
--
--     [Returns]: true on success, false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'acquireGPUCommandBuffer', 'waitAndAcquireGPUSwapchainTexture', 'acquireGPUSwapchainTexture', 'submitGPUCommandBufferAndAcquireFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SubmitGPUCommandBuffer@.
--                   The unsafe flavor is 'submitGPUCommandBuffer'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SubmitGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 4357:34@
submitGPUCommandBufferSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO Bool
submitGPUCommandBufferSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_SubmitGPUCommandBuffer x00)

-- | Submits a command buffer so its commands can be processed on the GPU, and acquires a fence associated with the command buffer.
--
--     You must release this fence when it is no longer needed or it will cause a leak. It is invalid to use the command buffer after this is called.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     All commands in the submission are guaranteed to begin executing before any command in a subsequent submission begins executing.
--
--     [Returns]: a fence associated with the command buffer, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'acquireGPUCommandBuffer', 'waitAndAcquireGPUSwapchainTexture', 'acquireGPUSwapchainTexture', 'submitGPUCommandBuffer', 'releaseGPUFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SubmitGPUCommandBufferAndAcquireFence@.
--                   The safe flavor is 'submitGPUCommandBufferAndAcquireFenceSafe'
--                   .
--
--     [C declaration]: @SDL_SubmitGPUCommandBufferAndAcquireFence@, defined at @SDL3\/SDL_gpu.h 4384:44@
submitGPUCommandBufferAndAcquireFence
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO (BG.Ptr SDL_GPUFence)
submitGPUCommandBufferAndAcquireFence =
  Unsafe.sDL_SubmitGPUCommandBufferAndAcquireFence

-- | Submits a command buffer so its commands can be processed on the GPU, and acquires a fence associated with the command buffer.
--
--     You must release this fence when it is no longer needed or it will cause a leak. It is invalid to use the command buffer after this is called.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     All commands in the submission are guaranteed to begin executing before any command in a subsequent submission begins executing.
--
--     [Returns]: a fence associated with the command buffer, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'acquireGPUCommandBuffer', 'waitAndAcquireGPUSwapchainTexture', 'acquireGPUSwapchainTexture', 'submitGPUCommandBuffer', 'releaseGPUFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SubmitGPUCommandBufferAndAcquireFence@.
--                   The unsafe flavor is 'submitGPUCommandBufferAndAcquireFence'
--                   .
--
--     [C declaration]: @SDL_SubmitGPUCommandBufferAndAcquireFence@, defined at @SDL3\/SDL_gpu.h 4384:44@
submitGPUCommandBufferAndAcquireFenceSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO (BG.Ptr SDL_GPUFence)
submitGPUCommandBufferAndAcquireFenceSafe =
  Safe.sDL_SubmitGPUCommandBufferAndAcquireFence

-- | Cancels a command buffer.
--
--     None of the enqueued commands are executed.
--
--     It is an error to call this function after a swapchain texture has been acquired.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     You must not reference the command buffer after calling this function.
--
--     [Returns]: true on success, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'waitAndAcquireGPUSwapchainTexture', 'acquireGPUCommandBuffer', 'acquireGPUSwapchainTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CancelGPUCommandBuffer@.
--                   The safe flavor is 'cancelGPUCommandBufferSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CancelGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 4409:34@
cancelGPUCommandBuffer
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO Bool
cancelGPUCommandBuffer =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_CancelGPUCommandBuffer x00)

-- | Cancels a command buffer.
--
--     None of the enqueued commands are executed.
--
--     It is an error to call this function after a swapchain texture has been acquired.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     You must not reference the command buffer after calling this function.
--
--     [Returns]: true on success, false on error; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'waitAndAcquireGPUSwapchainTexture', 'acquireGPUCommandBuffer', 'acquireGPUSwapchainTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CancelGPUCommandBuffer@.
--                   The unsafe flavor is 'cancelGPUCommandBuffer'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CancelGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 4409:34@
cancelGPUCommandBufferSafe
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO Bool
cancelGPUCommandBufferSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_CancelGPUCommandBuffer x00)

-- | Blocks the thread until the GPU is completely idle.
--
--     [Returns]: true on success, false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'waitForGPUFences'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitForGPUIdle@.
--                   The safe flavor is 'waitForGPUIdleSafe'
--                   : blocks until the GPU is idle.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitForGPUIdle@, defined at @SDL3\/SDL_gpu.h 4423:34@
waitForGPUIdle
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> IO Bool
waitForGPUIdle =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_WaitForGPUIdle x00)

-- | Blocks the thread until the GPU is completely idle.
--
--     [Returns]: true on success, false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'waitForGPUFences'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitForGPUIdle@.
--                   The unsafe flavor is 'waitForGPUIdle'
--                   : blocks until the GPU is idle.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitForGPUIdle@, defined at @SDL3\/SDL_gpu.h 4423:34@
waitForGPUIdleSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> IO Bool
waitForGPUIdleSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_WaitForGPUIdle x00)

-- | Blocks the thread until the given fences are signaled.
--
--     [Returns]: true on success, false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBufferAndAcquireFence', 'waitForGPUIdle'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitForGPUFences@.
--                   The safe flavor is 'waitForGPUFencesSafe'
--                   : blocks on fences.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitForGPUFences@, defined at @SDL3\/SDL_gpu.h 4442:34@
waitForGPUFences
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> Bool
  -- ^
  --
  --           [@wait_all@]: if 0, wait for any fence to be signaled, if 1, wait for all fences to be signaled.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUFence)
  -- ^
  --
  --           [@fences@]: an array of fences to wait on.
  -> BG.Word32
  -- ^
  --
  --           [@num_fences@]: the number of fences in the fences array.
  -> IO Bool
waitForGPUFences =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_WaitForGPUFences x00 (CBool.fromBool x11) x22 (Coerce.coerce x33))

-- | Blocks the thread until the given fences are signaled.
--
--     [Returns]: true on success, false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBufferAndAcquireFence', 'waitForGPUIdle'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitForGPUFences@.
--                   The unsafe flavor is 'waitForGPUFences'
--                   : blocks on fences.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitForGPUFences@, defined at @SDL3\/SDL_gpu.h 4442:34@
waitForGPUFencesSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> Bool
  -- ^
  --
  --           [@wait_all@]: if 0, wait for any fence to be signaled, if 1, wait for all fences to be signaled.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUFence)
  -- ^
  --
  --           [@fences@]: an array of fences to wait on.
  -> BG.Word32
  -- ^
  --
  --           [@num_fences@]: the number of fences in the fences array.
  -> IO Bool
waitForGPUFencesSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_WaitForGPUFences x00 (CBool.fromBool x11) x22 (Coerce.coerce x33))

-- | Checks the status of a fence.
--
--     [Returns]: true if the fence is signaled, false if it is not.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBufferAndAcquireFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_QueryGPUFence@.
--                   The safe flavor is 'queryGPUFenceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_QueryGPUFence@, defined at @SDL3\/SDL_gpu.h 4459:34@
queryGPUFence
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUFence
  -- ^
  --
  --           [@fence@]: a fence.
  -> IO Bool
queryGPUFence =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_QueryGPUFence x00 x11)

-- | Checks the status of a fence.
--
--     [Returns]: true if the fence is signaled, false if it is not.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBufferAndAcquireFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_QueryGPUFence@.
--                   The unsafe flavor is 'queryGPUFence'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_QueryGPUFence@, defined at @SDL3\/SDL_gpu.h 4459:34@
queryGPUFenceSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUFence
  -- ^
  --
  --           [@fence@]: a fence.
  -> IO Bool
queryGPUFenceSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_QueryGPUFence x00 x11)

-- | Releases a fence obtained from 'submitGPUCommandBufferAndAcquireFence'.
--
--     You must not reference the fence after calling this function.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBufferAndAcquireFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReleaseGPUFence@.
--                   The safe flavor is 'releaseGPUFenceSafe'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUFence@, defined at @SDL3\/SDL_gpu.h 4475:34@
releaseGPUFence
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUFence
  -- ^
  --
  --           [@fence@]: a fence.
  -> IO ()
releaseGPUFence = Unsafe.sDL_ReleaseGPUFence

-- | Releases a fence obtained from 'submitGPUCommandBufferAndAcquireFence'.
--
--     You must not reference the fence after calling this function.
--
--     @since 3.2.0
--
--     [See also]: 'submitGPUCommandBufferAndAcquireFence'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReleaseGPUFence@.
--                   The unsafe flavor is 'releaseGPUFence'
--                   .
--
--     [C declaration]: @SDL_ReleaseGPUFence@, defined at @SDL3\/SDL_gpu.h 4475:34@
releaseGPUFenceSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUFence
  -- ^
  --
  --           [@fence@]: a fence.
  -> IO ()
releaseGPUFenceSafe = Safe.sDL_ReleaseGPUFence

-- | Obtains the texel block size for a texture format.
--
--     [Returns]: the texel block size of the texture format.
--
--     @since 3.2.0
--
--     [See also]: 'uploadToGPUTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GPUTextureFormatTexelBlockSize@.
--                   The safe flavor is 'gpuTextureFormatTexelBlockSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUTextureFormatTexelBlockSize@, defined at @SDL3\/SDL_gpu.h 4491:36@
gpuTextureFormatTexelBlockSize
  :: SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: the texture format you want to know the texel size of.
  -> IO BG.Word32
gpuTextureFormatTexelBlockSize =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GPUTextureFormatTexelBlockSize x00)

-- | Obtains the texel block size for a texture format.
--
--     [Returns]: the texel block size of the texture format.
--
--     @since 3.2.0
--
--     [See also]: 'uploadToGPUTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GPUTextureFormatTexelBlockSize@.
--                   The unsafe flavor is 'gpuTextureFormatTexelBlockSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUTextureFormatTexelBlockSize@, defined at @SDL3\/SDL_gpu.h 4491:36@
gpuTextureFormatTexelBlockSizeSafe
  :: SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: the texture format you want to know the texel size of.
  -> IO BG.Word32
gpuTextureFormatTexelBlockSizeSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GPUTextureFormatTexelBlockSize x00)

-- | Determines whether a texture format is supported for a given type and usage.
--
--     [Returns]: whether the texture format is supported for this type and usage.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GPUTextureSupportsFormat@.
--                   The safe flavor is 'gpuTextureSupportsFormatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUTextureSupportsFormat@, defined at @SDL3\/SDL_gpu.h 4506:34@
gpuTextureSupportsFormat
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: the texture format to check.
  -> SDL_GPUTextureType
  -- ^
  --
  --           [@type@]: the type of texture (2D, 3D, Cube).
  -> SDL_GPUTextureUsageFlags
  -- ^
  --
  --           [@usage@]: a bitmask of all usage scenarios to check.
  -> IO Bool
gpuTextureSupportsFormat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_GPUTextureSupportsFormat x00 x11 x22 x33)

-- | Determines whether a texture format is supported for a given type and usage.
--
--     [Returns]: whether the texture format is supported for this type and usage.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GPUTextureSupportsFormat@.
--                   The unsafe flavor is 'gpuTextureSupportsFormat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUTextureSupportsFormat@, defined at @SDL3\/SDL_gpu.h 4506:34@
gpuTextureSupportsFormatSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: the texture format to check.
  -> SDL_GPUTextureType
  -- ^
  --
  --           [@type@]: the type of texture (2D, 3D, Cube).
  -> SDL_GPUTextureUsageFlags
  -- ^
  --
  --           [@usage@]: a bitmask of all usage scenarios to check.
  -> IO Bool
gpuTextureSupportsFormatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_GPUTextureSupportsFormat x00 x11 x22 x33)

-- | Determines if a sample count for a texture format is supported.
--
--     [Returns]: whether the sample count is supported for this texture format.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GPUTextureSupportsSampleCount@.
--                   The safe flavor is 'gpuTextureSupportsSampleCountSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUTextureSupportsSampleCount@, defined at @SDL3\/SDL_gpu.h 4522:34@
gpuTextureSupportsSampleCount
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: the texture format to check.
  -> SDL_GPUSampleCount
  -- ^
  --
  --           [@sample_count@]: the sample count to check.
  -> IO Bool
gpuTextureSupportsSampleCount =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GPUTextureSupportsSampleCount x00 x11 x22)

-- | Determines if a sample count for a texture format is supported.
--
--     [Returns]: whether the sample count is supported for this texture format.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GPUTextureSupportsSampleCount@.
--                   The unsafe flavor is 'gpuTextureSupportsSampleCount'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GPUTextureSupportsSampleCount@, defined at @SDL3\/SDL_gpu.h 4522:34@
gpuTextureSupportsSampleCountSafe
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: the texture format to check.
  -> SDL_GPUSampleCount
  -- ^
  --
  --           [@sample_count@]: the sample count to check.
  -> IO Bool
gpuTextureSupportsSampleCountSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GPUTextureSupportsSampleCount x00 x11 x22)

-- | Calculate the size in bytes of a texture format with dimensions.
--
--     [Returns]: the size of a texture with this format and dimensions.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CalculateGPUTextureFormatSize@.
--                   The safe flavor is 'calculateGPUTextureFormatSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CalculateGPUTextureFormatSize@, defined at @SDL3\/SDL_gpu.h 4538:36@
calculateGPUTextureFormatSize
  :: SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: a texture format.
  -> BG.Word32
  -- ^
  --
  --           [@width@]: width in pixels.
  -> BG.Word32
  -- ^
  --
  --           [@height@]: height in pixels.
  -> BG.Word32
  -- ^
  --
  --           [@depth_or_layer_count@]: depth for 3D textures or layer count otherwise.
  -> IO BG.Word32
calculateGPUTextureFormatSize =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            Coerce.coerce
            ( Unsafe.sDL_CalculateGPUTextureFormatSize
                x00
                (Coerce.coerce x11)
                (Coerce.coerce x22)
                (Coerce.coerce x33)
            )

-- | Calculate the size in bytes of a texture format with dimensions.
--
--     [Returns]: the size of a texture with this format and dimensions.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CalculateGPUTextureFormatSize@.
--                   The unsafe flavor is 'calculateGPUTextureFormatSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CalculateGPUTextureFormatSize@, defined at @SDL3\/SDL_gpu.h 4538:36@
calculateGPUTextureFormatSizeSafe
  :: SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: a texture format.
  -> BG.Word32
  -- ^
  --
  --           [@width@]: width in pixels.
  -> BG.Word32
  -- ^
  --
  --           [@height@]: height in pixels.
  -> BG.Word32
  -- ^
  --
  --           [@depth_or_layer_count@]: depth for 3D textures or layer count otherwise.
  -> IO BG.Word32
calculateGPUTextureFormatSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            Coerce.coerce
            ( Safe.sDL_CalculateGPUTextureFormatSize
                x00
                (Coerce.coerce x11)
                (Coerce.coerce x22)
                (Coerce.coerce x33)
            )

-- | Get the SDL pixel format corresponding to a GPU texture format.
--
--     [Returns]: the corresponding pixel format, or SDL_PIXELFORMAT_UNKNOWN if there is no corresponding pixel format.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPixelFormatFromGPUTextureFormat@.
--                   The safe flavor is 'getPixelFormatFromGPUTextureFormatSafe'
--                   .
--
--     [C declaration]: @SDL_GetPixelFormatFromGPUTextureFormat@, defined at @SDL3\/SDL_gpu.h 4553:45@
getPixelFormatFromGPUTextureFormat
  :: SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: a texture format.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
getPixelFormatFromGPUTextureFormat =
  Unsafe.sDL_GetPixelFormatFromGPUTextureFormat

-- | Get the SDL pixel format corresponding to a GPU texture format.
--
--     [Returns]: the corresponding pixel format, or SDL_PIXELFORMAT_UNKNOWN if there is no corresponding pixel format.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPixelFormatFromGPUTextureFormat@.
--                   The unsafe flavor is 'getPixelFormatFromGPUTextureFormat'
--                   .
--
--     [C declaration]: @SDL_GetPixelFormatFromGPUTextureFormat@, defined at @SDL3\/SDL_gpu.h 4553:45@
getPixelFormatFromGPUTextureFormatSafe
  :: SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: a texture format.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
getPixelFormatFromGPUTextureFormatSafe =
  Safe.sDL_GetPixelFormatFromGPUTextureFormat

-- | Get the GPU texture format corresponding to an SDL pixel format.
--
--     [Returns]: the corresponding GPU texture format, or SDL_GPU_TEXTUREFORMAT_INVALID if there is no corresponding GPU texture format.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGPUTextureFormatFromPixelFormat@.
--                   The safe flavor is 'getGPUTextureFormatFromPixelFormatSafe'
--                   .
--
--     [C declaration]: @SDL_GetGPUTextureFormatFromPixelFormat@, defined at @SDL3\/SDL_gpu.h 4565:50@
getGPUTextureFormatFromPixelFormat
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: a pixel format.
  -> IO SDL_GPUTextureFormat
getGPUTextureFormatFromPixelFormat =
  Unsafe.sDL_GetGPUTextureFormatFromPixelFormat

-- | Get the GPU texture format corresponding to an SDL pixel format.
--
--     [Returns]: the corresponding GPU texture format, or SDL_GPU_TEXTUREFORMAT_INVALID if there is no corresponding GPU texture format.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGPUTextureFormatFromPixelFormat@.
--                   The unsafe flavor is 'getGPUTextureFormatFromPixelFormat'
--                   .
--
--     [C declaration]: @SDL_GetGPUTextureFormatFromPixelFormat@, defined at @SDL3\/SDL_gpu.h 4565:50@
getGPUTextureFormatFromPixelFormatSafe
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: a pixel format.
  -> IO SDL_GPUTextureFormat
getGPUTextureFormatFromPixelFormatSafe =
  Safe.sDL_GetGPUTextureFormatFromPixelFormat

-- | Typed constant for macro @SDL_GPU_BUFFERUSAGE_VERTEX@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_BUFFERUSAGE_VERTEX :: SDL_GPUBufferUsageFlags
pattern SDL_GPU_BUFFERUSAGE_VERTEX = SDL_GPUBufferUsageFlags 0x00000001

-- | Typed constant for macro @SDL_GPU_BUFFERUSAGE_INDEX@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_BUFFERUSAGE_INDEX :: SDL_GPUBufferUsageFlags
pattern SDL_GPU_BUFFERUSAGE_INDEX = SDL_GPUBufferUsageFlags 0x00000002

-- | Typed constant for macro @SDL_GPU_BUFFERUSAGE_INDIRECT@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_BUFFERUSAGE_INDIRECT :: SDL_GPUBufferUsageFlags
pattern SDL_GPU_BUFFERUSAGE_INDIRECT = SDL_GPUBufferUsageFlags 0x00000004

-- | Typed constant for macro @SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ :: SDL_GPUBufferUsageFlags
pattern SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ = SDL_GPUBufferUsageFlags 0x00000008

-- | Typed constant for macro @SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ :: SDL_GPUBufferUsageFlags
pattern SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ = SDL_GPUBufferUsageFlags 0x00000010

-- | Typed constant for macro @SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE :: SDL_GPUBufferUsageFlags
pattern SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE = SDL_GPUBufferUsageFlags 0x00000020

-- | Typed constant for macro @SDL_GPU_COLORCOMPONENT_R@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_COLORCOMPONENT_R :: SDL_GPUColorComponentFlags
pattern SDL_GPU_COLORCOMPONENT_R = SDL_GPUColorComponentFlags 0x01

-- | Typed constant for macro @SDL_GPU_COLORCOMPONENT_G@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_COLORCOMPONENT_G :: SDL_GPUColorComponentFlags
pattern SDL_GPU_COLORCOMPONENT_G = SDL_GPUColorComponentFlags 0x02

-- | Typed constant for macro @SDL_GPU_COLORCOMPONENT_B@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_COLORCOMPONENT_B :: SDL_GPUColorComponentFlags
pattern SDL_GPU_COLORCOMPONENT_B = SDL_GPUColorComponentFlags 0x04

-- | Typed constant for macro @SDL_GPU_COLORCOMPONENT_A@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_COLORCOMPONENT_A :: SDL_GPUColorComponentFlags
pattern SDL_GPU_COLORCOMPONENT_A = SDL_GPUColorComponentFlags 0x08

-- | Typed constant for macro @SDL_GPU_SHADERFORMAT_INVALID@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_SHADERFORMAT_INVALID :: SDL_GPUShaderFormat
pattern SDL_GPU_SHADERFORMAT_INVALID = SDL_GPUShaderFormat 0x00000000

-- | Typed constant for macro @SDL_GPU_SHADERFORMAT_PRIVATE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_SHADERFORMAT_PRIVATE :: SDL_GPUShaderFormat
pattern SDL_GPU_SHADERFORMAT_PRIVATE = SDL_GPUShaderFormat 0x00000001

-- | Typed constant for macro @SDL_GPU_SHADERFORMAT_SPIRV@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_SHADERFORMAT_SPIRV :: SDL_GPUShaderFormat
pattern SDL_GPU_SHADERFORMAT_SPIRV = SDL_GPUShaderFormat 0x00000002

-- | Typed constant for macro @SDL_GPU_SHADERFORMAT_DXBC@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_SHADERFORMAT_DXBC :: SDL_GPUShaderFormat
pattern SDL_GPU_SHADERFORMAT_DXBC = SDL_GPUShaderFormat 0x00000004

-- | Typed constant for macro @SDL_GPU_SHADERFORMAT_DXIL@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_SHADERFORMAT_DXIL :: SDL_GPUShaderFormat
pattern SDL_GPU_SHADERFORMAT_DXIL = SDL_GPUShaderFormat 0x00000008

-- | Typed constant for macro @SDL_GPU_SHADERFORMAT_MSL@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_SHADERFORMAT_MSL :: SDL_GPUShaderFormat
pattern SDL_GPU_SHADERFORMAT_MSL = SDL_GPUShaderFormat 0x00000010

-- | Typed constant for macro @SDL_GPU_SHADERFORMAT_METALLIB@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_SHADERFORMAT_METALLIB :: SDL_GPUShaderFormat
pattern SDL_GPU_SHADERFORMAT_METALLIB = SDL_GPUShaderFormat 0x00000020

-- | Typed constant for macro @SDL_GPU_TEXTUREUSAGE_SAMPLER@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_TEXTUREUSAGE_SAMPLER :: SDL_GPUTextureUsageFlags
pattern SDL_GPU_TEXTUREUSAGE_SAMPLER = SDL_GPUTextureUsageFlags 0x00000001

-- | Typed constant for macro @SDL_GPU_TEXTUREUSAGE_COLOR_TARGET@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_TEXTUREUSAGE_COLOR_TARGET :: SDL_GPUTextureUsageFlags
pattern SDL_GPU_TEXTUREUSAGE_COLOR_TARGET = SDL_GPUTextureUsageFlags 0x00000002

-- | Typed constant for macro @SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET :: SDL_GPUTextureUsageFlags
pattern SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET = SDL_GPUTextureUsageFlags 0x00000004

-- | Typed constant for macro @SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ :: SDL_GPUTextureUsageFlags
pattern SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ = SDL_GPUTextureUsageFlags 0x00000008

-- | Typed constant for macro @SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ :: SDL_GPUTextureUsageFlags
pattern SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ = SDL_GPUTextureUsageFlags 0x00000010

-- | Typed constant for macro @SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE :: SDL_GPUTextureUsageFlags
pattern SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE = SDL_GPUTextureUsageFlags 0x00000020

-- | Typed constant for macro @SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE :: SDL_GPUTextureUsageFlags
pattern SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE = SDL_GPUTextureUsageFlags 0x00000040
