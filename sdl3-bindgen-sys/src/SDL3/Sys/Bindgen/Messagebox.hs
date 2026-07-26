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

-- | SDL offers a simple message box API, which is useful for simple alerts, such as informing the user when something fatal happens at startup without the need to build a UI for it (or informing the user /before/ your UI is ready).
--
--     These message boxes are native system dialogs where possible.
--
--     There is both a customizable function (@SDL_ShowMessageBox()@) that offers lots of options for what to display and reports on what choice the user made, and also a much-simplified version (@SDL_ShowSimpleMessageBox()@), merely takes a text message and title, and waits until the user presses a single \"OK\" UI button. Often, this is all that is necessary. Message box flags.
--
--     If supported will display warning icon, etc.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Messagebox (
  SDL3.Sys.Bindgen.Messagebox.SDL_MessageBoxFlags (..),
  SDL3.Sys.Bindgen.Messagebox.sDL_MESSAGEBOX_ERROR,
  SDL3.Sys.Bindgen.Messagebox.sDL_MESSAGEBOX_WARNING,
  SDL3.Sys.Bindgen.Messagebox.sDL_MESSAGEBOX_INFORMATION,
  SDL3.Sys.Bindgen.Messagebox.sDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT,
  SDL3.Sys.Bindgen.Messagebox.sDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT,
  SDL3.Sys.Bindgen.Messagebox.SDL_MessageBoxButtonFlags (..),
  SDL3.Sys.Bindgen.Messagebox.sDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT,
  SDL3.Sys.Bindgen.Messagebox.sDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT,
  SDL3.Sys.Bindgen.Messagebox.SDL_MessageBoxButtonData (..),
  SDL3.Sys.Bindgen.Messagebox.SDL_MessageBoxColor (..),
  SDL3.Sys.Bindgen.Messagebox.SDL_MessageBoxColorType (..),
  pattern SDL3.Sys.Bindgen.Messagebox.SDL_MESSAGEBOX_COLOR_BACKGROUND,
  pattern SDL3.Sys.Bindgen.Messagebox.SDL_MESSAGEBOX_COLOR_TEXT,
  pattern SDL3.Sys.Bindgen.Messagebox.SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
  pattern SDL3.Sys.Bindgen.Messagebox.SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
  pattern SDL3.Sys.Bindgen.Messagebox.SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
  pattern SDL3.Sys.Bindgen.Messagebox.SDL_MESSAGEBOX_COLOR_COUNT,
  SDL3.Sys.Bindgen.Messagebox.SDL_MessageBoxColorScheme (..),
  SDL3.Sys.Bindgen.Messagebox.SDL_MessageBoxData (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.ConstantArray qualified as CA
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Video qualified

-- | [C declaration]: @SDL_MessageBoxFlags@, defined at @SDL3\/SDL_messagebox.h 59:16@
newtype SDL_MessageBoxFlags = SDL_MessageBoxFlags
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
  => BG.CompatHasField.HasField "unwrap" SDL_MessageBoxFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_MessageBoxFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MessageBoxFlags "unwrap" where
  type
    CFieldType SDL_MessageBoxFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | error dialog
--
--     [C declaration]: @macro SDL_MESSAGEBOX_ERROR@, defined at @SDL3\/SDL_messagebox.h 61:9@
sDL_MESSAGEBOX_ERROR :: BG.CUInt
sDL_MESSAGEBOX_ERROR = (16 :: BG.CUInt)

-- | warning dialog
--
--     [C declaration]: @macro SDL_MESSAGEBOX_WARNING@, defined at @SDL3\/SDL_messagebox.h 62:9@
sDL_MESSAGEBOX_WARNING :: BG.CUInt
sDL_MESSAGEBOX_WARNING = (32 :: BG.CUInt)

-- | informational dialog
--
--     [C declaration]: @macro SDL_MESSAGEBOX_INFORMATION@, defined at @SDL3\/SDL_messagebox.h 63:9@
sDL_MESSAGEBOX_INFORMATION :: BG.CUInt
sDL_MESSAGEBOX_INFORMATION = (64 :: BG.CUInt)

-- | buttons placed left to right
--
--     [C declaration]: @macro SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT@, defined at @SDL3\/SDL_messagebox.h 64:9@
sDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT :: BG.CUInt
sDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT =
  (128 :: BG.CUInt)

-- | buttons placed right to left
--
--     [C declaration]: @macro SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT@, defined at @SDL3\/SDL_messagebox.h 65:9@
sDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT :: BG.CUInt
sDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT =
  (256 :: BG.CUInt)

-- | 'SDL_MessageBoxButtonData' flags.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_MessageBoxButtonFlags@, defined at @SDL3\/SDL_messagebox.h 72:16@
newtype SDL_MessageBoxButtonFlags = SDL_MessageBoxButtonFlags
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
  => BG.CompatHasField.HasField "unwrap" SDL_MessageBoxButtonFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxButtonFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_MessageBoxButtonFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MessageBoxButtonFlags "unwrap" where
  type
    CFieldType SDL_MessageBoxButtonFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Marks the default button when return is hit
--
--     [C declaration]: @macro SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT@, defined at @SDL3\/SDL_messagebox.h 74:9@
sDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT :: BG.CUInt
sDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT =
  (1 :: BG.CUInt)

-- | Marks the default button when escape is hit
--
--     [C declaration]: @macro SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT@, defined at @SDL3\/SDL_messagebox.h 75:9@
sDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT :: BG.CUInt
sDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT =
  (2 :: BG.CUInt)

-- | Individual button data.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_MessageBoxButtonData@, defined at @SDL3\/SDL_messagebox.h 82:16@
data SDL_MessageBoxButtonData = SDL_MessageBoxButtonData
  { flags :: SDL_MessageBoxButtonFlags
  -- ^ [C declaration]: @flags@, defined at @SDL3\/SDL_messagebox.h 84:31@
  , buttonID :: BG.CInt
  -- ^ User defined button id (value returned via SDL_ShowMessageBox)
  --
  --          [C declaration]: @buttonID@, defined at @SDL3\/SDL_messagebox.h 85:9@
  , text :: PtrConst.PtrConst BG.CChar
  -- ^ The UTF-8 button text
  --
  --          [C declaration]: @text@, defined at @SDL3\/SDL_messagebox.h 86:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_MessageBoxButtonData where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_MessageBoxButtonData where
  readRaw =
    \ptr0 ->
      pure SDL_MessageBoxButtonData
        <*> HasCField.readRaw (BG.Proxy @"flags") ptr0
        <*> HasCField.readRaw (BG.Proxy @"buttonID") ptr0
        <*> HasCField.readRaw (BG.Proxy @"text") ptr0

instance Marshal.WriteRaw SDL_MessageBoxButtonData where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MessageBoxButtonData flags2 buttonID3 text4 ->
            HasCField.writeRaw (BG.Proxy @"flags") ptr0 flags2
              >> HasCField.writeRaw (BG.Proxy @"buttonID") ptr0 buttonID3
              >> HasCField.writeRaw (BG.Proxy @"text") ptr0 text4

deriving via
  Marshal.EquivStorable SDL_MessageBoxButtonData
  instance
    BG.Storable SDL_MessageBoxButtonData

instance
  (ty ~ SDL_MessageBoxButtonFlags)
  => BG.CompatHasField.HasField "flags" SDL_MessageBoxButtonData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxButtonData
            { flags = y1
            , buttonID = BG.getField @"buttonID" x0
            , text = BG.getField @"text" x0
            }
      , BG.getField @"flags" x0
      )

instance
  (ty ~ SDL_MessageBoxButtonFlags)
  => BG.HasField "flags" (BG.Ptr SDL_MessageBoxButtonData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"flags")

instance HasCField.HasCField SDL_MessageBoxButtonData "flags" where
  type
    CFieldType SDL_MessageBoxButtonData "flags" =
      SDL_MessageBoxButtonFlags

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "buttonID" SDL_MessageBoxButtonData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxButtonData
            { buttonID = y1
            , flags = BG.getField @"flags" x0
            , text = BG.getField @"text" x0
            }
      , BG.getField @"buttonID" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "buttonID" (BG.Ptr SDL_MessageBoxButtonData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"buttonID")

instance HasCField.HasCField SDL_MessageBoxButtonData "buttonID" where
  type
    CFieldType SDL_MessageBoxButtonData "buttonID" =
      BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "text" SDL_MessageBoxButtonData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxButtonData
            { text = y1
            , flags = BG.getField @"flags" x0
            , buttonID = BG.getField @"buttonID" x0
            }
      , BG.getField @"text" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "text" (BG.Ptr SDL_MessageBoxButtonData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"text")

instance HasCField.HasCField SDL_MessageBoxButtonData "text" where
  type
    CFieldType SDL_MessageBoxButtonData "text" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 8

-- | RGB value used in a message box color scheme
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_MessageBoxColor@, defined at @SDL3\/SDL_messagebox.h 94:16@
data SDL_MessageBoxColor = SDL_MessageBoxColor
  { r :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @r@, defined at @SDL3\/SDL_messagebox.h 96:11@
  , g :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @g@, defined at @SDL3\/SDL_messagebox.h 96:14@
  , b :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @b@, defined at @SDL3\/SDL_messagebox.h 96:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_MessageBoxColor where
  staticSizeOf = \_ -> (3 :: Int)

  staticAlignment = \_ -> (1 :: Int)

instance Marshal.ReadRaw SDL_MessageBoxColor where
  readRaw =
    \ptr0 ->
      pure SDL_MessageBoxColor
        <*> HasCField.readRaw (BG.Proxy @"r") ptr0
        <*> HasCField.readRaw (BG.Proxy @"g") ptr0
        <*> HasCField.readRaw (BG.Proxy @"b") ptr0

instance Marshal.WriteRaw SDL_MessageBoxColor where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MessageBoxColor r2 g3 b4 ->
            HasCField.writeRaw (BG.Proxy @"r") ptr0 r2
              >> HasCField.writeRaw (BG.Proxy @"g") ptr0 g3
              >> HasCField.writeRaw (BG.Proxy @"b") ptr0 b4

deriving via Marshal.EquivStorable SDL_MessageBoxColor instance BG.Storable SDL_MessageBoxColor

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "r" SDL_MessageBoxColor ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxColor{r = y1, g = BG.getField @"g" x0, b = BG.getField @"b" x0}
      , BG.getField @"r" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "r" (BG.Ptr SDL_MessageBoxColor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"r")

instance HasCField.HasCField SDL_MessageBoxColor "r" where
  type
    CFieldType SDL_MessageBoxColor "r" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "g" SDL_MessageBoxColor ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxColor{g = y1, r = BG.getField @"r" x0, b = BG.getField @"b" x0}
      , BG.getField @"g" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "g" (BG.Ptr SDL_MessageBoxColor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"g")

instance HasCField.HasCField SDL_MessageBoxColor "g" where
  type
    CFieldType SDL_MessageBoxColor "g" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 1

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "b" SDL_MessageBoxColor ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxColor{b = y1, r = BG.getField @"r" x0, g = BG.getField @"g" x0}
      , BG.getField @"b" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "b" (BG.Ptr SDL_MessageBoxColor) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"b")

instance HasCField.HasCField SDL_MessageBoxColor "b" where
  type
    CFieldType SDL_MessageBoxColor "b" =
      SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 2

-- | An enumeration of indices inside the colors array of 'SDL_MessageBoxColorScheme'.
--
--     [C declaration]: @enum SDL_MessageBoxColorType@, defined at @SDL3\/SDL_messagebox.h 103:14@
newtype SDL_MessageBoxColorType = SDL_MessageBoxColorType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_MessageBoxColorType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_MessageBoxColorType where
  readRaw =
    \ptr0 ->
      pure SDL_MessageBoxColorType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_MessageBoxColorType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MessageBoxColorType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via
  Marshal.EquivStorable SDL_MessageBoxColorType
  instance
    BG.Storable SDL_MessageBoxColorType

deriving via BG.CUInt instance BG.Prim SDL_MessageBoxColorType

instance CEnum.CEnum SDL_MessageBoxColorType where
  type CEnumZ SDL_MessageBoxColorType = BG.CUInt

  toCEnum = SDL_MessageBoxColorType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_MESSAGEBOX_COLOR_BACKGROUND")
        , (1, BG.singleton "SDL_MESSAGEBOX_COLOR_TEXT")
        , (2, BG.singleton "SDL_MESSAGEBOX_COLOR_BUTTON_BORDER")
        , (3, BG.singleton "SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND")
        , (4, BG.singleton "SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED")
        , (5, BG.singleton "SDL_MESSAGEBOX_COLOR_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_MessageBoxColorType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_MessageBoxColorType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_MessageBoxColorType where
  minDeclaredValue = SDL_MESSAGEBOX_COLOR_BACKGROUND

  maxDeclaredValue = SDL_MESSAGEBOX_COLOR_COUNT

instance Show SDL_MessageBoxColorType where
  showsPrec = CEnum.shows

instance Read SDL_MessageBoxColorType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_MessageBoxColorType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxColorType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_MessageBoxColorType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MessageBoxColorType "unwrap" where
  type
    CFieldType SDL_MessageBoxColorType "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_MESSAGEBOX_COLOR_BACKGROUND@, defined at @SDL3\/SDL_messagebox.h 105:5@
pattern SDL_MESSAGEBOX_COLOR_BACKGROUND :: SDL_MessageBoxColorType
pattern SDL_MESSAGEBOX_COLOR_BACKGROUND = SDL_MessageBoxColorType 0

-- | [C declaration]: @SDL_MESSAGEBOX_COLOR_TEXT@, defined at @SDL3\/SDL_messagebox.h 106:5@
pattern SDL_MESSAGEBOX_COLOR_TEXT :: SDL_MessageBoxColorType
pattern SDL_MESSAGEBOX_COLOR_TEXT = SDL_MessageBoxColorType 1

-- | [C declaration]: @SDL_MESSAGEBOX_COLOR_BUTTON_BORDER@, defined at @SDL3\/SDL_messagebox.h 107:5@
pattern SDL_MESSAGEBOX_COLOR_BUTTON_BORDER :: SDL_MessageBoxColorType
pattern SDL_MESSAGEBOX_COLOR_BUTTON_BORDER = SDL_MessageBoxColorType 2

-- | [C declaration]: @SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND@, defined at @SDL3\/SDL_messagebox.h 108:5@
pattern SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND :: SDL_MessageBoxColorType
pattern SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND = SDL_MessageBoxColorType 3

-- | [C declaration]: @SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED@, defined at @SDL3\/SDL_messagebox.h 109:5@
pattern SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED :: SDL_MessageBoxColorType
pattern SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED = SDL_MessageBoxColorType 4

-- | Size of the colors array of 'SDL_MessageBoxColorScheme'.
--
--     [C declaration]: @SDL_MESSAGEBOX_COLOR_COUNT@, defined at @SDL3\/SDL_messagebox.h 110:5@
pattern SDL_MESSAGEBOX_COLOR_COUNT :: SDL_MessageBoxColorType
pattern SDL_MESSAGEBOX_COLOR_COUNT = SDL_MessageBoxColorType 5

-- | A set of colors to use for message box dialogs
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_MessageBoxColorScheme@, defined at @SDL3\/SDL_messagebox.h 118:16@
data SDL_MessageBoxColorScheme = SDL_MessageBoxColorScheme
  { colors :: CA.ConstantArray 5 SDL_MessageBoxColor
  -- ^ [C declaration]: @colors@, defined at @SDL3\/SDL_messagebox.h 120:25@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_MessageBoxColorScheme where
  staticSizeOf = \_ -> (15 :: Int)

  staticAlignment = \_ -> (1 :: Int)

instance Marshal.ReadRaw SDL_MessageBoxColorScheme where
  readRaw =
    \ptr0 ->
      pure SDL_MessageBoxColorScheme
        <*> HasCField.readRaw (BG.Proxy @"colors") ptr0

instance Marshal.WriteRaw SDL_MessageBoxColorScheme where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MessageBoxColorScheme colors2 ->
            HasCField.writeRaw (BG.Proxy @"colors") ptr0 colors2

deriving via
  Marshal.EquivStorable SDL_MessageBoxColorScheme
  instance
    BG.Storable SDL_MessageBoxColorScheme

instance
  (ty ~ CA.ConstantArray 5 SDL_MessageBoxColor)
  => BG.CompatHasField.HasField "colors" SDL_MessageBoxColorScheme ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxColorScheme{colors = y1}
      , BG.getField @"colors" x0
      )

instance
  (ty ~ CA.ConstantArray 5 SDL_MessageBoxColor)
  => BG.HasField "colors" (BG.Ptr SDL_MessageBoxColorScheme) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"colors")

instance HasCField.HasCField SDL_MessageBoxColorScheme "colors" where
  type
    CFieldType SDL_MessageBoxColorScheme "colors" =
      CA.ConstantArray 5 SDL_MessageBoxColor

  offset# = \_ -> \_ -> 0

-- | MessageBox structure containing title, text, window, etc.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_MessageBoxData@, defined at @SDL3\/SDL_messagebox.h 128:16@
data SDL_MessageBoxData = SDL_MessageBoxData
  { flags :: SDL_MessageBoxFlags
  -- ^ [C declaration]: @flags@, defined at @SDL3\/SDL_messagebox.h 130:25@
  , window :: BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window
  -- ^ Parent window, can be NULL
  --
  --          [C declaration]: @window@, defined at @SDL3\/SDL_messagebox.h 131:17@
  , title :: PtrConst.PtrConst BG.CChar
  -- ^ UTF-8 title
  --
  --          [C declaration]: @title@, defined at @SDL3\/SDL_messagebox.h 132:17@
  , message :: PtrConst.PtrConst BG.CChar
  -- ^ UTF-8 message text
  --
  --          [C declaration]: @message@, defined at @SDL3\/SDL_messagebox.h 133:17@
  , numbuttons :: BG.CInt
  -- ^ [C declaration]: @numbuttons@, defined at @SDL3\/SDL_messagebox.h 135:9@
  , buttons :: PtrConst.PtrConst SDL_MessageBoxButtonData
  -- ^ [C declaration]: @buttons@, defined at @SDL3\/SDL_messagebox.h 136:37@
  , colorScheme :: PtrConst.PtrConst SDL_MessageBoxColorScheme
  -- ^ 'SDL_MessageBoxColorScheme', can be NULL to use system settings
  --
  --          [C declaration]: @colorScheme@, defined at @SDL3\/SDL_messagebox.h 138:38@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_MessageBoxData where
  staticSizeOf = \_ -> (56 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_MessageBoxData where
  readRaw =
    \ptr0 ->
      pure SDL_MessageBoxData
        <*> HasCField.readRaw (BG.Proxy @"flags") ptr0
        <*> HasCField.readRaw (BG.Proxy @"window") ptr0
        <*> HasCField.readRaw (BG.Proxy @"title") ptr0
        <*> HasCField.readRaw (BG.Proxy @"message") ptr0
        <*> HasCField.readRaw (BG.Proxy @"numbuttons") ptr0
        <*> HasCField.readRaw (BG.Proxy @"buttons") ptr0
        <*> HasCField.readRaw (BG.Proxy @"colorScheme") ptr0

instance Marshal.WriteRaw SDL_MessageBoxData where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_MessageBoxData
            flags2
            window3
            title4
            message5
            numbuttons6
            buttons7
            colorScheme8 ->
              HasCField.writeRaw (BG.Proxy @"flags") ptr0 flags2
                >> HasCField.writeRaw (BG.Proxy @"window") ptr0 window3
                >> HasCField.writeRaw (BG.Proxy @"title") ptr0 title4
                >> HasCField.writeRaw (BG.Proxy @"message") ptr0 message5
                >> HasCField.writeRaw (BG.Proxy @"numbuttons") ptr0 numbuttons6
                >> HasCField.writeRaw (BG.Proxy @"buttons") ptr0 buttons7
                >> HasCField.writeRaw (BG.Proxy @"colorScheme") ptr0 colorScheme8

deriving via Marshal.EquivStorable SDL_MessageBoxData instance BG.Storable SDL_MessageBoxData

instance
  (ty ~ SDL_MessageBoxFlags)
  => BG.CompatHasField.HasField "flags" SDL_MessageBoxData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxData
            { flags = y1
            , window = BG.getField @"window" x0
            , title = BG.getField @"title" x0
            , message = BG.getField @"message" x0
            , numbuttons = BG.getField @"numbuttons" x0
            , buttons = BG.getField @"buttons" x0
            , colorScheme = BG.getField @"colorScheme" x0
            }
      , BG.getField @"flags" x0
      )

instance
  (ty ~ SDL_MessageBoxFlags)
  => BG.HasField "flags" (BG.Ptr SDL_MessageBoxData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"flags")

instance HasCField.HasCField SDL_MessageBoxData "flags" where
  type
    CFieldType SDL_MessageBoxData "flags" =
      SDL_MessageBoxFlags

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
  => BG.CompatHasField.HasField "window" SDL_MessageBoxData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxData
            { window = y1
            , flags = BG.getField @"flags" x0
            , title = BG.getField @"title" x0
            , message = BG.getField @"message" x0
            , numbuttons = BG.getField @"numbuttons" x0
            , buttons = BG.getField @"buttons" x0
            , colorScheme = BG.getField @"colorScheme" x0
            }
      , BG.getField @"window" x0
      )

instance
  (ty ~ BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window)
  => BG.HasField "window" (BG.Ptr SDL_MessageBoxData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"window")

instance HasCField.HasCField SDL_MessageBoxData "window" where
  type
    CFieldType SDL_MessageBoxData "window" =
      BG.Ptr SDL3.Sys.Bindgen.Video.SDL_Window

  offset# = \_ -> \_ -> 8

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "title" SDL_MessageBoxData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxData
            { title = y1
            , flags = BG.getField @"flags" x0
            , window = BG.getField @"window" x0
            , message = BG.getField @"message" x0
            , numbuttons = BG.getField @"numbuttons" x0
            , buttons = BG.getField @"buttons" x0
            , colorScheme = BG.getField @"colorScheme" x0
            }
      , BG.getField @"title" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "title" (BG.Ptr SDL_MessageBoxData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"title")

instance HasCField.HasCField SDL_MessageBoxData "title" where
  type
    CFieldType SDL_MessageBoxData "title" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 16

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "message" SDL_MessageBoxData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxData
            { message = y1
            , flags = BG.getField @"flags" x0
            , window = BG.getField @"window" x0
            , title = BG.getField @"title" x0
            , numbuttons = BG.getField @"numbuttons" x0
            , buttons = BG.getField @"buttons" x0
            , colorScheme = BG.getField @"colorScheme" x0
            }
      , BG.getField @"message" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "message" (BG.Ptr SDL_MessageBoxData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"message")

instance HasCField.HasCField SDL_MessageBoxData "message" where
  type
    CFieldType SDL_MessageBoxData "message" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "numbuttons" SDL_MessageBoxData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxData
            { numbuttons = y1
            , flags = BG.getField @"flags" x0
            , window = BG.getField @"window" x0
            , title = BG.getField @"title" x0
            , message = BG.getField @"message" x0
            , buttons = BG.getField @"buttons" x0
            , colorScheme = BG.getField @"colorScheme" x0
            }
      , BG.getField @"numbuttons" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "numbuttons" (BG.Ptr SDL_MessageBoxData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"numbuttons")

instance HasCField.HasCField SDL_MessageBoxData "numbuttons" where
  type
    CFieldType SDL_MessageBoxData "numbuttons" =
      BG.CInt

  offset# = \_ -> \_ -> 32

instance
  (ty ~ PtrConst.PtrConst SDL_MessageBoxButtonData)
  => BG.CompatHasField.HasField "buttons" SDL_MessageBoxData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxData
            { buttons = y1
            , flags = BG.getField @"flags" x0
            , window = BG.getField @"window" x0
            , title = BG.getField @"title" x0
            , message = BG.getField @"message" x0
            , numbuttons = BG.getField @"numbuttons" x0
            , colorScheme = BG.getField @"colorScheme" x0
            }
      , BG.getField @"buttons" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL_MessageBoxButtonData)
  => BG.HasField "buttons" (BG.Ptr SDL_MessageBoxData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"buttons")

instance HasCField.HasCField SDL_MessageBoxData "buttons" where
  type
    CFieldType SDL_MessageBoxData "buttons" =
      PtrConst.PtrConst SDL_MessageBoxButtonData

  offset# = \_ -> \_ -> 40

instance
  (ty ~ PtrConst.PtrConst SDL_MessageBoxColorScheme)
  => BG.CompatHasField.HasField "colorScheme" SDL_MessageBoxData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MessageBoxData
            { colorScheme = y1
            , flags = BG.getField @"flags" x0
            , window = BG.getField @"window" x0
            , title = BG.getField @"title" x0
            , message = BG.getField @"message" x0
            , numbuttons = BG.getField @"numbuttons" x0
            , buttons = BG.getField @"buttons" x0
            }
      , BG.getField @"colorScheme" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL_MessageBoxColorScheme)
  => BG.HasField "colorScheme" (BG.Ptr SDL_MessageBoxData) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"colorScheme")

instance HasCField.HasCField SDL_MessageBoxData "colorScheme" where
  type
    CFieldType SDL_MessageBoxData "colorScheme" =
      PtrConst.PtrConst SDL_MessageBoxColorScheme

  offset# = \_ -> \_ -> 48
