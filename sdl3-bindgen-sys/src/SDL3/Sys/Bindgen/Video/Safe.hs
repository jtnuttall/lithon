{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Video.Safe (
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetNumVideoDrivers,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetVideoDriver,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetCurrentVideoDriver,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetSystemTheme,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDisplays,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetPrimaryDisplay,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDisplayProperties,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDisplayName,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDisplayBounds,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDisplayUsableBounds,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetNaturalDisplayOrientation,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetCurrentDisplayOrientation,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDisplayContentScale,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetFullscreenDisplayModes,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetClosestFullscreenDisplayMode,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDesktopDisplayMode,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetCurrentDisplayMode,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDisplayForPoint,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDisplayForRect,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetDisplayForWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowPixelDensity,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowDisplayScale,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowFullscreenMode,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowFullscreenMode,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowICCProfile,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowPixelFormat,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindows,
  SDL3.Sys.Bindgen.Video.Safe.sDL_CreateWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_CreatePopupWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_CreateWindowWithProperties,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowID,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowFromID,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowParent,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowProperties,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowFlags,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowTitle,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowTitle,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowIcon,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowPosition,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowPosition,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowSize,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowSize,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowSafeArea,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowAspectRatio,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowAspectRatio,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowBordersSize,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowSizeInPixels,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowMinimumSize,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowMinimumSize,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowMaximumSize,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowMaximumSize,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowBordered,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowResizable,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowAlwaysOnTop,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowFillDocument,
  SDL3.Sys.Bindgen.Video.Safe.sDL_ShowWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_HideWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_RaiseWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_MaximizeWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_MinimizeWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_RestoreWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowFullscreen,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SyncWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_WindowHasSurface,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowSurface,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowSurfaceVSync,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowSurfaceVSync,
  SDL3.Sys.Bindgen.Video.Safe.sDL_UpdateWindowSurface,
  SDL3.Sys.Bindgen.Video.Safe.sDL_UpdateWindowSurfaceRects,
  SDL3.Sys.Bindgen.Video.Safe.sDL_DestroyWindowSurface,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowKeyboardGrab,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowMouseGrab,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowKeyboardGrab,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowMouseGrab,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetGrabbedWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowMouseRect,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowMouseRect,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowOpacity,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowOpacity,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowParent,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowModal,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowFocusable,
  SDL3.Sys.Bindgen.Video.Safe.sDL_ShowWindowSystemMenu,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowHitTest,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowShape,
  SDL3.Sys.Bindgen.Video.Safe.sDL_FlashWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowProgressState,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowProgressState,
  SDL3.Sys.Bindgen.Video.Safe.sDL_SetWindowProgressValue,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GetWindowProgressValue,
  SDL3.Sys.Bindgen.Video.Safe.sDL_DestroyWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_ScreenSaverEnabled,
  SDL3.Sys.Bindgen.Video.Safe.sDL_EnableScreenSaver,
  SDL3.Sys.Bindgen.Video.Safe.sDL_DisableScreenSaver,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_LoadLibrary,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_GetProcAddress,
  SDL3.Sys.Bindgen.Video.Safe.sDL_EGL_GetProcAddress,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_UnloadLibrary,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_ExtensionSupported,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_ResetAttributes,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_SetAttribute,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_GetAttribute,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_CreateContext,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_MakeCurrent,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_GetCurrentWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_GetCurrentContext,
  SDL3.Sys.Bindgen.Video.Safe.sDL_EGL_GetCurrentDisplay,
  SDL3.Sys.Bindgen.Video.Safe.sDL_EGL_GetCurrentConfig,
  SDL3.Sys.Bindgen.Video.Safe.sDL_EGL_GetWindowSurface,
  SDL3.Sys.Bindgen.Video.Safe.sDL_EGL_SetAttributeCallbacks,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_SetSwapInterval,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_GetSwapInterval,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_SwapWindow,
  SDL3.Sys.Bindgen.Video.Safe.sDL_GL_DestroyContext,
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
         , "signed int hs_bindgen_d211f6b04304439b (void)"
         , "{"
         , "  return (SDL_GetNumVideoDrivers)();"
         , "}"
         , "char const *hs_bindgen_307dbfd833225e2d ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GetVideoDriver)(arg1);"
         , "}"
         , "char const *hs_bindgen_efdaa516c2ee9810 (void)"
         , "{"
         , "  return (SDL_GetCurrentVideoDriver)();"
         , "}"
         , "SDL_SystemTheme hs_bindgen_d4ea00696b1a71bf (void)"
         , "{"
         , "  return (SDL_GetSystemTheme)();"
         , "}"
         , "SDL_DisplayID *hs_bindgen_d92afc43a12fbe95 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplays)(arg1);"
         , "}"
         , "SDL_DisplayID hs_bindgen_b8bacdf537be3b8f (void)"
         , "{"
         , "  return (SDL_GetPrimaryDisplay)();"
         , "}"
         , "SDL_PropertiesID hs_bindgen_d5cb0d5646844e17 ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayProperties)(arg1);"
         , "}"
         , "char const *hs_bindgen_e9e9e841de7ccf5b ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayName)(arg1);"
         , "}"
         , "_Bool hs_bindgen_2de4b5a02136502b ("
         , "  SDL_DisplayID arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayBounds)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ff1aeb910a17f8ef ("
         , "  SDL_DisplayID arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayUsableBounds)(arg1, arg2);"
         , "}"
         , "SDL_DisplayOrientation hs_bindgen_a526ef31b456159e ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetNaturalDisplayOrientation)(arg1);"
         , "}"
         , "SDL_DisplayOrientation hs_bindgen_51800c9c70250d96 ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCurrentDisplayOrientation)(arg1);"
         , "}"
         , "float hs_bindgen_bf2419cb99d8f412 ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayContentScale)(arg1);"
         , "}"
         , "SDL_DisplayMode **hs_bindgen_4662ea5b5904a3f7 ("
         , "  SDL_DisplayID arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetFullscreenDisplayModes)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_5d464dea0236acd5 ("
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
         , "SDL_DisplayMode const *hs_bindgen_dba50a660cc82b9f ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDesktopDisplayMode)(arg1);"
         , "}"
         , "SDL_DisplayMode const *hs_bindgen_4430016da3318782 ("
         , "  SDL_DisplayID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetCurrentDisplayMode)(arg1);"
         , "}"
         , "SDL_DisplayID hs_bindgen_e084554bb0ca9dc4 ("
         , "  SDL_Point const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayForPoint)(arg1);"
         , "}"
         , "SDL_DisplayID hs_bindgen_50432f887d92198e ("
         , "  SDL_Rect const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayForRect)(arg1);"
         , "}"
         , "SDL_DisplayID hs_bindgen_338231bd9673a8d7 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetDisplayForWindow)(arg1);"
         , "}"
         , "float hs_bindgen_c660a5f73943853a ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowPixelDensity)(arg1);"
         , "}"
         , "float hs_bindgen_830868f00a2186dd ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowDisplayScale)(arg1);"
         , "}"
         , "_Bool hs_bindgen_5bd56762b4e281bc ("
         , "  SDL_Window *arg1,"
         , "  SDL_DisplayMode const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowFullscreenMode)(arg1, arg2);"
         , "}"
         , "SDL_DisplayMode const *hs_bindgen_75a4cc980febe857 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowFullscreenMode)(arg1);"
         , "}"
         , "void *hs_bindgen_7312928923ad5425 ("
         , "  SDL_Window *arg1,"
         , "  size_t *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetWindowICCProfile)(arg1, arg2);"
         , "}"
         , "SDL_PixelFormat hs_bindgen_15580e3d1d0e9b89 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowPixelFormat)(arg1);"
         , "}"
         , "SDL_Window **hs_bindgen_6428ebf130092b37 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindows)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_8e424f740acbd80f ("
         , "  char const *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  SDL_WindowFlags arg4"
         , ")"
         , "{"
         , "  return (SDL_CreateWindow)(arg1, arg2, arg3, arg4);"
         , "}"
         , "SDL_Window *hs_bindgen_19b8bc2bc6b5cfae ("
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
         , "SDL_Window *hs_bindgen_a9c16b7c7380ac75 ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateWindowWithProperties)(arg1);"
         , "}"
         , "SDL_WindowID hs_bindgen_667e66cbe1d6489b ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowID)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_18346477e6758df9 ("
         , "  SDL_WindowID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowFromID)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_2d39d8129359a89b ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowParent)(arg1);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_57b7ab5cd9801744 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowProperties)(arg1);"
         , "}"
         , "SDL_WindowFlags hs_bindgen_99baf1d6e8b1ddeb ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowFlags)(arg1);"
         , "}"
         , "_Bool hs_bindgen_54f765221fc62cf4 ("
         , "  SDL_Window *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowTitle)(arg1, arg2);"
         , "}"
         , "char const *hs_bindgen_b3fe38980dd2012e ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowTitle)(arg1);"
         , "}"
         , "_Bool hs_bindgen_3ba2e8e7085b0cc8 ("
         , "  SDL_Window *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowIcon)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_5267578336028cc0 ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowPosition)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_cbc04f11ecff82d4 ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowPosition)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_463917e130d8e442 ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_31fa46c3424e203c ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_b2567486cc8ef384 ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSafeArea)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_4718fa8444201efc ("
         , "  SDL_Window *arg1,"
         , "  float arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowAspectRatio)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_b91e4ae738b99383 ("
         , "  SDL_Window *arg1,"
         , "  float *arg2,"
         , "  float *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowAspectRatio)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_1a0014cc2d5e995b ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3,"
         , "  signed int *arg4,"
         , "  signed int *arg5"
         , ")"
         , "{"
         , "  return (SDL_GetWindowBordersSize)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_30e760d14c134b4b ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSizeInPixels)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_f0719ee9bdadb864 ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowMinimumSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_8673ac2cc36b8fce ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowMinimumSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_8b1eeeed1710ce2d ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowMaximumSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_48e1ff926a106d78 ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetWindowMaximumSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_1fc2a3e35dc5c047 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowBordered)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_602617d3d8b24265 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowResizable)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_1ca9fa2de9450921 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowAlwaysOnTop)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_4de8e5711e0b8b35 ("
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
         , "_Bool hs_bindgen_db90afdec297ac45 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_ShowWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_151dd0c79f668116 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_HideWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_f3eab79ea97d0a96 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_RaiseWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_4702fc373b7a0194 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_MaximizeWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_740052b61f66d8b0 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_MinimizeWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_26d521828ca2c776 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_RestoreWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_b364407ada14e440 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowFullscreen)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_5fa6f076247f8fc0 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_SyncWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_0094e6c8474f41c7 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_WindowHasSurface)(arg1);"
         , "}"
         , "SDL_Surface *hs_bindgen_3935adead4d3fc9e ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSurface)(arg1);"
         , "}"
         , "_Bool hs_bindgen_352d147569a3861c ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowSurfaceVSync)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_faa1386f6baf8835 ("
         , "  SDL_Window *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetWindowSurfaceVSync)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_2865506d5d1ebc1d ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_UpdateWindowSurface)(arg1);"
         , "}"
         , "_Bool hs_bindgen_9f52950557ec570d ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_UpdateWindowSurfaceRects)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_281f842dd1d64c24 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_DestroyWindowSurface)(arg1);"
         , "}"
         , "_Bool hs_bindgen_9810610308d37d7a ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowKeyboardGrab)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_d76ad355e95647e6 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowMouseGrab)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_d6cecb629e2e4cf1 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowKeyboardGrab)(arg1);"
         , "}"
         , "_Bool hs_bindgen_c4a10336d87afa11 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowMouseGrab)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_dc47f3dead3a7c4c (void)"
         , "{"
         , "  return (SDL_GetGrabbedWindow)();"
         , "}"
         , "_Bool hs_bindgen_cea803a34ce672ab ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowMouseRect)(arg1, arg2);"
         , "}"
         , "SDL_Rect const *hs_bindgen_20aa207b179a0f01 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowMouseRect)(arg1);"
         , "}"
         , "_Bool hs_bindgen_8604a41f1b752f5d ("
         , "  SDL_Window *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowOpacity)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_3101cb57bb822dd1 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowOpacity)(arg1);"
         , "}"
         , "_Bool hs_bindgen_1cc8b9ab8edf00bb ("
         , "  SDL_Window *arg1,"
         , "  SDL_Window *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowParent)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_6a6cf75fb3644441 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowModal)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b8c33cea6b55cf17 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowFocusable)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ce10733e3b7a4ffa ("
         , "  SDL_Window *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_ShowWindowSystemMenu)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_9639f427d08bb73e ("
         , "  SDL_Window *arg1,"
         , "  SDL_HitTest arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_SetWindowHitTest)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_ed6846899beda7ab ("
         , "  SDL_Window *arg1,"
         , "  SDL_Surface *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowShape)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_e1ccf70cb57d0520 ("
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
         , "_Bool hs_bindgen_5b04ab3d00de3188 ("
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
         , "SDL_ProgressState hs_bindgen_f0c456909c3f00e4 ("
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
         , "_Bool hs_bindgen_61b3840500263851 ("
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
         , "float hs_bindgen_11c3352b21aa2799 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_GetWindowProgressValue)(arg1);"
         , "#else"
         , "  (void)arg1; SDL_SetError(\"SDL_GetWindowProgressValue requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "void hs_bindgen_b3962b19443d34da ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_84c0659acf0fe2dc (void)"
         , "{"
         , "  return (SDL_ScreenSaverEnabled)();"
         , "}"
         , "_Bool hs_bindgen_166142199f6402d0 (void)"
         , "{"
         , "  return (SDL_EnableScreenSaver)();"
         , "}"
         , "_Bool hs_bindgen_83a7f8efb2c664c5 (void)"
         , "{"
         , "  return (SDL_DisableScreenSaver)();"
         , "}"
         , "_Bool hs_bindgen_c47d12c66f8cfd5c ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_LoadLibrary)(arg1);"
         , "}"
         , "SDL_FunctionPointer hs_bindgen_e435ceb0289a8035 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_GetProcAddress)(arg1);"
         , "}"
         , "SDL_FunctionPointer hs_bindgen_894763e4be5fe96f ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_EGL_GetProcAddress)(arg1);"
         , "}"
         , "void hs_bindgen_88c7a6f4d6a9b36e (void)"
         , "{"
         , "  (SDL_GL_UnloadLibrary)();"
         , "}"
         , "_Bool hs_bindgen_d8ad3d720e0d97e4 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_ExtensionSupported)(arg1);"
         , "}"
         , "void hs_bindgen_0e89b220270eca27 (void)"
         , "{"
         , "  (SDL_GL_ResetAttributes)();"
         , "}"
         , "_Bool hs_bindgen_6a7a5b133a68dc0f ("
         , "  SDL_GLAttr arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_GL_SetAttribute)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_a558edf739642b48 ("
         , "  SDL_GLAttr arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GL_GetAttribute)(arg1, arg2);"
         , "}"
         , "SDL_GLContext hs_bindgen_7a22bf48d0f84507 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_CreateContext)(arg1);"
         , "}"
         , "_Bool hs_bindgen_ff7daec2405dfb35 ("
         , "  SDL_Window *arg1,"
         , "  SDL_GLContext arg2"
         , ")"
         , "{"
         , "  return (SDL_GL_MakeCurrent)(arg1, arg2);"
         , "}"
         , "SDL_Window *hs_bindgen_6eb4d946a4d2ae7b (void)"
         , "{"
         , "  return (SDL_GL_GetCurrentWindow)();"
         , "}"
         , "SDL_GLContext hs_bindgen_c32923dac368266d (void)"
         , "{"
         , "  return (SDL_GL_GetCurrentContext)();"
         , "}"
         , "SDL_EGLDisplay hs_bindgen_19cd590b75a39bcc (void)"
         , "{"
         , "  return (SDL_EGL_GetCurrentDisplay)();"
         , "}"
         , "SDL_EGLConfig hs_bindgen_652c87a58c2fcc27 (void)"
         , "{"
         , "  return (SDL_EGL_GetCurrentConfig)();"
         , "}"
         , "SDL_EGLSurface hs_bindgen_a7fa1925e88a0d07 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_EGL_GetWindowSurface)(arg1);"
         , "}"
         , "void hs_bindgen_5095f621e48adf13 ("
         , "  SDL_EGLAttribArrayCallback arg1,"
         , "  SDL_EGLIntArrayCallback arg2,"
         , "  SDL_EGLIntArrayCallback arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  (SDL_EGL_SetAttributeCallbacks)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_32295faebc369c7a ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_SetSwapInterval)(arg1);"
         , "}"
         , "_Bool hs_bindgen_04719e6e434557d3 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_GetSwapInterval)(arg1);"
         , "}"
         , "_Bool hs_bindgen_1d8b57ab49fbefc1 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_SwapWindow)(arg1);"
         , "}"
         , "_Bool hs_bindgen_7da107ca01a650af ("
         , "  SDL_GLContext arg1"
         , ")"
         , "{"
         , "  return (SDL_GL_DestroyContext)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetNumVideoDrivers@
foreign import ccall safe "hs_bindgen_d211f6b04304439b"
  hs_bindgen_d211f6b04304439b_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetNumVideoDrivers@
hs_bindgen_d211f6b04304439b :: IO BG.CInt
hs_bindgen_d211f6b04304439b =
  BG.fromFFIType hs_bindgen_d211f6b04304439b_base

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
sDL_GetNumVideoDrivers = hs_bindgen_d211f6b04304439b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetVideoDriver@
foreign import ccall safe "hs_bindgen_307dbfd833225e2d"
  hs_bindgen_307dbfd833225e2d_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetVideoDriver@
hs_bindgen_307dbfd833225e2d
  :: BG.CInt
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_307dbfd833225e2d =
  BG.fromFFIType hs_bindgen_307dbfd833225e2d_base

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
sDL_GetVideoDriver = hs_bindgen_307dbfd833225e2d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetCurrentVideoDriver@
foreign import ccall safe "hs_bindgen_efdaa516c2ee9810"
  hs_bindgen_efdaa516c2ee9810_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetCurrentVideoDriver@
hs_bindgen_efdaa516c2ee9810 :: IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_efdaa516c2ee9810 =
  BG.fromFFIType hs_bindgen_efdaa516c2ee9810_base

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
  hs_bindgen_efdaa516c2ee9810

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetSystemTheme@
foreign import ccall safe "hs_bindgen_d4ea00696b1a71bf"
  hs_bindgen_d4ea00696b1a71bf_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetSystemTheme@
hs_bindgen_d4ea00696b1a71bf :: IO SDL_SystemTheme
hs_bindgen_d4ea00696b1a71bf =
  BG.fromFFIType hs_bindgen_d4ea00696b1a71bf_base

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
sDL_GetSystemTheme = hs_bindgen_d4ea00696b1a71bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplays@
foreign import ccall safe "hs_bindgen_d92afc43a12fbe95"
  hs_bindgen_d92afc43a12fbe95_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplays@
hs_bindgen_d92afc43a12fbe95
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_DisplayID)
hs_bindgen_d92afc43a12fbe95 =
  BG.fromFFIType hs_bindgen_d92afc43a12fbe95_base

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
sDL_GetDisplays = hs_bindgen_d92afc43a12fbe95

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetPrimaryDisplay@
foreign import ccall safe "hs_bindgen_b8bacdf537be3b8f"
  hs_bindgen_b8bacdf537be3b8f_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetPrimaryDisplay@
hs_bindgen_b8bacdf537be3b8f :: IO SDL_DisplayID
hs_bindgen_b8bacdf537be3b8f =
  BG.fromFFIType hs_bindgen_b8bacdf537be3b8f_base

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
sDL_GetPrimaryDisplay = hs_bindgen_b8bacdf537be3b8f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayProperties@
foreign import ccall safe "hs_bindgen_d5cb0d5646844e17"
  hs_bindgen_d5cb0d5646844e17_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayProperties@
hs_bindgen_d5cb0d5646844e17
  :: SDL_DisplayID
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_d5cb0d5646844e17 =
  BG.fromFFIType hs_bindgen_d5cb0d5646844e17_base

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
  hs_bindgen_d5cb0d5646844e17

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayName@
foreign import ccall safe "hs_bindgen_e9e9e841de7ccf5b"
  hs_bindgen_e9e9e841de7ccf5b_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayName@
hs_bindgen_e9e9e841de7ccf5b
  :: SDL_DisplayID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_e9e9e841de7ccf5b =
  BG.fromFFIType hs_bindgen_e9e9e841de7ccf5b_base

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
sDL_GetDisplayName = hs_bindgen_e9e9e841de7ccf5b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayBounds@
foreign import ccall safe "hs_bindgen_2de4b5a02136502b"
  hs_bindgen_2de4b5a02136502b_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayBounds@
hs_bindgen_2de4b5a02136502b
  :: SDL_DisplayID
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_2de4b5a02136502b =
  BG.fromFFIType hs_bindgen_2de4b5a02136502b_base

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
sDL_GetDisplayBounds = hs_bindgen_2de4b5a02136502b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayUsableBounds@
foreign import ccall safe "hs_bindgen_ff1aeb910a17f8ef"
  hs_bindgen_ff1aeb910a17f8ef_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayUsableBounds@
hs_bindgen_ff1aeb910a17f8ef
  :: SDL_DisplayID
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_ff1aeb910a17f8ef =
  BG.fromFFIType hs_bindgen_ff1aeb910a17f8ef_base

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
  hs_bindgen_ff1aeb910a17f8ef

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetNaturalDisplayOrientation@
foreign import ccall safe "hs_bindgen_a526ef31b456159e"
  hs_bindgen_a526ef31b456159e_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetNaturalDisplayOrientation@
hs_bindgen_a526ef31b456159e
  :: SDL_DisplayID
  -> IO SDL_DisplayOrientation
hs_bindgen_a526ef31b456159e =
  BG.fromFFIType hs_bindgen_a526ef31b456159e_base

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
  hs_bindgen_a526ef31b456159e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetCurrentDisplayOrientation@
foreign import ccall safe "hs_bindgen_51800c9c70250d96"
  hs_bindgen_51800c9c70250d96_base
    :: BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetCurrentDisplayOrientation@
hs_bindgen_51800c9c70250d96
  :: SDL_DisplayID
  -> IO SDL_DisplayOrientation
hs_bindgen_51800c9c70250d96 =
  BG.fromFFIType hs_bindgen_51800c9c70250d96_base

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
  hs_bindgen_51800c9c70250d96

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayContentScale@
foreign import ccall safe "hs_bindgen_bf2419cb99d8f412"
  hs_bindgen_bf2419cb99d8f412_base
    :: BG.Word32
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayContentScale@
hs_bindgen_bf2419cb99d8f412
  :: SDL_DisplayID
  -> IO BG.CFloat
hs_bindgen_bf2419cb99d8f412 =
  BG.fromFFIType hs_bindgen_bf2419cb99d8f412_base

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
  hs_bindgen_bf2419cb99d8f412

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetFullscreenDisplayModes@
foreign import ccall safe "hs_bindgen_4662ea5b5904a3f7"
  hs_bindgen_4662ea5b5904a3f7_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetFullscreenDisplayModes@
hs_bindgen_4662ea5b5904a3f7
  :: SDL_DisplayID
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr SDL_DisplayMode))
hs_bindgen_4662ea5b5904a3f7 =
  BG.fromFFIType hs_bindgen_4662ea5b5904a3f7_base

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
  hs_bindgen_4662ea5b5904a3f7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetClosestFullscreenDisplayMode@
foreign import ccall safe "hs_bindgen_5d464dea0236acd5"
  hs_bindgen_5d464dea0236acd5_base
    :: BG.Word32
    -> BG.Int32
    -> BG.Int32
    -> Float
    -> BG.Word8
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetClosestFullscreenDisplayMode@
hs_bindgen_5d464dea0236acd5
  :: SDL_DisplayID
  -> BG.CInt
  -> BG.CInt
  -> BG.CFloat
  -> BG.CBool
  -> BG.Ptr SDL_DisplayMode
  -> IO BG.CBool
hs_bindgen_5d464dea0236acd5 =
  BG.fromFFIType hs_bindgen_5d464dea0236acd5_base

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
  hs_bindgen_5d464dea0236acd5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDesktopDisplayMode@
foreign import ccall safe "hs_bindgen_dba50a660cc82b9f"
  hs_bindgen_dba50a660cc82b9f_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDesktopDisplayMode@
hs_bindgen_dba50a660cc82b9f
  :: SDL_DisplayID
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
hs_bindgen_dba50a660cc82b9f =
  BG.fromFFIType hs_bindgen_dba50a660cc82b9f_base

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
  hs_bindgen_dba50a660cc82b9f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetCurrentDisplayMode@
foreign import ccall safe "hs_bindgen_4430016da3318782"
  hs_bindgen_4430016da3318782_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetCurrentDisplayMode@
hs_bindgen_4430016da3318782
  :: SDL_DisplayID
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
hs_bindgen_4430016da3318782 =
  BG.fromFFIType hs_bindgen_4430016da3318782_base

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
  hs_bindgen_4430016da3318782

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayForPoint@
foreign import ccall safe "hs_bindgen_e084554bb0ca9dc4"
  hs_bindgen_e084554bb0ca9dc4_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayForPoint@
hs_bindgen_e084554bb0ca9dc4
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point
  -> IO SDL_DisplayID
hs_bindgen_e084554bb0ca9dc4 =
  BG.fromFFIType hs_bindgen_e084554bb0ca9dc4_base

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
sDL_GetDisplayForPoint = hs_bindgen_e084554bb0ca9dc4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayForRect@
foreign import ccall safe "hs_bindgen_50432f887d92198e"
  hs_bindgen_50432f887d92198e_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayForRect@
hs_bindgen_50432f887d92198e
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO SDL_DisplayID
hs_bindgen_50432f887d92198e =
  BG.fromFFIType hs_bindgen_50432f887d92198e_base

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
sDL_GetDisplayForRect = hs_bindgen_50432f887d92198e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayForWindow@
foreign import ccall safe "hs_bindgen_338231bd9673a8d7"
  hs_bindgen_338231bd9673a8d7_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetDisplayForWindow@
hs_bindgen_338231bd9673a8d7
  :: BG.Ptr SDL_Window
  -> IO SDL_DisplayID
hs_bindgen_338231bd9673a8d7 =
  BG.fromFFIType hs_bindgen_338231bd9673a8d7_base

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
sDL_GetDisplayForWindow = hs_bindgen_338231bd9673a8d7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowPixelDensity@
foreign import ccall safe "hs_bindgen_c660a5f73943853a"
  hs_bindgen_c660a5f73943853a_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowPixelDensity@
hs_bindgen_c660a5f73943853a
  :: BG.Ptr SDL_Window
  -> IO BG.CFloat
hs_bindgen_c660a5f73943853a =
  BG.fromFFIType hs_bindgen_c660a5f73943853a_base

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
  hs_bindgen_c660a5f73943853a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowDisplayScale@
foreign import ccall safe "hs_bindgen_830868f00a2186dd"
  hs_bindgen_830868f00a2186dd_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowDisplayScale@
hs_bindgen_830868f00a2186dd
  :: BG.Ptr SDL_Window
  -> IO BG.CFloat
hs_bindgen_830868f00a2186dd =
  BG.fromFFIType hs_bindgen_830868f00a2186dd_base

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
  hs_bindgen_830868f00a2186dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowFullscreenMode@
foreign import ccall safe "hs_bindgen_5bd56762b4e281bc"
  hs_bindgen_5bd56762b4e281bc_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowFullscreenMode@
hs_bindgen_5bd56762b4e281bc
  :: BG.Ptr SDL_Window
  -> PtrConst.PtrConst SDL_DisplayMode
  -> IO BG.CBool
hs_bindgen_5bd56762b4e281bc =
  BG.fromFFIType hs_bindgen_5bd56762b4e281bc_base

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
  hs_bindgen_5bd56762b4e281bc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowFullscreenMode@
foreign import ccall safe "hs_bindgen_75a4cc980febe857"
  hs_bindgen_75a4cc980febe857_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowFullscreenMode@
hs_bindgen_75a4cc980febe857
  :: BG.Ptr SDL_Window
  -> IO (PtrConst.PtrConst SDL_DisplayMode)
hs_bindgen_75a4cc980febe857 =
  BG.fromFFIType hs_bindgen_75a4cc980febe857_base

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
  hs_bindgen_75a4cc980febe857

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowICCProfile@
foreign import ccall safe "hs_bindgen_7312928923ad5425"
  hs_bindgen_7312928923ad5425_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowICCProfile@
hs_bindgen_7312928923ad5425
  :: BG.Ptr SDL_Window
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.Void)
hs_bindgen_7312928923ad5425 =
  BG.fromFFIType hs_bindgen_7312928923ad5425_base

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
sDL_GetWindowICCProfile = hs_bindgen_7312928923ad5425

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowPixelFormat@
foreign import ccall safe "hs_bindgen_15580e3d1d0e9b89"
  hs_bindgen_15580e3d1d0e9b89_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowPixelFormat@
hs_bindgen_15580e3d1d0e9b89
  :: BG.Ptr SDL_Window
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
hs_bindgen_15580e3d1d0e9b89 =
  BG.fromFFIType hs_bindgen_15580e3d1d0e9b89_base

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
  hs_bindgen_15580e3d1d0e9b89

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindows@
foreign import ccall safe "hs_bindgen_6428ebf130092b37"
  hs_bindgen_6428ebf130092b37_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindows@
hs_bindgen_6428ebf130092b37
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr SDL_Window))
hs_bindgen_6428ebf130092b37 =
  BG.fromFFIType hs_bindgen_6428ebf130092b37_base

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
sDL_GetWindows = hs_bindgen_6428ebf130092b37

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_CreateWindow@
foreign import ccall safe "hs_bindgen_8e424f740acbd80f"
  hs_bindgen_8e424f740acbd80f_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_CreateWindow@
hs_bindgen_8e424f740acbd80f
  :: PtrConst.PtrConst BG.CChar
  -> BG.CInt
  -> BG.CInt
  -> SDL_WindowFlags
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_8e424f740acbd80f =
  BG.fromFFIType hs_bindgen_8e424f740acbd80f_base

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
sDL_CreateWindow = hs_bindgen_8e424f740acbd80f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_CreatePopupWindow@
foreign import ccall safe "hs_bindgen_19b8bc2bc6b5cfae"
  hs_bindgen_19b8bc2bc6b5cfae_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_CreatePopupWindow@
hs_bindgen_19b8bc2bc6b5cfae
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> SDL_WindowFlags
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_19b8bc2bc6b5cfae =
  BG.fromFFIType hs_bindgen_19b8bc2bc6b5cfae_base

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
sDL_CreatePopupWindow = hs_bindgen_19b8bc2bc6b5cfae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_CreateWindowWithProperties@
foreign import ccall safe "hs_bindgen_a9c16b7c7380ac75"
  hs_bindgen_a9c16b7c7380ac75_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_CreateWindowWithProperties@
hs_bindgen_a9c16b7c7380ac75
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_a9c16b7c7380ac75 =
  BG.fromFFIType hs_bindgen_a9c16b7c7380ac75_base

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
  hs_bindgen_a9c16b7c7380ac75

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowID@
foreign import ccall safe "hs_bindgen_667e66cbe1d6489b"
  hs_bindgen_667e66cbe1d6489b_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowID@
hs_bindgen_667e66cbe1d6489b
  :: BG.Ptr SDL_Window
  -> IO SDL_WindowID
hs_bindgen_667e66cbe1d6489b =
  BG.fromFFIType hs_bindgen_667e66cbe1d6489b_base

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
sDL_GetWindowID = hs_bindgen_667e66cbe1d6489b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowFromID@
foreign import ccall safe "hs_bindgen_18346477e6758df9"
  hs_bindgen_18346477e6758df9_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowFromID@
hs_bindgen_18346477e6758df9
  :: SDL_WindowID
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_18346477e6758df9 =
  BG.fromFFIType hs_bindgen_18346477e6758df9_base

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
sDL_GetWindowFromID = hs_bindgen_18346477e6758df9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowParent@
foreign import ccall safe "hs_bindgen_2d39d8129359a89b"
  hs_bindgen_2d39d8129359a89b_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowParent@
hs_bindgen_2d39d8129359a89b
  :: BG.Ptr SDL_Window
  -> IO (BG.Ptr SDL_Window)
hs_bindgen_2d39d8129359a89b =
  BG.fromFFIType hs_bindgen_2d39d8129359a89b_base

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
sDL_GetWindowParent = hs_bindgen_2d39d8129359a89b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowProperties@
foreign import ccall safe "hs_bindgen_57b7ab5cd9801744"
  hs_bindgen_57b7ab5cd9801744_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowProperties@
hs_bindgen_57b7ab5cd9801744
  :: BG.Ptr SDL_Window
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_57b7ab5cd9801744 =
  BG.fromFFIType hs_bindgen_57b7ab5cd9801744_base

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
sDL_GetWindowProperties = hs_bindgen_57b7ab5cd9801744

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowFlags@
foreign import ccall safe "hs_bindgen_99baf1d6e8b1ddeb"
  hs_bindgen_99baf1d6e8b1ddeb_base
    :: BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowFlags@
hs_bindgen_99baf1d6e8b1ddeb
  :: BG.Ptr SDL_Window
  -> IO SDL_WindowFlags
hs_bindgen_99baf1d6e8b1ddeb =
  BG.fromFFIType hs_bindgen_99baf1d6e8b1ddeb_base

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
sDL_GetWindowFlags = hs_bindgen_99baf1d6e8b1ddeb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowTitle@
foreign import ccall safe "hs_bindgen_54f765221fc62cf4"
  hs_bindgen_54f765221fc62cf4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowTitle@
hs_bindgen_54f765221fc62cf4
  :: BG.Ptr SDL_Window
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_54f765221fc62cf4 =
  BG.fromFFIType hs_bindgen_54f765221fc62cf4_base

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
sDL_SetWindowTitle = hs_bindgen_54f765221fc62cf4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowTitle@
foreign import ccall safe "hs_bindgen_b3fe38980dd2012e"
  hs_bindgen_b3fe38980dd2012e_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowTitle@
hs_bindgen_b3fe38980dd2012e
  :: BG.Ptr SDL_Window
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_b3fe38980dd2012e =
  BG.fromFFIType hs_bindgen_b3fe38980dd2012e_base

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
sDL_GetWindowTitle = hs_bindgen_b3fe38980dd2012e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowIcon@
foreign import ccall safe "hs_bindgen_3ba2e8e7085b0cc8"
  hs_bindgen_3ba2e8e7085b0cc8_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowIcon@
hs_bindgen_3ba2e8e7085b0cc8
  :: BG.Ptr SDL_Window
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO BG.CBool
hs_bindgen_3ba2e8e7085b0cc8 =
  BG.fromFFIType hs_bindgen_3ba2e8e7085b0cc8_base

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
sDL_SetWindowIcon = hs_bindgen_3ba2e8e7085b0cc8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowPosition@
foreign import ccall safe "hs_bindgen_5267578336028cc0"
  hs_bindgen_5267578336028cc0_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowPosition@
hs_bindgen_5267578336028cc0
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_5267578336028cc0 =
  BG.fromFFIType hs_bindgen_5267578336028cc0_base

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
sDL_SetWindowPosition = hs_bindgen_5267578336028cc0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowPosition@
foreign import ccall safe "hs_bindgen_cbc04f11ecff82d4"
  hs_bindgen_cbc04f11ecff82d4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowPosition@
hs_bindgen_cbc04f11ecff82d4
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_cbc04f11ecff82d4 =
  BG.fromFFIType hs_bindgen_cbc04f11ecff82d4_base

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
sDL_GetWindowPosition = hs_bindgen_cbc04f11ecff82d4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowSize@
foreign import ccall safe "hs_bindgen_463917e130d8e442"
  hs_bindgen_463917e130d8e442_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowSize@
hs_bindgen_463917e130d8e442
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_463917e130d8e442 =
  BG.fromFFIType hs_bindgen_463917e130d8e442_base

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
sDL_SetWindowSize = hs_bindgen_463917e130d8e442

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSize@
foreign import ccall safe "hs_bindgen_31fa46c3424e203c"
  hs_bindgen_31fa46c3424e203c_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSize@
hs_bindgen_31fa46c3424e203c
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_31fa46c3424e203c =
  BG.fromFFIType hs_bindgen_31fa46c3424e203c_base

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
sDL_GetWindowSize = hs_bindgen_31fa46c3424e203c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSafeArea@
foreign import ccall safe "hs_bindgen_b2567486cc8ef384"
  hs_bindgen_b2567486cc8ef384_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSafeArea@
hs_bindgen_b2567486cc8ef384
  :: BG.Ptr SDL_Window
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_b2567486cc8ef384 =
  BG.fromFFIType hs_bindgen_b2567486cc8ef384_base

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
sDL_GetWindowSafeArea = hs_bindgen_b2567486cc8ef384

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowAspectRatio@
foreign import ccall safe "hs_bindgen_4718fa8444201efc"
  hs_bindgen_4718fa8444201efc_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowAspectRatio@
hs_bindgen_4718fa8444201efc
  :: BG.Ptr SDL_Window
  -> BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_4718fa8444201efc =
  BG.fromFFIType hs_bindgen_4718fa8444201efc_base

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
  hs_bindgen_4718fa8444201efc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowAspectRatio@
foreign import ccall safe "hs_bindgen_b91e4ae738b99383"
  hs_bindgen_b91e4ae738b99383_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowAspectRatio@
hs_bindgen_b91e4ae738b99383
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO BG.CBool
hs_bindgen_b91e4ae738b99383 =
  BG.fromFFIType hs_bindgen_b91e4ae738b99383_base

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
  hs_bindgen_b91e4ae738b99383

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowBordersSize@
foreign import ccall safe "hs_bindgen_1a0014cc2d5e995b"
  hs_bindgen_1a0014cc2d5e995b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowBordersSize@
hs_bindgen_1a0014cc2d5e995b
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_1a0014cc2d5e995b =
  BG.fromFFIType hs_bindgen_1a0014cc2d5e995b_base

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
  hs_bindgen_1a0014cc2d5e995b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSizeInPixels@
foreign import ccall safe "hs_bindgen_30e760d14c134b4b"
  hs_bindgen_30e760d14c134b4b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSizeInPixels@
hs_bindgen_30e760d14c134b4b
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_30e760d14c134b4b =
  BG.fromFFIType hs_bindgen_30e760d14c134b4b_base

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
  hs_bindgen_30e760d14c134b4b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowMinimumSize@
foreign import ccall safe "hs_bindgen_f0719ee9bdadb864"
  hs_bindgen_f0719ee9bdadb864_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowMinimumSize@
hs_bindgen_f0719ee9bdadb864
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_f0719ee9bdadb864 =
  BG.fromFFIType hs_bindgen_f0719ee9bdadb864_base

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
  hs_bindgen_f0719ee9bdadb864

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowMinimumSize@
foreign import ccall safe "hs_bindgen_8673ac2cc36b8fce"
  hs_bindgen_8673ac2cc36b8fce_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowMinimumSize@
hs_bindgen_8673ac2cc36b8fce
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_8673ac2cc36b8fce =
  BG.fromFFIType hs_bindgen_8673ac2cc36b8fce_base

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
  hs_bindgen_8673ac2cc36b8fce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowMaximumSize@
foreign import ccall safe "hs_bindgen_8b1eeeed1710ce2d"
  hs_bindgen_8b1eeeed1710ce2d_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowMaximumSize@
hs_bindgen_8b1eeeed1710ce2d
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_8b1eeeed1710ce2d =
  BG.fromFFIType hs_bindgen_8b1eeeed1710ce2d_base

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
  hs_bindgen_8b1eeeed1710ce2d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowMaximumSize@
foreign import ccall safe "hs_bindgen_48e1ff926a106d78"
  hs_bindgen_48e1ff926a106d78_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowMaximumSize@
hs_bindgen_48e1ff926a106d78
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_48e1ff926a106d78 =
  BG.fromFFIType hs_bindgen_48e1ff926a106d78_base

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
  hs_bindgen_48e1ff926a106d78

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowBordered@
foreign import ccall safe "hs_bindgen_1fc2a3e35dc5c047"
  hs_bindgen_1fc2a3e35dc5c047_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowBordered@
hs_bindgen_1fc2a3e35dc5c047
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_1fc2a3e35dc5c047 =
  BG.fromFFIType hs_bindgen_1fc2a3e35dc5c047_base

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
sDL_SetWindowBordered = hs_bindgen_1fc2a3e35dc5c047

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowResizable@
foreign import ccall safe "hs_bindgen_602617d3d8b24265"
  hs_bindgen_602617d3d8b24265_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowResizable@
hs_bindgen_602617d3d8b24265
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_602617d3d8b24265 =
  BG.fromFFIType hs_bindgen_602617d3d8b24265_base

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
sDL_SetWindowResizable = hs_bindgen_602617d3d8b24265

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowAlwaysOnTop@
foreign import ccall safe "hs_bindgen_1ca9fa2de9450921"
  hs_bindgen_1ca9fa2de9450921_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowAlwaysOnTop@
hs_bindgen_1ca9fa2de9450921
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_1ca9fa2de9450921 =
  BG.fromFFIType hs_bindgen_1ca9fa2de9450921_base

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
  hs_bindgen_1ca9fa2de9450921

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowFillDocument@
foreign import ccall safe "hs_bindgen_4de8e5711e0b8b35"
  hs_bindgen_4de8e5711e0b8b35_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowFillDocument@
hs_bindgen_4de8e5711e0b8b35
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_4de8e5711e0b8b35 =
  BG.fromFFIType hs_bindgen_4de8e5711e0b8b35_base

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
  hs_bindgen_4de8e5711e0b8b35

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_ShowWindow@
foreign import ccall safe "hs_bindgen_db90afdec297ac45"
  hs_bindgen_db90afdec297ac45_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_ShowWindow@
hs_bindgen_db90afdec297ac45
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_db90afdec297ac45 =
  BG.fromFFIType hs_bindgen_db90afdec297ac45_base

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
sDL_ShowWindow = hs_bindgen_db90afdec297ac45

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_HideWindow@
foreign import ccall safe "hs_bindgen_151dd0c79f668116"
  hs_bindgen_151dd0c79f668116_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_HideWindow@
hs_bindgen_151dd0c79f668116
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_151dd0c79f668116 =
  BG.fromFFIType hs_bindgen_151dd0c79f668116_base

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
sDL_HideWindow = hs_bindgen_151dd0c79f668116

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_RaiseWindow@
foreign import ccall safe "hs_bindgen_f3eab79ea97d0a96"
  hs_bindgen_f3eab79ea97d0a96_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_RaiseWindow@
hs_bindgen_f3eab79ea97d0a96
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_f3eab79ea97d0a96 =
  BG.fromFFIType hs_bindgen_f3eab79ea97d0a96_base

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
sDL_RaiseWindow = hs_bindgen_f3eab79ea97d0a96

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_MaximizeWindow@
foreign import ccall safe "hs_bindgen_4702fc373b7a0194"
  hs_bindgen_4702fc373b7a0194_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_MaximizeWindow@
hs_bindgen_4702fc373b7a0194
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_4702fc373b7a0194 =
  BG.fromFFIType hs_bindgen_4702fc373b7a0194_base

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
sDL_MaximizeWindow = hs_bindgen_4702fc373b7a0194

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_MinimizeWindow@
foreign import ccall safe "hs_bindgen_740052b61f66d8b0"
  hs_bindgen_740052b61f66d8b0_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_MinimizeWindow@
hs_bindgen_740052b61f66d8b0
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_740052b61f66d8b0 =
  BG.fromFFIType hs_bindgen_740052b61f66d8b0_base

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
sDL_MinimizeWindow = hs_bindgen_740052b61f66d8b0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_RestoreWindow@
foreign import ccall safe "hs_bindgen_26d521828ca2c776"
  hs_bindgen_26d521828ca2c776_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_RestoreWindow@
hs_bindgen_26d521828ca2c776
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_26d521828ca2c776 =
  BG.fromFFIType hs_bindgen_26d521828ca2c776_base

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
sDL_RestoreWindow = hs_bindgen_26d521828ca2c776

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowFullscreen@
foreign import ccall safe "hs_bindgen_b364407ada14e440"
  hs_bindgen_b364407ada14e440_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowFullscreen@
hs_bindgen_b364407ada14e440
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_b364407ada14e440 =
  BG.fromFFIType hs_bindgen_b364407ada14e440_base

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
sDL_SetWindowFullscreen = hs_bindgen_b364407ada14e440

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SyncWindow@
foreign import ccall safe "hs_bindgen_5fa6f076247f8fc0"
  hs_bindgen_5fa6f076247f8fc0_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SyncWindow@
hs_bindgen_5fa6f076247f8fc0
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_5fa6f076247f8fc0 =
  BG.fromFFIType hs_bindgen_5fa6f076247f8fc0_base

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
sDL_SyncWindow = hs_bindgen_5fa6f076247f8fc0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_WindowHasSurface@
foreign import ccall safe "hs_bindgen_0094e6c8474f41c7"
  hs_bindgen_0094e6c8474f41c7_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_WindowHasSurface@
hs_bindgen_0094e6c8474f41c7
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_0094e6c8474f41c7 =
  BG.fromFFIType hs_bindgen_0094e6c8474f41c7_base

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
sDL_WindowHasSurface = hs_bindgen_0094e6c8474f41c7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSurface@
foreign import ccall safe "hs_bindgen_3935adead4d3fc9e"
  hs_bindgen_3935adead4d3fc9e_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSurface@
hs_bindgen_3935adead4d3fc9e
  :: BG.Ptr SDL_Window
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
hs_bindgen_3935adead4d3fc9e =
  BG.fromFFIType hs_bindgen_3935adead4d3fc9e_base

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
sDL_GetWindowSurface = hs_bindgen_3935adead4d3fc9e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowSurfaceVSync@
foreign import ccall safe "hs_bindgen_352d147569a3861c"
  hs_bindgen_352d147569a3861c_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowSurfaceVSync@
hs_bindgen_352d147569a3861c
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_352d147569a3861c =
  BG.fromFFIType hs_bindgen_352d147569a3861c_base

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
  hs_bindgen_352d147569a3861c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSurfaceVSync@
foreign import ccall safe "hs_bindgen_faa1386f6baf8835"
  hs_bindgen_faa1386f6baf8835_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowSurfaceVSync@
hs_bindgen_faa1386f6baf8835
  :: BG.Ptr SDL_Window
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_faa1386f6baf8835 =
  BG.fromFFIType hs_bindgen_faa1386f6baf8835_base

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
  hs_bindgen_faa1386f6baf8835

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_UpdateWindowSurface@
foreign import ccall safe "hs_bindgen_2865506d5d1ebc1d"
  hs_bindgen_2865506d5d1ebc1d_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_UpdateWindowSurface@
hs_bindgen_2865506d5d1ebc1d
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_2865506d5d1ebc1d =
  BG.fromFFIType hs_bindgen_2865506d5d1ebc1d_base

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
sDL_UpdateWindowSurface = hs_bindgen_2865506d5d1ebc1d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_UpdateWindowSurfaceRects@
foreign import ccall safe "hs_bindgen_9f52950557ec570d"
  hs_bindgen_9f52950557ec570d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_UpdateWindowSurfaceRects@
hs_bindgen_9f52950557ec570d
  :: BG.Ptr SDL_Window
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_9f52950557ec570d =
  BG.fromFFIType hs_bindgen_9f52950557ec570d_base

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
  hs_bindgen_9f52950557ec570d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_DestroyWindowSurface@
foreign import ccall safe "hs_bindgen_281f842dd1d64c24"
  hs_bindgen_281f842dd1d64c24_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_DestroyWindowSurface@
hs_bindgen_281f842dd1d64c24
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_281f842dd1d64c24 =
  BG.fromFFIType hs_bindgen_281f842dd1d64c24_base

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
  hs_bindgen_281f842dd1d64c24

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowKeyboardGrab@
foreign import ccall safe "hs_bindgen_9810610308d37d7a"
  hs_bindgen_9810610308d37d7a_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowKeyboardGrab@
hs_bindgen_9810610308d37d7a
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_9810610308d37d7a =
  BG.fromFFIType hs_bindgen_9810610308d37d7a_base

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
  hs_bindgen_9810610308d37d7a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowMouseGrab@
foreign import ccall safe "hs_bindgen_d76ad355e95647e6"
  hs_bindgen_d76ad355e95647e6_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowMouseGrab@
hs_bindgen_d76ad355e95647e6
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_d76ad355e95647e6 =
  BG.fromFFIType hs_bindgen_d76ad355e95647e6_base

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
sDL_SetWindowMouseGrab = hs_bindgen_d76ad355e95647e6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowKeyboardGrab@
foreign import ccall safe "hs_bindgen_d6cecb629e2e4cf1"
  hs_bindgen_d6cecb629e2e4cf1_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowKeyboardGrab@
hs_bindgen_d6cecb629e2e4cf1
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_d6cecb629e2e4cf1 =
  BG.fromFFIType hs_bindgen_d6cecb629e2e4cf1_base

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
  hs_bindgen_d6cecb629e2e4cf1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowMouseGrab@
foreign import ccall safe "hs_bindgen_c4a10336d87afa11"
  hs_bindgen_c4a10336d87afa11_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowMouseGrab@
hs_bindgen_c4a10336d87afa11
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_c4a10336d87afa11 =
  BG.fromFFIType hs_bindgen_c4a10336d87afa11_base

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
sDL_GetWindowMouseGrab = hs_bindgen_c4a10336d87afa11

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetGrabbedWindow@
foreign import ccall safe "hs_bindgen_dc47f3dead3a7c4c"
  hs_bindgen_dc47f3dead3a7c4c_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetGrabbedWindow@
hs_bindgen_dc47f3dead3a7c4c :: IO (BG.Ptr SDL_Window)
hs_bindgen_dc47f3dead3a7c4c =
  BG.fromFFIType hs_bindgen_dc47f3dead3a7c4c_base

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
sDL_GetGrabbedWindow = hs_bindgen_dc47f3dead3a7c4c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowMouseRect@
foreign import ccall safe "hs_bindgen_cea803a34ce672ab"
  hs_bindgen_cea803a34ce672ab_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowMouseRect@
hs_bindgen_cea803a34ce672ab
  :: BG.Ptr SDL_Window
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> IO BG.CBool
hs_bindgen_cea803a34ce672ab =
  BG.fromFFIType hs_bindgen_cea803a34ce672ab_base

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
sDL_SetWindowMouseRect = hs_bindgen_cea803a34ce672ab

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowMouseRect@
foreign import ccall safe "hs_bindgen_20aa207b179a0f01"
  hs_bindgen_20aa207b179a0f01_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowMouseRect@
hs_bindgen_20aa207b179a0f01
  :: BG.Ptr SDL_Window
  -> IO (PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect)
hs_bindgen_20aa207b179a0f01 =
  BG.fromFFIType hs_bindgen_20aa207b179a0f01_base

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
sDL_GetWindowMouseRect = hs_bindgen_20aa207b179a0f01

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowOpacity@
foreign import ccall safe "hs_bindgen_8604a41f1b752f5d"
  hs_bindgen_8604a41f1b752f5d_base
    :: BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowOpacity@
hs_bindgen_8604a41f1b752f5d
  :: BG.Ptr SDL_Window
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_8604a41f1b752f5d =
  BG.fromFFIType hs_bindgen_8604a41f1b752f5d_base

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
sDL_SetWindowOpacity = hs_bindgen_8604a41f1b752f5d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowOpacity@
foreign import ccall safe "hs_bindgen_3101cb57bb822dd1"
  hs_bindgen_3101cb57bb822dd1_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowOpacity@
hs_bindgen_3101cb57bb822dd1
  :: BG.Ptr SDL_Window
  -> IO BG.CFloat
hs_bindgen_3101cb57bb822dd1 =
  BG.fromFFIType hs_bindgen_3101cb57bb822dd1_base

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
sDL_GetWindowOpacity = hs_bindgen_3101cb57bb822dd1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowParent@
foreign import ccall safe "hs_bindgen_1cc8b9ab8edf00bb"
  hs_bindgen_1cc8b9ab8edf00bb_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowParent@
hs_bindgen_1cc8b9ab8edf00bb
  :: BG.Ptr SDL_Window
  -> BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_1cc8b9ab8edf00bb =
  BG.fromFFIType hs_bindgen_1cc8b9ab8edf00bb_base

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
sDL_SetWindowParent = hs_bindgen_1cc8b9ab8edf00bb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowModal@
foreign import ccall safe "hs_bindgen_6a6cf75fb3644441"
  hs_bindgen_6a6cf75fb3644441_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowModal@
hs_bindgen_6a6cf75fb3644441
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_6a6cf75fb3644441 =
  BG.fromFFIType hs_bindgen_6a6cf75fb3644441_base

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
sDL_SetWindowModal = hs_bindgen_6a6cf75fb3644441

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowFocusable@
foreign import ccall safe "hs_bindgen_b8c33cea6b55cf17"
  hs_bindgen_b8c33cea6b55cf17_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowFocusable@
hs_bindgen_b8c33cea6b55cf17
  :: BG.Ptr SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_b8c33cea6b55cf17 =
  BG.fromFFIType hs_bindgen_b8c33cea6b55cf17_base

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
sDL_SetWindowFocusable = hs_bindgen_b8c33cea6b55cf17

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_ShowWindowSystemMenu@
foreign import ccall safe "hs_bindgen_ce10733e3b7a4ffa"
  hs_bindgen_ce10733e3b7a4ffa_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_ShowWindowSystemMenu@
hs_bindgen_ce10733e3b7a4ffa
  :: BG.Ptr SDL_Window
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_ce10733e3b7a4ffa =
  BG.fromFFIType hs_bindgen_ce10733e3b7a4ffa_base

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
  hs_bindgen_ce10733e3b7a4ffa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowHitTest@
foreign import ccall safe "hs_bindgen_9639f427d08bb73e"
  hs_bindgen_9639f427d08bb73e_base
    :: BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowHitTest@
hs_bindgen_9639f427d08bb73e
  :: BG.Ptr SDL_Window
  -> SDL_HitTest
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_9639f427d08bb73e =
  BG.fromFFIType hs_bindgen_9639f427d08bb73e_base

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
sDL_SetWindowHitTest = hs_bindgen_9639f427d08bb73e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowShape@
foreign import ccall safe "hs_bindgen_ed6846899beda7ab"
  hs_bindgen_ed6846899beda7ab_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowShape@
hs_bindgen_ed6846899beda7ab
  :: BG.Ptr SDL_Window
  -> BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> IO BG.CBool
hs_bindgen_ed6846899beda7ab =
  BG.fromFFIType hs_bindgen_ed6846899beda7ab_base

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
sDL_SetWindowShape = hs_bindgen_ed6846899beda7ab

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_FlashWindow@
foreign import ccall safe "hs_bindgen_e1ccf70cb57d0520"
  hs_bindgen_e1ccf70cb57d0520_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_FlashWindow@
hs_bindgen_e1ccf70cb57d0520
  :: BG.Ptr SDL_Window
  -> SDL_FlashOperation
  -> IO BG.CBool
hs_bindgen_e1ccf70cb57d0520 =
  BG.fromFFIType hs_bindgen_e1ccf70cb57d0520_base

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
sDL_FlashWindow = hs_bindgen_e1ccf70cb57d0520

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowProgressState@
foreign import ccall safe "hs_bindgen_5b04ab3d00de3188"
  hs_bindgen_5b04ab3d00de3188_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowProgressState@
hs_bindgen_5b04ab3d00de3188
  :: BG.Ptr SDL_Window
  -> SDL_ProgressState
  -> IO BG.CBool
hs_bindgen_5b04ab3d00de3188 =
  BG.fromFFIType hs_bindgen_5b04ab3d00de3188_base

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
  hs_bindgen_5b04ab3d00de3188

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowProgressState@
foreign import ccall safe "hs_bindgen_f0c456909c3f00e4"
  hs_bindgen_f0c456909c3f00e4_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowProgressState@
hs_bindgen_f0c456909c3f00e4
  :: BG.Ptr SDL_Window
  -> IO SDL_ProgressState
hs_bindgen_f0c456909c3f00e4 =
  BG.fromFFIType hs_bindgen_f0c456909c3f00e4_base

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
  hs_bindgen_f0c456909c3f00e4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowProgressValue@
foreign import ccall safe "hs_bindgen_61b3840500263851"
  hs_bindgen_61b3840500263851_base
    :: BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_SetWindowProgressValue@
hs_bindgen_61b3840500263851
  :: BG.Ptr SDL_Window
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_61b3840500263851 =
  BG.fromFFIType hs_bindgen_61b3840500263851_base

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
  hs_bindgen_61b3840500263851

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowProgressValue@
foreign import ccall safe "hs_bindgen_11c3352b21aa2799"
  hs_bindgen_11c3352b21aa2799_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GetWindowProgressValue@
hs_bindgen_11c3352b21aa2799
  :: BG.Ptr SDL_Window
  -> IO BG.CFloat
hs_bindgen_11c3352b21aa2799 =
  BG.fromFFIType hs_bindgen_11c3352b21aa2799_base

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
  hs_bindgen_11c3352b21aa2799

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_DestroyWindow@
foreign import ccall safe "hs_bindgen_b3962b19443d34da"
  hs_bindgen_b3962b19443d34da_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_DestroyWindow@
hs_bindgen_b3962b19443d34da
  :: BG.Ptr SDL_Window
  -> IO ()
hs_bindgen_b3962b19443d34da =
  BG.fromFFIType hs_bindgen_b3962b19443d34da_base

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
sDL_DestroyWindow = hs_bindgen_b3962b19443d34da

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_ScreenSaverEnabled@
foreign import ccall safe "hs_bindgen_84c0659acf0fe2dc"
  hs_bindgen_84c0659acf0fe2dc_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_ScreenSaverEnabled@
hs_bindgen_84c0659acf0fe2dc :: IO BG.CBool
hs_bindgen_84c0659acf0fe2dc =
  BG.fromFFIType hs_bindgen_84c0659acf0fe2dc_base

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
sDL_ScreenSaverEnabled = hs_bindgen_84c0659acf0fe2dc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EnableScreenSaver@
foreign import ccall safe "hs_bindgen_166142199f6402d0"
  hs_bindgen_166142199f6402d0_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EnableScreenSaver@
hs_bindgen_166142199f6402d0 :: IO BG.CBool
hs_bindgen_166142199f6402d0 =
  BG.fromFFIType hs_bindgen_166142199f6402d0_base

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
sDL_EnableScreenSaver = hs_bindgen_166142199f6402d0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_DisableScreenSaver@
foreign import ccall safe "hs_bindgen_83a7f8efb2c664c5"
  hs_bindgen_83a7f8efb2c664c5_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_DisableScreenSaver@
hs_bindgen_83a7f8efb2c664c5 :: IO BG.CBool
hs_bindgen_83a7f8efb2c664c5 =
  BG.fromFFIType hs_bindgen_83a7f8efb2c664c5_base

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
sDL_DisableScreenSaver = hs_bindgen_83a7f8efb2c664c5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_LoadLibrary@
foreign import ccall safe "hs_bindgen_c47d12c66f8cfd5c"
  hs_bindgen_c47d12c66f8cfd5c_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_LoadLibrary@
hs_bindgen_c47d12c66f8cfd5c
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_c47d12c66f8cfd5c =
  BG.fromFFIType hs_bindgen_c47d12c66f8cfd5c_base

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
sDL_GL_LoadLibrary = hs_bindgen_c47d12c66f8cfd5c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetProcAddress@
foreign import ccall safe "hs_bindgen_e435ceb0289a8035"
  hs_bindgen_e435ceb0289a8035_base
    :: BG.Ptr BG.Void
    -> IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetProcAddress@
hs_bindgen_e435ceb0289a8035
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
hs_bindgen_e435ceb0289a8035 =
  BG.fromFFIType hs_bindgen_e435ceb0289a8035_base

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
sDL_GL_GetProcAddress = hs_bindgen_e435ceb0289a8035

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_GetProcAddress@
foreign import ccall safe "hs_bindgen_894763e4be5fe96f"
  hs_bindgen_894763e4be5fe96f_base
    :: BG.Ptr BG.Void
    -> IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_GetProcAddress@
hs_bindgen_894763e4be5fe96f
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
hs_bindgen_894763e4be5fe96f =
  BG.fromFFIType hs_bindgen_894763e4be5fe96f_base

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
sDL_EGL_GetProcAddress = hs_bindgen_894763e4be5fe96f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_UnloadLibrary@
foreign import ccall safe "hs_bindgen_88c7a6f4d6a9b36e"
  hs_bindgen_88c7a6f4d6a9b36e_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_UnloadLibrary@
hs_bindgen_88c7a6f4d6a9b36e :: IO ()
hs_bindgen_88c7a6f4d6a9b36e =
  BG.fromFFIType hs_bindgen_88c7a6f4d6a9b36e_base

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
sDL_GL_UnloadLibrary = hs_bindgen_88c7a6f4d6a9b36e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_ExtensionSupported@
foreign import ccall safe "hs_bindgen_d8ad3d720e0d97e4"
  hs_bindgen_d8ad3d720e0d97e4_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_ExtensionSupported@
hs_bindgen_d8ad3d720e0d97e4
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_d8ad3d720e0d97e4 =
  BG.fromFFIType hs_bindgen_d8ad3d720e0d97e4_base

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
  hs_bindgen_d8ad3d720e0d97e4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_ResetAttributes@
foreign import ccall safe "hs_bindgen_0e89b220270eca27"
  hs_bindgen_0e89b220270eca27_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_ResetAttributes@
hs_bindgen_0e89b220270eca27 :: IO ()
hs_bindgen_0e89b220270eca27 =
  BG.fromFFIType hs_bindgen_0e89b220270eca27_base

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
sDL_GL_ResetAttributes = hs_bindgen_0e89b220270eca27

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_SetAttribute@
foreign import ccall safe "hs_bindgen_6a7a5b133a68dc0f"
  hs_bindgen_6a7a5b133a68dc0f_base
    :: BG.Word32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_SetAttribute@
hs_bindgen_6a7a5b133a68dc0f
  :: SDL_GLAttr
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_6a7a5b133a68dc0f =
  BG.fromFFIType hs_bindgen_6a7a5b133a68dc0f_base

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
sDL_GL_SetAttribute = hs_bindgen_6a7a5b133a68dc0f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetAttribute@
foreign import ccall safe "hs_bindgen_a558edf739642b48"
  hs_bindgen_a558edf739642b48_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetAttribute@
hs_bindgen_a558edf739642b48
  :: SDL_GLAttr
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_a558edf739642b48 =
  BG.fromFFIType hs_bindgen_a558edf739642b48_base

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
sDL_GL_GetAttribute = hs_bindgen_a558edf739642b48

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_CreateContext@
foreign import ccall safe "hs_bindgen_7a22bf48d0f84507"
  hs_bindgen_7a22bf48d0f84507_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_CreateContext@
hs_bindgen_7a22bf48d0f84507
  :: BG.Ptr SDL_Window
  -> IO SDL_GLContext
hs_bindgen_7a22bf48d0f84507 =
  BG.fromFFIType hs_bindgen_7a22bf48d0f84507_base

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
sDL_GL_CreateContext = hs_bindgen_7a22bf48d0f84507

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_MakeCurrent@
foreign import ccall safe "hs_bindgen_ff7daec2405dfb35"
  hs_bindgen_ff7daec2405dfb35_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_MakeCurrent@
hs_bindgen_ff7daec2405dfb35
  :: BG.Ptr SDL_Window
  -> SDL_GLContext
  -> IO BG.CBool
hs_bindgen_ff7daec2405dfb35 =
  BG.fromFFIType hs_bindgen_ff7daec2405dfb35_base

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
sDL_GL_MakeCurrent = hs_bindgen_ff7daec2405dfb35

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetCurrentWindow@
foreign import ccall safe "hs_bindgen_6eb4d946a4d2ae7b"
  hs_bindgen_6eb4d946a4d2ae7b_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetCurrentWindow@
hs_bindgen_6eb4d946a4d2ae7b :: IO (BG.Ptr SDL_Window)
hs_bindgen_6eb4d946a4d2ae7b =
  BG.fromFFIType hs_bindgen_6eb4d946a4d2ae7b_base

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
sDL_GL_GetCurrentWindow = hs_bindgen_6eb4d946a4d2ae7b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetCurrentContext@
foreign import ccall safe "hs_bindgen_c32923dac368266d"
  hs_bindgen_c32923dac368266d_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetCurrentContext@
hs_bindgen_c32923dac368266d :: IO SDL_GLContext
hs_bindgen_c32923dac368266d =
  BG.fromFFIType hs_bindgen_c32923dac368266d_base

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
  hs_bindgen_c32923dac368266d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_GetCurrentDisplay@
foreign import ccall safe "hs_bindgen_19cd590b75a39bcc"
  hs_bindgen_19cd590b75a39bcc_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_GetCurrentDisplay@
hs_bindgen_19cd590b75a39bcc :: IO SDL_EGLDisplay
hs_bindgen_19cd590b75a39bcc =
  BG.fromFFIType hs_bindgen_19cd590b75a39bcc_base

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
  hs_bindgen_19cd590b75a39bcc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_GetCurrentConfig@
foreign import ccall safe "hs_bindgen_652c87a58c2fcc27"
  hs_bindgen_652c87a58c2fcc27_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_GetCurrentConfig@
hs_bindgen_652c87a58c2fcc27 :: IO SDL_EGLConfig
hs_bindgen_652c87a58c2fcc27 =
  BG.fromFFIType hs_bindgen_652c87a58c2fcc27_base

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
  hs_bindgen_652c87a58c2fcc27

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_GetWindowSurface@
foreign import ccall safe "hs_bindgen_a7fa1925e88a0d07"
  hs_bindgen_a7fa1925e88a0d07_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_GetWindowSurface@
hs_bindgen_a7fa1925e88a0d07
  :: BG.Ptr SDL_Window
  -> IO SDL_EGLSurface
hs_bindgen_a7fa1925e88a0d07 =
  BG.fromFFIType hs_bindgen_a7fa1925e88a0d07_base

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
  hs_bindgen_a7fa1925e88a0d07

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_SetAttributeCallbacks@
foreign import ccall safe "hs_bindgen_5095f621e48adf13"
  hs_bindgen_5095f621e48adf13_base
    :: BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_EGL_SetAttributeCallbacks@
hs_bindgen_5095f621e48adf13
  :: SDL_EGLAttribArrayCallback
  -> SDL_EGLIntArrayCallback
  -> SDL_EGLIntArrayCallback
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_5095f621e48adf13 =
  BG.fromFFIType hs_bindgen_5095f621e48adf13_base

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
  hs_bindgen_5095f621e48adf13

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_SetSwapInterval@
foreign import ccall safe "hs_bindgen_32295faebc369c7a"
  hs_bindgen_32295faebc369c7a_base
    :: BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_SetSwapInterval@
hs_bindgen_32295faebc369c7a
  :: BG.CInt
  -> IO BG.CBool
hs_bindgen_32295faebc369c7a =
  BG.fromFFIType hs_bindgen_32295faebc369c7a_base

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
sDL_GL_SetSwapInterval = hs_bindgen_32295faebc369c7a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetSwapInterval@
foreign import ccall safe "hs_bindgen_04719e6e434557d3"
  hs_bindgen_04719e6e434557d3_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_GetSwapInterval@
hs_bindgen_04719e6e434557d3
  :: BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_04719e6e434557d3 =
  BG.fromFFIType hs_bindgen_04719e6e434557d3_base

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
sDL_GL_GetSwapInterval = hs_bindgen_04719e6e434557d3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_SwapWindow@
foreign import ccall safe "hs_bindgen_1d8b57ab49fbefc1"
  hs_bindgen_1d8b57ab49fbefc1_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_SwapWindow@
hs_bindgen_1d8b57ab49fbefc1
  :: BG.Ptr SDL_Window
  -> IO BG.CBool
hs_bindgen_1d8b57ab49fbefc1 =
  BG.fromFFIType hs_bindgen_1d8b57ab49fbefc1_base

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
sDL_GL_SwapWindow = hs_bindgen_1d8b57ab49fbefc1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_DestroyContext@
foreign import ccall safe "hs_bindgen_7da107ca01a650af"
  hs_bindgen_7da107ca01a650af_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Video_Safe_SDL_GL_DestroyContext@
hs_bindgen_7da107ca01a650af
  :: SDL_GLContext
  -> IO BG.CBool
hs_bindgen_7da107ca01a650af =
  BG.fromFFIType hs_bindgen_7da107ca01a650af_base

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
sDL_GL_DestroyContext = hs_bindgen_7da107ca01a650af
