{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Properties.FunPtr (
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_GetGlobalProperties,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_CreateProperties,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_CopyProperties,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_LockProperties,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_UnlockProperties,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_SetPointerPropertyWithCleanup,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_SetPointerProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_SetStringProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_SetNumberProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_SetFloatProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_SetBooleanProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_HasProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_GetPropertyType,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_GetPointerProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_GetStringProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_GetNumberProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_GetFloatProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_GetBooleanProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_ClearProperty,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_EnumerateProperties,
  SDL3.Sys.Bindgen.Properties.FunPtr.sDL_DestroyProperties,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetGlobalProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_4541df72a2cb85f8 (void)) (void)"
         , "{"
         , "  return &SDL_GetGlobalProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_CreateProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_92049f9b61449963 (void)) (void)"
         , "{"
         , "  return &SDL_CreateProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_CopyProperties */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_38190d3cf84485c4 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  SDL_PropertiesID arg2"
         , ")"
         , "{"
         , "  return &SDL_CopyProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_LockProperties */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6ec499eda3697959 (void)) ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return &SDL_LockProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_UnlockProperties */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_9ae8d54eb30e84b4 (void)) ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return &SDL_UnlockProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetPointerPropertyWithCleanup */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_94c8b4d65016ddab (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  void *arg3,"
         , "  SDL_CleanupPropertyCallback arg4,"
         , "  void *arg5"
         , ")"
         , "{"
         , "  return &SDL_SetPointerPropertyWithCleanup;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetPointerProperty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_30ddc8c86a006598 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetPointerProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetStringProperty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_88fe6ad057838726 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetStringProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetNumberProperty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_00c22270473dd8bf (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  Sint64 arg3"
         , ")"
         , "{"
         , "  return &SDL_SetNumberProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetFloatProperty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b49813020974606a (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return &SDL_SetFloatProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetBooleanProperty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3d0623558bc4ff3f (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_SetBooleanProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_HasProperty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_260dc721ec409d1a (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_HasProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetPropertyType */"
         , "__attribute__ ((const))"
         , "SDL_PropertyType (*hs_bindgen_3191a0bffc4788d9 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetPropertyType;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetPointerProperty */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_daed4139b3c79d17 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetPointerProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetStringProperty */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_adc8eafafff23d41 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetStringProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetNumberProperty */"
         , "__attribute__ ((const))"
         , "Sint64 (*hs_bindgen_16bb2facf7635001 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  Sint64 arg3"
         , ")"
         , "{"
         , "  return &SDL_GetNumberProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetFloatProperty */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_661775cfc76e4f5c (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  float arg3"
         , ")"
         , "{"
         , "  return &SDL_GetFloatProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetBooleanProperty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9161fc8f2af4a306 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_GetBooleanProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_ClearProperty */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_89fcf415f7fa8ee4 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_ClearProperty;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_EnumerateProperties */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_816e33716bb87f04 (void)) ("
         , "  SDL_PropertiesID arg1,"
         , "  SDL_EnumeratePropertiesCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_EnumerateProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_DestroyProperties */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_2034830c5f638bf5 (void)) ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyProperties;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetGlobalProperties@
foreign import ccall unsafe "hs_bindgen_4541df72a2cb85f8"
  hs_bindgen_4541df72a2cb85f8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetGlobalProperties@
hs_bindgen_4541df72a2cb85f8 :: IO (BG.FunPtr (IO SDL_PropertiesID))
hs_bindgen_4541df72a2cb85f8 =
  BG.fromFFIType hs_bindgen_4541df72a2cb85f8_base

{-# NOINLINE sDL_GetGlobalProperties #-}

-- | Get the global SDL properties.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetGlobalProperties@, defined at @SDL3\/SDL_properties.h 118:46@
sDL_GetGlobalProperties :: BG.FunPtr (IO SDL_PropertiesID)
sDL_GetGlobalProperties =
  BG.unsafePerformIO hs_bindgen_4541df72a2cb85f8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_CreateProperties@
foreign import ccall unsafe "hs_bindgen_92049f9b61449963"
  hs_bindgen_92049f9b61449963_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_CreateProperties@
hs_bindgen_92049f9b61449963 :: IO (BG.FunPtr (IO SDL_PropertiesID))
hs_bindgen_92049f9b61449963 =
  BG.fromFFIType hs_bindgen_92049f9b61449963_base

{-# NOINLINE sDL_CreateProperties #-}

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
sDL_CreateProperties :: BG.FunPtr (IO SDL_PropertiesID)
sDL_CreateProperties =
  BG.unsafePerformIO hs_bindgen_92049f9b61449963

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_CopyProperties@
foreign import ccall unsafe "hs_bindgen_38190d3cf84485c4"
  hs_bindgen_38190d3cf84485c4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_CopyProperties@
hs_bindgen_38190d3cf84485c4 :: IO (BG.FunPtr (SDL_PropertiesID -> SDL_PropertiesID -> IO BG.CBool))
hs_bindgen_38190d3cf84485c4 =
  BG.fromFFIType hs_bindgen_38190d3cf84485c4_base

{-# NOINLINE sDL_CopyProperties #-}

-- | Copy a group of properties.
--
--     Copy all the properties from one group of properties to another, with the exception of properties requiring cleanup (set using @SDL_SetPointerPropertyWithCleanup()@), which will not be copied. Any property that already exists on @dst@ will be overwritten.
--
--     [@src@]: the properties to copy.
--
--     [@dst@]: the destination properties.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread. This function acquires simultaneous mutex locks on both the source and destination property sets.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CopyProperties@, defined at @SDL3\/SDL_properties.h 155:34@
sDL_CopyProperties :: BG.FunPtr (SDL_PropertiesID -> SDL_PropertiesID -> IO BG.CBool)
sDL_CopyProperties =
  BG.unsafePerformIO hs_bindgen_38190d3cf84485c4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_LockProperties@
foreign import ccall unsafe "hs_bindgen_6ec499eda3697959"
  hs_bindgen_6ec499eda3697959_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_LockProperties@
hs_bindgen_6ec499eda3697959 :: IO (BG.FunPtr (SDL_PropertiesID -> IO BG.CBool))
hs_bindgen_6ec499eda3697959 =
  BG.fromFFIType hs_bindgen_6ec499eda3697959_base

{-# NOINLINE sDL_LockProperties #-}

-- | Lock a group of properties.
--
--     Obtain a multi-threaded lock for these properties. Other threads will wait while trying to lock these properties until they are unlocked. Properties must be unlocked before they are destroyed.
--
--     The lock is automatically taken when setting individual properties, this function is only needed when you want to set several properties atomically or want to guarantee that properties being queried aren\'t freed in another thread.
--
--     [@props@]: the properties to lock.
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
sDL_LockProperties :: BG.FunPtr (SDL_PropertiesID -> IO BG.CBool)
sDL_LockProperties =
  BG.unsafePerformIO hs_bindgen_6ec499eda3697959

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_UnlockProperties@
foreign import ccall unsafe "hs_bindgen_9ae8d54eb30e84b4"
  hs_bindgen_9ae8d54eb30e84b4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_UnlockProperties@
hs_bindgen_9ae8d54eb30e84b4 :: IO (BG.FunPtr (SDL_PropertiesID -> IO ()))
hs_bindgen_9ae8d54eb30e84b4 =
  BG.fromFFIType hs_bindgen_9ae8d54eb30e84b4_base

{-# NOINLINE sDL_UnlockProperties #-}

-- | Unlock a group of properties.
--
--     [@props@]: the properties to unlock.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockProperties'
--
--     [C declaration]: @SDL_UnlockProperties@, defined at @SDL3\/SDL_properties.h 192:34@
sDL_UnlockProperties :: BG.FunPtr (SDL_PropertiesID -> IO ())
sDL_UnlockProperties =
  BG.unsafePerformIO hs_bindgen_9ae8d54eb30e84b4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetPointerPropertyWithCleanup@
foreign import ccall unsafe "hs_bindgen_94c8b4d65016ddab"
  hs_bindgen_94c8b4d65016ddab_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetPointerPropertyWithCleanup@
hs_bindgen_94c8b4d65016ddab
  :: IO
       ( BG.FunPtr
           ( SDL_PropertiesID
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr BG.Void
             -> SDL_CleanupPropertyCallback
             -> BG.Ptr BG.Void
             -> IO BG.CBool
           )
       )
hs_bindgen_94c8b4d65016ddab =
  BG.fromFFIType hs_bindgen_94c8b4d65016ddab_base

{-# NOINLINE sDL_SetPointerPropertyWithCleanup #-}

-- | Set a pointer property in a group of properties with a cleanup function that is called when the property is deleted.
--
--     The cleanup function is also called if setting the property fails for any reason.
--
--     For simply setting basic data types, like numbers, bools, or strings, use SDL_SetNumberProperty, SDL_SetBooleanProperty, or SDL_SetStringProperty instead, as those functions will handle cleanup on your behalf. This function is only for more complex, custom data.
--
--     [@props@]: the properties to modify.
--
--     [@name@]: the name of the property to modify.
--
--     [@value@]: the new value of the property, or NULL to delete the property.
--
--     [@cleanup@]: the function to call when this property is deleted, or NULL if no cleanup is necessary.
--
--     [@userdata@]: a pointer that is passed to the cleanup function.
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
  :: BG.FunPtr
       ( SDL_PropertiesID
         -> PtrConst.PtrConst BG.CChar
         -> BG.Ptr BG.Void
         -> SDL_CleanupPropertyCallback
         -> BG.Ptr BG.Void
         -> IO BG.CBool
       )
sDL_SetPointerPropertyWithCleanup =
  BG.unsafePerformIO hs_bindgen_94c8b4d65016ddab

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetPointerProperty@
foreign import ccall unsafe "hs_bindgen_30ddc8c86a006598"
  hs_bindgen_30ddc8c86a006598_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetPointerProperty@
hs_bindgen_30ddc8c86a006598
  :: IO (BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_30ddc8c86a006598 =
  BG.fromFFIType hs_bindgen_30ddc8c86a006598_base

{-# NOINLINE sDL_SetPointerProperty #-}

-- | Set a pointer property in a group of properties.
--
--     [@props@]: the properties to modify.
--
--     [@name@]: the name of the property to modify.
--
--     [@value@]: the new value of the property, or NULL to delete the property.
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
  :: BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_SetPointerProperty =
  BG.unsafePerformIO hs_bindgen_30ddc8c86a006598

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetStringProperty@
foreign import ccall unsafe "hs_bindgen_88fe6ad057838726"
  hs_bindgen_88fe6ad057838726_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetStringProperty@
hs_bindgen_88fe6ad057838726
  :: IO
       ( BG.FunPtr
           (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
       )
hs_bindgen_88fe6ad057838726 =
  BG.fromFFIType hs_bindgen_88fe6ad057838726_base

{-# NOINLINE sDL_SetStringProperty #-}

-- | Set a string property in a group of properties.
--
--     This function makes a copy of the string; the caller does not have to preserve the data after this call completes.
--
--     [@props@]: the properties to modify.
--
--     [@name@]: the name of the property to modify.
--
--     [@value@]: the new value of the property, or NULL to delete the property.
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
  :: BG.FunPtr
       (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_SetStringProperty =
  BG.unsafePerformIO hs_bindgen_88fe6ad057838726

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetNumberProperty@
foreign import ccall unsafe "hs_bindgen_00c22270473dd8bf"
  hs_bindgen_00c22270473dd8bf_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetNumberProperty@
hs_bindgen_00c22270473dd8bf
  :: IO
       ( BG.FunPtr
           (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool)
       )
hs_bindgen_00c22270473dd8bf =
  BG.fromFFIType hs_bindgen_00c22270473dd8bf_base

{-# NOINLINE sDL_SetNumberProperty #-}

-- | Set an integer property in a group of properties.
--
--     [@props@]: the properties to modify.
--
--     [@name@]: the name of the property to modify.
--
--     [@value@]: the new value of the property.
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
  :: BG.FunPtr
       (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool)
sDL_SetNumberProperty =
  BG.unsafePerformIO hs_bindgen_00c22270473dd8bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetFloatProperty@
foreign import ccall unsafe "hs_bindgen_b49813020974606a"
  hs_bindgen_b49813020974606a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetFloatProperty@
hs_bindgen_b49813020974606a
  :: IO (BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.CFloat -> IO BG.CBool))
hs_bindgen_b49813020974606a =
  BG.fromFFIType hs_bindgen_b49813020974606a_base

{-# NOINLINE sDL_SetFloatProperty #-}

-- | Set a floating point property in a group of properties.
--
--     [@props@]: the properties to modify.
--
--     [@name@]: the name of the property to modify.
--
--     [@value@]: the new value of the property.
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
  :: BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.CFloat -> IO BG.CBool)
sDL_SetFloatProperty =
  BG.unsafePerformIO hs_bindgen_b49813020974606a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetBooleanProperty@
foreign import ccall unsafe "hs_bindgen_3d0623558bc4ff3f"
  hs_bindgen_3d0623558bc4ff3f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_SetBooleanProperty@
hs_bindgen_3d0623558bc4ff3f
  :: IO (BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.CBool -> IO BG.CBool))
hs_bindgen_3d0623558bc4ff3f =
  BG.fromFFIType hs_bindgen_3d0623558bc4ff3f_base

{-# NOINLINE sDL_SetBooleanProperty #-}

-- | Set a boolean property in a group of properties.
--
--     [@props@]: the properties to modify.
--
--     [@name@]: the name of the property to modify.
--
--     [@value@]: the new value of the property.
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
  :: BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.CBool -> IO BG.CBool)
sDL_SetBooleanProperty =
  BG.unsafePerformIO hs_bindgen_3d0623558bc4ff3f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_HasProperty@
foreign import ccall unsafe "hs_bindgen_260dc721ec409d1a"
  hs_bindgen_260dc721ec409d1a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_HasProperty@
hs_bindgen_260dc721ec409d1a
  :: IO (BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_260dc721ec409d1a =
  BG.fromFFIType hs_bindgen_260dc721ec409d1a_base

{-# NOINLINE sDL_HasProperty #-}

-- | Return whether a property exists in a group of properties.
--
--     [@props@]: the properties to query.
--
--     [@name@]: the name of the property to query.
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
sDL_HasProperty :: BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_HasProperty =
  BG.unsafePerformIO hs_bindgen_260dc721ec409d1a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetPropertyType@
foreign import ccall unsafe "hs_bindgen_3191a0bffc4788d9"
  hs_bindgen_3191a0bffc4788d9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetPropertyType@
hs_bindgen_3191a0bffc4788d9
  :: IO (BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO SDL_PropertyType))
hs_bindgen_3191a0bffc4788d9 =
  BG.fromFFIType hs_bindgen_3191a0bffc4788d9_base

{-# NOINLINE sDL_GetPropertyType #-}

-- | Get the type of a property in a group of properties.
--
--     [@props@]: the properties to query.
--
--     [@name@]: the name of the property to query.
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
  :: BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO SDL_PropertyType)
sDL_GetPropertyType =
  BG.unsafePerformIO hs_bindgen_3191a0bffc4788d9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetPointerProperty@
foreign import ccall unsafe "hs_bindgen_daed4139b3c79d17"
  hs_bindgen_daed4139b3c79d17_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetPointerProperty@
hs_bindgen_daed4139b3c79d17
  :: IO
       (BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void)))
hs_bindgen_daed4139b3c79d17 =
  BG.fromFFIType hs_bindgen_daed4139b3c79d17_base

{-# NOINLINE sDL_GetPointerProperty #-}

-- | Get a pointer property from a group of properties.
--
--     By convention, the names of properties that SDL exposes on objects will start with \"SDL.\", and properties that SDL uses internally will start with \"SDL.internal.\". These should be considered read-only and should not be modified by applications.
--
--     [@props@]: the properties to query.
--
--     [@name@]: the name of the property to query.
--
--     [@default_value@]: the default value of the property.
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
  :: BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.Ptr BG.Void -> IO (BG.Ptr BG.Void))
sDL_GetPointerProperty =
  BG.unsafePerformIO hs_bindgen_daed4139b3c79d17

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetStringProperty@
foreign import ccall unsafe "hs_bindgen_adc8eafafff23d41"
  hs_bindgen_adc8eafafff23d41_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetStringProperty@
hs_bindgen_adc8eafafff23d41
  :: IO
       ( BG.FunPtr
           ( SDL_PropertiesID
             -> PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> IO (PtrConst.PtrConst BG.CChar)
           )
       )
hs_bindgen_adc8eafafff23d41 =
  BG.fromFFIType hs_bindgen_adc8eafafff23d41_base

{-# NOINLINE sDL_GetStringProperty #-}

-- | Get a string property from a group of properties.
--
--     [@props@]: the properties to query.
--
--     [@name@]: the name of the property to query.
--
--     [@default_value@]: the default value of the property.
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
  :: BG.FunPtr
       ( SDL_PropertiesID
         -> PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> IO (PtrConst.PtrConst BG.CChar)
       )
sDL_GetStringProperty =
  BG.unsafePerformIO hs_bindgen_adc8eafafff23d41

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetNumberProperty@
foreign import ccall unsafe "hs_bindgen_16bb2facf7635001"
  hs_bindgen_16bb2facf7635001_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetNumberProperty@
hs_bindgen_16bb2facf7635001
  :: IO
       ( BG.FunPtr
           ( SDL_PropertiesID
             -> PtrConst.PtrConst BG.CChar
             -> SDL3.Sys.Bindgen.Stdinc.Sint64
             -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
           )
       )
hs_bindgen_16bb2facf7635001 =
  BG.fromFFIType hs_bindgen_16bb2facf7635001_base

{-# NOINLINE sDL_GetNumberProperty #-}

-- | Get a number property from a group of properties.
--
--     You can use @SDL_GetPropertyType()@ to query whether the property exists and is a number property.
--
--     [@props@]: the properties to query.
--
--     [@name@]: the name of the property to query.
--
--     [@default_value@]: the default value of the property.
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
  :: BG.FunPtr
       ( SDL_PropertiesID
         -> PtrConst.PtrConst BG.CChar
         -> SDL3.Sys.Bindgen.Stdinc.Sint64
         -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
       )
sDL_GetNumberProperty =
  BG.unsafePerformIO hs_bindgen_16bb2facf7635001

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetFloatProperty@
foreign import ccall unsafe "hs_bindgen_661775cfc76e4f5c"
  hs_bindgen_661775cfc76e4f5c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetFloatProperty@
hs_bindgen_661775cfc76e4f5c
  :: IO (BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.CFloat -> IO BG.CFloat))
hs_bindgen_661775cfc76e4f5c =
  BG.fromFFIType hs_bindgen_661775cfc76e4f5c_base

{-# NOINLINE sDL_GetFloatProperty #-}

-- | Get a floating point property from a group of properties.
--
--     You can use @SDL_GetPropertyType()@ to query whether the property exists and is a floating point property.
--
--     [@props@]: the properties to query.
--
--     [@name@]: the name of the property to query.
--
--     [@default_value@]: the default value of the property.
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
  :: BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.CFloat -> IO BG.CFloat)
sDL_GetFloatProperty =
  BG.unsafePerformIO hs_bindgen_661775cfc76e4f5c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetBooleanProperty@
foreign import ccall unsafe "hs_bindgen_9161fc8f2af4a306"
  hs_bindgen_9161fc8f2af4a306_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_GetBooleanProperty@
hs_bindgen_9161fc8f2af4a306
  :: IO (BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.CBool -> IO BG.CBool))
hs_bindgen_9161fc8f2af4a306 =
  BG.fromFFIType hs_bindgen_9161fc8f2af4a306_base

{-# NOINLINE sDL_GetBooleanProperty #-}

-- | Get a boolean property from a group of properties.
--
--     You can use @SDL_GetPropertyType()@ to query whether the property exists and is a boolean property.
--
--     [@props@]: the properties to query.
--
--     [@name@]: the name of the property to query.
--
--     [@default_value@]: the default value of the property.
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
  :: BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> BG.CBool -> IO BG.CBool)
sDL_GetBooleanProperty =
  BG.unsafePerformIO hs_bindgen_9161fc8f2af4a306

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_ClearProperty@
foreign import ccall unsafe "hs_bindgen_89fcf415f7fa8ee4"
  hs_bindgen_89fcf415f7fa8ee4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_ClearProperty@
hs_bindgen_89fcf415f7fa8ee4
  :: IO (BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_89fcf415f7fa8ee4 =
  BG.fromFFIType hs_bindgen_89fcf415f7fa8ee4_base

{-# NOINLINE sDL_ClearProperty #-}

-- | Clear a property from a group of properties.
--
--     [@props@]: the properties to modify.
--
--     [@name@]: the name of the property to clear.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ClearProperty@, defined at @SDL3\/SDL_properties.h 509:34@
sDL_ClearProperty :: BG.FunPtr (SDL_PropertiesID -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_ClearProperty =
  BG.unsafePerformIO hs_bindgen_89fcf415f7fa8ee4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_EnumerateProperties@
foreign import ccall unsafe "hs_bindgen_816e33716bb87f04"
  hs_bindgen_816e33716bb87f04_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_EnumerateProperties@
hs_bindgen_816e33716bb87f04
  :: IO
       (BG.FunPtr (SDL_PropertiesID -> SDL_EnumeratePropertiesCallback -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_816e33716bb87f04 =
  BG.fromFFIType hs_bindgen_816e33716bb87f04_base

{-# NOINLINE sDL_EnumerateProperties #-}

-- | Enumerate the properties contained in a group of properties.
--
--     The callback function is called for each property in the group of properties. The properties are locked during enumeration.
--
--     [@props@]: the properties to query.
--
--     [@callback@]: the function to call for each property.
--
--     [@userdata@]: a pointer that is passed to @callback@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EnumerateProperties@, defined at @SDL3\/SDL_properties.h 546:34@
sDL_EnumerateProperties
  :: BG.FunPtr (SDL_PropertiesID -> SDL_EnumeratePropertiesCallback -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_EnumerateProperties =
  BG.unsafePerformIO hs_bindgen_816e33716bb87f04

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_DestroyProperties@
foreign import ccall unsafe "hs_bindgen_2034830c5f638bf5"
  hs_bindgen_2034830c5f638bf5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Properties_get_SDL_DestroyProperties@
hs_bindgen_2034830c5f638bf5 :: IO (BG.FunPtr (SDL_PropertiesID -> IO ()))
hs_bindgen_2034830c5f638bf5 =
  BG.fromFFIType hs_bindgen_2034830c5f638bf5_base

{-# NOINLINE sDL_DestroyProperties #-}

-- | Destroy a group of properties.
--
--     All properties are deleted and their cleanup functions will be called, if any.
--
--     [@props@]: the properties to destroy.
--
--     [Thread safety]: This function should not be called while these properties are locked or other threads might be setting or getting values from these properties.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProperties'
--
--     [C declaration]: @SDL_DestroyProperties@, defined at @SDL3\/SDL_properties.h 564:34@
sDL_DestroyProperties :: BG.FunPtr (SDL_PropertiesID -> IO ())
sDL_DestroyProperties =
  BG.unsafePerformIO hs_bindgen_2034830c5f638bf5
