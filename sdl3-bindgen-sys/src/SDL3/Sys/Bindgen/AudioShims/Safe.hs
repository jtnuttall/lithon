{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.AudioShims.Safe (
  SDL3.Sys.Bindgen.AudioShims.Safe.lithon_SDL_AUDIO_FRAMESIZE,
  SDL3.Sys.Bindgen.AudioShims.Safe.lithon_SDL_DEFINE_AUDIO_FORMAT,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified
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
         , "signed int hs_bindgen_671665de9082bc0a ("
         , "  SDL_AudioSpec const *arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_AUDIO_FRAMESIZE)(arg1);"
         , "}"
         , "SDL_AudioFormat hs_bindgen_4e88b69fe8480ba5 ("
         , "  _Bool arg1,"
         , "  _Bool arg2,"
         , "  _Bool arg3,"
         , "  Uint8 arg4"
         , ")"
         , "{"
         , "  return (lithon_SDL_DEFINE_AUDIO_FORMAT)(arg1, arg2, arg3, arg4);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_Safe_lithon_SDL_AUDIO_FRAMESIZE@
foreign import ccall safe "hs_bindgen_671665de9082bc0a"
  hs_bindgen_671665de9082bc0a_base
    :: BG.Ptr BG.Void
    -> IO BG.CInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_Safe_lithon_SDL_AUDIO_FRAMESIZE@
hs_bindgen_671665de9082bc0a
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Audio.SDL_AudioSpec
  -> IO BG.CInt
hs_bindgen_671665de9082bc0a =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_671665de9082bc0a_base (BG.toFFIType x0))

-- | Calculate the size of each audio frame (in bytes) from an SDL_AudioSpec.
--
--     The SDL_AUDIO_FRAMESIZE macro as a function. This reports on the size of an audio sample frame: stereo Sint16 data (2 channels of 2 bytes each) would be 4 bytes per frame, for example.
--
--     [Returns]: the number of bytes used per sample frame.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_AUDIO_FRAMESIZE@, defined at @sdl3-bindgen-sys\/SDL_audio_shims.h 38:23@
lithon_SDL_AUDIO_FRAMESIZE
  :: PtrConst.PtrConst SDL3.Sys.Bindgen.Audio.SDL_AudioSpec
  -- ^
  --
  --           [@spec@]: the SDL_AudioSpec to query.
  -> IO BG.CInt
lithon_SDL_AUDIO_FRAMESIZE =
  hs_bindgen_671665de9082bc0a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_Safe_lithon_SDL_DEFINE_AUDIO_FORMAT@
foreign import ccall safe "hs_bindgen_4e88b69fe8480ba5"
  hs_bindgen_4e88b69fe8480ba5_base
    :: BG.CBool
    -> BG.CBool
    -> BG.CBool
    -> HsBindgen.Runtime.LibC.Word8
    -> IO HsBindgen.Runtime.Support.CUInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AudioShims_Safe_lithon_SDL_DEFINE_AUDIO_FORMAT@
hs_bindgen_4e88b69fe8480ba5
  :: BG.CBool
  -> BG.CBool
  -> BG.CBool
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO SDL3.Sys.Bindgen.Audio.SDL_AudioFormat
hs_bindgen_4e88b69fe8480ba5 =
  \x0 ->
    \x1 ->
      \x2 ->
        \x3 ->
          fmap
            BG.fromFFIType
            ( hs_bindgen_4e88b69fe8480ba5_base
                (BG.toFFIType x0)
                (BG.toFFIType x1)
                (BG.toFFIType x2)
                (BG.toFFIType x3)
            )

-- | Define an SDL_AudioFormat value.
--
--     The SDL_DEFINE_AUDIO_FORMAT macro as a function. SDL does not support custom audio formats, so this is not of much use externally, but it can be illustrative as to what the various bits of an SDL_AudioFormat mean. For example, SDL_AUDIO_S32LE is signed, littleendian, integer, 32 bits.
--
--     [Returns]: a format value in the style of SDL_AudioFormat.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @lithon_SDL_DEFINE_AUDIO_FORMAT@, defined at @sdl3-bindgen-sys\/SDL_audio_shims.h 61:35@
lithon_SDL_DEFINE_AUDIO_FORMAT
  :: BG.CBool
  -- ^
  --
  --           [@is_signed@]: true for signed data, false for unsigned data.
  -> BG.CBool
  -- ^
  --
  --           [@is_bigendian@]: true for bigendian data, false for littleendian data.
  -> BG.CBool
  -- ^
  --
  --           [@is_float@]: true for floating point data, false for integer data.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@bits@]: number of bits per sample.
  -> IO SDL3.Sys.Bindgen.Audio.SDL_AudioFormat
lithon_SDL_DEFINE_AUDIO_FORMAT =
  hs_bindgen_4e88b69fe8480ba5
