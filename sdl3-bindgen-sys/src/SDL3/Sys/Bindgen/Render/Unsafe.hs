{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Render.Unsafe (
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetNumRenderDrivers,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderDriver,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_CreateWindowAndRenderer,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_CreateRenderer,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_CreateRendererWithProperties,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_CreateGPURenderer,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetGPURendererDevice,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_CreateSoftwareRenderer,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderer,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderWindow,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRendererName,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRendererProperties,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderOutputSize,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetCurrentRenderOutputSize,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_CreateTexture,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_CreateTextureFromSurface,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_CreateTextureWithProperties,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetTextureProperties,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRendererFromTexture,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetTextureSize,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetTexturePalette,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetTexturePalette,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetTextureColorMod,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetTextureColorModFloat,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetTextureColorMod,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetTextureColorModFloat,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetTextureAlphaMod,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetTextureAlphaModFloat,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetTextureAlphaMod,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetTextureAlphaModFloat,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetTextureBlendMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetTextureBlendMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetTextureScaleMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetTextureScaleMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_UpdateTexture,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_UpdateYUVTexture,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_UpdateNVTexture,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_LockTexture,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_LockTextureToSurface,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_UnlockTexture,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderTarget,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderTarget,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderLogicalPresentation,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderLogicalPresentation,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderLogicalPresentationRect,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderCoordinatesFromWindow,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderCoordinatesToWindow,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_ConvertEventToRenderCoordinates,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderViewport,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderViewport,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderViewportSet,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderSafeArea,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderClipRect,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderClipRect,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderClipEnabled,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderScale,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderScale,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderDrawColor,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderDrawColorFloat,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderDrawColor,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderDrawColorFloat,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderColorScale,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderColorScale,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderDrawBlendMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderDrawBlendMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderClear,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderPoint,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderPoints,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderLine,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderLines,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderRect,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderRects,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderFillRect,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderFillRects,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderTexture,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderTextureRotated,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderTextureAffine,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderTextureTiled,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderTexture9Grid,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderTexture9GridTiled,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderGeometry,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderGeometryRaw,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderTextureAddressMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderTextureAddressMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderReadPixels,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderPresent,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_DestroyTexture,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_DestroyRenderer,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_FlushRenderer,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderMetalLayer,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderMetalCommandEncoder,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_AddVulkanRenderSemaphores,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetRenderVSync,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetRenderVSync,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_RenderDebugText,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetDefaultTextureScaleMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_GetDefaultTextureScaleMode,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_CreateGPURenderState,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetGPURenderStateFragmentUniforms,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_SetGPURenderState,
  SDL3.Sys.Bindgen.Render.Unsafe.sDL_DestroyGPURenderState,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Blendmode qualified
import SDL3.Sys.Bindgen.Events qualified
import SDL3.Sys.Bindgen.Gpu qualified
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Render
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified
import SDL3.Sys.Bindgen.Video qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_render.h>"
         , "signed int hs_bindgen_b8d027f3d5602f48 (void)"
         , "{"
         , "  return (SDL_GetNumRenderDrivers)();"
         , "}"
         , "char const *hs_bindgen_dce79b5e75543204 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRenderDriver)(arg1);"
         , "}"
         , "_Bool hs_bindgen_fd4bb4119f707b2a ("
         , "  char const *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  SDL_WindowFlags arg4,"
         , "  SDL_Window **arg5,"
         , "  SDL_Renderer **arg6"
         , ")"
         , "{"
         , "  return (SDL_CreateWindowAndRenderer)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "SDL_Renderer *hs_bindgen_37b63ac6e8618d68 ("
         , "  SDL_Window *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateRenderer)(arg1, arg2);"
         , "}"
         , "SDL_Renderer *hs_bindgen_fe8ca198b1b0c17d ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateRendererWithProperties)(arg1);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_GPUDevice SDL_GPUDevice;"
         , "typedef struct SDL_GPURenderState SDL_GPURenderState;"
         , "typedef struct SDL_GPURenderStateCreateInfo SDL_GPURenderStateCreateInfo;"
         , "typedef int SDL_TextureAddressMode;"
         , "#endif"
         , "SDL_Renderer *hs_bindgen_40c46710682c09f1 ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_CreateGPURenderer)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_CreateGPURenderer requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_GPUDevice SDL_GPUDevice;"
         , "typedef struct SDL_GPURenderState SDL_GPURenderState;"
         , "typedef struct SDL_GPURenderStateCreateInfo SDL_GPURenderStateCreateInfo;"
         , "typedef int SDL_TextureAddressMode;"
         , "#endif"
         , "SDL_GPUDevice *hs_bindgen_76cee8398d82c692 ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetGPURendererDevice)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_GetGPURendererDevice requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "SDL_Renderer *hs_bindgen_3a402a665e290fa3 ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateSoftwareRenderer)(arg1);"
         , "}"
         , "SDL_Renderer *hs_bindgen_30584ed4cc19ca5c ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRenderer)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_c043f286f3176cd8 ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRenderWindow)(arg1);"
         , "}"
         , "char const *hs_bindgen_b4d2799733c66a42 ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRendererName)(arg1);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_519d759f13b5a204 ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRendererProperties)(arg1);"
         , "}"
         , "_Bool hs_bindgen_15b72b770c77a09c ("
         , "  SDL_Renderer *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRenderOutputSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_09a49b8dd8196ac2 ("
         , "  SDL_Renderer *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetCurrentRenderOutputSize)(arg1, arg2, arg3);"
         , "}"
         , "SDL_Texture *hs_bindgen_3d4ff9d99a3fa98a ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_PixelFormat arg2,"
         , "  SDL_TextureAccess arg3,"
         , "  signed int arg4,"
         , "  signed int arg5"
         , ")"
         , "{"
         , "  return (SDL_CreateTexture)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "SDL_Texture *hs_bindgen_46cceb118c5977b8 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateTextureFromSurface)(arg1, arg2);"
         , "}"
         , "SDL_Texture *hs_bindgen_52cc37cb33c5a099 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_PropertiesID arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateTextureWithProperties)(arg1, arg2);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_7d1578a13c421f10 ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTextureProperties)(arg1);"
         , "}"
         , "SDL_Renderer *hs_bindgen_59ae54d4482ab0ef ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRendererFromTexture)(arg1);"
         , "}"
         , "_Bool hs_bindgen_132d974026c63235 ("
         , "  SDL_Texture *arg1,"
         , "  float *arg2,"
         , "  float *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetTextureSize)(arg1, arg2, arg3);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_b9b978978bcb3701 ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Palette *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SetTexturePalette)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_SetTexturePalette requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "SDL_Palette *hs_bindgen_38dd0c6a7ed9af72 ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetTexturePalette)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_GetTexturePalette requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "_Bool hs_bindgen_328bc9103549865a ("
         , "  SDL_Texture *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return (SDL_SetTextureColorMod)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_f0f25fbdb4151d72 ("
         , "  SDL_Texture *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float arg4"
         , ")"
         , "{"
         , "  return (SDL_SetTextureColorModFloat)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_23c41565e3ebaf20 ("
         , "  SDL_Texture *arg1,"
         , "  Uint8 *arg2,"
         , "  Uint8 *arg3,"
         , "  Uint8 *arg4"
         , ")"
         , "{"
         , "  return (SDL_GetTextureColorMod)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_40f14359348d1377 ("
         , "  SDL_Texture *arg1,"
         , "  float *arg2,"
         , "  float *arg3,"
         , "  float *arg4"
         , ")"
         , "{"
         , "  return (SDL_GetTextureColorModFloat)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_5ed240f184c27e2f ("
         , "  SDL_Texture *arg1,"
         , "  Uint8 arg2"
         , ")"
         , "{"
         , "  return (SDL_SetTextureAlphaMod)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_5ea85df5eef9526f ("
         , "  SDL_Texture *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_SetTextureAlphaModFloat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b3e62a9848e5067e ("
         , "  SDL_Texture *arg1,"
         , "  Uint8 *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetTextureAlphaMod)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_55b6c4f083626b7a ("
         , "  SDL_Texture *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetTextureAlphaModFloat)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_34ab5b9eb64f99e7 ("
         , "  SDL_Texture *arg1,"
         , "  SDL_BlendMode arg2"
         , ")"
         , "{"
         , "  return (SDL_SetTextureBlendMode)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_9e50ca0241b5eecf ("
         , "  SDL_Texture *arg1,"
         , "  SDL_BlendMode *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetTextureBlendMode)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_7ec0426bb117fde0 ("
         , "  SDL_Texture *arg1,"
         , "  SDL_ScaleMode arg2"
         , ")"
         , "{"
         , "  return (SDL_SetTextureScaleMode)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_d153e754b011263b ("
         , "  SDL_Texture *arg1,"
         , "  SDL_ScaleMode *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetTextureScaleMode)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_9d30d0aa8075c243 ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  void const *arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return (SDL_UpdateTexture)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_145fdda972278858 ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  Uint8 const *arg3,"
         , "  signed int arg4,"
         , "  Uint8 const *arg5,"
         , "  signed int arg6,"
         , "  Uint8 const *arg7,"
         , "  signed int arg8"
         , ")"
         , "{"
         , "  return (SDL_UpdateYUVTexture)(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);"
         , "}"
         , "_Bool hs_bindgen_8e87aea72679c0be ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  Uint8 const *arg3,"
         , "  signed int arg4,"
         , "  Uint8 const *arg5,"
         , "  signed int arg6"
         , ")"
         , "{"
         , "  return (SDL_UpdateNVTexture)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "_Bool hs_bindgen_f81dacbd782960a7 ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  void **arg3,"
         , "  signed int *arg4"
         , ")"
         , "{"
         , "  return (SDL_LockTexture)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_0422047faea9296b ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface **arg3"
         , ")"
         , "{"
         , "  return (SDL_LockTextureToSurface)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_9d1b4d7003c2d0ec ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "  (SDL_UnlockTexture)(arg1);"
         , "}"
         , "_Bool hs_bindgen_42456f91219d7d63 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetRenderTarget)(arg1, arg2);"
         , "}"
         , "SDL_Texture *hs_bindgen_afd608e22c7b34c2 ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRenderTarget)(arg1);"
         , "}"
         , "_Bool hs_bindgen_99a6a5d6611eb0ad ("
         , "  SDL_Renderer *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  SDL_RendererLogicalPresentation arg4"
         , ")"
         , "{"
         , "  return (SDL_SetRenderLogicalPresentation)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_cbe5162cf71da053 ("
         , "  SDL_Renderer *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3,"
         , "  SDL_RendererLogicalPresentation *arg4"
         , ")"
         , "{"
         , "  return (SDL_GetRenderLogicalPresentation)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_60fac3e135efff7b ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetRenderLogicalPresentationRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_88c23a7a2bb3f897 ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float *arg4,"
         , "  float *arg5"
         , ")"
         , "{"
         , "  return (SDL_RenderCoordinatesFromWindow)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_30a19a6793a8a60a ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float *arg4,"
         , "  float *arg5"
         , ")"
         , "{"
         , "  return (SDL_RenderCoordinatesToWindow)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_99e1877354dd4cdb ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Event *arg2"
         , ")"
         , "{"
         , "  return (SDL_ConvertEventToRenderCoordinates)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_da47a291603fd568 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetRenderViewport)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_d36147bdfea02ae0 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetRenderViewport)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b75de8ea63ffb717 ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_RenderViewportSet)(arg1);"
         , "}"
         , "_Bool hs_bindgen_143575ef07d5400f ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetRenderSafeArea)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_db4ee8d700a535c8 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetRenderClipRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_7bd39620f800ed67 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetRenderClipRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_011ece38ae24698a ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_RenderClipEnabled)(arg1);"
         , "}"
         , "_Bool hs_bindgen_a2ecfc86b7164248 ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return (SDL_SetRenderScale)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_9b27eba43ce3989c ("
         , "  SDL_Renderer *arg1,"
         , "  float *arg2,"
         , "  float *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetRenderScale)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_122da056b531e869 ("
         , "  SDL_Renderer *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5"
         , ")"
         , "{"
         , "  return (SDL_SetRenderDrawColor)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_069391a3e71d464d ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float arg4,"
         , "  float arg5"
         , ")"
         , "{"
         , "  return (SDL_SetRenderDrawColorFloat)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_7f0f910be4b2889e ("
         , "  SDL_Renderer *arg1,"
         , "  Uint8 *arg2,"
         , "  Uint8 *arg3,"
         , "  Uint8 *arg4,"
         , "  Uint8 *arg5"
         , ")"
         , "{"
         , "  return (SDL_GetRenderDrawColor)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_7679f2d13375bcd2 ("
         , "  SDL_Renderer *arg1,"
         , "  float *arg2,"
         , "  float *arg3,"
         , "  float *arg4,"
         , "  float *arg5"
         , ")"
         , "{"
         , "  return (SDL_GetRenderDrawColorFloat)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_2d134fc6b089039f ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_SetRenderColorScale)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_f9539095c565384c ("
         , "  SDL_Renderer *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetRenderColorScale)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_1885ca90cb47d78c ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_BlendMode arg2"
         , ")"
         , "{"
         , "  return (SDL_SetRenderDrawBlendMode)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_80ecda0d3d8d870b ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_BlendMode *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetRenderDrawBlendMode)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_82119a8dbd03b3ca ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_RenderClear)(arg1);"
         , "}"
         , "_Bool hs_bindgen_c73e2796ab7f90c1 ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return (SDL_RenderPoint)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_cb752ddd9f3b53be ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FPoint const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_RenderPoints)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_8fc8b7b71da27e92 ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float arg4,"
         , "  float arg5"
         , ")"
         , "{"
         , "  return (SDL_RenderLine)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_d68b0895520fbd3a ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FPoint const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_RenderLines)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_74702b94b10a8a97 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_RenderRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_2ee379e179df5f3c ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_RenderRects)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_c5b24d3e3930aa12 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_RenderFillRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_afbd05ab4eae453e ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_RenderFillRects)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_9502ac14df729213 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  SDL_FRect const *arg4"
         , ")"
         , "{"
         , "  return (SDL_RenderTexture)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_bdd81c1a4d95fd9a ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  SDL_FRect const *arg4,"
         , "  double arg5,"
         , "  SDL_FPoint const *arg6,"
         , "  SDL_FlipMode arg7"
         , ")"
         , "{"
         , "  return (SDL_RenderTextureRotated)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         , "_Bool hs_bindgen_18c2f3b6d0215153 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  SDL_FPoint const *arg4,"
         , "  SDL_FPoint const *arg5,"
         , "  SDL_FPoint const *arg6"
         , ")"
         , "{"
         , "  return (SDL_RenderTextureAffine)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "_Bool hs_bindgen_f46f867b1d2a5b99 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  float arg4,"
         , "  SDL_FRect const *arg5"
         , ")"
         , "{"
         , "  return (SDL_RenderTextureTiled)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_7460ccca85327f67 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  float arg4,"
         , "  float arg5,"
         , "  float arg6,"
         , "  float arg7,"
         , "  float arg8,"
         , "  SDL_FRect const *arg9"
         , ")"
         , "{"
         , "  return (SDL_RenderTexture9Grid)(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_82ec92cefa73aeb4 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  float arg4,"
         , "  float arg5,"
         , "  float arg6,"
         , "  float arg7,"
         , "  float arg8,"
         , "  SDL_FRect const *arg9,"
         , "  float arg10"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_RenderTexture9GridTiled)(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; (void)arg4; (void)arg5; (void)arg6; (void)arg7; (void)arg8; (void)arg9; (void)arg10; SDL_SetError(\"SDL_RenderTexture9GridTiled requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "_Bool hs_bindgen_604c256c92b502f9 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_Vertex const *arg3,"
         , "  signed int arg4,"
         , "  signed int const *arg5,"
         , "  signed int arg6"
         , ")"
         , "{"
         , "  return (SDL_RenderGeometry)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "_Bool hs_bindgen_ae17af9f44d6d343 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  float const *arg3,"
         , "  signed int arg4,"
         , "  SDL_FColor const *arg5,"
         , "  signed int arg6,"
         , "  float const *arg7,"
         , "  signed int arg8,"
         , "  signed int arg9,"
         , "  void const *arg10,"
         , "  signed int arg11,"
         , "  signed int arg12"
         , ")"
         , "{"
         , "  return (SDL_RenderGeometryRaw)(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_GPUDevice SDL_GPUDevice;"
         , "typedef struct SDL_GPURenderState SDL_GPURenderState;"
         , "typedef struct SDL_GPURenderStateCreateInfo SDL_GPURenderStateCreateInfo;"
         , "typedef int SDL_TextureAddressMode;"
         , "#endif"
         , "_Bool hs_bindgen_f5de60362bf89a18 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_TextureAddressMode arg2,"
         , "  SDL_TextureAddressMode arg3"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SetRenderTextureAddressMode)(arg1, arg2, arg3);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; SDL_SetError(\"SDL_SetRenderTextureAddressMode requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_GPUDevice SDL_GPUDevice;"
         , "typedef struct SDL_GPURenderState SDL_GPURenderState;"
         , "typedef struct SDL_GPURenderStateCreateInfo SDL_GPURenderStateCreateInfo;"
         , "typedef int SDL_TextureAddressMode;"
         , "#endif"
         , "_Bool hs_bindgen_727bb39b49c44f15 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_TextureAddressMode *arg2,"
         , "  SDL_TextureAddressMode *arg3"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetRenderTextureAddressMode)(arg1, arg2, arg3);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; SDL_SetError(\"SDL_GetRenderTextureAddressMode requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "SDL_Surface *hs_bindgen_7173be00862c48e8 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_RenderReadPixels)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_e66060f4d8ba3f83 ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_RenderPresent)(arg1);"
         , "}"
         , "void hs_bindgen_daf903d539dab511 ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyTexture)(arg1);"
         , "}"
         , "void hs_bindgen_1473f45c80ad6575 ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyRenderer)(arg1);"
         , "}"
         , "_Bool hs_bindgen_78e89be71892a1e6 ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_FlushRenderer)(arg1);"
         , "}"
         , "void *hs_bindgen_47416f026ca1192f ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRenderMetalLayer)(arg1);"
         , "}"
         , "void *hs_bindgen_c2e3411ac19d746f ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetRenderMetalCommandEncoder)(arg1);"
         , "}"
         , "_Bool hs_bindgen_98b03ff5afd62e07 ("
         , "  SDL_Renderer *arg1,"
         , "  Uint32 arg2,"
         , "  Sint64 arg3,"
         , "  Sint64 arg4"
         , ")"
         , "{"
         , "  return (SDL_AddVulkanRenderSemaphores)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_529493ee355e9466 ("
         , "  SDL_Renderer *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_SetRenderVSync)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ff41dba2a623c0ab ("
         , "  SDL_Renderer *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetRenderVSync)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_a60ea3ca32fd26a5 ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  char const *arg4"
         , ")"
         , "{"
         , "  return (SDL_RenderDebugText)(arg1, arg2, arg3, arg4);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_e0aee38e1b73b64f ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_ScaleMode arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SetDefaultTextureScaleMode)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_SetDefaultTextureScaleMode requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_51c8f91a397184cb ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_ScaleMode *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetDefaultTextureScaleMode)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_GetDefaultTextureScaleMode requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_GPUDevice SDL_GPUDevice;"
         , "typedef struct SDL_GPURenderState SDL_GPURenderState;"
         , "typedef struct SDL_GPURenderStateCreateInfo SDL_GPURenderStateCreateInfo;"
         , "typedef int SDL_TextureAddressMode;"
         , "#endif"
         , "SDL_GPURenderState *hs_bindgen_2d970ffb5a76b1e4 ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_GPURenderStateCreateInfo const *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_CreateGPURenderState)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_CreateGPURenderState requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_GPUDevice SDL_GPUDevice;"
         , "typedef struct SDL_GPURenderState SDL_GPURenderState;"
         , "typedef struct SDL_GPURenderStateCreateInfo SDL_GPURenderStateCreateInfo;"
         , "typedef int SDL_TextureAddressMode;"
         , "#endif"
         , "_Bool hs_bindgen_312b275c9f55463c ("
         , "  SDL_GPURenderState *arg1,"
         , "  Uint32 arg2,"
         , "  void const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SetGPURenderStateFragmentUniforms)(arg1, arg2, arg3, arg4);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; (void)arg4; SDL_SetError(\"SDL_SetGPURenderStateFragmentUniforms requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_GPUDevice SDL_GPUDevice;"
         , "typedef struct SDL_GPURenderState SDL_GPURenderState;"
         , "typedef struct SDL_GPURenderStateCreateInfo SDL_GPURenderStateCreateInfo;"
         , "typedef int SDL_TextureAddressMode;"
         , "#endif"
         , "_Bool hs_bindgen_0d6949c161acc59d ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_GPURenderState *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SetGPURenderState)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_SetGPURenderState requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_GPUDevice SDL_GPUDevice;"
         , "typedef struct SDL_GPURenderState SDL_GPURenderState;"
         , "typedef struct SDL_GPURenderStateCreateInfo SDL_GPURenderStateCreateInfo;"
         , "typedef int SDL_TextureAddressMode;"
         , "#endif"
         , "void hs_bindgen_eccc60d637069ae8 ("
         , "  SDL_GPURenderState *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  (SDL_DestroyGPURenderState)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_DestroyGPURenderState requires SDL >= 3.4.0\");"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetNumRenderDrivers@
foreign import ccall unsafe "hs_bindgen_b8d027f3d5602f48"
  hs_bindgen_b8d027f3d5602f48_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetNumRenderDrivers@
hs_bindgen_b8d027f3d5602f48 :: IO BG.CInt
hs_bindgen_b8d027f3d5602f48 =
  BG.fromFFIType hs_bindgen_b8d027f3d5602f48_base

-- | Get the number of 2D rendering drivers available for the current display.
--
--     A render driver is a set of code that handles rendering and texture management on a particular display. Normally there is only one, but some drivers may have several available with different capabilities.
--
--     There may be none if SDL was compiled without render support.
--
--     [Returns]: the number of built in render drivers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateRenderer', 'sDL_GetRenderDriver'
--
--     [C declaration]: @SDL_GetNumRenderDrivers@, defined at @SDL3\/SDL_render.h 192:33@
sDL_GetNumRenderDrivers :: IO BG.CInt
sDL_GetNumRenderDrivers = hs_bindgen_b8d027f3d5602f48

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderDriver@
foreign import ccall unsafe "hs_bindgen_dce79b5e75543204"
  hs_bindgen_dce79b5e75543204_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderDriver@
hs_bindgen_dce79b5e75543204
  :: BG.CInt
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_dce79b5e75543204 =
  BG.fromFFIType hs_bindgen_dce79b5e75543204_base

-- | Use this function to get the name of a built in 2D rendering driver.
--
--     The list of rendering drivers is given in the order that they are normally initialized by default; the drivers that seem more reasonable to choose first (as far as the SDL developers believe) are earlier in the list.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"opengl\", \"direct3d12\" or \"metal\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the rendering driver at the requested index, or NULL if an invalid index was specified.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumRenderDrivers'
--
--     [C declaration]: @SDL_GetRenderDriver@, defined at @SDL3\/SDL_render.h 216:42@
sDL_GetRenderDriver
  :: BG.CInt
  -- ^
  --
  --           [@index@]: the index of the rendering driver; the value ranges from 0 to @SDL_GetNumRenderDrivers()@ - 1.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetRenderDriver = hs_bindgen_dce79b5e75543204

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateWindowAndRenderer@
foreign import ccall unsafe "hs_bindgen_fd4bb4119f707b2a"
  hs_bindgen_fd4bb4119f707b2a_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Word64
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateWindowAndRenderer@
hs_bindgen_fd4bb4119f707b2a
  :: PtrConst.PtrConst BG.CChar
  -> BG.CInt
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Video.SDL_WindowFlags
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
  -> BG.Ptr (BG.Ptr SDL_Renderer)
  -> IO BG.CBool
hs_bindgen_fd4bb4119f707b2a =
  BG.fromFFIType hs_bindgen_fd4bb4119f707b2a_base

-- | Create a window and default renderer.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateRenderer', SDL_CreateWindow
--
--     [C declaration]: @SDL_CreateWindowAndRenderer@, defined at @SDL3\/SDL_render.h 238:34@
sDL_CreateWindowAndRenderer
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: the title of the window, in UTF-8 encoding.
  -> BG.CInt
  -- ^
  --
  --           [@width@]: the width of the window.
  -> BG.CInt
  -- ^
  --
  --           [@height@]: the height of the window.
  -> SDL3.Sys.Bindgen.Video.SDL_WindowFlags
  -- ^
  --
  --           [@window_flags@]: the flags used to create the window (see SDL_CreateWindow()).
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
  -- ^
  --
  --           [@window@]: a pointer filled with the window, or NULL on error.
  -> BG.Ptr (BG.Ptr SDL_Renderer)
  -- ^
  --
  --           [@renderer@]: a pointer filled with the renderer, or NULL on error.
  -> IO BG.CBool
sDL_CreateWindowAndRenderer =
  hs_bindgen_fd4bb4119f707b2a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateRenderer@
foreign import ccall unsafe "hs_bindgen_37b63ac6e8618d68"
  hs_bindgen_37b63ac6e8618d68_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateRenderer@
hs_bindgen_37b63ac6e8618d68
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_Renderer)
hs_bindgen_37b63ac6e8618d68 =
  BG.fromFFIType hs_bindgen_37b63ac6e8618d68_base

-- | Create a 2D rendering context for a window.
--
--     If you want a specific renderer, you can specify its name here. A list of available renderers can be obtained by calling @SDL_GetRenderDriver()@ multiple times, with indices from 0 to @SDL_GetNumRenderDrivers()@ -1. If you don\'t need a specific renderer, specify NULL and SDL will attempt to choose the best option for you, based on what is available on the user\'s system.
--
--     If @name@ is a comma-separated list, SDL will try each name, in the order listed, until one succeeds or all of them fail.
--
--     By default the rendering size matches the window size in pixels, but you can call @SDL_SetRenderLogicalPresentation()@ to change the content size and scaling options.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateRendererWithProperties', 'sDL_CreateSoftwareRenderer', 'sDL_DestroyRenderer', 'sDL_GetNumRenderDrivers', 'sDL_GetRenderDriver', 'sDL_GetRendererName'
--
--     [C declaration]: @SDL_CreateRenderer@, defined at @SDL3\/SDL_render.h 273:44@
sDL_CreateRenderer
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window where rendering is displayed.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the rendering driver to initialize, or NULL to let SDL choose one.
  -> IO (BG.Ptr SDL_Renderer)
sDL_CreateRenderer = hs_bindgen_37b63ac6e8618d68

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateRendererWithProperties@
foreign import ccall unsafe "hs_bindgen_fe8ca198b1b0c17d"
  hs_bindgen_fe8ca198b1b0c17d_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateRendererWithProperties@
hs_bindgen_fe8ca198b1b0c17d
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO (BG.Ptr SDL_Renderer)
hs_bindgen_fe8ca198b1b0c17d =
  BG.fromFFIType hs_bindgen_fe8ca198b1b0c17d_base

-- | Create a 2D rendering context for a window, with the specified properties.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_RENDERER_CREATE_NAME_STRING'@: the name of the rendering driver to use, if a specific one is desired
--
--     * @'sDL_PROP_RENDERER_CREATE_WINDOW_POINTER'@: the window where rendering is displayed, required if this isn\'t a software renderer using a surface
--
--     * @'sDL_PROP_RENDERER_CREATE_SURFACE_POINTER'@: the surface where rendering is displayed, if you want a software renderer without a window
--
--     * @'sDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER'@: an SDL_Colorspace value describing the colorspace for output to the display, defaults to SDL_COLORSPACE_SRGB. The direct3d11, direct3d12, and metal renderers support SDL_COLORSPACE_SRGB_LINEAR, which is a linear color space and supports HDR output. If you select SDL_COLORSPACE_SRGB_LINEAR, drawing still uses the sRGB colorspace, but values can go beyond 1.0 and float (linear) format textures can be used for HDR content.
--
--     * @'sDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER'@: non-zero if you want present synchronized with the refresh rate. This property can take any value that is supported by @SDL_SetRenderVSync()@ for the renderer.
--
--     With the SDL GPU renderer (since SDL 3.4.0):
--
--     * @'sDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER'@: the device to use with the renderer, optional.
--
--     * @'sDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN'@: the app is able to provide SPIR-V shaders to 'SDL_GPURenderState', optional.
--
--     * @'sDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN'@: the app is able to provide DXIL shaders to 'SDL_GPURenderState', optional.
--
--     * @'sDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN'@: the app is able to provide MSL shaders to 'SDL_GPURenderState', optional.
--
--     With the vulkan renderer:
--
--     * @'sDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER'@: the VkInstance to use with the renderer, optional.
--
--     * @'sDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER'@: the VkSurfaceKHR to use with the renderer, optional.
--
--     * @'sDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER'@: the VkPhysicalDevice to use with the renderer, optional.
--
--     * @'sDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER'@: the VkDevice to use with the renderer, optional.
--
--     * @'sDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER'@: the queue family index used for rendering.
--
--     * @'sDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER'@: the queue family index used for presentation.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_CreateProperties, 'sDL_CreateRenderer', 'sDL_CreateSoftwareRenderer', 'sDL_DestroyRenderer', 'sDL_GetRendererName'
--
--     [C declaration]: @SDL_CreateRendererWithProperties@, defined at @SDL3\/SDL_render.h 337:44@
sDL_CreateRendererWithProperties
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Renderer)
sDL_CreateRendererWithProperties =
  hs_bindgen_fe8ca198b1b0c17d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateGPURenderer@
foreign import ccall unsafe "hs_bindgen_40c46710682c09f1"
  hs_bindgen_40c46710682c09f1_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateGPURenderer@
hs_bindgen_40c46710682c09f1
  :: BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO (BG.Ptr SDL_Renderer)
hs_bindgen_40c46710682c09f1 =
  BG.fromFFIType hs_bindgen_40c46710682c09f1_base

-- | Create a 2D GPU rendering context.
--
--     The GPU device to use is passed in as a parameter. If this is NULL, then a device will be created normally and can be retrieved using @SDL_GetGPURendererDevice()@.
--
--     The window to use is passed in as a parameter. If this is NULL, then this will become an offscreen renderer. In that case, you should call @SDL_SetRenderTarget()@ to setup rendering to a texture, and then call @SDL_RenderPresent()@ normally to complete drawing a frame.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call SDL_GetError() for more information.
--
--     [Thread safety]: If this function is called with a valid GPU device, it should be called on the thread that created the device. If this function is called with a valid window, it should be called on the thread that created the window.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_CreateRendererWithProperties', 'sDL_GetGPURendererDevice', SDL_CreateGPUShader, 'sDL_CreateGPURenderState', 'sDL_SetGPURenderState'
--
--     [C declaration]: @SDL_CreateGPURenderer@, defined at @SDL3\/SDL_render.h 387:44@
sDL_CreateGPURenderer
  :: BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice
  -- ^
  --
  --           [@device@]: the GPU device to use with the renderer, or NULL to create a device.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window where rendering is displayed, or NULL to create an offscreen renderer.
  -> IO (BG.Ptr SDL_Renderer)
sDL_CreateGPURenderer = hs_bindgen_40c46710682c09f1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetGPURendererDevice@
foreign import ccall unsafe "hs_bindgen_76cee8398d82c692"
  hs_bindgen_76cee8398d82c692_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetGPURendererDevice@
hs_bindgen_76cee8398d82c692
  :: BG.Ptr SDL_Renderer
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice)
hs_bindgen_76cee8398d82c692 =
  BG.fromFFIType hs_bindgen_76cee8398d82c692_base

-- | Return the GPU device used by a renderer.
--
--     [Returns]: the GPU device used by the renderer, or NULL if the renderer is not a GPU renderer; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetGPURendererDevice@, defined at @SDL3\/SDL_render.h 400:45@
sDL_GetGPURendererDevice
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice)
sDL_GetGPURendererDevice =
  hs_bindgen_76cee8398d82c692

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateSoftwareRenderer@
foreign import ccall unsafe "hs_bindgen_3a402a665e290fa3"
  hs_bindgen_3a402a665e290fa3_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateSoftwareRenderer@
hs_bindgen_3a402a665e290fa3
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO (BG.Ptr SDL_Renderer)
hs_bindgen_3a402a665e290fa3 =
  BG.fromFFIType hs_bindgen_3a402a665e290fa3_base

-- | Create a 2D software rendering context for a surface.
--
--     Two other API which can be used to create 'SDL_Renderer': @SDL_CreateRenderer()@ and @SDL_CreateWindowAndRenderer()@. These can /also/ create a software renderer, but they are intended to be used with an SDL_Window as the final destination and not an SDL_Surface.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyRenderer'
--
--     [C declaration]: @SDL_CreateSoftwareRenderer@, defined at @SDL3\/SDL_render.h 421:44@
sDL_CreateSoftwareRenderer
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: the SDL_Surface structure representing the surface where rendering is done.
  -> IO (BG.Ptr SDL_Renderer)
sDL_CreateSoftwareRenderer =
  hs_bindgen_3a402a665e290fa3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderer@
foreign import ccall unsafe "hs_bindgen_30584ed4cc19ca5c"
  hs_bindgen_30584ed4cc19ca5c_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderer@
hs_bindgen_30584ed4cc19ca5c
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO (BG.Ptr SDL_Renderer)
hs_bindgen_30584ed4cc19ca5c =
  BG.fromFFIType hs_bindgen_30584ed4cc19ca5c_base

-- | Get the renderer associated with a window.
--
--     [Returns]: the rendering context on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRenderer@, defined at @SDL3\/SDL_render.h 434:44@
sDL_GetRenderer
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (BG.Ptr SDL_Renderer)
sDL_GetRenderer = hs_bindgen_30584ed4cc19ca5c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderWindow@
foreign import ccall unsafe "hs_bindgen_c043f286f3176cd8"
  hs_bindgen_c043f286f3176cd8_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderWindow@
hs_bindgen_c043f286f3176cd8
  :: BG.Ptr SDL_Renderer
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
hs_bindgen_c043f286f3176cd8 =
  BG.fromFFIType hs_bindgen_c043f286f3176cd8_base

-- | Get the window associated with a renderer.
--
--     [Returns]: the window on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRenderWindow@, defined at @SDL3\/SDL_render.h 447:42@
sDL_GetRenderWindow
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
sDL_GetRenderWindow = hs_bindgen_c043f286f3176cd8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRendererName@
foreign import ccall unsafe "hs_bindgen_b4d2799733c66a42"
  hs_bindgen_b4d2799733c66a42_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRendererName@
hs_bindgen_b4d2799733c66a42
  :: BG.Ptr SDL_Renderer
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_b4d2799733c66a42 =
  BG.fromFFIType hs_bindgen_b4d2799733c66a42_base

-- | Get the name of a renderer.
--
--     [Returns]: the name of the selected renderer, or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateRenderer', 'sDL_CreateRendererWithProperties'
--
--     [C declaration]: @SDL_GetRendererName@, defined at @SDL3\/SDL_render.h 463:42@
sDL_GetRendererName
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetRendererName = hs_bindgen_b4d2799733c66a42

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRendererProperties@
foreign import ccall unsafe "hs_bindgen_519d759f13b5a204"
  hs_bindgen_519d759f13b5a204_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRendererProperties@
hs_bindgen_519d759f13b5a204
  :: BG.Ptr SDL_Renderer
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_519d759f13b5a204 =
  BG.fromFFIType hs_bindgen_519d759f13b5a204_base

-- | Get the properties associated with a renderer.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_RENDERER_NAME_STRING'@: the name of the rendering driver
--
--     * @'sDL_PROP_RENDERER_WINDOW_POINTER'@: the window where rendering is displayed, if any
--
--     * @'sDL_PROP_RENDERER_SURFACE_POINTER'@: the surface where rendering is displayed, if this is a software renderer without a window
--
--     * @'sDL_PROP_RENDERER_VSYNC_NUMBER'@: the current vsync setting
--
--     * @'sDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER'@: the maximum texture width and height
--
--     * @'sDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER'@: a (const SDL_PixelFormat *) array of pixel formats, terminated with SDL_PIXELFORMAT_UNKNOWN, representing the available texture formats for this renderer.
--
--     * @'sDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN'@: true if the renderer supports SDL_TEXTURE_ADDRESS_WRAP on non-power-of-two textures.
--
--     * @'sDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER'@: an SDL_Colorspace value describing the colorspace for output to the display, defaults to SDL_COLORSPACE_SRGB.
--
--     * @'sDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN'@: true if the output colorspace is SDL_COLORSPACE_SRGB_LINEAR and the renderer is showing on a display with HDR enabled. This property can change dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
--
--     * @'sDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT'@: the value of SDR white in the SDL_COLORSPACE_SRGB_LINEAR colorspace. When HDR is enabled, this value is automatically multiplied into the color scale. This property can change dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
--
--     * @'sDL_PROP_RENDERER_HDR_HEADROOM_FLOAT'@: the additional high dynamic range that can be displayed, in terms of the SDR white point. When HDR is not enabled, this will be 1.0. This property can change dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
--
--     With the direct3d renderer:
--
--     * @'sDL_PROP_RENDERER_D3D9_DEVICE_POINTER'@: the IDirect3DDevice9 associated with the renderer
--
--     With the direct3d11 renderer:
--
--     * @'sDL_PROP_RENDERER_D3D11_DEVICE_POINTER'@: the ID3D11Device associated with the renderer
--
--     * @'sDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER'@: the IDXGISwapChain1 associated with the renderer. This may change when the window is resized.
--
--     With the direct3d12 renderer:
--
--     * @'sDL_PROP_RENDERER_D3D12_DEVICE_POINTER'@: the ID3D12Device associated with the renderer
--
--     * @'sDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER'@: the IDXGISwapChain4 associated with the renderer.
--
--     * @'sDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER'@: the ID3D12CommandQueue associated with the renderer
--
--     With the vulkan renderer:
--
--     * @'sDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER'@: the VkInstance associated with the renderer
--
--     * @'sDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER'@: the VkSurfaceKHR associated with the renderer
--
--     * @'sDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER'@: the VkPhysicalDevice associated with the renderer
--
--     * @'sDL_PROP_RENDERER_VULKAN_DEVICE_POINTER'@: the VkDevice associated with the renderer
--
--     * @'sDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER'@: the queue family index used for rendering
--
--     * @'sDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER'@: the queue family index used for presentation
--
--     * @'sDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER'@: the number of swapchain images, or potential frames in flight, used by the Vulkan renderer
--
--     With the gpu renderer:
--
--     * @'sDL_PROP_RENDERER_GPU_DEVICE_POINTER'@: the SDL_GPUDevice associated with the renderer
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRendererProperties@, defined at @SDL3\/SDL_render.h 551:46@
sDL_GetRendererProperties
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetRendererProperties =
  hs_bindgen_519d759f13b5a204

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderOutputSize@
foreign import ccall unsafe "hs_bindgen_15b72b770c77a09c"
  hs_bindgen_15b72b770c77a09c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderOutputSize@
hs_bindgen_15b72b770c77a09c
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_15b72b770c77a09c =
  BG.fromFFIType hs_bindgen_15b72b770c77a09c_base

-- | Get the output size in pixels of a rendering context.
--
--     This returns the true output size in pixels, ignoring any render targets or logical size and presentation.
--
--     For the output size of the current rendering target, with logical size adjustments, use @SDL_GetCurrentRenderOutputSize()@ instead.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetCurrentRenderOutputSize'
--
--     [C declaration]: @SDL_GetRenderOutputSize@, defined at @SDL3\/SDL_render.h 600:34@
sDL_GetRenderOutputSize
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer filled in with the width in pixels.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer filled in with the height in pixels.
  -> IO BG.CBool
sDL_GetRenderOutputSize = hs_bindgen_15b72b770c77a09c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetCurrentRenderOutputSize@
foreign import ccall unsafe "hs_bindgen_09a49b8dd8196ac2"
  hs_bindgen_09a49b8dd8196ac2_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetCurrentRenderOutputSize@
hs_bindgen_09a49b8dd8196ac2
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_09a49b8dd8196ac2 =
  BG.fromFFIType hs_bindgen_09a49b8dd8196ac2_base

-- | Get the current output size in pixels of a rendering context.
--
--     If a rendering target is active, this will return the size of the rendering target in pixels, otherwise return the value of @SDL_GetRenderOutputSize()@.
--
--     Rendering target or not, the output will be adjusted by the current logical presentation state, dictated by @SDL_SetRenderLogicalPresentation()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderOutputSize'
--
--     [C declaration]: @SDL_GetCurrentRenderOutputSize@, defined at @SDL3\/SDL_render.h 623:34@
sDL_GetCurrentRenderOutputSize
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer filled in with the current width.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer filled in with the current height.
  -> IO BG.CBool
sDL_GetCurrentRenderOutputSize =
  hs_bindgen_09a49b8dd8196ac2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateTexture@
foreign import ccall unsafe "hs_bindgen_3d4ff9d99a3fa98a"
  hs_bindgen_3d4ff9d99a3fa98a_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> BG.Int32
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateTexture@
hs_bindgen_3d4ff9d99a3fa98a
  :: BG.Ptr SDL_Renderer
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> SDL_TextureAccess
  -> BG.CInt
  -> BG.CInt
  -> IO (BG.Ptr SDL_Texture)
hs_bindgen_3d4ff9d99a3fa98a =
  BG.fromFFIType hs_bindgen_3d4ff9d99a3fa98a_base

-- | Create a texture for a rendering context.
--
--     The contents of a texture when first created are not defined.
--
--     [Returns]: the created texture or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTextureFromSurface', 'sDL_CreateTextureWithProperties', 'sDL_DestroyTexture', 'sDL_GetTextureSize', 'sDL_UpdateTexture'
--
--     [C declaration]: @SDL_CreateTexture@, defined at @SDL3\/SDL_render.h 648:43@
sDL_CreateTexture
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: one of the enumerated values in SDL_PixelFormat.
  -> SDL_TextureAccess
  -- ^
  --
  --           [@access@]: one of the enumerated values in 'SDL_TextureAccess'.
  -> BG.CInt
  -- ^
  --
  --           [@w@]: the width of the texture in pixels.
  -> BG.CInt
  -- ^
  --
  --           [@h@]: the height of the texture in pixels.
  -> IO (BG.Ptr SDL_Texture)
sDL_CreateTexture = hs_bindgen_3d4ff9d99a3fa98a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateTextureFromSurface@
foreign import ccall unsafe "hs_bindgen_46cceb118c5977b8"
  hs_bindgen_46cceb118c5977b8_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateTextureFromSurface@
hs_bindgen_46cceb118c5977b8
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO (BG.Ptr SDL_Texture)
hs_bindgen_46cceb118c5977b8 =
  BG.fromFFIType hs_bindgen_46cceb118c5977b8_base

-- | Create a texture from an existing surface.
--
--     The surface is not modified or freed by this function.
--
--     The 'SDL_TextureAccess' hint for the created texture is @SDL_TEXTUREACCESS_STATIC@.
--
--     The pixel format of the created texture may be different from the pixel format of the surface, and can be queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
--
--     [Returns]: the created texture or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTexture', 'sDL_CreateTextureWithProperties', 'sDL_DestroyTexture'
--
--     [C declaration]: @SDL_CreateTextureFromSurface@, defined at @SDL3\/SDL_render.h 676:43@
sDL_CreateTextureFromSurface
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: the SDL_Surface structure containing pixel data used to fill the texture.
  -> IO (BG.Ptr SDL_Texture)
sDL_CreateTextureFromSurface =
  hs_bindgen_46cceb118c5977b8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateTextureWithProperties@
foreign import ccall unsafe "hs_bindgen_52cc37cb33c5a099"
  hs_bindgen_52cc37cb33c5a099_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateTextureWithProperties@
hs_bindgen_52cc37cb33c5a099
  :: BG.Ptr SDL_Renderer
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO (BG.Ptr SDL_Texture)
hs_bindgen_52cc37cb33c5a099 =
  BG.fromFFIType hs_bindgen_52cc37cb33c5a099_base

-- | Create a texture for a rendering context with the specified properties.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER'@: an SDL_Colorspace value describing the texture colorspace, defaults to SDL_COLORSPACE_SRGB_LINEAR for floating point textures, SDL_COLORSPACE_HDR10 for 10-bit textures, SDL_COLORSPACE_SRGB for other RGB textures and SDL_COLORSPACE_JPEG for YUV textures.
--
--     * @'sDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER'@: one of the enumerated values in SDL_PixelFormat, defaults to the best RGBA format for the renderer
--
--     * @'sDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER'@: one of the enumerated values in 'SDL_TextureAccess', defaults to SDL_TEXTUREACCESS_STATIC
--
--     * @'sDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER'@: the width of the texture in pixels, required
--
--     * @'sDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER'@: the height of the texture in pixels, required
--
--     * @'sDL_PROP_TEXTURE_CREATE_PALETTE_POINTER'@: an SDL_Palette to use with palettized texture formats. This can be set later with @SDL_SetTexturePalette()@
--
--     * @'sDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT'@: for HDR10 and floating point textures, this defines the value of 100% diffuse white, with higher values being displayed in the High Dynamic Range headroom. This defaults to 100 for HDR10 textures and 1.0 for floating point textures.
--
--     * @'sDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT'@: for HDR10 and floating point textures, this defines the maximum dynamic range used by the content, in terms of the SDR white point. This would be equivalent to maxCLL \/ SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT for HDR10 content. If this is defined, any values outside the range supported by the display will be scaled into the available HDR headroom, otherwise they are clipped.
--
--     With the direct3d11 renderer:
--
--     * @'sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER'@: the ID3D11Texture2D associated with the texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER'@: the ID3D11Texture2D associated with the U plane of a YUV texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER'@: the ID3D11Texture2D associated with the V plane of a YUV texture, if you want to wrap an existing texture.
--
--     With the direct3d12 renderer:
--
--     * @'sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER'@: the ID3D12Resource associated with the texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER'@: the ID3D12Resource associated with the U plane of a YUV texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER'@: the ID3D12Resource associated with the V plane of a YUV texture, if you want to wrap an existing texture.
--
--     With the metal renderer:
--
--     * @'sDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER'@: the CVPixelBufferRef associated with the texture, if you want to create a texture from an existing pixel buffer.
--
--     With the opengl renderer:
--
--     * @'sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER'@: the GLuint texture associated with the texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER'@: the GLuint texture associated with the UV plane of an NV12 texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER'@: the GLuint texture associated with the U plane of a YUV texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER'@: the GLuint texture associated with the V plane of a YUV texture, if you want to wrap an existing texture.
--
--     With the opengles2 renderer:
--
--     * @'sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER'@: the GLuint texture associated with the texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER'@: the GLuint texture associated with the texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER'@: the GLuint texture associated with the UV plane of an NV12 texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER'@: the GLuint texture associated with the U plane of a YUV texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER'@: the GLuint texture associated with the V plane of a YUV texture, if you want to wrap an existing texture.
--
--     With the vulkan renderer:
--
--     * @'sDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER'@: the VkImage associated with the texture, if you want to wrap an existing texture.
--
--     * @'sDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER'@: the VkImageLayout for the VkImage, defaults to VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL.
--
--     With the GPU renderer:
--
--     * @'sDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER'@: the SDL_GPUTexture associated with the texture, if you want to wrap an existing texture.
--
--     * @SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_NUMBER@: the SDL_GPUTexture associated with the UV plane of an NV12 texture, if you want to wrap an existing texture.
--
--     * @SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_NUMBER@: the SDL_GPUTexture associated with the U plane of a YUV texture, if you want to wrap an existing texture.
--
--     * @SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_NUMBER@: the SDL_GPUTexture associated with the V plane of a YUV texture, if you want to wrap an existing texture.
--
--     [Returns]: the created texture or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_CreateProperties, 'sDL_CreateTexture', 'sDL_CreateTextureFromSurface', 'sDL_DestroyTexture', 'sDL_GetTextureSize', 'sDL_UpdateTexture'
--
--     [C declaration]: @SDL_CreateTextureWithProperties@, defined at @SDL3\/SDL_render.h 806:43@
sDL_CreateTextureWithProperties
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Texture)
sDL_CreateTextureWithProperties =
  hs_bindgen_52cc37cb33c5a099

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureProperties@
foreign import ccall unsafe "hs_bindgen_7d1578a13c421f10"
  hs_bindgen_7d1578a13c421f10_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureProperties@
hs_bindgen_7d1578a13c421f10
  :: BG.Ptr SDL_Texture
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_7d1578a13c421f10 =
  BG.fromFFIType hs_bindgen_7d1578a13c421f10_base

-- | Get the properties associated with a texture.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_TEXTURE_COLORSPACE_NUMBER'@: an SDL_Colorspace value describing the texture colorspace.
--
--     * @'sDL_PROP_TEXTURE_FORMAT_NUMBER'@: one of the enumerated values in SDL_PixelFormat.
--
--     * @'sDL_PROP_TEXTURE_ACCESS_NUMBER'@: one of the enumerated values in 'SDL_TextureAccess'.
--
--     * @'sDL_PROP_TEXTURE_WIDTH_NUMBER'@: the width of the texture in pixels.
--
--     * @'sDL_PROP_TEXTURE_HEIGHT_NUMBER'@: the height of the texture in pixels.
--
--     * @'sDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT'@: for HDR10 and floating point textures, this defines the value of 100% diffuse white, with higher values being displayed in the High Dynamic Range headroom. This defaults to 100 for HDR10 textures and 1.0 for other textures.
--
--     * @'sDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT'@: for HDR10 and floating point textures, this defines the maximum dynamic range used by the content, in terms of the SDR white point. If this is defined, any values outside the range supported by the display will be scaled into the available HDR headroom, otherwise they are clipped. This defaults to 1.0 for SDR textures, 4.0 for HDR10 textures, and no default for floating point textures.
--
--     With the direct3d11 renderer:
--
--     * @'sDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER'@: the ID3D11Texture2D associated with the texture
--
--     * @'sDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER'@: the ID3D11Texture2D associated with the U plane of a YUV texture
--
--     * @'sDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER'@: the ID3D11Texture2D associated with the V plane of a YUV texture
--
--     With the direct3d12 renderer:
--
--     * @'sDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER'@: the ID3D12Resource associated with the texture
--
--     * @'sDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER'@: the ID3D12Resource associated with the U plane of a YUV texture
--
--     * @'sDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER'@: the ID3D12Resource associated with the V plane of a YUV texture
--
--     With the vulkan renderer:
--
--     * @'sDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER'@: the VkImage associated with the texture
--
--     With the opengl renderer:
--
--     * @'sDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER'@: the GLuint texture associated with the texture
--
--     * @'sDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER'@: the GLuint texture associated with the UV plane of an NV12 texture
--
--     * @'sDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER'@: the GLuint texture associated with the U plane of a YUV texture
--
--     * @'sDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER'@: the GLuint texture associated with the V plane of a YUV texture
--
--     * @'sDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER'@: the GLenum for the texture target (@GL_TEXTURE_2D@, @GL_TEXTURE_RECTANGLE_ARB@, etc)
--
--     * @'sDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT'@: the texture coordinate width of the texture (0.0 - 1.0)
--
--     * @'sDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT'@: the texture coordinate height of the texture (0.0 - 1.0)
--
--     With the opengles2 renderer:
--
--     * @'sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER'@: the GLuint texture associated with the texture
--
--     * @'sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER'@: the GLuint texture associated with the UV plane of an NV12 texture
--
--     * @'sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER'@: the GLuint texture associated with the U plane of a YUV texture
--
--     * @'sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER'@: the GLuint texture associated with the V plane of a YUV texture
--
--     * @'sDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER'@: the GLenum for the texture target (@GL_TEXTURE_2D@, @GL_TEXTURE_EXTERNAL_OES@, etc)
--
--     With the gpu renderer:
--
--     * @'sDL_PROP_TEXTURE_GPU_TEXTURE_POINTER'@: the SDL_GPUTexture associated with the texture
--
--     * @'sDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER'@: the SDL_GPUTexture associated with the UV plane of an NV12 texture
--
--     * @'sDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER'@: the SDL_GPUTexture associated with the U plane of a YUV texture
--
--     * @'sDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER'@: the SDL_GPUTexture associated with the V plane of a YUV texture
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTextureProperties@, defined at @SDL3\/SDL_render.h 935:46@
sDL_GetTextureProperties
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetTextureProperties =
  hs_bindgen_7d1578a13c421f10

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRendererFromTexture@
foreign import ccall unsafe "hs_bindgen_59ae54d4482ab0ef"
  hs_bindgen_59ae54d4482ab0ef_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRendererFromTexture@
hs_bindgen_59ae54d4482ab0ef
  :: BG.Ptr SDL_Texture
  -> IO (BG.Ptr SDL_Renderer)
hs_bindgen_59ae54d4482ab0ef =
  BG.fromFFIType hs_bindgen_59ae54d4482ab0ef_base

-- | Get the renderer that created an 'SDL_Texture'.
--
--     [Returns]: a pointer to the 'SDL_Renderer' that created the texture, or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRendererFromTexture@, defined at @SDL3\/SDL_render.h 979:44@
sDL_GetRendererFromTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> IO (BG.Ptr SDL_Renderer)
sDL_GetRendererFromTexture =
  hs_bindgen_59ae54d4482ab0ef

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureSize@
foreign import ccall unsafe "hs_bindgen_132d974026c63235"
  hs_bindgen_132d974026c63235_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureSize@
hs_bindgen_132d974026c63235
  :: BG.Ptr SDL_Texture
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_132d974026c63235 =
  BG.fromFFIType hs_bindgen_132d974026c63235_base

-- | Get the size of a texture, as floating point values.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTextureSize@, defined at @SDL3\/SDL_render.h 996:34@
sDL_GetTextureSize
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@w@]: a pointer filled in with the width of the texture in pixels. This argument can be NULL if you don\'t need this information.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@h@]: a pointer filled in with the height of the texture in pixels. This argument can be NULL if you don\'t need this information.
  -> IO BG.CBool
sDL_GetTextureSize = hs_bindgen_132d974026c63235

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTexturePalette@
foreign import ccall unsafe "hs_bindgen_b9b978978bcb3701"
  hs_bindgen_b9b978978bcb3701_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTexturePalette@
hs_bindgen_b9b978978bcb3701
  :: BG.Ptr SDL_Texture
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -> IO BG.CBool
hs_bindgen_b9b978978bcb3701 =
  BG.fromFFIType hs_bindgen_b9b978978bcb3701_base

-- | Set the palette used by a texture.
--
--     Setting the palette keeps an internal reference to the palette, which can be safely destroyed afterwards.
--
--     A single palette can be shared with many textures.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: SDL_CreatePalette, 'sDL_GetTexturePalette'
--
--     [C declaration]: @SDL_SetTexturePalette@, defined at @SDL3\/SDL_render.h 1018:34@
sDL_SetTexturePalette
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -- ^
  --
  --           [@palette@]: the SDL_Palette structure to use.
  -> IO BG.CBool
sDL_SetTexturePalette = hs_bindgen_b9b978978bcb3701

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTexturePalette@
foreign import ccall unsafe "hs_bindgen_38dd0c6a7ed9af72"
  hs_bindgen_38dd0c6a7ed9af72_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTexturePalette@
hs_bindgen_38dd0c6a7ed9af72
  :: BG.Ptr SDL_Texture
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
hs_bindgen_38dd0c6a7ed9af72 =
  BG.fromFFIType hs_bindgen_38dd0c6a7ed9af72_base

-- | Get the palette used by a texture.
--
--     [Returns]: a pointer to the palette used by the texture, or NULL if there is no palette used.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_SetTexturePalette'
--
--     [C declaration]: @SDL_GetTexturePalette@, defined at @SDL3\/SDL_render.h 1033:43@
sDL_GetTexturePalette
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
sDL_GetTexturePalette = hs_bindgen_38dd0c6a7ed9af72

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureColorMod@
foreign import ccall unsafe "hs_bindgen_328bc9103549865a"
  hs_bindgen_328bc9103549865a_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureColorMod@
hs_bindgen_328bc9103549865a
  :: BG.Ptr SDL_Texture
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_328bc9103549865a =
  BG.fromFFIType hs_bindgen_328bc9103549865a_base

-- | Set an additional color value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * (color \/ 255)@
--
--     Color modulation is not always supported by the renderer; it will return false if color modulation is not supported.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureColorMod', 'sDL_SetTextureAlphaMod', 'sDL_SetTextureColorModFloat'
--
--     [C declaration]: @SDL_SetTextureColorMod@, defined at @SDL3\/SDL_render.h 1062:34@
sDL_SetTextureColorMod
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: the red color value multiplied into copy operations.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: the green color value multiplied into copy operations.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: the blue color value multiplied into copy operations.
  -> IO BG.CBool
sDL_SetTextureColorMod = hs_bindgen_328bc9103549865a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureColorModFloat@
foreign import ccall unsafe "hs_bindgen_f0f25fbdb4151d72"
  hs_bindgen_f0f25fbdb4151d72_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureColorModFloat@
hs_bindgen_f0f25fbdb4151d72
  :: BG.Ptr SDL_Texture
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_f0f25fbdb4151d72 =
  BG.fromFFIType hs_bindgen_f0f25fbdb4151d72_base

-- | Set an additional color value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * color@
--
--     Color modulation is not always supported by the renderer; it will return false if color modulation is not supported.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureColorModFloat', 'sDL_SetTextureAlphaModFloat', 'sDL_SetTextureColorMod'
--
--     [C declaration]: @SDL_SetTextureColorModFloat@, defined at @SDL3\/SDL_render.h 1092:34@
sDL_SetTextureColorModFloat
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> BG.CFloat
  -- ^
  --
  --           [@r@]: the red color value multiplied into copy operations.
  -> BG.CFloat
  -- ^
  --
  --           [@g@]: the green color value multiplied into copy operations.
  -> BG.CFloat
  -- ^
  --
  --           [@b@]: the blue color value multiplied into copy operations.
  -> IO BG.CBool
sDL_SetTextureColorModFloat =
  hs_bindgen_f0f25fbdb4151d72

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureColorMod@
foreign import ccall unsafe "hs_bindgen_23c41565e3ebaf20"
  hs_bindgen_23c41565e3ebaf20_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureColorMod@
hs_bindgen_23c41565e3ebaf20
  :: BG.Ptr SDL_Texture
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_23c41565e3ebaf20 =
  BG.fromFFIType hs_bindgen_23c41565e3ebaf20_base

-- | Get the additional color value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureAlphaMod', 'sDL_GetTextureColorModFloat', 'sDL_SetTextureColorMod'
--
--     [C declaration]: @SDL_GetTextureColorMod@, defined at @SDL3\/SDL_render.h 1113:34@
sDL_GetTextureColorMod
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: a pointer filled in with the current red color value.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: a pointer filled in with the current green color value.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: a pointer filled in with the current blue color value.
  -> IO BG.CBool
sDL_GetTextureColorMod = hs_bindgen_23c41565e3ebaf20

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureColorModFloat@
foreign import ccall unsafe "hs_bindgen_40f14359348d1377"
  hs_bindgen_40f14359348d1377_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureColorModFloat@
hs_bindgen_40f14359348d1377
  :: BG.Ptr SDL_Texture
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_40f14359348d1377 =
  BG.fromFFIType hs_bindgen_40f14359348d1377_base

-- | Get the additional color value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureAlphaModFloat', 'sDL_GetTextureColorMod', 'sDL_SetTextureColorModFloat'
--
--     [C declaration]: @SDL_GetTextureColorModFloat@, defined at @SDL3\/SDL_render.h 1133:34@
sDL_GetTextureColorModFloat
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@r@]: a pointer filled in with the current red color value.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@g@]: a pointer filled in with the current green color value.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@b@]: a pointer filled in with the current blue color value.
  -> IO BG.CBool
sDL_GetTextureColorModFloat =
  hs_bindgen_40f14359348d1377

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureAlphaMod@
foreign import ccall unsafe "hs_bindgen_5ed240f184c27e2f"
  hs_bindgen_5ed240f184c27e2f_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureAlphaMod@
hs_bindgen_5ed240f184c27e2f
  :: BG.Ptr SDL_Texture
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_5ed240f184c27e2f =
  BG.fromFFIType hs_bindgen_5ed240f184c27e2f_base

-- | Set an additional alpha value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * (alpha \/ 255)@
--
--     Alpha modulation is not always supported by the renderer; it will return false if alpha modulation is not supported.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureAlphaMod', 'sDL_SetTextureAlphaModFloat', 'sDL_SetTextureColorMod'
--
--     [C declaration]: @SDL_SetTextureAlphaMod@, defined at @SDL3\/SDL_render.h 1159:34@
sDL_SetTextureAlphaMod
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@alpha@]: the source alpha value multiplied into copy operations.
  -> IO BG.CBool
sDL_SetTextureAlphaMod = hs_bindgen_5ed240f184c27e2f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureAlphaModFloat@
foreign import ccall unsafe "hs_bindgen_5ea85df5eef9526f"
  hs_bindgen_5ea85df5eef9526f_base
    :: BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureAlphaModFloat@
hs_bindgen_5ea85df5eef9526f
  :: BG.Ptr SDL_Texture
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_5ea85df5eef9526f =
  BG.fromFFIType hs_bindgen_5ea85df5eef9526f_base

-- | Set an additional alpha value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * alpha@
--
--     Alpha modulation is not always supported by the renderer; it will return false if alpha modulation is not supported.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureAlphaModFloat', 'sDL_SetTextureAlphaMod', 'sDL_SetTextureColorModFloat'
--
--     [C declaration]: @SDL_SetTextureAlphaModFloat@, defined at @SDL3\/SDL_render.h 1185:34@
sDL_SetTextureAlphaModFloat
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> BG.CFloat
  -- ^
  --
  --           [@alpha@]: the source alpha value multiplied into copy operations.
  -> IO BG.CBool
sDL_SetTextureAlphaModFloat =
  hs_bindgen_5ea85df5eef9526f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureAlphaMod@
foreign import ccall unsafe "hs_bindgen_b3e62a9848e5067e"
  hs_bindgen_b3e62a9848e5067e_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureAlphaMod@
hs_bindgen_b3e62a9848e5067e
  :: BG.Ptr SDL_Texture
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_b3e62a9848e5067e =
  BG.fromFFIType hs_bindgen_b3e62a9848e5067e_base

-- | Get the additional alpha value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureAlphaModFloat', 'sDL_GetTextureColorMod', 'sDL_SetTextureAlphaMod'
--
--     [C declaration]: @SDL_GetTextureAlphaMod@, defined at @SDL3\/SDL_render.h 1203:34@
sDL_GetTextureAlphaMod
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@alpha@]: a pointer filled in with the current alpha value.
  -> IO BG.CBool
sDL_GetTextureAlphaMod = hs_bindgen_b3e62a9848e5067e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureAlphaModFloat@
foreign import ccall unsafe "hs_bindgen_55b6c4f083626b7a"
  hs_bindgen_55b6c4f083626b7a_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureAlphaModFloat@
hs_bindgen_55b6c4f083626b7a
  :: BG.Ptr SDL_Texture
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_55b6c4f083626b7a =
  BG.fromFFIType hs_bindgen_55b6c4f083626b7a_base

-- | Get the additional alpha value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureAlphaMod', 'sDL_GetTextureColorModFloat', 'sDL_SetTextureAlphaModFloat'
--
--     [C declaration]: @SDL_GetTextureAlphaModFloat@, defined at @SDL3\/SDL_render.h 1221:34@
sDL_GetTextureAlphaModFloat
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@alpha@]: a pointer filled in with the current alpha value.
  -> IO BG.CBool
sDL_GetTextureAlphaModFloat =
  hs_bindgen_55b6c4f083626b7a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureBlendMode@
foreign import ccall unsafe "hs_bindgen_34ab5b9eb64f99e7"
  hs_bindgen_34ab5b9eb64f99e7_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureBlendMode@
hs_bindgen_34ab5b9eb64f99e7
  :: BG.Ptr SDL_Texture
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -> IO BG.CBool
hs_bindgen_34ab5b9eb64f99e7 =
  BG.fromFFIType hs_bindgen_34ab5b9eb64f99e7_base

-- | Set the blend mode for a texture, used by @SDL_RenderTexture()@.
--
--     If the blend mode is not supported, the closest supported mode is chosen and this function returns false.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureBlendMode'
--
--     [C declaration]: @SDL_SetTextureBlendMode@, defined at @SDL3\/SDL_render.h 1240:34@
sDL_SetTextureBlendMode
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: the SDL_BlendMode to use for texture blending.
  -> IO BG.CBool
sDL_SetTextureBlendMode = hs_bindgen_34ab5b9eb64f99e7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureBlendMode@
foreign import ccall unsafe "hs_bindgen_9e50ca0241b5eecf"
  hs_bindgen_9e50ca0241b5eecf_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureBlendMode@
hs_bindgen_9e50ca0241b5eecf
  :: BG.Ptr SDL_Texture
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -> IO BG.CBool
hs_bindgen_9e50ca0241b5eecf =
  BG.fromFFIType hs_bindgen_9e50ca0241b5eecf_base

-- | Get the blend mode used for texture copy operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetTextureBlendMode'
--
--     [C declaration]: @SDL_GetTextureBlendMode@, defined at @SDL3\/SDL_render.h 1256:34@
sDL_GetTextureBlendMode
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
  -> IO BG.CBool
sDL_GetTextureBlendMode = hs_bindgen_9e50ca0241b5eecf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureScaleMode@
foreign import ccall unsafe "hs_bindgen_7ec0426bb117fde0"
  hs_bindgen_7ec0426bb117fde0_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetTextureScaleMode@
hs_bindgen_7ec0426bb117fde0
  :: BG.Ptr SDL_Texture
  -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -> IO BG.CBool
hs_bindgen_7ec0426bb117fde0 =
  BG.fromFFIType hs_bindgen_7ec0426bb117fde0_base

-- | Set the scale mode used for texture scale operations.
--
--     The default texture scale mode is SDL_SCALEMODE_LINEAR.
--
--     If the scale mode is not supported, the closest supported mode is chosen.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextureScaleMode'
--
--     [C declaration]: @SDL_SetTextureScaleMode@, defined at @SDL3\/SDL_render.h 1276:34@
sDL_SetTextureScaleMode
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: the SDL_ScaleMode to use for texture scaling.
  -> IO BG.CBool
sDL_SetTextureScaleMode = hs_bindgen_7ec0426bb117fde0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureScaleMode@
foreign import ccall unsafe "hs_bindgen_d153e754b011263b"
  hs_bindgen_d153e754b011263b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetTextureScaleMode@
hs_bindgen_d153e754b011263b
  :: BG.Ptr SDL_Texture
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -> IO BG.CBool
hs_bindgen_d153e754b011263b =
  BG.fromFFIType hs_bindgen_d153e754b011263b_base

-- | Get the scale mode used for texture scale operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetTextureScaleMode'
--
--     [C declaration]: @SDL_GetTextureScaleMode@, defined at @SDL3\/SDL_render.h 1292:34@
sDL_GetTextureScaleMode
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: a pointer filled in with the current scale mode.
  -> IO BG.CBool
sDL_GetTextureScaleMode = hs_bindgen_d153e754b011263b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_UpdateTexture@
foreign import ccall unsafe "hs_bindgen_9d30d0aa8075c243"
  hs_bindgen_9d30d0aa8075c243_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_UpdateTexture@
hs_bindgen_9d30d0aa8075c243
  :: BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> PtrConst.PtrConst BG.Void
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_9d30d0aa8075c243 =
  BG.fromFFIType hs_bindgen_9d30d0aa8075c243_base

-- | Update the given texture rectangle with new pixel data.
--
--     The pixel data must be in the pixel format of the texture, which can be queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
--
--     This is a fairly slow function, intended for use with static textures that do not change often.
--
--     If the texture is intended to be updated often, it is preferred to create the texture as streaming and use the locking functions referenced below. While this function will work with streaming textures, for optimization reasons you may not get the pixels back if you lock the texture afterward.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockTexture', 'sDL_UnlockTexture', 'sDL_UpdateNVTexture', 'sDL_UpdateYUVTexture'
--
--     [C declaration]: @SDL_UpdateTexture@, defined at @SDL3\/SDL_render.h 1326:34@
sDL_UpdateTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure representing the area to update, or NULL to update the entire texture.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@pixels@]: the raw pixel data in the format of the texture.
  -> BG.CInt
  -- ^
  --
  --           [@pitch@]: the number of bytes in a row of pixel data, including padding between lines.
  -> IO BG.CBool
sDL_UpdateTexture = hs_bindgen_9d30d0aa8075c243

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_UpdateYUVTexture@
foreign import ccall unsafe "hs_bindgen_145fdda972278858"
  hs_bindgen_145fdda972278858_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_UpdateYUVTexture@
hs_bindgen_145fdda972278858
  :: BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.CInt
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.CInt
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_145fdda972278858 =
  BG.fromFFIType hs_bindgen_145fdda972278858_base

-- | Update a rectangle within a planar YV12 or IYUV texture with new pixel data.
--
--     You can use @SDL_UpdateTexture()@ as long as your pixel data is a contiguous block of Y and U\/V planes in the proper order, but this function is available if your pixel data is not contiguous.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UpdateNVTexture', 'sDL_UpdateTexture'
--
--     [C declaration]: @SDL_UpdateYUVTexture@, defined at @SDL3\/SDL_render.h 1358:34@
sDL_UpdateYUVTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer to the rectangle of pixels to update, or NULL to update the entire texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@Yplane@]: the raw pixel data for the Y plane.
  -> BG.CInt
  -- ^
  --
  --           [@Ypitch@]: the number of bytes between rows of pixel data for the Y plane.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@Uplane@]: the raw pixel data for the U plane.
  -> BG.CInt
  -- ^
  --
  --           [@Upitch@]: the number of bytes between rows of pixel data for the U plane.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@Vplane@]: the raw pixel data for the V plane.
  -> BG.CInt
  -- ^
  --
  --           [@Vpitch@]: the number of bytes between rows of pixel data for the V plane.
  -> IO BG.CBool
sDL_UpdateYUVTexture = hs_bindgen_145fdda972278858

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_UpdateNVTexture@
foreign import ccall unsafe "hs_bindgen_8e87aea72679c0be"
  hs_bindgen_8e87aea72679c0be_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_UpdateNVTexture@
hs_bindgen_8e87aea72679c0be
  :: BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.CInt
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_8e87aea72679c0be =
  BG.fromFFIType hs_bindgen_8e87aea72679c0be_base

-- | Update a rectangle within a planar NV12 or NV21 texture with new pixels.
--
--     You can use @SDL_UpdateTexture()@ as long as your pixel data is a contiguous block of NV12\/21 planes in the proper order, but this function is available if your pixel data is not contiguous.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UpdateTexture', 'sDL_UpdateYUVTexture'
--
--     [C declaration]: @SDL_UpdateNVTexture@, defined at @SDL3\/SDL_render.h 1390:34@
sDL_UpdateNVTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer to the rectangle of pixels to update, or NULL to update the entire texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@Yplane@]: the raw pixel data for the Y plane.
  -> BG.CInt
  -- ^
  --
  --           [@Ypitch@]: the number of bytes between rows of pixel data for the Y plane.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@UVplane@]: the raw pixel data for the UV plane.
  -> BG.CInt
  -- ^
  --
  --           [@UVpitch@]: the number of bytes between rows of pixel data for the UV plane.
  -> IO BG.CBool
sDL_UpdateNVTexture = hs_bindgen_8e87aea72679c0be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_LockTexture@
foreign import ccall unsafe "hs_bindgen_f81dacbd782960a7"
  hs_bindgen_f81dacbd782960a7_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_LockTexture@
hs_bindgen_f81dacbd782960a7
  :: BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr (BG.Ptr BG.Void)
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_f81dacbd782960a7 =
  BG.fromFFIType hs_bindgen_f81dacbd782960a7_base

-- | Lock a portion of the texture for __write-only__ pixel access.
--
--     As an optimization, the pixels made available for editing don\'t necessarily contain the old texture data. This is a write-only operation, and if you need to keep a copy of the texture data you should do that at the application level.
--
--     You must use @SDL_UnlockTexture()@ to unlock the pixels and apply any changes.
--
--     [Returns]: true on success or false if the texture is not valid or was not created with @SDL_TEXTUREACCESS_STREAMING@; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockTextureToSurface', 'sDL_UnlockTexture'
--
--     [C declaration]: @SDL_LockTexture@, defined at @SDL3\/SDL_render.h 1425:34@
sDL_LockTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to lock for access, which was created with @SDL_TEXTUREACCESS_STREAMING@.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure representing the area to lock for access; NULL to lock the entire texture.
  -> BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@pixels@]: this is filled in with a pointer to the locked pixels, appropriately offset by the locked area.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@pitch@]: this is filled in with the pitch of the locked pixels; the pitch is the length of one row in bytes.
  -> IO BG.CBool
sDL_LockTexture = hs_bindgen_f81dacbd782960a7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_LockTextureToSurface@
foreign import ccall unsafe "hs_bindgen_0422047faea9296b"
  hs_bindgen_0422047faea9296b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_LockTextureToSurface@
hs_bindgen_0422047faea9296b
  :: BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
  -> IO BG.CBool
hs_bindgen_0422047faea9296b =
  BG.fromFFIType hs_bindgen_0422047faea9296b_base

-- | Lock a portion of the texture for __write-only__ pixel access, and expose it as a SDL surface.
--
--     Besides providing an SDL_Surface instead of raw pixel data, this function operates like SDL_LockTexture.
--
--     As an optimization, the pixels made available for editing don\'t necessarily contain the old texture data. This is a write-only operation, and if you need to keep a copy of the texture data you should do that at the application level.
--
--     You must use @SDL_UnlockTexture()@ to unlock the pixels and apply any changes.
--
--     The returned surface is freed internally after calling @SDL_UnlockTexture()@ or @SDL_DestroyTexture()@. The caller should not free it.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockTexture', 'sDL_UnlockTexture'
--
--     [C declaration]: @SDL_LockTextureToSurface@, defined at @SDL3\/SDL_render.h 1463:34@
sDL_LockTextureToSurface
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to lock for access, which must be created with @SDL_TEXTUREACCESS_STREAMING@.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer to the rectangle to lock for access. If the rect is NULL, the entire texture will be locked.
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
  -- ^
  --
  --           [@surface@]: a pointer to an SDL surface of size __rect__. Don\'t assume any specific pixel content.
  -> IO BG.CBool
sDL_LockTextureToSurface =
  hs_bindgen_0422047faea9296b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_UnlockTexture@
foreign import ccall unsafe "hs_bindgen_9d1b4d7003c2d0ec"
  hs_bindgen_9d1b4d7003c2d0ec_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_UnlockTexture@
hs_bindgen_9d1b4d7003c2d0ec
  :: BG.Ptr SDL_Texture
  -> IO ()
hs_bindgen_9d1b4d7003c2d0ec =
  BG.fromFFIType hs_bindgen_9d1b4d7003c2d0ec_base

-- | Unlock a texture, uploading the changes to video memory, if needed.
--
--     __Warning__: Please note that @SDL_LockTexture()@ is intended to be write-only; it will not guarantee the previous contents of the texture will be provided. You must fully initialize any area of a texture that you lock before unlocking it, as the pixels might otherwise be uninitialized memory.
--
--     Which is to say: locking and immediately unlocking a texture can result in corrupted textures, depending on the renderer in use.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockTexture'
--
--     [C declaration]: @SDL_UnlockTexture@, defined at @SDL3\/SDL_render.h 1484:34@
sDL_UnlockTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: a texture locked by @SDL_LockTexture()@.
  -> IO ()
sDL_UnlockTexture = hs_bindgen_9d1b4d7003c2d0ec

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderTarget@
foreign import ccall unsafe "hs_bindgen_42456f91219d7d63"
  hs_bindgen_42456f91219d7d63_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderTarget@
hs_bindgen_42456f91219d7d63
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_Texture
  -> IO BG.CBool
hs_bindgen_42456f91219d7d63 =
  BG.fromFFIType hs_bindgen_42456f91219d7d63_base

-- | Set a texture as the current rendering target.
--
--     The default render target is the window for which the renderer was created. To stop rendering to a texture and render to the window again, call this function with a NULL @texture@.
--
--     Viewport, cliprect, scale, and logical presentation are unique to each render target. Get and set functions for these states apply to the current render target set by this function, and those states persist on each target when the current render target changes.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderTarget'
--
--     [C declaration]: @SDL_SetRenderTarget@, defined at @SDL3\/SDL_render.h 1511:34@
sDL_SetRenderTarget
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the targeted texture, which must be created with the @SDL_TEXTUREACCESS_TARGET@ flag, or NULL to render to the window instead of a texture.
  -> IO BG.CBool
sDL_SetRenderTarget = hs_bindgen_42456f91219d7d63

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderTarget@
foreign import ccall unsafe "hs_bindgen_afd608e22c7b34c2"
  hs_bindgen_afd608e22c7b34c2_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderTarget@
hs_bindgen_afd608e22c7b34c2
  :: BG.Ptr SDL_Renderer
  -> IO (BG.Ptr SDL_Texture)
hs_bindgen_afd608e22c7b34c2 =
  BG.fromFFIType hs_bindgen_afd608e22c7b34c2_base

-- | Get the current render target.
--
--     The default render target is the window for which the renderer was created, and is reported a NULL here.
--
--     [Returns]: the current render target or NULL for the default render target.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderTarget'
--
--     [C declaration]: @SDL_GetRenderTarget@, defined at @SDL3\/SDL_render.h 1528:43@
sDL_GetRenderTarget
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO (BG.Ptr SDL_Texture)
sDL_GetRenderTarget = hs_bindgen_afd608e22c7b34c2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderLogicalPresentation@
foreign import ccall unsafe "hs_bindgen_99a6a5d6611eb0ad"
  hs_bindgen_99a6a5d6611eb0ad_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderLogicalPresentation@
hs_bindgen_99a6a5d6611eb0ad
  :: BG.Ptr SDL_Renderer
  -> BG.CInt
  -> BG.CInt
  -> SDL_RendererLogicalPresentation
  -> IO BG.CBool
hs_bindgen_99a6a5d6611eb0ad =
  BG.fromFFIType hs_bindgen_99a6a5d6611eb0ad_base

-- | Set a device-independent resolution and presentation mode for rendering.
--
--     This function sets the width and height of the logical rendering output. The renderer will act as if the current render target is always the requested dimensions, scaling to the actual resolution as necessary.
--
--     This can be useful for games that expect a fixed size, but would like to scale the output to whatever is available, regardless of how a user resizes a window, or if the display is high DPI.
--
--     Logical presentation can be used with both render target textures and the renderer\'s window; the state is unique to each render target, and this function sets the state for the current render target. It might be useful to draw to a texture that matches the window dimensions with logical presentation enabled, and then draw that texture across the entire window with logical presentation disabled. Be careful not to render both with logical presentation enabled, however, as this could produce double-letterboxing, etc.
--
--     You can disable logical coordinates by setting the mode to SDL_LOGICAL_PRESENTATION_DISABLED, and in that case you get the full pixel resolution of the render target; it is safe to toggle logical presentation during the rendering of a frame: perhaps most of the rendering is done to specific dimensions but to make fonts look sharp, the app turns off logical presentation while drawing text, for example.
--
--     You can convert coordinates in an event into rendering coordinates using @SDL_ConvertEventToRenderCoordinates()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ConvertEventToRenderCoordinates', 'sDL_GetRenderLogicalPresentation', 'sDL_GetRenderLogicalPresentationRect'
--
--     [C declaration]: @SDL_SetRenderLogicalPresentation@, defined at @SDL3\/SDL_render.h 1575:34@
sDL_SetRenderLogicalPresentation
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.CInt
  -- ^
  --
  --           [@w@]: the width of the logical resolution.
  -> BG.CInt
  -- ^
  --
  --           [@h@]: the height of the logical resolution.
  -> SDL_RendererLogicalPresentation
  -- ^
  --
  --           [@mode@]: the presentation mode used.
  -> IO BG.CBool
sDL_SetRenderLogicalPresentation =
  hs_bindgen_99a6a5d6611eb0ad

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderLogicalPresentation@
foreign import ccall unsafe "hs_bindgen_cbe5162cf71da053"
  hs_bindgen_cbe5162cf71da053_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderLogicalPresentation@
hs_bindgen_cbe5162cf71da053
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr SDL_RendererLogicalPresentation
  -> IO BG.CBool
hs_bindgen_cbe5162cf71da053 =
  BG.fromFFIType hs_bindgen_cbe5162cf71da053_base

-- | Get device independent resolution and presentation mode for rendering.
--
--     This function gets the width and height of the logical rendering output, or 0 if a logical resolution is not enabled.
--
--     Each render target has its own logical presentation state. This function gets the state for the current render target.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderLogicalPresentation'
--
--     [C declaration]: @SDL_GetRenderLogicalPresentation@, defined at @SDL3\/SDL_render.h 1600:34@
sDL_GetRenderLogicalPresentation
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: an int filled with the logical presentation width.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: an int filled with the logical presentation height.
  -> BG.Ptr SDL_RendererLogicalPresentation
  -- ^
  --
  --           [@mode@]: a variable filled with the logical presentation mode being used.
  -> IO BG.CBool
sDL_GetRenderLogicalPresentation =
  hs_bindgen_cbe5162cf71da053

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderLogicalPresentationRect@
foreign import ccall unsafe "hs_bindgen_60fac3e135efff7b"
  hs_bindgen_60fac3e135efff7b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderLogicalPresentationRect@
hs_bindgen_60fac3e135efff7b
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> IO BG.CBool
hs_bindgen_60fac3e135efff7b =
  BG.fromFFIType hs_bindgen_60fac3e135efff7b_base

-- | Get the final presentation rectangle for rendering.
--
--     This function returns the calculated rectangle used for logical presentation, based on the presentation mode and output size. If logical presentation is disabled, it will fill the rectangle with the output size, in pixels.
--
--     Each render target has its own logical presentation state. This function gets the rectangle for the current render target.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderLogicalPresentation'
--
--     [C declaration]: @SDL_GetRenderLogicalPresentationRect@, defined at @SDL3\/SDL_render.h 1625:34@
sDL_GetRenderLogicalPresentationRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rect@]: a pointer filled in with the final presentation rectangle, may be NULL.
  -> IO BG.CBool
sDL_GetRenderLogicalPresentationRect =
  hs_bindgen_60fac3e135efff7b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderCoordinatesFromWindow@
foreign import ccall unsafe "hs_bindgen_88c23a7a2bb3f897"
  hs_bindgen_88c23a7a2bb3f897_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderCoordinatesFromWindow@
hs_bindgen_88c23a7a2bb3f897
  :: BG.Ptr SDL_Renderer
  -> BG.CFloat
  -> BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_88c23a7a2bb3f897 =
  BG.fromFFIType hs_bindgen_88c23a7a2bb3f897_base

-- | Get a point in render coordinates when given a point in window coordinates.
--
--     This takes into account several states:
--
--     * The window dimensions.
--
--     * The logical presentation settings (SDL_SetRenderLogicalPresentation)
--
--     * The scale (SDL_SetRenderScale)
--
--     * The viewport (SDL_SetRenderViewport)
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderLogicalPresentation', 'sDL_SetRenderScale'
--
--     [C declaration]: @SDL_RenderCoordinatesFromWindow@, defined at @SDL3\/SDL_render.h 1652:34@
sDL_RenderCoordinatesFromWindow
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.CFloat
  -- ^
  --
  --           [@window_x@]: the x coordinate in window coordinates.
  -> BG.CFloat
  -- ^
  --
  --           [@window_y@]: the y coordinate in window coordinates.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer filled with the x coordinate in render coordinates.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer filled with the y coordinate in render coordinates.
  -> IO BG.CBool
sDL_RenderCoordinatesFromWindow =
  hs_bindgen_88c23a7a2bb3f897

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderCoordinatesToWindow@
foreign import ccall unsafe "hs_bindgen_30a19a6793a8a60a"
  hs_bindgen_30a19a6793a8a60a_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderCoordinatesToWindow@
hs_bindgen_30a19a6793a8a60a
  :: BG.Ptr SDL_Renderer
  -> BG.CFloat
  -> BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_30a19a6793a8a60a =
  BG.fromFFIType hs_bindgen_30a19a6793a8a60a_base

-- | Get a point in window coordinates when given a point in render coordinates.
--
--     This takes into account several states:
--
--     * The window dimensions.
--
--     * The logical presentation settings (SDL_SetRenderLogicalPresentation)
--
--     * The scale (SDL_SetRenderScale)
--
--     * The viewport (SDL_SetRenderViewport)
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderLogicalPresentation', 'sDL_SetRenderScale', 'sDL_SetRenderViewport'
--
--     [C declaration]: @SDL_RenderCoordinatesToWindow@, defined at @SDL3\/SDL_render.h 1682:34@
sDL_RenderCoordinatesToWindow
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.CFloat
  -- ^
  --
  --           [@x@]: the x coordinate in render coordinates.
  -> BG.CFloat
  -- ^
  --
  --           [@y@]: the y coordinate in render coordinates.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@window_x@]: a pointer filled with the x coordinate in window coordinates.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@window_y@]: a pointer filled with the y coordinate in window coordinates.
  -> IO BG.CBool
sDL_RenderCoordinatesToWindow =
  hs_bindgen_30a19a6793a8a60a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_ConvertEventToRenderCoordinates@
foreign import ccall unsafe "hs_bindgen_99e1877354dd4cdb"
  hs_bindgen_99e1877354dd4cdb_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_ConvertEventToRenderCoordinates@
hs_bindgen_99e1877354dd4cdb
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event
  -> IO BG.CBool
hs_bindgen_99e1877354dd4cdb =
  BG.fromFFIType hs_bindgen_99e1877354dd4cdb_base

-- | Convert the coordinates in an event to render coordinates.
--
--     This takes into account several states:
--
--     * The window dimensions.
--
--     * The logical presentation settings (SDL_SetRenderLogicalPresentation)
--
--     * The scale (SDL_SetRenderScale)
--
--     * The viewport (SDL_SetRenderViewport)
--
--     Various event types are converted with this function: mouse, touch, pen, etc.
--
--     Touch coordinates are converted from normalized coordinates in the window to non-normalized rendering coordinates.
--
--     Relative mouse coordinates (xrel and yrel event fields) are /also/ converted. Applications that do not want these fields converted should use @SDL_RenderCoordinatesFromWindow()@ on the specific event fields instead of converting the entire event structure.
--
--     Once converted, coordinates may be outside the rendering area.
--
--     [Returns]: true if the event is converted or doesn\'t need conversion, or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderCoordinatesFromWindow'
--
--     [C declaration]: @SDL_ConvertEventToRenderCoordinates@, defined at @SDL3\/SDL_render.h 1718:34@
sDL_ConvertEventToRenderCoordinates
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event
  -- ^
  --
  --           [@event@]: the event to modify.
  -> IO BG.CBool
sDL_ConvertEventToRenderCoordinates =
  hs_bindgen_99e1877354dd4cdb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderViewport@
foreign import ccall unsafe "hs_bindgen_da47a291603fd568"
  hs_bindgen_da47a291603fd568_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderViewport@
hs_bindgen_da47a291603fd568
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_da47a291603fd568 =
  BG.fromFFIType hs_bindgen_da47a291603fd568_base

-- | Set the drawing area for rendering on the current target.
--
--     Drawing will clip to this area (separately from any clipping done with SDL_SetRenderClipRect), and the top left of the area will become coordinate (0, 0) for future drawing commands.
--
--     The area\'s width and height must be >= 0.
--
--     Each render target has its own viewport. This function sets the viewport for the current render target.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderViewport', 'sDL_RenderViewportSet'
--
--     [C declaration]: @SDL_SetRenderViewport@, defined at @SDL3\/SDL_render.h 1745:34@
sDL_SetRenderViewport
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure representing the drawing area, or NULL to set the viewport to the entire target.
  -> IO BG.CBool
sDL_SetRenderViewport = hs_bindgen_da47a291603fd568

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderViewport@
foreign import ccall unsafe "hs_bindgen_d36147bdfea02ae0"
  hs_bindgen_d36147bdfea02ae0_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderViewport@
hs_bindgen_d36147bdfea02ae0
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_d36147bdfea02ae0 =
  BG.fromFFIType hs_bindgen_d36147bdfea02ae0_base

-- | Get the drawing area for the current target.
--
--     Each render target has its own viewport. This function gets the viewport for the current render target.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderViewportSet', 'sDL_SetRenderViewport'
--
--     [C declaration]: @SDL_GetRenderViewport@, defined at @SDL3\/SDL_render.h 1765:34@
sDL_GetRenderViewport
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure filled in with the current drawing area.
  -> IO BG.CBool
sDL_GetRenderViewport = hs_bindgen_d36147bdfea02ae0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderViewportSet@
foreign import ccall unsafe "hs_bindgen_b75de8ea63ffb717"
  hs_bindgen_b75de8ea63ffb717_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderViewportSet@
hs_bindgen_b75de8ea63ffb717
  :: BG.Ptr SDL_Renderer
  -> IO BG.CBool
hs_bindgen_b75de8ea63ffb717 =
  BG.fromFFIType hs_bindgen_b75de8ea63ffb717_base

-- | Return whether an explicit rectangle was set as the viewport.
--
--     This is useful if you\'re saving and restoring the viewport and want to know whether you should restore a specific rectangle or NULL.
--
--     Each render target has its own viewport. This function checks the viewport for the current render target.
--
--     [Returns]: true if the viewport was set to a specific rectangle, or false if it was set to NULL (the entire target).
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderViewport', 'sDL_SetRenderViewport'
--
--     [C declaration]: @SDL_RenderViewportSet@, defined at @SDL3\/SDL_render.h 1787:34@
sDL_RenderViewportSet
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO BG.CBool
sDL_RenderViewportSet = hs_bindgen_b75de8ea63ffb717

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderSafeArea@
foreign import ccall unsafe "hs_bindgen_143575ef07d5400f"
  hs_bindgen_143575ef07d5400f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderSafeArea@
hs_bindgen_143575ef07d5400f
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_143575ef07d5400f =
  BG.fromFFIType hs_bindgen_143575ef07d5400f_base

-- | Get the safe area for rendering within the current viewport.
--
--     Some devices have portions of the screen which are partially obscured or not interactive, possibly due to on-screen controls, curved edges, camera notches, TV overscan, etc. This function provides the area of the current viewport which is safe to have interactible content. You should continue rendering into the rest of the render target, but it should not contain visually important or interactible content.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRenderSafeArea@, defined at @SDL3\/SDL_render.h 1809:34@
sDL_GetRenderSafeArea
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer filled in with the area that is safe for interactive content.
  -> IO BG.CBool
sDL_GetRenderSafeArea = hs_bindgen_143575ef07d5400f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderClipRect@
foreign import ccall unsafe "hs_bindgen_db4ee8d700a535c8"
  hs_bindgen_db4ee8d700a535c8_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderClipRect@
hs_bindgen_db4ee8d700a535c8
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_db4ee8d700a535c8 =
  BG.fromFFIType hs_bindgen_db4ee8d700a535c8_base

-- | Set the clip rectangle for rendering on the specified target.
--
--     Each render target has its own clip rectangle. This function sets the cliprect for the current render target.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderClipRect', 'sDL_RenderClipEnabled'
--
--     [C declaration]: @SDL_SetRenderClipRect@, defined at @SDL3\/SDL_render.h 1830:34@
sDL_SetRenderClipRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure representing the clip area, relative to the viewport, or NULL to disable clipping.
  -> IO BG.CBool
sDL_SetRenderClipRect = hs_bindgen_db4ee8d700a535c8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderClipRect@
foreign import ccall unsafe "hs_bindgen_7bd39620f800ed67"
  hs_bindgen_7bd39620f800ed67_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderClipRect@
hs_bindgen_7bd39620f800ed67
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_7bd39620f800ed67 =
  BG.fromFFIType hs_bindgen_7bd39620f800ed67_base

-- | Get the clip rectangle for the current target.
--
--     Each render target has its own clip rectangle. This function gets the cliprect for the current render target.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderClipEnabled', 'sDL_SetRenderClipRect'
--
--     [C declaration]: @SDL_GetRenderClipRect@, defined at @SDL3\/SDL_render.h 1851:34@
sDL_GetRenderClipRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure filled in with the current clipping area or an empty rectangle if clipping is disabled.
  -> IO BG.CBool
sDL_GetRenderClipRect = hs_bindgen_7bd39620f800ed67

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderClipEnabled@
foreign import ccall unsafe "hs_bindgen_011ece38ae24698a"
  hs_bindgen_011ece38ae24698a_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderClipEnabled@
hs_bindgen_011ece38ae24698a
  :: BG.Ptr SDL_Renderer
  -> IO BG.CBool
hs_bindgen_011ece38ae24698a =
  BG.fromFFIType hs_bindgen_011ece38ae24698a_base

-- | Get whether clipping is enabled on the given render target.
--
--     Each render target has its own clip rectangle. This function checks the cliprect for the current render target.
--
--     [Returns]: true if clipping is enabled or false if not; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderClipRect', 'sDL_SetRenderClipRect'
--
--     [C declaration]: @SDL_RenderClipEnabled@, defined at @SDL3\/SDL_render.h 1870:34@
sDL_RenderClipEnabled
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO BG.CBool
sDL_RenderClipEnabled = hs_bindgen_011ece38ae24698a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderScale@
foreign import ccall unsafe "hs_bindgen_a2ecfc86b7164248"
  hs_bindgen_a2ecfc86b7164248_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderScale@
hs_bindgen_a2ecfc86b7164248
  :: BG.Ptr SDL_Renderer
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_a2ecfc86b7164248 =
  BG.fromFFIType hs_bindgen_a2ecfc86b7164248_base

-- | Set the drawing scale for rendering on the current target.
--
--     The drawing coordinates are scaled by the x\/y scaling factors before they are used by the renderer. This allows resolution independent drawing with a single coordinate system.
--
--     If this results in scaling or subpixel drawing by the rendering backend, it will be handled using the appropriate quality hints. For best results use integer scaling factors.
--
--     Each render target has its own scale. This function sets the scale for the current render target.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderScale'
--
--     [C declaration]: @SDL_SetRenderScale@, defined at @SDL3\/SDL_render.h 1898:34@
sDL_SetRenderScale
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.CFloat
  -- ^
  --
  --           [@scaleX@]: the horizontal scaling factor.
  -> BG.CFloat
  -- ^
  --
  --           [@scaleY@]: the vertical scaling factor.
  -> IO BG.CBool
sDL_SetRenderScale = hs_bindgen_a2ecfc86b7164248

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderScale@
foreign import ccall unsafe "hs_bindgen_9b27eba43ce3989c"
  hs_bindgen_9b27eba43ce3989c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderScale@
hs_bindgen_9b27eba43ce3989c
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_9b27eba43ce3989c =
  BG.fromFFIType hs_bindgen_9b27eba43ce3989c_base

-- | Get the drawing scale for the current target.
--
--     Each render target has its own scale. This function gets the scale for the current render target.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderScale'
--
--     [C declaration]: @SDL_GetRenderScale@, defined at @SDL3\/SDL_render.h 1918:34@
sDL_GetRenderScale
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@scaleX@]: a pointer filled in with the horizontal scaling factor.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@scaleY@]: a pointer filled in with the vertical scaling factor.
  -> IO BG.CBool
sDL_GetRenderScale = hs_bindgen_9b27eba43ce3989c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderDrawColor@
foreign import ccall unsafe "hs_bindgen_122da056b531e869"
  hs_bindgen_122da056b531e869_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderDrawColor@
hs_bindgen_122da056b531e869
  :: BG.Ptr SDL_Renderer
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_122da056b531e869 =
  BG.fromFFIType hs_bindgen_122da056b531e869_base

-- | Set the color used for drawing operations.
--
--     Set the color for drawing or filling rectangles, lines, and points, and for @SDL_RenderClear()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderDrawColor', 'sDL_SetRenderDrawColorFloat'
--
--     [C declaration]: @SDL_SetRenderDrawColor@, defined at @SDL3\/SDL_render.h 1943:34@
sDL_SetRenderDrawColor
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: the red value used to draw on the rendering target.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: the green value used to draw on the rendering target.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: the blue value used to draw on the rendering target.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@a@]: the alpha value used to draw on the rendering target; usually @SDL_ALPHA_OPAQUE@ (255). Use SDL_SetRenderDrawBlendMode to specify how the alpha channel is used.
  -> IO BG.CBool
sDL_SetRenderDrawColor = hs_bindgen_122da056b531e869

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderDrawColorFloat@
foreign import ccall unsafe "hs_bindgen_069391a3e71d464d"
  hs_bindgen_069391a3e71d464d_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderDrawColorFloat@
hs_bindgen_069391a3e71d464d
  :: BG.Ptr SDL_Renderer
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_069391a3e71d464d =
  BG.fromFFIType hs_bindgen_069391a3e71d464d_base

-- | Set the color used for drawing operations (Rect, Line and Clear).
--
--     Set the color for drawing or filling rectangles, lines, and points, and for @SDL_RenderClear()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderDrawColorFloat', 'sDL_SetRenderDrawColor'
--
--     [C declaration]: @SDL_SetRenderDrawColorFloat@, defined at @SDL3\/SDL_render.h 1968:34@
sDL_SetRenderDrawColorFloat
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.CFloat
  -- ^
  --
  --           [@r@]: the red value used to draw on the rendering target.
  -> BG.CFloat
  -- ^
  --
  --           [@g@]: the green value used to draw on the rendering target.
  -> BG.CFloat
  -- ^
  --
  --           [@b@]: the blue value used to draw on the rendering target.
  -> BG.CFloat
  -- ^
  --
  --           [@a@]: the alpha value used to draw on the rendering target. Use SDL_SetRenderDrawBlendMode to specify how the alpha channel is used.
  -> IO BG.CBool
sDL_SetRenderDrawColorFloat =
  hs_bindgen_069391a3e71d464d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderDrawColor@
foreign import ccall unsafe "hs_bindgen_7f0f910be4b2889e"
  hs_bindgen_7f0f910be4b2889e_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderDrawColor@
hs_bindgen_7f0f910be4b2889e
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_7f0f910be4b2889e =
  BG.fromFFIType hs_bindgen_7f0f910be4b2889e_base

-- | Get the color used for drawing operations (Rect, Line and Clear).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderDrawColorFloat', 'sDL_SetRenderDrawColor'
--
--     [C declaration]: @SDL_GetRenderDrawColor@, defined at @SDL3\/SDL_render.h 1992:34@
sDL_GetRenderDrawColor
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: a pointer filled in with the red value used to draw on the rendering target.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: a pointer filled in with the green value used to draw on the rendering target.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: a pointer filled in with the blue value used to draw on the rendering target.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@a@]: a pointer filled in with the alpha value used to draw on the rendering target; usually @SDL_ALPHA_OPAQUE@ (255).
  -> IO BG.CBool
sDL_GetRenderDrawColor = hs_bindgen_7f0f910be4b2889e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderDrawColorFloat@
foreign import ccall unsafe "hs_bindgen_7679f2d13375bcd2"
  hs_bindgen_7679f2d13375bcd2_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderDrawColorFloat@
hs_bindgen_7679f2d13375bcd2
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_7679f2d13375bcd2 =
  BG.fromFFIType hs_bindgen_7679f2d13375bcd2_base

-- | Get the color used for drawing operations (Rect, Line and Clear).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderDrawColorFloat', 'sDL_GetRenderDrawColor'
--
--     [C declaration]: @SDL_GetRenderDrawColorFloat@, defined at @SDL3\/SDL_render.h 2016:34@
sDL_GetRenderDrawColorFloat
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@r@]: a pointer filled in with the red value used to draw on the rendering target.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@g@]: a pointer filled in with the green value used to draw on the rendering target.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@b@]: a pointer filled in with the blue value used to draw on the rendering target.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@a@]: a pointer filled in with the alpha value used to draw on the rendering target.
  -> IO BG.CBool
sDL_GetRenderDrawColorFloat =
  hs_bindgen_7679f2d13375bcd2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderColorScale@
foreign import ccall unsafe "hs_bindgen_2d134fc6b089039f"
  hs_bindgen_2d134fc6b089039f_base
    :: BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderColorScale@
hs_bindgen_2d134fc6b089039f
  :: BG.Ptr SDL_Renderer
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_2d134fc6b089039f =
  BG.fromFFIType hs_bindgen_2d134fc6b089039f_base

-- | Set the color scale used for render operations.
--
--     The color scale is an additional scale multiplied into the pixel color value while rendering. This can be used to adjust the brightness of colors during HDR rendering, or changing HDR video brightness when playing on an SDR display.
--
--     The color scale does not affect the alpha channel, only the color brightness.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderColorScale'
--
--     [C declaration]: @SDL_SetRenderColorScale@, defined at @SDL3\/SDL_render.h 2040:34@
sDL_SetRenderColorScale
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.CFloat
  -- ^
  --
  --           [@scale@]: the color scale value.
  -> IO BG.CBool
sDL_SetRenderColorScale = hs_bindgen_2d134fc6b089039f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderColorScale@
foreign import ccall unsafe "hs_bindgen_f9539095c565384c"
  hs_bindgen_f9539095c565384c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderColorScale@
hs_bindgen_f9539095c565384c
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_f9539095c565384c =
  BG.fromFFIType hs_bindgen_f9539095c565384c_base

-- | Get the color scale used for render operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderColorScale'
--
--     [C declaration]: @SDL_GetRenderColorScale@, defined at @SDL3\/SDL_render.h 2056:34@
sDL_GetRenderColorScale
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@scale@]: a pointer filled in with the current color scale value.
  -> IO BG.CBool
sDL_GetRenderColorScale = hs_bindgen_f9539095c565384c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderDrawBlendMode@
foreign import ccall unsafe "hs_bindgen_1885ca90cb47d78c"
  hs_bindgen_1885ca90cb47d78c_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderDrawBlendMode@
hs_bindgen_1885ca90cb47d78c
  :: BG.Ptr SDL_Renderer
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -> IO BG.CBool
hs_bindgen_1885ca90cb47d78c =
  BG.fromFFIType hs_bindgen_1885ca90cb47d78c_base

-- | Set the blend mode used for drawing operations (Fill and Line).
--
--     If the blend mode is not supported, the closest supported mode is chosen.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderDrawBlendMode'
--
--     [C declaration]: @SDL_SetRenderDrawBlendMode@, defined at @SDL3\/SDL_render.h 2074:34@
sDL_SetRenderDrawBlendMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: the SDL_BlendMode to use for blending.
  -> IO BG.CBool
sDL_SetRenderDrawBlendMode =
  hs_bindgen_1885ca90cb47d78c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderDrawBlendMode@
foreign import ccall unsafe "hs_bindgen_80ecda0d3d8d870b"
  hs_bindgen_80ecda0d3d8d870b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderDrawBlendMode@
hs_bindgen_80ecda0d3d8d870b
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -> IO BG.CBool
hs_bindgen_80ecda0d3d8d870b =
  BG.fromFFIType hs_bindgen_80ecda0d3d8d870b_base

-- | Get the blend mode used for drawing operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderDrawBlendMode'
--
--     [C declaration]: @SDL_GetRenderDrawBlendMode@, defined at @SDL3\/SDL_render.h 2090:34@
sDL_GetRenderDrawBlendMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
  -> IO BG.CBool
sDL_GetRenderDrawBlendMode =
  hs_bindgen_80ecda0d3d8d870b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderClear@
foreign import ccall unsafe "hs_bindgen_82119a8dbd03b3ca"
  hs_bindgen_82119a8dbd03b3ca_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderClear@
hs_bindgen_82119a8dbd03b3ca
  :: BG.Ptr SDL_Renderer
  -> IO BG.CBool
hs_bindgen_82119a8dbd03b3ca =
  BG.fromFFIType hs_bindgen_82119a8dbd03b3ca_base

-- | Clear the current rendering target with the drawing color.
--
--     This function clears the entire rendering target, ignoring the viewport and the clip rectangle. Note, that clearing will also set\/fill all pixels of the rendering target to current renderer draw color, so make sure to invoke @SDL_SetRenderDrawColor()@ when needed.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderDrawColor'
--
--     [C declaration]: @SDL_RenderClear@, defined at @SDL3\/SDL_render.h 2110:34@
sDL_RenderClear
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO BG.CBool
sDL_RenderClear = hs_bindgen_82119a8dbd03b3ca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderPoint@
foreign import ccall unsafe "hs_bindgen_c73e2796ab7f90c1"
  hs_bindgen_c73e2796ab7f90c1_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderPoint@
hs_bindgen_c73e2796ab7f90c1
  :: BG.Ptr SDL_Renderer
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_c73e2796ab7f90c1 =
  BG.fromFFIType hs_bindgen_c73e2796ab7f90c1_base

-- | Draw a point on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderPoints'
--
--     [C declaration]: @SDL_RenderPoint@, defined at @SDL3\/SDL_render.h 2127:34@
sDL_RenderPoint
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a point.
  -> BG.CFloat
  -- ^
  --
  --           [@x@]: the x coordinate of the point.
  -> BG.CFloat
  -- ^
  --
  --           [@y@]: the y coordinate of the point.
  -> IO BG.CBool
sDL_RenderPoint = hs_bindgen_c73e2796ab7f90c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderPoints@
foreign import ccall unsafe "hs_bindgen_cb752ddd9f3b53be"
  hs_bindgen_cb752ddd9f3b53be_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderPoints@
hs_bindgen_cb752ddd9f3b53be
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_cb752ddd9f3b53be =
  BG.fromFFIType hs_bindgen_cb752ddd9f3b53be_base

-- | Draw multiple points on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderPoint'
--
--     [C declaration]: @SDL_RenderPoints@, defined at @SDL3\/SDL_render.h 2144:34@
sDL_RenderPoints
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw multiple points.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@points@]: the points to draw.
  -> BG.CInt
  -- ^
  --
  --           [@count@]: the number of points to draw.
  -> IO BG.CBool
sDL_RenderPoints = hs_bindgen_cb752ddd9f3b53be

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderLine@
foreign import ccall unsafe "hs_bindgen_8fc8b7b71da27e92"
  hs_bindgen_8fc8b7b71da27e92_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderLine@
hs_bindgen_8fc8b7b71da27e92
  :: BG.Ptr SDL_Renderer
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_8fc8b7b71da27e92 =
  BG.fromFFIType hs_bindgen_8fc8b7b71da27e92_base

-- | Draw a line on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderLines'
--
--     [C declaration]: @SDL_RenderLine@, defined at @SDL3\/SDL_render.h 2163:34@
sDL_RenderLine
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a line.
  -> BG.CFloat
  -- ^
  --
  --           [@x1@]: the x coordinate of the start point.
  -> BG.CFloat
  -- ^
  --
  --           [@y1@]: the y coordinate of the start point.
  -> BG.CFloat
  -- ^
  --
  --           [@x2@]: the x coordinate of the end point.
  -> BG.CFloat
  -- ^
  --
  --           [@y2@]: the y coordinate of the end point.
  -> IO BG.CBool
sDL_RenderLine = hs_bindgen_8fc8b7b71da27e92

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderLines@
foreign import ccall unsafe "hs_bindgen_d68b0895520fbd3a"
  hs_bindgen_d68b0895520fbd3a_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderLines@
hs_bindgen_d68b0895520fbd3a
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_d68b0895520fbd3a =
  BG.fromFFIType hs_bindgen_d68b0895520fbd3a_base

-- | Draw a series of connected lines on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderLine'
--
--     [C declaration]: @SDL_RenderLines@, defined at @SDL3\/SDL_render.h 2181:34@
sDL_RenderLines
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw multiple lines.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@points@]: the points along the lines.
  -> BG.CInt
  -- ^
  --
  --           [@count@]: the number of points, drawing count-1 lines.
  -> IO BG.CBool
sDL_RenderLines = hs_bindgen_d68b0895520fbd3a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderRect@
foreign import ccall unsafe "hs_bindgen_74702b94b10a8a97"
  hs_bindgen_74702b94b10a8a97_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderRect@
hs_bindgen_74702b94b10a8a97
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> IO BG.CBool
hs_bindgen_74702b94b10a8a97 =
  BG.fromFFIType hs_bindgen_74702b94b10a8a97_base

-- | Draw a rectangle on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderRects'
--
--     [C declaration]: @SDL_RenderRect@, defined at @SDL3\/SDL_render.h 2198:34@
sDL_RenderRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a rectangle.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rect@]: a pointer to the destination rectangle, or NULL to outline the entire rendering target.
  -> IO BG.CBool
sDL_RenderRect = hs_bindgen_74702b94b10a8a97

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderRects@
foreign import ccall unsafe "hs_bindgen_2ee379e179df5f3c"
  hs_bindgen_2ee379e179df5f3c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderRects@
hs_bindgen_2ee379e179df5f3c
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_2ee379e179df5f3c =
  BG.fromFFIType hs_bindgen_2ee379e179df5f3c_base

-- | Draw some number of rectangles on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderRect'
--
--     [C declaration]: @SDL_RenderRects@, defined at @SDL3\/SDL_render.h 2216:34@
sDL_RenderRects
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw multiple rectangles.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rects@]: a pointer to an array of destination rectangles.
  -> BG.CInt
  -- ^
  --
  --           [@count@]: the number of rectangles.
  -> IO BG.CBool
sDL_RenderRects = hs_bindgen_2ee379e179df5f3c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderFillRect@
foreign import ccall unsafe "hs_bindgen_c5b24d3e3930aa12"
  hs_bindgen_c5b24d3e3930aa12_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderFillRect@
hs_bindgen_c5b24d3e3930aa12
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> IO BG.CBool
hs_bindgen_c5b24d3e3930aa12 =
  BG.fromFFIType hs_bindgen_c5b24d3e3930aa12_base

-- | Fill a rectangle on the current rendering target with the drawing color at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderFillRects'
--
--     [C declaration]: @SDL_RenderFillRect@, defined at @SDL3\/SDL_render.h 2234:34@
sDL_RenderFillRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should fill a rectangle.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO BG.CBool
sDL_RenderFillRect = hs_bindgen_c5b24d3e3930aa12

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderFillRects@
foreign import ccall unsafe "hs_bindgen_afbd05ab4eae453e"
  hs_bindgen_afbd05ab4eae453e_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderFillRects@
hs_bindgen_afbd05ab4eae453e
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_afbd05ab4eae453e =
  BG.fromFFIType hs_bindgen_afbd05ab4eae453e_base

-- | Fill some number of rectangles on the current rendering target with the drawing color at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderFillRect'
--
--     [C declaration]: @SDL_RenderFillRects@, defined at @SDL3\/SDL_render.h 2252:34@
sDL_RenderFillRects
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should fill multiple rectangles.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rects@]: a pointer to an array of destination rectangles.
  -> BG.CInt
  -- ^
  --
  --           [@count@]: the number of rectangles.
  -> IO BG.CBool
sDL_RenderFillRects = hs_bindgen_afbd05ab4eae453e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTexture@
foreign import ccall unsafe "hs_bindgen_9502ac14df729213"
  hs_bindgen_9502ac14df729213_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTexture@
hs_bindgen_9502ac14df729213
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> IO BG.CBool
hs_bindgen_9502ac14df729213 =
  BG.fromFFIType hs_bindgen_9502ac14df729213_base

-- | Copy a portion of the texture to the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderTextureRotated', 'sDL_RenderTextureTiled'
--
--     [C declaration]: @SDL_RenderTexture@, defined at @SDL3\/SDL_render.h 2274:34@
sDL_RenderTexture
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should copy parts of a texture.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the source texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@srcrect@]: a pointer to the source rectangle, or NULL for the entire texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO BG.CBool
sDL_RenderTexture = hs_bindgen_9502ac14df729213

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTextureRotated@
foreign import ccall unsafe "hs_bindgen_bdd81c1a4d95fd9a"
  hs_bindgen_bdd81c1a4d95fd9a_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> Double
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTextureRotated@
hs_bindgen_bdd81c1a4d95fd9a
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> BG.CDouble
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -> SDL3.Sys.Bindgen.Surface.SDL_FlipMode
  -> IO BG.CBool
hs_bindgen_bdd81c1a4d95fd9a =
  BG.fromFFIType hs_bindgen_bdd81c1a4d95fd9a_base

-- | Copy a portion of the source texture to the current rendering target, with rotation and flipping, at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderTexture'
--
--     [C declaration]: @SDL_RenderTextureRotated@, defined at @SDL3\/SDL_render.h 2302:34@
sDL_RenderTextureRotated
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should copy parts of a texture.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the source texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@srcrect@]: a pointer to the source rectangle, or NULL for the entire texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> BG.CDouble
  -- ^
  --
  --           [@angle@]: an angle in degrees that indicates the rotation that will be applied to dstrect, rotating it in a clockwise direction.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@center@]: a pointer to a point indicating the point around which dstrect will be rotated (if NULL, rotation will be done around dstrect.w\/2, dstrect.h\/2).
  -> SDL3.Sys.Bindgen.Surface.SDL_FlipMode
  -- ^
  --
  --           [@flip@]: an SDL_FlipMode value stating which flipping actions should be performed on the texture.
  -> IO BG.CBool
sDL_RenderTextureRotated =
  hs_bindgen_bdd81c1a4d95fd9a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTextureAffine@
foreign import ccall unsafe "hs_bindgen_18c2f3b6d0215153"
  hs_bindgen_18c2f3b6d0215153_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTextureAffine@
hs_bindgen_18c2f3b6d0215153
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -> IO BG.CBool
hs_bindgen_18c2f3b6d0215153 =
  BG.fromFFIType hs_bindgen_18c2f3b6d0215153_base

-- | Copy a portion of the source texture to the current rendering target, with affine transform, at subpixel precision.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: You may only call this function from the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderTexture'
--
--     [C declaration]: @SDL_RenderTextureAffine@, defined at @SDL3\/SDL_render.h 2333:34@
sDL_RenderTextureAffine
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should copy parts of a texture.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the source texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@srcrect@]: a pointer to the source rectangle, or NULL for the entire texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@origin@]: a pointer to a point indicating where the top-left corner of srcrect should be mapped to, or NULL for the rendering target\'s origin.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@right@]: a pointer to a point indicating where the top-right corner of srcrect should be mapped to, or NULL for the rendering target\'s top-right corner.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@down@]: a pointer to a point indicating where the bottom-left corner of srcrect should be mapped to, or NULL for the rendering target\'s bottom-left corner.
  -> IO BG.CBool
sDL_RenderTextureAffine = hs_bindgen_18c2f3b6d0215153

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTextureTiled@
foreign import ccall unsafe "hs_bindgen_f46f867b1d2a5b99"
  hs_bindgen_f46f867b1d2a5b99_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> Float
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTextureTiled@
hs_bindgen_f46f867b1d2a5b99
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> BG.CFloat
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> IO BG.CBool
hs_bindgen_f46f867b1d2a5b99 =
  BG.fromFFIType hs_bindgen_f46f867b1d2a5b99_base

-- | Tile a portion of the texture to the current rendering target at subpixel precision.
--
--     The pixels in @srcrect@ will be repeated as many times as needed to completely fill @dstrect@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderTexture'
--
--     [C declaration]: @SDL_RenderTextureTiled@, defined at @SDL3\/SDL_render.h 2362:34@
sDL_RenderTextureTiled
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should copy parts of a texture.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the source texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@srcrect@]: a pointer to the source rectangle, or NULL for the entire texture.
  -> BG.CFloat
  -- ^
  --
  --           [@scale@]: the scale used to transform srcrect into the destination rectangle, e.g. a 32x32 texture with a scale of 2 would fill 64x64 tiles.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO BG.CBool
sDL_RenderTextureTiled = hs_bindgen_f46f867b1d2a5b99

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTexture9Grid@
foreign import ccall unsafe "hs_bindgen_7460ccca85327f67"
  hs_bindgen_7460ccca85327f67_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTexture9Grid@
hs_bindgen_7460ccca85327f67
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> IO BG.CBool
hs_bindgen_7460ccca85327f67 =
  BG.fromFFIType hs_bindgen_7460ccca85327f67_base

-- | Perform a scaled copy using the 9-grid algorithm to the current rendering target at subpixel precision.
--
--     The pixels in the texture are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then stretched into place to cover the remaining destination rectangle.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderTexture', 'sDL_RenderTexture9GridTiled'
--
--     [C declaration]: @SDL_RenderTexture9Grid@, defined at @SDL3\/SDL_render.h 2397:34@
sDL_RenderTexture9Grid
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should copy parts of a texture.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the source texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be used for the 9-grid, or NULL to use the entire texture.
  -> BG.CFloat
  -- ^
  --
  --           [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
  -> BG.CFloat
  -- ^
  --
  --           [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
  -> BG.CFloat
  -- ^
  --
  --           [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
  -> BG.CFloat
  -- ^
  --
  --           [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
  -> BG.CFloat
  -- ^
  --
  --           [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled copy.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO BG.CBool
sDL_RenderTexture9Grid = hs_bindgen_7460ccca85327f67

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTexture9GridTiled@
foreign import ccall unsafe "hs_bindgen_82ec92cefa73aeb4"
  hs_bindgen_82ec92cefa73aeb4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> Float
    -> Float
    -> Float
    -> Float
    -> Float
    -> BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderTexture9GridTiled@
hs_bindgen_82ec92cefa73aeb4
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_82ec92cefa73aeb4 =
  BG.fromFFIType hs_bindgen_82ec92cefa73aeb4_base

-- | Perform a scaled copy using the 9-grid algorithm to the current rendering target at subpixel precision.
--
--     The pixels in the texture are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then tiled into place to cover the remaining destination rectangle.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_RenderTexture', 'sDL_RenderTexture9Grid'
--
--     [C declaration]: @SDL_RenderTexture9GridTiled@, defined at @SDL3\/SDL_render.h 2435:34@
sDL_RenderTexture9GridTiled
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should copy parts of a texture.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the source texture.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be used for the 9-grid, or NULL to use the entire texture.
  -> BG.CFloat
  -- ^
  --
  --           [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
  -> BG.CFloat
  -- ^
  --
  --           [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
  -> BG.CFloat
  -- ^
  --
  --           [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
  -> BG.CFloat
  -- ^
  --
  --           [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
  -> BG.CFloat
  -- ^
  --
  --           [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled copy.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> BG.CFloat
  -- ^
  --
  --           [@tileScale@]: the scale used to transform the borders and center of @srcrect@ into the borders and middle of @dstrect@, or 1.0f for an unscaled copy.
  -> IO BG.CBool
sDL_RenderTexture9GridTiled =
  hs_bindgen_82ec92cefa73aeb4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderGeometry@
foreign import ccall unsafe "hs_bindgen_604c256c92b502f9"
  hs_bindgen_604c256c92b502f9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderGeometry@
hs_bindgen_604c256c92b502f9
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_Texture
  -> PtrConst.PtrConst SDL_Vertex
  -> BG.CInt
  -> PtrConst.PtrConst BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_604c256c92b502f9 =
  BG.fromFFIType hs_bindgen_604c256c92b502f9_base

-- | Render a list of triangles, optionally using a texture and indices into the vertex array Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderGeometryRaw', 'sDL_SetRenderTextureAddressMode'
--
--     [C declaration]: @SDL_RenderGeometry@, defined at @SDL3\/SDL_render.h 2460:34@
sDL_RenderGeometry
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: (optional) The SDL texture to use.
  -> PtrConst.PtrConst SDL_Vertex
  -- ^
  --
  --           [@vertices@]: vertices.
  -> BG.CInt
  -- ^
  --
  --           [@num_vertices@]: number of vertices.
  -> PtrConst.PtrConst BG.CInt
  -- ^
  --
  --           [@indices@]: (optional) An array of integer indices into the \'vertices\' array, if NULL all vertices will be rendered in sequential order.
  -> BG.CInt
  -- ^
  --
  --           [@num_indices@]: number of indices.
  -> IO BG.CBool
sDL_RenderGeometry = hs_bindgen_604c256c92b502f9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderGeometryRaw@
foreign import ccall unsafe "hs_bindgen_ae17af9f44d6d343"
  hs_bindgen_ae17af9f44d6d343_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderGeometryRaw@
hs_bindgen_ae17af9f44d6d343
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_Texture
  -> PtrConst.PtrConst BG.CFloat
  -> BG.CInt
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -> BG.CInt
  -> PtrConst.PtrConst BG.CFloat
  -> BG.CInt
  -> BG.CInt
  -> PtrConst.PtrConst BG.Void
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_ae17af9f44d6d343 =
  BG.fromFFIType hs_bindgen_ae17af9f44d6d343_base

-- | Render a list of triangles, optionally using a texture and indices into the vertex arrays Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RenderGeometry', 'sDL_SetRenderTextureAddressMode'
--
--     [C declaration]: @SDL_RenderGeometryRaw@, defined at @SDL3\/SDL_render.h 2493:34@
sDL_RenderGeometryRaw
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: (optional) The SDL texture to use.
  -> PtrConst.PtrConst BG.CFloat
  -- ^
  --
  --           [@xy@]: vertex positions.
  -> BG.CInt
  -- ^
  --
  --           [@xy_stride@]: byte size to move from one element to the next element.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -- ^
  --
  --           [@color@]: vertex colors (as SDL_FColor).
  -> BG.CInt
  -- ^
  --
  --           [@color_stride@]: byte size to move from one element to the next element.
  -> PtrConst.PtrConst BG.CFloat
  -- ^
  --
  --           [@uv@]: vertex normalized texture coordinates.
  -> BG.CInt
  -- ^
  --
  --           [@uv_stride@]: byte size to move from one element to the next element.
  -> BG.CInt
  -- ^
  --
  --           [@num_vertices@]: number of vertices.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@indices@]: (optional) An array of indices into the \'vertices\' arrays, if NULL all vertices will be rendered in sequential order.
  -> BG.CInt
  -- ^
  --
  --           [@num_indices@]: number of indices.
  -> BG.CInt
  -- ^
  --
  --           [@size_indices@]: index size: 1 (byte), 2 (short), 4 (int).
  -> IO BG.CBool
sDL_RenderGeometryRaw = hs_bindgen_ae17af9f44d6d343

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderTextureAddressMode@
foreign import ccall unsafe "hs_bindgen_f5de60362bf89a18"
  hs_bindgen_f5de60362bf89a18_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderTextureAddressMode@
hs_bindgen_f5de60362bf89a18
  :: BG.Ptr SDL_Renderer
  -> SDL_TextureAddressMode
  -> SDL_TextureAddressMode
  -> IO BG.CBool
hs_bindgen_f5de60362bf89a18 =
  BG.fromFFIType hs_bindgen_f5de60362bf89a18_base

-- | Set the texture addressing mode used in @SDL_RenderGeometry()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_RenderGeometry', 'sDL_RenderGeometryRaw', 'sDL_GetRenderTextureAddressMode'
--
--     [C declaration]: @SDL_SetRenderTextureAddressMode@, defined at @SDL3\/SDL_render.h 2520:34@
sDL_SetRenderTextureAddressMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL_TextureAddressMode
  -- ^
  --
  --           [@u_mode@]: the 'SDL_TextureAddressMode' to use for horizontal texture coordinates in @SDL_RenderGeometry()@.
  -> SDL_TextureAddressMode
  -- ^
  --
  --           [@v_mode@]: the 'SDL_TextureAddressMode' to use for vertical texture coordinates in @SDL_RenderGeometry()@.
  -> IO BG.CBool
sDL_SetRenderTextureAddressMode =
  hs_bindgen_f5de60362bf89a18

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderTextureAddressMode@
foreign import ccall unsafe "hs_bindgen_727bb39b49c44f15"
  hs_bindgen_727bb39b49c44f15_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderTextureAddressMode@
hs_bindgen_727bb39b49c44f15
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_TextureAddressMode
  -> BG.Ptr SDL_TextureAddressMode
  -> IO BG.CBool
hs_bindgen_727bb39b49c44f15 =
  BG.fromFFIType hs_bindgen_727bb39b49c44f15_base

-- | Get the texture addressing mode used in @SDL_RenderGeometry()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_SetRenderTextureAddressMode'
--
--     [C declaration]: @SDL_GetRenderTextureAddressMode@, defined at @SDL3\/SDL_render.h 2541:34@
sDL_GetRenderTextureAddressMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL_TextureAddressMode
  -- ^
  --
  --           [@u_mode@]: a pointer filled in with the 'SDL_TextureAddressMode' to use for horizontal texture coordinates in @SDL_RenderGeometry()@, may be NULL.
  -> BG.Ptr SDL_TextureAddressMode
  -- ^
  --
  --           [@v_mode@]: a pointer filled in with the 'SDL_TextureAddressMode' to use for vertical texture coordinates in @SDL_RenderGeometry()@, may be NULL.
  -> IO BG.CBool
sDL_GetRenderTextureAddressMode =
  hs_bindgen_727bb39b49c44f15

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderReadPixels@
foreign import ccall unsafe "hs_bindgen_7173be00862c48e8"
  hs_bindgen_7173be00862c48e8_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderReadPixels@
hs_bindgen_7173be00862c48e8
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
hs_bindgen_7173be00862c48e8 =
  BG.fromFFIType hs_bindgen_7173be00862c48e8_base

-- | Read pixels from the current rendering target.
--
--     The returned surface contains pixels inside the desired area clipped to the current viewport, and should be freed with SDL_DestroySurface().
--
--     Note that this returns the actual pixels on the screen, so if you are using logical presentation you should use @SDL_GetRenderLogicalPresentationRect()@ to get the area containing your content.
--
--     __WARNING__: This is a very slow operation, and should not be used frequently. If you\'re using this on the main rendering target, it should be called after rendering and before @SDL_RenderPresent()@.
--
--     [Returns]: a new SDL_Surface on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RenderReadPixels@, defined at @SDL3\/SDL_render.h 2568:43@
sDL_RenderReadPixels
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure representing the area to read, which will be clipped to the current viewport, or NULL for the entire viewport.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
sDL_RenderReadPixels = hs_bindgen_7173be00862c48e8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderPresent@
foreign import ccall unsafe "hs_bindgen_e66060f4d8ba3f83"
  hs_bindgen_e66060f4d8ba3f83_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderPresent@
hs_bindgen_e66060f4d8ba3f83
  :: BG.Ptr SDL_Renderer
  -> IO BG.CBool
hs_bindgen_e66060f4d8ba3f83 =
  BG.fromFFIType hs_bindgen_e66060f4d8ba3f83_base

-- | Update the screen with any rendering performed since the previous call.
--
--     SDL\'s rendering functions operate on a backbuffer; that is, calling a rendering function such as @SDL_RenderLine()@ does not directly put a line on the screen, but rather updates the backbuffer. As such, you compose your entire scene and /present/ the composed backbuffer to the screen as a complete picture.
--
--     Therefore, when using SDL\'s rendering API, one does all drawing intended for the frame, and then calls this function once per frame to present the final drawing to the user.
--
--     The backbuffer should be considered invalidated after each present; do not assume that previous contents will exist between frames. You are strongly encouraged to call @SDL_RenderClear()@ to initialize the backbuffer before starting each new frame\'s drawing, even if you plan to overwrite every pixel.
--
--     Please note, that in case of rendering to a texture - there is __no need__ to call @'sDL_RenderPresent'@ after drawing needed objects to a texture, and should not be done; you are only required to change back the rendering target to default via @SDL_SetRenderTarget(renderer, NULL)@ afterwards, as textures by themselves do not have a concept of backbuffers. Calling SDL_RenderPresent while rendering to a texture will fail.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateRenderer', 'sDL_RenderClear', 'sDL_RenderFillRect', 'sDL_RenderFillRects', 'sDL_RenderLine', 'sDL_RenderLines', 'sDL_RenderPoint', 'sDL_RenderPoints', 'sDL_RenderRect', 'sDL_RenderRects', 'sDL_SetRenderDrawBlendMode', 'sDL_SetRenderDrawColor'
--
--     [C declaration]: @SDL_RenderPresent@, defined at @SDL3\/SDL_render.h 2617:34@
sDL_RenderPresent
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO BG.CBool
sDL_RenderPresent = hs_bindgen_e66060f4d8ba3f83

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_DestroyTexture@
foreign import ccall unsafe "hs_bindgen_daf903d539dab511"
  hs_bindgen_daf903d539dab511_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_DestroyTexture@
hs_bindgen_daf903d539dab511
  :: BG.Ptr SDL_Texture
  -> IO ()
hs_bindgen_daf903d539dab511 =
  BG.fromFFIType hs_bindgen_daf903d539dab511_base

-- | Destroy the specified texture.
--
--     Passing NULL or an otherwise invalid texture will set the SDL error message to \"Invalid texture\".
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTexture', 'sDL_CreateTextureFromSurface'
--
--     [C declaration]: @SDL_DestroyTexture@, defined at @SDL3\/SDL_render.h 2634:34@
sDL_DestroyTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to destroy.
  -> IO ()
sDL_DestroyTexture = hs_bindgen_daf903d539dab511

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_DestroyRenderer@
foreign import ccall unsafe "hs_bindgen_1473f45c80ad6575"
  hs_bindgen_1473f45c80ad6575_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_DestroyRenderer@
hs_bindgen_1473f45c80ad6575
  :: BG.Ptr SDL_Renderer
  -> IO ()
hs_bindgen_1473f45c80ad6575 =
  BG.fromFFIType hs_bindgen_1473f45c80ad6575_base

-- | Destroy the rendering context for a window and free all associated textures.
--
--     This should be called before destroying the associated window.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateRenderer'
--
--     [C declaration]: @SDL_DestroyRenderer@, defined at @SDL3\/SDL_render.h 2650:34@
sDL_DestroyRenderer
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO ()
sDL_DestroyRenderer = hs_bindgen_1473f45c80ad6575

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_FlushRenderer@
foreign import ccall unsafe "hs_bindgen_78e89be71892a1e6"
  hs_bindgen_78e89be71892a1e6_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_FlushRenderer@
hs_bindgen_78e89be71892a1e6
  :: BG.Ptr SDL_Renderer
  -> IO BG.CBool
hs_bindgen_78e89be71892a1e6 =
  BG.fromFFIType hs_bindgen_78e89be71892a1e6_base

-- | Force the rendering context to flush any pending commands and state.
--
--     You do not need to (and in fact, shouldn\'t) call this function unless you are planning to call into OpenGL\/Direct3D\/Metal\/whatever directly, in addition to using an 'SDL_Renderer'.
--
--     This is for a very-specific case: if you are using SDL\'s render API, and you plan to make OpenGL\/D3D\/whatever calls in addition to SDL render API calls. If this applies, you should call this function between calls to SDL\'s render API and the low-level API you\'re using in cooperation.
--
--     In all other cases, you can ignore this function.
--
--     This call makes SDL flush any pending rendering work it was queueing up to do later in a single batch, and marks any internal cached state as invalid, so it\'ll prepare all its state again later, from scratch.
--
--     This means you do not need to save state in your rendering code to protect the SDL renderer. However, there lots of arbitrary pieces of Direct3D and OpenGL state that can confuse things; you should use your best judgment and be prepared to make changes if specific state needs to be protected.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_FlushRenderer@, defined at @SDL3\/SDL_render.h 2683:34@
sDL_FlushRenderer
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO BG.CBool
sDL_FlushRenderer = hs_bindgen_78e89be71892a1e6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderMetalLayer@
foreign import ccall unsafe "hs_bindgen_47416f026ca1192f"
  hs_bindgen_47416f026ca1192f_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderMetalLayer@
hs_bindgen_47416f026ca1192f
  :: BG.Ptr SDL_Renderer
  -> IO (BG.Ptr BG.Void)
hs_bindgen_47416f026ca1192f =
  BG.fromFFIType hs_bindgen_47416f026ca1192f_base

-- | Get the CAMetalLayer associated with the given Metal renderer.
--
--     This function returns @void *@, so SDL doesn\'t have to include Metal\'s headers, but it can be safely cast to a @CAMetalLayer *@.
--
--     [Returns]: a @CAMetalLayer *@ on success, or NULL if the renderer isn\'t a Metal renderer.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderMetalCommandEncoder'
--
--     [C declaration]: @SDL_GetRenderMetalLayer@, defined at @SDL3\/SDL_render.h 2701:36@
sDL_GetRenderMetalLayer
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to query.
  -> IO (BG.Ptr BG.Void)
sDL_GetRenderMetalLayer = hs_bindgen_47416f026ca1192f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderMetalCommandEncoder@
foreign import ccall unsafe "hs_bindgen_c2e3411ac19d746f"
  hs_bindgen_c2e3411ac19d746f_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderMetalCommandEncoder@
hs_bindgen_c2e3411ac19d746f
  :: BG.Ptr SDL_Renderer
  -> IO (BG.Ptr BG.Void)
hs_bindgen_c2e3411ac19d746f =
  BG.fromFFIType hs_bindgen_c2e3411ac19d746f_base

-- | Get the Metal command encoder for the current frame.
--
--     This function returns @void *@, so SDL doesn\'t have to include Metal\'s headers, but it can be safely cast to an @id\<MTLRenderCommandEncoder>@.
--
--     This will return NULL if Metal refuses to give SDL a drawable to render to, which might happen if the window is hidden\/minimized\/offscreen. This doesn\'t apply to command encoders for render targets, just the window\'s backbuffer. Check your return values!
--
--     [Returns]: an @id\<MTLRenderCommandEncoder>@ on success, or NULL if the renderer isn\'t a Metal renderer or there was an error.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderMetalLayer'
--
--     [C declaration]: @SDL_GetRenderMetalCommandEncoder@, defined at @SDL3\/SDL_render.h 2724:36@
sDL_GetRenderMetalCommandEncoder
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to query.
  -> IO (BG.Ptr BG.Void)
sDL_GetRenderMetalCommandEncoder =
  hs_bindgen_c2e3411ac19d746f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_AddVulkanRenderSemaphores@
foreign import ccall unsafe "hs_bindgen_98b03ff5afd62e07"
  hs_bindgen_98b03ff5afd62e07_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Int64
    -> BG.Int64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_AddVulkanRenderSemaphores@
hs_bindgen_98b03ff5afd62e07
  :: BG.Ptr SDL_Renderer
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -> IO BG.CBool
hs_bindgen_98b03ff5afd62e07 =
  BG.fromFFIType hs_bindgen_98b03ff5afd62e07_base

-- | Add a set of synchronization semaphores for the current frame.
--
--     The Vulkan renderer will wait for @wait_semaphore@ before submitting rendering commands and signal @signal_semaphore@ after rendering commands are complete for this frame.
--
--     This should be called each frame that you want semaphore synchronization. The Vulkan renderer may have multiple frames in flight on the GPU, so you should have multiple semaphores that are used for synchronization. Querying SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER will give you the maximum number of semaphores you\'ll need.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is __NOT__ safe to call this function from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_AddVulkanRenderSemaphores@, defined at @SDL3\/SDL_render.h 2755:34@
sDL_AddVulkanRenderSemaphores
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@wait_stage_mask@]: the VkPipelineStageFlags for the wait.
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@wait_semaphore@]: a VkSempahore to wait on before rendering the current frame, or 0 if not needed.
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@signal_semaphore@]: a VkSempahore that SDL will signal when rendering for the current frame is complete, or 0 if not needed.
  -> IO BG.CBool
sDL_AddVulkanRenderSemaphores =
  hs_bindgen_98b03ff5afd62e07

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderVSync@
foreign import ccall unsafe "hs_bindgen_529493ee355e9466"
  hs_bindgen_529493ee355e9466_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetRenderVSync@
hs_bindgen_529493ee355e9466
  :: BG.Ptr SDL_Renderer
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_529493ee355e9466 =
  BG.fromFFIType hs_bindgen_529493ee355e9466_base

-- | Toggle VSync of the given renderer.
--
--     When a renderer is created, vsync defaults to SDL_RENDERER_VSYNC_DISABLED.
--
--     The @vsync@ parameter can be 1 to synchronize present with every vertical refresh, 2 to synchronize present with every second vertical refresh, etc., SDL_RENDERER_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or SDL_RENDERER_VSYNC_DISABLED to disable. Not every value is supported by every driver, so you should check the return value to see whether the requested setting is supported.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRenderVSync'
--
--     [C declaration]: @SDL_SetRenderVSync@, defined at @SDL3\/SDL_render.h 2780:34@
sDL_SetRenderVSync
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to toggle.
  -> BG.CInt
  -- ^
  --
  --           [@vsync@]: the vertical refresh sync interval.
  -> IO BG.CBool
sDL_SetRenderVSync = hs_bindgen_529493ee355e9466

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderVSync@
foreign import ccall unsafe "hs_bindgen_ff41dba2a623c0ab"
  hs_bindgen_ff41dba2a623c0ab_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetRenderVSync@
hs_bindgen_ff41dba2a623c0ab
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_ff41dba2a623c0ab =
  BG.fromFFIType hs_bindgen_ff41dba2a623c0ab_base

-- | Get VSync of the given renderer.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetRenderVSync'
--
--     [C declaration]: @SDL_GetRenderVSync@, defined at @SDL3\/SDL_render.h 2800:34@
sDL_GetRenderVSync
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to toggle.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@vsync@]: an int filled with the current vertical refresh sync interval. See @SDL_SetRenderVSync()@ for the meaning of the value.
  -> IO BG.CBool
sDL_GetRenderVSync = hs_bindgen_ff41dba2a623c0ab

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderDebugText@
foreign import ccall unsafe "hs_bindgen_a60ea3ca32fd26a5"
  hs_bindgen_a60ea3ca32fd26a5_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_RenderDebugText@
hs_bindgen_a60ea3ca32fd26a5
  :: BG.Ptr SDL_Renderer
  -> BG.CFloat
  -> BG.CFloat
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_a60ea3ca32fd26a5 =
  BG.fromFFIType hs_bindgen_a60ea3ca32fd26a5_base

-- | Draw debug text to an 'SDL_Renderer'.
--
--     This function will render a string of text to an 'SDL_Renderer'. Note that this is a convenience function for debugging, with severe limitations, and not intended to be used for production apps and games.
--
--     Among these limitations:
--
--     * It accepts UTF-8 strings, but will only renders ASCII characters.
--
--     * It has a single, tiny size (8x8 pixels). You can use logical presentation or @SDL_SetRenderScale()@ to adjust it.
--
--     * It uses a simple, hardcoded bitmap font. It does not allow different font selections and it does not support truetype, for proper scaling.
--
--     * It does no word-wrapping and does not treat newline characters as a line break. If the text goes out of the window, it\'s gone.
--
--     For serious text rendering, there are several good options, such as SDL_ttf, stb_truetype, or other external libraries.
--
--     On first use, this will create an internal texture for rendering glyphs. This texture will live until the renderer is destroyed.
--
--     The text is drawn in the color specified by @SDL_SetRenderDrawColor()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_RenderDebugTextFormat@, 'sDL_DEBUG_TEXT_FONT_CHARACTER_SIZE'
--
--     [C declaration]: @SDL_RenderDebugText@, defined at @SDL3\/SDL_render.h 2852:34@
sDL_RenderDebugText
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a line of text.
  -> BG.CFloat
  -- ^
  --
  --           [@x@]: the x coordinate where the top-left corner of the text will draw.
  -> BG.CFloat
  -- ^
  --
  --           [@y@]: the y coordinate where the top-left corner of the text will draw.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to render.
  -> IO BG.CBool
sDL_RenderDebugText = hs_bindgen_a60ea3ca32fd26a5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetDefaultTextureScaleMode@
foreign import ccall unsafe "hs_bindgen_e0aee38e1b73b64f"
  hs_bindgen_e0aee38e1b73b64f_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetDefaultTextureScaleMode@
hs_bindgen_e0aee38e1b73b64f
  :: BG.Ptr SDL_Renderer
  -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -> IO BG.CBool
hs_bindgen_e0aee38e1b73b64f =
  BG.fromFFIType hs_bindgen_e0aee38e1b73b64f_base

-- | Set default scale mode for new textures for given renderer.
--
--     When a renderer is created, scale_mode defaults to SDL_SCALEMODE_LINEAR.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_GetDefaultTextureScaleMode'
--
--     [C declaration]: @SDL_SetDefaultTextureScaleMode@, defined at @SDL3\/SDL_render.h 2898:34@
sDL_SetDefaultTextureScaleMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to update.
  -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scale_mode@]: the scale mode to change to for new textures.
  -> IO BG.CBool
sDL_SetDefaultTextureScaleMode =
  hs_bindgen_e0aee38e1b73b64f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetDefaultTextureScaleMode@
foreign import ccall unsafe "hs_bindgen_51c8f91a397184cb"
  hs_bindgen_51c8f91a397184cb_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_GetDefaultTextureScaleMode@
hs_bindgen_51c8f91a397184cb
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -> IO BG.CBool
hs_bindgen_51c8f91a397184cb =
  BG.fromFFIType hs_bindgen_51c8f91a397184cb_base

-- | Get default texture scale mode of the given renderer.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_SetDefaultTextureScaleMode'
--
--     [C declaration]: @SDL_GetDefaultTextureScaleMode@, defined at @SDL3\/SDL_render.h 2916:34@
sDL_GetDefaultTextureScaleMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to get data from.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scale_mode@]: a SDL_ScaleMode filled with current default scale mode. See @SDL_SetDefaultTextureScaleMode()@ for the meaning of the value.
  -> IO BG.CBool
sDL_GetDefaultTextureScaleMode =
  hs_bindgen_51c8f91a397184cb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateGPURenderState@
foreign import ccall unsafe "hs_bindgen_2d970ffb5a76b1e4"
  hs_bindgen_2d970ffb5a76b1e4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_CreateGPURenderState@
hs_bindgen_2d970ffb5a76b1e4
  :: BG.Ptr SDL_Renderer
  -> PtrConst.PtrConst SDL_GPURenderStateCreateInfo
  -> IO (BG.Ptr SDL_GPURenderState)
hs_bindgen_2d970ffb5a76b1e4 =
  BG.fromFFIType hs_bindgen_2d970ffb5a76b1e4_base

-- | Create custom GPU render state.
--
--     [Returns]: a custom GPU render state or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_SetGPURenderStateFragmentUniforms', 'sDL_SetGPURenderState', 'sDL_DestroyGPURenderState'
--
--     [C declaration]: @SDL_CreateGPURenderState@, defined at @SDL3\/SDL_render.h 2970:50@
sDL_CreateGPURenderState
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to use.
  -> PtrConst.PtrConst SDL_GPURenderStateCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the GPU render state to create.
  -> IO (BG.Ptr SDL_GPURenderState)
sDL_CreateGPURenderState =
  hs_bindgen_2d970ffb5a76b1e4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetGPURenderStateFragmentUniforms@
foreign import ccall unsafe "hs_bindgen_312b275c9f55463c"
  hs_bindgen_312b275c9f55463c_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetGPURenderStateFragmentUniforms@
hs_bindgen_312b275c9f55463c
  :: BG.Ptr SDL_GPURenderState
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst BG.Void
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_312b275c9f55463c =
  BG.fromFFIType hs_bindgen_312b275c9f55463c_base

-- | Set fragment shader uniform variables in a custom GPU render state.
--
--     The data is copied and will be pushed using SDL_PushGPUFragmentUniformData() during draw call execution.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetGPURenderStateFragmentUniforms@, defined at @SDL3\/SDL_render.h 2990:34@
sDL_SetGPURenderStateFragmentUniforms
  :: BG.Ptr SDL_GPURenderState
  -- ^
  --
  --           [@state@]: the state to modify.
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
  -> IO BG.CBool
sDL_SetGPURenderStateFragmentUniforms =
  hs_bindgen_312b275c9f55463c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetGPURenderState@
foreign import ccall unsafe "hs_bindgen_0d6949c161acc59d"
  hs_bindgen_0d6949c161acc59d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_SetGPURenderState@
hs_bindgen_0d6949c161acc59d
  :: BG.Ptr SDL_Renderer
  -> BG.Ptr SDL_GPURenderState
  -> IO BG.CBool
hs_bindgen_0d6949c161acc59d =
  BG.fromFFIType hs_bindgen_0d6949c161acc59d_base

-- | Set custom GPU render state.
--
--     This function sets custom GPU render state for subsequent draw calls. This allows using custom shaders with the GPU renderer.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetGPURenderState@, defined at @SDL3\/SDL_render.h 3008:34@
sDL_SetGPURenderState
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to use.
  -> BG.Ptr SDL_GPURenderState
  -- ^
  --
  --           [@state@]: the state to to use, or NULL to clear custom GPU render state.
  -> IO BG.CBool
sDL_SetGPURenderState = hs_bindgen_0d6949c161acc59d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_DestroyGPURenderState@
foreign import ccall unsafe "hs_bindgen_eccc60d637069ae8"
  hs_bindgen_eccc60d637069ae8_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_Unsafe_SDL_DestroyGPURenderState@
hs_bindgen_eccc60d637069ae8
  :: BG.Ptr SDL_GPURenderState
  -> IO ()
hs_bindgen_eccc60d637069ae8 =
  BG.fromFFIType hs_bindgen_eccc60d637069ae8_base

-- | Destroy custom GPU render state.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_CreateGPURenderState'
--
--     [C declaration]: @SDL_DestroyGPURenderState@, defined at @SDL3\/SDL_render.h 3022:34@
sDL_DestroyGPURenderState
  :: BG.Ptr SDL_GPURenderState
  -- ^
  --
  --           [@state@]: the state to destroy.
  -> IO ()
sDL_DestroyGPURenderState =
  hs_bindgen_eccc60d637069ae8
