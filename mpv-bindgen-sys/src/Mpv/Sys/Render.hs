-- | Render API: drive video output from your own rendering loop.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @Mpv.Sys.Bindgen.Render.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "Mpv.Sys".
module Mpv.Sys.Render (
  module Mpv.Sys.Bindgen.Render,

  -- * Function aliases
  Mpv.Sys.Render.renderContextCreateSafe,
  Mpv.Sys.Render.renderContextSetParameter,
  Mpv.Sys.Render.renderContextSetParameterSafe,
  Mpv.Sys.Render.renderContextGetInfo,
  Mpv.Sys.Render.renderContextGetInfoSafe,
  Mpv.Sys.Render.renderContextSetUpdateCallbackSafe,
  Mpv.Sys.Render.renderContextUpdate,
  Mpv.Sys.Render.renderContextUpdateSafe,
  Mpv.Sys.Render.renderContextRender,
  Mpv.Sys.Render.renderContextRenderSafe,
  Mpv.Sys.Render.renderContextReportSwap,
  Mpv.Sys.Render.renderContextReportSwapSafe,
  Mpv.Sys.Render.renderContextFree,
  Mpv.Sys.Render.renderContextFreeSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import Mpv.Sys.Bindgen.Client qualified
import Mpv.Sys.Bindgen.Render
import Mpv.Sys.Bindgen.Render.Safe qualified as Safe
import Mpv.Sys.Bindgen.Render.Unsafe qualified as Unsafe

-- | Initialize the renderer state. Depending on the backend used, this will access the underlying GPU API and initialize its own objects.
--
--     You must free the context with @'renderContextFree'@. Not doing so before the mpv core is destroyed may result in memory leaks or crashes.
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
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_render_context_create@.
--                   The unsafe import is not exported
--                   : calls get_proc_address from mpv_opengl_init_params synchronously while loading OpenGL functions.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @Mpv.Sys.Bindgen.Render.Unsafe.mpv_render_context_create@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_render_context_create@, defined at @mpv\/render.h 578:16@
renderContextCreateSafe
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
  -> IO BG.Int32
renderContextCreateSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.mpv_render_context_create x00 x11 x22)

-- | Attempt to change a single parameter. Not all backends and parameter types support all kinds of changes.
--
--     [Returns]: error code. If a parameter could actually be changed, this returns success, otherwise an error code depending on the parameter type and situation.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_render_context_set_parameter@.
--                   The safe flavor is 'renderContextSetParameterSafe'
--                   : a changed ICC profile reinitializes the renderer on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_render_context_set_parameter@, defined at @mpv\/render.h 591:16@
renderContextSetParameter
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> Mpv_render_param
  -- ^
  --
  --           [@param@]: the parameter type and data that should be set
  -> IO BG.Int32
renderContextSetParameter =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_render_context_set_parameter x00 x11)

-- | Attempt to change a single parameter. Not all backends and parameter types support all kinds of changes.
--
--     [Returns]: error code. If a parameter could actually be changed, this returns success, otherwise an error code depending on the parameter type and situation.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_render_context_set_parameter@.
--                   The unsafe flavor is 'renderContextSetParameter'
--                   : a changed ICC profile reinitializes the renderer on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_render_context_set_parameter@, defined at @mpv\/render.h 591:16@
renderContextSetParameterSafe
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> Mpv_render_param
  -- ^
  --
  --           [@param@]: the parameter type and data that should be set
  -> IO BG.Int32
renderContextSetParameterSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.mpv_render_context_set_parameter x00 x11)

-- | Retrieve information from the render context. This is NOT a counterpart to @'renderContextSetParameter'@, because you generally can\'t read parameters set with it, and this function is not meant for this purpose. Instead, this is for communicating information from the renderer back to the user. See 'Mpv_render_param_type'; entries which support this function explicitly mention it, and for other entries you can assume it will fail.
--
--     You pass param with param.type set and param.data pointing to a variable of the required data type. The function will then overwrite that variable with the returned value (at least on success).
--
--     [Returns]: error code. If a parameter could actually be retrieved, this returns success, otherwise an error code depending on the parameter type and situation. MPV_ERROR_NOT_IMPLEMENTED is used for unknown param.type, or if retrieving it is not supported.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_render_context_get_info@.
--                   The safe flavor is 'renderContextGetInfoSafe'
--                   : reads the queued frame under the render context lock, which the VO thread holds only briefly.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_render_context_get_info@, defined at @mpv\/render.h 613:16@
renderContextGetInfo
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> Mpv_render_param
  -- ^
  --
  --           [@param@]: the parameter type and data that should be retrieved
  -> IO BG.Int32
renderContextGetInfo =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_render_context_get_info x00 x11)

-- | Retrieve information from the render context. This is NOT a counterpart to @'renderContextSetParameter'@, because you generally can\'t read parameters set with it, and this function is not meant for this purpose. Instead, this is for communicating information from the renderer back to the user. See 'Mpv_render_param_type'; entries which support this function explicitly mention it, and for other entries you can assume it will fail.
--
--     You pass param with param.type set and param.data pointing to a variable of the required data type. The function will then overwrite that variable with the returned value (at least on success).
--
--     [Returns]: error code. If a parameter could actually be retrieved, this returns success, otherwise an error code depending on the parameter type and situation. MPV_ERROR_NOT_IMPLEMENTED is used for unknown param.type, or if retrieving it is not supported.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_render_context_get_info@.
--                   The unsafe flavor is 'renderContextGetInfo'
--                   : reads the queued frame under the render context lock, which the VO thread holds only briefly.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_render_context_get_info@, defined at @mpv\/render.h 613:16@
renderContextGetInfoSafe
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> Mpv_render_param
  -- ^
  --
  --           [@param@]: the parameter type and data that should be retrieved
  -> IO BG.Int32
renderContextGetInfoSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.mpv_render_context_get_info x00 x11)

-- | Set the callback that notifies you when a new video frame is available, or if the video display configuration somehow changed and requires a redraw. Similar to 'Mpv.Sys.Client.setWakeupCallbackSafe', you must not call any mpv API from the callback, and all the other listed restrictions apply (such as not exiting the callback by throwing exceptions).
--
--     This can be called from any thread, except from an update callback. In case of the OpenGL backend, no OpenGL state or API is accessed.
--
--     Calling this will raise an update callback immediately.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_render_context_set_update_callback@.
--                   The unsafe import is not exported
--                   : invokes the callback once immediately.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @Mpv.Sys.Bindgen.Render.Unsafe.mpv_render_context_set_update_callback@.
--
--     [C declaration]: @mpv_render_context_set_update_callback@, defined at @mpv\/render.h 634:17@
renderContextSetUpdateCallbackSafe
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
renderContextSetUpdateCallbackSafe =
  Safe.mpv_render_context_set_update_callback

-- | The API user is supposed to call this when the update callback was invoked (like all mpv_render_* functions, this has to happen on the render thread, and /not/ from the update callback itself).
--
--     This is optional if MPV_RENDER_PARAM_ADVANCED_CONTROL was not set (default). Otherwise, it\'s a hard requirement that this is called after each update callback. If multiple update callback happened, and the function could not be called sooner, it\'s OK to call it once after the last callback.
--
--     If an update callback happens during or after this function, the function must be called again at the soonest possible time.
--
--     If MPV_RENDER_PARAM_ADVANCED_CONTROL was set, this will do additional work such as allocating textures for the video decoder.
--
--     [Returns]: a bitset of @mpv_render_update_flag@ values (i.e. multiple flags are combined with bitwise or). Typically, this will tell the API user what should happen next. E.g. if the MPV_RENDER_UPDATE_FRAME flag is set, @'renderContextRender'@ should be called. If flags unknown to the API user are set, or if the return value is 0, nothing needs to be done.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_render_context_update@.
--                   The safe flavor is 'renderContextUpdateSafe'
--                   : runs pending render-thread work on the calling thread, including decoder texture allocation with MPV_RENDER_PARAM_ADVANCED_CONTROL.
--
--     [C declaration]: @mpv_render_context_update@, defined at @mpv\/render.h 661:21@
renderContextUpdate
  :: BG.Ptr Mpv_render_context
  -- ^ [C declaration]: @ctx@
  -> IO HsBindgen.Runtime.LibC.Word64
renderContextUpdate =
  Unsafe.mpv_render_context_update

-- | The API user is supposed to call this when the update callback was invoked (like all mpv_render_* functions, this has to happen on the render thread, and /not/ from the update callback itself).
--
--     This is optional if MPV_RENDER_PARAM_ADVANCED_CONTROL was not set (default). Otherwise, it\'s a hard requirement that this is called after each update callback. If multiple update callback happened, and the function could not be called sooner, it\'s OK to call it once after the last callback.
--
--     If an update callback happens during or after this function, the function must be called again at the soonest possible time.
--
--     If MPV_RENDER_PARAM_ADVANCED_CONTROL was set, this will do additional work such as allocating textures for the video decoder.
--
--     [Returns]: a bitset of @mpv_render_update_flag@ values (i.e. multiple flags are combined with bitwise or). Typically, this will tell the API user what should happen next. E.g. if the MPV_RENDER_UPDATE_FRAME flag is set, @'renderContextRender'@ should be called. If flags unknown to the API user are set, or if the return value is 0, nothing needs to be done.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_render_context_update@.
--                   The unsafe flavor is 'renderContextUpdate'
--                   : runs pending render-thread work on the calling thread, including decoder texture allocation with MPV_RENDER_PARAM_ADVANCED_CONTROL.
--
--     [C declaration]: @mpv_render_context_update@, defined at @mpv\/render.h 661:21@
renderContextUpdateSafe
  :: BG.Ptr Mpv_render_context
  -- ^ [C declaration]: @ctx@
  -> IO HsBindgen.Runtime.LibC.Word64
renderContextUpdateSafe =
  Safe.mpv_render_context_update

-- | Render video.
--
--     Typically renders the video to a target surface provided via 'Mpv_render_param' (the details depend on the backend in use). Options like \"panscan\" are applied to determine which part of the video should be visible and how the video should be scaled. You can change these options at runtime by using the mpv property API.
--
--     The renderer will reconfigure itself every time the target surface configuration (such as size) is changed.
--
--     This function implicitly pulls a video frame from the internal queue and renders it. If no new frame is available, the previous frame is redrawn. The update callback set with @'renderContextSetUpdateCallbackSafe'@ notifies you when a new frame was added. The details potentially depend on the backends and the provided parameters.
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
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_render_context_render@.
--                   The safe flavor is 'renderContextRenderSafe'
--                   : blocks until the frame\'s target display time unless MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME is 0.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_render_context_render@, defined at @mpv\/render.h 709:16@
renderContextRender
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> BG.Ptr Mpv_render_param
  -- ^
  --
  --           [@params@]: an array of parameters, terminated by type==0. Which parameters are required depends on the backend. It\'s left unspecified what happens with unknown parameters.
  -> IO BG.Int32
renderContextRender =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.mpv_render_context_render x00 x11)

-- | Render video.
--
--     Typically renders the video to a target surface provided via 'Mpv_render_param' (the details depend on the backend in use). Options like \"panscan\" are applied to determine which part of the video should be visible and how the video should be scaled. You can change these options at runtime by using the mpv property API.
--
--     The renderer will reconfigure itself every time the target surface configuration (such as size) is changed.
--
--     This function implicitly pulls a video frame from the internal queue and renders it. If no new frame is available, the previous frame is redrawn. The update callback set with @'renderContextSetUpdateCallbackSafe'@ notifies you when a new frame was added. The details potentially depend on the backends and the provided parameters.
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
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_render_context_render@.
--                   The unsafe flavor is 'renderContextRender'
--                   : blocks until the frame\'s target display time unless MPV_RENDER_PARAM_BLOCK_FOR_TARGET_TIME is 0.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @mpv_render_context_render@, defined at @mpv\/render.h 709:16@
renderContextRenderSafe
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> BG.Ptr Mpv_render_param
  -- ^
  --
  --           [@params@]: an array of parameters, terminated by type==0. Which parameters are required depends on the backend. It\'s left unspecified what happens with unknown parameters.
  -> IO BG.Int32
renderContextRenderSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.mpv_render_context_render x00 x11)

-- | Tell the renderer that a frame was flipped at the given time. This is optional, but can help the player to achieve better timing.
--
--     Note that calling this at least once informs libmpv that you will use this function. If you use it inconsistently, expect bad video playback.
--
--     If this is called while no video is initialized, it is ignored.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_render_context_report_swap@.
--                   The safe flavor is 'renderContextReportSwapSafe'
--                   : signals the VO thread under the render context lock, which the VO thread holds only briefly.
--
--     [C declaration]: @mpv_render_context_report_swap@, defined at @mpv\/render.h 722:17@
renderContextReportSwap
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> IO ()
renderContextReportSwap =
  Unsafe.mpv_render_context_report_swap

-- | Tell the renderer that a frame was flipped at the given time. This is optional, but can help the player to achieve better timing.
--
--     Note that calling this at least once informs libmpv that you will use this function. If you use it inconsistently, expect bad video playback.
--
--     If this is called while no video is initialized, it is ignored.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_render_context_report_swap@.
--                   The unsafe flavor is 'renderContextReportSwap'
--                   : signals the VO thread under the render context lock, which the VO thread holds only briefly.
--
--     [C declaration]: @mpv_render_context_report_swap@, defined at @mpv\/render.h 722:17@
renderContextReportSwapSafe
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context
  -> IO ()
renderContextReportSwapSafe =
  Safe.mpv_render_context_report_swap

-- | Destroy the mpv renderer state.
--
--     If video is still active (e.g. a file playing), video will be disabled forcefully.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @mpv_render_context_free@.
--                   The safe flavor is 'renderContextFreeSafe'
--                   : if video is active, blocks until the core has torn down the video chain, serving the render queue meanwhile.
--
--     [C declaration]: @mpv_render_context_free@, defined at @mpv\/render.h 733:17@
renderContextFree
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context. After this function returns, this is not a valid pointer anymore. NULL is also allowed and does nothing.
  -> IO ()
renderContextFree = Unsafe.mpv_render_context_free

-- | Destroy the mpv renderer state.
--
--     If video is still active (e.g. a file playing), video will be disabled forcefully.
--
--     === __@mpv-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @mpv_render_context_free@.
--                   The unsafe flavor is 'renderContextFree'
--                   : if video is active, blocks until the core has torn down the video chain, serving the render queue meanwhile.
--
--     [C declaration]: @mpv_render_context_free@, defined at @mpv\/render.h 733:17@
renderContextFreeSafe
  :: BG.Ptr Mpv_render_context
  -- ^
  --
  --           [@ctx@]: a valid render context. After this function returns, this is not a valid pointer anymore. NULL is also allowed and does nothing.
  -> IO ()
renderContextFreeSafe = Safe.mpv_render_context_free
