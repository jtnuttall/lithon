{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Mouse.FunPtr (
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_HasMouse,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_GetMice,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_GetMouseNameForID,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_GetMouseFocus,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_GetMouseState,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_GetGlobalMouseState,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_GetRelativeMouseState,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_WarpMouseInWindow,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_WarpMouseGlobal,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_SetRelativeMouseTransform,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_SetWindowRelativeMouseMode,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_GetWindowRelativeMouseMode,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_CaptureMouse,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_CreateCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_CreateColorCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_CreateAnimatedCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_CreateSystemCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_SetCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_GetCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_GetDefaultCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_DestroyCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_ShowCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_HideCursor,
  SDL3.Sys.Bindgen.Mouse.FunPtr.sDL_CursorVisible,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_HasMouse */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_808ad945705f4e48 (void)) (void)"
         , "{"
         , "  return &SDL_HasMouse;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMice */"
         , "__attribute__ ((const))"
         , "SDL_MouseID *(*hs_bindgen_ebefa78305745bc0 (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetMice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMouseNameForID */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_cd3906ba4b6319e7 (void)) ("
         , "  SDL_MouseID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetMouseNameForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMouseFocus */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_b1cca0ecf584dbce (void)) (void)"
         , "{"
         , "  return &SDL_GetMouseFocus;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMouseState */"
         , "__attribute__ ((const))"
         , "SDL_MouseButtonFlags (*hs_bindgen_cd78db7ca1b4380a (void)) ("
         , "  float *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetMouseState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetGlobalMouseState */"
         , "__attribute__ ((const))"
         , "SDL_MouseButtonFlags (*hs_bindgen_8ad222945a494193 (void)) ("
         , "  float *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetGlobalMouseState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetRelativeMouseState */"
         , "__attribute__ ((const))"
         , "SDL_MouseButtonFlags (*hs_bindgen_c09b770b28617678 (void)) ("
         , "  float *arg1,"
         , "  float *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetRelativeMouseState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_WarpMouseInWindow */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_e0aa89262c23f11d (void)) ("
         , "  SDL_Window *arg1,"
         , "  float arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return &SDL_WarpMouseInWindow;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_WarpMouseGlobal */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a6c8da14823bf99f (void)) ("
         , "  float arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_WarpMouseGlobal;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_CursorFrameInfo SDL_CursorFrameInfo;"
         , "typedef void *SDL_MouseMotionTransformCallback;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_SetRelativeMouseTransform */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e75ba6290fb7b58a (void)) ("
         , "  SDL_MouseMotionTransformCallback arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_SetRelativeMouseTransform;"
         , "#else"
         , "  SDL_SetError(\"SDL_SetRelativeMouseTransform requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_SetWindowRelativeMouseMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5b077ae9a298496b (void)) ("
         , "  SDL_Window *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetWindowRelativeMouseMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetWindowRelativeMouseMode */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_46446683507069cd (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetWindowRelativeMouseMode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CaptureMouse */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a6ebcff1379c54e6 (void)) ("
         , "  _Bool arg1"
         , ")"
         , "{"
         , "  return &SDL_CaptureMouse;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateCursor */"
         , "__attribute__ ((const))"
         , "SDL_Cursor *(*hs_bindgen_3f017d38c4a98259 (void)) ("
         , "  Uint8 const *arg1,"
         , "  Uint8 const *arg2,"
         , "  signed int arg3,"
         , "  signed int arg4,"
         , "  signed int arg5,"
         , "  signed int arg6"
         , ")"
         , "{"
         , "  return &SDL_CreateCursor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateColorCursor */"
         , "__attribute__ ((const))"
         , "SDL_Cursor *(*hs_bindgen_9741ddd9d73dea35 (void)) ("
         , "  SDL_Surface *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_CreateColorCursor;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef struct SDL_CursorFrameInfo SDL_CursorFrameInfo;"
         , "typedef void *SDL_MouseMotionTransformCallback;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateAnimatedCursor */"
         , "__attribute__ ((const))"
         , "SDL_Cursor *(*hs_bindgen_5a53bab7f1d0dd41 (void)) ("
         , "  SDL_CursorFrameInfo *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_CreateAnimatedCursor;"
         , "#else"
         , "  SDL_SetError(\"SDL_CreateAnimatedCursor requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateSystemCursor */"
         , "__attribute__ ((const))"
         , "SDL_Cursor *(*hs_bindgen_98115455fed12c20 (void)) ("
         , "  SDL_SystemCursor arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateSystemCursor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_SetCursor */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7f9d9e943410eac0 (void)) ("
         , "  SDL_Cursor *arg1"
         , ")"
         , "{"
         , "  return &SDL_SetCursor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetCursor */"
         , "__attribute__ ((const))"
         , "SDL_Cursor *(*hs_bindgen_ddffa3c703f2160c (void)) (void)"
         , "{"
         , "  return &SDL_GetCursor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetDefaultCursor */"
         , "__attribute__ ((const))"
         , "SDL_Cursor *(*hs_bindgen_3cea96283579f3f7 (void)) (void)"
         , "{"
         , "  return &SDL_GetDefaultCursor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_DestroyCursor */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_cccc019b7e8bc17b (void)) ("
         , "  SDL_Cursor *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyCursor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_ShowCursor */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fa1d352535cdb7a2 (void)) (void)"
         , "{"
         , "  return &SDL_ShowCursor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_HideCursor */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d90c7f4cd007f484 (void)) (void)"
         , "{"
         , "  return &SDL_HideCursor;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CursorVisible */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7ae5464b38889e15 (void)) (void)"
         , "{"
         , "  return &SDL_CursorVisible;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_HasMouse@
foreign import ccall unsafe "hs_bindgen_808ad945705f4e48"
  hs_bindgen_808ad945705f4e48_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_HasMouse@
hs_bindgen_808ad945705f4e48 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_808ad945705f4e48 =
  BG.fromFFIType hs_bindgen_808ad945705f4e48_base

{-# NOINLINE sDL_HasMouse #-}

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
sDL_HasMouse :: BG.FunPtr (IO BG.CBool)
sDL_HasMouse =
  BG.unsafePerformIO hs_bindgen_808ad945705f4e48

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMice@
foreign import ccall unsafe "hs_bindgen_ebefa78305745bc0"
  hs_bindgen_ebefa78305745bc0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMice@
hs_bindgen_ebefa78305745bc0 :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_MouseID)))
hs_bindgen_ebefa78305745bc0 =
  BG.fromFFIType hs_bindgen_ebefa78305745bc0_base

{-# NOINLINE sDL_GetMice #-}

-- | Get a list of currently connected mice.
--
--     Note that this will include any device or virtual driver that includes mouse functionality, including some game controllers, KVM switches, etc. You should wait for input from a device before you consider it actively in use.
--
--     [@count@]: a pointer filled in with the number of mice returned, may be NULL.
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
sDL_GetMice :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_MouseID))
sDL_GetMice =
  BG.unsafePerformIO hs_bindgen_ebefa78305745bc0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMouseNameForID@
foreign import ccall unsafe "hs_bindgen_cd3906ba4b6319e7"
  hs_bindgen_cd3906ba4b6319e7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMouseNameForID@
hs_bindgen_cd3906ba4b6319e7 :: IO (BG.FunPtr (SDL_MouseID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_cd3906ba4b6319e7 =
  BG.fromFFIType hs_bindgen_cd3906ba4b6319e7_base

{-# NOINLINE sDL_GetMouseNameForID #-}

-- | Get the name of a mouse.
--
--     This function returns \"\" if the mouse doesn\'t have a name.
--
--     [@instance_id@]: the mouse instance ID.
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
sDL_GetMouseNameForID :: BG.FunPtr (SDL_MouseID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetMouseNameForID =
  BG.unsafePerformIO hs_bindgen_cd3906ba4b6319e7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMouseFocus@
foreign import ccall unsafe "hs_bindgen_b1cca0ecf584dbce"
  hs_bindgen_b1cca0ecf584dbce_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMouseFocus@
hs_bindgen_b1cca0ecf584dbce :: IO (BG.FunPtr (IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)))
hs_bindgen_b1cca0ecf584dbce =
  BG.fromFFIType hs_bindgen_b1cca0ecf584dbce_base

{-# NOINLINE sDL_GetMouseFocus #-}

-- | Get the window which currently has mouse focus.
--
--     [Returns]: the window with mouse focus.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetMouseFocus@, defined at @SDL3\/SDL_mouse.h 277:42@
sDL_GetMouseFocus :: BG.FunPtr (IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window))
sDL_GetMouseFocus =
  BG.unsafePerformIO hs_bindgen_b1cca0ecf584dbce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMouseState@
foreign import ccall unsafe "hs_bindgen_cd78db7ca1b4380a"
  hs_bindgen_cd78db7ca1b4380a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetMouseState@
hs_bindgen_cd78db7ca1b4380a
  :: IO (BG.FunPtr (BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO SDL_MouseButtonFlags))
hs_bindgen_cd78db7ca1b4380a =
  BG.fromFFIType hs_bindgen_cd78db7ca1b4380a_base

{-# NOINLINE sDL_GetMouseState #-}

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
--     [@x@]: a pointer to receive the SDL-cursor\'s x-position from the focused window\'s top left corner, can be NULL if unused.
--
--     [@y@]: a pointer to receive the SDL-cursor\'s y-position from the focused window\'s top left corner, can be NULL if unused.
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
sDL_GetMouseState :: BG.FunPtr (BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO SDL_MouseButtonFlags)
sDL_GetMouseState =
  BG.unsafePerformIO hs_bindgen_cd78db7ca1b4380a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetGlobalMouseState@
foreign import ccall unsafe "hs_bindgen_8ad222945a494193"
  hs_bindgen_8ad222945a494193_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetGlobalMouseState@
hs_bindgen_8ad222945a494193
  :: IO (BG.FunPtr (BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO SDL_MouseButtonFlags))
hs_bindgen_8ad222945a494193 =
  BG.fromFFIType hs_bindgen_8ad222945a494193_base

{-# NOINLINE sDL_GetGlobalMouseState #-}

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
--     [@x@]: a pointer to receive the platform-cursor\'s x-position from the desktop\'s top left corner, can be NULL if unused.
--
--     [@y@]: a pointer to receive the platform-cursor\'s y-position from the desktop\'s top left corner, can be NULL if unused.
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
  :: BG.FunPtr (BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO SDL_MouseButtonFlags)
sDL_GetGlobalMouseState =
  BG.unsafePerformIO hs_bindgen_8ad222945a494193

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetRelativeMouseState@
foreign import ccall unsafe "hs_bindgen_c09b770b28617678"
  hs_bindgen_c09b770b28617678_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetRelativeMouseState@
hs_bindgen_c09b770b28617678
  :: IO (BG.FunPtr (BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO SDL_MouseButtonFlags))
hs_bindgen_c09b770b28617678 =
  BG.fromFFIType hs_bindgen_c09b770b28617678_base

{-# NOINLINE sDL_GetRelativeMouseState #-}

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
--     [@x@]: a pointer to receive the x mouse delta accumulated since last call, can be NULL if unused.
--
--     [@y@]: a pointer to receive the y mouse delta accumulated since last call, can be NULL if unused.
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
  :: BG.FunPtr (BG.Ptr BG.CFloat -> BG.Ptr BG.CFloat -> IO SDL_MouseButtonFlags)
sDL_GetRelativeMouseState =
  BG.unsafePerformIO hs_bindgen_c09b770b28617678

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_WarpMouseInWindow@
foreign import ccall unsafe "hs_bindgen_e0aa89262c23f11d"
  hs_bindgen_e0aa89262c23f11d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_WarpMouseInWindow@
hs_bindgen_e0aa89262c23f11d
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> BG.CFloat -> BG.CFloat -> IO ()))
hs_bindgen_e0aa89262c23f11d =
  BG.fromFFIType hs_bindgen_e0aa89262c23f11d_base

{-# NOINLINE sDL_WarpMouseInWindow #-}

-- | Move the mouse cursor to the given position within the window.
--
--     This function generates a mouse motion event if relative mode is not enabled. If relative mode is enabled, you can force mouse events for the warp by setting the SDL_HINT_MOUSE_RELATIVE_WARP_MOTION hint.
--
--     Note that this function will appear to succeed, but not actually move the mouse when used over Microsoft Remote Desktop.
--
--     [@window@]: the window to move the mouse into, or NULL for the current mouse focus.
--
--     [@x@]: the x coordinate within the window.
--
--     [@y@]: the y coordinate within the window.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WarpMouseGlobal'
--
--     [C declaration]: @SDL_WarpMouseInWindow@, defined at @SDL3\/SDL_mouse.h 405:34@
sDL_WarpMouseInWindow
  :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> BG.CFloat -> BG.CFloat -> IO ())
sDL_WarpMouseInWindow =
  BG.unsafePerformIO hs_bindgen_e0aa89262c23f11d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_WarpMouseGlobal@
foreign import ccall unsafe "hs_bindgen_a6c8da14823bf99f"
  hs_bindgen_a6c8da14823bf99f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_WarpMouseGlobal@
hs_bindgen_a6c8da14823bf99f :: IO (BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CBool))
hs_bindgen_a6c8da14823bf99f =
  BG.fromFFIType hs_bindgen_a6c8da14823bf99f_base

{-# NOINLINE sDL_WarpMouseGlobal #-}

-- | Move the mouse to the given position in global screen space.
--
--     This function generates a mouse motion event.
--
--     A failure of this function usually means that it is unsupported by a platform.
--
--     Note that this function will appear to succeed, but not actually move the mouse when used over Microsoft Remote Desktop.
--
--     [@x@]: the x coordinate.
--
--     [@y@]: the y coordinate.
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
sDL_WarpMouseGlobal :: BG.FunPtr (BG.CFloat -> BG.CFloat -> IO BG.CBool)
sDL_WarpMouseGlobal =
  BG.unsafePerformIO hs_bindgen_a6c8da14823bf99f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_SetRelativeMouseTransform@
foreign import ccall unsafe "hs_bindgen_e75ba6290fb7b58a"
  hs_bindgen_e75ba6290fb7b58a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_SetRelativeMouseTransform@
hs_bindgen_e75ba6290fb7b58a
  :: IO (BG.FunPtr (SDL_MouseMotionTransformCallback -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_e75ba6290fb7b58a =
  BG.fromFFIType hs_bindgen_e75ba6290fb7b58a_base

{-# NOINLINE sDL_SetRelativeMouseTransform #-}

-- | Set a user-defined function by which to transform relative mouse inputs.
--
--     This overrides the relative system scale and relative speed scale hints. Should be called prior to enabling relative mouse mode, fails otherwise.
--
--     [@callback@]: a callback used to transform relative mouse motion, or NULL for default behavior.
--
--     [@userdata@]: a pointer that will be passed to @callback@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_SetRelativeMouseTransform@, defined at @SDL3\/SDL_mouse.h 448:34@
sDL_SetRelativeMouseTransform
  :: BG.FunPtr (SDL_MouseMotionTransformCallback -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_SetRelativeMouseTransform =
  BG.unsafePerformIO hs_bindgen_e75ba6290fb7b58a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_SetWindowRelativeMouseMode@
foreign import ccall unsafe "hs_bindgen_5b077ae9a298496b"
  hs_bindgen_5b077ae9a298496b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_SetWindowRelativeMouseMode@
hs_bindgen_5b077ae9a298496b
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> BG.CBool -> IO BG.CBool))
hs_bindgen_5b077ae9a298496b =
  BG.fromFFIType hs_bindgen_5b077ae9a298496b_base

{-# NOINLINE sDL_SetWindowRelativeMouseMode #-}

-- | Set relative mouse mode for a window.
--
--     While the window has focus and relative mouse mode is enabled, the cursor is hidden, the mouse position is constrained to the window, and SDL will report continuous relative mouse motion even if the mouse is at the edge of the window.
--
--     If you\'d like to keep the mouse position fixed while in relative mode you can use SDL_SetWindowMouseRect(). If you\'d like the cursor to be at a specific location when relative mode ends, you should use @SDL_WarpMouseInWindow()@ before disabling relative mode.
--
--     This function will flush any pending mouse motion for this window.
--
--     [@window@]: the window to change.
--
--     [@enabled@]: true to enable relative mode, false to disable.
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
  :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> BG.CBool -> IO BG.CBool)
sDL_SetWindowRelativeMouseMode =
  BG.unsafePerformIO hs_bindgen_5b077ae9a298496b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetWindowRelativeMouseMode@
foreign import ccall unsafe "hs_bindgen_46446683507069cd"
  hs_bindgen_46446683507069cd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetWindowRelativeMouseMode@
hs_bindgen_46446683507069cd
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool))
hs_bindgen_46446683507069cd =
  BG.fromFFIType hs_bindgen_46446683507069cd_base

{-# NOINLINE sDL_GetWindowRelativeMouseMode #-}

-- | Query whether relative mouse mode is enabled for a window.
--
--     [@window@]: the window to query.
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
  :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool)
sDL_GetWindowRelativeMouseMode =
  BG.unsafePerformIO hs_bindgen_46446683507069cd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CaptureMouse@
foreign import ccall unsafe "hs_bindgen_a6ebcff1379c54e6"
  hs_bindgen_a6ebcff1379c54e6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CaptureMouse@
hs_bindgen_a6ebcff1379c54e6 :: IO (BG.FunPtr (BG.CBool -> IO BG.CBool))
hs_bindgen_a6ebcff1379c54e6 =
  BG.fromFFIType hs_bindgen_a6ebcff1379c54e6_base

{-# NOINLINE sDL_CaptureMouse #-}

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
--     [@enabled@]: true to enable capturing, false to disable.
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
sDL_CaptureMouse :: BG.FunPtr (BG.CBool -> IO BG.CBool)
sDL_CaptureMouse =
  BG.unsafePerformIO hs_bindgen_a6ebcff1379c54e6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateCursor@
foreign import ccall unsafe "hs_bindgen_3f017d38c4a98259"
  hs_bindgen_3f017d38c4a98259_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateCursor@
hs_bindgen_3f017d38c4a98259
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.CInt
             -> BG.CInt
             -> BG.CInt
             -> BG.CInt
             -> IO (BG.Ptr SDL_Cursor)
           )
       )
hs_bindgen_3f017d38c4a98259 =
  BG.fromFFIType hs_bindgen_3f017d38c4a98259_base

{-# NOINLINE sDL_CreateCursor #-}

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
--     [@data@]: the color value for each pixel of the cursor.
--
--     [@mask@]: the mask value for each pixel of the cursor.
--
--     [@w@]: the width of the cursor.
--
--     [@h@]: the height of the cursor.
--
--     [@hot_x@]: the x-axis offset from the left of the cursor image to the mouse x position, in the range of 0 to @w@ - 1.
--
--     [@hot_y@]: the y-axis offset from the top of the cursor image to the mouse y position, in the range of 0 to @h@ - 1.
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
  :: BG.FunPtr
       ( PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.CInt
         -> BG.CInt
         -> BG.CInt
         -> BG.CInt
         -> IO (BG.Ptr SDL_Cursor)
       )
sDL_CreateCursor =
  BG.unsafePerformIO hs_bindgen_3f017d38c4a98259

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateColorCursor@
foreign import ccall unsafe "hs_bindgen_9741ddd9d73dea35"
  hs_bindgen_9741ddd9d73dea35_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateColorCursor@
hs_bindgen_9741ddd9d73dea35
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> BG.CInt -> BG.CInt -> IO (BG.Ptr SDL_Cursor))
       )
hs_bindgen_9741ddd9d73dea35 =
  BG.fromFFIType hs_bindgen_9741ddd9d73dea35_base

{-# NOINLINE sDL_CreateColorCursor #-}

-- | Create a color cursor.
--
--     If this function is passed a surface with alternate representations added with SDL_AddSurfaceAlternateImage(), the surface will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations if SDL_HINT_MOUSE_DPI_SCALE_CURSORS is enabled. For example, if the original surface is 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     [@surface@]: an SDL_Surface structure representing the cursor image.
--
--     [@hot_x@]: the x position of the cursor hot spot.
--
--     [@hot_y@]: the y position of the cursor hot spot.
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
  :: BG.FunPtr
       (BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface -> BG.CInt -> BG.CInt -> IO (BG.Ptr SDL_Cursor))
sDL_CreateColorCursor =
  BG.unsafePerformIO hs_bindgen_9741ddd9d73dea35

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateAnimatedCursor@
foreign import ccall unsafe "hs_bindgen_5a53bab7f1d0dd41"
  hs_bindgen_5a53bab7f1d0dd41_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateAnimatedCursor@
hs_bindgen_5a53bab7f1d0dd41
  :: IO
       (BG.FunPtr (BG.Ptr SDL_CursorFrameInfo -> BG.CInt -> BG.CInt -> BG.CInt -> IO (BG.Ptr SDL_Cursor)))
hs_bindgen_5a53bab7f1d0dd41 =
  BG.fromFFIType hs_bindgen_5a53bab7f1d0dd41_base

{-# NOINLINE sDL_CreateAnimatedCursor #-}

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
--     [@frames@]: an array of cursor images composing the animation.
--
--     [@frame_count@]: the number of frames in the sequence.
--
--     [@hot_x@]: the x position of the cursor hot spot.
--
--     [@hot_y@]: the y position of the cursor hot spot.
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
  :: BG.FunPtr (BG.Ptr SDL_CursorFrameInfo -> BG.CInt -> BG.CInt -> BG.CInt -> IO (BG.Ptr SDL_Cursor))
sDL_CreateAnimatedCursor =
  BG.unsafePerformIO hs_bindgen_5a53bab7f1d0dd41

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateSystemCursor@
foreign import ccall unsafe "hs_bindgen_98115455fed12c20"
  hs_bindgen_98115455fed12c20_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CreateSystemCursor@
hs_bindgen_98115455fed12c20 :: IO (BG.FunPtr (SDL_SystemCursor -> IO (BG.Ptr SDL_Cursor)))
hs_bindgen_98115455fed12c20 =
  BG.fromFFIType hs_bindgen_98115455fed12c20_base

{-# NOINLINE sDL_CreateSystemCursor #-}

-- | Create a system cursor.
--
--     [@id@]: an 'SDL_SystemCursor' enum value.
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
sDL_CreateSystemCursor :: BG.FunPtr (SDL_SystemCursor -> IO (BG.Ptr SDL_Cursor))
sDL_CreateSystemCursor =
  BG.unsafePerformIO hs_bindgen_98115455fed12c20

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_SetCursor@
foreign import ccall unsafe "hs_bindgen_7f9d9e943410eac0"
  hs_bindgen_7f9d9e943410eac0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_SetCursor@
hs_bindgen_7f9d9e943410eac0 :: IO (BG.FunPtr (BG.Ptr SDL_Cursor -> IO BG.CBool))
hs_bindgen_7f9d9e943410eac0 =
  BG.fromFFIType hs_bindgen_7f9d9e943410eac0_base

{-# NOINLINE sDL_SetCursor #-}

-- | Set the active cursor.
--
--     This function sets the currently active cursor to the specified one. If the cursor is currently visible, the change will be immediately represented on the display. SDL_SetCursor(NULL) can be used to force cursor redraw, if this is desired for any reason.
--
--     [@cursor@]: a cursor to make active.
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
sDL_SetCursor :: BG.FunPtr (BG.Ptr SDL_Cursor -> IO BG.CBool)
sDL_SetCursor =
  BG.unsafePerformIO hs_bindgen_7f9d9e943410eac0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetCursor@
foreign import ccall unsafe "hs_bindgen_ddffa3c703f2160c"
  hs_bindgen_ddffa3c703f2160c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetCursor@
hs_bindgen_ddffa3c703f2160c :: IO (BG.FunPtr (IO (BG.Ptr SDL_Cursor)))
hs_bindgen_ddffa3c703f2160c =
  BG.fromFFIType hs_bindgen_ddffa3c703f2160c_base

{-# NOINLINE sDL_GetCursor #-}

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
sDL_GetCursor :: BG.FunPtr (IO (BG.Ptr SDL_Cursor))
sDL_GetCursor =
  BG.unsafePerformIO hs_bindgen_ddffa3c703f2160c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetDefaultCursor@
foreign import ccall unsafe "hs_bindgen_3cea96283579f3f7"
  hs_bindgen_3cea96283579f3f7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_GetDefaultCursor@
hs_bindgen_3cea96283579f3f7 :: IO (BG.FunPtr (IO (BG.Ptr SDL_Cursor)))
hs_bindgen_3cea96283579f3f7 =
  BG.fromFFIType hs_bindgen_3cea96283579f3f7_base

{-# NOINLINE sDL_GetDefaultCursor #-}

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
sDL_GetDefaultCursor :: BG.FunPtr (IO (BG.Ptr SDL_Cursor))
sDL_GetDefaultCursor =
  BG.unsafePerformIO hs_bindgen_3cea96283579f3f7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_DestroyCursor@
foreign import ccall unsafe "hs_bindgen_cccc019b7e8bc17b"
  hs_bindgen_cccc019b7e8bc17b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_DestroyCursor@
hs_bindgen_cccc019b7e8bc17b :: IO (BG.FunPtr (BG.Ptr SDL_Cursor -> IO ()))
hs_bindgen_cccc019b7e8bc17b =
  BG.fromFFIType hs_bindgen_cccc019b7e8bc17b_base

{-# NOINLINE sDL_DestroyCursor #-}

-- | Free a previously-created cursor.
--
--     Use this function to free cursor resources created with @SDL_CreateCursor()@, @SDL_CreateColorCursor()@ or @SDL_CreateSystemCursor()@.
--
--     [@cursor@]: the cursor to free.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateAnimatedCursor', 'sDL_CreateColorCursor', 'sDL_CreateCursor', 'sDL_CreateSystemCursor'
--
--     [C declaration]: @SDL_DestroyCursor@, defined at @SDL3\/SDL_mouse.h 760:34@
sDL_DestroyCursor :: BG.FunPtr (BG.Ptr SDL_Cursor -> IO ())
sDL_DestroyCursor =
  BG.unsafePerformIO hs_bindgen_cccc019b7e8bc17b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_ShowCursor@
foreign import ccall unsafe "hs_bindgen_fa1d352535cdb7a2"
  hs_bindgen_fa1d352535cdb7a2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_ShowCursor@
hs_bindgen_fa1d352535cdb7a2 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_fa1d352535cdb7a2 =
  BG.fromFFIType hs_bindgen_fa1d352535cdb7a2_base

{-# NOINLINE sDL_ShowCursor #-}

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
sDL_ShowCursor :: BG.FunPtr (IO BG.CBool)
sDL_ShowCursor =
  BG.unsafePerformIO hs_bindgen_fa1d352535cdb7a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_HideCursor@
foreign import ccall unsafe "hs_bindgen_d90c7f4cd007f484"
  hs_bindgen_d90c7f4cd007f484_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_HideCursor@
hs_bindgen_d90c7f4cd007f484 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_d90c7f4cd007f484 =
  BG.fromFFIType hs_bindgen_d90c7f4cd007f484_base

{-# NOINLINE sDL_HideCursor #-}

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
sDL_HideCursor :: BG.FunPtr (IO BG.CBool)
sDL_HideCursor =
  BG.unsafePerformIO hs_bindgen_d90c7f4cd007f484

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CursorVisible@
foreign import ccall unsafe "hs_bindgen_7ae5464b38889e15"
  hs_bindgen_7ae5464b38889e15_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mouse_get_SDL_CursorVisible@
hs_bindgen_7ae5464b38889e15 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_7ae5464b38889e15 =
  BG.fromFFIType hs_bindgen_7ae5464b38889e15_base

{-# NOINLINE sDL_CursorVisible #-}

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
sDL_CursorVisible :: BG.FunPtr (IO BG.CBool)
sDL_CursorVisible =
  BG.unsafePerformIO hs_bindgen_7ae5464b38889e15
