{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Error.Safe (
  SDL3.Sys.Bindgen.Error.Safe.sDL_OutOfMemory,
  SDL3.Sys.Bindgen.Error.Safe.sDL_GetError,
  SDL3.Sys.Bindgen.Error.Safe.sDL_ClearError,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_b76f69013e6d2cc4 (void)"
         , "{"
         , "  return (SDL_OutOfMemory)();"
         , "}"
         , "char const *hs_bindgen_af9c22d77d37c96f (void)"
         , "{"
         , "  return (SDL_GetError)();"
         , "}"
         , "_Bool hs_bindgen_ee4e13eee0d070cc (void)"
         , "{"
         , "  return (SDL_ClearError)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_Safe_SDL_OutOfMemory@
foreign import ccall safe "hs_bindgen_b76f69013e6d2cc4"
  hs_bindgen_b76f69013e6d2cc4_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_Safe_SDL_OutOfMemory@
hs_bindgen_b76f69013e6d2cc4 :: IO BG.CBool
hs_bindgen_b76f69013e6d2cc4 =
  BG.fromFFIType hs_bindgen_b76f69013e6d2cc4_base

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
sDL_OutOfMemory :: IO BG.CBool
sDL_OutOfMemory = hs_bindgen_b76f69013e6d2cc4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_Safe_SDL_GetError@
foreign import ccall safe "hs_bindgen_af9c22d77d37c96f"
  hs_bindgen_af9c22d77d37c96f_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_Safe_SDL_GetError@
hs_bindgen_af9c22d77d37c96f :: IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_af9c22d77d37c96f =
  BG.fromFFIType hs_bindgen_af9c22d77d37c96f_base

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
sDL_GetError :: IO (PtrConst.PtrConst BG.CChar)
sDL_GetError = hs_bindgen_af9c22d77d37c96f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_Safe_SDL_ClearError@
foreign import ccall safe "hs_bindgen_ee4e13eee0d070cc"
  hs_bindgen_ee4e13eee0d070cc_base
    :: IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Error_Safe_SDL_ClearError@
hs_bindgen_ee4e13eee0d070cc :: IO BG.CBool
hs_bindgen_ee4e13eee0d070cc =
  BG.fromFFIType hs_bindgen_ee4e13eee0d070cc_base

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
sDL_ClearError :: IO BG.CBool
sDL_ClearError = hs_bindgen_ee4e13eee0d070cc
