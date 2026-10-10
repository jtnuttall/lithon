/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_iostream.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.IostreamShims; the curated
 * layer exports them from SDL3.Sys.Iostream, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_IOSTREAM_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_IOSTREAM_SHIMS_H

#include <SDL3/SDL_iostream.h>

/**
 * Print a string to an SDL_IOStream data stream.
 *
 * A fixed-arity shim over the variadic SDL_IOprintf: `str` is written
 * verbatim. It is never parsed as a printf-style format string, so a percent
 * sign in it needs no escaping.
 *
 * \param context a pointer to an SDL_IOStream structure.
 * \param str the NUL-terminated string to write.
 * \returns the number of bytes written or 0 on failure; call SDL_GetError()
 *          for more information.
 *
 * \threadsafety Do not use the same SDL_IOStream from two threads at once.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_WriteIO
 */
static SDL_INLINE size_t lithon_SDL_IOprintf(SDL_IOStream *context, const char *str)
{
    return SDL_IOprintf(context, "%s", str);
}

#endif /* SDL3_BINDGEN_SYS_SDL_IOSTREAM_SHIMS_H */
