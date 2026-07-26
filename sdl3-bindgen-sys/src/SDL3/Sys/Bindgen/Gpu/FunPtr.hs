{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Gpu.FunPtr (
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GPUSupportsShaderFormats,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GPUSupportsProperties,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CreateGPUDevice,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CreateGPUDeviceWithProperties,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_DestroyGPUDevice,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GetNumGPUDrivers,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GetGPUDriver,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GetGPUDeviceDriver,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GetGPUShaderFormats,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GetGPUDeviceProperties,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CreateGPUComputePipeline,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CreateGPUGraphicsPipeline,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CreateGPUSampler,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CreateGPUShader,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CreateGPUTexture,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CreateGPUBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CreateGPUTransferBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SetGPUBufferName,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SetGPUTextureName,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_InsertGPUDebugLabel,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_PushGPUDebugGroup,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_PopGPUDebugGroup,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ReleaseGPUTexture,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ReleaseGPUSampler,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ReleaseGPUBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ReleaseGPUTransferBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ReleaseGPUComputePipeline,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ReleaseGPUShader,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ReleaseGPUGraphicsPipeline,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_AcquireGPUCommandBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_PushGPUVertexUniformData,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_PushGPUFragmentUniformData,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_PushGPUComputeUniformData,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BeginGPURenderPass,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUGraphicsPipeline,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SetGPUViewport,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SetGPUScissor,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SetGPUBlendConstants,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SetGPUStencilReference,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUVertexBuffers,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUIndexBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUVertexSamplers,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUVertexStorageTextures,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUVertexStorageBuffers,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUFragmentSamplers,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUFragmentStorageTextures,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUFragmentStorageBuffers,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_DrawGPUIndexedPrimitives,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_DrawGPUPrimitives,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_DrawGPUPrimitivesIndirect,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_DrawGPUIndexedPrimitivesIndirect,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_EndGPURenderPass,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BeginGPUComputePass,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUComputePipeline,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUComputeSamplers,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUComputeStorageTextures,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BindGPUComputeStorageBuffers,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_DispatchGPUCompute,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_DispatchGPUComputeIndirect,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_EndGPUComputePass,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_MapGPUTransferBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_UnmapGPUTransferBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BeginGPUCopyPass,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_UploadToGPUTexture,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_UploadToGPUBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CopyGPUTextureToTexture,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CopyGPUBufferToBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_DownloadFromGPUTexture,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_DownloadFromGPUBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_EndGPUCopyPass,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GenerateMipmapsForGPUTexture,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_BlitGPUTexture,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_WindowSupportsGPUSwapchainComposition,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_WindowSupportsGPUPresentMode,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ClaimWindowForGPUDevice,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ReleaseWindowFromGPUDevice,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SetGPUSwapchainParameters,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SetGPUAllowedFramesInFlight,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GetGPUSwapchainTextureFormat,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_AcquireGPUSwapchainTexture,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_WaitForGPUSwapchain,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_WaitAndAcquireGPUSwapchainTexture,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SubmitGPUCommandBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_SubmitGPUCommandBufferAndAcquireFence,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CancelGPUCommandBuffer,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_WaitForGPUIdle,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_WaitForGPUFences,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_QueryGPUFence,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_ReleaseGPUFence,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GPUTextureFormatTexelBlockSize,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GPUTextureSupportsFormat,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GPUTextureSupportsSampleCount,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_CalculateGPUTextureFormatSize,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GetPixelFormatFromGPUTextureFormat,
  SDL3.Sys.Bindgen.Gpu.FunPtr.sDL_GetGPUTextureFormatFromPixelFormat,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Gpu
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Video qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_gpu.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUSupportsShaderFormats */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_730746f3f6b80bd4 (void)) ("
         , "  SDL_GPUShaderFormat arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_GPUSupportsShaderFormats;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUSupportsProperties */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_df6bcb319e7313a0 (void)) ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return &SDL_GPUSupportsProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUDevice */"
         , "__attribute__ ((const))"
         , "SDL_GPUDevice *(*hs_bindgen_5a2c70cfbb51d0a5 (void)) ("
         , "  SDL_GPUShaderFormat arg1,"
         , "  _Bool arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &SDL_CreateGPUDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUDeviceWithProperties */"
         , "__attribute__ ((const))"
         , "SDL_GPUDevice *(*hs_bindgen_e9b4dabe0fdafe0a (void)) ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateGPUDeviceWithProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DestroyGPUDevice */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_3d36d3936e535445 (void)) ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyGPUDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetNumGPUDrivers */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_724c599cc9199701 (void)) (void)"
         , "{"
         , "  return &SDL_GetNumGPUDrivers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUDriver */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_878ed2fb40f693fc (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGPUDriver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUDeviceDriver */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_61e30ecd9dcd6a0d (void)) ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGPUDeviceDriver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUShaderFormats */"
         , "__attribute__ ((const))"
         , "SDL_GPUShaderFormat (*hs_bindgen_1588f64687b7a181 (void)) ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetGPUShaderFormats;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUDeviceProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_d9a18bd5c77f3076 (void)) ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetGPUDeviceProperties;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetGPUDeviceProperties requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUComputePipeline */"
         , "__attribute__ ((const))"
         , "SDL_GPUComputePipeline *(*hs_bindgen_b4882831b991328b (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUComputePipelineCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateGPUComputePipeline;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUGraphicsPipeline */"
         , "__attribute__ ((const))"
         , "SDL_GPUGraphicsPipeline *(*hs_bindgen_6b24737f0e188591 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUGraphicsPipelineCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateGPUGraphicsPipeline;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUSampler */"
         , "__attribute__ ((const))"
         , "SDL_GPUSampler *(*hs_bindgen_d26b045cc9bb0074 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUSamplerCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateGPUSampler;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUShader */"
         , "__attribute__ ((const))"
         , "SDL_GPUShader *(*hs_bindgen_268ad47187462489 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUShaderCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateGPUShader;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUTexture */"
         , "__attribute__ ((const))"
         , "SDL_GPUTexture *(*hs_bindgen_8868d47614851449 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTextureCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateGPUTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUBuffer */"
         , "__attribute__ ((const))"
         , "SDL_GPUBuffer *(*hs_bindgen_0e8ef224f7419576 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUBufferCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateGPUBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUTransferBuffer */"
         , "__attribute__ ((const))"
         , "SDL_GPUTransferBuffer *(*hs_bindgen_d99ca9bfb892bc36 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTransferBufferCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateGPUTransferBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUBufferName */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_ddb180594f35b8be (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUBuffer *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetGPUBufferName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUTextureName */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_8e9612fc267feeaa (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTexture *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetGPUTextureName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_InsertGPUDebugLabel */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_53b6f5854610b06f (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_InsertGPUDebugLabel;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUDebugGroup */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_1ff675bf6c0d06d5 (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_PushGPUDebugGroup;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PopGPUDebugGroup */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_a00c28c817c76943 (void)) ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  return &SDL_PopGPUDebugGroup;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUTexture */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_542853e6548e89bb (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTexture *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseGPUTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUSampler */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_56055ccd136d71a1 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUSampler *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseGPUSampler;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUBuffer */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f8bfa8ea14116360 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUBuffer *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseGPUBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUTransferBuffer */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_14c942c8fbf2f3dc (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTransferBuffer *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseGPUTransferBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUComputePipeline */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_5f269731a3ef8faa (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUComputePipeline *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseGPUComputePipeline;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUShader */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f3e9c0034d2a2db0 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUShader *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseGPUShader;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUGraphicsPipeline */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_29c94f86e013a8af (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUGraphicsPipeline *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseGPUGraphicsPipeline;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_AcquireGPUCommandBuffer */"
         , "__attribute__ ((const))"
         , "SDL_GPUCommandBuffer *(*hs_bindgen_d8255a52c3043feb (void)) ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  return &SDL_AcquireGPUCommandBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUVertexUniformData */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_fd67ffdf6fb8985a (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  Uint32 arg2,"
         , "  void const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_PushGPUVertexUniformData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUFragmentUniformData */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_fee6bedc8b88a7fb (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  Uint32 arg2,"
         , "  void const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_PushGPUFragmentUniformData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUComputeUniformData */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f0981542878473d3 (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  Uint32 arg2,"
         , "  void const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_PushGPUComputeUniformData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BeginGPURenderPass */"
         , "__attribute__ ((const))"
         , "SDL_GPURenderPass *(*hs_bindgen_154c2af06893d306 (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_GPUColorTargetInfo const *arg2,"
         , "  Uint32 arg3,"
         , "  SDL_GPUDepthStencilTargetInfo const *arg4"
         , ")"
         , "{"
         , "  return &SDL_BeginGPURenderPass;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUGraphicsPipeline */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f8d4e69cba96f49a (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUGraphicsPipeline *arg2"
         , ")"
         , "{"
         , "  return &SDL_BindGPUGraphicsPipeline;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUViewport */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_ef13d72a5a37e0cd (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUViewport const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetGPUViewport;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUScissor */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_15e571926b2f0a64 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetGPUScissor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUBlendConstants */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_82c20e8c6db3156f (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_FColor arg2"
         , ")"
         , "{"
         , "  return &SDL_SetGPUBlendConstants;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUStencilReference */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_80029d033dcd3cde (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint8 arg2"
         , ")"
         , "{"
         , "  return &SDL_SetGPUStencilReference;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexBuffers */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_688e80f65b7efc4b (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUBufferBinding const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUVertexBuffers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUIndexBuffer */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_bea706d6a8ba9b69 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUBufferBinding const *arg2,"
         , "  SDL_GPUIndexElementSize arg3"
         , ")"
         , "{"
         , "  return &SDL_BindGPUIndexBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexSamplers */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_aaec001b714f4f20 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTextureSamplerBinding const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUVertexSamplers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexStorageTextures */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f3926e087d94d216 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTexture *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUVertexStorageTextures;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexStorageBuffers */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_0441f25c46dc0237 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUBuffer *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUVertexStorageBuffers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUFragmentSamplers */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_31e74f680706f272 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTextureSamplerBinding const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUFragmentSamplers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUFragmentStorageTextures */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_891de4ebe4443cb5 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTexture *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUFragmentStorageTextures;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUFragmentStorageBuffers */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f0f46723815c3df1 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUBuffer *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUFragmentStorageBuffers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUIndexedPrimitives */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_534a1c06f3f9ed05 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4,"
         , "  Sint32 arg5,"
         , "  Uint32 arg6"
         , ")"
         , "{"
         , "  return &SDL_DrawGPUIndexedPrimitives;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUPrimitives */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b37844ed8f8b5582 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4,"
         , "  Uint32 arg5"
         , ")"
         , "{"
         , "  return &SDL_DrawGPUPrimitives;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUPrimitivesIndirect */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_420bc7bd5da8d431 (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUBuffer *arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_DrawGPUPrimitivesIndirect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUIndexedPrimitivesIndirect */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_8f8e2fe5f315620c (void)) ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUBuffer *arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_DrawGPUIndexedPrimitivesIndirect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_EndGPURenderPass */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d2969701500cfc55 (void)) ("
         , "  SDL_GPURenderPass *arg1"
         , ")"
         , "{"
         , "  return &SDL_EndGPURenderPass;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BeginGPUComputePass */"
         , "__attribute__ ((const))"
         , "SDL_GPUComputePass *(*hs_bindgen_774d008d25b51181 (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_GPUStorageTextureReadWriteBinding const *arg2,"
         , "  Uint32 arg3,"
         , "  SDL_GPUStorageBufferReadWriteBinding const *arg4,"
         , "  Uint32 arg5"
         , ")"
         , "{"
         , "  return &SDL_BeginGPUComputePass;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputePipeline */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_4ad31c9180a8f4c7 (void)) ("
         , "  SDL_GPUComputePass *arg1,"
         , "  SDL_GPUComputePipeline *arg2"
         , ")"
         , "{"
         , "  return &SDL_BindGPUComputePipeline;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputeSamplers */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_29656bc1e0885584 (void)) ("
         , "  SDL_GPUComputePass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTextureSamplerBinding const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUComputeSamplers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputeStorageTextures */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_01575e615d9f9179 (void)) ("
         , "  SDL_GPUComputePass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTexture *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUComputeStorageTextures;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputeStorageBuffers */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_589adbdedcb7e5de (void)) ("
         , "  SDL_GPUComputePass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUBuffer *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_BindGPUComputeStorageBuffers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DispatchGPUCompute */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_050145c7c0eda2a0 (void)) ("
         , "  SDL_GPUComputePass *arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_DispatchGPUCompute;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DispatchGPUComputeIndirect */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_6eed39e21086610c (void)) ("
         , "  SDL_GPUComputePass *arg1,"
         , "  SDL_GPUBuffer *arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_DispatchGPUComputeIndirect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_EndGPUComputePass */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_3d69c010dbe2273d (void)) ("
         , "  SDL_GPUComputePass *arg1"
         , ")"
         , "{"
         , "  return &SDL_EndGPUComputePass;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_MapGPUTransferBuffer */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_683b5935cd3f5940 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTransferBuffer *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_MapGPUTransferBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_UnmapGPUTransferBuffer */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_e33fd3a1127b2473 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTransferBuffer *arg2"
         , ")"
         , "{"
         , "  return &SDL_UnmapGPUTransferBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BeginGPUCopyPass */"
         , "__attribute__ ((const))"
         , "SDL_GPUCopyPass *(*hs_bindgen_26ebd2bad4c071ad (void)) ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  return &SDL_BeginGPUCopyPass;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_UploadToGPUTexture */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_ab0f032d9686e81d (void)) ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUTextureTransferInfo const *arg2,"
         , "  SDL_GPUTextureRegion const *arg3,"
         , "  _Bool arg4"
         , ")"
         , "{"
         , "  return &SDL_UploadToGPUTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_UploadToGPUBuffer */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d5ff839503d8766f (void)) ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUTransferBufferLocation const *arg2,"
         , "  SDL_GPUBufferRegion const *arg3,"
         , "  _Bool arg4"
         , ")"
         , "{"
         , "  return &SDL_UploadToGPUBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CopyGPUTextureToTexture */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_1cd400910067ddd5 (void)) ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUTextureLocation const *arg2,"
         , "  SDL_GPUTextureLocation const *arg3,"
         , "  Uint32 arg4,"
         , "  Uint32 arg5,"
         , "  Uint32 arg6,"
         , "  _Bool arg7"
         , ")"
         , "{"
         , "  return &SDL_CopyGPUTextureToTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CopyGPUBufferToBuffer */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f1c8dff3576eacd7 (void)) ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUBufferLocation const *arg2,"
         , "  SDL_GPUBufferLocation const *arg3,"
         , "  Uint32 arg4,"
         , "  _Bool arg5"
         , ")"
         , "{"
         , "  return &SDL_CopyGPUBufferToBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DownloadFromGPUTexture */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_de2075aa3b528189 (void)) ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUTextureRegion const *arg2,"
         , "  SDL_GPUTextureTransferInfo const *arg3"
         , ")"
         , "{"
         , "  return &SDL_DownloadFromGPUTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DownloadFromGPUBuffer */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_ba4b40201f2134bd (void)) ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUBufferRegion const *arg2,"
         , "  SDL_GPUTransferBufferLocation const *arg3"
         , ")"
         , "{"
         , "  return &SDL_DownloadFromGPUBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_EndGPUCopyPass */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b4b5fc61adee338e (void)) ("
         , "  SDL_GPUCopyPass *arg1"
         , ")"
         , "{"
         , "  return &SDL_EndGPUCopyPass;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GenerateMipmapsForGPUTexture */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_9678149e861907fc (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_GPUTexture *arg2"
         , ")"
         , "{"
         , "  return &SDL_GenerateMipmapsForGPUTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BlitGPUTexture */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_7f45139e78bf4f56 (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_GPUBlitInfo const *arg2"
         , ")"
         , "{"
         , "  return &SDL_BlitGPUTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WindowSupportsGPUSwapchainComposition */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c59f48ad030d3274 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUSwapchainComposition arg3"
         , ")"
         , "{"
         , "  return &SDL_WindowSupportsGPUSwapchainComposition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WindowSupportsGPUPresentMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_bf576ab13c340f27 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUPresentMode arg3"
         , ")"
         , "{"
         , "  return &SDL_WindowSupportsGPUPresentMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ClaimWindowForGPUDevice */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4ecaa5beccefec7a (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return &SDL_ClaimWindowForGPUDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseWindowFromGPUDevice */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_196ff3ee33dc8751 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseWindowFromGPUDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUSwapchainParameters */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_31ee67753f7ce365 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUSwapchainComposition arg3,"
         , "  SDL_GPUPresentMode arg4"
         , ")"
         , "{"
         , "  return &SDL_SetGPUSwapchainParameters;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUAllowedFramesInFlight */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_cf8859de2d063dde (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_SetGPUAllowedFramesInFlight;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUSwapchainTextureFormat */"
         , "__attribute__ ((const))"
         , "SDL_GPUTextureFormat (*hs_bindgen_2edc1414ddc93ec8 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGPUSwapchainTextureFormat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_AcquireGPUSwapchainTexture */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3683da9bdd7123ad (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUTexture **arg3,"
         , "  Uint32 *arg4,"
         , "  Uint32 *arg5"
         , ")"
         , "{"
         , "  return &SDL_AcquireGPUSwapchainTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitForGPUSwapchain */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ea0675458d59e8d7 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return &SDL_WaitForGPUSwapchain;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitAndAcquireGPUSwapchainTexture */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_bd7e7771ebd38df5 (void)) ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUTexture **arg3,"
         , "  Uint32 *arg4,"
         , "  Uint32 *arg5"
         , ")"
         , "{"
         , "  return &SDL_WaitAndAcquireGPUSwapchainTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SubmitGPUCommandBuffer */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8d4a9ce464622085 (void)) ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  return &SDL_SubmitGPUCommandBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SubmitGPUCommandBufferAndAcquireFence */"
         , "__attribute__ ((const))"
         , "SDL_GPUFence *(*hs_bindgen_093495cd0f5ce3be (void)) ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  return &SDL_SubmitGPUCommandBufferAndAcquireFence;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CancelGPUCommandBuffer */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_83b736c86816e554 (void)) ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  return &SDL_CancelGPUCommandBuffer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitForGPUIdle */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_34c07d40aff698e2 (void)) ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  return &SDL_WaitForGPUIdle;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitForGPUFences */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4cb9d239bc32f759 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  _Bool arg2,"
         , "  SDL_GPUFence *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_WaitForGPUFences;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_QueryGPUFence */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_67c5db65f97a1de0 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUFence *arg2"
         , ")"
         , "{"
         , "  return &SDL_QueryGPUFence;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUFence */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_8f9e7c0ed3e519a2 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUFence *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReleaseGPUFence;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUTextureFormatTexelBlockSize */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_7020eb5f7daa1796 (void)) ("
         , "  SDL_GPUTextureFormat arg1"
         , ")"
         , "{"
         , "  return &SDL_GPUTextureFormatTexelBlockSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUTextureSupportsFormat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3c6e764809d2a384 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTextureFormat arg2,"
         , "  SDL_GPUTextureType arg3,"
         , "  SDL_GPUTextureUsageFlags arg4"
         , ")"
         , "{"
         , "  return &SDL_GPUTextureSupportsFormat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUTextureSupportsSampleCount */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6b69a9c844393ce7 (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTextureFormat arg2,"
         , "  SDL_GPUSampleCount arg3"
         , ")"
         , "{"
         , "  return &SDL_GPUTextureSupportsSampleCount;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CalculateGPUTextureFormatSize */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_fab34fd075b25f9a (void)) ("
         , "  SDL_GPUTextureFormat arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_CalculateGPUTextureFormatSize;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetPixelFormatFromGPUTextureFormat */"
         , "__attribute__ ((const))"
         , "SDL_PixelFormat (*hs_bindgen_8fe9348f3a2816f5 (void)) ("
         , "  SDL_GPUTextureFormat arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetPixelFormatFromGPUTextureFormat;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetPixelFormatFromGPUTextureFormat requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUTextureFormatFromPixelFormat */"
         , "__attribute__ ((const))"
         , "SDL_GPUTextureFormat (*hs_bindgen_372069e59fc19080 (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetGPUTextureFormatFromPixelFormat;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetGPUTextureFormatFromPixelFormat requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUSupportsShaderFormats@
foreign import ccall unsafe "hs_bindgen_730746f3f6b80bd4"
  hs_bindgen_730746f3f6b80bd4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUSupportsShaderFormats@
hs_bindgen_730746f3f6b80bd4
  :: IO (BG.FunPtr (SDL_GPUShaderFormat -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_730746f3f6b80bd4 =
  BG.fromFFIType hs_bindgen_730746f3f6b80bd4_base

{-# NOINLINE sDL_GPUSupportsShaderFormats #-}

-- | Checks for GPU runtime support.
--
--     [@format_flags@]: a bitflag indicating which shader formats the app is able to provide.
--
--     [@name@]: the preferred GPU driver, or NULL to let SDL pick the optimal driver.
--
--     [Returns]: true if supported, false otherwise.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUDevice'
--
--     [C declaration]: @SDL_GPUSupportsShaderFormats@, defined at @SDL3\/SDL_gpu.h 2200:34@
sDL_GPUSupportsShaderFormats
  :: BG.FunPtr (SDL_GPUShaderFormat -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_GPUSupportsShaderFormats =
  BG.unsafePerformIO hs_bindgen_730746f3f6b80bd4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUSupportsProperties@
foreign import ccall unsafe "hs_bindgen_df6bcb319e7313a0"
  hs_bindgen_df6bcb319e7313a0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUSupportsProperties@
hs_bindgen_df6bcb319e7313a0
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO BG.CBool))
hs_bindgen_df6bcb319e7313a0 =
  BG.fromFFIType hs_bindgen_df6bcb319e7313a0_base

{-# NOINLINE sDL_GPUSupportsProperties #-}

-- | Checks for GPU runtime support.
--
--     [@props@]: the properties to use.
--
--     [Returns]: true if supported, false otherwise.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUDeviceWithProperties'
--
--     [C declaration]: @SDL_GPUSupportsProperties@, defined at @SDL3\/SDL_gpu.h 2214:34@
sDL_GPUSupportsProperties :: BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO BG.CBool)
sDL_GPUSupportsProperties =
  BG.unsafePerformIO hs_bindgen_df6bcb319e7313a0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUDevice@
foreign import ccall unsafe "hs_bindgen_5a2c70cfbb51d0a5"
  hs_bindgen_5a2c70cfbb51d0a5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUDevice@
hs_bindgen_5a2c70cfbb51d0a5
  :: IO
       ( BG.FunPtr
           (SDL_GPUShaderFormat -> BG.CBool -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_GPUDevice))
       )
hs_bindgen_5a2c70cfbb51d0a5 =
  BG.fromFFIType hs_bindgen_5a2c70cfbb51d0a5_base

{-# NOINLINE sDL_CreateGPUDevice #-}

-- | Creates a GPU context.
--
--     The GPU driver name can be one of the following:
--
--     * \"vulkan\": [Vulkan](CategoryGPU#vulkan)
--
--     * \"direct3d12\": [D3D12](CategoryGPU#d3d12)
--
--     * \"metal\": [Metal](CategoryGPU#metal)
--
--     * NULL: let SDL pick the optimal driver
--
--     [@format_flags@]: a bitflag indicating which shader formats the app is able to provide.
--
--     [@debug_mode@]: enable debug mode properties and validations.
--
--     [@name@]: the preferred GPU driver, or NULL to let SDL pick the optimal driver.
--
--     [Returns]: a GPU context on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUDeviceWithProperties', 'sDL_GetGPUShaderFormats', 'sDL_GetGPUDeviceDriver', 'sDL_DestroyGPUDevice', 'sDL_GPUSupportsShaderFormats'
--
--     [C declaration]: @SDL_CreateGPUDevice@, defined at @SDL3\/SDL_gpu.h 2243:45@
sDL_CreateGPUDevice
  :: BG.FunPtr
       (SDL_GPUShaderFormat -> BG.CBool -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_GPUDevice))
sDL_CreateGPUDevice =
  BG.unsafePerformIO hs_bindgen_5a2c70cfbb51d0a5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUDeviceWithProperties@
foreign import ccall unsafe "hs_bindgen_e9b4dabe0fdafe0a"
  hs_bindgen_e9b4dabe0fdafe0a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUDeviceWithProperties@
hs_bindgen_e9b4dabe0fdafe0a
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_GPUDevice)))
hs_bindgen_e9b4dabe0fdafe0a =
  BG.fromFFIType hs_bindgen_e9b4dabe0fdafe0a_base

{-# NOINLINE sDL_CreateGPUDeviceWithProperties #-}

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
--     [@props@]: the properties to use.
--
--     [Returns]: a GPU context on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGPUShaderFormats', 'sDL_GetGPUDeviceDriver', 'sDL_DestroyGPUDevice', 'sDL_GPUSupportsProperties'
--
--     [C declaration]: @SDL_CreateGPUDeviceWithProperties@, defined at @SDL3\/SDL_gpu.h 2360:45@
sDL_CreateGPUDeviceWithProperties
  :: BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_GPUDevice))
sDL_CreateGPUDeviceWithProperties =
  BG.unsafePerformIO hs_bindgen_e9b4dabe0fdafe0a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DestroyGPUDevice@
foreign import ccall unsafe "hs_bindgen_3d36d3936e535445"
  hs_bindgen_3d36d3936e535445_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DestroyGPUDevice@
hs_bindgen_3d36d3936e535445 :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO ()))
hs_bindgen_3d36d3936e535445 =
  BG.fromFFIType hs_bindgen_3d36d3936e535445_base

{-# NOINLINE sDL_DestroyGPUDevice #-}

-- | Destroys a GPU context previously returned by SDL_CreateGPUDevice.
--
--     [@device@]: a GPU Context to destroy.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUDevice'
--
--     [C declaration]: @SDL_DestroyGPUDevice@, defined at @SDL3\/SDL_gpu.h 2422:34@
sDL_DestroyGPUDevice :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO ())
sDL_DestroyGPUDevice =
  BG.unsafePerformIO hs_bindgen_3d36d3936e535445

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetNumGPUDrivers@
foreign import ccall unsafe "hs_bindgen_724c599cc9199701"
  hs_bindgen_724c599cc9199701_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetNumGPUDrivers@
hs_bindgen_724c599cc9199701 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_724c599cc9199701 =
  BG.fromFFIType hs_bindgen_724c599cc9199701_base

{-# NOINLINE sDL_GetNumGPUDrivers #-}

-- | Get the number of GPU drivers compiled into SDL.
--
--     [Returns]: the number of built in GPU drivers.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGPUDriver'
--
--     [C declaration]: @SDL_GetNumGPUDrivers@, defined at @SDL3\/SDL_gpu.h 2433:33@
sDL_GetNumGPUDrivers :: BG.FunPtr (IO BG.CInt)
sDL_GetNumGPUDrivers =
  BG.unsafePerformIO hs_bindgen_724c599cc9199701

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUDriver@
foreign import ccall unsafe "hs_bindgen_878ed2fb40f693fc"
  hs_bindgen_878ed2fb40f693fc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUDriver@
hs_bindgen_878ed2fb40f693fc :: IO (BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_878ed2fb40f693fc =
  BG.fromFFIType hs_bindgen_878ed2fb40f693fc_base

{-# NOINLINE sDL_GetGPUDriver #-}

-- | Get the name of a built in GPU driver.
--
--     The GPU drivers are presented in the order in which they are normally checked during initialization.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"vulkan\", \"metal\" or \"direct3d12\". These never have Unicode characters, and are not meant to be proper names.
--
--     [@index@]: the index of a GPU driver.
--
--     [Returns]: the name of the GPU driver with the given __index__.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumGPUDrivers'
--
--     [C declaration]: @SDL_GetGPUDriver@, defined at @SDL3\/SDL_gpu.h 2452:42@
sDL_GetGPUDriver :: BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGPUDriver =
  BG.unsafePerformIO hs_bindgen_878ed2fb40f693fc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUDeviceDriver@
foreign import ccall unsafe "hs_bindgen_61e30ecd9dcd6a0d"
  hs_bindgen_61e30ecd9dcd6a0d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUDeviceDriver@
hs_bindgen_61e30ecd9dcd6a0d
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_61e30ecd9dcd6a0d =
  BG.fromFFIType hs_bindgen_61e30ecd9dcd6a0d_base

{-# NOINLINE sDL_GetGPUDeviceDriver #-}

-- | Returns the name of the backend used to create this GPU context.
--
--     [@device@]: a GPU context to query.
--
--     [Returns]: the name of the device\'s driver, or NULL on error.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGPUDeviceDriver@, defined at @SDL3\/SDL_gpu.h 2462:42@
sDL_GetGPUDeviceDriver :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetGPUDeviceDriver =
  BG.unsafePerformIO hs_bindgen_61e30ecd9dcd6a0d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUShaderFormats@
foreign import ccall unsafe "hs_bindgen_1588f64687b7a181"
  hs_bindgen_1588f64687b7a181_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUShaderFormats@
hs_bindgen_1588f64687b7a181 :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO SDL_GPUShaderFormat))
hs_bindgen_1588f64687b7a181 =
  BG.fromFFIType hs_bindgen_1588f64687b7a181_base

{-# NOINLINE sDL_GetGPUShaderFormats #-}

-- | Returns the supported shader formats for this GPU context.
--
--     [@device@]: a GPU context to query.
--
--     [Returns]: a bitflag indicating which shader formats the driver is able to consume.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGPUShaderFormats@, defined at @SDL3\/SDL_gpu.h 2473:49@
sDL_GetGPUShaderFormats :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO SDL_GPUShaderFormat)
sDL_GetGPUShaderFormats =
  BG.unsafePerformIO hs_bindgen_1588f64687b7a181

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUDeviceProperties@
foreign import ccall unsafe "hs_bindgen_d9a18bd5c77f3076"
  hs_bindgen_d9a18bd5c77f3076_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUDeviceProperties@
hs_bindgen_d9a18bd5c77f3076
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_d9a18bd5c77f3076 =
  BG.fromFFIType hs_bindgen_d9a18bd5c77f3076_base

{-# NOINLINE sDL_GetGPUDeviceProperties #-}

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
--     [@device@]: a GPU context to query.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetGPUDeviceProperties@, defined at @SDL3\/SDL_gpu.h 2577:46@
sDL_GetGPUDeviceProperties
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetGPUDeviceProperties =
  BG.unsafePerformIO hs_bindgen_d9a18bd5c77f3076

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUComputePipeline@
foreign import ccall unsafe "hs_bindgen_b4882831b991328b"
  hs_bindgen_b4882831b991328b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUComputePipeline@
hs_bindgen_b4882831b991328b
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUDevice
             -> PtrConst.PtrConst SDL_GPUComputePipelineCreateInfo
             -> IO (BG.Ptr SDL_GPUComputePipeline)
           )
       )
hs_bindgen_b4882831b991328b =
  BG.fromFFIType hs_bindgen_b4882831b991328b_base

{-# NOINLINE sDL_CreateGPUComputePipeline #-}

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
--     [@device@]: a GPU Context.
--
--     [@createinfo@]: a struct describing the state of the compute pipeline to create.
--
--     [Returns]: a compute pipeline object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindGPUComputePipeline', 'sDL_ReleaseGPUComputePipeline'
--
--     [C declaration]: @SDL_CreateGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 2632:54@
sDL_CreateGPUComputePipeline
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUDevice
         -> PtrConst.PtrConst SDL_GPUComputePipelineCreateInfo
         -> IO (BG.Ptr SDL_GPUComputePipeline)
       )
sDL_CreateGPUComputePipeline =
  BG.unsafePerformIO hs_bindgen_b4882831b991328b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUGraphicsPipeline@
foreign import ccall unsafe "hs_bindgen_6b24737f0e188591"
  hs_bindgen_6b24737f0e188591_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUGraphicsPipeline@
hs_bindgen_6b24737f0e188591
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUDevice
             -> PtrConst.PtrConst SDL_GPUGraphicsPipelineCreateInfo
             -> IO (BG.Ptr SDL_GPUGraphicsPipeline)
           )
       )
hs_bindgen_6b24737f0e188591 =
  BG.fromFFIType hs_bindgen_6b24737f0e188591_base

{-# NOINLINE sDL_CreateGPUGraphicsPipeline #-}

-- | Creates a pipeline object to be used in a graphics workflow.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [@device@]: a GPU Context.
--
--     [@createinfo@]: a struct describing the state of the graphics pipeline to create.
--
--     [Returns]: a graphics pipeline object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader', 'sDL_BindGPUGraphicsPipeline', 'sDL_ReleaseGPUGraphicsPipeline'
--
--     [C declaration]: @SDL_CreateGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 2659:55@
sDL_CreateGPUGraphicsPipeline
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUDevice
         -> PtrConst.PtrConst SDL_GPUGraphicsPipelineCreateInfo
         -> IO (BG.Ptr SDL_GPUGraphicsPipeline)
       )
sDL_CreateGPUGraphicsPipeline =
  BG.unsafePerformIO hs_bindgen_6b24737f0e188591

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUSampler@
foreign import ccall unsafe "hs_bindgen_d26b045cc9bb0074"
  hs_bindgen_d26b045cc9bb0074_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUSampler@
hs_bindgen_d26b045cc9bb0074
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_GPUDevice -> PtrConst.PtrConst SDL_GPUSamplerCreateInfo -> IO (BG.Ptr SDL_GPUSampler))
       )
hs_bindgen_d26b045cc9bb0074 =
  BG.fromFFIType hs_bindgen_d26b045cc9bb0074_base

{-# NOINLINE sDL_CreateGPUSampler #-}

-- | Creates a sampler object to be used when binding textures in a graphics workflow.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [@device@]: a GPU Context.
--
--     [@createinfo@]: a struct describing the state of the sampler to create.
--
--     [Returns]: a sampler object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindGPUVertexSamplers', 'sDL_BindGPUFragmentSamplers', 'sDL_ReleaseGPUSampler'
--
--     [C declaration]: @SDL_CreateGPUSampler@, defined at @SDL3\/SDL_gpu.h 2686:46@
sDL_CreateGPUSampler
  :: BG.FunPtr
       (BG.Ptr SDL_GPUDevice -> PtrConst.PtrConst SDL_GPUSamplerCreateInfo -> IO (BG.Ptr SDL_GPUSampler))
sDL_CreateGPUSampler =
  BG.unsafePerformIO hs_bindgen_d26b045cc9bb0074

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUShader@
foreign import ccall unsafe "hs_bindgen_268ad47187462489"
  hs_bindgen_268ad47187462489_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUShader@
hs_bindgen_268ad47187462489
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_GPUDevice -> PtrConst.PtrConst SDL_GPUShaderCreateInfo -> IO (BG.Ptr SDL_GPUShader))
       )
hs_bindgen_268ad47187462489 =
  BG.fromFFIType hs_bindgen_268ad47187462489_base

{-# NOINLINE sDL_CreateGPUShader #-}

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
--     Shader semantics other than system-value semantics do not matter in D3D12 and for ease of use the SDL implementation assumes that non system-value semantics will all be TEXCOORD. If you are using HLSL as the shader source language, your vertex semantics should start at TEXCOORD0 and increment like so: TEXCOORD1, TEXCOORD2, etc. If you wish to change the semantic prefix to something other than TEXCOORD you can use SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING with @SDL_CreateGPUDeviceWithProperties()@.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_SHADER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [@device@]: a GPU Context.
--
--     [@createinfo@]: a struct describing the state of the shader to create.
--
--     [Returns]: a shader object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline', 'sDL_ReleaseGPUShader'
--
--     [C declaration]: @SDL_CreateGPUShader@, defined at @SDL3\/SDL_gpu.h 2765:45@
sDL_CreateGPUShader
  :: BG.FunPtr
       (BG.Ptr SDL_GPUDevice -> PtrConst.PtrConst SDL_GPUShaderCreateInfo -> IO (BG.Ptr SDL_GPUShader))
sDL_CreateGPUShader =
  BG.unsafePerformIO hs_bindgen_268ad47187462489

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUTexture@
foreign import ccall unsafe "hs_bindgen_8868d47614851449"
  hs_bindgen_8868d47614851449_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUTexture@
hs_bindgen_8868d47614851449
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_GPUDevice -> PtrConst.PtrConst SDL_GPUTextureCreateInfo -> IO (BG.Ptr SDL_GPUTexture))
       )
hs_bindgen_8868d47614851449 =
  BG.fromFFIType hs_bindgen_8868d47614851449_base

{-# NOINLINE sDL_CreateGPUTexture #-}

-- | Creates a texture object to be used in graphics or compute workflows.
--
--     The contents of this texture are undefined until data is written to the texture, either via SDL_UploadToGPUTexture or by performing a render or compute pass with this texture as a target.
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
--     [@device@]: a GPU Context.
--
--     [@createinfo@]: a struct describing the state of the texture to create.
--
--     [Returns]: a texture object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUTexture', 'sDL_DownloadFromGPUTexture', 'sDL_BeginGPURenderPass', 'sDL_BeginGPUComputePass', 'sDL_BindGPUVertexSamplers', 'sDL_BindGPUVertexStorageTextures', 'sDL_BindGPUFragmentSamplers', 'sDL_BindGPUFragmentStorageTextures', 'sDL_BindGPUComputeStorageTextures', 'sDL_BlitGPUTexture', 'sDL_ReleaseGPUTexture', 'sDL_GPUTextureSupportsFormat'
--
--     [C declaration]: @SDL_CreateGPUTexture@, defined at @SDL3\/SDL_gpu.h 2829:46@
sDL_CreateGPUTexture
  :: BG.FunPtr
       (BG.Ptr SDL_GPUDevice -> PtrConst.PtrConst SDL_GPUTextureCreateInfo -> IO (BG.Ptr SDL_GPUTexture))
sDL_CreateGPUTexture =
  BG.unsafePerformIO hs_bindgen_8868d47614851449

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUBuffer@
foreign import ccall unsafe "hs_bindgen_0e8ef224f7419576"
  hs_bindgen_0e8ef224f7419576_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUBuffer@
hs_bindgen_0e8ef224f7419576
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_GPUDevice -> PtrConst.PtrConst SDL_GPUBufferCreateInfo -> IO (BG.Ptr SDL_GPUBuffer))
       )
hs_bindgen_0e8ef224f7419576 =
  BG.fromFFIType hs_bindgen_0e8ef224f7419576_base

{-# NOINLINE sDL_CreateGPUBuffer #-}

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
--     [@device@]: a GPU Context.
--
--     [@createinfo@]: a struct describing the state of the buffer to create.
--
--     [Returns]: a buffer object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUBuffer', 'sDL_DownloadFromGPUBuffer', 'sDL_CopyGPUBufferToBuffer', 'sDL_BindGPUVertexBuffers', 'sDL_BindGPUIndexBuffer', 'sDL_BindGPUVertexStorageBuffers', 'sDL_BindGPUFragmentStorageBuffers', 'sDL_DrawGPUPrimitivesIndirect', 'sDL_DrawGPUIndexedPrimitivesIndirect', 'sDL_BindGPUComputeStorageBuffers', 'sDL_DispatchGPUComputeIndirect', 'sDL_ReleaseGPUBuffer'
--
--     [C declaration]: @SDL_CreateGPUBuffer@, defined at @SDL3\/SDL_gpu.h 2885:45@
sDL_CreateGPUBuffer
  :: BG.FunPtr
       (BG.Ptr SDL_GPUDevice -> PtrConst.PtrConst SDL_GPUBufferCreateInfo -> IO (BG.Ptr SDL_GPUBuffer))
sDL_CreateGPUBuffer =
  BG.unsafePerformIO hs_bindgen_0e8ef224f7419576

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUTransferBuffer@
foreign import ccall unsafe "hs_bindgen_d99ca9bfb892bc36"
  hs_bindgen_d99ca9bfb892bc36_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CreateGPUTransferBuffer@
hs_bindgen_d99ca9bfb892bc36
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUDevice
             -> PtrConst.PtrConst SDL_GPUTransferBufferCreateInfo
             -> IO (BG.Ptr SDL_GPUTransferBuffer)
           )
       )
hs_bindgen_d99ca9bfb892bc36 =
  BG.fromFFIType hs_bindgen_d99ca9bfb892bc36_base

{-# NOINLINE sDL_CreateGPUTransferBuffer #-}

-- | Creates a transfer buffer to be used when uploading to or downloading from graphics resources.
--
--     Download buffers can be particularly expensive to create, so it is good practice to reuse them if data will be downloaded regularly.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [@device@]: a GPU Context.
--
--     [@createinfo@]: a struct describing the state of the transfer buffer to create.
--
--     [Returns]: a transfer buffer on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUBuffer', 'sDL_DownloadFromGPUBuffer', 'sDL_UploadToGPUTexture', 'sDL_DownloadFromGPUTexture', 'sDL_ReleaseGPUTransferBuffer'
--
--     [C declaration]: @SDL_CreateGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 2918:53@
sDL_CreateGPUTransferBuffer
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUDevice
         -> PtrConst.PtrConst SDL_GPUTransferBufferCreateInfo
         -> IO (BG.Ptr SDL_GPUTransferBuffer)
       )
sDL_CreateGPUTransferBuffer =
  BG.unsafePerformIO hs_bindgen_d99ca9bfb892bc36

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUBufferName@
foreign import ccall unsafe "hs_bindgen_ddb180594f35b8be"
  hs_bindgen_ddb180594f35b8be_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUBufferName@
hs_bindgen_ddb180594f35b8be
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUBuffer -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_ddb180594f35b8be =
  BG.fromFFIType hs_bindgen_ddb180594f35b8be_base

{-# NOINLINE sDL_SetGPUBufferName #-}

-- | Sets an arbitrary string constant to label a buffer.
--
--     You should use SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING with SDL_CreateGPUBuffer instead of this function to avoid thread safety issues.
--
--     [@device@]: a GPU Context.
--
--     [@buffer@]: a buffer to attach the name to.
--
--     [@text@]: a UTF-8 string constant to mark as the name of the buffer.
--
--     [Thread safety]: This function is not thread safe, you must make sure the buffer is not simultaneously used by any other thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUBuffer'
--
--     [C declaration]: @SDL_SetGPUBufferName@, defined at @SDL3\/SDL_gpu.h 2943:34@
sDL_SetGPUBufferName
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUBuffer -> PtrConst.PtrConst BG.CChar -> IO ())
sDL_SetGPUBufferName =
  BG.unsafePerformIO hs_bindgen_ddb180594f35b8be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUTextureName@
foreign import ccall unsafe "hs_bindgen_8e9612fc267feeaa"
  hs_bindgen_8e9612fc267feeaa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUTextureName@
hs_bindgen_8e9612fc267feeaa
  :: IO
       (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTexture -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_8e9612fc267feeaa =
  BG.fromFFIType hs_bindgen_8e9612fc267feeaa_base

{-# NOINLINE sDL_SetGPUTextureName #-}

-- | Sets an arbitrary string constant to label a texture.
--
--     You should use SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING with SDL_CreateGPUTexture instead of this function to avoid thread safety issues.
--
--     [@device@]: a GPU Context.
--
--     [@texture@]: a texture to attach the name to.
--
--     [@text@]: a UTF-8 string constant to mark as the name of the texture.
--
--     [Thread safety]: This function is not thread safe, you must make sure the texture is not simultaneously used by any other thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTexture'
--
--     [C declaration]: @SDL_SetGPUTextureName@, defined at @SDL3\/SDL_gpu.h 2966:34@
sDL_SetGPUTextureName
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTexture -> PtrConst.PtrConst BG.CChar -> IO ())
sDL_SetGPUTextureName =
  BG.unsafePerformIO hs_bindgen_8e9612fc267feeaa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_InsertGPUDebugLabel@
foreign import ccall unsafe "hs_bindgen_53b6f5854610b06f"
  hs_bindgen_53b6f5854610b06f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_InsertGPUDebugLabel@
hs_bindgen_53b6f5854610b06f
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_53b6f5854610b06f =
  BG.fromFFIType hs_bindgen_53b6f5854610b06f_base

{-# NOINLINE sDL_InsertGPUDebugLabel #-}

-- | Inserts an arbitrary string label into the command buffer callstream.
--
--     Useful for debugging.
--
--     On Direct3D 12, using SDL_InsertGPUDebugLabel requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     [@command_buffer@]: a command buffer.
--
--     [@text@]: a UTF-8 string constant to insert as the label.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_InsertGPUDebugLabel@, defined at @SDL3\/SDL_gpu.h 2987:34@
sDL_InsertGPUDebugLabel
  :: BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> PtrConst.PtrConst BG.CChar -> IO ())
sDL_InsertGPUDebugLabel =
  BG.unsafePerformIO hs_bindgen_53b6f5854610b06f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUDebugGroup@
foreign import ccall unsafe "hs_bindgen_1ff675bf6c0d06d5"
  hs_bindgen_1ff675bf6c0d06d5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUDebugGroup@
hs_bindgen_1ff675bf6c0d06d5
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> PtrConst.PtrConst BG.CChar -> IO ()))
hs_bindgen_1ff675bf6c0d06d5 =
  BG.fromFFIType hs_bindgen_1ff675bf6c0d06d5_base

{-# NOINLINE sDL_PushGPUDebugGroup #-}

-- | Begins a debug group with an arbitrary name.
--
--     Used for denoting groups of calls when viewing the command buffer callstream in a graphics debugging tool.
--
--     Each call to SDL_PushGPUDebugGroup must have a corresponding call to SDL_PopGPUDebugGroup.
--
--     On Direct3D 12, using SDL_PushGPUDebugGroup requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     On some backends (e.g. Metal), pushing a debug group during a render\/blit\/compute pass will create a group that is scoped to the native pass rather than the command buffer. For best results, if you push a debug group during a pass, always pop it in the same pass.
--
--     [@command_buffer@]: a command buffer.
--
--     [@name@]: a UTF-8 string constant that names the group.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PopGPUDebugGroup'
--
--     [C declaration]: @SDL_PushGPUDebugGroup@, defined at @SDL3\/SDL_gpu.h 3017:34@
sDL_PushGPUDebugGroup
  :: BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> PtrConst.PtrConst BG.CChar -> IO ())
sDL_PushGPUDebugGroup =
  BG.unsafePerformIO hs_bindgen_1ff675bf6c0d06d5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PopGPUDebugGroup@
foreign import ccall unsafe "hs_bindgen_a00c28c817c76943"
  hs_bindgen_a00c28c817c76943_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PopGPUDebugGroup@
hs_bindgen_a00c28c817c76943 :: IO (BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO ()))
hs_bindgen_a00c28c817c76943 =
  BG.fromFFIType hs_bindgen_a00c28c817c76943_base

{-# NOINLINE sDL_PopGPUDebugGroup #-}

-- | Ends the most-recently pushed debug group.
--
--     On Direct3D 12, using SDL_PopGPUDebugGroup requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     [@command_buffer@]: a command buffer.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PushGPUDebugGroup'
--
--     [C declaration]: @SDL_PopGPUDebugGroup@, defined at @SDL3\/SDL_gpu.h 3035:34@
sDL_PopGPUDebugGroup :: BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO ())
sDL_PopGPUDebugGroup =
  BG.unsafePerformIO hs_bindgen_a00c28c817c76943

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUTexture@
foreign import ccall unsafe "hs_bindgen_542853e6548e89bb"
  hs_bindgen_542853e6548e89bb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUTexture@
hs_bindgen_542853e6548e89bb
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTexture -> IO ()))
hs_bindgen_542853e6548e89bb =
  BG.fromFFIType hs_bindgen_542853e6548e89bb_base

{-# NOINLINE sDL_ReleaseGPUTexture #-}

-- | Frees the given texture as soon as it is safe to do so.
--
--     You must not reference the texture after calling this function.
--
--     [@device@]: a GPU context.
--
--     [@texture@]: a texture to be destroyed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUTexture@, defined at @SDL3\/SDL_gpu.h 3050:34@
sDL_ReleaseGPUTexture :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTexture -> IO ())
sDL_ReleaseGPUTexture =
  BG.unsafePerformIO hs_bindgen_542853e6548e89bb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUSampler@
foreign import ccall unsafe "hs_bindgen_56055ccd136d71a1"
  hs_bindgen_56055ccd136d71a1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUSampler@
hs_bindgen_56055ccd136d71a1
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUSampler -> IO ()))
hs_bindgen_56055ccd136d71a1 =
  BG.fromFFIType hs_bindgen_56055ccd136d71a1_base

{-# NOINLINE sDL_ReleaseGPUSampler #-}

-- | Frees the given sampler as soon as it is safe to do so.
--
--     You must not reference the sampler after calling this function.
--
--     [@device@]: a GPU context.
--
--     [@sampler@]: a sampler to be destroyed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUSampler@, defined at @SDL3\/SDL_gpu.h 3064:34@
sDL_ReleaseGPUSampler :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUSampler -> IO ())
sDL_ReleaseGPUSampler =
  BG.unsafePerformIO hs_bindgen_56055ccd136d71a1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUBuffer@
foreign import ccall unsafe "hs_bindgen_f8bfa8ea14116360"
  hs_bindgen_f8bfa8ea14116360_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUBuffer@
hs_bindgen_f8bfa8ea14116360
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUBuffer -> IO ()))
hs_bindgen_f8bfa8ea14116360 =
  BG.fromFFIType hs_bindgen_f8bfa8ea14116360_base

{-# NOINLINE sDL_ReleaseGPUBuffer #-}

-- | Frees the given buffer as soon as it is safe to do so.
--
--     You must not reference the buffer after calling this function.
--
--     [@device@]: a GPU context.
--
--     [@buffer@]: a buffer to be destroyed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUBuffer@, defined at @SDL3\/SDL_gpu.h 3078:34@
sDL_ReleaseGPUBuffer :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUBuffer -> IO ())
sDL_ReleaseGPUBuffer =
  BG.unsafePerformIO hs_bindgen_f8bfa8ea14116360

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUTransferBuffer@
foreign import ccall unsafe "hs_bindgen_14c942c8fbf2f3dc"
  hs_bindgen_14c942c8fbf2f3dc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUTransferBuffer@
hs_bindgen_14c942c8fbf2f3dc
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTransferBuffer -> IO ()))
hs_bindgen_14c942c8fbf2f3dc =
  BG.fromFFIType hs_bindgen_14c942c8fbf2f3dc_base

{-# NOINLINE sDL_ReleaseGPUTransferBuffer #-}

-- | Frees the given transfer buffer as soon as it is safe to do so.
--
--     You must not reference the transfer buffer after calling this function.
--
--     [@device@]: a GPU context.
--
--     [@transfer_buffer@]: a transfer buffer to be destroyed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3092:34@
sDL_ReleaseGPUTransferBuffer
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTransferBuffer -> IO ())
sDL_ReleaseGPUTransferBuffer =
  BG.unsafePerformIO hs_bindgen_14c942c8fbf2f3dc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUComputePipeline@
foreign import ccall unsafe "hs_bindgen_5f269731a3ef8faa"
  hs_bindgen_5f269731a3ef8faa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUComputePipeline@
hs_bindgen_5f269731a3ef8faa
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUComputePipeline -> IO ()))
hs_bindgen_5f269731a3ef8faa =
  BG.fromFFIType hs_bindgen_5f269731a3ef8faa_base

{-# NOINLINE sDL_ReleaseGPUComputePipeline #-}

-- | Frees the given compute pipeline as soon as it is safe to do so.
--
--     You must not reference the compute pipeline after calling this function.
--
--     [@device@]: a GPU context.
--
--     [@compute_pipeline@]: a compute pipeline to be destroyed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 3106:34@
sDL_ReleaseGPUComputePipeline
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUComputePipeline -> IO ())
sDL_ReleaseGPUComputePipeline =
  BG.unsafePerformIO hs_bindgen_5f269731a3ef8faa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUShader@
foreign import ccall unsafe "hs_bindgen_f3e9c0034d2a2db0"
  hs_bindgen_f3e9c0034d2a2db0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUShader@
hs_bindgen_f3e9c0034d2a2db0
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUShader -> IO ()))
hs_bindgen_f3e9c0034d2a2db0 =
  BG.fromFFIType hs_bindgen_f3e9c0034d2a2db0_base

{-# NOINLINE sDL_ReleaseGPUShader #-}

-- | Frees the given shader as soon as it is safe to do so.
--
--     You must not reference the shader after calling this function.
--
--     [@device@]: a GPU context.
--
--     [@shader@]: a shader to be destroyed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUShader@, defined at @SDL3\/SDL_gpu.h 3120:34@
sDL_ReleaseGPUShader :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUShader -> IO ())
sDL_ReleaseGPUShader =
  BG.unsafePerformIO hs_bindgen_f3e9c0034d2a2db0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUGraphicsPipeline@
foreign import ccall unsafe "hs_bindgen_29c94f86e013a8af"
  hs_bindgen_29c94f86e013a8af_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUGraphicsPipeline@
hs_bindgen_29c94f86e013a8af
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUGraphicsPipeline -> IO ()))
hs_bindgen_29c94f86e013a8af =
  BG.fromFFIType hs_bindgen_29c94f86e013a8af_base

{-# NOINLINE sDL_ReleaseGPUGraphicsPipeline #-}

-- | Frees the given graphics pipeline as soon as it is safe to do so.
--
--     You must not reference the graphics pipeline after calling this function.
--
--     [@device@]: a GPU context.
--
--     [@graphics_pipeline@]: a graphics pipeline to be destroyed.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 3134:34@
sDL_ReleaseGPUGraphicsPipeline
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUGraphicsPipeline -> IO ())
sDL_ReleaseGPUGraphicsPipeline =
  BG.unsafePerformIO hs_bindgen_29c94f86e013a8af

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_AcquireGPUCommandBuffer@
foreign import ccall unsafe "hs_bindgen_d8255a52c3043feb"
  hs_bindgen_d8255a52c3043feb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_AcquireGPUCommandBuffer@
hs_bindgen_d8255a52c3043feb
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO (BG.Ptr SDL_GPUCommandBuffer)))
hs_bindgen_d8255a52c3043feb =
  BG.fromFFIType hs_bindgen_d8255a52c3043feb_base

{-# NOINLINE sDL_AcquireGPUCommandBuffer #-}

-- | Acquire a command buffer.
--
--     This command buffer is managed by the implementation and should not be freed by the user. The command buffer may only be used on the thread it was acquired on. The command buffer should be submitted on the thread it was acquired on.
--
--     It is valid to acquire multiple command buffers on the same thread at once. In fact a common design pattern is to acquire two command buffers per frame where one is dedicated to render and compute passes and the other is dedicated to copy passes and other preparatory work such as generating mipmaps. Interleaving commands between the two command buffers reduces the total amount of passes overall which improves rendering performance.
--
--     [@device@]: a GPU context.
--
--     [Returns]: a command buffer, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBuffer', 'sDL_SubmitGPUCommandBufferAndAcquireFence'
--
--     [C declaration]: @SDL_AcquireGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 3162:52@
sDL_AcquireGPUCommandBuffer :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO (BG.Ptr SDL_GPUCommandBuffer))
sDL_AcquireGPUCommandBuffer =
  BG.unsafePerformIO hs_bindgen_d8255a52c3043feb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUVertexUniformData@
foreign import ccall unsafe "hs_bindgen_fd67ffdf6fb8985a"
  hs_bindgen_fd67ffdf6fb8985a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUVertexUniformData@
hs_bindgen_fd67ffdf6fb8985a
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCommandBuffer
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_fd67ffdf6fb8985a =
  BG.fromFFIType hs_bindgen_fd67ffdf6fb8985a_base

{-# NOINLINE sDL_PushGPUVertexUniformData #-}

-- | Pushes data to a vertex uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     For detailed information about accessing uniform data from a shader, please refer to SDL_CreateGPUShader.
--
--     [@command_buffer@]: a command buffer.
--
--     [@slot_index@]: the vertex uniform slot to push data to.
--
--     [@data@]: client data to write.
--
--     [@length@]: the length of the data to write.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PushGPUVertexUniformData@, defined at @SDL3\/SDL_gpu.h 3186:34@
sDL_PushGPUVertexUniformData
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCommandBuffer
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst BG.Void
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_PushGPUVertexUniformData =
  BG.unsafePerformIO hs_bindgen_fd67ffdf6fb8985a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUFragmentUniformData@
foreign import ccall unsafe "hs_bindgen_fee6bedc8b88a7fb"
  hs_bindgen_fee6bedc8b88a7fb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUFragmentUniformData@
hs_bindgen_fee6bedc8b88a7fb
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCommandBuffer
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_fee6bedc8b88a7fb =
  BG.fromFFIType hs_bindgen_fee6bedc8b88a7fb_base

{-# NOINLINE sDL_PushGPUFragmentUniformData #-}

-- | Pushes data to a fragment uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     [@command_buffer@]: a command buffer.
--
--     [@slot_index@]: the fragment uniform slot to push data to.
--
--     [@data@]: client data to write.
--
--     [@length@]: the length of the data to write.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PushGPUFragmentUniformData@, defined at @SDL3\/SDL_gpu.h 3208:34@
sDL_PushGPUFragmentUniformData
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCommandBuffer
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst BG.Void
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_PushGPUFragmentUniformData =
  BG.unsafePerformIO hs_bindgen_fee6bedc8b88a7fb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUComputeUniformData@
foreign import ccall unsafe "hs_bindgen_f0981542878473d3"
  hs_bindgen_f0981542878473d3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_PushGPUComputeUniformData@
hs_bindgen_f0981542878473d3
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCommandBuffer
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_f0981542878473d3 =
  BG.fromFFIType hs_bindgen_f0981542878473d3_base

{-# NOINLINE sDL_PushGPUComputeUniformData #-}

-- | Pushes data to a uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     [@command_buffer@]: a command buffer.
--
--     [@slot_index@]: the uniform slot to push data to.
--
--     [@data@]: client data to write.
--
--     [@length@]: the length of the data to write.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PushGPUComputeUniformData@, defined at @SDL3\/SDL_gpu.h 3230:34@
sDL_PushGPUComputeUniformData
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCommandBuffer
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst BG.Void
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_PushGPUComputeUniformData =
  BG.unsafePerformIO hs_bindgen_f0981542878473d3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BeginGPURenderPass@
foreign import ccall unsafe "hs_bindgen_154c2af06893d306"
  hs_bindgen_154c2af06893d306_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BeginGPURenderPass@
hs_bindgen_154c2af06893d306
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCommandBuffer
             -> PtrConst.PtrConst SDL_GPUColorTargetInfo
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst SDL_GPUDepthStencilTargetInfo
             -> IO (BG.Ptr SDL_GPURenderPass)
           )
       )
hs_bindgen_154c2af06893d306 =
  BG.fromFFIType hs_bindgen_154c2af06893d306_base

{-# NOINLINE sDL_BeginGPURenderPass #-}

-- | Begins a render pass on a command buffer.
--
--     A render pass consists of a set of texture subresources (or depth slices in the 3D texture case) which will be rendered to during the render pass, along with corresponding clear values and load\/store operations. All operations related to graphics pipelines must take place inside of a render pass. A default viewport and scissor state are automatically set when this is called. You cannot begin another render pass, or begin a compute pass or copy pass until you have ended the render pass.
--
--     Using SDL_GPU_LOADOP_LOAD before any contents have been written to the texture subresource will result in undefined behavior. SDL_GPU_LOADOP_CLEAR will set the contents of the texture subresource to a single value before any rendering is performed. It\'s fine to do an empty render pass using SDL_GPU_STOREOP_STORE to clear a texture, but in general it\'s better to think of clearing not as an independent operation but as something that\'s done as the beginning of a render pass.
--
--     [@command_buffer@]: a command buffer.
--
--     [@color_target_infos@]: an array of texture subresources with corresponding clear values and load\/store ops.
--
--     [@num_color_targets@]: the number of color targets in the color_target_infos array.
--
--     [@depth_stencil_target_info@]: a texture subresource with corresponding clear value and load\/store ops, may be NULL.
--
--     [Returns]: a render pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EndGPURenderPass'
--
--     [C declaration]: @SDL_BeginGPURenderPass@, defined at @SDL3\/SDL_gpu.h 3271:49@
sDL_BeginGPURenderPass
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCommandBuffer
         -> PtrConst.PtrConst SDL_GPUColorTargetInfo
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst SDL_GPUDepthStencilTargetInfo
         -> IO (BG.Ptr SDL_GPURenderPass)
       )
sDL_BeginGPURenderPass =
  BG.unsafePerformIO hs_bindgen_154c2af06893d306

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUGraphicsPipeline@
foreign import ccall unsafe "hs_bindgen_f8d4e69cba96f49a"
  hs_bindgen_f8d4e69cba96f49a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUGraphicsPipeline@
hs_bindgen_f8d4e69cba96f49a
  :: IO (BG.FunPtr (BG.Ptr SDL_GPURenderPass -> BG.Ptr SDL_GPUGraphicsPipeline -> IO ()))
hs_bindgen_f8d4e69cba96f49a =
  BG.fromFFIType hs_bindgen_f8d4e69cba96f49a_base

{-# NOINLINE sDL_BindGPUGraphicsPipeline #-}

-- | Binds a graphics pipeline on a render pass to be used in rendering.
--
--     A graphics pipeline must be bound before making any draw calls.
--
--     [@render_pass@]: a render pass handle.
--
--     [@graphics_pipeline@]: the graphics pipeline to bind.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BindGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 3287:34@
sDL_BindGPUGraphicsPipeline
  :: BG.FunPtr (BG.Ptr SDL_GPURenderPass -> BG.Ptr SDL_GPUGraphicsPipeline -> IO ())
sDL_BindGPUGraphicsPipeline =
  BG.unsafePerformIO hs_bindgen_f8d4e69cba96f49a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUViewport@
foreign import ccall unsafe "hs_bindgen_ef13d72a5a37e0cd"
  hs_bindgen_ef13d72a5a37e0cd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUViewport@
hs_bindgen_ef13d72a5a37e0cd
  :: IO (BG.FunPtr (BG.Ptr SDL_GPURenderPass -> PtrConst.PtrConst SDL_GPUViewport -> IO ()))
hs_bindgen_ef13d72a5a37e0cd =
  BG.fromFFIType hs_bindgen_ef13d72a5a37e0cd_base

{-# NOINLINE sDL_SetGPUViewport #-}

-- | Sets the current viewport state on a command buffer.
--
--     [@render_pass@]: a render pass handle.
--
--     [@viewport@]: the viewport to set.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetGPUViewport@, defined at @SDL3\/SDL_gpu.h 3299:34@
sDL_SetGPUViewport
  :: BG.FunPtr (BG.Ptr SDL_GPURenderPass -> PtrConst.PtrConst SDL_GPUViewport -> IO ())
sDL_SetGPUViewport =
  BG.unsafePerformIO hs_bindgen_ef13d72a5a37e0cd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUScissor@
foreign import ccall unsafe "hs_bindgen_15e571926b2f0a64"
  hs_bindgen_15e571926b2f0a64_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUScissor@
hs_bindgen_15e571926b2f0a64
  :: IO
       (BG.FunPtr (BG.Ptr SDL_GPURenderPass -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO ()))
hs_bindgen_15e571926b2f0a64 =
  BG.fromFFIType hs_bindgen_15e571926b2f0a64_base

{-# NOINLINE sDL_SetGPUScissor #-}

-- | Sets the current scissor state on a command buffer.
--
--     [@render_pass@]: a render pass handle.
--
--     [@scissor@]: the scissor area to set.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetGPUScissor@, defined at @SDL3\/SDL_gpu.h 3311:34@
sDL_SetGPUScissor
  :: BG.FunPtr (BG.Ptr SDL_GPURenderPass -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO ())
sDL_SetGPUScissor =
  BG.unsafePerformIO hs_bindgen_15e571926b2f0a64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUBlendConstants@
foreign import ccall unsafe "hs_bindgen_82c20e8c6db3156f"
  hs_bindgen_82c20e8c6db3156f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUBlendConstants@
hs_bindgen_82c20e8c6db3156f
  :: IO (BG.FunPtr (BG.Ptr SDL_GPURenderPass -> SDL3.Sys.Bindgen.Pixels.SDL_FColor -> IO ()))
hs_bindgen_82c20e8c6db3156f =
  BG.fromFFIType hs_bindgen_82c20e8c6db3156f_base

{-# NOINLINE sDL_SetGPUBlendConstants #-}

-- | Sets the current blend constants on a command buffer.
--
--     [@render_pass@]: a render pass handle.
--
--     [@blend_constants@]: the blend constant color.
--
--     @since 3.2.0
--
--     [See also]: @SDL_GPU_BLENDFACTOR_CONSTANT_COLOR@, @SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR@
--
--     [C declaration]: @SDL_SetGPUBlendConstants@, defined at @SDL3\/SDL_gpu.h 3326:34@
sDL_SetGPUBlendConstants
  :: BG.FunPtr (BG.Ptr SDL_GPURenderPass -> SDL3.Sys.Bindgen.Pixels.SDL_FColor -> IO ())
sDL_SetGPUBlendConstants =
  BG.unsafePerformIO hs_bindgen_82c20e8c6db3156f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUStencilReference@
foreign import ccall unsafe "hs_bindgen_80029d033dcd3cde"
  hs_bindgen_80029d033dcd3cde_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUStencilReference@
hs_bindgen_80029d033dcd3cde
  :: IO (BG.FunPtr (BG.Ptr SDL_GPURenderPass -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO ()))
hs_bindgen_80029d033dcd3cde =
  BG.fromFFIType hs_bindgen_80029d033dcd3cde_base

{-# NOINLINE sDL_SetGPUStencilReference #-}

-- | Sets the current stencil reference value on a command buffer.
--
--     [@render_pass@]: a render pass handle.
--
--     [@reference@]: the stencil reference value to set.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetGPUStencilReference@, defined at @SDL3\/SDL_gpu.h 3338:34@
sDL_SetGPUStencilReference
  :: BG.FunPtr (BG.Ptr SDL_GPURenderPass -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO ())
sDL_SetGPUStencilReference =
  BG.unsafePerformIO hs_bindgen_80029d033dcd3cde

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexBuffers@
foreign import ccall unsafe "hs_bindgen_688e80f65b7efc4b"
  hs_bindgen_688e80f65b7efc4b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexBuffers@
hs_bindgen_688e80f65b7efc4b
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst SDL_GPUBufferBinding
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_688e80f65b7efc4b =
  BG.fromFFIType hs_bindgen_688e80f65b7efc4b_base

{-# NOINLINE sDL_BindGPUVertexBuffers #-}

-- | Binds vertex buffers on a command buffer for use with subsequent draw calls.
--
--     [@render_pass@]: a render pass handle.
--
--     [@first_slot@]: the vertex buffer slot to begin binding from.
--
--     [@bindings@]: an array of 'SDL_GPUBufferBinding' structs containing vertex buffers and offset values.
--
--     [@num_bindings@]: the number of bindings in the bindings array.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BindGPUVertexBuffers@, defined at @SDL3\/SDL_gpu.h 3354:34@
sDL_BindGPUVertexBuffers
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst SDL_GPUBufferBinding
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUVertexBuffers =
  BG.unsafePerformIO hs_bindgen_688e80f65b7efc4b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUIndexBuffer@
foreign import ccall unsafe "hs_bindgen_bea706d6a8ba9b69"
  hs_bindgen_bea706d6a8ba9b69_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUIndexBuffer@
hs_bindgen_bea706d6a8ba9b69
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> PtrConst.PtrConst SDL_GPUBufferBinding
             -> SDL_GPUIndexElementSize
             -> IO ()
           )
       )
hs_bindgen_bea706d6a8ba9b69 =
  BG.fromFFIType hs_bindgen_bea706d6a8ba9b69_base

{-# NOINLINE sDL_BindGPUIndexBuffer #-}

-- | Binds an index buffer on a command buffer for use with subsequent draw calls.
--
--     [@render_pass@]: a render pass handle.
--
--     [@binding@]: a pointer to a struct containing an index buffer and offset.
--
--     [@index_element_size@]: whether the index values in the buffer are 16- or 32-bit.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BindGPUIndexBuffer@, defined at @SDL3\/SDL_gpu.h 3371:34@
sDL_BindGPUIndexBuffer
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> PtrConst.PtrConst SDL_GPUBufferBinding
         -> SDL_GPUIndexElementSize
         -> IO ()
       )
sDL_BindGPUIndexBuffer =
  BG.unsafePerformIO hs_bindgen_bea706d6a8ba9b69

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexSamplers@
foreign import ccall unsafe "hs_bindgen_aaec001b714f4f20"
  hs_bindgen_aaec001b714f4f20_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexSamplers@
hs_bindgen_aaec001b714f4f20
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_aaec001b714f4f20 =
  BG.fromFFIType hs_bindgen_aaec001b714f4f20_base

{-# NOINLINE sDL_BindGPUVertexSamplers #-}

-- | Binds texture-sampler pairs for use on the vertex shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     [@render_pass@]: a render pass handle.
--
--     [@first_slot@]: the vertex sampler slot to begin binding from.
--
--     [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
--
--     [@num_bindings@]: the number of texture-sampler pairs to bind from the array.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUVertexSamplers@, defined at @SDL3\/SDL_gpu.h 3395:34@
sDL_BindGPUVertexSamplers
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUVertexSamplers =
  BG.unsafePerformIO hs_bindgen_aaec001b714f4f20

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexStorageTextures@
foreign import ccall unsafe "hs_bindgen_f3926e087d94d216"
  hs_bindgen_f3926e087d94d216_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexStorageTextures@
hs_bindgen_f3926e087d94d216
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_f3926e087d94d216 =
  BG.fromFFIType hs_bindgen_f3926e087d94d216_base

{-# NOINLINE sDL_BindGPUVertexStorageTextures #-}

-- | Binds storage textures for use on the vertex shader.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     [@render_pass@]: a render pass handle.
--
--     [@first_slot@]: the vertex storage texture slot to begin binding from.
--
--     [@storage_textures@]: an array of storage textures.
--
--     [@num_bindings@]: the number of storage texture to bind from the array.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUVertexStorageTextures@, defined at @SDL3\/SDL_gpu.h 3419:34@
sDL_BindGPUVertexStorageTextures
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUVertexStorageTextures =
  BG.unsafePerformIO hs_bindgen_f3926e087d94d216

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexStorageBuffers@
foreign import ccall unsafe "hs_bindgen_0441f25c46dc0237"
  hs_bindgen_0441f25c46dc0237_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUVertexStorageBuffers@
hs_bindgen_0441f25c46dc0237
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_0441f25c46dc0237 =
  BG.fromFFIType hs_bindgen_0441f25c46dc0237_base

{-# NOINLINE sDL_BindGPUVertexStorageBuffers #-}

-- | Binds storage buffers for use on the vertex shader.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     [@render_pass@]: a render pass handle.
--
--     [@first_slot@]: the vertex storage buffer slot to begin binding from.
--
--     [@storage_buffers@]: an array of buffers.
--
--     [@num_bindings@]: the number of buffers to bind from the array.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUVertexStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3443:34@
sDL_BindGPUVertexStorageBuffers
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUVertexStorageBuffers =
  BG.unsafePerformIO hs_bindgen_0441f25c46dc0237

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUFragmentSamplers@
foreign import ccall unsafe "hs_bindgen_31e74f680706f272"
  hs_bindgen_31e74f680706f272_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUFragmentSamplers@
hs_bindgen_31e74f680706f272
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_31e74f680706f272 =
  BG.fromFFIType hs_bindgen_31e74f680706f272_base

{-# NOINLINE sDL_BindGPUFragmentSamplers #-}

-- | Binds texture-sampler pairs for use on the fragment shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     [@render_pass@]: a render pass handle.
--
--     [@first_slot@]: the fragment sampler slot to begin binding from.
--
--     [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
--
--     [@num_bindings@]: the number of texture-sampler pairs to bind from the array.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUFragmentSamplers@, defined at @SDL3\/SDL_gpu.h 3468:34@
sDL_BindGPUFragmentSamplers
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUFragmentSamplers =
  BG.unsafePerformIO hs_bindgen_31e74f680706f272

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUFragmentStorageTextures@
foreign import ccall unsafe "hs_bindgen_891de4ebe4443cb5"
  hs_bindgen_891de4ebe4443cb5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUFragmentStorageTextures@
hs_bindgen_891de4ebe4443cb5
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_891de4ebe4443cb5 =
  BG.fromFFIType hs_bindgen_891de4ebe4443cb5_base

{-# NOINLINE sDL_BindGPUFragmentStorageTextures #-}

-- | Binds storage textures for use on the fragment shader.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     [@render_pass@]: a render pass handle.
--
--     [@first_slot@]: the fragment storage texture slot to begin binding from.
--
--     [@storage_textures@]: an array of storage textures.
--
--     [@num_bindings@]: the number of storage textures to bind from the array.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUFragmentStorageTextures@, defined at @SDL3\/SDL_gpu.h 3492:34@
sDL_BindGPUFragmentStorageTextures
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUFragmentStorageTextures =
  BG.unsafePerformIO hs_bindgen_891de4ebe4443cb5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUFragmentStorageBuffers@
foreign import ccall unsafe "hs_bindgen_f0f46723815c3df1"
  hs_bindgen_f0f46723815c3df1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUFragmentStorageBuffers@
hs_bindgen_f0f46723815c3df1
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_f0f46723815c3df1 =
  BG.fromFFIType hs_bindgen_f0f46723815c3df1_base

{-# NOINLINE sDL_BindGPUFragmentStorageBuffers #-}

-- | Binds storage buffers for use on the fragment shader.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     [@render_pass@]: a render pass handle.
--
--     [@first_slot@]: the fragment storage buffer slot to begin binding from.
--
--     [@storage_buffers@]: an array of storage buffers.
--
--     [@num_bindings@]: the number of storage buffers to bind from the array.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUFragmentStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3516:34@
sDL_BindGPUFragmentStorageBuffers
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUFragmentStorageBuffers =
  BG.unsafePerformIO hs_bindgen_f0f46723815c3df1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUIndexedPrimitives@
foreign import ccall unsafe "hs_bindgen_534a1c06f3f9ed05"
  hs_bindgen_534a1c06f3f9ed05_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUIndexedPrimitives@
hs_bindgen_534a1c06f3f9ed05
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Sint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_534a1c06f3f9ed05 =
  BG.fromFFIType hs_bindgen_534a1c06f3f9ed05_base

{-# NOINLINE sDL_DrawGPUIndexedPrimitives #-}

-- | Draws data using bound graphics state with an index buffer and instancing enabled.
--
--     You must not call this function before binding a graphics pipeline.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     [@render_pass@]: a render pass handle.
--
--     [@num_indices@]: the number of indices to draw per instance.
--
--     [@num_instances@]: the number of instances to draw.
--
--     [@first_index@]: the starting index within the index buffer.
--
--     [@vertex_offset@]: value added to vertex index before indexing into the vertex buffer.
--
--     [@first_instance@]: the ID of the first instance to draw.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DrawGPUIndexedPrimitives@, defined at @SDL3\/SDL_gpu.h 3547:34@
sDL_DrawGPUIndexedPrimitives
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Sint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_DrawGPUIndexedPrimitives =
  BG.unsafePerformIO hs_bindgen_534a1c06f3f9ed05

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUPrimitives@
foreign import ccall unsafe "hs_bindgen_b37844ed8f8b5582"
  hs_bindgen_b37844ed8f8b5582_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUPrimitives@
hs_bindgen_b37844ed8f8b5582
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_b37844ed8f8b5582 =
  BG.fromFFIType hs_bindgen_b37844ed8f8b5582_base

{-# NOINLINE sDL_DrawGPUPrimitives #-}

-- | Draws data using bound graphics state.
--
--     You must not call this function before binding a graphics pipeline.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     [@render_pass@]: a render pass handle.
--
--     [@num_vertices@]: the number of vertices to draw.
--
--     [@num_instances@]: the number of instances that will be drawn.
--
--     [@first_vertex@]: the index of the first vertex to draw.
--
--     [@first_instance@]: the ID of the first instance to draw.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DrawGPUPrimitives@, defined at @SDL3\/SDL_gpu.h 3575:34@
sDL_DrawGPUPrimitives
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_DrawGPUPrimitives =
  BG.unsafePerformIO hs_bindgen_b37844ed8f8b5582

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUPrimitivesIndirect@
foreign import ccall unsafe "hs_bindgen_420bc7bd5da8d431"
  hs_bindgen_420bc7bd5da8d431_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUPrimitivesIndirect@
hs_bindgen_420bc7bd5da8d431
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> BG.Ptr SDL_GPUBuffer
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_420bc7bd5da8d431 =
  BG.fromFFIType hs_bindgen_420bc7bd5da8d431_base

{-# NOINLINE sDL_DrawGPUPrimitivesIndirect #-}

-- | Draws data using bound graphics state and with draw parameters set from a buffer.
--
--     The buffer must consist of tightly-packed draw parameter sets that each match the layout of 'SDL_GPUIndirectDrawCommand'. You must not call this function before binding a graphics pipeline.
--
--     [@render_pass@]: a render pass handle.
--
--     [@buffer@]: a buffer containing draw parameters.
--
--     [@offset@]: the offset to start reading from the draw buffer.
--
--     [@draw_count@]: the number of draw parameter sets that should be read from the draw buffer.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DrawGPUPrimitivesIndirect@, defined at @SDL3\/SDL_gpu.h 3598:34@
sDL_DrawGPUPrimitivesIndirect
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> BG.Ptr SDL_GPUBuffer
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_DrawGPUPrimitivesIndirect =
  BG.unsafePerformIO hs_bindgen_420bc7bd5da8d431

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUIndexedPrimitivesIndirect@
foreign import ccall unsafe "hs_bindgen_8f8e2fe5f315620c"
  hs_bindgen_8f8e2fe5f315620c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DrawGPUIndexedPrimitivesIndirect@
hs_bindgen_8f8e2fe5f315620c
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderPass
             -> BG.Ptr SDL_GPUBuffer
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_8f8e2fe5f315620c =
  BG.fromFFIType hs_bindgen_8f8e2fe5f315620c_base

{-# NOINLINE sDL_DrawGPUIndexedPrimitivesIndirect #-}

-- | Draws data using bound graphics state with an index buffer enabled and with draw parameters set from a buffer.
--
--     The buffer must consist of tightly-packed draw parameter sets that each match the layout of 'SDL_GPUIndexedIndirectDrawCommand'. You must not call this function before binding a graphics pipeline.
--
--     [@render_pass@]: a render pass handle.
--
--     [@buffer@]: a buffer containing draw parameters.
--
--     [@offset@]: the offset to start reading from the draw buffer.
--
--     [@draw_count@]: the number of draw parameter sets that should be read from the draw buffer.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DrawGPUIndexedPrimitivesIndirect@, defined at @SDL3\/SDL_gpu.h 3620:34@
sDL_DrawGPUIndexedPrimitivesIndirect
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderPass
         -> BG.Ptr SDL_GPUBuffer
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_DrawGPUIndexedPrimitivesIndirect =
  BG.unsafePerformIO hs_bindgen_8f8e2fe5f315620c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_EndGPURenderPass@
foreign import ccall unsafe "hs_bindgen_d2969701500cfc55"
  hs_bindgen_d2969701500cfc55_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_EndGPURenderPass@
hs_bindgen_d2969701500cfc55 :: IO (BG.FunPtr (BG.Ptr SDL_GPURenderPass -> IO ()))
hs_bindgen_d2969701500cfc55 =
  BG.fromFFIType hs_bindgen_d2969701500cfc55_base

{-# NOINLINE sDL_EndGPURenderPass #-}

-- | Ends the given render pass.
--
--     All bound graphics state on the render pass command buffer is unset. The render pass handle is now invalid.
--
--     [@render_pass@]: a render pass handle.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EndGPURenderPass@, defined at @SDL3\/SDL_gpu.h 3636:34@
sDL_EndGPURenderPass :: BG.FunPtr (BG.Ptr SDL_GPURenderPass -> IO ())
sDL_EndGPURenderPass =
  BG.unsafePerformIO hs_bindgen_d2969701500cfc55

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BeginGPUComputePass@
foreign import ccall unsafe "hs_bindgen_774d008d25b51181"
  hs_bindgen_774d008d25b51181_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BeginGPUComputePass@
hs_bindgen_774d008d25b51181
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCommandBuffer
             -> PtrConst.PtrConst SDL_GPUStorageTextureReadWriteBinding
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst SDL_GPUStorageBufferReadWriteBinding
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO (BG.Ptr SDL_GPUComputePass)
           )
       )
hs_bindgen_774d008d25b51181 =
  BG.fromFFIType hs_bindgen_774d008d25b51181_base

{-# NOINLINE sDL_BeginGPUComputePass #-}

-- | Begins a compute pass on a command buffer.
--
--     A compute pass is defined by a set of texture subresources and buffers that may be written to by compute pipelines. These textures and buffers must have been created with the COMPUTE_STORAGE_WRITE bit or the COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE bit. If you do not create a texture with COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE, you must not read from the texture in the compute pass. All operations related to compute pipelines must take place inside of a compute pass. You must not begin another compute pass, or a render pass or copy pass before ending the compute pass.
--
--     A VERY IMPORTANT NOTE - Reads and writes in compute passes are NOT implicitly synchronized. This means you may cause data races by both reading and writing a resource region in a compute pass, or by writing multiple times to a resource region. If your compute work depends on reading the completed output from a previous dispatch, you MUST end the current compute pass and begin a new one before you can safely access the data. Otherwise you will receive unexpected results. Reading and writing a texture in the same compute pass is only supported by specific texture formats. Make sure you check the format support!
--
--     [@command_buffer@]: a command buffer.
--
--     [@storage_texture_bindings@]: an array of writeable storage texture binding structs.
--
--     [@num_storage_texture_bindings@]: the number of storage textures to bind from the array.
--
--     [@storage_buffer_bindings@]: an array of writeable storage buffer binding structs.
--
--     [@num_storage_buffer_bindings@]: the number of storage buffers to bind from the array.
--
--     [Returns]: a compute pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EndGPUComputePass'
--
--     [C declaration]: @SDL_BeginGPUComputePass@, defined at @SDL3\/SDL_gpu.h 3678:50@
sDL_BeginGPUComputePass
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCommandBuffer
         -> PtrConst.PtrConst SDL_GPUStorageTextureReadWriteBinding
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst SDL_GPUStorageBufferReadWriteBinding
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO (BG.Ptr SDL_GPUComputePass)
       )
sDL_BeginGPUComputePass =
  BG.unsafePerformIO hs_bindgen_774d008d25b51181

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputePipeline@
foreign import ccall unsafe "hs_bindgen_4ad31c9180a8f4c7"
  hs_bindgen_4ad31c9180a8f4c7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputePipeline@
hs_bindgen_4ad31c9180a8f4c7
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUComputePass -> BG.Ptr SDL_GPUComputePipeline -> IO ()))
hs_bindgen_4ad31c9180a8f4c7 =
  BG.fromFFIType hs_bindgen_4ad31c9180a8f4c7_base

{-# NOINLINE sDL_BindGPUComputePipeline #-}

-- | Binds a compute pipeline on a command buffer for use in compute dispatch.
--
--     [@compute_pass@]: a compute pass handle.
--
--     [@compute_pipeline@]: a compute pipeline to bind.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BindGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 3693:34@
sDL_BindGPUComputePipeline
  :: BG.FunPtr (BG.Ptr SDL_GPUComputePass -> BG.Ptr SDL_GPUComputePipeline -> IO ())
sDL_BindGPUComputePipeline =
  BG.unsafePerformIO hs_bindgen_4ad31c9180a8f4c7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputeSamplers@
foreign import ccall unsafe "hs_bindgen_29656bc1e0885584"
  hs_bindgen_29656bc1e0885584_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputeSamplers@
hs_bindgen_29656bc1e0885584
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUComputePass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_29656bc1e0885584 =
  BG.fromFFIType hs_bindgen_29656bc1e0885584_base

{-# NOINLINE sDL_BindGPUComputeSamplers #-}

-- | Binds texture-sampler pairs for use on the compute shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUComputePipeline()@.
--
--     [@compute_pass@]: a compute pass handle.
--
--     [@first_slot@]: the compute sampler slot to begin binding from.
--
--     [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
--
--     [@num_bindings@]: the number of texture-sampler bindings to bind from the array.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUComputePipeline'
--
--     [C declaration]: @SDL_BindGPUComputeSamplers@, defined at @SDL3\/SDL_gpu.h 3716:34@
sDL_BindGPUComputeSamplers
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUComputePass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUComputeSamplers =
  BG.unsafePerformIO hs_bindgen_29656bc1e0885584

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputeStorageTextures@
foreign import ccall unsafe "hs_bindgen_01575e615d9f9179"
  hs_bindgen_01575e615d9f9179_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputeStorageTextures@
hs_bindgen_01575e615d9f9179
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUComputePass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_01575e615d9f9179 =
  BG.fromFFIType hs_bindgen_01575e615d9f9179_base

{-# NOINLINE sDL_BindGPUComputeStorageTextures #-}

-- | Binds storage textures as readonly for use on the compute pipeline.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUComputePipeline()@.
--
--     [@compute_pass@]: a compute pass handle.
--
--     [@first_slot@]: the compute storage texture slot to begin binding from.
--
--     [@storage_textures@]: an array of storage textures.
--
--     [@num_bindings@]: the number of storage textures to bind from the array.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUComputePipeline'
--
--     [C declaration]: @SDL_BindGPUComputeStorageTextures@, defined at @SDL3\/SDL_gpu.h 3740:34@
sDL_BindGPUComputeStorageTextures
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUComputePass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUComputeStorageTextures =
  BG.unsafePerformIO hs_bindgen_01575e615d9f9179

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputeStorageBuffers@
foreign import ccall unsafe "hs_bindgen_589adbdedcb7e5de"
  hs_bindgen_589adbdedcb7e5de_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BindGPUComputeStorageBuffers@
hs_bindgen_589adbdedcb7e5de
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUComputePass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_589adbdedcb7e5de =
  BG.fromFFIType hs_bindgen_589adbdedcb7e5de_base

{-# NOINLINE sDL_BindGPUComputeStorageBuffers #-}

-- | Binds storage buffers as readonly for use on the compute pipeline.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUComputePipeline()@.
--
--     [@compute_pass@]: a compute pass handle.
--
--     [@first_slot@]: the compute storage buffer slot to begin binding from.
--
--     [@storage_buffers@]: an array of storage buffer binding structs.
--
--     [@num_bindings@]: the number of storage buffers to bind from the array.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUComputePipeline'
--
--     [C declaration]: @SDL_BindGPUComputeStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3764:34@
sDL_BindGPUComputeStorageBuffers
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUComputePass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_BindGPUComputeStorageBuffers =
  BG.unsafePerformIO hs_bindgen_589adbdedcb7e5de

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DispatchGPUCompute@
foreign import ccall unsafe "hs_bindgen_050145c7c0eda2a0"
  hs_bindgen_050145c7c0eda2a0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DispatchGPUCompute@
hs_bindgen_050145c7c0eda2a0
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUComputePass
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO ()
           )
       )
hs_bindgen_050145c7c0eda2a0 =
  BG.fromFFIType hs_bindgen_050145c7c0eda2a0_base

{-# NOINLINE sDL_DispatchGPUCompute #-}

-- | Dispatches compute work.
--
--     You must not call this function before binding a compute pipeline.
--
--     A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and the dispatches write to the same resource region as each other, there is no guarantee of which order the writes will occur. If the write order matters, you MUST end the compute pass and begin another one.
--
--     [@compute_pass@]: a compute pass handle.
--
--     [@groupcount_x@]: number of local workgroups to dispatch in the X dimension.
--
--     [@groupcount_y@]: number of local workgroups to dispatch in the Y dimension.
--
--     [@groupcount_z@]: number of local workgroups to dispatch in the Z dimension.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DispatchGPUCompute@, defined at @SDL3\/SDL_gpu.h 3790:34@
sDL_DispatchGPUCompute
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUComputePass
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO ()
       )
sDL_DispatchGPUCompute =
  BG.unsafePerformIO hs_bindgen_050145c7c0eda2a0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DispatchGPUComputeIndirect@
foreign import ccall unsafe "hs_bindgen_6eed39e21086610c"
  hs_bindgen_6eed39e21086610c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DispatchGPUComputeIndirect@
hs_bindgen_6eed39e21086610c
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_GPUComputePass -> BG.Ptr SDL_GPUBuffer -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO ())
       )
hs_bindgen_6eed39e21086610c =
  BG.fromFFIType hs_bindgen_6eed39e21086610c_base

{-# NOINLINE sDL_DispatchGPUComputeIndirect #-}

-- | Dispatches compute work with parameters set from a buffer.
--
--     The buffer layout should match the layout of 'SDL_GPUIndirectDispatchCommand'. You must not call this function before binding a compute pipeline.
--
--     A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and the dispatches write to the same resource region as each other, there is no guarantee of which order the writes will occur. If the write order matters, you MUST end the compute pass and begin another one.
--
--     [@compute_pass@]: a compute pass handle.
--
--     [@buffer@]: a buffer containing dispatch parameters.
--
--     [@offset@]: the offset to start reading from the dispatch buffer.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DispatchGPUComputeIndirect@, defined at @SDL3\/SDL_gpu.h 3814:34@
sDL_DispatchGPUComputeIndirect
  :: BG.FunPtr
       (BG.Ptr SDL_GPUComputePass -> BG.Ptr SDL_GPUBuffer -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO ())
sDL_DispatchGPUComputeIndirect =
  BG.unsafePerformIO hs_bindgen_6eed39e21086610c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_EndGPUComputePass@
foreign import ccall unsafe "hs_bindgen_3d69c010dbe2273d"
  hs_bindgen_3d69c010dbe2273d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_EndGPUComputePass@
hs_bindgen_3d69c010dbe2273d :: IO (BG.FunPtr (BG.Ptr SDL_GPUComputePass -> IO ()))
hs_bindgen_3d69c010dbe2273d =
  BG.fromFFIType hs_bindgen_3d69c010dbe2273d_base

{-# NOINLINE sDL_EndGPUComputePass #-}

-- | Ends the current compute pass.
--
--     All bound compute state on the command buffer is unset. The compute pass handle is now invalid.
--
--     [@compute_pass@]: a compute pass handle.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EndGPUComputePass@, defined at @SDL3\/SDL_gpu.h 3829:34@
sDL_EndGPUComputePass :: BG.FunPtr (BG.Ptr SDL_GPUComputePass -> IO ())
sDL_EndGPUComputePass =
  BG.unsafePerformIO hs_bindgen_3d69c010dbe2273d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_MapGPUTransferBuffer@
foreign import ccall unsafe "hs_bindgen_683b5935cd3f5940"
  hs_bindgen_683b5935cd3f5940_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_MapGPUTransferBuffer@
hs_bindgen_683b5935cd3f5940
  :: IO
       (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTransferBuffer -> BG.CBool -> IO (BG.Ptr BG.Void)))
hs_bindgen_683b5935cd3f5940 =
  BG.fromFFIType hs_bindgen_683b5935cd3f5940_base

{-# NOINLINE sDL_MapGPUTransferBuffer #-}

-- | Maps a transfer buffer into application address space.
--
--     You must unmap the transfer buffer before encoding upload commands. The memory is owned by the graphics driver - do NOT call SDL_free() on the returned pointer.
--
--     [@device@]: a GPU context.
--
--     [@transfer_buffer@]: a transfer buffer.
--
--     [@cycle@]: if true, cycles the transfer buffer if it is already bound.
--
--     [Returns]: the address of the mapped transfer buffer memory, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_MapGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3849:36@
sDL_MapGPUTransferBuffer
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTransferBuffer -> BG.CBool -> IO (BG.Ptr BG.Void))
sDL_MapGPUTransferBuffer =
  BG.unsafePerformIO hs_bindgen_683b5935cd3f5940

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_UnmapGPUTransferBuffer@
foreign import ccall unsafe "hs_bindgen_e33fd3a1127b2473"
  hs_bindgen_e33fd3a1127b2473_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_UnmapGPUTransferBuffer@
hs_bindgen_e33fd3a1127b2473
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTransferBuffer -> IO ()))
hs_bindgen_e33fd3a1127b2473 =
  BG.fromFFIType hs_bindgen_e33fd3a1127b2473_base

{-# NOINLINE sDL_UnmapGPUTransferBuffer #-}

-- | Unmaps a previously mapped transfer buffer.
--
--     [@device@]: a GPU context.
--
--     [@transfer_buffer@]: a previously mapped transfer buffer.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UnmapGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3862:34@
sDL_UnmapGPUTransferBuffer
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUTransferBuffer -> IO ())
sDL_UnmapGPUTransferBuffer =
  BG.unsafePerformIO hs_bindgen_e33fd3a1127b2473

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BeginGPUCopyPass@
foreign import ccall unsafe "hs_bindgen_26ebd2bad4c071ad"
  hs_bindgen_26ebd2bad4c071ad_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BeginGPUCopyPass@
hs_bindgen_26ebd2bad4c071ad
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO (BG.Ptr SDL_GPUCopyPass)))
hs_bindgen_26ebd2bad4c071ad =
  BG.fromFFIType hs_bindgen_26ebd2bad4c071ad_base

{-# NOINLINE sDL_BeginGPUCopyPass #-}

-- | Begins a copy pass on a command buffer.
--
--     All operations related to copying to or from buffers or textures take place inside a copy pass. You must not begin another copy pass, or a render pass or compute pass before ending the copy pass.
--
--     [@command_buffer@]: a command buffer.
--
--     [Returns]: a copy pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EndGPUCopyPass'
--
--     [C declaration]: @SDL_BeginGPUCopyPass@, defined at @SDL3\/SDL_gpu.h 3882:47@
sDL_BeginGPUCopyPass :: BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO (BG.Ptr SDL_GPUCopyPass))
sDL_BeginGPUCopyPass =
  BG.unsafePerformIO hs_bindgen_26ebd2bad4c071ad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_UploadToGPUTexture@
foreign import ccall unsafe "hs_bindgen_ab0f032d9686e81d"
  hs_bindgen_ab0f032d9686e81d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_UploadToGPUTexture@
hs_bindgen_ab0f032d9686e81d
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCopyPass
             -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
             -> PtrConst.PtrConst SDL_GPUTextureRegion
             -> BG.CBool
             -> IO ()
           )
       )
hs_bindgen_ab0f032d9686e81d =
  BG.fromFFIType hs_bindgen_ab0f032d9686e81d_base

{-# NOINLINE sDL_UploadToGPUTexture #-}

-- | Uploads data from a transfer buffer to a texture.
--
--     The upload occurs on the GPU timeline. You may assume that the upload has finished in subsequent commands.
--
--     You must align the data in the transfer buffer to a multiple of the texel size of the texture format.
--
--     [@copy_pass@]: a copy pass handle.
--
--     [@source@]: the source transfer buffer with image layout information.
--
--     [@destination@]: the destination texture region.
--
--     [@cycle@]: if true, cycles the texture if the texture is bound, otherwise overwrites the data.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UploadToGPUTexture@, defined at @SDL3\/SDL_gpu.h 3902:34@
sDL_UploadToGPUTexture
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCopyPass
         -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
         -> PtrConst.PtrConst SDL_GPUTextureRegion
         -> BG.CBool
         -> IO ()
       )
sDL_UploadToGPUTexture =
  BG.unsafePerformIO hs_bindgen_ab0f032d9686e81d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_UploadToGPUBuffer@
foreign import ccall unsafe "hs_bindgen_d5ff839503d8766f"
  hs_bindgen_d5ff839503d8766f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_UploadToGPUBuffer@
hs_bindgen_d5ff839503d8766f
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCopyPass
             -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
             -> PtrConst.PtrConst SDL_GPUBufferRegion
             -> BG.CBool
             -> IO ()
           )
       )
hs_bindgen_d5ff839503d8766f =
  BG.fromFFIType hs_bindgen_d5ff839503d8766f_base

{-# NOINLINE sDL_UploadToGPUBuffer #-}

-- | Uploads data from a transfer buffer to a buffer.
--
--     The upload occurs on the GPU timeline. You may assume that the upload has finished in subsequent commands.
--
--     [@copy_pass@]: a copy pass handle.
--
--     [@source@]: the source transfer buffer with offset.
--
--     [@destination@]: the destination buffer with offset and size.
--
--     [@cycle@]: if true, cycles the buffer if it is already bound, otherwise overwrites the data.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UploadToGPUBuffer@, defined at @SDL3\/SDL_gpu.h 3922:34@
sDL_UploadToGPUBuffer
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCopyPass
         -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
         -> PtrConst.PtrConst SDL_GPUBufferRegion
         -> BG.CBool
         -> IO ()
       )
sDL_UploadToGPUBuffer =
  BG.unsafePerformIO hs_bindgen_d5ff839503d8766f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CopyGPUTextureToTexture@
foreign import ccall unsafe "hs_bindgen_1cd400910067ddd5"
  hs_bindgen_1cd400910067ddd5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CopyGPUTextureToTexture@
hs_bindgen_1cd400910067ddd5
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCopyPass
             -> PtrConst.PtrConst SDL_GPUTextureLocation
             -> PtrConst.PtrConst SDL_GPUTextureLocation
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> BG.CBool
             -> IO ()
           )
       )
hs_bindgen_1cd400910067ddd5 =
  BG.fromFFIType hs_bindgen_1cd400910067ddd5_base

{-# NOINLINE sDL_CopyGPUTextureToTexture #-}

-- | Performs a texture-to-texture copy.
--
--     This copy occurs on the GPU timeline. You may assume the copy has finished in subsequent commands.
--
--     This function does not support copying between depth and color textures. For those, copy the texture to a buffer and then to the destination texture.
--
--     [@copy_pass@]: a copy pass handle.
--
--     [@source@]: a source texture region.
--
--     [@destination@]: a destination texture region.
--
--     [@w@]: the width of the region to copy.
--
--     [@h@]: the height of the region to copy.
--
--     [@d@]: the depth of the region to copy.
--
--     [@cycle@]: if true, cycles the destination texture if the destination texture is bound, otherwise overwrites the data.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CopyGPUTextureToTexture@, defined at @SDL3\/SDL_gpu.h 3949:34@
sDL_CopyGPUTextureToTexture
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCopyPass
         -> PtrConst.PtrConst SDL_GPUTextureLocation
         -> PtrConst.PtrConst SDL_GPUTextureLocation
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> BG.CBool
         -> IO ()
       )
sDL_CopyGPUTextureToTexture =
  BG.unsafePerformIO hs_bindgen_1cd400910067ddd5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CopyGPUBufferToBuffer@
foreign import ccall unsafe "hs_bindgen_f1c8dff3576eacd7"
  hs_bindgen_f1c8dff3576eacd7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CopyGPUBufferToBuffer@
hs_bindgen_f1c8dff3576eacd7
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCopyPass
             -> PtrConst.PtrConst SDL_GPUBufferLocation
             -> PtrConst.PtrConst SDL_GPUBufferLocation
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> BG.CBool
             -> IO ()
           )
       )
hs_bindgen_f1c8dff3576eacd7 =
  BG.fromFFIType hs_bindgen_f1c8dff3576eacd7_base

{-# NOINLINE sDL_CopyGPUBufferToBuffer #-}

-- | Performs a buffer-to-buffer copy.
--
--     This copy occurs on the GPU timeline. You may assume the copy has finished in subsequent commands.
--
--     [@copy_pass@]: a copy pass handle.
--
--     [@source@]: the buffer and offset to copy from.
--
--     [@destination@]: the buffer and offset to copy to.
--
--     [@size@]: the length of the buffer to copy.
--
--     [@cycle@]: if true, cycles the destination buffer if it is already bound, otherwise overwrites the data.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CopyGPUBufferToBuffer@, defined at @SDL3\/SDL_gpu.h 3973:34@
sDL_CopyGPUBufferToBuffer
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCopyPass
         -> PtrConst.PtrConst SDL_GPUBufferLocation
         -> PtrConst.PtrConst SDL_GPUBufferLocation
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> BG.CBool
         -> IO ()
       )
sDL_CopyGPUBufferToBuffer =
  BG.unsafePerformIO hs_bindgen_f1c8dff3576eacd7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DownloadFromGPUTexture@
foreign import ccall unsafe "hs_bindgen_de2075aa3b528189"
  hs_bindgen_de2075aa3b528189_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DownloadFromGPUTexture@
hs_bindgen_de2075aa3b528189
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCopyPass
             -> PtrConst.PtrConst SDL_GPUTextureRegion
             -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
             -> IO ()
           )
       )
hs_bindgen_de2075aa3b528189 =
  BG.fromFFIType hs_bindgen_de2075aa3b528189_base

{-# NOINLINE sDL_DownloadFromGPUTexture #-}

-- | Copies data from a texture to a transfer buffer on the GPU timeline.
--
--     This data is not guaranteed to be copied until the command buffer fence is signaled.
--
--     [@copy_pass@]: a copy pass handle.
--
--     [@source@]: the source texture region.
--
--     [@destination@]: the destination transfer buffer with image layout information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DownloadFromGPUTexture@, defined at @SDL3\/SDL_gpu.h 3993:34@
sDL_DownloadFromGPUTexture
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCopyPass
         -> PtrConst.PtrConst SDL_GPUTextureRegion
         -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
         -> IO ()
       )
sDL_DownloadFromGPUTexture =
  BG.unsafePerformIO hs_bindgen_de2075aa3b528189

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DownloadFromGPUBuffer@
foreign import ccall unsafe "hs_bindgen_ba4b40201f2134bd"
  hs_bindgen_ba4b40201f2134bd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_DownloadFromGPUBuffer@
hs_bindgen_ba4b40201f2134bd
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCopyPass
             -> PtrConst.PtrConst SDL_GPUBufferRegion
             -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
             -> IO ()
           )
       )
hs_bindgen_ba4b40201f2134bd =
  BG.fromFFIType hs_bindgen_ba4b40201f2134bd_base

{-# NOINLINE sDL_DownloadFromGPUBuffer #-}

-- | Copies data from a buffer to a transfer buffer on the GPU timeline.
--
--     This data is not guaranteed to be copied until the command buffer fence is signaled.
--
--     [@copy_pass@]: a copy pass handle.
--
--     [@source@]: the source buffer with offset and size.
--
--     [@destination@]: the destination transfer buffer with offset.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DownloadFromGPUBuffer@, defined at @SDL3\/SDL_gpu.h 4010:34@
sDL_DownloadFromGPUBuffer
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCopyPass
         -> PtrConst.PtrConst SDL_GPUBufferRegion
         -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
         -> IO ()
       )
sDL_DownloadFromGPUBuffer =
  BG.unsafePerformIO hs_bindgen_ba4b40201f2134bd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_EndGPUCopyPass@
foreign import ccall unsafe "hs_bindgen_b4b5fc61adee338e"
  hs_bindgen_b4b5fc61adee338e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_EndGPUCopyPass@
hs_bindgen_b4b5fc61adee338e :: IO (BG.FunPtr (BG.Ptr SDL_GPUCopyPass -> IO ()))
hs_bindgen_b4b5fc61adee338e =
  BG.fromFFIType hs_bindgen_b4b5fc61adee338e_base

{-# NOINLINE sDL_EndGPUCopyPass #-}

-- | Ends the current copy pass.
--
--     [@copy_pass@]: a copy pass handle.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EndGPUCopyPass@, defined at @SDL3\/SDL_gpu.h 4022:34@
sDL_EndGPUCopyPass :: BG.FunPtr (BG.Ptr SDL_GPUCopyPass -> IO ())
sDL_EndGPUCopyPass =
  BG.unsafePerformIO hs_bindgen_b4b5fc61adee338e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GenerateMipmapsForGPUTexture@
foreign import ccall unsafe "hs_bindgen_9678149e861907fc"
  hs_bindgen_9678149e861907fc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GenerateMipmapsForGPUTexture@
hs_bindgen_9678149e861907fc
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> BG.Ptr SDL_GPUTexture -> IO ()))
hs_bindgen_9678149e861907fc =
  BG.fromFFIType hs_bindgen_9678149e861907fc_base

{-# NOINLINE sDL_GenerateMipmapsForGPUTexture #-}

-- | Generates mipmaps for the given texture.
--
--     This function must not be called inside of any pass.
--
--     [@command_buffer@]: a command_buffer.
--
--     [@texture@]: a texture with more than 1 mip level.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GenerateMipmapsForGPUTexture@, defined at @SDL3\/SDL_gpu.h 4035:34@
sDL_GenerateMipmapsForGPUTexture
  :: BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> BG.Ptr SDL_GPUTexture -> IO ())
sDL_GenerateMipmapsForGPUTexture =
  BG.unsafePerformIO hs_bindgen_9678149e861907fc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BlitGPUTexture@
foreign import ccall unsafe "hs_bindgen_7f45139e78bf4f56"
  hs_bindgen_7f45139e78bf4f56_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_BlitGPUTexture@
hs_bindgen_7f45139e78bf4f56
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> PtrConst.PtrConst SDL_GPUBlitInfo -> IO ()))
hs_bindgen_7f45139e78bf4f56 =
  BG.fromFFIType hs_bindgen_7f45139e78bf4f56_base

{-# NOINLINE sDL_BlitGPUTexture #-}

-- | Blits from a source texture region to a destination texture region.
--
--     This function must not be called inside of any pass.
--
--     [@command_buffer@]: a command buffer.
--
--     [@info@]: the blit info struct containing the blit parameters.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BlitGPUTexture@, defined at @SDL3\/SDL_gpu.h 4049:34@
sDL_BlitGPUTexture
  :: BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> PtrConst.PtrConst SDL_GPUBlitInfo -> IO ())
sDL_BlitGPUTexture =
  BG.unsafePerformIO hs_bindgen_7f45139e78bf4f56

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WindowSupportsGPUSwapchainComposition@
foreign import ccall unsafe "hs_bindgen_c59f48ad030d3274"
  hs_bindgen_c59f48ad030d3274_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WindowSupportsGPUSwapchainComposition@
hs_bindgen_c59f48ad030d3274
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUDevice
             -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> SDL_GPUSwapchainComposition
             -> IO BG.CBool
           )
       )
hs_bindgen_c59f48ad030d3274 =
  BG.fromFFIType hs_bindgen_c59f48ad030d3274_base

{-# NOINLINE sDL_WindowSupportsGPUSwapchainComposition #-}

-- | Determines whether a swapchain composition is supported by the window.
--
--     The window must be claimed before calling this function.
--
--     [@device@]: a GPU context.
--
--     [@window@]: an SDL_Window.
--
--     [@swapchain_composition@]: the swapchain composition to check.
--
--     [Returns]: true if supported, false if unsupported.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClaimWindowForGPUDevice'
--
--     [C declaration]: @SDL_WindowSupportsGPUSwapchainComposition@, defined at @SDL3\/SDL_gpu.h 4069:34@
sDL_WindowSupportsGPUSwapchainComposition
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUDevice
         -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> SDL_GPUSwapchainComposition
         -> IO BG.CBool
       )
sDL_WindowSupportsGPUSwapchainComposition =
  BG.unsafePerformIO hs_bindgen_c59f48ad030d3274

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WindowSupportsGPUPresentMode@
foreign import ccall unsafe "hs_bindgen_bf576ab13c340f27"
  hs_bindgen_bf576ab13c340f27_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WindowSupportsGPUPresentMode@
hs_bindgen_bf576ab13c340f27
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUDevice
             -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> SDL_GPUPresentMode
             -> IO BG.CBool
           )
       )
hs_bindgen_bf576ab13c340f27 =
  BG.fromFFIType hs_bindgen_bf576ab13c340f27_base

{-# NOINLINE sDL_WindowSupportsGPUPresentMode #-}

-- | Determines whether a presentation mode is supported by the window.
--
--     The window must be claimed before calling this function.
--
--     [@device@]: a GPU context.
--
--     [@window@]: an SDL_Window.
--
--     [@present_mode@]: the presentation mode to check.
--
--     [Returns]: true if supported, false if unsupported.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClaimWindowForGPUDevice'
--
--     [C declaration]: @SDL_WindowSupportsGPUPresentMode@, defined at @SDL3\/SDL_gpu.h 4088:34@
sDL_WindowSupportsGPUPresentMode
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUDevice
         -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> SDL_GPUPresentMode
         -> IO BG.CBool
       )
sDL_WindowSupportsGPUPresentMode =
  BG.unsafePerformIO hs_bindgen_bf576ab13c340f27

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ClaimWindowForGPUDevice@
foreign import ccall unsafe "hs_bindgen_4ecaa5beccefec7a"
  hs_bindgen_4ecaa5beccefec7a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ClaimWindowForGPUDevice@
hs_bindgen_4ecaa5beccefec7a
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool))
hs_bindgen_4ecaa5beccefec7a =
  BG.fromFFIType hs_bindgen_4ecaa5beccefec7a_base

{-# NOINLINE sDL_ClaimWindowForGPUDevice #-}

-- | Claims a window, creating a swapchain structure for it.
--
--     This must be called before SDL_AcquireGPUSwapchainTexture is called using the window. You should only call this function from the thread that created the window.
--
--     The swapchain will be created with SDL_GPU_SWAPCHAINCOMPOSITION_SDR and SDL_GPU_PRESENTMODE_VSYNC. If you want to have different swapchain parameters, you must call SDL_SetGPUSwapchainParameters after claiming the window.
--
--     [@device@]: a GPU context.
--
--     [@window@]: an SDL_Window.
--
--     [Returns]: true on success, or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WaitAndAcquireGPUSwapchainTexture', 'sDL_ReleaseWindowFromGPUDevice', 'sDL_WindowSupportsGPUPresentMode', 'sDL_WindowSupportsGPUSwapchainComposition'
--
--     [C declaration]: @SDL_ClaimWindowForGPUDevice@, defined at @SDL3\/SDL_gpu.h 4120:34@
sDL_ClaimWindowForGPUDevice
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool)
sDL_ClaimWindowForGPUDevice =
  BG.unsafePerformIO hs_bindgen_4ecaa5beccefec7a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseWindowFromGPUDevice@
foreign import ccall unsafe "hs_bindgen_196ff3ee33dc8751"
  hs_bindgen_196ff3ee33dc8751_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseWindowFromGPUDevice@
hs_bindgen_196ff3ee33dc8751
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO ()))
hs_bindgen_196ff3ee33dc8751 =
  BG.fromFFIType hs_bindgen_196ff3ee33dc8751_base

{-# NOINLINE sDL_ReleaseWindowFromGPUDevice #-}

-- | Unclaims a window, destroying its swapchain structure.
--
--     [@device@]: a GPU context.
--
--     [@window@]: an SDL_Window that has been claimed.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClaimWindowForGPUDevice'
--
--     [C declaration]: @SDL_ReleaseWindowFromGPUDevice@, defined at @SDL3\/SDL_gpu.h 4134:34@
sDL_ReleaseWindowFromGPUDevice
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO ())
sDL_ReleaseWindowFromGPUDevice =
  BG.unsafePerformIO hs_bindgen_196ff3ee33dc8751

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUSwapchainParameters@
foreign import ccall unsafe "hs_bindgen_31ee67753f7ce365"
  hs_bindgen_31ee67753f7ce365_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUSwapchainParameters@
hs_bindgen_31ee67753f7ce365
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUDevice
             -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> SDL_GPUSwapchainComposition
             -> SDL_GPUPresentMode
             -> IO BG.CBool
           )
       )
hs_bindgen_31ee67753f7ce365 =
  BG.fromFFIType hs_bindgen_31ee67753f7ce365_base

{-# NOINLINE sDL_SetGPUSwapchainParameters #-}

-- | Changes the swapchain parameters for the given claimed window.
--
--     This function will fail if the requested present mode or swapchain composition are unsupported by the device. Check if the parameters are supported via SDL_WindowSupportsGPUPresentMode \/ SDL_WindowSupportsGPUSwapchainComposition prior to calling this function.
--
--     SDL_GPU_PRESENTMODE_VSYNC with SDL_GPU_SWAPCHAINCOMPOSITION_SDR is always supported.
--
--     [@device@]: a GPU context.
--
--     [@window@]: an SDL_Window that has been claimed.
--
--     [@swapchain_composition@]: the desired composition of the swapchain.
--
--     [@present_mode@]: the desired present mode for the swapchain.
--
--     [Returns]: true if successful, false on error; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WindowSupportsGPUPresentMode', 'sDL_WindowSupportsGPUSwapchainComposition'
--
--     [C declaration]: @SDL_SetGPUSwapchainParameters@, defined at @SDL3\/SDL_gpu.h 4161:34@
sDL_SetGPUSwapchainParameters
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUDevice
         -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> SDL_GPUSwapchainComposition
         -> SDL_GPUPresentMode
         -> IO BG.CBool
       )
sDL_SetGPUSwapchainParameters =
  BG.unsafePerformIO hs_bindgen_31ee67753f7ce365

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUAllowedFramesInFlight@
foreign import ccall unsafe "hs_bindgen_cf8859de2d063dde"
  hs_bindgen_cf8859de2d063dde_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SetGPUAllowedFramesInFlight@
hs_bindgen_cf8859de2d063dde
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_cf8859de2d063dde =
  BG.fromFFIType hs_bindgen_cf8859de2d063dde_base

{-# NOINLINE sDL_SetGPUAllowedFramesInFlight #-}

-- | Configures the maximum allowed number of frames in flight.
--
--     The default value when the device is created is 2. This means that after you have submitted 2 frames for presentation, if the GPU has not finished working on the first frame, @SDL_AcquireGPUSwapchainTexture()@ will fill the swapchain texture pointer with NULL, and @SDL_WaitAndAcquireGPUSwapchainTexture()@ will block.
--
--     Higher values increase throughput at the expense of visual latency. Lower values decrease visual latency at the expense of throughput.
--
--     Note that calling this function will stall and flush the command queue to prevent synchronization issues.
--
--     The minimum value of allowed frames in flight is 1, and the maximum is 3.
--
--     [@device@]: a GPU context.
--
--     [@allowed_frames_in_flight@]: the maximum number of frames that can be pending on the GPU.
--
--     [Returns]: true if successful, false on error; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetGPUAllowedFramesInFlight@, defined at @SDL3\/SDL_gpu.h 4192:34@
sDL_SetGPUAllowedFramesInFlight
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_SetGPUAllowedFramesInFlight =
  BG.unsafePerformIO hs_bindgen_cf8859de2d063dde

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUSwapchainTextureFormat@
foreign import ccall unsafe "hs_bindgen_2edc1414ddc93ec8"
  hs_bindgen_2edc1414ddc93ec8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUSwapchainTextureFormat@
hs_bindgen_2edc1414ddc93ec8
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO SDL_GPUTextureFormat)
       )
hs_bindgen_2edc1414ddc93ec8 =
  BG.fromFFIType hs_bindgen_2edc1414ddc93ec8_base

{-# NOINLINE sDL_GetGPUSwapchainTextureFormat #-}

-- | Obtains the texture format of the swapchain for the given window.
--
--     Note that this format can change if the swapchain parameters change.
--
--     [@device@]: a GPU context.
--
--     [@window@]: an SDL_Window that has been claimed.
--
--     [Returns]: the texture format of the swapchain.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGPUSwapchainTextureFormat@, defined at @SDL3\/SDL_gpu.h 4207:50@
sDL_GetGPUSwapchainTextureFormat
  :: BG.FunPtr
       (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO SDL_GPUTextureFormat)
sDL_GetGPUSwapchainTextureFormat =
  BG.unsafePerformIO hs_bindgen_2edc1414ddc93ec8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_AcquireGPUSwapchainTexture@
foreign import ccall unsafe "hs_bindgen_3683da9bdd7123ad"
  hs_bindgen_3683da9bdd7123ad_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_AcquireGPUSwapchainTexture@
hs_bindgen_3683da9bdd7123ad
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCommandBuffer
             -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> BG.Ptr (BG.Ptr SDL_GPUTexture)
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_3683da9bdd7123ad =
  BG.fromFFIType hs_bindgen_3683da9bdd7123ad_base

{-# NOINLINE sDL_AcquireGPUSwapchainTexture #-}

-- | Acquire a texture to use in presentation.
--
--     When a swapchain texture is acquired on a command buffer, it will automatically be submitted for presentation when the command buffer is submitted. The swapchain texture should only be referenced by the command buffer used to acquire it.
--
--     This function will fill the swapchain texture handle with NULL if too many frames are in flight. This is not an error. This NULL pointer should not be passed back into SDL. Instead, it should be considered as an indication to wait until the swapchain is available.
--
--     If you use this function, it is possible to create a situation where many command buffers are allocated while the rendering context waits for the GPU to catch up, which will cause memory usage to grow. You should use @SDL_WaitAndAcquireGPUSwapchainTexture()@ unless you know what you are doing with timing.
--
--     The swapchain texture is managed by the implementation and must not be freed by the user. You MUST NOT call this function from any thread other than the one that created the window.
--
--     [@command_buffer@]: a command buffer.
--
--     [@window@]: a window that has been claimed.
--
--     [@swapchain_texture@]: a pointer filled in with a swapchain texture handle.
--
--     [@swapchain_texture_width@]: a pointer filled in with the swapchain texture width, may be NULL.
--
--     [@swapchain_texture_height@]: a pointer filled in with the swapchain texture height, may be NULL.
--
--     [Returns]: true on success, false on error; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClaimWindowForGPUDevice', 'sDL_SubmitGPUCommandBuffer', 'sDL_SubmitGPUCommandBufferAndAcquireFence', 'sDL_CancelGPUCommandBuffer', SDL_GetWindowSizeInPixels, 'sDL_WaitForGPUSwapchain', 'sDL_WaitAndAcquireGPUSwapchainTexture', 'sDL_SetGPUAllowedFramesInFlight'
--
--     [C declaration]: @SDL_AcquireGPUSwapchainTexture@, defined at @SDL3\/SDL_gpu.h 4259:34@
sDL_AcquireGPUSwapchainTexture
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCommandBuffer
         -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> BG.Ptr (BG.Ptr SDL_GPUTexture)
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_AcquireGPUSwapchainTexture =
  BG.unsafePerformIO hs_bindgen_3683da9bdd7123ad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitForGPUSwapchain@
foreign import ccall unsafe "hs_bindgen_ea0675458d59e8d7"
  hs_bindgen_ea0675458d59e8d7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitForGPUSwapchain@
hs_bindgen_ea0675458d59e8d7
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool))
hs_bindgen_ea0675458d59e8d7 =
  BG.fromFFIType hs_bindgen_ea0675458d59e8d7_base

{-# NOINLINE sDL_WaitForGPUSwapchain #-}

-- | Blocks the thread until a swapchain texture is available to be acquired.
--
--     [@device@]: a GPU context.
--
--     [@window@]: a window that has been claimed.
--
--     [Returns]: true on success, false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AcquireGPUSwapchainTexture', 'sDL_WaitAndAcquireGPUSwapchainTexture', 'sDL_SetGPUAllowedFramesInFlight'
--
--     [C declaration]: @SDL_WaitForGPUSwapchain@, defined at @SDL3\/SDL_gpu.h 4283:34@
sDL_WaitForGPUSwapchain
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool)
sDL_WaitForGPUSwapchain =
  BG.unsafePerformIO hs_bindgen_ea0675458d59e8d7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitAndAcquireGPUSwapchainTexture@
foreign import ccall unsafe "hs_bindgen_bd7e7771ebd38df5"
  hs_bindgen_bd7e7771ebd38df5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitAndAcquireGPUSwapchainTexture@
hs_bindgen_bd7e7771ebd38df5
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUCommandBuffer
             -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> BG.Ptr (BG.Ptr SDL_GPUTexture)
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_bd7e7771ebd38df5 =
  BG.fromFFIType hs_bindgen_bd7e7771ebd38df5_base

{-# NOINLINE sDL_WaitAndAcquireGPUSwapchainTexture #-}

-- | Blocks the thread until a swapchain texture is available to be acquired, and then acquires it.
--
--     When a swapchain texture is acquired on a command buffer, it will automatically be submitted for presentation when the command buffer is submitted. The swapchain texture should only be referenced by the command buffer used to acquire it. It is an error to call @SDL_CancelGPUCommandBuffer()@ after a swapchain texture is acquired.
--
--     This function can fill the swapchain texture handle with NULL in certain cases, for example if the window is minimized. This is not an error. You should always make sure to check whether the pointer is NULL before actually using it.
--
--     The swapchain texture is managed by the implementation and must not be freed by the user. You MUST NOT call this function from any thread other than the one that created the window.
--
--     The swapchain texture is write-only and cannot be used as a sampler or for another reading operation.
--
--     [@command_buffer@]: a command buffer.
--
--     [@window@]: a window that has been claimed.
--
--     [@swapchain_texture@]: a pointer filled in with a swapchain texture handle.
--
--     [@swapchain_texture_width@]: a pointer filled in with the swapchain texture width, may be NULL.
--
--     [@swapchain_texture_height@]: a pointer filled in with the swapchain texture height, may be NULL.
--
--     [Returns]: true on success, false on error; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called from the thread that created the window.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBuffer', 'sDL_SubmitGPUCommandBufferAndAcquireFence', 'sDL_AcquireGPUSwapchainTexture'
--
--     [C declaration]: @SDL_WaitAndAcquireGPUSwapchainTexture@, defined at @SDL3\/SDL_gpu.h 4329:34@
sDL_WaitAndAcquireGPUSwapchainTexture
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUCommandBuffer
         -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> BG.Ptr (BG.Ptr SDL_GPUTexture)
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_WaitAndAcquireGPUSwapchainTexture =
  BG.unsafePerformIO hs_bindgen_bd7e7771ebd38df5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SubmitGPUCommandBuffer@
foreign import ccall unsafe "hs_bindgen_8d4a9ce464622085"
  hs_bindgen_8d4a9ce464622085_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SubmitGPUCommandBuffer@
hs_bindgen_8d4a9ce464622085 :: IO (BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO BG.CBool))
hs_bindgen_8d4a9ce464622085 =
  BG.fromFFIType hs_bindgen_8d4a9ce464622085_base

{-# NOINLINE sDL_SubmitGPUCommandBuffer #-}

-- | Submits a command buffer so its commands can be processed on the GPU.
--
--     It is invalid to use the command buffer after this is called.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     All commands in the submission are guaranteed to begin executing before any command in a subsequent submission begins executing.
--
--     [@command_buffer@]: a command buffer.
--
--     [Returns]: true on success, false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AcquireGPUCommandBuffer', 'sDL_WaitAndAcquireGPUSwapchainTexture', 'sDL_AcquireGPUSwapchainTexture', 'sDL_SubmitGPUCommandBufferAndAcquireFence'
--
--     [C declaration]: @SDL_SubmitGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 4357:34@
sDL_SubmitGPUCommandBuffer :: BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO BG.CBool)
sDL_SubmitGPUCommandBuffer =
  BG.unsafePerformIO hs_bindgen_8d4a9ce464622085

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SubmitGPUCommandBufferAndAcquireFence@
foreign import ccall unsafe "hs_bindgen_093495cd0f5ce3be"
  hs_bindgen_093495cd0f5ce3be_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_SubmitGPUCommandBufferAndAcquireFence@
hs_bindgen_093495cd0f5ce3be
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO (BG.Ptr SDL_GPUFence)))
hs_bindgen_093495cd0f5ce3be =
  BG.fromFFIType hs_bindgen_093495cd0f5ce3be_base

{-# NOINLINE sDL_SubmitGPUCommandBufferAndAcquireFence #-}

-- | Submits a command buffer so its commands can be processed on the GPU, and acquires a fence associated with the command buffer.
--
--     You must release this fence when it is no longer needed or it will cause a leak. It is invalid to use the command buffer after this is called.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     All commands in the submission are guaranteed to begin executing before any command in a subsequent submission begins executing.
--
--     [@command_buffer@]: a command buffer.
--
--     [Returns]: a fence associated with the command buffer, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AcquireGPUCommandBuffer', 'sDL_WaitAndAcquireGPUSwapchainTexture', 'sDL_AcquireGPUSwapchainTexture', 'sDL_SubmitGPUCommandBuffer', 'sDL_ReleaseGPUFence'
--
--     [C declaration]: @SDL_SubmitGPUCommandBufferAndAcquireFence@, defined at @SDL3\/SDL_gpu.h 4384:44@
sDL_SubmitGPUCommandBufferAndAcquireFence
  :: BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO (BG.Ptr SDL_GPUFence))
sDL_SubmitGPUCommandBufferAndAcquireFence =
  BG.unsafePerformIO hs_bindgen_093495cd0f5ce3be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CancelGPUCommandBuffer@
foreign import ccall unsafe "hs_bindgen_83b736c86816e554"
  hs_bindgen_83b736c86816e554_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CancelGPUCommandBuffer@
hs_bindgen_83b736c86816e554 :: IO (BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO BG.CBool))
hs_bindgen_83b736c86816e554 =
  BG.fromFFIType hs_bindgen_83b736c86816e554_base

{-# NOINLINE sDL_CancelGPUCommandBuffer #-}

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
--     [@command_buffer@]: a command buffer.
--
--     [Returns]: true on success, false on error; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WaitAndAcquireGPUSwapchainTexture', 'sDL_AcquireGPUCommandBuffer', 'sDL_AcquireGPUSwapchainTexture'
--
--     [C declaration]: @SDL_CancelGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 4409:34@
sDL_CancelGPUCommandBuffer :: BG.FunPtr (BG.Ptr SDL_GPUCommandBuffer -> IO BG.CBool)
sDL_CancelGPUCommandBuffer =
  BG.unsafePerformIO hs_bindgen_83b736c86816e554

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitForGPUIdle@
foreign import ccall unsafe "hs_bindgen_34c07d40aff698e2"
  hs_bindgen_34c07d40aff698e2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitForGPUIdle@
hs_bindgen_34c07d40aff698e2 :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO BG.CBool))
hs_bindgen_34c07d40aff698e2 =
  BG.fromFFIType hs_bindgen_34c07d40aff698e2_base

{-# NOINLINE sDL_WaitForGPUIdle #-}

-- | Blocks the thread until the GPU is completely idle.
--
--     [@device@]: a GPU context.
--
--     [Returns]: true on success, false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WaitForGPUFences'
--
--     [C declaration]: @SDL_WaitForGPUIdle@, defined at @SDL3\/SDL_gpu.h 4423:34@
sDL_WaitForGPUIdle :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> IO BG.CBool)
sDL_WaitForGPUIdle =
  BG.unsafePerformIO hs_bindgen_34c07d40aff698e2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitForGPUFences@
foreign import ccall unsafe "hs_bindgen_4cb9d239bc32f759"
  hs_bindgen_4cb9d239bc32f759_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_WaitForGPUFences@
hs_bindgen_4cb9d239bc32f759
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUDevice
             -> BG.CBool
             -> PtrConst.PtrConst (BG.Ptr SDL_GPUFence)
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_4cb9d239bc32f759 =
  BG.fromFFIType hs_bindgen_4cb9d239bc32f759_base

{-# NOINLINE sDL_WaitForGPUFences #-}

-- | Blocks the thread until the given fences are signaled.
--
--     [@device@]: a GPU context.
--
--     [@wait_all@]: if 0, wait for any fence to be signaled, if 1, wait for all fences to be signaled.
--
--     [@fences@]: an array of fences to wait on.
--
--     [@num_fences@]: the number of fences in the fences array.
--
--     [Returns]: true on success, false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBufferAndAcquireFence', 'sDL_WaitForGPUIdle'
--
--     [C declaration]: @SDL_WaitForGPUFences@, defined at @SDL3\/SDL_gpu.h 4442:34@
sDL_WaitForGPUFences
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUDevice
         -> BG.CBool
         -> PtrConst.PtrConst (BG.Ptr SDL_GPUFence)
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_WaitForGPUFences =
  BG.unsafePerformIO hs_bindgen_4cb9d239bc32f759

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_QueryGPUFence@
foreign import ccall unsafe "hs_bindgen_67c5db65f97a1de0"
  hs_bindgen_67c5db65f97a1de0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_QueryGPUFence@
hs_bindgen_67c5db65f97a1de0
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUFence -> IO BG.CBool))
hs_bindgen_67c5db65f97a1de0 =
  BG.fromFFIType hs_bindgen_67c5db65f97a1de0_base

{-# NOINLINE sDL_QueryGPUFence #-}

-- | Checks the status of a fence.
--
--     [@device@]: a GPU context.
--
--     [@fence@]: a fence.
--
--     [Returns]: true if the fence is signaled, false if it is not.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBufferAndAcquireFence'
--
--     [C declaration]: @SDL_QueryGPUFence@, defined at @SDL3\/SDL_gpu.h 4459:34@
sDL_QueryGPUFence :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUFence -> IO BG.CBool)
sDL_QueryGPUFence =
  BG.unsafePerformIO hs_bindgen_67c5db65f97a1de0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUFence@
foreign import ccall unsafe "hs_bindgen_8f9e7c0ed3e519a2"
  hs_bindgen_8f9e7c0ed3e519a2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_ReleaseGPUFence@
hs_bindgen_8f9e7c0ed3e519a2 :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUFence -> IO ()))
hs_bindgen_8f9e7c0ed3e519a2 =
  BG.fromFFIType hs_bindgen_8f9e7c0ed3e519a2_base

{-# NOINLINE sDL_ReleaseGPUFence #-}

-- | Releases a fence obtained from SDL_SubmitGPUCommandBufferAndAcquireFence.
--
--     You must not reference the fence after calling this function.
--
--     [@device@]: a GPU context.
--
--     [@fence@]: a fence.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBufferAndAcquireFence'
--
--     [C declaration]: @SDL_ReleaseGPUFence@, defined at @SDL3\/SDL_gpu.h 4475:34@
sDL_ReleaseGPUFence :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> BG.Ptr SDL_GPUFence -> IO ())
sDL_ReleaseGPUFence =
  BG.unsafePerformIO hs_bindgen_8f9e7c0ed3e519a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUTextureFormatTexelBlockSize@
foreign import ccall unsafe "hs_bindgen_7020eb5f7daa1796"
  hs_bindgen_7020eb5f7daa1796_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUTextureFormatTexelBlockSize@
hs_bindgen_7020eb5f7daa1796
  :: IO (BG.FunPtr (SDL_GPUTextureFormat -> IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_7020eb5f7daa1796 =
  BG.fromFFIType hs_bindgen_7020eb5f7daa1796_base

{-# NOINLINE sDL_GPUTextureFormatTexelBlockSize #-}

-- | Obtains the texel block size for a texture format.
--
--     [@format@]: the texture format you want to know the texel size of.
--
--     [Returns]: the texel block size of the texture format.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUTexture'
--
--     [C declaration]: @SDL_GPUTextureFormatTexelBlockSize@, defined at @SDL3\/SDL_gpu.h 4491:36@
sDL_GPUTextureFormatTexelBlockSize
  :: BG.FunPtr (SDL_GPUTextureFormat -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
sDL_GPUTextureFormatTexelBlockSize =
  BG.unsafePerformIO hs_bindgen_7020eb5f7daa1796

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUTextureSupportsFormat@
foreign import ccall unsafe "hs_bindgen_3c6e764809d2a384"
  hs_bindgen_3c6e764809d2a384_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUTextureSupportsFormat@
hs_bindgen_3c6e764809d2a384
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPUDevice
             -> SDL_GPUTextureFormat
             -> SDL_GPUTextureType
             -> SDL_GPUTextureUsageFlags
             -> IO BG.CBool
           )
       )
hs_bindgen_3c6e764809d2a384 =
  BG.fromFFIType hs_bindgen_3c6e764809d2a384_base

{-# NOINLINE sDL_GPUTextureSupportsFormat #-}

-- | Determines whether a texture format is supported for a given type and usage.
--
--     [@device@]: a GPU context.
--
--     [@format@]: the texture format to check.
--
--     [@type@]: the type of texture (2D, 3D, Cube).
--
--     [@usage@]: a bitmask of all usage scenarios to check.
--
--     [Returns]: whether the texture format is supported for this type and usage.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GPUTextureSupportsFormat@, defined at @SDL3\/SDL_gpu.h 4506:34@
sDL_GPUTextureSupportsFormat
  :: BG.FunPtr
       ( BG.Ptr SDL_GPUDevice
         -> SDL_GPUTextureFormat
         -> SDL_GPUTextureType
         -> SDL_GPUTextureUsageFlags
         -> IO BG.CBool
       )
sDL_GPUTextureSupportsFormat =
  BG.unsafePerformIO hs_bindgen_3c6e764809d2a384

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUTextureSupportsSampleCount@
foreign import ccall unsafe "hs_bindgen_6b69a9c844393ce7"
  hs_bindgen_6b69a9c844393ce7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GPUTextureSupportsSampleCount@
hs_bindgen_6b69a9c844393ce7
  :: IO (BG.FunPtr (BG.Ptr SDL_GPUDevice -> SDL_GPUTextureFormat -> SDL_GPUSampleCount -> IO BG.CBool))
hs_bindgen_6b69a9c844393ce7 =
  BG.fromFFIType hs_bindgen_6b69a9c844393ce7_base

{-# NOINLINE sDL_GPUTextureSupportsSampleCount #-}

-- | Determines if a sample count for a texture format is supported.
--
--     [@device@]: a GPU context.
--
--     [@format@]: the texture format to check.
--
--     [@sample_count@]: the sample count to check.
--
--     [Returns]: whether the sample count is supported for this texture format.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GPUTextureSupportsSampleCount@, defined at @SDL3\/SDL_gpu.h 4522:34@
sDL_GPUTextureSupportsSampleCount
  :: BG.FunPtr (BG.Ptr SDL_GPUDevice -> SDL_GPUTextureFormat -> SDL_GPUSampleCount -> IO BG.CBool)
sDL_GPUTextureSupportsSampleCount =
  BG.unsafePerformIO hs_bindgen_6b69a9c844393ce7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CalculateGPUTextureFormatSize@
foreign import ccall unsafe "hs_bindgen_fab34fd075b25f9a"
  hs_bindgen_fab34fd075b25f9a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_CalculateGPUTextureFormatSize@
hs_bindgen_fab34fd075b25f9a
  :: IO
       ( BG.FunPtr
           ( SDL_GPUTextureFormat
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
           )
       )
hs_bindgen_fab34fd075b25f9a =
  BG.fromFFIType hs_bindgen_fab34fd075b25f9a_base

{-# NOINLINE sDL_CalculateGPUTextureFormatSize #-}

-- | Calculate the size in bytes of a texture format with dimensions.
--
--     [@format@]: a texture format.
--
--     [@width@]: width in pixels.
--
--     [@height@]: height in pixels.
--
--     [@depth_or_layer_count@]: depth for 3D textures or layer count otherwise.
--
--     [Returns]: the size of a texture with this format and dimensions.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CalculateGPUTextureFormatSize@, defined at @SDL3\/SDL_gpu.h 4538:36@
sDL_CalculateGPUTextureFormatSize
  :: BG.FunPtr
       ( SDL_GPUTextureFormat
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
       )
sDL_CalculateGPUTextureFormatSize =
  BG.unsafePerformIO hs_bindgen_fab34fd075b25f9a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetPixelFormatFromGPUTextureFormat@
foreign import ccall unsafe "hs_bindgen_8fe9348f3a2816f5"
  hs_bindgen_8fe9348f3a2816f5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetPixelFormatFromGPUTextureFormat@
hs_bindgen_8fe9348f3a2816f5
  :: IO (BG.FunPtr (SDL_GPUTextureFormat -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat))
hs_bindgen_8fe9348f3a2816f5 =
  BG.fromFFIType hs_bindgen_8fe9348f3a2816f5_base

{-# NOINLINE sDL_GetPixelFormatFromGPUTextureFormat #-}

-- | Get the SDL pixel format corresponding to a GPU texture format.
--
--     [@format@]: a texture format.
--
--     [Returns]: the corresponding pixel format, or SDL_PIXELFORMAT_UNKNOWN if there is no corresponding pixel format.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetPixelFormatFromGPUTextureFormat@, defined at @SDL3\/SDL_gpu.h 4553:45@
sDL_GetPixelFormatFromGPUTextureFormat
  :: BG.FunPtr (SDL_GPUTextureFormat -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
sDL_GetPixelFormatFromGPUTextureFormat =
  BG.unsafePerformIO hs_bindgen_8fe9348f3a2816f5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUTextureFormatFromPixelFormat@
foreign import ccall unsafe "hs_bindgen_372069e59fc19080"
  hs_bindgen_372069e59fc19080_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_get_SDL_GetGPUTextureFormatFromPixelFormat@
hs_bindgen_372069e59fc19080
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO SDL_GPUTextureFormat))
hs_bindgen_372069e59fc19080 =
  BG.fromFFIType hs_bindgen_372069e59fc19080_base

{-# NOINLINE sDL_GetGPUTextureFormatFromPixelFormat #-}

-- | Get the GPU texture format corresponding to an SDL pixel format.
--
--     [@format@]: a pixel format.
--
--     [Returns]: the corresponding GPU texture format, or SDL_GPU_TEXTUREFORMAT_INVALID if there is no corresponding GPU texture format.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetGPUTextureFormatFromPixelFormat@, defined at @SDL3\/SDL_gpu.h 4565:50@
sDL_GetGPUTextureFormatFromPixelFormat
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO SDL_GPUTextureFormat)
sDL_GetGPUTextureFormatFromPixelFormat =
  BG.unsafePerformIO hs_bindgen_372069e59fc19080
