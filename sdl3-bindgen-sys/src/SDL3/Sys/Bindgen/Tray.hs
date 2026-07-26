{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | SDL offers a way to add items to the \"system tray\" (more correctly called the \"notification area\" on Windows). On platforms that offer this concept, an SDL app can add a tray icon, submenus, checkboxes, and clickable entries, and register a callback that is fired when the user clicks on these pieces. An opaque handle representing a toplevel system tray object.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Tray (
  SDL3.Sys.Bindgen.Tray.SDL_Tray,
  SDL3.Sys.Bindgen.Tray.SDL_TrayMenu,
  SDL3.Sys.Bindgen.Tray.SDL_TrayEntry,
  SDL3.Sys.Bindgen.Tray.SDL_TrayEntryFlags (..),
  SDL3.Sys.Bindgen.Tray.sDL_TRAYENTRY_BUTTON,
  SDL3.Sys.Bindgen.Tray.sDL_TRAYENTRY_CHECKBOX,
  SDL3.Sys.Bindgen.Tray.sDL_TRAYENTRY_SUBMENU,
  SDL3.Sys.Bindgen.Tray.sDL_TRAYENTRY_DISABLED,
  SDL3.Sys.Bindgen.Tray.sDL_TRAYENTRY_CHECKED,
  SDL3.Sys.Bindgen.Tray.SDL_TrayCallback_Aux (..),
  SDL3.Sys.Bindgen.Tray.SDL_TrayCallback (..),
)
where

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @struct SDL_Tray@, defined at @SDL3\/SDL_tray.h 51:16@
data SDL_Tray

-- | An opaque handle representing a menu\/submenu on a system tray object.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_TrayMenu@, defined at @SDL3\/SDL_tray.h 58:16@
data SDL_TrayMenu

-- | An opaque handle representing an entry on a system tray object.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_TrayEntry@, defined at @SDL3\/SDL_tray.h 65:16@
data SDL_TrayEntry

-- | Flags that control the creation of system tray entries.
--
--     Some of these flags are required; exactly one of them must be specified at the time a tray entry is created. Other flags are optional; zero or more of those can be OR\'ed together with the required flag.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_InsertTrayEntryAt'
--
--     [C declaration]: @SDL_TrayEntryFlags@, defined at @SDL3\/SDL_tray.h 78:16@
newtype SDL_TrayEntryFlags = SDL_TrayEntryFlags
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
  => BG.CompatHasField.HasField "unwrap" SDL_TrayEntryFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TrayEntryFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_TrayEntryFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TrayEntryFlags "unwrap" where
  type
    CFieldType SDL_TrayEntryFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Make the entry a simple button. Required.
--
--     [C declaration]: @macro SDL_TRAYENTRY_BUTTON@, defined at @SDL3\/SDL_tray.h 80:9@
sDL_TRAYENTRY_BUTTON :: BG.CUInt
sDL_TRAYENTRY_BUTTON = (1 :: BG.CUInt)

-- | Make the entry a checkbox. Required.
--
--     [C declaration]: @macro SDL_TRAYENTRY_CHECKBOX@, defined at @SDL3\/SDL_tray.h 81:9@
sDL_TRAYENTRY_CHECKBOX :: BG.CUInt
sDL_TRAYENTRY_CHECKBOX = (2 :: BG.CUInt)

-- | Prepare the entry to have a submenu. Required
--
--     [C declaration]: @macro SDL_TRAYENTRY_SUBMENU@, defined at @SDL3\/SDL_tray.h 82:9@
sDL_TRAYENTRY_SUBMENU :: BG.CUInt
sDL_TRAYENTRY_SUBMENU = (4 :: BG.CUInt)

-- | Make the entry disabled. Optional.
--
--     [C declaration]: @macro SDL_TRAYENTRY_DISABLED@, defined at @SDL3\/SDL_tray.h 83:9@
sDL_TRAYENTRY_DISABLED :: BG.CUInt
sDL_TRAYENTRY_DISABLED = (2147483648 :: BG.CUInt)

-- | Make the entry checked. This is valid only for checkboxes. Optional.
--
--     [C declaration]: @macro SDL_TRAYENTRY_CHECKED@, defined at @SDL3\/SDL_tray.h 84:9@
sDL_TRAYENTRY_CHECKED :: BG.CUInt
sDL_TRAYENTRY_CHECKED = (1073741824 :: BG.CUInt)

-- | Auxiliary type used by 'SDL_TrayCallback'
--
--     [C declaration]: @SDL_TrayCallback@, defined at @SDL3\/SDL_tray.h 97:24@
newtype SDL_TrayCallback_Aux = SDL_TrayCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> BG.Ptr SDL_TrayEntry -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_TrayCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_6a8b13b7097ccaf5_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toSDL_TrayCallback_Aux@
hs_bindgen_6a8b13b7097ccaf5
  :: SDL_TrayCallback_Aux
  -> IO (BG.FunPtr SDL_TrayCallback_Aux)
hs_bindgen_6a8b13b7097ccaf5 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_6a8b13b7097ccaf5_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_TrayCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_0aa010ee3dd2ffa9_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_TrayCallback_Aux@
hs_bindgen_0aa010ee3dd2ffa9
  :: BG.FunPtr SDL_TrayCallback_Aux
  -> SDL_TrayCallback_Aux
hs_bindgen_0aa010ee3dd2ffa9 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_0aa010ee3dd2ffa9_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_TrayCallback_Aux where
  toFunPtr = hs_bindgen_6a8b13b7097ccaf5

instance BG.FromFunPtr SDL_TrayCallback_Aux where
  fromFunPtr = hs_bindgen_0aa010ee3dd2ffa9

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr SDL_TrayEntry -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_TrayCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TrayCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr SDL_TrayEntry -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_TrayCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TrayCallback_Aux "unwrap" where
  type
    CFieldType SDL_TrayCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> BG.Ptr SDL_TrayEntry -> IO ()

  offset# = \_ -> \_ -> 0

-- | A callback that is invoked when a tray entry is selected.
--
--     [@userdata@]: an optional pointer to pass extra data to the callback when it will be invoked.
--
--     [@entry@]: the tray entry that was selected.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetTrayEntryCallback'
--
--     [C declaration]: @SDL_TrayCallback@, defined at @SDL3\/SDL_tray.h 97:24@
newtype SDL_TrayCallback = SDL_TrayCallback
  { unwrap :: BG.FunPtr SDL_TrayCallback_Aux
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
  (ty ~ BG.FunPtr SDL_TrayCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_TrayCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TrayCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_TrayCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_TrayCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TrayCallback "unwrap" where
  type
    CFieldType SDL_TrayCallback "unwrap" =
      BG.FunPtr SDL_TrayCallback_Aux

  offset# = \_ -> \_ -> 0
