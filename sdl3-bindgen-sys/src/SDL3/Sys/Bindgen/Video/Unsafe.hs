{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Video.Unsafe (
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetNumVideoDrivers,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetVideoDriver,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetCurrentVideoDriver,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetSystemTheme,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDisplays,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetPrimaryDisplay,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDisplayProperties,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDisplayName,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDisplayBounds,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDisplayUsableBounds,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetNaturalDisplayOrientation,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetCurrentDisplayOrientation,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDisplayContentScale,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetFullscreenDisplayModes,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetClosestFullscreenDisplayMode,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDesktopDisplayMode,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetCurrentDisplayMode,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDisplayForPoint,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDisplayForRect,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetDisplayForWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowPixelDensity,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowDisplayScale,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowFullscreenMode,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowFullscreenMode,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowICCProfile,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowPixelFormat,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindows,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_CreateWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_CreatePopupWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_CreateWindowWithProperties,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowID,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowFromID,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowParent,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowProperties,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowFlags,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowTitle,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowTitle,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowIcon,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowPosition,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowPosition,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowSize,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowSize,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowSafeArea,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowAspectRatio,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowAspectRatio,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowBordersSize,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowSizeInPixels,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowMinimumSize,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowMinimumSize,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowMaximumSize,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowMaximumSize,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowBordered,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowResizable,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowAlwaysOnTop,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowFillDocument,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_ShowWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_HideWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_RaiseWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_MaximizeWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_MinimizeWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_RestoreWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowFullscreen,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SyncWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_WindowHasSurface,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowSurface,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowSurfaceVSync,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowSurfaceVSync,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_UpdateWindowSurface,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_UpdateWindowSurfaceRects,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_DestroyWindowSurface,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowKeyboardGrab,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowMouseGrab,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowKeyboardGrab,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowMouseGrab,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetGrabbedWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowMouseRect,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowMouseRect,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowOpacity,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowOpacity,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowParent,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowModal,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowFocusable,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_ShowWindowSystemMenu,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowHitTest,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowShape,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_FlashWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowProgressState,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowProgressState,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_SetWindowProgressValue,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GetWindowProgressValue,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_DestroyWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_ScreenSaverEnabled,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_EnableScreenSaver,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_DisableScreenSaver,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_LoadLibrary,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_GetProcAddress,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_EGL_GetProcAddress,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_UnloadLibrary,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_ExtensionSupported,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_ResetAttributes,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_SetAttribute,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_GetAttribute,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_CreateContext,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_MakeCurrent,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_GetCurrentWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_GetCurrentContext,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_EGL_GetCurrentDisplay,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_EGL_GetCurrentConfig,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_EGL_GetWindowSurface,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_EGL_SetAttributeCallbacks,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_SetSwapInterval,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_GetSwapInterval,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_SwapWindow,
  SDL3.Sys.Bindgen.Video.Unsafe.sDL_GL_DestroyContext,
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
         , "signed int hs_bindgen_5592dffe201a625d (void)"
         , "{"
         , "  return (SDL_GetNumVideoDrivers)();"
         , "}"
         , "char const *hs_bindgen_85f4e358bde66c9a ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GetVideoDriver)(arg1);"
         , "}"
         , "char const *hs_bindgen_63fbce696f1ed5a6 (void)"
         , "{"
         , "  return (SDL_GetCurrentVideoDriver)();"
         , "}"
         , "SDL_SystemTheme hs_bindgen_c80ec935a539ddd8 (void)"
         , "{"
         , "  return (SDL_GetSystemTheme)();"
         , "}"
         , "SDL_DisplayID *hs_bindgen_d0c686e8303409e7 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplays)(arg1);"
         , "}"
         , "SDL_DisplayID hs_bindgen_6b2fa2820b978e45 (void)"
         , "{"
         , "  return (SDL_GetPrimaryDisplay)();"
         , "}"
         , "SDL_PropertiesID hs_bindgen_2811399c7688084b ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayProperties)(arg1);"
         , "}"
         , "char const *hs_bindgen_348f75329e6ce8d9 ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayName)(arg1);"
         , "}"
         , "_Bool hs_bindgen_ef8f0d981192b3f9 ("
         , "  SDL_DisplayID arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayBounds)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_c49b6c7690711e0a ("
         , "  SDL_DisplayID arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayUsableBounds)(arg1, arg2);"
         , "}"
         , "SDL_DisplayOrientation hs_bindgen_57dcd89da18e0a7a ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetNaturalDisplayOrientation)(arg1);"
         , "}"
         , "SDL_DisplayOrientation hs_bindgen_c8c1a7af21e9840d ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCurrentDisplayOrientation)(arg1);"
         , "}"
         , "float hs_bindgen_84541dd84a5f8bf5 ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayContentScale)(arg1);"
         , "}"
         , "SDL_DisplayMode **hs_bindgen_7fcb2edb01c8f735 ("
         , "  SDL_DisplayID arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetFullscreenDisplayModes)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_4d4a115b24dc1a8a ("
         , "  SDL_DisplayID arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  float arg4,"
         , "  _Bool arg5,"
         , "  SDL_DisplayMode *arg6"
         , ")"
         , "{"
         , "  return (SDL_GetClosestFullscreenDisplayMode)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "SDL_DisplayMode const *hs_bindgen_f150e56ed07c3071 ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDesktopDisplayMode)(arg1);"
         , "}"
         , "SDL_DisplayMode const *hs_bindgen_090c1ea46d46ae35 ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCurrentDisplayMode)(arg1);"
         , "}"
         , "SDL_DisplayID hs_bindgen_c4ca0071d547fe4e ("
         , "  SDL_Point const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayForPoint)(arg1);"
         , "}"
         , "SDL_DisplayID hs_bindgen_53772eb32f15250a ("
         , "  SDL_Rect const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayForRect)(arg1);"
         , "}"
         , "SDL_DisplayID hs_bindgen_b5e8747042982325 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayForWindow)(arg1);"
         , "}"
         , "float hs_bindgen_37fb7f14d8ab4245 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowPixelDensity)(arg1);"
         , "}"
         , "float hs_bindgen_f51393abfbd8d0f1 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowDisplayScale)(arg1);"
         , "}"
         , "_Bool hs_bindgen_13b017b8b715b141 ("
         , "  SDL_Window *arg1,"
         , "  SDL_DisplayMode const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowFullscreenMode)(arg1, arg2);"
         , "}"
         , "SDL_DisplayMode const *hs_bindgen_3d833d32498da130 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowFullscreenMode)(arg1);"
         , "}"
         , "void *hs_bindgen_c8fc95a50e802a12 ("
         , "  SDL_Window *arg1,"
         , "  size_t *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetWindowICCProfile)(arg1, arg2);"
         , "}"
         , "SDL_PixelFormat hs_bindgen_90e43d0f5b0c1797 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowPixelFormat)(arg1);"
         , "}"
         , "SDL_Window **hs_bindgen_37819cd7ef5a283c ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindows)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_c104a86e94d91733 ("
         , "  char const *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  SDL_WindowFlags arg4"
         , ")"
         , "{"
         , "  return (SDL_CreateWindow)(arg1, arg2, arg3, arg4);"
         , "}"
         , "SDL_Window *hs_bindgen_f8de823bce00580d ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  signed int arg4,"
         , "  signed int arg5,"
         , "  SDL_WindowFlags arg6"
         , ")"
         , "{"
         , "  return (SDL_CreatePopupWindow)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "SDL_Window *hs_bindgen_397cd16b0ee4c2c1 ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateWindowWithProperties)(arg1);"
         , "}"
         , "SDL_WindowID hs_bindgen_4cd31f508a882913 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowID)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_9a86d1e90d48506e ("
         , "  SDL_WindowID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowFromID)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_de155dd6392c018c ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowParent)(arg1);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_354b9a2ce76470de ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowProperties)(arg1);"
         , "}"
         , "SDL_WindowFlags hs_bindgen_c7a6fd0b395c141b ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowFlags)(arg1);"
         , "}"
         , "_Bool hs_bindgen_fb8782aef9af1e58 ("
         , "  SDL_Window *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowTitle)(arg1, arg2);"
         , "}"
         , "char const *hs_bindgen_b46de7aa720113f3 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowTitle)(arg1);"
         , "}"
         , "_Bool hs_bindgen_dcfd86c373d614de ("
         , "  SDL_Window *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowIcon)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_2778939bf2a03cc0 ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowPosition)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_0dd4bcea36c16a31 ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowPosition)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_057ef11fd12bbeb6 ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_f812f66416921726 ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_212ea87435c7ebb9 ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSafeArea)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_a97676f9d3d5cacb ("
         , "  SDL_Window *arg1,"
         , "  float arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowAspectRatio)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_c4fcb6be51b89962 ("
         , "  SDL_Window *arg1,"
         , "  float *arg2,"
         , "  float *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowAspectRatio)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_fe9fa856ca0ad8ba ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3,"
         , "  signed int *arg4,"
         , "  signed int *arg5"
         , ")"
         , "{"
         , "  return (SDL_GetWindowBordersSize)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_0bdc369c35af7209 ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSizeInPixels)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_4a83221f1efbc09f ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowMinimumSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_9492964d5df1add3 ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowMinimumSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_70ec3985e428bdd2 ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowMaximumSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_948d13442e6065ab ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowMaximumSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_6289af3cb8f93407 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowBordered)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_46aff2e1cb31d53c ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowResizable)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_745fd81846537dd7 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowAlwaysOnTop)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_51036b434b8a9d9a ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SetWindowFillDocument)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_SetWindowFillDocument requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "_Bool hs_bindgen_7fdf198ee1ca7f92 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_ShowWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_2764604bcb0dc3ca ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_HideWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_655550628b940a03 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_RaiseWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_080d71419d89f8ac ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_MaximizeWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_e1f35d0dbc3b4400 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_MinimizeWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_e090b304456b95d1 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_RestoreWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_b1dbd6c7bf42bc68 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowFullscreen)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ce8bade87de24cec ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_SyncWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_60a31e841c25b5c2 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_WindowHasSurface)(arg1);"
         , "}"
         , "SDL_Surface *hs_bindgen_b27ac903c03a4dfa ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSurface)(arg1);"
         , "}"
         , "_Bool hs_bindgen_507572e10b7f7b5d ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowSurfaceVSync)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b6f4ee5ffa664900 ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSurfaceVSync)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_0647ceba715b9468 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_UpdateWindowSurface)(arg1);"
         , "}"
         , "_Bool hs_bindgen_99ad341567ec7dd7 ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_UpdateWindowSurfaceRects)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_7c381c64250e8266 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_DestroyWindowSurface)(arg1);"
         , "}"
         , "_Bool hs_bindgen_088757457073c51d ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowKeyboardGrab)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_fcca3f67a0285f40 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowMouseGrab)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_cda2cd2af79b5ca6 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowKeyboardGrab)(arg1);"
         , "}"
         , "_Bool hs_bindgen_3d8a4df5806b21ff ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowMouseGrab)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_63a195963286004a (void)"
         , "{"
         , "  return (SDL_GetGrabbedWindow)();"
         , "}"
         , "_Bool hs_bindgen_3da85ada2677f1fd ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowMouseRect)(arg1, arg2);"
         , "}"
         , "SDL_Rect const *hs_bindgen_45c2c94bf4760d8a ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowMouseRect)(arg1);"
         , "}"
         , "_Bool hs_bindgen_019c9148c0aa4e8f ("
         , "  SDL_Window *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowOpacity)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_744325d9009c4077 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowOpacity)(arg1);"
         , "}"
         , "_Bool hs_bindgen_effc3e47de752f57 ("
         , "  SDL_Window *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowParent)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_d48e7b0b38e32483 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowModal)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_45029d07ea1d3a4d ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowFocusable)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_839b36668059a297 ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_ShowWindowSystemMenu)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_b4659f0d8b06588e ("
         , "  SDL_Window *arg1,"
         , "  SDL_HitTest arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowHitTest)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_e671b0b9ca790520 ("
         , "  SDL_Window *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowShape)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_631082dd3b92af79 ("
         , "  SDL_Window *arg1,"
         , "  SDL_FlashOperation arg2"
         , ")"
         , "{"
         , "  return (SDL_FlashWindow)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_ProgressState;"
         , "#endif"
         , "_Bool hs_bindgen_24d52be2d578e3a6 ("
         , "  SDL_Window *arg1,"
         , "  SDL_ProgressState arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SetWindowProgressState)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_SetWindowProgressState requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef int SDL_ProgressState;"
         , "#endif"
         , "SDL_ProgressState hs_bindgen_d7a642f9cea765c4 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetWindowProgressState)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_GetWindowProgressState requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_0a7984bb3f923d56 ("
         , "  SDL_Window *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SetWindowProgressValue)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_SetWindowProgressValue requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "float hs_bindgen_936a487daf968843 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetWindowProgressValue)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_GetWindowProgressValue requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "void hs_bindgen_c66377fe72053eef ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_8d4460920f35fe23 (void)"
         , "{"
         , "  return (SDL_ScreenSaverEnabled)();"
         , "}"
         , "_Bool hs_bindgen_b0634b88ba5dac7b (void)"
         , "{"
         , "  return (SDL_EnableScreenSaver)();"
         , "}"
         , "_Bool hs_bindgen_2a05f306113c76cb (void)"
         , "{"
         , "  return (SDL_DisableScreenSaver)();"
         , "}"
         , "_Bool hs_bindgen_80ecb7f912f6a101 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_LoadLibrary)(arg1);"
         , "}"
         , "SDL_FunctionPointer hs_bindgen_45ec5c45b7aeecbc ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_GetProcAddress)(arg1);"
         , "}"
         , "SDL_FunctionPointer hs_bindgen_fecd43d56eba918e ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_EGL_GetProcAddress)(arg1);"
         , "}"
         , "void hs_bindgen_86d08bc666c9f566 (void)"
         , "{"
         , "  (SDL_GL_UnloadLibrary)();"
         , "}"
         , "_Bool hs_bindgen_8c89c426b6cd15de ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_ExtensionSupported)(arg1);"
         , "}"
         , "void hs_bindgen_c0ef2cbb30166af5 (void)"
         , "{"
         , "  (SDL_GL_ResetAttributes)();"
         , "}"
         , "_Bool hs_bindgen_dfea3fa025830d75 ("
         , "  SDL_GLAttr arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_GL_SetAttribute)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b4ec3aa42353470f ("
         , "  SDL_GLAttr arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GL_GetAttribute)(arg1, arg2);"
         , "}"
         , "SDL_GLContext hs_bindgen_02589eafe594e5ce ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_CreateContext)(arg1);"
         , "}"
         , "_Bool hs_bindgen_d986b780d1ccac33 ("
         , "  SDL_Window *arg1,"
         , "  SDL_GLContext arg2"
         , ")"
         , "{"
         , "  return (SDL_GL_MakeCurrent)(arg1, arg2);"
         , "}"
         , "SDL_Window *hs_bindgen_24a0284995e8a74e (void)"
         , "{"
         , "  return (SDL_GL_GetCurrentWindow)();"
         , "}"
         , "SDL_GLContext hs_bindgen_cb9ceaede20b4208 (void)"
         , "{"
         , "  return (SDL_GL_GetCurrentContext)();"
         , "}"
         , "SDL_EGLDisplay hs_bindgen_709f1c4141e36bd4 (void)"
         , "{"
         , "  return (SDL_EGL_GetCurrentDisplay)();"
         , "}"
         , "SDL_EGLConfig hs_bindgen_1a495e63c24b9e1d (void)"
         , "{"
         , "  return (SDL_EGL_GetCurrentConfig)();"
         , "}"
         , "SDL_EGLSurface hs_bindgen_2dc2976e346931c2 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_EGL_GetWindowSurface)(arg1);"
         , "}"
         , "void hs_bindgen_6f6c52b23bae7a50 ("
         , "  SDL_EGLAttribArrayCallback arg1,"
         , "  SDL_EGLIntArrayCallback arg2,"
         , "  SDL_EGLIntArrayCallback arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  (SDL_EGL_SetAttributeCallbacks)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_9fcc7f15d61d9182 ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_SetSwapInterval)(arg1);"
         , "}"
         , "_Bool hs_bindgen_d23bd762103b2805 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_GetSwapInterval)(arg1);"
         , "}"
         , "_Bool hs_bindgen_0142b6de91fcc321 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_SwapWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_efe95fa2c1c2690c ("
         , "  SDL_GLContext arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_DestroyContext)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetNumVideoDrivers@
foreign import ccall unsafe "hs_bindgen_5592dffe201a625d"
  hs_bindgen_5592dffe201a625d_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetNumVideoDrivers@
hs_bindgen_5592dffe201a625d :: IO BG.CInt
hs_bindgen_5592dffe201a625d =
  BG.fromFFIType hs_bindgen_5592dffe201a625d_base

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
sDL_GetNumVideoDrivers :: IO BG.CInt
sDL_GetNumVideoDrivers = hs_bindgen_5592dffe201a625d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetVideoDriver@
foreign import ccall unsafe "hs_bindgen_85f4e358bde66c9a"
  hs_bindgen_85f4e358bde66c9a_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetVideoDriver@
hs_bindgen_85f4e358bde66c9a
  :: BG.CInt
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_85f4e358bde66c9a =
  BG.fromFFIType hs_bindgen_85f4e358bde66c9a_base

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
--     [See also]: 'sDL_GetNumVideoDrivers'
--
--     [C declaration]: @SDL_GetVideoDriver@, defined at @SDL3\/SDL_video.h 585:42@
sDL_GetVideoDriver
  :: BG.CInt
  -- ^
  --
  --           [@index@]: the index of a video driver.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetVideoDriver = hs_bindgen_85f4e358bde66c9a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetCurrentVideoDriver@
foreign import ccall unsafe "hs_bindgen_63fbce696f1ed5a6"
  hs_bindgen_63fbce696f1ed5a6_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetCurrentVideoDriver@
hs_bindgen_63fbce696f1ed5a6 :: IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_63fbce696f1ed5a6 =
  BG.fromFFIType hs_bindgen_63fbce696f1ed5a6_base

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
sDL_GetCurrentVideoDriver :: IO (PtrConst.PtrConst BG.CChar)
sDL_GetCurrentVideoDriver =
  hs_bindgen_63fbce696f1ed5a6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetSystemTheme@
foreign import ccall unsafe "hs_bindgen_c80ec935a539ddd8"
  hs_bindgen_c80ec935a539ddd8_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetSystemTheme@
hs_bindgen_c80ec935a539ddd8 :: IO SDL_SystemTheme
hs_bindgen_c80ec935a539ddd8 =
  BG.fromFFIType hs_bindgen_c80ec935a539ddd8_base

-- | Get the current system theme.
--
--     [Returns]: the current system theme, light, dark, or unknown.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSystemTheme@, defined at @SDL3\/SDL_video.h 615:45@
sDL_GetSystemTheme :: IO SDL_SystemTheme
sDL_GetSystemTheme = hs_bindgen_c80ec935a539ddd8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplays@
foreign import ccall unsafe "hs_bindgen_d0c686e8303409e7"
  hs_bindgen_d0c686e8303409e7_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplays@
hs_bindgen_d0c686e8303409e7
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_DisplayID)
hs_bindgen_d0c686e8303409e7 =
  BG.fromFFIType hs_bindgen_d0c686e8303409e7_base

-- | Get a list of currently connected displays.
--
--     [Returns]: a 0 terminated array of display instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDisplays@, defined at @SDL3\/SDL_video.h 630:45@
sDL_GetDisplays
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of displays returned, may be NULL.
  -> IO (BG.Ptr SDL_DisplayID)
sDL_GetDisplays = hs_bindgen_d0c686e8303409e7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetPrimaryDisplay@
foreign import ccall unsafe "hs_bindgen_6b2fa2820b978e45"
  hs_bindgen_6b2fa2820b978e45_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetPrimaryDisplay@
hs_bindgen_6b2fa2820b978e45 :: IO SDL_DisplayID
hs_bindgen_6b2fa2820b978e45 =
  BG.fromFFIType hs_bindgen_6b2fa2820b978e45_base

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
sDL_GetPrimaryDisplay :: IO SDL_DisplayID
sDL_GetPrimaryDisplay = hs_bindgen_6b2fa2820b978e45

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayProperties@
foreign import ccall unsafe "hs_bindgen_2811399c7688084b"
  hs_bindgen_2811399c7688084b_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayProperties@
hs_bindgen_2811399c7688084b
  :: SDL_DisplayID
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_2811399c7688084b =
  BG.fromFFIType hs_bindgen_2811399c7688084b_base

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
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDisplayProperties@, defined at @SDL3\/SDL_video.h 682:46@
sDL_GetDisplayProperties
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetDisplayProperties =
  hs_bindgen_2811399c7688084b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayName@
foreign import ccall unsafe "hs_bindgen_348f75329e6ce8d9"
  hs_bindgen_348f75329e6ce8d9_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayName@
hs_bindgen_348f75329e6ce8d9
  :: SDL_DisplayID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_348f75329e6ce8d9 =
  BG.fromFFIType hs_bindgen_348f75329e6ce8d9_base

-- | Get the name of a display in UTF-8 encoding.
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
sDL_GetDisplayName
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetDisplayName = hs_bindgen_348f75329e6ce8d9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayBounds@
foreign import ccall unsafe "hs_bindgen_ef8f0d981192b3f9"
  hs_bindgen_ef8f0d981192b3f9_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayBounds@
hs_bindgen_ef8f0d981192b3f9
  :: SDL_DisplayID
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_ef8f0d981192b3f9 =
  BG.fromFFIType hs_bindgen_ef8f0d981192b3f9_base

-- | Get the desktop area represented by a display.
--
--     The primary display is often located at (0,0), but may be placed at a different location depending on monitor layout.
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
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure filled in with the display bounds.
  -> IO BG.CBool
sDL_GetDisplayBounds = hs_bindgen_ef8f0d981192b3f9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayUsableBounds@
foreign import ccall unsafe "hs_bindgen_c49b6c7690711e0a"
  hs_bindgen_c49b6c7690711e0a_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayUsableBounds@
hs_bindgen_c49b6c7690711e0a
  :: SDL_DisplayID
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_c49b6c7690711e0a =
  BG.fromFFIType hs_bindgen_c49b6c7690711e0a_base

-- | Get the usable desktop area represented by a display, in screen coordinates.
--
--     This is the same area as @SDL_GetDisplayBounds()@ reports, but with portions reserved by the system removed. For example, on Apple\'s macOS, this subtracts the area occupied by the menu bar and dock.
--
--     Setting a window to be fullscreen generally bypasses these unusable areas, so these are good guidelines for the maximum space available to a non-fullscreen window.
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
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect structure filled in with the display bounds.
  -> IO BG.CBool
sDL_GetDisplayUsableBounds =
  hs_bindgen_c49b6c7690711e0a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetNaturalDisplayOrientation@
foreign import ccall unsafe "hs_bindgen_57dcd89da18e0a7a"
  hs_bindgen_57dcd89da18e0a7a_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetNaturalDisplayOrientation@
hs_bindgen_57dcd89da18e0a7a
  :: SDL_DisplayID
  -> IO SDL_DisplayOrientation
hs_bindgen_57dcd89da18e0a7a =
  BG.fromFFIType hs_bindgen_57dcd89da18e0a7a_base

-- | Get the orientation of a display when it is unrotated.
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
sDL_GetNaturalDisplayOrientation
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO SDL_DisplayOrientation
sDL_GetNaturalDisplayOrientation =
  hs_bindgen_57dcd89da18e0a7a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetCurrentDisplayOrientation@
foreign import ccall unsafe "hs_bindgen_c8c1a7af21e9840d"
  hs_bindgen_c8c1a7af21e9840d_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetCurrentDisplayOrientation@
hs_bindgen_c8c1a7af21e9840d
  :: SDL_DisplayID
  -> IO SDL_DisplayOrientation
hs_bindgen_c8c1a7af21e9840d =
  BG.fromFFIType hs_bindgen_c8c1a7af21e9840d_base

-- | Get the orientation of a display.
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
sDL_GetCurrentDisplayOrientation
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO SDL_DisplayOrientation
sDL_GetCurrentDisplayOrientation =
  hs_bindgen_c8c1a7af21e9840d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayContentScale@
foreign import ccall unsafe "hs_bindgen_84541dd84a5f8bf5"
  hs_bindgen_84541dd84a5f8bf5_base
    :: BG.Word32
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayContentScale@
hs_bindgen_84541dd84a5f8bf5
  :: SDL_DisplayID
  -> IO BG.CFloat
hs_bindgen_84541dd84a5f8bf5 =
  BG.fromFFIType hs_bindgen_84541dd84a5f8bf5_base

-- | Get the content scale of a display.
--
--     The content scale is the expected scale for content based on the DPI settings of the display. For example, a 4K display might have a 2.0 (200%) display scale, which means that the user expects UI elements to be twice as big on this display, to aid in readability.
--
--     After window creation, @SDL_GetWindowDisplayScale()@ should be used to query the content scale factor for individual windows instead of querying the display for a window and calling this function, as the per-window content scale factor may differ from the base value of the display it is on, particularly on high-DPI and\/or multi-monitor desktop configurations.
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
sDL_GetDisplayContentScale
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO BG.CFloat
sDL_GetDisplayContentScale =
  hs_bindgen_84541dd84a5f8bf5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetFullscreenDisplayModes@
foreign import ccall unsafe "hs_bindgen_7fcb2edb01c8f735"
  hs_bindgen_7fcb2edb01c8f735_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetFullscreenDisplayModes@
hs_bindgen_7fcb2edb01c8f735
  :: SDL_DisplayID
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr SDL_DisplayMode))
hs_bindgen_7fcb2edb01c8f735 =
  BG.fromFFIType hs_bindgen_7fcb2edb01c8f735_base

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
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of display modes returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_DisplayMode))
sDL_GetFullscreenDisplayModes =
  hs_bindgen_7fcb2edb01c8f735

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetClosestFullscreenDisplayMode@
foreign import ccall unsafe "hs_bindgen_4d4a115b24dc1a8a"
  hs_bindgen_4d4a115b24dc1a8a_base
    :: BG.Word32
    -> BG.Int32
    -> BG.Int32
    -> Float
    -> BG.Word8
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetClosestFullscreenDisplayMode@
hs_bindgen_4d4a115b24dc1a8a
  :: SDL_DisplayID
  -> BG.CInt
  -> BG.CInt
  -> BG.CFloat
  -> BG.CBool
  -> BG.Ptr SDL_DisplayMode
  -> IO BG.CBool
hs_bindgen_4d4a115b24dc1a8a =
  BG.fromFFIType hs_bindgen_4d4a115b24dc1a8a_base

-- | Get the closest match to the requested display mode.
--
--     The available display modes are scanned and @closest@ is filled in with the closest mode matching the requested mode and returned. The mode format and refresh rate default to the desktop mode if they are set to 0. The modes are scanned with size being first priority, format being second priority, and finally checking the refresh rate. If all the available modes are too small, then false is returned.
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
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> BG.CInt
  -- ^
  --
  --           [@w@]: the width in pixels of the desired display mode.
  -> BG.CInt
  -- ^
  --
  --           [@h@]: the height in pixels of the desired display mode.
  -> BG.CFloat
  -- ^
  --
  --           [@refresh_rate@]: the refresh rate of the desired display mode, or 0.0f for the desktop refresh rate.
  -> BG.CBool
  -- ^
  --
  --           [@include_high_density_modes@]: boolean to include high density modes in the search.
  -> BG.Ptr SDL_DisplayMode
  -- ^
  --
  --           [@closest@]: a pointer filled in with the closest display mode equal to or larger than the desired mode.
  -> IO BG.CBool
sDL_GetClosestFullscreenDisplayMode =
  hs_bindgen_4d4a115b24dc1a8a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDesktopDisplayMode@
foreign import ccall unsafe "hs_bindgen_f150e56ed07c3071"
  hs_bindgen_f150e56ed07c3071_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDesktopDisplayMode@
hs_bindgen_f150e56ed07c3071
  :: SDL_DisplayID
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
hs_bindgen_f150e56ed07c3071 =
  BG.fromFFIType hs_bindgen_f150e56ed07c3071_base

-- | Get information about the desktop\'s display mode.
--
--     There\'s a difference between this function and @SDL_GetCurrentDisplayMode()@ when SDL runs fullscreen and has changed the resolution. In that case this function will return the previous native display mode, and not the current display mode.
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
sDL_GetDesktopDisplayMode
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
sDL_GetDesktopDisplayMode =
  hs_bindgen_f150e56ed07c3071

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetCurrentDisplayMode@
foreign import ccall unsafe "hs_bindgen_090c1ea46d46ae35"
  hs_bindgen_090c1ea46d46ae35_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetCurrentDisplayMode@
hs_bindgen_090c1ea46d46ae35
  :: SDL_DisplayID
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
hs_bindgen_090c1ea46d46ae35 =
  BG.fromFFIType hs_bindgen_090c1ea46d46ae35_base

-- | Get information about the current display mode.
--
--     There\'s a difference between this function and @SDL_GetDesktopDisplayMode()@ when SDL runs fullscreen and has changed the resolution. In that case this function will return the current display mode, and not the previous native display mode.
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
sDL_GetCurrentDisplayMode
  :: SDL_DisplayID
  -- ^
  --
  --           [@displayID@]: the instance ID of the display to query.
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
sDL_GetCurrentDisplayMode =
  hs_bindgen_090c1ea46d46ae35

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayForPoint@
foreign import ccall unsafe "hs_bindgen_c4ca0071d547fe4e"
  hs_bindgen_c4ca0071d547fe4e_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayForPoint@
hs_bindgen_c4ca0071d547fe4e
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point
  -> IO SDL_DisplayID
hs_bindgen_c4ca0071d547fe4e =
  BG.fromFFIType hs_bindgen_c4ca0071d547fe4e_base

-- | Get the display containing a point.
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
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point
  -- ^
  --
  --           [@point@]: the point to query.
  -> IO SDL_DisplayID
sDL_GetDisplayForPoint = hs_bindgen_c4ca0071d547fe4e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayForRect@
foreign import ccall unsafe "hs_bindgen_53772eb32f15250a"
  hs_bindgen_53772eb32f15250a_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayForRect@
hs_bindgen_53772eb32f15250a
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO SDL_DisplayID
hs_bindgen_53772eb32f15250a =
  BG.fromFFIType hs_bindgen_53772eb32f15250a_base

-- | Get the display primarily containing a rect.
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
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the rect to query.
  -> IO SDL_DisplayID
sDL_GetDisplayForRect = hs_bindgen_53772eb32f15250a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayForWindow@
foreign import ccall unsafe "hs_bindgen_b5e8747042982325"
  hs_bindgen_b5e8747042982325_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetDisplayForWindow@
hs_bindgen_b5e8747042982325
  :: BG.Ptr SDL_Window
  -> IO SDL_DisplayID
hs_bindgen_b5e8747042982325 =
  BG.fromFFIType hs_bindgen_b5e8747042982325_base

-- | Get the display associated with a window.
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
sDL_GetDisplayForWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_DisplayID
sDL_GetDisplayForWindow = hs_bindgen_b5e8747042982325

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowPixelDensity@
foreign import ccall unsafe "hs_bindgen_37fb7f14d8ab4245"
  hs_bindgen_37fb7f14d8ab4245_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowPixelDensity@
hs_bindgen_37fb7f14d8ab4245
  :: BG.Ptr SDL_Window
  -> IO BG.CFloat
hs_bindgen_37fb7f14d8ab4245 =
  BG.fromFFIType hs_bindgen_37fb7f14d8ab4245_base

-- | Get the pixel density of a window.
--
--     This is a ratio of pixel size to window size. For example, if the window is 1920x1080 and it has a high density back buffer of 3840x2160 pixels, it would have a pixel density of 2.0.
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
sDL_GetWindowPixelDensity
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO BG.CFloat
sDL_GetWindowPixelDensity =
  hs_bindgen_37fb7f14d8ab4245

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowDisplayScale@
foreign import ccall unsafe "hs_bindgen_f51393abfbd8d0f1"
  hs_bindgen_f51393abfbd8d0f1_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowDisplayScale@
hs_bindgen_f51393abfbd8d0f1
  :: BG.Ptr SDL_Window
  -> IO BG.CFloat
hs_bindgen_f51393abfbd8d0f1 =
  BG.fromFFIType hs_bindgen_f51393abfbd8d0f1_base

-- | Get the content display scale relative to a window\'s pixel size.
--
--     This is a combination of the window pixel density and the display content scale, and is the expected scale for displaying content in this window. For example, if a 3840x2160 window had a display scale of 2.0, the user expects the content to take twice as many pixels and be the same physical size as if it were being displayed in a 1920x1080 window with a display scale of 1.0.
--
--     Conceptually this value corresponds to the scale display setting, and is updated when that setting is changed, or the window moves to a display with a different scale setting.
--
--     [Returns]: the display scale, or 0.0f on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowDisplayScale@, defined at @SDL3\/SDL_video.h 999:35@
sDL_GetWindowDisplayScale
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO BG.CFloat
sDL_GetWindowDisplayScale =
  hs_bindgen_f51393abfbd8d0f1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowFullscreenMode@
foreign import ccall unsafe "hs_bindgen_13b017b8b715b141"
  hs_bindgen_13b017b8b715b141_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowFullscreenMode@
hs_bindgen_13b017b8b715b141
  :: BG.Ptr SDL_Window
  -> PtrConst.PtrConst SDL_DisplayMode
  -> IO BG.CBool
hs_bindgen_13b017b8b715b141 =
  BG.fromFFIType hs_bindgen_13b017b8b715b141_base

-- | Set the display mode to use when a window is visible and fullscreen.
--
--     This only affects the display mode used when the window is fullscreen. To change the window size when the window is not fullscreen, use @SDL_SetWindowSize()@.
--
--     If the window is currently in the fullscreen state, this request is asynchronous on some windowing systems and the new mode dimensions may not be applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the new mode takes effect, an SDL_EVENT_WINDOW_RESIZED and\/or an SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED event will be emitted with the new mode dimensions.
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
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to affect.
  -> PtrConst.PtrConst SDL_DisplayMode
  -- ^
  --
  --           [@mode@]: a pointer to the display mode to use, which can be NULL for borderless fullscreen desktop mode, or one of the fullscreen modes returned by @SDL_GetFullscreenDisplayModes()@ to set an exclusive fullscreen mode.
  -> IO BG.CBool
sDL_SetWindowFullscreenMode =
  hs_bindgen_13b017b8b715b141

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowFullscreenMode@
foreign import ccall unsafe "hs_bindgen_3d833d32498da130"
  hs_bindgen_3d833d32498da130_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowFullscreenMode@
hs_bindgen_3d833d32498da130
  :: BG.Ptr SDL_Window
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
hs_bindgen_3d833d32498da130 =
  BG.fromFFIType hs_bindgen_3d833d32498da130_base

-- | Query the display mode to use when a window is visible at fullscreen.
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
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
sDL_GetWindowFullscreenMode =
  hs_bindgen_3d833d32498da130

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowICCProfile@
foreign import ccall unsafe "hs_bindgen_c8fc95a50e802a12"
  hs_bindgen_c8fc95a50e802a12_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowICCProfile@
hs_bindgen_c8fc95a50e802a12
  :: BG.Ptr SDL_Window
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.Void)
hs_bindgen_c8fc95a50e802a12 =
  BG.fromFFIType hs_bindgen_c8fc95a50e802a12_base

-- | Get the raw ICC profile data for the screen the window is currently on.
--
--     [Returns]: the raw ICC profile data on success or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowICCProfile@, defined at @SDL3\/SDL_video.h 1065:36@
sDL_GetWindowICCProfile
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the size of the ICC profile.
  -> IO (BG.Ptr BG.Void)
sDL_GetWindowICCProfile = hs_bindgen_c8fc95a50e802a12

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowPixelFormat@
foreign import ccall unsafe "hs_bindgen_90e43d0f5b0c1797"
  hs_bindgen_90e43d0f5b0c1797_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowPixelFormat@
hs_bindgen_90e43d0f5b0c1797
  :: BG.Ptr SDL_Window
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
hs_bindgen_90e43d0f5b0c1797 =
  BG.fromFFIType hs_bindgen_90e43d0f5b0c1797_base

-- | Get the pixel format associated with the window.
--
--     [Returns]: the pixel format of the window on success or SDL_PIXELFORMAT_UNKNOWN on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowPixelFormat@, defined at @SDL3\/SDL_video.h 1079:45@
sDL_GetWindowPixelFormat
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
sDL_GetWindowPixelFormat =
  hs_bindgen_90e43d0f5b0c1797

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindows@
foreign import ccall unsafe "hs_bindgen_37819cd7ef5a283c"
  hs_bindgen_37819cd7ef5a283c_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindows@
hs_bindgen_37819cd7ef5a283c
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr SDL_Window))
hs_bindgen_37819cd7ef5a283c =
  BG.fromFFIType hs_bindgen_37819cd7ef5a283c_base

-- | Get a list of valid windows.
--
--     [Returns]: a NULL terminated array of 'SDL_Window' pointers or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindows@, defined at @SDL3\/SDL_video.h 1095:43@
sDL_GetWindows
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of windows returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Window))
sDL_GetWindows = hs_bindgen_37819cd7ef5a283c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_CreateWindow@
foreign import ccall unsafe "hs_bindgen_c104a86e94d91733"
  hs_bindgen_c104a86e94d91733_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_CreateWindow@
hs_bindgen_c104a86e94d91733
  :: PtrConst.PtrConst BG.CChar
  -> BG.CInt
  -> BG.CInt
  -> SDL_WindowFlags
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_c104a86e94d91733 =
  BG.fromFFIType hs_bindgen_c104a86e94d91733_base

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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: the title of the window, in UTF-8 encoding.
  -> BG.CInt
  -- ^
  --
  --           [@w@]: the width of the window.
  -> BG.CInt
  -- ^
  --
  --           [@h@]: the height of the window.
  -> SDL_WindowFlags
  -- ^
  --
  --           [@flags@]: 0, or one or more 'SDL_WindowFlags' OR\'d together.
  -> IO (BG.Ptr SDL_Window)
sDL_CreateWindow = hs_bindgen_c104a86e94d91733

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_CreatePopupWindow@
foreign import ccall unsafe "hs_bindgen_f8de823bce00580d"
  hs_bindgen_f8de823bce00580d_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_CreatePopupWindow@
hs_bindgen_f8de823bce00580d
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> SDL_WindowFlags
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_f8de823bce00580d =
  BG.fromFFIType hs_bindgen_f8de823bce00580d_base

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
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@parent@]: the parent of the window, must not be NULL.
  -> BG.CInt
  -- ^
  --
  --           [@offset_x@]: the x position of the popup window relative to the origin of the parent.
  -> BG.CInt
  -- ^
  --
  --           [@offset_y@]: the y position of the popup window relative to the origin of the parent window.
  -> BG.CInt
  -- ^
  --
  --           [@w@]: the width of the window.
  -> BG.CInt
  -- ^
  --
  --           [@h@]: the height of the window.
  -> SDL_WindowFlags
  -- ^
  --
  --           [@flags@]: SDL_WINDOW_TOOLTIP or SDL_WINDOW_POPUP_MENU, and zero or more additional 'SDL_WindowFlags' OR\'d together.
  -> IO (BG.Ptr SDL_Window)
sDL_CreatePopupWindow = hs_bindgen_f8de823bce00580d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_CreateWindowWithProperties@
foreign import ccall unsafe "hs_bindgen_397cd16b0ee4c2c1"
  hs_bindgen_397cd16b0ee4c2c1_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_CreateWindowWithProperties@
hs_bindgen_397cd16b0ee4c2c1
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_397cd16b0ee4c2c1 =
  BG.fromFFIType hs_bindgen_397cd16b0ee4c2c1_base

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
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Window)
sDL_CreateWindowWithProperties =
  hs_bindgen_397cd16b0ee4c2c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowID@
foreign import ccall unsafe "hs_bindgen_4cd31f508a882913"
  hs_bindgen_4cd31f508a882913_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowID@
hs_bindgen_4cd31f508a882913
  :: BG.Ptr SDL_Window
  -> IO SDL_WindowID
hs_bindgen_4cd31f508a882913 =
  BG.fromFFIType hs_bindgen_4cd31f508a882913_base

-- | Get the numeric ID of a window.
--
--     The numeric ID is what SDL_WindowEvent references, and is necessary to map these events to specific 'SDL_Window' objects.
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
sDL_GetWindowID
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_WindowID
sDL_GetWindowID = hs_bindgen_4cd31f508a882913

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowFromID@
foreign import ccall unsafe "hs_bindgen_9a86d1e90d48506e"
  hs_bindgen_9a86d1e90d48506e_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowFromID@
hs_bindgen_9a86d1e90d48506e
  :: SDL_WindowID
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_9a86d1e90d48506e =
  BG.fromFFIType hs_bindgen_9a86d1e90d48506e_base

-- | Get a window from a stored ID.
--
--     The numeric ID is what SDL_WindowEvent references, and is necessary to map these events to specific 'SDL_Window' objects.
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
sDL_GetWindowFromID
  :: SDL_WindowID
  -- ^
  --
  --           [@id@]: the ID of the window.
  -> IO (BG.Ptr SDL_Window)
sDL_GetWindowFromID = hs_bindgen_9a86d1e90d48506e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowParent@
foreign import ccall unsafe "hs_bindgen_de155dd6392c018c"
  hs_bindgen_de155dd6392c018c_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowParent@
hs_bindgen_de155dd6392c018c
  :: BG.Ptr SDL_Window
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_de155dd6392c018c =
  BG.fromFFIType hs_bindgen_de155dd6392c018c_base

-- | Get parent of a window.
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
sDL_GetWindowParent
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (BG.Ptr SDL_Window)
sDL_GetWindowParent = hs_bindgen_de155dd6392c018c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowProperties@
foreign import ccall unsafe "hs_bindgen_354b9a2ce76470de"
  hs_bindgen_354b9a2ce76470de_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowProperties@
hs_bindgen_354b9a2ce76470de
  :: BG.Ptr SDL_Window
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_354b9a2ce76470de =
  BG.fromFFIType hs_bindgen_354b9a2ce76470de_base

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
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowProperties@, defined at @SDL3\/SDL_video.h 1628:46@
sDL_GetWindowProperties
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetWindowProperties = hs_bindgen_354b9a2ce76470de

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowFlags@
foreign import ccall unsafe "hs_bindgen_c7a6fd0b395c141b"
  hs_bindgen_c7a6fd0b395c141b_base
    :: BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowFlags@
hs_bindgen_c7a6fd0b395c141b
  :: BG.Ptr SDL_Window
  -> IO SDL_WindowFlags
hs_bindgen_c7a6fd0b395c141b =
  BG.fromFFIType hs_bindgen_c7a6fd0b395c141b_base

-- | Get the window flags.
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
sDL_GetWindowFlags
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_WindowFlags
sDL_GetWindowFlags = hs_bindgen_c7a6fd0b395c141b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowTitle@
foreign import ccall unsafe "hs_bindgen_fb8782aef9af1e58"
  hs_bindgen_fb8782aef9af1e58_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowTitle@
hs_bindgen_fb8782aef9af1e58
  :: BG.Ptr SDL_Window
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_fb8782aef9af1e58 =
  BG.fromFFIType hs_bindgen_fb8782aef9af1e58_base

-- | Set the title of a window.
--
--     This string is expected to be in UTF-8 encoding.
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
sDL_SetWindowTitle
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: the desired window title in UTF-8 format.
  -> IO BG.CBool
sDL_SetWindowTitle = hs_bindgen_fb8782aef9af1e58

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowTitle@
foreign import ccall unsafe "hs_bindgen_b46de7aa720113f3"
  hs_bindgen_b46de7aa720113f3_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowTitle@
hs_bindgen_b46de7aa720113f3
  :: BG.Ptr SDL_Window
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_b46de7aa720113f3 =
  BG.fromFFIType hs_bindgen_b46de7aa720113f3_base

-- | Get the title of a window.
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
sDL_GetWindowTitle
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetWindowTitle = hs_bindgen_b46de7aa720113f3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowIcon@
foreign import ccall unsafe "hs_bindgen_dcfd86c373d614de"
  hs_bindgen_dcfd86c373d614de_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowIcon@
hs_bindgen_dcfd86c373d614de
  :: BG.Ptr SDL_Window
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO BG.CBool
hs_bindgen_dcfd86c373d614de =
  BG.fromFFIType hs_bindgen_dcfd86c373d614de_base

-- | Set the icon for a window.
--
--     If this function is passed a surface with alternate representations added using SDL_AddSurfaceAlternateImage(), the surface will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations. For example, if the original surface is 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
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
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@icon@]: an SDL_Surface structure containing the icon for the window.
  -> IO BG.CBool
sDL_SetWindowIcon = hs_bindgen_dcfd86c373d614de

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowPosition@
foreign import ccall unsafe "hs_bindgen_2778939bf2a03cc0"
  hs_bindgen_2778939bf2a03cc0_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowPosition@
hs_bindgen_2778939bf2a03cc0
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_2778939bf2a03cc0 =
  BG.fromFFIType hs_bindgen_2778939bf2a03cc0_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowPosition', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_SetWindowPosition@, defined at @SDL3\/SDL_video.h 1788:34@
sDL_SetWindowPosition
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to reposition.
  -> BG.CInt
  -- ^
  --
  --           [@x@]: the x coordinate of the window, or @'sDL_WINDOWPOS_CENTERED'@ or @'sDL_WINDOWPOS_UNDEFINED'@.
  -> BG.CInt
  -- ^
  --
  --           [@y@]: the y coordinate of the window, or @'sDL_WINDOWPOS_CENTERED'@ or @'sDL_WINDOWPOS_UNDEFINED'@.
  -> IO BG.CBool
sDL_SetWindowPosition = hs_bindgen_2778939bf2a03cc0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowPosition@
foreign import ccall unsafe "hs_bindgen_0dd4bcea36c16a31"
  hs_bindgen_0dd4bcea36c16a31_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowPosition@
hs_bindgen_0dd4bcea36c16a31
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_0dd4bcea36c16a31 =
  BG.fromFFIType hs_bindgen_0dd4bcea36c16a31_base

-- | Get the position of a window.
--
--     This is the current position of the window as last reported by the windowing system.
--
--     If you do not need the value for one of the positions a NULL may be passed in the @x@ or @y@ parameter.
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
  -> IO BG.CBool
sDL_GetWindowPosition = hs_bindgen_0dd4bcea36c16a31

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowSize@
foreign import ccall unsafe "hs_bindgen_057ef11fd12bbeb6"
  hs_bindgen_057ef11fd12bbeb6_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowSize@
hs_bindgen_057ef11fd12bbeb6
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_057ef11fd12bbeb6 =
  BG.fromFFIType hs_bindgen_057ef11fd12bbeb6_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowSize', 'sDL_SetWindowFullscreenMode', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_SetWindowSize@, defined at @SDL3\/SDL_video.h 1850:34@
sDL_SetWindowSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.CInt
  -- ^
  --
  --           [@w@]: the width of the window, must be > 0.
  -> BG.CInt
  -- ^
  --
  --           [@h@]: the height of the window, must be > 0.
  -> IO BG.CBool
sDL_SetWindowSize = hs_bindgen_057ef11fd12bbeb6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSize@
foreign import ccall unsafe "hs_bindgen_f812f66416921726"
  hs_bindgen_f812f66416921726_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSize@
hs_bindgen_f812f66416921726
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_f812f66416921726 =
  BG.fromFFIType hs_bindgen_f812f66416921726_base

-- | Get the size of a window\'s client area.
--
--     The window pixel size may differ from its window coordinate size if the window is on a high pixel density display. Use @SDL_GetWindowSizeInPixels()@ or SDL_GetRenderOutputSize() to get the real client area size in pixels.
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
  -> IO BG.CBool
sDL_GetWindowSize = hs_bindgen_f812f66416921726

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSafeArea@
foreign import ccall unsafe "hs_bindgen_212ea87435c7ebb9"
  hs_bindgen_212ea87435c7ebb9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSafeArea@
hs_bindgen_212ea87435c7ebb9
  :: BG.Ptr SDL_Window
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_212ea87435c7ebb9 =
  BG.fromFFIType hs_bindgen_212ea87435c7ebb9_base

-- | Get the safe area for this window.
--
--     Some devices have portions of the screen which are partially obscured or not interactive, possibly due to on-screen controls, curved edges, camera notches, TV overscan, etc. This function provides the area of the window which is safe to have interactable content. You should continue rendering into the rest of the window, but it should not contain visually important or interactable content.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetWindowSafeArea@, defined at @SDL3\/SDL_video.h 1896:34@
sDL_GetWindowSafeArea
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer filled in with the client area that is safe for interactive content.
  -> IO BG.CBool
sDL_GetWindowSafeArea = hs_bindgen_212ea87435c7ebb9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowAspectRatio@
foreign import ccall unsafe "hs_bindgen_a97676f9d3d5cacb"
  hs_bindgen_a97676f9d3d5cacb_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowAspectRatio@
hs_bindgen_a97676f9d3d5cacb
  :: BG.Ptr SDL_Window
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_a97676f9d3d5cacb =
  BG.fromFFIType hs_bindgen_a97676f9d3d5cacb_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowAspectRatio', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_SetWindowAspectRatio@, defined at @SDL3\/SDL_video.h 1937:34@
sDL_SetWindowAspectRatio
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.CFloat
  -- ^
  --
  --           [@min_aspect@]: the minimum aspect ratio of the window, or 0.0f for no limit.
  -> BG.CFloat
  -- ^
  --
  --           [@max_aspect@]: the maximum aspect ratio of the window, or 0.0f for no limit.
  -> IO BG.CBool
sDL_SetWindowAspectRatio =
  hs_bindgen_a97676f9d3d5cacb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowAspectRatio@
foreign import ccall unsafe "hs_bindgen_c4fcb6be51b89962"
  hs_bindgen_c4fcb6be51b89962_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowAspectRatio@
hs_bindgen_c4fcb6be51b89962
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_c4fcb6be51b89962 =
  BG.fromFFIType hs_bindgen_c4fcb6be51b89962_base

-- | Get the aspect ratio of a window\'s client area.
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
  -> IO BG.CBool
sDL_GetWindowAspectRatio =
  hs_bindgen_c4fcb6be51b89962

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowBordersSize@
foreign import ccall unsafe "hs_bindgen_fe9fa856ca0ad8ba"
  hs_bindgen_fe9fa856ca0ad8ba_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowBordersSize@
hs_bindgen_fe9fa856ca0ad8ba
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_fe9fa856ca0ad8ba =
  BG.fromFFIType hs_bindgen_fe9fa856ca0ad8ba_base

-- | Get the size of a window\'s borders (decorations) around the client area.
--
--     Note: If this function fails (returns false), the size values will be initialized to 0, 0, 0, 0 (if a non-NULL pointer is provided), as if the window in question was borderless.
--
--     Note: This function may fail on systems where the window has not yet been decorated by the display server (for example, immediately after calling SDL_CreateWindow). It is recommended that you wait at least until the window has been presented and composited, so that the window system has a chance to decorate the window and provide the border dimensions to SDL.
--
--     This function also returns false if getting the information is not supported.
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
  -> IO BG.CBool
sDL_GetWindowBordersSize =
  hs_bindgen_fe9fa856ca0ad8ba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSizeInPixels@
foreign import ccall unsafe "hs_bindgen_0bdc369c35af7209"
  hs_bindgen_0bdc369c35af7209_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSizeInPixels@
hs_bindgen_0bdc369c35af7209
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_0bdc369c35af7209 =
  BG.fromFFIType hs_bindgen_0bdc369c35af7209_base

-- | Get the size of a window\'s client area, in pixels.
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
  -> IO BG.CBool
sDL_GetWindowSizeInPixels =
  hs_bindgen_0bdc369c35af7209

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowMinimumSize@
foreign import ccall unsafe "hs_bindgen_4a83221f1efbc09f"
  hs_bindgen_4a83221f1efbc09f_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowMinimumSize@
hs_bindgen_4a83221f1efbc09f
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_4a83221f1efbc09f =
  BG.fromFFIType hs_bindgen_4a83221f1efbc09f_base

-- | Set the minimum size of a window\'s client area.
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
sDL_SetWindowMinimumSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.CInt
  -- ^
  --
  --           [@min_w@]: the minimum width of the window, or 0 for no limit.
  -> BG.CInt
  -- ^
  --
  --           [@min_h@]: the minimum height of the window, or 0 for no limit.
  -> IO BG.CBool
sDL_SetWindowMinimumSize =
  hs_bindgen_4a83221f1efbc09f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowMinimumSize@
foreign import ccall unsafe "hs_bindgen_9492964d5df1add3"
  hs_bindgen_9492964d5df1add3_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowMinimumSize@
hs_bindgen_9492964d5df1add3
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_9492964d5df1add3 =
  BG.fromFFIType hs_bindgen_9492964d5df1add3_base

-- | Get the minimum size of a window\'s client area.
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
  -> IO BG.CBool
sDL_GetWindowMinimumSize =
  hs_bindgen_9492964d5df1add3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowMaximumSize@
foreign import ccall unsafe "hs_bindgen_70ec3985e428bdd2"
  hs_bindgen_70ec3985e428bdd2_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowMaximumSize@
hs_bindgen_70ec3985e428bdd2
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_70ec3985e428bdd2 =
  BG.fromFFIType hs_bindgen_70ec3985e428bdd2_base

-- | Set the maximum size of a window\'s client area.
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
sDL_SetWindowMaximumSize
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.CInt
  -- ^
  --
  --           [@max_w@]: the maximum width of the window, or 0 for no limit.
  -> BG.CInt
  -- ^
  --
  --           [@max_h@]: the maximum height of the window, or 0 for no limit.
  -> IO BG.CBool
sDL_SetWindowMaximumSize =
  hs_bindgen_70ec3985e428bdd2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowMaximumSize@
foreign import ccall unsafe "hs_bindgen_948d13442e6065ab"
  hs_bindgen_948d13442e6065ab_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowMaximumSize@
hs_bindgen_948d13442e6065ab
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_948d13442e6065ab =
  BG.fromFFIType hs_bindgen_948d13442e6065ab_base

-- | Get the maximum size of a window\'s client area.
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
  -> IO BG.CBool
sDL_GetWindowMaximumSize =
  hs_bindgen_948d13442e6065ab

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowBordered@
foreign import ccall unsafe "hs_bindgen_6289af3cb8f93407"
  hs_bindgen_6289af3cb8f93407_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowBordered@
hs_bindgen_6289af3cb8f93407
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_6289af3cb8f93407 =
  BG.fromFFIType hs_bindgen_6289af3cb8f93407_base

-- | Set the border state of a window.
--
--     This will add or remove the window\'s @SDL_WINDOW_BORDERLESS@ flag and add or remove the border from the actual window. This is a no-op if the window\'s border already matches the requested state.
--
--     You can\'t change the border state of a fullscreen window.
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
sDL_SetWindowBordered
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the border state.
  -> BG.CBool
  -- ^
  --
  --           [@bordered@]: false to remove border, true to add border.
  -> IO BG.CBool
sDL_SetWindowBordered = hs_bindgen_6289af3cb8f93407

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowResizable@
foreign import ccall unsafe "hs_bindgen_46aff2e1cb31d53c"
  hs_bindgen_46aff2e1cb31d53c_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowResizable@
hs_bindgen_46aff2e1cb31d53c
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_46aff2e1cb31d53c =
  BG.fromFFIType hs_bindgen_46aff2e1cb31d53c_base

-- | Set the user-resizable state of a window.
--
--     This will add or remove the window\'s @SDL_WINDOW_RESIZABLE@ flag and allow\/disallow user resizing of the window. This is a no-op if the window\'s resizable state already matches the requested state.
--
--     You can\'t change the resizable state of a fullscreen window.
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
sDL_SetWindowResizable
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the resizable state.
  -> BG.CBool
  -- ^
  --
  --           [@resizable@]: true to allow resizing, false to disallow.
  -> IO BG.CBool
sDL_SetWindowResizable = hs_bindgen_46aff2e1cb31d53c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowAlwaysOnTop@
foreign import ccall unsafe "hs_bindgen_745fd81846537dd7"
  hs_bindgen_745fd81846537dd7_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowAlwaysOnTop@
hs_bindgen_745fd81846537dd7
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_745fd81846537dd7 =
  BG.fromFFIType hs_bindgen_745fd81846537dd7_base

-- | Set the window to always be above the others.
--
--     This will add or remove the window\'s @SDL_WINDOW_ALWAYS_ON_TOP@ flag. This will bring the window to the front and keep the window above the rest.
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
sDL_SetWindowAlwaysOnTop
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the always on top state.
  -> BG.CBool
  -- ^
  --
  --           [@on_top@]: true to set the window always on top, false to disable.
  -> IO BG.CBool
sDL_SetWindowAlwaysOnTop =
  hs_bindgen_745fd81846537dd7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowFillDocument@
foreign import ccall unsafe "hs_bindgen_51036b434b8a9d9a"
  hs_bindgen_51036b434b8a9d9a_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowFillDocument@
hs_bindgen_51036b434b8a9d9a
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_51036b434b8a9d9a =
  BG.fromFFIType hs_bindgen_51036b434b8a9d9a_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_GetWindowFlags'
--
--     [C declaration]: @SDL_SetWindowFillDocument@, defined at @SDL3\/SDL_video.h 2183:34@
sDL_SetWindowFillDocument
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window of which to change the fill-document state.
  -> BG.CBool
  -- ^
  --
  --           [@fill@]: true to set the window to fill the document, false to disable.
  -> IO BG.CBool
sDL_SetWindowFillDocument =
  hs_bindgen_51036b434b8a9d9a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_ShowWindow@
foreign import ccall unsafe "hs_bindgen_7fdf198ee1ca7f92"
  hs_bindgen_7fdf198ee1ca7f92_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_ShowWindow@
hs_bindgen_7fdf198ee1ca7f92
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_7fdf198ee1ca7f92 =
  BG.fromFFIType hs_bindgen_7fdf198ee1ca7f92_base

-- | Show a window.
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
sDL_ShowWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to show.
  -> IO BG.CBool
sDL_ShowWindow = hs_bindgen_7fdf198ee1ca7f92

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_HideWindow@
foreign import ccall unsafe "hs_bindgen_2764604bcb0dc3ca"
  hs_bindgen_2764604bcb0dc3ca_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_HideWindow@
hs_bindgen_2764604bcb0dc3ca
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_2764604bcb0dc3ca =
  BG.fromFFIType hs_bindgen_2764604bcb0dc3ca_base

-- | Hide a window.
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
sDL_HideWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to hide.
  -> IO BG.CBool
sDL_HideWindow = hs_bindgen_2764604bcb0dc3ca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_RaiseWindow@
foreign import ccall unsafe "hs_bindgen_655550628b940a03"
  hs_bindgen_655550628b940a03_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_RaiseWindow@
hs_bindgen_655550628b940a03
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_655550628b940a03 =
  BG.fromFFIType hs_bindgen_655550628b940a03_base

-- | Request that a window be raised above other windows and gain the input focus.
--
--     The result of this request is subject to desktop window manager policy, particularly if raising the requested window would result in stealing focus from another application. If the window is successfully raised and gains input focus, an SDL_EVENT_WINDOW_FOCUS_GAINED event will be emitted, and the window will have the SDL_WINDOW_INPUT_FOCUS flag set.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RaiseWindow@, defined at @SDL3\/SDL_video.h 2235:34@
sDL_RaiseWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to raise.
  -> IO BG.CBool
sDL_RaiseWindow = hs_bindgen_655550628b940a03

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_MaximizeWindow@
foreign import ccall unsafe "hs_bindgen_080d71419d89f8ac"
  hs_bindgen_080d71419d89f8ac_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_MaximizeWindow@
hs_bindgen_080d71419d89f8ac
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_080d71419d89f8ac =
  BG.fromFFIType hs_bindgen_080d71419d89f8ac_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_MinimizeWindow', 'sDL_RestoreWindow', 'sDL_SyncWindow'
--
--     [C declaration]: @SDL_MaximizeWindow@, defined at @SDL3\/SDL_video.h 2269:34@
sDL_MaximizeWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to maximize.
  -> IO BG.CBool
sDL_MaximizeWindow = hs_bindgen_080d71419d89f8ac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_MinimizeWindow@
foreign import ccall unsafe "hs_bindgen_e1f35d0dbc3b4400"
  hs_bindgen_e1f35d0dbc3b4400_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_MinimizeWindow@
hs_bindgen_e1f35d0dbc3b4400
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_e1f35d0dbc3b4400 =
  BG.fromFFIType hs_bindgen_e1f35d0dbc3b4400_base

-- | Request that the window be minimized to an iconic representation.
--
--     If the window is in a fullscreen state, this request has no direct effect. It may alter the state the window is returned to when leaving fullscreen.
--
--     On some windowing systems this request is asynchronous and the new window state may not have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_MINIMIZED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
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
sDL_MinimizeWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to minimize.
  -> IO BG.CBool
sDL_MinimizeWindow = hs_bindgen_e1f35d0dbc3b4400

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_RestoreWindow@
foreign import ccall unsafe "hs_bindgen_e090b304456b95d1"
  hs_bindgen_e090b304456b95d1_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_RestoreWindow@
hs_bindgen_e090b304456b95d1
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_e090b304456b95d1 =
  BG.fromFFIType hs_bindgen_e090b304456b95d1_base

-- | Request that the size and position of a minimized or maximized window be restored.
--
--     If the window is in a fullscreen state, this request has no direct effect. It may alter the state the window is returned to when leaving fullscreen.
--
--     On some windowing systems this request is asynchronous and the new window state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_RESTORED event will be emitted. Note that, as this is just a request, the windowing system can deny the state change.
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
sDL_RestoreWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to restore.
  -> IO BG.CBool
sDL_RestoreWindow = hs_bindgen_e090b304456b95d1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowFullscreen@
foreign import ccall unsafe "hs_bindgen_b1dbd6c7bf42bc68"
  hs_bindgen_b1dbd6c7bf42bc68_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowFullscreen@
hs_bindgen_b1dbd6c7bf42bc68
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_b1dbd6c7bf42bc68 =
  BG.fromFFIType hs_bindgen_b1dbd6c7bf42bc68_base

-- | Request that the window\'s fullscreen state be changed.
--
--     By default a window in fullscreen state uses borderless fullscreen desktop mode, but a specific exclusive display mode can be set using @SDL_SetWindowFullscreenMode()@.
--
--     On some windowing systems this request is asynchronous and the new fullscreen state may not have have been applied immediately upon the return of this function. If an immediate change is required, call @SDL_SyncWindow()@ to block until the changes have taken effect.
--
--     When the window state changes, an SDL_EVENT_WINDOW_ENTER_FULLSCREEN or SDL_EVENT_WINDOW_LEAVE_FULLSCREEN event will be emitted. Note that, as this is just a request, it can be denied by the windowing system.
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
sDL_SetWindowFullscreen
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.CBool
  -- ^
  --
  --           [@fullscreen@]: true for fullscreen mode, false for windowed mode.
  -> IO BG.CBool
sDL_SetWindowFullscreen = hs_bindgen_b1dbd6c7bf42bc68

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SyncWindow@
foreign import ccall unsafe "hs_bindgen_ce8bade87de24cec"
  hs_bindgen_ce8bade87de24cec_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SyncWindow@
hs_bindgen_ce8bade87de24cec
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_ce8bade87de24cec =
  BG.fromFFIType hs_bindgen_ce8bade87de24cec_base

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
--     [See also]: 'sDL_SetWindowSize', 'sDL_SetWindowPosition', 'sDL_SetWindowFullscreen', 'sDL_MinimizeWindow', 'sDL_MaximizeWindow', 'sDL_RestoreWindow', SDL_HINT_VIDEO_SYNC_WINDOW_OPERATIONS
--
--     [C declaration]: @SDL_SyncWindow@, defined at @SDL3\/SDL_video.h 2391:34@
sDL_SyncWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which to wait for the pending state to be applied.
  -> IO BG.CBool
sDL_SyncWindow = hs_bindgen_ce8bade87de24cec

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_WindowHasSurface@
foreign import ccall unsafe "hs_bindgen_60a31e841c25b5c2"
  hs_bindgen_60a31e841c25b5c2_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_WindowHasSurface@
hs_bindgen_60a31e841c25b5c2
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_60a31e841c25b5c2 =
  BG.fromFFIType hs_bindgen_60a31e841c25b5c2_base

-- | Return whether the window has a surface associated with it.
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
sDL_WindowHasSurface
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO BG.CBool
sDL_WindowHasSurface = hs_bindgen_60a31e841c25b5c2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSurface@
foreign import ccall unsafe "hs_bindgen_b27ac903c03a4dfa"
  hs_bindgen_b27ac903c03a4dfa_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSurface@
hs_bindgen_b27ac903c03a4dfa
  :: BG.Ptr SDL_Window
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
hs_bindgen_b27ac903c03a4dfa =
  BG.fromFFIType hs_bindgen_b27ac903c03a4dfa_base

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
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
sDL_GetWindowSurface = hs_bindgen_b27ac903c03a4dfa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowSurfaceVSync@
foreign import ccall unsafe "hs_bindgen_507572e10b7f7b5d"
  hs_bindgen_507572e10b7f7b5d_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowSurfaceVSync@
hs_bindgen_507572e10b7f7b5d
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_507572e10b7f7b5d =
  BG.fromFFIType hs_bindgen_507572e10b7f7b5d_base

-- | Toggle VSync for the window surface.
--
--     When a window surface is created, vsync defaults to SDL_WINDOW_SURFACE_VSYNC_DISABLED.
--
--     The @vsync@ parameter can be 1 to synchronize present with every vertical refresh, 2 to synchronize present with every second vertical refresh, etc., SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or SDL_WINDOW_SURFACE_VSYNC_DISABLED to disable. Not every value is supported by every driver, so you should check the return value to see whether the requested setting is supported.
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
sDL_SetWindowSurfaceVSync
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window.
  -> BG.CInt
  -- ^
  --
  --           [@vsync@]: the vertical refresh sync interval.
  -> IO BG.CBool
sDL_SetWindowSurfaceVSync =
  hs_bindgen_507572e10b7f7b5d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSurfaceVSync@
foreign import ccall unsafe "hs_bindgen_b6f4ee5ffa664900"
  hs_bindgen_b6f4ee5ffa664900_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowSurfaceVSync@
hs_bindgen_b6f4ee5ffa664900
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_b6f4ee5ffa664900 =
  BG.fromFFIType hs_bindgen_b6f4ee5ffa664900_base

-- | Get VSync for the window surface.
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
sDL_GetWindowSurfaceVSync
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@vsync@]: an int filled with the current vertical refresh sync interval. See @SDL_SetWindowSurfaceVSync()@ for the meaning of the value.
  -> IO BG.CBool
sDL_GetWindowSurfaceVSync =
  hs_bindgen_b6f4ee5ffa664900

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_UpdateWindowSurface@
foreign import ccall unsafe "hs_bindgen_0647ceba715b9468"
  hs_bindgen_0647ceba715b9468_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_UpdateWindowSurface@
hs_bindgen_0647ceba715b9468
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_0647ceba715b9468 =
  BG.fromFFIType hs_bindgen_0647ceba715b9468_base

-- | Copy the window surface to the screen.
--
--     This is the function you use to reflect any changes to the surface on the screen.
--
--     This function is equivalent to the SDL 1.2 API SDL_Flip().
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
sDL_UpdateWindowSurface
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to update.
  -> IO BG.CBool
sDL_UpdateWindowSurface = hs_bindgen_0647ceba715b9468

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_UpdateWindowSurfaceRects@
foreign import ccall unsafe "hs_bindgen_99ad341567ec7dd7"
  hs_bindgen_99ad341567ec7dd7_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_UpdateWindowSurfaceRects@
hs_bindgen_99ad341567ec7dd7
  :: BG.Ptr SDL_Window
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_99ad341567ec7dd7 =
  BG.fromFFIType hs_bindgen_99ad341567ec7dd7_base

-- | Copy areas of the window surface to the screen.
--
--     This is the function you use to reflect changes to portions of the surface on the screen.
--
--     This function is equivalent to the SDL 1.2 API SDL_UpdateRects().
--
--     Note that this function will update /at least/ the rectangles specified, but this is only intended as an optimization; in practice, this might update more of the screen (or all of the screen!), depending on what method SDL uses to send pixels to the system.
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
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to update.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rects@]: an array of SDL_Rect structures representing areas of the surface to copy, in pixels.
  -> BG.CInt
  -- ^
  --
  --           [@numrects@]: the number of rectangles.
  -> IO BG.CBool
sDL_UpdateWindowSurfaceRects =
  hs_bindgen_99ad341567ec7dd7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_DestroyWindowSurface@
foreign import ccall unsafe "hs_bindgen_7c381c64250e8266"
  hs_bindgen_7c381c64250e8266_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_DestroyWindowSurface@
hs_bindgen_7c381c64250e8266
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_7c381c64250e8266 =
  BG.fromFFIType hs_bindgen_7c381c64250e8266_base

-- | Destroy the surface associated with the window.
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
sDL_DestroyWindowSurface
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to update.
  -> IO BG.CBool
sDL_DestroyWindowSurface =
  hs_bindgen_7c381c64250e8266

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowKeyboardGrab@
foreign import ccall unsafe "hs_bindgen_088757457073c51d"
  hs_bindgen_088757457073c51d_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowKeyboardGrab@
hs_bindgen_088757457073c51d
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_088757457073c51d =
  BG.fromFFIType hs_bindgen_088757457073c51d_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowKeyboardGrab', 'sDL_SetWindowMouseGrab'
--
--     [C declaration]: @SDL_SetWindowKeyboardGrab@, defined at @SDL3\/SDL_video.h 2580:34@
sDL_SetWindowKeyboardGrab
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which the keyboard grab mode should be set.
  -> BG.CBool
  -- ^
  --
  --           [@grabbed@]: this is true to grab keyboard, and false to release.
  -> IO BG.CBool
sDL_SetWindowKeyboardGrab =
  hs_bindgen_088757457073c51d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowMouseGrab@
foreign import ccall unsafe "hs_bindgen_fcca3f67a0285f40"
  hs_bindgen_fcca3f67a0285f40_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowMouseGrab@
hs_bindgen_fcca3f67a0285f40
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_fcca3f67a0285f40 =
  BG.fromFFIType hs_bindgen_fcca3f67a0285f40_base

-- | Set a window\'s mouse grab mode.
--
--     Mouse grab confines the mouse cursor to the window.
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
sDL_SetWindowMouseGrab
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which the mouse grab mode should be set.
  -> BG.CBool
  -- ^
  --
  --           [@grabbed@]: this is true to grab mouse, and false to release.
  -> IO BG.CBool
sDL_SetWindowMouseGrab = hs_bindgen_fcca3f67a0285f40

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowKeyboardGrab@
foreign import ccall unsafe "hs_bindgen_cda2cd2af79b5ca6"
  hs_bindgen_cda2cd2af79b5ca6_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowKeyboardGrab@
hs_bindgen_cda2cd2af79b5ca6
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_cda2cd2af79b5ca6 =
  BG.fromFFIType hs_bindgen_cda2cd2af79b5ca6_base

-- | Get a window\'s keyboard grab mode.
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
sDL_GetWindowKeyboardGrab
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO BG.CBool
sDL_GetWindowKeyboardGrab =
  hs_bindgen_cda2cd2af79b5ca6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowMouseGrab@
foreign import ccall unsafe "hs_bindgen_3d8a4df5806b21ff"
  hs_bindgen_3d8a4df5806b21ff_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowMouseGrab@
hs_bindgen_3d8a4df5806b21ff
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_3d8a4df5806b21ff =
  BG.fromFFIType hs_bindgen_3d8a4df5806b21ff_base

-- | Get a window\'s mouse grab mode.
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
sDL_GetWindowMouseGrab
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO BG.CBool
sDL_GetWindowMouseGrab = hs_bindgen_3d8a4df5806b21ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetGrabbedWindow@
foreign import ccall unsafe "hs_bindgen_63a195963286004a"
  hs_bindgen_63a195963286004a_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetGrabbedWindow@
hs_bindgen_63a195963286004a :: IO (BG.Ptr SDL_Window)
hs_bindgen_63a195963286004a =
  BG.fromFFIType hs_bindgen_63a195963286004a_base

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
sDL_GetGrabbedWindow :: IO (BG.Ptr SDL_Window)
sDL_GetGrabbedWindow = hs_bindgen_63a195963286004a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowMouseRect@
foreign import ccall unsafe "hs_bindgen_3da85ada2677f1fd"
  hs_bindgen_3da85ada2677f1fd_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowMouseRect@
hs_bindgen_3da85ada2677f1fd
  :: BG.Ptr SDL_Window
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_3da85ada2677f1fd =
  BG.fromFFIType hs_bindgen_3da85ada2677f1fd_base

-- | Confines the cursor to the specified area of a window.
--
--     Note that this does NOT grab the cursor, it only defines the area a cursor is restricted to when the window has mouse focus.
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
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window that will be associated with the barrier.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a rectangle area in window-relative coordinates. If NULL the barrier for the specified window will be destroyed.
  -> IO BG.CBool
sDL_SetWindowMouseRect = hs_bindgen_3da85ada2677f1fd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowMouseRect@
foreign import ccall unsafe "hs_bindgen_45c2c94bf4760d8a"
  hs_bindgen_45c2c94bf4760d8a_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowMouseRect@
hs_bindgen_45c2c94bf4760d8a
  :: BG.Ptr SDL_Window
  -> IO (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect)
hs_bindgen_45c2c94bf4760d8a =
  BG.fromFFIType hs_bindgen_45c2c94bf4760d8a_base

-- | Get the mouse confinement rectangle of a window.
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
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect)
sDL_GetWindowMouseRect = hs_bindgen_45c2c94bf4760d8a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowOpacity@
foreign import ccall unsafe "hs_bindgen_019c9148c0aa4e8f"
  hs_bindgen_019c9148c0aa4e8f_base
    :: BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowOpacity@
hs_bindgen_019c9148c0aa4e8f
  :: BG.Ptr SDL_Window
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_019c9148c0aa4e8f =
  BG.fromFFIType hs_bindgen_019c9148c0aa4e8f_base

-- | Set the opacity for a window.
--
--     The parameter @opacity@ will be clamped internally between 0.0f (transparent) and 1.0f (opaque).
--
--     This function also returns false if setting the opacity isn\'t supported.
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
sDL_SetWindowOpacity
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window which will be made transparent or opaque.
  -> BG.CFloat
  -- ^
  --
  --           [@opacity@]: the opacity value (0.0f - transparent, 1.0f - opaque).
  -> IO BG.CBool
sDL_SetWindowOpacity = hs_bindgen_019c9148c0aa4e8f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowOpacity@
foreign import ccall unsafe "hs_bindgen_744325d9009c4077"
  hs_bindgen_744325d9009c4077_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowOpacity@
hs_bindgen_744325d9009c4077
  :: BG.Ptr SDL_Window
  -> IO BG.CFloat
hs_bindgen_744325d9009c4077 =
  BG.fromFFIType hs_bindgen_744325d9009c4077_base

-- | Get the opacity of a window.
--
--     If transparency isn\'t supported on this platform, opacity will be returned as 1.0f without error.
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
sDL_GetWindowOpacity
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to get the current opacity value from.
  -> IO BG.CFloat
sDL_GetWindowOpacity = hs_bindgen_744325d9009c4077

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowParent@
foreign import ccall unsafe "hs_bindgen_effc3e47de752f57"
  hs_bindgen_effc3e47de752f57_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowParent@
hs_bindgen_effc3e47de752f57
  :: BG.Ptr SDL_Window
  -> BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_effc3e47de752f57 =
  BG.fromFFIType hs_bindgen_effc3e47de752f57_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowModal'
--
--     [C declaration]: @SDL_SetWindowParent@, defined at @SDL3\/SDL_video.h 2757:34@
sDL_SetWindowParent
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window that should become the child of a parent.
  -> BG.Ptr SDL_Window
  -- ^
  --
  --           [@parent@]: the new parent window for the child window.
  -> IO BG.CBool
sDL_SetWindowParent = hs_bindgen_effc3e47de752f57

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowModal@
foreign import ccall unsafe "hs_bindgen_d48e7b0b38e32483"
  hs_bindgen_d48e7b0b38e32483_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowModal@
hs_bindgen_d48e7b0b38e32483
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_d48e7b0b38e32483 =
  BG.fromFFIType hs_bindgen_d48e7b0b38e32483_base

-- | Toggle the state of the window as modal.
--
--     To enable modal status on a window, the window must currently be the child window of a parent, or toggling modal status on will fail.
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
sDL_SetWindowModal
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window on which to set the modal state.
  -> BG.CBool
  -- ^
  --
  --           [@modal@]: true to toggle modal status on, false to toggle it off.
  -> IO BG.CBool
sDL_SetWindowModal = hs_bindgen_d48e7b0b38e32483

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowFocusable@
foreign import ccall unsafe "hs_bindgen_45029d07ea1d3a4d"
  hs_bindgen_45029d07ea1d3a4d_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowFocusable@
hs_bindgen_45029d07ea1d3a4d
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_45029d07ea1d3a4d =
  BG.fromFFIType hs_bindgen_45029d07ea1d3a4d_base

-- | Set whether the window may have input focus.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetWindowFocusable@, defined at @SDL3\/SDL_video.h 2791:34@
sDL_SetWindowFocusable
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to set focusable state.
  -> BG.CBool
  -- ^
  --
  --           [@focusable@]: true to allow input focus, false to not allow input focus.
  -> IO BG.CBool
sDL_SetWindowFocusable = hs_bindgen_45029d07ea1d3a4d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_ShowWindowSystemMenu@
foreign import ccall unsafe "hs_bindgen_839b36668059a297"
  hs_bindgen_839b36668059a297_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_ShowWindowSystemMenu@
hs_bindgen_839b36668059a297
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_839b36668059a297 =
  BG.fromFFIType hs_bindgen_839b36668059a297_base

-- | Display the system-level window menu.
--
--     This default window menu is provided by the system and on some platforms provides functionality for setting or changing privileged state on the window, such as moving it between workspaces or displays, or toggling the always-on-top property.
--
--     On platforms or desktops where this is unsupported, this function does nothing.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ShowWindowSystemMenu@, defined at @SDL3\/SDL_video.h 2817:34@
sDL_ShowWindowSystemMenu
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window for which the menu will be displayed.
  -> BG.CInt
  -- ^
  --
  --           [@x@]: the x coordinate of the menu, relative to the origin (top-left) of the client area.
  -> BG.CInt
  -- ^
  --
  --           [@y@]: the y coordinate of the menu, relative to the origin (top-left) of the client area.
  -> IO BG.CBool
sDL_ShowWindowSystemMenu =
  hs_bindgen_839b36668059a297

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowHitTest@
foreign import ccall unsafe "hs_bindgen_b4659f0d8b06588e"
  hs_bindgen_b4659f0d8b06588e_base
    :: BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowHitTest@
hs_bindgen_b4659f0d8b06588e
  :: BG.Ptr SDL_Window
  -> SDL_HitTest
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_b4659f0d8b06588e =
  BG.fromFFIType hs_bindgen_b4659f0d8b06588e_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetWindowHitTest@, defined at @SDL3\/SDL_video.h 2898:34@
sDL_SetWindowHitTest
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
  -> IO BG.CBool
sDL_SetWindowHitTest = hs_bindgen_b4659f0d8b06588e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowShape@
foreign import ccall unsafe "hs_bindgen_e671b0b9ca790520"
  hs_bindgen_e671b0b9ca790520_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowShape@
hs_bindgen_e671b0b9ca790520
  :: BG.Ptr SDL_Window
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO BG.CBool
hs_bindgen_e671b0b9ca790520 =
  BG.fromFFIType hs_bindgen_e671b0b9ca790520_base

-- | Set the shape of a transparent window.
--
--     This sets the alpha channel of a transparent window and any fully transparent areas are also transparent to mouse clicks. If you are using something besides the SDL render API, then you are responsible for drawing the alpha channel of the window to match the shape alpha channel to get consistent cross-platform results.
--
--     The shape is copied inside this function, so you can free it afterwards. If your shape surface changes, you should call @SDL_SetWindowShape()@ again to update the window. This is an expensive operation, so should be done sparingly.
--
--     The window must have been created with the SDL_WINDOW_TRANSPARENT flag.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetWindowShape@, defined at @SDL3\/SDL_video.h 2926:34@
sDL_SetWindowShape
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window.
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@shape@]: the surface representing the shape of the window, or NULL to remove any current shape.
  -> IO BG.CBool
sDL_SetWindowShape = hs_bindgen_e671b0b9ca790520

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_FlashWindow@
foreign import ccall unsafe "hs_bindgen_631082dd3b92af79"
  hs_bindgen_631082dd3b92af79_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_FlashWindow@
hs_bindgen_631082dd3b92af79
  :: BG.Ptr SDL_Window
  -> SDL_FlashOperation
  -> IO BG.CBool
hs_bindgen_631082dd3b92af79 =
  BG.fromFFIType hs_bindgen_631082dd3b92af79_base

-- | Request a window to demand attention from the user.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_FlashWindow@, defined at @SDL3\/SDL_video.h 2940:34@
sDL_FlashWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to be flashed.
  -> SDL_FlashOperation
  -- ^
  --
  --           [@operation@]: the operation to perform.
  -> IO BG.CBool
sDL_FlashWindow = hs_bindgen_631082dd3b92af79

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowProgressState@
foreign import ccall unsafe "hs_bindgen_24d52be2d578e3a6"
  hs_bindgen_24d52be2d578e3a6_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowProgressState@
hs_bindgen_24d52be2d578e3a6
  :: BG.Ptr SDL_Window
  -> SDL_ProgressState
  -> IO BG.CBool
hs_bindgen_24d52be2d578e3a6 =
  BG.fromFFIType hs_bindgen_24d52be2d578e3a6_base

-- | Sets the state of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetWindowProgressState@, defined at @SDL3\/SDL_video.h 2955:34@
sDL_SetWindowProgressState
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window whose progress state is to be modified.
  -> SDL_ProgressState
  -- ^
  --
  --           [@state@]: the progress state. @SDL_PROGRESS_STATE_NONE@ stops displaying the progress bar.
  -> IO BG.CBool
sDL_SetWindowProgressState =
  hs_bindgen_24d52be2d578e3a6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowProgressState@
foreign import ccall unsafe "hs_bindgen_d7a642f9cea765c4"
  hs_bindgen_d7a642f9cea765c4_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowProgressState@
hs_bindgen_d7a642f9cea765c4
  :: BG.Ptr SDL_Window
  -> IO SDL_ProgressState
hs_bindgen_d7a642f9cea765c4 =
  BG.fromFFIType hs_bindgen_d7a642f9cea765c4_base

-- | Get the state of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: the progress state, or @SDL_PROGRESS_STATE_INVALID@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetWindowProgressState@, defined at @SDL3\/SDL_video.h 2968:47@
sDL_GetWindowProgressState
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to get the current progress state from.
  -> IO SDL_ProgressState
sDL_GetWindowProgressState =
  hs_bindgen_d7a642f9cea765c4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowProgressValue@
foreign import ccall unsafe "hs_bindgen_0a7984bb3f923d56"
  hs_bindgen_0a7984bb3f923d56_base
    :: BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_SetWindowProgressValue@
hs_bindgen_0a7984bb3f923d56
  :: BG.Ptr SDL_Window
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_0a7984bb3f923d56 =
  BG.fromFFIType hs_bindgen_0a7984bb3f923d56_base

-- | Sets the value of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetWindowProgressValue@, defined at @SDL3\/SDL_video.h 2983:34@
sDL_SetWindowProgressValue
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window whose progress value is to be modified.
  -> BG.CFloat
  -- ^
  --
  --           [@value@]: the progress value in the range of [0.0f - 1.0f]. If the value is outside the valid range, it gets clamped.
  -> IO BG.CBool
sDL_SetWindowProgressValue =
  hs_bindgen_0a7984bb3f923d56

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowProgressValue@
foreign import ccall unsafe "hs_bindgen_936a487daf968843"
  hs_bindgen_936a487daf968843_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GetWindowProgressValue@
hs_bindgen_936a487daf968843
  :: BG.Ptr SDL_Window
  -> IO BG.CFloat
hs_bindgen_936a487daf968843 =
  BG.fromFFIType hs_bindgen_936a487daf968843_base

-- | Get the value of the progress bar for the given window’s taskbar icon.
--
--     [Returns]: the progress value in the range of [0.0f - 1.0f], or -1.0f on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_GetWindowProgressValue@, defined at @SDL3\/SDL_video.h 2996:35@
sDL_GetWindowProgressValue
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to get the current progress value from.
  -> IO BG.CFloat
sDL_GetWindowProgressValue =
  hs_bindgen_936a487daf968843

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_DestroyWindow@
foreign import ccall unsafe "hs_bindgen_c66377fe72053eef"
  hs_bindgen_c66377fe72053eef_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_DestroyWindow@
hs_bindgen_c66377fe72053eef
  :: BG.Ptr SDL_Window
  -> IO ()
hs_bindgen_c66377fe72053eef =
  BG.fromFFIType hs_bindgen_c66377fe72053eef_base

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
--     [See also]: 'sDL_CreatePopupWindow', 'sDL_CreateWindow', 'sDL_CreateWindowWithProperties'
--
--     [C declaration]: @SDL_DestroyWindow@, defined at @SDL3\/SDL_video.h 3018:34@
sDL_DestroyWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to destroy.
  -> IO ()
sDL_DestroyWindow = hs_bindgen_c66377fe72053eef

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_ScreenSaverEnabled@
foreign import ccall unsafe "hs_bindgen_8d4460920f35fe23"
  hs_bindgen_8d4460920f35fe23_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_ScreenSaverEnabled@
hs_bindgen_8d4460920f35fe23 :: IO BG.CBool
hs_bindgen_8d4460920f35fe23 =
  BG.fromFFIType hs_bindgen_8d4460920f35fe23_base

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
sDL_ScreenSaverEnabled :: IO BG.CBool
sDL_ScreenSaverEnabled = hs_bindgen_8d4460920f35fe23

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EnableScreenSaver@
foreign import ccall unsafe "hs_bindgen_b0634b88ba5dac7b"
  hs_bindgen_b0634b88ba5dac7b_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EnableScreenSaver@
hs_bindgen_b0634b88ba5dac7b :: IO BG.CBool
hs_bindgen_b0634b88ba5dac7b =
  BG.fromFFIType hs_bindgen_b0634b88ba5dac7b_base

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
sDL_EnableScreenSaver :: IO BG.CBool
sDL_EnableScreenSaver = hs_bindgen_b0634b88ba5dac7b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_DisableScreenSaver@
foreign import ccall unsafe "hs_bindgen_2a05f306113c76cb"
  hs_bindgen_2a05f306113c76cb_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_DisableScreenSaver@
hs_bindgen_2a05f306113c76cb :: IO BG.CBool
hs_bindgen_2a05f306113c76cb =
  BG.fromFFIType hs_bindgen_2a05f306113c76cb_base

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
sDL_DisableScreenSaver :: IO BG.CBool
sDL_DisableScreenSaver = hs_bindgen_2a05f306113c76cb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_LoadLibrary@
foreign import ccall unsafe "hs_bindgen_80ecb7f912f6a101"
  hs_bindgen_80ecb7f912f6a101_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_LoadLibrary@
hs_bindgen_80ecb7f912f6a101
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_80ecb7f912f6a101 =
  BG.fromFFIType hs_bindgen_80ecb7f912f6a101_base

-- | Dynamically load an OpenGL library.
--
--     This should be done after initializing the video driver, but before creating any OpenGL windows. If no OpenGL library is loaded, the default library will be loaded upon creation of the first OpenGL window.
--
--     If you do this, you need to retrieve all of the GL functions used in your program from the dynamic library using @SDL_GL_GetProcAddress()@.
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
sDL_GL_LoadLibrary
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the platform dependent OpenGL library name, or NULL to open the default OpenGL library.
  -> IO BG.CBool
sDL_GL_LoadLibrary = hs_bindgen_80ecb7f912f6a101

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetProcAddress@
foreign import ccall unsafe "hs_bindgen_45ec5c45b7aeecbc"
  hs_bindgen_45ec5c45b7aeecbc_base
    :: BG.Ptr BG.Void
    -> IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetProcAddress@
hs_bindgen_45ec5c45b7aeecbc
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
hs_bindgen_45ec5c45b7aeecbc =
  BG.fromFFIType hs_bindgen_45ec5c45b7aeecbc_base

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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@proc@]: the name of an OpenGL function.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
sDL_GL_GetProcAddress = hs_bindgen_45ec5c45b7aeecbc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_GetProcAddress@
foreign import ccall unsafe "hs_bindgen_fecd43d56eba918e"
  hs_bindgen_fecd43d56eba918e_base
    :: BG.Ptr BG.Void
    -> IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_GetProcAddress@
hs_bindgen_fecd43d56eba918e
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
hs_bindgen_fecd43d56eba918e =
  BG.fromFFIType hs_bindgen_fecd43d56eba918e_base

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
--     [See also]: 'sDL_EGL_GetCurrentDisplay'
--
--     [C declaration]: @SDL_EGL_GetProcAddress@, defined at @SDL3\/SDL_video.h 3177:49@
sDL_EGL_GetProcAddress
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@proc@]: the name of an EGL function.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
sDL_EGL_GetProcAddress = hs_bindgen_fecd43d56eba918e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_UnloadLibrary@
foreign import ccall unsafe "hs_bindgen_86d08bc666c9f566"
  hs_bindgen_86d08bc666c9f566_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_UnloadLibrary@
hs_bindgen_86d08bc666c9f566 :: IO ()
hs_bindgen_86d08bc666c9f566 =
  BG.fromFFIType hs_bindgen_86d08bc666c9f566_base

-- | Unload the OpenGL library previously loaded by @SDL_GL_LoadLibrary()@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_LoadLibrary'
--
--     [C declaration]: @SDL_GL_UnloadLibrary@, defined at @SDL3\/SDL_video.h 3188:34@
sDL_GL_UnloadLibrary :: IO ()
sDL_GL_UnloadLibrary = hs_bindgen_86d08bc666c9f566

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_ExtensionSupported@
foreign import ccall unsafe "hs_bindgen_8c89c426b6cd15de"
  hs_bindgen_8c89c426b6cd15de_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_ExtensionSupported@
hs_bindgen_8c89c426b6cd15de
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_8c89c426b6cd15de =
  BG.fromFFIType hs_bindgen_8c89c426b6cd15de_base

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
--     [C declaration]: @SDL_GL_ExtensionSupported@, defined at @SDL3\/SDL_video.h 3211:34@
sDL_GL_ExtensionSupported
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@extension@]: the name of the extension to check.
  -> IO BG.CBool
sDL_GL_ExtensionSupported =
  hs_bindgen_8c89c426b6cd15de

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_ResetAttributes@
foreign import ccall unsafe "hs_bindgen_c0ef2cbb30166af5"
  hs_bindgen_c0ef2cbb30166af5_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_ResetAttributes@
hs_bindgen_c0ef2cbb30166af5 :: IO ()
hs_bindgen_c0ef2cbb30166af5 =
  BG.fromFFIType hs_bindgen_c0ef2cbb30166af5_base

-- | Reset all previously set OpenGL context attributes to their default values.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_GetAttribute', 'sDL_GL_SetAttribute'
--
--     [C declaration]: @SDL_GL_ResetAttributes@, defined at @SDL3\/SDL_video.h 3223:34@
sDL_GL_ResetAttributes :: IO ()
sDL_GL_ResetAttributes = hs_bindgen_c0ef2cbb30166af5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_SetAttribute@
foreign import ccall unsafe "hs_bindgen_dfea3fa025830d75"
  hs_bindgen_dfea3fa025830d75_base
    :: BG.Word32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_SetAttribute@
hs_bindgen_dfea3fa025830d75
  :: SDL_GLAttr
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_dfea3fa025830d75 =
  BG.fromFFIType hs_bindgen_dfea3fa025830d75_base

-- | Set an OpenGL window attribute before window creation.
--
--     This function sets the OpenGL attribute @attr@ to @value@. The requested attributes should be set before creating an OpenGL window. You should use @SDL_GL_GetAttribute()@ to check the values after creating the OpenGL context, since the values obtained can differ from the requested ones.
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
sDL_GL_SetAttribute
  :: SDL_GLAttr
  -- ^
  --
  --           [@attr@]: an enum value specifying the OpenGL attribute to set.
  -> BG.CInt
  -- ^
  --
  --           [@value@]: the desired value for the attribute.
  -> IO BG.CBool
sDL_GL_SetAttribute = hs_bindgen_dfea3fa025830d75

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetAttribute@
foreign import ccall unsafe "hs_bindgen_b4ec3aa42353470f"
  hs_bindgen_b4ec3aa42353470f_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetAttribute@
hs_bindgen_b4ec3aa42353470f
  :: SDL_GLAttr
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_b4ec3aa42353470f =
  BG.fromFFIType hs_bindgen_b4ec3aa42353470f_base

-- | Get the actual value for an attribute from the current context.
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
sDL_GL_GetAttribute
  :: SDL_GLAttr
  -- ^
  --
  --           [@attr@]: an 'SDL_GLAttr' enum value specifying the OpenGL attribute to get.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@value@]: a pointer filled in with the current value of @attr@.
  -> IO BG.CBool
sDL_GL_GetAttribute = hs_bindgen_b4ec3aa42353470f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_CreateContext@
foreign import ccall unsafe "hs_bindgen_02589eafe594e5ce"
  hs_bindgen_02589eafe594e5ce_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_CreateContext@
hs_bindgen_02589eafe594e5ce
  :: BG.Ptr SDL_Window
  -> IO SDL_GLContext
hs_bindgen_02589eafe594e5ce =
  BG.fromFFIType hs_bindgen_02589eafe594e5ce_base

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
--     [Returns]: the OpenGL context associated with @window@ or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_DestroyContext', 'sDL_GL_MakeCurrent'
--
--     [C declaration]: @SDL_GL_CreateContext@, defined at @SDL3\/SDL_video.h 3294:43@
sDL_GL_CreateContext
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to associate with the context.
  -> IO SDL_GLContext
sDL_GL_CreateContext = hs_bindgen_02589eafe594e5ce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_MakeCurrent@
foreign import ccall unsafe "hs_bindgen_d986b780d1ccac33"
  hs_bindgen_d986b780d1ccac33_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_MakeCurrent@
hs_bindgen_d986b780d1ccac33
  :: BG.Ptr SDL_Window
  -> SDL_GLContext
  -> IO BG.CBool
hs_bindgen_d986b780d1ccac33 =
  BG.fromFFIType hs_bindgen_d986b780d1ccac33_base

-- | Set up an OpenGL context for rendering into an OpenGL window.
--
--     The context must have been created with a compatible window.
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
sDL_GL_MakeCurrent
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to associate with the context.
  -> SDL_GLContext
  -- ^
  --
  --           [@context@]: the OpenGL context to associate with the window.
  -> IO BG.CBool
sDL_GL_MakeCurrent = hs_bindgen_d986b780d1ccac33

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetCurrentWindow@
foreign import ccall unsafe "hs_bindgen_24a0284995e8a74e"
  hs_bindgen_24a0284995e8a74e_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetCurrentWindow@
hs_bindgen_24a0284995e8a74e :: IO (BG.Ptr SDL_Window)
hs_bindgen_24a0284995e8a74e =
  BG.fromFFIType hs_bindgen_24a0284995e8a74e_base

-- | Get the currently active OpenGL window.
--
--     [Returns]: the currently active OpenGL window on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GL_GetCurrentWindow@, defined at @SDL3\/SDL_video.h 3324:42@
sDL_GL_GetCurrentWindow :: IO (BG.Ptr SDL_Window)
sDL_GL_GetCurrentWindow = hs_bindgen_24a0284995e8a74e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetCurrentContext@
foreign import ccall unsafe "hs_bindgen_cb9ceaede20b4208"
  hs_bindgen_cb9ceaede20b4208_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetCurrentContext@
hs_bindgen_cb9ceaede20b4208 :: IO SDL_GLContext
hs_bindgen_cb9ceaede20b4208 =
  BG.fromFFIType hs_bindgen_cb9ceaede20b4208_base

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
sDL_GL_GetCurrentContext :: IO SDL_GLContext
sDL_GL_GetCurrentContext =
  hs_bindgen_cb9ceaede20b4208

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_GetCurrentDisplay@
foreign import ccall unsafe "hs_bindgen_709f1c4141e36bd4"
  hs_bindgen_709f1c4141e36bd4_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_GetCurrentDisplay@
hs_bindgen_709f1c4141e36bd4 :: IO SDL_EGLDisplay
hs_bindgen_709f1c4141e36bd4 =
  BG.fromFFIType hs_bindgen_709f1c4141e36bd4_base

-- | Get the currently active EGL display.
--
--     [Returns]: the currently active EGL display or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGL_GetCurrentDisplay@, defined at @SDL3\/SDL_video.h 3350:44@
sDL_EGL_GetCurrentDisplay :: IO SDL_EGLDisplay
sDL_EGL_GetCurrentDisplay =
  hs_bindgen_709f1c4141e36bd4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_GetCurrentConfig@
foreign import ccall unsafe "hs_bindgen_1a495e63c24b9e1d"
  hs_bindgen_1a495e63c24b9e1d_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_GetCurrentConfig@
hs_bindgen_1a495e63c24b9e1d :: IO SDL_EGLConfig
hs_bindgen_1a495e63c24b9e1d =
  BG.fromFFIType hs_bindgen_1a495e63c24b9e1d_base

-- | Get the currently active EGL config.
--
--     [Returns]: the currently active EGL config or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGL_GetCurrentConfig@, defined at @SDL3\/SDL_video.h 3362:43@
sDL_EGL_GetCurrentConfig :: IO SDL_EGLConfig
sDL_EGL_GetCurrentConfig =
  hs_bindgen_1a495e63c24b9e1d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_GetWindowSurface@
foreign import ccall unsafe "hs_bindgen_2dc2976e346931c2"
  hs_bindgen_2dc2976e346931c2_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_GetWindowSurface@
hs_bindgen_2dc2976e346931c2
  :: BG.Ptr SDL_Window
  -> IO SDL_EGLSurface
hs_bindgen_2dc2976e346931c2 =
  BG.fromFFIType hs_bindgen_2dc2976e346931c2_base

-- | Get the EGL surface associated with the window.
--
--     [Returns]: the EGLSurface pointer associated with the window, or NULL on failure.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGL_GetWindowSurface@, defined at @SDL3\/SDL_video.h 3375:44@
sDL_EGL_GetWindowSurface
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO SDL_EGLSurface
sDL_EGL_GetWindowSurface =
  hs_bindgen_2dc2976e346931c2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_SetAttributeCallbacks@
foreign import ccall unsafe "hs_bindgen_6f6c52b23bae7a50"
  hs_bindgen_6f6c52b23bae7a50_base
    :: BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_EGL_SetAttributeCallbacks@
hs_bindgen_6f6c52b23bae7a50
  :: SDL_EGLAttribArrayCallback
  -> SDL_EGLIntArrayCallback
  -> SDL_EGLIntArrayCallback
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_6f6c52b23bae7a50 =
  BG.fromFFIType hs_bindgen_6f6c52b23bae7a50_base

-- | Sets the callbacks for defining custom EGLAttrib arrays for EGL initialization.
--
--     Callbacks that aren\'t needed can be set to NULL.
--
--     NOTE: These callback pointers will be reset after SDL_GL_ResetAttributes.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGL_SetAttributeCallbacks@, defined at @SDL3\/SDL_video.h 3397:34@
sDL_EGL_SetAttributeCallbacks
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
sDL_EGL_SetAttributeCallbacks =
  hs_bindgen_6f6c52b23bae7a50

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_SetSwapInterval@
foreign import ccall unsafe "hs_bindgen_9fcc7f15d61d9182"
  hs_bindgen_9fcc7f15d61d9182_base
    :: BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_SetSwapInterval@
hs_bindgen_9fcc7f15d61d9182
  :: BG.CInt
  -> IO BG.CBool
hs_bindgen_9fcc7f15d61d9182 =
  BG.fromFFIType hs_bindgen_9fcc7f15d61d9182_base

-- | Set the swap interval for the current OpenGL context.
--
--     Some systems allow specifying -1 for the interval, to enable adaptive vsync. Adaptive vsync works the same as vsync, but if you\'ve already missed the vertical retrace for a given frame, it swaps buffers immediately, which might be less jarring for the user during occasional framerate drops. If an application requests adaptive vsync and the system does not support it, this function will fail and return false. In such a case, you should probably retry the call with 1 for the interval.
--
--     Adaptive vsync is implemented for some glX drivers with GLX_EXT_swap_control_tear, and for some Windows drivers with WGL_EXT_swap_control_tear.
--
--     Read more on the Khronos wiki: [https:\/\/www.khronos.org\/opengl\/wiki\/Swap_Interval\#Adaptive_Vsync](https://www.khronos.org/opengl/wiki/Swap_Interval#Adaptive_Vsync)
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
sDL_GL_SetSwapInterval
  :: BG.CInt
  -- ^
  --
  --           [@interval@]: 0 for immediate updates, 1 for updates synchronized with the vertical retrace, -1 for adaptive vsync.
  -> IO BG.CBool
sDL_GL_SetSwapInterval = hs_bindgen_9fcc7f15d61d9182

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetSwapInterval@
foreign import ccall unsafe "hs_bindgen_d23bd762103b2805"
  hs_bindgen_d23bd762103b2805_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_GetSwapInterval@
hs_bindgen_d23bd762103b2805
  :: BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_d23bd762103b2805 =
  BG.fromFFIType hs_bindgen_d23bd762103b2805_base

-- | Get the swap interval for the current OpenGL context.
--
--     If the system can\'t determine the swap interval, or there isn\'t a valid current context, this function will set *interval to 0 as a safe default.
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
sDL_GL_GetSwapInterval
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@interval@]: output interval value. 0 if there is no vertical retrace synchronization, 1 if the buffer swap is synchronized with the vertical retrace, and -1 if late swaps happen immediately instead of waiting for the next retrace.
  -> IO BG.CBool
sDL_GL_GetSwapInterval = hs_bindgen_d23bd762103b2805

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_SwapWindow@
foreign import ccall unsafe "hs_bindgen_0142b6de91fcc321"
  hs_bindgen_0142b6de91fcc321_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_SwapWindow@
hs_bindgen_0142b6de91fcc321
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_0142b6de91fcc321 =
  BG.fromFFIType hs_bindgen_0142b6de91fcc321_base

-- | Update a window with OpenGL rendering.
--
--     This is used with double-buffered OpenGL contexts, which are the default.
--
--     On macOS, make sure you bind 0 to the draw framebuffer before swapping the window, otherwise nothing will happen. If you aren\'t using glBindFramebuffer(), this is the default and you won\'t have to do anything extra.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GL_SwapWindow@, defined at @SDL3\/SDL_video.h 3471:34@
sDL_GL_SwapWindow
  :: BG.Ptr SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> IO BG.CBool
sDL_GL_SwapWindow = hs_bindgen_0142b6de91fcc321

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_DestroyContext@
foreign import ccall unsafe "hs_bindgen_efe95fa2c1c2690c"
  hs_bindgen_efe95fa2c1c2690c_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Unsafe_SDL_GL_DestroyContext@
hs_bindgen_efe95fa2c1c2690c
  :: SDL_GLContext
  -> IO BG.CBool
hs_bindgen_efe95fa2c1c2690c =
  BG.fromFFIType hs_bindgen_efe95fa2c1c2690c_base

-- | Delete an OpenGL context.
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
sDL_GL_DestroyContext
  :: SDL_GLContext
  -- ^
  --
  --           [@context@]: the OpenGL context to be deleted.
  -> IO BG.CBool
sDL_GL_DestroyContext = hs_bindgen_efe95fa2c1c2690c
