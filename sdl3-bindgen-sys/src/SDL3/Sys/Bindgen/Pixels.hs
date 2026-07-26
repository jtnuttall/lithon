{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | SDL offers facilities for pixel management.
--
--     Largely these facilities deal with pixel /format/: what does this set of bits represent?
--
--     If you mostly want to think of a pixel as some combination of red, green, blue, and maybe alpha intensities, this is all pretty straightforward, and in many cases, is enough information to build a perfectly fine game.
--
--     However, the actual definition of a pixel is more complex than that:
--
--     Pixels are a representation of a color in a particular color space.
--
--     The first characteristic of a color space is the color type. SDL understands two different color types, RGB and YCbCr, or in SDL also referred to as YUV.
--
--     RGB colors consist of red, green, and blue channels of color that are added together to represent the colors we see on the screen.
--
--     [https:\/\/en.wikipedia.org\/wiki\/RGB_color_model](https://en.wikipedia.org/wiki/RGB_color_model)
--
--     YCbCr colors represent colors as a Y luma brightness component and red and blue chroma color offsets. This color representation takes advantage of the fact that the human eye is more sensitive to brightness than the color in an image. The Cb and Cr components are often compressed and have lower resolution than the luma component.
--
--     [https:\/\/en.wikipedia.org\/wiki\/YCbCr](https://en.wikipedia.org/wiki/YCbCr)
--
--     When the color information in YCbCr is compressed, the Y pixels are left at full resolution and each Cr and Cb pixel represents an average of the color information in a block of Y pixels. The chroma location determines where in that block of pixels the color information is coming from.
--
--     The color range defines how much of the pixel to use when converting a pixel into a color on the display. When the full color range is used, the entire numeric range of the pixel bits is significant. When narrow color range is used, for historical reasons, the pixel uses only a portion of the numeric range to represent colors.
--
--     The color primaries and white point are a definition of the colors in the color space relative to the standard XYZ color space.
--
--     [https:\/\/en.wikipedia.org\/wiki\/CIE_1931_color_space](https://en.wikipedia.org/wiki/CIE_1931_color_space)
--
--     The transfer characteristic, or opto-electrical transfer function (OETF), is the way a color is converted from mathematically linear space into a non-linear output signals.
--
--     [https:\/\/en.wikipedia.org\/wiki\/Rec._709\#Transfer_characteristics](https://en.wikipedia.org/wiki/Rec._709#Transfer_characteristics)
--
--     The matrix coefficients are used to convert between YCbCr and RGB colors. A fully opaque 8-bit alpha value.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ALPHA_TRANSPARENT'
module SDL3.Sys.Bindgen.Pixels (
  SDL3.Sys.Bindgen.Pixels.sDL_ALPHA_OPAQUE,
  SDL3.Sys.Bindgen.Pixels.sDL_ALPHA_OPAQUE_FLOAT,
  SDL3.Sys.Bindgen.Pixels.sDL_ALPHA_TRANSPARENT,
  SDL3.Sys.Bindgen.Pixels.sDL_ALPHA_TRANSPARENT_FLOAT,
  SDL3.Sys.Bindgen.Pixels.SDL_PixelType (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_INDEX1,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_INDEX4,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_INDEX8,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_PACKED8,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_PACKED16,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_PACKED32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_ARRAYU8,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_ARRAYU16,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_ARRAYU32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_ARRAYF16,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_ARRAYF32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELTYPE_INDEX2,
  SDL3.Sys.Bindgen.Pixels.SDL_BitmapOrder (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_BITMAPORDER_NONE,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_BITMAPORDER_4321,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_BITMAPORDER_1234,
  SDL3.Sys.Bindgen.Pixels.SDL_PackedOrder (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDORDER_NONE,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDORDER_XRGB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDORDER_RGBX,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDORDER_ARGB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDORDER_RGBA,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDORDER_XBGR,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDORDER_BGRX,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDORDER_ABGR,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDORDER_BGRA,
  SDL3.Sys.Bindgen.Pixels.SDL_ArrayOrder (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_ARRAYORDER_NONE,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_ARRAYORDER_RGB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_ARRAYORDER_RGBA,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_ARRAYORDER_ARGB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_ARRAYORDER_BGR,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_ARRAYORDER_BGRA,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_ARRAYORDER_ABGR,
  SDL3.Sys.Bindgen.Pixels.SDL_PackedLayout (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDLAYOUT_NONE,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDLAYOUT_332,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDLAYOUT_4444,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDLAYOUT_1555,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDLAYOUT_5551,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDLAYOUT_565,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDLAYOUT_8888,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDLAYOUT_2101010,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PACKEDLAYOUT_1010102,
  SDL3.Sys.Bindgen.Pixels.sDL_DEFINE_PIXELFORMAT,
  SDL3.Sys.Bindgen.Pixels.sDL_PIXELFLAG,
  SDL3.Sys.Bindgen.Pixels.sDL_PIXELTYPE,
  SDL3.Sys.Bindgen.Pixels.sDL_PIXELORDER,
  SDL3.Sys.Bindgen.Pixels.sDL_PIXELLAYOUT,
  SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_INDEX1LSB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_INDEX1MSB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_INDEX2LSB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_INDEX2MSB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_INDEX4LSB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_INDEX4MSB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_INDEX8,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGB332,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XRGB4444,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XBGR4444,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XRGB1555,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XBGR1555,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ARGB4444,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGBA4444,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ABGR4444,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGRA4444,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ARGB1555,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGBA5551,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ABGR1555,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGRA5551,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGB565,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGR565,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGB24,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGR24,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XRGB8888,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGBX8888,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XBGR8888,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGRX8888,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ARGB8888,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGBA8888,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ABGR8888,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGRA8888,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XRGB2101010,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XBGR2101010,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ARGB2101010,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ABGR2101010,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGB48,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGR48,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGBA64,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ARGB64,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGRA64,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ABGR64,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGB48_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGR48_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGBA64_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ARGB64_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGRA64_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ABGR64_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGB96_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGR96_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGBA128_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ARGB128_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGRA128_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ABGR128_FLOAT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_YV12,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_IYUV,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_YUY2,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_UYVY,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_YVYU,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_NV12,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_NV21,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_P010,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_EXTERNAL_OES,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_MJPG,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGBA32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ARGB32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGRA32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_ABGR32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_RGBX32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XRGB32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_BGRX32,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_PIXELFORMAT_XBGR32,
  SDL3.Sys.Bindgen.Pixels.SDL_ColorType (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_TYPE_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_TYPE_RGB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_TYPE_YCBCR,
  SDL3.Sys.Bindgen.Pixels.SDL_ColorRange (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_RANGE_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_RANGE_LIMITED,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_RANGE_FULL,
  SDL3.Sys.Bindgen.Pixels.SDL_ColorPrimaries (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_BT709,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_UNSPECIFIED,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_BT470M,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_BT470BG,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_BT601,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_SMPTE240,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_GENERIC_FILM,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_BT2020,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_XYZ,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_SMPTE431,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_SMPTE432,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_EBU3213,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLOR_PRIMARIES_CUSTOM,
  SDL3.Sys.Bindgen.Pixels.SDL_TransferCharacteristics (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_BT709,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_GAMMA22,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_GAMMA28,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_BT601,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_SMPTE240,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_LINEAR,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_LOG100,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_IEC61966,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_BT1361,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_SRGB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_PQ,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_SMPTE428,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_HLG,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_TRANSFER_CHARACTERISTICS_CUSTOM,
  SDL3.Sys.Bindgen.Pixels.SDL_MatrixCoefficients (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_IDENTITY,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_BT709,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_UNSPECIFIED,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_FCC,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_BT470BG,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_BT601,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_SMPTE240,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_YCGCO,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_BT2020_NCL,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_BT2020_CL,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_SMPTE2085,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_ICTCP,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_MATRIX_COEFFICIENTS_CUSTOM,
  SDL3.Sys.Bindgen.Pixels.SDL_ChromaLocation (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_CHROMA_LOCATION_NONE,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_CHROMA_LOCATION_LEFT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_CHROMA_LOCATION_CENTER,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_CHROMA_LOCATION_TOPLEFT,
  SDL3.Sys.Bindgen.Pixels.SDL_Colorspace (..),
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_SRGB,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_SRGB_LINEAR,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_HDR10,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_JPEG,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_BT601_LIMITED,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_BT601_FULL,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_BT709_LIMITED,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_BT709_FULL,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_BT2020_LIMITED,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_BT2020_FULL,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_RGB_DEFAULT,
  pattern SDL3.Sys.Bindgen.Pixels.SDL_COLORSPACE_YUV_DEFAULT,
  SDL3.Sys.Bindgen.Pixels.SDL_Color (..),
  SDL3.Sys.Bindgen.Pixels.SDL_FColor (..),
  SDL3.Sys.Bindgen.Pixels.SDL_Palette (..),
  SDL3.Sys.Bindgen.Pixels.SDL_PixelFormatDetails (..),
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.ConstantArray qualified as CA
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @macro SDL_ALPHA_OPAQUE@, defined at @SDL3\/SDL_pixels.h 100:9@
sDL_ALPHA_OPAQUE :: BG.CInt
sDL_ALPHA_OPAQUE = (255 :: BG.CInt)

-- | A fully opaque floating point alpha value.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ALPHA_TRANSPARENT_FLOAT'
--
--     [C declaration]: @macro SDL_ALPHA_OPAQUE_FLOAT@, defined at @SDL3\/SDL_pixels.h 109:9@
sDL_ALPHA_OPAQUE_FLOAT :: BG.CFloat
sDL_ALPHA_OPAQUE_FLOAT = (1.0 :: BG.CFloat)

-- | A fully transparent 8-bit alpha value.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ALPHA_OPAQUE'
--
--     [C declaration]: @macro SDL_ALPHA_TRANSPARENT@, defined at @SDL3\/SDL_pixels.h 118:9@
sDL_ALPHA_TRANSPARENT :: BG.CInt
sDL_ALPHA_TRANSPARENT = (0 :: BG.CInt)

-- | A fully transparent floating point alpha value.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ALPHA_OPAQUE_FLOAT'
--
--     [C declaration]: @macro SDL_ALPHA_TRANSPARENT_FLOAT@, defined at @SDL3\/SDL_pixels.h 127:9@
sDL_ALPHA_TRANSPARENT_FLOAT :: BG.CFloat
sDL_ALPHA_TRANSPARENT_FLOAT = (0.0 :: BG.CFloat)

-- | Pixel type.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_PixelType@, defined at @SDL3\/SDL_pixels.h 134:14@
newtype SDL_PixelType = SDL_PixelType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_PixelType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PixelType where
  readRaw =
    \ptr0 ->
      pure SDL_PixelType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_PixelType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PixelType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_PixelType instance BG.Storable SDL_PixelType

deriving via BG.CUInt instance BG.Prim SDL_PixelType

instance CEnum.CEnum SDL_PixelType where
  type CEnumZ SDL_PixelType = BG.CUInt

  toCEnum = SDL_PixelType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_PIXELTYPE_UNKNOWN")
        , (1, BG.singleton "SDL_PIXELTYPE_INDEX1")
        , (2, BG.singleton "SDL_PIXELTYPE_INDEX4")
        , (3, BG.singleton "SDL_PIXELTYPE_INDEX8")
        , (4, BG.singleton "SDL_PIXELTYPE_PACKED8")
        , (5, BG.singleton "SDL_PIXELTYPE_PACKED16")
        , (6, BG.singleton "SDL_PIXELTYPE_PACKED32")
        , (7, BG.singleton "SDL_PIXELTYPE_ARRAYU8")
        , (8, BG.singleton "SDL_PIXELTYPE_ARRAYU16")
        , (9, BG.singleton "SDL_PIXELTYPE_ARRAYU32")
        , (10, BG.singleton "SDL_PIXELTYPE_ARRAYF16")
        , (11, BG.singleton "SDL_PIXELTYPE_ARRAYF32")
        , (12, BG.singleton "SDL_PIXELTYPE_INDEX2")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_PixelType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_PixelType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_PixelType where
  minDeclaredValue = SDL_PIXELTYPE_UNKNOWN

  maxDeclaredValue = SDL_PIXELTYPE_INDEX2

instance Show SDL_PixelType where
  showsPrec = CEnum.shows

instance Read SDL_PixelType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_PixelType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_PixelType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PixelType "unwrap" where
  type CFieldType SDL_PixelType "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_PIXELTYPE_UNKNOWN@, defined at @SDL3\/SDL_pixels.h 136:5@
pattern SDL_PIXELTYPE_UNKNOWN :: SDL_PixelType
pattern SDL_PIXELTYPE_UNKNOWN = SDL_PixelType 0

-- | [C declaration]: @SDL_PIXELTYPE_INDEX1@, defined at @SDL3\/SDL_pixels.h 137:5@
pattern SDL_PIXELTYPE_INDEX1 :: SDL_PixelType
pattern SDL_PIXELTYPE_INDEX1 = SDL_PixelType 1

-- | [C declaration]: @SDL_PIXELTYPE_INDEX4@, defined at @SDL3\/SDL_pixels.h 138:5@
pattern SDL_PIXELTYPE_INDEX4 :: SDL_PixelType
pattern SDL_PIXELTYPE_INDEX4 = SDL_PixelType 2

-- | [C declaration]: @SDL_PIXELTYPE_INDEX8@, defined at @SDL3\/SDL_pixels.h 139:5@
pattern SDL_PIXELTYPE_INDEX8 :: SDL_PixelType
pattern SDL_PIXELTYPE_INDEX8 = SDL_PixelType 3

-- | [C declaration]: @SDL_PIXELTYPE_PACKED8@, defined at @SDL3\/SDL_pixels.h 140:5@
pattern SDL_PIXELTYPE_PACKED8 :: SDL_PixelType
pattern SDL_PIXELTYPE_PACKED8 = SDL_PixelType 4

-- | [C declaration]: @SDL_PIXELTYPE_PACKED16@, defined at @SDL3\/SDL_pixels.h 141:5@
pattern SDL_PIXELTYPE_PACKED16 :: SDL_PixelType
pattern SDL_PIXELTYPE_PACKED16 = SDL_PixelType 5

-- | [C declaration]: @SDL_PIXELTYPE_PACKED32@, defined at @SDL3\/SDL_pixels.h 142:5@
pattern SDL_PIXELTYPE_PACKED32 :: SDL_PixelType
pattern SDL_PIXELTYPE_PACKED32 = SDL_PixelType 6

-- | [C declaration]: @SDL_PIXELTYPE_ARRAYU8@, defined at @SDL3\/SDL_pixels.h 143:5@
pattern SDL_PIXELTYPE_ARRAYU8 :: SDL_PixelType
pattern SDL_PIXELTYPE_ARRAYU8 = SDL_PixelType 7

-- | [C declaration]: @SDL_PIXELTYPE_ARRAYU16@, defined at @SDL3\/SDL_pixels.h 144:5@
pattern SDL_PIXELTYPE_ARRAYU16 :: SDL_PixelType
pattern SDL_PIXELTYPE_ARRAYU16 = SDL_PixelType 8

-- | [C declaration]: @SDL_PIXELTYPE_ARRAYU32@, defined at @SDL3\/SDL_pixels.h 145:5@
pattern SDL_PIXELTYPE_ARRAYU32 :: SDL_PixelType
pattern SDL_PIXELTYPE_ARRAYU32 = SDL_PixelType 9

-- | [C declaration]: @SDL_PIXELTYPE_ARRAYF16@, defined at @SDL3\/SDL_pixels.h 146:5@
pattern SDL_PIXELTYPE_ARRAYF16 :: SDL_PixelType
pattern SDL_PIXELTYPE_ARRAYF16 = SDL_PixelType 10

-- | [C declaration]: @SDL_PIXELTYPE_ARRAYF32@, defined at @SDL3\/SDL_pixels.h 147:5@
pattern SDL_PIXELTYPE_ARRAYF32 :: SDL_PixelType
pattern SDL_PIXELTYPE_ARRAYF32 = SDL_PixelType 11

-- | [C declaration]: @SDL_PIXELTYPE_INDEX2@, defined at @SDL3\/SDL_pixels.h 149:5@
pattern SDL_PIXELTYPE_INDEX2 :: SDL_PixelType
pattern SDL_PIXELTYPE_INDEX2 = SDL_PixelType 12

-- | Bitmap pixel order, high bit -> low bit.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_BitmapOrder@, defined at @SDL3\/SDL_pixels.h 157:14@
newtype SDL_BitmapOrder = SDL_BitmapOrder
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_BitmapOrder where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_BitmapOrder where
  readRaw =
    \ptr0 ->
      pure SDL_BitmapOrder
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_BitmapOrder where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_BitmapOrder unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_BitmapOrder instance BG.Storable SDL_BitmapOrder

deriving via BG.CUInt instance BG.Prim SDL_BitmapOrder

instance CEnum.CEnum SDL_BitmapOrder where
  type CEnumZ SDL_BitmapOrder = BG.CUInt

  toCEnum = SDL_BitmapOrder

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_BITMAPORDER_NONE")
        , (1, BG.singleton "SDL_BITMAPORDER_4321")
        , (2, BG.singleton "SDL_BITMAPORDER_1234")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_BitmapOrder"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_BitmapOrder"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_BitmapOrder where
  minDeclaredValue = SDL_BITMAPORDER_NONE

  maxDeclaredValue = SDL_BITMAPORDER_1234

instance Show SDL_BitmapOrder where
  showsPrec = CEnum.shows

instance Read SDL_BitmapOrder where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_BitmapOrder ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_BitmapOrder{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_BitmapOrder) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_BitmapOrder "unwrap" where
  type CFieldType SDL_BitmapOrder "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_BITMAPORDER_NONE@, defined at @SDL3\/SDL_pixels.h 159:5@
pattern SDL_BITMAPORDER_NONE :: SDL_BitmapOrder
pattern SDL_BITMAPORDER_NONE = SDL_BitmapOrder 0

-- | [C declaration]: @SDL_BITMAPORDER_4321@, defined at @SDL3\/SDL_pixels.h 160:5@
pattern SDL_BITMAPORDER_4321 :: SDL_BitmapOrder
pattern SDL_BITMAPORDER_4321 = SDL_BitmapOrder 1

-- | [C declaration]: @SDL_BITMAPORDER_1234@, defined at @SDL3\/SDL_pixels.h 161:5@
pattern SDL_BITMAPORDER_1234 :: SDL_BitmapOrder
pattern SDL_BITMAPORDER_1234 = SDL_BitmapOrder 2

-- | Packed component order, high bit -> low bit.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_PackedOrder@, defined at @SDL3\/SDL_pixels.h 169:14@
newtype SDL_PackedOrder = SDL_PackedOrder
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_PackedOrder where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PackedOrder where
  readRaw =
    \ptr0 ->
      pure SDL_PackedOrder
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_PackedOrder where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PackedOrder unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_PackedOrder instance BG.Storable SDL_PackedOrder

deriving via BG.CUInt instance BG.Prim SDL_PackedOrder

instance CEnum.CEnum SDL_PackedOrder where
  type CEnumZ SDL_PackedOrder = BG.CUInt

  toCEnum = SDL_PackedOrder

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_PACKEDORDER_NONE")
        , (1, BG.singleton "SDL_PACKEDORDER_XRGB")
        , (2, BG.singleton "SDL_PACKEDORDER_RGBX")
        , (3, BG.singleton "SDL_PACKEDORDER_ARGB")
        , (4, BG.singleton "SDL_PACKEDORDER_RGBA")
        , (5, BG.singleton "SDL_PACKEDORDER_XBGR")
        , (6, BG.singleton "SDL_PACKEDORDER_BGRX")
        , (7, BG.singleton "SDL_PACKEDORDER_ABGR")
        , (8, BG.singleton "SDL_PACKEDORDER_BGRA")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_PackedOrder"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_PackedOrder"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_PackedOrder where
  minDeclaredValue = SDL_PACKEDORDER_NONE

  maxDeclaredValue = SDL_PACKEDORDER_BGRA

instance Show SDL_PackedOrder where
  showsPrec = CEnum.shows

instance Read SDL_PackedOrder where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_PackedOrder ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PackedOrder{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_PackedOrder) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PackedOrder "unwrap" where
  type CFieldType SDL_PackedOrder "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_PACKEDORDER_NONE@, defined at @SDL3\/SDL_pixels.h 171:5@
pattern SDL_PACKEDORDER_NONE :: SDL_PackedOrder
pattern SDL_PACKEDORDER_NONE = SDL_PackedOrder 0

-- | [C declaration]: @SDL_PACKEDORDER_XRGB@, defined at @SDL3\/SDL_pixels.h 172:5@
pattern SDL_PACKEDORDER_XRGB :: SDL_PackedOrder
pattern SDL_PACKEDORDER_XRGB = SDL_PackedOrder 1

-- | [C declaration]: @SDL_PACKEDORDER_RGBX@, defined at @SDL3\/SDL_pixels.h 173:5@
pattern SDL_PACKEDORDER_RGBX :: SDL_PackedOrder
pattern SDL_PACKEDORDER_RGBX = SDL_PackedOrder 2

-- | [C declaration]: @SDL_PACKEDORDER_ARGB@, defined at @SDL3\/SDL_pixels.h 174:5@
pattern SDL_PACKEDORDER_ARGB :: SDL_PackedOrder
pattern SDL_PACKEDORDER_ARGB = SDL_PackedOrder 3

-- | [C declaration]: @SDL_PACKEDORDER_RGBA@, defined at @SDL3\/SDL_pixels.h 175:5@
pattern SDL_PACKEDORDER_RGBA :: SDL_PackedOrder
pattern SDL_PACKEDORDER_RGBA = SDL_PackedOrder 4

-- | [C declaration]: @SDL_PACKEDORDER_XBGR@, defined at @SDL3\/SDL_pixels.h 176:5@
pattern SDL_PACKEDORDER_XBGR :: SDL_PackedOrder
pattern SDL_PACKEDORDER_XBGR = SDL_PackedOrder 5

-- | [C declaration]: @SDL_PACKEDORDER_BGRX@, defined at @SDL3\/SDL_pixels.h 177:5@
pattern SDL_PACKEDORDER_BGRX :: SDL_PackedOrder
pattern SDL_PACKEDORDER_BGRX = SDL_PackedOrder 6

-- | [C declaration]: @SDL_PACKEDORDER_ABGR@, defined at @SDL3\/SDL_pixels.h 178:5@
pattern SDL_PACKEDORDER_ABGR :: SDL_PackedOrder
pattern SDL_PACKEDORDER_ABGR = SDL_PackedOrder 7

-- | [C declaration]: @SDL_PACKEDORDER_BGRA@, defined at @SDL3\/SDL_pixels.h 179:5@
pattern SDL_PACKEDORDER_BGRA :: SDL_PackedOrder
pattern SDL_PACKEDORDER_BGRA = SDL_PackedOrder 8

-- | Array component order, low byte -> high byte.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_ArrayOrder@, defined at @SDL3\/SDL_pixels.h 187:14@
newtype SDL_ArrayOrder = SDL_ArrayOrder
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ArrayOrder where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ArrayOrder where
  readRaw =
    \ptr0 ->
      pure SDL_ArrayOrder
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ArrayOrder where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ArrayOrder unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ArrayOrder instance BG.Storable SDL_ArrayOrder

deriving via BG.CUInt instance BG.Prim SDL_ArrayOrder

instance CEnum.CEnum SDL_ArrayOrder where
  type CEnumZ SDL_ArrayOrder = BG.CUInt

  toCEnum = SDL_ArrayOrder

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_ARRAYORDER_NONE")
        , (1, BG.singleton "SDL_ARRAYORDER_RGB")
        , (2, BG.singleton "SDL_ARRAYORDER_RGBA")
        , (3, BG.singleton "SDL_ARRAYORDER_ARGB")
        , (4, BG.singleton "SDL_ARRAYORDER_BGR")
        , (5, BG.singleton "SDL_ARRAYORDER_BGRA")
        , (6, BG.singleton "SDL_ARRAYORDER_ABGR")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ArrayOrder"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ArrayOrder"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_ArrayOrder where
  minDeclaredValue = SDL_ARRAYORDER_NONE

  maxDeclaredValue = SDL_ARRAYORDER_ABGR

instance Show SDL_ArrayOrder where
  showsPrec = CEnum.shows

instance Read SDL_ArrayOrder where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ArrayOrder ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ArrayOrder{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ArrayOrder) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ArrayOrder "unwrap" where
  type CFieldType SDL_ArrayOrder "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_ARRAYORDER_NONE@, defined at @SDL3\/SDL_pixels.h 189:5@
pattern SDL_ARRAYORDER_NONE :: SDL_ArrayOrder
pattern SDL_ARRAYORDER_NONE = SDL_ArrayOrder 0

-- | [C declaration]: @SDL_ARRAYORDER_RGB@, defined at @SDL3\/SDL_pixels.h 190:5@
pattern SDL_ARRAYORDER_RGB :: SDL_ArrayOrder
pattern SDL_ARRAYORDER_RGB = SDL_ArrayOrder 1

-- | [C declaration]: @SDL_ARRAYORDER_RGBA@, defined at @SDL3\/SDL_pixels.h 191:5@
pattern SDL_ARRAYORDER_RGBA :: SDL_ArrayOrder
pattern SDL_ARRAYORDER_RGBA = SDL_ArrayOrder 2

-- | [C declaration]: @SDL_ARRAYORDER_ARGB@, defined at @SDL3\/SDL_pixels.h 192:5@
pattern SDL_ARRAYORDER_ARGB :: SDL_ArrayOrder
pattern SDL_ARRAYORDER_ARGB = SDL_ArrayOrder 3

-- | [C declaration]: @SDL_ARRAYORDER_BGR@, defined at @SDL3\/SDL_pixels.h 193:5@
pattern SDL_ARRAYORDER_BGR :: SDL_ArrayOrder
pattern SDL_ARRAYORDER_BGR = SDL_ArrayOrder 4

-- | [C declaration]: @SDL_ARRAYORDER_BGRA@, defined at @SDL3\/SDL_pixels.h 194:5@
pattern SDL_ARRAYORDER_BGRA :: SDL_ArrayOrder
pattern SDL_ARRAYORDER_BGRA = SDL_ArrayOrder 5

-- | [C declaration]: @SDL_ARRAYORDER_ABGR@, defined at @SDL3\/SDL_pixels.h 195:5@
pattern SDL_ARRAYORDER_ABGR :: SDL_ArrayOrder
pattern SDL_ARRAYORDER_ABGR = SDL_ArrayOrder 6

-- | Packed component layout.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_PackedLayout@, defined at @SDL3\/SDL_pixels.h 203:14@
newtype SDL_PackedLayout = SDL_PackedLayout
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_PackedLayout where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PackedLayout where
  readRaw =
    \ptr0 ->
      pure SDL_PackedLayout
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_PackedLayout where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PackedLayout unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_PackedLayout instance BG.Storable SDL_PackedLayout

deriving via BG.CUInt instance BG.Prim SDL_PackedLayout

instance CEnum.CEnum SDL_PackedLayout where
  type CEnumZ SDL_PackedLayout = BG.CUInt

  toCEnum = SDL_PackedLayout

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_PACKEDLAYOUT_NONE")
        , (1, BG.singleton "SDL_PACKEDLAYOUT_332")
        , (2, BG.singleton "SDL_PACKEDLAYOUT_4444")
        , (3, BG.singleton "SDL_PACKEDLAYOUT_1555")
        , (4, BG.singleton "SDL_PACKEDLAYOUT_5551")
        , (5, BG.singleton "SDL_PACKEDLAYOUT_565")
        , (6, BG.singleton "SDL_PACKEDLAYOUT_8888")
        , (7, BG.singleton "SDL_PACKEDLAYOUT_2101010")
        , (8, BG.singleton "SDL_PACKEDLAYOUT_1010102")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_PackedLayout"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_PackedLayout"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_PackedLayout where
  minDeclaredValue = SDL_PACKEDLAYOUT_NONE

  maxDeclaredValue = SDL_PACKEDLAYOUT_1010102

instance Show SDL_PackedLayout where
  showsPrec = CEnum.shows

instance Read SDL_PackedLayout where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_PackedLayout ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PackedLayout{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_PackedLayout) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PackedLayout "unwrap" where
  type CFieldType SDL_PackedLayout "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_PACKEDLAYOUT_NONE@, defined at @SDL3\/SDL_pixels.h 205:5@
pattern SDL_PACKEDLAYOUT_NONE :: SDL_PackedLayout
pattern SDL_PACKEDLAYOUT_NONE = SDL_PackedLayout 0

-- | [C declaration]: @SDL_PACKEDLAYOUT_332@, defined at @SDL3\/SDL_pixels.h 206:5@
pattern SDL_PACKEDLAYOUT_332 :: SDL_PackedLayout
pattern SDL_PACKEDLAYOUT_332 = SDL_PackedLayout 1

-- | [C declaration]: @SDL_PACKEDLAYOUT_4444@, defined at @SDL3\/SDL_pixels.h 207:5@
pattern SDL_PACKEDLAYOUT_4444 :: SDL_PackedLayout
pattern SDL_PACKEDLAYOUT_4444 = SDL_PackedLayout 2

-- | [C declaration]: @SDL_PACKEDLAYOUT_1555@, defined at @SDL3\/SDL_pixels.h 208:5@
pattern SDL_PACKEDLAYOUT_1555 :: SDL_PackedLayout
pattern SDL_PACKEDLAYOUT_1555 = SDL_PackedLayout 3

-- | [C declaration]: @SDL_PACKEDLAYOUT_5551@, defined at @SDL3\/SDL_pixels.h 209:5@
pattern SDL_PACKEDLAYOUT_5551 :: SDL_PackedLayout
pattern SDL_PACKEDLAYOUT_5551 = SDL_PackedLayout 4

-- | [C declaration]: @SDL_PACKEDLAYOUT_565@, defined at @SDL3\/SDL_pixels.h 210:5@
pattern SDL_PACKEDLAYOUT_565 :: SDL_PackedLayout
pattern SDL_PACKEDLAYOUT_565 = SDL_PackedLayout 5

-- | [C declaration]: @SDL_PACKEDLAYOUT_8888@, defined at @SDL3\/SDL_pixels.h 211:5@
pattern SDL_PACKEDLAYOUT_8888 :: SDL_PackedLayout
pattern SDL_PACKEDLAYOUT_8888 = SDL_PackedLayout 6

-- | [C declaration]: @SDL_PACKEDLAYOUT_2101010@, defined at @SDL3\/SDL_pixels.h 212:5@
pattern SDL_PACKEDLAYOUT_2101010 :: SDL_PackedLayout
pattern SDL_PACKEDLAYOUT_2101010 = SDL_PackedLayout 7

-- | [C declaration]: @SDL_PACKEDLAYOUT_1010102@, defined at @SDL3\/SDL_pixels.h 213:5@
pattern SDL_PACKEDLAYOUT_1010102 :: SDL_PackedLayout
pattern SDL_PACKEDLAYOUT_1010102 = SDL_PackedLayout 8

-- | A macro for defining custom non-FourCC pixel formats.
--
--     For example, defining SDL_PIXELFORMAT_RGBA8888 looks like this:
--
--     @
--     SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_8888, 32, 4)
--     @
--
--     [@type@]: the type of the new format, probably a 'SDL_PixelType' value.
--
--     [@order@]: the order of the new format, probably a 'SDL_BitmapOrder', 'SDL_PackedOrder', or 'SDL_ArrayOrder' value.
--
--     [@layout@]: the layout of the new format, probably an 'SDL_PackedLayout' value or zero.
--
--     [@bits@]: the number of bits per pixel of the new format.
--
--     [@bytes@]: the number of bytes per pixel of the new format.
--
--     [Returns]: a format value in the style of 'SDL_PixelFormat'.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_DEFINE_PIXELFORMAT@, defined at @SDL3\/SDL_pixels.h 259:9@
sDL_DEFINE_PIXELFORMAT
  :: forall a10 a21 a32 a43 a54
   . ( C.Expr.HostPlatform.Bitwise
         (C.Expr.HostPlatform.BitsRes BG.CInt (C.Expr.HostPlatform.ShiftRes a10))
         (C.Expr.HostPlatform.ShiftRes a21)
     )
  => ( C.Expr.HostPlatform.Bitwise
         ( C.Expr.HostPlatform.BitsRes
             (C.Expr.HostPlatform.BitsRes BG.CInt (C.Expr.HostPlatform.ShiftRes a10))
             (C.Expr.HostPlatform.ShiftRes a21)
         )
         (C.Expr.HostPlatform.ShiftRes a32)
     )
  => ( C.Expr.HostPlatform.Bitwise
         ( C.Expr.HostPlatform.BitsRes
             ( C.Expr.HostPlatform.BitsRes
                 (C.Expr.HostPlatform.BitsRes BG.CInt (C.Expr.HostPlatform.ShiftRes a10))
                 (C.Expr.HostPlatform.ShiftRes a21)
             )
             (C.Expr.HostPlatform.ShiftRes a32)
         )
         (C.Expr.HostPlatform.ShiftRes a43)
     )
  => ( C.Expr.HostPlatform.Bitwise
         ( C.Expr.HostPlatform.BitsRes
             ( C.Expr.HostPlatform.BitsRes
                 ( C.Expr.HostPlatform.BitsRes
                     (C.Expr.HostPlatform.BitsRes BG.CInt (C.Expr.HostPlatform.ShiftRes a10))
                     (C.Expr.HostPlatform.ShiftRes a21)
                 )
                 (C.Expr.HostPlatform.ShiftRes a32)
             )
             (C.Expr.HostPlatform.ShiftRes a43)
         )
         (C.Expr.HostPlatform.ShiftRes a54)
     )
  => (C.Expr.HostPlatform.Bitwise BG.CInt (C.Expr.HostPlatform.ShiftRes a10))
  => (C.Expr.HostPlatform.Shift a54 BG.CInt)
  => (C.Expr.HostPlatform.Shift a43 BG.CInt)
  => (C.Expr.HostPlatform.Shift a32 BG.CInt)
  => (C.Expr.HostPlatform.Shift a21 BG.CInt)
  => (C.Expr.HostPlatform.Shift a10 BG.CInt)
  => a10
  -> a21
  -> a32
  -> a43
  -> a54
  -> C.Expr.HostPlatform.BitsRes
       ( C.Expr.HostPlatform.BitsRes
           ( C.Expr.HostPlatform.BitsRes
               ( C.Expr.HostPlatform.BitsRes
                   (C.Expr.HostPlatform.BitsRes BG.CInt (C.Expr.HostPlatform.ShiftRes a10))
                   (C.Expr.HostPlatform.ShiftRes a21)
               )
               (C.Expr.HostPlatform.ShiftRes a32)
           )
           (C.Expr.HostPlatform.ShiftRes a43)
       )
       (C.Expr.HostPlatform.ShiftRes a54)
sDL_DEFINE_PIXELFORMAT =
  \type'0 ->
    \order1 ->
      \layout2 ->
        \bits3 ->
          \bytes4 ->
            (C.Expr.HostPlatform..|.)
              ( (C.Expr.HostPlatform..|.)
                  ( (C.Expr.HostPlatform..|.)
                      ( (C.Expr.HostPlatform..|.)
                          ( (C.Expr.HostPlatform..|.)
                              ((C.Expr.HostPlatform.<<) (1 :: BG.CInt) (28 :: BG.CInt))
                              ((C.Expr.HostPlatform.<<) type'0 (24 :: BG.CInt))
                          )
                          ((C.Expr.HostPlatform.<<) order1 (20 :: BG.CInt))
                      )
                      ((C.Expr.HostPlatform.<<) layout2 (16 :: BG.CInt))
                  )
                  ((C.Expr.HostPlatform.<<) bits3 (8 :: BG.CInt))
              )
              ((C.Expr.HostPlatform.<<) bytes4 (0 :: BG.CInt))

-- | A macro to retrieve the flags of an 'SDL_PixelFormat'.
--
--     This macro is generally not needed directly by an app, which should use specific tests, like SDL_ISPIXELFORMAT_FOURCC, instead.
--
--     [@format@]: an 'SDL_PixelFormat' to check.
--
--     [Returns]: the flags of @format@.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_PIXELFLAG@, defined at @SDL3\/SDL_pixels.h 276:9@
sDL_PIXELFLAG
  :: forall a0
   . (C.Expr.HostPlatform.Bitwise (C.Expr.HostPlatform.ShiftRes a0) BG.CInt)
  => (C.Expr.HostPlatform.Shift a0 BG.CInt)
  => a0 -> C.Expr.HostPlatform.BitsRes (C.Expr.HostPlatform.ShiftRes a0) BG.CInt
sDL_PIXELFLAG =
  \format0 ->
    (C.Expr.HostPlatform..&.) ((C.Expr.HostPlatform.>>) format0 (28 :: BG.CInt)) (15 :: BG.CInt)

-- | A macro to retrieve the type of an 'SDL_PixelFormat'.
--
--     This is usually a value from the 'SDL_PixelType' enumeration.
--
--     [@format@]: an 'SDL_PixelFormat' to check.
--
--     [Returns]: the type of @format@.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_PIXELTYPE@, defined at @SDL3\/SDL_pixels.h 290:9@
sDL_PIXELTYPE
  :: forall a0
   . (C.Expr.HostPlatform.Bitwise (C.Expr.HostPlatform.ShiftRes a0) BG.CInt)
  => (C.Expr.HostPlatform.Shift a0 BG.CInt)
  => a0 -> C.Expr.HostPlatform.BitsRes (C.Expr.HostPlatform.ShiftRes a0) BG.CInt
sDL_PIXELTYPE =
  \format0 ->
    (C.Expr.HostPlatform..&.) ((C.Expr.HostPlatform.>>) format0 (24 :: BG.CInt)) (15 :: BG.CInt)

-- | A macro to retrieve the order of an 'SDL_PixelFormat'.
--
--     This is usually a value from the 'SDL_BitmapOrder', 'SDL_PackedOrder', or 'SDL_ArrayOrder' enumerations, depending on the format type.
--
--     [@format@]: an 'SDL_PixelFormat' to check.
--
--     [Returns]: the order of @format@.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_PIXELORDER@, defined at @SDL3\/SDL_pixels.h 305:9@
sDL_PIXELORDER
  :: forall a0
   . (C.Expr.HostPlatform.Bitwise (C.Expr.HostPlatform.ShiftRes a0) BG.CInt)
  => (C.Expr.HostPlatform.Shift a0 BG.CInt)
  => a0 -> C.Expr.HostPlatform.BitsRes (C.Expr.HostPlatform.ShiftRes a0) BG.CInt
sDL_PIXELORDER =
  \format0 ->
    (C.Expr.HostPlatform..&.) ((C.Expr.HostPlatform.>>) format0 (20 :: BG.CInt)) (15 :: BG.CInt)

-- | A macro to retrieve the layout of an 'SDL_PixelFormat'.
--
--     This is usually a value from the 'SDL_PackedLayout' enumeration, or zero if a layout doesn\'t make sense for the format type.
--
--     [@format@]: an 'SDL_PixelFormat' to check.
--
--     [Returns]: the layout of @format@.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_PIXELLAYOUT@, defined at @SDL3\/SDL_pixels.h 320:9@
sDL_PIXELLAYOUT
  :: forall a0
   . (C.Expr.HostPlatform.Bitwise (C.Expr.HostPlatform.ShiftRes a0) BG.CInt)
  => (C.Expr.HostPlatform.Shift a0 BG.CInt)
  => a0 -> C.Expr.HostPlatform.BitsRes (C.Expr.HostPlatform.ShiftRes a0) BG.CInt
sDL_PIXELLAYOUT =
  \format0 ->
    (C.Expr.HostPlatform..&.) ((C.Expr.HostPlatform.>>) format0 (16 :: BG.CInt)) (15 :: BG.CInt)

-- | Pixel format.
--
--     SDL\'s pixel formats have the following naming convention:
--
--     * Names with a list of components and a single bit count, such as RGB24 and ABGR32, define a platform-independent encoding into bytes in the order specified. For example, in RGB24 data, each pixel is encoded in 3 bytes (red, green, blue) in that order, and in ABGR32 data, each pixel is encoded in 4 bytes (alpha, blue, green, red) in that order. Use these names if the property of a format that is important to you is the order of the bytes in memory or on disk.
--
--     * Names with a bit count per component, such as ARGB8888 and XRGB1555, are \"packed\" into an appropriately-sized integer in the platform\'s native endianness. For example, ARGB8888 is a sequence of 32-bit integers; in each integer, the most significant bits are alpha, and the least significant bits are blue. On a little-endian CPU such as x86, the least significant bits of each integer are arranged first in memory, but on a big-endian CPU such as s390x, the most significant bits are arranged first. Use these names if the property of a format that is important to you is the meaning of each bit position within a native-endianness integer.
--
--     * In indexed formats such as INDEX4LSB, each pixel is represented by encoding an index into the palette into the indicated number of bits, with multiple pixels packed into each byte if appropriate. In LSB formats, the first (leftmost) pixel is stored in the least-significant bits of the byte; in MSB formats, it\'s stored in the most-significant bits. INDEX8 does not need LSB\/MSB variants, because each pixel exactly fills one byte.
--
--     The 32-bit byte-array encodings such as RGBA32 are aliases for the appropriate 8888 encoding for the current platform. For example, RGBA32 is an alias for ABGR8888 on little-endian CPUs like x86, or an alias for RGBA8888 on big-endian CPUs.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_PixelFormat@, defined at @SDL3\/SDL_pixels.h 548:14@
newtype SDL_PixelFormat = SDL_PixelFormat
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_PixelFormat where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PixelFormat where
  readRaw =
    \ptr0 ->
      pure SDL_PixelFormat
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_PixelFormat where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PixelFormat unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_PixelFormat instance BG.Storable SDL_PixelFormat

deriving via BG.CUInt instance BG.Prim SDL_PixelFormat

instance CEnum.CEnum SDL_PixelFormat where
  type CEnumZ SDL_PixelFormat = BG.CUInt

  toCEnum = SDL_PixelFormat

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_PIXELFORMAT_UNKNOWN")
        , (286261504, BG.singleton "SDL_PIXELFORMAT_INDEX1LSB")
        , (287310080, BG.singleton "SDL_PIXELFORMAT_INDEX1MSB")
        , (303039488, BG.singleton "SDL_PIXELFORMAT_INDEX4LSB")
        , (304088064, BG.singleton "SDL_PIXELFORMAT_INDEX4MSB")
        , (318769153, BG.singleton "SDL_PIXELFORMAT_INDEX8")
        , (336660481, BG.singleton "SDL_PIXELFORMAT_RGB332")
        , (353504258, BG.singleton "SDL_PIXELFORMAT_XRGB4444")
        , (353570562, BG.singleton "SDL_PIXELFORMAT_XRGB1555")
        , (353701890, BG.singleton "SDL_PIXELFORMAT_RGB565")
        , (355602434, BG.singleton "SDL_PIXELFORMAT_ARGB4444")
        , (355667970, BG.singleton "SDL_PIXELFORMAT_ARGB1555")
        , (356651010, BG.singleton "SDL_PIXELFORMAT_RGBA4444")
        , (356782082, BG.singleton "SDL_PIXELFORMAT_RGBA5551")
        , (357698562, BG.singleton "SDL_PIXELFORMAT_XBGR4444")
        , (357764866, BG.singleton "SDL_PIXELFORMAT_XBGR1555")
        , (357896194, BG.singleton "SDL_PIXELFORMAT_BGR565")
        , (359796738, BG.singleton "SDL_PIXELFORMAT_ABGR4444")
        , (359862274, BG.singleton "SDL_PIXELFORMAT_ABGR1555")
        , (360845314, BG.singleton "SDL_PIXELFORMAT_BGRA4444")
        , (360976386, BG.singleton "SDL_PIXELFORMAT_BGRA5551")
        , (370546692, ("SDL_PIXELFORMAT_XRGB8888" BG.:| ["SDL_PIXELFORMAT_BGRX32"]))
        , (370614276, BG.singleton "SDL_PIXELFORMAT_XRGB2101010")
        , (371595268, ("SDL_PIXELFORMAT_RGBX8888" BG.:| ["SDL_PIXELFORMAT_XBGR32"]))
        , (372645892, ("SDL_PIXELFORMAT_ARGB8888" BG.:| ["SDL_PIXELFORMAT_BGRA32"]))
        , (372711428, BG.singleton "SDL_PIXELFORMAT_ARGB2101010")
        , (373694468, ("SDL_PIXELFORMAT_RGBA8888" BG.:| ["SDL_PIXELFORMAT_ABGR32"]))
        , (374740996, ("SDL_PIXELFORMAT_XBGR8888" BG.:| ["SDL_PIXELFORMAT_RGBX32"]))
        , (374808580, BG.singleton "SDL_PIXELFORMAT_XBGR2101010")
        , (375789572, ("SDL_PIXELFORMAT_BGRX8888" BG.:| ["SDL_PIXELFORMAT_XRGB32"]))
        , (376840196, ("SDL_PIXELFORMAT_ABGR8888" BG.:| ["SDL_PIXELFORMAT_RGBA32"]))
        , (376905732, BG.singleton "SDL_PIXELFORMAT_ABGR2101010")
        , (377888772, ("SDL_PIXELFORMAT_BGRA8888" BG.:| ["SDL_PIXELFORMAT_ARGB32"]))
        , (386930691, BG.singleton "SDL_PIXELFORMAT_RGB24")
        , (390076419, BG.singleton "SDL_PIXELFORMAT_BGR24")
        , (403714054, BG.singleton "SDL_PIXELFORMAT_RGB48")
        , (404766728, BG.singleton "SDL_PIXELFORMAT_RGBA64")
        , (405815304, BG.singleton "SDL_PIXELFORMAT_ARGB64")
        , (406859782, BG.singleton "SDL_PIXELFORMAT_BGR48")
        , (407912456, BG.singleton "SDL_PIXELFORMAT_BGRA64")
        , (408961032, BG.singleton "SDL_PIXELFORMAT_ABGR64")
        , (437268486, BG.singleton "SDL_PIXELFORMAT_RGB48_FLOAT")
        , (438321160, BG.singleton "SDL_PIXELFORMAT_RGBA64_FLOAT")
        , (439369736, BG.singleton "SDL_PIXELFORMAT_ARGB64_FLOAT")
        , (440414214, BG.singleton "SDL_PIXELFORMAT_BGR48_FLOAT")
        , (441466888, BG.singleton "SDL_PIXELFORMAT_BGRA64_FLOAT")
        , (442515464, BG.singleton "SDL_PIXELFORMAT_ABGR64_FLOAT")
        , (454057996, BG.singleton "SDL_PIXELFORMAT_RGB96_FLOAT")
        , (455114768, BG.singleton "SDL_PIXELFORMAT_RGBA128_FLOAT")
        , (456163344, BG.singleton "SDL_PIXELFORMAT_ARGB128_FLOAT")
        , (457203724, BG.singleton "SDL_PIXELFORMAT_BGR96_FLOAT")
        , (458260496, BG.singleton "SDL_PIXELFORMAT_BGRA128_FLOAT")
        , (459309072, BG.singleton "SDL_PIXELFORMAT_ABGR128_FLOAT")
        , (470811136, BG.singleton "SDL_PIXELFORMAT_INDEX2LSB")
        , (471859712, BG.singleton "SDL_PIXELFORMAT_INDEX2MSB")
        , (542328143, BG.singleton "SDL_PIXELFORMAT_EXTERNAL_OES")
        , (808530000, BG.singleton "SDL_PIXELFORMAT_P010")
        , (825382478, BG.singleton "SDL_PIXELFORMAT_NV21")
        , (842094158, BG.singleton "SDL_PIXELFORMAT_NV12")
        , (842094169, BG.singleton "SDL_PIXELFORMAT_YV12")
        , (844715353, BG.singleton "SDL_PIXELFORMAT_YUY2")
        , (1196444237, BG.singleton "SDL_PIXELFORMAT_MJPG")
        , (1431918169, BG.singleton "SDL_PIXELFORMAT_YVYU")
        , (1448433993, BG.singleton "SDL_PIXELFORMAT_IYUV")
        , (1498831189, BG.singleton "SDL_PIXELFORMAT_UYVY")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_PixelFormat"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_PixelFormat"

instance Show SDL_PixelFormat where
  showsPrec = CEnum.shows

instance Read SDL_PixelFormat where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_PixelFormat ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormat{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_PixelFormat) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PixelFormat "unwrap" where
  type CFieldType SDL_PixelFormat "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_PIXELFORMAT_UNKNOWN@, defined at @SDL3\/SDL_pixels.h 550:5@
pattern SDL_PIXELFORMAT_UNKNOWN :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_UNKNOWN = SDL_PixelFormat 0

-- | [C declaration]: @SDL_PIXELFORMAT_INDEX1LSB@, defined at @SDL3\/SDL_pixels.h 551:5@
pattern SDL_PIXELFORMAT_INDEX1LSB :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_INDEX1LSB = SDL_PixelFormat 286261504

-- | [C declaration]: @SDL_PIXELFORMAT_INDEX1MSB@, defined at @SDL3\/SDL_pixels.h 553:5@
pattern SDL_PIXELFORMAT_INDEX1MSB :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_INDEX1MSB = SDL_PixelFormat 287310080

-- | [C declaration]: @SDL_PIXELFORMAT_INDEX2LSB@, defined at @SDL3\/SDL_pixels.h 555:5@
pattern SDL_PIXELFORMAT_INDEX2LSB :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_INDEX2LSB = SDL_PixelFormat 470811136

-- | [C declaration]: @SDL_PIXELFORMAT_INDEX2MSB@, defined at @SDL3\/SDL_pixels.h 557:5@
pattern SDL_PIXELFORMAT_INDEX2MSB :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_INDEX2MSB = SDL_PixelFormat 471859712

-- | [C declaration]: @SDL_PIXELFORMAT_INDEX4LSB@, defined at @SDL3\/SDL_pixels.h 559:5@
pattern SDL_PIXELFORMAT_INDEX4LSB :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_INDEX4LSB = SDL_PixelFormat 303039488

-- | [C declaration]: @SDL_PIXELFORMAT_INDEX4MSB@, defined at @SDL3\/SDL_pixels.h 561:5@
pattern SDL_PIXELFORMAT_INDEX4MSB :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_INDEX4MSB = SDL_PixelFormat 304088064

-- | [C declaration]: @SDL_PIXELFORMAT_INDEX8@, defined at @SDL3\/SDL_pixels.h 563:5@
pattern SDL_PIXELFORMAT_INDEX8 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_INDEX8 = SDL_PixelFormat 318769153

-- | [C declaration]: @SDL_PIXELFORMAT_RGB332@, defined at @SDL3\/SDL_pixels.h 565:5@
pattern SDL_PIXELFORMAT_RGB332 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGB332 = SDL_PixelFormat 336660481

-- | [C declaration]: @SDL_PIXELFORMAT_XRGB4444@, defined at @SDL3\/SDL_pixels.h 567:5@
pattern SDL_PIXELFORMAT_XRGB4444 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XRGB4444 = SDL_PixelFormat 353504258

-- | [C declaration]: @SDL_PIXELFORMAT_XBGR4444@, defined at @SDL3\/SDL_pixels.h 569:5@
pattern SDL_PIXELFORMAT_XBGR4444 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XBGR4444 = SDL_PixelFormat 357698562

-- | [C declaration]: @SDL_PIXELFORMAT_XRGB1555@, defined at @SDL3\/SDL_pixels.h 571:5@
pattern SDL_PIXELFORMAT_XRGB1555 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XRGB1555 = SDL_PixelFormat 353570562

-- | [C declaration]: @SDL_PIXELFORMAT_XBGR1555@, defined at @SDL3\/SDL_pixels.h 573:5@
pattern SDL_PIXELFORMAT_XBGR1555 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XBGR1555 = SDL_PixelFormat 357764866

-- | [C declaration]: @SDL_PIXELFORMAT_ARGB4444@, defined at @SDL3\/SDL_pixels.h 575:5@
pattern SDL_PIXELFORMAT_ARGB4444 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ARGB4444 = SDL_PixelFormat 355602434

-- | [C declaration]: @SDL_PIXELFORMAT_RGBA4444@, defined at @SDL3\/SDL_pixels.h 577:5@
pattern SDL_PIXELFORMAT_RGBA4444 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGBA4444 = SDL_PixelFormat 356651010

-- | [C declaration]: @SDL_PIXELFORMAT_ABGR4444@, defined at @SDL3\/SDL_pixels.h 579:5@
pattern SDL_PIXELFORMAT_ABGR4444 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ABGR4444 = SDL_PixelFormat 359796738

-- | [C declaration]: @SDL_PIXELFORMAT_BGRA4444@, defined at @SDL3\/SDL_pixels.h 581:5@
pattern SDL_PIXELFORMAT_BGRA4444 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGRA4444 = SDL_PixelFormat 360845314

-- | [C declaration]: @SDL_PIXELFORMAT_ARGB1555@, defined at @SDL3\/SDL_pixels.h 583:5@
pattern SDL_PIXELFORMAT_ARGB1555 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ARGB1555 = SDL_PixelFormat 355667970

-- | [C declaration]: @SDL_PIXELFORMAT_RGBA5551@, defined at @SDL3\/SDL_pixels.h 585:5@
pattern SDL_PIXELFORMAT_RGBA5551 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGBA5551 = SDL_PixelFormat 356782082

-- | [C declaration]: @SDL_PIXELFORMAT_ABGR1555@, defined at @SDL3\/SDL_pixels.h 587:5@
pattern SDL_PIXELFORMAT_ABGR1555 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ABGR1555 = SDL_PixelFormat 359862274

-- | [C declaration]: @SDL_PIXELFORMAT_BGRA5551@, defined at @SDL3\/SDL_pixels.h 589:5@
pattern SDL_PIXELFORMAT_BGRA5551 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGRA5551 = SDL_PixelFormat 360976386

-- | [C declaration]: @SDL_PIXELFORMAT_RGB565@, defined at @SDL3\/SDL_pixels.h 591:5@
pattern SDL_PIXELFORMAT_RGB565 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGB565 = SDL_PixelFormat 353701890

-- | [C declaration]: @SDL_PIXELFORMAT_BGR565@, defined at @SDL3\/SDL_pixels.h 593:5@
pattern SDL_PIXELFORMAT_BGR565 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGR565 = SDL_PixelFormat 357896194

-- | [C declaration]: @SDL_PIXELFORMAT_RGB24@, defined at @SDL3\/SDL_pixels.h 595:5@
pattern SDL_PIXELFORMAT_RGB24 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGB24 = SDL_PixelFormat 386930691

-- | [C declaration]: @SDL_PIXELFORMAT_BGR24@, defined at @SDL3\/SDL_pixels.h 597:5@
pattern SDL_PIXELFORMAT_BGR24 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGR24 = SDL_PixelFormat 390076419

-- | [C declaration]: @SDL_PIXELFORMAT_XRGB8888@, defined at @SDL3\/SDL_pixels.h 599:5@
pattern SDL_PIXELFORMAT_XRGB8888 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XRGB8888 = SDL_PixelFormat 370546692

-- | [C declaration]: @SDL_PIXELFORMAT_RGBX8888@, defined at @SDL3\/SDL_pixels.h 601:5@
pattern SDL_PIXELFORMAT_RGBX8888 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGBX8888 = SDL_PixelFormat 371595268

-- | [C declaration]: @SDL_PIXELFORMAT_XBGR8888@, defined at @SDL3\/SDL_pixels.h 603:5@
pattern SDL_PIXELFORMAT_XBGR8888 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XBGR8888 = SDL_PixelFormat 374740996

-- | [C declaration]: @SDL_PIXELFORMAT_BGRX8888@, defined at @SDL3\/SDL_pixels.h 605:5@
pattern SDL_PIXELFORMAT_BGRX8888 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGRX8888 = SDL_PixelFormat 375789572

-- | [C declaration]: @SDL_PIXELFORMAT_ARGB8888@, defined at @SDL3\/SDL_pixels.h 607:5@
pattern SDL_PIXELFORMAT_ARGB8888 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ARGB8888 = SDL_PixelFormat 372645892

-- | [C declaration]: @SDL_PIXELFORMAT_RGBA8888@, defined at @SDL3\/SDL_pixels.h 609:5@
pattern SDL_PIXELFORMAT_RGBA8888 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGBA8888 = SDL_PixelFormat 373694468

-- | [C declaration]: @SDL_PIXELFORMAT_ABGR8888@, defined at @SDL3\/SDL_pixels.h 611:5@
pattern SDL_PIXELFORMAT_ABGR8888 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ABGR8888 = SDL_PixelFormat 376840196

-- | [C declaration]: @SDL_PIXELFORMAT_BGRA8888@, defined at @SDL3\/SDL_pixels.h 613:5@
pattern SDL_PIXELFORMAT_BGRA8888 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGRA8888 = SDL_PixelFormat 377888772

-- | [C declaration]: @SDL_PIXELFORMAT_XRGB2101010@, defined at @SDL3\/SDL_pixels.h 615:5@
pattern SDL_PIXELFORMAT_XRGB2101010 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XRGB2101010 = SDL_PixelFormat 370614276

-- | [C declaration]: @SDL_PIXELFORMAT_XBGR2101010@, defined at @SDL3\/SDL_pixels.h 617:5@
pattern SDL_PIXELFORMAT_XBGR2101010 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XBGR2101010 = SDL_PixelFormat 374808580

-- | [C declaration]: @SDL_PIXELFORMAT_ARGB2101010@, defined at @SDL3\/SDL_pixels.h 619:5@
pattern SDL_PIXELFORMAT_ARGB2101010 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ARGB2101010 = SDL_PixelFormat 372711428

-- | [C declaration]: @SDL_PIXELFORMAT_ABGR2101010@, defined at @SDL3\/SDL_pixels.h 621:5@
pattern SDL_PIXELFORMAT_ABGR2101010 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ABGR2101010 = SDL_PixelFormat 376905732

-- | [C declaration]: @SDL_PIXELFORMAT_RGB48@, defined at @SDL3\/SDL_pixels.h 623:5@
pattern SDL_PIXELFORMAT_RGB48 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGB48 = SDL_PixelFormat 403714054

-- | [C declaration]: @SDL_PIXELFORMAT_BGR48@, defined at @SDL3\/SDL_pixels.h 625:5@
pattern SDL_PIXELFORMAT_BGR48 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGR48 = SDL_PixelFormat 406859782

-- | [C declaration]: @SDL_PIXELFORMAT_RGBA64@, defined at @SDL3\/SDL_pixels.h 627:5@
pattern SDL_PIXELFORMAT_RGBA64 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGBA64 = SDL_PixelFormat 404766728

-- | [C declaration]: @SDL_PIXELFORMAT_ARGB64@, defined at @SDL3\/SDL_pixels.h 629:5@
pattern SDL_PIXELFORMAT_ARGB64 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ARGB64 = SDL_PixelFormat 405815304

-- | [C declaration]: @SDL_PIXELFORMAT_BGRA64@, defined at @SDL3\/SDL_pixels.h 631:5@
pattern SDL_PIXELFORMAT_BGRA64 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGRA64 = SDL_PixelFormat 407912456

-- | [C declaration]: @SDL_PIXELFORMAT_ABGR64@, defined at @SDL3\/SDL_pixels.h 633:5@
pattern SDL_PIXELFORMAT_ABGR64 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ABGR64 = SDL_PixelFormat 408961032

-- | [C declaration]: @SDL_PIXELFORMAT_RGB48_FLOAT@, defined at @SDL3\/SDL_pixels.h 635:5@
pattern SDL_PIXELFORMAT_RGB48_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGB48_FLOAT = SDL_PixelFormat 437268486

-- | [C declaration]: @SDL_PIXELFORMAT_BGR48_FLOAT@, defined at @SDL3\/SDL_pixels.h 637:5@
pattern SDL_PIXELFORMAT_BGR48_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGR48_FLOAT = SDL_PixelFormat 440414214

-- | [C declaration]: @SDL_PIXELFORMAT_RGBA64_FLOAT@, defined at @SDL3\/SDL_pixels.h 639:5@
pattern SDL_PIXELFORMAT_RGBA64_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGBA64_FLOAT = SDL_PixelFormat 438321160

-- | [C declaration]: @SDL_PIXELFORMAT_ARGB64_FLOAT@, defined at @SDL3\/SDL_pixels.h 641:5@
pattern SDL_PIXELFORMAT_ARGB64_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ARGB64_FLOAT = SDL_PixelFormat 439369736

-- | [C declaration]: @SDL_PIXELFORMAT_BGRA64_FLOAT@, defined at @SDL3\/SDL_pixels.h 643:5@
pattern SDL_PIXELFORMAT_BGRA64_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGRA64_FLOAT = SDL_PixelFormat 441466888

-- | [C declaration]: @SDL_PIXELFORMAT_ABGR64_FLOAT@, defined at @SDL3\/SDL_pixels.h 645:5@
pattern SDL_PIXELFORMAT_ABGR64_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ABGR64_FLOAT = SDL_PixelFormat 442515464

-- | [C declaration]: @SDL_PIXELFORMAT_RGB96_FLOAT@, defined at @SDL3\/SDL_pixels.h 647:5@
pattern SDL_PIXELFORMAT_RGB96_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGB96_FLOAT = SDL_PixelFormat 454057996

-- | [C declaration]: @SDL_PIXELFORMAT_BGR96_FLOAT@, defined at @SDL3\/SDL_pixels.h 649:5@
pattern SDL_PIXELFORMAT_BGR96_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGR96_FLOAT = SDL_PixelFormat 457203724

-- | [C declaration]: @SDL_PIXELFORMAT_RGBA128_FLOAT@, defined at @SDL3\/SDL_pixels.h 651:5@
pattern SDL_PIXELFORMAT_RGBA128_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGBA128_FLOAT = SDL_PixelFormat 455114768

-- | [C declaration]: @SDL_PIXELFORMAT_ARGB128_FLOAT@, defined at @SDL3\/SDL_pixels.h 653:5@
pattern SDL_PIXELFORMAT_ARGB128_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ARGB128_FLOAT = SDL_PixelFormat 456163344

-- | [C declaration]: @SDL_PIXELFORMAT_BGRA128_FLOAT@, defined at @SDL3\/SDL_pixels.h 655:5@
pattern SDL_PIXELFORMAT_BGRA128_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGRA128_FLOAT = SDL_PixelFormat 458260496

-- | [C declaration]: @SDL_PIXELFORMAT_ABGR128_FLOAT@, defined at @SDL3\/SDL_pixels.h 657:5@
pattern SDL_PIXELFORMAT_ABGR128_FLOAT :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ABGR128_FLOAT = SDL_PixelFormat 459309072

-- | Planar mode: Y + V + U (3 planes)
--
--     [C declaration]: @SDL_PIXELFORMAT_YV12@, defined at @SDL3\/SDL_pixels.h 660:5@
pattern SDL_PIXELFORMAT_YV12 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_YV12 = SDL_PixelFormat 842094169

-- | Planar mode: Y + U + V (3 planes)
--
--     [C declaration]: @SDL_PIXELFORMAT_IYUV@, defined at @SDL3\/SDL_pixels.h 662:5@
pattern SDL_PIXELFORMAT_IYUV :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_IYUV = SDL_PixelFormat 1448433993

-- | Packed mode: Y0+U0+Y1+V0 (1 plane)
--
--     [C declaration]: @SDL_PIXELFORMAT_YUY2@, defined at @SDL3\/SDL_pixels.h 664:5@
pattern SDL_PIXELFORMAT_YUY2 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_YUY2 = SDL_PixelFormat 844715353

-- | Packed mode: U0+Y0+V0+Y1 (1 plane)
--
--     [C declaration]: @SDL_PIXELFORMAT_UYVY@, defined at @SDL3\/SDL_pixels.h 666:5@
pattern SDL_PIXELFORMAT_UYVY :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_UYVY = SDL_PixelFormat 1498831189

-- | Packed mode: Y0+V0+Y1+U0 (1 plane)
--
--     [C declaration]: @SDL_PIXELFORMAT_YVYU@, defined at @SDL3\/SDL_pixels.h 668:5@
pattern SDL_PIXELFORMAT_YVYU :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_YVYU = SDL_PixelFormat 1431918169

-- | Planar mode: Y + U\/V interleaved (2 planes)
--
--     [C declaration]: @SDL_PIXELFORMAT_NV12@, defined at @SDL3\/SDL_pixels.h 670:5@
pattern SDL_PIXELFORMAT_NV12 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_NV12 = SDL_PixelFormat 842094158

-- | Planar mode: Y + V\/U interleaved (2 planes)
--
--     [C declaration]: @SDL_PIXELFORMAT_NV21@, defined at @SDL3\/SDL_pixels.h 672:5@
pattern SDL_PIXELFORMAT_NV21 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_NV21 = SDL_PixelFormat 825382478

-- | Planar mode: Y + U\/V interleaved (2 planes)
--
--     [C declaration]: @SDL_PIXELFORMAT_P010@, defined at @SDL3\/SDL_pixels.h 674:5@
pattern SDL_PIXELFORMAT_P010 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_P010 = SDL_PixelFormat 808530000

-- | Android video texture format
--
--     [C declaration]: @SDL_PIXELFORMAT_EXTERNAL_OES@, defined at @SDL3\/SDL_pixels.h 676:5@
pattern SDL_PIXELFORMAT_EXTERNAL_OES :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_EXTERNAL_OES = SDL_PixelFormat 542328143

-- | Motion JPEG
--
--     [C declaration]: @SDL_PIXELFORMAT_MJPG@, defined at @SDL3\/SDL_pixels.h 679:5@
pattern SDL_PIXELFORMAT_MJPG :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_MJPG = SDL_PixelFormat 1196444237

-- | [C declaration]: @SDL_PIXELFORMAT_RGBA32@, defined at @SDL3\/SDL_pixels.h 693:5@
pattern SDL_PIXELFORMAT_RGBA32 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGBA32 = SDL_PixelFormat 376840196

-- | [C declaration]: @SDL_PIXELFORMAT_ARGB32@, defined at @SDL3\/SDL_pixels.h 694:5@
pattern SDL_PIXELFORMAT_ARGB32 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ARGB32 = SDL_PixelFormat 377888772

-- | [C declaration]: @SDL_PIXELFORMAT_BGRA32@, defined at @SDL3\/SDL_pixels.h 695:5@
pattern SDL_PIXELFORMAT_BGRA32 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGRA32 = SDL_PixelFormat 372645892

-- | [C declaration]: @SDL_PIXELFORMAT_ABGR32@, defined at @SDL3\/SDL_pixels.h 696:5@
pattern SDL_PIXELFORMAT_ABGR32 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_ABGR32 = SDL_PixelFormat 373694468

-- | [C declaration]: @SDL_PIXELFORMAT_RGBX32@, defined at @SDL3\/SDL_pixels.h 697:5@
pattern SDL_PIXELFORMAT_RGBX32 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_RGBX32 = SDL_PixelFormat 374740996

-- | [C declaration]: @SDL_PIXELFORMAT_XRGB32@, defined at @SDL3\/SDL_pixels.h 698:5@
pattern SDL_PIXELFORMAT_XRGB32 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XRGB32 = SDL_PixelFormat 375789572

-- | [C declaration]: @SDL_PIXELFORMAT_BGRX32@, defined at @SDL3\/SDL_pixels.h 699:5@
pattern SDL_PIXELFORMAT_BGRX32 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_BGRX32 = SDL_PixelFormat 370546692

-- | [C declaration]: @SDL_PIXELFORMAT_XBGR32@, defined at @SDL3\/SDL_pixels.h 700:5@
pattern SDL_PIXELFORMAT_XBGR32 :: SDL_PixelFormat
pattern SDL_PIXELFORMAT_XBGR32 = SDL_PixelFormat 371595268

-- | Colorspace color type.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_ColorType@, defined at @SDL3\/SDL_pixels.h 709:14@
newtype SDL_ColorType = SDL_ColorType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ColorType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ColorType where
  readRaw =
    \ptr0 ->
      pure SDL_ColorType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ColorType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ColorType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ColorType instance BG.Storable SDL_ColorType

deriving via BG.CUInt instance BG.Prim SDL_ColorType

instance CEnum.CEnum SDL_ColorType where
  type CEnumZ SDL_ColorType = BG.CUInt

  toCEnum = SDL_ColorType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_COLOR_TYPE_UNKNOWN")
        , (1, BG.singleton "SDL_COLOR_TYPE_RGB")
        , (2, BG.singleton "SDL_COLOR_TYPE_YCBCR")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ColorType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ColorType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_ColorType where
  minDeclaredValue = SDL_COLOR_TYPE_UNKNOWN

  maxDeclaredValue = SDL_COLOR_TYPE_YCBCR

instance Show SDL_ColorType where
  showsPrec = CEnum.shows

instance Read SDL_ColorType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ColorType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ColorType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ColorType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ColorType "unwrap" where
  type CFieldType SDL_ColorType "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_COLOR_TYPE_UNKNOWN@, defined at @SDL3\/SDL_pixels.h 711:5@
pattern SDL_COLOR_TYPE_UNKNOWN :: SDL_ColorType
pattern SDL_COLOR_TYPE_UNKNOWN = SDL_ColorType 0

-- | [C declaration]: @SDL_COLOR_TYPE_RGB@, defined at @SDL3\/SDL_pixels.h 712:5@
pattern SDL_COLOR_TYPE_RGB :: SDL_ColorType
pattern SDL_COLOR_TYPE_RGB = SDL_ColorType 1

-- | [C declaration]: @SDL_COLOR_TYPE_YCBCR@, defined at @SDL3\/SDL_pixels.h 713:5@
pattern SDL_COLOR_TYPE_YCBCR :: SDL_ColorType
pattern SDL_COLOR_TYPE_YCBCR = SDL_ColorType 2

-- | Colorspace color range, as described by [https:\/\/www.itu.int\/rec\/R-REC-BT.2100-2-201807-I\/en](https://www.itu.int/rec/R-REC-BT.2100-2-201807-I/en)
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_ColorRange@, defined at @SDL3\/SDL_pixels.h 722:14@
newtype SDL_ColorRange = SDL_ColorRange
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ColorRange where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ColorRange where
  readRaw =
    \ptr0 ->
      pure SDL_ColorRange
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ColorRange where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ColorRange unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ColorRange instance BG.Storable SDL_ColorRange

deriving via BG.CUInt instance BG.Prim SDL_ColorRange

instance CEnum.CEnum SDL_ColorRange where
  type CEnumZ SDL_ColorRange = BG.CUInt

  toCEnum = SDL_ColorRange

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_COLOR_RANGE_UNKNOWN")
        , (1, BG.singleton "SDL_COLOR_RANGE_LIMITED")
        , (2, BG.singleton "SDL_COLOR_RANGE_FULL")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ColorRange"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ColorRange"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_ColorRange where
  minDeclaredValue = SDL_COLOR_RANGE_UNKNOWN

  maxDeclaredValue = SDL_COLOR_RANGE_FULL

instance Show SDL_ColorRange where
  showsPrec = CEnum.shows

instance Read SDL_ColorRange where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ColorRange ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ColorRange{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ColorRange) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ColorRange "unwrap" where
  type CFieldType SDL_ColorRange "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_COLOR_RANGE_UNKNOWN@, defined at @SDL3\/SDL_pixels.h 724:5@
pattern SDL_COLOR_RANGE_UNKNOWN :: SDL_ColorRange
pattern SDL_COLOR_RANGE_UNKNOWN = SDL_ColorRange 0

-- | Narrow range, e.g. 16-235 for 8-bit RGB and luma, and 16-240 for 8-bit chroma
--
--     [C declaration]: @SDL_COLOR_RANGE_LIMITED@, defined at @SDL3\/SDL_pixels.h 725:5@
pattern SDL_COLOR_RANGE_LIMITED :: SDL_ColorRange
pattern SDL_COLOR_RANGE_LIMITED = SDL_ColorRange 1

-- | Full range, e.g. 0-255 for 8-bit RGB and luma, and 1-255 for 8-bit chroma
--
--     [C declaration]: @SDL_COLOR_RANGE_FULL@, defined at @SDL3\/SDL_pixels.h 726:5@
pattern SDL_COLOR_RANGE_FULL :: SDL_ColorRange
pattern SDL_COLOR_RANGE_FULL = SDL_ColorRange 2

-- | Colorspace color primaries, as described by [https:\/\/www.itu.int\/rec\/T-REC-H.273-201612-S\/en](https://www.itu.int/rec/T-REC-H.273-201612-S/en)
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_ColorPrimaries@, defined at @SDL3\/SDL_pixels.h 735:14@
newtype SDL_ColorPrimaries = SDL_ColorPrimaries
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ColorPrimaries where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ColorPrimaries where
  readRaw =
    \ptr0 ->
      pure SDL_ColorPrimaries
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ColorPrimaries where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ColorPrimaries unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ColorPrimaries instance BG.Storable SDL_ColorPrimaries

deriving via BG.CUInt instance BG.Prim SDL_ColorPrimaries

instance CEnum.CEnum SDL_ColorPrimaries where
  type CEnumZ SDL_ColorPrimaries = BG.CUInt

  toCEnum = SDL_ColorPrimaries

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_COLOR_PRIMARIES_UNKNOWN")
        , (1, BG.singleton "SDL_COLOR_PRIMARIES_BT709")
        , (2, BG.singleton "SDL_COLOR_PRIMARIES_UNSPECIFIED")
        , (4, BG.singleton "SDL_COLOR_PRIMARIES_BT470M")
        , (5, BG.singleton "SDL_COLOR_PRIMARIES_BT470BG")
        , (6, BG.singleton "SDL_COLOR_PRIMARIES_BT601")
        , (7, BG.singleton "SDL_COLOR_PRIMARIES_SMPTE240")
        , (8, BG.singleton "SDL_COLOR_PRIMARIES_GENERIC_FILM")
        , (9, BG.singleton "SDL_COLOR_PRIMARIES_BT2020")
        , (10, BG.singleton "SDL_COLOR_PRIMARIES_XYZ")
        , (11, BG.singleton "SDL_COLOR_PRIMARIES_SMPTE431")
        , (12, BG.singleton "SDL_COLOR_PRIMARIES_SMPTE432")
        , (22, BG.singleton "SDL_COLOR_PRIMARIES_EBU3213")
        , (31, BG.singleton "SDL_COLOR_PRIMARIES_CUSTOM")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ColorPrimaries"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ColorPrimaries"

instance Show SDL_ColorPrimaries where
  showsPrec = CEnum.shows

instance Read SDL_ColorPrimaries where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ColorPrimaries ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ColorPrimaries{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ColorPrimaries) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ColorPrimaries "unwrap" where
  type
    CFieldType SDL_ColorPrimaries "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_COLOR_PRIMARIES_UNKNOWN@, defined at @SDL3\/SDL_pixels.h 737:5@
pattern SDL_COLOR_PRIMARIES_UNKNOWN :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_UNKNOWN = SDL_ColorPrimaries 0

-- | ITU-R BT.709-6
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_BT709@, defined at @SDL3\/SDL_pixels.h 738:5@
pattern SDL_COLOR_PRIMARIES_BT709 :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_BT709 = SDL_ColorPrimaries 1

-- | [C declaration]: @SDL_COLOR_PRIMARIES_UNSPECIFIED@, defined at @SDL3\/SDL_pixels.h 739:5@
pattern SDL_COLOR_PRIMARIES_UNSPECIFIED :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_UNSPECIFIED = SDL_ColorPrimaries 2

-- | ITU-R BT.470-6 System M
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_BT470M@, defined at @SDL3\/SDL_pixels.h 740:5@
pattern SDL_COLOR_PRIMARIES_BT470M :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_BT470M = SDL_ColorPrimaries 4

-- | ITU-R BT.470-6 System B, G \/ ITU-R BT.601-7 625
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_BT470BG@, defined at @SDL3\/SDL_pixels.h 741:5@
pattern SDL_COLOR_PRIMARIES_BT470BG :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_BT470BG = SDL_ColorPrimaries 5

-- | ITU-R BT.601-7 525, SMPTE 170M
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_BT601@, defined at @SDL3\/SDL_pixels.h 742:5@
pattern SDL_COLOR_PRIMARIES_BT601 :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_BT601 = SDL_ColorPrimaries 6

-- | SMPTE 240M, functionally the same as SDL_COLOR_PRIMARIES_BT601
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_SMPTE240@, defined at @SDL3\/SDL_pixels.h 743:5@
pattern SDL_COLOR_PRIMARIES_SMPTE240 :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_SMPTE240 = SDL_ColorPrimaries 7

-- | Generic film (color filters using Illuminant C)
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_GENERIC_FILM@, defined at @SDL3\/SDL_pixels.h 744:5@
pattern SDL_COLOR_PRIMARIES_GENERIC_FILM :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_GENERIC_FILM = SDL_ColorPrimaries 8

-- | ITU-R BT.2020-2 \/ ITU-R BT.2100-0
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_BT2020@, defined at @SDL3\/SDL_pixels.h 745:5@
pattern SDL_COLOR_PRIMARIES_BT2020 :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_BT2020 = SDL_ColorPrimaries 9

-- | SMPTE ST 428-1
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_XYZ@, defined at @SDL3\/SDL_pixels.h 746:5@
pattern SDL_COLOR_PRIMARIES_XYZ :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_XYZ = SDL_ColorPrimaries 10

-- | SMPTE RP 431-2
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_SMPTE431@, defined at @SDL3\/SDL_pixels.h 747:5@
pattern SDL_COLOR_PRIMARIES_SMPTE431 :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_SMPTE431 = SDL_ColorPrimaries 11

-- | SMPTE EG 432-1 \/ DCI P3
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_SMPTE432@, defined at @SDL3\/SDL_pixels.h 748:5@
pattern SDL_COLOR_PRIMARIES_SMPTE432 :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_SMPTE432 = SDL_ColorPrimaries 12

-- | EBU Tech. 3213-E
--
--     [C declaration]: @SDL_COLOR_PRIMARIES_EBU3213@, defined at @SDL3\/SDL_pixels.h 749:5@
pattern SDL_COLOR_PRIMARIES_EBU3213 :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_EBU3213 = SDL_ColorPrimaries 22

-- | [C declaration]: @SDL_COLOR_PRIMARIES_CUSTOM@, defined at @SDL3\/SDL_pixels.h 750:5@
pattern SDL_COLOR_PRIMARIES_CUSTOM :: SDL_ColorPrimaries
pattern SDL_COLOR_PRIMARIES_CUSTOM = SDL_ColorPrimaries 31

-- | Colorspace transfer characteristics.
--
--     These are as described by [https:\/\/www.itu.int\/rec\/T-REC-H.273-201612-S\/en](https://www.itu.int/rec/T-REC-H.273-201612-S/en)
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_TransferCharacteristics@, defined at @SDL3\/SDL_pixels.h 760:14@
newtype SDL_TransferCharacteristics = SDL_TransferCharacteristics
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_TransferCharacteristics where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_TransferCharacteristics where
  readRaw =
    \ptr0 ->
      pure SDL_TransferCharacteristics
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_TransferCharacteristics where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TransferCharacteristics unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_TransferCharacteristics
  instance
    BG.Storable SDL_TransferCharacteristics

deriving via BG.CUInt instance BG.Prim SDL_TransferCharacteristics

instance CEnum.CEnum SDL_TransferCharacteristics where
  type CEnumZ SDL_TransferCharacteristics = BG.CUInt

  toCEnum = SDL_TransferCharacteristics

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_UNKNOWN")
        , (1, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_BT709")
        , (2, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED")
        , (4, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_GAMMA22")
        , (5, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_GAMMA28")
        , (6, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_BT601")
        , (7, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_SMPTE240")
        , (8, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_LINEAR")
        , (9, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_LOG100")
        , (10, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10")
        , (11, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_IEC61966")
        , (12, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_BT1361")
        , (13, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_SRGB")
        , (14, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT")
        , (15, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT")
        , (16, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_PQ")
        , (17, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_SMPTE428")
        , (18, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_HLG")
        , (31, BG.singleton "SDL_TRANSFER_CHARACTERISTICS_CUSTOM")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_TransferCharacteristics"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_TransferCharacteristics"

instance Show SDL_TransferCharacteristics where
  showsPrec = CEnum.shows

instance Read SDL_TransferCharacteristics where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_TransferCharacteristics ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TransferCharacteristics{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_TransferCharacteristics) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TransferCharacteristics "unwrap" where
  type
    CFieldType SDL_TransferCharacteristics "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_UNKNOWN@, defined at @SDL3\/SDL_pixels.h 762:5@
pattern SDL_TRANSFER_CHARACTERISTICS_UNKNOWN :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_UNKNOWN = SDL_TransferCharacteristics 0

-- | Rec. ITU-R BT.709-6 \/ ITU-R BT1361
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_BT709@, defined at @SDL3\/SDL_pixels.h 763:5@
pattern SDL_TRANSFER_CHARACTERISTICS_BT709 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_BT709 = SDL_TransferCharacteristics 1

-- | [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED@, defined at @SDL3\/SDL_pixels.h 764:5@
pattern SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED = SDL_TransferCharacteristics 2

-- | ITU-R BT.470-6 System M \/ ITU-R BT1700 625 PAL & SECAM
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_GAMMA22@, defined at @SDL3\/SDL_pixels.h 765:5@
pattern SDL_TRANSFER_CHARACTERISTICS_GAMMA22 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_GAMMA22 = SDL_TransferCharacteristics 4

-- | ITU-R BT.470-6 System B, G
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_GAMMA28@, defined at @SDL3\/SDL_pixels.h 766:5@
pattern SDL_TRANSFER_CHARACTERISTICS_GAMMA28 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_GAMMA28 = SDL_TransferCharacteristics 5

-- | SMPTE ST 170M \/ ITU-R BT.601-7 525 or 625
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_BT601@, defined at @SDL3\/SDL_pixels.h 767:5@
pattern SDL_TRANSFER_CHARACTERISTICS_BT601 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_BT601 = SDL_TransferCharacteristics 6

-- | SMPTE ST 240M
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_SMPTE240@, defined at @SDL3\/SDL_pixels.h 768:5@
pattern SDL_TRANSFER_CHARACTERISTICS_SMPTE240 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_SMPTE240 = SDL_TransferCharacteristics 7

-- | [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_LINEAR@, defined at @SDL3\/SDL_pixels.h 769:5@
pattern SDL_TRANSFER_CHARACTERISTICS_LINEAR :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_LINEAR = SDL_TransferCharacteristics 8

-- | [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_LOG100@, defined at @SDL3\/SDL_pixels.h 770:5@
pattern SDL_TRANSFER_CHARACTERISTICS_LOG100 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_LOG100 = SDL_TransferCharacteristics 9

-- | [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10@, defined at @SDL3\/SDL_pixels.h 771:5@
pattern SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10 = SDL_TransferCharacteristics 10

-- | IEC 61966-2-4
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_IEC61966@, defined at @SDL3\/SDL_pixels.h 772:5@
pattern SDL_TRANSFER_CHARACTERISTICS_IEC61966 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_IEC61966 = SDL_TransferCharacteristics 11

-- | ITU-R BT1361 Extended Colour Gamut
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_BT1361@, defined at @SDL3\/SDL_pixels.h 773:5@
pattern SDL_TRANSFER_CHARACTERISTICS_BT1361 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_BT1361 = SDL_TransferCharacteristics 12

-- | IEC 61966-2-1 (sRGB or sYCC)
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_SRGB@, defined at @SDL3\/SDL_pixels.h 774:5@
pattern SDL_TRANSFER_CHARACTERISTICS_SRGB :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_SRGB = SDL_TransferCharacteristics 13

-- | ITU-R BT2020 for 10-bit system
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT@, defined at @SDL3\/SDL_pixels.h 775:5@
pattern SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT = SDL_TransferCharacteristics 14

-- | ITU-R BT2020 for 12-bit system
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT@, defined at @SDL3\/SDL_pixels.h 776:5@
pattern SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT = SDL_TransferCharacteristics 15

-- | SMPTE ST 2084 for 10-, 12-, 14- and 16-bit systems
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_PQ@, defined at @SDL3\/SDL_pixels.h 777:5@
pattern SDL_TRANSFER_CHARACTERISTICS_PQ :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_PQ = SDL_TransferCharacteristics 16

-- | SMPTE ST 428-1
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_SMPTE428@, defined at @SDL3\/SDL_pixels.h 778:5@
pattern SDL_TRANSFER_CHARACTERISTICS_SMPTE428 :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_SMPTE428 = SDL_TransferCharacteristics 17

-- | ARIB STD-B67, known as \"hybrid log-gamma\" (HLG)
--
--     [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_HLG@, defined at @SDL3\/SDL_pixels.h 779:5@
pattern SDL_TRANSFER_CHARACTERISTICS_HLG :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_HLG = SDL_TransferCharacteristics 18

-- | [C declaration]: @SDL_TRANSFER_CHARACTERISTICS_CUSTOM@, defined at @SDL3\/SDL_pixels.h 780:5@
pattern SDL_TRANSFER_CHARACTERISTICS_CUSTOM :: SDL_TransferCharacteristics
pattern SDL_TRANSFER_CHARACTERISTICS_CUSTOM = SDL_TransferCharacteristics 31

-- | Colorspace matrix coefficients.
--
--     These are as described by [https:\/\/www.itu.int\/rec\/T-REC-H.273-201612-S\/en](https://www.itu.int/rec/T-REC-H.273-201612-S/en)
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_MatrixCoefficients@, defined at @SDL3\/SDL_pixels.h 790:14@
newtype SDL_MatrixCoefficients = SDL_MatrixCoefficients
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_MatrixCoefficients where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_MatrixCoefficients where
  readRaw =
    \ptr0 ->
      pure SDL_MatrixCoefficients
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_MatrixCoefficients where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MatrixCoefficients unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_MatrixCoefficients
  instance
    BG.Storable SDL_MatrixCoefficients

deriving via BG.CUInt instance BG.Prim SDL_MatrixCoefficients

instance CEnum.CEnum SDL_MatrixCoefficients where
  type CEnumZ SDL_MatrixCoefficients = BG.CUInt

  toCEnum = SDL_MatrixCoefficients

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_MATRIX_COEFFICIENTS_IDENTITY")
        , (1, BG.singleton "SDL_MATRIX_COEFFICIENTS_BT709")
        , (2, BG.singleton "SDL_MATRIX_COEFFICIENTS_UNSPECIFIED")
        , (4, BG.singleton "SDL_MATRIX_COEFFICIENTS_FCC")
        , (5, BG.singleton "SDL_MATRIX_COEFFICIENTS_BT470BG")
        , (6, BG.singleton "SDL_MATRIX_COEFFICIENTS_BT601")
        , (7, BG.singleton "SDL_MATRIX_COEFFICIENTS_SMPTE240")
        , (8, BG.singleton "SDL_MATRIX_COEFFICIENTS_YCGCO")
        , (9, BG.singleton "SDL_MATRIX_COEFFICIENTS_BT2020_NCL")
        , (10, BG.singleton "SDL_MATRIX_COEFFICIENTS_BT2020_CL")
        , (11, BG.singleton "SDL_MATRIX_COEFFICIENTS_SMPTE2085")
        , (12, BG.singleton "SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL")
        , (13, BG.singleton "SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL")
        , (14, BG.singleton "SDL_MATRIX_COEFFICIENTS_ICTCP")
        , (31, BG.singleton "SDL_MATRIX_COEFFICIENTS_CUSTOM")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_MatrixCoefficients"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_MatrixCoefficients"

instance Show SDL_MatrixCoefficients where
  showsPrec = CEnum.shows

instance Read SDL_MatrixCoefficients where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_MatrixCoefficients ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MatrixCoefficients{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_MatrixCoefficients) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MatrixCoefficients "unwrap" where
  type
    CFieldType SDL_MatrixCoefficients "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_MATRIX_COEFFICIENTS_IDENTITY@, defined at @SDL3\/SDL_pixels.h 792:5@
pattern SDL_MATRIX_COEFFICIENTS_IDENTITY :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_IDENTITY = SDL_MatrixCoefficients 0

-- | ITU-R BT.709-6
--
--     [C declaration]: @SDL_MATRIX_COEFFICIENTS_BT709@, defined at @SDL3\/SDL_pixels.h 793:5@
pattern SDL_MATRIX_COEFFICIENTS_BT709 :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_BT709 = SDL_MatrixCoefficients 1

-- | [C declaration]: @SDL_MATRIX_COEFFICIENTS_UNSPECIFIED@, defined at @SDL3\/SDL_pixels.h 794:5@
pattern SDL_MATRIX_COEFFICIENTS_UNSPECIFIED :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_UNSPECIFIED = SDL_MatrixCoefficients 2

-- | US FCC Title 47
--
--     [C declaration]: @SDL_MATRIX_COEFFICIENTS_FCC@, defined at @SDL3\/SDL_pixels.h 795:5@
pattern SDL_MATRIX_COEFFICIENTS_FCC :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_FCC = SDL_MatrixCoefficients 4

-- | ITU-R BT.470-6 System B, G \/ ITU-R BT.601-7 625, functionally the same as SDL_MATRIX_COEFFICIENTS_BT601
--
--     [C declaration]: @SDL_MATRIX_COEFFICIENTS_BT470BG@, defined at @SDL3\/SDL_pixels.h 796:5@
pattern SDL_MATRIX_COEFFICIENTS_BT470BG :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_BT470BG = SDL_MatrixCoefficients 5

-- | ITU-R BT.601-7 525
--
--     [C declaration]: @SDL_MATRIX_COEFFICIENTS_BT601@, defined at @SDL3\/SDL_pixels.h 797:5@
pattern SDL_MATRIX_COEFFICIENTS_BT601 :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_BT601 = SDL_MatrixCoefficients 6

-- | SMPTE 240M
--
--     [C declaration]: @SDL_MATRIX_COEFFICIENTS_SMPTE240@, defined at @SDL3\/SDL_pixels.h 798:5@
pattern SDL_MATRIX_COEFFICIENTS_SMPTE240 :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_SMPTE240 = SDL_MatrixCoefficients 7

-- | [C declaration]: @SDL_MATRIX_COEFFICIENTS_YCGCO@, defined at @SDL3\/SDL_pixels.h 799:5@
pattern SDL_MATRIX_COEFFICIENTS_YCGCO :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_YCGCO = SDL_MatrixCoefficients 8

-- | ITU-R BT.2020-2 non-constant luminance
--
--     [C declaration]: @SDL_MATRIX_COEFFICIENTS_BT2020_NCL@, defined at @SDL3\/SDL_pixels.h 800:5@
pattern SDL_MATRIX_COEFFICIENTS_BT2020_NCL :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_BT2020_NCL = SDL_MatrixCoefficients 9

-- | ITU-R BT.2020-2 constant luminance
--
--     [C declaration]: @SDL_MATRIX_COEFFICIENTS_BT2020_CL@, defined at @SDL3\/SDL_pixels.h 801:5@
pattern SDL_MATRIX_COEFFICIENTS_BT2020_CL :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_BT2020_CL = SDL_MatrixCoefficients 10

-- | SMPTE ST 2085
--
--     [C declaration]: @SDL_MATRIX_COEFFICIENTS_SMPTE2085@, defined at @SDL3\/SDL_pixels.h 802:5@
pattern SDL_MATRIX_COEFFICIENTS_SMPTE2085 :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_SMPTE2085 = SDL_MatrixCoefficients 11

-- | [C declaration]: @SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL@, defined at @SDL3\/SDL_pixels.h 803:5@
pattern SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL = SDL_MatrixCoefficients 12

-- | [C declaration]: @SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL@, defined at @SDL3\/SDL_pixels.h 804:5@
pattern SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL = SDL_MatrixCoefficients 13

-- | ITU-R BT.2100-0 ICTCP
--
--     [C declaration]: @SDL_MATRIX_COEFFICIENTS_ICTCP@, defined at @SDL3\/SDL_pixels.h 805:5@
pattern SDL_MATRIX_COEFFICIENTS_ICTCP :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_ICTCP = SDL_MatrixCoefficients 14

-- | [C declaration]: @SDL_MATRIX_COEFFICIENTS_CUSTOM@, defined at @SDL3\/SDL_pixels.h 806:5@
pattern SDL_MATRIX_COEFFICIENTS_CUSTOM :: SDL_MatrixCoefficients
pattern SDL_MATRIX_COEFFICIENTS_CUSTOM = SDL_MatrixCoefficients 31

-- | Colorspace chroma sample location.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_ChromaLocation@, defined at @SDL3\/SDL_pixels.h 814:14@
newtype SDL_ChromaLocation = SDL_ChromaLocation
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ChromaLocation where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ChromaLocation where
  readRaw =
    \ptr0 ->
      pure SDL_ChromaLocation
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ChromaLocation where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ChromaLocation unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ChromaLocation instance BG.Storable SDL_ChromaLocation

deriving via BG.CUInt instance BG.Prim SDL_ChromaLocation

instance CEnum.CEnum SDL_ChromaLocation where
  type CEnumZ SDL_ChromaLocation = BG.CUInt

  toCEnum = SDL_ChromaLocation

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_CHROMA_LOCATION_NONE")
        , (1, BG.singleton "SDL_CHROMA_LOCATION_LEFT")
        , (2, BG.singleton "SDL_CHROMA_LOCATION_CENTER")
        , (3, BG.singleton "SDL_CHROMA_LOCATION_TOPLEFT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ChromaLocation"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ChromaLocation"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_ChromaLocation where
  minDeclaredValue = SDL_CHROMA_LOCATION_NONE

  maxDeclaredValue = SDL_CHROMA_LOCATION_TOPLEFT

instance Show SDL_ChromaLocation where
  showsPrec = CEnum.shows

instance Read SDL_ChromaLocation where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ChromaLocation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ChromaLocation{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ChromaLocation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ChromaLocation "unwrap" where
  type
    CFieldType SDL_ChromaLocation "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | RGB, no chroma sampling
--
--     [C declaration]: @SDL_CHROMA_LOCATION_NONE@, defined at @SDL3\/SDL_pixels.h 816:5@
pattern SDL_CHROMA_LOCATION_NONE :: SDL_ChromaLocation
pattern SDL_CHROMA_LOCATION_NONE = SDL_ChromaLocation 0

-- | In MPEG-2, MPEG-4, and AVC, Cb and Cr are taken on midpoint of the left-edge of the 2x2 square. In other words, they have the same horizontal location as the top-left pixel, but is shifted one-half pixel down vertically.
--
--     [C declaration]: @SDL_CHROMA_LOCATION_LEFT@, defined at @SDL3\/SDL_pixels.h 817:5@
pattern SDL_CHROMA_LOCATION_LEFT :: SDL_ChromaLocation
pattern SDL_CHROMA_LOCATION_LEFT = SDL_ChromaLocation 1

-- | In JPEG\/JFIF, H.261, and MPEG-1, Cb and Cr are taken at the center of the 2x2 square. In other words, they are offset one-half pixel to the right and one-half pixel down compared to the top-left pixel.
--
--     [C declaration]: @SDL_CHROMA_LOCATION_CENTER@, defined at @SDL3\/SDL_pixels.h 818:5@
pattern SDL_CHROMA_LOCATION_CENTER :: SDL_ChromaLocation
pattern SDL_CHROMA_LOCATION_CENTER = SDL_ChromaLocation 2

-- | In HEVC for BT.2020 and BT.2100 content (in particular on Blu-rays), Cb and Cr are sampled at the same location as the group\'s top-left Y pixel (\"co-sited\", \"co-located\").
--
--     [C declaration]: @SDL_CHROMA_LOCATION_TOPLEFT@, defined at @SDL3\/SDL_pixels.h 819:5@
pattern SDL_CHROMA_LOCATION_TOPLEFT :: SDL_ChromaLocation
pattern SDL_CHROMA_LOCATION_TOPLEFT = SDL_ChromaLocation 3

-- | Colorspace definitions.
--
--     Since similar colorspaces may vary in their details (matrix, transfer function, etc.), this is not an exhaustive list, but rather a representative sample of the kinds of colorspaces supported in SDL.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_ColorPrimaries', 'SDL_ColorRange', 'SDL_ColorType', 'SDL_MatrixCoefficients', 'SDL_TransferCharacteristics'
--
--     [C declaration]: @enum SDL_Colorspace@, defined at @SDL3\/SDL_pixels.h 1011:14@
newtype SDL_Colorspace = SDL_Colorspace
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_Colorspace where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_Colorspace where
  readRaw =
    \ptr0 ->
      pure SDL_Colorspace
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_Colorspace where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Colorspace unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_Colorspace instance BG.Storable SDL_Colorspace

deriving via BG.CUInt instance BG.Prim SDL_Colorspace

instance CEnum.CEnum SDL_Colorspace where
  type CEnumZ SDL_Colorspace = BG.CUInt

  toCEnum = SDL_Colorspace

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_COLORSPACE_UNKNOWN")
        , (301991168, BG.singleton "SDL_COLORSPACE_SRGB_LINEAR")
        , (301991328, ("SDL_COLORSPACE_SRGB" BG.:| ["SDL_COLORSPACE_RGB_DEFAULT"]))
        , (301999616, BG.singleton "SDL_COLORSPACE_HDR10")
        , (554697761, BG.singleton "SDL_COLORSPACE_BT709_LIMITED")
        ,
          ( 554703046
          , ("SDL_COLORSPACE_BT601_LIMITED" BG.:| ["SDL_COLORSPACE_YUV_DEFAULT"])
          )
        , (554706441, BG.singleton "SDL_COLORSPACE_BT2020_LIMITED")
        , (570426566, BG.singleton "SDL_COLORSPACE_JPEG")
        , (571474977, BG.singleton "SDL_COLORSPACE_BT709_FULL")
        , (571480262, BG.singleton "SDL_COLORSPACE_BT601_FULL")
        , (571483657, BG.singleton "SDL_COLORSPACE_BT2020_FULL")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_Colorspace"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_Colorspace"

instance Show SDL_Colorspace where
  showsPrec = CEnum.shows

instance Read SDL_Colorspace where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_Colorspace ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Colorspace{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_Colorspace) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_Colorspace "unwrap" where
  type CFieldType SDL_Colorspace "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_COLORSPACE_UNKNOWN@, defined at @SDL3\/SDL_pixels.h 1013:5@
pattern SDL_COLORSPACE_UNKNOWN :: SDL_Colorspace
pattern SDL_COLORSPACE_UNKNOWN = SDL_Colorspace 0

-- | Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709
--
--     [C declaration]: @SDL_COLORSPACE_SRGB@, defined at @SDL3\/SDL_pixels.h 1016:5@
pattern SDL_COLORSPACE_SRGB :: SDL_Colorspace
pattern SDL_COLORSPACE_SRGB = SDL_Colorspace 301991328

-- | Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709
--
--     [C declaration]: @SDL_COLORSPACE_SRGB_LINEAR@, defined at @SDL3\/SDL_pixels.h 1025:5@
pattern SDL_COLORSPACE_SRGB_LINEAR :: SDL_Colorspace
pattern SDL_COLORSPACE_SRGB_LINEAR = SDL_Colorspace 301991168

-- | Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020
--
--     [C declaration]: @SDL_COLORSPACE_HDR10@, defined at @SDL3\/SDL_pixels.h 1034:5@
pattern SDL_COLORSPACE_HDR10 :: SDL_Colorspace
pattern SDL_COLORSPACE_HDR10 = SDL_Colorspace 301999616

-- | Equivalent to DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601
--
--     [C declaration]: @SDL_COLORSPACE_JPEG@, defined at @SDL3\/SDL_pixels.h 1042:5@
pattern SDL_COLORSPACE_JPEG :: SDL_Colorspace
pattern SDL_COLORSPACE_JPEG = SDL_Colorspace 570426566

-- | Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601
--
--     [C declaration]: @SDL_COLORSPACE_BT601_LIMITED@, defined at @SDL3\/SDL_pixels.h 1050:5@
pattern SDL_COLORSPACE_BT601_LIMITED :: SDL_Colorspace
pattern SDL_COLORSPACE_BT601_LIMITED = SDL_Colorspace 554703046

-- | Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601
--
--     [C declaration]: @SDL_COLORSPACE_BT601_FULL@, defined at @SDL3\/SDL_pixels.h 1058:5@
pattern SDL_COLORSPACE_BT601_FULL :: SDL_Colorspace
pattern SDL_COLORSPACE_BT601_FULL = SDL_Colorspace 571480262

-- | Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709
--
--     [C declaration]: @SDL_COLORSPACE_BT709_LIMITED@, defined at @SDL3\/SDL_pixels.h 1066:5@
pattern SDL_COLORSPACE_BT709_LIMITED :: SDL_Colorspace
pattern SDL_COLORSPACE_BT709_LIMITED = SDL_Colorspace 554697761

-- | Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709
--
--     [C declaration]: @SDL_COLORSPACE_BT709_FULL@, defined at @SDL3\/SDL_pixels.h 1074:5@
pattern SDL_COLORSPACE_BT709_FULL :: SDL_Colorspace
pattern SDL_COLORSPACE_BT709_FULL = SDL_Colorspace 571474977

-- | Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020
--
--     [C declaration]: @SDL_COLORSPACE_BT2020_LIMITED@, defined at @SDL3\/SDL_pixels.h 1082:5@
pattern SDL_COLORSPACE_BT2020_LIMITED :: SDL_Colorspace
pattern SDL_COLORSPACE_BT2020_LIMITED = SDL_Colorspace 554706441

-- | Equivalent to DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020
--
--     [C declaration]: @SDL_COLORSPACE_BT2020_FULL@, defined at @SDL3\/SDL_pixels.h 1090:5@
pattern SDL_COLORSPACE_BT2020_FULL :: SDL_Colorspace
pattern SDL_COLORSPACE_BT2020_FULL = SDL_Colorspace 571483657

-- | The default colorspace for RGB surfaces if no colorspace is specified
--
--     [C declaration]: @SDL_COLORSPACE_RGB_DEFAULT@, defined at @SDL3\/SDL_pixels.h 1098:5@
pattern SDL_COLORSPACE_RGB_DEFAULT :: SDL_Colorspace
pattern SDL_COLORSPACE_RGB_DEFAULT = SDL_Colorspace 301991328

-- | The default colorspace for YUV surfaces if no colorspace is specified
--
--     [C declaration]: @SDL_COLORSPACE_YUV_DEFAULT@, defined at @SDL3\/SDL_pixels.h 1099:5@
pattern SDL_COLORSPACE_YUV_DEFAULT :: SDL_Colorspace
pattern SDL_COLORSPACE_YUV_DEFAULT = SDL_Colorspace 554703046

-- | A structure that represents a color as RGBA components.
--
--     The bits of this structure can be directly reinterpreted as an integer-packed color which uses the SDL_PIXELFORMAT_RGBA32 format (SDL_PIXELFORMAT_ABGR8888 on little-endian systems and SDL_PIXELFORMAT_RGBA8888 on big-endian systems).
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_Color@, defined at @SDL3\/SDL_pixels.h 1112:16@
data SDL_Color = SDL_Color
  { r :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @r@, defined at @SDL3\/SDL_pixels.h 1114:11@
  , g :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @g@, defined at @SDL3\/SDL_pixels.h 1115:11@
  , b :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @b@, defined at @SDL3\/SDL_pixels.h 1116:11@
  , a :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @a@, defined at @SDL3\/SDL_pixels.h 1117:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_Color where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (1 :: Int)

instance Marshal.ReadRaw SDL_Color where
  readRaw =
    \ptr0 ->
      pure SDL_Color
        <*> HasCField.readRaw (BG.Proxy @"r") ptr0
        <*> HasCField.readRaw (BG.Proxy @"g") ptr0
        <*> HasCField.readRaw (BG.Proxy @"b") ptr0
        <*> HasCField.readRaw (BG.Proxy @"a") ptr0

instance Marshal.WriteRaw SDL_Color where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Color r2 g3 b4 a5 ->
            HasCField.writeRaw (BG.Proxy @"r") ptr0 r2
              >> HasCField.writeRaw (BG.Proxy @"g") ptr0 g3
              >> HasCField.writeRaw (BG.Proxy @"b") ptr0 b4
              >> HasCField.writeRaw (BG.Proxy @"a") ptr0 a5

deriving via Marshal.EquivStorable SDL_Color instance BG.Storable SDL_Color

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "r" SDL_Color ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Color
            { r = y1
            , g = BG.getField @"g" x0
            , b = BG.getField @"b" x0
            , a = BG.getField @"a" x0
            }
      , BG.getField @"r" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "r" (BG.Ptr SDL_Color) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"r")

instance HasCField.HasCField SDL_Color "r" where
  type
    CFieldType SDL_Color "r" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "g" SDL_Color ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Color
            { g = y1
            , r = BG.getField @"r" x0
            , b = BG.getField @"b" x0
            , a = BG.getField @"a" x0
            }
      , BG.getField @"g" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "g" (BG.Ptr SDL_Color) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"g")

instance HasCField.HasCField SDL_Color "g" where
  type
    CFieldType SDL_Color "g" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 1

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "b" SDL_Color ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Color
            { b = y1
            , r = BG.getField @"r" x0
            , g = BG.getField @"g" x0
            , a = BG.getField @"a" x0
            }
      , BG.getField @"b" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "b" (BG.Ptr SDL_Color) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"b")

instance HasCField.HasCField SDL_Color "b" where
  type
    CFieldType SDL_Color "b" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 2

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "a" SDL_Color ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Color
            { a = y1
            , r = BG.getField @"r" x0
            , g = BG.getField @"g" x0
            , b = BG.getField @"b" x0
            }
      , BG.getField @"a" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "a" (BG.Ptr SDL_Color) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"a")

instance HasCField.HasCField SDL_Color "a" where
  type
    CFieldType SDL_Color "a" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 3

-- | The bits of this structure can be directly reinterpreted as a float-packed color which uses the SDL_PIXELFORMAT_RGBA128_FLOAT format
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_FColor@, defined at @SDL3\/SDL_pixels.h 1126:16@
data SDL_FColor = SDL_FColor
  { r :: BG.CFloat
  -- ^ [C declaration]: @r@, defined at @SDL3\/SDL_pixels.h 1128:11@
  , g :: BG.CFloat
  -- ^ [C declaration]: @g@, defined at @SDL3\/SDL_pixels.h 1129:11@
  , b :: BG.CFloat
  -- ^ [C declaration]: @b@, defined at @SDL3\/SDL_pixels.h 1130:11@
  , a :: BG.CFloat
  -- ^ [C declaration]: @a@, defined at @SDL3\/SDL_pixels.h 1131:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_FColor where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_FColor where
  readRaw =
    \ptr0 ->
      pure SDL_FColor
        <*> HasCField.readRaw (BG.Proxy @"r") ptr0
        <*> HasCField.readRaw (BG.Proxy @"g") ptr0
        <*> HasCField.readRaw (BG.Proxy @"b") ptr0
        <*> HasCField.readRaw (BG.Proxy @"a") ptr0

instance Marshal.WriteRaw SDL_FColor where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_FColor r2 g3 b4 a5 ->
            HasCField.writeRaw (BG.Proxy @"r") ptr0 r2
              >> HasCField.writeRaw (BG.Proxy @"g") ptr0 g3
              >> HasCField.writeRaw (BG.Proxy @"b") ptr0 b4
              >> HasCField.writeRaw (BG.Proxy @"a") ptr0 a5

deriving via Marshal.EquivStorable SDL_FColor instance BG.Storable SDL_FColor

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "r" SDL_FColor ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FColor
            { r = y1
            , g = BG.getField @"g" x0
            , b = BG.getField @"b" x0
            , a = BG.getField @"a" x0
            }
      , BG.getField @"r" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "r" (BG.Ptr SDL_FColor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"r")

instance HasCField.HasCField SDL_FColor "r" where
  type CFieldType SDL_FColor "r" = BG.CFloat

  offset# = \_ -> \_ -> 0

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "g" SDL_FColor ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FColor
            { g = y1
            , r = BG.getField @"r" x0
            , b = BG.getField @"b" x0
            , a = BG.getField @"a" x0
            }
      , BG.getField @"g" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "g" (BG.Ptr SDL_FColor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"g")

instance HasCField.HasCField SDL_FColor "g" where
  type CFieldType SDL_FColor "g" = BG.CFloat

  offset# = \_ -> \_ -> 4

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "b" SDL_FColor ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FColor
            { b = y1
            , r = BG.getField @"r" x0
            , g = BG.getField @"g" x0
            , a = BG.getField @"a" x0
            }
      , BG.getField @"b" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "b" (BG.Ptr SDL_FColor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"b")

instance HasCField.HasCField SDL_FColor "b" where
  type CFieldType SDL_FColor "b" = BG.CFloat

  offset# = \_ -> \_ -> 8

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "a" SDL_FColor ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FColor
            { a = y1
            , r = BG.getField @"r" x0
            , g = BG.getField @"g" x0
            , b = BG.getField @"b" x0
            }
      , BG.getField @"a" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "a" (BG.Ptr SDL_FColor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"a")

instance HasCField.HasCField SDL_FColor "a" where
  type CFieldType SDL_FColor "a" = BG.CFloat

  offset# = \_ -> \_ -> 12

-- | A set of indexed colors representing a palette.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetPaletteColors'
--
--     [C declaration]: @struct SDL_Palette@, defined at @SDL3\/SDL_pixels.h 1141:16@
data SDL_Palette = SDL_Palette
  { ncolors :: BG.CInt
  -- ^ number of elements in @colors@.
  --
  --          [C declaration]: @ncolors@, defined at @SDL3\/SDL_pixels.h 1143:9@
  , colors :: BG.Ptr SDL_Color
  -- ^ an array of colors, @ncolors@ long.
  --
  --          [C declaration]: @colors@, defined at @SDL3\/SDL_pixels.h 1144:16@
  , version :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ internal use only, do not touch.
  --
  --          [C declaration]: @version@, defined at @SDL3\/SDL_pixels.h 1145:12@
  , refcount :: BG.CInt
  -- ^ internal use only, do not touch.
  --
  --          [C declaration]: @refcount@, defined at @SDL3\/SDL_pixels.h 1146:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_Palette where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_Palette where
  readRaw =
    \ptr0 ->
      pure SDL_Palette
        <*> HasCField.readRaw (BG.Proxy @"ncolors") ptr0
        <*> HasCField.readRaw (BG.Proxy @"colors") ptr0
        <*> HasCField.readRaw (BG.Proxy @"version") ptr0
        <*> HasCField.readRaw (BG.Proxy @"refcount") ptr0

instance Marshal.WriteRaw SDL_Palette where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Palette ncolors2 colors3 version4 refcount5 ->
            HasCField.writeRaw (BG.Proxy @"ncolors") ptr0 ncolors2
              >> HasCField.writeRaw (BG.Proxy @"colors") ptr0 colors3
              >> HasCField.writeRaw (BG.Proxy @"version") ptr0 version4
              >> HasCField.writeRaw (BG.Proxy @"refcount") ptr0 refcount5

deriving via Marshal.EquivStorable SDL_Palette instance BG.Storable SDL_Palette

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "ncolors" SDL_Palette ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Palette
            { ncolors = y1
            , colors = BG.getField @"colors" x0
            , version = BG.getField @"version" x0
            , refcount = BG.getField @"refcount" x0
            }
      , BG.getField @"ncolors" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "ncolors" (BG.Ptr SDL_Palette) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"ncolors")

instance HasCField.HasCField SDL_Palette "ncolors" where
  type CFieldType SDL_Palette "ncolors" = BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.Ptr SDL_Color)
  => BG.CompatHasField.HasField "colors" SDL_Palette ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Palette
            { colors = y1
            , ncolors = BG.getField @"ncolors" x0
            , version = BG.getField @"version" x0
            , refcount = BG.getField @"refcount" x0
            }
      , BG.getField @"colors" x0
      )

instance
  (ty ~ BG.Ptr SDL_Color)
  => BG.HasField "colors" (BG.Ptr SDL_Palette) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"colors")

instance HasCField.HasCField SDL_Palette "colors" where
  type
    CFieldType SDL_Palette "colors" =
      BG.Ptr SDL_Color

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "version" SDL_Palette ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Palette
            { version = y1
            , ncolors = BG.getField @"ncolors" x0
            , colors = BG.getField @"colors" x0
            , refcount = BG.getField @"refcount" x0
            }
      , BG.getField @"version" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "version" (BG.Ptr SDL_Palette) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"version")

instance HasCField.HasCField SDL_Palette "version" where
  type
    CFieldType SDL_Palette "version" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "refcount" SDL_Palette ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Palette
            { refcount = y1
            , ncolors = BG.getField @"ncolors" x0
            , colors = BG.getField @"colors" x0
            , version = BG.getField @"version" x0
            }
      , BG.getField @"refcount" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "refcount" (BG.Ptr SDL_Palette) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"refcount")

instance HasCField.HasCField SDL_Palette "refcount" where
  type CFieldType SDL_Palette "refcount" = BG.CInt

  offset# = \_ -> \_ -> 20

-- | Details about the format of a pixel.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_PixelFormatDetails@, defined at @SDL3\/SDL_pixels.h 1154:16@
data SDL_PixelFormatDetails = SDL_PixelFormatDetails
  { format :: SDL_PixelFormat
  -- ^ [C declaration]: @format@, defined at @SDL3\/SDL_pixels.h 1156:21@
  , bits_per_pixel :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @bits_per_pixel@, defined at @SDL3\/SDL_pixels.h 1157:11@
  , bytes_per_pixel :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @bytes_per_pixel@, defined at @SDL3\/SDL_pixels.h 1158:11@
  , padding :: CA.ConstantArray 2 SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @padding@, defined at @SDL3\/SDL_pixels.h 1159:11@
  , rmask :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @Rmask@, defined at @SDL3\/SDL_pixels.h 1160:12@
  , gmask :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @Gmask@, defined at @SDL3\/SDL_pixels.h 1161:12@
  , bmask :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @Bmask@, defined at @SDL3\/SDL_pixels.h 1162:12@
  , amask :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @Amask@, defined at @SDL3\/SDL_pixels.h 1163:12@
  , rbits :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @Rbits@, defined at @SDL3\/SDL_pixels.h 1164:11@
  , gbits :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @Gbits@, defined at @SDL3\/SDL_pixels.h 1165:11@
  , bbits :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @Bbits@, defined at @SDL3\/SDL_pixels.h 1166:11@
  , abits :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @Abits@, defined at @SDL3\/SDL_pixels.h 1167:11@
  , rshift :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @Rshift@, defined at @SDL3\/SDL_pixels.h 1168:11@
  , gshift :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @Gshift@, defined at @SDL3\/SDL_pixels.h 1169:11@
  , bshift :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @Bshift@, defined at @SDL3\/SDL_pixels.h 1170:11@
  , ashift :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @Ashift@, defined at @SDL3\/SDL_pixels.h 1171:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_PixelFormatDetails where
  staticSizeOf = \_ -> (32 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PixelFormatDetails where
  readRaw =
    \ptr0 ->
      pure SDL_PixelFormatDetails
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"bits_per_pixel") ptr0
        <*> HasCField.readRaw (BG.Proxy @"bytes_per_pixel") ptr0
        <*> HasCField.readRaw (BG.Proxy @"padding") ptr0
        <*> HasCField.readRaw (BG.Proxy @"rmask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"gmask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"bmask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"amask") ptr0
        <*> HasCField.readRaw (BG.Proxy @"rbits") ptr0
        <*> HasCField.readRaw (BG.Proxy @"gbits") ptr0
        <*> HasCField.readRaw (BG.Proxy @"bbits") ptr0
        <*> HasCField.readRaw (BG.Proxy @"abits") ptr0
        <*> HasCField.readRaw (BG.Proxy @"rshift") ptr0
        <*> HasCField.readRaw (BG.Proxy @"gshift") ptr0
        <*> HasCField.readRaw (BG.Proxy @"bshift") ptr0
        <*> HasCField.readRaw (BG.Proxy @"ashift") ptr0

instance Marshal.WriteRaw SDL_PixelFormatDetails where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PixelFormatDetails
            format2
            bits_per_pixel3
            bytes_per_pixel4
            padding5
            rmask6
            gmask7
            bmask8
            amask9
            rbits10
            gbits11
            bbits12
            abits13
            rshift14
            gshift15
            bshift16
            ashift17 ->
              HasCField.writeRaw (BG.Proxy @"format") ptr0 format2
                >> HasCField.writeRaw (BG.Proxy @"bits_per_pixel") ptr0 bits_per_pixel3
                >> HasCField.writeRaw (BG.Proxy @"bytes_per_pixel") ptr0 bytes_per_pixel4
                >> HasCField.writeRaw (BG.Proxy @"padding") ptr0 padding5
                >> HasCField.writeRaw (BG.Proxy @"rmask") ptr0 rmask6
                >> HasCField.writeRaw (BG.Proxy @"gmask") ptr0 gmask7
                >> HasCField.writeRaw (BG.Proxy @"bmask") ptr0 bmask8
                >> HasCField.writeRaw (BG.Proxy @"amask") ptr0 amask9
                >> HasCField.writeRaw (BG.Proxy @"rbits") ptr0 rbits10
                >> HasCField.writeRaw (BG.Proxy @"gbits") ptr0 gbits11
                >> HasCField.writeRaw (BG.Proxy @"bbits") ptr0 bbits12
                >> HasCField.writeRaw (BG.Proxy @"abits") ptr0 abits13
                >> HasCField.writeRaw (BG.Proxy @"rshift") ptr0 rshift14
                >> HasCField.writeRaw (BG.Proxy @"gshift") ptr0 gshift15
                >> HasCField.writeRaw (BG.Proxy @"bshift") ptr0 bshift16
                >> HasCField.writeRaw (BG.Proxy @"ashift") ptr0 ashift17

deriving via
  Marshal.EquivStorable SDL_PixelFormatDetails
  instance
    BG.Storable SDL_PixelFormatDetails

instance
  (ty ~ SDL_PixelFormat)
  => BG.CompatHasField.HasField "format" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { format = y1
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL_PixelFormat)
  => BG.HasField "format" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_PixelFormatDetails "format" where
  type
    CFieldType SDL_PixelFormatDetails "format" =
      SDL_PixelFormat

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "bits_per_pixel" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { bits_per_pixel = y1
            , format = BG.getField @"format" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"bits_per_pixel" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "bits_per_pixel" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"bits_per_pixel")

instance HasCField.HasCField SDL_PixelFormatDetails "bits_per_pixel" where
  type
    CFieldType SDL_PixelFormatDetails "bits_per_pixel" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 4

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "bytes_per_pixel" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { bytes_per_pixel = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"bytes_per_pixel" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "bytes_per_pixel" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"bytes_per_pixel")

instance HasCField.HasCField SDL_PixelFormatDetails "bytes_per_pixel" where
  type
    CFieldType SDL_PixelFormatDetails "bytes_per_pixel" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 5

instance
  (ty ~ CA.ConstantArray 2 SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "padding" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { padding = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"padding" x0
      )

instance
  (ty ~ CA.ConstantArray 2 SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "padding" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"padding")

instance HasCField.HasCField SDL_PixelFormatDetails "padding" where
  type
    CFieldType SDL_PixelFormatDetails "padding" =
      CA.ConstantArray 2 SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 6

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "rmask" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { rmask = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"rmask" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "rmask" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"rmask")

instance HasCField.HasCField SDL_PixelFormatDetails "rmask" where
  type
    CFieldType SDL_PixelFormatDetails "rmask" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "gmask" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { gmask = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"gmask" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "gmask" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"gmask")

instance HasCField.HasCField SDL_PixelFormatDetails "gmask" where
  type
    CFieldType SDL_PixelFormatDetails "gmask" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 12

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "bmask" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { bmask = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"bmask" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "bmask" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"bmask")

instance HasCField.HasCField SDL_PixelFormatDetails "bmask" where
  type
    CFieldType SDL_PixelFormatDetails "bmask" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "amask" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { amask = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"amask" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "amask" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"amask")

instance HasCField.HasCField SDL_PixelFormatDetails "amask" where
  type
    CFieldType SDL_PixelFormatDetails "amask" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 20

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "rbits" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { rbits = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"rbits" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "rbits" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"rbits")

instance HasCField.HasCField SDL_PixelFormatDetails "rbits" where
  type
    CFieldType SDL_PixelFormatDetails "rbits" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "gbits" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { gbits = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"gbits" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "gbits" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"gbits")

instance HasCField.HasCField SDL_PixelFormatDetails "gbits" where
  type
    CFieldType SDL_PixelFormatDetails "gbits" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 25

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "bbits" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { bbits = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"bbits" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "bbits" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"bbits")

instance HasCField.HasCField SDL_PixelFormatDetails "bbits" where
  type
    CFieldType SDL_PixelFormatDetails "bbits" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 26

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "abits" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { abits = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"abits" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "abits" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"abits")

instance HasCField.HasCField SDL_PixelFormatDetails "abits" where
  type
    CFieldType SDL_PixelFormatDetails "abits" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 27

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "rshift" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { rshift = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"rshift" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "rshift" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"rshift")

instance HasCField.HasCField SDL_PixelFormatDetails "rshift" where
  type
    CFieldType SDL_PixelFormatDetails "rshift" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 28

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "gshift" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { gshift = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , bshift = BG.getField @"bshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"gshift" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "gshift" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"gshift")

instance HasCField.HasCField SDL_PixelFormatDetails "gshift" where
  type
    CFieldType SDL_PixelFormatDetails "gshift" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 29

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "bshift" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { bshift = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , ashift = BG.getField @"ashift" x0
            }
      , BG.getField @"bshift" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "bshift" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"bshift")

instance HasCField.HasCField SDL_PixelFormatDetails "bshift" where
  type
    CFieldType SDL_PixelFormatDetails "bshift" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 30

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "ashift" SDL_PixelFormatDetails ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PixelFormatDetails
            { ashift = y1
            , format = BG.getField @"format" x0
            , bits_per_pixel = BG.getField @"bits_per_pixel" x0
            , bytes_per_pixel = BG.getField @"bytes_per_pixel" x0
            , padding = BG.getField @"padding" x0
            , rmask = BG.getField @"rmask" x0
            , gmask = BG.getField @"gmask" x0
            , bmask = BG.getField @"bmask" x0
            , amask = BG.getField @"amask" x0
            , rbits = BG.getField @"rbits" x0
            , gbits = BG.getField @"gbits" x0
            , bbits = BG.getField @"bbits" x0
            , abits = BG.getField @"abits" x0
            , rshift = BG.getField @"rshift" x0
            , gshift = BG.getField @"gshift" x0
            , bshift = BG.getField @"bshift" x0
            }
      , BG.getField @"ashift" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "ashift" (BG.Ptr SDL_PixelFormatDetails) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"ashift")

instance HasCField.HasCField SDL_PixelFormatDetails "ashift" where
  type
    CFieldType SDL_PixelFormatDetails "ashift" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 31
