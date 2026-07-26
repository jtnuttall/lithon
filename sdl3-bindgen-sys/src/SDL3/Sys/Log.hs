-- | Simple log messages with priorities and categories. A message\'s 'SDL_LogPriority' signifies how important the message is. A message\'s 'SDL_LogCategory' signifies from what domain it belongs to. Every category has a minimum priority specified: when a message belongs to that category, it will only be sent out if it has that minimum priority or higher.
--
--     SDL\'s own logs are sent below the default priority threshold, so they are quiet by default.
--
--     You can change the log verbosity programmatically using @'setLogPriority'@ or with SDL_SetHint(SDL_HINT_LOGGING, ...), or with the \"SDL_LOGGING\" environment variable. This variable is a comma separated set of category=level tokens that define the default logging levels for SDL applications.
--
--     The category can be a numeric category, one of \"app\", \"error\", \"assert\", \"system\", \"audio\", \"video\", \"render\", \"input\", \"test\", or @*@ for any unspecified category.
--
--     The level can be a numeric level, one of \"trace\", \"verbose\", \"debug\", \"info\", \"warn\", \"error\", \"critical\", or \"quiet\" to disable that category.
--
--     You can omit the category if you want to set the logging level for all categories.
--
--     If this hint isn\'t set, the default log levels are equivalent to:
--
--     @app=info,assert=warn,test=verbose,*=error@
--
--     Here\'s where the messages go on different platforms:
--
--     * Windows: debug output stream
--
--     * Android: log output
--
--     * Others: standard error output (stderr)
--
--     You don\'t need to have a newline (@\\n@) on the end of messages, the functions will do that for you. For consistent behavior cross-platform, you shouldn\'t have any newlines in messages, such as to log multiple lines in one call; unusual platform-specific behavior can be observed in such usage. Do one log call per line instead, with no newlines in messages.
--
--     Each log call is atomic, so you won\'t see log messages cut off one another when logging from multiple threads. The predefined log categories
--
--     By default the application and gpu categories are enabled at the INFO level, the assert category is enabled at the WARN level, test is enabled at the VERBOSE level and all other categories are enabled at the ERROR level.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Log.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Log (
  module SDL3.Sys.Bindgen.Log,

  -- * Function aliases
  SDL3.Sys.Log.setLogPriorities,
  SDL3.Sys.Log.setLogPrioritiesSafe,
  SDL3.Sys.Log.setLogPriority,
  SDL3.Sys.Log.setLogPrioritySafe,
  SDL3.Sys.Log.getLogPriority,
  SDL3.Sys.Log.getLogPrioritySafe,
  SDL3.Sys.Log.resetLogPriorities,
  SDL3.Sys.Log.resetLogPrioritiesSafe,
  SDL3.Sys.Log.setLogPriorityPrefix,
  SDL3.Sys.Log.setLogPriorityPrefixSafe,
  SDL3.Sys.Log.getDefaultLogOutputFunction,
  SDL3.Sys.Log.getDefaultLogOutputFunctionSafe,
  SDL3.Sys.Log.getLogOutputFunction,
  SDL3.Sys.Log.getLogOutputFunctionSafe,
  SDL3.Sys.Log.setLogOutputFunction,
  SDL3.Sys.Log.setLogOutputFunctionSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Log
import SDL3.Sys.Bindgen.Log.Safe qualified as Safe
import SDL3.Sys.Bindgen.Log.Unsafe qualified as Unsafe

-- | Set the priority of all log categories.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'resetLogPriorities', 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetLogPriorities@.
--                   The safe flavor is 'setLogPrioritiesSafe'
--                   .
--
--     [C declaration]: @SDL_SetLogPriorities@, defined at @SDL3\/SDL_log.h 156:34@
setLogPriorities
  :: SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_LogPriority' to assign.
  -> IO ()
setLogPriorities = Unsafe.sDL_SetLogPriorities

-- | Set the priority of all log categories.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'resetLogPriorities', 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetLogPriorities@.
--                   The unsafe flavor is 'setLogPriorities'
--                   .
--
--     [C declaration]: @SDL_SetLogPriorities@, defined at @SDL3\/SDL_log.h 156:34@
setLogPrioritiesSafe
  :: SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_LogPriority' to assign.
  -> IO ()
setLogPrioritiesSafe = Safe.sDL_SetLogPriorities

-- | Set the priority of a particular log category.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getLogPriority', 'resetLogPriorities', 'setLogPriorities'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetLogPriority@.
--                   The safe flavor is 'setLogPrioritySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetLogPriority@, defined at @SDL3\/SDL_log.h 172:34@
setLogPriority
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category to assign a priority to.
  -> SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_LogPriority' to assign.
  -> IO ()
setLogPriority =
  \x00 ->
    \x11 ->
      Unsafe.sDL_SetLogPriority (Coerce.coerce x00) x11

-- | Set the priority of a particular log category.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getLogPriority', 'resetLogPriorities', 'setLogPriorities'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetLogPriority@.
--                   The unsafe flavor is 'setLogPriority'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetLogPriority@, defined at @SDL3\/SDL_log.h 172:34@
setLogPrioritySafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category to assign a priority to.
  -> SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_LogPriority' to assign.
  -> IO ()
setLogPrioritySafe =
  \x00 ->
    \x11 ->
      Safe.sDL_SetLogPriority (Coerce.coerce x00) x11

-- | Get the priority of a particular log category.
--
--     [Returns]: the 'SDL_LogPriority' for the requested category.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetLogPriority@.
--                   The safe flavor is 'getLogPrioritySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetLogPriority@, defined at @SDL3\/SDL_log.h 186:45@
getLogPriority
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category to query.
  -> IO SDL_LogPriority
getLogPriority =
  \x00 -> Unsafe.sDL_GetLogPriority (Coerce.coerce x00)

-- | Get the priority of a particular log category.
--
--     [Returns]: the 'SDL_LogPriority' for the requested category.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetLogPriority@.
--                   The unsafe flavor is 'getLogPriority'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetLogPriority@, defined at @SDL3\/SDL_log.h 186:45@
getLogPrioritySafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category to query.
  -> IO SDL_LogPriority
getLogPrioritySafe =
  \x00 -> Safe.sDL_GetLogPriority (Coerce.coerce x00)

-- | Reset all priorities to default.
--
--     This is called by 'SDL3.Sys.Init.quit'.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogPriorities', 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ResetLogPriorities@.
--                   The safe flavor is 'resetLogPrioritiesSafe'
--                   .
--
--     [C declaration]: @SDL_ResetLogPriorities@, defined at @SDL3\/SDL_log.h 200:34@
resetLogPriorities :: IO ()
resetLogPriorities = Unsafe.sDL_ResetLogPriorities

-- | Reset all priorities to default.
--
--     This is called by 'SDL3.Sys.Init.quit'.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogPriorities', 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ResetLogPriorities@.
--                   The unsafe flavor is 'resetLogPriorities'
--                   .
--
--     [C declaration]: @SDL_ResetLogPriorities@, defined at @SDL3\/SDL_log.h 200:34@
resetLogPrioritiesSafe :: IO ()
resetLogPrioritiesSafe = Safe.sDL_ResetLogPriorities

-- | Set the text prepended to log messages of a given priority.
--
--     By default SDL_LOG_PRIORITY_INFO and below have no prefix, and SDL_LOG_PRIORITY_WARN and higher have a prefix showing their priority, e.g. \"WARNING: \".
--
--     This function makes a copy of its string argument, __prefix__, so it is not necessary to keep the value of __prefix__ alive after the call returns.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogPriorities', 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetLogPriorityPrefix@.
--                   The safe flavor is 'setLogPriorityPrefixSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetLogPriorityPrefix@, defined at @SDL3\/SDL_log.h 225:34@
setLogPriorityPrefix
  :: SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_LogPriority' to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@prefix@]: the prefix to use for that log priority, or NULL to use no prefix.
  -> IO Bool
setLogPriorityPrefix =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetLogPriorityPrefix x00 x11)

-- | Set the text prepended to log messages of a given priority.
--
--     By default SDL_LOG_PRIORITY_INFO and below have no prefix, and SDL_LOG_PRIORITY_WARN and higher have a prefix showing their priority, e.g. \"WARNING: \".
--
--     This function makes a copy of its string argument, __prefix__, so it is not necessary to keep the value of __prefix__ alive after the call returns.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogPriorities', 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetLogPriorityPrefix@.
--                   The unsafe flavor is 'setLogPriorityPrefix'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetLogPriorityPrefix@, defined at @SDL3\/SDL_log.h 225:34@
setLogPriorityPrefixSafe
  :: SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the 'SDL_LogPriority' to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@prefix@]: the prefix to use for that log priority, or NULL to use no prefix.
  -> IO Bool
setLogPriorityPrefixSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetLogPriorityPrefix x00 x11)

-- | Get the default log output function.
--
--     [Returns]: the default log output callback.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogOutputFunction', 'getLogOutputFunction'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetDefaultLogOutputFunction@.
--                   The safe flavor is 'getDefaultLogOutputFunctionSafe'
--                   .
--
--     [C declaration]: @SDL_GetDefaultLogOutputFunction@, defined at @SDL3\/SDL_log.h 499:51@
getDefaultLogOutputFunction :: IO SDL_LogOutputFunction
getDefaultLogOutputFunction =
  Unsafe.sDL_GetDefaultLogOutputFunction

-- | Get the default log output function.
--
--     [Returns]: the default log output callback.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogOutputFunction', 'getLogOutputFunction'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetDefaultLogOutputFunction@.
--                   The unsafe flavor is 'getDefaultLogOutputFunction'
--                   .
--
--     [C declaration]: @SDL_GetDefaultLogOutputFunction@, defined at @SDL3\/SDL_log.h 499:51@
getDefaultLogOutputFunctionSafe :: IO SDL_LogOutputFunction
getDefaultLogOutputFunctionSafe =
  Safe.sDL_GetDefaultLogOutputFunction

-- | Get the current log output function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDefaultLogOutputFunction', 'setLogOutputFunction'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetLogOutputFunction@.
--                   The safe flavor is 'getLogOutputFunctionSafe'
--                   .
--
--     [C declaration]: @SDL_GetLogOutputFunction@, defined at @SDL3\/SDL_log.h 516:34@
getLogOutputFunction
  :: BG.Ptr SDL_LogOutputFunction
  -- ^
  --
  --           [@callback@]: an 'SDL_LogOutputFunction' filled in with the current log callback.
  -> BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@userdata@]: a pointer filled in with the pointer that is passed to @callback@.
  -> IO ()
getLogOutputFunction =
  Unsafe.sDL_GetLogOutputFunction

-- | Get the current log output function.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDefaultLogOutputFunction', 'setLogOutputFunction'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetLogOutputFunction@.
--                   The unsafe flavor is 'getLogOutputFunction'
--                   .
--
--     [C declaration]: @SDL_GetLogOutputFunction@, defined at @SDL3\/SDL_log.h 516:34@
getLogOutputFunctionSafe
  :: BG.Ptr SDL_LogOutputFunction
  -- ^
  --
  --           [@callback@]: an 'SDL_LogOutputFunction' filled in with the current log callback.
  -> BG.Ptr (BG.Ptr BG.Void)
  -- ^
  --
  --           [@userdata@]: a pointer filled in with the pointer that is passed to @callback@.
  -> IO ()
getLogOutputFunctionSafe =
  Safe.sDL_GetLogOutputFunction

-- | Replace the default log output function with one of your own.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDefaultLogOutputFunction', 'getLogOutputFunction'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetLogOutputFunction@.
--                   The safe flavor is 'setLogOutputFunctionSafe'
--                   : registration; the output function runs from later logging calls.
--
--     [C declaration]: @SDL_SetLogOutputFunction@, defined at @SDL3\/SDL_log.h 531:34@
setLogOutputFunction
  :: SDL_LogOutputFunction
  -- ^
  --
  --           [@callback@]: an 'SDL_LogOutputFunction' to call instead of the default.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @callback@.
  -> IO ()
setLogOutputFunction =
  Unsafe.sDL_SetLogOutputFunction

-- | Replace the default log output function with one of your own.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getDefaultLogOutputFunction', 'getLogOutputFunction'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetLogOutputFunction@.
--                   The unsafe flavor is 'setLogOutputFunction'
--                   : registration; the output function runs from later logging calls.
--
--     [C declaration]: @SDL_SetLogOutputFunction@, defined at @SDL3\/SDL_log.h 531:34@
setLogOutputFunctionSafe
  :: SDL_LogOutputFunction
  -- ^
  --
  --           [@callback@]: an 'SDL_LogOutputFunction' to call instead of the default.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @callback@.
  -> IO ()
setLogOutputFunctionSafe =
  Safe.sDL_SetLogOutputFunction
