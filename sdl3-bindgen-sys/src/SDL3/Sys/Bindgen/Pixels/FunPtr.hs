{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Pixels.FunPtr (
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_GetPixelFormatName,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_GetMasksForPixelFormat,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_GetPixelFormatForMasks,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_GetPixelFormatDetails,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_CreatePalette,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_SetPaletteColors,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_DestroyPalette,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_MapRGB,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_MapRGBA,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_GetRGB,
  SDL3.Sys.Bindgen.Pixels.FunPtr.sDL_GetRGBA,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetPixelFormatName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_eb0ec2b0946d454a (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &SDL_GetPixelFormatName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetMasksForPixelFormat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f958323c6387c975 (void)) ("
         , "  SDL_PixelFormat arg1,"
         , "  signed int *arg2,"
         , "  Uint32 *arg3,"
         , "  Uint32 *arg4,"
         , "  Uint32 *arg5,"
         , "  Uint32 *arg6"
         , ")"
         , "{"
         , "  return &SDL_GetMasksForPixelFormat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetPixelFormatForMasks */"
         , "__attribute__ ((const))"
         , "SDL_PixelFormat (*hs_bindgen_e5bd7b32ad9023dc (void)) ("
         , "  signed int arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3,"
         , "  Uint32 arg4,"
         , "  Uint32 arg5"
         , ")"
         , "{"
         , "  return &SDL_GetPixelFormatForMasks;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetPixelFormatDetails */"
         , "__attribute__ ((const))"
         , "SDL_PixelFormatDetails const *(*hs_bindgen_b5dfc5cc5c17c070 (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &SDL_GetPixelFormatDetails;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_CreatePalette */"
         , "__attribute__ ((const))"
         , "SDL_Palette *(*hs_bindgen_27546d5c6729ae26 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_CreatePalette;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_SetPaletteColors */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_34f70d79b2ac1637 (void)) ("
         , "  SDL_Palette *arg1,"
         , "  SDL_Color const *arg2,"
         , "  signed int arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "  return &SDL_SetPaletteColors;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_DestroyPalette */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_51f2b11ef08b8f0d (void)) ("
         , "  SDL_Palette *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyPalette;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_MapRGB */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_71913f7d8c1eefe0 (void)) ("
         , "  SDL_PixelFormatDetails const *arg1,"
         , "  SDL_Palette const *arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5"
         , ")"
         , "{"
         , "  return &SDL_MapRGB;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_MapRGBA */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_357ad77f90e40db5 (void)) ("
         , "  SDL_PixelFormatDetails const *arg1,"
         , "  SDL_Palette const *arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4,"
         , "  Uint8 arg5,"
         , "  Uint8 arg6"
         , ")"
         , "{"
         , "  return &SDL_MapRGBA;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetRGB */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b718a2f4b5ae6cf0 (void)) ("
         , "  Uint32 arg1,"
         , "  SDL_PixelFormatDetails const *arg2,"
         , "  SDL_Palette const *arg3,"
         , "  Uint8 *arg4,"
         , "  Uint8 *arg5,"
         , "  Uint8 *arg6"
         , ")"
         , "{"
         , "  return &SDL_GetRGB;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetRGBA */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_9f1939763a4ba969 (void)) ("
         , "  Uint32 arg1,"
         , "  SDL_PixelFormatDetails const *arg2,"
         , "  SDL_Palette const *arg3,"
         , "  Uint8 *arg4,"
         , "  Uint8 *arg5,"
         , "  Uint8 *arg6,"
         , "  Uint8 *arg7"
         , ")"
         , "{"
         , "  return &SDL_GetRGBA;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetPixelFormatName@
foreign import ccall unsafe "hs_bindgen_eb0ec2b0946d454a"
  hs_bindgen_eb0ec2b0946d454a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetPixelFormatName@
hs_bindgen_eb0ec2b0946d454a :: IO (BG.FunPtr (SDL_PixelFormat -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_eb0ec2b0946d454a =
  BG.fromFFIType hs_bindgen_eb0ec2b0946d454a_base

{-# NOINLINE sDL_GetPixelFormatName #-}

-- | Get the human readable name of a pixel format.
--
--     [@format@]: the pixel format to query.
--
--     [Returns]: the human readable name of the specified pixel format or \"SDL_PIXELFORMAT_UNKNOWN\" if the format isn\'t recognized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetPixelFormatName@, defined at @SDL3\/SDL_pixels.h 1185:42@
sDL_GetPixelFormatName :: BG.FunPtr (SDL_PixelFormat -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetPixelFormatName =
  BG.unsafePerformIO hs_bindgen_eb0ec2b0946d454a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetMasksForPixelFormat@
foreign import ccall unsafe "hs_bindgen_f958323c6387c975"
  hs_bindgen_f958323c6387c975_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetMasksForPixelFormat@
hs_bindgen_f958323c6387c975
  :: IO
       ( BG.FunPtr
           ( SDL_PixelFormat
             -> BG.Ptr BG.CInt
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_f958323c6387c975 =
  BG.fromFFIType hs_bindgen_f958323c6387c975_base

{-# NOINLINE sDL_GetMasksForPixelFormat #-}

-- | Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
--
--     [@format@]: one of the 'SDL_PixelFormat' values.
--
--     [@bpp@]: a bits per pixel value; usually 15, 16, or 32.
--
--     [@Rmask@]: a pointer filled in with the red mask for the format.
--
--     [@Gmask@]: a pointer filled in with the green mask for the format.
--
--     [@Bmask@]: a pointer filled in with the blue mask for the format.
--
--     [@Amask@]: a pointer filled in with the alpha mask for the format.
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
  :: BG.FunPtr
       ( SDL_PixelFormat
         -> BG.Ptr BG.CInt
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_GetMasksForPixelFormat =
  BG.unsafePerformIO hs_bindgen_f958323c6387c975

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetPixelFormatForMasks@
foreign import ccall unsafe "hs_bindgen_e5bd7b32ad9023dc"
  hs_bindgen_e5bd7b32ad9023dc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetPixelFormatForMasks@
hs_bindgen_e5bd7b32ad9023dc
  :: IO
       ( BG.FunPtr
           ( BG.CInt
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO SDL_PixelFormat
           )
       )
hs_bindgen_e5bd7b32ad9023dc =
  BG.fromFFIType hs_bindgen_e5bd7b32ad9023dc_base

{-# NOINLINE sDL_GetPixelFormatForMasks #-}

-- | Convert a bpp value and RGBA masks to an enumerated pixel format.
--
--     This will return @SDL_PIXELFORMAT_UNKNOWN@ if the conversion wasn\'t possible.
--
--     [@bpp@]: a bits per pixel value; usually 15, 16, or 32.
--
--     [@Rmask@]: the red mask for the format.
--
--     [@Gmask@]: the green mask for the format.
--
--     [@Bmask@]: the blue mask for the format.
--
--     [@Amask@]: the alpha mask for the format.
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
  :: BG.FunPtr
       ( BG.CInt
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO SDL_PixelFormat
       )
sDL_GetPixelFormatForMasks =
  BG.unsafePerformIO hs_bindgen_e5bd7b32ad9023dc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetPixelFormatDetails@
foreign import ccall unsafe "hs_bindgen_b5dfc5cc5c17c070"
  hs_bindgen_b5dfc5cc5c17c070_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetPixelFormatDetails@
hs_bindgen_b5dfc5cc5c17c070
  :: IO (BG.FunPtr (SDL_PixelFormat -> IO (PtrConst.PtrConst SDL_PixelFormatDetails)))
hs_bindgen_b5dfc5cc5c17c070 =
  BG.fromFFIType hs_bindgen_b5dfc5cc5c17c070_base

{-# NOINLINE sDL_GetPixelFormatDetails #-}

-- | Create an 'SDL_PixelFormatDetails' structure corresponding to a pixel format.
--
--     Returned structure may come from a shared global cache (i.e. not newly allocated), and hence should not be modified, especially the palette. Weird errors such as @Blit combination not supported@ may occur.
--
--     [@format@]: one of the 'SDL_PixelFormat' values.
--
--     [Returns]: a pointer to a 'SDL_PixelFormatDetails' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetPixelFormatDetails@, defined at @SDL3\/SDL_pixels.h 1244:60@
sDL_GetPixelFormatDetails
  :: BG.FunPtr (SDL_PixelFormat -> IO (PtrConst.PtrConst SDL_PixelFormatDetails))
sDL_GetPixelFormatDetails =
  BG.unsafePerformIO hs_bindgen_b5dfc5cc5c17c070

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_CreatePalette@
foreign import ccall unsafe "hs_bindgen_27546d5c6729ae26"
  hs_bindgen_27546d5c6729ae26_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_CreatePalette@
hs_bindgen_27546d5c6729ae26 :: IO (BG.FunPtr (BG.CInt -> IO (BG.Ptr SDL_Palette)))
hs_bindgen_27546d5c6729ae26 =
  BG.fromFFIType hs_bindgen_27546d5c6729ae26_base

{-# NOINLINE sDL_CreatePalette #-}

-- | Create a palette structure with the specified number of color entries.
--
--     The palette entries are initialized to white.
--
--     [@ncolors@]: represents the number of color entries in the color palette.
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
sDL_CreatePalette :: BG.FunPtr (BG.CInt -> IO (BG.Ptr SDL_Palette))
sDL_CreatePalette =
  BG.unsafePerformIO hs_bindgen_27546d5c6729ae26

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_SetPaletteColors@
foreign import ccall unsafe "hs_bindgen_34f70d79b2ac1637"
  hs_bindgen_34f70d79b2ac1637_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_SetPaletteColors@
hs_bindgen_34f70d79b2ac1637
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Palette -> PtrConst.PtrConst SDL_Color -> BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_34f70d79b2ac1637 =
  BG.fromFFIType hs_bindgen_34f70d79b2ac1637_base

{-# NOINLINE sDL_SetPaletteColors #-}

-- | Set a range of colors in a palette.
--
--     [@palette@]: the 'SDL_Palette' structure to modify.
--
--     [@colors@]: an array of 'SDL_Color' structures to copy into the palette.
--
--     [@firstcolor@]: the index of the first palette entry to modify.
--
--     [@ncolors@]: the number of entries to modify.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified or destroyed in another thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetPaletteColors@, defined at @SDL3\/SDL_pixels.h 1281:34@
sDL_SetPaletteColors
  :: BG.FunPtr (BG.Ptr SDL_Palette -> PtrConst.PtrConst SDL_Color -> BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_SetPaletteColors =
  BG.unsafePerformIO hs_bindgen_34f70d79b2ac1637

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_DestroyPalette@
foreign import ccall unsafe "hs_bindgen_51f2b11ef08b8f0d"
  hs_bindgen_51f2b11ef08b8f0d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_DestroyPalette@
hs_bindgen_51f2b11ef08b8f0d :: IO (BG.FunPtr (BG.Ptr SDL_Palette -> IO ()))
hs_bindgen_51f2b11ef08b8f0d =
  BG.fromFFIType hs_bindgen_51f2b11ef08b8f0d_base

{-# NOINLINE sDL_DestroyPalette #-}

-- | Free a palette created with @SDL_CreatePalette()@.
--
--     [@palette@]: the 'SDL_Palette' structure to be freed.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified or destroyed in another thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreatePalette'
--
--     [C declaration]: @SDL_DestroyPalette@, defined at @SDL3\/SDL_pixels.h 1295:34@
sDL_DestroyPalette :: BG.FunPtr (BG.Ptr SDL_Palette -> IO ())
sDL_DestroyPalette =
  BG.unsafePerformIO hs_bindgen_51f2b11ef08b8f0d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_MapRGB@
foreign import ccall unsafe "hs_bindgen_71913f7d8c1eefe0"
  hs_bindgen_71913f7d8c1eefe0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_MapRGB@
hs_bindgen_71913f7d8c1eefe0
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst SDL_PixelFormatDetails
             -> PtrConst.PtrConst SDL_Palette
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
           )
       )
hs_bindgen_71913f7d8c1eefe0 =
  BG.fromFFIType hs_bindgen_71913f7d8c1eefe0_base

{-# NOINLINE sDL_MapRGB #-}

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
--     [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
--
--     [@palette@]: an optional palette for indexed formats, may be NULL.
--
--     [@r@]: the red component of the pixel in the range 0-255.
--
--     [@g@]: the green component of the pixel in the range 0-255.
--
--     [@b@]: the blue component of the pixel in the range 0-255.
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
  :: BG.FunPtr
       ( PtrConst.PtrConst SDL_PixelFormatDetails
         -> PtrConst.PtrConst SDL_Palette
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
       )
sDL_MapRGB =
  BG.unsafePerformIO hs_bindgen_71913f7d8c1eefe0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_MapRGBA@
foreign import ccall unsafe "hs_bindgen_357ad77f90e40db5"
  hs_bindgen_357ad77f90e40db5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_MapRGBA@
hs_bindgen_357ad77f90e40db5
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst SDL_PixelFormatDetails
             -> PtrConst.PtrConst SDL_Palette
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
           )
       )
hs_bindgen_357ad77f90e40db5 =
  BG.fromFFIType hs_bindgen_357ad77f90e40db5_base

{-# NOINLINE sDL_MapRGBA #-}

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
--     [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
--
--     [@palette@]: an optional palette for indexed formats, may be NULL.
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
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPixelFormatDetails', 'sDL_GetRGBA', 'sDL_MapRGB', SDL_MapSurfaceRGBA
--
--     [C declaration]: @SDL_MapRGBA@, defined at @SDL3\/SDL_pixels.h 1372:36@
sDL_MapRGBA
  :: BG.FunPtr
       ( PtrConst.PtrConst SDL_PixelFormatDetails
         -> PtrConst.PtrConst SDL_Palette
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
       )
sDL_MapRGBA =
  BG.unsafePerformIO hs_bindgen_357ad77f90e40db5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetRGB@
foreign import ccall unsafe "hs_bindgen_b718a2f4b5ae6cf0"
  hs_bindgen_b718a2f4b5ae6cf0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetRGB@
hs_bindgen_b718a2f4b5ae6cf0
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst SDL_PixelFormatDetails
             -> PtrConst.PtrConst SDL_Palette
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO ()
           )
       )
hs_bindgen_b718a2f4b5ae6cf0 =
  BG.fromFFIType hs_bindgen_b718a2f4b5ae6cf0_base

{-# NOINLINE sDL_GetRGB #-}

-- | Get RGB values from a pixel in the specified format.
--
--     This function uses the entire 8-bit [0..255] range when converting color components from pixel formats with less than 8-bits per RGB component (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff, 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
--
--     [@pixelvalue@]: a pixel value.
--
--     [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
--
--     [@palette@]: an optional palette for indexed formats, may be NULL.
--
--     [@r@]: a pointer filled in with the red component, may be NULL.
--
--     [@g@]: a pointer filled in with the green component, may be NULL.
--
--     [@b@]: a pointer filled in with the blue component, may be NULL.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPixelFormatDetails', 'sDL_GetRGBA', 'sDL_MapRGB', 'sDL_MapRGBA'
--
--     [C declaration]: @SDL_GetRGB@, defined at @SDL3\/SDL_pixels.h 1400:34@
sDL_GetRGB
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst SDL_PixelFormatDetails
         -> PtrConst.PtrConst SDL_Palette
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO ()
       )
sDL_GetRGB =
  BG.unsafePerformIO hs_bindgen_b718a2f4b5ae6cf0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetRGBA@
foreign import ccall unsafe "hs_bindgen_9f1939763a4ba969"
  hs_bindgen_9f1939763a4ba969_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Pixels_get_SDL_GetRGBA@
hs_bindgen_9f1939763a4ba969
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Stdinc.Uint32
             -> PtrConst.PtrConst SDL_PixelFormatDetails
             -> PtrConst.PtrConst SDL_Palette
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO ()
           )
       )
hs_bindgen_9f1939763a4ba969 =
  BG.fromFFIType hs_bindgen_9f1939763a4ba969_base

{-# NOINLINE sDL_GetRGBA #-}

-- | Get RGBA values from a pixel in the specified format.
--
--     This function uses the entire 8-bit [0..255] range when converting color components from pixel formats with less than 8-bits per RGB component (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff, 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
--
--     If the surface has no alpha component, the alpha will be returned as 0xff (100% opaque).
--
--     [@pixelvalue@]: a pixel value.
--
--     [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
--
--     [@palette@]: an optional palette for indexed formats, may be NULL.
--
--     [@r@]: a pointer filled in with the red component, may be NULL.
--
--     [@g@]: a pointer filled in with the green component, may be NULL.
--
--     [@b@]: a pointer filled in with the blue component, may be NULL.
--
--     [@a@]: a pointer filled in with the alpha component, may be NULL.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPixelFormatDetails', 'sDL_GetRGB', 'sDL_MapRGB', 'sDL_MapRGBA'
--
--     [C declaration]: @SDL_GetRGBA@, defined at @SDL3\/SDL_pixels.h 1432:34@
sDL_GetRGBA
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Stdinc.Uint32
         -> PtrConst.PtrConst SDL_PixelFormatDetails
         -> PtrConst.PtrConst SDL_Palette
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO ()
       )
sDL_GetRGBA =
  BG.unsafePerformIO hs_bindgen_9f1939763a4ba969
