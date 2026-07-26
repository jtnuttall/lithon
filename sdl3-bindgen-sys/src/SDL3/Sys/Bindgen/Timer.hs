{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | SDL provides time management functionality. It is useful for dealing with (usually) small durations of time.
--
--     This is not to be confused with /calendar time/ management, which is provided by [CategoryTime](CategoryTime).
--
--     This category covers measuring time elapsed (@SDL_GetTicks()@, @SDL_GetPerformanceCounter()@), putting a thread to sleep for a certain amount of time (@SDL_Delay()@, @SDL_DelayNS()@, @SDL_DelayPrecise()@), and firing a callback function after a certain amount of time has elapsed (@SDL_AddTimer()@, etc).
--
--     There are also useful macros to convert between time units, like @SDL_SECONDS_TO_NS()@ and such. Number of milliseconds in a second.
--
--     This is always 1000.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Timer (
  SDL3.Sys.Bindgen.Timer.sDL_MS_PER_SECOND,
  SDL3.Sys.Bindgen.Timer.sDL_US_PER_SECOND,
  SDL3.Sys.Bindgen.Timer.sDL_NS_PER_SECOND,
  SDL3.Sys.Bindgen.Timer.sDL_NS_PER_MS,
  SDL3.Sys.Bindgen.Timer.sDL_NS_PER_US,
  SDL3.Sys.Bindgen.Timer.sDL_NS_TO_SECONDS,
  SDL3.Sys.Bindgen.Timer.sDL_NS_TO_MS,
  SDL3.Sys.Bindgen.Timer.sDL_NS_TO_US,
  SDL3.Sys.Bindgen.Timer.SDL_TimerID (..),
  SDL3.Sys.Bindgen.Timer.SDL_TimerCallback_Aux (..),
  SDL3.Sys.Bindgen.Timer.SDL_TimerCallback (..),
  SDL3.Sys.Bindgen.Timer.SDL_NSTimerCallback_Aux (..),
  SDL3.Sys.Bindgen.Timer.SDL_NSTimerCallback (..),
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @macro SDL_MS_PER_SECOND@, defined at @SDL3\/SDL_timer.h 62:9@
sDL_MS_PER_SECOND :: BG.CInt
sDL_MS_PER_SECOND = (1000 :: BG.CInt)

-- | Number of microseconds in a second.
--
--     This is always 1000000.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_US_PER_SECOND@, defined at @SDL3\/SDL_timer.h 71:9@
sDL_US_PER_SECOND :: BG.CInt
sDL_US_PER_SECOND = (1000000 :: BG.CInt)

-- | Number of nanoseconds in a second.
--
--     This is always 1000000000.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_NS_PER_SECOND@, defined at @SDL3\/SDL_timer.h 80:9@
sDL_NS_PER_SECOND :: BG.CLLong
sDL_NS_PER_SECOND = (1000000000 :: BG.CLLong)

-- | Number of nanoseconds in a millisecond.
--
--     This is always 1000000.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_NS_PER_MS@, defined at @SDL3\/SDL_timer.h 89:9@
sDL_NS_PER_MS :: BG.CInt
sDL_NS_PER_MS = (1000000 :: BG.CInt)

-- | Number of nanoseconds in a microsecond.
--
--     This is always 1000.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_NS_PER_US@, defined at @SDL3\/SDL_timer.h 98:9@
sDL_NS_PER_US :: BG.CInt
sDL_NS_PER_US = (1000 :: BG.CInt)

-- | Convert nanoseconds to seconds.
--
--     This performs a division, so the results can be dramatically different if @NS@ is an integer or floating point value.
--
--     [@NS@]: the number of nanoseconds to convert.
--
--     [Returns]: NS, expressed in seconds.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_NS_TO_SECONDS@, defined at @SDL3\/SDL_timer.h 127:9@
sDL_NS_TO_SECONDS
  :: forall a0. (C.Expr.HostPlatform.Div a0 BG.CLLong) => a0 -> C.Expr.HostPlatform.DivRes a0 BG.CLLong
sDL_NS_TO_SECONDS =
  \nS0 -> (C.Expr.HostPlatform./) nS0 sDL_NS_PER_SECOND

-- | Convert nanoseconds to milliseconds.
--
--     This performs a division, so the results can be dramatically different if @NS@ is an integer or floating point value.
--
--     [@NS@]: the number of nanoseconds to convert.
--
--     [Returns]: NS, expressed in milliseconds.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_NS_TO_MS@, defined at @SDL3\/SDL_timer.h 156:9@
sDL_NS_TO_MS
  :: forall a0. (C.Expr.HostPlatform.Div a0 BG.CInt) => a0 -> C.Expr.HostPlatform.DivRes a0 BG.CInt
sDL_NS_TO_MS =
  \nS0 -> (C.Expr.HostPlatform./) nS0 sDL_NS_PER_MS

-- | Convert nanoseconds to microseconds.
--
--     This performs a division, so the results can be dramatically different if @NS@ is an integer or floating point value.
--
--     [@NS@]: the number of nanoseconds to convert.
--
--     [Returns]: NS, expressed in microseconds.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_NS_TO_US@, defined at @SDL3\/SDL_timer.h 185:9@
sDL_NS_TO_US
  :: forall a0. (C.Expr.HostPlatform.Div a0 BG.CInt) => a0 -> C.Expr.HostPlatform.DivRes a0 BG.CInt
sDL_NS_TO_US =
  \nS0 -> (C.Expr.HostPlatform./) nS0 sDL_NS_PER_US

-- | Definition of the timer ID type.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_TimerID@, defined at @SDL3\/SDL_timer.h 306:16@
newtype SDL_TimerID = SDL_TimerID
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_TimerID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TimerID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_TimerID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TimerID "unwrap" where
  type
    CFieldType SDL_TimerID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_TimerCallback'
--
--     [C declaration]: @SDL_TimerCallback@, defined at @SDL3\/SDL_timer.h 332:26@
newtype SDL_TimerCallback_Aux = SDL_TimerCallback_Aux
  { unwrap
      :: BG.Ptr BG.Void -> SDL_TimerID -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_TimerCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_a49c51828ca7c2b2_base
    :: (BG.Ptr BG.Void -> BG.Word32 -> BG.Word32 -> IO BG.Word32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Word32 -> BG.Word32 -> IO BG.Word32))

-- __unique:__ @toSDL_TimerCallback_Aux@
hs_bindgen_a49c51828ca7c2b2
  :: SDL_TimerCallback_Aux
  -> IO (BG.FunPtr SDL_TimerCallback_Aux)
hs_bindgen_a49c51828ca7c2b2 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_a49c51828ca7c2b2_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_TimerCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_fecf80520b47dfb6_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Word32 -> BG.Word32 -> IO BG.Word32)
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Word32

-- __unique:__ @fromSDL_TimerCallback_Aux@
hs_bindgen_fecf80520b47dfb6
  :: BG.FunPtr SDL_TimerCallback_Aux
  -> SDL_TimerCallback_Aux
hs_bindgen_fecf80520b47dfb6 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_fecf80520b47dfb6_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_TimerCallback_Aux where
  toFunPtr = hs_bindgen_a49c51828ca7c2b2

instance BG.FromFunPtr SDL_TimerCallback_Aux where
  fromFunPtr = hs_bindgen_fecf80520b47dfb6

instance
  ( ty
      ~ (BG.Ptr BG.Void -> SDL_TimerID -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
  )
  => BG.CompatHasField.HasField "unwrap" SDL_TimerCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TimerCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  ( ty
      ~ (BG.Ptr BG.Void -> SDL_TimerID -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
  )
  => BG.HasField "unwrap" (BG.Ptr SDL_TimerCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TimerCallback_Aux "unwrap" where
  type
    CFieldType SDL_TimerCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> SDL_TimerID -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Function prototype for the millisecond timer callback function.
--
--     The callback function is passed the current timer interval and returns the next timer interval, in milliseconds. If the returned value is the same as the one passed in, the periodic alarm continues, otherwise a new alarm is scheduled. If the callback returns 0, the periodic alarm is canceled and will be removed.
--
--     [@userdata@]: an arbitrary pointer provided by the app through SDL_AddTimer, for its own use.
--
--     [@timerID@]: the current timer being processed.
--
--     [@interval@]: the current callback time interval.
--
--     [Returns]: the new callback time interval, or 0 to disable further runs of the callback.
--
--     [Thread safety]: SDL may call this callback at any time from a background thread; the application is responsible for locking resources the callback touches that need to be protected.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddTimer'
--
--     [C declaration]: @SDL_TimerCallback@, defined at @SDL3\/SDL_timer.h 332:26@
newtype SDL_TimerCallback = SDL_TimerCallback
  { unwrap :: BG.FunPtr SDL_TimerCallback_Aux
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
  (ty ~ BG.FunPtr SDL_TimerCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_TimerCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TimerCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_TimerCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_TimerCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TimerCallback "unwrap" where
  type
    CFieldType SDL_TimerCallback "unwrap" =
      BG.FunPtr SDL_TimerCallback_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_NSTimerCallback'
--
--     [C declaration]: @SDL_NSTimerCallback@, defined at @SDL3\/SDL_timer.h 394:26@
newtype SDL_NSTimerCallback_Aux = SDL_NSTimerCallback_Aux
  { unwrap
      :: BG.Ptr BG.Void -> SDL_TimerID -> SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_NSTimerCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_31fbeb64177dcacb_base
    :: (BG.Ptr BG.Void -> BG.Word32 -> BG.Word64 -> IO BG.Word64)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Word32 -> BG.Word64 -> IO BG.Word64))

-- __unique:__ @toSDL_NSTimerCallback_Aux@
hs_bindgen_31fbeb64177dcacb
  :: SDL_NSTimerCallback_Aux
  -> IO (BG.FunPtr SDL_NSTimerCallback_Aux)
hs_bindgen_31fbeb64177dcacb =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_31fbeb64177dcacb_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_NSTimerCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_389ed0c3b28b1730_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Word32 -> BG.Word64 -> IO BG.Word64)
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @fromSDL_NSTimerCallback_Aux@
hs_bindgen_389ed0c3b28b1730
  :: BG.FunPtr SDL_NSTimerCallback_Aux
  -> SDL_NSTimerCallback_Aux
hs_bindgen_389ed0c3b28b1730 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_389ed0c3b28b1730_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_NSTimerCallback_Aux where
  toFunPtr = hs_bindgen_31fbeb64177dcacb

instance BG.FromFunPtr SDL_NSTimerCallback_Aux where
  fromFunPtr = hs_bindgen_389ed0c3b28b1730

instance
  ( ty
      ~ (BG.Ptr BG.Void -> SDL_TimerID -> SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
  )
  => BG.CompatHasField.HasField "unwrap" SDL_NSTimerCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_NSTimerCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  ( ty
      ~ (BG.Ptr BG.Void -> SDL_TimerID -> SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
  )
  => BG.HasField "unwrap" (BG.Ptr SDL_NSTimerCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_NSTimerCallback_Aux "unwrap" where
  type
    CFieldType SDL_NSTimerCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> SDL_TimerID -> SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 0

-- | Function prototype for the nanosecond timer callback function.
--
--     The callback function is passed the current timer interval and returns the next timer interval, in nanoseconds. If the returned value is the same as the one passed in, the periodic alarm continues, otherwise a new alarm is scheduled. If the callback returns 0, the periodic alarm is canceled and will be removed.
--
--     [@userdata@]: an arbitrary pointer provided by the app through SDL_AddTimer, for its own use.
--
--     [@timerID@]: the current timer being processed.
--
--     [@interval@]: the current callback time interval.
--
--     [Returns]: the new callback time interval, or 0 to disable further runs of the callback.
--
--     [Thread safety]: SDL may call this callback at any time from a background thread; the application is responsible for locking resources the callback touches that need to be protected.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AddTimerNS'
--
--     [C declaration]: @SDL_NSTimerCallback@, defined at @SDL3\/SDL_timer.h 394:26@
newtype SDL_NSTimerCallback = SDL_NSTimerCallback
  { unwrap :: BG.FunPtr SDL_NSTimerCallback_Aux
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
  (ty ~ BG.FunPtr SDL_NSTimerCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_NSTimerCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_NSTimerCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_NSTimerCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_NSTimerCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_NSTimerCallback "unwrap" where
  type
    CFieldType SDL_NSTimerCallback "unwrap" =
      BG.FunPtr SDL_NSTimerCallback_Aux

  offset# = \_ -> \_ -> 0
