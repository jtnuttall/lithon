{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Thread.Unsafe (
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_CreateThreadRuntime,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_CreateThreadWithPropertiesRuntime,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_GetThreadName,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_GetCurrentThreadID,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_GetThreadID,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_SetCurrentThreadPriority,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_WaitThread,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_GetThreadState,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_DetachThread,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_GetTLS,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_SetTLS,
  SDL3.Sys.Bindgen.Thread.Unsafe.sDL_CleanupTLS,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Thread

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_thread.h>"
         , "SDL_Thread *hs_bindgen_0b01e232776d1771 ("
         , "  SDL_ThreadFunction arg1,"
         , "  char const *arg2,"
         , "  void *arg3,"
         , "  SDL_FunctionPointer arg4,"
         , "  SDL_FunctionPointer arg5"
         , ")"
         , "{"
         , "  return (SDL_CreateThreadRuntime)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "SDL_Thread *hs_bindgen_1c8412acc4b761ed ("
         , "  SDL_PropertiesID arg1,"
         , "  SDL_FunctionPointer arg2,"
         , "  SDL_FunctionPointer arg3"
         , ")"
         , "{"
         , "  return (SDL_CreateThreadWithPropertiesRuntime)(arg1, arg2, arg3);"
         , "}"
         , "char const *hs_bindgen_98e2f1286c996b7c ("
         , "  SDL_Thread *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetThreadName)(arg1);"
         , "}"
         , "SDL_ThreadID hs_bindgen_cdc0bfea9267653a (void)"
         , "{"
         , "  return (SDL_GetCurrentThreadID)();"
         , "}"
         , "SDL_ThreadID hs_bindgen_0bcf1cae64c8f7f6 ("
         , "  SDL_Thread *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetThreadID)(arg1);"
         , "}"
         , "_Bool hs_bindgen_3d388217e2964b35 ("
         , "  SDL_ThreadPriority arg1"
         , ")"
         , "{"
         , "  return (SDL_SetCurrentThreadPriority)(arg1);"
         , "}"
         , "void hs_bindgen_fe4fa21954b69cf9 ("
         , "  SDL_Thread *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  (SDL_WaitThread)(arg1, arg2);"
         , "}"
         , "SDL_ThreadState hs_bindgen_44514a39d4434fbe ("
         , "  SDL_Thread *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetThreadState)(arg1);"
         , "}"
         , "void hs_bindgen_4de0f0719eae79d5 ("
         , "  SDL_Thread *arg1"
         , ")"
         , "{"
         , "  (SDL_DetachThread)(arg1);"
         , "}"
         , "void *hs_bindgen_43b0e02438c01176 ("
         , "  SDL_TLSID *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetTLS)(arg1);"
         , "}"
         , "_Bool hs_bindgen_ff93284cbd8231ff ("
         , "  SDL_TLSID *arg1,"
         , "  void const *arg2,"
         , "  SDL_TLSDestructorCallback arg3"
         , ")"
         , "{"
         , "  return (SDL_SetTLS)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_b394a7e70a8b089a (void)"
         , "{"
         , "  (SDL_CleanupTLS)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_CreateThreadRuntime@
foreign import ccall unsafe "hs_bindgen_0b01e232776d1771"
  hs_bindgen_0b01e232776d1771_base
    :: BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_CreateThreadRuntime@
hs_bindgen_0b01e232776d1771
  :: SDL_ThreadFunction
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr BG.Void
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -> IO (BG.Ptr SDL_Thread)
hs_bindgen_0b01e232776d1771 =
  BG.fromFFIType hs_bindgen_0b01e232776d1771_base

-- | The actual entry point for SDL_CreateThread.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CreateThreadRuntime@, defined at @SDL3\/SDL_thread.h 340:42@
sDL_CreateThreadRuntime
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
sDL_CreateThreadRuntime = hs_bindgen_0b01e232776d1771

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_CreateThreadWithPropertiesRuntime@
foreign import ccall unsafe "hs_bindgen_1c8412acc4b761ed"
  hs_bindgen_1c8412acc4b761ed_base
    :: BG.Word32
    -> BG.FunPtr BG.Void
    -> BG.FunPtr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_CreateThreadWithPropertiesRuntime@
hs_bindgen_1c8412acc4b761ed
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
  -> IO (BG.Ptr SDL_Thread)
hs_bindgen_1c8412acc4b761ed =
  BG.fromFFIType hs_bindgen_1c8412acc4b761ed_base

-- | The actual entry point for SDL_CreateThreadWithProperties.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CreateThreadWithPropertiesRuntime@, defined at @SDL3\/SDL_thread.h 356:42@
sDL_CreateThreadWithPropertiesRuntime
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
sDL_CreateThreadWithPropertiesRuntime =
  hs_bindgen_1c8412acc4b761ed

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetThreadName@
foreign import ccall unsafe "hs_bindgen_98e2f1286c996b7c"
  hs_bindgen_98e2f1286c996b7c_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetThreadName@
hs_bindgen_98e2f1286c996b7c
  :: BG.Ptr SDL_Thread
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_98e2f1286c996b7c =
  BG.fromFFIType hs_bindgen_98e2f1286c996b7c_base

-- | Get the thread name as it was specified in @SDL_CreateThread()@.
--
--     [Returns]: a pointer to a UTF-8 string that names the specified thread, or NULL if it doesn\'t have a name.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetThreadName@, defined at @SDL3\/SDL_thread.h 378:42@
sDL_GetThreadName
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the thread to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetThreadName = hs_bindgen_98e2f1286c996b7c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetCurrentThreadID@
foreign import ccall unsafe "hs_bindgen_cdc0bfea9267653a"
  hs_bindgen_cdc0bfea9267653a_base
    :: IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetCurrentThreadID@
hs_bindgen_cdc0bfea9267653a :: IO SDL_ThreadID
hs_bindgen_cdc0bfea9267653a =
  BG.fromFFIType hs_bindgen_cdc0bfea9267653a_base

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
--     [See also]: 'sDL_GetThreadID'
--
--     [C declaration]: @SDL_GetCurrentThreadID@, defined at @SDL3\/SDL_thread.h 398:42@
sDL_GetCurrentThreadID :: IO SDL_ThreadID
sDL_GetCurrentThreadID = hs_bindgen_cdc0bfea9267653a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetThreadID@
foreign import ccall unsafe "hs_bindgen_0bcf1cae64c8f7f6"
  hs_bindgen_0bcf1cae64c8f7f6_base
    :: BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetThreadID@
hs_bindgen_0bcf1cae64c8f7f6
  :: BG.Ptr SDL_Thread
  -> IO SDL_ThreadID
hs_bindgen_0bcf1cae64c8f7f6 =
  BG.fromFFIType hs_bindgen_0bcf1cae64c8f7f6_base

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
--     [See also]: 'sDL_GetCurrentThreadID'
--
--     [C declaration]: @SDL_GetThreadID@, defined at @SDL3\/SDL_thread.h 417:42@
sDL_GetThreadID
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the thread to query.
  -> IO SDL_ThreadID
sDL_GetThreadID = hs_bindgen_0bcf1cae64c8f7f6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_SetCurrentThreadPriority@
foreign import ccall unsafe "hs_bindgen_3d388217e2964b35"
  hs_bindgen_3d388217e2964b35_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_SetCurrentThreadPriority@
hs_bindgen_3d388217e2964b35
  :: SDL_ThreadPriority
  -> IO BG.CBool
hs_bindgen_3d388217e2964b35 =
  BG.fromFFIType hs_bindgen_3d388217e2964b35_base

-- | Set the priority for the current thread.
--
--     Note that some platforms will not let you alter the priority (or at least, promote the thread to a higher priority) at all, and some require you to be an administrator account. Be prepared for this to fail.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetCurrentThreadPriority@, defined at @SDL3\/SDL_thread.h 434:34@
sDL_SetCurrentThreadPriority
  :: SDL_ThreadPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_ThreadPriority' to set.
  -> IO BG.CBool
sDL_SetCurrentThreadPriority =
  hs_bindgen_3d388217e2964b35

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_WaitThread@
foreign import ccall unsafe "hs_bindgen_fe4fa21954b69cf9"
  hs_bindgen_fe4fa21954b69cf9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_WaitThread@
hs_bindgen_fe4fa21954b69cf9
  :: BG.Ptr SDL_Thread
  -> BG.Ptr BG.CInt
  -> IO ()
hs_bindgen_fe4fa21954b69cf9 =
  BG.fromFFIType hs_bindgen_fe4fa21954b69cf9_base

-- | Wait for a thread to finish.
--
--     Threads that haven\'t been detached will remain until this function cleans them up. Not doing so is a resource leak.
--
--     Once a thread has been cleaned up through this function, the 'SDL_Thread' that references it becomes invalid and should not be referenced again. As such, only one thread may call @SDL_WaitThread()@ on another.
--
--     The return code from the thread function is placed in the area pointed to by @status@, if @status@ is not NULL.
--
--     You may not wait on a thread that has been used in a call to @SDL_DetachThread()@. Use either that function or this one, but not both, or behavior is undefined.
--
--     It is safe to pass a NULL thread to this function; it is a no-op.
--
--     Note that the thread pointer is freed by this function and is not valid afterward.
--
--     [Thread safety]: It is safe to call this function from any thread, but only a single thread can wait any specific thread to finish.
--
--     @since 3.2.0
--
--     [See also]: @SDL_CreateThread@, 'sDL_DetachThread'
--
--     [C declaration]: @SDL_WaitThread@, defined at @SDL3\/SDL_thread.h 472:34@
sDL_WaitThread
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the 'SDL_Thread' pointer that was returned from the @SDL_CreateThread()@ call that started this thread.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@status@]: a pointer filled in with the value returned from the thread function by its \'return\', or -1 if the thread has been detached or isn\'t valid, may be NULL.
  -> IO ()
sDL_WaitThread = hs_bindgen_fe4fa21954b69cf9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetThreadState@
foreign import ccall unsafe "hs_bindgen_44514a39d4434fbe"
  hs_bindgen_44514a39d4434fbe_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetThreadState@
hs_bindgen_44514a39d4434fbe
  :: BG.Ptr SDL_Thread
  -> IO SDL_ThreadState
hs_bindgen_44514a39d4434fbe =
  BG.fromFFIType hs_bindgen_44514a39d4434fbe_base

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
--     [C declaration]: @SDL_GetThreadState@, defined at @SDL3\/SDL_thread.h 487:45@
sDL_GetThreadState
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the thread to query.
  -> IO SDL_ThreadState
sDL_GetThreadState = hs_bindgen_44514a39d4434fbe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_DetachThread@
foreign import ccall unsafe "hs_bindgen_4de0f0719eae79d5"
  hs_bindgen_4de0f0719eae79d5_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_DetachThread@
hs_bindgen_4de0f0719eae79d5
  :: BG.Ptr SDL_Thread
  -> IO ()
hs_bindgen_4de0f0719eae79d5 =
  BG.fromFFIType hs_bindgen_4de0f0719eae79d5_base

-- | Let a thread clean up on exit without intervention.
--
--     A thread may be \"detached\" to signify that it should not remain until another thread has called @SDL_WaitThread()@ on it. Detaching a thread is useful for long-running threads that nothing needs to synchronize with or further manage. When a detached thread is done, it simply goes away.
--
--     There is no way to recover the return code of a detached thread. If you need this, don\'t detach the thread and instead use @SDL_WaitThread()@.
--
--     Once a thread is detached, you should usually assume the 'SDL_Thread' isn\'t safe to reference again, as it will become invalid immediately upon the detached thread\'s exit, instead of remaining until someone has called @SDL_WaitThread()@ to finally clean it up. As such, don\'t detach the same thread more than once.
--
--     If a thread has already exited when passed to @SDL_DetachThread()@, it will stop waiting for a call to @SDL_WaitThread()@ and clean up immediately. It is not safe to detach a thread that might be used with @SDL_WaitThread()@.
--
--     You may not call @SDL_WaitThread()@ on a thread that has been detached. Use either that function or this one, but not both, or behavior is undefined.
--
--     It is safe to pass NULL to this function; it is a no-op.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_CreateThread@, 'sDL_WaitThread'
--
--     [C declaration]: @SDL_DetachThread@, defined at @SDL3\/SDL_thread.h 525:34@
sDL_DetachThread
  :: BG.Ptr SDL_Thread
  -- ^
  --
  --           [@thread@]: the 'SDL_Thread' pointer that was returned from the @SDL_CreateThread()@ call that started this thread.
  -> IO ()
sDL_DetachThread = hs_bindgen_4de0f0719eae79d5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetTLS@
foreign import ccall unsafe "hs_bindgen_43b0e02438c01176"
  hs_bindgen_43b0e02438c01176_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_GetTLS@
hs_bindgen_43b0e02438c01176
  :: BG.Ptr SDL_TLSID
  -> IO (BG.Ptr BG.Void)
hs_bindgen_43b0e02438c01176 =
  BG.fromFFIType hs_bindgen_43b0e02438c01176_base

-- | Get the current thread\'s value associated with a thread local storage ID.
--
--     [Returns]: the value associated with the ID for the current thread or NULL if no value has been set; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetTLS'
--
--     [C declaration]: @SDL_GetTLS@, defined at @SDL3\/SDL_thread.h 540:36@
sDL_GetTLS
  :: BG.Ptr SDL_TLSID
  -- ^
  --
  --           [@id@]: a pointer to the thread local storage ID, may not be NULL.
  -> IO (BG.Ptr BG.Void)
sDL_GetTLS = hs_bindgen_43b0e02438c01176

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_SetTLS@
foreign import ccall unsafe "hs_bindgen_ff93284cbd8231ff"
  hs_bindgen_ff93284cbd8231ff_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_SetTLS@
hs_bindgen_ff93284cbd8231ff
  :: BG.Ptr SDL_TLSID
  -> PtrConst.PtrConst BG.Void
  -> SDL_TLSDestructorCallback
  -> IO BG.CBool
hs_bindgen_ff93284cbd8231ff =
  BG.fromFFIType hs_bindgen_ff93284cbd8231ff_base

-- | Set the current thread\'s value associated with a thread local storage ID.
--
--     If the thread local storage ID is not initialized (the value is 0), a new ID will be created in a thread-safe way, so all calls using a pointer to the same ID will refer to the same local storage.
--
--     Note that replacing a value from a previous call to this function on the same thread does /not/ call the previous value\'s destructor!
--
--     @destructor@ can be NULL; it is assumed that @value@ does not need to be cleaned up if so.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTLS'
--
--     [C declaration]: @SDL_SetTLS@, defined at @SDL3\/SDL_thread.h 581:34@
sDL_SetTLS
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
  -> IO BG.CBool
sDL_SetTLS = hs_bindgen_ff93284cbd8231ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_CleanupTLS@
foreign import ccall unsafe "hs_bindgen_b394a7e70a8b089a"
  hs_bindgen_b394a7e70a8b089a_base
    :: IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_Unsafe_SDL_CleanupTLS@
hs_bindgen_b394a7e70a8b089a :: IO ()
hs_bindgen_b394a7e70a8b089a =
  BG.fromFFIType hs_bindgen_b394a7e70a8b089a_base

-- | Cleanup all TLS data for this thread.
--
--     If you are creating your threads outside of SDL and then calling SDL functions, you should call this function before your thread exits, to properly clean up SDL memory.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CleanupTLS@, defined at @SDL3\/SDL_thread.h 594:34@
sDL_CleanupTLS :: IO ()
sDL_CleanupTLS = hs_bindgen_b394a7e70a8b089a
