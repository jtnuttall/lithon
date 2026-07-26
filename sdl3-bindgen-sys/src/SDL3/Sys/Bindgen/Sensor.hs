{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
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

-- | SDL sensor management.
--
--     These APIs grant access to gyros and accelerometers on various platforms.
--
--     In order to use these functions, SDL_Init() must have been called with the SDL_INIT_SENSOR flag. This causes SDL to scan the system for sensors, and load appropriate drivers. The opaque structure used to identify an opened SDL sensor.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Sensor (
  SDL3.Sys.Bindgen.Sensor.SDL_Sensor,
  SDL3.Sys.Bindgen.Sensor.SDL_SensorID (..),
  SDL3.Sys.Bindgen.Sensor.sDL_STANDARD_GRAVITY,
  SDL3.Sys.Bindgen.Sensor.SDL_SensorType (..),
  pattern SDL3.Sys.Bindgen.Sensor.SDL_SENSOR_INVALID,
  pattern SDL3.Sys.Bindgen.Sensor.SDL_SENSOR_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Sensor.SDL_SENSOR_ACCEL,
  pattern SDL3.Sys.Bindgen.Sensor.SDL_SENSOR_GYRO,
  pattern SDL3.Sys.Bindgen.Sensor.SDL_SENSOR_ACCEL_L,
  pattern SDL3.Sys.Bindgen.Sensor.SDL_SENSOR_GYRO_L,
  pattern SDL3.Sys.Bindgen.Sensor.SDL_SENSOR_ACCEL_R,
  pattern SDL3.Sys.Bindgen.Sensor.SDL_SENSOR_GYRO_R,
  pattern SDL3.Sys.Bindgen.Sensor.SDL_SENSOR_COUNT,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @struct SDL_Sensor@, defined at @SDL3\/SDL_sensor.h 54:16@
data SDL_Sensor

-- | This is a unique ID for a sensor for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SensorID@, defined at @SDL3\/SDL_sensor.h 64:16@
newtype SDL_SensorID = SDL_SensorID
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
  => BG.CompatHasField.HasField "unwrap" SDL_SensorID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SensorID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_SensorID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_SensorID "unwrap" where
  type
    CFieldType SDL_SensorID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | A constant to represent standard gravity for accelerometer sensors.
--
--     The accelerometer returns the current acceleration in SI meters per second squared. This measurement includes the force of gravity, so a device at rest will have an value of SDL_STANDARD_GRAVITY away from the center of the earth, which is a positive Y value.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_STANDARD_GRAVITY@, defined at @SDL3\/SDL_sensor.h 76:9@
sDL_STANDARD_GRAVITY :: BG.CFloat
sDL_STANDARD_GRAVITY = (9.80665 :: BG.CFloat)

-- | The different sensors defined by SDL.
--
--     Additional sensors may be available, using platform dependent semantics.
--
--     Here are the additional Android sensors:
--
--     [https:\/\/developer.android.com\/reference\/android\/hardware\/SensorEvent.html\#values](https://developer.android.com/reference/android/hardware/SensorEvent.html#values)
--
--     Accelerometer sensor notes:
--
--     The accelerometer returns the current acceleration in SI meters per second squared. This measurement includes the force of gravity, so a device at rest will have an value of SDL_STANDARD_GRAVITY away from the center of the earth, which is a positive Y value.
--
--     * @values[0]@: Acceleration on the x axis
--
--     * @values[1]@: Acceleration on the y axis
--
--     * @values[2]@: Acceleration on the z axis
--
--     For phones and tablets held in natural orientation and game controllers held in front of you, the axes are defined as follows:
--
--     * -X ... +X : left ... right
--
--     * -Y ... +Y : bottom ... top
--
--     * -Z ... +Z : farther ... closer
--
--     The accelerometer axis data is not changed when the device is rotated.
--
--     Gyroscope sensor notes:
--
--     The gyroscope returns the current rate of rotation in radians per second. The rotation is positive in the counter-clockwise direction. That is, an observer looking from a positive location on one of the axes would see positive rotation on that axis when it appeared to be rotating counter-clockwise.
--
--     * @values[0]@: Angular speed around the x axis (pitch)
--
--     * @values[1]@: Angular speed around the y axis (yaw)
--
--     * @values[2]@: Angular speed around the z axis (roll)
--
--     For phones and tablets held in natural orientation and game controllers held in front of you, the axes are defined as follows:
--
--     * -X ... +X : left ... right
--
--     * -Y ... +Y : bottom ... top
--
--     * -Z ... +Z : farther ... closer
--
--     The gyroscope axis data is not changed when the device is rotated.
--
--     @since 3.2.0
--
--     [See also]: SDL_GetCurrentDisplayOrientation
--
--     [C declaration]: @enum SDL_SensorType@, defined at @SDL3\/SDL_sensor.h 132:14@
newtype SDL_SensorType = SDL_SensorType
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_SensorType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_SensorType where
  readRaw =
    \ptr0 ->
      pure SDL_SensorType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_SensorType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_SensorType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_SensorType instance BG.Storable SDL_SensorType

deriving via BG.CInt instance BG.Prim SDL_SensorType

instance CEnum.CEnum SDL_SensorType where
  type CEnumZ SDL_SensorType = BG.CInt

  toCEnum = SDL_SensorType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_SENSOR_INVALID")
        , (0, BG.singleton "SDL_SENSOR_UNKNOWN")
        , (1, BG.singleton "SDL_SENSOR_ACCEL")
        , (2, BG.singleton "SDL_SENSOR_GYRO")
        , (3, BG.singleton "SDL_SENSOR_ACCEL_L")
        , (4, BG.singleton "SDL_SENSOR_GYRO_L")
        , (5, BG.singleton "SDL_SENSOR_ACCEL_R")
        , (6, BG.singleton "SDL_SENSOR_GYRO_R")
        , (7, BG.singleton "SDL_SENSOR_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_SensorType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_SensorType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_SensorType where
  minDeclaredValue = SDL_SENSOR_INVALID

  maxDeclaredValue = SDL_SENSOR_COUNT

instance Show SDL_SensorType where
  showsPrec = CEnum.shows

instance Read SDL_SensorType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_SensorType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SensorType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_SensorType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_SensorType "unwrap" where
  type CFieldType SDL_SensorType "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | Returned for an invalid sensor
--
--     [C declaration]: @SDL_SENSOR_INVALID@, defined at @SDL3\/SDL_sensor.h 134:5@
pattern SDL_SENSOR_INVALID :: SDL_SensorType
pattern SDL_SENSOR_INVALID = SDL_SensorType (-1)

-- | Unknown sensor type
--
--     [C declaration]: @SDL_SENSOR_UNKNOWN@, defined at @SDL3\/SDL_sensor.h 135:5@
pattern SDL_SENSOR_UNKNOWN :: SDL_SensorType
pattern SDL_SENSOR_UNKNOWN = SDL_SensorType 0

-- | Accelerometer
--
--     [C declaration]: @SDL_SENSOR_ACCEL@, defined at @SDL3\/SDL_sensor.h 136:5@
pattern SDL_SENSOR_ACCEL :: SDL_SensorType
pattern SDL_SENSOR_ACCEL = SDL_SensorType 1

-- | Gyroscope
--
--     [C declaration]: @SDL_SENSOR_GYRO@, defined at @SDL3\/SDL_sensor.h 137:5@
pattern SDL_SENSOR_GYRO :: SDL_SensorType
pattern SDL_SENSOR_GYRO = SDL_SensorType 2

-- | Accelerometer for left Joy-Con controller and Wii nunchuk
--
--     [C declaration]: @SDL_SENSOR_ACCEL_L@, defined at @SDL3\/SDL_sensor.h 138:5@
pattern SDL_SENSOR_ACCEL_L :: SDL_SensorType
pattern SDL_SENSOR_ACCEL_L = SDL_SensorType 3

-- | Gyroscope for left Joy-Con controller
--
--     [C declaration]: @SDL_SENSOR_GYRO_L@, defined at @SDL3\/SDL_sensor.h 139:5@
pattern SDL_SENSOR_GYRO_L :: SDL_SensorType
pattern SDL_SENSOR_GYRO_L = SDL_SensorType 4

-- | Accelerometer for right Joy-Con controller
--
--     [C declaration]: @SDL_SENSOR_ACCEL_R@, defined at @SDL3\/SDL_sensor.h 140:5@
pattern SDL_SENSOR_ACCEL_R :: SDL_SensorType
pattern SDL_SENSOR_ACCEL_R = SDL_SensorType 5

-- | Gyroscope for right Joy-Con controller
--
--     [C declaration]: @SDL_SENSOR_GYRO_R@, defined at @SDL3\/SDL_sensor.h 141:5@
pattern SDL_SENSOR_GYRO_R :: SDL_SensorType
pattern SDL_SENSOR_GYRO_R = SDL_SensorType 6

-- | [C declaration]: @SDL_SENSOR_COUNT@, defined at @SDL3\/SDL_sensor.h 142:5@
pattern SDL_SENSOR_COUNT :: SDL_SensorType
pattern SDL_SENSOR_COUNT = SDL_SensorType 7
