{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Keyboard.FunPtr (
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_HasKeyboard,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetKeyboards,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetKeyboardNameForID,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetKeyboardFocus,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetKeyboardState,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_ResetKeyboard,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetModState,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_SetModState,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetKeyFromScancode,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetScancodeFromKey,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_SetScancodeName,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetScancodeName,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetScancodeFromName,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetKeyName,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetKeyFromName,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_StartTextInput,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_StartTextInputWithProperties,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_TextInputActive,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_StopTextInput,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_ClearComposition,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_SetTextInputArea,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_GetTextInputArea,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_HasScreenKeyboardSupport,
  SDL3.Sys.Bindgen.Keyboard.FunPtr.sDL_ScreenKeyboardShown,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_HasKeyboard */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f2d4cba2f0ac16c1 (void)) (void)"
         , "{"
         , "  return &SDL_HasKeyboard;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboards */"
         , "__attribute__ ((const))"
         , "SDL_KeyboardID *(*hs_bindgen_07570de4c113f860 (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetKeyboards;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboardNameForID */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_83b903949cfcfe63 (void)) ("
         , "  SDL_KeyboardID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetKeyboardNameForID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboardFocus */"
         , "__attribute__ ((const))"
         , "SDL_Window *(*hs_bindgen_8df2b4d534724c71 (void)) (void)"
         , "{"
         , "  return &SDL_GetKeyboardFocus;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboardState */"
         , "__attribute__ ((const))"
         , "_Bool const *(*hs_bindgen_d62d5a74819a4670 (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetKeyboardState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_ResetKeyboard */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d91e3b4a0a33939a (void)) (void)"
         , "{"
         , "  return &SDL_ResetKeyboard;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetModState */"
         , "__attribute__ ((const))"
         , "SDL_Keymod (*hs_bindgen_cc0f02de8bc450f1 (void)) (void)"
         , "{"
         , "  return &SDL_GetModState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_SetModState */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_6bbf695b3fa0e177 (void)) ("
         , "  SDL_Keymod arg1"
         , ")"
         , "{"
         , "  return &SDL_SetModState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyFromScancode */"
         , "__attribute__ ((const))"
         , "SDL_Keycode (*hs_bindgen_c9f6615acff7b796 (void)) ("
         , "  SDL_Scancode arg1,"
         , "  SDL_Keymod arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_GetKeyFromScancode;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetScancodeFromKey */"
         , "__attribute__ ((const))"
         , "SDL_Scancode (*hs_bindgen_435c07f787a65684 (void)) ("
         , "  SDL_Keycode arg1,"
         , "  SDL_Keymod *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetScancodeFromKey;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_SetScancodeName */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_087c95eefbd6f76f (void)) ("
         , "  SDL_Scancode arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetScancodeName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetScancodeName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_8a2bf360adc31889 (void)) ("
         , "  SDL_Scancode arg1"
         , ")"
         , "{"
         , "  return &SDL_GetScancodeName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetScancodeFromName */"
         , "__attribute__ ((const))"
         , "SDL_Scancode (*hs_bindgen_b93acbb95d9d0d72 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetScancodeFromName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_f93a8976e79ac924 (void)) ("
         , "  SDL_Keycode arg1"
         , ")"
         , "{"
         , "  return &SDL_GetKeyName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyFromName */"
         , "__attribute__ ((const))"
         , "SDL_Keycode (*hs_bindgen_b72924cf51764a24 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetKeyFromName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_StartTextInput */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4b6d937c5c094fac (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_StartTextInput;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_StartTextInputWithProperties */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_cef63a814fd09fce (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_PropertiesID arg2"
         , ")"
         , "{"
         , "  return &SDL_StartTextInputWithProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_TextInputActive */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1f67969c2fa5317a (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_TextInputActive;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_StopTextInput */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9b542f1ba0dfe34d (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_StopTextInput;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_ClearComposition */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_60c12ad8dda93779 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_ClearComposition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_SetTextInputArea */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a46b72607b603a3c (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_SetTextInputArea;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetTextInputArea */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b5c6f5df66854547 (void)) ("
         , "  SDL_Window *arg1,"
         , "  SDL_Rect *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetTextInputArea;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_HasScreenKeyboardSupport */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e8fffc349e61bb9c (void)) (void)"
         , "{"
         , "  return &SDL_HasScreenKeyboardSupport;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_ScreenKeyboardShown */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f094fa8f75a49f31 (void)) ("
         , "  SDL_Window *arg1"
         , ")"
         , "{"
         , "  return &SDL_ScreenKeyboardShown;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_HasKeyboard@
foreign import ccall unsafe "hs_bindgen_f2d4cba2f0ac16c1"
  hs_bindgen_f2d4cba2f0ac16c1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_HasKeyboard@
hs_bindgen_f2d4cba2f0ac16c1 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_f2d4cba2f0ac16c1 =
  BG.fromFFIType hs_bindgen_f2d4cba2f0ac16c1_base

{-# NOINLINE sDL_HasKeyboard #-}

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
sDL_HasKeyboard :: BG.FunPtr (IO BG.CBool)
sDL_HasKeyboard =
  BG.unsafePerformIO hs_bindgen_f2d4cba2f0ac16c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboards@
foreign import ccall unsafe "hs_bindgen_07570de4c113f860"
  hs_bindgen_07570de4c113f860_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboards@
hs_bindgen_07570de4c113f860 :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_KeyboardID)))
hs_bindgen_07570de4c113f860 =
  BG.fromFFIType hs_bindgen_07570de4c113f860_base

{-# NOINLINE sDL_GetKeyboards #-}

-- | Get a list of currently connected keyboards.
--
--     Note that this will include any device or virtual driver that includes keyboard functionality, including some mice, KVM switches, motherboard power buttons, etc. You should wait for input from a device before you consider it actively in use.
--
--     [@count@]: a pointer filled in with the number of keyboards returned, may be NULL.
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
sDL_GetKeyboards :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_KeyboardID))
sDL_GetKeyboards =
  BG.unsafePerformIO hs_bindgen_07570de4c113f860

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboardNameForID@
foreign import ccall unsafe "hs_bindgen_83b903949cfcfe63"
  hs_bindgen_83b903949cfcfe63_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboardNameForID@
hs_bindgen_83b903949cfcfe63 :: IO (BG.FunPtr (SDL_KeyboardID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_83b903949cfcfe63 =
  BG.fromFFIType hs_bindgen_83b903949cfcfe63_base

{-# NOINLINE sDL_GetKeyboardNameForID #-}

-- | Get the name of a keyboard.
--
--     This function returns \"\" if the keyboard doesn\'t have a name.
--
--     [@instance_id@]: the keyboard instance ID.
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
sDL_GetKeyboardNameForID :: BG.FunPtr (SDL_KeyboardID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetKeyboardNameForID =
  BG.unsafePerformIO hs_bindgen_83b903949cfcfe63

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboardFocus@
foreign import ccall unsafe "hs_bindgen_8df2b4d534724c71"
  hs_bindgen_8df2b4d534724c71_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboardFocus@
hs_bindgen_8df2b4d534724c71 :: IO (BG.FunPtr (IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)))
hs_bindgen_8df2b4d534724c71 =
  BG.fromFFIType hs_bindgen_8df2b4d534724c71_base

{-# NOINLINE sDL_GetKeyboardFocus #-}

-- | Query the window which currently has keyboard focus.
--
--     [Returns]: the window with keyboard focus.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetKeyboardFocus@, defined at @SDL3\/SDL_keyboard.h 126:42@
sDL_GetKeyboardFocus :: BG.FunPtr (IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window))
sDL_GetKeyboardFocus =
  BG.unsafePerformIO hs_bindgen_8df2b4d534724c71

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboardState@
foreign import ccall unsafe "hs_bindgen_d62d5a74819a4670"
  hs_bindgen_d62d5a74819a4670_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyboardState@
hs_bindgen_d62d5a74819a4670 :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (PtrConst.PtrConst BG.CBool)))
hs_bindgen_d62d5a74819a4670 =
  BG.fromFFIType hs_bindgen_d62d5a74819a4670_base

{-# NOINLINE sDL_GetKeyboardState #-}

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
--     [@numkeys@]: if non-NULL, receives the length of the returned array.
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
sDL_GetKeyboardState :: BG.FunPtr (BG.Ptr BG.CInt -> IO (PtrConst.PtrConst BG.CBool))
sDL_GetKeyboardState =
  BG.unsafePerformIO hs_bindgen_d62d5a74819a4670

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_ResetKeyboard@
foreign import ccall unsafe "hs_bindgen_d91e3b4a0a33939a"
  hs_bindgen_d91e3b4a0a33939a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_ResetKeyboard@
hs_bindgen_d91e3b4a0a33939a :: IO (BG.FunPtr (IO ()))
hs_bindgen_d91e3b4a0a33939a =
  BG.fromFFIType hs_bindgen_d91e3b4a0a33939a_base

{-# NOINLINE sDL_ResetKeyboard #-}

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
sDL_ResetKeyboard :: BG.FunPtr (IO ())
sDL_ResetKeyboard =
  BG.unsafePerformIO hs_bindgen_d91e3b4a0a33939a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetModState@
foreign import ccall unsafe "hs_bindgen_cc0f02de8bc450f1"
  hs_bindgen_cc0f02de8bc450f1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetModState@
hs_bindgen_cc0f02de8bc450f1 :: IO (BG.FunPtr (IO SDL3.Sys.Bindgen.Keycode.SDL_Keymod))
hs_bindgen_cc0f02de8bc450f1 =
  BG.fromFFIType hs_bindgen_cc0f02de8bc450f1_base

{-# NOINLINE sDL_GetModState #-}

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
sDL_GetModState :: BG.FunPtr (IO SDL3.Sys.Bindgen.Keycode.SDL_Keymod)
sDL_GetModState =
  BG.unsafePerformIO hs_bindgen_cc0f02de8bc450f1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_SetModState@
foreign import ccall unsafe "hs_bindgen_6bbf695b3fa0e177"
  hs_bindgen_6bbf695b3fa0e177_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_SetModState@
hs_bindgen_6bbf695b3fa0e177 :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Keycode.SDL_Keymod -> IO ()))
hs_bindgen_6bbf695b3fa0e177 =
  BG.fromFFIType hs_bindgen_6bbf695b3fa0e177_base

{-# NOINLINE sDL_SetModState #-}

-- | Set the current key modifier state for the keyboard.
--
--     The inverse of @SDL_GetModState()@, @SDL_SetModState()@ allows you to impose modifier key states on your application. Simply pass your desired modifier states into @modstate@. This value may be a bitwise, OR\'d combination of SDL_Keymod values.
--
--     This does not change the keyboard state, only the key modifier flags that SDL reports.
--
--     [@modstate@]: the desired SDL_Keymod for the keyboard.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetModState'
--
--     [C declaration]: @SDL_SetModState@, defined at @SDL3\/SDL_keyboard.h 207:34@
sDL_SetModState :: BG.FunPtr (SDL3.Sys.Bindgen.Keycode.SDL_Keymod -> IO ())
sDL_SetModState =
  BG.unsafePerformIO hs_bindgen_6bbf695b3fa0e177

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyFromScancode@
foreign import ccall unsafe "hs_bindgen_c9f6615acff7b796"
  hs_bindgen_c9f6615acff7b796_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyFromScancode@
hs_bindgen_c9f6615acff7b796
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Scancode.SDL_Scancode
             -> SDL3.Sys.Bindgen.Keycode.SDL_Keymod
             -> BG.CBool
             -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
           )
       )
hs_bindgen_c9f6615acff7b796 =
  BG.fromFFIType hs_bindgen_c9f6615acff7b796_base

{-# NOINLINE sDL_GetKeyFromScancode #-}

-- | Get the key code corresponding to the given scancode according to the current keyboard layout.
--
--     If you want to get the keycode as it would be delivered in key events, including options specified in SDL_HINT_KEYCODE_OPTIONS, then you should pass @key_event@ as true. Otherwise this function simply translates the scancode based on the given modifier state.
--
--     [@scancode@]: the desired SDL_Scancode to query.
--
--     [@modstate@]: the modifier state to use when translating the scancode to a keycode.
--
--     [@key_event@]: true if the keycode will be used in key events.
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
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Scancode.SDL_Scancode
         -> SDL3.Sys.Bindgen.Keycode.SDL_Keymod
         -> BG.CBool
         -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
       )
sDL_GetKeyFromScancode =
  BG.unsafePerformIO hs_bindgen_c9f6615acff7b796

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetScancodeFromKey@
foreign import ccall unsafe "hs_bindgen_435c07f787a65684"
  hs_bindgen_435c07f787a65684_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetScancodeFromKey@
hs_bindgen_435c07f787a65684
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Keycode.SDL_Keycode
             -> BG.Ptr SDL3.Sys.Bindgen.Keycode.SDL_Keymod
             -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
           )
       )
hs_bindgen_435c07f787a65684 =
  BG.fromFFIType hs_bindgen_435c07f787a65684_base

{-# NOINLINE sDL_GetScancodeFromKey #-}

-- | Get the scancode corresponding to the given key code according to the current keyboard layout.
--
--     Note that there may be multiple scancode+modifier states that can generate this keycode, this will just return the first one found.
--
--     [@key@]: the desired SDL_Keycode to query.
--
--     [@modstate@]: a pointer to the modifier state that would be used when the scancode generates this key, may be NULL.
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
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Keycode.SDL_Keycode
         -> BG.Ptr SDL3.Sys.Bindgen.Keycode.SDL_Keymod
         -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
       )
sDL_GetScancodeFromKey =
  BG.unsafePerformIO hs_bindgen_435c07f787a65684

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_SetScancodeName@
foreign import ccall unsafe "hs_bindgen_087c95eefbd6f76f"
  hs_bindgen_087c95eefbd6f76f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_SetScancodeName@
hs_bindgen_087c95eefbd6f76f
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Scancode.SDL_Scancode -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_087c95eefbd6f76f =
  BG.fromFFIType hs_bindgen_087c95eefbd6f76f_base

{-# NOINLINE sDL_SetScancodeName #-}

-- | Set a human-readable name for a scancode.
--
--     [@scancode@]: the desired SDL_Scancode.
--
--     [@name@]: the name to use for the scancode, encoded as UTF-8. The string is not copied, so the pointer given to this function must stay valid while SDL is being used.
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
  :: BG.FunPtr (SDL3.Sys.Bindgen.Scancode.SDL_Scancode -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SetScancodeName =
  BG.unsafePerformIO hs_bindgen_087c95eefbd6f76f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetScancodeName@
foreign import ccall unsafe "hs_bindgen_8a2bf360adc31889"
  hs_bindgen_8a2bf360adc31889_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetScancodeName@
hs_bindgen_8a2bf360adc31889
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Scancode.SDL_Scancode -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_8a2bf360adc31889 =
  BG.fromFFIType hs_bindgen_8a2bf360adc31889_base

{-# NOINLINE sDL_GetScancodeName #-}

-- | Get a human-readable name for a scancode.
--
--     __Warning__: The returned name is by design not stable across platforms, e.g. the name for @SDL_SCANCODE_LGUI@ is \"Left GUI\" under Linux but \"Left Windows\" under Microsoft Windows, and some scancodes like @SDL_SCANCODE_NONUSBACKSLASH@ don\'t have any name at all. There are even scancodes that share names, e.g. @SDL_SCANCODE_RETURN@ and @SDL_SCANCODE_RETURN2@ (both called \"Return\"). This function is therefore unsuitable for creating a stable cross-platform two-way mapping between strings and scancodes.
--
--     [@scancode@]: the desired SDL_Scancode to query.
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
  :: BG.FunPtr (SDL3.Sys.Bindgen.Scancode.SDL_Scancode -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetScancodeName =
  BG.unsafePerformIO hs_bindgen_8a2bf360adc31889

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetScancodeFromName@
foreign import ccall unsafe "hs_bindgen_b93acbb95d9d0d72"
  hs_bindgen_b93acbb95d9d0d72_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetScancodeFromName@
hs_bindgen_b93acbb95d9d0d72
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode))
hs_bindgen_b93acbb95d9d0d72 =
  BG.fromFFIType hs_bindgen_b93acbb95d9d0d72_base

{-# NOINLINE sDL_GetScancodeFromName #-}

-- | Get a scancode from a human-readable name.
--
--     [@name@]: the human-readable scancode name.
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
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode)
sDL_GetScancodeFromName =
  BG.unsafePerformIO hs_bindgen_b93acbb95d9d0d72

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyName@
foreign import ccall unsafe "hs_bindgen_f93a8976e79ac924"
  hs_bindgen_f93a8976e79ac924_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyName@
hs_bindgen_f93a8976e79ac924
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Keycode.SDL_Keycode -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_f93a8976e79ac924 =
  BG.fromFFIType hs_bindgen_f93a8976e79ac924_base

{-# NOINLINE sDL_GetKeyName #-}

-- | Get a human-readable name for a key.
--
--     If the key doesn\'t have a name, this function returns an empty string (\"\").
--
--     Letters will be presented in their uppercase form, if applicable.
--
--     [@key@]: the desired SDL_Keycode to query.
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
  :: BG.FunPtr (SDL3.Sys.Bindgen.Keycode.SDL_Keycode -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetKeyName =
  BG.unsafePerformIO hs_bindgen_f93a8976e79ac924

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyFromName@
foreign import ccall unsafe "hs_bindgen_b72924cf51764a24"
  hs_bindgen_b72924cf51764a24_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetKeyFromName@
hs_bindgen_b72924cf51764a24
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode))
hs_bindgen_b72924cf51764a24 =
  BG.fromFFIType hs_bindgen_b72924cf51764a24_base

{-# NOINLINE sDL_GetKeyFromName #-}

-- | Get a key code from a human-readable name.
--
--     [@name@]: the human-readable key name.
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
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode)
sDL_GetKeyFromName =
  BG.unsafePerformIO hs_bindgen_b72924cf51764a24

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_StartTextInput@
foreign import ccall unsafe "hs_bindgen_4b6d937c5c094fac"
  hs_bindgen_4b6d937c5c094fac_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_StartTextInput@
hs_bindgen_4b6d937c5c094fac
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool))
hs_bindgen_4b6d937c5c094fac =
  BG.fromFFIType hs_bindgen_4b6d937c5c094fac_base

{-# NOINLINE sDL_StartTextInput #-}

-- | Start accepting Unicode text input events in a window.
--
--     This function will enable text input (SDL_EVENT_TEXT_INPUT and SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this function paired with @SDL_StopTextInput()@.
--
--     Text input events are not received by default.
--
--     On some platforms using this function shows the screen keyboard and\/or activates an IME, which can prevent some key press events from being passed through.
--
--     [@window@]: the window to enable text input.
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
sDL_StartTextInput :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool)
sDL_StartTextInput =
  BG.unsafePerformIO hs_bindgen_4b6d937c5c094fac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_StartTextInputWithProperties@
foreign import ccall unsafe "hs_bindgen_cef63a814fd09fce"
  hs_bindgen_cef63a814fd09fce_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_StartTextInputWithProperties@
hs_bindgen_cef63a814fd09fce
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
             -> IO BG.CBool
           )
       )
hs_bindgen_cef63a814fd09fce =
  BG.fromFFIType hs_bindgen_cef63a814fd09fce_base

{-# NOINLINE sDL_StartTextInputWithProperties #-}

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
--     [@window@]: the window to enable text input.
--
--     [@props@]: the properties to use.
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
  :: BG.FunPtr
       ( BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
         -> IO BG.CBool
       )
sDL_StartTextInputWithProperties =
  BG.unsafePerformIO hs_bindgen_cef63a814fd09fce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_TextInputActive@
foreign import ccall unsafe "hs_bindgen_1f67969c2fa5317a"
  hs_bindgen_1f67969c2fa5317a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_TextInputActive@
hs_bindgen_1f67969c2fa5317a
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool))
hs_bindgen_1f67969c2fa5317a =
  BG.fromFFIType hs_bindgen_1f67969c2fa5317a_base

{-# NOINLINE sDL_TextInputActive #-}

-- | Check whether or not Unicode text input events are enabled for a window.
--
--     [@window@]: the window to check.
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
sDL_TextInputActive :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool)
sDL_TextInputActive =
  BG.unsafePerformIO hs_bindgen_1f67969c2fa5317a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_StopTextInput@
foreign import ccall unsafe "hs_bindgen_9b542f1ba0dfe34d"
  hs_bindgen_9b542f1ba0dfe34d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_StopTextInput@
hs_bindgen_9b542f1ba0dfe34d
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool))
hs_bindgen_9b542f1ba0dfe34d =
  BG.fromFFIType hs_bindgen_9b542f1ba0dfe34d_base

{-# NOINLINE sDL_StopTextInput #-}

-- | Stop receiving any text input events in a window.
--
--     If @SDL_StartTextInput()@ showed the screen keyboard, this function will hide it.
--
--     [@window@]: the window to disable text input.
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
sDL_StopTextInput :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool)
sDL_StopTextInput =
  BG.unsafePerformIO hs_bindgen_9b542f1ba0dfe34d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_ClearComposition@
foreign import ccall unsafe "hs_bindgen_60c12ad8dda93779"
  hs_bindgen_60c12ad8dda93779_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_ClearComposition@
hs_bindgen_60c12ad8dda93779
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool))
hs_bindgen_60c12ad8dda93779 =
  BG.fromFFIType hs_bindgen_60c12ad8dda93779_base

{-# NOINLINE sDL_ClearComposition #-}

-- | Dismiss the composition window\/IME without disabling the subsystem.
--
--     [@window@]: the window to affect.
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
sDL_ClearComposition :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool)
sDL_ClearComposition =
  BG.unsafePerformIO hs_bindgen_60c12ad8dda93779

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_SetTextInputArea@
foreign import ccall unsafe "hs_bindgen_a46b72607b603a3c"
  hs_bindgen_a46b72607b603a3c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_SetTextInputArea@
hs_bindgen_a46b72607b603a3c
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_a46b72607b603a3c =
  BG.fromFFIType hs_bindgen_a46b72607b603a3c_base

{-# NOINLINE sDL_SetTextInputArea #-}

-- | Set the area used to type Unicode text input.
--
--     Native input methods may place a window with word suggestions near the cursor, without covering the text being entered.
--
--     [@window@]: the window for which to set the text input area.
--
--     [@rect@]: the SDL_Rect representing the text input area, in window coordinates, or NULL to clear it.
--
--     [@cursor@]: the offset of the current cursor location relative to @rect->x@, in window coordinates.
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
  :: BG.FunPtr
       ( BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.CInt
         -> IO BG.CBool
       )
sDL_SetTextInputArea =
  BG.unsafePerformIO hs_bindgen_a46b72607b603a3c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetTextInputArea@
foreign import ccall unsafe "hs_bindgen_b5c6f5df66854547"
  hs_bindgen_b5c6f5df66854547_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_GetTextInputArea@
hs_bindgen_b5c6f5df66854547
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
             -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
             -> BG.Ptr BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_b5c6f5df66854547 =
  BG.fromFFIType hs_bindgen_b5c6f5df66854547_base

{-# NOINLINE sDL_GetTextInputArea #-}

-- | Get the area used to type Unicode text input.
--
--     This returns the values previously set by @SDL_SetTextInputArea()@.
--
--     [@window@]: the window for which to query the text input area.
--
--     [@rect@]: a pointer to an SDL_Rect filled in with the text input area, may be NULL.
--
--     [@cursor@]: a pointer to the offset of the current cursor location relative to @rect->x@, may be NULL.
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
  :: BG.FunPtr
       ( BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
         -> BG.Ptr SDL3.Sys.Bindgen.Rect.SDL_Rect
         -> BG.Ptr BG.CInt
         -> IO BG.CBool
       )
sDL_GetTextInputArea =
  BG.unsafePerformIO hs_bindgen_b5c6f5df66854547

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_HasScreenKeyboardSupport@
foreign import ccall unsafe "hs_bindgen_e8fffc349e61bb9c"
  hs_bindgen_e8fffc349e61bb9c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_HasScreenKeyboardSupport@
hs_bindgen_e8fffc349e61bb9c :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_e8fffc349e61bb9c =
  BG.fromFFIType hs_bindgen_e8fffc349e61bb9c_base

{-# NOINLINE sDL_HasScreenKeyboardSupport #-}

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
sDL_HasScreenKeyboardSupport :: BG.FunPtr (IO BG.CBool)
sDL_HasScreenKeyboardSupport =
  BG.unsafePerformIO hs_bindgen_e8fffc349e61bb9c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_ScreenKeyboardShown@
foreign import ccall unsafe "hs_bindgen_f094fa8f75a49f31"
  hs_bindgen_f094fa8f75a49f31_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Keyboard_get_SDL_ScreenKeyboardShown@
hs_bindgen_f094fa8f75a49f31
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool))
hs_bindgen_f094fa8f75a49f31 =
  BG.fromFFIType hs_bindgen_f094fa8f75a49f31_base

{-# NOINLINE sDL_ScreenKeyboardShown #-}

-- | Check whether the screen keyboard is shown for given window.
--
--     [@window@]: the window for which screen keyboard should be queried.
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
sDL_ScreenKeyboardShown :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window -> IO BG.CBool)
sDL_ScreenKeyboardShown =
  BG.unsafePerformIO hs_bindgen_f094fa8f75a49f31
