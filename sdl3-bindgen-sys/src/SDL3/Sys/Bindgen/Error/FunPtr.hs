{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Error.FunPtr (
  SDL3.Sys.Bindgen.Error.FunPtr.sDL_OutOfMemory,
  SDL3.Sys.Bindgen.Error.FunPtr.sDL_GetError,
  SDL3.Sys.Bindgen.Error.FunPtr.sDL_ClearError,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Error_get_SDL_OutOfMemory */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c1c2f6095b18fb13 (void)) (void)"
         , "{"
         , "  return &SDL_OutOfMemory;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Error_get_SDL_GetError */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_030d67d7c033781b (void)) (void)"
         , "{"
         , "  return &SDL_GetError;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Error_get_SDL_ClearError */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_000d9156b04d2f47 (void)) (void)"
         , "{"
         , "  return &SDL_ClearError;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_get_SDL_OutOfMemory@
foreign import ccall unsafe "hs_bindgen_c1c2f6095b18fb13"
  hs_bindgen_c1c2f6095b18fb13_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_get_SDL_OutOfMemory@
hs_bindgen_c1c2f6095b18fb13 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_c1c2f6095b18fb13 =
  BG.fromFFIType hs_bindgen_c1c2f6095b18fb13_base

{-# NOINLINE sDL_OutOfMemory #-}

-- | Set an error indicating that memory allocation failed.
--
--     This function does not do any memory allocation.
--
--     [Returns]: false.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_OutOfMemory@, defined at @SDL3\/SDL_error.h 121:34@
sDL_OutOfMemory :: BG.FunPtr (IO BG.CBool)
sDL_OutOfMemory =
  BG.unsafePerformIO hs_bindgen_c1c2f6095b18fb13

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_get_SDL_GetError@
foreign import ccall unsafe "hs_bindgen_030d67d7c033781b"
  hs_bindgen_030d67d7c033781b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_get_SDL_GetError@
hs_bindgen_030d67d7c033781b :: IO (BG.FunPtr (IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_030d67d7c033781b =
  BG.fromFFIType hs_bindgen_030d67d7c033781b_base

{-# NOINLINE sDL_GetError #-}

-- | Retrieve a message about the last error that occurred on the current thread.
--
--     It is possible for multiple errors to occur before calling @SDL_GetError()@. Only the last error is returned.
--
--     The message is only applicable when an SDL function has signaled an error. You must check the return values of SDL function calls to determine when to appropriately call @SDL_GetError()@. You should /not/ use the results of @SDL_GetError()@ to decide if an error has occurred! Sometimes SDL will set an error string even when reporting success.
--
--     SDL will /not/ clear the error string for successful API calls. You /must/ check return values for failure cases before you can assume the error string applies.
--
--     Error strings are set per-thread, so an error set in a different thread will not interfere with the current thread\'s operation.
--
--     The returned value is a thread-local string which will remain valid until the current thread\'s error string is changed. The caller should make a copy if the value is needed after the next SDL API call.
--
--     [Returns]: a message with information about the specific error that occurred, or an empty string if there hasn\'t been an error message set since the last call to @SDL_ClearError()@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClearError', @SDL_SetError@
--
--     [C declaration]: @SDL_GetError@, defined at @SDL3\/SDL_error.h 158:42@
sDL_GetError :: BG.FunPtr (IO (PtrConst.PtrConst BG.CChar))
sDL_GetError =
  BG.unsafePerformIO hs_bindgen_030d67d7c033781b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_get_SDL_ClearError@
foreign import ccall unsafe "hs_bindgen_000d9156b04d2f47"
  hs_bindgen_000d9156b04d2f47_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_get_SDL_ClearError@
hs_bindgen_000d9156b04d2f47 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_000d9156b04d2f47 =
  BG.fromFFIType hs_bindgen_000d9156b04d2f47_base

{-# NOINLINE sDL_ClearError #-}

-- | Clear any previous error message for this thread.
--
--     [Returns]: true.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetError', @SDL_SetError@
--
--     [C declaration]: @SDL_ClearError@, defined at @SDL3\/SDL_error.h 172:34@
sDL_ClearError :: BG.FunPtr (IO BG.CBool)
sDL_ClearError =
  BG.unsafePerformIO hs_bindgen_000d9156b04d2f47
