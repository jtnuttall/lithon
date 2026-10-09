/*
 * sdl3-bindgen-sys C shims for <SDL3/SDL_pixels.h>: fixed-arity functions over
 * what Haskell's FFI cannot call (SDL's variadic functions and function-like
 * macros). hs-bindgen binds them into SDL3.Sys.Bindgen.PixelsShims; the curated
 * layer exports them from SDL3.Sys.Pixels, under "C shims".
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

#ifndef SDL3_BINDGEN_SYS_SDL_PIXELS_SHIMS_H
#define SDL3_BINDGEN_SYS_SDL_PIXELS_SHIMS_H

#include <SDL3/SDL_pixels.h>

/**
 * Define a custom FourCC pixel format.
 *
 * The SDL_DEFINE_PIXELFOURCC macro as a function. SDL_PIXELFORMAT_YV12, for
 * example, is the code of the characters Y, V, 1, 2.
 *
 * \param a the first character of the FourCC code.
 * \param b the second character of the FourCC code.
 * \param c the third character of the FourCC code.
 * \param d the fourth character of the FourCC code.
 * \returns a format value in the style of SDL_PixelFormat.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_FOURCC
 */
static SDL_INLINE SDL_PixelFormat lithon_SDL_DEFINE_PIXELFOURCC(Uint8 a, Uint8 b, Uint8 c, Uint8 d)
{
    return (SDL_PixelFormat)SDL_DEFINE_PIXELFOURCC(a, b, c, d);
}

/**
 * Determine an SDL_PixelFormat's bits per pixel.
 *
 * The SDL_BITSPERPIXEL macro as a function. FourCC formats report zero here,
 * as it rarely makes sense to measure them per-pixel.
 *
 * \param format an SDL_PixelFormat to check.
 * \returns the bits-per-pixel of `format`.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_BYTESPERPIXEL
 */
static SDL_INLINE int lithon_SDL_BITSPERPIXEL(SDL_PixelFormat format)
{
    return (int)SDL_BITSPERPIXEL(format);
}

/**
 * Determine an SDL_PixelFormat's bytes per pixel.
 *
 * The SDL_BYTESPERPIXEL macro as a function. FourCC formats do their best
 * here, but many of them don't have a meaningful measurement of bytes per
 * pixel.
 *
 * \param format an SDL_PixelFormat to check.
 * \returns the bytes-per-pixel of `format`.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 *
 * \sa SDL_BITSPERPIXEL
 */
static SDL_INLINE int lithon_SDL_BYTESPERPIXEL(SDL_PixelFormat format)
{
    return (int)SDL_BYTESPERPIXEL(format);
}

/**
 * Determine if an SDL_PixelFormat is an indexed format.
 *
 * The SDL_ISPIXELFORMAT_INDEXED macro as a function.
 *
 * \param format an SDL_PixelFormat to check.
 * \returns true if the format is indexed, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISPIXELFORMAT_INDEXED(SDL_PixelFormat format)
{
    return SDL_ISPIXELFORMAT_INDEXED(format);
}

/**
 * Determine if an SDL_PixelFormat is a packed format.
 *
 * The SDL_ISPIXELFORMAT_PACKED macro as a function.
 *
 * \param format an SDL_PixelFormat to check.
 * \returns true if the format is packed, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISPIXELFORMAT_PACKED(SDL_PixelFormat format)
{
    return SDL_ISPIXELFORMAT_PACKED(format);
}

/**
 * Determine if an SDL_PixelFormat is an array format.
 *
 * The SDL_ISPIXELFORMAT_ARRAY macro as a function.
 *
 * \param format an SDL_PixelFormat to check.
 * \returns true if the format is an array, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISPIXELFORMAT_ARRAY(SDL_PixelFormat format)
{
    return SDL_ISPIXELFORMAT_ARRAY(format);
}

/**
 * Determine if an SDL_PixelFormat is a 10-bit format.
 *
 * The SDL_ISPIXELFORMAT_10BIT macro as a function.
 *
 * \param format an SDL_PixelFormat to check.
 * \returns true if the format is 10-bit, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISPIXELFORMAT_10BIT(SDL_PixelFormat format)
{
    return SDL_ISPIXELFORMAT_10BIT(format);
}

/**
 * Determine if an SDL_PixelFormat is a floating point format.
 *
 * The SDL_ISPIXELFORMAT_FLOAT macro as a function.
 *
 * \param format an SDL_PixelFormat to check.
 * \returns true if the format is a floating point, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISPIXELFORMAT_FLOAT(SDL_PixelFormat format)
{
    return SDL_ISPIXELFORMAT_FLOAT(format);
}

/**
 * Determine if an SDL_PixelFormat has an alpha channel.
 *
 * The SDL_ISPIXELFORMAT_ALPHA macro as a function.
 *
 * \param format an SDL_PixelFormat to check.
 * \returns true if the format has alpha, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISPIXELFORMAT_ALPHA(SDL_PixelFormat format)
{
    return SDL_ISPIXELFORMAT_ALPHA(format);
}

/**
 * Determine if an SDL_PixelFormat is a "FourCC" format.
 *
 * The SDL_ISPIXELFORMAT_FOURCC macro as a function. This covers custom and other unusual formats.
 *
 * \param format an SDL_PixelFormat to check.
 * \returns true if the format is a FourCC format, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISPIXELFORMAT_FOURCC(SDL_PixelFormat format)
{
    return SDL_ISPIXELFORMAT_FOURCC(format);
}

/**
 * Define a custom colorspace.
 *
 * The SDL_DEFINE_COLORSPACE macro as a function.
 *
 * \param type the type of the new format.
 * \param range the range of the new format.
 * \param primaries the primaries of the new format.
 * \param transfer the transfer characteristics of the new format.
 * \param matrix the matrix coefficients of the new format.
 * \param chroma the chroma sample location of the new format.
 * \returns a format value in the style of SDL_Colorspace.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE SDL_Colorspace lithon_SDL_DEFINE_COLORSPACE(SDL_ColorType type, SDL_ColorRange range, SDL_ColorPrimaries primaries, SDL_TransferCharacteristics transfer, SDL_MatrixCoefficients matrix, SDL_ChromaLocation chroma)
{
    return (SDL_Colorspace)SDL_DEFINE_COLORSPACE(type, range, primaries, transfer, matrix, chroma);
}

/**
 * Retrieve the type of an SDL_Colorspace.
 *
 * The SDL_COLORSPACETYPE macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns the SDL_ColorType of `cspace`.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE SDL_ColorType lithon_SDL_COLORSPACETYPE(SDL_Colorspace cspace)
{
    return SDL_COLORSPACETYPE(cspace);
}

/**
 * Retrieve the range of an SDL_Colorspace.
 *
 * The SDL_COLORSPACERANGE macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns the SDL_ColorRange of `cspace`.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE SDL_ColorRange lithon_SDL_COLORSPACERANGE(SDL_Colorspace cspace)
{
    return SDL_COLORSPACERANGE(cspace);
}

/**
 * Retrieve the chroma sample location of an SDL_Colorspace.
 *
 * The SDL_COLORSPACECHROMA macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns the SDL_ChromaLocation of `cspace`.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE SDL_ChromaLocation lithon_SDL_COLORSPACECHROMA(SDL_Colorspace cspace)
{
    return SDL_COLORSPACECHROMA(cspace);
}

/**
 * Retrieve the primaries of an SDL_Colorspace.
 *
 * The SDL_COLORSPACEPRIMARIES macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns the SDL_ColorPrimaries of `cspace`.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE SDL_ColorPrimaries lithon_SDL_COLORSPACEPRIMARIES(SDL_Colorspace cspace)
{
    return SDL_COLORSPACEPRIMARIES(cspace);
}

/**
 * Retrieve the transfer characteristics of an SDL_Colorspace.
 *
 * The SDL_COLORSPACETRANSFER macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns the SDL_TransferCharacteristics of `cspace`.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE SDL_TransferCharacteristics lithon_SDL_COLORSPACETRANSFER(SDL_Colorspace cspace)
{
    return SDL_COLORSPACETRANSFER(cspace);
}

/**
 * Retrieve the matrix coefficients of an SDL_Colorspace.
 *
 * The SDL_COLORSPACEMATRIX macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns the SDL_MatrixCoefficients of `cspace`.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE SDL_MatrixCoefficients lithon_SDL_COLORSPACEMATRIX(SDL_Colorspace cspace)
{
    return SDL_COLORSPACEMATRIX(cspace);
}

/**
 * Determine if an SDL_Colorspace uses BT601 (or BT470BG) matrix coefficients.
 *
 * The SDL_ISCOLORSPACE_MATRIX_BT601 macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns true if BT601 or BT470BG, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISCOLORSPACE_MATRIX_BT601(SDL_Colorspace cspace)
{
    return SDL_ISCOLORSPACE_MATRIX_BT601(cspace);
}

/**
 * Determine if an SDL_Colorspace uses BT709 matrix coefficients.
 *
 * The SDL_ISCOLORSPACE_MATRIX_BT709 macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns true if BT709, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISCOLORSPACE_MATRIX_BT709(SDL_Colorspace cspace)
{
    return SDL_ISCOLORSPACE_MATRIX_BT709(cspace);
}

/**
 * Determine if an SDL_Colorspace uses BT2020_NCL matrix coefficients.
 *
 * The SDL_ISCOLORSPACE_MATRIX_BT2020_NCL macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns true if BT2020_NCL, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL(SDL_Colorspace cspace)
{
    return SDL_ISCOLORSPACE_MATRIX_BT2020_NCL(cspace);
}

/**
 * Determine if an SDL_Colorspace has a limited range.
 *
 * The SDL_ISCOLORSPACE_LIMITED_RANGE macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns true if limited range, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISCOLORSPACE_LIMITED_RANGE(SDL_Colorspace cspace)
{
    return SDL_ISCOLORSPACE_LIMITED_RANGE(cspace);
}

/**
 * Determine if an SDL_Colorspace has a full range.
 *
 * The SDL_ISCOLORSPACE_FULL_RANGE macro as a function.
 *
 * \param cspace an SDL_Colorspace to check.
 * \returns true if full range, false otherwise.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This function is available since SDL 3.2.0.
 */
static SDL_INLINE bool lithon_SDL_ISCOLORSPACE_FULL_RANGE(SDL_Colorspace cspace)
{
    return SDL_ISCOLORSPACE_FULL_RANGE(cspace);
}

#endif /* SDL3_BINDGEN_SYS_SDL_PIXELS_SHIMS_H */
