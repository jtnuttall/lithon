{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.AudioShims.FunPtr (
  SDL3.Sys.Bindgen.AudioShims.FunPtr.lithon_SDL_AUDIO_FRAMESIZE,
  SDL3.Sys.Bindgen.AudioShims.FunPtr.lithon_SDL_DEFINE_AUDIO_FORMAT,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Audio qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_audio_shims.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_get_lithon_SDL_AUDIO_FRAMESIZE */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_3cb9c5cf09b44f74 (void)) ("
         , "  SDL_AudioSpec const *arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_AUDIO_FRAMESIZE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_get_lithon_SDL_DEFINE_AUDIO_FORMAT */"
         , "__attribute__ ((const))"
         , "SDL_AudioFormat (*hs_bindgen_009c1c5649507734 (void)) ("
         , "  _Bool arg1,"
         , "  _Bool arg2,"
         , "  _Bool arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return &lithon_SDL_DEFINE_AUDIO_FORMAT;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_get_lithon_SDL_AUDIO_FRAMESIZE@
foreign import ccall unsafe "hs_bindgen_3cb9c5cf09b44f74"
  hs_bindgen_3cb9c5cf09b44f74_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_get_lithon_SDL_AUDIO_FRAMESIZE@
hs_bindgen_3cb9c5cf09b44f74
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL3.Sys.Bindgen.Audio.SDL_AudioSpec -> IO BG.CInt))
hs_bindgen_3cb9c5cf09b44f74 =
  fmap BG.fromFFIType hs_bindgen_3cb9c5cf09b44f74_base

{-# NOINLINE lithon_SDL_AUDIO_FRAMESIZE #-}

-- | Calculate the size of each audio frame (in bytes) from an SDL_AudioSpec.
--
--     The SDL_AUDIO_FRAMESIZE macro as a function. This reports on the size of an audio sample frame: stereo Sint16 data (2 channels of 2 bytes each) would be 4 bytes per frame, for example.
--
--     [@spec@]: the SDL_AudioSpec to query.
--
--     [Returns]: the number of bytes used per sample frame.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_AUDIO_FRAMESIZE@, defined at @sdl3-bindgen-sys\/SDL_audio_shims.h 38:23@
lithon_SDL_AUDIO_FRAMESIZE
  :: BG.FunPtr (PtrConst.PtrConst SDL3.Sys.Bindgen.Audio.SDL_AudioSpec -> IO BG.CInt)
lithon_SDL_AUDIO_FRAMESIZE =
  BG.unsafePerformIO hs_bindgen_3cb9c5cf09b44f74

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_get_lithon_SDL_DEFINE_AUDIO_FORMAT@
foreign import ccall unsafe "hs_bindgen_009c1c5649507734"
  hs_bindgen_009c1c5649507734_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_get_lithon_SDL_DEFINE_AUDIO_FORMAT@
hs_bindgen_009c1c5649507734
  :: IO
       ( BG.FunPtr
           ( BG.CBool
             -> BG.CBool
             -> BG.CBool
             -> SDL3.Sys.Bindgen.Stdinc.Uint8
             -> IO SDL3.Sys.Bindgen.Audio.SDL_AudioFormat
           )
       )
hs_bindgen_009c1c5649507734 =
  fmap BG.fromFFIType hs_bindgen_009c1c5649507734_base

{-# NOINLINE lithon_SDL_DEFINE_AUDIO_FORMAT #-}

-- | Define an SDL_AudioFormat value.
--
--     The SDL_DEFINE_AUDIO_FORMAT macro as a function. SDL does not support custom audio formats, so this is not of much use externally, but it can be illustrative as to what the various bits of an SDL_AudioFormat mean. For example, SDL_AUDIO_S32LE is signed, littleendian, integer, 32 bits.
--
--     [@is_signed@]: true for signed data, false for unsigned data.
--
--     [@is_bigendian@]: true for bigendian data, false for littleendian data.
--
--     [@is_float@]: true for floating point data, false for integer data.
--
--     [@bits@]: number of bits per sample.
--
--     [Returns]: a format value in the style of SDL_AudioFormat.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_DEFINE_AUDIO_FORMAT@, defined at @sdl3-bindgen-sys\/SDL_audio_shims.h 61:35@
lithon_SDL_DEFINE_AUDIO_FORMAT
  :: BG.FunPtr
       ( BG.CBool
         -> BG.CBool
         -> BG.CBool
         -> SDL3.Sys.Bindgen.Stdinc.Uint8
         -> IO SDL3.Sys.Bindgen.Audio.SDL_AudioFormat
       )
lithon_SDL_DEFINE_AUDIO_FORMAT =
  BG.unsafePerformIO hs_bindgen_009c1c5649507734
