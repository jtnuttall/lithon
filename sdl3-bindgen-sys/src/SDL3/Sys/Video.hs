{-# LANGUAGE PatternSynonyms #-}

-- | SDL\'s video subsystem is largely interested in abstracting window management from the underlying operating system. You can create windows, manage them in various ways, set them fullscreen, and get events when interesting things happen with them, such as the mouse or keyboard interacting with a window.
--
--     The video subsystem is also interested in abstracting away some platform-specific differences in OpenGL: context creation, swapping buffers, etc. This may be crucial to your app, but also you are not required to use OpenGL at all. In fact, SDL can provide rendering to those windows as well, either with an easy-to-use [2D API](https://wiki.libsdl.org/SDL3/CategoryRender) or with a more-powerful [GPU API](https://wiki.libsdl.org/SDL3/CategoryGPU). Of course, it can simply get out of your way and give you the window handles you need to use Vulkan, Direct3D, Metal, or whatever else you like directly, too.
--
--     The video subsystem covers a lot of functionality, out of necessity, so it is worth perusing the list of functions just to see what\'s available, but most apps can get by with simply creating a window and listening for events, so start with @'createWindow'@ and 'SDL3.Sys.Events.pollEvent'. This is a unique ID for a display for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the display is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Video.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Video (
  module SDL3.Sys.Bindgen.Video,

  -- * Typed constants
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_DEBUG_FLAG,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_RESET_ISOLATION_FLAG,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_RESET_NO_NOTIFICATION,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_RESET_LOSE_CONTEXT,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_PROFILE_CORE,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_PROFILE_COMPATIBILITY,
  pattern SDL3.Sys.Video.SDL_GL_CONTEXT_PROFILE_ES,
  pattern SDL3.Sys.Video.SDL_WINDOW_FULLSCREEN,
  pattern SDL3.Sys.Video.SDL_WINDOW_OPENGL,
  pattern SDL3.Sys.Video.SDL_WINDOW_OCCLUDED,
  pattern SDL3.Sys.Video.SDL_WINDOW_HIDDEN,
  pattern SDL3.Sys.Video.SDL_WINDOW_BORDERLESS,
  pattern SDL3.Sys.Video.SDL_WINDOW_RESIZABLE,
  pattern SDL3.Sys.Video.SDL_WINDOW_MINIMIZED,
  pattern SDL3.Sys.Video.SDL_WINDOW_MAXIMIZED,
  pattern SDL3.Sys.Video.SDL_WINDOW_MOUSE_GRABBED,
  pattern SDL3.Sys.Video.SDL_WINDOW_INPUT_FOCUS,
  pattern SDL3.Sys.Video.SDL_WINDOW_MOUSE_FOCUS,
  pattern SDL3.Sys.Video.SDL_WINDOW_EXTERNAL,
  pattern SDL3.Sys.Video.SDL_WINDOW_MODAL,
  pattern SDL3.Sys.Video.SDL_WINDOW_HIGH_PIXEL_DENSITY,
  pattern SDL3.Sys.Video.SDL_WINDOW_MOUSE_CAPTURE,
  pattern SDL3.Sys.Video.SDL_WINDOW_MOUSE_RELATIVE_MODE,
  pattern SDL3.Sys.Video.SDL_WINDOW_ALWAYS_ON_TOP,
  pattern SDL3.Sys.Video.SDL_WINDOW_UTILITY,
  pattern SDL3.Sys.Video.SDL_WINDOW_TOOLTIP,
  pattern SDL3.Sys.Video.SDL_WINDOW_POPUP_MENU,
  pattern SDL3.Sys.Video.SDL_WINDOW_KEYBOARD_GRABBED,
  pattern SDL3.Sys.Video.SDL_WINDOW_FILL_DOCUMENT,
  pattern SDL3.Sys.Video.SDL_WINDOW_VULKAN,
  pattern SDL3.Sys.Video.SDL_WINDOW_METAL,
  pattern SDL3.Sys.Video.SDL_WINDOW_TRANSPARENT,
  pattern SDL3.Sys.Video.SDL_WINDOW_NOT_FOCUSABLE,

  -- * Function aliases
  SDL3.Sys.Video.getNumVideoDrivers,
  SDL3.Sys.Video.getNumVideoDriversSafe,
  SDL3.Sys.Video.getVideoDriver,
  SDL3.Sys.Video.getVideoDriverSafe,
  SDL3.Sys.Video.getCurrentVideoDriver,
  SDL3.Sys.Video.getCurrentVideoDriverSafe,
  SDL3.Sys.Video.getSystemTheme,
  SDL3.Sys.Video.getSystemThemeSafe,
  SDL3.Sys.Video.getDisplays,
  SDL3.Sys.Video.getDisplaysSafe,
  SDL3.Sys.Video.getPrimaryDisplay,
  SDL3.Sys.Video.getPrimaryDisplaySafe,
  SDL3.Sys.Video.getDisplayProperties,
  SDL3.Sys.Video.getDisplayPropertiesSafe,
  SDL3.Sys.Video.getDisplayName,
  SDL3.Sys.Video.getDisplayNameSafe,
  SDL3.Sys.Video.getDisplayBounds,
  SDL3.Sys.Video.getDisplayBoundsSafe,
  SDL3.Sys.Video.getDisplayUsableBounds,
  SDL3.Sys.Video.getDisplayUsableBoundsSafe,
  SDL3.Sys.Video.getNaturalDisplayOrientation,
  SDL3.Sys.Video.getNaturalDisplayOrientationSafe,
  SDL3.Sys.Video.getCurrentDisplayOrientation,
  SDL3.Sys.Video.getCurrentDisplayOrientationSafe,
  SDL3.Sys.Video.getDisplayContentScale,
  SDL3.Sys.Video.getDisplayContentScaleSafe,
  SDL3.Sys.Video.getFullscreenDisplayModes,
  SDL3.Sys.Video.getFullscreenDisplayModesSafe,
  SDL3.Sys.Video.getClosestFullscreenDisplayMode,
  SDL3.Sys.Video.getClosestFullscreenDisplayModeSafe,
  SDL3.Sys.Video.getDesktopDisplayMode,
  SDL3.Sys.Video.getDesktopDisplayModeSafe,
  SDL3.Sys.Video.getCurrentDisplayMode,
  SDL3.Sys.Video.getCurrentDisplayModeSafe,
  SDL3.Sys.Video.getDisplayForPoint,
  SDL3.Sys.Video.getDisplayForPointSafe,
  SDL3.Sys.Video.getDisplayForRect,
  SDL3.Sys.Video.getDisplayForRectSafe,
  SDL3.Sys.Video.getDisplayForWindow,
  SDL3.Sys.Video.getDisplayForWindowSafe,
  SDL3.Sys.Video.getWindowPixelDensity,
  SDL3.Sys.Video.getWindowPixelDensitySafe,
  SDL3.Sys.Video.getWindowDisplayScale,
  SDL3.Sys.Video.getWindowDisplayScaleSafe,
  SDL3.Sys.Video.setWindowFullscreenMode,
  SDL3.Sys.Video.setWindowFullscreenModeSafe,
  SDL3.Sys.Video.getWindowFullscreenMode,
  SDL3.Sys.Video.getWindowFullscreenModeSafe,
  SDL3.Sys.Video.getWindowICCProfile,
  SDL3.Sys.Video.getWindowICCProfileSafe,
  SDL3.Sys.Video.getWindowPixelFormat,
  SDL3.Sys.Video.getWindowPixelFormatSafe,
  SDL3.Sys.Video.getWindows,
  SDL3.Sys.Video.getWindowsSafe,
  SDL3.Sys.Video.createWindow,
  SDL3.Sys.Video.createWindowSafe,
  SDL3.Sys.Video.createPopupWindow,
  SDL3.Sys.Video.createPopupWindowSafe,
  SDL3.Sys.Video.createWindowWithProperties,
  SDL3.Sys.Video.createWindowWithPropertiesSafe,
  SDL3.Sys.Video.getWindowID,
  SDL3.Sys.Video.getWindowIDSafe,
  SDL3.Sys.Video.getWindowFromID,
  SDL3.Sys.Video.getWindowFromIDSafe,
  SDL3.Sys.Video.getWindowParent,
  SDL3.Sys.Video.getWindowParentSafe,
  SDL3.Sys.Video.getWindowProperties,
  SDL3.Sys.Video.getWindowPropertiesSafe,
  SDL3.Sys.Video.getWindowFlags,
  SDL3.Sys.Video.getWindowFlagsSafe,
  SDL3.Sys.Video.setWindowTitle,
  SDL3.Sys.Video.setWindowTitleSafe,
  SDL3.Sys.Video.getWindowTitle,
  SDL3.Sys.Video.getWindowTitleSafe,
  SDL3.Sys.Video.setWindowIcon,
  SDL3.Sys.Video.setWindowIconSafe,
  SDL3.Sys.Video.setWindowPosition,
  SDL3.Sys.Video.setWindowPositionSafe,
  SDL3.Sys.Video.getWindowPosition,
  SDL3.Sys.Video.getWindowPositionSafe,
  SDL3.Sys.Video.setWindowSize,
  SDL3.Sys.Video.setWindowSizeSafe,
  SDL3.Sys.Video.getWindowSize,
  SDL3.Sys.Video.getWindowSizeSafe,
  SDL3.Sys.Video.getWindowSafeArea,
  SDL3.Sys.Video.getWindowSafeAreaSafe,
  SDL3.Sys.Video.setWindowAspectRatio,
  SDL3.Sys.Video.setWindowAspectRatioSafe,
  SDL3.Sys.Video.getWindowAspectRatio,
  SDL3.Sys.Video.getWindowAspectRatioSafe,
  SDL3.Sys.Video.getWindowBordersSize,
  SDL3.Sys.Video.getWindowBordersSizeSafe,
  SDL3.Sys.Video.getWindowSizeInPixels,
  SDL3.Sys.Video.getWindowSizeInPixelsSafe,
  SDL3.Sys.Video.setWindowMinimumSize,
  SDL3.Sys.Video.setWindowMinimumSizeSafe,
  SDL3.Sys.Video.getWindowMinimumSize,
  SDL3.Sys.Video.getWindowMinimumSizeSafe,
  SDL3.Sys.Video.setWindowMaximumSize,
  SDL3.Sys.Video.setWindowMaximumSizeSafe,
  SDL3.Sys.Video.getWindowMaximumSize,
  SDL3.Sys.Video.getWindowMaximumSizeSafe,
  SDL3.Sys.Video.setWindowBordered,
  SDL3.Sys.Video.setWindowBorderedSafe,
  SDL3.Sys.Video.setWindowResizable,
  SDL3.Sys.Video.setWindowResizableSafe,
  SDL3.Sys.Video.setWindowAlwaysOnTop,
  SDL3.Sys.Video.setWindowAlwaysOnTopSafe,
  SDL3.Sys.Video.setWindowFillDocument,
  SDL3.Sys.Video.setWindowFillDocumentSafe,
  SDL3.Sys.Video.showWindow,
  SDL3.Sys.Video.showWindowSafe,
  SDL3.Sys.Video.hideWindow,
  SDL3.Sys.Video.hideWindowSafe,
  SDL3.Sys.Video.raiseWindow,
  SDL3.Sys.Video.raiseWindowSafe,
  SDL3.Sys.Video.maximizeWindow,
  SDL3.Sys.Video.maximizeWindowSafe,
  SDL3.Sys.Video.minimizeWindow,
  SDL3.Sys.Video.minimizeWindowSafe,
  SDL3.Sys.Video.restoreWindow,
  SDL3.Sys.Video.restoreWindowSafe,
  SDL3.Sys.Video.setWindowFullscreen,
  SDL3.Sys.Video.setWindowFullscreenSafe,
  SDL3.Sys.Video.syncWindow,
  SDL3.Sys.Video.syncWindowSafe,
  SDL3.Sys.Video.windowHasSurface,
  SDL3.Sys.Video.windowHasSurfaceSafe,
  SDL3.Sys.Video.getWindowSurface,
  SDL3.Sys.Video.getWindowSurfaceSafe,
  SDL3.Sys.Video.setWindowSurfaceVSync,
  SDL3.Sys.Video.setWindowSurfaceVSyncSafe,
  SDL3.Sys.Video.getWindowSurfaceVSync,
  SDL3.Sys.Video.getWindowSurfaceVSyncSafe,
  SDL3.Sys.Video.updateWindowSurface,
  SDL3.Sys.Video.updateWindowSurfaceSafe,
  SDL3.Sys.Video.updateWindowSurfaceRects,
  SDL3.Sys.Video.updateWindowSurfaceRectsSafe,
  SDL3.Sys.Video.destroyWindowSurface,
  SDL3.Sys.Video.destroyWindowSurfaceSafe,
  SDL3.Sys.Video.setWindowKeyboardGrab,
  SDL3.Sys.Video.setWindowKeyboardGrabSafe,
  SDL3.Sys.Video.setWindowMouseGrab,
  SDL3.Sys.Video.setWindowMouseGrabSafe,
  SDL3.Sys.Video.getWindowKeyboardGrab,
  SDL3.Sys.Video.getWindowKeyboardGrabSafe,
  SDL3.Sys.Video.getWindowMouseGrab,
  SDL3.Sys.Video.getWindowMouseGrabSafe,
  SDL3.Sys.Video.getGrabbedWindow,
  SDL3.Sys.Video.getGrabbedWindowSafe,
  SDL3.Sys.Video.setWindowMouseRect,
  SDL3.Sys.Video.setWindowMouseRectSafe,
  SDL3.Sys.Video.getWindowMouseRect,
  SDL3.Sys.Video.getWindowMouseRectSafe,
  SDL3.Sys.Video.setWindowOpacity,
  SDL3.Sys.Video.setWindowOpacitySafe,
  SDL3.Sys.Video.getWindowOpacity,
  SDL3.Sys.Video.getWindowOpacitySafe,
  SDL3.Sys.Video.setWindowParent,
  SDL3.Sys.Video.setWindowParentSafe,
  SDL3.Sys.Video.setWindowModal,
  SDL3.Sys.Video.setWindowModalSafe,
  SDL3.Sys.Video.setWindowFocusable,
  SDL3.Sys.Video.setWindowFocusableSafe,
  SDL3.Sys.Video.showWindowSystemMenu,
  SDL3.Sys.Video.showWindowSystemMenuSafe,
  SDL3.Sys.Video.setWindowHitTest,
  SDL3.Sys.Video.setWindowHitTestSafe,
  SDL3.Sys.Video.setWindowShape,
  SDL3.Sys.Video.setWindowShapeSafe,
  SDL3.Sys.Video.flashWindow,
  SDL3.Sys.Video.flashWindowSafe,
  SDL3.Sys.Video.setWindowProgressState,
  SDL3.Sys.Video.setWindowProgressStateSafe,
  SDL3.Sys.Video.getWindowProgressState,
  SDL3.Sys.Video.getWindowProgressStateSafe,
  SDL3.Sys.Video.setWindowProgressValue,
  SDL3.Sys.Video.setWindowProgressValueSafe,
  SDL3.Sys.Video.getWindowProgressValue,
  SDL3.Sys.Video.getWindowProgressValueSafe,
  SDL3.Sys.Video.destroyWindow,
  SDL3.Sys.Video.destroyWindowSafe,
  SDL3.Sys.Video.screenSaverEnabled,
  SDL3.Sys.Video.screenSaverEnabledSafe,
  SDL3.Sys.Video.enableScreenSaver,
  SDL3.Sys.Video.enableScreenSaverSafe,
  SDL3.Sys.Video.disableScreenSaver,
  SDL3.Sys.Video.disableScreenSaverSafe,
  SDL3.Sys.Video.glLoadLibrary,
  SDL3.Sys.Video.glLoadLibrarySafe,
  SDL3.Sys.Video.glGetProcAddress,
  SDL3.Sys.Video.glGetProcAddressSafe,
  SDL3.Sys.Video.eglGetProcAddress,
  SDL3.Sys.Video.eglGetProcAddressSafe,
  SDL3.Sys.Video.glUnloadLibrary,
  SDL3.Sys.Video.glUnloadLibrarySafe,
  SDL3.Sys.Video.glExtensionSupported,
  SDL3.Sys.Video.glExtensionSupportedSafe,
  SDL3.Sys.Video.glResetAttributes,
  SDL3.Sys.Video.glResetAttributesSafe,
  SDL3.Sys.Video.glSetAttribute,
  SDL3.Sys.Video.glSetAttributeSafe,
  SDL3.Sys.Video.glGetAttribute,
  SDL3.Sys.Video.glGetAttributeSafe,
  SDL3.Sys.Video.glCreateContext,
  SDL3.Sys.Video.glCreateContextSafe,
  SDL3.Sys.Video.glMakeCurrent,
  SDL3.Sys.Video.glMakeCurrentSafe,
  SDL3.Sys.Video.glGetCurrentWindow,
  SDL3.Sys.Video.glGetCurrentWindowSafe,
  SDL3.Sys.Video.glGetCurrentContext,
  SDL3.Sys.Video.glGetCurrentContextSafe,
  SDL3.Sys.Video.eglGetCurrentDisplay,
  SDL3.Sys.Video.eglGetCurrentDisplaySafe,
  SDL3.Sys.Video.eglGetCurrentConfig,
  SDL3.Sys.Video.eglGetCurrentConfigSafe,
  SDL3.Sys.Video.eglGetWindowSurface,
  SDL3.Sys.Video.eglGetWindowSurfaceSafe,
  SDL3.Sys.Video.eglSetAttributeCallbacks,
  SDL3.Sys.Video.eglSetAttributeCallbacksSafe,
  SDL3.Sys.Video.glSetSwapInterval,
  SDL3.Sys.Video.glSetSwapIntervalSafe,
  SDL3.Sys.Video.glGetSwapInterval,
  SDL3.Sys.Video.glGetSwapIntervalSafe,
  SDL3.Sys.Video.glSwapWindow,
  SDL3.Sys.Video.glSwapWindowSafe,
  SDL3.Sys.Video.glDestroyContext,
  SDL3.Sys.Video.glDestroyContextSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified
import SDL3.Sys.Bindgen.Video
import SDL3.Sys.Bindgen.Video.Safe qualified as Safe
import SDL3.Sys.Bindgen.Video.Unsafe qualified as Unsafe

-- | Get the number of video drivers compiled into SDL.
--
--     [Returns]: the number of built in video drivers.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getVideoDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumVideoDrivers@.
--                   The safe flavor is 'getNumVideoDriversSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumVideoDrivers@, defined at @SDL3\/SDL_video.h 563:33@
getNumVideoDrivers :: IO BG.Int32
getNumVideoDrivers =
  fmap Coerce.coerce Unsafe.sDL_GetNumVideoDrivers

-- | Get the number of video drivers compiled into SDL.
--
--     [Returns]: the number of built in video drivers.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getVideoDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumVideoDrivers@.
--                   The unsafe flavor is 'getNumVideoDrivers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumVideoDrivers@, defined at @SDL3\/SDL_video.h 563:33@
getNumVideoDriversSafe :: IO BG.Int32
getNumVideoDriversSafe =
  fmap Coerce.coerce Safe.sDL_GetNumVideoDrivers

-- | Get the name of a built in video driver.
--
--     The video drivers are presented in the order in which they are normally checked during initialization.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"cocoa\", \"x11\" or \"windows\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the video driver with the given __index__, or NULL if index is out of bounds.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumVideoDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetVideoDriver@.
--                   The safe flavor is 'getVideoDriverSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetVideoDriver@, defined at @SDL3\/SDL_video.h 585:42@
getVideoDriver
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of a video driver.
  -> IO (PtrConst.PtrConst BG.CChar)
getVideoDriver =
  \x00 -> Unsafe.sDL_GetVideoDriver (Coerce.coerce x00)

-- | Get the name of a built in video driver.
--
--     The video drivers are presented in the order in which they are normally checked during initialization.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"cocoa\", \"x11\" or \"windows\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the video driver with the given __index__, or NULL if index is out of bounds.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumVideoDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetVideoDriver@.
--                   The unsafe flavor is 'getVideoDriver'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetVideoDriver@, defined at @SDL3\/SDL_video.h 585:42@
getVideoDriverSafe
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of a video driver.
  -> IO (PtrConst.PtrConst BG.CChar)
getVideoDriverSafe =
  \x00 -> Safe.sDL_GetVideoDriver (Coerce.coerce x00)

-- | Get the name of the currently initialized video driver.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"cocoa\", \"x11\" or \"windows\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the current video driver or NULL if no driver has been initialized.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumVideoDrivers', 'getVideoDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCurrentVideoDriver@.
--                   The safe flavor is 'getCurrentVideoDriverSafe'
--                   .
--
--     [C declaration]: @SDL_GetCurrentVideoDriver@, defined at @SDL3\/SDL_video.h 604:42@
getCurrentVideoDriver :: IO (PtrConst.PtrConst BG.CChar)
getCurrentVideoDriver =
  Unsafe.sDL_GetCurrentVideoDriver

-- | Get the name of the currently initialized video driver.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"cocoa\", \"x11\" or \"windows\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the current video driver or NULL if no driver has been initialized.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumVideoDrivers', 'getVideoDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCurrentVideoDriver@.
--                   The unsafe flavor is 'getCurrentVideoDriver'
--                   .
--
--     [C declaration]: @SDL_GetCurrentVideoDriver@, defined at @SDL3\/SDL_video.h 604:42@
getCurrentVideoDriverSafe :: IO (PtrConst.PtrConst BG.CChar)
getCurrentVideoDriverSafe =
  Safe.sDL_GetCurrentVideoDriver

-- | Get the current system theme.
--
--     [Returns]: the current system theme, light, dark, or unknown.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSystemTheme@.
--                   The safe flavor is 'getSystemThemeSafe'
--                   .
--
--     [C declaration]: @SDL_GetSystemTheme@, defined at @SDL3\/SDL_video.h 615:45@
getSystemTheme :: IO SDL_SystemTheme
getSystemTheme = Unsafe.sDL_GetSystemTheme

-- | Get the current system theme.
--
--     [Returns]: the current system theme, light, dark, or unknown.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSystemTheme@.
--                   The unsafe flavor is 'getSystemTheme'
--                   .
--
--     [C declaration]: @SDL_GetSystemTheme@, defined at @SDL3\/SDL_video.h 615:45@
getSystemThemeSafe :: IO SDL_SystemTheme
getSystemThemeSafe = Safe.sDL_GetSystemTheme

-- | Get a list of currently connected displays.
--
--     [Returns]: a 0 terminated array of display instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDisplays@.
--                   The safe flavor is 'getDisplaysSafe'
--                   .
--
--     [C declaration]: @SDL_GetDisplays@, defined at @SDL3\/SDL_video.h 630:45@
getDisplays
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of displays returned, may be NULL.
  -> IO (BG.Ptr SDL_DisplayID)
getDisplays = Unsafe.sDL_GetDisplays

-- | Get a list of currently connected displays.
--
--     [Returns]: a 0 terminated array of display instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDisplays@.
--                   The unsafe flavor is 'getDisplays'
--                   .
--
--     [C declaration]: @SDL_GetDisplays@, defined at @SDL3\/SDL_video.h 630:45@
getDisplaysSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of displays returned, may be NULL.
  -> IO (BG.Ptr SDL_DisplayID)
getDisplaysSafe = Safe.sDL_GetDisplays

-- | Return the primary display.
--
--     [Returns]: the instance ID of the primary display on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPrimaryDisplay@.
--                   The safe flavor is 'getPrimaryDisplaySafe'
--                   .
--
--     [C declaration]: @SDL_GetPrimaryDisplay@, defined at @SDL3\/SDL_video.h 644:43@
getPrimaryDisplay :: IO SDL_DisplayID
getPrimaryDisplay = Unsafe.sDL_GetPrimaryDisplay

-- | Return the primary display.
--
--     [Returns]: the instance ID of the primary display on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPrimaryDisplay@.
--                   The unsafe flavor is 'getPrimaryDisplay'
--                   .
--
--     [C declaration]: @SDL_GetPrimaryDisplay@, defined at @SDL3\/SDL_video.h 644:43@
getPrimaryDisplaySafe :: IO SDL_DisplayID
getPrimaryDisplaySafe = Safe.sDL_GetPrimaryDisplay

-- | Get the properties associated with a display.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN'@: true if the display has HDR headroom above the SDR white point. This is for informational and diagnostic purposes only, as not all platforms provide this information at the display level.
--
--     On KMS\/DRM:
--
--     * @'sDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER'@: the \"panel orientation\" property for the display in degrees of clockwise rotation. Note that this is provided only as a hint, and the application is responsible for any coordinate transformations needed to conform to the requested display orientation.
--
--     On Wayland:
--
--     * @'sDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER'@: the wl_output associated with the display
--
--     On Windows:
--
--     * @'sDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER'@: the monitor handle (HMONITOR) associated with the display
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDisplayProperties@.
--                   The safe flavor is 'getDisplayPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetDisplayProperties@, defined at @SDL3\/SDL_video.h 682:46@
getDisplayProperties
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getDisplayProperties =
  Unsafe.sDL_GetDisplayProperties

-- | Get the properties associated with a display.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN'@: true if the display has HDR headroom above the SDR white point. This is for informational and diagnostic purposes only, as not all platforms provide this information at the display level.
--
--     On KMS\/DRM:
--
--     * @'sDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER'@: the \"panel orientation\" property for the display in degrees of clockwise rotation. Note that this is provided only as a hint, and the application is responsible for any coordinate transformations needed to conform to the requested display orientation.
--
--     On Wayland:
--
--     * @'sDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER'@: the wl_output associated with the display
--
--     On Windows:
--
--     * @'sDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER'@: the monitor handle (HMONITOR) associated with the display
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDisplayProperties@.
--                   The unsafe flavor is 'getDisplayProperties'
--                   .
--
--     [C declaration]: @SDL_GetDisplayProperties@, defined at @SDL3\/SDL_video.h 682:46@
getDisplayPropertiesSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getDisplayPropertiesSafe =
  Safe.sDL_GetDisplayProperties

-- | Get the name of a display in UTF-8 encoding.
--
--     [Returns]: the name of a display or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDisplayName@.
--                   The safe flavor is 'getDisplayNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetDisplayName@, defined at @SDL3\/SDL_video.h 702:42@
getDisplayName
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getDisplayName = Unsafe.sDL_GetDisplayName

-- | Get the name of a display in UTF-8 encoding.
--
--     [Returns]: the name of a display or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDisplayName@.
--                   The unsafe flavor is 'getDisplayName'
--                   .
--
--     [C declaration]: @SDL_GetDisplayName@, defined at @SDL3\/SDL_video.h 702:42@
getDisplayNameSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getDisplayNameSafe = Safe.sDL_GetDisplayName

-- | Get the desktop area represented by a display.
--
--     The primary display is often located at (0,0), but may be placed at a different location depending on monitor layout.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayUsableBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDisplayBounds@.
--                   The safe flavor is 'getDisplayBoundsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDisplayBounds@, defined at @SDL3\/SDL_video.h 722:34@
getDisplayBounds
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure filled in with the display bounds.
  -> IO Bool
getDisplayBounds =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetDisplayBounds x00 x11)

-- | Get the desktop area represented by a display.
--
--     The primary display is often located at (0,0), but may be placed at a different location depending on monitor layout.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayUsableBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDisplayBounds@.
--                   The unsafe flavor is 'getDisplayBounds'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDisplayBounds@, defined at @SDL3\/SDL_video.h 722:34@
getDisplayBoundsSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure filled in with the display bounds.
  -> IO Bool
getDisplayBoundsSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetDisplayBounds x00 x11)

-- | Get the usable desktop area represented by a display, in screen coordinates.
--
--     This is the same area as @'getDisplayBounds'@ reports, but with portions reserved by the system removed. For example, on Apple\'s macOS, this subtracts the area occupied by the menu bar and dock.
--
--     Setting a window to be fullscreen generally bypasses these unusable areas, so these are good guidelines for the maximum space available to a non-fullscreen window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDisplayUsableBounds@.
--                   The safe flavor is 'getDisplayUsableBoundsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDisplayUsableBounds@, defined at @SDL3\/SDL_video.h 748:34@
getDisplayUsableBounds
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure filled in with the display bounds.
  -> IO Bool
getDisplayUsableBounds =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetDisplayUsableBounds x00 x11)

-- | Get the usable desktop area represented by a display, in screen coordinates.
--
--     This is the same area as @'getDisplayBounds'@ reports, but with portions reserved by the system removed. For example, on Apple\'s macOS, this subtracts the area occupied by the menu bar and dock.
--
--     Setting a window to be fullscreen generally bypasses these unusable areas, so these are good guidelines for the maximum space available to a non-fullscreen window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDisplayUsableBounds@.
--                   The unsafe flavor is 'getDisplayUsableBounds'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDisplayUsableBounds@, defined at @SDL3\/SDL_video.h 748:34@
getDisplayUsableBoundsSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure filled in with the display bounds.
  -> IO Bool
getDisplayUsableBoundsSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetDisplayUsableBounds x00 x11)

-- | Get the orientation of a display when it is unrotated.
--
--     [Returns]: the 'SDL_DisplayOrientation' enum value of the display, or @SDL_ORIENTATION_UNKNOWN@ if it isn\'t available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNaturalDisplayOrientation@.
--                   The safe flavor is 'getNaturalDisplayOrientationSafe'
--                   .
--
--     [C declaration]: @SDL_GetNaturalDisplayOrientation@, defined at @SDL3\/SDL_video.h 763:52@
getNaturalDisplayOrientation
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO SDL_DisplayOrientation
getNaturalDisplayOrientation =
  Unsafe.sDL_GetNaturalDisplayOrientation

-- | Get the orientation of a display when it is unrotated.
--
--     [Returns]: the 'SDL_DisplayOrientation' enum value of the display, or @SDL_ORIENTATION_UNKNOWN@ if it isn\'t available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNaturalDisplayOrientation@.
--                   The unsafe flavor is 'getNaturalDisplayOrientation'
--                   .
--
--     [C declaration]: @SDL_GetNaturalDisplayOrientation@, defined at @SDL3\/SDL_video.h 763:52@
getNaturalDisplayOrientationSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO SDL_DisplayOrientation
getNaturalDisplayOrientationSafe =
  Safe.sDL_GetNaturalDisplayOrientation

-- | Get the orientation of a display.
--
--     [Returns]: the 'SDL_DisplayOrientation' enum value of the display, or @SDL_ORIENTATION_UNKNOWN@ if it isn\'t available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCurrentDisplayOrientation@.
--                   The safe flavor is 'getCurrentDisplayOrientationSafe'
--                   .
--
--     [C declaration]: @SDL_GetCurrentDisplayOrientation@, defined at @SDL3\/SDL_video.h 778:52@
getCurrentDisplayOrientation
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO SDL_DisplayOrientation
getCurrentDisplayOrientation =
  Unsafe.sDL_GetCurrentDisplayOrientation

-- | Get the orientation of a display.
--
--     [Returns]: the 'SDL_DisplayOrientation' enum value of the display, or @SDL_ORIENTATION_UNKNOWN@ if it isn\'t available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCurrentDisplayOrientation@.
--                   The unsafe flavor is 'getCurrentDisplayOrientation'
--                   .
--
--     [C declaration]: @SDL_GetCurrentDisplayOrientation@, defined at @SDL3\/SDL_video.h 778:52@
getCurrentDisplayOrientationSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO SDL_DisplayOrientation
getCurrentDisplayOrientationSafe =
  Safe.sDL_GetCurrentDisplayOrientation

-- | Get the content scale of a display.
--
--     The content scale is the expected scale for content based on the DPI settings of the display. For example, a 4K display might have a 2.0 (200%) display scale, which means that the user expects UI elements to be twice as big on this display, to aid in readability.
--
--     After window creation, @'getWindowDisplayScale'@ should be used to query the content scale factor for individual windows instead of querying the display for a window and calling this function, as the per-window content scale factor may differ from the base value of the display it is on, particularly on high-DPI and\/or multi-monitor desktop configurations.
--
--     [Returns]: the content scale of the display, or 0.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowDisplayScale', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDisplayContentScale@.
--                   The safe flavor is 'getDisplayContentScaleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDisplayContentScale@, defined at @SDL3\/SDL_video.h 805:35@
getDisplayContentScale
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO Float
getDisplayContentScale =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetDisplayContentScale x00)

-- | Get the content scale of a display.
--
--     The content scale is the expected scale for content based on the DPI settings of the display. For example, a 4K display might have a 2.0 (200%) display scale, which means that the user expects UI elements to be twice as big on this display, to aid in readability.
--
--     After window creation, @'getWindowDisplayScale'@ should be used to query the content scale factor for individual windows instead of querying the display for a window and calling this function, as the per-window content scale factor may differ from the base value of the display it is on, particularly on high-DPI and\/or multi-monitor desktop configurations.
--
--     [Returns]: the content scale of the display, or 0.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowDisplayScale', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDisplayContentScale@.
--                   The unsafe flavor is 'getDisplayContentScale'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetDisplayContentScale@, defined at @SDL3\/SDL_video.h 805:35@
getDisplayContentScaleSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO Float
getDisplayContentScaleSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetDisplayContentScale x00)

-- | Get a list of fullscreen display modes available on a display.
--
--     The display modes are sorted in this priority:
--
--     * w -> largest to smallest
--
--     * h -> largest to smallest
--
--     * bits per pixel -> more colors to fewer colors
--
--     * packed pixel layout -> largest to smallest
--
--     * refresh rate -> highest to lowest
--
--     * pixel density -> lowest to highest
--
--     [Returns]: a NULL terminated array of display mode pointers or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetFullscreenDisplayModes@.
--                   The safe flavor is 'getFullscreenDisplayModesSafe'
--                   .
--
--     [C declaration]: @SDL_GetFullscreenDisplayModes@, defined at @SDL3\/SDL_video.h 833:48@
getFullscreenDisplayModes
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of display modes returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_DisplayMode))
getFullscreenDisplayModes =
  Unsafe.sDL_GetFullscreenDisplayModes

-- | Get a list of fullscreen display modes available on a display.
--
--     The display modes are sorted in this priority:
--
--     * w -> largest to smallest
--
--     * h -> largest to smallest
--
--     * bits per pixel -> more colors to fewer colors
--
--     * packed pixel layout -> largest to smallest
--
--     * refresh rate -> highest to lowest
--
--     * pixel density -> lowest to highest
--
--     [Returns]: a NULL terminated array of display mode pointers or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetFullscreenDisplayModes@.
--                   The unsafe flavor is 'getFullscreenDisplayModes'
--                   .
--
--     [C declaration]: @SDL_GetFullscreenDisplayModes@, defined at @SDL3\/SDL_video.h 833:48@
getFullscreenDisplayModesSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of display modes returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_DisplayMode))
getFullscreenDisplayModesSafe =
  Safe.sDL_GetFullscreenDisplayModes

-- | Get the closest match to the requested display mode.
--
--     The available display modes are scanned and @closest@ is filled in with the closest mode matching the requested mode and returned. The mode format and refresh rate default to the desktop mode if they are set to 0. The modes are scanned with size being first priority, format being second priority, and finally checking the refresh rate. If all the available modes are too small, then false is returned.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays', 'getFullscreenDisplayModes'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetClosestFullscreenDisplayMode@.
--                   The safe flavor is 'getClosestFullscreenDisplayModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetClosestFullscreenDisplayMode@, defined at @SDL3\/SDL_video.h 864:34@
getClosestFullscreenDisplayMode
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width in pixels of the desired display mode.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height in pixels of the desired display mode.
  -> Float
  -- ^
  --
  --           [@refresh_rate@]: the refresh rate of the desired display mode, or 0.0f for the desktop refresh rate.
  -> Bool
  -- ^
  --
  --           [@include_high_density_modes@]: boolean to include high density modes in the search.
  -> BG.Ptr SDL_DisplayMode
  -- ^
  --
  --           [@closest@]: a pointer filled in with the closest display mode equal to or larger than the desired mode.
  -> IO Bool
getClosestFullscreenDisplayMode =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap
                CBool.toBool
                ( Unsafe.sDL_GetClosestFullscreenDisplayMode
                    x00
                    (Coerce.coerce x11)
                    (Coerce.coerce x22)
                    (Coerce.coerce x33)
                    (CBool.fromBool x44)
                    x55
                )

-- | Get the closest match to the requested display mode.
--
--     The available display modes are scanned and @closest@ is filled in with the closest mode matching the requested mode and returned. The mode format and refresh rate default to the desktop mode if they are set to 0. The modes are scanned with size being first priority, format being second priority, and finally checking the refresh rate. If all the available modes are too small, then false is returned.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplays', 'getFullscreenDisplayModes'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetClosestFullscreenDisplayMode@.
--                   The unsafe flavor is 'getClosestFullscreenDisplayMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetClosestFullscreenDisplayMode@, defined at @SDL3\/SDL_video.h 864:34@
getClosestFullscreenDisplayModeSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width in pixels of the desired display mode.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height in pixels of the desired display mode.
  -> Float
  -- ^
  --
  --           [@refresh_rate@]: the refresh rate of the desired display mode, or 0.0f for the desktop refresh rate.
  -> Bool
  -- ^
  --
  --           [@include_high_density_modes@]: boolean to include high density modes in the search.
  -> BG.Ptr SDL_DisplayMode
  -- ^
  --
  --           [@closest@]: a pointer filled in with the closest display mode equal to or larger than the desired mode.
  -> IO Bool
getClosestFullscreenDisplayModeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap
                CBool.toBool
                ( Safe.sDL_GetClosestFullscreenDisplayMode
                    x00
                    (Coerce.coerce x11)
                    (Coerce.coerce x22)
                    (Coerce.coerce x33)
                    (CBool.fromBool x44)
                    x55
                )

-- | Get information about the desktop\'s display mode.
--
--     There\'s a difference between this function and @'getCurrentDisplayMode'@ when SDL runs fullscreen and has changed the resolution. In that case this function will return the previous native display mode, and not the current display mode.
--
--     [Returns]: a pointer to the desktop display mode or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCurrentDisplayMode', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDesktopDisplayMode@.
--                   The safe flavor is 'getDesktopDisplayModeSafe'
--                   .
--
--     [C declaration]: @SDL_GetDesktopDisplayMode@, defined at @SDL3\/SDL_video.h 885:53@
getDesktopDisplayMode
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
getDesktopDisplayMode =
  Unsafe.sDL_GetDesktopDisplayMode

-- | Get information about the desktop\'s display mode.
--
--     There\'s a difference between this function and @'getCurrentDisplayMode'@ when SDL runs fullscreen and has changed the resolution. In that case this function will return the previous native display mode, and not the current display mode.
--
--     [Returns]: a pointer to the desktop display mode or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCurrentDisplayMode', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDesktopDisplayMode@.
--                   The unsafe flavor is 'getDesktopDisplayMode'
--                   .
--
--     [C declaration]: @SDL_GetDesktopDisplayMode@, defined at @SDL3\/SDL_video.h 885:53@
getDesktopDisplayModeSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
getDesktopDisplayModeSafe =
  Safe.sDL_GetDesktopDisplayMode

-- | Get information about the current display mode.
--
--     There\'s a difference between this function and @'getDesktopDisplayMode'@ when SDL runs fullscreen and has changed the resolution. In that case this function will return the current display mode, and not the previous native display mode.
--
--     [Returns]: a pointer to the desktop display mode or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDesktopDisplayMode', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCurrentDisplayMode@.
--                   The safe flavor is 'getCurrentDisplayModeSafe'
--                   .
--
--     [C declaration]: @SDL_GetCurrentDisplayMode@, defined at @SDL3\/SDL_video.h 906:53@
getCurrentDisplayMode
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
getCurrentDisplayMode =
  Unsafe.sDL_GetCurrentDisplayMode

-- | Get information about the current display mode.
--
--     There\'s a difference between this function and @'getDesktopDisplayMode'@ when SDL runs fullscreen and has changed the resolution. In that case this function will return the current display mode, and not the previous native display mode.
--
--     [Returns]: a pointer to the desktop display mode or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDesktopDisplayMode', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCurrentDisplayMode@.
--                   The unsafe flavor is 'getCurrentDisplayMode'
--                   .
--
--     [C declaration]: @SDL_GetCurrentDisplayMode@, defined at @SDL3\/SDL_video.h 906:53@
getCurrentDisplayModeSafe
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
getCurrentDisplayModeSafe =
  Safe.sDL_GetCurrentDisplayMode

-- | Get the display containing a point.
--
--     [Returns]: the instance ID of the display containing the point or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDisplayForPoint@.
--                   The safe flavor is 'getDisplayForPointSafe'
--                   .
--
--     [C declaration]: @SDL_GetDisplayForPoint@, defined at @SDL3\/SDL_video.h 922:43@
getDisplayForPoint
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point
  -- ^
  --
  --           [@point@]: the point to query.
  -> IO SDL_DisplayID
getDisplayForPoint = Unsafe.sDL_GetDisplayForPoint

-- | Get the display containing a point.
--
--     [Returns]: the instance ID of the display containing the point or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDisplayForPoint@.
--                   The unsafe flavor is 'getDisplayForPoint'
--                   .
--
--     [C declaration]: @SDL_GetDisplayForPoint@, defined at @SDL3\/SDL_video.h 922:43@
getDisplayForPointSafe
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point
  -- ^
  --
  --           [@point@]: the point to query.
  -> IO SDL_DisplayID
getDisplayForPointSafe = Safe.sDL_GetDisplayForPoint

-- | Get the display primarily containing a rect.
--
--     [Returns]: the instance ID of the display entirely containing the rect or closest to the center of the rect on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDisplayForRect@.
--                   The safe flavor is 'getDisplayForRectSafe'
--                   .
--
--     [C declaration]: @SDL_GetDisplayForRect@, defined at @SDL3\/SDL_video.h 939:43@
getDisplayForRect
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the rect to query.
  -> IO SDL_DisplayID
getDisplayForRect = Unsafe.sDL_GetDisplayForRect

-- | Get the display primarily containing a rect.
--
--     [Returns]: the instance ID of the display entirely containing the rect or closest to the center of the rect on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDisplayForRect@.
--                   The unsafe flavor is 'getDisplayForRect'
--                   .
--
--     [C declaration]: @SDL_GetDisplayForRect@, defined at @SDL3\/SDL_video.h 939:43@
getDisplayForRectSafe
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the rect to query.
  -> IO SDL_DisplayID
getDisplayForRectSafe = Safe.sDL_GetDisplayForRect

-- | Get the display associated with a window.
--
--     [Returns]: the instance ID of the display containing the center of the window on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDisplayForWindow@.
--                   The safe flavor is 'getDisplayForWindowSafe'
--                   .
--
--     [C declaration]: @SDL_GetDisplayForWindow@, defined at @SDL3\/SDL_video.h 956:43@
getDisplayForWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_DisplayID
getDisplayForWindow = Unsafe.sDL_GetDisplayForWindow

-- | Get the display associated with a window.
--
--     [Returns]: the instance ID of the display containing the center of the window on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDisplayBounds', 'getDisplays'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDisplayForWindow@.
--                   The unsafe flavor is 'getDisplayForWindow'
--                   .
--
--     [C declaration]: @SDL_GetDisplayForWindow@, defined at @SDL3\/SDL_video.h 956:43@
getDisplayForWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_DisplayID
getDisplayForWindowSafe =
  Safe.sDL_GetDisplayForWindow

-- | Get the pixel density of a window.
--
--     This is a ratio of pixel size to window size. For example, if the window is 1920x1080 and it has a high density back buffer of 3840x2160 pixels, it would have a pixel density of 2.0.
--
--     [Returns]: the pixel density or 0.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowDisplayScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowPixelDensity@.
--                   The safe flavor is 'getWindowPixelDensitySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowPixelDensity@, defined at @SDL3\/SDL_video.h 975:35@
getWindowPixelDensity
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Float
getWindowPixelDensity =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetWindowPixelDensity x00)

-- | Get the pixel density of a window.
--
--     This is a ratio of pixel size to window size. For example, if the window is 1920x1080 and it has a high density back buffer of 3840x2160 pixels, it would have a pixel density of 2.0.
--
--     [Returns]: the pixel density or 0.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowDisplayScale'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowPixelDensity@.
--                   The unsafe flavor is 'getWindowPixelDensity'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowPixelDensity@, defined at @SDL3\/SDL_video.h 975:35@
getWindowPixelDensitySafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Float
getWindowPixelDensitySafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetWindowPixelDensity x00)

-- | Get the content display scale relative to a window\'s pixel size.
--
--     This is a combination of the window pixel density and the display content scale, and is the expected scale for displaying content in this window. For example, if a 3840x2160 window had a display scale of 2.0, the user expects the content to take twice as many pixels and be the same physical size as if it were being displayed in a 1920x1080 window with a display scale of 1.0.
--
--     Conceptually this value corresponds to the scale display setting, and is updated when that setting is changed, or the window moves to a display with a different scale setting.
--
--     [Returns]: the display scale, or 0.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowDisplayScale@.
--                   The safe flavor is 'getWindowDisplayScaleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowDisplayScale@, defined at @SDL3\/SDL_video.h 999:35@
getWindowDisplayScale
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Float
getWindowDisplayScale =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetWindowDisplayScale x00)

-- | Get the content display scale relative to a window\'s pixel size.
--
--     This is a combination of the window pixel density and the display content scale, and is the expected scale for displaying content in this window. For example, if a 3840x2160 window had a display scale of 2.0, the user expects the content to take twice as many pixels and be the same physical size as if it were being displayed in a 1920x1080 window with a display scale of 1.0.
--
--     Conceptually this value corresponds to the scale display setting, and is updated when that setting is changed, or the window moves to a display with a different scale setting.
--
--     [Returns]: the display scale, or 0.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowDisplayScale@.
--                   The unsafe flavor is 'getWindowDisplayScale'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowDisplayScale@, defined at @SDL3\/SDL_video.h 999:35@
getWindowDisplayScaleSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Float
getWindowDisplayScaleSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetWindowDisplayScale x00)

-- | Set the display mode to use when a window is visible and fullscreen.
--
--     This only affects the display mode used when the window is fullscreen. To change the window size when the window is not fullscreen, use @'setWindowSize'@.
--
--     If the window is currently in the fullscreen state, this request is asynchronous on some windowing systems and the new mode dimensions may not be applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the new mode takes effect, an SDL_EVENT_WINDOW_RESIZED and\/or an SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event will be emitted with the new mode dimensions.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFullscreenMode', 'setWindowFullscreen', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowFullscreenMode@.
--                   The safe flavor is 'setWindowFullscreenModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowFullscreenMode@, defined at @SDL3\/SDL_video.h 1034:34@
setWindowFullscreenMode
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to affect.
  -> PtrConst.PtrConst SDL_DisplayMode
  -- ^
  --
  --           [@mode@]: a pointer to the display mode to use, which can be NULL for borderless fullscreen desktop mode, or one of the fullscreen modes returned by @'getFullscreenDisplayModes'@ to set an exclusive fullscreen mode.
  -> IO Bool
setWindowFullscreenMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowFullscreenMode x00 x11)

-- | Set the display mode to use when a window is visible and fullscreen.
--
--     This only affects the display mode used when the window is fullscreen. To change the window size when the window is not fullscreen, use @'setWindowSize'@.
--
--     If the window is currently in the fullscreen state, this request is asynchronous on some windowing systems and the new mode dimensions may not be applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the new mode takes effect, an SDL_EVENT_WINDOW_RESIZED and\/or an SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event will be emitted with the new mode dimensions.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFullscreenMode', 'setWindowFullscreen', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowFullscreenMode@.
--                   The unsafe flavor is 'setWindowFullscreenMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowFullscreenMode@, defined at @SDL3\/SDL_video.h 1034:34@
setWindowFullscreenModeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to affect.
  -> PtrConst.PtrConst SDL_DisplayMode
  -- ^
  --
  --           [@mode@]: a pointer to the display mode to use, which can be NULL for borderless fullscreen desktop mode, or one of the fullscreen modes returned by @'getFullscreenDisplayModes'@ to set an exclusive fullscreen mode.
  -> IO Bool
setWindowFullscreenModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowFullscreenMode x00 x11)

-- | Query the display mode to use when a window is visible at fullscreen.
--
--     [Returns]: a pointer to the exclusive fullscreen mode to use or NULL for borderless fullscreen desktop mode.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowFullscreenMode', 'setWindowFullscreen'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowFullscreenMode@.
--                   The safe flavor is 'getWindowFullscreenModeSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowFullscreenMode@, defined at @SDL3\/SDL_video.h 1050:53@
getWindowFullscreenMode
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
getWindowFullscreenMode =
  Unsafe.sDL_GetWindowFullscreenMode

-- | Query the display mode to use when a window is visible at fullscreen.
--
--     [Returns]: a pointer to the exclusive fullscreen mode to use or NULL for borderless fullscreen desktop mode.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowFullscreenMode', 'setWindowFullscreen'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowFullscreenMode@.
--                   The unsafe flavor is 'getWindowFullscreenMode'
--                   .
--
--     [C declaration]: @SDL_GetWindowFullscreenMode@, defined at @SDL3\/SDL_video.h 1050:53@
getWindowFullscreenModeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
getWindowFullscreenModeSafe =
  Safe.sDL_GetWindowFullscreenMode

-- | Get the raw ICC profile data for the screen the window is currently on.
--
--     [Returns]: the raw ICC profile data on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowICCProfile@.
--                   The safe flavor is 'getWindowICCProfileSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowICCProfile@, defined at @SDL3\/SDL_video.h 1065:36@
getWindowICCProfile
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the size of the ICC profile.
  -> IO (BG.Ptr BG.Void)
getWindowICCProfile = Unsafe.sDL_GetWindowICCProfile

-- | Get the raw ICC profile data for the screen the window is currently on.
--
--     [Returns]: the raw ICC profile data on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowICCProfile@.
--                   The unsafe flavor is 'getWindowICCProfile'
--                   .
--
--     [C declaration]: @SDL_GetWindowICCProfile@, defined at @SDL3\/SDL_video.h 1065:36@
getWindowICCProfileSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the size of the ICC profile.
  -> IO (BG.Ptr BG.Void)
getWindowICCProfileSafe =
  Safe.sDL_GetWindowICCProfile

-- | Get the pixel format associated with the window.
--
--     [Returns]: the pixel format of the window on success or SDL_PIXELFORMAT_UNKNOWN on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowPixelFormat@.
--                   The safe flavor is 'getWindowPixelFormatSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowPixelFormat@, defined at @SDL3\/SDL_video.h 1079:45@
getWindowPixelFormat
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
getWindowPixelFormat =
  Unsafe.sDL_GetWindowPixelFormat

-- | Get the pixel format associated with the window.
--
--     [Returns]: the pixel format of the window on success or SDL_PIXELFORMAT_UNKNOWN on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowPixelFormat@.
--                   The unsafe flavor is 'getWindowPixelFormat'
--                   .
--
--     [C declaration]: @SDL_GetWindowPixelFormat@, defined at @SDL3\/SDL_video.h 1079:45@
getWindowPixelFormatSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
getWindowPixelFormatSafe =
  Safe.sDL_GetWindowPixelFormat

-- | Get a list of valid windows.
--
--     [Returns]: a NULL terminated array of 'SDL_Window' pointers or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindows@.
--                   The safe flavor is 'getWindowsSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindows@, defined at @SDL3\/SDL_video.h 1095:43@
getWindows
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of windows returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Window))
getWindows = Unsafe.sDL_GetWindows

-- | Get a list of valid windows.
--
--     [Returns]: a NULL terminated array of 'SDL_Window' pointers or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindows@.
--                   The unsafe flavor is 'getWindows'
--                   .
--
--     [C declaration]: @SDL_GetWindows@, defined at @SDL3\/SDL_video.h 1095:43@
getWindowsSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of windows returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Window))
getWindowsSafe = Safe.sDL_GetWindows

-- | Create a window with the specified dimensions and flags.
--
--     The window size is a request and may be different than expected based on the desktop layout and window manager policies. Your application should be prepared to handle a window of any size.
--
--     @flags@ may be any of the following OR\'d together:
--
--     * @SDL_WINDOW_FULLSCREEN@: fullscreen window at desktop resolution
--
--     * @SDL_WINDOW_OPENGL@: window usable with an OpenGL context
--
--     * @SDL_WINDOW_HIDDEN@: window is not visible
--
--     * @SDL_WINDOW_BORDERLESS@: no window decoration
--
--     * @SDL_WINDOW_RESIZABLE@: window can be resized
--
--     * @SDL_WINDOW_MINIMIZED@: window is minimized
--
--     * @SDL_WINDOW_MAXIMIZED@: window is maximized
--
--     * @SDL_WINDOW_MOUSE_GRABBED@: window has grabbed mouse focus
--
--     * @SDL_WINDOW_INPUT_FOCUS@: window has input focus
--
--     * @SDL_WINDOW_MOUSE_FOCUS@: window has mouse focus
--
--     * @SDL_WINDOW_EXTERNAL@: window not created by SDL
--
--     * @SDL_WINDOW_MODAL@: window is modal
--
--     * @SDL_WINDOW_HIGH_PIXEL_DENSITY@: window uses high pixel density back buffer if possible
--
--     * @SDL_WINDOW_MOUSE_CAPTURE@: window has mouse captured (unrelated to MOUSE_GRABBED)
--
--     * @SDL_WINDOW_ALWAYS_ON_TOP@: window should always be above others
--
--     * @SDL_WINDOW_UTILITY@: window should be treated as a utility window, not showing in the task bar and window list
--
--     * @SDL_WINDOW_TOOLTIP@: window should be treated as a tooltip and does not get mouse or keyboard focus, requires a parent window
--
--     * @SDL_WINDOW_POPUP_MENU@: window should be treated as a popup menu, requires a parent window
--
--     * @SDL_WINDOW_KEYBOARD_GRABBED@: window has grabbed keyboard input
--
--     * @SDL_WINDOW_VULKAN@: window usable with a Vulkan instance
--
--     * @SDL_WINDOW_METAL@: window usable with a Metal instance
--
--     * @SDL_WINDOW_TRANSPARENT@: window with transparent buffer
--
--     * @SDL_WINDOW_NOT_FOCUSABLE@: window should not be focusable
--
--     The 'SDL_Window' will be shown if SDL_WINDOW_HIDDEN is not set. If hidden at creation time, @'showWindow'@ can be used to show it later.
--
--     On Apple\'s macOS, you __must__ set the NSHighResolutionCapable Info.plist property to YES, otherwise you will not receive a High-DPI OpenGL canvas.
--
--     The window pixel size may differ from its window coordinate size if the window is on a high pixel density display. Use @'getWindowSize'@ to query the client area\'s size in window coordinates, and @'getWindowSizeInPixels'@ or 'SDL3.Sys.Render.getRenderOutputSize' to query the drawable size in pixels. Note that the drawable size can vary after the window is created and should be queried again if you get an SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event.
--
--     If the window is created with any of the SDL_WINDOW_OPENGL or SDL_WINDOW_VULKAN flags, then the corresponding LoadLibrary function (SDL_GL_LoadLibrary or SDL_Vulkan_LoadLibrary) is called and the corresponding UnloadLibrary function is called by @'destroyWindow'@.
--
--     If SDL_WINDOW_VULKAN is specified and there isn\'t a working Vulkan driver, @'createWindow'@ will fail, because 'SDL3.Sys.Vulkan.vulkanLoadLibrary' will fail.
--
--     If SDL_WINDOW_METAL is specified on an OS that does not support Metal, @'createWindow'@ will fail.
--
--     If you intend to use this window with an SDL_Renderer, you should use 'SDL3.Sys.Render.createWindowAndRenderer' instead of this function, to avoid window flicker.
--
--     On non-Apple devices, SDL requires you to either not link to the Vulkan loader or link to a dynamic library version. This limitation may be removed in a future version of SDL.
--
--     [Returns]: the window that was created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Render.createWindowAndRenderer', 'createPopupWindow', 'createWindowWithProperties', 'destroyWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateWindow@.
--                   The safe flavor is 'createWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateWindow@, defined at @SDL3\/SDL_video.h 1184:42@
createWindow
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: the title of the window, in UTF-8 encoding.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the window.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the window.
  -> SDL_WindowFlags
  -- ^
  --
  --           [@flags@]: 0, or one or more 'SDL_WindowFlags' OR\'d together.
  -> IO (BG.Ptr SDL_Window)
createWindow =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_CreateWindow x00 (Coerce.coerce x11) (Coerce.coerce x22) x33

-- | Create a window with the specified dimensions and flags.
--
--     The window size is a request and may be different than expected based on the desktop layout and window manager policies. Your application should be prepared to handle a window of any size.
--
--     @flags@ may be any of the following OR\'d together:
--
--     * @SDL_WINDOW_FULLSCREEN@: fullscreen window at desktop resolution
--
--     * @SDL_WINDOW_OPENGL@: window usable with an OpenGL context
--
--     * @SDL_WINDOW_HIDDEN@: window is not visible
--
--     * @SDL_WINDOW_BORDERLESS@: no window decoration
--
--     * @SDL_WINDOW_RESIZABLE@: window can be resized
--
--     * @SDL_WINDOW_MINIMIZED@: window is minimized
--
--     * @SDL_WINDOW_MAXIMIZED@: window is maximized
--
--     * @SDL_WINDOW_MOUSE_GRABBED@: window has grabbed mouse focus
--
--     * @SDL_WINDOW_INPUT_FOCUS@: window has input focus
--
--     * @SDL_WINDOW_MOUSE_FOCUS@: window has mouse focus
--
--     * @SDL_WINDOW_EXTERNAL@: window not created by SDL
--
--     * @SDL_WINDOW_MODAL@: window is modal
--
--     * @SDL_WINDOW_HIGH_PIXEL_DENSITY@: window uses high pixel density back buffer if possible
--
--     * @SDL_WINDOW_MOUSE_CAPTURE@: window has mouse captured (unrelated to MOUSE_GRABBED)
--
--     * @SDL_WINDOW_ALWAYS_ON_TOP@: window should always be above others
--
--     * @SDL_WINDOW_UTILITY@: window should be treated as a utility window, not showing in the task bar and window list
--
--     * @SDL_WINDOW_TOOLTIP@: window should be treated as a tooltip and does not get mouse or keyboard focus, requires a parent window
--
--     * @SDL_WINDOW_POPUP_MENU@: window should be treated as a popup menu, requires a parent window
--
--     * @SDL_WINDOW_KEYBOARD_GRABBED@: window has grabbed keyboard input
--
--     * @SDL_WINDOW_VULKAN@: window usable with a Vulkan instance
--
--     * @SDL_WINDOW_METAL@: window usable with a Metal instance
--
--     * @SDL_WINDOW_TRANSPARENT@: window with transparent buffer
--
--     * @SDL_WINDOW_NOT_FOCUSABLE@: window should not be focusable
--
--     The 'SDL_Window' will be shown if SDL_WINDOW_HIDDEN is not set. If hidden at creation time, @'showWindow'@ can be used to show it later.
--
--     On Apple\'s macOS, you __must__ set the NSHighResolutionCapable Info.plist property to YES, otherwise you will not receive a High-DPI OpenGL canvas.
--
--     The window pixel size may differ from its window coordinate size if the window is on a high pixel density display. Use @'getWindowSize'@ to query the client area\'s size in window coordinates, and @'getWindowSizeInPixels'@ or 'SDL3.Sys.Render.getRenderOutputSize' to query the drawable size in pixels. Note that the drawable size can vary after the window is created and should be queried again if you get an SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event.
--
--     If the window is created with any of the SDL_WINDOW_OPENGL or SDL_WINDOW_VULKAN flags, then the corresponding LoadLibrary function (SDL_GL_LoadLibrary or SDL_Vulkan_LoadLibrary) is called and the corresponding UnloadLibrary function is called by @'destroyWindow'@.
--
--     If SDL_WINDOW_VULKAN is specified and there isn\'t a working Vulkan driver, @'createWindow'@ will fail, because 'SDL3.Sys.Vulkan.vulkanLoadLibrary' will fail.
--
--     If SDL_WINDOW_METAL is specified on an OS that does not support Metal, @'createWindow'@ will fail.
--
--     If you intend to use this window with an SDL_Renderer, you should use 'SDL3.Sys.Render.createWindowAndRenderer' instead of this function, to avoid window flicker.
--
--     On non-Apple devices, SDL requires you to either not link to the Vulkan loader or link to a dynamic library version. This limitation may be removed in a future version of SDL.
--
--     [Returns]: the window that was created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Render.createWindowAndRenderer', 'createPopupWindow', 'createWindowWithProperties', 'destroyWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateWindow@.
--                   The unsafe flavor is 'createWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateWindow@, defined at @SDL3\/SDL_video.h 1184:42@
createWindowSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: the title of the window, in UTF-8 encoding.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the window.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the window.
  -> SDL_WindowFlags
  -- ^
  --
  --           [@flags@]: 0, or one or more 'SDL_WindowFlags' OR\'d together.
  -> IO (BG.Ptr SDL_Window)
createWindowSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_CreateWindow x00 (Coerce.coerce x11) (Coerce.coerce x22) x33

-- | Create a child popup window of the specified parent window.
--
--     The window size is a request and may be different than expected based on the desktop layout and window manager policies. Your application should be prepared to handle a window of any size.
--
--     The flags parameter __must__ contain at least one of the following:
--
--     * @SDL_WINDOW_TOOLTIP@: The popup window is a tooltip and will not pass any input events.
--
--     * @SDL_WINDOW_POPUP_MENU@: The popup window is a popup menu. The topmost popup menu will implicitly gain the keyboard focus.
--
--     The following flags are not relevant to popup window creation and will be ignored:
--
--     * @SDL_WINDOW_MINIMIZED@
--
--     * @SDL_WINDOW_MAXIMIZED@
--
--     * @SDL_WINDOW_FULLSCREEN@
--
--     * @SDL_WINDOW_BORDERLESS@
--
--     The following flags are incompatible with popup window creation and will cause it to fail:
--
--     * @SDL_WINDOW_UTILITY@
--
--     * @SDL_WINDOW_MODAL@
--
--     The parent parameter __must__ be non-null and a valid window. The parent of a popup window can be either a regular, toplevel window, or another popup window.
--
--     Popup windows cannot be minimized, maximized, made fullscreen, raised, flash, be made a modal window, be the parent of a toplevel window, or grab the mouse and\/or keyboard. Attempts to do so will fail.
--
--     Popup windows implicitly do not have a border\/decorations and do not appear on the taskbar\/dock or in lists of windows such as alt-tab menus.
--
--     By default, popup window positions will automatically be constrained to keep the entire window within display bounds. This can be overridden with the @'sDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN'@ property.
--
--     By default, popup menus will automatically grab keyboard focus from the parent when shown. This behavior can be overridden by setting the @SDL_WINDOW_NOT_FOCUSABLE@ flag, setting the @'sDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN'@ property to false, or toggling it after creation via the @'setWindowFocusable'@ function.
--
--     If a parent window is hidden or destroyed, any child popup windows will be recursively hidden or destroyed as well. Child popup windows not explicitly hidden will be restored when the parent is shown.
--
--     [Returns]: the window that was created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createWindow', 'createWindowWithProperties', 'destroyWindow', 'getWindowParent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreatePopupWindow@.
--                   The safe flavor is 'createPopupWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreatePopupWindow@, defined at @SDL3\/SDL_video.h 1260:42@
createPopupWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@parent@]: the parent of the window, must not be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@offset_x@]: the x position of the popup window relative to the origin of the parent.
  -> BG.Int32
  -- ^
  --
  --           [@offset_y@]: the y position of the popup window relative to the origin of the parent window.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the window.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the window.
  -> SDL_WindowFlags
  -- ^
  --
  --           [@flags@]: SDL_WINDOW_TOOLTIP or SDL_WINDOW_POPUP_MENU, and zero or more additional 'SDL_WindowFlags' OR\'d together.
  -> IO (BG.Ptr SDL_Window)
createPopupWindow =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Unsafe.sDL_CreatePopupWindow
                x00
                (Coerce.coerce x11)
                (Coerce.coerce x22)
                (Coerce.coerce x33)
                (Coerce.coerce x44)
                x55

-- | Create a child popup window of the specified parent window.
--
--     The window size is a request and may be different than expected based on the desktop layout and window manager policies. Your application should be prepared to handle a window of any size.
--
--     The flags parameter __must__ contain at least one of the following:
--
--     * @SDL_WINDOW_TOOLTIP@: The popup window is a tooltip and will not pass any input events.
--
--     * @SDL_WINDOW_POPUP_MENU@: The popup window is a popup menu. The topmost popup menu will implicitly gain the keyboard focus.
--
--     The following flags are not relevant to popup window creation and will be ignored:
--
--     * @SDL_WINDOW_MINIMIZED@
--
--     * @SDL_WINDOW_MAXIMIZED@
--
--     * @SDL_WINDOW_FULLSCREEN@
--
--     * @SDL_WINDOW_BORDERLESS@
--
--     The following flags are incompatible with popup window creation and will cause it to fail:
--
--     * @SDL_WINDOW_UTILITY@
--
--     * @SDL_WINDOW_MODAL@
--
--     The parent parameter __must__ be non-null and a valid window. The parent of a popup window can be either a regular, toplevel window, or another popup window.
--
--     Popup windows cannot be minimized, maximized, made fullscreen, raised, flash, be made a modal window, be the parent of a toplevel window, or grab the mouse and\/or keyboard. Attempts to do so will fail.
--
--     Popup windows implicitly do not have a border\/decorations and do not appear on the taskbar\/dock or in lists of windows such as alt-tab menus.
--
--     By default, popup window positions will automatically be constrained to keep the entire window within display bounds. This can be overridden with the @'sDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN'@ property.
--
--     By default, popup menus will automatically grab keyboard focus from the parent when shown. This behavior can be overridden by setting the @SDL_WINDOW_NOT_FOCUSABLE@ flag, setting the @'sDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN'@ property to false, or toggling it after creation via the @'setWindowFocusable'@ function.
--
--     If a parent window is hidden or destroyed, any child popup windows will be recursively hidden or destroyed as well. Child popup windows not explicitly hidden will be restored when the parent is shown.
--
--     [Returns]: the window that was created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createWindow', 'createWindowWithProperties', 'destroyWindow', 'getWindowParent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreatePopupWindow@.
--                   The unsafe flavor is 'createPopupWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreatePopupWindow@, defined at @SDL3\/SDL_video.h 1260:42@
createPopupWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@parent@]: the parent of the window, must not be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@offset_x@]: the x position of the popup window relative to the origin of the parent.
  -> BG.Int32
  -- ^
  --
  --           [@offset_y@]: the y position of the popup window relative to the origin of the parent window.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the window.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the window.
  -> SDL_WindowFlags
  -- ^
  --
  --           [@flags@]: SDL_WINDOW_TOOLTIP or SDL_WINDOW_POPUP_MENU, and zero or more additional 'SDL_WindowFlags' OR\'d together.
  -> IO (BG.Ptr SDL_Window)
createPopupWindowSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Safe.sDL_CreatePopupWindow
                x00
                (Coerce.coerce x11)
                (Coerce.coerce x22)
                (Coerce.coerce x33)
                (Coerce.coerce x44)
                x55

-- | Create a window with the specified properties.
--
--     The window size is a request and may be different than expected based on the desktop layout and window manager policies. Your application should be prepared to handle a window of any size.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN'@: true if the window should be always on top
--
--     * @'sDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN'@: true if the window has no window decoration
--
--     * @'sDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN'@: true if the \"tooltip\" and \"menu\" window types should be automatically constrained to be entirely within display bounds (default), false if no constraints on the position are desired.
--
--     * @'sDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN'@: true if the window will be used with an externally managed graphics context.
--
--     * @'sDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN'@: true if the window should accept keyboard input (defaults true)
--
--     * @'sDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN'@: true if the window should start in fullscreen mode at desktop resolution
--
--     * @'sDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER'@: the height of the window
--
--     * @'sDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN'@: true if the window should start hidden
--
--     * @'sDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN'@: true if the window uses a high pixel density buffer if possible
--
--     * @'sDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN'@: true if the window should start maximized
--
--     * @'sDL_PROP_WINDOW_CREATE_MENU_BOOLEAN'@: true if the window is a popup menu
--
--     * @'sDL_PROP_WINDOW_CREATE_METAL_BOOLEAN'@: true if the window will be used with Metal rendering
--
--     * @'sDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN'@: true if the window should start minimized
--
--     * @'sDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN'@: true if the window is modal to its parent
--
--     * @'sDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN'@: true if the window starts with grabbed mouse focus
--
--     * @'sDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN'@: true if the window will be used with OpenGL rendering
--
--     * @'sDL_PROP_WINDOW_CREATE_PARENT_POINTER'@: an 'SDL_Window' that will be the parent of this window, required for windows with the \"tooltip\", \"menu\", and \"modal\" properties
--
--     * @'sDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN'@: true if the window should be resizable
--
--     * @'sDL_PROP_WINDOW_CREATE_TITLE_STRING'@: the title of the window, in UTF-8 encoding
--
--     * @'sDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN'@: true if the window show transparent in the areas with alpha of 0
--
--     * @'sDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN'@: true if the window is a tooltip
--
--     * @'sDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN'@: true if the window is a utility window, not showing in the task bar and window list
--
--     * @'sDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN'@: true if the window will be used with Vulkan rendering
--
--     * @'sDL_PROP_WINDOW_CREATE_WIDTH_NUMBER'@: the width of the window
--
--     * @'sDL_PROP_WINDOW_CREATE_X_NUMBER'@: the x position of the window, or @'sDL_WINDOWPOS_CENTERED'@, defaults to @'sDL_WINDOWPOS_UNDEFINED'@. This is relative to the parent for windows with the \"tooltip\" or \"menu\" property set.
--
--     * @'sDL_PROP_WINDOW_CREATE_Y_NUMBER'@: the y position of the window, or @'sDL_WINDOWPOS_CENTERED'@, defaults to @'sDL_WINDOWPOS_UNDEFINED'@. This is relative to the parent for windows with the \"tooltip\" or \"menu\" property set.
--
--     These are additional supported properties on macOS:
--
--     * @'sDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER'@: the @(__unsafe_unretained)@ NSWindow associated with the window, if you want to wrap an existing window.
--
--     * @'sDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER'@: the @(__unsafe_unretained)@ NSView associated with the window, defaults to @[window contentView]@
--
--     These are additional supported properties on iOS, tvOS, and visionOS:
--
--     * @'sDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER'@: the @(__unsafe_unretained)@ UIWindowScene associated with the window, defaults to the active window scene.
--
--     These are additional supported properties on Wayland:
--
--     * @'sDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN'@ - true if the application wants to use the Wayland surface for a custom role and does not want it attached to an XDG toplevel window. See [README-wayland](README-wayland) for more information on using custom surfaces.
--
--     * @'sDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN'@ - true if the application wants an associated @wl_egl_window@ object to be created and attached to the window, even if the window does not have the OpenGL property or @SDL_WINDOW_OPENGL@ flag set.
--
--     * @'sDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER'@ - the wl_surface associated with the window, if you want to wrap an existing window. See [README-wayland](README-wayland) for more information.
--
--     These are additional supported properties on Windows:
--
--     * @'sDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER'@: the HWND associated with the window, if you want to wrap an existing window.
--
--     * @'sDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER'@: optional, another window to share pixel format with, useful for OpenGL windows
--
--     These are additional supported properties with X11:
--
--     * @'sDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER'@: the X11 Window associated with the window, if you want to wrap an existing window.
--
--     The window is implicitly shown if the \"hidden\" property is not set.
--
--     These are additional supported properties with Emscripten:
--
--     * @'sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING'@: the id given to the canvas element. This should start with a \'\#\' sign
--
--     * @'sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING'@: override the binding element for keyboard inputs for this canvas. The variable can be one of:
--
--     * \"\#window\": the javascript window object (default)
--
--     * \"\#document\": the javascript document object
--
--     * \"\#screen\": the javascript window.screen object
--
--     * \"\#canvas\": the WebGL canvas element
--
--     * \"\#none\": Don\'t bind anything at all
--
--     * any other string without a leading \# sign applies to the element on the page with that ID. Windows with the \"tooltip\" and \"menu\" properties are popup windows and have the behaviors and guidelines outlined in @'createPopupWindow'@.
--
--     If this window is being created to be used with an SDL_Renderer, you should not add a graphics API specific property (@'sDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN'@, etc), as SDL will handle that internally when it chooses a renderer. However, SDL might need to recreate your window at that point, which may cause the window to appear briefly, and then flicker as it is recreated. The correct approach to this is to create the window with the @'sDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN'@ property set to true, then create the renderer, then show the window with @'showWindow'@.
--
--     [Returns]: the window that was created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Properties.createProperties', 'createWindow', 'destroyWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateWindowWithProperties@.
--                   The safe flavor is 'createWindowWithPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_CreateWindowWithProperties@, defined at @SDL3\/SDL_video.h 1409:42@
createWindowWithProperties
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Window)
createWindowWithProperties =
  Unsafe.sDL_CreateWindowWithProperties

-- | Create a window with the specified properties.
--
--     The window size is a request and may be different than expected based on the desktop layout and window manager policies. Your application should be prepared to handle a window of any size.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN'@: true if the window should be always on top
--
--     * @'sDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN'@: true if the window has no window decoration
--
--     * @'sDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN'@: true if the \"tooltip\" and \"menu\" window types should be automatically constrained to be entirely within display bounds (default), false if no constraints on the position are desired.
--
--     * @'sDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN'@: true if the window will be used with an externally managed graphics context.
--
--     * @'sDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN'@: true if the window should accept keyboard input (defaults true)
--
--     * @'sDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN'@: true if the window should start in fullscreen mode at desktop resolution
--
--     * @'sDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER'@: the height of the window
--
--     * @'sDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN'@: true if the window should start hidden
--
--     * @'sDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN'@: true if the window uses a high pixel density buffer if possible
--
--     * @'sDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN'@: true if the window should start maximized
--
--     * @'sDL_PROP_WINDOW_CREATE_MENU_BOOLEAN'@: true if the window is a popup menu
--
--     * @'sDL_PROP_WINDOW_CREATE_METAL_BOOLEAN'@: true if the window will be used with Metal rendering
--
--     * @'sDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN'@: true if the window should start minimized
--
--     * @'sDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN'@: true if the window is modal to its parent
--
--     * @'sDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN'@: true if the window starts with grabbed mouse focus
--
--     * @'sDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN'@: true if the window will be used with OpenGL rendering
--
--     * @'sDL_PROP_WINDOW_CREATE_PARENT_POINTER'@: an 'SDL_Window' that will be the parent of this window, required for windows with the \"tooltip\", \"menu\", and \"modal\" properties
--
--     * @'sDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN'@: true if the window should be resizable
--
--     * @'sDL_PROP_WINDOW_CREATE_TITLE_STRING'@: the title of the window, in UTF-8 encoding
--
--     * @'sDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN'@: true if the window show transparent in the areas with alpha of 0
--
--     * @'sDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN'@: true if the window is a tooltip
--
--     * @'sDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN'@: true if the window is a utility window, not showing in the task bar and window list
--
--     * @'sDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN'@: true if the window will be used with Vulkan rendering
--
--     * @'sDL_PROP_WINDOW_CREATE_WIDTH_NUMBER'@: the width of the window
--
--     * @'sDL_PROP_WINDOW_CREATE_X_NUMBER'@: the x position of the window, or @'sDL_WINDOWPOS_CENTERED'@, defaults to @'sDL_WINDOWPOS_UNDEFINED'@. This is relative to the parent for windows with the \"tooltip\" or \"menu\" property set.
--
--     * @'sDL_PROP_WINDOW_CREATE_Y_NUMBER'@: the y position of the window, or @'sDL_WINDOWPOS_CENTERED'@, defaults to @'sDL_WINDOWPOS_UNDEFINED'@. This is relative to the parent for windows with the \"tooltip\" or \"menu\" property set.
--
--     These are additional supported properties on macOS:
--
--     * @'sDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER'@: the @(__unsafe_unretained)@ NSWindow associated with the window, if you want to wrap an existing window.
--
--     * @'sDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER'@: the @(__unsafe_unretained)@ NSView associated with the window, defaults to @[window contentView]@
--
--     These are additional supported properties on iOS, tvOS, and visionOS:
--
--     * @'sDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER'@: the @(__unsafe_unretained)@ UIWindowScene associated with the window, defaults to the active window scene.
--
--     These are additional supported properties on Wayland:
--
--     * @'sDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN'@ - true if the application wants to use the Wayland surface for a custom role and does not want it attached to an XDG toplevel window. See [README-wayland](README-wayland) for more information on using custom surfaces.
--
--     * @'sDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN'@ - true if the application wants an associated @wl_egl_window@ object to be created and attached to the window, even if the window does not have the OpenGL property or @SDL_WINDOW_OPENGL@ flag set.
--
--     * @'sDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER'@ - the wl_surface associated with the window, if you want to wrap an existing window. See [README-wayland](README-wayland) for more information.
--
--     These are additional supported properties on Windows:
--
--     * @'sDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER'@: the HWND associated with the window, if you want to wrap an existing window.
--
--     * @'sDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER'@: optional, another window to share pixel format with, useful for OpenGL windows
--
--     These are additional supported properties with X11:
--
--     * @'sDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER'@: the X11 Window associated with the window, if you want to wrap an existing window.
--
--     The window is implicitly shown if the \"hidden\" property is not set.
--
--     These are additional supported properties with Emscripten:
--
--     * @'sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING'@: the id given to the canvas element. This should start with a \'\#\' sign
--
--     * @'sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING'@: override the binding element for keyboard inputs for this canvas. The variable can be one of:
--
--     * \"\#window\": the javascript window object (default)
--
--     * \"\#document\": the javascript document object
--
--     * \"\#screen\": the javascript window.screen object
--
--     * \"\#canvas\": the WebGL canvas element
--
--     * \"\#none\": Don\'t bind anything at all
--
--     * any other string without a leading \# sign applies to the element on the page with that ID. Windows with the \"tooltip\" and \"menu\" properties are popup windows and have the behaviors and guidelines outlined in @'createPopupWindow'@.
--
--     If this window is being created to be used with an SDL_Renderer, you should not add a graphics API specific property (@'sDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN'@, etc), as SDL will handle that internally when it chooses a renderer. However, SDL might need to recreate your window at that point, which may cause the window to appear briefly, and then flicker as it is recreated. The correct approach to this is to create the window with the @'sDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN'@ property set to true, then create the renderer, then show the window with @'showWindow'@.
--
--     [Returns]: the window that was created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Properties.createProperties', 'createWindow', 'destroyWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateWindowWithProperties@.
--                   The unsafe flavor is 'createWindowWithProperties'
--                   .
--
--     [C declaration]: @SDL_CreateWindowWithProperties@, defined at @SDL3\/SDL_video.h 1409:42@
createWindowWithPropertiesSafe
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Window)
createWindowWithPropertiesSafe =
  Safe.sDL_CreateWindowWithProperties

-- | Get the numeric ID of a window.
--
--     The numeric ID is what SDL_WindowEvent references, and is necessary to map these events to specific 'SDL_Window' objects.
--
--     [Returns]: the ID of the window on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFromID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowID@.
--                   The safe flavor is 'getWindowIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowID@, defined at @SDL3\/SDL_video.h 1466:42@
getWindowID
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_WindowID
getWindowID = Unsafe.sDL_GetWindowID

-- | Get the numeric ID of a window.
--
--     The numeric ID is what SDL_WindowEvent references, and is necessary to map these events to specific 'SDL_Window' objects.
--
--     [Returns]: the ID of the window on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFromID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowID@.
--                   The unsafe flavor is 'getWindowID'
--                   .
--
--     [C declaration]: @SDL_GetWindowID@, defined at @SDL3\/SDL_video.h 1466:42@
getWindowIDSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_WindowID
getWindowIDSafe = Safe.sDL_GetWindowID

-- | Get a window from a stored ID.
--
--     The numeric ID is what SDL_WindowEvent references, and is necessary to map these events to specific 'SDL_Window' objects.
--
--     [Returns]: the window associated with @id@ or NULL if it doesn\'t exist; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowFromID@.
--                   The safe flavor is 'getWindowFromIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowFromID@, defined at @SDL3\/SDL_video.h 1484:42@
getWindowFromID
  :: SDL_WindowID
  -- ^
  --
  --           [@id@]: the ID of the window.
  -> IO (BG.Ptr SDL_Window)
getWindowFromID = Unsafe.sDL_GetWindowFromID

-- | Get a window from a stored ID.
--
--     The numeric ID is what SDL_WindowEvent references, and is necessary to map these events to specific 'SDL_Window' objects.
--
--     [Returns]: the window associated with @id@ or NULL if it doesn\'t exist; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowFromID@.
--                   The unsafe flavor is 'getWindowFromID'
--                   .
--
--     [C declaration]: @SDL_GetWindowFromID@, defined at @SDL3\/SDL_video.h 1484:42@
getWindowFromIDSafe
  :: SDL_WindowID
  -- ^
  --
  --           [@id@]: the ID of the window.
  -> IO (BG.Ptr SDL_Window)
getWindowFromIDSafe = Safe.sDL_GetWindowFromID

-- | Get parent of a window.
--
--     [Returns]: the parent of the window on success or NULL if the window has no parent.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createPopupWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowParent@.
--                   The safe flavor is 'getWindowParentSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowParent@, defined at @SDL3\/SDL_video.h 1499:42@
getWindowParent
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (BG.Ptr SDL_Window)
getWindowParent = Unsafe.sDL_GetWindowParent

-- | Get parent of a window.
--
--     [Returns]: the parent of the window on success or NULL if the window has no parent.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createPopupWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowParent@.
--                   The unsafe flavor is 'getWindowParent'
--                   .
--
--     [C declaration]: @SDL_GetWindowParent@, defined at @SDL3\/SDL_video.h 1499:42@
getWindowParentSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (BG.Ptr SDL_Window)
getWindowParentSafe = Safe.sDL_GetWindowParent

-- | Get the properties associated with a window.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_WINDOW_SHAPE_POINTER'@: the surface associated with a shaped window
--
--     * @'sDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN'@: true if the window has HDR headroom above the SDR white point. This property can change dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
--
--     * @'sDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT'@: the value of SDR white in the SDL_COLORSPACE_SRGB_LINEAR colorspace. On Windows this corresponds to the SDR white level in scRGB colorspace, and on Apple platforms this is always 1.0 for EDR content. This property can change dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
--
--     * @'sDL_PROP_WINDOW_HDR_HEADROOM_FLOAT'@: the additional high dynamic range that can be displayed, in terms of the SDR white point. When HDR is not enabled, this will be 1.0. This property can change dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
--
--     On Android:
--
--     * @'sDL_PROP_WINDOW_ANDROID_WINDOW_POINTER'@: the ANativeWindow associated with the window
--
--     * @'sDL_PROP_WINDOW_ANDROID_SURFACE_POINTER'@: the EGLSurface associated with the window
--
--     On iOS:
--
--     * @'sDL_PROP_WINDOW_UIKIT_WINDOW_POINTER'@: the @(__unsafe_unretained)@ UIWindow associated with the window
--
--     * @'sDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER'@: the NSInteger tag associated with metal views on the window
--
--     * @'sDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER'@: the OpenGL view\'s framebuffer object. It must be bound when rendering to the screen using OpenGL.
--
--     * @'sDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER'@: the OpenGL view\'s renderbuffer object. It must be bound when 'glSwapWindow' is called.
--
--     * @'sDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER'@: the OpenGL view\'s resolve framebuffer, when MSAA is used.
--
--     On KMS\/DRM:
--
--     * @'sDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER'@: the device index associated with the window (e.g. the X in \/dev\/dri\/cardX)
--
--     * @'sDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER'@: the DRM FD associated with the window
--
--     * @'sDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER'@: the GBM device associated with the window
--
--     On macOS:
--
--     * @'sDL_PROP_WINDOW_COCOA_WINDOW_POINTER'@: the @(__unsafe_unretained)@ NSWindow associated with the window
--
--     * @'sDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER'@: the NSInteger tag associated with metal views on the window
--
--     On OpenVR:
--
--     * @'sDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER'@: the OpenVR Overlay Handle ID for the associated overlay window.
--
--     On Vivante:
--
--     * @'sDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER'@: the EGLNativeDisplayType associated with the window
--
--     * @'sDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER'@: the EGLNativeWindowType associated with the window
--
--     * @'sDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER'@: the EGLSurface associated with the window
--
--     On Windows:
--
--     * @'sDL_PROP_WINDOW_WIN32_HWND_POINTER'@: the HWND associated with the window
--
--     * @'sDL_PROP_WINDOW_WIN32_HDC_POINTER'@: the HDC associated with the window
--
--     * @'sDL_PROP_WINDOW_WIN32_INSTANCE_POINTER'@: the HINSTANCE associated with the window
--
--     On Wayland:
--
--     Note: The @xdg_*@ window objects do not internally persist across window show\/hide calls. They will be null if the window is hidden and must be queried each time it is shown.
--
--     * @'sDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER'@: the wl_display associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER'@: the wl_surface associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER'@: the wp_viewport associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER'@: the wl_egl_window associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER'@: the xdg_surface associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER'@: the xdg_toplevel role associated with the window
--
--     * \'SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING\': the export handle associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER'@: the xdg_popup role associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER'@: the xdg_positioner associated with the window, in popup mode
--
--     On X11:
--
--     * @'sDL_PROP_WINDOW_X11_DISPLAY_POINTER'@: the X11 Display associated with the window
--
--     * @'sDL_PROP_WINDOW_X11_SCREEN_NUMBER'@: the screen number associated with the window
--
--     * @'sDL_PROP_WINDOW_X11_WINDOW_NUMBER'@: the X11 Window associated with the window
--
--     On Emscripten:
--
--     * @'sDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING'@: the id the canvas element will have
--
--     * @'sDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING'@: the keyboard element that associates keyboard events to this window
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowProperties@.
--                   The safe flavor is 'getWindowPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowProperties@, defined at @SDL3\/SDL_video.h 1628:46@
getWindowProperties
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getWindowProperties = Unsafe.sDL_GetWindowProperties

-- | Get the properties associated with a window.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_WINDOW_SHAPE_POINTER'@: the surface associated with a shaped window
--
--     * @'sDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN'@: true if the window has HDR headroom above the SDR white point. This property can change dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
--
--     * @'sDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT'@: the value of SDR white in the SDL_COLORSPACE_SRGB_LINEAR colorspace. On Windows this corresponds to the SDR white level in scRGB colorspace, and on Apple platforms this is always 1.0 for EDR content. This property can change dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
--
--     * @'sDL_PROP_WINDOW_HDR_HEADROOM_FLOAT'@: the additional high dynamic range that can be displayed, in terms of the SDR white point. When HDR is not enabled, this will be 1.0. This property can change dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
--
--     On Android:
--
--     * @'sDL_PROP_WINDOW_ANDROID_WINDOW_POINTER'@: the ANativeWindow associated with the window
--
--     * @'sDL_PROP_WINDOW_ANDROID_SURFACE_POINTER'@: the EGLSurface associated with the window
--
--     On iOS:
--
--     * @'sDL_PROP_WINDOW_UIKIT_WINDOW_POINTER'@: the @(__unsafe_unretained)@ UIWindow associated with the window
--
--     * @'sDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER'@: the NSInteger tag associated with metal views on the window
--
--     * @'sDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER'@: the OpenGL view\'s framebuffer object. It must be bound when rendering to the screen using OpenGL.
--
--     * @'sDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER'@: the OpenGL view\'s renderbuffer object. It must be bound when 'glSwapWindow' is called.
--
--     * @'sDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER'@: the OpenGL view\'s resolve framebuffer, when MSAA is used.
--
--     On KMS\/DRM:
--
--     * @'sDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER'@: the device index associated with the window (e.g. the X in \/dev\/dri\/cardX)
--
--     * @'sDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER'@: the DRM FD associated with the window
--
--     * @'sDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER'@: the GBM device associated with the window
--
--     On macOS:
--
--     * @'sDL_PROP_WINDOW_COCOA_WINDOW_POINTER'@: the @(__unsafe_unretained)@ NSWindow associated with the window
--
--     * @'sDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER'@: the NSInteger tag associated with metal views on the window
--
--     On OpenVR:
--
--     * @'sDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER'@: the OpenVR Overlay Handle ID for the associated overlay window.
--
--     On Vivante:
--
--     * @'sDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER'@: the EGLNativeDisplayType associated with the window
--
--     * @'sDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER'@: the EGLNativeWindowType associated with the window
--
--     * @'sDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER'@: the EGLSurface associated with the window
--
--     On Windows:
--
--     * @'sDL_PROP_WINDOW_WIN32_HWND_POINTER'@: the HWND associated with the window
--
--     * @'sDL_PROP_WINDOW_WIN32_HDC_POINTER'@: the HDC associated with the window
--
--     * @'sDL_PROP_WINDOW_WIN32_INSTANCE_POINTER'@: the HINSTANCE associated with the window
--
--     On Wayland:
--
--     Note: The @xdg_*@ window objects do not internally persist across window show\/hide calls. They will be null if the window is hidden and must be queried each time it is shown.
--
--     * @'sDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER'@: the wl_display associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER'@: the wl_surface associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER'@: the wp_viewport associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER'@: the wl_egl_window associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER'@: the xdg_surface associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER'@: the xdg_toplevel role associated with the window
--
--     * \'SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING\': the export handle associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER'@: the xdg_popup role associated with the window
--
--     * @'sDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER'@: the xdg_positioner associated with the window, in popup mode
--
--     On X11:
--
--     * @'sDL_PROP_WINDOW_X11_DISPLAY_POINTER'@: the X11 Display associated with the window
--
--     * @'sDL_PROP_WINDOW_X11_SCREEN_NUMBER'@: the screen number associated with the window
--
--     * @'sDL_PROP_WINDOW_X11_WINDOW_NUMBER'@: the X11 Window associated with the window
--
--     On Emscripten:
--
--     * @'sDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING'@: the id the canvas element will have
--
--     * @'sDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING'@: the keyboard element that associates keyboard events to this window
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowProperties@.
--                   The unsafe flavor is 'getWindowProperties'
--                   .
--
--     [C declaration]: @SDL_GetWindowProperties@, defined at @SDL3\/SDL_video.h 1628:46@
getWindowPropertiesSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getWindowPropertiesSafe =
  Safe.sDL_GetWindowProperties

-- | Get the window flags.
--
--     [Returns]: a mask of the 'SDL_WindowFlags' associated with @window@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createWindow', 'hideWindow', 'maximizeWindow', 'minimizeWindow', 'setWindowFullscreen', 'setWindowMouseGrab', 'setWindowFillDocument', 'showWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowFlags@.
--                   The safe flavor is 'getWindowFlagsSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowFlags@, defined at @SDL3\/SDL_video.h 1687:45@
getWindowFlags
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_WindowFlags
getWindowFlags = Unsafe.sDL_GetWindowFlags

-- | Get the window flags.
--
--     [Returns]: a mask of the 'SDL_WindowFlags' associated with @window@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createWindow', 'hideWindow', 'maximizeWindow', 'minimizeWindow', 'setWindowFullscreen', 'setWindowMouseGrab', 'setWindowFillDocument', 'showWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowFlags@.
--                   The unsafe flavor is 'getWindowFlags'
--                   .
--
--     [C declaration]: @SDL_GetWindowFlags@, defined at @SDL3\/SDL_video.h 1687:45@
getWindowFlagsSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_WindowFlags
getWindowFlagsSafe = Safe.sDL_GetWindowFlags

-- | Set the title of a window.
--
--     This string is expected to be in UTF-8 encoding.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowTitle'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowTitle@.
--                   The safe flavor is 'setWindowTitleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowTitle@, defined at @SDL3\/SDL_video.h 1705:34@
setWindowTitle
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: the desired window title in UTF-8 format.
  -> IO Bool
setWindowTitle =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowTitle x00 x11)

-- | Set the title of a window.
--
--     This string is expected to be in UTF-8 encoding.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowTitle'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowTitle@.
--                   The unsafe flavor is 'setWindowTitle'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowTitle@, defined at @SDL3\/SDL_video.h 1705:34@
setWindowTitleSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: the desired window title in UTF-8 format.
  -> IO Bool
setWindowTitleSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowTitle x00 x11)

-- | Get the title of a window.
--
--     [Returns]: the title of the window in UTF-8 format or \"\" if there is no title.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowTitle'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowTitle@.
--                   The safe flavor is 'getWindowTitleSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowTitle@, defined at @SDL3\/SDL_video.h 1720:42@
getWindowTitle
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getWindowTitle = Unsafe.sDL_GetWindowTitle

-- | Get the title of a window.
--
--     [Returns]: the title of the window in UTF-8 format or \"\" if there is no title.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowTitle'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowTitle@.
--                   The unsafe flavor is 'getWindowTitle'
--                   .
--
--     [C declaration]: @SDL_GetWindowTitle@, defined at @SDL3\/SDL_video.h 1720:42@
getWindowTitleSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getWindowTitleSafe = Safe.sDL_GetWindowTitle

-- | Set the icon for a window.
--
--     If this function is passed a surface with alternate representations added using 'SDL3.Sys.Surface.addSurfaceAlternateImage', the surface will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations. For example, if the original surface is 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Surface.addSurfaceAlternateImage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowIcon@.
--                   The safe flavor is 'setWindowIconSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowIcon@, defined at @SDL3\/SDL_video.h 1747:34@
setWindowIcon
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@icon@]: an SDL_Surface structure containing the icon for the window.
  -> IO Bool
setWindowIcon =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowIcon x00 x11)

-- | Set the icon for a window.
--
--     If this function is passed a surface with alternate representations added using 'SDL3.Sys.Surface.addSurfaceAlternateImage', the surface will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations. For example, if the original surface is 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Surface.addSurfaceAlternateImage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowIcon@.
--                   The unsafe flavor is 'setWindowIcon'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowIcon@, defined at @SDL3\/SDL_video.h 1747:34@
setWindowIconSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@icon@]: an SDL_Surface structure containing the icon for the window.
  -> IO Bool
setWindowIconSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowIcon x00 x11)

-- | Request that the window\'s position be set.
--
--     If the window is in an exclusive fullscreen or maximized state, this request has no effect.
--
--     This can be used to reposition fullscreen-desktop windows onto a different display, however, as exclusive fullscreen windows are locked to a specific display, they can only be repositioned programmatically via @'setWindowFullscreenMode'@.
--
--     On some windowing systems this request is asynchronous and the new coordinates may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window position changes, an SDL_EVENT_WINDOW_MOVED event will be emitted with the window\'s new coordinates. Note that the new coordinates may not match the exact coordinates requested, as some windowing systems can restrict the position of the window in certain scenarios (e.g. constraining the position so the window is always within desktop bounds). Additionally, as this is just a request, it can be denied by the windowing system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowPosition', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowPosition@.
--                   The safe flavor is 'setWindowPositionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowPosition@, defined at @SDL3\/SDL_video.h 1788:34@
setWindowPosition
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to reposition.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the x coordinate of the window, or @'sDL_WINDOWPOS_CENTERED'@ or @'sDL_WINDOWPOS_UNDEFINED'@.
  -> BG.Int32
  -- ^
  --
  --           [@y@]: the y coordinate of the window, or @'sDL_WINDOWPOS_CENTERED'@ or @'sDL_WINDOWPOS_UNDEFINED'@.
  -> IO Bool
setWindowPosition =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetWindowPosition x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Request that the window\'s position be set.
--
--     If the window is in an exclusive fullscreen or maximized state, this request has no effect.
--
--     This can be used to reposition fullscreen-desktop windows onto a different display, however, as exclusive fullscreen windows are locked to a specific display, they can only be repositioned programmatically via @'setWindowFullscreenMode'@.
--
--     On some windowing systems this request is asynchronous and the new coordinates may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window position changes, an SDL_EVENT_WINDOW_MOVED event will be emitted with the window\'s new coordinates. Note that the new coordinates may not match the exact coordinates requested, as some windowing systems can restrict the position of the window in certain scenarios (e.g. constraining the position so the window is always within desktop bounds). Additionally, as this is just a request, it can be denied by the windowing system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowPosition', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowPosition@.
--                   The unsafe flavor is 'setWindowPosition'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowPosition@, defined at @SDL3\/SDL_video.h 1788:34@
setWindowPositionSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to reposition.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the x coordinate of the window, or @'sDL_WINDOWPOS_CENTERED'@ or @'sDL_WINDOWPOS_UNDEFINED'@.
  -> BG.Int32
  -- ^
  --
  --           [@y@]: the y coordinate of the window, or @'sDL_WINDOWPOS_CENTERED'@ or @'sDL_WINDOWPOS_UNDEFINED'@.
  -> IO Bool
setWindowPositionSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetWindowPosition x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Get the position of a window.
--
--     This is the current position of the window as last reported by the windowing system.
--
--     If you do not need the value for one of the positions a NULL may be passed in the @x@ or @y@ parameter.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowPosition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowPosition@.
--                   The safe flavor is 'getWindowPositionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowPosition@, defined at @SDL3\/SDL_video.h 1813:34@
getWindowPosition
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@x@]: a pointer filled in with the x position of the window, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@y@]: a pointer filled in with the y position of the window, may be NULL.
  -> IO Bool
getWindowPosition =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetWindowPosition x00 x11 x22)

-- | Get the position of a window.
--
--     This is the current position of the window as last reported by the windowing system.
--
--     If you do not need the value for one of the positions a NULL may be passed in the @x@ or @y@ parameter.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowPosition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowPosition@.
--                   The unsafe flavor is 'getWindowPosition'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowPosition@, defined at @SDL3\/SDL_video.h 1813:34@
getWindowPositionSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@x@]: a pointer filled in with the x position of the window, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@y@]: a pointer filled in with the y position of the window, may be NULL.
  -> IO Bool
getWindowPositionSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetWindowPosition x00 x11 x22)

-- | Request that the size of a window\'s client area be set.
--
--     If the window is in a fullscreen or maximized state, this request has no effect.
--
--     To change the exclusive fullscreen mode of a window, use @'setWindowFullscreenMode'@.
--
--     On some windowing systems, this request is asynchronous and the new window size may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be emitted with the new window dimensions. Note that the new dimensions may not match the exact size requested, as some windowing systems can restrict the window size in certain scenarios (e.g. constraining the size of the content area to remain within the usable desktop bounds). Additionally, as this is just a request, it can be denied by the windowing system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSize', 'setWindowFullscreenMode', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowSize@.
--                   The safe flavor is 'setWindowSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowSize@, defined at @SDL3\/SDL_video.h 1850:34@
setWindowSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the window, must be > 0.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the window, must be > 0.
  -> IO Bool
setWindowSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetWindowSize x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Request that the size of a window\'s client area be set.
--
--     If the window is in a fullscreen or maximized state, this request has no effect.
--
--     To change the exclusive fullscreen mode of a window, use @'setWindowFullscreenMode'@.
--
--     On some windowing systems, this request is asynchronous and the new window size may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be emitted with the new window dimensions. Note that the new dimensions may not match the exact size requested, as some windowing systems can restrict the window size in certain scenarios (e.g. constraining the size of the content area to remain within the usable desktop bounds). Additionally, as this is just a request, it can be denied by the windowing system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSize', 'setWindowFullscreenMode', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowSize@.
--                   The unsafe flavor is 'setWindowSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowSize@, defined at @SDL3\/SDL_video.h 1850:34@
setWindowSizeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the window, must be > 0.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the window, must be > 0.
  -> IO Bool
setWindowSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetWindowSize x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Get the size of a window\'s client area.
--
--     The window pixel size may differ from its window coordinate size if the window is on a high pixel density display. Use @'getWindowSizeInPixels'@ or 'SDL3.Sys.Render.getRenderOutputSize' to get the real client area size in pixels.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Render.getRenderOutputSize', 'getWindowSizeInPixels', 'setWindowSize', SDL_EVENT_WINDOW_RESIZED
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowSize@.
--                   The safe flavor is 'getWindowSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowSize@, defined at @SDL3\/SDL_video.h 1874:34@
getWindowSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query the width and height from.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer filled in with the width of the window, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer filled in with the height of the window, may be NULL.
  -> IO Bool
getWindowSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetWindowSize x00 x11 x22)

-- | Get the size of a window\'s client area.
--
--     The window pixel size may differ from its window coordinate size if the window is on a high pixel density display. Use @'getWindowSizeInPixels'@ or 'SDL3.Sys.Render.getRenderOutputSize' to get the real client area size in pixels.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Render.getRenderOutputSize', 'getWindowSizeInPixels', 'setWindowSize', SDL_EVENT_WINDOW_RESIZED
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowSize@.
--                   The unsafe flavor is 'getWindowSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowSize@, defined at @SDL3\/SDL_video.h 1874:34@
getWindowSizeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query the width and height from.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer filled in with the width of the window, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer filled in with the height of the window, may be NULL.
  -> IO Bool
getWindowSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetWindowSize x00 x11 x22)

-- | Get the safe area for this window.
--
--     Some devices have portions of the screen which are partially obscured or not interactive, possibly due to on-screen controls, curved edges, camera notches, TV overscan, etc. This function provides the area of the window which is safe to have interactable content. You should continue rendering into the rest of the window, but it should not contain visually important or interactable content.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowSafeArea@.
--                   The safe flavor is 'getWindowSafeAreaSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowSafeArea@, defined at @SDL3\/SDL_video.h 1896:34@
getWindowSafeArea
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer filled in with the client area that is safe for interactive content.
  -> IO Bool
getWindowSafeArea =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetWindowSafeArea x00 x11)

-- | Get the safe area for this window.
--
--     Some devices have portions of the screen which are partially obscured or not interactive, possibly due to on-screen controls, curved edges, camera notches, TV overscan, etc. This function provides the area of the window which is safe to have interactable content. You should continue rendering into the rest of the window, but it should not contain visually important or interactable content.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowSafeArea@.
--                   The unsafe flavor is 'getWindowSafeArea'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowSafeArea@, defined at @SDL3\/SDL_video.h 1896:34@
getWindowSafeAreaSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer filled in with the client area that is safe for interactive content.
  -> IO Bool
getWindowSafeAreaSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetWindowSafeArea x00 x11)

-- | Request that the aspect ratio of a window\'s client area be set.
--
--     The aspect ratio is the ratio of width divided by height, e.g. 2560x1600 would be 1.6. Larger aspect ratios are wider and smaller aspect ratios are narrower.
--
--     If, at the time of this request, the window in a fixed-size state, such as maximized or fullscreen, the request will be deferred until the window exits this state and becomes resizable again.
--
--     On some windowing systems, this request is asynchronous and the new window aspect ratio may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be emitted with the new window dimensions. Note that the new dimensions may not match the exact aspect ratio requested, as some windowing systems can restrict the window size in certain scenarios (e.g. constraining the size of the content area to remain within the usable desktop bounds). Additionally, as this is just a request, it can be denied by the windowing system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowAspectRatio', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowAspectRatio@.
--                   The safe flavor is 'setWindowAspectRatioSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowAspectRatio@, defined at @SDL3\/SDL_video.h 1937:34@
setWindowAspectRatio
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> Float
  -- ^
  --
  --           [@min_aspect@]: the minimum aspect ratio of the window, or 0.0f for no limit.
  -> Float
  -- ^
  --
  --           [@max_aspect@]: the maximum aspect ratio of the window, or 0.0f for no limit.
  -> IO Bool
setWindowAspectRatio =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetWindowAspectRatio x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Request that the aspect ratio of a window\'s client area be set.
--
--     The aspect ratio is the ratio of width divided by height, e.g. 2560x1600 would be 1.6. Larger aspect ratios are wider and smaller aspect ratios are narrower.
--
--     If, at the time of this request, the window in a fixed-size state, such as maximized or fullscreen, the request will be deferred until the window exits this state and becomes resizable again.
--
--     On some windowing systems, this request is asynchronous and the new window aspect ratio may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be emitted with the new window dimensions. Note that the new dimensions may not match the exact aspect ratio requested, as some windowing systems can restrict the window size in certain scenarios (e.g. constraining the size of the content area to remain within the usable desktop bounds). Additionally, as this is just a request, it can be denied by the windowing system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowAspectRatio', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowAspectRatio@.
--                   The unsafe flavor is 'setWindowAspectRatio'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowAspectRatio@, defined at @SDL3\/SDL_video.h 1937:34@
setWindowAspectRatioSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> Float
  -- ^
  --
  --           [@min_aspect@]: the minimum aspect ratio of the window, or 0.0f for no limit.
  -> Float
  -- ^
  --
  --           [@max_aspect@]: the maximum aspect ratio of the window, or 0.0f for no limit.
  -> IO Bool
setWindowAspectRatioSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetWindowAspectRatio x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Get the aspect ratio of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowAspectRatio'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowAspectRatio@.
--                   The safe flavor is 'getWindowAspectRatioSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowAspectRatio@, defined at @SDL3\/SDL_video.h 1956:34@
getWindowAspectRatio
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query the width and height from.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@min_aspect@]: a pointer filled in with the minimum aspect ratio of the window, may be NULL.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@max_aspect@]: a pointer filled in with the maximum aspect ratio of the window, may be NULL.
  -> IO Bool
getWindowAspectRatio =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetWindowAspectRatio x00 x11 x22)

-- | Get the aspect ratio of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowAspectRatio'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowAspectRatio@.
--                   The unsafe flavor is 'getWindowAspectRatio'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowAspectRatio@, defined at @SDL3\/SDL_video.h 1956:34@
getWindowAspectRatioSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query the width and height from.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@min_aspect@]: a pointer filled in with the minimum aspect ratio of the window, may be NULL.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@max_aspect@]: a pointer filled in with the maximum aspect ratio of the window, may be NULL.
  -> IO Bool
getWindowAspectRatioSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetWindowAspectRatio x00 x11 x22)

-- | Get the size of a window\'s borders (decorations) around the client area.
--
--     Note: If this function fails (returns false), the size values will be initialized to 0, 0, 0, 0 (if a non-NULL pointer is provided), as if the window in question was borderless.
--
--     Note: This function may fail on systems where the window has not yet been decorated by the display server (for example, immediately after calling SDL_CreateWindow). It is recommended that you wait at least until the window has been presented and composited, so that the window system has a chance to decorate the window and provide the border dimensions to SDL.
--
--     This function also returns false if getting the information is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowBordersSize@.
--                   The safe flavor is 'getWindowBordersSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowBordersSize@, defined at @SDL3\/SDL_video.h 1993:34@
getWindowBordersSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query the size values of the border (decorations) from.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@top@]: pointer to variable for storing the size of the top border; NULL is permitted.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@left@]: pointer to variable for storing the size of the left border; NULL is permitted.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@bottom@]: pointer to variable for storing the size of the bottom border; NULL is permitted.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@right@]: pointer to variable for storing the size of the right border; NULL is permitted.
  -> IO Bool
getWindowBordersSize =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_GetWindowBordersSize x00 x11 x22 x33 x44)

-- | Get the size of a window\'s borders (decorations) around the client area.
--
--     Note: If this function fails (returns false), the size values will be initialized to 0, 0, 0, 0 (if a non-NULL pointer is provided), as if the window in question was borderless.
--
--     Note: This function may fail on systems where the window has not yet been decorated by the display server (for example, immediately after calling SDL_CreateWindow). It is recommended that you wait at least until the window has been presented and composited, so that the window system has a chance to decorate the window and provide the border dimensions to SDL.
--
--     This function also returns false if getting the information is not supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowBordersSize@.
--                   The unsafe flavor is 'getWindowBordersSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowBordersSize@, defined at @SDL3\/SDL_video.h 1993:34@
getWindowBordersSizeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query the size values of the border (decorations) from.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@top@]: pointer to variable for storing the size of the top border; NULL is permitted.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@left@]: pointer to variable for storing the size of the left border; NULL is permitted.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@bottom@]: pointer to variable for storing the size of the bottom border; NULL is permitted.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@right@]: pointer to variable for storing the size of the right border; NULL is permitted.
  -> IO Bool
getWindowBordersSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_GetWindowBordersSize x00 x11 x22 x33 x44)

-- | Get the size of a window\'s client area, in pixels.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createWindow', 'getWindowSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowSizeInPixels@.
--                   The safe flavor is 'getWindowSizeInPixelsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowSizeInPixels@, defined at @SDL3\/SDL_video.h 2013:34@
getWindowSizeInPixels
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window from which the drawable size should be queried.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer to variable for storing the width in pixels, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer to variable for storing the height in pixels, may be NULL.
  -> IO Bool
getWindowSizeInPixels =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetWindowSizeInPixels x00 x11 x22)

-- | Get the size of a window\'s client area, in pixels.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createWindow', 'getWindowSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowSizeInPixels@.
--                   The unsafe flavor is 'getWindowSizeInPixels'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowSizeInPixels@, defined at @SDL3\/SDL_video.h 2013:34@
getWindowSizeInPixelsSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window from which the drawable size should be queried.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer to variable for storing the width in pixels, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer to variable for storing the height in pixels, may be NULL.
  -> IO Bool
getWindowSizeInPixelsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetWindowSizeInPixels x00 x11 x22)

-- | Set the minimum size of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMinimumSize', 'setWindowMaximumSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowMinimumSize@.
--                   The safe flavor is 'setWindowMinimumSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowMinimumSize@, defined at @SDL3\/SDL_video.h 2031:34@
setWindowMinimumSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.Int32
  -- ^
  --
  --           [@min_w@]: the minimum width of the window, or 0 for no limit.
  -> BG.Int32
  -- ^
  --
  --           [@min_h@]: the minimum height of the window, or 0 for no limit.
  -> IO Bool
setWindowMinimumSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetWindowMinimumSize x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set the minimum size of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMinimumSize', 'setWindowMaximumSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowMinimumSize@.
--                   The unsafe flavor is 'setWindowMinimumSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowMinimumSize@, defined at @SDL3\/SDL_video.h 2031:34@
setWindowMinimumSizeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.Int32
  -- ^
  --
  --           [@min_w@]: the minimum width of the window, or 0 for no limit.
  -> BG.Int32
  -- ^
  --
  --           [@min_h@]: the minimum height of the window, or 0 for no limit.
  -> IO Bool
setWindowMinimumSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetWindowMinimumSize x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Get the minimum size of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMaximumSize', 'setWindowMinimumSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowMinimumSize@.
--                   The safe flavor is 'getWindowMinimumSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowMinimumSize@, defined at @SDL3\/SDL_video.h 2051:34@
getWindowMinimumSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer filled in with the minimum width of the window, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer filled in with the minimum height of the window, may be NULL.
  -> IO Bool
getWindowMinimumSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetWindowMinimumSize x00 x11 x22)

-- | Get the minimum size of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMaximumSize', 'setWindowMinimumSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowMinimumSize@.
--                   The unsafe flavor is 'getWindowMinimumSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowMinimumSize@, defined at @SDL3\/SDL_video.h 2051:34@
getWindowMinimumSizeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer filled in with the minimum width of the window, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer filled in with the minimum height of the window, may be NULL.
  -> IO Bool
getWindowMinimumSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetWindowMinimumSize x00 x11 x22)

-- | Set the maximum size of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMaximumSize', 'setWindowMinimumSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowMaximumSize@.
--                   The safe flavor is 'setWindowMaximumSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowMaximumSize@, defined at @SDL3\/SDL_video.h 2069:34@
setWindowMaximumSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.Int32
  -- ^
  --
  --           [@max_w@]: the maximum width of the window, or 0 for no limit.
  -> BG.Int32
  -- ^
  --
  --           [@max_h@]: the maximum height of the window, or 0 for no limit.
  -> IO Bool
setWindowMaximumSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetWindowMaximumSize x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set the maximum size of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMaximumSize', 'setWindowMinimumSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowMaximumSize@.
--                   The unsafe flavor is 'setWindowMaximumSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowMaximumSize@, defined at @SDL3\/SDL_video.h 2069:34@
setWindowMaximumSizeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.Int32
  -- ^
  --
  --           [@max_w@]: the maximum width of the window, or 0 for no limit.
  -> BG.Int32
  -- ^
  --
  --           [@max_h@]: the maximum height of the window, or 0 for no limit.
  -> IO Bool
setWindowMaximumSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetWindowMaximumSize x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Get the maximum size of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMinimumSize', 'setWindowMaximumSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowMaximumSize@.
--                   The safe flavor is 'getWindowMaximumSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowMaximumSize@, defined at @SDL3\/SDL_video.h 2089:34@
getWindowMaximumSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer filled in with the maximum width of the window, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer filled in with the maximum height of the window, may be NULL.
  -> IO Bool
getWindowMaximumSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetWindowMaximumSize x00 x11 x22)

-- | Get the maximum size of a window\'s client area.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMinimumSize', 'setWindowMaximumSize'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowMaximumSize@.
--                   The unsafe flavor is 'getWindowMaximumSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowMaximumSize@, defined at @SDL3\/SDL_video.h 2089:34@
getWindowMaximumSizeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@w@]: a pointer filled in with the maximum width of the window, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@h@]: a pointer filled in with the maximum height of the window, may be NULL.
  -> IO Bool
getWindowMaximumSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetWindowMaximumSize x00 x11 x22)

-- | Set the border state of a window.
--
--     This will add or remove the window\'s @SDL_WINDOW_BORDERLESS@ flag and add or remove the border from the actual window. This is a no-op if the window\'s border already matches the requested state.
--
--     You can\'t change the border state of a fullscreen window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFlags'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowBordered@.
--                   The safe flavor is 'setWindowBorderedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowBordered@, defined at @SDL3\/SDL_video.h 2111:34@
setWindowBordered
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the border state.
  -> Bool
  -- ^
  --
  --           [@bordered@]: false to remove border, true to add border.
  -> IO Bool
setWindowBordered =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowBordered x00 (CBool.fromBool x11))

-- | Set the border state of a window.
--
--     This will add or remove the window\'s @SDL_WINDOW_BORDERLESS@ flag and add or remove the border from the actual window. This is a no-op if the window\'s border already matches the requested state.
--
--     You can\'t change the border state of a fullscreen window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFlags'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowBordered@.
--                   The unsafe flavor is 'setWindowBordered'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowBordered@, defined at @SDL3\/SDL_video.h 2111:34@
setWindowBorderedSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the border state.
  -> Bool
  -- ^
  --
  --           [@bordered@]: false to remove border, true to add border.
  -> IO Bool
setWindowBorderedSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowBordered x00 (CBool.fromBool x11))

-- | Set the user-resizable state of a window.
--
--     This will add or remove the window\'s @SDL_WINDOW_RESIZABLE@ flag and allow\/disallow user resizing of the window. This is a no-op if the window\'s resizable state already matches the requested state.
--
--     You can\'t change the resizable state of a fullscreen window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFlags'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowResizable@.
--                   The safe flavor is 'setWindowResizableSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowResizable@, defined at @SDL3\/SDL_video.h 2133:34@
setWindowResizable
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the resizable state.
  -> Bool
  -- ^
  --
  --           [@resizable@]: true to allow resizing, false to disallow.
  -> IO Bool
setWindowResizable =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowResizable x00 (CBool.fromBool x11))

-- | Set the user-resizable state of a window.
--
--     This will add or remove the window\'s @SDL_WINDOW_RESIZABLE@ flag and allow\/disallow user resizing of the window. This is a no-op if the window\'s resizable state already matches the requested state.
--
--     You can\'t change the resizable state of a fullscreen window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFlags'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowResizable@.
--                   The unsafe flavor is 'setWindowResizable'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowResizable@, defined at @SDL3\/SDL_video.h 2133:34@
setWindowResizableSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the resizable state.
  -> Bool
  -- ^
  --
  --           [@resizable@]: true to allow resizing, false to disallow.
  -> IO Bool
setWindowResizableSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowResizable x00 (CBool.fromBool x11))

-- | Set the window to always be above the others.
--
--     This will add or remove the window\'s @SDL_WINDOW_ALWAYS_ON_TOP@ flag. This will bring the window to the front and keep the window above the rest.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFlags'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowAlwaysOnTop@.
--                   The safe flavor is 'setWindowAlwaysOnTopSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowAlwaysOnTop@, defined at @SDL3\/SDL_video.h 2152:34@
setWindowAlwaysOnTop
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the always on top state.
  -> Bool
  -- ^
  --
  --           [@on_top@]: true to set the window always on top, false to disable.
  -> IO Bool
setWindowAlwaysOnTop =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowAlwaysOnTop x00 (CBool.fromBool x11))

-- | Set the window to always be above the others.
--
--     This will add or remove the window\'s @SDL_WINDOW_ALWAYS_ON_TOP@ flag. This will bring the window to the front and keep the window above the rest.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFlags'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowAlwaysOnTop@.
--                   The unsafe flavor is 'setWindowAlwaysOnTop'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowAlwaysOnTop@, defined at @SDL3\/SDL_video.h 2152:34@
setWindowAlwaysOnTopSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the always on top state.
  -> Bool
  -- ^
  --
  --           [@on_top@]: true to set the window always on top, false to disable.
  -> IO Bool
setWindowAlwaysOnTopSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowAlwaysOnTop x00 (CBool.fromBool x11))

-- | Set the window to fill the current document space (Emscripten only).
--
--     This will add or remove the window\'s @SDL_WINDOW_FILL_DOCUMENT@ flag.
--
--     Currently this flag only applies to the Emscripten target.
--
--     When enabled, the canvas element fills the entire document. Resize events will be generated as the browser window is resized, as that will adjust the canvas size as well. The canvas will cover anything else on the page, including any controls provided by Emscripten in its generated HTML file (in fact, any elements on the page that aren\'t the canvas will be moved into a hidden @div@ element).
--
--     Often times this is desirable for a browser-based game, but it means several things that we expect of an SDL window on other platforms might not work as expected, such as minimum window sizes and aspect ratios.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'getWindowFlags'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowFillDocument@.
--                   The safe flavor is 'setWindowFillDocumentSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowFillDocument@, defined at @SDL3\/SDL_video.h 2183:34@
setWindowFillDocument
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the fill-document state.
  -> Bool
  -- ^
  --
  --           [@fill@]: true to set the window to fill the document, false to disable.
  -> IO Bool
setWindowFillDocument =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowFillDocument x00 (CBool.fromBool x11))

-- | Set the window to fill the current document space (Emscripten only).
--
--     This will add or remove the window\'s @SDL_WINDOW_FILL_DOCUMENT@ flag.
--
--     Currently this flag only applies to the Emscripten target.
--
--     When enabled, the canvas element fills the entire document. Resize events will be generated as the browser window is resized, as that will adjust the canvas size as well. The canvas will cover anything else on the page, including any controls provided by Emscripten in its generated HTML file (in fact, any elements on the page that aren\'t the canvas will be moved into a hidden @div@ element).
--
--     Often times this is desirable for a browser-based game, but it means several things that we expect of an SDL window on other platforms might not work as expected, such as minimum window sizes and aspect ratios.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'getWindowFlags'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowFillDocument@.
--                   The unsafe flavor is 'setWindowFillDocument'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowFillDocument@, defined at @SDL3\/SDL_video.h 2183:34@
setWindowFillDocumentSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the fill-document state.
  -> Bool
  -- ^
  --
  --           [@fill@]: true to set the window to fill the document, false to disable.
  -> IO Bool
setWindowFillDocumentSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowFillDocument x00 (CBool.fromBool x11))

-- | Show a window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hideWindow', 'raiseWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ShowWindow@.
--                   The safe flavor is 'showWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowWindow@, defined at @SDL3\/SDL_video.h 2199:34@
showWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to show.
  -> IO Bool
showWindow =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_ShowWindow x00)

-- | Show a window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hideWindow', 'raiseWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShowWindow@.
--                   The unsafe flavor is 'showWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowWindow@, defined at @SDL3\/SDL_video.h 2199:34@
showWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to show.
  -> IO Bool
showWindowSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_ShowWindow x00)

-- | Hide a window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'showWindow', @SDL_WINDOW_HIDDEN@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HideWindow@.
--                   The safe flavor is 'hideWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HideWindow@, defined at @SDL3\/SDL_video.h 2215:34@
hideWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to hide.
  -> IO Bool
hideWindow =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_HideWindow x00)

-- | Hide a window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'showWindow', @SDL_WINDOW_HIDDEN@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HideWindow@.
--                   The unsafe flavor is 'hideWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HideWindow@, defined at @SDL3\/SDL_video.h 2215:34@
hideWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to hide.
  -> IO Bool
hideWindowSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_HideWindow x00)

-- | Request that a window be raised above other windows and gain the input focus.
--
--     The result of this request is subject to desktop window manager policy, particularly if raising the requested window would result in stealing focus from another application. If the window is successfully raised and gains input focus, an SDL_EVENT_WINDOW_FOCUS_GAINED event will be emitted, and the window will have the SDL_WINDOW_INPUT_FOCUS flag set.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RaiseWindow@.
--                   The safe flavor is 'raiseWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RaiseWindow@, defined at @SDL3\/SDL_video.h 2235:34@
raiseWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to raise.
  -> IO Bool
raiseWindow =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_RaiseWindow x00)

-- | Request that a window be raised above other windows and gain the input focus.
--
--     The result of this request is subject to desktop window manager policy, particularly if raising the requested window would result in stealing focus from another application. If the window is successfully raised and gains input focus, an SDL_EVENT_WINDOW_FOCUS_GAINED event will be emitted, and the window will have the SDL_WINDOW_INPUT_FOCUS flag set.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RaiseWindow@.
--                   The unsafe flavor is 'raiseWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RaiseWindow@, defined at @SDL3\/SDL_video.h 2235:34@
raiseWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to raise.
  -> IO Bool
raiseWindowSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_RaiseWindow x00)

-- | Request that the window be made as large as possible.
--
--     Non-resizable windows can\'t be maximized. The window must have the SDL_WINDOW_RESIZABLE flag set, or this will have no effect.
--
--     On some windowing systems this request is asynchronous and the new window state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_MAXIMIZED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
--
--     When maximizing a window, whether the constraints set via @'setWindowMaximumSize'@ are honored depends on the policy of the window manager. Win32 and macOS enforce the constraints when maximizing, while X11 and Wayland window managers may vary.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'minimizeWindow', 'restoreWindow', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MaximizeWindow@.
--                   The safe flavor is 'maximizeWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MaximizeWindow@, defined at @SDL3\/SDL_video.h 2269:34@
maximizeWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to maximize.
  -> IO Bool
maximizeWindow =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_MaximizeWindow x00)

-- | Request that the window be made as large as possible.
--
--     Non-resizable windows can\'t be maximized. The window must have the SDL_WINDOW_RESIZABLE flag set, or this will have no effect.
--
--     On some windowing systems this request is asynchronous and the new window state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_MAXIMIZED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
--
--     When maximizing a window, whether the constraints set via @'setWindowMaximumSize'@ are honored depends on the policy of the window manager. Win32 and macOS enforce the constraints when maximizing, while X11 and Wayland window managers may vary.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'minimizeWindow', 'restoreWindow', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MaximizeWindow@.
--                   The unsafe flavor is 'maximizeWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MaximizeWindow@, defined at @SDL3\/SDL_video.h 2269:34@
maximizeWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to maximize.
  -> IO Bool
maximizeWindowSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_MaximizeWindow x00)

-- | Request that the window be minimized to an iconic representation.
--
--     If the window is in a fullscreen state, this request has no direct effect. It may alter the state the window is returned to when leaving fullscreen.
--
--     On some windowing systems this request is asynchronous and the new window state may not have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_MINIMIZED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'maximizeWindow', 'restoreWindow', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MinimizeWindow@.
--                   The safe flavor is 'minimizeWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MinimizeWindow@, defined at @SDL3\/SDL_video.h 2298:34@
minimizeWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to minimize.
  -> IO Bool
minimizeWindow =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_MinimizeWindow x00)

-- | Request that the window be minimized to an iconic representation.
--
--     If the window is in a fullscreen state, this request has no direct effect. It may alter the state the window is returned to when leaving fullscreen.
--
--     On some windowing systems this request is asynchronous and the new window state may not have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_MINIMIZED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'maximizeWindow', 'restoreWindow', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MinimizeWindow@.
--                   The unsafe flavor is 'minimizeWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MinimizeWindow@, defined at @SDL3\/SDL_video.h 2298:34@
minimizeWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to minimize.
  -> IO Bool
minimizeWindowSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_MinimizeWindow x00)

-- | Request that the size and position of a minimized or maximized window be restored.
--
--     If the window is in a fullscreen state, this request has no direct effect. It may alter the state the window is returned to when leaving fullscreen.
--
--     On some windowing systems this request is asynchronous and the new window state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_RESTORED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'maximizeWindow', 'minimizeWindow', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RestoreWindow@.
--                   The safe flavor is 'restoreWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RestoreWindow@, defined at @SDL3\/SDL_video.h 2328:34@
restoreWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to restore.
  -> IO Bool
restoreWindow =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_RestoreWindow x00)

-- | Request that the size and position of a minimized or maximized window be restored.
--
--     If the window is in a fullscreen state, this request has no direct effect. It may alter the state the window is returned to when leaving fullscreen.
--
--     On some windowing systems this request is asynchronous and the new window state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_RESTORED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'maximizeWindow', 'minimizeWindow', 'syncWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RestoreWindow@.
--                   The unsafe flavor is 'restoreWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RestoreWindow@, defined at @SDL3\/SDL_video.h 2328:34@
restoreWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to restore.
  -> IO Bool
restoreWindowSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_RestoreWindow x00)

-- | Request that the window\'s fullscreen state be changed.
--
--     By default a window in fullscreen state uses borderless fullscreen desktop mode, but a specific exclusive display mode can be set using @'setWindowFullscreenMode'@.
--
--     On some windowing systems this request is asynchronous and the new fullscreen state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_ENTER_FULLSCREEN or SDL_EVENT_WINDOW_LEAVE_FULLSCREEN event will be emitted. Note that, as this is just a request, it can be denied by the windowing system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFullscreenMode', 'setWindowFullscreenMode', 'syncWindow', @SDL_WINDOW_FULLSCREEN@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowFullscreen@.
--                   The safe flavor is 'setWindowFullscreenSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowFullscreen@, defined at @SDL3\/SDL_video.h 2360:34@
setWindowFullscreen
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> Bool
  -- ^
  --
  --           [@fullscreen@]: true for fullscreen mode, false for windowed mode.
  -> IO Bool
setWindowFullscreen =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowFullscreen x00 (CBool.fromBool x11))

-- | Request that the window\'s fullscreen state be changed.
--
--     By default a window in fullscreen state uses borderless fullscreen desktop mode, but a specific exclusive display mode can be set using @'setWindowFullscreenMode'@.
--
--     On some windowing systems this request is asynchronous and the new fullscreen state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @'syncWindow'@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_ENTER_FULLSCREEN or SDL_EVENT_WINDOW_LEAVE_FULLSCREEN event will be emitted. Note that, as this is just a request, it can be denied by the windowing system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowFullscreenMode', 'setWindowFullscreenMode', 'syncWindow', @SDL_WINDOW_FULLSCREEN@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowFullscreen@.
--                   The unsafe flavor is 'setWindowFullscreen'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowFullscreen@, defined at @SDL3\/SDL_video.h 2360:34@
setWindowFullscreenSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> Bool
  -- ^
  --
  --           [@fullscreen@]: true for fullscreen mode, false for windowed mode.
  -> IO Bool
setWindowFullscreenSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowFullscreen x00 (CBool.fromBool x11))

-- | Block until any pending window state is finalized.
--
--     On asynchronous windowing systems, this acts as a synchronization barrier for pending window state. It will attempt to wait until any pending window state has been applied and is guaranteed to return within finite time. Note that for how long it can potentially block depends on the underlying window system, as window state changes may involve somewhat lengthy animations that must complete before the window is in its final requested state.
--
--     On windowing systems where changes are immediate, this does nothing.
--
--     [Returns]: true on success or false if the operation timed out before the window was in the requested state.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowSize', 'setWindowPosition', 'setWindowFullscreen', 'minimizeWindow', 'maximizeWindow', 'restoreWindow', SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SyncWindow@.
--                   The safe flavor is 'syncWindowSafe'
--                   : blocks until pending window state settles (up to a timeout).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SyncWindow@, defined at @SDL3\/SDL_video.h 2391:34@
syncWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which to wait for the pending state to be applied.
  -> IO Bool
syncWindow =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_SyncWindow x00)

-- | Block until any pending window state is finalized.
--
--     On asynchronous windowing systems, this acts as a synchronization barrier for pending window state. It will attempt to wait until any pending window state has been applied and is guaranteed to return within finite time. Note that for how long it can potentially block depends on the underlying window system, as window state changes may involve somewhat lengthy animations that must complete before the window is in its final requested state.
--
--     On windowing systems where changes are immediate, this does nothing.
--
--     [Returns]: true on success or false if the operation timed out before the window was in the requested state.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowSize', 'setWindowPosition', 'setWindowFullscreen', 'minimizeWindow', 'maximizeWindow', 'restoreWindow', SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SyncWindow@.
--                   The unsafe flavor is 'syncWindow'
--                   : blocks until pending window state settles (up to a timeout).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SyncWindow@, defined at @SDL3\/SDL_video.h 2391:34@
syncWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which to wait for the pending state to be applied.
  -> IO Bool
syncWindowSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_SyncWindow x00)

-- | Return whether the window has a surface associated with it.
--
--     [Returns]: true if there is a surface associated with the window, or false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WindowHasSurface@.
--                   The safe flavor is 'windowHasSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WindowHasSurface@, defined at @SDL3\/SDL_video.h 2406:34@
windowHasSurface
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Bool
windowHasSurface =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_WindowHasSurface x00)

-- | Return whether the window has a surface associated with it.
--
--     [Returns]: true if there is a surface associated with the window, or false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WindowHasSurface@.
--                   The unsafe flavor is 'windowHasSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WindowHasSurface@, defined at @SDL3\/SDL_video.h 2406:34@
windowHasSurfaceSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Bool
windowHasSurfaceSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_WindowHasSurface x00)

-- | Get the SDL surface associated with the window.
--
--     A new surface will be created with the optimal format for the window, if necessary. This surface will be freed when the window is destroyed. Do not free this surface.
--
--     This surface will be invalidated if the window is resized. After resizing a window this function must be called again to return a valid surface.
--
--     You may not combine this with 3D or the rendering API on this window.
--
--     This function is affected by @SDL_HINT_FRAMEBUFFER_ACCELERATION@.
--
--     [Returns]: the surface associated with the window, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyWindowSurface', 'windowHasSurface', 'updateWindowSurface', 'updateWindowSurfaceRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowSurface@.
--                   The safe flavor is 'getWindowSurfaceSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowSurface@, defined at @SDL3\/SDL_video.h 2435:43@
getWindowSurface
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
getWindowSurface = Unsafe.sDL_GetWindowSurface

-- | Get the SDL surface associated with the window.
--
--     A new surface will be created with the optimal format for the window, if necessary. This surface will be freed when the window is destroyed. Do not free this surface.
--
--     This surface will be invalidated if the window is resized. After resizing a window this function must be called again to return a valid surface.
--
--     You may not combine this with 3D or the rendering API on this window.
--
--     This function is affected by @SDL_HINT_FRAMEBUFFER_ACCELERATION@.
--
--     [Returns]: the surface associated with the window, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyWindowSurface', 'windowHasSurface', 'updateWindowSurface', 'updateWindowSurfaceRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowSurface@.
--                   The unsafe flavor is 'getWindowSurface'
--                   .
--
--     [C declaration]: @SDL_GetWindowSurface@, defined at @SDL3\/SDL_video.h 2435:43@
getWindowSurfaceSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
getWindowSurfaceSafe = Safe.sDL_GetWindowSurface

-- | Toggle VSync for the window surface.
--
--     When a window surface is created, vsync defaults to SDL_WINDOW_SURFACE_VSYNC_DISABLED.
--
--     The @vsync@ parameter can be 1 to synchronize present with every vertical refresh, 2 to synchronize present with every second vertical refresh, etc., SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or SDL_WINDOW_SURFACE_VSYNC_DISABLED to disable. Not every value is supported by every driver, so you should check the return value to see whether the requested setting is supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurfaceVSync'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowSurfaceVSync@.
--                   The safe flavor is 'setWindowSurfaceVSyncSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowSurfaceVSync@, defined at @SDL3\/SDL_video.h 2461:34@
setWindowSurfaceVSync
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window.
  -> BG.Int32
  -- ^
  --
  --           [@vsync@]: the vertical refresh sync interval.
  -> IO Bool
setWindowSurfaceVSync =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowSurfaceVSync x00 (Coerce.coerce x11))

-- | Toggle VSync for the window surface.
--
--     When a window surface is created, vsync defaults to SDL_WINDOW_SURFACE_VSYNC_DISABLED.
--
--     The @vsync@ parameter can be 1 to synchronize present with every vertical refresh, 2 to synchronize present with every second vertical refresh, etc., SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or SDL_WINDOW_SURFACE_VSYNC_DISABLED to disable. Not every value is supported by every driver, so you should check the return value to see whether the requested setting is supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurfaceVSync'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowSurfaceVSync@.
--                   The unsafe flavor is 'setWindowSurfaceVSync'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowSurfaceVSync@, defined at @SDL3\/SDL_video.h 2461:34@
setWindowSurfaceVSyncSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window.
  -> BG.Int32
  -- ^
  --
  --           [@vsync@]: the vertical refresh sync interval.
  -> IO Bool
setWindowSurfaceVSyncSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowSurfaceVSync x00 (Coerce.coerce x11))

-- | Get VSync for the window surface.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowSurfaceVSync'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowSurfaceVSync@.
--                   The safe flavor is 'getWindowSurfaceVSyncSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowSurfaceVSync@, defined at @SDL3\/SDL_video.h 2481:34@
getWindowSurfaceVSync
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@vsync@]: an int filled with the current vertical refresh sync interval. See @'setWindowSurfaceVSync'@ for the meaning of the value.
  -> IO Bool
getWindowSurfaceVSync =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetWindowSurfaceVSync x00 x11)

-- | Get VSync for the window surface.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowSurfaceVSync'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowSurfaceVSync@.
--                   The unsafe flavor is 'getWindowSurfaceVSync'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowSurfaceVSync@, defined at @SDL3\/SDL_video.h 2481:34@
getWindowSurfaceVSyncSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@vsync@]: an int filled with the current vertical refresh sync interval. See @'setWindowSurfaceVSync'@ for the meaning of the value.
  -> IO Bool
getWindowSurfaceVSyncSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetWindowSurfaceVSync x00 x11)

-- | Copy the window surface to the screen.
--
--     This is the function you use to reflect any changes to the surface on the screen.
--
--     This function is equivalent to the SDL 1.2 API SDL_Flip().
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurface', 'updateWindowSurfaceRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateWindowSurface@.
--                   The safe flavor is 'updateWindowSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateWindowSurface@, defined at @SDL3\/SDL_video.h 2502:34@
updateWindowSurface
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to update.
  -> IO Bool
updateWindowSurface =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_UpdateWindowSurface x00)

-- | Copy the window surface to the screen.
--
--     This is the function you use to reflect any changes to the surface on the screen.
--
--     This function is equivalent to the SDL 1.2 API SDL_Flip().
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurface', 'updateWindowSurfaceRects'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateWindowSurface@.
--                   The unsafe flavor is 'updateWindowSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateWindowSurface@, defined at @SDL3\/SDL_video.h 2502:34@
updateWindowSurfaceSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to update.
  -> IO Bool
updateWindowSurfaceSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_UpdateWindowSurface x00)

-- | Copy areas of the window surface to the screen.
--
--     This is the function you use to reflect changes to portions of the surface on the screen.
--
--     This function is equivalent to the SDL 1.2 API SDL_UpdateRects().
--
--     Note that this function will update /at least/ the rectangles specified, but this is only intended as an optimization; in practice, this might update more of the screen (or all of the screen!), depending on what method SDL uses to send pixels to the system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurface', 'updateWindowSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UpdateWindowSurfaceRects@.
--                   The safe flavor is 'updateWindowSurfaceRectsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateWindowSurfaceRects@, defined at @SDL3\/SDL_video.h 2531:34@
updateWindowSurfaceRects
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to update.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rects@]: an array of SDL_Rect structures representing areas of the surface to copy, in pixels.
  -> BG.Int32
  -- ^
  --
  --           [@numrects@]: the number of rectangles.
  -> IO Bool
updateWindowSurfaceRects =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_UpdateWindowSurfaceRects x00 x11 (Coerce.coerce x22))

-- | Copy areas of the window surface to the screen.
--
--     This is the function you use to reflect changes to portions of the surface on the screen.
--
--     This function is equivalent to the SDL 1.2 API SDL_UpdateRects().
--
--     Note that this function will update /at least/ the rectangles specified, but this is only intended as an optimization; in practice, this might update more of the screen (or all of the screen!), depending on what method SDL uses to send pixels to the system.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurface', 'updateWindowSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UpdateWindowSurfaceRects@.
--                   The unsafe flavor is 'updateWindowSurfaceRects'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UpdateWindowSurfaceRects@, defined at @SDL3\/SDL_video.h 2531:34@
updateWindowSurfaceRectsSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to update.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rects@]: an array of SDL_Rect structures representing areas of the surface to copy, in pixels.
  -> BG.Int32
  -- ^
  --
  --           [@numrects@]: the number of rectangles.
  -> IO Bool
updateWindowSurfaceRectsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_UpdateWindowSurfaceRects x00 x11 (Coerce.coerce x22))

-- | Destroy the surface associated with the window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurface', 'windowHasSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyWindowSurface@.
--                   The safe flavor is 'destroyWindowSurfaceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DestroyWindowSurface@, defined at @SDL3\/SDL_video.h 2547:34@
destroyWindowSurface
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to update.
  -> IO Bool
destroyWindowSurface =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_DestroyWindowSurface x00)

-- | Destroy the surface associated with the window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowSurface', 'windowHasSurface'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyWindowSurface@.
--                   The unsafe flavor is 'destroyWindowSurface'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DestroyWindowSurface@, defined at @SDL3\/SDL_video.h 2547:34@
destroyWindowSurfaceSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to update.
  -> IO Bool
destroyWindowSurfaceSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_DestroyWindowSurface x00)

-- | Set a window\'s keyboard grab mode.
--
--     Keyboard grab enables capture of system keyboard shortcuts like Alt+Tab or the Meta\/Super key. Note that not all system keyboard shortcuts can be captured by applications (one example is Ctrl+Alt+Del on Windows).
--
--     This is primarily intended for specialized applications such as VNC clients or VM frontends. Normal games should not use keyboard grab.
--
--     When keyboard grab is enabled, SDL will continue to handle Alt+Tab when the window is full-screen to ensure the user is not trapped in your application. If you have a custom keyboard shortcut to exit fullscreen mode, you may suppress this behavior with @SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED@.
--
--     If the caller enables a grab while another window is currently grabbed, the other window loses its grab in favor of the caller\'s window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowKeyboardGrab', 'setWindowMouseGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowKeyboardGrab@.
--                   The safe flavor is 'setWindowKeyboardGrabSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowKeyboardGrab@, defined at @SDL3\/SDL_video.h 2580:34@
setWindowKeyboardGrab
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which the keyboard grab mode should be set.
  -> Bool
  -- ^
  --
  --           [@grabbed@]: this is true to grab keyboard, and false to release.
  -> IO Bool
setWindowKeyboardGrab =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowKeyboardGrab x00 (CBool.fromBool x11))

-- | Set a window\'s keyboard grab mode.
--
--     Keyboard grab enables capture of system keyboard shortcuts like Alt+Tab or the Meta\/Super key. Note that not all system keyboard shortcuts can be captured by applications (one example is Ctrl+Alt+Del on Windows).
--
--     This is primarily intended for specialized applications such as VNC clients or VM frontends. Normal games should not use keyboard grab.
--
--     When keyboard grab is enabled, SDL will continue to handle Alt+Tab when the window is full-screen to ensure the user is not trapped in your application. If you have a custom keyboard shortcut to exit fullscreen mode, you may suppress this behavior with @SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED@.
--
--     If the caller enables a grab while another window is currently grabbed, the other window loses its grab in favor of the caller\'s window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowKeyboardGrab', 'setWindowMouseGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowKeyboardGrab@.
--                   The unsafe flavor is 'setWindowKeyboardGrab'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowKeyboardGrab@, defined at @SDL3\/SDL_video.h 2580:34@
setWindowKeyboardGrabSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which the keyboard grab mode should be set.
  -> Bool
  -- ^
  --
  --           [@grabbed@]: this is true to grab keyboard, and false to release.
  -> IO Bool
setWindowKeyboardGrabSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowKeyboardGrab x00 (CBool.fromBool x11))

-- | Set a window\'s mouse grab mode.
--
--     Mouse grab confines the mouse cursor to the window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMouseRect', 'setWindowMouseRect', 'setWindowKeyboardGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowMouseGrab@.
--                   The safe flavor is 'setWindowMouseGrabSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowMouseGrab@, defined at @SDL3\/SDL_video.h 2600:34@
setWindowMouseGrab
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which the mouse grab mode should be set.
  -> Bool
  -- ^
  --
  --           [@grabbed@]: this is true to grab mouse, and false to release.
  -> IO Bool
setWindowMouseGrab =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowMouseGrab x00 (CBool.fromBool x11))

-- | Set a window\'s mouse grab mode.
--
--     Mouse grab confines the mouse cursor to the window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMouseRect', 'setWindowMouseRect', 'setWindowKeyboardGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowMouseGrab@.
--                   The unsafe flavor is 'setWindowMouseGrab'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowMouseGrab@, defined at @SDL3\/SDL_video.h 2600:34@
setWindowMouseGrabSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which the mouse grab mode should be set.
  -> Bool
  -- ^
  --
  --           [@grabbed@]: this is true to grab mouse, and false to release.
  -> IO Bool
setWindowMouseGrabSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowMouseGrab x00 (CBool.fromBool x11))

-- | Get a window\'s keyboard grab mode.
--
--     [Returns]: true if keyboard is grabbed, and false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowKeyboardGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowKeyboardGrab@.
--                   The safe flavor is 'getWindowKeyboardGrabSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowKeyboardGrab@, defined at @SDL3\/SDL_video.h 2614:34@
getWindowKeyboardGrab
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Bool
getWindowKeyboardGrab =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GetWindowKeyboardGrab x00)

-- | Get a window\'s keyboard grab mode.
--
--     [Returns]: true if keyboard is grabbed, and false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowKeyboardGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowKeyboardGrab@.
--                   The unsafe flavor is 'getWindowKeyboardGrab'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowKeyboardGrab@, defined at @SDL3\/SDL_video.h 2614:34@
getWindowKeyboardGrabSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Bool
getWindowKeyboardGrabSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GetWindowKeyboardGrab x00)

-- | Get a window\'s mouse grab mode.
--
--     [Returns]: true if mouse is grabbed, and false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMouseRect', 'setWindowMouseRect', 'setWindowMouseGrab', 'setWindowKeyboardGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowMouseGrab@.
--                   The safe flavor is 'getWindowMouseGrabSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowMouseGrab@, defined at @SDL3\/SDL_video.h 2631:34@
getWindowMouseGrab
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Bool
getWindowMouseGrab =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GetWindowMouseGrab x00)

-- | Get a window\'s mouse grab mode.
--
--     [Returns]: true if mouse is grabbed, and false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMouseRect', 'setWindowMouseRect', 'setWindowMouseGrab', 'setWindowKeyboardGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowMouseGrab@.
--                   The unsafe flavor is 'getWindowMouseGrab'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowMouseGrab@, defined at @SDL3\/SDL_video.h 2631:34@
getWindowMouseGrabSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Bool
getWindowMouseGrabSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GetWindowMouseGrab x00)

-- | Get the window that currently has an input grab enabled.
--
--     [Returns]: the window if input is grabbed or NULL otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowMouseGrab', 'setWindowKeyboardGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGrabbedWindow@.
--                   The safe flavor is 'getGrabbedWindowSafe'
--                   .
--
--     [C declaration]: @SDL_GetGrabbedWindow@, defined at @SDL3\/SDL_video.h 2645:42@
getGrabbedWindow :: IO (BG.Ptr SDL_Window)
getGrabbedWindow = Unsafe.sDL_GetGrabbedWindow

-- | Get the window that currently has an input grab enabled.
--
--     [Returns]: the window if input is grabbed or NULL otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowMouseGrab', 'setWindowKeyboardGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGrabbedWindow@.
--                   The unsafe flavor is 'getGrabbedWindow'
--                   .
--
--     [C declaration]: @SDL_GetGrabbedWindow@, defined at @SDL3\/SDL_video.h 2645:42@
getGrabbedWindowSafe :: IO (BG.Ptr SDL_Window)
getGrabbedWindowSafe = Safe.sDL_GetGrabbedWindow

-- | Confines the cursor to the specified area of a window.
--
--     Note that this does NOT grab the cursor, it only defines the area a cursor is restricted to when the window has mouse focus.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMouseRect', 'getWindowMouseGrab', 'setWindowMouseGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowMouseRect@.
--                   The safe flavor is 'setWindowMouseRectSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowMouseRect@, defined at @SDL3\/SDL_video.h 2667:34@
setWindowMouseRect
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window that will be associated with the barrier.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a rectangle area in window-relative coordinates. If NULL the barrier for the specified window will be destroyed.
  -> IO Bool
setWindowMouseRect =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowMouseRect x00 x11)

-- | Confines the cursor to the specified area of a window.
--
--     Note that this does NOT grab the cursor, it only defines the area a cursor is restricted to when the window has mouse focus.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowMouseRect', 'getWindowMouseGrab', 'setWindowMouseGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowMouseRect@.
--                   The unsafe flavor is 'setWindowMouseRect'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowMouseRect@, defined at @SDL3\/SDL_video.h 2667:34@
setWindowMouseRectSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window that will be associated with the barrier.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a rectangle area in window-relative coordinates. If NULL the barrier for the specified window will be destroyed.
  -> IO Bool
setWindowMouseRectSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowMouseRect x00 x11)

-- | Get the mouse confinement rectangle of a window.
--
--     [Returns]: a pointer to the mouse confinement rectangle of a window, or NULL if there isn\'t one.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowMouseRect', 'getWindowMouseGrab', 'setWindowMouseGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowMouseRect@.
--                   The safe flavor is 'getWindowMouseRectSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowMouseRect@, defined at @SDL3\/SDL_video.h 2684:46@
getWindowMouseRect
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect)
getWindowMouseRect = Unsafe.sDL_GetWindowMouseRect

-- | Get the mouse confinement rectangle of a window.
--
--     [Returns]: a pointer to the mouse confinement rectangle of a window, or NULL if there isn\'t one.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowMouseRect', 'getWindowMouseGrab', 'setWindowMouseGrab'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowMouseRect@.
--                   The unsafe flavor is 'getWindowMouseRect'
--                   .
--
--     [C declaration]: @SDL_GetWindowMouseRect@, defined at @SDL3\/SDL_video.h 2684:46@
getWindowMouseRectSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect)
getWindowMouseRectSafe = Safe.sDL_GetWindowMouseRect

-- | Set the opacity for a window.
--
--     The parameter @opacity@ will be clamped internally between 0.0f (transparent) and 1.0f (opaque).
--
--     This function also returns false if setting the opacity isn\'t supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowOpacity'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowOpacity@.
--                   The safe flavor is 'setWindowOpacitySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowOpacity@, defined at @SDL3\/SDL_video.h 2705:34@
setWindowOpacity
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window which will be made transparent or opaque.
  -> Float
  -- ^
  --
  --           [@opacity@]: the opacity value (0.0f - transparent, 1.0f - opaque).
  -> IO Bool
setWindowOpacity =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowOpacity x00 (Coerce.coerce x11))

-- | Set the opacity for a window.
--
--     The parameter @opacity@ will be clamped internally between 0.0f (transparent) and 1.0f (opaque).
--
--     This function also returns false if setting the opacity isn\'t supported.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowOpacity'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowOpacity@.
--                   The unsafe flavor is 'setWindowOpacity'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowOpacity@, defined at @SDL3\/SDL_video.h 2705:34@
setWindowOpacitySafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window which will be made transparent or opaque.
  -> Float
  -- ^
  --
  --           [@opacity@]: the opacity value (0.0f - transparent, 1.0f - opaque).
  -> IO Bool
setWindowOpacitySafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowOpacity x00 (Coerce.coerce x11))

-- | Get the opacity of a window.
--
--     If transparency isn\'t supported on this platform, opacity will be returned as 1.0f without error.
--
--     [Returns]: the opacity, (0.0f - transparent, 1.0f - opaque), or -1.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowOpacity'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowOpacity@.
--                   The safe flavor is 'getWindowOpacitySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowOpacity@, defined at @SDL3\/SDL_video.h 2723:35@
getWindowOpacity
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to get the current opacity value from.
  -> IO Float
getWindowOpacity =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetWindowOpacity x00)

-- | Get the opacity of a window.
--
--     If transparency isn\'t supported on this platform, opacity will be returned as 1.0f without error.
--
--     [Returns]: the opacity, (0.0f - transparent, 1.0f - opaque), or -1.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowOpacity'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowOpacity@.
--                   The unsafe flavor is 'getWindowOpacity'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowOpacity@, defined at @SDL3\/SDL_video.h 2723:35@
getWindowOpacitySafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to get the current opacity value from.
  -> IO Float
getWindowOpacitySafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetWindowOpacity x00)

-- | Set the window as a child of a parent window.
--
--     If the window is already the child of an existing window, it will be reparented to the new owner. Setting the parent window to NULL unparents the window and removes child window status.
--
--     If a parent window is hidden or destroyed, the operation will be recursively applied to child windows. Child windows hidden with the parent that did not have their hidden status explicitly set will be restored when the parent is shown.
--
--     Attempting to set the parent of a window that is currently in the modal state will fail. Use @'setWindowModal'@ to cancel the modal status before attempting to change the parent.
--
--     Popup windows cannot change parents and attempts to do so will fail.
--
--     Setting a parent window that is currently the sibling or descendent of the child window results in undefined behavior.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowModal'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowParent@.
--                   The safe flavor is 'setWindowParentSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowParent@, defined at @SDL3\/SDL_video.h 2757:34@
setWindowParent
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window that should become the child of a parent.
  -> BG.Ptr SDL_Window
  -- ^
  --
  --           [@parent@]: the new parent window for the child window.
  -> IO Bool
setWindowParent =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowParent x00 x11)

-- | Set the window as a child of a parent window.
--
--     If the window is already the child of an existing window, it will be reparented to the new owner. Setting the parent window to NULL unparents the window and removes child window status.
--
--     If a parent window is hidden or destroyed, the operation will be recursively applied to child windows. Child windows hidden with the parent that did not have their hidden status explicitly set will be restored when the parent is shown.
--
--     Attempting to set the parent of a window that is currently in the modal state will fail. Use @'setWindowModal'@ to cancel the modal status before attempting to change the parent.
--
--     Popup windows cannot change parents and attempts to do so will fail.
--
--     Setting a parent window that is currently the sibling or descendent of the child window results in undefined behavior.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowModal'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowParent@.
--                   The unsafe flavor is 'setWindowParent'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowParent@, defined at @SDL3\/SDL_video.h 2757:34@
setWindowParentSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window that should become the child of a parent.
  -> BG.Ptr SDL_Window
  -- ^
  --
  --           [@parent@]: the new parent window for the child window.
  -> IO Bool
setWindowParentSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowParent x00 x11)

-- | Toggle the state of the window as modal.
--
--     To enable modal status on a window, the window must currently be the child window of a parent, or toggling modal status on will fail.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowParent', @SDL_WINDOW_MODAL@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowModal@.
--                   The safe flavor is 'setWindowModalSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowModal@, defined at @SDL3\/SDL_video.h 2777:34@
setWindowModal
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window on which to set the modal state.
  -> Bool
  -- ^
  --
  --           [@modal@]: true to toggle modal status on, false to toggle it off.
  -> IO Bool
setWindowModal =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowModal x00 (CBool.fromBool x11))

-- | Toggle the state of the window as modal.
--
--     To enable modal status on a window, the window must currently be the child window of a parent, or toggling modal status on will fail.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowParent', @SDL_WINDOW_MODAL@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowModal@.
--                   The unsafe flavor is 'setWindowModal'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowModal@, defined at @SDL3\/SDL_video.h 2777:34@
setWindowModalSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window on which to set the modal state.
  -> Bool
  -- ^
  --
  --           [@modal@]: true to toggle modal status on, false to toggle it off.
  -> IO Bool
setWindowModalSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowModal x00 (CBool.fromBool x11))

-- | Set whether the window may have input focus.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowFocusable@.
--                   The safe flavor is 'setWindowFocusableSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowFocusable@, defined at @SDL3\/SDL_video.h 2791:34@
setWindowFocusable
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to set focusable state.
  -> Bool
  -- ^
  --
  --           [@focusable@]: true to allow input focus, false to not allow input focus.
  -> IO Bool
setWindowFocusable =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowFocusable x00 (CBool.fromBool x11))

-- | Set whether the window may have input focus.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowFocusable@.
--                   The unsafe flavor is 'setWindowFocusable'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowFocusable@, defined at @SDL3\/SDL_video.h 2791:34@
setWindowFocusableSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to set focusable state.
  -> Bool
  -- ^
  --
  --           [@focusable@]: true to allow input focus, false to not allow input focus.
  -> IO Bool
setWindowFocusableSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowFocusable x00 (CBool.fromBool x11))

-- | Display the system-level window menu.
--
--     This default window menu is provided by the system and on some platforms provides functionality for setting or changing privileged state on the window, such as moving it between workspaces or displays, or toggling the always-on-top property.
--
--     On platforms or desktops where this is unsupported, this function does nothing.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ShowWindowSystemMenu@.
--                   The safe flavor is 'showWindowSystemMenuSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowWindowSystemMenu@, defined at @SDL3\/SDL_video.h 2817:34@
showWindowSystemMenu
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which the menu will be displayed.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the x coordinate of the menu, relative to the origin (top-left) of the client area.
  -> BG.Int32
  -- ^
  --
  --           [@y@]: the y coordinate of the menu, relative to the origin (top-left) of the client area.
  -> IO Bool
showWindowSystemMenu =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_ShowWindowSystemMenu x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Display the system-level window menu.
--
--     This default window menu is provided by the system and on some platforms provides functionality for setting or changing privileged state on the window, such as moving it between workspaces or displays, or toggling the always-on-top property.
--
--     On platforms or desktops where this is unsupported, this function does nothing.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShowWindowSystemMenu@.
--                   The unsafe flavor is 'showWindowSystemMenu'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowWindowSystemMenu@, defined at @SDL3\/SDL_video.h 2817:34@
showWindowSystemMenuSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which the menu will be displayed.
  -> BG.Int32
  -- ^
  --
  --           [@x@]: the x coordinate of the menu, relative to the origin (top-left) of the client area.
  -> BG.Int32
  -- ^
  --
  --           [@y@]: the y coordinate of the menu, relative to the origin (top-left) of the client area.
  -> IO Bool
showWindowSystemMenuSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_ShowWindowSystemMenu x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Provide a callback that decides if a window region has special properties.
--
--     Normally windows are dragged and resized by decorations provided by the system window manager (a title bar, borders, etc), but for some apps, it makes sense to drag them from somewhere else inside the window itself; for example, one might have a borderless window that wants to be draggable from any part, or simulate its own title bar, etc.
--
--     This function lets the app provide a callback that designates pieces of a given window as special. This callback is run during event processing if we need to tell the OS to treat a region of the window specially; the use of this callback is known as \"hit testing.\"
--
--     Mouse input may not be delivered to your application if it is within a special area; the OS will often apply that input to moving the window or resizing the window and not deliver it to the application.
--
--     Specifying NULL for a callback disables hit-testing. Hit-testing is disabled by default.
--
--     Platforms that don\'t support this functionality will return false unconditionally, even if you\'re attempting to disable hit-testing.
--
--     Your callback may fire at any time, and its firing does not indicate any specific behavior (for example, on Windows, this certainly might fire when the OS is deciding whether to drag your window, but it fires for lots of other reasons, too, some unrelated to anything you probably care about /and when the mouse isn\'t actually at the location it is testing/). Since this can fire at any time, you should try to keep your callback efficient, devoid of allocations, etc.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowHitTest@.
--                   The safe flavor is 'setWindowHitTestSafe'
--                   : registration; the hit test runs during event pumping.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowHitTest@, defined at @SDL3\/SDL_video.h 2898:34@
setWindowHitTest
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to set hit-testing on.
  -> SDL_HitTest
  -- ^
  --
  --           [@callback@]: the function to call when doing a hit-test.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@callback_data@]: an app-defined void pointer passed to __callback__.
  -> IO Bool
setWindowHitTest =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetWindowHitTest x00 x11 x22)

-- | Provide a callback that decides if a window region has special properties.
--
--     Normally windows are dragged and resized by decorations provided by the system window manager (a title bar, borders, etc), but for some apps, it makes sense to drag them from somewhere else inside the window itself; for example, one might have a borderless window that wants to be draggable from any part, or simulate its own title bar, etc.
--
--     This function lets the app provide a callback that designates pieces of a given window as special. This callback is run during event processing if we need to tell the OS to treat a region of the window specially; the use of this callback is known as \"hit testing.\"
--
--     Mouse input may not be delivered to your application if it is within a special area; the OS will often apply that input to moving the window or resizing the window and not deliver it to the application.
--
--     Specifying NULL for a callback disables hit-testing. Hit-testing is disabled by default.
--
--     Platforms that don\'t support this functionality will return false unconditionally, even if you\'re attempting to disable hit-testing.
--
--     Your callback may fire at any time, and its firing does not indicate any specific behavior (for example, on Windows, this certainly might fire when the OS is deciding whether to drag your window, but it fires for lots of other reasons, too, some unrelated to anything you probably care about /and when the mouse isn\'t actually at the location it is testing/). Since this can fire at any time, you should try to keep your callback efficient, devoid of allocations, etc.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowHitTest@.
--                   The unsafe flavor is 'setWindowHitTest'
--                   : registration; the hit test runs during event pumping.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowHitTest@, defined at @SDL3\/SDL_video.h 2898:34@
setWindowHitTestSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to set hit-testing on.
  -> SDL_HitTest
  -- ^
  --
  --           [@callback@]: the function to call when doing a hit-test.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@callback_data@]: an app-defined void pointer passed to __callback__.
  -> IO Bool
setWindowHitTestSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetWindowHitTest x00 x11 x22)

-- | Set the shape of a transparent window.
--
--     This sets the alpha channel of a transparent window and any fully transparent areas are also transparent to mouse clicks. If you are using something besides the SDL render API, then you are responsible for drawing the alpha channel of the window to match the shape alpha channel to get consistent cross-platform results.
--
--     The shape is copied inside this function, so you can free it afterwards. If your shape surface changes, you should call @'setWindowShape'@ again to update the window. This is an expensive operation, so should be done sparingly.
--
--     The window must have been created with the SDL_WINDOW_TRANSPARENT flag.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowShape@.
--                   The safe flavor is 'setWindowShapeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowShape@, defined at @SDL3\/SDL_video.h 2926:34@
setWindowShape
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@shape@]: the surface representing the shape of the window, or NULL to remove any current shape.
  -> IO Bool
setWindowShape =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowShape x00 x11)

-- | Set the shape of a transparent window.
--
--     This sets the alpha channel of a transparent window and any fully transparent areas are also transparent to mouse clicks. If you are using something besides the SDL render API, then you are responsible for drawing the alpha channel of the window to match the shape alpha channel to get consistent cross-platform results.
--
--     The shape is copied inside this function, so you can free it afterwards. If your shape surface changes, you should call @'setWindowShape'@ again to update the window. This is an expensive operation, so should be done sparingly.
--
--     The window must have been created with the SDL_WINDOW_TRANSPARENT flag.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowShape@.
--                   The unsafe flavor is 'setWindowShape'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowShape@, defined at @SDL3\/SDL_video.h 2926:34@
setWindowShapeSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@shape@]: the surface representing the shape of the window, or NULL to remove any current shape.
  -> IO Bool
setWindowShapeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowShape x00 x11)

-- | Request a window to demand attention from the user.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_FlashWindow@.
--                   The safe flavor is 'flashWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlashWindow@, defined at @SDL3\/SDL_video.h 2940:34@
flashWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to be flashed.
  -> SDL_FlashOperation
  -- ^
  --
  --           [@operation@]: the operation to perform.
  -> IO Bool
flashWindow =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_FlashWindow x00 x11)

-- | Request a window to demand attention from the user.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FlashWindow@.
--                   The unsafe flavor is 'flashWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlashWindow@, defined at @SDL3\/SDL_video.h 2940:34@
flashWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to be flashed.
  -> SDL_FlashOperation
  -- ^
  --
  --           [@operation@]: the operation to perform.
  -> IO Bool
flashWindowSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_FlashWindow x00 x11)

-- | Sets the state of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowProgressState@.
--                   The safe flavor is 'setWindowProgressStateSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowProgressState@, defined at @SDL3\/SDL_video.h 2955:34@
setWindowProgressState
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window whose progress state is to be modified.
  -> SDL_ProgressState
  -- ^
  --
  --           [@state@]: the progress state. @SDL_PROGRESS_STATE_NONE@ stops displaying the progress bar.
  -> IO Bool
setWindowProgressState =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowProgressState x00 x11)

-- | Sets the state of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowProgressState@.
--                   The unsafe flavor is 'setWindowProgressState'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowProgressState@, defined at @SDL3\/SDL_video.h 2955:34@
setWindowProgressStateSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window whose progress state is to be modified.
  -> SDL_ProgressState
  -- ^
  --
  --           [@state@]: the progress state. @SDL_PROGRESS_STATE_NONE@ stops displaying the progress bar.
  -> IO Bool
setWindowProgressStateSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowProgressState x00 x11)

-- | Get the state of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: the progress state, or @SDL_PROGRESS_STATE_INVALID@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowProgressState@.
--                   The safe flavor is 'getWindowProgressStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetWindowProgressState@, defined at @SDL3\/SDL_video.h 2968:47@
getWindowProgressState
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to get the current progress state from.
  -> IO SDL_ProgressState
getWindowProgressState =
  Unsafe.sDL_GetWindowProgressState

-- | Get the state of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: the progress state, or @SDL_PROGRESS_STATE_INVALID@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowProgressState@.
--                   The unsafe flavor is 'getWindowProgressState'
--                   .
--
--     [C declaration]: @SDL_GetWindowProgressState@, defined at @SDL3\/SDL_video.h 2968:47@
getWindowProgressStateSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to get the current progress state from.
  -> IO SDL_ProgressState
getWindowProgressStateSafe =
  Safe.sDL_GetWindowProgressState

-- | Sets the value of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowProgressValue@.
--                   The safe flavor is 'setWindowProgressValueSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowProgressValue@, defined at @SDL3\/SDL_video.h 2983:34@
setWindowProgressValue
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window whose progress value is to be modified.
  -> Float
  -- ^
  --
  --           [@value@]: the progress value in the range of [0.0f - 1.0f]. If the value is outside the valid range, it gets clamped.
  -> IO Bool
setWindowProgressValue =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowProgressValue x00 (Coerce.coerce x11))

-- | Sets the value of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowProgressValue@.
--                   The unsafe flavor is 'setWindowProgressValue'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowProgressValue@, defined at @SDL3\/SDL_video.h 2983:34@
setWindowProgressValueSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window whose progress value is to be modified.
  -> Float
  -- ^
  --
  --           [@value@]: the progress value in the range of [0.0f - 1.0f]. If the value is outside the valid range, it gets clamped.
  -> IO Bool
setWindowProgressValueSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowProgressValue x00 (Coerce.coerce x11))

-- | Get the value of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: the progress value in the range of [0.0f - 1.0f], or -1.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowProgressValue@.
--                   The safe flavor is 'getWindowProgressValueSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowProgressValue@, defined at @SDL3\/SDL_video.h 2996:35@
getWindowProgressValue
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to get the current progress value from.
  -> IO Float
getWindowProgressValue =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetWindowProgressValue x00)

-- | Get the value of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: the progress value in the range of [0.0f - 1.0f], or -1.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowProgressValue@.
--                   The unsafe flavor is 'getWindowProgressValue'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowProgressValue@, defined at @SDL3\/SDL_video.h 2996:35@
getWindowProgressValueSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to get the current progress value from.
  -> IO Float
getWindowProgressValueSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetWindowProgressValue x00)

-- | Destroy a window.
--
--     Any child windows owned by the window will be recursively destroyed as well.
--
--     Note that on some platforms, the visible window may not actually be removed from the screen until the SDL event loop is pumped again, even though the 'SDL_Window' is no longer valid after this call.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createPopupWindow', 'createWindow', 'createWindowWithProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyWindow@.
--                   The safe flavor is 'destroyWindowSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyWindow@, defined at @SDL3\/SDL_video.h 3018:34@
destroyWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to destroy.
  -> IO ()
destroyWindow = Unsafe.sDL_DestroyWindow

-- | Destroy a window.
--
--     Any child windows owned by the window will be recursively destroyed as well.
--
--     Note that on some platforms, the visible window may not actually be removed from the screen until the SDL event loop is pumped again, even though the 'SDL_Window' is no longer valid after this call.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createPopupWindow', 'createWindow', 'createWindowWithProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyWindow@.
--                   The unsafe flavor is 'destroyWindow'
--                   .
--
--     [C declaration]: @SDL_DestroyWindow@, defined at @SDL3\/SDL_video.h 3018:34@
destroyWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to destroy.
  -> IO ()
destroyWindowSafe = Safe.sDL_DestroyWindow

-- | Check whether the screensaver is currently enabled.
--
--     The screensaver is disabled by default.
--
--     The default can also be changed using @SDL_HINT_VIDEO_ALLOW_SCREENSAVER@.
--
--     [Returns]: true if the screensaver is enabled, false if it is disabled.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'disableScreenSaver', 'enableScreenSaver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ScreenSaverEnabled@.
--                   The safe flavor is 'screenSaverEnabledSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ScreenSaverEnabled@, defined at @SDL3\/SDL_video.h 3037:34@
screenSaverEnabled :: IO Bool
screenSaverEnabled =
  fmap CBool.toBool Unsafe.sDL_ScreenSaverEnabled

-- | Check whether the screensaver is currently enabled.
--
--     The screensaver is disabled by default.
--
--     The default can also be changed using @SDL_HINT_VIDEO_ALLOW_SCREENSAVER@.
--
--     [Returns]: true if the screensaver is enabled, false if it is disabled.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'disableScreenSaver', 'enableScreenSaver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ScreenSaverEnabled@.
--                   The unsafe flavor is 'screenSaverEnabled'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ScreenSaverEnabled@, defined at @SDL3\/SDL_video.h 3037:34@
screenSaverEnabledSafe :: IO Bool
screenSaverEnabledSafe =
  fmap CBool.toBool Safe.sDL_ScreenSaverEnabled

-- | Allow the screen to be blanked by a screen saver.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'disableScreenSaver', 'screenSaverEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EnableScreenSaver@.
--                   The safe flavor is 'enableScreenSaverSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_EnableScreenSaver@, defined at @SDL3\/SDL_video.h 3052:34@
enableScreenSaver :: IO Bool
enableScreenSaver =
  fmap CBool.toBool Unsafe.sDL_EnableScreenSaver

-- | Allow the screen to be blanked by a screen saver.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'disableScreenSaver', 'screenSaverEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EnableScreenSaver@.
--                   The unsafe flavor is 'enableScreenSaver'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_EnableScreenSaver@, defined at @SDL3\/SDL_video.h 3052:34@
enableScreenSaverSafe :: IO Bool
enableScreenSaverSafe =
  fmap CBool.toBool Safe.sDL_EnableScreenSaver

-- | Prevent the screen from being blanked by a screen saver.
--
--     If you disable the screensaver, it is automatically re-enabled when SDL quits.
--
--     The screensaver is disabled by default, but this may by changed by SDL_HINT_VIDEO_ALLOW_SCREENSAVER.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'enableScreenSaver', 'screenSaverEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DisableScreenSaver@.
--                   The safe flavor is 'disableScreenSaverSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DisableScreenSaver@, defined at @SDL3\/SDL_video.h 3073:34@
disableScreenSaver :: IO Bool
disableScreenSaver =
  fmap CBool.toBool Unsafe.sDL_DisableScreenSaver

-- | Prevent the screen from being blanked by a screen saver.
--
--     If you disable the screensaver, it is automatically re-enabled when SDL quits.
--
--     The screensaver is disabled by default, but this may by changed by SDL_HINT_VIDEO_ALLOW_SCREENSAVER.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'enableScreenSaver', 'screenSaverEnabled'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DisableScreenSaver@.
--                   The unsafe flavor is 'disableScreenSaver'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_DisableScreenSaver@, defined at @SDL3\/SDL_video.h 3073:34@
disableScreenSaverSafe :: IO Bool
disableScreenSaverSafe =
  fmap CBool.toBool Safe.sDL_DisableScreenSaver

-- | Dynamically load an OpenGL library.
--
--     This should be done after initializing the video driver, but before creating any OpenGL windows. If no OpenGL library is loaded, the default library will be loaded upon creation of the first OpenGL window.
--
--     If you do this, you need to retrieve all of the GL functions used in your program from the dynamic library using @'glGetProcAddress'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glGetProcAddress', 'glUnloadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_LoadLibrary@.
--                   The safe flavor is 'glLoadLibrarySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_LoadLibrary@, defined at @SDL3\/SDL_video.h 3103:34@
glLoadLibrary
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the platform dependent OpenGL library name, or NULL to open the default OpenGL library.
  -> IO Bool
glLoadLibrary =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GL_LoadLibrary x00)

-- | Dynamically load an OpenGL library.
--
--     This should be done after initializing the video driver, but before creating any OpenGL windows. If no OpenGL library is loaded, the default library will be loaded upon creation of the first OpenGL window.
--
--     If you do this, you need to retrieve all of the GL functions used in your program from the dynamic library using @'glGetProcAddress'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glGetProcAddress', 'glUnloadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_LoadLibrary@.
--                   The unsafe flavor is 'glLoadLibrary'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_LoadLibrary@, defined at @SDL3\/SDL_video.h 3103:34@
glLoadLibrarySafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the platform dependent OpenGL library name, or NULL to open the default OpenGL library.
  -> IO Bool
glLoadLibrarySafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GL_LoadLibrary x00)

-- | Get an OpenGL function by name.
--
--     If the GL library is loaded at runtime with @'glLoadLibrary'@, then all GL functions must be retrieved this way. Usually this is used to retrieve function pointers to OpenGL extensions.
--
--     There are some quirks to looking up OpenGL functions that require some extra care from the application. If you code carefully, you can handle these quirks without any platform-specific code, though:
--
--     * On Windows, function pointers are specific to the current GL context; this means you need to have created a GL context and made it current before calling @'glGetProcAddress'@. If you recreate your context or create a second context, you should assume that any existing function pointers aren\'t valid to use with it. This is (currently) a Windows-specific limitation, and in practice lots of drivers don\'t suffer this limitation, but it is still the way the wgl API is documented to work and you should expect crashes if you don\'t respect it. Store a copy of the function pointers that comes and goes with context lifespan.
--
--     * On X11, function pointers returned by this function are valid for any context, and can even be looked up before a context is created at all. This means that, for at least some common OpenGL implementations, if you look up a function that doesn\'t exist, you\'ll get a non-NULL result that is /NOT/ safe to call. You must always make sure the function is actually available for a given GL context before calling it, by checking for the existence of the appropriate extension with @'glExtensionSupported'@, or verifying that the version of OpenGL you\'re using offers the function as core functionality.
--
--     * Some OpenGL drivers, on all platforms, /will/ return NULL if a function isn\'t supported, but you can\'t count on this behavior. Check for extensions you use, and if you get a NULL anyway, act as if that extension wasn\'t available. This is probably a bug in the driver, but you can code defensively for this scenario anyhow.
--
--     * Just because you\'re on Linux\/Unix, don\'t assume you\'ll be using X11. Next-gen display servers are waiting to replace it, and may or may not make the same promises about function pointers.
--
--     * OpenGL function pointers must be declared @APIENTRY@ as in the example code. This will ensure the proper calling convention is followed on platforms where this matters (Win32) thereby avoiding stack corruption.
--
--     [Returns]: a pointer to the named OpenGL function. The returned pointer should be cast to the appropriate function signature.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glExtensionSupported', 'glLoadLibrary', 'glUnloadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_GetProcAddress@.
--                   The safe flavor is 'glGetProcAddressSafe'
--                   .
--
--     [C declaration]: @SDL_GL_GetProcAddress@, defined at @SDL3\/SDL_video.h 3158:49@
glGetProcAddress
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@proc@]: the name of an OpenGL function.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
glGetProcAddress = Unsafe.sDL_GL_GetProcAddress

-- | Get an OpenGL function by name.
--
--     If the GL library is loaded at runtime with @'glLoadLibrary'@, then all GL functions must be retrieved this way. Usually this is used to retrieve function pointers to OpenGL extensions.
--
--     There are some quirks to looking up OpenGL functions that require some extra care from the application. If you code carefully, you can handle these quirks without any platform-specific code, though:
--
--     * On Windows, function pointers are specific to the current GL context; this means you need to have created a GL context and made it current before calling @'glGetProcAddress'@. If you recreate your context or create a second context, you should assume that any existing function pointers aren\'t valid to use with it. This is (currently) a Windows-specific limitation, and in practice lots of drivers don\'t suffer this limitation, but it is still the way the wgl API is documented to work and you should expect crashes if you don\'t respect it. Store a copy of the function pointers that comes and goes with context lifespan.
--
--     * On X11, function pointers returned by this function are valid for any context, and can even be looked up before a context is created at all. This means that, for at least some common OpenGL implementations, if you look up a function that doesn\'t exist, you\'ll get a non-NULL result that is /NOT/ safe to call. You must always make sure the function is actually available for a given GL context before calling it, by checking for the existence of the appropriate extension with @'glExtensionSupported'@, or verifying that the version of OpenGL you\'re using offers the function as core functionality.
--
--     * Some OpenGL drivers, on all platforms, /will/ return NULL if a function isn\'t supported, but you can\'t count on this behavior. Check for extensions you use, and if you get a NULL anyway, act as if that extension wasn\'t available. This is probably a bug in the driver, but you can code defensively for this scenario anyhow.
--
--     * Just because you\'re on Linux\/Unix, don\'t assume you\'ll be using X11. Next-gen display servers are waiting to replace it, and may or may not make the same promises about function pointers.
--
--     * OpenGL function pointers must be declared @APIENTRY@ as in the example code. This will ensure the proper calling convention is followed on platforms where this matters (Win32) thereby avoiding stack corruption.
--
--     [Returns]: a pointer to the named OpenGL function. The returned pointer should be cast to the appropriate function signature.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glExtensionSupported', 'glLoadLibrary', 'glUnloadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_GetProcAddress@.
--                   The unsafe flavor is 'glGetProcAddress'
--                   .
--
--     [C declaration]: @SDL_GL_GetProcAddress@, defined at @SDL3\/SDL_video.h 3158:49@
glGetProcAddressSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@proc@]: the name of an OpenGL function.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
glGetProcAddressSafe = Safe.sDL_GL_GetProcAddress

-- | Get an EGL library function by name.
--
--     If an EGL library is loaded, this function allows applications to get entry points for EGL functions. This is useful to provide to an EGL API and extension loader.
--
--     [Returns]: a pointer to the named EGL function. The returned pointer should be cast to the appropriate function signature.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'eglGetCurrentDisplay'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EGL_GetProcAddress@.
--                   The safe flavor is 'eglGetProcAddressSafe'
--                   .
--
--     [C declaration]: @SDL_EGL_GetProcAddress@, defined at @SDL3\/SDL_video.h 3177:49@
eglGetProcAddress
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@proc@]: the name of an EGL function.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
eglGetProcAddress = Unsafe.sDL_EGL_GetProcAddress

-- | Get an EGL library function by name.
--
--     If an EGL library is loaded, this function allows applications to get entry points for EGL functions. This is useful to provide to an EGL API and extension loader.
--
--     [Returns]: a pointer to the named EGL function. The returned pointer should be cast to the appropriate function signature.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'eglGetCurrentDisplay'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EGL_GetProcAddress@.
--                   The unsafe flavor is 'eglGetProcAddress'
--                   .
--
--     [C declaration]: @SDL_EGL_GetProcAddress@, defined at @SDL3\/SDL_video.h 3177:49@
eglGetProcAddressSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@proc@]: the name of an EGL function.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
eglGetProcAddressSafe = Safe.sDL_EGL_GetProcAddress

-- | Unload the OpenGL library previously loaded by @'glLoadLibrary'@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glLoadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_UnloadLibrary@.
--                   The safe flavor is 'glUnloadLibrarySafe'
--                   .
--
--     [C declaration]: @SDL_GL_UnloadLibrary@, defined at @SDL3\/SDL_video.h 3188:34@
glUnloadLibrary :: IO ()
glUnloadLibrary = Unsafe.sDL_GL_UnloadLibrary

-- | Unload the OpenGL library previously loaded by @'glLoadLibrary'@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glLoadLibrary'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_UnloadLibrary@.
--                   The unsafe flavor is 'glUnloadLibrary'
--                   .
--
--     [C declaration]: @SDL_GL_UnloadLibrary@, defined at @SDL3\/SDL_video.h 3188:34@
glUnloadLibrarySafe :: IO ()
glUnloadLibrarySafe = Safe.sDL_GL_UnloadLibrary

-- | Check if an OpenGL extension is supported for the current context.
--
--     This function operates on the current GL context; you must have created a context and it must be current before calling this function. Do not assume that all contexts you create will have the same set of extensions available, or that recreating an existing context will offer the same extensions again.
--
--     While it\'s probably not a massive overhead, this function is not an O(1) operation. Check the extensions you care about after creating the GL context and save that information somewhere instead of calling the function every time you need to know.
--
--     [Returns]: true if the extension is supported, false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_ExtensionSupported@.
--                   The safe flavor is 'glExtensionSupportedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_ExtensionSupported@, defined at @SDL3\/SDL_video.h 3211:34@
glExtensionSupported
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@extension@]: the name of the extension to check.
  -> IO Bool
glExtensionSupported =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GL_ExtensionSupported x00)

-- | Check if an OpenGL extension is supported for the current context.
--
--     This function operates on the current GL context; you must have created a context and it must be current before calling this function. Do not assume that all contexts you create will have the same set of extensions available, or that recreating an existing context will offer the same extensions again.
--
--     While it\'s probably not a massive overhead, this function is not an O(1) operation. Check the extensions you care about after creating the GL context and save that information somewhere instead of calling the function every time you need to know.
--
--     [Returns]: true if the extension is supported, false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_ExtensionSupported@.
--                   The unsafe flavor is 'glExtensionSupported'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_ExtensionSupported@, defined at @SDL3\/SDL_video.h 3211:34@
glExtensionSupportedSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@extension@]: the name of the extension to check.
  -> IO Bool
glExtensionSupportedSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GL_ExtensionSupported x00)

-- | Reset all previously set OpenGL context attributes to their default values.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glGetAttribute', 'glSetAttribute'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_ResetAttributes@.
--                   The safe flavor is 'glResetAttributesSafe'
--                   .
--
--     [C declaration]: @SDL_GL_ResetAttributes@, defined at @SDL3\/SDL_video.h 3223:34@
glResetAttributes :: IO ()
glResetAttributes = Unsafe.sDL_GL_ResetAttributes

-- | Reset all previously set OpenGL context attributes to their default values.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glGetAttribute', 'glSetAttribute'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_ResetAttributes@.
--                   The unsafe flavor is 'glResetAttributes'
--                   .
--
--     [C declaration]: @SDL_GL_ResetAttributes@, defined at @SDL3\/SDL_video.h 3223:34@
glResetAttributesSafe :: IO ()
glResetAttributesSafe = Safe.sDL_GL_ResetAttributes

-- | Set an OpenGL window attribute before window creation.
--
--     This function sets the OpenGL attribute @attr@ to @value@. The requested attributes should be set before creating an OpenGL window. You should use @'glGetAttribute'@ to check the values after creating the OpenGL context, since the values obtained can differ from the requested ones.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glCreateContext', 'glGetAttribute', 'glResetAttributes'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_SetAttribute@.
--                   The safe flavor is 'glSetAttributeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_SetAttribute@, defined at @SDL3\/SDL_video.h 3246:34@
glSetAttribute
  :: SDL_GLAttr
  -- ^
  --
  --           [@attr@]: an enum value specifying the OpenGL attribute to set.
  -> BG.Int32
  -- ^
  --
  --           [@value@]: the desired value for the attribute.
  -> IO Bool
glSetAttribute =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GL_SetAttribute x00 (Coerce.coerce x11))

-- | Set an OpenGL window attribute before window creation.
--
--     This function sets the OpenGL attribute @attr@ to @value@. The requested attributes should be set before creating an OpenGL window. You should use @'glGetAttribute'@ to check the values after creating the OpenGL context, since the values obtained can differ from the requested ones.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glCreateContext', 'glGetAttribute', 'glResetAttributes'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_SetAttribute@.
--                   The unsafe flavor is 'glSetAttribute'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_SetAttribute@, defined at @SDL3\/SDL_video.h 3246:34@
glSetAttributeSafe
  :: SDL_GLAttr
  -- ^
  --
  --           [@attr@]: an enum value specifying the OpenGL attribute to set.
  -> BG.Int32
  -- ^
  --
  --           [@value@]: the desired value for the attribute.
  -> IO Bool
glSetAttributeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GL_SetAttribute x00 (Coerce.coerce x11))

-- | Get the actual value for an attribute from the current context.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glResetAttributes', 'glSetAttribute'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_GetAttribute@.
--                   The safe flavor is 'glGetAttributeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_GetAttribute@, defined at @SDL3\/SDL_video.h 3264:34@
glGetAttribute
  :: SDL_GLAttr
  -- ^
  --
  --           [@attr@]: an 'SDL_GLAttr' enum value specifying the OpenGL attribute to get.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@value@]: a pointer filled in with the current value of @attr@.
  -> IO Bool
glGetAttribute =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GL_GetAttribute x00 x11)

-- | Get the actual value for an attribute from the current context.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glResetAttributes', 'glSetAttribute'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_GetAttribute@.
--                   The unsafe flavor is 'glGetAttribute'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_GetAttribute@, defined at @SDL3\/SDL_video.h 3264:34@
glGetAttributeSafe
  :: SDL_GLAttr
  -- ^
  --
  --           [@attr@]: an 'SDL_GLAttr' enum value specifying the OpenGL attribute to get.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@value@]: a pointer filled in with the current value of @attr@.
  -> IO Bool
glGetAttributeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GL_GetAttribute x00 x11)

-- | Create an OpenGL context for an OpenGL window, and make it current.
--
--     The OpenGL context will be created with the current states set through @'glSetAttribute'@.
--
--     The 'SDL_Window' specified must have been created with the SDL_WINDOW_OPENGL flag, or context creation will fail.
--
--     Windows users new to OpenGL should note that, for historical reasons, GL functions added after OpenGL version 1.1 are not available by default. Those functions must be loaded at run-time, either with an OpenGL extension-handling library or with @'glGetProcAddress'@ and its related functions.
--
--     'SDL_GLContext' is opaque to the application.
--
--     [Returns]: the OpenGL context associated with @window@ or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glDestroyContext', 'glMakeCurrent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_CreateContext@.
--                   The safe flavor is 'glCreateContextSafe'
--                   .
--
--     [C declaration]: @SDL_GL_CreateContext@, defined at @SDL3\/SDL_video.h 3294:43@
glCreateContext
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to associate with the context.
  -> IO SDL_GLContext
glCreateContext = Unsafe.sDL_GL_CreateContext

-- | Create an OpenGL context for an OpenGL window, and make it current.
--
--     The OpenGL context will be created with the current states set through @'glSetAttribute'@.
--
--     The 'SDL_Window' specified must have been created with the SDL_WINDOW_OPENGL flag, or context creation will fail.
--
--     Windows users new to OpenGL should note that, for historical reasons, GL functions added after OpenGL version 1.1 are not available by default. Those functions must be loaded at run-time, either with an OpenGL extension-handling library or with @'glGetProcAddress'@ and its related functions.
--
--     'SDL_GLContext' is opaque to the application.
--
--     [Returns]: the OpenGL context associated with @window@ or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glDestroyContext', 'glMakeCurrent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_CreateContext@.
--                   The unsafe flavor is 'glCreateContext'
--                   .
--
--     [C declaration]: @SDL_GL_CreateContext@, defined at @SDL3\/SDL_video.h 3294:43@
glCreateContextSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to associate with the context.
  -> IO SDL_GLContext
glCreateContextSafe = Safe.sDL_GL_CreateContext

-- | Set up an OpenGL context for rendering into an OpenGL window.
--
--     The context must have been created with a compatible window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glCreateContext'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_MakeCurrent@.
--                   The safe flavor is 'glMakeCurrentSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_MakeCurrent@, defined at @SDL3\/SDL_video.h 3312:34@
glMakeCurrent
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to associate with the context.
  -> SDL_GLContext
  -- ^
  --
  --           [@context@]: the OpenGL context to associate with the window.
  -> IO Bool
glMakeCurrent =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GL_MakeCurrent x00 x11)

-- | Set up an OpenGL context for rendering into an OpenGL window.
--
--     The context must have been created with a compatible window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glCreateContext'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_MakeCurrent@.
--                   The unsafe flavor is 'glMakeCurrent'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_MakeCurrent@, defined at @SDL3\/SDL_video.h 3312:34@
glMakeCurrentSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to associate with the context.
  -> SDL_GLContext
  -- ^
  --
  --           [@context@]: the OpenGL context to associate with the window.
  -> IO Bool
glMakeCurrentSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GL_MakeCurrent x00 x11)

-- | Get the currently active OpenGL window.
--
--     [Returns]: the currently active OpenGL window on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_GetCurrentWindow@.
--                   The safe flavor is 'glGetCurrentWindowSafe'
--                   .
--
--     [C declaration]: @SDL_GL_GetCurrentWindow@, defined at @SDL3\/SDL_video.h 3324:42@
glGetCurrentWindow :: IO (BG.Ptr SDL_Window)
glGetCurrentWindow = Unsafe.sDL_GL_GetCurrentWindow

-- | Get the currently active OpenGL window.
--
--     [Returns]: the currently active OpenGL window on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_GetCurrentWindow@.
--                   The unsafe flavor is 'glGetCurrentWindow'
--                   .
--
--     [C declaration]: @SDL_GL_GetCurrentWindow@, defined at @SDL3\/SDL_video.h 3324:42@
glGetCurrentWindowSafe :: IO (BG.Ptr SDL_Window)
glGetCurrentWindowSafe = Safe.sDL_GL_GetCurrentWindow

-- | Get the currently active OpenGL context.
--
--     [Returns]: the currently active OpenGL context or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glMakeCurrent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_GetCurrentContext@.
--                   The safe flavor is 'glGetCurrentContextSafe'
--                   .
--
--     [C declaration]: @SDL_GL_GetCurrentContext@, defined at @SDL3\/SDL_video.h 3338:43@
glGetCurrentContext :: IO SDL_GLContext
glGetCurrentContext = Unsafe.sDL_GL_GetCurrentContext

-- | Get the currently active OpenGL context.
--
--     [Returns]: the currently active OpenGL context or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glMakeCurrent'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_GetCurrentContext@.
--                   The unsafe flavor is 'glGetCurrentContext'
--                   .
--
--     [C declaration]: @SDL_GL_GetCurrentContext@, defined at @SDL3\/SDL_video.h 3338:43@
glGetCurrentContextSafe :: IO SDL_GLContext
glGetCurrentContextSafe =
  Safe.sDL_GL_GetCurrentContext

-- | Get the currently active EGL display.
--
--     [Returns]: the currently active EGL display or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EGL_GetCurrentDisplay@.
--                   The safe flavor is 'eglGetCurrentDisplaySafe'
--                   .
--
--     [C declaration]: @SDL_EGL_GetCurrentDisplay@, defined at @SDL3\/SDL_video.h 3350:44@
eglGetCurrentDisplay :: IO SDL_EGLDisplay
eglGetCurrentDisplay =
  Unsafe.sDL_EGL_GetCurrentDisplay

-- | Get the currently active EGL display.
--
--     [Returns]: the currently active EGL display or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EGL_GetCurrentDisplay@.
--                   The unsafe flavor is 'eglGetCurrentDisplay'
--                   .
--
--     [C declaration]: @SDL_EGL_GetCurrentDisplay@, defined at @SDL3\/SDL_video.h 3350:44@
eglGetCurrentDisplaySafe :: IO SDL_EGLDisplay
eglGetCurrentDisplaySafe =
  Safe.sDL_EGL_GetCurrentDisplay

-- | Get the currently active EGL config.
--
--     [Returns]: the currently active EGL config or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EGL_GetCurrentConfig@.
--                   The safe flavor is 'eglGetCurrentConfigSafe'
--                   .
--
--     [C declaration]: @SDL_EGL_GetCurrentConfig@, defined at @SDL3\/SDL_video.h 3362:43@
eglGetCurrentConfig :: IO SDL_EGLConfig
eglGetCurrentConfig = Unsafe.sDL_EGL_GetCurrentConfig

-- | Get the currently active EGL config.
--
--     [Returns]: the currently active EGL config or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EGL_GetCurrentConfig@.
--                   The unsafe flavor is 'eglGetCurrentConfig'
--                   .
--
--     [C declaration]: @SDL_EGL_GetCurrentConfig@, defined at @SDL3\/SDL_video.h 3362:43@
eglGetCurrentConfigSafe :: IO SDL_EGLConfig
eglGetCurrentConfigSafe =
  Safe.sDL_EGL_GetCurrentConfig

-- | Get the EGL surface associated with the window.
--
--     [Returns]: the EGLSurface pointer associated with the window, or NULL on failure.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EGL_GetWindowSurface@.
--                   The safe flavor is 'eglGetWindowSurfaceSafe'
--                   .
--
--     [C declaration]: @SDL_EGL_GetWindowSurface@, defined at @SDL3\/SDL_video.h 3375:44@
eglGetWindowSurface
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_EGLSurface
eglGetWindowSurface = Unsafe.sDL_EGL_GetWindowSurface

-- | Get the EGL surface associated with the window.
--
--     [Returns]: the EGLSurface pointer associated with the window, or NULL on failure.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EGL_GetWindowSurface@.
--                   The unsafe flavor is 'eglGetWindowSurface'
--                   .
--
--     [C declaration]: @SDL_EGL_GetWindowSurface@, defined at @SDL3\/SDL_video.h 3375:44@
eglGetWindowSurfaceSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_EGLSurface
eglGetWindowSurfaceSafe =
  Safe.sDL_EGL_GetWindowSurface

-- | Sets the callbacks for defining custom EGLAttrib arrays for EGL initialization.
--
--     Callbacks that aren\'t needed can be set to NULL.
--
--     NOTE: These callback pointers will be reset after 'glResetAttributes'.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_EGL_SetAttributeCallbacks@.
--                   The safe flavor is 'eglSetAttributeCallbacksSafe'
--                   : registration; callbacks fire during later EGL context creation.
--
--     [C declaration]: @SDL_EGL_SetAttributeCallbacks@, defined at @SDL3\/SDL_video.h 3397:34@
eglSetAttributeCallbacks
  :: SDL_EGLAttribArrayCallback
  -- ^
  --
  --           [@platformAttribCallback@]: callback for attributes to pass to eglGetPlatformDisplay. May be NULL.
  -> SDL_EGLIntArrayCallback
  -- ^
  --
  --           [@surfaceAttribCallback@]: callback for attributes to pass to eglCreateSurface. May be NULL.
  -> SDL_EGLIntArrayCallback
  -- ^
  --
  --           [@contextAttribCallback@]: callback for attributes to pass to eglCreateContext. May be NULL.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to the callbacks.
  -> IO ()
eglSetAttributeCallbacks =
  Unsafe.sDL_EGL_SetAttributeCallbacks

-- | Sets the callbacks for defining custom EGLAttrib arrays for EGL initialization.
--
--     Callbacks that aren\'t needed can be set to NULL.
--
--     NOTE: These callback pointers will be reset after 'glResetAttributes'.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EGL_SetAttributeCallbacks@.
--                   The unsafe flavor is 'eglSetAttributeCallbacks'
--                   : registration; callbacks fire during later EGL context creation.
--
--     [C declaration]: @SDL_EGL_SetAttributeCallbacks@, defined at @SDL3\/SDL_video.h 3397:34@
eglSetAttributeCallbacksSafe
  :: SDL_EGLAttribArrayCallback
  -- ^
  --
  --           [@platformAttribCallback@]: callback for attributes to pass to eglGetPlatformDisplay. May be NULL.
  -> SDL_EGLIntArrayCallback
  -- ^
  --
  --           [@surfaceAttribCallback@]: callback for attributes to pass to eglCreateSurface. May be NULL.
  -> SDL_EGLIntArrayCallback
  -- ^
  --
  --           [@contextAttribCallback@]: callback for attributes to pass to eglCreateContext. May be NULL.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to the callbacks.
  -> IO ()
eglSetAttributeCallbacksSafe =
  Safe.sDL_EGL_SetAttributeCallbacks

-- | Set the swap interval for the current OpenGL context.
--
--     Some systems allow specifying -1 for the interval, to enable adaptive vsync. Adaptive vsync works the same as vsync, but if you\'ve already missed the vertical retrace for a given frame, it swaps buffers immediately, which might be less jarring for the user during occasional framerate drops. If an application requests adaptive vsync and the system does not support it, this function will fail and return false. In such a case, you should probably retry the call with 1 for the interval.
--
--     Adaptive vsync is implemented for some glX drivers with GLX_EXT_swap_control_tear, and for some Windows drivers with WGL_EXT_swap_control_tear.
--
--     Read more on the Khronos wiki: [https:\/\/www.khronos.org\/opengl\/wiki\/Swap_Interval\#Adaptive_Vsync](https://www.khronos.org/opengl/wiki/Swap_Interval#Adaptive_Vsync)
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glGetSwapInterval'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_SetSwapInterval@.
--                   The safe flavor is 'glSetSwapIntervalSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_SetSwapInterval@, defined at @SDL3\/SDL_video.h 3430:34@
glSetSwapInterval
  :: BG.Int32
  -- ^
  --
  --           [@interval@]: 0 for immediate updates, 1 for updates synchronized with the vertical retrace, -1 for adaptive vsync.
  -> IO Bool
glSetSwapInterval =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GL_SetSwapInterval (Coerce.coerce x00))

-- | Set the swap interval for the current OpenGL context.
--
--     Some systems allow specifying -1 for the interval, to enable adaptive vsync. Adaptive vsync works the same as vsync, but if you\'ve already missed the vertical retrace for a given frame, it swaps buffers immediately, which might be less jarring for the user during occasional framerate drops. If an application requests adaptive vsync and the system does not support it, this function will fail and return false. In such a case, you should probably retry the call with 1 for the interval.
--
--     Adaptive vsync is implemented for some glX drivers with GLX_EXT_swap_control_tear, and for some Windows drivers with WGL_EXT_swap_control_tear.
--
--     Read more on the Khronos wiki: [https:\/\/www.khronos.org\/opengl\/wiki\/Swap_Interval\#Adaptive_Vsync](https://www.khronos.org/opengl/wiki/Swap_Interval#Adaptive_Vsync)
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glGetSwapInterval'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_SetSwapInterval@.
--                   The unsafe flavor is 'glSetSwapInterval'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_SetSwapInterval@, defined at @SDL3\/SDL_video.h 3430:34@
glSetSwapIntervalSafe
  :: BG.Int32
  -- ^
  --
  --           [@interval@]: 0 for immediate updates, 1 for updates synchronized with the vertical retrace, -1 for adaptive vsync.
  -> IO Bool
glSetSwapIntervalSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GL_SetSwapInterval (Coerce.coerce x00))

-- | Get the swap interval for the current OpenGL context.
--
--     If the system can\'t determine the swap interval, or there isn\'t a valid current context, this function will set *interval to 0 as a safe default.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glSetSwapInterval'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_GetSwapInterval@.
--                   The safe flavor is 'glGetSwapIntervalSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_GetSwapInterval@, defined at @SDL3\/SDL_video.h 3451:34@
glGetSwapInterval
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@interval@]: output interval value. 0 if there is no vertical retrace synchronization, 1 if the buffer swap is synchronized with the vertical retrace, and -1 if late swaps happen immediately instead of waiting for the next retrace.
  -> IO Bool
glGetSwapInterval =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GL_GetSwapInterval x00)

-- | Get the swap interval for the current OpenGL context.
--
--     If the system can\'t determine the swap interval, or there isn\'t a valid current context, this function will set *interval to 0 as a safe default.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glSetSwapInterval'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_GetSwapInterval@.
--                   The unsafe flavor is 'glGetSwapInterval'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_GetSwapInterval@, defined at @SDL3\/SDL_video.h 3451:34@
glGetSwapIntervalSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@interval@]: output interval value. 0 if there is no vertical retrace synchronization, 1 if the buffer swap is synchronized with the vertical retrace, and -1 if late swaps happen immediately instead of waiting for the next retrace.
  -> IO Bool
glGetSwapIntervalSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GL_GetSwapInterval x00)

-- | Update a window with OpenGL rendering.
--
--     This is used with double-buffered OpenGL contexts, which are the default.
--
--     On macOS, make sure you bind 0 to the draw framebuffer before swapping the window, otherwise nothing will happen. If you aren\'t using glBindFramebuffer(), this is the default and you won\'t have to do anything extra.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_SwapWindow@.
--                   The safe flavor is 'glSwapWindowSafe'
--                   : can block on vsync.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_SwapWindow@, defined at @SDL3\/SDL_video.h 3471:34@
glSwapWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> IO Bool
glSwapWindow =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GL_SwapWindow x00)

-- | Update a window with OpenGL rendering.
--
--     This is used with double-buffered OpenGL contexts, which are the default.
--
--     On macOS, make sure you bind 0 to the draw framebuffer before swapping the window, otherwise nothing will happen. If you aren\'t using glBindFramebuffer(), this is the default and you won\'t have to do anything extra.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_SwapWindow@.
--                   The unsafe flavor is 'glSwapWindow'
--                   : can block on vsync.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_SwapWindow@, defined at @SDL3\/SDL_video.h 3471:34@
glSwapWindowSafe
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> IO Bool
glSwapWindowSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GL_SwapWindow x00)

-- | Delete an OpenGL context.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glCreateContext'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GL_DestroyContext@.
--                   The safe flavor is 'glDestroyContextSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_DestroyContext@, defined at @SDL3\/SDL_video.h 3486:34@
glDestroyContext
  :: SDL_GLContext
  -- ^
  --
  --           [@context@]: the OpenGL context to be deleted.
  -> IO Bool
glDestroyContext =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GL_DestroyContext x00)

-- | Delete an OpenGL context.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'glCreateContext'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GL_DestroyContext@.
--                   The unsafe flavor is 'glDestroyContext'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GL_DestroyContext@, defined at @SDL3\/SDL_video.h 3486:34@
glDestroyContextSafe
  :: SDL_GLContext
  -- ^
  --
  --           [@context@]: the OpenGL context to be deleted.
  -> IO Bool
glDestroyContextSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GL_DestroyContext x00)

-- | Typed constant for macro @SDL_GL_CONTEXT_DEBUG_FLAG@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GL_CONTEXT_DEBUG_FLAG :: SDL_GLContextFlag
pattern SDL_GL_CONTEXT_DEBUG_FLAG = SDL_GLContextFlag 0x00000001

-- | Typed constant for macro @SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG :: SDL_GLContextFlag
pattern SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = SDL_GLContextFlag 0x00000002

-- | Typed constant for macro @SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG :: SDL_GLContextFlag
pattern SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = SDL_GLContextFlag 0x00000004

-- | Typed constant for macro @SDL_GL_CONTEXT_RESET_ISOLATION_FLAG@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GL_CONTEXT_RESET_ISOLATION_FLAG :: SDL_GLContextFlag
pattern SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = SDL_GLContextFlag 0x00000008

-- | Typed constant for macro @SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE@.
pattern SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE :: SDL_GLContextReleaseFlag
pattern SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = SDL_GLContextReleaseFlag 0

-- | Typed constant for macro @SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH@.
pattern SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH :: SDL_GLContextReleaseFlag
pattern SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = SDL_GLContextReleaseFlag 1

-- | Typed constant for macro @SDL_GL_CONTEXT_RESET_NO_NOTIFICATION@.
pattern SDL_GL_CONTEXT_RESET_NO_NOTIFICATION :: SDL_GLContextResetNotification
pattern SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = SDL_GLContextResetNotification 0

-- | Typed constant for macro @SDL_GL_CONTEXT_RESET_LOSE_CONTEXT@.
pattern SDL_GL_CONTEXT_RESET_LOSE_CONTEXT :: SDL_GLContextResetNotification
pattern SDL_GL_CONTEXT_RESET_LOSE_CONTEXT = SDL_GLContextResetNotification 1

-- | Typed constant for macro @SDL_GL_CONTEXT_PROFILE_CORE@.
pattern SDL_GL_CONTEXT_PROFILE_CORE :: SDL_GLProfile
pattern SDL_GL_CONTEXT_PROFILE_CORE = SDL_GLProfile 1

-- | Typed constant for macro @SDL_GL_CONTEXT_PROFILE_COMPATIBILITY@.
pattern SDL_GL_CONTEXT_PROFILE_COMPATIBILITY :: SDL_GLProfile
pattern SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = SDL_GLProfile 2

-- | Typed constant for macro @SDL_GL_CONTEXT_PROFILE_ES@.
pattern SDL_GL_CONTEXT_PROFILE_ES :: SDL_GLProfile
pattern SDL_GL_CONTEXT_PROFILE_ES = SDL_GLProfile 4

-- | Typed constant for macro @SDL_WINDOW_FULLSCREEN@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_FULLSCREEN :: SDL_WindowFlags
pattern SDL_WINDOW_FULLSCREEN = SDL_WindowFlags 0x0000000000000001

-- | Typed constant for macro @SDL_WINDOW_OPENGL@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_OPENGL :: SDL_WindowFlags
pattern SDL_WINDOW_OPENGL = SDL_WindowFlags 0x0000000000000002

-- | Typed constant for macro @SDL_WINDOW_OCCLUDED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_OCCLUDED :: SDL_WindowFlags
pattern SDL_WINDOW_OCCLUDED = SDL_WindowFlags 0x0000000000000004

-- | Typed constant for macro @SDL_WINDOW_HIDDEN@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_HIDDEN :: SDL_WindowFlags
pattern SDL_WINDOW_HIDDEN = SDL_WindowFlags 0x0000000000000008

-- | Typed constant for macro @SDL_WINDOW_BORDERLESS@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_BORDERLESS :: SDL_WindowFlags
pattern SDL_WINDOW_BORDERLESS = SDL_WindowFlags 0x0000000000000010

-- | Typed constant for macro @SDL_WINDOW_RESIZABLE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_RESIZABLE :: SDL_WindowFlags
pattern SDL_WINDOW_RESIZABLE = SDL_WindowFlags 0x0000000000000020

-- | Typed constant for macro @SDL_WINDOW_MINIMIZED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_MINIMIZED :: SDL_WindowFlags
pattern SDL_WINDOW_MINIMIZED = SDL_WindowFlags 0x0000000000000040

-- | Typed constant for macro @SDL_WINDOW_MAXIMIZED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_MAXIMIZED :: SDL_WindowFlags
pattern SDL_WINDOW_MAXIMIZED = SDL_WindowFlags 0x0000000000000080

-- | Typed constant for macro @SDL_WINDOW_MOUSE_GRABBED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_MOUSE_GRABBED :: SDL_WindowFlags
pattern SDL_WINDOW_MOUSE_GRABBED = SDL_WindowFlags 0x0000000000000100

-- | Typed constant for macro @SDL_WINDOW_INPUT_FOCUS@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_INPUT_FOCUS :: SDL_WindowFlags
pattern SDL_WINDOW_INPUT_FOCUS = SDL_WindowFlags 0x0000000000000200

-- | Typed constant for macro @SDL_WINDOW_MOUSE_FOCUS@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_MOUSE_FOCUS :: SDL_WindowFlags
pattern SDL_WINDOW_MOUSE_FOCUS = SDL_WindowFlags 0x0000000000000400

-- | Typed constant for macro @SDL_WINDOW_EXTERNAL@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_EXTERNAL :: SDL_WindowFlags
pattern SDL_WINDOW_EXTERNAL = SDL_WindowFlags 0x0000000000000800

-- | Typed constant for macro @SDL_WINDOW_MODAL@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_MODAL :: SDL_WindowFlags
pattern SDL_WINDOW_MODAL = SDL_WindowFlags 0x0000000000001000

-- | Typed constant for macro @SDL_WINDOW_HIGH_PIXEL_DENSITY@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_HIGH_PIXEL_DENSITY :: SDL_WindowFlags
pattern SDL_WINDOW_HIGH_PIXEL_DENSITY = SDL_WindowFlags 0x0000000000002000

-- | Typed constant for macro @SDL_WINDOW_MOUSE_CAPTURE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_MOUSE_CAPTURE :: SDL_WindowFlags
pattern SDL_WINDOW_MOUSE_CAPTURE = SDL_WindowFlags 0x0000000000004000

-- | Typed constant for macro @SDL_WINDOW_MOUSE_RELATIVE_MODE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_MOUSE_RELATIVE_MODE :: SDL_WindowFlags
pattern SDL_WINDOW_MOUSE_RELATIVE_MODE = SDL_WindowFlags 0x0000000000008000

-- | Typed constant for macro @SDL_WINDOW_ALWAYS_ON_TOP@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_ALWAYS_ON_TOP :: SDL_WindowFlags
pattern SDL_WINDOW_ALWAYS_ON_TOP = SDL_WindowFlags 0x0000000000010000

-- | Typed constant for macro @SDL_WINDOW_UTILITY@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_UTILITY :: SDL_WindowFlags
pattern SDL_WINDOW_UTILITY = SDL_WindowFlags 0x0000000000020000

-- | Typed constant for macro @SDL_WINDOW_TOOLTIP@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_TOOLTIP :: SDL_WindowFlags
pattern SDL_WINDOW_TOOLTIP = SDL_WindowFlags 0x0000000000040000

-- | Typed constant for macro @SDL_WINDOW_POPUP_MENU@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_POPUP_MENU :: SDL_WindowFlags
pattern SDL_WINDOW_POPUP_MENU = SDL_WindowFlags 0x0000000000080000

-- | Typed constant for macro @SDL_WINDOW_KEYBOARD_GRABBED@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_KEYBOARD_GRABBED :: SDL_WindowFlags
pattern SDL_WINDOW_KEYBOARD_GRABBED = SDL_WindowFlags 0x0000000000100000

-- | Typed constant for macro @SDL_WINDOW_FILL_DOCUMENT@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_FILL_DOCUMENT :: SDL_WindowFlags
pattern SDL_WINDOW_FILL_DOCUMENT = SDL_WindowFlags 0x0000000000200000

-- | Typed constant for macro @SDL_WINDOW_VULKAN@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_VULKAN :: SDL_WindowFlags
pattern SDL_WINDOW_VULKAN = SDL_WindowFlags 0x0000000010000000

-- | Typed constant for macro @SDL_WINDOW_METAL@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_METAL :: SDL_WindowFlags
pattern SDL_WINDOW_METAL = SDL_WindowFlags 0x0000000020000000

-- | Typed constant for macro @SDL_WINDOW_TRANSPARENT@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_TRANSPARENT :: SDL_WindowFlags
pattern SDL_WINDOW_TRANSPARENT = SDL_WindowFlags 0x0000000040000000

-- | Typed constant for macro @SDL_WINDOW_NOT_FOCUSABLE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_WINDOW_NOT_FOCUSABLE :: SDL_WindowFlags
pattern SDL_WINDOW_NOT_FOCUSABLE = SDL_WindowFlags 0x0000000080000000
