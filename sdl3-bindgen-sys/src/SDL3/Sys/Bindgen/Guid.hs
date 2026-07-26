{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | A GUID is a 128-bit value that represents something that is uniquely identifiable by this value: \"globally unique.\"
--
--     SDL provides functions to convert a GUID to\/from a string. An 'SDL_GUID' is a 128-bit identifier for an input device that identifies that device across runs of SDL programs on the same platform.
--
--     If the device is detached and then re-attached to a different port, or if the base system is rebooted, the device should still report the same GUID.
--
--     GUIDs are as precise as possible but are not guaranteed to distinguish physically distinct but equivalent devices. For example, two game controllers from the same vendor with the same product ID and revision may have the same GUID.
--
--     GUIDs may be platform-dependent (i.e., the same device may report different GUIDs on different operating systems).
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Guid (
  SDL3.Sys.Bindgen.Guid.SDL_GUID (..),
)
where

import HsBindgen.Runtime.ConstantArray qualified as CA
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @struct SDL_GUID@, defined at @SDL3\/SDL_guid.h 61:16@
data SDL_GUID = SDL_GUID
  { data' :: CA.ConstantArray 16 SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^ [C declaration]: @data@, defined at @SDL3\/SDL_guid.h 62:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_GUID where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (1 :: Int)

instance Marshal.ReadRaw SDL_GUID where
  readRaw =
    \ptr0 ->
      pure SDL_GUID
        <*> HasCField.readRaw (BG.Proxy @"data'") ptr0

instance Marshal.WriteRaw SDL_GUID where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_GUID data'2 ->
            HasCField.writeRaw (BG.Proxy @"data'") ptr0 data'2

deriving via Marshal.EquivStorable SDL_GUID instance BG.Storable SDL_GUID

instance
  (ty ~ CA.ConstantArray 16 SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.CompatHasField.HasField "data'" SDL_GUID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GUID{data' = y1}
      , BG.getField @"data'" x0
      )

instance
  (ty ~ CA.ConstantArray 16 SDL3.Sys.Bindgen.Stdinc.Uint8)
  => BG.HasField "data'" (BG.Ptr SDL_GUID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"data'")

instance HasCField.HasCField SDL_GUID "data'" where
  type
    CFieldType SDL_GUID "data'" =
      CA.ConstantArray 16 SDL3.Sys.Bindgen.Stdinc.Uint8

  offset# = \_ -> \_ -> 0
