/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_timer.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.TimerShims; the curated
 * layer exports them from SDL3.Sys.Timer, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_TIMER_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_TIMER_SHIMS_H

#include <SDL3/SDL_timer.h>

/**
 * Convert seconds to nanoseconds.
 *
 * The SDL_SECONDS_TO_NS macro as a function. This only converts whole numbers, not
 * fractional seconds.
 *
 * \param s the number of seconds to convert.
 * \returns `s`, expressed in nanoseconds.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint64 lithon_SDL_SECONDS_TO_NS(Uint64 s)
{
    return SDL_SECONDS_TO_NS(s);
}

/**
 * Convert milliseconds to nanoseconds.
 *
 * The SDL_MS_TO_NS macro as a function. This only converts whole numbers, not
 * fractional milliseconds.
 *
 * \param ms the number of milliseconds to convert.
 * \returns `ms`, expressed in nanoseconds.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint64 lithon_SDL_MS_TO_NS(Uint64 ms)
{
    return SDL_MS_TO_NS(ms);
}

/**
 * Convert microseconds to nanoseconds.
 *
 * The SDL_US_TO_NS macro as a function. This only converts whole numbers, not
 * fractional microseconds.
 *
 * \param us the number of microseconds to convert.
 * \returns `us`, expressed in nanoseconds.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint64 lithon_SDL_US_TO_NS(Uint64 us)
{
    return SDL_US_TO_NS(us);
}

#endif /* SDL3_BINDGEN_SYS_SDL_TIMER_SHIMS_H */
