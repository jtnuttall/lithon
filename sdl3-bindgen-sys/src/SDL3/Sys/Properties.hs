-- | A property is a variable that can be created and retrieved by name at runtime.
--
--     All properties are part of a property group ('SDL_PropertiesID'). A property group can be created with the 'createProperties' function and destroyed with the 'destroyProperties' function.
--
--     Properties can be added to and retrieved from a property group through the following functions:
--
--     * 'setPointerProperty' and 'getPointerProperty' operate on @void*@ pointer types.
--
--     * 'setStringProperty' and 'getStringProperty' operate on string types.
--
--     * 'setNumberProperty' and 'getNumberProperty' operate on signed 64-bit integer types.
--
--     * 'setFloatProperty' and 'getFloatProperty' operate on floating point types.
--
--     * 'setBooleanProperty' and 'getBooleanProperty' operate on boolean types.
--
--     Properties can be removed from a group by using 'clearProperty'. An ID that represents a properties set.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Properties.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Properties (
  module SDL3.Sys.Bindgen.Properties,

  -- * Function aliases
  SDL3.Sys.Properties.getGlobalProperties,
  SDL3.Sys.Properties.getGlobalPropertiesSafe,
  SDL3.Sys.Properties.createProperties,
  SDL3.Sys.Properties.createPropertiesSafe,
  SDL3.Sys.Properties.copyProperties,
  SDL3.Sys.Properties.copyPropertiesSafe,
  SDL3.Sys.Properties.lockProperties,
  SDL3.Sys.Properties.lockPropertiesSafe,
  SDL3.Sys.Properties.unlockProperties,
  SDL3.Sys.Properties.unlockPropertiesSafe,
  SDL3.Sys.Properties.setPointerPropertyWithCleanupSafe,
  SDL3.Sys.Properties.setPointerProperty,
  SDL3.Sys.Properties.setPointerPropertySafe,
  SDL3.Sys.Properties.setStringProperty,
  SDL3.Sys.Properties.setStringPropertySafe,
  SDL3.Sys.Properties.setNumberProperty,
  SDL3.Sys.Properties.setNumberPropertySafe,
  SDL3.Sys.Properties.setFloatProperty,
  SDL3.Sys.Properties.setFloatPropertySafe,
  SDL3.Sys.Properties.setBooleanProperty,
  SDL3.Sys.Properties.setBooleanPropertySafe,
  SDL3.Sys.Properties.hasProperty,
  SDL3.Sys.Properties.hasPropertySafe,
  SDL3.Sys.Properties.getPropertyType,
  SDL3.Sys.Properties.getPropertyTypeSafe,
  SDL3.Sys.Properties.getPointerProperty,
  SDL3.Sys.Properties.getPointerPropertySafe,
  SDL3.Sys.Properties.getStringProperty,
  SDL3.Sys.Properties.getStringPropertySafe,
  SDL3.Sys.Properties.getNumberProperty,
  SDL3.Sys.Properties.getNumberPropertySafe,
  SDL3.Sys.Properties.getFloatProperty,
  SDL3.Sys.Properties.getFloatPropertySafe,
  SDL3.Sys.Properties.getBooleanProperty,
  SDL3.Sys.Properties.getBooleanPropertySafe,
  SDL3.Sys.Properties.clearProperty,
  SDL3.Sys.Properties.clearPropertySafe,
  SDL3.Sys.Properties.enumeratePropertiesSafe,
  SDL3.Sys.Properties.destroyProperties,
  SDL3.Sys.Properties.destroyPropertiesSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Properties
import SDL3.Sys.Bindgen.Properties.Safe qualified as Safe
import SDL3.Sys.Bindgen.Properties.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Get the global SDL properties.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetGlobalProperties@.
--                   The safe flavor is 'getGlobalPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetGlobalProperties@, defined at @SDL3\/SDL_properties.h 118:46@
getGlobalProperties :: IO SDL_PropertiesID
getGlobalProperties = Unsafe.sDL_GetGlobalProperties

-- | Get the global SDL properties.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetGlobalProperties@.
--                   The unsafe flavor is 'getGlobalProperties'
--                   .
--
--     [C declaration]: @SDL_GetGlobalProperties@, defined at @SDL3\/SDL_properties.h 118:46@
getGlobalPropertiesSafe :: IO SDL_PropertiesID
getGlobalPropertiesSafe =
  Safe.sDL_GetGlobalProperties

-- | Create a group of properties.
--
--     All properties are automatically destroyed when 'SDL3.Sys.Init.quit' is called.
--
--     [Returns]: an ID for a new group of properties, or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateProperties@.
--                   The safe flavor is 'createPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_CreateProperties@, defined at @SDL3\/SDL_properties.h 134:46@
createProperties :: IO SDL_PropertiesID
createProperties = Unsafe.sDL_CreateProperties

-- | Create a group of properties.
--
--     All properties are automatically destroyed when 'SDL3.Sys.Init.quit' is called.
--
--     [Returns]: an ID for a new group of properties, or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'destroyProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateProperties@.
--                   The unsafe flavor is 'createProperties'
--                   .
--
--     [C declaration]: @SDL_CreateProperties@, defined at @SDL3\/SDL_properties.h 134:46@
createPropertiesSafe :: IO SDL_PropertiesID
createPropertiesSafe = Safe.sDL_CreateProperties

-- | Copy a group of properties.
--
--     Copy all the properties from one group of properties to another, with the exception of properties requiring cleanup (set using @'setPointerPropertyWithCleanupSafe'@), which will not be copied. Any property that already exists on @dst@ will be overwritten.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread. This function acquires simultaneous mutex locks on both the source and destination property sets.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CopyProperties@.
--                   The safe flavor is 'copyPropertiesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyProperties@, defined at @SDL3\/SDL_properties.h 155:34@
copyProperties
  :: SDL_PropertiesID
  -- ^
  --
  --           [@src@]: the properties to copy.
  -> SDL_PropertiesID
  -- ^
  --
  --           [@dst@]: the destination properties.
  -> IO Bool
copyProperties =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_CopyProperties x00 x11)

-- | Copy a group of properties.
--
--     Copy all the properties from one group of properties to another, with the exception of properties requiring cleanup (set using @'setPointerPropertyWithCleanupSafe'@), which will not be copied. Any property that already exists on @dst@ will be overwritten.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread. This function acquires simultaneous mutex locks on both the source and destination property sets.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CopyProperties@.
--                   The unsafe flavor is 'copyProperties'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyProperties@, defined at @SDL3\/SDL_properties.h 155:34@
copyPropertiesSafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@src@]: the properties to copy.
  -> SDL_PropertiesID
  -- ^
  --
  --           [@dst@]: the destination properties.
  -> IO Bool
copyPropertiesSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_CopyProperties x00 x11)

-- | Lock a group of properties.
--
--     Obtain a multi-threaded lock for these properties. Other threads will wait while trying to lock these properties until they are unlocked. Properties must be unlocked before they are destroyed.
--
--     The lock is automatically taken when setting individual properties, this function is only needed when you want to set several properties atomically or want to guarantee that properties being queried aren\'t freed in another thread.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'unlockProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockProperties@.
--                   The safe flavor is 'lockPropertiesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockProperties@, defined at @SDL3\/SDL_properties.h 179:34@
lockProperties
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to lock.
  -> IO Bool
lockProperties =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_LockProperties x00)

-- | Lock a group of properties.
--
--     Obtain a multi-threaded lock for these properties. Other threads will wait while trying to lock these properties until they are unlocked. Properties must be unlocked before they are destroyed.
--
--     The lock is automatically taken when setting individual properties, this function is only needed when you want to set several properties atomically or want to guarantee that properties being queried aren\'t freed in another thread.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'unlockProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockProperties@.
--                   The unsafe flavor is 'lockProperties'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockProperties@, defined at @SDL3\/SDL_properties.h 179:34@
lockPropertiesSafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to lock.
  -> IO Bool
lockPropertiesSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_LockProperties x00)

-- | Unlock a group of properties.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnlockProperties@.
--                   The safe flavor is 'unlockPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_UnlockProperties@, defined at @SDL3\/SDL_properties.h 192:34@
unlockProperties
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to unlock.
  -> IO ()
unlockProperties = Unsafe.sDL_UnlockProperties

-- | Unlock a group of properties.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'lockProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnlockProperties@.
--                   The unsafe flavor is 'unlockProperties'
--                   .
--
--     [C declaration]: @SDL_UnlockProperties@, defined at @SDL3\/SDL_properties.h 192:34@
unlockPropertiesSafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to unlock.
  -> IO ()
unlockPropertiesSafe = Safe.sDL_UnlockProperties

-- | Set a pointer property in a group of properties with a cleanup function that is called when the property is deleted.
--
--     The cleanup function is also called if setting the property fails for any reason.
--
--     For simply setting basic data types, like numbers, bools, or strings, use 'setNumberProperty', 'setBooleanProperty', or 'setStringProperty' instead, as those functions will handle cleanup on your behalf. This function is only for more complex, custom data.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPointerProperty', 'setPointerProperty', 'SDL_CleanupPropertyCallback'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetPointerPropertyWithCleanup@.
--                   The unsafe import is not exported
--                   : invokes the cleanup callback synchronously on failure or overwrite.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Properties.Unsafe.sDL_SetPointerPropertyWithCleanup@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetPointerPropertyWithCleanup@, defined at @SDL3\/SDL_properties.h 247:34@
setPointerPropertyWithCleanupSafe
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
  -> IO Bool
setPointerPropertyWithCleanupSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_SetPointerPropertyWithCleanup x00 x11 x22 x33 x44)

-- | Set a pointer property in a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPointerProperty', 'hasProperty', 'setBooleanProperty', 'setFloatProperty', 'setNumberProperty', 'setPointerPropertyWithCleanupSafe', 'setStringProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetPointerProperty@.
--                   The safe flavor is 'setPointerPropertySafe'
--                   : overwriting a cleanup property invokes its cleanup synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetPointerProperty@, defined at @SDL3\/SDL_properties.h 270:34@
setPointerProperty
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
  -> IO Bool
setPointerProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetPointerProperty x00 x11 x22)

-- | Set a pointer property in a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPointerProperty', 'hasProperty', 'setBooleanProperty', 'setFloatProperty', 'setNumberProperty', 'setPointerPropertyWithCleanupSafe', 'setStringProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetPointerProperty@.
--                   The unsafe flavor is 'setPointerProperty'
--                   : overwriting a cleanup property invokes its cleanup synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetPointerProperty@, defined at @SDL3\/SDL_properties.h 270:34@
setPointerPropertySafe
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
  -> IO Bool
setPointerPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetPointerProperty x00 x11 x22)

-- | Set a string property in a group of properties.
--
--     This function makes a copy of the string; the caller does not have to preserve the data after this call completes.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getStringProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetStringProperty@.
--                   The safe flavor is 'setStringPropertySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetStringProperty@, defined at @SDL3\/SDL_properties.h 290:34@
setStringProperty
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
  -> IO Bool
setStringProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetStringProperty x00 x11 x22)

-- | Set a string property in a group of properties.
--
--     This function makes a copy of the string; the caller does not have to preserve the data after this call completes.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getStringProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetStringProperty@.
--                   The unsafe flavor is 'setStringProperty'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetStringProperty@, defined at @SDL3\/SDL_properties.h 290:34@
setStringPropertySafe
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
  -> IO Bool
setStringPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetStringProperty x00 x11 x22)

-- | Set an integer property in a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumberProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetNumberProperty@.
--                   The safe flavor is 'setNumberPropertySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetNumberProperty@, defined at @SDL3\/SDL_properties.h 307:34@
setNumberProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> BG.Int64
  -- ^
  --
  --           [@value@]: the new value of the property.
  -> IO Bool
setNumberProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetNumberProperty x00 x11 (Coerce.coerce x22))

-- | Set an integer property in a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getNumberProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetNumberProperty@.
--                   The unsafe flavor is 'setNumberProperty'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetNumberProperty@, defined at @SDL3\/SDL_properties.h 307:34@
setNumberPropertySafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> BG.Int64
  -- ^
  --
  --           [@value@]: the new value of the property.
  -> IO Bool
setNumberPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetNumberProperty x00 x11 (Coerce.coerce x22))

-- | Set a floating point property in a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getFloatProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetFloatProperty@.
--                   The safe flavor is 'setFloatPropertySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetFloatProperty@, defined at @SDL3\/SDL_properties.h 324:34@
setFloatProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> Float
  -- ^
  --
  --           [@value@]: the new value of the property.
  -> IO Bool
setFloatProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetFloatProperty x00 x11 (Coerce.coerce x22))

-- | Set a floating point property in a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getFloatProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetFloatProperty@.
--                   The unsafe flavor is 'setFloatProperty'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetFloatProperty@, defined at @SDL3\/SDL_properties.h 324:34@
setFloatPropertySafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> Float
  -- ^
  --
  --           [@value@]: the new value of the property.
  -> IO Bool
setFloatPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetFloatProperty x00 x11 (Coerce.coerce x22))

-- | Set a boolean property in a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getBooleanProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetBooleanProperty@.
--                   The safe flavor is 'setBooleanPropertySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetBooleanProperty@, defined at @SDL3\/SDL_properties.h 341:34@
setBooleanProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> Bool
  -- ^
  --
  --           [@value@]: the new value of the property.
  -> IO Bool
setBooleanProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetBooleanProperty x00 x11 (CBool.fromBool x22))

-- | Set a boolean property in a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getBooleanProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetBooleanProperty@.
--                   The unsafe flavor is 'setBooleanProperty'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetBooleanProperty@, defined at @SDL3\/SDL_properties.h 341:34@
setBooleanPropertySafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to modify.
  -> Bool
  -- ^
  --
  --           [@value@]: the new value of the property.
  -> IO Bool
setBooleanPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetBooleanProperty x00 x11 (CBool.fromBool x22))

-- | Return whether a property exists in a group of properties.
--
--     [Returns]: true if the property exists, or false if it doesn\'t.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasProperty@.
--                   The safe flavor is 'hasPropertySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasProperty@, defined at @SDL3\/SDL_properties.h 356:34@
hasProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> IO Bool
hasProperty =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_HasProperty x00 x11)

-- | Return whether a property exists in a group of properties.
--
--     [Returns]: true if the property exists, or false if it doesn\'t.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasProperty@.
--                   The unsafe flavor is 'hasProperty'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasProperty@, defined at @SDL3\/SDL_properties.h 356:34@
hasPropertySafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> IO Bool
hasPropertySafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_HasProperty x00 x11)

-- | Get the type of a property in a group of properties.
--
--     [Returns]: the type of the property, or SDL_PROPERTY_TYPE_INVALID if it is not set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPropertyType@.
--                   The safe flavor is 'getPropertyTypeSafe'
--                   .
--
--     [C declaration]: @SDL_GetPropertyType@, defined at @SDL3\/SDL_properties.h 372:46@
getPropertyType
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> IO SDL_PropertyType
getPropertyType = Unsafe.sDL_GetPropertyType

-- | Get the type of a property in a group of properties.
--
--     [Returns]: the type of the property, or SDL_PROPERTY_TYPE_INVALID if it is not set.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'hasProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPropertyType@.
--                   The unsafe flavor is 'getPropertyType'
--                   .
--
--     [C declaration]: @SDL_GetPropertyType@, defined at @SDL3\/SDL_properties.h 372:46@
getPropertyTypeSafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> IO SDL_PropertyType
getPropertyTypeSafe = Safe.sDL_GetPropertyType

-- | Get a pointer property from a group of properties.
--
--     By convention, the names of properties that SDL exposes on objects will start with \"SDL.\", and properties that SDL uses internally will start with \"SDL.internal.\". These should be considered read-only and should not be modified by applications.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a pointer property.
--
--     [Thread safety]: It is safe to call this function from any thread, although the data returned is not protected and could potentially be freed if you call @'setPointerProperty'@ or @'clearProperty'@ on these properties from another thread. If you need to avoid this, use @'lockProperties'@ and @'unlockProperties'@.
--
--     @since 3.2.0
--
--     [See also]: 'getBooleanProperty', 'getFloatProperty', 'getNumberProperty', 'getPropertyType', 'getStringProperty', 'hasProperty', 'setPointerProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPointerProperty@.
--                   The safe flavor is 'getPointerPropertySafe'
--                   .
--
--     [C declaration]: @SDL_GetPointerProperty@, defined at @SDL3\/SDL_properties.h 405:36@
getPointerProperty
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
getPointerProperty = Unsafe.sDL_GetPointerProperty

-- | Get a pointer property from a group of properties.
--
--     By convention, the names of properties that SDL exposes on objects will start with \"SDL.\", and properties that SDL uses internally will start with \"SDL.internal.\". These should be considered read-only and should not be modified by applications.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a pointer property.
--
--     [Thread safety]: It is safe to call this function from any thread, although the data returned is not protected and could potentially be freed if you call @'setPointerProperty'@ or @'clearProperty'@ on these properties from another thread. If you need to avoid this, use @'lockProperties'@ and @'unlockProperties'@.
--
--     @since 3.2.0
--
--     [See also]: 'getBooleanProperty', 'getFloatProperty', 'getNumberProperty', 'getPropertyType', 'getStringProperty', 'hasProperty', 'setPointerProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPointerProperty@.
--                   The unsafe flavor is 'getPointerProperty'
--                   .
--
--     [C declaration]: @SDL_GetPointerProperty@, defined at @SDL3\/SDL_properties.h 405:36@
getPointerPropertySafe
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
getPointerPropertySafe = Safe.sDL_GetPointerProperty

-- | Get a string property from a group of properties.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a string property.
--
--     [Thread safety]: It is safe to call this function from any thread, although the data returned is not protected and could potentially be freed if you call @'setStringProperty'@ or @'clearProperty'@ on these properties from another thread. If you need to avoid this, use @'lockProperties'@ and @'unlockProperties'@.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType', 'hasProperty', 'setStringProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetStringProperty@.
--                   The safe flavor is 'getStringPropertySafe'
--                   .
--
--     [C declaration]: @SDL_GetStringProperty@, defined at @SDL3\/SDL_properties.h 429:42@
getStringProperty
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
getStringProperty = Unsafe.sDL_GetStringProperty

-- | Get a string property from a group of properties.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a string property.
--
--     [Thread safety]: It is safe to call this function from any thread, although the data returned is not protected and could potentially be freed if you call @'setStringProperty'@ or @'clearProperty'@ on these properties from another thread. If you need to avoid this, use @'lockProperties'@ and @'unlockProperties'@.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType', 'hasProperty', 'setStringProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetStringProperty@.
--                   The unsafe flavor is 'getStringProperty'
--                   .
--
--     [C declaration]: @SDL_GetStringProperty@, defined at @SDL3\/SDL_properties.h 429:42@
getStringPropertySafe
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
getStringPropertySafe = Safe.sDL_GetStringProperty

-- | Get a number property from a group of properties.
--
--     You can use @'getPropertyType'@ to query whether the property exists and is a number property.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a number property.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType', 'hasProperty', 'setNumberProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumberProperty@.
--                   The safe flavor is 'getNumberPropertySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumberProperty@, defined at @SDL3\/SDL_properties.h 451:36@
getNumberProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> BG.Int64
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO BG.Int64
getNumberProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_GetNumberProperty x00 x11 (Coerce.coerce x22))

-- | Get a number property from a group of properties.
--
--     You can use @'getPropertyType'@ to query whether the property exists and is a number property.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a number property.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType', 'hasProperty', 'setNumberProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumberProperty@.
--                   The unsafe flavor is 'getNumberProperty'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumberProperty@, defined at @SDL3\/SDL_properties.h 451:36@
getNumberPropertySafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> BG.Int64
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO BG.Int64
getNumberPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_GetNumberProperty x00 x11 (Coerce.coerce x22))

-- | Get a floating point property from a group of properties.
--
--     You can use @'getPropertyType'@ to query whether the property exists and is a floating point property.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a float property.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType', 'hasProperty', 'setFloatProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetFloatProperty@.
--                   The safe flavor is 'getFloatPropertySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetFloatProperty@, defined at @SDL3\/SDL_properties.h 473:35@
getFloatProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> Float
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO Float
getFloatProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_GetFloatProperty x00 x11 (Coerce.coerce x22))

-- | Get a floating point property from a group of properties.
--
--     You can use @'getPropertyType'@ to query whether the property exists and is a floating point property.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a float property.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType', 'hasProperty', 'setFloatProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetFloatProperty@.
--                   The unsafe flavor is 'getFloatProperty'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetFloatProperty@, defined at @SDL3\/SDL_properties.h 473:35@
getFloatPropertySafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> Float
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO Float
getFloatPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_GetFloatProperty x00 x11 (Coerce.coerce x22))

-- | Get a boolean property from a group of properties.
--
--     You can use @'getPropertyType'@ to query whether the property exists and is a boolean property.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a boolean property.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType', 'hasProperty', 'setBooleanProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetBooleanProperty@.
--                   The safe flavor is 'getBooleanPropertySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetBooleanProperty@, defined at @SDL3\/SDL_properties.h 495:34@
getBooleanProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> Bool
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO Bool
getBooleanProperty =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetBooleanProperty x00 x11 (CBool.fromBool x22))

-- | Get a boolean property from a group of properties.
--
--     You can use @'getPropertyType'@ to query whether the property exists and is a boolean property.
--
--     [Returns]: the value of the property, or @default_value@ if it is not set or not a boolean property.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPropertyType', 'hasProperty', 'setBooleanProperty'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetBooleanProperty@.
--                   The unsafe flavor is 'getBooleanProperty'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetBooleanProperty@, defined at @SDL3\/SDL_properties.h 495:34@
getBooleanPropertySafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to query.
  -> Bool
  -- ^
  --
  --           [@default_value@]: the default value of the property.
  -> IO Bool
getBooleanPropertySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetBooleanProperty x00 x11 (CBool.fromBool x22))

-- | Clear a property from a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ClearProperty@.
--                   The safe flavor is 'clearPropertySafe'
--                   : clearing a cleanup property invokes its cleanup synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearProperty@, defined at @SDL3\/SDL_properties.h 509:34@
clearProperty
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to clear.
  -> IO Bool
clearProperty =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ClearProperty x00 x11)

-- | Clear a property from a group of properties.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ClearProperty@.
--                   The unsafe flavor is 'clearProperty'
--                   : clearing a cleanup property invokes its cleanup synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearProperty@, defined at @SDL3\/SDL_properties.h 509:34@
clearPropertySafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to modify.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the property to clear.
  -> IO Bool
clearPropertySafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ClearProperty x00 x11)

-- | Enumerate the properties contained in a group of properties.
--
--     The callback function is called for each property in the group of properties. The properties are locked during enumeration.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EnumerateProperties@.
--                   The unsafe import is not exported
--                   : invokes the callback per property synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Properties.Unsafe.sDL_EnumerateProperties@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_EnumerateProperties@, defined at @SDL3\/SDL_properties.h 546:34@
enumeratePropertiesSafe
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
  -> IO Bool
enumeratePropertiesSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_EnumerateProperties x00 x11 x22)

-- | Destroy a group of properties.
--
--     All properties are deleted and their cleanup functions will be called, if any.
--
--     [Thread safety]: This function should not be called while these properties are locked or other threads might be setting or getting values from these properties.
--
--     @since 3.2.0
--
--     [See also]: 'createProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyProperties@.
--                   The safe flavor is 'destroyPropertiesSafe'
--                   : invokes cleanup callbacks synchronously.
--
--     [C declaration]: @SDL_DestroyProperties@, defined at @SDL3\/SDL_properties.h 564:34@
destroyProperties
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to destroy.
  -> IO ()
destroyProperties = Unsafe.sDL_DestroyProperties

-- | Destroy a group of properties.
--
--     All properties are deleted and their cleanup functions will be called, if any.
--
--     [Thread safety]: This function should not be called while these properties are locked or other threads might be setting or getting values from these properties.
--
--     @since 3.2.0
--
--     [See also]: 'createProperties'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyProperties@.
--                   The unsafe flavor is 'destroyProperties'
--                   : invokes cleanup callbacks synchronously.
--
--     [C declaration]: @SDL_DestroyProperties@, defined at @SDL3\/SDL_properties.h 564:34@
destroyPropertiesSafe
  :: SDL_PropertiesID
  -- ^
  --
  --           [@props@]: the properties to destroy.
  -> IO ()
destroyPropertiesSafe = Safe.sDL_DestroyProperties
