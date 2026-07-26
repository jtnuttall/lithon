{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
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

module SDL3.Sys.Bindgen.Mutex (
  SDL3.Sys.Bindgen.Mutex.SDL_Mutex,
  SDL3.Sys.Bindgen.Mutex.SDL_RWLock,
  SDL3.Sys.Bindgen.Mutex.SDL_Semaphore,
  SDL3.Sys.Bindgen.Mutex.SDL_Condition,
  SDL3.Sys.Bindgen.Mutex.SDL_InitStatus (..),
  pattern SDL3.Sys.Bindgen.Mutex.SDL_INIT_STATUS_UNINITIALIZED,
  pattern SDL3.Sys.Bindgen.Mutex.SDL_INIT_STATUS_INITIALIZING,
  pattern SDL3.Sys.Bindgen.Mutex.SDL_INIT_STATUS_INITIALIZED,
  pattern SDL3.Sys.Bindgen.Mutex.SDL_INIT_STATUS_UNINITIALIZING,
  SDL3.Sys.Bindgen.Mutex.SDL_InitState (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Atomic qualified
import SDL3.Sys.Bindgen.Thread qualified

-- | A means to serialize access to a resource between threads.
--
--     Mutexes (short for \"mutual exclusion\") are a synchronization primitive that allows exactly one thread to proceed at a time.
--
--     Wikipedia has a thorough explanation of the concept:
--
--     [https:\/\/en.wikipedia.org\/wiki\/Mutex](https://en.wikipedia.org/wiki/Mutex)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_Mutex@, defined at @SDL3\/SDL_mutex.h 296:16@
data SDL_Mutex

-- | A mutex that allows read-only threads to run in parallel.
--
--     A rwlock is roughly the same concept as 'SDL_Mutex', but allows threads that request read-only access to all hold the lock at the same time. If a thread requests write access, it will block until all read-only threads have released the lock, and no one else can hold the thread (for reading or writing) at the same time as the writing thread.
--
--     This can be more efficient in cases where several threads need to access data frequently, but changes to that data are rare.
--
--     There are other rules that apply to rwlocks that don\'t apply to mutexes, about how threads are scheduled and when they can be recursively locked. These are documented in the other rwlock functions.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_RWLock@, defined at @SDL3\/SDL_mutex.h 437:16@
data SDL_RWLock

-- | A means to manage access to a resource, by count, between threads.
--
--     Semaphores (specifically, \"counting semaphores\"), let X number of threads request access at the same time, each thread granted access decrementing a counter. When the counter reaches zero, future requests block until a prior thread releases their request, incrementing the counter again.
--
--     Wikipedia has a thorough explanation of the concept:
--
--     [https:\/\/en.wikipedia.org\/wiki\/Semaphore_(programming)](https://en.wikipedia.org/wiki/Semaphore_(programming))
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_Semaphore@, defined at @SDL3\/SDL_mutex.h 682:16@
data SDL_Semaphore

-- | A means to block multiple threads until a condition is satisfied.
--
--     Condition variables, paired with an 'SDL_Mutex', let an app halt multiple threads until a condition has occurred, at which time the app can release one or all waiting threads.
--
--     Wikipedia has a thorough explanation of the concept:
--
--     [https:\/\/en.wikipedia.org\/wiki\/Condition_variable](https://en.wikipedia.org/wiki/Condition_variable)
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_Condition@, defined at @SDL3\/SDL_mutex.h 839:16@
data SDL_Condition

-- | The current status of an 'SDL_InitState' structure.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_InitStatus@, defined at @SDL3\/SDL_mutex.h 973:14@
newtype SDL_InitStatus = SDL_InitStatus
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_InitStatus where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_InitStatus where
  readRaw =
    \ptr0 ->
      pure SDL_InitStatus
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_InitStatus where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_InitStatus unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_InitStatus instance BG.Storable SDL_InitStatus

deriving via BG.CUInt instance BG.Prim SDL_InitStatus

instance CEnum.CEnum SDL_InitStatus where
  type CEnumZ SDL_InitStatus = BG.CUInt

  toCEnum = SDL_InitStatus

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_INIT_STATUS_UNINITIALIZED")
        , (1, BG.singleton "SDL_INIT_STATUS_INITIALIZING")
        , (2, BG.singleton "SDL_INIT_STATUS_INITIALIZED")
        , (3, BG.singleton "SDL_INIT_STATUS_UNINITIALIZING")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_InitStatus"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_InitStatus"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_InitStatus where
  minDeclaredValue = SDL_INIT_STATUS_UNINITIALIZED

  maxDeclaredValue = SDL_INIT_STATUS_UNINITIALIZING

instance Show SDL_InitStatus where
  showsPrec = CEnum.shows

instance Read SDL_InitStatus where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_InitStatus ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_InitStatus{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_InitStatus) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_InitStatus "unwrap" where
  type CFieldType SDL_InitStatus "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_INIT_STATUS_UNINITIALIZED@, defined at @SDL3\/SDL_mutex.h 975:5@
pattern SDL_INIT_STATUS_UNINITIALIZED :: SDL_InitStatus
pattern SDL_INIT_STATUS_UNINITIALIZED = SDL_InitStatus 0

-- | [C declaration]: @SDL_INIT_STATUS_INITIALIZING@, defined at @SDL3\/SDL_mutex.h 976:5@
pattern SDL_INIT_STATUS_INITIALIZING :: SDL_InitStatus
pattern SDL_INIT_STATUS_INITIALIZING = SDL_InitStatus 1

-- | [C declaration]: @SDL_INIT_STATUS_INITIALIZED@, defined at @SDL3\/SDL_mutex.h 977:5@
pattern SDL_INIT_STATUS_INITIALIZED :: SDL_InitStatus
pattern SDL_INIT_STATUS_INITIALIZED = SDL_InitStatus 2

-- | [C declaration]: @SDL_INIT_STATUS_UNINITIALIZING@, defined at @SDL3\/SDL_mutex.h 978:5@
pattern SDL_INIT_STATUS_UNINITIALIZING :: SDL_InitStatus
pattern SDL_INIT_STATUS_UNINITIALIZING = SDL_InitStatus 3

-- | A structure used for thread-safe initialization and shutdown.
--
--     Here is an example of using this:
--
--     @
--     static SDL_InitState init;
--
--     bool InitSystem(void)
--     {
--         if (!SDL_ShouldInit(&init)) {
--             \/\/ The system is initialized
--             return true;
--         }
--
--         \/\/ At this point, you should not leave this function without calling SDL_SetInitialized()
--
--         bool initialized = DoInitTasks();
--         SDL_SetInitialized(&init, initialized);
--         return initialized;
--     }
--
--     bool UseSubsystem(void)
--     {
--         if (SDL_ShouldInit(&init)) {
--             \/\/ Error, the subsystem isn\'t initialized
--             SDL_SetInitialized(&init, false);
--             return false;
--         }
--
--         \/\/ Do work using the initialized subsystem
--
--         return true;
--     }
--
--     void QuitSystem(void)
--     {
--         if (!SDL_ShouldQuit(&init)) {
--             \/\/ The system is not initialized
--             return;
--         }
--
--         \/\/ At this point, you should not leave this function without calling SDL_SetInitialized()
--
--         DoQuitTasks();
--         SDL_SetInitialized(&init, false);
--     }
--     @
--
--     Note that this doesn\'t protect any resources created during initialization, or guarantee that nobody is using those resources during cleanup. You should use other mechanisms to protect those, if that\'s a concern for your code.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_InitState@, defined at @SDL3\/SDL_mutex.h 1037:16@
data SDL_InitState = SDL_InitState
  { status :: SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt
  -- ^ [C declaration]: @status@, defined at @SDL3\/SDL_mutex.h 1039:19@
  , thread :: SDL3.Sys.Bindgen.Thread.SDL_ThreadID
  -- ^ [C declaration]: @thread@, defined at @SDL3\/SDL_mutex.h 1040:18@
  , reserved :: BG.Ptr BG.Void
  -- ^ [C declaration]: @reserved@, defined at @SDL3\/SDL_mutex.h 1041:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_InitState where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_InitState where
  readRaw =
    \ptr0 ->
      pure SDL_InitState
        <*> HasCField.readRaw (BG.Proxy @"status") ptr0
        <*> HasCField.readRaw (BG.Proxy @"thread") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0

instance Marshal.WriteRaw SDL_InitState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_InitState status2 thread3 reserved4 ->
            HasCField.writeRaw (BG.Proxy @"status") ptr0 status2
              >> HasCField.writeRaw (BG.Proxy @"thread") ptr0 thread3
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved4

deriving via Marshal.EquivStorable SDL_InitState instance BG.Storable SDL_InitState

instance
  (ty ~ SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt)
  => BG.CompatHasField.HasField "status" SDL_InitState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_InitState
            { status = y1
            , thread = BG.getField @"thread" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"status" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt)
  => BG.HasField "status" (BG.Ptr SDL_InitState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"status")

instance HasCField.HasCField SDL_InitState "status" where
  type
    CFieldType SDL_InitState "status" =
      SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Thread.SDL_ThreadID)
  => BG.CompatHasField.HasField "thread" SDL_InitState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_InitState
            { thread = y1
            , status = BG.getField @"status" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"thread" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Thread.SDL_ThreadID)
  => BG.HasField "thread" (BG.Ptr SDL_InitState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"thread")

instance HasCField.HasCField SDL_InitState "thread" where
  type
    CFieldType SDL_InitState "thread" =
      SDL3.Sys.Bindgen.Thread.SDL_ThreadID

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "reserved" SDL_InitState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_InitState
            { reserved = y1
            , status = BG.getField @"status" x0
            , thread = BG.getField @"thread" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "reserved" (BG.Ptr SDL_InitState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_InitState "reserved" where
  type
    CFieldType SDL_InitState "reserved" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 16
