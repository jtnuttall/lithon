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

-- | SDL pen event handling.
--
--     SDL provides an API for pressure-sensitive pen (stylus and\/or eraser) handling, e.g., for input and drawing tablets or suitably equipped mobile \/ tablet devices.
--
--     To get started with pens, simply handle pen events:
--
--     * SDL_EVENT_PEN_PROXIMITY_IN, SDL_EVENT_PEN_PROXIMITY_OUT (SDL_PenProximityEvent)
--
--     * SDL_EVENT_PEN_DOWN, SDL_EVENT_PEN_UP (SDL_PenTouchEvent)
--
--     * SDL_EVENT_PEN_MOTION (SDL_PenMotionEvent)
--
--     * SDL_EVENT_PEN_BUTTON_DOWN, SDL_EVENT_PEN_BUTTON_UP (SDL_PenButtonEvent)
--
--     * SDL_EVENT_PEN_AXIS (SDL_PenAxisEvent)
--
--     Pens may provide more than simple touch input; they might have other axes, such as pressure, tilt, rotation, etc.
--
--     When a pen starts providing input, SDL will assign it a unique 'SDL_PenID', which will remain for the life of the process, as long as the pen stays connected. A pen leaving proximity (being taken far enough away from the digitizer tablet that it no longer reponds) and then coming back should fire proximity events, but the 'SDL_PenID' should remain consistent. Unplugging the digitizer and reconnecting may cause future input to have a new 'SDL_PenID', as SDL may not know that this is the same hardware.
--
--     Please note that various platforms vary wildly in how (and how well) they support pen input. If your pen supports some piece of functionality but SDL doesn\'t seem to, it might actually be the operating system\'s fault. For example, some platforms can manage multiple devices at the same time, but others will make any connected pens look like a single logical device, much how all USB mice connected to a computer will move the same system cursor. cursor. Other platforms might not support pen buttons, or the distance axis, etc. Very few platforms can even report /what/ functionality the pen supports in the first place, so best practices is to either build UI to let the user configure their pens, or be prepared to handle new functionality for a pen the first time an event is reported. SDL pen instance IDs.
--
--     Zero is used to signify an invalid\/null device.
--
--     These show up in pen events when SDL sees input from them. They remain consistent as long as SDL can recognize a tool to be the same pen; but if a pen\'s digitizer table is physically detached from the computer, it might get a new ID when reconnected, as SDL won\'t know it\'s the same device.
--
--     These IDs are only stable within a single run of a program; the next time a program is run, the pen\'s ID will likely be different, even if the hardware hasn\'t been disconnected, etc.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Pen (
  SDL3.Sys.Bindgen.Pen.SDL_PenID (..),
  SDL3.Sys.Bindgen.Pen.SDL_PenInputFlags (..),
  SDL3.Sys.Bindgen.Pen.sDL_PEN_INPUT_DOWN,
  SDL3.Sys.Bindgen.Pen.sDL_PEN_INPUT_BUTTON_1,
  SDL3.Sys.Bindgen.Pen.sDL_PEN_INPUT_BUTTON_2,
  SDL3.Sys.Bindgen.Pen.sDL_PEN_INPUT_BUTTON_3,
  SDL3.Sys.Bindgen.Pen.sDL_PEN_INPUT_BUTTON_4,
  SDL3.Sys.Bindgen.Pen.sDL_PEN_INPUT_BUTTON_5,
  SDL3.Sys.Bindgen.Pen.sDL_PEN_INPUT_ERASER_TIP,
  SDL3.Sys.Bindgen.Pen.sDL_PEN_INPUT_IN_PROXIMITY,
  SDL3.Sys.Bindgen.Pen.SDL_PenAxis (..),
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_AXIS_PRESSURE,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_AXIS_XTILT,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_AXIS_YTILT,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_AXIS_DISTANCE,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_AXIS_ROTATION,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_AXIS_SLIDER,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_AXIS_TANGENTIAL_PRESSURE,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_AXIS_COUNT,
  SDL3.Sys.Bindgen.Pen.SDL_PenDeviceType (..),
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_DEVICE_TYPE_INVALID,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_DEVICE_TYPE_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_DEVICE_TYPE_DIRECT,
  pattern SDL3.Sys.Bindgen.Pen.SDL_PEN_DEVICE_TYPE_INDIRECT,
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_PenID@, defined at @SDL3\/SDL_pen.h 93:16@
newtype SDL_PenID = SDL_PenID
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
  => BG.CompatHasField.HasField "unwrap" SDL_PenID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_PenID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PenID "unwrap" where
  type
    CFieldType SDL_PenID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Pen input flags, as reported by various pen events\' @pen_state@ field.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_PenInputFlags@, defined at @SDL3\/SDL_pen.h 114:16@
newtype SDL_PenInputFlags = SDL_PenInputFlags
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
  => BG.CompatHasField.HasField "unwrap" SDL_PenInputFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenInputFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_PenInputFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PenInputFlags "unwrap" where
  type
    CFieldType SDL_PenInputFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | pen is pressed down
--
--     [C declaration]: @macro SDL_PEN_INPUT_DOWN@, defined at @SDL3\/SDL_pen.h 116:9@
sDL_PEN_INPUT_DOWN :: BG.CUInt
sDL_PEN_INPUT_DOWN =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (0 :: BG.CInt)

-- | button 1 is pressed
--
--     [C declaration]: @macro SDL_PEN_INPUT_BUTTON_1@, defined at @SDL3\/SDL_pen.h 117:9@
sDL_PEN_INPUT_BUTTON_1 :: BG.CUInt
sDL_PEN_INPUT_BUTTON_1 =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (1 :: BG.CInt)

-- | button 2 is pressed
--
--     [C declaration]: @macro SDL_PEN_INPUT_BUTTON_2@, defined at @SDL3\/SDL_pen.h 118:9@
sDL_PEN_INPUT_BUTTON_2 :: BG.CUInt
sDL_PEN_INPUT_BUTTON_2 =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (2 :: BG.CInt)

-- | button 3 is pressed
--
--     [C declaration]: @macro SDL_PEN_INPUT_BUTTON_3@, defined at @SDL3\/SDL_pen.h 119:9@
sDL_PEN_INPUT_BUTTON_3 :: BG.CUInt
sDL_PEN_INPUT_BUTTON_3 =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (3 :: BG.CInt)

-- | button 4 is pressed
--
--     [C declaration]: @macro SDL_PEN_INPUT_BUTTON_4@, defined at @SDL3\/SDL_pen.h 120:9@
sDL_PEN_INPUT_BUTTON_4 :: BG.CUInt
sDL_PEN_INPUT_BUTTON_4 =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (4 :: BG.CInt)

-- | button 5 is pressed
--
--     [C declaration]: @macro SDL_PEN_INPUT_BUTTON_5@, defined at @SDL3\/SDL_pen.h 121:9@
sDL_PEN_INPUT_BUTTON_5 :: BG.CUInt
sDL_PEN_INPUT_BUTTON_5 =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (5 :: BG.CInt)

-- | eraser tip is used
--
--     [C declaration]: @macro SDL_PEN_INPUT_ERASER_TIP@, defined at @SDL3\/SDL_pen.h 122:9@
sDL_PEN_INPUT_ERASER_TIP :: BG.CUInt
sDL_PEN_INPUT_ERASER_TIP =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (30 :: BG.CInt)

-- | pen is in proximity (since SDL 3.4.0)
--
--     [C declaration]: @macro SDL_PEN_INPUT_IN_PROXIMITY@, defined at @SDL3\/SDL_pen.h 123:9@
sDL_PEN_INPUT_IN_PROXIMITY :: BG.CUInt
sDL_PEN_INPUT_IN_PROXIMITY =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (31 :: BG.CInt)

-- | Pen axis indices.
--
--     These are the valid values for the @axis@ field in SDL_PenAxisEvent. All axes are either normalised to 0..1 or report a (positive or negative) angle in degrees, with 0.0 representing the centre. Not all pens\/backends support all axes: unsupported axes are always zero.
--
--     To convert angles for tilt and rotation into vector representation, use SDL_sinf on the XTILT, YTILT, or ROTATION component, for example:
--
--     @SDL_sinf(xtilt * SDL_PI_F \/ 180.0)@.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_PenAxis@, defined at @SDL3\/SDL_pen.h 140:14@
newtype SDL_PenAxis = SDL_PenAxis
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_PenAxis where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PenAxis where
  readRaw =
    \ptr0 ->
      pure SDL_PenAxis
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_PenAxis where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PenAxis unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_PenAxis instance BG.Storable SDL_PenAxis

deriving via BG.CUInt instance BG.Prim SDL_PenAxis

instance CEnum.CEnum SDL_PenAxis where
  type CEnumZ SDL_PenAxis = BG.CUInt

  toCEnum = SDL_PenAxis

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_PEN_AXIS_PRESSURE")
        , (1, BG.singleton "SDL_PEN_AXIS_XTILT")
        , (2, BG.singleton "SDL_PEN_AXIS_YTILT")
        , (3, BG.singleton "SDL_PEN_AXIS_DISTANCE")
        , (4, BG.singleton "SDL_PEN_AXIS_ROTATION")
        , (5, BG.singleton "SDL_PEN_AXIS_SLIDER")
        , (6, BG.singleton "SDL_PEN_AXIS_TANGENTIAL_PRESSURE")
        , (7, BG.singleton "SDL_PEN_AXIS_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_PenAxis"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_PenAxis"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_PenAxis where
  minDeclaredValue = SDL_PEN_AXIS_PRESSURE

  maxDeclaredValue = SDL_PEN_AXIS_COUNT

instance Show SDL_PenAxis where
  showsPrec = CEnum.shows

instance Read SDL_PenAxis where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_PenAxis ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenAxis{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_PenAxis) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PenAxis "unwrap" where
  type CFieldType SDL_PenAxis "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Pen pressure. Unidirectional: 0 to 1.0
--
--     [C declaration]: @SDL_PEN_AXIS_PRESSURE@, defined at @SDL3\/SDL_pen.h 142:5@
pattern SDL_PEN_AXIS_PRESSURE :: SDL_PenAxis
pattern SDL_PEN_AXIS_PRESSURE = SDL_PenAxis 0

-- | Pen horizontal tilt angle. Bidirectional: -90.0 to 90.0 (left-to-right).
--
--     [C declaration]: @SDL_PEN_AXIS_XTILT@, defined at @SDL3\/SDL_pen.h 143:5@
pattern SDL_PEN_AXIS_XTILT :: SDL_PenAxis
pattern SDL_PEN_AXIS_XTILT = SDL_PenAxis 1

-- | Pen vertical tilt angle. Bidirectional: -90.0 to 90.0 (top-to-down).
--
--     [C declaration]: @SDL_PEN_AXIS_YTILT@, defined at @SDL3\/SDL_pen.h 144:5@
pattern SDL_PEN_AXIS_YTILT :: SDL_PenAxis
pattern SDL_PEN_AXIS_YTILT = SDL_PenAxis 2

-- | Pen distance to drawing surface. Unidirectional: 0.0 to 1.0
--
--     [C declaration]: @SDL_PEN_AXIS_DISTANCE@, defined at @SDL3\/SDL_pen.h 145:5@
pattern SDL_PEN_AXIS_DISTANCE :: SDL_PenAxis
pattern SDL_PEN_AXIS_DISTANCE = SDL_PenAxis 3

-- | Pen barrel rotation. Bidirectional: -180 to 179.9 (clockwise, 0 is facing up, -180.0 is facing down).
--
--     [C declaration]: @SDL_PEN_AXIS_ROTATION@, defined at @SDL3\/SDL_pen.h 146:5@
pattern SDL_PEN_AXIS_ROTATION :: SDL_PenAxis
pattern SDL_PEN_AXIS_ROTATION = SDL_PenAxis 4

-- | Pen finger wheel or slider (e.g., Airbrush Pen). Unidirectional: 0 to 1.0
--
--     [C declaration]: @SDL_PEN_AXIS_SLIDER@, defined at @SDL3\/SDL_pen.h 147:5@
pattern SDL_PEN_AXIS_SLIDER :: SDL_PenAxis
pattern SDL_PEN_AXIS_SLIDER = SDL_PenAxis 5

-- | Pressure from squeezing the pen (\"barrel pressure\").
--
--     [C declaration]: @SDL_PEN_AXIS_TANGENTIAL_PRESSURE@, defined at @SDL3\/SDL_pen.h 148:5@
pattern SDL_PEN_AXIS_TANGENTIAL_PRESSURE :: SDL_PenAxis
pattern SDL_PEN_AXIS_TANGENTIAL_PRESSURE = SDL_PenAxis 6

-- | Total known pen axis types in this version of SDL. This number may grow in future releases!
--
--     [C declaration]: @SDL_PEN_AXIS_COUNT@, defined at @SDL3\/SDL_pen.h 149:5@
pattern SDL_PEN_AXIS_COUNT :: SDL_PenAxis
pattern SDL_PEN_AXIS_COUNT = SDL_PenAxis 7

-- | An enum that describes the type of a pen device.
--
--     A \"direct\" device is a pen that touches a graphic display (like an Apple Pencil on an iPad\'s screen). \"Indirect\" devices touch an external tablet surface that is connected to the machine but is not a display (like a lower-end Wacom tablet connected over USB).
--
--     Apps may use this information to decide if they should draw a cursor; if the pen is touching the screen directly, a cursor doesn\'t make sense and can be in the way, but becomes necessary for indirect devices to know where on the display they are interacting.
--
--     @since 3.4.0
--
--     [C declaration]: @enum SDL_PenDeviceType@, defined at @SDL3\/SDL_pen.h 167:14@
newtype SDL_PenDeviceType = SDL_PenDeviceType
  { unwrap :: BG.CInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_PenDeviceType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PenDeviceType where
  readRaw =
    \ptr0 ->
      pure SDL_PenDeviceType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_PenDeviceType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PenDeviceType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_PenDeviceType instance BG.Storable SDL_PenDeviceType

deriving via BG.CInt instance BG.Prim SDL_PenDeviceType

instance CEnum.CEnum SDL_PenDeviceType where
  type CEnumZ SDL_PenDeviceType = BG.CInt

  toCEnum = SDL_PenDeviceType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (-1, BG.singleton "SDL_PEN_DEVICE_TYPE_INVALID")
        , (0, BG.singleton "SDL_PEN_DEVICE_TYPE_UNKNOWN")
        , (1, BG.singleton "SDL_PEN_DEVICE_TYPE_DIRECT")
        , (2, BG.singleton "SDL_PEN_DEVICE_TYPE_INDIRECT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_PenDeviceType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_PenDeviceType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_PenDeviceType where
  minDeclaredValue = SDL_PEN_DEVICE_TYPE_INVALID

  maxDeclaredValue = SDL_PEN_DEVICE_TYPE_INDIRECT

instance Show SDL_PenDeviceType where
  showsPrec = CEnum.shows

instance Read SDL_PenDeviceType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "unwrap" SDL_PenDeviceType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PenDeviceType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_PenDeviceType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PenDeviceType "unwrap" where
  type CFieldType SDL_PenDeviceType "unwrap" = BG.CInt

  offset# = \_ -> \_ -> 0

-- | Not a valid pen device.
--
--     [C declaration]: @SDL_PEN_DEVICE_TYPE_INVALID@, defined at @SDL3\/SDL_pen.h 169:5@
pattern SDL_PEN_DEVICE_TYPE_INVALID :: SDL_PenDeviceType
pattern SDL_PEN_DEVICE_TYPE_INVALID = SDL_PenDeviceType (-1)

-- | Don\'t know specifics of this pen.
--
--     [C declaration]: @SDL_PEN_DEVICE_TYPE_UNKNOWN@, defined at @SDL3\/SDL_pen.h 170:5@
pattern SDL_PEN_DEVICE_TYPE_UNKNOWN :: SDL_PenDeviceType
pattern SDL_PEN_DEVICE_TYPE_UNKNOWN = SDL_PenDeviceType 0

-- | Pen touches display.
--
--     [C declaration]: @SDL_PEN_DEVICE_TYPE_DIRECT@, defined at @SDL3\/SDL_pen.h 171:5@
pattern SDL_PEN_DEVICE_TYPE_DIRECT :: SDL_PenDeviceType
pattern SDL_PEN_DEVICE_TYPE_DIRECT = SDL_PenDeviceType 1

-- | Pen touches something that isn\'t the display.
--
--     [C declaration]: @SDL_PEN_DEVICE_TYPE_INDIRECT@, defined at @SDL3\/SDL_pen.h 172:5@
pattern SDL_PEN_DEVICE_TYPE_INDIRECT :: SDL_PenDeviceType
pattern SDL_PEN_DEVICE_TYPE_INDIRECT = SDL_PenDeviceType 2
