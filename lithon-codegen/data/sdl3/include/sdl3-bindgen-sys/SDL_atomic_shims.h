/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_atomic.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.AtomicShims; the curated
 * layer exports them from SDL3.Sys.Atomic, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_ATOMIC_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_ATOMIC_SHIMS_H

#include <SDL3/SDL_atomic.h>

/**
 * Increment an atomic variable used as a reference count.
 *
 * The SDL_AtomicIncRef macro as a function.
 *
 * \param a a pointer to an SDL_AtomicInt to increment.
 * \returns the previous value of the atomic variable.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_AtomicDecRef
 */
static SDL_INLINE int lithon_SDL_AtomicIncRef(SDL_AtomicInt *a)
{
    return SDL_AtomicIncRef(a);
}

/**
 * Decrement an atomic variable used as a reference count.
 *
 * The SDL_AtomicDecRef macro as a function.
 *
 * \param a a pointer to an SDL_AtomicInt to decrement.
 * \returns true if the variable reached zero after decrementing, false
 *          otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_AtomicIncRef
 */
static SDL_INLINE bool lithon_SDL_AtomicDecRef(SDL_AtomicInt *a)
{
    return SDL_AtomicDecRef(a);
}

#endif /* SDL3_BINDGEN_SYS_SDL_ATOMIC_SHIMS_H */
