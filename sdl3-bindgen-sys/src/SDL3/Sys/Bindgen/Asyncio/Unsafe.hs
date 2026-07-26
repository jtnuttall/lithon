{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Asyncio.Unsafe (
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_AsyncIOFromFile,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_GetAsyncIOSize,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_ReadAsyncIO,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_WriteAsyncIO,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_CloseAsyncIO,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_CreateAsyncIOQueue,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_DestroyAsyncIOQueue,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_GetAsyncIOResult,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_WaitAsyncIOResult,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_SignalAsyncIOQueue,
  SDL3.Sys.Bindgen.Asyncio.Unsafe.sDL_LoadFileAsync,
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
         , "SDL_AsyncIO *hs_bindgen_b82f292b6e7c7687 ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_AsyncIOFromFile)(arg1, arg2);"
         , "}"
         , "Sint64 hs_bindgen_11b3160b0d9e0815 ("
         , "  SDL_AsyncIO *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAsyncIOSize)(arg1);"
         , "}"
         , "_Bool hs_bindgen_a7608bfc5c5b7642 ("
         , "  SDL_AsyncIO *arg1,"
         , "  void *arg2,"
         , "  Uint64 arg3,"
         , "  Uint64 arg4,"
         , "  SDL_AsyncIOQueue *arg5,"
         , "  void *arg6"
         , ")"
         , "{"
         , "  return (SDL_ReadAsyncIO)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "_Bool hs_bindgen_bb28a3e2adf0fdc9 ("
         , "  SDL_AsyncIO *arg1,"
         , "  void *arg2,"
         , "  Uint64 arg3,"
         , "  Uint64 arg4,"
         , "  SDL_AsyncIOQueue *arg5,"
         , "  void *arg6"
         , ")"
         , "{"
         , "  return (SDL_WriteAsyncIO)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "_Bool hs_bindgen_59b28e6203185e0c ("
         , "  SDL_AsyncIO *arg1,"
         , "  _Bool arg2,"
         , "  SDL_AsyncIOQueue *arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return (SDL_CloseAsyncIO)(arg1, arg2, arg3, arg4);"
         , "}"
         , "SDL_AsyncIOQueue *hs_bindgen_0b66ff14f8c0ce55 (void)"
         , "{"
         , "  return (SDL_CreateAsyncIOQueue)();"
         , "}"
         , "void hs_bindgen_2ac8fde123b3e134 ("
         , "  SDL_AsyncIOQueue *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyAsyncIOQueue)(arg1);"
         , "}"
         , "_Bool hs_bindgen_a47b3011385bfa90 ("
         , "  SDL_AsyncIOQueue *arg1,"
         , "  SDL_AsyncIOOutcome *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetAsyncIOResult)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_c57196121c6d7557 ("
         , "  SDL_AsyncIOQueue *arg1,"
         , "  SDL_AsyncIOOutcome *arg2,"
         , "  Sint32 arg3"
         , ")"
         , "{"
         , "  return (SDL_WaitAsyncIOResult)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_f68ee0d177862e72 ("
         , "  SDL_AsyncIOQueue *arg1"
         , ")"
         , "{"
         , "  (SDL_SignalAsyncIOQueue)(arg1);"
         , "}"
         , "_Bool hs_bindgen_c0a4fd9b015deb20 ("
         , "  char const *arg1,"
         , "  SDL_AsyncIOQueue *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_LoadFileAsync)(arg1, arg2, arg3);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_AsyncIOFromFile@
foreign import ccall unsafe "hs_bindgen_b82f292b6e7c7687"
  hs_bindgen_b82f292b6e7c7687_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_AsyncIOFromFile@
hs_bindgen_b82f292b6e7c7687
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_AsyncIO)
hs_bindgen_b82f292b6e7c7687 =
  BG.fromFFIType hs_bindgen_b82f292b6e7c7687_base

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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a UTF-8 string representing the filename to open.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mode@]: an ASCII string representing the mode to be used for opening the file.
  -> IO (BG.Ptr SDL_AsyncIO)
sDL_AsyncIOFromFile = hs_bindgen_b82f292b6e7c7687

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_GetAsyncIOSize@
foreign import ccall unsafe "hs_bindgen_11b3160b0d9e0815"
  hs_bindgen_11b3160b0d9e0815_base
    :: BG.Ptr BG.Void
    -> IO BG.Int64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_GetAsyncIOSize@
hs_bindgen_11b3160b0d9e0815
  :: BG.Ptr SDL_AsyncIO
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
hs_bindgen_11b3160b0d9e0815 =
  BG.fromFFIType hs_bindgen_11b3160b0d9e0815_base

-- | Use this function to get the size of the data stream in an 'SDL_AsyncIO'.
--
--     This call is /not/ asynchronous; it assumes that obtaining this info is a non-blocking operation in most reasonable cases.
--
--     [Returns]: the size of the data stream in the SDL_IOStream on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetAsyncIOSize@, defined at @SDL3\/SDL_asyncio.h 241:36@
sDL_GetAsyncIOSize
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: the 'SDL_AsyncIO' to get the size of the data stream from.
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
sDL_GetAsyncIOSize = hs_bindgen_11b3160b0d9e0815

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_ReadAsyncIO@
foreign import ccall unsafe "hs_bindgen_a7608bfc5c5b7642"
  hs_bindgen_a7608bfc5c5b7642_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Word64
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_ReadAsyncIO@
hs_bindgen_a7608bfc5c5b7642
  :: BG.Ptr SDL_AsyncIO
  -> BG.Ptr BG.Void
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -> BG.Ptr SDL_AsyncIOQueue
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_a7608bfc5c5b7642 =
  BG.fromFFIType hs_bindgen_a7608bfc5c5b7642_base

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
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer to read data into.
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@offset@]: the position to start reading in the data source.
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@size@]: the number of bytes to read from the data source.
  -> BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: a queue to add the new 'SDL_AsyncIO' to.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an app-defined pointer that will be provided with the task results.
  -> IO BG.CBool
sDL_ReadAsyncIO = hs_bindgen_a7608bfc5c5b7642

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_WriteAsyncIO@
foreign import ccall unsafe "hs_bindgen_bb28a3e2adf0fdc9"
  hs_bindgen_bb28a3e2adf0fdc9_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Word64
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_WriteAsyncIO@
hs_bindgen_bb28a3e2adf0fdc9
  :: BG.Ptr SDL_AsyncIO
  -> BG.Ptr BG.Void
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -> BG.Ptr SDL_AsyncIOQueue
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_bb28a3e2adf0fdc9 =
  BG.fromFFIType hs_bindgen_bb28a3e2adf0fdc9_base

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
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer to write data from.
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@offset@]: the position to start writing to the data source.
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@size@]: the number of bytes to write to the data source.
  -> BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: a queue to add the new 'SDL_AsyncIO' to.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an app-defined pointer that will be provided with the task results.
  -> IO BG.CBool
sDL_WriteAsyncIO = hs_bindgen_bb28a3e2adf0fdc9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_CloseAsyncIO@
foreign import ccall unsafe "hs_bindgen_59b28e6203185e0c"
  hs_bindgen_59b28e6203185e0c_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_CloseAsyncIO@
hs_bindgen_59b28e6203185e0c
  :: BG.Ptr SDL_AsyncIO
  -> BG.CBool
  -> BG.Ptr SDL_AsyncIOQueue
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_59b28e6203185e0c =
  BG.fromFFIType hs_bindgen_59b28e6203185e0c_base

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
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but two threads should not attempt to close the same object.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CloseAsyncIO@, defined at @SDL3\/SDL_asyncio.h 365:34@
sDL_CloseAsyncIO
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure to close.
  -> BG.CBool
  -- ^
  --
  --           [@flush@]: true if data should sync to disk before the task completes.
  -> BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: a queue to add the new 'SDL_AsyncIO' to.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an app-defined pointer that will be provided with the task results.
  -> IO BG.CBool
sDL_CloseAsyncIO = hs_bindgen_59b28e6203185e0c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_CreateAsyncIOQueue@
foreign import ccall unsafe "hs_bindgen_0b66ff14f8c0ce55"
  hs_bindgen_0b66ff14f8c0ce55_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_CreateAsyncIOQueue@
hs_bindgen_0b66ff14f8c0ce55 :: IO (BG.Ptr SDL_AsyncIOQueue)
hs_bindgen_0b66ff14f8c0ce55 =
  BG.fromFFIType hs_bindgen_0b66ff14f8c0ce55_base

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
sDL_CreateAsyncIOQueue :: IO (BG.Ptr SDL_AsyncIOQueue)
sDL_CreateAsyncIOQueue = hs_bindgen_0b66ff14f8c0ce55

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_DestroyAsyncIOQueue@
foreign import ccall unsafe "hs_bindgen_2ac8fde123b3e134"
  hs_bindgen_2ac8fde123b3e134_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_DestroyAsyncIOQueue@
hs_bindgen_2ac8fde123b3e134
  :: BG.Ptr SDL_AsyncIOQueue
  -> IO ()
hs_bindgen_2ac8fde123b3e134 =
  BG.fromFFIType hs_bindgen_2ac8fde123b3e134_base

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
--     [Thread safety]: It is safe to call this function from any thread, so long as no other thread is waiting on the queue with SDL_WaitAsyncIOResult.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_DestroyAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 414:34@
sDL_DestroyAsyncIOQueue
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the task queue to destroy.
  -> IO ()
sDL_DestroyAsyncIOQueue = hs_bindgen_2ac8fde123b3e134

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_GetAsyncIOResult@
foreign import ccall unsafe "hs_bindgen_a47b3011385bfa90"
  hs_bindgen_a47b3011385bfa90_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_GetAsyncIOResult@
hs_bindgen_a47b3011385bfa90
  :: BG.Ptr SDL_AsyncIOQueue
  -> BG.Ptr SDL_AsyncIOOutcome
  -> IO BG.CBool
hs_bindgen_a47b3011385bfa90 =
  BG.fromFFIType hs_bindgen_a47b3011385bfa90_base

-- | Query an async I\/O task queue for completed tasks.
--
--     If a task assigned to this queue has finished, this will return true and fill in @outcome@ with the details of the task. If no task in the queue has finished, this function will return false. This function does not block.
--
--     If a task has completed, this function will free its resources and the task pointer will no longer be valid. The task will be removed from the queue.
--
--     It is safe for multiple threads to call this function on the same queue at once; a completed task will only go to one of the threads.
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
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the async I\/O task queue to query.
  -> BG.Ptr SDL_AsyncIOOutcome
  -- ^
  --
  --           [@outcome@]: details of a finished task will be written here. May not be NULL.
  -> IO BG.CBool
sDL_GetAsyncIOResult = hs_bindgen_a47b3011385bfa90

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_WaitAsyncIOResult@
foreign import ccall unsafe "hs_bindgen_c57196121c6d7557"
  hs_bindgen_c57196121c6d7557_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_WaitAsyncIOResult@
hs_bindgen_c57196121c6d7557
  :: BG.Ptr SDL_AsyncIOQueue
  -> BG.Ptr SDL_AsyncIOOutcome
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -> IO BG.CBool
hs_bindgen_c57196121c6d7557 =
  BG.fromFFIType hs_bindgen_c57196121c6d7557_base

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
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the async I\/O task queue to wait on.
  -> BG.Ptr SDL_AsyncIOOutcome
  -- ^
  --
  --           [@outcome@]: details of a finished task will be written here. May not be NULL.
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@timeoutMS@]: the maximum time to wait, in milliseconds, or -1 to wait indefinitely.
  -> IO BG.CBool
sDL_WaitAsyncIOResult = hs_bindgen_c57196121c6d7557

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_SignalAsyncIOQueue@
foreign import ccall unsafe "hs_bindgen_f68ee0d177862e72"
  hs_bindgen_f68ee0d177862e72_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_SignalAsyncIOQueue@
hs_bindgen_f68ee0d177862e72
  :: BG.Ptr SDL_AsyncIOQueue
  -> IO ()
hs_bindgen_f68ee0d177862e72 =
  BG.fromFFIType hs_bindgen_f68ee0d177862e72_base

-- | Wake up any threads that are blocking in @SDL_WaitAsyncIOResult()@.
--
--     This will unblock any threads that are sleeping in a call to SDL_WaitAsyncIOResult for the specified queue, and cause them to return from that function.
--
--     This can be useful when destroying a queue to make sure nothing is touching it indefinitely. In this case, once this call completes, the caller should take measures to make sure any previously-blocked threads have returned from their wait and will not touch the queue again (perhaps by setting a flag to tell the threads to terminate and then using SDL_WaitThread() to make sure they\'ve done so).
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WaitAsyncIOResult'
--
--     [C declaration]: @SDL_SignalAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 508:34@
sDL_SignalAsyncIOQueue
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the async I\/O task queue to signal.
  -> IO ()
sDL_SignalAsyncIOQueue = hs_bindgen_f68ee0d177862e72

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_LoadFileAsync@
foreign import ccall unsafe "hs_bindgen_c0a4fd9b015deb20"
  hs_bindgen_c0a4fd9b015deb20_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Asyncio_Unsafe_SDL_LoadFileAsync@
hs_bindgen_c0a4fd9b015deb20
  :: PtrConst.PtrConst BG.CChar
  -> BG.Ptr SDL_AsyncIOQueue
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_c0a4fd9b015deb20 =
  BG.fromFFIType hs_bindgen_c0a4fd9b015deb20_base

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
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the path to read all available data from.
  -> BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: a queue to add the new 'SDL_AsyncIO' to.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an app-defined pointer that will be provided with the task results.
  -> IO BG.CBool
sDL_LoadFileAsync = hs_bindgen_c0a4fd9b015deb20
