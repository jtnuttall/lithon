{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | SDL\'s video subsystem is largely interested in abstracting window management from the underlying operating system. You can create windows, manage them in various ways, set them fullscreen, and get events when interesting things happen with them, such as the mouse or keyboard interacting with a window.
--
--     The video subsystem is also interested in abstracting away some platform-specific differences in OpenGL: context creation, swapping buffers, etc. This may be crucial to your app, but also you are not required to use OpenGL at all. In fact, SDL can provide rendering to those windows as well, either with an easy-to-use [2D API](https://wiki.libsdl.org/SDL3/CategoryRender) or with a more-powerful [GPU API](https://wiki.libsdl.org/SDL3/CategoryGPU). Of course, it can simply get out of your way and give you the window handles you need to use Vulkan, Direct3D, Metal, or whatever else you like directly, too.
--
--     The video subsystem covers a lot of functionality, out of necessity, so it is worth perusing the list of functions just to see what\'s available, but most apps can get by with simply creating a window and listening for events, so start with @SDL_CreateWindow()@ and SDL_PollEvent(). This is a unique ID for a display for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the display is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Video (
  SDL3.Sys.Bindgen.Video.SDL_DisplayID (..),
  SDL3.Sys.Bindgen.Video.SDL_WindowID (..),
  SDL3.Sys.Bindgen.Video.sDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER,
  SDL3.Sys.Bindgen.Video.SDL_SystemTheme (..),
  pattern SDL3.Sys.Bindgen.Video.SDL_SYSTEM_THEME_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Video.SDL_SYSTEM_THEME_LIGHT,
  pattern SDL3.Sys.Bindgen.Video.SDL_SYSTEM_THEME_DARK,
  SDL3.Sys.Bindgen.Video.SDL_DisplayModeData,
  SDL3.Sys.Bindgen.Video.SDL_DisplayMode (..),
  SDL3.Sys.Bindgen.Video.SDL_DisplayOrientation (..),
  pattern SDL3.Sys.Bindgen.Video.SDL_ORIENTATION_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Video.SDL_ORIENTATION_LANDSCAPE,
  pattern SDL3.Sys.Bindgen.Video.SDL_ORIENTATION_LANDSCAPE_FLIPPED,
  pattern SDL3.Sys.Bindgen.Video.SDL_ORIENTATION_PORTRAIT,
  pattern SDL3.Sys.Bindgen.Video.SDL_ORIENTATION_PORTRAIT_FLIPPED,
  SDL3.Sys.Bindgen.Video.SDL_Window,
  SDL3.Sys.Bindgen.Video.SDL_WindowFlags (..),
  SDL3.Sys.Bindgen.Video.sDL_WINDOWPOS_UNDEFINED_MASK,
  SDL3.Sys.Bindgen.Video.sDL_WINDOWPOS_UNDEFINED_DISPLAY,
  SDL3.Sys.Bindgen.Video.sDL_WINDOWPOS_UNDEFINED,
  SDL3.Sys.Bindgen.Video.sDL_WINDOWPOS_ISUNDEFINED,
  SDL3.Sys.Bindgen.Video.sDL_WINDOWPOS_CENTERED_MASK,
  SDL3.Sys.Bindgen.Video.sDL_WINDOWPOS_CENTERED_DISPLAY,
  SDL3.Sys.Bindgen.Video.sDL_WINDOWPOS_CENTERED,
  SDL3.Sys.Bindgen.Video.sDL_WINDOWPOS_ISCENTERED,
  SDL3.Sys.Bindgen.Video.SDL_FlashOperation (..),
  pattern SDL3.Sys.Bindgen.Video.SDL_FLASH_CANCEL,
  pattern SDL3.Sys.Bindgen.Video.SDL_FLASH_BRIEFLY,
  pattern SDL3.Sys.Bindgen.Video.SDL_FLASH_UNTIL_FOCUSED,
  SDL3.Sys.Bindgen.Video.SDL_ProgressState (..),
  pattern SDL3.Sys.Bindgen.Video.SDL_PROGRESS_STATE_INVALID,
  pattern SDL3.Sys.Bindgen.Video.SDL_PROGRESS_STATE_NONE,
  pattern SDL3.Sys.Bindgen.Video.SDL_PROGRESS_STATE_INDETERMINATE,
  pattern SDL3.Sys.Bindgen.Video.SDL_PROGRESS_STATE_NORMAL,
  pattern SDL3.Sys.Bindgen.Video.SDL_PROGRESS_STATE_PAUSED,
  pattern SDL3.Sys.Bindgen.Video.SDL_PROGRESS_STATE_ERROR,
  SDL3.Sys.Bindgen.Video.SDL_GLContextState,
  SDL3.Sys.Bindgen.Video.SDL_GLContext (..),
  SDL3.Sys.Bindgen.Video.SDL_EGLDisplay (..),
  SDL3.Sys.Bindgen.Video.SDL_EGLConfig (..),
  SDL3.Sys.Bindgen.Video.SDL_EGLSurface (..),
  SDL3.Sys.Bindgen.Video.SDL_EGLAttrib (..),
  SDL3.Sys.Bindgen.Video.SDL_EGLint (..),
  SDL3.Sys.Bindgen.Video.SDL_EGLAttribArrayCallback_Aux (..),
  SDL3.Sys.Bindgen.Video.SDL_EGLAttribArrayCallback (..),
  SDL3.Sys.Bindgen.Video.SDL_EGLIntArrayCallback_Aux (..),
  SDL3.Sys.Bindgen.Video.SDL_EGLIntArrayCallback (..),
  SDL3.Sys.Bindgen.Video.SDL_GLAttr (..),
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_RED_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_GREEN_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_BLUE_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_ALPHA_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_BUFFER_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_DOUBLEBUFFER,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_DEPTH_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_STENCIL_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_ACCUM_RED_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_ACCUM_GREEN_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_ACCUM_BLUE_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_ACCUM_ALPHA_SIZE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_STEREO,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_MULTISAMPLEBUFFERS,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_MULTISAMPLESAMPLES,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_ACCELERATED_VISUAL,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_RETAINED_BACKING,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_CONTEXT_MAJOR_VERSION,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_CONTEXT_MINOR_VERSION,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_CONTEXT_FLAGS,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_CONTEXT_PROFILE_MASK,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_CONTEXT_RELEASE_BEHAVIOR,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_CONTEXT_RESET_NOTIFICATION,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_CONTEXT_NO_ERROR,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_FLOATBUFFERS,
  pattern SDL3.Sys.Bindgen.Video.SDL_GL_EGL_PLATFORM,
  SDL3.Sys.Bindgen.Video.SDL_GLProfile (..),
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_PROFILE_CORE,
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_PROFILE_COMPATIBILITY,
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_PROFILE_ES,
  SDL3.Sys.Bindgen.Video.SDL_GLContextFlag (..),
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_DEBUG_FLAG,
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG,
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_ROBUST_ACCESS_FLAG,
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_RESET_ISOLATION_FLAG,
  SDL3.Sys.Bindgen.Video.SDL_GLContextReleaseFlag (..),
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE,
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH,
  SDL3.Sys.Bindgen.Video.SDL_GLContextResetNotification (..),
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_RESET_NO_NOTIFICATION,
  SDL3.Sys.Bindgen.Video.sDL_GL_CONTEXT_RESET_LOSE_CONTEXT,
  SDL3.Sys.Bindgen.Video.sDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_FLAGS_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_MENU_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_METAL_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_PARENT_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_TITLE_STRING,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_WIDTH_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_X_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_Y_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_SHAPE_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_HDR_HEADROOM_FLOAT,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_ANDROID_WINDOW_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_ANDROID_SURFACE_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_UIKIT_WINDOW_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_COCOA_WINDOW_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WIN32_HWND_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WIN32_HDC_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WIN32_INSTANCE_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_X11_DISPLAY_POINTER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_X11_SCREEN_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_X11_WINDOW_NUMBER,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING,
  SDL3.Sys.Bindgen.Video.sDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING,
  SDL3.Sys.Bindgen.Video.sDL_WINDOW_SURFACE_VSYNC_DISABLED,
  SDL3.Sys.Bindgen.Video.sDL_WINDOW_SURFACE_VSYNC_ADAPTIVE,
  SDL3.Sys.Bindgen.Video.SDL_HitTestResult (..),
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_NORMAL,
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_DRAGGABLE,
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_RESIZE_TOPLEFT,
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_RESIZE_TOP,
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_RESIZE_TOPRIGHT,
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_RESIZE_RIGHT,
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_RESIZE_BOTTOMRIGHT,
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_RESIZE_BOTTOM,
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_RESIZE_BOTTOMLEFT,
  pattern SDL3.Sys.Bindgen.Video.SDL_HITTEST_RESIZE_LEFT,
  SDL3.Sys.Bindgen.Video.SDL_HitTest_Aux (..),
  SDL3.Sys.Bindgen.Video.SDL_HitTest (..),
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_DisplayID@, defined at @SDL3\/SDL_video.h 75:16@
newtype SDL_DisplayID = SDL_DisplayID
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_DisplayID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_DisplayID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_DisplayID "unwrap" where
  type
    CFieldType SDL_DisplayID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | This is a unique ID for a window.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WindowID@, defined at @SDL3\/SDL_video.h 84:16@
newtype SDL_WindowID = SDL_WindowID
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_WindowID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_WindowID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_WindowID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_WindowID "unwrap" where
  type
    CFieldType SDL_WindowID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | The pointer to the global @wl_display@ object used by the Wayland video backend.
--
--     Can be set before the video subsystem is initialized to import an external @wl_display@ object from an application or toolkit for use in SDL, or read after initialization to export the @wl_display@ used by the Wayland video backend. Setting this property after the video subsystem has been initialized has no effect, and reading it when the video subsystem is uninitialized will either return the user provided value, if one was set prior to initialization, or NULL. See docs\/README-wayland.md for more information.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER@, literal @\"SDL.video.wayland.wl_display\"@, defined at @SDL3\/SDL_video.h 103:9@
sDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER :: BG.ByteString
sDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x76
    , 0x69
    , 0x64
    , 0x65
    , 0x6F
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x77
    , 0x6C
    , 0x5F
    , 0x64
    , 0x69
    , 0x73
    , 0x70
    , 0x6C
    , 0x61
    , 0x79
    ]

-- | System theme.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_SystemTheme@, defined at @SDL3\/SDL_video.h 110:14@
newtype SDL_SystemTheme = SDL_SystemTheme
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_SystemTheme where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_SystemTheme where
  readRaw =
    \ptr0 ->
      pure SDL_SystemTheme
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_SystemTheme where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_SystemTheme unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_SystemTheme instance BG.Storable SDL_SystemTheme

deriving via BG.CUInt instance BG.Prim SDL_SystemTheme

instance CEnum.CEnum SDL_SystemTheme where
  type CEnumZ SDL_SystemTheme = BG.CUInt

  toCEnum = SDL_SystemTheme

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_SYSTEM_THEME_UNKNOWN")
        , (1, BG.singleton "SDL_SYSTEM_THEME_LIGHT")
        , (2, BG.singleton "SDL_SYSTEM_THEME_DARK")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_SystemTheme"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_SystemTheme"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_SystemTheme where
  minDeclaredValue = SDL_SYSTEM_THEME_UNKNOWN

  maxDeclaredValue = SDL_SYSTEM_THEME_DARK

instance Show SDL_SystemTheme where
  showsPrec = CEnum.shows

instance Read SDL_SystemTheme where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_SystemTheme ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SystemTheme{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_SystemTheme) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_SystemTheme "unwrap" where
  type CFieldType SDL_SystemTheme "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Unknown system theme
--
--     [C declaration]: @SDL_SYSTEM_THEME_UNKNOWN@, defined at @SDL3\/SDL_video.h 112:5@
pattern SDL_SYSTEM_THEME_UNKNOWN :: SDL_SystemTheme
pattern SDL_SYSTEM_THEME_UNKNOWN = SDL_SystemTheme 0

-- | Light colored system theme
--
--     [C declaration]: @SDL_SYSTEM_THEME_LIGHT@, defined at @SDL3\/SDL_video.h 113:5@
pattern SDL_SYSTEM_THEME_LIGHT :: SDL_SystemTheme
pattern SDL_SYSTEM_THEME_LIGHT = SDL_SystemTheme 1

-- | Dark colored system theme
--
--     [C declaration]: @SDL_SYSTEM_THEME_DARK@, defined at @SDL3\/SDL_video.h 114:5@
pattern SDL_SYSTEM_THEME_DARK :: SDL_SystemTheme
pattern SDL_SYSTEM_THEME_DARK = SDL_SystemTheme 2

-- | Internal display mode data.
--
--     This lives as a field in 'SDL_DisplayMode', as opaque data.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DisplayMode'
--
--     [C declaration]: @struct SDL_DisplayModeData@, defined at @SDL3\/SDL_video.h 126:16@
data SDL_DisplayModeData

-- | The structure that defines a display mode.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetFullscreenDisplayModes', 'sDL_GetDesktopDisplayMode', 'sDL_GetCurrentDisplayMode', 'sDL_SetWindowFullscreenMode', 'sDL_GetWindowFullscreenMode'
--
--     [C declaration]: @struct SDL_DisplayMode@, defined at @SDL3\/SDL_video.h 139:16@
data SDL_DisplayMode = SDL_DisplayMode
  { displayID :: SDL_DisplayID
  -- ^ the display this mode is associated with
  --
  --          [C declaration]: @displayID@, defined at @SDL3\/SDL_video.h 141:19@
  , format :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^ pixel format
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_video.h 142:21@
  , w :: BG.CInt
  -- ^ width
  --
  --          [C declaration]: @w@, defined at @SDL3\/SDL_video.h 143:9@
  , h :: BG.CInt
  -- ^ height
  --
  --          [C declaration]: @h@, defined at @SDL3\/SDL_video.h 144:9@
  , pixel_density :: BG.CFloat
  -- ^ scale converting size to pixels (e.g. a 1920x1080 mode with 2.0 scale would have 3840x2160 pixels)
  --
  --          [C declaration]: @pixel_density@, defined at @SDL3\/SDL_video.h 145:11@
  , refresh_rate :: BG.CFloat
  -- ^ refresh rate (or 0.0f for unspecified)
  --
  --          [C declaration]: @refresh_rate@, defined at @SDL3\/SDL_video.h 146:11@
  , refresh_rate_numerator :: BG.CInt
  -- ^ precise refresh rate numerator (or 0 for unspecified)
  --
  --          [C declaration]: @refresh_rate_numerator@, defined at @SDL3\/SDL_video.h 147:9@
  , refresh_rate_denominator :: BG.CInt
  -- ^ precise refresh rate denominator
  --
  --          [C declaration]: @refresh_rate_denominator@, defined at @SDL3\/SDL_video.h 148:9@
  , internal :: BG.Ptr SDL_DisplayModeData
  -- ^ Private
  --
  --          [C declaration]: @internal@, defined at @SDL3\/SDL_video.h 150:26@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_DisplayMode where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_DisplayMode where
  readRaw =
    \ptr0 ->
      pure SDL_DisplayMode
        <*> HasCField.readRaw (BG.Proxy @"displayID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"h") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pixel_density") ptr0
        <*> HasCField.readRaw (BG.Proxy @"refresh_rate") ptr0
        <*> HasCField.readRaw (BG.Proxy @"refresh_rate_numerator") ptr0
        <*> HasCField.readRaw (BG.Proxy @"refresh_rate_denominator") ptr0
        <*> HasCField.readRaw (BG.Proxy @"internal") ptr0

instance Marshal.WriteRaw SDL_DisplayMode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_DisplayMode
            displayID2
            format3
            w4
            h5
            pixel_density6
            refresh_rate7
            refresh_rate_numerator8
            refresh_rate_denominator9
            internal10 ->
              HasCField.writeRaw (BG.Proxy @"displayID") ptr0 displayID2
                >> HasCField.writeRaw (BG.Proxy @"format") ptr0 format3
                >> HasCField.writeRaw (BG.Proxy @"w") ptr0 w4
                >> HasCField.writeRaw (BG.Proxy @"h") ptr0 h5
                >> HasCField.writeRaw (BG.Proxy @"pixel_density") ptr0 pixel_density6
                >> HasCField.writeRaw (BG.Proxy @"refresh_rate") ptr0 refresh_rate7
                >> HasCField.writeRaw (BG.Proxy @"refresh_rate_numerator") ptr0 refresh_rate_numerator8
                >> HasCField.writeRaw (BG.Proxy @"refresh_rate_denominator") ptr0 refresh_rate_denominator9
                >> HasCField.writeRaw (BG.Proxy @"internal") ptr0 internal10

deriving via Marshal.EquivStorable SDL_DisplayMode instance BG.Storable SDL_DisplayMode

instance
  (ty ~ SDL_DisplayID)
  => BG.CompatHasField.HasField "displayID" SDL_DisplayMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayMode
            { displayID = y1
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pixel_density = BG.getField @"pixel_density" x0
            , refresh_rate = BG.getField @"refresh_rate" x0
            , refresh_rate_numerator = BG.getField @"refresh_rate_numerator" x0
            , refresh_rate_denominator = BG.getField @"refresh_rate_denominator" x0
            , internal = BG.getField @"internal" x0
            }
      , BG.getField @"displayID" x0
      )

instance
  (ty ~ SDL_DisplayID)
  => BG.HasField "displayID" (BG.Ptr SDL_DisplayMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"displayID")

instance HasCField.HasCField SDL_DisplayMode "displayID" where
  type
    CFieldType SDL_DisplayMode "displayID" =
      SDL_DisplayID

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
  => BG.CompatHasField.HasField "format" SDL_DisplayMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayMode
            { format = y1
            , displayID = BG.getField @"displayID" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pixel_density = BG.getField @"pixel_density" x0
            , refresh_rate = BG.getField @"refresh_rate" x0
            , refresh_rate_numerator = BG.getField @"refresh_rate_numerator" x0
            , refresh_rate_denominator = BG.getField @"refresh_rate_denominator" x0
            , internal = BG.getField @"internal" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
  => BG.HasField "format" (BG.Ptr SDL_DisplayMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_DisplayMode "format" where
  type
    CFieldType SDL_DisplayMode "format" =
      SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "w" SDL_DisplayMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayMode
            { w = y1
            , displayID = BG.getField @"displayID" x0
            , format = BG.getField @"format" x0
            , h = BG.getField @"h" x0
            , pixel_density = BG.getField @"pixel_density" x0
            , refresh_rate = BG.getField @"refresh_rate" x0
            , refresh_rate_numerator = BG.getField @"refresh_rate_numerator" x0
            , refresh_rate_denominator = BG.getField @"refresh_rate_denominator" x0
            , internal = BG.getField @"internal" x0
            }
      , BG.getField @"w" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "w" (BG.Ptr SDL_DisplayMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"w")

instance HasCField.HasCField SDL_DisplayMode "w" where
  type CFieldType SDL_DisplayMode "w" = BG.CInt

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "h" SDL_DisplayMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayMode
            { h = y1
            , displayID = BG.getField @"displayID" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , pixel_density = BG.getField @"pixel_density" x0
            , refresh_rate = BG.getField @"refresh_rate" x0
            , refresh_rate_numerator = BG.getField @"refresh_rate_numerator" x0
            , refresh_rate_denominator = BG.getField @"refresh_rate_denominator" x0
            , internal = BG.getField @"internal" x0
            }
      , BG.getField @"h" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "h" (BG.Ptr SDL_DisplayMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"h")

instance HasCField.HasCField SDL_DisplayMode "h" where
  type CFieldType SDL_DisplayMode "h" = BG.CInt

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "pixel_density" SDL_DisplayMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayMode
            { pixel_density = y1
            , displayID = BG.getField @"displayID" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , refresh_rate = BG.getField @"refresh_rate" x0
            , refresh_rate_numerator = BG.getField @"refresh_rate_numerator" x0
            , refresh_rate_denominator = BG.getField @"refresh_rate_denominator" x0
            , internal = BG.getField @"internal" x0
            }
      , BG.getField @"pixel_density" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "pixel_density" (BG.Ptr SDL_DisplayMode) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"pixel_density")

instance HasCField.HasCField SDL_DisplayMode "pixel_density" where
  type
    CFieldType SDL_DisplayMode "pixel_density" =
      BG.CFloat

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "refresh_rate" SDL_DisplayMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayMode
            { refresh_rate = y1
            , displayID = BG.getField @"displayID" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pixel_density = BG.getField @"pixel_density" x0
            , refresh_rate_numerator = BG.getField @"refresh_rate_numerator" x0
            , refresh_rate_denominator = BG.getField @"refresh_rate_denominator" x0
            , internal = BG.getField @"internal" x0
            }
      , BG.getField @"refresh_rate" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "refresh_rate" (BG.Ptr SDL_DisplayMode) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"refresh_rate")

instance HasCField.HasCField SDL_DisplayMode "refresh_rate" where
  type
    CFieldType SDL_DisplayMode "refresh_rate" =
      BG.CFloat

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "refresh_rate_numerator" SDL_DisplayMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayMode
            { refresh_rate_numerator = y1
            , displayID = BG.getField @"displayID" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pixel_density = BG.getField @"pixel_density" x0
            , refresh_rate = BG.getField @"refresh_rate" x0
            , refresh_rate_denominator = BG.getField @"refresh_rate_denominator" x0
            , internal = BG.getField @"internal" x0
            }
      , BG.getField @"refresh_rate_numerator" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "refresh_rate_numerator" (BG.Ptr SDL_DisplayMode) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"refresh_rate_numerator")

instance HasCField.HasCField SDL_DisplayMode "refresh_rate_numerator" where
  type
    CFieldType SDL_DisplayMode "refresh_rate_numerator" =
      BG.CInt

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "refresh_rate_denominator" SDL_DisplayMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayMode
            { refresh_rate_denominator = y1
            , displayID = BG.getField @"displayID" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pixel_density = BG.getField @"pixel_density" x0
            , refresh_rate = BG.getField @"refresh_rate" x0
            , refresh_rate_numerator = BG.getField @"refresh_rate_numerator" x0
            , internal = BG.getField @"internal" x0
            }
      , BG.getField @"refresh_rate_denominator" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "refresh_rate_denominator" (BG.Ptr SDL_DisplayMode) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"refresh_rate_denominator")

instance HasCField.HasCField SDL_DisplayMode "refresh_rate_denominator" where
  type
    CFieldType SDL_DisplayMode "refresh_rate_denominator" =
      BG.CInt

  offset# = \_ -> \_ -> 28

instance
  (ty ~ BG.Ptr SDL_DisplayModeData)
  => BG.CompatHasField.HasField "internal" SDL_DisplayMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayMode
            { internal = y1
            , displayID = BG.getField @"displayID" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pixel_density = BG.getField @"pixel_density" x0
            , refresh_rate = BG.getField @"refresh_rate" x0
            , refresh_rate_numerator = BG.getField @"refresh_rate_numerator" x0
            , refresh_rate_denominator = BG.getField @"refresh_rate_denominator" x0
            }
      , BG.getField @"internal" x0
      )

instance
  (ty ~ BG.Ptr SDL_DisplayModeData)
  => BG.HasField "internal" (BG.Ptr SDL_DisplayMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"internal")

instance HasCField.HasCField SDL_DisplayMode "internal" where
  type
    CFieldType SDL_DisplayMode "internal" =
      BG.Ptr SDL_DisplayModeData

  offset# = \_ -> \_ -> 32

-- | Display orientation values; the way a display is rotated.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_DisplayOrientation@, defined at @SDL3\/SDL_video.h 159:14@
newtype SDL_DisplayOrientation = SDL_DisplayOrientation
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_DisplayOrientation where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_DisplayOrientation where
  readRaw =
    \ptr0 ->
      pure SDL_DisplayOrientation
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_DisplayOrientation where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_DisplayOrientation unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_DisplayOrientation
  instance
    BG.Storable SDL_DisplayOrientation

deriving via BG.CUInt instance BG.Prim SDL_DisplayOrientation

instance CEnum.CEnum SDL_DisplayOrientation where
  type CEnumZ SDL_DisplayOrientation = BG.CUInt

  toCEnum = SDL_DisplayOrientation

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_ORIENTATION_UNKNOWN")
        , (1, BG.singleton "SDL_ORIENTATION_LANDSCAPE")
        , (2, BG.singleton "SDL_ORIENTATION_LANDSCAPE_FLIPPED")
        , (3, BG.singleton "SDL_ORIENTATION_PORTRAIT")
        , (4, BG.singleton "SDL_ORIENTATION_PORTRAIT_FLIPPED")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_DisplayOrientation"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_DisplayOrientation"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_DisplayOrientation where
  minDeclaredValue = SDL_ORIENTATION_UNKNOWN

  maxDeclaredValue = SDL_ORIENTATION_PORTRAIT_FLIPPED

instance Show SDL_DisplayOrientation where
  showsPrec = CEnum.shows

instance Read SDL_DisplayOrientation where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_DisplayOrientation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DisplayOrientation{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_DisplayOrientation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_DisplayOrientation "unwrap" where
  type
    CFieldType SDL_DisplayOrientation "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The display orientation can\'t be determined
--
--     [C declaration]: @SDL_ORIENTATION_UNKNOWN@, defined at @SDL3\/SDL_video.h 161:5@
pattern SDL_ORIENTATION_UNKNOWN :: SDL_DisplayOrientation
pattern SDL_ORIENTATION_UNKNOWN = SDL_DisplayOrientation 0

-- | The display is in landscape mode, with the right side up, relative to portrait mode
--
--     [C declaration]: @SDL_ORIENTATION_LANDSCAPE@, defined at @SDL3\/SDL_video.h 162:5@
pattern SDL_ORIENTATION_LANDSCAPE :: SDL_DisplayOrientation
pattern SDL_ORIENTATION_LANDSCAPE = SDL_DisplayOrientation 1

-- | The display is in landscape mode, with the left side up, relative to portrait mode
--
--     [C declaration]: @SDL_ORIENTATION_LANDSCAPE_FLIPPED@, defined at @SDL3\/SDL_video.h 163:5@
pattern SDL_ORIENTATION_LANDSCAPE_FLIPPED :: SDL_DisplayOrientation
pattern SDL_ORIENTATION_LANDSCAPE_FLIPPED = SDL_DisplayOrientation 2

-- | The display is in portrait mode
--
--     [C declaration]: @SDL_ORIENTATION_PORTRAIT@, defined at @SDL3\/SDL_video.h 164:5@
pattern SDL_ORIENTATION_PORTRAIT :: SDL_DisplayOrientation
pattern SDL_ORIENTATION_PORTRAIT = SDL_DisplayOrientation 3

-- | The display is in portrait mode, upside down
--
--     [C declaration]: @SDL_ORIENTATION_PORTRAIT_FLIPPED@, defined at @SDL3\/SDL_video.h 165:5@
pattern SDL_ORIENTATION_PORTRAIT_FLIPPED :: SDL_DisplayOrientation
pattern SDL_ORIENTATION_PORTRAIT_FLIPPED = SDL_DisplayOrientation 4

-- | The struct used as an opaque handle to a window.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateWindow'
--
--     [C declaration]: @struct SDL_Window@, defined at @SDL3\/SDL_video.h 175:16@
data SDL_Window

-- | The flags on a window.
--
--     These cover a lot of true\/false, or on\/off, window state. Some of it is immutable after being set through @SDL_CreateWindow()@, some of it can be changed on existing windows by the app, and some of it might be altered by the user or system outside of the app\'s control.
--
--     When creating windows with @SDL_WINDOW_RESIZABLE@, SDL will constrain resizable windows to the dimensions recommended by the compositor to fit it within the usable desktop space, although some compositors will do this automatically without intervention as well. Use @'sDL_SetWindowResizable'@ after creation instead if you wish to create a window with a specific size.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowFlags'
--
--     [C declaration]: @SDL_WindowFlags@, defined at @SDL3\/SDL_video.h 195:16@
newtype SDL_WindowFlags = SDL_WindowFlags
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint64
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "unwrap" SDL_WindowFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_WindowFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "unwrap" (BG.Ptr SDL_WindowFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_WindowFlags "unwrap" where
  type
    CFieldType SDL_WindowFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 0

-- | A magic value used with SDL_WINDOWPOS_UNDEFINED.
--
--     Generally this macro isn\'t used directly, but rather through SDL_WINDOWPOS_UNDEFINED or SDL_WINDOWPOS_UNDEFINED_DISPLAY.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowPosition'
--
--     [C declaration]: @macro SDL_WINDOWPOS_UNDEFINED_MASK@, defined at @SDL3\/SDL_video.h 235:9@
sDL_WINDOWPOS_UNDEFINED_MASK :: BG.CUInt
sDL_WINDOWPOS_UNDEFINED_MASK =
  (536805376 :: BG.CUInt)

-- | Used to indicate that you don\'t care what the window position is.
--
--     If you /really/ don\'t care, SDL_WINDOWPOS_UNDEFINED is the same, but always uses the primary display instead of specifying one.
--
--     [@X@]: the 'SDL_DisplayID' of the display to use.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowPosition'
--
--     [C declaration]: @macro SDL_WINDOWPOS_UNDEFINED_DISPLAY@, defined at @SDL3\/SDL_video.h 249:9@
sDL_WINDOWPOS_UNDEFINED_DISPLAY
  :: forall a0. (C.Expr.HostPlatform.Bitwise BG.CUInt a0) => a0 -> C.Expr.HostPlatform.BitsRes BG.CUInt a0
sDL_WINDOWPOS_UNDEFINED_DISPLAY =
  \x0 ->
    (C.Expr.HostPlatform..|.) sDL_WINDOWPOS_UNDEFINED_MASK x0

-- | Used to indicate that you don\'t care what the window position\/display is.
--
--     This always uses the primary display.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowPosition'
--
--     [C declaration]: @macro SDL_WINDOWPOS_UNDEFINED@, defined at @SDL3\/SDL_video.h 260:9@
sDL_WINDOWPOS_UNDEFINED :: BG.CUInt
sDL_WINDOWPOS_UNDEFINED =
  sDL_WINDOWPOS_UNDEFINED_DISPLAY (0 :: BG.CInt)

-- | A macro to test if the window position is marked as \"undefined.\"
--
--     [@X@]: the window position value.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowPosition'
--
--     [C declaration]: @macro SDL_WINDOWPOS_ISUNDEFINED@, defined at @SDL3\/SDL_video.h 271:9@
sDL_WINDOWPOS_ISUNDEFINED
  :: forall a0
   . (C.Expr.HostPlatform.RelEq (C.Expr.HostPlatform.BitsRes a0 BG.CInt) BG.CUInt)
  => (C.Expr.HostPlatform.Bitwise a0 BG.CInt)
  => a0 -> BG.CInt
sDL_WINDOWPOS_ISUNDEFINED =
  \x0 ->
    (C.Expr.HostPlatform.==)
      ((C.Expr.HostPlatform..&.) x0 (4294901760 :: BG.CInt))
      sDL_WINDOWPOS_UNDEFINED_MASK

-- | A magic value used with SDL_WINDOWPOS_CENTERED.
--
--     Generally this macro isn\'t used directly, but rather through SDL_WINDOWPOS_CENTERED or SDL_WINDOWPOS_CENTERED_DISPLAY.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowPosition'
--
--     [C declaration]: @macro SDL_WINDOWPOS_CENTERED_MASK@, defined at @SDL3\/SDL_video.h 283:9@
sDL_WINDOWPOS_CENTERED_MASK :: BG.CUInt
sDL_WINDOWPOS_CENTERED_MASK = (805240832 :: BG.CUInt)

-- | Used to indicate that the window position should be centered.
--
--     SDL_WINDOWPOS_CENTERED is the same, but always uses the primary display instead of specifying one.
--
--     [@X@]: the 'SDL_DisplayID' of the display to use.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowPosition'
--
--     [C declaration]: @macro SDL_WINDOWPOS_CENTERED_DISPLAY@, defined at @SDL3\/SDL_video.h 297:9@
sDL_WINDOWPOS_CENTERED_DISPLAY
  :: forall a0. (C.Expr.HostPlatform.Bitwise BG.CUInt a0) => a0 -> C.Expr.HostPlatform.BitsRes BG.CUInt a0
sDL_WINDOWPOS_CENTERED_DISPLAY =
  \x0 ->
    (C.Expr.HostPlatform..|.) sDL_WINDOWPOS_CENTERED_MASK x0

-- | Used to indicate that the window position should be centered.
--
--     This always uses the primary display.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowPosition'
--
--     [C declaration]: @macro SDL_WINDOWPOS_CENTERED@, defined at @SDL3\/SDL_video.h 308:9@
sDL_WINDOWPOS_CENTERED :: BG.CUInt
sDL_WINDOWPOS_CENTERED =
  sDL_WINDOWPOS_CENTERED_DISPLAY (0 :: BG.CInt)

-- | A macro to test if the window position is marked as \"centered.\"
--
--     [@X@]: the window position value.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowPosition'
--
--     [C declaration]: @macro SDL_WINDOWPOS_ISCENTERED@, defined at @SDL3\/SDL_video.h 319:9@
sDL_WINDOWPOS_ISCENTERED
  :: forall a0
   . (C.Expr.HostPlatform.RelEq (C.Expr.HostPlatform.BitsRes a0 BG.CInt) BG.CUInt)
  => (C.Expr.HostPlatform.Bitwise a0 BG.CInt)
  => a0 -> BG.CInt
sDL_WINDOWPOS_ISCENTERED =
  \x0 ->
    (C.Expr.HostPlatform.==)
      ((C.Expr.HostPlatform..&.) x0 (4294901760 :: BG.CInt))
      sDL_WINDOWPOS_CENTERED_MASK

-- | Window flash operation.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_FlashOperation@, defined at @SDL3\/SDL_video.h 328:14@
newtype SDL_FlashOperation = SDL_FlashOperation
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_FlashOperation where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_FlashOperation where
  readRaw =
    \ptr0 ->
      pure SDL_FlashOperation
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_FlashOperation where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_FlashOperation unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_FlashOperation instance BG.Storable SDL_FlashOperation

deriving via BG.CUInt instance BG.Prim SDL_FlashOperation

instance CEnum.CEnum SDL_FlashOperation where
  type CEnumZ SDL_FlashOperation = BG.CUInt

  toCEnum = SDL_FlashOperation

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_FLASH_CANCEL")
        , (1, BG.singleton "SDL_FLASH_BRIEFLY")
        , (2, BG.singleton "SDL_FLASH_UNTIL_FOCUSED")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_FlashOperation"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_FlashOperation"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_FlashOperation where
  minDeclaredValue = SDL_FLASH_CANCEL

  maxDeclaredValue = SDL_FLASH_UNTIL_FOCUSED

instance Show SDL_FlashOperation where
  showsPrec = CEnum.shows

instance Read SDL_FlashOperation where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_FlashOperation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FlashOperation{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_FlashOperation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_FlashOperation "unwrap" where
  type
    CFieldType SDL_FlashOperation "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Cancel any window flash state
--
--     [C declaration]: @SDL_FLASH_CANCEL@, defined at @SDL3\/SDL_video.h 330:5@
pattern SDL_FLASH_CANCEL :: SDL_FlashOperation
pattern SDL_FLASH_CANCEL = SDL_FlashOperation 0

-- | Flash the window briefly to get attention
--
--     [C declaration]: @SDL_FLASH_BRIEFLY@, defined at @SDL3\/SDL_video.h 331:5@
pattern SDL_FLASH_BRIEFLY :: SDL_FlashOperation
pattern SDL_FLASH_BRIEFLY = SDL_FlashOperation 1

-- | Flash the window until it gets focus
--
--     [C declaration]: @SDL_FLASH_UNTIL_FOCUSED@, defined at @SDL3\/SDL_video.h 332:5@
pattern SDL_FLASH_UNTIL_FOCUSED :: SDL_FlashOperation
pattern SDL_FLASH_UNTIL_FOCUSED = SDL_FlashOperation 2

-- | Window progress state
--
--     @since 3.2.8
--
--     [C declaration]: @enum SDL_ProgressState@, defined at @SDL3\/SDL_video.h 340:14@
newtype SDL_ProgressState = SDL_ProgressState
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ProgressState where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ProgressState where
  readRaw =
    \ptr0 ->
      pure SDL_ProgressState
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ProgressState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ProgressState unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ProgressState instance BG.Storable SDL_ProgressState

deriving via BG.CInt instance BG.Prim SDL_ProgressState

instance CEnum.CEnum SDL_ProgressState where
  type CEnumZ SDL_ProgressState = BG.CInt

  toCEnum = SDL_ProgressState

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_PROGRESS_STATE_INVALID")
        , (0, BG.singleton "SDL_PROGRESS_STATE_NONE")
        , (1, BG.singleton "SDL_PROGRESS_STATE_INDETERMINATE")
        , (2, BG.singleton "SDL_PROGRESS_STATE_NORMAL")
        , (3, BG.singleton "SDL_PROGRESS_STATE_PAUSED")
        , (4, BG.singleton "SDL_PROGRESS_STATE_ERROR")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ProgressState"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ProgressState"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_ProgressState where
  minDeclaredValue = SDL_PROGRESS_STATE_INVALID

  maxDeclaredValue = SDL_PROGRESS_STATE_ERROR

instance Show SDL_ProgressState where
  showsPrec = CEnum.shows

instance Read SDL_ProgressState where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ProgressState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ProgressState{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ProgressState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ProgressState "unwrap" where
  type CFieldType SDL_ProgressState "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | An invalid progress state indicating an error; check SDL_GetError()
--
--     [C declaration]: @SDL_PROGRESS_STATE_INVALID@, defined at @SDL3\/SDL_video.h 342:5@
pattern SDL_PROGRESS_STATE_INVALID :: SDL_ProgressState
pattern SDL_PROGRESS_STATE_INVALID = SDL_ProgressState (-1)

-- | No progress bar is shown
--
--     [C declaration]: @SDL_PROGRESS_STATE_NONE@, defined at @SDL3\/SDL_video.h 343:5@
pattern SDL_PROGRESS_STATE_NONE :: SDL_ProgressState
pattern SDL_PROGRESS_STATE_NONE = SDL_ProgressState 0

-- | The progress bar is shown in a indeterminate state
--
--     [C declaration]: @SDL_PROGRESS_STATE_INDETERMINATE@, defined at @SDL3\/SDL_video.h 344:5@
pattern SDL_PROGRESS_STATE_INDETERMINATE :: SDL_ProgressState
pattern SDL_PROGRESS_STATE_INDETERMINATE = SDL_ProgressState 1

-- | The progress bar is shown in a normal state
--
--     [C declaration]: @SDL_PROGRESS_STATE_NORMAL@, defined at @SDL3\/SDL_video.h 345:5@
pattern SDL_PROGRESS_STATE_NORMAL :: SDL_ProgressState
pattern SDL_PROGRESS_STATE_NORMAL = SDL_ProgressState 2

-- | The progress bar is shown in a paused state
--
--     [C declaration]: @SDL_PROGRESS_STATE_PAUSED@, defined at @SDL3\/SDL_video.h 346:5@
pattern SDL_PROGRESS_STATE_PAUSED :: SDL_ProgressState
pattern SDL_PROGRESS_STATE_PAUSED = SDL_ProgressState 3

-- | The progress bar is shown in a state indicating the application had an error
--
--     [C declaration]: @SDL_PROGRESS_STATE_ERROR@, defined at @SDL3\/SDL_video.h 347:5@
pattern SDL_PROGRESS_STATE_ERROR :: SDL_ProgressState
pattern SDL_PROGRESS_STATE_ERROR = SDL_ProgressState 4

-- | [C declaration]: @struct SDL_GLContextState@, defined at @SDL3\/SDL_video.h 360:16@
data SDL_GLContextState

-- | An opaque handle to an OpenGL context.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GL_CreateContext', 'sDL_GL_SetAttribute', 'sDL_GL_MakeCurrent', 'sDL_GL_DestroyContext'
--
--     [C declaration]: @SDL_GLContext@, defined at @SDL3\/SDL_video.h 360:36@
newtype SDL_GLContext = SDL_GLContext
  { unwrap :: BG.Ptr SDL_GLContextState
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.Ptr SDL_GLContextState)
  => BG.CompatHasField.HasField "unwrap" SDL_GLContext ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GLContext{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.Ptr SDL_GLContextState)
  => BG.HasField "unwrap" (BG.Ptr SDL_GLContext) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GLContext "unwrap" where
  type
    CFieldType SDL_GLContext "unwrap" =
      BG.Ptr SDL_GLContextState

  offset# = \_ -> \_ -> 0

-- | Opaque type for an EGL display.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGLDisplay@, defined at @SDL3\/SDL_video.h 367:15@
newtype SDL_EGLDisplay = SDL_EGLDisplay
  { unwrap :: BG.Ptr BG.Void
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "unwrap" SDL_EGLDisplay ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EGLDisplay{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "unwrap" (BG.Ptr SDL_EGLDisplay) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EGLDisplay "unwrap" where
  type
    CFieldType SDL_EGLDisplay "unwrap" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 0

-- | Opaque type for an EGL config.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGLConfig@, defined at @SDL3\/SDL_video.h 374:15@
newtype SDL_EGLConfig = SDL_EGLConfig
  { unwrap :: BG.Ptr BG.Void
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "unwrap" SDL_EGLConfig ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EGLConfig{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "unwrap" (BG.Ptr SDL_EGLConfig) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EGLConfig "unwrap" where
  type
    CFieldType SDL_EGLConfig "unwrap" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 0

-- | Opaque type for an EGL surface.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGLSurface@, defined at @SDL3\/SDL_video.h 381:15@
newtype SDL_EGLSurface = SDL_EGLSurface
  { unwrap :: BG.Ptr BG.Void
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "unwrap" SDL_EGLSurface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EGLSurface{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "unwrap" (BG.Ptr SDL_EGLSurface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EGLSurface "unwrap" where
  type
    CFieldType SDL_EGLSurface "unwrap" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 0

-- | An EGL attribute, used when creating an EGL context.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGLAttrib@, defined at @SDL3\/SDL_video.h 388:18@
newtype SDL_EGLAttrib = SDL_EGLAttrib
  { unwrap :: HsBindgen.Runtime.LibC.CIntPtr
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ HsBindgen.Runtime.LibC.CIntPtr)
  => BG.CompatHasField.HasField "unwrap" SDL_EGLAttrib ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EGLAttrib{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.CIntPtr)
  => BG.HasField "unwrap" (BG.Ptr SDL_EGLAttrib) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EGLAttrib "unwrap" where
  type
    CFieldType SDL_EGLAttrib "unwrap" =
      HsBindgen.Runtime.LibC.CIntPtr

  offset# = \_ -> \_ -> 0

-- | An EGL integer attribute, used when creating an EGL surface.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EGLint@, defined at @SDL3\/SDL_video.h 395:13@
newtype SDL_EGLint = SDL_EGLint
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_EGLint ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EGLint{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_EGLint) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EGLint "unwrap" where
  type CFieldType SDL_EGLint "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_EGLAttribArrayCallback'
--
--     [C declaration]: @SDL_EGLAttribArrayCallback@, defined at @SDL3\/SDL_video.h 420:34@
newtype SDL_EGLAttribArrayCallback_Aux = SDL_EGLAttribArrayCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> IO (BG.Ptr SDL_EGLAttrib)
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_EGLAttribArrayCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_11c111f1d1328021_base
    :: (BG.Ptr BG.Void -> IO (BG.Ptr BG.Void))
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO (BG.Ptr BG.Void)))

-- __unique:__ @toSDL_EGLAttribArrayCallback_Aux@
hs_bindgen_11c111f1d1328021
  :: SDL_EGLAttribArrayCallback_Aux
  -> IO (BG.FunPtr SDL_EGLAttribArrayCallback_Aux)
hs_bindgen_11c111f1d1328021 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_11c111f1d1328021_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_EGLAttribArrayCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_30601c44a183aaaa_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO (BG.Ptr BG.Void))
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @fromSDL_EGLAttribArrayCallback_Aux@
hs_bindgen_30601c44a183aaaa
  :: BG.FunPtr SDL_EGLAttribArrayCallback_Aux
  -> SDL_EGLAttribArrayCallback_Aux
hs_bindgen_30601c44a183aaaa =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_30601c44a183aaaa_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_EGLAttribArrayCallback_Aux where
  toFunPtr = hs_bindgen_11c111f1d1328021

instance BG.FromFunPtr SDL_EGLAttribArrayCallback_Aux where
  fromFunPtr = hs_bindgen_30601c44a183aaaa

instance
  (ty ~ (BG.Ptr BG.Void -> IO (BG.Ptr SDL_EGLAttrib)))
  => BG.CompatHasField.HasField "unwrap" SDL_EGLAttribArrayCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 -> SDL_EGLAttribArrayCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO (BG.Ptr SDL_EGLAttrib)))
  => BG.HasField "unwrap" (BG.Ptr SDL_EGLAttribArrayCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EGLAttribArrayCallback_Aux "unwrap" where
  type
    CFieldType SDL_EGLAttribArrayCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> IO (BG.Ptr SDL_EGLAttrib)

  offset# = \_ -> \_ -> 0

-- | EGL platform attribute initialization callback.
--
--     This is called when SDL is attempting to create an EGL context, to let the app add extra attributes to its eglGetPlatformDisplay() call.
--
--     The callback should return a pointer to an EGL attribute array terminated with @EGL_NONE@. If this function returns NULL, the SDL_CreateWindow process will fail gracefully.
--
--     The returned pointer should be allocated with SDL_malloc() and will be passed to SDL_free().
--
--     The arrays returned by each callback will be appended to the existing attribute arrays defined by SDL.
--
--     [@userdata@]: an app-controlled pointer that is passed to the callback.
--
--     [Returns]: a newly-allocated array of attributes, terminated with @EGL_NONE@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EGL_SetAttributeCallbacks'
--
--     [C declaration]: @SDL_EGLAttribArrayCallback@, defined at @SDL3\/SDL_video.h 420:34@
newtype SDL_EGLAttribArrayCallback = SDL_EGLAttribArrayCallback
  { unwrap :: BG.FunPtr SDL_EGLAttribArrayCallback_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_EGLAttribArrayCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_EGLAttribArrayCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EGLAttribArrayCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_EGLAttribArrayCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_EGLAttribArrayCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EGLAttribArrayCallback "unwrap" where
  type
    CFieldType SDL_EGLAttribArrayCallback "unwrap" =
      BG.FunPtr SDL_EGLAttribArrayCallback_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_EGLIntArrayCallback'
--
--     [C declaration]: @SDL_EGLIntArrayCallback@, defined at @SDL3\/SDL_video.h 451:31@
newtype SDL_EGLIntArrayCallback_Aux = SDL_EGLIntArrayCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> SDL_EGLDisplay -> SDL_EGLConfig -> IO (BG.Ptr SDL_EGLint)
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_EGLIntArrayCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_6f9a11d91e338196_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void))
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void)))

-- __unique:__ @toSDL_EGLIntArrayCallback_Aux@
hs_bindgen_6f9a11d91e338196
  :: SDL_EGLIntArrayCallback_Aux
  -> IO (BG.FunPtr SDL_EGLIntArrayCallback_Aux)
hs_bindgen_6f9a11d91e338196 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_6f9a11d91e338196_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_EGLIntArrayCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_19e73e54259a2a81_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void))
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @fromSDL_EGLIntArrayCallback_Aux@
hs_bindgen_19e73e54259a2a81
  :: BG.FunPtr SDL_EGLIntArrayCallback_Aux
  -> SDL_EGLIntArrayCallback_Aux
hs_bindgen_19e73e54259a2a81 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_19e73e54259a2a81_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_EGLIntArrayCallback_Aux where
  toFunPtr = hs_bindgen_6f9a11d91e338196

instance BG.FromFunPtr SDL_EGLIntArrayCallback_Aux where
  fromFunPtr = hs_bindgen_19e73e54259a2a81

instance
  (ty ~ (BG.Ptr BG.Void -> SDL_EGLDisplay -> SDL_EGLConfig -> IO (BG.Ptr SDL_EGLint)))
  => BG.CompatHasField.HasField "unwrap" SDL_EGLIntArrayCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EGLIntArrayCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> SDL_EGLDisplay -> SDL_EGLConfig -> IO (BG.Ptr SDL_EGLint)))
  => BG.HasField "unwrap" (BG.Ptr SDL_EGLIntArrayCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EGLIntArrayCallback_Aux "unwrap" where
  type
    CFieldType SDL_EGLIntArrayCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> SDL_EGLDisplay -> SDL_EGLConfig -> IO (BG.Ptr SDL_EGLint)

  offset# = \_ -> \_ -> 0

-- | EGL surface\/context attribute initialization callback types.
--
--     This is called when SDL is attempting to create an EGL surface, to let the app add extra attributes to its eglCreateWindowSurface() or eglCreateContext calls.
--
--     For convenience, the EGLDisplay and EGLConfig to use are provided to the callback.
--
--     The callback should return a pointer to an EGL attribute array terminated with @EGL_NONE@. If this function returns NULL, the SDL_CreateWindow process will fail gracefully.
--
--     The returned pointer should be allocated with SDL_malloc() and will be passed to SDL_free().
--
--     The arrays returned by each callback will be appended to the existing attribute arrays defined by SDL.
--
--     [@userdata@]: an app-controlled pointer that is passed to the callback.
--
--     [@display@]: the EGL display to be used.
--
--     [@config@]: the EGL config to be used.
--
--     [Returns]: a newly-allocated array of attributes, terminated with @EGL_NONE@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EGL_SetAttributeCallbacks'
--
--     [C declaration]: @SDL_EGLIntArrayCallback@, defined at @SDL3\/SDL_video.h 451:31@
newtype SDL_EGLIntArrayCallback = SDL_EGLIntArrayCallback
  { unwrap :: BG.FunPtr SDL_EGLIntArrayCallback_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_EGLIntArrayCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_EGLIntArrayCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EGLIntArrayCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_EGLIntArrayCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_EGLIntArrayCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EGLIntArrayCallback "unwrap" where
  type
    CFieldType SDL_EGLIntArrayCallback "unwrap" =
      BG.FunPtr SDL_EGLIntArrayCallback_Aux

  offset# = \_ -> \_ -> 0

-- | An enumeration of OpenGL configuration attributes.
--
--     While you can set most OpenGL attributes normally, the attributes listed above must be known before SDL creates the window that will be used with the OpenGL context. These attributes are set and read with @SDL_GL_SetAttribute()@ and @SDL_GL_GetAttribute()@.
--
--     In some cases, these attributes are minimum requests; the GL does not promise to give you exactly what you asked for. It\'s possible to ask for a 16-bit depth buffer and get a 24-bit one instead, for example, or to ask for no stencil buffer and still have one available. Context creation should fail if the GL can\'t provide your requested attributes at a minimum, but you should check to see exactly what you got.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_GLAttr@, defined at @SDL3\/SDL_video.h 470:14@
newtype SDL_GLAttr = SDL_GLAttr
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_GLAttr where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_GLAttr where
  readRaw =
    \ptr0 ->
      pure SDL_GLAttr
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_GLAttr where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GLAttr unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_GLAttr instance BG.Storable SDL_GLAttr

deriving via BG.CUInt instance BG.Prim SDL_GLAttr

instance CEnum.CEnum SDL_GLAttr where
  type CEnumZ SDL_GLAttr = BG.CUInt

  toCEnum = SDL_GLAttr

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_GL_RED_SIZE")
        , (1, BG.singleton "SDL_GL_GREEN_SIZE")
        , (2, BG.singleton "SDL_GL_BLUE_SIZE")
        , (3, BG.singleton "SDL_GL_ALPHA_SIZE")
        , (4, BG.singleton "SDL_GL_BUFFER_SIZE")
        , (5, BG.singleton "SDL_GL_DOUBLEBUFFER")
        , (6, BG.singleton "SDL_GL_DEPTH_SIZE")
        , (7, BG.singleton "SDL_GL_STENCIL_SIZE")
        , (8, BG.singleton "SDL_GL_ACCUM_RED_SIZE")
        , (9, BG.singleton "SDL_GL_ACCUM_GREEN_SIZE")
        , (10, BG.singleton "SDL_GL_ACCUM_BLUE_SIZE")
        , (11, BG.singleton "SDL_GL_ACCUM_ALPHA_SIZE")
        , (12, BG.singleton "SDL_GL_STEREO")
        , (13, BG.singleton "SDL_GL_MULTISAMPLEBUFFERS")
        , (14, BG.singleton "SDL_GL_MULTISAMPLESAMPLES")
        , (15, BG.singleton "SDL_GL_ACCELERATED_VISUAL")
        , (16, BG.singleton "SDL_GL_RETAINED_BACKING")
        , (17, BG.singleton "SDL_GL_CONTEXT_MAJOR_VERSION")
        , (18, BG.singleton "SDL_GL_CONTEXT_MINOR_VERSION")
        , (19, BG.singleton "SDL_GL_CONTEXT_FLAGS")
        , (20, BG.singleton "SDL_GL_CONTEXT_PROFILE_MASK")
        , (21, BG.singleton "SDL_GL_SHARE_WITH_CURRENT_CONTEXT")
        , (22, BG.singleton "SDL_GL_FRAMEBUFFER_SRGB_CAPABLE")
        , (23, BG.singleton "SDL_GL_CONTEXT_RELEASE_BEHAVIOR")
        , (24, BG.singleton "SDL_GL_CONTEXT_RESET_NOTIFICATION")
        , (25, BG.singleton "SDL_GL_CONTEXT_NO_ERROR")
        , (26, BG.singleton "SDL_GL_FLOATBUFFERS")
        , (27, BG.singleton "SDL_GL_EGL_PLATFORM")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_GLAttr"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_GLAttr"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_GLAttr where
  minDeclaredValue = SDL_GL_RED_SIZE

  maxDeclaredValue = SDL_GL_EGL_PLATFORM

instance Show SDL_GLAttr where
  showsPrec = CEnum.shows

instance Read SDL_GLAttr where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_GLAttr ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GLAttr{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_GLAttr) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GLAttr "unwrap" where
  type CFieldType SDL_GLAttr "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | the minimum number of bits for the red channel of the color buffer; defaults to 8.
--
--     [C declaration]: @SDL_GL_RED_SIZE@, defined at @SDL3\/SDL_video.h 472:5@
pattern SDL_GL_RED_SIZE :: SDL_GLAttr
pattern SDL_GL_RED_SIZE = SDL_GLAttr 0

-- | the minimum number of bits for the green channel of the color buffer; defaults to 8.
--
--     [C declaration]: @SDL_GL_GREEN_SIZE@, defined at @SDL3\/SDL_video.h 473:5@
pattern SDL_GL_GREEN_SIZE :: SDL_GLAttr
pattern SDL_GL_GREEN_SIZE = SDL_GLAttr 1

-- | the minimum number of bits for the blue channel of the color buffer; defaults to 8.
--
--     [C declaration]: @SDL_GL_BLUE_SIZE@, defined at @SDL3\/SDL_video.h 474:5@
pattern SDL_GL_BLUE_SIZE :: SDL_GLAttr
pattern SDL_GL_BLUE_SIZE = SDL_GLAttr 2

-- | the minimum number of bits for the alpha channel of the color buffer; defaults to 8.
--
--     [C declaration]: @SDL_GL_ALPHA_SIZE@, defined at @SDL3\/SDL_video.h 475:5@
pattern SDL_GL_ALPHA_SIZE :: SDL_GLAttr
pattern SDL_GL_ALPHA_SIZE = SDL_GLAttr 3

-- | the minimum number of bits for frame buffer size; defaults to 0.
--
--     [C declaration]: @SDL_GL_BUFFER_SIZE@, defined at @SDL3\/SDL_video.h 476:5@
pattern SDL_GL_BUFFER_SIZE :: SDL_GLAttr
pattern SDL_GL_BUFFER_SIZE = SDL_GLAttr 4

-- | whether the output is single or double buffered; defaults to double buffering on.
--
--     [C declaration]: @SDL_GL_DOUBLEBUFFER@, defined at @SDL3\/SDL_video.h 477:5@
pattern SDL_GL_DOUBLEBUFFER :: SDL_GLAttr
pattern SDL_GL_DOUBLEBUFFER = SDL_GLAttr 5

-- | the minimum number of bits in the depth buffer; defaults to 16.
--
--     [C declaration]: @SDL_GL_DEPTH_SIZE@, defined at @SDL3\/SDL_video.h 478:5@
pattern SDL_GL_DEPTH_SIZE :: SDL_GLAttr
pattern SDL_GL_DEPTH_SIZE = SDL_GLAttr 6

-- | the minimum number of bits in the stencil buffer; defaults to 0.
--
--     [C declaration]: @SDL_GL_STENCIL_SIZE@, defined at @SDL3\/SDL_video.h 479:5@
pattern SDL_GL_STENCIL_SIZE :: SDL_GLAttr
pattern SDL_GL_STENCIL_SIZE = SDL_GLAttr 7

-- | the minimum number of bits for the red channel of the accumulation buffer; defaults to 0.
--
--     [C declaration]: @SDL_GL_ACCUM_RED_SIZE@, defined at @SDL3\/SDL_video.h 480:5@
pattern SDL_GL_ACCUM_RED_SIZE :: SDL_GLAttr
pattern SDL_GL_ACCUM_RED_SIZE = SDL_GLAttr 8

-- | the minimum number of bits for the green channel of the accumulation buffer; defaults to 0.
--
--     [C declaration]: @SDL_GL_ACCUM_GREEN_SIZE@, defined at @SDL3\/SDL_video.h 481:5@
pattern SDL_GL_ACCUM_GREEN_SIZE :: SDL_GLAttr
pattern SDL_GL_ACCUM_GREEN_SIZE = SDL_GLAttr 9

-- | the minimum number of bits for the blue channel of the accumulation buffer; defaults to 0.
--
--     [C declaration]: @SDL_GL_ACCUM_BLUE_SIZE@, defined at @SDL3\/SDL_video.h 482:5@
pattern SDL_GL_ACCUM_BLUE_SIZE :: SDL_GLAttr
pattern SDL_GL_ACCUM_BLUE_SIZE = SDL_GLAttr 10

-- | the minimum number of bits for the alpha channel of the accumulation buffer; defaults to 0.
--
--     [C declaration]: @SDL_GL_ACCUM_ALPHA_SIZE@, defined at @SDL3\/SDL_video.h 483:5@
pattern SDL_GL_ACCUM_ALPHA_SIZE :: SDL_GLAttr
pattern SDL_GL_ACCUM_ALPHA_SIZE = SDL_GLAttr 11

-- | whether the output is stereo 3D; defaults to off.
--
--     [C declaration]: @SDL_GL_STEREO@, defined at @SDL3\/SDL_video.h 484:5@
pattern SDL_GL_STEREO :: SDL_GLAttr
pattern SDL_GL_STEREO = SDL_GLAttr 12

-- | the number of buffers used for multisample anti-aliasing; defaults to 0.
--
--     [C declaration]: @SDL_GL_MULTISAMPLEBUFFERS@, defined at @SDL3\/SDL_video.h 485:5@
pattern SDL_GL_MULTISAMPLEBUFFERS :: SDL_GLAttr
pattern SDL_GL_MULTISAMPLEBUFFERS = SDL_GLAttr 13

-- | the number of samples used around the current pixel used for multisample anti-aliasing.
--
--     [C declaration]: @SDL_GL_MULTISAMPLESAMPLES@, defined at @SDL3\/SDL_video.h 486:5@
pattern SDL_GL_MULTISAMPLESAMPLES :: SDL_GLAttr
pattern SDL_GL_MULTISAMPLESAMPLES = SDL_GLAttr 14

-- | set to 1 to require hardware acceleration, set to 0 to force software rendering; defaults to allow either.
--
--     [C declaration]: @SDL_GL_ACCELERATED_VISUAL@, defined at @SDL3\/SDL_video.h 487:5@
pattern SDL_GL_ACCELERATED_VISUAL :: SDL_GLAttr
pattern SDL_GL_ACCELERATED_VISUAL = SDL_GLAttr 15

-- | not used (deprecated).
--
--     [C declaration]: @SDL_GL_RETAINED_BACKING@, defined at @SDL3\/SDL_video.h 488:5@
pattern SDL_GL_RETAINED_BACKING :: SDL_GLAttr
pattern SDL_GL_RETAINED_BACKING = SDL_GLAttr 16

-- | OpenGL context major version.
--
--     [C declaration]: @SDL_GL_CONTEXT_MAJOR_VERSION@, defined at @SDL3\/SDL_video.h 489:5@
pattern SDL_GL_CONTEXT_MAJOR_VERSION :: SDL_GLAttr
pattern SDL_GL_CONTEXT_MAJOR_VERSION = SDL_GLAttr 17

-- | OpenGL context minor version.
--
--     [C declaration]: @SDL_GL_CONTEXT_MINOR_VERSION@, defined at @SDL3\/SDL_video.h 490:5@
pattern SDL_GL_CONTEXT_MINOR_VERSION :: SDL_GLAttr
pattern SDL_GL_CONTEXT_MINOR_VERSION = SDL_GLAttr 18

-- | some combination of 0 or more of elements of the 'SDL_GLContextFlag' enumeration; defaults to 0.
--
--     [C declaration]: @SDL_GL_CONTEXT_FLAGS@, defined at @SDL3\/SDL_video.h 491:5@
pattern SDL_GL_CONTEXT_FLAGS :: SDL_GLAttr
pattern SDL_GL_CONTEXT_FLAGS = SDL_GLAttr 19

-- | type of GL context (Core, Compatibility, ES). See 'SDL_GLProfile'; default value depends on platform.
--
--     [C declaration]: @SDL_GL_CONTEXT_PROFILE_MASK@, defined at @SDL3\/SDL_video.h 492:5@
pattern SDL_GL_CONTEXT_PROFILE_MASK :: SDL_GLAttr
pattern SDL_GL_CONTEXT_PROFILE_MASK = SDL_GLAttr 20

-- | OpenGL context sharing; defaults to 0.
--
--     [C declaration]: @SDL_GL_SHARE_WITH_CURRENT_CONTEXT@, defined at @SDL3\/SDL_video.h 493:5@
pattern SDL_GL_SHARE_WITH_CURRENT_CONTEXT :: SDL_GLAttr
pattern SDL_GL_SHARE_WITH_CURRENT_CONTEXT = SDL_GLAttr 21

-- | requests sRGB-capable visual if 1. Defaults to -1 (\"don\'t care\"). This is a request; GL drivers might not comply!
--
--     [C declaration]: @SDL_GL_FRAMEBUFFER_SRGB_CAPABLE@, defined at @SDL3\/SDL_video.h 494:5@
pattern SDL_GL_FRAMEBUFFER_SRGB_CAPABLE :: SDL_GLAttr
pattern SDL_GL_FRAMEBUFFER_SRGB_CAPABLE = SDL_GLAttr 22

-- | sets context the release behavior. See 'SDL_GLContextReleaseFlag'; defaults to FLUSH.
--
--     [C declaration]: @SDL_GL_CONTEXT_RELEASE_BEHAVIOR@, defined at @SDL3\/SDL_video.h 495:5@
pattern SDL_GL_CONTEXT_RELEASE_BEHAVIOR :: SDL_GLAttr
pattern SDL_GL_CONTEXT_RELEASE_BEHAVIOR = SDL_GLAttr 23

-- | set context reset notification. See 'SDL_GLContextResetNotification'; defaults to NO_NOTIFICATION.
--
--     [C declaration]: @SDL_GL_CONTEXT_RESET_NOTIFICATION@, defined at @SDL3\/SDL_video.h 496:5@
pattern SDL_GL_CONTEXT_RESET_NOTIFICATION :: SDL_GLAttr
pattern SDL_GL_CONTEXT_RESET_NOTIFICATION = SDL_GLAttr 24

-- | [C declaration]: @SDL_GL_CONTEXT_NO_ERROR@, defined at @SDL3\/SDL_video.h 497:5@
pattern SDL_GL_CONTEXT_NO_ERROR :: SDL_GLAttr
pattern SDL_GL_CONTEXT_NO_ERROR = SDL_GLAttr 25

-- | [C declaration]: @SDL_GL_FLOATBUFFERS@, defined at @SDL3\/SDL_video.h 498:5@
pattern SDL_GL_FLOATBUFFERS :: SDL_GLAttr
pattern SDL_GL_FLOATBUFFERS = SDL_GLAttr 26

-- | [C declaration]: @SDL_GL_EGL_PLATFORM@, defined at @SDL3\/SDL_video.h 499:5@
pattern SDL_GL_EGL_PLATFORM :: SDL_GLAttr
pattern SDL_GL_EGL_PLATFORM = SDL_GLAttr 27

-- | Possible values to be set for the SDL_GL_CONTEXT_PROFILE_MASK attribute.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GLProfile@, defined at @SDL3\/SDL_video.h 507:16@
newtype SDL_GLProfile = SDL_GLProfile
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_GLProfile ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GLProfile{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_GLProfile) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GLProfile "unwrap" where
  type
    CFieldType SDL_GLProfile "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | OpenGL Core Profile context
--
--     [C declaration]: @macro SDL_GL_CONTEXT_PROFILE_CORE@, defined at @SDL3\/SDL_video.h 509:9@
sDL_GL_CONTEXT_PROFILE_CORE :: BG.CInt
sDL_GL_CONTEXT_PROFILE_CORE = (1 :: BG.CInt)

-- | OpenGL Compatibility Profile context
--
--     [C declaration]: @macro SDL_GL_CONTEXT_PROFILE_COMPATIBILITY@, defined at @SDL3\/SDL_video.h 510:9@
sDL_GL_CONTEXT_PROFILE_COMPATIBILITY :: BG.CInt
sDL_GL_CONTEXT_PROFILE_COMPATIBILITY = (2 :: BG.CInt)

-- | GLX_CONTEXT_ES2_PROFILE_BIT_EXT
--
--     [C declaration]: @macro SDL_GL_CONTEXT_PROFILE_ES@, defined at @SDL3\/SDL_video.h 511:9@
sDL_GL_CONTEXT_PROFILE_ES :: BG.CInt
sDL_GL_CONTEXT_PROFILE_ES = (4 :: BG.CInt)

-- | Possible flags to be set for the SDL_GL_CONTEXT_FLAGS attribute.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GLContextFlag@, defined at @SDL3\/SDL_video.h 519:16@
newtype SDL_GLContextFlag = SDL_GLContextFlag
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_GLContextFlag ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GLContextFlag{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_GLContextFlag) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GLContextFlag "unwrap" where
  type
    CFieldType SDL_GLContextFlag "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @macro SDL_GL_CONTEXT_DEBUG_FLAG@, defined at @SDL3\/SDL_video.h 521:9@
sDL_GL_CONTEXT_DEBUG_FLAG :: BG.CInt
sDL_GL_CONTEXT_DEBUG_FLAG = (1 :: BG.CInt)

-- | [C declaration]: @macro SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG@, defined at @SDL3\/SDL_video.h 522:9@
sDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG :: BG.CInt
sDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG =
  (2 :: BG.CInt)

-- | [C declaration]: @macro SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG@, defined at @SDL3\/SDL_video.h 523:9@
sDL_GL_CONTEXT_ROBUST_ACCESS_FLAG :: BG.CInt
sDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = (4 :: BG.CInt)

-- | [C declaration]: @macro SDL_GL_CONTEXT_RESET_ISOLATION_FLAG@, defined at @SDL3\/SDL_video.h 524:9@
sDL_GL_CONTEXT_RESET_ISOLATION_FLAG :: BG.CInt
sDL_GL_CONTEXT_RESET_ISOLATION_FLAG = (8 :: BG.CInt)

-- | Possible values to be set for the SDL_GL_CONTEXT_RELEASE_BEHAVIOR attribute.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GLContextReleaseFlag@, defined at @SDL3\/SDL_video.h 533:16@
newtype SDL_GLContextReleaseFlag = SDL_GLContextReleaseFlag
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_GLContextReleaseFlag ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GLContextReleaseFlag{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_GLContextReleaseFlag) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GLContextReleaseFlag "unwrap" where
  type
    CFieldType SDL_GLContextReleaseFlag "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @macro SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE@, defined at @SDL3\/SDL_video.h 535:9@
sDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE :: BG.CInt
sDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = (0 :: BG.CInt)

-- | [C declaration]: @macro SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH@, defined at @SDL3\/SDL_video.h 536:9@
sDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH :: BG.CInt
sDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH =
  (1 :: BG.CInt)

-- | Possible values to be set SDL_GL_CONTEXT_RESET_NOTIFICATION attribute.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GLContextResetNotification@, defined at @SDL3\/SDL_video.h 544:16@
newtype SDL_GLContextResetNotification = SDL_GLContextResetNotification
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_GLContextResetNotification ty
  where
  hasField =
    \x0 ->
      ( \y1 -> SDL_GLContextResetNotification{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_GLContextResetNotification) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GLContextResetNotification "unwrap" where
  type
    CFieldType SDL_GLContextResetNotification "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @macro SDL_GL_CONTEXT_RESET_NO_NOTIFICATION@, defined at @SDL3\/SDL_video.h 546:9@
sDL_GL_CONTEXT_RESET_NO_NOTIFICATION :: BG.CInt
sDL_GL_CONTEXT_RESET_NO_NOTIFICATION = (0 :: BG.CInt)

-- | [C declaration]: @macro SDL_GL_CONTEXT_RESET_LOSE_CONTEXT@, defined at @SDL3\/SDL_video.h 547:9@
sDL_GL_CONTEXT_RESET_LOSE_CONTEXT :: BG.CInt
sDL_GL_CONTEXT_RESET_LOSE_CONTEXT = (1 :: BG.CInt)

-- | [C declaration]: @macro SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN@, literal @\"SDL.display.HDR_enabled\"@, defined at @SDL3\/SDL_video.h 684:9@
sDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN :: BG.ByteString
sDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x64
    , 0x69
    , 0x73
    , 0x70
    , 0x6C
    , 0x61
    , 0x79
    , 0x2E
    , 0x48
    , 0x44
    , 0x52
    , 0x5F
    , 0x65
    , 0x6E
    , 0x61
    , 0x62
    , 0x6C
    , 0x65
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER@, literal @\"SDL.display.KMSDRM.panel_orientation\"@, defined at @SDL3\/SDL_video.h 685:9@
sDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER :: BG.ByteString
sDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x64
    , 0x69
    , 0x73
    , 0x70
    , 0x6C
    , 0x61
    , 0x79
    , 0x2E
    , 0x4B
    , 0x4D
    , 0x53
    , 0x44
    , 0x52
    , 0x4D
    , 0x2E
    , 0x70
    , 0x61
    , 0x6E
    , 0x65
    , 0x6C
    , 0x5F
    , 0x6F
    , 0x72
    , 0x69
    , 0x65
    , 0x6E
    , 0x74
    , 0x61
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER@, literal @\"SDL.display.wayland.wl_output\"@, defined at @SDL3\/SDL_video.h 686:9@
sDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER :: BG.ByteString
sDL_PROP_DISPLAY_WAYLAND_WL_OUTPUT_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x64
    , 0x69
    , 0x73
    , 0x70
    , 0x6C
    , 0x61
    , 0x79
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x77
    , 0x6C
    , 0x5F
    , 0x6F
    , 0x75
    , 0x74
    , 0x70
    , 0x75
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER@, literal @\"SDL.display.windows.hmonitor\"@, defined at @SDL3\/SDL_video.h 687:9@
sDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER :: BG.ByteString
sDL_PROP_DISPLAY_WINDOWS_HMONITOR_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x64
    , 0x69
    , 0x73
    , 0x70
    , 0x6C
    , 0x61
    , 0x79
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x73
    , 0x2E
    , 0x68
    , 0x6D
    , 0x6F
    , 0x6E
    , 0x69
    , 0x74
    , 0x6F
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN@, literal @\"SDL.window.create.always_on_top\"@, defined at @SDL3\/SDL_video.h 1411:9@
sDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x61
    , 0x6C
    , 0x77
    , 0x61
    , 0x79
    , 0x73
    , 0x5F
    , 0x6F
    , 0x6E
    , 0x5F
    , 0x74
    , 0x6F
    , 0x70
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN@, literal @\"SDL.window.create.borderless\"@, defined at @SDL3\/SDL_video.h 1412:9@
sDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x62
    , 0x6F
    , 0x72
    , 0x64
    , 0x65
    , 0x72
    , 0x6C
    , 0x65
    , 0x73
    , 0x73
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN@, literal @\"SDL.window.create.constrain_popup\"@, defined at @SDL3\/SDL_video.h 1413:9@
sDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x63
    , 0x6F
    , 0x6E
    , 0x73
    , 0x74
    , 0x72
    , 0x61
    , 0x69
    , 0x6E
    , 0x5F
    , 0x70
    , 0x6F
    , 0x70
    , 0x75
    , 0x70
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN@, literal @\"SDL.window.create.focusable\"@, defined at @SDL3\/SDL_video.h 1414:9@
sDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x66
    , 0x6F
    , 0x63
    , 0x75
    , 0x73
    , 0x61
    , 0x62
    , 0x6C
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN@, literal @\"SDL.window.create.external_graphics_context\"@, defined at @SDL3\/SDL_video.h 1415:9@
sDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x65
    , 0x78
    , 0x74
    , 0x65
    , 0x72
    , 0x6E
    , 0x61
    , 0x6C
    , 0x5F
    , 0x67
    , 0x72
    , 0x61
    , 0x70
    , 0x68
    , 0x69
    , 0x63
    , 0x73
    , 0x5F
    , 0x63
    , 0x6F
    , 0x6E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER@, literal @\"SDL.window.create.flags\"@, defined at @SDL3\/SDL_video.h 1416:9@
sDL_PROP_WINDOW_CREATE_FLAGS_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_FLAGS_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x66
    , 0x6C
    , 0x61
    , 0x67
    , 0x73
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN@, literal @\"SDL.window.create.fullscreen\"@, defined at @SDL3\/SDL_video.h 1417:9@
sDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x66
    , 0x75
    , 0x6C
    , 0x6C
    , 0x73
    , 0x63
    , 0x72
    , 0x65
    , 0x65
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER@, literal @\"SDL.window.create.height\"@, defined at @SDL3\/SDL_video.h 1418:9@
sDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x68
    , 0x65
    , 0x69
    , 0x67
    , 0x68
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN@, literal @\"SDL.window.create.hidden\"@, defined at @SDL3\/SDL_video.h 1419:9@
sDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x68
    , 0x69
    , 0x64
    , 0x64
    , 0x65
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN@, literal @\"SDL.window.create.high_pixel_density\"@, defined at @SDL3\/SDL_video.h 1420:9@
sDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x68
    , 0x69
    , 0x67
    , 0x68
    , 0x5F
    , 0x70
    , 0x69
    , 0x78
    , 0x65
    , 0x6C
    , 0x5F
    , 0x64
    , 0x65
    , 0x6E
    , 0x73
    , 0x69
    , 0x74
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN@, literal @\"SDL.window.create.maximized\"@, defined at @SDL3\/SDL_video.h 1421:9@
sDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6D
    , 0x61
    , 0x78
    , 0x69
    , 0x6D
    , 0x69
    , 0x7A
    , 0x65
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN@, literal @\"SDL.window.create.menu\"@, defined at @SDL3\/SDL_video.h 1422:9@
sDL_PROP_WINDOW_CREATE_MENU_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_MENU_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6D
    , 0x65
    , 0x6E
    , 0x75
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN@, literal @\"SDL.window.create.metal\"@, defined at @SDL3\/SDL_video.h 1423:9@
sDL_PROP_WINDOW_CREATE_METAL_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_METAL_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN@, literal @\"SDL.window.create.minimized\"@, defined at @SDL3\/SDL_video.h 1424:9@
sDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6D
    , 0x69
    , 0x6E
    , 0x69
    , 0x6D
    , 0x69
    , 0x7A
    , 0x65
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN@, literal @\"SDL.window.create.modal\"@, defined at @SDL3\/SDL_video.h 1425:9@
sDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6D
    , 0x6F
    , 0x64
    , 0x61
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN@, literal @\"SDL.window.create.mouse_grabbed\"@, defined at @SDL3\/SDL_video.h 1426:9@
sDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6D
    , 0x6F
    , 0x75
    , 0x73
    , 0x65
    , 0x5F
    , 0x67
    , 0x72
    , 0x61
    , 0x62
    , 0x62
    , 0x65
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN@, literal @\"SDL.window.create.opengl\"@, defined at @SDL3\/SDL_video.h 1427:9@
sDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_PARENT_POINTER@, literal @\"SDL.window.create.parent\"@, defined at @SDL3\/SDL_video.h 1428:9@
sDL_PROP_WINDOW_CREATE_PARENT_POINTER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_PARENT_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x70
    , 0x61
    , 0x72
    , 0x65
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN@, literal @\"SDL.window.create.resizable\"@, defined at @SDL3\/SDL_video.h 1429:9@
sDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x72
    , 0x65
    , 0x73
    , 0x69
    , 0x7A
    , 0x61
    , 0x62
    , 0x6C
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_TITLE_STRING@, literal @\"SDL.window.create.title\"@, defined at @SDL3\/SDL_video.h 1430:9@
sDL_PROP_WINDOW_CREATE_TITLE_STRING :: BG.ByteString
sDL_PROP_WINDOW_CREATE_TITLE_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x74
    , 0x69
    , 0x74
    , 0x6C
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN@, literal @\"SDL.window.create.transparent\"@, defined at @SDL3\/SDL_video.h 1431:9@
sDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x74
    , 0x72
    , 0x61
    , 0x6E
    , 0x73
    , 0x70
    , 0x61
    , 0x72
    , 0x65
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN@, literal @\"SDL.window.create.tooltip\"@, defined at @SDL3\/SDL_video.h 1432:9@
sDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x74
    , 0x6F
    , 0x6F
    , 0x6C
    , 0x74
    , 0x69
    , 0x70
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN@, literal @\"SDL.window.create.utility\"@, defined at @SDL3\/SDL_video.h 1433:9@
sDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x75
    , 0x74
    , 0x69
    , 0x6C
    , 0x69
    , 0x74
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN@, literal @\"SDL.window.create.vulkan\"@, defined at @SDL3\/SDL_video.h 1434:9@
sDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x76
    , 0x75
    , 0x6C
    , 0x6B
    , 0x61
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER@, literal @\"SDL.window.create.width\"@, defined at @SDL3\/SDL_video.h 1435:9@
sDL_PROP_WINDOW_CREATE_WIDTH_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_WIDTH_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x69
    , 0x64
    , 0x74
    , 0x68
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_X_NUMBER@, literal @\"SDL.window.create.x\"@, defined at @SDL3\/SDL_video.h 1436:9@
sDL_PROP_WINDOW_CREATE_X_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_X_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x78
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_Y_NUMBER@, literal @\"SDL.window.create.y\"@, defined at @SDL3\/SDL_video.h 1437:9@
sDL_PROP_WINDOW_CREATE_Y_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_Y_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER@, literal @\"SDL.window.create.cocoa.window\"@, defined at @SDL3\/SDL_video.h 1438:9@
sDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x63
    , 0x6F
    , 0x63
    , 0x6F
    , 0x61
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER@, literal @\"SDL.window.create.cocoa.view\"@, defined at @SDL3\/SDL_video.h 1439:9@
sDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x63
    , 0x6F
    , 0x63
    , 0x6F
    , 0x61
    , 0x2E
    , 0x76
    , 0x69
    , 0x65
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER@, literal @\"SDL.window.create.uikit.windowscene\"@, defined at @SDL3\/SDL_video.h 1440:9@
sDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_WINDOWSCENE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x75
    , 0x69
    , 0x6B
    , 0x69
    , 0x74
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x73
    , 0x63
    , 0x65
    , 0x6E
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN@, literal @\"SDL.window.create.wayland.surface_role_custom\"@, defined at @SDL3\/SDL_video.h 1441:9@
sDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    , 0x5F
    , 0x72
    , 0x6F
    , 0x6C
    , 0x65
    , 0x5F
    , 0x63
    , 0x75
    , 0x73
    , 0x74
    , 0x6F
    , 0x6D
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN@, literal @\"SDL.window.create.wayland.create_egl_window\"@, defined at @SDL3\/SDL_video.h 1442:9@
sDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x5F
    , 0x65
    , 0x67
    , 0x6C
    , 0x5F
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER@, literal @\"SDL.window.create.wayland.wl_surface\"@, defined at @SDL3\/SDL_video.h 1443:9@
sDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x77
    , 0x6C
    , 0x5F
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER@, literal @\"SDL.window.create.win32.hwnd\"@, defined at @SDL3\/SDL_video.h 1444:9@
sDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x33
    , 0x32
    , 0x2E
    , 0x68
    , 0x77
    , 0x6E
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER@, literal @\"SDL.window.create.win32.pixel_format_hwnd\"@, defined at @SDL3\/SDL_video.h 1445:9@
sDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x33
    , 0x32
    , 0x2E
    , 0x70
    , 0x69
    , 0x78
    , 0x65
    , 0x6C
    , 0x5F
    , 0x66
    , 0x6F
    , 0x72
    , 0x6D
    , 0x61
    , 0x74
    , 0x5F
    , 0x68
    , 0x77
    , 0x6E
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER@, literal @\"SDL.window.create.x11.window\"@, defined at @SDL3\/SDL_video.h 1446:9@
sDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x78
    , 0x31
    , 0x31
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING@, literal @\"SDL.window.create.emscripten.canvas_id\"@, defined at @SDL3\/SDL_video.h 1447:9@
sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING :: BG.ByteString
sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_CANVAS_ID_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x65
    , 0x6D
    , 0x73
    , 0x63
    , 0x72
    , 0x69
    , 0x70
    , 0x74
    , 0x65
    , 0x6E
    , 0x2E
    , 0x63
    , 0x61
    , 0x6E
    , 0x76
    , 0x61
    , 0x73
    , 0x5F
    , 0x69
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING@, literal @\"SDL.window.create.emscripten.keyboard_element\"@, defined at @SDL3\/SDL_video.h 1448:9@
sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING :: BG.ByteString
sDL_PROP_WINDOW_CREATE_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x65
    , 0x6D
    , 0x73
    , 0x63
    , 0x72
    , 0x69
    , 0x70
    , 0x74
    , 0x65
    , 0x6E
    , 0x2E
    , 0x6B
    , 0x65
    , 0x79
    , 0x62
    , 0x6F
    , 0x61
    , 0x72
    , 0x64
    , 0x5F
    , 0x65
    , 0x6C
    , 0x65
    , 0x6D
    , 0x65
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_SHAPE_POINTER@, literal @\"SDL.window.shape\"@, defined at @SDL3\/SDL_video.h 1630:9@
sDL_PROP_WINDOW_SHAPE_POINTER :: BG.ByteString
sDL_PROP_WINDOW_SHAPE_POINTER =
  BG.pack
    [0x53, 0x44, 0x4C, 0x2E, 0x77, 0x69, 0x6E, 0x64, 0x6F, 0x77, 0x2E, 0x73, 0x68, 0x61, 0x70, 0x65]

-- | [C declaration]: @macro SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN@, literal @\"SDL.window.HDR_enabled\"@, defined at @SDL3\/SDL_video.h 1631:9@
sDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN :: BG.ByteString
sDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x48
    , 0x44
    , 0x52
    , 0x5F
    , 0x65
    , 0x6E
    , 0x61
    , 0x62
    , 0x6C
    , 0x65
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT@, literal @\"SDL.window.SDR_white_level\"@, defined at @SDL3\/SDL_video.h 1632:9@
sDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT :: BG.ByteString
sDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x53
    , 0x44
    , 0x52
    , 0x5F
    , 0x77
    , 0x68
    , 0x69
    , 0x74
    , 0x65
    , 0x5F
    , 0x6C
    , 0x65
    , 0x76
    , 0x65
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT@, literal @\"SDL.window.HDR_headroom\"@, defined at @SDL3\/SDL_video.h 1633:9@
sDL_PROP_WINDOW_HDR_HEADROOM_FLOAT :: BG.ByteString
sDL_PROP_WINDOW_HDR_HEADROOM_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x48
    , 0x44
    , 0x52
    , 0x5F
    , 0x68
    , 0x65
    , 0x61
    , 0x64
    , 0x72
    , 0x6F
    , 0x6F
    , 0x6D
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER@, literal @\"SDL.window.android.window\"@, defined at @SDL3\/SDL_video.h 1634:9@
sDL_PROP_WINDOW_ANDROID_WINDOW_POINTER :: BG.ByteString
sDL_PROP_WINDOW_ANDROID_WINDOW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x61
    , 0x6E
    , 0x64
    , 0x72
    , 0x6F
    , 0x69
    , 0x64
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER@, literal @\"SDL.window.android.surface\"@, defined at @SDL3\/SDL_video.h 1635:9@
sDL_PROP_WINDOW_ANDROID_SURFACE_POINTER :: BG.ByteString
sDL_PROP_WINDOW_ANDROID_SURFACE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x61
    , 0x6E
    , 0x64
    , 0x72
    , 0x6F
    , 0x69
    , 0x64
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER@, literal @\"SDL.window.uikit.window\"@, defined at @SDL3\/SDL_video.h 1636:9@
sDL_PROP_WINDOW_UIKIT_WINDOW_POINTER :: BG.ByteString
sDL_PROP_WINDOW_UIKIT_WINDOW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x75
    , 0x69
    , 0x6B
    , 0x69
    , 0x74
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER@, literal @\"SDL.window.uikit.metal_view_tag\"@, defined at @SDL3\/SDL_video.h 1637:9@
sDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x75
    , 0x69
    , 0x6B
    , 0x69
    , 0x74
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x6C
    , 0x5F
    , 0x76
    , 0x69
    , 0x65
    , 0x77
    , 0x5F
    , 0x74
    , 0x61
    , 0x67
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER@, literal @\"SDL.window.uikit.opengl.framebuffer\"@, defined at @SDL3\/SDL_video.h 1638:9@
sDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x75
    , 0x69
    , 0x6B
    , 0x69
    , 0x74
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x66
    , 0x72
    , 0x61
    , 0x6D
    , 0x65
    , 0x62
    , 0x75
    , 0x66
    , 0x66
    , 0x65
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER@, literal @\"SDL.window.uikit.opengl.renderbuffer\"@, defined at @SDL3\/SDL_video.h 1639:9@
sDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x75
    , 0x69
    , 0x6B
    , 0x69
    , 0x74
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x72
    , 0x65
    , 0x6E
    , 0x64
    , 0x65
    , 0x72
    , 0x62
    , 0x75
    , 0x66
    , 0x66
    , 0x65
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER@, literal @\"SDL.window.uikit.opengl.resolve_framebuffer\"@, defined at @SDL3\/SDL_video.h 1640:9@
sDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x75
    , 0x69
    , 0x6B
    , 0x69
    , 0x74
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x67
    , 0x6C
    , 0x2E
    , 0x72
    , 0x65
    , 0x73
    , 0x6F
    , 0x6C
    , 0x76
    , 0x65
    , 0x5F
    , 0x66
    , 0x72
    , 0x61
    , 0x6D
    , 0x65
    , 0x62
    , 0x75
    , 0x66
    , 0x66
    , 0x65
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER@, literal @\"SDL.window.kmsdrm.dev_index\"@, defined at @SDL3\/SDL_video.h 1641:9@
sDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x6B
    , 0x6D
    , 0x73
    , 0x64
    , 0x72
    , 0x6D
    , 0x2E
    , 0x64
    , 0x65
    , 0x76
    , 0x5F
    , 0x69
    , 0x6E
    , 0x64
    , 0x65
    , 0x78
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER@, literal @\"SDL.window.kmsdrm.drm_fd\"@, defined at @SDL3\/SDL_video.h 1642:9@
sDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x6B
    , 0x6D
    , 0x73
    , 0x64
    , 0x72
    , 0x6D
    , 0x2E
    , 0x64
    , 0x72
    , 0x6D
    , 0x5F
    , 0x66
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER@, literal @\"SDL.window.kmsdrm.gbm_dev\"@, defined at @SDL3\/SDL_video.h 1643:9@
sDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER :: BG.ByteString
sDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x6B
    , 0x6D
    , 0x73
    , 0x64
    , 0x72
    , 0x6D
    , 0x2E
    , 0x67
    , 0x62
    , 0x6D
    , 0x5F
    , 0x64
    , 0x65
    , 0x76
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_COCOA_WINDOW_POINTER@, literal @\"SDL.window.cocoa.window\"@, defined at @SDL3\/SDL_video.h 1644:9@
sDL_PROP_WINDOW_COCOA_WINDOW_POINTER :: BG.ByteString
sDL_PROP_WINDOW_COCOA_WINDOW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x6F
    , 0x63
    , 0x6F
    , 0x61
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER@, literal @\"SDL.window.cocoa.metal_view_tag\"@, defined at @SDL3\/SDL_video.h 1645:9@
sDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x63
    , 0x6F
    , 0x63
    , 0x6F
    , 0x61
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x6C
    , 0x5F
    , 0x76
    , 0x69
    , 0x65
    , 0x77
    , 0x5F
    , 0x74
    , 0x61
    , 0x67
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER@, literal @\"SDL.window.openvr.overlay_id\"@, defined at @SDL3\/SDL_video.h 1646:9@
sDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_OPENVR_OVERLAY_ID_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x6F
    , 0x70
    , 0x65
    , 0x6E
    , 0x76
    , 0x72
    , 0x2E
    , 0x6F
    , 0x76
    , 0x65
    , 0x72
    , 0x6C
    , 0x61
    , 0x79
    , 0x5F
    , 0x69
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER@, literal @\"SDL.window.vivante.display\"@, defined at @SDL3\/SDL_video.h 1647:9@
sDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER :: BG.ByteString
sDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x76
    , 0x69
    , 0x76
    , 0x61
    , 0x6E
    , 0x74
    , 0x65
    , 0x2E
    , 0x64
    , 0x69
    , 0x73
    , 0x70
    , 0x6C
    , 0x61
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER@, literal @\"SDL.window.vivante.window\"@, defined at @SDL3\/SDL_video.h 1648:9@
sDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER :: BG.ByteString
sDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x76
    , 0x69
    , 0x76
    , 0x61
    , 0x6E
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER@, literal @\"SDL.window.vivante.surface\"@, defined at @SDL3\/SDL_video.h 1649:9@
sDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER :: BG.ByteString
sDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x76
    , 0x69
    , 0x76
    , 0x61
    , 0x6E
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WIN32_HWND_POINTER@, literal @\"SDL.window.win32.hwnd\"@, defined at @SDL3\/SDL_video.h 1650:9@
sDL_PROP_WINDOW_WIN32_HWND_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WIN32_HWND_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x33
    , 0x32
    , 0x2E
    , 0x68
    , 0x77
    , 0x6E
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WIN32_HDC_POINTER@, literal @\"SDL.window.win32.hdc\"@, defined at @SDL3\/SDL_video.h 1651:9@
sDL_PROP_WINDOW_WIN32_HDC_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WIN32_HDC_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x33
    , 0x32
    , 0x2E
    , 0x68
    , 0x64
    , 0x63
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER@, literal @\"SDL.window.win32.instance\"@, defined at @SDL3\/SDL_video.h 1652:9@
sDL_PROP_WINDOW_WIN32_INSTANCE_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WIN32_INSTANCE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x33
    , 0x32
    , 0x2E
    , 0x69
    , 0x6E
    , 0x73
    , 0x74
    , 0x61
    , 0x6E
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER@, literal @\"SDL.window.wayland.display\"@, defined at @SDL3\/SDL_video.h 1653:9@
sDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x64
    , 0x69
    , 0x73
    , 0x70
    , 0x6C
    , 0x61
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER@, literal @\"SDL.window.wayland.surface\"@, defined at @SDL3\/SDL_video.h 1654:9@
sDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER@, literal @\"SDL.window.wayland.viewport\"@, defined at @SDL3\/SDL_video.h 1655:9@
sDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x76
    , 0x69
    , 0x65
    , 0x77
    , 0x70
    , 0x6F
    , 0x72
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER@, literal @\"SDL.window.wayland.egl_window\"@, defined at @SDL3\/SDL_video.h 1656:9@
sDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x65
    , 0x67
    , 0x6C
    , 0x5F
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER@, literal @\"SDL.window.wayland.xdg_surface\"@, defined at @SDL3\/SDL_video.h 1657:9@
sDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x78
    , 0x64
    , 0x67
    , 0x5F
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER@, literal @\"SDL.window.wayland.xdg_toplevel\"@, defined at @SDL3\/SDL_video.h 1658:9@
sDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x78
    , 0x64
    , 0x67
    , 0x5F
    , 0x74
    , 0x6F
    , 0x70
    , 0x6C
    , 0x65
    , 0x76
    , 0x65
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING@, literal @\"SDL.window.wayland.xdg_toplevel_export_handle\"@, defined at @SDL3\/SDL_video.h 1659:9@
sDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING :: BG.ByteString
sDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x78
    , 0x64
    , 0x67
    , 0x5F
    , 0x74
    , 0x6F
    , 0x70
    , 0x6C
    , 0x65
    , 0x76
    , 0x65
    , 0x6C
    , 0x5F
    , 0x65
    , 0x78
    , 0x70
    , 0x6F
    , 0x72
    , 0x74
    , 0x5F
    , 0x68
    , 0x61
    , 0x6E
    , 0x64
    , 0x6C
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER@, literal @\"SDL.window.wayland.xdg_popup\"@, defined at @SDL3\/SDL_video.h 1660:9@
sDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x78
    , 0x64
    , 0x67
    , 0x5F
    , 0x70
    , 0x6F
    , 0x70
    , 0x75
    , 0x70
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER@, literal @\"SDL.window.wayland.xdg_positioner\"@, defined at @SDL3\/SDL_video.h 1661:9@
sDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER :: BG.ByteString
sDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x77
    , 0x61
    , 0x79
    , 0x6C
    , 0x61
    , 0x6E
    , 0x64
    , 0x2E
    , 0x78
    , 0x64
    , 0x67
    , 0x5F
    , 0x70
    , 0x6F
    , 0x73
    , 0x69
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    , 0x65
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_X11_DISPLAY_POINTER@, literal @\"SDL.window.x11.display\"@, defined at @SDL3\/SDL_video.h 1662:9@
sDL_PROP_WINDOW_X11_DISPLAY_POINTER :: BG.ByteString
sDL_PROP_WINDOW_X11_DISPLAY_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x78
    , 0x31
    , 0x31
    , 0x2E
    , 0x64
    , 0x69
    , 0x73
    , 0x70
    , 0x6C
    , 0x61
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_X11_SCREEN_NUMBER@, literal @\"SDL.window.x11.screen\"@, defined at @SDL3\/SDL_video.h 1663:9@
sDL_PROP_WINDOW_X11_SCREEN_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_X11_SCREEN_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x78
    , 0x31
    , 0x31
    , 0x2E
    , 0x73
    , 0x63
    , 0x72
    , 0x65
    , 0x65
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_X11_WINDOW_NUMBER@, literal @\"SDL.window.x11.window\"@, defined at @SDL3\/SDL_video.h 1664:9@
sDL_PROP_WINDOW_X11_WINDOW_NUMBER :: BG.ByteString
sDL_PROP_WINDOW_X11_WINDOW_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x78
    , 0x31
    , 0x31
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING@, literal @\"SDL.window.emscripten.canvas_id\"@, defined at @SDL3\/SDL_video.h 1665:9@
sDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING :: BG.ByteString
sDL_PROP_WINDOW_EMSCRIPTEN_CANVAS_ID_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x65
    , 0x6D
    , 0x73
    , 0x63
    , 0x72
    , 0x69
    , 0x70
    , 0x74
    , 0x65
    , 0x6E
    , 0x2E
    , 0x63
    , 0x61
    , 0x6E
    , 0x76
    , 0x61
    , 0x73
    , 0x5F
    , 0x69
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING@, literal @\"SDL.window.emscripten.keyboard_element\"@, defined at @SDL3\/SDL_video.h 1666:9@
sDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING :: BG.ByteString
sDL_PROP_WINDOW_EMSCRIPTEN_KEYBOARD_ELEMENT_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x2E
    , 0x65
    , 0x6D
    , 0x73
    , 0x63
    , 0x72
    , 0x69
    , 0x70
    , 0x74
    , 0x65
    , 0x6E
    , 0x2E
    , 0x6B
    , 0x65
    , 0x79
    , 0x62
    , 0x6F
    , 0x61
    , 0x72
    , 0x64
    , 0x5F
    , 0x65
    , 0x6C
    , 0x65
    , 0x6D
    , 0x65
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_WINDOW_SURFACE_VSYNC_DISABLED@, defined at @SDL3\/SDL_video.h 2463:9@
sDL_WINDOW_SURFACE_VSYNC_DISABLED :: BG.CInt
sDL_WINDOW_SURFACE_VSYNC_DISABLED = (0 :: BG.CInt)

-- | [C declaration]: @macro SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE@, defined at @SDL3\/SDL_video.h 2464:9@
sDL_WINDOW_SURFACE_VSYNC_ADAPTIVE :: BG.CInt
sDL_WINDOW_SURFACE_VSYNC_ADAPTIVE =
  C.Expr.HostPlatform.negate (1 :: BG.CInt)

-- | Possible return values from the 'SDL_HitTest' callback.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_HitTest'
--
--     [C declaration]: @enum SDL_HitTestResult@, defined at @SDL3\/SDL_video.h 2828:14@
newtype SDL_HitTestResult = SDL_HitTestResult
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_HitTestResult where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_HitTestResult where
  readRaw =
    \ptr0 ->
      pure SDL_HitTestResult
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_HitTestResult where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_HitTestResult unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_HitTestResult instance BG.Storable SDL_HitTestResult

deriving via BG.CUInt instance BG.Prim SDL_HitTestResult

instance CEnum.CEnum SDL_HitTestResult where
  type CEnumZ SDL_HitTestResult = BG.CUInt

  toCEnum = SDL_HitTestResult

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_HITTEST_NORMAL")
        , (1, BG.singleton "SDL_HITTEST_DRAGGABLE")
        , (2, BG.singleton "SDL_HITTEST_RESIZE_TOPLEFT")
        , (3, BG.singleton "SDL_HITTEST_RESIZE_TOP")
        , (4, BG.singleton "SDL_HITTEST_RESIZE_TOPRIGHT")
        , (5, BG.singleton "SDL_HITTEST_RESIZE_RIGHT")
        , (6, BG.singleton "SDL_HITTEST_RESIZE_BOTTOMRIGHT")
        , (7, BG.singleton "SDL_HITTEST_RESIZE_BOTTOM")
        , (8, BG.singleton "SDL_HITTEST_RESIZE_BOTTOMLEFT")
        , (9, BG.singleton "SDL_HITTEST_RESIZE_LEFT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_HitTestResult"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_HitTestResult"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_HitTestResult where
  minDeclaredValue = SDL_HITTEST_NORMAL

  maxDeclaredValue = SDL_HITTEST_RESIZE_LEFT

instance Show SDL_HitTestResult where
  showsPrec = CEnum.shows

instance Read SDL_HitTestResult where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_HitTestResult ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HitTestResult{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_HitTestResult) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HitTestResult "unwrap" where
  type CFieldType SDL_HitTestResult "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Region is normal. No special properties.
--
--     [C declaration]: @SDL_HITTEST_NORMAL@, defined at @SDL3\/SDL_video.h 2830:5@
pattern SDL_HITTEST_NORMAL :: SDL_HitTestResult
pattern SDL_HITTEST_NORMAL = SDL_HitTestResult 0

-- | Region can drag entire window.
--
--     [C declaration]: @SDL_HITTEST_DRAGGABLE@, defined at @SDL3\/SDL_video.h 2831:5@
pattern SDL_HITTEST_DRAGGABLE :: SDL_HitTestResult
pattern SDL_HITTEST_DRAGGABLE = SDL_HitTestResult 1

-- | Region is the resizable top-left corner border.
--
--     [C declaration]: @SDL_HITTEST_RESIZE_TOPLEFT@, defined at @SDL3\/SDL_video.h 2832:5@
pattern SDL_HITTEST_RESIZE_TOPLEFT :: SDL_HitTestResult
pattern SDL_HITTEST_RESIZE_TOPLEFT = SDL_HitTestResult 2

-- | Region is the resizable top border.
--
--     [C declaration]: @SDL_HITTEST_RESIZE_TOP@, defined at @SDL3\/SDL_video.h 2833:5@
pattern SDL_HITTEST_RESIZE_TOP :: SDL_HitTestResult
pattern SDL_HITTEST_RESIZE_TOP = SDL_HitTestResult 3

-- | Region is the resizable top-right corner border.
--
--     [C declaration]: @SDL_HITTEST_RESIZE_TOPRIGHT@, defined at @SDL3\/SDL_video.h 2834:5@
pattern SDL_HITTEST_RESIZE_TOPRIGHT :: SDL_HitTestResult
pattern SDL_HITTEST_RESIZE_TOPRIGHT = SDL_HitTestResult 4

-- | Region is the resizable right border.
--
--     [C declaration]: @SDL_HITTEST_RESIZE_RIGHT@, defined at @SDL3\/SDL_video.h 2835:5@
pattern SDL_HITTEST_RESIZE_RIGHT :: SDL_HitTestResult
pattern SDL_HITTEST_RESIZE_RIGHT = SDL_HitTestResult 5

-- | Region is the resizable bottom-right corner border.
--
--     [C declaration]: @SDL_HITTEST_RESIZE_BOTTOMRIGHT@, defined at @SDL3\/SDL_video.h 2836:5@
pattern SDL_HITTEST_RESIZE_BOTTOMRIGHT :: SDL_HitTestResult
pattern SDL_HITTEST_RESIZE_BOTTOMRIGHT = SDL_HitTestResult 6

-- | Region is the resizable bottom border.
--
--     [C declaration]: @SDL_HITTEST_RESIZE_BOTTOM@, defined at @SDL3\/SDL_video.h 2837:5@
pattern SDL_HITTEST_RESIZE_BOTTOM :: SDL_HitTestResult
pattern SDL_HITTEST_RESIZE_BOTTOM = SDL_HitTestResult 7

-- | Region is the resizable bottom-left corner border.
--
--     [C declaration]: @SDL_HITTEST_RESIZE_BOTTOMLEFT@, defined at @SDL3\/SDL_video.h 2838:5@
pattern SDL_HITTEST_RESIZE_BOTTOMLEFT :: SDL_HitTestResult
pattern SDL_HITTEST_RESIZE_BOTTOMLEFT = SDL_HitTestResult 8

-- | Region is the resizable left border.
--
--     [C declaration]: @SDL_HITTEST_RESIZE_LEFT@, defined at @SDL3\/SDL_video.h 2839:5@
pattern SDL_HITTEST_RESIZE_LEFT :: SDL_HitTestResult
pattern SDL_HITTEST_RESIZE_LEFT = SDL_HitTestResult 9

-- | Auxiliary type used by 'SDL_HitTest'
--
--     [C declaration]: @SDL_HitTest@, defined at @SDL3\/SDL_video.h 2852:37@
newtype SDL_HitTest_Aux = SDL_HitTest_Aux
  { unwrap
      :: BG.Ptr SDL_Window
      -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point
      -> BG.Ptr BG.Void
      -> IO SDL_HitTestResult
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_HitTest_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_22e8e872c7c7261b_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32))

-- __unique:__ @toSDL_HitTest_Aux@
hs_bindgen_22e8e872c7c7261b
  :: SDL_HitTest_Aux
  -> IO (BG.FunPtr SDL_HitTest_Aux)
hs_bindgen_22e8e872c7c7261b =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_22e8e872c7c7261b_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_HitTest_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_33151ef072f28e0c_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @fromSDL_HitTest_Aux@
hs_bindgen_33151ef072f28e0c
  :: BG.FunPtr SDL_HitTest_Aux
  -> SDL_HitTest_Aux
hs_bindgen_33151ef072f28e0c =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_33151ef072f28e0c_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_HitTest_Aux where
  toFunPtr = hs_bindgen_22e8e872c7c7261b

instance BG.FromFunPtr SDL_HitTest_Aux where
  fromFunPtr = hs_bindgen_33151ef072f28e0c

instance
  ( ty
      ~ ( BG.Ptr SDL_Window
          -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point
          -> BG.Ptr BG.Void
          -> IO SDL_HitTestResult
        )
  )
  => BG.CompatHasField.HasField "unwrap" SDL_HitTest_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HitTest_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  ( ty
      ~ ( BG.Ptr SDL_Window
          -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point
          -> BG.Ptr BG.Void
          -> IO SDL_HitTestResult
        )
  )
  => BG.HasField "unwrap" (BG.Ptr SDL_HitTest_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HitTest_Aux "unwrap" where
  type
    CFieldType SDL_HitTest_Aux "unwrap" =
      BG.Ptr SDL_Window
      -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Point
      -> BG.Ptr BG.Void
      -> IO SDL_HitTestResult

  offset# = \_ -> \_ -> 0

-- | Callback used for hit-testing.
--
--     [@win@]: the 'SDL_Window' where hit-testing was set on.
--
--     [@area@]: an SDL_Point which should be hit-tested.
--
--     [@data@]: what was passed as @callback_data@ to @SDL_SetWindowHitTest()@.
--
--     [Returns]: an 'SDL_HitTestResult' value.
--
--     [See also]: 'sDL_SetWindowHitTest'
--
--     [C declaration]: @SDL_HitTest@, defined at @SDL3\/SDL_video.h 2852:37@
newtype SDL_HitTest = SDL_HitTest
  { unwrap :: BG.FunPtr SDL_HitTest_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_HitTest_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_HitTest ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_HitTest{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_HitTest_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_HitTest) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_HitTest "unwrap" where
  type
    CFieldType SDL_HitTest "unwrap" =
      BG.FunPtr SDL_HitTest_Aux

  offset# = \_ -> \_ -> 0
