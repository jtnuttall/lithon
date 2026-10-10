/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_error.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.ErrorShims; the curated
 * layer exports them from SDL3.Sys.Error, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_ERROR_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_ERROR_SHIMS_H

#include <SDL3/SDL_error.h>

/**
 * Set the SDL error message for the current thread.
 *
 * A fixed-arity shim over the variadic SDL_SetError: `message` becomes the
 * error message verbatim. It is never parsed as a printf-style format string,
 * so a percent sign in it needs no escaping.
 *
 * Calling this function will replace any previous error message that was set.
 * It always returns false, since SDL frequently uses false to signify a
 * failing result.
 *
 * \param message the error message, in UTF-8.
 * \returns false.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_ClearError
 * \sa SDL_GetError
 */
static SDL_INLINE bool lithon_SDL_SetError(const char *message)
{
    return SDL_SetError("%s", message);
}

/**
 * Report an unsupported operation with SDL's standard error message.
 *
 * The SDL_Unsupported macro as a function: it sets the error message to
 * "That operation is not supported".
 *
 * \returns false.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_SetError
 */
static SDL_INLINE bool lithon_SDL_Unsupported(void)
{
    return SDL_Unsupported();
}

/**
 * Report an invalid parameter with SDL's standard error message.
 *
 * The SDL_InvalidParamError macro as a function: it sets the error message to
 * "Parameter 'name' is invalid", with the parameter's name in place of name.
 *
 * \param param the name of the invalid parameter, in UTF-8.
 * \returns false.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_SetError
 */
static SDL_INLINE bool lithon_SDL_InvalidParamError(const char *param)
{
    return SDL_InvalidParamError(param);
}

#endif /* SDL3_BINDGEN_SYS_SDL_ERROR_SHIMS_H */
