-- | Thread synchronization primitives: mutexes, semaphores, condition variables, and read\/write locks.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Mutex.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Mutex (
  module SDL3.Sys.Bindgen.Mutex,

  -- * Function aliases
  SDL3.Sys.Mutex.createMutex,
  SDL3.Sys.Mutex.createMutexSafe,
  SDL3.Sys.Mutex.lockMutex,
  SDL3.Sys.Mutex.lockMutexSafe,
  SDL3.Sys.Mutex.tryLockMutex,
  SDL3.Sys.Mutex.tryLockMutexSafe,
  SDL3.Sys.Mutex.unlockMutex,
  SDL3.Sys.Mutex.unlockMutexSafe,
  SDL3.Sys.Mutex.destroyMutex,
  SDL3.Sys.Mutex.destroyMutexSafe,
  SDL3.Sys.Mutex.createRWLock,
  SDL3.Sys.Mutex.createRWLockSafe,
  SDL3.Sys.Mutex.lockRWLockForReading,
  SDL3.Sys.Mutex.lockRWLockForReadingSafe,
  SDL3.Sys.Mutex.lockRWLockForWriting,
  SDL3.Sys.Mutex.lockRWLockForWritingSafe,
  SDL3.Sys.Mutex.tryLockRWLockForReading,
  SDL3.Sys.Mutex.tryLockRWLockForReadingSafe,
  SDL3.Sys.Mutex.tryLockRWLockForWriting,
  SDL3.Sys.Mutex.tryLockRWLockForWritingSafe,
  SDL3.Sys.Mutex.unlockRWLock,
  SDL3.Sys.Mutex.unlockRWLockSafe,
  SDL3.Sys.Mutex.destroyRWLock,
  SDL3.Sys.Mutex.destroyRWLockSafe,
  SDL3.Sys.Mutex.createSemaphore,
  SDL3.Sys.Mutex.createSemaphoreSafe,
  SDL3.Sys.Mutex.destroySemaphore,
  SDL3.Sys.Mutex.destroySemaphoreSafe,
  SDL3.Sys.Mutex.waitSemaphore,
  SDL3.Sys.Mutex.waitSemaphoreSafe,
  SDL3.Sys.Mutex.tryWaitSemaphore,
  SDL3.Sys.Mutex.tryWaitSemaphoreSafe,
  SDL3.Sys.Mutex.waitSemaphoreTimeout,
  SDL3.Sys.Mutex.waitSemaphoreTimeoutSafe,
  SDL3.Sys.Mutex.signalSemaphore,
  SDL3.Sys.Mutex.signalSemaphoreSafe,
  SDL3.Sys.Mutex.getSemaphoreValue,
  SDL3.Sys.Mutex.getSemaphoreValueSafe,
  SDL3.Sys.Mutex.createCondition,
  SDL3.Sys.Mutex.createConditionSafe,
  SDL3.Sys.Mutex.destroyCondition,
  SDL3.Sys.Mutex.destroyConditionSafe,
  SDL3.Sys.Mutex.signalCondition,
  SDL3.Sys.Mutex.signalConditionSafe,
  SDL3.Sys.Mutex.broadcastCondition,
  SDL3.Sys.Mutex.broadcastConditionSafe,
  SDL3.Sys.Mutex.waitCondition,
  SDL3.Sys.Mutex.waitConditionSafe,
  SDL3.Sys.Mutex.waitConditionTimeout,
  SDL3.Sys.Mutex.waitConditionTimeoutSafe,
  SDL3.Sys.Mutex.shouldInit,
  SDL3.Sys.Mutex.shouldInitSafe,
  SDL3.Sys.Mutex.shouldQuit,
  SDL3.Sys.Mutex.shouldQuitSafe,
  SDL3.Sys.Mutex.setInitialized,
  SDL3.Sys.Mutex.setInitializedSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Mutex
import SDL3.Sys.Bindgen.Mutex.Safe qualified as Safe
import SDL3.Sys.Bindgen.Mutex.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Create a new mutex.
--
--     All newly-created mutexes begin in the /unlocked/ state.
--
--     Calls to @'lockMutex'@ will not return while the mutex is locked by another thread. See @'tryLockMutex'@ to attempt to lock without blocking.
--
--     SDL mutexes are reentrant.
--
--     [Returns]: the initialized and unlocked mutex or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyMutex', 'lockMutex', 'tryLockMutex', 'unlockMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateMutex@.
--                   The safe flavor is 'createMutexSafe'
--                   .
--
--     [C declaration]: @SDL_CreateMutex@, defined at @SDL3\/SDL_mutex.h 320:41@
createMutex :: IO (BG.Ptr SDL_Mutex)
createMutex = Unsafe.sDL_CreateMutex

-- | Create a new mutex.
--
--     All newly-created mutexes begin in the /unlocked/ state.
--
--     Calls to @'lockMutex'@ will not return while the mutex is locked by another thread. See @'tryLockMutex'@ to attempt to lock without blocking.
--
--     SDL mutexes are reentrant.
--
--     [Returns]: the initialized and unlocked mutex or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyMutex', 'lockMutex', 'tryLockMutex', 'unlockMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateMutex@.
--                   The unsafe flavor is 'createMutex'
--                   .
--
--     [C declaration]: @SDL_CreateMutex@, defined at @SDL3\/SDL_mutex.h 320:41@
createMutexSafe :: IO (BG.Ptr SDL_Mutex)
createMutexSafe = Safe.sDL_CreateMutex

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
--     [See also]: 'tryLockMutex', 'unlockMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockMutex@.
--                   The safe flavor is 'lockMutexSafe'
--                   : blocks on contention.
--
--     [C declaration]: @SDL_LockMutex@, defined at @SDL3\/SDL_mutex.h 346:34@
lockMutex
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to lock.
  -> IO ()
lockMutex = Unsafe.sDL_LockMutex

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
--     [See also]: 'tryLockMutex', 'unlockMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockMutex@.
--                   The unsafe flavor is 'lockMutex'
--                   : blocks on contention.
--
--     [C declaration]: @SDL_LockMutex@, defined at @SDL3\/SDL_mutex.h 346:34@
lockMutexSafe
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to lock.
  -> IO ()
lockMutexSafe = Safe.sDL_LockMutex

-- | Try to lock a mutex without blocking.
--
--     This works just like @'lockMutex'@, but if the mutex is not available, this function returns false immediately.
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
--     [See also]: 'lockMutex', 'unlockMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TryLockMutex@.
--                   The safe flavor is 'tryLockMutexSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryLockMutex@, defined at @SDL3\/SDL_mutex.h 369:34@
tryLockMutex
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to try to lock.
  -> IO Bool
tryLockMutex =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_TryLockMutex x00)

-- | Try to lock a mutex without blocking.
--
--     This works just like @'lockMutex'@, but if the mutex is not available, this function returns false immediately.
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
--     [See also]: 'lockMutex', 'unlockMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TryLockMutex@.
--                   The unsafe flavor is 'tryLockMutex'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryLockMutex@, defined at @SDL3\/SDL_mutex.h 369:34@
tryLockMutexSafe
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to try to lock.
  -> IO Bool
tryLockMutexSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_TryLockMutex x00)

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
--     [See also]: 'lockMutex', 'tryLockMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnlockMutex@.
--                   The safe flavor is 'unlockMutexSafe'
--                   .
--
--     [C declaration]: @SDL_UnlockMutex@, defined at @SDL3\/SDL_mutex.h 390:34@
unlockMutex
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to unlock.
  -> IO ()
unlockMutex = Unsafe.sDL_UnlockMutex

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
--     [See also]: 'lockMutex', 'tryLockMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnlockMutex@.
--                   The unsafe flavor is 'unlockMutex'
--                   .
--
--     [C declaration]: @SDL_UnlockMutex@, defined at @SDL3\/SDL_mutex.h 390:34@
unlockMutexSafe
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to unlock.
  -> IO ()
unlockMutexSafe = Safe.sDL_UnlockMutex

-- | Destroy a mutex created with @'createMutex'@.
--
--     This function must be called on any mutex that is no longer needed. Failure to destroy a mutex will result in a system memory or resource leak. While it is safe to destroy a mutex that is /unlocked/, it is not safe to attempt to destroy a locked mutex, and may result in undefined behavior depending on the platform.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyMutex@.
--                   The safe flavor is 'destroyMutexSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyMutex@, defined at @SDL3\/SDL_mutex.h 409:34@
destroyMutex
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to destroy.
  -> IO ()
destroyMutex = Unsafe.sDL_DestroyMutex

-- | Destroy a mutex created with @'createMutex'@.
--
--     This function must be called on any mutex that is no longer needed. Failure to destroy a mutex will result in a system memory or resource leak. While it is safe to destroy a mutex that is /unlocked/, it is not safe to attempt to destroy a locked mutex, and may result in undefined behavior depending on the platform.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createMutex'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyMutex@.
--                   The unsafe flavor is 'destroyMutex'
--                   .
--
--     [C declaration]: @SDL_DestroyMutex@, defined at @SDL3\/SDL_mutex.h 409:34@
destroyMutexSafe
  :: BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex to destroy.
  -> IO ()
destroyMutexSafe = Safe.sDL_DestroyMutex

-- | Create a new read\/write lock.
--
--     A read\/write lock is useful for situations where you have multiple threads trying to access a resource that is rarely updated. All threads requesting a read-only lock will be allowed to run in parallel; if a thread requests a write lock, it will be provided exclusive access. This makes it safe for multiple threads to use a resource at the same time if they promise not to change it, and when it has to be changed, the rwlock will serve as a gateway to make sure those changes can be made safely.
--
--     In the right situation, a rwlock can be more efficient than a mutex, which only lets a single thread proceed at a time, even if it won\'t be modifying the data.
--
--     All newly-created read\/write locks begin in the /unlocked/ state.
--
--     Calls to @'lockRWLockForReading'@ and 'lockRWLockForWriting' will not return while the rwlock is locked /for writing/ by another thread. See @'tryLockRWLockForReading'@ and @'tryLockRWLockForWriting'@ to attempt to lock without blocking.
--
--     SDL read\/write locks are only recursive for read-only locks! They are not guaranteed to be fair, or provide access in a FIFO manner! They are not guaranteed to favor writers. You may not lock a rwlock for both read-only and write access at the same time from the same thread (so you can\'t promote your read-only lock to a write lock without unlocking first).
--
--     [Returns]: the initialized and unlocked read\/write lock or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyRWLock', 'lockRWLockForReading', 'lockRWLockForWriting', 'tryLockRWLockForReading', 'tryLockRWLockForWriting', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateRWLock@.
--                   The safe flavor is 'createRWLockSafe'
--                   .
--
--     [C declaration]: @SDL_CreateRWLock@, defined at @SDL3\/SDL_mutex.h 481:42@
createRWLock :: IO (BG.Ptr SDL_RWLock)
createRWLock = Unsafe.sDL_CreateRWLock

-- | Create a new read\/write lock.
--
--     A read\/write lock is useful for situations where you have multiple threads trying to access a resource that is rarely updated. All threads requesting a read-only lock will be allowed to run in parallel; if a thread requests a write lock, it will be provided exclusive access. This makes it safe for multiple threads to use a resource at the same time if they promise not to change it, and when it has to be changed, the rwlock will serve as a gateway to make sure those changes can be made safely.
--
--     In the right situation, a rwlock can be more efficient than a mutex, which only lets a single thread proceed at a time, even if it won\'t be modifying the data.
--
--     All newly-created read\/write locks begin in the /unlocked/ state.
--
--     Calls to @'lockRWLockForReading'@ and 'lockRWLockForWriting' will not return while the rwlock is locked /for writing/ by another thread. See @'tryLockRWLockForReading'@ and @'tryLockRWLockForWriting'@ to attempt to lock without blocking.
--
--     SDL read\/write locks are only recursive for read-only locks! They are not guaranteed to be fair, or provide access in a FIFO manner! They are not guaranteed to favor writers. You may not lock a rwlock for both read-only and write access at the same time from the same thread (so you can\'t promote your read-only lock to a write lock without unlocking first).
--
--     [Returns]: the initialized and unlocked read\/write lock or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyRWLock', 'lockRWLockForReading', 'lockRWLockForWriting', 'tryLockRWLockForReading', 'tryLockRWLockForWriting', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateRWLock@.
--                   The unsafe flavor is 'createRWLock'
--                   .
--
--     [C declaration]: @SDL_CreateRWLock@, defined at @SDL3\/SDL_mutex.h 481:42@
createRWLockSafe :: IO (BG.Ptr SDL_RWLock)
createRWLockSafe = Safe.sDL_CreateRWLock

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
--     [See also]: 'lockRWLockForWriting', 'tryLockRWLockForReading', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockRWLockForReading@.
--                   The safe flavor is 'lockRWLockForReadingSafe'
--                   : blocks on contention.
--
--     [C declaration]: @SDL_LockRWLockForReading@, defined at @SDL3\/SDL_mutex.h 520:34@
lockRWLockForReading
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the read\/write lock to lock.
  -> IO ()
lockRWLockForReading =
  Unsafe.sDL_LockRWLockForReading

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
--     [See also]: 'lockRWLockForWriting', 'tryLockRWLockForReading', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockRWLockForReading@.
--                   The unsafe flavor is 'lockRWLockForReading'
--                   : blocks on contention.
--
--     [C declaration]: @SDL_LockRWLockForReading@, defined at @SDL3\/SDL_mutex.h 520:34@
lockRWLockForReadingSafe
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the read\/write lock to lock.
  -> IO ()
lockRWLockForReadingSafe =
  Safe.sDL_LockRWLockForReading

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
--     [See also]: 'lockRWLockForReading', 'tryLockRWLockForWriting', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockRWLockForWriting@.
--                   The safe flavor is 'lockRWLockForWritingSafe'
--                   : blocks on contention.
--
--     [C declaration]: @SDL_LockRWLockForWriting@, defined at @SDL3\/SDL_mutex.h 553:34@
lockRWLockForWriting
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the read\/write lock to lock.
  -> IO ()
lockRWLockForWriting =
  Unsafe.sDL_LockRWLockForWriting

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
--     [See also]: 'lockRWLockForReading', 'tryLockRWLockForWriting', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockRWLockForWriting@.
--                   The unsafe flavor is 'lockRWLockForWriting'
--                   : blocks on contention.
--
--     [C declaration]: @SDL_LockRWLockForWriting@, defined at @SDL3\/SDL_mutex.h 553:34@
lockRWLockForWritingSafe
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the read\/write lock to lock.
  -> IO ()
lockRWLockForWritingSafe =
  Safe.sDL_LockRWLockForWriting

-- | Try to lock a read\/write lock /for reading/ without blocking.
--
--     This works just like @'lockRWLockForReading'@, but if the rwlock is not available, then this function returns false immediately.
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
--     [See also]: 'lockRWLockForReading', 'tryLockRWLockForWriting', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TryLockRWLockForReading@.
--                   The safe flavor is 'tryLockRWLockForReadingSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryLockRWLockForReading@, defined at @SDL3\/SDL_mutex.h 580:34@
tryLockRWLockForReading
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to try to lock.
  -> IO Bool
tryLockRWLockForReading =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_TryLockRWLockForReading x00)

-- | Try to lock a read\/write lock /for reading/ without blocking.
--
--     This works just like @'lockRWLockForReading'@, but if the rwlock is not available, then this function returns false immediately.
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
--     [See also]: 'lockRWLockForReading', 'tryLockRWLockForWriting', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TryLockRWLockForReading@.
--                   The unsafe flavor is 'tryLockRWLockForReading'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryLockRWLockForReading@, defined at @SDL3\/SDL_mutex.h 580:34@
tryLockRWLockForReadingSafe
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to try to lock.
  -> IO Bool
tryLockRWLockForReadingSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_TryLockRWLockForReading x00)

-- | Try to lock a read\/write lock /for writing/ without blocking.
--
--     This works just like @'lockRWLockForWriting'@, but if the rwlock is not available, then this function returns false immediately.
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
--     [See also]: 'lockRWLockForWriting', 'tryLockRWLockForReading', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TryLockRWLockForWriting@.
--                   The safe flavor is 'tryLockRWLockForWritingSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryLockRWLockForWriting@, defined at @SDL3\/SDL_mutex.h 612:34@
tryLockRWLockForWriting
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to try to lock.
  -> IO Bool
tryLockRWLockForWriting =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_TryLockRWLockForWriting x00)

-- | Try to lock a read\/write lock /for writing/ without blocking.
--
--     This works just like @'lockRWLockForWriting'@, but if the rwlock is not available, then this function returns false immediately.
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
--     [See also]: 'lockRWLockForWriting', 'tryLockRWLockForReading', 'unlockRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TryLockRWLockForWriting@.
--                   The unsafe flavor is 'tryLockRWLockForWriting'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryLockRWLockForWriting@, defined at @SDL3\/SDL_mutex.h 612:34@
tryLockRWLockForWritingSafe
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to try to lock.
  -> IO Bool
tryLockRWLockForWritingSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_TryLockRWLockForWriting x00)

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
--     [See also]: 'lockRWLockForReading', 'lockRWLockForWriting', 'tryLockRWLockForReading', 'tryLockRWLockForWriting'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnlockRWLock@.
--                   The safe flavor is 'unlockRWLockSafe'
--                   .
--
--     [C declaration]: @SDL_UnlockRWLock@, defined at @SDL3\/SDL_mutex.h 639:34@
unlockRWLock
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to unlock.
  -> IO ()
unlockRWLock = Unsafe.sDL_UnlockRWLock

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
--     [See also]: 'lockRWLockForReading', 'lockRWLockForWriting', 'tryLockRWLockForReading', 'tryLockRWLockForWriting'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnlockRWLock@.
--                   The unsafe flavor is 'unlockRWLock'
--                   .
--
--     [C declaration]: @SDL_UnlockRWLock@, defined at @SDL3\/SDL_mutex.h 639:34@
unlockRWLockSafe
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to unlock.
  -> IO ()
unlockRWLockSafe = Safe.sDL_UnlockRWLock

-- | Destroy a read\/write lock created with @'createRWLock'@.
--
--     This function must be called on any read\/write lock that is no longer needed. Failure to destroy a rwlock will result in a system memory or resource leak. While it is safe to destroy a rwlock that is /unlocked/, it is not safe to attempt to destroy a locked rwlock, and may result in undefined behavior depending on the platform.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyRWLock@.
--                   The safe flavor is 'destroyRWLockSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyRWLock@, defined at @SDL3\/SDL_mutex.h 658:34@
destroyRWLock
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to destroy.
  -> IO ()
destroyRWLock = Unsafe.sDL_DestroyRWLock

-- | Destroy a read\/write lock created with @'createRWLock'@.
--
--     This function must be called on any read\/write lock that is no longer needed. Failure to destroy a rwlock will result in a system memory or resource leak. While it is safe to destroy a rwlock that is /unlocked/, it is not safe to attempt to destroy a locked rwlock, and may result in undefined behavior depending on the platform.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createRWLock'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyRWLock@.
--                   The unsafe flavor is 'destroyRWLock'
--                   .
--
--     [C declaration]: @SDL_DestroyRWLock@, defined at @SDL3\/SDL_mutex.h 658:34@
destroyRWLockSafe
  :: BG.Ptr SDL_RWLock
  -- ^
  --
  --           [@rwlock@]: the rwlock to destroy.
  -> IO ()
destroyRWLockSafe = Safe.sDL_DestroyRWLock

-- | Create a semaphore.
--
--     This function creates a new semaphore and initializes it with the value @initial_value@. Each wait operation on the semaphore will atomically decrement the semaphore value and potentially block if the semaphore value is 0. Each post operation will atomically increment the semaphore value and wake waiting threads and allow them to retry the wait operation.
--
--     [Returns]: a new semaphore or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroySemaphore', 'signalSemaphore', 'tryWaitSemaphore', 'getSemaphoreValue', 'waitSemaphore', 'waitSemaphoreTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateSemaphore@.
--                   The safe flavor is 'createSemaphoreSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateSemaphore@, defined at @SDL3\/SDL_mutex.h 708:45@
createSemaphore
  :: BG.Word32
  -- ^
  --
  --           [@initial_value@]: the starting value of the semaphore.
  -> IO (BG.Ptr SDL_Semaphore)
createSemaphore =
  \x00 ->
    Unsafe.sDL_CreateSemaphore (Coerce.coerce x00)

-- | Create a semaphore.
--
--     This function creates a new semaphore and initializes it with the value @initial_value@. Each wait operation on the semaphore will atomically decrement the semaphore value and potentially block if the semaphore value is 0. Each post operation will atomically increment the semaphore value and wake waiting threads and allow them to retry the wait operation.
--
--     [Returns]: a new semaphore or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroySemaphore', 'signalSemaphore', 'tryWaitSemaphore', 'getSemaphoreValue', 'waitSemaphore', 'waitSemaphoreTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateSemaphore@.
--                   The unsafe flavor is 'createSemaphore'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateSemaphore@, defined at @SDL3\/SDL_mutex.h 708:45@
createSemaphoreSafe
  :: BG.Word32
  -- ^
  --
  --           [@initial_value@]: the starting value of the semaphore.
  -> IO (BG.Ptr SDL_Semaphore)
createSemaphoreSafe =
  \x00 -> Safe.sDL_CreateSemaphore (Coerce.coerce x00)

-- | Destroy a semaphore.
--
--     It is not safe to destroy a semaphore if there are threads currently waiting on it.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createSemaphore'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroySemaphore@.
--                   The safe flavor is 'destroySemaphoreSafe'
--                   .
--
--     [C declaration]: @SDL_DestroySemaphore@, defined at @SDL3\/SDL_mutex.h 724:34@
destroySemaphore
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to destroy.
  -> IO ()
destroySemaphore = Unsafe.sDL_DestroySemaphore

-- | Destroy a semaphore.
--
--     It is not safe to destroy a semaphore if there are threads currently waiting on it.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createSemaphore'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroySemaphore@.
--                   The unsafe flavor is 'destroySemaphore'
--                   .
--
--     [C declaration]: @SDL_DestroySemaphore@, defined at @SDL3\/SDL_mutex.h 724:34@
destroySemaphoreSafe
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to destroy.
  -> IO ()
destroySemaphoreSafe = Safe.sDL_DestroySemaphore

-- | Wait until a semaphore has a positive value and then decrements it.
--
--     This function suspends the calling thread until the semaphore pointed to by @sem@ has a positive value, and then atomically decrement the semaphore value.
--
--     This function is the equivalent of calling @'waitSemaphoreTimeout'@ with a time length of -1.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'signalSemaphore', 'tryWaitSemaphore', 'waitSemaphoreTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitSemaphore@.
--                   The safe flavor is 'waitSemaphoreSafe'
--                   : blocks indefinitely.
--
--     [C declaration]: @SDL_WaitSemaphore@, defined at @SDL3\/SDL_mutex.h 746:34@
waitSemaphore
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore wait on.
  -> IO ()
waitSemaphore = Unsafe.sDL_WaitSemaphore

-- | Wait until a semaphore has a positive value and then decrements it.
--
--     This function suspends the calling thread until the semaphore pointed to by @sem@ has a positive value, and then atomically decrement the semaphore value.
--
--     This function is the equivalent of calling @'waitSemaphoreTimeout'@ with a time length of -1.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'signalSemaphore', 'tryWaitSemaphore', 'waitSemaphoreTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitSemaphore@.
--                   The unsafe flavor is 'waitSemaphore'
--                   : blocks indefinitely.
--
--     [C declaration]: @SDL_WaitSemaphore@, defined at @SDL3\/SDL_mutex.h 746:34@
waitSemaphoreSafe
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore wait on.
  -> IO ()
waitSemaphoreSafe = Safe.sDL_WaitSemaphore

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
--     [See also]: 'signalSemaphore', 'waitSemaphore', 'waitSemaphoreTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TryWaitSemaphore@.
--                   The safe flavor is 'tryWaitSemaphoreSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryWaitSemaphore@, defined at @SDL3\/SDL_mutex.h 767:34@
tryWaitSemaphore
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to wait on.
  -> IO Bool
tryWaitSemaphore =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_TryWaitSemaphore x00)

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
--     [See also]: 'signalSemaphore', 'waitSemaphore', 'waitSemaphoreTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TryWaitSemaphore@.
--                   The unsafe flavor is 'tryWaitSemaphore'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TryWaitSemaphore@, defined at @SDL3\/SDL_mutex.h 767:34@
tryWaitSemaphoreSafe
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to wait on.
  -> IO Bool
tryWaitSemaphoreSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_TryWaitSemaphore x00)

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
--     [See also]: 'signalSemaphore', 'tryWaitSemaphore', 'waitSemaphore'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitSemaphoreTimeout@.
--                   The safe flavor is 'waitSemaphoreTimeoutSafe'
--                   : blocks up to the timeout.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitSemaphoreTimeout@, defined at @SDL3\/SDL_mutex.h 789:34@
waitSemaphoreTimeout
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to wait on.
  -> BG.Int32
  -- ^
  --
  --           [@timeoutMS@]: the length of the timeout, in milliseconds, or -1 to wait indefinitely.
  -> IO Bool
waitSemaphoreTimeout =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WaitSemaphoreTimeout x00 (Coerce.coerce x11))

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
--     [See also]: 'signalSemaphore', 'tryWaitSemaphore', 'waitSemaphore'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitSemaphoreTimeout@.
--                   The unsafe flavor is 'waitSemaphoreTimeout'
--                   : blocks up to the timeout.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitSemaphoreTimeout@, defined at @SDL3\/SDL_mutex.h 789:34@
waitSemaphoreTimeoutSafe
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to wait on.
  -> BG.Int32
  -- ^
  --
  --           [@timeoutMS@]: the length of the timeout, in milliseconds, or -1 to wait indefinitely.
  -> IO Bool
waitSemaphoreTimeoutSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WaitSemaphoreTimeout x00 (Coerce.coerce x11))

-- | Atomically increment a semaphore\'s value and wake waiting threads.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'tryWaitSemaphore', 'waitSemaphore', 'waitSemaphoreTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SignalSemaphore@.
--                   The safe flavor is 'signalSemaphoreSafe'
--                   .
--
--     [C declaration]: @SDL_SignalSemaphore@, defined at @SDL3\/SDL_mutex.h 804:34@
signalSemaphore
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to increment.
  -> IO ()
signalSemaphore = Unsafe.sDL_SignalSemaphore

-- | Atomically increment a semaphore\'s value and wake waiting threads.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'tryWaitSemaphore', 'waitSemaphore', 'waitSemaphoreTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SignalSemaphore@.
--                   The unsafe flavor is 'signalSemaphore'
--                   .
--
--     [C declaration]: @SDL_SignalSemaphore@, defined at @SDL3\/SDL_mutex.h 804:34@
signalSemaphoreSafe
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to increment.
  -> IO ()
signalSemaphoreSafe = Safe.sDL_SignalSemaphore

-- | Get the current value of a semaphore.
--
--     [Returns]: the current value of the semaphore.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSemaphoreValue@.
--                   The safe flavor is 'getSemaphoreValueSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSemaphoreValue@, defined at @SDL3\/SDL_mutex.h 816:36@
getSemaphoreValue
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to query.
  -> IO BG.Word32
getSemaphoreValue =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetSemaphoreValue x00)

-- | Get the current value of a semaphore.
--
--     [Returns]: the current value of the semaphore.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSemaphoreValue@.
--                   The unsafe flavor is 'getSemaphoreValue'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSemaphoreValue@, defined at @SDL3\/SDL_mutex.h 816:36@
getSemaphoreValueSafe
  :: BG.Ptr SDL_Semaphore
  -- ^
  --
  --           [@sem@]: the semaphore to query.
  -> IO BG.Word32
getSemaphoreValueSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetSemaphoreValue x00)

-- | Create a condition variable.
--
--     [Returns]: a new condition variable or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'broadcastCondition', 'signalCondition', 'waitCondition', 'waitConditionTimeout', 'destroyCondition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateCondition@.
--                   The safe flavor is 'createConditionSafe'
--                   .
--
--     [C declaration]: @SDL_CreateCondition@, defined at @SDL3\/SDL_mutex.h 857:45@
createCondition :: IO (BG.Ptr SDL_Condition)
createCondition = Unsafe.sDL_CreateCondition

-- | Create a condition variable.
--
--     [Returns]: a new condition variable or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'broadcastCondition', 'signalCondition', 'waitCondition', 'waitConditionTimeout', 'destroyCondition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateCondition@.
--                   The unsafe flavor is 'createCondition'
--                   .
--
--     [C declaration]: @SDL_CreateCondition@, defined at @SDL3\/SDL_mutex.h 857:45@
createConditionSafe :: IO (BG.Ptr SDL_Condition)
createConditionSafe = Safe.sDL_CreateCondition

-- | Destroy a condition variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createCondition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyCondition@.
--                   The safe flavor is 'destroyConditionSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyCondition@, defined at @SDL3\/SDL_mutex.h 870:34@
destroyCondition
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to destroy.
  -> IO ()
destroyCondition = Unsafe.sDL_DestroyCondition

-- | Destroy a condition variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createCondition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyCondition@.
--                   The unsafe flavor is 'destroyCondition'
--                   .
--
--     [C declaration]: @SDL_DestroyCondition@, defined at @SDL3\/SDL_mutex.h 870:34@
destroyConditionSafe
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to destroy.
  -> IO ()
destroyConditionSafe = Safe.sDL_DestroyCondition

-- | Restart one of the threads that are waiting on the condition variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'broadcastCondition', 'waitCondition', 'waitConditionTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SignalCondition@.
--                   The safe flavor is 'signalConditionSafe'
--                   .
--
--     [C declaration]: @SDL_SignalCondition@, defined at @SDL3\/SDL_mutex.h 885:34@
signalCondition
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to signal.
  -> IO ()
signalCondition = Unsafe.sDL_SignalCondition

-- | Restart one of the threads that are waiting on the condition variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'broadcastCondition', 'waitCondition', 'waitConditionTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SignalCondition@.
--                   The unsafe flavor is 'signalCondition'
--                   .
--
--     [C declaration]: @SDL_SignalCondition@, defined at @SDL3\/SDL_mutex.h 885:34@
signalConditionSafe
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to signal.
  -> IO ()
signalConditionSafe = Safe.sDL_SignalCondition

-- | Restart all threads that are waiting on the condition variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'signalCondition', 'waitCondition', 'waitConditionTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BroadcastCondition@.
--                   The safe flavor is 'broadcastConditionSafe'
--                   .
--
--     [C declaration]: @SDL_BroadcastCondition@, defined at @SDL3\/SDL_mutex.h 900:34@
broadcastCondition
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to signal.
  -> IO ()
broadcastCondition = Unsafe.sDL_BroadcastCondition

-- | Restart all threads that are waiting on the condition variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'signalCondition', 'waitCondition', 'waitConditionTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BroadcastCondition@.
--                   The unsafe flavor is 'broadcastCondition'
--                   .
--
--     [C declaration]: @SDL_BroadcastCondition@, defined at @SDL3\/SDL_mutex.h 900:34@
broadcastConditionSafe
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to signal.
  -> IO ()
broadcastConditionSafe = Safe.sDL_BroadcastCondition

-- | Wait until a condition variable is signaled.
--
--     This function unlocks the specified @mutex@ and waits for another thread to call @'signalCondition'@ or @'broadcastCondition'@ on the condition variable @cond@. Once the condition variable is signaled, the mutex is re-locked and the function returns.
--
--     The mutex must be locked before calling this function. Locking the mutex recursively (more than once) is not supported and leads to undefined behavior.
--
--     This function is the equivalent of calling @'waitConditionTimeout'@ with a time length of -1.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'broadcastCondition', 'signalCondition', 'waitConditionTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitCondition@.
--                   The safe flavor is 'waitConditionSafe'
--                   : blocks indefinitely.
--
--     [C declaration]: @SDL_WaitCondition@, defined at @SDL3\/SDL_mutex.h 928:34@
waitCondition
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to wait on.
  -> BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex used to coordinate thread access.
  -> IO ()
waitCondition = Unsafe.sDL_WaitCondition

-- | Wait until a condition variable is signaled.
--
--     This function unlocks the specified @mutex@ and waits for another thread to call @'signalCondition'@ or @'broadcastCondition'@ on the condition variable @cond@. Once the condition variable is signaled, the mutex is re-locked and the function returns.
--
--     The mutex must be locked before calling this function. Locking the mutex recursively (more than once) is not supported and leads to undefined behavior.
--
--     This function is the equivalent of calling @'waitConditionTimeout'@ with a time length of -1.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'broadcastCondition', 'signalCondition', 'waitConditionTimeout'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitCondition@.
--                   The unsafe flavor is 'waitCondition'
--                   : blocks indefinitely.
--
--     [C declaration]: @SDL_WaitCondition@, defined at @SDL3\/SDL_mutex.h 928:34@
waitConditionSafe
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to wait on.
  -> BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex used to coordinate thread access.
  -> IO ()
waitConditionSafe = Safe.sDL_WaitCondition

-- | Wait until a condition variable is signaled or a certain time has passed.
--
--     This function unlocks the specified @mutex@ and waits for another thread to call @'signalCondition'@ or @'broadcastCondition'@ on the condition variable @cond@, or for the specified time to elapse. Once the condition variable is signaled or the time elapsed, the mutex is re-locked and the function returns.
--
--     The mutex must be locked before calling this function. Locking the mutex recursively (more than once) is not supported and leads to undefined behavior.
--
--     [Returns]: true if the condition variable is signaled, false if the condition is not signaled in the allotted time.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'broadcastCondition', 'signalCondition', 'waitCondition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitConditionTimeout@.
--                   The safe flavor is 'waitConditionTimeoutSafe'
--                   : blocks up to the timeout.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitConditionTimeout@, defined at @SDL3\/SDL_mutex.h 958:34@
waitConditionTimeout
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to wait on.
  -> BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex used to coordinate thread access.
  -> BG.Int32
  -- ^
  --
  --           [@timeoutMS@]: the maximum time to wait, in milliseconds, or -1 to wait indefinitely.
  -> IO Bool
waitConditionTimeout =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_WaitConditionTimeout x00 x11 (Coerce.coerce x22))

-- | Wait until a condition variable is signaled or a certain time has passed.
--
--     This function unlocks the specified @mutex@ and waits for another thread to call @'signalCondition'@ or @'broadcastCondition'@ on the condition variable @cond@, or for the specified time to elapse. Once the condition variable is signaled or the time elapsed, the mutex is re-locked and the function returns.
--
--     The mutex must be locked before calling this function. Locking the mutex recursively (more than once) is not supported and leads to undefined behavior.
--
--     [Returns]: true if the condition variable is signaled, false if the condition is not signaled in the allotted time.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'broadcastCondition', 'signalCondition', 'waitCondition'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitConditionTimeout@.
--                   The unsafe flavor is 'waitConditionTimeout'
--                   : blocks up to the timeout.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitConditionTimeout@, defined at @SDL3\/SDL_mutex.h 958:34@
waitConditionTimeoutSafe
  :: BG.Ptr SDL_Condition
  -- ^
  --
  --           [@cond@]: the condition variable to wait on.
  -> BG.Ptr SDL_Mutex
  -- ^
  --
  --           [@mutex@]: the mutex used to coordinate thread access.
  -> BG.Int32
  -- ^
  --
  --           [@timeoutMS@]: the maximum time to wait, in milliseconds, or -1 to wait indefinitely.
  -> IO Bool
waitConditionTimeoutSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_WaitConditionTimeout x00 x11 (Coerce.coerce x22))

-- | Return whether initialization should be done.
--
--     This function checks the passed in state and if initialization should be done, sets the status to @SDL_INIT_STATUS_INITIALIZING@ and returns true. If another thread is already modifying this state, it will wait until that\'s done before returning.
--
--     If this function returns true, the calling code must call @'setInitialized'@ to complete the initialization.
--
--     [Returns]: true if initialization needs to be done, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setInitialized', 'shouldQuit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ShouldInit@.
--                   The safe flavor is 'shouldInitSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShouldInit@, defined at @SDL3\/SDL_mutex.h 1065:34@
shouldInit
  :: BG.Ptr SDL_InitState
  -- ^
  --
  --           [@state@]: the initialization state to check.
  -> IO Bool
shouldInit =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_ShouldInit x00)

-- | Return whether initialization should be done.
--
--     This function checks the passed in state and if initialization should be done, sets the status to @SDL_INIT_STATUS_INITIALIZING@ and returns true. If another thread is already modifying this state, it will wait until that\'s done before returning.
--
--     If this function returns true, the calling code must call @'setInitialized'@ to complete the initialization.
--
--     [Returns]: true if initialization needs to be done, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setInitialized', 'shouldQuit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShouldInit@.
--                   The unsafe flavor is 'shouldInit'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShouldInit@, defined at @SDL3\/SDL_mutex.h 1065:34@
shouldInitSafe
  :: BG.Ptr SDL_InitState
  -- ^
  --
  --           [@state@]: the initialization state to check.
  -> IO Bool
shouldInitSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_ShouldInit x00)

-- | Return whether cleanup should be done.
--
--     This function checks the passed in state and if cleanup should be done, sets the status to @SDL_INIT_STATUS_UNINITIALIZING@ and returns true.
--
--     If this function returns true, the calling code must call @'setInitialized'@ to complete the cleanup.
--
--     [Returns]: true if cleanup needs to be done, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setInitialized', 'shouldInit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ShouldQuit@.
--                   The safe flavor is 'shouldQuitSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShouldQuit@, defined at @SDL3\/SDL_mutex.h 1086:34@
shouldQuit
  :: BG.Ptr SDL_InitState
  -- ^
  --
  --           [@state@]: the initialization state to check.
  -> IO Bool
shouldQuit =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_ShouldQuit x00)

-- | Return whether cleanup should be done.
--
--     This function checks the passed in state and if cleanup should be done, sets the status to @SDL_INIT_STATUS_UNINITIALIZING@ and returns true.
--
--     If this function returns true, the calling code must call @'setInitialized'@ to complete the cleanup.
--
--     [Returns]: true if cleanup needs to be done, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setInitialized', 'shouldInit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ShouldQuit@.
--                   The unsafe flavor is 'shouldQuit'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ShouldQuit@, defined at @SDL3\/SDL_mutex.h 1086:34@
shouldQuitSafe
  :: BG.Ptr SDL_InitState
  -- ^
  --
  --           [@state@]: the initialization state to check.
  -> IO Bool
shouldQuitSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_ShouldQuit x00)

-- | Finish an initialization state transition.
--
--     This function sets the status of the passed in state to @SDL_INIT_STATUS_INITIALIZED@ or @SDL_INIT_STATUS_UNINITIALIZED@ and allows any threads waiting for the status to proceed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'shouldInit', 'shouldQuit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetInitialized@.
--                   The safe flavor is 'setInitializedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetInitialized@, defined at @SDL3\/SDL_mutex.h 1105:34@
setInitialized
  :: BG.Ptr SDL_InitState
  -- ^
  --
  --           [@state@]: the initialization state to check.
  -> Bool
  -- ^
  --
  --           [@initialized@]: the new initialization state.
  -> IO ()
setInitialized =
  \x00 ->
    \x11 ->
      Unsafe.sDL_SetInitialized x00 (CBool.fromBool x11)

-- | Finish an initialization state transition.
--
--     This function sets the status of the passed in state to @SDL_INIT_STATUS_INITIALIZED@ or @SDL_INIT_STATUS_UNINITIALIZED@ and allows any threads waiting for the status to proceed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'shouldInit', 'shouldQuit'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetInitialized@.
--                   The unsafe flavor is 'setInitialized'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetInitialized@, defined at @SDL3\/SDL_mutex.h 1105:34@
setInitializedSafe
  :: BG.Ptr SDL_InitState
  -- ^
  --
  --           [@state@]: the initialization state to check.
  -> Bool
  -- ^
  --
  --           [@initialized@]: the new initialization state.
  -> IO ()
setInitializedSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_SetInitialized x00 (CBool.fromBool x11)
