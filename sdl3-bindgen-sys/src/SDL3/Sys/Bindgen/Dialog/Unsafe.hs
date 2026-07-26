{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Dialog.Unsafe (
  SDL3.Sys.Bindgen.Dialog.Unsafe.sDL_ShowOpenFileDialog,
  SDL3.Sys.Bindgen.Dialog.Unsafe.sDL_ShowSaveFileDialog,
  SDL3.Sys.Bindgen.Dialog.Unsafe.sDL_ShowOpenFolderDialog,
  SDL3.Sys.Bindgen.Dialog.Unsafe.sDL_ShowFileDialogWithProperties,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Dialog
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Video qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_dialog.h>"
         , "void hs_bindgen_fda0993ea7af1749 ("
         , "  SDL_DialogFileCallback arg1,"
         , "  void *arg2,"
         , "  SDL_Window *arg3,"
         , "  SDL_DialogFileFilter const *arg4,"
         , "  signed int arg5,"
         , "  char const *arg6,"
         , "  _Bool arg7"
         , ")"
         , "{"
         , "  (SDL_ShowOpenFileDialog)(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
         , "}"
         , "void hs_bindgen_d0854a0f4506ac27 ("
         , "  SDL_DialogFileCallback arg1,"
         , "  void *arg2,"
         , "  SDL_Window *arg3,"
         , "  SDL_DialogFileFilter const *arg4,"
         , "  signed int arg5,"
         , "  char const *arg6"
         , ")"
         , "{"
         , "  (SDL_ShowSaveFileDialog)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "void hs_bindgen_ff283a0c567ee6a6 ("
         , "  SDL_DialogFileCallback arg1,"
         , "  void *arg2,"
         , "  SDL_Window *arg3,"
         , "  char const *arg4,"
         , "  _Bool arg5"
         , ")"
         , "{"
         , "  (SDL_ShowOpenFolderDialog)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "void hs_bindgen_18ab411c9e9de6d3 ("
         , "  SDL_FileDialogType arg1,"
         , "  SDL_DialogFileCallback arg2,"
         , "  void *arg3,"
         , "  SDL_PropertiesID arg4"
         , ")"
         , "{"
         , "  (SDL_ShowFileDialogWithProperties)(arg1, arg2, arg3, arg4);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Dialog_Unsafe_SDL_ShowOpenFileDialog@
foreign import ccall unsafe "hs_bindgen_fda0993ea7af1749"
  hs_bindgen_fda0993ea7af1749_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Dialog_Unsafe_SDL_ShowOpenFileDialog@
hs_bindgen_fda0993ea7af1749
  :: SDL_DialogFileCallback
  -> BG.Ptr BG.Void
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> PtrConst.PtrConst SDL_DialogFileFilter
  -> BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> BG.CBool
  -> IO ()
hs_bindgen_fda0993ea7af1749 =
  BG.fromFFIType hs_bindgen_fda0993ea7af1749_base

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
--     On Linux, dialogs may require XDG Portals, which requires DBus, which requires an event-handling loop. Apps that do not use SDL to handle events should add a call to SDL_PumpEvents in their main loop.
--
--     [Thread safety]: This function should be called only from the main thread. The callback may be invoked from the same thread or from a different one, depending on the OS\'s constraints.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DialogFileCallback', 'SDL_DialogFileFilter', 'sDL_ShowSaveFileDialog', 'sDL_ShowOpenFolderDialog', 'sDL_ShowFileDialogWithProperties'
--
--     [C declaration]: @SDL_ShowOpenFileDialog@, defined at @SDL3\/SDL_dialog.h 166:34@
sDL_ShowOpenFileDialog
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
  --           [@filters@]: a list of filters, may be NULL. See the [@SDL_DialogFileFilter@](SDL_DialogFileFilter#code-examples) documentation for examples]. Not all platforms support this option, and platforms that do support it may allow the user to ignore the filters. If non-NULL, it must remain valid at least until the callback is invoked.
  -> BG.CInt
  -- ^
  --
  --           [@nfilters@]: the number of filters. Ignored if filters is NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@default_location@]: the default folder or file to start the dialog at, may be NULL. Not all platforms support this option.
  -> BG.CBool
  -- ^
  --
  --           [@allow_many@]: if non-zero, the user will be allowed to select multiple entries. Not all platforms support this option.
  -> IO ()
sDL_ShowOpenFileDialog = hs_bindgen_fda0993ea7af1749

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Dialog_Unsafe_SDL_ShowSaveFileDialog@
foreign import ccall unsafe "hs_bindgen_d0854a0f4506ac27"
  hs_bindgen_d0854a0f4506ac27_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Dialog_Unsafe_SDL_ShowSaveFileDialog@
hs_bindgen_d0854a0f4506ac27
  :: SDL_DialogFileCallback
  -> BG.Ptr BG.Void
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> PtrConst.PtrConst SDL_DialogFileFilter
  -> BG.CInt
  -> PtrConst.PtrConst BG.CChar
  -> IO ()
hs_bindgen_d0854a0f4506ac27 =
  BG.fromFFIType hs_bindgen_d0854a0f4506ac27_base

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
--     On Linux, dialogs may require XDG Portals, which requires DBus, which requires an event-handling loop. Apps that do not use SDL to handle events should add a call to SDL_PumpEvents in their main loop.
--
--     [Thread safety]: This function should be called only from the main thread. The callback may be invoked from the same thread or from a different one, depending on the OS\'s constraints.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DialogFileCallback', 'SDL_DialogFileFilter', 'sDL_ShowOpenFileDialog', 'sDL_ShowOpenFolderDialog', 'sDL_ShowFileDialogWithProperties'
--
--     [C declaration]: @SDL_ShowSaveFileDialog@, defined at @SDL3\/SDL_dialog.h 215:34@
sDL_ShowSaveFileDialog
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
  -> BG.CInt
  -- ^
  --
  --           [@nfilters@]: the number of filters. Ignored if filters is NULL.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@default_location@]: the default folder or file to start the dialog at, may be NULL. Not all platforms support this option.
  -> IO ()
sDL_ShowSaveFileDialog = hs_bindgen_d0854a0f4506ac27

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Dialog_Unsafe_SDL_ShowOpenFolderDialog@
foreign import ccall unsafe "hs_bindgen_ff283a0c567ee6a6"
  hs_bindgen_ff283a0c567ee6a6_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Dialog_Unsafe_SDL_ShowOpenFolderDialog@
hs_bindgen_ff283a0c567ee6a6
  :: SDL_DialogFileCallback
  -> BG.Ptr BG.Void
  -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -> PtrConst.PtrConst BG.CChar
  -> BG.CBool
  -> IO ()
hs_bindgen_ff283a0c567ee6a6 =
  BG.fromFFIType hs_bindgen_ff283a0c567ee6a6_base

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
--     On Linux, dialogs may require XDG Portals, which requires DBus, which requires an event-handling loop. Apps that do not use SDL to handle events should add a call to SDL_PumpEvents in their main loop.
--
--     [Thread safety]: This function should be called only from the main thread. The callback may be invoked from the same thread or from a different one, depending on the OS\'s constraints.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DialogFileCallback', 'sDL_ShowOpenFileDialog', 'sDL_ShowSaveFileDialog', 'sDL_ShowFileDialogWithProperties'
--
--     [C declaration]: @SDL_ShowOpenFolderDialog@, defined at @SDL3\/SDL_dialog.h 260:34@
sDL_ShowOpenFolderDialog
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
  -> BG.CBool
  -- ^
  --
  --           [@allow_many@]: if non-zero, the user will be allowed to select multiple entries. Not all platforms support this option.
  -> IO ()
sDL_ShowOpenFolderDialog =
  hs_bindgen_ff283a0c567ee6a6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Dialog_Unsafe_SDL_ShowFileDialogWithProperties@
foreign import ccall unsafe "hs_bindgen_18ab411c9e9de6d3"
  hs_bindgen_18ab411c9e9de6d3_base
    :: BG.Word32
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Dialog_Unsafe_SDL_ShowFileDialogWithProperties@
hs_bindgen_18ab411c9e9de6d3
  :: SDL_FileDialogType
  -> SDL_DialogFileCallback
  -> BG.Ptr BG.Void
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO ()
hs_bindgen_18ab411c9e9de6d3 =
  BG.fromFFIType hs_bindgen_18ab411c9e9de6d3_base

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
--     [See also]: 'SDL_FileDialogType', 'SDL_DialogFileCallback', 'SDL_DialogFileFilter', 'sDL_ShowOpenFileDialog', 'sDL_ShowSaveFileDialog', 'sDL_ShowOpenFolderDialog'
--
--     [C declaration]: @SDL_ShowFileDialogWithProperties@, defined at @SDL3\/SDL_dialog.h 326:34@
sDL_ShowFileDialogWithProperties
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
sDL_ShowFileDialogWithProperties =
  hs_bindgen_18ab411c9e9de6d3
