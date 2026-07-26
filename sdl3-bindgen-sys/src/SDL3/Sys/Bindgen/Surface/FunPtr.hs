{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Surface.FunPtr (
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_CreateSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_CreateSurfaceFrom,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_DestroySurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_GetSurfaceProperties,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SetSurfaceColorspace,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_GetSurfaceColorspace,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_CreateSurfacePalette,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SetSurfacePalette,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_GetSurfacePalette,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_AddSurfaceAlternateImage,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SurfaceHasAlternateImages,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_GetSurfaceImages,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_RemoveSurfaceAlternateImages,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_LockSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_UnlockSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_LoadSurface_IO,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_LoadSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_LoadBMP_IO,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_LoadBMP,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SaveBMP_IO,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SaveBMP,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_LoadPNG_IO,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_LoadPNG,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SavePNG_IO,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SavePNG,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SetSurfaceRLE,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SurfaceHasRLE,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SetSurfaceColorKey,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SurfaceHasColorKey,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_GetSurfaceColorKey,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SetSurfaceColorMod,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_GetSurfaceColorMod,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SetSurfaceAlphaMod,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_GetSurfaceAlphaMod,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SetSurfaceBlendMode,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_GetSurfaceBlendMode,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_SetSurfaceClipRect,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_GetSurfaceClipRect,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_FlipSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_RotateSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_DuplicateSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_ScaleSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_ConvertSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_ConvertSurfaceAndColorspace,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_ConvertPixels,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_ConvertPixelsAndColorspace,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_PremultiplyAlpha,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_PremultiplySurfaceAlpha,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_ClearSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_FillSurfaceRect,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_FillSurfaceRects,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_BlitSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_BlitSurfaceUnchecked,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_BlitSurfaceScaled,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_BlitSurfaceUncheckedScaled,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_StretchSurface,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_BlitSurfaceTiled,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_BlitSurfaceTiledWithScale,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_BlitSurface9Grid,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_MapSurfaceRGB,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_MapSurfaceRGBA,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_ReadSurfacePixel,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_ReadSurfacePixelFloat,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_WriteSurfacePixel,
  SDL3.Sys.Bindgen.Surface.FunPtr.sDL_WriteSurfacePixelFloat,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_CreateSurface */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_b611b0ad74e9df46 (void)) ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  SDL_PixelFormat arg3"
         , ")"
         , "{"
         , "  return &SDL_CreateSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_CreateSurfaceFrom */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_618b221956f449f6 (void)) ("
         , "  signed int arg1,"
         , "  signed int arg2,"
         , "  SDL_PixelFormat arg3,"
         , "  void *arg4,"
         , "  signed int arg5"
         , ")"
         , "{"
         , "  return &SDL_CreateSurfaceFrom;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_DestroySurface */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_3abd108286bfceeb (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroySurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_19e46938182deff1 (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSurfaceProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceColorspace */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3dcd7404be98273c (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Colorspace arg2"
         , ")"
         , "{"
         , "  return &SDL_SetSurfaceColorspace;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceColorspace */"
         , "__attribute__ ((const))"
         , "SDL_Colorspace (*hs_bindgen_d23645a854452460 (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSurfaceColorspace;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_CreateSurfacePalette */"
         , "__attribute__ ((const))"
         , "SDL_Palette *(*hs_bindgen_7f4f9f996fc5d0fa (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateSurfacePalette;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfacePalette */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_38fd6f01b7193fdc (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Palette *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetSurfacePalette;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfacePalette */"
         , "__attribute__ ((const))"
         , "SDL_Palette *(*hs_bindgen_d7d43240b950a72f (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSurfacePalette;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_AddSurfaceAlternateImage */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_51641021bfbefd52 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return &SDL_AddSurfaceAlternateImage;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SurfaceHasAlternateImages */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_246a5adcd0cb59d2 (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_SurfaceHasAlternateImages;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceImages */"
         , "__attribute__ ((const))"
         , "SDL_Surface **(*hs_bindgen_facc022f89ae54d4 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetSurfaceImages;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_RemoveSurfaceAlternateImages */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_3cf1a6833f417511 (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_RemoveSurfaceAlternateImages;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LockSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d9555284e2bd0bd2 (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_LockSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_UnlockSurface */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_c9cc0ab93d524b01 (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_UnlockSurface;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadSurface_IO */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_b9f87aa5bdc60ef1 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_LoadSurface_IO;"
         , "#else"
         , "  SDL_SetError(\"SDL_LoadSurface_IO requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadSurface */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_40bbeaa5b1c224ea (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_LoadSurface;"
         , "#else"
         , "  SDL_SetError(\"SDL_LoadSurface requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadBMP_IO */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_6755776ca639dbdc (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_LoadBMP_IO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadBMP */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_551d0d7143060153 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_LoadBMP;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SaveBMP_IO */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7af781be626489b8 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_IOStream *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_SaveBMP_IO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SaveBMP */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2ca988106cd7ddb5 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SaveBMP;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadPNG_IO */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_1068e5bcdcfeee86 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_LoadPNG_IO;"
         , "#else"
         , "  SDL_SetError(\"SDL_LoadPNG_IO requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadPNG */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_b113bfea8941c2b8 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_LoadPNG;"
         , "#else"
         , "  SDL_SetError(\"SDL_LoadPNG requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SavePNG_IO */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_784779331549b878 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_IOStream *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SavePNG_IO;"
         , "#else"
         , "  SDL_SetError(\"SDL_SavePNG_IO requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SavePNG */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3039586bfe90e597 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SavePNG;"
         , "#else"
         , "  SDL_SetError(\"SDL_SavePNG requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceRLE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_dd401b9169c44976 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetSurfaceRLE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SurfaceHasRLE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8957a6011d9f44f9 (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_SurfaceHasRLE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceColorKey */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_bb6a923e2cd243f7 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  _Bool arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_SetSurfaceColorKey;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SurfaceHasColorKey */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9cb1ca0717710e5a (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_SurfaceHasColorKey;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceColorKey */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b8a872d97663bea2 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  Uint32 *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetSurfaceColorKey;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceColorMod */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d96bb8008d1b87a6 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return &SDL_SetSurfaceColorMod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceColorMod */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_bc145b87021a07e6 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 *arg2,"
         , "  Uint8 *arg3,"
         , "  Uint8 *arg4"
         , ")"
         , "{"
         , "  return &SDL_GetSurfaceColorMod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceAlphaMod */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_44bc0c580740a2b4 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 arg2"
         , ")"
         , "{"
         , "  return &SDL_SetSurfaceAlphaMod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceAlphaMod */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2f7b92e198b60348 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetSurfaceAlphaMod;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceBlendMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1abb9d9640e9f83b (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_BlendMode arg2"
         , ")"
         , "{"
         , "  return &SDL_SetSurfaceBlendMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceBlendMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ddc08ab588ab04b9 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_BlendMode *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetSurfaceBlendMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceClipRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ba59ae52e07cd998 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetSurfaceClipRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceClipRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7d6c81cd63182c7e (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetSurfaceClipRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_FlipSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3f1f98e8e0b7167f (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_FlipMode arg2"
         , ")"
         , "{"
         , "  return &SDL_FlipSurface;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_RotateSurface */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_bc3ef53813125bc9 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_RotateSurface;"
         , "#else"
         , "  SDL_SetError(\"SDL_RotateSurface requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_DuplicateSurface */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_d6a7bd90e75ca1f4 (void)) ("
         , "  SDL_Surface *arg1"
         , ")"
         , "{"
         , "  return &SDL_DuplicateSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ScaleSurface */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_3c8c8f89fa471eaf (void)) ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  SDL_ScaleMode arg4"
         , ")"
         , "{"
         , "  return &SDL_ScaleSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertSurface */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_02efcc9cf840132b (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_PixelFormat arg2"
         , ")"
         , "{"
         , "  return &SDL_ConvertSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertSurfaceAndColorspace */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_d71b405fb2c63769 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_PixelFormat arg2,"
         , "  SDL_Palette *arg3,"
         , "  SDL_Colorspace arg4,"
         , "  SDL_PropertiesID arg5"
         , ")"
         , "{"
         , "  return &SDL_ConvertSurfaceAndColorspace;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertPixels */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_57fab76de82ac9cf (void)) ("
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
         , "  return &SDL_ConvertPixels;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertPixelsAndColorspace */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8ab04e66f663ce08 (void)) ("
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
         , "  return &SDL_ConvertPixelsAndColorspace;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_PremultiplyAlpha */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fb56322259d07073 (void)) ("
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
         , "  return &SDL_PremultiplyAlpha;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_PremultiplySurfaceAlpha */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6d7894c44ea2dfc7 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_PremultiplySurfaceAlpha;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ClearSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3eb9b7722a04b8f8 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  float arg2,"
         , "  float arg3,"
         , "  float arg4,"
         , "  float arg5"
         , ")"
         , "{"
         , "  return &SDL_ClearSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_FillSurfaceRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d466d8dde16f547b (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_FillSurfaceRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_FillSurfaceRects */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b0bc5bc8b57e73e3 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  signed int arg3,"
         , "  Uint32 arg4"
         , ")"
         , "{"
         , "  return &SDL_FillSurfaceRects;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a29859c35fa4ca59 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4"
         , ")"
         , "{"
         , "  return &SDL_BlitSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceUnchecked */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3f540dd5f5c2d037 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4"
         , ")"
         , "{"
         , "  return &SDL_BlitSurfaceUnchecked;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceScaled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9a9b4e0ef4c33fb3 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4,"
         , "  SDL_ScaleMode arg5"
         , ")"
         , "{"
         , "  return &SDL_BlitSurfaceScaled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceUncheckedScaled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4d0c17a14d7334d5 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4,"
         , "  SDL_ScaleMode arg5"
         , ")"
         , "{"
         , "  return &SDL_BlitSurfaceUncheckedScaled;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_StretchSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1a9d00d4cf3623eb (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4,"
         , "  SDL_ScaleMode arg5"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 2, 4)"
         , "  return &SDL_StretchSurface;"
         , "#else"
         , "  SDL_SetError(\"SDL_StretchSurface requires SDL >= 3.2.4\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceTiled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_215dfb2882cacc76 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  SDL_Surface *arg3,"
         , "  SDL_Rect const *arg4"
         , ")"
         , "{"
         , "  return &SDL_BlitSurfaceTiled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceTiledWithScale */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c33eb3f53084c8a3 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  float arg3,"
         , "  SDL_ScaleMode arg4,"
         , "  SDL_Surface *arg5,"
         , "  SDL_Rect const *arg6"
         , ")"
         , "{"
         , "  return &SDL_BlitSurfaceTiledWithScale;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurface9Grid */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_34b06f5d5e4b0b97 (void)) ("
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
         , "  return &SDL_BlitSurface9Grid;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_MapSurfaceRGB */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_22cd4dcdb87e7f1a (void)) ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return &SDL_MapSurfaceRGB;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_MapSurfaceRGBA */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_0a9db974db6877bb (void)) ("
         , "  SDL_Surface *arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5"
         , ")"
         , "{"
         , "  return &SDL_MapSurfaceRGBA;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ReadSurfacePixel */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_621010702d3faa18 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  Uint8 *arg4,"
         , "  Uint8 *arg5,"
         , "  Uint8 *arg6,"
         , "  Uint8 *arg7"
         , ")"
         , "{"
         , "  return &SDL_ReadSurfacePixel;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ReadSurfacePixelFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8c567029e60d9131 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  float *arg4,"
         , "  float *arg5,"
         , "  float *arg6,"
         , "  float *arg7"
         , ")"
         , "{"
         , "  return &SDL_ReadSurfacePixelFloat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_WriteSurfacePixel */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b9a3ff7742c64b4a (void)) ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5,"
         , "  Uint8 arg6,"
         , "  Uint8 arg7"
         , ")"
         , "{"
         , "  return &SDL_WriteSurfacePixel;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_WriteSurfacePixelFloat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_622524c6fb921b4c (void)) ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  float arg4,"
         , "  float arg5,"
         , "  float arg6,"
         , "  float arg7"
         , ")"
         , "{"
         , "  return &SDL_WriteSurfacePixelFloat;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_CreateSurface@
foreign import ccall unsafe "hs_bindgen_b611b0ad74e9df46"
  hs_bindgen_b611b0ad74e9df46_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_CreateSurface@
hs_bindgen_b611b0ad74e9df46
  :: IO
       (BG.FunPtr (BG.CInt -> BG.CInt -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_b611b0ad74e9df46 =
  BG.fromFFIType hs_bindgen_b611b0ad74e9df46_base

{-# NOINLINE sDL_CreateSurface #-}

-- | Allocate a new surface with a specific pixel format.
--
--     The pixels of the new surface are initialized to zero.
--
--     [@width@]: the width of the surface.
--
--     [@height@]: the height of the surface.
--
--     [@format@]: the SDL_PixelFormat for the new surface\'s pixel format.
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
  :: BG.FunPtr (BG.CInt -> BG.CInt -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO (BG.Ptr SDL_Surface))
sDL_CreateSurface =
  BG.unsafePerformIO hs_bindgen_b611b0ad74e9df46

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_CreateSurfaceFrom@
foreign import ccall unsafe "hs_bindgen_618b221956f449f6"
  hs_bindgen_618b221956f449f6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_CreateSurfaceFrom@
hs_bindgen_618b221956f449f6
  :: IO
       ( BG.FunPtr
           ( BG.CInt
             -> BG.CInt
             -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
             -> BG.Ptr BG.Void
             -> BG.CInt
             -> IO (BG.Ptr SDL_Surface)
           )
       )
hs_bindgen_618b221956f449f6 =
  BG.fromFFIType hs_bindgen_618b221956f449f6_base

{-# NOINLINE sDL_CreateSurfaceFrom #-}

-- | Allocate a new surface with a specific pixel format and existing pixel data.
--
--     No copy is made of the pixel data. Pixel data is not managed automatically; you must free the surface before you free the pixel data.
--
--     Pitch is the offset in bytes from one row of pixels to the next, e.g. @width*4@ for @SDL_PIXELFORMAT_RGBA8888@.
--
--     You may pass NULL for pixels and 0 for pitch to create a surface that you will fill in with valid values later.
--
--     [@width@]: the width of the surface.
--
--     [@height@]: the height of the surface.
--
--     [@format@]: the SDL_PixelFormat for the new surface\'s pixel format.
--
--     [@pixels@]: a pointer to existing pixel data.
--
--     [@pitch@]: the number of bytes between each row, including padding.
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
  :: BG.FunPtr
       ( BG.CInt
         -> BG.CInt
         -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
         -> BG.Ptr BG.Void
         -> BG.CInt
         -> IO (BG.Ptr SDL_Surface)
       )
sDL_CreateSurfaceFrom =
  BG.unsafePerformIO hs_bindgen_618b221956f449f6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_DestroySurface@
foreign import ccall unsafe "hs_bindgen_3abd108286bfceeb"
  hs_bindgen_3abd108286bfceeb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_DestroySurface@
hs_bindgen_3abd108286bfceeb :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO ()))
hs_bindgen_3abd108286bfceeb =
  BG.fromFFIType hs_bindgen_3abd108286bfceeb_base

{-# NOINLINE sDL_DestroySurface #-}

-- | Free a surface.
--
--     It is safe to pass NULL to this function.
--
--     [@surface@]: the 'SDL_Surface' to free.
--
--     [Thread safety]: No other thread should be using the surface when it is freed.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateSurface', 'sDL_CreateSurfaceFrom'
--
--     [C declaration]: @SDL_DestroySurface@, defined at @SDL3\/SDL_surface.h 219:34@
sDL_DestroySurface :: BG.FunPtr (BG.Ptr SDL_Surface -> IO ())
sDL_DestroySurface =
  BG.unsafePerformIO hs_bindgen_3abd108286bfceeb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceProperties@
foreign import ccall unsafe "hs_bindgen_19e46938182deff1"
  hs_bindgen_19e46938182deff1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceProperties@
hs_bindgen_19e46938182deff1
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_19e46938182deff1 =
  BG.fromFFIType hs_bindgen_19e46938182deff1_base

{-# NOINLINE sDL_GetSurfaceProperties #-}

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
--     [@surface@]: the 'SDL_Surface' structure to query.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSurfaceProperties@, defined at @SDL3\/SDL_surface.h 259:46@
sDL_GetSurfaceProperties
  :: BG.FunPtr (BG.Ptr SDL_Surface -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetSurfaceProperties =
  BG.unsafePerformIO hs_bindgen_19e46938182deff1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceColorspace@
foreign import ccall unsafe "hs_bindgen_3dcd7404be98273c"
  hs_bindgen_3dcd7404be98273c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceColorspace@
hs_bindgen_3dcd7404be98273c
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool))
hs_bindgen_3dcd7404be98273c =
  BG.fromFFIType hs_bindgen_3dcd7404be98273c_base

{-# NOINLINE sDL_SetSurfaceColorspace #-}

-- | Set the colorspace used by a surface.
--
--     Setting the colorspace doesn\'t change the pixels, only how they are interpreted in color operations.
--
--     [@surface@]: the 'SDL_Surface' structure to update.
--
--     [@colorspace@]: an SDL_Colorspace value describing the surface colorspace.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool)
sDL_SetSurfaceColorspace =
  BG.unsafePerformIO hs_bindgen_3dcd7404be98273c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceColorspace@
foreign import ccall unsafe "hs_bindgen_d23645a854452460"
  hs_bindgen_d23645a854452460_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceColorspace@
hs_bindgen_d23645a854452460
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace))
hs_bindgen_d23645a854452460 =
  BG.fromFFIType hs_bindgen_d23645a854452460_base

{-# NOINLINE sDL_GetSurfaceColorspace #-}

-- | Get the colorspace used by a surface.
--
--     The colorspace defaults to SDL_COLORSPACE_SRGB_LINEAR for floating point formats, SDL_COLORSPACE_HDR10 for 10-bit formats, SDL_COLORSPACE_SRGB for other RGB surfaces and SDL_COLORSPACE_BT709_FULL for YUV textures.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace)
sDL_GetSurfaceColorspace =
  BG.unsafePerformIO hs_bindgen_d23645a854452460

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_CreateSurfacePalette@
foreign import ccall unsafe "hs_bindgen_7f4f9f996fc5d0fa"
  hs_bindgen_7f4f9f996fc5d0fa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_CreateSurfacePalette@
hs_bindgen_7f4f9f996fc5d0fa
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)))
hs_bindgen_7f4f9f996fc5d0fa =
  BG.fromFFIType hs_bindgen_7f4f9f996fc5d0fa_base

{-# NOINLINE sDL_CreateSurfacePalette #-}

-- | Create a palette and associate it with a surface.
--
--     This function creates a palette compatible with the provided surface. The palette is then returned for you to modify, and the surface will automatically use the new palette in future operations. You do not need to destroy the returned palette, it will be freed when the reference count reaches 0, usually when the surface is destroyed.
--
--     Bitmap surfaces (with format SDL_PIXELFORMAT_INDEX1LSB or SDL_PIXELFORMAT_INDEX1MSB) will have the palette initialized with 0 as white and 1 as black. Other surfaces will get a palette initialized with white in every entry.
--
--     If this function is called for a surface that already has a palette, a new palette will be created to replace it.
--
--     [@surface@]: the 'SDL_Surface' structure to update.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette))
sDL_CreateSurfacePalette =
  BG.unsafePerformIO hs_bindgen_7f4f9f996fc5d0fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfacePalette@
foreign import ccall unsafe "hs_bindgen_38fd6f01b7193fdc"
  hs_bindgen_38fd6f01b7193fdc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfacePalette@
hs_bindgen_38fd6f01b7193fdc
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette -> IO BG.CBool))
hs_bindgen_38fd6f01b7193fdc =
  BG.fromFFIType hs_bindgen_38fd6f01b7193fdc_base

{-# NOINLINE sDL_SetSurfacePalette #-}

-- | Set the palette used by a surface.
--
--     Setting the palette keeps an internal reference to the palette, which can be safely destroyed afterwards.
--
--     A single palette can be shared with many surfaces.
--
--     [@surface@]: the 'SDL_Surface' structure to update.
--
--     [@palette@]: the SDL_Palette structure to use.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette -> IO BG.CBool)
sDL_SetSurfacePalette =
  BG.unsafePerformIO hs_bindgen_38fd6f01b7193fdc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfacePalette@
foreign import ccall unsafe "hs_bindgen_d7d43240b950a72f"
  hs_bindgen_d7d43240b950a72f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfacePalette@
hs_bindgen_d7d43240b950a72f
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)))
hs_bindgen_d7d43240b950a72f =
  BG.fromFFIType hs_bindgen_d7d43240b950a72f_base

{-# NOINLINE sDL_GetSurfacePalette #-}

-- | Get the palette used by a surface.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette))
sDL_GetSurfacePalette =
  BG.unsafePerformIO hs_bindgen_d7d43240b950a72f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_AddSurfaceAlternateImage@
foreign import ccall unsafe "hs_bindgen_51641021bfbefd52"
  hs_bindgen_51641021bfbefd52_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_AddSurfaceAlternateImage@
hs_bindgen_51641021bfbefd52
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL_Surface -> IO BG.CBool))
hs_bindgen_51641021bfbefd52 =
  BG.fromFFIType hs_bindgen_51641021bfbefd52_base

{-# NOINLINE sDL_AddSurfaceAlternateImage #-}

-- | Add an alternate version of a surface.
--
--     This function adds an alternate version of this surface, usually used for content with high DPI representations like cursors or icons. The size, format, and content do not need to match the original surface, and these alternate versions will not be updated when the original surface changes.
--
--     This function adds a reference to the alternate version, so you should call @SDL_DestroySurface()@ on the image after this call.
--
--     [@surface@]: the 'SDL_Surface' structure to update.
--
--     [@image@]: a pointer to an alternate 'SDL_Surface' to associate with this surface.
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
sDL_AddSurfaceAlternateImage :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL_Surface -> IO BG.CBool)
sDL_AddSurfaceAlternateImage =
  BG.unsafePerformIO hs_bindgen_51641021bfbefd52

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SurfaceHasAlternateImages@
foreign import ccall unsafe "hs_bindgen_246a5adcd0cb59d2"
  hs_bindgen_246a5adcd0cb59d2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SurfaceHasAlternateImages@
hs_bindgen_246a5adcd0cb59d2 :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO BG.CBool))
hs_bindgen_246a5adcd0cb59d2 =
  BG.fromFFIType hs_bindgen_246a5adcd0cb59d2_base

{-# NOINLINE sDL_SurfaceHasAlternateImages #-}

-- | Return whether a surface has alternate versions available.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
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
sDL_SurfaceHasAlternateImages :: BG.FunPtr (BG.Ptr SDL_Surface -> IO BG.CBool)
sDL_SurfaceHasAlternateImages =
  BG.unsafePerformIO hs_bindgen_246a5adcd0cb59d2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceImages@
foreign import ccall unsafe "hs_bindgen_facc022f89ae54d4"
  hs_bindgen_facc022f89ae54d4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceImages@
hs_bindgen_facc022f89ae54d4
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_Surface))))
hs_bindgen_facc022f89ae54d4 =
  BG.fromFFIType hs_bindgen_facc022f89ae54d4_base

{-# NOINLINE sDL_GetSurfaceImages #-}

-- | Get an array including all versions of a surface.
--
--     This returns all versions of a surface, with the surface being queried as the first element in the returned array.
--
--     Freeing the array of surfaces does not affect the surfaces in the array. They are still referenced by the surface being queried and will be cleaned up normally.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
--
--     [@count@]: a pointer filled in with the number of surface pointers returned, may be NULL.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_Surface)))
sDL_GetSurfaceImages =
  BG.unsafePerformIO hs_bindgen_facc022f89ae54d4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_RemoveSurfaceAlternateImages@
foreign import ccall unsafe "hs_bindgen_3cf1a6833f417511"
  hs_bindgen_3cf1a6833f417511_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_RemoveSurfaceAlternateImages@
hs_bindgen_3cf1a6833f417511 :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO ()))
hs_bindgen_3cf1a6833f417511 =
  BG.fromFFIType hs_bindgen_3cf1a6833f417511_base

{-# NOINLINE sDL_RemoveSurfaceAlternateImages #-}

-- | Remove all alternate versions of a surface.
--
--     This function removes a reference from all the alternative versions, destroying them if this is the last reference to them.
--
--     [@surface@]: the 'SDL_Surface' structure to update.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddSurfaceAlternateImage', 'sDL_GetSurfaceImages', 'sDL_SurfaceHasAlternateImages'
--
--     [C declaration]: @SDL_RemoveSurfaceAlternateImages@, defined at @SDL3\/SDL_surface.h 467:34@
sDL_RemoveSurfaceAlternateImages :: BG.FunPtr (BG.Ptr SDL_Surface -> IO ())
sDL_RemoveSurfaceAlternateImages =
  BG.unsafePerformIO hs_bindgen_3cf1a6833f417511

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LockSurface@
foreign import ccall unsafe "hs_bindgen_d9555284e2bd0bd2"
  hs_bindgen_d9555284e2bd0bd2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LockSurface@
hs_bindgen_d9555284e2bd0bd2 :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO BG.CBool))
hs_bindgen_d9555284e2bd0bd2 =
  BG.fromFFIType hs_bindgen_d9555284e2bd0bd2_base

{-# NOINLINE sDL_LockSurface #-}

-- | Set up a surface for directly accessing the pixels.
--
--     Between calls to @SDL_LockSurface()@ \/ @SDL_UnlockSurface()@, you can write to and read from @surface->pixels@, using the pixel format stored in @surface->format@. Once you are done accessing the surface, you should use @SDL_UnlockSurface()@ to release it.
--
--     Not all surfaces require locking. If @SDL_MUSTLOCK(surface)@ evaluates to 0, then you can read and write to the surface at any time, and the pixel format of the surface will not change.
--
--     [@surface@]: the 'SDL_Surface' structure to be locked.
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
sDL_LockSurface :: BG.FunPtr (BG.Ptr SDL_Surface -> IO BG.CBool)
sDL_LockSurface =
  BG.unsafePerformIO hs_bindgen_d9555284e2bd0bd2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_UnlockSurface@
foreign import ccall unsafe "hs_bindgen_c9cc0ab93d524b01"
  hs_bindgen_c9cc0ab93d524b01_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_UnlockSurface@
hs_bindgen_c9cc0ab93d524b01 :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO ()))
hs_bindgen_c9cc0ab93d524b01 =
  BG.fromFFIType hs_bindgen_c9cc0ab93d524b01_base

{-# NOINLINE sDL_UnlockSurface #-}

-- | Release a surface after directly accessing the pixels.
--
--     [@surface@]: the 'SDL_Surface' structure to be unlocked.
--
--     [Thread safety]: This function is not thread safe. The locking referred to by this function is making the pixels available for direct access, not thread-safe locking.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockSurface'
--
--     [C declaration]: @SDL_UnlockSurface@, defined at @SDL3\/SDL_surface.h 510:34@
sDL_UnlockSurface :: BG.FunPtr (BG.Ptr SDL_Surface -> IO ())
sDL_UnlockSurface =
  BG.unsafePerformIO hs_bindgen_c9cc0ab93d524b01

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadSurface_IO@
foreign import ccall unsafe "hs_bindgen_b9f87aa5bdc60ef1"
  hs_bindgen_b9f87aa5bdc60ef1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadSurface_IO@
hs_bindgen_b9f87aa5bdc60ef1
  :: IO
       (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_b9f87aa5bdc60ef1 =
  BG.fromFFIType hs_bindgen_b9f87aa5bdc60ef1_base

{-# NOINLINE sDL_LoadSurface_IO #-}

-- | Load a BMP or PNG image from a seekable SDL data stream.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [@src@]: the data stream for the surface.
--
--     [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
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
  :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO (BG.Ptr SDL_Surface))
sDL_LoadSurface_IO =
  BG.unsafePerformIO hs_bindgen_b9f87aa5bdc60ef1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadSurface@
foreign import ccall unsafe "hs_bindgen_40bbeaa5b1c224ea"
  hs_bindgen_40bbeaa5b1c224ea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadSurface@
hs_bindgen_40bbeaa5b1c224ea
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_40bbeaa5b1c224ea =
  BG.fromFFIType hs_bindgen_40bbeaa5b1c224ea_base

{-# NOINLINE sDL_LoadSurface #-}

-- | Load a BMP or PNG image from a file.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [@file@]: the file to load.
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
sDL_LoadSurface :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Surface))
sDL_LoadSurface =
  BG.unsafePerformIO hs_bindgen_40bbeaa5b1c224ea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadBMP_IO@
foreign import ccall unsafe "hs_bindgen_6755776ca639dbdc"
  hs_bindgen_6755776ca639dbdc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadBMP_IO@
hs_bindgen_6755776ca639dbdc
  :: IO
       (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_6755776ca639dbdc =
  BG.fromFFIType hs_bindgen_6755776ca639dbdc_base

{-# NOINLINE sDL_LoadBMP_IO #-}

-- | Load a BMP image from a seekable SDL data stream.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [@src@]: the data stream for the surface.
--
--     [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
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
  :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO (BG.Ptr SDL_Surface))
sDL_LoadBMP_IO =
  BG.unsafePerformIO hs_bindgen_6755776ca639dbdc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadBMP@
foreign import ccall unsafe "hs_bindgen_551d0d7143060153"
  hs_bindgen_551d0d7143060153_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadBMP@
hs_bindgen_551d0d7143060153
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_551d0d7143060153 =
  BG.fromFFIType hs_bindgen_551d0d7143060153_base

{-# NOINLINE sDL_LoadBMP #-}

-- | Load a BMP image from a file.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [@file@]: the BMP file to load.
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
sDL_LoadBMP :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Surface))
sDL_LoadBMP =
  BG.unsafePerformIO hs_bindgen_551d0d7143060153

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SaveBMP_IO@
foreign import ccall unsafe "hs_bindgen_7af781be626489b8"
  hs_bindgen_7af781be626489b8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SaveBMP_IO@
hs_bindgen_7af781be626489b8
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO BG.CBool)
       )
hs_bindgen_7af781be626489b8 =
  BG.fromFFIType hs_bindgen_7af781be626489b8_base

{-# NOINLINE sDL_SaveBMP_IO #-}

-- | Save a surface to a seekable SDL data stream in BMP format.
--
--     Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the BMP directly. Other RGB formats with 8-bit or higher get converted to a 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit surface before they are saved. YUV and paletted 1-bit and 4-bit formats are not supported.
--
--     [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
--
--     [@dst@]: a data stream to save to.
--
--     [@closeio@]: if true, calls SDL_CloseIO() on @dst@ before returning, even in the case of an error.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO BG.CBool)
sDL_SaveBMP_IO =
  BG.unsafePerformIO hs_bindgen_7af781be626489b8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SaveBMP@
foreign import ccall unsafe "hs_bindgen_2ca988106cd7ddb5"
  hs_bindgen_2ca988106cd7ddb5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SaveBMP@
hs_bindgen_2ca988106cd7ddb5
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_2ca988106cd7ddb5 =
  BG.fromFFIType hs_bindgen_2ca988106cd7ddb5_base

{-# NOINLINE sDL_SaveBMP #-}

-- | Save a surface to a file in BMP format.
--
--     Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the BMP directly. Other RGB formats with 8-bit or higher get converted to a 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit surface before they are saved. YUV and paletted 1-bit and 4-bit formats are not supported.
--
--     [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
--
--     [@file@]: a file to save to.
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
sDL_SaveBMP :: BG.FunPtr (BG.Ptr SDL_Surface -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SaveBMP =
  BG.unsafePerformIO hs_bindgen_2ca988106cd7ddb5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadPNG_IO@
foreign import ccall unsafe "hs_bindgen_1068e5bcdcfeee86"
  hs_bindgen_1068e5bcdcfeee86_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadPNG_IO@
hs_bindgen_1068e5bcdcfeee86
  :: IO
       (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_1068e5bcdcfeee86 =
  BG.fromFFIType hs_bindgen_1068e5bcdcfeee86_base

{-# NOINLINE sDL_LoadPNG_IO #-}

-- | Load a PNG image from a seekable SDL data stream.
--
--     This is intended as a convenience function for loading images from trusted sources. If you want to load arbitrary images you should use libpng or another image loading library designed with security in mind.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [@src@]: the data stream for the surface.
--
--     [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
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
  :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO (BG.Ptr SDL_Surface))
sDL_LoadPNG_IO =
  BG.unsafePerformIO hs_bindgen_1068e5bcdcfeee86

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadPNG@
foreign import ccall unsafe "hs_bindgen_b113bfea8941c2b8"
  hs_bindgen_b113bfea8941c2b8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_LoadPNG@
hs_bindgen_b113bfea8941c2b8
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_b113bfea8941c2b8 =
  BG.fromFFIType hs_bindgen_b113bfea8941c2b8_base

{-# NOINLINE sDL_LoadPNG #-}

-- | Load a PNG image from a file.
--
--     This is intended as a convenience function for loading images from trusted sources. If you want to load arbitrary images you should use libpng or another image loading library designed with security in mind.
--
--     The new surface should be freed with @SDL_DestroySurface()@. Not doing so will result in a memory leak.
--
--     [@file@]: the PNG file to load.
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
sDL_LoadPNG :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Surface))
sDL_LoadPNG =
  BG.unsafePerformIO hs_bindgen_b113bfea8941c2b8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SavePNG_IO@
foreign import ccall unsafe "hs_bindgen_784779331549b878"
  hs_bindgen_784779331549b878_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SavePNG_IO@
hs_bindgen_784779331549b878
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO BG.CBool)
       )
hs_bindgen_784779331549b878 =
  BG.fromFFIType hs_bindgen_784779331549b878_base

{-# NOINLINE sDL_SavePNG_IO #-}

-- | Save a surface to a seekable SDL data stream in PNG format.
--
--     [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
--
--     [@dst@]: a data stream to save to.
--
--     [@closeio@]: if true, calls SDL_CloseIO() on @dst@ before returning, even in the case of an error.
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
  :: BG.FunPtr
       (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream -> BG.CBool -> IO BG.CBool)
sDL_SavePNG_IO =
  BG.unsafePerformIO hs_bindgen_784779331549b878

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SavePNG@
foreign import ccall unsafe "hs_bindgen_3039586bfe90e597"
  hs_bindgen_3039586bfe90e597_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SavePNG@
hs_bindgen_3039586bfe90e597
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_3039586bfe90e597 =
  BG.fromFFIType hs_bindgen_3039586bfe90e597_base

{-# NOINLINE sDL_SavePNG #-}

-- | Save a surface to a file in PNG format.
--
--     [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
--
--     [@file@]: a file to save to.
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
sDL_SavePNG :: BG.FunPtr (BG.Ptr SDL_Surface -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SavePNG =
  BG.unsafePerformIO hs_bindgen_3039586bfe90e597

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceRLE@
foreign import ccall unsafe "hs_bindgen_dd401b9169c44976"
  hs_bindgen_dd401b9169c44976_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceRLE@
hs_bindgen_dd401b9169c44976 :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.CBool -> IO BG.CBool))
hs_bindgen_dd401b9169c44976 =
  BG.fromFFIType hs_bindgen_dd401b9169c44976_base

{-# NOINLINE sDL_SetSurfaceRLE #-}

-- | Set the RLE acceleration hint for a surface.
--
--     If RLE is enabled, color key and alpha blending blits are much faster, but the surface must be locked before directly accessing the pixels.
--
--     [@surface@]: the 'SDL_Surface' structure to optimize.
--
--     [@enabled@]: true to enable RLE acceleration, false to disable it.
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
sDL_SetSurfaceRLE :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.CBool -> IO BG.CBool)
sDL_SetSurfaceRLE =
  BG.unsafePerformIO hs_bindgen_dd401b9169c44976

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SurfaceHasRLE@
foreign import ccall unsafe "hs_bindgen_8957a6011d9f44f9"
  hs_bindgen_8957a6011d9f44f9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SurfaceHasRLE@
hs_bindgen_8957a6011d9f44f9 :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO BG.CBool))
hs_bindgen_8957a6011d9f44f9 =
  BG.fromFFIType hs_bindgen_8957a6011d9f44f9_base

{-# NOINLINE sDL_SurfaceHasRLE #-}

-- | Returns whether the surface is RLE enabled.
--
--     It is safe to pass a NULL @surface@ here; it will return false.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
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
sDL_SurfaceHasRLE :: BG.FunPtr (BG.Ptr SDL_Surface -> IO BG.CBool)
sDL_SurfaceHasRLE =
  BG.unsafePerformIO hs_bindgen_8957a6011d9f44f9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceColorKey@
foreign import ccall unsafe "hs_bindgen_bb6a923e2cd243f7"
  hs_bindgen_bb6a923e2cd243f7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceColorKey@
hs_bindgen_bb6a923e2cd243f7
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.CBool -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_bb6a923e2cd243f7 =
  BG.fromFFIType hs_bindgen_bb6a923e2cd243f7_base

{-# NOINLINE sDL_SetSurfaceColorKey #-}

-- | Set the color key (transparent pixel) in a surface.
--
--     The color key defines a pixel value that will be treated as transparent in a blit. For example, one can use this to specify that cyan pixels should be considered transparent, and therefore not rendered.
--
--     It is a pixel of the format used by the surface, as generated by SDL_MapRGB().
--
--     [@surface@]: the 'SDL_Surface' structure to update.
--
--     [@enabled@]: true to enable color key, false to disable color key.
--
--     [@key@]: the transparent pixel.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.CBool -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_SetSurfaceColorKey =
  BG.unsafePerformIO hs_bindgen_bb6a923e2cd243f7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SurfaceHasColorKey@
foreign import ccall unsafe "hs_bindgen_9cb1ca0717710e5a"
  hs_bindgen_9cb1ca0717710e5a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SurfaceHasColorKey@
hs_bindgen_9cb1ca0717710e5a :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO BG.CBool))
hs_bindgen_9cb1ca0717710e5a =
  BG.fromFFIType hs_bindgen_9cb1ca0717710e5a_base

{-# NOINLINE sDL_SurfaceHasColorKey #-}

-- | Returns whether the surface has a color key.
--
--     It is safe to pass a NULL @surface@ here; it will return false.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
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
sDL_SurfaceHasColorKey :: BG.FunPtr (BG.Ptr SDL_Surface -> IO BG.CBool)
sDL_SurfaceHasColorKey =
  BG.unsafePerformIO hs_bindgen_9cb1ca0717710e5a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceColorKey@
foreign import ccall unsafe "hs_bindgen_b8a872d97663bea2"
  hs_bindgen_b8a872d97663bea2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceColorKey@
hs_bindgen_b8a872d97663bea2
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_b8a872d97663bea2 =
  BG.fromFFIType hs_bindgen_b8a872d97663bea2_base

{-# NOINLINE sDL_GetSurfaceColorKey #-}

-- | Get the color key (transparent pixel) for a surface.
--
--     The color key is a pixel of the format used by the surface, as generated by SDL_MapRGB().
--
--     If the surface doesn\'t have color key enabled this function returns false.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
--
--     [@key@]: a pointer filled in with the transparent pixel.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_GetSurfaceColorKey =
  BG.unsafePerformIO hs_bindgen_b8a872d97663bea2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceColorMod@
foreign import ccall unsafe "hs_bindgen_d96bb8008d1b87a6"
  hs_bindgen_d96bb8008d1b87a6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceColorMod@
hs_bindgen_d96bb8008d1b87a6
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_d96bb8008d1b87a6 =
  BG.fromFFIType hs_bindgen_d96bb8008d1b87a6_base

{-# NOINLINE sDL_SetSurfaceColorMod #-}

-- | Set an additional color value multiplied into blit operations.
--
--     When this surface is blitted, during the blit operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * (color \/ 255)@
--
--     [@surface@]: the 'SDL_Surface' structure to update.
--
--     [@r@]: the red color value multiplied into blit operations.
--
--     [@g@]: the green color value multiplied into blit operations.
--
--     [@b@]: the blue color value multiplied into blit operations.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_SetSurfaceColorMod =
  BG.unsafePerformIO hs_bindgen_d96bb8008d1b87a6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceColorMod@
foreign import ccall unsafe "hs_bindgen_bc145b87021a07e6"
  hs_bindgen_bc145b87021a07e6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceColorMod@
hs_bindgen_bc145b87021a07e6
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_bc145b87021a07e6 =
  BG.fromFFIType hs_bindgen_bc145b87021a07e6_base

{-# NOINLINE sDL_GetSurfaceColorMod #-}

-- | Get the additional color value multiplied into blit operations.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
--
--     [@r@]: a pointer filled in with the current red color value.
--
--     [@g@]: a pointer filled in with the current green color value.
--
--     [@b@]: a pointer filled in with the current blue color value.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_GetSurfaceColorMod =
  BG.unsafePerformIO hs_bindgen_bc145b87021a07e6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceAlphaMod@
foreign import ccall unsafe "hs_bindgen_44bc0c580740a2b4"
  hs_bindgen_44bc0c580740a2b4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceAlphaMod@
hs_bindgen_44bc0c580740a2b4
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool))
hs_bindgen_44bc0c580740a2b4 =
  BG.fromFFIType hs_bindgen_44bc0c580740a2b4_base

{-# NOINLINE sDL_SetSurfaceAlphaMod #-}

-- | Set an additional alpha value used in blit operations.
--
--     When this surface is blitted, during the blit operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * (alpha \/ 255)@
--
--     [@surface@]: the 'SDL_Surface' structure to update.
--
--     [@alpha@]: the alpha value multiplied into blit operations.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool)
sDL_SetSurfaceAlphaMod =
  BG.unsafePerformIO hs_bindgen_44bc0c580740a2b4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceAlphaMod@
foreign import ccall unsafe "hs_bindgen_2f7b92e198b60348"
  hs_bindgen_2f7b92e198b60348_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceAlphaMod@
hs_bindgen_2f7b92e198b60348
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool))
hs_bindgen_2f7b92e198b60348 =
  BG.fromFFIType hs_bindgen_2f7b92e198b60348_base

{-# NOINLINE sDL_GetSurfaceAlphaMod #-}

-- | Get the additional alpha value used in blit operations.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
--
--     [@alpha@]: a pointer filled in with the current alpha value.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool)
sDL_GetSurfaceAlphaMod =
  BG.unsafePerformIO hs_bindgen_2f7b92e198b60348

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceBlendMode@
foreign import ccall unsafe "hs_bindgen_1abb9d9640e9f83b"
  hs_bindgen_1abb9d9640e9f83b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceBlendMode@
hs_bindgen_1abb9d9640e9f83b
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool))
hs_bindgen_1abb9d9640e9f83b =
  BG.fromFFIType hs_bindgen_1abb9d9640e9f83b_base

{-# NOINLINE sDL_SetSurfaceBlendMode #-}

-- | Set the blend mode used for blit operations.
--
--     To copy a surface to another surface (or texture) without blending with the existing data, the blendmode of the SOURCE surface should be set to @SDL_BLENDMODE_NONE@.
--
--     [@surface@]: the 'SDL_Surface' structure to update.
--
--     [@blendMode@]: the SDL_BlendMode to use for blit blending.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool)
sDL_SetSurfaceBlendMode =
  BG.unsafePerformIO hs_bindgen_1abb9d9640e9f83b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceBlendMode@
foreign import ccall unsafe "hs_bindgen_ddc08ab588ab04b9"
  hs_bindgen_ddc08ab588ab04b9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceBlendMode@
hs_bindgen_ddc08ab588ab04b9
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool))
hs_bindgen_ddc08ab588ab04b9 =
  BG.fromFFIType hs_bindgen_ddc08ab588ab04b9_base

{-# NOINLINE sDL_GetSurfaceBlendMode #-}

-- | Get the blend mode used for blit operations.
--
--     [@surface@]: the 'SDL_Surface' structure to query.
--
--     [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode -> IO BG.CBool)
sDL_GetSurfaceBlendMode =
  BG.unsafePerformIO hs_bindgen_ddc08ab588ab04b9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceClipRect@
foreign import ccall unsafe "hs_bindgen_ba59ae52e07cd998"
  hs_bindgen_ba59ae52e07cd998_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_SetSurfaceClipRect@
hs_bindgen_ba59ae52e07cd998
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Surface -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_ba59ae52e07cd998 =
  BG.fromFFIType hs_bindgen_ba59ae52e07cd998_base

{-# NOINLINE sDL_SetSurfaceClipRect #-}

-- | Set the clipping rectangle for a surface.
--
--     When @surface@ is the destination of a blit, only the area within the clip rectangle is drawn into.
--
--     Note that blits are automatically clipped to the edges of the source and destination surfaces.
--
--     [@surface@]: the 'SDL_Surface' structure to be clipped.
--
--     [@rect@]: the SDL_Rect structure representing the clipping rectangle, or NULL to disable clipping.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_SetSurfaceClipRect =
  BG.unsafePerformIO hs_bindgen_ba59ae52e07cd998

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceClipRect@
foreign import ccall unsafe "hs_bindgen_7d6c81cd63182c7e"
  hs_bindgen_7d6c81cd63182c7e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_GetSurfaceClipRect@
hs_bindgen_7d6c81cd63182c7e
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_7d6c81cd63182c7e =
  BG.fromFFIType hs_bindgen_7d6c81cd63182c7e_base

{-# NOINLINE sDL_GetSurfaceClipRect #-}

-- | Get the clipping rectangle for a surface.
--
--     When @surface@ is the destination of a blit, only the area within the clip rectangle is drawn into.
--
--     [@surface@]: the 'SDL_Surface' structure representing the surface to be clipped.
--
--     [@rect@]: an SDL_Rect structure filled in with the clipping rectangle for the surface.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_GetSurfaceClipRect =
  BG.unsafePerformIO hs_bindgen_7d6c81cd63182c7e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_FlipSurface@
foreign import ccall unsafe "hs_bindgen_3f1f98e8e0b7167f"
  hs_bindgen_3f1f98e8e0b7167f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_FlipSurface@
hs_bindgen_3f1f98e8e0b7167f :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> SDL_FlipMode -> IO BG.CBool))
hs_bindgen_3f1f98e8e0b7167f =
  BG.fromFFIType hs_bindgen_3f1f98e8e0b7167f_base

{-# NOINLINE sDL_FlipSurface #-}

-- | Flip a surface vertically or horizontally.
--
--     [@surface@]: the surface to flip.
--
--     [@flip@]: the direction to flip.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_FlipSurface@, defined at @SDL3\/SDL_surface.h 1019:34@
sDL_FlipSurface :: BG.FunPtr (BG.Ptr SDL_Surface -> SDL_FlipMode -> IO BG.CBool)
sDL_FlipSurface =
  BG.unsafePerformIO hs_bindgen_3f1f98e8e0b7167f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_RotateSurface@
foreign import ccall unsafe "hs_bindgen_bc3ef53813125bc9"
  hs_bindgen_bc3ef53813125bc9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_RotateSurface@
hs_bindgen_bc3ef53813125bc9
  :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.CFloat -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_bc3ef53813125bc9 =
  BG.fromFFIType hs_bindgen_bc3ef53813125bc9_base

{-# NOINLINE sDL_RotateSurface #-}

-- | Return a copy of a surface rotated clockwise a number of degrees.
--
--     The angle of rotation can be negative for counter-clockwise rotation.
--
--     When the rotation isn\'t a multiple of 90 degrees, the resulting surface is larger than the original, with the background filled in with the colorkey, if available, or RGBA 255\/255\/255\/0 if not.
--
--     If @surface@ has the SDL_PROP_SURFACE_ROTATION_FLOAT property set on it, the new copy will have the adjusted value set: if the rotation property is 90 and @angle@ was 30, the new surface will have a property value of 60 (that is: to be upright vs gravity, this surface needs to rotate 60 more degrees). However, note that further rotations on the new surface in this example will produce unexpected results, since the image will have resized and padded to accommodate the not-90 degree angle.
--
--     [@surface@]: the surface to rotate.
--
--     [@angle@]: the rotation angle, in degrees.
--
--     [Returns]: a rotated copy of the surface or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_RotateSurface@, defined at @SDL3\/SDL_surface.h 1048:43@
sDL_RotateSurface :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.CFloat -> IO (BG.Ptr SDL_Surface))
sDL_RotateSurface =
  BG.unsafePerformIO hs_bindgen_bc3ef53813125bc9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_DuplicateSurface@
foreign import ccall unsafe "hs_bindgen_d6a7bd90e75ca1f4"
  hs_bindgen_d6a7bd90e75ca1f4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_DuplicateSurface@
hs_bindgen_d6a7bd90e75ca1f4 :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_d6a7bd90e75ca1f4 =
  BG.fromFFIType hs_bindgen_d6a7bd90e75ca1f4_base

{-# NOINLINE sDL_DuplicateSurface #-}

-- | Creates a new surface identical to the existing surface.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     The returned surface should be freed with @SDL_DestroySurface()@.
--
--     [@surface@]: the surface to duplicate.
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
sDL_DuplicateSurface :: BG.FunPtr (BG.Ptr SDL_Surface -> IO (BG.Ptr SDL_Surface))
sDL_DuplicateSurface =
  BG.unsafePerformIO hs_bindgen_d6a7bd90e75ca1f4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ScaleSurface@
foreign import ccall unsafe "hs_bindgen_3c8c8f89fa471eaf"
  hs_bindgen_3c8c8f89fa471eaf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ScaleSurface@
hs_bindgen_3c8c8f89fa471eaf
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Surface -> BG.CInt -> BG.CInt -> SDL_ScaleMode -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_3c8c8f89fa471eaf =
  BG.fromFFIType hs_bindgen_3c8c8f89fa471eaf_base

{-# NOINLINE sDL_ScaleSurface #-}

-- | Creates a new surface identical to the existing surface, scaled to the desired size.
--
--     The returned surface should be freed with @SDL_DestroySurface()@.
--
--     [@surface@]: the surface to duplicate and scale.
--
--     [@width@]: the width of the new surface.
--
--     [@height@]: the height of the new surface.
--
--     [@scaleMode@]: the 'SDL_ScaleMode' to be used.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.CInt -> BG.CInt -> SDL_ScaleMode -> IO (BG.Ptr SDL_Surface))
sDL_ScaleSurface =
  BG.unsafePerformIO hs_bindgen_3c8c8f89fa471eaf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertSurface@
foreign import ccall unsafe "hs_bindgen_02efcc9cf840132b"
  hs_bindgen_02efcc9cf840132b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertSurface@
hs_bindgen_02efcc9cf840132b
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Surface -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO (BG.Ptr SDL_Surface)))
hs_bindgen_02efcc9cf840132b =
  BG.fromFFIType hs_bindgen_02efcc9cf840132b_base

{-# NOINLINE sDL_ConvertSurface #-}

-- | Copy an existing surface to a new surface of the specified format.
--
--     This function is used to optimize images for faster /repeat/ blitting. This is accomplished by converting the original and storing the result as a new surface. The new, optimized surface can then be used as the source for future blits, making them faster.
--
--     If you are converting to an indexed surface and want to map colors to a palette, you can use @SDL_ConvertSurfaceAndColorspace()@ instead.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     [@surface@]: the existing 'SDL_Surface' structure to convert.
--
--     [@format@]: the new pixel format.
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
  :: BG.FunPtr (BG.Ptr SDL_Surface -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO (BG.Ptr SDL_Surface))
sDL_ConvertSurface =
  BG.unsafePerformIO hs_bindgen_02efcc9cf840132b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertSurfaceAndColorspace@
foreign import ccall unsafe "hs_bindgen_d71b405fb2c63769"
  hs_bindgen_d71b405fb2c63769_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertSurfaceAndColorspace@
hs_bindgen_d71b405fb2c63769
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
             -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
             -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
             -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
             -> IO (BG.Ptr SDL_Surface)
           )
       )
hs_bindgen_d71b405fb2c63769 =
  BG.fromFFIType hs_bindgen_d71b405fb2c63769_base

{-# NOINLINE sDL_ConvertSurfaceAndColorspace #-}

-- | Copy an existing surface to a new surface of the specified format and colorspace.
--
--     This function converts an existing surface to a new format and colorspace and returns the new surface. This will perform any pixel format and colorspace conversion needed.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     [@surface@]: the existing 'SDL_Surface' structure to convert.
--
--     [@format@]: the new pixel format.
--
--     [@palette@]: an optional palette to use for indexed formats, may be NULL.
--
--     [@colorspace@]: the new colorspace.
--
--     [@props@]: an SDL_PropertiesID with additional color properties, or 0.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
         -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
         -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
         -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
         -> IO (BG.Ptr SDL_Surface)
       )
sDL_ConvertSurfaceAndColorspace =
  BG.unsafePerformIO hs_bindgen_d71b405fb2c63769

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertPixels@
foreign import ccall unsafe "hs_bindgen_57fab76de82ac9cf"
  hs_bindgen_57fab76de82ac9cf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertPixels@
hs_bindgen_57fab76de82ac9cf
  :: IO
       ( BG.FunPtr
           ( BG.CInt
             -> BG.CInt
             -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
             -> PtrConst.PtrConst BG.Void
             -> BG.CInt
             -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
             -> BG.Ptr BG.Void
             -> BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_57fab76de82ac9cf =
  BG.fromFFIType hs_bindgen_57fab76de82ac9cf_base

{-# NOINLINE sDL_ConvertPixels #-}

-- | Copy a block of pixels of one format to another format.
--
--     [@width@]: the width of the block to copy, in pixels.
--
--     [@height@]: the height of the block to copy, in pixels.
--
--     [@src_format@]: an SDL_PixelFormat value of the @src@ pixels format.
--
--     [@src@]: a pointer to the source pixels.
--
--     [@src_pitch@]: the pitch of the source pixels, in bytes.
--
--     [@dst_format@]: an SDL_PixelFormat value of the @dst@ pixels format.
--
--     [@dst@]: a pointer to be filled in with new pixel data.
--
--     [@dst_pitch@]: the pitch of the destination pixels, in bytes.
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
  :: BG.FunPtr
       ( BG.CInt
         -> BG.CInt
         -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
         -> PtrConst.PtrConst BG.Void
         -> BG.CInt
         -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
         -> BG.Ptr BG.Void
         -> BG.CInt
         -> IO BG.CBool
       )
sDL_ConvertPixels =
  BG.unsafePerformIO hs_bindgen_57fab76de82ac9cf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertPixelsAndColorspace@
foreign import ccall unsafe "hs_bindgen_8ab04e66f663ce08"
  hs_bindgen_8ab04e66f663ce08_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ConvertPixelsAndColorspace@
hs_bindgen_8ab04e66f663ce08
  :: IO
       ( BG.FunPtr
           ( BG.CInt
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
           )
       )
hs_bindgen_8ab04e66f663ce08 =
  BG.fromFFIType hs_bindgen_8ab04e66f663ce08_base

{-# NOINLINE sDL_ConvertPixelsAndColorspace #-}

-- | Copy a block of pixels of one format and colorspace to another format and colorspace.
--
--     [@width@]: the width of the block to copy, in pixels.
--
--     [@height@]: the height of the block to copy, in pixels.
--
--     [@src_format@]: an SDL_PixelFormat value of the @src@ pixels format.
--
--     [@src_colorspace@]: an SDL_Colorspace value describing the colorspace of the @src@ pixels.
--
--     [@src_properties@]: an SDL_PropertiesID with additional source color properties, or 0.
--
--     [@src@]: a pointer to the source pixels.
--
--     [@src_pitch@]: the pitch of the source pixels, in bytes.
--
--     [@dst_format@]: an SDL_PixelFormat value of the @dst@ pixels format.
--
--     [@dst_colorspace@]: an SDL_Colorspace value describing the colorspace of the @dst@ pixels.
--
--     [@dst_properties@]: an SDL_PropertiesID with additional destination color properties, or 0.
--
--     [@dst@]: a pointer to be filled in with new pixel data.
--
--     [@dst_pitch@]: the pitch of the destination pixels, in bytes.
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
  :: BG.FunPtr
       ( BG.CInt
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
       )
sDL_ConvertPixelsAndColorspace =
  BG.unsafePerformIO hs_bindgen_8ab04e66f663ce08

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_PremultiplyAlpha@
foreign import ccall unsafe "hs_bindgen_fb56322259d07073"
  hs_bindgen_fb56322259d07073_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_PremultiplyAlpha@
hs_bindgen_fb56322259d07073
  :: IO
       ( BG.FunPtr
           ( BG.CInt
             -> BG.CInt
             -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
             -> PtrConst.PtrConst BG.Void
             -> BG.CInt
             -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
             -> BG.Ptr BG.Void
             -> BG.CInt
             -> BG.CBool
             -> IO BG.CBool
           )
       )
hs_bindgen_fb56322259d07073 =
  BG.fromFFIType hs_bindgen_fb56322259d07073_base

{-# NOINLINE sDL_PremultiplyAlpha #-}

-- | Premultiply the alpha on a block of pixels.
--
--     This is safe to use with src == dst, but not for other overlapping areas.
--
--     [@width@]: the width of the block to convert, in pixels.
--
--     [@height@]: the height of the block to convert, in pixels.
--
--     [@src_format@]: an SDL_PixelFormat value of the @src@ pixels format.
--
--     [@src@]: a pointer to the source pixels.
--
--     [@src_pitch@]: the pitch of the source pixels, in bytes.
--
--     [@dst_format@]: an SDL_PixelFormat value of the @dst@ pixels format.
--
--     [@dst@]: a pointer to be filled in with premultiplied pixel data.
--
--     [@dst_pitch@]: the pitch of the destination pixels, in bytes.
--
--     [@linear@]: true to convert from sRGB to linear space for the alpha multiplication, false to do multiplication in sRGB space.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PremultiplyAlpha@, defined at @SDL3\/SDL_surface.h 1232:34@
sDL_PremultiplyAlpha
  :: BG.FunPtr
       ( BG.CInt
         -> BG.CInt
         -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
         -> PtrConst.PtrConst BG.Void
         -> BG.CInt
         -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
         -> BG.Ptr BG.Void
         -> BG.CInt
         -> BG.CBool
         -> IO BG.CBool
       )
sDL_PremultiplyAlpha =
  BG.unsafePerformIO hs_bindgen_fb56322259d07073

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_PremultiplySurfaceAlpha@
foreign import ccall unsafe "hs_bindgen_6d7894c44ea2dfc7"
  hs_bindgen_6d7894c44ea2dfc7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_PremultiplySurfaceAlpha@
hs_bindgen_6d7894c44ea2dfc7 :: IO (BG.FunPtr (BG.Ptr SDL_Surface -> BG.CBool -> IO BG.CBool))
hs_bindgen_6d7894c44ea2dfc7 =
  BG.fromFFIType hs_bindgen_6d7894c44ea2dfc7_base

{-# NOINLINE sDL_PremultiplySurfaceAlpha #-}

-- | Premultiply the alpha in a surface.
--
--     This is safe to use with src == dst, but not for other overlapping areas.
--
--     [@surface@]: the surface to modify.
--
--     [@linear@]: true to convert from sRGB to linear space for the alpha multiplication, false to do multiplication in sRGB space.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PremultiplySurfaceAlpha@, defined at @SDL3\/SDL_surface.h 1250:34@
sDL_PremultiplySurfaceAlpha :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.CBool -> IO BG.CBool)
sDL_PremultiplySurfaceAlpha =
  BG.unsafePerformIO hs_bindgen_6d7894c44ea2dfc7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ClearSurface@
foreign import ccall unsafe "hs_bindgen_3eb9b7722a04b8f8"
  hs_bindgen_3eb9b7722a04b8f8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ClearSurface@
hs_bindgen_3eb9b7722a04b8f8
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Surface -> BG.CFloat -> BG.CFloat -> BG.CFloat -> BG.CFloat -> IO BG.CBool))
hs_bindgen_3eb9b7722a04b8f8 =
  BG.fromFFIType hs_bindgen_3eb9b7722a04b8f8_base

{-# NOINLINE sDL_ClearSurface #-}

-- | Clear a surface with a specific color, with floating point precision.
--
--     This function handles all surface formats, and ignores any clip rectangle.
--
--     If the surface is YUV, the color is assumed to be in the sRGB colorspace, otherwise the color is assumed to be in the colorspace of the surface.
--
--     [@surface@]: the 'SDL_Surface' to clear.
--
--     [@r@]: the red component of the pixel, normally in the range 0-1.
--
--     [@g@]: the green component of the pixel, normally in the range 0-1.
--
--     [@b@]: the blue component of the pixel, normally in the range 0-1.
--
--     [@a@]: the alpha component of the pixel, normally in the range 0-1.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ClearSurface@, defined at @SDL3\/SDL_surface.h 1273:34@
sDL_ClearSurface
  :: BG.FunPtr (BG.Ptr SDL_Surface -> BG.CFloat -> BG.CFloat -> BG.CFloat -> BG.CFloat -> IO BG.CBool)
sDL_ClearSurface =
  BG.unsafePerformIO hs_bindgen_3eb9b7722a04b8f8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_FillSurfaceRect@
foreign import ccall unsafe "hs_bindgen_d466d8dde16f547b"
  hs_bindgen_d466d8dde16f547b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_FillSurfaceRect@
hs_bindgen_d466d8dde16f547b
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_d466d8dde16f547b =
  BG.fromFFIType hs_bindgen_d466d8dde16f547b_base

{-# NOINLINE sDL_FillSurfaceRect #-}

-- | Perform a fast fill of a rectangle with a specific color.
--
--     @color@ should be a pixel of the format used by the surface, and can be generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an alpha component then the destination is simply filled with that alpha information, no blending takes place.
--
--     If there is a clip rectangle set on the destination (set via @SDL_SetSurfaceClipRect()@), then this function will fill based on the intersection of the clip rectangle and @rect@.
--
--     [@dst@]: the 'SDL_Surface' structure that is the drawing target.
--
--     [@rect@]: the SDL_Rect structure representing the rectangle to fill, or NULL to fill the entire surface.
--
--     [@color@]: the color to fill with.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_FillSurfaceRect =
  BG.unsafePerformIO hs_bindgen_d466d8dde16f547b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_FillSurfaceRects@
foreign import ccall unsafe "hs_bindgen_b0bc5bc8b57e73e3"
  hs_bindgen_b0bc5bc8b57e73e3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_FillSurfaceRects@
hs_bindgen_b0bc5bc8b57e73e3
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.CInt
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_b0bc5bc8b57e73e3 =
  BG.fromFFIType hs_bindgen_b0bc5bc8b57e73e3_base

{-# NOINLINE sDL_FillSurfaceRects #-}

-- | Perform a fast fill of a set of rectangles with a specific color.
--
--     @color@ should be a pixel of the format used by the surface, and can be generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an alpha component then the destination is simply filled with that alpha information, no blending takes place.
--
--     If there is a clip rectangle set on the destination (set via @SDL_SetSurfaceClipRect()@), then this function will fill based on the intersection of the clip rectangle and @rect@.
--
--     [@dst@]: the 'SDL_Surface' structure that is the drawing target.
--
--     [@rects@]: an array of SDL_Rects representing the rectangles to fill.
--
--     [@count@]: the number of rectangles in the array.
--
--     [@color@]: the color to fill with.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.CInt
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_FillSurfaceRects =
  BG.unsafePerformIO hs_bindgen_b0bc5bc8b57e73e3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurface@
foreign import ccall unsafe "hs_bindgen_a29859c35fa4ca59"
  hs_bindgen_a29859c35fa4ca59_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurface@
hs_bindgen_a29859c35fa4ca59
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> IO BG.CBool
           )
       )
hs_bindgen_a29859c35fa4ca59 =
  BG.fromFFIType hs_bindgen_a29859c35fa4ca59_base

{-# NOINLINE sDL_BlitSurface #-}

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
--     [@src@]: the 'SDL_Surface' structure to be copied from.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
--
--     [@dst@]: the 'SDL_Surface' structure that is the blit target.
--
--     [@dstrect@]: the SDL_Rect structure representing the x and y position in the destination surface, or NULL for (0,0). The width and height are ignored, and are copied from @srcrect@. If you want a specific width and height, you should use @SDL_BlitSurfaceScaled()@.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> IO BG.CBool
       )
sDL_BlitSurface =
  BG.unsafePerformIO hs_bindgen_a29859c35fa4ca59

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceUnchecked@
foreign import ccall unsafe "hs_bindgen_3f540dd5f5c2d037"
  hs_bindgen_3f540dd5f5c2d037_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceUnchecked@
hs_bindgen_3f540dd5f5c2d037
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> IO BG.CBool
           )
       )
hs_bindgen_3f540dd5f5c2d037 =
  BG.fromFFIType hs_bindgen_3f540dd5f5c2d037_base

{-# NOINLINE sDL_BlitSurfaceUnchecked #-}

-- | Perform low-level surface blitting only.
--
--     This is a semi-private blit function and it performs low-level surface blitting, assuming the input rectangles have already been clipped.
--
--     [@src@]: the 'SDL_Surface' structure to be copied from.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, may not be NULL.
--
--     [@dst@]: the 'SDL_Surface' structure that is the blit target.
--
--     [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, may not be NULL.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> IO BG.CBool
       )
sDL_BlitSurfaceUnchecked =
  BG.unsafePerformIO hs_bindgen_3f540dd5f5c2d037

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceScaled@
foreign import ccall unsafe "hs_bindgen_9a9b4e0ef4c33fb3"
  hs_bindgen_9a9b4e0ef4c33fb3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceScaled@
hs_bindgen_9a9b4e0ef4c33fb3
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> SDL_ScaleMode
             -> IO BG.CBool
           )
       )
hs_bindgen_9a9b4e0ef4c33fb3 =
  BG.fromFFIType hs_bindgen_9a9b4e0ef4c33fb3_base

{-# NOINLINE sDL_BlitSurfaceScaled #-}

-- | Perform a scaled blit to a destination surface, which may be of a different format.
--
--     [@src@]: the 'SDL_Surface' structure to be copied from.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
--
--     [@dst@]: the 'SDL_Surface' structure that is the blit target.
--
--     [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire destination surface.
--
--     [@scaleMode@]: the 'SDL_ScaleMode' to be used.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> SDL_ScaleMode
         -> IO BG.CBool
       )
sDL_BlitSurfaceScaled =
  BG.unsafePerformIO hs_bindgen_9a9b4e0ef4c33fb3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceUncheckedScaled@
foreign import ccall unsafe "hs_bindgen_4d0c17a14d7334d5"
  hs_bindgen_4d0c17a14d7334d5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceUncheckedScaled@
hs_bindgen_4d0c17a14d7334d5
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> SDL_ScaleMode
             -> IO BG.CBool
           )
       )
hs_bindgen_4d0c17a14d7334d5 =
  BG.fromFFIType hs_bindgen_4d0c17a14d7334d5_base

{-# NOINLINE sDL_BlitSurfaceUncheckedScaled #-}

-- | Perform low-level surface scaled blitting only.
--
--     This is a semi-private function and it performs low-level surface blitting, assuming the input rectangles have already been clipped.
--
--     [@src@]: the 'SDL_Surface' structure to be copied from.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, may not be NULL.
--
--     [@dst@]: the 'SDL_Surface' structure that is the blit target.
--
--     [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, may not be NULL.
--
--     [@scaleMode@]: the 'SDL_ScaleMode' to be used.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> SDL_ScaleMode
         -> IO BG.CBool
       )
sDL_BlitSurfaceUncheckedScaled =
  BG.unsafePerformIO hs_bindgen_4d0c17a14d7334d5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_StretchSurface@
foreign import ccall unsafe "hs_bindgen_1a9d00d4cf3623eb"
  hs_bindgen_1a9d00d4cf3623eb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_StretchSurface@
hs_bindgen_1a9d00d4cf3623eb
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> SDL_ScaleMode
             -> IO BG.CBool
           )
       )
hs_bindgen_1a9d00d4cf3623eb =
  BG.fromFFIType hs_bindgen_1a9d00d4cf3623eb_base

{-# NOINLINE sDL_StretchSurface #-}

-- | Perform a stretched pixel copy from one surface to another.
--
--     [@src@]: the 'SDL_Surface' structure to be copied from.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
--
--     [@dst@]: the 'SDL_Surface' structure that is the blit target.
--
--     [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire destination surface.
--
--     [@scaleMode@]: the 'SDL_ScaleMode' to be used.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> SDL_ScaleMode
         -> IO BG.CBool
       )
sDL_StretchSurface =
  BG.unsafePerformIO hs_bindgen_1a9d00d4cf3623eb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceTiled@
foreign import ccall unsafe "hs_bindgen_215dfb2882cacc76"
  hs_bindgen_215dfb2882cacc76_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceTiled@
hs_bindgen_215dfb2882cacc76
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> IO BG.CBool
           )
       )
hs_bindgen_215dfb2882cacc76 =
  BG.fromFFIType hs_bindgen_215dfb2882cacc76_base

{-# NOINLINE sDL_BlitSurfaceTiled #-}

-- | Perform a tiled blit to a destination surface, which may be of a different format.
--
--     The pixels in @srcrect@ will be repeated as many times as needed to completely fill @dstrect@.
--
--     [@src@]: the 'SDL_Surface' structure to be copied from.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
--
--     [@dst@]: the 'SDL_Surface' structure that is the blit target.
--
--     [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire surface.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> IO BG.CBool
       )
sDL_BlitSurfaceTiled =
  BG.unsafePerformIO hs_bindgen_215dfb2882cacc76

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceTiledWithScale@
foreign import ccall unsafe "hs_bindgen_c33eb3f53084c8a3"
  hs_bindgen_c33eb3f53084c8a3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurfaceTiledWithScale@
hs_bindgen_c33eb3f53084c8a3
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.CFloat
             -> SDL_ScaleMode
             -> BG.Ptr SDL_Surface
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> IO BG.CBool
           )
       )
hs_bindgen_c33eb3f53084c8a3 =
  BG.fromFFIType hs_bindgen_c33eb3f53084c8a3_base

{-# NOINLINE sDL_BlitSurfaceTiledWithScale #-}

-- | Perform a scaled and tiled blit to a destination surface, which may be of a different format.
--
--     The pixels in @srcrect@ will be scaled and repeated as many times as needed to completely fill @dstrect@.
--
--     [@src@]: the 'SDL_Surface' structure to be copied from.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
--
--     [@scale@]: the scale used to transform srcrect into the destination rectangle, e.g. a 32x32 texture with a scale of 2 would fill 64x64 tiles.
--
--     [@scaleMode@]: scale algorithm to be used.
--
--     [@dst@]: the 'SDL_Surface' structure that is the blit target.
--
--     [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire surface.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.CFloat
         -> SDL_ScaleMode
         -> BG.Ptr SDL_Surface
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> IO BG.CBool
       )
sDL_BlitSurfaceTiledWithScale =
  BG.unsafePerformIO hs_bindgen_c33eb3f53084c8a3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurface9Grid@
foreign import ccall unsafe "hs_bindgen_34b06f5d5e4b0b97"
  hs_bindgen_34b06f5d5e4b0b97_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_BlitSurface9Grid@
hs_bindgen_34b06f5d5e4b0b97
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
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
           )
       )
hs_bindgen_34b06f5d5e4b0b97 =
  BG.fromFFIType hs_bindgen_34b06f5d5e4b0b97_base

{-# NOINLINE sDL_BlitSurface9Grid #-}

-- | Perform a scaled blit using the 9-grid algorithm to a destination surface, which may be of a different format.
--
--     The pixels in the source surface are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then stretched into place to cover the remaining destination rectangle.
--
--     [@src@]: the 'SDL_Surface' structure to be copied from.
--
--     [@srcrect@]: the SDL_Rect structure representing the rectangle to be used for the 9-grid, or NULL to use the entire surface.
--
--     [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
--
--     [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
--
--     [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
--
--     [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
--
--     [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled blit.
--
--     [@scaleMode@]: scale algorithm to be used.
--
--     [@dst@]: the 'SDL_Surface' structure that is the blit target.
--
--     [@dstrect@]: the SDL_Rect structure representing the target rectangle in the destination surface, or NULL to fill the entire surface.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
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
       )
sDL_BlitSurface9Grid =
  BG.unsafePerformIO hs_bindgen_34b06f5d5e4b0b97

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_MapSurfaceRGB@
foreign import ccall unsafe "hs_bindgen_22cd4dcdb87e7f1a"
  hs_bindgen_22cd4dcdb87e7f1a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_MapSurfaceRGB@
hs_bindgen_22cd4dcdb87e7f1a
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
           )
       )
hs_bindgen_22cd4dcdb87e7f1a =
  BG.fromFFIType hs_bindgen_22cd4dcdb87e7f1a_base

{-# NOINLINE sDL_MapSurfaceRGB #-}

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
--     [@surface@]: the surface to use for the pixel format and palette.
--
--     [@r@]: the red component of the pixel in the range 0-255.
--
--     [@g@]: the green component of the pixel in the range 0-255.
--
--     [@b@]: the blue component of the pixel in the range 0-255.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
       )
sDL_MapSurfaceRGB =
  BG.unsafePerformIO hs_bindgen_22cd4dcdb87e7f1a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_MapSurfaceRGBA@
foreign import ccall unsafe "hs_bindgen_0a9db974db6877bb"
  hs_bindgen_0a9db974db6877bb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_MapSurfaceRGBA@
hs_bindgen_0a9db974db6877bb
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
           )
       )
hs_bindgen_0a9db974db6877bb =
  BG.fromFFIType hs_bindgen_0a9db974db6877bb_base

{-# NOINLINE sDL_MapSurfaceRGBA #-}

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
--     [@surface@]: the surface to use for the pixel format and palette.
--
--     [@r@]: the red component of the pixel in the range 0-255.
--
--     [@g@]: the green component of the pixel in the range 0-255.
--
--     [@b@]: the blue component of the pixel in the range 0-255.
--
--     [@a@]: the alpha component of the pixel in the range 0-255.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
       )
sDL_MapSurfaceRGBA =
  BG.unsafePerformIO hs_bindgen_0a9db974db6877bb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ReadSurfacePixel@
foreign import ccall unsafe "hs_bindgen_621010702d3faa18"
  hs_bindgen_621010702d3faa18_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ReadSurfacePixel@
hs_bindgen_621010702d3faa18
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> BG.CInt
             -> BG.CInt
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_621010702d3faa18 =
  BG.fromFFIType hs_bindgen_621010702d3faa18_base

{-# NOINLINE sDL_ReadSurfacePixel #-}

-- | Retrieves a single pixel from a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     Like SDL_GetRGBA, this uses the entire 0..255 range when converting color components from pixel formats with less than 8 bits per RGB component.
--
--     [@surface@]: the surface to read.
--
--     [@x@]: the horizontal coordinate, 0 \<= x \< width.
--
--     [@y@]: the vertical coordinate, 0 \<= y \< height.
--
--     [@r@]: a pointer filled in with the red channel, 0-255, or NULL to ignore this channel.
--
--     [@g@]: a pointer filled in with the green channel, 0-255, or NULL to ignore this channel.
--
--     [@b@]: a pointer filled in with the blue channel, 0-255, or NULL to ignore this channel.
--
--     [@a@]: a pointer filled in with the alpha channel, 0-255, or NULL to ignore this channel.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadSurfacePixel@, defined at @SDL3\/SDL_surface.h 1685:34@
sDL_ReadSurfacePixel
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> BG.CInt
         -> BG.CInt
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_ReadSurfacePixel =
  BG.unsafePerformIO hs_bindgen_621010702d3faa18

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ReadSurfacePixelFloat@
foreign import ccall unsafe "hs_bindgen_8c567029e60d9131"
  hs_bindgen_8c567029e60d9131_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_ReadSurfacePixelFloat@
hs_bindgen_8c567029e60d9131
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> BG.CInt
             -> BG.CInt
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> BG.Ptr BG.CFloat
             -> IO BG.CBool
           )
       )
hs_bindgen_8c567029e60d9131 =
  BG.fromFFIType hs_bindgen_8c567029e60d9131_base

{-# NOINLINE sDL_ReadSurfacePixelFloat #-}

-- | Retrieves a single pixel from a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     [@surface@]: the surface to read.
--
--     [@x@]: the horizontal coordinate, 0 \<= x \< width.
--
--     [@y@]: the vertical coordinate, 0 \<= y \< height.
--
--     [@r@]: a pointer filled in with the red channel, normally in the range 0-1, or NULL to ignore this channel.
--
--     [@g@]: a pointer filled in with the green channel, normally in the range 0-1, or NULL to ignore this channel.
--
--     [@b@]: a pointer filled in with the blue channel, normally in the range 0-1, or NULL to ignore this channel.
--
--     [@a@]: a pointer filled in with the alpha channel, normally in the range 0-1, or NULL to ignore this channel.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadSurfacePixelFloat@, defined at @SDL3\/SDL_surface.h 1712:34@
sDL_ReadSurfacePixelFloat
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> BG.CInt
         -> BG.CInt
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> BG.Ptr BG.CFloat
         -> IO BG.CBool
       )
sDL_ReadSurfacePixelFloat =
  BG.unsafePerformIO hs_bindgen_8c567029e60d9131

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_WriteSurfacePixel@
foreign import ccall unsafe "hs_bindgen_b9a3ff7742c64b4a"
  hs_bindgen_b9a3ff7742c64b4a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_WriteSurfacePixel@
hs_bindgen_b9a3ff7742c64b4a
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> BG.CInt
             -> BG.CInt
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO BG.CBool
           )
       )
hs_bindgen_b9a3ff7742c64b4a =
  BG.fromFFIType hs_bindgen_b9a3ff7742c64b4a_base

{-# NOINLINE sDL_WriteSurfacePixel #-}

-- | Writes a single pixel to a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     Like SDL_MapRGBA, this uses the entire 0..255 range when converting color components from pixel formats with less than 8 bits per RGB component.
--
--     [@surface@]: the surface to write.
--
--     [@x@]: the horizontal coordinate, 0 \<= x \< width.
--
--     [@y@]: the vertical coordinate, 0 \<= y \< height.
--
--     [@r@]: the red channel value, 0-255.
--
--     [@g@]: the green channel value, 0-255.
--
--     [@b@]: the blue channel value, 0-255.
--
--     [@a@]: the alpha channel value, 0-255.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteSurfacePixel@, defined at @SDL3\/SDL_surface.h 1738:34@
sDL_WriteSurfacePixel
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> BG.CInt
         -> BG.CInt
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO BG.CBool
       )
sDL_WriteSurfacePixel =
  BG.unsafePerformIO hs_bindgen_b9a3ff7742c64b4a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_WriteSurfacePixelFloat@
foreign import ccall unsafe "hs_bindgen_622524c6fb921b4c"
  hs_bindgen_622524c6fb921b4c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Surface_get_SDL_WriteSurfacePixelFloat@
hs_bindgen_622524c6fb921b4c
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Surface
             -> BG.CInt
             -> BG.CInt
             -> BG.CFloat
             -> BG.CFloat
             -> BG.CFloat
             -> BG.CFloat
             -> IO BG.CBool
           )
       )
hs_bindgen_622524c6fb921b4c =
  BG.fromFFIType hs_bindgen_622524c6fb921b4c_base

{-# NOINLINE sDL_WriteSurfacePixelFloat #-}

-- | Writes a single pixel to a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     [@surface@]: the surface to write.
--
--     [@x@]: the horizontal coordinate, 0 \<= x \< width.
--
--     [@y@]: the vertical coordinate, 0 \<= y \< height.
--
--     [@r@]: the red channel value, normally in the range 0-1.
--
--     [@g@]: the green channel value, normally in the range 0-1.
--
--     [@b@]: the blue channel value, normally in the range 0-1.
--
--     [@a@]: the alpha channel value, normally in the range 0-1.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteSurfacePixelFloat@, defined at @SDL3\/SDL_surface.h 1761:34@
sDL_WriteSurfacePixelFloat
  :: BG.FunPtr
       ( BG.Ptr SDL_Surface
         -> BG.CInt
         -> BG.CInt
         -> BG.CFloat
         -> BG.CFloat
         -> BG.CFloat
         -> BG.CFloat
         -> IO BG.CBool
       )
sDL_WriteSurfacePixelFloat =
  BG.unsafePerformIO hs_bindgen_622524c6fb921b4c
