{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Pixels.Safe (
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_GetPixelFormatName,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_GetMasksForPixelFormat,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_GetPixelFormatForMasks,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_GetPixelFormatDetails,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_CreatePalette,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_SetPaletteColors,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_DestroyPalette,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_MapRGB,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_MapRGBA,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_GetRGB,
  SDL3.Sys.Bindgen.Pixels.Safe.sDL_GetRGBA,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Pixels
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_pixels.h>"
         , "char const *hs_bindgen_2b62d5600ae602f5 ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (SDL_GetPixelFormatName)(arg1);"
         , "}"
         , "_Bool hs_bindgen_29ba238b8cb85c9d ("
         , "  SDL_PixelFormat arg1,"
         , "  signed int *arg2,"
         , "  Uint32 *arg3,"
         , "  Uint32 *arg4,"
         , "  Uint32 *arg5,"
         , "  Uint32 *arg6"
         , ")"
         , "{"
         , "  return (SDL_GetMasksForPixelFormat)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "SDL_PixelFormat hs_bindgen_34711b04d6421f67 ("
         , "  signed int arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4,"
         , "  Uint32 arg5"
         , ")"
         , "{"
         , "  return (SDL_GetPixelFormatForMasks)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "SDL_PixelFormatDetails const *hs_bindgen_4112185e47f9577f ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (SDL_GetPixelFormatDetails)(arg1);"
         , "}"
         , "SDL_Palette *hs_bindgen_4619b4a327b9cf94 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_CreatePalette)(arg1);"
         , "}"
         , "_Bool hs_bindgen_e629f58dcd1a6db5 ("
         , "  SDL_Palette *arg1,"
         , "  SDL_Color const *arg2,"
         , "  signed int arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return (SDL_SetPaletteColors)(arg1, arg2, arg3, arg4);"
         , "}"
         , "void hs_bindgen_e593348e8aff0b78 ("
         , "  SDL_Palette *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyPalette)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_37bc20a6b313ac41 ("
         , "  SDL_PixelFormatDetails const *arg1,"
         , "  SDL_Palette const *arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5"
         , ")"
         , "{"
         , "  return (SDL_MapRGB)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "Uint32 hs_bindgen_3fecde9ee209df97 ("
         , "  SDL_PixelFormatDetails const *arg1,"
         , "  SDL_Palette const *arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5,"
         , "  Uint8 arg6"
         , ")"
         , "{"
         , "  return (SDL_MapRGBA)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "void hs_bindgen_da0c576777e026d9 ("
         , "  Uint32 arg1,"
         , "  SDL_PixelFormatDetails const *arg2,"
         , "  SDL_Palette const *arg3,"
         , "  Uint8 *arg4,"
         , "  Uint8 *arg5,"
         , "  Uint8 *arg6"
         , ")"
         , "{"
         , "  (SDL_GetRGB)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "void hs_bindgen_9ace50541bcd4e41 ("
         , "  Uint32 arg1,"
         , "  SDL_PixelFormatDetails const *arg2,"
         , "  SDL_Palette const *arg3,"
         , "  Uint8 *arg4,"
         , "  Uint8 *arg5,"
         , "  Uint8 *arg6,"
         , "  Uint8 *arg7"
         , ")"
         , "{"
         , "  (SDL_GetRGBA)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetPixelFormatName@
foreign import ccall safe "hs_bindgen_2b62d5600ae602f5"
  hs_bindgen_2b62d5600ae602f5_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetPixelFormatName@
hs_bindgen_2b62d5600ae602f5
  :: SDL_PixelFormat
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_2b62d5600ae602f5 =
  BG.fromFFIType hs_bindgen_2b62d5600ae602f5_base

-- | Get the human readable name of a pixel format.
--
--     [Returns]: the human readable name of the specified pixel format or \"SDL_PIXELFORMAT_UNKNOWN\" if the format isn\'t recognized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetPixelFormatName@, defined at @SDL3\/SDL_pixels.h 1185:42@
sDL_GetPixelFormatName
  :: SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the pixel format to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetPixelFormatName = hs_bindgen_2b62d5600ae602f5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetMasksForPixelFormat@
foreign import ccall safe "hs_bindgen_29ba238b8cb85c9d"
  hs_bindgen_29ba238b8cb85c9d_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetMasksForPixelFormat@
hs_bindgen_29ba238b8cb85c9d
  :: SDL_PixelFormat
  -> BG.Ptr BG.CInt
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_29ba238b8cb85c9d =
  BG.fromFFIType hs_bindgen_29ba238b8cb85c9d_base

-- | Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPixelFormatForMasks'
--
--     [C declaration]: @SDL_GetMasksForPixelFormat@, defined at @SDL3\/SDL_pixels.h 1205:34@
sDL_GetMasksForPixelFormat
  :: SDL_PixelFormat
  -- ^
  --
  --           [@format@]: one of the 'SDL_PixelFormat' values.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@bpp@]: a bits per pixel value; usually 15, 16, or 32.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@Rmask@]: a pointer filled in with the red mask for the format.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@Gmask@]: a pointer filled in with the green mask for the format.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@Bmask@]: a pointer filled in with the blue mask for the format.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@Amask@]: a pointer filled in with the alpha mask for the format.
  -> IO BG.CBool
sDL_GetMasksForPixelFormat =
  hs_bindgen_29ba238b8cb85c9d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetPixelFormatForMasks@
foreign import ccall safe "hs_bindgen_34711b04d6421f67"
  hs_bindgen_34711b04d6421f67_base
    :: BG.Int32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetPixelFormatForMasks@
hs_bindgen_34711b04d6421f67
  :: BG.CInt
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL_PixelFormat
hs_bindgen_34711b04d6421f67 =
  BG.fromFFIType hs_bindgen_34711b04d6421f67_base

-- | Convert a bpp value and RGBA masks to an enumerated pixel format.
--
--     This will return @SDL_PIXELFORMAT_UNKNOWN@ if the conversion wasn\'t possible.
--
--     [Returns]: the 'SDL_PixelFormat' value corresponding to the format masks, or SDL_PIXELFORMAT_UNKNOWN if there isn\'t a match.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMasksForPixelFormat'
--
--     [C declaration]: @SDL_GetPixelFormatForMasks@, defined at @SDL3\/SDL_pixels.h 1227:45@
sDL_GetPixelFormatForMasks
  :: BG.CInt
  -- ^
  --
  --           [@bpp@]: a bits per pixel value; usually 15, 16, or 32.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@Rmask@]: the red mask for the format.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@Gmask@]: the green mask for the format.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@Bmask@]: the blue mask for the format.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@Amask@]: the alpha mask for the format.
  -> IO SDL_PixelFormat
sDL_GetPixelFormatForMasks =
  hs_bindgen_34711b04d6421f67

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetPixelFormatDetails@
foreign import ccall safe "hs_bindgen_4112185e47f9577f"
  hs_bindgen_4112185e47f9577f_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetPixelFormatDetails@
hs_bindgen_4112185e47f9577f
  :: SDL_PixelFormat
  -> IO (PtrConst.PtrConst SDL_PixelFormatDetails)
hs_bindgen_4112185e47f9577f =
  BG.fromFFIType hs_bindgen_4112185e47f9577f_base

-- | Create an 'SDL_PixelFormatDetails' structure corresponding to a pixel format.
--
--     Returned structure may come from a shared global cache (i.e. not newly allocated), and hence should not be modified, especially the palette. Weird errors such as @Blit combination not supported@ may occur.
--
--     [Returns]: a pointer to a 'SDL_PixelFormatDetails' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetPixelFormatDetails@, defined at @SDL3\/SDL_pixels.h 1244:60@
sDL_GetPixelFormatDetails
  :: SDL_PixelFormat
  -- ^
  --
  --           [@format@]: one of the 'SDL_PixelFormat' values.
  -> IO (PtrConst.PtrConst SDL_PixelFormatDetails)
sDL_GetPixelFormatDetails =
  hs_bindgen_4112185e47f9577f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_CreatePalette@
foreign import ccall safe "hs_bindgen_4619b4a327b9cf94"
  hs_bindgen_4619b4a327b9cf94_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_CreatePalette@
hs_bindgen_4619b4a327b9cf94
  :: BG.CInt
  -> IO (BG.Ptr SDL_Palette)
hs_bindgen_4619b4a327b9cf94 =
  BG.fromFFIType hs_bindgen_4619b4a327b9cf94_base

-- | Create a palette structure with the specified number of color entries.
--
--     The palette entries are initialized to white.
--
--     [Returns]: a new 'SDL_Palette' structure on success or NULL on failure (e.g. if there wasn\'t enough memory); call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyPalette', 'sDL_SetPaletteColors', SDL_SetSurfacePalette
--
--     [C declaration]: @SDL_CreatePalette@, defined at @SDL3\/SDL_pixels.h 1264:43@
sDL_CreatePalette
  :: BG.CInt
  -- ^
  --
  --           [@ncolors@]: represents the number of color entries in the color palette.
  -> IO (BG.Ptr SDL_Palette)
sDL_CreatePalette = hs_bindgen_4619b4a327b9cf94

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_SetPaletteColors@
foreign import ccall safe "hs_bindgen_e629f58dcd1a6db5"
  hs_bindgen_e629f58dcd1a6db5_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_SetPaletteColors@
hs_bindgen_e629f58dcd1a6db5
  :: BG.Ptr SDL_Palette
  -> PtrConst.PtrConst SDL_Color
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_e629f58dcd1a6db5 =
  BG.fromFFIType hs_bindgen_e629f58dcd1a6db5_base

-- | Set a range of colors in a palette.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified or destroyed in another thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetPaletteColors@, defined at @SDL3\/SDL_pixels.h 1281:34@
sDL_SetPaletteColors
  :: BG.Ptr SDL_Palette
  -- ^
  --
  --           [@palette@]: the 'SDL_Palette' structure to modify.
  -> PtrConst.PtrConst SDL_Color
  -- ^
  --
  --           [@colors@]: an array of 'SDL_Color' structures to copy into the palette.
  -> BG.CInt
  -- ^
  --
  --           [@firstcolor@]: the index of the first palette entry to modify.
  -> BG.CInt
  -- ^
  --
  --           [@ncolors@]: the number of entries to modify.
  -> IO BG.CBool
sDL_SetPaletteColors = hs_bindgen_e629f58dcd1a6db5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_DestroyPalette@
foreign import ccall safe "hs_bindgen_e593348e8aff0b78"
  hs_bindgen_e593348e8aff0b78_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_DestroyPalette@
hs_bindgen_e593348e8aff0b78
  :: BG.Ptr SDL_Palette
  -> IO ()
hs_bindgen_e593348e8aff0b78 =
  BG.fromFFIType hs_bindgen_e593348e8aff0b78_base

-- | Free a palette created with @SDL_CreatePalette()@.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified or destroyed in another thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreatePalette'
--
--     [C declaration]: @SDL_DestroyPalette@, defined at @SDL3\/SDL_pixels.h 1295:34@
sDL_DestroyPalette
  :: BG.Ptr SDL_Palette
  -- ^
  --
  --           [@palette@]: the 'SDL_Palette' structure to be freed.
  -> IO ()
sDL_DestroyPalette = hs_bindgen_e593348e8aff0b78

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_MapRGB@
foreign import ccall safe "hs_bindgen_37bc20a6b313ac41"
  hs_bindgen_37bc20a6b313ac41_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_MapRGB@
hs_bindgen_37bc20a6b313ac41
  :: PtrConst.PtrConst SDL_PixelFormatDetails
  -> PtrConst.PtrConst SDL_Palette
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_37bc20a6b313ac41 =
  BG.fromFFIType hs_bindgen_37bc20a6b313ac41_base

-- | Map an RGB triple to an opaque pixel value for a given pixel format.
--
--     This function maps the RGB color value to the specified pixel format and returns the pixel value best approximating the given RGB color value for the given pixel format.
--
--     If the format has a palette (8-bit) the index of the closest matching color in the palette will be returned.
--
--     If the specified pixel format has an alpha component it will be returned as all 1 bits (fully opaque).
--
--     If the pixel format bpp (color depth) is less than 32-bpp then the unused upper bits of the return value can safely be ignored (e.g., with a 16-bpp format the return value can be assigned to a Uint16, and similarly a Uint8 for an 8-bpp format).
--
--     [Returns]: a pixel value.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPixelFormatDetails', 'sDL_GetRGB', 'sDL_MapRGBA', SDL_MapSurfaceRGB
--
--     [C declaration]: @SDL_MapRGB@, defined at @SDL3\/SDL_pixels.h 1333:36@
sDL_MapRGB
  :: PtrConst.PtrConst SDL_PixelFormatDetails
  -- ^
  --
  --           [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
  -> PtrConst.PtrConst SDL_Palette
  -- ^
  --
  --           [@palette@]: an optional palette for indexed formats, may be NULL.
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
sDL_MapRGB = hs_bindgen_37bc20a6b313ac41

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_MapRGBA@
foreign import ccall safe "hs_bindgen_3fecde9ee209df97"
  hs_bindgen_3fecde9ee209df97_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> BG.Word8
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_MapRGBA@
hs_bindgen_3fecde9ee209df97
  :: PtrConst.PtrConst SDL_PixelFormatDetails
  -> PtrConst.PtrConst SDL_Palette
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_3fecde9ee209df97 =
  BG.fromFFIType hs_bindgen_3fecde9ee209df97_base

-- | Map an RGBA quadruple to a pixel value for a given pixel format.
--
--     This function maps the RGBA color value to the specified pixel format and returns the pixel value best approximating the given RGBA color value for the given pixel format.
--
--     If the specified pixel format has no alpha component the alpha value will be ignored (as it will be in formats with a palette).
--
--     If the format has a palette (8-bit) the index of the closest matching color in the palette will be returned.
--
--     If the pixel format bpp (color depth) is less than 32-bpp then the unused upper bits of the return value can safely be ignored (e.g., with a 16-bpp format the return value can be assigned to a Uint16, and similarly a Uint8 for an 8-bpp format).
--
--     [Returns]: a pixel value.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPixelFormatDetails', 'sDL_GetRGBA', 'sDL_MapRGB', SDL_MapSurfaceRGBA
--
--     [C declaration]: @SDL_MapRGBA@, defined at @SDL3\/SDL_pixels.h 1372:36@
sDL_MapRGBA
  :: PtrConst.PtrConst SDL_PixelFormatDetails
  -- ^
  --
  --           [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
  -> PtrConst.PtrConst SDL_Palette
  -- ^
  --
  --           [@palette@]: an optional palette for indexed formats, may be NULL.
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
sDL_MapRGBA = hs_bindgen_3fecde9ee209df97

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetRGB@
foreign import ccall safe "hs_bindgen_da0c576777e026d9"
  hs_bindgen_da0c576777e026d9_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetRGB@
hs_bindgen_da0c576777e026d9
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst SDL_PixelFormatDetails
  -> PtrConst.PtrConst SDL_Palette
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO ()
hs_bindgen_da0c576777e026d9 =
  BG.fromFFIType hs_bindgen_da0c576777e026d9_base

-- | Get RGB values from a pixel in the specified format.
--
--     This function uses the entire 8-bit [0..255] range when converting color components from pixel formats with less than 8-bits per RGB component (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff, 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPixelFormatDetails', 'sDL_GetRGBA', 'sDL_MapRGB', 'sDL_MapRGBA'
--
--     [C declaration]: @SDL_GetRGB@, defined at @SDL3\/SDL_pixels.h 1400:34@
sDL_GetRGB
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@pixelvalue@]: a pixel value.
  -> PtrConst.PtrConst SDL_PixelFormatDetails
  -- ^
  --
  --           [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
  -> PtrConst.PtrConst SDL_Palette
  -- ^
  --
  --           [@palette@]: an optional palette for indexed formats, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: a pointer filled in with the red component, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: a pointer filled in with the green component, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: a pointer filled in with the blue component, may be NULL.
  -> IO ()
sDL_GetRGB = hs_bindgen_da0c576777e026d9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetRGBA@
foreign import ccall safe "hs_bindgen_9ace50541bcd4e41"
  hs_bindgen_9ace50541bcd4e41_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_Safe_SDL_GetRGBA@
hs_bindgen_9ace50541bcd4e41
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> PtrConst.PtrConst SDL_PixelFormatDetails
  -> PtrConst.PtrConst SDL_Palette
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO ()
hs_bindgen_9ace50541bcd4e41 =
  BG.fromFFIType hs_bindgen_9ace50541bcd4e41_base

-- | Get RGBA values from a pixel in the specified format.
--
--     This function uses the entire 8-bit [0..255] range when converting color components from pixel formats with less than 8-bits per RGB component (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff, 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
--
--     If the surface has no alpha component, the alpha will be returned as 0xff (100% opaque).
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPixelFormatDetails', 'sDL_GetRGB', 'sDL_MapRGB', 'sDL_MapRGBA'
--
--     [C declaration]: @SDL_GetRGBA@, defined at @SDL3\/SDL_pixels.h 1432:34@
sDL_GetRGBA
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@pixelvalue@]: a pixel value.
  -> PtrConst.PtrConst SDL_PixelFormatDetails
  -- ^
  --
  --           [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
  -> PtrConst.PtrConst SDL_Palette
  -- ^
  --
  --           [@palette@]: an optional palette for indexed formats, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@r@]: a pointer filled in with the red component, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@g@]: a pointer filled in with the green component, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: a pointer filled in with the blue component, may be NULL.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@a@]: a pointer filled in with the alpha component, may be NULL.
  -> IO ()
sDL_GetRGBA = hs_bindgen_9ace50541bcd4e41
