{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Properties.Unsafe (
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_GetGlobalProperties,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_CreateProperties,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_CopyProperties,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_LockProperties,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_UnlockProperties,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_SetPointerPropertyWithCleanup,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_SetPointerProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_SetStringProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_SetNumberProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_SetFloatProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_SetBooleanProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_HasProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_GetPropertyType,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_GetPointerProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_GetStringProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_GetNumberProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_GetFloatProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_GetBooleanProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_ClearProperty,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_EnumerateProperties,
  SDL3.Sys.Bindgen.Properties.Unsafe.sDL_DestroyProperties,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Properties
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_properties.h>"
         , "SDL_PropertiesID hs_bindgen_c42d6db8a32f055e (void)"
         , "{"
         , "  return (SDL_GetGlobalProperties)();"
         , "}"
         , "SDL_PropertiesID hs_bindgen_3df6eaf391028f3a (void)"
         , "{"
         , "  return (SDL_CreateProperties)();"
         , "}"
         , "_Bool hs_bindgen_ec7346bf04c8fb1f ("
         , "  SDL_PropertiesID arg1,"
         , "  SDL_PropertiesID arg2"
         , ")"
         , "{"
         , "  return (SDL_CopyProperties)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_9d2b19ecdcff5a9a ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return (SDL_LockProperties)(arg1);"
         , "}"
         , "void hs_bindgen_36fc1538f3f888d4 ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  (SDL_UnlockProperties)(arg1);"
         , "}"
         , "_Bool hs_bindgen_ac9cc1ad6b8fd333 ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  void *arg3,"
         , "  SDL_CleanupPropertyCallback arg4,"
         , "  void *arg5"
         , ")"
         , "{"
         , "  return (SDL_SetPointerPropertyWithCleanup)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_7470d8d3e33299dd ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_SetPointerProperty)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_8c4e2fe0b0c344fa ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return (SDL_SetStringProperty)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_adbe15832a85614f ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  Sint64 arg3"
         , ")"
         , "{"
         , "  return (SDL_SetNumberProperty)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_cd3f1858894a3c1a ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return (SDL_SetFloatProperty)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_54a909439447714a ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_SetBooleanProperty)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_668d738b4f14a372 ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_HasProperty)(arg1, arg2);"
         , "}"
         , "SDL_PropertyType hs_bindgen_0dc114a9b956e6b4 ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetPropertyType)(arg1, arg2);"
         , "}"
         , "void *hs_bindgen_137a3bf658fca01b ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetPointerProperty)(arg1, arg2, arg3);"
         , "}"
         , "char const *hs_bindgen_13dfafaed8ef603e ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetStringProperty)(arg1, arg2, arg3);"
         , "}"
         , "Sint64 hs_bindgen_047e09cd4176f3ce ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  Sint64 arg3"
         , ")"
         , "{"
         , "  return (SDL_GetNumberProperty)(arg1, arg2, arg3);"
         , "}"
         , "float hs_bindgen_54dfc33f97564e4d ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return (SDL_GetFloatProperty)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_ff205e1f9b9cb233 ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_GetBooleanProperty)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_2b64b35dcac92b2c ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_ClearProperty)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_568e06654af8bf56 ("
         , "  SDL_PropertiesID arg1,"
         , "  SDL_EnumeratePropertiesCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_EnumerateProperties)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_eeb9d2ee08b0f608 ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyProperties)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetGlobalProperties@
foreign import ccall unsafe "hs_bindgen_c42d6db8a32f055e"
  hs_bindgen_c42d6db8a32f055e_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetGlobalProperties@
hs_bindgen_c42d6db8a32f055e :: IO SDL_PropertiesID
hs_bindgen_c42d6db8a32f055e =
  BG.fromFFIType hs_bindgen_c42d6db8a32f055e_base

-- | Get the global SDL properties.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGlobalProperties@, defined at @SDL3\/SDL_properties.h 118:46@
sDL_GetGlobalProperties :: IO SDL_PropertiesID
sDL_GetGlobalProperties = hs_bindgen_c42d6db8a32f055e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_CreateProperties@
foreign import ccall unsafe "hs_bindgen_3df6eaf391028f3a"
  hs_bindgen_3df6eaf391028f3a_base
    :: IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_CreateProperties@
hs_bindgen_3df6eaf391028f3a :: IO SDL_PropertiesID
hs_bindgen_3df6eaf391028f3a =
  BG.fromFFIType hs_bindgen_3df6eaf391028f3a_base

-- | Create a group of properties.
--
--     All properties are automatically destroyed when SDL_Quit() is called.
--
--     [Returns]: an ID for a new group of properties, or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_DestroyProperties'
--
--     [C declaration]: @SDL_CreateProperties@, defined at @SDL3\/SDL_properties.h 134:46@
sDL_CreateProperties :: IO SDL_PropertiesID
sDL_CreateProperties = hs_bindgen_3df6eaf391028f3a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_CopyProperties@
foreign import ccall unsafe "hs_bindgen_ec7346bf04c8fb1f"
  hs_bindgen_ec7346bf04c8fb1f_base
    :: BG.Word32
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_CopyProperties@
hs_bindgen_ec7346bf04c8fb1f
  :: SDL_PropertiesID
  -> SDL_PropertiesID
  -> IO BG.CBool
hs_bindgen_ec7346bf04c8fb1f =
  BG.fromFFIType hs_bindgen_ec7346bf04c8fb1f_base

-- | Copy a group of properties.
--
--     Copy all the properties from one group of properties to another, with the exception of properties requiring cleanup (set using @SDL_SetPointerPropertyWithCleanup()@), which will not be copied. Any property that already exists on @dst@ will be overwritten.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread. This function acquires simultaneous mutex locks on both the source and destination property sets.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CopyProperties@, defined at @SDL3\/SDL_properties.h 155:34@
sDL_CopyProperties
  :: SDL_PropertiesID
  -- ^
  --
  --           [@src@]: the properties to copy.
  -> SDL_PropertiesID
  -- ^
  --
  --           [@dst@]: the destination properties.
  -> IO BG.CBool
sDL_CopyProperties = hs_bindgen_ec7346bf04c8fb1f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_LockProperties@
foreign import ccall unsafe "hs_bindgen_9d2b19ecdcff5a9a"
  hs_bindgen_9d2b19ecdcff5a9a_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_LockProperties@
hs_bindgen_9d2b19ecdcff5a9a
  :: SDL_PropertiesID
  -> IO BG.CBool
hs_bindgen_9d2b19ecdcff5a9a =
  BG.fromFFIType hs_bindgen_9d2b19ecdcff5a9a_base

-- | Lock a group of properties.
--
--     Obtain a multi-threaded lock for these properties. Other threads will wait while trying to lock these properties until they are unlocked. Properties must be unlocked before they are destroyed.
--
--     The lock is automatically taken when setting individual properties, this function is only needed when you want to set several properties atomically or want to guarantee that properties being queried aren\'t freed in another thread.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UnlockProperties'
--
--     [C declaration]: @SDL_LockProperties@, defined at @SDL3\/SDL_properties.h 179:34@
sDL_LockProperties
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to lock.
  -> IO BG.CBool
sDL_LockProperties = hs_bindgen_9d2b19ecdcff5a9a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_UnlockProperties@
foreign import ccall unsafe "hs_bindgen_36fc1538f3f888d4"
  hs_bindgen_36fc1538f3f888d4_base
    :: BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_UnlockProperties@
hs_bindgen_36fc1538f3f888d4
  :: SDL_PropertiesID
  -> IO ()
hs_bindgen_36fc1538f3f888d4 =
  BG.fromFFIType hs_bindgen_36fc1538f3f888d4_base

-- | Unlock a group of properties.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockProperties'
--
--     [C declaration]: @SDL_UnlockProperties@, defined at @SDL3\/SDL_properties.h 192:34@
sDL_UnlockProperties
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to unlock.
  -> IO ()
sDL_UnlockProperties = hs_bindgen_36fc1538f3f888d4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetPointerPropertyWithCleanup@
foreign import ccall unsafe "hs_bindgen_ac9cc1ad6b8fd333"
  hs_bindgen_ac9cc1ad6b8fd333_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetPointerPropertyWithCleanup@
hs_bindgen_ac9cc1ad6b8fd333
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr BG.Void
  -> SDL_CleanupPropertyCallback
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_ac9cc1ad6b8fd333 =
  BG.fromFFIType hs_bindgen_ac9cc1ad6b8fd333_base

-- | Set a pointer property in a group of properties with a cleanup function that is called when the property is deleted.
--
--     The cleanup function is also called if setting the property fails for any reason.
--
--     For simply setting basic data types, like numbers, bools, or strings, use SDL_SetNumberProperty, SDL_SetBooleanProperty, or SDL_SetStringProperty instead, as those functions will handle cleanup on your behalf. This function is only for more complex, custom data.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPointerProperty', 'sDL_SetPointerProperty', 'SDL_CleanupPropertyCallback'
--
--     [C declaration]: @SDL_SetPointerPropertyWithCleanup@, defined at @SDL3\/SDL_properties.h 247:34@
sDL_SetPointerPropertyWithCleanup
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@value@]: the new value of the property, or NULL to delete the property.
  -> SDL_CleanupPropertyCallback
  -- ^
  --
  --           [@cleanup@]: the function to call when this property is deleted, or NULL if no cleanup is necessary.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to the cleanup function.
  -> IO BG.CBool
sDL_SetPointerPropertyWithCleanup =
  hs_bindgen_ac9cc1ad6b8fd333

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetPointerProperty@
foreign import ccall unsafe "hs_bindgen_7470d8d3e33299dd"
  hs_bindgen_7470d8d3e33299dd_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetPointerProperty@
hs_bindgen_7470d8d3e33299dd
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_7470d8d3e33299dd =
  BG.fromFFIType hs_bindgen_7470d8d3e33299dd_base

-- | Set a pointer property in a group of properties.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPointerProperty', 'sDL_HasProperty', 'sDL_SetBooleanProperty', 'sDL_SetFloatProperty', 'sDL_SetNumberProperty', 'sDL_SetPointerPropertyWithCleanup', 'sDL_SetStringProperty'
--
--     [C declaration]: @SDL_SetPointerProperty@, defined at @SDL3\/SDL_properties.h 270:34@
sDL_SetPointerProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@value@]: the new value of the property, or NULL to delete the property.
  -> IO BG.CBool
sDL_SetPointerProperty = hs_bindgen_7470d8d3e33299dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetStringProperty@
foreign import ccall unsafe "hs_bindgen_8c4e2fe0b0c344fa"
  hs_bindgen_8c4e2fe0b0c344fa_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetStringProperty@
hs_bindgen_8c4e2fe0b0c344fa
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_8c4e2fe0b0c344fa =
  BG.fromFFIType hs_bindgen_8c4e2fe0b0c344fa_base

-- | Set a string property in a group of properties.
--
--     This function makes a copy of the string; the caller does not have to preserve the data after this call completes.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetStringProperty'
--
--     [C declaration]: @SDL_SetStringProperty@, defined at @SDL3\/SDL_properties.h 290:34@
sDL_SetStringProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@value@]: the new value of the property, or NULL to delete the property.
  -> IO BG.CBool
sDL_SetStringProperty = hs_bindgen_8c4e2fe0b0c344fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetNumberProperty@
foreign import ccall unsafe "hs_bindgen_adbe15832a85614f"
  hs_bindgen_adbe15832a85614f_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetNumberProperty@
hs_bindgen_adbe15832a85614f
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -> IO BG.CBool
hs_bindgen_adbe15832a85614f =
  BG.fromFFIType hs_bindgen_adbe15832a85614f_base

-- | Set an integer property in a group of properties.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumberProperty'
--
--     [C declaration]: @SDL_SetNumberProperty@, defined at @SDL3\/SDL_properties.h 307:34@
sDL_SetNumberProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@value@]: the new value of the property.
  -> IO BG.CBool
sDL_SetNumberProperty = hs_bindgen_adbe15832a85614f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetFloatProperty@
foreign import ccall unsafe "hs_bindgen_cd3f1858894a3c1a"
  hs_bindgen_cd3f1858894a3c1a_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetFloatProperty@
hs_bindgen_cd3f1858894a3c1a
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_cd3f1858894a3c1a =
  BG.fromFFIType hs_bindgen_cd3f1858894a3c1a_base

-- | Set a floating point property in a group of properties.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetFloatProperty'
--
--     [C declaration]: @SDL_SetFloatProperty@, defined at @SDL3\/SDL_properties.h 324:34@
sDL_SetFloatProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> BG.CFloat
  -- ^
  --
  --           [@value@]: the new value of the property.
  -> IO BG.CBool
sDL_SetFloatProperty = hs_bindgen_cd3f1858894a3c1a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetBooleanProperty@
foreign import ccall unsafe "hs_bindgen_54a909439447714a"
  hs_bindgen_54a909439447714a_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_SetBooleanProperty@
hs_bindgen_54a909439447714a
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_54a909439447714a =
  BG.fromFFIType hs_bindgen_54a909439447714a_base

-- | Set a boolean property in a group of properties.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetBooleanProperty'
--
--     [C declaration]: @SDL_SetBooleanProperty@, defined at @SDL3\/SDL_properties.h 341:34@
sDL_SetBooleanProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> BG.CBool
  -- ^
  --
  --           [@value@]: the new value of the property.
  -> IO BG.CBool
sDL_SetBooleanProperty = hs_bindgen_54a909439447714a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_HasProperty@
foreign import ccall unsafe "hs_bindgen_668d738b4f14a372"
  hs_bindgen_668d738b4f14a372_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_HasProperty@
hs_bindgen_668d738b4f14a372
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_668d738b4f14a372 =
  BG.fromFFIType hs_bindgen_668d738b4f14a372_base

-- | Return whether a property exists in a group of properties.
--
--     [Returns]: true if the property exists, or false if it doesn\'t.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPropertyType'
--
--     [C declaration]: @SDL_HasProperty@, defined at @SDL3\/SDL_properties.h 356:34@
sDL_HasProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> IO BG.CBool
sDL_HasProperty = hs_bindgen_668d738b4f14a372

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetPropertyType@
foreign import ccall unsafe "hs_bindgen_0dc114a9b956e6b4"
  hs_bindgen_0dc114a9b956e6b4_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetPropertyType@
hs_bindgen_0dc114a9b956e6b4
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> IO SDL_PropertyType
hs_bindgen_0dc114a9b956e6b4 =
  BG.fromFFIType hs_bindgen_0dc114a9b956e6b4_base

-- | Get the type of a property in a group of properties.
--
--     [Returns]: the type of the property, or SDL_PROPERTY_TYPE_INVALID if it is not set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_HasProperty'
--
--     [C declaration]: @SDL_GetPropertyType@, defined at @SDL3\/SDL_properties.h 372:46@
sDL_GetPropertyType
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> IO SDL_PropertyType
sDL_GetPropertyType = hs_bindgen_0dc114a9b956e6b4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetPointerProperty@
foreign import ccall unsafe "hs_bindgen_137a3bf658fca01b"
  hs_bindgen_137a3bf658fca01b_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetPointerProperty@
hs_bindgen_137a3bf658fca01b
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr BG.Void
  -> IO (BG.Ptr BG.Void)
hs_bindgen_137a3bf658fca01b =
  BG.fromFFIType hs_bindgen_137a3bf658fca01b_base

-- | Get a pointer property from a group of properties.
--
--     By convention, the names of properties that SDL exposes on objects will start with \"SDL.\", and properties that SDL uses internally will start with \"SDL.internal.\". These should be considered read-only and should not be modified by applications.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a pointer property.
--
--     [Thread safety]: It is safe to call this function from any thread, although the data returned is not protected and could potentially be freed if you call @SDL_SetPointerProperty()@ or @SDL_ClearProperty()@ on these properties from another thread. If you need to avoid this, use @SDL_LockProperties()@ and @SDL_UnlockProperties()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetBooleanProperty', 'sDL_GetFloatProperty', 'sDL_GetNumberProperty', 'sDL_GetPropertyType', 'sDL_GetStringProperty', 'sDL_HasProperty', 'sDL_SetPointerProperty'
--
--     [C declaration]: @SDL_GetPointerProperty@, defined at @SDL3\/SDL_properties.h 405:36@
sDL_GetPointerProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO (BG.Ptr BG.Void)
sDL_GetPointerProperty = hs_bindgen_137a3bf658fca01b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetStringProperty@
foreign import ccall unsafe "hs_bindgen_13dfafaed8ef603e"
  hs_bindgen_13dfafaed8ef603e_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetStringProperty@
hs_bindgen_13dfafaed8ef603e
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_13dfafaed8ef603e =
  BG.fromFFIType hs_bindgen_13dfafaed8ef603e_base

-- | Get a string property from a group of properties.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a string property.
--
--     [Thread safety]: It is safe to call this function from any thread, although the data returned is not protected and could potentially be freed if you call @SDL_SetStringProperty()@ or @SDL_ClearProperty()@ on these properties from another thread. If you need to avoid this, use @SDL_LockProperties()@ and @SDL_UnlockProperties()@.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPropertyType', 'sDL_HasProperty', 'sDL_SetStringProperty'
--
--     [C declaration]: @SDL_GetStringProperty@, defined at @SDL3\/SDL_properties.h 429:42@
sDL_GetStringProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetStringProperty = hs_bindgen_13dfafaed8ef603e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetNumberProperty@
foreign import ccall unsafe "hs_bindgen_047e09cd4176f3ce"
  hs_bindgen_047e09cd4176f3ce_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int64
    -> IO BG.Int64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetNumberProperty@
hs_bindgen_047e09cd4176f3ce
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
hs_bindgen_047e09cd4176f3ce =
  BG.fromFFIType hs_bindgen_047e09cd4176f3ce_base

-- | Get a number property from a group of properties.
--
--     You can use @SDL_GetPropertyType()@ to query whether the property exists and is a number property.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a number property.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPropertyType', 'sDL_HasProperty', 'sDL_SetNumberProperty'
--
--     [C declaration]: @SDL_GetNumberProperty@, defined at @SDL3\/SDL_properties.h 451:36@
sDL_GetNumberProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
sDL_GetNumberProperty = hs_bindgen_047e09cd4176f3ce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetFloatProperty@
foreign import ccall unsafe "hs_bindgen_54dfc33f97564e4d"
  hs_bindgen_54dfc33f97564e4d_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> Float
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetFloatProperty@
hs_bindgen_54dfc33f97564e4d
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> BG.CFloat
  -> IO BG.CFloat
hs_bindgen_54dfc33f97564e4d =
  BG.fromFFIType hs_bindgen_54dfc33f97564e4d_base

-- | Get a floating point property from a group of properties.
--
--     You can use @SDL_GetPropertyType()@ to query whether the property exists and is a floating point property.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a float property.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPropertyType', 'sDL_HasProperty', 'sDL_SetFloatProperty'
--
--     [C declaration]: @SDL_GetFloatProperty@, defined at @SDL3\/SDL_properties.h 473:35@
sDL_GetFloatProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> BG.CFloat
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO BG.CFloat
sDL_GetFloatProperty = hs_bindgen_54dfc33f97564e4d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetBooleanProperty@
foreign import ccall unsafe "hs_bindgen_ff205e1f9b9cb233"
  hs_bindgen_ff205e1f9b9cb233_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_GetBooleanProperty@
hs_bindgen_ff205e1f9b9cb233
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_ff205e1f9b9cb233 =
  BG.fromFFIType hs_bindgen_ff205e1f9b9cb233_base

-- | Get a boolean property from a group of properties.
--
--     You can use @SDL_GetPropertyType()@ to query whether the property exists and is a boolean property.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a boolean property.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPropertyType', 'sDL_HasProperty', 'sDL_SetBooleanProperty'
--
--     [C declaration]: @SDL_GetBooleanProperty@, defined at @SDL3\/SDL_properties.h 495:34@
sDL_GetBooleanProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> BG.CBool
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO BG.CBool
sDL_GetBooleanProperty = hs_bindgen_ff205e1f9b9cb233

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_ClearProperty@
foreign import ccall unsafe "hs_bindgen_2b64b35dcac92b2c"
  hs_bindgen_2b64b35dcac92b2c_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_ClearProperty@
hs_bindgen_2b64b35dcac92b2c
  :: SDL_PropertiesID
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_2b64b35dcac92b2c =
  BG.fromFFIType hs_bindgen_2b64b35dcac92b2c_base

-- | Clear a property from a group of properties.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ClearProperty@, defined at @SDL3\/SDL_properties.h 509:34@
sDL_ClearProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to clear.
  -> IO BG.CBool
sDL_ClearProperty = hs_bindgen_2b64b35dcac92b2c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_EnumerateProperties@
foreign import ccall unsafe "hs_bindgen_568e06654af8bf56"
  hs_bindgen_568e06654af8bf56_base
    :: BG.Word32
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_EnumerateProperties@
hs_bindgen_568e06654af8bf56
  :: SDL_PropertiesID
  -> SDL_EnumeratePropertiesCallback
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_568e06654af8bf56 =
  BG.fromFFIType hs_bindgen_568e06654af8bf56_base

-- | Enumerate the properties contained in a group of properties.
--
--     The callback function is called for each property in the group of properties. The properties are locked during enumeration.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EnumerateProperties@, defined at @SDL3\/SDL_properties.h 546:34@
sDL_EnumerateProperties
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> SDL_EnumeratePropertiesCallback
  -- ^
  --
  --           [@callback@]: the function to call for each property.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @callback@.
  -> IO BG.CBool
sDL_EnumerateProperties = hs_bindgen_568e06654af8bf56

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_DestroyProperties@
foreign import ccall unsafe "hs_bindgen_eeb9d2ee08b0f608"
  hs_bindgen_eeb9d2ee08b0f608_base
    :: BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_Unsafe_SDL_DestroyProperties@
hs_bindgen_eeb9d2ee08b0f608
  :: SDL_PropertiesID
  -> IO ()
hs_bindgen_eeb9d2ee08b0f608 =
  BG.fromFFIType hs_bindgen_eeb9d2ee08b0f608_base

-- | Destroy a group of properties.
--
--     All properties are deleted and their cleanup functions will be called, if any.
--
--     [Thread safety]: This function should not be called while these properties are locked or other threads might be setting or getting values from these properties.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProperties'
--
--     [C declaration]: @SDL_DestroyProperties@, defined at @SDL3\/SDL_properties.h 564:34@
sDL_DestroyProperties
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to destroy.
  -> IO ()
sDL_DestroyProperties = hs_bindgen_eeb9d2ee08b0f608
