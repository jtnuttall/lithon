{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
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

module SDL3.Sys.Bindgen.Vulkan (
  SDL3.Sys.Bindgen.Vulkan.VkInstance (..),
  SDL3.Sys.Bindgen.Vulkan.VkInstance_T,
  SDL3.Sys.Bindgen.Vulkan.VkPhysicalDevice (..),
  SDL3.Sys.Bindgen.Vulkan.VkPhysicalDevice_T,
  SDL3.Sys.Bindgen.Vulkan.VkSurfaceKHR (..),
  SDL3.Sys.Bindgen.Vulkan.VkSurfaceKHR_T,
  SDL3.Sys.Bindgen.Vulkan.VkAllocationCallbacks,
)
where

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @VkInstance@, defined at @SDL3\/SDL_vulkan.h 67:1@
newtype VkInstance = VkInstance
  { unwrap :: BG.Ptr VkInstance_T
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
  (ty ~ BG.Ptr VkInstance_T)
  => BG.CompatHasField.HasField "unwrap" VkInstance ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          VkInstance{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.Ptr VkInstance_T)
  => BG.HasField "unwrap" (BG.Ptr VkInstance) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField VkInstance "unwrap" where
  type
    CFieldType VkInstance "unwrap" =
      BG.Ptr VkInstance_T

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @struct VkInstance_T@, defined at @SDL3\/SDL_vulkan.h 67:1@
data VkInstance_T

-- | [C declaration]: @VkPhysicalDevice@, defined at @SDL3\/SDL_vulkan.h 68:1@
newtype VkPhysicalDevice = VkPhysicalDevice
  { unwrap :: BG.Ptr VkPhysicalDevice_T
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
  (ty ~ BG.Ptr VkPhysicalDevice_T)
  => BG.CompatHasField.HasField "unwrap" VkPhysicalDevice ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          VkPhysicalDevice{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.Ptr VkPhysicalDevice_T)
  => BG.HasField "unwrap" (BG.Ptr VkPhysicalDevice) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField VkPhysicalDevice "unwrap" where
  type
    CFieldType VkPhysicalDevice "unwrap" =
      BG.Ptr VkPhysicalDevice_T

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @struct VkPhysicalDevice_T@, defined at @SDL3\/SDL_vulkan.h 68:1@
data VkPhysicalDevice_T

-- | [C declaration]: @VkSurfaceKHR@, defined at @SDL3\/SDL_vulkan.h 69:1@
newtype VkSurfaceKHR = VkSurfaceKHR
  { unwrap :: BG.Ptr VkSurfaceKHR_T
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
  (ty ~ BG.Ptr VkSurfaceKHR_T)
  => BG.CompatHasField.HasField "unwrap" VkSurfaceKHR ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          VkSurfaceKHR{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.Ptr VkSurfaceKHR_T)
  => BG.HasField "unwrap" (BG.Ptr VkSurfaceKHR) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField VkSurfaceKHR "unwrap" where
  type
    CFieldType VkSurfaceKHR "unwrap" =
      BG.Ptr VkSurfaceKHR_T

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @struct VkSurfaceKHR_T@, defined at @SDL3\/SDL_vulkan.h 69:1@
data VkSurfaceKHR_T

-- | [C declaration]: @struct VkAllocationCallbacks@, defined at @SDL3\/SDL_vulkan.h 70:8@
data VkAllocationCallbacks
