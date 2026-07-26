{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Keyboard.Unsafe (
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_HasKeyboard,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetKeyboards,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetKeyboardNameForID,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetKeyboardFocus,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetKeyboardState,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_ResetKeyboard,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetModState,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_SetModState,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetKeyFromScancode,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetScancodeFromKey,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_SetScancodeName,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetScancodeName,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetScancodeFromName,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetKeyName,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetKeyFromName,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_StartTextInput,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_StartTextInputWithProperties,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_TextInputActive,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_StopTextInput,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_ClearComposition,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_SetTextInputArea,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_GetTextInputArea,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_HasScreenKeyboardSupport,
  SDL3.Sys.Bindgen.Keyboard.Unsafe.sDL_ScreenKeyboardShown,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Keyboard
import SDL3.Sys.Bindgen.Keycode qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Scancode qualified
import SDL3.Sys.Bindgen.Video qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_keyboard.h>"
         , "_Bool hs_bindgen_d64e7e9c8eac060b (void)"
         , "{"
         , "  return (SDL_HasKeyboard)();"
         , "}"
         , "SDL_KeyboardID *hs_bindgen_5cbd85637f312ec5 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyboards)(arg1);"
         , "}"
         , "char const *hs_bindgen_ddca0041795d5b05 ("
         , "  SDL_KeyboardID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyboardNameForID)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_c75176be07ddf456 (void)"
         , "{"
         , "  return (SDL_GetKeyboardFocus)();"
         , "}"
         , "_Bool const *hs_bindgen_a0b91f25692e960c ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyboardState)(arg1);"
         , "}"
         , "void hs_bindgen_61b9fb1b26a3505c (void)"
         , "{"
         , "  (SDL_ResetKeyboard)();"
         , "}"
         , "SDL_Keymod hs_bindgen_d1acc028a58a01f0 (void)"
         , "{"
         , "  return (SDL_GetModState)();"
         , "}"
         , "void hs_bindgen_b05ffb360c052d7c ("
         , "  SDL_Keymod arg1"
         , ")"
         , "{"
         , "  (SDL_SetModState)(arg1);"
         , "}"
         , "SDL_Keycode hs_bindgen_ff76f1254f8fdac9 ("
         , "  SDL_Scancode arg1,"
         , "  SDL_Keymod arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_GetKeyFromScancode)(arg1, arg2, arg3);"
         , "}"
         , "SDL_Scancode hs_bindgen_3ca1dc40673f0b86 ("
         , "  SDL_Keycode arg1,"
         , "  SDL_Keymod *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetScancodeFromKey)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_8dafd77961e1a111 ("
         , "  SDL_Scancode arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetScancodeName)(arg1, arg2);"
         , "}"
         , "char const *hs_bindgen_b685af9e0919d14c ("
         , "  SDL_Scancode arg1"
         , ")"
         , "{"
         , "  return (SDL_GetScancodeName)(arg1);"
         , "}"
         , "SDL_Scancode hs_bindgen_7e17fd8d9faf99b2 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetScancodeFromName)(arg1);"
         , "}"
         , "char const *hs_bindgen_bc806af89a4922a7 ("
         , "  SDL_Keycode arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyName)(arg1);"
         , "}"
         , "SDL_Keycode hs_bindgen_427d0617876df1a1 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyFromName)(arg1);"
         , "}"
         , "_Bool hs_bindgen_5a9261502fa2575b ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_StartTextInput)(arg1);"
         , "}"
         , "_Bool hs_bindgen_0c7cd0ff2864a5c4 ("
         , "  SDL_Window *arg1,"
         , "  SDL_PropertiesID arg2"
         , ")"
         , "{"
         , "  return (SDL_StartTextInputWithProperties)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_5c76ed8d45b8c50f ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_TextInputActive)(arg1);"
         , "}"
         , "_Bool hs_bindgen_3ae77c9248468f14 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_StopTextInput)(arg1);"
         , "}"
         , "_Bool hs_bindgen_2d81775a3f86e350 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_ClearComposition)(arg1);"
         , "}"
         , "_Bool hs_bindgen_6de1e1b47fbde959 ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetTextInputArea)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_e48f604580fa9c58 ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetTextInputArea)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_94887f48a4a41d37 (void)"
         , "{"
         , "  return (SDL_HasScreenKeyboardSupport)();"
         , "}"
         , "_Bool hs_bindgen_6ec8a3c2431361bd ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_ScreenKeyboardShown)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_HasKeyboard@
foreign import ccall unsafe "hs_bindgen_d64e7e9c8eac060b"
  hs_bindgen_d64e7e9c8eac060b_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_HasKeyboard@
hs_bindgen_d64e7e9c8eac060b :: IO BG.CBool
hs_bindgen_d64e7e9c8eac060b =
  BG.fromFFIType hs_bindgen_d64e7e9c8eac060b_base

-- | Return whether a keyboard is currently connected.
--
--     [Returns]: true if a keyboard is connected, false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyboards'
--
--     [C declaration]: @SDL_HasKeyboard@, defined at @SDL3\/SDL_keyboard.h 75:34@
sDL_HasKeyboard :: IO BG.CBool
sDL_HasKeyboard = hs_bindgen_d64e7e9c8eac060b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyboards@
foreign import ccall unsafe "hs_bindgen_5cbd85637f312ec5"
  hs_bindgen_5cbd85637f312ec5_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyboards@
hs_bindgen_5cbd85637f312ec5
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_KeyboardID)
hs_bindgen_5cbd85637f312ec5 =
  BG.fromFFIType hs_bindgen_5cbd85637f312ec5_base

-- | Get a list of currently connected keyboards.
--
--     Note that this will include any device or virtual driver that includes keyboard functionality, including some mice, KVM switches, motherboard power buttons, etc. You should wait for input from a device before you consider it actively in use.
--
--     [Returns]: a 0 terminated array of keyboards instance IDs or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyboardNameForID', 'sDL_HasKeyboard'
--
--     [C declaration]: @SDL_GetKeyboards@, defined at @SDL3\/SDL_keyboard.h 98:46@
sDL_GetKeyboards
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of keyboards returned, may be NULL.
  -> IO (BG.Ptr SDL_KeyboardID)
sDL_GetKeyboards = hs_bindgen_5cbd85637f312ec5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyboardNameForID@
foreign import ccall unsafe "hs_bindgen_ddca0041795d5b05"
  hs_bindgen_ddca0041795d5b05_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyboardNameForID@
hs_bindgen_ddca0041795d5b05
  :: SDL_KeyboardID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_ddca0041795d5b05 =
  BG.fromFFIType hs_bindgen_ddca0041795d5b05_base

-- | Get the name of a keyboard.
--
--     This function returns \"\" if the keyboard doesn\'t have a name.
--
--     [Returns]: the name of the selected keyboard or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyboards'
--
--     [C declaration]: @SDL_GetKeyboardNameForID@, defined at @SDL3\/SDL_keyboard.h 115:42@
sDL_GetKeyboardNameForID
  :: SDL_KeyboardID
  -- ^
  --
  --           [@instance_id@]: the keyboard instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetKeyboardNameForID =
  hs_bindgen_ddca0041795d5b05

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyboardFocus@
foreign import ccall unsafe "hs_bindgen_c75176be07ddf456"
  hs_bindgen_c75176be07ddf456_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyboardFocus@
hs_bindgen_c75176be07ddf456 :: IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
hs_bindgen_c75176be07ddf456 =
  BG.fromFFIType hs_bindgen_c75176be07ddf456_base

-- | Query the window which currently has keyboard focus.
--
--     [Returns]: the window with keyboard focus.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetKeyboardFocus@, defined at @SDL3\/SDL_keyboard.h 126:42@
sDL_GetKeyboardFocus :: IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
sDL_GetKeyboardFocus = hs_bindgen_c75176be07ddf456

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyboardState@
foreign import ccall unsafe "hs_bindgen_a0b91f25692e960c"
  hs_bindgen_a0b91f25692e960c_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyboardState@
hs_bindgen_a0b91f25692e960c
  :: BG.Ptr BG.CInt
  -> IO (PtrConst.PtrConst BG.CBool)
hs_bindgen_a0b91f25692e960c =
  BG.fromFFIType hs_bindgen_a0b91f25692e960c_base

-- | Get a snapshot of the current state of the keyboard.
--
--     The pointer returned is a pointer to an internal SDL array. It will be valid for the whole lifetime of the application and should not be freed by the caller.
--
--     A array element with a value of true means that the key is pressed and a value of false means that it is not. Indexes into this array are obtained by using SDL_Scancode values.
--
--     Use SDL_PumpEvents() to update the state array.
--
--     This function gives you the current state after all events have been processed, so if a key or button has been pressed and released before you process events, then the pressed state will never show up in the @SDL_GetKeyboardState()@ calls.
--
--     Note: This function doesn\'t take into account whether shift has been pressed or not.
--
--     [Returns]: a pointer to an array of key states.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_PumpEvents, 'sDL_ResetKeyboard'
--
--     [C declaration]: @SDL_GetKeyboardState@, defined at @SDL3\/SDL_keyboard.h 159:42@
sDL_GetKeyboardState
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@numkeys@]: if non-NULL, receives the length of the returned array.
  -> IO (PtrConst.PtrConst BG.CBool)
sDL_GetKeyboardState = hs_bindgen_a0b91f25692e960c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_ResetKeyboard@
foreign import ccall unsafe "hs_bindgen_61b9fb1b26a3505c"
  hs_bindgen_61b9fb1b26a3505c_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_ResetKeyboard@
hs_bindgen_61b9fb1b26a3505c :: IO ()
hs_bindgen_61b9fb1b26a3505c =
  BG.fromFFIType hs_bindgen_61b9fb1b26a3505c_base

-- | Clear the state of the keyboard.
--
--     This function will generate key up events for all pressed keys.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyboardState'
--
--     [C declaration]: @SDL_ResetKeyboard@, defined at @SDL3\/SDL_keyboard.h 172:34@
sDL_ResetKeyboard :: IO ()
sDL_ResetKeyboard = hs_bindgen_61b9fb1b26a3505c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetModState@
foreign import ccall unsafe "hs_bindgen_d1acc028a58a01f0"
  hs_bindgen_d1acc028a58a01f0_base
    :: IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetModState@
hs_bindgen_d1acc028a58a01f0 :: IO SDL3.Sys.Bindgen.Keycode.SDL_Keymod
hs_bindgen_d1acc028a58a01f0 =
  BG.fromFFIType hs_bindgen_d1acc028a58a01f0_base

-- | Get the current key modifier state for the keyboard.
--
--     [Returns]: an OR\'d combination of the modifier keys for the keyboard.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyboardState', 'sDL_SetModState'
--
--     [C declaration]: @SDL_GetModState@, defined at @SDL3\/SDL_keyboard.h 186:40@
sDL_GetModState :: IO SDL3.Sys.Bindgen.Keycode.SDL_Keymod
sDL_GetModState = hs_bindgen_d1acc028a58a01f0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_SetModState@
foreign import ccall unsafe "hs_bindgen_b05ffb360c052d7c"
  hs_bindgen_b05ffb360c052d7c_base
    :: BG.Word16
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_SetModState@
hs_bindgen_b05ffb360c052d7c
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -> IO ()
hs_bindgen_b05ffb360c052d7c =
  BG.fromFFIType hs_bindgen_b05ffb360c052d7c_base

-- | Set the current key modifier state for the keyboard.
--
--     The inverse of @SDL_GetModState()@, @SDL_SetModState()@ allows you to impose modifier key states on your application. Simply pass your desired modifier states into @modstate@. This value may be a bitwise, OR\'d combination of SDL_Keymod values.
--
--     This does not change the keyboard state, only the key modifier flags that SDL reports.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetModState'
--
--     [C declaration]: @SDL_SetModState@, defined at @SDL3\/SDL_keyboard.h 207:34@
sDL_SetModState
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^
  --
  --           [@modstate@]: the desired SDL_Keymod for the keyboard.
  -> IO ()
sDL_SetModState = hs_bindgen_b05ffb360c052d7c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyFromScancode@
foreign import ccall unsafe "hs_bindgen_ff76f1254f8fdac9"
  hs_bindgen_ff76f1254f8fdac9_base
    :: BG.Word32
    -> BG.Word16
    -> BG.Word8
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyFromScancode@
hs_bindgen_ff76f1254f8fdac9
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -> SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -> BG.CBool
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
hs_bindgen_ff76f1254f8fdac9 =
  BG.fromFFIType hs_bindgen_ff76f1254f8fdac9_base

-- | Get the key code corresponding to the given scancode according to the current keyboard layout.
--
--     If you want to get the keycode as it would be delivered in key events, including options specified in SDL_HINT_KEYCODE_OPTIONS, then you should pass @key_event@ as true. Otherwise this function simply translates the scancode based on the given modifier state.
--
--     [Returns]: the SDL_Keycode that corresponds to the given SDL_Scancode.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyName', 'sDL_GetScancodeFromKey'
--
--     [C declaration]: @SDL_GetKeyFromScancode@, defined at @SDL3\/SDL_keyboard.h 231:41@
sDL_GetKeyFromScancode
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^
  --
  --           [@scancode@]: the desired SDL_Scancode to query.
  -> SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^
  --
  --           [@modstate@]: the modifier state to use when translating the scancode to a keycode.
  -> BG.CBool
  -- ^
  --
  --           [@key_event@]: true if the keycode will be used in key events.
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
sDL_GetKeyFromScancode = hs_bindgen_ff76f1254f8fdac9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetScancodeFromKey@
foreign import ccall unsafe "hs_bindgen_3ca1dc40673f0b86"
  hs_bindgen_3ca1dc40673f0b86_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetScancodeFromKey@
hs_bindgen_3ca1dc40673f0b86
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -> BG.Ptr SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
hs_bindgen_3ca1dc40673f0b86 =
  BG.fromFFIType hs_bindgen_3ca1dc40673f0b86_base

-- | Get the scancode corresponding to the given key code according to the current keyboard layout.
--
--     Note that there may be multiple scancode+modifier states that can generate this keycode, this will just return the first one found.
--
--     [Returns]: the SDL_Scancode that corresponds to the given SDL_Keycode.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyFromScancode', 'sDL_GetScancodeName'
--
--     [C declaration]: @SDL_GetScancodeFromKey@, defined at @SDL3\/SDL_keyboard.h 252:42@
sDL_GetScancodeFromKey
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -- ^
  --
  --           [@key@]: the desired SDL_Keycode to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^
  --
  --           [@modstate@]: a pointer to the modifier state that would be used when the scancode generates this key, may be NULL.
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
sDL_GetScancodeFromKey = hs_bindgen_3ca1dc40673f0b86

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_SetScancodeName@
foreign import ccall unsafe "hs_bindgen_8dafd77961e1a111"
  hs_bindgen_8dafd77961e1a111_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_SetScancodeName@
hs_bindgen_8dafd77961e1a111
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_8dafd77961e1a111 =
  BG.fromFFIType hs_bindgen_8dafd77961e1a111_base

-- | Set a human-readable name for a scancode.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetScancodeName'
--
--     [C declaration]: @SDL_SetScancodeName@, defined at @SDL3\/SDL_keyboard.h 270:34@
sDL_SetScancodeName
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^
  --
  --           [@scancode@]: the desired SDL_Scancode.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name to use for the scancode, encoded as UTF-8. The string is not copied, so the pointer given to this function must stay valid while SDL is being used.
  -> IO BG.CBool
sDL_SetScancodeName = hs_bindgen_8dafd77961e1a111

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetScancodeName@
foreign import ccall unsafe "hs_bindgen_b685af9e0919d14c"
  hs_bindgen_b685af9e0919d14c_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetScancodeName@
hs_bindgen_b685af9e0919d14c
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_b685af9e0919d14c =
  BG.fromFFIType hs_bindgen_b685af9e0919d14c_base

-- | Get a human-readable name for a scancode.
--
--     __Warning__: The returned name is by design not stable across platforms, e.g. the name for @SDL_SCANCODE_LGUI@ is \"Left GUI\" under Linux but \"Left Windows\" under Microsoft Windows, and some scancodes like @SDL_SCANCODE_NONUSBACKSLASH@ don\'t have any name at all. There are even scancodes that share names, e.g. @SDL_SCANCODE_RETURN@ and @SDL_SCANCODE_RETURN2@ (both called \"Return\"). This function is therefore unsuitable for creating a stable cross-platform two-way mapping between strings and scancodes.
--
--     [Returns]: a pointer to the name for the scancode. If the scancode doesn\'t have a name this function returns an empty string (\"\").
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetScancodeFromKey', 'sDL_GetScancodeFromName', 'sDL_SetScancodeName'
--
--     [C declaration]: @SDL_GetScancodeName@, defined at @SDL3\/SDL_keyboard.h 296:42@
sDL_GetScancodeName
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^
  --
  --           [@scancode@]: the desired SDL_Scancode to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetScancodeName = hs_bindgen_b685af9e0919d14c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetScancodeFromName@
foreign import ccall unsafe "hs_bindgen_7e17fd8d9faf99b2"
  hs_bindgen_7e17fd8d9faf99b2_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetScancodeFromName@
hs_bindgen_7e17fd8d9faf99b2
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
hs_bindgen_7e17fd8d9faf99b2 =
  BG.fromFFIType hs_bindgen_7e17fd8d9faf99b2_base

-- | Get a scancode from a human-readable name.
--
--     [Returns]: the SDL_Scancode, or @SDL_SCANCODE_UNKNOWN@ if the name wasn\'t recognized; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyFromName', 'sDL_GetScancodeFromKey', 'sDL_GetScancodeName'
--
--     [C declaration]: @SDL_GetScancodeFromName@, defined at @SDL3\/SDL_keyboard.h 313:42@
sDL_GetScancodeFromName
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the human-readable scancode name.
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
sDL_GetScancodeFromName = hs_bindgen_7e17fd8d9faf99b2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyName@
foreign import ccall unsafe "hs_bindgen_bc806af89a4922a7"
  hs_bindgen_bc806af89a4922a7_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyName@
hs_bindgen_bc806af89a4922a7
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_bc806af89a4922a7 =
  BG.fromFFIType hs_bindgen_bc806af89a4922a7_base

-- | Get a human-readable name for a key.
--
--     If the key doesn\'t have a name, this function returns an empty string (\"\").
--
--     Letters will be presented in their uppercase form, if applicable.
--
--     [Returns]: a UTF-8 encoded string of the key name.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyFromName', 'sDL_GetKeyFromScancode', 'sDL_GetScancodeFromKey'
--
--     [C declaration]: @SDL_GetKeyName@, defined at @SDL3\/SDL_keyboard.h 333:42@
sDL_GetKeyName
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -- ^
  --
  --           [@key@]: the desired SDL_Keycode to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetKeyName = hs_bindgen_bc806af89a4922a7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyFromName@
foreign import ccall unsafe "hs_bindgen_427d0617876df1a1"
  hs_bindgen_427d0617876df1a1_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetKeyFromName@
hs_bindgen_427d0617876df1a1
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
hs_bindgen_427d0617876df1a1 =
  BG.fromFFIType hs_bindgen_427d0617876df1a1_base

-- | Get a key code from a human-readable name.
--
--     [Returns]: key code, or @SDLK_UNKNOWN@ if the name wasn\'t recognized; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetKeyFromScancode', 'sDL_GetKeyName', 'sDL_GetScancodeFromName'
--
--     [C declaration]: @SDL_GetKeyFromName@, defined at @SDL3\/SDL_keyboard.h 350:41@
sDL_GetKeyFromName
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the human-readable key name.
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
sDL_GetKeyFromName = hs_bindgen_427d0617876df1a1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_StartTextInput@
foreign import ccall unsafe "hs_bindgen_5a9261502fa2575b"
  hs_bindgen_5a9261502fa2575b_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_StartTextInput@
hs_bindgen_5a9261502fa2575b
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_5a9261502fa2575b =
  BG.fromFFIType hs_bindgen_5a9261502fa2575b_base

-- | Start accepting Unicode text input events in a window.
--
--     This function will enable text input (SDL_EVENT_TEXT_INPUT and SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this function paired with @SDL_StopTextInput()@.
--
--     Text input events are not received by default.
--
--     On some platforms using this function shows the screen keyboard and\/or activates an IME, which can prevent some key press events from being passed through.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetTextInputArea', 'sDL_StartTextInputWithProperties', 'sDL_StopTextInput', 'sDL_TextInputActive'
--
--     [C declaration]: @SDL_StartTextInput@, defined at @SDL3\/SDL_keyboard.h 378:34@
sDL_StartTextInput
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to enable text input.
  -> IO BG.CBool
sDL_StartTextInput = hs_bindgen_5a9261502fa2575b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_StartTextInputWithProperties@
foreign import ccall unsafe "hs_bindgen_0c7cd0ff2864a5c4"
  hs_bindgen_0c7cd0ff2864a5c4_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_StartTextInputWithProperties@
hs_bindgen_0c7cd0ff2864a5c4
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO BG.CBool
hs_bindgen_0c7cd0ff2864a5c4 =
  BG.fromFFIType hs_bindgen_0c7cd0ff2864a5c4_base

-- | Start accepting Unicode text input events in a window, with properties describing the input.
--
--     This function will enable text input (SDL_EVENT_TEXT_INPUT and SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this function paired with @SDL_StopTextInput()@.
--
--     Text input events are not received by default.
--
--     On some platforms using this function shows the screen keyboard and\/or activates an IME, which can prevent some key press events from being passed through.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_TEXTINPUT_TYPE_NUMBER'@ - an 'SDL_TextInputType' value that describes text being input, defaults to SDL_TEXTINPUT_TYPE_TEXT.
--
--     * @'sDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER'@ - an 'SDL_Capitalization' value that describes how text should be capitalized, defaults to SDL_CAPITALIZE_SENTENCES for normal text entry, SDL_CAPITALIZE_WORDS for SDL_TEXTINPUT_TYPE_TEXT_NAME, and SDL_CAPITALIZE_NONE for e-mail addresses, usernames, and passwords.
--
--     * @'sDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN'@ - true to enable auto completion and auto correction, defaults to true.
--
--     * @'sDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN'@ - true if multiple lines of text are allowed. This defaults to true if SDL_HINT_RETURN_KEY_HIDES_IME is \"0\" or is not set, and defaults to false if SDL_HINT_RETURN_KEY_HIDES_IME is \"1\".
--
--     On Android you can directly specify the input type:
--
--     * @'sDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER'@ - the text input type to use, overriding other properties. This is documented at [https:\/\/developer.android.com\/reference\/android\/text\/InputType](https://developer.android.com/reference/android/text/InputType)
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetTextInputArea', 'sDL_StartTextInput', 'sDL_StopTextInput', 'sDL_TextInputActive'
--
--     [C declaration]: @SDL_StartTextInputWithProperties@, defined at @SDL3\/SDL_keyboard.h 473:34@
sDL_StartTextInputWithProperties
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to enable text input.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO BG.CBool
sDL_StartTextInputWithProperties =
  hs_bindgen_0c7cd0ff2864a5c4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_TextInputActive@
foreign import ccall unsafe "hs_bindgen_5c76ed8d45b8c50f"
  hs_bindgen_5c76ed8d45b8c50f_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_TextInputActive@
hs_bindgen_5c76ed8d45b8c50f
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_5c76ed8d45b8c50f =
  BG.fromFFIType hs_bindgen_5c76ed8d45b8c50f_base

-- | Check whether or not Unicode text input events are enabled for a window.
--
--     [Returns]: true if text input events are enabled else false.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StartTextInput'
--
--     [C declaration]: @SDL_TextInputActive@, defined at @SDL3\/SDL_keyboard.h 493:34@
sDL_TextInputActive
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to check.
  -> IO BG.CBool
sDL_TextInputActive = hs_bindgen_5c76ed8d45b8c50f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_StopTextInput@
foreign import ccall unsafe "hs_bindgen_3ae77c9248468f14"
  hs_bindgen_3ae77c9248468f14_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_StopTextInput@
hs_bindgen_3ae77c9248468f14
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_3ae77c9248468f14 =
  BG.fromFFIType hs_bindgen_3ae77c9248468f14_base

-- | Stop receiving any text input events in a window.
--
--     If @SDL_StartTextInput()@ showed the screen keyboard, this function will hide it.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StartTextInput'
--
--     [C declaration]: @SDL_StopTextInput@, defined at @SDL3\/SDL_keyboard.h 511:34@
sDL_StopTextInput
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to disable text input.
  -> IO BG.CBool
sDL_StopTextInput = hs_bindgen_3ae77c9248468f14

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_ClearComposition@
foreign import ccall unsafe "hs_bindgen_2d81775a3f86e350"
  hs_bindgen_2d81775a3f86e350_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_ClearComposition@
hs_bindgen_2d81775a3f86e350
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_2d81775a3f86e350 =
  BG.fromFFIType hs_bindgen_2d81775a3f86e350_base

-- | Dismiss the composition window\/IME without disabling the subsystem.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StartTextInput', 'sDL_StopTextInput'
--
--     [C declaration]: @SDL_ClearComposition@, defined at @SDL3\/SDL_keyboard.h 527:34@
sDL_ClearComposition
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to affect.
  -> IO BG.CBool
sDL_ClearComposition = hs_bindgen_2d81775a3f86e350

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_SetTextInputArea@
foreign import ccall unsafe "hs_bindgen_6de1e1b47fbde959"
  hs_bindgen_6de1e1b47fbde959_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_SetTextInputArea@
hs_bindgen_6de1e1b47fbde959
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_6de1e1b47fbde959 =
  BG.fromFFIType hs_bindgen_6de1e1b47fbde959_base

-- | Set the area used to type Unicode text input.
--
--     Native input methods may place a window with word suggestions near the cursor, without covering the text being entered.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTextInputArea', 'sDL_StartTextInput'
--
--     [C declaration]: @SDL_SetTextInputArea@, defined at @SDL3\/SDL_keyboard.h 550:34@
sDL_SetTextInputArea
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window for which to set the text input area.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect representing the text input area, in window coordinates, or NULL to clear it.
  -> BG.CInt
  -- ^
  --
  --           [@cursor@]: the offset of the current cursor location relative to @rect->x@, in window coordinates.
  -> IO BG.CBool
sDL_SetTextInputArea = hs_bindgen_6de1e1b47fbde959

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetTextInputArea@
foreign import ccall unsafe "hs_bindgen_e48f604580fa9c58"
  hs_bindgen_e48f604580fa9c58_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_GetTextInputArea@
hs_bindgen_e48f604580fa9c58
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_e48f604580fa9c58 =
  BG.fromFFIType hs_bindgen_e48f604580fa9c58_base

-- | Get the area used to type Unicode text input.
--
--     This returns the values previously set by @SDL_SetTextInputArea()@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetTextInputArea'
--
--     [C declaration]: @SDL_GetTextInputArea@, defined at @SDL3\/SDL_keyboard.h 571:34@
sDL_GetTextInputArea
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window for which to query the text input area.
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: a pointer to an SDL_Rect filled in with the text input area, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@cursor@]: a pointer to the offset of the current cursor location relative to @rect->x@, may be NULL.
  -> IO BG.CBool
sDL_GetTextInputArea = hs_bindgen_e48f604580fa9c58

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_HasScreenKeyboardSupport@
foreign import ccall unsafe "hs_bindgen_94887f48a4a41d37"
  hs_bindgen_94887f48a4a41d37_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_HasScreenKeyboardSupport@
hs_bindgen_94887f48a4a41d37 :: IO BG.CBool
hs_bindgen_94887f48a4a41d37 =
  BG.fromFFIType hs_bindgen_94887f48a4a41d37_base

-- | Check whether the platform has screen keyboard support.
--
--     [Returns]: true if the platform has some screen keyboard support or false if not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StartTextInput', 'sDL_ScreenKeyboardShown'
--
--     [C declaration]: @SDL_HasScreenKeyboardSupport@, defined at @SDL3\/SDL_keyboard.h 586:34@
sDL_HasScreenKeyboardSupport :: IO BG.CBool
sDL_HasScreenKeyboardSupport =
  hs_bindgen_94887f48a4a41d37

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_ScreenKeyboardShown@
foreign import ccall unsafe "hs_bindgen_6ec8a3c2431361bd"
  hs_bindgen_6ec8a3c2431361bd_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Unsafe_SDL_ScreenKeyboardShown@
hs_bindgen_6ec8a3c2431361bd
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_6ec8a3c2431361bd =
  BG.fromFFIType hs_bindgen_6ec8a3c2431361bd_base

-- | Check whether the screen keyboard is shown for given window.
--
--     [Returns]: true if screen keyboard is shown or false if not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasScreenKeyboardSupport'
--
--     [C declaration]: @SDL_ScreenKeyboardShown@, defined at @SDL3\/SDL_keyboard.h 600:34@
sDL_ScreenKeyboardShown
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window for which screen keyboard should be queried.
  -> IO BG.CBool
sDL_ScreenKeyboardShown = hs_bindgen_6ec8a3c2431361bd
