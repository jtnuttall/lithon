{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Process.FunPtr (
  SDL3.Sys.Bindgen.Process.FunPtr.sDL_CreateProcess,
  SDL3.Sys.Bindgen.Process.FunPtr.sDL_CreateProcessWithProperties,
  SDL3.Sys.Bindgen.Process.FunPtr.sDL_GetProcessProperties,
  SDL3.Sys.Bindgen.Process.FunPtr.sDL_ReadProcess,
  SDL3.Sys.Bindgen.Process.FunPtr.sDL_GetProcessInput,
  SDL3.Sys.Bindgen.Process.FunPtr.sDL_GetProcessOutput,
  SDL3.Sys.Bindgen.Process.FunPtr.sDL_KillProcess,
  SDL3.Sys.Bindgen.Process.FunPtr.sDL_WaitProcess,
  SDL3.Sys.Bindgen.Process.FunPtr.sDL_DestroyProcess,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Iostream qualified
import SDL3.Sys.Bindgen.Process
import SDL3.Sys.Bindgen.Properties qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_process.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_CreateProcess */"
         , "__attribute__ ((const))"
         , "SDL_Process *(*hs_bindgen_da17b0b856594376 (void)) ("
         , "  char const *const *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateProcess;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_CreateProcessWithProperties */"
         , "__attribute__ ((const))"
         , "SDL_Process *(*hs_bindgen_ca2af0d478f65779 (void)) ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateProcessWithProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_GetProcessProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_122575617d2f970a (void)) ("
         , "  SDL_Process *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetProcessProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_ReadProcess */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_366550f8901941a0 (void)) ("
         , "  SDL_Process *arg1,"
         , "  size_t *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_ReadProcess;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_GetProcessInput */"
         , "__attribute__ ((const))"
         , "SDL_IOStream *(*hs_bindgen_6503613b26c58999 (void)) ("
         , "  SDL_Process *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetProcessInput;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_GetProcessOutput */"
         , "__attribute__ ((const))"
         , "SDL_IOStream *(*hs_bindgen_d9e2688fce87583b (void)) ("
         , "  SDL_Process *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetProcessOutput;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_KillProcess */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_66935b63f947a265 (void)) ("
         , "  SDL_Process *arg1,"
         , "  _Bool arg2"
         , ")"
         , "{"
         , "  return &SDL_KillProcess;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_WaitProcess */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7ea62b336c3f5c4c (void)) ("
         , "  SDL_Process *arg1,"
         , "  _Bool arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_WaitProcess;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_DestroyProcess */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_c5cffc00b0da9028 (void)) ("
         , "  SDL_Process *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyProcess;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_CreateProcess@
foreign import ccall unsafe "hs_bindgen_da17b0b856594376"
  hs_bindgen_da17b0b856594376_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_CreateProcess@
hs_bindgen_da17b0b856594376
  :: IO
       (BG.FunPtr (PtrConst.PtrConst (PtrConst.PtrConst BG.CChar) -> BG.CBool -> IO (BG.Ptr SDL_Process)))
hs_bindgen_da17b0b856594376 =
  BG.fromFFIType hs_bindgen_da17b0b856594376_base

{-# NOINLINE sDL_CreateProcess #-}

-- | Create a new process.
--
--     The path to the executable is supplied in args[0]. args[1..N] are additional arguments passed on the command line of the new process, and the argument list should be terminated with a NULL, e.g.:
--
--     @
--     const char *args[] = { \"myprogram\", \"argument\", NULL };
--     @
--
--     Setting pipe_stdio to true is equivalent to setting @'sDL_PROP_PROCESS_CREATE_STDIN_NUMBER'@ and @'sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER'@ to @SDL_PROCESS_STDIO_APP@, and will allow the use of @SDL_ReadProcess()@ or @SDL_GetProcessInput()@ and @SDL_GetProcessOutput()@.
--
--     See @SDL_CreateProcessWithProperties()@ for more details.
--
--     [@args@]: the path and arguments for the new process.
--
--     [@pipe_stdio@]: true to create pipes to the process\'s standard input and from the process\'s standard output, false for the process to have no input and inherit the application\'s standard output.
--
--     [Returns]: the newly created and running process, or NULL if the process couldn\'t be created.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcessWithProperties', 'sDL_GetProcessProperties', 'sDL_ReadProcess', 'sDL_GetProcessInput', 'sDL_GetProcessOutput', 'sDL_KillProcess', 'sDL_WaitProcess', 'sDL_DestroyProcess'
--
--     [C declaration]: @SDL_CreateProcess@, defined at @SDL3\/SDL_process.h 106:43@
sDL_CreateProcess
  :: BG.FunPtr (PtrConst.PtrConst (PtrConst.PtrConst BG.CChar) -> BG.CBool -> IO (BG.Ptr SDL_Process))
sDL_CreateProcess =
  BG.unsafePerformIO hs_bindgen_da17b0b856594376

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_CreateProcessWithProperties@
foreign import ccall unsafe "hs_bindgen_ca2af0d478f65779"
  hs_bindgen_ca2af0d478f65779_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_CreateProcessWithProperties@
hs_bindgen_ca2af0d478f65779
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_Process)))
hs_bindgen_ca2af0d478f65779 =
  BG.fromFFIType hs_bindgen_ca2af0d478f65779_base

{-# NOINLINE sDL_CreateProcessWithProperties #-}

-- | Create a new process with the specified properties.
--
--     These are the supported properties:
--
--     * @'sDL_PROP_PROCESS_CREATE_ARGS_POINTER'@: an array of strings containing the program to run, any arguments, and a NULL pointer, e.g. const char *args[] = { \"myprogram\", \"argument\", NULL }. This is a required property.
--
--     * @'sDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER'@: an SDL_Environment pointer. If this property is set, it will be the entire environment for the process, otherwise the current environment is used.
--
--     * @'sDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING'@: a UTF-8 encoded string representing the working directory for the process, defaults to the current working directory.
--
--     * @'sDL_PROP_PROCESS_CREATE_STDIN_NUMBER'@: an 'SDL_ProcessIO' value describing where standard input for the process comes from, defaults to @SDL_PROCESS_STDIO_NULL@.
--
--     * @'sDL_PROP_PROCESS_CREATE_STDIN_POINTER'@: an SDL_IOStream pointer used for standard input when @'sDL_PROP_PROCESS_CREATE_STDIN_NUMBER'@ is set to @SDL_PROCESS_STDIO_REDIRECT@.
--
--     * @'sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER'@: an 'SDL_ProcessIO' value describing where standard output for the process goes to, defaults to @SDL_PROCESS_STDIO_INHERITED@.
--
--     * @'sDL_PROP_PROCESS_CREATE_STDOUT_POINTER'@: an SDL_IOStream pointer used for standard output when @'sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER'@ is set to @SDL_PROCESS_STDIO_REDIRECT@.
--
--     * @'sDL_PROP_PROCESS_CREATE_STDERR_NUMBER'@: an 'SDL_ProcessIO' value describing where standard error for the process goes to, defaults to @SDL_PROCESS_STDIO_INHERITED@.
--
--     * @'sDL_PROP_PROCESS_CREATE_STDERR_POINTER'@: an SDL_IOStream pointer used for standard error when @'sDL_PROP_PROCESS_CREATE_STDERR_NUMBER'@ is set to @SDL_PROCESS_STDIO_REDIRECT@.
--
--     * @'sDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN'@: true if the error output of the process should be redirected into the standard output of the process. This property has no effect if @'sDL_PROP_PROCESS_CREATE_STDERR_NUMBER'@ is set.
--
--     * @'sDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN'@: true if the process should run in the background. In this case the default input and output is @SDL_PROCESS_STDIO_NULL@ and the exitcode of the process is not available, and will always be 0.
--
--     * @'sDL_PROP_PROCESS_CREATE_CMDLINE_STRING'@: a string containing the program to run and any parameters. This string is passed directly to @CreateProcess@ on Windows, and does nothing on other platforms. This property is only important if you want to start programs that does non-standard command-line processing, and in most cases using @'sDL_PROP_PROCESS_CREATE_ARGS_POINTER'@ is sufficient.
--
--     On POSIX platforms, wait() and waitpid(-1, ...) should not be called, and SIGCHLD should not be ignored or handled because those would prevent SDL from properly tracking the lifetime of the underlying process. You should use @SDL_WaitProcess()@ instead.
--
--     [@props@]: the properties to use.
--
--     [Returns]: the newly created and running process, or NULL if the process couldn\'t be created.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcess', 'sDL_GetProcessProperties', 'sDL_ReadProcess', 'sDL_GetProcessInput', 'sDL_GetProcessOutput', 'sDL_KillProcess', 'sDL_WaitProcess', 'sDL_DestroyProcess'
--
--     [C declaration]: @SDL_CreateProcessWithProperties@, defined at @SDL3\/SDL_process.h 227:43@
sDL_CreateProcessWithProperties
  :: BG.FunPtr (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL_Process))
sDL_CreateProcessWithProperties =
  BG.unsafePerformIO hs_bindgen_ca2af0d478f65779

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_GetProcessProperties@
foreign import ccall unsafe "hs_bindgen_122575617d2f970a"
  hs_bindgen_122575617d2f970a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_GetProcessProperties@
hs_bindgen_122575617d2f970a
  :: IO (BG.FunPtr (BG.Ptr SDL_Process -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_122575617d2f970a =
  BG.fromFFIType hs_bindgen_122575617d2f970a_base

{-# NOINLINE sDL_GetProcessProperties #-}

-- | Get the properties associated with a process.
--
--     The following read-only properties are provided by SDL:
--
--     * @'sDL_PROP_PROCESS_PID_NUMBER'@: the process ID of the process.
--
--     * @'sDL_PROP_PROCESS_STDIN_POINTER'@: an SDL_IOStream that can be used to write input to the process, if it was created with @'sDL_PROP_PROCESS_CREATE_STDIN_NUMBER'@ set to @SDL_PROCESS_STDIO_APP@.
--
--     * @'sDL_PROP_PROCESS_STDOUT_POINTER'@: a non-blocking SDL_IOStream that can be used to read output from the process, if it was created with @'sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER'@ set to @SDL_PROCESS_STDIO_APP@.
--
--     * @'sDL_PROP_PROCESS_STDERR_POINTER'@: a non-blocking SDL_IOStream that can be used to read error output from the process, if it was created with @'sDL_PROP_PROCESS_CREATE_STDERR_NUMBER'@ set to @SDL_PROCESS_STDIO_APP@.
--
--     * @'sDL_PROP_PROCESS_BACKGROUND_BOOLEAN'@: true if the process is running in the background.
--
--     [@process@]: the process to query.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcess', 'sDL_CreateProcessWithProperties'
--
--     [C declaration]: @SDL_GetProcessProperties@, defined at @SDL3\/SDL_process.h 271:46@
sDL_GetProcessProperties
  :: BG.FunPtr (BG.Ptr SDL_Process -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetProcessProperties =
  BG.unsafePerformIO hs_bindgen_122575617d2f970a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_ReadProcess@
foreign import ccall unsafe "hs_bindgen_366550f8901941a0"
  hs_bindgen_366550f8901941a0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_ReadProcess@
hs_bindgen_366550f8901941a0
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Process -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> BG.Ptr BG.CInt -> IO (BG.Ptr BG.Void))
       )
hs_bindgen_366550f8901941a0 =
  BG.fromFFIType hs_bindgen_366550f8901941a0_base

{-# NOINLINE sDL_ReadProcess #-}

-- | Read all the output from a process.
--
--     If a process was created with I\/O enabled, you can use this function to read the output. This function blocks until the process is complete, capturing all output, and providing the process exit code.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with SDL_free().
--
--     [@process@]: The process to read.
--
--     [@datasize@]: a pointer filled in with the number of bytes read, may be NULL.
--
--     [@exitcode@]: a pointer filled in with the process exit code if the process has exited, may be NULL.
--
--     [Returns]: the data or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcess', 'sDL_CreateProcessWithProperties', 'sDL_DestroyProcess'
--
--     [C declaration]: @SDL_ReadProcess@, defined at @SDL3\/SDL_process.h 308:36@
sDL_ReadProcess
  :: BG.FunPtr
       (BG.Ptr SDL_Process -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> BG.Ptr BG.CInt -> IO (BG.Ptr BG.Void))
sDL_ReadProcess =
  BG.unsafePerformIO hs_bindgen_366550f8901941a0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_GetProcessInput@
foreign import ccall unsafe "hs_bindgen_6503613b26c58999"
  hs_bindgen_6503613b26c58999_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_GetProcessInput@
hs_bindgen_6503613b26c58999
  :: IO (BG.FunPtr (BG.Ptr SDL_Process -> IO (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream)))
hs_bindgen_6503613b26c58999 =
  BG.fromFFIType hs_bindgen_6503613b26c58999_base

{-# NOINLINE sDL_GetProcessInput #-}

-- | Get the SDL_IOStream associated with process standard input.
--
--     The process must have been created with @SDL_CreateProcess()@ and pipe_stdio set to true, or with @SDL_CreateProcessWithProperties()@ and @'sDL_PROP_PROCESS_CREATE_STDIN_NUMBER'@ set to @SDL_PROCESS_STDIO_APP@.
--
--     Writing to this stream can return less data than expected if the process hasn\'t read its input. It may be blocked waiting for its output to be read, if so you may need to call @SDL_GetProcessOutput()@ and read the output in parallel with writing input.
--
--     [@process@]: The process to get the input stream for.
--
--     [Returns]: the input stream or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcess', 'sDL_CreateProcessWithProperties', 'sDL_GetProcessOutput'
--
--     [C declaration]: @SDL_GetProcessInput@, defined at @SDL3\/SDL_process.h 334:44@
sDL_GetProcessInput
  :: BG.FunPtr (BG.Ptr SDL_Process -> IO (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream))
sDL_GetProcessInput =
  BG.unsafePerformIO hs_bindgen_6503613b26c58999

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_GetProcessOutput@
foreign import ccall unsafe "hs_bindgen_d9e2688fce87583b"
  hs_bindgen_d9e2688fce87583b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_GetProcessOutput@
hs_bindgen_d9e2688fce87583b
  :: IO (BG.FunPtr (BG.Ptr SDL_Process -> IO (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream)))
hs_bindgen_d9e2688fce87583b =
  BG.fromFFIType hs_bindgen_d9e2688fce87583b_base

{-# NOINLINE sDL_GetProcessOutput #-}

-- | Get the SDL_IOStream associated with process standard output.
--
--     The process must have been created with @SDL_CreateProcess()@ and pipe_stdio set to true, or with @SDL_CreateProcessWithProperties()@ and @'sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER'@ set to @SDL_PROCESS_STDIO_APP@.
--
--     Reading from this stream can return 0 with SDL_GetIOStatus() returning SDL_IO_STATUS_NOT_READY if no output is available yet.
--
--     [@process@]: The process to get the output stream for.
--
--     [Returns]: the output stream or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcess', 'sDL_CreateProcessWithProperties', 'sDL_GetProcessInput'
--
--     [C declaration]: @SDL_GetProcessOutput@, defined at @SDL3\/SDL_process.h 358:44@
sDL_GetProcessOutput
  :: BG.FunPtr (BG.Ptr SDL_Process -> IO (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream))
sDL_GetProcessOutput =
  BG.unsafePerformIO hs_bindgen_d9e2688fce87583b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_KillProcess@
foreign import ccall unsafe "hs_bindgen_66935b63f947a265"
  hs_bindgen_66935b63f947a265_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_KillProcess@
hs_bindgen_66935b63f947a265 :: IO (BG.FunPtr (BG.Ptr SDL_Process -> BG.CBool -> IO BG.CBool))
hs_bindgen_66935b63f947a265 =
  BG.fromFFIType hs_bindgen_66935b63f947a265_base

{-# NOINLINE sDL_KillProcess #-}

-- | Stop a process.
--
--     [@process@]: The process to stop.
--
--     [@force@]: true to terminate the process immediately, false to try to stop the process gracefully. In general you should try to stop the process gracefully first as terminating a process may leave it with half-written data or in some other unstable state.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcess', 'sDL_CreateProcessWithProperties', 'sDL_WaitProcess', 'sDL_DestroyProcess'
--
--     [C declaration]: @SDL_KillProcess@, defined at @SDL3\/SDL_process.h 381:34@
sDL_KillProcess :: BG.FunPtr (BG.Ptr SDL_Process -> BG.CBool -> IO BG.CBool)
sDL_KillProcess =
  BG.unsafePerformIO hs_bindgen_66935b63f947a265

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_WaitProcess@
foreign import ccall unsafe "hs_bindgen_7ea62b336c3f5c4c"
  hs_bindgen_7ea62b336c3f5c4c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_WaitProcess@
hs_bindgen_7ea62b336c3f5c4c
  :: IO (BG.FunPtr (BG.Ptr SDL_Process -> BG.CBool -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_7ea62b336c3f5c4c =
  BG.fromFFIType hs_bindgen_7ea62b336c3f5c4c_base

{-# NOINLINE sDL_WaitProcess #-}

-- | Wait for a process to finish.
--
--     This can be called multiple times to get the status of a process.
--
--     The exit code will be the exit code of the process if it terminates normally, a negative signal if it terminated due to a signal, or -255 otherwise. It will not be changed if the process is still running.
--
--     If you create a process with standard output piped to the application (@pipe_stdio@ being true) then you should read all of the process output before calling @SDL_WaitProcess()@. If you don\'t do this the process might be blocked indefinitely waiting for output to be read and @SDL_WaitProcess()@ will never return true;
--
--     [@process@]: The process to wait for.
--
--     [@block@]: If true, block until the process finishes; otherwise, report on the process\' status.
--
--     [@exitcode@]: a pointer filled in with the process exit code if the process has exited, may be NULL.
--
--     [Returns]: true if the process exited, false otherwise.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcess', 'sDL_CreateProcessWithProperties', 'sDL_KillProcess', 'sDL_DestroyProcess'
--
--     [C declaration]: @SDL_WaitProcess@, defined at @SDL3\/SDL_process.h 414:34@
sDL_WaitProcess :: BG.FunPtr (BG.Ptr SDL_Process -> BG.CBool -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_WaitProcess =
  BG.unsafePerformIO hs_bindgen_7ea62b336c3f5c4c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_DestroyProcess@
foreign import ccall unsafe "hs_bindgen_c5cffc00b0da9028"
  hs_bindgen_c5cffc00b0da9028_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Process_get_SDL_DestroyProcess@
hs_bindgen_c5cffc00b0da9028 :: IO (BG.FunPtr (BG.Ptr SDL_Process -> IO ()))
hs_bindgen_c5cffc00b0da9028 =
  BG.fromFFIType hs_bindgen_c5cffc00b0da9028_base

{-# NOINLINE sDL_DestroyProcess #-}

-- | Destroy a previously created process object.
--
--     Note that this does not stop the process, just destroys the SDL object used to track it. If you want to stop the process you should use @SDL_KillProcess()@.
--
--     [@process@]: The process object to destroy.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcess', 'sDL_CreateProcessWithProperties', 'sDL_KillProcess'
--
--     [C declaration]: @SDL_DestroyProcess@, defined at @SDL3\/SDL_process.h 433:34@
sDL_DestroyProcess :: BG.FunPtr (BG.Ptr SDL_Process -> IO ())
sDL_DestroyProcess =
  BG.unsafePerformIO hs_bindgen_c5cffc00b0da9028
