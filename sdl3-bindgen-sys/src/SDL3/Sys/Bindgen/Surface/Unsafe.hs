{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Surface.Unsafe (
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_CreateSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_CreateSurfaceFrom,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_DestroySurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_GetSurfaceProperties,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SetSurfaceColorspace,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_GetSurfaceColorspace,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_CreateSurfacePalette,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SetSurfacePalette,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_GetSurfacePalette,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_AddSurfaceAlternateImage,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SurfaceHasAlternateImages,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_GetSurfaceImages,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_RemoveSurfaceAlternateImages,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_LockSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_UnlockSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_LoadSurface_IO,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_LoadSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_LoadBMP_IO,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_LoadBMP,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SaveBMP_IO,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SaveBMP,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_LoadPNG_IO,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_LoadPNG,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SavePNG_IO,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SavePNG,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SetSurfaceRLE,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SurfaceHasRLE,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SetSurfaceColorKey,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SurfaceHasColorKey,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_GetSurfaceColorKey,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SetSurfaceColorMod,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_GetSurfaceColorMod,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SetSurfaceAlphaMod,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_GetSurfaceAlphaMod,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SetSurfaceBlendMode,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_GetSurfaceBlendMode,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_SetSurfaceClipRect,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_GetSurfaceClipRect,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_FlipSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_RotateSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_DuplicateSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_ScaleSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_ConvertSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_ConvertSurfaceAndColorspace,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_ConvertPixels,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_ConvertPixelsAndColorspace,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_PremultiplyAlpha,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_PremultiplySurfaceAlpha,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_ClearSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_FillSurfaceRect,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_FillSurfaceRects,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_BlitSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_BlitSurfaceUnchecked,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_BlitSurfaceScaled,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_BlitSurfaceUncheckedScaled,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_StretchSurface,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_BlitSurfaceTiled,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_BlitSurfaceTiledWithScale,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_BlitSurface9Grid,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_MapSurfaceRGB,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_MapSurfaceRGBA,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_ReadSurfacePixel,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_ReadSurfacePixelFloat,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_WriteSurfacePixel,
  SDL3.Sys.Bindgen.Surface.Unsafe.sDL_WriteSurfacePixelFloat,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Blendmode qualified
import SDL3.Sys.Bindgen.Iostream qualified
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_surface.h>"
         , "SDL_Surface *hs_bindgen_168e356f6cfde2ca ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  SDL_PixelFormat arg3"
         , ")"
         , "{"
         , "  return (SDL_CreateSurface)(arg1, arg2, arg3);"
         , "}"
         , "SDL_Surface *hs_bindgen_19204ffb79c10370 ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  SDL_PixelFormat arg3,"
         , "  void *arg4,"
         , "  signed int arg5"
         , ")"
         , "{"
         , "  return (SDL_CreateSurfaceFrom)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "void hs_bindgen_173baf44c4ee5552 ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroySurface)(arg1);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_104a480f6f0ca65f ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSurfaceProperties)(arg1);"
         , "}"
         , "_Bool hs_bindgen_0511900fd59c0e54 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Colorspace arg2"
         , ")"
         , "{"
         , "  return (SDL_SetSurfaceColorspace)(arg1, arg2);"
         , "}"
         , "SDL_Colorspace hs_bindgen_e144267d4a5dc8c1 ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSurfaceColorspace)(arg1);"
         , "}"
         , "SDL_Palette *hs_bindgen_518323a2443a645c ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateSurfacePalette)(arg1);"
         , "}"
         , "_Bool hs_bindgen_6cb3893d72b38425 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Palette *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetSurfacePalette)(arg1, arg2);"
         , "}"
         , "SDL_Palette *hs_bindgen_c36a6adcce04e3d9 ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSurfacePalette)(arg1);"
         , "}"
         , "_Bool hs_bindgen_36366ea481866b40 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return (SDL_AddSurfaceAlternateImage)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_c8c9d6b2ea4d4292 ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_SurfaceHasAlternateImages)(arg1);"
         , "}"
         , "SDL_Surface **hs_bindgen_b3d55dcc42d5db12 ("
         , "  SDL_Surface *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetSurfaceImages)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_1adedb2719efa1bf ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  (SDL_RemoveSurfaceAlternateImages)(arg1);"
         , "}"
         , "_Bool hs_bindgen_8363af1ae03d45b9 ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_LockSurface)(arg1);"
         , "}"
         , "void hs_bindgen_0b94cbec8aca2abc ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  (SDL_UnlockSurface)(arg1);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "SDL_Surface *hs_bindgen_1a1549d61e2d7c6f ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_LoadSurface_IO)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_LoadSurface_IO requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "SDL_Surface *hs_bindgen_84c82bda97a82d45 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_LoadSurface)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_LoadSurface requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "SDL_Surface *hs_bindgen_04dc7704680e62ca ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_LoadBMP_IO)(arg1, arg2);"
         , "}"
         , "SDL_Surface *hs_bindgen_fade244cdadaaa01 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_LoadBMP)(arg1);"
         , "}"
         , "_Bool hs_bindgen_9c98f1ae4256924d ("
         , "  SDL_Surface *arg1,"
         , "  SDL_IOStream *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_SaveBMP_IO)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_66fb79ef3bca90df ("
         , "  SDL_Surface *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SaveBMP)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "SDL_Surface *hs_bindgen_7160fe58e1c51f22 ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_LoadPNG_IO)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_LoadPNG_IO requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "SDL_Surface *hs_bindgen_bc316d886d9c3957 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_LoadPNG)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_LoadPNG requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_9c8e4c9fc901ee28 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_IOStream *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SavePNG_IO)(arg1, arg2, arg3);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; SDL_SetError(\"SDL_SavePNG_IO requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_759469fef46a8cd4 ("
         , "  SDL_Surface *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SavePNG)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_SavePNG requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "_Bool hs_bindgen_5d1b864a1323d92d ("
         , "  SDL_Surface *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetSurfaceRLE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b51ce9068c82d3d0 ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_SurfaceHasRLE)(arg1);"
         , "}"
         , "_Bool hs_bindgen_13efdbaff73dc30f ("
         , "  SDL_Surface *arg1,"
         , "  _Bool arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_SetSurfaceColorKey)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_998ae6f993d45bac ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_SurfaceHasColorKey)(arg1);"
         , "}"
         , "_Bool hs_bindgen_463737aa98969701 ("
         , "  SDL_Surface *arg1,"
         , "  Uint32 *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetSurfaceColorKey)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_5802144e4d11fa38 ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return (SDL_SetSurfaceColorMod)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_8f67dce9db98e6f9 ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 *arg2,"
         , "  Uint8 *arg3,"
         , "  Uint8 *arg4"
         , ")"
         , "{"
         , "  return (SDL_GetSurfaceColorMod)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_2f27871d133fe193 ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 arg2"
         , ")"
         , "{"
         , "  return (SDL_SetSurfaceAlphaMod)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_62e7ffa57cc86c89 ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetSurfaceAlphaMod)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_31b5f1226bf51118 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_BlendMode arg2"
         , ")"
         , "{"
         , "  return (SDL_SetSurfaceBlendMode)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_e69bee46110b6faa ("
         , "  SDL_Surface *arg1,"
         , "  SDL_BlendMode *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetSurfaceBlendMode)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_d3f690ca2bc82289 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetSurfaceClipRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_510cbf12ad718ad5 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetSurfaceClipRect)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_c9050e1a6dbcc389 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_FlipMode arg2"
         , ")"
         , "{"
         , "  return (SDL_FlipSurface)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "SDL_Surface *hs_bindgen_b68c60a70d17f528 ("
         , "  SDL_Surface *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_RotateSurface)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_RotateSurface requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "SDL_Surface *hs_bindgen_fb5b3c5560c73662 ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return (SDL_DuplicateSurface)(arg1);"
         , "}"
         , "SDL_Surface *hs_bindgen_302fe5f6d166cef5 ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  SDL_ScaleMode arg4"
         , ")"
         , "{"
         , "  return (SDL_ScaleSurface)(arg1, arg2, arg3, arg4);"
         , "}"
         , "SDL_Surface *hs_bindgen_2d38a11d9ed40ec3 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_PixelFormat arg2"
         , ")"
         , "{"
         , "  return (SDL_ConvertSurface)(arg1, arg2);"
         , "}"
         , "SDL_Surface *hs_bindgen_589af8fb0fd3b451 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_PixelFormat arg2,"
         , "  SDL_Palette *arg3,"
         , "  SDL_Colorspace arg4,"
         , "  SDL_PropertiesID arg5"
         , ")"
         , "{"
         , "  return (SDL_ConvertSurfaceAndColorspace)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_c4ac87b53bb7fbaa ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  SDL_PixelFormat arg3,"
         , "  void const *arg4,"
         , "  signed int arg5,"
         , "  SDL_PixelFormat arg6,"
         , "  void *arg7,"
         , "  signed int arg8"
         , ")"
         , "{"
         , "  return (SDL_ConvertPixels)(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);"
         , "}"
         , "_Bool hs_bindgen_384b325525f7f1f3 ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  SDL_PixelFormat arg3,"
         , "  SDL_Colorspace arg4,"
         , "  SDL_PropertiesID arg5,"
         , "  void const *arg6,"
         , "  signed int arg7,"
         , "  SDL_PixelFormat arg8,"
         , "  SDL_Colorspace arg9,"
         , "  SDL_PropertiesID arg10,"
         , "  void *arg11,"
         , "  signed int arg12"
         , ")"
         , "{"
         , "  return (SDL_ConvertPixelsAndColorspace)(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);"
         , "}"
         , "_Bool hs_bindgen_9a5c070f0253ae0a ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  SDL_PixelFormat arg3,"
         , "  void const *arg4,"
         , "  signed int arg5,"
         , "  SDL_PixelFormat arg6,"
         , "  void *arg7,"
         , "  signed int arg8,"
         , "  _Bool arg9"
         , ")"
         , "{"
         , "  return (SDL_PremultiplyAlpha)(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);"
         , "}"
         , "_Bool hs_bindgen_7065a7a3bd7041c8 ("
         , "  SDL_Surface *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_PremultiplySurfaceAlpha)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_de44f8d6106c7e71 ("
         , "  SDL_Surface *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float arg4,"
         , "  float arg5"
         , ")"
         , "{"
         , "  return (SDL_ClearSurface)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_8e254769393349cc ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_FillSurfaceRect)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_4eb2bdf51787fb5f ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  signed int arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return (SDL_FillSurfaceRects)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_dd9a2fd8000655e0 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4"
         , ")"
         , "{"
         , "  return (SDL_BlitSurface)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_f1d3fd72bc95a376 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4"
         , ")"
         , "{"
         , "  return (SDL_BlitSurfaceUnchecked)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_ca439260becd97fa ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4,"
         , "  SDL_ScaleMode arg5"
         , ")"
         , "{"
         , "  return (SDL_BlitSurfaceScaled)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_273462ee987888b2 ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4,"
         , "  SDL_ScaleMode arg5"
         , ")"
         , "{"
         , "  return (SDL_BlitSurfaceUncheckedScaled)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_cbba042ce7137c9a ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4,"
         , "  SDL_ScaleMode arg5"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 2, 4)"
         , "  return (SDL_StretchSurface)(arg1, arg2, arg3, arg4, arg5);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; (void)arg4; (void)arg5; SDL_SetError(\"SDL_StretchSurface requires SDL >= 3.2.4\"); return 0;"
         , "#endif"
         , "}"
         , "_Bool hs_bindgen_cc06339086116f6d ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4"
         , ")"
         , "{"
         , "  return (SDL_BlitSurfaceTiled)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_50d8214074d2e91b ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  float arg3,"
         , "  SDL_ScaleMode arg4,"
         , "  SDL_Surface *arg5,"
         , "  SDL_Rect const *arg6"
         , ")"
         , "{"
         , "  return (SDL_BlitSurfaceTiledWithScale)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "_Bool hs_bindgen_84940b463dd6473c ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  signed int arg3,"
         , "  signed int arg4,"
         , "  signed int arg5,"
         , "  signed int arg6,"
         , "  float arg7,"
         , "  SDL_ScaleMode arg8,"
         , "  SDL_Surface *arg9,"
         , "  SDL_Rect const *arg10"
         , ")"
         , "{"
         , "  return (SDL_BlitSurface9Grid)(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);"
         , "}"
         , "Uint32 hs_bindgen_5dfeeef5d5aa83da ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return (SDL_MapSurfaceRGB)(arg1, arg2, arg3, arg4);"
         , "}"
         , "Uint32 hs_bindgen_456d7e009be906d0 ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5"
         , ")"
         , "{"
         , "  return (SDL_MapSurfaceRGBA)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_76b097df3deb39a7 ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  Uint8 *arg4,"
         , "  Uint8 *arg5,"
         , "  Uint8 *arg6,"
         , "  Uint8 *arg7"
         , ")"
         , "{"
         , "  return (SDL_ReadSurfacePixel)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         , "_Bool hs_bindgen_1dba774402b79156 ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  float *arg4,"
         , "  float *arg5,"
         , "  float *arg6,"
         , "  float *arg7"
         , ")"
         , "{"
         , "  return (SDL_ReadSurfacePixelFloat)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         , "_Bool hs_bindgen_66bf3500cd5641bd ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5,"
         , "  Uint8 arg6,"
         , "  Uint8 arg7"
         , ")"
         , "{"
         , "  return (SDL_WriteSurfacePixel)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         , "_Bool hs_bindgen_91babb583602ef71 ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  float arg4,"
         , "  float arg5,"
         , "  float arg6,"
         , "  float arg7"
         , ")"
         , "{"
         , "  return (SDL_WriteSurfacePixelFloat)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_CreateSurface@
foreign import ccall unsafe "hs_bindgen_168e356f6cfde2ca"
  hs_bindgen_168e356f6cfde2ca_base
    :: BG.Int32
    -> BG.Int32
    -> BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_CreateSurface@
hs_bindgen_168e356f6cfde2ca
  :: BG.CInt
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_168e356f6cfde2ca =
  BG.fromFFIType hs_bindgen_168e356f6cfde2ca_base

-- | Allocate a new surface with a specific pixel format.
--
--     The pixels of the new surface are initialized to zero.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateSurfaceFrom', 'sDL_DestroySurface'
--
--     [C declaration]: @SDL_CreateSurface@, defined at @SDL3\/SDL_surface.h 173:43@
sDL_CreateSurface
  :: BG.CInt
  -- ^
  --
  --           [@width@]: the width of the surface.
  -> BG.CInt
  -- ^
  --
  --           [@height@]: the height of the surface.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the SDL_PixelFormat for the new surface\'s pixel format.
  -> IO (BG.Ptr SDL_Surface)
sDL_CreateSurface = hs_bindgen_168e356f6cfde2ca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_CreateSurfaceFrom@
foreign import ccall unsafe "hs_bindgen_19204ffb79c10370"
  hs_bindgen_19204ffb79c10370_base
    :: BG.Int32
    -> BG.Int32
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_CreateSurfaceFrom@
hs_bindgen_19204ffb79c10370
  :: BG.CInt
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> BG.Ptr BG.Void
  -> BG.CInt
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_19204ffb79c10370 =
  BG.fromFFIType hs_bindgen_19204ffb79c10370_base

-- | Allocate a new surface with a specific pixel format and existing pixel data.
--
--     No copy is made of the pixel data. Pixel data is not managed automatically; you must free the surface before you free the pixel data.
--
--     Pitch is the offset in bytes from one row of pixels to the next, e.g. @width*4@ for @SDL_PIXELFORMAT_RGBA8888@.
--
--     You may pass NULL for pixels and 0 for pitch to create a surface that you will fill in with valid values later.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateSurface', 'sDL_DestroySurface'
--
--     [C declaration]: @SDL_CreateSurfaceFrom@, defined at @SDL3\/SDL_surface.h 203:43@
sDL_CreateSurfaceFrom
  :: BG.CInt
  -- ^
  --
  --           [@width@]: the width of the surface.
  -> BG.CInt
  -- ^
  --
  --           [@height@]: the height of the surface.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the SDL_PixelFormat for the new surface\'s pixel format.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@pixels@]: a pointer to existing pixel data.
  -> BG.CInt
  -- ^
  --
  --           [@pitch@]: the number of bytes between each row, including padding.
  -> IO (BG.Ptr SDL_Surface)
sDL_CreateSurfaceFrom = hs_bindgen_19204ffb79c10370

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_DestroySurface@
foreign import ccall unsafe "hs_bindgen_173baf44c4ee5552"
  hs_bindgen_173baf44c4ee5552_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_DestroySurface@
hs_bindgen_173baf44c4ee5552
  :: BG.Ptr SDL_Surface
  -> IO ()
hs_bindgen_173baf44c4ee5552 =
  BG.fromFFIType hs_bindgen_173baf44c4ee5552_base

-- | Free a surface.
--
--     It is safe to pass NULL to this function.
--
--     [Thread safety]: No other thread should be using the surface when it is freed.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateSurface', 'sDL_CreateSurfaceFrom'
--
--     [C declaration]: @SDL_DestroySurface@, defined at @SDL3\/SDL_surface.h 219:34@
sDL_DestroySurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' to free.
  -> IO ()
sDL_DestroySurface = hs_bindgen_173baf44c4ee5552

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceProperties@
foreign import ccall unsafe "hs_bindgen_104a480f6f0ca65f"
  hs_bindgen_104a480f6f0ca65f_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceProperties@
hs_bindgen_104a480f6f0ca65f
  :: BG.Ptr SDL_Surface
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_104a480f6f0ca65f =
  BG.fromFFIType hs_bindgen_104a480f6f0ca65f_base

-- | Get the properties associated with a surface.
--
--     The following properties are understood by SDL:
--
--     * @'sDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT'@: for HDR10 and floating point surfaces, this defines the value of 100% diffuse white, with higher values being displayed in the High Dynamic Range headroom. This defaults to 203 for HDR10 surfaces and 1.0 for floating point surfaces.
--
--     * @'sDL_PROP_SURFACE_HDR_HEADROOM_FLOAT'@: for HDR10 and floating point surfaces, this defines the maximum dynamic range used by the content, in terms of the SDR white point. This defaults to 0.0, which disables tone mapping.
--
--     * @'sDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING'@: the tone mapping operator used when compressing from a surface with high dynamic range to another with lower dynamic range. Currently this supports \"chrome\", which uses the same tone mapping that Chrome uses for HDR content, the form \"*=N\", where N is a floating point scale factor applied in linear space, and \"none\", which disables tone mapping. This defaults to \"chrome\".
--
--     * @'sDL_PROP_SURFACE_HOTSPOT_X_NUMBER'@: the hotspot pixel offset from the left edge of the image, if this surface is being used as a cursor.
--
--     * @'sDL_PROP_SURFACE_HOTSPOT_Y_NUMBER'@: the hotspot pixel offset from the top edge of the image, if this surface is being used as a cursor.
--
--     * @'sDL_PROP_SURFACE_ROTATION_FLOAT'@: the number of degrees a surface\'s data is meant to be rotated clockwise to make the image right-side up. Default
--       1. This is used by the camera API, if a mobile device is oriented differently than what its camera provides (i.e. - the camera always provides portrait images but the phone is being held in landscape orientation). Since SDL 3.4.0.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSurfaceProperties@, defined at @SDL3\/SDL_surface.h 259:46@
sDL_GetSurfaceProperties
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetSurfaceProperties =
  hs_bindgen_104a480f6f0ca65f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceColorspace@
foreign import ccall unsafe "hs_bindgen_0511900fd59c0e54"
  hs_bindgen_0511900fd59c0e54_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceColorspace@
hs_bindgen_0511900fd59c0e54
  :: BG.Ptr SDL_Surface
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO BG.CBool
hs_bindgen_0511900fd59c0e54 =
  BG.fromFFIType hs_bindgen_0511900fd59c0e54_base

-- | Set the colorspace used by a surface.
--
--     Setting the colorspace doesn\'t change the pixels, only how they are interpreted in color operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetSurfaceColorspace'
--
--     [C declaration]: @SDL_SetSurfaceColorspace@, defined at @SDL3\/SDL_surface.h 287:34@
sDL_SetSurfaceColorspace
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@colorspace@]: an SDL_Colorspace value describing the surface colorspace.
  -> IO BG.CBool
sDL_SetSurfaceColorspace =
  hs_bindgen_0511900fd59c0e54

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceColorspace@
foreign import ccall unsafe "hs_bindgen_e144267d4a5dc8c1"
  hs_bindgen_e144267d4a5dc8c1_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceColorspace@
hs_bindgen_e144267d4a5dc8c1
  :: BG.Ptr SDL_Surface
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
hs_bindgen_e144267d4a5dc8c1 =
  BG.fromFFIType hs_bindgen_e144267d4a5dc8c1_base

-- | Get the colorspace used by a surface.
--
--     The colorspace defaults to SDL_COLORSPACE_SRGB_LINEAR for floating point formats, SDL_COLORSPACE_HDR10 for 10-bit formats, SDL_COLORSPACE_SRGB for other RGB surfaces and SDL_COLORSPACE_BT709_FULL for YUV textures.
--
--     [Returns]: the colorspace used by the surface, or SDL_COLORSPACE_UNKNOWN if the surface is NULL.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetSurfaceColorspace'
--
--     [C declaration]: @SDL_GetSurfaceColorspace@, defined at @SDL3\/SDL_surface.h 307:44@
sDL_GetSurfaceColorspace
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
sDL_GetSurfaceColorspace =
  hs_bindgen_e144267d4a5dc8c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_CreateSurfacePalette@
foreign import ccall unsafe "hs_bindgen_518323a2443a645c"
  hs_bindgen_518323a2443a645c_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_CreateSurfacePalette@
hs_bindgen_518323a2443a645c
  :: BG.Ptr SDL_Surface
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
hs_bindgen_518323a2443a645c =
  BG.fromFFIType hs_bindgen_518323a2443a645c_base

-- | Create a palette and associate it with a surface.
--
--     This function creates a palette compatible with the provided surface. The palette is then returned for you to modify, and the surface will automatically use the new palette in future operations. You do not need to destroy the returned palette, it will be freed when the reference count reaches 0, usually when the surface is destroyed.
--
--     Bitmap surfaces (with format SDL_PIXELFORMAT_INDEX1LSB or SDL_PIXELFORMAT_INDEX1MSB) will have the palette initialized with 0 as white and 1 as black. Other surfaces will get a palette initialized with white in every entry.
--
--     If this function is called for a surface that already has a palette, a new palette will be created to replace it.
--
--     [Returns]: a new SDL_Palette structure on success or NULL on failure (e.g. if the surface didn\'t have an index format); call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: SDL_SetPaletteColors
--
--     [C declaration]: @SDL_CreateSurfacePalette@, defined at @SDL3\/SDL_surface.h 338:43@
sDL_CreateSurfacePalette
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
sDL_CreateSurfacePalette =
  hs_bindgen_518323a2443a645c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfacePalette@
foreign import ccall unsafe "hs_bindgen_6cb3893d72b38425"
  hs_bindgen_6cb3893d72b38425_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfacePalette@
hs_bindgen_6cb3893d72b38425
  :: BG.Ptr SDL_Surface
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -> IO BG.CBool
hs_bindgen_6cb3893d72b38425 =
  BG.fromFFIType hs_bindgen_6cb3893d72b38425_base

-- | Set the palette used by a surface.
--
--     Setting the palette keeps an internal reference to the palette, which can be safely destroyed afterwards.
--
--     A single palette can be shared with many surfaces.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: SDL_CreatePalette, 'sDL_GetSurfacePalette'
--
--     [C declaration]: @SDL_SetSurfacePalette@, defined at @SDL3\/SDL_surface.h 361:34@
sDL_SetSurfacePalette
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -- ^
  --
  --           [@palette@]: the SDL_Palette structure to use.
  -> IO BG.CBool
sDL_SetSurfacePalette = hs_bindgen_6cb3893d72b38425

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfacePalette@
foreign import ccall unsafe "hs_bindgen_c36a6adcce04e3d9"
  hs_bindgen_c36a6adcce04e3d9_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfacePalette@
hs_bindgen_c36a6adcce04e3d9
  :: BG.Ptr SDL_Surface
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
hs_bindgen_c36a6adcce04e3d9 =
  BG.fromFFIType hs_bindgen_c36a6adcce04e3d9_base

-- | Get the palette used by a surface.
--
--     [Returns]: a pointer to the palette used by the surface, or NULL if there is no palette used.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetSurfacePalette'
--
--     [C declaration]: @SDL_GetSurfacePalette@, defined at @SDL3\/SDL_surface.h 376:43@
sDL_GetSurfacePalette
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
sDL_GetSurfacePalette = hs_bindgen_c36a6adcce04e3d9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_AddSurfaceAlternateImage@
foreign import ccall unsafe "hs_bindgen_36366ea481866b40"
  hs_bindgen_36366ea481866b40_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_AddSurfaceAlternateImage@
hs_bindgen_36366ea481866b40
  :: BG.Ptr SDL_Surface
  -> BG.Ptr SDL_Surface
  -> IO BG.CBool
hs_bindgen_36366ea481866b40 =
  BG.fromFFIType hs_bindgen_36366ea481866b40_base

-- | Add an alternate version of a surface.
--
--     This function adds an alternate version of this surface, usually used for content with high DPI representations like cursors or icons. The size, format, and content do not need to match the original surface, and these alternate versions will not be updated when the original surface changes.
--
--     This function adds a reference to the alternate version, so you should call @SDL_DestroySurface()@ on the image after this call.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RemoveSurfaceAlternateImages', 'sDL_GetSurfaceImages', 'sDL_SurfaceHasAlternateImages'
--
--     [C declaration]: @SDL_AddSurfaceAlternateImage@, defined at @SDL3\/SDL_surface.h 404:34@
sDL_AddSurfaceAlternateImage
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@image@]: a pointer to an alternate 'SDL_Surface' to associate with this surface.
  -> IO BG.CBool
sDL_AddSurfaceAlternateImage =
  hs_bindgen_36366ea481866b40

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SurfaceHasAlternateImages@
foreign import ccall unsafe "hs_bindgen_c8c9d6b2ea4d4292"
  hs_bindgen_c8c9d6b2ea4d4292_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SurfaceHasAlternateImages@
hs_bindgen_c8c9d6b2ea4d4292
  :: BG.Ptr SDL_Surface
  -> IO BG.CBool
hs_bindgen_c8c9d6b2ea4d4292 =
  BG.fromFFIType hs_bindgen_c8c9d6b2ea4d4292_base

-- | Return whether a surface has alternate versions available.
--
--     [Returns]: true if alternate versions are available or false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddSurfaceAlternateImage', 'sDL_RemoveSurfaceAlternateImages', 'sDL_GetSurfaceImages'
--
--     [C declaration]: @SDL_SurfaceHasAlternateImages@, defined at @SDL3\/SDL_surface.h 420:34@
sDL_SurfaceHasAlternateImages
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO BG.CBool
sDL_SurfaceHasAlternateImages =
  hs_bindgen_c8c9d6b2ea4d4292

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceImages@
foreign import ccall unsafe "hs_bindgen_b3d55dcc42d5db12"
  hs_bindgen_b3d55dcc42d5db12_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceImages@
hs_bindgen_b3d55dcc42d5db12
  :: BG.Ptr SDL_Surface
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr SDL_Surface))
hs_bindgen_b3d55dcc42d5db12 =
  BG.fromFFIType hs_bindgen_b3d55dcc42d5db12_base

-- | Get an array including all versions of a surface.
--
--     This returns all versions of a surface, with the surface being queried as the first element in the returned array.
--
--     Freeing the array of surfaces does not affect the surfaces in the array. They are still referenced by the surface being queried and will be cleaned up normally.
--
--     [Returns]: a NULL terminated array of 'SDL_Surface' pointers or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddSurfaceAlternateImage', 'sDL_RemoveSurfaceAlternateImages', 'sDL_SurfaceHasAlternateImages'
--
--     [C declaration]: @SDL_GetSurfaceImages@, defined at @SDL3\/SDL_surface.h 448:44@
sDL_GetSurfaceImages
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of surface pointers returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Surface))
sDL_GetSurfaceImages = hs_bindgen_b3d55dcc42d5db12

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_RemoveSurfaceAlternateImages@
foreign import ccall unsafe "hs_bindgen_1adedb2719efa1bf"
  hs_bindgen_1adedb2719efa1bf_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_RemoveSurfaceAlternateImages@
hs_bindgen_1adedb2719efa1bf
  :: BG.Ptr SDL_Surface
  -> IO ()
hs_bindgen_1adedb2719efa1bf =
  BG.fromFFIType hs_bindgen_1adedb2719efa1bf_base

-- | Remove all alternate versions of a surface.
--
--     This function removes a reference from all the alternative versions, destroying them if this is the last reference to them.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddSurfaceAlternateImage', 'sDL_GetSurfaceImages', 'sDL_SurfaceHasAlternateImages'
--
--     [C declaration]: @SDL_RemoveSurfaceAlternateImages@, defined at @SDL3\/SDL_surface.h 467:34@
sDL_RemoveSurfaceAlternateImages
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> IO ()
sDL_RemoveSurfaceAlternateImages =
  hs_bindgen_1adedb2719efa1bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LockSurface@
foreign import ccall unsafe "hs_bindgen_8363af1ae03d45b9"
  hs_bindgen_8363af1ae03d45b9_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LockSurface@
hs_bindgen_8363af1ae03d45b9
  :: BG.Ptr SDL_Surface
  -> IO BG.CBool
hs_bindgen_8363af1ae03d45b9 =
  BG.fromFFIType hs_bindgen_8363af1ae03d45b9_base

-- | Set up a surface for directly accessing the pixels.
--
--     Between calls to @SDL_LockSurface()@ \/ @SDL_UnlockSurface()@, you can write to and read from @surface->pixels@, using the pixel format stored in @surface->format@. Once you are done accessing the surface, you should use @SDL_UnlockSurface()@ to release it.
--
--     Not all surfaces require locking. If @SDL_MUSTLOCK(surface)@ evaluates to 0, then you can read and write to the surface at any time, and the pixel format of the surface will not change.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces. The locking referred to by this function is making the pixels available for direct access, not thread-safe locking.
--
--     @since 3.2.0
--
--     [See also]: @SDL_MUSTLOCK@, 'sDL_UnlockSurface'
--
--     [C declaration]: @SDL_LockSurface@, defined at @SDL3\/SDL_surface.h 495:34@
sDL_LockSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to be locked.
  -> IO BG.CBool
sDL_LockSurface = hs_bindgen_8363af1ae03d45b9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_UnlockSurface@
foreign import ccall unsafe "hs_bindgen_0b94cbec8aca2abc"
  hs_bindgen_0b94cbec8aca2abc_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_UnlockSurface@
hs_bindgen_0b94cbec8aca2abc
  :: BG.Ptr SDL_Surface
  -> IO ()
hs_bindgen_0b94cbec8aca2abc =
  BG.fromFFIType hs_bindgen_0b94cbec8aca2abc_base

-- | Release a surface after directly accessing the pixels.
--
--     [Thread safety]: This function is not thread safe. The locking referred to by this function is making the pixels available for direct access, not thread-safe locking.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockSurface'
--
--     [C declaration]: @SDL_UnlockSurface@, defined at @SDL3\/SDL_surface.h 510:34@
sDL_UnlockSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to be unlocked.
  -> IO ()
sDL_UnlockSurface = hs_bindgen_0b94cbec8aca2abc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadSurface_IO@
foreign import ccall unsafe "hs_bindgen_1a1549d61e2d7c6f"
  hs_bindgen_1a1549d61e2d7c6f_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadSurface_IO@
hs_bindgen_1a1549d61e2d7c6f
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -> BG.CBool
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_1a1549d61e2d7c6f =
  BG.fromFFIType hs_bindgen_1a1549d61e2d7c6f_base

-- | Load a BMP or PNG image from a seekable SDL data stream.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_DestroySurface', 'sDL_LoadSurface'
--
--     [C declaration]: @SDL_LoadSurface_IO@, defined at @SDL3\/SDL_surface.h 531:43@
sDL_LoadSurface_IO
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the surface.
  -> BG.CBool
  -- ^
  --
  --           [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr SDL_Surface)
sDL_LoadSurface_IO = hs_bindgen_1a1549d61e2d7c6f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadSurface@
foreign import ccall unsafe "hs_bindgen_84c82bda97a82d45"
  hs_bindgen_84c82bda97a82d45_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadSurface@
hs_bindgen_84c82bda97a82d45
  :: PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_84c82bda97a82d45 =
  BG.fromFFIType hs_bindgen_84c82bda97a82d45_base

-- | Load a BMP or PNG image from a file.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_DestroySurface', 'sDL_LoadSurface_IO'
--
--     [C declaration]: @SDL_LoadSurface@, defined at @SDL3\/SDL_surface.h 550:43@
sDL_LoadSurface
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the file to load.
  -> IO (BG.Ptr SDL_Surface)
sDL_LoadSurface = hs_bindgen_84c82bda97a82d45

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadBMP_IO@
foreign import ccall unsafe "hs_bindgen_04dc7704680e62ca"
  hs_bindgen_04dc7704680e62ca_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadBMP_IO@
hs_bindgen_04dc7704680e62ca
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -> BG.CBool
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_04dc7704680e62ca =
  BG.fromFFIType hs_bindgen_04dc7704680e62ca_base

-- | Load a BMP image from a seekable SDL data stream.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroySurface', 'sDL_LoadBMP', 'sDL_SaveBMP_IO'
--
--     [C declaration]: @SDL_LoadBMP_IO@, defined at @SDL3\/SDL_surface.h 572:43@
sDL_LoadBMP_IO
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the surface.
  -> BG.CBool
  -- ^
  --
  --           [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr SDL_Surface)
sDL_LoadBMP_IO = hs_bindgen_04dc7704680e62ca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadBMP@
foreign import ccall unsafe "hs_bindgen_fade244cdadaaa01"
  hs_bindgen_fade244cdadaaa01_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadBMP@
hs_bindgen_fade244cdadaaa01
  :: PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_fade244cdadaaa01 =
  BG.fromFFIType hs_bindgen_fade244cdadaaa01_base

-- | Load a BMP image from a file.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroySurface', 'sDL_LoadBMP_IO', 'sDL_SaveBMP'
--
--     [C declaration]: @SDL_LoadBMP@, defined at @SDL3\/SDL_surface.h 592:43@
sDL_LoadBMP
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the BMP file to load.
  -> IO (BG.Ptr SDL_Surface)
sDL_LoadBMP = hs_bindgen_fade244cdadaaa01

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SaveBMP_IO@
foreign import ccall unsafe "hs_bindgen_9c98f1ae4256924d"
  hs_bindgen_9c98f1ae4256924d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SaveBMP_IO@
hs_bindgen_9c98f1ae4256924d
  :: BG.Ptr SDL_Surface
  -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_9c98f1ae4256924d =
  BG.fromFFIType hs_bindgen_9c98f1ae4256924d_base

-- | Save a surface to a seekable SDL data stream in BMP format.
--
--     Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the BMP directly. Other RGB formats with 8-bit or higher get converted to a 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit surface before they are saved. YUV and paletted 1-bit and 4-bit formats are not supported.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LoadBMP_IO', 'sDL_SaveBMP'
--
--     [C declaration]: @SDL_SaveBMP_IO@, defined at @SDL3\/SDL_surface.h 618:34@
sDL_SaveBMP_IO
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@dst@]: a data stream to save to.
  -> BG.CBool
  -- ^
  --
  --           [@closeio@]: if true, calls SDL_CloseIO() on @dst@ before returning, even in the case of an error.
  -> IO BG.CBool
sDL_SaveBMP_IO = hs_bindgen_9c98f1ae4256924d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SaveBMP@
foreign import ccall unsafe "hs_bindgen_66fb79ef3bca90df"
  hs_bindgen_66fb79ef3bca90df_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SaveBMP@
hs_bindgen_66fb79ef3bca90df
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_66fb79ef3bca90df =
  BG.fromFFIType hs_bindgen_66fb79ef3bca90df_base

-- | Save a surface to a file in BMP format.
--
--     Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the BMP directly. Other RGB formats with 8-bit or higher get converted to a 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit surface before they are saved. YUV and paletted 1-bit and 4-bit formats are not supported.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LoadBMP', 'sDL_SaveBMP_IO'
--
--     [C declaration]: @SDL_SaveBMP@, defined at @SDL3\/SDL_surface.h 642:34@
sDL_SaveBMP
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a file to save to.
  -> IO BG.CBool
sDL_SaveBMP = hs_bindgen_66fb79ef3bca90df

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadPNG_IO@
foreign import ccall unsafe "hs_bindgen_7160fe58e1c51f22"
  hs_bindgen_7160fe58e1c51f22_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadPNG_IO@
hs_bindgen_7160fe58e1c51f22
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -> BG.CBool
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_7160fe58e1c51f22 =
  BG.fromFFIType hs_bindgen_7160fe58e1c51f22_base

-- | Load a PNG image from a seekable SDL data stream.
--
--     This is intended as a convenience function for loading images from trusted sources. If you want to load arbitrary images you should use libpng or another image loading library designed with security in mind.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_DestroySurface', 'sDL_LoadPNG', 'sDL_SavePNG_IO'
--
--     [C declaration]: @SDL_LoadPNG_IO@, defined at @SDL3\/SDL_surface.h 668:43@
sDL_LoadPNG_IO
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the surface.
  -> BG.CBool
  -- ^
  --
  --           [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr SDL_Surface)
sDL_LoadPNG_IO = hs_bindgen_7160fe58e1c51f22

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadPNG@
foreign import ccall unsafe "hs_bindgen_bc316d886d9c3957"
  hs_bindgen_bc316d886d9c3957_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_LoadPNG@
hs_bindgen_bc316d886d9c3957
  :: PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_bc316d886d9c3957 =
  BG.fromFFIType hs_bindgen_bc316d886d9c3957_base

-- | Load a PNG image from a file.
--
--     This is intended as a convenience function for loading images from trusted sources. If you want to load arbitrary images you should use libpng or another image loading library designed with security in mind.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_DestroySurface', 'sDL_LoadPNG_IO', 'sDL_SavePNG'
--
--     [C declaration]: @SDL_LoadPNG@, defined at @SDL3\/SDL_surface.h 692:43@
sDL_LoadPNG
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the PNG file to load.
  -> IO (BG.Ptr SDL_Surface)
sDL_LoadPNG = hs_bindgen_bc316d886d9c3957

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SavePNG_IO@
foreign import ccall unsafe "hs_bindgen_9c8e4c9fc901ee28"
  hs_bindgen_9c8e4c9fc901ee28_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SavePNG_IO@
hs_bindgen_9c8e4c9fc901ee28
  :: BG.Ptr SDL_Surface
  -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_9c8e4c9fc901ee28 =
  BG.fromFFIType hs_bindgen_9c8e4c9fc901ee28_base

-- | Save a surface to a seekable SDL data stream in PNG format.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_LoadPNG_IO', 'sDL_SavePNG'
--
--     [C declaration]: @SDL_SavePNG_IO@, defined at @SDL3\/SDL_surface.h 712:34@
sDL_SavePNG_IO
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@dst@]: a data stream to save to.
  -> BG.CBool
  -- ^
  --
  --           [@closeio@]: if true, calls SDL_CloseIO() on @dst@ before returning, even in the case of an error.
  -> IO BG.CBool
sDL_SavePNG_IO = hs_bindgen_9c8e4c9fc901ee28

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SavePNG@
foreign import ccall unsafe "hs_bindgen_759469fef46a8cd4"
  hs_bindgen_759469fef46a8cd4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SavePNG@
hs_bindgen_759469fef46a8cd4
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_759469fef46a8cd4 =
  BG.fromFFIType hs_bindgen_759469fef46a8cd4_base

-- | Save a surface to a file in PNG format.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_LoadPNG', 'sDL_SavePNG_IO'
--
--     [C declaration]: @SDL_SavePNG@, defined at @SDL3\/SDL_surface.h 730:34@
sDL_SavePNG
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a file to save to.
  -> IO BG.CBool
sDL_SavePNG = hs_bindgen_759469fef46a8cd4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceRLE@
foreign import ccall unsafe "hs_bindgen_5d1b864a1323d92d"
  hs_bindgen_5d1b864a1323d92d_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceRLE@
hs_bindgen_5d1b864a1323d92d
  :: BG.Ptr SDL_Surface
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_5d1b864a1323d92d =
  BG.fromFFIType hs_bindgen_5d1b864a1323d92d_base

-- | Set the RLE acceleration hint for a surface.
--
--     If RLE is enabled, color key and alpha blending blits are much faster, but the surface must be locked before directly accessing the pixels.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitSurface', 'sDL_LockSurface', 'sDL_UnlockSurface'
--
--     [C declaration]: @SDL_SetSurfaceRLE@, defined at @SDL3\/SDL_surface.h 752:34@
sDL_SetSurfaceRLE
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to optimize.
  -> BG.CBool
  -- ^
  --
  --           [@enabled@]: true to enable RLE acceleration, false to disable it.
  -> IO BG.CBool
sDL_SetSurfaceRLE = hs_bindgen_5d1b864a1323d92d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SurfaceHasRLE@
foreign import ccall unsafe "hs_bindgen_b51ce9068c82d3d0"
  hs_bindgen_b51ce9068c82d3d0_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SurfaceHasRLE@
hs_bindgen_b51ce9068c82d3d0
  :: BG.Ptr SDL_Surface
  -> IO BG.CBool
hs_bindgen_b51ce9068c82d3d0 =
  BG.fromFFIType hs_bindgen_b51ce9068c82d3d0_base

-- | Returns whether the surface is RLE enabled.
--
--     It is safe to pass a NULL @surface@ here; it will return false.
--
--     [Returns]: true if the surface is RLE enabled, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetSurfaceRLE'
--
--     [C declaration]: @SDL_SurfaceHasRLE@, defined at @SDL3\/SDL_surface.h 768:34@
sDL_SurfaceHasRLE
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO BG.CBool
sDL_SurfaceHasRLE = hs_bindgen_b51ce9068c82d3d0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceColorKey@
foreign import ccall unsafe "hs_bindgen_13efdbaff73dc30f"
  hs_bindgen_13efdbaff73dc30f_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceColorKey@
hs_bindgen_13efdbaff73dc30f
  :: BG.Ptr SDL_Surface
  -> BG.CBool
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_13efdbaff73dc30f =
  BG.fromFFIType hs_bindgen_13efdbaff73dc30f_base

-- | Set the color key (transparent pixel) in a surface.
--
--     The color key defines a pixel value that will be treated as transparent in a blit. For example, one can use this to specify that cyan pixels should be considered transparent, and therefore not rendered.
--
--     It is a pixel of the format used by the surface, as generated by SDL_MapRGB().
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetSurfaceColorKey', 'sDL_SetSurfaceRLE', 'sDL_SurfaceHasColorKey'
--
--     [C declaration]: @SDL_SetSurfaceColorKey@, defined at @SDL3\/SDL_surface.h 795:34@
sDL_SetSurfaceColorKey
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.CBool
  -- ^
  --
  --           [@enabled@]: true to enable color key, false to disable color key.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@key@]: the transparent pixel.
  -> IO BG.CBool
sDL_SetSurfaceColorKey = hs_bindgen_13efdbaff73dc30f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SurfaceHasColorKey@
foreign import ccall unsafe "hs_bindgen_998ae6f993d45bac"
  hs_bindgen_998ae6f993d45bac_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SurfaceHasColorKey@
hs_bindgen_998ae6f993d45bac
  :: BG.Ptr SDL_Surface
  -> IO BG.CBool
hs_bindgen_998ae6f993d45bac =
  BG.fromFFIType hs_bindgen_998ae6f993d45bac_base

-- | Returns whether the surface has a color key.
--
--     It is safe to pass a NULL @surface@ here; it will return false.
--
--     [Returns]: true if the surface has a color key, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetSurfaceColorKey', 'sDL_GetSurfaceColorKey'
--
--     [C declaration]: @SDL_SurfaceHasColorKey@, defined at @SDL3\/SDL_surface.h 812:34@
sDL_SurfaceHasColorKey
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO BG.CBool
sDL_SurfaceHasColorKey = hs_bindgen_998ae6f993d45bac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceColorKey@
foreign import ccall unsafe "hs_bindgen_463737aa98969701"
  hs_bindgen_463737aa98969701_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceColorKey@
hs_bindgen_463737aa98969701
  :: BG.Ptr SDL_Surface
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_463737aa98969701 =
  BG.fromFFIType hs_bindgen_463737aa98969701_base

-- | Get the color key (transparent pixel) for a surface.
--
--     The color key is a pixel of the format used by the surface, as generated by SDL_MapRGB().
--
--     If the surface doesn\'t have color key enabled this function returns false.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetSurfaceColorKey', 'sDL_SurfaceHasColorKey'
--
--     [C declaration]: @SDL_GetSurfaceColorKey@, defined at @SDL3\/SDL_surface.h 834:34@
sDL_GetSurfaceColorKey
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@key@]: a pointer filled in with the transparent pixel.
  -> IO BG.CBool
sDL_GetSurfaceColorKey = hs_bindgen_463737aa98969701

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceColorMod@
foreign import ccall unsafe "hs_bindgen_5802144e4d11fa38"
  hs_bindgen_5802144e4d11fa38_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceColorMod@
hs_bindgen_5802144e4d11fa38
  :: BG.Ptr SDL_Surface
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_5802144e4d11fa38 =
  BG.fromFFIType hs_bindgen_5802144e4d11fa38_base

-- | Set an additional color value multiplied into blit operations.
--
--     When this surface is blitted, during the blit operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * (color \/ 255)@
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetSurfaceColorMod', 'sDL_SetSurfaceAlphaMod'
--
--     [C declaration]: @SDL_SetSurfaceColorMod@, defined at @SDL3\/SDL_surface.h 860:34@
sDL_SetSurfaceColorMod
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: the red color value multiplied into blit operations.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: the green color value multiplied into blit operations.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: the blue color value multiplied into blit operations.
  -> IO BG.CBool
sDL_SetSurfaceColorMod = hs_bindgen_5802144e4d11fa38

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceColorMod@
foreign import ccall unsafe "hs_bindgen_8f67dce9db98e6f9"
  hs_bindgen_8f67dce9db98e6f9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceColorMod@
hs_bindgen_8f67dce9db98e6f9
  :: BG.Ptr SDL_Surface
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_8f67dce9db98e6f9 =
  BG.fromFFIType hs_bindgen_8f67dce9db98e6f9_base

-- | Get the additional color value multiplied into blit operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetSurfaceAlphaMod', 'sDL_SetSurfaceColorMod'
--
--     [C declaration]: @SDL_GetSurfaceColorMod@, defined at @SDL3\/SDL_surface.h 881:34@
sDL_GetSurfaceColorMod
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
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
sDL_GetSurfaceColorMod = hs_bindgen_8f67dce9db98e6f9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceAlphaMod@
foreign import ccall unsafe "hs_bindgen_2f27871d133fe193"
  hs_bindgen_2f27871d133fe193_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceAlphaMod@
hs_bindgen_2f27871d133fe193
  :: BG.Ptr SDL_Surface
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_2f27871d133fe193 =
  BG.fromFFIType hs_bindgen_2f27871d133fe193_base

-- | Set an additional alpha value used in blit operations.
--
--     When this surface is blitted, during the blit operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * (alpha \/ 255)@
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetSurfaceAlphaMod', 'sDL_SetSurfaceColorMod'
--
--     [C declaration]: @SDL_SetSurfaceAlphaMod@, defined at @SDL3\/SDL_surface.h 904:34@
sDL_SetSurfaceAlphaMod
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@alpha@]: the alpha value multiplied into blit operations.
  -> IO BG.CBool
sDL_SetSurfaceAlphaMod = hs_bindgen_2f27871d133fe193

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceAlphaMod@
foreign import ccall unsafe "hs_bindgen_62e7ffa57cc86c89"
  hs_bindgen_62e7ffa57cc86c89_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceAlphaMod@
hs_bindgen_62e7ffa57cc86c89
  :: BG.Ptr SDL_Surface
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_62e7ffa57cc86c89 =
  BG.fromFFIType hs_bindgen_62e7ffa57cc86c89_base

-- | Get the additional alpha value used in blit operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetSurfaceColorMod', 'sDL_SetSurfaceAlphaMod'
--
--     [C declaration]: @SDL_GetSurfaceAlphaMod@, defined at @SDL3\/SDL_surface.h 921:34@
sDL_GetSurfaceAlphaMod
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@alpha@]: a pointer filled in with the current alpha value.
  -> IO BG.CBool
sDL_GetSurfaceAlphaMod = hs_bindgen_62e7ffa57cc86c89

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceBlendMode@
foreign import ccall unsafe "hs_bindgen_31b5f1226bf51118"
  hs_bindgen_31b5f1226bf51118_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceBlendMode@
hs_bindgen_31b5f1226bf51118
  :: BG.Ptr SDL_Surface
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -> IO BG.CBool
hs_bindgen_31b5f1226bf51118 =
  BG.fromFFIType hs_bindgen_31b5f1226bf51118_base

-- | Set the blend mode used for blit operations.
--
--     To copy a surface to another surface (or texture) without blending with the existing data, the blendmode of the SOURCE surface should be set to @SDL_BLENDMODE_NONE@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetSurfaceBlendMode'
--
--     [C declaration]: @SDL_SetSurfaceBlendMode@, defined at @SDL3\/SDL_surface.h 942:34@
sDL_SetSurfaceBlendMode
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: the SDL_BlendMode to use for blit blending.
  -> IO BG.CBool
sDL_SetSurfaceBlendMode = hs_bindgen_31b5f1226bf51118

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceBlendMode@
foreign import ccall unsafe "hs_bindgen_e69bee46110b6faa"
  hs_bindgen_e69bee46110b6faa_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceBlendMode@
hs_bindgen_e69bee46110b6faa
  :: BG.Ptr SDL_Surface
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -> IO BG.CBool
hs_bindgen_e69bee46110b6faa =
  BG.fromFFIType hs_bindgen_e69bee46110b6faa_base

-- | Get the blend mode used for blit operations.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetSurfaceBlendMode'
--
--     [C declaration]: @SDL_GetSurfaceBlendMode@, defined at @SDL3\/SDL_surface.h 958:34@
sDL_GetSurfaceBlendMode
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
  -> IO BG.CBool
sDL_GetSurfaceBlendMode = hs_bindgen_e69bee46110b6faa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceClipRect@
foreign import ccall unsafe "hs_bindgen_d3f690ca2bc82289"
  hs_bindgen_d3f690ca2bc82289_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_SetSurfaceClipRect@
hs_bindgen_d3f690ca2bc82289
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_d3f690ca2bc82289 =
  BG.fromFFIType hs_bindgen_d3f690ca2bc82289_base

-- | Set the clipping rectangle for a surface.
--
--     When @surface@ is the destination of a blit, only the area within the clip rectangle is drawn into.
--
--     Note that blits are automatically clipped to the edges of the source and destination surfaces.
--
--     [Returns]: true if the rectangle intersects the surface, otherwise false and blits will be completely clipped.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetSurfaceClipRect'
--
--     [C declaration]: @SDL_SetSurfaceClipRect@, defined at @SDL3\/SDL_surface.h 982:34@
sDL_SetSurfaceClipRect
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to be clipped.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure representing the clipping rectangle, or NULL to disable clipping.
  -> IO BG.CBool
sDL_SetSurfaceClipRect = hs_bindgen_d3f690ca2bc82289

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceClipRect@
foreign import ccall unsafe "hs_bindgen_510cbf12ad718ad5"
  hs_bindgen_510cbf12ad718ad5_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_GetSurfaceClipRect@
hs_bindgen_510cbf12ad718ad5
  :: BG.Ptr SDL_Surface
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_510cbf12ad718ad5 =
  BG.fromFFIType hs_bindgen_510cbf12ad718ad5_base

-- | Get the clipping rectangle for a surface.
--
--     When @surface@ is the destination of a blit, only the area within the clip rectangle is drawn into.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetSurfaceClipRect'
--
--     [C declaration]: @SDL_GetSurfaceClipRect@, defined at @SDL3\/SDL_surface.h 1004:34@
sDL_GetSurfaceClipRect
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure representing the surface to be clipped.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure filled in with the clipping rectangle for the surface.
  -> IO BG.CBool
sDL_GetSurfaceClipRect = hs_bindgen_510cbf12ad718ad5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_FlipSurface@
foreign import ccall unsafe "hs_bindgen_c9050e1a6dbcc389"
  hs_bindgen_c9050e1a6dbcc389_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_FlipSurface@
hs_bindgen_c9050e1a6dbcc389
  :: BG.Ptr SDL_Surface
  -> SDL_FlipMode
  -> IO BG.CBool
hs_bindgen_c9050e1a6dbcc389 =
  BG.fromFFIType hs_bindgen_c9050e1a6dbcc389_base

-- | Flip a surface vertically or horizontally.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_FlipSurface@, defined at @SDL3\/SDL_surface.h 1019:34@
sDL_FlipSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to flip.
  -> SDL_FlipMode
  -- ^
  --
  --           [@flip@]: the direction to flip.
  -> IO BG.CBool
sDL_FlipSurface = hs_bindgen_c9050e1a6dbcc389

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_RotateSurface@
foreign import ccall unsafe "hs_bindgen_b68c60a70d17f528"
  hs_bindgen_b68c60a70d17f528_base
    :: BG.Ptr BG.Void
    -> Float
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_RotateSurface@
hs_bindgen_b68c60a70d17f528
  :: BG.Ptr SDL_Surface
  -> BG.CFloat
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_b68c60a70d17f528 =
  BG.fromFFIType hs_bindgen_b68c60a70d17f528_base

-- | Return a copy of a surface rotated clockwise a number of degrees.
--
--     The angle of rotation can be negative for counter-clockwise rotation.
--
--     When the rotation isn\'t a multiple of 90 degrees, the resulting surface is larger than the original, with the background filled in with the colorkey, if available, or RGBA 255\/255\/255\/0 if not.
--
--     If @surface@ has the SDL_PROP_SURFACE_ROTATION_FLOAT property set on it, the new copy will have the adjusted value set: if the rotation property is 90 and @angle@ was 30, the new surface will have a property value of 60 (that is: to be upright vs gravity, this surface needs to rotate 60 more degrees). However, note that further rotations on the new surface in this example will produce unexpected results, since the image will have resized and padded to accommodate the not-90 degree angle.
--
--     [Returns]: a rotated copy of the surface or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_RotateSurface@, defined at @SDL3\/SDL_surface.h 1048:43@
sDL_RotateSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to rotate.
  -> BG.CFloat
  -- ^
  --
  --           [@angle@]: the rotation angle, in degrees.
  -> IO (BG.Ptr SDL_Surface)
sDL_RotateSurface = hs_bindgen_b68c60a70d17f528

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_DuplicateSurface@
foreign import ccall unsafe "hs_bindgen_fb5b3c5560c73662"
  hs_bindgen_fb5b3c5560c73662_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_DuplicateSurface@
hs_bindgen_fb5b3c5560c73662
  :: BG.Ptr SDL_Surface
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_fb5b3c5560c73662 =
  BG.fromFFIType hs_bindgen_fb5b3c5560c73662_base

-- | Creates a new surface identical to the existing surface.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     The returned surface should be freed with @SDL_DestroySurface()@.
--
--     [Returns]: a copy of the surface or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroySurface'
--
--     [C declaration]: @SDL_DuplicateSurface@, defined at @SDL3\/SDL_surface.h 1069:43@
sDL_DuplicateSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to duplicate.
  -> IO (BG.Ptr SDL_Surface)
sDL_DuplicateSurface = hs_bindgen_fb5b3c5560c73662

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ScaleSurface@
foreign import ccall unsafe "hs_bindgen_302fe5f6d166cef5"
  hs_bindgen_302fe5f6d166cef5_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ScaleSurface@
hs_bindgen_302fe5f6d166cef5
  :: BG.Ptr SDL_Surface
  -> BG.CInt
  -> BG.CInt
  -> SDL_ScaleMode
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_302fe5f6d166cef5 =
  BG.fromFFIType hs_bindgen_302fe5f6d166cef5_base

-- | Creates a new surface identical to the existing surface, scaled to the desired size.
--
--     The returned surface should be freed with @SDL_DestroySurface()@.
--
--     [Returns]: a copy of the surface or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroySurface'
--
--     [C declaration]: @SDL_ScaleSurface@, defined at @SDL3\/SDL_surface.h 1091:43@
sDL_ScaleSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to duplicate and scale.
  -> BG.CInt
  -- ^
  --
  --           [@width@]: the width of the new surface.
  -> BG.CInt
  -- ^
  --
  --           [@height@]: the height of the new surface.
  -> SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: the 'SDL_ScaleMode' to be used.
  -> IO (BG.Ptr SDL_Surface)
sDL_ScaleSurface = hs_bindgen_302fe5f6d166cef5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ConvertSurface@
foreign import ccall unsafe "hs_bindgen_2d38a11d9ed40ec3"
  hs_bindgen_2d38a11d9ed40ec3_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ConvertSurface@
hs_bindgen_2d38a11d9ed40ec3
  :: BG.Ptr SDL_Surface
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_2d38a11d9ed40ec3 =
  BG.fromFFIType hs_bindgen_2d38a11d9ed40ec3_base

-- | Copy an existing surface to a new surface of the specified format.
--
--     This function is used to optimize images for faster /repeat/ blitting. This is accomplished by converting the original and storing the result as a new surface. The new, optimized surface can then be used as the source for future blits, making them faster.
--
--     If you are converting to an indexed surface and want to map colors to a palette, you can use @SDL_ConvertSurfaceAndColorspace()@ instead.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ConvertSurfaceAndColorspace', 'sDL_DestroySurface'
--
--     [C declaration]: @SDL_ConvertSurface@, defined at @SDL3\/SDL_surface.h 1120:43@
sDL_ConvertSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the existing 'SDL_Surface' structure to convert.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the new pixel format.
  -> IO (BG.Ptr SDL_Surface)
sDL_ConvertSurface = hs_bindgen_2d38a11d9ed40ec3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ConvertSurfaceAndColorspace@
foreign import ccall unsafe "hs_bindgen_589af8fb0fd3b451"
  hs_bindgen_589af8fb0fd3b451_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ConvertSurfaceAndColorspace@
hs_bindgen_589af8fb0fd3b451
  :: BG.Ptr SDL_Surface
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO (BG.Ptr SDL_Surface)
hs_bindgen_589af8fb0fd3b451 =
  BG.fromFFIType hs_bindgen_589af8fb0fd3b451_base

-- | Copy an existing surface to a new surface of the specified format and colorspace.
--
--     This function converts an existing surface to a new format and colorspace and returns the new surface. This will perform any pixel format and colorspace conversion needed.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ConvertSurface', 'sDL_DestroySurface'
--
--     [C declaration]: @SDL_ConvertSurfaceAndColorspace@, defined at @SDL3\/SDL_surface.h 1149:43@
sDL_ConvertSurfaceAndColorspace
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the existing 'SDL_Surface' structure to convert.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the new pixel format.
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -- ^
  --
  --           [@palette@]: an optional palette to use for indexed formats, may be NULL.
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@colorspace@]: the new colorspace.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: an SDL_PropertiesID with additional color properties, or 0.
  -> IO (BG.Ptr SDL_Surface)
sDL_ConvertSurfaceAndColorspace =
  hs_bindgen_589af8fb0fd3b451

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ConvertPixels@
foreign import ccall unsafe "hs_bindgen_c4ac87b53bb7fbaa"
  hs_bindgen_c4ac87b53bb7fbaa_base
    :: BG.Int32
    -> BG.Int32
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ConvertPixels@
hs_bindgen_c4ac87b53bb7fbaa
  :: BG.CInt
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> PtrConst.PtrConst BG.Void
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> BG.Ptr BG.Void
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_c4ac87b53bb7fbaa =
  BG.fromFFIType hs_bindgen_c4ac87b53bb7fbaa_base

-- | Copy a block of pixels of one format to another format.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ConvertPixelsAndColorspace'
--
--     [C declaration]: @SDL_ConvertPixels@, defined at @SDL3\/SDL_surface.h 1173:34@
sDL_ConvertPixels
  :: BG.CInt
  -- ^
  --
  --           [@width@]: the width of the block to copy, in pixels.
  -> BG.CInt
  -- ^
  --
  --           [@height@]: the height of the block to copy, in pixels.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@src_format@]: an SDL_PixelFormat value of the @src@ pixels format.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@src@]: a pointer to the source pixels.
  -> BG.CInt
  -- ^
  --
  --           [@src_pitch@]: the pitch of the source pixels, in bytes.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@dst_format@]: an SDL_PixelFormat value of the @dst@ pixels format.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@dst@]: a pointer to be filled in with new pixel data.
  -> BG.CInt
  -- ^
  --
  --           [@dst_pitch@]: the pitch of the destination pixels, in bytes.
  -> IO BG.CBool
sDL_ConvertPixels = hs_bindgen_c4ac87b53bb7fbaa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ConvertPixelsAndColorspace@
foreign import ccall unsafe "hs_bindgen_384b325525f7f1f3"
  hs_bindgen_384b325525f7f1f3_base
    :: BG.Int32
    -> BG.Int32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ConvertPixelsAndColorspace@
hs_bindgen_384b325525f7f1f3
  :: BG.CInt
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> PtrConst.PtrConst BG.Void
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> BG.Ptr BG.Void
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_384b325525f7f1f3 =
  BG.fromFFIType hs_bindgen_384b325525f7f1f3_base

-- | Copy a block of pixels of one format and colorspace to another format and colorspace.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ConvertPixels'
--
--     [C declaration]: @SDL_ConvertPixelsAndColorspace@, defined at @SDL3\/SDL_surface.h 1206:34@
sDL_ConvertPixelsAndColorspace
  :: BG.CInt
  -- ^
  --
  --           [@width@]: the width of the block to copy, in pixels.
  -> BG.CInt
  -- ^
  --
  --           [@height@]: the height of the block to copy, in pixels.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@src_format@]: an SDL_PixelFormat value of the @src@ pixels format.
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@src_colorspace@]: an SDL_Colorspace value describing the colorspace of the @src@ pixels.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@src_properties@]: an SDL_PropertiesID with additional source color properties, or 0.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@src@]: a pointer to the source pixels.
  -> BG.CInt
  -- ^
  --
  --           [@src_pitch@]: the pitch of the source pixels, in bytes.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@dst_format@]: an SDL_PixelFormat value of the @dst@ pixels format.
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@dst_colorspace@]: an SDL_Colorspace value describing the colorspace of the @dst@ pixels.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@dst_properties@]: an SDL_PropertiesID with additional destination color properties, or 0.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@dst@]: a pointer to be filled in with new pixel data.
  -> BG.CInt
  -- ^
  --
  --           [@dst_pitch@]: the pitch of the destination pixels, in bytes.
  -> IO BG.CBool
sDL_ConvertPixelsAndColorspace =
  hs_bindgen_384b325525f7f1f3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_PremultiplyAlpha@
foreign import ccall unsafe "hs_bindgen_9a5c070f0253ae0a"
  hs_bindgen_9a5c070f0253ae0a_base
    :: BG.Int32
    -> BG.Int32
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_PremultiplyAlpha@
hs_bindgen_9a5c070f0253ae0a
  :: BG.CInt
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> PtrConst.PtrConst BG.Void
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> BG.Ptr BG.Void
  -> BG.CInt
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_9a5c070f0253ae0a =
  BG.fromFFIType hs_bindgen_9a5c070f0253ae0a_base

-- | Premultiply the alpha on a block of pixels.
--
--     This is safe to use with src == dst, but not for other overlapping areas.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PremultiplyAlpha@, defined at @SDL3\/SDL_surface.h 1232:34@
sDL_PremultiplyAlpha
  :: BG.CInt
  -- ^
  --
  --           [@width@]: the width of the block to convert, in pixels.
  -> BG.CInt
  -- ^
  --
  --           [@height@]: the height of the block to convert, in pixels.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@src_format@]: an SDL_PixelFormat value of the @src@ pixels format.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@src@]: a pointer to the source pixels.
  -> BG.CInt
  -- ^
  --
  --           [@src_pitch@]: the pitch of the source pixels, in bytes.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@dst_format@]: an SDL_PixelFormat value of the @dst@ pixels format.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@dst@]: a pointer to be filled in with premultiplied pixel data.
  -> BG.CInt
  -- ^
  --
  --           [@dst_pitch@]: the pitch of the destination pixels, in bytes.
  -> BG.CBool
  -- ^
  --
  --           [@linear@]: true to convert from sRGB to linear space for the alpha multiplication, false to do multiplication in sRGB space.
  -> IO BG.CBool
sDL_PremultiplyAlpha = hs_bindgen_9a5c070f0253ae0a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_PremultiplySurfaceAlpha@
foreign import ccall unsafe "hs_bindgen_7065a7a3bd7041c8"
  hs_bindgen_7065a7a3bd7041c8_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_PremultiplySurfaceAlpha@
hs_bindgen_7065a7a3bd7041c8
  :: BG.Ptr SDL_Surface
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_7065a7a3bd7041c8 =
  BG.fromFFIType hs_bindgen_7065a7a3bd7041c8_base

-- | Premultiply the alpha in a surface.
--
--     This is safe to use with src == dst, but not for other overlapping areas.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PremultiplySurfaceAlpha@, defined at @SDL3\/SDL_surface.h 1250:34@
sDL_PremultiplySurfaceAlpha
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to modify.
  -> BG.CBool
  -- ^
  --
  --           [@linear@]: true to convert from sRGB to linear space for the alpha multiplication, false to do multiplication in sRGB space.
  -> IO BG.CBool
sDL_PremultiplySurfaceAlpha =
  hs_bindgen_7065a7a3bd7041c8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ClearSurface@
foreign import ccall unsafe "hs_bindgen_de44f8d6106c7e71"
  hs_bindgen_de44f8d6106c7e71_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ClearSurface@
hs_bindgen_de44f8d6106c7e71
  :: BG.Ptr SDL_Surface
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_de44f8d6106c7e71 =
  BG.fromFFIType hs_bindgen_de44f8d6106c7e71_base

-- | Clear a surface with a specific color, with floating point precision.
--
--     This function handles all surface formats, and ignores any clip rectangle.
--
--     If the surface is YUV, the color is assumed to be in the sRGB colorspace, otherwise the color is assumed to be in the colorspace of the surface.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ClearSurface@, defined at @SDL3\/SDL_surface.h 1273:34@
sDL_ClearSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' to clear.
  -> BG.CFloat
  -- ^
  --
  --           [@r@]: the red component of the pixel, normally in the range 0-1.
  -> BG.CFloat
  -- ^
  --
  --           [@g@]: the green component of the pixel, normally in the range 0-1.
  -> BG.CFloat
  -- ^
  --
  --           [@b@]: the blue component of the pixel, normally in the range 0-1.
  -> BG.CFloat
  -- ^
  --
  --           [@a@]: the alpha component of the pixel, normally in the range 0-1.
  -> IO BG.CBool
sDL_ClearSurface = hs_bindgen_de44f8d6106c7e71

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_FillSurfaceRect@
foreign import ccall unsafe "hs_bindgen_8e254769393349cc"
  hs_bindgen_8e254769393349cc_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_FillSurfaceRect@
hs_bindgen_8e254769393349cc
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_8e254769393349cc =
  BG.fromFFIType hs_bindgen_8e254769393349cc_base

-- | Perform a fast fill of a rectangle with a specific color.
--
--     @color@ should be a pixel of the format used by the surface, and can be generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an alpha component then the destination is simply filled with that alpha information, no blending takes place.
--
--     If there is a clip rectangle set on the destination (set via @SDL_SetSurfaceClipRect()@), then this function will fill based on the intersection of the clip rectangle and @rect@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_FillSurfaceRects'
--
--     [C declaration]: @SDL_FillSurfaceRect@, defined at @SDL3\/SDL_surface.h 1301:34@
sDL_FillSurfaceRect
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the drawing target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure representing the rectangle to fill, or NULL to fill the entire surface.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@color@]: the color to fill with.
  -> IO BG.CBool
sDL_FillSurfaceRect = hs_bindgen_8e254769393349cc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_FillSurfaceRects@
foreign import ccall unsafe "hs_bindgen_4eb2bdf51787fb5f"
  hs_bindgen_4eb2bdf51787fb5f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_FillSurfaceRects@
hs_bindgen_4eb2bdf51787fb5f
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_4eb2bdf51787fb5f =
  BG.fromFFIType hs_bindgen_4eb2bdf51787fb5f_base

-- | Perform a fast fill of a set of rectangles with a specific color.
--
--     @color@ should be a pixel of the format used by the surface, and can be generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an alpha component then the destination is simply filled with that alpha information, no blending takes place.
--
--     If there is a clip rectangle set on the destination (set via @SDL_SetSurfaceClipRect()@), then this function will fill based on the intersection of the clip rectangle and @rect@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_FillSurfaceRect'
--
--     [C declaration]: @SDL_FillSurfaceRects@, defined at @SDL3\/SDL_surface.h 1329:34@
sDL_FillSurfaceRects
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the drawing target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rects@]: an array of SDL_Rects representing the rectangles to fill.
  -> BG.CInt
  -- ^
  --
  --           [@count@]: the number of rectangles in the array.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@color@]: the color to fill with.
  -> IO BG.CBool
sDL_FillSurfaceRects = hs_bindgen_4eb2bdf51787fb5f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurface@
foreign import ccall unsafe "hs_bindgen_dd9a2fd8000655e0"
  hs_bindgen_dd9a2fd8000655e0_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurface@
hs_bindgen_dd9a2fd8000655e0
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_dd9a2fd8000655e0 =
  BG.fromFFIType hs_bindgen_dd9a2fd8000655e0_base

-- | Performs a fast blit from the source surface to the destination surface with clipping.
--
--     If either @srcrect@ or @dstrect@ are NULL, the entire surface (@src@ or @dst@) is copied while ensuring clipping to @dst->clip_rect@.
--
--     The blit function should not be called on a locked surface.
--
--     The blit semantics for surfaces with and without blending and colorkey are defined as follows:
--
--     @
--      RGBA->RGB:
--        Source surface blend mode set to SDL_BLENDMODE_BLEND:
--         alpha-blend (using the source alpha-channel and per-surface alpha)
--         SDL_SRCCOLORKEY ignored.
--       Source surface blend mode set to SDL_BLENDMODE_NONE:
--         copy RGB.
--         if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
--         RGB values of the source color key, ignoring alpha in the
--         comparison.
--
--     RGB->RGBA:
--       Source surface blend mode set to SDL_BLENDMODE_BLEND:
--         alpha-blend (using the source per-surface alpha)
--       Source surface blend mode set to SDL_BLENDMODE_NONE:
--         copy RGB, set destination alpha to source per-surface alpha value.
--       both:
--         if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
--         source color key.
--
--     RGBA->RGBA:
--       Source surface blend mode set to SDL_BLENDMODE_BLEND:
--         alpha-blend (using the source alpha-channel and per-surface alpha)
--         SDL_SRCCOLORKEY ignored.
--       Source surface blend mode set to SDL_BLENDMODE_NONE:
--         copy all of RGBA to the destination.
--         if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
--         RGB values of the source color key, ignoring alpha in the
--         comparison.
--
--     RGB->RGB:
--       Source surface blend mode set to SDL_BLENDMODE_BLEND:
--         alpha-blend (using the source per-surface alpha)
--       Source surface blend mode set to SDL_BLENDMODE_NONE:
--         copy RGB.
--       both:
--         if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
--         source color key.
--     @
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitSurfaceScaled'
--
--     [C declaration]: @SDL_BlitSurface@, defined at @SDL3\/SDL_surface.h 1402:34@
sDL_BlitSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the blit target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@dstrect@]: the SDL_Rect structure representing the x and y position in the destination surface, or NULL for (0,0). The width and height are ignored, and are copied from @srcrect@. If you want a specific width and height, you should use @SDL_BlitSurfaceScaled()@.
  -> IO BG.CBool
sDL_BlitSurface = hs_bindgen_dd9a2fd8000655e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceUnchecked@
foreign import ccall unsafe "hs_bindgen_f1d3fd72bc95a376"
  hs_bindgen_f1d3fd72bc95a376_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceUnchecked@
hs_bindgen_f1d3fd72bc95a376
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_f1d3fd72bc95a376 =
  BG.fromFFIType hs_bindgen_f1d3fd72bc95a376_base

-- | Perform low-level surface blitting only.
--
--     This is a semi-private blit function and it performs low-level surface blitting, assuming the input rectangles have already been clipped.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitSurface'
--
--     [C declaration]: @SDL_BlitSurfaceUnchecked@, defined at @SDL3\/SDL_surface.h 1426:34@
sDL_BlitSurfaceUnchecked
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, may not be NULL.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the blit target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, may not be NULL.
  -> IO BG.CBool
sDL_BlitSurfaceUnchecked =
  hs_bindgen_f1d3fd72bc95a376

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceScaled@
foreign import ccall unsafe "hs_bindgen_ca439260becd97fa"
  hs_bindgen_ca439260becd97fa_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceScaled@
hs_bindgen_ca439260becd97fa
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> SDL_ScaleMode
  -> IO BG.CBool
hs_bindgen_ca439260becd97fa =
  BG.fromFFIType hs_bindgen_ca439260becd97fa_base

-- | Perform a scaled blit to a destination surface, which may be of a different format.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitSurface'
--
--     [C declaration]: @SDL_BlitSurfaceScaled@, defined at @SDL3\/SDL_surface.h 1450:34@
sDL_BlitSurfaceScaled
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the blit target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire destination surface.
  -> SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: the 'SDL_ScaleMode' to be used.
  -> IO BG.CBool
sDL_BlitSurfaceScaled = hs_bindgen_ca439260becd97fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceUncheckedScaled@
foreign import ccall unsafe "hs_bindgen_273462ee987888b2"
  hs_bindgen_273462ee987888b2_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceUncheckedScaled@
hs_bindgen_273462ee987888b2
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> SDL_ScaleMode
  -> IO BG.CBool
hs_bindgen_273462ee987888b2 =
  BG.fromFFIType hs_bindgen_273462ee987888b2_base

-- | Perform low-level surface scaled blitting only.
--
--     This is a semi-private function and it performs low-level surface blitting, assuming the input rectangles have already been clipped.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitSurfaceScaled'
--
--     [C declaration]: @SDL_BlitSurfaceUncheckedScaled@, defined at @SDL3\/SDL_surface.h 1475:34@
sDL_BlitSurfaceUncheckedScaled
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, may not be NULL.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the blit target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, may not be NULL.
  -> SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: the 'SDL_ScaleMode' to be used.
  -> IO BG.CBool
sDL_BlitSurfaceUncheckedScaled =
  hs_bindgen_273462ee987888b2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_StretchSurface@
foreign import ccall unsafe "hs_bindgen_cbba042ce7137c9a"
  hs_bindgen_cbba042ce7137c9a_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_StretchSurface@
hs_bindgen_cbba042ce7137c9a
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> SDL_ScaleMode
  -> IO BG.CBool
hs_bindgen_cbba042ce7137c9a =
  BG.fromFFIType hs_bindgen_cbba042ce7137c9a_base

-- | Perform a stretched pixel copy from one surface to another.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_BlitSurfaceScaled'
--
--     [C declaration]: @SDL_StretchSurface@, defined at @SDL3\/SDL_surface.h 1498:34@
sDL_StretchSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the blit target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire destination surface.
  -> SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: the 'SDL_ScaleMode' to be used.
  -> IO BG.CBool
sDL_StretchSurface = hs_bindgen_cbba042ce7137c9a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceTiled@
foreign import ccall unsafe "hs_bindgen_cc06339086116f6d"
  hs_bindgen_cc06339086116f6d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceTiled@
hs_bindgen_cc06339086116f6d
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_cc06339086116f6d =
  BG.fromFFIType hs_bindgen_cc06339086116f6d_base

-- | Perform a tiled blit to a destination surface, which may be of a different format.
--
--     The pixels in @srcrect@ will be repeated as many times as needed to completely fill @dstrect@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitSurface'
--
--     [C declaration]: @SDL_BlitSurfaceTiled@, defined at @SDL3\/SDL_surface.h 1523:34@
sDL_BlitSurfaceTiled
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the blit target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire surface.
  -> IO BG.CBool
sDL_BlitSurfaceTiled = hs_bindgen_cc06339086116f6d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceTiledWithScale@
foreign import ccall unsafe "hs_bindgen_50d8214074d2e91b"
  hs_bindgen_50d8214074d2e91b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> Float
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurfaceTiledWithScale@
hs_bindgen_50d8214074d2e91b
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.CFloat
  -> SDL_ScaleMode
  -> BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_50d8214074d2e91b =
  BG.fromFFIType hs_bindgen_50d8214074d2e91b_base

-- | Perform a scaled and tiled blit to a destination surface, which may be of a different format.
--
--     The pixels in @srcrect@ will be scaled and repeated as many times as needed to completely fill @dstrect@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitSurface'
--
--     [C declaration]: @SDL_BlitSurfaceTiledWithScale@, defined at @SDL3\/SDL_surface.h 1552:34@
sDL_BlitSurfaceTiledWithScale
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
  -> BG.CFloat
  -- ^
  --
  --           [@scale@]: the scale used to transform srcrect into the destination rectangle, e.g. a 32x32 texture with a scale of 2 would fill 64x64 tiles.
  -> SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: scale algorithm to be used.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the blit target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire surface.
  -> IO BG.CBool
sDL_BlitSurfaceTiledWithScale =
  hs_bindgen_50d8214074d2e91b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurface9Grid@
foreign import ccall unsafe "hs_bindgen_84940b463dd6473c"
  hs_bindgen_84940b463dd6473c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> Float
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_BlitSurface9Grid@
hs_bindgen_84940b463dd6473c
  :: BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> BG.CFloat
  -> SDL_ScaleMode
  -> BG.Ptr SDL_Surface
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_84940b463dd6473c =
  BG.fromFFIType hs_bindgen_84940b463dd6473c_base

-- | Perform a scaled blit using the 9-grid algorithm to a destination surface, which may be of a different format.
--
--     The pixels in the source surface are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then stretched into place to cover the remaining destination rectangle.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BlitSurface'
--
--     [C declaration]: @SDL_BlitSurface9Grid@, defined at @SDL3\/SDL_surface.h 1588:34@
sDL_BlitSurface9Grid
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be used for the 9-grid, or NULL to use the entire surface.
  -> BG.CInt
  -- ^
  --
  --           [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
  -> BG.CInt
  -- ^
  --
  --           [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
  -> BG.CInt
  -- ^
  --
  --           [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
  -> BG.CInt
  -- ^
  --
  --           [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
  -> BG.CFloat
  -- ^
  --
  --           [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled blit.
  -> SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: scale algorithm to be used.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the blit target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire surface.
  -> IO BG.CBool
sDL_BlitSurface9Grid = hs_bindgen_84940b463dd6473c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_MapSurfaceRGB@
foreign import ccall unsafe "hs_bindgen_5dfeeef5d5aa83da"
  hs_bindgen_5dfeeef5d5aa83da_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_MapSurfaceRGB@
hs_bindgen_5dfeeef5d5aa83da
  :: BG.Ptr SDL_Surface
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_5dfeeef5d5aa83da =
  BG.fromFFIType hs_bindgen_5dfeeef5d5aa83da_base

-- | Map an RGB triple to an opaque pixel value for a surface.
--
--     This function maps the RGB color value to the specified pixel format and returns the pixel value best approximating the given RGB color value for the given pixel format.
--
--     If the surface has a palette, the index of the closest matching color in the palette will be returned.
--
--     If the surface pixel format has an alpha component it will be returned as all 1 bits (fully opaque).
--
--     If the pixel format bpp (color depth) is less than 32-bpp then the unused upper bits of the return value can safely be ignored (e.g., with a 16-bpp format the return value can be assigned to a Uint16, and similarly a Uint8 for an 8-bpp format).
--
--     [Returns]: a pixel value.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_MapSurfaceRGBA'
--
--     [C declaration]: @SDL_MapSurfaceRGB@, defined at @SDL3\/SDL_surface.h 1621:36@
sDL_MapSurfaceRGB
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to use for the pixel format and palette.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: the red component of the pixel in the range 0-255.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: the green component of the pixel in the range 0-255.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: the blue component of the pixel in the range 0-255.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_MapSurfaceRGB = hs_bindgen_5dfeeef5d5aa83da

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_MapSurfaceRGBA@
foreign import ccall unsafe "hs_bindgen_456d7e009be906d0"
  hs_bindgen_456d7e009be906d0_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_MapSurfaceRGBA@
hs_bindgen_456d7e009be906d0
  :: BG.Ptr SDL_Surface
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_456d7e009be906d0 =
  BG.fromFFIType hs_bindgen_456d7e009be906d0_base

-- | Map an RGBA quadruple to a pixel value for a surface.
--
--     This function maps the RGBA color value to the specified pixel format and returns the pixel value best approximating the given RGBA color value for the given pixel format.
--
--     If the surface pixel format has no alpha component the alpha value will be ignored (as it will be in formats with a palette).
--
--     If the surface has a palette, the index of the closest matching color in the palette will be returned.
--
--     If the pixel format bpp (color depth) is less than 32-bpp then the unused upper bits of the return value can safely be ignored (e.g., with a 16-bpp format the return value can be assigned to a Uint16, and similarly a Uint8 for an 8-bpp format).
--
--     [Returns]: a pixel value.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_MapSurfaceRGB'
--
--     [C declaration]: @SDL_MapSurfaceRGBA@, defined at @SDL3\/SDL_surface.h 1655:36@
sDL_MapSurfaceRGBA
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to use for the pixel format and palette.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: the red component of the pixel in the range 0-255.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: the green component of the pixel in the range 0-255.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: the blue component of the pixel in the range 0-255.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@a@]: the alpha component of the pixel in the range 0-255.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_MapSurfaceRGBA = hs_bindgen_456d7e009be906d0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ReadSurfacePixel@
foreign import ccall unsafe "hs_bindgen_76b097df3deb39a7"
  hs_bindgen_76b097df3deb39a7_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ReadSurfacePixel@
hs_bindgen_76b097df3deb39a7
  :: BG.Ptr SDL_Surface
  -> BG.CInt
  -> BG.CInt
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_76b097df3deb39a7 =
  BG.fromFFIType hs_bindgen_76b097df3deb39a7_base

-- | Retrieves a single pixel from a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     Like SDL_GetRGBA, this uses the entire 0..255 range when converting color components from pixel formats with less than 8 bits per RGB component.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadSurfacePixel@, defined at @SDL3\/SDL_surface.h 1685:34@
sDL_ReadSurfacePixel
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to read.
  -> BG.CInt
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.CInt
  -- ^
  --
  --           [@y@]: the vertical coordinate, 0 \<= y \< height.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: a pointer filled in with the red channel, 0-255, or NULL to ignore this channel.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: a pointer filled in with the green channel, 0-255, or NULL to ignore this channel.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: a pointer filled in with the blue channel, 0-255, or NULL to ignore this channel.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@a@]: a pointer filled in with the alpha channel, 0-255, or NULL to ignore this channel.
  -> IO BG.CBool
sDL_ReadSurfacePixel = hs_bindgen_76b097df3deb39a7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ReadSurfacePixelFloat@
foreign import ccall unsafe "hs_bindgen_1dba774402b79156"
  hs_bindgen_1dba774402b79156_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_ReadSurfacePixelFloat@
hs_bindgen_1dba774402b79156
  :: BG.Ptr SDL_Surface
  -> BG.CInt
  -> BG.CInt
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_1dba774402b79156 =
  BG.fromFFIType hs_bindgen_1dba774402b79156_base

-- | Retrieves a single pixel from a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadSurfacePixelFloat@, defined at @SDL3\/SDL_surface.h 1712:34@
sDL_ReadSurfacePixelFloat
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to read.
  -> BG.CInt
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.CInt
  -- ^
  --
  --           [@y@]: the vertical coordinate, 0 \<= y \< height.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@r@]: a pointer filled in with the red channel, normally in the range 0-1, or NULL to ignore this channel.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@g@]: a pointer filled in with the green channel, normally in the range 0-1, or NULL to ignore this channel.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@b@]: a pointer filled in with the blue channel, normally in the range 0-1, or NULL to ignore this channel.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@a@]: a pointer filled in with the alpha channel, normally in the range 0-1, or NULL to ignore this channel.
  -> IO BG.CBool
sDL_ReadSurfacePixelFloat =
  hs_bindgen_1dba774402b79156

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_WriteSurfacePixel@
foreign import ccall unsafe "hs_bindgen_66bf3500cd5641bd"
  hs_bindgen_66bf3500cd5641bd_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_WriteSurfacePixel@
hs_bindgen_66bf3500cd5641bd
  :: BG.Ptr SDL_Surface
  -> BG.CInt
  -> BG.CInt
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_66bf3500cd5641bd =
  BG.fromFFIType hs_bindgen_66bf3500cd5641bd_base

-- | Writes a single pixel to a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     Like SDL_MapRGBA, this uses the entire 0..255 range when converting color components from pixel formats with less than 8 bits per RGB component.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteSurfacePixel@, defined at @SDL3\/SDL_surface.h 1738:34@
sDL_WriteSurfacePixel
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to write.
  -> BG.CInt
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.CInt
  -- ^
  --
  --           [@y@]: the vertical coordinate, 0 \<= y \< height.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: the red channel value, 0-255.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: the green channel value, 0-255.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: the blue channel value, 0-255.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@a@]: the alpha channel value, 0-255.
  -> IO BG.CBool
sDL_WriteSurfacePixel = hs_bindgen_66bf3500cd5641bd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_WriteSurfacePixelFloat@
foreign import ccall unsafe "hs_bindgen_91babb583602ef71"
  hs_bindgen_91babb583602ef71_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> Float
    -> Float
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_Unsafe_SDL_WriteSurfacePixelFloat@
hs_bindgen_91babb583602ef71
  :: BG.Ptr SDL_Surface
  -> BG.CInt
  -> BG.CInt
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_91babb583602ef71 =
  BG.fromFFIType hs_bindgen_91babb583602ef71_base

-- | Writes a single pixel to a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteSurfacePixelFloat@, defined at @SDL3\/SDL_surface.h 1761:34@
sDL_WriteSurfacePixelFloat
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to write.
  -> BG.CInt
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.CInt
  -- ^
  --
  --           [@y@]: the vertical coordinate, 0 \<= y \< height.
  -> BG.CFloat
  -- ^
  --
  --           [@r@]: the red channel value, normally in the range 0-1.
  -> BG.CFloat
  -- ^
  --
  --           [@g@]: the green channel value, normally in the range 0-1.
  -> BG.CFloat
  -- ^
  --
  --           [@b@]: the blue channel value, normally in the range 0-1.
  -> BG.CFloat
  -- ^
  --
  --           [@a@]: the alpha channel value, normally in the range 0-1.
  -> IO BG.CBool
sDL_WriteSurfacePixelFloat =
  hs_bindgen_91babb583602ef71
