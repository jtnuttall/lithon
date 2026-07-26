-- | File dialog support.
--
--     SDL offers file dialogs, to let users select files with native GUI interfaces. There are \"open\" dialogs, \"save\" dialogs, and folder selection dialogs. The app can control some details, such as filtering to specific files, or whether multiple files can be selected by the user.
--
--     Note that launching a file dialog is a non-blocking operation; control returns to the app immediately, and a callback is called later (possibly in another thread) when the user makes a choice. An entry for filters for file dialogs.
--
--     @name@ is a user-readable label for the filter (for example, \"Office document\").
--
--     @pattern@ is a semicolon-separated list of file extensions (for example, \"doc;docx\"). File extensions may only contain alphanumeric characters, hyphens, underscores and periods. Alternatively, the whole string can be a single asterisk (\"*\"), which serves as an \"All files\" filter.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DialogFileCallback', 'showOpenFileDialogSafe', 'showSaveFileDialogSafe', 'showOpenFolderDialogSafe', 'showFileDialogWithPropertiesSafe'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Dialog.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Dialog (
  module SDL3.Sys.Bindgen.Dialog,

  -- * Function aliases
  SDL3.Sys.Dialog.showOpenFileDialogSafe,
  SDL3.Sys.Dialog.showSaveFileDialogSafe,
  SDL3.Sys.Dialog.showOpenFolderDialogSafe,
  SDL3.Sys.Dialog.showFileDialogWithPropertiesSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Dialog
import SDL3.Sys.Bindgen.Dialog.Safe qualified as Safe
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Video qualified

-- | Displays a dialog that lets the user select a file on their filesystem.
--
--     This is an asynchronous function; it will return immediately, and the result will be passed to the callback.
--
--     The callback will be invoked with a null-terminated list of files the user chose. The list will be empty if the user canceled the dialog, and it will be NULL if an error occurred.
--
--     Note that the callback may be called from a different thread than the one the function was invoked on.
--
--     Depending on the platform, the user may be allowed to input paths that don\'t yet exist.
--
--     On Linux, dialogs may require XDG Portals, which requires DBus, which requires an event-handling loop. Apps that do not use SDL to handle events should add a call to 'SDL3.Sys.Events.pumpEvents' in their main loop.
--
--     [Thread safety]: This function should be called only from the main thread. The callback may be invoked from the same thread or from a different one, depending on the OS\'s constraints.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DialogFileCallback', 'SDL_DialogFileFilter', 'showSaveFileDialogSafe', 'showOpenFolderDialogSafe', 'showFileDialogWithPropertiesSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShowOpenFileDialog@.
--                   The unsafe import is not exported
--                   : may invoke the callback synchronously on validation failure.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Dialog.Unsafe.sDL_ShowOpenFileDialog@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowOpenFileDialog@, defined at @SDL3\/SDL_dialog.h 166:34@
showOpenFileDialogSafe
  :: SDL_DialogFileCallback
  -- ^
  --
  --           [@callback@]: a function pointer to be invoked when the user selects a file and accepts, or cancels the dialog, or an error occurs.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an optional pointer to pass extra data to the callback when it will be invoked.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window that the dialog should be modal for, may be NULL. Not all platforms support this option.
  -> PtrConst.PtrConst SDL_DialogFileFilter
  -- ^
  --
  --           [@filters@]: a list of filters, may be NULL. See the [@SDL_DialogFileFilter@](https://wiki.libsdl.org/SDL3/SDL_DialogFileFilter#code-examples) documentation for examples]. Not all platforms support this option, and platforms that do support it may allow the user to ignore the filters. If non-NULL, it must remain valid at least until the callback is invoked.
  -> BG.Int32
  -- ^
  --
  --           [@nfilters@]: the number of filters. Ignored if filters is NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@default_location@]: the default folder or file to start the dialog at, may be NULL. Not all platforms support this option.
  -> Bool
  -- ^
  --
  --           [@allow_many@]: if non-zero, the user will be allowed to select multiple entries. Not all platforms support this option.
  -> IO ()
showOpenFileDialogSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              \x66 ->
                Safe.sDL_ShowOpenFileDialog x00 x11 x22 x33 (Coerce.coerce x44) x55 (CBool.fromBool x66)

-- | Displays a dialog that lets the user choose a new or existing file on their filesystem.
--
--     This is an asynchronous function; it will return immediately, and the result will be passed to the callback.
--
--     The callback will be invoked with a null-terminated list of files the user chose. The list will be empty if the user canceled the dialog, and it will be NULL if an error occurred.
--
--     Note that the callback may be called from a different thread than the one the function was invoked on.
--
--     The chosen file may or may not already exist.
--
--     On Linux, dialogs may require XDG Portals, which requires DBus, which requires an event-handling loop. Apps that do not use SDL to handle events should add a call to 'SDL3.Sys.Events.pumpEvents' in their main loop.
--
--     [Thread safety]: This function should be called only from the main thread. The callback may be invoked from the same thread or from a different one, depending on the OS\'s constraints.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DialogFileCallback', 'SDL_DialogFileFilter', 'showOpenFileDialogSafe', 'showOpenFolderDialogSafe', 'showFileDialogWithPropertiesSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShowSaveFileDialog@.
--                   The unsafe import is not exported
--                   : may invoke the callback synchronously on validation failure.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Dialog.Unsafe.sDL_ShowSaveFileDialog@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowSaveFileDialog@, defined at @SDL3\/SDL_dialog.h 215:34@
showSaveFileDialogSafe
  :: SDL_DialogFileCallback
  -- ^
  --
  --           [@callback@]: a function pointer to be invoked when the user selects a file and accepts, or cancels the dialog, or an error occurs.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an optional pointer to pass extra data to the callback when it will be invoked.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window that the dialog should be modal for, may be NULL. Not all platforms support this option.
  -> PtrConst.PtrConst SDL_DialogFileFilter
  -- ^
  --
  --           [@filters@]: a list of filters, may be NULL. Not all platforms support this option, and platforms that do support it may allow the user to ignore the filters. If non-NULL, it must remain valid at least until the callback is invoked.
  -> BG.Int32
  -- ^
  --
  --           [@nfilters@]: the number of filters. Ignored if filters is NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@default_location@]: the default folder or file to start the dialog at, may be NULL. Not all platforms support this option.
  -> IO ()
showSaveFileDialogSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              Safe.sDL_ShowSaveFileDialog x00 x11 x22 x33 (Coerce.coerce x44) x55

-- | Displays a dialog that lets the user select a folder on their filesystem.
--
--     This is an asynchronous function; it will return immediately, and the result will be passed to the callback.
--
--     The callback will be invoked with a null-terminated list of files the user chose. The list will be empty if the user canceled the dialog, and it will be NULL if an error occurred.
--
--     Note that the callback may be called from a different thread than the one the function was invoked on.
--
--     Depending on the platform, the user may be allowed to input paths that don\'t yet exist.
--
--     On Linux, dialogs may require XDG Portals, which requires DBus, which requires an event-handling loop. Apps that do not use SDL to handle events should add a call to 'SDL3.Sys.Events.pumpEvents' in their main loop.
--
--     [Thread safety]: This function should be called only from the main thread. The callback may be invoked from the same thread or from a different one, depending on the OS\'s constraints.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DialogFileCallback', 'showOpenFileDialogSafe', 'showSaveFileDialogSafe', 'showFileDialogWithPropertiesSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShowOpenFolderDialog@.
--                   The unsafe import is not exported
--                   : may invoke the callback synchronously on validation failure.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Dialog.Unsafe.sDL_ShowOpenFolderDialog@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShowOpenFolderDialog@, defined at @SDL3\/SDL_dialog.h 260:34@
showOpenFolderDialogSafe
  :: SDL_DialogFileCallback
  -- ^
  --
  --           [@callback@]: a function pointer to be invoked when the user selects a file and accepts, or cancels the dialog, or an error occurs.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an optional pointer to pass extra data to the callback when it will be invoked.
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^
  --
  --           [@window@]: the window that the dialog should be modal for, may be NULL. Not all platforms support this option.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@default_location@]: the default folder or file to start the dialog at, may be NULL. Not all platforms support this option.
  -> Bool
  -- ^
  --
  --           [@allow_many@]: if non-zero, the user will be allowed to select multiple entries. Not all platforms support this option.
  -> IO ()
showOpenFolderDialogSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            Safe.sDL_ShowOpenFolderDialog x00 x11 x22 x33 (CBool.fromBool x44)

-- | Create and launch a file dialog with the specified properties.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_FILE_DIALOG_FILTERS_POINTER'@: a pointer to a list of 'SDL_DialogFileFilter' structs, which will be used as filters for file-based selections. Ignored if the dialog is an \"Open Folder\" dialog. If non-NULL, the array of filters must remain valid at least until the callback is invoked.
--
--     * @'sDL_PROP_FILE_DIALOG_NFILTERS_NUMBER'@: the number of filters in the array of filters, if it exists.
--
--     * @'sDL_PROP_FILE_DIALOG_WINDOW_POINTER'@: the window that the dialog should be modal for.
--
--     * @'sDL_PROP_FILE_DIALOG_LOCATION_STRING'@: the default folder or file to start the dialog at.
--
--     * @'sDL_PROP_FILE_DIALOG_MANY_BOOLEAN'@: true to allow the user to select more than one entry.
--
--     * @'sDL_PROP_FILE_DIALOG_TITLE_STRING'@: the title for the dialog.
--
--     * @'sDL_PROP_FILE_DIALOG_ACCEPT_STRING'@: the label that the accept button should have.
--
--     * @'sDL_PROP_FILE_DIALOG_CANCEL_STRING'@: the label that the cancel button should have.
--
--     Note that each platform may or may not support any of the properties.
--
--     [Thread safety]: This function should be called only from the main thread. The callback may be invoked from the same thread or from a different one, depending on the OS\'s constraints.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_FileDialogType', 'SDL_DialogFileCallback', 'SDL_DialogFileFilter', 'showOpenFileDialogSafe', 'showSaveFileDialogSafe', 'showOpenFolderDialogSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShowFileDialogWithProperties@.
--                   The unsafe import is not exported
--                   : may invoke the callback synchronously on validation failure.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Dialog.Unsafe.sDL_ShowFileDialogWithProperties@.
--
--     [C declaration]: @SDL_ShowFileDialogWithProperties@, defined at @SDL3\/SDL_dialog.h 326:34@
showFileDialogWithPropertiesSafe
  :: SDL_FileDialogType
  -- ^
  --
  --           [@type@]: the type of file dialog.
  -> SDL_DialogFileCallback
  -- ^
  --
  --           [@callback@]: a function pointer to be invoked when the user selects a file and accepts, or cancels the dialog, or an error occurs.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an optional pointer to pass extra data to the callback when it will be invoked.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO ()
showFileDialogWithPropertiesSafe =
  Safe.sDL_ShowFileDialogWithProperties
