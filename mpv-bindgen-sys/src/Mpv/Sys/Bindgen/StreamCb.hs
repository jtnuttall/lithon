{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Mpv.Sys.Bindgen.StreamCb (
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_read_fn_Aux (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_read_fn (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_seek_fn_Aux (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_seek_fn (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_size_fn_Aux (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_size_fn (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_close_fn_Aux (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_close_fn (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_cancel_fn_Aux (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_cancel_fn (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_info (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_open_ro_fn_Aux (..),
  Mpv.Sys.Bindgen.StreamCb.Mpv_stream_cb_open_ro_fn (..),
)
where

import Prelude (Eq, IO, Int, Ord, Show, fmap, pure, (<*>), (>>), type (~))

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Struct qualified as Struct
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | Auxiliary type used by 'Mpv_stream_cb_read_fn'
--
--     [C declaration]: @mpv_stream_cb_read_fn@, defined at @mpv\/stream_cb.h 106:19@
newtype Mpv_stream_cb_read_fn_Aux = Mpv_stream_cb_read_fn_Aux
  { unwrap
      :: BG.Ptr BG.Void
      -> BG.Ptr BG.CChar
      -> HsBindgen.Runtime.LibC.Word64
      -> IO HsBindgen.Runtime.LibC.Int64
  }
  deriving stock (BG.Generic)

-- __unique:__ @toMpv_stream_cb_read_fn_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_2dd5ecc96cba74ab_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Word64 -> IO HsBindgen.Runtime.LibC.Int64)
    -> IO
         ( BG.FunPtr
             (BG.Ptr BG.Void -> BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Word64 -> IO HsBindgen.Runtime.LibC.Int64)
         )

-- __unique:__ @toMpv_stream_cb_read_fn_Aux@
hs_bindgen_2dd5ecc96cba74ab
  :: Mpv_stream_cb_read_fn_Aux
  -> IO (BG.FunPtr Mpv_stream_cb_read_fn_Aux)
hs_bindgen_2dd5ecc96cba74ab =
  \fun0 ->
    fmap
      BG.castFunPtr
      ( hs_bindgen_2dd5ecc96cba74ab_base
          ( \x1 ->
              \x2 ->
                \x3 ->
                  fmap
                    BG.toFFIType
                    (BG.getField @"unwrap" fun0 (BG.fromFFIType x1) (BG.fromFFIType x2) (BG.fromFFIType x3))
          )
      )

-- __unique:__ @fromMpv_stream_cb_read_fn_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_48c0f3437d2ed5e0_base
    :: BG.FunPtr
         (BG.Ptr BG.Void -> BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Word64 -> IO HsBindgen.Runtime.LibC.Int64)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> HsBindgen.Runtime.LibC.Word64
    -> IO HsBindgen.Runtime.LibC.Int64

-- __unique:__ @fromMpv_stream_cb_read_fn_Aux@
hs_bindgen_48c0f3437d2ed5e0
  :: BG.FunPtr Mpv_stream_cb_read_fn_Aux
  -> Mpv_stream_cb_read_fn_Aux
hs_bindgen_48c0f3437d2ed5e0 =
  \funPtr0 ->
    Mpv_stream_cb_read_fn_Aux
      ( \x1 ->
          \x2 ->
            \x3 ->
              fmap
                BG.fromFFIType
                ( hs_bindgen_48c0f3437d2ed5e0_base
                    (BG.castFunPtr funPtr0)
                    (BG.toFFIType x1)
                    (BG.toFFIType x2)
                    (BG.toFFIType x3)
                )
      )

instance BG.ToFunPtr Mpv_stream_cb_read_fn_Aux where
  toFunPtr = hs_bindgen_2dd5ecc96cba74ab

instance BG.FromFunPtr Mpv_stream_cb_read_fn_Aux where
  fromFunPtr = hs_bindgen_48c0f3437d2ed5e0

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> BG.Ptr BG.CChar
          -> HsBindgen.Runtime.LibC.Word64
          -> IO HsBindgen.Runtime.LibC.Int64
        )
  )
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_read_fn_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_read_fn_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> BG.Ptr BG.CChar
          -> HsBindgen.Runtime.LibC.Word64
          -> IO HsBindgen.Runtime.LibC.Int64
        )
  )
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_read_fn_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_read_fn_Aux "unwrap" where
  type
    CFieldType Mpv_stream_cb_read_fn_Aux "unwrap" =
      BG.Ptr BG.Void
      -> BG.Ptr BG.CChar
      -> HsBindgen.Runtime.LibC.Word64
      -> IO HsBindgen.Runtime.LibC.Int64

  offset# = \_ -> \_ -> 0

-- | Warning: this API is not stable yet.
--
--     Overview
--
--     This API can be used to make mpv read from a stream with a custom implementation. This interface is inspired by funopen on BSD and fopencookie on linux. The stream is backed by user-defined callbacks which can implement customized open, read, seek, size and close behaviors.
--
--     Usage
--
--     Register your stream callbacks with the @mpv_stream_cb_add_ro()@ function. You have to provide a 'Mpv_stream_cb_open_ro_fn' callback to it (open_fn argument).
--
--     Once registered, you can @loadfile myprotocol:\/\/myfile@. Your open_fn will be invoked with the URI and you must fill out the provided 'Mpv_stream_cb_info' struct. This includes your stream callbacks (like read_fn), and an opaque cookie, which will be passed as the first argument to all the remaining stream callbacks.
--
--     Note that your custom callbacks must not invoke libmpv APIs as that would cause a deadlock. (Unless you call a different mpv_handle than the one the callback was registered for, and the mpv_handles refer to different mpv instances.)
--
--     Stream lifetime
--
--     A stream remains valid until its close callback has been called. It\'s up to libmpv to call the close callback, and the libmpv user cannot close it directly with the stream_cb API.
--
--     For example, if you consider your custom stream to become suddenly invalid (maybe because the underlying stream died), libmpv will continue using your stream. All you can do is returning errors from each callback, until libmpv gives up and closes it.
--
--     Protocol registration and lifetime
--
--     Protocols remain registered until the mpv instance is terminated. This means in particular that it can outlive the mpv_handle that was used to register it, but once mpv_terminate_destroy() is called, your registered callbacks will not be called again.
--
--     Protocol unregistration is finished after the mpv core has been destroyed (e.g. after mpv_terminate_destroy() has returned).
--
--     If you do not call mpv_terminate_destroy() yourself (e.g. plugin-style code), you will have to deal with the registration or even streams outliving your code. Here are some possible ways to do this:
--
--     * call mpv_terminate_destroy(), which destroys the core, and will make sure all streams are closed once this function returns
--
--     * you refcount all resources your stream \"cookies\" reference, so that it doesn\'t matter if streams live longer than expected
--
--     * create \"cancellation\" semantics: after your protocol has been unregistered, notify all your streams that are still opened, and make them drop all referenced resources - then return errors from the stream callbacks as long as the stream is still opened Read callback used to implement a custom stream. The semantics of the callback match read(2) in blocking mode. Short reads are allowed (you can return less bytes than requested, and libmpv will retry reading the rest with another call). If no data can be immediately read, the callback must block until there is new data. A return of 0 will be interpreted as final EOF, although libmpv might retry the read, or seek to a different position.
--
--     [@cookie@]: opaque cookie identifying the stream, returned from mpv_stream_cb_open_fn
--
--     [@buf@]: buffer to read data into
--
--     [@size@]: of the buffer
--
--     [Returns]: number of bytes read into the buffer
--
--     [Returns]: 0 on EOF
--
--     [Returns]: -1 on error
--
--     [C declaration]: @mpv_stream_cb_read_fn@, defined at @mpv\/stream_cb.h 106:19@
newtype Mpv_stream_cb_read_fn = Mpv_stream_cb_read_fn
  { unwrap :: BG.FunPtr Mpv_stream_cb_read_fn_Aux
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
  (ty ~ BG.FunPtr Mpv_stream_cb_read_fn_Aux)
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_read_fn ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_read_fn{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr Mpv_stream_cb_read_fn_Aux)
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_read_fn) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_read_fn "unwrap" where
  type
    CFieldType Mpv_stream_cb_read_fn "unwrap" =
      BG.FunPtr Mpv_stream_cb_read_fn_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'Mpv_stream_cb_seek_fn'
--
--     [C declaration]: @mpv_stream_cb_seek_fn@, defined at @mpv\/stream_cb.h 126:19@
newtype Mpv_stream_cb_seek_fn_Aux = Mpv_stream_cb_seek_fn_Aux
  { unwrap :: BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Int64 -> IO HsBindgen.Runtime.LibC.Int64
  }
  deriving stock (BG.Generic)

-- __unique:__ @toMpv_stream_cb_seek_fn_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_4683101231ce5235_base
    :: (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Int64 -> IO HsBindgen.Runtime.LibC.Int64)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Int64 -> IO HsBindgen.Runtime.LibC.Int64))

-- __unique:__ @toMpv_stream_cb_seek_fn_Aux@
hs_bindgen_4683101231ce5235
  :: Mpv_stream_cb_seek_fn_Aux
  -> IO (BG.FunPtr Mpv_stream_cb_seek_fn_Aux)
hs_bindgen_4683101231ce5235 =
  \fun0 ->
    fmap
      BG.castFunPtr
      ( hs_bindgen_4683101231ce5235_base
          ( \x1 ->
              \x2 ->
                fmap BG.toFFIType (BG.getField @"unwrap" fun0 (BG.fromFFIType x1) (BG.fromFFIType x2))
          )
      )

-- __unique:__ @fromMpv_stream_cb_seek_fn_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_4aac34fecb023ab7_base
    :: BG.FunPtr (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Int64 -> IO HsBindgen.Runtime.LibC.Int64)
    -> BG.Ptr BG.Void
    -> HsBindgen.Runtime.LibC.Int64
    -> IO HsBindgen.Runtime.LibC.Int64

-- __unique:__ @fromMpv_stream_cb_seek_fn_Aux@
hs_bindgen_4aac34fecb023ab7
  :: BG.FunPtr Mpv_stream_cb_seek_fn_Aux
  -> Mpv_stream_cb_seek_fn_Aux
hs_bindgen_4aac34fecb023ab7 =
  \funPtr0 ->
    Mpv_stream_cb_seek_fn_Aux
      ( \x1 ->
          \x2 ->
            fmap
              BG.fromFFIType
              (hs_bindgen_4aac34fecb023ab7_base (BG.castFunPtr funPtr0) (BG.toFFIType x1) (BG.toFFIType x2))
      )

instance BG.ToFunPtr Mpv_stream_cb_seek_fn_Aux where
  toFunPtr = hs_bindgen_4683101231ce5235

instance BG.FromFunPtr Mpv_stream_cb_seek_fn_Aux where
  fromFunPtr = hs_bindgen_4aac34fecb023ab7

instance
  (ty ~ (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Int64 -> IO HsBindgen.Runtime.LibC.Int64))
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_seek_fn_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_seek_fn_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Int64 -> IO HsBindgen.Runtime.LibC.Int64))
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_seek_fn_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_seek_fn_Aux "unwrap" where
  type
    CFieldType Mpv_stream_cb_seek_fn_Aux "unwrap" =
      BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.Int64 -> IO HsBindgen.Runtime.LibC.Int64

  offset# = \_ -> \_ -> 0

-- | Seek callback used to implement a custom stream.
--
--     Note that mpv will issue a seek to position 0 immediately after opening. This is used to test whether the stream is seekable (since seekability might depend on the URI contents, not just the protocol). Return MPV_ERROR_UNSUPPORTED if seeking is not implemented for this stream. This seek also serves to establish the fact that streams start at position 0.
--
--     This callback can be NULL, in which it behaves as if always returning MPV_ERROR_UNSUPPORTED.
--
--     [@cookie@]: opaque cookie identifying the stream, returned from mpv_stream_cb_open_fn
--
--     [@offset@]: target absolute stream position
--
--     [Returns]: the resulting offset of the stream MPV_ERROR_UNSUPPORTED or MPV_ERROR_GENERIC if the seek failed
--
--     [C declaration]: @mpv_stream_cb_seek_fn@, defined at @mpv\/stream_cb.h 126:19@
newtype Mpv_stream_cb_seek_fn = Mpv_stream_cb_seek_fn
  { unwrap :: BG.FunPtr Mpv_stream_cb_seek_fn_Aux
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
  (ty ~ BG.FunPtr Mpv_stream_cb_seek_fn_Aux)
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_seek_fn ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_seek_fn{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr Mpv_stream_cb_seek_fn_Aux)
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_seek_fn) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_seek_fn "unwrap" where
  type
    CFieldType Mpv_stream_cb_seek_fn "unwrap" =
      BG.FunPtr Mpv_stream_cb_seek_fn_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'Mpv_stream_cb_size_fn'
--
--     [C declaration]: @mpv_stream_cb_size_fn@, defined at @mpv\/stream_cb.h 140:19@
newtype Mpv_stream_cb_size_fn_Aux = Mpv_stream_cb_size_fn_Aux
  { unwrap :: BG.Ptr BG.Void -> IO HsBindgen.Runtime.LibC.Int64
  }
  deriving stock (BG.Generic)

-- __unique:__ @toMpv_stream_cb_size_fn_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_9e3ca992dcb70b6e_base
    :: (BG.Ptr BG.Void -> IO HsBindgen.Runtime.LibC.Int64)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO HsBindgen.Runtime.LibC.Int64))

-- __unique:__ @toMpv_stream_cb_size_fn_Aux@
hs_bindgen_9e3ca992dcb70b6e
  :: Mpv_stream_cb_size_fn_Aux
  -> IO (BG.FunPtr Mpv_stream_cb_size_fn_Aux)
hs_bindgen_9e3ca992dcb70b6e =
  \fun0 ->
    fmap
      BG.castFunPtr
      ( hs_bindgen_9e3ca992dcb70b6e_base
          ( \x1 ->
              fmap BG.toFFIType (BG.getField @"unwrap" fun0 (BG.fromFFIType x1))
          )
      )

-- __unique:__ @fromMpv_stream_cb_size_fn_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_da06c2e0886dcc58_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO HsBindgen.Runtime.LibC.Int64)
    -> BG.Ptr BG.Void
    -> IO HsBindgen.Runtime.LibC.Int64

-- __unique:__ @fromMpv_stream_cb_size_fn_Aux@
hs_bindgen_da06c2e0886dcc58
  :: BG.FunPtr Mpv_stream_cb_size_fn_Aux
  -> Mpv_stream_cb_size_fn_Aux
hs_bindgen_da06c2e0886dcc58 =
  \funPtr0 ->
    Mpv_stream_cb_size_fn_Aux
      ( \x1 ->
          fmap BG.fromFFIType (hs_bindgen_da06c2e0886dcc58_base (BG.castFunPtr funPtr0) (BG.toFFIType x1))
      )

instance BG.ToFunPtr Mpv_stream_cb_size_fn_Aux where
  toFunPtr = hs_bindgen_9e3ca992dcb70b6e

instance BG.FromFunPtr Mpv_stream_cb_size_fn_Aux where
  fromFunPtr = hs_bindgen_da06c2e0886dcc58

instance
  (ty ~ (BG.Ptr BG.Void -> IO HsBindgen.Runtime.LibC.Int64))
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_size_fn_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_size_fn_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO HsBindgen.Runtime.LibC.Int64))
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_size_fn_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_size_fn_Aux "unwrap" where
  type
    CFieldType Mpv_stream_cb_size_fn_Aux "unwrap" =
      BG.Ptr BG.Void -> IO HsBindgen.Runtime.LibC.Int64

  offset# = \_ -> \_ -> 0

-- | Size callback used to implement a custom stream.
--
--     Return MPV_ERROR_UNSUPPORTED if no size is known.
--
--     This callback can be NULL, in which it behaves as if always returning MPV_ERROR_UNSUPPORTED.
--
--     [@cookie@]: opaque cookie identifying the stream, returned from mpv_stream_cb_open_fn
--
--     [Returns]: the total size in bytes of the stream
--
--     [C declaration]: @mpv_stream_cb_size_fn@, defined at @mpv\/stream_cb.h 140:19@
newtype Mpv_stream_cb_size_fn = Mpv_stream_cb_size_fn
  { unwrap :: BG.FunPtr Mpv_stream_cb_size_fn_Aux
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
  (ty ~ BG.FunPtr Mpv_stream_cb_size_fn_Aux)
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_size_fn ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_size_fn{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr Mpv_stream_cb_size_fn_Aux)
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_size_fn) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_size_fn "unwrap" where
  type
    CFieldType Mpv_stream_cb_size_fn "unwrap" =
      BG.FunPtr Mpv_stream_cb_size_fn_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'Mpv_stream_cb_close_fn'
--
--     [C declaration]: @mpv_stream_cb_close_fn@, defined at @mpv\/stream_cb.h 148:16@
newtype Mpv_stream_cb_close_fn_Aux = Mpv_stream_cb_close_fn_Aux
  { unwrap :: BG.Ptr BG.Void -> IO ()
  }
  deriving stock (BG.Generic)

-- __unique:__ @toMpv_stream_cb_close_fn_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_51bca09b49bb19e0_base
    :: (BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toMpv_stream_cb_close_fn_Aux@
hs_bindgen_51bca09b49bb19e0
  :: Mpv_stream_cb_close_fn_Aux
  -> IO (BG.FunPtr Mpv_stream_cb_close_fn_Aux)
hs_bindgen_51bca09b49bb19e0 =
  \fun0 ->
    fmap
      BG.castFunPtr
      ( hs_bindgen_51bca09b49bb19e0_base
          ( \x1 ->
              BG.getField @"unwrap" fun0 (BG.fromFFIType x1)
          )
      )

-- __unique:__ @fromMpv_stream_cb_close_fn_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_872aa411b6bfc186_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromMpv_stream_cb_close_fn_Aux@
hs_bindgen_872aa411b6bfc186
  :: BG.FunPtr Mpv_stream_cb_close_fn_Aux
  -> Mpv_stream_cb_close_fn_Aux
hs_bindgen_872aa411b6bfc186 =
  \funPtr0 ->
    Mpv_stream_cb_close_fn_Aux
      ( \x1 ->
          hs_bindgen_872aa411b6bfc186_base (BG.castFunPtr funPtr0) (BG.toFFIType x1)
      )

instance BG.ToFunPtr Mpv_stream_cb_close_fn_Aux where
  toFunPtr = hs_bindgen_51bca09b49bb19e0

instance BG.FromFunPtr Mpv_stream_cb_close_fn_Aux where
  fromFunPtr = hs_bindgen_872aa411b6bfc186

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_close_fn_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_close_fn_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_close_fn_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_close_fn_Aux "unwrap" where
  type
    CFieldType Mpv_stream_cb_close_fn_Aux "unwrap" =
      BG.Ptr BG.Void -> IO ()

  offset# = \_ -> \_ -> 0

-- | Close callback used to implement a custom stream.
--
--     [@cookie@]: opaque cookie identifying the stream, returned from mpv_stream_cb_open_fn
--
--     [C declaration]: @mpv_stream_cb_close_fn@, defined at @mpv\/stream_cb.h 148:16@
newtype Mpv_stream_cb_close_fn = Mpv_stream_cb_close_fn
  { unwrap :: BG.FunPtr Mpv_stream_cb_close_fn_Aux
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
  (ty ~ BG.FunPtr Mpv_stream_cb_close_fn_Aux)
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_close_fn ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_close_fn{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr Mpv_stream_cb_close_fn_Aux)
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_close_fn) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_close_fn "unwrap" where
  type
    CFieldType Mpv_stream_cb_close_fn "unwrap" =
      BG.FunPtr Mpv_stream_cb_close_fn_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'Mpv_stream_cb_cancel_fn'
--
--     [C declaration]: @mpv_stream_cb_cancel_fn@, defined at @mpv\/stream_cb.h 164:16@
newtype Mpv_stream_cb_cancel_fn_Aux = Mpv_stream_cb_cancel_fn_Aux
  { unwrap :: BG.Ptr BG.Void -> IO ()
  }
  deriving stock (BG.Generic)

-- __unique:__ @toMpv_stream_cb_cancel_fn_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_581512c16c2155fd_base
    :: (BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toMpv_stream_cb_cancel_fn_Aux@
hs_bindgen_581512c16c2155fd
  :: Mpv_stream_cb_cancel_fn_Aux
  -> IO (BG.FunPtr Mpv_stream_cb_cancel_fn_Aux)
hs_bindgen_581512c16c2155fd =
  \fun0 ->
    fmap
      BG.castFunPtr
      ( hs_bindgen_581512c16c2155fd_base
          ( \x1 ->
              BG.getField @"unwrap" fun0 (BG.fromFFIType x1)
          )
      )

-- __unique:__ @fromMpv_stream_cb_cancel_fn_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_f8664cbcd6953214_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromMpv_stream_cb_cancel_fn_Aux@
hs_bindgen_f8664cbcd6953214
  :: BG.FunPtr Mpv_stream_cb_cancel_fn_Aux
  -> Mpv_stream_cb_cancel_fn_Aux
hs_bindgen_f8664cbcd6953214 =
  \funPtr0 ->
    Mpv_stream_cb_cancel_fn_Aux
      ( \x1 ->
          hs_bindgen_f8664cbcd6953214_base (BG.castFunPtr funPtr0) (BG.toFFIType x1)
      )

instance BG.ToFunPtr Mpv_stream_cb_cancel_fn_Aux where
  toFunPtr = hs_bindgen_581512c16c2155fd

instance BG.FromFunPtr Mpv_stream_cb_cancel_fn_Aux where
  fromFunPtr = hs_bindgen_f8664cbcd6953214

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_cancel_fn_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_cancel_fn_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_cancel_fn_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_cancel_fn_Aux "unwrap" where
  type
    CFieldType Mpv_stream_cb_cancel_fn_Aux "unwrap" =
      BG.Ptr BG.Void -> IO ()

  offset# = \_ -> \_ -> 0

-- | Cancel callback used to implement a custom stream.
--
--     This callback is used to interrupt any current or future read and seek operations. It will be called from a separate thread than the demux thread, and should not block.
--
--     This callback can be NULL.
--
--     Available since API 1.106.
--
--     [@cookie@]: opaque cookie identifying the stream, returned from mpv_stream_cb_open_fn
--
--     [C declaration]: @mpv_stream_cb_cancel_fn@, defined at @mpv\/stream_cb.h 164:16@
newtype Mpv_stream_cb_cancel_fn = Mpv_stream_cb_cancel_fn
  { unwrap :: BG.FunPtr Mpv_stream_cb_cancel_fn_Aux
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
  (ty ~ BG.FunPtr Mpv_stream_cb_cancel_fn_Aux)
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_cancel_fn ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_cancel_fn{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr Mpv_stream_cb_cancel_fn_Aux)
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_cancel_fn) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_cancel_fn "unwrap" where
  type
    CFieldType Mpv_stream_cb_cancel_fn "unwrap" =
      BG.FunPtr Mpv_stream_cb_cancel_fn_Aux

  offset# = \_ -> \_ -> 0

-- | See 'Mpv_stream_cb_open_ro_fn' callback.
--
--     [C declaration]: @struct mpv_stream_cb_info@, defined at @mpv\/stream_cb.h 169:16@
data Mpv_stream_cb_info = Mpv_stream_cb_info
  { cookie :: BG.Ptr BG.Void
  -- ^ Opaque user-provided value, which will be passed to the other callbacks. The close callback will be called to release the cookie. It is not interpreted by mpv. It doesn\'t even need to be a valid pointer.
  --
  --          The user sets this in the 'Mpv_stream_cb_open_ro_fn' callback.
  --
  --          [C declaration]: @cookie@, defined at @mpv\/stream_cb.h 177:11@
  , read_fn :: Mpv_stream_cb_read_fn
  -- ^ Callbacks set by the user in the 'Mpv_stream_cb_open_ro_fn' callback. Some of them are optional, and can be left unset.
  --
  --          The following callbacks are mandatory: read_fn, close_fn
  --
  --          [C declaration]: @read_fn@, defined at @mpv\/stream_cb.h 185:27@
  , seek_fn :: Mpv_stream_cb_seek_fn
  -- ^ [C declaration]: @seek_fn@, defined at @mpv\/stream_cb.h 186:27@
  , size_fn :: Mpv_stream_cb_size_fn
  -- ^ [C declaration]: @size_fn@, defined at @mpv\/stream_cb.h 187:27@
  , close_fn :: Mpv_stream_cb_close_fn
  -- ^ [C declaration]: @close_fn@, defined at @mpv\/stream_cb.h 188:28@
  , cancel_fn :: Mpv_stream_cb_cancel_fn
  -- ^ [C declaration]: @cancel_fn@, defined at @mpv\/stream_cb.h 189:29@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize Mpv_stream_cb_info where
  staticSizeOf = \_ -> (48 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw Mpv_stream_cb_info where
  readRaw =
    \ptr0 ->
      pure Mpv_stream_cb_info
        <*> HasCField.readRaw (BG.Proxy @"cookie") ptr0
        <*> HasCField.readRaw (BG.Proxy @"read_fn") ptr0
        <*> HasCField.readRaw (BG.Proxy @"seek_fn") ptr0
        <*> HasCField.readRaw (BG.Proxy @"size_fn") ptr0
        <*> HasCField.readRaw (BG.Proxy @"close_fn") ptr0
        <*> HasCField.readRaw (BG.Proxy @"cancel_fn") ptr0

instance Marshal.WriteRaw Mpv_stream_cb_info where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          Mpv_stream_cb_info cookie2 read_fn3 seek_fn4 size_fn5 close_fn6 cancel_fn7 ->
            HasCField.writeRaw (BG.Proxy @"cookie") ptr0 cookie2
              >> HasCField.writeRaw (BG.Proxy @"read_fn") ptr0 read_fn3
              >> HasCField.writeRaw (BG.Proxy @"seek_fn") ptr0 seek_fn4
              >> HasCField.writeRaw (BG.Proxy @"size_fn") ptr0 size_fn5
              >> HasCField.writeRaw (BG.Proxy @"close_fn") ptr0 close_fn6
              >> HasCField.writeRaw (BG.Proxy @"cancel_fn") ptr0 cancel_fn7

deriving via Marshal.EquivStorable Mpv_stream_cb_info instance BG.Storable Mpv_stream_cb_info

deriving via
  Struct.IsStructViaReadRaw Mpv_stream_cb_info
  instance
    Struct.IsStruct Mpv_stream_cb_info

-- | Opaque user-provided value, which will be passed to the other callbacks. The close callback will be called to release the cookie. It is not interpreted by mpv. It doesn\'t even need to be a valid pointer.
--
--     The user sets this in the 'Mpv_stream_cb_open_ro_fn' callback.
--
--     [C declaration]: @cookie@, defined at @mpv\/stream_cb.h 177:11@
instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "cookie" Mpv_stream_cb_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_info
            { cookie = y1
            , read_fn = BG.getField @"read_fn" x0
            , seek_fn = BG.getField @"seek_fn" x0
            , size_fn = BG.getField @"size_fn" x0
            , close_fn = BG.getField @"close_fn" x0
            , cancel_fn = BG.getField @"cancel_fn" x0
            }
      , BG.getField @"cookie" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "cookie" (BG.Ptr Mpv_stream_cb_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cookie")

instance HasCField.HasCField Mpv_stream_cb_info "cookie" where
  type
    CFieldType Mpv_stream_cb_info "cookie" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 0

-- | Callbacks set by the user in the 'Mpv_stream_cb_open_ro_fn' callback. Some of them are optional, and can be left unset.
--
--     The following callbacks are mandatory: read_fn, close_fn
--
--     [C declaration]: @read_fn@, defined at @mpv\/stream_cb.h 185:27@
instance
  (ty ~ Mpv_stream_cb_read_fn)
  => BG.CompatHasField.HasField "read_fn" Mpv_stream_cb_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_info
            { read_fn = y1
            , cookie = BG.getField @"cookie" x0
            , seek_fn = BG.getField @"seek_fn" x0
            , size_fn = BG.getField @"size_fn" x0
            , close_fn = BG.getField @"close_fn" x0
            , cancel_fn = BG.getField @"cancel_fn" x0
            }
      , BG.getField @"read_fn" x0
      )

instance
  (ty ~ Mpv_stream_cb_read_fn)
  => BG.HasField "read_fn" (BG.Ptr Mpv_stream_cb_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"read_fn")

instance HasCField.HasCField Mpv_stream_cb_info "read_fn" where
  type
    CFieldType Mpv_stream_cb_info "read_fn" =
      Mpv_stream_cb_read_fn

  offset# = \_ -> \_ -> 8

-- | [C declaration]: @seek_fn@, defined at @mpv\/stream_cb.h 186:27@
instance
  (ty ~ Mpv_stream_cb_seek_fn)
  => BG.CompatHasField.HasField "seek_fn" Mpv_stream_cb_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_info
            { seek_fn = y1
            , cookie = BG.getField @"cookie" x0
            , read_fn = BG.getField @"read_fn" x0
            , size_fn = BG.getField @"size_fn" x0
            , close_fn = BG.getField @"close_fn" x0
            , cancel_fn = BG.getField @"cancel_fn" x0
            }
      , BG.getField @"seek_fn" x0
      )

instance
  (ty ~ Mpv_stream_cb_seek_fn)
  => BG.HasField "seek_fn" (BG.Ptr Mpv_stream_cb_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"seek_fn")

instance HasCField.HasCField Mpv_stream_cb_info "seek_fn" where
  type
    CFieldType Mpv_stream_cb_info "seek_fn" =
      Mpv_stream_cb_seek_fn

  offset# = \_ -> \_ -> 16

-- | [C declaration]: @size_fn@, defined at @mpv\/stream_cb.h 187:27@
instance
  (ty ~ Mpv_stream_cb_size_fn)
  => BG.CompatHasField.HasField "size_fn" Mpv_stream_cb_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_info
            { size_fn = y1
            , cookie = BG.getField @"cookie" x0
            , read_fn = BG.getField @"read_fn" x0
            , seek_fn = BG.getField @"seek_fn" x0
            , close_fn = BG.getField @"close_fn" x0
            , cancel_fn = BG.getField @"cancel_fn" x0
            }
      , BG.getField @"size_fn" x0
      )

instance
  (ty ~ Mpv_stream_cb_size_fn)
  => BG.HasField "size_fn" (BG.Ptr Mpv_stream_cb_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"size_fn")

instance HasCField.HasCField Mpv_stream_cb_info "size_fn" where
  type
    CFieldType Mpv_stream_cb_info "size_fn" =
      Mpv_stream_cb_size_fn

  offset# = \_ -> \_ -> 24

-- | [C declaration]: @close_fn@, defined at @mpv\/stream_cb.h 188:28@
instance
  (ty ~ Mpv_stream_cb_close_fn)
  => BG.CompatHasField.HasField "close_fn" Mpv_stream_cb_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_info
            { close_fn = y1
            , cookie = BG.getField @"cookie" x0
            , read_fn = BG.getField @"read_fn" x0
            , seek_fn = BG.getField @"seek_fn" x0
            , size_fn = BG.getField @"size_fn" x0
            , cancel_fn = BG.getField @"cancel_fn" x0
            }
      , BG.getField @"close_fn" x0
      )

instance
  (ty ~ Mpv_stream_cb_close_fn)
  => BG.HasField "close_fn" (BG.Ptr Mpv_stream_cb_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"close_fn")

instance HasCField.HasCField Mpv_stream_cb_info "close_fn" where
  type
    CFieldType Mpv_stream_cb_info "close_fn" =
      Mpv_stream_cb_close_fn

  offset# = \_ -> \_ -> 32

-- | [C declaration]: @cancel_fn@, defined at @mpv\/stream_cb.h 189:29@
instance
  (ty ~ Mpv_stream_cb_cancel_fn)
  => BG.CompatHasField.HasField "cancel_fn" Mpv_stream_cb_info ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_info
            { cancel_fn = y1
            , cookie = BG.getField @"cookie" x0
            , read_fn = BG.getField @"read_fn" x0
            , seek_fn = BG.getField @"seek_fn" x0
            , size_fn = BG.getField @"size_fn" x0
            , close_fn = BG.getField @"close_fn" x0
            }
      , BG.getField @"cancel_fn" x0
      )

instance
  (ty ~ Mpv_stream_cb_cancel_fn)
  => BG.HasField "cancel_fn" (BG.Ptr Mpv_stream_cb_info) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"cancel_fn")

instance HasCField.HasCField Mpv_stream_cb_info "cancel_fn" where
  type
    CFieldType Mpv_stream_cb_info "cancel_fn" =
      Mpv_stream_cb_cancel_fn

  offset# = \_ -> \_ -> 40

-- | Auxiliary type used by 'Mpv_stream_cb_open_ro_fn'
--
--     [C declaration]: @mpv_stream_cb_open_ro_fn@, defined at @mpv\/stream_cb.h 212:15@
newtype Mpv_stream_cb_open_ro_fn_Aux = Mpv_stream_cb_open_ro_fn_Aux
  { unwrap :: BG.Ptr BG.Void -> BG.Ptr BG.CChar -> BG.Ptr Mpv_stream_cb_info -> IO BG.CInt
  }
  deriving stock (BG.Generic)

-- __unique:__ @toMpv_stream_cb_open_ro_fn_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_936d6f23ebbe3434_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.CInt)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.CInt))

-- __unique:__ @toMpv_stream_cb_open_ro_fn_Aux@
hs_bindgen_936d6f23ebbe3434
  :: Mpv_stream_cb_open_ro_fn_Aux
  -> IO (BG.FunPtr Mpv_stream_cb_open_ro_fn_Aux)
hs_bindgen_936d6f23ebbe3434 =
  \fun0 ->
    fmap
      BG.castFunPtr
      ( hs_bindgen_936d6f23ebbe3434_base
          ( \x1 ->
              \x2 ->
                \x3 ->
                  fmap
                    BG.toFFIType
                    (BG.getField @"unwrap" fun0 (BG.fromFFIType x1) (BG.fromFFIType x2) (BG.fromFFIType x3))
          )
      )

-- __unique:__ @fromMpv_stream_cb_open_ro_fn_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_c4d47ff981a30a9a_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.CInt)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.CInt

-- __unique:__ @fromMpv_stream_cb_open_ro_fn_Aux@
hs_bindgen_c4d47ff981a30a9a
  :: BG.FunPtr Mpv_stream_cb_open_ro_fn_Aux
  -> Mpv_stream_cb_open_ro_fn_Aux
hs_bindgen_c4d47ff981a30a9a =
  \funPtr0 ->
    Mpv_stream_cb_open_ro_fn_Aux
      ( \x1 ->
          \x2 ->
            \x3 ->
              fmap
                BG.fromFFIType
                ( hs_bindgen_c4d47ff981a30a9a_base
                    (BG.castFunPtr funPtr0)
                    (BG.toFFIType x1)
                    (BG.toFFIType x2)
                    (BG.toFFIType x3)
                )
      )

instance BG.ToFunPtr Mpv_stream_cb_open_ro_fn_Aux where
  toFunPtr = hs_bindgen_936d6f23ebbe3434

instance BG.FromFunPtr Mpv_stream_cb_open_ro_fn_Aux where
  fromFunPtr = hs_bindgen_c4d47ff981a30a9a

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr BG.CChar -> BG.Ptr Mpv_stream_cb_info -> IO BG.CInt))
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_open_ro_fn_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_open_ro_fn_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr BG.CChar -> BG.Ptr Mpv_stream_cb_info -> IO BG.CInt))
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_open_ro_fn_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_open_ro_fn_Aux "unwrap" where
  type
    CFieldType Mpv_stream_cb_open_ro_fn_Aux "unwrap" =
      BG.Ptr BG.Void -> BG.Ptr BG.CChar -> BG.Ptr Mpv_stream_cb_info -> IO BG.CInt

  offset# = \_ -> \_ -> 0

-- | Open callback used to implement a custom read-only (ro) stream. The user must set the callback fields in the passed info struct. The cookie field also can be set to store state associated to the stream instance.
--
--     Note that the info struct is valid only for the duration of this callback. You can\'t change the callbacks or the pointer to the cookie at a later point.
--
--     Each stream instance created by the open callback can have different callbacks.
--
--     The close_fn callback will terminate the stream instance. The pointers to your callbacks and cookie will be discarded, and the callbacks will not be called again.
--
--     [@user_data@]: opaque user data provided via mpv_stream_cb_add()
--
--     [@uri@]: name of the stream to be opened (with protocol prefix)
--
--     [@info@]: fields which the user should fill
--
--     [Returns]: 0 on success, MPV_ERROR_LOADING_FAILED if the URI cannot be opened.
--
--     [C declaration]: @mpv_stream_cb_open_ro_fn@, defined at @mpv\/stream_cb.h 212:15@
newtype Mpv_stream_cb_open_ro_fn = Mpv_stream_cb_open_ro_fn
  { unwrap :: BG.FunPtr Mpv_stream_cb_open_ro_fn_Aux
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
  (ty ~ BG.FunPtr Mpv_stream_cb_open_ro_fn_Aux)
  => BG.CompatHasField.HasField "unwrap" Mpv_stream_cb_open_ro_fn ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Mpv_stream_cb_open_ro_fn{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr Mpv_stream_cb_open_ro_fn_Aux)
  => BG.HasField "unwrap" (BG.Ptr Mpv_stream_cb_open_ro_fn) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Mpv_stream_cb_open_ro_fn "unwrap" where
  type
    CFieldType Mpv_stream_cb_open_ro_fn "unwrap" =
      BG.FunPtr Mpv_stream_cb_open_ro_fn_Aux

  offset# = \_ -> \_ -> 0
