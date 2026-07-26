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

-- | Defines keyboard scancodes.
--
--     Please refer to the Best Keyboard Practices document for details on what this information means and how best to use it.
--
--     [https:\/\/wiki.libsdl.org\/SDL3\/BestKeyboardPractices](https://wiki.libsdl.org/SDL3/BestKeyboardPractices) The SDL keyboard scancode representation.
--
--     An SDL scancode is the physical representation of a key on the keyboard, independent of language and keyboard mapping.
--
--     Values of this type are used to represent keyboard keys, among other places in the @scancode@ field of the SDL_KeyboardEvent structure.
--
--     The values in this enumeration are based on the USB usage page standard: [https:\/\/usb.org\/sites\/default\/files\/hut1_5.pdf](https://usb.org/sites/default/files/hut1_5.pdf)
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Scancode (
  SDL3.Sys.Bindgen.Scancode.SDL_Scancode (..),
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_A,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_B,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_C,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_D,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_E,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_G,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_H,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_I,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_J,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_K,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_L,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_M,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_N,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_O,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_P,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_Q,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_R,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_S,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_T,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_U,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_V,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_W,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_X,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_Y,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_Z,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_1,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_2,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_3,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_4,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_5,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_6,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_7,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_8,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_9,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_0,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_RETURN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_ESCAPE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_BACKSPACE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_TAB,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SPACE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MINUS,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_EQUALS,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LEFTBRACKET,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_RIGHTBRACKET,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_BACKSLASH,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_NONUSHASH,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SEMICOLON,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_APOSTROPHE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_GRAVE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_COMMA,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_PERIOD,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SLASH,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CAPSLOCK,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F1,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F2,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F3,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F4,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F5,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F6,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F7,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F8,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F9,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F10,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F11,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F12,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_PRINTSCREEN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SCROLLLOCK,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_PAUSE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INSERT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_HOME,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_PAGEUP,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_DELETE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_END,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_PAGEDOWN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_RIGHT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LEFT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_DOWN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_UP,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_NUMLOCKCLEAR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_DIVIDE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_MULTIPLY,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_MINUS,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_PLUS,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_ENTER,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_1,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_2,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_3,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_4,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_5,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_6,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_7,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_8,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_9,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_0,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_PERIOD,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_NONUSBACKSLASH,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_APPLICATION,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_POWER,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_EQUALS,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F13,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F14,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F15,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F16,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F17,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F18,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F19,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F20,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F21,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F22,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F23,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_F24,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_EXECUTE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_HELP,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MENU,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SELECT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_STOP,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AGAIN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_UNDO,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CUT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_COPY,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_PASTE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_FIND,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MUTE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_VOLUMEUP,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_VOLUMEDOWN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_COMMA,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_EQUALSAS400,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INTERNATIONAL1,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INTERNATIONAL2,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INTERNATIONAL3,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INTERNATIONAL4,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INTERNATIONAL5,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INTERNATIONAL6,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INTERNATIONAL7,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INTERNATIONAL8,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_INTERNATIONAL9,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LANG1,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LANG2,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LANG3,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LANG4,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LANG5,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LANG6,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LANG7,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LANG8,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LANG9,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_ALTERASE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SYSREQ,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CANCEL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CLEAR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_PRIOR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_RETURN2,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SEPARATOR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_OUT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_OPER,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CLEARAGAIN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CRSEL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_EXSEL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_00,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_000,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_THOUSANDSSEPARATOR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_DECIMALSEPARATOR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CURRENCYUNIT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CURRENCYSUBUNIT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_LEFTPAREN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_RIGHTPAREN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_LEFTBRACE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_RIGHTBRACE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_TAB,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_BACKSPACE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_A,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_B,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_C,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_D,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_E,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_F,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_XOR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_POWER,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_PERCENT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_LESS,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_GREATER,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_AMPERSAND,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_DBLAMPERSAND,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_VERTICALBAR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_DBLVERTICALBAR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_COLON,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_HASH,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_SPACE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_AT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_EXCLAM,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_MEMSTORE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_MEMRECALL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_MEMCLEAR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_MEMADD,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_MEMSUBTRACT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_MEMMULTIPLY,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_MEMDIVIDE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_PLUSMINUS,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_CLEAR,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_CLEARENTRY,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_BINARY,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_OCTAL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_DECIMAL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_KP_HEXADECIMAL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LCTRL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LSHIFT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LALT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_LGUI,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_RCTRL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_RSHIFT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_RALT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_RGUI,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MODE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SLEEP,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_WAKE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CHANNEL_INCREMENT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CHANNEL_DECREMENT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_PLAY,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_PAUSE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_RECORD,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_FAST_FORWARD,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_REWIND,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_NEXT_TRACK,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_PREVIOUS_TRACK,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_STOP,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_EJECT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_PLAY_PAUSE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_MEDIA_SELECT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_NEW,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_OPEN,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_CLOSE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_EXIT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_SAVE,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_PRINT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_PROPERTIES,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_SEARCH,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_HOME,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_BACK,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_FORWARD,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_STOP,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_REFRESH,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_AC_BOOKMARKS,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SOFTLEFT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_SOFTRIGHT,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_CALL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_ENDCALL,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_RESERVED,
  pattern SDL3.Sys.Bindgen.Scancode.SDL_SCANCODE_COUNT,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @enum SDL_Scancode@, defined at @SDL3\/SDL_scancode.h 52:14@
newtype SDL_Scancode = SDL_Scancode
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_Scancode where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_Scancode where
  readRaw =
    \ptr0 ->
      pure SDL_Scancode
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_Scancode where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Scancode unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_Scancode instance BG.Storable SDL_Scancode

deriving via BG.CUInt instance BG.Prim SDL_Scancode

instance CEnum.CEnum SDL_Scancode where
  type CEnumZ SDL_Scancode = BG.CUInt

  toCEnum = SDL_Scancode

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_SCANCODE_UNKNOWN")
        , (4, BG.singleton "SDL_SCANCODE_A")
        , (5, BG.singleton "SDL_SCANCODE_B")
        , (6, BG.singleton "SDL_SCANCODE_C")
        , (7, BG.singleton "SDL_SCANCODE_D")
        , (8, BG.singleton "SDL_SCANCODE_E")
        , (9, BG.singleton "SDL_SCANCODE_F")
        , (10, BG.singleton "SDL_SCANCODE_G")
        , (11, BG.singleton "SDL_SCANCODE_H")
        , (12, BG.singleton "SDL_SCANCODE_I")
        , (13, BG.singleton "SDL_SCANCODE_J")
        , (14, BG.singleton "SDL_SCANCODE_K")
        , (15, BG.singleton "SDL_SCANCODE_L")
        , (16, BG.singleton "SDL_SCANCODE_M")
        , (17, BG.singleton "SDL_SCANCODE_N")
        , (18, BG.singleton "SDL_SCANCODE_O")
        , (19, BG.singleton "SDL_SCANCODE_P")
        , (20, BG.singleton "SDL_SCANCODE_Q")
        , (21, BG.singleton "SDL_SCANCODE_R")
        , (22, BG.singleton "SDL_SCANCODE_S")
        , (23, BG.singleton "SDL_SCANCODE_T")
        , (24, BG.singleton "SDL_SCANCODE_U")
        , (25, BG.singleton "SDL_SCANCODE_V")
        , (26, BG.singleton "SDL_SCANCODE_W")
        , (27, BG.singleton "SDL_SCANCODE_X")
        , (28, BG.singleton "SDL_SCANCODE_Y")
        , (29, BG.singleton "SDL_SCANCODE_Z")
        , (30, BG.singleton "SDL_SCANCODE_1")
        , (31, BG.singleton "SDL_SCANCODE_2")
        , (32, BG.singleton "SDL_SCANCODE_3")
        , (33, BG.singleton "SDL_SCANCODE_4")
        , (34, BG.singleton "SDL_SCANCODE_5")
        , (35, BG.singleton "SDL_SCANCODE_6")
        , (36, BG.singleton "SDL_SCANCODE_7")
        , (37, BG.singleton "SDL_SCANCODE_8")
        , (38, BG.singleton "SDL_SCANCODE_9")
        , (39, BG.singleton "SDL_SCANCODE_0")
        , (40, BG.singleton "SDL_SCANCODE_RETURN")
        , (41, BG.singleton "SDL_SCANCODE_ESCAPE")
        , (42, BG.singleton "SDL_SCANCODE_BACKSPACE")
        , (43, BG.singleton "SDL_SCANCODE_TAB")
        , (44, BG.singleton "SDL_SCANCODE_SPACE")
        , (45, BG.singleton "SDL_SCANCODE_MINUS")
        , (46, BG.singleton "SDL_SCANCODE_EQUALS")
        , (47, BG.singleton "SDL_SCANCODE_LEFTBRACKET")
        , (48, BG.singleton "SDL_SCANCODE_RIGHTBRACKET")
        , (49, BG.singleton "SDL_SCANCODE_BACKSLASH")
        , (50, BG.singleton "SDL_SCANCODE_NONUSHASH")
        , (51, BG.singleton "SDL_SCANCODE_SEMICOLON")
        , (52, BG.singleton "SDL_SCANCODE_APOSTROPHE")
        , (53, BG.singleton "SDL_SCANCODE_GRAVE")
        , (54, BG.singleton "SDL_SCANCODE_COMMA")
        , (55, BG.singleton "SDL_SCANCODE_PERIOD")
        , (56, BG.singleton "SDL_SCANCODE_SLASH")
        , (57, BG.singleton "SDL_SCANCODE_CAPSLOCK")
        , (58, BG.singleton "SDL_SCANCODE_F1")
        , (59, BG.singleton "SDL_SCANCODE_F2")
        , (60, BG.singleton "SDL_SCANCODE_F3")
        , (61, BG.singleton "SDL_SCANCODE_F4")
        , (62, BG.singleton "SDL_SCANCODE_F5")
        , (63, BG.singleton "SDL_SCANCODE_F6")
        , (64, BG.singleton "SDL_SCANCODE_F7")
        , (65, BG.singleton "SDL_SCANCODE_F8")
        , (66, BG.singleton "SDL_SCANCODE_F9")
        , (67, BG.singleton "SDL_SCANCODE_F10")
        , (68, BG.singleton "SDL_SCANCODE_F11")
        , (69, BG.singleton "SDL_SCANCODE_F12")
        , (70, BG.singleton "SDL_SCANCODE_PRINTSCREEN")
        , (71, BG.singleton "SDL_SCANCODE_SCROLLLOCK")
        , (72, BG.singleton "SDL_SCANCODE_PAUSE")
        , (73, BG.singleton "SDL_SCANCODE_INSERT")
        , (74, BG.singleton "SDL_SCANCODE_HOME")
        , (75, BG.singleton "SDL_SCANCODE_PAGEUP")
        , (76, BG.singleton "SDL_SCANCODE_DELETE")
        , (77, BG.singleton "SDL_SCANCODE_END")
        , (78, BG.singleton "SDL_SCANCODE_PAGEDOWN")
        , (79, BG.singleton "SDL_SCANCODE_RIGHT")
        , (80, BG.singleton "SDL_SCANCODE_LEFT")
        , (81, BG.singleton "SDL_SCANCODE_DOWN")
        , (82, BG.singleton "SDL_SCANCODE_UP")
        , (83, BG.singleton "SDL_SCANCODE_NUMLOCKCLEAR")
        , (84, BG.singleton "SDL_SCANCODE_KP_DIVIDE")
        , (85, BG.singleton "SDL_SCANCODE_KP_MULTIPLY")
        , (86, BG.singleton "SDL_SCANCODE_KP_MINUS")
        , (87, BG.singleton "SDL_SCANCODE_KP_PLUS")
        , (88, BG.singleton "SDL_SCANCODE_KP_ENTER")
        , (89, BG.singleton "SDL_SCANCODE_KP_1")
        , (90, BG.singleton "SDL_SCANCODE_KP_2")
        , (91, BG.singleton "SDL_SCANCODE_KP_3")
        , (92, BG.singleton "SDL_SCANCODE_KP_4")
        , (93, BG.singleton "SDL_SCANCODE_KP_5")
        , (94, BG.singleton "SDL_SCANCODE_KP_6")
        , (95, BG.singleton "SDL_SCANCODE_KP_7")
        , (96, BG.singleton "SDL_SCANCODE_KP_8")
        , (97, BG.singleton "SDL_SCANCODE_KP_9")
        , (98, BG.singleton "SDL_SCANCODE_KP_0")
        , (99, BG.singleton "SDL_SCANCODE_KP_PERIOD")
        , (100, BG.singleton "SDL_SCANCODE_NONUSBACKSLASH")
        , (101, BG.singleton "SDL_SCANCODE_APPLICATION")
        , (102, BG.singleton "SDL_SCANCODE_POWER")
        , (103, BG.singleton "SDL_SCANCODE_KP_EQUALS")
        , (104, BG.singleton "SDL_SCANCODE_F13")
        , (105, BG.singleton "SDL_SCANCODE_F14")
        , (106, BG.singleton "SDL_SCANCODE_F15")
        , (107, BG.singleton "SDL_SCANCODE_F16")
        , (108, BG.singleton "SDL_SCANCODE_F17")
        , (109, BG.singleton "SDL_SCANCODE_F18")
        , (110, BG.singleton "SDL_SCANCODE_F19")
        , (111, BG.singleton "SDL_SCANCODE_F20")
        , (112, BG.singleton "SDL_SCANCODE_F21")
        , (113, BG.singleton "SDL_SCANCODE_F22")
        , (114, BG.singleton "SDL_SCANCODE_F23")
        , (115, BG.singleton "SDL_SCANCODE_F24")
        , (116, BG.singleton "SDL_SCANCODE_EXECUTE")
        , (117, BG.singleton "SDL_SCANCODE_HELP")
        , (118, BG.singleton "SDL_SCANCODE_MENU")
        , (119, BG.singleton "SDL_SCANCODE_SELECT")
        , (120, BG.singleton "SDL_SCANCODE_STOP")
        , (121, BG.singleton "SDL_SCANCODE_AGAIN")
        , (122, BG.singleton "SDL_SCANCODE_UNDO")
        , (123, BG.singleton "SDL_SCANCODE_CUT")
        , (124, BG.singleton "SDL_SCANCODE_COPY")
        , (125, BG.singleton "SDL_SCANCODE_PASTE")
        , (126, BG.singleton "SDL_SCANCODE_FIND")
        , (127, BG.singleton "SDL_SCANCODE_MUTE")
        , (128, BG.singleton "SDL_SCANCODE_VOLUMEUP")
        , (129, BG.singleton "SDL_SCANCODE_VOLUMEDOWN")
        , (133, BG.singleton "SDL_SCANCODE_KP_COMMA")
        , (134, BG.singleton "SDL_SCANCODE_KP_EQUALSAS400")
        , (135, BG.singleton "SDL_SCANCODE_INTERNATIONAL1")
        , (136, BG.singleton "SDL_SCANCODE_INTERNATIONAL2")
        , (137, BG.singleton "SDL_SCANCODE_INTERNATIONAL3")
        , (138, BG.singleton "SDL_SCANCODE_INTERNATIONAL4")
        , (139, BG.singleton "SDL_SCANCODE_INTERNATIONAL5")
        , (140, BG.singleton "SDL_SCANCODE_INTERNATIONAL6")
        , (141, BG.singleton "SDL_SCANCODE_INTERNATIONAL7")
        , (142, BG.singleton "SDL_SCANCODE_INTERNATIONAL8")
        , (143, BG.singleton "SDL_SCANCODE_INTERNATIONAL9")
        , (144, BG.singleton "SDL_SCANCODE_LANG1")
        , (145, BG.singleton "SDL_SCANCODE_LANG2")
        , (146, BG.singleton "SDL_SCANCODE_LANG3")
        , (147, BG.singleton "SDL_SCANCODE_LANG4")
        , (148, BG.singleton "SDL_SCANCODE_LANG5")
        , (149, BG.singleton "SDL_SCANCODE_LANG6")
        , (150, BG.singleton "SDL_SCANCODE_LANG7")
        , (151, BG.singleton "SDL_SCANCODE_LANG8")
        , (152, BG.singleton "SDL_SCANCODE_LANG9")
        , (153, BG.singleton "SDL_SCANCODE_ALTERASE")
        , (154, BG.singleton "SDL_SCANCODE_SYSREQ")
        , (155, BG.singleton "SDL_SCANCODE_CANCEL")
        , (156, BG.singleton "SDL_SCANCODE_CLEAR")
        , (157, BG.singleton "SDL_SCANCODE_PRIOR")
        , (158, BG.singleton "SDL_SCANCODE_RETURN2")
        , (159, BG.singleton "SDL_SCANCODE_SEPARATOR")
        , (160, BG.singleton "SDL_SCANCODE_OUT")
        , (161, BG.singleton "SDL_SCANCODE_OPER")
        , (162, BG.singleton "SDL_SCANCODE_CLEARAGAIN")
        , (163, BG.singleton "SDL_SCANCODE_CRSEL")
        , (164, BG.singleton "SDL_SCANCODE_EXSEL")
        , (176, BG.singleton "SDL_SCANCODE_KP_00")
        , (177, BG.singleton "SDL_SCANCODE_KP_000")
        , (178, BG.singleton "SDL_SCANCODE_THOUSANDSSEPARATOR")
        , (179, BG.singleton "SDL_SCANCODE_DECIMALSEPARATOR")
        , (180, BG.singleton "SDL_SCANCODE_CURRENCYUNIT")
        , (181, BG.singleton "SDL_SCANCODE_CURRENCYSUBUNIT")
        , (182, BG.singleton "SDL_SCANCODE_KP_LEFTPAREN")
        , (183, BG.singleton "SDL_SCANCODE_KP_RIGHTPAREN")
        , (184, BG.singleton "SDL_SCANCODE_KP_LEFTBRACE")
        , (185, BG.singleton "SDL_SCANCODE_KP_RIGHTBRACE")
        , (186, BG.singleton "SDL_SCANCODE_KP_TAB")
        , (187, BG.singleton "SDL_SCANCODE_KP_BACKSPACE")
        , (188, BG.singleton "SDL_SCANCODE_KP_A")
        , (189, BG.singleton "SDL_SCANCODE_KP_B")
        , (190, BG.singleton "SDL_SCANCODE_KP_C")
        , (191, BG.singleton "SDL_SCANCODE_KP_D")
        , (192, BG.singleton "SDL_SCANCODE_KP_E")
        , (193, BG.singleton "SDL_SCANCODE_KP_F")
        , (194, BG.singleton "SDL_SCANCODE_KP_XOR")
        , (195, BG.singleton "SDL_SCANCODE_KP_POWER")
        , (196, BG.singleton "SDL_SCANCODE_KP_PERCENT")
        , (197, BG.singleton "SDL_SCANCODE_KP_LESS")
        , (198, BG.singleton "SDL_SCANCODE_KP_GREATER")
        , (199, BG.singleton "SDL_SCANCODE_KP_AMPERSAND")
        , (200, BG.singleton "SDL_SCANCODE_KP_DBLAMPERSAND")
        , (201, BG.singleton "SDL_SCANCODE_KP_VERTICALBAR")
        , (202, BG.singleton "SDL_SCANCODE_KP_DBLVERTICALBAR")
        , (203, BG.singleton "SDL_SCANCODE_KP_COLON")
        , (204, BG.singleton "SDL_SCANCODE_KP_HASH")
        , (205, BG.singleton "SDL_SCANCODE_KP_SPACE")
        , (206, BG.singleton "SDL_SCANCODE_KP_AT")
        , (207, BG.singleton "SDL_SCANCODE_KP_EXCLAM")
        , (208, BG.singleton "SDL_SCANCODE_KP_MEMSTORE")
        , (209, BG.singleton "SDL_SCANCODE_KP_MEMRECALL")
        , (210, BG.singleton "SDL_SCANCODE_KP_MEMCLEAR")
        , (211, BG.singleton "SDL_SCANCODE_KP_MEMADD")
        , (212, BG.singleton "SDL_SCANCODE_KP_MEMSUBTRACT")
        , (213, BG.singleton "SDL_SCANCODE_KP_MEMMULTIPLY")
        , (214, BG.singleton "SDL_SCANCODE_KP_MEMDIVIDE")
        , (215, BG.singleton "SDL_SCANCODE_KP_PLUSMINUS")
        , (216, BG.singleton "SDL_SCANCODE_KP_CLEAR")
        , (217, BG.singleton "SDL_SCANCODE_KP_CLEARENTRY")
        , (218, BG.singleton "SDL_SCANCODE_KP_BINARY")
        , (219, BG.singleton "SDL_SCANCODE_KP_OCTAL")
        , (220, BG.singleton "SDL_SCANCODE_KP_DECIMAL")
        , (221, BG.singleton "SDL_SCANCODE_KP_HEXADECIMAL")
        , (224, BG.singleton "SDL_SCANCODE_LCTRL")
        , (225, BG.singleton "SDL_SCANCODE_LSHIFT")
        , (226, BG.singleton "SDL_SCANCODE_LALT")
        , (227, BG.singleton "SDL_SCANCODE_LGUI")
        , (228, BG.singleton "SDL_SCANCODE_RCTRL")
        , (229, BG.singleton "SDL_SCANCODE_RSHIFT")
        , (230, BG.singleton "SDL_SCANCODE_RALT")
        , (231, BG.singleton "SDL_SCANCODE_RGUI")
        , (257, BG.singleton "SDL_SCANCODE_MODE")
        , (258, BG.singleton "SDL_SCANCODE_SLEEP")
        , (259, BG.singleton "SDL_SCANCODE_WAKE")
        , (260, BG.singleton "SDL_SCANCODE_CHANNEL_INCREMENT")
        , (261, BG.singleton "SDL_SCANCODE_CHANNEL_DECREMENT")
        , (262, BG.singleton "SDL_SCANCODE_MEDIA_PLAY")
        , (263, BG.singleton "SDL_SCANCODE_MEDIA_PAUSE")
        , (264, BG.singleton "SDL_SCANCODE_MEDIA_RECORD")
        , (265, BG.singleton "SDL_SCANCODE_MEDIA_FAST_FORWARD")
        , (266, BG.singleton "SDL_SCANCODE_MEDIA_REWIND")
        , (267, BG.singleton "SDL_SCANCODE_MEDIA_NEXT_TRACK")
        , (268, BG.singleton "SDL_SCANCODE_MEDIA_PREVIOUS_TRACK")
        , (269, BG.singleton "SDL_SCANCODE_MEDIA_STOP")
        , (270, BG.singleton "SDL_SCANCODE_MEDIA_EJECT")
        , (271, BG.singleton "SDL_SCANCODE_MEDIA_PLAY_PAUSE")
        , (272, BG.singleton "SDL_SCANCODE_MEDIA_SELECT")
        , (273, BG.singleton "SDL_SCANCODE_AC_NEW")
        , (274, BG.singleton "SDL_SCANCODE_AC_OPEN")
        , (275, BG.singleton "SDL_SCANCODE_AC_CLOSE")
        , (276, BG.singleton "SDL_SCANCODE_AC_EXIT")
        , (277, BG.singleton "SDL_SCANCODE_AC_SAVE")
        , (278, BG.singleton "SDL_SCANCODE_AC_PRINT")
        , (279, BG.singleton "SDL_SCANCODE_AC_PROPERTIES")
        , (280, BG.singleton "SDL_SCANCODE_AC_SEARCH")
        , (281, BG.singleton "SDL_SCANCODE_AC_HOME")
        , (282, BG.singleton "SDL_SCANCODE_AC_BACK")
        , (283, BG.singleton "SDL_SCANCODE_AC_FORWARD")
        , (284, BG.singleton "SDL_SCANCODE_AC_STOP")
        , (285, BG.singleton "SDL_SCANCODE_AC_REFRESH")
        , (286, BG.singleton "SDL_SCANCODE_AC_BOOKMARKS")
        , (287, BG.singleton "SDL_SCANCODE_SOFTLEFT")
        , (288, BG.singleton "SDL_SCANCODE_SOFTRIGHT")
        , (289, BG.singleton "SDL_SCANCODE_CALL")
        , (290, BG.singleton "SDL_SCANCODE_ENDCALL")
        , (400, BG.singleton "SDL_SCANCODE_RESERVED")
        , (512, BG.singleton "SDL_SCANCODE_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_Scancode"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_Scancode"

instance Show SDL_Scancode where
  showsPrec = CEnum.shows

instance Read SDL_Scancode where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_Scancode ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Scancode{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_Scancode) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_Scancode "unwrap" where
  type CFieldType SDL_Scancode "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_SCANCODE_UNKNOWN@, defined at @SDL3\/SDL_scancode.h 54:5@
pattern SDL_SCANCODE_UNKNOWN :: SDL_Scancode
pattern SDL_SCANCODE_UNKNOWN = SDL_Scancode 0

-- | [C declaration]: @SDL_SCANCODE_A@, defined at @SDL3\/SDL_scancode.h 63:5@
pattern SDL_SCANCODE_A :: SDL_Scancode
pattern SDL_SCANCODE_A = SDL_Scancode 4

-- | [C declaration]: @SDL_SCANCODE_B@, defined at @SDL3\/SDL_scancode.h 64:5@
pattern SDL_SCANCODE_B :: SDL_Scancode
pattern SDL_SCANCODE_B = SDL_Scancode 5

-- | [C declaration]: @SDL_SCANCODE_C@, defined at @SDL3\/SDL_scancode.h 65:5@
pattern SDL_SCANCODE_C :: SDL_Scancode
pattern SDL_SCANCODE_C = SDL_Scancode 6

-- | [C declaration]: @SDL_SCANCODE_D@, defined at @SDL3\/SDL_scancode.h 66:5@
pattern SDL_SCANCODE_D :: SDL_Scancode
pattern SDL_SCANCODE_D = SDL_Scancode 7

-- | [C declaration]: @SDL_SCANCODE_E@, defined at @SDL3\/SDL_scancode.h 67:5@
pattern SDL_SCANCODE_E :: SDL_Scancode
pattern SDL_SCANCODE_E = SDL_Scancode 8

-- | [C declaration]: @SDL_SCANCODE_F@, defined at @SDL3\/SDL_scancode.h 68:5@
pattern SDL_SCANCODE_F :: SDL_Scancode
pattern SDL_SCANCODE_F = SDL_Scancode 9

-- | [C declaration]: @SDL_SCANCODE_G@, defined at @SDL3\/SDL_scancode.h 69:5@
pattern SDL_SCANCODE_G :: SDL_Scancode
pattern SDL_SCANCODE_G = SDL_Scancode 10

-- | [C declaration]: @SDL_SCANCODE_H@, defined at @SDL3\/SDL_scancode.h 70:5@
pattern SDL_SCANCODE_H :: SDL_Scancode
pattern SDL_SCANCODE_H = SDL_Scancode 11

-- | [C declaration]: @SDL_SCANCODE_I@, defined at @SDL3\/SDL_scancode.h 71:5@
pattern SDL_SCANCODE_I :: SDL_Scancode
pattern SDL_SCANCODE_I = SDL_Scancode 12

-- | [C declaration]: @SDL_SCANCODE_J@, defined at @SDL3\/SDL_scancode.h 72:5@
pattern SDL_SCANCODE_J :: SDL_Scancode
pattern SDL_SCANCODE_J = SDL_Scancode 13

-- | [C declaration]: @SDL_SCANCODE_K@, defined at @SDL3\/SDL_scancode.h 73:5@
pattern SDL_SCANCODE_K :: SDL_Scancode
pattern SDL_SCANCODE_K = SDL_Scancode 14

-- | [C declaration]: @SDL_SCANCODE_L@, defined at @SDL3\/SDL_scancode.h 74:5@
pattern SDL_SCANCODE_L :: SDL_Scancode
pattern SDL_SCANCODE_L = SDL_Scancode 15

-- | [C declaration]: @SDL_SCANCODE_M@, defined at @SDL3\/SDL_scancode.h 75:5@
pattern SDL_SCANCODE_M :: SDL_Scancode
pattern SDL_SCANCODE_M = SDL_Scancode 16

-- | [C declaration]: @SDL_SCANCODE_N@, defined at @SDL3\/SDL_scancode.h 76:5@
pattern SDL_SCANCODE_N :: SDL_Scancode
pattern SDL_SCANCODE_N = SDL_Scancode 17

-- | [C declaration]: @SDL_SCANCODE_O@, defined at @SDL3\/SDL_scancode.h 77:5@
pattern SDL_SCANCODE_O :: SDL_Scancode
pattern SDL_SCANCODE_O = SDL_Scancode 18

-- | [C declaration]: @SDL_SCANCODE_P@, defined at @SDL3\/SDL_scancode.h 78:5@
pattern SDL_SCANCODE_P :: SDL_Scancode
pattern SDL_SCANCODE_P = SDL_Scancode 19

-- | [C declaration]: @SDL_SCANCODE_Q@, defined at @SDL3\/SDL_scancode.h 79:5@
pattern SDL_SCANCODE_Q :: SDL_Scancode
pattern SDL_SCANCODE_Q = SDL_Scancode 20

-- | [C declaration]: @SDL_SCANCODE_R@, defined at @SDL3\/SDL_scancode.h 80:5@
pattern SDL_SCANCODE_R :: SDL_Scancode
pattern SDL_SCANCODE_R = SDL_Scancode 21

-- | [C declaration]: @SDL_SCANCODE_S@, defined at @SDL3\/SDL_scancode.h 81:5@
pattern SDL_SCANCODE_S :: SDL_Scancode
pattern SDL_SCANCODE_S = SDL_Scancode 22

-- | [C declaration]: @SDL_SCANCODE_T@, defined at @SDL3\/SDL_scancode.h 82:5@
pattern SDL_SCANCODE_T :: SDL_Scancode
pattern SDL_SCANCODE_T = SDL_Scancode 23

-- | [C declaration]: @SDL_SCANCODE_U@, defined at @SDL3\/SDL_scancode.h 83:5@
pattern SDL_SCANCODE_U :: SDL_Scancode
pattern SDL_SCANCODE_U = SDL_Scancode 24

-- | [C declaration]: @SDL_SCANCODE_V@, defined at @SDL3\/SDL_scancode.h 84:5@
pattern SDL_SCANCODE_V :: SDL_Scancode
pattern SDL_SCANCODE_V = SDL_Scancode 25

-- | [C declaration]: @SDL_SCANCODE_W@, defined at @SDL3\/SDL_scancode.h 85:5@
pattern SDL_SCANCODE_W :: SDL_Scancode
pattern SDL_SCANCODE_W = SDL_Scancode 26

-- | [C declaration]: @SDL_SCANCODE_X@, defined at @SDL3\/SDL_scancode.h 86:5@
pattern SDL_SCANCODE_X :: SDL_Scancode
pattern SDL_SCANCODE_X = SDL_Scancode 27

-- | [C declaration]: @SDL_SCANCODE_Y@, defined at @SDL3\/SDL_scancode.h 87:5@
pattern SDL_SCANCODE_Y :: SDL_Scancode
pattern SDL_SCANCODE_Y = SDL_Scancode 28

-- | [C declaration]: @SDL_SCANCODE_Z@, defined at @SDL3\/SDL_scancode.h 88:5@
pattern SDL_SCANCODE_Z :: SDL_Scancode
pattern SDL_SCANCODE_Z = SDL_Scancode 29

-- | [C declaration]: @SDL_SCANCODE_1@, defined at @SDL3\/SDL_scancode.h 90:5@
pattern SDL_SCANCODE_1 :: SDL_Scancode
pattern SDL_SCANCODE_1 = SDL_Scancode 30

-- | [C declaration]: @SDL_SCANCODE_2@, defined at @SDL3\/SDL_scancode.h 91:5@
pattern SDL_SCANCODE_2 :: SDL_Scancode
pattern SDL_SCANCODE_2 = SDL_Scancode 31

-- | [C declaration]: @SDL_SCANCODE_3@, defined at @SDL3\/SDL_scancode.h 92:5@
pattern SDL_SCANCODE_3 :: SDL_Scancode
pattern SDL_SCANCODE_3 = SDL_Scancode 32

-- | [C declaration]: @SDL_SCANCODE_4@, defined at @SDL3\/SDL_scancode.h 93:5@
pattern SDL_SCANCODE_4 :: SDL_Scancode
pattern SDL_SCANCODE_4 = SDL_Scancode 33

-- | [C declaration]: @SDL_SCANCODE_5@, defined at @SDL3\/SDL_scancode.h 94:5@
pattern SDL_SCANCODE_5 :: SDL_Scancode
pattern SDL_SCANCODE_5 = SDL_Scancode 34

-- | [C declaration]: @SDL_SCANCODE_6@, defined at @SDL3\/SDL_scancode.h 95:5@
pattern SDL_SCANCODE_6 :: SDL_Scancode
pattern SDL_SCANCODE_6 = SDL_Scancode 35

-- | [C declaration]: @SDL_SCANCODE_7@, defined at @SDL3\/SDL_scancode.h 96:5@
pattern SDL_SCANCODE_7 :: SDL_Scancode
pattern SDL_SCANCODE_7 = SDL_Scancode 36

-- | [C declaration]: @SDL_SCANCODE_8@, defined at @SDL3\/SDL_scancode.h 97:5@
pattern SDL_SCANCODE_8 :: SDL_Scancode
pattern SDL_SCANCODE_8 = SDL_Scancode 37

-- | [C declaration]: @SDL_SCANCODE_9@, defined at @SDL3\/SDL_scancode.h 98:5@
pattern SDL_SCANCODE_9 :: SDL_Scancode
pattern SDL_SCANCODE_9 = SDL_Scancode 38

-- | [C declaration]: @SDL_SCANCODE_0@, defined at @SDL3\/SDL_scancode.h 99:5@
pattern SDL_SCANCODE_0 :: SDL_Scancode
pattern SDL_SCANCODE_0 = SDL_Scancode 39

-- | [C declaration]: @SDL_SCANCODE_RETURN@, defined at @SDL3\/SDL_scancode.h 101:5@
pattern SDL_SCANCODE_RETURN :: SDL_Scancode
pattern SDL_SCANCODE_RETURN = SDL_Scancode 40

-- | [C declaration]: @SDL_SCANCODE_ESCAPE@, defined at @SDL3\/SDL_scancode.h 102:5@
pattern SDL_SCANCODE_ESCAPE :: SDL_Scancode
pattern SDL_SCANCODE_ESCAPE = SDL_Scancode 41

-- | [C declaration]: @SDL_SCANCODE_BACKSPACE@, defined at @SDL3\/SDL_scancode.h 103:5@
pattern SDL_SCANCODE_BACKSPACE :: SDL_Scancode
pattern SDL_SCANCODE_BACKSPACE = SDL_Scancode 42

-- | [C declaration]: @SDL_SCANCODE_TAB@, defined at @SDL3\/SDL_scancode.h 104:5@
pattern SDL_SCANCODE_TAB :: SDL_Scancode
pattern SDL_SCANCODE_TAB = SDL_Scancode 43

-- | [C declaration]: @SDL_SCANCODE_SPACE@, defined at @SDL3\/SDL_scancode.h 105:5@
pattern SDL_SCANCODE_SPACE :: SDL_Scancode
pattern SDL_SCANCODE_SPACE = SDL_Scancode 44

-- | [C declaration]: @SDL_SCANCODE_MINUS@, defined at @SDL3\/SDL_scancode.h 107:5@
pattern SDL_SCANCODE_MINUS :: SDL_Scancode
pattern SDL_SCANCODE_MINUS = SDL_Scancode 45

-- | [C declaration]: @SDL_SCANCODE_EQUALS@, defined at @SDL3\/SDL_scancode.h 108:5@
pattern SDL_SCANCODE_EQUALS :: SDL_Scancode
pattern SDL_SCANCODE_EQUALS = SDL_Scancode 46

-- | [C declaration]: @SDL_SCANCODE_LEFTBRACKET@, defined at @SDL3\/SDL_scancode.h 109:5@
pattern SDL_SCANCODE_LEFTBRACKET :: SDL_Scancode
pattern SDL_SCANCODE_LEFTBRACKET = SDL_Scancode 47

-- | [C declaration]: @SDL_SCANCODE_RIGHTBRACKET@, defined at @SDL3\/SDL_scancode.h 110:5@
pattern SDL_SCANCODE_RIGHTBRACKET :: SDL_Scancode
pattern SDL_SCANCODE_RIGHTBRACKET = SDL_Scancode 48

-- | Located at the lower left of the return key on ISO keyboards and at the right end of the QWERTY row on ANSI keyboards. Produces REVERSE SOLIDUS (backslash) and VERTICAL LINE in a US layout, REVERSE SOLIDUS and VERTICAL LINE in a UK Mac layout, NUMBER SIGN and TILDE in a UK Windows layout, DOLLAR SIGN and POUND SIGN in a Swiss German layout, NUMBER SIGN and APOSTROPHE in a German layout, GRAVE ACCENT and POUND SIGN in a French Mac layout, and ASTERISK and MICRO SIGN in a French Windows layout.
--
--     [C declaration]: @SDL_SCANCODE_BACKSLASH@, defined at @SDL3\/SDL_scancode.h 111:5@
pattern SDL_SCANCODE_BACKSLASH :: SDL_Scancode
pattern SDL_SCANCODE_BACKSLASH = SDL_Scancode 49

-- | ISO USB keyboards actually use this code instead of 49 for the same key, but all OSes I\'ve seen treat the two codes identically. So, as an implementor, unless your keyboard generates both of those codes and your OS treats them differently, you should generate SDL_SCANCODE_BACKSLASH instead of this code. As a user, you should not rely on this code because SDL will never generate it with most (all?) keyboards.
--
--     [C declaration]: @SDL_SCANCODE_NONUSHASH@, defined at @SDL3\/SDL_scancode.h 125:5@
pattern SDL_SCANCODE_NONUSHASH :: SDL_Scancode
pattern SDL_SCANCODE_NONUSHASH = SDL_Scancode 50

-- | [C declaration]: @SDL_SCANCODE_SEMICOLON@, defined at @SDL3\/SDL_scancode.h 137:5@
pattern SDL_SCANCODE_SEMICOLON :: SDL_Scancode
pattern SDL_SCANCODE_SEMICOLON = SDL_Scancode 51

-- | [C declaration]: @SDL_SCANCODE_APOSTROPHE@, defined at @SDL3\/SDL_scancode.h 138:5@
pattern SDL_SCANCODE_APOSTROPHE :: SDL_Scancode
pattern SDL_SCANCODE_APOSTROPHE = SDL_Scancode 52

-- | Located in the top left corner (on both ANSI and ISO keyboards). Produces GRAVE ACCENT and TILDE in a US Windows layout and in US and UK Mac layouts on ANSI keyboards, GRAVE ACCENT and NOT SIGN in a UK Windows layout, SECTION SIGN and PLUS-MINUS SIGN in US and UK Mac layouts on ISO keyboards, SECTION SIGN and DEGREE SIGN in a Swiss German layout (Mac: only on ISO keyboards), CIRCUMFLEX ACCENT and DEGREE SIGN in a German layout (Mac: only on ISO keyboards), SUPERSCRIPT TWO and TILDE in a French Windows layout, COMMERCIAL AT and NUMBER SIGN in a French Mac layout on ISO keyboards, and LESS-THAN SIGN and GREATER-THAN SIGN in a Swiss German, German, or French Mac layout on ANSI keyboards.
--
--     [C declaration]: @SDL_SCANCODE_GRAVE@, defined at @SDL3\/SDL_scancode.h 139:5@
pattern SDL_SCANCODE_GRAVE :: SDL_Scancode
pattern SDL_SCANCODE_GRAVE = SDL_Scancode 53

-- | [C declaration]: @SDL_SCANCODE_COMMA@, defined at @SDL3\/SDL_scancode.h 156:5@
pattern SDL_SCANCODE_COMMA :: SDL_Scancode
pattern SDL_SCANCODE_COMMA = SDL_Scancode 54

-- | [C declaration]: @SDL_SCANCODE_PERIOD@, defined at @SDL3\/SDL_scancode.h 157:5@
pattern SDL_SCANCODE_PERIOD :: SDL_Scancode
pattern SDL_SCANCODE_PERIOD = SDL_Scancode 55

-- | [C declaration]: @SDL_SCANCODE_SLASH@, defined at @SDL3\/SDL_scancode.h 158:5@
pattern SDL_SCANCODE_SLASH :: SDL_Scancode
pattern SDL_SCANCODE_SLASH = SDL_Scancode 56

-- | [C declaration]: @SDL_SCANCODE_CAPSLOCK@, defined at @SDL3\/SDL_scancode.h 160:5@
pattern SDL_SCANCODE_CAPSLOCK :: SDL_Scancode
pattern SDL_SCANCODE_CAPSLOCK = SDL_Scancode 57

-- | [C declaration]: @SDL_SCANCODE_F1@, defined at @SDL3\/SDL_scancode.h 162:5@
pattern SDL_SCANCODE_F1 :: SDL_Scancode
pattern SDL_SCANCODE_F1 = SDL_Scancode 58

-- | [C declaration]: @SDL_SCANCODE_F2@, defined at @SDL3\/SDL_scancode.h 163:5@
pattern SDL_SCANCODE_F2 :: SDL_Scancode
pattern SDL_SCANCODE_F2 = SDL_Scancode 59

-- | [C declaration]: @SDL_SCANCODE_F3@, defined at @SDL3\/SDL_scancode.h 164:5@
pattern SDL_SCANCODE_F3 :: SDL_Scancode
pattern SDL_SCANCODE_F3 = SDL_Scancode 60

-- | [C declaration]: @SDL_SCANCODE_F4@, defined at @SDL3\/SDL_scancode.h 165:5@
pattern SDL_SCANCODE_F4 :: SDL_Scancode
pattern SDL_SCANCODE_F4 = SDL_Scancode 61

-- | [C declaration]: @SDL_SCANCODE_F5@, defined at @SDL3\/SDL_scancode.h 166:5@
pattern SDL_SCANCODE_F5 :: SDL_Scancode
pattern SDL_SCANCODE_F5 = SDL_Scancode 62

-- | [C declaration]: @SDL_SCANCODE_F6@, defined at @SDL3\/SDL_scancode.h 167:5@
pattern SDL_SCANCODE_F6 :: SDL_Scancode
pattern SDL_SCANCODE_F6 = SDL_Scancode 63

-- | [C declaration]: @SDL_SCANCODE_F7@, defined at @SDL3\/SDL_scancode.h 168:5@
pattern SDL_SCANCODE_F7 :: SDL_Scancode
pattern SDL_SCANCODE_F7 = SDL_Scancode 64

-- | [C declaration]: @SDL_SCANCODE_F8@, defined at @SDL3\/SDL_scancode.h 169:5@
pattern SDL_SCANCODE_F8 :: SDL_Scancode
pattern SDL_SCANCODE_F8 = SDL_Scancode 65

-- | [C declaration]: @SDL_SCANCODE_F9@, defined at @SDL3\/SDL_scancode.h 170:5@
pattern SDL_SCANCODE_F9 :: SDL_Scancode
pattern SDL_SCANCODE_F9 = SDL_Scancode 66

-- | [C declaration]: @SDL_SCANCODE_F10@, defined at @SDL3\/SDL_scancode.h 171:5@
pattern SDL_SCANCODE_F10 :: SDL_Scancode
pattern SDL_SCANCODE_F10 = SDL_Scancode 67

-- | [C declaration]: @SDL_SCANCODE_F11@, defined at @SDL3\/SDL_scancode.h 172:5@
pattern SDL_SCANCODE_F11 :: SDL_Scancode
pattern SDL_SCANCODE_F11 = SDL_Scancode 68

-- | [C declaration]: @SDL_SCANCODE_F12@, defined at @SDL3\/SDL_scancode.h 173:5@
pattern SDL_SCANCODE_F12 :: SDL_Scancode
pattern SDL_SCANCODE_F12 = SDL_Scancode 69

-- | [C declaration]: @SDL_SCANCODE_PRINTSCREEN@, defined at @SDL3\/SDL_scancode.h 175:5@
pattern SDL_SCANCODE_PRINTSCREEN :: SDL_Scancode
pattern SDL_SCANCODE_PRINTSCREEN = SDL_Scancode 70

-- | [C declaration]: @SDL_SCANCODE_SCROLLLOCK@, defined at @SDL3\/SDL_scancode.h 176:5@
pattern SDL_SCANCODE_SCROLLLOCK :: SDL_Scancode
pattern SDL_SCANCODE_SCROLLLOCK = SDL_Scancode 71

-- | [C declaration]: @SDL_SCANCODE_PAUSE@, defined at @SDL3\/SDL_scancode.h 177:5@
pattern SDL_SCANCODE_PAUSE :: SDL_Scancode
pattern SDL_SCANCODE_PAUSE = SDL_Scancode 72

-- | insert on PC, help on some Mac keyboards (but does send code 73, not 117)
--
--     [C declaration]: @SDL_SCANCODE_INSERT@, defined at @SDL3\/SDL_scancode.h 178:5@
pattern SDL_SCANCODE_INSERT :: SDL_Scancode
pattern SDL_SCANCODE_INSERT = SDL_Scancode 73

-- | [C declaration]: @SDL_SCANCODE_HOME@, defined at @SDL3\/SDL_scancode.h 180:5@
pattern SDL_SCANCODE_HOME :: SDL_Scancode
pattern SDL_SCANCODE_HOME = SDL_Scancode 74

-- | [C declaration]: @SDL_SCANCODE_PAGEUP@, defined at @SDL3\/SDL_scancode.h 181:5@
pattern SDL_SCANCODE_PAGEUP :: SDL_Scancode
pattern SDL_SCANCODE_PAGEUP = SDL_Scancode 75

-- | [C declaration]: @SDL_SCANCODE_DELETE@, defined at @SDL3\/SDL_scancode.h 182:5@
pattern SDL_SCANCODE_DELETE :: SDL_Scancode
pattern SDL_SCANCODE_DELETE = SDL_Scancode 76

-- | [C declaration]: @SDL_SCANCODE_END@, defined at @SDL3\/SDL_scancode.h 183:5@
pattern SDL_SCANCODE_END :: SDL_Scancode
pattern SDL_SCANCODE_END = SDL_Scancode 77

-- | [C declaration]: @SDL_SCANCODE_PAGEDOWN@, defined at @SDL3\/SDL_scancode.h 184:5@
pattern SDL_SCANCODE_PAGEDOWN :: SDL_Scancode
pattern SDL_SCANCODE_PAGEDOWN = SDL_Scancode 78

-- | [C declaration]: @SDL_SCANCODE_RIGHT@, defined at @SDL3\/SDL_scancode.h 185:5@
pattern SDL_SCANCODE_RIGHT :: SDL_Scancode
pattern SDL_SCANCODE_RIGHT = SDL_Scancode 79

-- | [C declaration]: @SDL_SCANCODE_LEFT@, defined at @SDL3\/SDL_scancode.h 186:5@
pattern SDL_SCANCODE_LEFT :: SDL_Scancode
pattern SDL_SCANCODE_LEFT = SDL_Scancode 80

-- | [C declaration]: @SDL_SCANCODE_DOWN@, defined at @SDL3\/SDL_scancode.h 187:5@
pattern SDL_SCANCODE_DOWN :: SDL_Scancode
pattern SDL_SCANCODE_DOWN = SDL_Scancode 81

-- | [C declaration]: @SDL_SCANCODE_UP@, defined at @SDL3\/SDL_scancode.h 188:5@
pattern SDL_SCANCODE_UP :: SDL_Scancode
pattern SDL_SCANCODE_UP = SDL_Scancode 82

-- | num lock on PC, clear on Mac keyboards
--
--     [C declaration]: @SDL_SCANCODE_NUMLOCKCLEAR@, defined at @SDL3\/SDL_scancode.h 190:5@
pattern SDL_SCANCODE_NUMLOCKCLEAR :: SDL_Scancode
pattern SDL_SCANCODE_NUMLOCKCLEAR = SDL_Scancode 83

-- | [C declaration]: @SDL_SCANCODE_KP_DIVIDE@, defined at @SDL3\/SDL_scancode.h 192:5@
pattern SDL_SCANCODE_KP_DIVIDE :: SDL_Scancode
pattern SDL_SCANCODE_KP_DIVIDE = SDL_Scancode 84

-- | [C declaration]: @SDL_SCANCODE_KP_MULTIPLY@, defined at @SDL3\/SDL_scancode.h 193:5@
pattern SDL_SCANCODE_KP_MULTIPLY :: SDL_Scancode
pattern SDL_SCANCODE_KP_MULTIPLY = SDL_Scancode 85

-- | [C declaration]: @SDL_SCANCODE_KP_MINUS@, defined at @SDL3\/SDL_scancode.h 194:5@
pattern SDL_SCANCODE_KP_MINUS :: SDL_Scancode
pattern SDL_SCANCODE_KP_MINUS = SDL_Scancode 86

-- | [C declaration]: @SDL_SCANCODE_KP_PLUS@, defined at @SDL3\/SDL_scancode.h 195:5@
pattern SDL_SCANCODE_KP_PLUS :: SDL_Scancode
pattern SDL_SCANCODE_KP_PLUS = SDL_Scancode 87

-- | [C declaration]: @SDL_SCANCODE_KP_ENTER@, defined at @SDL3\/SDL_scancode.h 196:5@
pattern SDL_SCANCODE_KP_ENTER :: SDL_Scancode
pattern SDL_SCANCODE_KP_ENTER = SDL_Scancode 88

-- | [C declaration]: @SDL_SCANCODE_KP_1@, defined at @SDL3\/SDL_scancode.h 197:5@
pattern SDL_SCANCODE_KP_1 :: SDL_Scancode
pattern SDL_SCANCODE_KP_1 = SDL_Scancode 89

-- | [C declaration]: @SDL_SCANCODE_KP_2@, defined at @SDL3\/SDL_scancode.h 198:5@
pattern SDL_SCANCODE_KP_2 :: SDL_Scancode
pattern SDL_SCANCODE_KP_2 = SDL_Scancode 90

-- | [C declaration]: @SDL_SCANCODE_KP_3@, defined at @SDL3\/SDL_scancode.h 199:5@
pattern SDL_SCANCODE_KP_3 :: SDL_Scancode
pattern SDL_SCANCODE_KP_3 = SDL_Scancode 91

-- | [C declaration]: @SDL_SCANCODE_KP_4@, defined at @SDL3\/SDL_scancode.h 200:5@
pattern SDL_SCANCODE_KP_4 :: SDL_Scancode
pattern SDL_SCANCODE_KP_4 = SDL_Scancode 92

-- | [C declaration]: @SDL_SCANCODE_KP_5@, defined at @SDL3\/SDL_scancode.h 201:5@
pattern SDL_SCANCODE_KP_5 :: SDL_Scancode
pattern SDL_SCANCODE_KP_5 = SDL_Scancode 93

-- | [C declaration]: @SDL_SCANCODE_KP_6@, defined at @SDL3\/SDL_scancode.h 202:5@
pattern SDL_SCANCODE_KP_6 :: SDL_Scancode
pattern SDL_SCANCODE_KP_6 = SDL_Scancode 94

-- | [C declaration]: @SDL_SCANCODE_KP_7@, defined at @SDL3\/SDL_scancode.h 203:5@
pattern SDL_SCANCODE_KP_7 :: SDL_Scancode
pattern SDL_SCANCODE_KP_7 = SDL_Scancode 95

-- | [C declaration]: @SDL_SCANCODE_KP_8@, defined at @SDL3\/SDL_scancode.h 204:5@
pattern SDL_SCANCODE_KP_8 :: SDL_Scancode
pattern SDL_SCANCODE_KP_8 = SDL_Scancode 96

-- | [C declaration]: @SDL_SCANCODE_KP_9@, defined at @SDL3\/SDL_scancode.h 205:5@
pattern SDL_SCANCODE_KP_9 :: SDL_Scancode
pattern SDL_SCANCODE_KP_9 = SDL_Scancode 97

-- | [C declaration]: @SDL_SCANCODE_KP_0@, defined at @SDL3\/SDL_scancode.h 206:5@
pattern SDL_SCANCODE_KP_0 :: SDL_Scancode
pattern SDL_SCANCODE_KP_0 = SDL_Scancode 98

-- | [C declaration]: @SDL_SCANCODE_KP_PERIOD@, defined at @SDL3\/SDL_scancode.h 207:5@
pattern SDL_SCANCODE_KP_PERIOD :: SDL_Scancode
pattern SDL_SCANCODE_KP_PERIOD = SDL_Scancode 99

-- | This is the additional key that ISO keyboards have over ANSI ones, located between left shift and Z. Produces GRAVE ACCENT and TILDE in a US or UK Mac layout, REVERSE SOLIDUS (backslash) and VERTICAL LINE in a US or UK Windows layout, and LESS-THAN SIGN and GREATER-THAN SIGN in a Swiss German, German, or French layout.
--
--     [C declaration]: @SDL_SCANCODE_NONUSBACKSLASH@, defined at @SDL3\/SDL_scancode.h 209:5@
pattern SDL_SCANCODE_NONUSBACKSLASH :: SDL_Scancode
pattern SDL_SCANCODE_NONUSBACKSLASH = SDL_Scancode 100

-- | windows contextual menu, compose
--
--     [C declaration]: @SDL_SCANCODE_APPLICATION@, defined at @SDL3\/SDL_scancode.h 219:5@
pattern SDL_SCANCODE_APPLICATION :: SDL_Scancode
pattern SDL_SCANCODE_APPLICATION = SDL_Scancode 101

-- | The USB document says this is a status flag, not a physical key - but some Mac keyboards do have a power key.
--
--     [C declaration]: @SDL_SCANCODE_POWER@, defined at @SDL3\/SDL_scancode.h 220:5@
pattern SDL_SCANCODE_POWER :: SDL_Scancode
pattern SDL_SCANCODE_POWER = SDL_Scancode 102

-- | [C declaration]: @SDL_SCANCODE_KP_EQUALS@, defined at @SDL3\/SDL_scancode.h 223:5@
pattern SDL_SCANCODE_KP_EQUALS :: SDL_Scancode
pattern SDL_SCANCODE_KP_EQUALS = SDL_Scancode 103

-- | [C declaration]: @SDL_SCANCODE_F13@, defined at @SDL3\/SDL_scancode.h 224:5@
pattern SDL_SCANCODE_F13 :: SDL_Scancode
pattern SDL_SCANCODE_F13 = SDL_Scancode 104

-- | [C declaration]: @SDL_SCANCODE_F14@, defined at @SDL3\/SDL_scancode.h 225:5@
pattern SDL_SCANCODE_F14 :: SDL_Scancode
pattern SDL_SCANCODE_F14 = SDL_Scancode 105

-- | [C declaration]: @SDL_SCANCODE_F15@, defined at @SDL3\/SDL_scancode.h 226:5@
pattern SDL_SCANCODE_F15 :: SDL_Scancode
pattern SDL_SCANCODE_F15 = SDL_Scancode 106

-- | [C declaration]: @SDL_SCANCODE_F16@, defined at @SDL3\/SDL_scancode.h 227:5@
pattern SDL_SCANCODE_F16 :: SDL_Scancode
pattern SDL_SCANCODE_F16 = SDL_Scancode 107

-- | [C declaration]: @SDL_SCANCODE_F17@, defined at @SDL3\/SDL_scancode.h 228:5@
pattern SDL_SCANCODE_F17 :: SDL_Scancode
pattern SDL_SCANCODE_F17 = SDL_Scancode 108

-- | [C declaration]: @SDL_SCANCODE_F18@, defined at @SDL3\/SDL_scancode.h 229:5@
pattern SDL_SCANCODE_F18 :: SDL_Scancode
pattern SDL_SCANCODE_F18 = SDL_Scancode 109

-- | [C declaration]: @SDL_SCANCODE_F19@, defined at @SDL3\/SDL_scancode.h 230:5@
pattern SDL_SCANCODE_F19 :: SDL_Scancode
pattern SDL_SCANCODE_F19 = SDL_Scancode 110

-- | [C declaration]: @SDL_SCANCODE_F20@, defined at @SDL3\/SDL_scancode.h 231:5@
pattern SDL_SCANCODE_F20 :: SDL_Scancode
pattern SDL_SCANCODE_F20 = SDL_Scancode 111

-- | [C declaration]: @SDL_SCANCODE_F21@, defined at @SDL3\/SDL_scancode.h 232:5@
pattern SDL_SCANCODE_F21 :: SDL_Scancode
pattern SDL_SCANCODE_F21 = SDL_Scancode 112

-- | [C declaration]: @SDL_SCANCODE_F22@, defined at @SDL3\/SDL_scancode.h 233:5@
pattern SDL_SCANCODE_F22 :: SDL_Scancode
pattern SDL_SCANCODE_F22 = SDL_Scancode 113

-- | [C declaration]: @SDL_SCANCODE_F23@, defined at @SDL3\/SDL_scancode.h 234:5@
pattern SDL_SCANCODE_F23 :: SDL_Scancode
pattern SDL_SCANCODE_F23 = SDL_Scancode 114

-- | [C declaration]: @SDL_SCANCODE_F24@, defined at @SDL3\/SDL_scancode.h 235:5@
pattern SDL_SCANCODE_F24 :: SDL_Scancode
pattern SDL_SCANCODE_F24 = SDL_Scancode 115

-- | [C declaration]: @SDL_SCANCODE_EXECUTE@, defined at @SDL3\/SDL_scancode.h 236:5@
pattern SDL_SCANCODE_EXECUTE :: SDL_Scancode
pattern SDL_SCANCODE_EXECUTE = SDL_Scancode 116

-- | AL Integrated Help Center
--
--     [C declaration]: @SDL_SCANCODE_HELP@, defined at @SDL3\/SDL_scancode.h 237:5@
pattern SDL_SCANCODE_HELP :: SDL_Scancode
pattern SDL_SCANCODE_HELP = SDL_Scancode 117

-- | Menu (show menu)
--
--     [C declaration]: @SDL_SCANCODE_MENU@, defined at @SDL3\/SDL_scancode.h 238:5@
pattern SDL_SCANCODE_MENU :: SDL_Scancode
pattern SDL_SCANCODE_MENU = SDL_Scancode 118

-- | [C declaration]: @SDL_SCANCODE_SELECT@, defined at @SDL3\/SDL_scancode.h 239:5@
pattern SDL_SCANCODE_SELECT :: SDL_Scancode
pattern SDL_SCANCODE_SELECT = SDL_Scancode 119

-- | AC Stop
--
--     [C declaration]: @SDL_SCANCODE_STOP@, defined at @SDL3\/SDL_scancode.h 240:5@
pattern SDL_SCANCODE_STOP :: SDL_Scancode
pattern SDL_SCANCODE_STOP = SDL_Scancode 120

-- | AC Redo\/Repeat
--
--     [C declaration]: @SDL_SCANCODE_AGAIN@, defined at @SDL3\/SDL_scancode.h 241:5@
pattern SDL_SCANCODE_AGAIN :: SDL_Scancode
pattern SDL_SCANCODE_AGAIN = SDL_Scancode 121

-- | AC Undo
--
--     [C declaration]: @SDL_SCANCODE_UNDO@, defined at @SDL3\/SDL_scancode.h 242:5@
pattern SDL_SCANCODE_UNDO :: SDL_Scancode
pattern SDL_SCANCODE_UNDO = SDL_Scancode 122

-- | AC Cut
--
--     [C declaration]: @SDL_SCANCODE_CUT@, defined at @SDL3\/SDL_scancode.h 243:5@
pattern SDL_SCANCODE_CUT :: SDL_Scancode
pattern SDL_SCANCODE_CUT = SDL_Scancode 123

-- | AC Copy
--
--     [C declaration]: @SDL_SCANCODE_COPY@, defined at @SDL3\/SDL_scancode.h 244:5@
pattern SDL_SCANCODE_COPY :: SDL_Scancode
pattern SDL_SCANCODE_COPY = SDL_Scancode 124

-- | AC Paste
--
--     [C declaration]: @SDL_SCANCODE_PASTE@, defined at @SDL3\/SDL_scancode.h 245:5@
pattern SDL_SCANCODE_PASTE :: SDL_Scancode
pattern SDL_SCANCODE_PASTE = SDL_Scancode 125

-- | AC Find
--
--     [C declaration]: @SDL_SCANCODE_FIND@, defined at @SDL3\/SDL_scancode.h 246:5@
pattern SDL_SCANCODE_FIND :: SDL_Scancode
pattern SDL_SCANCODE_FIND = SDL_Scancode 126

-- | [C declaration]: @SDL_SCANCODE_MUTE@, defined at @SDL3\/SDL_scancode.h 247:5@
pattern SDL_SCANCODE_MUTE :: SDL_Scancode
pattern SDL_SCANCODE_MUTE = SDL_Scancode 127

-- | [C declaration]: @SDL_SCANCODE_VOLUMEUP@, defined at @SDL3\/SDL_scancode.h 248:5@
pattern SDL_SCANCODE_VOLUMEUP :: SDL_Scancode
pattern SDL_SCANCODE_VOLUMEUP = SDL_Scancode 128

-- | [C declaration]: @SDL_SCANCODE_VOLUMEDOWN@, defined at @SDL3\/SDL_scancode.h 249:5@
pattern SDL_SCANCODE_VOLUMEDOWN :: SDL_Scancode
pattern SDL_SCANCODE_VOLUMEDOWN = SDL_Scancode 129

-- | [C declaration]: @SDL_SCANCODE_KP_COMMA@, defined at @SDL3\/SDL_scancode.h 254:5@
pattern SDL_SCANCODE_KP_COMMA :: SDL_Scancode
pattern SDL_SCANCODE_KP_COMMA = SDL_Scancode 133

-- | [C declaration]: @SDL_SCANCODE_KP_EQUALSAS400@, defined at @SDL3\/SDL_scancode.h 255:5@
pattern SDL_SCANCODE_KP_EQUALSAS400 :: SDL_Scancode
pattern SDL_SCANCODE_KP_EQUALSAS400 = SDL_Scancode 134

-- | used on Asian keyboards, see footnotes in USB doc
--
--     [C declaration]: @SDL_SCANCODE_INTERNATIONAL1@, defined at @SDL3\/SDL_scancode.h 257:5@
pattern SDL_SCANCODE_INTERNATIONAL1 :: SDL_Scancode
pattern SDL_SCANCODE_INTERNATIONAL1 = SDL_Scancode 135

-- | [C declaration]: @SDL_SCANCODE_INTERNATIONAL2@, defined at @SDL3\/SDL_scancode.h 259:5@
pattern SDL_SCANCODE_INTERNATIONAL2 :: SDL_Scancode
pattern SDL_SCANCODE_INTERNATIONAL2 = SDL_Scancode 136

-- | Yen
--
--     [C declaration]: @SDL_SCANCODE_INTERNATIONAL3@, defined at @SDL3\/SDL_scancode.h 260:5@
pattern SDL_SCANCODE_INTERNATIONAL3 :: SDL_Scancode
pattern SDL_SCANCODE_INTERNATIONAL3 = SDL_Scancode 137

-- | [C declaration]: @SDL_SCANCODE_INTERNATIONAL4@, defined at @SDL3\/SDL_scancode.h 261:5@
pattern SDL_SCANCODE_INTERNATIONAL4 :: SDL_Scancode
pattern SDL_SCANCODE_INTERNATIONAL4 = SDL_Scancode 138

-- | [C declaration]: @SDL_SCANCODE_INTERNATIONAL5@, defined at @SDL3\/SDL_scancode.h 262:5@
pattern SDL_SCANCODE_INTERNATIONAL5 :: SDL_Scancode
pattern SDL_SCANCODE_INTERNATIONAL5 = SDL_Scancode 139

-- | [C declaration]: @SDL_SCANCODE_INTERNATIONAL6@, defined at @SDL3\/SDL_scancode.h 263:5@
pattern SDL_SCANCODE_INTERNATIONAL6 :: SDL_Scancode
pattern SDL_SCANCODE_INTERNATIONAL6 = SDL_Scancode 140

-- | [C declaration]: @SDL_SCANCODE_INTERNATIONAL7@, defined at @SDL3\/SDL_scancode.h 264:5@
pattern SDL_SCANCODE_INTERNATIONAL7 :: SDL_Scancode
pattern SDL_SCANCODE_INTERNATIONAL7 = SDL_Scancode 141

-- | [C declaration]: @SDL_SCANCODE_INTERNATIONAL8@, defined at @SDL3\/SDL_scancode.h 265:5@
pattern SDL_SCANCODE_INTERNATIONAL8 :: SDL_Scancode
pattern SDL_SCANCODE_INTERNATIONAL8 = SDL_Scancode 142

-- | [C declaration]: @SDL_SCANCODE_INTERNATIONAL9@, defined at @SDL3\/SDL_scancode.h 266:5@
pattern SDL_SCANCODE_INTERNATIONAL9 :: SDL_Scancode
pattern SDL_SCANCODE_INTERNATIONAL9 = SDL_Scancode 143

-- | Hangul\/English toggle
--
--     [C declaration]: @SDL_SCANCODE_LANG1@, defined at @SDL3\/SDL_scancode.h 267:5@
pattern SDL_SCANCODE_LANG1 :: SDL_Scancode
pattern SDL_SCANCODE_LANG1 = SDL_Scancode 144

-- | Hanja conversion
--
--     [C declaration]: @SDL_SCANCODE_LANG2@, defined at @SDL3\/SDL_scancode.h 268:5@
pattern SDL_SCANCODE_LANG2 :: SDL_Scancode
pattern SDL_SCANCODE_LANG2 = SDL_Scancode 145

-- | Katakana
--
--     [C declaration]: @SDL_SCANCODE_LANG3@, defined at @SDL3\/SDL_scancode.h 269:5@
pattern SDL_SCANCODE_LANG3 :: SDL_Scancode
pattern SDL_SCANCODE_LANG3 = SDL_Scancode 146

-- | Hiragana
--
--     [C declaration]: @SDL_SCANCODE_LANG4@, defined at @SDL3\/SDL_scancode.h 270:5@
pattern SDL_SCANCODE_LANG4 :: SDL_Scancode
pattern SDL_SCANCODE_LANG4 = SDL_Scancode 147

-- | Zenkaku\/Hankaku
--
--     [C declaration]: @SDL_SCANCODE_LANG5@, defined at @SDL3\/SDL_scancode.h 271:5@
pattern SDL_SCANCODE_LANG5 :: SDL_Scancode
pattern SDL_SCANCODE_LANG5 = SDL_Scancode 148

-- | reserved
--
--     [C declaration]: @SDL_SCANCODE_LANG6@, defined at @SDL3\/SDL_scancode.h 272:5@
pattern SDL_SCANCODE_LANG6 :: SDL_Scancode
pattern SDL_SCANCODE_LANG6 = SDL_Scancode 149

-- | reserved
--
--     [C declaration]: @SDL_SCANCODE_LANG7@, defined at @SDL3\/SDL_scancode.h 273:5@
pattern SDL_SCANCODE_LANG7 :: SDL_Scancode
pattern SDL_SCANCODE_LANG7 = SDL_Scancode 150

-- | reserved
--
--     [C declaration]: @SDL_SCANCODE_LANG8@, defined at @SDL3\/SDL_scancode.h 274:5@
pattern SDL_SCANCODE_LANG8 :: SDL_Scancode
pattern SDL_SCANCODE_LANG8 = SDL_Scancode 151

-- | reserved
--
--     [C declaration]: @SDL_SCANCODE_LANG9@, defined at @SDL3\/SDL_scancode.h 275:5@
pattern SDL_SCANCODE_LANG9 :: SDL_Scancode
pattern SDL_SCANCODE_LANG9 = SDL_Scancode 152

-- | Erase-Eaze
--
--     [C declaration]: @SDL_SCANCODE_ALTERASE@, defined at @SDL3\/SDL_scancode.h 277:5@
pattern SDL_SCANCODE_ALTERASE :: SDL_Scancode
pattern SDL_SCANCODE_ALTERASE = SDL_Scancode 153

-- | [C declaration]: @SDL_SCANCODE_SYSREQ@, defined at @SDL3\/SDL_scancode.h 278:5@
pattern SDL_SCANCODE_SYSREQ :: SDL_Scancode
pattern SDL_SCANCODE_SYSREQ = SDL_Scancode 154

-- | AC Cancel
--
--     [C declaration]: @SDL_SCANCODE_CANCEL@, defined at @SDL3\/SDL_scancode.h 279:5@
pattern SDL_SCANCODE_CANCEL :: SDL_Scancode
pattern SDL_SCANCODE_CANCEL = SDL_Scancode 155

-- | [C declaration]: @SDL_SCANCODE_CLEAR@, defined at @SDL3\/SDL_scancode.h 280:5@
pattern SDL_SCANCODE_CLEAR :: SDL_Scancode
pattern SDL_SCANCODE_CLEAR = SDL_Scancode 156

-- | [C declaration]: @SDL_SCANCODE_PRIOR@, defined at @SDL3\/SDL_scancode.h 281:5@
pattern SDL_SCANCODE_PRIOR :: SDL_Scancode
pattern SDL_SCANCODE_PRIOR = SDL_Scancode 157

-- | [C declaration]: @SDL_SCANCODE_RETURN2@, defined at @SDL3\/SDL_scancode.h 282:5@
pattern SDL_SCANCODE_RETURN2 :: SDL_Scancode
pattern SDL_SCANCODE_RETURN2 = SDL_Scancode 158

-- | [C declaration]: @SDL_SCANCODE_SEPARATOR@, defined at @SDL3\/SDL_scancode.h 283:5@
pattern SDL_SCANCODE_SEPARATOR :: SDL_Scancode
pattern SDL_SCANCODE_SEPARATOR = SDL_Scancode 159

-- | [C declaration]: @SDL_SCANCODE_OUT@, defined at @SDL3\/SDL_scancode.h 284:5@
pattern SDL_SCANCODE_OUT :: SDL_Scancode
pattern SDL_SCANCODE_OUT = SDL_Scancode 160

-- | [C declaration]: @SDL_SCANCODE_OPER@, defined at @SDL3\/SDL_scancode.h 285:5@
pattern SDL_SCANCODE_OPER :: SDL_Scancode
pattern SDL_SCANCODE_OPER = SDL_Scancode 161

-- | [C declaration]: @SDL_SCANCODE_CLEARAGAIN@, defined at @SDL3\/SDL_scancode.h 286:5@
pattern SDL_SCANCODE_CLEARAGAIN :: SDL_Scancode
pattern SDL_SCANCODE_CLEARAGAIN = SDL_Scancode 162

-- | [C declaration]: @SDL_SCANCODE_CRSEL@, defined at @SDL3\/SDL_scancode.h 287:5@
pattern SDL_SCANCODE_CRSEL :: SDL_Scancode
pattern SDL_SCANCODE_CRSEL = SDL_Scancode 163

-- | [C declaration]: @SDL_SCANCODE_EXSEL@, defined at @SDL3\/SDL_scancode.h 288:5@
pattern SDL_SCANCODE_EXSEL :: SDL_Scancode
pattern SDL_SCANCODE_EXSEL = SDL_Scancode 164

-- | [C declaration]: @SDL_SCANCODE_KP_00@, defined at @SDL3\/SDL_scancode.h 290:5@
pattern SDL_SCANCODE_KP_00 :: SDL_Scancode
pattern SDL_SCANCODE_KP_00 = SDL_Scancode 176

-- | [C declaration]: @SDL_SCANCODE_KP_000@, defined at @SDL3\/SDL_scancode.h 291:5@
pattern SDL_SCANCODE_KP_000 :: SDL_Scancode
pattern SDL_SCANCODE_KP_000 = SDL_Scancode 177

-- | [C declaration]: @SDL_SCANCODE_THOUSANDSSEPARATOR@, defined at @SDL3\/SDL_scancode.h 292:5@
pattern SDL_SCANCODE_THOUSANDSSEPARATOR :: SDL_Scancode
pattern SDL_SCANCODE_THOUSANDSSEPARATOR = SDL_Scancode 178

-- | [C declaration]: @SDL_SCANCODE_DECIMALSEPARATOR@, defined at @SDL3\/SDL_scancode.h 293:5@
pattern SDL_SCANCODE_DECIMALSEPARATOR :: SDL_Scancode
pattern SDL_SCANCODE_DECIMALSEPARATOR = SDL_Scancode 179

-- | [C declaration]: @SDL_SCANCODE_CURRENCYUNIT@, defined at @SDL3\/SDL_scancode.h 294:5@
pattern SDL_SCANCODE_CURRENCYUNIT :: SDL_Scancode
pattern SDL_SCANCODE_CURRENCYUNIT = SDL_Scancode 180

-- | [C declaration]: @SDL_SCANCODE_CURRENCYSUBUNIT@, defined at @SDL3\/SDL_scancode.h 295:5@
pattern SDL_SCANCODE_CURRENCYSUBUNIT :: SDL_Scancode
pattern SDL_SCANCODE_CURRENCYSUBUNIT = SDL_Scancode 181

-- | [C declaration]: @SDL_SCANCODE_KP_LEFTPAREN@, defined at @SDL3\/SDL_scancode.h 296:5@
pattern SDL_SCANCODE_KP_LEFTPAREN :: SDL_Scancode
pattern SDL_SCANCODE_KP_LEFTPAREN = SDL_Scancode 182

-- | [C declaration]: @SDL_SCANCODE_KP_RIGHTPAREN@, defined at @SDL3\/SDL_scancode.h 297:5@
pattern SDL_SCANCODE_KP_RIGHTPAREN :: SDL_Scancode
pattern SDL_SCANCODE_KP_RIGHTPAREN = SDL_Scancode 183

-- | [C declaration]: @SDL_SCANCODE_KP_LEFTBRACE@, defined at @SDL3\/SDL_scancode.h 298:5@
pattern SDL_SCANCODE_KP_LEFTBRACE :: SDL_Scancode
pattern SDL_SCANCODE_KP_LEFTBRACE = SDL_Scancode 184

-- | [C declaration]: @SDL_SCANCODE_KP_RIGHTBRACE@, defined at @SDL3\/SDL_scancode.h 299:5@
pattern SDL_SCANCODE_KP_RIGHTBRACE :: SDL_Scancode
pattern SDL_SCANCODE_KP_RIGHTBRACE = SDL_Scancode 185

-- | [C declaration]: @SDL_SCANCODE_KP_TAB@, defined at @SDL3\/SDL_scancode.h 300:5@
pattern SDL_SCANCODE_KP_TAB :: SDL_Scancode
pattern SDL_SCANCODE_KP_TAB = SDL_Scancode 186

-- | [C declaration]: @SDL_SCANCODE_KP_BACKSPACE@, defined at @SDL3\/SDL_scancode.h 301:5@
pattern SDL_SCANCODE_KP_BACKSPACE :: SDL_Scancode
pattern SDL_SCANCODE_KP_BACKSPACE = SDL_Scancode 187

-- | [C declaration]: @SDL_SCANCODE_KP_A@, defined at @SDL3\/SDL_scancode.h 302:5@
pattern SDL_SCANCODE_KP_A :: SDL_Scancode
pattern SDL_SCANCODE_KP_A = SDL_Scancode 188

-- | [C declaration]: @SDL_SCANCODE_KP_B@, defined at @SDL3\/SDL_scancode.h 303:5@
pattern SDL_SCANCODE_KP_B :: SDL_Scancode
pattern SDL_SCANCODE_KP_B = SDL_Scancode 189

-- | [C declaration]: @SDL_SCANCODE_KP_C@, defined at @SDL3\/SDL_scancode.h 304:5@
pattern SDL_SCANCODE_KP_C :: SDL_Scancode
pattern SDL_SCANCODE_KP_C = SDL_Scancode 190

-- | [C declaration]: @SDL_SCANCODE_KP_D@, defined at @SDL3\/SDL_scancode.h 305:5@
pattern SDL_SCANCODE_KP_D :: SDL_Scancode
pattern SDL_SCANCODE_KP_D = SDL_Scancode 191

-- | [C declaration]: @SDL_SCANCODE_KP_E@, defined at @SDL3\/SDL_scancode.h 306:5@
pattern SDL_SCANCODE_KP_E :: SDL_Scancode
pattern SDL_SCANCODE_KP_E = SDL_Scancode 192

-- | [C declaration]: @SDL_SCANCODE_KP_F@, defined at @SDL3\/SDL_scancode.h 307:5@
pattern SDL_SCANCODE_KP_F :: SDL_Scancode
pattern SDL_SCANCODE_KP_F = SDL_Scancode 193

-- | [C declaration]: @SDL_SCANCODE_KP_XOR@, defined at @SDL3\/SDL_scancode.h 308:5@
pattern SDL_SCANCODE_KP_XOR :: SDL_Scancode
pattern SDL_SCANCODE_KP_XOR = SDL_Scancode 194

-- | [C declaration]: @SDL_SCANCODE_KP_POWER@, defined at @SDL3\/SDL_scancode.h 309:5@
pattern SDL_SCANCODE_KP_POWER :: SDL_Scancode
pattern SDL_SCANCODE_KP_POWER = SDL_Scancode 195

-- | [C declaration]: @SDL_SCANCODE_KP_PERCENT@, defined at @SDL3\/SDL_scancode.h 310:5@
pattern SDL_SCANCODE_KP_PERCENT :: SDL_Scancode
pattern SDL_SCANCODE_KP_PERCENT = SDL_Scancode 196

-- | [C declaration]: @SDL_SCANCODE_KP_LESS@, defined at @SDL3\/SDL_scancode.h 311:5@
pattern SDL_SCANCODE_KP_LESS :: SDL_Scancode
pattern SDL_SCANCODE_KP_LESS = SDL_Scancode 197

-- | [C declaration]: @SDL_SCANCODE_KP_GREATER@, defined at @SDL3\/SDL_scancode.h 312:5@
pattern SDL_SCANCODE_KP_GREATER :: SDL_Scancode
pattern SDL_SCANCODE_KP_GREATER = SDL_Scancode 198

-- | [C declaration]: @SDL_SCANCODE_KP_AMPERSAND@, defined at @SDL3\/SDL_scancode.h 313:5@
pattern SDL_SCANCODE_KP_AMPERSAND :: SDL_Scancode
pattern SDL_SCANCODE_KP_AMPERSAND = SDL_Scancode 199

-- | [C declaration]: @SDL_SCANCODE_KP_DBLAMPERSAND@, defined at @SDL3\/SDL_scancode.h 314:5@
pattern SDL_SCANCODE_KP_DBLAMPERSAND :: SDL_Scancode
pattern SDL_SCANCODE_KP_DBLAMPERSAND = SDL_Scancode 200

-- | [C declaration]: @SDL_SCANCODE_KP_VERTICALBAR@, defined at @SDL3\/SDL_scancode.h 315:5@
pattern SDL_SCANCODE_KP_VERTICALBAR :: SDL_Scancode
pattern SDL_SCANCODE_KP_VERTICALBAR = SDL_Scancode 201

-- | [C declaration]: @SDL_SCANCODE_KP_DBLVERTICALBAR@, defined at @SDL3\/SDL_scancode.h 316:5@
pattern SDL_SCANCODE_KP_DBLVERTICALBAR :: SDL_Scancode
pattern SDL_SCANCODE_KP_DBLVERTICALBAR = SDL_Scancode 202

-- | [C declaration]: @SDL_SCANCODE_KP_COLON@, defined at @SDL3\/SDL_scancode.h 317:5@
pattern SDL_SCANCODE_KP_COLON :: SDL_Scancode
pattern SDL_SCANCODE_KP_COLON = SDL_Scancode 203

-- | [C declaration]: @SDL_SCANCODE_KP_HASH@, defined at @SDL3\/SDL_scancode.h 318:5@
pattern SDL_SCANCODE_KP_HASH :: SDL_Scancode
pattern SDL_SCANCODE_KP_HASH = SDL_Scancode 204

-- | [C declaration]: @SDL_SCANCODE_KP_SPACE@, defined at @SDL3\/SDL_scancode.h 319:5@
pattern SDL_SCANCODE_KP_SPACE :: SDL_Scancode
pattern SDL_SCANCODE_KP_SPACE = SDL_Scancode 205

-- | [C declaration]: @SDL_SCANCODE_KP_AT@, defined at @SDL3\/SDL_scancode.h 320:5@
pattern SDL_SCANCODE_KP_AT :: SDL_Scancode
pattern SDL_SCANCODE_KP_AT = SDL_Scancode 206

-- | [C declaration]: @SDL_SCANCODE_KP_EXCLAM@, defined at @SDL3\/SDL_scancode.h 321:5@
pattern SDL_SCANCODE_KP_EXCLAM :: SDL_Scancode
pattern SDL_SCANCODE_KP_EXCLAM = SDL_Scancode 207

-- | [C declaration]: @SDL_SCANCODE_KP_MEMSTORE@, defined at @SDL3\/SDL_scancode.h 322:5@
pattern SDL_SCANCODE_KP_MEMSTORE :: SDL_Scancode
pattern SDL_SCANCODE_KP_MEMSTORE = SDL_Scancode 208

-- | [C declaration]: @SDL_SCANCODE_KP_MEMRECALL@, defined at @SDL3\/SDL_scancode.h 323:5@
pattern SDL_SCANCODE_KP_MEMRECALL :: SDL_Scancode
pattern SDL_SCANCODE_KP_MEMRECALL = SDL_Scancode 209

-- | [C declaration]: @SDL_SCANCODE_KP_MEMCLEAR@, defined at @SDL3\/SDL_scancode.h 324:5@
pattern SDL_SCANCODE_KP_MEMCLEAR :: SDL_Scancode
pattern SDL_SCANCODE_KP_MEMCLEAR = SDL_Scancode 210

-- | [C declaration]: @SDL_SCANCODE_KP_MEMADD@, defined at @SDL3\/SDL_scancode.h 325:5@
pattern SDL_SCANCODE_KP_MEMADD :: SDL_Scancode
pattern SDL_SCANCODE_KP_MEMADD = SDL_Scancode 211

-- | [C declaration]: @SDL_SCANCODE_KP_MEMSUBTRACT@, defined at @SDL3\/SDL_scancode.h 326:5@
pattern SDL_SCANCODE_KP_MEMSUBTRACT :: SDL_Scancode
pattern SDL_SCANCODE_KP_MEMSUBTRACT = SDL_Scancode 212

-- | [C declaration]: @SDL_SCANCODE_KP_MEMMULTIPLY@, defined at @SDL3\/SDL_scancode.h 327:5@
pattern SDL_SCANCODE_KP_MEMMULTIPLY :: SDL_Scancode
pattern SDL_SCANCODE_KP_MEMMULTIPLY = SDL_Scancode 213

-- | [C declaration]: @SDL_SCANCODE_KP_MEMDIVIDE@, defined at @SDL3\/SDL_scancode.h 328:5@
pattern SDL_SCANCODE_KP_MEMDIVIDE :: SDL_Scancode
pattern SDL_SCANCODE_KP_MEMDIVIDE = SDL_Scancode 214

-- | [C declaration]: @SDL_SCANCODE_KP_PLUSMINUS@, defined at @SDL3\/SDL_scancode.h 329:5@
pattern SDL_SCANCODE_KP_PLUSMINUS :: SDL_Scancode
pattern SDL_SCANCODE_KP_PLUSMINUS = SDL_Scancode 215

-- | [C declaration]: @SDL_SCANCODE_KP_CLEAR@, defined at @SDL3\/SDL_scancode.h 330:5@
pattern SDL_SCANCODE_KP_CLEAR :: SDL_Scancode
pattern SDL_SCANCODE_KP_CLEAR = SDL_Scancode 216

-- | [C declaration]: @SDL_SCANCODE_KP_CLEARENTRY@, defined at @SDL3\/SDL_scancode.h 331:5@
pattern SDL_SCANCODE_KP_CLEARENTRY :: SDL_Scancode
pattern SDL_SCANCODE_KP_CLEARENTRY = SDL_Scancode 217

-- | [C declaration]: @SDL_SCANCODE_KP_BINARY@, defined at @SDL3\/SDL_scancode.h 332:5@
pattern SDL_SCANCODE_KP_BINARY :: SDL_Scancode
pattern SDL_SCANCODE_KP_BINARY = SDL_Scancode 218

-- | [C declaration]: @SDL_SCANCODE_KP_OCTAL@, defined at @SDL3\/SDL_scancode.h 333:5@
pattern SDL_SCANCODE_KP_OCTAL :: SDL_Scancode
pattern SDL_SCANCODE_KP_OCTAL = SDL_Scancode 219

-- | [C declaration]: @SDL_SCANCODE_KP_DECIMAL@, defined at @SDL3\/SDL_scancode.h 334:5@
pattern SDL_SCANCODE_KP_DECIMAL :: SDL_Scancode
pattern SDL_SCANCODE_KP_DECIMAL = SDL_Scancode 220

-- | [C declaration]: @SDL_SCANCODE_KP_HEXADECIMAL@, defined at @SDL3\/SDL_scancode.h 335:5@
pattern SDL_SCANCODE_KP_HEXADECIMAL :: SDL_Scancode
pattern SDL_SCANCODE_KP_HEXADECIMAL = SDL_Scancode 221

-- | [C declaration]: @SDL_SCANCODE_LCTRL@, defined at @SDL3\/SDL_scancode.h 337:5@
pattern SDL_SCANCODE_LCTRL :: SDL_Scancode
pattern SDL_SCANCODE_LCTRL = SDL_Scancode 224

-- | [C declaration]: @SDL_SCANCODE_LSHIFT@, defined at @SDL3\/SDL_scancode.h 338:5@
pattern SDL_SCANCODE_LSHIFT :: SDL_Scancode
pattern SDL_SCANCODE_LSHIFT = SDL_Scancode 225

-- | alt, option
--
--     [C declaration]: @SDL_SCANCODE_LALT@, defined at @SDL3\/SDL_scancode.h 339:5@
pattern SDL_SCANCODE_LALT :: SDL_Scancode
pattern SDL_SCANCODE_LALT = SDL_Scancode 226

-- | windows, command (apple), meta
--
--     [C declaration]: @SDL_SCANCODE_LGUI@, defined at @SDL3\/SDL_scancode.h 340:5@
pattern SDL_SCANCODE_LGUI :: SDL_Scancode
pattern SDL_SCANCODE_LGUI = SDL_Scancode 227

-- | [C declaration]: @SDL_SCANCODE_RCTRL@, defined at @SDL3\/SDL_scancode.h 341:5@
pattern SDL_SCANCODE_RCTRL :: SDL_Scancode
pattern SDL_SCANCODE_RCTRL = SDL_Scancode 228

-- | [C declaration]: @SDL_SCANCODE_RSHIFT@, defined at @SDL3\/SDL_scancode.h 342:5@
pattern SDL_SCANCODE_RSHIFT :: SDL_Scancode
pattern SDL_SCANCODE_RSHIFT = SDL_Scancode 229

-- | alt gr, option
--
--     [C declaration]: @SDL_SCANCODE_RALT@, defined at @SDL3\/SDL_scancode.h 343:5@
pattern SDL_SCANCODE_RALT :: SDL_Scancode
pattern SDL_SCANCODE_RALT = SDL_Scancode 230

-- | windows, command (apple), meta
--
--     [C declaration]: @SDL_SCANCODE_RGUI@, defined at @SDL3\/SDL_scancode.h 344:5@
pattern SDL_SCANCODE_RGUI :: SDL_Scancode
pattern SDL_SCANCODE_RGUI = SDL_Scancode 231

-- | I\'m not sure if this is really not covered by any of the above, but since there\'s a special SDL_KMOD_MODE for it I\'m adding it here
--
--     [C declaration]: @SDL_SCANCODE_MODE@, defined at @SDL3\/SDL_scancode.h 346:5@
pattern SDL_SCANCODE_MODE :: SDL_Scancode
pattern SDL_SCANCODE_MODE = SDL_Scancode 257

-- | Sleep
--
--     [C declaration]: @SDL_SCANCODE_SLEEP@, defined at @SDL3\/SDL_scancode.h 364:5@
pattern SDL_SCANCODE_SLEEP :: SDL_Scancode
pattern SDL_SCANCODE_SLEEP = SDL_Scancode 258

-- | Wake
--
--     [C declaration]: @SDL_SCANCODE_WAKE@, defined at @SDL3\/SDL_scancode.h 365:5@
pattern SDL_SCANCODE_WAKE :: SDL_Scancode
pattern SDL_SCANCODE_WAKE = SDL_Scancode 259

-- | Channel Increment
--
--     [C declaration]: @SDL_SCANCODE_CHANNEL_INCREMENT@, defined at @SDL3\/SDL_scancode.h 367:5@
pattern SDL_SCANCODE_CHANNEL_INCREMENT :: SDL_Scancode
pattern SDL_SCANCODE_CHANNEL_INCREMENT = SDL_Scancode 260

-- | Channel Decrement
--
--     [C declaration]: @SDL_SCANCODE_CHANNEL_DECREMENT@, defined at @SDL3\/SDL_scancode.h 368:5@
pattern SDL_SCANCODE_CHANNEL_DECREMENT :: SDL_Scancode
pattern SDL_SCANCODE_CHANNEL_DECREMENT = SDL_Scancode 261

-- | Play
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_PLAY@, defined at @SDL3\/SDL_scancode.h 370:5@
pattern SDL_SCANCODE_MEDIA_PLAY :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_PLAY = SDL_Scancode 262

-- | Pause
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_PAUSE@, defined at @SDL3\/SDL_scancode.h 371:5@
pattern SDL_SCANCODE_MEDIA_PAUSE :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_PAUSE = SDL_Scancode 263

-- | Record
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_RECORD@, defined at @SDL3\/SDL_scancode.h 372:5@
pattern SDL_SCANCODE_MEDIA_RECORD :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_RECORD = SDL_Scancode 264

-- | Fast Forward
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_FAST_FORWARD@, defined at @SDL3\/SDL_scancode.h 373:5@
pattern SDL_SCANCODE_MEDIA_FAST_FORWARD :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_FAST_FORWARD = SDL_Scancode 265

-- | Rewind
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_REWIND@, defined at @SDL3\/SDL_scancode.h 374:5@
pattern SDL_SCANCODE_MEDIA_REWIND :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_REWIND = SDL_Scancode 266

-- | Next Track
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_NEXT_TRACK@, defined at @SDL3\/SDL_scancode.h 375:5@
pattern SDL_SCANCODE_MEDIA_NEXT_TRACK :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_NEXT_TRACK = SDL_Scancode 267

-- | Previous Track
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_PREVIOUS_TRACK@, defined at @SDL3\/SDL_scancode.h 376:5@
pattern SDL_SCANCODE_MEDIA_PREVIOUS_TRACK :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_PREVIOUS_TRACK = SDL_Scancode 268

-- | Stop
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_STOP@, defined at @SDL3\/SDL_scancode.h 377:5@
pattern SDL_SCANCODE_MEDIA_STOP :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_STOP = SDL_Scancode 269

-- | Eject
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_EJECT@, defined at @SDL3\/SDL_scancode.h 378:5@
pattern SDL_SCANCODE_MEDIA_EJECT :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_EJECT = SDL_Scancode 270

-- | Play \/ Pause
--
--     [C declaration]: @SDL_SCANCODE_MEDIA_PLAY_PAUSE@, defined at @SDL3\/SDL_scancode.h 379:5@
pattern SDL_SCANCODE_MEDIA_PLAY_PAUSE :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_PLAY_PAUSE = SDL_Scancode 271

-- | [C declaration]: @SDL_SCANCODE_MEDIA_SELECT@, defined at @SDL3\/SDL_scancode.h 380:5@
pattern SDL_SCANCODE_MEDIA_SELECT :: SDL_Scancode
pattern SDL_SCANCODE_MEDIA_SELECT = SDL_Scancode 272

-- | AC New
--
--     [C declaration]: @SDL_SCANCODE_AC_NEW@, defined at @SDL3\/SDL_scancode.h 382:5@
pattern SDL_SCANCODE_AC_NEW :: SDL_Scancode
pattern SDL_SCANCODE_AC_NEW = SDL_Scancode 273

-- | AC Open
--
--     [C declaration]: @SDL_SCANCODE_AC_OPEN@, defined at @SDL3\/SDL_scancode.h 383:5@
pattern SDL_SCANCODE_AC_OPEN :: SDL_Scancode
pattern SDL_SCANCODE_AC_OPEN = SDL_Scancode 274

-- | AC Close
--
--     [C declaration]: @SDL_SCANCODE_AC_CLOSE@, defined at @SDL3\/SDL_scancode.h 384:5@
pattern SDL_SCANCODE_AC_CLOSE :: SDL_Scancode
pattern SDL_SCANCODE_AC_CLOSE = SDL_Scancode 275

-- | AC Exit
--
--     [C declaration]: @SDL_SCANCODE_AC_EXIT@, defined at @SDL3\/SDL_scancode.h 385:5@
pattern SDL_SCANCODE_AC_EXIT :: SDL_Scancode
pattern SDL_SCANCODE_AC_EXIT = SDL_Scancode 276

-- | AC Save
--
--     [C declaration]: @SDL_SCANCODE_AC_SAVE@, defined at @SDL3\/SDL_scancode.h 386:5@
pattern SDL_SCANCODE_AC_SAVE :: SDL_Scancode
pattern SDL_SCANCODE_AC_SAVE = SDL_Scancode 277

-- | AC Print
--
--     [C declaration]: @SDL_SCANCODE_AC_PRINT@, defined at @SDL3\/SDL_scancode.h 387:5@
pattern SDL_SCANCODE_AC_PRINT :: SDL_Scancode
pattern SDL_SCANCODE_AC_PRINT = SDL_Scancode 278

-- | AC Properties
--
--     [C declaration]: @SDL_SCANCODE_AC_PROPERTIES@, defined at @SDL3\/SDL_scancode.h 388:5@
pattern SDL_SCANCODE_AC_PROPERTIES :: SDL_Scancode
pattern SDL_SCANCODE_AC_PROPERTIES = SDL_Scancode 279

-- | AC Search
--
--     [C declaration]: @SDL_SCANCODE_AC_SEARCH@, defined at @SDL3\/SDL_scancode.h 390:5@
pattern SDL_SCANCODE_AC_SEARCH :: SDL_Scancode
pattern SDL_SCANCODE_AC_SEARCH = SDL_Scancode 280

-- | AC Home
--
--     [C declaration]: @SDL_SCANCODE_AC_HOME@, defined at @SDL3\/SDL_scancode.h 391:5@
pattern SDL_SCANCODE_AC_HOME :: SDL_Scancode
pattern SDL_SCANCODE_AC_HOME = SDL_Scancode 281

-- | AC Back
--
--     [C declaration]: @SDL_SCANCODE_AC_BACK@, defined at @SDL3\/SDL_scancode.h 392:5@
pattern SDL_SCANCODE_AC_BACK :: SDL_Scancode
pattern SDL_SCANCODE_AC_BACK = SDL_Scancode 282

-- | AC Forward
--
--     [C declaration]: @SDL_SCANCODE_AC_FORWARD@, defined at @SDL3\/SDL_scancode.h 393:5@
pattern SDL_SCANCODE_AC_FORWARD :: SDL_Scancode
pattern SDL_SCANCODE_AC_FORWARD = SDL_Scancode 283

-- | AC Stop
--
--     [C declaration]: @SDL_SCANCODE_AC_STOP@, defined at @SDL3\/SDL_scancode.h 394:5@
pattern SDL_SCANCODE_AC_STOP :: SDL_Scancode
pattern SDL_SCANCODE_AC_STOP = SDL_Scancode 284

-- | AC Refresh
--
--     [C declaration]: @SDL_SCANCODE_AC_REFRESH@, defined at @SDL3\/SDL_scancode.h 395:5@
pattern SDL_SCANCODE_AC_REFRESH :: SDL_Scancode
pattern SDL_SCANCODE_AC_REFRESH = SDL_Scancode 285

-- | AC Bookmarks
--
--     [C declaration]: @SDL_SCANCODE_AC_BOOKMARKS@, defined at @SDL3\/SDL_scancode.h 396:5@
pattern SDL_SCANCODE_AC_BOOKMARKS :: SDL_Scancode
pattern SDL_SCANCODE_AC_BOOKMARKS = SDL_Scancode 286

-- | Usually situated below the display on phones and used as a multi-function feature key for selecting a software defined function shown on the bottom left of the display.
--
--     [C declaration]: @SDL_SCANCODE_SOFTLEFT@, defined at @SDL3\/SDL_scancode.h 408:5@
pattern SDL_SCANCODE_SOFTLEFT :: SDL_Scancode
pattern SDL_SCANCODE_SOFTLEFT = SDL_Scancode 287

-- | Usually situated below the display on phones and used as a multi-function feature key for selecting a software defined function shown on the bottom right of the display.
--
--     [C declaration]: @SDL_SCANCODE_SOFTRIGHT@, defined at @SDL3\/SDL_scancode.h 412:5@
pattern SDL_SCANCODE_SOFTRIGHT :: SDL_Scancode
pattern SDL_SCANCODE_SOFTRIGHT = SDL_Scancode 288

-- | Used for accepting phone calls.
--
--     [C declaration]: @SDL_SCANCODE_CALL@, defined at @SDL3\/SDL_scancode.h 416:5@
pattern SDL_SCANCODE_CALL :: SDL_Scancode
pattern SDL_SCANCODE_CALL = SDL_Scancode 289

-- | Used for rejecting phone calls.
--
--     [C declaration]: @SDL_SCANCODE_ENDCALL@, defined at @SDL3\/SDL_scancode.h 417:5@
pattern SDL_SCANCODE_ENDCALL :: SDL_Scancode
pattern SDL_SCANCODE_ENDCALL = SDL_Scancode 290

-- | 400-500 reserved for dynamic keycodes
--
--     [C declaration]: @SDL_SCANCODE_RESERVED@, defined at @SDL3\/SDL_scancode.h 423:5@
pattern SDL_SCANCODE_RESERVED :: SDL_Scancode
pattern SDL_SCANCODE_RESERVED = SDL_Scancode 400

-- | not a key, just marks the number of scancodes for array bounds
--
--     [C declaration]: @SDL_SCANCODE_COUNT@, defined at @SDL3\/SDL_scancode.h 425:5@
pattern SDL_SCANCODE_COUNT :: SDL_Scancode
pattern SDL_SCANCODE_COUNT = SDL_Scancode 512
