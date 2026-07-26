{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Clipboard.Safe (
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_SetClipboardText,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_GetClipboardText,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_HasClipboardText,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_SetPrimarySelectionText,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_GetPrimarySelectionText,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_HasPrimarySelectionText,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_SetClipboardData,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_ClearClipboardData,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_GetClipboardData,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_HasClipboardData,
  SDL3.Sys.Bindgen.Clipboard.Safe.sDL_GetClipboardMimeTypes,
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
         , "_Bool hs_bindgen_b1150c42ea076e8c ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_SetClipboardText)(arg1);"
         , "}"
         , "char *hs_bindgen_280a176c02a40213 (void)"
         , "{"
         , "  return (SDL_GetClipboardText)();"
         , "}"
         , "_Bool hs_bindgen_0a5b78c7f4d4d82d (void)"
         , "{"
         , "  return (SDL_HasClipboardText)();"
         , "}"
         , "_Bool hs_bindgen_296e622e9e7c041e ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_SetPrimarySelectionText)(arg1);"
         , "}"
         , "char *hs_bindgen_b29f4f6c44c760ae (void)"
         , "{"
         , "  return (SDL_GetPrimarySelectionText)();"
         , "}"
         , "_Bool hs_bindgen_72e968e77e5a4b30 (void)"
         , "{"
         , "  return (SDL_HasPrimarySelectionText)();"
         , "}"
         , "_Bool hs_bindgen_36bebff7824b1300 ("
         , "  SDL_ClipboardDataCallback arg1,"
         , "  SDL_ClipboardCleanupCallback arg2,"
         , "  void *arg3,"
         , "  char const **arg4,"
         , "  size_t arg5"
         , ")"
         , "{"
         , "  return (SDL_SetClipboardData)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_acd3467dd81bcf1b (void)"
         , "{"
         , "  return (SDL_ClearClipboardData)();"
         , "}"
         , "void *hs_bindgen_d971d4d8159c9733 ("
         , "  char const *arg1,"
         , "  size_t *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetClipboardData)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_7056b6a1011e4cda ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_HasClipboardData)(arg1);"
         , "}"
         , "char **hs_bindgen_333d0a0010885f59 ("
         , "  size_t *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetClipboardMimeTypes)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_SetClipboardText@
foreign import ccall safe "hs_bindgen_b1150c42ea076e8c"
  hs_bindgen_b1150c42ea076e8c_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_SetClipboardText@
hs_bindgen_b1150c42ea076e8c
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_b1150c42ea076e8c =
  BG.fromFFIType hs_bindgen_b1150c42ea076e8c_base

-- | [C declaration]: @SDL_SetClipboardText@, defined at @SDL3\/SDL_clipboard.h 104:34@
sDL_SetClipboardText
  :: PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @text@
  -> IO BG.CBool
sDL_SetClipboardText = hs_bindgen_b1150c42ea076e8c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_GetClipboardText@
foreign import ccall safe "hs_bindgen_280a176c02a40213"
  hs_bindgen_280a176c02a40213_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_GetClipboardText@
hs_bindgen_280a176c02a40213 :: IO (BG.Ptr BG.CChar)
hs_bindgen_280a176c02a40213 =
  BG.fromFFIType hs_bindgen_280a176c02a40213_base

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
sDL_GetClipboardText :: IO (BG.Ptr BG.CChar)
sDL_GetClipboardText = hs_bindgen_280a176c02a40213

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_HasClipboardText@
foreign import ccall safe "hs_bindgen_0a5b78c7f4d4d82d"
  hs_bindgen_0a5b78c7f4d4d82d_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_HasClipboardText@
hs_bindgen_0a5b78c7f4d4d82d :: IO BG.CBool
hs_bindgen_0a5b78c7f4d4d82d =
  BG.fromFFIType hs_bindgen_0a5b78c7f4d4d82d_base

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
sDL_HasClipboardText :: IO BG.CBool
sDL_HasClipboardText = hs_bindgen_0a5b78c7f4d4d82d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_SetPrimarySelectionText@
foreign import ccall safe "hs_bindgen_296e622e9e7c041e"
  hs_bindgen_296e622e9e7c041e_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_SetPrimarySelectionText@
hs_bindgen_296e622e9e7c041e
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_296e622e9e7c041e =
  BG.fromFFIType hs_bindgen_296e622e9e7c041e_base

-- | Put UTF-8 text into the primary selection.
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
sDL_SetPrimarySelectionText
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: the text to store in the primary selection.
  -> IO BG.CBool
sDL_SetPrimarySelectionText =
  hs_bindgen_296e622e9e7c041e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_GetPrimarySelectionText@
foreign import ccall safe "hs_bindgen_b29f4f6c44c760ae"
  hs_bindgen_b29f4f6c44c760ae_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_GetPrimarySelectionText@
hs_bindgen_b29f4f6c44c760ae :: IO (BG.Ptr BG.CChar)
hs_bindgen_b29f4f6c44c760ae =
  BG.fromFFIType hs_bindgen_b29f4f6c44c760ae_base

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
sDL_GetPrimarySelectionText :: IO (BG.Ptr BG.CChar)
sDL_GetPrimarySelectionText =
  hs_bindgen_b29f4f6c44c760ae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_HasPrimarySelectionText@
foreign import ccall safe "hs_bindgen_72e968e77e5a4b30"
  hs_bindgen_72e968e77e5a4b30_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_HasPrimarySelectionText@
hs_bindgen_72e968e77e5a4b30 :: IO BG.CBool
hs_bindgen_72e968e77e5a4b30 =
  BG.fromFFIType hs_bindgen_72e968e77e5a4b30_base

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
sDL_HasPrimarySelectionText :: IO BG.CBool
sDL_HasPrimarySelectionText =
  hs_bindgen_72e968e77e5a4b30

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_SetClipboardData@
foreign import ccall safe "hs_bindgen_36bebff7824b1300"
  hs_bindgen_36bebff7824b1300_base
    :: BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_SetClipboardData@
hs_bindgen_36bebff7824b1300
  :: SDL_ClipboardDataCallback
  -> SDL_ClipboardCleanupCallback
  -> BG.Ptr BG.Void
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CBool
hs_bindgen_36bebff7824b1300 =
  BG.fromFFIType hs_bindgen_36bebff7824b1300_base

-- | Offer clipboard data to the OS.
--
--     Tell the operating system that the application is offering clipboard data for each of the provided mime-types. Once another application requests the data the callback function will be called, allowing it to generate and respond with the data for the requested mime-type.
--
--     The size of text data does not include any terminator, and the text does not need to be null-terminated (e.g., you can directly copy a portion of a document).
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
  :: SDL_ClipboardDataCallback
  -- ^
  --
  --           [@callback@]: a function pointer to the function that provides the clipboard data.
  -> SDL_ClipboardCleanupCallback
  -- ^
  --
  --           [@cleanup@]: a function pointer to the function that cleans up the clipboard data.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an opaque pointer that will be forwarded to the callbacks.
  -> BG.Ptr (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@mime_types@]: a list of mime-types that are being offered. SDL copies the given list.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@num_mime_types@]: the number of mime-types in the mime_types list.
  -> IO BG.CBool
sDL_SetClipboardData = hs_bindgen_36bebff7824b1300

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_ClearClipboardData@
foreign import ccall safe "hs_bindgen_acd3467dd81bcf1b"
  hs_bindgen_acd3467dd81bcf1b_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_ClearClipboardData@
hs_bindgen_acd3467dd81bcf1b :: IO BG.CBool
hs_bindgen_acd3467dd81bcf1b =
  BG.fromFFIType hs_bindgen_acd3467dd81bcf1b_base

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
sDL_ClearClipboardData :: IO BG.CBool
sDL_ClearClipboardData = hs_bindgen_acd3467dd81bcf1b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_GetClipboardData@
foreign import ccall safe "hs_bindgen_d971d4d8159c9733"
  hs_bindgen_d971d4d8159c9733_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_GetClipboardData@
hs_bindgen_d971d4d8159c9733
  :: PtrConst.PtrConst BG.CChar
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.Void)
hs_bindgen_d971d4d8159c9733 =
  BG.fromFFIType hs_bindgen_d971d4d8159c9733_base

-- | Get the data from the clipboard for a given mime type.
--
--     The size of text data does not include the terminator, but the text is guaranteed to be null-terminated.
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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mime_type@]: the mime type to read from the clipboard.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: a pointer filled in with the length of the returned data.
  -> IO (BG.Ptr BG.Void)
sDL_GetClipboardData = hs_bindgen_d971d4d8159c9733

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_HasClipboardData@
foreign import ccall safe "hs_bindgen_7056b6a1011e4cda"
  hs_bindgen_7056b6a1011e4cda_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_HasClipboardData@
hs_bindgen_7056b6a1011e4cda
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_7056b6a1011e4cda =
  BG.fromFFIType hs_bindgen_7056b6a1011e4cda_base

-- | Query whether there is data in the clipboard for the provided mime type.
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
sDL_HasClipboardData
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mime_type@]: the mime type to check for data.
  -> IO BG.CBool
sDL_HasClipboardData = hs_bindgen_7056b6a1011e4cda

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_GetClipboardMimeTypes@
foreign import ccall safe "hs_bindgen_333d0a0010885f59"
  hs_bindgen_333d0a0010885f59_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Clipboard_Safe_SDL_GetClipboardMimeTypes@
hs_bindgen_333d0a0010885f59
  :: BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
hs_bindgen_333d0a0010885f59 =
  BG.fromFFIType hs_bindgen_333d0a0010885f59_base

-- | Retrieve the list of mime types available in the clipboard.
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
  :: BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@num_mime_types@]: a pointer filled with the number of mime types, may be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
sDL_GetClipboardMimeTypes =
  hs_bindgen_333d0a0010885f59
