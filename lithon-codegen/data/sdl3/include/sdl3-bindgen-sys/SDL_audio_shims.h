/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_audio.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.AudioShims; the curated
 * layer exports them from SDL3.Sys.Audio, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_AUDIO_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_AUDIO_SHIMS_H

#include <SDL3/SDL_audio.h>

/**
 * Calculate the size of each audio frame (in bytes) from an SDL_AudioSpec.
 *
 * The SDL_AUDIO_FRAMESIZE macro as a function. This reports on the size of an
 * audio sample frame: stereo Sint16 data (2 channels of 2 bytes each) would
 * be 4 bytes per frame, for example.
 *
 * \param spec the SDL_AudioSpec to query.
 * \returns the number of bytes used per sample frame.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE int lithon_SDL_AUDIO_FRAMESIZE(const SDL_AudioSpec *spec)
{
    return (int)SDL_AUDIO_FRAMESIZE(*spec);
}

/**
 * Define an SDL_AudioFormat value.
 *
 * The SDL_DEFINE_AUDIO_FORMAT macro as a function. SDL does not support
 * custom audio formats, so this is not of much use externally, but it can be
 * illustrative as to what the various bits of an SDL_AudioFormat mean. For
 * example, SDL_AUDIO_S32LE is signed, littleendian, integer, 32 bits.
 *
 * \param is_signed true for signed data, false for unsigned data.
 * \param is_bigendian true for bigendian data, false for littleendian data.
 * \param is_float true for floating point data, false for integer data.
 * \param bits number of bits per sample.
 * \returns a format value in the style of SDL_AudioFormat.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE SDL_AudioFormat lithon_SDL_DEFINE_AUDIO_FORMAT(bool is_signed, bool is_bigendian, bool is_float, Uint8 bits)
{
    return (SDL_AudioFormat)SDL_DEFINE_AUDIO_FORMAT(is_signed, is_bigendian, is_float, bits);
}

#endif /* SDL3_BINDGEN_SYS_SDL_AUDIO_SHIMS_H */
