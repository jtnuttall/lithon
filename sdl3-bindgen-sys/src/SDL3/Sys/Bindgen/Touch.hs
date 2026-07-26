{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
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

-- | SDL offers touch input, on platforms that support it. It can manage multiple touch devices and track multiple fingers on those devices.
--
--     Touches are mostly dealt with through the event system, in the SDL_EVENT_FINGER_DOWN, SDL_EVENT_FINGER_MOTION, and SDL_EVENT_FINGER_UP events, but there are also functions to query for hardware details, etc.
--
--     The touch system, by default, will also send virtual mouse events; this can be useful for making a some desktop apps work on a phone without significant changes. For apps that care about mouse and touch input separately, they should ignore mouse events that have a @which@ field of SDL_TOUCH_MOUSEID. A unique ID for a touch device.
--
--     This ID is valid for the time the device is connected to the system, and is never reused for the lifetime of the application.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Touch (
  SDL3.Sys.Bindgen.Touch.SDL_TouchID (..),
  SDL3.Sys.Bindgen.Touch.SDL_FingerID (..),
  SDL3.Sys.Bindgen.Touch.SDL_TouchDeviceType (..),
  pattern SDL3.Sys.Bindgen.Touch.SDL_TOUCH_DEVICE_INVALID,
  pattern SDL3.Sys.Bindgen.Touch.SDL_TOUCH_DEVICE_DIRECT,
  pattern SDL3.Sys.Bindgen.Touch.SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE,
  pattern SDL3.Sys.Bindgen.Touch.SDL_TOUCH_DEVICE_INDIRECT_RELATIVE,
  SDL3.Sys.Bindgen.Touch.SDL_Finger (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_TouchID@, defined at @SDL3\/SDL_touch.h 62:16@
newtype SDL_TouchID = SDL_TouchID
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint64
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
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "unwrap" SDL_TouchID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "unwrap" (BG.Ptr SDL_TouchID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TouchID "unwrap" where
  type
    CFieldType SDL_TouchID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 0

-- | A unique ID for a single finger on a touch device.
--
--     This ID is valid for the time the finger (stylus, etc) is touching and will be unique for all fingers currently in contact, so this ID tracks the lifetime of a single continuous touch. This value may represent an index, a pointer, or some other unique ID, depending on the platform.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_FingerID@, defined at @SDL3\/SDL_touch.h 76:16@
newtype SDL_FingerID = SDL_FingerID
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint64
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
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "unwrap" SDL_FingerID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FingerID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "unwrap" (BG.Ptr SDL_FingerID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_FingerID "unwrap" where
  type
    CFieldType SDL_FingerID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 0

-- | An enum that describes the type of a touch device.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_TouchDeviceType@, defined at @SDL3\/SDL_touch.h 83:14@
newtype SDL_TouchDeviceType = SDL_TouchDeviceType
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_TouchDeviceType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_TouchDeviceType where
  readRaw =
    \ptr0 ->
      pure SDL_TouchDeviceType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_TouchDeviceType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TouchDeviceType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_TouchDeviceType instance BG.Storable SDL_TouchDeviceType

deriving via BG.CInt instance BG.Prim SDL_TouchDeviceType

instance CEnum.CEnum SDL_TouchDeviceType where
  type CEnumZ SDL_TouchDeviceType = BG.CInt

  toCEnum = SDL_TouchDeviceType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_TOUCH_DEVICE_INVALID")
        , (0, BG.singleton "SDL_TOUCH_DEVICE_DIRECT")
        , (1, BG.singleton "SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE")
        , (2, BG.singleton "SDL_TOUCH_DEVICE_INDIRECT_RELATIVE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_TouchDeviceType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_TouchDeviceType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_TouchDeviceType where
  minDeclaredValue = SDL_TOUCH_DEVICE_INVALID

  maxDeclaredValue = SDL_TOUCH_DEVICE_INDIRECT_RELATIVE

instance Show SDL_TouchDeviceType where
  showsPrec = CEnum.shows

instance Read SDL_TouchDeviceType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_TouchDeviceType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TouchDeviceType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_TouchDeviceType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TouchDeviceType "unwrap" where
  type
    CFieldType SDL_TouchDeviceType "unwrap" =
      BG.CInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_TOUCH_DEVICE_INVALID@, defined at @SDL3\/SDL_touch.h 85:5@
pattern SDL_TOUCH_DEVICE_INVALID :: SDL_TouchDeviceType
pattern SDL_TOUCH_DEVICE_INVALID = SDL_TouchDeviceType (-1)

-- | touch screen with window-relative coordinates
--
--     [C declaration]: @SDL_TOUCH_DEVICE_DIRECT@, defined at @SDL3\/SDL_touch.h 86:5@
pattern SDL_TOUCH_DEVICE_DIRECT :: SDL_TouchDeviceType
pattern SDL_TOUCH_DEVICE_DIRECT = SDL_TouchDeviceType 0

-- | trackpad with absolute device coordinates
--
--     [C declaration]: @SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE@, defined at @SDL3\/SDL_touch.h 87:5@
pattern SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE :: SDL_TouchDeviceType
pattern SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE = SDL_TouchDeviceType 1

-- | trackpad with screen cursor-relative coordinates
--
--     [C declaration]: @SDL_TOUCH_DEVICE_INDIRECT_RELATIVE@, defined at @SDL3\/SDL_touch.h 88:5@
pattern SDL_TOUCH_DEVICE_INDIRECT_RELATIVE :: SDL_TouchDeviceType
pattern SDL_TOUCH_DEVICE_INDIRECT_RELATIVE = SDL_TouchDeviceType 2

-- | Data about a single finger in a multitouch event.
--
--     Each touch event is a collection of fingers that are simultaneously in contact with the touch device (so a \"touch\" can be a \"multitouch,\" in reality), and this struct reports details of the specific fingers.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetTouchFingers'
--
--     [C declaration]: @struct SDL_Finger@, defined at @SDL3\/SDL_touch.h 102:16@
data SDL_Finger = SDL_Finger
  { id :: SDL_FingerID
  -- ^ the finger ID
  --
  --          [C declaration]: @id@, defined at @SDL3\/SDL_touch.h 104:18@
  , x :: BG.CFloat
  -- ^ the x-axis location of the touch event, normalized (0...1)
  --
  --          [C declaration]: @x@, defined at @SDL3\/SDL_touch.h 105:11@
  , y :: BG.CFloat
  -- ^ the y-axis location of the touch event, normalized (0...1)
  --
  --          [C declaration]: @y@, defined at @SDL3\/SDL_touch.h 106:11@
  , pressure :: BG.CFloat
  -- ^ the quantity of pressure applied, normalized (0...1)
  --
  --          [C declaration]: @pressure@, defined at @SDL3\/SDL_touch.h 107:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_Finger where
  staticSizeOf = \_ -> (24 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_Finger where
  readRaw =
    \ptr0 ->
      pure SDL_Finger
        <*> HasCField.readRaw (BG.Proxy @"id") ptr0
        <*> HasCField.readRaw (BG.Proxy @"x") ptr0
        <*> HasCField.readRaw (BG.Proxy @"y") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pressure") ptr0

instance Marshal.WriteRaw SDL_Finger where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Finger id2 x3 y4 pressure5 ->
            HasCField.writeRaw (BG.Proxy @"id") ptr0 id2
              >> HasCField.writeRaw (BG.Proxy @"x") ptr0 x3
              >> HasCField.writeRaw (BG.Proxy @"y") ptr0 y4
              >> HasCField.writeRaw (BG.Proxy @"pressure") ptr0 pressure5

deriving via Marshal.EquivStorable SDL_Finger instance BG.Storable SDL_Finger

instance
  (ty ~ SDL_FingerID)
  => BG.CompatHasField.HasField "id" SDL_Finger ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Finger
            { id = y1
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"id" x0
      )

instance
  (ty ~ SDL_FingerID)
  => BG.HasField "id" (BG.Ptr SDL_Finger) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"id")

instance HasCField.HasCField SDL_Finger "id" where
  type CFieldType SDL_Finger "id" = SDL_FingerID

  offset# = \_ -> \_ -> 0

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "x" SDL_Finger ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Finger
            { x = y1
            , id = BG.getField @"id" x0
            , y = BG.getField @"y" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"x" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "x" (BG.Ptr SDL_Finger) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"x")

instance HasCField.HasCField SDL_Finger "x" where
  type CFieldType SDL_Finger "x" = BG.CFloat

  offset# = \_ -> \_ -> 8

instance (ty ~ BG.CFloat) => BG.CompatHasField.HasField "y" SDL_Finger ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Finger
            { y = y1
            , id = BG.getField @"id" x0
            , x = BG.getField @"x" x0
            , pressure = BG.getField @"pressure" x0
            }
      , BG.getField @"y" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "y" (BG.Ptr SDL_Finger) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"y")

instance HasCField.HasCField SDL_Finger "y" where
  type CFieldType SDL_Finger "y" = BG.CFloat

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.CFloat)
  => BG.CompatHasField.HasField "pressure" SDL_Finger ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Finger
            { pressure = y1
            , id = BG.getField @"id" x0
            , x = BG.getField @"x" x0
            , y = BG.getField @"y" x0
            }
      , BG.getField @"pressure" x0
      )

instance
  (ty ~ BG.CFloat)
  => BG.HasField "pressure" (BG.Ptr SDL_Finger) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pressure")

instance HasCField.HasCField SDL_Finger "pressure" where
  type CFieldType SDL_Finger "pressure" = BG.CFloat

  offset# = \_ -> \_ -> 16
