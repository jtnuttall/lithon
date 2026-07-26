{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Atomic.Safe (
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_TryLockSpinlock,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_LockSpinlock,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_UnlockSpinlock,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_MemoryBarrierReleaseFunction,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_MemoryBarrierAcquireFunction,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_CompareAndSwapAtomicInt,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_SetAtomicInt,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_GetAtomicInt,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_AddAtomicInt,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_CompareAndSwapAtomicU32,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_SetAtomicU32,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_GetAtomicU32,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_AddAtomicU32,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_CompareAndSwapAtomicPointer,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_SetAtomicPointer,
  SDL3.Sys.Bindgen.Atomic.Safe.sDL_GetAtomicPointer,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Atomic
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_atomic.h>"
         , "_Bool hs_bindgen_172686d1676cd710 ("
         , "  SDL_SpinLock *arg1"
         , ")"
         , "{"
         , "  return (SDL_TryLockSpinlock)(arg1);"
         , "}"
         , "void hs_bindgen_24dd21497804fb35 ("
         , "  SDL_SpinLock *arg1"
         , ")"
         , "{"
         , "  (SDL_LockSpinlock)(arg1);"
         , "}"
         , "void hs_bindgen_db995a2e290168e8 ("
         , "  SDL_SpinLock *arg1"
         , ")"
         , "{"
         , "  (SDL_UnlockSpinlock)(arg1);"
         , "}"
         , "void hs_bindgen_242899706a6f2e17 (void)"
         , "{"
         , "  (SDL_MemoryBarrierReleaseFunction)();"
         , "}"
         , "void hs_bindgen_4e0cd51f93ed2a72 (void)"
         , "{"
         , "  (SDL_MemoryBarrierAcquireFunction)();"
         , "}"
         , "_Bool hs_bindgen_e3e24329b42ecc89 ("
         , "  SDL_AtomicInt *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_CompareAndSwapAtomicInt)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_0b591b00447451f3 ("
         , "  SDL_AtomicInt *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_SetAtomicInt)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_a79c0e141e6af2a9 ("
         , "  SDL_AtomicInt *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAtomicInt)(arg1);"
         , "}"
         , "signed int hs_bindgen_8436b21863a9d6bb ("
         , "  SDL_AtomicInt *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_AddAtomicInt)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_935e1a8a131d0775 ("
         , "  SDL_AtomicU32 *arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_CompareAndSwapAtomicU32)(arg1, arg2, arg3);"
         , "}"
         , "Uint32 hs_bindgen_14474ef0e01d438d ("
         , "  SDL_AtomicU32 *arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_SetAtomicU32)(arg1, arg2);"
         , "}"
         , "Uint32 hs_bindgen_141a90ab67d079cd ("
         , "  SDL_AtomicU32 *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAtomicU32)(arg1);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "Uint32 hs_bindgen_a1640976428ead6d ("
         , "  SDL_AtomicU32 *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_AddAtomicU32)(arg1, arg2);"
         , "#else"
         , "  (void)arg1; (void)arg2; SDL_SetError(\"SDL_AddAtomicU32 requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "_Bool hs_bindgen_7fbbd1e4574eb707 ("
         , "  void **arg1,"
         , "  void *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_CompareAndSwapAtomicPointer)(arg1, arg2, arg3);"
         , "}"
         , "void *hs_bindgen_169f34ca098fd557 ("
         , "  void **arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetAtomicPointer)(arg1, arg2);"
         , "}"
         , "void *hs_bindgen_330ea044308fd995 ("
         , "  void **arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAtomicPointer)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_TryLockSpinlock@
foreign import ccall safe "hs_bindgen_172686d1676cd710"
  hs_bindgen_172686d1676cd710_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_TryLockSpinlock@
hs_bindgen_172686d1676cd710
  :: BG.Ptr SDL_SpinLock
  -> IO BG.CBool
hs_bindgen_172686d1676cd710 =
  BG.fromFFIType hs_bindgen_172686d1676cd710_base

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
--     [See also]: 'sDL_LockSpinlock', 'sDL_UnlockSpinlock'
--
--     [C declaration]: @SDL_TryLockSpinlock@, defined at @SDL3\/SDL_atomic.h 100:34@
sDL_TryLockSpinlock
  :: BG.Ptr SDL_SpinLock
  -- ^
  --
  --           [@lock@]: a pointer to a lock variable.
  -> IO BG.CBool
sDL_TryLockSpinlock = hs_bindgen_172686d1676cd710

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_LockSpinlock@
foreign import ccall safe "hs_bindgen_24dd21497804fb35"
  hs_bindgen_24dd21497804fb35_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_LockSpinlock@
hs_bindgen_24dd21497804fb35
  :: BG.Ptr SDL_SpinLock
  -> IO ()
hs_bindgen_24dd21497804fb35 =
  BG.fromFFIType hs_bindgen_24dd21497804fb35_base

-- | Lock a spin lock by setting it to a non-zero value.
--
--     /__Please note that spinlocks are dangerous if you don\'t know what you\'re doing. Please be careful using any sort of spinlock!__/
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_TryLockSpinlock', 'sDL_UnlockSpinlock'
--
--     [C declaration]: @SDL_LockSpinlock@, defined at @SDL3\/SDL_atomic.h 117:34@
sDL_LockSpinlock
  :: BG.Ptr SDL_SpinLock
  -- ^
  --
  --           [@lock@]: a pointer to a lock variable.
  -> IO ()
sDL_LockSpinlock = hs_bindgen_24dd21497804fb35

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_UnlockSpinlock@
foreign import ccall safe "hs_bindgen_db995a2e290168e8"
  hs_bindgen_db995a2e290168e8_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_UnlockSpinlock@
hs_bindgen_db995a2e290168e8
  :: BG.Ptr SDL_SpinLock
  -> IO ()
hs_bindgen_db995a2e290168e8 =
  BG.fromFFIType hs_bindgen_db995a2e290168e8_base

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
--     [See also]: 'sDL_LockSpinlock', 'sDL_TryLockSpinlock'
--
--     [C declaration]: @SDL_UnlockSpinlock@, defined at @SDL3\/SDL_atomic.h 136:34@
sDL_UnlockSpinlock
  :: BG.Ptr SDL_SpinLock
  -- ^
  --
  --           [@lock@]: a pointer to a lock variable.
  -> IO ()
sDL_UnlockSpinlock = hs_bindgen_db995a2e290168e8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_MemoryBarrierReleaseFunction@
foreign import ccall safe "hs_bindgen_242899706a6f2e17"
  hs_bindgen_242899706a6f2e17_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_MemoryBarrierReleaseFunction@
hs_bindgen_242899706a6f2e17 :: IO ()
hs_bindgen_242899706a6f2e17 =
  BG.fromFFIType hs_bindgen_242899706a6f2e17_base

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
sDL_MemoryBarrierReleaseFunction :: IO ()
sDL_MemoryBarrierReleaseFunction =
  hs_bindgen_242899706a6f2e17

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_MemoryBarrierAcquireFunction@
foreign import ccall safe "hs_bindgen_4e0cd51f93ed2a72"
  hs_bindgen_4e0cd51f93ed2a72_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_MemoryBarrierAcquireFunction@
hs_bindgen_4e0cd51f93ed2a72 :: IO ()
hs_bindgen_4e0cd51f93ed2a72 =
  BG.fromFFIType hs_bindgen_4e0cd51f93ed2a72_base

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
sDL_MemoryBarrierAcquireFunction :: IO ()
sDL_MemoryBarrierAcquireFunction =
  hs_bindgen_4e0cd51f93ed2a72

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_CompareAndSwapAtomicInt@
foreign import ccall safe "hs_bindgen_e3e24329b42ecc89"
  hs_bindgen_e3e24329b42ecc89_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_CompareAndSwapAtomicInt@
hs_bindgen_e3e24329b42ecc89
  :: BG.Ptr SDL_AtomicInt
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_e3e24329b42ecc89 =
  BG.fromFFIType hs_bindgen_e3e24329b42ecc89_base

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
--     [See also]: 'sDL_GetAtomicInt', 'sDL_SetAtomicInt'
--
--     [C declaration]: @SDL_CompareAndSwapAtomicInt@, defined at @SDL3\/SDL_atomic.h 415:34@
sDL_CompareAndSwapAtomicInt
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
  -> BG.CInt
  -- ^
  --
  --           [@oldval@]: the old value.
  -> BG.CInt
  -- ^
  --
  --           [@newval@]: the new value.
  -> IO BG.CBool
sDL_CompareAndSwapAtomicInt =
  hs_bindgen_e3e24329b42ecc89

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_SetAtomicInt@
foreign import ccall safe "hs_bindgen_0b591b00447451f3"
  hs_bindgen_0b591b00447451f3_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_SetAtomicInt@
hs_bindgen_0b591b00447451f3
  :: BG.Ptr SDL_AtomicInt
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_0b591b00447451f3 =
  BG.fromFFIType hs_bindgen_0b591b00447451f3_base

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
--     [See also]: 'sDL_GetAtomicInt'
--
--     [C declaration]: @SDL_SetAtomicInt@, defined at @SDL3\/SDL_atomic.h 435:33@
sDL_SetAtomicInt
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
  -> BG.CInt
  -- ^
  --
  --           [@v@]: the desired value.
  -> IO BG.CInt
sDL_SetAtomicInt = hs_bindgen_0b591b00447451f3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_GetAtomicInt@
foreign import ccall safe "hs_bindgen_a79c0e141e6af2a9"
  hs_bindgen_a79c0e141e6af2a9_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_GetAtomicInt@
hs_bindgen_a79c0e141e6af2a9
  :: BG.Ptr SDL_AtomicInt
  -> IO BG.CInt
hs_bindgen_a79c0e141e6af2a9 =
  BG.fromFFIType hs_bindgen_a79c0e141e6af2a9_base

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
--     [See also]: 'sDL_SetAtomicInt'
--
--     [C declaration]: @SDL_GetAtomicInt@, defined at @SDL3\/SDL_atomic.h 452:33@
sDL_GetAtomicInt
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable.
  -> IO BG.CInt
sDL_GetAtomicInt = hs_bindgen_a79c0e141e6af2a9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_AddAtomicInt@
foreign import ccall safe "hs_bindgen_8436b21863a9d6bb"
  hs_bindgen_8436b21863a9d6bb_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_AddAtomicInt@
hs_bindgen_8436b21863a9d6bb
  :: BG.Ptr SDL_AtomicInt
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_8436b21863a9d6bb =
  BG.fromFFIType hs_bindgen_8436b21863a9d6bb_base

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
--     [C declaration]: @SDL_AddAtomicInt@, defined at @SDL3\/SDL_atomic.h 473:33@
sDL_AddAtomicInt
  :: BG.Ptr SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicInt' variable to be modified.
  -> BG.CInt
  -- ^
  --
  --           [@v@]: the desired value to add.
  -> IO BG.CInt
sDL_AddAtomicInt = hs_bindgen_8436b21863a9d6bb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_CompareAndSwapAtomicU32@
foreign import ccall safe "hs_bindgen_935e1a8a131d0775"
  hs_bindgen_935e1a8a131d0775_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_CompareAndSwapAtomicU32@
hs_bindgen_935e1a8a131d0775
  :: BG.Ptr SDL_AtomicU32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_935e1a8a131d0775 =
  BG.fromFFIType hs_bindgen_935e1a8a131d0775_base

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
--     [See also]: 'sDL_GetAtomicU32', 'sDL_SetAtomicU32'
--
--     [C declaration]: @SDL_CompareAndSwapAtomicU32@, defined at @SDL3\/SDL_atomic.h 560:34@
sDL_CompareAndSwapAtomicU32
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@oldval@]: the old value.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@newval@]: the new value.
  -> IO BG.CBool
sDL_CompareAndSwapAtomicU32 =
  hs_bindgen_935e1a8a131d0775

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_SetAtomicU32@
foreign import ccall safe "hs_bindgen_14474ef0e01d438d"
  hs_bindgen_14474ef0e01d438d_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_SetAtomicU32@
hs_bindgen_14474ef0e01d438d
  :: BG.Ptr SDL_AtomicU32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_14474ef0e01d438d =
  BG.fromFFIType hs_bindgen_14474ef0e01d438d_base

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
--     [See also]: 'sDL_GetAtomicU32'
--
--     [C declaration]: @SDL_SetAtomicU32@, defined at @SDL3\/SDL_atomic.h 580:36@
sDL_SetAtomicU32
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@v@]: the desired value.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_SetAtomicU32 = hs_bindgen_14474ef0e01d438d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_GetAtomicU32@
foreign import ccall safe "hs_bindgen_141a90ab67d079cd"
  hs_bindgen_141a90ab67d079cd_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_GetAtomicU32@
hs_bindgen_141a90ab67d079cd
  :: BG.Ptr SDL_AtomicU32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_141a90ab67d079cd =
  BG.fromFFIType hs_bindgen_141a90ab67d079cd_base

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
--     [See also]: 'sDL_SetAtomicU32'
--
--     [C declaration]: @SDL_GetAtomicU32@, defined at @SDL3\/SDL_atomic.h 597:36@
sDL_GetAtomicU32
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_GetAtomicU32 = hs_bindgen_141a90ab67d079cd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_AddAtomicU32@
foreign import ccall safe "hs_bindgen_a1640976428ead6d"
  hs_bindgen_a1640976428ead6d_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_AddAtomicU32@
hs_bindgen_a1640976428ead6d
  :: BG.Ptr SDL_AtomicU32
  -> BG.CInt
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_a1640976428ead6d =
  BG.fromFFIType hs_bindgen_a1640976428ead6d_base

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
--     [C declaration]: @SDL_AddAtomicU32@, defined at @SDL3\/SDL_atomic.h 615:36@
sDL_AddAtomicU32
  :: BG.Ptr SDL_AtomicU32
  -- ^
  --
  --           [@a@]: a pointer to an 'SDL_AtomicU32' variable to be modified.
  -> BG.CInt
  -- ^
  --
  --           [@v@]: the desired value to add or subtract.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_AddAtomicU32 = hs_bindgen_a1640976428ead6d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_CompareAndSwapAtomicPointer@
foreign import ccall safe "hs_bindgen_7fbbd1e4574eb707"
  hs_bindgen_7fbbd1e4574eb707_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_CompareAndSwapAtomicPointer@
hs_bindgen_7fbbd1e4574eb707
  :: BG.Ptr (BG.Ptr BG.Void)
  -> BG.Ptr BG.Void
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_7fbbd1e4574eb707 =
  BG.fromFFIType hs_bindgen_7fbbd1e4574eb707_base

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
--     [See also]: 'sDL_CompareAndSwapAtomicInt', 'sDL_GetAtomicPointer', 'sDL_SetAtomicPointer'
--
--     [C declaration]: @SDL_CompareAndSwapAtomicPointer@, defined at @SDL3\/SDL_atomic.h 636:34@
sDL_CompareAndSwapAtomicPointer
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
  -> IO BG.CBool
sDL_CompareAndSwapAtomicPointer =
  hs_bindgen_7fbbd1e4574eb707

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_SetAtomicPointer@
foreign import ccall safe "hs_bindgen_169f34ca098fd557"
  hs_bindgen_169f34ca098fd557_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_SetAtomicPointer@
hs_bindgen_169f34ca098fd557
  :: BG.Ptr (BG.Ptr BG.Void)
  -> BG.Ptr BG.Void
  -> IO (BG.Ptr BG.Void)
hs_bindgen_169f34ca098fd557 =
  BG.fromFFIType hs_bindgen_169f34ca098fd557_base

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
--     [See also]: 'sDL_CompareAndSwapAtomicPointer', 'sDL_GetAtomicPointer'
--
--     [C declaration]: @SDL_SetAtomicPointer@, defined at @SDL3\/SDL_atomic.h 655:36@
sDL_SetAtomicPointer
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@a@]: a pointer to a pointer.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@v@]: the desired pointer value.
  -> IO (BG.Ptr BG.Void)
sDL_SetAtomicPointer = hs_bindgen_169f34ca098fd557

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_GetAtomicPointer@
foreign import ccall safe "hs_bindgen_330ea044308fd995"
  hs_bindgen_330ea044308fd995_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Safe_SDL_GetAtomicPointer@
hs_bindgen_330ea044308fd995
  :: BG.Ptr (BG.Ptr BG.Void)
  -> IO (BG.Ptr BG.Void)
hs_bindgen_330ea044308fd995 =
  BG.fromFFIType hs_bindgen_330ea044308fd995_base

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
--     [See also]: 'sDL_CompareAndSwapAtomicPointer', 'sDL_SetAtomicPointer'
--
--     [C declaration]: @SDL_GetAtomicPointer@, defined at @SDL3\/SDL_atomic.h 673:36@
sDL_GetAtomicPointer
  :: BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@a@]: a pointer to a pointer.
  -> IO (BG.Ptr BG.Void)
sDL_GetAtomicPointer = hs_bindgen_330ea044308fd995
