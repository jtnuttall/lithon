{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
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

-- | Video capture for the SDL library.
--
--     This API lets apps read input from video sources, like webcams. Camera devices can be enumerated, queried, and opened. Once opened, it will provide SDL_Surface objects as new frames of video come in. These surfaces can be uploaded to an SDL_Texture or processed as pixels in memory.
--
--     Several platforms will alert the user if an app tries to access a camera, and some will present a UI asking the user if your application should be allowed to obtain images at all, which they can deny. A successfully opened camera will not provide images until permission is granted. Applications, after opening a camera device, can see if they were granted access by either polling with the @SDL_GetCameraPermissionState()@ function, or waiting for an SDL_EVENT_CAMERA_DEVICE_APPROVED or SDL_EVENT_CAMERA_DEVICE_DENIED event. Platforms that don\'t have any user approval process will report approval immediately.
--
--     Note that SDL cameras only provide video as individual frames; they will not provide full-motion video encoded in a movie file format, although an app is free to encode the acquired frames into any format it likes. It also does not provide audio from the camera hardware through this API; not only do many webcams not have microphones at all, many people from streamers to people on Zoom calls will want to use a separate microphone regardless of the camera. In any case, recorded audio will be available through SDL\'s audio API no matter what hardware provides the microphone.
--
--     Camera gotchas
--
--     Consumer-level camera hardware tends to take a little while to warm up, once the device has been opened. Generally most camera apps have some sort of UI to take a picture (a button to snap a pic while a preview is showing, some sort of multi-second countdown for the user to pose, like a photo booth), which puts control in the users\' hands, or they are intended to stay on for long times (Pokemon Go, etc).
--
--     It\'s not uncommon that a newly-opened camera will provide a couple of completely black frames, maybe followed by some under-exposed images. If taking a single frame automatically, or recording video from a camera\'s input without the user initiating it from a preview, it could be wise to drop the first several frames (if not the first several /seconds/ worth of frames!) before using images from a camera. This is a unique ID for a camera device for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the device is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetCameras'
module SDL3.Sys.Bindgen.Camera (
  SDL3.Sys.Bindgen.Camera.SDL_CameraID (..),
  SDL3.Sys.Bindgen.Camera.SDL_Camera,
  SDL3.Sys.Bindgen.Camera.SDL_CameraSpec (..),
  SDL3.Sys.Bindgen.Camera.SDL_CameraPosition (..),
  pattern SDL3.Sys.Bindgen.Camera.SDL_CAMERA_POSITION_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Camera.SDL_CAMERA_POSITION_FRONT_FACING,
  pattern SDL3.Sys.Bindgen.Camera.SDL_CAMERA_POSITION_BACK_FACING,
  SDL3.Sys.Bindgen.Camera.SDL_CameraPermissionState (..),
  pattern SDL3.Sys.Bindgen.Camera.SDL_CAMERA_PERMISSION_STATE_DENIED,
  pattern SDL3.Sys.Bindgen.Camera.SDL_CAMERA_PERMISSION_STATE_PENDING,
  pattern SDL3.Sys.Bindgen.Camera.SDL_CAMERA_PERMISSION_STATE_APPROVED,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Pixels qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_CameraID@, defined at @SDL3\/SDL_camera.h 95:16@
newtype SDL_CameraID = SDL_CameraID
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
  => BG.CompatHasField.HasField "unwrap" SDL_CameraID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_CameraID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_CameraID "unwrap" where
  type
    CFieldType SDL_CameraID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | The opaque structure used to identify an opened SDL camera.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_Camera@, defined at @SDL3\/SDL_camera.h 102:16@
data SDL_Camera

-- | The details of an output format for a camera device.
--
--     Cameras often support multiple formats; each one will be encapsulated in this struct.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetCameraSupportedFormats', 'sDL_GetCameraFormat'
--
--     [C declaration]: @struct SDL_CameraSpec@, defined at @SDL3\/SDL_camera.h 115:16@
data SDL_CameraSpec = SDL_CameraSpec
  { format :: SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat
  -- ^ Frame format
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_camera.h 117:21@
  , colorspace :: SDL3.Sys.Bindgen.Pixels.SDL_Colorspace
  -- ^ Frame colorspace
  --
  --          [C declaration]: @colorspace@, defined at @SDL3\/SDL_camera.h 118:20@
  , width :: BG.CInt
  -- ^ Frame width
  --
  --          [C declaration]: @width@, defined at @SDL3\/SDL_camera.h 119:9@
  , height :: BG.CInt
  -- ^ Frame height
  --
  --          [C declaration]: @height@, defined at @SDL3\/SDL_camera.h 120:9@
  , framerate_numerator :: BG.CInt
  -- ^ Frame rate numerator ((num \/ denom) == FPS, (denom \/ num) == duration in seconds)
  --
  --          [C declaration]: @framerate_numerator@, defined at @SDL3\/SDL_camera.h 121:9@
  , framerate_denominator :: BG.CInt
  -- ^ Frame rate denominator ((num \/ denom) == FPS, (denom \/ num) == duration in seconds)
  --
  --          [C declaration]: @framerate_denominator@, defined at @SDL3\/SDL_camera.h 122:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_CameraSpec where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_CameraSpec where
  readRaw =
    \ptr0 ->
      pure SDL_CameraSpec
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"colorspace") ptr0
        <*> HasCField.readRaw (BG.Proxy @"width") ptr0
        <*> HasCField.readRaw (BG.Proxy @"height") ptr0
        <*> HasCField.readRaw (BG.Proxy @"framerate_numerator") ptr0
        <*> HasCField.readRaw (BG.Proxy @"framerate_denominator") ptr0

instance Marshal.WriteRaw SDL_CameraSpec where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_CameraSpec
            format2
            colorspace3
            width4
            height5
            framerate_numerator6
            framerate_denominator7 ->
              HasCField.writeRaw (BG.Proxy @"format") ptr0 format2
                >> HasCField.writeRaw (BG.Proxy @"colorspace") ptr0 colorspace3
                >> HasCField.writeRaw (BG.Proxy @"width") ptr0 width4
                >> HasCField.writeRaw (BG.Proxy @"height") ptr0 height5
                >> HasCField.writeRaw (BG.Proxy @"framerate_numerator") ptr0 framerate_numerator6
                >> HasCField.writeRaw (BG.Proxy @"framerate_denominator") ptr0 framerate_denominator7

deriving via Marshal.EquivStorable SDL_CameraSpec instance BG.Storable SDL_CameraSpec

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
  => BG.CompatHasField.HasField "format" SDL_CameraSpec ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraSpec
            { format = y1
            , colorspace = BG.getField @"colorspace" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , framerate_numerator = BG.getField @"framerate_numerator" x0
            , framerate_denominator = BG.getField @"framerate_denominator" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat)
  => BG.HasField "format" (BG.Ptr SDL_CameraSpec) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_CameraSpec "format" where
  type
    CFieldType SDL_CameraSpec "format" =
      SDL3.Sys.Bindgen.Pixels.SDL_PixelFormat

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_Colorspace)
  => BG.CompatHasField.HasField "colorspace" SDL_CameraSpec ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraSpec
            { colorspace = y1
            , format = BG.getField @"format" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , framerate_numerator = BG.getField @"framerate_numerator" x0
            , framerate_denominator = BG.getField @"framerate_denominator" x0
            }
      , BG.getField @"colorspace" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Pixels.SDL_Colorspace)
  => BG.HasField "colorspace" (BG.Ptr SDL_CameraSpec) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"colorspace")

instance HasCField.HasCField SDL_CameraSpec "colorspace" where
  type
    CFieldType SDL_CameraSpec "colorspace" =
      SDL3.Sys.Bindgen.Pixels.SDL_Colorspace

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "width" SDL_CameraSpec ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraSpec
            { width = y1
            , format = BG.getField @"format" x0
            , colorspace = BG.getField @"colorspace" x0
            , height = BG.getField @"height" x0
            , framerate_numerator = BG.getField @"framerate_numerator" x0
            , framerate_denominator = BG.getField @"framerate_denominator" x0
            }
      , BG.getField @"width" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "width" (BG.Ptr SDL_CameraSpec) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"width")

instance HasCField.HasCField SDL_CameraSpec "width" where
  type CFieldType SDL_CameraSpec "width" = BG.CInt

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "height" SDL_CameraSpec ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraSpec
            { height = y1
            , format = BG.getField @"format" x0
            , colorspace = BG.getField @"colorspace" x0
            , width = BG.getField @"width" x0
            , framerate_numerator = BG.getField @"framerate_numerator" x0
            , framerate_denominator = BG.getField @"framerate_denominator" x0
            }
      , BG.getField @"height" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "height" (BG.Ptr SDL_CameraSpec) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"height")

instance HasCField.HasCField SDL_CameraSpec "height" where
  type CFieldType SDL_CameraSpec "height" = BG.CInt

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "framerate_numerator" SDL_CameraSpec ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraSpec
            { framerate_numerator = y1
            , format = BG.getField @"format" x0
            , colorspace = BG.getField @"colorspace" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , framerate_denominator = BG.getField @"framerate_denominator" x0
            }
      , BG.getField @"framerate_numerator" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "framerate_numerator" (BG.Ptr SDL_CameraSpec) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"framerate_numerator")

instance HasCField.HasCField SDL_CameraSpec "framerate_numerator" where
  type
    CFieldType SDL_CameraSpec "framerate_numerator" =
      BG.CInt

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "framerate_denominator" SDL_CameraSpec ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraSpec
            { framerate_denominator = y1
            , format = BG.getField @"format" x0
            , colorspace = BG.getField @"colorspace" x0
            , width = BG.getField @"width" x0
            , height = BG.getField @"height" x0
            , framerate_numerator = BG.getField @"framerate_numerator" x0
            }
      , BG.getField @"framerate_denominator" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "framerate_denominator" (BG.Ptr SDL_CameraSpec) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"framerate_denominator")

instance HasCField.HasCField SDL_CameraSpec "framerate_denominator" where
  type
    CFieldType SDL_CameraSpec "framerate_denominator" =
      BG.CInt

  offset# = \_ -> \_ -> 20

-- | The position of camera in relation to system device.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetCameraPosition'
--
--     [C declaration]: @enum SDL_CameraPosition@, defined at @SDL3\/SDL_camera.h 132:14@
newtype SDL_CameraPosition = SDL_CameraPosition
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_CameraPosition where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_CameraPosition where
  readRaw =
    \ptr0 ->
      pure SDL_CameraPosition
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_CameraPosition where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_CameraPosition unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_CameraPosition instance BG.Storable SDL_CameraPosition

deriving via BG.CUInt instance BG.Prim SDL_CameraPosition

instance CEnum.CEnum SDL_CameraPosition where
  type CEnumZ SDL_CameraPosition = BG.CUInt

  toCEnum = SDL_CameraPosition

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_CAMERA_POSITION_UNKNOWN")
        , (1, BG.singleton "SDL_CAMERA_POSITION_FRONT_FACING")
        , (2, BG.singleton "SDL_CAMERA_POSITION_BACK_FACING")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_CameraPosition"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_CameraPosition"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_CameraPosition where
  minDeclaredValue = SDL_CAMERA_POSITION_UNKNOWN

  maxDeclaredValue = SDL_CAMERA_POSITION_BACK_FACING

instance Show SDL_CameraPosition where
  showsPrec = CEnum.shows

instance Read SDL_CameraPosition where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_CameraPosition ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraPosition{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_CameraPosition) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_CameraPosition "unwrap" where
  type
    CFieldType SDL_CameraPosition "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_CAMERA_POSITION_UNKNOWN@, defined at @SDL3\/SDL_camera.h 134:5@
pattern SDL_CAMERA_POSITION_UNKNOWN :: SDL_CameraPosition
pattern SDL_CAMERA_POSITION_UNKNOWN = SDL_CameraPosition 0

-- | [C declaration]: @SDL_CAMERA_POSITION_FRONT_FACING@, defined at @SDL3\/SDL_camera.h 135:5@
pattern SDL_CAMERA_POSITION_FRONT_FACING :: SDL_CameraPosition
pattern SDL_CAMERA_POSITION_FRONT_FACING = SDL_CameraPosition 1

-- | [C declaration]: @SDL_CAMERA_POSITION_BACK_FACING@, defined at @SDL3\/SDL_camera.h 136:5@
pattern SDL_CAMERA_POSITION_BACK_FACING :: SDL_CameraPosition
pattern SDL_CAMERA_POSITION_BACK_FACING = SDL_CameraPosition 2

-- | The current state of a request for camera access.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_GetCameraPermissionState'
--
--     [C declaration]: @enum SDL_CameraPermissionState@, defined at @SDL3\/SDL_camera.h 146:14@
newtype SDL_CameraPermissionState = SDL_CameraPermissionState
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_CameraPermissionState where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_CameraPermissionState where
  readRaw =
    \ptr0 ->
      pure SDL_CameraPermissionState
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_CameraPermissionState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_CameraPermissionState unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_CameraPermissionState
  instance
    BG.Storable SDL_CameraPermissionState

deriving via BG.CInt instance BG.Prim SDL_CameraPermissionState

instance CEnum.CEnum SDL_CameraPermissionState where
  type CEnumZ SDL_CameraPermissionState = BG.CInt

  toCEnum = SDL_CameraPermissionState

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_CAMERA_PERMISSION_STATE_DENIED")
        , (0, BG.singleton "SDL_CAMERA_PERMISSION_STATE_PENDING")
        , (1, BG.singleton "SDL_CAMERA_PERMISSION_STATE_APPROVED")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_CameraPermissionState"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_CameraPermissionState"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_CameraPermissionState where
  minDeclaredValue = SDL_CAMERA_PERMISSION_STATE_DENIED

  maxDeclaredValue =
    SDL_CAMERA_PERMISSION_STATE_APPROVED

instance Show SDL_CameraPermissionState where
  showsPrec = CEnum.shows

instance Read SDL_CameraPermissionState where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_CameraPermissionState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CameraPermissionState{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_CameraPermissionState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_CameraPermissionState "unwrap" where
  type
    CFieldType SDL_CameraPermissionState "unwrap" =
      BG.CInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_CAMERA_PERMISSION_STATE_DENIED@, defined at @SDL3\/SDL_camera.h 148:5@
pattern SDL_CAMERA_PERMISSION_STATE_DENIED :: SDL_CameraPermissionState
pattern SDL_CAMERA_PERMISSION_STATE_DENIED = SDL_CameraPermissionState (-1)

-- | [C declaration]: @SDL_CAMERA_PERMISSION_STATE_PENDING@, defined at @SDL3\/SDL_camera.h 149:5@
pattern SDL_CAMERA_PERMISSION_STATE_PENDING :: SDL_CameraPermissionState
pattern SDL_CAMERA_PERMISSION_STATE_PENDING = SDL_CameraPermissionState 0

-- | [C declaration]: @SDL_CAMERA_PERMISSION_STATE_APPROVED@, defined at @SDL3\/SDL_camera.h 150:5@
pattern SDL_CAMERA_PERMISSION_STATE_APPROVED :: SDL_CameraPermissionState
pattern SDL_CAMERA_PERMISSION_STATE_APPROVED = SDL_CameraPermissionState 1
