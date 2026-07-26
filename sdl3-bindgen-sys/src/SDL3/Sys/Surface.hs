{-# LANGUAGE PatternSynonyms #-}

-- | SDL surfaces are buffers of pixels in system RAM. These are useful for passing around and manipulating images that are not stored in GPU memory.
--
--     'SDL_Surface' makes serious efforts to manage images in various formats, and provides a reasonable toolbox for transforming the data, including copying between surfaces, filling rectangles in the image data, etc.
--
--     There is also a simple .bmp loader, @'loadBMP'@, and a simple .png loader, @'loadPNG'@. SDL itself does not provide loaders for other file formats, but there are several excellent external libraries that do, including its own satellite library, [SDL_image](https://wiki.libsdl.org/SDL3_image) In general these functions are thread-safe in that they can be called on different threads with different surfaces. You should not try to modify any surface from two threads simultaneously. The flags on an 'SDL_Surface'.
--
--     These are generally considered read-only.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Surface.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Surface (
  module SDL3.Sys.Bindgen.Surface,

  -- * Typed constants
  pattern SDL3.Sys.Surface.SDL_SURFACE_PREALLOCATED,
  pattern SDL3.Sys.Surface.SDL_SURFACE_LOCK_NEEDED,
  pattern SDL3.Sys.Surface.SDL_SURFACE_LOCKED,
  pattern SDL3.Sys.Surface.SDL_SURFACE_SIMD_ALIGNED,

  -- * Function aliases
  SDL3.Sys.Surface.createSurface,
  SDL3.Sys.Surface.createSurfaceSafe,
  SDL3.Sys.Surface.createSurfaceFrom,
  SDL3.Sys.Surface.createSurfaceFromSafe,
  SDL3.Sys.Surface.destroySurface,
  SDL3.Sys.Surface.destroySurfaceSafe,
  SDL3.Sys.Surface.getSurfaceProperties,
  SDL3.Sys.Surface.getSurfacePropertiesSafe,
  SDL3.Sys.Surface.setSurfaceColorspace,
  SDL3.Sys.Surface.setSurfaceColorspaceSafe,
  SDL3.Sys.Surface.getSurfaceColorspace,
  SDL3.Sys.Surface.getSurfaceColorspaceSafe,
  SDL3.Sys.Surface.createSurfacePalette,
  SDL3.Sys.Surface.createSurfacePaletteSafe,
  SDL3.Sys.Surface.setSurfacePalette,
  SDL3.Sys.Surface.setSurfacePaletteSafe,
  SDL3.Sys.Surface.getSurfacePalette,
  SDL3.Sys.Surface.getSurfacePaletteSafe,
  SDL3.Sys.Surface.addSurfaceAlternateImage,
  SDL3.Sys.Surface.addSurfaceAlternateImageSafe,
  SDL3.Sys.Surface.surfaceHasAlternateImages,
  SDL3.Sys.Surface.surfaceHasAlternateImagesSafe,
  SDL3.Sys.Surface.getSurfaceImages,
  SDL3.Sys.Surface.getSurfaceImagesSafe,
  SDL3.Sys.Surface.removeSurfaceAlternateImages,
  SDL3.Sys.Surface.removeSurfaceAlternateImagesSafe,
  SDL3.Sys.Surface.lockSurface,
  SDL3.Sys.Surface.lockSurfaceSafe,
  SDL3.Sys.Surface.unlockSurface,
  SDL3.Sys.Surface.unlockSurfaceSafe,
  SDL3.Sys.Surface.loadSurfaceIO,
  SDL3.Sys.Surface.loadSurfaceIOSafe,
  SDL3.Sys.Surface.loadSurface,
  SDL3.Sys.Surface.loadSurfaceSafe,
  SDL3.Sys.Surface.loadBMPIO,
  SDL3.Sys.Surface.loadBMPIOSafe,
  SDL3.Sys.Surface.loadBMP,
  SDL3.Sys.Surface.loadBMPSafe,
  SDL3.Sys.Surface.saveBMPIO,
  SDL3.Sys.Surface.saveBMPIOSafe,
  SDL3.Sys.Surface.saveBMP,
  SDL3.Sys.Surface.saveBMPSafe,
  SDL3.Sys.Surface.loadPNGIO,
  SDL3.Sys.Surface.loadPNGIOSafe,
  SDL3.Sys.Surface.loadPNG,
  SDL3.Sys.Surface.loadPNGSafe,
  SDL3.Sys.Surface.savePNGIO,
  SDL3.Sys.Surface.savePNGIOSafe,
  SDL3.Sys.Surface.savePNG,
  SDL3.Sys.Surface.savePNGSafe,
  SDL3.Sys.Surface.setSurfaceRLE,
  SDL3.Sys.Surface.setSurfaceRLESafe,
  SDL3.Sys.Surface.surfaceHasRLE,
  SDL3.Sys.Surface.surfaceHasRLESafe,
  SDL3.Sys.Surface.setSurfaceColorKey,
  SDL3.Sys.Surface.setSurfaceColorKeySafe,
  SDL3.Sys.Surface.surfaceHasColorKey,
  SDL3.Sys.Surface.surfaceHasColorKeySafe,
  SDL3.Sys.Surface.getSurfaceColorKey,
  SDL3.Sys.Surface.getSurfaceColorKeySafe,
  SDL3.Sys.Surface.setSurfaceColorMod,
  SDL3.Sys.Surface.setSurfaceColorModSafe,
  SDL3.Sys.Surface.getSurfaceColorMod,
  SDL3.Sys.Surface.getSurfaceColorModSafe,
  SDL3.Sys.Surface.setSurfaceAlphaMod,
  SDL3.Sys.Surface.setSurfaceAlphaModSafe,
  SDL3.Sys.Surface.getSurfaceAlphaMod,
  SDL3.Sys.Surface.getSurfaceAlphaModSafe,
  SDL3.Sys.Surface.setSurfaceBlendMode,
  SDL3.Sys.Surface.setSurfaceBlendModeSafe,
  SDL3.Sys.Surface.getSurfaceBlendMode,
  SDL3.Sys.Surface.getSurfaceBlendModeSafe,
  SDL3.Sys.Surface.setSurfaceClipRect,
  SDL3.Sys.Surface.setSurfaceClipRectSafe,
  SDL3.Sys.Surface.getSurfaceClipRect,
  SDL3.Sys.Surface.getSurfaceClipRectSafe,
  SDL3.Sys.Surface.flipSurface,
  SDL3.Sys.Surface.flipSurfaceSafe,
  SDL3.Sys.Surface.rotateSurface,
  SDL3.Sys.Surface.rotateSurfaceSafe,
  SDL3.Sys.Surface.duplicateSurface,
  SDL3.Sys.Surface.duplicateSurfaceSafe,
  SDL3.Sys.Surface.scaleSurface,
  SDL3.Sys.Surface.scaleSurfaceSafe,
  SDL3.Sys.Surface.convertSurface,
  SDL3.Sys.Surface.convertSurfaceSafe,
  SDL3.Sys.Surface.convertSurfaceAndColorspace,
  SDL3.Sys.Surface.convertSurfaceAndColorspaceSafe,
  SDL3.Sys.Surface.convertPixels,
  SDL3.Sys.Surface.convertPixelsSafe,
  SDL3.Sys.Surface.convertPixelsAndColorspace,
  SDL3.Sys.Surface.convertPixelsAndColorspaceSafe,
  SDL3.Sys.Surface.premultiplyAlpha,
  SDL3.Sys.Surface.premultiplyAlphaSafe,
  SDL3.Sys.Surface.premultiplySurfaceAlpha,
  SDL3.Sys.Surface.premultiplySurfaceAlphaSafe,
  SDL3.Sys.Surface.clearSurface,
  SDL3.Sys.Surface.clearSurfaceSafe,
  SDL3.Sys.Surface.fillSurfaceRect,
  SDL3.Sys.Surface.fillSurfaceRectSafe,
  SDL3.Sys.Surface.fillSurfaceRects,
  SDL3.Sys.Surface.fillSurfaceRectsSafe,
  SDL3.Sys.Surface.blitSurface,
  SDL3.Sys.Surface.blitSurfaceSafe,
  SDL3.Sys.Surface.blitSurfaceUnchecked,
  SDL3.Sys.Surface.blitSurfaceUncheckedSafe,
  SDL3.Sys.Surface.blitSurfaceScaled,
  SDL3.Sys.Surface.blitSurfaceScaledSafe,
  SDL3.Sys.Surface.blitSurfaceUncheckedScaled,
  SDL3.Sys.Surface.blitSurfaceUncheckedScaledSafe,
  SDL3.Sys.Surface.stretchSurface,
  SDL3.Sys.Surface.stretchSurfaceSafe,
  SDL3.Sys.Surface.blitSurfaceTiled,
  SDL3.Sys.Surface.blitSurfaceTiledSafe,
  SDL3.Sys.Surface.blitSurfaceTiledWithScale,
  SDL3.Sys.Surface.blitSurfaceTiledWithScaleSafe,
  SDL3.Sys.Surface.blitSurface9Grid,
  SDL3.Sys.Surface.blitSurface9GridSafe,
  SDL3.Sys.Surface.mapSurfaceRGB,
  SDL3.Sys.Surface.mapSurfaceRGBSafe,
  SDL3.Sys.Surface.mapSurfaceRGBA,
  SDL3.Sys.Surface.mapSurfaceRGBASafe,
  SDL3.Sys.Surface.readSurfacePixel,
  SDL3.Sys.Surface.readSurfacePixelSafe,
  SDL3.Sys.Surface.readSurfacePixelFloat,
  SDL3.Sys.Surface.readSurfacePixelFloatSafe,
  SDL3.Sys.Surface.writeSurfacePixel,
  SDL3.Sys.Surface.writeSurfacePixelSafe,
  SDL3.Sys.Surface.writeSurfacePixelFloat,
  SDL3.Sys.Surface.writeSurfacePixelFloatSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Blendmode qualified
import SDL3.Sys.Bindgen.Iostream qualified
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface
import SDL3.Sys.Bindgen.Surface.Safe qualified as Safe
import SDL3.Sys.Bindgen.Surface.Unsafe qualified as Unsafe

-- | Allocate a new surface with a specific pixel format.
--
--     The pixels of the new surface are initialized to zero.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createSurfaceFrom', 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateSurface@.
--                   The safe flavor is 'createSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateSurface@, defined at @SDL3\/SDL_surface.h 173:43@
createSurface
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the surface.
  -> BG.Int32
  -- ^
  --
  --           [@height@]: the height of the surface.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the SDL_PixelFormat for the new surface\'s pixel format.
  -> IO (BG.Ptr SDL_Surface)
createSurface =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_CreateSurface (Coerce.coerce x00) (Coerce.coerce x11) x22

-- | Allocate a new surface with a specific pixel format.
--
--     The pixels of the new surface are initialized to zero.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createSurfaceFrom', 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateSurface@.
--                   The unsafe flavor is 'createSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateSurface@, defined at @SDL3\/SDL_surface.h 173:43@
createSurfaceSafe
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the surface.
  -> BG.Int32
  -- ^
  --
  --           [@height@]: the height of the surface.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the SDL_PixelFormat for the new surface\'s pixel format.
  -> IO (BG.Ptr SDL_Surface)
createSurfaceSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_CreateSurface (Coerce.coerce x00) (Coerce.coerce x11) x22

-- | Allocate a new surface with a specific pixel format and existing pixel data.
--
--     No copy is made of the pixel data. Pixel data is not managed automatically; you must free the surface before you free the pixel data.
--
--     Pitch is the offset in bytes from one row of pixels to the next, e.g. @width*4@ for @SDL_PIXELFORMAT_RGBA8888@.
--
--     You may pass NULL for pixels and 0 for pitch to create a surface that you will fill in with valid values later.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createSurface', 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateSurfaceFrom@.
--                   The safe flavor is 'createSurfaceFromSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateSurfaceFrom@, defined at @SDL3\/SDL_surface.h 203:43@
createSurfaceFrom
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the surface.
  -> BG.Int32
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
  -> BG.Int32
  -- ^
  --
  --           [@pitch@]: the number of bytes between each row, including padding.
  -> IO (BG.Ptr SDL_Surface)
createSurfaceFrom =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Unsafe.sDL_CreateSurfaceFrom (Coerce.coerce x00) (Coerce.coerce x11) x22 x33 (Coerce.coerce x44)

-- | Allocate a new surface with a specific pixel format and existing pixel data.
--
--     No copy is made of the pixel data. Pixel data is not managed automatically; you must free the surface before you free the pixel data.
--
--     Pitch is the offset in bytes from one row of pixels to the next, e.g. @width*4@ for @SDL_PIXELFORMAT_RGBA8888@.
--
--     You may pass NULL for pixels and 0 for pitch to create a surface that you will fill in with valid values later.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createSurface', 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateSurfaceFrom@.
--                   The unsafe flavor is 'createSurfaceFrom'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateSurfaceFrom@, defined at @SDL3\/SDL_surface.h 203:43@
createSurfaceFromSafe
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the surface.
  -> BG.Int32
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
  -> BG.Int32
  -- ^
  --
  --           [@pitch@]: the number of bytes between each row, including padding.
  -> IO (BG.Ptr SDL_Surface)
createSurfaceFromSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Safe.sDL_CreateSurfaceFrom (Coerce.coerce x00) (Coerce.coerce x11) x22 x33 (Coerce.coerce x44)

-- | Free a surface.
--
--     It is safe to pass NULL to this function.
--
--     [Thread safety]: No other thread should be using the surface when it is freed.
--
--     @since 3.2.0
--
--     [See also]: 'createSurface', 'createSurfaceFrom'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroySurface@.
--                   The safe flavor is 'destroySurfaceSafe'
--                   .
--
--     [C declaration]: @SDL_DestroySurface@, defined at @SDL3\/SDL_surface.h 219:34@
destroySurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' to free.
  -> IO ()
destroySurface = Unsafe.sDL_DestroySurface

-- | Free a surface.
--
--     It is safe to pass NULL to this function.
--
--     [Thread safety]: No other thread should be using the surface when it is freed.
--
--     @since 3.2.0
--
--     [See also]: 'createSurface', 'createSurfaceFrom'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroySurface@.
--                   The unsafe flavor is 'destroySurface'
--                   .
--
--     [C declaration]: @SDL_DestroySurface@, defined at @SDL3\/SDL_surface.h 219:34@
destroySurfaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' to free.
  -> IO ()
destroySurfaceSafe = Safe.sDL_DestroySurface

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
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSurfaceProperties@.
--                   The safe flavor is 'getSurfacePropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetSurfaceProperties@, defined at @SDL3\/SDL_surface.h 259:46@
getSurfaceProperties
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getSurfaceProperties =
  Unsafe.sDL_GetSurfaceProperties

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
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSurfaceProperties@.
--                   The unsafe flavor is 'getSurfaceProperties'
--                   .
--
--     [C declaration]: @SDL_GetSurfaceProperties@, defined at @SDL3\/SDL_surface.h 259:46@
getSurfacePropertiesSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getSurfacePropertiesSafe =
  Safe.sDL_GetSurfaceProperties

-- | Set the colorspace used by a surface.
--
--     Setting the colorspace doesn\'t change the pixels, only how they are interpreted in color operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceColorspace'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetSurfaceColorspace@.
--                   The safe flavor is 'setSurfaceColorspaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceColorspace@, defined at @SDL3\/SDL_surface.h 287:34@
setSurfaceColorspace
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@colorspace@]: an SDL_Colorspace value describing the surface colorspace.
  -> IO Bool
setSurfaceColorspace =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetSurfaceColorspace x00 x11)

-- | Set the colorspace used by a surface.
--
--     Setting the colorspace doesn\'t change the pixels, only how they are interpreted in color operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceColorspace'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetSurfaceColorspace@.
--                   The unsafe flavor is 'setSurfaceColorspace'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceColorspace@, defined at @SDL3\/SDL_surface.h 287:34@
setSurfaceColorspaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@colorspace@]: an SDL_Colorspace value describing the surface colorspace.
  -> IO Bool
setSurfaceColorspaceSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetSurfaceColorspace x00 x11)

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
--     [See also]: 'setSurfaceColorspace'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSurfaceColorspace@.
--                   The safe flavor is 'getSurfaceColorspaceSafe'
--                   .
--
--     [C declaration]: @SDL_GetSurfaceColorspace@, defined at @SDL3\/SDL_surface.h 307:44@
getSurfaceColorspace
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
getSurfaceColorspace =
  Unsafe.sDL_GetSurfaceColorspace

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
--     [See also]: 'setSurfaceColorspace'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSurfaceColorspace@.
--                   The unsafe flavor is 'getSurfaceColorspace'
--                   .
--
--     [C declaration]: @SDL_GetSurfaceColorspace@, defined at @SDL3\/SDL_surface.h 307:44@
getSurfaceColorspaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
getSurfaceColorspaceSafe =
  Safe.sDL_GetSurfaceColorspace

-- | Create a palette and associate it with a surface.
--
--     This function creates a palette compatible with the provided surface. The palette is then returned for you to modify, and the surface will automatically use the new palette in future operations. You do not need to destroy the returned palette, it will be freed when the reference count reaches 0, usually when the surface is destroyed.
--
--     Bitmap surfaces (with format SDL_PIXELFORMAT_INDEX1LSB or SDL_PIXELFORMAT_INDEX1MSB) will have the palette initialized with 0 as white and 1 as black. Other surfaces will get a palette initialized with white in every entry.
--
--     If this function is called for a surface that already has a palette, a new palette will be created to replace it.
--
--     [Returns]: a new SDL_Palette structure on success or NULL on failure (e.g. if the surface didn\'t have an index format); call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Pixels.setPaletteColors'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateSurfacePalette@.
--                   The safe flavor is 'createSurfacePaletteSafe'
--                   .
--
--     [C declaration]: @SDL_CreateSurfacePalette@, defined at @SDL3\/SDL_surface.h 338:43@
createSurfacePalette
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
createSurfacePalette =
  Unsafe.sDL_CreateSurfacePalette

-- | Create a palette and associate it with a surface.
--
--     This function creates a palette compatible with the provided surface. The palette is then returned for you to modify, and the surface will automatically use the new palette in future operations. You do not need to destroy the returned palette, it will be freed when the reference count reaches 0, usually when the surface is destroyed.
--
--     Bitmap surfaces (with format SDL_PIXELFORMAT_INDEX1LSB or SDL_PIXELFORMAT_INDEX1MSB) will have the palette initialized with 0 as white and 1 as black. Other surfaces will get a palette initialized with white in every entry.
--
--     If this function is called for a surface that already has a palette, a new palette will be created to replace it.
--
--     [Returns]: a new SDL_Palette structure on success or NULL on failure (e.g. if the surface didn\'t have an index format); call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Pixels.setPaletteColors'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateSurfacePalette@.
--                   The unsafe flavor is 'createSurfacePalette'
--                   .
--
--     [C declaration]: @SDL_CreateSurfacePalette@, defined at @SDL3\/SDL_surface.h 338:43@
createSurfacePaletteSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
createSurfacePaletteSafe =
  Safe.sDL_CreateSurfacePalette

-- | Set the palette used by a surface.
--
--     Setting the palette keeps an internal reference to the palette, which can be safely destroyed afterwards.
--
--     A single palette can be shared with many surfaces.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Pixels.createPalette', 'getSurfacePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetSurfacePalette@.
--                   The safe flavor is 'setSurfacePaletteSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfacePalette@, defined at @SDL3\/SDL_surface.h 361:34@
setSurfacePalette
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -- ^
  --
  --           [@palette@]: the SDL_Palette structure to use.
  -> IO Bool
setSurfacePalette =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetSurfacePalette x00 x11)

-- | Set the palette used by a surface.
--
--     Setting the palette keeps an internal reference to the palette, which can be safely destroyed afterwards.
--
--     A single palette can be shared with many surfaces.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Pixels.createPalette', 'getSurfacePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetSurfacePalette@.
--                   The unsafe flavor is 'setSurfacePalette'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfacePalette@, defined at @SDL3\/SDL_surface.h 361:34@
setSurfacePaletteSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -- ^
  --
  --           [@palette@]: the SDL_Palette structure to use.
  -> IO Bool
setSurfacePaletteSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetSurfacePalette x00 x11)

-- | Get the palette used by a surface.
--
--     [Returns]: a pointer to the palette used by the surface, or NULL if there is no palette used.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setSurfacePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSurfacePalette@.
--                   The safe flavor is 'getSurfacePaletteSafe'
--                   .
--
--     [C declaration]: @SDL_GetSurfacePalette@, defined at @SDL3\/SDL_surface.h 376:43@
getSurfacePalette
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
getSurfacePalette = Unsafe.sDL_GetSurfacePalette

-- | Get the palette used by a surface.
--
--     [Returns]: a pointer to the palette used by the surface, or NULL if there is no palette used.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setSurfacePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSurfacePalette@.
--                   The unsafe flavor is 'getSurfacePalette'
--                   .
--
--     [C declaration]: @SDL_GetSurfacePalette@, defined at @SDL3\/SDL_surface.h 376:43@
getSurfacePaletteSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
getSurfacePaletteSafe = Safe.sDL_GetSurfacePalette

-- | Add an alternate version of a surface.
--
--     This function adds an alternate version of this surface, usually used for content with high DPI representations like cursors or icons. The size, format, and content do not need to match the original surface, and these alternate versions will not be updated when the original surface changes.
--
--     This function adds a reference to the alternate version, so you should call @'destroySurface'@ on the image after this call.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'removeSurfaceAlternateImages', 'getSurfaceImages', 'surfaceHasAlternateImages'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddSurfaceAlternateImage@.
--                   The safe flavor is 'addSurfaceAlternateImageSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddSurfaceAlternateImage@, defined at @SDL3\/SDL_surface.h 404:34@
addSurfaceAlternateImage
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@image@]: a pointer to an alternate 'SDL_Surface' to associate with this surface.
  -> IO Bool
addSurfaceAlternateImage =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_AddSurfaceAlternateImage x00 x11)

-- | Add an alternate version of a surface.
--
--     This function adds an alternate version of this surface, usually used for content with high DPI representations like cursors or icons. The size, format, and content do not need to match the original surface, and these alternate versions will not be updated when the original surface changes.
--
--     This function adds a reference to the alternate version, so you should call @'destroySurface'@ on the image after this call.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'removeSurfaceAlternateImages', 'getSurfaceImages', 'surfaceHasAlternateImages'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddSurfaceAlternateImage@.
--                   The unsafe flavor is 'addSurfaceAlternateImage'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddSurfaceAlternateImage@, defined at @SDL3\/SDL_surface.h 404:34@
addSurfaceAlternateImageSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Ptr SDL_Surface
  -- ^
  --
  --           [@image@]: a pointer to an alternate 'SDL_Surface' to associate with this surface.
  -> IO Bool
addSurfaceAlternateImageSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_AddSurfaceAlternateImage x00 x11)

-- | Return whether a surface has alternate versions available.
--
--     [Returns]: true if alternate versions are available or false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addSurfaceAlternateImage', 'removeSurfaceAlternateImages', 'getSurfaceImages'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SurfaceHasAlternateImages@.
--                   The safe flavor is 'surfaceHasAlternateImagesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SurfaceHasAlternateImages@, defined at @SDL3\/SDL_surface.h 420:34@
surfaceHasAlternateImages
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO Bool
surfaceHasAlternateImages =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_SurfaceHasAlternateImages x00)

-- | Return whether a surface has alternate versions available.
--
--     [Returns]: true if alternate versions are available or false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'addSurfaceAlternateImage', 'removeSurfaceAlternateImages', 'getSurfaceImages'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SurfaceHasAlternateImages@.
--                   The unsafe flavor is 'surfaceHasAlternateImages'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SurfaceHasAlternateImages@, defined at @SDL3\/SDL_surface.h 420:34@
surfaceHasAlternateImagesSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO Bool
surfaceHasAlternateImagesSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_SurfaceHasAlternateImages x00)

-- | Get an array including all versions of a surface.
--
--     This returns all versions of a surface, with the surface being queried as the first element in the returned array.
--
--     Freeing the array of surfaces does not affect the surfaces in the array. They are still referenced by the surface being queried and will be cleaned up normally.
--
--     [Returns]: a NULL terminated array of 'SDL_Surface' pointers or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'addSurfaceAlternateImage', 'removeSurfaceAlternateImages', 'surfaceHasAlternateImages'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSurfaceImages@.
--                   The safe flavor is 'getSurfaceImagesSafe'
--                   .
--
--     [C declaration]: @SDL_GetSurfaceImages@, defined at @SDL3\/SDL_surface.h 448:44@
getSurfaceImages
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of surface pointers returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Surface))
getSurfaceImages = Unsafe.sDL_GetSurfaceImages

-- | Get an array including all versions of a surface.
--
--     This returns all versions of a surface, with the surface being queried as the first element in the returned array.
--
--     Freeing the array of surfaces does not affect the surfaces in the array. They are still referenced by the surface being queried and will be cleaned up normally.
--
--     [Returns]: a NULL terminated array of 'SDL_Surface' pointers or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'addSurfaceAlternateImage', 'removeSurfaceAlternateImages', 'surfaceHasAlternateImages'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSurfaceImages@.
--                   The unsafe flavor is 'getSurfaceImages'
--                   .
--
--     [C declaration]: @SDL_GetSurfaceImages@, defined at @SDL3\/SDL_surface.h 448:44@
getSurfaceImagesSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of surface pointers returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Surface))
getSurfaceImagesSafe = Safe.sDL_GetSurfaceImages

-- | Remove all alternate versions of a surface.
--
--     This function removes a reference from all the alternative versions, destroying them if this is the last reference to them.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'addSurfaceAlternateImage', 'getSurfaceImages', 'surfaceHasAlternateImages'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RemoveSurfaceAlternateImages@.
--                   The safe flavor is 'removeSurfaceAlternateImagesSafe'
--                   .
--
--     [C declaration]: @SDL_RemoveSurfaceAlternateImages@, defined at @SDL3\/SDL_surface.h 467:34@
removeSurfaceAlternateImages
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> IO ()
removeSurfaceAlternateImages =
  Unsafe.sDL_RemoveSurfaceAlternateImages

-- | Remove all alternate versions of a surface.
--
--     This function removes a reference from all the alternative versions, destroying them if this is the last reference to them.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'addSurfaceAlternateImage', 'getSurfaceImages', 'surfaceHasAlternateImages'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RemoveSurfaceAlternateImages@.
--                   The unsafe flavor is 'removeSurfaceAlternateImages'
--                   .
--
--     [C declaration]: @SDL_RemoveSurfaceAlternateImages@, defined at @SDL3\/SDL_surface.h 467:34@
removeSurfaceAlternateImagesSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> IO ()
removeSurfaceAlternateImagesSafe =
  Safe.sDL_RemoveSurfaceAlternateImages

-- | Set up a surface for directly accessing the pixels.
--
--     Between calls to @'lockSurface'@ \/ @'unlockSurface'@, you can write to and read from @surface->pixels@, using the pixel format stored in @surface->format@. Once you are done accessing the surface, you should use @'unlockSurface'@ to release it.
--
--     Not all surfaces require locking. If @SDL_MUSTLOCK(surface)@ evaluates to 0, then you can read and write to the surface at any time, and the pixel format of the surface will not change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces. The locking referred to by this function is making the pixels available for direct access, not thread-safe locking.
--
--     @since 3.2.0
--
--     [See also]: @SDL_MUSTLOCK@, 'unlockSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockSurface@.
--                   The safe flavor is 'lockSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockSurface@, defined at @SDL3\/SDL_surface.h 495:34@
lockSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to be locked.
  -> IO Bool
lockSurface =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_LockSurface x00)

-- | Set up a surface for directly accessing the pixels.
--
--     Between calls to @'lockSurface'@ \/ @'unlockSurface'@, you can write to and read from @surface->pixels@, using the pixel format stored in @surface->format@. Once you are done accessing the surface, you should use @'unlockSurface'@ to release it.
--
--     Not all surfaces require locking. If @SDL_MUSTLOCK(surface)@ evaluates to 0, then you can read and write to the surface at any time, and the pixel format of the surface will not change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces. The locking referred to by this function is making the pixels available for direct access, not thread-safe locking.
--
--     @since 3.2.0
--
--     [See also]: @SDL_MUSTLOCK@, 'unlockSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockSurface@.
--                   The unsafe flavor is 'lockSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockSurface@, defined at @SDL3\/SDL_surface.h 495:34@
lockSurfaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to be locked.
  -> IO Bool
lockSurfaceSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_LockSurface x00)

-- | Release a surface after directly accessing the pixels.
--
--     [Thread safety]: This function is not thread safe. The locking referred to by this function is making the pixels available for direct access, not thread-safe locking.
--
--     @since 3.2.0
--
--     [See also]: 'lockSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnlockSurface@.
--                   The safe flavor is 'unlockSurfaceSafe'
--                   .
--
--     [C declaration]: @SDL_UnlockSurface@, defined at @SDL3\/SDL_surface.h 510:34@
unlockSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to be unlocked.
  -> IO ()
unlockSurface = Unsafe.sDL_UnlockSurface

-- | Release a surface after directly accessing the pixels.
--
--     [Thread safety]: This function is not thread safe. The locking referred to by this function is making the pixels available for direct access, not thread-safe locking.
--
--     @since 3.2.0
--
--     [See also]: 'lockSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnlockSurface@.
--                   The unsafe flavor is 'unlockSurface'
--                   .
--
--     [C declaration]: @SDL_UnlockSurface@, defined at @SDL3\/SDL_surface.h 510:34@
unlockSurfaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to be unlocked.
  -> IO ()
unlockSurfaceSafe = Safe.sDL_UnlockSurface

-- | Load a BMP or PNG image from a seekable SDL data stream.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'destroySurface', 'loadSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadSurface_IO@.
--                   The safe flavor is 'loadSurfaceIOSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadSurface_IO@, defined at @SDL3\/SDL_surface.h 531:43@
loadSurfaceIO
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the surface.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr SDL_Surface)
loadSurfaceIO =
  \x00 ->
    \x11 ->
      Unsafe.sDL_LoadSurface_IO x00 (CBool.fromBool x11)

-- | Load a BMP or PNG image from a seekable SDL data stream.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'destroySurface', 'loadSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadSurface_IO@.
--                   The unsafe flavor is 'loadSurfaceIO'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadSurface_IO@, defined at @SDL3\/SDL_surface.h 531:43@
loadSurfaceIOSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the surface.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr SDL_Surface)
loadSurfaceIOSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_LoadSurface_IO x00 (CBool.fromBool x11)

-- | Load a BMP or PNG image from a file.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'destroySurface', 'loadSurfaceIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadSurface@.
--                   The safe flavor is 'loadSurfaceSafe'
--                   .
--
--     [C declaration]: @SDL_LoadSurface@, defined at @SDL3\/SDL_surface.h 550:43@
loadSurface
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the file to load.
  -> IO (BG.Ptr SDL_Surface)
loadSurface = Unsafe.sDL_LoadSurface

-- | Load a BMP or PNG image from a file.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'destroySurface', 'loadSurfaceIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadSurface@.
--                   The unsafe flavor is 'loadSurface'
--                   .
--
--     [C declaration]: @SDL_LoadSurface@, defined at @SDL3\/SDL_surface.h 550:43@
loadSurfaceSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the file to load.
  -> IO (BG.Ptr SDL_Surface)
loadSurfaceSafe = Safe.sDL_LoadSurface

-- | Load a BMP image from a seekable SDL data stream.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroySurface', 'loadBMP', 'saveBMPIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadBMP_IO@.
--                   The safe flavor is 'loadBMPIOSafe'
--                   : reads the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadBMP_IO@, defined at @SDL3\/SDL_surface.h 572:43@
loadBMPIO
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the surface.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr SDL_Surface)
loadBMPIO =
  \x00 ->
    \x11 ->
      Unsafe.sDL_LoadBMP_IO x00 (CBool.fromBool x11)

-- | Load a BMP image from a seekable SDL data stream.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroySurface', 'loadBMP', 'saveBMPIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadBMP_IO@.
--                   The unsafe flavor is 'loadBMPIO'
--                   : reads the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadBMP_IO@, defined at @SDL3\/SDL_surface.h 572:43@
loadBMPIOSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the surface.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr SDL_Surface)
loadBMPIOSafe =
  \x00 ->
    \x11 -> Safe.sDL_LoadBMP_IO x00 (CBool.fromBool x11)

-- | Load a BMP image from a file.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroySurface', 'loadBMPIO', 'saveBMP'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadBMP@.
--                   The safe flavor is 'loadBMPSafe'
--                   : blocks on whole-file I\/O.
--
--     [C declaration]: @SDL_LoadBMP@, defined at @SDL3\/SDL_surface.h 592:43@
loadBMP
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the BMP file to load.
  -> IO (BG.Ptr SDL_Surface)
loadBMP = Unsafe.sDL_LoadBMP

-- | Load a BMP image from a file.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroySurface', 'loadBMPIO', 'saveBMP'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadBMP@.
--                   The unsafe flavor is 'loadBMP'
--                   : blocks on whole-file I\/O.
--
--     [C declaration]: @SDL_LoadBMP@, defined at @SDL3\/SDL_surface.h 592:43@
loadBMPSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the BMP file to load.
  -> IO (BG.Ptr SDL_Surface)
loadBMPSafe = Safe.sDL_LoadBMP

-- | Save a surface to a seekable SDL data stream in BMP format.
--
--     Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the BMP directly. Other RGB formats with 8-bit or higher get converted to a 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit surface before they are saved. YUV and paletted 1-bit and 4-bit formats are not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'loadBMPIO', 'saveBMP'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SaveBMP_IO@.
--                   The safe flavor is 'saveBMPIOSafe'
--                   : writes the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SaveBMP_IO@, defined at @SDL3\/SDL_surface.h 618:34@
saveBMPIO
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@dst@]: a data stream to save to.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @dst@ before returning, even in the case of an error.
  -> IO Bool
saveBMPIO =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SaveBMP_IO x00 x11 (CBool.fromBool x22))

-- | Save a surface to a seekable SDL data stream in BMP format.
--
--     Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the BMP directly. Other RGB formats with 8-bit or higher get converted to a 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit surface before they are saved. YUV and paletted 1-bit and 4-bit formats are not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'loadBMPIO', 'saveBMP'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SaveBMP_IO@.
--                   The unsafe flavor is 'saveBMPIO'
--                   : writes the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SaveBMP_IO@, defined at @SDL3\/SDL_surface.h 618:34@
saveBMPIOSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@dst@]: a data stream to save to.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @dst@ before returning, even in the case of an error.
  -> IO Bool
saveBMPIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SaveBMP_IO x00 x11 (CBool.fromBool x22))

-- | Save a surface to a file in BMP format.
--
--     Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the BMP directly. Other RGB formats with 8-bit or higher get converted to a 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit surface before they are saved. YUV and paletted 1-bit and 4-bit formats are not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'loadBMP', 'saveBMPIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SaveBMP@.
--                   The safe flavor is 'saveBMPSafe'
--                   : blocks on whole-file I\/O.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SaveBMP@, defined at @SDL3\/SDL_surface.h 642:34@
saveBMP
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a file to save to.
  -> IO Bool
saveBMP =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SaveBMP x00 x11)

-- | Save a surface to a file in BMP format.
--
--     Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the BMP directly. Other RGB formats with 8-bit or higher get converted to a 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit surface before they are saved. YUV and paletted 1-bit and 4-bit formats are not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'loadBMP', 'saveBMPIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SaveBMP@.
--                   The unsafe flavor is 'saveBMP'
--                   : blocks on whole-file I\/O.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SaveBMP@, defined at @SDL3\/SDL_surface.h 642:34@
saveBMPSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a file to save to.
  -> IO Bool
saveBMPSafe =
  \x00 ->
    \x11 -> fmap CBool.toBool (Safe.sDL_SaveBMP x00 x11)

-- | Load a PNG image from a seekable SDL data stream.
--
--     This is intended as a convenience function for loading images from trusted sources. If you want to load arbitrary images you should use libpng or another image loading library designed with security in mind.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'destroySurface', 'loadPNG', 'savePNGIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadPNG_IO@.
--                   The safe flavor is 'loadPNGIOSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadPNG_IO@, defined at @SDL3\/SDL_surface.h 668:43@
loadPNGIO
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the surface.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr SDL_Surface)
loadPNGIO =
  \x00 ->
    \x11 ->
      Unsafe.sDL_LoadPNG_IO x00 (CBool.fromBool x11)

-- | Load a PNG image from a seekable SDL data stream.
--
--     This is intended as a convenience function for loading images from trusted sources. If you want to load arbitrary images you should use libpng or another image loading library designed with security in mind.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'destroySurface', 'loadPNG', 'savePNGIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadPNG_IO@.
--                   The unsafe flavor is 'loadPNGIO'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadPNG_IO@, defined at @SDL3\/SDL_surface.h 668:43@
loadPNGIOSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data stream for the surface.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr SDL_Surface)
loadPNGIOSafe =
  \x00 ->
    \x11 -> Safe.sDL_LoadPNG_IO x00 (CBool.fromBool x11)

-- | Load a PNG image from a file.
--
--     This is intended as a convenience function for loading images from trusted sources. If you want to load arbitrary images you should use libpng or another image loading library designed with security in mind.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'destroySurface', 'loadPNGIO', 'savePNG'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadPNG@.
--                   The safe flavor is 'loadPNGSafe'
--                   .
--
--     [C declaration]: @SDL_LoadPNG@, defined at @SDL3\/SDL_surface.h 692:43@
loadPNG
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the PNG file to load.
  -> IO (BG.Ptr SDL_Surface)
loadPNG = Unsafe.sDL_LoadPNG

-- | Load a PNG image from a file.
--
--     This is intended as a convenience function for loading images from trusted sources. If you want to load arbitrary images you should use libpng or another image loading library designed with security in mind.
--
--     The new surface should be freed with @'destroySurface'@. Not doing so will result in a memory leak.
--
--     [Returns]: a pointer to a new 'SDL_Surface' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [See also]: 'destroySurface', 'loadPNGIO', 'savePNG'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadPNG@.
--                   The unsafe flavor is 'loadPNG'
--                   .
--
--     [C declaration]: @SDL_LoadPNG@, defined at @SDL3\/SDL_surface.h 692:43@
loadPNGSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the PNG file to load.
  -> IO (BG.Ptr SDL_Surface)
loadPNGSafe = Safe.sDL_LoadPNG

-- | Save a surface to a seekable SDL data stream in PNG format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     [See also]: 'loadPNGIO', 'savePNG'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SavePNG_IO@.
--                   The safe flavor is 'savePNGIOSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SavePNG_IO@, defined at @SDL3\/SDL_surface.h 712:34@
savePNGIO
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@dst@]: a data stream to save to.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @dst@ before returning, even in the case of an error.
  -> IO Bool
savePNGIO =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SavePNG_IO x00 x11 (CBool.fromBool x22))

-- | Save a surface to a seekable SDL data stream in PNG format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     [See also]: 'loadPNGIO', 'savePNG'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SavePNG_IO@.
--                   The unsafe flavor is 'savePNGIO'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SavePNG_IO@, defined at @SDL3\/SDL_surface.h 712:34@
savePNGIOSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@dst@]: a data stream to save to.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @dst@ before returning, even in the case of an error.
  -> IO Bool
savePNGIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SavePNG_IO x00 x11 (CBool.fromBool x22))

-- | Save a surface to a file in PNG format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     [See also]: 'loadPNG', 'savePNGIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SavePNG@.
--                   The safe flavor is 'savePNGSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SavePNG@, defined at @SDL3\/SDL_surface.h 730:34@
savePNG
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a file to save to.
  -> IO Bool
savePNG =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SavePNG x00 x11)

-- | Save a surface to a file in PNG format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     [See also]: 'loadPNG', 'savePNGIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SavePNG@.
--                   The unsafe flavor is 'savePNG'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SavePNG@, defined at @SDL3\/SDL_surface.h 730:34@
savePNGSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure containing the image to be saved.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a file to save to.
  -> IO Bool
savePNGSafe =
  \x00 ->
    \x11 -> fmap CBool.toBool (Safe.sDL_SavePNG x00 x11)

-- | Set the RLE acceleration hint for a surface.
--
--     If RLE is enabled, color key and alpha blending blits are much faster, but the surface must be locked before directly accessing the pixels.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface', 'lockSurface', 'unlockSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetSurfaceRLE@.
--                   The safe flavor is 'setSurfaceRLESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceRLE@, defined at @SDL3\/SDL_surface.h 752:34@
setSurfaceRLE
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to optimize.
  -> Bool
  -- ^
  --
  --           [@enabled@]: true to enable RLE acceleration, false to disable it.
  -> IO Bool
setSurfaceRLE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetSurfaceRLE x00 (CBool.fromBool x11))

-- | Set the RLE acceleration hint for a surface.
--
--     If RLE is enabled, color key and alpha blending blits are much faster, but the surface must be locked before directly accessing the pixels.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface', 'lockSurface', 'unlockSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetSurfaceRLE@.
--                   The unsafe flavor is 'setSurfaceRLE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceRLE@, defined at @SDL3\/SDL_surface.h 752:34@
setSurfaceRLESafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to optimize.
  -> Bool
  -- ^
  --
  --           [@enabled@]: true to enable RLE acceleration, false to disable it.
  -> IO Bool
setSurfaceRLESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetSurfaceRLE x00 (CBool.fromBool x11))

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
--     [See also]: 'setSurfaceRLE'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SurfaceHasRLE@.
--                   The safe flavor is 'surfaceHasRLESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SurfaceHasRLE@, defined at @SDL3\/SDL_surface.h 768:34@
surfaceHasRLE
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO Bool
surfaceHasRLE =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_SurfaceHasRLE x00)

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
--     [See also]: 'setSurfaceRLE'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SurfaceHasRLE@.
--                   The unsafe flavor is 'surfaceHasRLE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SurfaceHasRLE@, defined at @SDL3\/SDL_surface.h 768:34@
surfaceHasRLESafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO Bool
surfaceHasRLESafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_SurfaceHasRLE x00)

-- | Set the color key (transparent pixel) in a surface.
--
--     The color key defines a pixel value that will be treated as transparent in a blit. For example, one can use this to specify that cyan pixels should be considered transparent, and therefore not rendered.
--
--     It is a pixel of the format used by the surface, as generated by 'SDL3.Sys.Pixels.mapRGB'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceColorKey', 'setSurfaceRLE', 'surfaceHasColorKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetSurfaceColorKey@.
--                   The safe flavor is 'setSurfaceColorKeySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceColorKey@, defined at @SDL3\/SDL_surface.h 795:34@
setSurfaceColorKey
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> Bool
  -- ^
  --
  --           [@enabled@]: true to enable color key, false to disable color key.
  -> BG.Word32
  -- ^
  --
  --           [@key@]: the transparent pixel.
  -> IO Bool
setSurfaceColorKey =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetSurfaceColorKey x00 (CBool.fromBool x11) (Coerce.coerce x22))

-- | Set the color key (transparent pixel) in a surface.
--
--     The color key defines a pixel value that will be treated as transparent in a blit. For example, one can use this to specify that cyan pixels should be considered transparent, and therefore not rendered.
--
--     It is a pixel of the format used by the surface, as generated by 'SDL3.Sys.Pixels.mapRGB'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceColorKey', 'setSurfaceRLE', 'surfaceHasColorKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetSurfaceColorKey@.
--                   The unsafe flavor is 'setSurfaceColorKey'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceColorKey@, defined at @SDL3\/SDL_surface.h 795:34@
setSurfaceColorKeySafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> Bool
  -- ^
  --
  --           [@enabled@]: true to enable color key, false to disable color key.
  -> BG.Word32
  -- ^
  --
  --           [@key@]: the transparent pixel.
  -> IO Bool
setSurfaceColorKeySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetSurfaceColorKey x00 (CBool.fromBool x11) (Coerce.coerce x22))

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
--     [See also]: 'setSurfaceColorKey', 'getSurfaceColorKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SurfaceHasColorKey@.
--                   The safe flavor is 'surfaceHasColorKeySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SurfaceHasColorKey@, defined at @SDL3\/SDL_surface.h 812:34@
surfaceHasColorKey
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO Bool
surfaceHasColorKey =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_SurfaceHasColorKey x00)

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
--     [See also]: 'setSurfaceColorKey', 'getSurfaceColorKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SurfaceHasColorKey@.
--                   The unsafe flavor is 'surfaceHasColorKey'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SurfaceHasColorKey@, defined at @SDL3\/SDL_surface.h 812:34@
surfaceHasColorKeySafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> IO Bool
surfaceHasColorKeySafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_SurfaceHasColorKey x00)

-- | Get the color key (transparent pixel) for a surface.
--
--     The color key is a pixel of the format used by the surface, as generated by 'SDL3.Sys.Pixels.mapRGB'.
--
--     If the surface doesn\'t have color key enabled this function returns false.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setSurfaceColorKey', 'surfaceHasColorKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSurfaceColorKey@.
--                   The safe flavor is 'getSurfaceColorKeySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceColorKey@, defined at @SDL3\/SDL_surface.h 834:34@
getSurfaceColorKey
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@key@]: a pointer filled in with the transparent pixel.
  -> IO Bool
getSurfaceColorKey =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetSurfaceColorKey x00 x11)

-- | Get the color key (transparent pixel) for a surface.
--
--     The color key is a pixel of the format used by the surface, as generated by 'SDL3.Sys.Pixels.mapRGB'.
--
--     If the surface doesn\'t have color key enabled this function returns false.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setSurfaceColorKey', 'surfaceHasColorKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSurfaceColorKey@.
--                   The unsafe flavor is 'getSurfaceColorKey'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceColorKey@, defined at @SDL3\/SDL_surface.h 834:34@
getSurfaceColorKeySafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@key@]: a pointer filled in with the transparent pixel.
  -> IO Bool
getSurfaceColorKeySafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetSurfaceColorKey x00 x11)

-- | Set an additional color value multiplied into blit operations.
--
--     When this surface is blitted, during the blit operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * (color \/ 255)@
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceColorMod', 'setSurfaceAlphaMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetSurfaceColorMod@.
--                   The safe flavor is 'setSurfaceColorModSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceColorMod@, defined at @SDL3\/SDL_surface.h 860:34@
setSurfaceColorMod
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red color value multiplied into blit operations.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green color value multiplied into blit operations.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue color value multiplied into blit operations.
  -> IO Bool
setSurfaceColorMod =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_SetSurfaceColorMod x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Set an additional color value multiplied into blit operations.
--
--     When this surface is blitted, during the blit operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * (color \/ 255)@
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceColorMod', 'setSurfaceAlphaMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetSurfaceColorMod@.
--                   The unsafe flavor is 'setSurfaceColorMod'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceColorMod@, defined at @SDL3\/SDL_surface.h 860:34@
setSurfaceColorModSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red color value multiplied into blit operations.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green color value multiplied into blit operations.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue color value multiplied into blit operations.
  -> IO Bool
setSurfaceColorModSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_SetSurfaceColorMod x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Get the additional color value multiplied into blit operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceAlphaMod', 'setSurfaceColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSurfaceColorMod@.
--                   The safe flavor is 'getSurfaceColorModSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceColorMod@, defined at @SDL3\/SDL_surface.h 881:34@
getSurfaceColorMod
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
  -> IO Bool
getSurfaceColorMod =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_GetSurfaceColorMod x00 x11 x22 x33)

-- | Get the additional color value multiplied into blit operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceAlphaMod', 'setSurfaceColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSurfaceColorMod@.
--                   The unsafe flavor is 'getSurfaceColorMod'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceColorMod@, defined at @SDL3\/SDL_surface.h 881:34@
getSurfaceColorModSafe
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
  -> IO Bool
getSurfaceColorModSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_GetSurfaceColorMod x00 x11 x22 x33)

-- | Set an additional alpha value used in blit operations.
--
--     When this surface is blitted, during the blit operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * (alpha \/ 255)@
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceAlphaMod', 'setSurfaceColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetSurfaceAlphaMod@.
--                   The safe flavor is 'setSurfaceAlphaModSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceAlphaMod@, defined at @SDL3\/SDL_surface.h 904:34@
setSurfaceAlphaMod
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Word8
  -- ^
  --
  --           [@alpha@]: the alpha value multiplied into blit operations.
  -> IO Bool
setSurfaceAlphaMod =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetSurfaceAlphaMod x00 (Coerce.coerce x11))

-- | Set an additional alpha value used in blit operations.
--
--     When this surface is blitted, during the blit operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * (alpha \/ 255)@
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceAlphaMod', 'setSurfaceColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetSurfaceAlphaMod@.
--                   The unsafe flavor is 'setSurfaceAlphaMod'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceAlphaMod@, defined at @SDL3\/SDL_surface.h 904:34@
setSurfaceAlphaModSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> BG.Word8
  -- ^
  --
  --           [@alpha@]: the alpha value multiplied into blit operations.
  -> IO Bool
setSurfaceAlphaModSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetSurfaceAlphaMod x00 (Coerce.coerce x11))

-- | Get the additional alpha value used in blit operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceColorMod', 'setSurfaceAlphaMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSurfaceAlphaMod@.
--                   The safe flavor is 'getSurfaceAlphaModSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceAlphaMod@, defined at @SDL3\/SDL_surface.h 921:34@
getSurfaceAlphaMod
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@alpha@]: a pointer filled in with the current alpha value.
  -> IO Bool
getSurfaceAlphaMod =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetSurfaceAlphaMod x00 x11)

-- | Get the additional alpha value used in blit operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceColorMod', 'setSurfaceAlphaMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSurfaceAlphaMod@.
--                   The unsafe flavor is 'getSurfaceAlphaMod'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceAlphaMod@, defined at @SDL3\/SDL_surface.h 921:34@
getSurfaceAlphaModSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@alpha@]: a pointer filled in with the current alpha value.
  -> IO Bool
getSurfaceAlphaModSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetSurfaceAlphaMod x00 x11)

-- | Set the blend mode used for blit operations.
--
--     To copy a surface to another surface (or texture) without blending with the existing data, the blendmode of the SOURCE surface should be set to @SDL_BLENDMODE_NONE@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetSurfaceBlendMode@.
--                   The safe flavor is 'setSurfaceBlendModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceBlendMode@, defined at @SDL3\/SDL_surface.h 942:34@
setSurfaceBlendMode
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: the SDL_BlendMode to use for blit blending.
  -> IO Bool
setSurfaceBlendMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetSurfaceBlendMode x00 x11)

-- | Set the blend mode used for blit operations.
--
--     To copy a surface to another surface (or texture) without blending with the existing data, the blendmode of the SOURCE surface should be set to @SDL_BLENDMODE_NONE@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'getSurfaceBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetSurfaceBlendMode@.
--                   The unsafe flavor is 'setSurfaceBlendMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceBlendMode@, defined at @SDL3\/SDL_surface.h 942:34@
setSurfaceBlendModeSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to update.
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: the SDL_BlendMode to use for blit blending.
  -> IO Bool
setSurfaceBlendModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetSurfaceBlendMode x00 x11)

-- | Get the blend mode used for blit operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setSurfaceBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSurfaceBlendMode@.
--                   The safe flavor is 'getSurfaceBlendModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceBlendMode@, defined at @SDL3\/SDL_surface.h 958:34@
getSurfaceBlendMode
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
  -> IO Bool
getSurfaceBlendMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetSurfaceBlendMode x00 x11)

-- | Get the blend mode used for blit operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setSurfaceBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSurfaceBlendMode@.
--                   The unsafe flavor is 'getSurfaceBlendMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceBlendMode@, defined at @SDL3\/SDL_surface.h 958:34@
getSurfaceBlendModeSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
  -> IO Bool
getSurfaceBlendModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetSurfaceBlendMode x00 x11)

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
--     [See also]: 'getSurfaceClipRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetSurfaceClipRect@.
--                   The safe flavor is 'setSurfaceClipRectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceClipRect@, defined at @SDL3\/SDL_surface.h 982:34@
setSurfaceClipRect
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to be clipped.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure representing the clipping rectangle, or NULL to disable clipping.
  -> IO Bool
setSurfaceClipRect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetSurfaceClipRect x00 x11)

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
--     [See also]: 'getSurfaceClipRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetSurfaceClipRect@.
--                   The unsafe flavor is 'setSurfaceClipRect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetSurfaceClipRect@, defined at @SDL3\/SDL_surface.h 982:34@
setSurfaceClipRectSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure to be clipped.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure representing the clipping rectangle, or NULL to disable clipping.
  -> IO Bool
setSurfaceClipRectSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetSurfaceClipRect x00 x11)

-- | Get the clipping rectangle for a surface.
--
--     When @surface@ is the destination of a blit, only the area within the clip rectangle is drawn into.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'setSurfaceClipRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSurfaceClipRect@.
--                   The safe flavor is 'getSurfaceClipRectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceClipRect@, defined at @SDL3\/SDL_surface.h 1004:34@
getSurfaceClipRect
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure representing the surface to be clipped.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure filled in with the clipping rectangle for the surface.
  -> IO Bool
getSurfaceClipRect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetSurfaceClipRect x00 x11)

-- | Get the clipping rectangle for a surface.
--
--     When @surface@ is the destination of a blit, only the area within the clip rectangle is drawn into.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'setSurfaceClipRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSurfaceClipRect@.
--                   The unsafe flavor is 'getSurfaceClipRect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSurfaceClipRect@, defined at @SDL3\/SDL_surface.h 1004:34@
getSurfaceClipRectSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' structure representing the surface to be clipped.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure filled in with the clipping rectangle for the surface.
  -> IO Bool
getSurfaceClipRectSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetSurfaceClipRect x00 x11)

-- | Flip a surface vertically or horizontally.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_FlipSurface@.
--                   The safe flavor is 'flipSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlipSurface@, defined at @SDL3\/SDL_surface.h 1019:34@
flipSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to flip.
  -> SDL_FlipMode
  -- ^
  --
  --           [@flip@]: the direction to flip.
  -> IO Bool
flipSurface =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_FlipSurface x00 x11)

-- | Flip a surface vertically or horizontally.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FlipSurface@.
--                   The unsafe flavor is 'flipSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlipSurface@, defined at @SDL3\/SDL_surface.h 1019:34@
flipSurfaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to flip.
  -> SDL_FlipMode
  -- ^
  --
  --           [@flip@]: the direction to flip.
  -> IO Bool
flipSurfaceSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_FlipSurface x00 x11)

-- | Return a copy of a surface rotated clockwise a number of degrees.
--
--     The angle of rotation can be negative for counter-clockwise rotation.
--
--     When the rotation isn\'t a multiple of 90 degrees, the resulting surface is larger than the original, with the background filled in with the colorkey, if available, or RGBA 255\/255\/255\/0 if not.
--
--     If @surface@ has the SDL_PROP_SURFACE_ROTATION_FLOAT property set on it, the new copy will have the adjusted value set: if the rotation property is 90 and @angle@ was 30, the new surface will have a property value of 60 (that is: to be upright vs gravity, this surface needs to rotate 60 more degrees). However, note that further rotations on the new surface in this example will produce unexpected results, since the image will have resized and padded to accommodate the not-90 degree angle.
--
--     [Returns]: a rotated copy of the surface or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RotateSurface@.
--                   The safe flavor is 'rotateSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RotateSurface@, defined at @SDL3\/SDL_surface.h 1048:43@
rotateSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to rotate.
  -> Float
  -- ^
  --
  --           [@angle@]: the rotation angle, in degrees.
  -> IO (BG.Ptr SDL_Surface)
rotateSurface =
  \x00 ->
    \x11 ->
      Unsafe.sDL_RotateSurface x00 (Coerce.coerce x11)

-- | Return a copy of a surface rotated clockwise a number of degrees.
--
--     The angle of rotation can be negative for counter-clockwise rotation.
--
--     When the rotation isn\'t a multiple of 90 degrees, the resulting surface is larger than the original, with the background filled in with the colorkey, if available, or RGBA 255\/255\/255\/0 if not.
--
--     If @surface@ has the SDL_PROP_SURFACE_ROTATION_FLOAT property set on it, the new copy will have the adjusted value set: if the rotation property is 90 and @angle@ was 30, the new surface will have a property value of 60 (that is: to be upright vs gravity, this surface needs to rotate 60 more degrees). However, note that further rotations on the new surface in this example will produce unexpected results, since the image will have resized and padded to accommodate the not-90 degree angle.
--
--     [Returns]: a rotated copy of the surface or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RotateSurface@.
--                   The unsafe flavor is 'rotateSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RotateSurface@, defined at @SDL3\/SDL_surface.h 1048:43@
rotateSurfaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to rotate.
  -> Float
  -- ^
  --
  --           [@angle@]: the rotation angle, in degrees.
  -> IO (BG.Ptr SDL_Surface)
rotateSurfaceSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_RotateSurface x00 (Coerce.coerce x11)

-- | Creates a new surface identical to the existing surface.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     The returned surface should be freed with @'destroySurface'@.
--
--     [Returns]: a copy of the surface or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DuplicateSurface@.
--                   The safe flavor is 'duplicateSurfaceSafe'
--                   .
--
--     [C declaration]: @SDL_DuplicateSurface@, defined at @SDL3\/SDL_surface.h 1069:43@
duplicateSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to duplicate.
  -> IO (BG.Ptr SDL_Surface)
duplicateSurface = Unsafe.sDL_DuplicateSurface

-- | Creates a new surface identical to the existing surface.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     The returned surface should be freed with @'destroySurface'@.
--
--     [Returns]: a copy of the surface or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DuplicateSurface@.
--                   The unsafe flavor is 'duplicateSurface'
--                   .
--
--     [C declaration]: @SDL_DuplicateSurface@, defined at @SDL3\/SDL_surface.h 1069:43@
duplicateSurfaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to duplicate.
  -> IO (BG.Ptr SDL_Surface)
duplicateSurfaceSafe = Safe.sDL_DuplicateSurface

-- | Creates a new surface identical to the existing surface, scaled to the desired size.
--
--     The returned surface should be freed with @'destroySurface'@.
--
--     [Returns]: a copy of the surface or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ScaleSurface@.
--                   The safe flavor is 'scaleSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ScaleSurface@, defined at @SDL3\/SDL_surface.h 1091:43@
scaleSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to duplicate and scale.
  -> BG.Int32
  -- ^
  --
  --           [@width@]: the width of the new surface.
  -> BG.Int32
  -- ^
  --
  --           [@height@]: the height of the new surface.
  -> SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: the 'SDL_ScaleMode' to be used.
  -> IO (BG.Ptr SDL_Surface)
scaleSurface =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_ScaleSurface x00 (Coerce.coerce x11) (Coerce.coerce x22) x33

-- | Creates a new surface identical to the existing surface, scaled to the desired size.
--
--     The returned surface should be freed with @'destroySurface'@.
--
--     [Returns]: a copy of the surface or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ScaleSurface@.
--                   The unsafe flavor is 'scaleSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ScaleSurface@, defined at @SDL3\/SDL_surface.h 1091:43@
scaleSurfaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to duplicate and scale.
  -> BG.Int32
  -- ^
  --
  --           [@width@]: the width of the new surface.
  -> BG.Int32
  -- ^
  --
  --           [@height@]: the height of the new surface.
  -> SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: the 'SDL_ScaleMode' to be used.
  -> IO (BG.Ptr SDL_Surface)
scaleSurfaceSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_ScaleSurface x00 (Coerce.coerce x11) (Coerce.coerce x22) x33

-- | Copy an existing surface to a new surface of the specified format.
--
--     This function is used to optimize images for faster /repeat/ blitting. This is accomplished by converting the original and storing the result as a new surface. The new, optimized surface can then be used as the source for future blits, making them faster.
--
--     If you are converting to an indexed surface and want to map colors to a palette, you can use @'convertSurfaceAndColorspace'@ instead.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'convertSurfaceAndColorspace', 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ConvertSurface@.
--                   The safe flavor is 'convertSurfaceSafe'
--                   .
--
--     [C declaration]: @SDL_ConvertSurface@, defined at @SDL3\/SDL_surface.h 1120:43@
convertSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the existing 'SDL_Surface' structure to convert.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the new pixel format.
  -> IO (BG.Ptr SDL_Surface)
convertSurface = Unsafe.sDL_ConvertSurface

-- | Copy an existing surface to a new surface of the specified format.
--
--     This function is used to optimize images for faster /repeat/ blitting. This is accomplished by converting the original and storing the result as a new surface. The new, optimized surface can then be used as the source for future blits, making them faster.
--
--     If you are converting to an indexed surface and want to map colors to a palette, you can use @'convertSurfaceAndColorspace'@ instead.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'convertSurfaceAndColorspace', 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ConvertSurface@.
--                   The unsafe flavor is 'convertSurface'
--                   .
--
--     [C declaration]: @SDL_ConvertSurface@, defined at @SDL3\/SDL_surface.h 1120:43@
convertSurfaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the existing 'SDL_Surface' structure to convert.
  -> SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: the new pixel format.
  -> IO (BG.Ptr SDL_Surface)
convertSurfaceSafe = Safe.sDL_ConvertSurface

-- | Copy an existing surface to a new surface of the specified format and colorspace.
--
--     This function converts an existing surface to a new format and colorspace and returns the new surface. This will perform any pixel format and colorspace conversion needed.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'convertSurface', 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ConvertSurfaceAndColorspace@.
--                   The safe flavor is 'convertSurfaceAndColorspaceSafe'
--                   .
--
--     [C declaration]: @SDL_ConvertSurfaceAndColorspace@, defined at @SDL3\/SDL_surface.h 1149:43@
convertSurfaceAndColorspace
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
convertSurfaceAndColorspace =
  Unsafe.sDL_ConvertSurfaceAndColorspace

-- | Copy an existing surface to a new surface of the specified format and colorspace.
--
--     This function converts an existing surface to a new format and colorspace and returns the new surface. This will perform any pixel format and colorspace conversion needed.
--
--     If the original surface has alternate images, the new surface will have a reference to them as well.
--
--     [Returns]: the new 'SDL_Surface' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'convertSurface', 'destroySurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ConvertSurfaceAndColorspace@.
--                   The unsafe flavor is 'convertSurfaceAndColorspace'
--                   .
--
--     [C declaration]: @SDL_ConvertSurfaceAndColorspace@, defined at @SDL3\/SDL_surface.h 1149:43@
convertSurfaceAndColorspaceSafe
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
convertSurfaceAndColorspaceSafe =
  Safe.sDL_ConvertSurfaceAndColorspace

-- | Copy a block of pixels of one format to another format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     [See also]: 'convertPixelsAndColorspace'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ConvertPixels@.
--                   The safe flavor is 'convertPixelsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ConvertPixels@, defined at @SDL3\/SDL_surface.h 1173:34@
convertPixels
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the block to copy, in pixels.
  -> BG.Int32
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
  -> BG.Int32
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
  -> BG.Int32
  -- ^
  --
  --           [@dst_pitch@]: the pitch of the destination pixels, in bytes.
  -> IO Bool
convertPixels =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                \x77 ->
                  fmap
                    CBool.toBool
                    ( Unsafe.sDL_ConvertPixels
                        (Coerce.coerce x00)
                        (Coerce.coerce x11)
                        x22
                        x33
                        (Coerce.coerce x44)
                        x55
                        x66
                        (Coerce.coerce x77)
                    )

-- | Copy a block of pixels of one format to another format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     [See also]: 'convertPixelsAndColorspace'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ConvertPixels@.
--                   The unsafe flavor is 'convertPixels'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ConvertPixels@, defined at @SDL3\/SDL_surface.h 1173:34@
convertPixelsSafe
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the block to copy, in pixels.
  -> BG.Int32
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
  -> BG.Int32
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
  -> BG.Int32
  -- ^
  --
  --           [@dst_pitch@]: the pitch of the destination pixels, in bytes.
  -> IO Bool
convertPixelsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                \x77 ->
                  fmap
                    CBool.toBool
                    ( Safe.sDL_ConvertPixels
                        (Coerce.coerce x00)
                        (Coerce.coerce x11)
                        x22
                        x33
                        (Coerce.coerce x44)
                        x55
                        x66
                        (Coerce.coerce x77)
                    )

-- | Copy a block of pixels of one format and colorspace to another format and colorspace.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     [See also]: 'convertPixels'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ConvertPixelsAndColorspace@.
--                   The safe flavor is 'convertPixelsAndColorspaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ConvertPixelsAndColorspace@, defined at @SDL3\/SDL_surface.h 1206:34@
convertPixelsAndColorspace
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the block to copy, in pixels.
  -> BG.Int32
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
  -> BG.Int32
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
  -> BG.Int32
  -- ^
  --
  --           [@dst_pitch@]: the pitch of the destination pixels, in bytes.
  -> IO Bool
convertPixelsAndColorspace =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                \x77 ->
                  \x88 ->
                    \x99 ->
                      \x1010 ->
                        \x1111 ->
                          fmap
                            CBool.toBool
                            ( Unsafe.sDL_ConvertPixelsAndColorspace
                                (Coerce.coerce x00)
                                (Coerce.coerce x11)
                                x22
                                x33
                                x44
                                x55
                                (Coerce.coerce x66)
                                x77
                                x88
                                x99
                                x1010
                                (Coerce.coerce x1111)
                            )

-- | Copy a block of pixels of one format and colorspace to another format and colorspace.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     [See also]: 'convertPixels'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ConvertPixelsAndColorspace@.
--                   The unsafe flavor is 'convertPixelsAndColorspace'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ConvertPixelsAndColorspace@, defined at @SDL3\/SDL_surface.h 1206:34@
convertPixelsAndColorspaceSafe
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the block to copy, in pixels.
  -> BG.Int32
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
  -> BG.Int32
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
  -> BG.Int32
  -- ^
  --
  --           [@dst_pitch@]: the pitch of the destination pixels, in bytes.
  -> IO Bool
convertPixelsAndColorspaceSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                \x77 ->
                  \x88 ->
                    \x99 ->
                      \x1010 ->
                        \x1111 ->
                          fmap
                            CBool.toBool
                            ( Safe.sDL_ConvertPixelsAndColorspace
                                (Coerce.coerce x00)
                                (Coerce.coerce x11)
                                x22
                                x33
                                x44
                                x55
                                (Coerce.coerce x66)
                                x77
                                x88
                                x99
                                x1010
                                (Coerce.coerce x1111)
                            )

-- | Premultiply the alpha on a block of pixels.
--
--     This is safe to use with src == dst, but not for other overlapping areas.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PremultiplyAlpha@.
--                   The safe flavor is 'premultiplyAlphaSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PremultiplyAlpha@, defined at @SDL3\/SDL_surface.h 1232:34@
premultiplyAlpha
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the block to convert, in pixels.
  -> BG.Int32
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
  -> BG.Int32
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
  -> BG.Int32
  -- ^
  --
  --           [@dst_pitch@]: the pitch of the destination pixels, in bytes.
  -> Bool
  -- ^
  --
  --           [@linear@]: true to convert from sRGB to linear space for the alpha multiplication, false to do multiplication in sRGB space.
  -> IO Bool
premultiplyAlpha =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                \x77 ->
                  \x88 ->
                    fmap
                      CBool.toBool
                      ( Unsafe.sDL_PremultiplyAlpha
                          (Coerce.coerce x00)
                          (Coerce.coerce x11)
                          x22
                          x33
                          (Coerce.coerce x44)
                          x55
                          x66
                          (Coerce.coerce x77)
                          (CBool.fromBool x88)
                      )

-- | Premultiply the alpha on a block of pixels.
--
--     This is safe to use with src == dst, but not for other overlapping areas.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: The same destination pixels should not be used from two threads at once. It is safe to use the same source pixels from multiple threads.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PremultiplyAlpha@.
--                   The unsafe flavor is 'premultiplyAlpha'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PremultiplyAlpha@, defined at @SDL3\/SDL_surface.h 1232:34@
premultiplyAlphaSafe
  :: BG.Int32
  -- ^
  --
  --           [@width@]: the width of the block to convert, in pixels.
  -> BG.Int32
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
  -> BG.Int32
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
  -> BG.Int32
  -- ^
  --
  --           [@dst_pitch@]: the pitch of the destination pixels, in bytes.
  -> Bool
  -- ^
  --
  --           [@linear@]: true to convert from sRGB to linear space for the alpha multiplication, false to do multiplication in sRGB space.
  -> IO Bool
premultiplyAlphaSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                \x77 ->
                  \x88 ->
                    fmap
                      CBool.toBool
                      ( Safe.sDL_PremultiplyAlpha
                          (Coerce.coerce x00)
                          (Coerce.coerce x11)
                          x22
                          x33
                          (Coerce.coerce x44)
                          x55
                          x66
                          (Coerce.coerce x77)
                          (CBool.fromBool x88)
                      )

-- | Premultiply the alpha in a surface.
--
--     This is safe to use with src == dst, but not for other overlapping areas.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PremultiplySurfaceAlpha@.
--                   The safe flavor is 'premultiplySurfaceAlphaSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PremultiplySurfaceAlpha@, defined at @SDL3\/SDL_surface.h 1250:34@
premultiplySurfaceAlpha
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to modify.
  -> Bool
  -- ^
  --
  --           [@linear@]: true to convert from sRGB to linear space for the alpha multiplication, false to do multiplication in sRGB space.
  -> IO Bool
premultiplySurfaceAlpha =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_PremultiplySurfaceAlpha x00 (CBool.fromBool x11))

-- | Premultiply the alpha in a surface.
--
--     This is safe to use with src == dst, but not for other overlapping areas.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PremultiplySurfaceAlpha@.
--                   The unsafe flavor is 'premultiplySurfaceAlpha'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PremultiplySurfaceAlpha@, defined at @SDL3\/SDL_surface.h 1250:34@
premultiplySurfaceAlphaSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to modify.
  -> Bool
  -- ^
  --
  --           [@linear@]: true to convert from sRGB to linear space for the alpha multiplication, false to do multiplication in sRGB space.
  -> IO Bool
premultiplySurfaceAlphaSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_PremultiplySurfaceAlpha x00 (CBool.fromBool x11))

-- | Clear a surface with a specific color, with floating point precision.
--
--     This function handles all surface formats, and ignores any clip rectangle.
--
--     If the surface is YUV, the color is assumed to be in the sRGB colorspace, otherwise the color is assumed to be in the colorspace of the surface.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ClearSurface@.
--                   The safe flavor is 'clearSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearSurface@, defined at @SDL3\/SDL_surface.h 1273:34@
clearSurface
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' to clear.
  -> Float
  -- ^
  --
  --           [@r@]: the red component of the pixel, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@g@]: the green component of the pixel, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@b@]: the blue component of the pixel, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@a@]: the alpha component of the pixel, normally in the range 0-1.
  -> IO Bool
clearSurface =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              ( Unsafe.sDL_ClearSurface
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

-- | Clear a surface with a specific color, with floating point precision.
--
--     This function handles all surface formats, and ignores any clip rectangle.
--
--     If the surface is YUV, the color is assumed to be in the sRGB colorspace, otherwise the color is assumed to be in the colorspace of the surface.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ClearSurface@.
--                   The unsafe flavor is 'clearSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearSurface@, defined at @SDL3\/SDL_surface.h 1273:34@
clearSurfaceSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the 'SDL_Surface' to clear.
  -> Float
  -- ^
  --
  --           [@r@]: the red component of the pixel, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@g@]: the green component of the pixel, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@b@]: the blue component of the pixel, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@a@]: the alpha component of the pixel, normally in the range 0-1.
  -> IO Bool
clearSurfaceSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              ( Safe.sDL_ClearSurface
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

-- | Perform a fast fill of a rectangle with a specific color.
--
--     @color@ should be a pixel of the format used by the surface, and can be generated by 'SDL3.Sys.Pixels.mapRGB' or 'SDL3.Sys.Pixels.mapRGBA'. If the color value contains an alpha component then the destination is simply filled with that alpha information, no blending takes place.
--
--     If there is a clip rectangle set on the destination (set via @'setSurfaceClipRect'@), then this function will fill based on the intersection of the clip rectangle and @rect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'fillSurfaceRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_FillSurfaceRect@.
--                   The safe flavor is 'fillSurfaceRectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FillSurfaceRect@, defined at @SDL3\/SDL_surface.h 1301:34@
fillSurfaceRect
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the drawing target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure representing the rectangle to fill, or NULL to fill the entire surface.
  -> BG.Word32
  -- ^
  --
  --           [@color@]: the color to fill with.
  -> IO Bool
fillSurfaceRect =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_FillSurfaceRect x00 x11 (Coerce.coerce x22))

-- | Perform a fast fill of a rectangle with a specific color.
--
--     @color@ should be a pixel of the format used by the surface, and can be generated by 'SDL3.Sys.Pixels.mapRGB' or 'SDL3.Sys.Pixels.mapRGBA'. If the color value contains an alpha component then the destination is simply filled with that alpha information, no blending takes place.
--
--     If there is a clip rectangle set on the destination (set via @'setSurfaceClipRect'@), then this function will fill based on the intersection of the clip rectangle and @rect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'fillSurfaceRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FillSurfaceRect@.
--                   The unsafe flavor is 'fillSurfaceRect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FillSurfaceRect@, defined at @SDL3\/SDL_surface.h 1301:34@
fillSurfaceRectSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the drawing target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure representing the rectangle to fill, or NULL to fill the entire surface.
  -> BG.Word32
  -- ^
  --
  --           [@color@]: the color to fill with.
  -> IO Bool
fillSurfaceRectSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_FillSurfaceRect x00 x11 (Coerce.coerce x22))

-- | Perform a fast fill of a set of rectangles with a specific color.
--
--     @color@ should be a pixel of the format used by the surface, and can be generated by 'SDL3.Sys.Pixels.mapRGB' or 'SDL3.Sys.Pixels.mapRGBA'. If the color value contains an alpha component then the destination is simply filled with that alpha information, no blending takes place.
--
--     If there is a clip rectangle set on the destination (set via @'setSurfaceClipRect'@), then this function will fill based on the intersection of the clip rectangle and @rect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'fillSurfaceRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_FillSurfaceRects@.
--                   The safe flavor is 'fillSurfaceRectsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FillSurfaceRects@, defined at @SDL3\/SDL_surface.h 1329:34@
fillSurfaceRects
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the drawing target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rects@]: an array of SDL_Rects representing the rectangles to fill.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of rectangles in the array.
  -> BG.Word32
  -- ^
  --
  --           [@color@]: the color to fill with.
  -> IO Bool
fillSurfaceRects =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_FillSurfaceRects x00 x11 (Coerce.coerce x22) (Coerce.coerce x33))

-- | Perform a fast fill of a set of rectangles with a specific color.
--
--     @color@ should be a pixel of the format used by the surface, and can be generated by 'SDL3.Sys.Pixels.mapRGB' or 'SDL3.Sys.Pixels.mapRGBA'. If the color value contains an alpha component then the destination is simply filled with that alpha information, no blending takes place.
--
--     If there is a clip rectangle set on the destination (set via @'setSurfaceClipRect'@), then this function will fill based on the intersection of the clip rectangle and @rect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     [See also]: 'fillSurfaceRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FillSurfaceRects@.
--                   The unsafe flavor is 'fillSurfaceRects'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FillSurfaceRects@, defined at @SDL3\/SDL_surface.h 1329:34@
fillSurfaceRectsSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@dst@]: the 'SDL_Surface' structure that is the drawing target.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rects@]: an array of SDL_Rects representing the rectangles to fill.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of rectangles in the array.
  -> BG.Word32
  -- ^
  --
  --           [@color@]: the color to fill with.
  -> IO Bool
fillSurfaceRectsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_FillSurfaceRects x00 x11 (Coerce.coerce x22) (Coerce.coerce x33))

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurfaceScaled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BlitSurface@.
--                   The safe flavor is 'blitSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurface@, defined at @SDL3\/SDL_surface.h 1402:34@
blitSurface
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
  --           [@dstrect@]: the SDL_Rect structure representing the x and y position in the destination surface, or NULL for (0,0). The width and height are ignored, and are copied from @srcrect@. If you want a specific width and height, you should use @'blitSurfaceScaled'@.
  -> IO Bool
blitSurface =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_BlitSurface x00 x11 x22 x33)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurfaceScaled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BlitSurface@.
--                   The unsafe flavor is 'blitSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurface@, defined at @SDL3\/SDL_surface.h 1402:34@
blitSurfaceSafe
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
  --           [@dstrect@]: the SDL_Rect structure representing the x and y position in the destination surface, or NULL for (0,0). The width and height are ignored, and are copied from @srcrect@. If you want a specific width and height, you should use @'blitSurfaceScaled'@.
  -> IO Bool
blitSurfaceSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_BlitSurface x00 x11 x22 x33)

-- | Perform low-level surface blitting only.
--
--     This is a semi-private blit function and it performs low-level surface blitting, assuming the input rectangles have already been clipped.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BlitSurfaceUnchecked@.
--                   The safe flavor is 'blitSurfaceUncheckedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceUnchecked@, defined at @SDL3\/SDL_surface.h 1426:34@
blitSurfaceUnchecked
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
  -> IO Bool
blitSurfaceUnchecked =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_BlitSurfaceUnchecked x00 x11 x22 x33)

-- | Perform low-level surface blitting only.
--
--     This is a semi-private blit function and it performs low-level surface blitting, assuming the input rectangles have already been clipped.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BlitSurfaceUnchecked@.
--                   The unsafe flavor is 'blitSurfaceUnchecked'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceUnchecked@, defined at @SDL3\/SDL_surface.h 1426:34@
blitSurfaceUncheckedSafe
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
  -> IO Bool
blitSurfaceUncheckedSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_BlitSurfaceUnchecked x00 x11 x22 x33)

-- | Perform a scaled blit to a destination surface, which may be of a different format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BlitSurfaceScaled@.
--                   The safe flavor is 'blitSurfaceScaledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceScaled@, defined at @SDL3\/SDL_surface.h 1450:34@
blitSurfaceScaled
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
  -> IO Bool
blitSurfaceScaled =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_BlitSurfaceScaled x00 x11 x22 x33 x44)

-- | Perform a scaled blit to a destination surface, which may be of a different format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BlitSurfaceScaled@.
--                   The unsafe flavor is 'blitSurfaceScaled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceScaled@, defined at @SDL3\/SDL_surface.h 1450:34@
blitSurfaceScaledSafe
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
  -> IO Bool
blitSurfaceScaledSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_BlitSurfaceScaled x00 x11 x22 x33 x44)

-- | Perform low-level surface scaled blitting only.
--
--     This is a semi-private function and it performs low-level surface blitting, assuming the input rectangles have already been clipped.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurfaceScaled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BlitSurfaceUncheckedScaled@.
--                   The safe flavor is 'blitSurfaceUncheckedScaledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceUncheckedScaled@, defined at @SDL3\/SDL_surface.h 1475:34@
blitSurfaceUncheckedScaled
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
  -> IO Bool
blitSurfaceUncheckedScaled =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_BlitSurfaceUncheckedScaled x00 x11 x22 x33 x44)

-- | Perform low-level surface scaled blitting only.
--
--     This is a semi-private function and it performs low-level surface blitting, assuming the input rectangles have already been clipped.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurfaceScaled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BlitSurfaceUncheckedScaled@.
--                   The unsafe flavor is 'blitSurfaceUncheckedScaled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceUncheckedScaled@, defined at @SDL3\/SDL_surface.h 1475:34@
blitSurfaceUncheckedScaledSafe
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
  -> IO Bool
blitSurfaceUncheckedScaledSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_BlitSurfaceUncheckedScaled x00 x11 x22 x33 x44)

-- | Perform a stretched pixel copy from one surface to another.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.4.0
--
--     [See also]: 'blitSurfaceScaled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StretchSurface@.
--                   The safe flavor is 'stretchSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StretchSurface@, defined at @SDL3\/SDL_surface.h 1498:34@
stretchSurface
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
  -> IO Bool
stretchSurface =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_StretchSurface x00 x11 x22 x33 x44)

-- | Perform a stretched pixel copy from one surface to another.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.4.0
--
--     [See also]: 'blitSurfaceScaled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_StretchSurface@.
--                   The unsafe flavor is 'stretchSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StretchSurface@, defined at @SDL3\/SDL_surface.h 1498:34@
stretchSurfaceSafe
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
  -> IO Bool
stretchSurfaceSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_StretchSurface x00 x11 x22 x33 x44)

-- | Perform a tiled blit to a destination surface, which may be of a different format.
--
--     The pixels in @srcrect@ will be repeated as many times as needed to completely fill @dstrect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BlitSurfaceTiled@.
--                   The safe flavor is 'blitSurfaceTiledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceTiled@, defined at @SDL3\/SDL_surface.h 1523:34@
blitSurfaceTiled
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
  -> IO Bool
blitSurfaceTiled =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_BlitSurfaceTiled x00 x11 x22 x33)

-- | Perform a tiled blit to a destination surface, which may be of a different format.
--
--     The pixels in @srcrect@ will be repeated as many times as needed to completely fill @dstrect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BlitSurfaceTiled@.
--                   The unsafe flavor is 'blitSurfaceTiled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceTiled@, defined at @SDL3\/SDL_surface.h 1523:34@
blitSurfaceTiledSafe
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
  -> IO Bool
blitSurfaceTiledSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_BlitSurfaceTiled x00 x11 x22 x33)

-- | Perform a scaled and tiled blit to a destination surface, which may be of a different format.
--
--     The pixels in @srcrect@ will be scaled and repeated as many times as needed to completely fill @dstrect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BlitSurfaceTiledWithScale@.
--                   The safe flavor is 'blitSurfaceTiledWithScaleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceTiledWithScale@, defined at @SDL3\/SDL_surface.h 1552:34@
blitSurfaceTiledWithScale
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
  -> Float
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
  -> IO Bool
blitSurfaceTiledWithScale =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Unsafe.sDL_BlitSurfaceTiledWithScale x00 x11 (Coerce.coerce x22) x33 x44 x55)

-- | Perform a scaled and tiled blit to a destination surface, which may be of a different format.
--
--     The pixels in @srcrect@ will be scaled and repeated as many times as needed to completely fill @dstrect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BlitSurfaceTiledWithScale@.
--                   The unsafe flavor is 'blitSurfaceTiledWithScale'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurfaceTiledWithScale@, defined at @SDL3\/SDL_surface.h 1552:34@
blitSurfaceTiledWithScaleSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be copied, or NULL to copy the entire surface.
  -> Float
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
  -> IO Bool
blitSurfaceTiledWithScaleSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Safe.sDL_BlitSurfaceTiledWithScale x00 x11 (Coerce.coerce x22) x33 x44 x55)

-- | Perform a scaled blit using the 9-grid algorithm to a destination surface, which may be of a different format.
--
--     The pixels in the source surface are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then stretched into place to cover the remaining destination rectangle.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BlitSurface9Grid@.
--                   The safe flavor is 'blitSurface9GridSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurface9Grid@, defined at @SDL3\/SDL_surface.h 1588:34@
blitSurface9Grid
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be used for the 9-grid, or NULL to use the entire surface.
  -> BG.Int32
  -- ^
  --
  --           [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
  -> BG.Int32
  -- ^
  --
  --           [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
  -> BG.Int32
  -- ^
  --
  --           [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
  -> BG.Int32
  -- ^
  --
  --           [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
  -> Float
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
  -> IO Bool
blitSurface9Grid =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                \x77 ->
                  \x88 ->
                    \x99 ->
                      fmap
                        CBool.toBool
                        ( Unsafe.sDL_BlitSurface9Grid
                            x00
                            x11
                            (Coerce.coerce x22)
                            (Coerce.coerce x33)
                            (Coerce.coerce x44)
                            (Coerce.coerce x55)
                            (Coerce.coerce x66)
                            x77
                            x88
                            x99
                        )

-- | Perform a scaled blit using the 9-grid algorithm to a destination surface, which may be of a different format.
--
--     The pixels in the source surface are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then stretched into place to cover the remaining destination rectangle.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Only one thread should be using the @src@ and @dst@ surfaces at any given time.
--
--     @since 3.2.0
--
--     [See also]: 'blitSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BlitSurface9Grid@.
--                   The unsafe flavor is 'blitSurface9Grid'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BlitSurface9Grid@, defined at @SDL3\/SDL_surface.h 1588:34@
blitSurface9GridSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@src@]: the 'SDL_Surface' structure to be copied from.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@srcrect@]: the SDL_Rect structure representing the rectangle to be used for the 9-grid, or NULL to use the entire surface.
  -> BG.Int32
  -- ^
  --
  --           [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
  -> BG.Int32
  -- ^
  --
  --           [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
  -> BG.Int32
  -- ^
  --
  --           [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
  -> BG.Int32
  -- ^
  --
  --           [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
  -> Float
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
  -> IO Bool
blitSurface9GridSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                \x77 ->
                  \x88 ->
                    \x99 ->
                      fmap
                        CBool.toBool
                        ( Safe.sDL_BlitSurface9Grid
                            x00
                            x11
                            (Coerce.coerce x22)
                            (Coerce.coerce x33)
                            (Coerce.coerce x44)
                            (Coerce.coerce x55)
                            (Coerce.coerce x66)
                            x77
                            x88
                            x99
                        )

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
--     [See also]: 'mapSurfaceRGBA'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MapSurfaceRGB@.
--                   The safe flavor is 'mapSurfaceRGBSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapSurfaceRGB@, defined at @SDL3\/SDL_surface.h 1621:36@
mapSurfaceRGB
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to use for the pixel format and palette.
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
mapSurfaceRGB =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            Coerce.coerce
            (Unsafe.sDL_MapSurfaceRGB x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

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
--     [See also]: 'mapSurfaceRGBA'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MapSurfaceRGB@.
--                   The unsafe flavor is 'mapSurfaceRGB'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapSurfaceRGB@, defined at @SDL3\/SDL_surface.h 1621:36@
mapSurfaceRGBSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to use for the pixel format and palette.
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
mapSurfaceRGBSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            Coerce.coerce
            (Safe.sDL_MapSurfaceRGB x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

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
--     [See also]: 'mapSurfaceRGB'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MapSurfaceRGBA@.
--                   The safe flavor is 'mapSurfaceRGBASafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapSurfaceRGBA@, defined at @SDL3\/SDL_surface.h 1655:36@
mapSurfaceRGBA
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to use for the pixel format and palette.
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
mapSurfaceRGBA =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              Coerce.coerce
              ( Unsafe.sDL_MapSurfaceRGBA
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

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
--     [See also]: 'mapSurfaceRGB'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MapSurfaceRGBA@.
--                   The unsafe flavor is 'mapSurfaceRGBA'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MapSurfaceRGBA@, defined at @SDL3\/SDL_surface.h 1655:36@
mapSurfaceRGBASafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to use for the pixel format and palette.
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
mapSurfaceRGBASafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              Coerce.coerce
              ( Safe.sDL_MapSurfaceRGBA
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

-- | Retrieves a single pixel from a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     Like 'SDL3.Sys.Pixels.getRGBA', this uses the entire 0..255 range when converting color components from pixel formats with less than 8 bits per RGB component.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadSurfacePixel@.
--                   The safe flavor is 'readSurfacePixelSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadSurfacePixel@, defined at @SDL3\/SDL_surface.h 1685:34@
readSurfacePixel
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to read.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.Int32
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
  -> IO Bool
readSurfacePixel =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  (Unsafe.sDL_ReadSurfacePixel x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44 x55 x66)

-- | Retrieves a single pixel from a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     Like 'SDL3.Sys.Pixels.getRGBA', this uses the entire 0..255 range when converting color components from pixel formats with less than 8 bits per RGB component.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadSurfacePixel@.
--                   The unsafe flavor is 'readSurfacePixel'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadSurfacePixel@, defined at @SDL3\/SDL_surface.h 1685:34@
readSurfacePixelSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to read.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.Int32
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
  -> IO Bool
readSurfacePixelSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  (Safe.sDL_ReadSurfacePixel x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44 x55 x66)

-- | Retrieves a single pixel from a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadSurfacePixelFloat@.
--                   The safe flavor is 'readSurfacePixelFloatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadSurfacePixelFloat@, defined at @SDL3\/SDL_surface.h 1712:34@
readSurfacePixelFloat
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to read.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.Int32
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
  -> IO Bool
readSurfacePixelFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  (Unsafe.sDL_ReadSurfacePixelFloat x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44 x55 x66)

-- | Retrieves a single pixel from a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadSurfacePixelFloat@.
--                   The unsafe flavor is 'readSurfacePixelFloat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadSurfacePixelFloat@, defined at @SDL3\/SDL_surface.h 1712:34@
readSurfacePixelFloatSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to read.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.Int32
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
  -> IO Bool
readSurfacePixelFloatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  (Safe.sDL_ReadSurfacePixelFloat x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44 x55 x66)

-- | Writes a single pixel to a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     Like 'SDL3.Sys.Pixels.mapRGBA', this uses the entire 0..255 range when converting color components from pixel formats with less than 8 bits per RGB component.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteSurfacePixel@.
--                   The safe flavor is 'writeSurfacePixelSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteSurfacePixel@, defined at @SDL3\/SDL_surface.h 1738:34@
writeSurfacePixel
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to write.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.Int32
  -- ^
  --
  --           [@y@]: the vertical coordinate, 0 \<= y \< height.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red channel value, 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green channel value, 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue channel value, 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@a@]: the alpha channel value, 0-255.
  -> IO Bool
writeSurfacePixel =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  ( Unsafe.sDL_WriteSurfacePixel
                      x00
                      (Coerce.coerce x11)
                      (Coerce.coerce x22)
                      (Coerce.coerce x33)
                      (Coerce.coerce x44)
                      (Coerce.coerce x55)
                      (Coerce.coerce x66)
                  )

-- | Writes a single pixel to a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     Like 'SDL3.Sys.Pixels.mapRGBA', this uses the entire 0..255 range when converting color components from pixel formats with less than 8 bits per RGB component.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteSurfacePixel@.
--                   The unsafe flavor is 'writeSurfacePixel'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteSurfacePixel@, defined at @SDL3\/SDL_surface.h 1738:34@
writeSurfacePixelSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to write.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.Int32
  -- ^
  --
  --           [@y@]: the vertical coordinate, 0 \<= y \< height.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red channel value, 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green channel value, 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue channel value, 0-255.
  -> BG.Word8
  -- ^
  --
  --           [@a@]: the alpha channel value, 0-255.
  -> IO Bool
writeSurfacePixelSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  ( Safe.sDL_WriteSurfacePixel
                      x00
                      (Coerce.coerce x11)
                      (Coerce.coerce x22)
                      (Coerce.coerce x33)
                      (Coerce.coerce x44)
                      (Coerce.coerce x55)
                      (Coerce.coerce x66)
                  )

-- | Writes a single pixel to a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteSurfacePixelFloat@.
--                   The safe flavor is 'writeSurfacePixelFloatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteSurfacePixelFloat@, defined at @SDL3\/SDL_surface.h 1761:34@
writeSurfacePixelFloat
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to write.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.Int32
  -- ^
  --
  --           [@y@]: the vertical coordinate, 0 \<= y \< height.
  -> Float
  -- ^
  --
  --           [@r@]: the red channel value, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@g@]: the green channel value, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@b@]: the blue channel value, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@a@]: the alpha channel value, normally in the range 0-1.
  -> IO Bool
writeSurfacePixelFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  ( Unsafe.sDL_WriteSurfacePixelFloat
                      x00
                      (Coerce.coerce x11)
                      (Coerce.coerce x22)
                      (Coerce.coerce x33)
                      (Coerce.coerce x44)
                      (Coerce.coerce x55)
                      (Coerce.coerce x66)
                  )

-- | Writes a single pixel to a surface.
--
--     This function prioritizes correctness over speed: it is suitable for unit tests, but is not intended for use in a game engine.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function can be called on different threads with different surfaces.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteSurfacePixelFloat@.
--                   The unsafe flavor is 'writeSurfacePixelFloat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteSurfacePixelFloat@, defined at @SDL3\/SDL_surface.h 1761:34@
writeSurfacePixelFloatSafe
  :: BG.Ptr SDL_Surface
  -- ^
  --
  --           [@surface@]: the surface to write.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the horizontal coordinate, 0 \<= x \< width.
  -> BG.Int32
  -- ^
  --
  --           [@y@]: the vertical coordinate, 0 \<= y \< height.
  -> Float
  -- ^
  --
  --           [@r@]: the red channel value, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@g@]: the green channel value, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@b@]: the blue channel value, normally in the range 0-1.
  -> Float
  -- ^
  --
  --           [@a@]: the alpha channel value, normally in the range 0-1.
  -> IO Bool
writeSurfacePixelFloatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap
                  CBool.toBool
                  ( Safe.sDL_WriteSurfacePixelFloat
                      x00
                      (Coerce.coerce x11)
                      (Coerce.coerce x22)
                      (Coerce.coerce x33)
                      (Coerce.coerce x44)
                      (Coerce.coerce x55)
                      (Coerce.coerce x66)
                  )

-- | Typed constant for macro @SDL_SURFACE_PREALLOCATED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_SURFACE_PREALLOCATED :: SDL_SurfaceFlags
pattern SDL_SURFACE_PREALLOCATED = SDL_SurfaceFlags 0x00000001

-- | Typed constant for macro @SDL_SURFACE_LOCK_NEEDED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_SURFACE_LOCK_NEEDED :: SDL_SurfaceFlags
pattern SDL_SURFACE_LOCK_NEEDED = SDL_SurfaceFlags 0x00000002

-- | Typed constant for macro @SDL_SURFACE_LOCKED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_SURFACE_LOCKED :: SDL_SurfaceFlags
pattern SDL_SURFACE_LOCKED = SDL_SurfaceFlags 0x00000004

-- | Typed constant for macro @SDL_SURFACE_SIMD_ALIGNED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_SURFACE_SIMD_ALIGNED :: SDL_SurfaceFlags
pattern SDL_SURFACE_SIMD_ALIGNED = SDL_SurfaceFlags 0x00000008
