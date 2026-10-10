{-# LANGUAGE NoImplicitPrelude #-}

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
--     The C shims are functions this package defines in C over what the FFI cannot call directly (variadic functions, function-like macros), each named after what it wraps; the same flavor rules apply. Their raw imports live under "SDL3.Sys.Bindgen.LogShims".
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

  -- * C shims
  SDL3.Sys.Log.log,
  SDL3.Sys.Log.logSafe,
  SDL3.Sys.Log.logTrace,
  SDL3.Sys.Log.logTraceSafe,
  SDL3.Sys.Log.logVerbose,
  SDL3.Sys.Log.logVerboseSafe,
  SDL3.Sys.Log.logDebug,
  SDL3.Sys.Log.logDebugSafe,
  SDL3.Sys.Log.logInfo,
  SDL3.Sys.Log.logInfoSafe,
  SDL3.Sys.Log.logWarn,
  SDL3.Sys.Log.logWarnSafe,
  SDL3.Sys.Log.logError,
  SDL3.Sys.Log.logErrorSafe,
  SDL3.Sys.Log.logCritical,
  SDL3.Sys.Log.logCriticalSafe,
  SDL3.Sys.Log.logMessage,
  SDL3.Sys.Log.logMessageSafe,
)
where

import Data.Coerce qualified as Coerce
import Prelude (Bool, IO, fmap)

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Log
import SDL3.Sys.Bindgen.Log qualified
import SDL3.Sys.Bindgen.Log.Safe qualified as Safe
import SDL3.Sys.Bindgen.Log.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.LogShims.Safe qualified as Safe
import SDL3.Sys.Bindgen.LogShims.Unsafe qualified as Unsafe

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
--     [Returns]: the default log output callback. It should be called with NULL for the userdata argument.
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
--     [C declaration]: @SDL_GetDefaultLogOutputFunction@, defined at @SDL3\/SDL_log.h 500:51@
getDefaultLogOutputFunction :: IO SDL_LogOutputFunction
getDefaultLogOutputFunction =
  Unsafe.sDL_GetDefaultLogOutputFunction

-- | Get the default log output function.
--
--     [Returns]: the default log output callback. It should be called with NULL for the userdata argument.
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
--     [C declaration]: @SDL_GetDefaultLogOutputFunction@, defined at @SDL3\/SDL_log.h 500:51@
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
--     [C declaration]: @SDL_GetLogOutputFunction@, defined at @SDL3\/SDL_log.h 517:34@
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
--     [C declaration]: @SDL_GetLogOutputFunction@, defined at @SDL3\/SDL_log.h 517:34@
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
--     [C declaration]: @SDL_SetLogOutputFunction@, defined at @SDL3\/SDL_log.h 532:34@
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
--     [C declaration]: @SDL_SetLogOutputFunction@, defined at @SDL3\/SDL_log.h 532:34@
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

-- | Log a message with SDL_LOG_CATEGORY_APPLICATION and SDL_LOG_PRIORITY_INFO.
--
--     A fixed-arity shim over the variadic SDL_Log: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Log@.
--                   The safe flavor is 'logSafe'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [C declaration]: @lithon_SDL_Log@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 39:24@
log
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
log = Unsafe.lithon_SDL_Log

-- | Log a message with SDL_LOG_CATEGORY_APPLICATION and SDL_LOG_PRIORITY_INFO.
--
--     A fixed-arity shim over the variadic SDL_Log: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @lithon_SDL_Log@.
--                   The unsafe flavor is 'log'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [C declaration]: @lithon_SDL_Log@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 39:24@
logSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logSafe = Safe.lithon_SDL_Log

-- | Log a message with SDL_LOG_PRIORITY_TRACE.
--
--     A fixed-arity shim over the variadic SDL_LogTrace: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_LogTrace@.
--                   The safe flavor is 'logTraceSafe'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogTrace@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 60:24@
logTrace
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logTrace =
  \x00 ->
    \x11 ->
      Unsafe.lithon_SDL_LogTrace (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_TRACE.
--
--     A fixed-arity shim over the variadic SDL_LogTrace: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @lithon_SDL_LogTrace@.
--                   The unsafe flavor is 'logTrace'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogTrace@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 60:24@
logTraceSafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logTraceSafe =
  \x00 ->
    \x11 ->
      Safe.lithon_SDL_LogTrace (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_VERBOSE.
--
--     A fixed-arity shim over the variadic SDL_LogVerbose: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_LogVerbose@.
--                   The safe flavor is 'logVerboseSafe'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogVerbose@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 81:24@
logVerbose
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logVerbose =
  \x00 ->
    \x11 ->
      Unsafe.lithon_SDL_LogVerbose (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_VERBOSE.
--
--     A fixed-arity shim over the variadic SDL_LogVerbose: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @lithon_SDL_LogVerbose@.
--                   The unsafe flavor is 'logVerbose'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogVerbose@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 81:24@
logVerboseSafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logVerboseSafe =
  \x00 ->
    \x11 ->
      Safe.lithon_SDL_LogVerbose (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_DEBUG.
--
--     A fixed-arity shim over the variadic SDL_LogDebug: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_LogDebug@.
--                   The safe flavor is 'logDebugSafe'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogDebug@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 102:24@
logDebug
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logDebug =
  \x00 ->
    \x11 ->
      Unsafe.lithon_SDL_LogDebug (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_DEBUG.
--
--     A fixed-arity shim over the variadic SDL_LogDebug: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @lithon_SDL_LogDebug@.
--                   The unsafe flavor is 'logDebug'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogDebug@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 102:24@
logDebugSafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logDebugSafe =
  \x00 ->
    \x11 ->
      Safe.lithon_SDL_LogDebug (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_INFO.
--
--     A fixed-arity shim over the variadic SDL_LogInfo: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_LogInfo@.
--                   The safe flavor is 'logInfoSafe'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogInfo@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 123:24@
logInfo
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logInfo =
  \x00 ->
    \x11 ->
      Unsafe.lithon_SDL_LogInfo (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_INFO.
--
--     A fixed-arity shim over the variadic SDL_LogInfo: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @lithon_SDL_LogInfo@.
--                   The unsafe flavor is 'logInfo'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogInfo@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 123:24@
logInfoSafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logInfoSafe =
  \x00 ->
    \x11 ->
      Safe.lithon_SDL_LogInfo (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_WARN.
--
--     A fixed-arity shim over the variadic SDL_LogWarn: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_LogWarn@.
--                   The safe flavor is 'logWarnSafe'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogWarn@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 144:24@
logWarn
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logWarn =
  \x00 ->
    \x11 ->
      Unsafe.lithon_SDL_LogWarn (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_WARN.
--
--     A fixed-arity shim over the variadic SDL_LogWarn: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @lithon_SDL_LogWarn@.
--                   The unsafe flavor is 'logWarn'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogWarn@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 144:24@
logWarnSafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logWarnSafe =
  \x00 ->
    \x11 ->
      Safe.lithon_SDL_LogWarn (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_ERROR.
--
--     A fixed-arity shim over the variadic SDL_LogError: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_LogError@.
--                   The safe flavor is 'logErrorSafe'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogError@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 165:24@
logError
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logError =
  \x00 ->
    \x11 ->
      Unsafe.lithon_SDL_LogError (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_ERROR.
--
--     A fixed-arity shim over the variadic SDL_LogError: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @lithon_SDL_LogError@.
--                   The unsafe flavor is 'logError'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogError@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 165:24@
logErrorSafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logErrorSafe =
  \x00 ->
    \x11 ->
      Safe.lithon_SDL_LogError (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_CRITICAL.
--
--     A fixed-arity shim over the variadic SDL_LogCritical: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_LogCritical@.
--                   The safe flavor is 'logCriticalSafe'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogCritical@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 186:24@
logCritical
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logCritical =
  \x00 ->
    \x11 ->
      Unsafe.lithon_SDL_LogCritical (Coerce.coerce x00) x11

-- | Log a message with SDL_LOG_PRIORITY_CRITICAL.
--
--     A fixed-arity shim over the variadic SDL_LogCritical: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'logMessage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @lithon_SDL_LogCritical@.
--                   The unsafe flavor is 'logCritical'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogCritical@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 186:24@
logCriticalSafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logCriticalSafe =
  \x00 ->
    \x11 ->
      Safe.lithon_SDL_LogCritical (Coerce.coerce x00) x11

-- | Log a message with the specified category and priority.
--
--     A fixed-arity shim over the variadic SDL_LogMessage: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogOutputFunction', 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_LogMessage@.
--                   The safe flavor is 'logMessageSafe'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogMessage@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 209:24@
logMessage
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> SDL3.Sys.Bindgen.Log.SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the priority of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logMessage =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.lithon_SDL_LogMessage (Coerce.coerce x00) x11 x22

-- | Log a message with the specified category and priority.
--
--     A fixed-arity shim over the variadic SDL_LogMessage: @message@ is logged verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setLogOutputFunction', 'setLogPriority'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @lithon_SDL_LogMessage@.
--                   The unsafe flavor is 'logMessage'
--                   : invokes the log output function synchronously, which may be implemented in Haskell (SDL_SetLogOutputFunction).
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_LogMessage@, defined at @sdl3-bindgen-sys\/SDL_log_shims.h 209:24@
logMessageSafe
  :: BG.Int32
  -- ^
  --
  --           [@category@]: the category of the message.
  -> SDL3.Sys.Bindgen.Log.SDL_LogPriority
  -- ^
  --
  --           [@priority@]: the priority of the message.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the message to log, in UTF-8.
  -> IO ()
logMessageSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.lithon_SDL_LogMessage (Coerce.coerce x00) x11 x22
