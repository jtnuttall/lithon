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

-- | Any GUI application has to deal with the mouse, and SDL provides functions to manage mouse input and the displayed cursor.
--
--     Most interactions with the mouse will come through the event subsystem. Moving a mouse generates an SDL_EVENT_MOUSE_MOTION event, pushing a button generates SDL_EVENT_MOUSE_BUTTON_DOWN, etc, but one can also query the current state of the mouse at any time with @SDL_GetMouseState()@.
--
--     For certain games, it\'s useful to disassociate the mouse cursor from mouse input. An FPS, for example, would not want the player\'s motion to stop as the mouse hits the edge of the window. For these scenarios, use @SDL_SetWindowRelativeMouseMode()@, which hides the cursor, grabs mouse input to the window, and reads mouse input no matter how far it moves.
--
--     Games that want the system to track the mouse but want to draw their own cursor can use @SDL_HideCursor()@ and @SDL_ShowCursor()@. It might be more efficient to let the system manage the cursor, if possible, using @SDL_SetCursor()@ with a custom image made through @SDL_CreateColorCursor()@, or perhaps just a specific system cursor from @SDL_CreateSystemCursor()@.
--
--     SDL can, on many platforms, differentiate between multiple connected mice, allowing for interesting input scenarios and multiplayer games. They can be enumerated with @SDL_GetMice()@, and SDL will send SDL_EVENT_MOUSE_ADDED and SDL_EVENT_MOUSE_REMOVED events as they are connected and unplugged.
--
--     Since many apps only care about basic mouse input, SDL offers a virtual mouse device for touch and pen input, which often can make a desktop application work on a touchscreen phone without any code changes. Apps that care about touch\/pen separately from mouse input should filter out events with a @which@ field of SDL_TOUCH_MOUSEID\/SDL_PEN_MOUSEID. This is a unique ID for a mouse for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the mouse is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Mouse (
  SDL3.Sys.Bindgen.Mouse.SDL_MouseID (..),
  SDL3.Sys.Bindgen.Mouse.SDL_Cursor,
  SDL3.Sys.Bindgen.Mouse.SDL_SystemCursor (..),
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_DEFAULT,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_TEXT,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_WAIT,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_CROSSHAIR,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_PROGRESS,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_NWSE_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_NESW_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_EW_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_NS_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_MOVE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_NOT_ALLOWED,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_POINTER,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_NW_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_N_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_NE_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_E_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_SE_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_S_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_SW_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_W_RESIZE,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_SYSTEM_CURSOR_COUNT,
  SDL3.Sys.Bindgen.Mouse.SDL_MouseWheelDirection (..),
  pattern SDL3.Sys.Bindgen.Mouse.SDL_MOUSEWHEEL_NORMAL,
  pattern SDL3.Sys.Bindgen.Mouse.SDL_MOUSEWHEEL_FLIPPED,
  SDL3.Sys.Bindgen.Mouse.SDL_CursorFrameInfo (..),
  SDL3.Sys.Bindgen.Mouse.SDL_MouseButtonFlags (..),
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_LEFT,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_MIDDLE,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_RIGHT,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_X1,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_X2,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_MASK,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_LMASK,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_MMASK,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_RMASK,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_X1MASK,
  SDL3.Sys.Bindgen.Mouse.sDL_BUTTON_X2MASK,
  SDL3.Sys.Bindgen.Mouse.SDL_MouseMotionTransformCallback_Aux (..),
  SDL3.Sys.Bindgen.Mouse.SDL_MouseMotionTransformCallback (..),
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Surface qualified
import SDL3.Sys.Bindgen.Video qualified

-- | [C declaration]: @SDL_MouseID@, defined at @SDL3\/SDL_mouse.h 81:16@
newtype SDL_MouseID = SDL_MouseID
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
  => BG.CompatHasField.HasField "unwrap" SDL_MouseID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_MouseID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MouseID "unwrap" where
  type
    CFieldType SDL_MouseID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | The structure used to identify an SDL cursor.
--
--     This is opaque data.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_Cursor@, defined at @SDL3\/SDL_mouse.h 90:16@
data SDL_Cursor

-- | Cursor types for @SDL_CreateSystemCursor()@.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_SystemCursor@, defined at @SDL3\/SDL_mouse.h 97:14@
newtype SDL_SystemCursor = SDL_SystemCursor
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_SystemCursor where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_SystemCursor where
  readRaw =
    \ptr0 ->
      pure SDL_SystemCursor
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_SystemCursor where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_SystemCursor unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_SystemCursor instance BG.Storable SDL_SystemCursor

deriving via BG.CUInt instance BG.Prim SDL_SystemCursor

instance CEnum.CEnum SDL_SystemCursor where
  type CEnumZ SDL_SystemCursor = BG.CUInt

  toCEnum = SDL_SystemCursor

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_SYSTEM_CURSOR_DEFAULT")
        , (1, BG.singleton "SDL_SYSTEM_CURSOR_TEXT")
        , (2, BG.singleton "SDL_SYSTEM_CURSOR_WAIT")
        , (3, BG.singleton "SDL_SYSTEM_CURSOR_CROSSHAIR")
        , (4, BG.singleton "SDL_SYSTEM_CURSOR_PROGRESS")
        , (5, BG.singleton "SDL_SYSTEM_CURSOR_NWSE_RESIZE")
        , (6, BG.singleton "SDL_SYSTEM_CURSOR_NESW_RESIZE")
        , (7, BG.singleton "SDL_SYSTEM_CURSOR_EW_RESIZE")
        , (8, BG.singleton "SDL_SYSTEM_CURSOR_NS_RESIZE")
        , (9, BG.singleton "SDL_SYSTEM_CURSOR_MOVE")
        , (10, BG.singleton "SDL_SYSTEM_CURSOR_NOT_ALLOWED")
        , (11, BG.singleton "SDL_SYSTEM_CURSOR_POINTER")
        , (12, BG.singleton "SDL_SYSTEM_CURSOR_NW_RESIZE")
        , (13, BG.singleton "SDL_SYSTEM_CURSOR_N_RESIZE")
        , (14, BG.singleton "SDL_SYSTEM_CURSOR_NE_RESIZE")
        , (15, BG.singleton "SDL_SYSTEM_CURSOR_E_RESIZE")
        , (16, BG.singleton "SDL_SYSTEM_CURSOR_SE_RESIZE")
        , (17, BG.singleton "SDL_SYSTEM_CURSOR_S_RESIZE")
        , (18, BG.singleton "SDL_SYSTEM_CURSOR_SW_RESIZE")
        , (19, BG.singleton "SDL_SYSTEM_CURSOR_W_RESIZE")
        , (20, BG.singleton "SDL_SYSTEM_CURSOR_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_SystemCursor"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_SystemCursor"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_SystemCursor where
  minDeclaredValue = SDL_SYSTEM_CURSOR_DEFAULT

  maxDeclaredValue = SDL_SYSTEM_CURSOR_COUNT

instance Show SDL_SystemCursor where
  showsPrec = CEnum.shows

instance Read SDL_SystemCursor where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_SystemCursor ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_SystemCursor{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_SystemCursor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_SystemCursor "unwrap" where
  type CFieldType SDL_SystemCursor "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Default cursor. Usually an arrow.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_DEFAULT@, defined at @SDL3\/SDL_mouse.h 99:5@
pattern SDL_SYSTEM_CURSOR_DEFAULT :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_DEFAULT = SDL_SystemCursor 0

-- | Text selection. Usually an I-beam.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_TEXT@, defined at @SDL3\/SDL_mouse.h 100:5@
pattern SDL_SYSTEM_CURSOR_TEXT :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_TEXT = SDL_SystemCursor 1

-- | Wait. Usually an hourglass or watch or spinning ball.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_WAIT@, defined at @SDL3\/SDL_mouse.h 101:5@
pattern SDL_SYSTEM_CURSOR_WAIT :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_WAIT = SDL_SystemCursor 2

-- | Crosshair.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_CROSSHAIR@, defined at @SDL3\/SDL_mouse.h 102:5@
pattern SDL_SYSTEM_CURSOR_CROSSHAIR :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_CROSSHAIR = SDL_SystemCursor 3

-- | Program is busy but still interactive. Usually it\'s WAIT with an arrow.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_PROGRESS@, defined at @SDL3\/SDL_mouse.h 103:5@
pattern SDL_SYSTEM_CURSOR_PROGRESS :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_PROGRESS = SDL_SystemCursor 4

-- | Double arrow pointing northwest and southeast.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_NWSE_RESIZE@, defined at @SDL3\/SDL_mouse.h 104:5@
pattern SDL_SYSTEM_CURSOR_NWSE_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_NWSE_RESIZE = SDL_SystemCursor 5

-- | Double arrow pointing northeast and southwest.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_NESW_RESIZE@, defined at @SDL3\/SDL_mouse.h 105:5@
pattern SDL_SYSTEM_CURSOR_NESW_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_NESW_RESIZE = SDL_SystemCursor 6

-- | Double arrow pointing west and east.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_EW_RESIZE@, defined at @SDL3\/SDL_mouse.h 106:5@
pattern SDL_SYSTEM_CURSOR_EW_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_EW_RESIZE = SDL_SystemCursor 7

-- | Double arrow pointing north and south.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_NS_RESIZE@, defined at @SDL3\/SDL_mouse.h 107:5@
pattern SDL_SYSTEM_CURSOR_NS_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_NS_RESIZE = SDL_SystemCursor 8

-- | Four pointed arrow pointing north, south, east, and west.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_MOVE@, defined at @SDL3\/SDL_mouse.h 108:5@
pattern SDL_SYSTEM_CURSOR_MOVE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_MOVE = SDL_SystemCursor 9

-- | Not permitted. Usually a slashed circle or crossbones.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_NOT_ALLOWED@, defined at @SDL3\/SDL_mouse.h 109:5@
pattern SDL_SYSTEM_CURSOR_NOT_ALLOWED :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_NOT_ALLOWED = SDL_SystemCursor 10

-- | Pointer that indicates a link. Usually a pointing hand.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_POINTER@, defined at @SDL3\/SDL_mouse.h 110:5@
pattern SDL_SYSTEM_CURSOR_POINTER :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_POINTER = SDL_SystemCursor 11

-- | Window resize top-left. This may be a single arrow or a double arrow like NWSE_RESIZE.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_NW_RESIZE@, defined at @SDL3\/SDL_mouse.h 111:5@
pattern SDL_SYSTEM_CURSOR_NW_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_NW_RESIZE = SDL_SystemCursor 12

-- | Window resize top. May be NS_RESIZE.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_N_RESIZE@, defined at @SDL3\/SDL_mouse.h 112:5@
pattern SDL_SYSTEM_CURSOR_N_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_N_RESIZE = SDL_SystemCursor 13

-- | Window resize top-right. May be NESW_RESIZE.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_NE_RESIZE@, defined at @SDL3\/SDL_mouse.h 113:5@
pattern SDL_SYSTEM_CURSOR_NE_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_NE_RESIZE = SDL_SystemCursor 14

-- | Window resize right. May be EW_RESIZE.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_E_RESIZE@, defined at @SDL3\/SDL_mouse.h 114:5@
pattern SDL_SYSTEM_CURSOR_E_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_E_RESIZE = SDL_SystemCursor 15

-- | Window resize bottom-right. May be NWSE_RESIZE.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_SE_RESIZE@, defined at @SDL3\/SDL_mouse.h 115:5@
pattern SDL_SYSTEM_CURSOR_SE_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_SE_RESIZE = SDL_SystemCursor 16

-- | Window resize bottom. May be NS_RESIZE.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_S_RESIZE@, defined at @SDL3\/SDL_mouse.h 116:5@
pattern SDL_SYSTEM_CURSOR_S_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_S_RESIZE = SDL_SystemCursor 17

-- | Window resize bottom-left. May be NESW_RESIZE.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_SW_RESIZE@, defined at @SDL3\/SDL_mouse.h 117:5@
pattern SDL_SYSTEM_CURSOR_SW_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_SW_RESIZE = SDL_SystemCursor 18

-- | Window resize left. May be EW_RESIZE.
--
--     [C declaration]: @SDL_SYSTEM_CURSOR_W_RESIZE@, defined at @SDL3\/SDL_mouse.h 118:5@
pattern SDL_SYSTEM_CURSOR_W_RESIZE :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_W_RESIZE = SDL_SystemCursor 19

-- | [C declaration]: @SDL_SYSTEM_CURSOR_COUNT@, defined at @SDL3\/SDL_mouse.h 119:5@
pattern SDL_SYSTEM_CURSOR_COUNT :: SDL_SystemCursor
pattern SDL_SYSTEM_CURSOR_COUNT = SDL_SystemCursor 20

-- | Scroll direction types for the Scroll event
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_MouseWheelDirection@, defined at @SDL3\/SDL_mouse.h 127:14@
newtype SDL_MouseWheelDirection = SDL_MouseWheelDirection
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_MouseWheelDirection where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_MouseWheelDirection where
  readRaw =
    \ptr0 ->
      pure SDL_MouseWheelDirection
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_MouseWheelDirection where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MouseWheelDirection unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_MouseWheelDirection
  instance
    BG.Storable SDL_MouseWheelDirection

deriving via BG.CUInt instance BG.Prim SDL_MouseWheelDirection

instance CEnum.CEnum SDL_MouseWheelDirection where
  type CEnumZ SDL_MouseWheelDirection = BG.CUInt

  toCEnum = SDL_MouseWheelDirection

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_MOUSEWHEEL_NORMAL")
        , (1, BG.singleton "SDL_MOUSEWHEEL_FLIPPED")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_MouseWheelDirection"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_MouseWheelDirection"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_MouseWheelDirection where
  minDeclaredValue = SDL_MOUSEWHEEL_NORMAL

  maxDeclaredValue = SDL_MOUSEWHEEL_FLIPPED

instance Show SDL_MouseWheelDirection where
  showsPrec = CEnum.shows

instance Read SDL_MouseWheelDirection where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_MouseWheelDirection ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseWheelDirection{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_MouseWheelDirection) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MouseWheelDirection "unwrap" where
  type
    CFieldType SDL_MouseWheelDirection "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The scroll direction is normal
--
--     [C declaration]: @SDL_MOUSEWHEEL_NORMAL@, defined at @SDL3\/SDL_mouse.h 129:5@
pattern SDL_MOUSEWHEEL_NORMAL :: SDL_MouseWheelDirection
pattern SDL_MOUSEWHEEL_NORMAL = SDL_MouseWheelDirection 0

-- | The scroll direction is flipped \/ natural
--
--     [C declaration]: @SDL_MOUSEWHEEL_FLIPPED@, defined at @SDL3\/SDL_mouse.h 130:5@
pattern SDL_MOUSEWHEEL_FLIPPED :: SDL_MouseWheelDirection
pattern SDL_MOUSEWHEEL_FLIPPED = SDL_MouseWheelDirection 1

-- | Animated cursor frame info.
--
--     @since 3.4.0
--
--     [C declaration]: @struct SDL_CursorFrameInfo@, defined at @SDL3\/SDL_mouse.h 138:16@
data SDL_CursorFrameInfo = SDL_CursorFrameInfo
  { surface :: BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface
  -- ^ The surface data for this frame
  --
  --          [C declaration]: @surface@, defined at @SDL3\/SDL_mouse.h 140:18@
  , duration :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ The frame duration in milliseconds (a duration of 0 is infinite)
  --
  --          [C declaration]: @duration@, defined at @SDL3\/SDL_mouse.h 141:12@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_CursorFrameInfo where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_CursorFrameInfo where
  readRaw =
    \ptr0 ->
      pure SDL_CursorFrameInfo
        <*> HasCField.readRaw (BG.Proxy @"surface") ptr0
        <*> HasCField.readRaw (BG.Proxy @"duration") ptr0

instance Marshal.WriteRaw SDL_CursorFrameInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_CursorFrameInfo surface2 duration3 ->
            HasCField.writeRaw (BG.Proxy @"surface") ptr0 surface2
              >> HasCField.writeRaw (BG.Proxy @"duration") ptr0 duration3

deriving via Marshal.EquivStorable SDL_CursorFrameInfo instance BG.Storable SDL_CursorFrameInfo

instance
  (ty ~ BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
  => BG.CompatHasField.HasField "surface" SDL_CursorFrameInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CursorFrameInfo{surface = y1, duration = BG.getField @"duration" x0}
      , BG.getField @"surface" x0
      )

instance
  (ty ~ BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface)
  => BG.HasField "surface" (BG.Ptr SDL_CursorFrameInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"surface")

instance HasCField.HasCField SDL_CursorFrameInfo "surface" where
  type
    CFieldType SDL_CursorFrameInfo "surface" =
      BG.Ptr SDL3.Sys.Bindgen.Surface.SDL_Surface

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "duration" SDL_CursorFrameInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CursorFrameInfo{duration = y1, surface = BG.getField @"surface" x0}
      , BG.getField @"duration" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "duration" (BG.Ptr SDL_CursorFrameInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"duration")

instance HasCField.HasCField SDL_CursorFrameInfo "duration" where
  type
    CFieldType SDL_CursorFrameInfo "duration" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 8

-- | A bitmask of pressed mouse buttons, as reported by SDL_GetMouseState, etc.
--
--     * Button 1: Left mouse button
--
--     * Button 2: Middle mouse button
--
--     * Button 3: Right mouse button
--
--     * Button 4: Side mouse button 1
--
--     * Button 5: Side mouse button 2
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetMouseState', 'sDL_GetGlobalMouseState', 'sDL_GetRelativeMouseState'
--
--     [C declaration]: @SDL_MouseButtonFlags@, defined at @SDL3\/SDL_mouse.h 159:16@
newtype SDL_MouseButtonFlags = SDL_MouseButtonFlags
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
  => BG.CompatHasField.HasField "unwrap" SDL_MouseButtonFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseButtonFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_MouseButtonFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MouseButtonFlags "unwrap" where
  type
    CFieldType SDL_MouseButtonFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @macro SDL_BUTTON_LEFT@, defined at @SDL3\/SDL_mouse.h 161:9@
sDL_BUTTON_LEFT :: BG.CInt
sDL_BUTTON_LEFT = (1 :: BG.CInt)

-- | [C declaration]: @macro SDL_BUTTON_MIDDLE@, defined at @SDL3\/SDL_mouse.h 162:9@
sDL_BUTTON_MIDDLE :: BG.CInt
sDL_BUTTON_MIDDLE = (2 :: BG.CInt)

-- | [C declaration]: @macro SDL_BUTTON_RIGHT@, defined at @SDL3\/SDL_mouse.h 163:9@
sDL_BUTTON_RIGHT :: BG.CInt
sDL_BUTTON_RIGHT = (3 :: BG.CInt)

-- | [C declaration]: @macro SDL_BUTTON_X1@, defined at @SDL3\/SDL_mouse.h 164:9@
sDL_BUTTON_X1 :: BG.CInt
sDL_BUTTON_X1 = (4 :: BG.CInt)

-- | [C declaration]: @macro SDL_BUTTON_X2@, defined at @SDL3\/SDL_mouse.h 165:9@
sDL_BUTTON_X2 :: BG.CInt
sDL_BUTTON_X2 = (5 :: BG.CInt)

-- | [C declaration]: @macro SDL_BUTTON_MASK@, defined at @SDL3\/SDL_mouse.h 167:9@
sDL_BUTTON_MASK
  :: forall a0
   . (C.Expr.HostPlatform.Sub a0 BG.CInt)
  => (C.Expr.HostPlatform.Shift BG.CUInt (C.Expr.HostPlatform.SubRes a0 BG.CInt))
  => a0 -> BG.CUInt
sDL_BUTTON_MASK =
  \x0 ->
    (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) ((C.Expr.HostPlatform.-) x0 (1 :: BG.CInt))

-- | [C declaration]: @macro SDL_BUTTON_LMASK@, defined at @SDL3\/SDL_mouse.h 168:9@
sDL_BUTTON_LMASK :: BG.CUInt
sDL_BUTTON_LMASK = sDL_BUTTON_MASK sDL_BUTTON_LEFT

-- | [C declaration]: @macro SDL_BUTTON_MMASK@, defined at @SDL3\/SDL_mouse.h 169:9@
sDL_BUTTON_MMASK :: BG.CUInt
sDL_BUTTON_MMASK = sDL_BUTTON_MASK sDL_BUTTON_MIDDLE

-- | [C declaration]: @macro SDL_BUTTON_RMASK@, defined at @SDL3\/SDL_mouse.h 170:9@
sDL_BUTTON_RMASK :: BG.CUInt
sDL_BUTTON_RMASK = sDL_BUTTON_MASK sDL_BUTTON_RIGHT

-- | [C declaration]: @macro SDL_BUTTON_X1MASK@, defined at @SDL3\/SDL_mouse.h 171:9@
sDL_BUTTON_X1MASK :: BG.CUInt
sDL_BUTTON_X1MASK = sDL_BUTTON_MASK sDL_BUTTON_X1

-- | [C declaration]: @macro SDL_BUTTON_X2MASK@, defined at @SDL3\/SDL_mouse.h 172:9@
sDL_BUTTON_X2MASK :: BG.CUInt
sDL_BUTTON_X2MASK = sDL_BUTTON_MASK sDL_BUTTON_X2

-- | Auxiliary type used by 'SDL_MouseMotionTransformCallback'
--
--     [C declaration]: @SDL_MouseMotionTransformCallback@, defined at @SDL3\/SDL_mouse.h 205:24@
newtype SDL_MouseMotionTransformCallback_Aux = SDL_MouseMotionTransformCallback_Aux
  { unwrap
      :: BG.Ptr BG.Void
      -> SDL3.Sys.Bindgen.Stdinc.Uint64
      -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
      -> SDL_MouseID
      -> BG.Ptr BG.CFloat
      -> BG.Ptr BG.CFloat
      -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_MouseMotionTransformCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_3e4a2d15fbbe81d6_base
    :: ( BG.Ptr BG.Void
         -> BG.Word64
         -> BG.Ptr BG.Void
         -> BG.Word32
         -> BG.Ptr BG.Void
         -> BG.Ptr BG.Void
         -> IO ()
       )
    -> IO
         ( BG.FunPtr
             ( BG.Ptr BG.Void
               -> BG.Word64
               -> BG.Ptr BG.Void
               -> BG.Word32
               -> BG.Ptr BG.Void
               -> BG.Ptr BG.Void
               -> IO ()
             )
         )

-- __unique:__ @toSDL_MouseMotionTransformCallback_Aux@
hs_bindgen_3e4a2d15fbbe81d6
  :: SDL_MouseMotionTransformCallback_Aux
  -> IO (BG.FunPtr SDL_MouseMotionTransformCallback_Aux)
hs_bindgen_3e4a2d15fbbe81d6 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_3e4a2d15fbbe81d6_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_MouseMotionTransformCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_97a29d76d0ffd06f_base
    :: BG.FunPtr
         ( BG.Ptr BG.Void
           -> BG.Word64
           -> BG.Ptr BG.Void
           -> BG.Word32
           -> BG.Ptr BG.Void
           -> BG.Ptr BG.Void
           -> IO ()
         )
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_MouseMotionTransformCallback_Aux@
hs_bindgen_97a29d76d0ffd06f
  :: BG.FunPtr SDL_MouseMotionTransformCallback_Aux
  -> SDL_MouseMotionTransformCallback_Aux
hs_bindgen_97a29d76d0ffd06f =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_97a29d76d0ffd06f_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_MouseMotionTransformCallback_Aux where
  toFunPtr = hs_bindgen_3e4a2d15fbbe81d6

instance BG.FromFunPtr SDL_MouseMotionTransformCallback_Aux where
  fromFunPtr = hs_bindgen_97a29d76d0ffd06f

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> SDL3.Sys.Bindgen.Stdinc.Uint64
          -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
          -> SDL_MouseID
          -> BG.Ptr BG.CFloat
          -> BG.Ptr BG.CFloat
          -> IO ()
        )
  )
  => BG.CompatHasField.HasField "unwrap" SDL_MouseMotionTransformCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionTransformCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> SDL3.Sys.Bindgen.Stdinc.Uint64
          -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
          -> SDL_MouseID
          -> BG.Ptr BG.CFloat
          -> BG.Ptr BG.CFloat
          -> IO ()
        )
  )
  => BG.HasField "unwrap" (BG.Ptr SDL_MouseMotionTransformCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MouseMotionTransformCallback_Aux "unwrap" where
  type
    CFieldType SDL_MouseMotionTransformCallback_Aux "unwrap" =
      BG.Ptr BG.Void
      -> SDL3.Sys.Bindgen.Stdinc.Uint64
      -> BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
      -> SDL_MouseID
      -> BG.Ptr BG.CFloat
      -> BG.Ptr BG.CFloat
      -> IO ()

  offset# = \_ -> \_ -> 0

-- | A callback used to transform mouse motion delta from raw values.
--
--     This is called during SDL\'s handling of platform mouse events to scale the values of the resulting motion delta.
--
--     [@userdata@]: what was passed as @userdata@ to @SDL_SetRelativeMouseTransform()@.
--
--     [@timestamp@]: the associated time at which this mouse motion event was received.
--
--     [@window@]: the associated window to which this mouse motion event was addressed.
--
--     [@mouseID@]: the associated mouse from which this mouse motion event was emitted.
--
--     [@x@]: pointer to a variable that will be treated as the resulting x-axis motion.
--
--     [@y@]: pointer to a variable that will be treated as the resulting y-axis motion.
--
--     [Thread safety]: This callback is called by SDL\'s internal mouse input processing procedure, which may be a thread separate from the main event loop that is run at realtime priority. Stalling this thread with too much work in the callback can therefore potentially freeze the entire system. Care should be taken with proper synchronization practices when adding other side effects beyond mutation of the x and y values.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_SetRelativeMouseTransform'
--
--     [C declaration]: @SDL_MouseMotionTransformCallback@, defined at @SDL3\/SDL_mouse.h 205:24@
newtype SDL_MouseMotionTransformCallback = SDL_MouseMotionTransformCallback
  { unwrap :: BG.FunPtr SDL_MouseMotionTransformCallback_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_MouseMotionTransformCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_MouseMotionTransformCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MouseMotionTransformCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_MouseMotionTransformCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_MouseMotionTransformCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MouseMotionTransformCallback "unwrap" where
  type
    CFieldType SDL_MouseMotionTransformCallback "unwrap" =
      BG.FunPtr SDL_MouseMotionTransformCallback_Aux

  offset# = \_ -> \_ -> 0
