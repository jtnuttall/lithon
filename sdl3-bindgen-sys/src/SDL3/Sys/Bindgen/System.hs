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

module SDL3.Sys.Bindgen.System (
  SDL3.Sys.Bindgen.System.XEvent,
  SDL3.Sys.Bindgen.System.SDL_X11EventHook_Aux (..),
  SDL3.Sys.Bindgen.System.SDL_X11EventHook (..),
  SDL3.Sys.Bindgen.System.SDL_Sandbox (..),
  pattern SDL3.Sys.Bindgen.System.SDL_SANDBOX_NONE,
  pattern SDL3.Sys.Bindgen.System.SDL_SANDBOX_UNKNOWN_CONTAINER,
  pattern SDL3.Sys.Bindgen.System.SDL_SANDBOX_FLATPAK,
  pattern SDL3.Sys.Bindgen.System.SDL_SANDBOX_SNAP,
  pattern SDL3.Sys.Bindgen.System.SDL_SANDBOX_MACOS,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @union _XEvent@, defined at @SDL3\/SDL_system.h 141:15@
data XEvent

-- | Auxiliary type used by 'SDL_X11EventHook'
--
--     [C declaration]: @SDL_X11EventHook@, defined at @SDL3\/SDL_system.h 163:24@
newtype SDL_X11EventHook_Aux = SDL_X11EventHook_Aux
  { unwrap :: BG.Ptr BG.Void -> BG.Ptr XEvent -> IO BG.CBool
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_X11EventHook_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_74aa64577de95c6c_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word8)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word8))

-- __unique:__ @toSDL_X11EventHook_Aux@
hs_bindgen_74aa64577de95c6c
  :: SDL_X11EventHook_Aux
  -> IO (BG.FunPtr SDL_X11EventHook_Aux)
hs_bindgen_74aa64577de95c6c =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_74aa64577de95c6c_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_X11EventHook_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_cc5ab09f101f43e5_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word8)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @fromSDL_X11EventHook_Aux@
hs_bindgen_cc5ab09f101f43e5
  :: BG.FunPtr SDL_X11EventHook_Aux
  -> SDL_X11EventHook_Aux
hs_bindgen_cc5ab09f101f43e5 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_cc5ab09f101f43e5_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_X11EventHook_Aux where
  toFunPtr = hs_bindgen_74aa64577de95c6c

instance BG.FromFunPtr SDL_X11EventHook_Aux where
  fromFunPtr = hs_bindgen_cc5ab09f101f43e5

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr XEvent -> IO BG.CBool))
  => BG.CompatHasField.HasField "unwrap" SDL_X11EventHook_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_X11EventHook_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr XEvent -> IO BG.CBool))
  => BG.HasField "unwrap" (BG.Ptr SDL_X11EventHook_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_X11EventHook_Aux "unwrap" where
  type
    CFieldType SDL_X11EventHook_Aux "unwrap" =
      BG.Ptr BG.Void -> BG.Ptr XEvent -> IO BG.CBool

  offset# = \_ -> \_ -> 0

-- | A callback to be used with SDL_SetX11EventHook.
--
--     This callback may modify the event, and should return true if the event should continue to be processed, or false to prevent further processing.
--
--     As this is processing an event directly from the X11 event loop, this callback should do the minimum required work and return quickly.
--
--     [@userdata@]: the app-defined pointer provided to SDL_SetX11EventHook.
--
--     [@xevent@]: a pointer to an Xlib 'XEvent' union to process.
--
--     [Returns]: true to let event continue on, false to drop it.
--
--     [Thread safety]: This may only be called (by SDL) from the thread handling the X11 event loop.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetX11EventHook'
--
--     [C declaration]: @SDL_X11EventHook@, defined at @SDL3\/SDL_system.h 163:24@
newtype SDL_X11EventHook = SDL_X11EventHook
  { unwrap :: BG.FunPtr SDL_X11EventHook_Aux
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
  (ty ~ BG.FunPtr SDL_X11EventHook_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_X11EventHook ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_X11EventHook{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_X11EventHook_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_X11EventHook) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_X11EventHook "unwrap" where
  type
    CFieldType SDL_X11EventHook "unwrap" =
      BG.FunPtr SDL_X11EventHook_Aux

  offset# = \_ -> \_ -> 0

-- | Application sandbox environment.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_Sandbox@, defined at @SDL3\/SDL_system.h 650:14@
newtype SDL_Sandbox = SDL_Sandbox
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_Sandbox where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_Sandbox where
  readRaw =
    \ptr0 ->
      pure SDL_Sandbox
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_Sandbox where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Sandbox unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_Sandbox instance BG.Storable SDL_Sandbox

deriving via BG.CUInt instance BG.Prim SDL_Sandbox

instance CEnum.CEnum SDL_Sandbox where
  type CEnumZ SDL_Sandbox = BG.CUInt

  toCEnum = SDL_Sandbox

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_SANDBOX_NONE")
        , (1, BG.singleton "SDL_SANDBOX_UNKNOWN_CONTAINER")
        , (2, BG.singleton "SDL_SANDBOX_FLATPAK")
        , (3, BG.singleton "SDL_SANDBOX_SNAP")
        , (4, BG.singleton "SDL_SANDBOX_MACOS")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_Sandbox"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_Sandbox"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_Sandbox where
  minDeclaredValue = SDL_SANDBOX_NONE

  maxDeclaredValue = SDL_SANDBOX_MACOS

instance Show SDL_Sandbox where
  showsPrec = CEnum.shows

instance Read SDL_Sandbox where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_Sandbox ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Sandbox{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_Sandbox) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_Sandbox "unwrap" where
  type CFieldType SDL_Sandbox "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_SANDBOX_NONE@, defined at @SDL3\/SDL_system.h 652:5@
pattern SDL_SANDBOX_NONE :: SDL_Sandbox
pattern SDL_SANDBOX_NONE = SDL_Sandbox 0

-- | [C declaration]: @SDL_SANDBOX_UNKNOWN_CONTAINER@, defined at @SDL3\/SDL_system.h 653:5@
pattern SDL_SANDBOX_UNKNOWN_CONTAINER :: SDL_Sandbox
pattern SDL_SANDBOX_UNKNOWN_CONTAINER = SDL_Sandbox 1

-- | [C declaration]: @SDL_SANDBOX_FLATPAK@, defined at @SDL3\/SDL_system.h 654:5@
pattern SDL_SANDBOX_FLATPAK :: SDL_Sandbox
pattern SDL_SANDBOX_FLATPAK = SDL_Sandbox 2

-- | [C declaration]: @SDL_SANDBOX_SNAP@, defined at @SDL3\/SDL_system.h 655:5@
pattern SDL_SANDBOX_SNAP :: SDL_Sandbox
pattern SDL_SANDBOX_SNAP = SDL_Sandbox 3

-- | [C declaration]: @SDL_SANDBOX_MACOS@, defined at @SDL3\/SDL_system.h 656:5@
pattern SDL_SANDBOX_MACOS :: SDL_Sandbox
pattern SDL_SANDBOX_MACOS = SDL_Sandbox 4
