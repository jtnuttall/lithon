{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | SDL provides access to the system clipboard, both for reading information from other processes and publishing information of its own.
--
--     This is not just text! SDL apps can access and publish data by mimetype.
--
--     Basic use (text)
--
--     Obtaining and publishing simple text to the system clipboard is as easy as calling @SDL_GetClipboardText()@ and @SDL_SetClipboardText()@, respectively. These deal with C strings in UTF-8 encoding. Data transmission and encoding conversion is completely managed by SDL.
--
--     Clipboard callbacks (data other than text)
--
--     Things get more complicated when the clipboard contains something other than text. Not only can the system clipboard contain data of any type, in some cases it can contain the same data in different formats! For example, an image painting app might let the user copy a graphic to the clipboard, and offers it in .BMP, .JPG, or .PNG format for other apps to consume.
--
--     Obtaining clipboard data (\"pasting\") like this is a matter of calling @SDL_GetClipboardData()@ and telling it the mimetype of the data you want. But how does one know if that format is available? @SDL_HasClipboardData()@ can report if a specific mimetype is offered, and @SDL_GetClipboardMimeTypes()@ can provide the entire list of mimetypes available, so the app can decide what to do with the data and what formats it can support.
--
--     Setting the clipboard (\"copying\") to arbitrary data is done with SDL_SetClipboardData. The app does not provide the data in this call, but rather the mimetypes it is willing to provide and a callback function. During the callback, the app will generate the data. This allows massive data sets to be provided to the clipboard, without any data being copied before it is explicitly requested. More specifically, it allows an app to offer data in multiple formats without providing a copy of all of them upfront. If the app has an image that it could provide in PNG or JPG format, it doesn\'t have to encode it to either of those unless and until something tries to paste it.
--
--     Primary Selection
--
--     The X11 and Wayland video targets have a concept of the \"primary selection\" in addition to the usual clipboard. This is generally highlighted (but not explicitly copied) text from various apps. SDL offers APIs for this through @SDL_GetPrimarySelectionText()@ and @SDL_SetPrimarySelectionText()@. SDL offers these APIs on platforms without this concept, too, but only so far that it will keep a copy of a string that the app sets for later retrieval; the operating system will not ever attempt to change the string externally if it doesn\'t support a primary selection. Put UTF-8 text into the clipboard.
--
--     [@text@]: the text to store in the clipboard.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function should only be called on the main thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetClipboardText'
--
--     [See also]: 'sDL_HasClipboardText'
module SDL3.Sys.Bindgen.Clipboard (
  SDL3.Sys.Bindgen.Clipboard.SDL_ClipboardDataCallback_Aux (..),
  SDL3.Sys.Bindgen.Clipboard.SDL_ClipboardDataCallback (..),
  SDL3.Sys.Bindgen.Clipboard.SDL_ClipboardCleanupCallback_Aux (..),
  SDL3.Sys.Bindgen.Clipboard.SDL_ClipboardCleanupCallback (..),
)
where

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | Auxiliary type used by 'SDL_ClipboardDataCallback'
--
--     [C declaration]: @SDL_ClipboardDataCallback@, defined at @SDL3\/SDL_clipboard.h 210:31@
newtype SDL_ClipboardDataCallback_Aux = SDL_ClipboardDataCallback_Aux
  { unwrap
      :: BG.Ptr BG.Void
      -> PtrConst.PtrConst BG.CChar
      -> BG.Ptr HsBindgen.Runtime.LibC.CSize
      -> IO (PtrConst.PtrConst BG.Void)
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_ClipboardDataCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_4dc4029500cc2362_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void))
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void)))

-- __unique:__ @toSDL_ClipboardDataCallback_Aux@
hs_bindgen_4dc4029500cc2362
  :: SDL_ClipboardDataCallback_Aux
  -> IO (BG.FunPtr SDL_ClipboardDataCallback_Aux)
hs_bindgen_4dc4029500cc2362 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_4dc4029500cc2362_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_ClipboardDataCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_941a517724689596_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void))
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @fromSDL_ClipboardDataCallback_Aux@
hs_bindgen_941a517724689596
  :: BG.FunPtr SDL_ClipboardDataCallback_Aux
  -> SDL_ClipboardDataCallback_Aux
hs_bindgen_941a517724689596 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_941a517724689596_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_ClipboardDataCallback_Aux where
  toFunPtr = hs_bindgen_4dc4029500cc2362

instance BG.FromFunPtr SDL_ClipboardDataCallback_Aux where
  fromFunPtr = hs_bindgen_941a517724689596

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> BG.Ptr HsBindgen.Runtime.LibC.CSize
          -> IO (PtrConst.PtrConst BG.Void)
        )
  )
  => BG.CompatHasField.HasField "unwrap" SDL_ClipboardDataCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 -> SDL_ClipboardDataCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> BG.Ptr HsBindgen.Runtime.LibC.CSize
          -> IO (PtrConst.PtrConst BG.Void)
        )
  )
  => BG.HasField "unwrap" (BG.Ptr SDL_ClipboardDataCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ClipboardDataCallback_Aux "unwrap" where
  type
    CFieldType SDL_ClipboardDataCallback_Aux "unwrap" =
      BG.Ptr BG.Void
      -> PtrConst.PtrConst BG.CChar
      -> BG.Ptr HsBindgen.Runtime.LibC.CSize
      -> IO (PtrConst.PtrConst BG.Void)

  offset# = \_ -> \_ -> 0

-- | Callback function that will be called when data for the specified mime-type is requested by the OS.
--
--     The callback function is called with NULL as the mime_type when the clipboard is cleared or new data is set. The clipboard is automatically cleared in SDL_Quit().
--
--     [@userdata@]: a pointer to the provided user data.
--
--     [@mime_type@]: the requested mime-type.
--
--     [@size@]: a pointer filled in with the length of the returned data.
--
--     [Returns]: a pointer to the data for the provided mime-type. Returning NULL or setting the length to 0 will cause zero length data to be sent to the \"receiver\", which should be able to handle this. The returned data will not be freed, so it needs to be retained and dealt with internally.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetClipboardData'
--
--     [C declaration]: @SDL_ClipboardDataCallback@, defined at @SDL3\/SDL_clipboard.h 210:31@
newtype SDL_ClipboardDataCallback = SDL_ClipboardDataCallback
  { unwrap :: BG.FunPtr SDL_ClipboardDataCallback_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_ClipboardDataCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_ClipboardDataCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ClipboardDataCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_ClipboardDataCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_ClipboardDataCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ClipboardDataCallback "unwrap" where
  type
    CFieldType SDL_ClipboardDataCallback "unwrap" =
      BG.FunPtr SDL_ClipboardDataCallback_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_ClipboardCleanupCallback'
--
--     [C declaration]: @SDL_ClipboardCleanupCallback@, defined at @SDL3\/SDL_clipboard.h 222:24@
newtype SDL_ClipboardCleanupCallback_Aux = SDL_ClipboardCleanupCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_ClipboardCleanupCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_dec1734c1f7f2a3f_base
    :: (BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toSDL_ClipboardCleanupCallback_Aux@
hs_bindgen_dec1734c1f7f2a3f
  :: SDL_ClipboardCleanupCallback_Aux
  -> IO (BG.FunPtr SDL_ClipboardCleanupCallback_Aux)
hs_bindgen_dec1734c1f7f2a3f =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_dec1734c1f7f2a3f_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_ClipboardCleanupCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_0ab064059cf117ee_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_ClipboardCleanupCallback_Aux@
hs_bindgen_0ab064059cf117ee
  :: BG.FunPtr SDL_ClipboardCleanupCallback_Aux
  -> SDL_ClipboardCleanupCallback_Aux
hs_bindgen_0ab064059cf117ee =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_0ab064059cf117ee_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_ClipboardCleanupCallback_Aux where
  toFunPtr = hs_bindgen_dec1734c1f7f2a3f

instance BG.FromFunPtr SDL_ClipboardCleanupCallback_Aux where
  fromFunPtr = hs_bindgen_0ab064059cf117ee

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_ClipboardCleanupCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ClipboardCleanupCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_ClipboardCleanupCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ClipboardCleanupCallback_Aux "unwrap" where
  type
    CFieldType SDL_ClipboardCleanupCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> IO ()

  offset# = \_ -> \_ -> 0

-- | Callback function that will be called when the clipboard is cleared, or when new data is set.
--
--     [@userdata@]: a pointer to the provided user data.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetClipboardData'
--
--     [C declaration]: @SDL_ClipboardCleanupCallback@, defined at @SDL3\/SDL_clipboard.h 222:24@
newtype SDL_ClipboardCleanupCallback = SDL_ClipboardCleanupCallback
  { unwrap :: BG.FunPtr SDL_ClipboardCleanupCallback_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_ClipboardCleanupCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_ClipboardCleanupCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ClipboardCleanupCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_ClipboardCleanupCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_ClipboardCleanupCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ClipboardCleanupCallback "unwrap" where
  type
    CFieldType SDL_ClipboardCleanupCallback "unwrap" =
      BG.FunPtr SDL_ClipboardCleanupCallback_Aux

  offset# = \_ -> \_ -> 0
