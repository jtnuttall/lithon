{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ForeignFunctionInterface #-}
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
{-# LANGUAGE NoImplicitPrelude #-}

module Mpv.Sys.Bindgen.Render (
  Mpv.Sys.Bindgen.Render.Mpv_render_context,
  Mpv.Sys.Bindgen.Render.Mpv_render_param_type (..),
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_INVALID,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_API_TYPE,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_OPENGL_INIT_PARAMS,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_OPENGL_FBO,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_FLIP_Y,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_DEPTH,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_ICC_PROFILE,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_AMBIENT_LIGHT,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_X11_DISPLAY,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_WL_DISPLAY,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_ADVANCED_CONTROL,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_NEXT_FRAME_INFO,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_SKIP_RENDERING,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_DRM_DISPLAY,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_DRM_DISPLAY_V2,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_SW_SIZE,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_SW_FORMAT,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_SW_STRIDE,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_PARAM_SW_POINTER,
  Mpv.Sys.Bindgen.Render.Mpv_render_param (..),
  Mpv.Sys.Bindgen.Render.mPV_RENDER_API_TYPE_OPENGL,
  Mpv.Sys.Bindgen.Render.mPV_RENDER_API_TYPE_SW,
  Mpv.Sys.Bindgen.Render.Mpv_render_frame_info_flag (..),
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_FRAME_INFO_PRESENT,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_FRAME_INFO_REDRAW,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_FRAME_INFO_REPEAT,
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_FRAME_INFO_BLOCK_VSYNC,
  Mpv.Sys.Bindgen.Render.Mpv_render_frame_info (..),
  Mpv.Sys.Bindgen.Render.Mpv_render_update_fn_Aux (..),
  Mpv.Sys.Bindgen.Render.Mpv_render_update_fn (..),
  Mpv.Sys.Bindgen.Render.Mpv_render_context_flag (..),
  pattern Mpv.Sys.Bindgen.Render.MPV_RENDER_UPDATE_FRAME,
)
where

import Prelude (Eq, IO, Int, Ord, Read, Show, fmap, pure, (<*>), (>>), type (~))

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Struct qualified as Struct
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | Overview
--
--     This API can be used to make mpv render using supported graphic APIs (such as OpenGL). It can be used to handle video display.
--
--     The renderer needs to be created with @mpv_render_context_create()@ before you start playback (or otherwise cause a VO to be created). Then (with most backends) @mpv_render_context_render()@ can be used to explicitly render the current video frame. Use @mpv_render_context_set_update_callback()@ to get notified when there is a new frame to draw.
--
--     Preferably rendering should be done in a separate thread. If you call normal libmpv API functions on the renderer thread, deadlocks can result (these are made non-fatal with timeouts, but user experience will obviously suffer). See \"Threading\" section below.
--
--     You can output and embed video without this API by setting the mpv \"wid\" option to a native window handle (see \"Embedding the video window\" section in the client.h header). In general, using the render API is recommended, because window embedding can cause various issues, especially with GUI toolkits and certain platforms.
--
--     Supported backends
--
--     OpenGL: via MPV_RENDER_API_TYPE_OPENGL, see render_gl.h header. Software: via MPV_RENDER_API_TYPE_SW, see section \"Software renderer\"
--
--     Threading
--
--     You are recommended to do rendering on a separate thread than normal libmpv use.
--
--     The mpv_render_* functions can be called from any thread, under the following conditions:
--
--     * only one of the mpv_render_* functions can be called at the same time (unless they belong to different mpv cores created by mpv_create())
--
--     * never can be called from within the callbacks set with mpv_set_wakeup_callback() or @mpv_render_context_set_update_callback()@
--
--     * if the OpenGL backend is used, for all functions the OpenGL context must be \"current\" in the calling thread, and it must be the same OpenGL context as the 'Mpv_render_context' was created with. Otherwise, undefined behavior will occur.
--
--     * the thread does not call libmpv API functions other than the mpv_render_* functions, except APIs which are declared as safe (see below). Likewise, there must be no lock or wait dependency from the render thread to a thread using other libmpv functions. Basically, the situation that your render thread waits for a \"not safe\" libmpv API function to return must not happen. If you ignore this requirement, deadlocks can happen, which are made non-fatal with timeouts; then playback quality will be degraded, and the message @mpv_render_context_render()@ not being called or stuck. is logged. If you set MPV_RENDER_PARAM_ADVANCED_CONTROL, you promise that this won\'t happen, and must absolutely guarantee it, or a real deadlock will freeze the mpv core thread forever.
--
--     libmpv functions which are safe to call from a render thread are:
--
--     * functions marked with \"Safe to be called from mpv render API threads.\"
--
--     * client.h functions which don\'t have an explicit or implicit mpv_handle parameter
--
--     * mpv_render_* functions; but only for the same 'Mpv_render_context' pointer. If the pointer is different, @mpv_render_context_free()@ is not safe. (The reason is that if MPV_RENDER_PARAM_ADVANCED_CONTROL is set, it may have to process still queued requests from the core, which it can do only for the current context, while requests for other contexts would deadlock. Also, it may have to wait and block for the core to terminate the video chain to make sure no resources are used after context destruction.)
--
--     * if the mpv_handle parameter refers to a different mpv core than the one you\'re rendering for (very obscure, but allowed)
--
--     Note about old libmpv version: Before API version 1.105 (basically in mpv 0.29.x), simply enabling
--  MPV_RENDER_PARAM_ADVANCED_CONTROL could cause deadlock issues. This can
--  be worked around by setting the \"vd-lavc-dr\" option to \"no\".
--  In addition, you were required to call all mpv_render*() API functions
--  from the same thread on which mpv_render_context_create() was originally
--  run (for the same the mpv_render_context). Not honoring it led to UB
--  (deadlocks, use of invalid mp_thread handles), even if you moved your GL
--  context to a different thread correctly.
--  These problems were addressed in API version 1.105 (mpv 0.30.0).
--
--     Context and handle lifecycle
--
--     Video initialization will fail if the render context was not initialized yet (with @mpv_render_context_create()@), or it will revert to a VO that creates its own window.
--
--     Currently, there can be only 1 'Mpv_render_context' at a time per mpv core.
--
--     Calling @mpv_render_context_free()@ while a VO is using the render context is active will disable video.
--
--     You must free the context with @mpv_render_context_free()@ before the mpv core is destroyed. If this doesn\'t happen, undefined behavior will result.
--
--     Software renderer
--
--     MPV_RENDER_API_TYPE_SW provides an extremely simple (but slow) renderer to memory surfaces. You probably don\'t want to use this. Use other render API types, or other methods of video embedding.
--
--     Use @mpv_render_context_create()@ with MPV_RENDER_PARAM_API_TYPE set to MPV_RENDER_API_TYPE_SW.
--
--     Call @mpv_render_context_render()@ with various MPV_RENDER_PARAM_SW_* fields to render the video frame to an in-memory surface. The following fields are required: MPV_RENDER_PARAM_SW_SIZE, MPV_RENDER_PARAM_SW_FORMAT, MPV_RENDER_PARAM_SW_STRIDE, MPV_RENDER_PARAM_SW_POINTER.
--
--     This method of rendering is very slow, because everything, including color conversion, scaling, and OSD rendering, is done on the CPU, single-threaded. In particular, large video or display sizes, as well as presence of OSD or subtitles can make it too slow for realtime. As with other software rendering VOs, setting \"sw-fast\" may help. Enabling or disabling zimg may help, depending on the platform.
--
--     In addition, certain multimedia job creation measures like HDR may not work properly, and will have to be manually handled by for example inserting filters.
--
--     This API is not really suitable to extract individual frames from video etc. (basically non-playback uses) - there are better libraries for this. It can be used this way, but it may be clunky and tricky.
--
--     Further notes:
--
--     * MPV_RENDER_PARAM_FLIP_Y is currently ignored (unsupported)
--
--     * MPV_RENDER_PARAM_DEPTH is ignored (meaningless) Opaque context, returned by @mpv_render_context_create()@.
--
--     [C declaration]: @struct mpv_render_context@, defined at @mpv\/render.h 163:16@
data Mpv_render_context

-- | Parameters for 'Mpv_render_param' (which is used in a few places such as @mpv_render_context_create()@.
--
--     Also see 'Mpv_render_param' for conventions and how to use it.
--
--     [C declaration]: @enum mpv_render_param_type@, defined at @mpv\/render.h 171:14@
newtype Mpv_render_param_type = Mpv_render_param_type
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize Mpv_render_param_type where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_render_param_type where
  readRaw =
    \ptr0 ->
      pure Mpv_render_param_type
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw Mpv_render_param_type where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_render_param_type unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable Mpv_render_param_type instance BG.Storable Mpv_render_param_type

deriving via BG.CUInt instance BG.Prim Mpv_render_param_type

instance CEnum.CEnum Mpv_render_param_type where
  type CEnumZ Mpv_render_param_type = BG.CUInt

  toCEnum = Mpv_render_param_type

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "MPV_RENDER_PARAM_INVALID")
        , (1, BG.singleton "MPV_RENDER_PARAM_API_TYPE")
        , (2, BG.singleton "MPV_RENDER_PARAM_OPENGL_INIT_PARAMS")
        , (3, BG.singleton "MPV_RENDER_PARAM_OPENGL_FBO")
        , (4, BG.singleton "MPV_RENDER_PARAM_FLIP_Y")
        , (5, BG.singleton "MPV_RENDER_PARAM_DEPTH")
        , (6, BG.singleton "MPV_RENDER_PARAM_ICC_PROFILE")
        , (7, BG.singleton "MPV_RENDER_PARAM_AMBIENT_LIGHT")
        , (8, BG.singleton "MPV_RENDER_PARAM_X11_DISPLAY")
        , (9, BG.singleton "MPV_RENDER_PARAM_WL_DISPLAY")
        , (10, BG.singleton "MPV_RENDER_PARAM_ADVANCED_CONTROL")
        , (11, BG.singleton "MPV_RENDER_PARAM_NEXT_FRAME_INFO")
        , (12, BG.singleton "MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME")
        , (13, BG.singleton "MPV_RENDER_PARAM_SKIP_RENDERING")
        , (14, BG.singleton "MPV_RENDER_PARAM_DRM_DISPLAY")
        , (15, BG.singleton "MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE")
        , (16, BG.singleton "MPV_RENDER_PARAM_DRM_DISPLAY_V2")
        , (17, BG.singleton "MPV_RENDER_PARAM_SW_SIZE")
        , (18, BG.singleton "MPV_RENDER_PARAM_SW_FORMAT")
        , (19, BG.singleton "MPV_RENDER_PARAM_SW_STRIDE")
        , (20, BG.singleton "MPV_RENDER_PARAM_SW_POINTER")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "Mpv_render_param_type"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "Mpv_render_param_type"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum Mpv_render_param_type where
  minDeclaredValue = MPV_RENDER_PARAM_INVALID

  maxDeclaredValue = MPV_RENDER_PARAM_SW_POINTER

instance Show Mpv_render_param_type where
  showsPrec = CEnum.shows

instance Read Mpv_render_param_type where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" Mpv_render_param_type ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_render_param_type{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr Mpv_render_param_type) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_render_param_type "unwrap" where
  type
    CFieldType Mpv_render_param_type "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Not a valid value, but also used to terminate a params array. Its value is always guaranteed to be 0 (even if the ABI changes in the future).
--
--     [C declaration]: @MPV_RENDER_PARAM_INVALID@, defined at @mpv\/render.h 176:5@
pattern MPV_RENDER_PARAM_INVALID :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_INVALID = Mpv_render_param_type 0

-- | The render API to use. Valid for @mpv_render_context_create()@.
--
--     Type: char*
--
--     Defined APIs:
--
--     MPV_RENDER_API_TYPE_OPENGL: OpenGL desktop 2.1 or later (preferably core profile compatible to OpenGL 3.2), or OpenGLES 2.0 or later. Providing MPV_RENDER_PARAM_OPENGL_INIT_PARAMS is required. It is expected that an OpenGL context is valid and \"current\" when calling mpv_render_* functions (unless specified otherwise). It must be the same context for the same 'Mpv_render_context'.
--
--     [C declaration]: @MPV_RENDER_PARAM_API_TYPE@, defined at @mpv\/render.h 192:5@
pattern MPV_RENDER_PARAM_API_TYPE :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_API_TYPE = Mpv_render_param_type 1

-- | Required parameters for initializing the OpenGL renderer. Valid for @mpv_render_context_create()@. Type: mpv_opengl_init_params*
--
--     [C declaration]: @MPV_RENDER_PARAM_OPENGL_INIT_PARAMS@, defined at @mpv\/render.h 198:5@
pattern MPV_RENDER_PARAM_OPENGL_INIT_PARAMS :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_OPENGL_INIT_PARAMS = Mpv_render_param_type 2

-- | Describes a GL render target. Valid for @mpv_render_context_render()@. Type: mpv_opengl_fbo*
--
--     [C declaration]: @MPV_RENDER_PARAM_OPENGL_FBO@, defined at @mpv\/render.h 203:5@
pattern MPV_RENDER_PARAM_OPENGL_FBO :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_OPENGL_FBO = Mpv_render_param_type 3

-- | Control flipped rendering. Valid for @mpv_render_context_render()@. Type: int* If the value is set to 0, render normally. Otherwise, render it flipped, which is needed e.g. when rendering to an OpenGL default framebuffer (which has a flipped coordinate system).
--
--     [C declaration]: @MPV_RENDER_PARAM_FLIP_Y@, defined at @mpv\/render.h 211:5@
pattern MPV_RENDER_PARAM_FLIP_Y :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_FLIP_Y = Mpv_render_param_type 4

-- | Control surface depth. Valid for @mpv_render_context_render()@. Type: int* This implies the depth of the surface passed to the render function in bits per channel. If omitted or set to 0, the renderer will assume 8. Typically used to control dithering.
--
--     [C declaration]: @MPV_RENDER_PARAM_DEPTH@, defined at @mpv\/render.h 219:5@
pattern MPV_RENDER_PARAM_DEPTH :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_DEPTH = Mpv_render_param_type 5

-- | ICC profile blob. Valid for @mpv_render_context_set_parameter()@. Type: mpv_byte_array* Set an ICC profile for use with the \"icc-profile-auto\" option. (If the option is not enabled, the ICC data will not be used.)
--
--     [C declaration]: @MPV_RENDER_PARAM_ICC_PROFILE@, defined at @mpv\/render.h 226:5@
pattern MPV_RENDER_PARAM_ICC_PROFILE :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_ICC_PROFILE = Mpv_render_param_type 6

-- | Deprecated Ambient light in lux. Valid for @mpv_render_context_set_parameter()@. Type: int* This can be used for automatic gamma correction.
--
--     [C declaration]: @MPV_RENDER_PARAM_AMBIENT_LIGHT@, defined at @mpv\/render.h 233:5@
pattern MPV_RENDER_PARAM_AMBIENT_LIGHT :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_AMBIENT_LIGHT = Mpv_render_param_type 7

-- | X11 Display, sometimes used for hwdec. Valid for @mpv_render_context_create()@. The Display must stay valid for the lifetime of the 'Mpv_render_context'. Type: Display*
--
--     [C declaration]: @MPV_RENDER_PARAM_X11_DISPLAY@, defined at @mpv\/render.h 240:5@
pattern MPV_RENDER_PARAM_X11_DISPLAY :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_X11_DISPLAY = Mpv_render_param_type 8

-- | Wayland display, sometimes used for hwdec. Valid for @mpv_render_context_create()@. The wl_display must stay valid for the lifetime of the 'Mpv_render_context'. Type: struct wl_display*
--
--     [C declaration]: @MPV_RENDER_PARAM_WL_DISPLAY@, defined at @mpv\/render.h 247:5@
pattern MPV_RENDER_PARAM_WL_DISPLAY :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_WL_DISPLAY = Mpv_render_param_type 9

-- | Better control about rendering and enabling some advanced features. Valid for @mpv_render_context_create()@.
--
--     This conflates multiple requirements the API user promises to abide if this option is enabled:
--
--     * The API user\'s render thread, which is calling the mpv_render_*() functions, never waits for the core. Otherwise deadlocks can happen. See \"Threading\" section.
--
--     * The callback set with @mpv_render_context_set_update_callback()@ can now be called even if there is no new frame. The API user should call the @mpv_render_context_update()@ function, and interpret the return value for whether a new frame should be rendered.
--
--     * Correct functionality is impossible if the update callback is not set, or not set soon enough after @mpv_render_context_create()@ (the core can block while waiting for you to call @mpv_render_context_update()@, and if the update callback is not correctly set, it will deadlock, or block for too long).
--
--     In general, setting this option will enable the following features (and possibly more):
--
--     * \"Direct rendering\", which means the player decodes directly to a texture, which saves a copy per video frame (\"vd-lavc-dr\" option needs to be enabled, and the rendering backend as well as the underlying GPU API\/driver needs to have support for it).
--
--     * Rendering screenshots with the GPU API if supported by the backend (instead of using a suboptimal software fallback via libswscale).
--
--     Warning: do not just add this without reading the \"Threading\" section above, and then wondering that deadlocks happen. The requirements are tricky. But also note that even if advanced control is disabled, not adhering to the rules will lead to playback problems. Enabling advanced controls simply makes violating these rules fatal.
--
--     Type: int*: 0 for disable (default), 1 for enable
--
--     [C declaration]: @MPV_RENDER_PARAM_ADVANCED_CONTROL@, defined at @mpv\/render.h 287:5@
pattern MPV_RENDER_PARAM_ADVANCED_CONTROL :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_ADVANCED_CONTROL = Mpv_render_param_type 10

-- | Return information about the next frame to render. Valid for @mpv_render_context_get_info()@.
--
--     Type: mpv_render_frame_info*
--
--     It strictly returns information about the /next/ frame. The implication is that e.g. @mpv_render_context_update()@ \'s return value will have MPV_RENDER_UPDATE_FRAME set, and the user is supposed to call @mpv_render_context_render()@. If there is no next frame, then the return value will have is_valid set to 0.
--
--     [C declaration]: @MPV_RENDER_PARAM_NEXT_FRAME_INFO@, defined at @mpv\/render.h 300:5@
pattern MPV_RENDER_PARAM_NEXT_FRAME_INFO :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_NEXT_FRAME_INFO = Mpv_render_param_type 11

-- | Enable or disable video timing. Valid for @mpv_render_context_render()@.
--
--     Type: int*: 0 for disable, 1 for enable (default)
--
--     When video is timed to audio, the player attempts to render video a bit ahead, and then do a blocking wait until the target display time is reached. This blocks @mpv_render_context_render()@ for up to the amount specified with the \"video-timing-offset\" global option. You can set this parameter to 0 to disable this kind of waiting. If you do, it\'s recommended to use the target time value in 'Mpv_render_frame_info' to wait yourself, or to set the \"video-timing-offset\" to 0 instead.
--
--     Disabling this without doing anything in addition will result in A\/V sync being slightly off.
--
--     [C declaration]: @MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME@, defined at @mpv\/render.h 317:5@
pattern MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME = Mpv_render_param_type 12

-- | Use to skip rendering in @mpv_render_context_render()@.
--
--     Type: int*: 0 for rendering (default), 1 for skipping
--
--     If this is set, you don\'t need to pass a target surface to the render function (and if you do, it\'s completely ignored). This can still call into the lower level APIs (i.e. if you use OpenGL, the OpenGL context must be set).
--
--     Be aware that the render API will consider this frame as having been rendered. All other normal rules also apply, for example about whether you have to call @mpv_render_context_report_swap()@. It also does timing in the same way.
--
--     [C declaration]: @MPV_RENDER_PARAM_SKIP_RENDERING@, defined at @mpv\/render.h 333:5@
pattern MPV_RENDER_PARAM_SKIP_RENDERING :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_SKIP_RENDERING = Mpv_render_param_type 13

-- | Deprecated. Not supported. Use MPV_RENDER_PARAM_DRM_DISPLAY_V2 instead. Type : struct mpv_opengl_drm_params*
--
--     [C declaration]: @MPV_RENDER_PARAM_DRM_DISPLAY@, defined at @mpv\/render.h 338:5@
pattern MPV_RENDER_PARAM_DRM_DISPLAY :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_DRM_DISPLAY = Mpv_render_param_type 14

-- | DRM draw surface size, contains draw surface dimensions. Valid for @mpv_render_context_create()@. Type : struct mpv_opengl_drm_draw_surface_size*
--
--     [C declaration]: @MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE@, defined at @mpv\/render.h 344:5@
pattern MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_DRM_DRAW_SURFACE_SIZE = Mpv_render_param_type 15

-- | DRM display, contains drm display handles. Valid for @mpv_render_context_create()@. Type : struct mpv_opengl_drm_params_v2*
--
--     [C declaration]: @MPV_RENDER_PARAM_DRM_DISPLAY_V2@, defined at @mpv\/render.h 350:5@
pattern MPV_RENDER_PARAM_DRM_DISPLAY_V2 :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_DRM_DISPLAY_V2 = Mpv_render_param_type 16

-- | MPV_RENDER_API_TYPE_SW only: rendering target surface size, mandatory. Valid for MPV_RENDER_API_TYPE_SW & @mpv_render_context_render()@. Type: int[2] (e.g.: int s[2] = {w, h}; param.data = &s[0];)
--
--     The video frame is transformed as with other VOs. Typically, this means the video gets scaled and black bars are added if the video size or aspect ratio mismatches with the target size.
--
--     [C declaration]: @MPV_RENDER_PARAM_SW_SIZE@, defined at @mpv\/render.h 360:5@
pattern MPV_RENDER_PARAM_SW_SIZE :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_SW_SIZE = Mpv_render_param_type 17

-- | MPV_RENDER_API_TYPE_SW only: rendering target surface pixel format, mandatory. Valid for MPV_RENDER_API_TYPE_SW & @mpv_render_context_render()@. Type: char* (e.g.: char *f = \"rgb0\"; param.data = f;)
--
--     Valid values are: \"rgb0\", \"bgr0\", \"0bgr\", \"0rgb\" 4 bytes per pixel RGB, 1 byte (8 bit) per component, component bytes with increasing address from left to right (e.g. \"rgb0\" has r at address 0), the \"0\" component contains uninitialized garbage (often the value 0, but not necessarily; the bad naming is inherited from FFmpeg) Pixel alignment size: 4 bytes \"rgb24\" 3 bytes per pixel RGB. This is strongly discouraged because it is very slow. Pixel alignment size: 1 bytes other The API may accept other pixel formats, using mpv internal format names, as long as it\'s internally marked as RGB, has exactly 1 plane, and is supported as conversion output. It is not a good idea to rely on any of these. Their semantics and handling could change.
--
--     [C declaration]: @MPV_RENDER_PARAM_SW_FORMAT@, defined at @mpv\/render.h 385:5@
pattern MPV_RENDER_PARAM_SW_FORMAT :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_SW_FORMAT = Mpv_render_param_type 18

-- | MPV_RENDER_API_TYPE_SW only: rendering target surface bytes per line, mandatory. Valid for MPV_RENDER_API_TYPE_SW & @mpv_render_context_render()@. Type: size_t*
--
--     This is the number of bytes between a pixel (x, y) and (x, y + 1) on the target surface. It must be a multiple of the pixel size, and have space for the surface width as specified by MPV_RENDER_PARAM_SW_SIZE.
--
--     Both stride and pointer value should be a multiple of 64 to facilitate fast SIMD operation. Lower alignment might trigger slower code paths, and in the worst case, will copy the entire target frame. If mpv is built with zimg (and zimg is not disabled), the performance impact might be less. In either cases, the pointer and stride must be aligned at least to the pixel alignment size. Otherwise, crashes and undefined behavior is possible on platforms which do not support unaligned accesses (either through normal memory access or aligned SIMD memory access instructions).
--
--     [C declaration]: @MPV_RENDER_PARAM_SW_STRIDE@, defined at @mpv\/render.h 406:5@
pattern MPV_RENDER_PARAM_SW_STRIDE :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_SW_STRIDE = Mpv_render_param_type 19

-- | [C declaration]: @MPV_RENDER_PARAM_SW_POINTER@, defined at @mpv\/render.h 424:5@
pattern MPV_RENDER_PARAM_SW_POINTER :: Mpv_render_param_type
pattern MPV_RENDER_PARAM_SW_POINTER = Mpv_render_param_type 20

-- | Used to pass arbitrary parameters to some mpv_render_* functions. The meaning of the data parameter is determined by the type, and each MPV_RENDER_PARAM_* documents what type the value must point to.
--
--     Each value documents the required data type as the pointer you cast to void* and set on @mpv_render_param.data@. For example, if MPV_RENDER_PARAM_FOO documents the type as Something* , then the code should look like this:
--
--     Something foo = {...}; 'Mpv_render_param' param; param.type = MPV_RENDER_PARAM_FOO; param.data = & foo;
--
--     Normally, the data field points to exactly 1 object. If the type is char*, it points to a 0-terminated string.
--
--     In all cases (unless documented otherwise) the pointers need to remain valid during the call only. Unless otherwise documented, the API functions will not write to the params array or any data pointed to it.
--
--     As a convention, parameter arrays are always terminated by type==0. There is no specific order of the parameters required. The order of the 2 fields in this struct is guaranteed (even after ABI changes).
--
--     [C declaration]: @struct mpv_render_param@, defined at @mpv\/render.h 458:16@
data Mpv_render_param = Mpv_render_param
  { type' :: Mpv_render_param_type
  -- ^ [C declaration]: @type@, defined at @mpv\/render.h 459:32@
  , data' :: BG.Ptr BG.Void
  -- ^ [C declaration]: @data@, defined at @mpv\/render.h 460:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_render_param where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_render_param where
  readRaw =
    \ptr0 ->
      pure Mpv_render_param
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"data'") ptr0

instance Marshal.WriteRaw Mpv_render_param where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_render_param type'2 data'3 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"data'") ptr0 data'3

deriving via Marshal.EquivStorable Mpv_render_param instance BG.Storable Mpv_render_param

deriving via Struct.IsStructViaReadRaw Mpv_render_param instance Struct.IsStruct Mpv_render_param

-- | [C declaration]: @type@, defined at @mpv\/render.h 459:32@
instance
  (ty ~ Mpv_render_param_type)
  => BG.CompatHasField.HasField "type'" Mpv_render_param ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_render_param{type' = y1, data' = BG.getField @"data'" x0}
      , BG.getField @"type'" x0
      )

instance
  (ty ~ Mpv_render_param_type)
  => BG.HasField "type'" (BG.Ptr Mpv_render_param) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField Mpv_render_param "type'" where
  type
    CFieldType Mpv_render_param "type'" =
      Mpv_render_param_type

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @data@, defined at @mpv\/render.h 460:11@
instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "data'" Mpv_render_param ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_render_param{data' = y1, type' = BG.getField @"type'" x0}
      , BG.getField @"data'" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "data'" (BG.Ptr Mpv_render_param) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data'")

instance HasCField.HasCField Mpv_render_param "data'" where
  type
    CFieldType Mpv_render_param "data'" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 8

-- | Predefined values for MPV_RENDER_PARAM_API_TYPE.
--
--     [C declaration]: @macro MPV_RENDER_API_TYPE_OPENGL@, literal @\"opengl\"@, defined at @mpv\/render.h 468:9@
mPV_RENDER_API_TYPE_OPENGL :: BG.ByteString
mPV_RENDER_API_TYPE_OPENGL =
  BG.pack [0x6F, 0x70, 0x65, 0x6E, 0x67, 0x6C]

-- | [C declaration]: @macro MPV_RENDER_API_TYPE_SW@, literal @\"sw\"@, defined at @mpv\/render.h 470:9@
mPV_RENDER_API_TYPE_SW :: BG.ByteString
mPV_RENDER_API_TYPE_SW = BG.pack [0x73, 0x77]

-- | Flags used in @mpv_render_frame_info.flags@. Each value represents a bit in it.
--
--     [C declaration]: @enum mpv_render_frame_info_flag@, defined at @mpv\/render.h 475:14@
newtype Mpv_render_frame_info_flag = Mpv_render_frame_info_flag
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize Mpv_render_frame_info_flag where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_render_frame_info_flag where
  readRaw =
    \ptr0 ->
      pure Mpv_render_frame_info_flag
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw Mpv_render_frame_info_flag where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_render_frame_info_flag unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable Mpv_render_frame_info_flag
  instance
    BG.Storable Mpv_render_frame_info_flag

deriving via BG.CUInt instance BG.Prim Mpv_render_frame_info_flag

instance CEnum.CEnum Mpv_render_frame_info_flag where
  type CEnumZ Mpv_render_frame_info_flag = BG.CUInt

  toCEnum = Mpv_render_frame_info_flag

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (1, BG.singleton "MPV_RENDER_FRAME_INFO_PRESENT")
        , (2, BG.singleton "MPV_RENDER_FRAME_INFO_REDRAW")
        , (4, BG.singleton "MPV_RENDER_FRAME_INFO_REPEAT")
        , (8, BG.singleton "MPV_RENDER_FRAME_INFO_BLOCK_VSYNC")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "Mpv_render_frame_info_flag"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "Mpv_render_frame_info_flag"

instance Show Mpv_render_frame_info_flag where
  showsPrec = CEnum.shows

instance Read Mpv_render_frame_info_flag where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" Mpv_render_frame_info_flag ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_render_frame_info_flag{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr Mpv_render_frame_info_flag) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_render_frame_info_flag "unwrap" where
  type
    CFieldType Mpv_render_frame_info_flag "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Set if there is actually a next frame. If unset, there is no next frame yet, and other flags and fields that require a frame to be queued will be unset.
--
--     This is set for /any/ kind of frame, even for redraw requests.
--
--     Note that when this is unset, it simply means no new frame was decoded\/queued yet, not necessarily that the end of the video was reached. A new frame can be queued after some time.
--
--     If the return value of @mpv_render_context_render()@ had the MPV_RENDER_UPDATE_FRAME flag set, this flag will usually be set as well, unless the frame is rendered, or discarded by other asynchronous events.
--
--     [C declaration]: @MPV_RENDER_FRAME_INFO_PRESENT@, defined at @mpv\/render.h 491:5@
pattern MPV_RENDER_FRAME_INFO_PRESENT :: Mpv_render_frame_info_flag
pattern MPV_RENDER_FRAME_INFO_PRESENT = Mpv_render_frame_info_flag 1

-- | If set, the frame is not an actual new video frame, but a redraw request. For example if the video is paused, and an option that affects video rendering was changed (or any other reason), an update request can be issued and this flag will be set.
--
--     Typically, redraw frames will not be subject to video timing.
--
--     Implies MPV_RENDER_FRAME_INFO_PRESENT.
--
--     [C declaration]: @MPV_RENDER_FRAME_INFO_REDRAW@, defined at @mpv\/render.h 502:5@
pattern MPV_RENDER_FRAME_INFO_REDRAW :: Mpv_render_frame_info_flag
pattern MPV_RENDER_FRAME_INFO_REDRAW = Mpv_render_frame_info_flag 2

-- | If set, this is supposed to reproduce the previous frame perfectly. This is usually used for certain \"video-sync\" options (\"display-...\" modes). Typically the renderer will blit the video from a FBO. Unset otherwise.
--
--     Implies MPV_RENDER_FRAME_INFO_PRESENT.
--
--     [C declaration]: @MPV_RENDER_FRAME_INFO_REPEAT@, defined at @mpv\/render.h 510:5@
pattern MPV_RENDER_FRAME_INFO_REPEAT :: Mpv_render_frame_info_flag
pattern MPV_RENDER_FRAME_INFO_REPEAT = Mpv_render_frame_info_flag 4

-- | If set, the player timing code expects that the user thread blocks on vsync (by either delaying the render call, or by making a call to @mpv_render_context_report_swap()@ at vsync time).
--
--     Implies MPV_RENDER_FRAME_INFO_PRESENT.
--
--     [C declaration]: @MPV_RENDER_FRAME_INFO_BLOCK_VSYNC@, defined at @mpv\/render.h 518:5@
pattern MPV_RENDER_FRAME_INFO_BLOCK_VSYNC :: Mpv_render_frame_info_flag
pattern MPV_RENDER_FRAME_INFO_BLOCK_VSYNC = Mpv_render_frame_info_flag 8

-- | Information about the next video frame that will be rendered. Can be retrieved with MPV_RENDER_PARAM_NEXT_FRAME_INFO.
--
--     [C declaration]: @struct mpv_render_frame_info@, defined at @mpv\/render.h 525:16@
data Mpv_render_frame_info = Mpv_render_frame_info
  { flags :: HsBindgen.Runtime.LibC.Word64
  -- ^ A bitset of 'Mpv_render_frame_info_flag' values (i.e. multiple flags are combined with bitwise or).
  --
  --          [C declaration]: @flags@, defined at @mpv\/render.h 530:14@
  , target_time :: HsBindgen.Runtime.LibC.Int64
  -- ^ Absolute time at which the frame is supposed to be displayed. This is in the same unit and base as the time returned by mpv_get_time_us(). For frames that are redrawn, or if vsync locked video timing is used (see \"video-sync\" option), then this can be 0. The \"video-timing-offset\" option determines how much \"headroom\" the render thread gets (but a high enough frame rate can reduce it anyway). @mpv_render_context_render()@ will normally block until the time is elapsed, unless you pass it MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME = 0.
  --
  --          [C declaration]: @target_time@, defined at @mpv\/render.h 541:13@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_render_frame_info where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_render_frame_info where
  readRaw =
    \ptr0 ->
      pure Mpv_render_frame_info
        <*> HasCField.readRaw (BG.Proxy @"flags") ptr0
        <*> HasCField.readRaw (BG.Proxy @"target_time") ptr0

instance Marshal.WriteRaw Mpv_render_frame_info where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_render_frame_info flags2 target_time3 ->
            HasCField.writeRaw (BG.Proxy @"flags") ptr0 flags2
              >> HasCField.writeRaw (BG.Proxy @"target_time") ptr0 target_time3

deriving via Marshal.EquivStorable Mpv_render_frame_info instance BG.Storable Mpv_render_frame_info

deriving via
  Struct.IsStructViaReadRaw Mpv_render_frame_info
  instance
    Struct.IsStruct Mpv_render_frame_info

-- | A bitset of 'Mpv_render_frame_info_flag' values (i.e. multiple flags are combined with bitwise or).
--
--     [C declaration]: @flags@, defined at @mpv\/render.h 530:14@
instance
  (ty ~ HsBindgen.Runtime.LibC.Word64)
  => BG.CompatHasField.HasField "flags" Mpv_render_frame_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_render_frame_info{flags = y1, target_time = BG.getField @"target_time" x0}
      , BG.getField @"flags" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Word64)
  => BG.HasField "flags" (BG.Ptr Mpv_render_frame_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"flags")

instance HasCField.HasCField Mpv_render_frame_info "flags" where
  type
    CFieldType Mpv_render_frame_info "flags" =
      HsBindgen.Runtime.LibC.Word64

  offset# = \_ -> \_ -> 0

-- | Absolute time at which the frame is supposed to be displayed. This is in the same unit and base as the time returned by mpv_get_time_us(). For frames that are redrawn, or if vsync locked video timing is used (see \"video-sync\" option), then this can be 0. The \"video-timing-offset\" option determines how much \"headroom\" the render thread gets (but a high enough frame rate can reduce it anyway). @mpv_render_context_render()@ will normally block until the time is elapsed, unless you pass it MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME = 0.
--
--     [C declaration]: @target_time@, defined at @mpv\/render.h 541:13@
instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.CompatHasField.HasField "target_time" Mpv_render_frame_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_render_frame_info{target_time = y1, flags = BG.getField @"flags" x0}
      , BG.getField @"target_time" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.HasField "target_time" (BG.Ptr Mpv_render_frame_info) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"target_time")

instance HasCField.HasCField Mpv_render_frame_info "target_time" where
  type
    CFieldType Mpv_render_frame_info "target_time" =
      HsBindgen.Runtime.LibC.Int64

  offset# = \_ -> \_ -> 8

-- | Auxiliary type used by 'Mpv_render_update_fn'
--
--     [C declaration]: @mpv_render_update_fn@, defined at @mpv\/render.h 616:16@
newtype Mpv_render_update_fn_Aux = Mpv_render_update_fn_Aux
  { unwrap :: BG.Ptr BG.Void -> IO ()
  }
  deriving stock (BG.Generic)

-- __unique:__ @toMpv_render_update_fn_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_cb89ea8b25ac266d_base
    :: (BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toMpv_render_update_fn_Aux@
hs_bindgen_cb89ea8b25ac266d
  :: Mpv_render_update_fn_Aux
  -> IO (BG.FunPtr Mpv_render_update_fn_Aux)
hs_bindgen_cb89ea8b25ac266d =
  \fun0 ->
    fmap
      BG.castFunPtr
      ( hs_bindgen_cb89ea8b25ac266d_base
          ( \x1 ->
              BG.getField @"unwrap" fun0 (BG.fromFFIType x1)
          )
      )

-- __unique:__ @fromMpv_render_update_fn_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_ab3ba437b898317b_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromMpv_render_update_fn_Aux@
hs_bindgen_ab3ba437b898317b
  :: BG.FunPtr Mpv_render_update_fn_Aux
  -> Mpv_render_update_fn_Aux
hs_bindgen_ab3ba437b898317b =
  \funPtr0 ->
    Mpv_render_update_fn_Aux
      ( \x1 ->
          hs_bindgen_ab3ba437b898317b_base (BG.castFunPtr funPtr0) (BG.toFFIType x1)
      )

instance BG.ToFunPtr Mpv_render_update_fn_Aux where
  toFunPtr = hs_bindgen_cb89ea8b25ac266d

instance BG.FromFunPtr Mpv_render_update_fn_Aux where
  fromFunPtr = hs_bindgen_ab3ba437b898317b

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "unwrap" Mpv_render_update_fn_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_render_update_fn_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr Mpv_render_update_fn_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_render_update_fn_Aux "unwrap" where
  type
    CFieldType Mpv_render_update_fn_Aux "unwrap" =
      BG.Ptr BG.Void -> IO ()

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @mpv_render_update_fn@, defined at @mpv\/render.h 616:16@
newtype Mpv_render_update_fn = Mpv_render_update_fn
  { unwrap :: BG.FunPtr Mpv_render_update_fn_Aux
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
  (ty ~ BG.FunPtr Mpv_render_update_fn_Aux)
  => BG.CompatHasField.HasField "unwrap" Mpv_render_update_fn ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_render_update_fn{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr Mpv_render_update_fn_Aux)
  => BG.HasField "unwrap" (BG.Ptr Mpv_render_update_fn) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_render_update_fn "unwrap" where
  type
    CFieldType Mpv_render_update_fn "unwrap" =
      BG.FunPtr Mpv_render_update_fn_Aux

  offset# = \_ -> \_ -> 0

-- | Flags returned by @mpv_render_context_update()@. Each value represents a bit in the function\'s return value.
--
--     [C declaration]: @enum mpv_render_update_flag@, defined at @mpv\/render.h 667:14@
newtype Mpv_render_context_flag = Mpv_render_context_flag
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize Mpv_render_context_flag where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw Mpv_render_context_flag where
  readRaw =
    \ptr0 ->
      pure Mpv_render_context_flag
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw Mpv_render_context_flag where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_render_context_flag unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable Mpv_render_context_flag
  instance
    BG.Storable Mpv_render_context_flag

deriving via BG.CUInt instance BG.Prim Mpv_render_context_flag

instance CEnum.CEnum Mpv_render_context_flag where
  type CEnumZ Mpv_render_context_flag = BG.CUInt

  toCEnum = Mpv_render_context_flag

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList [(1, BG.singleton "MPV_RENDER_UPDATE_FRAME")]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "Mpv_render_context_flag"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "Mpv_render_context_flag"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum Mpv_render_context_flag where
  minDeclaredValue = MPV_RENDER_UPDATE_FRAME

  maxDeclaredValue = MPV_RENDER_UPDATE_FRAME

instance Show Mpv_render_context_flag where
  showsPrec = CEnum.shows

instance Read Mpv_render_context_flag where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" Mpv_render_context_flag ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_render_context_flag{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr Mpv_render_context_flag) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_render_context_flag "unwrap" where
  type
    CFieldType Mpv_render_context_flag "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | A new video frame must be rendered. @mpv_render_context_render()@ must be called.
--
--     [C declaration]: @MPV_RENDER_UPDATE_FRAME@, defined at @mpv\/render.h 672:5@
pattern MPV_RENDER_UPDATE_FRAME :: Mpv_render_context_flag
pattern MPV_RENDER_UPDATE_FRAME = Mpv_render_context_flag 1
