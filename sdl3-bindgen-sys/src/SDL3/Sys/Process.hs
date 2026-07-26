-- | Process control support.
--
--     These functions provide a cross-platform way to spawn and manage OS-level processes.
--
--     You can create a new subprocess with @'createProcess'@ and optionally read and write to it using @'readProcess'@ or @'getProcessInput'@ and @'getProcessOutput'@. If more advanced functionality like chaining input between processes is necessary, you can use @'createProcessWithProperties'@.
--
--     You can get the status of a created process with @'waitProcess'@, or terminate the process with @'killProcess'@.
--
--     Don\'t forget to call @'destroyProcess'@ to clean up, whether the process process was killed, terminated on its own, or is still running! An opaque handle representing a system process.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Process.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Process (
  module SDL3.Sys.Bindgen.Process,

  -- * Function aliases
  SDL3.Sys.Process.createProcess,
  SDL3.Sys.Process.createProcessSafe,
  SDL3.Sys.Process.createProcessWithProperties,
  SDL3.Sys.Process.createProcessWithPropertiesSafe,
  SDL3.Sys.Process.getProcessProperties,
  SDL3.Sys.Process.getProcessPropertiesSafe,
  SDL3.Sys.Process.readProcess,
  SDL3.Sys.Process.readProcessSafe,
  SDL3.Sys.Process.getProcessInput,
  SDL3.Sys.Process.getProcessInputSafe,
  SDL3.Sys.Process.getProcessOutput,
  SDL3.Sys.Process.getProcessOutputSafe,
  SDL3.Sys.Process.killProcess,
  SDL3.Sys.Process.killProcessSafe,
  SDL3.Sys.Process.waitProcess,
  SDL3.Sys.Process.waitProcessSafe,
  SDL3.Sys.Process.destroyProcess,
  SDL3.Sys.Process.destroyProcessSafe,
)
where

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Iostream qualified
import SDL3.Sys.Bindgen.Process
import SDL3.Sys.Bindgen.Process.Safe qualified as Safe
import SDL3.Sys.Bindgen.Process.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Properties qualified

-- | Create a new process.
--
--     The path to the executable is supplied in args[0]. args[1..N] are additional arguments passed on the command line of the new process, and the argument list should be terminated with a NULL, e.g.:
--
--     @
--     const char *args[] = { \"myprogram\", \"argument\", NULL };
--     @
--
--     Setting pipe_stdio to true is equivalent to setting @'sDL_PROP_PROCESS_CREATE_STDIN_NUMBER'@ and @'sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER'@ to @SDL_PROCESS_STDIO_APP@, and will allow the use of @'readProcess'@ or @'getProcessInput'@ and @'getProcessOutput'@.
--
--     See @'createProcessWithProperties'@ for more details.
--
--     [Returns]: the newly created and running process, or NULL if the process couldn\'t be created.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcessWithProperties', 'getProcessProperties', 'readProcess', 'getProcessInput', 'getProcessOutput', 'killProcess', 'waitProcess', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateProcess@.
--                   The safe flavor is 'createProcessSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateProcess@, defined at @SDL3\/SDL_process.h 106:43@
createProcess
  :: PtrConst.PtrConst (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@args@]: the path and arguments for the new process.
  -> Bool
  -- ^
  --
  --           [@pipe_stdio@]: true to create pipes to the process\'s standard input and from the process\'s standard output, false for the process to have no input and inherit the application\'s standard output.
  -> IO (BG.Ptr SDL_Process)
createProcess =
  \x00 ->
    \x11 ->
      Unsafe.sDL_CreateProcess x00 (CBool.fromBool x11)

-- | Create a new process.
--
--     The path to the executable is supplied in args[0]. args[1..N] are additional arguments passed on the command line of the new process, and the argument list should be terminated with a NULL, e.g.:
--
--     @
--     const char *args[] = { \"myprogram\", \"argument\", NULL };
--     @
--
--     Setting pipe_stdio to true is equivalent to setting @'sDL_PROP_PROCESS_CREATE_STDIN_NUMBER'@ and @'sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER'@ to @SDL_PROCESS_STDIO_APP@, and will allow the use of @'readProcess'@ or @'getProcessInput'@ and @'getProcessOutput'@.
--
--     See @'createProcessWithProperties'@ for more details.
--
--     [Returns]: the newly created and running process, or NULL if the process couldn\'t be created.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcessWithProperties', 'getProcessProperties', 'readProcess', 'getProcessInput', 'getProcessOutput', 'killProcess', 'waitProcess', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateProcess@.
--                   The unsafe flavor is 'createProcess'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateProcess@, defined at @SDL3\/SDL_process.h 106:43@
createProcessSafe
  :: PtrConst.PtrConst (PtrConst.PtrConst BG.CChar)
  -- ^
  --
  --           [@args@]: the path and arguments for the new process.
  -> Bool
  -- ^
  --
  --           [@pipe_stdio@]: true to create pipes to the process\'s standard input and from the process\'s standard output, false for the process to have no input and inherit the application\'s standard output.
  -> IO (BG.Ptr SDL_Process)
createProcessSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_CreateProcess x00 (CBool.fromBool x11)

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
--     On POSIX platforms, wait() and waitpid(-1, ...) should not be called, and SIGCHLD should not be ignored or handled because those would prevent SDL from properly tracking the lifetime of the underlying process. You should use @'waitProcess'@ instead.
--
--     [Returns]: the newly created and running process, or NULL if the process couldn\'t be created.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'getProcessProperties', 'readProcess', 'getProcessInput', 'getProcessOutput', 'killProcess', 'waitProcess', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateProcessWithProperties@.
--                   The safe flavor is 'createProcessWithPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_CreateProcessWithProperties@, defined at @SDL3\/SDL_process.h 227:43@
createProcessWithProperties
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Process)
createProcessWithProperties =
  Unsafe.sDL_CreateProcessWithProperties

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
--     On POSIX platforms, wait() and waitpid(-1, ...) should not be called, and SIGCHLD should not be ignored or handled because those would prevent SDL from properly tracking the lifetime of the underlying process. You should use @'waitProcess'@ instead.
--
--     [Returns]: the newly created and running process, or NULL if the process couldn\'t be created.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'getProcessProperties', 'readProcess', 'getProcessInput', 'getProcessOutput', 'killProcess', 'waitProcess', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateProcessWithProperties@.
--                   The unsafe flavor is 'createProcessWithProperties'
--                   .
--
--     [C declaration]: @SDL_CreateProcessWithProperties@, defined at @SDL3\/SDL_process.h 227:43@
createProcessWithPropertiesSafe
  :: SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to use.
  -> IO (BG.Ptr SDL_Process)
createProcessWithPropertiesSafe =
  Safe.sDL_CreateProcessWithProperties

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
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetProcessProperties@.
--                   The safe flavor is 'getProcessPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetProcessProperties@, defined at @SDL3\/SDL_process.h 271:46@
getProcessProperties
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: the process to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getProcessProperties =
  Unsafe.sDL_GetProcessProperties

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
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetProcessProperties@.
--                   The unsafe flavor is 'getProcessProperties'
--                   .
--
--     [C declaration]: @SDL_GetProcessProperties@, defined at @SDL3\/SDL_process.h 271:46@
getProcessPropertiesSafe
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: the process to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getProcessPropertiesSafe =
  Safe.sDL_GetProcessProperties

-- | Read all the output from a process.
--
--     If a process was created with I\/O enabled, you can use this function to read the output. This function blocks until the process is complete, capturing all output, and providing the process exit code.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with 'SDL3.Sys.Stdinc.free'.
--
--     [Returns]: the data or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadProcess@.
--                   The safe flavor is 'readProcessSafe'
--                   : blocks until the process closes its output.
--
--     [C declaration]: @SDL_ReadProcess@, defined at @SDL3\/SDL_process.h 308:36@
readProcess
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to read.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: a pointer filled in with the number of bytes read, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@exitcode@]: a pointer filled in with the process exit code if the process has exited, may be NULL.
  -> IO (BG.Ptr BG.Void)
readProcess = Unsafe.sDL_ReadProcess

-- | Read all the output from a process.
--
--     If a process was created with I\/O enabled, you can use this function to read the output. This function blocks until the process is complete, capturing all output, and providing the process exit code.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with 'SDL3.Sys.Stdinc.free'.
--
--     [Returns]: the data or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadProcess@.
--                   The unsafe flavor is 'readProcess'
--                   : blocks until the process closes its output.
--
--     [C declaration]: @SDL_ReadProcess@, defined at @SDL3\/SDL_process.h 308:36@
readProcessSafe
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to read.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: a pointer filled in with the number of bytes read, may be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@exitcode@]: a pointer filled in with the process exit code if the process has exited, may be NULL.
  -> IO (BG.Ptr BG.Void)
readProcessSafe = Safe.sDL_ReadProcess

-- | Get the SDL_IOStream associated with process standard input.
--
--     The process must have been created with @'createProcess'@ and pipe_stdio set to true, or with @'createProcessWithProperties'@ and @'sDL_PROP_PROCESS_CREATE_STDIN_NUMBER'@ set to @SDL_PROCESS_STDIO_APP@.
--
--     Writing to this stream can return less data than expected if the process hasn\'t read its input. It may be blocked waiting for its output to be read, if so you may need to call @'getProcessOutput'@ and read the output in parallel with writing input.
--
--     [Returns]: the input stream or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'getProcessOutput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetProcessInput@.
--                   The safe flavor is 'getProcessInputSafe'
--                   .
--
--     [C declaration]: @SDL_GetProcessInput@, defined at @SDL3\/SDL_process.h 334:44@
getProcessInput
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to get the input stream for.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream)
getProcessInput = Unsafe.sDL_GetProcessInput

-- | Get the SDL_IOStream associated with process standard input.
--
--     The process must have been created with @'createProcess'@ and pipe_stdio set to true, or with @'createProcessWithProperties'@ and @'sDL_PROP_PROCESS_CREATE_STDIN_NUMBER'@ set to @SDL_PROCESS_STDIO_APP@.
--
--     Writing to this stream can return less data than expected if the process hasn\'t read its input. It may be blocked waiting for its output to be read, if so you may need to call @'getProcessOutput'@ and read the output in parallel with writing input.
--
--     [Returns]: the input stream or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'getProcessOutput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetProcessInput@.
--                   The unsafe flavor is 'getProcessInput'
--                   .
--
--     [C declaration]: @SDL_GetProcessInput@, defined at @SDL3\/SDL_process.h 334:44@
getProcessInputSafe
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to get the input stream for.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream)
getProcessInputSafe = Safe.sDL_GetProcessInput

-- | Get the SDL_IOStream associated with process standard output.
--
--     The process must have been created with @'createProcess'@ and pipe_stdio set to true, or with @'createProcessWithProperties'@ and @'sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER'@ set to @SDL_PROCESS_STDIO_APP@.
--
--     Reading from this stream can return 0 with 'SDL3.Sys.Iostream.getIOStatus' returning SDL_IO_STATUS_NOT_READY if no output is available yet.
--
--     [Returns]: the output stream or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'getProcessInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetProcessOutput@.
--                   The safe flavor is 'getProcessOutputSafe'
--                   .
--
--     [C declaration]: @SDL_GetProcessOutput@, defined at @SDL3\/SDL_process.h 358:44@
getProcessOutput
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to get the output stream for.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream)
getProcessOutput = Unsafe.sDL_GetProcessOutput

-- | Get the SDL_IOStream associated with process standard output.
--
--     The process must have been created with @'createProcess'@ and pipe_stdio set to true, or with @'createProcessWithProperties'@ and @'sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER'@ set to @SDL_PROCESS_STDIO_APP@.
--
--     Reading from this stream can return 0 with 'SDL3.Sys.Iostream.getIOStatus' returning SDL_IO_STATUS_NOT_READY if no output is available yet.
--
--     [Returns]: the output stream or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'getProcessInput'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetProcessOutput@.
--                   The unsafe flavor is 'getProcessOutput'
--                   .
--
--     [C declaration]: @SDL_GetProcessOutput@, defined at @SDL3\/SDL_process.h 358:44@
getProcessOutputSafe
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to get the output stream for.
  -> IO (BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream)
getProcessOutputSafe = Safe.sDL_GetProcessOutput

-- | Stop a process.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'waitProcess', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_KillProcess@.
--                   The safe flavor is 'killProcessSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_KillProcess@, defined at @SDL3\/SDL_process.h 381:34@
killProcess
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to stop.
  -> Bool
  -- ^
  --
  --           [@force@]: true to terminate the process immediately, false to try to stop the process gracefully. In general you should try to stop the process gracefully first as terminating a process may leave it with half-written data or in some other unstable state.
  -> IO Bool
killProcess =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_KillProcess x00 (CBool.fromBool x11))

-- | Stop a process.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'waitProcess', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_KillProcess@.
--                   The unsafe flavor is 'killProcess'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_KillProcess@, defined at @SDL3\/SDL_process.h 381:34@
killProcessSafe
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to stop.
  -> Bool
  -- ^
  --
  --           [@force@]: true to terminate the process immediately, false to try to stop the process gracefully. In general you should try to stop the process gracefully first as terminating a process may leave it with half-written data or in some other unstable state.
  -> IO Bool
killProcessSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_KillProcess x00 (CBool.fromBool x11))

-- | Wait for a process to finish.
--
--     This can be called multiple times to get the status of a process.
--
--     The exit code will be the exit code of the process if it terminates normally, a negative signal if it terminated due to a signal, or -255 otherwise. It will not be changed if the process is still running.
--
--     If you create a process with standard output piped to the application (@pipe_stdio@ being true) then you should read all of the process output before calling @'waitProcess'@. If you don\'t do this the process might be blocked indefinitely waiting for output to be read and @'waitProcess'@ will never return true;
--
--     [Returns]: true if the process exited, false otherwise.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'killProcess', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WaitProcess@.
--                   The safe flavor is 'waitProcessSafe'
--                   : blocks until the process exits.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitProcess@, defined at @SDL3\/SDL_process.h 414:34@
waitProcess
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to wait for.
  -> Bool
  -- ^
  --
  --           [@block@]: If true, block until the process finishes; otherwise, report on the process\' status.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@exitcode@]: a pointer filled in with the process exit code if the process has exited, may be NULL.
  -> IO Bool
waitProcess =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_WaitProcess x00 (CBool.fromBool x11) x22)

-- | Wait for a process to finish.
--
--     This can be called multiple times to get the status of a process.
--
--     The exit code will be the exit code of the process if it terminates normally, a negative signal if it terminated due to a signal, or -255 otherwise. It will not be changed if the process is still running.
--
--     If you create a process with standard output piped to the application (@pipe_stdio@ being true) then you should read all of the process output before calling @'waitProcess'@. If you don\'t do this the process might be blocked indefinitely waiting for output to be read and @'waitProcess'@ will never return true;
--
--     [Returns]: true if the process exited, false otherwise.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'killProcess', 'destroyProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WaitProcess@.
--                   The unsafe flavor is 'waitProcess'
--                   : blocks until the process exits.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WaitProcess@, defined at @SDL3\/SDL_process.h 414:34@
waitProcessSafe
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process to wait for.
  -> Bool
  -- ^
  --
  --           [@block@]: If true, block until the process finishes; otherwise, report on the process\' status.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@exitcode@]: a pointer filled in with the process exit code if the process has exited, may be NULL.
  -> IO Bool
waitProcessSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_WaitProcess x00 (CBool.fromBool x11) x22)

-- | Destroy a previously created process object.
--
--     Note that this does not stop the process, just destroys the SDL object used to track it. If you want to stop the process you should use @'killProcess'@.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'killProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyProcess@.
--                   The safe flavor is 'destroyProcessSafe'
--                   .
--
--     [C declaration]: @SDL_DestroyProcess@, defined at @SDL3\/SDL_process.h 433:34@
destroyProcess
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process object to destroy.
  -> IO ()
destroyProcess = Unsafe.sDL_DestroyProcess

-- | Destroy a previously created process object.
--
--     Note that this does not stop the process, just destroys the SDL object used to track it. If you want to stop the process you should use @'killProcess'@.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [See also]: 'createProcess', 'createProcessWithProperties', 'killProcess'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyProcess@.
--                   The unsafe flavor is 'destroyProcess'
--                   .
--
--     [C declaration]: @SDL_DestroyProcess@, defined at @SDL3\/SDL_process.h 433:34@
destroyProcessSafe
  :: BG.Ptr SDL_Process
  -- ^
  --
  --           [@process@]: The process object to destroy.
  -> IO ()
destroyProcessSafe = Safe.sDL_DestroyProcess
