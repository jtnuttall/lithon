-- | SDL provides access to the system clipboard, both for reading information from other processes and publishing information of its own.
--
--     This is not just text! SDL apps can access and publish data by mimetype.
--
--     Basic use (text)
--
--     Obtaining and publishing simple text to the system clipboard is as easy as calling @'getClipboardText'@ and @'setClipboardText'@, respectively. These deal with C strings in UTF-8 encoding. Data transmission and encoding conversion is completely managed by SDL.
--
--     Clipboard callbacks (data other than text)
--
--     Things get more complicated when the clipboard contains something other than text. Not only can the system clipboard contain data of any type, in some cases it can contain the same data in different formats! For example, an image painting app might let the user copy a graphic to the clipboard, and offers it in .BMP, .JPG, or .PNG format for other apps to consume.
--
--     Obtaining clipboard data (\"pasting\") like this is a matter of calling @'getClipboardData'@ and telling it the mimetype of the data you want. But how does one know if that format is available? @'hasClipboardData'@ can report if a specific mimetype is offered, and @'getClipboardMimeTypes'@ can provide the entire list of mimetypes available, so the app can decide what to do with the data and what formats it can support.
--
--     Setting the clipboard (\"copying\") to arbitrary data is done with 'setClipboardDataSafe'. The app does not provide the data in this call, but rather the mimetypes it is willing to provide and a callback function. During the callback, the app will generate the data. This allows massive data sets to be provided to the clipboard, without any data being copied before it is explicitly requested. More specifically, it allows an app to offer data in multiple formats without providing a copy of all of them upfront. If the app has an image that it could provide in PNG or JPG format, it doesn\'t have to encode it to either of those unless and until something tries to paste it.
--
--     Primary Selection
--
--     The X11 and Wayland video targets have a concept of the \"primary selection\" in addition to the usual clipboard. This is generally highlighted (but not explicitly copied) text from various apps. SDL offers APIs for this through @'getPrimarySelectionText'@ and @'setPrimarySelectionText'@. SDL offers these APIs on platforms without this concept, too, but only so far that it will keep a copy of a string that the app sets for later retrieval; the operating system will not ever attempt to change the string externally if it doesn\'t support a primary selection. Put UTF-8 text into the clipboard.
--
--     [@text@]: the text to store in the clipboard.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getClipboardText'
--
--     [See also]: 'hasClipboardText'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Clipboard.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Clipboard (
  module SDL3.Sys.Bindgen.Clipboard,

  -- * Function aliases
  SDL3.Sys.Clipboard.setClipboardText,
  SDL3.Sys.Clipboard.setClipboardTextSafe,
  SDL3.Sys.Clipboard.getClipboardText,
  SDL3.Sys.Clipboard.getClipboardTextSafe,
  SDL3.Sys.Clipboard.hasClipboardText,
  SDL3.Sys.Clipboard.hasClipboardTextSafe,
  SDL3.Sys.Clipboard.setPrimarySelectionText,
  SDL3.Sys.Clipboard.setPrimarySelectionTextSafe,
  SDL3.Sys.Clipboard.getPrimarySelectionText,
  SDL3.Sys.Clipboard.getPrimarySelectionTextSafe,
  SDL3.Sys.Clipboard.hasPrimarySelectionText,
  SDL3.Sys.Clipboard.hasPrimarySelectionTextSafe,
  SDL3.Sys.Clipboard.setClipboardDataSafe,
  SDL3.Sys.Clipboard.clearClipboardData,
  SDL3.Sys.Clipboard.clearClipboardDataSafe,
  SDL3.Sys.Clipboard.getClipboardData,
  SDL3.Sys.Clipboard.getClipboardDataSafe,
  SDL3.Sys.Clipboard.hasClipboardData,
  SDL3.Sys.Clipboard.hasClipboardDataSafe,
  SDL3.Sys.Clipboard.getClipboardMimeTypes,
  SDL3.Sys.Clipboard.getClipboardMimeTypesSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Clipboard
import SDL3.Sys.Bindgen.Clipboard.Safe qualified as Safe
import SDL3.Sys.Bindgen.Clipboard.Unsafe qualified as Unsafe

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetClipboardText@.
--                   The safe flavor is 'setClipboardTextSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetClipboardText@, defined at @SDL3\/SDL_clipboard.h 104:34@
setClipboardText
  :: PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @text@
  -> IO Bool
setClipboardText =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_SetClipboardText x00)

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetClipboardText@.
--                   The unsafe flavor is 'setClipboardText'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetClipboardText@, defined at @SDL3\/SDL_clipboard.h 104:34@
setClipboardTextSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @text@
  -> IO Bool
setClipboardTextSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_SetClipboardText x00)

-- | Get UTF-8 text from the clipboard.
--
--     This function returns an empty string if there is not enough memory left for a copy of the clipboard\'s content.
--
--     [Returns]: the clipboard text on success or an empty string on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasClipboardText', 'setClipboardText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetClipboardText@.
--                   The safe flavor is 'getClipboardTextSafe'
--                   : when this app owns the clipboard, its data-provider callback runs synchronously.
--
--     [C declaration]: @SDL_GetClipboardText@, defined at @SDL3\/SDL_clipboard.h 123:36@
getClipboardText :: IO (BG.Ptr BG.CChar)
getClipboardText = Unsafe.sDL_GetClipboardText

-- | Get UTF-8 text from the clipboard.
--
--     This function returns an empty string if there is not enough memory left for a copy of the clipboard\'s content.
--
--     [Returns]: the clipboard text on success or an empty string on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasClipboardText', 'setClipboardText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetClipboardText@.
--                   The unsafe flavor is 'getClipboardText'
--                   : when this app owns the clipboard, its data-provider callback runs synchronously.
--
--     [C declaration]: @SDL_GetClipboardText@, defined at @SDL3\/SDL_clipboard.h 123:36@
getClipboardTextSafe :: IO (BG.Ptr BG.CChar)
getClipboardTextSafe = Safe.sDL_GetClipboardText

-- | Query whether the clipboard exists and contains a non-empty text string.
--
--     [Returns]: true if the clipboard has text, or false if it does not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getClipboardText', 'setClipboardText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasClipboardText@.
--                   The safe flavor is 'hasClipboardTextSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasClipboardText@, defined at @SDL3\/SDL_clipboard.h 137:34@
hasClipboardText :: IO Bool
hasClipboardText =
  fmap CBool.toBool Unsafe.sDL_HasClipboardText

-- | Query whether the clipboard exists and contains a non-empty text string.
--
--     [Returns]: true if the clipboard has text, or false if it does not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getClipboardText', 'setClipboardText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasClipboardText@.
--                   The unsafe flavor is 'hasClipboardText'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasClipboardText@, defined at @SDL3\/SDL_clipboard.h 137:34@
hasClipboardTextSafe :: IO Bool
hasClipboardTextSafe =
  fmap CBool.toBool Safe.sDL_HasClipboardText

-- | Put UTF-8 text into the primary selection.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPrimarySelectionText', 'hasPrimarySelectionText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetPrimarySelectionText@.
--                   The safe flavor is 'setPrimarySelectionTextSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetPrimarySelectionText@, defined at @SDL3\/SDL_clipboard.h 153:34@
setPrimarySelectionText
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: the text to store in the primary selection.
  -> IO Bool
setPrimarySelectionText =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_SetPrimarySelectionText x00)

-- | Put UTF-8 text into the primary selection.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPrimarySelectionText', 'hasPrimarySelectionText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetPrimarySelectionText@.
--                   The unsafe flavor is 'setPrimarySelectionText'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetPrimarySelectionText@, defined at @SDL3\/SDL_clipboard.h 153:34@
setPrimarySelectionTextSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@text@]: the text to store in the primary selection.
  -> IO Bool
setPrimarySelectionTextSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_SetPrimarySelectionText x00)

-- | Get UTF-8 text from the primary selection.
--
--     This function returns an empty string if there is not enough memory left for a copy of the primary selection\'s content.
--
--     [Returns]: the primary selection text on success or an empty string on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasPrimarySelectionText', 'setPrimarySelectionText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPrimarySelectionText@.
--                   The safe flavor is 'getPrimarySelectionTextSafe'
--                   .
--
--     [C declaration]: @SDL_GetPrimarySelectionText@, defined at @SDL3\/SDL_clipboard.h 172:36@
getPrimarySelectionText :: IO (BG.Ptr BG.CChar)
getPrimarySelectionText =
  Unsafe.sDL_GetPrimarySelectionText

-- | Get UTF-8 text from the primary selection.
--
--     This function returns an empty string if there is not enough memory left for a copy of the primary selection\'s content.
--
--     [Returns]: the primary selection text on success or an empty string on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasPrimarySelectionText', 'setPrimarySelectionText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPrimarySelectionText@.
--                   The unsafe flavor is 'getPrimarySelectionText'
--                   .
--
--     [C declaration]: @SDL_GetPrimarySelectionText@, defined at @SDL3\/SDL_clipboard.h 172:36@
getPrimarySelectionTextSafe :: IO (BG.Ptr BG.CChar)
getPrimarySelectionTextSafe =
  Safe.sDL_GetPrimarySelectionText

-- | Query whether the primary selection exists and contains a non-empty text string.
--
--     [Returns]: true if the primary selection has text, or false if it does not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPrimarySelectionText', 'setPrimarySelectionText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasPrimarySelectionText@.
--                   The safe flavor is 'hasPrimarySelectionTextSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasPrimarySelectionText@, defined at @SDL3\/SDL_clipboard.h 187:34@
hasPrimarySelectionText :: IO Bool
hasPrimarySelectionText =
  fmap CBool.toBool Unsafe.sDL_HasPrimarySelectionText

-- | Query whether the primary selection exists and contains a non-empty text string.
--
--     [Returns]: true if the primary selection has text, or false if it does not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPrimarySelectionText', 'setPrimarySelectionText'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasPrimarySelectionText@.
--                   The unsafe flavor is 'hasPrimarySelectionText'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasPrimarySelectionText@, defined at @SDL3\/SDL_clipboard.h 187:34@
hasPrimarySelectionTextSafe :: IO Bool
hasPrimarySelectionTextSafe =
  fmap CBool.toBool Safe.sDL_HasPrimarySelectionText

-- | Offer clipboard data to the OS.
--
--     Tell the operating system that the application is offering clipboard data for each of the provided mime-types. Once another application requests the data the callback function will be called, allowing it to generate and respond with the data for the requested mime-type.
--
--     The size of text data does not include any terminator, and the text does not need to be null-terminated (e.g., you can directly copy a portion of a document).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'clearClipboardData', 'getClipboardData', 'hasClipboardData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetClipboardData@.
--                   The unsafe import is not exported
--                   : may invoke the previous cleanup callback synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Clipboard.Unsafe.sDL_SetClipboardData@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetClipboardData@, defined at @SDL3\/SDL_clipboard.h 255:34@
setClipboardDataSafe
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
  -> BG.Word64
  -- ^
  --
  --           [@num_mime_types@]: the number of mime-types in the mime_types list.
  -> IO Bool
setClipboardDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_SetClipboardData x00 x11 x22 x33 (Coerce.coerce x44))

-- | Clear the clipboard data.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setClipboardDataSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ClearClipboardData@.
--                   The safe flavor is 'clearClipboardDataSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearClipboardData@, defined at @SDL3\/SDL_clipboard.h 269:34@
clearClipboardData :: IO Bool
clearClipboardData =
  fmap CBool.toBool Unsafe.sDL_ClearClipboardData

-- | Clear the clipboard data.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setClipboardDataSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ClearClipboardData@.
--                   The unsafe flavor is 'clearClipboardData'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearClipboardData@, defined at @SDL3\/SDL_clipboard.h 269:34@
clearClipboardDataSafe :: IO Bool
clearClipboardDataSafe =
  fmap CBool.toBool Safe.sDL_ClearClipboardData

-- | Get the data from the clipboard for a given mime type.
--
--     The size of text data does not include the terminator, but the text is guaranteed to be null-terminated.
--
--     [Returns]: the retrieved data buffer or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasClipboardData', 'setClipboardDataSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetClipboardData@.
--                   The safe flavor is 'getClipboardDataSafe'
--                   : when this app owns the clipboard, its data-provider callback runs synchronously.
--
--     [C declaration]: @SDL_GetClipboardData@, defined at @SDL3\/SDL_clipboard.h 290:36@
getClipboardData
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mime_type@]: the mime type to read from the clipboard.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: a pointer filled in with the length of the returned data.
  -> IO (BG.Ptr BG.Void)
getClipboardData = Unsafe.sDL_GetClipboardData

-- | Get the data from the clipboard for a given mime type.
--
--     The size of text data does not include the terminator, but the text is guaranteed to be null-terminated.
--
--     [Returns]: the retrieved data buffer or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasClipboardData', 'setClipboardDataSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetClipboardData@.
--                   The unsafe flavor is 'getClipboardData'
--                   : when this app owns the clipboard, its data-provider callback runs synchronously.
--
--     [C declaration]: @SDL_GetClipboardData@, defined at @SDL3\/SDL_clipboard.h 290:36@
getClipboardDataSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mime_type@]: the mime type to read from the clipboard.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: a pointer filled in with the length of the returned data.
  -> IO (BG.Ptr BG.Void)
getClipboardDataSafe = Safe.sDL_GetClipboardData

-- | Query whether there is data in the clipboard for the provided mime type.
--
--     [Returns]: true if data exists in the clipboard for the provided mime type, false if it does not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setClipboardDataSafe', 'getClipboardData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasClipboardData@.
--                   The safe flavor is 'hasClipboardDataSafe'
--                   : when this app owns the clipboard, its data-provider callback runs synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasClipboardData@, defined at @SDL3\/SDL_clipboard.h 306:34@
hasClipboardData
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mime_type@]: the mime type to check for data.
  -> IO Bool
hasClipboardData =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_HasClipboardData x00)

-- | Query whether there is data in the clipboard for the provided mime type.
--
--     [Returns]: true if data exists in the clipboard for the provided mime type, false if it does not.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setClipboardDataSafe', 'getClipboardData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasClipboardData@.
--                   The unsafe flavor is 'hasClipboardData'
--                   : when this app owns the clipboard, its data-provider callback runs synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasClipboardData@, defined at @SDL3\/SDL_clipboard.h 306:34@
hasClipboardDataSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mime_type@]: the mime type to check for data.
  -> IO Bool
hasClipboardDataSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_HasClipboardData x00)

-- | Retrieve the list of mime types available in the clipboard.
--
--     [Returns]: a null-terminated array of strings with mime types, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setClipboardDataSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetClipboardMimeTypes@.
--                   The safe flavor is 'getClipboardMimeTypesSafe'
--                   .
--
--     [C declaration]: @SDL_GetClipboardMimeTypes@, defined at @SDL3\/SDL_clipboard.h 323:37@
getClipboardMimeTypes
  :: BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@num_mime_types@]: a pointer filled with the number of mime types, may be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
getClipboardMimeTypes =
  Unsafe.sDL_GetClipboardMimeTypes

-- | Retrieve the list of mime types available in the clipboard.
--
--     [Returns]: a null-terminated array of strings with mime types, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'setClipboardDataSafe'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetClipboardMimeTypes@.
--                   The unsafe flavor is 'getClipboardMimeTypes'
--                   .
--
--     [C declaration]: @SDL_GetClipboardMimeTypes@, defined at @SDL3\/SDL_clipboard.h 323:37@
getClipboardMimeTypesSafe
  :: BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@num_mime_types@]: a pointer filled with the number of mime types, may be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
getClipboardMimeTypesSafe =
  Safe.sDL_GetClipboardMimeTypes
