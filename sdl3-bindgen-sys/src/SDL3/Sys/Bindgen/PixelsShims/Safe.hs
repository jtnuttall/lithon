{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.PixelsShims.Safe (
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_DEFINE_PIXELFOURCC,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_BITSPERPIXEL,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_BYTESPERPIXEL,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISPIXELFORMAT_INDEXED,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISPIXELFORMAT_PACKED,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISPIXELFORMAT_ARRAY,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISPIXELFORMAT_10BIT,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISPIXELFORMAT_FLOAT,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISPIXELFORMAT_ALPHA,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISPIXELFORMAT_FOURCC,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_DEFINE_COLORSPACE,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_COLORSPACETYPE,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_COLORSPACERANGE,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_COLORSPACECHROMA,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_COLORSPACEPRIMARIES,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_COLORSPACETRANSFER,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_COLORSPACEMATRIX,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISCOLORSPACE_MATRIX_BT601,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISCOLORSPACE_MATRIX_BT709,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISCOLORSPACE_LIMITED_RANGE,
  SDL3.Sys.Bindgen.PixelsShims.Safe.lithon_SDL_ISCOLORSPACE_FULL_RANGE,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_pixels_shims.h>"
         , "SDL_PixelFormat hs_bindgen_b192cab03764c2e1 ("
         , "  Uint8 arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return (lithon_SDL_DEFINE_PIXELFOURCC)(arg1, arg2, arg3, arg4);"
         , "}"
         , "signed int hs_bindgen_a4f0abcc506bf978 ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_BITSPERPIXEL)(arg1);"
         , "}"
         , "signed int hs_bindgen_5c131eaf309c200d ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_BYTESPERPIXEL)(arg1);"
         , "}"
         , "_Bool hs_bindgen_be1aaf19c177faf2 ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISPIXELFORMAT_INDEXED)(arg1);"
         , "}"
         , "_Bool hs_bindgen_19c89928e52fe240 ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISPIXELFORMAT_PACKED)(arg1);"
         , "}"
         , "_Bool hs_bindgen_8a6130d233a9455e ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISPIXELFORMAT_ARRAY)(arg1);"
         , "}"
         , "_Bool hs_bindgen_a0f8823663ad05ab ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISPIXELFORMAT_10BIT)(arg1);"
         , "}"
         , "_Bool hs_bindgen_81c9e9e4c06f4a78 ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISPIXELFORMAT_FLOAT)(arg1);"
         , "}"
         , "_Bool hs_bindgen_df30b4ff6241b8b6 ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISPIXELFORMAT_ALPHA)(arg1);"
         , "}"
         , "_Bool hs_bindgen_a7acd220c6e54cbc ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISPIXELFORMAT_FOURCC)(arg1);"
         , "}"
         , "SDL_Colorspace hs_bindgen_bf76f3e21f5375a4 ("
         , "  SDL_ColorType arg1,"
         , "  SDL_ColorRange arg2,"
         , "  SDL_ColorPrimaries arg3,"
         , "  SDL_TransferCharacteristics arg4,"
         , "  SDL_MatrixCoefficients arg5,"
         , "  SDL_ChromaLocation arg6"
         , ")"
         , "{"
         , "  return (lithon_SDL_DEFINE_COLORSPACE)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "SDL_ColorType hs_bindgen_abcb71a974a5118e ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_COLORSPACETYPE)(arg1);"
         , "}"
         , "SDL_ColorRange hs_bindgen_b404db6ea9c956f4 ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_COLORSPACERANGE)(arg1);"
         , "}"
         , "SDL_ChromaLocation hs_bindgen_85a8a2787cfde705 ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_COLORSPACECHROMA)(arg1);"
         , "}"
         , "SDL_ColorPrimaries hs_bindgen_c0cba15c17cb33a3 ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_COLORSPACEPRIMARIES)(arg1);"
         , "}"
         , "SDL_TransferCharacteristics hs_bindgen_1766e3533e88fef4 ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_COLORSPACETRANSFER)(arg1);"
         , "}"
         , "SDL_MatrixCoefficients hs_bindgen_90bb9f433edfb41b ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_COLORSPACEMATRIX)(arg1);"
         , "}"
         , "_Bool hs_bindgen_75755e542106ef65 ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISCOLORSPACE_MATRIX_BT601)(arg1);"
         , "}"
         , "_Bool hs_bindgen_247507d4bca66916 ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISCOLORSPACE_MATRIX_BT709)(arg1);"
         , "}"
         , "_Bool hs_bindgen_216b6dfca1726094 ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL)(arg1);"
         , "}"
         , "_Bool hs_bindgen_216de31f27dc949d ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISCOLORSPACE_LIMITED_RANGE)(arg1);"
         , "}"
         , "_Bool hs_bindgen_1809e1c7eb4f1879 ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_ISCOLORSPACE_FULL_RANGE)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_DEFINE_PIXELFOURCC@
foreign import ccall safe "hs_bindgen_b192cab03764c2e1"
  hs_bindgen_b192cab03764c2e1_base
    :: HsBindgen.Runtime.LibC.Word8
    -> HsBindgen.Runtime.LibC.Word8
    -> HsBindgen.Runtime.LibC.Word8
    -> HsBindgen.Runtime.LibC.Word8
    -> IO HsBindgen.Runtime.Support.CUInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_DEFINE_PIXELFOURCC@
hs_bindgen_b192cab03764c2e1
  :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
hs_bindgen_b192cab03764c2e1 =
  \x0 ->
    \x1 ->
      \x2 ->
        \x3 ->
          fmap
            BG.fromFFIType
            ( hs_bindgen_b192cab03764c2e1_base
                (BG.toFFIType x0)
                (BG.toFFIType x1)
                (BG.toFFIType x2)
                (BG.toFFIType x3)
            )

-- | Define a custom FourCC pixel format.
--
--     The SDL_DEFINE_PIXELFOURCC macro as a function. SDL_PIXELFORMAT_YV12, for example, is the code of the characters Y, V, 1, 2.
--
--     [Returns]: a format value in the style of SDL_PixelFormat.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_FOURCC
--
--     [C declaration]: @lithon_SDL_DEFINE_PIXELFOURCC@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 42:35@
lithon_SDL_DEFINE_PIXELFOURCC
  :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@a@]: the first character of the FourCC code.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: the second character of the FourCC code.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@c@]: the third character of the FourCC code.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@d@]: the fourth character of the FourCC code.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
lithon_SDL_DEFINE_PIXELFOURCC =
  hs_bindgen_b192cab03764c2e1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_BITSPERPIXEL@
foreign import ccall safe "hs_bindgen_a4f0abcc506bf978"
  hs_bindgen_a4f0abcc506bf978_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_BITSPERPIXEL@
hs_bindgen_a4f0abcc506bf978
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO BG.CInt
hs_bindgen_a4f0abcc506bf978 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_a4f0abcc506bf978_base (BG.toFFIType x0))

-- | Determine an SDL_PixelFormat\'s bits per pixel.
--
--     The SDL_BITSPERPIXEL macro as a function. FourCC formats report zero here, as it rarely makes sense to measure them per-pixel.
--
--     [Returns]: the bits-per-pixel of @format@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_BYTESPERPIXEL
--
--     [C declaration]: @lithon_SDL_BITSPERPIXEL@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 62:23@
lithon_SDL_BITSPERPIXEL
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: an SDL_PixelFormat to check.
  -> IO BG.CInt
lithon_SDL_BITSPERPIXEL = hs_bindgen_a4f0abcc506bf978

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_BYTESPERPIXEL@
foreign import ccall safe "hs_bindgen_5c131eaf309c200d"
  hs_bindgen_5c131eaf309c200d_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_BYTESPERPIXEL@
hs_bindgen_5c131eaf309c200d
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO BG.CInt
hs_bindgen_5c131eaf309c200d =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_5c131eaf309c200d_base (BG.toFFIType x0))

-- | Determine an SDL_PixelFormat\'s bytes per pixel.
--
--     The SDL_BYTESPERPIXEL macro as a function. FourCC formats do their best here, but many of them don\'t have a meaningful measurement of bytes per pixel.
--
--     [Returns]: the bytes-per-pixel of @format@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_BITSPERPIXEL
--
--     [C declaration]: @lithon_SDL_BYTESPERPIXEL@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 83:23@
lithon_SDL_BYTESPERPIXEL
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: an SDL_PixelFormat to check.
  -> IO BG.CInt
lithon_SDL_BYTESPERPIXEL =
  hs_bindgen_5c131eaf309c200d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_INDEXED@
foreign import ccall safe "hs_bindgen_be1aaf19c177faf2"
  hs_bindgen_be1aaf19c177faf2_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_INDEXED@
hs_bindgen_be1aaf19c177faf2
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO BG.CBool
hs_bindgen_be1aaf19c177faf2 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_be1aaf19c177faf2_base (BG.toFFIType x0))

-- | Determine if an SDL_PixelFormat is an indexed format.
--
--     The SDL_ISPIXELFORMAT_INDEXED macro as a function.
--
--     [Returns]: true if the format is indexed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_INDEXED@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 100:24@
lithon_SDL_ISPIXELFORMAT_INDEXED
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: an SDL_PixelFormat to check.
  -> IO BG.CBool
lithon_SDL_ISPIXELFORMAT_INDEXED =
  hs_bindgen_be1aaf19c177faf2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_PACKED@
foreign import ccall safe "hs_bindgen_19c89928e52fe240"
  hs_bindgen_19c89928e52fe240_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_PACKED@
hs_bindgen_19c89928e52fe240
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO BG.CBool
hs_bindgen_19c89928e52fe240 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_19c89928e52fe240_base (BG.toFFIType x0))

-- | Determine if an SDL_PixelFormat is a packed format.
--
--     The SDL_ISPIXELFORMAT_PACKED macro as a function.
--
--     [Returns]: true if the format is packed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_PACKED@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 117:24@
lithon_SDL_ISPIXELFORMAT_PACKED
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: an SDL_PixelFormat to check.
  -> IO BG.CBool
lithon_SDL_ISPIXELFORMAT_PACKED =
  hs_bindgen_19c89928e52fe240

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_ARRAY@
foreign import ccall safe "hs_bindgen_8a6130d233a9455e"
  hs_bindgen_8a6130d233a9455e_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_ARRAY@
hs_bindgen_8a6130d233a9455e
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO BG.CBool
hs_bindgen_8a6130d233a9455e =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_8a6130d233a9455e_base (BG.toFFIType x0))

-- | Determine if an SDL_PixelFormat is an array format.
--
--     The SDL_ISPIXELFORMAT_ARRAY macro as a function.
--
--     [Returns]: true if the format is an array, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_ARRAY@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 134:24@
lithon_SDL_ISPIXELFORMAT_ARRAY
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: an SDL_PixelFormat to check.
  -> IO BG.CBool
lithon_SDL_ISPIXELFORMAT_ARRAY =
  hs_bindgen_8a6130d233a9455e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_10BIT@
foreign import ccall safe "hs_bindgen_a0f8823663ad05ab"
  hs_bindgen_a0f8823663ad05ab_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_10BIT@
hs_bindgen_a0f8823663ad05ab
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO BG.CBool
hs_bindgen_a0f8823663ad05ab =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_a0f8823663ad05ab_base (BG.toFFIType x0))

-- | Determine if an SDL_PixelFormat is a 10-bit format.
--
--     The SDL_ISPIXELFORMAT_10BIT macro as a function.
--
--     [Returns]: true if the format is 10-bit, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_10BIT@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 151:24@
lithon_SDL_ISPIXELFORMAT_10BIT
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: an SDL_PixelFormat to check.
  -> IO BG.CBool
lithon_SDL_ISPIXELFORMAT_10BIT =
  hs_bindgen_a0f8823663ad05ab

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_FLOAT@
foreign import ccall safe "hs_bindgen_81c9e9e4c06f4a78"
  hs_bindgen_81c9e9e4c06f4a78_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_FLOAT@
hs_bindgen_81c9e9e4c06f4a78
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO BG.CBool
hs_bindgen_81c9e9e4c06f4a78 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_81c9e9e4c06f4a78_base (BG.toFFIType x0))

-- | Determine if an SDL_PixelFormat is a floating point format.
--
--     The SDL_ISPIXELFORMAT_FLOAT macro as a function.
--
--     [Returns]: true if the format is a floating point, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_FLOAT@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 168:24@
lithon_SDL_ISPIXELFORMAT_FLOAT
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: an SDL_PixelFormat to check.
  -> IO BG.CBool
lithon_SDL_ISPIXELFORMAT_FLOAT =
  hs_bindgen_81c9e9e4c06f4a78

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_ALPHA@
foreign import ccall safe "hs_bindgen_df30b4ff6241b8b6"
  hs_bindgen_df30b4ff6241b8b6_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_ALPHA@
hs_bindgen_df30b4ff6241b8b6
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO BG.CBool
hs_bindgen_df30b4ff6241b8b6 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_df30b4ff6241b8b6_base (BG.toFFIType x0))

-- | Determine if an SDL_PixelFormat has an alpha channel.
--
--     The SDL_ISPIXELFORMAT_ALPHA macro as a function.
--
--     [Returns]: true if the format has alpha, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_ALPHA@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 185:24@
lithon_SDL_ISPIXELFORMAT_ALPHA
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: an SDL_PixelFormat to check.
  -> IO BG.CBool
lithon_SDL_ISPIXELFORMAT_ALPHA =
  hs_bindgen_df30b4ff6241b8b6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_FOURCC@
foreign import ccall safe "hs_bindgen_a7acd220c6e54cbc"
  hs_bindgen_a7acd220c6e54cbc_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISPIXELFORMAT_FOURCC@
hs_bindgen_a7acd220c6e54cbc
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -> IO BG.CBool
hs_bindgen_a7acd220c6e54cbc =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_a7acd220c6e54cbc_base (BG.toFFIType x0))

-- | Determine if an SDL_PixelFormat is a \"FourCC\" format.
--
--     The SDL_ISPIXELFORMAT_FOURCC macro as a function. This covers custom and other unusual formats.
--
--     [Returns]: true if the format is a FourCC format, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_FOURCC@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 202:24@
lithon_SDL_ISPIXELFORMAT_FOURCC
  :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^
  --
  --           [@format@]: an SDL_PixelFormat to check.
  -> IO BG.CBool
lithon_SDL_ISPIXELFORMAT_FOURCC =
  hs_bindgen_a7acd220c6e54cbc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_DEFINE_COLORSPACE@
foreign import ccall safe "hs_bindgen_bf76f3e21f5375a4"
  hs_bindgen_bf76f3e21f5375a4_base
    :: HsBindgen.Runtime.Support.CUInt
    -> HsBindgen.Runtime.Support.CUInt
    -> HsBindgen.Runtime.Support.CUInt
    -> HsBindgen.Runtime.Support.CUInt
    -> HsBindgen.Runtime.Support.CUInt
    -> HsBindgen.Runtime.Support.CUInt
    -> IO HsBindgen.Runtime.Support.CUInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_DEFINE_COLORSPACE@
hs_bindgen_bf76f3e21f5375a4
  :: SDL3.Sys.Bindgen.Pixels.SDL_ColorType
  -> SDL3.Sys.Bindgen.Pixels.SDL_ColorRange
  -> SDL3.Sys.Bindgen.Pixels.SDL_ColorPrimaries
  -> SDL3.Sys.Bindgen.Pixels.SDL_TransferCharacteristics
  -> SDL3.Sys.Bindgen.Pixels.SDL_MatrixCoefficients
  -> SDL3.Sys.Bindgen.Pixels.SDL_ChromaLocation
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
hs_bindgen_bf76f3e21f5375a4 =
  \x0 ->
    \x1 ->
      \x2 ->
        \x3 ->
          \x4 ->
            \x5 ->
              fmap
                BG.fromFFIType
                ( hs_bindgen_bf76f3e21f5375a4_base
                    (BG.toFFIType x0)
                    (BG.toFFIType x1)
                    (BG.toFFIType x2)
                    (BG.toFFIType x3)
                    (BG.toFFIType x4)
                    (BG.toFFIType x5)
                )

-- | Define a custom colorspace.
--
--     The SDL_DEFINE_COLORSPACE macro as a function.
--
--     [Returns]: a format value in the style of SDL_Colorspace.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_DEFINE_COLORSPACE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 224:34@
lithon_SDL_DEFINE_COLORSPACE
  :: SDL3.Sys.Bindgen.Pixels.SDL_ColorType
  -- ^
  --
  --           [@type@]: the type of the new format.
  -> SDL3.Sys.Bindgen.Pixels.SDL_ColorRange
  -- ^
  --
  --           [@range@]: the range of the new format.
  -> SDL3.Sys.Bindgen.Pixels.SDL_ColorPrimaries
  -- ^
  --
  --           [@primaries@]: the primaries of the new format.
  -> SDL3.Sys.Bindgen.Pixels.SDL_TransferCharacteristics
  -- ^
  --
  --           [@transfer@]: the transfer characteristics of the new format.
  -> SDL3.Sys.Bindgen.Pixels.SDL_MatrixCoefficients
  -- ^
  --
  --           [@matrix@]: the matrix coefficients of the new format.
  -> SDL3.Sys.Bindgen.Pixels.SDL_ChromaLocation
  -- ^
  --
  --           [@chroma@]: the chroma sample location of the new format.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
lithon_SDL_DEFINE_COLORSPACE =
  hs_bindgen_bf76f3e21f5375a4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACETYPE@
foreign import ccall safe "hs_bindgen_abcb71a974a5118e"
  hs_bindgen_abcb71a974a5118e_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO HsBindgen.Runtime.Support.CUInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACETYPE@
hs_bindgen_abcb71a974a5118e
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorType
hs_bindgen_abcb71a974a5118e =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_abcb71a974a5118e_base (BG.toFFIType x0))

-- | Retrieve the type of an SDL_Colorspace.
--
--     The SDL_COLORSPACETYPE macro as a function.
--
--     [Returns]: the SDL_ColorType of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACETYPE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 241:33@
lithon_SDL_COLORSPACETYPE
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorType
lithon_SDL_COLORSPACETYPE =
  hs_bindgen_abcb71a974a5118e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACERANGE@
foreign import ccall safe "hs_bindgen_b404db6ea9c956f4"
  hs_bindgen_b404db6ea9c956f4_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO HsBindgen.Runtime.Support.CUInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACERANGE@
hs_bindgen_b404db6ea9c956f4
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorRange
hs_bindgen_b404db6ea9c956f4 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_b404db6ea9c956f4_base (BG.toFFIType x0))

-- | Retrieve the range of an SDL_Colorspace.
--
--     The SDL_COLORSPACERANGE macro as a function.
--
--     [Returns]: the SDL_ColorRange of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACERANGE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 258:34@
lithon_SDL_COLORSPACERANGE
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorRange
lithon_SDL_COLORSPACERANGE =
  hs_bindgen_b404db6ea9c956f4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACECHROMA@
foreign import ccall safe "hs_bindgen_85a8a2787cfde705"
  hs_bindgen_85a8a2787cfde705_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO HsBindgen.Runtime.Support.CUInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACECHROMA@
hs_bindgen_85a8a2787cfde705
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_ChromaLocation
hs_bindgen_85a8a2787cfde705 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_85a8a2787cfde705_base (BG.toFFIType x0))

-- | Retrieve the chroma sample location of an SDL_Colorspace.
--
--     The SDL_COLORSPACECHROMA macro as a function.
--
--     [Returns]: the SDL_ChromaLocation of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACECHROMA@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 275:38@
lithon_SDL_COLORSPACECHROMA
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_ChromaLocation
lithon_SDL_COLORSPACECHROMA =
  hs_bindgen_85a8a2787cfde705

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACEPRIMARIES@
foreign import ccall safe "hs_bindgen_c0cba15c17cb33a3"
  hs_bindgen_c0cba15c17cb33a3_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO HsBindgen.Runtime.Support.CUInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACEPRIMARIES@
hs_bindgen_c0cba15c17cb33a3
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorPrimaries
hs_bindgen_c0cba15c17cb33a3 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_c0cba15c17cb33a3_base (BG.toFFIType x0))

-- | Retrieve the primaries of an SDL_Colorspace.
--
--     The SDL_COLORSPACEPRIMARIES macro as a function.
--
--     [Returns]: the SDL_ColorPrimaries of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACEPRIMARIES@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 292:38@
lithon_SDL_COLORSPACEPRIMARIES
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorPrimaries
lithon_SDL_COLORSPACEPRIMARIES =
  hs_bindgen_c0cba15c17cb33a3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACETRANSFER@
foreign import ccall safe "hs_bindgen_1766e3533e88fef4"
  hs_bindgen_1766e3533e88fef4_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO HsBindgen.Runtime.Support.CUInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACETRANSFER@
hs_bindgen_1766e3533e88fef4
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_TransferCharacteristics
hs_bindgen_1766e3533e88fef4 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_1766e3533e88fef4_base (BG.toFFIType x0))

-- | Retrieve the transfer characteristics of an SDL_Colorspace.
--
--     The SDL_COLORSPACETRANSFER macro as a function.
--
--     [Returns]: the SDL_TransferCharacteristics of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACETRANSFER@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 309:47@
lithon_SDL_COLORSPACETRANSFER
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_TransferCharacteristics
lithon_SDL_COLORSPACETRANSFER =
  hs_bindgen_1766e3533e88fef4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACEMATRIX@
foreign import ccall safe "hs_bindgen_90bb9f433edfb41b"
  hs_bindgen_90bb9f433edfb41b_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO HsBindgen.Runtime.Support.CUInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_COLORSPACEMATRIX@
hs_bindgen_90bb9f433edfb41b
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_MatrixCoefficients
hs_bindgen_90bb9f433edfb41b =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_90bb9f433edfb41b_base (BG.toFFIType x0))

-- | Retrieve the matrix coefficients of an SDL_Colorspace.
--
--     The SDL_COLORSPACEMATRIX macro as a function.
--
--     [Returns]: the SDL_MatrixCoefficients of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACEMATRIX@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 326:42@
lithon_SDL_COLORSPACEMATRIX
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO SDL3.Sys.Bindgen.Pixels.SDL_MatrixCoefficients
lithon_SDL_COLORSPACEMATRIX =
  hs_bindgen_90bb9f433edfb41b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_MATRIX_BT601@
foreign import ccall safe "hs_bindgen_75755e542106ef65"
  hs_bindgen_75755e542106ef65_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_MATRIX_BT601@
hs_bindgen_75755e542106ef65
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO BG.CBool
hs_bindgen_75755e542106ef65 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_75755e542106ef65_base (BG.toFFIType x0))

-- | Determine if an SDL_Colorspace uses BT601 (or BT470BG) matrix coefficients.
--
--     The SDL_ISCOLORSPACE_MATRIX_BT601 macro as a function.
--
--     [Returns]: true if BT601 or BT470BG, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_MATRIX_BT601@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 343:24@
lithon_SDL_ISCOLORSPACE_MATRIX_BT601
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO BG.CBool
lithon_SDL_ISCOLORSPACE_MATRIX_BT601 =
  hs_bindgen_75755e542106ef65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_MATRIX_BT709@
foreign import ccall safe "hs_bindgen_247507d4bca66916"
  hs_bindgen_247507d4bca66916_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_MATRIX_BT709@
hs_bindgen_247507d4bca66916
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO BG.CBool
hs_bindgen_247507d4bca66916 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_247507d4bca66916_base (BG.toFFIType x0))

-- | Determine if an SDL_Colorspace uses BT709 matrix coefficients.
--
--     The SDL_ISCOLORSPACE_MATRIX_BT709 macro as a function.
--
--     [Returns]: true if BT709, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_MATRIX_BT709@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 360:24@
lithon_SDL_ISCOLORSPACE_MATRIX_BT709
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO BG.CBool
lithon_SDL_ISCOLORSPACE_MATRIX_BT709 =
  hs_bindgen_247507d4bca66916

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL@
foreign import ccall safe "hs_bindgen_216b6dfca1726094"
  hs_bindgen_216b6dfca1726094_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL@
hs_bindgen_216b6dfca1726094
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO BG.CBool
hs_bindgen_216b6dfca1726094 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_216b6dfca1726094_base (BG.toFFIType x0))

-- | Determine if an SDL_Colorspace uses BT2020_NCL matrix coefficients.
--
--     The SDL_ISCOLORSPACE_MATRIX_BT2020_NCL macro as a function.
--
--     [Returns]: true if BT2020_NCL, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 377:24@
lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO BG.CBool
lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL =
  hs_bindgen_216b6dfca1726094

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_LIMITED_RANGE@
foreign import ccall safe "hs_bindgen_216de31f27dc949d"
  hs_bindgen_216de31f27dc949d_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_LIMITED_RANGE@
hs_bindgen_216de31f27dc949d
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO BG.CBool
hs_bindgen_216de31f27dc949d =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_216de31f27dc949d_base (BG.toFFIType x0))

-- | Determine if an SDL_Colorspace has a limited range.
--
--     The SDL_ISCOLORSPACE_LIMITED_RANGE macro as a function.
--
--     [Returns]: true if limited range, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_LIMITED_RANGE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 394:24@
lithon_SDL_ISCOLORSPACE_LIMITED_RANGE
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO BG.CBool
lithon_SDL_ISCOLORSPACE_LIMITED_RANGE =
  hs_bindgen_216de31f27dc949d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_FULL_RANGE@
foreign import ccall safe "hs_bindgen_1809e1c7eb4f1879"
  hs_bindgen_1809e1c7eb4f1879_base
    :: HsBindgen.Runtime.Support.CUInt
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_Safe_lithon_SDL_ISCOLORSPACE_FULL_RANGE@
hs_bindgen_1809e1c7eb4f1879
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -> IO BG.CBool
hs_bindgen_1809e1c7eb4f1879 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_1809e1c7eb4f1879_base (BG.toFFIType x0))

-- | Determine if an SDL_Colorspace has a full range.
--
--     The SDL_ISCOLORSPACE_FULL_RANGE macro as a function.
--
--     [Returns]: true if full range, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_FULL_RANGE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 411:24@
lithon_SDL_ISCOLORSPACE_FULL_RANGE
  :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^
  --
  --           [@cspace@]: an SDL_Colorspace to check.
  -> IO BG.CBool
lithon_SDL_ISCOLORSPACE_FULL_RANGE =
  hs_bindgen_1809e1c7eb4f1879
