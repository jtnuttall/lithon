{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.IostreamShims.Safe (
  SDL3.Sys.Bindgen.IostreamShims.Safe.lithon_SDL_IOprintf,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Iostream qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_iostream_shims.h>"
         , "size_t hs_bindgen_d76177092e1a5fce ("
         , "  SDL_IOStream *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (lithon_SDL_IOprintf)(arg1, arg2);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.IostreamShims_Safe_lithon_SDL_IOprintf@
foreign import ccall safe "hs_bindgen_d76177092e1a5fce"
  hs_bindgen_d76177092e1a5fce_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO HsBindgen.Runtime.LibC.CSize

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.IostreamShims_Safe_lithon_SDL_IOprintf@
hs_bindgen_d76177092e1a5fce
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -> PtrConst.PtrConst BG.CChar
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_d76177092e1a5fce =
  \x0 ->
    \x1 ->
      fmap BG.fromFFIType (hs_bindgen_d76177092e1a5fce_base (BG.toFFIType x0) (BG.toFFIType x1))

-- | Print a string to an SDL_IOStream data stream.
--
--     A fixed-arity shim over the variadic SDL_IOprintf: @str@ is written verbatim. It is never parsed as a printf-style format string, so a percent sign in it needs no escaping.
--
--     [Returns]: the number of bytes written or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same SDL_IOStream from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: SDL_WriteIO
--
--     [C declaration]: @lithon_SDL_IOprintf@, defined at @sdl3-bindgen-sys\/SDL_iostream_shims.h 42:26@
lithon_SDL_IOprintf
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an SDL_IOStream structure.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@str@]: the NUL-terminated string to write.
  -> IO HsBindgen.Runtime.LibC.CSize
lithon_SDL_IOprintf = hs_bindgen_d76177092e1a5fce
