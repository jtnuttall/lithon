{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module Mpv.Sys.Bindgen.Render.FunPtr (
  Mpv.Sys.Bindgen.Render.FunPtr.mpv_render_context_create,
  Mpv.Sys.Bindgen.Render.FunPtr.mpv_render_context_set_parameter,
  Mpv.Sys.Bindgen.Render.FunPtr.mpv_render_context_get_info,
  Mpv.Sys.Bindgen.Render.FunPtr.mpv_render_context_set_update_callback,
  Mpv.Sys.Bindgen.Render.FunPtr.mpv_render_context_update,
  Mpv.Sys.Bindgen.Render.FunPtr.mpv_render_context_render,
  Mpv.Sys.Bindgen.Render.FunPtr.mpv_render_context_report_swap,
  Mpv.Sys.Bindgen.Render.FunPtr.mpv_render_context_free,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import Mpv.Sys.Bindgen.Client qualified
import Mpv.Sys.Bindgen.Render

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <mpv/render.h>"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_create */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_5fdca9d483f27632 (void)) ("
         , "  mpv_render_context **arg1,"
         , "  mpv_handle *arg2,"
         , "  mpv_render_param *arg3"
         , ")"
         , "{"
         , "  return &mpv_render_context_create;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_set_parameter */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_941ffae3406a9315 (void)) ("
         , "  mpv_render_context *arg1,"
         , "  mpv_render_param arg2"
         , ")"
         , "{"
         , "  return &mpv_render_context_set_parameter;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_get_info */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_b0681bdb9e5e3023 (void)) ("
         , "  mpv_render_context *arg1,"
         , "  mpv_render_param arg2"
         , ")"
         , "{"
         , "  return &mpv_render_context_get_info;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_set_update_callback */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f7afc2532ff9442f (void)) ("
         , "  mpv_render_context *arg1,"
         , "  mpv_render_update_fn arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &mpv_render_context_set_update_callback;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_update */"
         , "__attribute__ ((const))"
         , "uint64_t (*hs_bindgen_575e10ec6c94a0c1 (void)) ("
         , "  mpv_render_context *arg1"
         , ")"
         , "{"
         , "  return &mpv_render_context_update;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_render */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c3433b1deebcfeb8 (void)) ("
         , "  mpv_render_context *arg1,"
         , "  mpv_render_param *arg2"
         , ")"
         , "{"
         , "  return &mpv_render_context_render;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_report_swap */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_8e575f526db2170b (void)) ("
         , "  mpv_render_context *arg1"
         , ")"
         , "{"
         , "  return &mpv_render_context_report_swap;"
         , "}"
         , "/* mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_free */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_56663794a61dd829 (void)) ("
         , "  mpv_render_context *arg1"
         , ")"
         , "{"
         , "  return &mpv_render_context_free;"
         , "}"
         ]
     )
 )

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_create@
foreign import ccall unsafe "hs_bindgen_5fdca9d483f27632"
  hs_bindgen_5fdca9d483f27632_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_create@
hs_bindgen_5fdca9d483f27632
  :: IO
       ( BG.FunPtr
           ( BG.Ptr (BG.Ptr Mpv_render_context)
             -> BG.Ptr Mpv.Sys.Bindgen.Client.Mpv_handle
             -> BG.Ptr Mpv_render_param
             -> IO BG.CInt
           )
       )
hs_bindgen_5fdca9d483f27632 =
  fmap BG.fromFFIType hs_bindgen_5fdca9d483f27632_base

{-# NOINLINE mpv_render_context_create #-}

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
--     [@res@]: set to the context (on success) or NULL (on failure). The value is never read and always overwritten.
--
--     [@mpv@]: handle used to get the core (the 'Mpv_render_context' won\'t depend on this specific handle, only the core referenced by it)
--
--     [@params@]: an array of parameters, terminated by type==0. It\'s left unspecified what happens with unknown parameters. At least MPV_RENDER_PARAM_API_TYPE is required, and most backends will require another backend-specific parameter.
--
--     [Returns]: error code, including but not limited to: MPV_ERROR_UNSUPPORTED: the OpenGL version is not supported (or required extensions are missing) MPV_ERROR_NOT_IMPLEMENTED: an unknown API type was provided, or support for the requested API was not built in the used libmpv binary. MPV_ERROR_INVALID_PARAMETER: at least one of the provided parameters was not valid.
--
--     [C declaration]: @mpv_render_context_create@, defined at @mpv\/render.h 578:16@
mpv_render_context_create
  :: BG.FunPtr
       ( BG.Ptr (BG.Ptr Mpv_render_context)
         -> BG.Ptr Mpv.Sys.Bindgen.Client.Mpv_handle
         -> BG.Ptr Mpv_render_param
         -> IO BG.CInt
       )
mpv_render_context_create =
  BG.unsafePerformIO hs_bindgen_5fdca9d483f27632

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_set_parameter@
foreign import ccall unsafe "hs_bindgen_941ffae3406a9315"
  hs_bindgen_941ffae3406a9315_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_set_parameter@
hs_bindgen_941ffae3406a9315
  :: IO (BG.FunPtr (BG.Ptr Mpv_render_context -> Mpv_render_param -> IO BG.CInt))
hs_bindgen_941ffae3406a9315 =
  fmap BG.fromFFIType hs_bindgen_941ffae3406a9315_base

{-# NOINLINE mpv_render_context_set_parameter #-}

-- | Attempt to change a single parameter. Not all backends and parameter types support all kinds of changes.
--
--     [@ctx@]: a valid render context
--
--     [@param@]: the parameter type and data that should be set
--
--     [Returns]: error code. If a parameter could actually be changed, this returns success, otherwise an error code depending on the parameter type and situation.
--
--     [C declaration]: @mpv_render_context_set_parameter@, defined at @mpv\/render.h 591:16@
mpv_render_context_set_parameter
  :: BG.FunPtr (BG.Ptr Mpv_render_context -> Mpv_render_param -> IO BG.CInt)
mpv_render_context_set_parameter =
  BG.unsafePerformIO hs_bindgen_941ffae3406a9315

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_get_info@
foreign import ccall unsafe "hs_bindgen_b0681bdb9e5e3023"
  hs_bindgen_b0681bdb9e5e3023_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_get_info@
hs_bindgen_b0681bdb9e5e3023
  :: IO (BG.FunPtr (BG.Ptr Mpv_render_context -> Mpv_render_param -> IO BG.CInt))
hs_bindgen_b0681bdb9e5e3023 =
  fmap BG.fromFFIType hs_bindgen_b0681bdb9e5e3023_base

{-# NOINLINE mpv_render_context_get_info #-}

-- | Retrieve information from the render context. This is NOT a counterpart to @mpv_render_context_set_parameter()@, because you generally can\'t read parameters set with it, and this function is not meant for this purpose. Instead, this is for communicating information from the renderer back to the user. See 'Mpv_render_param_type'; entries which support this function explicitly mention it, and for other entries you can assume it will fail.
--
--     You pass param with param.type set and param.data pointing to a variable of the required data type. The function will then overwrite that variable with the returned value (at least on success).
--
--     [@ctx@]: a valid render context
--
--     [@param@]: the parameter type and data that should be retrieved
--
--     [Returns]: error code. If a parameter could actually be retrieved, this returns success, otherwise an error code depending on the parameter type and situation. MPV_ERROR_NOT_IMPLEMENTED is used for unknown param.type, or if retrieving it is not supported.
--
--     [C declaration]: @mpv_render_context_get_info@, defined at @mpv\/render.h 613:16@
mpv_render_context_get_info
  :: BG.FunPtr (BG.Ptr Mpv_render_context -> Mpv_render_param -> IO BG.CInt)
mpv_render_context_get_info =
  BG.unsafePerformIO hs_bindgen_b0681bdb9e5e3023

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_set_update_callback@
foreign import ccall unsafe "hs_bindgen_f7afc2532ff9442f"
  hs_bindgen_f7afc2532ff9442f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_set_update_callback@
hs_bindgen_f7afc2532ff9442f
  :: IO (BG.FunPtr (BG.Ptr Mpv_render_context -> Mpv_render_update_fn -> BG.Ptr BG.Void -> IO ()))
hs_bindgen_f7afc2532ff9442f =
  fmap BG.fromFFIType hs_bindgen_f7afc2532ff9442f_base

{-# NOINLINE mpv_render_context_set_update_callback #-}

-- | Set the callback that notifies you when a new video frame is available, or if the video display configuration somehow changed and requires a redraw. Similar to mpv_set_wakeup_callback(), you must not call any mpv API from the callback, and all the other listed restrictions apply (such as not exiting the callback by throwing exceptions).
--
--     This can be called from any thread, except from an update callback. In case of the OpenGL backend, no OpenGL state or API is accessed.
--
--     Calling this will raise an update callback immediately.
--
--     [@callback@]: callback(callback_ctx) is called if the frame should be redrawn
--
--     [@callback_ctx@]: opaque argument to the callback
--
--     [C declaration]: @mpv_render_context_set_update_callback@, defined at @mpv\/render.h 634:17@
mpv_render_context_set_update_callback
  :: BG.FunPtr (BG.Ptr Mpv_render_context -> Mpv_render_update_fn -> BG.Ptr BG.Void -> IO ())
mpv_render_context_set_update_callback =
  BG.unsafePerformIO hs_bindgen_f7afc2532ff9442f

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_update@
foreign import ccall unsafe "hs_bindgen_575e10ec6c94a0c1"
  hs_bindgen_575e10ec6c94a0c1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_update@
hs_bindgen_575e10ec6c94a0c1
  :: IO (BG.FunPtr (BG.Ptr Mpv_render_context -> IO HsBindgen.Runtime.LibC.Word64))
hs_bindgen_575e10ec6c94a0c1 =
  fmap BG.fromFFIType hs_bindgen_575e10ec6c94a0c1_base

{-# NOINLINE mpv_render_context_update #-}

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
  :: BG.FunPtr (BG.Ptr Mpv_render_context -> IO HsBindgen.Runtime.LibC.Word64)
mpv_render_context_update =
  BG.unsafePerformIO hs_bindgen_575e10ec6c94a0c1

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_render@
foreign import ccall unsafe "hs_bindgen_c3433b1deebcfeb8"
  hs_bindgen_c3433b1deebcfeb8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_render@
hs_bindgen_c3433b1deebcfeb8
  :: IO (BG.FunPtr (BG.Ptr Mpv_render_context -> BG.Ptr Mpv_render_param -> IO BG.CInt))
hs_bindgen_c3433b1deebcfeb8 =
  fmap BG.fromFFIType hs_bindgen_c3433b1deebcfeb8_base

{-# NOINLINE mpv_render_context_render #-}

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
--     [@ctx@]: a valid render context
--
--     [@params@]: an array of parameters, terminated by type==0. Which parameters are required depends on the backend. It\'s left unspecified what happens with unknown parameters.
--
--     [Returns]: error code
--
--     [C declaration]: @mpv_render_context_render@, defined at @mpv\/render.h 709:16@
mpv_render_context_render
  :: BG.FunPtr (BG.Ptr Mpv_render_context -> BG.Ptr Mpv_render_param -> IO BG.CInt)
mpv_render_context_render =
  BG.unsafePerformIO hs_bindgen_c3433b1deebcfeb8

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_report_swap@
foreign import ccall unsafe "hs_bindgen_8e575f526db2170b"
  hs_bindgen_8e575f526db2170b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_report_swap@
hs_bindgen_8e575f526db2170b :: IO (BG.FunPtr (BG.Ptr Mpv_render_context -> IO ()))
hs_bindgen_8e575f526db2170b =
  fmap BG.fromFFIType hs_bindgen_8e575f526db2170b_base

{-# NOINLINE mpv_render_context_report_swap #-}

-- | Tell the renderer that a frame was flipped at the given time. This is optional, but can help the player to achieve better timing.
--
--     Note that calling this at least once informs libmpv that you will use this function. If you use it inconsistently, expect bad video playback.
--
--     If this is called while no video is initialized, it is ignored.
--
--     [@ctx@]: a valid render context
--
--     [C declaration]: @mpv_render_context_report_swap@, defined at @mpv\/render.h 722:17@
mpv_render_context_report_swap :: BG.FunPtr (BG.Ptr Mpv_render_context -> IO ())
mpv_render_context_report_swap =
  BG.unsafePerformIO hs_bindgen_8e575f526db2170b

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_free@
foreign import ccall unsafe "hs_bindgen_56663794a61dd829"
  hs_bindgen_56663794a61dd829_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @mpvbindgensys_Mpv.Sys.Bindgen.Render_get_mpv_render_context_free@
hs_bindgen_56663794a61dd829 :: IO (BG.FunPtr (BG.Ptr Mpv_render_context -> IO ()))
hs_bindgen_56663794a61dd829 =
  fmap BG.fromFFIType hs_bindgen_56663794a61dd829_base

{-# NOINLINE mpv_render_context_free #-}

-- | Destroy the mpv renderer state.
--
--     If video is still active (e.g. a file playing), video will be disabled forcefully.
--
--     [@ctx@]: a valid render context. After this function returns, this is not a valid pointer anymore. NULL is also allowed and does nothing.
--
--     [C declaration]: @mpv_render_context_free@, defined at @mpv\/render.h 733:17@
mpv_render_context_free :: BG.FunPtr (BG.Ptr Mpv_render_context -> IO ())
mpv_render_context_free =
  BG.unsafePerformIO hs_bindgen_56663794a61dd829
