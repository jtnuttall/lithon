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
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Atomic.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Atomic (
  module SDL3.Sys.Bindgen.Atomic,

  -- * Function aliases
  SDL3.Sys.Atomic.tryLockSpinlock,
  SDL3.Sys.Atomic.tryLockSpinlockSafe,
  SDL3.Sys.Atomic.lockSpinlock,
  SDL3.Sys.Atomic.lockSpinlockSafe,
  SDL3.Sys.Atomic.unlockSpinlock,
  SDL3.Sys.Atomic.unlockSpinlockSafe,
  SDL3.Sys.Atomic.memoryBarrierReleaseFunction,
  SDL3.Sys.Atomic.memoryBarrierReleaseFunctionSafe,
  SDL3.Sys.Atomic.memoryBarrierAcquireFunction,
  SDL3.Sys.Atomic.memoryBarrierAcquireFunctionSafe,
  SDL3.Sys.Atomic.compareAndSwapAtomicInt,
  SDL3.Sys.Atomic.compareAndSwapAtomicIntSafe,
  SDL3.Sys.Atomic.setAtomicInt,
  SDL3.Sys.Atomic.setAtomicIntSafe,
  SDL3.Sys.Atomic.getAtomicInt,
  SDL3.Sys.Atomic.getAtomicIntSafe,
  SDL3.Sys.Atomic.addAtomicInt,
  SDL3.Sys.Atomic.addAtomicIntSafe,
  SDL3.Sys.Atomic.compareAndSwapAtomicU32,
  SDL3.Sys.Atomic.compareAndSwapAtomicU32Safe,
  SDL3.Sys.Atomic.setAtomicU32,
  SDL3.Sys.Atomic.setAtomicU32Safe,
  SDL3.Sys.Atomic.getAtomicU32,
  SDL3.Sys.Atomic.getAtomicU32Safe,
  SDL3.Sys.Atomic.addAtomicU32,
  SDL3.Sys.Atomic.addAtomicU32Safe,
  SDL3.Sys.Atomic.compareAndSwapAtomicPointer,
  SDL3.Sys.Atomic.compareAndSwapAtomicPointerSafe,
  SDL3.Sys.Atomic.setAtomicPointer,
  SDL3.Sys.Atomic.setAtomicPointerSafe,
  SDL3.Sys.Atomic.getAtomicPointer,
  SDL3.Sys.Atomic.getAtomicPointerSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Atomic
import SDL3.Sys.Bindgen.Atomic.Safe qualified as Safe
import SDL3.Sys.Bindgen.Atomic.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Try to lock a spin lock by setting it to a non-zero value.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [Returns]: true if the lock succeeded, false if the lock is already held.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockSpinlock', 'unlockSpinlock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TryLockSpinlock@.
--                   The safe flavor is 'tryLockSpinlockSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryLockSpinlock@, defined at @SDL3\/SDL_atomic.h 100:34@
tryLockSpinlock
  :: BG.Ptr SDL_SpinLock
  -- ^
  --
  --           [@lock@]: a pointer to a lock variable.
  -> IO Bool
tryLockSpinlock =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_TryLockSpinlock x00)

-- | Try to lock a spin lock by setting it to a non-zero value.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [Returns]: true if the lock succeeded, false if the lock is already held.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockSpinlock', 'unlockSpinlock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TryLockSpinlock@.
--                   The unsafe flavor is 'tryLockSpinlock'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryLockSpinlock@, defined at @SDL3\/SDL_atomic.h 100:34@
tryLockSpinlockSafe
  :: BG.Ptr SDL_SpinLock
  -- ^
  --
  --           [@lock@]: a pointer to a lock variable.
  -> IO Bool
tryLockSpinlockSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_TryLockSpinlock x00)

-- | Lock a spin lock by setting it to a non-zero value.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'tryLockSpinlock', 'unlockSpinlock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockSpinlock@.
--                   The safe flavor is 'lockSpinlockSafe'
--                   .
--
--     [C declaration]: @SDL_LockSpinlock@, defined at @SDL3\/SDL_atomic.h 117:34@
lockSpinlock
  :: BG.Ptr SDL_SpinLock
  -- ^
  --
  --           [@lock@]: a pointer to a lock variable.
  -> IO ()
lockSpinlock = Unsafe.sDL_LockSpinlock

-- | Lock a spin lock by setting it to a non-zero value.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'tryLockSpinlock', 'unlockSpinlock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockSpinlock@.
--                   The unsafe flavor is 'lockSpinlock'
--                   .
--
--     [C declaration]: @SDL_LockSpinlock@, defined at @SDL3\/SDL_atomic.h 117:34@
lockSpinlockSafe
  :: BG.Ptr SDL_SpinLock
  -- ^
  --
  --           [@lock@]: a pointer to a lock variable.
  -> IO ()
lockSpinlockSafe = Safe.sDL_LockSpinlock

-- | Unlock a spin lock by setting it to 0.
--
--     Always returns immediately.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockSpinlock', 'tryLockSpinlock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnlockSpinlock@.
--                   The safe flavor is 'unlockSpinlockSafe'
--                   .
--
--     [C declaration]: @SDL_UnlockSpinlock@, defined at @SDL3\/SDL_atomic.h 136:34@
unlockSpinlock
  :: BG.Ptr SDL_SpinLock
  -- ^
  --
  --           [@lock@]: a pointer to a lock variable.
  -> IO ()
unlockSpinlock = Unsafe.sDL_UnlockSpinlock

-- | Unlock a spin lock by setting it to 0.
--
--     Always returns immediately.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockSpinlock', 'tryLockSpinlock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnlockSpinlock@.
--                   The unsafe flavor is 'unlockSpinlock'
--                   .
--
--     [C declaration]: @SDL_UnlockSpinlock@, defined at @SDL3\/SDL_atomic.h 136:34@
unlockSpinlockSafe
  :: BG.Ptr SDL_SpinLock
  -- ^
  --
  --           [@lock@]: a pointer to a lock variable.
  -> IO ()
unlockSpinlockSafe = Safe.sDL_UnlockSpinlock

-- | Insert a memory release barrier (function version).
--
--     Please refer to SDL_MemoryBarrierRelease for details. This is a function version, which might be useful if you need to use this functionality from a scripting language, etc. Also, some of the macro versions call this function behind the scenes, where more heavy lifting can happen inside of SDL. Generally, though, an app written in C\/C++\/etc should use the macro version, as it will be more efficient.
--
--     [Thread safety]: Obviously this function is safe to use from any thread at any time, but if you find yourself needing this, you are probably dealing with some very sensitive code; be careful!
--
--     @since 3.2.0
--
--     [See also]: @SDL_MemoryBarrierRelease@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MemoryBarrierReleaseFunction@.
--                   The safe flavor is 'memoryBarrierReleaseFunctionSafe'
--                   .
--
--     [C declaration]: @SDL_MemoryBarrierReleaseFunction@, defined at @SDL3\/SDL_atomic.h 192:34@
memoryBarrierReleaseFunction :: IO ()
memoryBarrierReleaseFunction =
  Unsafe.sDL_MemoryBarrierReleaseFunction

-- | Insert a memory release barrier (function version).
--
--     Please refer to SDL_MemoryBarrierRelease for details. This is a function version, which might be useful if you need to use this functionality from a scripting language, etc. Also, some of the macro versions call this function behind the scenes, where more heavy lifting can happen inside of SDL. Generally, though, an app written in C\/C++\/etc should use the macro version, as it will be more efficient.
--
--     [Thread safety]: Obviously this function is safe to use from any thread at any time, but if you find yourself needing this, you are probably dealing with some very sensitive code; be careful!
--
--     @since 3.2.0
--
--     [See also]: @SDL_MemoryBarrierRelease@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MemoryBarrierReleaseFunction@.
--                   The unsafe flavor is 'memoryBarrierReleaseFunction'
--                   .
--
--     [C declaration]: @SDL_MemoryBarrierReleaseFunction@, defined at @SDL3\/SDL_atomic.h 192:34@
memoryBarrierReleaseFunctionSafe :: IO ()
memoryBarrierReleaseFunctionSafe =
  Safe.sDL_MemoryBarrierReleaseFunction

-- | Insert a memory acquire barrier (function version).
--
--     Please refer to SDL_MemoryBarrierRelease for details. This is a function version, which might be useful if you need to use this functionality from a scripting language, etc. Also, some of the macro versions call this function behind the scenes, where more heavy lifting can happen inside of SDL. Generally, though, an app written in C\/C++\/etc should use the macro version, as it will be more efficient.
--
--     [Thread safety]: Obviously this function is safe to use from any thread at any time, but if you find yourself needing this, you are probably dealing with some very sensitive code; be careful!
--
--     @since 3.2.0
--
--     [See also]: @SDL_MemoryBarrierAcquire@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MemoryBarrierAcquireFunction@.
--                   The safe flavor is 'memoryBarrierAcquireFunctionSafe'
--                   .
--
--     [C declaration]: @SDL_MemoryBarrierAcquireFunction@, defined at @SDL3\/SDL_atomic.h 212:34@
memoryBarrierAcquireFunction :: IO ()
memoryBarrierAcquireFunction =
  Unsafe.sDL_MemoryBarrierAcquireFunction

-- | Insert a memory acquire barrier (function version).
--
--     Please refer to SDL_MemoryBarrierRelease for details. This is a function version, which might be useful if you need to use this functionality from a scripting language, etc. Also, some of the macro versions call this function behind the scenes, where more heavy lifting can happen inside of SDL. Generally, though, an app written in C\/C++\/etc should use the macro version, as it will be more efficient.
--
--     [Thread safety]: Obviously this function is safe to use from any thread at any time, but if you find yourself needing this, you are probably dealing with some very sensitive code; be careful!
--
--     @since 3.2.0
--
--     [See also]: @SDL_MemoryBarrierAcquire@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MemoryBarrierAcquireFunction@.
--                   The unsafe flavor is 'memoryBarrierAcquireFunction'
--                   .
--
--     [C declaration]: @SDL_MemoryBarrierAcquireFunction@, defined at @SDL3\/SDL_atomic.h 212:34@
memoryBarrierAcquireFunctionSafe :: IO ()
memoryBarrierAcquireFunctionSafe =
  Safe.sDL_MemoryBarrierAcquireFunction

-- | Set an atomic variable to a new value if it is currently an old value.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: true if the atomic variable was set, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAtomicInt', 'setAtomicInt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CompareAndSwapAtomicInt@.
--                   The safe flavor is 'compareAndSwapAtomicIntSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CompareAndSwapAtomicInt@, defined at @SDL3\/SDL_atomic.h 415:34@
compareAndSwapAtomicInt
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
  -> BG.Int32
  -- ^
  --
  --           [@oldval@]: the old value.
  -> BG.Int32
  -- ^
  --
  --           [@newval@]: the new value.
  -> IO Bool
compareAndSwapAtomicInt =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_CompareAndSwapAtomicInt x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set an atomic variable to a new value if it is currently an old value.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: true if the atomic variable was set, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAtomicInt', 'setAtomicInt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CompareAndSwapAtomicInt@.
--                   The unsafe flavor is 'compareAndSwapAtomicInt'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CompareAndSwapAtomicInt@, defined at @SDL3\/SDL_atomic.h 415:34@
compareAndSwapAtomicIntSafe
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
  -> BG.Int32
  -- ^
  --
  --           [@oldval@]: the old value.
  -> BG.Int32
  -- ^
  --
  --           [@newval@]: the new value.
  -> IO Bool
compareAndSwapAtomicIntSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_CompareAndSwapAtomicInt x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set an atomic variable to a value.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAtomicInt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAtomicInt@.
--                   The safe flavor is 'setAtomicIntSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAtomicInt@, defined at @SDL3\/SDL_atomic.h 435:33@
setAtomicInt
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
  -> BG.Int32
  -- ^
  --
  --           [@v@]: the desired value.
  -> IO BG.Int32
setAtomicInt =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_SetAtomicInt x00 (Coerce.coerce x11))

-- | Set an atomic variable to a value.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAtomicInt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAtomicInt@.
--                   The unsafe flavor is 'setAtomicInt'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAtomicInt@, defined at @SDL3\/SDL_atomic.h 435:33@
setAtomicIntSafe
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
  -> BG.Int32
  -- ^
  --
  --           [@v@]: the desired value.
  -> IO BG.Int32
setAtomicIntSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_SetAtomicInt x00 (Coerce.coerce x11))

-- | Get the value of an atomic variable.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the current value of an atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAtomicInt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAtomicInt@.
--                   The safe flavor is 'getAtomicIntSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAtomicInt@, defined at @SDL3\/SDL_atomic.h 452:33@
getAtomicInt
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable.
  -> IO BG.Int32
getAtomicInt =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetAtomicInt x00)

-- | Get the value of an atomic variable.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the current value of an atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAtomicInt'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAtomicInt@.
--                   The unsafe flavor is 'getAtomicInt'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAtomicInt@, defined at @SDL3\/SDL_atomic.h 452:33@
getAtomicIntSafe
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable.
  -> IO BG.Int32
getAtomicIntSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetAtomicInt x00)

-- | Add to an atomic variable.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_AtomicDecRef@, @SDL_AtomicIncRef@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddAtomicInt@.
--                   The safe flavor is 'addAtomicIntSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddAtomicInt@, defined at @SDL3\/SDL_atomic.h 473:33@
addAtomicInt
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
  -> BG.Int32
  -- ^
  --
  --           [@v@]: the desired value to add.
  -> IO BG.Int32
addAtomicInt =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_AddAtomicInt x00 (Coerce.coerce x11))

-- | Add to an atomic variable.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_AtomicDecRef@, @SDL_AtomicIncRef@
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddAtomicInt@.
--                   The unsafe flavor is 'addAtomicInt'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddAtomicInt@, defined at @SDL3\/SDL_atomic.h 473:33@
addAtomicIntSafe
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
  -> BG.Int32
  -- ^
  --
  --           [@v@]: the desired value to add.
  -> IO BG.Int32
addAtomicIntSafe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_AddAtomicInt x00 (Coerce.coerce x11))

-- | Set an atomic variable to a new value if it is currently an old value.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: true if the atomic variable was set, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAtomicU32', 'setAtomicU32'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CompareAndSwapAtomicU32@.
--                   The safe flavor is 'compareAndSwapAtomicU32Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CompareAndSwapAtomicU32@, defined at @SDL3\/SDL_atomic.h 560:34@
compareAndSwapAtomicU32
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
  -> BG.Word32
  -- ^
  --
  --           [@oldval@]: the old value.
  -> BG.Word32
  -- ^
  --
  --           [@newval@]: the new value.
  -> IO Bool
compareAndSwapAtomicU32 =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_CompareAndSwapAtomicU32 x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set an atomic variable to a new value if it is currently an old value.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: true if the atomic variable was set, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAtomicU32', 'setAtomicU32'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CompareAndSwapAtomicU32@.
--                   The unsafe flavor is 'compareAndSwapAtomicU32'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CompareAndSwapAtomicU32@, defined at @SDL3\/SDL_atomic.h 560:34@
compareAndSwapAtomicU32Safe
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
  -> BG.Word32
  -- ^
  --
  --           [@oldval@]: the old value.
  -> BG.Word32
  -- ^
  --
  --           [@newval@]: the new value.
  -> IO Bool
compareAndSwapAtomicU32Safe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_CompareAndSwapAtomicU32 x00 (Coerce.coerce x11) (Coerce.coerce x22))

-- | Set an atomic variable to a value.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAtomicU32'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAtomicU32@.
--                   The safe flavor is 'setAtomicU32Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAtomicU32@, defined at @SDL3\/SDL_atomic.h 580:36@
setAtomicU32
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
  -> BG.Word32
  -- ^
  --
  --           [@v@]: the desired value.
  -> IO BG.Word32
setAtomicU32 =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_SetAtomicU32 x00 (Coerce.coerce x11))

-- | Set an atomic variable to a value.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAtomicU32'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAtomicU32@.
--                   The unsafe flavor is 'setAtomicU32'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAtomicU32@, defined at @SDL3\/SDL_atomic.h 580:36@
setAtomicU32Safe
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
  -> BG.Word32
  -- ^
  --
  --           [@v@]: the desired value.
  -> IO BG.Word32
setAtomicU32Safe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_SetAtomicU32 x00 (Coerce.coerce x11))

-- | Get the value of an atomic variable.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the current value of an atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAtomicU32'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAtomicU32@.
--                   The safe flavor is 'getAtomicU32Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAtomicU32@, defined at @SDL3\/SDL_atomic.h 597:36@
getAtomicU32
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable.
  -> IO BG.Word32
getAtomicU32 =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetAtomicU32 x00)

-- | Get the value of an atomic variable.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the current value of an atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAtomicU32'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAtomicU32@.
--                   The unsafe flavor is 'getAtomicU32'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAtomicU32@, defined at @SDL3\/SDL_atomic.h 597:36@
getAtomicU32Safe
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable.
  -> IO BG.Word32
getAtomicU32Safe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetAtomicU32 x00)

-- | Add to an atomic variable.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AddAtomicU32@.
--                   The safe flavor is 'addAtomicU32Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddAtomicU32@, defined at @SDL3\/SDL_atomic.h 615:36@
addAtomicU32
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
  -> BG.Int32
  -- ^
  --
  --           [@v@]: the desired value to add or subtract.
  -> IO BG.Word32
addAtomicU32 =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Unsafe.sDL_AddAtomicU32 x00 (Coerce.coerce x11))

-- | Add to an atomic variable.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AddAtomicU32@.
--                   The unsafe flavor is 'addAtomicU32'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AddAtomicU32@, defined at @SDL3\/SDL_atomic.h 615:36@
addAtomicU32Safe
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
  -> BG.Int32
  -- ^
  --
  --           [@v@]: the desired value to add or subtract.
  -> IO BG.Word32
addAtomicU32Safe =
  \x00 ->
    \x11 ->
      fmap Coerce.coerce (Safe.sDL_AddAtomicU32 x00 (Coerce.coerce x11))

-- | Set a pointer to a new value if it is currently an old value.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: true if the pointer was set, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'compareAndSwapAtomicInt', 'getAtomicPointer', 'setAtomicPointer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CompareAndSwapAtomicPointer@.
--                   The safe flavor is 'compareAndSwapAtomicPointerSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CompareAndSwapAtomicPointer@, defined at @SDL3\/SDL_atomic.h 636:34@
compareAndSwapAtomicPointer
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@a@]: a pointer to a pointer.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@oldval@]: the old pointer value.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@newval@]: the new pointer value.
  -> IO Bool
compareAndSwapAtomicPointer =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_CompareAndSwapAtomicPointer x00 x11 x22)

-- | Set a pointer to a new value if it is currently an old value.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: true if the pointer was set, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'compareAndSwapAtomicInt', 'getAtomicPointer', 'setAtomicPointer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CompareAndSwapAtomicPointer@.
--                   The unsafe flavor is 'compareAndSwapAtomicPointer'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CompareAndSwapAtomicPointer@, defined at @SDL3\/SDL_atomic.h 636:34@
compareAndSwapAtomicPointerSafe
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@a@]: a pointer to a pointer.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@oldval@]: the old pointer value.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@newval@]: the new pointer value.
  -> IO Bool
compareAndSwapAtomicPointerSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_CompareAndSwapAtomicPointer x00 x11 x22)

-- | Set a pointer to a value atomically.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the pointer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'compareAndSwapAtomicPointer', 'getAtomicPointer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAtomicPointer@.
--                   The safe flavor is 'setAtomicPointerSafe'
--                   .
--
--     [C declaration]: @SDL_SetAtomicPointer@, defined at @SDL3\/SDL_atomic.h 655:36@
setAtomicPointer
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@a@]: a pointer to a pointer.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@v@]: the desired pointer value.
  -> IO (BG.Ptr BG.Void)
setAtomicPointer = Unsafe.sDL_SetAtomicPointer

-- | Set a pointer to a value atomically.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the previous value of the pointer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'compareAndSwapAtomicPointer', 'getAtomicPointer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAtomicPointer@.
--                   The unsafe flavor is 'setAtomicPointer'
--                   .
--
--     [C declaration]: @SDL_SetAtomicPointer@, defined at @SDL3\/SDL_atomic.h 655:36@
setAtomicPointerSafe
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@a@]: a pointer to a pointer.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@v@]: the desired pointer value.
  -> IO (BG.Ptr BG.Void)
setAtomicPointerSafe = Safe.sDL_SetAtomicPointer

-- | Get the value of a pointer atomically.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the current value of a pointer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'compareAndSwapAtomicPointer', 'setAtomicPointer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAtomicPointer@.
--                   The safe flavor is 'getAtomicPointerSafe'
--                   .
--
--     [C declaration]: @SDL_GetAtomicPointer@, defined at @SDL3\/SDL_atomic.h 673:36@
getAtomicPointer
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@a@]: a pointer to a pointer.
  -> IO (BG.Ptr BG.Void)
getAtomicPointer = Unsafe.sDL_GetAtomicPointer

-- | Get the value of a pointer atomically.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [Returns]: the current value of a pointer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'compareAndSwapAtomicPointer', 'setAtomicPointer'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAtomicPointer@.
--                   The unsafe flavor is 'getAtomicPointer'
--                   .
--
--     [C declaration]: @SDL_GetAtomicPointer@, defined at @SDL3\/SDL_atomic.h 673:36@
getAtomicPointerSafe
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@a@]: a pointer to a pointer.
  -> IO (BG.Ptr BG.Void)
getAtomicPointerSafe = Safe.sDL_GetAtomicPointer
