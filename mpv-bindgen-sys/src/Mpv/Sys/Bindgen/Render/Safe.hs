{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module Mpv.Sys.Bindgen.Render.Safe (
  Mpv.Sys.Bindgen.Render.Safe.mpv_render_context_create,
  Mpv.Sys.Bindgen.Render.Safe.mpv_render_context_set_parameter,
  Mpv.Sys.Bindgen.Render.Safe.mpv_render_context_get_info,
  Mpv.Sys.Bindgen.Render.Safe.mpv_render_context_set_update_callback,
  Mpv.Sys.Bindgen.Render.Safe.mpv_render_context_update,
  Mpv.Sys.Bindgen.Render.Safe.mpv_render_context_render,
  Mpv.Sys.Bindgen.Render.Safe.mpv_render_context_report_swap,
  Mpv.Sys.Bindgen.Render.Safe.mpv_render_context_free,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import Mpv.Sys.Bindgen.Client qualified
import Mpv.Sys.Bindgen.Render

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <mpv/render.h>"
         , "signed int hs_bindgen_0db84954bd69992d ("
         , "  mpv_render_context **arg1,"
         , "  mpv_handle *arg2,"
         , "  mpv_render_param *arg3"
         , ")"
         , "{"
         , "  return (mpv_render_context_create)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_3017e3a4db9a312a ("
         , "  mpv_render_context *arg1,"
         , "  mpv_render_param *arg2"
         , ")"
         , "{"
         , "  return (mpv_render_context_set_parameter)(arg1, *arg2);"
         , "}"
         , "signed int hs_bindgen_ad8723a8cb09c888 ("
         , "  mpv_render_context *arg1,"
         , "  mpv_render_param *arg2"
         , ")"
         , "{"
         , "  return (mpv_render_context_get_info)(arg1, *arg2);"
         , "}"
         , "void hs_bindgen_2da3dfc6b3a343a7 ("
         , "  mpv_render_context *arg1,"
         , "  mpv_render_update_fn arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  (mpv_render_context_set_update_callback)(arg1, arg2, arg3);"
         , "}"
         , "uint64_t hs_bindgen_7ca89c276e162b6e ("
         , "  mpv_render_context *arg1"
         , ")"
         , "{"
         , "  return (mpv_render_context_update)(arg1);"
         , "}"
         , "signed int hs_bindgen_d056c1d0e3664ef7 ("
         , "  mpv_render_context *arg1,"
         , "  mpv_render_param *arg2"
         , ")"
         , "{"
         , "  return (mpv_render_context_render)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_d0e8ba883faa3e12 ("
         , "  mpv_render_context *arg1"
         , ")"
         , "{"
         , "  (mpv_render_context_report_swap)(arg1);"
         , "}"
         , "void hs_bindgen_d6fad5b72941c9c1 ("
         , "  mpv_render_context *arg1"
         , ")"
         , "{"
         , "  (mpv_render_context_free)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_create@
foreign import ccall safe "hs_bindgen_0db84954bd69992d"
  hs_bindgen_0db84954bd69992d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_create@
hs_bindgen_0db84954bd69992d
  :: BG.Ptr (BG.Ptr Mpv_render_context)
  -> BG.Ptr Mpv.Sys.Bindgen.Client.Mpv_handle
  -> BG.Ptr Mpv_render_param
  -> IO BG.CInt
hs_bindgen_0db84954bd69992d =
  BG.fromFFIType hs_bindgen_0db84954bd69992d_base

-- | Initialize the renderer state. Depending on the backend used, this will access the underlying GPU API and initialize its own objects.
--
--     You must free the context with @mpv_render_context_free()@. Not doing so before the mpv core is destroyed may result in memory leaks or crashes.
--
--     Currently, only at most 1 context can exists per mpv core (it represents the main video output).
--
--     You should pass the following parameters:
--
--     * MPV_RENDER_PARAM_API_TYPE to select the underlying backend\/GPU API.
--
--     * Backend-specific init parameter, like MPV_RENDER_PARAM_OPENGL_INIT_PARAMS.
--
--     * Setting MPV_RENDER_PARAM_ADVANCED_CONTROL and following its rules is strongly recommended.
--
--     * If you want to use hwdec, possibly hwdec interop resources.
--
--     [Returns]: error code, including but not limited to: MPV_ERROR_UNSUPPORTED: the OpenGL version is not supported (or required extensions are missing) MPV_ERROR_NOT_IMPLEMENTED: an unknown API type was provided, or support for the requested API was not built in the used libmpv binary. MPV_ERROR_INVALID_PARAMETER: at least one of the provided parameters was not valid.
--
--     [C declaration]: @mpv_render_context_create@, defined at @mpv\/render.h 578:16@
mpv_render_context_create
  :: BG.Ptr (BG.Ptr Mpv_render_context)
  -- ^
  --
  --           [@res@]: set to the context (on success) or NULL (on failure). The value is never read and always overwritten.
  -> BG.Ptr Mpv.Sys.Bindgen.Client.Mpv_handle
  -- ^
  --
  --           [@mpv@]: handle used to get the core (the 'Mpv_render_context' won\'t depend on this specific handle, only the core referenced by it)
  -> BG.Ptr Mpv_render_param
  -- ^
  --
  --           [@params@]: an array of parameters, terminated by type==0. It\'s left unspecified what happens with unknown parameters. At least MPV_RENDER_PARAM_API_TYPE is required, and most backends will require another backend-specific parameter.
  -> IO BG.CInt
mpv_render_context_create =
  hs_bindgen_0db84954bd69992d

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_set_parameter@
foreign import ccall safe "hs_bindgen_3017e3a4db9a312a"
  hs_bindgen_3017e3a4db9a312a_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_set_parameter@
hs_bindgen_3017e3a4db9a312a
  :: BG.Ptr Mpv_render_context
  -> BG.Ptr Mpv_render_param
  -> IO BG.CInt
hs_bindgen_3017e3a4db9a312a =
  BG.fromFFIType hs_bindgen_3017e3a4db9a312a_base

-- | Attempt to change a single parameter. Not all backends and parameter types support all kinds of changes.
--
--     [Returns]: error code. If a parameter could actually be changed, this returns success, otherwise an error code depending on the parameter type and situation.
--
--     [C declaration]: @mpv_render_context_set_parameter@, defined at @mpv\/render.h 591:16@
mpv_render_context_set_parameter
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> Mpv_render_param
  -- ^
  --
  --           [@param@]: the parameter type and data that should be set
  -> IO BG.CInt
mpv_render_context_set_parameter =
  \ctx0 ->
    \param1 ->
      BG.with
        param1
        ( \param2 ->
            hs_bindgen_3017e3a4db9a312a ctx0 param2
        )

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_get_info@
foreign import ccall safe "hs_bindgen_ad8723a8cb09c888"
  hs_bindgen_ad8723a8cb09c888_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_get_info@
hs_bindgen_ad8723a8cb09c888
  :: BG.Ptr Mpv_render_context
  -> BG.Ptr Mpv_render_param
  -> IO BG.CInt
hs_bindgen_ad8723a8cb09c888 =
  BG.fromFFIType hs_bindgen_ad8723a8cb09c888_base

-- | Retrieve information from the render context. This is NOT a counterpart to @mpv_render_context_set_parameter()@, because you generally can\'t read parameters set with it, and this function is not meant for this purpose. Instead, this is for communicating information from the renderer back to the user. See 'Mpv_render_param_type'; entries which support this function explicitly mention it, and for other entries you can assume it will fail.
--
--     You pass param with param.type set and param.data pointing to a variable of the required data type. The function will then overwrite that variable with the returned value (at least on success).
--
--     [Returns]: error code. If a parameter could actually be retrieved, this returns success, otherwise an error code depending on the parameter type and situation. MPV_ERROR_NOT_IMPLEMENTED is used for unknown param.type, or if retrieving it is not supported.
--
--     [C declaration]: @mpv_render_context_get_info@, defined at @mpv\/render.h 613:16@
mpv_render_context_get_info
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> Mpv_render_param
  -- ^
  --
  --           [@param@]: the parameter type and data that should be retrieved
  -> IO BG.CInt
mpv_render_context_get_info =
  \ctx0 ->
    \param1 ->
      BG.with
        param1
        ( \param2 ->
            hs_bindgen_ad8723a8cb09c888 ctx0 param2
        )

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_set_update_callback@
foreign import ccall safe "hs_bindgen_2da3dfc6b3a343a7"
  hs_bindgen_2da3dfc6b3a343a7_base
    :: BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_set_update_callback@
hs_bindgen_2da3dfc6b3a343a7
  :: BG.Ptr Mpv_render_context
  -> Mpv_render_update_fn
  -> BG.Ptr BG.Void
  -> IO ()
hs_bindgen_2da3dfc6b3a343a7 =
  BG.fromFFIType hs_bindgen_2da3dfc6b3a343a7_base

-- | Set the callback that notifies you when a new video frame is available, or if the video display configuration somehow changed and requires a redraw. Similar to mpv_set_wakeup_callback(), you must not call any mpv API from the callback, and all the other listed restrictions apply (such as not exiting the callback by throwing exceptions).
--
--     This can be called from any thread, except from an update callback. In case of the OpenGL backend, no OpenGL state or API is accessed.
--
--     Calling this will raise an update callback immediately.
--
--     [C declaration]: @mpv_render_context_set_update_callback@, defined at @mpv\/render.h 634:17@
mpv_render_context_set_update_callback
  :: BG.Ptr Mpv_render_context
  -- ^ [C declaration]: @ctx@
  -> Mpv_render_update_fn
  -- ^
  --
  --           [@callback@]: callback(callback_ctx) is called if the frame should be redrawn
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@callback_ctx@]: opaque argument to the callback
  -> IO ()
mpv_render_context_set_update_callback =
  hs_bindgen_2da3dfc6b3a343a7

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_update@
foreign import ccall safe "hs_bindgen_7ca89c276e162b6e"
  hs_bindgen_7ca89c276e162b6e_base
    :: BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_update@
hs_bindgen_7ca89c276e162b6e
  :: BG.Ptr Mpv_render_context
  -> IO HsBindgen.Runtime.LibC.Word64
hs_bindgen_7ca89c276e162b6e =
  BG.fromFFIType hs_bindgen_7ca89c276e162b6e_base

-- | The API user is supposed to call this when the update callback was invoked (like all mpv_render_* functions, this has to happen on the render thread, and /not/ from the update callback itself).
--
--     This is optional if MPV_RENDER_PARAM_ADVANCED_CONTROL was not set (default). Otherwise, it\'s a hard requirement that this is called after each update callback. If multiple update callback happened, and the function could not be called sooner, it\'s OK to call it once after the last callback.
--
--     If an update callback happens during or after this function, the function must be called again at the soonest possible time.
--
--     If MPV_RENDER_PARAM_ADVANCED_CONTROL was set, this will do additional work such as allocating textures for the video decoder.
--
--     [Returns]: a bitset of @mpv_render_update_flag@ values (i.e. multiple flags are combined with bitwise or). Typically, this will tell the API user what should happen next. E.g. if the MPV_RENDER_UPDATE_FRAME flag is set, @mpv_render_context_render()@ should be called. If flags unknown to the API user are set, or if the return value is 0, nothing needs to be done.
--
--     [C declaration]: @mpv_render_context_update@, defined at @mpv\/render.h 661:21@
mpv_render_context_update
  :: BG.Ptr Mpv_render_context
  -- ^ [C declaration]: @ctx@
  -> IO HsBindgen.Runtime.LibC.Word64
mpv_render_context_update =
  hs_bindgen_7ca89c276e162b6e

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_render@
foreign import ccall safe "hs_bindgen_d056c1d0e3664ef7"
  hs_bindgen_d056c1d0e3664ef7_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_render@
hs_bindgen_d056c1d0e3664ef7
  :: BG.Ptr Mpv_render_context
  -> BG.Ptr Mpv_render_param
  -> IO BG.CInt
hs_bindgen_d056c1d0e3664ef7 =
  BG.fromFFIType hs_bindgen_d056c1d0e3664ef7_base

-- | Render video.
--
--     Typically renders the video to a target surface provided via 'Mpv_render_param' (the details depend on the backend in use). Options like \"panscan\" are applied to determine which part of the video should be visible and how the video should be scaled. You can change these options at runtime by using the mpv property API.
--
--     The renderer will reconfigure itself every time the target surface configuration (such as size) is changed.
--
--     This function implicitly pulls a video frame from the internal queue and renders it. If no new frame is available, the previous frame is redrawn. The update callback set with @mpv_render_context_set_update_callback()@ notifies you when a new frame was added. The details potentially depend on the backends and the provided parameters.
--
--     Generally, libmpv will invoke your update callback some time before the video frame should be shown, and then lets this function block until the supposed display time. This will limit your rendering to video FPS. You can prevent this by setting the \"video-timing-offset\" global option to 0. (This applies only to \"audio\" video sync mode.)
--
--     You should pass the following parameters:
--
--     * Backend-specific target object, such as MPV_RENDER_PARAM_OPENGL_FBO.
--
--     * Possibly transformations, such as MPV_RENDER_PARAM_FLIP_Y.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_render_context_render@, defined at @mpv\/render.h 709:16@
mpv_render_context_render
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> BG.Ptr Mpv_render_param
  -- ^
  --
  --           [@params@]: an array of parameters, terminated by type==0. Which parameters are required depends on the backend. It\'s left unspecified what happens with unknown parameters.
  -> IO BG.CInt
mpv_render_context_render =
  hs_bindgen_d056c1d0e3664ef7

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_report_swap@
foreign import ccall safe "hs_bindgen_d0e8ba883faa3e12"
  hs_bindgen_d0e8ba883faa3e12_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_report_swap@
hs_bindgen_d0e8ba883faa3e12
  :: BG.Ptr Mpv_render_context
  -> IO ()
hs_bindgen_d0e8ba883faa3e12 =
  BG.fromFFIType hs_bindgen_d0e8ba883faa3e12_base

-- | Tell the renderer that a frame was flipped at the given time. This is optional, but can help the player to achieve better timing.
--
--     Note that calling this at least once informs libmpv that you will use this function. If you use it inconsistently, expect bad video playback.
--
--     If this is called while no video is initialized, it is ignored.
--
--     [C declaration]: @mpv_render_context_report_swap@, defined at @mpv\/render.h 722:17@
mpv_render_context_report_swap
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> IO ()
mpv_render_context_report_swap =
  hs_bindgen_d0e8ba883faa3e12

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_free@
foreign import ccall safe "hs_bindgen_d6fad5b72941c9c1"
  hs_bindgen_d6fad5b72941c9c1_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_Safe_mpv_render_context_free@
hs_bindgen_d6fad5b72941c9c1
  :: BG.Ptr Mpv_render_context
  -> IO ()
hs_bindgen_d6fad5b72941c9c1 =
  BG.fromFFIType hs_bindgen_d6fad5b72941c9c1_base

-- | Destroy the mpv renderer state.
--
--     If video is still active (e.g. a file playing), video will be disabled forcefully.
--
--     [C declaration]: @mpv_render_context_free@, defined at @mpv\/render.h 733:17@
mpv_render_context_free
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context. After this function returns, this is not a valid pointer anymore. NULL is also allowed and does nothing.
  -> IO ()
mpv_render_context_free = hs_bindgen_d6fad5b72941c9c1
