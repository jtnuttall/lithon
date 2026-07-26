{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Keyboard.Safe (
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_HasKeyboard,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetKeyboards,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetKeyboardNameForID,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetKeyboardFocus,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetKeyboardState,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_ResetKeyboard,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetModState,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_SetModState,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetKeyFromScancode,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetScancodeFromKey,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_SetScancodeName,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetScancodeName,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetScancodeFromName,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetKeyName,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetKeyFromName,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_StartTextInput,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_StartTextInputWithProperties,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_TextInputActive,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_StopTextInput,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_ClearComposition,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_SetTextInputArea,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_GetTextInputArea,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_HasScreenKeyboardSupport,
  SDL3.Sys.Bindgen.Keyboard.Safe.sDL_ScreenKeyboardShown,
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
         , "_Bool hs_bindgen_1ef4ce9325e1d7c1 (void)"
         , "{"
         , "  return (SDL_HasKeyboard)();"
         , "}"
         , "SDL_KeyboardID *hs_bindgen_b59c0860157b89a3 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyboards)(arg1);"
         , "}"
         , "char const *hs_bindgen_cbd6c7684c35aab5 ("
         , "  SDL_KeyboardID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyboardNameForID)(arg1);"
         , "}"
         , "SDL_Window *hs_bindgen_4466a0bcf920ec34 (void)"
         , "{"
         , "  return (SDL_GetKeyboardFocus)();"
         , "}"
         , "_Bool const *hs_bindgen_28f41d367bc840d8 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyboardState)(arg1);"
         , "}"
         , "void hs_bindgen_e5be3af904377165 (void)"
         , "{"
         , "  (SDL_ResetKeyboard)();"
         , "}"
         , "SDL_Keymod hs_bindgen_2b74759b43835352 (void)"
         , "{"
         , "  return (SDL_GetModState)();"
         , "}"
         , "void hs_bindgen_12c8d03624bdd31a ("
         , "  SDL_Keymod arg1"
         , ")"
         , "{"
         , "  (SDL_SetModState)(arg1);"
         , "}"
         , "SDL_Keycode hs_bindgen_2ed37c1ae220bcdc ("
         , "  SDL_Scancode arg1,"
         , "  SDL_Keymod arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_GetKeyFromScancode)(arg1, arg2, arg3);"
         , "}"
         , "SDL_Scancode hs_bindgen_fc2da5865c26d1eb ("
         , "  SDL_Keycode arg1,"
         , "  SDL_Keymod *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetScancodeFromKey)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_d3d1490d83b9909e ("
         , "  SDL_Scancode arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetScancodeName)(arg1, arg2);"
         , "}"
         , "char const *hs_bindgen_7fa9ebec253c00ba ("
         , "  SDL_Scancode arg1"
         , ")"
         , "{"
         , "  return (SDL_GetScancodeName)(arg1);"
         , "}"
         , "SDL_Scancode hs_bindgen_93b32ce48be9ecca ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetScancodeFromName)(arg1);"
         , "}"
         , "char const *hs_bindgen_1808b5592239c8c9 ("
         , "  SDL_Keycode arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyName)(arg1);"
         , "}"
         , "SDL_Keycode hs_bindgen_cc4e614de70c9201 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetKeyFromName)(arg1);"
         , "}"
         , "_Bool hs_bindgen_ee1b6ad2d89317cd ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_StartTextInput)(arg1);"
         , "}"
         , "_Bool hs_bindgen_9f9c608b064a8e66 ("
         , "  SDL_Window *arg1,"
         , "  SDL_PropertiesID arg2"
         , ")"
         , "{"
         , "  return (SDL_StartTextInputWithProperties)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_459a3903a479c503 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_TextInputActive)(arg1);"
         , "}"
         , "_Bool hs_bindgen_2b5c6adc62fd6b03 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_StopTextInput)(arg1);"
         , "}"
         , "_Bool hs_bindgen_6b1d107b71fa60e9 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_ClearComposition)(arg1);"
         , "}"
         , "_Bool hs_bindgen_03f0bc714d10f56b ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetTextInputArea)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_20c88b6d3256a2c4 ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetTextInputArea)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_052de17a6a7b51b1 (void)"
         , "{"
         , "  return (SDL_HasScreenKeyboardSupport)();"
         , "}"
         , "_Bool hs_bindgen_166e1a8b6522af56 ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return (SDL_ScreenKeyboardShown)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_HasKeyboard@
foreign import ccall safe "hs_bindgen_1ef4ce9325e1d7c1"
  hs_bindgen_1ef4ce9325e1d7c1_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_HasKeyboard@
hs_bindgen_1ef4ce9325e1d7c1 :: IO BG.CBool
hs_bindgen_1ef4ce9325e1d7c1 =
  BG.fromFFIType hs_bindgen_1ef4ce9325e1d7c1_base

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
sDL_HasKeyboard = hs_bindgen_1ef4ce9325e1d7c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyboards@
foreign import ccall safe "hs_bindgen_b59c0860157b89a3"
  hs_bindgen_b59c0860157b89a3_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyboards@
hs_bindgen_b59c0860157b89a3
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_KeyboardID)
hs_bindgen_b59c0860157b89a3 =
  BG.fromFFIType hs_bindgen_b59c0860157b89a3_base

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
sDL_GetKeyboards = hs_bindgen_b59c0860157b89a3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyboardNameForID@
foreign import ccall safe "hs_bindgen_cbd6c7684c35aab5"
  hs_bindgen_cbd6c7684c35aab5_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyboardNameForID@
hs_bindgen_cbd6c7684c35aab5
  :: SDL_KeyboardID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_cbd6c7684c35aab5 =
  BG.fromFFIType hs_bindgen_cbd6c7684c35aab5_base

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
  hs_bindgen_cbd6c7684c35aab5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyboardFocus@
foreign import ccall safe "hs_bindgen_4466a0bcf920ec34"
  hs_bindgen_4466a0bcf920ec34_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyboardFocus@
hs_bindgen_4466a0bcf920ec34 :: IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
hs_bindgen_4466a0bcf920ec34 =
  BG.fromFFIType hs_bindgen_4466a0bcf920ec34_base

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
sDL_GetKeyboardFocus = hs_bindgen_4466a0bcf920ec34

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyboardState@
foreign import ccall safe "hs_bindgen_28f41d367bc840d8"
  hs_bindgen_28f41d367bc840d8_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyboardState@
hs_bindgen_28f41d367bc840d8
  :: BG.Ptr BG.CInt
  -> IO (PtrConst.PtrConst BG.CBool)
hs_bindgen_28f41d367bc840d8 =
  BG.fromFFIType hs_bindgen_28f41d367bc840d8_base

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
sDL_GetKeyboardState = hs_bindgen_28f41d367bc840d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_ResetKeyboard@
foreign import ccall safe "hs_bindgen_e5be3af904377165"
  hs_bindgen_e5be3af904377165_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_ResetKeyboard@
hs_bindgen_e5be3af904377165 :: IO ()
hs_bindgen_e5be3af904377165 =
  BG.fromFFIType hs_bindgen_e5be3af904377165_base

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
sDL_ResetKeyboard = hs_bindgen_e5be3af904377165

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetModState@
foreign import ccall safe "hs_bindgen_2b74759b43835352"
  hs_bindgen_2b74759b43835352_base
    :: IO BG.Word16

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetModState@
hs_bindgen_2b74759b43835352 :: IO SDL3.Sys.Bindgen.Keycode.SDL_Keymod
hs_bindgen_2b74759b43835352 =
  BG.fromFFIType hs_bindgen_2b74759b43835352_base

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
sDL_GetModState = hs_bindgen_2b74759b43835352

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_SetModState@
foreign import ccall safe "hs_bindgen_12c8d03624bdd31a"
  hs_bindgen_12c8d03624bdd31a_base
    :: BG.Word16
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_SetModState@
hs_bindgen_12c8d03624bdd31a
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -> IO ()
hs_bindgen_12c8d03624bdd31a =
  BG.fromFFIType hs_bindgen_12c8d03624bdd31a_base

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
sDL_SetModState = hs_bindgen_12c8d03624bdd31a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyFromScancode@
foreign import ccall safe "hs_bindgen_2ed37c1ae220bcdc"
  hs_bindgen_2ed37c1ae220bcdc_base
    :: BG.Word32
    -> BG.Word16
    -> BG.Word8
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyFromScancode@
hs_bindgen_2ed37c1ae220bcdc
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -> SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -> BG.CBool
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
hs_bindgen_2ed37c1ae220bcdc =
  BG.fromFFIType hs_bindgen_2ed37c1ae220bcdc_base

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
sDL_GetKeyFromScancode = hs_bindgen_2ed37c1ae220bcdc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetScancodeFromKey@
foreign import ccall safe "hs_bindgen_fc2da5865c26d1eb"
  hs_bindgen_fc2da5865c26d1eb_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetScancodeFromKey@
hs_bindgen_fc2da5865c26d1eb
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -> BG.Ptr SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
hs_bindgen_fc2da5865c26d1eb =
  BG.fromFFIType hs_bindgen_fc2da5865c26d1eb_base

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
sDL_GetScancodeFromKey = hs_bindgen_fc2da5865c26d1eb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_SetScancodeName@
foreign import ccall safe "hs_bindgen_d3d1490d83b9909e"
  hs_bindgen_d3d1490d83b9909e_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_SetScancodeName@
hs_bindgen_d3d1490d83b9909e
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_d3d1490d83b9909e =
  BG.fromFFIType hs_bindgen_d3d1490d83b9909e_base

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
sDL_SetScancodeName = hs_bindgen_d3d1490d83b9909e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetScancodeName@
foreign import ccall safe "hs_bindgen_7fa9ebec253c00ba"
  hs_bindgen_7fa9ebec253c00ba_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetScancodeName@
hs_bindgen_7fa9ebec253c00ba
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_7fa9ebec253c00ba =
  BG.fromFFIType hs_bindgen_7fa9ebec253c00ba_base

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
sDL_GetScancodeName = hs_bindgen_7fa9ebec253c00ba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetScancodeFromName@
foreign import ccall safe "hs_bindgen_93b32ce48be9ecca"
  hs_bindgen_93b32ce48be9ecca_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetScancodeFromName@
hs_bindgen_93b32ce48be9ecca
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
hs_bindgen_93b32ce48be9ecca =
  BG.fromFFIType hs_bindgen_93b32ce48be9ecca_base

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
sDL_GetScancodeFromName = hs_bindgen_93b32ce48be9ecca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyName@
foreign import ccall safe "hs_bindgen_1808b5592239c8c9"
  hs_bindgen_1808b5592239c8c9_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyName@
hs_bindgen_1808b5592239c8c9
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_1808b5592239c8c9 =
  BG.fromFFIType hs_bindgen_1808b5592239c8c9_base

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
sDL_GetKeyName = hs_bindgen_1808b5592239c8c9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyFromName@
foreign import ccall safe "hs_bindgen_cc4e614de70c9201"
  hs_bindgen_cc4e614de70c9201_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetKeyFromName@
hs_bindgen_cc4e614de70c9201
  :: PtrConst.PtrConst BG.CChar
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
hs_bindgen_cc4e614de70c9201 =
  BG.fromFFIType hs_bindgen_cc4e614de70c9201_base

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
sDL_GetKeyFromName = hs_bindgen_cc4e614de70c9201

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_StartTextInput@
foreign import ccall safe "hs_bindgen_ee1b6ad2d89317cd"
  hs_bindgen_ee1b6ad2d89317cd_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_StartTextInput@
hs_bindgen_ee1b6ad2d89317cd
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_ee1b6ad2d89317cd =
  BG.fromFFIType hs_bindgen_ee1b6ad2d89317cd_base

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
sDL_StartTextInput = hs_bindgen_ee1b6ad2d89317cd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_StartTextInputWithProperties@
foreign import ccall safe "hs_bindgen_9f9c608b064a8e66"
  hs_bindgen_9f9c608b064a8e66_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_StartTextInputWithProperties@
hs_bindgen_9f9c608b064a8e66
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO BG.CBool
hs_bindgen_9f9c608b064a8e66 =
  BG.fromFFIType hs_bindgen_9f9c608b064a8e66_base

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
  hs_bindgen_9f9c608b064a8e66

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_TextInputActive@
foreign import ccall safe "hs_bindgen_459a3903a479c503"
  hs_bindgen_459a3903a479c503_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_TextInputActive@
hs_bindgen_459a3903a479c503
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_459a3903a479c503 =
  BG.fromFFIType hs_bindgen_459a3903a479c503_base

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
sDL_TextInputActive = hs_bindgen_459a3903a479c503

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_StopTextInput@
foreign import ccall safe "hs_bindgen_2b5c6adc62fd6b03"
  hs_bindgen_2b5c6adc62fd6b03_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_StopTextInput@
hs_bindgen_2b5c6adc62fd6b03
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_2b5c6adc62fd6b03 =
  BG.fromFFIType hs_bindgen_2b5c6adc62fd6b03_base

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
sDL_StopTextInput = hs_bindgen_2b5c6adc62fd6b03

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_ClearComposition@
foreign import ccall safe "hs_bindgen_6b1d107b71fa60e9"
  hs_bindgen_6b1d107b71fa60e9_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_ClearComposition@
hs_bindgen_6b1d107b71fa60e9
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_6b1d107b71fa60e9 =
  BG.fromFFIType hs_bindgen_6b1d107b71fa60e9_base

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
sDL_ClearComposition = hs_bindgen_6b1d107b71fa60e9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_SetTextInputArea@
foreign import ccall safe "hs_bindgen_03f0bc714d10f56b"
  hs_bindgen_03f0bc714d10f56b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_SetTextInputArea@
hs_bindgen_03f0bc714d10f56b
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_03f0bc714d10f56b =
  BG.fromFFIType hs_bindgen_03f0bc714d10f56b_base

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
sDL_SetTextInputArea = hs_bindgen_03f0bc714d10f56b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetTextInputArea@
foreign import ccall safe "hs_bindgen_20c88b6d3256a2c4"
  hs_bindgen_20c88b6d3256a2c4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_GetTextInputArea@
hs_bindgen_20c88b6d3256a2c4
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_20c88b6d3256a2c4 =
  BG.fromFFIType hs_bindgen_20c88b6d3256a2c4_base

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
sDL_GetTextInputArea = hs_bindgen_20c88b6d3256a2c4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_HasScreenKeyboardSupport@
foreign import ccall safe "hs_bindgen_052de17a6a7b51b1"
  hs_bindgen_052de17a6a7b51b1_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_HasScreenKeyboardSupport@
hs_bindgen_052de17a6a7b51b1 :: IO BG.CBool
hs_bindgen_052de17a6a7b51b1 =
  BG.fromFFIType hs_bindgen_052de17a6a7b51b1_base

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
  hs_bindgen_052de17a6a7b51b1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_ScreenKeyboardShown@
foreign import ccall safe "hs_bindgen_166e1a8b6522af56"
  hs_bindgen_166e1a8b6522af56_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_Safe_SDL_ScreenKeyboardShown@
hs_bindgen_166e1a8b6522af56
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> IO BG.CBool
hs_bindgen_166e1a8b6522af56 =
  BG.fromFFIType hs_bindgen_166e1a8b6522af56_base

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
sDL_ScreenKeyboardShown = hs_bindgen_166e1a8b6522af56
