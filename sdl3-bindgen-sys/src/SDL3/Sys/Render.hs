-- | Header file for SDL 2D rendering functions.
--
--     This API supports the following features:
--
--     * single pixel points
--
--     * single pixel lines
--
--     * filled rectangles
--
--     * texture images
--
--     * 2D polygons
--
--     The primitives may be drawn in opaque, blended, or additive modes.
--
--     The texture images may be drawn in opaque, blended, or additive modes. They can have an additional color tint or alpha modulation applied to them, and may also be stretched with linear interpolation.
--
--     This API is designed to accelerate simple 2D operations. You may want more functionality such as 3D polygons and particle effects, and in that case you should use SDL\'s OpenGL\/Direct3D support, the SDL3 GPU API, or one of the many good 3D engines.
--
--     These functions must be called from the main thread. See this bug for details: [https:\/\/github.com\/libsdl-org\/SDL\/issues\/986](https://github.com/libsdl-org/SDL/issues/986) The name of the software renderer.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Render.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Render (
  module SDL3.Sys.Bindgen.Render,

  -- * Function aliases
  SDL3.Sys.Render.getNumRenderDrivers,
  SDL3.Sys.Render.getNumRenderDriversSafe,
  SDL3.Sys.Render.getRenderDriver,
  SDL3.Sys.Render.getRenderDriverSafe,
  SDL3.Sys.Render.createWindowAndRenderer,
  SDL3.Sys.Render.createWindowAndRendererSafe,
  SDL3.Sys.Render.createRenderer,
  SDL3.Sys.Render.createRendererSafe,
  SDL3.Sys.Render.createRendererWithProperties,
  SDL3.Sys.Render.createRendererWithPropertiesSafe,
  SDL3.Sys.Render.createGPURenderer,
  SDL3.Sys.Render.createGPURendererSafe,
  SDL3.Sys.Render.getGPURendererDevice,
  SDL3.Sys.Render.getGPURendererDeviceSafe,
  SDL3.Sys.Render.createSoftwareRenderer,
  SDL3.Sys.Render.createSoftwareRendererSafe,
  SDL3.Sys.Render.getRenderer,
  SDL3.Sys.Render.getRendererSafe,
  SDL3.Sys.Render.getRenderWindow,
  SDL3.Sys.Render.getRenderWindowSafe,
  SDL3.Sys.Render.getRendererName,
  SDL3.Sys.Render.getRendererNameSafe,
  SDL3.Sys.Render.getRendererProperties,
  SDL3.Sys.Render.getRendererPropertiesSafe,
  SDL3.Sys.Render.getRenderOutputSize,
  SDL3.Sys.Render.getRenderOutputSizeSafe,
  SDL3.Sys.Render.getCurrentRenderOutputSize,
  SDL3.Sys.Render.getCurrentRenderOutputSizeSafe,
  SDL3.Sys.Render.createTexture,
  SDL3.Sys.Render.createTextureSafe,
  SDL3.Sys.Render.createTextureFromSurface,
  SDL3.Sys.Render.createTextureFromSurfaceSafe,
  SDL3.Sys.Render.createTextureWithProperties,
  SDL3.Sys.Render.createTextureWithPropertiesSafe,
  SDL3.Sys.Render.getTextureProperties,
  SDL3.Sys.Render.getTexturePropertiesSafe,
  SDL3.Sys.Render.getRendererFromTexture,
  SDL3.Sys.Render.getRendererFromTextureSafe,
  SDL3.Sys.Render.getTextureSize,
  SDL3.Sys.Render.getTextureSizeSafe,
  SDL3.Sys.Render.setTexturePalette,
  SDL3.Sys.Render.setTexturePaletteSafe,
  SDL3.Sys.Render.getTexturePalette,
  SDL3.Sys.Render.getTexturePaletteSafe,
  SDL3.Sys.Render.setTextureColorMod,
  SDL3.Sys.Render.setTextureColorModSafe,
  SDL3.Sys.Render.setTextureColorModFloat,
  SDL3.Sys.Render.setTextureColorModFloatSafe,
  SDL3.Sys.Render.getTextureColorMod,
  SDL3.Sys.Render.getTextureColorModSafe,
  SDL3.Sys.Render.getTextureColorModFloat,
  SDL3.Sys.Render.getTextureColorModFloatSafe,
  SDL3.Sys.Render.setTextureAlphaMod,
  SDL3.Sys.Render.setTextureAlphaModSafe,
  SDL3.Sys.Render.setTextureAlphaModFloat,
  SDL3.Sys.Render.setTextureAlphaModFloatSafe,
  SDL3.Sys.Render.getTextureAlphaMod,
  SDL3.Sys.Render.getTextureAlphaModSafe,
  SDL3.Sys.Render.getTextureAlphaModFloat,
  SDL3.Sys.Render.getTextureAlphaModFloatSafe,
  SDL3.Sys.Render.setTextureBlendMode,
  SDL3.Sys.Render.setTextureBlendModeSafe,
  SDL3.Sys.Render.getTextureBlendMode,
  SDL3.Sys.Render.getTextureBlendModeSafe,
  SDL3.Sys.Render.setTextureScaleMode,
  SDL3.Sys.Render.setTextureScaleModeSafe,
  SDL3.Sys.Render.getTextureScaleMode,
  SDL3.Sys.Render.getTextureScaleModeSafe,
  SDL3.Sys.Render.updateTexture,
  SDL3.Sys.Render.updateTextureSafe,
  SDL3.Sys.Render.updateYUVTexture,
  SDL3.Sys.Render.updateYUVTextureSafe,
  SDL3.Sys.Render.updateNVTexture,
  SDL3.Sys.Render.updateNVTextureSafe,
  SDL3.Sys.Render.lockTexture,
  SDL3.Sys.Render.lockTextureSafe,
  SDL3.Sys.Render.lockTextureToSurface,
  SDL3.Sys.Render.lockTextureToSurfaceSafe,
  SDL3.Sys.Render.unlockTexture,
  SDL3.Sys.Render.unlockTextureSafe,
  SDL3.Sys.Render.setRenderTarget,
  SDL3.Sys.Render.setRenderTargetSafe,
  SDL3.Sys.Render.getRenderTarget,
  SDL3.Sys.Render.getRenderTargetSafe,
  SDL3.Sys.Render.setRenderLogicalPresentation,
  SDL3.Sys.Render.setRenderLogicalPresentationSafe,
  SDL3.Sys.Render.getRenderLogicalPresentation,
  SDL3.Sys.Render.getRenderLogicalPresentationSafe,
  SDL3.Sys.Render.getRenderLogicalPresentationRect,
  SDL3.Sys.Render.getRenderLogicalPresentationRectSafe,
  SDL3.Sys.Render.renderCoordinatesFromWindow,
  SDL3.Sys.Render.renderCoordinatesFromWindowSafe,
  SDL3.Sys.Render.renderCoordinatesToWindow,
  SDL3.Sys.Render.renderCoordinatesToWindowSafe,
  SDL3.Sys.Render.convertEventToRenderCoordinates,
  SDL3.Sys.Render.convertEventToRenderCoordinatesSafe,
  SDL3.Sys.Render.setRenderViewport,
  SDL3.Sys.Render.setRenderViewportSafe,
  SDL3.Sys.Render.getRenderViewport,
  SDL3.Sys.Render.getRenderViewportSafe,
  SDL3.Sys.Render.renderViewportSet,
  SDL3.Sys.Render.renderViewportSetSafe,
  SDL3.Sys.Render.getRenderSafeArea,
  SDL3.Sys.Render.getRenderSafeAreaSafe,
  SDL3.Sys.Render.setRenderClipRect,
  SDL3.Sys.Render.setRenderClipRectSafe,
  SDL3.Sys.Render.getRenderClipRect,
  SDL3.Sys.Render.getRenderClipRectSafe,
  SDL3.Sys.Render.renderClipEnabled,
  SDL3.Sys.Render.renderClipEnabledSafe,
  SDL3.Sys.Render.setRenderScale,
  SDL3.Sys.Render.setRenderScaleSafe,
  SDL3.Sys.Render.getRenderScale,
  SDL3.Sys.Render.getRenderScaleSafe,
  SDL3.Sys.Render.setRenderDrawColor,
  SDL3.Sys.Render.setRenderDrawColorSafe,
  SDL3.Sys.Render.setRenderDrawColorFloat,
  SDL3.Sys.Render.setRenderDrawColorFloatSafe,
  SDL3.Sys.Render.getRenderDrawColor,
  SDL3.Sys.Render.getRenderDrawColorSafe,
  SDL3.Sys.Render.getRenderDrawColorFloat,
  SDL3.Sys.Render.getRenderDrawColorFloatSafe,
  SDL3.Sys.Render.setRenderColorScale,
  SDL3.Sys.Render.setRenderColorScaleSafe,
  SDL3.Sys.Render.getRenderColorScale,
  SDL3.Sys.Render.getRenderColorScaleSafe,
  SDL3.Sys.Render.setRenderDrawBlendMode,
  SDL3.Sys.Render.setRenderDrawBlendModeSafe,
  SDL3.Sys.Render.getRenderDrawBlendMode,
  SDL3.Sys.Render.getRenderDrawBlendModeSafe,
  SDL3.Sys.Render.renderClear,
  SDL3.Sys.Render.renderClearSafe,
  SDL3.Sys.Render.renderPoint,
  SDL3.Sys.Render.renderPointSafe,
  SDL3.Sys.Render.renderPoints,
  SDL3.Sys.Render.renderPointsSafe,
  SDL3.Sys.Render.renderLine,
  SDL3.Sys.Render.renderLineSafe,
  SDL3.Sys.Render.renderLines,
  SDL3.Sys.Render.renderLinesSafe,
  SDL3.Sys.Render.renderRect,
  SDL3.Sys.Render.renderRectSafe,
  SDL3.Sys.Render.renderRects,
  SDL3.Sys.Render.renderRectsSafe,
  SDL3.Sys.Render.renderFillRect,
  SDL3.Sys.Render.renderFillRectSafe,
  SDL3.Sys.Render.renderFillRects,
  SDL3.Sys.Render.renderFillRectsSafe,
  SDL3.Sys.Render.renderTexture,
  SDL3.Sys.Render.renderTextureSafe,
  SDL3.Sys.Render.renderTextureRotated,
  SDL3.Sys.Render.renderTextureRotatedSafe,
  SDL3.Sys.Render.renderTextureAffine,
  SDL3.Sys.Render.renderTextureAffineSafe,
  SDL3.Sys.Render.renderTextureTiled,
  SDL3.Sys.Render.renderTextureTiledSafe,
  SDL3.Sys.Render.renderTexture9Grid,
  SDL3.Sys.Render.renderTexture9GridSafe,
  SDL3.Sys.Render.renderTexture9GridTiled,
  SDL3.Sys.Render.renderTexture9GridTiledSafe,
  SDL3.Sys.Render.renderGeometry,
  SDL3.Sys.Render.renderGeometrySafe,
  SDL3.Sys.Render.renderGeometryRaw,
  SDL3.Sys.Render.renderGeometryRawSafe,
  SDL3.Sys.Render.setRenderTextureAddressMode,
  SDL3.Sys.Render.setRenderTextureAddressModeSafe,
  SDL3.Sys.Render.getRenderTextureAddressMode,
  SDL3.Sys.Render.getRenderTextureAddressModeSafe,
  SDL3.Sys.Render.renderReadPixels,
  SDL3.Sys.Render.renderReadPixelsSafe,
  SDL3.Sys.Render.renderPresent,
  SDL3.Sys.Render.renderPresentSafe,
  SDL3.Sys.Render.destroyTexture,
  SDL3.Sys.Render.destroyTextureSafe,
  SDL3.Sys.Render.destroyRenderer,
  SDL3.Sys.Render.destroyRendererSafe,
  SDL3.Sys.Render.flushRenderer,
  SDL3.Sys.Render.flushRendererSafe,
  SDL3.Sys.Render.getRenderMetalLayer,
  SDL3.Sys.Render.getRenderMetalLayerSafe,
  SDL3.Sys.Render.getRenderMetalCommandEncoder,
  SDL3.Sys.Render.getRenderMetalCommandEncoderSafe,
  SDL3.Sys.Render.addVulkanRenderSemaphores,
  SDL3.Sys.Render.addVulkanRenderSemaphoresSafe,
  SDL3.Sys.Render.setRenderVSync,
  SDL3.Sys.Render.setRenderVSyncSafe,
  SDL3.Sys.Render.getRenderVSync,
  SDL3.Sys.Render.getRenderVSyncSafe,
  SDL3.Sys.Render.renderDebugText,
  SDL3.Sys.Render.renderDebugTextSafe,
  SDL3.Sys.Render.setDefaultTextureScaleMode,
  SDL3.Sys.Render.setDefaultTextureScaleModeSafe,
  SDL3.Sys.Render.getDefaultTextureScaleMode,
  SDL3.Sys.Render.getDefaultTextureScaleModeSafe,
  SDL3.Sys.Render.createGPURenderState,
  SDL3.Sys.Render.createGPURenderStateSafe,
  SDL3.Sys.Render.setGPURenderStateFragmentUniforms,
  SDL3.Sys.Render.setGPURenderStateFragmentUniformsSafe,
  SDL3.Sys.Render.setGPURenderState,
  SDL3.Sys.Render.setGPURenderStateSafe,
  SDL3.Sys.Render.destroyGPURenderState,
  SDL3.Sys.Render.destroyGPURenderStateSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Blendmode qualified
import SDL3.Sys.Bindgen.Events qualified
import SDL3.Sys.Bindgen.Gpu qualified
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Render
import SDL3.Sys.Bindgen.Render.Safe qualified as Safe
import SDL3.Sys.Bindgen.Render.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified
import SDL3.Sys.Bindgen.Video qualified

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
--     [See also]: 'createRenderer', 'getRenderDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumRenderDrivers@.
--                   The safe flavor is 'getNumRenderDriversSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumRenderDrivers@, defined at @SDL3\/SDL_render.h 192:33@
getNumRenderDrivers :: IO BG.Int32
getNumRenderDrivers =
  fmap Coerce.coerce Unsafe.sDL_GetNumRenderDrivers

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
--     [See also]: 'createRenderer', 'getRenderDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumRenderDrivers@.
--                   The unsafe flavor is 'getNumRenderDrivers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumRenderDrivers@, defined at @SDL3\/SDL_render.h 192:33@
getNumRenderDriversSafe :: IO BG.Int32
getNumRenderDriversSafe =
  fmap Coerce.coerce Safe.sDL_GetNumRenderDrivers

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
--     [See also]: 'getNumRenderDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderDriver@.
--                   The safe flavor is 'getRenderDriverSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderDriver@, defined at @SDL3\/SDL_render.h 216:42@
getRenderDriver
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of the rendering driver; the value ranges from 0 to @'getNumRenderDrivers'@ - 1.
  -> IO (PtrConst.PtrConst BG.CChar)
getRenderDriver =
  \x00 ->
    Unsafe.sDL_GetRenderDriver (Coerce.coerce x00)

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
--     [See also]: 'getNumRenderDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderDriver@.
--                   The unsafe flavor is 'getRenderDriver'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderDriver@, defined at @SDL3\/SDL_render.h 216:42@
getRenderDriverSafe
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of the rendering driver; the value ranges from 0 to @'getNumRenderDrivers'@ - 1.
  -> IO (PtrConst.PtrConst BG.CChar)
getRenderDriverSafe =
  \x00 -> Safe.sDL_GetRenderDriver (Coerce.coerce x00)

-- | Create a window and default renderer.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRenderer', 'SDL3.Sys.Video.createWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateWindowAndRenderer@.
--                   The safe flavor is 'createWindowAndRendererSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateWindowAndRenderer@, defined at @SDL3\/SDL_render.h 238:34@
createWindowAndRenderer
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: the title of the window, in UTF-8 encoding.
  -> BG.Int32
  -- ^
  --
  --           [@width@]: the width of the window.
  -> BG.Int32
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
  -> IO Bool
createWindowAndRenderer =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap
                CBool.toBool
                (Unsafe.sDL_CreateWindowAndRenderer x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44 x55)

-- | Create a window and default renderer.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRenderer', 'SDL3.Sys.Video.createWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateWindowAndRenderer@.
--                   The unsafe flavor is 'createWindowAndRenderer'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateWindowAndRenderer@, defined at @SDL3\/SDL_render.h 238:34@
createWindowAndRendererSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: the title of the window, in UTF-8 encoding.
  -> BG.Int32
  -- ^
  --
  --           [@width@]: the width of the window.
  -> BG.Int32
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
  -> IO Bool
createWindowAndRendererSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap
                CBool.toBool
                (Safe.sDL_CreateWindowAndRenderer x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44 x55)

-- | Create a 2D rendering context for a window.
--
--     If you want a specific renderer, you can specify its name here. A list of available renderers can be obtained by calling @'getRenderDriver'@ multiple times, with indices from 0 to @'getNumRenderDrivers'@ -1. If you don\'t need a specific renderer, specify NULL and SDL will attempt to choose the best option for you, based on what is available on the user\'s system.
--
--     If @name@ is a comma-separated list, SDL will try each name, in the order listed, until one succeeds or all of them fail.
--
--     By default the rendering size matches the window size in pixels, but you can call @'setRenderLogicalPresentation'@ to change the content size and scaling options.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRendererWithProperties', 'createSoftwareRenderer', 'destroyRenderer', 'getNumRenderDrivers', 'getRenderDriver', 'getRendererName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateRenderer@.
--                   The safe flavor is 'createRendererSafe'
--                   .
--
--     [C declaration]: @SDL_CreateRenderer@, defined at @SDL3\/SDL_render.h 273:44@
createRenderer
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window where rendering is displayed.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the rendering driver to initialize, or NULL to let SDL choose one.
  -> IO (BG.Ptr SDL_Renderer)
createRenderer = Unsafe.sDL_CreateRenderer

-- | Create a 2D rendering context for a window.
--
--     If you want a specific renderer, you can specify its name here. A list of available renderers can be obtained by calling @'getRenderDriver'@ multiple times, with indices from 0 to @'getNumRenderDrivers'@ -1. If you don\'t need a specific renderer, specify NULL and SDL will attempt to choose the best option for you, based on what is available on the user\'s system.
--
--     If @name@ is a comma-separated list, SDL will try each name, in the order listed, until one succeeds or all of them fail.
--
--     By default the rendering size matches the window size in pixels, but you can call @'setRenderLogicalPresentation'@ to change the content size and scaling options.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRendererWithProperties', 'createSoftwareRenderer', 'destroyRenderer', 'getNumRenderDrivers', 'getRenderDriver', 'getRendererName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateRenderer@.
--                   The unsafe flavor is 'createRenderer'
--                   .
--
--     [C declaration]: @SDL_CreateRenderer@, defined at @SDL3\/SDL_render.h 273:44@
createRendererSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window where rendering is displayed.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the rendering driver to initialize, or NULL to let SDL choose one.
  -> IO (BG.Ptr SDL_Renderer)
createRendererSafe = Safe.sDL_CreateRenderer

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
--     * @'sDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER'@: non-zero if you want present synchronized with the refresh rate. This property can take any value that is supported by @'setRenderVSync'@ for the renderer.
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
--     [Returns]: a valid rendering context or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Properties.createProperties', 'createRenderer', 'createSoftwareRenderer', 'destroyRenderer', 'getRendererName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateRendererWithProperties@.
--                   The safe flavor is 'createRendererWithPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_CreateRendererWithProperties@, defined at @SDL3\/SDL_render.h 337:44@
createRendererWithProperties
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Renderer)
createRendererWithProperties =
  Unsafe.sDL_CreateRendererWithProperties

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
--     * @'sDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER'@: non-zero if you want present synchronized with the refresh rate. This property can take any value that is supported by @'setRenderVSync'@ for the renderer.
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
--     [Returns]: a valid rendering context or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Properties.createProperties', 'createRenderer', 'createSoftwareRenderer', 'destroyRenderer', 'getRendererName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateRendererWithProperties@.
--                   The unsafe flavor is 'createRendererWithProperties'
--                   .
--
--     [C declaration]: @SDL_CreateRendererWithProperties@, defined at @SDL3\/SDL_render.h 337:44@
createRendererWithPropertiesSafe
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Renderer)
createRendererWithPropertiesSafe =
  Safe.sDL_CreateRendererWithProperties

-- | Create a 2D GPU rendering context.
--
--     The GPU device to use is passed in as a parameter. If this is NULL, then a device will be created normally and can be retrieved using @'getGPURendererDevice'@.
--
--     The window to use is passed in as a parameter. If this is NULL, then this will become an offscreen renderer. In that case, you should call @'setRenderTarget'@ to setup rendering to a texture, and then call @'renderPresent'@ normally to complete drawing a frame.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: If this function is called with a valid GPU device, it should be called on the thread that created the device. If this function is called with a valid window, it should be called on the thread that created the window.
--
--     @since 3.4.0
--
--     [See also]: 'createRendererWithProperties', 'getGPURendererDevice', 'SDL3.Sys.Gpu.createGPUShader', 'createGPURenderState', 'setGPURenderState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPURenderer@.
--                   The safe flavor is 'createGPURendererSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPURenderer@, defined at @SDL3\/SDL_render.h 387:44@
createGPURenderer
  :: BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice
  -- ^
  --
  --           [@device@]: the GPU device to use with the renderer, or NULL to create a device.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window where rendering is displayed, or NULL to create an offscreen renderer.
  -> IO (BG.Ptr SDL_Renderer)
createGPURenderer = Unsafe.sDL_CreateGPURenderer

-- | Create a 2D GPU rendering context.
--
--     The GPU device to use is passed in as a parameter. If this is NULL, then a device will be created normally and can be retrieved using @'getGPURendererDevice'@.
--
--     The window to use is passed in as a parameter. If this is NULL, then this will become an offscreen renderer. In that case, you should call @'setRenderTarget'@ to setup rendering to a texture, and then call @'renderPresent'@ normally to complete drawing a frame.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: If this function is called with a valid GPU device, it should be called on the thread that created the device. If this function is called with a valid window, it should be called on the thread that created the window.
--
--     @since 3.4.0
--
--     [See also]: 'createRendererWithProperties', 'getGPURendererDevice', 'SDL3.Sys.Gpu.createGPUShader', 'createGPURenderState', 'setGPURenderState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPURenderer@.
--                   The unsafe flavor is 'createGPURenderer'
--                   .
--
--     [C declaration]: @SDL_CreateGPURenderer@, defined at @SDL3\/SDL_render.h 387:44@
createGPURendererSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice
  -- ^
  --
  --           [@device@]: the GPU device to use with the renderer, or NULL to create a device.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window where rendering is displayed, or NULL to create an offscreen renderer.
  -> IO (BG.Ptr SDL_Renderer)
createGPURendererSafe = Safe.sDL_CreateGPURenderer

-- | Return the GPU device used by a renderer.
--
--     [Returns]: the GPU device used by the renderer, or NULL if the renderer is not a GPU renderer; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGPURendererDevice@.
--                   The safe flavor is 'getGPURendererDeviceSafe'
--                   .
--
--     [C declaration]: @SDL_GetGPURendererDevice@, defined at @SDL3\/SDL_render.h 400:45@
getGPURendererDevice
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice)
getGPURendererDevice =
  Unsafe.sDL_GetGPURendererDevice

-- | Return the GPU device used by a renderer.
--
--     [Returns]: the GPU device used by the renderer, or NULL if the renderer is not a GPU renderer; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGPURendererDevice@.
--                   The unsafe flavor is 'getGPURendererDevice'
--                   .
--
--     [C declaration]: @SDL_GetGPURendererDevice@, defined at @SDL3\/SDL_render.h 400:45@
getGPURendererDeviceSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Gpu.SDL_GPUDevice)
getGPURendererDeviceSafe =
  Safe.sDL_GetGPURendererDevice

-- | Create a 2D software rendering context for a surface.
--
--     Two other API which can be used to create 'SDL_Renderer': @'createRenderer'@ and @'createWindowAndRenderer'@. These can /also/ create a software renderer, but they are intended to be used with an SDL_Window as the final destination and not an SDL_Surface.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyRenderer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateSoftwareRenderer@.
--                   The safe flavor is 'createSoftwareRendererSafe'
--                   .
--
--     [C declaration]: @SDL_CreateSoftwareRenderer@, defined at @SDL3\/SDL_render.h 421:44@
createSoftwareRenderer
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: the SDL_Surface structure representing the surface where rendering is done.
  -> IO (BG.Ptr SDL_Renderer)
createSoftwareRenderer =
  Unsafe.sDL_CreateSoftwareRenderer

-- | Create a 2D software rendering context for a surface.
--
--     Two other API which can be used to create 'SDL_Renderer': @'createRenderer'@ and @'createWindowAndRenderer'@. These can /also/ create a software renderer, but they are intended to be used with an SDL_Window as the final destination and not an SDL_Surface.
--
--     [Returns]: a valid rendering context or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyRenderer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateSoftwareRenderer@.
--                   The unsafe flavor is 'createSoftwareRenderer'
--                   .
--
--     [C declaration]: @SDL_CreateSoftwareRenderer@, defined at @SDL3\/SDL_render.h 421:44@
createSoftwareRendererSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: the SDL_Surface structure representing the surface where rendering is done.
  -> IO (BG.Ptr SDL_Renderer)
createSoftwareRendererSafe =
  Safe.sDL_CreateSoftwareRenderer

-- | Get the renderer associated with a window.
--
--     [Returns]: the rendering context on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderer@.
--                   The safe flavor is 'getRendererSafe'
--                   .
--
--     [C declaration]: @SDL_GetRenderer@, defined at @SDL3\/SDL_render.h 434:44@
getRenderer
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (BG.Ptr SDL_Renderer)
getRenderer = Unsafe.sDL_GetRenderer

-- | Get the renderer associated with a window.
--
--     [Returns]: the rendering context on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderer@.
--                   The unsafe flavor is 'getRenderer'
--                   .
--
--     [C declaration]: @SDL_GetRenderer@, defined at @SDL3\/SDL_render.h 434:44@
getRendererSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (BG.Ptr SDL_Renderer)
getRendererSafe = Safe.sDL_GetRenderer

-- | Get the window associated with a renderer.
--
--     [Returns]: the window on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderWindow@.
--                   The safe flavor is 'getRenderWindowSafe'
--                   .
--
--     [C declaration]: @SDL_GetRenderWindow@, defined at @SDL3\/SDL_render.h 447:42@
getRenderWindow
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
getRenderWindow = Unsafe.sDL_GetRenderWindow

-- | Get the window associated with a renderer.
--
--     [Returns]: the window on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderWindow@.
--                   The unsafe flavor is 'getRenderWindow'
--                   .
--
--     [C declaration]: @SDL_GetRenderWindow@, defined at @SDL3\/SDL_render.h 447:42@
getRenderWindowSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
getRenderWindowSafe = Safe.sDL_GetRenderWindow

-- | Get the name of a renderer.
--
--     [Returns]: the name of the selected renderer, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRenderer', 'createRendererWithProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRendererName@.
--                   The safe flavor is 'getRendererNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetRendererName@, defined at @SDL3\/SDL_render.h 463:42@
getRendererName
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO (PtrConst.PtrConst BG.CChar)
getRendererName = Unsafe.sDL_GetRendererName

-- | Get the name of a renderer.
--
--     [Returns]: the name of the selected renderer, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRenderer', 'createRendererWithProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRendererName@.
--                   The unsafe flavor is 'getRendererName'
--                   .
--
--     [C declaration]: @SDL_GetRendererName@, defined at @SDL3\/SDL_render.h 463:42@
getRendererNameSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO (PtrConst.PtrConst BG.CChar)
getRendererNameSafe = Safe.sDL_GetRendererName

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
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRendererProperties@.
--                   The safe flavor is 'getRendererPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetRendererProperties@, defined at @SDL3\/SDL_render.h 551:46@
getRendererProperties
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getRendererProperties =
  Unsafe.sDL_GetRendererProperties

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
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRendererProperties@.
--                   The unsafe flavor is 'getRendererProperties'
--                   .
--
--     [C declaration]: @SDL_GetRendererProperties@, defined at @SDL3\/SDL_render.h 551:46@
getRendererPropertiesSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getRendererPropertiesSafe =
  Safe.sDL_GetRendererProperties

-- | Get the output size in pixels of a rendering context.
--
--     This returns the true output size in pixels, ignoring any render targets or logical size and presentation.
--
--     For the output size of the current rendering target, with logical size adjustments, use @'getCurrentRenderOutputSize'@ instead.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCurrentRenderOutputSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderOutputSize@.
--                   The safe flavor is 'getRenderOutputSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderOutputSize@, defined at @SDL3\/SDL_render.h 600:34@
getRenderOutputSize
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
  -> IO Bool
getRenderOutputSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetRenderOutputSize x00 x11 x22)

-- | Get the output size in pixels of a rendering context.
--
--     This returns the true output size in pixels, ignoring any render targets or logical size and presentation.
--
--     For the output size of the current rendering target, with logical size adjustments, use @'getCurrentRenderOutputSize'@ instead.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCurrentRenderOutputSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderOutputSize@.
--                   The unsafe flavor is 'getRenderOutputSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderOutputSize@, defined at @SDL3\/SDL_render.h 600:34@
getRenderOutputSizeSafe
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
  -> IO Bool
getRenderOutputSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetRenderOutputSize x00 x11 x22)

-- | Get the current output size in pixels of a rendering context.
--
--     If a rendering target is active, this will return the size of the rendering target in pixels, otherwise return the value of @'getRenderOutputSize'@.
--
--     Rendering target or not, the output will be adjusted by the current logical presentation state, dictated by @'setRenderLogicalPresentation'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderOutputSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCurrentRenderOutputSize@.
--                   The safe flavor is 'getCurrentRenderOutputSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCurrentRenderOutputSize@, defined at @SDL3\/SDL_render.h 623:34@
getCurrentRenderOutputSize
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
  -> IO Bool
getCurrentRenderOutputSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetCurrentRenderOutputSize x00 x11 x22)

-- | Get the current output size in pixels of a rendering context.
--
--     If a rendering target is active, this will return the size of the rendering target in pixels, otherwise return the value of @'getRenderOutputSize'@.
--
--     Rendering target or not, the output will be adjusted by the current logical presentation state, dictated by @'setRenderLogicalPresentation'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderOutputSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCurrentRenderOutputSize@.
--                   The unsafe flavor is 'getCurrentRenderOutputSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetCurrentRenderOutputSize@, defined at @SDL3\/SDL_render.h 623:34@
getCurrentRenderOutputSizeSafe
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
  -> IO Bool
getCurrentRenderOutputSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetCurrentRenderOutputSize x00 x11 x22)

-- | Create a texture for a rendering context.
--
--     The contents of a texture when first created are not defined.
--
--     [Returns]: the created texture or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createTextureFromSurface', 'createTextureWithProperties', 'destroyTexture', 'getTextureSize', 'updateTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateTexture@.
--                   The safe flavor is 'createTextureSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateTexture@, defined at @SDL3\/SDL_render.h 648:43@
createTexture
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
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the texture in pixels.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the texture in pixels.
  -> IO (BG.Ptr SDL_Texture)
createTexture =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Unsafe.sDL_CreateTexture x00 x11 x22 (Coerce.coerce x33) (Coerce.coerce x44)

-- | Create a texture for a rendering context.
--
--     The contents of a texture when first created are not defined.
--
--     [Returns]: the created texture or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createTextureFromSurface', 'createTextureWithProperties', 'destroyTexture', 'getTextureSize', 'updateTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateTexture@.
--                   The unsafe flavor is 'createTexture'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateTexture@, defined at @SDL3\/SDL_render.h 648:43@
createTextureSafe
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
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the texture in pixels.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the texture in pixels.
  -> IO (BG.Ptr SDL_Texture)
createTextureSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Safe.sDL_CreateTexture x00 x11 x22 (Coerce.coerce x33) (Coerce.coerce x44)

-- | Create a texture from an existing surface.
--
--     The surface is not modified or freed by this function.
--
--     The 'SDL_TextureAccess' hint for the created texture is @SDL_TEXTUREACCESS_STATIC@.
--
--     The pixel format of the created texture may be different from the pixel format of the surface, and can be queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
--
--     [Returns]: the created texture or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createTexture', 'createTextureWithProperties', 'destroyTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateTextureFromSurface@.
--                   The safe flavor is 'createTextureFromSurfaceSafe'
--                   .
--
--     [C declaration]: @SDL_CreateTextureFromSurface@, defined at @SDL3\/SDL_render.h 676:43@
createTextureFromSurface
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: the SDL_Surface structure containing pixel data used to fill the texture.
  -> IO (BG.Ptr SDL_Texture)
createTextureFromSurface =
  Unsafe.sDL_CreateTextureFromSurface

-- | Create a texture from an existing surface.
--
--     The surface is not modified or freed by this function.
--
--     The 'SDL_TextureAccess' hint for the created texture is @SDL_TEXTUREACCESS_STATIC@.
--
--     The pixel format of the created texture may be different from the pixel format of the surface, and can be queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
--
--     [Returns]: the created texture or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createTexture', 'createTextureWithProperties', 'destroyTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateTextureFromSurface@.
--                   The unsafe flavor is 'createTextureFromSurface'
--                   .
--
--     [C declaration]: @SDL_CreateTextureFromSurface@, defined at @SDL3\/SDL_render.h 676:43@
createTextureFromSurfaceSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: the SDL_Surface structure containing pixel data used to fill the texture.
  -> IO (BG.Ptr SDL_Texture)
createTextureFromSurfaceSafe =
  Safe.sDL_CreateTextureFromSurface

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
--     * @'sDL_PROP_TEXTURE_CREATE_PALETTE_POINTER'@: an SDL_Palette to use with palettized texture formats. This can be set later with @'setTexturePalette'@
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
--     [Returns]: the created texture or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Properties.createProperties', 'createTexture', 'createTextureFromSurface', 'destroyTexture', 'getTextureSize', 'updateTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateTextureWithProperties@.
--                   The safe flavor is 'createTextureWithPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_CreateTextureWithProperties@, defined at @SDL3\/SDL_render.h 806:43@
createTextureWithProperties
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Texture)
createTextureWithProperties =
  Unsafe.sDL_CreateTextureWithProperties

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
--     * @'sDL_PROP_TEXTURE_CREATE_PALETTE_POINTER'@: an SDL_Palette to use with palettized texture formats. This can be set later with @'setTexturePalette'@
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
--     [Returns]: the created texture or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Properties.createProperties', 'createTexture', 'createTextureFromSurface', 'destroyTexture', 'getTextureSize', 'updateTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateTextureWithProperties@.
--                   The unsafe flavor is 'createTextureWithProperties'
--                   .
--
--     [C declaration]: @SDL_CreateTextureWithProperties@, defined at @SDL3\/SDL_render.h 806:43@
createTextureWithPropertiesSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Texture)
createTextureWithPropertiesSafe =
  Safe.sDL_CreateTextureWithProperties

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
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTextureProperties@.
--                   The safe flavor is 'getTexturePropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetTextureProperties@, defined at @SDL3\/SDL_render.h 935:46@
getTextureProperties
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getTextureProperties =
  Unsafe.sDL_GetTextureProperties

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
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTextureProperties@.
--                   The unsafe flavor is 'getTextureProperties'
--                   .
--
--     [C declaration]: @SDL_GetTextureProperties@, defined at @SDL3\/SDL_render.h 935:46@
getTexturePropertiesSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getTexturePropertiesSafe =
  Safe.sDL_GetTextureProperties

-- | Get the renderer that created an 'SDL_Texture'.
--
--     [Returns]: a pointer to the 'SDL_Renderer' that created the texture, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRendererFromTexture@.
--                   The safe flavor is 'getRendererFromTextureSafe'
--                   .
--
--     [C declaration]: @SDL_GetRendererFromTexture@, defined at @SDL3\/SDL_render.h 979:44@
getRendererFromTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> IO (BG.Ptr SDL_Renderer)
getRendererFromTexture =
  Unsafe.sDL_GetRendererFromTexture

-- | Get the renderer that created an 'SDL_Texture'.
--
--     [Returns]: a pointer to the 'SDL_Renderer' that created the texture, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRendererFromTexture@.
--                   The unsafe flavor is 'getRendererFromTexture'
--                   .
--
--     [C declaration]: @SDL_GetRendererFromTexture@, defined at @SDL3\/SDL_render.h 979:44@
getRendererFromTextureSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> IO (BG.Ptr SDL_Renderer)
getRendererFromTextureSafe =
  Safe.sDL_GetRendererFromTexture

-- | Get the size of a texture, as floating point values.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTextureSize@.
--                   The safe flavor is 'getTextureSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureSize@, defined at @SDL3\/SDL_render.h 996:34@
getTextureSize
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
  -> IO Bool
getTextureSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetTextureSize x00 x11 x22)

-- | Get the size of a texture, as floating point values.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTextureSize@.
--                   The unsafe flavor is 'getTextureSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureSize@, defined at @SDL3\/SDL_render.h 996:34@
getTextureSizeSafe
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
  -> IO Bool
getTextureSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetTextureSize x00 x11 x22)

-- | Set the palette used by a texture.
--
--     Setting the palette keeps an internal reference to the palette, which can be safely destroyed afterwards.
--
--     A single palette can be shared with many textures.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'SDL3.Sys.Pixels.createPalette', 'getTexturePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTexturePalette@.
--                   The safe flavor is 'setTexturePaletteSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTexturePalette@, defined at @SDL3\/SDL_render.h 1018:34@
setTexturePalette
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -- ^
  --
  --           [@palette@]: the SDL_Palette structure to use.
  -> IO Bool
setTexturePalette =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetTexturePalette x00 x11)

-- | Set the palette used by a texture.
--
--     Setting the palette keeps an internal reference to the palette, which can be safely destroyed afterwards.
--
--     A single palette can be shared with many textures.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'SDL3.Sys.Pixels.createPalette', 'getTexturePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTexturePalette@.
--                   The unsafe flavor is 'setTexturePalette'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTexturePalette@, defined at @SDL3\/SDL_render.h 1018:34@
setTexturePaletteSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette
  -- ^
  --
  --           [@palette@]: the SDL_Palette structure to use.
  -> IO Bool
setTexturePaletteSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetTexturePalette x00 x11)

-- | Get the palette used by a texture.
--
--     [Returns]: a pointer to the palette used by the texture, or NULL if there is no palette used.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'setTexturePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTexturePalette@.
--                   The safe flavor is 'getTexturePaletteSafe'
--                   .
--
--     [C declaration]: @SDL_GetTexturePalette@, defined at @SDL3\/SDL_render.h 1033:43@
getTexturePalette
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
getTexturePalette = Unsafe.sDL_GetTexturePalette

-- | Get the palette used by a texture.
--
--     [Returns]: a pointer to the palette used by the texture, or NULL if there is no palette used.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'setTexturePalette'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTexturePalette@.
--                   The unsafe flavor is 'getTexturePalette'
--                   .
--
--     [C declaration]: @SDL_GetTexturePalette@, defined at @SDL3\/SDL_render.h 1033:43@
getTexturePaletteSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Pixels.SDL_Palette)
getTexturePaletteSafe = Safe.sDL_GetTexturePalette

-- | Set an additional color value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * (color \/ 255)@
--
--     Color modulation is not always supported by the renderer; it will return false if color modulation is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureColorMod', 'setTextureAlphaMod', 'setTextureColorModFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTextureColorMod@.
--                   The safe flavor is 'setTextureColorModSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureColorMod@, defined at @SDL3\/SDL_render.h 1062:34@
setTextureColorMod
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red color value multiplied into copy operations.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green color value multiplied into copy operations.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue color value multiplied into copy operations.
  -> IO Bool
setTextureColorMod =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_SetTextureColorMod x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Set an additional color value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * (color \/ 255)@
--
--     Color modulation is not always supported by the renderer; it will return false if color modulation is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureColorMod', 'setTextureAlphaMod', 'setTextureColorModFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTextureColorMod@.
--                   The unsafe flavor is 'setTextureColorMod'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureColorMod@, defined at @SDL3\/SDL_render.h 1062:34@
setTextureColorModSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red color value multiplied into copy operations.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green color value multiplied into copy operations.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue color value multiplied into copy operations.
  -> IO Bool
setTextureColorModSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_SetTextureColorMod x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Set an additional color value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * color@
--
--     Color modulation is not always supported by the renderer; it will return false if color modulation is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureColorModFloat', 'setTextureAlphaModFloat', 'setTextureColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTextureColorModFloat@.
--                   The safe flavor is 'setTextureColorModFloatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureColorModFloat@, defined at @SDL3\/SDL_render.h 1092:34@
setTextureColorModFloat
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> Float
  -- ^
  --
  --           [@r@]: the red color value multiplied into copy operations.
  -> Float
  -- ^
  --
  --           [@g@]: the green color value multiplied into copy operations.
  -> Float
  -- ^
  --
  --           [@b@]: the blue color value multiplied into copy operations.
  -> IO Bool
setTextureColorModFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_SetTextureColorModFloat x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Set an additional color value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation each source color channel is modulated by the appropriate color value according to the following formula:
--
--     @srcC = srcC * color@
--
--     Color modulation is not always supported by the renderer; it will return false if color modulation is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureColorModFloat', 'setTextureAlphaModFloat', 'setTextureColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTextureColorModFloat@.
--                   The unsafe flavor is 'setTextureColorModFloat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureColorModFloat@, defined at @SDL3\/SDL_render.h 1092:34@
setTextureColorModFloatSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> Float
  -- ^
  --
  --           [@r@]: the red color value multiplied into copy operations.
  -> Float
  -- ^
  --
  --           [@g@]: the green color value multiplied into copy operations.
  -> Float
  -- ^
  --
  --           [@b@]: the blue color value multiplied into copy operations.
  -> IO Bool
setTextureColorModFloatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_SetTextureColorModFloat x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Get the additional color value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaMod', 'getTextureColorModFloat', 'setTextureColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTextureColorMod@.
--                   The safe flavor is 'getTextureColorModSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureColorMod@, defined at @SDL3\/SDL_render.h 1113:34@
getTextureColorMod
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
  -> IO Bool
getTextureColorMod =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_GetTextureColorMod x00 x11 x22 x33)

-- | Get the additional color value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaMod', 'getTextureColorModFloat', 'setTextureColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTextureColorMod@.
--                   The unsafe flavor is 'getTextureColorMod'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureColorMod@, defined at @SDL3\/SDL_render.h 1113:34@
getTextureColorModSafe
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
  -> IO Bool
getTextureColorModSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_GetTextureColorMod x00 x11 x22 x33)

-- | Get the additional color value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaModFloat', 'getTextureColorMod', 'setTextureColorModFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTextureColorModFloat@.
--                   The safe flavor is 'getTextureColorModFloatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureColorModFloat@, defined at @SDL3\/SDL_render.h 1133:34@
getTextureColorModFloat
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
  -> IO Bool
getTextureColorModFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_GetTextureColorModFloat x00 x11 x22 x33)

-- | Get the additional color value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaModFloat', 'getTextureColorMod', 'setTextureColorModFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTextureColorModFloat@.
--                   The unsafe flavor is 'getTextureColorModFloat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureColorModFloat@, defined at @SDL3\/SDL_render.h 1133:34@
getTextureColorModFloatSafe
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
  -> IO Bool
getTextureColorModFloatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_GetTextureColorModFloat x00 x11 x22 x33)

-- | Set an additional alpha value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * (alpha \/ 255)@
--
--     Alpha modulation is not always supported by the renderer; it will return false if alpha modulation is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaMod', 'setTextureAlphaModFloat', 'setTextureColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTextureAlphaMod@.
--                   The safe flavor is 'setTextureAlphaModSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureAlphaMod@, defined at @SDL3\/SDL_render.h 1159:34@
setTextureAlphaMod
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> BG.Word8
  -- ^
  --
  --           [@alpha@]: the source alpha value multiplied into copy operations.
  -> IO Bool
setTextureAlphaMod =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetTextureAlphaMod x00 (Coerce.coerce x11))

-- | Set an additional alpha value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * (alpha \/ 255)@
--
--     Alpha modulation is not always supported by the renderer; it will return false if alpha modulation is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaMod', 'setTextureAlphaModFloat', 'setTextureColorMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTextureAlphaMod@.
--                   The unsafe flavor is 'setTextureAlphaMod'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureAlphaMod@, defined at @SDL3\/SDL_render.h 1159:34@
setTextureAlphaModSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> BG.Word8
  -- ^
  --
  --           [@alpha@]: the source alpha value multiplied into copy operations.
  -> IO Bool
setTextureAlphaModSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetTextureAlphaMod x00 (Coerce.coerce x11))

-- | Set an additional alpha value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * alpha@
--
--     Alpha modulation is not always supported by the renderer; it will return false if alpha modulation is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaModFloat', 'setTextureAlphaMod', 'setTextureColorModFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTextureAlphaModFloat@.
--                   The safe flavor is 'setTextureAlphaModFloatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureAlphaModFloat@, defined at @SDL3\/SDL_render.h 1185:34@
setTextureAlphaModFloat
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> Float
  -- ^
  --
  --           [@alpha@]: the source alpha value multiplied into copy operations.
  -> IO Bool
setTextureAlphaModFloat =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetTextureAlphaModFloat x00 (Coerce.coerce x11))

-- | Set an additional alpha value multiplied into render copy operations.
--
--     When this texture is rendered, during the copy operation the source alpha value is modulated by this alpha value according to the following formula:
--
--     @srcA = srcA * alpha@
--
--     Alpha modulation is not always supported by the renderer; it will return false if alpha modulation is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaModFloat', 'setTextureAlphaMod', 'setTextureColorModFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTextureAlphaModFloat@.
--                   The unsafe flavor is 'setTextureAlphaModFloat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureAlphaModFloat@, defined at @SDL3\/SDL_render.h 1185:34@
setTextureAlphaModFloatSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> Float
  -- ^
  --
  --           [@alpha@]: the source alpha value multiplied into copy operations.
  -> IO Bool
setTextureAlphaModFloatSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetTextureAlphaModFloat x00 (Coerce.coerce x11))

-- | Get the additional alpha value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaModFloat', 'getTextureColorMod', 'setTextureAlphaMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTextureAlphaMod@.
--                   The safe flavor is 'getTextureAlphaModSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureAlphaMod@, defined at @SDL3\/SDL_render.h 1203:34@
getTextureAlphaMod
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@alpha@]: a pointer filled in with the current alpha value.
  -> IO Bool
getTextureAlphaMod =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetTextureAlphaMod x00 x11)

-- | Get the additional alpha value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaModFloat', 'getTextureColorMod', 'setTextureAlphaMod'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTextureAlphaMod@.
--                   The unsafe flavor is 'getTextureAlphaMod'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureAlphaMod@, defined at @SDL3\/SDL_render.h 1203:34@
getTextureAlphaModSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@alpha@]: a pointer filled in with the current alpha value.
  -> IO Bool
getTextureAlphaModSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetTextureAlphaMod x00 x11)

-- | Get the additional alpha value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaMod', 'getTextureColorModFloat', 'setTextureAlphaModFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTextureAlphaModFloat@.
--                   The safe flavor is 'getTextureAlphaModFloatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureAlphaModFloat@, defined at @SDL3\/SDL_render.h 1221:34@
getTextureAlphaModFloat
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@alpha@]: a pointer filled in with the current alpha value.
  -> IO Bool
getTextureAlphaModFloat =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetTextureAlphaModFloat x00 x11)

-- | Get the additional alpha value multiplied into render copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureAlphaMod', 'getTextureColorModFloat', 'setTextureAlphaModFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTextureAlphaModFloat@.
--                   The unsafe flavor is 'getTextureAlphaModFloat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureAlphaModFloat@, defined at @SDL3\/SDL_render.h 1221:34@
getTextureAlphaModFloatSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@alpha@]: a pointer filled in with the current alpha value.
  -> IO Bool
getTextureAlphaModFloatSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetTextureAlphaModFloat x00 x11)

-- | Set the blend mode for a texture, used by @'renderTexture'@.
--
--     If the blend mode is not supported, the closest supported mode is chosen and this function returns false.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTextureBlendMode@.
--                   The safe flavor is 'setTextureBlendModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureBlendMode@, defined at @SDL3\/SDL_render.h 1240:34@
setTextureBlendMode
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: the SDL_BlendMode to use for texture blending.
  -> IO Bool
setTextureBlendMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetTextureBlendMode x00 x11)

-- | Set the blend mode for a texture, used by @'renderTexture'@.
--
--     If the blend mode is not supported, the closest supported mode is chosen and this function returns false.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTextureBlendMode@.
--                   The unsafe flavor is 'setTextureBlendMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureBlendMode@, defined at @SDL3\/SDL_render.h 1240:34@
setTextureBlendModeSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: the SDL_BlendMode to use for texture blending.
  -> IO Bool
setTextureBlendModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetTextureBlendMode x00 x11)

-- | Get the blend mode used for texture copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextureBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTextureBlendMode@.
--                   The safe flavor is 'getTextureBlendModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureBlendMode@, defined at @SDL3\/SDL_render.h 1256:34@
getTextureBlendMode
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
  -> IO Bool
getTextureBlendMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetTextureBlendMode x00 x11)

-- | Get the blend mode used for texture copy operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextureBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTextureBlendMode@.
--                   The unsafe flavor is 'getTextureBlendMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureBlendMode@, defined at @SDL3\/SDL_render.h 1256:34@
getTextureBlendModeSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
  -> IO Bool
getTextureBlendModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetTextureBlendMode x00 x11)

-- | Set the scale mode used for texture scale operations.
--
--     The default texture scale mode is SDL_SCALEMODE_LINEAR.
--
--     If the scale mode is not supported, the closest supported mode is chosen.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureScaleMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTextureScaleMode@.
--                   The safe flavor is 'setTextureScaleModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureScaleMode@, defined at @SDL3\/SDL_render.h 1276:34@
setTextureScaleMode
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: the SDL_ScaleMode to use for texture scaling.
  -> IO Bool
setTextureScaleMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetTextureScaleMode x00 x11)

-- | Set the scale mode used for texture scale operations.
--
--     The default texture scale mode is SDL_SCALEMODE_LINEAR.
--
--     If the scale mode is not supported, the closest supported mode is chosen.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextureScaleMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTextureScaleMode@.
--                   The unsafe flavor is 'setTextureScaleMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextureScaleMode@, defined at @SDL3\/SDL_render.h 1276:34@
setTextureScaleModeSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to update.
  -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: the SDL_ScaleMode to use for texture scaling.
  -> IO Bool
setTextureScaleModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetTextureScaleMode x00 x11)

-- | Get the scale mode used for texture scale operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextureScaleMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTextureScaleMode@.
--                   The safe flavor is 'getTextureScaleModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureScaleMode@, defined at @SDL3\/SDL_render.h 1292:34@
getTextureScaleMode
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: a pointer filled in with the current scale mode.
  -> IO Bool
getTextureScaleMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetTextureScaleMode x00 x11)

-- | Get the scale mode used for texture scale operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextureScaleMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTextureScaleMode@.
--                   The unsafe flavor is 'getTextureScaleMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextureScaleMode@, defined at @SDL3\/SDL_render.h 1292:34@
getTextureScaleModeSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scaleMode@]: a pointer filled in with the current scale mode.
  -> IO Bool
getTextureScaleModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetTextureScaleMode x00 x11)

-- | Update the given texture rectangle with new pixel data.
--
--     The pixel data must be in the pixel format of the texture, which can be queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
--
--     This is a fairly slow function, intended for use with static textures that do not change often.
--
--     If the texture is intended to be updated often, it is preferred to create the texture as streaming and use the locking functions referenced below. While this function will work with streaming textures, for optimization reasons you may not get the pixels back if you lock the texture afterward.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockTexture', 'unlockTexture', 'updateNVTexture', 'updateYUVTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateTexture@.
--                   The safe flavor is 'updateTextureSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateTexture@, defined at @SDL3\/SDL_render.h 1326:34@
updateTexture
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
  -> BG.Int32
  -- ^
  --
  --           [@pitch@]: the number of bytes in a row of pixel data, including padding between lines.
  -> IO Bool
updateTexture =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_UpdateTexture x00 x11 x22 (Coerce.coerce x33))

-- | Update the given texture rectangle with new pixel data.
--
--     The pixel data must be in the pixel format of the texture, which can be queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
--
--     This is a fairly slow function, intended for use with static textures that do not change often.
--
--     If the texture is intended to be updated often, it is preferred to create the texture as streaming and use the locking functions referenced below. While this function will work with streaming textures, for optimization reasons you may not get the pixels back if you lock the texture afterward.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockTexture', 'unlockTexture', 'updateNVTexture', 'updateYUVTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateTexture@.
--                   The unsafe flavor is 'updateTexture'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateTexture@, defined at @SDL3\/SDL_render.h 1326:34@
updateTextureSafe
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
  -> BG.Int32
  -- ^
  --
  --           [@pitch@]: the number of bytes in a row of pixel data, including padding between lines.
  -> IO Bool
updateTextureSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_UpdateTexture x00 x11 x22 (Coerce.coerce x33))

-- | Update a rectangle within a planar YV12 or IYUV texture with new pixel data.
--
--     You can use @'updateTexture'@ as long as your pixel data is a contiguous block of Y and U\/V planes in the proper order, but this function is available if your pixel data is not contiguous.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'updateNVTexture', 'updateTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateYUVTexture@.
--                   The safe flavor is 'updateYUVTextureSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateYUVTexture@, defined at @SDL3\/SDL_render.h 1358:34@
updateYUVTexture
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
  -> BG.Int32
  -- ^
  --
  --           [@Ypitch@]: the number of bytes between rows of pixel data for the Y plane.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@Uplane@]: the raw pixel data for the U plane.
  -> BG.Int32
  -- ^
  --
  --           [@Upitch@]: the number of bytes between rows of pixel data for the U plane.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@Vplane@]: the raw pixel data for the V plane.
  -> BG.Int32
  -- ^
  --
  --           [@Vpitch@]: the number of bytes between rows of pixel data for the V plane.
  -> IO Bool
updateYUVTexture =
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
                    ( Unsafe.sDL_UpdateYUVTexture
                        x00
                        x11
                        x22
                        (Coerce.coerce x33)
                        x44
                        (Coerce.coerce x55)
                        x66
                        (Coerce.coerce x77)
                    )

-- | Update a rectangle within a planar YV12 or IYUV texture with new pixel data.
--
--     You can use @'updateTexture'@ as long as your pixel data is a contiguous block of Y and U\/V planes in the proper order, but this function is available if your pixel data is not contiguous.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'updateNVTexture', 'updateTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateYUVTexture@.
--                   The unsafe flavor is 'updateYUVTexture'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateYUVTexture@, defined at @SDL3\/SDL_render.h 1358:34@
updateYUVTextureSafe
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
  -> BG.Int32
  -- ^
  --
  --           [@Ypitch@]: the number of bytes between rows of pixel data for the Y plane.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@Uplane@]: the raw pixel data for the U plane.
  -> BG.Int32
  -- ^
  --
  --           [@Upitch@]: the number of bytes between rows of pixel data for the U plane.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@Vplane@]: the raw pixel data for the V plane.
  -> BG.Int32
  -- ^
  --
  --           [@Vpitch@]: the number of bytes between rows of pixel data for the V plane.
  -> IO Bool
updateYUVTextureSafe =
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
                    ( Safe.sDL_UpdateYUVTexture
                        x00
                        x11
                        x22
                        (Coerce.coerce x33)
                        x44
                        (Coerce.coerce x55)
                        x66
                        (Coerce.coerce x77)
                    )

-- | Update a rectangle within a planar NV12 or NV21 texture with new pixels.
--
--     You can use @'updateTexture'@ as long as your pixel data is a contiguous block of NV12\/21 planes in the proper order, but this function is available if your pixel data is not contiguous.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'updateTexture', 'updateYUVTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateNVTexture@.
--                   The safe flavor is 'updateNVTextureSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateNVTexture@, defined at @SDL3\/SDL_render.h 1390:34@
updateNVTexture
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
  -> BG.Int32
  -- ^
  --
  --           [@Ypitch@]: the number of bytes between rows of pixel data for the Y plane.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@UVplane@]: the raw pixel data for the UV plane.
  -> BG.Int32
  -- ^
  --
  --           [@UVpitch@]: the number of bytes between rows of pixel data for the UV plane.
  -> IO Bool
updateNVTexture =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap
                CBool.toBool
                (Unsafe.sDL_UpdateNVTexture x00 x11 x22 (Coerce.coerce x33) x44 (Coerce.coerce x55))

-- | Update a rectangle within a planar NV12 or NV21 texture with new pixels.
--
--     You can use @'updateTexture'@ as long as your pixel data is a contiguous block of NV12\/21 planes in the proper order, but this function is available if your pixel data is not contiguous.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'updateTexture', 'updateYUVTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateNVTexture@.
--                   The unsafe flavor is 'updateNVTexture'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateNVTexture@, defined at @SDL3\/SDL_render.h 1390:34@
updateNVTextureSafe
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
  -> BG.Int32
  -- ^
  --
  --           [@Ypitch@]: the number of bytes between rows of pixel data for the Y plane.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@UVplane@]: the raw pixel data for the UV plane.
  -> BG.Int32
  -- ^
  --
  --           [@UVpitch@]: the number of bytes between rows of pixel data for the UV plane.
  -> IO Bool
updateNVTextureSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Safe.sDL_UpdateNVTexture x00 x11 x22 (Coerce.coerce x33) x44 (Coerce.coerce x55))

-- | Lock a portion of the texture for __write-only__ pixel access.
--
--     As an optimization, the pixels made available for editing don\'t necessarily contain the old texture data. This is a write-only operation, and if you need to keep a copy of the texture data you should do that at the application level.
--
--     You must use @'unlockTexture'@ to unlock the pixels and apply any changes.
--
--     [Returns]: true on success or false if the texture is not valid or was not created with @SDL_TEXTUREACCESS_STREAMING@; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockTextureToSurface', 'unlockTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockTexture@.
--                   The safe flavor is 'lockTextureSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockTexture@, defined at @SDL3\/SDL_render.h 1425:34@
lockTexture
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
  -> IO Bool
lockTexture =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_LockTexture x00 x11 x22 x33)

-- | Lock a portion of the texture for __write-only__ pixel access.
--
--     As an optimization, the pixels made available for editing don\'t necessarily contain the old texture data. This is a write-only operation, and if you need to keep a copy of the texture data you should do that at the application level.
--
--     You must use @'unlockTexture'@ to unlock the pixels and apply any changes.
--
--     [Returns]: true on success or false if the texture is not valid or was not created with @SDL_TEXTUREACCESS_STREAMING@; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockTextureToSurface', 'unlockTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockTexture@.
--                   The unsafe flavor is 'lockTexture'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockTexture@, defined at @SDL3\/SDL_render.h 1425:34@
lockTextureSafe
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
  -> IO Bool
lockTextureSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_LockTexture x00 x11 x22 x33)

-- | Lock a portion of the texture for __write-only__ pixel access, and expose it as a SDL surface.
--
--     Besides providing an SDL_Surface instead of raw pixel data, this function operates like 'lockTexture'.
--
--     As an optimization, the pixels made available for editing don\'t necessarily contain the old texture data. This is a write-only operation, and if you need to keep a copy of the texture data you should do that at the application level.
--
--     You must use @'unlockTexture'@ to unlock the pixels and apply any changes.
--
--     The returned surface is freed internally after calling @'unlockTexture'@ or @'destroyTexture'@. The caller should not free it.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockTexture', 'unlockTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockTextureToSurface@.
--                   The safe flavor is 'lockTextureToSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockTextureToSurface@, defined at @SDL3\/SDL_render.h 1463:34@
lockTextureToSurface
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
  -> IO Bool
lockTextureToSurface =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_LockTextureToSurface x00 x11 x22)

-- | Lock a portion of the texture for __write-only__ pixel access, and expose it as a SDL surface.
--
--     Besides providing an SDL_Surface instead of raw pixel data, this function operates like 'lockTexture'.
--
--     As an optimization, the pixels made available for editing don\'t necessarily contain the old texture data. This is a write-only operation, and if you need to keep a copy of the texture data you should do that at the application level.
--
--     You must use @'unlockTexture'@ to unlock the pixels and apply any changes.
--
--     The returned surface is freed internally after calling @'unlockTexture'@ or @'destroyTexture'@. The caller should not free it.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockTexture', 'unlockTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockTextureToSurface@.
--                   The unsafe flavor is 'lockTextureToSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockTextureToSurface@, defined at @SDL3\/SDL_render.h 1463:34@
lockTextureToSurfaceSafe
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
  -> IO Bool
lockTextureToSurfaceSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_LockTextureToSurface x00 x11 x22)

-- | Unlock a texture, uploading the changes to video memory, if needed.
--
--     __Warning__: Please note that @'lockTexture'@ is intended to be write-only; it will not guarantee the previous contents of the texture will be provided. You must fully initialize any area of a texture that you lock before unlocking it, as the pixels might otherwise be uninitialized memory.
--
--     Which is to say: locking and immediately unlocking a texture can result in corrupted textures, depending on the renderer in use.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnlockTexture@.
--                   The safe flavor is 'unlockTextureSafe'
--                   .
--
--     [C declaration]: @SDL_UnlockTexture@, defined at @SDL3\/SDL_render.h 1484:34@
unlockTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: a texture locked by @'lockTexture'@.
  -> IO ()
unlockTexture = Unsafe.sDL_UnlockTexture

-- | Unlock a texture, uploading the changes to video memory, if needed.
--
--     __Warning__: Please note that @'lockTexture'@ is intended to be write-only; it will not guarantee the previous contents of the texture will be provided. You must fully initialize any area of a texture that you lock before unlocking it, as the pixels might otherwise be uninitialized memory.
--
--     Which is to say: locking and immediately unlocking a texture can result in corrupted textures, depending on the renderer in use.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnlockTexture@.
--                   The unsafe flavor is 'unlockTexture'
--                   .
--
--     [C declaration]: @SDL_UnlockTexture@, defined at @SDL3\/SDL_render.h 1484:34@
unlockTextureSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: a texture locked by @'lockTexture'@.
  -> IO ()
unlockTextureSafe = Safe.sDL_UnlockTexture

-- | Set a texture as the current rendering target.
--
--     The default render target is the window for which the renderer was created. To stop rendering to a texture and render to the window again, call this function with a NULL @texture@.
--
--     Viewport, cliprect, scale, and logical presentation are unique to each render target. Get and set functions for these states apply to the current render target set by this function, and those states persist on each target when the current render target changes.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderTarget'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderTarget@.
--                   The safe flavor is 'setRenderTargetSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderTarget@, defined at @SDL3\/SDL_render.h 1511:34@
setRenderTarget
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the targeted texture, which must be created with the @SDL_TEXTUREACCESS_TARGET@ flag, or NULL to render to the window instead of a texture.
  -> IO Bool
setRenderTarget =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetRenderTarget x00 x11)

-- | Set a texture as the current rendering target.
--
--     The default render target is the window for which the renderer was created. To stop rendering to a texture and render to the window again, call this function with a NULL @texture@.
--
--     Viewport, cliprect, scale, and logical presentation are unique to each render target. Get and set functions for these states apply to the current render target set by this function, and those states persist on each target when the current render target changes.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderTarget'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderTarget@.
--                   The unsafe flavor is 'setRenderTarget'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderTarget@, defined at @SDL3\/SDL_render.h 1511:34@
setRenderTargetSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the targeted texture, which must be created with the @SDL_TEXTUREACCESS_TARGET@ flag, or NULL to render to the window instead of a texture.
  -> IO Bool
setRenderTargetSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetRenderTarget x00 x11)

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
--     [See also]: 'setRenderTarget'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderTarget@.
--                   The safe flavor is 'getRenderTargetSafe'
--                   .
--
--     [C declaration]: @SDL_GetRenderTarget@, defined at @SDL3\/SDL_render.h 1528:43@
getRenderTarget
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO (BG.Ptr SDL_Texture)
getRenderTarget = Unsafe.sDL_GetRenderTarget

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
--     [See also]: 'setRenderTarget'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderTarget@.
--                   The unsafe flavor is 'getRenderTarget'
--                   .
--
--     [C declaration]: @SDL_GetRenderTarget@, defined at @SDL3\/SDL_render.h 1528:43@
getRenderTargetSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO (BG.Ptr SDL_Texture)
getRenderTargetSafe = Safe.sDL_GetRenderTarget

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
--     You can convert coordinates in an event into rendering coordinates using @'convertEventToRenderCoordinates'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'convertEventToRenderCoordinates', 'getRenderLogicalPresentation', 'getRenderLogicalPresentationRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderLogicalPresentation@.
--                   The safe flavor is 'setRenderLogicalPresentationSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderLogicalPresentation@, defined at @SDL3\/SDL_render.h 1575:34@
setRenderLogicalPresentation
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the logical resolution.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the logical resolution.
  -> SDL_RendererLogicalPresentation
  -- ^
  --
  --           [@mode@]: the presentation mode used.
  -> IO Bool
setRenderLogicalPresentation =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_SetRenderLogicalPresentation x00 (Coerce.coerce x11) (Coerce.coerce x22) x33)

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
--     You can convert coordinates in an event into rendering coordinates using @'convertEventToRenderCoordinates'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'convertEventToRenderCoordinates', 'getRenderLogicalPresentation', 'getRenderLogicalPresentationRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderLogicalPresentation@.
--                   The unsafe flavor is 'setRenderLogicalPresentation'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderLogicalPresentation@, defined at @SDL3\/SDL_render.h 1575:34@
setRenderLogicalPresentationSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the logical resolution.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the logical resolution.
  -> SDL_RendererLogicalPresentation
  -- ^
  --
  --           [@mode@]: the presentation mode used.
  -> IO Bool
setRenderLogicalPresentationSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_SetRenderLogicalPresentation x00 (Coerce.coerce x11) (Coerce.coerce x22) x33)

-- | Get device independent resolution and presentation mode for rendering.
--
--     This function gets the width and height of the logical rendering output, or 0 if a logical resolution is not enabled.
--
--     Each render target has its own logical presentation state. This function gets the state for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderLogicalPresentation'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderLogicalPresentation@.
--                   The safe flavor is 'getRenderLogicalPresentationSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderLogicalPresentation@, defined at @SDL3\/SDL_render.h 1600:34@
getRenderLogicalPresentation
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
  -> IO Bool
getRenderLogicalPresentation =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_GetRenderLogicalPresentation x00 x11 x22 x33)

-- | Get device independent resolution and presentation mode for rendering.
--
--     This function gets the width and height of the logical rendering output, or 0 if a logical resolution is not enabled.
--
--     Each render target has its own logical presentation state. This function gets the state for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderLogicalPresentation'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderLogicalPresentation@.
--                   The unsafe flavor is 'getRenderLogicalPresentation'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderLogicalPresentation@, defined at @SDL3\/SDL_render.h 1600:34@
getRenderLogicalPresentationSafe
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
  -> IO Bool
getRenderLogicalPresentationSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_GetRenderLogicalPresentation x00 x11 x22 x33)

-- | Get the final presentation rectangle for rendering.
--
--     This function returns the calculated rectangle used for logical presentation, based on the presentation mode and output size. If logical presentation is disabled, it will fill the rectangle with the output size, in pixels.
--
--     Each render target has its own logical presentation state. This function gets the rectangle for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderLogicalPresentation'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderLogicalPresentationRect@.
--                   The safe flavor is 'getRenderLogicalPresentationRectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderLogicalPresentationRect@, defined at @SDL3\/SDL_render.h 1625:34@
getRenderLogicalPresentationRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rect@]: a pointer filled in with the final presentation rectangle, may be NULL.
  -> IO Bool
getRenderLogicalPresentationRect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetRenderLogicalPresentationRect x00 x11)

-- | Get the final presentation rectangle for rendering.
--
--     This function returns the calculated rectangle used for logical presentation, based on the presentation mode and output size. If logical presentation is disabled, it will fill the rectangle with the output size, in pixels.
--
--     Each render target has its own logical presentation state. This function gets the rectangle for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderLogicalPresentation'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderLogicalPresentationRect@.
--                   The unsafe flavor is 'getRenderLogicalPresentationRect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderLogicalPresentationRect@, defined at @SDL3\/SDL_render.h 1625:34@
getRenderLogicalPresentationRectSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rect@]: a pointer filled in with the final presentation rectangle, may be NULL.
  -> IO Bool
getRenderLogicalPresentationRectSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetRenderLogicalPresentationRect x00 x11)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderLogicalPresentation', 'setRenderScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderCoordinatesFromWindow@.
--                   The safe flavor is 'renderCoordinatesFromWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderCoordinatesFromWindow@, defined at @SDL3\/SDL_render.h 1652:34@
renderCoordinatesFromWindow
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@window_x@]: the x coordinate in window coordinates.
  -> Float
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
  -> IO Bool
renderCoordinatesFromWindow =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              (Unsafe.sDL_RenderCoordinatesFromWindow x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderLogicalPresentation', 'setRenderScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderCoordinatesFromWindow@.
--                   The unsafe flavor is 'renderCoordinatesFromWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderCoordinatesFromWindow@, defined at @SDL3\/SDL_render.h 1652:34@
renderCoordinatesFromWindowSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@window_x@]: the x coordinate in window coordinates.
  -> Float
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
  -> IO Bool
renderCoordinatesFromWindowSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              (Safe.sDL_RenderCoordinatesFromWindow x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderLogicalPresentation', 'setRenderScale', 'setRenderViewport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderCoordinatesToWindow@.
--                   The safe flavor is 'renderCoordinatesToWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderCoordinatesToWindow@, defined at @SDL3\/SDL_render.h 1682:34@
renderCoordinatesToWindow
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate in render coordinates.
  -> Float
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
  -> IO Bool
renderCoordinatesToWindow =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              (Unsafe.sDL_RenderCoordinatesToWindow x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderLogicalPresentation', 'setRenderScale', 'setRenderViewport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderCoordinatesToWindow@.
--                   The unsafe flavor is 'renderCoordinatesToWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderCoordinatesToWindow@, defined at @SDL3\/SDL_render.h 1682:34@
renderCoordinatesToWindowSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate in render coordinates.
  -> Float
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
  -> IO Bool
renderCoordinatesToWindowSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              (Safe.sDL_RenderCoordinatesToWindow x00 (Coerce.coerce x11) (Coerce.coerce x22) x33 x44)

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
--     Relative mouse coordinates (xrel and yrel event fields) are /also/ converted. Applications that do not want these fields converted should use @'renderCoordinatesFromWindow'@ on the specific event fields instead of converting the entire event structure.
--
--     Once converted, coordinates may be outside the rendering area.
--
--     [Returns]: true if the event is converted or doesn\'t need conversion, or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderCoordinatesFromWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ConvertEventToRenderCoordinates@.
--                   The safe flavor is 'convertEventToRenderCoordinatesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ConvertEventToRenderCoordinates@, defined at @SDL3\/SDL_render.h 1718:34@
convertEventToRenderCoordinates
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event
  -- ^
  --
  --           [@event@]: the event to modify.
  -> IO Bool
convertEventToRenderCoordinates =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ConvertEventToRenderCoordinates x00 x11)

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
--     Relative mouse coordinates (xrel and yrel event fields) are /also/ converted. Applications that do not want these fields converted should use @'renderCoordinatesFromWindow'@ on the specific event fields instead of converting the entire event structure.
--
--     Once converted, coordinates may be outside the rendering area.
--
--     [Returns]: true if the event is converted or doesn\'t need conversion, or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderCoordinatesFromWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ConvertEventToRenderCoordinates@.
--                   The unsafe flavor is 'convertEventToRenderCoordinates'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ConvertEventToRenderCoordinates@, defined at @SDL3\/SDL_render.h 1718:34@
convertEventToRenderCoordinatesSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event
  -- ^
  --
  --           [@event@]: the event to modify.
  -> IO Bool
convertEventToRenderCoordinatesSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ConvertEventToRenderCoordinates x00 x11)

-- | Set the drawing area for rendering on the current target.
--
--     Drawing will clip to this area (separately from any clipping done with SDL_SetRenderClipRect), and the top left of the area will become coordinate (0, 0) for future drawing commands.
--
--     The area\'s width and height must be >= 0.
--
--     Each render target has its own viewport. This function sets the viewport for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderViewport', 'renderViewportSet'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderViewport@.
--                   The safe flavor is 'setRenderViewportSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderViewport@, defined at @SDL3\/SDL_render.h 1745:34@
setRenderViewport
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure representing the drawing area, or NULL to set the viewport to the entire target.
  -> IO Bool
setRenderViewport =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetRenderViewport x00 x11)

-- | Set the drawing area for rendering on the current target.
--
--     Drawing will clip to this area (separately from any clipping done with SDL_SetRenderClipRect), and the top left of the area will become coordinate (0, 0) for future drawing commands.
--
--     The area\'s width and height must be >= 0.
--
--     Each render target has its own viewport. This function sets the viewport for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderViewport', 'renderViewportSet'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderViewport@.
--                   The unsafe flavor is 'setRenderViewport'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderViewport@, defined at @SDL3\/SDL_render.h 1745:34@
setRenderViewportSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure representing the drawing area, or NULL to set the viewport to the entire target.
  -> IO Bool
setRenderViewportSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetRenderViewport x00 x11)

-- | Get the drawing area for the current target.
--
--     Each render target has its own viewport. This function gets the viewport for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderViewportSet', 'setRenderViewport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderViewport@.
--                   The safe flavor is 'getRenderViewportSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderViewport@, defined at @SDL3\/SDL_render.h 1765:34@
getRenderViewport
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure filled in with the current drawing area.
  -> IO Bool
getRenderViewport =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetRenderViewport x00 x11)

-- | Get the drawing area for the current target.
--
--     Each render target has its own viewport. This function gets the viewport for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderViewportSet', 'setRenderViewport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderViewport@.
--                   The unsafe flavor is 'getRenderViewport'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderViewport@, defined at @SDL3\/SDL_render.h 1765:34@
getRenderViewportSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure filled in with the current drawing area.
  -> IO Bool
getRenderViewportSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetRenderViewport x00 x11)

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
--     [See also]: 'getRenderViewport', 'setRenderViewport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderViewportSet@.
--                   The safe flavor is 'renderViewportSetSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderViewportSet@, defined at @SDL3\/SDL_render.h 1787:34@
renderViewportSet
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
renderViewportSet =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_RenderViewportSet x00)

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
--     [See also]: 'getRenderViewport', 'setRenderViewport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderViewportSet@.
--                   The unsafe flavor is 'renderViewportSet'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderViewportSet@, defined at @SDL3\/SDL_render.h 1787:34@
renderViewportSetSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
renderViewportSetSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_RenderViewportSet x00)

-- | Get the safe area for rendering within the current viewport.
--
--     Some devices have portions of the screen which are partially obscured or not interactive, possibly due to on-screen controls, curved edges, camera notches, TV overscan, etc. This function provides the area of the current viewport which is safe to have interactible content. You should continue rendering into the rest of the render target, but it should not contain visually important or interactible content.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderSafeArea@.
--                   The safe flavor is 'getRenderSafeAreaSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderSafeArea@, defined at @SDL3\/SDL_render.h 1809:34@
getRenderSafeArea
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer filled in with the area that is safe for interactive content.
  -> IO Bool
getRenderSafeArea =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetRenderSafeArea x00 x11)

-- | Get the safe area for rendering within the current viewport.
--
--     Some devices have portions of the screen which are partially obscured or not interactive, possibly due to on-screen controls, curved edges, camera notches, TV overscan, etc. This function provides the area of the current viewport which is safe to have interactible content. You should continue rendering into the rest of the render target, but it should not contain visually important or interactible content.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderSafeArea@.
--                   The unsafe flavor is 'getRenderSafeArea'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderSafeArea@, defined at @SDL3\/SDL_render.h 1809:34@
getRenderSafeAreaSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer filled in with the area that is safe for interactive content.
  -> IO Bool
getRenderSafeAreaSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetRenderSafeArea x00 x11)

-- | Set the clip rectangle for rendering on the specified target.
--
--     Each render target has its own clip rectangle. This function sets the cliprect for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderClipRect', 'renderClipEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderClipRect@.
--                   The safe flavor is 'setRenderClipRectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderClipRect@, defined at @SDL3\/SDL_render.h 1830:34@
setRenderClipRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure representing the clip area, relative to the viewport, or NULL to disable clipping.
  -> IO Bool
setRenderClipRect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetRenderClipRect x00 x11)

-- | Set the clip rectangle for rendering on the specified target.
--
--     Each render target has its own clip rectangle. This function sets the cliprect for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderClipRect', 'renderClipEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderClipRect@.
--                   The unsafe flavor is 'setRenderClipRect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderClipRect@, defined at @SDL3\/SDL_render.h 1830:34@
setRenderClipRectSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure representing the clip area, relative to the viewport, or NULL to disable clipping.
  -> IO Bool
setRenderClipRectSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetRenderClipRect x00 x11)

-- | Get the clip rectangle for the current target.
--
--     Each render target has its own clip rectangle. This function gets the cliprect for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderClipEnabled', 'setRenderClipRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderClipRect@.
--                   The safe flavor is 'getRenderClipRectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderClipRect@, defined at @SDL3\/SDL_render.h 1851:34@
getRenderClipRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure filled in with the current clipping area or an empty rectangle if clipping is disabled.
  -> IO Bool
getRenderClipRect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetRenderClipRect x00 x11)

-- | Get the clip rectangle for the current target.
--
--     Each render target has its own clip rectangle. This function gets the cliprect for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderClipEnabled', 'setRenderClipRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderClipRect@.
--                   The unsafe flavor is 'getRenderClipRect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderClipRect@, defined at @SDL3\/SDL_render.h 1851:34@
getRenderClipRectSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure filled in with the current clipping area or an empty rectangle if clipping is disabled.
  -> IO Bool
getRenderClipRectSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetRenderClipRect x00 x11)

-- | Get whether clipping is enabled on the given render target.
--
--     Each render target has its own clip rectangle. This function checks the cliprect for the current render target.
--
--     [Returns]: true if clipping is enabled or false if not; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderClipRect', 'setRenderClipRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderClipEnabled@.
--                   The safe flavor is 'renderClipEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderClipEnabled@, defined at @SDL3\/SDL_render.h 1870:34@
renderClipEnabled
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
renderClipEnabled =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_RenderClipEnabled x00)

-- | Get whether clipping is enabled on the given render target.
--
--     Each render target has its own clip rectangle. This function checks the cliprect for the current render target.
--
--     [Returns]: true if clipping is enabled or false if not; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderClipRect', 'setRenderClipRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderClipEnabled@.
--                   The unsafe flavor is 'renderClipEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderClipEnabled@, defined at @SDL3\/SDL_render.h 1870:34@
renderClipEnabledSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
renderClipEnabledSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_RenderClipEnabled x00)

-- | Set the drawing scale for rendering on the current target.
--
--     The drawing coordinates are scaled by the x\/y scaling factors before they are used by the renderer. This allows resolution independent drawing with a single coordinate system.
--
--     If this results in scaling or subpixel drawing by the rendering backend, it will be handled using the appropriate quality hints. For best results use integer scaling factors.
--
--     Each render target has its own scale. This function sets the scale for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderScale@.
--                   The safe flavor is 'setRenderScaleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderScale@, defined at @SDL3\/SDL_render.h 1898:34@
setRenderScale
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@scaleX@]: the horizontal scaling factor.
  -> Float
  -- ^
  --
  --           [@scaleY@]: the vertical scaling factor.
  -> IO Bool
setRenderScale =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetRenderScale x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set the drawing scale for rendering on the current target.
--
--     The drawing coordinates are scaled by the x\/y scaling factors before they are used by the renderer. This allows resolution independent drawing with a single coordinate system.
--
--     If this results in scaling or subpixel drawing by the rendering backend, it will be handled using the appropriate quality hints. For best results use integer scaling factors.
--
--     Each render target has its own scale. This function sets the scale for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderScale@.
--                   The unsafe flavor is 'setRenderScale'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderScale@, defined at @SDL3\/SDL_render.h 1898:34@
setRenderScaleSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@scaleX@]: the horizontal scaling factor.
  -> Float
  -- ^
  --
  --           [@scaleY@]: the vertical scaling factor.
  -> IO Bool
setRenderScaleSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetRenderScale x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Get the drawing scale for the current target.
--
--     Each render target has its own scale. This function gets the scale for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderScale@.
--                   The safe flavor is 'getRenderScaleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderScale@, defined at @SDL3\/SDL_render.h 1918:34@
getRenderScale
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
  -> IO Bool
getRenderScale =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetRenderScale x00 x11 x22)

-- | Get the drawing scale for the current target.
--
--     Each render target has its own scale. This function gets the scale for the current render target.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderScale@.
--                   The unsafe flavor is 'getRenderScale'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderScale@, defined at @SDL3\/SDL_render.h 1918:34@
getRenderScaleSafe
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
  -> IO Bool
getRenderScaleSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetRenderScale x00 x11 x22)

-- | Set the color used for drawing operations.
--
--     Set the color for drawing or filling rectangles, lines, and points, and for @'renderClear'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderDrawColor', 'setRenderDrawColorFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderDrawColor@.
--                   The safe flavor is 'setRenderDrawColorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderDrawColor@, defined at @SDL3\/SDL_render.h 1943:34@
setRenderDrawColor
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red value used to draw on the rendering target.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green value used to draw on the rendering target.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue value used to draw on the rendering target.
  -> BG.Word8
  -- ^
  --
  --           [@a@]: the alpha value used to draw on the rendering target; usually @SDL_ALPHA_OPAQUE@ (255). Use 'setRenderDrawBlendMode' to specify how the alpha channel is used.
  -> IO Bool
setRenderDrawColor =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              ( Unsafe.sDL_SetRenderDrawColor
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

-- | Set the color used for drawing operations.
--
--     Set the color for drawing or filling rectangles, lines, and points, and for @'renderClear'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderDrawColor', 'setRenderDrawColorFloat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderDrawColor@.
--                   The unsafe flavor is 'setRenderDrawColor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderDrawColor@, defined at @SDL3\/SDL_render.h 1943:34@
setRenderDrawColorSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Word8
  -- ^
  --
  --           [@r@]: the red value used to draw on the rendering target.
  -> BG.Word8
  -- ^
  --
  --           [@g@]: the green value used to draw on the rendering target.
  -> BG.Word8
  -- ^
  --
  --           [@b@]: the blue value used to draw on the rendering target.
  -> BG.Word8
  -- ^
  --
  --           [@a@]: the alpha value used to draw on the rendering target; usually @SDL_ALPHA_OPAQUE@ (255). Use 'setRenderDrawBlendMode' to specify how the alpha channel is used.
  -> IO Bool
setRenderDrawColorSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              ( Safe.sDL_SetRenderDrawColor
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

-- | Set the color used for drawing operations (Rect, Line and Clear).
--
--     Set the color for drawing or filling rectangles, lines, and points, and for @'renderClear'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderDrawColorFloat', 'setRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderDrawColorFloat@.
--                   The safe flavor is 'setRenderDrawColorFloatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderDrawColorFloat@, defined at @SDL3\/SDL_render.h 1968:34@
setRenderDrawColorFloat
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@r@]: the red value used to draw on the rendering target.
  -> Float
  -- ^
  --
  --           [@g@]: the green value used to draw on the rendering target.
  -> Float
  -- ^
  --
  --           [@b@]: the blue value used to draw on the rendering target.
  -> Float
  -- ^
  --
  --           [@a@]: the alpha value used to draw on the rendering target. Use 'setRenderDrawBlendMode' to specify how the alpha channel is used.
  -> IO Bool
setRenderDrawColorFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              ( Unsafe.sDL_SetRenderDrawColorFloat
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

-- | Set the color used for drawing operations (Rect, Line and Clear).
--
--     Set the color for drawing or filling rectangles, lines, and points, and for @'renderClear'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderDrawColorFloat', 'setRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderDrawColorFloat@.
--                   The unsafe flavor is 'setRenderDrawColorFloat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderDrawColorFloat@, defined at @SDL3\/SDL_render.h 1968:34@
setRenderDrawColorFloatSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@r@]: the red value used to draw on the rendering target.
  -> Float
  -- ^
  --
  --           [@g@]: the green value used to draw on the rendering target.
  -> Float
  -- ^
  --
  --           [@b@]: the blue value used to draw on the rendering target.
  -> Float
  -- ^
  --
  --           [@a@]: the alpha value used to draw on the rendering target. Use 'setRenderDrawBlendMode' to specify how the alpha channel is used.
  -> IO Bool
setRenderDrawColorFloatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              ( Safe.sDL_SetRenderDrawColorFloat
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

-- | Get the color used for drawing operations (Rect, Line and Clear).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderDrawColorFloat', 'setRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderDrawColor@.
--                   The safe flavor is 'getRenderDrawColorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderDrawColor@, defined at @SDL3\/SDL_render.h 1992:34@
getRenderDrawColor
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
  -> IO Bool
getRenderDrawColor =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_GetRenderDrawColor x00 x11 x22 x33 x44)

-- | Get the color used for drawing operations (Rect, Line and Clear).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderDrawColorFloat', 'setRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderDrawColor@.
--                   The unsafe flavor is 'getRenderDrawColor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderDrawColor@, defined at @SDL3\/SDL_render.h 1992:34@
getRenderDrawColorSafe
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
  -> IO Bool
getRenderDrawColorSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_GetRenderDrawColor x00 x11 x22 x33 x44)

-- | Get the color used for drawing operations (Rect, Line and Clear).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderDrawColorFloat', 'getRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderDrawColorFloat@.
--                   The safe flavor is 'getRenderDrawColorFloatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderDrawColorFloat@, defined at @SDL3\/SDL_render.h 2016:34@
getRenderDrawColorFloat
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
  -> IO Bool
getRenderDrawColorFloat =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_GetRenderDrawColorFloat x00 x11 x22 x33 x44)

-- | Get the color used for drawing operations (Rect, Line and Clear).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderDrawColorFloat', 'getRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderDrawColorFloat@.
--                   The unsafe flavor is 'getRenderDrawColorFloat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderDrawColorFloat@, defined at @SDL3\/SDL_render.h 2016:34@
getRenderDrawColorFloatSafe
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
  -> IO Bool
getRenderDrawColorFloatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_GetRenderDrawColorFloat x00 x11 x22 x33 x44)

-- | Set the color scale used for render operations.
--
--     The color scale is an additional scale multiplied into the pixel color value while rendering. This can be used to adjust the brightness of colors during HDR rendering, or changing HDR video brightness when playing on an SDR display.
--
--     The color scale does not affect the alpha channel, only the color brightness.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderColorScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderColorScale@.
--                   The safe flavor is 'setRenderColorScaleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderColorScale@, defined at @SDL3\/SDL_render.h 2040:34@
setRenderColorScale
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@scale@]: the color scale value.
  -> IO Bool
setRenderColorScale =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetRenderColorScale x00 (Coerce.coerce x11))

-- | Set the color scale used for render operations.
--
--     The color scale is an additional scale multiplied into the pixel color value while rendering. This can be used to adjust the brightness of colors during HDR rendering, or changing HDR video brightness when playing on an SDR display.
--
--     The color scale does not affect the alpha channel, only the color brightness.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderColorScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderColorScale@.
--                   The unsafe flavor is 'setRenderColorScale'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderColorScale@, defined at @SDL3\/SDL_render.h 2040:34@
setRenderColorScaleSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> Float
  -- ^
  --
  --           [@scale@]: the color scale value.
  -> IO Bool
setRenderColorScaleSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetRenderColorScale x00 (Coerce.coerce x11))

-- | Get the color scale used for render operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderColorScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderColorScale@.
--                   The safe flavor is 'getRenderColorScaleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderColorScale@, defined at @SDL3\/SDL_render.h 2056:34@
getRenderColorScale
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@scale@]: a pointer filled in with the current color scale value.
  -> IO Bool
getRenderColorScale =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetRenderColorScale x00 x11)

-- | Get the color scale used for render operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderColorScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderColorScale@.
--                   The unsafe flavor is 'getRenderColorScale'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderColorScale@, defined at @SDL3\/SDL_render.h 2056:34@
getRenderColorScaleSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@scale@]: a pointer filled in with the current color scale value.
  -> IO Bool
getRenderColorScaleSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetRenderColorScale x00 x11)

-- | Set the blend mode used for drawing operations (Fill and Line).
--
--     If the blend mode is not supported, the closest supported mode is chosen.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderDrawBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderDrawBlendMode@.
--                   The safe flavor is 'setRenderDrawBlendModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderDrawBlendMode@, defined at @SDL3\/SDL_render.h 2074:34@
setRenderDrawBlendMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: the SDL_BlendMode to use for blending.
  -> IO Bool
setRenderDrawBlendMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetRenderDrawBlendMode x00 x11)

-- | Set the blend mode used for drawing operations (Fill and Line).
--
--     If the blend mode is not supported, the closest supported mode is chosen.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderDrawBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderDrawBlendMode@.
--                   The unsafe flavor is 'setRenderDrawBlendMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderDrawBlendMode@, defined at @SDL3\/SDL_render.h 2074:34@
setRenderDrawBlendModeSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: the SDL_BlendMode to use for blending.
  -> IO Bool
setRenderDrawBlendModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetRenderDrawBlendMode x00 x11)

-- | Get the blend mode used for drawing operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderDrawBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderDrawBlendMode@.
--                   The safe flavor is 'getRenderDrawBlendModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderDrawBlendMode@, defined at @SDL3\/SDL_render.h 2090:34@
getRenderDrawBlendMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
  -> IO Bool
getRenderDrawBlendMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetRenderDrawBlendMode x00 x11)

-- | Get the blend mode used for drawing operations.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderDrawBlendMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderDrawBlendMode@.
--                   The unsafe flavor is 'getRenderDrawBlendMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderDrawBlendMode@, defined at @SDL3\/SDL_render.h 2090:34@
getRenderDrawBlendModeSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode
  -- ^
  --
  --           [@blendMode@]: a pointer filled in with the current SDL_BlendMode.
  -> IO Bool
getRenderDrawBlendModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetRenderDrawBlendMode x00 x11)

-- | Clear the current rendering target with the drawing color.
--
--     This function clears the entire rendering target, ignoring the viewport and the clip rectangle. Note, that clearing will also set\/fill all pixels of the rendering target to current renderer draw color, so make sure to invoke @'setRenderDrawColor'@ when needed.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderClear@.
--                   The safe flavor is 'renderClearSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderClear@, defined at @SDL3\/SDL_render.h 2110:34@
renderClear
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
renderClear =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_RenderClear x00)

-- | Clear the current rendering target with the drawing color.
--
--     This function clears the entire rendering target, ignoring the viewport and the clip rectangle. Note, that clearing will also set\/fill all pixels of the rendering target to current renderer draw color, so make sure to invoke @'setRenderDrawColor'@ when needed.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderClear@.
--                   The unsafe flavor is 'renderClear'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderClear@, defined at @SDL3\/SDL_render.h 2110:34@
renderClearSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
renderClearSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_RenderClear x00)

-- | Draw a point on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderPoints'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderPoint@.
--                   The safe flavor is 'renderPointSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderPoint@, defined at @SDL3\/SDL_render.h 2127:34@
renderPoint
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a point.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate of the point.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate of the point.
  -> IO Bool
renderPoint =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_RenderPoint x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Draw a point on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderPoints'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderPoint@.
--                   The unsafe flavor is 'renderPoint'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderPoint@, defined at @SDL3\/SDL_render.h 2127:34@
renderPointSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a point.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate of the point.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate of the point.
  -> IO Bool
renderPointSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_RenderPoint x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Draw multiple points on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderPoint'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderPoints@.
--                   The safe flavor is 'renderPointsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderPoints@, defined at @SDL3\/SDL_render.h 2144:34@
renderPoints
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw multiple points.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@points@]: the points to draw.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of points to draw.
  -> IO Bool
renderPoints =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_RenderPoints x00 x11 (Coerce.coerce x22))

-- | Draw multiple points on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderPoint'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderPoints@.
--                   The unsafe flavor is 'renderPoints'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderPoints@, defined at @SDL3\/SDL_render.h 2144:34@
renderPointsSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw multiple points.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@points@]: the points to draw.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of points to draw.
  -> IO Bool
renderPointsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_RenderPoints x00 x11 (Coerce.coerce x22))

-- | Draw a line on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderLines'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderLine@.
--                   The safe flavor is 'renderLineSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderLine@, defined at @SDL3\/SDL_render.h 2163:34@
renderLine
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a line.
  -> Float
  -- ^
  --
  --           [@x1@]: the x coordinate of the start point.
  -> Float
  -- ^
  --
  --           [@y1@]: the y coordinate of the start point.
  -> Float
  -- ^
  --
  --           [@x2@]: the x coordinate of the end point.
  -> Float
  -- ^
  --
  --           [@y2@]: the y coordinate of the end point.
  -> IO Bool
renderLine =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              ( Unsafe.sDL_RenderLine
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

-- | Draw a line on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderLines'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderLine@.
--                   The unsafe flavor is 'renderLine'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderLine@, defined at @SDL3\/SDL_render.h 2163:34@
renderLineSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a line.
  -> Float
  -- ^
  --
  --           [@x1@]: the x coordinate of the start point.
  -> Float
  -- ^
  --
  --           [@y1@]: the y coordinate of the start point.
  -> Float
  -- ^
  --
  --           [@x2@]: the x coordinate of the end point.
  -> Float
  -- ^
  --
  --           [@y2@]: the y coordinate of the end point.
  -> IO Bool
renderLineSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap
              CBool.toBool
              ( Safe.sDL_RenderLine
                  x00
                  (Coerce.coerce x11)
                  (Coerce.coerce x22)
                  (Coerce.coerce x33)
                  (Coerce.coerce x44)
              )

-- | Draw a series of connected lines on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderLine'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderLines@.
--                   The safe flavor is 'renderLinesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderLines@, defined at @SDL3\/SDL_render.h 2181:34@
renderLines
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw multiple lines.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@points@]: the points along the lines.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of points, drawing count-1 lines.
  -> IO Bool
renderLines =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_RenderLines x00 x11 (Coerce.coerce x22))

-- | Draw a series of connected lines on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderLine'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderLines@.
--                   The unsafe flavor is 'renderLines'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderLines@, defined at @SDL3\/SDL_render.h 2181:34@
renderLinesSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw multiple lines.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FPoint
  -- ^
  --
  --           [@points@]: the points along the lines.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of points, drawing count-1 lines.
  -> IO Bool
renderLinesSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_RenderLines x00 x11 (Coerce.coerce x22))

-- | Draw a rectangle on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderRect@.
--                   The safe flavor is 'renderRectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderRect@, defined at @SDL3\/SDL_render.h 2198:34@
renderRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a rectangle.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rect@]: a pointer to the destination rectangle, or NULL to outline the entire rendering target.
  -> IO Bool
renderRect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_RenderRect x00 x11)

-- | Draw a rectangle on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderRect@.
--                   The unsafe flavor is 'renderRect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderRect@, defined at @SDL3\/SDL_render.h 2198:34@
renderRectSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a rectangle.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rect@]: a pointer to the destination rectangle, or NULL to outline the entire rendering target.
  -> IO Bool
renderRectSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_RenderRect x00 x11)

-- | Draw some number of rectangles on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderRects@.
--                   The safe flavor is 'renderRectsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderRects@, defined at @SDL3\/SDL_render.h 2216:34@
renderRects
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw multiple rectangles.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rects@]: a pointer to an array of destination rectangles.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of rectangles.
  -> IO Bool
renderRects =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_RenderRects x00 x11 (Coerce.coerce x22))

-- | Draw some number of rectangles on the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderRects@.
--                   The unsafe flavor is 'renderRects'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderRects@, defined at @SDL3\/SDL_render.h 2216:34@
renderRectsSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw multiple rectangles.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rects@]: a pointer to an array of destination rectangles.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of rectangles.
  -> IO Bool
renderRectsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_RenderRects x00 x11 (Coerce.coerce x22))

-- | Fill a rectangle on the current rendering target with the drawing color at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderFillRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderFillRect@.
--                   The safe flavor is 'renderFillRectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderFillRect@, defined at @SDL3\/SDL_render.h 2234:34@
renderFillRect
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should fill a rectangle.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO Bool
renderFillRect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_RenderFillRect x00 x11)

-- | Fill a rectangle on the current rendering target with the drawing color at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderFillRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderFillRect@.
--                   The unsafe flavor is 'renderFillRect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderFillRect@, defined at @SDL3\/SDL_render.h 2234:34@
renderFillRectSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should fill a rectangle.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO Bool
renderFillRectSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_RenderFillRect x00 x11)

-- | Fill some number of rectangles on the current rendering target with the drawing color at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderFillRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderFillRects@.
--                   The safe flavor is 'renderFillRectsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderFillRects@, defined at @SDL3\/SDL_render.h 2252:34@
renderFillRects
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should fill multiple rectangles.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rects@]: a pointer to an array of destination rectangles.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of rectangles.
  -> IO Bool
renderFillRects =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_RenderFillRects x00 x11 (Coerce.coerce x22))

-- | Fill some number of rectangles on the current rendering target with the drawing color at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderFillRect'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderFillRects@.
--                   The unsafe flavor is 'renderFillRects'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderFillRects@, defined at @SDL3\/SDL_render.h 2252:34@
renderFillRectsSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should fill multiple rectangles.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@rects@]: a pointer to an array of destination rectangles.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: the number of rectangles.
  -> IO Bool
renderFillRectsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_RenderFillRects x00 x11 (Coerce.coerce x22))

-- | Copy a portion of the texture to the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTextureRotated', 'renderTextureTiled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderTexture@.
--                   The safe flavor is 'renderTextureSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTexture@, defined at @SDL3\/SDL_render.h 2274:34@
renderTexture
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
  -> IO Bool
renderTexture =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_RenderTexture x00 x11 x22 x33)

-- | Copy a portion of the texture to the current rendering target at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTextureRotated', 'renderTextureTiled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderTexture@.
--                   The unsafe flavor is 'renderTexture'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTexture@, defined at @SDL3\/SDL_render.h 2274:34@
renderTextureSafe
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
  -> IO Bool
renderTextureSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_RenderTexture x00 x11 x22 x33)

-- | Copy a portion of the source texture to the current rendering target, with rotation and flipping, at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderTextureRotated@.
--                   The safe flavor is 'renderTextureRotatedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTextureRotated@, defined at @SDL3\/SDL_render.h 2302:34@
renderTextureRotated
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
  -> Double
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
  -> IO Bool
renderTextureRotated =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap CBool.toBool (Unsafe.sDL_RenderTextureRotated x00 x11 x22 x33 (Coerce.coerce x44) x55 x66)

-- | Copy a portion of the source texture to the current rendering target, with rotation and flipping, at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderTextureRotated@.
--                   The unsafe flavor is 'renderTextureRotated'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTextureRotated@, defined at @SDL3\/SDL_render.h 2302:34@
renderTextureRotatedSafe
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
  -> Double
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
  -> IO Bool
renderTextureRotatedSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                fmap CBool.toBool (Safe.sDL_RenderTextureRotated x00 x11 x22 x33 (Coerce.coerce x44) x55 x66)

-- | Copy a portion of the source texture to the current rendering target, with affine transform, at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: You may only call this function from the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderTextureAffine@.
--                   The safe flavor is 'renderTextureAffineSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTextureAffine@, defined at @SDL3\/SDL_render.h 2333:34@
renderTextureAffine
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
  -> IO Bool
renderTextureAffine =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Unsafe.sDL_RenderTextureAffine x00 x11 x22 x33 x44 x55)

-- | Copy a portion of the source texture to the current rendering target, with affine transform, at subpixel precision.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: You may only call this function from the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderTextureAffine@.
--                   The unsafe flavor is 'renderTextureAffine'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTextureAffine@, defined at @SDL3\/SDL_render.h 2333:34@
renderTextureAffineSafe
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
  -> IO Bool
renderTextureAffineSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Safe.sDL_RenderTextureAffine x00 x11 x22 x33 x44 x55)

-- | Tile a portion of the texture to the current rendering target at subpixel precision.
--
--     The pixels in @srcrect@ will be repeated as many times as needed to completely fill @dstrect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderTextureTiled@.
--                   The safe flavor is 'renderTextureTiledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTextureTiled@, defined at @SDL3\/SDL_render.h 2362:34@
renderTextureTiled
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
  -> Float
  -- ^
  --
  --           [@scale@]: the scale used to transform srcrect into the destination rectangle, e.g. a 32x32 texture with a scale of 2 would fill 64x64 tiles.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO Bool
renderTextureTiled =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_RenderTextureTiled x00 x11 x22 (Coerce.coerce x33) x44)

-- | Tile a portion of the texture to the current rendering target at subpixel precision.
--
--     The pixels in @srcrect@ will be repeated as many times as needed to completely fill @dstrect@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTexture'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderTextureTiled@.
--                   The unsafe flavor is 'renderTextureTiled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTextureTiled@, defined at @SDL3\/SDL_render.h 2362:34@
renderTextureTiledSafe
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
  -> Float
  -- ^
  --
  --           [@scale@]: the scale used to transform srcrect into the destination rectangle, e.g. a 32x32 texture with a scale of 2 would fill 64x64 tiles.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO Bool
renderTextureTiledSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_RenderTextureTiled x00 x11 x22 (Coerce.coerce x33) x44)

-- | Perform a scaled copy using the 9-grid algorithm to the current rendering target at subpixel precision.
--
--     The pixels in the texture are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then stretched into place to cover the remaining destination rectangle.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTexture', 'renderTexture9GridTiled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderTexture9Grid@.
--                   The safe flavor is 'renderTexture9GridSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTexture9Grid@, defined at @SDL3\/SDL_render.h 2397:34@
renderTexture9Grid
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
  -> Float
  -- ^
  --
  --           [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled copy.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO Bool
renderTexture9Grid =
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
                      ( Unsafe.sDL_RenderTexture9Grid
                          x00
                          x11
                          x22
                          (Coerce.coerce x33)
                          (Coerce.coerce x44)
                          (Coerce.coerce x55)
                          (Coerce.coerce x66)
                          (Coerce.coerce x77)
                          x88
                      )

-- | Perform a scaled copy using the 9-grid algorithm to the current rendering target at subpixel precision.
--
--     The pixels in the texture are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then stretched into place to cover the remaining destination rectangle.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderTexture', 'renderTexture9GridTiled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderTexture9Grid@.
--                   The unsafe flavor is 'renderTexture9Grid'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTexture9Grid@, defined at @SDL3\/SDL_render.h 2397:34@
renderTexture9GridSafe
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
  -> Float
  -- ^
  --
  --           [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled copy.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> IO Bool
renderTexture9GridSafe =
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
                      ( Safe.sDL_RenderTexture9Grid
                          x00
                          x11
                          x22
                          (Coerce.coerce x33)
                          (Coerce.coerce x44)
                          (Coerce.coerce x55)
                          (Coerce.coerce x66)
                          (Coerce.coerce x77)
                          x88
                      )

-- | Perform a scaled copy using the 9-grid algorithm to the current rendering target at subpixel precision.
--
--     The pixels in the texture are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then tiled into place to cover the remaining destination rectangle.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'renderTexture', 'renderTexture9Grid'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderTexture9GridTiled@.
--                   The safe flavor is 'renderTexture9GridTiledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTexture9GridTiled@, defined at @SDL3\/SDL_render.h 2435:34@
renderTexture9GridTiled
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
  -> Float
  -- ^
  --
  --           [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled copy.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> Float
  -- ^
  --
  --           [@tileScale@]: the scale used to transform the borders and center of @srcrect@ into the borders and middle of @dstrect@, or 1.0f for an unscaled copy.
  -> IO Bool
renderTexture9GridTiled =
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
                        ( Unsafe.sDL_RenderTexture9GridTiled
                            x00
                            x11
                            x22
                            (Coerce.coerce x33)
                            (Coerce.coerce x44)
                            (Coerce.coerce x55)
                            (Coerce.coerce x66)
                            (Coerce.coerce x77)
                            x88
                            (Coerce.coerce x99)
                        )

-- | Perform a scaled copy using the 9-grid algorithm to the current rendering target at subpixel precision.
--
--     The pixels in the texture are split into a 3x3 grid, using the different corner sizes for each corner, and the sides and center making up the remaining pixels. The corners are then scaled using @scale@ and fit into the corners of the destination rectangle. The sides and center are then tiled into place to cover the remaining destination rectangle.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'renderTexture', 'renderTexture9Grid'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderTexture9GridTiled@.
--                   The unsafe flavor is 'renderTexture9GridTiled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderTexture9GridTiled@, defined at @SDL3\/SDL_render.h 2435:34@
renderTexture9GridTiledSafe
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
  -> Float
  -- ^
  --
  --           [@left_width@]: the width, in pixels, of the left corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@right_width@]: the width, in pixels, of the right corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@top_height@]: the height, in pixels, of the top corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@bottom_height@]: the height, in pixels, of the bottom corners in @srcrect@.
  -> Float
  -- ^
  --
  --           [@scale@]: the scale used to transform the corner of @srcrect@ into the corner of @dstrect@, or 0.0f for an unscaled copy.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_FRect
  -- ^
  --
  --           [@dstrect@]: a pointer to the destination rectangle, or NULL for the entire rendering target.
  -> Float
  -- ^
  --
  --           [@tileScale@]: the scale used to transform the borders and center of @srcrect@ into the borders and middle of @dstrect@, or 1.0f for an unscaled copy.
  -> IO Bool
renderTexture9GridTiledSafe =
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
                        ( Safe.sDL_RenderTexture9GridTiled
                            x00
                            x11
                            x22
                            (Coerce.coerce x33)
                            (Coerce.coerce x44)
                            (Coerce.coerce x55)
                            (Coerce.coerce x66)
                            (Coerce.coerce x77)
                            x88
                            (Coerce.coerce x99)
                        )

-- | Render a list of triangles, optionally using a texture and indices into the vertex array Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and 'setTextureAlphaMod' are ignored).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderGeometryRaw', 'setRenderTextureAddressMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderGeometry@.
--                   The safe flavor is 'renderGeometrySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderGeometry@, defined at @SDL3\/SDL_render.h 2460:34@
renderGeometry
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
  -> BG.Int32
  -- ^
  --
  --           [@num_vertices@]: number of vertices.
  -> PtrConst.PtrConst BG.CInt
  -- ^
  --
  --           [@indices@]: (optional) An array of integer indices into the \'vertices\' array, if NULL all vertices will be rendered in sequential order.
  -> BG.Int32
  -- ^
  --
  --           [@num_indices@]: number of indices.
  -> IO Bool
renderGeometry =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap
                CBool.toBool
                (Unsafe.sDL_RenderGeometry x00 x11 x22 (Coerce.coerce x33) x44 (Coerce.coerce x55))

-- | Render a list of triangles, optionally using a texture and indices into the vertex array Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and 'setTextureAlphaMod' are ignored).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderGeometryRaw', 'setRenderTextureAddressMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderGeometry@.
--                   The unsafe flavor is 'renderGeometry'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderGeometry@, defined at @SDL3\/SDL_render.h 2460:34@
renderGeometrySafe
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
  -> BG.Int32
  -- ^
  --
  --           [@num_vertices@]: number of vertices.
  -> PtrConst.PtrConst BG.CInt
  -- ^
  --
  --           [@indices@]: (optional) An array of integer indices into the \'vertices\' array, if NULL all vertices will be rendered in sequential order.
  -> BG.Int32
  -- ^
  --
  --           [@num_indices@]: number of indices.
  -> IO Bool
renderGeometrySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Safe.sDL_RenderGeometry x00 x11 x22 (Coerce.coerce x33) x44 (Coerce.coerce x55))

-- | Render a list of triangles, optionally using a texture and indices into the vertex arrays Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and 'setTextureAlphaMod' are ignored).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderGeometry', 'setRenderTextureAddressMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderGeometryRaw@.
--                   The safe flavor is 'renderGeometryRawSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderGeometryRaw@, defined at @SDL3\/SDL_render.h 2493:34@
renderGeometryRaw
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
  -> BG.Int32
  -- ^
  --
  --           [@xy_stride@]: byte size to move from one element to the next element.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -- ^
  --
  --           [@color@]: vertex colors (as SDL_FColor).
  -> BG.Int32
  -- ^
  --
  --           [@color_stride@]: byte size to move from one element to the next element.
  -> PtrConst.PtrConst BG.CFloat
  -- ^
  --
  --           [@uv@]: vertex normalized texture coordinates.
  -> BG.Int32
  -- ^
  --
  --           [@uv_stride@]: byte size to move from one element to the next element.
  -> BG.Int32
  -- ^
  --
  --           [@num_vertices@]: number of vertices.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@indices@]: (optional) An array of indices into the \'vertices\' arrays, if NULL all vertices will be rendered in sequential order.
  -> BG.Int32
  -- ^
  --
  --           [@num_indices@]: number of indices.
  -> BG.Int32
  -- ^
  --
  --           [@size_indices@]: index size: 1 (byte), 2 (short), 4 (int).
  -> IO Bool
renderGeometryRaw =
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
                            ( Unsafe.sDL_RenderGeometryRaw
                                x00
                                x11
                                x22
                                (Coerce.coerce x33)
                                x44
                                (Coerce.coerce x55)
                                x66
                                (Coerce.coerce x77)
                                (Coerce.coerce x88)
                                x99
                                (Coerce.coerce x1010)
                                (Coerce.coerce x1111)
                            )

-- | Render a list of triangles, optionally using a texture and indices into the vertex arrays Color and alpha modulation is done per vertex (SDL_SetTextureColorMod and 'setTextureAlphaMod' are ignored).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'renderGeometry', 'setRenderTextureAddressMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderGeometryRaw@.
--                   The unsafe flavor is 'renderGeometryRaw'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderGeometryRaw@, defined at @SDL3\/SDL_render.h 2493:34@
renderGeometryRawSafe
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
  -> BG.Int32
  -- ^
  --
  --           [@xy_stride@]: byte size to move from one element to the next element.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Pixels.SDL_FColor
  -- ^
  --
  --           [@color@]: vertex colors (as SDL_FColor).
  -> BG.Int32
  -- ^
  --
  --           [@color_stride@]: byte size to move from one element to the next element.
  -> PtrConst.PtrConst BG.CFloat
  -- ^
  --
  --           [@uv@]: vertex normalized texture coordinates.
  -> BG.Int32
  -- ^
  --
  --           [@uv_stride@]: byte size to move from one element to the next element.
  -> BG.Int32
  -- ^
  --
  --           [@num_vertices@]: number of vertices.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@indices@]: (optional) An array of indices into the \'vertices\' arrays, if NULL all vertices will be rendered in sequential order.
  -> BG.Int32
  -- ^
  --
  --           [@num_indices@]: number of indices.
  -> BG.Int32
  -- ^
  --
  --           [@size_indices@]: index size: 1 (byte), 2 (short), 4 (int).
  -> IO Bool
renderGeometryRawSafe =
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
                            ( Safe.sDL_RenderGeometryRaw
                                x00
                                x11
                                x22
                                (Coerce.coerce x33)
                                x44
                                (Coerce.coerce x55)
                                x66
                                (Coerce.coerce x77)
                                (Coerce.coerce x88)
                                x99
                                (Coerce.coerce x1010)
                                (Coerce.coerce x1111)
                            )

-- | Set the texture addressing mode used in @'renderGeometry'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'renderGeometry', 'renderGeometryRaw', 'getRenderTextureAddressMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderTextureAddressMode@.
--                   The safe flavor is 'setRenderTextureAddressModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderTextureAddressMode@, defined at @SDL3\/SDL_render.h 2520:34@
setRenderTextureAddressMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL_TextureAddressMode
  -- ^
  --
  --           [@u_mode@]: the 'SDL_TextureAddressMode' to use for horizontal texture coordinates in @'renderGeometry'@.
  -> SDL_TextureAddressMode
  -- ^
  --
  --           [@v_mode@]: the 'SDL_TextureAddressMode' to use for vertical texture coordinates in @'renderGeometry'@.
  -> IO Bool
setRenderTextureAddressMode =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetRenderTextureAddressMode x00 x11 x22)

-- | Set the texture addressing mode used in @'renderGeometry'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'renderGeometry', 'renderGeometryRaw', 'getRenderTextureAddressMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderTextureAddressMode@.
--                   The unsafe flavor is 'setRenderTextureAddressMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderTextureAddressMode@, defined at @SDL3\/SDL_render.h 2520:34@
setRenderTextureAddressModeSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> SDL_TextureAddressMode
  -- ^
  --
  --           [@u_mode@]: the 'SDL_TextureAddressMode' to use for horizontal texture coordinates in @'renderGeometry'@.
  -> SDL_TextureAddressMode
  -- ^
  --
  --           [@v_mode@]: the 'SDL_TextureAddressMode' to use for vertical texture coordinates in @'renderGeometry'@.
  -> IO Bool
setRenderTextureAddressModeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetRenderTextureAddressMode x00 x11 x22)

-- | Get the texture addressing mode used in @'renderGeometry'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'setRenderTextureAddressMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderTextureAddressMode@.
--                   The safe flavor is 'getRenderTextureAddressModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderTextureAddressMode@, defined at @SDL3\/SDL_render.h 2541:34@
getRenderTextureAddressMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL_TextureAddressMode
  -- ^
  --
  --           [@u_mode@]: a pointer filled in with the 'SDL_TextureAddressMode' to use for horizontal texture coordinates in @'renderGeometry'@, may be NULL.
  -> BG.Ptr SDL_TextureAddressMode
  -- ^
  --
  --           [@v_mode@]: a pointer filled in with the 'SDL_TextureAddressMode' to use for vertical texture coordinates in @'renderGeometry'@, may be NULL.
  -> IO Bool
getRenderTextureAddressMode =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetRenderTextureAddressMode x00 x11 x22)

-- | Get the texture addressing mode used in @'renderGeometry'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'setRenderTextureAddressMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderTextureAddressMode@.
--                   The unsafe flavor is 'getRenderTextureAddressMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderTextureAddressMode@, defined at @SDL3\/SDL_render.h 2541:34@
getRenderTextureAddressModeSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Ptr SDL_TextureAddressMode
  -- ^
  --
  --           [@u_mode@]: a pointer filled in with the 'SDL_TextureAddressMode' to use for horizontal texture coordinates in @'renderGeometry'@, may be NULL.
  -> BG.Ptr SDL_TextureAddressMode
  -- ^
  --
  --           [@v_mode@]: a pointer filled in with the 'SDL_TextureAddressMode' to use for vertical texture coordinates in @'renderGeometry'@, may be NULL.
  -> IO Bool
getRenderTextureAddressModeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetRenderTextureAddressMode x00 x11 x22)

-- | Read pixels from the current rendering target.
--
--     The returned surface contains pixels inside the desired area clipped to the current viewport, and should be freed with 'SDL3.Sys.Surface.destroySurface'.
--
--     Note that this returns the actual pixels on the screen, so if you are using logical presentation you should use @'getRenderLogicalPresentationRect'@ to get the area containing your content.
--
--     __WARNING__: This is a very slow operation, and should not be used frequently. If you\'re using this on the main rendering target, it should be called after rendering and before @'renderPresent'@.
--
--     [Returns]: a new SDL_Surface on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderReadPixels@.
--                   The safe flavor is 'renderReadPixelsSafe'
--                   : full GPU sync plus readback; a very slow operation.
--
--     [C declaration]: @SDL_RenderReadPixels@, defined at @SDL3\/SDL_render.h 2568:43@
renderReadPixels
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure representing the area to read, which will be clipped to the current viewport, or NULL for the entire viewport.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
renderReadPixels = Unsafe.sDL_RenderReadPixels

-- | Read pixels from the current rendering target.
--
--     The returned surface contains pixels inside the desired area clipped to the current viewport, and should be freed with 'SDL3.Sys.Surface.destroySurface'.
--
--     Note that this returns the actual pixels on the screen, so if you are using logical presentation you should use @'getRenderLogicalPresentationRect'@ to get the area containing your content.
--
--     __WARNING__: This is a very slow operation, and should not be used frequently. If you\'re using this on the main rendering target, it should be called after rendering and before @'renderPresent'@.
--
--     [Returns]: a new SDL_Surface on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderReadPixels@.
--                   The unsafe flavor is 'renderReadPixels'
--                   : full GPU sync plus readback; a very slow operation.
--
--     [C declaration]: @SDL_RenderReadPixels@, defined at @SDL3\/SDL_render.h 2568:43@
renderReadPixelsSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: an SDL_Rect structure representing the area to read, which will be clipped to the current viewport, or NULL for the entire viewport.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
renderReadPixelsSafe = Safe.sDL_RenderReadPixels

-- | Update the screen with any rendering performed since the previous call.
--
--     SDL\'s rendering functions operate on a backbuffer; that is, calling a rendering function such as @'renderLine'@ does not directly put a line on the screen, but rather updates the backbuffer. As such, you compose your entire scene and /present/ the composed backbuffer to the screen as a complete picture.
--
--     Therefore, when using SDL\'s rendering API, one does all drawing intended for the frame, and then calls this function once per frame to present the final drawing to the user.
--
--     The backbuffer should be considered invalidated after each present; do not assume that previous contents will exist between frames. You are strongly encouraged to call @'renderClear'@ to initialize the backbuffer before starting each new frame\'s drawing, even if you plan to overwrite every pixel.
--
--     Please note, that in case of rendering to a texture - there is __no need__ to call @'renderPresent'@ after drawing needed objects to a texture, and should not be done; you are only required to change back the rendering target to default via @SDL_SetRenderTarget(renderer, NULL)@ afterwards, as textures by themselves do not have a concept of backbuffers. Calling 'renderPresent' while rendering to a texture will fail.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRenderer', 'renderClear', 'renderFillRect', 'renderFillRects', 'renderLine', 'renderLines', 'renderPoint', 'renderPoints', 'renderRect', 'renderRects', 'setRenderDrawBlendMode', 'setRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderPresent@.
--                   The safe flavor is 'renderPresentSafe'
--                   : can block on vsync.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderPresent@, defined at @SDL3\/SDL_render.h 2617:34@
renderPresent
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
renderPresent =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_RenderPresent x00)

-- | Update the screen with any rendering performed since the previous call.
--
--     SDL\'s rendering functions operate on a backbuffer; that is, calling a rendering function such as @'renderLine'@ does not directly put a line on the screen, but rather updates the backbuffer. As such, you compose your entire scene and /present/ the composed backbuffer to the screen as a complete picture.
--
--     Therefore, when using SDL\'s rendering API, one does all drawing intended for the frame, and then calls this function once per frame to present the final drawing to the user.
--
--     The backbuffer should be considered invalidated after each present; do not assume that previous contents will exist between frames. You are strongly encouraged to call @'renderClear'@ to initialize the backbuffer before starting each new frame\'s drawing, even if you plan to overwrite every pixel.
--
--     Please note, that in case of rendering to a texture - there is __no need__ to call @'renderPresent'@ after drawing needed objects to a texture, and should not be done; you are only required to change back the rendering target to default via @SDL_SetRenderTarget(renderer, NULL)@ afterwards, as textures by themselves do not have a concept of backbuffers. Calling 'renderPresent' while rendering to a texture will fail.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRenderer', 'renderClear', 'renderFillRect', 'renderFillRects', 'renderLine', 'renderLines', 'renderPoint', 'renderPoints', 'renderRect', 'renderRects', 'setRenderDrawBlendMode', 'setRenderDrawColor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderPresent@.
--                   The unsafe flavor is 'renderPresent'
--                   : can block on vsync.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderPresent@, defined at @SDL3\/SDL_render.h 2617:34@
renderPresentSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
renderPresentSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_RenderPresent x00)

-- | Destroy the specified texture.
--
--     Passing NULL or an otherwise invalid texture will set the SDL error message to \"Invalid texture\".
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createTexture', 'createTextureFromSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyTexture@.
--                   The safe flavor is 'destroyTextureSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyTexture@, defined at @SDL3\/SDL_render.h 2634:34@
destroyTexture
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to destroy.
  -> IO ()
destroyTexture = Unsafe.sDL_DestroyTexture

-- | Destroy the specified texture.
--
--     Passing NULL or an otherwise invalid texture will set the SDL error message to \"Invalid texture\".
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createTexture', 'createTextureFromSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyTexture@.
--                   The unsafe flavor is 'destroyTexture'
--                   .
--
--     [C declaration]: @SDL_DestroyTexture@, defined at @SDL3\/SDL_render.h 2634:34@
destroyTextureSafe
  :: BG.Ptr SDL_Texture
  -- ^
  --
  --           [@texture@]: the texture to destroy.
  -> IO ()
destroyTextureSafe = Safe.sDL_DestroyTexture

-- | Destroy the rendering context for a window and free all associated textures.
--
--     This should be called before destroying the associated window.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRenderer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyRenderer@.
--                   The safe flavor is 'destroyRendererSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyRenderer@, defined at @SDL3\/SDL_render.h 2650:34@
destroyRenderer
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO ()
destroyRenderer = Unsafe.sDL_DestroyRenderer

-- | Destroy the rendering context for a window and free all associated textures.
--
--     This should be called before destroying the associated window.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRenderer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyRenderer@.
--                   The unsafe flavor is 'destroyRenderer'
--                   .
--
--     [C declaration]: @SDL_DestroyRenderer@, defined at @SDL3\/SDL_render.h 2650:34@
destroyRendererSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO ()
destroyRendererSafe = Safe.sDL_DestroyRenderer

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_FlushRenderer@.
--                   The safe flavor is 'flushRendererSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushRenderer@, defined at @SDL3\/SDL_render.h 2683:34@
flushRenderer
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
flushRenderer =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_FlushRenderer x00)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FlushRenderer@.
--                   The unsafe flavor is 'flushRenderer'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushRenderer@, defined at @SDL3\/SDL_render.h 2683:34@
flushRendererSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> IO Bool
flushRendererSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_FlushRenderer x00)

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
--     [See also]: 'getRenderMetalCommandEncoder'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderMetalLayer@.
--                   The safe flavor is 'getRenderMetalLayerSafe'
--                   .
--
--     [C declaration]: @SDL_GetRenderMetalLayer@, defined at @SDL3\/SDL_render.h 2701:36@
getRenderMetalLayer
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to query.
  -> IO (BG.Ptr BG.Void)
getRenderMetalLayer = Unsafe.sDL_GetRenderMetalLayer

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
--     [See also]: 'getRenderMetalCommandEncoder'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderMetalLayer@.
--                   The unsafe flavor is 'getRenderMetalLayer'
--                   .
--
--     [C declaration]: @SDL_GetRenderMetalLayer@, defined at @SDL3\/SDL_render.h 2701:36@
getRenderMetalLayerSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to query.
  -> IO (BG.Ptr BG.Void)
getRenderMetalLayerSafe =
  Safe.sDL_GetRenderMetalLayer

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
--     [See also]: 'getRenderMetalLayer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderMetalCommandEncoder@.
--                   The safe flavor is 'getRenderMetalCommandEncoderSafe'
--                   .
--
--     [C declaration]: @SDL_GetRenderMetalCommandEncoder@, defined at @SDL3\/SDL_render.h 2724:36@
getRenderMetalCommandEncoder
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to query.
  -> IO (BG.Ptr BG.Void)
getRenderMetalCommandEncoder =
  Unsafe.sDL_GetRenderMetalCommandEncoder

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
--     [See also]: 'getRenderMetalLayer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderMetalCommandEncoder@.
--                   The unsafe flavor is 'getRenderMetalCommandEncoder'
--                   .
--
--     [C declaration]: @SDL_GetRenderMetalCommandEncoder@, defined at @SDL3\/SDL_render.h 2724:36@
getRenderMetalCommandEncoderSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to query.
  -> IO (BG.Ptr BG.Void)
getRenderMetalCommandEncoderSafe =
  Safe.sDL_GetRenderMetalCommandEncoder

-- | Add a set of synchronization semaphores for the current frame.
--
--     The Vulkan renderer will wait for @wait_semaphore@ before submitting rendering commands and signal @signal_semaphore@ after rendering commands are complete for this frame.
--
--     This should be called each frame that you want semaphore synchronization. The Vulkan renderer may have multiple frames in flight on the GPU, so you should have multiple semaphores that are used for synchronization. Querying SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER will give you the maximum number of semaphores you\'ll need.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is __NOT__ safe to call this function from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddVulkanRenderSemaphores@.
--                   The safe flavor is 'addVulkanRenderSemaphoresSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddVulkanRenderSemaphores@, defined at @SDL3\/SDL_render.h 2755:34@
addVulkanRenderSemaphores
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Word32
  -- ^
  --
  --           [@wait_stage_mask@]: the VkPipelineStageFlags for the wait.
  -> BG.Int64
  -- ^
  --
  --           [@wait_semaphore@]: a VkSempahore to wait on before rendering the current frame, or 0 if not needed.
  -> BG.Int64
  -- ^
  --
  --           [@signal_semaphore@]: a VkSempahore that SDL will signal when rendering for the current frame is complete, or 0 if not needed.
  -> IO Bool
addVulkanRenderSemaphores =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_AddVulkanRenderSemaphores x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Add a set of synchronization semaphores for the current frame.
--
--     The Vulkan renderer will wait for @wait_semaphore@ before submitting rendering commands and signal @signal_semaphore@ after rendering commands are complete for this frame.
--
--     This should be called each frame that you want semaphore synchronization. The Vulkan renderer may have multiple frames in flight on the GPU, so you should have multiple semaphores that are used for synchronization. Querying SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER will give you the maximum number of semaphores you\'ll need.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is __NOT__ safe to call this function from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddVulkanRenderSemaphores@.
--                   The unsafe flavor is 'addVulkanRenderSemaphores'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddVulkanRenderSemaphores@, defined at @SDL3\/SDL_render.h 2755:34@
addVulkanRenderSemaphoresSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the rendering context.
  -> BG.Word32
  -- ^
  --
  --           [@wait_stage_mask@]: the VkPipelineStageFlags for the wait.
  -> BG.Int64
  -- ^
  --
  --           [@wait_semaphore@]: a VkSempahore to wait on before rendering the current frame, or 0 if not needed.
  -> BG.Int64
  -- ^
  --
  --           [@signal_semaphore@]: a VkSempahore that SDL will signal when rendering for the current frame is complete, or 0 if not needed.
  -> IO Bool
addVulkanRenderSemaphoresSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_AddVulkanRenderSemaphores x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33))

-- | Toggle VSync of the given renderer.
--
--     When a renderer is created, vsync defaults to SDL_RENDERER_VSYNC_DISABLED.
--
--     The @vsync@ parameter can be 1 to synchronize present with every vertical refresh, 2 to synchronize present with every second vertical refresh, etc., SDL_RENDERER_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or SDL_RENDERER_VSYNC_DISABLED to disable. Not every value is supported by every driver, so you should check the return value to see whether the requested setting is supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderVSync'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRenderVSync@.
--                   The safe flavor is 'setRenderVSyncSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderVSync@, defined at @SDL3\/SDL_render.h 2780:34@
setRenderVSync
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to toggle.
  -> BG.Int32
  -- ^
  --
  --           [@vsync@]: the vertical refresh sync interval.
  -> IO Bool
setRenderVSync =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetRenderVSync x00 (Coerce.coerce x11))

-- | Toggle VSync of the given renderer.
--
--     When a renderer is created, vsync defaults to SDL_RENDERER_VSYNC_DISABLED.
--
--     The @vsync@ parameter can be 1 to synchronize present with every vertical refresh, 2 to synchronize present with every second vertical refresh, etc., SDL_RENDERER_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or SDL_RENDERER_VSYNC_DISABLED to disable. Not every value is supported by every driver, so you should check the return value to see whether the requested setting is supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getRenderVSync'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRenderVSync@.
--                   The unsafe flavor is 'setRenderVSync'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRenderVSync@, defined at @SDL3\/SDL_render.h 2780:34@
setRenderVSyncSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to toggle.
  -> BG.Int32
  -- ^
  --
  --           [@vsync@]: the vertical refresh sync interval.
  -> IO Bool
setRenderVSyncSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetRenderVSync x00 (Coerce.coerce x11))

-- | Get VSync of the given renderer.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderVSync'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRenderVSync@.
--                   The safe flavor is 'getRenderVSyncSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderVSync@, defined at @SDL3\/SDL_render.h 2800:34@
getRenderVSync
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to toggle.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@vsync@]: an int filled with the current vertical refresh sync interval. See @'setRenderVSync'@ for the meaning of the value.
  -> IO Bool
getRenderVSync =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetRenderVSync x00 x11)

-- | Get VSync of the given renderer.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setRenderVSync'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRenderVSync@.
--                   The unsafe flavor is 'getRenderVSync'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetRenderVSync@, defined at @SDL3\/SDL_render.h 2800:34@
getRenderVSyncSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to toggle.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@vsync@]: an int filled with the current vertical refresh sync interval. See @'setRenderVSync'@ for the meaning of the value.
  -> IO Bool
getRenderVSyncSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetRenderVSync x00 x11)

-- | Draw debug text to an 'SDL_Renderer'.
--
--     This function will render a string of text to an 'SDL_Renderer'. Note that this is a convenience function for debugging, with severe limitations, and not intended to be used for production apps and games.
--
--     Among these limitations:
--
--     * It accepts UTF-8 strings, but will only renders ASCII characters.
--
--     * It has a single, tiny size (8x8 pixels). You can use logical presentation or @'setRenderScale'@ to adjust it.
--
--     * It uses a simple, hardcoded bitmap font. It does not allow different font selections and it does not support truetype, for proper scaling.
--
--     * It does no word-wrapping and does not treat newline characters as a line break. If the text goes out of the window, it\'s gone.
--
--     For serious text rendering, there are several good options, such as SDL_ttf, stb_truetype, or other external libraries.
--
--     On first use, this will create an internal texture for rendering glyphs. This texture will live until the renderer is destroyed.
--
--     The text is drawn in the color specified by @'setRenderDrawColor'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_RenderDebugTextFormat@, 'sDL_DEBUG_TEXT_FONT_CHARACTER_SIZE'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenderDebugText@.
--                   The safe flavor is 'renderDebugTextSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderDebugText@, defined at @SDL3\/SDL_render.h 2852:34@
renderDebugText
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a line of text.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate where the top-left corner of the text will draw.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate where the top-left corner of the text will draw.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to render.
  -> IO Bool
renderDebugText =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_RenderDebugText x00 (Coerce.coerce x11) (Coerce.coerce x22) x33)

-- | Draw debug text to an 'SDL_Renderer'.
--
--     This function will render a string of text to an 'SDL_Renderer'. Note that this is a convenience function for debugging, with severe limitations, and not intended to be used for production apps and games.
--
--     Among these limitations:
--
--     * It accepts UTF-8 strings, but will only renders ASCII characters.
--
--     * It has a single, tiny size (8x8 pixels). You can use logical presentation or @'setRenderScale'@ to adjust it.
--
--     * It uses a simple, hardcoded bitmap font. It does not allow different font selections and it does not support truetype, for proper scaling.
--
--     * It does no word-wrapping and does not treat newline characters as a line break. If the text goes out of the window, it\'s gone.
--
--     For serious text rendering, there are several good options, such as SDL_ttf, stb_truetype, or other external libraries.
--
--     On first use, this will create an internal texture for rendering glyphs. This texture will live until the renderer is destroyed.
--
--     The text is drawn in the color specified by @'setRenderDrawColor'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_RenderDebugTextFormat@, 'sDL_DEBUG_TEXT_FONT_CHARACTER_SIZE'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenderDebugText@.
--                   The unsafe flavor is 'renderDebugText'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenderDebugText@, defined at @SDL3\/SDL_render.h 2852:34@
renderDebugTextSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer which should draw a line of text.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate where the top-left corner of the text will draw.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate where the top-left corner of the text will draw.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the string to render.
  -> IO Bool
renderDebugTextSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_RenderDebugText x00 (Coerce.coerce x11) (Coerce.coerce x22) x33)

-- | Set default scale mode for new textures for given renderer.
--
--     When a renderer is created, scale_mode defaults to SDL_SCALEMODE_LINEAR.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'getDefaultTextureScaleMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetDefaultTextureScaleMode@.
--                   The safe flavor is 'setDefaultTextureScaleModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetDefaultTextureScaleMode@, defined at @SDL3\/SDL_render.h 2898:34@
setDefaultTextureScaleMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to update.
  -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scale_mode@]: the scale mode to change to for new textures.
  -> IO Bool
setDefaultTextureScaleMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetDefaultTextureScaleMode x00 x11)

-- | Set default scale mode for new textures for given renderer.
--
--     When a renderer is created, scale_mode defaults to SDL_SCALEMODE_LINEAR.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'getDefaultTextureScaleMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetDefaultTextureScaleMode@.
--                   The unsafe flavor is 'setDefaultTextureScaleMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetDefaultTextureScaleMode@, defined at @SDL3\/SDL_render.h 2898:34@
setDefaultTextureScaleModeSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to update.
  -> SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scale_mode@]: the scale mode to change to for new textures.
  -> IO Bool
setDefaultTextureScaleModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetDefaultTextureScaleMode x00 x11)

-- | Get default texture scale mode of the given renderer.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'setDefaultTextureScaleMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDefaultTextureScaleMode@.
--                   The safe flavor is 'getDefaultTextureScaleModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDefaultTextureScaleMode@, defined at @SDL3\/SDL_render.h 2916:34@
getDefaultTextureScaleMode
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to get data from.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scale_mode@]: a SDL_ScaleMode filled with current default scale mode. See @'setDefaultTextureScaleMode'@ for the meaning of the value.
  -> IO Bool
getDefaultTextureScaleMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetDefaultTextureScaleMode x00 x11)

-- | Get default texture scale mode of the given renderer.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'setDefaultTextureScaleMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDefaultTextureScaleMode@.
--                   The unsafe flavor is 'getDefaultTextureScaleMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDefaultTextureScaleMode@, defined at @SDL3\/SDL_render.h 2916:34@
getDefaultTextureScaleModeSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to get data from.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_ScaleMode
  -- ^
  --
  --           [@scale_mode@]: a SDL_ScaleMode filled with current default scale mode. See @'setDefaultTextureScaleMode'@ for the meaning of the value.
  -> IO Bool
getDefaultTextureScaleModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetDefaultTextureScaleMode x00 x11)

-- | Create custom GPU render state.
--
--     [Returns]: a custom GPU render state or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [See also]: 'setGPURenderStateFragmentUniforms', 'setGPURenderState', 'destroyGPURenderState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateGPURenderState@.
--                   The safe flavor is 'createGPURenderStateSafe'
--                   .
--
--     [C declaration]: @SDL_CreateGPURenderState@, defined at @SDL3\/SDL_render.h 2970:50@
createGPURenderState
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to use.
  -> PtrConst.PtrConst SDL_GPURenderStateCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the GPU render state to create.
  -> IO (BG.Ptr SDL_GPURenderState)
createGPURenderState =
  Unsafe.sDL_CreateGPURenderState

-- | Create custom GPU render state.
--
--     [Returns]: a custom GPU render state or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [See also]: 'setGPURenderStateFragmentUniforms', 'setGPURenderState', 'destroyGPURenderState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateGPURenderState@.
--                   The unsafe flavor is 'createGPURenderState'
--                   .
--
--     [C declaration]: @SDL_CreateGPURenderState@, defined at @SDL3\/SDL_render.h 2970:50@
createGPURenderStateSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to use.
  -> PtrConst.PtrConst SDL_GPURenderStateCreateInfo
  -- ^
  --
  --           [@createinfo@]: a struct describing the GPU render state to create.
  -> IO (BG.Ptr SDL_GPURenderState)
createGPURenderStateSafe =
  Safe.sDL_CreateGPURenderState

-- | Set fragment shader uniform variables in a custom GPU render state.
--
--     The data is copied and will be pushed using 'SDL3.Sys.Gpu.pushGPUFragmentUniformData' during draw call execution.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPURenderStateFragmentUniforms@.
--                   The safe flavor is 'setGPURenderStateFragmentUniformsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPURenderStateFragmentUniforms@, defined at @SDL3\/SDL_render.h 2990:34@
setGPURenderStateFragmentUniforms
  :: BG.Ptr SDL_GPURenderState
  -- ^
  --
  --           [@state@]: the state to modify.
  -> BG.Word32
  -- ^
  --
  --           [@slot_index@]: the fragment uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO Bool
setGPURenderStateFragmentUniforms =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_SetGPURenderStateFragmentUniforms x00 (Coerce.coerce x11) x22 (Coerce.coerce x33))

-- | Set fragment shader uniform variables in a custom GPU render state.
--
--     The data is copied and will be pushed using 'SDL3.Sys.Gpu.pushGPUFragmentUniformData' during draw call execution.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPURenderStateFragmentUniforms@.
--                   The unsafe flavor is 'setGPURenderStateFragmentUniforms'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPURenderStateFragmentUniforms@, defined at @SDL3\/SDL_render.h 2990:34@
setGPURenderStateFragmentUniformsSafe
  :: BG.Ptr SDL_GPURenderState
  -- ^
  --
  --           [@state@]: the state to modify.
  -> BG.Word32
  -- ^
  --
  --           [@slot_index@]: the fragment uniform slot to push data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: client data to write.
  -> BG.Word32
  -- ^
  --
  --           [@length@]: the length of the data to write.
  -> IO Bool
setGPURenderStateFragmentUniformsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_SetGPURenderStateFragmentUniforms x00 (Coerce.coerce x11) x22 (Coerce.coerce x33))

-- | Set custom GPU render state.
--
--     This function sets custom GPU render state for subsequent draw calls. This allows using custom shaders with the GPU renderer.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetGPURenderState@.
--                   The safe flavor is 'setGPURenderStateSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPURenderState@, defined at @SDL3\/SDL_render.h 3008:34@
setGPURenderState
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to use.
  -> BG.Ptr SDL_GPURenderState
  -- ^
  --
  --           [@state@]: the state to to use, or NULL to clear custom GPU render state.
  -> IO Bool
setGPURenderState =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetGPURenderState x00 x11)

-- | Set custom GPU render state.
--
--     This function sets custom GPU render state for subsequent draw calls. This allows using custom shaders with the GPU renderer.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetGPURenderState@.
--                   The unsafe flavor is 'setGPURenderState'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetGPURenderState@, defined at @SDL3\/SDL_render.h 3008:34@
setGPURenderStateSafe
  :: BG.Ptr SDL_Renderer
  -- ^
  --
  --           [@renderer@]: the renderer to use.
  -> BG.Ptr SDL_GPURenderState
  -- ^
  --
  --           [@state@]: the state to to use, or NULL to clear custom GPU render state.
  -> IO Bool
setGPURenderStateSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetGPURenderState x00 x11)

-- | Destroy custom GPU render state.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [See also]: 'createGPURenderState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyGPURenderState@.
--                   The safe flavor is 'destroyGPURenderStateSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyGPURenderState@, defined at @SDL3\/SDL_render.h 3022:34@
destroyGPURenderState
  :: BG.Ptr SDL_GPURenderState
  -- ^
  --
  --           [@state@]: the state to destroy.
  -> IO ()
destroyGPURenderState =
  Unsafe.sDL_DestroyGPURenderState

-- | Destroy custom GPU render state.
--
--     [Thread safety]: This function should be called on the thread that created the renderer.
--
--     @since 3.4.0
--
--     [See also]: 'createGPURenderState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyGPURenderState@.
--                   The unsafe flavor is 'destroyGPURenderState'
--                   .
--
--     [C declaration]: @SDL_DestroyGPURenderState@, defined at @SDL3\/SDL_render.h 3022:34@
destroyGPURenderStateSafe
  :: BG.Ptr SDL_GPURenderState
  -- ^
  --
  --           [@state@]: the state to destroy.
  -> IO ()
destroyGPURenderStateSafe =
  Safe.sDL_DestroyGPURenderState
