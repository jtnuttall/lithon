{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.StdincShims.Unsafe (
  SDL3.Sys.Bindgen.StdincShims.Unsafe.lithon_SDL_FOURCC,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_stdinc_shims.h>"
         , "Uint32 hs_bindgen_253852faf6da7a5b ("
         , "  Uint8 arg1,"
         , "  Uint8 arg2,"
         , "  Uint8 arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return (lithon_SDL_FOURCC)(arg1, arg2, arg3, arg4);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.StdincShims_Unsafe_lithon_SDL_FOURCC@
foreign import ccall unsafe "hs_bindgen_253852faf6da7a5b"
  hs_bindgen_253852faf6da7a5b_base
    :: HsBindgen.Runtime.LibC.Word8
    -> HsBindgen.Runtime.LibC.Word8
    -> HsBindgen.Runtime.LibC.Word8
    -> HsBindgen.Runtime.LibC.Word8
    -> IO HsBindgen.Runtime.LibC.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.StdincShims_Unsafe_lithon_SDL_FOURCC@
hs_bindgen_253852faf6da7a5b
  :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
hs_bindgen_253852faf6da7a5b =
  \x0 ->
    \x1 ->
      \x2 ->
        \x3 ->
          fmap
            BG.fromFFIType
            ( hs_bindgen_253852faf6da7a5b_base
                (BG.toFFIType x0)
                (BG.toFFIType x1)
                (BG.toFFIType x2)
                (BG.toFFIType x3)
            )

-- | Define a four character code as a Uint32.
--
--     The SDL_FOURCC macro as a function.
--
--     [Returns]: the four characters converted into a Uint32, one character per-byte.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_FOURCC@, defined at @sdl3-bindgen-sys\/SDL_stdinc_shims.h 40:26@
lithon_SDL_FOURCC
  :: SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@a@]: the first ASCII character.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@b@]: the second ASCII character.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@c@]: the third ASCII character.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@d@]: the fourth ASCII character.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint32
lithon_SDL_FOURCC = hs_bindgen_253852faf6da7a5b
