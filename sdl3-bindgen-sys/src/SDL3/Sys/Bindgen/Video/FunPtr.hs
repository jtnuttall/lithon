{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Video.FunPtr (
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetNumVideoDrivers,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetVideoDriver,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetCurrentVideoDriver,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetSystemTheme,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDisplays,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetPrimaryDisplay,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDisplayProperties,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDisplayName,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDisplayBounds,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDisplayUsableBounds,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetNaturalDisplayOrientation,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetCurrentDisplayOrientation,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDisplayContentScale,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetFullscreenDisplayModes,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetClosestFullscreenDisplayMode,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDesktopDisplayMode,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetCurrentDisplayMode,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDisplayForPoint,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDisplayForRect,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetDisplayForWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowPixelDensity,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowDisplayScale,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowFullscreenMode,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowFullscreenMode,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowICCProfile,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowPixelFormat,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindows,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_CreateWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_CreatePopupWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_CreateWindowWithProperties,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowID,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowFromID,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowParent,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowProperties,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowFlags,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowTitle,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowTitle,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowIcon,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowPosition,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowPosition,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowSize,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowSize,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowSafeArea,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowAspectRatio,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowAspectRatio,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowBordersSize,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowSizeInPixels,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowMinimumSize,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowMinimumSize,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowMaximumSize,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowMaximumSize,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowBordered,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowResizable,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowAlwaysOnTop,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowFillDocument,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_ShowWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_HideWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_RaiseWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_MaximizeWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_MinimizeWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_RestoreWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowFullscreen,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SyncWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_WindowHasSurface,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowSurface,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowSurfaceVSync,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowSurfaceVSync,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_UpdateWindowSurface,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_UpdateWindowSurfaceRects,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_DestroyWindowSurface,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowKeyboardGrab,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowMouseGrab,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowKeyboardGrab,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowMouseGrab,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetGrabbedWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowMouseRect,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowMouseRect,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowOpacity,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowOpacity,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowParent,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowModal,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowFocusable,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_ShowWindowSystemMenu,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowHitTest,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowShape,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_FlashWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowProgressState,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowProgressState,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_SetWindowProgressValue,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GetWindowProgressValue,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_DestroyWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_ScreenSaverEnabled,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_EnableScreenSaver,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_DisableScreenSaver,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_LoadLibrary,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_GetProcAddress,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_EGL_GetProcAddress,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_UnloadLibrary,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_ExtensionSupported,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_ResetAttributes,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_SetAttribute,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_GetAttribute,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_CreateContext,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_MakeCurrent,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_GetCurrentWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_GetCurrentContext,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_EGL_GetCurrentDisplay,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_EGL_GetCurrentConfig,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_EGL_GetWindowSurface,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_EGL_SetAttributeCallbacks,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_SetSwapInterval,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_GetSwapInterval,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_SwapWindow,
  SDL3.Sys.Bindgen.Video.FunPtr.sDL_GL_DestroyContext,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified
import SDL3.Sys.Bindgen.Video

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_video.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetNumVideoDrivers */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_cd62c011cded1808 (void)) (void)"
         , "{"
         , "  return &SDL_GetNumVideoDrivers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetVideoDriver */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_046d70207bafe47f (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_GetVideoDriver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetCurrentVideoDriver */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_fb283d39e283ed14 (void)) (void)"
         , "{"
         , "  return &SDL_GetCurrentVideoDriver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetSystemTheme */"
         , "__attribute__ ((const))"
         , "SDL_SystemTheme (*hs_bindgen_7bbdbd7274c0b5b5 (void)) (void)"
         , "{"
         , "  return &SDL_GetSystemTheme;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplays */"
         , "__attribute__ ((const))"
         , "SDL_DisplayID *(*hs_bindgen_70f7cf654509b2c3 (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetDisplays;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetPrimaryDisplay */"
         , "__attribute__ ((const))"
         , "SDL_DisplayID (*hs_bindgen_b790a4a3043628fa (void)) (void)"
         , "{"
         , "  return &SDL_GetPrimaryDisplay;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_c3f8ffe6ded9cfd6 (void)) ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetDisplayProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_d5ad6e555b5cb237 (void)) ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetDisplayName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayBounds */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6d5f9eee448719f4 (void)) ("
         , "  SDL_DisplayID arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetDisplayBounds;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayUsableBounds */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_65535f32592754c4 (void)) ("
         , "  SDL_DisplayID arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetDisplayUsableBounds;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetNaturalDisplayOrientation */"
         , "__attribute__ ((const))"
         , "SDL_DisplayOrientation (*hs_bindgen_66971f9bdcb4b971 (void)) ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetNaturalDisplayOrientation;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetCurrentDisplayOrientation */"
         , "__attribute__ ((const))"
         , "SDL_DisplayOrientation (*hs_bindgen_a24aa5e4df6d8aa0 (void)) ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCurrentDisplayOrientation;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayContentScale */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_eab36ce421e54b3e (void)) ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetDisplayContentScale;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetFullscreenDisplayModes */"
         , "__attribute__ ((const))"
         , "SDL_DisplayMode **(*hs_bindgen_bd010935798ea365 (void)) ("
         , "  SDL_DisplayID arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetFullscreenDisplayModes;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetClosestFullscreenDisplayMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d0e64a6f43b88a5e (void)) ("
         , "  SDL_DisplayID arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  float arg4,"
         , "  _Bool arg5,"
         , "  SDL_DisplayMode *arg6"
         , ")"
         , "{"
         , "  return &SDL_GetClosestFullscreenDisplayMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDesktopDisplayMode */"
         , "__attribute__ ((const))"
         , "SDL_DisplayMode const *(*hs_bindgen_72b78488001b241a (void)) ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetDesktopDisplayMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetCurrentDisplayMode */"
         , "__attribute__ ((const))"
         , "SDL_DisplayMode const *(*hs_bindgen_4ea9690ee956f077 (void)) ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetCurrentDisplayMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayForPoint */"
         , "__attribute__ ((const))"
         , "SDL_DisplayID (*hs_bindgen_de146763764fd52f (void)) ("
         , "  SDL_Point const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetDisplayForPoint;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayForRect */"
         , "__attribute__ ((const))"
         , "SDL_DisplayID (*hs_bindgen_710a7746f071d499 (void)) ("
         , "  SDL_Rect const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetDisplayForRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayForWindow */"
         , "__attribute__ ((const))"
         , "SDL_DisplayID (*hs_bindgen_ab0b114093b84662 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetDisplayForWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowPixelDensity */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_dc1af7f260c7365f (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowPixelDensity;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowDisplayScale */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_95da25536b3703d7 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowDisplayScale;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFullscreenMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f0a6d02b7642ed3e (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_DisplayMode const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowFullscreenMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowFullscreenMode */"
         , "__attribute__ ((const))"
         , "SDL_DisplayMode const *(*hs_bindgen_16bce449fb30d23a (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowFullscreenMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowICCProfile */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_5c1cf7c698aa08ce (void)) ("
         , "  SDL_Window *arg1,"
         , "  size_t *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetWindowICCProfile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowPixelFormat */"
         , "__attribute__ ((const))"
         , "SDL_PixelFormat (*hs_bindgen_b8027cb465e5a5a2 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowPixelFormat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindows */"
         , "__attribute__ ((const))"
         , "SDL_Window **(*hs_bindgen_b2965b9f9dd9971d (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindows;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_CreateWindow */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_c12016fdc0d7966b (void)) ("
         , "  char const *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  SDL_WindowFlags arg4"
         , ")"
         , "{"
         , "  return &SDL_CreateWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_CreatePopupWindow */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_684a9951d98feb17 (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  signed int arg4,"
         , "  signed int arg5,"
         , "  SDL_WindowFlags arg6"
         , ")"
         , "{"
         , "  return &SDL_CreatePopupWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_CreateWindowWithProperties */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_2143bdc9c78e0e7e (void)) ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateWindowWithProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowID */"
         , "__attribute__ ((const))"
         , "SDL_WindowID (*hs_bindgen_271b950c2d28e361 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowFromID */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_4b427f44c79ceb27 (void)) ("
         , "  SDL_WindowID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowFromID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowParent */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_3f127843661c07d5 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowParent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_985031bf6e083168 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowFlags */"
         , "__attribute__ ((const))"
         , "SDL_WindowFlags (*hs_bindgen_b1430580544057d6 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowFlags;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowTitle */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_02e6f654a8740cb6 (void)) ("
         , "  SDL_Window *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowTitle;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowTitle */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_461782ed3ae5273a (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowTitle;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowIcon */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c87ab967152ab788 (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowIcon;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowPosition */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_196834c01e56d982 (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_SetWindowPosition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowPosition */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f2881c8d992e0f1f (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetWindowPosition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c18dc3d08bf90f70 (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_SetWindowSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_df749a5a4c237fc6 (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetWindowSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSafeArea */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8d8deb6f3e406cac (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetWindowSafeArea;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowAspectRatio */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_25a8a6e0ad2d08d8 (void)) ("
         , "  SDL_Window *arg1,"
         , "  float arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return &SDL_SetWindowAspectRatio;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowAspectRatio */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d18b72c056e3e796 (void)) ("
         , "  SDL_Window *arg1,"
         , "  float *arg2,"
         , "  float *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetWindowAspectRatio;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowBordersSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_72cf6e7cf38f6a60 (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3,"
         , "  signed int *arg4,"
         , "  signed int *arg5"
         , ")"
         , "{"
         , "  return &SDL_GetWindowBordersSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSizeInPixels */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6affb1847f677537 (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetWindowSizeInPixels;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMinimumSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6edf78b362442bfc (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_SetWindowMinimumSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMinimumSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_95a71d8cbb92dc9e (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetWindowMinimumSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMaximumSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_291022ee01415afe (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_SetWindowMaximumSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMaximumSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_dc1d465b3b604dcd (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetWindowMaximumSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowBordered */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_88f2360be3e7e300 (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowBordered;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowResizable */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5100302cfda497dd (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowResizable;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowAlwaysOnTop */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_608fd57fdcd4f95b (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowAlwaysOnTop;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFillDocument */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_68dc00f60262f0f8 (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SetWindowFillDocument;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetWindowFillDocument requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_ShowWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_64fdfc7ce17dc625 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_ShowWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_HideWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c2ab0cd6e971a55f (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_HideWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_RaiseWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e3e1a65c603c3d63 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_RaiseWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_MaximizeWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fe10be381d9d51e0 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_MaximizeWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_MinimizeWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d04014fe275b362c (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_MinimizeWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_RestoreWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7fb2f1337e1419c4 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_RestoreWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFullscreen */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7997a9fb73c8d257 (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowFullscreen;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SyncWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_99cfe89c3d1870d2 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_SyncWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_WindowHasSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_492c4aeae7928033 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_WindowHasSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSurface */"
         , "__attribute__ ((const))"
         , "SDL_Surface *(*hs_bindgen_2f8a00e3685394ac (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowSurfaceVSync */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8e03aa1985376fed (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowSurfaceVSync;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSurfaceVSync */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d0cf4eceaaa0e08e (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetWindowSurfaceVSync;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_UpdateWindowSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ed4a6fb4d50f6be0 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_UpdateWindowSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_UpdateWindowSurfaceRects */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_02e706becc194495 (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_UpdateWindowSurfaceRects;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_DestroyWindowSurface */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3f86b6de52c490a8 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyWindowSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowKeyboardGrab */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1a10593b47408de7 (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowKeyboardGrab;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMouseGrab */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1c52b8e1bc921458 (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowMouseGrab;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowKeyboardGrab */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_bd31081b6b534f49 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowKeyboardGrab;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMouseGrab */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_40af0f6caff933b4 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowMouseGrab;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetGrabbedWindow */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_072d8bccac218ad2 (void)) (void)"
         , "{"
         , "  return &SDL_GetGrabbedWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMouseRect */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_95863c8d80115819 (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowMouseRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMouseRect */"
         , "__attribute__ ((const))"
         , "SDL_Rect const *(*hs_bindgen_049b065f15b35ce9 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowMouseRect;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowOpacity */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_0e865d00ef5cb4eb (void)) ("
         , "  SDL_Window *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowOpacity;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowOpacity */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_fd15ea94ae6c8654 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowOpacity;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowParent */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_da11824c9c49e3e7 (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowParent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowModal */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9c2f4466a2e12383 (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowModal;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFocusable */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_61fa950af6d7c2e1 (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowFocusable;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_ShowWindowSystemMenu */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_cd482a252a1dea04 (void)) ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_ShowWindowSystemMenu;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowHitTest */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d2a7a11a0da70b01 (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_HitTest arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetWindowHitTest;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowShape */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3067f5f277541798 (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowShape;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_FlashWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7accb263b1f5da86 (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_FlashOperation arg2"
         , ")"
         , "{"
         , "  return &SDL_FlashWindow;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_ProgressState;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowProgressState */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9c2c63ad5f7e2b4b (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_ProgressState arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SetWindowProgressState;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetWindowProgressState requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_ProgressState;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowProgressState */"
         , "__attribute__ ((const))"
         , "SDL_ProgressState (*hs_bindgen_3c97888e379fc33c (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetWindowProgressState;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetWindowProgressState requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowProgressValue */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_df10903c71d955ff (void)) ("
         , "  SDL_Window *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SetWindowProgressValue;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetWindowProgressValue requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowProgressValue */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_1e0d101b30846cb1 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_GetWindowProgressValue;"
         , "#else"
         , "  SDL_SetError(\"SDL_GetWindowProgressValue requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_DestroyWindow */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_3af09b929d2d36ab (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_ScreenSaverEnabled */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_91298d9810095c05 (void)) (void)"
         , "{"
         , "  return &SDL_ScreenSaverEnabled;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EnableScreenSaver */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a142225724865b93 (void)) (void)"
         , "{"
         , "  return &SDL_EnableScreenSaver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_DisableScreenSaver */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_96e0130db8c924c0 (void)) (void)"
         , "{"
         , "  return &SDL_DisableScreenSaver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_LoadLibrary */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_eab5183eb86cd104 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GL_LoadLibrary;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetProcAddress */"
         , "__attribute__ ((const))"
         , "SDL_FunctionPointer (*hs_bindgen_34476455b181778b (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GL_GetProcAddress;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetProcAddress */"
         , "__attribute__ ((const))"
         , "SDL_FunctionPointer (*hs_bindgen_b7365d91417dcc00 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_EGL_GetProcAddress;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_UnloadLibrary */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_626ee6f51d853cc4 (void)) (void)"
         , "{"
         , "  return &SDL_GL_UnloadLibrary;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_ExtensionSupported */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4b6ac25f9c74898b (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GL_ExtensionSupported;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_ResetAttributes */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_8d3172eec8730621 (void)) (void)"
         , "{"
         , "  return &SDL_GL_ResetAttributes;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_SetAttribute */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2c780ec7126f44cf (void)) ("
         , "  SDL_GLAttr arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_GL_SetAttribute;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetAttribute */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f2be9d4ead0d65a2 (void)) ("
         , "  SDL_GLAttr arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GL_GetAttribute;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_CreateContext */"
         , "__attribute__ ((const))"
         , "SDL_GLContext (*hs_bindgen_9f1f69477c4acb50 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GL_CreateContext;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_MakeCurrent */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2336de6c69b02847 (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_GLContext arg2"
         , ")"
         , "{"
         , "  return &SDL_GL_MakeCurrent;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetCurrentWindow */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_1d77b3c33533bc52 (void)) (void)"
         , "{"
         , "  return &SDL_GL_GetCurrentWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetCurrentContext */"
         , "__attribute__ ((const))"
         , "SDL_GLContext (*hs_bindgen_70929e076db9af7f (void)) (void)"
         , "{"
         , "  return &SDL_GL_GetCurrentContext;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetCurrentDisplay */"
         , "__attribute__ ((const))"
         , "SDL_EGLDisplay (*hs_bindgen_ad8ff3579d19bf4c (void)) (void)"
         , "{"
         , "  return &SDL_EGL_GetCurrentDisplay;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetCurrentConfig */"
         , "__attribute__ ((const))"
         , "SDL_EGLConfig (*hs_bindgen_52c08e8d53d84085 (void)) (void)"
         , "{"
         , "  return &SDL_EGL_GetCurrentConfig;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetWindowSurface */"
         , "__attribute__ ((const))"
         , "SDL_EGLSurface (*hs_bindgen_4d9d3145651703ea (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_EGL_GetWindowSurface;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_SetAttributeCallbacks */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_2d4a4b5954adbdda (void)) ("
         , "  SDL_EGLAttribArrayCallback arg1,"
         , "  SDL_EGLIntArrayCallback arg2,"
         , "  SDL_EGLIntArrayCallback arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return &SDL_EGL_SetAttributeCallbacks;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_SetSwapInterval */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_61901cbd29279d80 (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_GL_SetSwapInterval;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetSwapInterval */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2ead7bd70a2b5362 (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GL_GetSwapInterval;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_SwapWindow */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_21d656c344c13469 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GL_SwapWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_DestroyContext */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c03de6ace9ca6264 (void)) ("
         , "  SDL_GLContext arg1"
         , ")"
         , "{"
         , "  return &SDL_GL_DestroyContext;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetNumVideoDrivers@
foreign import ccall unsafe "hs_bindgen_cd62c011cded1808"
  hs_bindgen_cd62c011cded1808_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetNumVideoDrivers@
hs_bindgen_cd62c011cded1808 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_cd62c011cded1808 =
  BG.fromFFIType hs_bindgen_cd62c011cded1808_base

{-# NOINLINE sDL_GetNumVideoDrivers #-}

-- | Get the number of video drivers compiled into SDL.
--
--     [Returns]: the number of built in video drivers.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetVideoDriver'
--
--     [C declaration]: @SDL_GetNumVideoDrivers@, defined at @SDL3\/SDL_video.h 563:33@
sDL_GetNumVideoDrivers :: BG.FunPtr (IO BG.CInt)
sDL_GetNumVideoDrivers =
  BG.unsafePerformIO hs_bindgen_cd62c011cded1808

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetVideoDriver@
foreign import ccall unsafe "hs_bindgen_046d70207bafe47f"
  hs_bindgen_046d70207bafe47f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetVideoDriver@
hs_bindgen_046d70207bafe47f :: IO (BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_046d70207bafe47f =
  BG.fromFFIType hs_bindgen_046d70207bafe47f_base

{-# NOINLINE sDL_GetVideoDriver #-}

-- | Get the name of a built in video driver.
--
--     The video drivers are presented in the order in which they are normally checked during initialization.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"cocoa\", \"x11\" or \"windows\". These never have Unicode characters, and are not meant to be proper names.
--
--     [@index@]: the index of a video driver.
--
--     [Returns]: the name of the video driver with the given __index__, or NULL if index is out of bounds.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumVideoDrivers'
--
--     [C declaration]: @SDL_GetVideoDriver@, defined at @SDL3\/SDL_video.h 585:42@
sDL_GetVideoDriver :: BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetVideoDriver =
  BG.unsafePerformIO hs_bindgen_046d70207bafe47f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetCurrentVideoDriver@
foreign import ccall unsafe "hs_bindgen_fb283d39e283ed14"
  hs_bindgen_fb283d39e283ed14_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetCurrentVideoDriver@
hs_bindgen_fb283d39e283ed14 :: IO (BG.FunPtr (IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_fb283d39e283ed14 =
  BG.fromFFIType hs_bindgen_fb283d39e283ed14_base

{-# NOINLINE sDL_GetCurrentVideoDriver #-}

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
--     [See also]: 'sDL_GetNumVideoDrivers', 'sDL_GetVideoDriver'
--
--     [C declaration]: @SDL_GetCurrentVideoDriver@, defined at @SDL3\/SDL_video.h 604:42@
sDL_GetCurrentVideoDriver :: BG.FunPtr (IO (PtrConst.PtrConst BG.CChar))
sDL_GetCurrentVideoDriver =
  BG.unsafePerformIO hs_bindgen_fb283d39e283ed14

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetSystemTheme@
foreign import ccall unsafe "hs_bindgen_7bbdbd7274c0b5b5"
  hs_bindgen_7bbdbd7274c0b5b5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetSystemTheme@
hs_bindgen_7bbdbd7274c0b5b5 :: IO (BG.FunPtr (IO SDL_SystemTheme))
hs_bindgen_7bbdbd7274c0b5b5 =
  BG.fromFFIType hs_bindgen_7bbdbd7274c0b5b5_base

{-# NOINLINE sDL_GetSystemTheme #-}

-- | Get the current system theme.
--
--     [Returns]: the current system theme, light, dark, or unknown.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSystemTheme@, defined at @SDL3\/SDL_video.h 615:45@
sDL_GetSystemTheme :: BG.FunPtr (IO SDL_SystemTheme)
sDL_GetSystemTheme =
  BG.unsafePerformIO hs_bindgen_7bbdbd7274c0b5b5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplays@
foreign import ccall unsafe "hs_bindgen_70f7cf654509b2c3"
  hs_bindgen_70f7cf654509b2c3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplays@
hs_bindgen_70f7cf654509b2c3 :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_DisplayID)))
hs_bindgen_70f7cf654509b2c3 =
  BG.fromFFIType hs_bindgen_70f7cf654509b2c3_base

{-# NOINLINE sDL_GetDisplays #-}

-- | Get a list of currently connected displays.
--
--     [@count@]: a pointer filled in with the number of displays returned, may be NULL.
--
--     [Returns]: a 0 terminated array of display instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDisplays@, defined at @SDL3\/SDL_video.h 630:45@
sDL_GetDisplays :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_DisplayID))
sDL_GetDisplays =
  BG.unsafePerformIO hs_bindgen_70f7cf654509b2c3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetPrimaryDisplay@
foreign import ccall unsafe "hs_bindgen_b790a4a3043628fa"
  hs_bindgen_b790a4a3043628fa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetPrimaryDisplay@
hs_bindgen_b790a4a3043628fa :: IO (BG.FunPtr (IO SDL_DisplayID))
hs_bindgen_b790a4a3043628fa =
  BG.fromFFIType hs_bindgen_b790a4a3043628fa_base

{-# NOINLINE sDL_GetPrimaryDisplay #-}

-- | Return the primary display.
--
--     [Returns]: the instance ID of the primary display on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetPrimaryDisplay@, defined at @SDL3\/SDL_video.h 644:43@
sDL_GetPrimaryDisplay :: BG.FunPtr (IO SDL_DisplayID)
sDL_GetPrimaryDisplay =
  BG.unsafePerformIO hs_bindgen_b790a4a3043628fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayProperties@
foreign import ccall unsafe "hs_bindgen_c3f8ffe6ded9cfd6"
  hs_bindgen_c3f8ffe6ded9cfd6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayProperties@
hs_bindgen_c3f8ffe6ded9cfd6
  :: IO (BG.FunPtr (SDL_DisplayID -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_c3f8ffe6ded9cfd6 =
  BG.fromFFIType hs_bindgen_c3f8ffe6ded9cfd6_base

{-# NOINLINE sDL_GetDisplayProperties #-}

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
--     [@displayID@]: the instance ID of the display to query.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDisplayProperties@, defined at @SDL3\/SDL_video.h 682:46@
sDL_GetDisplayProperties
  :: BG.FunPtr (SDL_DisplayID -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetDisplayProperties =
  BG.unsafePerformIO hs_bindgen_c3f8ffe6ded9cfd6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayName@
foreign import ccall unsafe "hs_bindgen_d5ad6e555b5cb237"
  hs_bindgen_d5ad6e555b5cb237_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayName@
hs_bindgen_d5ad6e555b5cb237 :: IO (BG.FunPtr (SDL_DisplayID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_d5ad6e555b5cb237 =
  BG.fromFFIType hs_bindgen_d5ad6e555b5cb237_base

{-# NOINLINE sDL_GetDisplayName #-}

-- | Get the name of a display in UTF-8 encoding.
--
--     [@displayID@]: the instance ID of the display to query.
--
--     [Returns]: the name of a display or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetDisplayName@, defined at @SDL3\/SDL_video.h 702:42@
sDL_GetDisplayName :: BG.FunPtr (SDL_DisplayID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetDisplayName =
  BG.unsafePerformIO hs_bindgen_d5ad6e555b5cb237

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayBounds@
foreign import ccall unsafe "hs_bindgen_6d5f9eee448719f4"
  hs_bindgen_6d5f9eee448719f4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayBounds@
hs_bindgen_6d5f9eee448719f4
  :: IO (BG.FunPtr (SDL_DisplayID -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_6d5f9eee448719f4 =
  BG.fromFFIType hs_bindgen_6d5f9eee448719f4_base

{-# NOINLINE sDL_GetDisplayBounds #-}

-- | Get the desktop area represented by a display.
--
--     The primary display is often located at (0,0), but may be placed at a different location depending on monitor layout.
--
--     [@displayID@]: the instance ID of the display to query.
--
--     [@rect@]: the SDL_Rect structure filled in with the display bounds.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplayUsableBounds', 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetDisplayBounds@, defined at @SDL3\/SDL_video.h 722:34@
sDL_GetDisplayBounds
  :: BG.FunPtr (SDL_DisplayID -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_GetDisplayBounds =
  BG.unsafePerformIO hs_bindgen_6d5f9eee448719f4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayUsableBounds@
foreign import ccall unsafe "hs_bindgen_65535f32592754c4"
  hs_bindgen_65535f32592754c4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayUsableBounds@
hs_bindgen_65535f32592754c4
  :: IO (BG.FunPtr (SDL_DisplayID -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_65535f32592754c4 =
  BG.fromFFIType hs_bindgen_65535f32592754c4_base

{-# NOINLINE sDL_GetDisplayUsableBounds #-}

-- | Get the usable desktop area represented by a display, in screen coordinates.
--
--     This is the same area as @SDL_GetDisplayBounds()@ reports, but with portions reserved by the system removed. For example, on Apple\'s macOS, this subtracts the area occupied by the menu bar and dock.
--
--     Setting a window to be fullscreen generally bypasses these unusable areas, so these are good guidelines for the maximum space available to a non-fullscreen window.
--
--     [@displayID@]: the instance ID of the display to query.
--
--     [@rect@]: the SDL_Rect structure filled in with the display bounds.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplayBounds', 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetDisplayUsableBounds@, defined at @SDL3\/SDL_video.h 748:34@
sDL_GetDisplayUsableBounds
  :: BG.FunPtr (SDL_DisplayID -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_GetDisplayUsableBounds =
  BG.unsafePerformIO hs_bindgen_65535f32592754c4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetNaturalDisplayOrientation@
foreign import ccall unsafe "hs_bindgen_66971f9bdcb4b971"
  hs_bindgen_66971f9bdcb4b971_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetNaturalDisplayOrientation@
hs_bindgen_66971f9bdcb4b971 :: IO (BG.FunPtr (SDL_DisplayID -> IO SDL_DisplayOrientation))
hs_bindgen_66971f9bdcb4b971 =
  BG.fromFFIType hs_bindgen_66971f9bdcb4b971_base

{-# NOINLINE sDL_GetNaturalDisplayOrientation #-}

-- | Get the orientation of a display when it is unrotated.
--
--     [@displayID@]: the instance ID of the display to query.
--
--     [Returns]: the 'SDL_DisplayOrientation' enum value of the display, or @SDL_ORIENTATION_UNKNOWN@ if it isn\'t available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetNaturalDisplayOrientation@, defined at @SDL3\/SDL_video.h 763:52@
sDL_GetNaturalDisplayOrientation :: BG.FunPtr (SDL_DisplayID -> IO SDL_DisplayOrientation)
sDL_GetNaturalDisplayOrientation =
  BG.unsafePerformIO hs_bindgen_66971f9bdcb4b971

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetCurrentDisplayOrientation@
foreign import ccall unsafe "hs_bindgen_a24aa5e4df6d8aa0"
  hs_bindgen_a24aa5e4df6d8aa0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetCurrentDisplayOrientation@
hs_bindgen_a24aa5e4df6d8aa0 :: IO (BG.FunPtr (SDL_DisplayID -> IO SDL_DisplayOrientation))
hs_bindgen_a24aa5e4df6d8aa0 =
  BG.fromFFIType hs_bindgen_a24aa5e4df6d8aa0_base

{-# NOINLINE sDL_GetCurrentDisplayOrientation #-}

-- | Get the orientation of a display.
--
--     [@displayID@]: the instance ID of the display to query.
--
--     [Returns]: the 'SDL_DisplayOrientation' enum value of the display, or @SDL_ORIENTATION_UNKNOWN@ if it isn\'t available.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetCurrentDisplayOrientation@, defined at @SDL3\/SDL_video.h 778:52@
sDL_GetCurrentDisplayOrientation :: BG.FunPtr (SDL_DisplayID -> IO SDL_DisplayOrientation)
sDL_GetCurrentDisplayOrientation =
  BG.unsafePerformIO hs_bindgen_a24aa5e4df6d8aa0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayContentScale@
foreign import ccall unsafe "hs_bindgen_eab36ce421e54b3e"
  hs_bindgen_eab36ce421e54b3e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayContentScale@
hs_bindgen_eab36ce421e54b3e :: IO (BG.FunPtr (SDL_DisplayID -> IO BG.CFloat))
hs_bindgen_eab36ce421e54b3e =
  BG.fromFFIType hs_bindgen_eab36ce421e54b3e_base

{-# NOINLINE sDL_GetDisplayContentScale #-}

-- | Get the content scale of a display.
--
--     The content scale is the expected scale for content based on the DPI settings of the display. For example, a 4K display might have a 2.0 (200%) display scale, which means that the user expects UI elements to be twice as big on this display, to aid in readability.
--
--     After window creation, @SDL_GetWindowDisplayScale()@ should be used to query the content scale factor for individual windows instead of querying the display for a window and calling this function, as the per-window content scale factor may differ from the base value of the display it is on, particularly on high-DPI and\/or multi-monitor desktop configurations.
--
--     [@displayID@]: the instance ID of the display to query.
--
--     [Returns]: the content scale of the display, or 0.0f on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowDisplayScale', 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetDisplayContentScale@, defined at @SDL3\/SDL_video.h 805:35@
sDL_GetDisplayContentScale :: BG.FunPtr (SDL_DisplayID -> IO BG.CFloat)
sDL_GetDisplayContentScale =
  BG.unsafePerformIO hs_bindgen_eab36ce421e54b3e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetFullscreenDisplayModes@
foreign import ccall unsafe "hs_bindgen_bd010935798ea365"
  hs_bindgen_bd010935798ea365_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetFullscreenDisplayModes@
hs_bindgen_bd010935798ea365
  :: IO (BG.FunPtr (SDL_DisplayID -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_DisplayMode))))
hs_bindgen_bd010935798ea365 =
  BG.fromFFIType hs_bindgen_bd010935798ea365_base

{-# NOINLINE sDL_GetFullscreenDisplayModes #-}

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
--     [@displayID@]: the instance ID of the display to query.
--
--     [@count@]: a pointer filled in with the number of display modes returned, may be NULL.
--
--     [Returns]: a NULL terminated array of display mode pointers or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetFullscreenDisplayModes@, defined at @SDL3\/SDL_video.h 833:48@
sDL_GetFullscreenDisplayModes
  :: BG.FunPtr (SDL_DisplayID -> BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_DisplayMode)))
sDL_GetFullscreenDisplayModes =
  BG.unsafePerformIO hs_bindgen_bd010935798ea365

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetClosestFullscreenDisplayMode@
foreign import ccall unsafe "hs_bindgen_d0e64a6f43b88a5e"
  hs_bindgen_d0e64a6f43b88a5e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetClosestFullscreenDisplayMode@
hs_bindgen_d0e64a6f43b88a5e
  :: IO
       ( BG.FunPtr
           ( SDL_DisplayID
             -> BG.CInt
             -> BG.CInt
             -> BG.CFloat
             -> BG.CBool
             -> BG.Ptr SDL_DisplayMode
             -> IO BG.CBool
           )
       )
hs_bindgen_d0e64a6f43b88a5e =
  BG.fromFFIType hs_bindgen_d0e64a6f43b88a5e_base

{-# NOINLINE sDL_GetClosestFullscreenDisplayMode #-}

-- | Get the closest match to the requested display mode.
--
--     The available display modes are scanned and @closest@ is filled in with the closest mode matching the requested mode and returned. The mode format and refresh rate default to the desktop mode if they are set to 0. The modes are scanned with size being first priority, format being second priority, and finally checking the refresh rate. If all the available modes are too small, then false is returned.
--
--     [@displayID@]: the instance ID of the display to query.
--
--     [@w@]: the width in pixels of the desired display mode.
--
--     [@h@]: the height in pixels of the desired display mode.
--
--     [@refresh_rate@]: the refresh rate of the desired display mode, or 0.0f for the desktop refresh rate.
--
--     [@include_high_density_modes@]: boolean to include high density modes in the search.
--
--     [@closest@]: a pointer filled in with the closest display mode equal to or larger than the desired mode.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplays', 'sDL_GetFullscreenDisplayModes'
--
--     [C declaration]: @SDL_GetClosestFullscreenDisplayMode@, defined at @SDL3\/SDL_video.h 864:34@
sDL_GetClosestFullscreenDisplayMode
  :: BG.FunPtr
       ( SDL_DisplayID
         -> BG.CInt
         -> BG.CInt
         -> BG.CFloat
         -> BG.CBool
         -> BG.Ptr SDL_DisplayMode
         -> IO BG.CBool
       )
sDL_GetClosestFullscreenDisplayMode =
  BG.unsafePerformIO hs_bindgen_d0e64a6f43b88a5e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDesktopDisplayMode@
foreign import ccall unsafe "hs_bindgen_72b78488001b241a"
  hs_bindgen_72b78488001b241a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDesktopDisplayMode@
hs_bindgen_72b78488001b241a
  :: IO (BG.FunPtr (SDL_DisplayID -> IO (PtrConst.PtrConst SDL_DisplayMode)))
hs_bindgen_72b78488001b241a =
  BG.fromFFIType hs_bindgen_72b78488001b241a_base

{-# NOINLINE sDL_GetDesktopDisplayMode #-}

-- | Get information about the desktop\'s display mode.
--
--     There\'s a difference between this function and @SDL_GetCurrentDisplayMode()@ when SDL runs fullscreen and has changed the resolution. In that case this function will return the previous native display mode, and not the current display mode.
--
--     [@displayID@]: the instance ID of the display to query.
--
--     [Returns]: a pointer to the desktop display mode or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetCurrentDisplayMode', 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetDesktopDisplayMode@, defined at @SDL3\/SDL_video.h 885:53@
sDL_GetDesktopDisplayMode :: BG.FunPtr (SDL_DisplayID -> IO (PtrConst.PtrConst SDL_DisplayMode))
sDL_GetDesktopDisplayMode =
  BG.unsafePerformIO hs_bindgen_72b78488001b241a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetCurrentDisplayMode@
foreign import ccall unsafe "hs_bindgen_4ea9690ee956f077"
  hs_bindgen_4ea9690ee956f077_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetCurrentDisplayMode@
hs_bindgen_4ea9690ee956f077
  :: IO (BG.FunPtr (SDL_DisplayID -> IO (PtrConst.PtrConst SDL_DisplayMode)))
hs_bindgen_4ea9690ee956f077 =
  BG.fromFFIType hs_bindgen_4ea9690ee956f077_base

{-# NOINLINE sDL_GetCurrentDisplayMode #-}

-- | Get information about the current display mode.
--
--     There\'s a difference between this function and @SDL_GetDesktopDisplayMode()@ when SDL runs fullscreen and has changed the resolution. In that case this function will return the current display mode, and not the previous native display mode.
--
--     [@displayID@]: the instance ID of the display to query.
--
--     [Returns]: a pointer to the desktop display mode or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDesktopDisplayMode', 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetCurrentDisplayMode@, defined at @SDL3\/SDL_video.h 906:53@
sDL_GetCurrentDisplayMode :: BG.FunPtr (SDL_DisplayID -> IO (PtrConst.PtrConst SDL_DisplayMode))
sDL_GetCurrentDisplayMode =
  BG.unsafePerformIO hs_bindgen_4ea9690ee956f077

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayForPoint@
foreign import ccall unsafe "hs_bindgen_de146763764fd52f"
  hs_bindgen_de146763764fd52f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayForPoint@
hs_bindgen_de146763764fd52f
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point -> IO SDL_DisplayID))
hs_bindgen_de146763764fd52f =
  BG.fromFFIType hs_bindgen_de146763764fd52f_base

{-# NOINLINE sDL_GetDisplayForPoint #-}

-- | Get the display containing a point.
--
--     [@point@]: the point to query.
--
--     [Returns]: the instance ID of the display containing the point or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplayBounds', 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetDisplayForPoint@, defined at @SDL3\/SDL_video.h 922:43@
sDL_GetDisplayForPoint
  :: BG.FunPtr (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point -> IO SDL_DisplayID)
sDL_GetDisplayForPoint =
  BG.unsafePerformIO hs_bindgen_de146763764fd52f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayForRect@
foreign import ccall unsafe "hs_bindgen_710a7746f071d499"
  hs_bindgen_710a7746f071d499_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayForRect@
hs_bindgen_710a7746f071d499
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO SDL_DisplayID))
hs_bindgen_710a7746f071d499 =
  BG.fromFFIType hs_bindgen_710a7746f071d499_base

{-# NOINLINE sDL_GetDisplayForRect #-}

-- | Get the display primarily containing a rect.
--
--     [@rect@]: the rect to query.
--
--     [Returns]: the instance ID of the display entirely containing the rect or closest to the center of the rect on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplayBounds', 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetDisplayForRect@, defined at @SDL3\/SDL_video.h 939:43@
sDL_GetDisplayForRect
  :: BG.FunPtr (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO SDL_DisplayID)
sDL_GetDisplayForRect =
  BG.unsafePerformIO hs_bindgen_710a7746f071d499

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayForWindow@
foreign import ccall unsafe "hs_bindgen_ab0b114093b84662"
  hs_bindgen_ab0b114093b84662_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetDisplayForWindow@
hs_bindgen_ab0b114093b84662 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_DisplayID))
hs_bindgen_ab0b114093b84662 =
  BG.fromFFIType hs_bindgen_ab0b114093b84662_base

{-# NOINLINE sDL_GetDisplayForWindow #-}

-- | Get the display associated with a window.
--
--     [@window@]: the window to query.
--
--     [Returns]: the instance ID of the display containing the center of the window on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDisplayBounds', 'sDL_GetDisplays'
--
--     [C declaration]: @SDL_GetDisplayForWindow@, defined at @SDL3\/SDL_video.h 956:43@
sDL_GetDisplayForWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_DisplayID)
sDL_GetDisplayForWindow =
  BG.unsafePerformIO hs_bindgen_ab0b114093b84662

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowPixelDensity@
foreign import ccall unsafe "hs_bindgen_dc1af7f260c7365f"
  hs_bindgen_dc1af7f260c7365f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowPixelDensity@
hs_bindgen_dc1af7f260c7365f :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CFloat))
hs_bindgen_dc1af7f260c7365f =
  BG.fromFFIType hs_bindgen_dc1af7f260c7365f_base

{-# NOINLINE sDL_GetWindowPixelDensity #-}

-- | Get the pixel density of a window.
--
--     This is a ratio of pixel size to window size. For example, if the window is 1920x1080 and it has a high density back buffer of 3840x2160 pixels, it would have a pixel density of 2.0.
--
--     [@window@]: the window to query.
--
--     [Returns]: the pixel density or 0.0f on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowDisplayScale'
--
--     [C declaration]: @SDL_GetWindowPixelDensity@, defined at @SDL3\/SDL_video.h 975:35@
sDL_GetWindowPixelDensity :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CFloat)
sDL_GetWindowPixelDensity =
  BG.unsafePerformIO hs_bindgen_dc1af7f260c7365f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowDisplayScale@
foreign import ccall unsafe "hs_bindgen_95da25536b3703d7"
  hs_bindgen_95da25536b3703d7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowDisplayScale@
hs_bindgen_95da25536b3703d7 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CFloat))
hs_bindgen_95da25536b3703d7 =
  BG.fromFFIType hs_bindgen_95da25536b3703d7_base

{-# NOINLINE sDL_GetWindowDisplayScale #-}

-- | Get the content display scale relative to a window\'s pixel size.
--
--     This is a combination of the window pixel density and the display content scale, and is the expected scale for displaying content in this window. For example, if a 3840x2160 window had a display scale of 2.0, the user expects the content to take twice as many pixels and be the same physical size as if it were being displayed in a 1920x1080 window with a display scale of 1.0.
--
--     Conceptually this value corresponds to the scale display setting, and is updated when that setting is changed, or the window moves to a display with a different scale setting.
--
--     [@window@]: the window to query.
--
--     [Returns]: the display scale, or 0.0f on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowDisplayScale@, defined at @SDL3\/SDL_video.h 999:35@
sDL_GetWindowDisplayScale :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CFloat)
sDL_GetWindowDisplayScale =
  BG.unsafePerformIO hs_bindgen_95da25536b3703d7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFullscreenMode@
foreign import ccall unsafe "hs_bindgen_f0a6d02b7642ed3e"
  hs_bindgen_f0a6d02b7642ed3e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFullscreenMode@
hs_bindgen_f0a6d02b7642ed3e
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> PtrConst.PtrConst SDL_DisplayMode -> IO BG.CBool))
hs_bindgen_f0a6d02b7642ed3e =
  BG.fromFFIType hs_bindgen_f0a6d02b7642ed3e_base

{-# NOINLINE sDL_SetWindowFullscreenMode #-}

-- | Set the display mode to use when a window is visible and fullscreen.
--
--     This only affects the display mode used when the window is fullscreen. To change the window size when the window is not fullscreen, use @SDL_SetWindowSize()@.
--
--     If the window is currently in the fullscreen state, this request is asynchronous on some windowing systems and the new mode dimensions may not be applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the new mode takes effect, an SDL_EVENT_WINDOW_RESIZED and\/or an SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event will be emitted with the new mode dimensions.
--
--     [@window@]: the window to affect.
--
--     [@mode@]: a pointer to the display mode to use, which can be NULL for borderless fullscreen desktop mode, or one of the fullscreen modes returned by @SDL_GetFullscreenDisplayModes()@ to set an exclusive fullscreen mode.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowFullscreenMode', 'sDL_SetWindowFullscreen', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_SetWindowFullscreenMode@, defined at @SDL3\/SDL_video.h 1034:34@
sDL_SetWindowFullscreenMode
  :: BG.FunPtr (BG.Ptr SDL_Window -> PtrConst.PtrConst SDL_DisplayMode -> IO BG.CBool)
sDL_SetWindowFullscreenMode =
  BG.unsafePerformIO hs_bindgen_f0a6d02b7642ed3e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowFullscreenMode@
foreign import ccall unsafe "hs_bindgen_16bce449fb30d23a"
  hs_bindgen_16bce449fb30d23a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowFullscreenMode@
hs_bindgen_16bce449fb30d23a
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO (PtrConst.PtrConst SDL_DisplayMode)))
hs_bindgen_16bce449fb30d23a =
  BG.fromFFIType hs_bindgen_16bce449fb30d23a_base

{-# NOINLINE sDL_GetWindowFullscreenMode #-}

-- | Query the display mode to use when a window is visible at fullscreen.
--
--     [@window@]: the window to query.
--
--     [Returns]: a pointer to the exclusive fullscreen mode to use or NULL for borderless fullscreen desktop mode.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowFullscreenMode', 'sDL_SetWindowFullscreen'
--
--     [C declaration]: @SDL_GetWindowFullscreenMode@, defined at @SDL3\/SDL_video.h 1050:53@
sDL_GetWindowFullscreenMode
  :: BG.FunPtr (BG.Ptr SDL_Window -> IO (PtrConst.PtrConst SDL_DisplayMode))
sDL_GetWindowFullscreenMode =
  BG.unsafePerformIO hs_bindgen_16bce449fb30d23a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowICCProfile@
foreign import ccall unsafe "hs_bindgen_5c1cf7c698aa08ce"
  hs_bindgen_5c1cf7c698aa08ce_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowICCProfile@
hs_bindgen_5c1cf7c698aa08ce
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
hs_bindgen_5c1cf7c698aa08ce =
  BG.fromFFIType hs_bindgen_5c1cf7c698aa08ce_base

{-# NOINLINE sDL_GetWindowICCProfile #-}

-- | Get the raw ICC profile data for the screen the window is currently on.
--
--     [@window@]: the window to query.
--
--     [@size@]: the size of the ICC profile.
--
--     [Returns]: the raw ICC profile data on success or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowICCProfile@, defined at @SDL3\/SDL_video.h 1065:36@
sDL_GetWindowICCProfile
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void))
sDL_GetWindowICCProfile =
  BG.unsafePerformIO hs_bindgen_5c1cf7c698aa08ce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowPixelFormat@
foreign import ccall unsafe "hs_bindgen_b8027cb465e5a5a2"
  hs_bindgen_b8027cb465e5a5a2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowPixelFormat@
hs_bindgen_b8027cb465e5a5a2
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat))
hs_bindgen_b8027cb465e5a5a2 =
  BG.fromFFIType hs_bindgen_b8027cb465e5a5a2_base

{-# NOINLINE sDL_GetWindowPixelFormat #-}

-- | Get the pixel format associated with the window.
--
--     [@window@]: the window to query.
--
--     [Returns]: the pixel format of the window on success or SDL_PIXELFORMAT_UNKNOWN on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowPixelFormat@, defined at @SDL3\/SDL_video.h 1079:45@
sDL_GetWindowPixelFormat
  :: BG.FunPtr (BG.Ptr SDL_Window -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
sDL_GetWindowPixelFormat =
  BG.unsafePerformIO hs_bindgen_b8027cb465e5a5a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindows@
foreign import ccall unsafe "hs_bindgen_b2965b9f9dd9971d"
  hs_bindgen_b2965b9f9dd9971d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindows@
hs_bindgen_b2965b9f9dd9971d :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_Window))))
hs_bindgen_b2965b9f9dd9971d =
  BG.fromFFIType hs_bindgen_b2965b9f9dd9971d_base

{-# NOINLINE sDL_GetWindows #-}

-- | Get a list of valid windows.
--
--     [@count@]: a pointer filled in with the number of windows returned, may be NULL.
--
--     [Returns]: a NULL terminated array of 'SDL_Window' pointers or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindows@, defined at @SDL3\/SDL_video.h 1095:43@
sDL_GetWindows :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr (BG.Ptr SDL_Window)))
sDL_GetWindows =
  BG.unsafePerformIO hs_bindgen_b2965b9f9dd9971d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_CreateWindow@
foreign import ccall unsafe "hs_bindgen_c12016fdc0d7966b"
  hs_bindgen_c12016fdc0d7966b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_CreateWindow@
hs_bindgen_c12016fdc0d7966b
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst BG.CChar -> BG.CInt -> BG.CInt -> SDL_WindowFlags -> IO (BG.Ptr SDL_Window))
       )
hs_bindgen_c12016fdc0d7966b =
  BG.fromFFIType hs_bindgen_c12016fdc0d7966b_base

{-# NOINLINE sDL_CreateWindow #-}

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
--     The 'SDL_Window' will be shown if SDL_WINDOW_HIDDEN is not set. If hidden at creation time, @SDL_ShowWindow()@ can be used to show it later.
--
--     On Apple\'s macOS, you __must__ set the NSHighResolutionCapable Info.plist property to YES, otherwise you will not receive a High-DPI OpenGL canvas.
--
--     The window pixel size may differ from its window coordinate size if the window is on a high pixel density display. Use @SDL_GetWindowSize()@ to query the client area\'s size in window coordinates, and @SDL_GetWindowSizeInPixels()@ or SDL_GetRenderOutputSize() to query the drawable size in pixels. Note that the drawable size can vary after the window is created and should be queried again if you get an SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event.
--
--     If the window is created with any of the SDL_WINDOW_OPENGL or SDL_WINDOW_VULKAN flags, then the corresponding LoadLibrary function (SDL_GL_LoadLibrary or SDL_Vulkan_LoadLibrary) is called and the corresponding UnloadLibrary function is called by @SDL_DestroyWindow()@.
--
--     If SDL_WINDOW_VULKAN is specified and there isn\'t a working Vulkan driver, @SDL_CreateWindow()@ will fail, because SDL_Vulkan_LoadLibrary() will fail.
--
--     If SDL_WINDOW_METAL is specified on an OS that does not support Metal, @SDL_CreateWindow()@ will fail.
--
--     If you intend to use this window with an SDL_Renderer, you should use SDL_CreateWindowAndRenderer() instead of this function, to avoid window flicker.
--
--     On non-Apple devices, SDL requires you to either not link to the Vulkan loader or link to a dynamic library version. This limitation may be removed in a future version of SDL.
--
--     [@title@]: the title of the window, in UTF-8 encoding.
--
--     [@w@]: the width of the window.
--
--     [@h@]: the height of the window.
--
--     [@flags@]: 0, or one or more 'SDL_WindowFlags' OR\'d together.
--
--     [Returns]: the window that was created or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_CreateWindowAndRenderer, 'sDL_CreatePopupWindow', 'sDL_CreateWindowWithProperties', 'sDL_DestroyWindow'
--
--     [C declaration]: @SDL_CreateWindow@, defined at @SDL3\/SDL_video.h 1184:42@
sDL_CreateWindow
  :: BG.FunPtr
       (PtrConst.PtrConst BG.CChar -> BG.CInt -> BG.CInt -> SDL_WindowFlags -> IO (BG.Ptr SDL_Window))
sDL_CreateWindow =
  BG.unsafePerformIO hs_bindgen_c12016fdc0d7966b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_CreatePopupWindow@
foreign import ccall unsafe "hs_bindgen_684a9951d98feb17"
  hs_bindgen_684a9951d98feb17_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_CreatePopupWindow@
hs_bindgen_684a9951d98feb17
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Window
             -> BG.CInt
             -> BG.CInt
             -> BG.CInt
             -> BG.CInt
             -> SDL_WindowFlags
             -> IO (BG.Ptr SDL_Window)
           )
       )
hs_bindgen_684a9951d98feb17 =
  BG.fromFFIType hs_bindgen_684a9951d98feb17_base

{-# NOINLINE sDL_CreatePopupWindow #-}

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
--     By default, popup menus will automatically grab keyboard focus from the parent when shown. This behavior can be overridden by setting the @SDL_WINDOW_NOT_FOCUSABLE@ flag, setting the @'sDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN'@ property to false, or toggling it after creation via the @SDL_SetWindowFocusable()@ function.
--
--     If a parent window is hidden or destroyed, any child popup windows will be recursively hidden or destroyed as well. Child popup windows not explicitly hidden will be restored when the parent is shown.
--
--     [@parent@]: the parent of the window, must not be NULL.
--
--     [@offset_x@]: the x position of the popup window relative to the origin of the parent.
--
--     [@offset_y@]: the y position of the popup window relative to the origin of the parent window.
--
--     [@w@]: the width of the window.
--
--     [@h@]: the height of the window.
--
--     [@flags@]: SDL_WINDOW_TOOLTIP or SDL_WINDOW_POPUP_MENU, and zero or more additional 'SDL_WindowFlags' OR\'d together.
--
--     [Returns]: the window that was created or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateWindow', 'sDL_CreateWindowWithProperties', 'sDL_DestroyWindow', 'sDL_GetWindowParent'
--
--     [C declaration]: @SDL_CreatePopupWindow@, defined at @SDL3\/SDL_video.h 1260:42@
sDL_CreatePopupWindow
  :: BG.FunPtr
       ( BG.Ptr SDL_Window
         -> BG.CInt
         -> BG.CInt
         -> BG.CInt
         -> BG.CInt
         -> SDL_WindowFlags
         -> IO (BG.Ptr SDL_Window)
       )
sDL_CreatePopupWindow =
  BG.unsafePerformIO hs_bindgen_684a9951d98feb17

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_CreateWindowWithProperties@
foreign import ccall unsafe "hs_bindgen_2143bdc9c78e0e7e"
  hs_bindgen_2143bdc9c78e0e7e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_CreateWindowWithProperties@
hs_bindgen_2143bdc9c78e0e7e
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_Window)))
hs_bindgen_2143bdc9c78e0e7e =
  BG.fromFFIType hs_bindgen_2143bdc9c78e0e7e_base

{-# NOINLINE sDL_CreateWindowWithProperties #-}

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
--     * any other string without a leading \# sign applies to the element on the page with that ID. Windows with the \"tooltip\" and \"menu\" properties are popup windows and have the behaviors and guidelines outlined in @SDL_CreatePopupWindow()@.
--
--     If this window is being created to be used with an SDL_Renderer, you should not add a graphics API specific property (@'sDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN'@, etc), as SDL will handle that internally when it chooses a renderer. However, SDL might need to recreate your window at that point, which may cause the window to appear briefly, and then flicker as it is recreated. The correct approach to this is to create the window with the @'sDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN'@ property set to true, then create the renderer, then show the window with @SDL_ShowWindow()@.
--
--     [@props@]: the properties to use.
--
--     [Returns]: the window that was created or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_CreateProperties, 'sDL_CreateWindow', 'sDL_DestroyWindow'
--
--     [C declaration]: @SDL_CreateWindowWithProperties@, defined at @SDL3\/SDL_video.h 1409:42@
sDL_CreateWindowWithProperties
  :: BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_Window))
sDL_CreateWindowWithProperties =
  BG.unsafePerformIO hs_bindgen_2143bdc9c78e0e7e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowID@
foreign import ccall unsafe "hs_bindgen_271b950c2d28e361"
  hs_bindgen_271b950c2d28e361_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowID@
hs_bindgen_271b950c2d28e361 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_WindowID))
hs_bindgen_271b950c2d28e361 =
  BG.fromFFIType hs_bindgen_271b950c2d28e361_base

{-# NOINLINE sDL_GetWindowID #-}

-- | Get the numeric ID of a window.
--
--     The numeric ID is what SDL_WindowEvent references, and is necessary to map these events to specific 'SDL_Window' objects.
--
--     [@window@]: the window to query.
--
--     [Returns]: the ID of the window on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowFromID'
--
--     [C declaration]: @SDL_GetWindowID@, defined at @SDL3\/SDL_video.h 1466:42@
sDL_GetWindowID :: BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_WindowID)
sDL_GetWindowID =
  BG.unsafePerformIO hs_bindgen_271b950c2d28e361

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowFromID@
foreign import ccall unsafe "hs_bindgen_4b427f44c79ceb27"
  hs_bindgen_4b427f44c79ceb27_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowFromID@
hs_bindgen_4b427f44c79ceb27 :: IO (BG.FunPtr (SDL_WindowID -> IO (BG.Ptr SDL_Window)))
hs_bindgen_4b427f44c79ceb27 =
  BG.fromFFIType hs_bindgen_4b427f44c79ceb27_base

{-# NOINLINE sDL_GetWindowFromID #-}

-- | Get a window from a stored ID.
--
--     The numeric ID is what SDL_WindowEvent references, and is necessary to map these events to specific 'SDL_Window' objects.
--
--     [@id@]: the ID of the window.
--
--     [Returns]: the window associated with @id@ or NULL if it doesn\'t exist; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowID'
--
--     [C declaration]: @SDL_GetWindowFromID@, defined at @SDL3\/SDL_video.h 1484:42@
sDL_GetWindowFromID :: BG.FunPtr (SDL_WindowID -> IO (BG.Ptr SDL_Window))
sDL_GetWindowFromID =
  BG.unsafePerformIO hs_bindgen_4b427f44c79ceb27

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowParent@
foreign import ccall unsafe "hs_bindgen_3f127843661c07d5"
  hs_bindgen_3f127843661c07d5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowParent@
hs_bindgen_3f127843661c07d5 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO (BG.Ptr SDL_Window)))
hs_bindgen_3f127843661c07d5 =
  BG.fromFFIType hs_bindgen_3f127843661c07d5_base

{-# NOINLINE sDL_GetWindowParent #-}

-- | Get parent of a window.
--
--     [@window@]: the window to query.
--
--     [Returns]: the parent of the window on success or NULL if the window has no parent.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreatePopupWindow'
--
--     [C declaration]: @SDL_GetWindowParent@, defined at @SDL3\/SDL_video.h 1499:42@
sDL_GetWindowParent :: BG.FunPtr (BG.Ptr SDL_Window -> IO (BG.Ptr SDL_Window))
sDL_GetWindowParent =
  BG.unsafePerformIO hs_bindgen_3f127843661c07d5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowProperties@
foreign import ccall unsafe "hs_bindgen_985031bf6e083168"
  hs_bindgen_985031bf6e083168_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowProperties@
hs_bindgen_985031bf6e083168
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_985031bf6e083168 =
  BG.fromFFIType hs_bindgen_985031bf6e083168_base

{-# NOINLINE sDL_GetWindowProperties #-}

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
--     * @'sDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER'@: the OpenGL view\'s renderbuffer object. It must be bound when SDL_GL_SwapWindow is called.
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
--     [@window@]: the window to query.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowProperties@, defined at @SDL3\/SDL_video.h 1628:46@
sDL_GetWindowProperties
  :: BG.FunPtr (BG.Ptr SDL_Window -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetWindowProperties =
  BG.unsafePerformIO hs_bindgen_985031bf6e083168

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowFlags@
foreign import ccall unsafe "hs_bindgen_b1430580544057d6"
  hs_bindgen_b1430580544057d6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowFlags@
hs_bindgen_b1430580544057d6 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_WindowFlags))
hs_bindgen_b1430580544057d6 =
  BG.fromFFIType hs_bindgen_b1430580544057d6_base

{-# NOINLINE sDL_GetWindowFlags #-}

-- | Get the window flags.
--
--     [@window@]: the window to query.
--
--     [Returns]: a mask of the 'SDL_WindowFlags' associated with @window@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateWindow', 'sDL_HideWindow', 'sDL_MaximizeWindow', 'sDL_MinimizeWindow', 'sDL_SetWindowFullscreen', 'sDL_SetWindowMouseGrab', 'sDL_SetWindowFillDocument', 'sDL_ShowWindow'
--
--     [C declaration]: @SDL_GetWindowFlags@, defined at @SDL3\/SDL_video.h 1687:45@
sDL_GetWindowFlags :: BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_WindowFlags)
sDL_GetWindowFlags =
  BG.unsafePerformIO hs_bindgen_b1430580544057d6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowTitle@
foreign import ccall unsafe "hs_bindgen_02e6f654a8740cb6"
  hs_bindgen_02e6f654a8740cb6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowTitle@
hs_bindgen_02e6f654a8740cb6
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_02e6f654a8740cb6 =
  BG.fromFFIType hs_bindgen_02e6f654a8740cb6_base

{-# NOINLINE sDL_SetWindowTitle #-}

-- | Set the title of a window.
--
--     This string is expected to be in UTF-8 encoding.
--
--     [@window@]: the window to change.
--
--     [@title@]: the desired window title in UTF-8 format.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowTitle'
--
--     [C declaration]: @SDL_SetWindowTitle@, defined at @SDL3\/SDL_video.h 1705:34@
sDL_SetWindowTitle :: BG.FunPtr (BG.Ptr SDL_Window -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SetWindowTitle =
  BG.unsafePerformIO hs_bindgen_02e6f654a8740cb6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowTitle@
foreign import ccall unsafe "hs_bindgen_461782ed3ae5273a"
  hs_bindgen_461782ed3ae5273a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowTitle@
hs_bindgen_461782ed3ae5273a :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_461782ed3ae5273a =
  BG.fromFFIType hs_bindgen_461782ed3ae5273a_base

{-# NOINLINE sDL_GetWindowTitle #-}

-- | Get the title of a window.
--
--     [@window@]: the window to query.
--
--     [Returns]: the title of the window in UTF-8 format or \"\" if there is no title.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowTitle'
--
--     [C declaration]: @SDL_GetWindowTitle@, defined at @SDL3\/SDL_video.h 1720:42@
sDL_GetWindowTitle :: BG.FunPtr (BG.Ptr SDL_Window -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetWindowTitle =
  BG.unsafePerformIO hs_bindgen_461782ed3ae5273a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowIcon@
foreign import ccall unsafe "hs_bindgen_c87ab967152ab788"
  hs_bindgen_c87ab967152ab788_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowIcon@
hs_bindgen_c87ab967152ab788
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO BG.CBool))
hs_bindgen_c87ab967152ab788 =
  BG.fromFFIType hs_bindgen_c87ab967152ab788_base

{-# NOINLINE sDL_SetWindowIcon #-}

-- | Set the icon for a window.
--
--     If this function is passed a surface with alternate representations added using SDL_AddSurfaceAlternateImage(), the surface will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations. For example, if the original surface is 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     [@window@]: the window to change.
--
--     [@icon@]: an SDL_Surface structure containing the icon for the window.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_AddSurfaceAlternateImage
--
--     [C declaration]: @SDL_SetWindowIcon@, defined at @SDL3\/SDL_video.h 1747:34@
sDL_SetWindowIcon
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO BG.CBool)
sDL_SetWindowIcon =
  BG.unsafePerformIO hs_bindgen_c87ab967152ab788

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowPosition@
foreign import ccall unsafe "hs_bindgen_196834c01e56d982"
  hs_bindgen_196834c01e56d982_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowPosition@
hs_bindgen_196834c01e56d982
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_196834c01e56d982 =
  BG.fromFFIType hs_bindgen_196834c01e56d982_base

{-# NOINLINE sDL_SetWindowPosition #-}

-- | Request that the window\'s position be set.
--
--     If the window is in an exclusive fullscreen or maximized state, this request has no effect.
--
--     This can be used to reposition fullscreen-desktop windows onto a different display, however, as exclusive fullscreen windows are locked to a specific display, they can only be repositioned programmatically via @SDL_SetWindowFullscreenMode()@.
--
--     On some windowing systems this request is asynchronous and the new coordinates may not have have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window position changes, an SDL_EVENT_WINDOW_MOVED event will be emitted with the window\'s new coordinates. Note that the new coordinates may not match the exact coordinates requested, as some windowing systems can restrict the position of the window in certain scenarios (e.g. constraining the position so the window is always within desktop bounds). Additionally, as this is just a request, it can be denied by the windowing system.
--
--     [@window@]: the window to reposition.
--
--     [@x@]: the x coordinate of the window, or @'sDL_WINDOWPOS_CENTERED'@ or @'sDL_WINDOWPOS_UNDEFINED'@.
--
--     [@y@]: the y coordinate of the window, or @'sDL_WINDOWPOS_CENTERED'@ or @'sDL_WINDOWPOS_UNDEFINED'@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowPosition', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_SetWindowPosition@, defined at @SDL3\/SDL_video.h 1788:34@
sDL_SetWindowPosition :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_SetWindowPosition =
  BG.unsafePerformIO hs_bindgen_196834c01e56d982

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowPosition@
foreign import ccall unsafe "hs_bindgen_f2881c8d992e0f1f"
  hs_bindgen_f2881c8d992e0f1f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowPosition@
hs_bindgen_f2881c8d992e0f1f
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_f2881c8d992e0f1f =
  BG.fromFFIType hs_bindgen_f2881c8d992e0f1f_base

{-# NOINLINE sDL_GetWindowPosition #-}

-- | Get the position of a window.
--
--     This is the current position of the window as last reported by the windowing system.
--
--     If you do not need the value for one of the positions a NULL may be passed in the @x@ or @y@ parameter.
--
--     [@window@]: the window to query.
--
--     [@x@]: a pointer filled in with the x position of the window, may be NULL.
--
--     [@y@]: a pointer filled in with the y position of the window, may be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowPosition'
--
--     [C declaration]: @SDL_GetWindowPosition@, defined at @SDL3\/SDL_video.h 1813:34@
sDL_GetWindowPosition
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetWindowPosition =
  BG.unsafePerformIO hs_bindgen_f2881c8d992e0f1f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowSize@
foreign import ccall unsafe "hs_bindgen_c18dc3d08bf90f70"
  hs_bindgen_c18dc3d08bf90f70_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowSize@
hs_bindgen_c18dc3d08bf90f70
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_c18dc3d08bf90f70 =
  BG.fromFFIType hs_bindgen_c18dc3d08bf90f70_base

{-# NOINLINE sDL_SetWindowSize #-}

-- | Request that the size of a window\'s client area be set.
--
--     If the window is in a fullscreen or maximized state, this request has no effect.
--
--     To change the exclusive fullscreen mode of a window, use @SDL_SetWindowFullscreenMode()@.
--
--     On some windowing systems, this request is asynchronous and the new window size may not have have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be emitted with the new window dimensions. Note that the new dimensions may not match the exact size requested, as some windowing systems can restrict the window size in certain scenarios (e.g. constraining the size of the content area to remain within the usable desktop bounds). Additionally, as this is just a request, it can be denied by the windowing system.
--
--     [@window@]: the window to change.
--
--     [@w@]: the width of the window, must be > 0.
--
--     [@h@]: the height of the window, must be > 0.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowSize', 'sDL_SetWindowFullscreenMode', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_SetWindowSize@, defined at @SDL3\/SDL_video.h 1850:34@
sDL_SetWindowSize :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_SetWindowSize =
  BG.unsafePerformIO hs_bindgen_c18dc3d08bf90f70

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSize@
foreign import ccall unsafe "hs_bindgen_df749a5a4c237fc6"
  hs_bindgen_df749a5a4c237fc6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSize@
hs_bindgen_df749a5a4c237fc6
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_df749a5a4c237fc6 =
  BG.fromFFIType hs_bindgen_df749a5a4c237fc6_base

{-# NOINLINE sDL_GetWindowSize #-}

-- | Get the size of a window\'s client area.
--
--     The window pixel size may differ from its window coordinate size if the window is on a high pixel density display. Use @SDL_GetWindowSizeInPixels()@ or SDL_GetRenderOutputSize() to get the real client area size in pixels.
--
--     [@window@]: the window to query the width and height from.
--
--     [@w@]: a pointer filled in with the width of the window, may be NULL.
--
--     [@h@]: a pointer filled in with the height of the window, may be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_GetRenderOutputSize, 'sDL_GetWindowSizeInPixels', 'sDL_SetWindowSize', SDL_EVENT_WINDOW_RESIZED
--
--     [C declaration]: @SDL_GetWindowSize@, defined at @SDL3\/SDL_video.h 1874:34@
sDL_GetWindowSize
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetWindowSize =
  BG.unsafePerformIO hs_bindgen_df749a5a4c237fc6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSafeArea@
foreign import ccall unsafe "hs_bindgen_8d8deb6f3e406cac"
  hs_bindgen_8d8deb6f3e406cac_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSafeArea@
hs_bindgen_8d8deb6f3e406cac
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_8d8deb6f3e406cac =
  BG.fromFFIType hs_bindgen_8d8deb6f3e406cac_base

{-# NOINLINE sDL_GetWindowSafeArea #-}

-- | Get the safe area for this window.
--
--     Some devices have portions of the screen which are partially obscured or not interactive, possibly due to on-screen controls, curved edges, camera notches, TV overscan, etc. This function provides the area of the window which is safe to have interactable content. You should continue rendering into the rest of the window, but it should not contain visually important or interactable content.
--
--     [@window@]: the window to query.
--
--     [@rect@]: a pointer filled in with the client area that is safe for interactive content.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowSafeArea@, defined at @SDL3\/SDL_video.h 1896:34@
sDL_GetWindowSafeArea
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_GetWindowSafeArea =
  BG.unsafePerformIO hs_bindgen_8d8deb6f3e406cac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowAspectRatio@
foreign import ccall unsafe "hs_bindgen_25a8a6e0ad2d08d8"
  hs_bindgen_25a8a6e0ad2d08d8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowAspectRatio@
hs_bindgen_25a8a6e0ad2d08d8
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CFloat -> BG.CFloat -> IO BG.CBool))
hs_bindgen_25a8a6e0ad2d08d8 =
  BG.fromFFIType hs_bindgen_25a8a6e0ad2d08d8_base

{-# NOINLINE sDL_SetWindowAspectRatio #-}

-- | Request that the aspect ratio of a window\'s client area be set.
--
--     The aspect ratio is the ratio of width divided by height, e.g. 2560x1600 would be 1.6. Larger aspect ratios are wider and smaller aspect ratios are narrower.
--
--     If, at the time of this request, the window in a fixed-size state, such as maximized or fullscreen, the request will be deferred until the window exits this state and becomes resizable again.
--
--     On some windowing systems, this request is asynchronous and the new window aspect ratio may not have have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window size changes, an SDL_EVENT_WINDOW_RESIZED event will be emitted with the new window dimensions. Note that the new dimensions may not match the exact aspect ratio requested, as some windowing systems can restrict the window size in certain scenarios (e.g. constraining the size of the content area to remain within the usable desktop bounds). Additionally, as this is just a request, it can be denied by the windowing system.
--
--     [@window@]: the window to change.
--
--     [@min_aspect@]: the minimum aspect ratio of the window, or 0.0f for no limit.
--
--     [@max_aspect@]: the maximum aspect ratio of the window, or 0.0f for no limit.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowAspectRatio', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_SetWindowAspectRatio@, defined at @SDL3\/SDL_video.h 1937:34@
sDL_SetWindowAspectRatio :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CFloat -> BG.CFloat -> IO BG.CBool)
sDL_SetWindowAspectRatio =
  BG.unsafePerformIO hs_bindgen_25a8a6e0ad2d08d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowAspectRatio@
foreign import ccall unsafe "hs_bindgen_d18b72c056e3e796"
  hs_bindgen_d18b72c056e3e796_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowAspectRatio@
hs_bindgen_d18b72c056e3e796
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool))
hs_bindgen_d18b72c056e3e796 =
  BG.fromFFIType hs_bindgen_d18b72c056e3e796_base

{-# NOINLINE sDL_GetWindowAspectRatio #-}

-- | Get the aspect ratio of a window\'s client area.
--
--     [@window@]: the window to query the width and height from.
--
--     [@min_aspect@]: a pointer filled in with the minimum aspect ratio of the window, may be NULL.
--
--     [@max_aspect@]: a pointer filled in with the maximum aspect ratio of the window, may be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowAspectRatio'
--
--     [C declaration]: @SDL_GetWindowAspectRatio@, defined at @SDL3\/SDL_video.h 1956:34@
sDL_GetWindowAspectRatio
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO BG.CBool)
sDL_GetWindowAspectRatio =
  BG.unsafePerformIO hs_bindgen_d18b72c056e3e796

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowBordersSize@
foreign import ccall unsafe "hs_bindgen_72cf6e7cf38f6a60"
  hs_bindgen_72cf6e7cf38f6a60_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowBordersSize@
hs_bindgen_72cf6e7cf38f6a60
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Window
             -> BG.Ptr BG.CInt
             -> BG.Ptr BG.CInt
             -> BG.Ptr BG.CInt
             -> BG.Ptr BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_72cf6e7cf38f6a60 =
  BG.fromFFIType hs_bindgen_72cf6e7cf38f6a60_base

{-# NOINLINE sDL_GetWindowBordersSize #-}

-- | Get the size of a window\'s borders (decorations) around the client area.
--
--     Note: If this function fails (returns false), the size values will be initialized to 0, 0, 0, 0 (if a non-NULL pointer is provided), as if the window in question was borderless.
--
--     Note: This function may fail on systems where the window has not yet been decorated by the display server (for example, immediately after calling SDL_CreateWindow). It is recommended that you wait at least until the window has been presented and composited, so that the window system has a chance to decorate the window and provide the border dimensions to SDL.
--
--     This function also returns false if getting the information is not supported.
--
--     [@window@]: the window to query the size values of the border (decorations) from.
--
--     [@top@]: pointer to variable for storing the size of the top border; NULL is permitted.
--
--     [@left@]: pointer to variable for storing the size of the left border; NULL is permitted.
--
--     [@bottom@]: pointer to variable for storing the size of the bottom border; NULL is permitted.
--
--     [@right@]: pointer to variable for storing the size of the right border; NULL is permitted.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowSize'
--
--     [C declaration]: @SDL_GetWindowBordersSize@, defined at @SDL3\/SDL_video.h 1993:34@
sDL_GetWindowBordersSize
  :: BG.FunPtr
       ( BG.Ptr SDL_Window
         -> BG.Ptr BG.CInt
         -> BG.Ptr BG.CInt
         -> BG.Ptr BG.CInt
         -> BG.Ptr BG.CInt
         -> IO BG.CBool
       )
sDL_GetWindowBordersSize =
  BG.unsafePerformIO hs_bindgen_72cf6e7cf38f6a60

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSizeInPixels@
foreign import ccall unsafe "hs_bindgen_6affb1847f677537"
  hs_bindgen_6affb1847f677537_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSizeInPixels@
hs_bindgen_6affb1847f677537
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_6affb1847f677537 =
  BG.fromFFIType hs_bindgen_6affb1847f677537_base

{-# NOINLINE sDL_GetWindowSizeInPixels #-}

-- | Get the size of a window\'s client area, in pixels.
--
--     [@window@]: the window from which the drawable size should be queried.
--
--     [@w@]: a pointer to variable for storing the width in pixels, may be NULL.
--
--     [@h@]: a pointer to variable for storing the height in pixels, may be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateWindow', 'sDL_GetWindowSize'
--
--     [C declaration]: @SDL_GetWindowSizeInPixels@, defined at @SDL3\/SDL_video.h 2013:34@
sDL_GetWindowSizeInPixels
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetWindowSizeInPixels =
  BG.unsafePerformIO hs_bindgen_6affb1847f677537

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMinimumSize@
foreign import ccall unsafe "hs_bindgen_6edf78b362442bfc"
  hs_bindgen_6edf78b362442bfc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMinimumSize@
hs_bindgen_6edf78b362442bfc
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_6edf78b362442bfc =
  BG.fromFFIType hs_bindgen_6edf78b362442bfc_base

{-# NOINLINE sDL_SetWindowMinimumSize #-}

-- | Set the minimum size of a window\'s client area.
--
--     [@window@]: the window to change.
--
--     [@min_w@]: the minimum width of the window, or 0 for no limit.
--
--     [@min_h@]: the minimum height of the window, or 0 for no limit.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowMinimumSize', 'sDL_SetWindowMaximumSize'
--
--     [C declaration]: @SDL_SetWindowMinimumSize@, defined at @SDL3\/SDL_video.h 2031:34@
sDL_SetWindowMinimumSize :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_SetWindowMinimumSize =
  BG.unsafePerformIO hs_bindgen_6edf78b362442bfc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMinimumSize@
foreign import ccall unsafe "hs_bindgen_95a71d8cbb92dc9e"
  hs_bindgen_95a71d8cbb92dc9e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMinimumSize@
hs_bindgen_95a71d8cbb92dc9e
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_95a71d8cbb92dc9e =
  BG.fromFFIType hs_bindgen_95a71d8cbb92dc9e_base

{-# NOINLINE sDL_GetWindowMinimumSize #-}

-- | Get the minimum size of a window\'s client area.
--
--     [@window@]: the window to query.
--
--     [@w@]: a pointer filled in with the minimum width of the window, may be NULL.
--
--     [@h@]: a pointer filled in with the minimum height of the window, may be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowMaximumSize', 'sDL_SetWindowMinimumSize'
--
--     [C declaration]: @SDL_GetWindowMinimumSize@, defined at @SDL3\/SDL_video.h 2051:34@
sDL_GetWindowMinimumSize
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetWindowMinimumSize =
  BG.unsafePerformIO hs_bindgen_95a71d8cbb92dc9e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMaximumSize@
foreign import ccall unsafe "hs_bindgen_291022ee01415afe"
  hs_bindgen_291022ee01415afe_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMaximumSize@
hs_bindgen_291022ee01415afe
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_291022ee01415afe =
  BG.fromFFIType hs_bindgen_291022ee01415afe_base

{-# NOINLINE sDL_SetWindowMaximumSize #-}

-- | Set the maximum size of a window\'s client area.
--
--     [@window@]: the window to change.
--
--     [@max_w@]: the maximum width of the window, or 0 for no limit.
--
--     [@max_h@]: the maximum height of the window, or 0 for no limit.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowMaximumSize', 'sDL_SetWindowMinimumSize'
--
--     [C declaration]: @SDL_SetWindowMaximumSize@, defined at @SDL3\/SDL_video.h 2069:34@
sDL_SetWindowMaximumSize :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_SetWindowMaximumSize =
  BG.unsafePerformIO hs_bindgen_291022ee01415afe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMaximumSize@
foreign import ccall unsafe "hs_bindgen_dc1d465b3b604dcd"
  hs_bindgen_dc1d465b3b604dcd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMaximumSize@
hs_bindgen_dc1d465b3b604dcd
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_dc1d465b3b604dcd =
  BG.fromFFIType hs_bindgen_dc1d465b3b604dcd_base

{-# NOINLINE sDL_GetWindowMaximumSize #-}

-- | Get the maximum size of a window\'s client area.
--
--     [@window@]: the window to query.
--
--     [@w@]: a pointer filled in with the maximum width of the window, may be NULL.
--
--     [@h@]: a pointer filled in with the maximum height of the window, may be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowMinimumSize', 'sDL_SetWindowMaximumSize'
--
--     [C declaration]: @SDL_GetWindowMaximumSize@, defined at @SDL3\/SDL_video.h 2089:34@
sDL_GetWindowMaximumSize
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetWindowMaximumSize =
  BG.unsafePerformIO hs_bindgen_dc1d465b3b604dcd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowBordered@
foreign import ccall unsafe "hs_bindgen_88f2360be3e7e300"
  hs_bindgen_88f2360be3e7e300_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowBordered@
hs_bindgen_88f2360be3e7e300 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_88f2360be3e7e300 =
  BG.fromFFIType hs_bindgen_88f2360be3e7e300_base

{-# NOINLINE sDL_SetWindowBordered #-}

-- | Set the border state of a window.
--
--     This will add or remove the window\'s @SDL_WINDOW_BORDERLESS@ flag and add or remove the border from the actual window. This is a no-op if the window\'s border already matches the requested state.
--
--     You can\'t change the border state of a fullscreen window.
--
--     [@window@]: the window of which to change the border state.
--
--     [@bordered@]: false to remove border, true to add border.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowFlags'
--
--     [C declaration]: @SDL_SetWindowBordered@, defined at @SDL3\/SDL_video.h 2111:34@
sDL_SetWindowBordered :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowBordered =
  BG.unsafePerformIO hs_bindgen_88f2360be3e7e300

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowResizable@
foreign import ccall unsafe "hs_bindgen_5100302cfda497dd"
  hs_bindgen_5100302cfda497dd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowResizable@
hs_bindgen_5100302cfda497dd :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_5100302cfda497dd =
  BG.fromFFIType hs_bindgen_5100302cfda497dd_base

{-# NOINLINE sDL_SetWindowResizable #-}

-- | Set the user-resizable state of a window.
--
--     This will add or remove the window\'s @SDL_WINDOW_RESIZABLE@ flag and allow\/disallow user resizing of the window. This is a no-op if the window\'s resizable state already matches the requested state.
--
--     You can\'t change the resizable state of a fullscreen window.
--
--     [@window@]: the window of which to change the resizable state.
--
--     [@resizable@]: true to allow resizing, false to disallow.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowFlags'
--
--     [C declaration]: @SDL_SetWindowResizable@, defined at @SDL3\/SDL_video.h 2133:34@
sDL_SetWindowResizable :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowResizable =
  BG.unsafePerformIO hs_bindgen_5100302cfda497dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowAlwaysOnTop@
foreign import ccall unsafe "hs_bindgen_608fd57fdcd4f95b"
  hs_bindgen_608fd57fdcd4f95b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowAlwaysOnTop@
hs_bindgen_608fd57fdcd4f95b :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_608fd57fdcd4f95b =
  BG.fromFFIType hs_bindgen_608fd57fdcd4f95b_base

{-# NOINLINE sDL_SetWindowAlwaysOnTop #-}

-- | Set the window to always be above the others.
--
--     This will add or remove the window\'s @SDL_WINDOW_ALWAYS_ON_TOP@ flag. This will bring the window to the front and keep the window above the rest.
--
--     [@window@]: the window of which to change the always on top state.
--
--     [@on_top@]: true to set the window always on top, false to disable.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowFlags'
--
--     [C declaration]: @SDL_SetWindowAlwaysOnTop@, defined at @SDL3\/SDL_video.h 2152:34@
sDL_SetWindowAlwaysOnTop :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowAlwaysOnTop =
  BG.unsafePerformIO hs_bindgen_608fd57fdcd4f95b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFillDocument@
foreign import ccall unsafe "hs_bindgen_68dc00f60262f0f8"
  hs_bindgen_68dc00f60262f0f8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFillDocument@
hs_bindgen_68dc00f60262f0f8 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_68dc00f60262f0f8 =
  BG.fromFFIType hs_bindgen_68dc00f60262f0f8_base

{-# NOINLINE sDL_SetWindowFillDocument #-}

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
--     [@window@]: the window of which to change the fill-document state.
--
--     [@fill@]: true to set the window to fill the document, false to disable.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_GetWindowFlags'
--
--     [C declaration]: @SDL_SetWindowFillDocument@, defined at @SDL3\/SDL_video.h 2183:34@
sDL_SetWindowFillDocument :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowFillDocument =
  BG.unsafePerformIO hs_bindgen_68dc00f60262f0f8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_ShowWindow@
foreign import ccall unsafe "hs_bindgen_64fdfc7ce17dc625"
  hs_bindgen_64fdfc7ce17dc625_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_ShowWindow@
hs_bindgen_64fdfc7ce17dc625 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_64fdfc7ce17dc625 =
  BG.fromFFIType hs_bindgen_64fdfc7ce17dc625_base

{-# NOINLINE sDL_ShowWindow #-}

-- | Show a window.
--
--     [@window@]: the window to show.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HideWindow', 'sDL_RaiseWindow'
--
--     [C declaration]: @SDL_ShowWindow@, defined at @SDL3\/SDL_video.h 2199:34@
sDL_ShowWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_ShowWindow =
  BG.unsafePerformIO hs_bindgen_64fdfc7ce17dc625

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_HideWindow@
foreign import ccall unsafe "hs_bindgen_c2ab0cd6e971a55f"
  hs_bindgen_c2ab0cd6e971a55f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_HideWindow@
hs_bindgen_c2ab0cd6e971a55f :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_c2ab0cd6e971a55f =
  BG.fromFFIType hs_bindgen_c2ab0cd6e971a55f_base

{-# NOINLINE sDL_HideWindow #-}

-- | Hide a window.
--
--     [@window@]: the window to hide.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ShowWindow', @SDL_WINDOW_HIDDEN@
--
--     [C declaration]: @SDL_HideWindow@, defined at @SDL3\/SDL_video.h 2215:34@
sDL_HideWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_HideWindow =
  BG.unsafePerformIO hs_bindgen_c2ab0cd6e971a55f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_RaiseWindow@
foreign import ccall unsafe "hs_bindgen_e3e1a65c603c3d63"
  hs_bindgen_e3e1a65c603c3d63_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_RaiseWindow@
hs_bindgen_e3e1a65c603c3d63 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_e3e1a65c603c3d63 =
  BG.fromFFIType hs_bindgen_e3e1a65c603c3d63_base

{-# NOINLINE sDL_RaiseWindow #-}

-- | Request that a window be raised above other windows and gain the input focus.
--
--     The result of this request is subject to desktop window manager policy, particularly if raising the requested window would result in stealing focus from another application. If the window is successfully raised and gains input focus, an SDL_EVENT_WINDOW_FOCUS_GAINED event will be emitted, and the window will have the SDL_WINDOW_INPUT_FOCUS flag set.
--
--     [@window@]: the window to raise.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RaiseWindow@, defined at @SDL3\/SDL_video.h 2235:34@
sDL_RaiseWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_RaiseWindow =
  BG.unsafePerformIO hs_bindgen_e3e1a65c603c3d63

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_MaximizeWindow@
foreign import ccall unsafe "hs_bindgen_fe10be381d9d51e0"
  hs_bindgen_fe10be381d9d51e0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_MaximizeWindow@
hs_bindgen_fe10be381d9d51e0 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_fe10be381d9d51e0 =
  BG.fromFFIType hs_bindgen_fe10be381d9d51e0_base

{-# NOINLINE sDL_MaximizeWindow #-}

-- | Request that the window be made as large as possible.
--
--     Non-resizable windows can\'t be maximized. The window must have the SDL_WINDOW_RESIZABLE flag set, or this will have no effect.
--
--     On some windowing systems this request is asynchronous and the new window state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_MAXIMIZED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
--
--     When maximizing a window, whether the constraints set via @SDL_SetWindowMaximumSize()@ are honored depends on the policy of the window manager. Win32 and macOS enforce the constraints when maximizing, while X11 and Wayland window managers may vary.
--
--     [@window@]: the window to maximize.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_MinimizeWindow', 'sDL_RestoreWindow', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_MaximizeWindow@, defined at @SDL3\/SDL_video.h 2269:34@
sDL_MaximizeWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_MaximizeWindow =
  BG.unsafePerformIO hs_bindgen_fe10be381d9d51e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_MinimizeWindow@
foreign import ccall unsafe "hs_bindgen_d04014fe275b362c"
  hs_bindgen_d04014fe275b362c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_MinimizeWindow@
hs_bindgen_d04014fe275b362c :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_d04014fe275b362c =
  BG.fromFFIType hs_bindgen_d04014fe275b362c_base

{-# NOINLINE sDL_MinimizeWindow #-}

-- | Request that the window be minimized to an iconic representation.
--
--     If the window is in a fullscreen state, this request has no direct effect. It may alter the state the window is returned to when leaving fullscreen.
--
--     On some windowing systems this request is asynchronous and the new window state may not have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_MINIMIZED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
--
--     [@window@]: the window to minimize.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_MaximizeWindow', 'sDL_RestoreWindow', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_MinimizeWindow@, defined at @SDL3\/SDL_video.h 2298:34@
sDL_MinimizeWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_MinimizeWindow =
  BG.unsafePerformIO hs_bindgen_d04014fe275b362c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_RestoreWindow@
foreign import ccall unsafe "hs_bindgen_7fb2f1337e1419c4"
  hs_bindgen_7fb2f1337e1419c4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_RestoreWindow@
hs_bindgen_7fb2f1337e1419c4 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_7fb2f1337e1419c4 =
  BG.fromFFIType hs_bindgen_7fb2f1337e1419c4_base

{-# NOINLINE sDL_RestoreWindow #-}

-- | Request that the size and position of a minimized or maximized window be restored.
--
--     If the window is in a fullscreen state, this request has no direct effect. It may alter the state the window is returned to when leaving fullscreen.
--
--     On some windowing systems this request is asynchronous and the new window state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_RESTORED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
--
--     [@window@]: the window to restore.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_MaximizeWindow', 'sDL_MinimizeWindow', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_RestoreWindow@, defined at @SDL3\/SDL_video.h 2328:34@
sDL_RestoreWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_RestoreWindow =
  BG.unsafePerformIO hs_bindgen_7fb2f1337e1419c4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFullscreen@
foreign import ccall unsafe "hs_bindgen_7997a9fb73c8d257"
  hs_bindgen_7997a9fb73c8d257_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFullscreen@
hs_bindgen_7997a9fb73c8d257 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_7997a9fb73c8d257 =
  BG.fromFFIType hs_bindgen_7997a9fb73c8d257_base

{-# NOINLINE sDL_SetWindowFullscreen #-}

-- | Request that the window\'s fullscreen state be changed.
--
--     By default a window in fullscreen state uses borderless fullscreen desktop mode, but a specific exclusive display mode can be set using @SDL_SetWindowFullscreenMode()@.
--
--     On some windowing systems this request is asynchronous and the new fullscreen state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_ENTER_FULLSCREEN or SDL_EVENT_WINDOW_LEAVE_FULLSCREEN event will be emitted. Note that, as this is just a request, it can be denied by the windowing system.
--
--     [@window@]: the window to change.
--
--     [@fullscreen@]: true for fullscreen mode, false for windowed mode.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowFullscreenMode', 'sDL_SetWindowFullscreenMode', 'sDL_SyncWindow', @SDL_WINDOW_FULLSCREEN@
--
--     [C declaration]: @SDL_SetWindowFullscreen@, defined at @SDL3\/SDL_video.h 2360:34@
sDL_SetWindowFullscreen :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowFullscreen =
  BG.unsafePerformIO hs_bindgen_7997a9fb73c8d257

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SyncWindow@
foreign import ccall unsafe "hs_bindgen_99cfe89c3d1870d2"
  hs_bindgen_99cfe89c3d1870d2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SyncWindow@
hs_bindgen_99cfe89c3d1870d2 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_99cfe89c3d1870d2 =
  BG.fromFFIType hs_bindgen_99cfe89c3d1870d2_base

{-# NOINLINE sDL_SyncWindow #-}

-- | Block until any pending window state is finalized.
--
--     On asynchronous windowing systems, this acts as a synchronization barrier for pending window state. It will attempt to wait until any pending window state has been applied and is guaranteed to return within finite time. Note that for how long it can potentially block depends on the underlying window system, as window state changes may involve somewhat lengthy animations that must complete before the window is in its final requested state.
--
--     On windowing systems where changes are immediate, this does nothing.
--
--     [@window@]: the window for which to wait for the pending state to be applied.
--
--     [Returns]: true on success or false if the operation timed out before the window was in the requested state.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowSize', 'sDL_SetWindowPosition', 'sDL_SetWindowFullscreen', 'sDL_MinimizeWindow', 'sDL_MaximizeWindow', 'sDL_RestoreWindow', SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS
--
--     [C declaration]: @SDL_SyncWindow@, defined at @SDL3\/SDL_video.h 2391:34@
sDL_SyncWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_SyncWindow =
  BG.unsafePerformIO hs_bindgen_99cfe89c3d1870d2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_WindowHasSurface@
foreign import ccall unsafe "hs_bindgen_492c4aeae7928033"
  hs_bindgen_492c4aeae7928033_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_WindowHasSurface@
hs_bindgen_492c4aeae7928033 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_492c4aeae7928033 =
  BG.fromFFIType hs_bindgen_492c4aeae7928033_base

{-# NOINLINE sDL_WindowHasSurface #-}

-- | Return whether the window has a surface associated with it.
--
--     [@window@]: the window to query.
--
--     [Returns]: true if there is a surface associated with the window, or false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowSurface'
--
--     [C declaration]: @SDL_WindowHasSurface@, defined at @SDL3\/SDL_video.h 2406:34@
sDL_WindowHasSurface :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_WindowHasSurface =
  BG.unsafePerformIO hs_bindgen_492c4aeae7928033

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSurface@
foreign import ccall unsafe "hs_bindgen_2f8a00e3685394ac"
  hs_bindgen_2f8a00e3685394ac_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSurface@
hs_bindgen_2f8a00e3685394ac
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)))
hs_bindgen_2f8a00e3685394ac =
  BG.fromFFIType hs_bindgen_2f8a00e3685394ac_base

{-# NOINLINE sDL_GetWindowSurface #-}

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
--     [@window@]: the window to query.
--
--     [Returns]: the surface associated with the window, or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyWindowSurface', 'sDL_WindowHasSurface', 'sDL_UpdateWindowSurface', 'sDL_UpdateWindowSurfaceRects'
--
--     [C declaration]: @SDL_GetWindowSurface@, defined at @SDL3\/SDL_video.h 2435:43@
sDL_GetWindowSurface
  :: BG.FunPtr (BG.Ptr SDL_Window -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface))
sDL_GetWindowSurface =
  BG.unsafePerformIO hs_bindgen_2f8a00e3685394ac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowSurfaceVSync@
foreign import ccall unsafe "hs_bindgen_8e03aa1985376fed"
  hs_bindgen_8e03aa1985376fed_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowSurfaceVSync@
hs_bindgen_8e03aa1985376fed :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> IO BG.CBool))
hs_bindgen_8e03aa1985376fed =
  BG.fromFFIType hs_bindgen_8e03aa1985376fed_base

{-# NOINLINE sDL_SetWindowSurfaceVSync #-}

-- | Toggle VSync for the window surface.
--
--     When a window surface is created, vsync defaults to SDL_WINDOW_SURFACE_VSYNC_DISABLED.
--
--     The @vsync@ parameter can be 1 to synchronize present with every vertical refresh, 2 to synchronize present with every second vertical refresh, etc., SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or SDL_WINDOW_SURFACE_VSYNC_DISABLED to disable. Not every value is supported by every driver, so you should check the return value to see whether the requested setting is supported.
--
--     [@window@]: the window.
--
--     [@vsync@]: the vertical refresh sync interval.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowSurfaceVSync'
--
--     [C declaration]: @SDL_SetWindowSurfaceVSync@, defined at @SDL3\/SDL_video.h 2461:34@
sDL_SetWindowSurfaceVSync :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> IO BG.CBool)
sDL_SetWindowSurfaceVSync =
  BG.unsafePerformIO hs_bindgen_8e03aa1985376fed

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSurfaceVSync@
foreign import ccall unsafe "hs_bindgen_d0cf4eceaaa0e08e"
  hs_bindgen_d0cf4eceaaa0e08e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowSurfaceVSync@
hs_bindgen_d0cf4eceaaa0e08e :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_d0cf4eceaaa0e08e =
  BG.fromFFIType hs_bindgen_d0cf4eceaaa0e08e_base

{-# NOINLINE sDL_GetWindowSurfaceVSync #-}

-- | Get VSync for the window surface.
--
--     [@window@]: the window to query.
--
--     [@vsync@]: an int filled with the current vertical refresh sync interval. See @SDL_SetWindowSurfaceVSync()@ for the meaning of the value.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowSurfaceVSync'
--
--     [C declaration]: @SDL_GetWindowSurfaceVSync@, defined at @SDL3\/SDL_video.h 2481:34@
sDL_GetWindowSurfaceVSync :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetWindowSurfaceVSync =
  BG.unsafePerformIO hs_bindgen_d0cf4eceaaa0e08e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_UpdateWindowSurface@
foreign import ccall unsafe "hs_bindgen_ed4a6fb4d50f6be0"
  hs_bindgen_ed4a6fb4d50f6be0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_UpdateWindowSurface@
hs_bindgen_ed4a6fb4d50f6be0 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_ed4a6fb4d50f6be0 =
  BG.fromFFIType hs_bindgen_ed4a6fb4d50f6be0_base

{-# NOINLINE sDL_UpdateWindowSurface #-}

-- | Copy the window surface to the screen.
--
--     This is the function you use to reflect any changes to the surface on the screen.
--
--     This function is equivalent to the SDL 1.2 API SDL_Flip().
--
--     [@window@]: the window to update.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowSurface', 'sDL_UpdateWindowSurfaceRects'
--
--     [C declaration]: @SDL_UpdateWindowSurface@, defined at @SDL3\/SDL_video.h 2502:34@
sDL_UpdateWindowSurface :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_UpdateWindowSurface =
  BG.unsafePerformIO hs_bindgen_ed4a6fb4d50f6be0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_UpdateWindowSurfaceRects@
foreign import ccall unsafe "hs_bindgen_02e706becc194495"
  hs_bindgen_02e706becc194495_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_UpdateWindowSurfaceRects@
hs_bindgen_02e706becc194495
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Window -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> BG.CInt -> IO BG.CBool)
       )
hs_bindgen_02e706becc194495 =
  BG.fromFFIType hs_bindgen_02e706becc194495_base

{-# NOINLINE sDL_UpdateWindowSurfaceRects #-}

-- | Copy areas of the window surface to the screen.
--
--     This is the function you use to reflect changes to portions of the surface on the screen.
--
--     This function is equivalent to the SDL 1.2 API SDL_UpdateRects().
--
--     Note that this function will update /at least/ the rectangles specified, but this is only intended as an optimization; in practice, this might update more of the screen (or all of the screen!), depending on what method SDL uses to send pixels to the system.
--
--     [@window@]: the window to update.
--
--     [@rects@]: an array of SDL_Rect structures representing areas of the surface to copy, in pixels.
--
--     [@numrects@]: the number of rectangles.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowSurface', 'sDL_UpdateWindowSurface'
--
--     [C declaration]: @SDL_UpdateWindowSurfaceRects@, defined at @SDL3\/SDL_video.h 2531:34@
sDL_UpdateWindowSurfaceRects
  :: BG.FunPtr
       (BG.Ptr SDL_Window -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> BG.CInt -> IO BG.CBool)
sDL_UpdateWindowSurfaceRects =
  BG.unsafePerformIO hs_bindgen_02e706becc194495

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_DestroyWindowSurface@
foreign import ccall unsafe "hs_bindgen_3f86b6de52c490a8"
  hs_bindgen_3f86b6de52c490a8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_DestroyWindowSurface@
hs_bindgen_3f86b6de52c490a8 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_3f86b6de52c490a8 =
  BG.fromFFIType hs_bindgen_3f86b6de52c490a8_base

{-# NOINLINE sDL_DestroyWindowSurface #-}

-- | Destroy the surface associated with the window.
--
--     [@window@]: the window to update.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowSurface', 'sDL_WindowHasSurface'
--
--     [C declaration]: @SDL_DestroyWindowSurface@, defined at @SDL3\/SDL_video.h 2547:34@
sDL_DestroyWindowSurface :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_DestroyWindowSurface =
  BG.unsafePerformIO hs_bindgen_3f86b6de52c490a8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowKeyboardGrab@
foreign import ccall unsafe "hs_bindgen_1a10593b47408de7"
  hs_bindgen_1a10593b47408de7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowKeyboardGrab@
hs_bindgen_1a10593b47408de7 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_1a10593b47408de7 =
  BG.fromFFIType hs_bindgen_1a10593b47408de7_base

{-# NOINLINE sDL_SetWindowKeyboardGrab #-}

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
--     [@window@]: the window for which the keyboard grab mode should be set.
--
--     [@grabbed@]: this is true to grab keyboard, and false to release.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowKeyboardGrab', 'sDL_SetWindowMouseGrab'
--
--     [C declaration]: @SDL_SetWindowKeyboardGrab@, defined at @SDL3\/SDL_video.h 2580:34@
sDL_SetWindowKeyboardGrab :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowKeyboardGrab =
  BG.unsafePerformIO hs_bindgen_1a10593b47408de7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMouseGrab@
foreign import ccall unsafe "hs_bindgen_1c52b8e1bc921458"
  hs_bindgen_1c52b8e1bc921458_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMouseGrab@
hs_bindgen_1c52b8e1bc921458 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_1c52b8e1bc921458 =
  BG.fromFFIType hs_bindgen_1c52b8e1bc921458_base

{-# NOINLINE sDL_SetWindowMouseGrab #-}

-- | Set a window\'s mouse grab mode.
--
--     Mouse grab confines the mouse cursor to the window.
--
--     [@window@]: the window for which the mouse grab mode should be set.
--
--     [@grabbed@]: this is true to grab mouse, and false to release.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowMouseRect', 'sDL_SetWindowMouseRect', 'sDL_SetWindowKeyboardGrab'
--
--     [C declaration]: @SDL_SetWindowMouseGrab@, defined at @SDL3\/SDL_video.h 2600:34@
sDL_SetWindowMouseGrab :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowMouseGrab =
  BG.unsafePerformIO hs_bindgen_1c52b8e1bc921458

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowKeyboardGrab@
foreign import ccall unsafe "hs_bindgen_bd31081b6b534f49"
  hs_bindgen_bd31081b6b534f49_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowKeyboardGrab@
hs_bindgen_bd31081b6b534f49 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_bd31081b6b534f49 =
  BG.fromFFIType hs_bindgen_bd31081b6b534f49_base

{-# NOINLINE sDL_GetWindowKeyboardGrab #-}

-- | Get a window\'s keyboard grab mode.
--
--     [@window@]: the window to query.
--
--     [Returns]: true if keyboard is grabbed, and false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowKeyboardGrab'
--
--     [C declaration]: @SDL_GetWindowKeyboardGrab@, defined at @SDL3\/SDL_video.h 2614:34@
sDL_GetWindowKeyboardGrab :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_GetWindowKeyboardGrab =
  BG.unsafePerformIO hs_bindgen_bd31081b6b534f49

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMouseGrab@
foreign import ccall unsafe "hs_bindgen_40af0f6caff933b4"
  hs_bindgen_40af0f6caff933b4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMouseGrab@
hs_bindgen_40af0f6caff933b4 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_40af0f6caff933b4 =
  BG.fromFFIType hs_bindgen_40af0f6caff933b4_base

{-# NOINLINE sDL_GetWindowMouseGrab #-}

-- | Get a window\'s mouse grab mode.
--
--     [@window@]: the window to query.
--
--     [Returns]: true if mouse is grabbed, and false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowMouseRect', 'sDL_SetWindowMouseRect', 'sDL_SetWindowMouseGrab', 'sDL_SetWindowKeyboardGrab'
--
--     [C declaration]: @SDL_GetWindowMouseGrab@, defined at @SDL3\/SDL_video.h 2631:34@
sDL_GetWindowMouseGrab :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_GetWindowMouseGrab =
  BG.unsafePerformIO hs_bindgen_40af0f6caff933b4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetGrabbedWindow@
foreign import ccall unsafe "hs_bindgen_072d8bccac218ad2"
  hs_bindgen_072d8bccac218ad2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetGrabbedWindow@
hs_bindgen_072d8bccac218ad2 :: IO (BG.FunPtr (IO (BG.Ptr SDL_Window)))
hs_bindgen_072d8bccac218ad2 =
  BG.fromFFIType hs_bindgen_072d8bccac218ad2_base

{-# NOINLINE sDL_GetGrabbedWindow #-}

-- | Get the window that currently has an input grab enabled.
--
--     [Returns]: the window if input is grabbed or NULL otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowMouseGrab', 'sDL_SetWindowKeyboardGrab'
--
--     [C declaration]: @SDL_GetGrabbedWindow@, defined at @SDL3\/SDL_video.h 2645:42@
sDL_GetGrabbedWindow :: BG.FunPtr (IO (BG.Ptr SDL_Window))
sDL_GetGrabbedWindow =
  BG.unsafePerformIO hs_bindgen_072d8bccac218ad2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMouseRect@
foreign import ccall unsafe "hs_bindgen_95863c8d80115819"
  hs_bindgen_95863c8d80115819_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowMouseRect@
hs_bindgen_95863c8d80115819
  :: IO
       (BG.FunPtr (BG.Ptr SDL_Window -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool))
hs_bindgen_95863c8d80115819 =
  BG.fromFFIType hs_bindgen_95863c8d80115819_base

{-# NOINLINE sDL_SetWindowMouseRect #-}

-- | Confines the cursor to the specified area of a window.
--
--     Note that this does NOT grab the cursor, it only defines the area a cursor is restricted to when the window has mouse focus.
--
--     [@window@]: the window that will be associated with the barrier.
--
--     [@rect@]: a rectangle area in window-relative coordinates. If NULL the barrier for the specified window will be destroyed.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowMouseRect', 'sDL_GetWindowMouseGrab', 'sDL_SetWindowMouseGrab'
--
--     [C declaration]: @SDL_SetWindowMouseRect@, defined at @SDL3\/SDL_video.h 2667:34@
sDL_SetWindowMouseRect
  :: BG.FunPtr (BG.Ptr SDL_Window -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect -> IO BG.CBool)
sDL_SetWindowMouseRect =
  BG.unsafePerformIO hs_bindgen_95863c8d80115819

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMouseRect@
foreign import ccall unsafe "hs_bindgen_049b065f15b35ce9"
  hs_bindgen_049b065f15b35ce9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowMouseRect@
hs_bindgen_049b065f15b35ce9
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect)))
hs_bindgen_049b065f15b35ce9 =
  BG.fromFFIType hs_bindgen_049b065f15b35ce9_base

{-# NOINLINE sDL_GetWindowMouseRect #-}

-- | Get the mouse confinement rectangle of a window.
--
--     [@window@]: the window to query.
--
--     [Returns]: a pointer to the mouse confinement rectangle of a window, or NULL if there isn\'t one.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowMouseRect', 'sDL_GetWindowMouseGrab', 'sDL_SetWindowMouseGrab'
--
--     [C declaration]: @SDL_GetWindowMouseRect@, defined at @SDL3\/SDL_video.h 2684:46@
sDL_GetWindowMouseRect
  :: BG.FunPtr (BG.Ptr SDL_Window -> IO (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect))
sDL_GetWindowMouseRect =
  BG.unsafePerformIO hs_bindgen_049b065f15b35ce9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowOpacity@
foreign import ccall unsafe "hs_bindgen_0e865d00ef5cb4eb"
  hs_bindgen_0e865d00ef5cb4eb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowOpacity@
hs_bindgen_0e865d00ef5cb4eb :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CFloat -> IO BG.CBool))
hs_bindgen_0e865d00ef5cb4eb =
  BG.fromFFIType hs_bindgen_0e865d00ef5cb4eb_base

{-# NOINLINE sDL_SetWindowOpacity #-}

-- | Set the opacity for a window.
--
--     The parameter @opacity@ will be clamped internally between 0.0f (transparent) and 1.0f (opaque).
--
--     This function also returns false if setting the opacity isn\'t supported.
--
--     [@window@]: the window which will be made transparent or opaque.
--
--     [@opacity@]: the opacity value (0.0f - transparent, 1.0f - opaque).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowOpacity'
--
--     [C declaration]: @SDL_SetWindowOpacity@, defined at @SDL3\/SDL_video.h 2705:34@
sDL_SetWindowOpacity :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CFloat -> IO BG.CBool)
sDL_SetWindowOpacity =
  BG.unsafePerformIO hs_bindgen_0e865d00ef5cb4eb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowOpacity@
foreign import ccall unsafe "hs_bindgen_fd15ea94ae6c8654"
  hs_bindgen_fd15ea94ae6c8654_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowOpacity@
hs_bindgen_fd15ea94ae6c8654 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CFloat))
hs_bindgen_fd15ea94ae6c8654 =
  BG.fromFFIType hs_bindgen_fd15ea94ae6c8654_base

{-# NOINLINE sDL_GetWindowOpacity #-}

-- | Get the opacity of a window.
--
--     If transparency isn\'t supported on this platform, opacity will be returned as 1.0f without error.
--
--     [@window@]: the window to get the current opacity value from.
--
--     [Returns]: the opacity, (0.0f - transparent, 1.0f - opaque), or -1.0f on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowOpacity'
--
--     [C declaration]: @SDL_GetWindowOpacity@, defined at @SDL3\/SDL_video.h 2723:35@
sDL_GetWindowOpacity :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CFloat)
sDL_GetWindowOpacity =
  BG.unsafePerformIO hs_bindgen_fd15ea94ae6c8654

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowParent@
foreign import ccall unsafe "hs_bindgen_da11824c9c49e3e7"
  hs_bindgen_da11824c9c49e3e7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowParent@
hs_bindgen_da11824c9c49e3e7
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_da11824c9c49e3e7 =
  BG.fromFFIType hs_bindgen_da11824c9c49e3e7_base

{-# NOINLINE sDL_SetWindowParent #-}

-- | Set the window as a child of a parent window.
--
--     If the window is already the child of an existing window, it will be reparented to the new owner. Setting the parent window to NULL unparents the window and removes child window status.
--
--     If a parent window is hidden or destroyed, the operation will be recursively applied to child windows. Child windows hidden with the parent that did not have their hidden status explicitly set will be restored when the parent is shown.
--
--     Attempting to set the parent of a window that is currently in the modal state will fail. Use @SDL_SetWindowModal()@ to cancel the modal status before attempting to change the parent.
--
--     Popup windows cannot change parents and attempts to do so will fail.
--
--     Setting a parent window that is currently the sibling or descendent of the child window results in undefined behavior.
--
--     [@window@]: the window that should become the child of a parent.
--
--     [@parent@]: the new parent window for the child window.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowModal'
--
--     [C declaration]: @SDL_SetWindowParent@, defined at @SDL3\/SDL_video.h 2757:34@
sDL_SetWindowParent :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr SDL_Window -> IO BG.CBool)
sDL_SetWindowParent =
  BG.unsafePerformIO hs_bindgen_da11824c9c49e3e7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowModal@
foreign import ccall unsafe "hs_bindgen_9c2f4466a2e12383"
  hs_bindgen_9c2f4466a2e12383_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowModal@
hs_bindgen_9c2f4466a2e12383 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_9c2f4466a2e12383 =
  BG.fromFFIType hs_bindgen_9c2f4466a2e12383_base

{-# NOINLINE sDL_SetWindowModal #-}

-- | Toggle the state of the window as modal.
--
--     To enable modal status on a window, the window must currently be the child window of a parent, or toggling modal status on will fail.
--
--     [@window@]: the window on which to set the modal state.
--
--     [@modal@]: true to toggle modal status on, false to toggle it off.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowParent', @SDL_WINDOW_MODAL@
--
--     [C declaration]: @SDL_SetWindowModal@, defined at @SDL3\/SDL_video.h 2777:34@
sDL_SetWindowModal :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowModal =
  BG.unsafePerformIO hs_bindgen_9c2f4466a2e12383

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFocusable@
foreign import ccall unsafe "hs_bindgen_61fa950af6d7c2e1"
  hs_bindgen_61fa950af6d7c2e1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowFocusable@
hs_bindgen_61fa950af6d7c2e1 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_61fa950af6d7c2e1 =
  BG.fromFFIType hs_bindgen_61fa950af6d7c2e1_base

{-# NOINLINE sDL_SetWindowFocusable #-}

-- | Set whether the window may have input focus.
--
--     [@window@]: the window to set focusable state.
--
--     [@focusable@]: true to allow input focus, false to not allow input focus.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetWindowFocusable@, defined at @SDL3\/SDL_video.h 2791:34@
sDL_SetWindowFocusable :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowFocusable =
  BG.unsafePerformIO hs_bindgen_61fa950af6d7c2e1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_ShowWindowSystemMenu@
foreign import ccall unsafe "hs_bindgen_cd482a252a1dea04"
  hs_bindgen_cd482a252a1dea04_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_ShowWindowSystemMenu@
hs_bindgen_cd482a252a1dea04
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_cd482a252a1dea04 =
  BG.fromFFIType hs_bindgen_cd482a252a1dea04_base

{-# NOINLINE sDL_ShowWindowSystemMenu #-}

-- | Display the system-level window menu.
--
--     This default window menu is provided by the system and on some platforms provides functionality for setting or changing privileged state on the window, such as moving it between workspaces or displays, or toggling the always-on-top property.
--
--     On platforms or desktops where this is unsupported, this function does nothing.
--
--     [@window@]: the window for which the menu will be displayed.
--
--     [@x@]: the x coordinate of the menu, relative to the origin (top-left) of the client area.
--
--     [@y@]: the y coordinate of the menu, relative to the origin (top-left) of the client area.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ShowWindowSystemMenu@, defined at @SDL3\/SDL_video.h 2817:34@
sDL_ShowWindowSystemMenu :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_ShowWindowSystemMenu =
  BG.unsafePerformIO hs_bindgen_cd482a252a1dea04

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowHitTest@
foreign import ccall unsafe "hs_bindgen_d2a7a11a0da70b01"
  hs_bindgen_d2a7a11a0da70b01_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowHitTest@
hs_bindgen_d2a7a11a0da70b01
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> SDL_HitTest -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_d2a7a11a0da70b01 =
  BG.fromFFIType hs_bindgen_d2a7a11a0da70b01_base

{-# NOINLINE sDL_SetWindowHitTest #-}

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
--     [@window@]: the window to set hit-testing on.
--
--     [@callback@]: the function to call when doing a hit-test.
--
--     [@callback_data@]: an app-defined void pointer passed to __callback__.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetWindowHitTest@, defined at @SDL3\/SDL_video.h 2898:34@
sDL_SetWindowHitTest
  :: BG.FunPtr (BG.Ptr SDL_Window -> SDL_HitTest -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_SetWindowHitTest =
  BG.unsafePerformIO hs_bindgen_d2a7a11a0da70b01

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowShape@
foreign import ccall unsafe "hs_bindgen_3067f5f277541798"
  hs_bindgen_3067f5f277541798_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowShape@
hs_bindgen_3067f5f277541798
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO BG.CBool))
hs_bindgen_3067f5f277541798 =
  BG.fromFFIType hs_bindgen_3067f5f277541798_base

{-# NOINLINE sDL_SetWindowShape #-}

-- | Set the shape of a transparent window.
--
--     This sets the alpha channel of a transparent window and any fully transparent areas are also transparent to mouse clicks. If you are using something besides the SDL render API, then you are responsible for drawing the alpha channel of the window to match the shape alpha channel to get consistent cross-platform results.
--
--     The shape is copied inside this function, so you can free it afterwards. If your shape surface changes, you should call @SDL_SetWindowShape()@ again to update the window. This is an expensive operation, so should be done sparingly.
--
--     The window must have been created with the SDL_WINDOW_TRANSPARENT flag.
--
--     [@window@]: the window.
--
--     [@shape@]: the surface representing the shape of the window, or NULL to remove any current shape.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetWindowShape@, defined at @SDL3\/SDL_video.h 2926:34@
sDL_SetWindowShape
  :: BG.FunPtr (BG.Ptr SDL_Window -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> IO BG.CBool)
sDL_SetWindowShape =
  BG.unsafePerformIO hs_bindgen_3067f5f277541798

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_FlashWindow@
foreign import ccall unsafe "hs_bindgen_7accb263b1f5da86"
  hs_bindgen_7accb263b1f5da86_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_FlashWindow@
hs_bindgen_7accb263b1f5da86
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> SDL_FlashOperation -> IO BG.CBool))
hs_bindgen_7accb263b1f5da86 =
  BG.fromFFIType hs_bindgen_7accb263b1f5da86_base

{-# NOINLINE sDL_FlashWindow #-}

-- | Request a window to demand attention from the user.
--
--     [@window@]: the window to be flashed.
--
--     [@operation@]: the operation to perform.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_FlashWindow@, defined at @SDL3\/SDL_video.h 2940:34@
sDL_FlashWindow :: BG.FunPtr (BG.Ptr SDL_Window -> SDL_FlashOperation -> IO BG.CBool)
sDL_FlashWindow =
  BG.unsafePerformIO hs_bindgen_7accb263b1f5da86

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowProgressState@
foreign import ccall unsafe "hs_bindgen_9c2c63ad5f7e2b4b"
  hs_bindgen_9c2c63ad5f7e2b4b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowProgressState@
hs_bindgen_9c2c63ad5f7e2b4b
  :: IO (BG.FunPtr (BG.Ptr SDL_Window -> SDL_ProgressState -> IO BG.CBool))
hs_bindgen_9c2c63ad5f7e2b4b =
  BG.fromFFIType hs_bindgen_9c2c63ad5f7e2b4b_base

{-# NOINLINE sDL_SetWindowProgressState #-}

-- | Sets the state of the progress bar for the given window’s taskbar icon.
--
--     [@window@]: the window whose progress state is to be modified.
--
--     [@state@]: the progress state. @SDL_PROGRESS_STATE_NONE@ stops displaying the progress bar.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetWindowProgressState@, defined at @SDL3\/SDL_video.h 2955:34@
sDL_SetWindowProgressState :: BG.FunPtr (BG.Ptr SDL_Window -> SDL_ProgressState -> IO BG.CBool)
sDL_SetWindowProgressState =
  BG.unsafePerformIO hs_bindgen_9c2c63ad5f7e2b4b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowProgressState@
foreign import ccall unsafe "hs_bindgen_3c97888e379fc33c"
  hs_bindgen_3c97888e379fc33c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowProgressState@
hs_bindgen_3c97888e379fc33c :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_ProgressState))
hs_bindgen_3c97888e379fc33c =
  BG.fromFFIType hs_bindgen_3c97888e379fc33c_base

{-# NOINLINE sDL_GetWindowProgressState #-}

-- | Get the state of the progress bar for the given window’s taskbar icon.
--
--     [@window@]: the window to get the current progress state from.
--
--     [Returns]: the progress state, or @SDL_PROGRESS_STATE_INVALID@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetWindowProgressState@, defined at @SDL3\/SDL_video.h 2968:47@
sDL_GetWindowProgressState :: BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_ProgressState)
sDL_GetWindowProgressState =
  BG.unsafePerformIO hs_bindgen_3c97888e379fc33c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowProgressValue@
foreign import ccall unsafe "hs_bindgen_df10903c71d955ff"
  hs_bindgen_df10903c71d955ff_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_SetWindowProgressValue@
hs_bindgen_df10903c71d955ff :: IO (BG.FunPtr (BG.Ptr SDL_Window -> BG.CFloat -> IO BG.CBool))
hs_bindgen_df10903c71d955ff =
  BG.fromFFIType hs_bindgen_df10903c71d955ff_base

{-# NOINLINE sDL_SetWindowProgressValue #-}

-- | Sets the value of the progress bar for the given window’s taskbar icon.
--
--     [@window@]: the window whose progress value is to be modified.
--
--     [@value@]: the progress value in the range of [0.0f - 1.0f]. If the value is outside the valid range, it gets clamped.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetWindowProgressValue@, defined at @SDL3\/SDL_video.h 2983:34@
sDL_SetWindowProgressValue :: BG.FunPtr (BG.Ptr SDL_Window -> BG.CFloat -> IO BG.CBool)
sDL_SetWindowProgressValue =
  BG.unsafePerformIO hs_bindgen_df10903c71d955ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowProgressValue@
foreign import ccall unsafe "hs_bindgen_1e0d101b30846cb1"
  hs_bindgen_1e0d101b30846cb1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GetWindowProgressValue@
hs_bindgen_1e0d101b30846cb1 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CFloat))
hs_bindgen_1e0d101b30846cb1 =
  BG.fromFFIType hs_bindgen_1e0d101b30846cb1_base

{-# NOINLINE sDL_GetWindowProgressValue #-}

-- | Get the value of the progress bar for the given window’s taskbar icon.
--
--     [@window@]: the window to get the current progress value from.
--
--     [Returns]: the progress value in the range of [0.0f - 1.0f], or -1.0f on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetWindowProgressValue@, defined at @SDL3\/SDL_video.h 2996:35@
sDL_GetWindowProgressValue :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CFloat)
sDL_GetWindowProgressValue =
  BG.unsafePerformIO hs_bindgen_1e0d101b30846cb1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_DestroyWindow@
foreign import ccall unsafe "hs_bindgen_3af09b929d2d36ab"
  hs_bindgen_3af09b929d2d36ab_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_DestroyWindow@
hs_bindgen_3af09b929d2d36ab :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO ()))
hs_bindgen_3af09b929d2d36ab =
  BG.fromFFIType hs_bindgen_3af09b929d2d36ab_base

{-# NOINLINE sDL_DestroyWindow #-}

-- | Destroy a window.
--
--     Any child windows owned by the window will be recursively destroyed as well.
--
--     Note that on some platforms, the visible window may not actually be removed from the screen until the SDL event loop is pumped again, even though the 'SDL_Window' is no longer valid after this call.
--
--     [@window@]: the window to destroy.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreatePopupWindow', 'sDL_CreateWindow', 'sDL_CreateWindowWithProperties'
--
--     [C declaration]: @SDL_DestroyWindow@, defined at @SDL3\/SDL_video.h 3018:34@
sDL_DestroyWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO ())
sDL_DestroyWindow =
  BG.unsafePerformIO hs_bindgen_3af09b929d2d36ab

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_ScreenSaverEnabled@
foreign import ccall unsafe "hs_bindgen_91298d9810095c05"
  hs_bindgen_91298d9810095c05_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_ScreenSaverEnabled@
hs_bindgen_91298d9810095c05 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_91298d9810095c05 =
  BG.fromFFIType hs_bindgen_91298d9810095c05_base

{-# NOINLINE sDL_ScreenSaverEnabled #-}

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
--     [See also]: 'sDL_DisableScreenSaver', 'sDL_EnableScreenSaver'
--
--     [C declaration]: @SDL_ScreenSaverEnabled@, defined at @SDL3\/SDL_video.h 3037:34@
sDL_ScreenSaverEnabled :: BG.FunPtr (IO BG.CBool)
sDL_ScreenSaverEnabled =
  BG.unsafePerformIO hs_bindgen_91298d9810095c05

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EnableScreenSaver@
foreign import ccall unsafe "hs_bindgen_a142225724865b93"
  hs_bindgen_a142225724865b93_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EnableScreenSaver@
hs_bindgen_a142225724865b93 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_a142225724865b93 =
  BG.fromFFIType hs_bindgen_a142225724865b93_base

{-# NOINLINE sDL_EnableScreenSaver #-}

-- | Allow the screen to be blanked by a screen saver.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DisableScreenSaver', 'sDL_ScreenSaverEnabled'
--
--     [C declaration]: @SDL_EnableScreenSaver@, defined at @SDL3\/SDL_video.h 3052:34@
sDL_EnableScreenSaver :: BG.FunPtr (IO BG.CBool)
sDL_EnableScreenSaver =
  BG.unsafePerformIO hs_bindgen_a142225724865b93

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_DisableScreenSaver@
foreign import ccall unsafe "hs_bindgen_96e0130db8c924c0"
  hs_bindgen_96e0130db8c924c0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_DisableScreenSaver@
hs_bindgen_96e0130db8c924c0 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_96e0130db8c924c0 =
  BG.fromFFIType hs_bindgen_96e0130db8c924c0_base

{-# NOINLINE sDL_DisableScreenSaver #-}

-- | Prevent the screen from being blanked by a screen saver.
--
--     If you disable the screensaver, it is automatically re-enabled when SDL quits.
--
--     The screensaver is disabled by default, but this may by changed by SDL_HINT_VIDEO_ALLOW_SCREENSAVER.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EnableScreenSaver', 'sDL_ScreenSaverEnabled'
--
--     [C declaration]: @SDL_DisableScreenSaver@, defined at @SDL3\/SDL_video.h 3073:34@
sDL_DisableScreenSaver :: BG.FunPtr (IO BG.CBool)
sDL_DisableScreenSaver =
  BG.unsafePerformIO hs_bindgen_96e0130db8c924c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_LoadLibrary@
foreign import ccall unsafe "hs_bindgen_eab5183eb86cd104"
  hs_bindgen_eab5183eb86cd104_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_LoadLibrary@
hs_bindgen_eab5183eb86cd104 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_eab5183eb86cd104 =
  BG.fromFFIType hs_bindgen_eab5183eb86cd104_base

{-# NOINLINE sDL_GL_LoadLibrary #-}

-- | Dynamically load an OpenGL library.
--
--     This should be done after initializing the video driver, but before creating any OpenGL windows. If no OpenGL library is loaded, the default library will be loaded upon creation of the first OpenGL window.
--
--     If you do this, you need to retrieve all of the GL functions used in your program from the dynamic library using @SDL_GL_GetProcAddress()@.
--
--     [@path@]: the platform dependent OpenGL library name, or NULL to open the default OpenGL library.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_GetProcAddress', 'sDL_GL_UnloadLibrary'
--
--     [C declaration]: @SDL_GL_LoadLibrary@, defined at @SDL3\/SDL_video.h 3103:34@
sDL_GL_LoadLibrary :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_GL_LoadLibrary =
  BG.unsafePerformIO hs_bindgen_eab5183eb86cd104

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetProcAddress@
foreign import ccall unsafe "hs_bindgen_34476455b181778b"
  hs_bindgen_34476455b181778b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetProcAddress@
hs_bindgen_34476455b181778b
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer))
hs_bindgen_34476455b181778b =
  BG.fromFFIType hs_bindgen_34476455b181778b_base

{-# NOINLINE sDL_GL_GetProcAddress #-}

-- | Get an OpenGL function by name.
--
--     If the GL library is loaded at runtime with @SDL_GL_LoadLibrary()@, then all GL functions must be retrieved this way. Usually this is used to retrieve function pointers to OpenGL extensions.
--
--     There are some quirks to looking up OpenGL functions that require some extra care from the application. If you code carefully, you can handle these quirks without any platform-specific code, though:
--
--     * On Windows, function pointers are specific to the current GL context; this means you need to have created a GL context and made it current before calling @SDL_GL_GetProcAddress()@. If you recreate your context or create a second context, you should assume that any existing function pointers aren\'t valid to use with it. This is (currently) a Windows-specific limitation, and in practice lots of drivers don\'t suffer this limitation, but it is still the way the wgl API is documented to work and you should expect crashes if you don\'t respect it. Store a copy of the function pointers that comes and goes with context lifespan.
--
--     * On X11, function pointers returned by this function are valid for any context, and can even be looked up before a context is created at all. This means that, for at least some common OpenGL implementations, if you look up a function that doesn\'t exist, you\'ll get a non-NULL result that is /NOT/ safe to call. You must always make sure the function is actually available for a given GL context before calling it, by checking for the existence of the appropriate extension with @SDL_GL_ExtensionSupported()@, or verifying that the version of OpenGL you\'re using offers the function as core functionality.
--
--     * Some OpenGL drivers, on all platforms, /will/ return NULL if a function isn\'t supported, but you can\'t count on this behavior. Check for extensions you use, and if you get a NULL anyway, act as if that extension wasn\'t available. This is probably a bug in the driver, but you can code defensively for this scenario anyhow.
--
--     * Just because you\'re on Linux\/Unix, don\'t assume you\'ll be using X11. Next-gen display servers are waiting to replace it, and may or may not make the same promises about function pointers.
--
--     * OpenGL function pointers must be declared @APIENTRY@ as in the example code. This will ensure the proper calling convention is followed on platforms where this matters (Win32) thereby avoiding stack corruption.
--
--     [@proc@]: the name of an OpenGL function.
--
--     [Returns]: a pointer to the named OpenGL function. The returned pointer should be cast to the appropriate function signature.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_ExtensionSupported', 'sDL_GL_LoadLibrary', 'sDL_GL_UnloadLibrary'
--
--     [C declaration]: @SDL_GL_GetProcAddress@, defined at @SDL3\/SDL_video.h 3158:49@
sDL_GL_GetProcAddress
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer)
sDL_GL_GetProcAddress =
  BG.unsafePerformIO hs_bindgen_34476455b181778b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetProcAddress@
foreign import ccall unsafe "hs_bindgen_b7365d91417dcc00"
  hs_bindgen_b7365d91417dcc00_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetProcAddress@
hs_bindgen_b7365d91417dcc00
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer))
hs_bindgen_b7365d91417dcc00 =
  BG.fromFFIType hs_bindgen_b7365d91417dcc00_base

{-# NOINLINE sDL_EGL_GetProcAddress #-}

-- | Get an EGL library function by name.
--
--     If an EGL library is loaded, this function allows applications to get entry points for EGL functions. This is useful to provide to an EGL API and extension loader.
--
--     [@proc@]: the name of an EGL function.
--
--     [Returns]: a pointer to the named EGL function. The returned pointer should be cast to the appropriate function signature.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EGL_GetCurrentDisplay'
--
--     [C declaration]: @SDL_EGL_GetProcAddress@, defined at @SDL3\/SDL_video.h 3177:49@
sDL_EGL_GetProcAddress
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer)
sDL_EGL_GetProcAddress =
  BG.unsafePerformIO hs_bindgen_b7365d91417dcc00

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_UnloadLibrary@
foreign import ccall unsafe "hs_bindgen_626ee6f51d853cc4"
  hs_bindgen_626ee6f51d853cc4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_UnloadLibrary@
hs_bindgen_626ee6f51d853cc4 :: IO (BG.FunPtr (IO ()))
hs_bindgen_626ee6f51d853cc4 =
  BG.fromFFIType hs_bindgen_626ee6f51d853cc4_base

{-# NOINLINE sDL_GL_UnloadLibrary #-}

-- | Unload the OpenGL library previously loaded by @SDL_GL_LoadLibrary()@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_LoadLibrary'
--
--     [C declaration]: @SDL_GL_UnloadLibrary@, defined at @SDL3\/SDL_video.h 3188:34@
sDL_GL_UnloadLibrary :: BG.FunPtr (IO ())
sDL_GL_UnloadLibrary =
  BG.unsafePerformIO hs_bindgen_626ee6f51d853cc4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_ExtensionSupported@
foreign import ccall unsafe "hs_bindgen_4b6ac25f9c74898b"
  hs_bindgen_4b6ac25f9c74898b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_ExtensionSupported@
hs_bindgen_4b6ac25f9c74898b :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_4b6ac25f9c74898b =
  BG.fromFFIType hs_bindgen_4b6ac25f9c74898b_base

{-# NOINLINE sDL_GL_ExtensionSupported #-}

-- | Check if an OpenGL extension is supported for the current context.
--
--     This function operates on the current GL context; you must have created a context and it must be current before calling this function. Do not assume that all contexts you create will have the same set of extensions available, or that recreating an existing context will offer the same extensions again.
--
--     While it\'s probably not a massive overhead, this function is not an O(1) operation. Check the extensions you care about after creating the GL context and save that information somewhere instead of calling the function every time you need to know.
--
--     [@extension@]: the name of the extension to check.
--
--     [Returns]: true if the extension is supported, false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GL_ExtensionSupported@, defined at @SDL3\/SDL_video.h 3211:34@
sDL_GL_ExtensionSupported :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_GL_ExtensionSupported =
  BG.unsafePerformIO hs_bindgen_4b6ac25f9c74898b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_ResetAttributes@
foreign import ccall unsafe "hs_bindgen_8d3172eec8730621"
  hs_bindgen_8d3172eec8730621_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_ResetAttributes@
hs_bindgen_8d3172eec8730621 :: IO (BG.FunPtr (IO ()))
hs_bindgen_8d3172eec8730621 =
  BG.fromFFIType hs_bindgen_8d3172eec8730621_base

{-# NOINLINE sDL_GL_ResetAttributes #-}

-- | Reset all previously set OpenGL context attributes to their default values.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_GetAttribute', 'sDL_GL_SetAttribute'
--
--     [C declaration]: @SDL_GL_ResetAttributes@, defined at @SDL3\/SDL_video.h 3223:34@
sDL_GL_ResetAttributes :: BG.FunPtr (IO ())
sDL_GL_ResetAttributes =
  BG.unsafePerformIO hs_bindgen_8d3172eec8730621

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_SetAttribute@
foreign import ccall unsafe "hs_bindgen_2c780ec7126f44cf"
  hs_bindgen_2c780ec7126f44cf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_SetAttribute@
hs_bindgen_2c780ec7126f44cf :: IO (BG.FunPtr (SDL_GLAttr -> BG.CInt -> IO BG.CBool))
hs_bindgen_2c780ec7126f44cf =
  BG.fromFFIType hs_bindgen_2c780ec7126f44cf_base

{-# NOINLINE sDL_GL_SetAttribute #-}

-- | Set an OpenGL window attribute before window creation.
--
--     This function sets the OpenGL attribute @attr@ to @value@. The requested attributes should be set before creating an OpenGL window. You should use @SDL_GL_GetAttribute()@ to check the values after creating the OpenGL context, since the values obtained can differ from the requested ones.
--
--     [@attr@]: an enum value specifying the OpenGL attribute to set.
--
--     [@value@]: the desired value for the attribute.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_CreateContext', 'sDL_GL_GetAttribute', 'sDL_GL_ResetAttributes'
--
--     [C declaration]: @SDL_GL_SetAttribute@, defined at @SDL3\/SDL_video.h 3246:34@
sDL_GL_SetAttribute :: BG.FunPtr (SDL_GLAttr -> BG.CInt -> IO BG.CBool)
sDL_GL_SetAttribute =
  BG.unsafePerformIO hs_bindgen_2c780ec7126f44cf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetAttribute@
foreign import ccall unsafe "hs_bindgen_f2be9d4ead0d65a2"
  hs_bindgen_f2be9d4ead0d65a2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetAttribute@
hs_bindgen_f2be9d4ead0d65a2 :: IO (BG.FunPtr (SDL_GLAttr -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_f2be9d4ead0d65a2 =
  BG.fromFFIType hs_bindgen_f2be9d4ead0d65a2_base

{-# NOINLINE sDL_GL_GetAttribute #-}

-- | Get the actual value for an attribute from the current context.
--
--     [@attr@]: an 'SDL_GLAttr' enum value specifying the OpenGL attribute to get.
--
--     [@value@]: a pointer filled in with the current value of @attr@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_ResetAttributes', 'sDL_GL_SetAttribute'
--
--     [C declaration]: @SDL_GL_GetAttribute@, defined at @SDL3\/SDL_video.h 3264:34@
sDL_GL_GetAttribute :: BG.FunPtr (SDL_GLAttr -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GL_GetAttribute =
  BG.unsafePerformIO hs_bindgen_f2be9d4ead0d65a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_CreateContext@
foreign import ccall unsafe "hs_bindgen_9f1f69477c4acb50"
  hs_bindgen_9f1f69477c4acb50_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_CreateContext@
hs_bindgen_9f1f69477c4acb50 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_GLContext))
hs_bindgen_9f1f69477c4acb50 =
  BG.fromFFIType hs_bindgen_9f1f69477c4acb50_base

{-# NOINLINE sDL_GL_CreateContext #-}

-- | Create an OpenGL context for an OpenGL window, and make it current.
--
--     The OpenGL context will be created with the current states set through @SDL_GL_SetAttribute()@.
--
--     The 'SDL_Window' specified must have been created with the SDL_WINDOW_OPENGL flag, or context creation will fail.
--
--     Windows users new to OpenGL should note that, for historical reasons, GL functions added after OpenGL version 1.1 are not available by default. Those functions must be loaded at run-time, either with an OpenGL extension-handling library or with @SDL_GL_GetProcAddress()@ and its related functions.
--
--     'SDL_GLContext' is opaque to the application.
--
--     [@window@]: the window to associate with the context.
--
--     [Returns]: the OpenGL context associated with @window@ or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_DestroyContext', 'sDL_GL_MakeCurrent'
--
--     [C declaration]: @SDL_GL_CreateContext@, defined at @SDL3\/SDL_video.h 3294:43@
sDL_GL_CreateContext :: BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_GLContext)
sDL_GL_CreateContext =
  BG.unsafePerformIO hs_bindgen_9f1f69477c4acb50

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_MakeCurrent@
foreign import ccall unsafe "hs_bindgen_2336de6c69b02847"
  hs_bindgen_2336de6c69b02847_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_MakeCurrent@
hs_bindgen_2336de6c69b02847 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> SDL_GLContext -> IO BG.CBool))
hs_bindgen_2336de6c69b02847 =
  BG.fromFFIType hs_bindgen_2336de6c69b02847_base

{-# NOINLINE sDL_GL_MakeCurrent #-}

-- | Set up an OpenGL context for rendering into an OpenGL window.
--
--     The context must have been created with a compatible window.
--
--     [@window@]: the window to associate with the context.
--
--     [@context@]: the OpenGL context to associate with the window.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_CreateContext'
--
--     [C declaration]: @SDL_GL_MakeCurrent@, defined at @SDL3\/SDL_video.h 3312:34@
sDL_GL_MakeCurrent :: BG.FunPtr (BG.Ptr SDL_Window -> SDL_GLContext -> IO BG.CBool)
sDL_GL_MakeCurrent =
  BG.unsafePerformIO hs_bindgen_2336de6c69b02847

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetCurrentWindow@
foreign import ccall unsafe "hs_bindgen_1d77b3c33533bc52"
  hs_bindgen_1d77b3c33533bc52_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetCurrentWindow@
hs_bindgen_1d77b3c33533bc52 :: IO (BG.FunPtr (IO (BG.Ptr SDL_Window)))
hs_bindgen_1d77b3c33533bc52 =
  BG.fromFFIType hs_bindgen_1d77b3c33533bc52_base

{-# NOINLINE sDL_GL_GetCurrentWindow #-}

-- | Get the currently active OpenGL window.
--
--     [Returns]: the currently active OpenGL window on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GL_GetCurrentWindow@, defined at @SDL3\/SDL_video.h 3324:42@
sDL_GL_GetCurrentWindow :: BG.FunPtr (IO (BG.Ptr SDL_Window))
sDL_GL_GetCurrentWindow =
  BG.unsafePerformIO hs_bindgen_1d77b3c33533bc52

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetCurrentContext@
foreign import ccall unsafe "hs_bindgen_70929e076db9af7f"
  hs_bindgen_70929e076db9af7f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetCurrentContext@
hs_bindgen_70929e076db9af7f :: IO (BG.FunPtr (IO SDL_GLContext))
hs_bindgen_70929e076db9af7f =
  BG.fromFFIType hs_bindgen_70929e076db9af7f_base

{-# NOINLINE sDL_GL_GetCurrentContext #-}

-- | Get the currently active OpenGL context.
--
--     [Returns]: the currently active OpenGL context or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_MakeCurrent'
--
--     [C declaration]: @SDL_GL_GetCurrentContext@, defined at @SDL3\/SDL_video.h 3338:43@
sDL_GL_GetCurrentContext :: BG.FunPtr (IO SDL_GLContext)
sDL_GL_GetCurrentContext =
  BG.unsafePerformIO hs_bindgen_70929e076db9af7f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetCurrentDisplay@
foreign import ccall unsafe "hs_bindgen_ad8ff3579d19bf4c"
  hs_bindgen_ad8ff3579d19bf4c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetCurrentDisplay@
hs_bindgen_ad8ff3579d19bf4c :: IO (BG.FunPtr (IO SDL_EGLDisplay))
hs_bindgen_ad8ff3579d19bf4c =
  BG.fromFFIType hs_bindgen_ad8ff3579d19bf4c_base

{-# NOINLINE sDL_EGL_GetCurrentDisplay #-}

-- | Get the currently active EGL display.
--
--     [Returns]: the currently active EGL display or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGL_GetCurrentDisplay@, defined at @SDL3\/SDL_video.h 3350:44@
sDL_EGL_GetCurrentDisplay :: BG.FunPtr (IO SDL_EGLDisplay)
sDL_EGL_GetCurrentDisplay =
  BG.unsafePerformIO hs_bindgen_ad8ff3579d19bf4c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetCurrentConfig@
foreign import ccall unsafe "hs_bindgen_52c08e8d53d84085"
  hs_bindgen_52c08e8d53d84085_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetCurrentConfig@
hs_bindgen_52c08e8d53d84085 :: IO (BG.FunPtr (IO SDL_EGLConfig))
hs_bindgen_52c08e8d53d84085 =
  BG.fromFFIType hs_bindgen_52c08e8d53d84085_base

{-# NOINLINE sDL_EGL_GetCurrentConfig #-}

-- | Get the currently active EGL config.
--
--     [Returns]: the currently active EGL config or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGL_GetCurrentConfig@, defined at @SDL3\/SDL_video.h 3362:43@
sDL_EGL_GetCurrentConfig :: BG.FunPtr (IO SDL_EGLConfig)
sDL_EGL_GetCurrentConfig =
  BG.unsafePerformIO hs_bindgen_52c08e8d53d84085

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetWindowSurface@
foreign import ccall unsafe "hs_bindgen_4d9d3145651703ea"
  hs_bindgen_4d9d3145651703ea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_GetWindowSurface@
hs_bindgen_4d9d3145651703ea :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_EGLSurface))
hs_bindgen_4d9d3145651703ea =
  BG.fromFFIType hs_bindgen_4d9d3145651703ea_base

{-# NOINLINE sDL_EGL_GetWindowSurface #-}

-- | Get the EGL surface associated with the window.
--
--     [@window@]: the window to query.
--
--     [Returns]: the EGLSurface pointer associated with the window, or NULL on failure.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGL_GetWindowSurface@, defined at @SDL3\/SDL_video.h 3375:44@
sDL_EGL_GetWindowSurface :: BG.FunPtr (BG.Ptr SDL_Window -> IO SDL_EGLSurface)
sDL_EGL_GetWindowSurface =
  BG.unsafePerformIO hs_bindgen_4d9d3145651703ea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_SetAttributeCallbacks@
foreign import ccall unsafe "hs_bindgen_2d4a4b5954adbdda"
  hs_bindgen_2d4a4b5954adbdda_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_EGL_SetAttributeCallbacks@
hs_bindgen_2d4a4b5954adbdda
  :: IO
       ( BG.FunPtr
           ( SDL_EGLAttribArrayCallback
             -> SDL_EGLIntArrayCallback
             -> SDL_EGLIntArrayCallback
             -> BG.Ptr BG.Void
             -> IO ()
           )
       )
hs_bindgen_2d4a4b5954adbdda =
  BG.fromFFIType hs_bindgen_2d4a4b5954adbdda_base

{-# NOINLINE sDL_EGL_SetAttributeCallbacks #-}

-- | Sets the callbacks for defining custom EGLAttrib arrays for EGL initialization.
--
--     Callbacks that aren\'t needed can be set to NULL.
--
--     NOTE: These callback pointers will be reset after SDL_GL_ResetAttributes.
--
--     [@platformAttribCallback@]: callback for attributes to pass to eglGetPlatformDisplay. May be NULL.
--
--     [@surfaceAttribCallback@]: callback for attributes to pass to eglCreateSurface. May be NULL.
--
--     [@contextAttribCallback@]: callback for attributes to pass to eglCreateContext. May be NULL.
--
--     [@userdata@]: a pointer that is passed to the callbacks.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGL_SetAttributeCallbacks@, defined at @SDL3\/SDL_video.h 3397:34@
sDL_EGL_SetAttributeCallbacks
  :: BG.FunPtr
       ( SDL_EGLAttribArrayCallback
         -> SDL_EGLIntArrayCallback
         -> SDL_EGLIntArrayCallback
         -> BG.Ptr BG.Void
         -> IO ()
       )
sDL_EGL_SetAttributeCallbacks =
  BG.unsafePerformIO hs_bindgen_2d4a4b5954adbdda

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_SetSwapInterval@
foreign import ccall unsafe "hs_bindgen_61901cbd29279d80"
  hs_bindgen_61901cbd29279d80_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_SetSwapInterval@
hs_bindgen_61901cbd29279d80 :: IO (BG.FunPtr (BG.CInt -> IO BG.CBool))
hs_bindgen_61901cbd29279d80 =
  BG.fromFFIType hs_bindgen_61901cbd29279d80_base

{-# NOINLINE sDL_GL_SetSwapInterval #-}

-- | Set the swap interval for the current OpenGL context.
--
--     Some systems allow specifying -1 for the interval, to enable adaptive vsync. Adaptive vsync works the same as vsync, but if you\'ve already missed the vertical retrace for a given frame, it swaps buffers immediately, which might be less jarring for the user during occasional framerate drops. If an application requests adaptive vsync and the system does not support it, this function will fail and return false. In such a case, you should probably retry the call with 1 for the interval.
--
--     Adaptive vsync is implemented for some glX drivers with GLX_EXT_swap_control_tear, and for some Windows drivers with WGL_EXT_swap_control_tear.
--
--     Read more on the Khronos wiki: [https:\/\/www.khronos.org\/opengl\/wiki\/Swap_Interval\#Adaptive_Vsync](https://www.khronos.org/opengl/wiki/Swap_Interval#Adaptive_Vsync)
--
--     [@interval@]: 0 for immediate updates, 1 for updates synchronized with the vertical retrace, -1 for adaptive vsync.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_GetSwapInterval'
--
--     [C declaration]: @SDL_GL_SetSwapInterval@, defined at @SDL3\/SDL_video.h 3430:34@
sDL_GL_SetSwapInterval :: BG.FunPtr (BG.CInt -> IO BG.CBool)
sDL_GL_SetSwapInterval =
  BG.unsafePerformIO hs_bindgen_61901cbd29279d80

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetSwapInterval@
foreign import ccall unsafe "hs_bindgen_2ead7bd70a2b5362"
  hs_bindgen_2ead7bd70a2b5362_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_GetSwapInterval@
hs_bindgen_2ead7bd70a2b5362 :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_2ead7bd70a2b5362 =
  BG.fromFFIType hs_bindgen_2ead7bd70a2b5362_base

{-# NOINLINE sDL_GL_GetSwapInterval #-}

-- | Get the swap interval for the current OpenGL context.
--
--     If the system can\'t determine the swap interval, or there isn\'t a valid current context, this function will set *interval to 0 as a safe default.
--
--     [@interval@]: output interval value. 0 if there is no vertical retrace synchronization, 1 if the buffer swap is synchronized with the vertical retrace, and -1 if late swaps happen immediately instead of waiting for the next retrace.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_SetSwapInterval'
--
--     [C declaration]: @SDL_GL_GetSwapInterval@, defined at @SDL3\/SDL_video.h 3451:34@
sDL_GL_GetSwapInterval :: BG.FunPtr (BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GL_GetSwapInterval =
  BG.unsafePerformIO hs_bindgen_2ead7bd70a2b5362

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_SwapWindow@
foreign import ccall unsafe "hs_bindgen_21d656c344c13469"
  hs_bindgen_21d656c344c13469_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_SwapWindow@
hs_bindgen_21d656c344c13469 :: IO (BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool))
hs_bindgen_21d656c344c13469 =
  BG.fromFFIType hs_bindgen_21d656c344c13469_base

{-# NOINLINE sDL_GL_SwapWindow #-}

-- | Update a window with OpenGL rendering.
--
--     This is used with double-buffered OpenGL contexts, which are the default.
--
--     On macOS, make sure you bind 0 to the draw framebuffer before swapping the window, otherwise nothing will happen. If you aren\'t using glBindFramebuffer(), this is the default and you won\'t have to do anything extra.
--
--     [@window@]: the window to change.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GL_SwapWindow@, defined at @SDL3\/SDL_video.h 3471:34@
sDL_GL_SwapWindow :: BG.FunPtr (BG.Ptr SDL_Window -> IO BG.CBool)
sDL_GL_SwapWindow =
  BG.unsafePerformIO hs_bindgen_21d656c344c13469

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_DestroyContext@
foreign import ccall unsafe "hs_bindgen_c03de6ace9ca6264"
  hs_bindgen_c03de6ace9ca6264_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_get_SDL_GL_DestroyContext@
hs_bindgen_c03de6ace9ca6264 :: IO (BG.FunPtr (SDL_GLContext -> IO BG.CBool))
hs_bindgen_c03de6ace9ca6264 =
  BG.fromFFIType hs_bindgen_c03de6ace9ca6264_base

{-# NOINLINE sDL_GL_DestroyContext #-}

-- | Delete an OpenGL context.
--
--     [@context@]: the OpenGL context to be deleted.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_CreateContext'
--
--     [C declaration]: @SDL_GL_DestroyContext@, defined at @SDL3\/SDL_video.h 3486:34@
sDL_GL_DestroyContext :: BG.FunPtr (SDL_GLContext -> IO BG.CBool)
sDL_GL_DestroyContext =
  BG.unsafePerformIO hs_bindgen_c03de6ace9ca6264
