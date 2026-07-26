{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Render.FunPtr (
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetNumRenderDrivers,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderDriver,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_CreateWindowAndRenderer,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_CreateRenderer,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_CreateRendererWithProperties,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_CreateGPURenderer,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetGPURendererDevice,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_CreateSoftwareRenderer,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderer,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderWindow,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRendererName,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRendererProperties,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderOutputSize,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetCurrentRenderOutputSize,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_CreateTexture,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_CreateTextureFromSurface,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_CreateTextureWithProperties,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetTextureProperties,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRendererFromTexture,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetTextureSize,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetTexturePalette,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetTexturePalette,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetTextureColorMod,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetTextureColorModFloat,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetTextureColorMod,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetTextureColorModFloat,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetTextureAlphaMod,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetTextureAlphaModFloat,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetTextureAlphaMod,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetTextureAlphaModFloat,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetTextureBlendMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetTextureBlendMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetTextureScaleMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetTextureScaleMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_UpdateTexture,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_UpdateYUVTexture,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_UpdateNVTexture,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_LockTexture,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_LockTextureToSurface,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_UnlockTexture,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderTarget,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderTarget,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderLogicalPresentation,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderLogicalPresentation,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderLogicalPresentationRect,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderCoordinatesFromWindow,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderCoordinatesToWindow,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_ConvertEventToRenderCoordinates,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderViewport,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderViewport,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderViewportSet,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderSafeArea,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderClipRect,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderClipRect,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderClipEnabled,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderScale,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderScale,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderDrawColor,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderDrawColorFloat,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderDrawColor,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderDrawColorFloat,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderColorScale,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderColorScale,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderDrawBlendMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderDrawBlendMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderClear,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderPoint,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderPoints,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderLine,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderLines,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderRect,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderRects,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderFillRect,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderFillRects,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderTexture,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderTextureRotated,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderTextureAffine,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderTextureTiled,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderTexture9Grid,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderTexture9GridTiled,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderGeometry,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderGeometryRaw,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderTextureAddressMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderTextureAddressMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderReadPixels,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderPresent,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_DestroyTexture,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_DestroyRenderer,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_FlushRenderer,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderMetalLayer,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderMetalCommandEncoder,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_AddVulkanRenderSemaphores,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetRenderVSync,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetRenderVSync,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_RenderDebugText,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetDefaultTextureScaleMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_GetDefaultTextureScaleMode,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_CreateGPURenderState,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetGPURenderStateFragmentUniforms,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_SetGPURenderState,
  SDL3.Sys.Bindgen.Render.FunPtr.sDL_DestroyGPURenderState,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetNumRenderDrivers */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_39ae05adee57681c (void)) (void)"
         , "{"
         , "  return &SDL_GetNumRenderDrivers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDriver */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_5a6cb27af6f3e59c (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRenderDriver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateWindowAndRenderer */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a1e969ca8147cb88 (void)) ("
         , "  char const *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  SDL_WindowFlags arg4,"
         , "  SDL_Window **arg5,"
         , "  SDL_Renderer **arg6"
         , ")"
         , "{"
         , "  return &SDL_CreateWindowAndRenderer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateRenderer */"
         , "__attribute__ ((const))"
         , "SDL_Renderer *(*hs_bindgen_4f8c6f9ab79b5444 (void)) ("
         , "  SDL_Window *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateRenderer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateRendererWithProperties */"
         , "__attribute__ ((const))"
         , "SDL_Renderer *(*hs_bindgen_2136cfcab6da3c79 (void)) ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateRendererWithProperties;"
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateGPURenderer */"
         , "__attribute__ ((const))"
         , "SDL_Renderer *(*hs_bindgen_90489326b8919b3c (void)) ("
         , "  SDL_GPUDevice *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_CreateGPURenderer;"
         , "#else"
         , "  SDL_SetError(\"SDL_CreateGPURenderer requires SDL >= 3.4.0\"); return 0;"
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetGPURendererDevice */"
         , "__attribute__ ((const))"
         , "SDL_GPUDevice *(*hs_bindgen_63bae05a63e0c033 (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetGPURendererDevice;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetGPURendererDevice requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateSoftwareRenderer */"
         , "__attribute__ ((const))"
         , "SDL_Renderer *(*hs_bindgen_89305e9fc1bdb81a (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateSoftwareRenderer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderer */"
         , "__attribute__ ((const))"
         , "SDL_Renderer *(*hs_bindgen_8899be36c3b2acbb (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRenderer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderWindow */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_d23f46fa0cff05e9 (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRenderWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRendererName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_c60e6d89b68b688d (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRendererName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRendererProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_e8064380d0ff11a4 (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRendererProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderOutputSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d78ee833847e3e9c (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetRenderOutputSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetCurrentRenderOutputSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_99478979fa574c65 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetCurrentRenderOutputSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateTexture */"
         , "__attribute__ ((const))"
         , "SDL_Texture *(*hs_bindgen_4f8be95c455bb5f0 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_PixelFormat arg2,"
         , "  SDL_TextureAccess arg3,"
         , "  signed int arg4,"
         , "  signed int arg5"
         , ")"
         , "{"
         , "  return &SDL_CreateTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateTextureFromSurface */"
         , "__attribute__ ((const))"
         , "SDL_Texture *(*hs_bindgen_d3a341064bd4c6fd (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateTextureFromSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateTextureWithProperties */"
         , "__attribute__ ((const))"
         , "SDL_Texture *(*hs_bindgen_36ee6a46f451b373 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_PropertiesID arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateTextureWithProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_becfaa2a4bff800b (void)) ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTextureProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRendererFromTexture */"
         , "__attribute__ ((const))"
         , "SDL_Renderer *(*hs_bindgen_49dcd52c4c1d2b81 (void)) ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRendererFromTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_41cc657b23107c65 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  float *arg2,"
         , "  float *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetTextureSize;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTexturePalette */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2681f128241fbe43 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Palette *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SetTexturePalette;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetTexturePalette requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTexturePalette */"
         , "__attribute__ ((const))"
         , "SDL_Palette *(*hs_bindgen_5b5998bf3bb63e26 (void)) ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetTexturePalette;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetTexturePalette requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureColorMod */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_12df54216376e2f6 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return &SDL_SetTextureColorMod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureColorModFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c199819113902151 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float arg4"
         , ")"
         , "{"
         , "  return &SDL_SetTextureColorModFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureColorMod */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_42ffa79ca220e7c4 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  Uint8 *arg2,"
         , "  Uint8 *arg3,"
         , "  Uint8 *arg4"
         , ")"
         , "{"
         , "  return &SDL_GetTextureColorMod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureColorModFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c18cd7bc6e616874 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  float *arg2,"
         , "  float *arg3,"
         , "  float *arg4"
         , ")"
         , "{"
         , "  return &SDL_GetTextureColorModFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureAlphaMod */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_206ed15266a6abc6 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  Uint8 arg2"
         , ")"
         , "{"
         , "  return &SDL_SetTextureAlphaMod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureAlphaModFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_497b70cfcdb285b3 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_SetTextureAlphaModFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureAlphaMod */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_328f278f9cc361c9 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  Uint8 *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetTextureAlphaMod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureAlphaModFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_00ee88c364b7b54b (void)) ("
         , "  SDL_Texture *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetTextureAlphaModFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureBlendMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8b3403b14f9cc34f (void)) ("
         , "  SDL_Texture *arg1,"
         , "  SDL_BlendMode arg2"
         , ")"
         , "{"
         , "  return &SDL_SetTextureBlendMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureBlendMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e63bcb75e534a9b1 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  SDL_BlendMode *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetTextureBlendMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureScaleMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b562cc4d76d8ed23 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  SDL_ScaleMode arg2"
         , ")"
         , "{"
         , "  return &SDL_SetTextureScaleMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureScaleMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_01d80174738edcf8 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  SDL_ScaleMode *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetTextureScaleMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UpdateTexture */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ed82660a3a2952a3 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  void const *arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return &SDL_UpdateTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UpdateYUVTexture */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ccf06645aeb6e433 (void)) ("
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
         , "  return &SDL_UpdateYUVTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UpdateNVTexture */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_25fc8b2ffc040564 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  Uint8 const *arg3,"
         , "  signed int arg4,"
         , "  Uint8 const *arg5,"
         , "  signed int arg6"
         , ")"
         , "{"
         , "  return &SDL_UpdateNVTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_LockTexture */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b2515cb3b400f701 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  void **arg3,"
         , "  signed int *arg4"
         , ")"
         , "{"
         , "  return &SDL_LockTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_LockTextureToSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_232feaed95772158 (void)) ("
         , "  SDL_Texture *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface **arg3"
         , ")"
         , "{"
         , "  return &SDL_LockTextureToSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UnlockTexture */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_13908e9a60424294 (void)) ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "  return &SDL_UnlockTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderTarget */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_bf0b26dd5575e7f4 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetRenderTarget;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderTarget */"
         , "__attribute__ ((const))"
         , "SDL_Texture *(*hs_bindgen_1e8b9f67ad2f60e0 (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRenderTarget;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderLogicalPresentation */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1034cb11879afccd (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  SDL_RendererLogicalPresentation arg4"
         , ")"
         , "{"
         , "  return &SDL_SetRenderLogicalPresentation;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderLogicalPresentation */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d91c953c563a7c79 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3,"
         , "  SDL_RendererLogicalPresentation *arg4"
         , ")"
         , "{"
         , "  return &SDL_GetRenderLogicalPresentation;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderLogicalPresentationRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_79882ebc0cf55c2f (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetRenderLogicalPresentationRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderCoordinatesFromWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fb7241e246ca7baf (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float *arg4,"
         , "  float *arg5"
         , ")"
         , "{"
         , "  return &SDL_RenderCoordinatesFromWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderCoordinatesToWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c7cc17f4dc614c4c (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float *arg4,"
         , "  float *arg5"
         , ")"
         , "{"
         , "  return &SDL_RenderCoordinatesToWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_ConvertEventToRenderCoordinates */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e37a0e30c32b51de (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Event *arg2"
         , ")"
         , "{"
         , "  return &SDL_ConvertEventToRenderCoordinates;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderViewport */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_787c931cd9718282 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetRenderViewport;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderViewport */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6aa5d786da4df5f2 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetRenderViewport;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderViewportSet */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9ea268631b7b5e5b (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_RenderViewportSet;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderSafeArea */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_892008c6b673220b (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetRenderSafeArea;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderClipRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3aa3a1e497542ee8 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetRenderClipRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderClipRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_bec026baef17d1f2 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetRenderClipRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderClipEnabled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b0a5efaab13d3303 (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_RenderClipEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderScale */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_938869c5ff233e71 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return &SDL_SetRenderScale;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderScale */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fa6a48d0e427bd48 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float *arg2,"
         , "  float *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetRenderScale;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderDrawColor */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_cfcf753e753a9e88 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5"
         , ")"
         , "{"
         , "  return &SDL_SetRenderDrawColor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderDrawColorFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_99e499f38f3c9dc7 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float arg4,"
         , "  float arg5"
         , ")"
         , "{"
         , "  return &SDL_SetRenderDrawColorFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDrawColor */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c88d83e47700901b (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  Uint8 *arg2,"
         , "  Uint8 *arg3,"
         , "  Uint8 *arg4,"
         , "  Uint8 *arg5"
         , ")"
         , "{"
         , "  return &SDL_GetRenderDrawColor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDrawColorFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d1473916ef27e20f (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float *arg2,"
         , "  float *arg3,"
         , "  float *arg4,"
         , "  float *arg5"
         , ")"
         , "{"
         , "  return &SDL_GetRenderDrawColorFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderColorScale */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_35d6252a1c594c7c (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_SetRenderColorScale;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderColorScale */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_77d1cf7afcbd4164 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetRenderColorScale;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderDrawBlendMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_820f982c1cc61a34 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_BlendMode arg2"
         , ")"
         , "{"
         , "  return &SDL_SetRenderDrawBlendMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDrawBlendMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1409781aca259b0a (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_BlendMode *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetRenderDrawBlendMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderClear */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9a11c0e709a2af5e (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_RenderClear;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderPoint */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_429122691f4ce0fc (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return &SDL_RenderPoint;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderPoints */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b884f579966e5db6 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FPoint const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_RenderPoints;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderLine */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ce6fb863b8b65fe2 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float arg4,"
         , "  float arg5"
         , ")"
         , "{"
         , "  return &SDL_RenderLine;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderLines */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f3578aa8a36fe364 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FPoint const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_RenderLines;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_dc6b0741f1d79bee (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_RenderRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderRects */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d697f94bacf56e0d (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_RenderRects;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderFillRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a730fe81c75d4472 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_RenderFillRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderFillRects */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4cd330b36839141b (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_FRect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_RenderFillRects;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTexture */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1f27c13075574257 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  SDL_FRect const *arg4"
         , ")"
         , "{"
         , "  return &SDL_RenderTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTextureRotated */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3424943af047de83 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  SDL_FRect const *arg4,"
         , "  double arg5,"
         , "  SDL_FPoint const *arg6,"
         , "  SDL_FlipMode arg7"
         , ")"
         , "{"
         , "  return &SDL_RenderTextureRotated;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTextureAffine */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_dd59e212bf7d116f (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  SDL_FPoint const *arg4,"
         , "  SDL_FPoint const *arg5,"
         , "  SDL_FPoint const *arg6"
         , ")"
         , "{"
         , "  return &SDL_RenderTextureAffine;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTextureTiled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6cf4fce9a372af75 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_FRect const *arg3,"
         , "  float arg4,"
         , "  SDL_FRect const *arg5"
         , ")"
         , "{"
         , "  return &SDL_RenderTextureTiled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTexture9Grid */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_78cecf599cdec7c5 (void)) ("
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
         , "  return &SDL_RenderTexture9Grid;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTexture9GridTiled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1b23a5c925e888fb (void)) ("
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
         , "  return &SDL_RenderTexture9GridTiled;"
         , "#else"
         , "  SDL_SetError(\"SDL_RenderTexture9GridTiled requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderGeometry */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_dc26aec86b6b43fe (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Texture *arg2,"
         , "  SDL_Vertex const *arg3,"
         , "  signed int arg4,"
         , "  signed int const *arg5,"
         , "  signed int arg6"
         , ")"
         , "{"
         , "  return &SDL_RenderGeometry;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderGeometryRaw */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1e06910d8288533e (void)) ("
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
         , "  return &SDL_RenderGeometryRaw;"
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderTextureAddressMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_35802c1bb0921c28 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_TextureAddressMode arg2,"
         , "  SDL_TextureAddressMode arg3"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SetRenderTextureAddressMode;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetRenderTextureAddressMode requires SDL >= 3.4.0\"); return 0;"
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderTextureAddressMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_649128c959cdb236 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_TextureAddressMode *arg2,"
         , "  SDL_TextureAddressMode *arg3"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetRenderTextureAddressMode;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetRenderTextureAddressMode requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderReadPixels */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_b087b184be493118 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_RenderReadPixels;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderPresent */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2bafff2cb8bebc00 (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_RenderPresent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_DestroyTexture */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_4497bf4e9bdd42b9 (void)) ("
         , "  SDL_Texture *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyTexture;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_DestroyRenderer */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_011b10f177cafc47 (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyRenderer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_FlushRenderer */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_0ee776d39090d2fd (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_FlushRenderer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderMetalLayer */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_f52f9cb5238155f3 (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRenderMetalLayer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderMetalCommandEncoder */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_0e330f87af225f8b (void)) ("
         , "  SDL_Renderer *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetRenderMetalCommandEncoder;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_AddVulkanRenderSemaphores */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3aaeda31b2a532b0 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  Uint32 arg2,"
         , "  Sint64 arg3,"
         , "  Sint64 arg4"
         , ")"
         , "{"
         , "  return &SDL_AddVulkanRenderSemaphores;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderVSync */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_964c717567cbb3b7 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_SetRenderVSync;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderVSync */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ea48e8e1fe227495 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetRenderVSync;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderDebugText */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_30bc1d75e73ca06a (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  char const *arg4"
         , ")"
         , "{"
         , "  return &SDL_RenderDebugText;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetDefaultTextureScaleMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7118410bfe83a316 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_ScaleMode arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SetDefaultTextureScaleMode;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetDefaultTextureScaleMode requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetDefaultTextureScaleMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_51156f5e8dd42d03 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_ScaleMode *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetDefaultTextureScaleMode;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetDefaultTextureScaleMode requires SDL >= 3.4.0\"); return 0;"
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateGPURenderState */"
         , "__attribute__ ((const))"
         , "SDL_GPURenderState *(*hs_bindgen_c77515a1f877dab2 (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_GPURenderStateCreateInfo const *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_CreateGPURenderState;"
         , "#else"
         , "  SDL_SetError(\"SDL_CreateGPURenderState requires SDL >= 3.4.0\"); return 0;"
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetGPURenderStateFragmentUniforms */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_65c1c07e7c4876a6 (void)) ("
         , "  SDL_GPURenderState *arg1,"
         , "  Uint32 arg2,"
         , "  void const *arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SetGPURenderStateFragmentUniforms;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetGPURenderStateFragmentUniforms requires SDL >= 3.4.0\"); return 0;"
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetGPURenderState */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_440f7dac948d9e3d (void)) ("
         , "  SDL_Renderer *arg1,"
         , "  SDL_GPURenderState *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SetGPURenderState;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetGPURenderState requires SDL >= 3.4.0\"); return 0;"
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_DestroyGPURenderState */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_dc4da5de025a8ba9 (void)) ("
         , "  SDL_GPURenderState *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_DestroyGPURenderState;"
         , "#else"
         , "  SDL_SetError(\"SDL_DestroyGPURenderState requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetNumRenderDrivers@
foreign import ccall unsafe "hs_bindgen_39ae05adee57681c"
  hs_bindgen_39ae05adee57681c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetNumRenderDrivers@
hs_bindgen_39ae05adee57681c :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_39ae05adee57681c =
  BG.fromFFIType hs_bindgen_39ae05adee57681c_base

{-# NOINLINE sDL_GetNumRenderDrivers #-}

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
sDL_GetNumRenderDrivers :: BG.FunPtr (IO BG.CInt)
sDL_GetNumRenderDrivers =
  BG.unsafePerformIO hs_bindgen_39ae05adee57681c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDriver@
foreign import ccall unsafe "hs_bindgen_5a6cb27af6f3e59c"
  hs_bindgen_5a6cb27af6f3e59c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDriver@
hs_bindgen_5a6cb27af6f3e59c :: IO (BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_5a6cb27af6f3e59c =
  BG.fromFFIType hs_bindgen_5a6cb27af6f3e59c_base

{-# NOINLINE sDL_GetRenderDriver #-}

-- | Use this function to get the name of a built in 2D rendering driver.
--
--     The list of rendering drivers is given in the order that they are normally initialized by default; the drivers that seem more reasonable to choose first (as far as the SDL developers believe) are earlier in the list.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"opengl\", \"direct3d12\" or \"metal\". These never have Unicode characters, and are not meant to be proper names.
--
--     [@index@]: the index of the rendering driver; the value ranges from 0 to @SDL_GetNumRenderDrivers()@ - 1.
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
sDL_GetRenderDriver :: BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetRenderDriver =
  BG.unsafePerformIO hs_bindgen_5a6cb27af6f3e59c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateWindowAndRenderer@
foreign import ccall unsafe "hs_bindgen_a1e969ca8147cb88"
  hs_bindgen_a1e969ca8147cb88_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateWindowAndRenderer@
hs_bindgen_a1e969ca8147cb88
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> BG.CInt
             -> BG.CInt
             -> SDL3.Sys.Bindgen.Video.SDL_WindowFlags
             -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
             -> BG.Ptr (BG.Ptr SDL_Renderer)
             -> IO BG.CBool
           )
       )
hs_bindgen_a1e969ca8147cb88 =
  BG.fromFFIType hs_bindgen_a1e969ca8147cb88_base

{-# NOINLINE sDL_CreateWindowAndRenderer #-}

-- | Create a window and default renderer.
--
--     [@title@]: the title of the window, in UTF-8 encoding.
--
--     [@width@]: the width of the window.
--
--     [@height@]: the height of the window.
--
--     [@window_flags@]: the flags used to create the window (see SDL_CreateWindow()).
--
--     [@window@]: a pointer filled with the window, or NULL on error.
--
--     [@renderer@]: a pointer filled with the renderer, or NULL on error.
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
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> BG.CInt
         -> BG.CInt
         -> SDL3.Sys.Bindgen.Video.SDL_WindowFlags
         -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
         -> BG.Ptr (BG.Ptr SDL_Renderer)
         -> IO BG.CBool
       )
sDL_CreateWindowAndRenderer =
  BG.unsafePerformIO hs_bindgen_a1e969ca8147cb88

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateRenderer@
foreign import ccall unsafe "hs_bindgen_4f8c6f9ab79b5444"
  hs_bindgen_4f8c6f9ab79b5444_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateRenderer@
hs_bindgen_4f8c6f9ab79b5444
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Renderer))
       )
hs_bindgen_4f8c6f9ab79b5444 =
  BG.fromFFIType hs_bindgen_4f8c6f9ab79b5444_base

{-# NOINLINE sDL_CreateRenderer #-}

-- | Create a 2D rendering context for a window.
--
--     If you want a specific renderer, you can specify its name here. A list of available renderers can be obtained by calling @SDL_GetRenderDriver()@ multiple times, with indices from 0 to @SDL_GetNumRenderDrivers()@ -1. If you don\'t need a specific renderer, specify NULL and SDL will attempt to choose the best option for you, based on what is available on the user\'s system.
--
--     If @name@ is a comma-separated list, SDL will try each name, in the order listed, until one succeeds or all of them fail.
--
--     By default the rendering size matches the window size in pixels, but you can call @SDL_SetRenderLogicalPresentation()@ to change the content size and scaling options.
--
--     [@window@]: the window where rendering is displayed.
--
--     [@name@]: the name of the rendering driver to initialize, or NULL to let SDL choose one.
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
  :: BG.FunPtr
       (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Renderer))
sDL_CreateRenderer =
  BG.unsafePerformIO hs_bindgen_4f8c6f9ab79b5444

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateRendererWithProperties@
foreign import ccall unsafe "hs_bindgen_2136cfcab6da3c79"
  hs_bindgen_2136cfcab6da3c79_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateRendererWithProperties@
hs_bindgen_2136cfcab6da3c79
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_Renderer)))
hs_bindgen_2136cfcab6da3c79 =
  BG.fromFFIType hs_bindgen_2136cfcab6da3c79_base

{-# NOINLINE sDL_CreateRendererWithProperties #-}

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
--     [@props@]: the properties to use.
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
  :: BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_Renderer))
sDL_CreateRendererWithProperties =
  BG.unsafePerformIO hs_bindgen_2136cfcab6da3c79

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateGPURenderer@
foreign import ccall unsafe "hs_bindgen_90489326b8919b3c"
  hs_bindgen_90489326b8919b3c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateGPURenderer@
hs_bindgen_90489326b8919b3c
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice
             -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> IO (BG.Ptr SDL_Renderer)
           )
       )
hs_bindgen_90489326b8919b3c =
  BG.fromFFIType hs_bindgen_90489326b8919b3c_base

{-# NOINLINE sDL_CreateGPURenderer #-}

-- | Create a 2D GPU rendering context.
--
--     The GPU device to use is passed in as a parameter. If this is NULL, then a device will be created normally and can be retrieved using @SDL_GetGPURendererDevice()@.
--
--     The window to use is passed in as a parameter. If this is NULL, then this will become an offscreen renderer. In that case, you should call @SDL_SetRenderTarget()@ to setup rendering to a texture, and then call @SDL_RenderPresent()@ normally to complete drawing a frame.
--
--     [@device@]: the GPU device to use with the renderer, or NULL to create a device.
--
--     [@window@]: the window where rendering is displayed, or NULL to create an offscreen renderer.
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
  :: BG.FunPtr
       ( BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice
         -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> IO (BG.Ptr SDL_Renderer)
       )
sDL_CreateGPURenderer =
  BG.unsafePerformIO hs_bindgen_90489326b8919b3c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetGPURendererDevice@
foreign import ccall unsafe "hs_bindgen_63bae05a63e0c033"
  hs_bindgen_63bae05a63e0c033_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetGPURendererDevice@
hs_bindgen_63bae05a63e0c033
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice)))
hs_bindgen_63bae05a63e0c033 =
  BG.fromFFIType hs_bindgen_63bae05a63e0c033_base

{-# NOINLINE sDL_GetGPURendererDevice #-}

-- | Return the GPU device used by a renderer.
--
--     [@renderer@]: the rendering context.
--
--     [Returns]: the GPU device used by the renderer, or NULL if the renderer is not a GPU renderer; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetGPURendererDevice@, defined at @SDL3\/SDL_render.h 400:45@
sDL_GetGPURendererDevice
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice))
sDL_GetGPURendererDevice =
  BG.unsafePerformIO hs_bindgen_63bae05a63e0c033

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateSoftwareRenderer@
foreign import ccall unsafe "hs_bindgen_89305e9fc1bdb81a"
  hs_bindgen_89305e9fc1bdb81a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateSoftwareRenderer@
hs_bindgen_89305e9fc1bdb81a
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO (BG.Ptr SDL_Renderer)))
hs_bindgen_89305e9fc1bdb81a =
  BG.fromFFIType hs_bindgen_89305e9fc1bdb81a_base

{-# NOINLINE sDL_CreateSoftwareRenderer #-}

-- | Create a 2D software rendering context for a surface.
--
--     Two other API which can be used to create 'SDL_Renderer': @SDL_CreateRenderer()@ and @SDL_CreateWindowAndRenderer()@. These can /also/ create a software renderer, but they are intended to be used with an SDL_Window as the final destination and not an SDL_Surface.
--
--     [@surface@]: the SDL_Surface structure representing the surface where rendering is done.
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
  :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO (BG.Ptr SDL_Renderer))
sDL_CreateSoftwareRenderer =
  BG.unsafePerformIO hs_bindgen_89305e9fc1bdb81a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderer@
foreign import ccall unsafe "hs_bindgen_8899be36c3b2acbb"
  hs_bindgen_8899be36c3b2acbb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderer@
hs_bindgen_8899be36c3b2acbb
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO (BG.Ptr SDL_Renderer)))
hs_bindgen_8899be36c3b2acbb =
  BG.fromFFIType hs_bindgen_8899be36c3b2acbb_base

{-# NOINLINE sDL_GetRenderer #-}

-- | Get the renderer associated with a window.
--
--     [@window@]: the window to query.
--
--     [Returns]: the rendering context on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRenderer@, defined at @SDL3\/SDL_render.h 434:44@
sDL_GetRenderer :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO (BG.Ptr SDL_Renderer))
sDL_GetRenderer =
  BG.unsafePerformIO hs_bindgen_8899be36c3b2acbb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderWindow@
foreign import ccall unsafe "hs_bindgen_d23f46fa0cff05e9"
  hs_bindgen_d23f46fa0cff05e9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderWindow@
hs_bindgen_d23f46fa0cff05e9
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)))
hs_bindgen_d23f46fa0cff05e9 =
  BG.fromFFIType hs_bindgen_d23f46fa0cff05e9_base

{-# NOINLINE sDL_GetRenderWindow #-}

-- | Get the window associated with a renderer.
--
--     [@renderer@]: the renderer to query.
--
--     [Returns]: the window on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRenderWindow@, defined at @SDL3\/SDL_render.h 447:42@
sDL_GetRenderWindow
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window))
sDL_GetRenderWindow =
  BG.unsafePerformIO hs_bindgen_d23f46fa0cff05e9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRendererName@
foreign import ccall unsafe "hs_bindgen_c60e6d89b68b688d"
  hs_bindgen_c60e6d89b68b688d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRendererName@
hs_bindgen_c60e6d89b68b688d
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_c60e6d89b68b688d =
  BG.fromFFIType hs_bindgen_c60e6d89b68b688d_base

{-# NOINLINE sDL_GetRendererName #-}

-- | Get the name of a renderer.
--
--     [@renderer@]: the rendering context.
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
sDL_GetRendererName :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetRendererName =
  BG.unsafePerformIO hs_bindgen_c60e6d89b68b688d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRendererProperties@
foreign import ccall unsafe "hs_bindgen_e8064380d0ff11a4"
  hs_bindgen_e8064380d0ff11a4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRendererProperties@
hs_bindgen_e8064380d0ff11a4
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_e8064380d0ff11a4 =
  BG.fromFFIType hs_bindgen_e8064380d0ff11a4_base

{-# NOINLINE sDL_GetRendererProperties #-}

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
--     [@renderer@]: the rendering context.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRendererProperties@, defined at @SDL3\/SDL_render.h 551:46@
sDL_GetRendererProperties
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetRendererProperties =
  BG.unsafePerformIO hs_bindgen_e8064380d0ff11a4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderOutputSize@
foreign import ccall unsafe "hs_bindgen_d78ee833847e3e9c"
  hs_bindgen_d78ee833847e3e9c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderOutputSize@
hs_bindgen_d78ee833847e3e9c
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_d78ee833847e3e9c =
  BG.fromFFIType hs_bindgen_d78ee833847e3e9c_base

{-# NOINLINE sDL_GetRenderOutputSize #-}

-- | Get the output size in pixels of a rendering context.
--
--     This returns the true output size in pixels, ignoring any render targets or logical size and presentation.
--
--     For the output size of the current rendering target, with logical size adjustments, use @SDL_GetCurrentRenderOutputSize()@ instead.
--
--     [@renderer@]: the rendering context.
--
--     [@w@]: a pointer filled in with the width in pixels.
--
--     [@h@]: a pointer filled in with the height in pixels.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetRenderOutputSize =
  BG.unsafePerformIO hs_bindgen_d78ee833847e3e9c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetCurrentRenderOutputSize@
foreign import ccall unsafe "hs_bindgen_99478979fa574c65"
  hs_bindgen_99478979fa574c65_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetCurrentRenderOutputSize@
hs_bindgen_99478979fa574c65
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_99478979fa574c65 =
  BG.fromFFIType hs_bindgen_99478979fa574c65_base

{-# NOINLINE sDL_GetCurrentRenderOutputSize #-}

-- | Get the current output size in pixels of a rendering context.
--
--     If a rendering target is active, this will return the size of the rendering target in pixels, otherwise return the value of @SDL_GetRenderOutputSize()@.
--
--     Rendering target or not, the output will be adjusted by the current logical presentation state, dictated by @SDL_SetRenderLogicalPresentation()@.
--
--     [@renderer@]: the rendering context.
--
--     [@w@]: a pointer filled in with the current width.
--
--     [@h@]: a pointer filled in with the current height.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetCurrentRenderOutputSize =
  BG.unsafePerformIO hs_bindgen_99478979fa574c65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateTexture@
foreign import ccall unsafe "hs_bindgen_4f8be95c455bb5f0"
  hs_bindgen_4f8be95c455bb5f0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateTexture@
hs_bindgen_4f8be95c455bb5f0
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
             -> SDL_TextureAccess
             -> BG.CInt
             -> BG.CInt
             -> IO (BG.Ptr SDL_Texture)
           )
       )
hs_bindgen_4f8be95c455bb5f0 =
  BG.fromFFIType hs_bindgen_4f8be95c455bb5f0_base

{-# NOINLINE sDL_CreateTexture #-}

-- | Create a texture for a rendering context.
--
--     The contents of a texture when first created are not defined.
--
--     [@renderer@]: the rendering context.
--
--     [@format@]: one of the enumerated values in SDL_PixelFormat.
--
--     [@access@]: one of the enumerated values in 'SDL_TextureAccess'.
--
--     [@w@]: the width of the texture in pixels.
--
--     [@h@]: the height of the texture in pixels.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
         -> SDL_TextureAccess
         -> BG.CInt
         -> BG.CInt
         -> IO (BG.Ptr SDL_Texture)
       )
sDL_CreateTexture =
  BG.unsafePerformIO hs_bindgen_4f8be95c455bb5f0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateTextureFromSurface@
foreign import ccall unsafe "hs_bindgen_d3a341064bd4c6fd"
  hs_bindgen_d3a341064bd4c6fd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateTextureFromSurface@
hs_bindgen_d3a341064bd4c6fd
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO (BG.Ptr SDL_Texture))
       )
hs_bindgen_d3a341064bd4c6fd =
  BG.fromFFIType hs_bindgen_d3a341064bd4c6fd_base

{-# NOINLINE sDL_CreateTextureFromSurface #-}

-- | Create a texture from an existing surface.
--
--     The surface is not modified or freed by this function.
--
--     The 'SDL_TextureAccess' hint for the created texture is @SDL_TEXTUREACCESS_STATIC@.
--
--     The pixel format of the created texture may be different from the pixel format of the surface, and can be queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
--
--     [@renderer@]: the rendering context.
--
--     [@surface@]: the SDL_Surface structure containing pixel data used to fill the texture.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO (BG.Ptr SDL_Texture))
sDL_CreateTextureFromSurface =
  BG.unsafePerformIO hs_bindgen_d3a341064bd4c6fd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateTextureWithProperties@
foreign import ccall unsafe "hs_bindgen_36ee6a46f451b373"
  hs_bindgen_36ee6a46f451b373_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateTextureWithProperties@
hs_bindgen_36ee6a46f451b373
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_Texture))
       )
hs_bindgen_36ee6a46f451b373 =
  BG.fromFFIType hs_bindgen_36ee6a46f451b373_base

{-# NOINLINE sDL_CreateTextureWithProperties #-}

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
--     [@renderer@]: the rendering context.
--
--     [@props@]: the properties to use.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_Texture))
sDL_CreateTextureWithProperties =
  BG.unsafePerformIO hs_bindgen_36ee6a46f451b373

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureProperties@
foreign import ccall unsafe "hs_bindgen_becfaa2a4bff800b"
  hs_bindgen_becfaa2a4bff800b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureProperties@
hs_bindgen_becfaa2a4bff800b
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_becfaa2a4bff800b =
  BG.fromFFIType hs_bindgen_becfaa2a4bff800b_base

{-# NOINLINE sDL_GetTextureProperties #-}

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
--     [@texture@]: the texture to query.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTextureProperties@, defined at @SDL3\/SDL_render.h 935:46@
sDL_GetTextureProperties
  :: BG.FunPtr (BG.Ptr SDL_Texture -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetTextureProperties =
  BG.unsafePerformIO hs_bindgen_becfaa2a4bff800b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRendererFromTexture@
foreign import ccall unsafe "hs_bindgen_49dcd52c4c1d2b81"
  hs_bindgen_49dcd52c4c1d2b81_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRendererFromTexture@
hs_bindgen_49dcd52c4c1d2b81 :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> IO (BG.Ptr SDL_Renderer)))
hs_bindgen_49dcd52c4c1d2b81 =
  BG.fromFFIType hs_bindgen_49dcd52c4c1d2b81_base

{-# NOINLINE sDL_GetRendererFromTexture #-}

-- | Get the renderer that created an 'SDL_Texture'.
--
--     [@texture@]: the texture to query.
--
--     [Returns]: a pointer to the 'SDL_Renderer' that created the texture, or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRendererFromTexture@, defined at @SDL3\/SDL_render.h 979:44@
sDL_GetRendererFromTexture :: BG.FunPtr (BG.Ptr SDL_Texture -> IO (BG.Ptr SDL_Renderer))
sDL_GetRendererFromTexture =
  BG.unsafePerformIO hs_bindgen_49dcd52c4c1d2b81

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureSize@
foreign import ccall unsafe "hs_bindgen_41cc657b23107c65"
  hs_bindgen_41cc657b23107c65_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureSize@
hs_bindgen_41cc657b23107c65
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool))
hs_bindgen_41cc657b23107c65 =
  BG.fromFFIType hs_bindgen_41cc657b23107c65_base

{-# NOINLINE sDL_GetTextureSize #-}

-- | Get the size of a texture, as floating point values.
--
--     [@texture@]: the texture to query.
--
--     [@w@]: a pointer filled in with the width of the texture in pixels. This argument can be NULL if you don\'t need this information.
--
--     [@h@]: a pointer filled in with the height of the texture in pixels. This argument can be NULL if you don\'t need this information.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetTextureSize@, defined at @SDL3\/SDL_render.h 996:34@
sDL_GetTextureSize
  :: BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool)
sDL_GetTextureSize =
  BG.unsafePerformIO hs_bindgen_41cc657b23107c65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTexturePalette@
foreign import ccall unsafe "hs_bindgen_2681f128241fbe43"
  hs_bindgen_2681f128241fbe43_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTexturePalette@
hs_bindgen_2681f128241fbe43
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette -> IO BG.CBool))
hs_bindgen_2681f128241fbe43 =
  BG.fromFFIType hs_bindgen_2681f128241fbe43_base

{-# NOINLINE sDL_SetTexturePalette #-}

-- | Set the palette used by a texture.
--
--     Setting the palette keeps an internal reference to the palette, which can be safely destroyed afterwards.
--
--     A single palette can be shared with many textures.
--
--     [@texture@]: the texture to update.
--
--     [@palette@]: the SDL_Palette structure to use.
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
  :: BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette -> IO BG.CBool)
sDL_SetTexturePalette =
  BG.unsafePerformIO hs_bindgen_2681f128241fbe43

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTexturePalette@
foreign import ccall unsafe "hs_bindgen_5b5998bf3bb63e26"
  hs_bindgen_5b5998bf3bb63e26_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTexturePalette@
hs_bindgen_5b5998bf3bb63e26
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)))
hs_bindgen_5b5998bf3bb63e26 =
  BG.fromFFIType hs_bindgen_5b5998bf3bb63e26_base

{-# NOINLINE sDL_GetTexturePalette #-}

-- | Get the palette used by a texture.
--
--     [@texture@]: the texture to query.
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
  :: BG.FunPtr (BG.Ptr SDL_Texture -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette))
sDL_GetTexturePalette =
  BG.unsafePerformIO hs_bindgen_5b5998bf3bb63e26

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureColorMod@
foreign import ccall unsafe "hs_bindgen_12df54216376e2f6"
  hs_bindgen_12df54216376e2f6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureColorMod@
hs_bindgen_12df54216376e2f6
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Texture
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_12df54216376e2f6 =
  BG.fromFFIType hs_bindgen_12df54216376e2f6_base

{-# NOINLINE sDL_SetTextureColorMod #-}

-- | Set an additional color value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * (color \/ 255)@
--
--     Color modulation is not always supported by the renderer; it will return false if color modulation is not supported.
--
--     [@texture@]: the texture to update.
--
--     [@r@]: the red color value multiplied into copy operations.
--
--     [@g@]: the green color value multiplied into copy operations.
--
--     [@b@]: the blue color value multiplied into copy operations.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Texture
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_SetTextureColorMod =
  BG.unsafePerformIO hs_bindgen_12df54216376e2f6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureColorModFloat@
foreign import ccall unsafe "hs_bindgen_c199819113902151"
  hs_bindgen_c199819113902151_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureColorModFloat@
hs_bindgen_c199819113902151
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> BG.CFloat -> BG.CFloat -> BG.CFloat -> IO BG.CBool))
hs_bindgen_c199819113902151 =
  BG.fromFFIType hs_bindgen_c199819113902151_base

{-# NOINLINE sDL_SetTextureColorModFloat #-}

-- | Set an additional color value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * color@
--
--     Color modulation is not always supported by the renderer; it will return false if color modulation is not supported.
--
--     [@texture@]: the texture to update.
--
--     [@r@]: the red color value multiplied into copy operations.
--
--     [@g@]: the green color value multiplied into copy operations.
--
--     [@b@]: the blue color value multiplied into copy operations.
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
  :: BG.FunPtr (BG.Ptr SDL_Texture -> BG.CFloat -> BG.CFloat -> BG.CFloat -> IO BG.CBool)
sDL_SetTextureColorModFloat =
  BG.unsafePerformIO hs_bindgen_c199819113902151

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureColorMod@
foreign import ccall unsafe "hs_bindgen_42ffa79ca220e7c4"
  hs_bindgen_42ffa79ca220e7c4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureColorMod@
hs_bindgen_42ffa79ca220e7c4
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Texture
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_42ffa79ca220e7c4 =
  BG.fromFFIType hs_bindgen_42ffa79ca220e7c4_base

{-# NOINLINE sDL_GetTextureColorMod #-}

-- | Get the additional color value multiplied into render copy operations.
--
--     [@texture@]: the texture to query.
--
--     [@r@]: a pointer filled in with the current red color value.
--
--     [@g@]: a pointer filled in with the current green color value.
--
--     [@b@]: a pointer filled in with the current blue color value.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Texture
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_GetTextureColorMod =
  BG.unsafePerformIO hs_bindgen_42ffa79ca220e7c4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureColorModFloat@
foreign import ccall unsafe "hs_bindgen_c18cd7bc6e616874"
  hs_bindgen_c18cd7bc6e616874_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureColorModFloat@
hs_bindgen_c18cd7bc6e616874
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Texture -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool)
       )
hs_bindgen_c18cd7bc6e616874 =
  BG.fromFFIType hs_bindgen_c18cd7bc6e616874_base

{-# NOINLINE sDL_GetTextureColorModFloat #-}

-- | Get the additional color value multiplied into render copy operations.
--
--     [@texture@]: the texture to query.
--
--     [@r@]: a pointer filled in with the current red color value.
--
--     [@g@]: a pointer filled in with the current green color value.
--
--     [@b@]: a pointer filled in with the current blue color value.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Texture -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool)
sDL_GetTextureColorModFloat =
  BG.unsafePerformIO hs_bindgen_c18cd7bc6e616874

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureAlphaMod@
foreign import ccall unsafe "hs_bindgen_206ed15266a6abc6"
  hs_bindgen_206ed15266a6abc6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureAlphaMod@
hs_bindgen_206ed15266a6abc6
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool))
hs_bindgen_206ed15266a6abc6 =
  BG.fromFFIType hs_bindgen_206ed15266a6abc6_base

{-# NOINLINE sDL_SetTextureAlphaMod #-}

-- | Set an additional alpha value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * (alpha \/ 255)@
--
--     Alpha modulation is not always supported by the renderer; it will return false if alpha modulation is not supported.
--
--     [@texture@]: the texture to update.
--
--     [@alpha@]: the source alpha value multiplied into copy operations.
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
  :: BG.FunPtr (BG.Ptr SDL_Texture -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool)
sDL_SetTextureAlphaMod =
  BG.unsafePerformIO hs_bindgen_206ed15266a6abc6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureAlphaModFloat@
foreign import ccall unsafe "hs_bindgen_497b70cfcdb285b3"
  hs_bindgen_497b70cfcdb285b3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureAlphaModFloat@
hs_bindgen_497b70cfcdb285b3 :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> BG.CFloat -> IO BG.CBool))
hs_bindgen_497b70cfcdb285b3 =
  BG.fromFFIType hs_bindgen_497b70cfcdb285b3_base

{-# NOINLINE sDL_SetTextureAlphaModFloat #-}

-- | Set an additional alpha value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * alpha@
--
--     Alpha modulation is not always supported by the renderer; it will return false if alpha modulation is not supported.
--
--     [@texture@]: the texture to update.
--
--     [@alpha@]: the source alpha value multiplied into copy operations.
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
sDL_SetTextureAlphaModFloat :: BG.FunPtr (BG.Ptr SDL_Texture -> BG.CFloat -> IO BG.CBool)
sDL_SetTextureAlphaModFloat =
  BG.unsafePerformIO hs_bindgen_497b70cfcdb285b3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureAlphaMod@
foreign import ccall unsafe "hs_bindgen_328f278f9cc361c9"
  hs_bindgen_328f278f9cc361c9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureAlphaMod@
hs_bindgen_328f278f9cc361c9
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool))
hs_bindgen_328f278f9cc361c9 =
  BG.fromFFIType hs_bindgen_328f278f9cc361c9_base

{-# NOINLINE sDL_GetTextureAlphaMod #-}

-- | Get the additional alpha value multiplied into render copy operations.
--
--     [@texture@]: the texture to query.
--
--     [@alpha@]: a pointer filled in with the current alpha value.
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
  :: BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool)
sDL_GetTextureAlphaMod =
  BG.unsafePerformIO hs_bindgen_328f278f9cc361c9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureAlphaModFloat@
foreign import ccall unsafe "hs_bindgen_00ee88c364b7b54b"
  hs_bindgen_00ee88c364b7b54b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureAlphaModFloat@
hs_bindgen_00ee88c364b7b54b
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr BG.CFloat -> IO BG.CBool))
hs_bindgen_00ee88c364b7b54b =
  BG.fromFFIType hs_bindgen_00ee88c364b7b54b_base

{-# NOINLINE sDL_GetTextureAlphaModFloat #-}

-- | Get the additional alpha value multiplied into render copy operations.
--
--     [@texture@]: the texture to query.
--
--     [@alpha@]: a pointer filled in with the current alpha value.
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
sDL_GetTextureAlphaModFloat :: BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr BG.CFloat -> IO BG.CBool)
sDL_GetTextureAlphaModFloat =
  BG.unsafePerformIO hs_bindgen_00ee88c364b7b54b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureBlendMode@
foreign import ccall unsafe "hs_bindgen_8b3403b14f9cc34f"
  hs_bindgen_8b3403b14f9cc34f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureBlendMode@
hs_bindgen_8b3403b14f9cc34f
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool))
hs_bindgen_8b3403b14f9cc34f =
  BG.fromFFIType hs_bindgen_8b3403b14f9cc34f_base

{-# NOINLINE sDL_SetTextureBlendMode #-}

-- | Set the blend mode for a texture, used by @SDL_RenderTexture()@.
--
--     If the blend mode is not supported, the closest supported mode is chosen and this function returns false.
--
--     [@texture@]: the texture to update.
--
--     [@blendMode@]: the SDL_BlendMode to use for texture blending.
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
  :: BG.FunPtr (BG.Ptr SDL_Texture -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool)
sDL_SetTextureBlendMode =
  BG.unsafePerformIO hs_bindgen_8b3403b14f9cc34f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureBlendMode@
foreign import ccall unsafe "hs_bindgen_e63bcb75e534a9b1"
  hs_bindgen_e63bcb75e534a9b1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureBlendMode@
hs_bindgen_e63bcb75e534a9b1
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool))
hs_bindgen_e63bcb75e534a9b1 =
  BG.fromFFIType hs_bindgen_e63bcb75e534a9b1_base

{-# NOINLINE sDL_GetTextureBlendMode #-}

-- | Get the blend mode used for texture copy operations.
--
--     [@texture@]: the texture to query.
--
--     [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
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
  :: BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool)
sDL_GetTextureBlendMode =
  BG.unsafePerformIO hs_bindgen_e63bcb75e534a9b1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureScaleMode@
foreign import ccall unsafe "hs_bindgen_b562cc4d76d8ed23"
  hs_bindgen_b562cc4d76d8ed23_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetTextureScaleMode@
hs_bindgen_b562cc4d76d8ed23
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode -> IO BG.CBool))
hs_bindgen_b562cc4d76d8ed23 =
  BG.fromFFIType hs_bindgen_b562cc4d76d8ed23_base

{-# NOINLINE sDL_SetTextureScaleMode #-}

-- | Set the scale mode used for texture scale operations.
--
--     The default texture scale mode is SDL_SCALEMODE_LINEAR.
--
--     If the scale mode is not supported, the closest supported mode is chosen.
--
--     [@texture@]: the texture to update.
--
--     [@scaleMode@]: the SDL_ScaleMode to use for texture scaling.
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
  :: BG.FunPtr (BG.Ptr SDL_Texture -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode -> IO BG.CBool)
sDL_SetTextureScaleMode =
  BG.unsafePerformIO hs_bindgen_b562cc4d76d8ed23

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureScaleMode@
foreign import ccall unsafe "hs_bindgen_01d80174738edcf8"
  hs_bindgen_01d80174738edcf8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetTextureScaleMode@
hs_bindgen_01d80174738edcf8
  :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode -> IO BG.CBool))
hs_bindgen_01d80174738edcf8 =
  BG.fromFFIType hs_bindgen_01d80174738edcf8_base

{-# NOINLINE sDL_GetTextureScaleMode #-}

-- | Get the scale mode used for texture scale operations.
--
--     [@texture@]: the texture to query.
--
--     [@scaleMode@]: a pointer filled in with the current scale mode.
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
  :: BG.FunPtr (BG.Ptr SDL_Texture -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode -> IO BG.CBool)
sDL_GetTextureScaleMode =
  BG.unsafePerformIO hs_bindgen_01d80174738edcf8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UpdateTexture@
foreign import ccall unsafe "hs_bindgen_ed82660a3a2952a3"
  hs_bindgen_ed82660a3a2952a3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UpdateTexture@
hs_bindgen_ed82660a3a2952a3
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> PtrConst.PtrConst BG.Void
             -> BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_ed82660a3a2952a3 =
  BG.fromFFIType hs_bindgen_ed82660a3a2952a3_base

{-# NOINLINE sDL_UpdateTexture #-}

-- | Update the given texture rectangle with new pixel data.
--
--     The pixel data must be in the pixel format of the texture, which can be queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
--
--     This is a fairly slow function, intended for use with static textures that do not change often.
--
--     If the texture is intended to be updated often, it is preferred to create the texture as streaming and use the locking functions referenced below. While this function will work with streaming textures, for optimization reasons you may not get the pixels back if you lock the texture afterward.
--
--     [@texture@]: the texture to update.
--
--     [@rect@]: an SDL_Rect structure representing the area to update, or NULL to update the entire texture.
--
--     [@pixels@]: the raw pixel data in the format of the texture.
--
--     [@pitch@]: the number of bytes in a row of pixel data, including padding between lines.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> PtrConst.PtrConst BG.Void
         -> BG.CInt
         -> IO BG.CBool
       )
sDL_UpdateTexture =
  BG.unsafePerformIO hs_bindgen_ed82660a3a2952a3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UpdateYUVTexture@
foreign import ccall unsafe "hs_bindgen_ccf06645aeb6e433"
  hs_bindgen_ccf06645aeb6e433_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UpdateYUVTexture@
hs_bindgen_ccf06645aeb6e433
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.CInt
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.CInt
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_ccf06645aeb6e433 =
  BG.fromFFIType hs_bindgen_ccf06645aeb6e433_base

{-# NOINLINE sDL_UpdateYUVTexture #-}

-- | Update a rectangle within a planar YV12 or IYUV texture with new pixel data.
--
--     You can use @SDL_UpdateTexture()@ as long as your pixel data is a contiguous block of Y and U\/V planes in the proper order, but this function is available if your pixel data is not contiguous.
--
--     [@texture@]: the texture to update.
--
--     [@rect@]: a pointer to the rectangle of pixels to update, or NULL to update the entire texture.
--
--     [@Yplane@]: the raw pixel data for the Y plane.
--
--     [@Ypitch@]: the number of bytes between rows of pixel data for the Y plane.
--
--     [@Uplane@]: the raw pixel data for the U plane.
--
--     [@Upitch@]: the number of bytes between rows of pixel data for the U plane.
--
--     [@Vplane@]: the raw pixel data for the V plane.
--
--     [@Vpitch@]: the number of bytes between rows of pixel data for the V plane.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.CInt
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.CInt
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.CInt
         -> IO BG.CBool
       )
sDL_UpdateYUVTexture =
  BG.unsafePerformIO hs_bindgen_ccf06645aeb6e433

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UpdateNVTexture@
foreign import ccall unsafe "hs_bindgen_25fc8b2ffc040564"
  hs_bindgen_25fc8b2ffc040564_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UpdateNVTexture@
hs_bindgen_25fc8b2ffc040564
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.CInt
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_25fc8b2ffc040564 =
  BG.fromFFIType hs_bindgen_25fc8b2ffc040564_base

{-# NOINLINE sDL_UpdateNVTexture #-}

-- | Update a rectangle within a planar NV12 or NV21 texture with new pixels.
--
--     You can use @SDL_UpdateTexture()@ as long as your pixel data is a contiguous block of NV12\/21 planes in the proper order, but this function is available if your pixel data is not contiguous.
--
--     [@texture@]: the texture to update.
--
--     [@rect@]: a pointer to the rectangle of pixels to update, or NULL to update the entire texture.
--
--     [@Yplane@]: the raw pixel data for the Y plane.
--
--     [@Ypitch@]: the number of bytes between rows of pixel data for the Y plane.
--
--     [@UVplane@]: the raw pixel data for the UV plane.
--
--     [@UVpitch@]: the number of bytes between rows of pixel data for the UV plane.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.CInt
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.CInt
         -> IO BG.CBool
       )
sDL_UpdateNVTexture =
  BG.unsafePerformIO hs_bindgen_25fc8b2ffc040564

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_LockTexture@
foreign import ccall unsafe "hs_bindgen_b2515cb3b400f701"
  hs_bindgen_b2515cb3b400f701_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_LockTexture@
hs_bindgen_b2515cb3b400f701
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.Ptr (BG.Ptr BG.Void)
             -> BG.Ptr BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_b2515cb3b400f701 =
  BG.fromFFIType hs_bindgen_b2515cb3b400f701_base

{-# NOINLINE sDL_LockTexture #-}

-- | Lock a portion of the texture for __write-only__ pixel access.
--
--     As an optimization, the pixels made available for editing don\'t necessarily contain the old texture data. This is a write-only operation, and if you need to keep a copy of the texture data you should do that at the application level.
--
--     You must use @SDL_UnlockTexture()@ to unlock the pixels and apply any changes.
--
--     [@texture@]: the texture to lock for access, which was created with @SDL_TEXTUREACCESS_STREAMING@.
--
--     [@rect@]: an SDL_Rect structure representing the area to lock for access; NULL to lock the entire texture.
--
--     [@pixels@]: this is filled in with a pointer to the locked pixels, appropriately offset by the locked area.
--
--     [@pitch@]: this is filled in with the pitch of the locked pixels; the pitch is the length of one row in bytes.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.Ptr (BG.Ptr BG.Void)
         -> BG.Ptr BG.CInt
         -> IO BG.CBool
       )
sDL_LockTexture =
  BG.unsafePerformIO hs_bindgen_b2515cb3b400f701

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_LockTextureToSurface@
foreign import ccall unsafe "hs_bindgen_232feaed95772158"
  hs_bindgen_232feaed95772158_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_LockTextureToSurface@
hs_bindgen_232feaed95772158
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
             -> IO BG.CBool
           )
       )
hs_bindgen_232feaed95772158 =
  BG.fromFFIType hs_bindgen_232feaed95772158_base

{-# NOINLINE sDL_LockTextureToSurface #-}

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
--     [@texture@]: the texture to lock for access, which must be created with @SDL_TEXTUREACCESS_STREAMING@.
--
--     [@rect@]: a pointer to the rectangle to lock for access. If the rect is NULL, the entire texture will be locked.
--
--     [@surface@]: a pointer to an SDL surface of size __rect__. Don\'t assume any specific pixel content.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
         -> IO BG.CBool
       )
sDL_LockTextureToSurface =
  BG.unsafePerformIO hs_bindgen_232feaed95772158

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UnlockTexture@
foreign import ccall unsafe "hs_bindgen_13908e9a60424294"
  hs_bindgen_13908e9a60424294_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_UnlockTexture@
hs_bindgen_13908e9a60424294 :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> IO ()))
hs_bindgen_13908e9a60424294 =
  BG.fromFFIType hs_bindgen_13908e9a60424294_base

{-# NOINLINE sDL_UnlockTexture #-}

-- | Unlock a texture, uploading the changes to video memory, if needed.
--
--     __Warning__: Please note that @SDL_LockTexture()@ is intended to be write-only; it will not guarantee the previous contents of the texture will be provided. You must fully initialize any area of a texture that you lock before unlocking it, as the pixels might otherwise be uninitialized memory.
--
--     Which is to say: locking and immediately unlocking a texture can result in corrupted textures, depending on the renderer in use.
--
--     [@texture@]: a texture locked by @SDL_LockTexture()@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockTexture'
--
--     [C declaration]: @SDL_UnlockTexture@, defined at @SDL3\/SDL_render.h 1484:34@
sDL_UnlockTexture :: BG.FunPtr (BG.Ptr SDL_Texture -> IO ())
sDL_UnlockTexture =
  BG.unsafePerformIO hs_bindgen_13908e9a60424294

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderTarget@
foreign import ccall unsafe "hs_bindgen_bf0b26dd5575e7f4"
  hs_bindgen_bf0b26dd5575e7f4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderTarget@
hs_bindgen_bf0b26dd5575e7f4
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL_Texture -> IO BG.CBool))
hs_bindgen_bf0b26dd5575e7f4 =
  BG.fromFFIType hs_bindgen_bf0b26dd5575e7f4_base

{-# NOINLINE sDL_SetRenderTarget #-}

-- | Set a texture as the current rendering target.
--
--     The default render target is the window for which the renderer was created. To stop rendering to a texture and render to the window again, call this function with a NULL @texture@.
--
--     Viewport, cliprect, scale, and logical presentation are unique to each render target. Get and set functions for these states apply to the current render target set by this function, and those states persist on each target when the current render target changes.
--
--     [@renderer@]: the rendering context.
--
--     [@texture@]: the targeted texture, which must be created with the @SDL_TEXTUREACCESS_TARGET@ flag, or NULL to render to the window instead of a texture.
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
sDL_SetRenderTarget :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL_Texture -> IO BG.CBool)
sDL_SetRenderTarget =
  BG.unsafePerformIO hs_bindgen_bf0b26dd5575e7f4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderTarget@
foreign import ccall unsafe "hs_bindgen_1e8b9f67ad2f60e0"
  hs_bindgen_1e8b9f67ad2f60e0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderTarget@
hs_bindgen_1e8b9f67ad2f60e0 :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr SDL_Texture)))
hs_bindgen_1e8b9f67ad2f60e0 =
  BG.fromFFIType hs_bindgen_1e8b9f67ad2f60e0_base

{-# NOINLINE sDL_GetRenderTarget #-}

-- | Get the current render target.
--
--     The default render target is the window for which the renderer was created, and is reported a NULL here.
--
--     [@renderer@]: the rendering context.
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
sDL_GetRenderTarget :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr SDL_Texture))
sDL_GetRenderTarget =
  BG.unsafePerformIO hs_bindgen_1e8b9f67ad2f60e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderLogicalPresentation@
foreign import ccall unsafe "hs_bindgen_1034cb11879afccd"
  hs_bindgen_1034cb11879afccd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderLogicalPresentation@
hs_bindgen_1034cb11879afccd
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> BG.CInt -> BG.CInt -> SDL_RendererLogicalPresentation -> IO BG.CBool)
       )
hs_bindgen_1034cb11879afccd =
  BG.fromFFIType hs_bindgen_1034cb11879afccd_base

{-# NOINLINE sDL_SetRenderLogicalPresentation #-}

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
--     [@renderer@]: the rendering context.
--
--     [@w@]: the width of the logical resolution.
--
--     [@h@]: the height of the logical resolution.
--
--     [@mode@]: the presentation mode used.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> BG.CInt -> BG.CInt -> SDL_RendererLogicalPresentation -> IO BG.CBool)
sDL_SetRenderLogicalPresentation =
  BG.unsafePerformIO hs_bindgen_1034cb11879afccd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderLogicalPresentation@
foreign import ccall unsafe "hs_bindgen_d91c953c563a7c79"
  hs_bindgen_d91c953c563a7c79_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderLogicalPresentation@
hs_bindgen_d91c953c563a7c79
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> BG.Ptr BG.CInt
             -> BG.Ptr BG.CInt
             -> BG.Ptr SDL_RendererLogicalPresentation
             -> IO BG.CBool
           )
       )
hs_bindgen_d91c953c563a7c79 =
  BG.fromFFIType hs_bindgen_d91c953c563a7c79_base

{-# NOINLINE sDL_GetRenderLogicalPresentation #-}

-- | Get device independent resolution and presentation mode for rendering.
--
--     This function gets the width and height of the logical rendering output, or 0 if a logical resolution is not enabled.
--
--     Each render target has its own logical presentation state. This function gets the state for the current render target.
--
--     [@renderer@]: the rendering context.
--
--     [@w@]: an int filled with the logical presentation width.
--
--     [@h@]: an int filled with the logical presentation height.
--
--     [@mode@]: a variable filled with the logical presentation mode being used.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> BG.Ptr BG.CInt
         -> BG.Ptr BG.CInt
         -> BG.Ptr SDL_RendererLogicalPresentation
         -> IO BG.CBool
       )
sDL_GetRenderLogicalPresentation =
  BG.unsafePerformIO hs_bindgen_d91c953c563a7c79

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderLogicalPresentationRect@
foreign import ccall unsafe "hs_bindgen_79882ebc0cf55c2f"
  hs_bindgen_79882ebc0cf55c2f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderLogicalPresentationRect@
hs_bindgen_79882ebc0cf55c2f
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_FRect -> IO BG.CBool))
hs_bindgen_79882ebc0cf55c2f =
  BG.fromFFIType hs_bindgen_79882ebc0cf55c2f_base

{-# NOINLINE sDL_GetRenderLogicalPresentationRect #-}

-- | Get the final presentation rectangle for rendering.
--
--     This function returns the calculated rectangle used for logical presentation, based on the presentation mode and output size. If logical presentation is disabled, it will fill the rectangle with the output size, in pixels.
--
--     Each render target has its own logical presentation state. This function gets the rectangle for the current render target.
--
--     [@renderer@]: the rendering context.
--
--     [@rect@]: a pointer filled in with the final presentation rectangle, may be NULL.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_FRect -> IO BG.CBool)
sDL_GetRenderLogicalPresentationRect =
  BG.unsafePerformIO hs_bindgen_79882ebc0cf55c2f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderCoordinatesFromWindow@
foreign import ccall unsafe "hs_bindgen_fb7241e246ca7baf"
  hs_bindgen_fb7241e246ca7baf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderCoordinatesFromWindow@
hs_bindgen_fb7241e246ca7baf
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool)
       )
hs_bindgen_fb7241e246ca7baf =
  BG.fromFFIType hs_bindgen_fb7241e246ca7baf_base

{-# NOINLINE sDL_RenderCoordinatesFromWindow #-}

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
--     [@renderer@]: the rendering context.
--
--     [@window_x@]: the x coordinate in window coordinates.
--
--     [@window_y@]: the y coordinate in window coordinates.
--
--     [@x@]: a pointer filled with the x coordinate in render coordinates.
--
--     [@y@]: a pointer filled with the y coordinate in render coordinates.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool)
sDL_RenderCoordinatesFromWindow =
  BG.unsafePerformIO hs_bindgen_fb7241e246ca7baf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderCoordinatesToWindow@
foreign import ccall unsafe "hs_bindgen_c7cc17f4dc614c4c"
  hs_bindgen_c7cc17f4dc614c4c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderCoordinatesToWindow@
hs_bindgen_c7cc17f4dc614c4c
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool)
       )
hs_bindgen_c7cc17f4dc614c4c =
  BG.fromFFIType hs_bindgen_c7cc17f4dc614c4c_base

{-# NOINLINE sDL_RenderCoordinatesToWindow #-}

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
--     [@renderer@]: the rendering context.
--
--     [@x@]: the x coordinate in render coordinates.
--
--     [@y@]: the y coordinate in render coordinates.
--
--     [@window_x@]: a pointer filled with the x coordinate in window coordinates.
--
--     [@window_y@]: a pointer filled with the y coordinate in window coordinates.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool)
sDL_RenderCoordinatesToWindow =
  BG.unsafePerformIO hs_bindgen_c7cc17f4dc614c4c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_ConvertEventToRenderCoordinates@
foreign import ccall unsafe "hs_bindgen_e37a0e30c32b51de"
  hs_bindgen_e37a0e30c32b51de_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_ConvertEventToRenderCoordinates@
hs_bindgen_e37a0e30c32b51de
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event -> IO BG.CBool))
hs_bindgen_e37a0e30c32b51de =
  BG.fromFFIType hs_bindgen_e37a0e30c32b51de_base

{-# NOINLINE sDL_ConvertEventToRenderCoordinates #-}

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
--     [@renderer@]: the rendering context.
--
--     [@event@]: the event to modify.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event -> IO BG.CBool)
sDL_ConvertEventToRenderCoordinates =
  BG.unsafePerformIO hs_bindgen_e37a0e30c32b51de

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderViewport@
foreign import ccall unsafe "hs_bindgen_787c931cd9718282"
  hs_bindgen_787c931cd9718282_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderViewport@
hs_bindgen_787c931cd9718282
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_787c931cd9718282 =
  BG.fromFFIType hs_bindgen_787c931cd9718282_base

{-# NOINLINE sDL_SetRenderViewport #-}

-- | Set the drawing area for rendering on the current target.
--
--     Drawing will clip to this area (separately from any clipping done with SDL_SetRenderClipRect), and the top left of the area will become coordinate (0, 0) for future drawing commands.
--
--     The area\'s width and height must be >= 0.
--
--     Each render target has its own viewport. This function sets the viewport for the current render target.
--
--     [@renderer@]: the rendering context.
--
--     [@rect@]: the SDL_Rect structure representing the drawing area, or NULL to set the viewport to the entire target.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_SetRenderViewport =
  BG.unsafePerformIO hs_bindgen_787c931cd9718282

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderViewport@
foreign import ccall unsafe "hs_bindgen_6aa5d786da4df5f2"
  hs_bindgen_6aa5d786da4df5f2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderViewport@
hs_bindgen_6aa5d786da4df5f2
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_6aa5d786da4df5f2 =
  BG.fromFFIType hs_bindgen_6aa5d786da4df5f2_base

{-# NOINLINE sDL_GetRenderViewport #-}

-- | Get the drawing area for the current target.
--
--     Each render target has its own viewport. This function gets the viewport for the current render target.
--
--     [@renderer@]: the rendering context.
--
--     [@rect@]: an SDL_Rect structure filled in with the current drawing area.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_GetRenderViewport =
  BG.unsafePerformIO hs_bindgen_6aa5d786da4df5f2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderViewportSet@
foreign import ccall unsafe "hs_bindgen_9ea268631b7b5e5b"
  hs_bindgen_9ea268631b7b5e5b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderViewportSet@
hs_bindgen_9ea268631b7b5e5b :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool))
hs_bindgen_9ea268631b7b5e5b =
  BG.fromFFIType hs_bindgen_9ea268631b7b5e5b_base

{-# NOINLINE sDL_RenderViewportSet #-}

-- | Return whether an explicit rectangle was set as the viewport.
--
--     This is useful if you\'re saving and restoring the viewport and want to know whether you should restore a specific rectangle or NULL.
--
--     Each render target has its own viewport. This function checks the viewport for the current render target.
--
--     [@renderer@]: the rendering context.
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
sDL_RenderViewportSet :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool)
sDL_RenderViewportSet =
  BG.unsafePerformIO hs_bindgen_9ea268631b7b5e5b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderSafeArea@
foreign import ccall unsafe "hs_bindgen_892008c6b673220b"
  hs_bindgen_892008c6b673220b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderSafeArea@
hs_bindgen_892008c6b673220b
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_892008c6b673220b =
  BG.fromFFIType hs_bindgen_892008c6b673220b_base

{-# NOINLINE sDL_GetRenderSafeArea #-}

-- | Get the safe area for rendering within the current viewport.
--
--     Some devices have portions of the screen which are partially obscured or not interactive, possibly due to on-screen controls, curved edges, camera notches, TV overscan, etc. This function provides the area of the current viewport which is safe to have interactible content. You should continue rendering into the rest of the render target, but it should not contain visually important or interactible content.
--
--     [@renderer@]: the rendering context.
--
--     [@rect@]: a pointer filled in with the area that is safe for interactive content.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetRenderSafeArea@, defined at @SDL3\/SDL_render.h 1809:34@
sDL_GetRenderSafeArea
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_GetRenderSafeArea =
  BG.unsafePerformIO hs_bindgen_892008c6b673220b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderClipRect@
foreign import ccall unsafe "hs_bindgen_3aa3a1e497542ee8"
  hs_bindgen_3aa3a1e497542ee8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderClipRect@
hs_bindgen_3aa3a1e497542ee8
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_3aa3a1e497542ee8 =
  BG.fromFFIType hs_bindgen_3aa3a1e497542ee8_base

{-# NOINLINE sDL_SetRenderClipRect #-}

-- | Set the clip rectangle for rendering on the specified target.
--
--     Each render target has its own clip rectangle. This function sets the cliprect for the current render target.
--
--     [@renderer@]: the rendering context.
--
--     [@rect@]: an SDL_Rect structure representing the clip area, relative to the viewport, or NULL to disable clipping.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_SetRenderClipRect =
  BG.unsafePerformIO hs_bindgen_3aa3a1e497542ee8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderClipRect@
foreign import ccall unsafe "hs_bindgen_bec026baef17d1f2"
  hs_bindgen_bec026baef17d1f2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderClipRect@
hs_bindgen_bec026baef17d1f2
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_bec026baef17d1f2 =
  BG.fromFFIType hs_bindgen_bec026baef17d1f2_base

{-# NOINLINE sDL_GetRenderClipRect #-}

-- | Get the clip rectangle for the current target.
--
--     Each render target has its own clip rectangle. This function gets the cliprect for the current render target.
--
--     [@renderer@]: the rendering context.
--
--     [@rect@]: an SDL_Rect structure filled in with the current clipping area or an empty rectangle if clipping is disabled.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_GetRenderClipRect =
  BG.unsafePerformIO hs_bindgen_bec026baef17d1f2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderClipEnabled@
foreign import ccall unsafe "hs_bindgen_b0a5efaab13d3303"
  hs_bindgen_b0a5efaab13d3303_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderClipEnabled@
hs_bindgen_b0a5efaab13d3303 :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool))
hs_bindgen_b0a5efaab13d3303 =
  BG.fromFFIType hs_bindgen_b0a5efaab13d3303_base

{-# NOINLINE sDL_RenderClipEnabled #-}

-- | Get whether clipping is enabled on the given render target.
--
--     Each render target has its own clip rectangle. This function checks the cliprect for the current render target.
--
--     [@renderer@]: the rendering context.
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
sDL_RenderClipEnabled :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool)
sDL_RenderClipEnabled =
  BG.unsafePerformIO hs_bindgen_b0a5efaab13d3303

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderScale@
foreign import ccall unsafe "hs_bindgen_938869c5ff233e71"
  hs_bindgen_938869c5ff233e71_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderScale@
hs_bindgen_938869c5ff233e71
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> IO BG.CBool))
hs_bindgen_938869c5ff233e71 =
  BG.fromFFIType hs_bindgen_938869c5ff233e71_base

{-# NOINLINE sDL_SetRenderScale #-}

-- | Set the drawing scale for rendering on the current target.
--
--     The drawing coordinates are scaled by the x\/y scaling factors before they are used by the renderer. This allows resolution independent drawing with a single coordinate system.
--
--     If this results in scaling or subpixel drawing by the rendering backend, it will be handled using the appropriate quality hints. For best results use integer scaling factors.
--
--     Each render target has its own scale. This function sets the scale for the current render target.
--
--     [@renderer@]: the rendering context.
--
--     [@scaleX@]: the horizontal scaling factor.
--
--     [@scaleY@]: the vertical scaling factor.
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
sDL_SetRenderScale :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> IO BG.CBool)
sDL_SetRenderScale =
  BG.unsafePerformIO hs_bindgen_938869c5ff233e71

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderScale@
foreign import ccall unsafe "hs_bindgen_fa6a48d0e427bd48"
  hs_bindgen_fa6a48d0e427bd48_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderScale@
hs_bindgen_fa6a48d0e427bd48
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool))
hs_bindgen_fa6a48d0e427bd48 =
  BG.fromFFIType hs_bindgen_fa6a48d0e427bd48_base

{-# NOINLINE sDL_GetRenderScale #-}

-- | Get the drawing scale for the current target.
--
--     Each render target has its own scale. This function gets the scale for the current render target.
--
--     [@renderer@]: the rendering context.
--
--     [@scaleX@]: a pointer filled in with the horizontal scaling factor.
--
--     [@scaleY@]: a pointer filled in with the vertical scaling factor.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool)
sDL_GetRenderScale =
  BG.unsafePerformIO hs_bindgen_fa6a48d0e427bd48

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderDrawColor@
foreign import ccall unsafe "hs_bindgen_cfcf753e753a9e88"
  hs_bindgen_cfcf753e753a9e88_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderDrawColor@
hs_bindgen_cfcf753e753a9e88
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_cfcf753e753a9e88 =
  BG.fromFFIType hs_bindgen_cfcf753e753a9e88_base

{-# NOINLINE sDL_SetRenderDrawColor #-}

-- | Set the color used for drawing operations.
--
--     Set the color for drawing or filling rectangles, lines, and points, and for @SDL_RenderClear()@.
--
--     [@renderer@]: the rendering context.
--
--     [@r@]: the red value used to draw on the rendering target.
--
--     [@g@]: the green value used to draw on the rendering target.
--
--     [@b@]: the blue value used to draw on the rendering target.
--
--     [@a@]: the alpha value used to draw on the rendering target; usually @SDL_ALPHA_OPAQUE@ (255). Use SDL_SetRenderDrawBlendMode to specify how the alpha channel is used.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_SetRenderDrawColor =
  BG.unsafePerformIO hs_bindgen_cfcf753e753a9e88

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderDrawColorFloat@
foreign import ccall unsafe "hs_bindgen_99e499f38f3c9dc7"
  hs_bindgen_99e499f38f3c9dc7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderDrawColorFloat@
hs_bindgen_99e499f38f3c9dc7
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> BG.CFloat -> BG.CFloat -> IO BG.CBool))
hs_bindgen_99e499f38f3c9dc7 =
  BG.fromFFIType hs_bindgen_99e499f38f3c9dc7_base

{-# NOINLINE sDL_SetRenderDrawColorFloat #-}

-- | Set the color used for drawing operations (Rect, Line and Clear).
--
--     Set the color for drawing or filling rectangles, lines, and points, and for @SDL_RenderClear()@.
--
--     [@renderer@]: the rendering context.
--
--     [@r@]: the red value used to draw on the rendering target.
--
--     [@g@]: the green value used to draw on the rendering target.
--
--     [@b@]: the blue value used to draw on the rendering target.
--
--     [@a@]: the alpha value used to draw on the rendering target. Use SDL_SetRenderDrawBlendMode to specify how the alpha channel is used.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> BG.CFloat -> BG.CFloat -> IO BG.CBool)
sDL_SetRenderDrawColorFloat =
  BG.unsafePerformIO hs_bindgen_99e499f38f3c9dc7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDrawColor@
foreign import ccall unsafe "hs_bindgen_c88d83e47700901b"
  hs_bindgen_c88d83e47700901b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDrawColor@
hs_bindgen_c88d83e47700901b
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_c88d83e47700901b =
  BG.fromFFIType hs_bindgen_c88d83e47700901b_base

{-# NOINLINE sDL_GetRenderDrawColor #-}

-- | Get the color used for drawing operations (Rect, Line and Clear).
--
--     [@renderer@]: the rendering context.
--
--     [@r@]: a pointer filled in with the red value used to draw on the rendering target.
--
--     [@g@]: a pointer filled in with the green value used to draw on the rendering target.
--
--     [@b@]: a pointer filled in with the blue value used to draw on the rendering target.
--
--     [@a@]: a pointer filled in with the alpha value used to draw on the rendering target; usually @SDL_ALPHA_OPAQUE@ (255).
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_GetRenderDrawColor =
  BG.unsafePerformIO hs_bindgen_c88d83e47700901b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDrawColorFloat@
foreign import ccall unsafe "hs_bindgen_d1473916ef27e20f"
  hs_bindgen_d1473916ef27e20f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDrawColorFloat@
hs_bindgen_d1473916ef27e20f
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> IO BG.CBool
           )
       )
hs_bindgen_d1473916ef27e20f =
  BG.fromFFIType hs_bindgen_d1473916ef27e20f_base

{-# NOINLINE sDL_GetRenderDrawColorFloat #-}

-- | Get the color used for drawing operations (Rect, Line and Clear).
--
--     [@renderer@]: the rendering context.
--
--     [@r@]: a pointer filled in with the red value used to draw on the rendering target.
--
--     [@g@]: a pointer filled in with the green value used to draw on the rendering target.
--
--     [@b@]: a pointer filled in with the blue value used to draw on the rendering target.
--
--     [@a@]: a pointer filled in with the alpha value used to draw on the rendering target.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> IO BG.CBool
       )
sDL_GetRenderDrawColorFloat =
  BG.unsafePerformIO hs_bindgen_d1473916ef27e20f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderColorScale@
foreign import ccall unsafe "hs_bindgen_35d6252a1c594c7c"
  hs_bindgen_35d6252a1c594c7c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderColorScale@
hs_bindgen_35d6252a1c594c7c :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> IO BG.CBool))
hs_bindgen_35d6252a1c594c7c =
  BG.fromFFIType hs_bindgen_35d6252a1c594c7c_base

{-# NOINLINE sDL_SetRenderColorScale #-}

-- | Set the color scale used for render operations.
--
--     The color scale is an additional scale multiplied into the pixel color value while rendering. This can be used to adjust the brightness of colors during HDR rendering, or changing HDR video brightness when playing on an SDR display.
--
--     The color scale does not affect the alpha channel, only the color brightness.
--
--     [@renderer@]: the rendering context.
--
--     [@scale@]: the color scale value.
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
sDL_SetRenderColorScale :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> IO BG.CBool)
sDL_SetRenderColorScale =
  BG.unsafePerformIO hs_bindgen_35d6252a1c594c7c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderColorScale@
foreign import ccall unsafe "hs_bindgen_77d1cf7afcbd4164"
  hs_bindgen_77d1cf7afcbd4164_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderColorScale@
hs_bindgen_77d1cf7afcbd4164
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CFloat -> IO BG.CBool))
hs_bindgen_77d1cf7afcbd4164 =
  BG.fromFFIType hs_bindgen_77d1cf7afcbd4164_base

{-# NOINLINE sDL_GetRenderColorScale #-}

-- | Get the color scale used for render operations.
--
--     [@renderer@]: the rendering context.
--
--     [@scale@]: a pointer filled in with the current color scale value.
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
sDL_GetRenderColorScale :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CFloat -> IO BG.CBool)
sDL_GetRenderColorScale =
  BG.unsafePerformIO hs_bindgen_77d1cf7afcbd4164

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderDrawBlendMode@
foreign import ccall unsafe "hs_bindgen_820f982c1cc61a34"
  hs_bindgen_820f982c1cc61a34_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderDrawBlendMode@
hs_bindgen_820f982c1cc61a34
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool))
hs_bindgen_820f982c1cc61a34 =
  BG.fromFFIType hs_bindgen_820f982c1cc61a34_base

{-# NOINLINE sDL_SetRenderDrawBlendMode #-}

-- | Set the blend mode used for drawing operations (Fill and Line).
--
--     If the blend mode is not supported, the closest supported mode is chosen.
--
--     [@renderer@]: the rendering context.
--
--     [@blendMode@]: the SDL_BlendMode to use for blending.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool)
sDL_SetRenderDrawBlendMode =
  BG.unsafePerformIO hs_bindgen_820f982c1cc61a34

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDrawBlendMode@
foreign import ccall unsafe "hs_bindgen_1409781aca259b0a"
  hs_bindgen_1409781aca259b0a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderDrawBlendMode@
hs_bindgen_1409781aca259b0a
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool))
hs_bindgen_1409781aca259b0a =
  BG.fromFFIType hs_bindgen_1409781aca259b0a_base

{-# NOINLINE sDL_GetRenderDrawBlendMode #-}

-- | Get the blend mode used for drawing operations.
--
--     [@renderer@]: the rendering context.
--
--     [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool)
sDL_GetRenderDrawBlendMode =
  BG.unsafePerformIO hs_bindgen_1409781aca259b0a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderClear@
foreign import ccall unsafe "hs_bindgen_9a11c0e709a2af5e"
  hs_bindgen_9a11c0e709a2af5e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderClear@
hs_bindgen_9a11c0e709a2af5e :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool))
hs_bindgen_9a11c0e709a2af5e =
  BG.fromFFIType hs_bindgen_9a11c0e709a2af5e_base

{-# NOINLINE sDL_RenderClear #-}

-- | Clear the current rendering target with the drawing color.
--
--     This function clears the entire rendering target, ignoring the viewport and the clip rectangle. Note, that clearing will also set\/fill all pixels of the rendering target to current renderer draw color, so make sure to invoke @SDL_SetRenderDrawColor()@ when needed.
--
--     [@renderer@]: the rendering context.
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
sDL_RenderClear :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool)
sDL_RenderClear =
  BG.unsafePerformIO hs_bindgen_9a11c0e709a2af5e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderPoint@
foreign import ccall unsafe "hs_bindgen_429122691f4ce0fc"
  hs_bindgen_429122691f4ce0fc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderPoint@
hs_bindgen_429122691f4ce0fc
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> IO BG.CBool))
hs_bindgen_429122691f4ce0fc =
  BG.fromFFIType hs_bindgen_429122691f4ce0fc_base

{-# NOINLINE sDL_RenderPoint #-}

-- | Draw a point on the current rendering target at subpixel precision.
--
--     [@renderer@]: the renderer which should draw a point.
--
--     [@x@]: the x coordinate of the point.
--
--     [@y@]: the y coordinate of the point.
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
sDL_RenderPoint :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> IO BG.CBool)
sDL_RenderPoint =
  BG.unsafePerformIO hs_bindgen_429122691f4ce0fc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderPoints@
foreign import ccall unsafe "hs_bindgen_b884f579966e5db6"
  hs_bindgen_b884f579966e5db6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderPoints@
hs_bindgen_b884f579966e5db6
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint -> BG.CInt -> IO BG.CBool)
       )
hs_bindgen_b884f579966e5db6 =
  BG.fromFFIType hs_bindgen_b884f579966e5db6_base

{-# NOINLINE sDL_RenderPoints #-}

-- | Draw multiple points on the current rendering target at subpixel precision.
--
--     [@renderer@]: the renderer which should draw multiple points.
--
--     [@points@]: the points to draw.
--
--     [@count@]: the number of points to draw.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint -> BG.CInt -> IO BG.CBool)
sDL_RenderPoints =
  BG.unsafePerformIO hs_bindgen_b884f579966e5db6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderLine@
foreign import ccall unsafe "hs_bindgen_ce6fb863b8b65fe2"
  hs_bindgen_ce6fb863b8b65fe2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderLine@
hs_bindgen_ce6fb863b8b65fe2
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> BG.CFloat -> BG.CFloat -> IO BG.CBool))
hs_bindgen_ce6fb863b8b65fe2 =
  BG.fromFFIType hs_bindgen_ce6fb863b8b65fe2_base

{-# NOINLINE sDL_RenderLine #-}

-- | Draw a line on the current rendering target at subpixel precision.
--
--     [@renderer@]: the renderer which should draw a line.
--
--     [@x1@]: the x coordinate of the start point.
--
--     [@y1@]: the y coordinate of the start point.
--
--     [@x2@]: the x coordinate of the end point.
--
--     [@y2@]: the y coordinate of the end point.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> BG.CFloat -> BG.CFloat -> IO BG.CBool)
sDL_RenderLine =
  BG.unsafePerformIO hs_bindgen_ce6fb863b8b65fe2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderLines@
foreign import ccall unsafe "hs_bindgen_f3578aa8a36fe364"
  hs_bindgen_f3578aa8a36fe364_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderLines@
hs_bindgen_f3578aa8a36fe364
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint -> BG.CInt -> IO BG.CBool)
       )
hs_bindgen_f3578aa8a36fe364 =
  BG.fromFFIType hs_bindgen_f3578aa8a36fe364_base

{-# NOINLINE sDL_RenderLines #-}

-- | Draw a series of connected lines on the current rendering target at subpixel precision.
--
--     [@renderer@]: the renderer which should draw multiple lines.
--
--     [@points@]: the points along the lines.
--
--     [@count@]: the number of points, drawing count-1 lines.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint -> BG.CInt -> IO BG.CBool)
sDL_RenderLines =
  BG.unsafePerformIO hs_bindgen_f3578aa8a36fe364

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderRect@
foreign import ccall unsafe "hs_bindgen_dc6b0741f1d79bee"
  hs_bindgen_dc6b0741f1d79bee_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderRect@
hs_bindgen_dc6b0741f1d79bee
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect -> IO BG.CBool))
hs_bindgen_dc6b0741f1d79bee =
  BG.fromFFIType hs_bindgen_dc6b0741f1d79bee_base

{-# NOINLINE sDL_RenderRect #-}

-- | Draw a rectangle on the current rendering target at subpixel precision.
--
--     [@renderer@]: the renderer which should draw a rectangle.
--
--     [@rect@]: a pointer to the destination rectangle, or NULL to outline the entire rendering target.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect -> IO BG.CBool)
sDL_RenderRect =
  BG.unsafePerformIO hs_bindgen_dc6b0741f1d79bee

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderRects@
foreign import ccall unsafe "hs_bindgen_d697f94bacf56e0d"
  hs_bindgen_d697f94bacf56e0d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderRects@
hs_bindgen_d697f94bacf56e0d
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect -> BG.CInt -> IO BG.CBool)
       )
hs_bindgen_d697f94bacf56e0d =
  BG.fromFFIType hs_bindgen_d697f94bacf56e0d_base

{-# NOINLINE sDL_RenderRects #-}

-- | Draw some number of rectangles on the current rendering target at subpixel precision.
--
--     [@renderer@]: the renderer which should draw multiple rectangles.
--
--     [@rects@]: a pointer to an array of destination rectangles.
--
--     [@count@]: the number of rectangles.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect -> BG.CInt -> IO BG.CBool)
sDL_RenderRects =
  BG.unsafePerformIO hs_bindgen_d697f94bacf56e0d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderFillRect@
foreign import ccall unsafe "hs_bindgen_a730fe81c75d4472"
  hs_bindgen_a730fe81c75d4472_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderFillRect@
hs_bindgen_a730fe81c75d4472
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect -> IO BG.CBool))
hs_bindgen_a730fe81c75d4472 =
  BG.fromFFIType hs_bindgen_a730fe81c75d4472_base

{-# NOINLINE sDL_RenderFillRect #-}

-- | Fill a rectangle on the current rendering target with the drawing color at subpixel precision.
--
--     [@renderer@]: the renderer which should fill a rectangle.
--
--     [@rect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect -> IO BG.CBool)
sDL_RenderFillRect =
  BG.unsafePerformIO hs_bindgen_a730fe81c75d4472

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderFillRects@
foreign import ccall unsafe "hs_bindgen_4cd330b36839141b"
  hs_bindgen_4cd330b36839141b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderFillRects@
hs_bindgen_4cd330b36839141b
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect -> BG.CInt -> IO BG.CBool)
       )
hs_bindgen_4cd330b36839141b =
  BG.fromFFIType hs_bindgen_4cd330b36839141b_base

{-# NOINLINE sDL_RenderFillRects #-}

-- | Fill some number of rectangles on the current rendering target with the drawing color at subpixel precision.
--
--     [@renderer@]: the renderer which should fill multiple rectangles.
--
--     [@rects@]: a pointer to an array of destination rectangles.
--
--     [@count@]: the number of rectangles.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect -> BG.CInt -> IO BG.CBool)
sDL_RenderFillRects =
  BG.unsafePerformIO hs_bindgen_4cd330b36839141b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTexture@
foreign import ccall unsafe "hs_bindgen_1f27c13075574257"
  hs_bindgen_1f27c13075574257_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTexture@
hs_bindgen_1f27c13075574257
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
             -> IO BG.CBool
           )
       )
hs_bindgen_1f27c13075574257 =
  BG.fromFFIType hs_bindgen_1f27c13075574257_base

{-# NOINLINE sDL_RenderTexture #-}

-- | Copy a portion of the texture to the current rendering target at subpixel precision.
--
--     [@renderer@]: the renderer which should copy parts of a texture.
--
--     [@texture@]: the source texture.
--
--     [@srcrect@]: a pointer to the source rectangle, or NULL for the entire texture.
--
--     [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
         -> IO BG.CBool
       )
sDL_RenderTexture =
  BG.unsafePerformIO hs_bindgen_1f27c13075574257

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTextureRotated@
foreign import ccall unsafe "hs_bindgen_3424943af047de83"
  hs_bindgen_3424943af047de83_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTextureRotated@
hs_bindgen_3424943af047de83
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
             -> BG.CDouble
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
             -> SDL3.Sys.Bindgen.Surface.SDL_FlipMode
             -> IO BG.CBool
           )
       )
hs_bindgen_3424943af047de83 =
  BG.fromFFIType hs_bindgen_3424943af047de83_base

{-# NOINLINE sDL_RenderTextureRotated #-}

-- | Copy a portion of the source texture to the current rendering target, with rotation and flipping, at subpixel precision.
--
--     [@renderer@]: the renderer which should copy parts of a texture.
--
--     [@texture@]: the source texture.
--
--     [@srcrect@]: a pointer to the source rectangle, or NULL for the entire texture.
--
--     [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
--
--     [@angle@]: an angle in degrees that indicates the rotation that will be applied to dstrect, rotating it in a clockwise direction.
--
--     [@center@]: a pointer to a point indicating the point around which dstrect will be rotated (if NULL, rotation will be done around dstrect.w\/2, dstrect.h\/2).
--
--     [@flip@]: an SDL_FlipMode value stating which flipping actions should be performed on the texture.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
         -> BG.CDouble
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
         -> SDL3.Sys.Bindgen.Surface.SDL_FlipMode
         -> IO BG.CBool
       )
sDL_RenderTextureRotated =
  BG.unsafePerformIO hs_bindgen_3424943af047de83

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTextureAffine@
foreign import ccall unsafe "hs_bindgen_dd59e212bf7d116f"
  hs_bindgen_dd59e212bf7d116f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTextureAffine@
hs_bindgen_dd59e212bf7d116f
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
             -> IO BG.CBool
           )
       )
hs_bindgen_dd59e212bf7d116f =
  BG.fromFFIType hs_bindgen_dd59e212bf7d116f_base

{-# NOINLINE sDL_RenderTextureAffine #-}

-- | Copy a portion of the source texture to the current rendering target, with affine transform, at subpixel precision.
--
--     [@renderer@]: the renderer which should copy parts of a texture.
--
--     [@texture@]: the source texture.
--
--     [@srcrect@]: a pointer to the source rectangle, or NULL for the entire texture.
--
--     [@origin@]: a pointer to a point indicating where the top-left corner of srcrect should be mapped to, or NULL for the rendering target\'s origin.
--
--     [@right@]: a pointer to a point indicating where the top-right corner of srcrect should be mapped to, or NULL for the rendering target\'s top-right corner.
--
--     [@down@]: a pointer to a point indicating where the bottom-left corner of srcrect should be mapped to, or NULL for the rendering target\'s bottom-left corner.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
         -> IO BG.CBool
       )
sDL_RenderTextureAffine =
  BG.unsafePerformIO hs_bindgen_dd59e212bf7d116f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTextureTiled@
foreign import ccall unsafe "hs_bindgen_6cf4fce9a372af75"
  hs_bindgen_6cf4fce9a372af75_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTextureTiled@
hs_bindgen_6cf4fce9a372af75
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
             -> BG.CFloat
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
             -> IO BG.CBool
           )
       )
hs_bindgen_6cf4fce9a372af75 =
  BG.fromFFIType hs_bindgen_6cf4fce9a372af75_base

{-# NOINLINE sDL_RenderTextureTiled #-}

-- | Tile a portion of the texture to the current rendering target at subpixel precision.
--
--     The pixels in @srcrect@ will be repeated as many times as needed to completely fill @dstrect@.
--
--     [@renderer@]: the renderer which should copy parts of a texture.
--
--     [@texture@]: the source texture.
--
--     [@srcrect@]: a pointer to the source rectangle, or NULL for the entire texture.
--
--     [@scale@]: the scale used to transform srcrect into the destination rectangle, e.g. a 32x32 texture with a scale of 2 would fill 64x64 tiles.
--
--     [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
         -> BG.CFloat
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
         -> IO BG.CBool
       )
sDL_RenderTextureTiled =
  BG.unsafePerformIO hs_bindgen_6cf4fce9a372af75

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTexture9Grid@
foreign import ccall unsafe "hs_bindgen_78cecf599cdec7c5"
  hs_bindgen_78cecf599cdec7c5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTexture9Grid@
hs_bindgen_78cecf599cdec7c5
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
             -> BG.CFloat
             -> BG.CFloat
             -> BG.CFloat
             -> BG.CFloat
             -> BG.CFloat
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
             -> IO BG.CBool
           )
       )
hs_bindgen_78cecf599cdec7c5 =
  BG.fromFFIType hs_bindgen_78cecf599cdec7c5_base

{-# NOINLINE sDL_RenderTexture9Grid #-}

-- | Perform a scaled copy using the 9-grid algorithm to the current rendering target at subpixel precision.
--
--     The pixels in the texture are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then stretched into place to cover the remaining destination rectangle.
--
--     [@renderer@]: the renderer which should copy parts of a texture.
--
--     [@texture@]: the source texture.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be used for the 9-grid, or NULL to use the entire texture.
--
--     [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
--
--     [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
--
--     [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
--
--     [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
--
--     [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled copy.
--
--     [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
         -> BG.CFloat
         -> BG.CFloat
         -> BG.CFloat
         -> BG.CFloat
         -> BG.CFloat
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
         -> IO BG.CBool
       )
sDL_RenderTexture9Grid =
  BG.unsafePerformIO hs_bindgen_78cecf599cdec7c5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTexture9GridTiled@
foreign import ccall unsafe "hs_bindgen_1b23a5c925e888fb"
  hs_bindgen_1b23a5c925e888fb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderTexture9GridTiled@
hs_bindgen_1b23a5c925e888fb
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
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
           )
       )
hs_bindgen_1b23a5c925e888fb =
  BG.fromFFIType hs_bindgen_1b23a5c925e888fb_base

{-# NOINLINE sDL_RenderTexture9GridTiled #-}

-- | Perform a scaled copy using the 9-grid algorithm to the current rendering target at subpixel precision.
--
--     The pixels in the texture are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then tiled into place to cover the remaining destination rectangle.
--
--     [@renderer@]: the renderer which should copy parts of a texture.
--
--     [@texture@]: the source texture.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be used for the 9-grid, or NULL to use the entire texture.
--
--     [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
--
--     [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
--
--     [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
--
--     [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
--
--     [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled copy.
--
--     [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
--
--     [@tileScale@]: the scale used to transform the borders and center of @srcrect@ into the borders and middle of @dstrect@, or 1.0f for an unscaled copy.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
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
       )
sDL_RenderTexture9GridTiled =
  BG.unsafePerformIO hs_bindgen_1b23a5c925e888fb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderGeometry@
foreign import ccall unsafe "hs_bindgen_dc26aec86b6b43fe"
  hs_bindgen_dc26aec86b6b43fe_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderGeometry@
hs_bindgen_dc26aec86b6b43fe
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> BG.Ptr SDL_Texture
             -> PtrConst.PtrConst SDL_Vertex
             -> BG.CInt
             -> PtrConst.PtrConst BG.CInt
             -> BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_dc26aec86b6b43fe =
  BG.fromFFIType hs_bindgen_dc26aec86b6b43fe_base

{-# NOINLINE sDL_RenderGeometry #-}

-- | Render a list of triangles, optionally using a texture and indices into the vertex array Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
--
--     [@renderer@]: the rendering context.
--
--     [@texture@]: (optional) The SDL texture to use.
--
--     [@vertices@]: vertices.
--
--     [@num_vertices@]: number of vertices.
--
--     [@indices@]: (optional) An array of integer indices into the \'vertices\' array, if NULL all vertices will be rendered in sequential order.
--
--     [@num_indices@]: number of indices.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> BG.Ptr SDL_Texture
         -> PtrConst.PtrConst SDL_Vertex
         -> BG.CInt
         -> PtrConst.PtrConst BG.CInt
         -> BG.CInt
         -> IO BG.CBool
       )
sDL_RenderGeometry =
  BG.unsafePerformIO hs_bindgen_dc26aec86b6b43fe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderGeometryRaw@
foreign import ccall unsafe "hs_bindgen_1e06910d8288533e"
  hs_bindgen_1e06910d8288533e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderGeometryRaw@
hs_bindgen_1e06910d8288533e
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
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
           )
       )
hs_bindgen_1e06910d8288533e =
  BG.fromFFIType hs_bindgen_1e06910d8288533e_base

{-# NOINLINE sDL_RenderGeometryRaw #-}

-- | Render a list of triangles, optionally using a texture and indices into the vertex arrays Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
--
--     [@renderer@]: the rendering context.
--
--     [@texture@]: (optional) The SDL texture to use.
--
--     [@xy@]: vertex positions.
--
--     [@xy_stride@]: byte size to move from one element to the next element.
--
--     [@color@]: vertex colors (as SDL_FColor).
--
--     [@color_stride@]: byte size to move from one element to the next element.
--
--     [@uv@]: vertex normalized texture coordinates.
--
--     [@uv_stride@]: byte size to move from one element to the next element.
--
--     [@num_vertices@]: number of vertices.
--
--     [@indices@]: (optional) An array of indices into the \'vertices\' arrays, if NULL all vertices will be rendered in sequential order.
--
--     [@num_indices@]: number of indices.
--
--     [@size_indices@]: index size: 1 (byte), 2 (short), 4 (int).
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
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
       )
sDL_RenderGeometryRaw =
  BG.unsafePerformIO hs_bindgen_1e06910d8288533e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderTextureAddressMode@
foreign import ccall unsafe "hs_bindgen_35802c1bb0921c28"
  hs_bindgen_35802c1bb0921c28_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderTextureAddressMode@
hs_bindgen_35802c1bb0921c28
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Renderer -> SDL_TextureAddressMode -> SDL_TextureAddressMode -> IO BG.CBool))
hs_bindgen_35802c1bb0921c28 =
  BG.fromFFIType hs_bindgen_35802c1bb0921c28_base

{-# NOINLINE sDL_SetRenderTextureAddressMode #-}

-- | Set the texture addressing mode used in @SDL_RenderGeometry()@.
--
--     [@renderer@]: the rendering context.
--
--     [@u_mode@]: the 'SDL_TextureAddressMode' to use for horizontal texture coordinates in @SDL_RenderGeometry()@.
--
--     [@v_mode@]: the 'SDL_TextureAddressMode' to use for vertical texture coordinates in @SDL_RenderGeometry()@.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> SDL_TextureAddressMode -> SDL_TextureAddressMode -> IO BG.CBool)
sDL_SetRenderTextureAddressMode =
  BG.unsafePerformIO hs_bindgen_35802c1bb0921c28

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderTextureAddressMode@
foreign import ccall unsafe "hs_bindgen_649128c959cdb236"
  hs_bindgen_649128c959cdb236_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderTextureAddressMode@
hs_bindgen_649128c959cdb236
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> BG.Ptr SDL_TextureAddressMode -> BG.Ptr SDL_TextureAddressMode -> IO BG.CBool)
       )
hs_bindgen_649128c959cdb236 =
  BG.fromFFIType hs_bindgen_649128c959cdb236_base

{-# NOINLINE sDL_GetRenderTextureAddressMode #-}

-- | Get the texture addressing mode used in @SDL_RenderGeometry()@.
--
--     [@renderer@]: the rendering context.
--
--     [@u_mode@]: a pointer filled in with the 'SDL_TextureAddressMode' to use for horizontal texture coordinates in @SDL_RenderGeometry()@, may be NULL.
--
--     [@v_mode@]: a pointer filled in with the 'SDL_TextureAddressMode' to use for vertical texture coordinates in @SDL_RenderGeometry()@, may be NULL.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> BG.Ptr SDL_TextureAddressMode -> BG.Ptr SDL_TextureAddressMode -> IO BG.CBool)
sDL_GetRenderTextureAddressMode =
  BG.unsafePerformIO hs_bindgen_649128c959cdb236

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderReadPixels@
foreign import ccall unsafe "hs_bindgen_b087b184be493118"
  hs_bindgen_b087b184be493118_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderReadPixels@
hs_bindgen_b087b184be493118
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
           )
       )
hs_bindgen_b087b184be493118 =
  BG.fromFFIType hs_bindgen_b087b184be493118_base

{-# NOINLINE sDL_RenderReadPixels #-}

-- | Read pixels from the current rendering target.
--
--     The returned surface contains pixels inside the desired area clipped to the current viewport, and should be freed with SDL_DestroySurface().
--
--     Note that this returns the actual pixels on the screen, so if you are using logical presentation you should use @SDL_GetRenderLogicalPresentationRect()@ to get the area containing your content.
--
--     __WARNING__: This is a very slow operation, and should not be used frequently. If you\'re using this on the main rendering target, it should be called after rendering and before @SDL_RenderPresent()@.
--
--     [@renderer@]: the rendering context.
--
--     [@rect@]: an SDL_Rect structure representing the area to read, which will be clipped to the current viewport, or NULL for the entire viewport.
--
--     [Returns]: a new SDL_Surface on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RenderReadPixels@, defined at @SDL3\/SDL_render.h 2568:43@
sDL_RenderReadPixels
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
       )
sDL_RenderReadPixels =
  BG.unsafePerformIO hs_bindgen_b087b184be493118

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderPresent@
foreign import ccall unsafe "hs_bindgen_2bafff2cb8bebc00"
  hs_bindgen_2bafff2cb8bebc00_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderPresent@
hs_bindgen_2bafff2cb8bebc00 :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool))
hs_bindgen_2bafff2cb8bebc00 =
  BG.fromFFIType hs_bindgen_2bafff2cb8bebc00_base

{-# NOINLINE sDL_RenderPresent #-}

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
--     [@renderer@]: the rendering context.
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
sDL_RenderPresent :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool)
sDL_RenderPresent =
  BG.unsafePerformIO hs_bindgen_2bafff2cb8bebc00

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_DestroyTexture@
foreign import ccall unsafe "hs_bindgen_4497bf4e9bdd42b9"
  hs_bindgen_4497bf4e9bdd42b9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_DestroyTexture@
hs_bindgen_4497bf4e9bdd42b9 :: IO (BG.FunPtr (BG.Ptr SDL_Texture -> IO ()))
hs_bindgen_4497bf4e9bdd42b9 =
  BG.fromFFIType hs_bindgen_4497bf4e9bdd42b9_base

{-# NOINLINE sDL_DestroyTexture #-}

-- | Destroy the specified texture.
--
--     Passing NULL or an otherwise invalid texture will set the SDL error message to \"Invalid texture\".
--
--     [@texture@]: the texture to destroy.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateTexture', 'sDL_CreateTextureFromSurface'
--
--     [C declaration]: @SDL_DestroyTexture@, defined at @SDL3\/SDL_render.h 2634:34@
sDL_DestroyTexture :: BG.FunPtr (BG.Ptr SDL_Texture -> IO ())
sDL_DestroyTexture =
  BG.unsafePerformIO hs_bindgen_4497bf4e9bdd42b9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_DestroyRenderer@
foreign import ccall unsafe "hs_bindgen_011b10f177cafc47"
  hs_bindgen_011b10f177cafc47_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_DestroyRenderer@
hs_bindgen_011b10f177cafc47 :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO ()))
hs_bindgen_011b10f177cafc47 =
  BG.fromFFIType hs_bindgen_011b10f177cafc47_base

{-# NOINLINE sDL_DestroyRenderer #-}

-- | Destroy the rendering context for a window and free all associated textures.
--
--     This should be called before destroying the associated window.
--
--     [@renderer@]: the rendering context.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateRenderer'
--
--     [C declaration]: @SDL_DestroyRenderer@, defined at @SDL3\/SDL_render.h 2650:34@
sDL_DestroyRenderer :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO ())
sDL_DestroyRenderer =
  BG.unsafePerformIO hs_bindgen_011b10f177cafc47

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_FlushRenderer@
foreign import ccall unsafe "hs_bindgen_0ee776d39090d2fd"
  hs_bindgen_0ee776d39090d2fd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_FlushRenderer@
hs_bindgen_0ee776d39090d2fd :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool))
hs_bindgen_0ee776d39090d2fd =
  BG.fromFFIType hs_bindgen_0ee776d39090d2fd_base

{-# NOINLINE sDL_FlushRenderer #-}

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
--     [@renderer@]: the rendering context.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_FlushRenderer@, defined at @SDL3\/SDL_render.h 2683:34@
sDL_FlushRenderer :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO BG.CBool)
sDL_FlushRenderer =
  BG.unsafePerformIO hs_bindgen_0ee776d39090d2fd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderMetalLayer@
foreign import ccall unsafe "hs_bindgen_f52f9cb5238155f3"
  hs_bindgen_f52f9cb5238155f3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderMetalLayer@
hs_bindgen_f52f9cb5238155f3 :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr BG.Void)))
hs_bindgen_f52f9cb5238155f3 =
  BG.fromFFIType hs_bindgen_f52f9cb5238155f3_base

{-# NOINLINE sDL_GetRenderMetalLayer #-}

-- | Get the CAMetalLayer associated with the given Metal renderer.
--
--     This function returns @void *@, so SDL doesn\'t have to include Metal\'s headers, but it can be safely cast to a @CAMetalLayer *@.
--
--     [@renderer@]: the renderer to query.
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
sDL_GetRenderMetalLayer :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr BG.Void))
sDL_GetRenderMetalLayer =
  BG.unsafePerformIO hs_bindgen_f52f9cb5238155f3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderMetalCommandEncoder@
foreign import ccall unsafe "hs_bindgen_0e330f87af225f8b"
  hs_bindgen_0e330f87af225f8b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderMetalCommandEncoder@
hs_bindgen_0e330f87af225f8b :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr BG.Void)))
hs_bindgen_0e330f87af225f8b =
  BG.fromFFIType hs_bindgen_0e330f87af225f8b_base

{-# NOINLINE sDL_GetRenderMetalCommandEncoder #-}

-- | Get the Metal command encoder for the current frame.
--
--     This function returns @void *@, so SDL doesn\'t have to include Metal\'s headers, but it can be safely cast to an @id\<MTLRenderCommandEncoder>@.
--
--     This will return NULL if Metal refuses to give SDL a drawable to render to, which might happen if the window is hidden\/minimized\/offscreen. This doesn\'t apply to command encoders for render targets, just the window\'s backbuffer. Check your return values!
--
--     [@renderer@]: the renderer to query.
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
sDL_GetRenderMetalCommandEncoder :: BG.FunPtr (BG.Ptr SDL_Renderer -> IO (BG.Ptr BG.Void))
sDL_GetRenderMetalCommandEncoder =
  BG.unsafePerformIO hs_bindgen_0e330f87af225f8b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_AddVulkanRenderSemaphores@
foreign import ccall unsafe "hs_bindgen_3aaeda31b2a532b0"
  hs_bindgen_3aaeda31b2a532b0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_AddVulkanRenderSemaphores@
hs_bindgen_3aaeda31b2a532b0
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Sint64
             -> SDL3.Sys.Bindgen.Stdinc.Sint64
             -> IO BG.CBool
           )
       )
hs_bindgen_3aaeda31b2a532b0 =
  BG.fromFFIType hs_bindgen_3aaeda31b2a532b0_base

{-# NOINLINE sDL_AddVulkanRenderSemaphores #-}

-- | Add a set of synchronization semaphores for the current frame.
--
--     The Vulkan renderer will wait for @wait_semaphore@ before submitting rendering commands and signal @signal_semaphore@ after rendering commands are complete for this frame.
--
--     This should be called each frame that you want semaphore synchronization. The Vulkan renderer may have multiple frames in flight on the GPU, so you should have multiple semaphores that are used for synchronization. Querying SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER will give you the maximum number of semaphores you\'ll need.
--
--     [@renderer@]: the rendering context.
--
--     [@wait_stage_mask@]: the VkPipelineStageFlags for the wait.
--
--     [@wait_semaphore@]: a VkSempahore to wait on before rendering the current frame, or 0 if not needed.
--
--     [@signal_semaphore@]: a VkSempahore that SDL will signal when rendering for the current frame is complete, or 0 if not needed.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is __NOT__ safe to call this function from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_AddVulkanRenderSemaphores@, defined at @SDL3\/SDL_render.h 2755:34@
sDL_AddVulkanRenderSemaphores
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Sint64
         -> SDL3.Sys.Bindgen.Stdinc.Sint64
         -> IO BG.CBool
       )
sDL_AddVulkanRenderSemaphores =
  BG.unsafePerformIO hs_bindgen_3aaeda31b2a532b0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderVSync@
foreign import ccall unsafe "hs_bindgen_964c717567cbb3b7"
  hs_bindgen_964c717567cbb3b7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetRenderVSync@
hs_bindgen_964c717567cbb3b7 :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CInt -> IO BG.CBool))
hs_bindgen_964c717567cbb3b7 =
  BG.fromFFIType hs_bindgen_964c717567cbb3b7_base

{-# NOINLINE sDL_SetRenderVSync #-}

-- | Toggle VSync of the given renderer.
--
--     When a renderer is created, vsync defaults to SDL_RENDERER_VSYNC_DISABLED.
--
--     The @vsync@ parameter can be 1 to synchronize present with every vertical refresh, 2 to synchronize present with every second vertical refresh, etc., SDL_RENDERER_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or SDL_RENDERER_VSYNC_DISABLED to disable. Not every value is supported by every driver, so you should check the return value to see whether the requested setting is supported.
--
--     [@renderer@]: the renderer to toggle.
--
--     [@vsync@]: the vertical refresh sync interval.
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
sDL_SetRenderVSync :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.CInt -> IO BG.CBool)
sDL_SetRenderVSync =
  BG.unsafePerformIO hs_bindgen_964c717567cbb3b7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderVSync@
foreign import ccall unsafe "hs_bindgen_ea48e8e1fe227495"
  hs_bindgen_ea48e8e1fe227495_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetRenderVSync@
hs_bindgen_ea48e8e1fe227495 :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_ea48e8e1fe227495 =
  BG.fromFFIType hs_bindgen_ea48e8e1fe227495_base

{-# NOINLINE sDL_GetRenderVSync #-}

-- | Get VSync of the given renderer.
--
--     [@renderer@]: the renderer to toggle.
--
--     [@vsync@]: an int filled with the current vertical refresh sync interval. See @SDL_SetRenderVSync()@ for the meaning of the value.
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
sDL_GetRenderVSync :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetRenderVSync =
  BG.unsafePerformIO hs_bindgen_ea48e8e1fe227495

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderDebugText@
foreign import ccall unsafe "hs_bindgen_30bc1d75e73ca06a"
  hs_bindgen_30bc1d75e73ca06a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_RenderDebugText@
hs_bindgen_30bc1d75e73ca06a
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
       )
hs_bindgen_30bc1d75e73ca06a =
  BG.fromFFIType hs_bindgen_30bc1d75e73ca06a_base

{-# NOINLINE sDL_RenderDebugText #-}

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
--     [@renderer@]: the renderer which should draw a line of text.
--
--     [@x@]: the x coordinate where the top-left corner of the text will draw.
--
--     [@y@]: the y coordinate where the top-left corner of the text will draw.
--
--     [@str@]: the string to render.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Renderer -> BG.CFloat -> BG.CFloat -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_RenderDebugText =
  BG.unsafePerformIO hs_bindgen_30bc1d75e73ca06a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetDefaultTextureScaleMode@
foreign import ccall unsafe "hs_bindgen_7118410bfe83a316"
  hs_bindgen_7118410bfe83a316_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetDefaultTextureScaleMode@
hs_bindgen_7118410bfe83a316
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode -> IO BG.CBool))
hs_bindgen_7118410bfe83a316 =
  BG.fromFFIType hs_bindgen_7118410bfe83a316_base

{-# NOINLINE sDL_SetDefaultTextureScaleMode #-}

-- | Set default scale mode for new textures for given renderer.
--
--     When a renderer is created, scale_mode defaults to SDL_SCALEMODE_LINEAR.
--
--     [@renderer@]: the renderer to update.
--
--     [@scale_mode@]: the scale mode to change to for new textures.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode -> IO BG.CBool)
sDL_SetDefaultTextureScaleMode =
  BG.unsafePerformIO hs_bindgen_7118410bfe83a316

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetDefaultTextureScaleMode@
foreign import ccall unsafe "hs_bindgen_51156f5e8dd42d03"
  hs_bindgen_51156f5e8dd42d03_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_GetDefaultTextureScaleMode@
hs_bindgen_51156f5e8dd42d03
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode -> IO BG.CBool))
hs_bindgen_51156f5e8dd42d03 =
  BG.fromFFIType hs_bindgen_51156f5e8dd42d03_base

{-# NOINLINE sDL_GetDefaultTextureScaleMode #-}

-- | Get default texture scale mode of the given renderer.
--
--     [@renderer@]: the renderer to get data from.
--
--     [@scale_mode@]: a SDL_ScaleMode filled with current default scale mode. See @SDL_SetDefaultTextureScaleMode()@ for the meaning of the value.
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
  :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode -> IO BG.CBool)
sDL_GetDefaultTextureScaleMode =
  BG.unsafePerformIO hs_bindgen_51156f5e8dd42d03

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateGPURenderState@
foreign import ccall unsafe "hs_bindgen_c77515a1f877dab2"
  hs_bindgen_c77515a1f877dab2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_CreateGPURenderState@
hs_bindgen_c77515a1f877dab2
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Renderer
             -> PtrConst.PtrConst SDL_GPURenderStateCreateInfo
             -> IO (BG.Ptr SDL_GPURenderState)
           )
       )
hs_bindgen_c77515a1f877dab2 =
  BG.fromFFIType hs_bindgen_c77515a1f877dab2_base

{-# NOINLINE sDL_CreateGPURenderState #-}

-- | Create custom GPU render state.
--
--     [@renderer@]: the renderer to use.
--
--     [@createinfo@]: a struct describing the GPU render state to create.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Renderer
         -> PtrConst.PtrConst SDL_GPURenderStateCreateInfo
         -> IO (BG.Ptr SDL_GPURenderState)
       )
sDL_CreateGPURenderState =
  BG.unsafePerformIO hs_bindgen_c77515a1f877dab2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetGPURenderStateFragmentUniforms@
foreign import ccall unsafe "hs_bindgen_65c1c07e7c4876a6"
  hs_bindgen_65c1c07e7c4876a6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetGPURenderStateFragmentUniforms@
hs_bindgen_65c1c07e7c4876a6
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_GPURenderState
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_65c1c07e7c4876a6 =
  BG.fromFFIType hs_bindgen_65c1c07e7c4876a6_base

{-# NOINLINE sDL_SetGPURenderStateFragmentUniforms #-}

-- | Set fragment shader uniform variables in a custom GPU render state.
--
--     The data is copied and will be pushed using SDL_PushGPUFragmentUniformData() during draw call execution.
--
--     [@state@]: the state to modify.
--
--     [@slot_index@]: the fragment uniform slot to push data to.
--
--     [@data@]: client data to write.
--
--     [@length@]: the length of the data to write.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetGPURenderStateFragmentUniforms@, defined at @SDL3\/SDL_render.h 2990:34@
sDL_SetGPURenderStateFragmentUniforms
  :: BG.FunPtr
       ( BG.Ptr SDL_GPURenderState
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst BG.Void
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_SetGPURenderStateFragmentUniforms =
  BG.unsafePerformIO hs_bindgen_65c1c07e7c4876a6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetGPURenderState@
foreign import ccall unsafe "hs_bindgen_440f7dac948d9e3d"
  hs_bindgen_440f7dac948d9e3d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_SetGPURenderState@
hs_bindgen_440f7dac948d9e3d
  :: IO (BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL_GPURenderState -> IO BG.CBool))
hs_bindgen_440f7dac948d9e3d =
  BG.fromFFIType hs_bindgen_440f7dac948d9e3d_base

{-# NOINLINE sDL_SetGPURenderState #-}

-- | Set custom GPU render state.
--
--     This function sets custom GPU render state for subsequent draw calls. This allows using custom shaders with the GPU renderer.
--
--     [@renderer@]: the renderer to use.
--
--     [@state@]: the state to to use, or NULL to clear custom GPU render state.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetGPURenderState@, defined at @SDL3\/SDL_render.h 3008:34@
sDL_SetGPURenderState :: BG.FunPtr (BG.Ptr SDL_Renderer -> BG.Ptr SDL_GPURenderState -> IO BG.CBool)
sDL_SetGPURenderState =
  BG.unsafePerformIO hs_bindgen_440f7dac948d9e3d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_DestroyGPURenderState@
foreign import ccall unsafe "hs_bindgen_dc4da5de025a8ba9"
  hs_bindgen_dc4da5de025a8ba9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Render_get_SDL_DestroyGPURenderState@
hs_bindgen_dc4da5de025a8ba9 :: IO (BG.FunPtr (BG.Ptr SDL_GPURenderState -> IO ()))
hs_bindgen_dc4da5de025a8ba9 =
  BG.fromFFIType hs_bindgen_dc4da5de025a8ba9_base

{-# NOINLINE sDL_DestroyGPURenderState #-}

-- | Destroy custom GPU render state.
--
--     [@state@]: the state to destroy.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_CreateGPURenderState'
--
--     [C declaration]: @SDL_DestroyGPURenderState@, defined at @SDL3\/SDL_render.h 3022:34@
sDL_DestroyGPURenderState :: BG.FunPtr (BG.Ptr SDL_GPURenderState -> IO ())
sDL_DestroyGPURenderState =
  BG.unsafePerformIO hs_bindgen_dc4da5de025a8ba9
