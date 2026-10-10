{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.ErrorShims.FunPtr (
  SDL3.Sys.Bindgen.ErrorShims.FunPtr.lithon_SDL_SetError,
  SDL3.Sys.Bindgen.ErrorShims.FunPtr.lithon_SDL_Unsupported,
  SDL3.Sys.Bindgen.ErrorShims.FunPtr.lithon_SDL_InvalidParamError,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_get_lithon_SDL_SetError */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a66f7538e1b5fb4e (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_SetError;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_get_lithon_SDL_Unsupported */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b1a48c819dd22277 (void)) (void)"
         , "{"
         , "  return &lithon_SDL_Unsupported;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_get_lithon_SDL_InvalidParamError */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b87b43a376c75268 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_InvalidParamError;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_get_lithon_SDL_SetError@
foreign import ccall unsafe "hs_bindgen_a66f7538e1b5fb4e"
  hs_bindgen_a66f7538e1b5fb4e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_get_lithon_SDL_SetError@
hs_bindgen_a66f7538e1b5fb4e :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_a66f7538e1b5fb4e =
  fmap BG.fromFFIType hs_bindgen_a66f7538e1b5fb4e_base

{-# NOINLINE lithon_SDL_SetError #-}

-- | Set the SDL error message for the current thread.
--
--     A fixed-arity shim over the variadic SDL_SetError: @message@ becomes the error message verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     Calling this function will replace any previous error message that was set. It always returns false, since SDL frequently uses false to signify a failing result.
--
--     [@message@]: the error message, in UTF-8.
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
lithon_SDL_SetError :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
lithon_SDL_SetError =
  BG.unsafePerformIO hs_bindgen_a66f7538e1b5fb4e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_get_lithon_SDL_Unsupported@
foreign import ccall unsafe "hs_bindgen_b1a48c819dd22277"
  hs_bindgen_b1a48c819dd22277_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_get_lithon_SDL_Unsupported@
hs_bindgen_b1a48c819dd22277 :: IO (BG.FunPtr (IO BG.CBool))
hs_bindgen_b1a48c819dd22277 =
  fmap BG.fromFFIType hs_bindgen_b1a48c819dd22277_base

{-# NOINLINE lithon_SDL_Unsupported #-}

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
lithon_SDL_Unsupported :: BG.FunPtr (IO BG.CBool)
lithon_SDL_Unsupported =
  BG.unsafePerformIO hs_bindgen_b1a48c819dd22277

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_get_lithon_SDL_InvalidParamError@
foreign import ccall unsafe "hs_bindgen_b87b43a376c75268"
  hs_bindgen_b87b43a376c75268_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.ErrorShims_get_lithon_SDL_InvalidParamError@
hs_bindgen_b87b43a376c75268 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_b87b43a376c75268 =
  fmap BG.fromFFIType hs_bindgen_b87b43a376c75268_base

{-# NOINLINE lithon_SDL_InvalidParamError #-}

-- | Report an invalid parameter with SDL\'s standard error message.
--
--     The SDL_InvalidParamError macro as a function: it sets the error message to \"Parameter \'name\' is invalid\", with the parameter\'s name in place of name.
--
--     [@param@]: the name of the invalid parameter, in UTF-8.
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
lithon_SDL_InvalidParamError :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
lithon_SDL_InvalidParamError =
  BG.unsafePerformIO hs_bindgen_b87b43a376c75268
