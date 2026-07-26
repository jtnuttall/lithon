{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Mutex.Safe (
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_CreateMutex,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_LockMutex,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_TryLockMutex,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_UnlockMutex,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_DestroyMutex,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_CreateRWLock,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_LockRWLockForReading,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_LockRWLockForWriting,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_TryLockRWLockForReading,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_TryLockRWLockForWriting,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_UnlockRWLock,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_DestroyRWLock,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_CreateSemaphore,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_DestroySemaphore,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_WaitSemaphore,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_TryWaitSemaphore,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_WaitSemaphoreTimeout,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_SignalSemaphore,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_GetSemaphoreValue,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_CreateCondition,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_DestroyCondition,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_SignalCondition,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_BroadcastCondition,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_WaitCondition,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_WaitConditionTimeout,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_ShouldInit,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_ShouldQuit,
  SDL3.Sys.Bindgen.Mutex.Safe.sDL_SetInitialized,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Mutex
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_mutex.h>"
         , "SDL_Mutex *hs_bindgen_8e29ae5aabbda111 (void)"
         , "{"
         , "  return (SDL_CreateMutex)();"
         , "}"
         , "void hs_bindgen_ee717c25894777dd ("
         , "  SDL_Mutex *arg1"
         , ")"
         , "{"
         , "  (SDL_LockMutex)(arg1);"
         , "}"
         , "_Bool hs_bindgen_08c66a65371e794c ("
         , "  SDL_Mutex *arg1"
         , ")"
         , "{"
         , "  return (SDL_TryLockMutex)(arg1);"
         , "}"
         , "void hs_bindgen_0080eb2473efd4c0 ("
         , "  SDL_Mutex *arg1"
         , ")"
         , "{"
         , "  (SDL_UnlockMutex)(arg1);"
         , "}"
         , "void hs_bindgen_0848f2dbc2ab9299 ("
         , "  SDL_Mutex *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyMutex)(arg1);"
         , "}"
         , "SDL_RWLock *hs_bindgen_305069c9512cb61a (void)"
         , "{"
         , "  return (SDL_CreateRWLock)();"
         , "}"
         , "void hs_bindgen_88156cb9c069d7ae ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  (SDL_LockRWLockForReading)(arg1);"
         , "}"
         , "void hs_bindgen_65b1a554927b8f99 ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  (SDL_LockRWLockForWriting)(arg1);"
         , "}"
         , "_Bool hs_bindgen_287956a25f4fabba ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  return (SDL_TryLockRWLockForReading)(arg1);"
         , "}"
         , "_Bool hs_bindgen_99a3ed9a28ed75f7 ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  return (SDL_TryLockRWLockForWriting)(arg1);"
         , "}"
         , "void hs_bindgen_c9284c30c938f332 ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  (SDL_UnlockRWLock)(arg1);"
         , "}"
         , "void hs_bindgen_743dbdcc7c185970 ("
         , "  SDL_RWLock *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyRWLock)(arg1);"
         , "}"
         , "SDL_Semaphore *hs_bindgen_d1200eed8ae4acf8 ("
         , "  Uint32 arg1"
         , ")"
         , "{"
         , "  return (SDL_CreateSemaphore)(arg1);"
         , "}"
         , "void hs_bindgen_d167c0d86f5bfae4 ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroySemaphore)(arg1);"
         , "}"
         , "void hs_bindgen_0c536dc844c53556 ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  (SDL_WaitSemaphore)(arg1);"
         , "}"
         , "_Bool hs_bindgen_8460788ee6bb642a ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  return (SDL_TryWaitSemaphore)(arg1);"
         , "}"
         , "_Bool hs_bindgen_73158966e18c69df ("
         , "  SDL_Semaphore *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_WaitSemaphoreTimeout)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_ad3ea5b998b9b02a ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  (SDL_SignalSemaphore)(arg1);"
         , "}"
         , "Uint32 hs_bindgen_d7d8abceae459dc4 ("
         , "  SDL_Semaphore *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSemaphoreValue)(arg1);"
         , "}"
         , "SDL_Condition *hs_bindgen_f051c9d83065c51e (void)"
         , "{"
         , "  return (SDL_CreateCondition)();"
         , "}"
         , "void hs_bindgen_284001adc7a8e944 ("
         , "  SDL_Condition *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyCondition)(arg1);"
         , "}"
         , "void hs_bindgen_8e6408554c791aa2 ("
         , "  SDL_Condition *arg1"
         , ")"
         , "{"
         , "  (SDL_SignalCondition)(arg1);"
         , "}"
         , "void hs_bindgen_1377f08bc73a7c85 ("
         , "  SDL_Condition *arg1"
         , ")"
         , "{"
         , "  (SDL_BroadcastCondition)(arg1);"
         , "}"
         , "void hs_bindgen_2c9c00769b6253d6 ("
         , "  SDL_Condition *arg1,"
         , "  SDL_Mutex *arg2"
         , ")"
         , "{"
         , "  (SDL_WaitCondition)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_158c5dc74b7f6a6d ("
         , "  SDL_Condition *arg1,"
         , "  SDL_Mutex *arg2,"
         , "  Sint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_WaitConditionTimeout)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_c32bbe3119c28451 ("
         , "  SDL_InitState *arg1"
         , ")"
         , "{"
         , "  return (SDL_ShouldInit)(arg1);"
         , "}"
         , "_Bool hs_bindgen_edbe1140979f28da ("
         , "  SDL_InitState *arg1"
         , ")"
         , "{"
         , "  return (SDL_ShouldQuit)(arg1);"
         , "}"
         , "void hs_bindgen_5708550ac643317a ("
         , "  SDL_InitState *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  (SDL_SetInitialized)(arg1, arg2);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_CreateMutex@
foreign import ccall safe "hs_bindgen_8e29ae5aabbda111"
  hs_bindgen_8e29ae5aabbda111_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_CreateMutex@
hs_bindgen_8e29ae5aabbda111 :: IO (BG.Ptr SDL_Mutex)
hs_bindgen_8e29ae5aabbda111 =
  BG.fromFFIType hs_bindgen_8e29ae5aabbda111_base

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
sDL_CreateMutex :: IO (BG.Ptr SDL_Mutex)
sDL_CreateMutex = hs_bindgen_8e29ae5aabbda111

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_LockMutex@
foreign import ccall safe "hs_bindgen_ee717c25894777dd"
  hs_bindgen_ee717c25894777dd_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_LockMutex@
hs_bindgen_ee717c25894777dd
  :: BG.Ptr SDL_Mutex
  -> IO ()
hs_bindgen_ee717c25894777dd =
  BG.fromFFIType hs_bindgen_ee717c25894777dd_base

-- | Lock the mutex.
--
--     This will block until the mutex is available, which is to say it is in the unlocked state and the OS has chosen the caller as the next thread to lock it. Of all threads waiting to lock the mutex, only one may do so at a time.
--
--     It is legal for the owning thread to lock an already-locked mutex. It must unlock it the same number of times before it is actually made available for other threads in the system (this is known as a \"recursive mutex\").
--
--     This function does not fail; if mutex is NULL, it will return immediately having locked nothing. If the mutex is valid, this function will always block until it can lock the mutex, and return with it locked.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_TryLockMutex', 'sDL_UnlockMutex'
--
--     [C declaration]: @SDL_LockMutex@, defined at @SDL3\/SDL_mutex.h 346:34@
sDL_LockMutex
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to lock.
  -> IO ()
sDL_LockMutex = hs_bindgen_ee717c25894777dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_TryLockMutex@
foreign import ccall safe "hs_bindgen_08c66a65371e794c"
  hs_bindgen_08c66a65371e794c_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_TryLockMutex@
hs_bindgen_08c66a65371e794c
  :: BG.Ptr SDL_Mutex
  -> IO BG.CBool
hs_bindgen_08c66a65371e794c =
  BG.fromFFIType hs_bindgen_08c66a65371e794c_base

-- | Try to lock a mutex without blocking.
--
--     This works just like @SDL_LockMutex()@, but if the mutex is not available, this function returns false immediately.
--
--     This technique is useful if you need exclusive access to a resource but don\'t want to wait for it, and will return to it to try again later.
--
--     This function returns true if passed a NULL mutex.
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
sDL_TryLockMutex
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to try to lock.
  -> IO BG.CBool
sDL_TryLockMutex = hs_bindgen_08c66a65371e794c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_UnlockMutex@
foreign import ccall safe "hs_bindgen_0080eb2473efd4c0"
  hs_bindgen_0080eb2473efd4c0_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_UnlockMutex@
hs_bindgen_0080eb2473efd4c0
  :: BG.Ptr SDL_Mutex
  -> IO ()
hs_bindgen_0080eb2473efd4c0 =
  BG.fromFFIType hs_bindgen_0080eb2473efd4c0_base

-- | Unlock the mutex.
--
--     It is legal for the owning thread to lock an already-locked mutex. It must unlock it the same number of times before it is actually made available for other threads in the system (this is known as a \"recursive mutex\").
--
--     It is illegal to unlock a mutex that has not been locked by the current thread, and doing so results in undefined behavior.
--
--     [Thread safety]: This call must be paired with a previous locking call on the same thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockMutex', 'sDL_TryLockMutex'
--
--     [C declaration]: @SDL_UnlockMutex@, defined at @SDL3\/SDL_mutex.h 390:34@
sDL_UnlockMutex
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to unlock.
  -> IO ()
sDL_UnlockMutex = hs_bindgen_0080eb2473efd4c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_DestroyMutex@
foreign import ccall safe "hs_bindgen_0848f2dbc2ab9299"
  hs_bindgen_0848f2dbc2ab9299_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_DestroyMutex@
hs_bindgen_0848f2dbc2ab9299
  :: BG.Ptr SDL_Mutex
  -> IO ()
hs_bindgen_0848f2dbc2ab9299 =
  BG.fromFFIType hs_bindgen_0848f2dbc2ab9299_base

-- | Destroy a mutex created with @SDL_CreateMutex()@.
--
--     This function must be called on any mutex that is no longer needed. Failure to destroy a mutex will result in a system memory or resource leak. While it is safe to destroy a mutex that is /unlocked/, it is not safe to attempt to destroy a locked mutex, and may result in undefined behavior depending on the platform.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateMutex'
--
--     [C declaration]: @SDL_DestroyMutex@, defined at @SDL3\/SDL_mutex.h 409:34@
sDL_DestroyMutex
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to destroy.
  -> IO ()
sDL_DestroyMutex = hs_bindgen_0848f2dbc2ab9299

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_CreateRWLock@
foreign import ccall safe "hs_bindgen_305069c9512cb61a"
  hs_bindgen_305069c9512cb61a_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_CreateRWLock@
hs_bindgen_305069c9512cb61a :: IO (BG.Ptr SDL_RWLock)
hs_bindgen_305069c9512cb61a =
  BG.fromFFIType hs_bindgen_305069c9512cb61a_base

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
sDL_CreateRWLock :: IO (BG.Ptr SDL_RWLock)
sDL_CreateRWLock = hs_bindgen_305069c9512cb61a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_LockRWLockForReading@
foreign import ccall safe "hs_bindgen_88156cb9c069d7ae"
  hs_bindgen_88156cb9c069d7ae_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_LockRWLockForReading@
hs_bindgen_88156cb9c069d7ae
  :: BG.Ptr SDL_RWLock
  -> IO ()
hs_bindgen_88156cb9c069d7ae =
  BG.fromFFIType hs_bindgen_88156cb9c069d7ae_base

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
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForWriting', 'sDL_TryLockRWLockForReading', 'sDL_UnlockRWLock'
--
--     [C declaration]: @SDL_LockRWLockForReading@, defined at @SDL3\/SDL_mutex.h 520:34@
sDL_LockRWLockForReading
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the read\/write lock to lock.
  -> IO ()
sDL_LockRWLockForReading =
  hs_bindgen_88156cb9c069d7ae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_LockRWLockForWriting@
foreign import ccall safe "hs_bindgen_65b1a554927b8f99"
  hs_bindgen_65b1a554927b8f99_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_LockRWLockForWriting@
hs_bindgen_65b1a554927b8f99
  :: BG.Ptr SDL_RWLock
  -> IO ()
hs_bindgen_65b1a554927b8f99 =
  BG.fromFFIType hs_bindgen_65b1a554927b8f99_base

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
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForReading', 'sDL_TryLockRWLockForWriting', 'sDL_UnlockRWLock'
--
--     [C declaration]: @SDL_LockRWLockForWriting@, defined at @SDL3\/SDL_mutex.h 553:34@
sDL_LockRWLockForWriting
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the read\/write lock to lock.
  -> IO ()
sDL_LockRWLockForWriting =
  hs_bindgen_65b1a554927b8f99

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_TryLockRWLockForReading@
foreign import ccall safe "hs_bindgen_287956a25f4fabba"
  hs_bindgen_287956a25f4fabba_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_TryLockRWLockForReading@
hs_bindgen_287956a25f4fabba
  :: BG.Ptr SDL_RWLock
  -> IO BG.CBool
hs_bindgen_287956a25f4fabba =
  BG.fromFFIType hs_bindgen_287956a25f4fabba_base

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
--     [Returns]: true on success, false if the lock would block.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForReading', 'sDL_TryLockRWLockForWriting', 'sDL_UnlockRWLock'
--
--     [C declaration]: @SDL_TryLockRWLockForReading@, defined at @SDL3\/SDL_mutex.h 580:34@
sDL_TryLockRWLockForReading
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to try to lock.
  -> IO BG.CBool
sDL_TryLockRWLockForReading =
  hs_bindgen_287956a25f4fabba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_TryLockRWLockForWriting@
foreign import ccall safe "hs_bindgen_99a3ed9a28ed75f7"
  hs_bindgen_99a3ed9a28ed75f7_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_TryLockRWLockForWriting@
hs_bindgen_99a3ed9a28ed75f7
  :: BG.Ptr SDL_RWLock
  -> IO BG.CBool
hs_bindgen_99a3ed9a28ed75f7 =
  BG.fromFFIType hs_bindgen_99a3ed9a28ed75f7_base

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
--     [Returns]: true on success, false if the lock would block.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForWriting', 'sDL_TryLockRWLockForReading', 'sDL_UnlockRWLock'
--
--     [C declaration]: @SDL_TryLockRWLockForWriting@, defined at @SDL3\/SDL_mutex.h 612:34@
sDL_TryLockRWLockForWriting
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to try to lock.
  -> IO BG.CBool
sDL_TryLockRWLockForWriting =
  hs_bindgen_99a3ed9a28ed75f7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_UnlockRWLock@
foreign import ccall safe "hs_bindgen_c9284c30c938f332"
  hs_bindgen_c9284c30c938f332_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_UnlockRWLock@
hs_bindgen_c9284c30c938f332
  :: BG.Ptr SDL_RWLock
  -> IO ()
hs_bindgen_c9284c30c938f332 =
  BG.fromFFIType hs_bindgen_c9284c30c938f332_base

-- | Unlock the read\/write lock.
--
--     Use this function to unlock the rwlock, whether it was locked for read-only or write operations.
--
--     It is legal for the owning thread to lock an already-locked read-only lock. It must unlock it the same number of times before it is actually made available for other threads in the system (this is known as a \"recursive rwlock\").
--
--     It is illegal to unlock a rwlock that has not been locked by the current thread, and doing so results in undefined behavior.
--
--     [Thread safety]: This call must be paired with a previous locking call on the same thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockRWLockForReading', 'sDL_LockRWLockForWriting', 'sDL_TryLockRWLockForReading', 'sDL_TryLockRWLockForWriting'
--
--     [C declaration]: @SDL_UnlockRWLock@, defined at @SDL3\/SDL_mutex.h 639:34@
sDL_UnlockRWLock
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to unlock.
  -> IO ()
sDL_UnlockRWLock = hs_bindgen_c9284c30c938f332

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_DestroyRWLock@
foreign import ccall safe "hs_bindgen_743dbdcc7c185970"
  hs_bindgen_743dbdcc7c185970_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_DestroyRWLock@
hs_bindgen_743dbdcc7c185970
  :: BG.Ptr SDL_RWLock
  -> IO ()
hs_bindgen_743dbdcc7c185970 =
  BG.fromFFIType hs_bindgen_743dbdcc7c185970_base

-- | Destroy a read\/write lock created with @SDL_CreateRWLock()@.
--
--     This function must be called on any read\/write lock that is no longer needed. Failure to destroy a rwlock will result in a system memory or resource leak. While it is safe to destroy a rwlock that is /unlocked/, it is not safe to attempt to destroy a locked rwlock, and may result in undefined behavior depending on the platform.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateRWLock'
--
--     [C declaration]: @SDL_DestroyRWLock@, defined at @SDL3\/SDL_mutex.h 658:34@
sDL_DestroyRWLock
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to destroy.
  -> IO ()
sDL_DestroyRWLock = hs_bindgen_743dbdcc7c185970

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_CreateSemaphore@
foreign import ccall safe "hs_bindgen_d1200eed8ae4acf8"
  hs_bindgen_d1200eed8ae4acf8_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_CreateSemaphore@
hs_bindgen_d1200eed8ae4acf8
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO (BG.Ptr SDL_Semaphore)
hs_bindgen_d1200eed8ae4acf8 =
  BG.fromFFIType hs_bindgen_d1200eed8ae4acf8_base

-- | Create a semaphore.
--
--     This function creates a new semaphore and initializes it with the value @initial_value@. Each wait operation on the semaphore will atomically decrement the semaphore value and potentially block if the semaphore value is 0. Each post operation will atomically increment the semaphore value and wake waiting threads and allow them to retry the wait operation.
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
sDL_CreateSemaphore
  :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@initial_value@]: the starting value of the semaphore.
  -> IO (BG.Ptr SDL_Semaphore)
sDL_CreateSemaphore = hs_bindgen_d1200eed8ae4acf8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_DestroySemaphore@
foreign import ccall safe "hs_bindgen_d167c0d86f5bfae4"
  hs_bindgen_d167c0d86f5bfae4_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_DestroySemaphore@
hs_bindgen_d167c0d86f5bfae4
  :: BG.Ptr SDL_Semaphore
  -> IO ()
hs_bindgen_d167c0d86f5bfae4 =
  BG.fromFFIType hs_bindgen_d167c0d86f5bfae4_base

-- | Destroy a semaphore.
--
--     It is not safe to destroy a semaphore if there are threads currently waiting on it.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateSemaphore'
--
--     [C declaration]: @SDL_DestroySemaphore@, defined at @SDL3\/SDL_mutex.h 724:34@
sDL_DestroySemaphore
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to destroy.
  -> IO ()
sDL_DestroySemaphore = hs_bindgen_d167c0d86f5bfae4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_WaitSemaphore@
foreign import ccall safe "hs_bindgen_0c536dc844c53556"
  hs_bindgen_0c536dc844c53556_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_WaitSemaphore@
hs_bindgen_0c536dc844c53556
  :: BG.Ptr SDL_Semaphore
  -> IO ()
hs_bindgen_0c536dc844c53556 =
  BG.fromFFIType hs_bindgen_0c536dc844c53556_base

-- | Wait until a semaphore has a positive value and then decrements it.
--
--     This function suspends the calling thread until the semaphore pointed to by @sem@ has a positive value, and then atomically decrement the semaphore value.
--
--     This function is the equivalent of calling @SDL_WaitSemaphoreTimeout()@ with a time length of -1.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SignalSemaphore', 'sDL_TryWaitSemaphore', 'sDL_WaitSemaphoreTimeout'
--
--     [C declaration]: @SDL_WaitSemaphore@, defined at @SDL3\/SDL_mutex.h 746:34@
sDL_WaitSemaphore
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore wait on.
  -> IO ()
sDL_WaitSemaphore = hs_bindgen_0c536dc844c53556

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_TryWaitSemaphore@
foreign import ccall safe "hs_bindgen_8460788ee6bb642a"
  hs_bindgen_8460788ee6bb642a_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_TryWaitSemaphore@
hs_bindgen_8460788ee6bb642a
  :: BG.Ptr SDL_Semaphore
  -> IO BG.CBool
hs_bindgen_8460788ee6bb642a =
  BG.fromFFIType hs_bindgen_8460788ee6bb642a_base

-- | See if a semaphore has a positive value and decrement it if it does.
--
--     This function checks to see if the semaphore pointed to by @sem@ has a positive value and atomically decrements the semaphore value if it does. If the semaphore doesn\'t have a positive value, the function immediately returns false.
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
sDL_TryWaitSemaphore
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to wait on.
  -> IO BG.CBool
sDL_TryWaitSemaphore = hs_bindgen_8460788ee6bb642a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_WaitSemaphoreTimeout@
foreign import ccall safe "hs_bindgen_73158966e18c69df"
  hs_bindgen_73158966e18c69df_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_WaitSemaphoreTimeout@
hs_bindgen_73158966e18c69df
  :: BG.Ptr SDL_Semaphore
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -> IO BG.CBool
hs_bindgen_73158966e18c69df =
  BG.fromFFIType hs_bindgen_73158966e18c69df_base

-- | Wait until a semaphore has a positive value and then decrements it.
--
--     This function suspends the calling thread until either the semaphore pointed to by @sem@ has a positive value or the specified time has elapsed. If the call is successful it will atomically decrement the semaphore value.
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
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to wait on.
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@timeoutMS@]: the length of the timeout, in milliseconds, or -1 to wait indefinitely.
  -> IO BG.CBool
sDL_WaitSemaphoreTimeout =
  hs_bindgen_73158966e18c69df

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_SignalSemaphore@
foreign import ccall safe "hs_bindgen_ad3ea5b998b9b02a"
  hs_bindgen_ad3ea5b998b9b02a_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_SignalSemaphore@
hs_bindgen_ad3ea5b998b9b02a
  :: BG.Ptr SDL_Semaphore
  -> IO ()
hs_bindgen_ad3ea5b998b9b02a =
  BG.fromFFIType hs_bindgen_ad3ea5b998b9b02a_base

-- | Atomically increment a semaphore\'s value and wake waiting threads.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_TryWaitSemaphore', 'sDL_WaitSemaphore', 'sDL_WaitSemaphoreTimeout'
--
--     [C declaration]: @SDL_SignalSemaphore@, defined at @SDL3\/SDL_mutex.h 804:34@
sDL_SignalSemaphore
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to increment.
  -> IO ()
sDL_SignalSemaphore = hs_bindgen_ad3ea5b998b9b02a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_GetSemaphoreValue@
foreign import ccall safe "hs_bindgen_d7d8abceae459dc4"
  hs_bindgen_d7d8abceae459dc4_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_GetSemaphoreValue@
hs_bindgen_d7d8abceae459dc4
  :: BG.Ptr SDL_Semaphore
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_d7d8abceae459dc4 =
  BG.fromFFIType hs_bindgen_d7d8abceae459dc4_base

-- | Get the current value of a semaphore.
--
--     [Returns]: the current value of the semaphore.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSemaphoreValue@, defined at @SDL3\/SDL_mutex.h 816:36@
sDL_GetSemaphoreValue
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to query.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
sDL_GetSemaphoreValue = hs_bindgen_d7d8abceae459dc4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_CreateCondition@
foreign import ccall safe "hs_bindgen_f051c9d83065c51e"
  hs_bindgen_f051c9d83065c51e_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_CreateCondition@
hs_bindgen_f051c9d83065c51e :: IO (BG.Ptr SDL_Condition)
hs_bindgen_f051c9d83065c51e =
  BG.fromFFIType hs_bindgen_f051c9d83065c51e_base

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
sDL_CreateCondition :: IO (BG.Ptr SDL_Condition)
sDL_CreateCondition = hs_bindgen_f051c9d83065c51e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_DestroyCondition@
foreign import ccall safe "hs_bindgen_284001adc7a8e944"
  hs_bindgen_284001adc7a8e944_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_DestroyCondition@
hs_bindgen_284001adc7a8e944
  :: BG.Ptr SDL_Condition
  -> IO ()
hs_bindgen_284001adc7a8e944 =
  BG.fromFFIType hs_bindgen_284001adc7a8e944_base

-- | Destroy a condition variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateCondition'
--
--     [C declaration]: @SDL_DestroyCondition@, defined at @SDL3\/SDL_mutex.h 870:34@
sDL_DestroyCondition
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to destroy.
  -> IO ()
sDL_DestroyCondition = hs_bindgen_284001adc7a8e944

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_SignalCondition@
foreign import ccall safe "hs_bindgen_8e6408554c791aa2"
  hs_bindgen_8e6408554c791aa2_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_SignalCondition@
hs_bindgen_8e6408554c791aa2
  :: BG.Ptr SDL_Condition
  -> IO ()
hs_bindgen_8e6408554c791aa2 =
  BG.fromFFIType hs_bindgen_8e6408554c791aa2_base

-- | Restart one of the threads that are waiting on the condition variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BroadcastCondition', 'sDL_WaitCondition', 'sDL_WaitConditionTimeout'
--
--     [C declaration]: @SDL_SignalCondition@, defined at @SDL3\/SDL_mutex.h 885:34@
sDL_SignalCondition
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to signal.
  -> IO ()
sDL_SignalCondition = hs_bindgen_8e6408554c791aa2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_BroadcastCondition@
foreign import ccall safe "hs_bindgen_1377f08bc73a7c85"
  hs_bindgen_1377f08bc73a7c85_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_BroadcastCondition@
hs_bindgen_1377f08bc73a7c85
  :: BG.Ptr SDL_Condition
  -> IO ()
hs_bindgen_1377f08bc73a7c85 =
  BG.fromFFIType hs_bindgen_1377f08bc73a7c85_base

-- | Restart all threads that are waiting on the condition variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SignalCondition', 'sDL_WaitCondition', 'sDL_WaitConditionTimeout'
--
--     [C declaration]: @SDL_BroadcastCondition@, defined at @SDL3\/SDL_mutex.h 900:34@
sDL_BroadcastCondition
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to signal.
  -> IO ()
sDL_BroadcastCondition = hs_bindgen_1377f08bc73a7c85

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_WaitCondition@
foreign import ccall safe "hs_bindgen_2c9c00769b6253d6"
  hs_bindgen_2c9c00769b6253d6_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_WaitCondition@
hs_bindgen_2c9c00769b6253d6
  :: BG.Ptr SDL_Condition
  -> BG.Ptr SDL_Mutex
  -> IO ()
hs_bindgen_2c9c00769b6253d6 =
  BG.fromFFIType hs_bindgen_2c9c00769b6253d6_base

-- | Wait until a condition variable is signaled.
--
--     This function unlocks the specified @mutex@ and waits for another thread to call @SDL_SignalCondition()@ or @SDL_BroadcastCondition()@ on the condition variable @cond@. Once the condition variable is signaled, the mutex is re-locked and the function returns.
--
--     The mutex must be locked before calling this function. Locking the mutex recursively (more than once) is not supported and leads to undefined behavior.
--
--     This function is the equivalent of calling @SDL_WaitConditionTimeout()@ with a time length of -1.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BroadcastCondition', 'sDL_SignalCondition', 'sDL_WaitConditionTimeout'
--
--     [C declaration]: @SDL_WaitCondition@, defined at @SDL3\/SDL_mutex.h 928:34@
sDL_WaitCondition
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to wait on.
  -> BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex used to coordinate thread access.
  -> IO ()
sDL_WaitCondition = hs_bindgen_2c9c00769b6253d6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_WaitConditionTimeout@
foreign import ccall safe "hs_bindgen_158c5dc74b7f6a6d"
  hs_bindgen_158c5dc74b7f6a6d_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_WaitConditionTimeout@
hs_bindgen_158c5dc74b7f6a6d
  :: BG.Ptr SDL_Condition
  -> BG.Ptr SDL_Mutex
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -> IO BG.CBool
hs_bindgen_158c5dc74b7f6a6d =
  BG.fromFFIType hs_bindgen_158c5dc74b7f6a6d_base

-- | Wait until a condition variable is signaled or a certain time has passed.
--
--     This function unlocks the specified @mutex@ and waits for another thread to call @SDL_SignalCondition()@ or @SDL_BroadcastCondition()@ on the condition variable @cond@, or for the specified time to elapse. Once the condition variable is signaled or the time elapsed, the mutex is re-locked and the function returns.
--
--     The mutex must be locked before calling this function. Locking the mutex recursively (more than once) is not supported and leads to undefined behavior.
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
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to wait on.
  -> BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex used to coordinate thread access.
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@timeoutMS@]: the maximum time to wait, in milliseconds, or -1 to wait indefinitely.
  -> IO BG.CBool
sDL_WaitConditionTimeout =
  hs_bindgen_158c5dc74b7f6a6d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_ShouldInit@
foreign import ccall safe "hs_bindgen_c32bbe3119c28451"
  hs_bindgen_c32bbe3119c28451_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_ShouldInit@
hs_bindgen_c32bbe3119c28451
  :: BG.Ptr SDL_InitState
  -> IO BG.CBool
hs_bindgen_c32bbe3119c28451 =
  BG.fromFFIType hs_bindgen_c32bbe3119c28451_base

-- | Return whether initialization should be done.
--
--     This function checks the passed in state and if initialization should be done, sets the status to @SDL_INIT_STATUS_INITIALIZING@ and returns true. If another thread is already modifying this state, it will wait until that\'s done before returning.
--
--     If this function returns true, the calling code must call @SDL_SetInitialized()@ to complete the initialization.
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
sDL_ShouldInit
  :: BG.Ptr SDL_InitState
  -- ^
  --
  --           [@state@]: the initialization state to check.
  -> IO BG.CBool
sDL_ShouldInit = hs_bindgen_c32bbe3119c28451

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_ShouldQuit@
foreign import ccall safe "hs_bindgen_edbe1140979f28da"
  hs_bindgen_edbe1140979f28da_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_ShouldQuit@
hs_bindgen_edbe1140979f28da
  :: BG.Ptr SDL_InitState
  -> IO BG.CBool
hs_bindgen_edbe1140979f28da =
  BG.fromFFIType hs_bindgen_edbe1140979f28da_base

-- | Return whether cleanup should be done.
--
--     This function checks the passed in state and if cleanup should be done, sets the status to @SDL_INIT_STATUS_UNINITIALIZING@ and returns true.
--
--     If this function returns true, the calling code must call @SDL_SetInitialized()@ to complete the cleanup.
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
sDL_ShouldQuit
  :: BG.Ptr SDL_InitState
  -- ^
  --
  --           [@state@]: the initialization state to check.
  -> IO BG.CBool
sDL_ShouldQuit = hs_bindgen_edbe1140979f28da

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_SetInitialized@
foreign import ccall safe "hs_bindgen_5708550ac643317a"
  hs_bindgen_5708550ac643317a_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Mutex_Safe_SDL_SetInitialized@
hs_bindgen_5708550ac643317a
  :: BG.Ptr SDL_InitState
  -> BG.CBool
  -> IO ()
hs_bindgen_5708550ac643317a =
  BG.fromFFIType hs_bindgen_5708550ac643317a_base

-- | Finish an initialization state transition.
--
--     This function sets the status of the passed in state to @SDL_INIT_STATUS_INITIALIZED@ or @SDL_INIT_STATUS_UNINITIALIZED@ and allows any threads waiting for the status to proceed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ShouldInit', 'sDL_ShouldQuit'
--
--     [C declaration]: @SDL_SetInitialized@, defined at @SDL3\/SDL_mutex.h 1105:34@
sDL_SetInitialized
  :: BG.Ptr SDL_InitState
  -- ^
  --
  --           [@state@]: the initialization state to check.
  -> BG.CBool
  -- ^
  --
  --           [@initialized@]: the new initialization state.
  -> IO ()
sDL_SetInitialized = hs_bindgen_5708550ac643317a
