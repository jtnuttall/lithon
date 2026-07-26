-- | SDL offers a way to perform I\/O asynchronously. This allows an app to read or write files without waiting for data to actually transfer; the functions that request I\/O never block while the request is fulfilled.
--
--     Instead, the data moves in the background and the app can check for results at their leisure.
--
--     This is more complicated than just reading and writing files in a synchronous way, but it can allow for more efficiency, and never having framerate drops as the hard drive catches up, etc.
--
--     The general usage pattern for async I\/O is:
--
--     * Create one or more 'SDL_AsyncIOQueue' objects.
--
--     * Open files with 'asyncIOFromFile'.
--
--     * Start I\/O tasks to the files with 'readAsyncIO' or 'writeAsyncIO', putting those tasks into one of the queues.
--
--     * Later on, use 'getAsyncIOResult' on a queue to see if any task is finished without blocking. Tasks might finish in any order with success or failure.
--
--     * When all your tasks are done, close the file with 'closeAsyncIO'. This also generates a task, since it might flush data to disk!
--
--     This all works, without blocking, in a single thread, but one can also wait on a queue in a background thread, sleeping until new results have arrived:
--
--     * Call 'waitAsyncIOResult' from one or more threads to efficiently block until new tasks complete.
--
--     * When shutting down, call 'signalAsyncIOQueue' to unblock any sleeping threads despite there being no new tasks completed.
--
--     And, of course, to match the synchronous 'SDL3.Sys.Iostream.loadFile', we offer 'loadFileAsync' as a convenience function. This will handle allocating a buffer, slurping in the file data, and null-terminating it; you still check for results later.
--
--     Behind the scenes, SDL will use newer, efficient APIs on platforms that support them: Linux\'s io_uring and Windows 11\'s IoRing, for example. If those technologies aren\'t available, SDL will offload the work to a thread pool that will manage otherwise-synchronous loads without blocking the app.
--
--     Best Practices
--
--     Simple non-blocking I\/O for an app that just wants to pick up data whenever it\'s ready without losing framerate waiting on disks to spin can use whatever pattern works well for the program. In this case, simply call 'readAsyncIO', or maybe 'loadFileAsync', as needed. Once a frame, call 'getAsyncIOResult' to check for any completed tasks and deal with the data as it arrives.
--
--     If two separate pieces of the same program need their own I\/O, it is legal for each to create their own queue. This will prevent either piece from accidentally consuming the other\'s completed tasks. Each queue does require some amount of resources, but it is not an overwhelming cost. Do not make a queue for each task, however. It is better to put many tasks into a single queue. They will be reported in order of completion, not in the order they were submitted, so it doesn\'t generally matter what order tasks are started.
--
--     One async I\/O queue can be shared by multiple threads, or one thread can have more than one queue, but the most efficient way if ruthless efficiency is the goal is to have one queue per thread, with multiple threads working in parallel, and attempt to keep each queue loaded with tasks that are both started by and consumed by the same thread. On modern platforms that can use newer interfaces, this can keep data flowing as efficiently as possible all the way from storage hardware to the app, with no contention between threads for access to the same queue.
--
--     Written data is not guaranteed to make it to physical media by the time a closing task is completed, unless 'closeAsyncIO' is called with its @flush@ parameter set to true, which is to say that a successful result here can still result in lost data during an unfortunately-timed power outage if not flushed. However, flushing will take longer and may be unnecessary, depending on the app\'s needs. The asynchronous I\/O operation structure.
--
--     This operates as an opaque handle. One can then request read or write operations on it.
--
--     @since 3.2.0
--
--     [See also]: 'asyncIOFromFile'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Asyncio.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Asyncio (
  module SDL3.Sys.Bindgen.Asyncio,

  -- * Function aliases
  SDL3.Sys.Asyncio.asyncIOFromFile,
  SDL3.Sys.Asyncio.asyncIOFromFileSafe,
  SDL3.Sys.Asyncio.getAsyncIOSize,
  SDL3.Sys.Asyncio.getAsyncIOSizeSafe,
  SDL3.Sys.Asyncio.readAsyncIO,
  SDL3.Sys.Asyncio.readAsyncIOSafe,
  SDL3.Sys.Asyncio.writeAsyncIO,
  SDL3.Sys.Asyncio.writeAsyncIOSafe,
  SDL3.Sys.Asyncio.closeAsyncIO,
  SDL3.Sys.Asyncio.closeAsyncIOSafe,
  SDL3.Sys.Asyncio.createAsyncIOQueue,
  SDL3.Sys.Asyncio.createAsyncIOQueueSafe,
  SDL3.Sys.Asyncio.destroyAsyncIOQueue,
  SDL3.Sys.Asyncio.destroyAsyncIOQueueSafe,
  SDL3.Sys.Asyncio.getAsyncIOResult,
  SDL3.Sys.Asyncio.getAsyncIOResultSafe,
  SDL3.Sys.Asyncio.waitAsyncIOResult,
  SDL3.Sys.Asyncio.waitAsyncIOResultSafe,
  SDL3.Sys.Asyncio.signalAsyncIOQueue,
  SDL3.Sys.Asyncio.signalAsyncIOQueueSafe,
  SDL3.Sys.Asyncio.loadFileAsync,
  SDL3.Sys.Asyncio.loadFileAsyncSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Asyncio
import SDL3.Sys.Bindgen.Asyncio.Safe qualified as Safe
import SDL3.Sys.Bindgen.Asyncio.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified

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
--     [Returns]: a pointer to the 'SDL_AsyncIO' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeAsyncIO', 'readAsyncIO', 'writeAsyncIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AsyncIOFromFile@.
--                   The safe flavor is 'asyncIOFromFileSafe'
--                   .
--
--     [C declaration]: @SDL_AsyncIOFromFile@, defined at @SDL3\/SDL_asyncio.h 224:43@
asyncIOFromFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a UTF-8 string representing the filename to open.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mode@]: an ASCII string representing the mode to be used for opening the file.
  -> IO (BG.Ptr SDL_AsyncIO)
asyncIOFromFile = Unsafe.sDL_AsyncIOFromFile

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
--     [Returns]: a pointer to the 'SDL_AsyncIO' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeAsyncIO', 'readAsyncIO', 'writeAsyncIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AsyncIOFromFile@.
--                   The unsafe flavor is 'asyncIOFromFile'
--                   .
--
--     [C declaration]: @SDL_AsyncIOFromFile@, defined at @SDL3\/SDL_asyncio.h 224:43@
asyncIOFromFileSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a UTF-8 string representing the filename to open.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mode@]: an ASCII string representing the mode to be used for opening the file.
  -> IO (BG.Ptr SDL_AsyncIO)
asyncIOFromFileSafe = Safe.sDL_AsyncIOFromFile

-- | Use this function to get the size of the data stream in an 'SDL_AsyncIO'.
--
--     This call is /not/ asynchronous; it assumes that obtaining this info is a non-blocking operation in most reasonable cases.
--
--     [Returns]: the size of the data stream in the SDL_IOStream on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAsyncIOSize@.
--                   The safe flavor is 'getAsyncIOSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAsyncIOSize@, defined at @SDL3\/SDL_asyncio.h 241:36@
getAsyncIOSize
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: the 'SDL_AsyncIO' to get the size of the data stream from.
  -> IO BG.Int64
getAsyncIOSize =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetAsyncIOSize x00)

-- | Use this function to get the size of the data stream in an 'SDL_AsyncIO'.
--
--     This call is /not/ asynchronous; it assumes that obtaining this info is a non-blocking operation in most reasonable cases.
--
--     [Returns]: the size of the data stream in the SDL_IOStream on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAsyncIOSize@.
--                   The unsafe flavor is 'getAsyncIOSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAsyncIOSize@, defined at @SDL3\/SDL_asyncio.h 241:36@
getAsyncIOSizeSafe
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: the 'SDL_AsyncIO' to get the size of the data stream from.
  -> IO BG.Int64
getAsyncIOSizeSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetAsyncIOSize x00)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'writeAsyncIO', 'createAsyncIOQueue'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadAsyncIO@.
--                   The safe flavor is 'readAsyncIOSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadAsyncIO@, defined at @SDL3\/SDL_asyncio.h 279:34@
readAsyncIO
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer to read data into.
  -> BG.Word64
  -- ^
  --
  --           [@offset@]: the position to start reading in the data source.
  -> BG.Word64
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
  -> IO Bool
readAsyncIO =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Unsafe.sDL_ReadAsyncIO x00 x11 (Coerce.coerce x22) (Coerce.coerce x33) x44 x55)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'writeAsyncIO', 'createAsyncIOQueue'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadAsyncIO@.
--                   The unsafe flavor is 'readAsyncIO'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadAsyncIO@, defined at @SDL3\/SDL_asyncio.h 279:34@
readAsyncIOSafe
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer to read data into.
  -> BG.Word64
  -- ^
  --
  --           [@offset@]: the position to start reading in the data source.
  -> BG.Word64
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
  -> IO Bool
readAsyncIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Safe.sDL_ReadAsyncIO x00 x11 (Coerce.coerce x22) (Coerce.coerce x33) x44 x55)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'readAsyncIO', 'createAsyncIOQueue'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteAsyncIO@.
--                   The safe flavor is 'writeAsyncIOSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteAsyncIO@, defined at @SDL3\/SDL_asyncio.h 316:34@
writeAsyncIO
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer to write data from.
  -> BG.Word64
  -- ^
  --
  --           [@offset@]: the position to start writing to the data source.
  -> BG.Word64
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
  -> IO Bool
writeAsyncIO =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Unsafe.sDL_WriteAsyncIO x00 x11 (Coerce.coerce x22) (Coerce.coerce x33) x44 x55)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'readAsyncIO', 'createAsyncIOQueue'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteAsyncIO@.
--                   The unsafe flavor is 'writeAsyncIO'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteAsyncIO@, defined at @SDL3\/SDL_asyncio.h 316:34@
writeAsyncIOSafe
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer to write data from.
  -> BG.Word64
  -- ^
  --
  --           [@offset@]: the position to start writing to the data source.
  -> BG.Word64
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
  -> IO Bool
writeAsyncIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Safe.sDL_WriteAsyncIO x00 x11 (Coerce.coerce x22) (Coerce.coerce x33) x44 x55)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but two threads should not attempt to close the same object.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CloseAsyncIO@.
--                   The safe flavor is 'closeAsyncIOSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CloseAsyncIO@, defined at @SDL3\/SDL_asyncio.h 365:34@
closeAsyncIO
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure to close.
  -> Bool
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
  -> IO Bool
closeAsyncIO =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_CloseAsyncIO x00 (CBool.fromBool x11) x22 x33)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but two threads should not attempt to close the same object.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CloseAsyncIO@.
--                   The unsafe flavor is 'closeAsyncIO'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CloseAsyncIO@, defined at @SDL3\/SDL_asyncio.h 365:34@
closeAsyncIOSafe
  :: BG.Ptr SDL_AsyncIO
  -- ^
  --
  --           [@asyncio@]: a pointer to an 'SDL_AsyncIO' structure to close.
  -> Bool
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
  -> IO Bool
closeAsyncIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_CloseAsyncIO x00 (CBool.fromBool x11) x22 x33)

-- | Create a task queue for tracking multiple I\/O operations.
--
--     Async I\/O operations are assigned to a queue when started. The queue can be checked for completed tasks thereafter.
--
--     [Returns]: a new task queue object or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyAsyncIOQueue', 'getAsyncIOResult', 'waitAsyncIOResult'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateAsyncIOQueue@.
--                   The safe flavor is 'createAsyncIOQueueSafe'
--                   .
--
--     [C declaration]: @SDL_CreateAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 384:48@
createAsyncIOQueue :: IO (BG.Ptr SDL_AsyncIOQueue)
createAsyncIOQueue = Unsafe.sDL_CreateAsyncIOQueue

-- | Create a task queue for tracking multiple I\/O operations.
--
--     Async I\/O operations are assigned to a queue when started. The queue can be checked for completed tasks thereafter.
--
--     [Returns]: a new task queue object or NULL if there was an error; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyAsyncIOQueue', 'getAsyncIOResult', 'waitAsyncIOResult'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateAsyncIOQueue@.
--                   The unsafe flavor is 'createAsyncIOQueue'
--                   .
--
--     [C declaration]: @SDL_CreateAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 384:48@
createAsyncIOQueueSafe :: IO (BG.Ptr SDL_AsyncIOQueue)
createAsyncIOQueueSafe = Safe.sDL_CreateAsyncIOQueue

-- | Destroy a previously-created async I\/O task queue.
--
--     If there are still tasks pending for this queue, this call will block until those tasks are finished. All those tasks will be deallocated. Their results will be lost to the app.
--
--     Any pending reads from @'loadFileAsync'@ that are still in this queue will have their buffers deallocated by this function, to prevent a memory leak.
--
--     Once this function is called, the queue is no longer valid and should not be used, including by other threads that might access it while destruction is blocking on pending tasks.
--
--     Do not destroy a queue that still has threads waiting on it through @'waitAsyncIOResult'@. You can call @'signalAsyncIOQueue'@ first to unblock those threads, and take measures (such as SDL_WaitThread()) to make sure they have finished their wait and won\'t wait on the queue again.
--
--     [Thread safety]: It is safe to call this function from any thread, so long as no other thread is waiting on the queue with 'waitAsyncIOResult'.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyAsyncIOQueue@.
--                   The safe flavor is 'destroyAsyncIOQueueSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 414:34@
destroyAsyncIOQueue
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the task queue to destroy.
  -> IO ()
destroyAsyncIOQueue = Unsafe.sDL_DestroyAsyncIOQueue

-- | Destroy a previously-created async I\/O task queue.
--
--     If there are still tasks pending for this queue, this call will block until those tasks are finished. All those tasks will be deallocated. Their results will be lost to the app.
--
--     Any pending reads from @'loadFileAsync'@ that are still in this queue will have their buffers deallocated by this function, to prevent a memory leak.
--
--     Once this function is called, the queue is no longer valid and should not be used, including by other threads that might access it while destruction is blocking on pending tasks.
--
--     Do not destroy a queue that still has threads waiting on it through @'waitAsyncIOResult'@. You can call @'signalAsyncIOQueue'@ first to unblock those threads, and take measures (such as SDL_WaitThread()) to make sure they have finished their wait and won\'t wait on the queue again.
--
--     [Thread safety]: It is safe to call this function from any thread, so long as no other thread is waiting on the queue with 'waitAsyncIOResult'.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyAsyncIOQueue@.
--                   The unsafe flavor is 'destroyAsyncIOQueue'
--                   .
--
--     [C declaration]: @SDL_DestroyAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 414:34@
destroyAsyncIOQueueSafe
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the task queue to destroy.
  -> IO ()
destroyAsyncIOQueueSafe =
  Safe.sDL_DestroyAsyncIOQueue

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
--     [See also]: 'waitAsyncIOResult'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAsyncIOResult@.
--                   The safe flavor is 'getAsyncIOResultSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAsyncIOResult@, defined at @SDL3\/SDL_asyncio.h 440:34@
getAsyncIOResult
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the async I\/O task queue to query.
  -> BG.Ptr SDL_AsyncIOOutcome
  -- ^
  --
  --           [@outcome@]: details of a finished task will be written here. May not be NULL.
  -> IO Bool
getAsyncIOResult =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetAsyncIOResult x00 x11)

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
--     [See also]: 'waitAsyncIOResult'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAsyncIOResult@.
--                   The unsafe flavor is 'getAsyncIOResult'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAsyncIOResult@, defined at @SDL3\/SDL_asyncio.h 440:34@
getAsyncIOResultSafe
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the async I\/O task queue to query.
  -> BG.Ptr SDL_AsyncIOOutcome
  -- ^
  --
  --           [@outcome@]: details of a finished task will be written here. May not be NULL.
  -> IO Bool
getAsyncIOResultSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetAsyncIOResult x00 x11)

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
--     This function may return false if there was a system error, the OS inadvertently awoke multiple threads, or if @'signalAsyncIOQueue'@ was called to wake up all waiting threads without a finished task.
--
--     A timeout can be used to specify a maximum wait time, but rather than polling, it is possible to have a timeout of -1 to wait forever, and use @'signalAsyncIOQueue'@ to wake up the waiting threads later.
--
--     [Returns]: true if task has completed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'signalAsyncIOQueue'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitAsyncIOResult@.
--                   The safe flavor is 'waitAsyncIOResultSafe'
--                   : blocks until a result is ready (timeoutMS = -1 waits forever); an unsafe call stalls every capability and GC.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitAsyncIOResult@, defined at @SDL3\/SDL_asyncio.h 484:34@
waitAsyncIOResult
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the async I\/O task queue to wait on.
  -> BG.Ptr SDL_AsyncIOOutcome
  -- ^
  --
  --           [@outcome@]: details of a finished task will be written here. May not be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@timeoutMS@]: the maximum time to wait, in milliseconds, or -1 to wait indefinitely.
  -> IO Bool
waitAsyncIOResult =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_WaitAsyncIOResult x00 x11 (Coerce.coerce x22))

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
--     This function may return false if there was a system error, the OS inadvertently awoke multiple threads, or if @'signalAsyncIOQueue'@ was called to wake up all waiting threads without a finished task.
--
--     A timeout can be used to specify a maximum wait time, but rather than polling, it is possible to have a timeout of -1 to wait forever, and use @'signalAsyncIOQueue'@ to wake up the waiting threads later.
--
--     [Returns]: true if task has completed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'signalAsyncIOQueue'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitAsyncIOResult@.
--                   The unsafe flavor is 'waitAsyncIOResult'
--                   : blocks until a result is ready (timeoutMS = -1 waits forever); an unsafe call stalls every capability and GC.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitAsyncIOResult@, defined at @SDL3\/SDL_asyncio.h 484:34@
waitAsyncIOResultSafe
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the async I\/O task queue to wait on.
  -> BG.Ptr SDL_AsyncIOOutcome
  -- ^
  --
  --           [@outcome@]: details of a finished task will be written here. May not be NULL.
  -> BG.Int32
  -- ^
  --
  --           [@timeoutMS@]: the maximum time to wait, in milliseconds, or -1 to wait indefinitely.
  -> IO Bool
waitAsyncIOResultSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_WaitAsyncIOResult x00 x11 (Coerce.coerce x22))

-- | Wake up any threads that are blocking in @'waitAsyncIOResult'@.
--
--     This will unblock any threads that are sleeping in a call to 'waitAsyncIOResult' for the specified queue, and cause them to return from that function.
--
--     This can be useful when destroying a queue to make sure nothing is touching it indefinitely. In this case, once this call completes, the caller should take measures to make sure any previously-blocked threads have returned from their wait and will not touch the queue again (perhaps by setting a flag to tell the threads to terminate and then using 'SDL3.Sys.Thread.waitThread' to make sure they\'ve done so).
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'waitAsyncIOResult'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SignalAsyncIOQueue@.
--                   The safe flavor is 'signalAsyncIOQueueSafe'
--                   .
--
--     [C declaration]: @SDL_SignalAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 508:34@
signalAsyncIOQueue
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the async I\/O task queue to signal.
  -> IO ()
signalAsyncIOQueue = Unsafe.sDL_SignalAsyncIOQueue

-- | Wake up any threads that are blocking in @'waitAsyncIOResult'@.
--
--     This will unblock any threads that are sleeping in a call to 'waitAsyncIOResult' for the specified queue, and cause them to return from that function.
--
--     This can be useful when destroying a queue to make sure nothing is touching it indefinitely. In this case, once this call completes, the caller should take measures to make sure any previously-blocked threads have returned from their wait and will not touch the queue again (perhaps by setting a flag to tell the threads to terminate and then using 'SDL3.Sys.Thread.waitThread' to make sure they\'ve done so).
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'waitAsyncIOResult'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SignalAsyncIOQueue@.
--                   The unsafe flavor is 'signalAsyncIOQueue'
--                   .
--
--     [C declaration]: @SDL_SignalAsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 508:34@
signalAsyncIOQueueSafe
  :: BG.Ptr SDL_AsyncIOQueue
  -- ^
  --
  --           [@queue@]: the async I\/O task queue to signal.
  -> IO ()
signalAsyncIOQueueSafe = Safe.sDL_SignalAsyncIOQueue

-- | Load all the data from a file path, asynchronously.
--
--     This function returns as quickly as possible; it does not wait for the read to complete. On a successful return, this work will continue in the background. If the work begins, even failure is asynchronous: a failing return value from this function only means the work couldn\'t start at all.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in 'SDL_AsyncIOOutcome' \'s bytes_transferred value.
--
--     This function will allocate the buffer to contain the file. It must be deallocated by calling 'SDL3.Sys.Stdinc.free' on 'SDL_AsyncIOOutcome' \'s buffer field after completion.
--
--     An 'SDL_AsyncIOQueue' must be specified. The newly-created task will be added to it when it completes its work.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Iostream.loadFileIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadFileAsync@.
--                   The safe flavor is 'loadFileAsyncSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadFileAsync@, defined at @SDL3\/SDL_asyncio.h 542:34@
loadFileAsync
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
  -> IO Bool
loadFileAsync =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_LoadFileAsync x00 x11 x22)

-- | Load all the data from a file path, asynchronously.
--
--     This function returns as quickly as possible; it does not wait for the read to complete. On a successful return, this work will continue in the background. If the work begins, even failure is asynchronous: a failing return value from this function only means the work couldn\'t start at all.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in 'SDL_AsyncIOOutcome' \'s bytes_transferred value.
--
--     This function will allocate the buffer to contain the file. It must be deallocated by calling 'SDL3.Sys.Stdinc.free' on 'SDL_AsyncIOOutcome' \'s buffer field after completion.
--
--     An 'SDL_AsyncIOQueue' must be specified. The newly-created task will be added to it when it completes its work.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Iostream.loadFileIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadFileAsync@.
--                   The unsafe flavor is 'loadFileAsync'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadFileAsync@, defined at @SDL3\/SDL_asyncio.h 542:34@
loadFileAsyncSafe
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
  -> IO Bool
loadFileAsyncSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_LoadFileAsync x00 x11 x22)
