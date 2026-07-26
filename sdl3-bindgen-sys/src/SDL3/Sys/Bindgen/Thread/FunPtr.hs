{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Thread.FunPtr (
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_CreateThreadRuntime,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_CreateThreadWithPropertiesRuntime,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_GetThreadName,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_GetCurrentThreadID,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_GetThreadID,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_SetCurrentThreadPriority,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_WaitThread,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_GetThreadState,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_DetachThread,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_GetTLS,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_SetTLS,
  SDL3.Sys.Bindgen.Thread.FunPtr.sDL_CleanupTLS,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_CreateThreadRuntime */"
         , "__attribute__ ((const))"
         , "SDL_Thread *(*hs_bindgen_079d67764828e8ca (void)) ("
         , "  SDL_ThreadFunction arg1,"
         , "  char const *arg2,"
         , "  void *arg3,"
         , "  SDL_FunctionPointer arg4,"
         , "  SDL_FunctionPointer arg5"
         , ")"
         , "{"
         , "  return &SDL_CreateThreadRuntime;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_CreateThreadWithPropertiesRuntime */"
         , "__attribute__ ((const))"
         , "SDL_Thread *(*hs_bindgen_fbbbbe860e54a81b (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  SDL_FunctionPointer arg2,"
         , "  SDL_FunctionPointer arg3"
         , ")"
         , "{"
         , "  return &SDL_CreateThreadWithPropertiesRuntime;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetThreadName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_e563c48c050c310f (void)) ("
         , "  SDL_Thread *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetThreadName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetCurrentThreadID */"
         , "__attribute__ ((const))"
         , "SDL_ThreadID (*hs_bindgen_effa8645fe390420 (void)) (void)"
         , "{"
         , "  return &SDL_GetCurrentThreadID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetThreadID */"
         , "__attribute__ ((const))"
         , "SDL_ThreadID (*hs_bindgen_c6b2baacca9ccf65 (void)) ("
         , "  SDL_Thread *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetThreadID;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_SetCurrentThreadPriority */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a168059a22478eba (void)) ("
         , "  SDL_ThreadPriority arg1"
         , ")"
         , "{"
         , "  return &SDL_SetCurrentThreadPriority;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_WaitThread */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_cfb548a191eb099e (void)) ("
         , "  SDL_Thread *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_WaitThread;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetThreadState */"
         , "__attribute__ ((const))"
         , "SDL_ThreadState (*hs_bindgen_f7f587323d3bdf2a (void)) ("
         , "  SDL_Thread *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetThreadState;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_DetachThread */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_aaa3526a91b1159b (void)) ("
         , "  SDL_Thread *arg1"
         , ")"
         , "{"
         , "  return &SDL_DetachThread;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetTLS */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_306c7e1462be621b (void)) ("
         , "  SDL_TLSID *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetTLS;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_SetTLS */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_aeaff0a42fc0a797 (void)) ("
         , "  SDL_TLSID *arg1,"
         , "  void const *arg2,"
         , "  SDL_TLSDestructorCallback arg3"
         , ")"
         , "{"
         , "  return &SDL_SetTLS;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_CleanupTLS */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_624951e26d725434 (void)) (void)"
         , "{"
         , "  return &SDL_CleanupTLS;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_CreateThreadRuntime@
foreign import ccall unsafe "hs_bindgen_079d67764828e8ca"
  hs_bindgen_079d67764828e8ca_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_CreateThreadRuntime@
hs_bindgen_079d67764828e8ca
  :: IO
       ( BG.FunPtr
           ( SDL_ThreadFunction
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
             -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
             -> IO (BG.Ptr SDL_Thread)
           )
       )
hs_bindgen_079d67764828e8ca =
  BG.fromFFIType hs_bindgen_079d67764828e8ca_base

{-# NOINLINE sDL_CreateThreadRuntime #-}

-- | The actual entry point for SDL_CreateThread.
--
--     [@fn@]: the 'SDL_ThreadFunction' function to call in the new thread
--
--     [@name@]: the name of the thread
--
--     [@data@]: a pointer that is passed to @fn@
--
--     [@pfnBeginThread@]: the C runtime\'s _beginthreadex (or whatnot). Can be NULL.
--
--     [@pfnEndThread@]: the C runtime\'s _endthreadex (or whatnot). Can be NULL.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CreateThreadRuntime@, defined at @SDL3\/SDL_thread.h 340:42@
sDL_CreateThreadRuntime
  :: BG.FunPtr
       ( SDL_ThreadFunction
         -> PtrConst.PtrConst BG.CChar
         -> BG.Ptr BG.Void
         -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
         -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
         -> IO (BG.Ptr SDL_Thread)
       )
sDL_CreateThreadRuntime =
  BG.unsafePerformIO hs_bindgen_079d67764828e8ca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_CreateThreadWithPropertiesRuntime@
foreign import ccall unsafe "hs_bindgen_fbbbbe860e54a81b"
  hs_bindgen_fbbbbe860e54a81b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_CreateThreadWithPropertiesRuntime@
hs_bindgen_fbbbbe860e54a81b
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
             -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
             -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
             -> IO (BG.Ptr SDL_Thread)
           )
       )
hs_bindgen_fbbbbe860e54a81b =
  BG.fromFFIType hs_bindgen_fbbbbe860e54a81b_base

{-# NOINLINE sDL_CreateThreadWithPropertiesRuntime #-}

-- | The actual entry point for SDL_CreateThreadWithProperties.
--
--     [@props@]: the properties to use
--
--     [@pfnBeginThread@]: the C runtime\'s _beginthreadex (or whatnot). Can be NULL.
--
--     [@pfnEndThread@]: the C runtime\'s _endthreadex (or whatnot). Can be NULL.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CreateThreadWithPropertiesRuntime@, defined at @SDL3\/SDL_thread.h 356:42@
sDL_CreateThreadWithPropertiesRuntime
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
         -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
         -> SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
         -> IO (BG.Ptr SDL_Thread)
       )
sDL_CreateThreadWithPropertiesRuntime =
  BG.unsafePerformIO hs_bindgen_fbbbbe860e54a81b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetThreadName@
foreign import ccall unsafe "hs_bindgen_e563c48c050c310f"
  hs_bindgen_e563c48c050c310f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetThreadName@
hs_bindgen_e563c48c050c310f :: IO (BG.FunPtr (BG.Ptr SDL_Thread -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_e563c48c050c310f =
  BG.fromFFIType hs_bindgen_e563c48c050c310f_base

{-# NOINLINE sDL_GetThreadName #-}

-- | Get the thread name as it was specified in @SDL_CreateThread()@.
--
--     [@thread@]: the thread to query.
--
--     [Returns]: a pointer to a UTF-8 string that names the specified thread, or NULL if it doesn\'t have a name.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetThreadName@, defined at @SDL3\/SDL_thread.h 378:42@
sDL_GetThreadName :: BG.FunPtr (BG.Ptr SDL_Thread -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetThreadName =
  BG.unsafePerformIO hs_bindgen_e563c48c050c310f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetCurrentThreadID@
foreign import ccall unsafe "hs_bindgen_effa8645fe390420"
  hs_bindgen_effa8645fe390420_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetCurrentThreadID@
hs_bindgen_effa8645fe390420 :: IO (BG.FunPtr (IO SDL_ThreadID))
hs_bindgen_effa8645fe390420 =
  BG.fromFFIType hs_bindgen_effa8645fe390420_base

{-# NOINLINE sDL_GetCurrentThreadID #-}

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
sDL_GetCurrentThreadID :: BG.FunPtr (IO SDL_ThreadID)
sDL_GetCurrentThreadID =
  BG.unsafePerformIO hs_bindgen_effa8645fe390420

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetThreadID@
foreign import ccall unsafe "hs_bindgen_c6b2baacca9ccf65"
  hs_bindgen_c6b2baacca9ccf65_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetThreadID@
hs_bindgen_c6b2baacca9ccf65 :: IO (BG.FunPtr (BG.Ptr SDL_Thread -> IO SDL_ThreadID))
hs_bindgen_c6b2baacca9ccf65 =
  BG.fromFFIType hs_bindgen_c6b2baacca9ccf65_base

{-# NOINLINE sDL_GetThreadID #-}

-- | Get the thread identifier for the specified thread.
--
--     This thread identifier is as reported by the underlying operating system. If SDL is running on a platform that does not support threads the return value will always be zero.
--
--     [@thread@]: the thread to query.
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
sDL_GetThreadID :: BG.FunPtr (BG.Ptr SDL_Thread -> IO SDL_ThreadID)
sDL_GetThreadID =
  BG.unsafePerformIO hs_bindgen_c6b2baacca9ccf65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_SetCurrentThreadPriority@
foreign import ccall unsafe "hs_bindgen_a168059a22478eba"
  hs_bindgen_a168059a22478eba_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_SetCurrentThreadPriority@
hs_bindgen_a168059a22478eba :: IO (BG.FunPtr (SDL_ThreadPriority -> IO BG.CBool))
hs_bindgen_a168059a22478eba =
  BG.fromFFIType hs_bindgen_a168059a22478eba_base

{-# NOINLINE sDL_SetCurrentThreadPriority #-}

-- | Set the priority for the current thread.
--
--     Note that some platforms will not let you alter the priority (or at least, promote the thread to a higher priority) at all, and some require you to be an administrator account. Be prepared for this to fail.
--
--     [@priority@]: the 'SDL_ThreadPriority' to set.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetCurrentThreadPriority@, defined at @SDL3\/SDL_thread.h 434:34@
sDL_SetCurrentThreadPriority :: BG.FunPtr (SDL_ThreadPriority -> IO BG.CBool)
sDL_SetCurrentThreadPriority =
  BG.unsafePerformIO hs_bindgen_a168059a22478eba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_WaitThread@
foreign import ccall unsafe "hs_bindgen_cfb548a191eb099e"
  hs_bindgen_cfb548a191eb099e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_WaitThread@
hs_bindgen_cfb548a191eb099e :: IO (BG.FunPtr (BG.Ptr SDL_Thread -> BG.Ptr BG.CInt -> IO ()))
hs_bindgen_cfb548a191eb099e =
  BG.fromFFIType hs_bindgen_cfb548a191eb099e_base

{-# NOINLINE sDL_WaitThread #-}

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
--     [@thread@]: the 'SDL_Thread' pointer that was returned from the @SDL_CreateThread()@ call that started this thread.
--
--     [@status@]: a pointer filled in with the value returned from the thread function by its \'return\', or -1 if the thread has been detached or isn\'t valid, may be NULL.
--
--     [Thread safety]: It is safe to call this function from any thread, but only a single thread can wait any specific thread to finish.
--
--     @since 3.2.0
--
--     [See also]: @SDL_CreateThread@, 'sDL_DetachThread'
--
--     [C declaration]: @SDL_WaitThread@, defined at @SDL3\/SDL_thread.h 472:34@
sDL_WaitThread :: BG.FunPtr (BG.Ptr SDL_Thread -> BG.Ptr BG.CInt -> IO ())
sDL_WaitThread =
  BG.unsafePerformIO hs_bindgen_cfb548a191eb099e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetThreadState@
foreign import ccall unsafe "hs_bindgen_f7f587323d3bdf2a"
  hs_bindgen_f7f587323d3bdf2a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetThreadState@
hs_bindgen_f7f587323d3bdf2a :: IO (BG.FunPtr (BG.Ptr SDL_Thread -> IO SDL_ThreadState))
hs_bindgen_f7f587323d3bdf2a =
  BG.fromFFIType hs_bindgen_f7f587323d3bdf2a_base

{-# NOINLINE sDL_GetThreadState #-}

-- | Get the current state of a thread.
--
--     [@thread@]: the thread to query.
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
sDL_GetThreadState :: BG.FunPtr (BG.Ptr SDL_Thread -> IO SDL_ThreadState)
sDL_GetThreadState =
  BG.unsafePerformIO hs_bindgen_f7f587323d3bdf2a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_DetachThread@
foreign import ccall unsafe "hs_bindgen_aaa3526a91b1159b"
  hs_bindgen_aaa3526a91b1159b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_DetachThread@
hs_bindgen_aaa3526a91b1159b :: IO (BG.FunPtr (BG.Ptr SDL_Thread -> IO ()))
hs_bindgen_aaa3526a91b1159b =
  BG.fromFFIType hs_bindgen_aaa3526a91b1159b_base

{-# NOINLINE sDL_DetachThread #-}

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
--     [@thread@]: the 'SDL_Thread' pointer that was returned from the @SDL_CreateThread()@ call that started this thread.
--
--     @since 3.2.0
--
--     [See also]: @SDL_CreateThread@, 'sDL_WaitThread'
--
--     [C declaration]: @SDL_DetachThread@, defined at @SDL3\/SDL_thread.h 525:34@
sDL_DetachThread :: BG.FunPtr (BG.Ptr SDL_Thread -> IO ())
sDL_DetachThread =
  BG.unsafePerformIO hs_bindgen_aaa3526a91b1159b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetTLS@
foreign import ccall unsafe "hs_bindgen_306c7e1462be621b"
  hs_bindgen_306c7e1462be621b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_GetTLS@
hs_bindgen_306c7e1462be621b :: IO (BG.FunPtr (BG.Ptr SDL_TLSID -> IO (BG.Ptr BG.Void)))
hs_bindgen_306c7e1462be621b =
  BG.fromFFIType hs_bindgen_306c7e1462be621b_base

{-# NOINLINE sDL_GetTLS #-}

-- | Get the current thread\'s value associated with a thread local storage ID.
--
--     [@id@]: a pointer to the thread local storage ID, may not be NULL.
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
sDL_GetTLS :: BG.FunPtr (BG.Ptr SDL_TLSID -> IO (BG.Ptr BG.Void))
sDL_GetTLS =
  BG.unsafePerformIO hs_bindgen_306c7e1462be621b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_SetTLS@
foreign import ccall unsafe "hs_bindgen_aeaff0a42fc0a797"
  hs_bindgen_aeaff0a42fc0a797_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_SetTLS@
hs_bindgen_aeaff0a42fc0a797
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_TLSID -> PtrConst.PtrConst BG.Void -> SDL_TLSDestructorCallback -> IO BG.CBool)
       )
hs_bindgen_aeaff0a42fc0a797 =
  BG.fromFFIType hs_bindgen_aeaff0a42fc0a797_base

{-# NOINLINE sDL_SetTLS #-}

-- | Set the current thread\'s value associated with a thread local storage ID.
--
--     If the thread local storage ID is not initialized (the value is 0), a new ID will be created in a thread-safe way, so all calls using a pointer to the same ID will refer to the same local storage.
--
--     Note that replacing a value from a previous call to this function on the same thread does /not/ call the previous value\'s destructor!
--
--     @destructor@ can be NULL; it is assumed that @value@ does not need to be cleaned up if so.
--
--     [@id@]: a pointer to the thread local storage ID, may not be NULL.
--
--     [@value@]: the value to associate with the ID for the current thread.
--
--     [@destructor@]: a function called when the thread exits, to free the value, may be NULL.
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
  :: BG.FunPtr
       (BG.Ptr SDL_TLSID -> PtrConst.PtrConst BG.Void -> SDL_TLSDestructorCallback -> IO BG.CBool)
sDL_SetTLS =
  BG.unsafePerformIO hs_bindgen_aeaff0a42fc0a797

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_CleanupTLS@
foreign import ccall unsafe "hs_bindgen_624951e26d725434"
  hs_bindgen_624951e26d725434_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Thread_get_SDL_CleanupTLS@
hs_bindgen_624951e26d725434 :: IO (BG.FunPtr (IO ()))
hs_bindgen_624951e26d725434 =
  BG.fromFFIType hs_bindgen_624951e26d725434_base

{-# NOINLINE sDL_CleanupTLS #-}

-- | Cleanup all TLS data for this thread.
--
--     If you are creating your threads outside of SDL and then calling SDL functions, you should call this function before your thread exits, to properly clean up SDL memory.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CleanupTLS@, defined at @SDL3\/SDL_thread.h 594:34@
sDL_CleanupTLS :: BG.FunPtr (IO ())
sDL_CleanupTLS =
  BG.unsafePerformIO hs_bindgen_624951e26d725434
