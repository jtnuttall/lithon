/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_log.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.LogShims; the curated
 * layer exports them from SDL3.Sys.Log, under "C shims".
 *
 * Authored in lithon-codegen/data/sdl3/include/sdl3-bindgen-sys/ and copied
 * verbatim into the package's include/sdl3-bindgen-sys/: edit the
 * lithon-codegen copy, then run `lithon-codegen sdl3 generate`. Rules:
 * functions only (no types, no macros but the include guard); each named
 * lithon_<the SDL name it wraps>; a since-line equal to the wrapped API's;
 * anything newer than SDL 3.2.0 guards its definition with
 * SDL_VERSION_ATLEAST.
 *
 * BSD-3-Clause, like the package (see LICENSE). Documentation adapted from
 * the SDL 3 headers (zlib; see LICENSE_SDL).
 */

#ifndef SDL3_BINDGEN_SYS_SDL_LOG_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_LOG_SHIMS_H

#include <SDL3/SDL_log.h>

/**
 * Log a message with SDL_LOG_CATEGORY_APPLICATION and SDL_LOG_PRIORITY_INFO.
 *
 * A fixed-arity shim over the variadic SDL_Log: `message` is logged
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param message the message to log, in UTF-8.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_LogMessage
 */
static SDL_INLINE void lithon_SDL_Log(const char *message)
{
    SDL_Log("%s", message);
}

/**
 * Log a message with SDL_LOG_PRIORITY_TRACE.
 *
 * A fixed-arity shim over the variadic SDL_LogTrace: `message` is logged
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param category the category of the message.
 * \param message the message to log, in UTF-8.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_LogMessage
 */
static SDL_INLINE void lithon_SDL_LogTrace(int category, const char *message)
{
    SDL_LogTrace(category, "%s", message);
}

/**
 * Log a message with SDL_LOG_PRIORITY_VERBOSE.
 *
 * A fixed-arity shim over the variadic SDL_LogVerbose: `message` is logged
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param category the category of the message.
 * \param message the message to log, in UTF-8.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_LogMessage
 */
static SDL_INLINE void lithon_SDL_LogVerbose(int category, const char *message)
{
    SDL_LogVerbose(category, "%s", message);
}

/**
 * Log a message with SDL_LOG_PRIORITY_DEBUG.
 *
 * A fixed-arity shim over the variadic SDL_LogDebug: `message` is logged
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param category the category of the message.
 * \param message the message to log, in UTF-8.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_LogMessage
 */
static SDL_INLINE void lithon_SDL_LogDebug(int category, const char *message)
{
    SDL_LogDebug(category, "%s", message);
}

/**
 * Log a message with SDL_LOG_PRIORITY_INFO.
 *
 * A fixed-arity shim over the variadic SDL_LogInfo: `message` is logged
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param category the category of the message.
 * \param message the message to log, in UTF-8.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_LogMessage
 */
static SDL_INLINE void lithon_SDL_LogInfo(int category, const char *message)
{
    SDL_LogInfo(category, "%s", message);
}

/**
 * Log a message with SDL_LOG_PRIORITY_WARN.
 *
 * A fixed-arity shim over the variadic SDL_LogWarn: `message` is logged
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param category the category of the message.
 * \param message the message to log, in UTF-8.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_LogMessage
 */
static SDL_INLINE void lithon_SDL_LogWarn(int category, const char *message)
{
    SDL_LogWarn(category, "%s", message);
}

/**
 * Log a message with SDL_LOG_PRIORITY_ERROR.
 *
 * A fixed-arity shim over the variadic SDL_LogError: `message` is logged
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param category the category of the message.
 * \param message the message to log, in UTF-8.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_LogMessage
 */
static SDL_INLINE void lithon_SDL_LogError(int category, const char *message)
{
    SDL_LogError(category, "%s", message);
}

/**
 * Log a message with SDL_LOG_PRIORITY_CRITICAL.
 *
 * A fixed-arity shim over the variadic SDL_LogCritical: `message` is logged
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param category the category of the message.
 * \param message the message to log, in UTF-8.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_LogMessage
 */
static SDL_INLINE void lithon_SDL_LogCritical(int category, const char *message)
{
    SDL_LogCritical(category, "%s", message);
}

/**
 * Log a message with the specified category and priority.
 *
 * A fixed-arity shim over the variadic SDL_LogMessage: `message` is logged
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param category the category of the message.
 * \param priority the priority of the message.
 * \param message the message to log, in UTF-8.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_SetLogOutputFunction
 * \sa SDL_SetLogPriority
 */
static SDL_INLINE void lithon_SDL_LogMessage(int category, SDL_LogPriority priority, const char *message)
{
    SDL_LogMessage(category, priority, "%s", message);
}

#endif /* SDL3_BINDGEN_SYS_SDL_LOG_SHIMS_H */
