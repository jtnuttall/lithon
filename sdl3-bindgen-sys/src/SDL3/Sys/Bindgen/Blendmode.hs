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

-- | Blend modes decide how two colors will mix together. There are both standard modes for basic needs and a means to create custom modes, dictating what sort of math to do on what color components. A set of blend modes used in drawing operations.
--
--     These predefined blend modes are supported everywhere.
--
--     Additional values may be obtained from SDL_ComposeCustomBlendMode.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ComposeCustomBlendMode'
module SDL3.Sys.Bindgen.Blendmode (
  SDL3.Sys.Bindgen.Blendmode.SDL_BlendMode (..),
  SDL3.Sys.Bindgen.Blendmode.sDL_BLENDMODE_NONE,
  SDL3.Sys.Bindgen.Blendmode.sDL_BLENDMODE_BLEND,
  SDL3.Sys.Bindgen.Blendmode.sDL_BLENDMODE_BLEND_PREMULTIPLIED,
  SDL3.Sys.Bindgen.Blendmode.sDL_BLENDMODE_ADD,
  SDL3.Sys.Bindgen.Blendmode.sDL_BLENDMODE_ADD_PREMULTIPLIED,
  SDL3.Sys.Bindgen.Blendmode.sDL_BLENDMODE_MOD,
  SDL3.Sys.Bindgen.Blendmode.sDL_BLENDMODE_MUL,
  SDL3.Sys.Bindgen.Blendmode.sDL_BLENDMODE_INVALID,
  SDL3.Sys.Bindgen.Blendmode.SDL_BlendOperation (..),
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDOPERATION_ADD,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDOPERATION_SUBTRACT,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDOPERATION_REV_SUBTRACT,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDOPERATION_MINIMUM,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDOPERATION_MAXIMUM,
  SDL3.Sys.Bindgen.Blendmode.SDL_BlendFactor (..),
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_ZERO,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_ONE,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_SRC_COLOR,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_SRC_ALPHA,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_DST_COLOR,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_DST_ALPHA,
  pattern SDL3.Sys.Bindgen.Blendmode.SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_BlendMode@, defined at @SDL3\/SDL_blendmode.h 52:16@
newtype SDL_BlendMode = SDL_BlendMode
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_BlendMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_BlendMode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_BlendMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_BlendMode "unwrap" where
  type
    CFieldType SDL_BlendMode "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | no blending: dstRGBA = srcRGBA
--
--     [C declaration]: @macro SDL_BLENDMODE_NONE@, defined at @SDL3\/SDL_blendmode.h 54:9@
sDL_BLENDMODE_NONE :: BG.CUInt
sDL_BLENDMODE_NONE = (0 :: BG.CUInt)

-- | alpha blending: dstRGB = (srcRGB * srcA) + (dstRGB * (1-srcA)), dstA = srcA + (dstA * (1-srcA))
--
--     [C declaration]: @macro SDL_BLENDMODE_BLEND@, defined at @SDL3\/SDL_blendmode.h 55:9@
sDL_BLENDMODE_BLEND :: BG.CUInt
sDL_BLENDMODE_BLEND = (1 :: BG.CUInt)

-- | pre-multiplied alpha blending: dstRGBA = srcRGBA + (dstRGBA * (1-srcA))
--
--     [C declaration]: @macro SDL_BLENDMODE_BLEND_PREMULTIPLIED@, defined at @SDL3\/SDL_blendmode.h 56:9@
sDL_BLENDMODE_BLEND_PREMULTIPLIED :: BG.CUInt
sDL_BLENDMODE_BLEND_PREMULTIPLIED = (16 :: BG.CUInt)

-- | additive blending: dstRGB = (srcRGB * srcA) + dstRGB, dstA = dstA
--
--     [C declaration]: @macro SDL_BLENDMODE_ADD@, defined at @SDL3\/SDL_blendmode.h 57:9@
sDL_BLENDMODE_ADD :: BG.CUInt
sDL_BLENDMODE_ADD = (2 :: BG.CUInt)

-- | pre-multiplied additive blending: dstRGB = srcRGB + dstRGB, dstA = dstA
--
--     [C declaration]: @macro SDL_BLENDMODE_ADD_PREMULTIPLIED@, defined at @SDL3\/SDL_blendmode.h 58:9@
sDL_BLENDMODE_ADD_PREMULTIPLIED :: BG.CUInt
sDL_BLENDMODE_ADD_PREMULTIPLIED = (32 :: BG.CUInt)

-- | color modulate: dstRGB = srcRGB * dstRGB, dstA = dstA
--
--     [C declaration]: @macro SDL_BLENDMODE_MOD@, defined at @SDL3\/SDL_blendmode.h 59:9@
sDL_BLENDMODE_MOD :: BG.CUInt
sDL_BLENDMODE_MOD = (4 :: BG.CUInt)

-- | color multiply: dstRGB = (srcRGB * dstRGB) + (dstRGB * (1-srcA)), dstA = dstA
--
--     [C declaration]: @macro SDL_BLENDMODE_MUL@, defined at @SDL3\/SDL_blendmode.h 60:9@
sDL_BLENDMODE_MUL :: BG.CUInt
sDL_BLENDMODE_MUL = (8 :: BG.CUInt)

-- | [C declaration]: @macro SDL_BLENDMODE_INVALID@, defined at @SDL3\/SDL_blendmode.h 61:9@
sDL_BLENDMODE_INVALID :: BG.CUInt
sDL_BLENDMODE_INVALID = (2147483647 :: BG.CUInt)

-- | The blend operation used when combining source and destination pixel components.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_BlendOperation@, defined at @SDL3\/SDL_blendmode.h 69:14@
newtype SDL_BlendOperation = SDL_BlendOperation
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_BlendOperation where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_BlendOperation where
  readRaw =
    \ptr0 ->
      pure SDL_BlendOperation
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_BlendOperation where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_BlendOperation unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_BlendOperation instance BG.Storable SDL_BlendOperation

deriving via BG.CUInt instance BG.Prim SDL_BlendOperation

instance CEnum.CEnum SDL_BlendOperation where
  type CEnumZ SDL_BlendOperation = BG.CUInt

  toCEnum = SDL_BlendOperation

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (1, BG.singleton "SDL_BLENDOPERATION_ADD")
        , (2, BG.singleton "SDL_BLENDOPERATION_SUBTRACT")
        , (3, BG.singleton "SDL_BLENDOPERATION_REV_SUBTRACT")
        , (4, BG.singleton "SDL_BLENDOPERATION_MINIMUM")
        , (5, BG.singleton "SDL_BLENDOPERATION_MAXIMUM")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_BlendOperation"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_BlendOperation"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_BlendOperation where
  minDeclaredValue = SDL_BLENDOPERATION_ADD

  maxDeclaredValue = SDL_BLENDOPERATION_MAXIMUM

instance Show SDL_BlendOperation where
  showsPrec = CEnum.shows

instance Read SDL_BlendOperation where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_BlendOperation ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_BlendOperation{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_BlendOperation) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_BlendOperation "unwrap" where
  type
    CFieldType SDL_BlendOperation "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | dst + src: supported by all renderers
--
--     [C declaration]: @SDL_BLENDOPERATION_ADD@, defined at @SDL3\/SDL_blendmode.h 71:5@
pattern SDL_BLENDOPERATION_ADD :: SDL_BlendOperation
pattern SDL_BLENDOPERATION_ADD = SDL_BlendOperation 1

-- | src - dst : supported by D3D, OpenGL, OpenGLES, and Vulkan
--
--     [C declaration]: @SDL_BLENDOPERATION_SUBTRACT@, defined at @SDL3\/SDL_blendmode.h 72:5@
pattern SDL_BLENDOPERATION_SUBTRACT :: SDL_BlendOperation
pattern SDL_BLENDOPERATION_SUBTRACT = SDL_BlendOperation 2

-- | dst - src : supported by D3D, OpenGL, OpenGLES, and Vulkan
--
--     [C declaration]: @SDL_BLENDOPERATION_REV_SUBTRACT@, defined at @SDL3\/SDL_blendmode.h 73:5@
pattern SDL_BLENDOPERATION_REV_SUBTRACT :: SDL_BlendOperation
pattern SDL_BLENDOPERATION_REV_SUBTRACT = SDL_BlendOperation 3

-- | min(dst, src) : supported by D3D, OpenGL, OpenGLES, and Vulkan
--
--     [C declaration]: @SDL_BLENDOPERATION_MINIMUM@, defined at @SDL3\/SDL_blendmode.h 74:5@
pattern SDL_BLENDOPERATION_MINIMUM :: SDL_BlendOperation
pattern SDL_BLENDOPERATION_MINIMUM = SDL_BlendOperation 4

-- | max(dst, src) : supported by D3D, OpenGL, OpenGLES, and Vulkan
--
--     [C declaration]: @SDL_BLENDOPERATION_MAXIMUM@, defined at @SDL3\/SDL_blendmode.h 75:5@
pattern SDL_BLENDOPERATION_MAXIMUM :: SDL_BlendOperation
pattern SDL_BLENDOPERATION_MAXIMUM = SDL_BlendOperation 5

-- | The normalized factor used to multiply pixel components.
--
--     The blend factors are multiplied with the pixels from a drawing operation (src) and the pixels from the render target (dst) before the blend operation. The comma-separated factors listed above are always applied in the component order red, green, blue, and alpha.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_BlendFactor@, defined at @SDL3\/SDL_blendmode.h 88:14@
newtype SDL_BlendFactor = SDL_BlendFactor
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_BlendFactor where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_BlendFactor where
  readRaw =
    \ptr0 ->
      pure SDL_BlendFactor
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_BlendFactor where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_BlendFactor unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_BlendFactor instance BG.Storable SDL_BlendFactor

deriving via BG.CUInt instance BG.Prim SDL_BlendFactor

instance CEnum.CEnum SDL_BlendFactor where
  type CEnumZ SDL_BlendFactor = BG.CUInt

  toCEnum = SDL_BlendFactor

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (1, BG.singleton "SDL_BLENDFACTOR_ZERO")
        , (2, BG.singleton "SDL_BLENDFACTOR_ONE")
        , (3, BG.singleton "SDL_BLENDFACTOR_SRC_COLOR")
        , (4, BG.singleton "SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR")
        , (5, BG.singleton "SDL_BLENDFACTOR_SRC_ALPHA")
        , (6, BG.singleton "SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA")
        , (7, BG.singleton "SDL_BLENDFACTOR_DST_COLOR")
        , (8, BG.singleton "SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR")
        , (9, BG.singleton "SDL_BLENDFACTOR_DST_ALPHA")
        , (10, BG.singleton "SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_BlendFactor"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_BlendFactor"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_BlendFactor where
  minDeclaredValue = SDL_BLENDFACTOR_ZERO

  maxDeclaredValue =
    SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA

instance Show SDL_BlendFactor where
  showsPrec = CEnum.shows

instance Read SDL_BlendFactor where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_BlendFactor ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_BlendFactor{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_BlendFactor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_BlendFactor "unwrap" where
  type CFieldType SDL_BlendFactor "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | 0, 0, 0, 0
--
--     [C declaration]: @SDL_BLENDFACTOR_ZERO@, defined at @SDL3\/SDL_blendmode.h 90:5@
pattern SDL_BLENDFACTOR_ZERO :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_ZERO = SDL_BlendFactor 1

-- | 1, 1, 1, 1
--
--     [C declaration]: @SDL_BLENDFACTOR_ONE@, defined at @SDL3\/SDL_blendmode.h 91:5@
pattern SDL_BLENDFACTOR_ONE :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_ONE = SDL_BlendFactor 2

-- | srcR, srcG, srcB, srcA
--
--     [C declaration]: @SDL_BLENDFACTOR_SRC_COLOR@, defined at @SDL3\/SDL_blendmode.h 92:5@
pattern SDL_BLENDFACTOR_SRC_COLOR :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_SRC_COLOR = SDL_BlendFactor 3

-- | 1-srcR, 1-srcG, 1-srcB, 1-srcA
--
--     [C declaration]: @SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR@, defined at @SDL3\/SDL_blendmode.h 93:5@
pattern SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR = SDL_BlendFactor 4

-- | srcA, srcA, srcA, srcA
--
--     [C declaration]: @SDL_BLENDFACTOR_SRC_ALPHA@, defined at @SDL3\/SDL_blendmode.h 94:5@
pattern SDL_BLENDFACTOR_SRC_ALPHA :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_SRC_ALPHA = SDL_BlendFactor 5

-- | 1-srcA, 1-srcA, 1-srcA, 1-srcA
--
--     [C declaration]: @SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA@, defined at @SDL3\/SDL_blendmode.h 95:5@
pattern SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = SDL_BlendFactor 6

-- | dstR, dstG, dstB, dstA
--
--     [C declaration]: @SDL_BLENDFACTOR_DST_COLOR@, defined at @SDL3\/SDL_blendmode.h 96:5@
pattern SDL_BLENDFACTOR_DST_COLOR :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_DST_COLOR = SDL_BlendFactor 7

-- | 1-dstR, 1-dstG, 1-dstB, 1-dstA
--
--     [C declaration]: @SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR@, defined at @SDL3\/SDL_blendmode.h 97:5@
pattern SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR = SDL_BlendFactor 8

-- | dstA, dstA, dstA, dstA
--
--     [C declaration]: @SDL_BLENDFACTOR_DST_ALPHA@, defined at @SDL3\/SDL_blendmode.h 98:5@
pattern SDL_BLENDFACTOR_DST_ALPHA :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_DST_ALPHA = SDL_BlendFactor 9

-- | 1-dstA, 1-dstA, 1-dstA, 1-dstA
--
--     [C declaration]: @SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA@, defined at @SDL3\/SDL_blendmode.h 99:5@
pattern SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA :: SDL_BlendFactor
pattern SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA = SDL_BlendFactor 10
