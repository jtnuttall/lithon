{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.ErrorShims.Unsafe (
  SDL3.Sys.Bindgen.ErrorShims.Unsafe.lithon_SDL_SetError,
  SDL3.Sys.Bindgen.ErrorShims.Unsafe.lithon_SDL_Unsupported,
  SDL3.Sys.Bindgen.ErrorShims.Unsafe.lithon_SDL_InvalidParamError,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_error_shims.h>"
         , "_Bool hs_bindgen_44e349ce92676930 ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_SetError)(arg1);"
         , "}"
         , "_Bool hs_bindgen_4a10ba5fb8669169 (void)"
         , "{"
         , "  return (lithon_SDL_Unsupported)();"
         , "}"
         , "_Bool hs_bindgen_a2fdd1e78f2ff50d ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_InvalidParamError)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_Unsafe_lithon_SDL_SetError@
foreign import ccall unsafe "hs_bindgen_44e349ce92676930"
  hs_bindgen_44e349ce92676930_base
    :: BG.Ptr BG.Void
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_Unsafe_lithon_SDL_SetError@
hs_bindgen_44e349ce92676930
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_44e349ce92676930 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_44e349ce92676930_base (BG.toFFIType x0))

-- | Set the SDL error message for the current thread.
--
--     A fixed-arity shim over the variadic SDL_SetError: @message@ becomes the error message verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     Calling this function will replace any previous error message that was set. It always returns false, since SDL frequently uses false to signify a failing result.
--
--     [Returns]: false.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_ClearError, SDL_GetError
--
--     [C declaration]: @lithon_SDL_SetError@, defined at @sdl3-bindgen-sys\/SDL_error_shims.h 45:24@
lithon_SDL_SetError
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@message@]: the error message, in UTF-8.
  -> IO BG.CBool
lithon_SDL_SetError = hs_bindgen_44e349ce92676930

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_Unsafe_lithon_SDL_Unsupported@
foreign import ccall unsafe "hs_bindgen_4a10ba5fb8669169"
  hs_bindgen_4a10ba5fb8669169_base
    :: IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_Unsafe_lithon_SDL_Unsupported@
hs_bindgen_4a10ba5fb8669169 :: IO BG.CBool
hs_bindgen_4a10ba5fb8669169 =
  fmap BG.fromFFIType hs_bindgen_4a10ba5fb8669169_base

-- | Report an unsupported operation with SDL\'s standard error message.
--
--     The SDL_Unsupported macro as a function: it sets the error message to \"That operation is not supported\".
--
--     [Returns]: false.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_SetError
--
--     [C declaration]: @lithon_SDL_Unsupported@, defined at @sdl3-bindgen-sys\/SDL_error_shims.h 64:24@
lithon_SDL_Unsupported :: IO BG.CBool
lithon_SDL_Unsupported = hs_bindgen_4a10ba5fb8669169

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_Unsafe_lithon_SDL_InvalidParamError@
foreign import ccall unsafe "hs_bindgen_a2fdd1e78f2ff50d"
  hs_bindgen_a2fdd1e78f2ff50d_base
    :: BG.Ptr BG.Void
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_Unsafe_lithon_SDL_InvalidParamError@
hs_bindgen_a2fdd1e78f2ff50d
  :: PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_a2fdd1e78f2ff50d =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_a2fdd1e78f2ff50d_base (BG.toFFIType x0))

-- | Report an invalid parameter with SDL\'s standard error message.
--
--     The SDL_InvalidParamError macro as a function: it sets the error message to \"Parameter \'name\' is invalid\", with the parameter\'s name in place of name.
--
--     [Returns]: false.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_SetError
--
--     [C declaration]: @lithon_SDL_InvalidParamError@, defined at @sdl3-bindgen-sys\/SDL_error_shims.h 84:24@
lithon_SDL_InvalidParamError
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@param@]: the name of the invalid parameter, in UTF-8.
  -> IO BG.CBool
lithon_SDL_InvalidParamError =
  hs_bindgen_a2fdd1e78f2ff50d
