{-# LANGUAGE PatternSynonyms #-}

-- | Any GUI application has to deal with the mouse, and SDL provides functions to manage mouse input and the displayed cursor.
--
--     Most interactions with the mouse will come through the event subsystem. Moving a mouse generates an SDL_EVENT_MOUSE_MOTION event, pushing a button generates SDL_EVENT_MOUSE_BUTTON_DOWN, etc, but one can also query the current state of the mouse at any time with @'getMouseState'@.
--
--     For certain games, it\'s useful to disassociate the mouse cursor from mouse input. An FPS, for example, would not want the player\'s motion to stop as the mouse hits the edge of the window. For these scenarios, use @'setWindowRelativeMouseMode'@, which hides the cursor, grabs mouse input to the window, and reads mouse input no matter how far it moves.
--
--     Games that want the system to track the mouse but want to draw their own cursor can use @'hideCursor'@ and @'showCursor'@. It might be more efficient to let the system manage the cursor, if possible, using @'setCursor'@ with a custom image made through @'createColorCursor'@, or perhaps just a specific system cursor from @'createSystemCursor'@.
--
--     SDL can, on many platforms, differentiate between multiple connected mice, allowing for interesting input scenarios and multiplayer games. They can be enumerated with @'getMice'@, and SDL will send SDL_EVENT_MOUSE_ADDED and SDL_EVENT_MOUSE_REMOVED events as they are connected and unplugged.
--
--     Since many apps only care about basic mouse input, SDL offers a virtual mouse device for touch and pen input, which often can make a desktop application work on a touchscreen phone without any code changes. Apps that care about touch\/pen separately from mouse input should filter out events with a @which@ field of SDL_TOUCH_MOUSEID\/SDL_PEN_MOUSEID. This is a unique ID for a mouse for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the mouse is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Mouse.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Mouse (
  module SDL3.Sys.Bindgen.Mouse,

  -- * Typed constants
  pattern SDL3.Sys.Mouse.SDL_BUTTON_LMASK,
  pattern SDL3.Sys.Mouse.SDL_BUTTON_MMASK,
  pattern SDL3.Sys.Mouse.SDL_BUTTON_RMASK,
  pattern SDL3.Sys.Mouse.SDL_BUTTON_X1MASK,
  pattern SDL3.Sys.Mouse.SDL_BUTTON_X2MASK,

  -- * Function aliases
  SDL3.Sys.Mouse.hasMouse,
  SDL3.Sys.Mouse.hasMouseSafe,
  SDL3.Sys.Mouse.getMice,
  SDL3.Sys.Mouse.getMiceSafe,
  SDL3.Sys.Mouse.getMouseNameForID,
  SDL3.Sys.Mouse.getMouseNameForIDSafe,
  SDL3.Sys.Mouse.getMouseFocus,
  SDL3.Sys.Mouse.getMouseFocusSafe,
  SDL3.Sys.Mouse.getMouseState,
  SDL3.Sys.Mouse.getMouseStateSafe,
  SDL3.Sys.Mouse.getGlobalMouseState,
  SDL3.Sys.Mouse.getGlobalMouseStateSafe,
  SDL3.Sys.Mouse.getRelativeMouseState,
  SDL3.Sys.Mouse.getRelativeMouseStateSafe,
  SDL3.Sys.Mouse.warpMouseInWindow,
  SDL3.Sys.Mouse.warpMouseInWindowSafe,
  SDL3.Sys.Mouse.warpMouseGlobal,
  SDL3.Sys.Mouse.warpMouseGlobalSafe,
  SDL3.Sys.Mouse.setRelativeMouseTransform,
  SDL3.Sys.Mouse.setRelativeMouseTransformSafe,
  SDL3.Sys.Mouse.setWindowRelativeMouseMode,
  SDL3.Sys.Mouse.setWindowRelativeMouseModeSafe,
  SDL3.Sys.Mouse.getWindowRelativeMouseMode,
  SDL3.Sys.Mouse.getWindowRelativeMouseModeSafe,
  SDL3.Sys.Mouse.captureMouse,
  SDL3.Sys.Mouse.captureMouseSafe,
  SDL3.Sys.Mouse.createCursor,
  SDL3.Sys.Mouse.createCursorSafe,
  SDL3.Sys.Mouse.createColorCursor,
  SDL3.Sys.Mouse.createColorCursorSafe,
  SDL3.Sys.Mouse.createAnimatedCursor,
  SDL3.Sys.Mouse.createAnimatedCursorSafe,
  SDL3.Sys.Mouse.createSystemCursor,
  SDL3.Sys.Mouse.createSystemCursorSafe,
  SDL3.Sys.Mouse.setCursor,
  SDL3.Sys.Mouse.setCursorSafe,
  SDL3.Sys.Mouse.getCursor,
  SDL3.Sys.Mouse.getCursorSafe,
  SDL3.Sys.Mouse.getDefaultCursor,
  SDL3.Sys.Mouse.getDefaultCursorSafe,
  SDL3.Sys.Mouse.destroyCursor,
  SDL3.Sys.Mouse.destroyCursorSafe,
  SDL3.Sys.Mouse.showCursor,
  SDL3.Sys.Mouse.showCursorSafe,
  SDL3.Sys.Mouse.hideCursor,
  SDL3.Sys.Mouse.hideCursorSafe,
  SDL3.Sys.Mouse.cursorVisible,
  SDL3.Sys.Mouse.cursorVisibleSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Mouse
import SDL3.Sys.Bindgen.Mouse.Safe qualified as Safe
import SDL3.Sys.Bindgen.Mouse.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified
import SDL3.Sys.Bindgen.Video qualified

-- | Return whether a mouse is currently connected.
--
--     [Returns]: true if a mouse is connected, false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getMice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasMouse@.
--                   The safe flavor is 'hasMouseSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasMouse@, defined at @SDL3\/SDL_mouse.h 226:34@
hasMouse :: IO Bool
hasMouse = fmap CBool.toBool Unsafe.sDL_HasMouse

-- | Return whether a mouse is currently connected.
--
--     [Returns]: true if a mouse is connected, false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getMice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasMouse@.
--                   The unsafe flavor is 'hasMouse'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasMouse@, defined at @SDL3\/SDL_mouse.h 226:34@
hasMouseSafe :: IO Bool
hasMouseSafe = fmap CBool.toBool Safe.sDL_HasMouse

-- | Get a list of currently connected mice.
--
--     Note that this will include any device or virtual driver that includes mouse functionality, including some game controllers, KVM switches, etc. You should wait for input from a device before you consider it actively in use.
--
--     [Returns]: a 0 terminated array of mouse instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getMouseNameForID', 'hasMouse'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetMice@.
--                   The safe flavor is 'getMiceSafe'
--                   .
--
--     [C declaration]: @SDL_GetMice@, defined at @SDL3\/SDL_mouse.h 249:43@
getMice
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of mice returned, may be NULL.
  -> IO (BG.Ptr SDL_MouseID)
getMice = Unsafe.sDL_GetMice

-- | Get a list of currently connected mice.
--
--     Note that this will include any device or virtual driver that includes mouse functionality, including some game controllers, KVM switches, etc. You should wait for input from a device before you consider it actively in use.
--
--     [Returns]: a 0 terminated array of mouse instance IDs or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getMouseNameForID', 'hasMouse'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetMice@.
--                   The unsafe flavor is 'getMice'
--                   .
--
--     [C declaration]: @SDL_GetMice@, defined at @SDL3\/SDL_mouse.h 249:43@
getMiceSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of mice returned, may be NULL.
  -> IO (BG.Ptr SDL_MouseID)
getMiceSafe = Safe.sDL_GetMice

-- | Get the name of a mouse.
--
--     This function returns \"\" if the mouse doesn\'t have a name.
--
--     [Returns]: the name of the selected mouse, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getMice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetMouseNameForID@.
--                   The safe flavor is 'getMouseNameForIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetMouseNameForID@, defined at @SDL3\/SDL_mouse.h 266:42@
getMouseNameForID
  :: SDL_MouseID
  -- ^
  --
  --           [@instance_id@]: the mouse instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getMouseNameForID = Unsafe.sDL_GetMouseNameForID

-- | Get the name of a mouse.
--
--     This function returns \"\" if the mouse doesn\'t have a name.
--
--     [Returns]: the name of the selected mouse, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getMice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetMouseNameForID@.
--                   The unsafe flavor is 'getMouseNameForID'
--                   .
--
--     [C declaration]: @SDL_GetMouseNameForID@, defined at @SDL3\/SDL_mouse.h 266:42@
getMouseNameForIDSafe
  :: SDL_MouseID
  -- ^
  --
  --           [@instance_id@]: the mouse instance ID.
  -> IO (PtrConst.PtrConst BG.CChar)
getMouseNameForIDSafe = Safe.sDL_GetMouseNameForID

-- | Get the window which currently has mouse focus.
--
--     [Returns]: the window with mouse focus.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetMouseFocus@.
--                   The safe flavor is 'getMouseFocusSafe'
--                   .
--
--     [C declaration]: @SDL_GetMouseFocus@, defined at @SDL3\/SDL_mouse.h 277:42@
getMouseFocus :: IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
getMouseFocus = Unsafe.sDL_GetMouseFocus

-- | Get the window which currently has mouse focus.
--
--     [Returns]: the window with mouse focus.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetMouseFocus@.
--                   The unsafe flavor is 'getMouseFocus'
--                   .
--
--     [C declaration]: @SDL_GetMouseFocus@, defined at @SDL3\/SDL_mouse.h 277:42@
getMouseFocusSafe :: IO (BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
getMouseFocusSafe = Safe.sDL_GetMouseFocus

-- | Query SDL\'s cache for the synchronous mouse button state and the window-relative SDL-cursor position.
--
--     This function returns the cached synchronous state as SDL understands it from the last pump of the event queue.
--
--     To query the platform for immediate asynchronous state, use 'getGlobalMouseState'.
--
--     Passing non-NULL pointers to @x@ or @y@ will write the destination with respective x or y coordinates relative to the focused window.
--
--     In Relative Mode, the SDL-cursor\'s position usually contradicts the platform-cursor\'s position as manually calculated from @'getGlobalMouseState'@ and 'SDL3.Sys.Video.getWindowPosition'.
--
--     [Returns]: a 32-bit bitmask of the button state that can be bitwise-compared against the @SDL_BUTTON_MASK(X)@ macro.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGlobalMouseState', 'getRelativeMouseState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetMouseState@.
--                   The safe flavor is 'getMouseStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetMouseState@, defined at @SDL3\/SDL_mouse.h 310:50@
getMouseState
  :: BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer to receive the SDL-cursor\'s x-position from the focused window\'s top left corner, can be NULL if unused.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer to receive the SDL-cursor\'s y-position from the focused window\'s top left corner, can be NULL if unused.
  -> IO SDL_MouseButtonFlags
getMouseState = Unsafe.sDL_GetMouseState

-- | Query SDL\'s cache for the synchronous mouse button state and the window-relative SDL-cursor position.
--
--     This function returns the cached synchronous state as SDL understands it from the last pump of the event queue.
--
--     To query the platform for immediate asynchronous state, use 'getGlobalMouseState'.
--
--     Passing non-NULL pointers to @x@ or @y@ will write the destination with respective x or y coordinates relative to the focused window.
--
--     In Relative Mode, the SDL-cursor\'s position usually contradicts the platform-cursor\'s position as manually calculated from @'getGlobalMouseState'@ and 'SDL3.Sys.Video.getWindowPosition'.
--
--     [Returns]: a 32-bit bitmask of the button state that can be bitwise-compared against the @SDL_BUTTON_MASK(X)@ macro.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGlobalMouseState', 'getRelativeMouseState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetMouseState@.
--                   The unsafe flavor is 'getMouseState'
--                   .
--
--     [C declaration]: @SDL_GetMouseState@, defined at @SDL3\/SDL_mouse.h 310:50@
getMouseStateSafe
  :: BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer to receive the SDL-cursor\'s x-position from the focused window\'s top left corner, can be NULL if unused.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer to receive the SDL-cursor\'s y-position from the focused window\'s top left corner, can be NULL if unused.
  -> IO SDL_MouseButtonFlags
getMouseStateSafe = Safe.sDL_GetMouseState

-- | Query the platform for the asynchronous mouse button state and the desktop-relative platform-cursor position.
--
--     This function immediately queries the platform for the most recent asynchronous state, more costly than retrieving SDL\'s cached state in @'getMouseState'@.
--
--     Passing non-NULL pointers to @x@ or @y@ will write the destination with respective x or y coordinates relative to the desktop.
--
--     In Relative Mode, the platform-cursor\'s position usually contradicts the SDL-cursor\'s position as manually calculated from @'getMouseState'@ and 'SDL3.Sys.Video.getWindowPosition'.
--
--     This function can be useful if you need to track the mouse outside of a specific window and @'captureMouse'@ doesn\'t fit your needs. For example, it could be useful if you need to track the mouse while dragging a window, where coordinates relative to a window might not be in sync at all times.
--
--     [Returns]: a 32-bit bitmask of the button state that can be bitwise-compared against the @SDL_BUTTON_MASK(X)@ macro.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'captureMouse', 'getMouseState', 'getGlobalMouseState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGlobalMouseState@.
--                   The safe flavor is 'getGlobalMouseStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetGlobalMouseState@, defined at @SDL3\/SDL_mouse.h 347:50@
getGlobalMouseState
  :: BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer to receive the platform-cursor\'s x-position from the desktop\'s top left corner, can be NULL if unused.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer to receive the platform-cursor\'s y-position from the desktop\'s top left corner, can be NULL if unused.
  -> IO SDL_MouseButtonFlags
getGlobalMouseState = Unsafe.sDL_GetGlobalMouseState

-- | Query the platform for the asynchronous mouse button state and the desktop-relative platform-cursor position.
--
--     This function immediately queries the platform for the most recent asynchronous state, more costly than retrieving SDL\'s cached state in @'getMouseState'@.
--
--     Passing non-NULL pointers to @x@ or @y@ will write the destination with respective x or y coordinates relative to the desktop.
--
--     In Relative Mode, the platform-cursor\'s position usually contradicts the SDL-cursor\'s position as manually calculated from @'getMouseState'@ and 'SDL3.Sys.Video.getWindowPosition'.
--
--     This function can be useful if you need to track the mouse outside of a specific window and @'captureMouse'@ doesn\'t fit your needs. For example, it could be useful if you need to track the mouse while dragging a window, where coordinates relative to a window might not be in sync at all times.
--
--     [Returns]: a 32-bit bitmask of the button state that can be bitwise-compared against the @SDL_BUTTON_MASK(X)@ macro.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'captureMouse', 'getMouseState', 'getGlobalMouseState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGlobalMouseState@.
--                   The unsafe flavor is 'getGlobalMouseState'
--                   .
--
--     [C declaration]: @SDL_GetGlobalMouseState@, defined at @SDL3\/SDL_mouse.h 347:50@
getGlobalMouseStateSafe
  :: BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer to receive the platform-cursor\'s x-position from the desktop\'s top left corner, can be NULL if unused.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer to receive the platform-cursor\'s y-position from the desktop\'s top left corner, can be NULL if unused.
  -> IO SDL_MouseButtonFlags
getGlobalMouseStateSafe =
  Safe.sDL_GetGlobalMouseState

-- | Query SDL\'s cache for the synchronous mouse button state and accumulated mouse delta since last call.
--
--     This function returns the cached synchronous state as SDL understands it from the last pump of the event queue.
--
--     To query the platform for immediate asynchronous state, use 'getGlobalMouseState'.
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
--     [See also]: 'getMouseState', 'getGlobalMouseState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetRelativeMouseState@.
--                   The safe flavor is 'getRelativeMouseStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetRelativeMouseState@, defined at @SDL3\/SDL_mouse.h 382:50@
getRelativeMouseState
  :: BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer to receive the x mouse delta accumulated since last call, can be NULL if unused.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer to receive the y mouse delta accumulated since last call, can be NULL if unused.
  -> IO SDL_MouseButtonFlags
getRelativeMouseState =
  Unsafe.sDL_GetRelativeMouseState

-- | Query SDL\'s cache for the synchronous mouse button state and accumulated mouse delta since last call.
--
--     This function returns the cached synchronous state as SDL understands it from the last pump of the event queue.
--
--     To query the platform for immediate asynchronous state, use 'getGlobalMouseState'.
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
--     [See also]: 'getMouseState', 'getGlobalMouseState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetRelativeMouseState@.
--                   The unsafe flavor is 'getRelativeMouseState'
--                   .
--
--     [C declaration]: @SDL_GetRelativeMouseState@, defined at @SDL3\/SDL_mouse.h 382:50@
getRelativeMouseStateSafe
  :: BG.Ptr BG.CFloat
  -- ^
  --
  --           [@x@]: a pointer to receive the x mouse delta accumulated since last call, can be NULL if unused.
  -> BG.Ptr BG.CFloat
  -- ^
  --
  --           [@y@]: a pointer to receive the y mouse delta accumulated since last call, can be NULL if unused.
  -> IO SDL_MouseButtonFlags
getRelativeMouseStateSafe =
  Safe.sDL_GetRelativeMouseState

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
--     [See also]: 'warpMouseGlobal'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WarpMouseInWindow@.
--                   The safe flavor is 'warpMouseInWindowSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WarpMouseInWindow@, defined at @SDL3\/SDL_mouse.h 405:34@
warpMouseInWindow
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to move the mouse into, or NULL for the current mouse focus.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate within the window.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate within the window.
  -> IO ()
warpMouseInWindow =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_WarpMouseInWindow x00 (Coerce.coerce x11) (Coerce.coerce x22)

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
--     [See also]: 'warpMouseGlobal'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WarpMouseInWindow@.
--                   The unsafe flavor is 'warpMouseInWindow'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WarpMouseInWindow@, defined at @SDL3\/SDL_mouse.h 405:34@
warpMouseInWindowSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to move the mouse into, or NULL for the current mouse focus.
  -> Float
  -- ^
  --
  --           [@x@]: the x coordinate within the window.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate within the window.
  -> IO ()
warpMouseInWindowSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_WarpMouseInWindow x00 (Coerce.coerce x11) (Coerce.coerce x22)

-- | Move the mouse to the given position in global screen space.
--
--     This function generates a mouse motion event.
--
--     A failure of this function usually means that it is unsupported by a platform.
--
--     Note that this function will appear to succeed, but not actually move the mouse when used over Microsoft Remote Desktop.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'warpMouseInWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WarpMouseGlobal@.
--                   The safe flavor is 'warpMouseGlobalSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WarpMouseGlobal@, defined at @SDL3\/SDL_mouse.h 430:34@
warpMouseGlobal
  :: Float
  -- ^
  --
  --           [@x@]: the x coordinate.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate.
  -> IO Bool
warpMouseGlobal =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WarpMouseGlobal (Coerce.coerce x00) (Coerce.coerce x11))

-- | Move the mouse to the given position in global screen space.
--
--     This function generates a mouse motion event.
--
--     A failure of this function usually means that it is unsupported by a platform.
--
--     Note that this function will appear to succeed, but not actually move the mouse when used over Microsoft Remote Desktop.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'warpMouseInWindow'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WarpMouseGlobal@.
--                   The unsafe flavor is 'warpMouseGlobal'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WarpMouseGlobal@, defined at @SDL3\/SDL_mouse.h 430:34@
warpMouseGlobalSafe
  :: Float
  -- ^
  --
  --           [@x@]: the x coordinate.
  -> Float
  -- ^
  --
  --           [@y@]: the y coordinate.
  -> IO Bool
warpMouseGlobalSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WarpMouseGlobal (Coerce.coerce x00) (Coerce.coerce x11))

-- | Set a user-defined function by which to transform relative mouse inputs.
--
--     This overrides the relative system scale and relative speed scale hints. Should be called prior to enabling relative mouse mode, fails otherwise.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetRelativeMouseTransform@.
--                   The safe flavor is 'setRelativeMouseTransformSafe'
--                   : registration; the transform runs during event pumping.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRelativeMouseTransform@, defined at @SDL3\/SDL_mouse.h 448:34@
setRelativeMouseTransform
  :: SDL_MouseMotionTransformCallback
  -- ^
  --
  --           [@callback@]: a callback used to transform relative mouse motion, or NULL for default behavior.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that will be passed to @callback@.
  -> IO Bool
setRelativeMouseTransform =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetRelativeMouseTransform x00 x11)

-- | Set a user-defined function by which to transform relative mouse inputs.
--
--     This overrides the relative system scale and relative speed scale hints. Should be called prior to enabling relative mouse mode, fails otherwise.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetRelativeMouseTransform@.
--                   The unsafe flavor is 'setRelativeMouseTransform'
--                   : registration; the transform runs during event pumping.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetRelativeMouseTransform@, defined at @SDL3\/SDL_mouse.h 448:34@
setRelativeMouseTransformSafe
  :: SDL_MouseMotionTransformCallback
  -- ^
  --
  --           [@callback@]: a callback used to transform relative mouse motion, or NULL for default behavior.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that will be passed to @callback@.
  -> IO Bool
setRelativeMouseTransformSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetRelativeMouseTransform x00 x11)

-- | Set relative mouse mode for a window.
--
--     While the window has focus and relative mouse mode is enabled, the cursor is hidden, the mouse position is constrained to the window, and SDL will report continuous relative mouse motion even if the mouse is at the edge of the window.
--
--     If you\'d like to keep the mouse position fixed while in relative mode you can use 'SDL3.Sys.Video.setWindowMouseRect'. If you\'d like the cursor to be at a specific location when relative mode ends, you should use @'warpMouseInWindow'@ before disabling relative mode.
--
--     This function will flush any pending mouse motion for this window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowRelativeMouseMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetWindowRelativeMouseMode@.
--                   The safe flavor is 'setWindowRelativeMouseModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowRelativeMouseMode@, defined at @SDL3\/SDL_mouse.h 476:34@
setWindowRelativeMouseMode
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> Bool
  -- ^
  --
  --           [@enabled@]: true to enable relative mode, false to disable.
  -> IO Bool
setWindowRelativeMouseMode =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetWindowRelativeMouseMode x00 (CBool.fromBool x11))

-- | Set relative mouse mode for a window.
--
--     While the window has focus and relative mouse mode is enabled, the cursor is hidden, the mouse position is constrained to the window, and SDL will report continuous relative mouse motion even if the mouse is at the edge of the window.
--
--     If you\'d like to keep the mouse position fixed while in relative mode you can use 'SDL3.Sys.Video.setWindowMouseRect'. If you\'d like the cursor to be at a specific location when relative mode ends, you should use @'warpMouseInWindow'@ before disabling relative mode.
--
--     This function will flush any pending mouse motion for this window.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getWindowRelativeMouseMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetWindowRelativeMouseMode@.
--                   The unsafe flavor is 'setWindowRelativeMouseMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetWindowRelativeMouseMode@, defined at @SDL3\/SDL_mouse.h 476:34@
setWindowRelativeMouseModeSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to change.
  -> Bool
  -- ^
  --
  --           [@enabled@]: true to enable relative mode, false to disable.
  -> IO Bool
setWindowRelativeMouseModeSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetWindowRelativeMouseMode x00 (CBool.fromBool x11))

-- | Query whether relative mouse mode is enabled for a window.
--
--     [Returns]: true if relative mode is enabled for a window or false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowRelativeMouseMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetWindowRelativeMouseMode@.
--                   The safe flavor is 'getWindowRelativeMouseModeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowRelativeMouseMode@, defined at @SDL3\/SDL_mouse.h 490:34@
getWindowRelativeMouseMode
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Bool
getWindowRelativeMouseMode =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_GetWindowRelativeMouseMode x00)

-- | Query whether relative mouse mode is enabled for a window.
--
--     [Returns]: true if relative mode is enabled for a window or false otherwise.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setWindowRelativeMouseMode'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetWindowRelativeMouseMode@.
--                   The unsafe flavor is 'getWindowRelativeMouseMode'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetWindowRelativeMouseMode@, defined at @SDL3\/SDL_mouse.h 490:34@
getWindowRelativeMouseModeSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window to query.
  -> IO Bool
getWindowRelativeMouseModeSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_GetWindowRelativeMouseMode x00)

-- | Capture the mouse and to track input outside an SDL window.
--
--     Capturing enables your app to obtain mouse events globally, instead of just within your window. Not all video targets support this function. When capturing is enabled, the current window will get all mouse events, but unlike relative mode, no change is made to the cursor and it is not restrained to your window.
--
--     This function may also deny mouse input to other windows both those in your application and others on the system so you should use this function sparingly, and in small bursts. For example, you might want to track the mouse while the user is dragging something, until the user releases a mouse button. It is not recommended that you capture the mouse for long periods of time, such as the entire time your app is running. For that, you should probably use @'setWindowRelativeMouseMode'@ or 'SDL3.Sys.Video.setWindowMouseGrab', depending on your goals.
--
--     While captured, mouse events still report coordinates relative to the current (foreground) window, but those coordinates may be outside the bounds of the window (including negative values). Capturing is only allowed for the foreground window. If the window loses focus while capturing, the capture will be disabled automatically.
--
--     While capturing is enabled, the current window will have the @SDL_WINDOW_MOUSE_CAPTURE@ flag set.
--
--     Please note that SDL will attempt to \"auto capture\" the mouse while the user is pressing a button; this is to try and make mouse behavior more consistent between platforms, and deal with the common case of a user dragging the mouse outside of the window. This means that if you are calling @'captureMouse'@ only to deal with this situation, you do not have to (although it is safe to do so). If this causes problems for your app, you can disable auto capture by setting the @SDL_HINT_MOUSE_AUTO_CAPTURE@ hint to zero.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGlobalMouseState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CaptureMouse@.
--                   The safe flavor is 'captureMouseSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CaptureMouse@, defined at @SDL3\/SDL_mouse.h 538:34@
captureMouse
  :: Bool
  -- ^
  --
  --           [@enabled@]: true to enable capturing, false to disable.
  -> IO Bool
captureMouse =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_CaptureMouse (CBool.fromBool x00))

-- | Capture the mouse and to track input outside an SDL window.
--
--     Capturing enables your app to obtain mouse events globally, instead of just within your window. Not all video targets support this function. When capturing is enabled, the current window will get all mouse events, but unlike relative mode, no change is made to the cursor and it is not restrained to your window.
--
--     This function may also deny mouse input to other windows both those in your application and others on the system so you should use this function sparingly, and in small bursts. For example, you might want to track the mouse while the user is dragging something, until the user releases a mouse button. It is not recommended that you capture the mouse for long periods of time, such as the entire time your app is running. For that, you should probably use @'setWindowRelativeMouseMode'@ or 'SDL3.Sys.Video.setWindowMouseGrab', depending on your goals.
--
--     While captured, mouse events still report coordinates relative to the current (foreground) window, but those coordinates may be outside the bounds of the window (including negative values). Capturing is only allowed for the foreground window. If the window loses focus while capturing, the capture will be disabled automatically.
--
--     While capturing is enabled, the current window will have the @SDL_WINDOW_MOUSE_CAPTURE@ flag set.
--
--     Please note that SDL will attempt to \"auto capture\" the mouse while the user is pressing a button; this is to try and make mouse behavior more consistent between platforms, and deal with the common case of a user dragging the mouse outside of the window. This means that if you are calling @'captureMouse'@ only to deal with this situation, you do not have to (although it is safe to do so). If this causes problems for your app, you can disable auto capture by setting the @SDL_HINT_MOUSE_AUTO_CAPTURE@ hint to zero.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getGlobalMouseState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CaptureMouse@.
--                   The unsafe flavor is 'captureMouse'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CaptureMouse@, defined at @SDL3\/SDL_mouse.h 538:34@
captureMouseSafe
  :: Bool
  -- ^
  --
  --           [@enabled@]: true to enable capturing, false to disable.
  -> IO Bool
captureMouseSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_CaptureMouse (CBool.fromBool x00))

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
--     Cursors created with this function must be freed with @'destroyCursor'@.
--
--     If you want to have a color cursor, or create your cursor from an SDL_Surface, you should use @'createColorCursor'@. Alternately, you can hide the cursor and draw your own as part of your game\'s rendering, but it will be bound to the framerate.
--
--     Also, @'createSystemCursor'@ is available, which provides several readily-available system cursors to pick from.
--
--     [Returns]: a new cursor with the specified parameters on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createAnimatedCursor', 'createColorCursor', 'createSystemCursor', 'destroyCursor', 'setCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateCursor@.
--                   The safe flavor is 'createCursorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateCursor@, defined at @SDL3\/SDL_mouse.h 585:42@
createCursor
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@data@]: the color value for each pixel of the cursor.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@mask@]: the mask value for each pixel of the cursor.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the cursor.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the cursor.
  -> BG.Int32
  -- ^
  --
  --           [@hot_x@]: the x-axis offset from the left of the cursor image to the mouse x position, in the range of 0 to @w@ - 1.
  -> BG.Int32
  -- ^
  --
  --           [@hot_y@]: the y-axis offset from the top of the cursor image to the mouse y position, in the range of 0 to @h@ - 1.
  -> IO (BG.Ptr SDL_Cursor)
createCursor =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Unsafe.sDL_CreateCursor
                x00
                x11
                (Coerce.coerce x22)
                (Coerce.coerce x33)
                (Coerce.coerce x44)
                (Coerce.coerce x55)

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
--     Cursors created with this function must be freed with @'destroyCursor'@.
--
--     If you want to have a color cursor, or create your cursor from an SDL_Surface, you should use @'createColorCursor'@. Alternately, you can hide the cursor and draw your own as part of your game\'s rendering, but it will be bound to the framerate.
--
--     Also, @'createSystemCursor'@ is available, which provides several readily-available system cursors to pick from.
--
--     [Returns]: a new cursor with the specified parameters on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createAnimatedCursor', 'createColorCursor', 'createSystemCursor', 'destroyCursor', 'setCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateCursor@.
--                   The unsafe flavor is 'createCursor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateCursor@, defined at @SDL3\/SDL_mouse.h 585:42@
createCursorSafe
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@data@]: the color value for each pixel of the cursor.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@mask@]: the mask value for each pixel of the cursor.
  -> BG.Int32
  -- ^
  --
  --           [@w@]: the width of the cursor.
  -> BG.Int32
  -- ^
  --
  --           [@h@]: the height of the cursor.
  -> BG.Int32
  -- ^
  --
  --           [@hot_x@]: the x-axis offset from the left of the cursor image to the mouse x position, in the range of 0 to @w@ - 1.
  -> BG.Int32
  -- ^
  --
  --           [@hot_y@]: the y-axis offset from the top of the cursor image to the mouse y position, in the range of 0 to @h@ - 1.
  -> IO (BG.Ptr SDL_Cursor)
createCursorSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Safe.sDL_CreateCursor
                x00
                x11
                (Coerce.coerce x22)
                (Coerce.coerce x33)
                (Coerce.coerce x44)
                (Coerce.coerce x55)

-- | Create a color cursor.
--
--     If this function is passed a surface with alternate representations added with 'SDL3.Sys.Surface.addSurfaceAlternateImage', the surface will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations if SDL_HINT_MOUSE_DPI_SCALE_CURSORS is enabled. For example, if the original surface is 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     [Returns]: the new cursor on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Surface.addSurfaceAlternateImage', 'createAnimatedCursor', 'createCursor', 'createSystemCursor', 'destroyCursor', 'setCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateColorCursor@.
--                   The safe flavor is 'createColorCursorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateColorCursor@, defined at @SDL3\/SDL_mouse.h 622:42@
createColorCursor
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: an SDL_Surface structure representing the cursor image.
  -> BG.Int32
  -- ^
  --
  --           [@hot_x@]: the x position of the cursor hot spot.
  -> BG.Int32
  -- ^
  --
  --           [@hot_y@]: the y position of the cursor hot spot.
  -> IO (BG.Ptr SDL_Cursor)
createColorCursor =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_CreateColorCursor x00 (Coerce.coerce x11) (Coerce.coerce x22)

-- | Create a color cursor.
--
--     If this function is passed a surface with alternate representations added with 'SDL3.Sys.Surface.addSurfaceAlternateImage', the surface will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations if SDL_HINT_MOUSE_DPI_SCALE_CURSORS is enabled. For example, if the original surface is 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     [Returns]: the new cursor on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Surface.addSurfaceAlternateImage', 'createAnimatedCursor', 'createCursor', 'createSystemCursor', 'destroyCursor', 'setCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateColorCursor@.
--                   The unsafe flavor is 'createColorCursor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateColorCursor@, defined at @SDL3\/SDL_mouse.h 622:42@
createColorCursorSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^
  --
  --           [@surface@]: an SDL_Surface structure representing the cursor image.
  -> BG.Int32
  -- ^
  --
  --           [@hot_x@]: the x position of the cursor hot spot.
  -> BG.Int32
  -- ^
  --
  --           [@hot_y@]: the y position of the cursor hot spot.
  -> IO (BG.Ptr SDL_Cursor)
createColorCursorSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_CreateColorCursor x00 (Coerce.coerce x11) (Coerce.coerce x22)

-- | Create an animated color cursor.
--
--     Animated cursors are composed of a sequential array of frames, specified as surfaces and durations in an array of 'SDL_CursorFrameInfo' structs. The hot spot coordinates are universal to all frames, and all frames must have the same dimensions.
--
--     Frame durations are specified in milliseconds. A duration of 0 implies an infinite frame time, and the animation will stop on that frame. To create a one-shot animation, set the duration of the last frame in the sequence to 0.
--
--     If this function is passed surfaces with alternate representations added with 'SDL3.Sys.Surface.addSurfaceAlternateImage', the surfaces will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations. For example, if the original surfaces are 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     If the underlying platform does not support animated cursors, this function will fall back to creating a static color cursor using the first frame in the sequence.
--
--     [Returns]: the new cursor on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'SDL3.Sys.Surface.addSurfaceAlternateImage', 'createCursor', 'createColorCursor', 'createSystemCursor', 'destroyCursor', 'setCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateAnimatedCursor@.
--                   The safe flavor is 'createAnimatedCursorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateAnimatedCursor@, defined at @SDL3\/SDL_mouse.h 672:41@
createAnimatedCursor
  :: BG.Ptr SDL_CursorFrameInfo
  -- ^
  --
  --           [@frames@]: an array of cursor images composing the animation.
  -> BG.Int32
  -- ^
  --
  --           [@frame_count@]: the number of frames in the sequence.
  -> BG.Int32
  -- ^
  --
  --           [@hot_x@]: the x position of the cursor hot spot.
  -> BG.Int32
  -- ^
  --
  --           [@hot_y@]: the y position of the cursor hot spot.
  -> IO (BG.Ptr SDL_Cursor)
createAnimatedCursor =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Unsafe.sDL_CreateAnimatedCursor x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33)

-- | Create an animated color cursor.
--
--     Animated cursors are composed of a sequential array of frames, specified as surfaces and durations in an array of 'SDL_CursorFrameInfo' structs. The hot spot coordinates are universal to all frames, and all frames must have the same dimensions.
--
--     Frame durations are specified in milliseconds. A duration of 0 implies an infinite frame time, and the animation will stop on that frame. To create a one-shot animation, set the duration of the last frame in the sequence to 0.
--
--     If this function is passed surfaces with alternate representations added with 'SDL3.Sys.Surface.addSurfaceAlternateImage', the surfaces will be interpreted as the content to be used for 100% display scale, and the alternate representations will be used for high DPI situations. For example, if the original surfaces are 32x32, then on a 2x macOS display or 200% display scale on Windows, a 64x64 version of the image will be used, if available. If a matching version of the image isn\'t available, the closest larger size image will be downscaled to the appropriate size and be used instead, if available. Otherwise, the closest smaller image will be upscaled and be used instead.
--
--     If the underlying platform does not support animated cursors, this function will fall back to creating a static color cursor using the first frame in the sequence.
--
--     [Returns]: the new cursor on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.4.0
--
--     [See also]: 'SDL3.Sys.Surface.addSurfaceAlternateImage', 'createCursor', 'createColorCursor', 'createSystemCursor', 'destroyCursor', 'setCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateAnimatedCursor@.
--                   The unsafe flavor is 'createAnimatedCursor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateAnimatedCursor@, defined at @SDL3\/SDL_mouse.h 672:41@
createAnimatedCursorSafe
  :: BG.Ptr SDL_CursorFrameInfo
  -- ^
  --
  --           [@frames@]: an array of cursor images composing the animation.
  -> BG.Int32
  -- ^
  --
  --           [@frame_count@]: the number of frames in the sequence.
  -> BG.Int32
  -- ^
  --
  --           [@hot_x@]: the x position of the cursor hot spot.
  -> BG.Int32
  -- ^
  --
  --           [@hot_y@]: the y position of the cursor hot spot.
  -> IO (BG.Ptr SDL_Cursor)
createAnimatedCursorSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          Safe.sDL_CreateAnimatedCursor x00 (Coerce.coerce x11) (Coerce.coerce x22) (Coerce.coerce x33)

-- | Create a system cursor.
--
--     [Returns]: a cursor on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateSystemCursor@.
--                   The safe flavor is 'createSystemCursorSafe'
--                   .
--
--     [C declaration]: @SDL_CreateSystemCursor@, defined at @SDL3\/SDL_mouse.h 690:42@
createSystemCursor
  :: SDL_SystemCursor
  -- ^
  --
  --           [@id@]: an 'SDL_SystemCursor' enum value.
  -> IO (BG.Ptr SDL_Cursor)
createSystemCursor = Unsafe.sDL_CreateSystemCursor

-- | Create a system cursor.
--
--     [Returns]: a cursor on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateSystemCursor@.
--                   The unsafe flavor is 'createSystemCursor'
--                   .
--
--     [C declaration]: @SDL_CreateSystemCursor@, defined at @SDL3\/SDL_mouse.h 690:42@
createSystemCursorSafe
  :: SDL_SystemCursor
  -- ^
  --
  --           [@id@]: an 'SDL_SystemCursor' enum value.
  -> IO (BG.Ptr SDL_Cursor)
createSystemCursorSafe = Safe.sDL_CreateSystemCursor

-- | Set the active cursor.
--
--     This function sets the currently active cursor to the specified one. If the cursor is currently visible, the change will be immediately represented on the display. SDL_SetCursor(NULL) can be used to force cursor redraw, if this is desired for any reason.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetCursor@.
--                   The safe flavor is 'setCursorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetCursor@, defined at @SDL3\/SDL_mouse.h 710:34@
setCursor
  :: BG.Ptr SDL_Cursor
  -- ^
  --
  --           [@cursor@]: a cursor to make active.
  -> IO Bool
setCursor =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_SetCursor x00)

-- | Set the active cursor.
--
--     This function sets the currently active cursor to the specified one. If the cursor is currently visible, the change will be immediately represented on the display. SDL_SetCursor(NULL) can be used to force cursor redraw, if this is desired for any reason.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetCursor@.
--                   The unsafe flavor is 'setCursor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetCursor@, defined at @SDL3\/SDL_mouse.h 710:34@
setCursorSafe
  :: BG.Ptr SDL_Cursor
  -- ^
  --
  --           [@cursor@]: a cursor to make active.
  -> IO Bool
setCursorSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_SetCursor x00)

-- | Get the active cursor.
--
--     This function returns a pointer to the current cursor which is owned by the library. It is not necessary to free the cursor with @'destroyCursor'@.
--
--     [Returns]: the active cursor or NULL if there is no mouse.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCursor@.
--                   The safe flavor is 'getCursorSafe'
--                   .
--
--     [C declaration]: @SDL_GetCursor@, defined at @SDL3\/SDL_mouse.h 726:42@
getCursor :: IO (BG.Ptr SDL_Cursor)
getCursor = Unsafe.sDL_GetCursor

-- | Get the active cursor.
--
--     This function returns a pointer to the current cursor which is owned by the library. It is not necessary to free the cursor with @'destroyCursor'@.
--
--     [Returns]: the active cursor or NULL if there is no mouse.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCursor@.
--                   The unsafe flavor is 'getCursor'
--                   .
--
--     [C declaration]: @SDL_GetCursor@, defined at @SDL3\/SDL_mouse.h 726:42@
getCursorSafe :: IO (BG.Ptr SDL_Cursor)
getCursorSafe = Safe.sDL_GetCursor

-- | Get the default cursor.
--
--     You do not have to call @'destroyCursor'@ on the return value, but it is safe to do so.
--
--     [Returns]: the default cursor on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDefaultCursor@.
--                   The safe flavor is 'getDefaultCursorSafe'
--                   .
--
--     [C declaration]: @SDL_GetDefaultCursor@, defined at @SDL3\/SDL_mouse.h 741:42@
getDefaultCursor :: IO (BG.Ptr SDL_Cursor)
getDefaultCursor = Unsafe.sDL_GetDefaultCursor

-- | Get the default cursor.
--
--     You do not have to call @'destroyCursor'@ on the return value, but it is safe to do so.
--
--     [Returns]: the default cursor on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDefaultCursor@.
--                   The unsafe flavor is 'getDefaultCursor'
--                   .
--
--     [C declaration]: @SDL_GetDefaultCursor@, defined at @SDL3\/SDL_mouse.h 741:42@
getDefaultCursorSafe :: IO (BG.Ptr SDL_Cursor)
getDefaultCursorSafe = Safe.sDL_GetDefaultCursor

-- | Free a previously-created cursor.
--
--     Use this function to free cursor resources created with @'createCursor'@, @'createColorCursor'@ or @'createSystemCursor'@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createAnimatedCursor', 'createColorCursor', 'createCursor', 'createSystemCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyCursor@.
--                   The safe flavor is 'destroyCursorSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyCursor@, defined at @SDL3\/SDL_mouse.h 760:34@
destroyCursor
  :: BG.Ptr SDL_Cursor
  -- ^
  --
  --           [@cursor@]: the cursor to free.
  -> IO ()
destroyCursor = Unsafe.sDL_DestroyCursor

-- | Free a previously-created cursor.
--
--     Use this function to free cursor resources created with @'createCursor'@, @'createColorCursor'@ or @'createSystemCursor'@.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'createAnimatedCursor', 'createColorCursor', 'createCursor', 'createSystemCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyCursor@.
--                   The unsafe flavor is 'destroyCursor'
--                   .
--
--     [C declaration]: @SDL_DestroyCursor@, defined at @SDL3\/SDL_mouse.h 760:34@
destroyCursorSafe
  :: BG.Ptr SDL_Cursor
  -- ^
  --
  --           [@cursor@]: the cursor to free.
  -> IO ()
destroyCursorSafe = Safe.sDL_DestroyCursor

-- | Show the cursor.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'cursorVisible', 'hideCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ShowCursor@.
--                   The safe flavor is 'showCursorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowCursor@, defined at @SDL3\/SDL_mouse.h 775:34@
showCursor :: IO Bool
showCursor = fmap CBool.toBool Unsafe.sDL_ShowCursor

-- | Show the cursor.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'cursorVisible', 'hideCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShowCursor@.
--                   The unsafe flavor is 'showCursor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowCursor@, defined at @SDL3\/SDL_mouse.h 775:34@
showCursorSafe :: IO Bool
showCursorSafe =
  fmap CBool.toBool Safe.sDL_ShowCursor

-- | Hide the cursor.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'cursorVisible', 'showCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HideCursor@.
--                   The safe flavor is 'hideCursorSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HideCursor@, defined at @SDL3\/SDL_mouse.h 790:34@
hideCursor :: IO Bool
hideCursor = fmap CBool.toBool Unsafe.sDL_HideCursor

-- | Hide the cursor.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'cursorVisible', 'showCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HideCursor@.
--                   The unsafe flavor is 'hideCursor'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HideCursor@, defined at @SDL3\/SDL_mouse.h 790:34@
hideCursorSafe :: IO Bool
hideCursorSafe =
  fmap CBool.toBool Safe.sDL_HideCursor

-- | Return whether the cursor is currently being shown.
--
--     [Returns]: @true@ if the cursor is being shown, or @false@ if the cursor is hidden.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hideCursor', 'showCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CursorVisible@.
--                   The safe flavor is 'cursorVisibleSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CursorVisible@, defined at @SDL3\/SDL_mouse.h 805:34@
cursorVisible :: IO Bool
cursorVisible =
  fmap CBool.toBool Unsafe.sDL_CursorVisible

-- | Return whether the cursor is currently being shown.
--
--     [Returns]: @true@ if the cursor is being shown, or @false@ if the cursor is hidden.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hideCursor', 'showCursor'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CursorVisible@.
--                   The unsafe flavor is 'cursorVisible'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CursorVisible@, defined at @SDL3\/SDL_mouse.h 805:34@
cursorVisibleSafe :: IO Bool
cursorVisibleSafe =
  fmap CBool.toBool Safe.sDL_CursorVisible

-- | Typed constant for macro @SDL_BUTTON_LMASK@. Combine with @.|.@ from "Data.Bits".
pattern SDL_BUTTON_LMASK :: SDL_MouseButtonFlags
pattern SDL_BUTTON_LMASK = SDL_MouseButtonFlags 0x00000001

-- | Typed constant for macro @SDL_BUTTON_MMASK@. Combine with @.|.@ from "Data.Bits".
pattern SDL_BUTTON_MMASK :: SDL_MouseButtonFlags
pattern SDL_BUTTON_MMASK = SDL_MouseButtonFlags 0x00000002

-- | Typed constant for macro @SDL_BUTTON_RMASK@. Combine with @.|.@ from "Data.Bits".
pattern SDL_BUTTON_RMASK :: SDL_MouseButtonFlags
pattern SDL_BUTTON_RMASK = SDL_MouseButtonFlags 0x00000004

-- | Typed constant for macro @SDL_BUTTON_X1MASK@. Combine with @.|.@ from "Data.Bits".
pattern SDL_BUTTON_X1MASK :: SDL_MouseButtonFlags
pattern SDL_BUTTON_X1MASK = SDL_MouseButtonFlags 0x00000008

-- | Typed constant for macro @SDL_BUTTON_X2MASK@. Combine with @.|.@ from "Data.Bits".
pattern SDL_BUTTON_X2MASK :: SDL_MouseButtonFlags
pattern SDL_BUTTON_X2MASK = SDL_MouseButtonFlags 0x00000010
