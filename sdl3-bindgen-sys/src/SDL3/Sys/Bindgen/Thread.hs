{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | SDL offers cross-platform thread management functions. These are mostly concerned with starting threads, setting their priority, and dealing with their termination.
--
--     In addition, there is support for Thread Local Storage (data that is unique to each thread, but accessed from a single key).
--
--     On platforms without thread support (such as Emscripten when built without pthreads), these functions still exist, but things like @SDL_CreateThread()@ will report failure without doing anything.
--
--     If you\'re going to work with threads, you almost certainly need to have a good understanding of thread safety measures: locking and synchronization mechanisms are handled by the functions in SDL_mutex.h. The SDL thread object.
--
--     These are opaque data.
--
--     @since 3.2.0
--
--     [See also]: @SDL_CreateThread@, 'sDL_WaitThread'
module SDL3.Sys.Bindgen.Thread (
  SDL3.Sys.Bindgen.Thread.SDL_Thread,
  SDL3.Sys.Bindgen.Thread.SDL_ThreadID (..),
  SDL3.Sys.Bindgen.Thread.SDL_TLSID (..),
  SDL3.Sys.Bindgen.Thread.SDL_ThreadPriority (..),
  pattern SDL3.Sys.Bindgen.Thread.SDL_THREAD_PRIORITY_LOW,
  pattern SDL3.Sys.Bindgen.Thread.SDL_THREAD_PRIORITY_NORMAL,
  pattern SDL3.Sys.Bindgen.Thread.SDL_THREAD_PRIORITY_HIGH,
  pattern SDL3.Sys.Bindgen.Thread.SDL_THREAD_PRIORITY_TIME_CRITICAL,
  SDL3.Sys.Bindgen.Thread.SDL_ThreadState (..),
  pattern SDL3.Sys.Bindgen.Thread.SDL_THREAD_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Thread.SDL_THREAD_ALIVE,
  pattern SDL3.Sys.Bindgen.Thread.SDL_THREAD_DETACHED,
  pattern SDL3.Sys.Bindgen.Thread.SDL_THREAD_COMPLETE,
  SDL3.Sys.Bindgen.Thread.SDL_ThreadFunction_Aux (..),
  SDL3.Sys.Bindgen.Thread.SDL_ThreadFunction (..),
  SDL3.Sys.Bindgen.Thread.sDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER,
  SDL3.Sys.Bindgen.Thread.sDL_PROP_THREAD_CREATE_NAME_STRING,
  SDL3.Sys.Bindgen.Thread.sDL_PROP_THREAD_CREATE_USERDATA_POINTER,
  SDL3.Sys.Bindgen.Thread.sDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER,
  SDL3.Sys.Bindgen.Thread.SDL_TLSDestructorCallback_Aux (..),
  SDL3.Sys.Bindgen.Thread.SDL_TLSDestructorCallback (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Atomic qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @struct SDL_Thread@, defined at @SDL3\/SDL_thread.h 71:16@
data SDL_Thread

-- | A unique numeric ID that identifies a thread.
--
--     These are different from 'SDL_Thread' objects, which are generally what an application will operate on, but having a way to uniquely identify a thread can be useful at times.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetThreadID', 'sDL_GetCurrentThreadID'
--
--     [C declaration]: @SDL_ThreadID@, defined at @SDL3\/SDL_thread.h 85:16@
newtype SDL_ThreadID = SDL_ThreadID
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint64
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
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "unwrap" SDL_ThreadID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ThreadID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "unwrap" (BG.Ptr SDL_ThreadID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ThreadID "unwrap" where
  type
    CFieldType SDL_ThreadID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 0

-- | Thread local storage ID.
--
--     0 is the invalid ID. An app can create these and then set data for these IDs that is unique to each thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTLS', 'sDL_SetTLS'
--
--     [C declaration]: @SDL_TLSID@, defined at @SDL3\/SDL_thread.h 98:23@
newtype SDL_TLSID = SDL_TLSID
  { unwrap :: SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt
  }
  deriving stock (BG.Generic, Eq, Show)
  deriving newtype
    ( BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt)
  => BG.CompatHasField.HasField "unwrap" SDL_TLSID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TLSID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_TLSID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TLSID "unwrap" where
  type
    CFieldType SDL_TLSID "unwrap" =
      SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt

  offset# = \_ -> \_ -> 0

-- | The SDL thread priority.
--
--     SDL will make system changes as necessary in order to apply the thread priority. Code which attempts to control thread state related to priority should be aware that calling SDL_SetCurrentThreadPriority may alter such state. SDL_HINT_THREAD_PRIORITY_POLICY can be used to control aspects of this behavior.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_ThreadPriority@, defined at @SDL3\/SDL_thread.h 111:14@
newtype SDL_ThreadPriority = SDL_ThreadPriority
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ThreadPriority where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ThreadPriority where
  readRaw =
    \ptr0 ->
      pure SDL_ThreadPriority
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ThreadPriority where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ThreadPriority unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ThreadPriority instance BG.Storable SDL_ThreadPriority

deriving via BG.CUInt instance BG.Prim SDL_ThreadPriority

instance CEnum.CEnum SDL_ThreadPriority where
  type CEnumZ SDL_ThreadPriority = BG.CUInt

  toCEnum = SDL_ThreadPriority

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_THREAD_PRIORITY_LOW")
        , (1, BG.singleton "SDL_THREAD_PRIORITY_NORMAL")
        , (2, BG.singleton "SDL_THREAD_PRIORITY_HIGH")
        , (3, BG.singleton "SDL_THREAD_PRIORITY_TIME_CRITICAL")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ThreadPriority"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ThreadPriority"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_ThreadPriority where
  minDeclaredValue = SDL_THREAD_PRIORITY_LOW

  maxDeclaredValue = SDL_THREAD_PRIORITY_TIME_CRITICAL

instance Show SDL_ThreadPriority where
  showsPrec = CEnum.shows

instance Read SDL_ThreadPriority where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ThreadPriority ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ThreadPriority{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ThreadPriority) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ThreadPriority "unwrap" where
  type
    CFieldType SDL_ThreadPriority "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_THREAD_PRIORITY_LOW@, defined at @SDL3\/SDL_thread.h 112:5@
pattern SDL_THREAD_PRIORITY_LOW :: SDL_ThreadPriority
pattern SDL_THREAD_PRIORITY_LOW = SDL_ThreadPriority 0

-- | [C declaration]: @SDL_THREAD_PRIORITY_NORMAL@, defined at @SDL3\/SDL_thread.h 113:5@
pattern SDL_THREAD_PRIORITY_NORMAL :: SDL_ThreadPriority
pattern SDL_THREAD_PRIORITY_NORMAL = SDL_ThreadPriority 1

-- | [C declaration]: @SDL_THREAD_PRIORITY_HIGH@, defined at @SDL3\/SDL_thread.h 114:5@
pattern SDL_THREAD_PRIORITY_HIGH :: SDL_ThreadPriority
pattern SDL_THREAD_PRIORITY_HIGH = SDL_ThreadPriority 2

-- | [C declaration]: @SDL_THREAD_PRIORITY_TIME_CRITICAL@, defined at @SDL3\/SDL_thread.h 115:5@
pattern SDL_THREAD_PRIORITY_TIME_CRITICAL :: SDL_ThreadPriority
pattern SDL_THREAD_PRIORITY_TIME_CRITICAL = SDL_ThreadPriority 3

-- | The SDL thread state.
--
--     The current state of a thread can be checked by calling SDL_GetThreadState.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetThreadState'
--
--     [C declaration]: @enum SDL_ThreadState@, defined at @SDL3\/SDL_thread.h 127:14@
newtype SDL_ThreadState = SDL_ThreadState
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ThreadState where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ThreadState where
  readRaw =
    \ptr0 ->
      pure SDL_ThreadState
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ThreadState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ThreadState unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ThreadState instance BG.Storable SDL_ThreadState

deriving via BG.CUInt instance BG.Prim SDL_ThreadState

instance CEnum.CEnum SDL_ThreadState where
  type CEnumZ SDL_ThreadState = BG.CUInt

  toCEnum = SDL_ThreadState

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_THREAD_UNKNOWN")
        , (1, BG.singleton "SDL_THREAD_ALIVE")
        , (2, BG.singleton "SDL_THREAD_DETACHED")
        , (3, BG.singleton "SDL_THREAD_COMPLETE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ThreadState"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ThreadState"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_ThreadState where
  minDeclaredValue = SDL_THREAD_UNKNOWN

  maxDeclaredValue = SDL_THREAD_COMPLETE

instance Show SDL_ThreadState where
  showsPrec = CEnum.shows

instance Read SDL_ThreadState where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ThreadState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ThreadState{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ThreadState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ThreadState "unwrap" where
  type CFieldType SDL_ThreadState "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The thread is not valid
--
--     [C declaration]: @SDL_THREAD_UNKNOWN@, defined at @SDL3\/SDL_thread.h 129:5@
pattern SDL_THREAD_UNKNOWN :: SDL_ThreadState
pattern SDL_THREAD_UNKNOWN = SDL_ThreadState 0

-- | The thread is currently running
--
--     [C declaration]: @SDL_THREAD_ALIVE@, defined at @SDL3\/SDL_thread.h 130:5@
pattern SDL_THREAD_ALIVE :: SDL_ThreadState
pattern SDL_THREAD_ALIVE = SDL_ThreadState 1

-- | The thread is detached and can\'t be waited on
--
--     [C declaration]: @SDL_THREAD_DETACHED@, defined at @SDL3\/SDL_thread.h 131:5@
pattern SDL_THREAD_DETACHED :: SDL_ThreadState
pattern SDL_THREAD_DETACHED = SDL_ThreadState 2

-- | The thread has finished and should be cleaned up with @SDL_WaitThread()@
--
--     [C declaration]: @SDL_THREAD_COMPLETE@, defined at @SDL3\/SDL_thread.h 132:5@
pattern SDL_THREAD_COMPLETE :: SDL_ThreadState
pattern SDL_THREAD_COMPLETE = SDL_ThreadState 3

-- | Auxiliary type used by 'SDL_ThreadFunction'
--
--     [C declaration]: @SDL_ThreadFunction@, defined at @SDL3\/SDL_thread.h 143:23@
newtype SDL_ThreadFunction_Aux = SDL_ThreadFunction_Aux
  { unwrap :: BG.Ptr BG.Void -> IO BG.CInt
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_ThreadFunction_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_d53137dca60d82b1_base
    :: (BG.Ptr BG.Void -> IO BG.Int32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO BG.Int32))

-- __unique:__ @toSDL_ThreadFunction_Aux@
hs_bindgen_d53137dca60d82b1
  :: SDL_ThreadFunction_Aux
  -> IO (BG.FunPtr SDL_ThreadFunction_Aux)
hs_bindgen_d53137dca60d82b1 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_d53137dca60d82b1_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_ThreadFunction_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_67f38a19566426bd_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO BG.Int32)
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @fromSDL_ThreadFunction_Aux@
hs_bindgen_67f38a19566426bd
  :: BG.FunPtr SDL_ThreadFunction_Aux
  -> SDL_ThreadFunction_Aux
hs_bindgen_67f38a19566426bd =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_67f38a19566426bd_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_ThreadFunction_Aux where
  toFunPtr = hs_bindgen_d53137dca60d82b1

instance BG.FromFunPtr SDL_ThreadFunction_Aux where
  fromFunPtr = hs_bindgen_67f38a19566426bd

instance
  (ty ~ (BG.Ptr BG.Void -> IO BG.CInt))
  => BG.CompatHasField.HasField "unwrap" SDL_ThreadFunction_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ThreadFunction_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO BG.CInt))
  => BG.HasField "unwrap" (BG.Ptr SDL_ThreadFunction_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ThreadFunction_Aux "unwrap" where
  type
    CFieldType SDL_ThreadFunction_Aux "unwrap" =
      BG.Ptr BG.Void -> IO BG.CInt

  offset# = \_ -> \_ -> 0

-- | The function passed to @SDL_CreateThread()@ as the new thread\'s entry point.
--
--     [@data@]: what was passed as @data@ to @SDL_CreateThread()@.
--
--     [Returns]: a value that can be reported through @SDL_WaitThread()@.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ThreadFunction@, defined at @SDL3\/SDL_thread.h 143:23@
newtype SDL_ThreadFunction = SDL_ThreadFunction
  { unwrap :: BG.FunPtr SDL_ThreadFunction_Aux
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
  (ty ~ BG.FunPtr SDL_ThreadFunction_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_ThreadFunction ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ThreadFunction{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_ThreadFunction_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_ThreadFunction) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ThreadFunction "unwrap" where
  type
    CFieldType SDL_ThreadFunction "unwrap" =
      BG.FunPtr SDL_ThreadFunction_Aux

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @macro SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER@, literal @\"SDL.thread.create.entry_function\"@, defined at @SDL3\/SDL_thread.h 360:9@
sDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER :: BG.ByteString
sDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x68
    , 0x72
    , 0x65
    , 0x61
    , 0x64
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x65
    , 0x6E
    , 0x74
    , 0x72
    , 0x79
    , 0x5F
    , 0x66
    , 0x75
    , 0x6E
    , 0x63
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_THREAD_CREATE_NAME_STRING@, literal @\"SDL.thread.create.name\"@, defined at @SDL3\/SDL_thread.h 361:9@
sDL_PROP_THREAD_CREATE_NAME_STRING :: BG.ByteString
sDL_PROP_THREAD_CREATE_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x68
    , 0x72
    , 0x65
    , 0x61
    , 0x64
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_THREAD_CREATE_USERDATA_POINTER@, literal @\"SDL.thread.create.userdata\"@, defined at @SDL3\/SDL_thread.h 362:9@
sDL_PROP_THREAD_CREATE_USERDATA_POINTER :: BG.ByteString
sDL_PROP_THREAD_CREATE_USERDATA_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x68
    , 0x72
    , 0x65
    , 0x61
    , 0x64
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x75
    , 0x73
    , 0x65
    , 0x72
    , 0x64
    , 0x61
    , 0x74
    , 0x61
    ]

-- | [C declaration]: @macro SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER@, literal @\"SDL.thread.create.stacksize\"@, defined at @SDL3\/SDL_thread.h 363:9@
sDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER :: BG.ByteString
sDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x68
    , 0x72
    , 0x65
    , 0x61
    , 0x64
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x74
    , 0x61
    , 0x63
    , 0x6B
    , 0x73
    , 0x69
    , 0x7A
    , 0x65
    ]

-- | Auxiliary type used by 'SDL_TLSDestructorCallback'
--
--     [C declaration]: @SDL_TLSDestructorCallback@, defined at @SDL3\/SDL_thread.h 553:24@
newtype SDL_TLSDestructorCallback_Aux = SDL_TLSDestructorCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_TLSDestructorCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_7c0725308cb75f6c_base
    :: (BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toSDL_TLSDestructorCallback_Aux@
hs_bindgen_7c0725308cb75f6c
  :: SDL_TLSDestructorCallback_Aux
  -> IO (BG.FunPtr SDL_TLSDestructorCallback_Aux)
hs_bindgen_7c0725308cb75f6c =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_7c0725308cb75f6c_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_TLSDestructorCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_bbd67b4f21094dd4_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_TLSDestructorCallback_Aux@
hs_bindgen_bbd67b4f21094dd4
  :: BG.FunPtr SDL_TLSDestructorCallback_Aux
  -> SDL_TLSDestructorCallback_Aux
hs_bindgen_bbd67b4f21094dd4 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_bbd67b4f21094dd4_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_TLSDestructorCallback_Aux where
  toFunPtr = hs_bindgen_7c0725308cb75f6c

instance BG.FromFunPtr SDL_TLSDestructorCallback_Aux where
  fromFunPtr = hs_bindgen_bbd67b4f21094dd4

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_TLSDestructorCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 -> SDL_TLSDestructorCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_TLSDestructorCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TLSDestructorCallback_Aux "unwrap" where
  type
    CFieldType SDL_TLSDestructorCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> IO ()

  offset# = \_ -> \_ -> 0

-- | The callback used to cleanup data passed to SDL_SetTLS.
--
--     This is called when a thread exits, to allow an app to free any resources.
--
--     [@value@]: a pointer previously handed to SDL_SetTLS.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetTLS'
--
--     [C declaration]: @SDL_TLSDestructorCallback@, defined at @SDL3\/SDL_thread.h 553:24@
newtype SDL_TLSDestructorCallback = SDL_TLSDestructorCallback
  { unwrap :: BG.FunPtr SDL_TLSDestructorCallback_Aux
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
  (ty ~ BG.FunPtr SDL_TLSDestructorCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_TLSDestructorCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TLSDestructorCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_TLSDestructorCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_TLSDestructorCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TLSDestructorCallback "unwrap" where
  type
    CFieldType SDL_TLSDestructorCallback "unwrap" =
      BG.FunPtr SDL_TLSDestructorCallback_Aux

  offset# = \_ -> \_ -> 0
