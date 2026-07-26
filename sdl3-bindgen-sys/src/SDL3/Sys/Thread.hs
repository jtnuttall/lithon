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
--     [See also]: @SDL_CreateThread@, 'waitThread'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Thread.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Thread (
  module SDL3.Sys.Bindgen.Thread,

  -- * Function aliases
  SDL3.Sys.Thread.createThreadRuntime,
  SDL3.Sys.Thread.createThreadRuntimeSafe,
  SDL3.Sys.Thread.createThreadWithPropertiesRuntime,
  SDL3.Sys.Thread.createThreadWithPropertiesRuntimeSafe,
  SDL3.Sys.Thread.getThreadName,
  SDL3.Sys.Thread.getThreadNameSafe,
  SDL3.Sys.Thread.getCurrentThreadID,
  SDL3.Sys.Thread.getCurrentThreadIDSafe,
  SDL3.Sys.Thread.getThreadID,
  SDL3.Sys.Thread.getThreadIDSafe,
  SDL3.Sys.Thread.setCurrentThreadPriority,
  SDL3.Sys.Thread.setCurrentThreadPrioritySafe,
  SDL3.Sys.Thread.waitThread,
  SDL3.Sys.Thread.waitThreadSafe,
  SDL3.Sys.Thread.getThreadState,
  SDL3.Sys.Thread.getThreadStateSafe,
  SDL3.Sys.Thread.detachThread,
  SDL3.Sys.Thread.detachThreadSafe,
  SDL3.Sys.Thread.getTLS,
  SDL3.Sys.Thread.getTLSSafe,
  SDL3.Sys.Thread.setTLS,
  SDL3.Sys.Thread.setTLSSafe,
  SDL3.Sys.Thread.cleanupTLS,
  SDL3.Sys.Thread.cleanupTLSSafe,
)
where

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Thread
import SDL3.Sys.Bindgen.Thread.Safe qualified as Safe
import SDL3.Sys.Bindgen.Thread.Unsafe qualified as Unsafe

-- | The actual entry point for SDL_CreateThread.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateThreadRuntime@.
--                   The safe flavor is 'createThreadRuntimeSafe'
--                   : the entry function runs on the spawned thread, not during the call.
--
--     [C declaration]: @SDL_CreateThreadRuntime@, defined at @SDL3\/SDL_thread.h 340:42@
createThreadRuntime
  :: SDL_ThreadFunction
  -- ^
  --
  --           [@fn@]: the 'SDL_ThreadFunction' function to call in the new thread
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the thread
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: a pointer that is passed to @fn@
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -- ^
  --
  --           [@pfnBeginThread@]: the C runtime\'s _beginthreadex (or whatnot). Can be NULL.
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -- ^
  --
  --           [@pfnEndThread@]: the C runtime\'s _endthreadex (or whatnot). Can be NULL.
  -> IO (BG.Ptr SDL_Thread)
createThreadRuntime = Unsafe.sDL_CreateThreadRuntime

-- | The actual entry point for SDL_CreateThread.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateThreadRuntime@.
--                   The unsafe flavor is 'createThreadRuntime'
--                   : the entry function runs on the spawned thread, not during the call.
--
--     [C declaration]: @SDL_CreateThreadRuntime@, defined at @SDL3\/SDL_thread.h 340:42@
createThreadRuntimeSafe
  :: SDL_ThreadFunction
  -- ^
  --
  --           [@fn@]: the 'SDL_ThreadFunction' function to call in the new thread
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the thread
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@data@]: a pointer that is passed to @fn@
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -- ^
  --
  --           [@pfnBeginThread@]: the C runtime\'s _beginthreadex (or whatnot). Can be NULL.
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -- ^
  --
  --           [@pfnEndThread@]: the C runtime\'s _endthreadex (or whatnot). Can be NULL.
  -> IO (BG.Ptr SDL_Thread)
createThreadRuntimeSafe =
  Safe.sDL_CreateThreadRuntime

-- | The actual entry point for SDL_CreateThreadWithProperties.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateThreadWithPropertiesRuntime@.
--                   The safe flavor is 'createThreadWithPropertiesRuntimeSafe'
--                   : the entry function runs on the spawned thread, not during the call.
--
--     [C declaration]: @SDL_CreateThreadWithPropertiesRuntime@, defined at @SDL3\/SDL_thread.h 356:42@
createThreadWithPropertiesRuntime
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -- ^
  --
  --           [@pfnBeginThread@]: the C runtime\'s _beginthreadex (or whatnot). Can be NULL.
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -- ^
  --
  --           [@pfnEndThread@]: the C runtime\'s _endthreadex (or whatnot). Can be NULL.
  -> IO (BG.Ptr SDL_Thread)
createThreadWithPropertiesRuntime =
  Unsafe.sDL_CreateThreadWithPropertiesRuntime

-- | The actual entry point for SDL_CreateThreadWithProperties.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateThreadWithPropertiesRuntime@.
--                   The unsafe flavor is 'createThreadWithPropertiesRuntime'
--                   : the entry function runs on the spawned thread, not during the call.
--
--     [C declaration]: @SDL_CreateThreadWithPropertiesRuntime@, defined at @SDL3\/SDL_thread.h 356:42@
createThreadWithPropertiesRuntimeSafe
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -- ^
  --
  --           [@pfnBeginThread@]: the C runtime\'s _beginthreadex (or whatnot). Can be NULL.
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -- ^
  --
  --           [@pfnEndThread@]: the C runtime\'s _endthreadex (or whatnot). Can be NULL.
  -> IO (BG.Ptr SDL_Thread)
createThreadWithPropertiesRuntimeSafe =
  Safe.sDL_CreateThreadWithPropertiesRuntime

-- | Get the thread name as it was specified in @SDL_CreateThread()@.
--
--     [Returns]: a pointer to a UTF-8 string that names the specified thread, or NULL if it doesn\'t have a name.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetThreadName@.
--                   The safe flavor is 'getThreadNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetThreadName@, defined at @SDL3\/SDL_thread.h 378:42@
getThreadName
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the thread to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getThreadName = Unsafe.sDL_GetThreadName

-- | Get the thread name as it was specified in @SDL_CreateThread()@.
--
--     [Returns]: a pointer to a UTF-8 string that names the specified thread, or NULL if it doesn\'t have a name.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetThreadName@.
--                   The unsafe flavor is 'getThreadName'
--                   .
--
--     [C declaration]: @SDL_GetThreadName@, defined at @SDL3\/SDL_thread.h 378:42@
getThreadNameSafe
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the thread to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getThreadNameSafe = Safe.sDL_GetThreadName

-- | Get the thread identifier for the current thread.
--
--     This thread identifier is as reported by the underlying operating system. If SDL is running on a platform that does not support threads the return value will always be zero.
--
--     This function also returns a valid thread ID when called from the main thread.
--
--     [Returns]: the ID of the current thread.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getThreadID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCurrentThreadID@.
--                   The safe flavor is 'getCurrentThreadIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetCurrentThreadID@, defined at @SDL3\/SDL_thread.h 398:42@
getCurrentThreadID :: IO SDL_ThreadID
getCurrentThreadID = Unsafe.sDL_GetCurrentThreadID

-- | Get the thread identifier for the current thread.
--
--     This thread identifier is as reported by the underlying operating system. If SDL is running on a platform that does not support threads the return value will always be zero.
--
--     This function also returns a valid thread ID when called from the main thread.
--
--     [Returns]: the ID of the current thread.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getThreadID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCurrentThreadID@.
--                   The unsafe flavor is 'getCurrentThreadID'
--                   .
--
--     [C declaration]: @SDL_GetCurrentThreadID@, defined at @SDL3\/SDL_thread.h 398:42@
getCurrentThreadIDSafe :: IO SDL_ThreadID
getCurrentThreadIDSafe = Safe.sDL_GetCurrentThreadID

-- | Get the thread identifier for the specified thread.
--
--     This thread identifier is as reported by the underlying operating system. If SDL is running on a platform that does not support threads the return value will always be zero.
--
--     [Returns]: the ID of the specified thread, or the ID of the current thread if @thread@ is NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCurrentThreadID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetThreadID@.
--                   The safe flavor is 'getThreadIDSafe'
--                   .
--
--     [C declaration]: @SDL_GetThreadID@, defined at @SDL3\/SDL_thread.h 417:42@
getThreadID
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the thread to query.
  -> IO SDL_ThreadID
getThreadID = Unsafe.sDL_GetThreadID

-- | Get the thread identifier for the specified thread.
--
--     This thread identifier is as reported by the underlying operating system. If SDL is running on a platform that does not support threads the return value will always be zero.
--
--     [Returns]: the ID of the specified thread, or the ID of the current thread if @thread@ is NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getCurrentThreadID'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetThreadID@.
--                   The unsafe flavor is 'getThreadID'
--                   .
--
--     [C declaration]: @SDL_GetThreadID@, defined at @SDL3\/SDL_thread.h 417:42@
getThreadIDSafe
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the thread to query.
  -> IO SDL_ThreadID
getThreadIDSafe = Safe.sDL_GetThreadID

-- | Set the priority for the current thread.
--
--     Note that some platforms will not let you alter the priority (or at least, promote the thread to a higher priority) at all, and some require you to be an administrator account. Be prepared for this to fail.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetCurrentThreadPriority@.
--                   The safe flavor is 'setCurrentThreadPrioritySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetCurrentThreadPriority@, defined at @SDL3\/SDL_thread.h 434:34@
setCurrentThreadPriority
  :: SDL_ThreadPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_ThreadPriority' to set.
  -> IO Bool
setCurrentThreadPriority =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_SetCurrentThreadPriority x00)

-- | Set the priority for the current thread.
--
--     Note that some platforms will not let you alter the priority (or at least, promote the thread to a higher priority) at all, and some require you to be an administrator account. Be prepared for this to fail.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetCurrentThreadPriority@.
--                   The unsafe flavor is 'setCurrentThreadPriority'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetCurrentThreadPriority@, defined at @SDL3\/SDL_thread.h 434:34@
setCurrentThreadPrioritySafe
  :: SDL_ThreadPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_ThreadPriority' to set.
  -> IO Bool
setCurrentThreadPrioritySafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_SetCurrentThreadPriority x00)

-- | Wait for a thread to finish.
--
--     Threads that haven\'t been detached will remain until this function cleans them up. Not doing so is a resource leak.
--
--     Once a thread has been cleaned up through this function, the 'SDL_Thread' that references it becomes invalid and should not be referenced again. As such, only one thread may call @'waitThread'@ on another.
--
--     The return code from the thread function is placed in the area pointed to by @status@, if @status@ is not NULL.
--
--     You may not wait on a thread that has been used in a call to @'detachThread'@. Use either that function or this one, but not both, or behavior is undefined.
--
--     It is safe to pass a NULL thread to this function; it is a no-op.
--
--     Note that the thread pointer is freed by this function and is not valid afterward.
--
--     [Thread safety]: It is safe to call this function from any thread, but only a single thread can wait any specific thread to finish.
--
--     @since 3.2.0
--
--     [See also]: @SDL_CreateThread@, 'detachThread'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitThread@.
--                   The safe flavor is 'waitThreadSafe'
--                   : blocks until the thread exits.
--
--     [C declaration]: @SDL_WaitThread@, defined at @SDL3\/SDL_thread.h 472:34@
waitThread
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the 'SDL_Thread' pointer that was returned from the @SDL_CreateThread()@ call that started this thread.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@status@]: a pointer filled in with the value returned from the thread function by its \'return\', or -1 if the thread has been detached or isn\'t valid, may be NULL.
  -> IO ()
waitThread = Unsafe.sDL_WaitThread

-- | Wait for a thread to finish.
--
--     Threads that haven\'t been detached will remain until this function cleans them up. Not doing so is a resource leak.
--
--     Once a thread has been cleaned up through this function, the 'SDL_Thread' that references it becomes invalid and should not be referenced again. As such, only one thread may call @'waitThread'@ on another.
--
--     The return code from the thread function is placed in the area pointed to by @status@, if @status@ is not NULL.
--
--     You may not wait on a thread that has been used in a call to @'detachThread'@. Use either that function or this one, but not both, or behavior is undefined.
--
--     It is safe to pass a NULL thread to this function; it is a no-op.
--
--     Note that the thread pointer is freed by this function and is not valid afterward.
--
--     [Thread safety]: It is safe to call this function from any thread, but only a single thread can wait any specific thread to finish.
--
--     @since 3.2.0
--
--     [See also]: @SDL_CreateThread@, 'detachThread'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitThread@.
--                   The unsafe flavor is 'waitThread'
--                   : blocks until the thread exits.
--
--     [C declaration]: @SDL_WaitThread@, defined at @SDL3\/SDL_thread.h 472:34@
waitThreadSafe
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the 'SDL_Thread' pointer that was returned from the @SDL_CreateThread()@ call that started this thread.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@status@]: a pointer filled in with the value returned from the thread function by its \'return\', or -1 if the thread has been detached or isn\'t valid, may be NULL.
  -> IO ()
waitThreadSafe = Safe.sDL_WaitThread

-- | Get the current state of a thread.
--
--     [Returns]: the current state of a thread, or SDL_THREAD_UNKNOWN if the thread isn\'t valid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_ThreadState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetThreadState@.
--                   The safe flavor is 'getThreadStateSafe'
--                   .
--
--     [C declaration]: @SDL_GetThreadState@, defined at @SDL3\/SDL_thread.h 487:45@
getThreadState
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the thread to query.
  -> IO SDL_ThreadState
getThreadState = Unsafe.sDL_GetThreadState

-- | Get the current state of a thread.
--
--     [Returns]: the current state of a thread, or SDL_THREAD_UNKNOWN if the thread isn\'t valid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_ThreadState'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetThreadState@.
--                   The unsafe flavor is 'getThreadState'
--                   .
--
--     [C declaration]: @SDL_GetThreadState@, defined at @SDL3\/SDL_thread.h 487:45@
getThreadStateSafe
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the thread to query.
  -> IO SDL_ThreadState
getThreadStateSafe = Safe.sDL_GetThreadState

-- | Let a thread clean up on exit without intervention.
--
--     A thread may be \"detached\" to signify that it should not remain until another thread has called @'waitThread'@ on it. Detaching a thread is useful for long-running threads that nothing needs to synchronize with or further manage. When a detached thread is done, it simply goes away.
--
--     There is no way to recover the return code of a detached thread. If you need this, don\'t detach the thread and instead use @'waitThread'@.
--
--     Once a thread is detached, you should usually assume the 'SDL_Thread' isn\'t safe to reference again, as it will become invalid immediately upon the detached thread\'s exit, instead of remaining until someone has called @'waitThread'@ to finally clean it up. As such, don\'t detach the same thread more than once.
--
--     If a thread has already exited when passed to @'detachThread'@, it will stop waiting for a call to @'waitThread'@ and clean up immediately. It is not safe to detach a thread that might be used with @'waitThread'@.
--
--     You may not call @'waitThread'@ on a thread that has been detached. Use either that function or this one, but not both, or behavior is undefined.
--
--     It is safe to pass NULL to this function; it is a no-op.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_CreateThread@, 'waitThread'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DetachThread@.
--                   The safe flavor is 'detachThreadSafe'
--                   .
--
--     [C declaration]: @SDL_DetachThread@, defined at @SDL3\/SDL_thread.h 525:34@
detachThread
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the 'SDL_Thread' pointer that was returned from the @SDL_CreateThread()@ call that started this thread.
  -> IO ()
detachThread = Unsafe.sDL_DetachThread

-- | Let a thread clean up on exit without intervention.
--
--     A thread may be \"detached\" to signify that it should not remain until another thread has called @'waitThread'@ on it. Detaching a thread is useful for long-running threads that nothing needs to synchronize with or further manage. When a detached thread is done, it simply goes away.
--
--     There is no way to recover the return code of a detached thread. If you need this, don\'t detach the thread and instead use @'waitThread'@.
--
--     Once a thread is detached, you should usually assume the 'SDL_Thread' isn\'t safe to reference again, as it will become invalid immediately upon the detached thread\'s exit, instead of remaining until someone has called @'waitThread'@ to finally clean it up. As such, don\'t detach the same thread more than once.
--
--     If a thread has already exited when passed to @'detachThread'@, it will stop waiting for a call to @'waitThread'@ and clean up immediately. It is not safe to detach a thread that might be used with @'waitThread'@.
--
--     You may not call @'waitThread'@ on a thread that has been detached. Use either that function or this one, but not both, or behavior is undefined.
--
--     It is safe to pass NULL to this function; it is a no-op.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_CreateThread@, 'waitThread'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DetachThread@.
--                   The unsafe flavor is 'detachThread'
--                   .
--
--     [C declaration]: @SDL_DetachThread@, defined at @SDL3\/SDL_thread.h 525:34@
detachThreadSafe
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the 'SDL_Thread' pointer that was returned from the @SDL_CreateThread()@ call that started this thread.
  -> IO ()
detachThreadSafe = Safe.sDL_DetachThread

-- | Get the current thread\'s value associated with a thread local storage ID.
--
--     [Returns]: the value associated with the ID for the current thread or NULL if no value has been set; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTLS'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetTLS@.
--                   The safe flavor is 'getTLSSafe'
--                   .
--
--     [C declaration]: @SDL_GetTLS@, defined at @SDL3\/SDL_thread.h 540:36@
getTLS
  :: BG.Ptr SDL_TLSID
  -- ^
  --
  --           [@id@]: a pointer to the thread local storage ID, may not be NULL.
  -> IO (BG.Ptr BG.Void)
getTLS = Unsafe.sDL_GetTLS

-- | Get the current thread\'s value associated with a thread local storage ID.
--
--     [Returns]: the value associated with the ID for the current thread or NULL if no value has been set; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setTLS'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetTLS@.
--                   The unsafe flavor is 'getTLS'
--                   .
--
--     [C declaration]: @SDL_GetTLS@, defined at @SDL3\/SDL_thread.h 540:36@
getTLSSafe
  :: BG.Ptr SDL_TLSID
  -- ^
  --
  --           [@id@]: a pointer to the thread local storage ID, may not be NULL.
  -> IO (BG.Ptr BG.Void)
getTLSSafe = Safe.sDL_GetTLS

-- | Set the current thread\'s value associated with a thread local storage ID.
--
--     If the thread local storage ID is not initialized (the value is 0), a new ID will be created in a thread-safe way, so all calls using a pointer to the same ID will refer to the same local storage.
--
--     Note that replacing a value from a previous call to this function on the same thread does /not/ call the previous value\'s destructor!
--
--     @destructor@ can be NULL; it is assumed that @value@ does not need to be cleaned up if so.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTLS'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetTLS@.
--                   The safe flavor is 'setTLSSafe'
--                   : registration; the destructor runs at thread cleanup.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTLS@, defined at @SDL3\/SDL_thread.h 581:34@
setTLS
  :: BG.Ptr SDL_TLSID
  -- ^
  --
  --           [@id@]: a pointer to the thread local storage ID, may not be NULL.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@value@]: the value to associate with the ID for the current thread.
  -> SDL_TLSDestructorCallback
  -- ^
  --
  --           [@destructor@]: a function called when the thread exits, to free the value, may be NULL.
  -> IO Bool
setTLS =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetTLS x00 x11 x22)

-- | Set the current thread\'s value associated with a thread local storage ID.
--
--     If the thread local storage ID is not initialized (the value is 0), a new ID will be created in a thread-safe way, so all calls using a pointer to the same ID will refer to the same local storage.
--
--     Note that replacing a value from a previous call to this function on the same thread does /not/ call the previous value\'s destructor!
--
--     @destructor@ can be NULL; it is assumed that @value@ does not need to be cleaned up if so.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getTLS'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetTLS@.
--                   The unsafe flavor is 'setTLS'
--                   : registration; the destructor runs at thread cleanup.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetTLS@, defined at @SDL3\/SDL_thread.h 581:34@
setTLSSafe
  :: BG.Ptr SDL_TLSID
  -- ^
  --
  --           [@id@]: a pointer to the thread local storage ID, may not be NULL.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@value@]: the value to associate with the ID for the current thread.
  -> SDL_TLSDestructorCallback
  -- ^
  --
  --           [@destructor@]: a function called when the thread exits, to free the value, may be NULL.
  -> IO Bool
setTLSSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetTLS x00 x11 x22)

-- | Cleanup all TLS data for this thread.
--
--     If you are creating your threads outside of SDL and then calling SDL functions, you should call this function before your thread exits, to properly clean up SDL memory.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CleanupTLS@.
--                   The safe flavor is 'cleanupTLSSafe'
--                   .
--
--     [C declaration]: @SDL_CleanupTLS@, defined at @SDL3\/SDL_thread.h 594:34@
cleanupTLS :: IO ()
cleanupTLS = Unsafe.sDL_CleanupTLS

-- | Cleanup all TLS data for this thread.
--
--     If you are creating your threads outside of SDL and then calling SDL functions, you should call this function before your thread exits, to properly clean up SDL memory.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CleanupTLS@.
--                   The unsafe flavor is 'cleanupTLS'
--                   .
--
--     [C declaration]: @SDL_CleanupTLS@, defined at @SDL3\/SDL_thread.h 594:34@
cleanupTLSSafe :: IO ()
cleanupTLSSafe = Safe.sDL_CleanupTLS
