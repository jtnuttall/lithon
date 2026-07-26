{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | Functions to creating Metal layers and views on SDL windows.
--
--     This provides some platform-specific glue for Apple platforms. Most macOS and iOS apps can use SDL without these functions, but this API they can be useful for specific OS-level integration tasks. A handle to a CAMetalLayer-backed NSView (macOS) or UIView (iOS\/tvOS).
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Metal (
  SDL3.Sys.Bindgen.Metal.SDL_MetalView (..),
)
where

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @SDL_MetalView@, defined at @SDL3\/SDL_metal.h 48:15@
newtype SDL_MetalView = SDL_MetalView
  { unwrap :: BG.Ptr BG.Void
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
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "unwrap" SDL_MetalView ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MetalView{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "unwrap" (BG.Ptr SDL_MetalView) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MetalView "unwrap" where
  type
    CFieldType SDL_MetalView "unwrap" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 0
