/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_thread.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.ThreadShims; the curated
 * layer exports them from SDL3.Sys.Thread, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_THREAD_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_THREAD_SHIMS_H

#include <SDL3/SDL_thread.h>

/**
 * Create a new thread with a default stack size.
 *
 * The SDL_CreateThread macro as a function. Like the macro, it calls
 * SDL_CreateThreadRuntime with the C runtime's thread entry and exit
 * functions for the platform it is compiled on (`_beginthreadex` and
 * `_endthreadex` on Windows, NULL elsewhere), so prefer it to calling
 * SDL_CreateThreadRuntime directly.
 *
 * This is equivalent to calling SDL_CreateThreadWithProperties with the
 * following properties set:
 *
 * - `SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER`: `fn`
 * - `SDL_PROP_THREAD_CREATE_NAME_STRING`: `name`
 * - `SDL_PROP_THREAD_CREATE_USERDATA_POINTER`: `data`
 *
 * \param fn the SDL_ThreadFunction function to call in the new thread.
 * \param name the name of the thread.
 * \param data a pointer that is passed to `fn`.
 * \returns an opaque pointer to the new thread object on success, NULL if the
 *          new thread could not be created; call SDL_GetError() for more
 *          information.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_CreateThreadWithProperties
 * \sa SDL_WaitThread
 */
static SDL_INLINE SDL_Thread *lithon_SDL_CreateThread(SDL_ThreadFunction fn, const char *name, void *data)
{
    return SDL_CreateThread(fn, name, data);
}

/**
 * Create a new thread with the specified properties.
 *
 * The SDL_CreateThreadWithProperties macro as a function, passing the C
 * runtime's thread entry and exit functions like SDL_CreateThread does.
 *
 * These are the supported properties:
 *
 * - `SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER`: an SDL_ThreadFunction
 *   value that will be called at the start of the new thread's life.
 *   Required.
 * - `SDL_PROP_THREAD_CREATE_NAME_STRING`: the name of the new thread, which
 *   might be available to debuggers. Optional, defaults to NULL.
 * - `SDL_PROP_THREAD_CREATE_USERDATA_POINTER`: an arbitrary app-defined
 *   pointer, which is passed to the entry function on the new thread, as its
 *   only parameter. Optional, defaults to NULL.
 * - `SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER`: the size, in bytes, of the new
 *   thread's stack. Optional, defaults to 0 (system-defined default).
 *
 * \param props the properties to use.
 * \returns an opaque pointer to the new thread object on success, NULL if the
 *          new thread could not be created; call SDL_GetError() for more
 *          information.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_CreateThread
 * \sa SDL_WaitThread
 */
static SDL_INLINE SDL_Thread *lithon_SDL_CreateThreadWithProperties(SDL_PropertiesID props)
{
    return SDL_CreateThreadWithProperties(props);
}

#endif /* SDL3_BINDGEN_SYS_SDL_THREAD_SHIMS_H */
