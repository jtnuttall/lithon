/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_surface.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.SurfaceShims; the curated
 * layer exports them from SDL3.Sys.Surface, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_SURFACE_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_SURFACE_SHIMS_H

#include <SDL3/SDL_surface.h>

/**
 * Determine whether a surface needs to be locked before its pixels are
 * accessed.
 *
 * The SDL_MUSTLOCK macro as a function.
 *
 * \param surface the SDL_Surface to check.
 * \returns true if the surface must be locked with SDL_LockSurface before its
 *          pixels are read or written, false otherwise.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_LockSurface
 * \sa SDL_UnlockSurface
 */
static SDL_INLINE bool lithon_SDL_MUSTLOCK(SDL_Surface *surface)
{
    return SDL_MUSTLOCK(surface);
}

#endif /* SDL3_BINDGEN_SYS_SDL_SURFACE_SHIMS_H */
