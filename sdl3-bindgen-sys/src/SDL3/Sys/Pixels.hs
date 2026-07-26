-- | SDL offers facilities for pixel management.
--
--     Largely these facilities deal with pixel /format/: what does this set of bits represent?
--
--     If you mostly want to think of a pixel as some combination of red, green, blue, and maybe alpha intensities, this is all pretty straightforward, and in many cases, is enough information to build a perfectly fine game.
--
--     However, the actual definition of a pixel is more complex than that:
--
--     Pixels are a representation of a color in a particular color space.
--
--     The first characteristic of a color space is the color type. SDL understands two different color types, RGB and YCbCr, or in SDL also referred to as YUV.
--
--     RGB colors consist of red, green, and blue channels of color that are added together to represent the colors we see on the screen.
--
--     [https:\/\/en.wikipedia.org\/wiki\/RGB_color_model](https://en.wikipedia.org/wiki/RGB_color_model)
--
--     YCbCr colors represent colors as a Y luma brightness component and red and blue chroma color offsets. This color representation takes advantage of the fact that the human eye is more sensitive to brightness than the color in an image. The Cb and Cr components are often compressed and have lower resolution than the luma component.
--
--     [https:\/\/en.wikipedia.org\/wiki\/YCbCr](https://en.wikipedia.org/wiki/YCbCr)
--
--     When the color information in YCbCr is compressed, the Y pixels are left at full resolution and each Cr and Cb pixel represents an average of the color information in a block of Y pixels. The chroma location determines where in that block of pixels the color information is coming from.
--
--     The color range defines how much of the pixel to use when converting a pixel into a color on the display. When the full color range is used, the entire numeric range of the pixel bits is significant. When narrow color range is used, for historical reasons, the pixel uses only a portion of the numeric range to represent colors.
--
--     The color primaries and white point are a definition of the colors in the color space relative to the standard XYZ color space.
--
--     [https:\/\/en.wikipedia.org\/wiki\/CIE_1931_color_space](https://en.wikipedia.org/wiki/CIE_1931_color_space)
--
--     The transfer characteristic, or opto-electrical transfer function (OETF), is the way a color is converted from mathematically linear space into a non-linear output signals.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Rec._709\#Transfer_characteristics](https://en.wikipedia.org/wiki/Rec._709#Transfer_characteristics)
--
--     The matrix coefficients are used to convert between YCbCr and RGB colors. A fully opaque 8-bit alpha value.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ALPHA_TRANSPARENT'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Pixels.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Pixels (
  module SDL3.Sys.Bindgen.Pixels,

  -- * Function aliases
  SDL3.Sys.Pixels.getPixelFormatName,
  SDL3.Sys.Pixels.getPixelFormatNameSafe,
  SDL3.Sys.Pixels.getMasksForPixelFormat,
  SDL3.Sys.Pixels.getMasksForPixelFormatSafe,
  SDL3.Sys.Pixels.getPixelFormatForMasks,
  SDL3.Sys.Pixels.getPixelFormatForMasksSafe,
  SDL3.Sys.Pixels.getPixelFormatDetails,
  SDL3.Sys.Pixels.getPixelFormatDetailsSafe,
  SDL3.Sys.Pixels.createPalette,
  SDL3.Sys.Pixels.createPaletteSafe,
  SDL3.Sys.Pixels.setPaletteColors,
  SDL3.Sys.Pixels.setPaletteColorsSafe,
  SDL3.Sys.Pixels.destroyPalette,
  SDL3.Sys.Pixels.destroyPaletteSafe,
  SDL3.Sys.Pixels.mapRGB,
  SDL3.Sys.Pixels.mapRGBSafe,
  SDL3.Sys.Pixels.mapRGBA,
  SDL3.Sys.Pixels.mapRGBASafe,
  SDL3.Sys.Pixels.getRGB,
  SDL3.Sys.Pixels.getRGBSafe,
  SDL3.Sys.Pixels.getRGBA,
  SDL3.Sys.Pixels.getRGBASafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Pixels
import SDL3.Sys.Bindgen.Pixels.Safe qualified as Safe
import SDL3.Sys.Bindgen.Pixels.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Get the human readable name of a pixel format.
--
--     [Returns]: the human readable name of the specified pixel format or \"SDL_PIXELFORMAT_UNKNOWN\" if the format isn\'t recognized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPixelFormatName@.
--                   The safe flavor is 'getPixelFormatNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetPixelFormatName@, defined at @SDL3\/SDL_pixels.h 1185:42@
getPixelFormatName
  :: SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the pixel format to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getPixelFormatName = Unsafe.sDL_GetPixelFormatName

-- | Get the human readable name of a pixel format.
--
--     [Returns]: the human readable name of the specified pixel format or \"SDL_PIXELFORMAT_UNKNOWN\" if the format isn\'t recognized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPixelFormatName@.
--                   The unsafe flavor is 'getPixelFormatName'
--                   .
--
--     [C declaration]: @SDL_GetPixelFormatName@, defined at @SDL3\/SDL_pixels.h 1185:42@
getPixelFormatNameSafe
  :: SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the pixel format to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getPixelFormatNameSafe = Safe.sDL_GetPixelFormatName

-- | Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPixelFormatForMasks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetMasksForPixelFormat@.
--                   The safe flavor is 'getMasksForPixelFormatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetMasksForPixelFormat@, defined at @SDL3\/SDL_pixels.h 1205:34@
getMasksForPixelFormat
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
  -> IO Bool
getMasksForPixelFormat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Unsafe.sDL_GetMasksForPixelFormat x00 x11 x22 x33 x44 x55)

-- | Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPixelFormatForMasks'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetMasksForPixelFormat@.
--                   The unsafe flavor is 'getMasksForPixelFormat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetMasksForPixelFormat@, defined at @SDL3\/SDL_pixels.h 1205:34@
getMasksForPixelFormatSafe
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
  -> IO Bool
getMasksForPixelFormatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Safe.sDL_GetMasksForPixelFormat x00 x11 x22 x33 x44 x55)

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
--     [See also]: 'getMasksForPixelFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPixelFormatForMasks@.
--                   The safe flavor is 'getPixelFormatForMasksSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetPixelFormatForMasks@, defined at @SDL3\/SDL_pixels.h 1227:45@
getPixelFormatForMasks
  :: BG.Int32
  -- ^
  --
  --           [@bpp@]: a bits per pixel value; usually 15, 16, or 32.
  -> BG.Word32
  -- ^
  --
  --           [@Rmask@]: the red mask for the format.
  -> BG.Word32
  -- ^
  --
  --           [@Gmask@]: the green mask for the format.
  -> BG.Word32
  -- ^
  --
  --           [@Bmask@]: the blue mask for the format.
  -> BG.Word32
  -- ^
  --
  --           [@Amask@]: the alpha mask for the format.
  -> IO SDL_PixelFormat
getPixelFormatForMasks =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Unsafe.sDL_GetPixelFormatForMasks
              (Coerce.coerce x00)
              (Coerce.coerce x11)
              (Coerce.coerce x22)
              (Coerce.coerce x33)
              (Coerce.coerce x44)

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
--     [See also]: 'getMasksForPixelFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPixelFormatForMasks@.
--                   The unsafe flavor is 'getPixelFormatForMasks'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetPixelFormatForMasks@, defined at @SDL3\/SDL_pixels.h 1227:45@
getPixelFormatForMasksSafe
  :: BG.Int32
  -- ^
  --
  --           [@bpp@]: a bits per pixel value; usually 15, 16, or 32.
  -> BG.Word32
  -- ^
  --
  --           [@Rmask@]: the red mask for the format.
  -> BG.Word32
  -- ^
  --
  --           [@Gmask@]: the green mask for the format.
  -> BG.Word32
  -- ^
  --
  --           [@Bmask@]: the blue mask for the format.
  -> BG.Word32
  -- ^
  --
  --           [@Amask@]: the alpha mask for the format.
  -> IO SDL_PixelFormat
getPixelFormatForMasksSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Safe.sDL_GetPixelFormatForMasks
              (Coerce.coerce x00)
              (Coerce.coerce x11)
              (Coerce.coerce x22)
              (Coerce.coerce x33)
              (Coerce.coerce x44)

-- | Create an 'SDL_PixelFormatDetails' structure corresponding to a pixel format.
--
--     Returned structure may come from a shared global cache (i.e. not newly allocated), and hence should not be modified, especially the palette. Weird errors such as @Blit combination not supported@ may occur.
--
--     [Returns]: a pointer to a 'SDL_PixelFormatDetails' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPixelFormatDetails@.
--                   The safe flavor is 'getPixelFormatDetailsSafe'
--                   .
--
--     [C declaration]: @SDL_GetPixelFormatDetails@, defined at @SDL3\/SDL_pixels.h 1244:60@
getPixelFormatDetails
  :: SDL_PixelFormat
  -- ^
  --
  --           [@format@]: one of the 'SDL_PixelFormat' values.
  -> IO (PtrConst.PtrConst SDL_PixelFormatDetails)
getPixelFormatDetails =
  Unsafe.sDL_GetPixelFormatDetails

-- | Create an 'SDL_PixelFormatDetails' structure corresponding to a pixel format.
--
--     Returned structure may come from a shared global cache (i.e. not newly allocated), and hence should not be modified, especially the palette. Weird errors such as @Blit combination not supported@ may occur.
--
--     [Returns]: a pointer to a 'SDL_PixelFormatDetails' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPixelFormatDetails@.
--                   The unsafe flavor is 'getPixelFormatDetails'
--                   .
--
--     [C declaration]: @SDL_GetPixelFormatDetails@, defined at @SDL3\/SDL_pixels.h 1244:60@
getPixelFormatDetailsSafe
  :: SDL_PixelFormat
  -- ^
  --
  --           [@format@]: one of the 'SDL_PixelFormat' values.
  -> IO (PtrConst.PtrConst SDL_PixelFormatDetails)
getPixelFormatDetailsSafe =
  Safe.sDL_GetPixelFormatDetails

-- | Create a palette structure with the specified number of color entries.
--
--     The palette entries are initialized to white.
--
--     [Returns]: a new 'SDL_Palette' structure on success or NULL on failure (e.g. if there wasn\'t enough memory); call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyPalette', 'setPaletteColors', 'SDL3.Sys.Surface.setSurfacePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreatePalette@.
--                   The safe flavor is 'createPaletteSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreatePalette@, defined at @SDL3\/SDL_pixels.h 1264:43@
createPalette
  :: BG.Int32
  -- ^
  --
  --           [@ncolors@]: represents the number of color entries in the color palette.
  -> IO (BG.Ptr SDL_Palette)
createPalette =
  \x00 -> Unsafe.sDL_CreatePalette (Coerce.coerce x00)

-- | Create a palette structure with the specified number of color entries.
--
--     The palette entries are initialized to white.
--
--     [Returns]: a new 'SDL_Palette' structure on success or NULL on failure (e.g. if there wasn\'t enough memory); call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyPalette', 'setPaletteColors', 'SDL3.Sys.Surface.setSurfacePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreatePalette@.
--                   The unsafe flavor is 'createPalette'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreatePalette@, defined at @SDL3\/SDL_pixels.h 1264:43@
createPaletteSafe
  :: BG.Int32
  -- ^
  --
  --           [@ncolors@]: represents the number of color entries in the color palette.
  -> IO (BG.Ptr SDL_Palette)
createPaletteSafe =
  \x00 -> Safe.sDL_CreatePalette (Coerce.coerce x00)

-- | Set a range of colors in a palette.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified or destroyed in another thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetPaletteColors@.
--                   The safe flavor is 'setPaletteColorsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetPaletteColors@, defined at @SDL3\/SDL_pixels.h 1281:34@
setPaletteColors
  :: BG.Ptr SDL_Palette
  -- ^
  --
  --           [@palette@]: the 'SDL_Palette' structure to modify.
  -> PtrConst.PtrConst SDL_Color
  -- ^
  --
  --           [@colors@]: an array of 'SDL_Color' structures to copy into the palette.
  -> BG.Int32
  -- ^
  --
  --           [@firstcolor@]: the index of the first palette entry to modify.
  -> BG.Int32
  -- ^
  --
  --           [@ncolors@]: the number of entries to modify.
  -> IO Bool
setPaletteColors =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_SetPaletteColors x00 x11 (Coerce.coerce x22) (Coerce.coerce x33))

-- | Set a range of colors in a palette.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified or destroyed in another thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetPaletteColors@.
--                   The unsafe flavor is 'setPaletteColors'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetPaletteColors@, defined at @SDL3\/SDL_pixels.h 1281:34@
setPaletteColorsSafe
  :: BG.Ptr SDL_Palette
  -- ^
  --
  --           [@palette@]: the 'SDL_Palette' structure to modify.
  -> PtrConst.PtrConst SDL_Color
  -- ^
  --
  --           [@colors@]: an array of 'SDL_Color' structures to copy into the palette.
  -> BG.Int32
  -- ^
  --
  --           [@firstcolor@]: the index of the first palette entry to modify.
  -> BG.Int32
  -- ^
  --
  --           [@ncolors@]: the number of entries to modify.
  -> IO Bool
setPaletteColorsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_SetPaletteColors x00 x11 (Coerce.coerce x22) (Coerce.coerce x33))

-- | Free a palette created with @'createPalette'@.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified or destroyed in another thread.
--
--     @since 3.2.0
--
--     [See also]: 'createPalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyPalette@.
--                   The safe flavor is 'destroyPaletteSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyPalette@, defined at @SDL3\/SDL_pixels.h 1295:34@
destroyPalette
  :: BG.Ptr SDL_Palette
  -- ^
  --
  --           [@palette@]: the 'SDL_Palette' structure to be freed.
  -> IO ()
destroyPalette = Unsafe.sDL_DestroyPalette

-- | Free a palette created with @'createPalette'@.
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified or destroyed in another thread.
--
--     @since 3.2.0
--
--     [See also]: 'createPalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyPalette@.
--                   The unsafe flavor is 'destroyPalette'
--                   .
--
--     [C declaration]: @SDL_DestroyPalette@, defined at @SDL3\/SDL_pixels.h 1295:34@
destroyPaletteSafe
  :: BG.Ptr SDL_Palette
  -- ^
  --
  --           [@palette@]: the 'SDL_Palette' structure to be freed.
  -> IO ()
destroyPaletteSafe = Safe.sDL_DestroyPalette

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
--     [See also]: 'getPixelFormatDetails', 'getRGB', 'mapRGBA', 'SDL3.Sys.Surface.mapSurfaceRGB'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MapRGB@.
--                   The safe flavor is 'mapRGBSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapRGB@, defined at @SDL3\/SDL_pixels.h 1333:36@
mapRGB
  :: PtrConst.PtrConst SDL_PixelFormatDetails
  -- ^
  --
  --           [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
  -> PtrConst.PtrConst SDL_Palette
  -- ^
  --
  --           [@palette@]: an optional palette for indexed formats, may be NULL.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue component of the pixel in the range 0-255.
  -> IO BG.Word32
mapRGB =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              Coerce.coerce
              (Unsafe.sDL_MapRGB x00 x11 (Coerce.coerce x22) (Coerce.coerce x33) (Coerce.coerce x44))

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
--     [See also]: 'getPixelFormatDetails', 'getRGB', 'mapRGBA', 'SDL3.Sys.Surface.mapSurfaceRGB'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MapRGB@.
--                   The unsafe flavor is 'mapRGB'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapRGB@, defined at @SDL3\/SDL_pixels.h 1333:36@
mapRGBSafe
  :: PtrConst.PtrConst SDL_PixelFormatDetails
  -- ^
  --
  --           [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
  -> PtrConst.PtrConst SDL_Palette
  -- ^
  --
  --           [@palette@]: an optional palette for indexed formats, may be NULL.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue component of the pixel in the range 0-255.
  -> IO BG.Word32
mapRGBSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              Coerce.coerce
              (Safe.sDL_MapRGB x00 x11 (Coerce.coerce x22) (Coerce.coerce x33) (Coerce.coerce x44))

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
--     [See also]: 'getPixelFormatDetails', 'getRGBA', 'mapRGB', 'SDL3.Sys.Surface.mapSurfaceRGBA'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MapRGBA@.
--                   The safe flavor is 'mapRGBASafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapRGBA@, defined at @SDL3\/SDL_pixels.h 1372:36@
mapRGBA
  :: PtrConst.PtrConst SDL_PixelFormatDetails
  -- ^
  --
  --           [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
  -> PtrConst.PtrConst SDL_Palette
  -- ^
  --
  --           [@palette@]: an optional palette for indexed formats, may be NULL.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@a@]: the alpha component of the pixel in the range 0-255.
  -> IO BG.Word32
mapRGBA =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap
                Coerce.coerce
                ( Unsafe.sDL_MapRGBA
                    x00
                    x11
                    (Coerce.coerce x22)
                    (Coerce.coerce x33)
                    (Coerce.coerce x44)
                    (Coerce.coerce x55)
                )

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
--     [See also]: 'getPixelFormatDetails', 'getRGBA', 'mapRGB', 'SDL3.Sys.Surface.mapSurfaceRGBA'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MapRGBA@.
--                   The unsafe flavor is 'mapRGBA'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapRGBA@, defined at @SDL3\/SDL_pixels.h 1372:36@
mapRGBASafe
  :: PtrConst.PtrConst SDL_PixelFormatDetails
  -- ^
  --
  --           [@format@]: a pointer to 'SDL_PixelFormatDetails' describing the pixel format.
  -> PtrConst.PtrConst SDL_Palette
  -- ^
  --
  --           [@palette@]: an optional palette for indexed formats, may be NULL.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue component of the pixel in the range 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@a@]: the alpha component of the pixel in the range 0-255.
  -> IO BG.Word32
mapRGBASafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap
                Coerce.coerce
                ( Safe.sDL_MapRGBA
                    x00
                    x11
                    (Coerce.coerce x22)
                    (Coerce.coerce x33)
                    (Coerce.coerce x44)
                    (Coerce.coerce x55)
                )

-- | Get RGB values from a pixel in the specified format.
--
--     This function uses the entire 8-bit [0..255] range when converting color components from pixel formats with less than 8-bits per RGB component (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff, 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified.
--
--     @since 3.2.0
--
--     [See also]: 'getPixelFormatDetails', 'getRGBA', 'mapRGB', 'mapRGBA'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRGB@.
--                   The safe flavor is 'getRGBSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRGB@, defined at @SDL3\/SDL_pixels.h 1400:34@
getRGB
  :: BG.Word32
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
getRGB =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Unsafe.sDL_GetRGB (Coerce.coerce x00) x11 x22 x33 x44 x55

-- | Get RGB values from a pixel in the specified format.
--
--     This function uses the entire 8-bit [0..255] range when converting color components from pixel formats with less than 8-bits per RGB component (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff, 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
--
--     [Thread safety]: It is safe to call this function from any thread, as long as the palette is not modified.
--
--     @since 3.2.0
--
--     [See also]: 'getPixelFormatDetails', 'getRGBA', 'mapRGB', 'mapRGBA'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRGB@.
--                   The unsafe flavor is 'getRGB'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRGB@, defined at @SDL3\/SDL_pixels.h 1400:34@
getRGBSafe
  :: BG.Word32
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
getRGBSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Safe.sDL_GetRGB (Coerce.coerce x00) x11 x22 x33 x44 x55

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
--     [See also]: 'getPixelFormatDetails', 'getRGB', 'mapRGB', 'mapRGBA'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRGBA@.
--                   The safe flavor is 'getRGBASafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRGBA@, defined at @SDL3\/SDL_pixels.h 1432:34@
getRGBA
  :: BG.Word32
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
getRGBA =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                Unsafe.sDL_GetRGBA (Coerce.coerce x00) x11 x22 x33 x44 x55 x66

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
--     [See also]: 'getPixelFormatDetails', 'getRGB', 'mapRGB', 'mapRGBA'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRGBA@.
--                   The unsafe flavor is 'getRGBA'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRGBA@, defined at @SDL3\/SDL_pixels.h 1432:34@
getRGBASafe
  :: BG.Word32
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
getRGBASafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                Safe.sDL_GetRGBA (Coerce.coerce x00) x11 x22 x33 x44 x55 x66
