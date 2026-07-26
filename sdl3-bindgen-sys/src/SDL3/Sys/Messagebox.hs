{-# LANGUAGE PatternSynonyms #-}

-- | SDL offers a simple message box API, which is useful for simple alerts, such as informing the user when something fatal happens at startup without the need to build a UI for it (or informing the user /before/ your UI is ready).
--
--     These message boxes are native system dialogs where possible.
--
--     There is both a customizable function (@'showMessageBox'@) that offers lots of options for what to display and reports on what choice the user made, and also a much-simplified version (@'showSimpleMessageBox'@), merely takes a text message and title, and waits until the user presses a single \"OK\" UI button. Often, this is all that is necessary. Message box flags.
--
--     If supported will display warning icon, etc.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Messagebox.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Messagebox (
  module SDL3.Sys.Bindgen.Messagebox,

  -- * Typed constants
  pattern SDL3.Sys.Messagebox.SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT,
  pattern SDL3.Sys.Messagebox.SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT,
  pattern SDL3.Sys.Messagebox.SDL_MESSAGEBOX_ERROR,
  pattern SDL3.Sys.Messagebox.SDL_MESSAGEBOX_WARNING,
  pattern SDL3.Sys.Messagebox.SDL_MESSAGEBOX_INFORMATION,
  pattern SDL3.Sys.Messagebox.SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT,
  pattern SDL3.Sys.Messagebox.SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT,

  -- * Function aliases
  SDL3.Sys.Messagebox.showMessageBox,
  SDL3.Sys.Messagebox.showMessageBoxSafe,
  SDL3.Sys.Messagebox.showSimpleMessageBox,
  SDL3.Sys.Messagebox.showSimpleMessageBoxSafe,
)
where

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Messagebox
import SDL3.Sys.Bindgen.Messagebox.Safe qualified as Safe
import SDL3.Sys.Bindgen.Messagebox.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Video qualified

-- | Create a modal message box.
--
--     If your needs aren\'t complex, it might be easier to use 'showSimpleMessageBox'.
--
--     This function should be called on the thread that created the parent window, or on the main thread if the messagebox has no parent. It will block execution of that thread until the user clicks a button or closes the messagebox.
--
--     This function may be called at any time, even before 'SDL3.Sys.Init.init'. This makes it useful for reporting errors like a failure to create a renderer or OpenGL context.
--
--     On X11, SDL rolls its own dialog box with X11 primitives instead of a formal toolkit like GTK+ or Qt.
--
--     Note that if 'SDL3.Sys.Init.init' would fail because there isn\'t any available video target, this function is likely to fail for the same reasons. If this is a concern, check the return value from this function and fall back to writing to stderr if you can.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'showSimpleMessageBox'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ShowMessageBox@.
--                   The safe flavor is 'showMessageBoxSafe'
--                   : modal; blocks until dismissed.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowMessageBox@, defined at @SDL3\/SDL_messagebox.h 177:34@
showMessageBox
  :: PtrConst.PtrConst SDL_MessageBoxData
  -- ^
  --
  --           [@messageboxdata@]: the 'SDL_MessageBoxData' structure with title, text and other options.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@buttonid@]: the pointer to which user id of hit button should be copied.
  -> IO Bool
showMessageBox =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ShowMessageBox x00 x11)

-- | Create a modal message box.
--
--     If your needs aren\'t complex, it might be easier to use 'showSimpleMessageBox'.
--
--     This function should be called on the thread that created the parent window, or on the main thread if the messagebox has no parent. It will block execution of that thread until the user clicks a button or closes the messagebox.
--
--     This function may be called at any time, even before 'SDL3.Sys.Init.init'. This makes it useful for reporting errors like a failure to create a renderer or OpenGL context.
--
--     On X11, SDL rolls its own dialog box with X11 primitives instead of a formal toolkit like GTK+ or Qt.
--
--     Note that if 'SDL3.Sys.Init.init' would fail because there isn\'t any available video target, this function is likely to fail for the same reasons. If this is a concern, check the return value from this function and fall back to writing to stderr if you can.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'showSimpleMessageBox'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShowMessageBox@.
--                   The unsafe flavor is 'showMessageBox'
--                   : modal; blocks until dismissed.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowMessageBox@, defined at @SDL3\/SDL_messagebox.h 177:34@
showMessageBoxSafe
  :: PtrConst.PtrConst SDL_MessageBoxData
  -- ^
  --
  --           [@messageboxdata@]: the 'SDL_MessageBoxData' structure with title, text and other options.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@buttonid@]: the pointer to which user id of hit button should be copied.
  -> IO Bool
showMessageBoxSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ShowMessageBox x00 x11)

-- | Display a simple modal message box.
--
--     If your needs aren\'t complex, this function is preferred over 'showMessageBox'.
--
--     @flags@ may be any of the following:
--
--     * @'sDL_MESSAGEBOX_ERROR'@: error dialog
--
--     * @'sDL_MESSAGEBOX_WARNING'@: warning dialog
--
--     * @'sDL_MESSAGEBOX_INFORMATION'@: informational dialog
--
--     This function should be called on the thread that created the parent window, or on the main thread if the messagebox has no parent. It will block execution of that thread until the user clicks a button or closes the messagebox.
--
--     This function may be called at any time, even before 'SDL3.Sys.Init.init'. This makes it useful for reporting errors like a failure to create a renderer or OpenGL context.
--
--     On X11, SDL rolls its own dialog box with X11 primitives instead of a formal toolkit like GTK+ or Qt.
--
--     Note that if 'SDL3.Sys.Init.init' would fail because there isn\'t any available video target, this function is likely to fail for the same reasons. If this is a concern, check the return value from this function and fall back to writing to stderr if you can.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'showMessageBox'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ShowSimpleMessageBox@.
--                   The safe flavor is 'showSimpleMessageBoxSafe'
--                   : modal; blocks until dismissed.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowSimpleMessageBox@, defined at @SDL3\/SDL_messagebox.h 221:34@
showSimpleMessageBox
  :: SDL_MessageBoxFlags
  -- ^
  --
  --           [@flags@]: an 'SDL_MessageBoxFlags' value.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: UTF-8 title text.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: UTF-8 message text.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the parent window, or NULL for no parent.
  -> IO Bool
showSimpleMessageBox =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_ShowSimpleMessageBox x00 x11 x22 x33)

-- | Display a simple modal message box.
--
--     If your needs aren\'t complex, this function is preferred over 'showMessageBox'.
--
--     @flags@ may be any of the following:
--
--     * @'sDL_MESSAGEBOX_ERROR'@: error dialog
--
--     * @'sDL_MESSAGEBOX_WARNING'@: warning dialog
--
--     * @'sDL_MESSAGEBOX_INFORMATION'@: informational dialog
--
--     This function should be called on the thread that created the parent window, or on the main thread if the messagebox has no parent. It will block execution of that thread until the user clicks a button or closes the messagebox.
--
--     This function may be called at any time, even before 'SDL3.Sys.Init.init'. This makes it useful for reporting errors like a failure to create a renderer or OpenGL context.
--
--     On X11, SDL rolls its own dialog box with X11 primitives instead of a formal toolkit like GTK+ or Qt.
--
--     Note that if 'SDL3.Sys.Init.init' would fail because there isn\'t any available video target, this function is likely to fail for the same reasons. If this is a concern, check the return value from this function and fall back to writing to stderr if you can.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'showMessageBox'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShowSimpleMessageBox@.
--                   The unsafe flavor is 'showSimpleMessageBox'
--                   : modal; blocks until dismissed.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowSimpleMessageBox@, defined at @SDL3\/SDL_messagebox.h 221:34@
showSimpleMessageBoxSafe
  :: SDL_MessageBoxFlags
  -- ^
  --
  --           [@flags@]: an 'SDL_MessageBoxFlags' value.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@title@]: UTF-8 title text.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: UTF-8 message text.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the parent window, or NULL for no parent.
  -> IO Bool
showSimpleMessageBoxSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_ShowSimpleMessageBox x00 x11 x22 x33)

-- | Typed constant for macro @SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT@. Combine with @.|.@ from "Data.Bits".
pattern SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT :: SDL_MessageBoxButtonFlags
pattern SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = SDL_MessageBoxButtonFlags 0x00000001

-- | Typed constant for macro @SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT@. Combine with @.|.@ from "Data.Bits".
pattern SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT :: SDL_MessageBoxButtonFlags
pattern SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = SDL_MessageBoxButtonFlags 0x00000002

-- | Typed constant for macro @SDL_MESSAGEBOX_ERROR@. Combine with @.|.@ from "Data.Bits".
pattern SDL_MESSAGEBOX_ERROR :: SDL_MessageBoxFlags
pattern SDL_MESSAGEBOX_ERROR = SDL_MessageBoxFlags 0x00000010

-- | Typed constant for macro @SDL_MESSAGEBOX_WARNING@. Combine with @.|.@ from "Data.Bits".
pattern SDL_MESSAGEBOX_WARNING :: SDL_MessageBoxFlags
pattern SDL_MESSAGEBOX_WARNING = SDL_MessageBoxFlags 0x00000020

-- | Typed constant for macro @SDL_MESSAGEBOX_INFORMATION@. Combine with @.|.@ from "Data.Bits".
pattern SDL_MESSAGEBOX_INFORMATION :: SDL_MessageBoxFlags
pattern SDL_MESSAGEBOX_INFORMATION = SDL_MessageBoxFlags 0x00000040

-- | Typed constant for macro @SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT@. Combine with @.|.@ from "Data.Bits".
pattern SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT :: SDL_MessageBoxFlags
pattern SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = SDL_MessageBoxFlags 0x00000080

-- | Typed constant for macro @SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT@. Combine with @.|.@ from "Data.Bits".
pattern SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT :: SDL_MessageBoxFlags
pattern SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = SDL_MessageBoxFlags 0x00000100
