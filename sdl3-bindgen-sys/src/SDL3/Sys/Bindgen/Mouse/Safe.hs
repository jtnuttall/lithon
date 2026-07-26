{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Mouse.Safe (
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_HasMouse,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_GetMice,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_GetMouseNameForID,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_GetMouseFocus,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_GetMouseState,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_GetGlobalMouseState,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_GetRelativeMouseState,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_WarpMouseInWindow,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_WarpMouseGlobal,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_SetRelativeMouseTransform,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_SetWindowRelativeMouseMode,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_GetWindowRelativeMouseMode,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_CaptureMouse,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_CreateCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_CreateColorCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_CreateAnimatedCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_CreateSystemCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_SetCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_GetCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_GetDefaultCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_DestroyCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_ShowCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_HideCursor,
  SDL3.Sys.Bindgen.Mouse.Safe.sDL_CursorVisible,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Mouse
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified
import SDL3.Sys.Bindgen.Video qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_mouse.h>"
         , "_Bool hs_bindgen_c5f87eb6a615a43b (void)"
         , "{"
         , "  return (SDL_HasMouse)();"
         , "}"
         , "SDL_MouseID *hs_bindgen_b5ddc524dd09ed59 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetMice)(arg1);"
         , "}"
         , "char const *hs_bindgen_5f9df08d34babce6 ("
         , "  SDL_MouseID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetMouseNameForID)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_d663c2bc45028535 (void)"
         , "{"
         , "  return (SDL_GetMouseFocus)();"
         , "}"
         , "SDL_MouseButtonFlags hs_bindgen_ea9a965df89a99a0 ("
         , "  float *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetMouseState)(arg1, arg2);"
         , "}"
         , "SDL_MouseButtonFlags hs_bindgen_10d90c46febd8700 ("
         , "  float *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetGlobalMouseState)(arg1, arg2);"
         , "}"
         , "SDL_MouseButtonFlags hs_bindgen_b0dfdde07e2521d8 ("
         , "  float *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetRelativeMouseState)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_0eb4d6e5e240c8df ("
         , "  SDL_Window *arg1,"
         , "  float arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  (SDL_WarpMouseInWindow)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_f03dc8593d130e68 ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_WarpMouseGlobal)(arg1, arg2);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_CursorFrameInfo SDL_CursorFrameInfo;"
         , "typedef void *SDL_MouseMotionTransformCallback;"
         , "#endif"
         , "_Bool hs_bindgen_c18f7adda4cf4b0b ("
         , "  SDL_MouseMotionTransformCallback arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_SetRelativeMouseTransform)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_SetRelativeMouseTransform requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "_Bool hs_bindgen_ebfc8396f7c8dfc1 ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return (SDL_SetWindowRelativeMouseMode)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_c122318f49f37c28 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetWindowRelativeMouseMode)(arg1);"
         , "}"
         , "_Bool hs_bindgen_ba2a652c2d22d4f9 ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  return (SDL_CaptureMouse)(arg1);"
         , "}"
         , "SDL_Cursor *hs_bindgen_8aa3978a09ad477f ("
         , "  Uint8 const *arg1,"
         , "  Uint8 const *arg2,"
         , "  signed int arg3,"
         , "  signed int arg4,"
         , "  signed int arg5,"
         , "  signed int arg6"
         , ")"
         , "{"
         , "  return (SDL_CreateCursor)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "SDL_Cursor *hs_bindgen_1af9c26d315c2409 ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_CreateColorCursor)(arg1, arg2, arg3);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_CursorFrameInfo SDL_CursorFrameInfo;"
         , "typedef void *SDL_MouseMotionTransformCallback;"
         , "#endif"
         , "SDL_Cursor *hs_bindgen_9a5f9b18f58c86ff ("
         , "  SDL_CursorFrameInfo *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_CreateAnimatedCursor)(arg1, arg2, arg3, arg4);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; (void)arg4; SDL_SetError(\"SDL_CreateAnimatedCursor requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "SDL_Cursor *hs_bindgen_9c5496f4b40d0ce6 ("
         , "  SDL_SystemCursor arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateSystemCursor)(arg1);"
         , "}"
         , "_Bool hs_bindgen_3b39298a9bf3a79f ("
         , "  SDL_Cursor *arg1"
         , ")"
         , "{"
         , "  return (SDL_SetCursor)(arg1);"
         , "}"
         , "SDL_Cursor *hs_bindgen_0ad270dac1fad234 (void)"
         , "{"
         , "  return (SDL_GetCursor)();"
         , "}"
         , "SDL_Cursor *hs_bindgen_eba07747bd0a11f2 (void)"
         , "{"
         , "  return (SDL_GetDefaultCursor)();"
         , "}"
         , "void hs_bindgen_c88c0b977a69ed2a ("
         , "  SDL_Cursor *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyCursor)(arg1);"
         , "}"
         , "_Bool hs_bindgen_2dbfefec61405524 (void)"
         , "{"
         , "  return (SDL_ShowCursor)();"
         , "}"
         , "_Bool hs_bindgen_40414e63ec7f7a75 (void)"
         , "{"
         , "  return (SDL_HideCursor)();"
         , "}"
         , "_Bool hs_bindgen_3414c4fe925fe000 (void)"
         , "{"
         , "  return (SDL_CursorVisible)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_HasMouse@
foreign import ccall safe "hs_bindgen_c5f87eb6a615a43b"
  hs_bindgen_c5f87eb6a615a43b_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_HasMouse@
hs_bindgen_c5f87eb6a615a43b :: IO BG.CBool
hs_bindgen_c5f87eb6a615a43b =
  BG.fromFFIType hs_bindgen_c5f87eb6a615a43b_base

-- | Return whether a mouse is currently connected.
--
--     [Returns]: true if a mouse is connected, false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMice'
--
--     [C declaration]: @SDL_HasMouse@, defined at @SDL3\/SDL_mouse.h 226:34@
sDL_HasMouse :: IO BG.CBool
sDL_HasMouse = hs_bindgen_c5f87eb6a615a43b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetMice@
foreign import ccall safe "hs_bindgen_b5ddc524dd09ed59"
  hs_bindgen_b5ddc524dd09ed59_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetMice@
hs_bindgen_b5ddc524dd09ed59
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_MouseID)
hs_bindgen_b5ddc524dd09ed59 =
  BG.fromFFIType hs_bindgen_b5ddc524dd09ed59_base

-- | Get a list of currently connected mice.
--
--     Note that this will include any device or virtual driver that includes mouse functionality, including some game controllers, KVM switches, etc. You should wait for input from a device before you consider it actively in use.
--
--     [Returns]: a 0 terminated array of mouse instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMouseNameForID', 'sDL_HasMouse'
--
--     [C declaration]: @SDL_GetMice@, defined at @SDL3\/SDL_mouse.h 249:43@
sDL_GetMice
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of mice returned, may be NULL.
  -> IO (BG.Ptr SDL_MouseID)
sDL_GetMice = hs_bindgen_b5ddc524dd09ed59

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetMouseNameForID@
foreign import ccall safe "hs_bindgen_5f9df08d34babce6"
  hs_bindgen_5f9df08d34babce6_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetMouseNameForID@
hs_bindgen_5f9df08d34babce6
  :: SDL_MouseID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_5f9df08d34babce6 =
  BG.fromFFIType hs_bindgen_5f9df08d34babce6_base

-- | Get the name of a mouse.
--
--     This function returns \"\" if the mouse doesn\'t have a name.
--
--     [Returns]: the name of the selected mouse, or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMice'
--
--     [C declaration]: @SDL_GetMouseNameForID@, defined at @SDL3\/SDL_mouse.h 266:42@
sDL_GetMouseNameForID
  :: SDL_MouseID
  -- ^
  --
  --           [@instance_id@]: the mouse instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetMouseNameForID = hs_bindgen_5f9df08d34babce6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetMouseFocus@
foreign import ccall safe "hs_bindgen_d663c2bc45028535"
  hs_bindgen_d663c2bc45028535_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetMouseFocus@
hs_bindgen_d663c2bc45028535 :: IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
hs_bindgen_d663c2bc45028535 =
  BG.fromFFIType hs_bindgen_d663c2bc45028535_base

-- | Get the window which currently has mouse focus.
--
--     [Returns]: the window with mouse focus.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetMouseFocus@, defined at @SDL3\/SDL_mouse.h 277:42@
sDL_GetMouseFocus :: IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
sDL_GetMouseFocus = hs_bindgen_d663c2bc45028535

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetMouseState@
foreign import ccall safe "hs_bindgen_ea9a965df89a99a0"
  hs_bindgen_ea9a965df89a99a0_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetMouseState@
hs_bindgen_ea9a965df89a99a0
  :: BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO SDL_MouseButtonFlags
hs_bindgen_ea9a965df89a99a0 =
  BG.fromFFIType hs_bindgen_ea9a965df89a99a0_base

-- | Query SDL\'s cache for the synchronous mouse button state and the window-relative SDL-cursor position.
--
--     This function returns the cached synchronous state as SDL understands it from the last pump of the event queue.
--
--     To query the platform for immediate asynchronous state, use SDL_GetGlobalMouseState.
--
--     Passing non-NULL pointers to @x@ or @y@ will write the destination with respective x or y coordinates relative to the focused window.
--
--     In Relative Mode, the SDL-cursor\'s position usually contradicts the platform-cursor\'s position as manually calculated from @SDL_GetGlobalMouseState()@ and SDL_GetWindowPosition.
--
--     [Returns]: a 32-bit bitmask of the button state that can be bitwise-compared against the @SDL_BUTTON_MASK(X)@ macro.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGlobalMouseState', 'sDL_GetRelativeMouseState'
--
--     [C declaration]: @SDL_GetMouseState@, defined at @SDL3\/SDL_mouse.h 310:50@
sDL_GetMouseState
  :: BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer to receive the SDL-cursor\'s x-position from the focused window\'s top left corner, can be NULL if unused.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer to receive the SDL-cursor\'s y-position from the focused window\'s top left corner, can be NULL if unused.
  -> IO SDL_MouseButtonFlags
sDL_GetMouseState = hs_bindgen_ea9a965df89a99a0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetGlobalMouseState@
foreign import ccall safe "hs_bindgen_10d90c46febd8700"
  hs_bindgen_10d90c46febd8700_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetGlobalMouseState@
hs_bindgen_10d90c46febd8700
  :: BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO SDL_MouseButtonFlags
hs_bindgen_10d90c46febd8700 =
  BG.fromFFIType hs_bindgen_10d90c46febd8700_base

-- | Query the platform for the asynchronous mouse button state and the desktop-relative platform-cursor position.
--
--     This function immediately queries the platform for the most recent asynchronous state, more costly than retrieving SDL\'s cached state in @SDL_GetMouseState()@.
--
--     Passing non-NULL pointers to @x@ or @y@ will write the destination with respective x or y coordinates relative to the desktop.
--
--     In Relative Mode, the platform-cursor\'s position usually contradicts the SDL-cursor\'s position as manually calculated from @SDL_GetMouseState()@ and SDL_GetWindowPosition.
--
--     This function can be useful if you need to track the mouse outside of a specific window and @SDL_CaptureMouse()@ doesn\'t fit your needs. For example, it could be useful if you need to track the mouse while dragging a window, where coordinates relative to a window might not be in sync at all times.
--
--     [Returns]: a 32-bit bitmask of the button state that can be bitwise-compared against the @SDL_BUTTON_MASK(X)@ macro.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CaptureMouse', 'sDL_GetMouseState', 'sDL_GetGlobalMouseState'
--
--     [C declaration]: @SDL_GetGlobalMouseState@, defined at @SDL3\/SDL_mouse.h 347:50@
sDL_GetGlobalMouseState
  :: BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer to receive the platform-cursor\'s x-position from the desktop\'s top left corner, can be NULL if unused.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer to receive the platform-cursor\'s y-position from the desktop\'s top left corner, can be NULL if unused.
  -> IO SDL_MouseButtonFlags
sDL_GetGlobalMouseState = hs_bindgen_10d90c46febd8700

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetRelativeMouseState@
foreign import ccall safe "hs_bindgen_b0dfdde07e2521d8"
  hs_bindgen_b0dfdde07e2521d8_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetRelativeMouseState@
hs_bindgen_b0dfdde07e2521d8
  :: BG.Ptr BG.CFloat
  -> BG.Ptr BG.CFloat
  -> IO SDL_MouseButtonFlags
hs_bindgen_b0dfdde07e2521d8 =
  BG.fromFFIType hs_bindgen_b0dfdde07e2521d8_base

-- | Query SDL\'s cache for the synchronous mouse button state and accumulated mouse delta since last call.
--
--     This function returns the cached synchronous state as SDL understands it from the last pump of the event queue.
--
--     To query the platform for immediate asynchronous state, use SDL_GetGlobalMouseState.
--
--     Passing non-NULL pointers to @x@ or @y@ will write the destination with respective x or y deltas accumulated since the last call to this function (or since event initialization).
--
--     This function is useful for reducing overhead by processing relative mouse inputs in one go per-frame instead of individually per-event, at the expense of losing the order between events within the frame (e.g. quickly pressing and releasing a button within the same frame).
--
--     [Returns]: a 32-bit bitmask of the button state that can be bitwise-compared against the @SDL_BUTTON_MASK(X)@ macro.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMouseState', 'sDL_GetGlobalMouseState'
--
--     [C declaration]: @SDL_GetRelativeMouseState@, defined at @SDL3\/SDL_mouse.h 382:50@
sDL_GetRelativeMouseState
  :: BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer to receive the x mouse delta accumulated since last call, can be NULL if unused.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer to receive the y mouse delta accumulated since last call, can be NULL if unused.
  -> IO SDL_MouseButtonFlags
sDL_GetRelativeMouseState =
  hs_bindgen_b0dfdde07e2521d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_WarpMouseInWindow@
foreign import ccall safe "hs_bindgen_0eb4d6e5e240c8df"
  hs_bindgen_0eb4d6e5e240c8df_base
    :: BG.Ptr BG.Void
    -> Float
    -> Float
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_WarpMouseInWindow@
hs_bindgen_0eb4d6e5e240c8df
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> BG.CFloat
  -> BG.CFloat
  -> IO ()
hs_bindgen_0eb4d6e5e240c8df =
  BG.fromFFIType hs_bindgen_0eb4d6e5e240c8df_base

-- | Move the mouse cursor to the given position within the window.
--
--     This function generates a mouse motion event if relative mode is not enabled. If relative mode is enabled, you can force mouse events for the warp by setting the SDL_HINT_MOUSE_RELATIVE_WARP_MOTION hint.
--
--     Note that this function will appear to succeed, but not actually move the mouse when used over Microsoft Remote Desktop.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WarpMouseGlobal'
--
--     [C declaration]: @SDL_WarpMouseInWindow@, defined at @SDL3\/SDL_mouse.h 405:34@
sDL_WarpMouseInWindow
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to move the mouse into, or NULL for the current mouse focus.
  -> BG.CFloat
  -- ^
  --
  --           [@x@]: the x coordinate within the window.
  -> BG.CFloat
  -- ^
  --
  --           [@y@]: the y coordinate within the window.
  -> IO ()
sDL_WarpMouseInWindow = hs_bindgen_0eb4d6e5e240c8df

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_WarpMouseGlobal@
foreign import ccall safe "hs_bindgen_f03dc8593d130e68"
  hs_bindgen_f03dc8593d130e68_base
    :: Float
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_WarpMouseGlobal@
hs_bindgen_f03dc8593d130e68
  :: BG.CFloat
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_f03dc8593d130e68 =
  BG.fromFFIType hs_bindgen_f03dc8593d130e68_base

-- | Move the mouse to the given position in global screen space.
--
--     This function generates a mouse motion event.
--
--     A failure of this function usually means that it is unsupported by a platform.
--
--     Note that this function will appear to succeed, but not actually move the mouse when used over Microsoft Remote Desktop.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WarpMouseInWindow'
--
--     [C declaration]: @SDL_WarpMouseGlobal@, defined at @SDL3\/SDL_mouse.h 430:34@
sDL_WarpMouseGlobal
  :: BG.CFloat
  -- ^
  --
  --           [@x@]: the x coordinate.
  -> BG.CFloat
  -- ^
  --
  --           [@y@]: the y coordinate.
  -> IO BG.CBool
sDL_WarpMouseGlobal = hs_bindgen_f03dc8593d130e68

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_SetRelativeMouseTransform@
foreign import ccall safe "hs_bindgen_c18f7adda4cf4b0b"
  hs_bindgen_c18f7adda4cf4b0b_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_SetRelativeMouseTransform@
hs_bindgen_c18f7adda4cf4b0b
  :: SDL_MouseMotionTransformCallback
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_c18f7adda4cf4b0b =
  BG.fromFFIType hs_bindgen_c18f7adda4cf4b0b_base

-- | Set a user-defined function by which to transform relative mouse inputs.
--
--     This overrides the relative system scale and relative speed scale hints. Should be called prior to enabling relative mouse mode, fails otherwise.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetRelativeMouseTransform@, defined at @SDL3\/SDL_mouse.h 448:34@
sDL_SetRelativeMouseTransform
  :: SDL_MouseMotionTransformCallback
  -- ^
  --
  --           [@callback@]: a callback used to transform relative mouse motion, or NULL for default behavior.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that will be passed to @callback@.
  -> IO BG.CBool
sDL_SetRelativeMouseTransform =
  hs_bindgen_c18f7adda4cf4b0b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_SetWindowRelativeMouseMode@
foreign import ccall safe "hs_bindgen_ebfc8396f7c8dfc1"
  hs_bindgen_ebfc8396f7c8dfc1_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_SetWindowRelativeMouseMode@
hs_bindgen_ebfc8396f7c8dfc1
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_ebfc8396f7c8dfc1 =
  BG.fromFFIType hs_bindgen_ebfc8396f7c8dfc1_base

-- | Set relative mouse mode for a window.
--
--     While the window has focus and relative mouse mode is enabled, the cursor is hidden, the mouse position is constrained to the window, and SDL will report continuous relative mouse motion even if the mouse is at the edge of the window.
--
--     If you\'d like to keep the mouse position fixed while in relative mode you can use SDL_SetWindowMouseRect(). If you\'d like the cursor to be at a specific location when relative mode ends, you should use @SDL_WarpMouseInWindow()@ before disabling relative mode.
--
--     This function will flush any pending mouse motion for this window.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetWindowRelativeMouseMode'
--
--     [C declaration]: @SDL_SetWindowRelativeMouseMode@, defined at @SDL3\/SDL_mouse.h 476:34@
sDL_SetWindowRelativeMouseMode
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> BG.CBool
  -- ^
  --
  --           [@enabled@]: true to enable relative mode, false to disable.
  -> IO BG.CBool
sDL_SetWindowRelativeMouseMode =
  hs_bindgen_ebfc8396f7c8dfc1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetWindowRelativeMouseMode@
foreign import ccall safe "hs_bindgen_c122318f49f37c28"
  hs_bindgen_c122318f49f37c28_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetWindowRelativeMouseMode@
hs_bindgen_c122318f49f37c28
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_c122318f49f37c28 =
  BG.fromFFIType hs_bindgen_c122318f49f37c28_base

-- | Query whether relative mouse mode is enabled for a window.
--
--     [Returns]: true if relative mode is enabled for a window or false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetWindowRelativeMouseMode'
--
--     [C declaration]: @SDL_GetWindowRelativeMouseMode@, defined at @SDL3\/SDL_mouse.h 490:34@
sDL_GetWindowRelativeMouseMode
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO BG.CBool
sDL_GetWindowRelativeMouseMode =
  hs_bindgen_c122318f49f37c28

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CaptureMouse@
foreign import ccall safe "hs_bindgen_ba2a652c2d22d4f9"
  hs_bindgen_ba2a652c2d22d4f9_base
    :: BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CaptureMouse@
hs_bindgen_ba2a652c2d22d4f9
  :: BG.CBool
  -> IO BG.CBool
hs_bindgen_ba2a652c2d22d4f9 =
  BG.fromFFIType hs_bindgen_ba2a652c2d22d4f9_base

-- | Capture the mouse and to track input outside an SDL window.
--
--     Capturing enables your app to obtain mouse events globally, instead of just within your window. Not all video targets support this function. When capturing is enabled, the current window will get all mouse events, but unlike relative mode, no change is made to the cursor and it is not restrained to your window.
--
--     This function may also deny mouse input to other windows both those in your application and others on the system so you should use this function sparingly, and in small bursts. For example, you might want to track the mouse while the user is dragging something, until the user releases a mouse button. It is not recommended that you capture the mouse for long periods of time, such as the entire time your app is running. For that, you should probably use @SDL_SetWindowRelativeMouseMode()@ or SDL_SetWindowMouseGrab(), depending on your goals.
--
--     While captured, mouse events still report coordinates relative to the current (foreground) window, but those coordinates may be outside the bounds of the window (including negative values). Capturing is only allowed for the foreground window. If the window loses focus while capturing, the capture will be disabled automatically.
--
--     While capturing is enabled, the current window will have the @SDL_WINDOW_MOUSE_CAPTURE@ flag set.
--
--     Please note that SDL will attempt to \"auto capture\" the mouse while the user is pressing a button; this is to try and make mouse behavior more consistent between platforms, and deal with the common case of a user dragging the mouse outside of the window. This means that if you are calling @SDL_CaptureMouse()@ only to deal with this situation, you do not have to (although it is safe to do so). If this causes problems for your app, you can disable auto capture by setting the @SDL_HINT_MOUSE_AUTO_CAPTURE@ hint to zero.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetGlobalMouseState'
--
--     [C declaration]: @SDL_CaptureMouse@, defined at @SDL3\/SDL_mouse.h 538:34@
sDL_CaptureMouse
  :: BG.CBool
  -- ^
  --
  --           [@enabled@]: true to enable capturing, false to disable.
  -> IO BG.CBool
sDL_CaptureMouse = hs_bindgen_ba2a652c2d22d4f9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CreateCursor@
foreign import ccall safe "hs_bindgen_8aa3978a09ad477f"
  hs_bindgen_8aa3978a09ad477f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CreateCursor@
hs_bindgen_8aa3978a09ad477f
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> IO (BG.Ptr SDL_Cursor)
hs_bindgen_8aa3978a09ad477f =
  BG.fromFFIType hs_bindgen_8aa3978a09ad477f_base

-- | Create a cursor using the specified bitmap data and mask (in MSB format).
--
--     @mask@ has to be in MSB (Most Significant Bit) format.
--
--     The cursor width (@w@) must be a multiple of 8 bits.
--
--     The cursor is created in black and white according to the following:
--
--     * data=0, mask=1: white
--
--     * data=1, mask=1: black
--
--     * data=0, mask=0: transparent
--
--     * data=1, mask=0: inverted color if possible, black if not.
--
--     Cursors created with this function must be freed with @SDL_DestroyCursor()@.
--
--     If you want to have a color cursor, or create your cursor from an SDL_Surface, you should use @SDL_CreateColorCursor()@. Alternately, you can hide the cursor and draw your own as part of your game\'s rendering, but it will be bound to the framerate.
--
--     Also, @SDL_CreateSystemCursor()@ is available, which provides several readily-available system cursors to pick from.
--
--     [Returns]: a new cursor with the specified parameters on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateAnimatedCursor', 'sDL_CreateColorCursor', 'sDL_CreateSystemCursor', 'sDL_DestroyCursor', 'sDL_SetCursor'
--
--     [C declaration]: @SDL_CreateCursor@, defined at @SDL3\/SDL_mouse.h 585:42@
sDL_CreateCursor
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@data@]: the color value for each pixel of the cursor.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@mask@]: the mask value for each pixel of the cursor.
  -> BG.CInt
  -- ^
  --
  --           [@w@]: the width of the cursor.
  -> BG.CInt
  -- ^
  --
  --           [@h@]: the height of the cursor.
  -> BG.CInt
  -- ^
  --
  --           [@hot_x@]: the x-axis offset from the left of the cursor image to the mouse x position, in the range of 0 to @w@ - 1.
  -> BG.CInt
  -- ^
  --
  --           [@hot_y@]: the y-axis offset from the top of the cursor image to the mouse y position, in the range of 0 to @h@ - 1.
  -> IO (BG.Ptr SDL_Cursor)
sDL_CreateCursor = hs_bindgen_8aa3978a09ad477f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CreateColorCursor@
foreign import ccall safe "hs_bindgen_1af9c26d315c2409"
  hs_bindgen_1af9c26d315c2409_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CreateColorCursor@
hs_bindgen_1af9c26d315c2409
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -> BG.CInt
  -> BG.CInt
  -> IO (BG.Ptr SDL_Cursor)
hs_bindgen_1af9c26d315c2409 =
  BG.fromFFIType hs_bindgen_1af9c26d315c2409_base

-- | Create a color cursor.
--
--     If this function is passed a surface with alternate representations added with SDL_AddSurfaceAlternateImage(), the surface will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations if SDL_HINT_MOUSE_DPI_SCALE_CURSORS is enabled. For example, if the original surface is 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     [Returns]: the new cursor on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_AddSurfaceAlternateImage, 'sDL_CreateAnimatedCursor', 'sDL_CreateCursor', 'sDL_CreateSystemCursor', 'sDL_DestroyCursor', 'sDL_SetCursor'
--
--     [C declaration]: @SDL_CreateColorCursor@, defined at @SDL3\/SDL_mouse.h 622:42@
sDL_CreateColorCursor
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: an SDL_Surface structure representing the cursor image.
  -> BG.CInt
  -- ^
  --
  --           [@hot_x@]: the x position of the cursor hot spot.
  -> BG.CInt
  -- ^
  --
  --           [@hot_y@]: the y position of the cursor hot spot.
  -> IO (BG.Ptr SDL_Cursor)
sDL_CreateColorCursor = hs_bindgen_1af9c26d315c2409

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CreateAnimatedCursor@
foreign import ccall safe "hs_bindgen_9a5f9b18f58c86ff"
  hs_bindgen_9a5f9b18f58c86ff_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CreateAnimatedCursor@
hs_bindgen_9a5f9b18f58c86ff
  :: BG.Ptr SDL_CursorFrameInfo
  -> BG.CInt
  -> BG.CInt
  -> BG.CInt
  -> IO (BG.Ptr SDL_Cursor)
hs_bindgen_9a5f9b18f58c86ff =
  BG.fromFFIType hs_bindgen_9a5f9b18f58c86ff_base

-- | Create an animated color cursor.
--
--     Animated cursors are composed of a sequential array of frames, specified as surfaces and durations in an array of 'SDL_CursorFrameInfo' structs. The hot spot coordinates are universal to all frames, and all frames must have the same dimensions.
--
--     Frame durations are specified in milliseconds. A duration of 0 implies an infinite frame time, and the animation will stop on that frame. To create a one-shot animation, set the duration of the last frame in the sequence to 0.
--
--     If this function is passed surfaces with alternate representations added with SDL_AddSurfaceAlternateImage(), the surfaces will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations. For example, if the original surfaces are 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     If the underlying platform does not support animated cursors, this function will fall back to creating a static color cursor using the first frame in the sequence.
--
--     [Returns]: the new cursor on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: SDL_AddSurfaceAlternateImage, 'sDL_CreateCursor', 'sDL_CreateColorCursor', 'sDL_CreateSystemCursor', 'sDL_DestroyCursor', 'sDL_SetCursor'
--
--     [C declaration]: @SDL_CreateAnimatedCursor@, defined at @SDL3\/SDL_mouse.h 672:41@
sDL_CreateAnimatedCursor
  :: BG.Ptr SDL_CursorFrameInfo
  -- ^
  --
  --           [@frames@]: an array of cursor images composing the animation.
  -> BG.CInt
  -- ^
  --
  --           [@frame_count@]: the number of frames in the sequence.
  -> BG.CInt
  -- ^
  --
  --           [@hot_x@]: the x position of the cursor hot spot.
  -> BG.CInt
  -- ^
  --
  --           [@hot_y@]: the y position of the cursor hot spot.
  -> IO (BG.Ptr SDL_Cursor)
sDL_CreateAnimatedCursor =
  hs_bindgen_9a5f9b18f58c86ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CreateSystemCursor@
foreign import ccall safe "hs_bindgen_9c5496f4b40d0ce6"
  hs_bindgen_9c5496f4b40d0ce6_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CreateSystemCursor@
hs_bindgen_9c5496f4b40d0ce6
  :: SDL_SystemCursor
  -> IO (BG.Ptr SDL_Cursor)
hs_bindgen_9c5496f4b40d0ce6 =
  BG.fromFFIType hs_bindgen_9c5496f4b40d0ce6_base

-- | Create a system cursor.
--
--     [Returns]: a cursor on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyCursor'
--
--     [C declaration]: @SDL_CreateSystemCursor@, defined at @SDL3\/SDL_mouse.h 690:42@
sDL_CreateSystemCursor
  :: SDL_SystemCursor
  -- ^
  --
  --           [@id@]: an 'SDL_SystemCursor' enum value.
  -> IO (BG.Ptr SDL_Cursor)
sDL_CreateSystemCursor = hs_bindgen_9c5496f4b40d0ce6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_SetCursor@
foreign import ccall safe "hs_bindgen_3b39298a9bf3a79f"
  hs_bindgen_3b39298a9bf3a79f_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_SetCursor@
hs_bindgen_3b39298a9bf3a79f
  :: BG.Ptr SDL_Cursor
  -> IO BG.CBool
hs_bindgen_3b39298a9bf3a79f =
  BG.fromFFIType hs_bindgen_3b39298a9bf3a79f_base

-- | Set the active cursor.
--
--     This function sets the currently active cursor to the specified one. If the cursor is currently visible, the change will be immediately represented on the display. SDL_SetCursor(NULL) can be used to force cursor redraw, if this is desired for any reason.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetCursor'
--
--     [C declaration]: @SDL_SetCursor@, defined at @SDL3\/SDL_mouse.h 710:34@
sDL_SetCursor
  :: BG.Ptr SDL_Cursor
  -- ^
  --
  --           [@cursor@]: a cursor to make active.
  -> IO BG.CBool
sDL_SetCursor = hs_bindgen_3b39298a9bf3a79f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetCursor@
foreign import ccall safe "hs_bindgen_0ad270dac1fad234"
  hs_bindgen_0ad270dac1fad234_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetCursor@
hs_bindgen_0ad270dac1fad234 :: IO (BG.Ptr SDL_Cursor)
hs_bindgen_0ad270dac1fad234 =
  BG.fromFFIType hs_bindgen_0ad270dac1fad234_base

-- | Get the active cursor.
--
--     This function returns a pointer to the current cursor which is owned by the library. It is not necessary to free the cursor with @SDL_DestroyCursor()@.
--
--     [Returns]: the active cursor or NULL if there is no mouse.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetCursor'
--
--     [C declaration]: @SDL_GetCursor@, defined at @SDL3\/SDL_mouse.h 726:42@
sDL_GetCursor :: IO (BG.Ptr SDL_Cursor)
sDL_GetCursor = hs_bindgen_0ad270dac1fad234

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetDefaultCursor@
foreign import ccall safe "hs_bindgen_eba07747bd0a11f2"
  hs_bindgen_eba07747bd0a11f2_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_GetDefaultCursor@
hs_bindgen_eba07747bd0a11f2 :: IO (BG.Ptr SDL_Cursor)
hs_bindgen_eba07747bd0a11f2 =
  BG.fromFFIType hs_bindgen_eba07747bd0a11f2_base

-- | Get the default cursor.
--
--     You do not have to call @SDL_DestroyCursor()@ on the return value, but it is safe to do so.
--
--     [Returns]: the default cursor on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetDefaultCursor@, defined at @SDL3\/SDL_mouse.h 741:42@
sDL_GetDefaultCursor :: IO (BG.Ptr SDL_Cursor)
sDL_GetDefaultCursor = hs_bindgen_eba07747bd0a11f2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_DestroyCursor@
foreign import ccall safe "hs_bindgen_c88c0b977a69ed2a"
  hs_bindgen_c88c0b977a69ed2a_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_DestroyCursor@
hs_bindgen_c88c0b977a69ed2a
  :: BG.Ptr SDL_Cursor
  -> IO ()
hs_bindgen_c88c0b977a69ed2a =
  BG.fromFFIType hs_bindgen_c88c0b977a69ed2a_base

-- | Free a previously-created cursor.
--
--     Use this function to free cursor resources created with @SDL_CreateCursor()@, @SDL_CreateColorCursor()@ or @SDL_CreateSystemCursor()@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateAnimatedCursor', 'sDL_CreateColorCursor', 'sDL_CreateCursor', 'sDL_CreateSystemCursor'
--
--     [C declaration]: @SDL_DestroyCursor@, defined at @SDL3\/SDL_mouse.h 760:34@
sDL_DestroyCursor
  :: BG.Ptr SDL_Cursor
  -- ^
  --
  --           [@cursor@]: the cursor to free.
  -> IO ()
sDL_DestroyCursor = hs_bindgen_c88c0b977a69ed2a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_ShowCursor@
foreign import ccall safe "hs_bindgen_2dbfefec61405524"
  hs_bindgen_2dbfefec61405524_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_ShowCursor@
hs_bindgen_2dbfefec61405524 :: IO BG.CBool
hs_bindgen_2dbfefec61405524 =
  BG.fromFFIType hs_bindgen_2dbfefec61405524_base

-- | Show the cursor.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CursorVisible', 'sDL_HideCursor'
--
--     [C declaration]: @SDL_ShowCursor@, defined at @SDL3\/SDL_mouse.h 775:34@
sDL_ShowCursor :: IO BG.CBool
sDL_ShowCursor = hs_bindgen_2dbfefec61405524

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_HideCursor@
foreign import ccall safe "hs_bindgen_40414e63ec7f7a75"
  hs_bindgen_40414e63ec7f7a75_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_HideCursor@
hs_bindgen_40414e63ec7f7a75 :: IO BG.CBool
hs_bindgen_40414e63ec7f7a75 =
  BG.fromFFIType hs_bindgen_40414e63ec7f7a75_base

-- | Hide the cursor.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CursorVisible', 'sDL_ShowCursor'
--
--     [C declaration]: @SDL_HideCursor@, defined at @SDL3\/SDL_mouse.h 790:34@
sDL_HideCursor :: IO BG.CBool
sDL_HideCursor = hs_bindgen_40414e63ec7f7a75

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CursorVisible@
foreign import ccall safe "hs_bindgen_3414c4fe925fe000"
  hs_bindgen_3414c4fe925fe000_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_Safe_SDL_CursorVisible@
hs_bindgen_3414c4fe925fe000 :: IO BG.CBool
hs_bindgen_3414c4fe925fe000 =
  BG.fromFFIType hs_bindgen_3414c4fe925fe000_base

-- | Return whether the cursor is currently being shown.
--
--     [Returns]: @true@ if the cursor is being shown, or @false@ if the cursor is hidden.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HideCursor', 'sDL_ShowCursor'
--
--     [C declaration]: @SDL_CursorVisible@, defined at @SDL3\/SDL_mouse.h 805:34@
sDL_CursorVisible :: IO BG.CBool
sDL_CursorVisible = hs_bindgen_3414c4fe925fe000
