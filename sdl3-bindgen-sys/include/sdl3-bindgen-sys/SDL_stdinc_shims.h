/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_stdinc.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.StdincShims; the curated
 * layer exports them from SDL3.Sys.Stdinc, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_STDINC_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_STDINC_SHIMS_H

#include <SDL3/SDL_stdinc.h>

/**
 * Define a four character code as a Uint32.
 *
 * The SDL_FOURCC macro as a function.
 *
 * \param a the first ASCII character.
 * \param b the second ASCII character.
 * \param c the third ASCII character.
 * \param d the fourth ASCII character.
 * \returns the four characters converted into a Uint32, one character
 *          per-byte.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint32 lithon_SDL_FOURCC(Uint8 a, Uint8 b, Uint8 c, Uint8 d)
{
    return SDL_FOURCC(a, b, c, d);
}

#endif /* SDL3_BINDGEN_SYS_SDL_STDINC_SHIMS_H */
