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

-- | SDL keyboard management.
--
--     Please refer to the Best Keyboard Practices document for details on how best to accept keyboard input in various types of programs:
--
--     [https:\/\/wiki.libsdl.org\/SDL3\/BestKeyboardPractices](https://wiki.libsdl.org/SDL3/BestKeyboardPractices) This is a unique ID for a keyboard for the time it is connected to the system, and is never reused for the lifetime of the application.
--
--     If the keyboard is disconnected and reconnected, it will get a new ID.
--
--     The value 0 is an invalid ID.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Keyboard (
  SDL3.Sys.Bindgen.Keyboard.SDL_KeyboardID (..),
  SDL3.Sys.Bindgen.Keyboard.SDL_TextInputType (..),
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_TEXTINPUT_TYPE_TEXT,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_TEXTINPUT_TYPE_TEXT_NAME,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_TEXTINPUT_TYPE_TEXT_EMAIL,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_TEXTINPUT_TYPE_TEXT_USERNAME,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_TEXTINPUT_TYPE_NUMBER,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE,
  SDL3.Sys.Bindgen.Keyboard.SDL_Capitalization (..),
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_CAPITALIZE_NONE,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_CAPITALIZE_SENTENCES,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_CAPITALIZE_WORDS,
  pattern SDL3.Sys.Bindgen.Keyboard.SDL_CAPITALIZE_LETTERS,
  SDL3.Sys.Bindgen.Keyboard.sDL_PROP_TEXTINPUT_TYPE_NUMBER,
  SDL3.Sys.Bindgen.Keyboard.sDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER,
  SDL3.Sys.Bindgen.Keyboard.sDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN,
  SDL3.Sys.Bindgen.Keyboard.sDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN,
  SDL3.Sys.Bindgen.Keyboard.sDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_KeyboardID@, defined at @SDL3\/SDL_keyboard.h 60:16@
newtype SDL_KeyboardID = SDL_KeyboardID
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
  => BG.CompatHasField.HasField "unwrap" SDL_KeyboardID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_KeyboardID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_KeyboardID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_KeyboardID "unwrap" where
  type
    CFieldType SDL_KeyboardID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Text input type.
--
--     These are the valid values for SDL_PROP_TEXTINPUT_TYPE_NUMBER. Not every value is valid on every platform, but where a value isn\'t supported, a reasonable fallback will be used.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StartTextInputWithProperties'
--
--     [C declaration]: @enum SDL_TextInputType@, defined at @SDL3\/SDL_keyboard.h 391:14@
newtype SDL_TextInputType = SDL_TextInputType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_TextInputType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_TextInputType where
  readRaw =
    \ptr0 ->
      pure SDL_TextInputType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_TextInputType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TextInputType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_TextInputType instance BG.Storable SDL_TextInputType

deriving via BG.CUInt instance BG.Prim SDL_TextInputType

instance CEnum.CEnum SDL_TextInputType where
  type CEnumZ SDL_TextInputType = BG.CUInt

  toCEnum = SDL_TextInputType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_TEXTINPUT_TYPE_TEXT")
        , (1, BG.singleton "SDL_TEXTINPUT_TYPE_TEXT_NAME")
        , (2, BG.singleton "SDL_TEXTINPUT_TYPE_TEXT_EMAIL")
        , (3, BG.singleton "SDL_TEXTINPUT_TYPE_TEXT_USERNAME")
        , (4, BG.singleton "SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN")
        , (5, BG.singleton "SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE")
        , (6, BG.singleton "SDL_TEXTINPUT_TYPE_NUMBER")
        , (7, BG.singleton "SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN")
        , (8, BG.singleton "SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_TextInputType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_TextInputType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_TextInputType where
  minDeclaredValue = SDL_TEXTINPUT_TYPE_TEXT

  maxDeclaredValue =
    SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE

instance Show SDL_TextInputType where
  showsPrec = CEnum.shows

instance Read SDL_TextInputType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_TextInputType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TextInputType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_TextInputType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TextInputType "unwrap" where
  type CFieldType SDL_TextInputType "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The input is text
--
--     [C declaration]: @SDL_TEXTINPUT_TYPE_TEXT@, defined at @SDL3\/SDL_keyboard.h 393:5@
pattern SDL_TEXTINPUT_TYPE_TEXT :: SDL_TextInputType
pattern SDL_TEXTINPUT_TYPE_TEXT = SDL_TextInputType 0

-- | The input is a person\'s name
--
--     [C declaration]: @SDL_TEXTINPUT_TYPE_TEXT_NAME@, defined at @SDL3\/SDL_keyboard.h 394:5@
pattern SDL_TEXTINPUT_TYPE_TEXT_NAME :: SDL_TextInputType
pattern SDL_TEXTINPUT_TYPE_TEXT_NAME = SDL_TextInputType 1

-- | The input is an e-mail address
--
--     [C declaration]: @SDL_TEXTINPUT_TYPE_TEXT_EMAIL@, defined at @SDL3\/SDL_keyboard.h 395:5@
pattern SDL_TEXTINPUT_TYPE_TEXT_EMAIL :: SDL_TextInputType
pattern SDL_TEXTINPUT_TYPE_TEXT_EMAIL = SDL_TextInputType 2

-- | The input is a username
--
--     [C declaration]: @SDL_TEXTINPUT_TYPE_TEXT_USERNAME@, defined at @SDL3\/SDL_keyboard.h 396:5@
pattern SDL_TEXTINPUT_TYPE_TEXT_USERNAME :: SDL_TextInputType
pattern SDL_TEXTINPUT_TYPE_TEXT_USERNAME = SDL_TextInputType 3

-- | The input is a secure password that is hidden
--
--     [C declaration]: @SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN@, defined at @SDL3\/SDL_keyboard.h 397:5@
pattern SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN :: SDL_TextInputType
pattern SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN = SDL_TextInputType 4

-- | The input is a secure password that is visible
--
--     [C declaration]: @SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE@, defined at @SDL3\/SDL_keyboard.h 398:5@
pattern SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE :: SDL_TextInputType
pattern SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE = SDL_TextInputType 5

-- | The input is a number
--
--     [C declaration]: @SDL_TEXTINPUT_TYPE_NUMBER@, defined at @SDL3\/SDL_keyboard.h 399:5@
pattern SDL_TEXTINPUT_TYPE_NUMBER :: SDL_TextInputType
pattern SDL_TEXTINPUT_TYPE_NUMBER = SDL_TextInputType 6

-- | The input is a secure PIN that is hidden
--
--     [C declaration]: @SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN@, defined at @SDL3\/SDL_keyboard.h 400:5@
pattern SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN :: SDL_TextInputType
pattern SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN = SDL_TextInputType 7

-- | The input is a secure PIN that is visible
--
--     [C declaration]: @SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE@, defined at @SDL3\/SDL_keyboard.h 401:5@
pattern SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE :: SDL_TextInputType
pattern SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE = SDL_TextInputType 8

-- | Auto capitalization type.
--
--     These are the valid values for SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER. Not every value is valid on every platform, but where a value isn\'t supported, a reasonable fallback will be used.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StartTextInputWithProperties'
--
--     [C declaration]: @enum SDL_Capitalization@, defined at @SDL3\/SDL_keyboard.h 415:14@
newtype SDL_Capitalization = SDL_Capitalization
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_Capitalization where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_Capitalization where
  readRaw =
    \ptr0 ->
      pure SDL_Capitalization
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_Capitalization where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Capitalization unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_Capitalization instance BG.Storable SDL_Capitalization

deriving via BG.CUInt instance BG.Prim SDL_Capitalization

instance CEnum.CEnum SDL_Capitalization where
  type CEnumZ SDL_Capitalization = BG.CUInt

  toCEnum = SDL_Capitalization

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_CAPITALIZE_NONE")
        , (1, BG.singleton "SDL_CAPITALIZE_SENTENCES")
        , (2, BG.singleton "SDL_CAPITALIZE_WORDS")
        , (3, BG.singleton "SDL_CAPITALIZE_LETTERS")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_Capitalization"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_Capitalization"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_Capitalization where
  minDeclaredValue = SDL_CAPITALIZE_NONE

  maxDeclaredValue = SDL_CAPITALIZE_LETTERS

instance Show SDL_Capitalization where
  showsPrec = CEnum.shows

instance Read SDL_Capitalization where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_Capitalization ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Capitalization{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_Capitalization) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_Capitalization "unwrap" where
  type
    CFieldType SDL_Capitalization "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | No auto-capitalization will be done
--
--     [C declaration]: @SDL_CAPITALIZE_NONE@, defined at @SDL3\/SDL_keyboard.h 417:5@
pattern SDL_CAPITALIZE_NONE :: SDL_Capitalization
pattern SDL_CAPITALIZE_NONE = SDL_Capitalization 0

-- | The first letter of sentences will be capitalized
--
--     [C declaration]: @SDL_CAPITALIZE_SENTENCES@, defined at @SDL3\/SDL_keyboard.h 418:5@
pattern SDL_CAPITALIZE_SENTENCES :: SDL_Capitalization
pattern SDL_CAPITALIZE_SENTENCES = SDL_Capitalization 1

-- | The first letter of words will be capitalized
--
--     [C declaration]: @SDL_CAPITALIZE_WORDS@, defined at @SDL3\/SDL_keyboard.h 419:5@
pattern SDL_CAPITALIZE_WORDS :: SDL_Capitalization
pattern SDL_CAPITALIZE_WORDS = SDL_Capitalization 2

-- | All letters will be capitalized
--
--     [C declaration]: @SDL_CAPITALIZE_LETTERS@, defined at @SDL3\/SDL_keyboard.h 420:5@
pattern SDL_CAPITALIZE_LETTERS :: SDL_Capitalization
pattern SDL_CAPITALIZE_LETTERS = SDL_Capitalization 3

-- | [C declaration]: @macro SDL_PROP_TEXTINPUT_TYPE_NUMBER@, literal @\"SDL.textinput.type\"@, defined at @SDL3\/SDL_keyboard.h 475:9@
sDL_PROP_TEXTINPUT_TYPE_NUMBER :: BG.ByteString
sDL_PROP_TEXTINPUT_TYPE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x69
    , 0x6E
    , 0x70
    , 0x75
    , 0x74
    , 0x2E
    , 0x74
    , 0x79
    , 0x70
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER@, literal @\"SDL.textinput.capitalization\"@, defined at @SDL3\/SDL_keyboard.h 476:9@
sDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER :: BG.ByteString
sDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x69
    , 0x6E
    , 0x70
    , 0x75
    , 0x74
    , 0x2E
    , 0x63
    , 0x61
    , 0x70
    , 0x69
    , 0x74
    , 0x61
    , 0x6C
    , 0x69
    , 0x7A
    , 0x61
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN@, literal @\"SDL.textinput.autocorrect\"@, defined at @SDL3\/SDL_keyboard.h 477:9@
sDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN :: BG.ByteString
sDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x69
    , 0x6E
    , 0x70
    , 0x75
    , 0x74
    , 0x2E
    , 0x61
    , 0x75
    , 0x74
    , 0x6F
    , 0x63
    , 0x6F
    , 0x72
    , 0x72
    , 0x65
    , 0x63
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN@, literal @\"SDL.textinput.multiline\"@, defined at @SDL3\/SDL_keyboard.h 478:9@
sDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN :: BG.ByteString
sDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x69
    , 0x6E
    , 0x70
    , 0x75
    , 0x74
    , 0x2E
    , 0x6D
    , 0x75
    , 0x6C
    , 0x74
    , 0x69
    , 0x6C
    , 0x69
    , 0x6E
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER@, literal @\"SDL.textinput.android.inputtype\"@, defined at @SDL3\/SDL_keyboard.h 479:9@
sDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER :: BG.ByteString
sDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x74
    , 0x65
    , 0x78
    , 0x74
    , 0x69
    , 0x6E
    , 0x70
    , 0x75
    , 0x74
    , 0x2E
    , 0x61
    , 0x6E
    , 0x64
    , 0x72
    , 0x6F
    , 0x69
    , 0x64
    , 0x2E
    , 0x69
    , 0x6E
    , 0x70
    , 0x75
    , 0x74
    , 0x74
    , 0x79
    , 0x70
    , 0x65
    ]
