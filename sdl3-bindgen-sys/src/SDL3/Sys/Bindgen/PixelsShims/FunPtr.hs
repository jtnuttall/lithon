{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.PixelsShims.FunPtr (
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_DEFINE_PIXELFOURCC,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_BITSPERPIXEL,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_BYTESPERPIXEL,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISPIXELFORMAT_INDEXED,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISPIXELFORMAT_PACKED,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISPIXELFORMAT_ARRAY,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISPIXELFORMAT_10BIT,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISPIXELFORMAT_FLOAT,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISPIXELFORMAT_ALPHA,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISPIXELFORMAT_FOURCC,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_DEFINE_COLORSPACE,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_COLORSPACETYPE,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_COLORSPACERANGE,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_COLORSPACECHROMA,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_COLORSPACEPRIMARIES,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_COLORSPACETRANSFER,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_COLORSPACEMATRIX,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISCOLORSPACE_MATRIX_BT601,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISCOLORSPACE_MATRIX_BT709,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISCOLORSPACE_LIMITED_RANGE,
  SDL3.Sys.Bindgen.PixelsShims.FunPtr.lithon_SDL_ISCOLORSPACE_FULL_RANGE,
)
where

import Prelude (IO, fmap)

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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_DEFINE_PIXELFOURCC */"
         , "__attribute__ ((const))"
         , "SDL_PixelFormat (*hs_bindgen_75756731ebd56d6c (void)) ("
         , "  Uint8 arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return &lithon_SDL_DEFINE_PIXELFOURCC;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_BITSPERPIXEL */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_a8b5b5932ddbfc3b (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_BITSPERPIXEL;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_BYTESPERPIXEL */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_fef9e1bbde9ec790 (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_BYTESPERPIXEL;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_INDEXED */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b117a24f410fe873 (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISPIXELFORMAT_INDEXED;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_PACKED */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9046eeb0267300bc (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISPIXELFORMAT_PACKED;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_ARRAY */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5c10de6b0f11eb45 (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISPIXELFORMAT_ARRAY;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_10BIT */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f7e465ad660e31bf (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISPIXELFORMAT_10BIT;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_FLOAT */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_032856c3c3b017c5 (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISPIXELFORMAT_FLOAT;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_ALPHA */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6c426e1aa20f7341 (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISPIXELFORMAT_ALPHA;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_FOURCC */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d08bb623c3ebc165 (void)) ("
         , "  SDL_PixelFormat arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISPIXELFORMAT_FOURCC;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_DEFINE_COLORSPACE */"
         , "__attribute__ ((const))"
         , "SDL_Colorspace (*hs_bindgen_e6f658b2c26218e1 (void)) ("
         , "  SDL_ColorType arg1,"
         , "  SDL_ColorRange arg2,"
         , "  SDL_ColorPrimaries arg3,"
         , "  SDL_TransferCharacteristics arg4,"
         , "  SDL_MatrixCoefficients arg5,"
         , "  SDL_ChromaLocation arg6"
         , ")"
         , "{"
         , "  return &lithon_SDL_DEFINE_COLORSPACE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACETYPE */"
         , "__attribute__ ((const))"
         , "SDL_ColorType (*hs_bindgen_eec66aaad367649c (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_COLORSPACETYPE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACERANGE */"
         , "__attribute__ ((const))"
         , "SDL_ColorRange (*hs_bindgen_80876d9836c72ca7 (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_COLORSPACERANGE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACECHROMA */"
         , "__attribute__ ((const))"
         , "SDL_ChromaLocation (*hs_bindgen_72559431bdc72d6f (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_COLORSPACECHROMA;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACEPRIMARIES */"
         , "__attribute__ ((const))"
         , "SDL_ColorPrimaries (*hs_bindgen_38530fb5411bf69a (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_COLORSPACEPRIMARIES;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACETRANSFER */"
         , "__attribute__ ((const))"
         , "SDL_TransferCharacteristics (*hs_bindgen_9d66e990e02b39a2 (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_COLORSPACETRANSFER;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACEMATRIX */"
         , "__attribute__ ((const))"
         , "SDL_MatrixCoefficients (*hs_bindgen_94623bcc9daaa8ee (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_COLORSPACEMATRIX;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_MATRIX_BT601 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_23ed6403a69ca0bf (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISCOLORSPACE_MATRIX_BT601;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_MATRIX_BT709 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_46d1d547630c76e0 (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISCOLORSPACE_MATRIX_BT709;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_bdde99e14eee3d4d (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_LIMITED_RANGE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7383ccedffa9acae (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISCOLORSPACE_LIMITED_RANGE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_FULL_RANGE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2304b4d429bcb1a4 (void)) ("
         , "  SDL_Colorspace arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_ISCOLORSPACE_FULL_RANGE;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_DEFINE_PIXELFOURCC@
foreign import ccall unsafe "hs_bindgen_75756731ebd56d6c"
  hs_bindgen_75756731ebd56d6c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_DEFINE_PIXELFOURCC@
hs_bindgen_75756731ebd56d6c
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
           )
       )
hs_bindgen_75756731ebd56d6c =
  fmap BG.fromFFIType hs_bindgen_75756731ebd56d6c_base

{-# NOINLINE lithon_SDL_DEFINE_PIXELFOURCC #-}

-- | Define a custom FourCC pixel format.
--
--     The SDL_DEFINE_PIXELFOURCC macro as a function. SDL_PIXELFORMAT_YV12, for example, is the code of the characters Y, V, 1, 2.
--
--     [@a@]: the first character of the FourCC code.
--
--     [@b@]: the second character of the FourCC code.
--
--     [@c@]: the third character of the FourCC code.
--
--     [@d@]: the fourth character of the FourCC code.
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
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
       )
lithon_SDL_DEFINE_PIXELFOURCC =
  BG.unsafePerformIO hs_bindgen_75756731ebd56d6c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_BITSPERPIXEL@
foreign import ccall unsafe "hs_bindgen_a8b5b5932ddbfc3b"
  hs_bindgen_a8b5b5932ddbfc3b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_BITSPERPIXEL@
hs_bindgen_a8b5b5932ddbfc3b
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CInt))
hs_bindgen_a8b5b5932ddbfc3b =
  fmap BG.fromFFIType hs_bindgen_a8b5b5932ddbfc3b_base

{-# NOINLINE lithon_SDL_BITSPERPIXEL #-}

-- | Determine an SDL_PixelFormat\'s bits per pixel.
--
--     The SDL_BITSPERPIXEL macro as a function. FourCC formats report zero here, as it rarely makes sense to measure them per-pixel.
--
--     [@format@]: an SDL_PixelFormat to check.
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
lithon_SDL_BITSPERPIXEL :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CInt)
lithon_SDL_BITSPERPIXEL =
  BG.unsafePerformIO hs_bindgen_a8b5b5932ddbfc3b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_BYTESPERPIXEL@
foreign import ccall unsafe "hs_bindgen_fef9e1bbde9ec790"
  hs_bindgen_fef9e1bbde9ec790_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_BYTESPERPIXEL@
hs_bindgen_fef9e1bbde9ec790
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CInt))
hs_bindgen_fef9e1bbde9ec790 =
  fmap BG.fromFFIType hs_bindgen_fef9e1bbde9ec790_base

{-# NOINLINE lithon_SDL_BYTESPERPIXEL #-}

-- | Determine an SDL_PixelFormat\'s bytes per pixel.
--
--     The SDL_BYTESPERPIXEL macro as a function. FourCC formats do their best here, but many of them don\'t have a meaningful measurement of bytes per pixel.
--
--     [@format@]: an SDL_PixelFormat to check.
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
lithon_SDL_BYTESPERPIXEL :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CInt)
lithon_SDL_BYTESPERPIXEL =
  BG.unsafePerformIO hs_bindgen_fef9e1bbde9ec790

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_INDEXED@
foreign import ccall unsafe "hs_bindgen_b117a24f410fe873"
  hs_bindgen_b117a24f410fe873_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_INDEXED@
hs_bindgen_b117a24f410fe873
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool))
hs_bindgen_b117a24f410fe873 =
  fmap BG.fromFFIType hs_bindgen_b117a24f410fe873_base

{-# NOINLINE lithon_SDL_ISPIXELFORMAT_INDEXED #-}

-- | Determine if an SDL_PixelFormat is an indexed format.
--
--     The SDL_ISPIXELFORMAT_INDEXED macro as a function.
--
--     [@format@]: an SDL_PixelFormat to check.
--
--     [Returns]: true if the format is indexed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_INDEXED@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 100:24@
lithon_SDL_ISPIXELFORMAT_INDEXED
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool)
lithon_SDL_ISPIXELFORMAT_INDEXED =
  BG.unsafePerformIO hs_bindgen_b117a24f410fe873

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_PACKED@
foreign import ccall unsafe "hs_bindgen_9046eeb0267300bc"
  hs_bindgen_9046eeb0267300bc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_PACKED@
hs_bindgen_9046eeb0267300bc
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool))
hs_bindgen_9046eeb0267300bc =
  fmap BG.fromFFIType hs_bindgen_9046eeb0267300bc_base

{-# NOINLINE lithon_SDL_ISPIXELFORMAT_PACKED #-}

-- | Determine if an SDL_PixelFormat is a packed format.
--
--     The SDL_ISPIXELFORMAT_PACKED macro as a function.
--
--     [@format@]: an SDL_PixelFormat to check.
--
--     [Returns]: true if the format is packed, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_PACKED@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 117:24@
lithon_SDL_ISPIXELFORMAT_PACKED
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool)
lithon_SDL_ISPIXELFORMAT_PACKED =
  BG.unsafePerformIO hs_bindgen_9046eeb0267300bc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_ARRAY@
foreign import ccall unsafe "hs_bindgen_5c10de6b0f11eb45"
  hs_bindgen_5c10de6b0f11eb45_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_ARRAY@
hs_bindgen_5c10de6b0f11eb45
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool))
hs_bindgen_5c10de6b0f11eb45 =
  fmap BG.fromFFIType hs_bindgen_5c10de6b0f11eb45_base

{-# NOINLINE lithon_SDL_ISPIXELFORMAT_ARRAY #-}

-- | Determine if an SDL_PixelFormat is an array format.
--
--     The SDL_ISPIXELFORMAT_ARRAY macro as a function.
--
--     [@format@]: an SDL_PixelFormat to check.
--
--     [Returns]: true if the format is an array, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_ARRAY@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 134:24@
lithon_SDL_ISPIXELFORMAT_ARRAY :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool)
lithon_SDL_ISPIXELFORMAT_ARRAY =
  BG.unsafePerformIO hs_bindgen_5c10de6b0f11eb45

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_10BIT@
foreign import ccall unsafe "hs_bindgen_f7e465ad660e31bf"
  hs_bindgen_f7e465ad660e31bf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_10BIT@
hs_bindgen_f7e465ad660e31bf
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool))
hs_bindgen_f7e465ad660e31bf =
  fmap BG.fromFFIType hs_bindgen_f7e465ad660e31bf_base

{-# NOINLINE lithon_SDL_ISPIXELFORMAT_10BIT #-}

-- | Determine if an SDL_PixelFormat is a 10-bit format.
--
--     The SDL_ISPIXELFORMAT_10BIT macro as a function.
--
--     [@format@]: an SDL_PixelFormat to check.
--
--     [Returns]: true if the format is 10-bit, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_10BIT@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 151:24@
lithon_SDL_ISPIXELFORMAT_10BIT :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool)
lithon_SDL_ISPIXELFORMAT_10BIT =
  BG.unsafePerformIO hs_bindgen_f7e465ad660e31bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_FLOAT@
foreign import ccall unsafe "hs_bindgen_032856c3c3b017c5"
  hs_bindgen_032856c3c3b017c5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_FLOAT@
hs_bindgen_032856c3c3b017c5
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool))
hs_bindgen_032856c3c3b017c5 =
  fmap BG.fromFFIType hs_bindgen_032856c3c3b017c5_base

{-# NOINLINE lithon_SDL_ISPIXELFORMAT_FLOAT #-}

-- | Determine if an SDL_PixelFormat is a floating point format.
--
--     The SDL_ISPIXELFORMAT_FLOAT macro as a function.
--
--     [@format@]: an SDL_PixelFormat to check.
--
--     [Returns]: true if the format is a floating point, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_FLOAT@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 168:24@
lithon_SDL_ISPIXELFORMAT_FLOAT :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool)
lithon_SDL_ISPIXELFORMAT_FLOAT =
  BG.unsafePerformIO hs_bindgen_032856c3c3b017c5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_ALPHA@
foreign import ccall unsafe "hs_bindgen_6c426e1aa20f7341"
  hs_bindgen_6c426e1aa20f7341_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_ALPHA@
hs_bindgen_6c426e1aa20f7341
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool))
hs_bindgen_6c426e1aa20f7341 =
  fmap BG.fromFFIType hs_bindgen_6c426e1aa20f7341_base

{-# NOINLINE lithon_SDL_ISPIXELFORMAT_ALPHA #-}

-- | Determine if an SDL_PixelFormat has an alpha channel.
--
--     The SDL_ISPIXELFORMAT_ALPHA macro as a function.
--
--     [@format@]: an SDL_PixelFormat to check.
--
--     [Returns]: true if the format has alpha, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_ALPHA@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 185:24@
lithon_SDL_ISPIXELFORMAT_ALPHA :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool)
lithon_SDL_ISPIXELFORMAT_ALPHA =
  BG.unsafePerformIO hs_bindgen_6c426e1aa20f7341

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_FOURCC@
foreign import ccall unsafe "hs_bindgen_d08bb623c3ebc165"
  hs_bindgen_d08bb623c3ebc165_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISPIXELFORMAT_FOURCC@
hs_bindgen_d08bb623c3ebc165
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool))
hs_bindgen_d08bb623c3ebc165 =
  fmap BG.fromFFIType hs_bindgen_d08bb623c3ebc165_base

{-# NOINLINE lithon_SDL_ISPIXELFORMAT_FOURCC #-}

-- | Determine if an SDL_PixelFormat is a \"FourCC\" format.
--
--     The SDL_ISPIXELFORMAT_FOURCC macro as a function. This covers custom and other unusual formats.
--
--     [@format@]: an SDL_PixelFormat to check.
--
--     [Returns]: true if the format is a FourCC format, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISPIXELFORMAT_FOURCC@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 202:24@
lithon_SDL_ISPIXELFORMAT_FOURCC
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat -> IO BG.CBool)
lithon_SDL_ISPIXELFORMAT_FOURCC =
  BG.unsafePerformIO hs_bindgen_d08bb623c3ebc165

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_DEFINE_COLORSPACE@
foreign import ccall unsafe "hs_bindgen_e6f658b2c26218e1"
  hs_bindgen_e6f658b2c26218e1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_DEFINE_COLORSPACE@
hs_bindgen_e6f658b2c26218e1
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Pixels.SDL_ColorType
             -> SDL3.Sys.Bindgen.Pixels.SDL_ColorRange
             -> SDL3.Sys.Bindgen.Pixels.SDL_ColorPrimaries
             -> SDL3.Sys.Bindgen.Pixels.SDL_TransferCharacteristics
             -> SDL3.Sys.Bindgen.Pixels.SDL_MatrixCoefficients
             -> SDL3.Sys.Bindgen.Pixels.SDL_ChromaLocation
             -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
           )
       )
hs_bindgen_e6f658b2c26218e1 =
  fmap BG.fromFFIType hs_bindgen_e6f658b2c26218e1_base

{-# NOINLINE lithon_SDL_DEFINE_COLORSPACE #-}

-- | Define a custom colorspace.
--
--     The SDL_DEFINE_COLORSPACE macro as a function.
--
--     [@type@]: the type of the new format.
--
--     [@range@]: the range of the new format.
--
--     [@primaries@]: the primaries of the new format.
--
--     [@transfer@]: the transfer characteristics of the new format.
--
--     [@matrix@]: the matrix coefficients of the new format.
--
--     [@chroma@]: the chroma sample location of the new format.
--
--     [Returns]: a format value in the style of SDL_Colorspace.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_DEFINE_COLORSPACE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 224:34@
lithon_SDL_DEFINE_COLORSPACE
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Pixels.SDL_ColorType
         -> SDL3.Sys.Bindgen.Pixels.SDL_ColorRange
         -> SDL3.Sys.Bindgen.Pixels.SDL_ColorPrimaries
         -> SDL3.Sys.Bindgen.Pixels.SDL_TransferCharacteristics
         -> SDL3.Sys.Bindgen.Pixels.SDL_MatrixCoefficients
         -> SDL3.Sys.Bindgen.Pixels.SDL_ChromaLocation
         -> IO SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
       )
lithon_SDL_DEFINE_COLORSPACE =
  BG.unsafePerformIO hs_bindgen_e6f658b2c26218e1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACETYPE@
foreign import ccall unsafe "hs_bindgen_eec66aaad367649c"
  hs_bindgen_eec66aaad367649c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACETYPE@
hs_bindgen_eec66aaad367649c
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorType))
hs_bindgen_eec66aaad367649c =
  fmap BG.fromFFIType hs_bindgen_eec66aaad367649c_base

{-# NOINLINE lithon_SDL_COLORSPACETYPE #-}

-- | Retrieve the type of an SDL_Colorspace.
--
--     The SDL_COLORSPACETYPE macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: the SDL_ColorType of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACETYPE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 241:33@
lithon_SDL_COLORSPACETYPE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorType)
lithon_SDL_COLORSPACETYPE =
  BG.unsafePerformIO hs_bindgen_eec66aaad367649c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACERANGE@
foreign import ccall unsafe "hs_bindgen_80876d9836c72ca7"
  hs_bindgen_80876d9836c72ca7_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACERANGE@
hs_bindgen_80876d9836c72ca7
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorRange))
hs_bindgen_80876d9836c72ca7 =
  fmap BG.fromFFIType hs_bindgen_80876d9836c72ca7_base

{-# NOINLINE lithon_SDL_COLORSPACERANGE #-}

-- | Retrieve the range of an SDL_Colorspace.
--
--     The SDL_COLORSPACERANGE macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: the SDL_ColorRange of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACERANGE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 258:34@
lithon_SDL_COLORSPACERANGE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorRange)
lithon_SDL_COLORSPACERANGE =
  BG.unsafePerformIO hs_bindgen_80876d9836c72ca7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACECHROMA@
foreign import ccall unsafe "hs_bindgen_72559431bdc72d6f"
  hs_bindgen_72559431bdc72d6f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACECHROMA@
hs_bindgen_72559431bdc72d6f
  :: IO
       (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_ChromaLocation))
hs_bindgen_72559431bdc72d6f =
  fmap BG.fromFFIType hs_bindgen_72559431bdc72d6f_base

{-# NOINLINE lithon_SDL_COLORSPACECHROMA #-}

-- | Retrieve the chroma sample location of an SDL_Colorspace.
--
--     The SDL_COLORSPACECHROMA macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: the SDL_ChromaLocation of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACECHROMA@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 275:38@
lithon_SDL_COLORSPACECHROMA
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_ChromaLocation)
lithon_SDL_COLORSPACECHROMA =
  BG.unsafePerformIO hs_bindgen_72559431bdc72d6f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACEPRIMARIES@
foreign import ccall unsafe "hs_bindgen_38530fb5411bf69a"
  hs_bindgen_38530fb5411bf69a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACEPRIMARIES@
hs_bindgen_38530fb5411bf69a
  :: IO
       (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorPrimaries))
hs_bindgen_38530fb5411bf69a =
  fmap BG.fromFFIType hs_bindgen_38530fb5411bf69a_base

{-# NOINLINE lithon_SDL_COLORSPACEPRIMARIES #-}

-- | Retrieve the primaries of an SDL_Colorspace.
--
--     The SDL_COLORSPACEPRIMARIES macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: the SDL_ColorPrimaries of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACEPRIMARIES@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 292:38@
lithon_SDL_COLORSPACEPRIMARIES
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_ColorPrimaries)
lithon_SDL_COLORSPACEPRIMARIES =
  BG.unsafePerformIO hs_bindgen_38530fb5411bf69a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACETRANSFER@
foreign import ccall unsafe "hs_bindgen_9d66e990e02b39a2"
  hs_bindgen_9d66e990e02b39a2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACETRANSFER@
hs_bindgen_9d66e990e02b39a2
  :: IO
       ( BG.FunPtr
           (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_TransferCharacteristics)
       )
hs_bindgen_9d66e990e02b39a2 =
  fmap BG.fromFFIType hs_bindgen_9d66e990e02b39a2_base

{-# NOINLINE lithon_SDL_COLORSPACETRANSFER #-}

-- | Retrieve the transfer characteristics of an SDL_Colorspace.
--
--     The SDL_COLORSPACETRANSFER macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: the SDL_TransferCharacteristics of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACETRANSFER@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 309:47@
lithon_SDL_COLORSPACETRANSFER
  :: BG.FunPtr
       (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_TransferCharacteristics)
lithon_SDL_COLORSPACETRANSFER =
  BG.unsafePerformIO hs_bindgen_9d66e990e02b39a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACEMATRIX@
foreign import ccall unsafe "hs_bindgen_94623bcc9daaa8ee"
  hs_bindgen_94623bcc9daaa8ee_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_COLORSPACEMATRIX@
hs_bindgen_94623bcc9daaa8ee
  :: IO
       ( BG.FunPtr
           (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_MatrixCoefficients)
       )
hs_bindgen_94623bcc9daaa8ee =
  fmap BG.fromFFIType hs_bindgen_94623bcc9daaa8ee_base

{-# NOINLINE lithon_SDL_COLORSPACEMATRIX #-}

-- | Retrieve the matrix coefficients of an SDL_Colorspace.
--
--     The SDL_COLORSPACEMATRIX macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: the SDL_MatrixCoefficients of @cspace@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_COLORSPACEMATRIX@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 326:42@
lithon_SDL_COLORSPACEMATRIX
  :: BG.FunPtr
       (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO SDL3.Sys.Bindgen.Pixels.SDL_MatrixCoefficients)
lithon_SDL_COLORSPACEMATRIX =
  BG.unsafePerformIO hs_bindgen_94623bcc9daaa8ee

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_MATRIX_BT601@
foreign import ccall unsafe "hs_bindgen_23ed6403a69ca0bf"
  hs_bindgen_23ed6403a69ca0bf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_MATRIX_BT601@
hs_bindgen_23ed6403a69ca0bf
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool))
hs_bindgen_23ed6403a69ca0bf =
  fmap BG.fromFFIType hs_bindgen_23ed6403a69ca0bf_base

{-# NOINLINE lithon_SDL_ISCOLORSPACE_MATRIX_BT601 #-}

-- | Determine if an SDL_Colorspace uses BT601 (or BT470BG) matrix coefficients.
--
--     The SDL_ISCOLORSPACE_MATRIX_BT601 macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: true if BT601 or BT470BG, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_MATRIX_BT601@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 343:24@
lithon_SDL_ISCOLORSPACE_MATRIX_BT601
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool)
lithon_SDL_ISCOLORSPACE_MATRIX_BT601 =
  BG.unsafePerformIO hs_bindgen_23ed6403a69ca0bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_MATRIX_BT709@
foreign import ccall unsafe "hs_bindgen_46d1d547630c76e0"
  hs_bindgen_46d1d547630c76e0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_MATRIX_BT709@
hs_bindgen_46d1d547630c76e0
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool))
hs_bindgen_46d1d547630c76e0 =
  fmap BG.fromFFIType hs_bindgen_46d1d547630c76e0_base

{-# NOINLINE lithon_SDL_ISCOLORSPACE_MATRIX_BT709 #-}

-- | Determine if an SDL_Colorspace uses BT709 matrix coefficients.
--
--     The SDL_ISCOLORSPACE_MATRIX_BT709 macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: true if BT709, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_MATRIX_BT709@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 360:24@
lithon_SDL_ISCOLORSPACE_MATRIX_BT709
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool)
lithon_SDL_ISCOLORSPACE_MATRIX_BT709 =
  BG.unsafePerformIO hs_bindgen_46d1d547630c76e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL@
foreign import ccall unsafe "hs_bindgen_bdde99e14eee3d4d"
  hs_bindgen_bdde99e14eee3d4d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL@
hs_bindgen_bdde99e14eee3d4d
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool))
hs_bindgen_bdde99e14eee3d4d =
  fmap BG.fromFFIType hs_bindgen_bdde99e14eee3d4d_base

{-# NOINLINE lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL #-}

-- | Determine if an SDL_Colorspace uses BT2020_NCL matrix coefficients.
--
--     The SDL_ISCOLORSPACE_MATRIX_BT2020_NCL macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: true if BT2020_NCL, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 377:24@
lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool)
lithon_SDL_ISCOLORSPACE_MATRIX_BT2020_NCL =
  BG.unsafePerformIO hs_bindgen_bdde99e14eee3d4d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_LIMITED_RANGE@
foreign import ccall unsafe "hs_bindgen_7383ccedffa9acae"
  hs_bindgen_7383ccedffa9acae_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_LIMITED_RANGE@
hs_bindgen_7383ccedffa9acae
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool))
hs_bindgen_7383ccedffa9acae =
  fmap BG.fromFFIType hs_bindgen_7383ccedffa9acae_base

{-# NOINLINE lithon_SDL_ISCOLORSPACE_LIMITED_RANGE #-}

-- | Determine if an SDL_Colorspace has a limited range.
--
--     The SDL_ISCOLORSPACE_LIMITED_RANGE macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: true if limited range, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_LIMITED_RANGE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 394:24@
lithon_SDL_ISCOLORSPACE_LIMITED_RANGE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool)
lithon_SDL_ISCOLORSPACE_LIMITED_RANGE =
  BG.unsafePerformIO hs_bindgen_7383ccedffa9acae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_FULL_RANGE@
foreign import ccall unsafe "hs_bindgen_2304b4d429bcb1a4"
  hs_bindgen_2304b4d429bcb1a4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.PixelsShims_get_lithon_SDL_ISCOLORSPACE_FULL_RANGE@
hs_bindgen_2304b4d429bcb1a4
  :: IO (BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool))
hs_bindgen_2304b4d429bcb1a4 =
  fmap BG.fromFFIType hs_bindgen_2304b4d429bcb1a4_base

{-# NOINLINE lithon_SDL_ISCOLORSPACE_FULL_RANGE #-}

-- | Determine if an SDL_Colorspace has a full range.
--
--     The SDL_ISCOLORSPACE_FULL_RANGE macro as a function.
--
--     [@cspace@]: an SDL_Colorspace to check.
--
--     [Returns]: true if full range, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_ISCOLORSPACE_FULL_RANGE@, defined at @sdl3-bindgen-sys\/SDL_pixels_shims.h 411:24@
lithon_SDL_ISCOLORSPACE_FULL_RANGE
  :: BG.FunPtr (SDL3.Sys.Bindgen.Pixels.SDL_Colorspace -> IO BG.CBool)
lithon_SDL_ISCOLORSPACE_FULL_RANGE =
  BG.unsafePerformIO hs_bindgen_2304b4d429bcb1a4
