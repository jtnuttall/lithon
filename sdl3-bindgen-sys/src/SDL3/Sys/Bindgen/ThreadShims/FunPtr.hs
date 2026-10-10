{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.ThreadShims.FunPtr (
  SDL3.Sys.Bindgen.ThreadShims.FunPtr.lithon_SDL_CreateThread,
  SDL3.Sys.Bindgen.ThreadShims.FunPtr.lithon_SDL_CreateThreadWithProperties,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Thread qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_thread_shims.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.ThreadShims_get_lithon_SDL_CreateThread */"
         , "__attribute__ ((const))"
         , "SDL_Thread *(*hs_bindgen_4e6a4fa76c67ad02 (void)) ("
         , "  SDL_ThreadFunction arg1,"
         , "  char const *arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &lithon_SDL_CreateThread;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.ThreadShims_get_lithon_SDL_CreateThreadWithProperties */"
         , "__attribute__ ((const))"
         , "SDL_Thread *(*hs_bindgen_e399b5c4c93e2e27 (void)) ("
         , "  SDL_PropertiesID arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_CreateThreadWithProperties;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ThreadShims_get_lithon_SDL_CreateThread@
foreign import ccall unsafe "hs_bindgen_4e6a4fa76c67ad02"
  hs_bindgen_4e6a4fa76c67ad02_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ThreadShims_get_lithon_SDL_CreateThread@
hs_bindgen_4e6a4fa76c67ad02
  :: IO
       ( BG.FunPtr
           ( SDL3.Sys.Bindgen.Thread.SDL_ThreadFunction
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr BG.Void
             -> IO (BG.Ptr SDL3.Sys.Bindgen.Thread.SDL_Thread)
           )
       )
hs_bindgen_4e6a4fa76c67ad02 =
  fmap BG.fromFFIType hs_bindgen_4e6a4fa76c67ad02_base

{-# NOINLINE lithon_SDL_CreateThread #-}

-- | Create a new thread with a default stack size.
--
--     The SDL_CreateThread macro as a function. Like the macro, it calls SDL_CreateThreadRuntime with the C runtime\'s thread entry and exit functions for the platform it is compiled on (@_beginthreadex@ and @_endthreadex@ on Windows, NULL elsewhere), so prefer it to calling SDL_CreateThreadRuntime directly.
--
--     This is equivalent to calling SDL_CreateThreadWithProperties with the following properties set:
--
--     * @SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER@: @fn@
--
--     * @SDL_PROP_THREAD_CREATE_NAME_STRING@: @name@
--
--     * @SDL_PROP_THREAD_CREATE_USERDATA_POINTER@: @data@
--
--     [@fn@]: the SDL_ThreadFunction function to call in the new thread.
--
--     [@name@]: the name of the thread.
--
--     [@data@]: a pointer that is passed to @fn@.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_CreateThreadWithProperties, SDL_WaitThread
--
--     [C declaration]: @lithon_SDL_CreateThread@, defined at @sdl3-bindgen-sys\/SDL_thread_shims.h 54:31@
lithon_SDL_CreateThread
  :: BG.FunPtr
       ( SDL3.Sys.Bindgen.Thread.SDL_ThreadFunction
         -> PtrConst.PtrConst BG.CChar
         -> BG.Ptr BG.Void
         -> IO (BG.Ptr SDL3.Sys.Bindgen.Thread.SDL_Thread)
       )
lithon_SDL_CreateThread =
  BG.unsafePerformIO hs_bindgen_4e6a4fa76c67ad02

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ThreadShims_get_lithon_SDL_CreateThreadWithProperties@
foreign import ccall unsafe "hs_bindgen_e399b5c4c93e2e27"
  hs_bindgen_e399b5c4c93e2e27_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ThreadShims_get_lithon_SDL_CreateThreadWithProperties@
hs_bindgen_e399b5c4c93e2e27
  :: IO
       ( BG.FunPtr
           (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL3.Sys.Bindgen.Thread.SDL_Thread))
       )
hs_bindgen_e399b5c4c93e2e27 =
  fmap BG.fromFFIType hs_bindgen_e399b5c4c93e2e27_base

{-# NOINLINE lithon_SDL_CreateThreadWithProperties #-}

-- | Create a new thread with the specified properties.
--
--     The SDL_CreateThreadWithProperties macro as a function, passing the C runtime\'s thread entry and exit functions like SDL_CreateThread does.
--
--     These are the supported properties:
--
--     * @SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER@: an SDL_ThreadFunction value that will be called at the start of the new thread\'s life. Required.
--
--     * @SDL_PROP_THREAD_CREATE_NAME_STRING@: the name of the new thread, which might be available to debuggers. Optional, defaults to NULL.
--
--     * @SDL_PROP_THREAD_CREATE_USERDATA_POINTER@: an arbitrary app-defined pointer, which is passed to the entry function on the new thread, as its only parameter. Optional, defaults to NULL.
--
--     * @SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER@: the size, in bytes, of the new thread\'s stack. Optional, defaults to 0 (system-defined default).
--
--     [@props@]: the properties to use.
--
--     [Returns]: an opaque pointer to the new thread object on success, NULL if the new thread could not be created; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_CreateThread, SDL_WaitThread
--
--     [C declaration]: @lithon_SDL_CreateThreadWithProperties@, defined at @sdl3-bindgen-sys\/SDL_thread_shims.h 90:31@
lithon_SDL_CreateThreadWithProperties
  :: BG.FunPtr
       (SDL3.Sys.Bindgen.Properties.SDL_PropertiesID -> IO (BG.Ptr SDL3.Sys.Bindgen.Thread.SDL_Thread))
lithon_SDL_CreateThreadWithProperties =
  BG.unsafePerformIO hs_bindgen_e399b5c4c93e2e27
