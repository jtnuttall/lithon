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

-- | A property is a variable that can be created and retrieved by name at runtime.
--
--     All properties are part of a property group ('SDL_PropertiesID'). A property group can be created with the SDL_CreateProperties function and destroyed with the SDL_DestroyProperties function.
--
--     Properties can be added to and retrieved from a property group through the following functions:
--
--     * SDL_SetPointerProperty and SDL_GetPointerProperty operate on @void*@ pointer types.
--
--     * SDL_SetStringProperty and SDL_GetStringProperty operate on string types.
--
--     * SDL_SetNumberProperty and SDL_GetNumberProperty operate on signed 64-bit integer types.
--
--     * SDL_SetFloatProperty and SDL_GetFloatProperty operate on floating point types.
--
--     * SDL_SetBooleanProperty and SDL_GetBooleanProperty operate on boolean types.
--
--     Properties can be removed from a group by using SDL_ClearProperty. An ID that represents a properties set.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Properties (
  SDL3.Sys.Bindgen.Properties.SDL_PropertiesID (..),
  SDL3.Sys.Bindgen.Properties.SDL_PropertyType (..),
  pattern SDL3.Sys.Bindgen.Properties.SDL_PROPERTY_TYPE_INVALID,
  pattern SDL3.Sys.Bindgen.Properties.SDL_PROPERTY_TYPE_POINTER,
  pattern SDL3.Sys.Bindgen.Properties.SDL_PROPERTY_TYPE_STRING,
  pattern SDL3.Sys.Bindgen.Properties.SDL_PROPERTY_TYPE_NUMBER,
  pattern SDL3.Sys.Bindgen.Properties.SDL_PROPERTY_TYPE_FLOAT,
  pattern SDL3.Sys.Bindgen.Properties.SDL_PROPERTY_TYPE_BOOLEAN,
  SDL3.Sys.Bindgen.Properties.sDL_PROP_NAME_STRING,
  SDL3.Sys.Bindgen.Properties.SDL_CleanupPropertyCallback_Aux (..),
  SDL3.Sys.Bindgen.Properties.SDL_CleanupPropertyCallback (..),
  SDL3.Sys.Bindgen.Properties.SDL_EnumeratePropertiesCallback_Aux (..),
  SDL3.Sys.Bindgen.Properties.SDL_EnumeratePropertiesCallback (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_PropertiesID@, defined at @SDL3\/SDL_properties.h 66:16@
newtype SDL_PropertiesID = SDL_PropertiesID
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
  => BG.CompatHasField.HasField "unwrap" SDL_PropertiesID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PropertiesID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_PropertiesID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PropertiesID "unwrap" where
  type
    CFieldType SDL_PropertiesID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | SDL property type
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_PropertyType@, defined at @SDL3\/SDL_properties.h 73:14@
newtype SDL_PropertyType = SDL_PropertyType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_PropertyType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PropertyType where
  readRaw =
    \ptr0 ->
      pure SDL_PropertyType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_PropertyType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PropertyType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_PropertyType instance BG.Storable SDL_PropertyType

deriving via BG.CUInt instance BG.Prim SDL_PropertyType

instance CEnum.CEnum SDL_PropertyType where
  type CEnumZ SDL_PropertyType = BG.CUInt

  toCEnum = SDL_PropertyType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_PROPERTY_TYPE_INVALID")
        , (1, BG.singleton "SDL_PROPERTY_TYPE_POINTER")
        , (2, BG.singleton "SDL_PROPERTY_TYPE_STRING")
        , (3, BG.singleton "SDL_PROPERTY_TYPE_NUMBER")
        , (4, BG.singleton "SDL_PROPERTY_TYPE_FLOAT")
        , (5, BG.singleton "SDL_PROPERTY_TYPE_BOOLEAN")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_PropertyType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_PropertyType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_PropertyType where
  minDeclaredValue = SDL_PROPERTY_TYPE_INVALID

  maxDeclaredValue = SDL_PROPERTY_TYPE_BOOLEAN

instance Show SDL_PropertyType where
  showsPrec = CEnum.shows

instance Read SDL_PropertyType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_PropertyType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PropertyType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_PropertyType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PropertyType "unwrap" where
  type CFieldType SDL_PropertyType "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_PROPERTY_TYPE_INVALID@, defined at @SDL3\/SDL_properties.h 75:5@
pattern SDL_PROPERTY_TYPE_INVALID :: SDL_PropertyType
pattern SDL_PROPERTY_TYPE_INVALID = SDL_PropertyType 0

-- | [C declaration]: @SDL_PROPERTY_TYPE_POINTER@, defined at @SDL3\/SDL_properties.h 76:5@
pattern SDL_PROPERTY_TYPE_POINTER :: SDL_PropertyType
pattern SDL_PROPERTY_TYPE_POINTER = SDL_PropertyType 1

-- | [C declaration]: @SDL_PROPERTY_TYPE_STRING@, defined at @SDL3\/SDL_properties.h 77:5@
pattern SDL_PROPERTY_TYPE_STRING :: SDL_PropertyType
pattern SDL_PROPERTY_TYPE_STRING = SDL_PropertyType 2

-- | [C declaration]: @SDL_PROPERTY_TYPE_NUMBER@, defined at @SDL3\/SDL_properties.h 78:5@
pattern SDL_PROPERTY_TYPE_NUMBER :: SDL_PropertyType
pattern SDL_PROPERTY_TYPE_NUMBER = SDL_PropertyType 3

-- | [C declaration]: @SDL_PROPERTY_TYPE_FLOAT@, defined at @SDL3\/SDL_properties.h 79:5@
pattern SDL_PROPERTY_TYPE_FLOAT :: SDL_PropertyType
pattern SDL_PROPERTY_TYPE_FLOAT = SDL_PropertyType 4

-- | [C declaration]: @SDL_PROPERTY_TYPE_BOOLEAN@, defined at @SDL3\/SDL_properties.h 80:5@
pattern SDL_PROPERTY_TYPE_BOOLEAN :: SDL_PropertyType
pattern SDL_PROPERTY_TYPE_BOOLEAN = SDL_PropertyType 5

-- | A generic property for naming things.
--
--     This property is intended to be added to any 'SDL_PropertiesID' that needs a generic name associated with the property set. It is not guaranteed that any property set will include this key, but it is convenient to have a standard key that any piece of code could reasonably agree to use.
--
--     For example, the properties associated with an SDL_Texture might have a name string of \"player sprites\", or an SDL_AudioStream might have \"background music\", etc. This might also be useful for an SDL_IOStream to list the path to its asset.
--
--     There is no format for the value set with this key; it is expected to be human-readable and informational in nature, possibly for logging or debugging purposes.
--
--     SDL does not currently set this property on any objects it creates, but this may change in later versions; it is currently expected that apps and external libraries will take advantage of it, when appropriate.
--
--     @since 3.4.0
--
--     [C declaration]: @macro SDL_PROP_NAME_STRING@, literal @\"SDL.name\"@, defined at @SDL3\/SDL_properties.h 106:9@
sDL_PROP_NAME_STRING :: BG.ByteString
sDL_PROP_NAME_STRING =
  BG.pack [0x53, 0x44, 0x4C, 0x2E, 0x6E, 0x61, 0x6D, 0x65]

-- | Auxiliary type used by 'SDL_CleanupPropertyCallback'
--
--     [C declaration]: @SDL_CleanupPropertyCallback@, defined at @SDL3\/SDL_properties.h 216:24@
newtype SDL_CleanupPropertyCallback_Aux = SDL_CleanupPropertyCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_CleanupPropertyCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_8958b9cfa7a05766_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toSDL_CleanupPropertyCallback_Aux@
hs_bindgen_8958b9cfa7a05766
  :: SDL_CleanupPropertyCallback_Aux
  -> IO (BG.FunPtr SDL_CleanupPropertyCallback_Aux)
hs_bindgen_8958b9cfa7a05766 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_8958b9cfa7a05766_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_CleanupPropertyCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_c4ac4678b65d3d15_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_CleanupPropertyCallback_Aux@
hs_bindgen_c4ac4678b65d3d15
  :: BG.FunPtr SDL_CleanupPropertyCallback_Aux
  -> SDL_CleanupPropertyCallback_Aux
hs_bindgen_c4ac4678b65d3d15 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_c4ac4678b65d3d15_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_CleanupPropertyCallback_Aux where
  toFunPtr = hs_bindgen_8958b9cfa7a05766

instance BG.FromFunPtr SDL_CleanupPropertyCallback_Aux where
  fromFunPtr = hs_bindgen_c4ac4678b65d3d15

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_CleanupPropertyCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CleanupPropertyCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_CleanupPropertyCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_CleanupPropertyCallback_Aux "unwrap" where
  type
    CFieldType SDL_CleanupPropertyCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO ()

  offset# = \_ -> \_ -> 0

-- | A callback used to free resources when a property is deleted.
--
--     This should release any resources associated with @value@ that are no longer needed.
--
--     This callback is set per-property. Different properties in the same group can have different cleanup callbacks.
--
--     This callback will be called /during/ SDL_SetPointerPropertyWithCleanup if the function fails for any reason.
--
--     [@userdata@]: an app-defined pointer passed to the callback.
--
--     [@value@]: the pointer assigned to the property to clean up.
--
--     [Thread safety]: This callback may fire without any locks held; if this is a concern, the app should provide its own locking.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetPointerPropertyWithCleanup'
--
--     [C declaration]: @SDL_CleanupPropertyCallback@, defined at @SDL3\/SDL_properties.h 216:24@
newtype SDL_CleanupPropertyCallback = SDL_CleanupPropertyCallback
  { unwrap :: BG.FunPtr SDL_CleanupPropertyCallback_Aux
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
  (ty ~ BG.FunPtr SDL_CleanupPropertyCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_CleanupPropertyCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CleanupPropertyCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_CleanupPropertyCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_CleanupPropertyCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_CleanupPropertyCallback "unwrap" where
  type
    CFieldType SDL_CleanupPropertyCallback "unwrap" =
      BG.FunPtr SDL_CleanupPropertyCallback_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_EnumeratePropertiesCallback'
--
--     [C declaration]: @SDL_EnumeratePropertiesCallback@, defined at @SDL3\/SDL_properties.h 528:24@
newtype SDL_EnumeratePropertiesCallback_Aux = SDL_EnumeratePropertiesCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_EnumeratePropertiesCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_b271d6d6058a1326_base
    :: (BG.Ptr BG.Void -> BG.Word32 -> BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Word32 -> BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toSDL_EnumeratePropertiesCallback_Aux@
hs_bindgen_b271d6d6058a1326
  :: SDL_EnumeratePropertiesCallback_Aux
  -> IO (BG.FunPtr SDL_EnumeratePropertiesCallback_Aux)
hs_bindgen_b271d6d6058a1326 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_b271d6d6058a1326_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_EnumeratePropertiesCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_89dc6b6814ba4336_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Word32 -> BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_EnumeratePropertiesCallback_Aux@
hs_bindgen_89dc6b6814ba4336
  :: BG.FunPtr SDL_EnumeratePropertiesCallback_Aux
  -> SDL_EnumeratePropertiesCallback_Aux
hs_bindgen_89dc6b6814ba4336 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_89dc6b6814ba4336_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_EnumeratePropertiesCallback_Aux where
  toFunPtr = hs_bindgen_b271d6d6058a1326

instance BG.FromFunPtr SDL_EnumeratePropertiesCallback_Aux where
  fromFunPtr = hs_bindgen_89dc6b6814ba4336

instance
  (ty ~ (BG.Ptr BG.Void -> SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_EnumeratePropertiesCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EnumeratePropertiesCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_EnumeratePropertiesCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EnumeratePropertiesCallback_Aux "unwrap" where
  type
    CFieldType SDL_EnumeratePropertiesCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO ()

  offset# = \_ -> \_ -> 0

-- | A callback used to enumerate all the properties in a group of properties.
--
--     This callback is called from @SDL_EnumerateProperties()@, and is called once per property in the set.
--
--     [@userdata@]: an app-defined pointer passed to the callback.
--
--     [@props@]: the 'SDL_PropertiesID' that is being enumerated.
--
--     [@name@]: the next property name in the enumeration.
--
--     [Thread safety]: SDL_EnumerateProperties holds a lock on @props@ during this callback.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EnumerateProperties'
--
--     [C declaration]: @SDL_EnumeratePropertiesCallback@, defined at @SDL3\/SDL_properties.h 528:24@
newtype SDL_EnumeratePropertiesCallback = SDL_EnumeratePropertiesCallback
  { unwrap :: BG.FunPtr SDL_EnumeratePropertiesCallback_Aux
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
  (ty ~ BG.FunPtr SDL_EnumeratePropertiesCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_EnumeratePropertiesCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EnumeratePropertiesCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_EnumeratePropertiesCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_EnumeratePropertiesCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EnumeratePropertiesCallback "unwrap" where
  type
    CFieldType SDL_EnumeratePropertiesCallback "unwrap" =
      BG.FunPtr SDL_EnumeratePropertiesCallback_Aux

  offset# = \_ -> \_ -> 0
