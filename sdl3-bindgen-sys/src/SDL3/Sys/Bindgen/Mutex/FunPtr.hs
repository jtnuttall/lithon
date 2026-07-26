{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Mutex.FunPtr (
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_CreateMutex,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_LockMutex,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_TryLockMutex,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_UnlockMutex,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_DestroyMutex,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_CreateRWLock,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_LockRWLockForReading,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_LockRWLockForWriting,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_TryLockRWLockForReading,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_TryLockRWLockForWriting,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_UnlockRWLock,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_DestroyRWLock,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_CreateSemaphore,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_DestroySemaphore,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_WaitSemaphore,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_TryWaitSemaphore,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_WaitSemaphoreTimeout,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_SignalSemaphore,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_GetSemaphoreValue,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_CreateCondition,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_DestroyCondition,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_SignalCondition,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_BroadcastCondition,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_WaitCondition,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_WaitConditionTimeout,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_ShouldInit,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_ShouldQuit,
  SDL3.Sys.Bindgen.Mutex.FunPtr.sDL_SetInitialized,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Mutex
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_mutex.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateMutex */"
         , "__attribute__ ((const))"
         , "SDL_Mutex *(*hs_bindgen_95a099535000d13d (void)) (void)"
         , "{"
         , "  return &SDL_CreateMutex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_LockMutex */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_df61bce804eff3b2 (void)) ("
         , "  SDL_Mutex *arg1"
         , ")"
         , "{"
         , "  return &SDL_LockMutex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryLockMutex */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_45c6ae563e57d83e (void)) ("
         , "  SDL_Mutex *arg1"
         , ")"
         , "{"
         , "  return &SDL_TryLockMutex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_UnlockMutex */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_279301ff47dc6a1f (void)) ("
         , "  SDL_Mutex *arg1"
         , ")"
         , "{"
         , "  return &SDL_UnlockMutex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroyMutex */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_41ed6e14b48302a3 (void)) ("
         , "  SDL_Mutex *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyMutex;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateRWLock */"
         , "__attribute__ ((const))"
         , "SDL_RWLock *(*hs_bindgen_3eb0c1367593e404 (void)) (void)"
         , "{"
         , "  return &SDL_CreateRWLock;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_LockRWLockForReading */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_1d6189a38a9e5f28 (void)) ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  return &SDL_LockRWLockForReading;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_LockRWLockForWriting */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_badbac25bb2ac3e5 (void)) ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  return &SDL_LockRWLockForWriting;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryLockRWLockForReading */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1e5ea8850474c50f (void)) ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  return &SDL_TryLockRWLockForReading;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryLockRWLockForWriting */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a11f0d78039b31a7 (void)) ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  return &SDL_TryLockRWLockForWriting;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_UnlockRWLock */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_769c3da328a63de5 (void)) ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  return &SDL_UnlockRWLock;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroyRWLock */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_7a7492595f34e502 (void)) ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyRWLock;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateSemaphore */"
         , "__attribute__ ((const))"
         , "SDL_Semaphore *(*hs_bindgen_22509b0bb44ec2c1 (void)) ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateSemaphore;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroySemaphore */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_1f077a5303df061a (void)) ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroySemaphore;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitSemaphore */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_91a2349e7496eeae (void)) ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  return &SDL_WaitSemaphore;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryWaitSemaphore */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_81872972bd3486d3 (void)) ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  return &SDL_TryWaitSemaphore;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitSemaphoreTimeout */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_0a26128dc146ea69 (void)) ("
         , "  SDL_Semaphore *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_WaitSemaphoreTimeout;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_SignalSemaphore */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_9af09ce180d458b9 (void)) ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  return &SDL_SignalSemaphore;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_GetSemaphoreValue */"
         , "__attribute__ ((const))"
         , "Uint32 (*hs_bindgen_5ee888052e9adc81 (void)) ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSemaphoreValue;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateCondition */"
         , "__attribute__ ((const))"
         , "SDL_Condition *(*hs_bindgen_07cf0a76ca2c83d0 (void)) (void)"
         , "{"
         , "  return &SDL_CreateCondition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroyCondition */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_99bba06553492457 (void)) ("
         , "  SDL_Condition *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyCondition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_SignalCondition */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_a9b4bfe1c85d2caa (void)) ("
         , "  SDL_Condition *arg1"
         , ")"
         , "{"
         , "  return &SDL_SignalCondition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_BroadcastCondition */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_26d1393d70aa1e21 (void)) ("
         , "  SDL_Condition *arg1"
         , ")"
         , "{"
         , "  return &SDL_BroadcastCondition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitCondition */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_5c1581c6a748ae80 (void)) ("
         , "  SDL_Condition *arg1,"
         , "  SDL_Mutex *arg2"
         , ")"
         , "{"
         , "  return &SDL_WaitCondition;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitConditionTimeout */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_0498ed88d8c2daca (void)) ("
         , "  SDL_Condition *arg1,"
         , "  SDL_Mutex *arg2,"
         , "  Sint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_WaitConditionTimeout;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_ShouldInit */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4da27525ce560809 (void)) ("
         , "  SDL_InitState *arg1"
         , ")"
         , "{"
         , "  return &SDL_ShouldInit;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_ShouldQuit */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6877992dc5bc2120 (void)) ("
         , "  SDL_InitState *arg1"
         , ")"
         , "{"
         , "  return &SDL_ShouldQuit;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_SetInitialized */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d08e1c271251d0d2 (void)) ("
         , "  SDL_InitState *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_SetInitialized;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateMutex@
foreign import ccall unsafe "hs_bindgen_95a099535000d13d"
  hs_bindgen_95a099535000d13d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateMutex@
hs_bindgen_95a099535000d13d :: IO (BG.FunPtr (IO (BG.Ptr SDL_Mutex)))
hs_bindgen_95a099535000d13d =
  BG.fromFFIType hs_bindgen_95a099535000d13d_base

{-# NOINLINE sDL_CreateMutex #-}

-- | Create a new mutex.
--
--     All newly-created mutexes begin in the /unlocked/ state.
--
--     Calls to @SDL_LockMutex()@ will not return while the mutex is locked by another thread. See @SDL_TryLockMutex()@ to attempt to lock without blocking.
--
--     SDL mutexes are reentrant.
--
--     [Returns]: the initialized and unlocked mutex or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyMutex', 'sDL_LockMutex', 'sDL_TryLockMutex', 'sDL_UnlockMutex'
--
--     [C declaration]: @SDL_CreateMutex@, defined at @SDL3\/SDL_mutex.h 320:41@
sDL_CreateMutex :: BG.FunPtr (IO (BG.Ptr SDL_Mutex))
sDL_CreateMutex =
  BG.unsafePerformIO hs_bindgen_95a099535000d13d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_LockMutex@
foreign import ccall unsafe "hs_bindgen_df61bce804eff3b2"
  hs_bindgen_df61bce804eff3b2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_LockMutex@
hs_bindgen_df61bce804eff3b2 :: IO (BG.FunPtr (BG.Ptr SDL_Mutex -> IO ()))
hs_bindgen_df61bce804eff3b2 =
  BG.fromFFIType hs_bindgen_df61bce804eff3b2_base

{-# NOINLINE sDL_LockMutex #-}

-- | Lock the mutex.
--
--     This will block until the mutex is available, which is to say it is in the unlocked state and the OS has chosen the caller as the next thread to lock it. Of all threads waiting to lock the mutex, only one may do so at a time.
--
--     It is legal for the owning thread to lock an already-locked mutex. It must unlock it the same number of times before it is actually made available for other threads in the system (this is known as a \"recursive mutex\").
--
--     This function does not fail; if mutex is NULL, it will return immediately having locked nothing. If the mutex is valid, this function will always block until it can lock the mutex, and return with it locked.
--
--     [@mutex@]: the mutex to lock.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_TryLockMutex', 'sDL_UnlockMutex'
--
--     [C declaration]: @SDL_LockMutex@, defined at @SDL3\/SDL_mutex.h 346:34@
sDL_LockMutex :: BG.FunPtr (BG.Ptr SDL_Mutex -> IO ())
sDL_LockMutex =
  BG.unsafePerformIO hs_bindgen_df61bce804eff3b2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryLockMutex@
foreign import ccall unsafe "hs_bindgen_45c6ae563e57d83e"
  hs_bindgen_45c6ae563e57d83e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryLockMutex@
hs_bindgen_45c6ae563e57d83e :: IO (BG.FunPtr (BG.Ptr SDL_Mutex -> IO BG.CBool))
hs_bindgen_45c6ae563e57d83e =
  BG.fromFFIType hs_bindgen_45c6ae563e57d83e_base

{-# NOINLINE sDL_TryLockMutex #-}

-- | Try to lock a mutex without blocking.
--
--     This works just like @SDL_LockMutex()@, but if the mutex is not available, this function returns false immediately.
--
--     This technique is useful if you need exclusive access to a resource but don\'t want to wait for it, and will return to it to try again later.
--
--     This function returns true if passed a NULL mutex.
--
--     [@mutex@]: the mutex to try to lock.
--
--     [Returns]: true on success, false if the mutex would block.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockMutex', 'sDL_UnlockMutex'
--
--     [C declaration]: @SDL_TryLockMutex@, defined at @SDL3\/SDL_mutex.h 369:34@
sDL_TryLockMutex :: BG.FunPtr (BG.Ptr SDL_Mutex -> IO BG.CBool)
sDL_TryLockMutex =
  BG.unsafePerformIO hs_bindgen_45c6ae563e57d83e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_UnlockMutex@
foreign import ccall unsafe "hs_bindgen_279301ff47dc6a1f"
  hs_bindgen_279301ff47dc6a1f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_UnlockMutex@
hs_bindgen_279301ff47dc6a1f :: IO (BG.FunPtr (BG.Ptr SDL_Mutex -> IO ()))
hs_bindgen_279301ff47dc6a1f =
  BG.fromFFIType hs_bindgen_279301ff47dc6a1f_base

{-# NOINLINE sDL_UnlockMutex #-}

-- | Unlock the mutex.
--
--     It is legal for the owning thread to lock an already-locked mutex. It must unlock it the same number of times before it is actually made available for other threads in the system (this is known as a \"recursive mutex\").
--
--     It is illegal to unlock a mutex that has not been locked by the current thread, and doing so results in undefined behavior.
--
--     [@mutex@]: the mutex to unlock.
--
--     [Thread safety]: This call must be paired with a previous locking call on the same thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockMutex', 'sDL_TryLockMutex'
--
--     [C declaration]: @SDL_UnlockMutex@, defined at @SDL3\/SDL_mutex.h 390:34@
sDL_UnlockMutex :: BG.FunPtr (BG.Ptr SDL_Mutex -> IO ())
sDL_UnlockMutex =
  BG.unsafePerformIO hs_bindgen_279301ff47dc6a1f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroyMutex@
foreign import ccall unsafe "hs_bindgen_41ed6e14b48302a3"
  hs_bindgen_41ed6e14b48302a3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroyMutex@
hs_bindgen_41ed6e14b48302a3 :: IO (BG.FunPtr (BG.Ptr SDL_Mutex -> IO ()))
hs_bindgen_41ed6e14b48302a3 =
  BG.fromFFIType hs_bindgen_41ed6e14b48302a3_base

{-# NOINLINE sDL_DestroyMutex #-}

-- | Destroy a mutex created with @SDL_CreateMutex()@.
--
--     This function must be called on any mutex that is no longer needed. Failure to destroy a mutex will result in a system memory or resource leak. While it is safe to destroy a mutex that is /unlocked/, it is not safe to attempt to destroy a locked mutex, and may result in undefined behavior depending on the platform.
--
--     [@mutex@]: the mutex to destroy.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateMutex'
--
--     [C declaration]: @SDL_DestroyMutex@, defined at @SDL3\/SDL_mutex.h 409:34@
sDL_DestroyMutex :: BG.FunPtr (BG.Ptr SDL_Mutex -> IO ())
sDL_DestroyMutex =
  BG.unsafePerformIO hs_bindgen_41ed6e14b48302a3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateRWLock@
foreign import ccall unsafe "hs_bindgen_3eb0c1367593e404"
  hs_bindgen_3eb0c1367593e404_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateRWLock@
hs_bindgen_3eb0c1367593e404 :: IO (BG.FunPtr (IO (BG.Ptr SDL_RWLock)))
hs_bindgen_3eb0c1367593e404 =
  BG.fromFFIType hs_bindgen_3eb0c1367593e404_base

{-# NOINLINE sDL_CreateRWLock #-}

-- | Create a new read\/write lock.
--
--     A read\/write lock is useful for situations where you have multiple threads trying to access a resource that is rarely updated. All threads requesting a read-only lock will be allowed to run in parallel; if a thread requests a write lock, it will be provided exclusive access. This makes it safe for multiple threads to use a resource at the same time if they promise not to change it, and when it has to be changed, the rwlock will serve as a gateway to make sure those changes can be made safely.
--
--     In the right situation, a rwlock can be more efficient than a mutex, which only lets a single thread proceed at a time, even if it won\'t be modifying the data.
--
--     All newly-created read\/write locks begin in the /unlocked/ state.
--
--     Calls to @SDL_LockRWLockForReading()@ and SDL_LockRWLockForWriting will not return while the rwlock is locked /for writing/ by another thread. See @SDL_TryLockRWLockForReading()@ and @SDL_TryLockRWLockForWriting()@ to attempt to lock without blocking.
--
--     SDL read\/write locks are only recursive for read-only locks! They are not guaranteed to be fair, or provide access in a FIFO manner! They are not guaranteed to favor writers. You may not lock a rwlock for both read-only and write access at the same time from the same thread (so you can\'t promote your read-only lock to a write lock without unlocking first).
--
--     [Returns]: the initialized and unlocked read\/write lock or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyRWLock', 'sDL_LockRWLockForReading', 'sDL_LockRWLockForWriting', 'sDL_TryLockRWLockForReading', 'sDL_TryLockRWLockForWriting', 'sDL_UnlockRWLock'
--
--     [C declaration]: @SDL_CreateRWLock@, defined at @SDL3\/SDL_mutex.h 481:42@
sDL_CreateRWLock :: BG.FunPtr (IO (BG.Ptr SDL_RWLock))
sDL_CreateRWLock =
  BG.unsafePerformIO hs_bindgen_3eb0c1367593e404

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_LockRWLockForReading@
foreign import ccall unsafe "hs_bindgen_1d6189a38a9e5f28"
  hs_bindgen_1d6189a38a9e5f28_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_LockRWLockForReading@
hs_bindgen_1d6189a38a9e5f28 :: IO (BG.FunPtr (BG.Ptr SDL_RWLock -> IO ()))
hs_bindgen_1d6189a38a9e5f28 =
  BG.fromFFIType hs_bindgen_1d6189a38a9e5f28_base

{-# NOINLINE sDL_LockRWLockForReading #-}

-- | Lock the read\/write lock for /read only/ operations.
--
--     This will block until the rwlock is available, which is to say it is not locked for writing by any other thread. Of all threads waiting to lock the rwlock, all may do so at the same time as long as they are requesting read-only access; if a thread wants to lock for writing, only one may do so at a time, and no other threads, read-only or not, may hold the lock at the same time.
--
--     It is legal for the owning thread to lock an already-locked rwlock for reading. It must unlock it the same number of times before it is actually made available for other threads in the system (this is known as a \"recursive rwlock\").
--
--     Note that locking for writing is not recursive (this is only available to read-only locks).
--
--     It is illegal to request a read-only lock from a thread that already holds the write lock. Doing so results in undefined behavior. Unlock the write lock before requesting a read-only lock. (But, of course, if you have the write lock, you don\'t need further locks to read in any case.)
--
--     This function does not fail; if rwlock is NULL, it will return immediately having locked nothing. If the rwlock is valid, this function will always block until it can lock the mutex, and return with it locked.
--
--     [@rwlock@]: the read\/write lock to lock.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForWriting', 'sDL_TryLockRWLockForReading', 'sDL_UnlockRWLock'
--
--     [C declaration]: @SDL_LockRWLockForReading@, defined at @SDL3\/SDL_mutex.h 520:34@
sDL_LockRWLockForReading :: BG.FunPtr (BG.Ptr SDL_RWLock -> IO ())
sDL_LockRWLockForReading =
  BG.unsafePerformIO hs_bindgen_1d6189a38a9e5f28

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_LockRWLockForWriting@
foreign import ccall unsafe "hs_bindgen_badbac25bb2ac3e5"
  hs_bindgen_badbac25bb2ac3e5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_LockRWLockForWriting@
hs_bindgen_badbac25bb2ac3e5 :: IO (BG.FunPtr (BG.Ptr SDL_RWLock -> IO ()))
hs_bindgen_badbac25bb2ac3e5 =
  BG.fromFFIType hs_bindgen_badbac25bb2ac3e5_base

{-# NOINLINE sDL_LockRWLockForWriting #-}

-- | Lock the read\/write lock for /write/ operations.
--
--     This will block until the rwlock is available, which is to say it is not locked for reading or writing by any other thread. Only one thread may hold the lock when it requests write access; all other threads, whether they also want to write or only want read-only access, must wait until the writer thread has released the lock.
--
--     It is illegal for the owning thread to lock an already-locked rwlock for writing (read-only may be locked recursively, writing can not). Doing so results in undefined behavior.
--
--     It is illegal to request a write lock from a thread that already holds a read-only lock. Doing so results in undefined behavior. Unlock the read-only lock before requesting a write lock.
--
--     This function does not fail; if rwlock is NULL, it will return immediately having locked nothing. If the rwlock is valid, this function will always block until it can lock the mutex, and return with it locked.
--
--     [@rwlock@]: the read\/write lock to lock.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForReading', 'sDL_TryLockRWLockForWriting', 'sDL_UnlockRWLock'
--
--     [C declaration]: @SDL_LockRWLockForWriting@, defined at @SDL3\/SDL_mutex.h 553:34@
sDL_LockRWLockForWriting :: BG.FunPtr (BG.Ptr SDL_RWLock -> IO ())
sDL_LockRWLockForWriting =
  BG.unsafePerformIO hs_bindgen_badbac25bb2ac3e5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryLockRWLockForReading@
foreign import ccall unsafe "hs_bindgen_1e5ea8850474c50f"
  hs_bindgen_1e5ea8850474c50f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryLockRWLockForReading@
hs_bindgen_1e5ea8850474c50f :: IO (BG.FunPtr (BG.Ptr SDL_RWLock -> IO BG.CBool))
hs_bindgen_1e5ea8850474c50f =
  BG.fromFFIType hs_bindgen_1e5ea8850474c50f_base

{-# NOINLINE sDL_TryLockRWLockForReading #-}

-- | Try to lock a read\/write lock /for reading/ without blocking.
--
--     This works just like @SDL_LockRWLockForReading()@, but if the rwlock is not available, then this function returns false immediately.
--
--     This technique is useful if you need access to a resource but don\'t want to wait for it, and will return to it to try again later.
--
--     Trying to lock for read-only access can succeed if other threads are holding read-only locks, as this won\'t prevent access.
--
--     This function returns true if passed a NULL rwlock.
--
--     [@rwlock@]: the rwlock to try to lock.
--
--     [Returns]: true on success, false if the lock would block.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForReading', 'sDL_TryLockRWLockForWriting', 'sDL_UnlockRWLock'
--
--     [C declaration]: @SDL_TryLockRWLockForReading@, defined at @SDL3\/SDL_mutex.h 580:34@
sDL_TryLockRWLockForReading :: BG.FunPtr (BG.Ptr SDL_RWLock -> IO BG.CBool)
sDL_TryLockRWLockForReading =
  BG.unsafePerformIO hs_bindgen_1e5ea8850474c50f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryLockRWLockForWriting@
foreign import ccall unsafe "hs_bindgen_a11f0d78039b31a7"
  hs_bindgen_a11f0d78039b31a7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryLockRWLockForWriting@
hs_bindgen_a11f0d78039b31a7 :: IO (BG.FunPtr (BG.Ptr SDL_RWLock -> IO BG.CBool))
hs_bindgen_a11f0d78039b31a7 =
  BG.fromFFIType hs_bindgen_a11f0d78039b31a7_base

{-# NOINLINE sDL_TryLockRWLockForWriting #-}

-- | Try to lock a read\/write lock /for writing/ without blocking.
--
--     This works just like @SDL_LockRWLockForWriting()@, but if the rwlock is not available, then this function returns false immediately.
--
--     This technique is useful if you need exclusive access to a resource but don\'t want to wait for it, and will return to it to try again later.
--
--     It is illegal for the owning thread to lock an already-locked rwlock for writing (read-only may be locked recursively, writing can not). Doing so results in undefined behavior.
--
--     It is illegal to request a write lock from a thread that already holds a read-only lock. Doing so results in undefined behavior. Unlock the read-only lock before requesting a write lock.
--
--     This function returns true if passed a NULL rwlock.
--
--     [@rwlock@]: the rwlock to try to lock.
--
--     [Returns]: true on success, false if the lock would block.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForWriting', 'sDL_TryLockRWLockForReading', 'sDL_UnlockRWLock'
--
--     [C declaration]: @SDL_TryLockRWLockForWriting@, defined at @SDL3\/SDL_mutex.h 612:34@
sDL_TryLockRWLockForWriting :: BG.FunPtr (BG.Ptr SDL_RWLock -> IO BG.CBool)
sDL_TryLockRWLockForWriting =
  BG.unsafePerformIO hs_bindgen_a11f0d78039b31a7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_UnlockRWLock@
foreign import ccall unsafe "hs_bindgen_769c3da328a63de5"
  hs_bindgen_769c3da328a63de5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_UnlockRWLock@
hs_bindgen_769c3da328a63de5 :: IO (BG.FunPtr (BG.Ptr SDL_RWLock -> IO ()))
hs_bindgen_769c3da328a63de5 =
  BG.fromFFIType hs_bindgen_769c3da328a63de5_base

{-# NOINLINE sDL_UnlockRWLock #-}

-- | Unlock the read\/write lock.
--
--     Use this function to unlock the rwlock, whether it was locked for read-only or write operations.
--
--     It is legal for the owning thread to lock an already-locked read-only lock. It must unlock it the same number of times before it is actually made available for other threads in the system (this is known as a \"recursive rwlock\").
--
--     It is illegal to unlock a rwlock that has not been locked by the current thread, and doing so results in undefined behavior.
--
--     [@rwlock@]: the rwlock to unlock.
--
--     [Thread safety]: This call must be paired with a previous locking call on the same thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForReading', 'sDL_LockRWLockForWriting', 'sDL_TryLockRWLockForReading', 'sDL_TryLockRWLockForWriting'
--
--     [C declaration]: @SDL_UnlockRWLock@, defined at @SDL3\/SDL_mutex.h 639:34@
sDL_UnlockRWLock :: BG.FunPtr (BG.Ptr SDL_RWLock -> IO ())
sDL_UnlockRWLock =
  BG.unsafePerformIO hs_bindgen_769c3da328a63de5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroyRWLock@
foreign import ccall unsafe "hs_bindgen_7a7492595f34e502"
  hs_bindgen_7a7492595f34e502_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroyRWLock@
hs_bindgen_7a7492595f34e502 :: IO (BG.FunPtr (BG.Ptr SDL_RWLock -> IO ()))
hs_bindgen_7a7492595f34e502 =
  BG.fromFFIType hs_bindgen_7a7492595f34e502_base

{-# NOINLINE sDL_DestroyRWLock #-}

-- | Destroy a read\/write lock created with @SDL_CreateRWLock()@.
--
--     This function must be called on any read\/write lock that is no longer needed. Failure to destroy a rwlock will result in a system memory or resource leak. While it is safe to destroy a rwlock that is /unlocked/, it is not safe to attempt to destroy a locked rwlock, and may result in undefined behavior depending on the platform.
--
--     [@rwlock@]: the rwlock to destroy.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateRWLock'
--
--     [C declaration]: @SDL_DestroyRWLock@, defined at @SDL3\/SDL_mutex.h 658:34@
sDL_DestroyRWLock :: BG.FunPtr (BG.Ptr SDL_RWLock -> IO ())
sDL_DestroyRWLock =
  BG.unsafePerformIO hs_bindgen_7a7492595f34e502

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateSemaphore@
foreign import ccall unsafe "hs_bindgen_22509b0bb44ec2c1"
  hs_bindgen_22509b0bb44ec2c1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateSemaphore@
hs_bindgen_22509b0bb44ec2c1
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO (BG.Ptr SDL_Semaphore)))
hs_bindgen_22509b0bb44ec2c1 =
  BG.fromFFIType hs_bindgen_22509b0bb44ec2c1_base

{-# NOINLINE sDL_CreateSemaphore #-}

-- | Create a semaphore.
--
--     This function creates a new semaphore and initializes it with the value @initial_value@. Each wait operation on the semaphore will atomically decrement the semaphore value and potentially block if the semaphore value is 0. Each post operation will atomically increment the semaphore value and wake waiting threads and allow them to retry the wait operation.
--
--     [@initial_value@]: the starting value of the semaphore.
--
--     [Returns]: a new semaphore or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroySemaphore', 'sDL_SignalSemaphore', 'sDL_TryWaitSemaphore', 'sDL_GetSemaphoreValue', 'sDL_WaitSemaphore', 'sDL_WaitSemaphoreTimeout'
--
--     [C declaration]: @SDL_CreateSemaphore@, defined at @SDL3\/SDL_mutex.h 708:45@
sDL_CreateSemaphore :: BG.FunPtr (SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO (BG.Ptr SDL_Semaphore))
sDL_CreateSemaphore =
  BG.unsafePerformIO hs_bindgen_22509b0bb44ec2c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroySemaphore@
foreign import ccall unsafe "hs_bindgen_1f077a5303df061a"
  hs_bindgen_1f077a5303df061a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroySemaphore@
hs_bindgen_1f077a5303df061a :: IO (BG.FunPtr (BG.Ptr SDL_Semaphore -> IO ()))
hs_bindgen_1f077a5303df061a =
  BG.fromFFIType hs_bindgen_1f077a5303df061a_base

{-# NOINLINE sDL_DestroySemaphore #-}

-- | Destroy a semaphore.
--
--     It is not safe to destroy a semaphore if there are threads currently waiting on it.
--
--     [@sem@]: the semaphore to destroy.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateSemaphore'
--
--     [C declaration]: @SDL_DestroySemaphore@, defined at @SDL3\/SDL_mutex.h 724:34@
sDL_DestroySemaphore :: BG.FunPtr (BG.Ptr SDL_Semaphore -> IO ())
sDL_DestroySemaphore =
  BG.unsafePerformIO hs_bindgen_1f077a5303df061a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitSemaphore@
foreign import ccall unsafe "hs_bindgen_91a2349e7496eeae"
  hs_bindgen_91a2349e7496eeae_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitSemaphore@
hs_bindgen_91a2349e7496eeae :: IO (BG.FunPtr (BG.Ptr SDL_Semaphore -> IO ()))
hs_bindgen_91a2349e7496eeae =
  BG.fromFFIType hs_bindgen_91a2349e7496eeae_base

{-# NOINLINE sDL_WaitSemaphore #-}

-- | Wait until a semaphore has a positive value and then decrements it.
--
--     This function suspends the calling thread until the semaphore pointed to by @sem@ has a positive value, and then atomically decrement the semaphore value.
--
--     This function is the equivalent of calling @SDL_WaitSemaphoreTimeout()@ with a time length of -1.
--
--     [@sem@]: the semaphore wait on.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SignalSemaphore', 'sDL_TryWaitSemaphore', 'sDL_WaitSemaphoreTimeout'
--
--     [C declaration]: @SDL_WaitSemaphore@, defined at @SDL3\/SDL_mutex.h 746:34@
sDL_WaitSemaphore :: BG.FunPtr (BG.Ptr SDL_Semaphore -> IO ())
sDL_WaitSemaphore =
  BG.unsafePerformIO hs_bindgen_91a2349e7496eeae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryWaitSemaphore@
foreign import ccall unsafe "hs_bindgen_81872972bd3486d3"
  hs_bindgen_81872972bd3486d3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_TryWaitSemaphore@
hs_bindgen_81872972bd3486d3 :: IO (BG.FunPtr (BG.Ptr SDL_Semaphore -> IO BG.CBool))
hs_bindgen_81872972bd3486d3 =
  BG.fromFFIType hs_bindgen_81872972bd3486d3_base

{-# NOINLINE sDL_TryWaitSemaphore #-}

-- | See if a semaphore has a positive value and decrement it if it does.
--
--     This function checks to see if the semaphore pointed to by @sem@ has a positive value and atomically decrements the semaphore value if it does. If the semaphore doesn\'t have a positive value, the function immediately returns false.
--
--     [@sem@]: the semaphore to wait on.
--
--     [Returns]: true if the wait succeeds, false if the wait would block.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SignalSemaphore', 'sDL_WaitSemaphore', 'sDL_WaitSemaphoreTimeout'
--
--     [C declaration]: @SDL_TryWaitSemaphore@, defined at @SDL3\/SDL_mutex.h 767:34@
sDL_TryWaitSemaphore :: BG.FunPtr (BG.Ptr SDL_Semaphore -> IO BG.CBool)
sDL_TryWaitSemaphore =
  BG.unsafePerformIO hs_bindgen_81872972bd3486d3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitSemaphoreTimeout@
foreign import ccall unsafe "hs_bindgen_0a26128dc146ea69"
  hs_bindgen_0a26128dc146ea69_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitSemaphoreTimeout@
hs_bindgen_0a26128dc146ea69
  :: IO (BG.FunPtr (BG.Ptr SDL_Semaphore -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool))
hs_bindgen_0a26128dc146ea69 =
  BG.fromFFIType hs_bindgen_0a26128dc146ea69_base

{-# NOINLINE sDL_WaitSemaphoreTimeout #-}

-- | Wait until a semaphore has a positive value and then decrements it.
--
--     This function suspends the calling thread until either the semaphore pointed to by @sem@ has a positive value or the specified time has elapsed. If the call is successful it will atomically decrement the semaphore value.
--
--     [@sem@]: the semaphore to wait on.
--
--     [@timeoutMS@]: the length of the timeout, in milliseconds, or -1 to wait indefinitely.
--
--     [Returns]: true if the wait succeeds or false if the wait times out.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SignalSemaphore', 'sDL_TryWaitSemaphore', 'sDL_WaitSemaphore'
--
--     [C declaration]: @SDL_WaitSemaphoreTimeout@, defined at @SDL3\/SDL_mutex.h 789:34@
sDL_WaitSemaphoreTimeout
  :: BG.FunPtr (BG.Ptr SDL_Semaphore -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool)
sDL_WaitSemaphoreTimeout =
  BG.unsafePerformIO hs_bindgen_0a26128dc146ea69

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_SignalSemaphore@
foreign import ccall unsafe "hs_bindgen_9af09ce180d458b9"
  hs_bindgen_9af09ce180d458b9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_SignalSemaphore@
hs_bindgen_9af09ce180d458b9 :: IO (BG.FunPtr (BG.Ptr SDL_Semaphore -> IO ()))
hs_bindgen_9af09ce180d458b9 =
  BG.fromFFIType hs_bindgen_9af09ce180d458b9_base

{-# NOINLINE sDL_SignalSemaphore #-}

-- | Atomically increment a semaphore\'s value and wake waiting threads.
--
--     [@sem@]: the semaphore to increment.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_TryWaitSemaphore', 'sDL_WaitSemaphore', 'sDL_WaitSemaphoreTimeout'
--
--     [C declaration]: @SDL_SignalSemaphore@, defined at @SDL3\/SDL_mutex.h 804:34@
sDL_SignalSemaphore :: BG.FunPtr (BG.Ptr SDL_Semaphore -> IO ())
sDL_SignalSemaphore =
  BG.unsafePerformIO hs_bindgen_9af09ce180d458b9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_GetSemaphoreValue@
foreign import ccall unsafe "hs_bindgen_5ee888052e9adc81"
  hs_bindgen_5ee888052e9adc81_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_GetSemaphoreValue@
hs_bindgen_5ee888052e9adc81
  :: IO (BG.FunPtr (BG.Ptr SDL_Semaphore -> IO SDL3.Sys.Bindgen.Stdinc.Uint32))
hs_bindgen_5ee888052e9adc81 =
  BG.fromFFIType hs_bindgen_5ee888052e9adc81_base

{-# NOINLINE sDL_GetSemaphoreValue #-}

-- | Get the current value of a semaphore.
--
--     [@sem@]: the semaphore to query.
--
--     [Returns]: the current value of the semaphore.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSemaphoreValue@, defined at @SDL3\/SDL_mutex.h 816:36@
sDL_GetSemaphoreValue :: BG.FunPtr (BG.Ptr SDL_Semaphore -> IO SDL3.Sys.Bindgen.Stdinc.Uint32)
sDL_GetSemaphoreValue =
  BG.unsafePerformIO hs_bindgen_5ee888052e9adc81

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateCondition@
foreign import ccall unsafe "hs_bindgen_07cf0a76ca2c83d0"
  hs_bindgen_07cf0a76ca2c83d0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_CreateCondition@
hs_bindgen_07cf0a76ca2c83d0 :: IO (BG.FunPtr (IO (BG.Ptr SDL_Condition)))
hs_bindgen_07cf0a76ca2c83d0 =
  BG.fromFFIType hs_bindgen_07cf0a76ca2c83d0_base

{-# NOINLINE sDL_CreateCondition #-}

-- | Create a condition variable.
--
--     [Returns]: a new condition variable or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BroadcastCondition', 'sDL_SignalCondition', 'sDL_WaitCondition', 'sDL_WaitConditionTimeout', 'sDL_DestroyCondition'
--
--     [C declaration]: @SDL_CreateCondition@, defined at @SDL3\/SDL_mutex.h 857:45@
sDL_CreateCondition :: BG.FunPtr (IO (BG.Ptr SDL_Condition))
sDL_CreateCondition =
  BG.unsafePerformIO hs_bindgen_07cf0a76ca2c83d0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroyCondition@
foreign import ccall unsafe "hs_bindgen_99bba06553492457"
  hs_bindgen_99bba06553492457_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_DestroyCondition@
hs_bindgen_99bba06553492457 :: IO (BG.FunPtr (BG.Ptr SDL_Condition -> IO ()))
hs_bindgen_99bba06553492457 =
  BG.fromFFIType hs_bindgen_99bba06553492457_base

{-# NOINLINE sDL_DestroyCondition #-}

-- | Destroy a condition variable.
--
--     [@cond@]: the condition variable to destroy.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateCondition'
--
--     [C declaration]: @SDL_DestroyCondition@, defined at @SDL3\/SDL_mutex.h 870:34@
sDL_DestroyCondition :: BG.FunPtr (BG.Ptr SDL_Condition -> IO ())
sDL_DestroyCondition =
  BG.unsafePerformIO hs_bindgen_99bba06553492457

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_SignalCondition@
foreign import ccall unsafe "hs_bindgen_a9b4bfe1c85d2caa"
  hs_bindgen_a9b4bfe1c85d2caa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_SignalCondition@
hs_bindgen_a9b4bfe1c85d2caa :: IO (BG.FunPtr (BG.Ptr SDL_Condition -> IO ()))
hs_bindgen_a9b4bfe1c85d2caa =
  BG.fromFFIType hs_bindgen_a9b4bfe1c85d2caa_base

{-# NOINLINE sDL_SignalCondition #-}

-- | Restart one of the threads that are waiting on the condition variable.
--
--     [@cond@]: the condition variable to signal.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BroadcastCondition', 'sDL_WaitCondition', 'sDL_WaitConditionTimeout'
--
--     [C declaration]: @SDL_SignalCondition@, defined at @SDL3\/SDL_mutex.h 885:34@
sDL_SignalCondition :: BG.FunPtr (BG.Ptr SDL_Condition -> IO ())
sDL_SignalCondition =
  BG.unsafePerformIO hs_bindgen_a9b4bfe1c85d2caa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_BroadcastCondition@
foreign import ccall unsafe "hs_bindgen_26d1393d70aa1e21"
  hs_bindgen_26d1393d70aa1e21_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_BroadcastCondition@
hs_bindgen_26d1393d70aa1e21 :: IO (BG.FunPtr (BG.Ptr SDL_Condition -> IO ()))
hs_bindgen_26d1393d70aa1e21 =
  BG.fromFFIType hs_bindgen_26d1393d70aa1e21_base

{-# NOINLINE sDL_BroadcastCondition #-}

-- | Restart all threads that are waiting on the condition variable.
--
--     [@cond@]: the condition variable to signal.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SignalCondition', 'sDL_WaitCondition', 'sDL_WaitConditionTimeout'
--
--     [C declaration]: @SDL_BroadcastCondition@, defined at @SDL3\/SDL_mutex.h 900:34@
sDL_BroadcastCondition :: BG.FunPtr (BG.Ptr SDL_Condition -> IO ())
sDL_BroadcastCondition =
  BG.unsafePerformIO hs_bindgen_26d1393d70aa1e21

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitCondition@
foreign import ccall unsafe "hs_bindgen_5c1581c6a748ae80"
  hs_bindgen_5c1581c6a748ae80_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitCondition@
hs_bindgen_5c1581c6a748ae80 :: IO (BG.FunPtr (BG.Ptr SDL_Condition -> BG.Ptr SDL_Mutex -> IO ()))
hs_bindgen_5c1581c6a748ae80 =
  BG.fromFFIType hs_bindgen_5c1581c6a748ae80_base

{-# NOINLINE sDL_WaitCondition #-}

-- | Wait until a condition variable is signaled.
--
--     This function unlocks the specified @mutex@ and waits for another thread to call @SDL_SignalCondition()@ or @SDL_BroadcastCondition()@ on the condition variable @cond@. Once the condition variable is signaled, the mutex is re-locked and the function returns.
--
--     The mutex must be locked before calling this function. Locking the mutex recursively (more than once) is not supported and leads to undefined behavior.
--
--     This function is the equivalent of calling @SDL_WaitConditionTimeout()@ with a time length of -1.
--
--     [@cond@]: the condition variable to wait on.
--
--     [@mutex@]: the mutex used to coordinate thread access.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BroadcastCondition', 'sDL_SignalCondition', 'sDL_WaitConditionTimeout'
--
--     [C declaration]: @SDL_WaitCondition@, defined at @SDL3\/SDL_mutex.h 928:34@
sDL_WaitCondition :: BG.FunPtr (BG.Ptr SDL_Condition -> BG.Ptr SDL_Mutex -> IO ())
sDL_WaitCondition =
  BG.unsafePerformIO hs_bindgen_5c1581c6a748ae80

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitConditionTimeout@
foreign import ccall unsafe "hs_bindgen_0498ed88d8c2daca"
  hs_bindgen_0498ed88d8c2daca_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_WaitConditionTimeout@
hs_bindgen_0498ed88d8c2daca
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Condition -> BG.Ptr SDL_Mutex -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool)
       )
hs_bindgen_0498ed88d8c2daca =
  BG.fromFFIType hs_bindgen_0498ed88d8c2daca_base

{-# NOINLINE sDL_WaitConditionTimeout #-}

-- | Wait until a condition variable is signaled or a certain time has passed.
--
--     This function unlocks the specified @mutex@ and waits for another thread to call @SDL_SignalCondition()@ or @SDL_BroadcastCondition()@ on the condition variable @cond@, or for the specified time to elapse. Once the condition variable is signaled or the time elapsed, the mutex is re-locked and the function returns.
--
--     The mutex must be locked before calling this function. Locking the mutex recursively (more than once) is not supported and leads to undefined behavior.
--
--     [@cond@]: the condition variable to wait on.
--
--     [@mutex@]: the mutex used to coordinate thread access.
--
--     [@timeoutMS@]: the maximum time to wait, in milliseconds, or -1 to wait indefinitely.
--
--     [Returns]: true if the condition variable is signaled, false if the condition is not signaled in the allotted time.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BroadcastCondition', 'sDL_SignalCondition', 'sDL_WaitCondition'
--
--     [C declaration]: @SDL_WaitConditionTimeout@, defined at @SDL3\/SDL_mutex.h 958:34@
sDL_WaitConditionTimeout
  :: BG.FunPtr
       (BG.Ptr SDL_Condition -> BG.Ptr SDL_Mutex -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool)
sDL_WaitConditionTimeout =
  BG.unsafePerformIO hs_bindgen_0498ed88d8c2daca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_ShouldInit@
foreign import ccall unsafe "hs_bindgen_4da27525ce560809"
  hs_bindgen_4da27525ce560809_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_ShouldInit@
hs_bindgen_4da27525ce560809 :: IO (BG.FunPtr (BG.Ptr SDL_InitState -> IO BG.CBool))
hs_bindgen_4da27525ce560809 =
  BG.fromFFIType hs_bindgen_4da27525ce560809_base

{-# NOINLINE sDL_ShouldInit #-}

-- | Return whether initialization should be done.
--
--     This function checks the passed in state and if initialization should be done, sets the status to @SDL_INIT_STATUS_INITIALIZING@ and returns true. If another thread is already modifying this state, it will wait until that\'s done before returning.
--
--     If this function returns true, the calling code must call @SDL_SetInitialized()@ to complete the initialization.
--
--     [@state@]: the initialization state to check.
--
--     [Returns]: true if initialization needs to be done, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetInitialized', 'sDL_ShouldQuit'
--
--     [C declaration]: @SDL_ShouldInit@, defined at @SDL3\/SDL_mutex.h 1065:34@
sDL_ShouldInit :: BG.FunPtr (BG.Ptr SDL_InitState -> IO BG.CBool)
sDL_ShouldInit =
  BG.unsafePerformIO hs_bindgen_4da27525ce560809

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_ShouldQuit@
foreign import ccall unsafe "hs_bindgen_6877992dc5bc2120"
  hs_bindgen_6877992dc5bc2120_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_ShouldQuit@
hs_bindgen_6877992dc5bc2120 :: IO (BG.FunPtr (BG.Ptr SDL_InitState -> IO BG.CBool))
hs_bindgen_6877992dc5bc2120 =
  BG.fromFFIType hs_bindgen_6877992dc5bc2120_base

{-# NOINLINE sDL_ShouldQuit #-}

-- | Return whether cleanup should be done.
--
--     This function checks the passed in state and if cleanup should be done, sets the status to @SDL_INIT_STATUS_UNINITIALIZING@ and returns true.
--
--     If this function returns true, the calling code must call @SDL_SetInitialized()@ to complete the cleanup.
--
--     [@state@]: the initialization state to check.
--
--     [Returns]: true if cleanup needs to be done, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetInitialized', 'sDL_ShouldInit'
--
--     [C declaration]: @SDL_ShouldQuit@, defined at @SDL3\/SDL_mutex.h 1086:34@
sDL_ShouldQuit :: BG.FunPtr (BG.Ptr SDL_InitState -> IO BG.CBool)
sDL_ShouldQuit =
  BG.unsafePerformIO hs_bindgen_6877992dc5bc2120

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_SetInitialized@
foreign import ccall unsafe "hs_bindgen_d08e1c271251d0d2"
  hs_bindgen_d08e1c271251d0d2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_get_SDL_SetInitialized@
hs_bindgen_d08e1c271251d0d2 :: IO (BG.FunPtr (BG.Ptr SDL_InitState -> BG.CBool -> IO ()))
hs_bindgen_d08e1c271251d0d2 =
  BG.fromFFIType hs_bindgen_d08e1c271251d0d2_base

{-# NOINLINE sDL_SetInitialized #-}

-- | Finish an initialization state transition.
--
--     This function sets the status of the passed in state to @SDL_INIT_STATUS_INITIALIZED@ or @SDL_INIT_STATUS_UNINITIALIZED@ and allows any threads waiting for the status to proceed.
--
--     [@state@]: the initialization state to check.
--
--     [@initialized@]: the new initialization state.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ShouldInit', 'sDL_ShouldQuit'
--
--     [C declaration]: @SDL_SetInitialized@, defined at @SDL3\/SDL_mutex.h 1105:34@
sDL_SetInitialized :: BG.FunPtr (BG.Ptr SDL_InitState -> BG.CBool -> IO ())
sDL_SetInitialized =
  BG.unsafePerformIO hs_bindgen_d08e1c271251d0d2
