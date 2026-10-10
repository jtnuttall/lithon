/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_endian.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.EndianShims; the curated
 * layer exports them from SDL3.Sys.Endian, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_ENDIAN_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_ENDIAN_SHIMS_H

#include <SDL3/SDL_endian.h>

/**
 * Byte-swap an unsigned 16-bit number.
 *
 * The SDL_Swap16 macro as a function. It always byte-swaps the value,
 * whatever the system's byte order; SDL_Swap16LE or SDL_Swap16BE are
 * what you want in most cases.
 *
 * \param x the value to byte-swap.
 * \returns `x`, with its bytes in the opposite endian order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint16 lithon_SDL_Swap16(Uint16 x)
{
    return SDL_Swap16(x);
}

/**
 * Byte-swap an unsigned 32-bit number.
 *
 * The SDL_Swap32 macro as a function. It always byte-swaps the value,
 * whatever the system's byte order; SDL_Swap32LE or SDL_Swap32BE are
 * what you want in most cases.
 *
 * \param x the value to byte-swap.
 * \returns `x`, with its bytes in the opposite endian order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint32 lithon_SDL_Swap32(Uint32 x)
{
    return SDL_Swap32(x);
}

/**
 * Byte-swap an unsigned 64-bit number.
 *
 * The SDL_Swap64 macro as a function. It always byte-swaps the value,
 * whatever the system's byte order; SDL_Swap64LE or SDL_Swap64BE are
 * what you want in most cases.
 *
 * \param x the value to byte-swap.
 * \returns `x`, with its bytes in the opposite endian order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint64 lithon_SDL_Swap64(Uint64 x)
{
    return SDL_Swap64(x);
}

/**
 * Swap a 16-bit value from littleendian to native byte order.
 *
 * The SDL_Swap16LE macro as a function. If this is running on a
 * littleendian system, `x` is returned unchanged.
 *
 * \param x the value to swap, in littleendian byte order.
 * \returns `x` in native byte order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint16 lithon_SDL_Swap16LE(Uint16 x)
{
    return SDL_Swap16LE(x);
}

/**
 * Swap a 32-bit value from littleendian to native byte order.
 *
 * The SDL_Swap32LE macro as a function. If this is running on a
 * littleendian system, `x` is returned unchanged.
 *
 * \param x the value to swap, in littleendian byte order.
 * \returns `x` in native byte order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint32 lithon_SDL_Swap32LE(Uint32 x)
{
    return SDL_Swap32LE(x);
}

/**
 * Swap a 64-bit value from littleendian to native byte order.
 *
 * The SDL_Swap64LE macro as a function. If this is running on a
 * littleendian system, `x` is returned unchanged.
 *
 * \param x the value to swap, in littleendian byte order.
 * \returns `x` in native byte order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint64 lithon_SDL_Swap64LE(Uint64 x)
{
    return SDL_Swap64LE(x);
}

/**
 * Swap a floating point value from littleendian to native byte order.
 *
 * The SDL_SwapFloatLE macro as a function. If this is running on a
 * littleendian system, `x` is returned unchanged.
 *
 * \param x the value to swap, in littleendian byte order.
 * \returns `x` in native byte order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE float lithon_SDL_SwapFloatLE(float x)
{
    return SDL_SwapFloatLE(x);
}

/**
 * Swap a 16-bit value from bigendian to native byte order.
 *
 * The SDL_Swap16BE macro as a function. If this is running on a
 * bigendian system, `x` is returned unchanged.
 *
 * \param x the value to swap, in bigendian byte order.
 * \returns `x` in native byte order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint16 lithon_SDL_Swap16BE(Uint16 x)
{
    return SDL_Swap16BE(x);
}

/**
 * Swap a 32-bit value from bigendian to native byte order.
 *
 * The SDL_Swap32BE macro as a function. If this is running on a
 * bigendian system, `x` is returned unchanged.
 *
 * \param x the value to swap, in bigendian byte order.
 * \returns `x` in native byte order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint32 lithon_SDL_Swap32BE(Uint32 x)
{
    return SDL_Swap32BE(x);
}

/**
 * Swap a 64-bit value from bigendian to native byte order.
 *
 * The SDL_Swap64BE macro as a function. If this is running on a
 * bigendian system, `x` is returned unchanged.
 *
 * \param x the value to swap, in bigendian byte order.
 * \returns `x` in native byte order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE Uint64 lithon_SDL_Swap64BE(Uint64 x)
{
    return SDL_Swap64BE(x);
}

/**
 * Swap a floating point value from bigendian to native byte order.
 *
 * The SDL_SwapFloatBE macro as a function. If this is running on a
 * bigendian system, `x` is returned unchanged.
 *
 * \param x the value to swap, in bigendian byte order.
 * \returns `x` in native byte order.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE float lithon_SDL_SwapFloatBE(float x)
{
    return SDL_SwapFloatBE(x);
}

#endif /* SDL3_BINDGEN_SYS_SDL_ENDIAN_SHIMS_H */
