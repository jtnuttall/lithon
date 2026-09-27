{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

module Mpv.Sys.Bindgen.RenderGl (
  Mpv.Sys.Bindgen.RenderGl.Mpv_opengl_init_params (..),
  Mpv.Sys.Bindgen.RenderGl.Mpv_opengl_fbo (..),
  Mpv.Sys.Bindgen.RenderGl.Mpv_opengl_drm_params (..),
  Mpv.Sys.Bindgen.RenderGl.C_DrmModeAtomicReq,
  Mpv.Sys.Bindgen.RenderGl.Mpv_opengl_drm_draw_surface_size (..),
  Mpv.Sys.Bindgen.RenderGl.Mpv_opengl_drm_params_v2 (..),
  Mpv.Sys.Bindgen.RenderGl.Mpv_opengl_drm_osd_size (..),
)
where

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | OpenGL backend
--
--     This header contains definitions for using OpenGL with the render.h API.
--
--     OpenGL interop
--
--     The OpenGL backend has some special rules, because OpenGL itself uses implicit per-thread contexts, which causes additional API problems.
--
--     This assumes the OpenGL context lives on a certain thread controlled by the API user. All mpv_render_* APIs have to be assumed to implicitly use the OpenGL context if you pass a mpv_render_context using the OpenGL backend, unless specified otherwise.
--
--     The OpenGL context is indirectly accessed through the OpenGL function pointers returned by the get_proc_address callback in 'Mpv_opengl_init_params'. Generally, mpv will not load the system OpenGL library when using this API.
--
--     OpenGL state
--
--     OpenGL has a large amount of implicit state. All the mpv functions mentioned above expect that the OpenGL state is reasonably set to OpenGL standard defaults. Likewise, mpv will attempt to leave the OpenGL context with standard defaults. The following state is excluded from this: - the glViewport state
--  - the glScissor state (but GL_SCISSOR_TEST is in its default value)
--  - glBlendFuncSeparate() state (but GL_BLEND is in its default value)
--  - glClearColor() state
--  - mpv may overwrite the callback set with glDebugMessageCallback()
--  - mpv always disables GL_DITHER at init
--
--     Messing with the state could be avoided by creating shared OpenGL contexts, but this is avoided for the sake of compatibility and interoperability.
--
--     On OpenGL 2.1, mpv will strictly call functions like glGenTextures() to create OpenGL objects. You will have to do the same. This ensures that objects created by mpv and the API users don\'t clash. Also, legacy state must be either in its defaults, or not interfere with core state.
--
--     API use
--
--     The mpv_render_* API is used. That API supports multiple backends, and this section documents specifics for the OpenGL backend.
--
--     Use mpv_render_context_create() with MPV_RENDER_PARAM_API_TYPE set to MPV_RENDER_API_TYPE_OPENGL, and MPV_RENDER_PARAM_OPENGL_INIT_PARAMS provided.
--
--     Call mpv_render_context_render() with MPV_RENDER_PARAM_OPENGL_FBO to render the video frame to an FBO.
--
--     Hardware decoding
--
--     Hardware decoding via this API is fully supported, but requires some additional setup. (At least if direct hardware decoding modes are wanted, instead of copying back surface data from GPU to CPU RAM.)
--
--     There may be certain requirements on the OpenGL implementation:
--
--     * Windows: ANGLE is required (although in theory GL\/DX interop could be used)
--
--     * Intel\/Linux: EGL is required, and also the native display resource needs to be provided (e.g. MPV_RENDER_PARAM_X11_DISPLAY for X11 and MPV_RENDER_PARAM_WL_DISPLAY for Wayland)
--
--     * nVidia\/Linux: Both GLX and EGL should work (GLX is required if vdpau is used, e.g. due to old drivers.)
--
--     * macOS: CGL is required (CGLGetCurrentContext() returning non-NULL)
--
--     * iOS: EAGL is required (EAGLContext.currentContext returning non-nil)
--
--     Once these things are setup, hardware decoding can be enabled\/disabled at any time by setting the \"hwdec\" property. For initializing the mpv OpenGL state via MPV_RENDER_PARAM_OPENGL_INIT_PARAMS.
--
--     [C declaration]: @struct mpv_opengl_init_params@, defined at @mpv\/render_gl.h 106:16@
data Mpv_opengl_init_params = Mpv_opengl_init_params
  { get_proc_address :: BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.Void))
  -- ^ This retrieves OpenGL function pointers, and will use them in subsequent operation. Usually, you can simply call the GL context APIs from this callback (e.g. glXGetProcAddressARB or wglGetProcAddress), but some APIs do not always return pointers for all standard functions (even if present); in this case you have to compensate by looking up these functions yourself when libmpv wants to resolve them through this callback. libmpv will not normally attempt to resolve GL functions on its own, nor does it link to GL libraries directly.
  --
  --          [C declaration]: @get_proc_address@, defined at @mpv\/render_gl.h 118:13@
  , get_proc_address_ctx :: BG.Ptr BG.Void
  -- ^ Value passed as ctx parameter to @get_proc_address()@.
  --
  --          [C declaration]: @get_proc_address_ctx@, defined at @mpv\/render_gl.h 122:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_opengl_init_params where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_opengl_init_params where
  readRaw =
    \ptr0 ->
      pure Mpv_opengl_init_params
        <*> HasCField.readRaw (BG.Proxy @"get_proc_address") ptr0
        <*> HasCField.readRaw (BG.Proxy @"get_proc_address_ctx") ptr0

instance Marshal.WriteRaw Mpv_opengl_init_params where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_opengl_init_params get_proc_address2 get_proc_address_ctx3 ->
            HasCField.writeRaw (BG.Proxy @"get_proc_address") ptr0 get_proc_address2
              >> HasCField.writeRaw (BG.Proxy @"get_proc_address_ctx") ptr0 get_proc_address_ctx3

deriving via
  Marshal.EquivStorable Mpv_opengl_init_params
  instance
    BG.Storable Mpv_opengl_init_params

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.Void)))
  => BG.CompatHasField.HasField "get_proc_address" Mpv_opengl_init_params ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_init_params
            { get_proc_address = y1
            , get_proc_address_ctx = BG.getField @"get_proc_address_ctx" x0
            }
      , BG.getField @"get_proc_address" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.Void)))
  => BG.HasField "get_proc_address" (BG.Ptr Mpv_opengl_init_params) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"get_proc_address")

instance HasCField.HasCField Mpv_opengl_init_params "get_proc_address" where
  type
    CFieldType Mpv_opengl_init_params "get_proc_address" =
      BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.Void))

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "get_proc_address_ctx" Mpv_opengl_init_params ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_init_params
            { get_proc_address_ctx = y1
            , get_proc_address = BG.getField @"get_proc_address" x0
            }
      , BG.getField @"get_proc_address_ctx" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "get_proc_address_ctx" (BG.Ptr Mpv_opengl_init_params) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"get_proc_address_ctx")

instance HasCField.HasCField Mpv_opengl_init_params "get_proc_address_ctx" where
  type
    CFieldType Mpv_opengl_init_params "get_proc_address_ctx" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 8

-- | For MPV_RENDER_PARAM_OPENGL_FBO.
--
--     [C declaration]: @struct mpv_opengl_fbo@, defined at @mpv\/render_gl.h 128:16@
data Mpv_opengl_fbo = Mpv_opengl_fbo
  { fbo :: BG.CInt
  -- ^ Framebuffer object name. This must be either a valid FBO generated by glGenFramebuffers() that is complete and color-renderable, or 0. If the value is 0, this refers to the OpenGL default framebuffer.
  --
  --          [C declaration]: @fbo@, defined at @mpv\/render_gl.h 134:9@
  , w :: BG.CInt
  -- ^ Valid dimensions. This must refer to the size of the framebuffer. This must always be set.
  --
  --          [C declaration]: @w@, defined at @mpv\/render_gl.h 139:9@
  , h :: BG.CInt
  -- ^ [C declaration]: @h@, defined at @mpv\/render_gl.h 139:12@
  , internal_format :: BG.CInt
  -- ^ Underlying texture internal format (e.g. GL_RGBA8), or 0 if unknown. If this is the default framebuffer, this can be an equivalent.
  --
  --          [C declaration]: @internal_format@, defined at @mpv\/render_gl.h 144:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_opengl_fbo where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_opengl_fbo where
  readRaw =
    \ptr0 ->
      pure Mpv_opengl_fbo
        <*> HasCField.readRaw (BG.Proxy @"fbo") ptr0
        <*> HasCField.readRaw (BG.Proxy @"w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"h") ptr0
        <*> HasCField.readRaw (BG.Proxy @"internal_format") ptr0

instance Marshal.WriteRaw Mpv_opengl_fbo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_opengl_fbo fbo2 w3 h4 internal_format5 ->
            HasCField.writeRaw (BG.Proxy @"fbo") ptr0 fbo2
              >> HasCField.writeRaw (BG.Proxy @"w") ptr0 w3
              >> HasCField.writeRaw (BG.Proxy @"h") ptr0 h4
              >> HasCField.writeRaw (BG.Proxy @"internal_format") ptr0 internal_format5

deriving via Marshal.EquivStorable Mpv_opengl_fbo instance BG.Storable Mpv_opengl_fbo

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "fbo" Mpv_opengl_fbo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_fbo
            { fbo = y1
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , internal_format = BG.getField @"internal_format" x0
            }
      , BG.getField @"fbo" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "fbo" (BG.Ptr Mpv_opengl_fbo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fbo")

instance HasCField.HasCField Mpv_opengl_fbo "fbo" where
  type CFieldType Mpv_opengl_fbo "fbo" = BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "w" Mpv_opengl_fbo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_fbo
            { w = y1
            , fbo = BG.getField @"fbo" x0
            , h = BG.getField @"h" x0
            , internal_format = BG.getField @"internal_format" x0
            }
      , BG.getField @"w" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "w" (BG.Ptr Mpv_opengl_fbo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"w")

instance HasCField.HasCField Mpv_opengl_fbo "w" where
  type CFieldType Mpv_opengl_fbo "w" = BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "h" Mpv_opengl_fbo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_fbo
            { h = y1
            , fbo = BG.getField @"fbo" x0
            , w = BG.getField @"w" x0
            , internal_format = BG.getField @"internal_format" x0
            }
      , BG.getField @"h" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "h" (BG.Ptr Mpv_opengl_fbo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"h")

instance HasCField.HasCField Mpv_opengl_fbo "h" where
  type CFieldType Mpv_opengl_fbo "h" = BG.CInt

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "internal_format" Mpv_opengl_fbo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_fbo
            { internal_format = y1
            , fbo = BG.getField @"fbo" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            }
      , BG.getField @"internal_format" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "internal_format" (BG.Ptr Mpv_opengl_fbo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"internal_format")

instance HasCField.HasCField Mpv_opengl_fbo "internal_format" where
  type
    CFieldType Mpv_opengl_fbo "internal_format" =
      BG.CInt

  offset# = \_ -> \_ -> 12

-- | Deprecated. For MPV_RENDER_PARAM_DRM_DISPLAY.
--
--     [C declaration]: @struct mpv_opengl_drm_params@, defined at @mpv\/render_gl.h 150:16@
data Mpv_opengl_drm_params = Mpv_opengl_drm_params
  { fd :: BG.CInt
  -- ^ [C declaration]: @fd@, defined at @mpv\/render_gl.h 151:9@
  , crtc_id :: BG.CInt
  -- ^ [C declaration]: @crtc_id@, defined at @mpv\/render_gl.h 152:9@
  , connector_id :: BG.CInt
  -- ^ [C declaration]: @connector_id@, defined at @mpv\/render_gl.h 153:9@
  , atomic_request_ptr :: BG.Ptr (BG.Ptr C_DrmModeAtomicReq)
  -- ^ [C declaration]: @atomic_request_ptr@, defined at @mpv\/render_gl.h 154:32@
  , render_fd :: BG.CInt
  -- ^ [C declaration]: @render_fd@, defined at @mpv\/render_gl.h 155:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_opengl_drm_params where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_opengl_drm_params where
  readRaw =
    \ptr0 ->
      pure Mpv_opengl_drm_params
        <*> HasCField.readRaw (BG.Proxy @"fd") ptr0
        <*> HasCField.readRaw (BG.Proxy @"crtc_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"connector_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"atomic_request_ptr") ptr0
        <*> HasCField.readRaw (BG.Proxy @"render_fd") ptr0

instance Marshal.WriteRaw Mpv_opengl_drm_params where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_opengl_drm_params
            fd2
            crtc_id3
            connector_id4
            atomic_request_ptr5
            render_fd6 ->
              HasCField.writeRaw (BG.Proxy @"fd") ptr0 fd2
                >> HasCField.writeRaw (BG.Proxy @"crtc_id") ptr0 crtc_id3
                >> HasCField.writeRaw (BG.Proxy @"connector_id") ptr0 connector_id4
                >> HasCField.writeRaw (BG.Proxy @"atomic_request_ptr") ptr0 atomic_request_ptr5
                >> HasCField.writeRaw (BG.Proxy @"render_fd") ptr0 render_fd6

deriving via Marshal.EquivStorable Mpv_opengl_drm_params instance BG.Storable Mpv_opengl_drm_params

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "fd" Mpv_opengl_drm_params ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params
            { fd = y1
            , crtc_id = BG.getField @"crtc_id" x0
            , connector_id = BG.getField @"connector_id" x0
            , atomic_request_ptr = BG.getField @"atomic_request_ptr" x0
            , render_fd = BG.getField @"render_fd" x0
            }
      , BG.getField @"fd" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "fd" (BG.Ptr Mpv_opengl_drm_params) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fd")

instance HasCField.HasCField Mpv_opengl_drm_params "fd" where
  type CFieldType Mpv_opengl_drm_params "fd" = BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "crtc_id" Mpv_opengl_drm_params ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params
            { crtc_id = y1
            , fd = BG.getField @"fd" x0
            , connector_id = BG.getField @"connector_id" x0
            , atomic_request_ptr = BG.getField @"atomic_request_ptr" x0
            , render_fd = BG.getField @"render_fd" x0
            }
      , BG.getField @"crtc_id" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "crtc_id" (BG.Ptr Mpv_opengl_drm_params) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"crtc_id")

instance HasCField.HasCField Mpv_opengl_drm_params "crtc_id" where
  type
    CFieldType Mpv_opengl_drm_params "crtc_id" =
      BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "connector_id" Mpv_opengl_drm_params ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params
            { connector_id = y1
            , fd = BG.getField @"fd" x0
            , crtc_id = BG.getField @"crtc_id" x0
            , atomic_request_ptr = BG.getField @"atomic_request_ptr" x0
            , render_fd = BG.getField @"render_fd" x0
            }
      , BG.getField @"connector_id" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "connector_id" (BG.Ptr Mpv_opengl_drm_params) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"connector_id")

instance HasCField.HasCField Mpv_opengl_drm_params "connector_id" where
  type
    CFieldType Mpv_opengl_drm_params "connector_id" =
      BG.CInt

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.Ptr (BG.Ptr C_DrmModeAtomicReq))
  => BG.CompatHasField.HasField "atomic_request_ptr" Mpv_opengl_drm_params ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params
            { atomic_request_ptr = y1
            , fd = BG.getField @"fd" x0
            , crtc_id = BG.getField @"crtc_id" x0
            , connector_id = BG.getField @"connector_id" x0
            , render_fd = BG.getField @"render_fd" x0
            }
      , BG.getField @"atomic_request_ptr" x0
      )

instance
  (ty ~ BG.Ptr (BG.Ptr C_DrmModeAtomicReq))
  => BG.HasField "atomic_request_ptr" (BG.Ptr Mpv_opengl_drm_params) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"atomic_request_ptr")

instance HasCField.HasCField Mpv_opengl_drm_params "atomic_request_ptr" where
  type
    CFieldType Mpv_opengl_drm_params "atomic_request_ptr" =
      BG.Ptr (BG.Ptr C_DrmModeAtomicReq)

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "render_fd" Mpv_opengl_drm_params ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params
            { render_fd = y1
            , fd = BG.getField @"fd" x0
            , crtc_id = BG.getField @"crtc_id" x0
            , connector_id = BG.getField @"connector_id" x0
            , atomic_request_ptr = BG.getField @"atomic_request_ptr" x0
            }
      , BG.getField @"render_fd" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "render_fd" (BG.Ptr Mpv_opengl_drm_params) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"render_fd")

instance HasCField.HasCField Mpv_opengl_drm_params "render_fd" where
  type
    CFieldType Mpv_opengl_drm_params "render_fd" =
      BG.CInt

  offset# = \_ -> \_ -> 24

-- | [C declaration]: @struct _drmModeAtomicReq@, defined at @mpv\/render_gl.h 154:12@
data C_DrmModeAtomicReq

-- | For MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE.
--
--     [C declaration]: @struct mpv_opengl_drm_draw_surface_size@, defined at @mpv\/render_gl.h 161:16@
data Mpv_opengl_drm_draw_surface_size = Mpv_opengl_drm_draw_surface_size
  { width :: BG.CInt
  -- ^ size of the draw plane surface in pixels.
  --
  --          [C declaration]: @width@, defined at @mpv\/render_gl.h 165:9@
  , height :: BG.CInt
  -- ^ [C declaration]: @height@, defined at @mpv\/render_gl.h 165:16@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_opengl_drm_draw_surface_size where
  staticSizeOf = \_ -> (8 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_opengl_drm_draw_surface_size where
  readRaw =
    \ptr0 ->
      pure Mpv_opengl_drm_draw_surface_size
        <*> HasCField.readRaw (BG.Proxy @"width") ptr0
        <*> HasCField.readRaw (BG.Proxy @"height") ptr0

instance Marshal.WriteRaw Mpv_opengl_drm_draw_surface_size where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_opengl_drm_draw_surface_size width2 height3 ->
            HasCField.writeRaw (BG.Proxy @"width") ptr0 width2
              >> HasCField.writeRaw (BG.Proxy @"height") ptr0 height3

deriving via
  Marshal.EquivStorable Mpv_opengl_drm_draw_surface_size
  instance
    BG.Storable Mpv_opengl_drm_draw_surface_size

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "width" Mpv_opengl_drm_draw_surface_size ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_draw_surface_size{width = y1, height = BG.getField @"height" x0}
      , BG.getField @"width" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "width" (BG.Ptr Mpv_opengl_drm_draw_surface_size) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"width")

instance HasCField.HasCField Mpv_opengl_drm_draw_surface_size "width" where
  type
    CFieldType Mpv_opengl_drm_draw_surface_size "width" =
      BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "height" Mpv_opengl_drm_draw_surface_size ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_draw_surface_size{height = y1, width = BG.getField @"width" x0}
      , BG.getField @"height" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "height" (BG.Ptr Mpv_opengl_drm_draw_surface_size) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"height")

instance HasCField.HasCField Mpv_opengl_drm_draw_surface_size "height" where
  type
    CFieldType Mpv_opengl_drm_draw_surface_size "height" =
      BG.CInt

  offset# = \_ -> \_ -> 4

-- | For MPV_RENDER_PARAM_DRM_DISPLAY_V2.
--
--     [C declaration]: @struct mpv_opengl_drm_params_v2@, defined at @mpv\/render_gl.h 171:16@
data Mpv_opengl_drm_params_v2 = Mpv_opengl_drm_params_v2
  { fd :: BG.CInt
  -- ^ DRM fd (int). Set to -1 if invalid.
  --
  --          [C declaration]: @fd@, defined at @mpv\/render_gl.h 175:9@
  , crtc_id :: BG.CInt
  -- ^ Currently used crtc id
  --
  --          [C declaration]: @crtc_id@, defined at @mpv\/render_gl.h 180:9@
  , connector_id :: BG.CInt
  -- ^ Currently used connector id
  --
  --          [C declaration]: @connector_id@, defined at @mpv\/render_gl.h 185:9@
  , atomic_request_ptr :: BG.Ptr (BG.Ptr C_DrmModeAtomicReq)
  -- ^ Pointer to a drmModeAtomicReq pointer that is being used for the renderloop. This pointer should hold a pointer to the atomic request pointer The atomic request pointer is usually changed at every renderloop.
  --
  --          [C declaration]: @atomic_request_ptr@, defined at @mpv\/render_gl.h 192:32@
  , render_fd :: BG.CInt
  -- ^ DRM render node. Used for VAAPI interop. Set to -1 if invalid.
  --
  --          [C declaration]: @render_fd@, defined at @mpv\/render_gl.h 198:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_opengl_drm_params_v2 where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_opengl_drm_params_v2 where
  readRaw =
    \ptr0 ->
      pure Mpv_opengl_drm_params_v2
        <*> HasCField.readRaw (BG.Proxy @"fd") ptr0
        <*> HasCField.readRaw (BG.Proxy @"crtc_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"connector_id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"atomic_request_ptr") ptr0
        <*> HasCField.readRaw (BG.Proxy @"render_fd") ptr0

instance Marshal.WriteRaw Mpv_opengl_drm_params_v2 where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_opengl_drm_params_v2
            fd2
            crtc_id3
            connector_id4
            atomic_request_ptr5
            render_fd6 ->
              HasCField.writeRaw (BG.Proxy @"fd") ptr0 fd2
                >> HasCField.writeRaw (BG.Proxy @"crtc_id") ptr0 crtc_id3
                >> HasCField.writeRaw (BG.Proxy @"connector_id") ptr0 connector_id4
                >> HasCField.writeRaw (BG.Proxy @"atomic_request_ptr") ptr0 atomic_request_ptr5
                >> HasCField.writeRaw (BG.Proxy @"render_fd") ptr0 render_fd6

deriving via
  Marshal.EquivStorable Mpv_opengl_drm_params_v2
  instance
    BG.Storable Mpv_opengl_drm_params_v2

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "fd" Mpv_opengl_drm_params_v2 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params_v2
            { fd = y1
            , crtc_id = BG.getField @"crtc_id" x0
            , connector_id = BG.getField @"connector_id" x0
            , atomic_request_ptr = BG.getField @"atomic_request_ptr" x0
            , render_fd = BG.getField @"render_fd" x0
            }
      , BG.getField @"fd" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "fd" (BG.Ptr Mpv_opengl_drm_params_v2) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"fd")

instance HasCField.HasCField Mpv_opengl_drm_params_v2 "fd" where
  type
    CFieldType Mpv_opengl_drm_params_v2 "fd" =
      BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "crtc_id" Mpv_opengl_drm_params_v2 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params_v2
            { crtc_id = y1
            , fd = BG.getField @"fd" x0
            , connector_id = BG.getField @"connector_id" x0
            , atomic_request_ptr = BG.getField @"atomic_request_ptr" x0
            , render_fd = BG.getField @"render_fd" x0
            }
      , BG.getField @"crtc_id" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "crtc_id" (BG.Ptr Mpv_opengl_drm_params_v2) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"crtc_id")

instance HasCField.HasCField Mpv_opengl_drm_params_v2 "crtc_id" where
  type
    CFieldType Mpv_opengl_drm_params_v2 "crtc_id" =
      BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "connector_id" Mpv_opengl_drm_params_v2 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params_v2
            { connector_id = y1
            , fd = BG.getField @"fd" x0
            , crtc_id = BG.getField @"crtc_id" x0
            , atomic_request_ptr = BG.getField @"atomic_request_ptr" x0
            , render_fd = BG.getField @"render_fd" x0
            }
      , BG.getField @"connector_id" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "connector_id" (BG.Ptr Mpv_opengl_drm_params_v2) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"connector_id")

instance HasCField.HasCField Mpv_opengl_drm_params_v2 "connector_id" where
  type
    CFieldType Mpv_opengl_drm_params_v2 "connector_id" =
      BG.CInt

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.Ptr (BG.Ptr C_DrmModeAtomicReq))
  => BG.CompatHasField.HasField "atomic_request_ptr" Mpv_opengl_drm_params_v2 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params_v2
            { atomic_request_ptr = y1
            , fd = BG.getField @"fd" x0
            , crtc_id = BG.getField @"crtc_id" x0
            , connector_id = BG.getField @"connector_id" x0
            , render_fd = BG.getField @"render_fd" x0
            }
      , BG.getField @"atomic_request_ptr" x0
      )

instance
  (ty ~ BG.Ptr (BG.Ptr C_DrmModeAtomicReq))
  => BG.HasField "atomic_request_ptr" (BG.Ptr Mpv_opengl_drm_params_v2) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"atomic_request_ptr")

instance HasCField.HasCField Mpv_opengl_drm_params_v2 "atomic_request_ptr" where
  type
    CFieldType Mpv_opengl_drm_params_v2 "atomic_request_ptr" =
      BG.Ptr (BG.Ptr C_DrmModeAtomicReq)

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "render_fd" Mpv_opengl_drm_params_v2 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_params_v2
            { render_fd = y1
            , fd = BG.getField @"fd" x0
            , crtc_id = BG.getField @"crtc_id" x0
            , connector_id = BG.getField @"connector_id" x0
            , atomic_request_ptr = BG.getField @"atomic_request_ptr" x0
            }
      , BG.getField @"render_fd" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "render_fd" (BG.Ptr Mpv_opengl_drm_params_v2) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"render_fd")

instance HasCField.HasCField Mpv_opengl_drm_params_v2 "render_fd" where
  type
    CFieldType Mpv_opengl_drm_params_v2 "render_fd" =
      BG.CInt

  offset# = \_ -> \_ -> 24

-- | For backwards compatibility with the old naming of 'Mpv_opengl_drm_draw_surface_size'
--
--     [C declaration]: @macro mpv_opengl_drm_osd_size@, defined at @mpv\/render_gl.h 205:9@
newtype Mpv_opengl_drm_osd_size = Mpv_opengl_drm_osd_size
  { unwrap :: Mpv_opengl_drm_draw_surface_size
  }
  deriving stock (BG.Generic, Eq, Show)
  deriving newtype
    ( BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ Mpv_opengl_drm_draw_surface_size)
  => BG.CompatHasField.HasField "unwrap" Mpv_opengl_drm_osd_size ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_opengl_drm_osd_size{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ Mpv_opengl_drm_draw_surface_size)
  => BG.HasField "unwrap" (BG.Ptr Mpv_opengl_drm_osd_size) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_opengl_drm_osd_size "unwrap" where
  type
    CFieldType Mpv_opengl_drm_osd_size "unwrap" =
      Mpv_opengl_drm_draw_surface_size

  offset# = \_ -> \_ -> 0
