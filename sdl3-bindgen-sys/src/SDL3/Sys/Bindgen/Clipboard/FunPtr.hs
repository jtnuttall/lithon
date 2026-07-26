{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Clipboard.FunPtr (
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_SetClipboardText,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_GetClipboardText,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_HasClipboardText,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_SetPrimarySelectionText,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_GetPrimarySelectionText,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_HasPrimarySelectionText,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_SetClipboardData,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_ClearClipboardData,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_GetClipboardData,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_HasClipboardData,
  SDL3.Sys.Bindgen.Clipboard.FunPtr.sDL_GetClipboardMimeTypes,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Clipboard

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_clipboard.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_SetClipboardText */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e6a081b49815ff9d (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_SetClipboardText;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetClipboardText */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_e073f17299d97161 (void)) (void)"
         , "{"
         , "  return &SDL_GetClipboardText;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_HasClipboardText */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_0110b0e19d65293a (void)) (void)"
         , "{"
         , "  return &SDL_HasClipboardText;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_SetPrimarySelectionText */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2780901b25e68105 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_SetPrimarySelectionText;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetPrimarySelectionText */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_a50a077372a1275b (void)) (void)"
         , "{"
         , "  return &SDL_GetPrimarySelectionText;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_HasPrimarySelectionText */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ed5cec4a17949538 (void)) (void)"
         , "{"
         , "  return &SDL_HasPrimarySelectionText;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_SetClipboardData */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_407833da207603f1 (void)) ("
         , "  SDL_ClipboardDataCallback arg1,"
         , "  SDL_ClipboardCleanupCallback arg2,"
         , "  void *arg3,"
         , "  char const **arg4,"
         , "  size_t arg5"
         , ")"
         , "{"
         , "  return &SDL_SetClipboardData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_ClearClipboardData */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6b6d9f04b710100d (void)) (void)"
         , "{"
         , "  return &SDL_ClearClipboardData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetClipboardData */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_4936992218b0c564 (void)) ("
         , "  char const *arg1,"
         , "  size_t *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetClipboardData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_HasClipboardData */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a0c05f57097b9fe0 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_HasClipboardData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetClipboardMimeTypes */"
         , "__attribute__ ((const))"
         , "char **(*hs_bindgen_fa141967047535cc (void)) ("
         , "  size_t *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetClipboardMimeTypes;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_SetClipboardText@
foreign import ccall unsafe "hs_bindgen_e6a081b49815ff9d"
  hs_bindgen_e6a081b49815ff9d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_SetClipboardText@
hs_bindgen_e6a081b49815ff9d :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_e6a081b49815ff9d =
  BG.fromFFIType hs_bindgen_e6a081b49815ff9d_base

{-# NOINLINE sDL_SetClipboardText #-}

-- | [C declaration]: @SDL_SetClipboardText@, defined at @SDL3\/SDL_clipboard.h 104:34@
sDL_SetClipboardText :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SetClipboardText =
  BG.unsafePerformIO hs_bindgen_e6a081b49815ff9d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetClipboardText@
foreign import ccall unsafe "hs_bindgen_e073f17299d97161"
  hs_bindgen_e073f17299d97161_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetClipboardText@
hs_bindgen_e073f17299d97161 :: IO (BG.FunPtr (IO (BG.Ptr BG.CChar)))
hs_bindgen_e073f17299d97161 =
  BG.fromFFIType hs_bindgen_e073f17299d97161_base

{-# NOINLINE sDL_GetClipboardText #-}

-- | Get UTF-8 text from the clipboard.
--
--     This function returns an empty string if there is not enough memory left for a copy of the clipboard\'s content.
--
--     [Returns]: the clipboard text on success or an empty string on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasClipboardText', 'sDL_SetClipboardText'
--
--     [C declaration]: @SDL_GetClipboardText@, defined at @SDL3\/SDL_clipboard.h 123:36@
sDL_GetClipboardText :: BG.FunPtr (IO (BG.Ptr BG.CChar))
sDL_GetClipboardText =
  BG.unsafePerformIO hs_bindgen_e073f17299d97161

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_HasClipboardText@
foreign import ccall unsafe "hs_bindgen_0110b0e19d65293a"
  hs_bindgen_0110b0e19d65293a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_HasClipboardText@
hs_bindgen_0110b0e19d65293a :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_0110b0e19d65293a =
  BG.fromFFIType hs_bindgen_0110b0e19d65293a_base

{-# NOINLINE sDL_HasClipboardText #-}

-- | Query whether the clipboard exists and contains a non-empty text string.
--
--     [Returns]: true if the clipboard has text, or false if it does not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetClipboardText', 'sDL_SetClipboardText'
--
--     [C declaration]: @SDL_HasClipboardText@, defined at @SDL3\/SDL_clipboard.h 137:34@
sDL_HasClipboardText :: BG.FunPtr (IO BG.CBool)
sDL_HasClipboardText =
  BG.unsafePerformIO hs_bindgen_0110b0e19d65293a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_SetPrimarySelectionText@
foreign import ccall unsafe "hs_bindgen_2780901b25e68105"
  hs_bindgen_2780901b25e68105_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_SetPrimarySelectionText@
hs_bindgen_2780901b25e68105 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_2780901b25e68105 =
  BG.fromFFIType hs_bindgen_2780901b25e68105_base

{-# NOINLINE sDL_SetPrimarySelectionText #-}

-- | Put UTF-8 text into the primary selection.
--
--     [@text@]: the text to store in the primary selection.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPrimarySelectionText', 'sDL_HasPrimarySelectionText'
--
--     [C declaration]: @SDL_SetPrimarySelectionText@, defined at @SDL3\/SDL_clipboard.h 153:34@
sDL_SetPrimarySelectionText :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SetPrimarySelectionText =
  BG.unsafePerformIO hs_bindgen_2780901b25e68105

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetPrimarySelectionText@
foreign import ccall unsafe "hs_bindgen_a50a077372a1275b"
  hs_bindgen_a50a077372a1275b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetPrimarySelectionText@
hs_bindgen_a50a077372a1275b :: IO (BG.FunPtr (IO (BG.Ptr BG.CChar)))
hs_bindgen_a50a077372a1275b =
  BG.fromFFIType hs_bindgen_a50a077372a1275b_base

{-# NOINLINE sDL_GetPrimarySelectionText #-}

-- | Get UTF-8 text from the primary selection.
--
--     This function returns an empty string if there is not enough memory left for a copy of the primary selection\'s content.
--
--     [Returns]: the primary selection text on success or an empty string on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasPrimarySelectionText', 'sDL_SetPrimarySelectionText'
--
--     [C declaration]: @SDL_GetPrimarySelectionText@, defined at @SDL3\/SDL_clipboard.h 172:36@
sDL_GetPrimarySelectionText :: BG.FunPtr (IO (BG.Ptr BG.CChar))
sDL_GetPrimarySelectionText =
  BG.unsafePerformIO hs_bindgen_a50a077372a1275b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_HasPrimarySelectionText@
foreign import ccall unsafe "hs_bindgen_ed5cec4a17949538"
  hs_bindgen_ed5cec4a17949538_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_HasPrimarySelectionText@
hs_bindgen_ed5cec4a17949538 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_ed5cec4a17949538 =
  BG.fromFFIType hs_bindgen_ed5cec4a17949538_base

{-# NOINLINE sDL_HasPrimarySelectionText #-}

-- | Query whether the primary selection exists and contains a non-empty text string.
--
--     [Returns]: true if the primary selection has text, or false if it does not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPrimarySelectionText', 'sDL_SetPrimarySelectionText'
--
--     [C declaration]: @SDL_HasPrimarySelectionText@, defined at @SDL3\/SDL_clipboard.h 187:34@
sDL_HasPrimarySelectionText :: BG.FunPtr (IO BG.CBool)
sDL_HasPrimarySelectionText =
  BG.unsafePerformIO hs_bindgen_ed5cec4a17949538

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_SetClipboardData@
foreign import ccall unsafe "hs_bindgen_407833da207603f1"
  hs_bindgen_407833da207603f1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_SetClipboardData@
hs_bindgen_407833da207603f1
  :: IO
       ( BG.FunPtr
           ( SDL_ClipboardDataCallback
             -> SDL_ClipboardCleanupCallback
             -> BG.Ptr BG.Void
             -> BG.Ptr (PtrConst.PtrConst BG.CChar)
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CBool
           )
       )
hs_bindgen_407833da207603f1 =
  BG.fromFFIType hs_bindgen_407833da207603f1_base

{-# NOINLINE sDL_SetClipboardData #-}

-- | Offer clipboard data to the OS.
--
--     Tell the operating system that the application is offering clipboard data for each of the provided mime-types. Once another application requests the data the callback function will be called, allowing it to generate and respond with the data for the requested mime-type.
--
--     The size of text data does not include any terminator, and the text does not need to be null-terminated (e.g., you can directly copy a portion of a document).
--
--     [@callback@]: a function pointer to the function that provides the clipboard data.
--
--     [@cleanup@]: a function pointer to the function that cleans up the clipboard data.
--
--     [@userdata@]: an opaque pointer that will be forwarded to the callbacks.
--
--     [@mime_types@]: a list of mime-types that are being offered. SDL copies the given list.
--
--     [@num_mime_types@]: the number of mime-types in the mime_types list.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClearClipboardData', 'sDL_GetClipboardData', 'sDL_HasClipboardData'
--
--     [C declaration]: @SDL_SetClipboardData@, defined at @SDL3\/SDL_clipboard.h 255:34@
sDL_SetClipboardData
  :: BG.FunPtr
       ( SDL_ClipboardDataCallback
         -> SDL_ClipboardCleanupCallback
         -> BG.Ptr BG.Void
         -> BG.Ptr (PtrConst.PtrConst BG.CChar)
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CBool
       )
sDL_SetClipboardData =
  BG.unsafePerformIO hs_bindgen_407833da207603f1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_ClearClipboardData@
foreign import ccall unsafe "hs_bindgen_6b6d9f04b710100d"
  hs_bindgen_6b6d9f04b710100d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_ClearClipboardData@
hs_bindgen_6b6d9f04b710100d :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_6b6d9f04b710100d =
  BG.fromFFIType hs_bindgen_6b6d9f04b710100d_base

{-# NOINLINE sDL_ClearClipboardData #-}

-- | Clear the clipboard data.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetClipboardData'
--
--     [C declaration]: @SDL_ClearClipboardData@, defined at @SDL3\/SDL_clipboard.h 269:34@
sDL_ClearClipboardData :: BG.FunPtr (IO BG.CBool)
sDL_ClearClipboardData =
  BG.unsafePerformIO hs_bindgen_6b6d9f04b710100d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetClipboardData@
foreign import ccall unsafe "hs_bindgen_4936992218b0c564"
  hs_bindgen_4936992218b0c564_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetClipboardData@
hs_bindgen_4936992218b0c564
  :: IO
       (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
hs_bindgen_4936992218b0c564 =
  BG.fromFFIType hs_bindgen_4936992218b0c564_base

{-# NOINLINE sDL_GetClipboardData #-}

-- | Get the data from the clipboard for a given mime type.
--
--     The size of text data does not include the terminator, but the text is guaranteed to be null-terminated.
--
--     [@mime_type@]: the mime type to read from the clipboard.
--
--     [@size@]: a pointer filled in with the length of the returned data.
--
--     [Returns]: the retrieved data buffer or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasClipboardData', 'sDL_SetClipboardData'
--
--     [C declaration]: @SDL_GetClipboardData@, defined at @SDL3\/SDL_clipboard.h 290:36@
sDL_GetClipboardData
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void))
sDL_GetClipboardData =
  BG.unsafePerformIO hs_bindgen_4936992218b0c564

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_HasClipboardData@
foreign import ccall unsafe "hs_bindgen_a0c05f57097b9fe0"
  hs_bindgen_a0c05f57097b9fe0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_HasClipboardData@
hs_bindgen_a0c05f57097b9fe0 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_a0c05f57097b9fe0 =
  BG.fromFFIType hs_bindgen_a0c05f57097b9fe0_base

{-# NOINLINE sDL_HasClipboardData #-}

-- | Query whether there is data in the clipboard for the provided mime type.
--
--     [@mime_type@]: the mime type to check for data.
--
--     [Returns]: true if data exists in the clipboard for the provided mime type, false if it does not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetClipboardData', 'sDL_GetClipboardData'
--
--     [C declaration]: @SDL_HasClipboardData@, defined at @SDL3\/SDL_clipboard.h 306:34@
sDL_HasClipboardData :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_HasClipboardData =
  BG.unsafePerformIO hs_bindgen_a0c05f57097b9fe0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetClipboardMimeTypes@
foreign import ccall unsafe "hs_bindgen_fa141967047535cc"
  hs_bindgen_fa141967047535cc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_get_SDL_GetClipboardMimeTypes@
hs_bindgen_fa141967047535cc
  :: IO (BG.FunPtr (BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr (BG.Ptr BG.CChar))))
hs_bindgen_fa141967047535cc =
  BG.fromFFIType hs_bindgen_fa141967047535cc_base

{-# NOINLINE sDL_GetClipboardMimeTypes #-}

-- | Retrieve the list of mime types available in the clipboard.
--
--     [@num_mime_types@]: a pointer filled with the number of mime types, may be NULL.
--
--     [Returns]: a null-terminated array of strings with mime types, or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetClipboardData'
--
--     [C declaration]: @SDL_GetClipboardMimeTypes@, defined at @SDL3\/SDL_clipboard.h 323:37@
sDL_GetClipboardMimeTypes
  :: BG.FunPtr (BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr (BG.Ptr BG.CChar)))
sDL_GetClipboardMimeTypes =
  BG.unsafePerformIO hs_bindgen_fa141967047535cc
