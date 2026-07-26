-- | SDL keyboard management.
--
--     Please refer to the Best Keyboard Practices document for details on how best to accept keyboard input in various types of programs:
--
--     [https:\/\/wiki.libsdl.org\/SDL3\/BestKeyboardPractices](https://wiki.libsdl.org/SDL3/BestKeyboardPractices) This is a unique ID for a keyboard for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the keyboard is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Keyboard.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Keyboard (
  module SDL3.Sys.Bindgen.Keyboard,

  -- * Function aliases
  SDL3.Sys.Keyboard.hasKeyboard,
  SDL3.Sys.Keyboard.hasKeyboardSafe,
  SDL3.Sys.Keyboard.getKeyboards,
  SDL3.Sys.Keyboard.getKeyboardsSafe,
  SDL3.Sys.Keyboard.getKeyboardNameForID,
  SDL3.Sys.Keyboard.getKeyboardNameForIDSafe,
  SDL3.Sys.Keyboard.getKeyboardFocus,
  SDL3.Sys.Keyboard.getKeyboardFocusSafe,
  SDL3.Sys.Keyboard.getKeyboardState,
  SDL3.Sys.Keyboard.getKeyboardStateSafe,
  SDL3.Sys.Keyboard.resetKeyboard,
  SDL3.Sys.Keyboard.resetKeyboardSafe,
  SDL3.Sys.Keyboard.getModState,
  SDL3.Sys.Keyboard.getModStateSafe,
  SDL3.Sys.Keyboard.setModState,
  SDL3.Sys.Keyboard.setModStateSafe,
  SDL3.Sys.Keyboard.getKeyFromScancode,
  SDL3.Sys.Keyboard.getKeyFromScancodeSafe,
  SDL3.Sys.Keyboard.getScancodeFromKey,
  SDL3.Sys.Keyboard.getScancodeFromKeySafe,
  SDL3.Sys.Keyboard.setScancodeName,
  SDL3.Sys.Keyboard.setScancodeNameSafe,
  SDL3.Sys.Keyboard.getScancodeName,
  SDL3.Sys.Keyboard.getScancodeNameSafe,
  SDL3.Sys.Keyboard.getScancodeFromName,
  SDL3.Sys.Keyboard.getScancodeFromNameSafe,
  SDL3.Sys.Keyboard.getKeyName,
  SDL3.Sys.Keyboard.getKeyNameSafe,
  SDL3.Sys.Keyboard.getKeyFromName,
  SDL3.Sys.Keyboard.getKeyFromNameSafe,
  SDL3.Sys.Keyboard.startTextInput,
  SDL3.Sys.Keyboard.startTextInputSafe,
  SDL3.Sys.Keyboard.startTextInputWithProperties,
  SDL3.Sys.Keyboard.startTextInputWithPropertiesSafe,
  SDL3.Sys.Keyboard.textInputActive,
  SDL3.Sys.Keyboard.textInputActiveSafe,
  SDL3.Sys.Keyboard.stopTextInput,
  SDL3.Sys.Keyboard.stopTextInputSafe,
  SDL3.Sys.Keyboard.clearComposition,
  SDL3.Sys.Keyboard.clearCompositionSafe,
  SDL3.Sys.Keyboard.setTextInputArea,
  SDL3.Sys.Keyboard.setTextInputAreaSafe,
  SDL3.Sys.Keyboard.getTextInputArea,
  SDL3.Sys.Keyboard.getTextInputAreaSafe,
  SDL3.Sys.Keyboard.hasScreenKeyboardSupport,
  SDL3.Sys.Keyboard.hasScreenKeyboardSupportSafe,
  SDL3.Sys.Keyboard.screenKeyboardShown,
  SDL3.Sys.Keyboard.screenKeyboardShownSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Keyboard
import SDL3.Sys.Bindgen.Keyboard.Safe qualified as Safe
import SDL3.Sys.Bindgen.Keyboard.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Keycode qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Rect qualified
import SDL3.Sys.Bindgen.Scancode qualified
import SDL3.Sys.Bindgen.Video qualified

-- | Return whether a keyboard is currently connected.
--
--     [Returns]: true if a keyboard is connected, false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboards'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasKeyboard@.
--                   The safe flavor is 'hasKeyboardSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasKeyboard@, defined at @SDL3\/SDL_keyboard.h 75:34@
hasKeyboard :: IO Bool
hasKeyboard =
  fmap CBool.toBool Unsafe.sDL_HasKeyboard

-- | Return whether a keyboard is currently connected.
--
--     [Returns]: true if a keyboard is connected, false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboards'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasKeyboard@.
--                   The unsafe flavor is 'hasKeyboard'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasKeyboard@, defined at @SDL3\/SDL_keyboard.h 75:34@
hasKeyboardSafe :: IO Bool
hasKeyboardSafe =
  fmap CBool.toBool Safe.sDL_HasKeyboard

-- | Get a list of currently connected keyboards.
--
--     Note that this will include any device or virtual driver that includes keyboard functionality, including some mice, KVM switches, motherboard power buttons, etc. You should wait for input from a device before you consider it actively in use.
--
--     [Returns]: a 0 terminated array of keyboards instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboardNameForID', 'hasKeyboard'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetKeyboards@.
--                   The safe flavor is 'getKeyboardsSafe'
--                   .
--
--     [C declaration]: @SDL_GetKeyboards@, defined at @SDL3\/SDL_keyboard.h 98:46@
getKeyboards
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of keyboards returned, may be NULL.
  -> IO (BG.Ptr SDL_KeyboardID)
getKeyboards = Unsafe.sDL_GetKeyboards

-- | Get a list of currently connected keyboards.
--
--     Note that this will include any device or virtual driver that includes keyboard functionality, including some mice, KVM switches, motherboard power buttons, etc. You should wait for input from a device before you consider it actively in use.
--
--     [Returns]: a 0 terminated array of keyboards instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboardNameForID', 'hasKeyboard'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetKeyboards@.
--                   The unsafe flavor is 'getKeyboards'
--                   .
--
--     [C declaration]: @SDL_GetKeyboards@, defined at @SDL3\/SDL_keyboard.h 98:46@
getKeyboardsSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of keyboards returned, may be NULL.
  -> IO (BG.Ptr SDL_KeyboardID)
getKeyboardsSafe = Safe.sDL_GetKeyboards

-- | Get the name of a keyboard.
--
--     This function returns \"\" if the keyboard doesn\'t have a name.
--
--     [Returns]: the name of the selected keyboard or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboards'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetKeyboardNameForID@.
--                   The safe flavor is 'getKeyboardNameForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetKeyboardNameForID@, defined at @SDL3\/SDL_keyboard.h 115:42@
getKeyboardNameForID
  :: SDL_KeyboardID
  -- ^
  --
  --           [@instance_id@]: the keyboard instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getKeyboardNameForID =
  Unsafe.sDL_GetKeyboardNameForID

-- | Get the name of a keyboard.
--
--     This function returns \"\" if the keyboard doesn\'t have a name.
--
--     [Returns]: the name of the selected keyboard or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboards'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetKeyboardNameForID@.
--                   The unsafe flavor is 'getKeyboardNameForID'
--                   .
--
--     [C declaration]: @SDL_GetKeyboardNameForID@, defined at @SDL3\/SDL_keyboard.h 115:42@
getKeyboardNameForIDSafe
  :: SDL_KeyboardID
  -- ^
  --
  --           [@instance_id@]: the keyboard instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getKeyboardNameForIDSafe =
  Safe.sDL_GetKeyboardNameForID

-- | Query the window which currently has keyboard focus.
--
--     [Returns]: the window with keyboard focus.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetKeyboardFocus@.
--                   The safe flavor is 'getKeyboardFocusSafe'
--                   .
--
--     [C declaration]: @SDL_GetKeyboardFocus@, defined at @SDL3\/SDL_keyboard.h 126:42@
getKeyboardFocus :: IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
getKeyboardFocus = Unsafe.sDL_GetKeyboardFocus

-- | Query the window which currently has keyboard focus.
--
--     [Returns]: the window with keyboard focus.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetKeyboardFocus@.
--                   The unsafe flavor is 'getKeyboardFocus'
--                   .
--
--     [C declaration]: @SDL_GetKeyboardFocus@, defined at @SDL3\/SDL_keyboard.h 126:42@
getKeyboardFocusSafe :: IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
getKeyboardFocusSafe = Safe.sDL_GetKeyboardFocus

-- | Get a snapshot of the current state of the keyboard.
--
--     The pointer returned is a pointer to an internal SDL array. It will be valid for the whole lifetime of the application and should not be freed by the caller.
--
--     A array element with a value of true means that the key is pressed and a value of false means that it is not. Indexes into this array are obtained by using SDL_Scancode values.
--
--     Use 'SDL3.Sys.Events.pumpEvents' to update the state array.
--
--     This function gives you the current state after all events have been processed, so if a key or button has been pressed and released before you process events, then the pressed state will never show up in the @'getKeyboardState'@ calls.
--
--     Note: This function doesn\'t take into account whether shift has been pressed or not.
--
--     [Returns]: a pointer to an array of key states.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Events.pumpEvents', 'resetKeyboard'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetKeyboardState@.
--                   The safe flavor is 'getKeyboardStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetKeyboardState@, defined at @SDL3\/SDL_keyboard.h 159:42@
getKeyboardState
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@numkeys@]: if non-NULL, receives the length of the returned array.
  -> IO (PtrConst.PtrConst BG.CBool)
getKeyboardState = Unsafe.sDL_GetKeyboardState

-- | Get a snapshot of the current state of the keyboard.
--
--     The pointer returned is a pointer to an internal SDL array. It will be valid for the whole lifetime of the application and should not be freed by the caller.
--
--     A array element with a value of true means that the key is pressed and a value of false means that it is not. Indexes into this array are obtained by using SDL_Scancode values.
--
--     Use 'SDL3.Sys.Events.pumpEvents' to update the state array.
--
--     This function gives you the current state after all events have been processed, so if a key or button has been pressed and released before you process events, then the pressed state will never show up in the @'getKeyboardState'@ calls.
--
--     Note: This function doesn\'t take into account whether shift has been pressed or not.
--
--     [Returns]: a pointer to an array of key states.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Events.pumpEvents', 'resetKeyboard'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetKeyboardState@.
--                   The unsafe flavor is 'getKeyboardState'
--                   .
--
--     [C declaration]: @SDL_GetKeyboardState@, defined at @SDL3\/SDL_keyboard.h 159:42@
getKeyboardStateSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@numkeys@]: if non-NULL, receives the length of the returned array.
  -> IO (PtrConst.PtrConst BG.CBool)
getKeyboardStateSafe = Safe.sDL_GetKeyboardState

-- | Clear the state of the keyboard.
--
--     This function will generate key up events for all pressed keys.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboardState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ResetKeyboard@.
--                   The safe flavor is 'resetKeyboardSafe'
--                   .
--
--     [C declaration]: @SDL_ResetKeyboard@, defined at @SDL3\/SDL_keyboard.h 172:34@
resetKeyboard :: IO ()
resetKeyboard = Unsafe.sDL_ResetKeyboard

-- | Clear the state of the keyboard.
--
--     This function will generate key up events for all pressed keys.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboardState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ResetKeyboard@.
--                   The unsafe flavor is 'resetKeyboard'
--                   .
--
--     [C declaration]: @SDL_ResetKeyboard@, defined at @SDL3\/SDL_keyboard.h 172:34@
resetKeyboardSafe :: IO ()
resetKeyboardSafe = Safe.sDL_ResetKeyboard

-- | Get the current key modifier state for the keyboard.
--
--     [Returns]: an OR\'d combination of the modifier keys for the keyboard.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboardState', 'setModState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetModState@.
--                   The safe flavor is 'getModStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetModState@, defined at @SDL3\/SDL_keyboard.h 186:40@
getModState :: IO SDL3.Sys.Bindgen.Keycode.SDL_Keymod
getModState = Unsafe.sDL_GetModState

-- | Get the current key modifier state for the keyboard.
--
--     [Returns]: an OR\'d combination of the modifier keys for the keyboard.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyboardState', 'setModState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetModState@.
--                   The unsafe flavor is 'getModState'
--                   .
--
--     [C declaration]: @SDL_GetModState@, defined at @SDL3\/SDL_keyboard.h 186:40@
getModStateSafe :: IO SDL3.Sys.Bindgen.Keycode.SDL_Keymod
getModStateSafe = Safe.sDL_GetModState

-- | Set the current key modifier state for the keyboard.
--
--     The inverse of @'getModState'@, @'setModState'@ allows you to impose modifier key states on your application. Simply pass your desired modifier states into @modstate@. This value may be a bitwise, OR\'d combination of SDL_Keymod values.
--
--     This does not change the keyboard state, only the key modifier flags that SDL reports.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getModState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetModState@.
--                   The safe flavor is 'setModStateSafe'
--                   .
--
--     [C declaration]: @SDL_SetModState@, defined at @SDL3\/SDL_keyboard.h 207:34@
setModState
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^
  --
  --           [@modstate@]: the desired SDL_Keymod for the keyboard.
  -> IO ()
setModState = Unsafe.sDL_SetModState

-- | Set the current key modifier state for the keyboard.
--
--     The inverse of @'getModState'@, @'setModState'@ allows you to impose modifier key states on your application. Simply pass your desired modifier states into @modstate@. This value may be a bitwise, OR\'d combination of SDL_Keymod values.
--
--     This does not change the keyboard state, only the key modifier flags that SDL reports.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getModState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetModState@.
--                   The unsafe flavor is 'setModState'
--                   .
--
--     [C declaration]: @SDL_SetModState@, defined at @SDL3\/SDL_keyboard.h 207:34@
setModStateSafe
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^
  --
  --           [@modstate@]: the desired SDL_Keymod for the keyboard.
  -> IO ()
setModStateSafe = Safe.sDL_SetModState

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
--     [See also]: 'getKeyName', 'getScancodeFromKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetKeyFromScancode@.
--                   The safe flavor is 'getKeyFromScancodeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetKeyFromScancode@, defined at @SDL3\/SDL_keyboard.h 231:41@
getKeyFromScancode
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^
  --
  --           [@scancode@]: the desired SDL_Scancode to query.
  -> SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^
  --
  --           [@modstate@]: the modifier state to use when translating the scancode to a keycode.
  -> Bool
  -- ^
  --
  --           [@key_event@]: true if the keycode will be used in key events.
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
getKeyFromScancode =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_GetKeyFromScancode x00 x11 (CBool.fromBool x22)

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
--     [See also]: 'getKeyName', 'getScancodeFromKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetKeyFromScancode@.
--                   The unsafe flavor is 'getKeyFromScancode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetKeyFromScancode@, defined at @SDL3\/SDL_keyboard.h 231:41@
getKeyFromScancodeSafe
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^
  --
  --           [@scancode@]: the desired SDL_Scancode to query.
  -> SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^
  --
  --           [@modstate@]: the modifier state to use when translating the scancode to a keycode.
  -> Bool
  -- ^
  --
  --           [@key_event@]: true if the keycode will be used in key events.
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
getKeyFromScancodeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_GetKeyFromScancode x00 x11 (CBool.fromBool x22)

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
--     [See also]: 'getKeyFromScancode', 'getScancodeName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetScancodeFromKey@.
--                   The safe flavor is 'getScancodeFromKeySafe'
--                   .
--
--     [C declaration]: @SDL_GetScancodeFromKey@, defined at @SDL3\/SDL_keyboard.h 252:42@
getScancodeFromKey
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -- ^
  --
  --           [@key@]: the desired SDL_Keycode to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^
  --
  --           [@modstate@]: a pointer to the modifier state that would be used when the scancode generates this key, may be NULL.
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
getScancodeFromKey = Unsafe.sDL_GetScancodeFromKey

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
--     [See also]: 'getKeyFromScancode', 'getScancodeName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetScancodeFromKey@.
--                   The unsafe flavor is 'getScancodeFromKey'
--                   .
--
--     [C declaration]: @SDL_GetScancodeFromKey@, defined at @SDL3\/SDL_keyboard.h 252:42@
getScancodeFromKeySafe
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -- ^
  --
  --           [@key@]: the desired SDL_Keycode to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Keycode.SDL_Keymod
  -- ^
  --
  --           [@modstate@]: a pointer to the modifier state that would be used when the scancode generates this key, may be NULL.
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
getScancodeFromKeySafe = Safe.sDL_GetScancodeFromKey

-- | Set a human-readable name for a scancode.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'getScancodeName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetScancodeName@.
--                   The safe flavor is 'setScancodeNameSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetScancodeName@, defined at @SDL3\/SDL_keyboard.h 270:34@
setScancodeName
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^
  --
  --           [@scancode@]: the desired SDL_Scancode.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name to use for the scancode, encoded as UTF-8. The string is not copied, so the pointer given to this function must stay valid while SDL is being used.
  -> IO Bool
setScancodeName =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetScancodeName x00 x11)

-- | Set a human-readable name for a scancode.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'getScancodeName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetScancodeName@.
--                   The unsafe flavor is 'setScancodeName'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetScancodeName@, defined at @SDL3\/SDL_keyboard.h 270:34@
setScancodeNameSafe
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^
  --
  --           [@scancode@]: the desired SDL_Scancode.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name to use for the scancode, encoded as UTF-8. The string is not copied, so the pointer given to this function must stay valid while SDL is being used.
  -> IO Bool
setScancodeNameSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetScancodeName x00 x11)

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
--     [See also]: 'getScancodeFromKey', 'getScancodeFromName', 'setScancodeName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetScancodeName@.
--                   The safe flavor is 'getScancodeNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetScancodeName@, defined at @SDL3\/SDL_keyboard.h 296:42@
getScancodeName
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^
  --
  --           [@scancode@]: the desired SDL_Scancode to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getScancodeName = Unsafe.sDL_GetScancodeName

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
--     [See also]: 'getScancodeFromKey', 'getScancodeFromName', 'setScancodeName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetScancodeName@.
--                   The unsafe flavor is 'getScancodeName'
--                   .
--
--     [C declaration]: @SDL_GetScancodeName@, defined at @SDL3\/SDL_keyboard.h 296:42@
getScancodeNameSafe
  :: SDL3.Sys.Bindgen.Scancode.SDL_Scancode
  -- ^
  --
  --           [@scancode@]: the desired SDL_Scancode to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getScancodeNameSafe = Safe.sDL_GetScancodeName

-- | Get a scancode from a human-readable name.
--
--     [Returns]: the SDL_Scancode, or @SDL_SCANCODE_UNKNOWN@ if the name wasn\'t recognized; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyFromName', 'getScancodeFromKey', 'getScancodeName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetScancodeFromName@.
--                   The safe flavor is 'getScancodeFromNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetScancodeFromName@, defined at @SDL3\/SDL_keyboard.h 313:42@
getScancodeFromName
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the human-readable scancode name.
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
getScancodeFromName = Unsafe.sDL_GetScancodeFromName

-- | Get a scancode from a human-readable name.
--
--     [Returns]: the SDL_Scancode, or @SDL_SCANCODE_UNKNOWN@ if the name wasn\'t recognized; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyFromName', 'getScancodeFromKey', 'getScancodeName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetScancodeFromName@.
--                   The unsafe flavor is 'getScancodeFromName'
--                   .
--
--     [C declaration]: @SDL_GetScancodeFromName@, defined at @SDL3\/SDL_keyboard.h 313:42@
getScancodeFromNameSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the human-readable scancode name.
  -> IO SDL3.Sys.Bindgen.Scancode.SDL_Scancode
getScancodeFromNameSafe =
  Safe.sDL_GetScancodeFromName

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
--     [See also]: 'getKeyFromName', 'getKeyFromScancode', 'getScancodeFromKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetKeyName@.
--                   The safe flavor is 'getKeyNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetKeyName@, defined at @SDL3\/SDL_keyboard.h 333:42@
getKeyName
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -- ^
  --
  --           [@key@]: the desired SDL_Keycode to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getKeyName = Unsafe.sDL_GetKeyName

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
--     [See also]: 'getKeyFromName', 'getKeyFromScancode', 'getScancodeFromKey'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetKeyName@.
--                   The unsafe flavor is 'getKeyName'
--                   .
--
--     [C declaration]: @SDL_GetKeyName@, defined at @SDL3\/SDL_keyboard.h 333:42@
getKeyNameSafe
  :: SDL3.Sys.Bindgen.Keycode.SDL_Keycode
  -- ^
  --
  --           [@key@]: the desired SDL_Keycode to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getKeyNameSafe = Safe.sDL_GetKeyName

-- | Get a key code from a human-readable name.
--
--     [Returns]: key code, or @SDLK_UNKNOWN@ if the name wasn\'t recognized; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyFromScancode', 'getKeyName', 'getScancodeFromName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetKeyFromName@.
--                   The safe flavor is 'getKeyFromNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetKeyFromName@, defined at @SDL3\/SDL_keyboard.h 350:41@
getKeyFromName
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the human-readable key name.
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
getKeyFromName = Unsafe.sDL_GetKeyFromName

-- | Get a key code from a human-readable name.
--
--     [Returns]: key code, or @SDLK_UNKNOWN@ if the name wasn\'t recognized; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'getKeyFromScancode', 'getKeyName', 'getScancodeFromName'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetKeyFromName@.
--                   The unsafe flavor is 'getKeyFromName'
--                   .
--
--     [C declaration]: @SDL_GetKeyFromName@, defined at @SDL3\/SDL_keyboard.h 350:41@
getKeyFromNameSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the human-readable key name.
  -> IO SDL3.Sys.Bindgen.Keycode.SDL_Keycode
getKeyFromNameSafe = Safe.sDL_GetKeyFromName

-- | Start accepting Unicode text input events in a window.
--
--     This function will enable text input (SDL_EVENT_TEXT_INPUT and SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this function paired with @'stopTextInput'@.
--
--     Text input events are not received by default.
--
--     On some platforms using this function shows the screen keyboard and\/or activates an IME, which can prevent some key press events from being passed through.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextInputArea', 'startTextInputWithProperties', 'stopTextInput', 'textInputActive'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StartTextInput@.
--                   The safe flavor is 'startTextInputSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StartTextInput@, defined at @SDL3\/SDL_keyboard.h 378:34@
startTextInput
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to enable text input.
  -> IO Bool
startTextInput =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_StartTextInput x00)

-- | Start accepting Unicode text input events in a window.
--
--     This function will enable text input (SDL_EVENT_TEXT_INPUT and SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this function paired with @'stopTextInput'@.
--
--     Text input events are not received by default.
--
--     On some platforms using this function shows the screen keyboard and\/or activates an IME, which can prevent some key press events from being passed through.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextInputArea', 'startTextInputWithProperties', 'stopTextInput', 'textInputActive'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_StartTextInput@.
--                   The unsafe flavor is 'startTextInput'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StartTextInput@, defined at @SDL3\/SDL_keyboard.h 378:34@
startTextInputSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to enable text input.
  -> IO Bool
startTextInputSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_StartTextInput x00)

-- | Start accepting Unicode text input events in a window, with properties describing the input.
--
--     This function will enable text input (SDL_EVENT_TEXT_INPUT and SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this function paired with @'stopTextInput'@.
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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextInputArea', 'startTextInput', 'stopTextInput', 'textInputActive'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StartTextInputWithProperties@.
--                   The safe flavor is 'startTextInputWithPropertiesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StartTextInputWithProperties@, defined at @SDL3\/SDL_keyboard.h 473:34@
startTextInputWithProperties
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to enable text input.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO Bool
startTextInputWithProperties =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_StartTextInputWithProperties x00 x11)

-- | Start accepting Unicode text input events in a window, with properties describing the input.
--
--     This function will enable text input (SDL_EVENT_TEXT_INPUT and SDL_EVENT_TEXT_EDITING events) in the specified window. Please use this function paired with @'stopTextInput'@.
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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextInputArea', 'startTextInput', 'stopTextInput', 'textInputActive'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_StartTextInputWithProperties@.
--                   The unsafe flavor is 'startTextInputWithProperties'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StartTextInputWithProperties@, defined at @SDL3\/SDL_keyboard.h 473:34@
startTextInputWithPropertiesSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to enable text input.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO Bool
startTextInputWithPropertiesSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_StartTextInputWithProperties x00 x11)

-- | Check whether or not Unicode text input events are enabled for a window.
--
--     [Returns]: true if text input events are enabled else false.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'startTextInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TextInputActive@.
--                   The safe flavor is 'textInputActiveSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TextInputActive@, defined at @SDL3\/SDL_keyboard.h 493:34@
textInputActive
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to check.
  -> IO Bool
textInputActive =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_TextInputActive x00)

-- | Check whether or not Unicode text input events are enabled for a window.
--
--     [Returns]: true if text input events are enabled else false.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'startTextInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TextInputActive@.
--                   The unsafe flavor is 'textInputActive'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TextInputActive@, defined at @SDL3\/SDL_keyboard.h 493:34@
textInputActiveSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to check.
  -> IO Bool
textInputActiveSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_TextInputActive x00)

-- | Stop receiving any text input events in a window.
--
--     If @'startTextInput'@ showed the screen keyboard, this function will hide it.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'startTextInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StopTextInput@.
--                   The safe flavor is 'stopTextInputSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StopTextInput@, defined at @SDL3\/SDL_keyboard.h 511:34@
stopTextInput
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to disable text input.
  -> IO Bool
stopTextInput =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_StopTextInput x00)

-- | Stop receiving any text input events in a window.
--
--     If @'startTextInput'@ showed the screen keyboard, this function will hide it.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'startTextInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_StopTextInput@.
--                   The unsafe flavor is 'stopTextInput'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StopTextInput@, defined at @SDL3\/SDL_keyboard.h 511:34@
stopTextInputSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to disable text input.
  -> IO Bool
stopTextInputSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_StopTextInput x00)

-- | Dismiss the composition window\/IME without disabling the subsystem.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'startTextInput', 'stopTextInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ClearComposition@.
--                   The safe flavor is 'clearCompositionSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearComposition@, defined at @SDL3\/SDL_keyboard.h 527:34@
clearComposition
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to affect.
  -> IO Bool
clearComposition =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_ClearComposition x00)

-- | Dismiss the composition window\/IME without disabling the subsystem.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'startTextInput', 'stopTextInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ClearComposition@.
--                   The unsafe flavor is 'clearComposition'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearComposition@, defined at @SDL3\/SDL_keyboard.h 527:34@
clearCompositionSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to affect.
  -> IO Bool
clearCompositionSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_ClearComposition x00)

-- | Set the area used to type Unicode text input.
--
--     Native input methods may place a window with word suggestions near the cursor, without covering the text being entered.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextInputArea', 'startTextInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTextInputArea@.
--                   The safe flavor is 'setTextInputAreaSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextInputArea@, defined at @SDL3\/SDL_keyboard.h 550:34@
setTextInputArea
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window for which to set the text input area.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect representing the text input area, in window coordinates, or NULL to clear it.
  -> BG.Int32
  -- ^
  --
  --           [@cursor@]: the offset of the current cursor location relative to @rect->x@, in window coordinates.
  -> IO Bool
setTextInputArea =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetTextInputArea x00 x11 (Coerce.coerce x22))

-- | Set the area used to type Unicode text input.
--
--     Native input methods may place a window with word suggestions near the cursor, without covering the text being entered.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTextInputArea', 'startTextInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTextInputArea@.
--                   The unsafe flavor is 'setTextInputArea'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTextInputArea@, defined at @SDL3\/SDL_keyboard.h 550:34@
setTextInputAreaSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window for which to set the text input area.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Rect.SDL_Rect
  -- ^
  --
  --           [@rect@]: the SDL_Rect representing the text input area, in window coordinates, or NULL to clear it.
  -> BG.Int32
  -- ^
  --
  --           [@cursor@]: the offset of the current cursor location relative to @rect->x@, in window coordinates.
  -> IO Bool
setTextInputAreaSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetTextInputArea x00 x11 (Coerce.coerce x22))

-- | Get the area used to type Unicode text input.
--
--     This returns the values previously set by @'setTextInputArea'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextInputArea'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTextInputArea@.
--                   The safe flavor is 'getTextInputAreaSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextInputArea@, defined at @SDL3\/SDL_keyboard.h 571:34@
getTextInputArea
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
  -> IO Bool
getTextInputArea =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetTextInputArea x00 x11 x22)

-- | Get the area used to type Unicode text input.
--
--     This returns the values previously set by @'setTextInputArea'@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTextInputArea'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTextInputArea@.
--                   The unsafe flavor is 'getTextInputArea'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetTextInputArea@, defined at @SDL3\/SDL_keyboard.h 571:34@
getTextInputAreaSafe
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
  -> IO Bool
getTextInputAreaSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetTextInputArea x00 x11 x22)

-- | Check whether the platform has screen keyboard support.
--
--     [Returns]: true if the platform has some screen keyboard support or false if not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'startTextInput', 'screenKeyboardShown'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasScreenKeyboardSupport@.
--                   The safe flavor is 'hasScreenKeyboardSupportSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasScreenKeyboardSupport@, defined at @SDL3\/SDL_keyboard.h 586:34@
hasScreenKeyboardSupport :: IO Bool
hasScreenKeyboardSupport =
  fmap CBool.toBool Unsafe.sDL_HasScreenKeyboardSupport

-- | Check whether the platform has screen keyboard support.
--
--     [Returns]: true if the platform has some screen keyboard support or false if not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'startTextInput', 'screenKeyboardShown'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasScreenKeyboardSupport@.
--                   The unsafe flavor is 'hasScreenKeyboardSupport'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasScreenKeyboardSupport@, defined at @SDL3\/SDL_keyboard.h 586:34@
hasScreenKeyboardSupportSafe :: IO Bool
hasScreenKeyboardSupportSafe =
  fmap CBool.toBool Safe.sDL_HasScreenKeyboardSupport

-- | Check whether the screen keyboard is shown for given window.
--
--     [Returns]: true if screen keyboard is shown or false if not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasScreenKeyboardSupport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ScreenKeyboardShown@.
--                   The safe flavor is 'screenKeyboardShownSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ScreenKeyboardShown@, defined at @SDL3\/SDL_keyboard.h 600:34@
screenKeyboardShown
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window for which screen keyboard should be queried.
  -> IO Bool
screenKeyboardShown =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_ScreenKeyboardShown x00)

-- | Check whether the screen keyboard is shown for given window.
--
--     [Returns]: true if screen keyboard is shown or false if not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasScreenKeyboardSupport'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ScreenKeyboardShown@.
--                   The unsafe flavor is 'screenKeyboardShown'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ScreenKeyboardShown@, defined at @SDL3\/SDL_keyboard.h 600:34@
screenKeyboardShownSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window for which screen keyboard should be queried.
  -> IO Bool
screenKeyboardShownSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_ScreenKeyboardShown x00)
