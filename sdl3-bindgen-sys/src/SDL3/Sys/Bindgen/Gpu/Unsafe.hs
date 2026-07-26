{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Gpu.Unsafe (
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GPUSupportsShaderFormats,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GPUSupportsProperties,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CreateGPUDevice,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CreateGPUDeviceWithProperties,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_DestroyGPUDevice,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GetNumGPUDrivers,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GetGPUDriver,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GetGPUDeviceDriver,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GetGPUShaderFormats,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GetGPUDeviceProperties,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CreateGPUComputePipeline,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CreateGPUGraphicsPipeline,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CreateGPUSampler,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CreateGPUShader,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CreateGPUTexture,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CreateGPUBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CreateGPUTransferBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SetGPUBufferName,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SetGPUTextureName,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_InsertGPUDebugLabel,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_PushGPUDebugGroup,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_PopGPUDebugGroup,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ReleaseGPUTexture,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ReleaseGPUSampler,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ReleaseGPUBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ReleaseGPUTransferBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ReleaseGPUComputePipeline,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ReleaseGPUShader,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ReleaseGPUGraphicsPipeline,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_AcquireGPUCommandBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_PushGPUVertexUniformData,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_PushGPUFragmentUniformData,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_PushGPUComputeUniformData,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BeginGPURenderPass,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUGraphicsPipeline,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SetGPUViewport,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SetGPUScissor,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SetGPUBlendConstants,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SetGPUStencilReference,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUVertexBuffers,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUIndexBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUVertexSamplers,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUVertexStorageTextures,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUVertexStorageBuffers,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUFragmentSamplers,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUFragmentStorageTextures,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUFragmentStorageBuffers,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_DrawGPUIndexedPrimitives,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_DrawGPUPrimitives,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_DrawGPUPrimitivesIndirect,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_DrawGPUIndexedPrimitivesIndirect,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_EndGPURenderPass,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BeginGPUComputePass,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUComputePipeline,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUComputeSamplers,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUComputeStorageTextures,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BindGPUComputeStorageBuffers,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_DispatchGPUCompute,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_DispatchGPUComputeIndirect,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_EndGPUComputePass,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_MapGPUTransferBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_UnmapGPUTransferBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BeginGPUCopyPass,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_UploadToGPUTexture,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_UploadToGPUBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CopyGPUTextureToTexture,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CopyGPUBufferToBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_DownloadFromGPUTexture,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_DownloadFromGPUBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_EndGPUCopyPass,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GenerateMipmapsForGPUTexture,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_BlitGPUTexture,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_WindowSupportsGPUSwapchainComposition,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_WindowSupportsGPUPresentMode,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ClaimWindowForGPUDevice,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ReleaseWindowFromGPUDevice,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SetGPUSwapchainParameters,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SetGPUAllowedFramesInFlight,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GetGPUSwapchainTextureFormat,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_AcquireGPUSwapchainTexture,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_WaitForGPUSwapchain,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_WaitAndAcquireGPUSwapchainTexture,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SubmitGPUCommandBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_SubmitGPUCommandBufferAndAcquireFence,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CancelGPUCommandBuffer,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_WaitForGPUIdle,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_WaitForGPUFences,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_QueryGPUFence,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_ReleaseGPUFence,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GPUTextureFormatTexelBlockSize,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GPUTextureSupportsFormat,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GPUTextureSupportsSampleCount,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_CalculateGPUTextureFormatSize,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GetPixelFormatFromGPUTextureFormat,
  SDL3.Sys.Bindgen.Gpu.Unsafe.sDL_GetGPUTextureFormatFromPixelFormat,
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
         , "_Bool hs_bindgen_e2f3f6a8de0de73c ("
         , "  SDL_GPUShaderFormat arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_GPUSupportsShaderFormats)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_c9ca417a5f641e3f ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return (SDL_GPUSupportsProperties)(arg1);"
         , "}"
         , "SDL_GPUDevice *hs_bindgen_b51ca46a4251feb8 ("
         , "  SDL_GPUShaderFormat arg1,"
         , "  _Bool arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return (SDL_CreateGPUDevice)(arg1, arg2, arg3);"
         , "}"
         , "SDL_GPUDevice *hs_bindgen_376515fb91ec90e3 ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateGPUDeviceWithProperties)(arg1);"
         , "}"
         , "void hs_bindgen_7ff5a8cdf38e3bf0 ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyGPUDevice)(arg1);"
         , "}"
         , "signed int hs_bindgen_6011a5df785dd689 (void)"
         , "{"
         , "  return (SDL_GetNumGPUDrivers)();"
         , "}"
         , "char const *hs_bindgen_5bd47cd4296c5cf8 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGPUDriver)(arg1);"
         , "}"
         , "char const *hs_bindgen_bf49abcda2b24803 ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGPUDeviceDriver)(arg1);"
         , "}"
         , "SDL_GPUShaderFormat hs_bindgen_20513b344f1e3b64 ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetGPUShaderFormats)(arg1);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "SDL_PropertiesID hs_bindgen_caf8299b42e53b94 ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetGPUDeviceProperties)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_GetGPUDeviceProperties requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "SDL_GPUComputePipeline *hs_bindgen_47c9f4418564565f ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUComputePipelineCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateGPUComputePipeline)(arg1, arg2);"
         , "}"
         , "SDL_GPUGraphicsPipeline *hs_bindgen_18c5db2a0d02cde2 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUGraphicsPipelineCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateGPUGraphicsPipeline)(arg1, arg2);"
         , "}"
         , "SDL_GPUSampler *hs_bindgen_a1a95a3f30be0f83 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUSamplerCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateGPUSampler)(arg1, arg2);"
         , "}"
         , "SDL_GPUShader *hs_bindgen_9bba04f484907a46 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUShaderCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateGPUShader)(arg1, arg2);"
         , "}"
         , "SDL_GPUTexture *hs_bindgen_e954a5b015dea03b ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTextureCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateGPUTexture)(arg1, arg2);"
         , "}"
         , "SDL_GPUBuffer *hs_bindgen_ed280f9c2dd5b278 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUBufferCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateGPUBuffer)(arg1, arg2);"
         , "}"
         , "SDL_GPUTransferBuffer *hs_bindgen_848522e8bdb350b2 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTransferBufferCreateInfo const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateGPUTransferBuffer)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_b8e2db9733a08cbe ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUBuffer *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  (SDL_SetGPUBufferName)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_6831ff7e87614fc1 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTexture *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  (SDL_SetGPUTextureName)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_56a7e36b3e8524dd ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (SDL_InsertGPUDebugLabel)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_41af45d04529f84d ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  (SDL_PushGPUDebugGroup)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_5dae404b2ebaa08b ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  (SDL_PopGPUDebugGroup)(arg1);"
         , "}"
         , "void hs_bindgen_64db5410128eae2d ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTexture *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseGPUTexture)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_13cdb1700ceeed7f ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUSampler *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseGPUSampler)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_fcdfc18ed875a278 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUBuffer *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseGPUBuffer)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_e731b5deaeeee3c1 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTransferBuffer *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseGPUTransferBuffer)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_f9bd20900c9e4080 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUComputePipeline *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseGPUComputePipeline)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_e516abeced8d372b ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUShader *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseGPUShader)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_9c01a03b4ad6f8be ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUGraphicsPipeline *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseGPUGraphicsPipeline)(arg1, arg2);"
         , "}"
         , "SDL_GPUCommandBuffer *hs_bindgen_27337c63b7093b75 ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  return (SDL_AcquireGPUCommandBuffer)(arg1);"
         , "}"
         , "void hs_bindgen_a5504d727b5181e0 ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  Uint32 arg2,"
         , "  void const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_PushGPUVertexUniformData)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_c1b93561fe6f3eb8 ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  Uint32 arg2,"
         , "  void const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_PushGPUFragmentUniformData)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_267be67577031d05 ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  Uint32 arg2,"
         , "  void const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_PushGPUComputeUniformData)(arg1, arg2, arg3, arg4);"
         , "}"
         , "SDL_GPURenderPass *hs_bindgen_b04297da6f821242 ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_GPUColorTargetInfo const *arg2,"
         , "  Uint32 arg3,"
         , "  SDL_GPUDepthStencilTargetInfo const *arg4"
         , ")"
         , "{"
         , "  return (SDL_BeginGPURenderPass)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_a6ebeaec23a3eebc ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUGraphicsPipeline *arg2"
         , ")"
         , "{"
         , "  (SDL_BindGPUGraphicsPipeline)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_f53e27fd1f10bfea ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUViewport const *arg2"
         , ")"
         , "{"
         , "  (SDL_SetGPUViewport)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_bc8dd2f3086d94d5 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  (SDL_SetGPUScissor)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_85e648c31f1fcb70 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_FColor *arg2"
         , ")"
         , "{"
         , "  (SDL_SetGPUBlendConstants)(arg1, *arg2);"
         , "}"
         , "void hs_bindgen_142400b7edd5f15e ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint8 arg2"
         , ")"
         , "{"
         , "  (SDL_SetGPUStencilReference)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_049713abad47ef65 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUBufferBinding const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUVertexBuffers)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_eebac58434b8d6c1 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUBufferBinding const *arg2,"
         , "  SDL_GPUIndexElementSize arg3"
         , ")"
         , "{"
         , "  (SDL_BindGPUIndexBuffer)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_466757558b7a4998 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTextureSamplerBinding const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUVertexSamplers)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_3099fb36563a23bf ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTexture *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUVertexStorageTextures)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_114f1ec46d1c4ca1 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUBuffer *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUVertexStorageBuffers)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_6120c617bd5f9a53 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTextureSamplerBinding const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUFragmentSamplers)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_a5741f59885921f3 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTexture *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUFragmentStorageTextures)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_2cc12141ee4494d6 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUBuffer *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUFragmentStorageBuffers)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_87e007a9ec36edc3 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4,"
         , "  Sint32 arg5,"
         , "  Uint32 arg6"
         , ")"
         , "{"
         , "  (SDL_DrawGPUIndexedPrimitives)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "void hs_bindgen_7b242b637f0074d8 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4,"
         , "  Uint32 arg5"
         , ")"
         , "{"
         , "  (SDL_DrawGPUPrimitives)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "void hs_bindgen_38685ef53cdffb5f ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUBuffer *arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_DrawGPUPrimitivesIndirect)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_04835577dd24b594 ("
         , "  SDL_GPURenderPass *arg1,"
         , "  SDL_GPUBuffer *arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_DrawGPUIndexedPrimitivesIndirect)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_cd298cdaadbf367d ("
         , "  SDL_GPURenderPass *arg1"
         , ")"
         , "{"
         , "  (SDL_EndGPURenderPass)(arg1);"
         , "}"
         , "SDL_GPUComputePass *hs_bindgen_7e4922a40e945137 ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_GPUStorageTextureReadWriteBinding const *arg2,"
         , "  Uint32 arg3,"
         , "  SDL_GPUStorageBufferReadWriteBinding const *arg4,"
         , "  Uint32 arg5"
         , ")"
         , "{"
         , "  return (SDL_BeginGPUComputePass)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "void hs_bindgen_3d4216ca508a9022 ("
         , "  SDL_GPUComputePass *arg1,"
         , "  SDL_GPUComputePipeline *arg2"
         , ")"
         , "{"
         , "  (SDL_BindGPUComputePipeline)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_2a02bb807885f88d ("
         , "  SDL_GPUComputePass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTextureSamplerBinding const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUComputeSamplers)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_a743533e288c69f5 ("
         , "  SDL_GPUComputePass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUTexture *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUComputeStorageTextures)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_1be365d38addb5cf ("
         , "  SDL_GPUComputePass *arg1,"
         , "  Uint32 arg2,"
         , "  SDL_GPUBuffer *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_BindGPUComputeStorageBuffers)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_08d7249b66bd0658 ("
         , "  SDL_GPUComputePass *arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  (SDL_DispatchGPUCompute)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_9b425608a854a4f5 ("
         , "  SDL_GPUComputePass *arg1,"
         , "  SDL_GPUBuffer *arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  (SDL_DispatchGPUComputeIndirect)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_bf20561443153c08 ("
         , "  SDL_GPUComputePass *arg1"
         , ")"
         , "{"
         , "  (SDL_EndGPUComputePass)(arg1);"
         , "}"
         , "void *hs_bindgen_075892bcba4ad890 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTransferBuffer *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_MapGPUTransferBuffer)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_8721518ac51d5884 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTransferBuffer *arg2"
         , ")"
         , "{"
         , "  (SDL_UnmapGPUTransferBuffer)(arg1, arg2);"
         , "}"
         , "SDL_GPUCopyPass *hs_bindgen_7990c88447a637d9 ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  return (SDL_BeginGPUCopyPass)(arg1);"
         , "}"
         , "void hs_bindgen_7dc2e64aebecaf47 ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUTextureTransferInfo const *arg2,"
         , "  SDL_GPUTextureRegion const *arg3,"
         , "  _Bool arg4"
         , ")"
         , "{"
         , "  (SDL_UploadToGPUTexture)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_c8311e817b0149e1 ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUTransferBufferLocation const *arg2,"
         , "  SDL_GPUBufferRegion const *arg3,"
         , "  _Bool arg4"
         , ")"
         , "{"
         , "  (SDL_UploadToGPUBuffer)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_8d76c446224fa54a ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUTextureLocation const *arg2,"
         , "  SDL_GPUTextureLocation const *arg3,"
         , "  Uint32 arg4,"
         , "  Uint32 arg5,"
         , "  Uint32 arg6,"
         , "  _Bool arg7"
         , ")"
         , "{"
         , "  (SDL_CopyGPUTextureToTexture)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         , "void hs_bindgen_72560eca0be1bbd9 ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUBufferLocation const *arg2,"
         , "  SDL_GPUBufferLocation const *arg3,"
         , "  Uint32 arg4,"
         , "  _Bool arg5"
         , ")"
         , "{"
         , "  (SDL_CopyGPUBufferToBuffer)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "void hs_bindgen_f583e024c47915e6 ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUTextureRegion const *arg2,"
         , "  SDL_GPUTextureTransferInfo const *arg3"
         , ")"
         , "{"
         , "  (SDL_DownloadFromGPUTexture)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_d1604453e77cbbd9 ("
         , "  SDL_GPUCopyPass *arg1,"
         , "  SDL_GPUBufferRegion const *arg2,"
         , "  SDL_GPUTransferBufferLocation const *arg3"
         , ")"
         , "{"
         , "  (SDL_DownloadFromGPUBuffer)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_37f1aba920cf70df ("
         , "  SDL_GPUCopyPass *arg1"
         , ")"
         , "{"
         , "  (SDL_EndGPUCopyPass)(arg1);"
         , "}"
         , "void hs_bindgen_487b5d55898cb8c9 ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_GPUTexture *arg2"
         , ")"
         , "{"
         , "  (SDL_GenerateMipmapsForGPUTexture)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_5ea32ac13985443b ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_GPUBlitInfo const *arg2"
         , ")"
         , "{"
         , "  (SDL_BlitGPUTexture)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_7874a69b9fb7574a ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUSwapchainComposition arg3"
         , ")"
         , "{"
         , "  return (SDL_WindowSupportsGPUSwapchainComposition)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_e7e69a1723f7ad13 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUPresentMode arg3"
         , ")"
         , "{"
         , "  return (SDL_WindowSupportsGPUPresentMode)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_709c34298cd845c0 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return (SDL_ClaimWindowForGPUDevice)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_5580ffa5115be31a ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseWindowFromGPUDevice)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_dd5044a4ed37551c ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUSwapchainComposition arg3,"
         , "  SDL_GPUPresentMode arg4"
         , ")"
         , "{"
         , "  return (SDL_SetGPUSwapchainParameters)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_376c36f4c99e1f9a ("
         , "  SDL_GPUDevice *arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_SetGPUAllowedFramesInFlight)(arg1, arg2);"
         , "}"
         , "SDL_GPUTextureFormat hs_bindgen_4dd16ea5d2d75e5c ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGPUSwapchainTextureFormat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_458d79c8728f00ab ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUTexture **arg3,"
         , "  Uint32 *arg4,"
         , "  Uint32 *arg5"
         , ")"
         , "{"
         , "  return (SDL_AcquireGPUSwapchainTexture)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_fb018ba3fc209740 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return (SDL_WaitForGPUSwapchain)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_a454f9124adeea81 ("
         , "  SDL_GPUCommandBuffer *arg1,"
         , "  SDL_Window *arg2,"
         , "  SDL_GPUTexture **arg3,"
         , "  Uint32 *arg4,"
         , "  Uint32 *arg5"
         , ")"
         , "{"
         , "  return (SDL_WaitAndAcquireGPUSwapchainTexture)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_82bac871c3cbe3e4 ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  return (SDL_SubmitGPUCommandBuffer)(arg1);"
         , "}"
         , "SDL_GPUFence *hs_bindgen_34bbe24268d3620c ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  return (SDL_SubmitGPUCommandBufferAndAcquireFence)(arg1);"
         , "}"
         , "_Bool hs_bindgen_34c4d8861fe9ae5b ("
         , "  SDL_GPUCommandBuffer *arg1"
         , ")"
         , "{"
         , "  return (SDL_CancelGPUCommandBuffer)(arg1);"
         , "}"
         , "_Bool hs_bindgen_2cf574d324b28e44 ("
         , "  SDL_GPUDevice *arg1"
         , ")"
         , "{"
         , "  return (SDL_WaitForGPUIdle)(arg1);"
         , "}"
         , "_Bool hs_bindgen_90c7f8f4aae22e6a ("
         , "  SDL_GPUDevice *arg1,"
         , "  _Bool arg2,"
         , "  SDL_GPUFence *const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return (SDL_WaitForGPUFences)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_09f80c8e0b395d04 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUFence *arg2"
         , ")"
         , "{"
         , "  return (SDL_QueryGPUFence)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_97087dbb893b61af ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUFence *arg2"
         , ")"
         , "{"
         , "  (SDL_ReleaseGPUFence)(arg1, arg2);"
         , "}"
         , "Uint32 hs_bindgen_121bf00d55a1a113 ("
         , "  SDL_GPUTextureFormat arg1"
         , ")"
         , "{"
         , "  return (SDL_GPUTextureFormatTexelBlockSize)(arg1);"
         , "}"
         , "_Bool hs_bindgen_0c3c275a5e945ebd ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTextureFormat arg2,"
         , "  SDL_GPUTextureType arg3,"
         , "  SDL_GPUTextureUsageFlags arg4"
         , ")"
         , "{"
         , "  return (SDL_GPUTextureSupportsFormat)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_0870889673874577 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_GPUTextureFormat arg2,"
         , "  SDL_GPUSampleCount arg3"
         , ")"
         , "{"
         , "  return (SDL_GPUTextureSupportsSampleCount)(arg1, arg2, arg3);"
         , "}"
         , "Uint32 hs_bindgen_222b65bb58cce08e ("
         , "  SDL_GPUTextureFormat arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return (SDL_CalculateGPUTextureFormatSize)(arg1, arg2, arg3, arg4);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "SDL_PixelFormat hs_bindgen_3a8763f112daa871 ("
         , "  SDL_GPUTextureFormat arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetPixelFormatFromGPUTextureFormat)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_GetPixelFormatFromGPUTextureFormat requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "SDL_GPUTextureFormat hs_bindgen_77c5ed2882b80ff3 ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetGPUTextureFormatFromPixelFormat)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_GetGPUTextureFormatFromPixelFormat requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUSupportsShaderFormats@
foreign import ccall unsafe "hs_bindgen_e2f3f6a8de0de73c"
  hs_bindgen_e2f3f6a8de0de73c_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUSupportsShaderFormats@
hs_bindgen_e2f3f6a8de0de73c
  :: SDL_GPUShaderFormat
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_e2f3f6a8de0de73c =
  BG.fromFFIType hs_bindgen_e2f3f6a8de0de73c_base

-- | Checks for GPU runtime support.
--
--     [Returns]: true if supported, false otherwise.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUDevice'
--
--     [C declaration]: @SDL_GPUSupportsShaderFormats@, defined at @SDL3\/SDL_gpu.h 2200:34@
sDL_GPUSupportsShaderFormats
  :: SDL_GPUShaderFormat
  -- ^
  --
  --           [@format_flags@]: a bitflag indicating which shader formats the app is able to provide.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the preferred GPU driver, or NULL to let SDL pick the optimal driver.
  -> IO BG.CBool
sDL_GPUSupportsShaderFormats =
  hs_bindgen_e2f3f6a8de0de73c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUSupportsProperties@
foreign import ccall unsafe "hs_bindgen_c9ca417a5f641e3f"
  hs_bindgen_c9ca417a5f641e3f_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUSupportsProperties@
hs_bindgen_c9ca417a5f641e3f
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO BG.CBool
hs_bindgen_c9ca417a5f641e3f =
  BG.fromFFIType hs_bindgen_c9ca417a5f641e3f_base

-- | Checks for GPU runtime support.
--
--     [Returns]: true if supported, false otherwise.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUDeviceWithProperties'
--
--     [C declaration]: @SDL_GPUSupportsProperties@, defined at @SDL3\/SDL_gpu.h 2214:34@
sDL_GPUSupportsProperties
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO BG.CBool
sDL_GPUSupportsProperties =
  hs_bindgen_c9ca417a5f641e3f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUDevice@
foreign import ccall unsafe "hs_bindgen_b51ca46a4251feb8"
  hs_bindgen_b51ca46a4251feb8_base
    :: BG.Word32
    -> BG.Word8
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUDevice@
hs_bindgen_b51ca46a4251feb8
  :: SDL_GPUShaderFormat
  -> BG.CBool
  -> PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_GPUDevice)
hs_bindgen_b51ca46a4251feb8 =
  BG.fromFFIType hs_bindgen_b51ca46a4251feb8_base

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
--     [Returns]: a GPU context on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUDeviceWithProperties', 'sDL_GetGPUShaderFormats', 'sDL_GetGPUDeviceDriver', 'sDL_DestroyGPUDevice', 'sDL_GPUSupportsShaderFormats'
--
--     [C declaration]: @SDL_CreateGPUDevice@, defined at @SDL3\/SDL_gpu.h 2243:45@
sDL_CreateGPUDevice
  :: SDL_GPUShaderFormat
  -- ^
  --
  --           [@format_flags@]: a bitflag indicating which shader formats the app is able to provide.
  -> BG.CBool
  -- ^
  --
  --           [@debug_mode@]: enable debug mode properties and validations.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the preferred GPU driver, or NULL to let SDL pick the optimal driver.
  -> IO (BG.Ptr SDL_GPUDevice)
sDL_CreateGPUDevice = hs_bindgen_b51ca46a4251feb8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUDeviceWithProperties@
foreign import ccall unsafe "hs_bindgen_376515fb91ec90e3"
  hs_bindgen_376515fb91ec90e3_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUDeviceWithProperties@
hs_bindgen_376515fb91ec90e3
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO (BG.Ptr SDL_GPUDevice)
hs_bindgen_376515fb91ec90e3 =
  BG.fromFFIType hs_bindgen_376515fb91ec90e3_base

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
--     [Returns]: a GPU context on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGPUShaderFormats', 'sDL_GetGPUDeviceDriver', 'sDL_DestroyGPUDevice', 'sDL_GPUSupportsProperties'
--
--     [C declaration]: @SDL_CreateGPUDeviceWithProperties@, defined at @SDL3\/SDL_gpu.h 2360:45@
sDL_CreateGPUDeviceWithProperties
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_GPUDevice)
sDL_CreateGPUDeviceWithProperties =
  hs_bindgen_376515fb91ec90e3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DestroyGPUDevice@
foreign import ccall unsafe "hs_bindgen_7ff5a8cdf38e3bf0"
  hs_bindgen_7ff5a8cdf38e3bf0_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DestroyGPUDevice@
hs_bindgen_7ff5a8cdf38e3bf0
  :: BG.Ptr SDL_GPUDevice
  -> IO ()
hs_bindgen_7ff5a8cdf38e3bf0 =
  BG.fromFFIType hs_bindgen_7ff5a8cdf38e3bf0_base

-- | Destroys a GPU context previously returned by SDL_CreateGPUDevice.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUDevice'
--
--     [C declaration]: @SDL_DestroyGPUDevice@, defined at @SDL3\/SDL_gpu.h 2422:34@
sDL_DestroyGPUDevice
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context to destroy.
  -> IO ()
sDL_DestroyGPUDevice = hs_bindgen_7ff5a8cdf38e3bf0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetNumGPUDrivers@
foreign import ccall unsafe "hs_bindgen_6011a5df785dd689"
  hs_bindgen_6011a5df785dd689_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetNumGPUDrivers@
hs_bindgen_6011a5df785dd689 :: IO BG.CInt
hs_bindgen_6011a5df785dd689 =
  BG.fromFFIType hs_bindgen_6011a5df785dd689_base

-- | Get the number of GPU drivers compiled into SDL.
--
--     [Returns]: the number of built in GPU drivers.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGPUDriver'
--
--     [C declaration]: @SDL_GetNumGPUDrivers@, defined at @SDL3\/SDL_gpu.h 2433:33@
sDL_GetNumGPUDrivers :: IO BG.CInt
sDL_GetNumGPUDrivers = hs_bindgen_6011a5df785dd689

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUDriver@
foreign import ccall unsafe "hs_bindgen_5bd47cd4296c5cf8"
  hs_bindgen_5bd47cd4296c5cf8_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUDriver@
hs_bindgen_5bd47cd4296c5cf8
  :: BG.CInt
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_5bd47cd4296c5cf8 =
  BG.fromFFIType hs_bindgen_5bd47cd4296c5cf8_base

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
--     [See also]: 'sDL_GetNumGPUDrivers'
--
--     [C declaration]: @SDL_GetGPUDriver@, defined at @SDL3\/SDL_gpu.h 2452:42@
sDL_GetGPUDriver
  :: BG.CInt
  -- ^
  --
  --           [@index@]: the index of a GPU driver.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGPUDriver = hs_bindgen_5bd47cd4296c5cf8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUDeviceDriver@
foreign import ccall unsafe "hs_bindgen_bf49abcda2b24803"
  hs_bindgen_bf49abcda2b24803_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUDeviceDriver@
hs_bindgen_bf49abcda2b24803
  :: BG.Ptr SDL_GPUDevice
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_bf49abcda2b24803 =
  BG.fromFFIType hs_bindgen_bf49abcda2b24803_base

-- | Returns the name of the backend used to create this GPU context.
--
--     [Returns]: the name of the device\'s driver, or NULL on error.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGPUDeviceDriver@, defined at @SDL3\/SDL_gpu.h 2462:42@
sDL_GetGPUDeviceDriver
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetGPUDeviceDriver = hs_bindgen_bf49abcda2b24803

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUShaderFormats@
foreign import ccall unsafe "hs_bindgen_20513b344f1e3b64"
  hs_bindgen_20513b344f1e3b64_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUShaderFormats@
hs_bindgen_20513b344f1e3b64
  :: BG.Ptr SDL_GPUDevice
  -> IO SDL_GPUShaderFormat
hs_bindgen_20513b344f1e3b64 =
  BG.fromFFIType hs_bindgen_20513b344f1e3b64_base

-- | Returns the supported shader formats for this GPU context.
--
--     [Returns]: a bitflag indicating which shader formats the driver is able to consume.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGPUShaderFormats@, defined at @SDL3\/SDL_gpu.h 2473:49@
sDL_GetGPUShaderFormats
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context to query.
  -> IO SDL_GPUShaderFormat
sDL_GetGPUShaderFormats = hs_bindgen_20513b344f1e3b64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUDeviceProperties@
foreign import ccall unsafe "hs_bindgen_caf8299b42e53b94"
  hs_bindgen_caf8299b42e53b94_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUDeviceProperties@
hs_bindgen_caf8299b42e53b94
  :: BG.Ptr SDL_GPUDevice
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_caf8299b42e53b94 =
  BG.fromFFIType hs_bindgen_caf8299b42e53b94_base

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
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetGPUDeviceProperties@, defined at @SDL3\/SDL_gpu.h 2577:46@
sDL_GetGPUDeviceProperties
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetGPUDeviceProperties =
  hs_bindgen_caf8299b42e53b94

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUComputePipeline@
foreign import ccall unsafe "hs_bindgen_47c9f4418564565f"
  hs_bindgen_47c9f4418564565f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUComputePipeline@
hs_bindgen_47c9f4418564565f
  :: BG.Ptr SDL_GPUDevice
  -> PtrConst.PtrConst SDL_GPUComputePipelineCreateInfo
  -> IO (BG.Ptr SDL_GPUComputePipeline)
hs_bindgen_47c9f4418564565f =
  BG.fromFFIType hs_bindgen_47c9f4418564565f_base

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
--     [Returns]: a compute pipeline object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindGPUComputePipeline', 'sDL_ReleaseGPUComputePipeline'
--
--     [C declaration]: @SDL_CreateGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 2632:54@
sDL_CreateGPUComputePipeline
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUComputePipelineCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the compute pipeline to create.
  -> IO (BG.Ptr SDL_GPUComputePipeline)
sDL_CreateGPUComputePipeline =
  hs_bindgen_47c9f4418564565f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUGraphicsPipeline@
foreign import ccall unsafe "hs_bindgen_18c5db2a0d02cde2"
  hs_bindgen_18c5db2a0d02cde2_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUGraphicsPipeline@
hs_bindgen_18c5db2a0d02cde2
  :: BG.Ptr SDL_GPUDevice
  -> PtrConst.PtrConst SDL_GPUGraphicsPipelineCreateInfo
  -> IO (BG.Ptr SDL_GPUGraphicsPipeline)
hs_bindgen_18c5db2a0d02cde2 =
  BG.fromFFIType hs_bindgen_18c5db2a0d02cde2_base

-- | Creates a pipeline object to be used in a graphics workflow.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a graphics pipeline object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader', 'sDL_BindGPUGraphicsPipeline', 'sDL_ReleaseGPUGraphicsPipeline'
--
--     [C declaration]: @SDL_CreateGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 2659:55@
sDL_CreateGPUGraphicsPipeline
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUGraphicsPipelineCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the graphics pipeline to create.
  -> IO (BG.Ptr SDL_GPUGraphicsPipeline)
sDL_CreateGPUGraphicsPipeline =
  hs_bindgen_18c5db2a0d02cde2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUSampler@
foreign import ccall unsafe "hs_bindgen_a1a95a3f30be0f83"
  hs_bindgen_a1a95a3f30be0f83_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUSampler@
hs_bindgen_a1a95a3f30be0f83
  :: BG.Ptr SDL_GPUDevice
  -> PtrConst.PtrConst SDL_GPUSamplerCreateInfo
  -> IO (BG.Ptr SDL_GPUSampler)
hs_bindgen_a1a95a3f30be0f83 =
  BG.fromFFIType hs_bindgen_a1a95a3f30be0f83_base

-- | Creates a sampler object to be used when binding textures in a graphics workflow.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a sampler object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindGPUVertexSamplers', 'sDL_BindGPUFragmentSamplers', 'sDL_ReleaseGPUSampler'
--
--     [C declaration]: @SDL_CreateGPUSampler@, defined at @SDL3\/SDL_gpu.h 2686:46@
sDL_CreateGPUSampler
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUSamplerCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the sampler to create.
  -> IO (BG.Ptr SDL_GPUSampler)
sDL_CreateGPUSampler = hs_bindgen_a1a95a3f30be0f83

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUShader@
foreign import ccall unsafe "hs_bindgen_9bba04f484907a46"
  hs_bindgen_9bba04f484907a46_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUShader@
hs_bindgen_9bba04f484907a46
  :: BG.Ptr SDL_GPUDevice
  -> PtrConst.PtrConst SDL_GPUShaderCreateInfo
  -> IO (BG.Ptr SDL_GPUShader)
hs_bindgen_9bba04f484907a46 =
  BG.fromFFIType hs_bindgen_9bba04f484907a46_base

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
--     [Returns]: a shader object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUGraphicsPipeline', 'sDL_ReleaseGPUShader'
--
--     [C declaration]: @SDL_CreateGPUShader@, defined at @SDL3\/SDL_gpu.h 2765:45@
sDL_CreateGPUShader
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUShaderCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the shader to create.
  -> IO (BG.Ptr SDL_GPUShader)
sDL_CreateGPUShader = hs_bindgen_9bba04f484907a46

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUTexture@
foreign import ccall unsafe "hs_bindgen_e954a5b015dea03b"
  hs_bindgen_e954a5b015dea03b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUTexture@
hs_bindgen_e954a5b015dea03b
  :: BG.Ptr SDL_GPUDevice
  -> PtrConst.PtrConst SDL_GPUTextureCreateInfo
  -> IO (BG.Ptr SDL_GPUTexture)
hs_bindgen_e954a5b015dea03b =
  BG.fromFFIType hs_bindgen_e954a5b015dea03b_base

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
--     [Returns]: a texture object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUTexture', 'sDL_DownloadFromGPUTexture', 'sDL_BeginGPURenderPass', 'sDL_BeginGPUComputePass', 'sDL_BindGPUVertexSamplers', 'sDL_BindGPUVertexStorageTextures', 'sDL_BindGPUFragmentSamplers', 'sDL_BindGPUFragmentStorageTextures', 'sDL_BindGPUComputeStorageTextures', 'sDL_BlitGPUTexture', 'sDL_ReleaseGPUTexture', 'sDL_GPUTextureSupportsFormat'
--
--     [C declaration]: @SDL_CreateGPUTexture@, defined at @SDL3\/SDL_gpu.h 2829:46@
sDL_CreateGPUTexture
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUTextureCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the texture to create.
  -> IO (BG.Ptr SDL_GPUTexture)
sDL_CreateGPUTexture = hs_bindgen_e954a5b015dea03b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUBuffer@
foreign import ccall unsafe "hs_bindgen_ed280f9c2dd5b278"
  hs_bindgen_ed280f9c2dd5b278_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUBuffer@
hs_bindgen_ed280f9c2dd5b278
  :: BG.Ptr SDL_GPUDevice
  -> PtrConst.PtrConst SDL_GPUBufferCreateInfo
  -> IO (BG.Ptr SDL_GPUBuffer)
hs_bindgen_ed280f9c2dd5b278 =
  BG.fromFFIType hs_bindgen_ed280f9c2dd5b278_base

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
--     [Returns]: a buffer object on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUBuffer', 'sDL_DownloadFromGPUBuffer', 'sDL_CopyGPUBufferToBuffer', 'sDL_BindGPUVertexBuffers', 'sDL_BindGPUIndexBuffer', 'sDL_BindGPUVertexStorageBuffers', 'sDL_BindGPUFragmentStorageBuffers', 'sDL_DrawGPUPrimitivesIndirect', 'sDL_DrawGPUIndexedPrimitivesIndirect', 'sDL_BindGPUComputeStorageBuffers', 'sDL_DispatchGPUComputeIndirect', 'sDL_ReleaseGPUBuffer'
--
--     [C declaration]: @SDL_CreateGPUBuffer@, defined at @SDL3\/SDL_gpu.h 2885:45@
sDL_CreateGPUBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUBufferCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the buffer to create.
  -> IO (BG.Ptr SDL_GPUBuffer)
sDL_CreateGPUBuffer = hs_bindgen_ed280f9c2dd5b278

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUTransferBuffer@
foreign import ccall unsafe "hs_bindgen_848522e8bdb350b2"
  hs_bindgen_848522e8bdb350b2_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CreateGPUTransferBuffer@
hs_bindgen_848522e8bdb350b2
  :: BG.Ptr SDL_GPUDevice
  -> PtrConst.PtrConst SDL_GPUTransferBufferCreateInfo
  -> IO (BG.Ptr SDL_GPUTransferBuffer)
hs_bindgen_848522e8bdb350b2 =
  BG.fromFFIType hs_bindgen_848522e8bdb350b2_base

-- | Creates a transfer buffer to be used when uploading to or downloading from graphics resources.
--
--     Download buffers can be particularly expensive to create, so it is good practice to reuse them if data will be downloaded regularly.
--
--     There are optional properties that can be provided through @props@. These are the supported properties:
--
--     * @'sDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING'@: a name that can be displayed in debugging tools.
--
--     [Returns]: a transfer buffer on success, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUBuffer', 'sDL_DownloadFromGPUBuffer', 'sDL_UploadToGPUTexture', 'sDL_DownloadFromGPUTexture', 'sDL_ReleaseGPUTransferBuffer'
--
--     [C declaration]: @SDL_CreateGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 2918:53@
sDL_CreateGPUTransferBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU Context.
  -> PtrConst.PtrConst SDL_GPUTransferBufferCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the state of the transfer buffer to create.
  -> IO (BG.Ptr SDL_GPUTransferBuffer)
sDL_CreateGPUTransferBuffer =
  hs_bindgen_848522e8bdb350b2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUBufferName@
foreign import ccall unsafe "hs_bindgen_b8e2db9733a08cbe"
  hs_bindgen_b8e2db9733a08cbe_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUBufferName@
hs_bindgen_b8e2db9733a08cbe
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUBuffer
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_b8e2db9733a08cbe =
  BG.fromFFIType hs_bindgen_b8e2db9733a08cbe_base

-- | Sets an arbitrary string constant to label a buffer.
--
--     You should use SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING with SDL_CreateGPUBuffer instead of this function to avoid thread safety issues.
--
--     [Thread safety]: This function is not thread safe, you must make sure the buffer is not simultaneously used by any other thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUBuffer'
--
--     [C declaration]: @SDL_SetGPUBufferName@, defined at @SDL3\/SDL_gpu.h 2943:34@
sDL_SetGPUBufferName
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
sDL_SetGPUBufferName = hs_bindgen_b8e2db9733a08cbe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUTextureName@
foreign import ccall unsafe "hs_bindgen_6831ff7e87614fc1"
  hs_bindgen_6831ff7e87614fc1_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUTextureName@
hs_bindgen_6831ff7e87614fc1
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUTexture
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_6831ff7e87614fc1 =
  BG.fromFFIType hs_bindgen_6831ff7e87614fc1_base

-- | Sets an arbitrary string constant to label a texture.
--
--     You should use SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING with SDL_CreateGPUTexture instead of this function to avoid thread safety issues.
--
--     [Thread safety]: This function is not thread safe, you must make sure the texture is not simultaneously used by any other thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUTexture'
--
--     [C declaration]: @SDL_SetGPUTextureName@, defined at @SDL3\/SDL_gpu.h 2966:34@
sDL_SetGPUTextureName
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
sDL_SetGPUTextureName = hs_bindgen_6831ff7e87614fc1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_InsertGPUDebugLabel@
foreign import ccall unsafe "hs_bindgen_56a7e36b3e8524dd"
  hs_bindgen_56a7e36b3e8524dd_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_InsertGPUDebugLabel@
hs_bindgen_56a7e36b3e8524dd
  :: BG.Ptr SDL_GPUCommandBuffer
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_56a7e36b3e8524dd =
  BG.fromFFIType hs_bindgen_56a7e36b3e8524dd_base

-- | Inserts an arbitrary string label into the command buffer callstream.
--
--     Useful for debugging.
--
--     On Direct3D 12, using SDL_InsertGPUDebugLabel requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_InsertGPUDebugLabel@, defined at @SDL3\/SDL_gpu.h 2987:34@
sDL_InsertGPUDebugLabel
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: a UTF-8 string constant to insert as the label.
  -> IO ()
sDL_InsertGPUDebugLabel = hs_bindgen_56a7e36b3e8524dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PushGPUDebugGroup@
foreign import ccall unsafe "hs_bindgen_41af45d04529f84d"
  hs_bindgen_41af45d04529f84d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PushGPUDebugGroup@
hs_bindgen_41af45d04529f84d
  :: BG.Ptr SDL_GPUCommandBuffer
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_41af45d04529f84d =
  BG.fromFFIType hs_bindgen_41af45d04529f84d_base

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
--     @since 3.2.0
--
--     [See also]: 'sDL_PopGPUDebugGroup'
--
--     [C declaration]: @SDL_PushGPUDebugGroup@, defined at @SDL3\/SDL_gpu.h 3017:34@
sDL_PushGPUDebugGroup
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: a UTF-8 string constant that names the group.
  -> IO ()
sDL_PushGPUDebugGroup = hs_bindgen_41af45d04529f84d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PopGPUDebugGroup@
foreign import ccall unsafe "hs_bindgen_5dae404b2ebaa08b"
  hs_bindgen_5dae404b2ebaa08b_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PopGPUDebugGroup@
hs_bindgen_5dae404b2ebaa08b
  :: BG.Ptr SDL_GPUCommandBuffer
  -> IO ()
hs_bindgen_5dae404b2ebaa08b =
  BG.fromFFIType hs_bindgen_5dae404b2ebaa08b_base

-- | Ends the most-recently pushed debug group.
--
--     On Direct3D 12, using SDL_PopGPUDebugGroup requires WinPixEventRuntime.dll to be in your PATH or in the same directory as your executable. See [here](https://devblogs.microsoft.com/pix/winpixeventruntime/) for instructions on how to obtain it.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PushGPUDebugGroup'
--
--     [C declaration]: @SDL_PopGPUDebugGroup@, defined at @SDL3\/SDL_gpu.h 3035:34@
sDL_PopGPUDebugGroup
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO ()
sDL_PopGPUDebugGroup = hs_bindgen_5dae404b2ebaa08b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUTexture@
foreign import ccall unsafe "hs_bindgen_64db5410128eae2d"
  hs_bindgen_64db5410128eae2d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUTexture@
hs_bindgen_64db5410128eae2d
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUTexture
  -> IO ()
hs_bindgen_64db5410128eae2d =
  BG.fromFFIType hs_bindgen_64db5410128eae2d_base

-- | Frees the given texture as soon as it is safe to do so.
--
--     You must not reference the texture after calling this function.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUTexture@, defined at @SDL3\/SDL_gpu.h 3050:34@
sDL_ReleaseGPUTexture
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTexture
  -- ^
  --
  --           [@texture@]: a texture to be destroyed.
  -> IO ()
sDL_ReleaseGPUTexture = hs_bindgen_64db5410128eae2d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUSampler@
foreign import ccall unsafe "hs_bindgen_13cdb1700ceeed7f"
  hs_bindgen_13cdb1700ceeed7f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUSampler@
hs_bindgen_13cdb1700ceeed7f
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUSampler
  -> IO ()
hs_bindgen_13cdb1700ceeed7f =
  BG.fromFFIType hs_bindgen_13cdb1700ceeed7f_base

-- | Frees the given sampler as soon as it is safe to do so.
--
--     You must not reference the sampler after calling this function.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUSampler@, defined at @SDL3\/SDL_gpu.h 3064:34@
sDL_ReleaseGPUSampler
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUSampler
  -- ^
  --
  --           [@sampler@]: a sampler to be destroyed.
  -> IO ()
sDL_ReleaseGPUSampler = hs_bindgen_13cdb1700ceeed7f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUBuffer@
foreign import ccall unsafe "hs_bindgen_fcdfc18ed875a278"
  hs_bindgen_fcdfc18ed875a278_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUBuffer@
hs_bindgen_fcdfc18ed875a278
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUBuffer
  -> IO ()
hs_bindgen_fcdfc18ed875a278 =
  BG.fromFFIType hs_bindgen_fcdfc18ed875a278_base

-- | Frees the given buffer as soon as it is safe to do so.
--
--     You must not reference the buffer after calling this function.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUBuffer@, defined at @SDL3\/SDL_gpu.h 3078:34@
sDL_ReleaseGPUBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer to be destroyed.
  -> IO ()
sDL_ReleaseGPUBuffer = hs_bindgen_fcdfc18ed875a278

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUTransferBuffer@
foreign import ccall unsafe "hs_bindgen_e731b5deaeeee3c1"
  hs_bindgen_e731b5deaeeee3c1_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUTransferBuffer@
hs_bindgen_e731b5deaeeee3c1
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUTransferBuffer
  -> IO ()
hs_bindgen_e731b5deaeeee3c1 =
  BG.fromFFIType hs_bindgen_e731b5deaeeee3c1_base

-- | Frees the given transfer buffer as soon as it is safe to do so.
--
--     You must not reference the transfer buffer after calling this function.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3092:34@
sDL_ReleaseGPUTransferBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTransferBuffer
  -- ^
  --
  --           [@transfer_buffer@]: a transfer buffer to be destroyed.
  -> IO ()
sDL_ReleaseGPUTransferBuffer =
  hs_bindgen_e731b5deaeeee3c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUComputePipeline@
foreign import ccall unsafe "hs_bindgen_f9bd20900c9e4080"
  hs_bindgen_f9bd20900c9e4080_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUComputePipeline@
hs_bindgen_f9bd20900c9e4080
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUComputePipeline
  -> IO ()
hs_bindgen_f9bd20900c9e4080 =
  BG.fromFFIType hs_bindgen_f9bd20900c9e4080_base

-- | Frees the given compute pipeline as soon as it is safe to do so.
--
--     You must not reference the compute pipeline after calling this function.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 3106:34@
sDL_ReleaseGPUComputePipeline
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUComputePipeline
  -- ^
  --
  --           [@compute_pipeline@]: a compute pipeline to be destroyed.
  -> IO ()
sDL_ReleaseGPUComputePipeline =
  hs_bindgen_f9bd20900c9e4080

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUShader@
foreign import ccall unsafe "hs_bindgen_e516abeced8d372b"
  hs_bindgen_e516abeced8d372b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUShader@
hs_bindgen_e516abeced8d372b
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUShader
  -> IO ()
hs_bindgen_e516abeced8d372b =
  BG.fromFFIType hs_bindgen_e516abeced8d372b_base

-- | Frees the given shader as soon as it is safe to do so.
--
--     You must not reference the shader after calling this function.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUShader@, defined at @SDL3\/SDL_gpu.h 3120:34@
sDL_ReleaseGPUShader
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUShader
  -- ^
  --
  --           [@shader@]: a shader to be destroyed.
  -> IO ()
sDL_ReleaseGPUShader = hs_bindgen_e516abeced8d372b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUGraphicsPipeline@
foreign import ccall unsafe "hs_bindgen_9c01a03b4ad6f8be"
  hs_bindgen_9c01a03b4ad6f8be_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUGraphicsPipeline@
hs_bindgen_9c01a03b4ad6f8be
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUGraphicsPipeline
  -> IO ()
hs_bindgen_9c01a03b4ad6f8be =
  BG.fromFFIType hs_bindgen_9c01a03b4ad6f8be_base

-- | Frees the given graphics pipeline as soon as it is safe to do so.
--
--     You must not reference the graphics pipeline after calling this function.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReleaseGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 3134:34@
sDL_ReleaseGPUGraphicsPipeline
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUGraphicsPipeline
  -- ^
  --
  --           [@graphics_pipeline@]: a graphics pipeline to be destroyed.
  -> IO ()
sDL_ReleaseGPUGraphicsPipeline =
  hs_bindgen_9c01a03b4ad6f8be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_AcquireGPUCommandBuffer@
foreign import ccall unsafe "hs_bindgen_27337c63b7093b75"
  hs_bindgen_27337c63b7093b75_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_AcquireGPUCommandBuffer@
hs_bindgen_27337c63b7093b75
  :: BG.Ptr SDL_GPUDevice
  -> IO (BG.Ptr SDL_GPUCommandBuffer)
hs_bindgen_27337c63b7093b75 =
  BG.fromFFIType hs_bindgen_27337c63b7093b75_base

-- | Acquire a command buffer.
--
--     This command buffer is managed by the implementation and should not be freed by the user. The command buffer may only be used on the thread it was acquired on. The command buffer should be submitted on the thread it was acquired on.
--
--     It is valid to acquire multiple command buffers on the same thread at once. In fact a common design pattern is to acquire two command buffers per frame where one is dedicated to render and compute passes and the other is dedicated to copy passes and other preparatory work such as generating mipmaps. Interleaving commands between the two command buffers reduces the total amount of passes overall which improves rendering performance.
--
--     [Returns]: a command buffer, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBuffer', 'sDL_SubmitGPUCommandBufferAndAcquireFence'
--
--     [C declaration]: @SDL_AcquireGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 3162:52@
sDL_AcquireGPUCommandBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> IO (BG.Ptr SDL_GPUCommandBuffer)
sDL_AcquireGPUCommandBuffer =
  hs_bindgen_27337c63b7093b75

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PushGPUVertexUniformData@
foreign import ccall unsafe "hs_bindgen_a5504d727b5181e0"
  hs_bindgen_a5504d727b5181e0_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PushGPUVertexUniformData@
hs_bindgen_a5504d727b5181e0
  :: BG.Ptr SDL_GPUCommandBuffer
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst BG.Void
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_a5504d727b5181e0 =
  BG.fromFFIType hs_bindgen_a5504d727b5181e0_base

-- | Pushes data to a vertex uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     For detailed information about accessing uniform data from a shader, please refer to SDL_CreateGPUShader.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PushGPUVertexUniformData@, defined at @SDL3\/SDL_gpu.h 3186:34@
sDL_PushGPUVertexUniformData
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@slot_index@]: the vertex uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO ()
sDL_PushGPUVertexUniformData =
  hs_bindgen_a5504d727b5181e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PushGPUFragmentUniformData@
foreign import ccall unsafe "hs_bindgen_c1b93561fe6f3eb8"
  hs_bindgen_c1b93561fe6f3eb8_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PushGPUFragmentUniformData@
hs_bindgen_c1b93561fe6f3eb8
  :: BG.Ptr SDL_GPUCommandBuffer
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst BG.Void
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_c1b93561fe6f3eb8 =
  BG.fromFFIType hs_bindgen_c1b93561fe6f3eb8_base

-- | Pushes data to a fragment uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PushGPUFragmentUniformData@, defined at @SDL3\/SDL_gpu.h 3208:34@
sDL_PushGPUFragmentUniformData
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@slot_index@]: the fragment uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO ()
sDL_PushGPUFragmentUniformData =
  hs_bindgen_c1b93561fe6f3eb8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PushGPUComputeUniformData@
foreign import ccall unsafe "hs_bindgen_267be67577031d05"
  hs_bindgen_267be67577031d05_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_PushGPUComputeUniformData@
hs_bindgen_267be67577031d05
  :: BG.Ptr SDL_GPUCommandBuffer
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst BG.Void
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_267be67577031d05 =
  BG.fromFFIType hs_bindgen_267be67577031d05_base

-- | Pushes data to a uniform slot on the command buffer.
--
--     Subsequent draw calls in this command buffer will use this uniform data.
--
--     The data being pushed must respect std140 layout conventions. In practical terms this means you must ensure that vec3 and vec4 fields are 16-byte aligned.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PushGPUComputeUniformData@, defined at @SDL3\/SDL_gpu.h 3230:34@
sDL_PushGPUComputeUniformData
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@slot_index@]: the uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO ()
sDL_PushGPUComputeUniformData =
  hs_bindgen_267be67577031d05

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BeginGPURenderPass@
foreign import ccall unsafe "hs_bindgen_b04297da6f821242"
  hs_bindgen_b04297da6f821242_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BeginGPURenderPass@
hs_bindgen_b04297da6f821242
  :: BG.Ptr SDL_GPUCommandBuffer
  -> PtrConst.PtrConst SDL_GPUColorTargetInfo
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst SDL_GPUDepthStencilTargetInfo
  -> IO (BG.Ptr SDL_GPURenderPass)
hs_bindgen_b04297da6f821242 =
  BG.fromFFIType hs_bindgen_b04297da6f821242_base

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
--     [See also]: 'sDL_EndGPURenderPass'
--
--     [C declaration]: @SDL_BeginGPURenderPass@, defined at @SDL3\/SDL_gpu.h 3271:49@
sDL_BeginGPURenderPass
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst SDL_GPUColorTargetInfo
  -- ^
  --
  --           [@color_target_infos@]: an array of texture subresources with corresponding clear values and load\/store ops.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_color_targets@]: the number of color targets in the color_target_infos array.
  -> PtrConst.PtrConst SDL_GPUDepthStencilTargetInfo
  -- ^
  --
  --           [@depth_stencil_target_info@]: a texture subresource with corresponding clear value and load\/store ops, may be NULL.
  -> IO (BG.Ptr SDL_GPURenderPass)
sDL_BeginGPURenderPass = hs_bindgen_b04297da6f821242

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUGraphicsPipeline@
foreign import ccall unsafe "hs_bindgen_a6ebeaec23a3eebc"
  hs_bindgen_a6ebeaec23a3eebc_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUGraphicsPipeline@
hs_bindgen_a6ebeaec23a3eebc
  :: BG.Ptr SDL_GPURenderPass
  -> BG.Ptr SDL_GPUGraphicsPipeline
  -> IO ()
hs_bindgen_a6ebeaec23a3eebc =
  BG.fromFFIType hs_bindgen_a6ebeaec23a3eebc_base

-- | Binds a graphics pipeline on a render pass to be used in rendering.
--
--     A graphics pipeline must be bound before making any draw calls.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BindGPUGraphicsPipeline@, defined at @SDL3\/SDL_gpu.h 3287:34@
sDL_BindGPUGraphicsPipeline
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Ptr SDL_GPUGraphicsPipeline
  -- ^
  --
  --           [@graphics_pipeline@]: the graphics pipeline to bind.
  -> IO ()
sDL_BindGPUGraphicsPipeline =
  hs_bindgen_a6ebeaec23a3eebc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUViewport@
foreign import ccall unsafe "hs_bindgen_f53e27fd1f10bfea"
  hs_bindgen_f53e27fd1f10bfea_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUViewport@
hs_bindgen_f53e27fd1f10bfea
  :: BG.Ptr SDL_GPURenderPass
  -> PtrConst.PtrConst SDL_GPUViewport
  -> IO ()
hs_bindgen_f53e27fd1f10bfea =
  BG.fromFFIType hs_bindgen_f53e27fd1f10bfea_base

-- | Sets the current viewport state on a command buffer.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetGPUViewport@, defined at @SDL3\/SDL_gpu.h 3299:34@
sDL_SetGPUViewport
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> PtrConst.PtrConst SDL_GPUViewport
  -- ^
  --
  --           [@viewport@]: the viewport to set.
  -> IO ()
sDL_SetGPUViewport = hs_bindgen_f53e27fd1f10bfea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUScissor@
foreign import ccall unsafe "hs_bindgen_bc8dd2f3086d94d5"
  hs_bindgen_bc8dd2f3086d94d5_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUScissor@
hs_bindgen_bc8dd2f3086d94d5
  :: BG.Ptr SDL_GPURenderPass
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO ()
hs_bindgen_bc8dd2f3086d94d5 =
  BG.fromFFIType hs_bindgen_bc8dd2f3086d94d5_base

-- | Sets the current scissor state on a command buffer.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetGPUScissor@, defined at @SDL3\/SDL_gpu.h 3311:34@
sDL_SetGPUScissor
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@scissor@]: the scissor area to set.
  -> IO ()
sDL_SetGPUScissor = hs_bindgen_bc8dd2f3086d94d5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUBlendConstants@
foreign import ccall unsafe "hs_bindgen_85e648c31f1fcb70"
  hs_bindgen_85e648c31f1fcb70_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUBlendConstants@
hs_bindgen_85e648c31f1fcb70
  :: BG.Ptr SDL_GPURenderPass
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -> IO ()
hs_bindgen_85e648c31f1fcb70 =
  BG.fromFFIType hs_bindgen_85e648c31f1fcb70_base

-- | Sets the current blend constants on a command buffer.
--
--     @since 3.2.0
--
--     [See also]: @SDL_GPU_BLENDFACTOR_CONSTANT_COLOR@, @SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR@
--
--     [C declaration]: @SDL_SetGPUBlendConstants@, defined at @SDL3\/SDL_gpu.h 3326:34@
sDL_SetGPUBlendConstants
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -- ^
  --
  --           [@blend_constants@]: the blend constant color.
  -> IO ()
sDL_SetGPUBlendConstants =
  \render_pass0 ->
    \blend_constants1 ->
      BG.with
        blend_constants1
        ( \blend_constants2 ->
            hs_bindgen_85e648c31f1fcb70 render_pass0 blend_constants2
        )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUStencilReference@
foreign import ccall unsafe "hs_bindgen_142400b7edd5f15e"
  hs_bindgen_142400b7edd5f15e_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUStencilReference@
hs_bindgen_142400b7edd5f15e
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO ()
hs_bindgen_142400b7edd5f15e =
  BG.fromFFIType hs_bindgen_142400b7edd5f15e_base

-- | Sets the current stencil reference value on a command buffer.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetGPUStencilReference@, defined at @SDL3\/SDL_gpu.h 3338:34@
sDL_SetGPUStencilReference
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@reference@]: the stencil reference value to set.
  -> IO ()
sDL_SetGPUStencilReference =
  hs_bindgen_142400b7edd5f15e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUVertexBuffers@
foreign import ccall unsafe "hs_bindgen_049713abad47ef65"
  hs_bindgen_049713abad47ef65_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUVertexBuffers@
hs_bindgen_049713abad47ef65
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst SDL_GPUBufferBinding
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_049713abad47ef65 =
  BG.fromFFIType hs_bindgen_049713abad47ef65_base

-- | Binds vertex buffers on a command buffer for use with subsequent draw calls.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BindGPUVertexBuffers@, defined at @SDL3\/SDL_gpu.h 3354:34@
sDL_BindGPUVertexBuffers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the vertex buffer slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUBufferBinding
  -- ^
  --
  --           [@bindings@]: an array of 'SDL_GPUBufferBinding' structs containing vertex buffers and offset values.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of bindings in the bindings array.
  -> IO ()
sDL_BindGPUVertexBuffers =
  hs_bindgen_049713abad47ef65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUIndexBuffer@
foreign import ccall unsafe "hs_bindgen_eebac58434b8d6c1"
  hs_bindgen_eebac58434b8d6c1_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUIndexBuffer@
hs_bindgen_eebac58434b8d6c1
  :: BG.Ptr SDL_GPURenderPass
  -> PtrConst.PtrConst SDL_GPUBufferBinding
  -> SDL_GPUIndexElementSize
  -> IO ()
hs_bindgen_eebac58434b8d6c1 =
  BG.fromFFIType hs_bindgen_eebac58434b8d6c1_base

-- | Binds an index buffer on a command buffer for use with subsequent draw calls.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BindGPUIndexBuffer@, defined at @SDL3\/SDL_gpu.h 3371:34@
sDL_BindGPUIndexBuffer
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
sDL_BindGPUIndexBuffer = hs_bindgen_eebac58434b8d6c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUVertexSamplers@
foreign import ccall unsafe "hs_bindgen_466757558b7a4998"
  hs_bindgen_466757558b7a4998_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUVertexSamplers@
hs_bindgen_466757558b7a4998
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_466757558b7a4998 =
  BG.fromFFIType hs_bindgen_466757558b7a4998_base

-- | Binds texture-sampler pairs for use on the vertex shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUVertexSamplers@, defined at @SDL3\/SDL_gpu.h 3395:34@
sDL_BindGPUVertexSamplers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the vertex sampler slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -- ^
  --
  --           [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of texture-sampler pairs to bind from the array.
  -> IO ()
sDL_BindGPUVertexSamplers =
  hs_bindgen_466757558b7a4998

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUVertexStorageTextures@
foreign import ccall unsafe "hs_bindgen_3099fb36563a23bf"
  hs_bindgen_3099fb36563a23bf_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUVertexStorageTextures@
hs_bindgen_3099fb36563a23bf
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_3099fb36563a23bf =
  BG.fromFFIType hs_bindgen_3099fb36563a23bf_base

-- | Binds storage textures for use on the vertex shader.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUVertexStorageTextures@, defined at @SDL3\/SDL_gpu.h 3419:34@
sDL_BindGPUVertexStorageTextures
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the vertex storage texture slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@storage_textures@]: an array of storage textures.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of storage texture to bind from the array.
  -> IO ()
sDL_BindGPUVertexStorageTextures =
  hs_bindgen_3099fb36563a23bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUVertexStorageBuffers@
foreign import ccall unsafe "hs_bindgen_114f1ec46d1c4ca1"
  hs_bindgen_114f1ec46d1c4ca1_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUVertexStorageBuffers@
hs_bindgen_114f1ec46d1c4ca1
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_114f1ec46d1c4ca1 =
  BG.fromFFIType hs_bindgen_114f1ec46d1c4ca1_base

-- | Binds storage buffers for use on the vertex shader.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUVertexStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3443:34@
sDL_BindGPUVertexStorageBuffers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the vertex storage buffer slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -- ^
  --
  --           [@storage_buffers@]: an array of buffers.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of buffers to bind from the array.
  -> IO ()
sDL_BindGPUVertexStorageBuffers =
  hs_bindgen_114f1ec46d1c4ca1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUFragmentSamplers@
foreign import ccall unsafe "hs_bindgen_6120c617bd5f9a53"
  hs_bindgen_6120c617bd5f9a53_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUFragmentSamplers@
hs_bindgen_6120c617bd5f9a53
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_6120c617bd5f9a53 =
  BG.fromFFIType hs_bindgen_6120c617bd5f9a53_base

-- | Binds texture-sampler pairs for use on the fragment shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUFragmentSamplers@, defined at @SDL3\/SDL_gpu.h 3468:34@
sDL_BindGPUFragmentSamplers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the fragment sampler slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -- ^
  --
  --           [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of texture-sampler pairs to bind from the array.
  -> IO ()
sDL_BindGPUFragmentSamplers =
  hs_bindgen_6120c617bd5f9a53

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUFragmentStorageTextures@
foreign import ccall unsafe "hs_bindgen_a5741f59885921f3"
  hs_bindgen_a5741f59885921f3_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUFragmentStorageTextures@
hs_bindgen_a5741f59885921f3
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_a5741f59885921f3 =
  BG.fromFFIType hs_bindgen_a5741f59885921f3_base

-- | Binds storage textures for use on the fragment shader.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUFragmentStorageTextures@, defined at @SDL3\/SDL_gpu.h 3492:34@
sDL_BindGPUFragmentStorageTextures
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the fragment storage texture slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@storage_textures@]: an array of storage textures.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of storage textures to bind from the array.
  -> IO ()
sDL_BindGPUFragmentStorageTextures =
  hs_bindgen_a5741f59885921f3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUFragmentStorageBuffers@
foreign import ccall unsafe "hs_bindgen_2cc12141ee4494d6"
  hs_bindgen_2cc12141ee4494d6_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUFragmentStorageBuffers@
hs_bindgen_2cc12141ee4494d6
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_2cc12141ee4494d6 =
  BG.fromFFIType hs_bindgen_2cc12141ee4494d6_base

-- | Binds storage buffers for use on the fragment shader.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUShader()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUShader'
--
--     [C declaration]: @SDL_BindGPUFragmentStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3516:34@
sDL_BindGPUFragmentStorageBuffers
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the fragment storage buffer slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -- ^
  --
  --           [@storage_buffers@]: an array of storage buffers.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of storage buffers to bind from the array.
  -> IO ()
sDL_BindGPUFragmentStorageBuffers =
  hs_bindgen_2cc12141ee4494d6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DrawGPUIndexedPrimitives@
foreign import ccall unsafe "hs_bindgen_87e007a9ec36edc3"
  hs_bindgen_87e007a9ec36edc3_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Int32
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DrawGPUIndexedPrimitives@
hs_bindgen_87e007a9ec36edc3
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_87e007a9ec36edc3 =
  BG.fromFFIType hs_bindgen_87e007a9ec36edc3_base

-- | Draws data using bound graphics state with an index buffer and instancing enabled.
--
--     You must not call this function before binding a graphics pipeline.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DrawGPUIndexedPrimitives@, defined at @SDL3\/SDL_gpu.h 3547:34@
sDL_DrawGPUIndexedPrimitives
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_indices@]: the number of indices to draw per instance.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_instances@]: the number of instances to draw.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_index@]: the starting index within the index buffer.
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@vertex_offset@]: value added to vertex index before indexing into the vertex buffer.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_instance@]: the ID of the first instance to draw.
  -> IO ()
sDL_DrawGPUIndexedPrimitives =
  hs_bindgen_87e007a9ec36edc3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DrawGPUPrimitives@
foreign import ccall unsafe "hs_bindgen_7b242b637f0074d8"
  hs_bindgen_7b242b637f0074d8_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DrawGPUPrimitives@
hs_bindgen_7b242b637f0074d8
  :: BG.Ptr SDL_GPURenderPass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_7b242b637f0074d8 =
  BG.fromFFIType hs_bindgen_7b242b637f0074d8_base

-- | Draws data using bound graphics state.
--
--     You must not call this function before binding a graphics pipeline.
--
--     Note that the @first_vertex@ and @first_instance@ parameters are NOT compatible with built-in vertex\/instance ID variables in shaders (for example, SV_VertexID); GPU APIs and shader languages do not define these built-in variables consistently, so if your shader depends on them, the only way to keep behavior consistent and portable is to always pass 0 for the correlating parameter in the draw calls.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DrawGPUPrimitives@, defined at @SDL3\/SDL_gpu.h 3575:34@
sDL_DrawGPUPrimitives
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_vertices@]: the number of vertices to draw.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_instances@]: the number of instances that will be drawn.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_vertex@]: the index of the first vertex to draw.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_instance@]: the ID of the first instance to draw.
  -> IO ()
sDL_DrawGPUPrimitives = hs_bindgen_7b242b637f0074d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DrawGPUPrimitivesIndirect@
foreign import ccall unsafe "hs_bindgen_38685ef53cdffb5f"
  hs_bindgen_38685ef53cdffb5f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DrawGPUPrimitivesIndirect@
hs_bindgen_38685ef53cdffb5f
  :: BG.Ptr SDL_GPURenderPass
  -> BG.Ptr SDL_GPUBuffer
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_38685ef53cdffb5f =
  BG.fromFFIType hs_bindgen_38685ef53cdffb5f_base

-- | Draws data using bound graphics state and with draw parameters set from a buffer.
--
--     The buffer must consist of tightly-packed draw parameter sets that each match the layout of 'SDL_GPUIndirectDrawCommand'. You must not call this function before binding a graphics pipeline.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DrawGPUPrimitivesIndirect@, defined at @SDL3\/SDL_gpu.h 3598:34@
sDL_DrawGPUPrimitivesIndirect
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer containing draw parameters.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@offset@]: the offset to start reading from the draw buffer.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@draw_count@]: the number of draw parameter sets that should be read from the draw buffer.
  -> IO ()
sDL_DrawGPUPrimitivesIndirect =
  hs_bindgen_38685ef53cdffb5f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DrawGPUIndexedPrimitivesIndirect@
foreign import ccall unsafe "hs_bindgen_04835577dd24b594"
  hs_bindgen_04835577dd24b594_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DrawGPUIndexedPrimitivesIndirect@
hs_bindgen_04835577dd24b594
  :: BG.Ptr SDL_GPURenderPass
  -> BG.Ptr SDL_GPUBuffer
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_04835577dd24b594 =
  BG.fromFFIType hs_bindgen_04835577dd24b594_base

-- | Draws data using bound graphics state with an index buffer enabled and with draw parameters set from a buffer.
--
--     The buffer must consist of tightly-packed draw parameter sets that each match the layout of 'SDL_GPUIndexedIndirectDrawCommand'. You must not call this function before binding a graphics pipeline.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DrawGPUIndexedPrimitivesIndirect@, defined at @SDL3\/SDL_gpu.h 3620:34@
sDL_DrawGPUIndexedPrimitivesIndirect
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer containing draw parameters.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@offset@]: the offset to start reading from the draw buffer.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@draw_count@]: the number of draw parameter sets that should be read from the draw buffer.
  -> IO ()
sDL_DrawGPUIndexedPrimitivesIndirect =
  hs_bindgen_04835577dd24b594

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_EndGPURenderPass@
foreign import ccall unsafe "hs_bindgen_cd298cdaadbf367d"
  hs_bindgen_cd298cdaadbf367d_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_EndGPURenderPass@
hs_bindgen_cd298cdaadbf367d
  :: BG.Ptr SDL_GPURenderPass
  -> IO ()
hs_bindgen_cd298cdaadbf367d =
  BG.fromFFIType hs_bindgen_cd298cdaadbf367d_base

-- | Ends the given render pass.
--
--     All bound graphics state on the render pass command buffer is unset. The render pass handle is now invalid.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EndGPURenderPass@, defined at @SDL3\/SDL_gpu.h 3636:34@
sDL_EndGPURenderPass
  :: BG.Ptr SDL_GPURenderPass
  -- ^
  --
  --           [@render_pass@]: a render pass handle.
  -> IO ()
sDL_EndGPURenderPass = hs_bindgen_cd298cdaadbf367d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BeginGPUComputePass@
foreign import ccall unsafe "hs_bindgen_7e4922a40e945137"
  hs_bindgen_7e4922a40e945137_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BeginGPUComputePass@
hs_bindgen_7e4922a40e945137
  :: BG.Ptr SDL_GPUCommandBuffer
  -> PtrConst.PtrConst SDL_GPUStorageTextureReadWriteBinding
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst SDL_GPUStorageBufferReadWriteBinding
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO (BG.Ptr SDL_GPUComputePass)
hs_bindgen_7e4922a40e945137 =
  BG.fromFFIType hs_bindgen_7e4922a40e945137_base

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
--     [See also]: 'sDL_EndGPUComputePass'
--
--     [C declaration]: @SDL_BeginGPUComputePass@, defined at @SDL3\/SDL_gpu.h 3678:50@
sDL_BeginGPUComputePass
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst SDL_GPUStorageTextureReadWriteBinding
  -- ^
  --
  --           [@storage_texture_bindings@]: an array of writeable storage texture binding structs.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_storage_texture_bindings@]: the number of storage textures to bind from the array.
  -> PtrConst.PtrConst SDL_GPUStorageBufferReadWriteBinding
  -- ^
  --
  --           [@storage_buffer_bindings@]: an array of writeable storage buffer binding structs.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_storage_buffer_bindings@]: the number of storage buffers to bind from the array.
  -> IO (BG.Ptr SDL_GPUComputePass)
sDL_BeginGPUComputePass = hs_bindgen_7e4922a40e945137

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUComputePipeline@
foreign import ccall unsafe "hs_bindgen_3d4216ca508a9022"
  hs_bindgen_3d4216ca508a9022_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUComputePipeline@
hs_bindgen_3d4216ca508a9022
  :: BG.Ptr SDL_GPUComputePass
  -> BG.Ptr SDL_GPUComputePipeline
  -> IO ()
hs_bindgen_3d4216ca508a9022 =
  BG.fromFFIType hs_bindgen_3d4216ca508a9022_base

-- | Binds a compute pipeline on a command buffer for use in compute dispatch.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BindGPUComputePipeline@, defined at @SDL3\/SDL_gpu.h 3693:34@
sDL_BindGPUComputePipeline
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Ptr SDL_GPUComputePipeline
  -- ^
  --
  --           [@compute_pipeline@]: a compute pipeline to bind.
  -> IO ()
sDL_BindGPUComputePipeline =
  hs_bindgen_3d4216ca508a9022

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUComputeSamplers@
foreign import ccall unsafe "hs_bindgen_2a02bb807885f88d"
  hs_bindgen_2a02bb807885f88d_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUComputeSamplers@
hs_bindgen_2a02bb807885f88d
  :: BG.Ptr SDL_GPUComputePass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_2a02bb807885f88d =
  BG.fromFFIType hs_bindgen_2a02bb807885f88d_base

-- | Binds texture-sampler pairs for use on the compute shader.
--
--     The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUComputePipeline()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUComputePipeline'
--
--     [C declaration]: @SDL_BindGPUComputeSamplers@, defined at @SDL3\/SDL_gpu.h 3716:34@
sDL_BindGPUComputeSamplers
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the compute sampler slot to begin binding from.
  -> PtrConst.PtrConst SDL_GPUTextureSamplerBinding
  -- ^
  --
  --           [@texture_sampler_bindings@]: an array of texture-sampler binding structs.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of texture-sampler bindings to bind from the array.
  -> IO ()
sDL_BindGPUComputeSamplers =
  hs_bindgen_2a02bb807885f88d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUComputeStorageTextures@
foreign import ccall unsafe "hs_bindgen_a743533e288c69f5"
  hs_bindgen_a743533e288c69f5_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUComputeStorageTextures@
hs_bindgen_a743533e288c69f5
  :: BG.Ptr SDL_GPUComputePass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_a743533e288c69f5 =
  BG.fromFFIType hs_bindgen_a743533e288c69f5_base

-- | Binds storage textures as readonly for use on the compute pipeline.
--
--     These textures must have been created with SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUComputePipeline()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUComputePipeline'
--
--     [C declaration]: @SDL_BindGPUComputeStorageTextures@, defined at @SDL3\/SDL_gpu.h 3740:34@
sDL_BindGPUComputeStorageTextures
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the compute storage texture slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUTexture)
  -- ^
  --
  --           [@storage_textures@]: an array of storage textures.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of storage textures to bind from the array.
  -> IO ()
sDL_BindGPUComputeStorageTextures =
  hs_bindgen_a743533e288c69f5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUComputeStorageBuffers@
foreign import ccall unsafe "hs_bindgen_1be365d38addb5cf"
  hs_bindgen_1be365d38addb5cf_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BindGPUComputeStorageBuffers@
hs_bindgen_1be365d38addb5cf
  :: BG.Ptr SDL_GPUComputePass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_1be365d38addb5cf =
  BG.fromFFIType hs_bindgen_1be365d38addb5cf_base

-- | Binds storage buffers as readonly for use on the compute pipeline.
--
--     These buffers must have been created with SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ.
--
--     Be sure your shader is set up according to the requirements documented in @SDL_CreateGPUComputePipeline()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateGPUComputePipeline'
--
--     [C declaration]: @SDL_BindGPUComputeStorageBuffers@, defined at @SDL3\/SDL_gpu.h 3764:34@
sDL_BindGPUComputeStorageBuffers
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@first_slot@]: the compute storage buffer slot to begin binding from.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUBuffer)
  -- ^
  --
  --           [@storage_buffers@]: an array of storage buffer binding structs.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_bindings@]: the number of storage buffers to bind from the array.
  -> IO ()
sDL_BindGPUComputeStorageBuffers =
  hs_bindgen_1be365d38addb5cf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DispatchGPUCompute@
foreign import ccall unsafe "hs_bindgen_08d7249b66bd0658"
  hs_bindgen_08d7249b66bd0658_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DispatchGPUCompute@
hs_bindgen_08d7249b66bd0658
  :: BG.Ptr SDL_GPUComputePass
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_08d7249b66bd0658 =
  BG.fromFFIType hs_bindgen_08d7249b66bd0658_base

-- | Dispatches compute work.
--
--     You must not call this function before binding a compute pipeline.
--
--     A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and the dispatches write to the same resource region as each other, there is no guarantee of which order the writes will occur. If the write order matters, you MUST end the compute pass and begin another one.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DispatchGPUCompute@, defined at @SDL3\/SDL_gpu.h 3790:34@
sDL_DispatchGPUCompute
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@groupcount_x@]: number of local workgroups to dispatch in the X dimension.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@groupcount_y@]: number of local workgroups to dispatch in the Y dimension.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@groupcount_z@]: number of local workgroups to dispatch in the Z dimension.
  -> IO ()
sDL_DispatchGPUCompute = hs_bindgen_08d7249b66bd0658

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DispatchGPUComputeIndirect@
foreign import ccall unsafe "hs_bindgen_9b425608a854a4f5"
  hs_bindgen_9b425608a854a4f5_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DispatchGPUComputeIndirect@
hs_bindgen_9b425608a854a4f5
  :: BG.Ptr SDL_GPUComputePass
  -> BG.Ptr SDL_GPUBuffer
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO ()
hs_bindgen_9b425608a854a4f5 =
  BG.fromFFIType hs_bindgen_9b425608a854a4f5_base

-- | Dispatches compute work with parameters set from a buffer.
--
--     The buffer layout should match the layout of 'SDL_GPUIndirectDispatchCommand'. You must not call this function before binding a compute pipeline.
--
--     A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and the dispatches write to the same resource region as each other, there is no guarantee of which order the writes will occur. If the write order matters, you MUST end the compute pass and begin another one.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DispatchGPUComputeIndirect@, defined at @SDL3\/SDL_gpu.h 3814:34@
sDL_DispatchGPUComputeIndirect
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> BG.Ptr SDL_GPUBuffer
  -- ^
  --
  --           [@buffer@]: a buffer containing dispatch parameters.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@offset@]: the offset to start reading from the dispatch buffer.
  -> IO ()
sDL_DispatchGPUComputeIndirect =
  hs_bindgen_9b425608a854a4f5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_EndGPUComputePass@
foreign import ccall unsafe "hs_bindgen_bf20561443153c08"
  hs_bindgen_bf20561443153c08_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_EndGPUComputePass@
hs_bindgen_bf20561443153c08
  :: BG.Ptr SDL_GPUComputePass
  -> IO ()
hs_bindgen_bf20561443153c08 =
  BG.fromFFIType hs_bindgen_bf20561443153c08_base

-- | Ends the current compute pass.
--
--     All bound compute state on the command buffer is unset. The compute pass handle is now invalid.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EndGPUComputePass@, defined at @SDL3\/SDL_gpu.h 3829:34@
sDL_EndGPUComputePass
  :: BG.Ptr SDL_GPUComputePass
  -- ^
  --
  --           [@compute_pass@]: a compute pass handle.
  -> IO ()
sDL_EndGPUComputePass = hs_bindgen_bf20561443153c08

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_MapGPUTransferBuffer@
foreign import ccall unsafe "hs_bindgen_075892bcba4ad890"
  hs_bindgen_075892bcba4ad890_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_MapGPUTransferBuffer@
hs_bindgen_075892bcba4ad890
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUTransferBuffer
  -> BG.CBool
  -> IO (BG.Ptr BG.Void)
hs_bindgen_075892bcba4ad890 =
  BG.fromFFIType hs_bindgen_075892bcba4ad890_base

-- | Maps a transfer buffer into application address space.
--
--     You must unmap the transfer buffer before encoding upload commands. The memory is owned by the graphics driver - do NOT call SDL_free() on the returned pointer.
--
--     [Returns]: the address of the mapped transfer buffer memory, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_MapGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3849:36@
sDL_MapGPUTransferBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTransferBuffer
  -- ^
  --
  --           [@transfer_buffer@]: a transfer buffer.
  -> BG.CBool
  -- ^
  --
  --           [@cycle@]: if true, cycles the transfer buffer if it is already bound.
  -> IO (BG.Ptr BG.Void)
sDL_MapGPUTransferBuffer =
  hs_bindgen_075892bcba4ad890

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_UnmapGPUTransferBuffer@
foreign import ccall unsafe "hs_bindgen_8721518ac51d5884"
  hs_bindgen_8721518ac51d5884_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_UnmapGPUTransferBuffer@
hs_bindgen_8721518ac51d5884
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUTransferBuffer
  -> IO ()
hs_bindgen_8721518ac51d5884 =
  BG.fromFFIType hs_bindgen_8721518ac51d5884_base

-- | Unmaps a previously mapped transfer buffer.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UnmapGPUTransferBuffer@, defined at @SDL3\/SDL_gpu.h 3862:34@
sDL_UnmapGPUTransferBuffer
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUTransferBuffer
  -- ^
  --
  --           [@transfer_buffer@]: a previously mapped transfer buffer.
  -> IO ()
sDL_UnmapGPUTransferBuffer =
  hs_bindgen_8721518ac51d5884

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BeginGPUCopyPass@
foreign import ccall unsafe "hs_bindgen_7990c88447a637d9"
  hs_bindgen_7990c88447a637d9_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BeginGPUCopyPass@
hs_bindgen_7990c88447a637d9
  :: BG.Ptr SDL_GPUCommandBuffer
  -> IO (BG.Ptr SDL_GPUCopyPass)
hs_bindgen_7990c88447a637d9 =
  BG.fromFFIType hs_bindgen_7990c88447a637d9_base

-- | Begins a copy pass on a command buffer.
--
--     All operations related to copying to or from buffers or textures take place inside a copy pass. You must not begin another copy pass, or a render pass or compute pass before ending the copy pass.
--
--     [Returns]: a copy pass handle.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EndGPUCopyPass'
--
--     [C declaration]: @SDL_BeginGPUCopyPass@, defined at @SDL3\/SDL_gpu.h 3882:47@
sDL_BeginGPUCopyPass
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO (BG.Ptr SDL_GPUCopyPass)
sDL_BeginGPUCopyPass = hs_bindgen_7990c88447a637d9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_UploadToGPUTexture@
foreign import ccall unsafe "hs_bindgen_7dc2e64aebecaf47"
  hs_bindgen_7dc2e64aebecaf47_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_UploadToGPUTexture@
hs_bindgen_7dc2e64aebecaf47
  :: BG.Ptr SDL_GPUCopyPass
  -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
  -> PtrConst.PtrConst SDL_GPUTextureRegion
  -> BG.CBool
  -> IO ()
hs_bindgen_7dc2e64aebecaf47 =
  BG.fromFFIType hs_bindgen_7dc2e64aebecaf47_base

-- | Uploads data from a transfer buffer to a texture.
--
--     The upload occurs on the GPU timeline. You may assume that the upload has finished in subsequent commands.
--
--     You must align the data in the transfer buffer to a multiple of the texel size of the texture format.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UploadToGPUTexture@, defined at @SDL3\/SDL_gpu.h 3902:34@
sDL_UploadToGPUTexture
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
  -> BG.CBool
  -- ^
  --
  --           [@cycle@]: if true, cycles the texture if the texture is bound, otherwise overwrites the data.
  -> IO ()
sDL_UploadToGPUTexture = hs_bindgen_7dc2e64aebecaf47

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_UploadToGPUBuffer@
foreign import ccall unsafe "hs_bindgen_c8311e817b0149e1"
  hs_bindgen_c8311e817b0149e1_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_UploadToGPUBuffer@
hs_bindgen_c8311e817b0149e1
  :: BG.Ptr SDL_GPUCopyPass
  -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
  -> PtrConst.PtrConst SDL_GPUBufferRegion
  -> BG.CBool
  -> IO ()
hs_bindgen_c8311e817b0149e1 =
  BG.fromFFIType hs_bindgen_c8311e817b0149e1_base

-- | Uploads data from a transfer buffer to a buffer.
--
--     The upload occurs on the GPU timeline. You may assume that the upload has finished in subsequent commands.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_UploadToGPUBuffer@, defined at @SDL3\/SDL_gpu.h 3922:34@
sDL_UploadToGPUBuffer
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
  -> BG.CBool
  -- ^
  --
  --           [@cycle@]: if true, cycles the buffer if it is already bound, otherwise overwrites the data.
  -> IO ()
sDL_UploadToGPUBuffer = hs_bindgen_c8311e817b0149e1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CopyGPUTextureToTexture@
foreign import ccall unsafe "hs_bindgen_8d76c446224fa54a"
  hs_bindgen_8d76c446224fa54a_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CopyGPUTextureToTexture@
hs_bindgen_8d76c446224fa54a
  :: BG.Ptr SDL_GPUCopyPass
  -> PtrConst.PtrConst SDL_GPUTextureLocation
  -> PtrConst.PtrConst SDL_GPUTextureLocation
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.CBool
  -> IO ()
hs_bindgen_8d76c446224fa54a =
  BG.fromFFIType hs_bindgen_8d76c446224fa54a_base

-- | Performs a texture-to-texture copy.
--
--     This copy occurs on the GPU timeline. You may assume the copy has finished in subsequent commands.
--
--     This function does not support copying between depth and color textures. For those, copy the texture to a buffer and then to the destination texture.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CopyGPUTextureToTexture@, defined at @SDL3\/SDL_gpu.h 3949:34@
sDL_CopyGPUTextureToTexture
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
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@w@]: the width of the region to copy.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@h@]: the height of the region to copy.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@d@]: the depth of the region to copy.
  -> BG.CBool
  -- ^
  --
  --           [@cycle@]: if true, cycles the destination texture if the destination texture is bound, otherwise overwrites the data.
  -> IO ()
sDL_CopyGPUTextureToTexture =
  hs_bindgen_8d76c446224fa54a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CopyGPUBufferToBuffer@
foreign import ccall unsafe "hs_bindgen_72560eca0be1bbd9"
  hs_bindgen_72560eca0be1bbd9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CopyGPUBufferToBuffer@
hs_bindgen_72560eca0be1bbd9
  :: BG.Ptr SDL_GPUCopyPass
  -> PtrConst.PtrConst SDL_GPUBufferLocation
  -> PtrConst.PtrConst SDL_GPUBufferLocation
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.CBool
  -> IO ()
hs_bindgen_72560eca0be1bbd9 =
  BG.fromFFIType hs_bindgen_72560eca0be1bbd9_base

-- | Performs a buffer-to-buffer copy.
--
--     This copy occurs on the GPU timeline. You may assume the copy has finished in subsequent commands.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CopyGPUBufferToBuffer@, defined at @SDL3\/SDL_gpu.h 3973:34@
sDL_CopyGPUBufferToBuffer
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
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@size@]: the length of the buffer to copy.
  -> BG.CBool
  -- ^
  --
  --           [@cycle@]: if true, cycles the destination buffer if it is already bound, otherwise overwrites the data.
  -> IO ()
sDL_CopyGPUBufferToBuffer =
  hs_bindgen_72560eca0be1bbd9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DownloadFromGPUTexture@
foreign import ccall unsafe "hs_bindgen_f583e024c47915e6"
  hs_bindgen_f583e024c47915e6_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DownloadFromGPUTexture@
hs_bindgen_f583e024c47915e6
  :: BG.Ptr SDL_GPUCopyPass
  -> PtrConst.PtrConst SDL_GPUTextureRegion
  -> PtrConst.PtrConst SDL_GPUTextureTransferInfo
  -> IO ()
hs_bindgen_f583e024c47915e6 =
  BG.fromFFIType hs_bindgen_f583e024c47915e6_base

-- | Copies data from a texture to a transfer buffer on the GPU timeline.
--
--     This data is not guaranteed to be copied until the command buffer fence is signaled.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DownloadFromGPUTexture@, defined at @SDL3\/SDL_gpu.h 3993:34@
sDL_DownloadFromGPUTexture
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
sDL_DownloadFromGPUTexture =
  hs_bindgen_f583e024c47915e6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DownloadFromGPUBuffer@
foreign import ccall unsafe "hs_bindgen_d1604453e77cbbd9"
  hs_bindgen_d1604453e77cbbd9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_DownloadFromGPUBuffer@
hs_bindgen_d1604453e77cbbd9
  :: BG.Ptr SDL_GPUCopyPass
  -> PtrConst.PtrConst SDL_GPUBufferRegion
  -> PtrConst.PtrConst SDL_GPUTransferBufferLocation
  -> IO ()
hs_bindgen_d1604453e77cbbd9 =
  BG.fromFFIType hs_bindgen_d1604453e77cbbd9_base

-- | Copies data from a buffer to a transfer buffer on the GPU timeline.
--
--     This data is not guaranteed to be copied until the command buffer fence is signaled.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DownloadFromGPUBuffer@, defined at @SDL3\/SDL_gpu.h 4010:34@
sDL_DownloadFromGPUBuffer
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
sDL_DownloadFromGPUBuffer =
  hs_bindgen_d1604453e77cbbd9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_EndGPUCopyPass@
foreign import ccall unsafe "hs_bindgen_37f1aba920cf70df"
  hs_bindgen_37f1aba920cf70df_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_EndGPUCopyPass@
hs_bindgen_37f1aba920cf70df
  :: BG.Ptr SDL_GPUCopyPass
  -> IO ()
hs_bindgen_37f1aba920cf70df =
  BG.fromFFIType hs_bindgen_37f1aba920cf70df_base

-- | Ends the current copy pass.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EndGPUCopyPass@, defined at @SDL3\/SDL_gpu.h 4022:34@
sDL_EndGPUCopyPass
  :: BG.Ptr SDL_GPUCopyPass
  -- ^
  --
  --           [@copy_pass@]: a copy pass handle.
  -> IO ()
sDL_EndGPUCopyPass = hs_bindgen_37f1aba920cf70df

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GenerateMipmapsForGPUTexture@
foreign import ccall unsafe "hs_bindgen_487b5d55898cb8c9"
  hs_bindgen_487b5d55898cb8c9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GenerateMipmapsForGPUTexture@
hs_bindgen_487b5d55898cb8c9
  :: BG.Ptr SDL_GPUCommandBuffer
  -> BG.Ptr SDL_GPUTexture
  -> IO ()
hs_bindgen_487b5d55898cb8c9 =
  BG.fromFFIType hs_bindgen_487b5d55898cb8c9_base

-- | Generates mipmaps for the given texture.
--
--     This function must not be called inside of any pass.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GenerateMipmapsForGPUTexture@, defined at @SDL3\/SDL_gpu.h 4035:34@
sDL_GenerateMipmapsForGPUTexture
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command_buffer.
  -> BG.Ptr SDL_GPUTexture
  -- ^
  --
  --           [@texture@]: a texture with more than 1 mip level.
  -> IO ()
sDL_GenerateMipmapsForGPUTexture =
  hs_bindgen_487b5d55898cb8c9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BlitGPUTexture@
foreign import ccall unsafe "hs_bindgen_5ea32ac13985443b"
  hs_bindgen_5ea32ac13985443b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_BlitGPUTexture@
hs_bindgen_5ea32ac13985443b
  :: BG.Ptr SDL_GPUCommandBuffer
  -> PtrConst.PtrConst SDL_GPUBlitInfo
  -> IO ()
hs_bindgen_5ea32ac13985443b =
  BG.fromFFIType hs_bindgen_5ea32ac13985443b_base

-- | Blits from a source texture region to a destination texture region.
--
--     This function must not be called inside of any pass.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_BlitGPUTexture@, defined at @SDL3\/SDL_gpu.h 4049:34@
sDL_BlitGPUTexture
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> PtrConst.PtrConst SDL_GPUBlitInfo
  -- ^
  --
  --           [@info@]: the blit info struct containing the blit parameters.
  -> IO ()
sDL_BlitGPUTexture = hs_bindgen_5ea32ac13985443b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WindowSupportsGPUSwapchainComposition@
foreign import ccall unsafe "hs_bindgen_7874a69b9fb7574a"
  hs_bindgen_7874a69b9fb7574a_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WindowSupportsGPUSwapchainComposition@
hs_bindgen_7874a69b9fb7574a
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> SDL_GPUSwapchainComposition
  -> IO BG.CBool
hs_bindgen_7874a69b9fb7574a =
  BG.fromFFIType hs_bindgen_7874a69b9fb7574a_base

-- | Determines whether a swapchain composition is supported by the window.
--
--     The window must be claimed before calling this function.
--
--     [Returns]: true if supported, false if unsupported.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClaimWindowForGPUDevice'
--
--     [C declaration]: @SDL_WindowSupportsGPUSwapchainComposition@, defined at @SDL3\/SDL_gpu.h 4069:34@
sDL_WindowSupportsGPUSwapchainComposition
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
  -> IO BG.CBool
sDL_WindowSupportsGPUSwapchainComposition =
  hs_bindgen_7874a69b9fb7574a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WindowSupportsGPUPresentMode@
foreign import ccall unsafe "hs_bindgen_e7e69a1723f7ad13"
  hs_bindgen_e7e69a1723f7ad13_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WindowSupportsGPUPresentMode@
hs_bindgen_e7e69a1723f7ad13
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> SDL_GPUPresentMode
  -> IO BG.CBool
hs_bindgen_e7e69a1723f7ad13 =
  BG.fromFFIType hs_bindgen_e7e69a1723f7ad13_base

-- | Determines whether a presentation mode is supported by the window.
--
--     The window must be claimed before calling this function.
--
--     [Returns]: true if supported, false if unsupported.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClaimWindowForGPUDevice'
--
--     [C declaration]: @SDL_WindowSupportsGPUPresentMode@, defined at @SDL3\/SDL_gpu.h 4088:34@
sDL_WindowSupportsGPUPresentMode
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
  -> IO BG.CBool
sDL_WindowSupportsGPUPresentMode =
  hs_bindgen_e7e69a1723f7ad13

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ClaimWindowForGPUDevice@
foreign import ccall unsafe "hs_bindgen_709c34298cd845c0"
  hs_bindgen_709c34298cd845c0_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ClaimWindowForGPUDevice@
hs_bindgen_709c34298cd845c0
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_709c34298cd845c0 =
  BG.fromFFIType hs_bindgen_709c34298cd845c0_base

-- | Claims a window, creating a swapchain structure for it.
--
--     This must be called before SDL_AcquireGPUSwapchainTexture is called using the window. You should only call this function from the thread that created the window.
--
--     The swapchain will be created with SDL_GPU_SWAPCHAINCOMPOSITION_SDR and SDL_GPU_PRESENTMODE_VSYNC. If you want to have different swapchain parameters, you must call SDL_SetGPUSwapchainParameters after claiming the window.
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
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window.
  -> IO BG.CBool
sDL_ClaimWindowForGPUDevice =
  hs_bindgen_709c34298cd845c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseWindowFromGPUDevice@
foreign import ccall unsafe "hs_bindgen_5580ffa5115be31a"
  hs_bindgen_5580ffa5115be31a_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseWindowFromGPUDevice@
hs_bindgen_5580ffa5115be31a
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO ()
hs_bindgen_5580ffa5115be31a =
  BG.fromFFIType hs_bindgen_5580ffa5115be31a_base

-- | Unclaims a window, destroying its swapchain structure.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClaimWindowForGPUDevice'
--
--     [C declaration]: @SDL_ReleaseWindowFromGPUDevice@, defined at @SDL3\/SDL_gpu.h 4134:34@
sDL_ReleaseWindowFromGPUDevice
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window that has been claimed.
  -> IO ()
sDL_ReleaseWindowFromGPUDevice =
  hs_bindgen_5580ffa5115be31a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUSwapchainParameters@
foreign import ccall unsafe "hs_bindgen_dd5044a4ed37551c"
  hs_bindgen_dd5044a4ed37551c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUSwapchainParameters@
hs_bindgen_dd5044a4ed37551c
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> SDL_GPUSwapchainComposition
  -> SDL_GPUPresentMode
  -> IO BG.CBool
hs_bindgen_dd5044a4ed37551c =
  BG.fromFFIType hs_bindgen_dd5044a4ed37551c_base

-- | Changes the swapchain parameters for the given claimed window.
--
--     This function will fail if the requested present mode or swapchain composition are unsupported by the device. Check if the parameters are supported via SDL_WindowSupportsGPUPresentMode \/ SDL_WindowSupportsGPUSwapchainComposition prior to calling this function.
--
--     SDL_GPU_PRESENTMODE_VSYNC with SDL_GPU_SWAPCHAINCOMPOSITION_SDR is always supported.
--
--     [Returns]: true if successful, false on error; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WindowSupportsGPUPresentMode', 'sDL_WindowSupportsGPUSwapchainComposition'
--
--     [C declaration]: @SDL_SetGPUSwapchainParameters@, defined at @SDL3\/SDL_gpu.h 4161:34@
sDL_SetGPUSwapchainParameters
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
  -> IO BG.CBool
sDL_SetGPUSwapchainParameters =
  hs_bindgen_dd5044a4ed37551c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUAllowedFramesInFlight@
foreign import ccall unsafe "hs_bindgen_376c36f4c99e1f9a"
  hs_bindgen_376c36f4c99e1f9a_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SetGPUAllowedFramesInFlight@
hs_bindgen_376c36f4c99e1f9a
  :: BG.Ptr SDL_GPUDevice
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_376c36f4c99e1f9a =
  BG.fromFFIType hs_bindgen_376c36f4c99e1f9a_base

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
--     [Returns]: true if successful, false on error; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetGPUAllowedFramesInFlight@, defined at @SDL3\/SDL_gpu.h 4192:34@
sDL_SetGPUAllowedFramesInFlight
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@allowed_frames_in_flight@]: the maximum number of frames that can be pending on the GPU.
  -> IO BG.CBool
sDL_SetGPUAllowedFramesInFlight =
  hs_bindgen_376c36f4c99e1f9a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUSwapchainTextureFormat@
foreign import ccall unsafe "hs_bindgen_4dd16ea5d2d75e5c"
  hs_bindgen_4dd16ea5d2d75e5c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUSwapchainTextureFormat@
hs_bindgen_4dd16ea5d2d75e5c
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO SDL_GPUTextureFormat
hs_bindgen_4dd16ea5d2d75e5c =
  BG.fromFFIType hs_bindgen_4dd16ea5d2d75e5c_base

-- | Obtains the texture format of the swapchain for the given window.
--
--     Note that this format can change if the swapchain parameters change.
--
--     [Returns]: the texture format of the swapchain.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGPUSwapchainTextureFormat@, defined at @SDL3\/SDL_gpu.h 4207:50@
sDL_GetGPUSwapchainTextureFormat
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: an SDL_Window that has been claimed.
  -> IO SDL_GPUTextureFormat
sDL_GetGPUSwapchainTextureFormat =
  hs_bindgen_4dd16ea5d2d75e5c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_AcquireGPUSwapchainTexture@
foreign import ccall unsafe "hs_bindgen_458d79c8728f00ab"
  hs_bindgen_458d79c8728f00ab_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_AcquireGPUSwapchainTexture@
hs_bindgen_458d79c8728f00ab
  :: BG.Ptr SDL_GPUCommandBuffer
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> BG.Ptr (BG.Ptr SDL_GPUTexture)
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_458d79c8728f00ab =
  BG.fromFFIType hs_bindgen_458d79c8728f00ab_base

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
  -> IO BG.CBool
sDL_AcquireGPUSwapchainTexture =
  hs_bindgen_458d79c8728f00ab

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WaitForGPUSwapchain@
foreign import ccall unsafe "hs_bindgen_fb018ba3fc209740"
  hs_bindgen_fb018ba3fc209740_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WaitForGPUSwapchain@
hs_bindgen_fb018ba3fc209740
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_fb018ba3fc209740 =
  BG.fromFFIType hs_bindgen_fb018ba3fc209740_base

-- | Blocks the thread until a swapchain texture is available to be acquired.
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
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: a window that has been claimed.
  -> IO BG.CBool
sDL_WaitForGPUSwapchain = hs_bindgen_fb018ba3fc209740

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WaitAndAcquireGPUSwapchainTexture@
foreign import ccall unsafe "hs_bindgen_a454f9124adeea81"
  hs_bindgen_a454f9124adeea81_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WaitAndAcquireGPUSwapchainTexture@
hs_bindgen_a454f9124adeea81
  :: BG.Ptr SDL_GPUCommandBuffer
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> BG.Ptr (BG.Ptr SDL_GPUTexture)
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_a454f9124adeea81 =
  BG.fromFFIType hs_bindgen_a454f9124adeea81_base

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
  -> IO BG.CBool
sDL_WaitAndAcquireGPUSwapchainTexture =
  hs_bindgen_a454f9124adeea81

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SubmitGPUCommandBuffer@
foreign import ccall unsafe "hs_bindgen_82bac871c3cbe3e4"
  hs_bindgen_82bac871c3cbe3e4_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SubmitGPUCommandBuffer@
hs_bindgen_82bac871c3cbe3e4
  :: BG.Ptr SDL_GPUCommandBuffer
  -> IO BG.CBool
hs_bindgen_82bac871c3cbe3e4 =
  BG.fromFFIType hs_bindgen_82bac871c3cbe3e4_base

-- | Submits a command buffer so its commands can be processed on the GPU.
--
--     It is invalid to use the command buffer after this is called.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     All commands in the submission are guaranteed to begin executing before any command in a subsequent submission begins executing.
--
--     [Returns]: true on success, false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AcquireGPUCommandBuffer', 'sDL_WaitAndAcquireGPUSwapchainTexture', 'sDL_AcquireGPUSwapchainTexture', 'sDL_SubmitGPUCommandBufferAndAcquireFence'
--
--     [C declaration]: @SDL_SubmitGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 4357:34@
sDL_SubmitGPUCommandBuffer
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO BG.CBool
sDL_SubmitGPUCommandBuffer =
  hs_bindgen_82bac871c3cbe3e4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SubmitGPUCommandBufferAndAcquireFence@
foreign import ccall unsafe "hs_bindgen_34bbe24268d3620c"
  hs_bindgen_34bbe24268d3620c_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_SubmitGPUCommandBufferAndAcquireFence@
hs_bindgen_34bbe24268d3620c
  :: BG.Ptr SDL_GPUCommandBuffer
  -> IO (BG.Ptr SDL_GPUFence)
hs_bindgen_34bbe24268d3620c =
  BG.fromFFIType hs_bindgen_34bbe24268d3620c_base

-- | Submits a command buffer so its commands can be processed on the GPU, and acquires a fence associated with the command buffer.
--
--     You must release this fence when it is no longer needed or it will cause a leak. It is invalid to use the command buffer after this is called.
--
--     This must be called from the thread the command buffer was acquired on.
--
--     All commands in the submission are guaranteed to begin executing before any command in a subsequent submission begins executing.
--
--     [Returns]: a fence associated with the command buffer, or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AcquireGPUCommandBuffer', 'sDL_WaitAndAcquireGPUSwapchainTexture', 'sDL_AcquireGPUSwapchainTexture', 'sDL_SubmitGPUCommandBuffer', 'sDL_ReleaseGPUFence'
--
--     [C declaration]: @SDL_SubmitGPUCommandBufferAndAcquireFence@, defined at @SDL3\/SDL_gpu.h 4384:44@
sDL_SubmitGPUCommandBufferAndAcquireFence
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO (BG.Ptr SDL_GPUFence)
sDL_SubmitGPUCommandBufferAndAcquireFence =
  hs_bindgen_34bbe24268d3620c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CancelGPUCommandBuffer@
foreign import ccall unsafe "hs_bindgen_34c4d8861fe9ae5b"
  hs_bindgen_34c4d8861fe9ae5b_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CancelGPUCommandBuffer@
hs_bindgen_34c4d8861fe9ae5b
  :: BG.Ptr SDL_GPUCommandBuffer
  -> IO BG.CBool
hs_bindgen_34c4d8861fe9ae5b =
  BG.fromFFIType hs_bindgen_34c4d8861fe9ae5b_base

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
--     [Returns]: true on success, false on error; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WaitAndAcquireGPUSwapchainTexture', 'sDL_AcquireGPUCommandBuffer', 'sDL_AcquireGPUSwapchainTexture'
--
--     [C declaration]: @SDL_CancelGPUCommandBuffer@, defined at @SDL3\/SDL_gpu.h 4409:34@
sDL_CancelGPUCommandBuffer
  :: BG.Ptr SDL_GPUCommandBuffer
  -- ^
  --
  --           [@command_buffer@]: a command buffer.
  -> IO BG.CBool
sDL_CancelGPUCommandBuffer =
  hs_bindgen_34c4d8861fe9ae5b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WaitForGPUIdle@
foreign import ccall unsafe "hs_bindgen_2cf574d324b28e44"
  hs_bindgen_2cf574d324b28e44_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WaitForGPUIdle@
hs_bindgen_2cf574d324b28e44
  :: BG.Ptr SDL_GPUDevice
  -> IO BG.CBool
hs_bindgen_2cf574d324b28e44 =
  BG.fromFFIType hs_bindgen_2cf574d324b28e44_base

-- | Blocks the thread until the GPU is completely idle.
--
--     [Returns]: true on success, false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WaitForGPUFences'
--
--     [C declaration]: @SDL_WaitForGPUIdle@, defined at @SDL3\/SDL_gpu.h 4423:34@
sDL_WaitForGPUIdle
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> IO BG.CBool
sDL_WaitForGPUIdle = hs_bindgen_2cf574d324b28e44

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WaitForGPUFences@
foreign import ccall unsafe "hs_bindgen_90c7f8f4aae22e6a"
  hs_bindgen_90c7f8f4aae22e6a_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_WaitForGPUFences@
hs_bindgen_90c7f8f4aae22e6a
  :: BG.Ptr SDL_GPUDevice
  -> BG.CBool
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUFence)
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_90c7f8f4aae22e6a =
  BG.fromFFIType hs_bindgen_90c7f8f4aae22e6a_base

-- | Blocks the thread until the given fences are signaled.
--
--     [Returns]: true on success, false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBufferAndAcquireFence', 'sDL_WaitForGPUIdle'
--
--     [C declaration]: @SDL_WaitForGPUFences@, defined at @SDL3\/SDL_gpu.h 4442:34@
sDL_WaitForGPUFences
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.CBool
  -- ^
  --
  --           [@wait_all@]: if 0, wait for any fence to be signaled, if 1, wait for all fences to be signaled.
  -> PtrConst.PtrConst (BG.Ptr SDL_GPUFence)
  -- ^
  --
  --           [@fences@]: an array of fences to wait on.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@num_fences@]: the number of fences in the fences array.
  -> IO BG.CBool
sDL_WaitForGPUFences = hs_bindgen_90c7f8f4aae22e6a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_QueryGPUFence@
foreign import ccall unsafe "hs_bindgen_09f80c8e0b395d04"
  hs_bindgen_09f80c8e0b395d04_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_QueryGPUFence@
hs_bindgen_09f80c8e0b395d04
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUFence
  -> IO BG.CBool
hs_bindgen_09f80c8e0b395d04 =
  BG.fromFFIType hs_bindgen_09f80c8e0b395d04_base

-- | Checks the status of a fence.
--
--     [Returns]: true if the fence is signaled, false if it is not.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBufferAndAcquireFence'
--
--     [C declaration]: @SDL_QueryGPUFence@, defined at @SDL3\/SDL_gpu.h 4459:34@
sDL_QueryGPUFence
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUFence
  -- ^
  --
  --           [@fence@]: a fence.
  -> IO BG.CBool
sDL_QueryGPUFence = hs_bindgen_09f80c8e0b395d04

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUFence@
foreign import ccall unsafe "hs_bindgen_97087dbb893b61af"
  hs_bindgen_97087dbb893b61af_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_ReleaseGPUFence@
hs_bindgen_97087dbb893b61af
  :: BG.Ptr SDL_GPUDevice
  -> BG.Ptr SDL_GPUFence
  -> IO ()
hs_bindgen_97087dbb893b61af =
  BG.fromFFIType hs_bindgen_97087dbb893b61af_base

-- | Releases a fence obtained from SDL_SubmitGPUCommandBufferAndAcquireFence.
--
--     You must not reference the fence after calling this function.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SubmitGPUCommandBufferAndAcquireFence'
--
--     [C declaration]: @SDL_ReleaseGPUFence@, defined at @SDL3\/SDL_gpu.h 4475:34@
sDL_ReleaseGPUFence
  :: BG.Ptr SDL_GPUDevice
  -- ^
  --
  --           [@device@]: a GPU context.
  -> BG.Ptr SDL_GPUFence
  -- ^
  --
  --           [@fence@]: a fence.
  -> IO ()
sDL_ReleaseGPUFence = hs_bindgen_97087dbb893b61af

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUTextureFormatTexelBlockSize@
foreign import ccall unsafe "hs_bindgen_121bf00d55a1a113"
  hs_bindgen_121bf00d55a1a113_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUTextureFormatTexelBlockSize@
hs_bindgen_121bf00d55a1a113
  :: SDL_GPUTextureFormat
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_121bf00d55a1a113 =
  BG.fromFFIType hs_bindgen_121bf00d55a1a113_base

-- | Obtains the texel block size for a texture format.
--
--     [Returns]: the texel block size of the texture format.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UploadToGPUTexture'
--
--     [C declaration]: @SDL_GPUTextureFormatTexelBlockSize@, defined at @SDL3\/SDL_gpu.h 4491:36@
sDL_GPUTextureFormatTexelBlockSize
  :: SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: the texture format you want to know the texel size of.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_GPUTextureFormatTexelBlockSize =
  hs_bindgen_121bf00d55a1a113

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUTextureSupportsFormat@
foreign import ccall unsafe "hs_bindgen_0c3c275a5e945ebd"
  hs_bindgen_0c3c275a5e945ebd_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUTextureSupportsFormat@
hs_bindgen_0c3c275a5e945ebd
  :: BG.Ptr SDL_GPUDevice
  -> SDL_GPUTextureFormat
  -> SDL_GPUTextureType
  -> SDL_GPUTextureUsageFlags
  -> IO BG.CBool
hs_bindgen_0c3c275a5e945ebd =
  BG.fromFFIType hs_bindgen_0c3c275a5e945ebd_base

-- | Determines whether a texture format is supported for a given type and usage.
--
--     [Returns]: whether the texture format is supported for this type and usage.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GPUTextureSupportsFormat@, defined at @SDL3\/SDL_gpu.h 4506:34@
sDL_GPUTextureSupportsFormat
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
  -> IO BG.CBool
sDL_GPUTextureSupportsFormat =
  hs_bindgen_0c3c275a5e945ebd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUTextureSupportsSampleCount@
foreign import ccall unsafe "hs_bindgen_0870889673874577"
  hs_bindgen_0870889673874577_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GPUTextureSupportsSampleCount@
hs_bindgen_0870889673874577
  :: BG.Ptr SDL_GPUDevice
  -> SDL_GPUTextureFormat
  -> SDL_GPUSampleCount
  -> IO BG.CBool
hs_bindgen_0870889673874577 =
  BG.fromFFIType hs_bindgen_0870889673874577_base

-- | Determines if a sample count for a texture format is supported.
--
--     [Returns]: whether the sample count is supported for this texture format.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GPUTextureSupportsSampleCount@, defined at @SDL3\/SDL_gpu.h 4522:34@
sDL_GPUTextureSupportsSampleCount
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
  -> IO BG.CBool
sDL_GPUTextureSupportsSampleCount =
  hs_bindgen_0870889673874577

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CalculateGPUTextureFormatSize@
foreign import ccall unsafe "hs_bindgen_222b65bb58cce08e"
  hs_bindgen_222b65bb58cce08e_base
    :: BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_CalculateGPUTextureFormatSize@
hs_bindgen_222b65bb58cce08e
  :: SDL_GPUTextureFormat
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_222b65bb58cce08e =
  BG.fromFFIType hs_bindgen_222b65bb58cce08e_base

-- | Calculate the size in bytes of a texture format with dimensions.
--
--     [Returns]: the size of a texture with this format and dimensions.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CalculateGPUTextureFormatSize@, defined at @SDL3\/SDL_gpu.h 4538:36@
sDL_CalculateGPUTextureFormatSize
  :: SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: a texture format.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@width@]: width in pixels.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@height@]: height in pixels.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@depth_or_layer_count@]: depth for 3D textures or layer count otherwise.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_CalculateGPUTextureFormatSize =
  hs_bindgen_222b65bb58cce08e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetPixelFormatFromGPUTextureFormat@
foreign import ccall unsafe "hs_bindgen_3a8763f112daa871"
  hs_bindgen_3a8763f112daa871_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetPixelFormatFromGPUTextureFormat@
hs_bindgen_3a8763f112daa871
  :: SDL_GPUTextureFormat
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
hs_bindgen_3a8763f112daa871 =
  BG.fromFFIType hs_bindgen_3a8763f112daa871_base

-- | Get the SDL pixel format corresponding to a GPU texture format.
--
--     [Returns]: the corresponding pixel format, or SDL_PIXELFORMAT_UNKNOWN if there is no corresponding pixel format.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetPixelFormatFromGPUTextureFormat@, defined at @SDL3\/SDL_gpu.h 4553:45@
sDL_GetPixelFormatFromGPUTextureFormat
  :: SDL_GPUTextureFormat
  -- ^
  --
  --           [@format@]: a texture format.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
sDL_GetPixelFormatFromGPUTextureFormat =
  hs_bindgen_3a8763f112daa871

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUTextureFormatFromPixelFormat@
foreign import ccall unsafe "hs_bindgen_77c5ed2882b80ff3"
  hs_bindgen_77c5ed2882b80ff3_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Gpu_Unsafe_SDL_GetGPUTextureFormatFromPixelFormat@
hs_bindgen_77c5ed2882b80ff3
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO SDL_GPUTextureFormat
hs_bindgen_77c5ed2882b80ff3 =
  BG.fromFFIType hs_bindgen_77c5ed2882b80ff3_base

-- | Get the GPU texture format corresponding to an SDL pixel format.
--
--     [Returns]: the corresponding GPU texture format, or SDL_GPU_TEXTUREFORMAT_INVALID if there is no corresponding GPU texture format.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetGPUTextureFormatFromPixelFormat@, defined at @SDL3\/SDL_gpu.h 4565:50@
sDL_GetGPUTextureFormatFromPixelFormat
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: a pixel format.
  -> IO SDL_GPUTextureFormat
sDL_GetGPUTextureFormatFromPixelFormat =
  hs_bindgen_77c5ed2882b80ff3
