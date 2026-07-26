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

-- | SDL surfaces are buffers of pixels in system RAM. These are useful for passing around and manipulating images that are not stored in GPU memory.
--
--     'SDL_Surface' makes serious efforts to manage images in various formats, and provides a reasonable toolbox for transforming the data, including copying between surfaces, filling rectangles in the image data, etc.
--
--     There is also a simple .bmp loader, @SDL_LoadBMP()@, and a simple .png loader, @SDL_LoadPNG()@. SDL itself does not provide loaders for other file formats, but there are several excellent external libraries that do, including its own satellite library, [SDL_image](https://wiki.libsdl.org/SDL3_image) In general these functions are thread-safe in that they can be called on different threads with different surfaces. You should not try to modify any surface from two threads simultaneously. The flags on an 'SDL_Surface'.
--
--     These are generally considered read-only.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Surface (
  SDL3.Sys.Bindgen.Surface.SDL_SurfaceFlags (..),
  SDL3.Sys.Bindgen.Surface.sDL_SURFACE_PREALLOCATED,
  SDL3.Sys.Bindgen.Surface.sDL_SURFACE_LOCK_NEEDED,
  SDL3.Sys.Bindgen.Surface.sDL_SURFACE_LOCKED,
  SDL3.Sys.Bindgen.Surface.sDL_SURFACE_SIMD_ALIGNED,
  SDL3.Sys.Bindgen.Surface.SDL_ScaleMode (..),
  pattern SDL3.Sys.Bindgen.Surface.SDL_SCALEMODE_INVALID,
  pattern SDL3.Sys.Bindgen.Surface.SDL_SCALEMODE_NEAREST,
  pattern SDL3.Sys.Bindgen.Surface.SDL_SCALEMODE_LINEAR,
  pattern SDL3.Sys.Bindgen.Surface.SDL_SCALEMODE_PIXELART,
  SDL3.Sys.Bindgen.Surface.SDL_FlipMode (..),
  pattern SDL3.Sys.Bindgen.Surface.SDL_FLIP_NONE,
  pattern SDL3.Sys.Bindgen.Surface.SDL_FLIP_HORIZONTAL,
  pattern SDL3.Sys.Bindgen.Surface.SDL_FLIP_VERTICAL,
  pattern SDL3.Sys.Bindgen.Surface.SDL_FLIP_HORIZONTAL_AND_VERTICAL,
  SDL3.Sys.Bindgen.Surface.SDL_Surface (..),
  SDL3.Sys.Bindgen.Surface.sDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT,
  SDL3.Sys.Bindgen.Surface.sDL_PROP_SURFACE_HDR_HEADROOM_FLOAT,
  SDL3.Sys.Bindgen.Surface.sDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING,
  SDL3.Sys.Bindgen.Surface.sDL_PROP_SURFACE_HOTSPOT_X_NUMBER,
  SDL3.Sys.Bindgen.Surface.sDL_PROP_SURFACE_HOTSPOT_Y_NUMBER,
  SDL3.Sys.Bindgen.Surface.sDL_PROP_SURFACE_ROTATION_FLOAT,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_SurfaceFlags@, defined at @SDL3\/SDL_surface.h 68:16@
newtype SDL_SurfaceFlags = SDL_SurfaceFlags
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
  => BG.CompatHasField.HasField "unwrap" SDL_SurfaceFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SurfaceFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_SurfaceFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_SurfaceFlags "unwrap" where
  type
    CFieldType SDL_SurfaceFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Surface uses preallocated pixel memory
--
--     [C declaration]: @macro SDL_SURFACE_PREALLOCATED@, defined at @SDL3\/SDL_surface.h 70:9@
sDL_SURFACE_PREALLOCATED :: BG.CUInt
sDL_SURFACE_PREALLOCATED = (1 :: BG.CUInt)

-- | Surface needs to be locked to access pixels
--
--     [C declaration]: @macro SDL_SURFACE_LOCK_NEEDED@, defined at @SDL3\/SDL_surface.h 71:9@
sDL_SURFACE_LOCK_NEEDED :: BG.CUInt
sDL_SURFACE_LOCK_NEEDED = (2 :: BG.CUInt)

-- | Surface is currently locked
--
--     [C declaration]: @macro SDL_SURFACE_LOCKED@, defined at @SDL3\/SDL_surface.h 72:9@
sDL_SURFACE_LOCKED :: BG.CUInt
sDL_SURFACE_LOCKED = (4 :: BG.CUInt)

-- | Surface uses pixel memory allocated with SDL_aligned_alloc()
--
--     [C declaration]: @macro SDL_SURFACE_SIMD_ALIGNED@, defined at @SDL3\/SDL_surface.h 73:9@
sDL_SURFACE_SIMD_ALIGNED :: BG.CUInt
sDL_SURFACE_SIMD_ALIGNED = (8 :: BG.CUInt)

-- | The scaling mode.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_ScaleMode@, defined at @SDL3\/SDL_surface.h 87:14@
newtype SDL_ScaleMode = SDL_ScaleMode
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ScaleMode where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ScaleMode where
  readRaw =
    \ptr0 ->
      pure SDL_ScaleMode
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ScaleMode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ScaleMode unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ScaleMode instance BG.Storable SDL_ScaleMode

deriving via BG.CInt instance BG.Prim SDL_ScaleMode

instance CEnum.CEnum SDL_ScaleMode where
  type CEnumZ SDL_ScaleMode = BG.CInt

  toCEnum = SDL_ScaleMode

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_SCALEMODE_INVALID")
        , (0, BG.singleton "SDL_SCALEMODE_NEAREST")
        , (1, BG.singleton "SDL_SCALEMODE_LINEAR")
        , (2, BG.singleton "SDL_SCALEMODE_PIXELART")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ScaleMode"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ScaleMode"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_ScaleMode where
  minDeclaredValue = SDL_SCALEMODE_INVALID

  maxDeclaredValue = SDL_SCALEMODE_PIXELART

instance Show SDL_ScaleMode where
  showsPrec = CEnum.shows

instance Read SDL_ScaleMode where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ScaleMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ScaleMode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ScaleMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ScaleMode "unwrap" where
  type CFieldType SDL_ScaleMode "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_SCALEMODE_INVALID@, defined at @SDL3\/SDL_surface.h 89:5@
pattern SDL_SCALEMODE_INVALID :: SDL_ScaleMode
pattern SDL_SCALEMODE_INVALID = SDL_ScaleMode (-1)

-- | nearest pixel sampling
--
--     [C declaration]: @SDL_SCALEMODE_NEAREST@, defined at @SDL3\/SDL_surface.h 90:5@
pattern SDL_SCALEMODE_NEAREST :: SDL_ScaleMode
pattern SDL_SCALEMODE_NEAREST = SDL_ScaleMode 0

-- | linear filtering
--
--     [C declaration]: @SDL_SCALEMODE_LINEAR@, defined at @SDL3\/SDL_surface.h 91:5@
pattern SDL_SCALEMODE_LINEAR :: SDL_ScaleMode
pattern SDL_SCALEMODE_LINEAR = SDL_ScaleMode 1

-- | nearest pixel sampling with improved scaling for pixel art, available since SDL 3.4.0
--
--     [C declaration]: @SDL_SCALEMODE_PIXELART@, defined at @SDL3\/SDL_surface.h 92:5@
pattern SDL_SCALEMODE_PIXELART :: SDL_ScaleMode
pattern SDL_SCALEMODE_PIXELART = SDL_ScaleMode 2

-- | The flip mode.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_FlipMode@, defined at @SDL3\/SDL_surface.h 100:14@
newtype SDL_FlipMode = SDL_FlipMode
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_FlipMode where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_FlipMode where
  readRaw =
    \ptr0 ->
      pure SDL_FlipMode
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_FlipMode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_FlipMode unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_FlipMode instance BG.Storable SDL_FlipMode

deriving via BG.CUInt instance BG.Prim SDL_FlipMode

instance CEnum.CEnum SDL_FlipMode where
  type CEnumZ SDL_FlipMode = BG.CUInt

  toCEnum = SDL_FlipMode

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_FLIP_NONE")
        , (1, BG.singleton "SDL_FLIP_HORIZONTAL")
        , (2, BG.singleton "SDL_FLIP_VERTICAL")
        , (3, BG.singleton "SDL_FLIP_HORIZONTAL_AND_VERTICAL")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_FlipMode"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_FlipMode"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_FlipMode where
  minDeclaredValue = SDL_FLIP_NONE

  maxDeclaredValue = SDL_FLIP_HORIZONTAL_AND_VERTICAL

instance Show SDL_FlipMode where
  showsPrec = CEnum.shows

instance Read SDL_FlipMode where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_FlipMode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FlipMode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_FlipMode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_FlipMode "unwrap" where
  type CFieldType SDL_FlipMode "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Do not flip
--
--     [C declaration]: @SDL_FLIP_NONE@, defined at @SDL3\/SDL_surface.h 102:5@
pattern SDL_FLIP_NONE :: SDL_FlipMode
pattern SDL_FLIP_NONE = SDL_FlipMode 0

-- | flip horizontally
--
--     [C declaration]: @SDL_FLIP_HORIZONTAL@, defined at @SDL3\/SDL_surface.h 103:5@
pattern SDL_FLIP_HORIZONTAL :: SDL_FlipMode
pattern SDL_FLIP_HORIZONTAL = SDL_FlipMode 1

-- | flip vertically
--
--     [C declaration]: @SDL_FLIP_VERTICAL@, defined at @SDL3\/SDL_surface.h 104:5@
pattern SDL_FLIP_VERTICAL :: SDL_FlipMode
pattern SDL_FLIP_VERTICAL = SDL_FlipMode 2

-- | flip horizontally and vertically (not a diagonal flip)
--
--     [C declaration]: @SDL_FLIP_HORIZONTAL_AND_VERTICAL@, defined at @SDL3\/SDL_surface.h 105:5@
pattern SDL_FLIP_HORIZONTAL_AND_VERTICAL :: SDL_FlipMode
pattern SDL_FLIP_HORIZONTAL_AND_VERTICAL = SDL_FlipMode 3

-- | A collection of pixels used in software blitting.
--
--     Pixels are arranged in memory in rows, with the top row first. Each row occupies an amount of memory given by the pitch (sometimes known as the row stride in non-SDL APIs).
--
--     Within each row, pixels are arranged from left to right until the width is reached. Each pixel occupies a number of bits appropriate for its format, with most formats representing each pixel as one or more whole bytes (in some indexed formats, instead multiple pixels are packed into each byte), and a byte order given by the format. After encoding all pixels, any remaining bytes to reach the pitch are used as padding to reach a desired alignment, and have undefined contents.
--
--     When a surface holds YUV format data, the planes are assumed to be contiguous without padding between them, e.g. a 32x32 surface in NV12 format with a pitch of 32 would consist of 32x32 bytes of Y plane followed by 32x16 bytes of UV plane.
--
--     When a surface holds MJPG format data, pixels points at the compressed JPEG image and pitch is the length of that data.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateSurface', 'sDL_DestroySurface'
--
--     [C declaration]: @struct SDL_Surface@, defined at @SDL3\/SDL_surface.h 138:8@
data SDL_Surface = SDL_Surface
  { flags :: SDL_SurfaceFlags
  -- ^ The flags of the surface, read-only
  --
  --          [C declaration]: @flags@, defined at @SDL3\/SDL_surface.h 140:22@
  , format :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^ The format of the surface, read-only
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_surface.h 141:21@
  , w :: BG.CInt
  -- ^ The width of the surface, read-only.
  --
  --          [C declaration]: @w@, defined at @SDL3\/SDL_surface.h 142:9@
  , h :: BG.CInt
  -- ^ The height of the surface, read-only.
  --
  --          [C declaration]: @h@, defined at @SDL3\/SDL_surface.h 143:9@
  , pitch :: BG.CInt
  -- ^ The distance in bytes between rows of pixels, read-only
  --
  --          [C declaration]: @pitch@, defined at @SDL3\/SDL_surface.h 144:9@
  , pixels :: BG.Ptr BG.Void
  -- ^ A pointer to the pixels of the surface, the pixels are writeable if non-NULL
  --
  --          [C declaration]: @pixels@, defined at @SDL3\/SDL_surface.h 145:11@
  , refcount :: BG.CInt
  -- ^ Application reference count, used when freeing surface
  --
  --          [C declaration]: @refcount@, defined at @SDL3\/SDL_surface.h 147:9@
  , reserved :: BG.Ptr BG.Void
  -- ^ Reserved for internal use
  --
  --          [C declaration]: @reserved@, defined at @SDL3\/SDL_surface.h 149:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_Surface where
  staticSizeOf = \_ -> (48 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_Surface where
  readRaw =
    \ptr0 ->
      pure SDL_Surface
        <*> HasCField.readRaw (BG.Proxy @"flags") ptr0
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"w") ptr0
        <*> HasCField.readRaw (BG.Proxy @"h") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pitch") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pixels") ptr0
        <*> HasCField.readRaw (BG.Proxy @"refcount") ptr0
        <*> HasCField.readRaw (BG.Proxy @"reserved") ptr0

instance Marshal.WriteRaw SDL_Surface where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Surface flags2 format3 w4 h5 pitch6 pixels7 refcount8 reserved9 ->
            HasCField.writeRaw (BG.Proxy @"flags") ptr0 flags2
              >> HasCField.writeRaw (BG.Proxy @"format") ptr0 format3
              >> HasCField.writeRaw (BG.Proxy @"w") ptr0 w4
              >> HasCField.writeRaw (BG.Proxy @"h") ptr0 h5
              >> HasCField.writeRaw (BG.Proxy @"pitch") ptr0 pitch6
              >> HasCField.writeRaw (BG.Proxy @"pixels") ptr0 pixels7
              >> HasCField.writeRaw (BG.Proxy @"refcount") ptr0 refcount8
              >> HasCField.writeRaw (BG.Proxy @"reserved") ptr0 reserved9

deriving via Marshal.EquivStorable SDL_Surface instance BG.Storable SDL_Surface

instance
  (ty ~ SDL_SurfaceFlags)
  => BG.CompatHasField.HasField "flags" SDL_Surface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Surface
            { flags = y1
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pitch = BG.getField @"pitch" x0
            , pixels = BG.getField @"pixels" x0
            , refcount = BG.getField @"refcount" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"flags" x0
      )

instance
  (ty ~ SDL_SurfaceFlags)
  => BG.HasField "flags" (BG.Ptr SDL_Surface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"flags")

instance HasCField.HasCField SDL_Surface "flags" where
  type
    CFieldType SDL_Surface "flags" =
      SDL_SurfaceFlags

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
  => BG.CompatHasField.HasField "format" SDL_Surface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Surface
            { format = y1
            , flags = BG.getField @"flags" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pitch = BG.getField @"pitch" x0
            , pixels = BG.getField @"pixels" x0
            , refcount = BG.getField @"refcount" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
  => BG.HasField "format" (BG.Ptr SDL_Surface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_Surface "format" where
  type
    CFieldType SDL_Surface "format" =
      SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat

  offset# = \_ -> \_ -> 4

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "w" SDL_Surface ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Surface
            { w = y1
            , flags = BG.getField @"flags" x0
            , format = BG.getField @"format" x0
            , h = BG.getField @"h" x0
            , pitch = BG.getField @"pitch" x0
            , pixels = BG.getField @"pixels" x0
            , refcount = BG.getField @"refcount" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"w" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "w" (BG.Ptr SDL_Surface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"w")

instance HasCField.HasCField SDL_Surface "w" where
  type CFieldType SDL_Surface "w" = BG.CInt

  offset# = \_ -> \_ -> 8

instance (ty ~ BG.CInt) => BG.CompatHasField.HasField "h" SDL_Surface ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Surface
            { h = y1
            , flags = BG.getField @"flags" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , pitch = BG.getField @"pitch" x0
            , pixels = BG.getField @"pixels" x0
            , refcount = BG.getField @"refcount" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"h" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "h" (BG.Ptr SDL_Surface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"h")

instance HasCField.HasCField SDL_Surface "h" where
  type CFieldType SDL_Surface "h" = BG.CInt

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "pitch" SDL_Surface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Surface
            { pitch = y1
            , flags = BG.getField @"flags" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pixels = BG.getField @"pixels" x0
            , refcount = BG.getField @"refcount" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"pitch" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "pitch" (BG.Ptr SDL_Surface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pitch")

instance HasCField.HasCField SDL_Surface "pitch" where
  type CFieldType SDL_Surface "pitch" = BG.CInt

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "pixels" SDL_Surface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Surface
            { pixels = y1
            , flags = BG.getField @"flags" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pitch = BG.getField @"pitch" x0
            , refcount = BG.getField @"refcount" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"pixels" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "pixels" (BG.Ptr SDL_Surface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pixels")

instance HasCField.HasCField SDL_Surface "pixels" where
  type CFieldType SDL_Surface "pixels" = BG.Ptr BG.Void

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "refcount" SDL_Surface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Surface
            { refcount = y1
            , flags = BG.getField @"flags" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pitch = BG.getField @"pitch" x0
            , pixels = BG.getField @"pixels" x0
            , reserved = BG.getField @"reserved" x0
            }
      , BG.getField @"refcount" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "refcount" (BG.Ptr SDL_Surface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"refcount")

instance HasCField.HasCField SDL_Surface "refcount" where
  type CFieldType SDL_Surface "refcount" = BG.CInt

  offset# = \_ -> \_ -> 32

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "reserved" SDL_Surface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Surface
            { reserved = y1
            , flags = BG.getField @"flags" x0
            , format = BG.getField @"format" x0
            , w = BG.getField @"w" x0
            , h = BG.getField @"h" x0
            , pitch = BG.getField @"pitch" x0
            , pixels = BG.getField @"pixels" x0
            , refcount = BG.getField @"refcount" x0
            }
      , BG.getField @"reserved" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "reserved" (BG.Ptr SDL_Surface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"reserved")

instance HasCField.HasCField SDL_Surface "reserved" where
  type
    CFieldType SDL_Surface "reserved" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 40

-- | [C declaration]: @macro SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT@, literal @\"SDL.surface.SDR_white_point\"@, defined at @SDL3\/SDL_surface.h 261:9@
sDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT :: BG.ByteString
sDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    , 0x2E
    , 0x53
    , 0x44
    , 0x52
    , 0x5F
    , 0x77
    , 0x68
    , 0x69
    , 0x74
    , 0x65
    , 0x5F
    , 0x70
    , 0x6F
    , 0x69
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT@, literal @\"SDL.surface.HDR_headroom\"@, defined at @SDL3\/SDL_surface.h 262:9@
sDL_PROP_SURFACE_HDR_HEADROOM_FLOAT :: BG.ByteString
sDL_PROP_SURFACE_HDR_HEADROOM_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    , 0x2E
    , 0x48
    , 0x44
    , 0x52
    , 0x5F
    , 0x68
    , 0x65
    , 0x61
    , 0x64
    , 0x72
    , 0x6F
    , 0x6F
    , 0x6D
    ]

-- | [C declaration]: @macro SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING@, literal @\"SDL.surface.tonemap\"@, defined at @SDL3\/SDL_surface.h 263:9@
sDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING :: BG.ByteString
sDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    , 0x2E
    , 0x74
    , 0x6F
    , 0x6E
    , 0x65
    , 0x6D
    , 0x61
    , 0x70
    ]

-- | [C declaration]: @macro SDL_PROP_SURFACE_HOTSPOT_X_NUMBER@, literal @\"SDL.surface.hotspot.x\"@, defined at @SDL3\/SDL_surface.h 264:9@
sDL_PROP_SURFACE_HOTSPOT_X_NUMBER :: BG.ByteString
sDL_PROP_SURFACE_HOTSPOT_X_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    , 0x2E
    , 0x68
    , 0x6F
    , 0x74
    , 0x73
    , 0x70
    , 0x6F
    , 0x74
    , 0x2E
    , 0x78
    ]

-- | [C declaration]: @macro SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER@, literal @\"SDL.surface.hotspot.y\"@, defined at @SDL3\/SDL_surface.h 265:9@
sDL_PROP_SURFACE_HOTSPOT_Y_NUMBER :: BG.ByteString
sDL_PROP_SURFACE_HOTSPOT_Y_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    , 0x2E
    , 0x68
    , 0x6F
    , 0x74
    , 0x73
    , 0x70
    , 0x6F
    , 0x74
    , 0x2E
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_SURFACE_ROTATION_FLOAT@, literal @\"SDL.surface.rotation\"@, defined at @SDL3\/SDL_surface.h 266:9@
sDL_PROP_SURFACE_ROTATION_FLOAT :: BG.ByteString
sDL_PROP_SURFACE_ROTATION_FLOAT =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x73
    , 0x75
    , 0x72
    , 0x66
    , 0x61
    , 0x63
    , 0x65
    , 0x2E
    , 0x72
    , 0x6F
    , 0x74
    , 0x61
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    ]
