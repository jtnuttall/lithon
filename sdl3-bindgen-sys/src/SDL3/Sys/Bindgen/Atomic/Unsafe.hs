{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Atomic.Unsafe (
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_TryLockSpinlock,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_LockSpinlock,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_UnlockSpinlock,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_MemoryBarrierReleaseFunction,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_MemoryBarrierAcquireFunction,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_CompareAndSwapAtomicInt,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_SetAtomicInt,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_GetAtomicInt,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_AddAtomicInt,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_CompareAndSwapAtomicU32,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_SetAtomicU32,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_GetAtomicU32,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_AddAtomicU32,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_CompareAndSwapAtomicPointer,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_SetAtomicPointer,
  SDL3.Sys.Bindgen.Atomic.Unsafe.sDL_GetAtomicPointer,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Atomic
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_atomic.h>"
         , "_Bool hs_bindgen_7e1a623878ef7201 ("
         , "  SDL_SpinLock *arg1"
         , ")"
         , "{"
         , "  return (SDL_TryLockSpinlock)(arg1);"
         , "}"
         , "void hs_bindgen_ac33cd18d7856e17 ("
         , "  SDL_SpinLock *arg1"
         , ")"
         , "{"
         , "  (SDL_LockSpinlock)(arg1);"
         , "}"
         , "void hs_bindgen_025b3bf7538a123c ("
         , "  SDL_SpinLock *arg1"
         , ")"
         , "{"
         , "  (SDL_UnlockSpinlock)(arg1);"
         , "}"
         , "void hs_bindgen_0e27a69a6cca6aac (void)"
         , "{"
         , "  (SDL_MemoryBarrierReleaseFunction)();"
         , "}"
         , "void hs_bindgen_0eaa15705859b209 (void)"
         , "{"
         , "  (SDL_MemoryBarrierAcquireFunction)();"
         , "}"
         , "_Bool hs_bindgen_7528ef136d782538 ("
         , "  SDL_AtomicInt *arg1,"
         , "  signed int arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_CompareAndSwapAtomicInt)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_6267a61e0fd93b33 ("
         , "  SDL_AtomicInt *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_SetAtomicInt)(arg1, arg2);"
         , "}"
         , "signed int hs_bindgen_5d8655898ff6cb2a ("
         , "  SDL_AtomicInt *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAtomicInt)(arg1);"
         , "}"
         , "signed int hs_bindgen_072d591dbe0586a7 ("
         , "  SDL_AtomicInt *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return (SDL_AddAtomicInt)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_f42a3f89648096cd ("
         , "  SDL_AtomicU32 *arg1,"
         , "  Uint32 arg2,"
         , "  Uint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_CompareAndSwapAtomicU32)(arg1, arg2, arg3);"
         , "}"
         , "Uint32 hs_bindgen_f11ee3aacbcad44d ("
         , "  SDL_AtomicU32 *arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_SetAtomicU32)(arg1, arg2);"
         , "}"
         , "Uint32 hs_bindgen_8dd395b4cca78369 ("
         , "  SDL_AtomicU32 *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAtomicU32)(arg1);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "Uint32 hs_bindgen_faa1fbc7406c4097 ("
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
         , "_Bool hs_bindgen_b184ba517671509d ("
         , "  void **arg1,"
         , "  void *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_CompareAndSwapAtomicPointer)(arg1, arg2, arg3);"
         , "}"
         , "void *hs_bindgen_c511073c2deacde8 ("
         , "  void **arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return (SDL_SetAtomicPointer)(arg1, arg2);"
         , "}"
         , "void *hs_bindgen_24c92517dd70cd57 ("
         , "  void **arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAtomicPointer)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_TryLockSpinlock@
foreign import ccall unsafe "hs_bindgen_7e1a623878ef7201"
  hs_bindgen_7e1a623878ef7201_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_TryLockSpinlock@
hs_bindgen_7e1a623878ef7201
  :: BG.Ptr SDL_SpinLock
  -> IO BG.CBool
hs_bindgen_7e1a623878ef7201 =
  BG.fromFFIType hs_bindgen_7e1a623878ef7201_base

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
sDL_TryLockSpinlock = hs_bindgen_7e1a623878ef7201

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_LockSpinlock@
foreign import ccall unsafe "hs_bindgen_ac33cd18d7856e17"
  hs_bindgen_ac33cd18d7856e17_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_LockSpinlock@
hs_bindgen_ac33cd18d7856e17
  :: BG.Ptr SDL_SpinLock
  -> IO ()
hs_bindgen_ac33cd18d7856e17 =
  BG.fromFFIType hs_bindgen_ac33cd18d7856e17_base

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
sDL_LockSpinlock = hs_bindgen_ac33cd18d7856e17

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_UnlockSpinlock@
foreign import ccall unsafe "hs_bindgen_025b3bf7538a123c"
  hs_bindgen_025b3bf7538a123c_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_UnlockSpinlock@
hs_bindgen_025b3bf7538a123c
  :: BG.Ptr SDL_SpinLock
  -> IO ()
hs_bindgen_025b3bf7538a123c =
  BG.fromFFIType hs_bindgen_025b3bf7538a123c_base

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
sDL_UnlockSpinlock = hs_bindgen_025b3bf7538a123c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_MemoryBarrierReleaseFunction@
foreign import ccall unsafe "hs_bindgen_0e27a69a6cca6aac"
  hs_bindgen_0e27a69a6cca6aac_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_MemoryBarrierReleaseFunction@
hs_bindgen_0e27a69a6cca6aac :: IO ()
hs_bindgen_0e27a69a6cca6aac =
  BG.fromFFIType hs_bindgen_0e27a69a6cca6aac_base

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
  hs_bindgen_0e27a69a6cca6aac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_MemoryBarrierAcquireFunction@
foreign import ccall unsafe "hs_bindgen_0eaa15705859b209"
  hs_bindgen_0eaa15705859b209_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_MemoryBarrierAcquireFunction@
hs_bindgen_0eaa15705859b209 :: IO ()
hs_bindgen_0eaa15705859b209 =
  BG.fromFFIType hs_bindgen_0eaa15705859b209_base

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
  hs_bindgen_0eaa15705859b209

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_CompareAndSwapAtomicInt@
foreign import ccall unsafe "hs_bindgen_7528ef136d782538"
  hs_bindgen_7528ef136d782538_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_CompareAndSwapAtomicInt@
hs_bindgen_7528ef136d782538
  :: BG.Ptr SDL_AtomicInt
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_7528ef136d782538 =
  BG.fromFFIType hs_bindgen_7528ef136d782538_base

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
  hs_bindgen_7528ef136d782538

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_SetAtomicInt@
foreign import ccall unsafe "hs_bindgen_6267a61e0fd93b33"
  hs_bindgen_6267a61e0fd93b33_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_SetAtomicInt@
hs_bindgen_6267a61e0fd93b33
  :: BG.Ptr SDL_AtomicInt
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_6267a61e0fd93b33 =
  BG.fromFFIType hs_bindgen_6267a61e0fd93b33_base

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
sDL_SetAtomicInt = hs_bindgen_6267a61e0fd93b33

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_GetAtomicInt@
foreign import ccall unsafe "hs_bindgen_5d8655898ff6cb2a"
  hs_bindgen_5d8655898ff6cb2a_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_GetAtomicInt@
hs_bindgen_5d8655898ff6cb2a
  :: BG.Ptr SDL_AtomicInt
  -> IO BG.CInt
hs_bindgen_5d8655898ff6cb2a =
  BG.fromFFIType hs_bindgen_5d8655898ff6cb2a_base

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
sDL_GetAtomicInt = hs_bindgen_5d8655898ff6cb2a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_AddAtomicInt@
foreign import ccall unsafe "hs_bindgen_072d591dbe0586a7"
  hs_bindgen_072d591dbe0586a7_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_AddAtomicInt@
hs_bindgen_072d591dbe0586a7
  :: BG.Ptr SDL_AtomicInt
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_072d591dbe0586a7 =
  BG.fromFFIType hs_bindgen_072d591dbe0586a7_base

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
sDL_AddAtomicInt = hs_bindgen_072d591dbe0586a7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_CompareAndSwapAtomicU32@
foreign import ccall unsafe "hs_bindgen_f42a3f89648096cd"
  hs_bindgen_f42a3f89648096cd_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_CompareAndSwapAtomicU32@
hs_bindgen_f42a3f89648096cd
  :: BG.Ptr SDL_AtomicU32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_f42a3f89648096cd =
  BG.fromFFIType hs_bindgen_f42a3f89648096cd_base

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
  hs_bindgen_f42a3f89648096cd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_SetAtomicU32@
foreign import ccall unsafe "hs_bindgen_f11ee3aacbcad44d"
  hs_bindgen_f11ee3aacbcad44d_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_SetAtomicU32@
hs_bindgen_f11ee3aacbcad44d
  :: BG.Ptr SDL_AtomicU32
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_f11ee3aacbcad44d =
  BG.fromFFIType hs_bindgen_f11ee3aacbcad44d_base

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
sDL_SetAtomicU32 = hs_bindgen_f11ee3aacbcad44d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_GetAtomicU32@
foreign import ccall unsafe "hs_bindgen_8dd395b4cca78369"
  hs_bindgen_8dd395b4cca78369_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_GetAtomicU32@
hs_bindgen_8dd395b4cca78369
  :: BG.Ptr SDL_AtomicU32
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_8dd395b4cca78369 =
  BG.fromFFIType hs_bindgen_8dd395b4cca78369_base

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
sDL_GetAtomicU32 = hs_bindgen_8dd395b4cca78369

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_AddAtomicU32@
foreign import ccall unsafe "hs_bindgen_faa1fbc7406c4097"
  hs_bindgen_faa1fbc7406c4097_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_AddAtomicU32@
hs_bindgen_faa1fbc7406c4097
  :: BG.Ptr SDL_AtomicU32
  -> BG.CInt
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_faa1fbc7406c4097 =
  BG.fromFFIType hs_bindgen_faa1fbc7406c4097_base

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
sDL_AddAtomicU32 = hs_bindgen_faa1fbc7406c4097

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_CompareAndSwapAtomicPointer@
foreign import ccall unsafe "hs_bindgen_b184ba517671509d"
  hs_bindgen_b184ba517671509d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_CompareAndSwapAtomicPointer@
hs_bindgen_b184ba517671509d
  :: BG.Ptr (BG.Ptr BG.Void)
  -> BG.Ptr BG.Void
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_b184ba517671509d =
  BG.fromFFIType hs_bindgen_b184ba517671509d_base

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
  hs_bindgen_b184ba517671509d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_SetAtomicPointer@
foreign import ccall unsafe "hs_bindgen_c511073c2deacde8"
  hs_bindgen_c511073c2deacde8_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_SetAtomicPointer@
hs_bindgen_c511073c2deacde8
  :: BG.Ptr (BG.Ptr BG.Void)
  -> BG.Ptr BG.Void
  -> IO (BG.Ptr BG.Void)
hs_bindgen_c511073c2deacde8 =
  BG.fromFFIType hs_bindgen_c511073c2deacde8_base

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
sDL_SetAtomicPointer = hs_bindgen_c511073c2deacde8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_GetAtomicPointer@
foreign import ccall unsafe "hs_bindgen_24c92517dd70cd57"
  hs_bindgen_24c92517dd70cd57_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Atomic_Unsafe_SDL_GetAtomicPointer@
hs_bindgen_24c92517dd70cd57
  :: BG.Ptr (BG.Ptr BG.Void)
  -> IO (BG.Ptr BG.Void)
hs_bindgen_24c92517dd70cd57 =
  BG.fromFFIType hs_bindgen_24c92517dd70cd57_base

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
sDL_GetAtomicPointer = hs_bindgen_24c92517dd70cd57
