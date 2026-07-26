{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Asyncio.FunPtr (
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_AsyncIOFromFile,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_GetAsyncIOSize,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_ReadAsyncIO,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_WriteAsyncIO,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_CloseAsyncIO,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_CreateAsyncIOQueue,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_DestroyAsyncIOQueue,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_GetAsyncIOResult,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_WaitAsyncIOResult,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_SignalAsyncIOQueue,
  SDL3.Sys.Bindgen.Asyncio.FunPtr.sDL_LoadFileAsync,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Asyncio
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_asyncio.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_AsyncIOFromFile */"
         , "__attribute__ ((const))"
         , "SDL_AsyncIO *(*hs_bindgen_1df76789789f6d0b (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_AsyncIOFromFile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_GetAsyncIOSize */"
         , "__attribute__ ((const))"
         , "Sint64 (*hs_bindgen_2873a0d4a88e3a7b (void)) ("
         , "  SDL_AsyncIO *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAsyncIOSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_ReadAsyncIO */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c870b15855ed63f1 (void)) ("
         , "  SDL_AsyncIO *arg1,"
         , "  void *arg2,"
         , "  Uint64 arg3,"
         , "  Uint64 arg4,"
         , "  SDL_AsyncIOQueue *arg5,"
         , "  void *arg6"
         , ")"
         , "{"
         , "  return &SDL_ReadAsyncIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_WriteAsyncIO */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9a68985237acc0c3 (void)) ("
         , "  SDL_AsyncIO *arg1,"
         , "  void *arg2,"
         , "  Uint64 arg3,"
         , "  Uint64 arg4,"
         , "  SDL_AsyncIOQueue *arg5,"
         , "  void *arg6"
         , ")"
         , "{"
         , "  return &SDL_WriteAsyncIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_CloseAsyncIO */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e5791205836e93d4 (void)) ("
         , "  SDL_AsyncIO *arg1,"
         , "  _Bool arg2,"
         , "  SDL_AsyncIOQueue *arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return &SDL_CloseAsyncIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_CreateAsyncIOQueue */"
         , "__attribute__ ((const))"
         , "SDL_AsyncIOQueue *(*hs_bindgen_bad5a1c7bbfc4f36 (void)) (void)"
         , "{"
         , "  return &SDL_CreateAsyncIOQueue;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_DestroyAsyncIOQueue */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_f1f3445924531218 (void)) ("
         , "  SDL_AsyncIOQueue *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyAsyncIOQueue;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_GetAsyncIOResult */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a377aedfcfda7243 (void)) ("
         , "  SDL_AsyncIOQueue *arg1,"
         , "  SDL_AsyncIOOutcome *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetAsyncIOResult;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_WaitAsyncIOResult */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1b55fd087de307a9 (void)) ("
         , "  SDL_AsyncIOQueue *arg1,"
         , "  SDL_AsyncIOOutcome *arg2,"
         , "  Sint32 arg3"
         , ")"
         , "{"
         , "  return &SDL_WaitAsyncIOResult;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_SignalAsyncIOQueue */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_094baddfb7dfcf9e (void)) ("
         , "  SDL_AsyncIOQueue *arg1"
         , ")"
         , "{"
         , "  return &SDL_SignalAsyncIOQueue;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_LoadFileAsync */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f844da257a66f6c5 (void)) ("
         , "  char const *arg1,"
         , "  SDL_AsyncIOQueue *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_LoadFileAsync;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_AsyncIOFromFile@
foreign import ccall unsafe "hs_bindgen_1df76789789f6d0b"
  hs_bindgen_1df76789789f6d0b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_AsyncIOFromFile@
hs_bindgen_1df76789789f6d0b
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_AsyncIO)))
hs_bindgen_1df76789789f6d0b =
  BG.fromFFIType hs_bindgen_1df76789789f6d0b_base

{-# NOINLINE sDL_AsyncIOFromFile #-}

-- | Use this function to create a new 'SDL_AsyncIO' object for reading from and\/or writing to a named file.
--
--     The @mode@ string understands the following values:
--
--     * \"r\": Open a file for reading only. It must exist.
--
--     * \"w\": Open a file for writing only. It will create missing files or truncate existing ones.
--
--     * \"r+\": Open a file for update both reading and writing. The file must exist.
--
--     * \"w+\": Create an empty file for both reading and writing. If a file with the same name already exists its content is erased and the file is treated as a new empty file.
--
--     There is no \"b\" mode, as there is only \"binary\" style I\/O, and no \"a\" mode for appending, since you specify the position when starting a task.
--
--     This function supports Unicode filenames, but they must be encoded in UTF-8 format, regardless of the underlying operating system.
--
--     This call is /not/ asynchronous; it will open the file before returning, under the assumption that doing so is generally a fast operation. Future reads and writes to the opened file will be async, however.
--
--     [@file@]: a UTF-8 string representing the filename to open.
--
--     [@mode@]: an ASCII string representing the mode to be used for opening the file.
--
--     [Returns]: a pointer to the 'SDL_AsyncIO' structure that is created or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseAsyncIO', 'sDL_ReadAsyncIO', 'sDL_WriteAsyncIO'
--
--     [C declaration]: @SDL_AsyncIOFromFile@, defined at @SDL3\/SDL_asyncio.h 224:43@
sDL_AsyncIOFromFile
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_AsyncIO))
sDL_AsyncIOFromFile =
  BG.unsafePerformIO hs_bindgen_1df76789789f6d0b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_GetAsyncIOSize@
foreign import ccall unsafe "hs_bindgen_2873a0d4a88e3a7b"
  hs_bindgen_2873a0d4a88e3a7b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_GetAsyncIOSize@
hs_bindgen_2873a0d4a88e3a7b
  :: IO (BG.FunPtr (BG.Ptr SDL_AsyncIO -> IO SDL3.Sys.Bindgen.Stdinc.Sint64))
hs_bindgen_2873a0d4a88e3a7b =
  BG.fromFFIType hs_bindgen_2873a0d4a88e3a7b_base

{-# NOINLINE sDL_GetAsyncIOSize #-}

-- | Use this function to get the size of the data stream in an 'SDL_AsyncIO'.
--
--     This call is /not/ asynchronous; it assumes that obtaining this info is a non-blocking operation in most reasonable cases.
--
--     [@asyncio@]: the 'SDL_AsyncIO' to get the size of the data stream from.
--
--     [Returns]: the size of the data stream in the SDL_IOStream on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetAsyncIOSize@, defined at @SDL3\/SDL_asyncio.h 241:36@
sDL_GetAsyncIOSize :: BG.FunPtr (BG.Ptr SDL_AsyncIO -> IO SDL3.Sys.Bindgen.Stdinc.Sint64)
sDL_GetAsyncIOSize =
  BG.unsafePerformIO hs_bindgen_2873a0d4a88e3a7b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_ReadAsyncIO@
foreign import ccall unsafe "hs_bindgen_c870b15855ed63f1"
  hs_bindgen_c870b15855ed63f1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_ReadAsyncIO@
hs_bindgen_c870b15855ed63f1
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_AsyncIO
             -> BG.Ptr BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint64
             -> SDL3.Sys.Bindgen.Stdinc.Uint64
             -> BG.Ptr SDL_AsyncIOQueue
             -> BG.Ptr BG.Void
             -> IO BG.CBool
           )
       )
hs_bindgen_c870b15855ed63f1 =
  BG.fromFFIType hs_bindgen_c870b15855ed63f1_base

{-# NOINLINE sDL_ReadAsyncIO #-}

-- | Start an async read.
--
--     This function reads up to @size@ bytes from @offset@ position in the data source to the area pointed at by @ptr@. This function may read less bytes than requested.
--
--     This function returns as quickly as possible; it does not wait for the read to complete. On a successful return, this work will continue in the background. If the work begins, even failure is asynchronous: a failing return value from this function only means the work couldn\'t start at all.
--
--     @ptr@ must remain available until the work is done, and may be accessed by the system at any time until then. Do not allocate it on the stack, as this might take longer than the life of the calling function to complete!
--
--     An 'SDL_AsyncIOQueue' must be specified. The newly-created task will be added to it when it completes its work.
--
--     [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure.
--
--     [@ptr@]: a pointer to a buffer to read data into.
--
--     [@offset@]: the position to start reading in the data source.
--
--     [@size@]: the number of bytes to read from the data source.
--
--     [@queue@]: a queue to add the new 'SDL_AsyncIO' to.
--
--     [@userdata@]: an app-defined pointer that will be provided with the task results.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WriteAsyncIO', 'sDL_CreateAsyncIOQueue'
--
--     [C declaration]: @SDL_ReadAsyncIO@, defined at @SDL3\/SDL_asyncio.h 279:34@
sDL_ReadAsyncIO
  :: BG.FunPtr
       ( BG.Ptr SDL_AsyncIO
         -> BG.Ptr BG.Void
         -> SDL3.Sys.Bindgen.Stdinc.Uint64
         -> SDL3.Sys.Bindgen.Stdinc.Uint64
         -> BG.Ptr SDL_AsyncIOQueue
         -> BG.Ptr BG.Void
         -> IO BG.CBool
       )
sDL_ReadAsyncIO =
  BG.unsafePerformIO hs_bindgen_c870b15855ed63f1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_WriteAsyncIO@
foreign import ccall unsafe "hs_bindgen_9a68985237acc0c3"
  hs_bindgen_9a68985237acc0c3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_WriteAsyncIO@
hs_bindgen_9a68985237acc0c3
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_AsyncIO
             -> BG.Ptr BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint64
             -> SDL3.Sys.Bindgen.Stdinc.Uint64
             -> BG.Ptr SDL_AsyncIOQueue
             -> BG.Ptr BG.Void
             -> IO BG.CBool
           )
       )
hs_bindgen_9a68985237acc0c3 =
  BG.fromFFIType hs_bindgen_9a68985237acc0c3_base

{-# NOINLINE sDL_WriteAsyncIO #-}

-- | Start an async write.
--
--     This function writes @size@ bytes from @offset@ position in the data source to the area pointed at by @ptr@.
--
--     This function returns as quickly as possible; it does not wait for the write to complete. On a successful return, this work will continue in the background. If the work begins, even failure is asynchronous: a failing return value from this function only means the work couldn\'t start at all.
--
--     @ptr@ must remain available until the work is done, and may be accessed by the system at any time until then. Do not allocate it on the stack, as this might take longer than the life of the calling function to complete!
--
--     An 'SDL_AsyncIOQueue' must be specified. The newly-created task will be added to it when it completes its work.
--
--     [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure.
--
--     [@ptr@]: a pointer to a buffer to write data from.
--
--     [@offset@]: the position to start writing to the data source.
--
--     [@size@]: the number of bytes to write to the data source.
--
--     [@queue@]: a queue to add the new 'SDL_AsyncIO' to.
--
--     [@userdata@]: an app-defined pointer that will be provided with the task results.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ReadAsyncIO', 'sDL_CreateAsyncIOQueue'
--
--     [C declaration]: @SDL_WriteAsyncIO@, defined at @SDL3\/SDL_asyncio.h 316:34@
sDL_WriteAsyncIO
  :: BG.FunPtr
       ( BG.Ptr SDL_AsyncIO
         -> BG.Ptr BG.Void
         -> SDL3.Sys.Bindgen.Stdinc.Uint64
         -> SDL3.Sys.Bindgen.Stdinc.Uint64
         -> BG.Ptr SDL_AsyncIOQueue
         -> BG.Ptr BG.Void
         -> IO BG.CBool
       )
sDL_WriteAsyncIO =
  BG.unsafePerformIO hs_bindgen_9a68985237acc0c3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_CloseAsyncIO@
foreign import ccall unsafe "hs_bindgen_e5791205836e93d4"
  hs_bindgen_e5791205836e93d4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_CloseAsyncIO@
hs_bindgen_e5791205836e93d4
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_AsyncIO -> BG.CBool -> BG.Ptr SDL_AsyncIOQueue -> BG.Ptr BG.Void -> IO BG.CBool)
       )
hs_bindgen_e5791205836e93d4 =
  BG.fromFFIType hs_bindgen_e5791205836e93d4_base

{-# NOINLINE sDL_CloseAsyncIO #-}

-- | Close and free any allocated resources for an async I\/O object.
--
--     Closing a file is /also/ an asynchronous task! If a write failure were to happen during the closing process, for example, the task results will report it as usual.
--
--     Closing a file that has been written to does not guarantee the data has made it to physical media; it may remain in the operating system\'s file cache, for later writing to disk. This means that a successfully-closed file can be lost if the system crashes or loses power in this small window. To prevent this, call this function with the @flush@ parameter set to true. This will make the operation take longer, and perhaps increase system load in general, but a successful result guarantees that the data has made it to physical storage. Don\'t use this for temporary files, caches, and unimportant data, and definitely use it for crucial irreplaceable files, like game saves.
--
--     This function guarantees that the close will happen after any other pending tasks to @asyncio@, so it\'s safe to open a file, start several operations, close the file immediately, then check for all results later. This function will not block until the tasks have completed.
--
--     Once this function returns true, @asyncio@ is no longer valid, regardless of any future outcomes. Any completed tasks might still contain this pointer in their 'SDL_AsyncIOOutcome' data, in case the app was using this value to track information, but it should not be used again.
--
--     If this function returns false, the close wasn\'t started at all, and it\'s safe to attempt to close again later.
--
--     An 'SDL_AsyncIOQueue' must be specified. The newly-created task will be added to it when it completes its work.
--
--     [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure to close.
--
--     [@flush@]: true if data should sync to disk before the task completes.
--
--     [@queue@]: a queue to add the new 'SDL_AsyncIO' to.
--
--     [@userdata@]: an app-defined pointer that will be provided with the task results.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but two threads should not attempt to close the same object.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CloseAsyncIO@, defined at @SDL3\/SDL_asyncio.h 365:34@
sDL_CloseAsyncIO
  :: BG.FunPtr
       (BG.Ptr SDL_AsyncIO -> BG.CBool -> BG.Ptr SDL_AsyncIOQueue -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_CloseAsyncIO =
  BG.unsafePerformIO hs_bindgen_e5791205836e93d4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_CreateAsyncIOQueue@
foreign import ccall unsafe "hs_bindgen_bad5a1c7bbfc4f36"
  hs_bindgen_bad5a1c7bbfc4f36_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_CreateAsyncIOQueue@
hs_bindgen_bad5a1c7bbfc4f36 :: IO (BG.FunPtr (IO (BG.Ptr SDL_AsyncIOQueue)))
hs_bindgen_bad5a1c7bbfc4f36 =
  BG.fromFFIType hs_bindgen_bad5a1c7bbfc4f36_base

{-# NOINLINE sDL_CreateAsyncIOQueue #-}

-- | Create a task queue for tracking multiple I\/O operations.
--
--     Async I\/O operations are assigned to a queue when started. The queue can be checked for completed tasks thereafter.
--
--     [Returns]: a new task queue object or NULL if there was an error; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyAsyncIOQueue', 'sDL_GetAsyncIOResult', 'sDL_WaitAsyncIOResult'
--
--     [C declaration]: @SDL_CreateAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 384:48@
sDL_CreateAsyncIOQueue :: BG.FunPtr (IO (BG.Ptr SDL_AsyncIOQueue))
sDL_CreateAsyncIOQueue =
  BG.unsafePerformIO hs_bindgen_bad5a1c7bbfc4f36

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_DestroyAsyncIOQueue@
foreign import ccall unsafe "hs_bindgen_f1f3445924531218"
  hs_bindgen_f1f3445924531218_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_DestroyAsyncIOQueue@
hs_bindgen_f1f3445924531218 :: IO (BG.FunPtr (BG.Ptr SDL_AsyncIOQueue -> IO ()))
hs_bindgen_f1f3445924531218 =
  BG.fromFFIType hs_bindgen_f1f3445924531218_base

{-# NOINLINE sDL_DestroyAsyncIOQueue #-}

-- | Destroy a previously-created async I\/O task queue.
--
--     If there are still tasks pending for this queue, this call will block until those tasks are finished. All those tasks will be deallocated. Their results will be lost to the app.
--
--     Any pending reads from @SDL_LoadFileAsync()@ that are still in this queue will have their buffers deallocated by this function, to prevent a memory leak.
--
--     Once this function is called, the queue is no longer valid and should not be used, including by other threads that might access it while destruction is blocking on pending tasks.
--
--     Do not destroy a queue that still has threads waiting on it through @SDL_WaitAsyncIOResult()@. You can call @SDL_SignalAsyncIOQueue()@ first to unblock those threads, and take measures (such as SDL_WaitThread()) to make sure they have finished their wait and won\'t wait on the queue again.
--
--     [@queue@]: the task queue to destroy.
--
--     [Thread safety]: It is safe to call this function from any thread, so long as no other thread is waiting on the queue with SDL_WaitAsyncIOResult.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DestroyAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 414:34@
sDL_DestroyAsyncIOQueue :: BG.FunPtr (BG.Ptr SDL_AsyncIOQueue -> IO ())
sDL_DestroyAsyncIOQueue =
  BG.unsafePerformIO hs_bindgen_f1f3445924531218

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_GetAsyncIOResult@
foreign import ccall unsafe "hs_bindgen_a377aedfcfda7243"
  hs_bindgen_a377aedfcfda7243_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_GetAsyncIOResult@
hs_bindgen_a377aedfcfda7243
  :: IO (BG.FunPtr (BG.Ptr SDL_AsyncIOQueue -> BG.Ptr SDL_AsyncIOOutcome -> IO BG.CBool))
hs_bindgen_a377aedfcfda7243 =
  BG.fromFFIType hs_bindgen_a377aedfcfda7243_base

{-# NOINLINE sDL_GetAsyncIOResult #-}

-- | Query an async I\/O task queue for completed tasks.
--
--     If a task assigned to this queue has finished, this will return true and fill in @outcome@ with the details of the task. If no task in the queue has finished, this function will return false. This function does not block.
--
--     If a task has completed, this function will free its resources and the task pointer will no longer be valid. The task will be removed from the queue.
--
--     It is safe for multiple threads to call this function on the same queue at once; a completed task will only go to one of the threads.
--
--     [@queue@]: the async I\/O task queue to query.
--
--     [@outcome@]: details of a finished task will be written here. May not be NULL.
--
--     [Returns]: true if a task has completed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WaitAsyncIOResult'
--
--     [C declaration]: @SDL_GetAsyncIOResult@, defined at @SDL3\/SDL_asyncio.h 440:34@
sDL_GetAsyncIOResult
  :: BG.FunPtr (BG.Ptr SDL_AsyncIOQueue -> BG.Ptr SDL_AsyncIOOutcome -> IO BG.CBool)
sDL_GetAsyncIOResult =
  BG.unsafePerformIO hs_bindgen_a377aedfcfda7243

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_WaitAsyncIOResult@
foreign import ccall unsafe "hs_bindgen_1b55fd087de307a9"
  hs_bindgen_1b55fd087de307a9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_WaitAsyncIOResult@
hs_bindgen_1b55fd087de307a9
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_AsyncIOQueue
             -> BG.Ptr SDL_AsyncIOOutcome
             -> SDL3.Sys.Bindgen.Stdinc.Sint32
             -> IO BG.CBool
           )
       )
hs_bindgen_1b55fd087de307a9 =
  BG.fromFFIType hs_bindgen_1b55fd087de307a9_base

{-# NOINLINE sDL_WaitAsyncIOResult #-}

-- | Block until an async I\/O task queue has a completed task.
--
--     This function puts the calling thread to sleep until there a task assigned to the queue that has finished.
--
--     If a task assigned to the queue has finished, this will return true and fill in @outcome@ with the details of the task. If no task in the queue has finished, this function will return false.
--
--     If a task has completed, this function will free its resources and the task pointer will no longer be valid. The task will be removed from the queue.
--
--     It is safe for multiple threads to call this function on the same queue at once; a completed task will only go to one of the threads.
--
--     Note that by the nature of various platforms, more than one waiting thread may wake to handle a single task, but only one will obtain it, so @timeoutMS@ is a /maximum/ wait time, and this function may return false sooner.
--
--     This function may return false if there was a system error, the OS inadvertently awoke multiple threads, or if @SDL_SignalAsyncIOQueue()@ was called to wake up all waiting threads without a finished task.
--
--     A timeout can be used to specify a maximum wait time, but rather than polling, it is possible to have a timeout of -1 to wait forever, and use @SDL_SignalAsyncIOQueue()@ to wake up the waiting threads later.
--
--     [@queue@]: the async I\/O task queue to wait on.
--
--     [@outcome@]: details of a finished task will be written here. May not be NULL.
--
--     [@timeoutMS@]: the maximum time to wait, in milliseconds, or -1 to wait indefinitely.
--
--     [Returns]: true if task has completed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SignalAsyncIOQueue'
--
--     [C declaration]: @SDL_WaitAsyncIOResult@, defined at @SDL3\/SDL_asyncio.h 484:34@
sDL_WaitAsyncIOResult
  :: BG.FunPtr
       ( BG.Ptr SDL_AsyncIOQueue
         -> BG.Ptr SDL_AsyncIOOutcome
         -> SDL3.Sys.Bindgen.Stdinc.Sint32
         -> IO BG.CBool
       )
sDL_WaitAsyncIOResult =
  BG.unsafePerformIO hs_bindgen_1b55fd087de307a9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_SignalAsyncIOQueue@
foreign import ccall unsafe "hs_bindgen_094baddfb7dfcf9e"
  hs_bindgen_094baddfb7dfcf9e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_SignalAsyncIOQueue@
hs_bindgen_094baddfb7dfcf9e :: IO (BG.FunPtr (BG.Ptr SDL_AsyncIOQueue -> IO ()))
hs_bindgen_094baddfb7dfcf9e =
  BG.fromFFIType hs_bindgen_094baddfb7dfcf9e_base

{-# NOINLINE sDL_SignalAsyncIOQueue #-}

-- | Wake up any threads that are blocking in @SDL_WaitAsyncIOResult()@.
--
--     This will unblock any threads that are sleeping in a call to SDL_WaitAsyncIOResult for the specified queue, and cause them to return from that function.
--
--     This can be useful when destroying a queue to make sure nothing is touching it indefinitely. In this case, once this call completes, the caller should take measures to make sure any previously-blocked threads have returned from their wait and will not touch the queue again (perhaps by setting a flag to tell the threads to terminate and then using SDL_WaitThread() to make sure they\'ve done so).
--
--     [@queue@]: the async I\/O task queue to signal.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WaitAsyncIOResult'
--
--     [C declaration]: @SDL_SignalAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 508:34@
sDL_SignalAsyncIOQueue :: BG.FunPtr (BG.Ptr SDL_AsyncIOQueue -> IO ())
sDL_SignalAsyncIOQueue =
  BG.unsafePerformIO hs_bindgen_094baddfb7dfcf9e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_LoadFileAsync@
foreign import ccall unsafe "hs_bindgen_f844da257a66f6c5"
  hs_bindgen_f844da257a66f6c5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_get_SDL_LoadFileAsync@
hs_bindgen_f844da257a66f6c5
  :: IO
       (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr SDL_AsyncIOQueue -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_f844da257a66f6c5 =
  BG.fromFFIType hs_bindgen_f844da257a66f6c5_base

{-# NOINLINE sDL_LoadFileAsync #-}

-- | Load all the data from a file path, asynchronously.
--
--     This function returns as quickly as possible; it does not wait for the read to complete. On a successful return, this work will continue in the background. If the work begins, even failure is asynchronous: a failing return value from this function only means the work couldn\'t start at all.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in 'SDL_AsyncIOOutcome' \'s bytes_transferred value.
--
--     This function will allocate the buffer to contain the file. It must be deallocated by calling SDL_free() on 'SDL_AsyncIOOutcome' \'s buffer field after completion.
--
--     An 'SDL_AsyncIOQueue' must be specified. The newly-created task will be added to it when it completes its work.
--
--     [@file@]: the path to read all available data from.
--
--     [@queue@]: a queue to add the new 'SDL_AsyncIO' to.
--
--     [@userdata@]: an app-defined pointer that will be provided with the task results.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_LoadFile_IO
--
--     [C declaration]: @SDL_LoadFileAsync@, defined at @SDL3\/SDL_asyncio.h 542:34@
sDL_LoadFileAsync
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr SDL_AsyncIOQueue -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_LoadFileAsync =
  BG.unsafePerformIO hs_bindgen_f844da257a66f6c5
