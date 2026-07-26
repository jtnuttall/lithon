{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Loadso.Unsafe (
  SDL3.Sys.Bindgen.Loadso.Unsafe.sDL_LoadObject,
  SDL3.Sys.Bindgen.Loadso.Unsafe.sDL_LoadFunction,
  SDL3.Sys.Bindgen.Loadso.Unsafe.sDL_UnloadObject,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Loadso
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_loadso.h>"
         , "SDL_SharedObject *hs_bindgen_480ab0651497eddb ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_LoadObject)(arg1);"
         , "}"
         , "SDL_FunctionPointer hs_bindgen_215b1c5734d854fe ("
         , "  SDL_SharedObject *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_LoadFunction)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_0898e457bf0f2807 ("
         , "  SDL_SharedObject *arg1"
         , ")"
         , "{"
         , "  (SDL_UnloadObject)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_Unsafe_SDL_LoadObject@
foreign import ccall unsafe "hs_bindgen_480ab0651497eddb"
  hs_bindgen_480ab0651497eddb_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_Unsafe_SDL_LoadObject@
hs_bindgen_480ab0651497eddb
  :: PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_SharedObject)
hs_bindgen_480ab0651497eddb =
  BG.fromFFIType hs_bindgen_480ab0651497eddb_base

-- | Dynamically load a shared object.
--
--     [Returns]: an opaque pointer to the object handle or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LoadFunction', 'sDL_UnloadObject'
--
--     [C declaration]: @SDL_LoadObject@, defined at @SDL3\/SDL_loadso.h 93:48@
sDL_LoadObject
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@sofile@]: a system-dependent name of the object file.
  -> IO (BG.Ptr SDL_SharedObject)
sDL_LoadObject = hs_bindgen_480ab0651497eddb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_Unsafe_SDL_LoadFunction@
foreign import ccall unsafe "hs_bindgen_215b1c5734d854fe"
  hs_bindgen_215b1c5734d854fe_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_Unsafe_SDL_LoadFunction@
hs_bindgen_215b1c5734d854fe
  :: BG.Ptr SDL_SharedObject
  -> PtrConst.PtrConst BG.CChar
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
hs_bindgen_215b1c5734d854fe =
  BG.fromFFIType hs_bindgen_215b1c5734d854fe_base

-- | Look up the address of the named function in a shared object.
--
--     This function pointer is no longer valid after calling @SDL_UnloadObject()@.
--
--     This function can only look up C function names. Other languages may have name mangling and intrinsic language support that varies from compiler to compiler.
--
--     Make sure you declare your function pointers with the same calling convention as the actual library function. Your code will crash mysteriously if you do not do this.
--
--     If the requested function doesn\'t exist, NULL is returned.
--
--     [Returns]: a pointer to the function or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LoadObject'
--
--     [C declaration]: @SDL_LoadFunction@, defined at @SDL3\/SDL_loadso.h 121:49@
sDL_LoadFunction
  :: BG.Ptr SDL_SharedObject
  -- ^
  --
  --           [@handle@]: a valid shared object handle returned by @SDL_LoadObject()@.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@name@]: the name of the function to look up.
  -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
sDL_LoadFunction = hs_bindgen_215b1c5734d854fe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_Unsafe_SDL_UnloadObject@
foreign import ccall unsafe "hs_bindgen_0898e457bf0f2807"
  hs_bindgen_0898e457bf0f2807_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_Unsafe_SDL_UnloadObject@
hs_bindgen_0898e457bf0f2807
  :: BG.Ptr SDL_SharedObject
  -> IO ()
hs_bindgen_0898e457bf0f2807 =
  BG.fromFFIType hs_bindgen_0898e457bf0f2807_base

-- | Unload a shared object from memory.
--
--     Note that any pointers from this object looked up through @SDL_LoadFunction()@ will no longer be valid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LoadObject'
--
--     [C declaration]: @SDL_UnloadObject@, defined at @SDL3\/SDL_loadso.h 137:34@
sDL_UnloadObject
  :: BG.Ptr SDL_SharedObject
  -- ^
  --
  --           [@handle@]: a valid shared object handle returned by @SDL_LoadObject()@.
  -> IO ()
sDL_UnloadObject = hs_bindgen_0898e457bf0f2807
