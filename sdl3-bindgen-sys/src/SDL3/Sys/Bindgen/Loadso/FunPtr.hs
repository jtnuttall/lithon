{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Loadso.FunPtr (
  SDL3.Sys.Bindgen.Loadso.FunPtr.sDL_LoadObject,
  SDL3.Sys.Bindgen.Loadso.FunPtr.sDL_LoadFunction,
  SDL3.Sys.Bindgen.Loadso.FunPtr.sDL_UnloadObject,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_get_SDL_LoadObject */"
         , "__attribute__ ((const))"
         , "SDL_SharedObject *(*hs_bindgen_06ede04ef7bebd95 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_LoadObject;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_get_SDL_LoadFunction */"
         , "__attribute__ ((const))"
         , "SDL_FunctionPointer (*hs_bindgen_c0b414522c89c9e2 (void)) ("
         , "  SDL_SharedObject *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_LoadFunction;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_get_SDL_UnloadObject */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_a3520810bae0da07 (void)) ("
         , "  SDL_SharedObject *arg1"
         , ")"
         , "{"
         , "  return &SDL_UnloadObject;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_get_SDL_LoadObject@
foreign import ccall unsafe "hs_bindgen_06ede04ef7bebd95"
  hs_bindgen_06ede04ef7bebd95_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_get_SDL_LoadObject@
hs_bindgen_06ede04ef7bebd95
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_SharedObject)))
hs_bindgen_06ede04ef7bebd95 =
  BG.fromFFIType hs_bindgen_06ede04ef7bebd95_base

{-# NOINLINE sDL_LoadObject #-}

-- | Dynamically load a shared object.
--
--     [@sofile@]: a system-dependent name of the object file.
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
sDL_LoadObject :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_SharedObject))
sDL_LoadObject =
  BG.unsafePerformIO hs_bindgen_06ede04ef7bebd95

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_get_SDL_LoadFunction@
foreign import ccall unsafe "hs_bindgen_c0b414522c89c9e2"
  hs_bindgen_c0b414522c89c9e2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_get_SDL_LoadFunction@
hs_bindgen_c0b414522c89c9e2
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_SharedObject
             -> PtrConst.PtrConst BG.CChar
             -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
           )
       )
hs_bindgen_c0b414522c89c9e2 =
  BG.fromFFIType hs_bindgen_c0b414522c89c9e2_base

{-# NOINLINE sDL_LoadFunction #-}

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
--     [@handle@]: a valid shared object handle returned by @SDL_LoadObject()@.
--
--     [@name@]: the name of the function to look up.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_SharedObject
         -> PtrConst.PtrConst BG.CChar
         -> IO SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer
       )
sDL_LoadFunction =
  BG.unsafePerformIO hs_bindgen_c0b414522c89c9e2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_get_SDL_UnloadObject@
foreign import ccall unsafe "hs_bindgen_a3520810bae0da07"
  hs_bindgen_a3520810bae0da07_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Loadso_get_SDL_UnloadObject@
hs_bindgen_a3520810bae0da07 :: IO (BG.FunPtr (BG.Ptr SDL_SharedObject -> IO ()))
hs_bindgen_a3520810bae0da07 =
  BG.fromFFIType hs_bindgen_a3520810bae0da07_base

{-# NOINLINE sDL_UnloadObject #-}

-- | Unload a shared object from memory.
--
--     Note that any pointers from this object looked up through @SDL_LoadFunction()@ will no longer be valid.
--
--     [@handle@]: a valid shared object handle returned by @SDL_LoadObject()@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LoadObject'
--
--     [C declaration]: @SDL_UnloadObject@, defined at @SDL3\/SDL_loadso.h 137:34@
sDL_UnloadObject :: BG.FunPtr (BG.Ptr SDL_SharedObject -> IO ())
sDL_UnloadObject =
  BG.unsafePerformIO hs_bindgen_a3520810bae0da07
