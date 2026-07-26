{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | Atomic operations.
--
--     IMPORTANT: If you are not an expert in concurrent lockless programming, you should not be using any functions in this file. You should be protecting your data structures with full mutexes instead.
--
--     /__Seriously, here be dragons!__/
--
--     You can find out a little more about lockless programming and the subtle issues that can arise here: [https:\/\/learn.microsoft.com\/en-us\/windows\/win32\/dxtecharts\/lockless-programming](https://learn.microsoft.com/en-us/windows/win32/dxtecharts/lockless-programming)
--
--     There\'s also lots of good information here:
--
--     * [https:\/\/www.1024cores.net\/home\/lock-free-algorithms](https://www.1024cores.net/home/lock-free-algorithms)
--
--     * [https:\/\/preshing.com\/](https://preshing.com/)
--
--     These operations may or may not actually be implemented using processor specific atomic operations. When possible they are implemented as true processor specific atomic operations. When that is not possible the are implemented using locks that /do/ use the available atomic operations.
--
--     All of the atomic operations that modify memory are full memory barriers. An atomic spinlock.
--
--     The atomic locks are efficient spinlocks using CPU instructions, but are vulnerable to starvation and can spin forever if a thread holding a lock has been terminated. For this reason you should minimize the code executed inside an atomic lock and never do expensive things like API or system calls while holding them.
--
--     They are also vulnerable to starvation if the thread holding the lock is lower priority than other threads and doesn\'t get scheduled. In general you should use mutexes instead, since they have better performance and contention behavior.
--
--     The atomic locks are not safe to lock recursively.
--
--     Porting Note: The spin lock functions and type are required and can not be emulated because they are used in the atomic emulation code.
module SDL3.Sys.Bindgen.Atomic (
  SDL3.Sys.Bindgen.Atomic.SDL_SpinLock (..),
  SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt (..),
  SDL3.Sys.Bindgen.Atomic.SDL_AtomicU32 (..),
)
where

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_SpinLock@, defined at @SDL3\/SDL_atomic.h 82:13@
newtype SDL_SpinLock = SDL_SpinLock
  { unwrap :: BG.CInt
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
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_SpinLock ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SpinLock{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_SpinLock) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_SpinLock "unwrap" where
  type CFieldType SDL_SpinLock "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | A type representing an atomic integer value.
--
--     This can be used to manage a value that is synchronized across multiple CPUs without a race condition; when an app sets a value with SDL_SetAtomicInt all other threads, regardless of the CPU it is running on, will see that value when retrieved with SDL_GetAtomicInt, regardless of CPU caches, etc.
--
--     This is also useful for atomic compare-and-swap operations: a thread can change the value as long as its current value matches expectations. When done in a loop, one can guarantee data consistency across threads without a lock (but the usual warnings apply: if you don\'t know what you\'re doing, or you don\'t do it carefully, you can confidently cause any number of disasters with this, so in most cases, you /should/ use a mutex instead of this!).
--
--     This is a struct so people don\'t accidentally use numeric operations on it directly. You have to use SDL atomic functions.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CompareAndSwapAtomicInt', 'sDL_GetAtomicInt', 'sDL_SetAtomicInt', 'sDL_AddAtomicInt'
--
--     [C declaration]: @struct SDL_AtomicInt@, defined at @SDL3\/SDL_atomic.h 395:16@
data SDL_AtomicInt = SDL_AtomicInt
  { value :: BG.CInt
  -- ^ [C declaration]: @value@, defined at @SDL3\/SDL_atomic.h 395:36@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_AtomicInt where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_AtomicInt where
  readRaw =
    \ptr0 ->
      pure SDL_AtomicInt
        <*> HasCField.readRaw (BG.Proxy @"value") ptr0

instance Marshal.WriteRaw SDL_AtomicInt where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AtomicInt value2 ->
            HasCField.writeRaw (BG.Proxy @"value") ptr0 value2

deriving via Marshal.EquivStorable SDL_AtomicInt instance BG.Storable SDL_AtomicInt

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "value" SDL_AtomicInt ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AtomicInt{value = y1}
      , BG.getField @"value" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "value" (BG.Ptr SDL_AtomicInt) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"value")

instance HasCField.HasCField SDL_AtomicInt "value" where
  type CFieldType SDL_AtomicInt "value" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | A type representing an atomic unsigned 32-bit value.
--
--     This can be used to manage a value that is synchronized across multiple CPUs without a race condition; when an app sets a value with SDL_SetAtomicU32 all other threads, regardless of the CPU it is running on, will see that value when retrieved with SDL_GetAtomicU32, regardless of CPU caches, etc.
--
--     This is also useful for atomic compare-and-swap operations: a thread can change the value as long as its current value matches expectations. When done in a loop, one can guarantee data consistency across threads without a lock (but the usual warnings apply: if you don\'t know what you\'re doing, or you don\'t do it carefully, you can confidently cause any number of disasters with this, so in most cases, you /should/ use a mutex instead of this!).
--
--     This is a struct so people don\'t accidentally use numeric operations on it directly. You have to use SDL atomic functions.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CompareAndSwapAtomicU32', 'sDL_GetAtomicU32', 'sDL_SetAtomicU32'
--
--     [C declaration]: @struct SDL_AtomicU32@, defined at @SDL3\/SDL_atomic.h 540:16@
data SDL_AtomicU32 = SDL_AtomicU32
  { value :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @value@, defined at @SDL3\/SDL_atomic.h 540:39@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_AtomicU32 where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_AtomicU32 where
  readRaw =
    \ptr0 ->
      pure SDL_AtomicU32
        <*> HasCField.readRaw (BG.Proxy @"value") ptr0

instance Marshal.WriteRaw SDL_AtomicU32 where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AtomicU32 value2 ->
            HasCField.writeRaw (BG.Proxy @"value") ptr0 value2

deriving via Marshal.EquivStorable SDL_AtomicU32 instance BG.Storable SDL_AtomicU32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "value" SDL_AtomicU32 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AtomicU32{value = y1}
      , BG.getField @"value" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "value" (BG.Ptr SDL_AtomicU32) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"value")

instance HasCField.HasCField SDL_AtomicU32 "value" where
  type
    CFieldType SDL_AtomicU32 "value" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0
