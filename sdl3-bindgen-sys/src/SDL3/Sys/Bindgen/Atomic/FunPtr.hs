{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Atomic.FunPtr (
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_TryLockSpinlock,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_LockSpinlock,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_UnlockSpinlock,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_MemoryBarrierReleaseFunction,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_MemoryBarrierAcquireFunction,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_CompareAndSwapAtomicInt,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_SetAtomicInt,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_GetAtomicInt,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_AddAtomicInt,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_CompareAndSwapAtomicU32,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_SetAtomicU32,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_GetAtomicU32,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_AddAtomicU32,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_CompareAndSwapAtomicPointer,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_SetAtomicPointer,
  SDL3.Sys.Bindgen.Atomic.FunPtr.sDL_GetAtomicPointer,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Atomic
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_atomic.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_TryLockSpinlock */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3653769bf64cd142 (void)) ("
         , "  SDL_SpinLock *arg1"
         , ")"
         , "{"
         , "  return &SDL_TryLockSpinlock;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_LockSpinlock */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_192f3ef53748431b (void)) ("
         , "  SDL_SpinLock *arg1"
         , ")"
         , "{"
         , "  return &SDL_LockSpinlock;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_UnlockSpinlock */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_da14195ad2b603e0 (void)) ("
         , "  SDL_SpinLock *arg1"
         , ")"
         , "{"
         , "  return &SDL_UnlockSpinlock;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_MemoryBarrierReleaseFunction */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_4979d73c1ba41e39 (void)) (void)"
         , "{"
         , "  return &SDL_MemoryBarrierReleaseFunction;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_MemoryBarrierAcquireFunction */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_e6cbd7564a024d99 (void)) (void)"
         , "{"
         , "  return &SDL_MemoryBarrierAcquireFunction;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_CompareAndSwapAtomicInt */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c535bda19feaf153 (void)) ("
         , "  SDL_AtomicInt *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_CompareAndSwapAtomicInt;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_SetAtomicInt */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_281a397e642c4489 (void)) ("
         , "  SDL_AtomicInt *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_SetAtomicInt;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_GetAtomicInt */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_db9688135888e49b (void)) ("
         , "  SDL_AtomicInt *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAtomicInt;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_AddAtomicInt */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_3e37f598766ca408 (void)) ("
         , "  SDL_AtomicInt *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_AddAtomicInt;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_CompareAndSwapAtomicU32 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b4be57e876b926c0 (void)) ("
         , "  SDL_AtomicU32 *arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_CompareAndSwapAtomicU32;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_SetAtomicU32 */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_34e65bfeeaed8bb5 (void)) ("
         , "  SDL_AtomicU32 *arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_SetAtomicU32;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_GetAtomicU32 */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_89429d58246e8835 (void)) ("
         , "  SDL_AtomicU32 *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAtomicU32;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_AddAtomicU32 */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_74ebd3ff8c83f38e (void)) ("
         , "  SDL_AtomicU32 *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_AddAtomicU32;"
         , "#else"
         , "  SDL_SetError(\"SDL_AddAtomicU32 requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_CompareAndSwapAtomicPointer */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6871c50a63bfd9f4 (void)) ("
         , "  void **arg1,"
         , "  void *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_CompareAndSwapAtomicPointer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_SetAtomicPointer */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_f4bd3696da14dba9 (void)) ("
         , "  void **arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_SetAtomicPointer;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_GetAtomicPointer */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_dc36e65ef974254e (void)) ("
         , "  void **arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAtomicPointer;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_TryLockSpinlock@
foreign import ccall unsafe "hs_bindgen_3653769bf64cd142"
  hs_bindgen_3653769bf64cd142_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_TryLockSpinlock@
hs_bindgen_3653769bf64cd142 :: IO (BG.FunPtr (BG.Ptr SDL_SpinLock -> IO BG.CBool))
hs_bindgen_3653769bf64cd142 =
  BG.fromFFIType hs_bindgen_3653769bf64cd142_base

{-# NOINLINE sDL_TryLockSpinlock #-}

-- | Try to lock a spin lock by setting it to a non-zero value.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [@lock@]: a pointer to a lock variable.
--
--     [Returns]: true if the lock succeeded, false if the lock is already held.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockSpinlock', 'sDL_UnlockSpinlock'
--
--     [C declaration]: @SDL_TryLockSpinlock@, defined at @SDL3\/SDL_atomic.h 100:34@
sDL_TryLockSpinlock :: BG.FunPtr (BG.Ptr SDL_SpinLock -> IO BG.CBool)
sDL_TryLockSpinlock =
  BG.unsafePerformIO hs_bindgen_3653769bf64cd142

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_LockSpinlock@
foreign import ccall unsafe "hs_bindgen_192f3ef53748431b"
  hs_bindgen_192f3ef53748431b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_LockSpinlock@
hs_bindgen_192f3ef53748431b :: IO (BG.FunPtr (BG.Ptr SDL_SpinLock -> IO ()))
hs_bindgen_192f3ef53748431b =
  BG.fromFFIType hs_bindgen_192f3ef53748431b_base

{-# NOINLINE sDL_LockSpinlock #-}

-- | Lock a spin lock by setting it to a non-zero value.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [@lock@]: a pointer to a lock variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_TryLockSpinlock', 'sDL_UnlockSpinlock'
--
--     [C declaration]: @SDL_LockSpinlock@, defined at @SDL3\/SDL_atomic.h 117:34@
sDL_LockSpinlock :: BG.FunPtr (BG.Ptr SDL_SpinLock -> IO ())
sDL_LockSpinlock =
  BG.unsafePerformIO hs_bindgen_192f3ef53748431b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_UnlockSpinlock@
foreign import ccall unsafe "hs_bindgen_da14195ad2b603e0"
  hs_bindgen_da14195ad2b603e0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_UnlockSpinlock@
hs_bindgen_da14195ad2b603e0 :: IO (BG.FunPtr (BG.Ptr SDL_SpinLock -> IO ()))
hs_bindgen_da14195ad2b603e0 =
  BG.fromFFIType hs_bindgen_da14195ad2b603e0_base

{-# NOINLINE sDL_UnlockSpinlock #-}

-- | Unlock a spin lock by setting it to 0.
--
--     Always returns immediately.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [@lock@]: a pointer to a lock variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockSpinlock', 'sDL_TryLockSpinlock'
--
--     [C declaration]: @SDL_UnlockSpinlock@, defined at @SDL3\/SDL_atomic.h 136:34@
sDL_UnlockSpinlock :: BG.FunPtr (BG.Ptr SDL_SpinLock -> IO ())
sDL_UnlockSpinlock =
  BG.unsafePerformIO hs_bindgen_da14195ad2b603e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_MemoryBarrierReleaseFunction@
foreign import ccall unsafe "hs_bindgen_4979d73c1ba41e39"
  hs_bindgen_4979d73c1ba41e39_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_MemoryBarrierReleaseFunction@
hs_bindgen_4979d73c1ba41e39 :: IO (BG.FunPtr (IO ()))
hs_bindgen_4979d73c1ba41e39 =
  BG.fromFFIType hs_bindgen_4979d73c1ba41e39_base

{-# NOINLINE sDL_MemoryBarrierReleaseFunction #-}

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
--     [C declaration]: @SDL_MemoryBarrierReleaseFunction@, defined at @SDL3\/SDL_atomic.h 192:34@
sDL_MemoryBarrierReleaseFunction :: BG.FunPtr (IO ())
sDL_MemoryBarrierReleaseFunction =
  BG.unsafePerformIO hs_bindgen_4979d73c1ba41e39

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_MemoryBarrierAcquireFunction@
foreign import ccall unsafe "hs_bindgen_e6cbd7564a024d99"
  hs_bindgen_e6cbd7564a024d99_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_MemoryBarrierAcquireFunction@
hs_bindgen_e6cbd7564a024d99 :: IO (BG.FunPtr (IO ()))
hs_bindgen_e6cbd7564a024d99 =
  BG.fromFFIType hs_bindgen_e6cbd7564a024d99_base

{-# NOINLINE sDL_MemoryBarrierAcquireFunction #-}

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
--     [C declaration]: @SDL_MemoryBarrierAcquireFunction@, defined at @SDL3\/SDL_atomic.h 212:34@
sDL_MemoryBarrierAcquireFunction :: BG.FunPtr (IO ())
sDL_MemoryBarrierAcquireFunction =
  BG.unsafePerformIO hs_bindgen_e6cbd7564a024d99

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_CompareAndSwapAtomicInt@
foreign import ccall unsafe "hs_bindgen_c535bda19feaf153"
  hs_bindgen_c535bda19feaf153_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_CompareAndSwapAtomicInt@
hs_bindgen_c535bda19feaf153
  :: IO (BG.FunPtr (BG.Ptr SDL_AtomicInt -> BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_c535bda19feaf153 =
  BG.fromFFIType hs_bindgen_c535bda19feaf153_base

{-# NOINLINE sDL_CompareAndSwapAtomicInt #-}

-- | Set an atomic variable to a new value if it is currently an old value.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
--
--     [@oldval@]: the old value.
--
--     [@newval@]: the new value.
--
--     [Returns]: true if the atomic variable was set, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAtomicInt', 'sDL_SetAtomicInt'
--
--     [C declaration]: @SDL_CompareAndSwapAtomicInt@, defined at @SDL3\/SDL_atomic.h 415:34@
sDL_CompareAndSwapAtomicInt :: BG.FunPtr (BG.Ptr SDL_AtomicInt -> BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_CompareAndSwapAtomicInt =
  BG.unsafePerformIO hs_bindgen_c535bda19feaf153

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_SetAtomicInt@
foreign import ccall unsafe "hs_bindgen_281a397e642c4489"
  hs_bindgen_281a397e642c4489_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_SetAtomicInt@
hs_bindgen_281a397e642c4489 :: IO (BG.FunPtr (BG.Ptr SDL_AtomicInt -> BG.CInt -> IO BG.CInt))
hs_bindgen_281a397e642c4489 =
  BG.fromFFIType hs_bindgen_281a397e642c4489_base

{-# NOINLINE sDL_SetAtomicInt #-}

-- | Set an atomic variable to a value.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
--
--     [@v@]: the desired value.
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAtomicInt'
--
--     [C declaration]: @SDL_SetAtomicInt@, defined at @SDL3\/SDL_atomic.h 435:33@
sDL_SetAtomicInt :: BG.FunPtr (BG.Ptr SDL_AtomicInt -> BG.CInt -> IO BG.CInt)
sDL_SetAtomicInt =
  BG.unsafePerformIO hs_bindgen_281a397e642c4489

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_GetAtomicInt@
foreign import ccall unsafe "hs_bindgen_db9688135888e49b"
  hs_bindgen_db9688135888e49b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_GetAtomicInt@
hs_bindgen_db9688135888e49b :: IO (BG.FunPtr (BG.Ptr SDL_AtomicInt -> IO BG.CInt))
hs_bindgen_db9688135888e49b =
  BG.fromFFIType hs_bindgen_db9688135888e49b_base

{-# NOINLINE sDL_GetAtomicInt #-}

-- | Get the value of an atomic variable.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to an 'SDL_AtomicInt' variable.
--
--     [Returns]: the current value of an atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAtomicInt'
--
--     [C declaration]: @SDL_GetAtomicInt@, defined at @SDL3\/SDL_atomic.h 452:33@
sDL_GetAtomicInt :: BG.FunPtr (BG.Ptr SDL_AtomicInt -> IO BG.CInt)
sDL_GetAtomicInt =
  BG.unsafePerformIO hs_bindgen_db9688135888e49b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_AddAtomicInt@
foreign import ccall unsafe "hs_bindgen_3e37f598766ca408"
  hs_bindgen_3e37f598766ca408_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_AddAtomicInt@
hs_bindgen_3e37f598766ca408 :: IO (BG.FunPtr (BG.Ptr SDL_AtomicInt -> BG.CInt -> IO BG.CInt))
hs_bindgen_3e37f598766ca408 =
  BG.fromFFIType hs_bindgen_3e37f598766ca408_base

{-# NOINLINE sDL_AddAtomicInt #-}

-- | Add to an atomic variable.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
--
--     [@v@]: the desired value to add.
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_AtomicDecRef@, @SDL_AtomicIncRef@
--
--     [C declaration]: @SDL_AddAtomicInt@, defined at @SDL3\/SDL_atomic.h 473:33@
sDL_AddAtomicInt :: BG.FunPtr (BG.Ptr SDL_AtomicInt -> BG.CInt -> IO BG.CInt)
sDL_AddAtomicInt =
  BG.unsafePerformIO hs_bindgen_3e37f598766ca408

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_CompareAndSwapAtomicU32@
foreign import ccall unsafe "hs_bindgen_b4be57e876b926c0"
  hs_bindgen_b4be57e876b926c0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_CompareAndSwapAtomicU32@
hs_bindgen_b4be57e876b926c0
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_AtomicU32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_b4be57e876b926c0 =
  BG.fromFFIType hs_bindgen_b4be57e876b926c0_base

{-# NOINLINE sDL_CompareAndSwapAtomicU32 #-}

-- | Set an atomic variable to a new value if it is currently an old value.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
--
--     [@oldval@]: the old value.
--
--     [@newval@]: the new value.
--
--     [Returns]: true if the atomic variable was set, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAtomicU32', 'sDL_SetAtomicU32'
--
--     [C declaration]: @SDL_CompareAndSwapAtomicU32@, defined at @SDL3\/SDL_atomic.h 560:34@
sDL_CompareAndSwapAtomicU32
  :: BG.FunPtr
       ( BG.Ptr SDL_AtomicU32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_CompareAndSwapAtomicU32 =
  BG.unsafePerformIO hs_bindgen_b4be57e876b926c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_SetAtomicU32@
foreign import ccall unsafe "hs_bindgen_34e65bfeeaed8bb5"
  hs_bindgen_34e65bfeeaed8bb5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_SetAtomicU32@
hs_bindgen_34e65bfeeaed8bb5
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_AtomicU32 -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
       )
hs_bindgen_34e65bfeeaed8bb5 =
  BG.fromFFIType hs_bindgen_34e65bfeeaed8bb5_base

{-# NOINLINE sDL_SetAtomicU32 #-}

-- | Set an atomic variable to a value.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
--
--     [@v@]: the desired value.
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAtomicU32'
--
--     [C declaration]: @SDL_SetAtomicU32@, defined at @SDL3\/SDL_atomic.h 580:36@
sDL_SetAtomicU32
  :: BG.FunPtr
       (BG.Ptr SDL_AtomicU32 -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
sDL_SetAtomicU32 =
  BG.unsafePerformIO hs_bindgen_34e65bfeeaed8bb5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_GetAtomicU32@
foreign import ccall unsafe "hs_bindgen_89429d58246e8835"
  hs_bindgen_89429d58246e8835_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_GetAtomicU32@
hs_bindgen_89429d58246e8835
  :: IO (BG.FunPtr (BG.Ptr SDL_AtomicU32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_89429d58246e8835 =
  BG.fromFFIType hs_bindgen_89429d58246e8835_base

{-# NOINLINE sDL_GetAtomicU32 #-}

-- | Get the value of an atomic variable.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to an 'SDL_AtomicU32' variable.
--
--     [Returns]: the current value of an atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAtomicU32'
--
--     [C declaration]: @SDL_GetAtomicU32@, defined at @SDL3\/SDL_atomic.h 597:36@
sDL_GetAtomicU32 :: BG.FunPtr (BG.Ptr SDL_AtomicU32 -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
sDL_GetAtomicU32 =
  BG.unsafePerformIO hs_bindgen_89429d58246e8835

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_AddAtomicU32@
foreign import ccall unsafe "hs_bindgen_74ebd3ff8c83f38e"
  hs_bindgen_74ebd3ff8c83f38e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_AddAtomicU32@
hs_bindgen_74ebd3ff8c83f38e
  :: IO (BG.FunPtr (BG.Ptr SDL_AtomicU32 -> BG.CInt -> IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_74ebd3ff8c83f38e =
  BG.fromFFIType hs_bindgen_74ebd3ff8c83f38e_base

{-# NOINLINE sDL_AddAtomicU32 #-}

-- | Add to an atomic variable.
--
--     This function also acts as a full memory barrier.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
--
--     [@v@]: the desired value to add or subtract.
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.4.0
--
--     [C declaration]: @SDL_AddAtomicU32@, defined at @SDL3\/SDL_atomic.h 615:36@
sDL_AddAtomicU32 :: BG.FunPtr (BG.Ptr SDL_AtomicU32 -> BG.CInt -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
sDL_AddAtomicU32 =
  BG.unsafePerformIO hs_bindgen_74ebd3ff8c83f38e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_CompareAndSwapAtomicPointer@
foreign import ccall unsafe "hs_bindgen_6871c50a63bfd9f4"
  hs_bindgen_6871c50a63bfd9f4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_CompareAndSwapAtomicPointer@
hs_bindgen_6871c50a63bfd9f4
  :: IO (BG.FunPtr (BG.Ptr (BG.Ptr BG.Void) -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_6871c50a63bfd9f4 =
  BG.fromFFIType hs_bindgen_6871c50a63bfd9f4_base

{-# NOINLINE sDL_CompareAndSwapAtomicPointer #-}

-- | Set a pointer to a new value if it is currently an old value.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to a pointer.
--
--     [@oldval@]: the old pointer value.
--
--     [@newval@]: the new pointer value.
--
--     [Returns]: true if the pointer was set, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CompareAndSwapAtomicInt', 'sDL_GetAtomicPointer', 'sDL_SetAtomicPointer'
--
--     [C declaration]: @SDL_CompareAndSwapAtomicPointer@, defined at @SDL3\/SDL_atomic.h 636:34@
sDL_CompareAndSwapAtomicPointer
  :: BG.FunPtr (BG.Ptr (BG.Ptr BG.Void) -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_CompareAndSwapAtomicPointer =
  BG.unsafePerformIO hs_bindgen_6871c50a63bfd9f4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_SetAtomicPointer@
foreign import ccall unsafe "hs_bindgen_f4bd3696da14dba9"
  hs_bindgen_f4bd3696da14dba9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_SetAtomicPointer@
hs_bindgen_f4bd3696da14dba9
  :: IO (BG.FunPtr (BG.Ptr (BG.Ptr BG.Void) -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void)))
hs_bindgen_f4bd3696da14dba9 =
  BG.fromFFIType hs_bindgen_f4bd3696da14dba9_base

{-# NOINLINE sDL_SetAtomicPointer #-}

-- | Set a pointer to a value atomically.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to a pointer.
--
--     [@v@]: the desired pointer value.
--
--     [Returns]: the previous value of the pointer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CompareAndSwapAtomicPointer', 'sDL_GetAtomicPointer'
--
--     [C declaration]: @SDL_SetAtomicPointer@, defined at @SDL3\/SDL_atomic.h 655:36@
sDL_SetAtomicPointer :: BG.FunPtr (BG.Ptr (BG.Ptr BG.Void) -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void))
sDL_SetAtomicPointer =
  BG.unsafePerformIO hs_bindgen_f4bd3696da14dba9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_GetAtomicPointer@
foreign import ccall unsafe "hs_bindgen_dc36e65ef974254e"
  hs_bindgen_dc36e65ef974254e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_get_SDL_GetAtomicPointer@
hs_bindgen_dc36e65ef974254e :: IO (BG.FunPtr (BG.Ptr (BG.Ptr BG.Void) -> IO (BG.Ptr BG.Void)))
hs_bindgen_dc36e65ef974254e =
  BG.fromFFIType hs_bindgen_dc36e65ef974254e_base

{-# NOINLINE sDL_GetAtomicPointer #-}

-- | Get the value of a pointer atomically.
--
--     /__Note: If you don\'t know what this function is for, you shouldn\'t use it!__/
--
--     [@a@]: a pointer to a pointer.
--
--     [Returns]: the current value of a pointer.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CompareAndSwapAtomicPointer', 'sDL_SetAtomicPointer'
--
--     [C declaration]: @SDL_GetAtomicPointer@, defined at @SDL3\/SDL_atomic.h 673:36@
sDL_GetAtomicPointer :: BG.FunPtr (BG.Ptr (BG.Ptr BG.Void) -> IO (BG.Ptr BG.Void))
sDL_GetAtomicPointer =
  BG.unsafePerformIO hs_bindgen_dc36e65ef974254e
