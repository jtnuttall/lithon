-- | System-dependent library loading routines.
--
--     Shared objects are code that is programmatically loadable at runtime. Windows calls these \"DLLs\", Linux calls them \"shared libraries\", etc.
--
--     To use them, build such a library, then call @'loadObject'@ on it. Once loaded, you can use @'loadFunction'@ on that object to find the address of its exported symbols. When done with the object, call @'unloadObject'@ to dispose of it.
--
--     Some things to keep in mind:
--
--     * These functions only work on C function names. Other languages may have name mangling and intrinsic language support that varies from compiler to compiler.
--
--     * Make sure you declare your function pointers with the same calling convention as the actual library function. Your code will crash mysteriously if you do not do this.
--
--     * Avoid namespace collisions. If you load a symbol from the library, it is not defined whether or not it goes into the global symbol namespace for the application. If it does and it conflicts with symbols in your code or other shared libraries, you will not get the results you expect. :)
--
--     * Once a library is unloaded, all pointers into it obtained through @'loadFunction'@ become invalid, even if the library is later reloaded. Don\'t unload a library if you plan to use these pointers in the future. Notably: beware of giving one of these pointers to atexit(), since it may call that pointer after the library unloads. An opaque datatype that represents a loaded shared object.
--
--     @since 3.2.0
--
--     [See also]: 'loadObject', 'loadFunction', 'unloadObject'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Loadso.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Loadso (
  module SDL3.Sys.Bindgen.Loadso,

  -- * Function aliases
  SDL3.Sys.Loadso.loadObject,
  SDL3.Sys.Loadso.loadObjectSafe,
  SDL3.Sys.Loadso.loadFunction,
  SDL3.Sys.Loadso.loadFunctionSafe,
  SDL3.Sys.Loadso.unloadObject,
  SDL3.Sys.Loadso.unloadObjectSafe,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Loadso
import SDL3.Sys.Bindgen.Loadso.Safe qualified as Safe
import SDL3.Sys.Bindgen.Loadso.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Dynamically load a shared object.
--
--     [Returns]: an opaque pointer to the object handle or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'loadFunction', 'unloadObject'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadObject@.
--                   The safe flavor is 'loadObjectSafe'
--                   .
--
--     [C declaration]: @SDL_LoadObject@, defined at @SDL3\/SDL_loadso.h 93:48@
loadObject
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@sofile@]: a system-dependent name of the object file.
  -> IO (BG.Ptr SDL_SharedObject)
loadObject = Unsafe.sDL_LoadObject

-- | Dynamically load a shared object.
--
--     [Returns]: an opaque pointer to the object handle or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'loadFunction', 'unloadObject'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadObject@.
--                   The unsafe flavor is 'loadObject'
--                   .
--
--     [C declaration]: @SDL_LoadObject@, defined at @SDL3\/SDL_loadso.h 93:48@
loadObjectSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@sofile@]: a system-dependent name of the object file.
  -> IO (BG.Ptr SDL_SharedObject)
loadObjectSafe = Safe.sDL_LoadObject

-- | Look up the address of the named function in a shared object.
--
--     This function pointer is no longer valid after calling @'unloadObject'@.
--
--     This function can only look up C function names. Other languages may have name mangling and intrinsic language support that varies from compiler to compiler.
--
--     Make sure you declare your function pointers with the same calling convention as the actual library function. Your code will crash mysteriously if you do not do this.
--
--     If the requested function doesn\'t exist, NULL is returned.
--
--     [Returns]: a pointer to the function or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'loadObject'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadFunction@.
--                   The safe flavor is 'loadFunctionSafe'
--                   .
--
--     [C declaration]: @SDL_LoadFunction@, defined at @SDL3\/SDL_loadso.h 121:49@
loadFunction
  :: BG.Ptr SDL_SharedObject
  -- ^
  --
  --           [@handle@]: a valid shared object handle returned by @'loadObject'@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the function to look up.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
loadFunction = Unsafe.sDL_LoadFunction

-- | Look up the address of the named function in a shared object.
--
--     This function pointer is no longer valid after calling @'unloadObject'@.
--
--     This function can only look up C function names. Other languages may have name mangling and intrinsic language support that varies from compiler to compiler.
--
--     Make sure you declare your function pointers with the same calling convention as the actual library function. Your code will crash mysteriously if you do not do this.
--
--     If the requested function doesn\'t exist, NULL is returned.
--
--     [Returns]: a pointer to the function or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'loadObject'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadFunction@.
--                   The unsafe flavor is 'loadFunction'
--                   .
--
--     [C declaration]: @SDL_LoadFunction@, defined at @SDL3\/SDL_loadso.h 121:49@
loadFunctionSafe
  :: BG.Ptr SDL_SharedObject
  -- ^
  --
  --           [@handle@]: a valid shared object handle returned by @'loadObject'@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the function to look up.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
loadFunctionSafe = Safe.sDL_LoadFunction

-- | Unload a shared object from memory.
--
--     Note that any pointers from this object looked up through @'loadFunction'@ will no longer be valid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'loadObject'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnloadObject@.
--                   The safe flavor is 'unloadObjectSafe'
--                   .
--
--     [C declaration]: @SDL_UnloadObject@, defined at @SDL3\/SDL_loadso.h 137:34@
unloadObject
  :: BG.Ptr SDL_SharedObject
  -- ^
  --
  --           [@handle@]: a valid shared object handle returned by @'loadObject'@.
  -> IO ()
unloadObject = Unsafe.sDL_UnloadObject

-- | Unload a shared object from memory.
--
--     Note that any pointers from this object looked up through @'loadFunction'@ will no longer be valid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'loadObject'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnloadObject@.
--                   The unsafe flavor is 'unloadObject'
--                   .
--
--     [C declaration]: @SDL_UnloadObject@, defined at @SDL3\/SDL_loadso.h 137:34@
unloadObjectSafe
  :: BG.Ptr SDL_SharedObject
  -- ^
  --
  --           [@handle@]: a valid shared object handle returned by @'loadObject'@.
  -> IO ()
unloadObjectSafe = Safe.sDL_UnloadObject
