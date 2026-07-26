{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Audio.Safe (
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetNumAudioDrivers,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioDriver,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetCurrentAudioDriver,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioPlaybackDevices,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioRecordingDevices,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioDeviceName,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioDeviceFormat,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioDeviceChannelMap,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_OpenAudioDevice,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_IsAudioDevicePhysical,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_IsAudioDevicePlayback,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_PauseAudioDevice,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_ResumeAudioDevice,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_AudioDevicePaused,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioDeviceGain,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_SetAudioDeviceGain,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_CloseAudioDevice,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_BindAudioStreams,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_BindAudioStream,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_UnbindAudioStreams,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_UnbindAudioStream,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamDevice,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_CreateAudioStream,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamProperties,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamFormat,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_SetAudioStreamFormat,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamFrequencyRatio,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_SetAudioStreamFrequencyRatio,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamGain,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_SetAudioStreamGain,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamInputChannelMap,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamOutputChannelMap,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_SetAudioStreamInputChannelMap,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_SetAudioStreamOutputChannelMap,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_PutAudioStreamData,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_PutAudioStreamDataNoCopy,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_PutAudioStreamPlanarData,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamData,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamAvailable,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioStreamQueued,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_FlushAudioStream,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_ClearAudioStream,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_PauseAudioStreamDevice,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_ResumeAudioStreamDevice,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_AudioStreamDevicePaused,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_LockAudioStream,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_UnlockAudioStream,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_SetAudioStreamGetCallback,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_SetAudioStreamPutCallback,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_DestroyAudioStream,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_OpenAudioDeviceStream,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_SetAudioPostmixCallback,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_LoadWAV_IO,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_LoadWAV,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_MixAudio,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_ConvertAudioSamples,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetAudioFormatName,
  SDL3.Sys.Bindgen.Audio.Safe.sDL_GetSilenceValueForFormat,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Audio
import SDL3.Sys.Bindgen.Iostream qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_audio.h>"
         , "signed int hs_bindgen_aec6557cf376f51a (void)"
         , "{"
         , "  return (SDL_GetNumAudioDrivers)();"
         , "}"
         , "char const *hs_bindgen_a7a9924f3ded1aac ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioDriver)(arg1);"
         , "}"
         , "char const *hs_bindgen_eb8c87e3006e6e3e (void)"
         , "{"
         , "  return (SDL_GetCurrentAudioDriver)();"
         , "}"
         , "SDL_AudioDeviceID *hs_bindgen_116eecdd1dba02ce ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioPlaybackDevices)(arg1);"
         , "}"
         , "SDL_AudioDeviceID *hs_bindgen_f9bbcb7cbaba1df7 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioRecordingDevices)(arg1);"
         , "}"
         , "char const *hs_bindgen_499713655ad12ded ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioDeviceName)(arg1);"
         , "}"
         , "_Bool hs_bindgen_1607be856719fe9f ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioSpec *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetAudioDeviceFormat)(arg1, arg2, arg3);"
         , "}"
         , "signed int *hs_bindgen_87920ef47db02c9e ("
         , "  SDL_AudioDeviceID arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetAudioDeviceChannelMap)(arg1, arg2);"
         , "}"
         , "SDL_AudioDeviceID hs_bindgen_7c422eec383d378d ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioSpec const *arg2"
         , ")"
         , "{"
         , "  return (SDL_OpenAudioDevice)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_9124a0c657594930 ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return (SDL_IsAudioDevicePhysical)(arg1);"
         , "}"
         , "_Bool hs_bindgen_e66327fd3002e936 ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return (SDL_IsAudioDevicePlayback)(arg1);"
         , "}"
         , "_Bool hs_bindgen_6dcc3c4ea1398f2b ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return (SDL_PauseAudioDevice)(arg1);"
         , "}"
         , "_Bool hs_bindgen_4fce882c920cc91a ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return (SDL_ResumeAudioDevice)(arg1);"
         , "}"
         , "_Bool hs_bindgen_8ece1cc27cedcd76 ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return (SDL_AudioDevicePaused)(arg1);"
         , "}"
         , "float hs_bindgen_49cef71585b71d2d ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioDeviceGain)(arg1);"
         , "}"
         , "_Bool hs_bindgen_b40aa45597fa463a ("
         , "  SDL_AudioDeviceID arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_SetAudioDeviceGain)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_e8af3f72de564cf1 ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  (SDL_CloseAudioDevice)(arg1);"
         , "}"
         , "_Bool hs_bindgen_0af2b20aae7d1772 ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioStream *const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_BindAudioStreams)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_63b077caa3c6f246 ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioStream *arg2"
         , ")"
         , "{"
         , "  return (SDL_BindAudioStream)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_c2645d811582f0a9 ("
         , "  SDL_AudioStream *const *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  (SDL_UnbindAudioStreams)(arg1, arg2);"
         , "}"
         , "void hs_bindgen_d4d919dbf9ca4924 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  (SDL_UnbindAudioStream)(arg1);"
         , "}"
         , "SDL_AudioDeviceID hs_bindgen_8dd61683a1d75595 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamDevice)(arg1);"
         , "}"
         , "SDL_AudioStream *hs_bindgen_aca7047ab74c15f6 ("
         , "  SDL_AudioSpec const *arg1,"
         , "  SDL_AudioSpec const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateAudioStream)(arg1, arg2);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_cd9dda2135997250 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamProperties)(arg1);"
         , "}"
         , "_Bool hs_bindgen_5011d0cad394b582 ("
         , "  SDL_AudioStream *arg1,"
         , "  SDL_AudioSpec *arg2,"
         , "  SDL_AudioSpec *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamFormat)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_b7e0d40673e5b425 ("
         , "  SDL_AudioStream *arg1,"
         , "  SDL_AudioSpec const *arg2,"
         , "  SDL_AudioSpec const *arg3"
         , ")"
         , "{"
         , "  return (SDL_SetAudioStreamFormat)(arg1, arg2, arg3);"
         , "}"
         , "float hs_bindgen_3c13c77fea7457b6 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamFrequencyRatio)(arg1);"
         , "}"
         , "_Bool hs_bindgen_7be7b2b980ff1f01 ("
         , "  SDL_AudioStream *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_SetAudioStreamFrequencyRatio)(arg1, arg2);"
         , "}"
         , "float hs_bindgen_125acd9c795cad57 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamGain)(arg1);"
         , "}"
         , "_Bool hs_bindgen_5684b3f0e33987ea ("
         , "  SDL_AudioStream *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return (SDL_SetAudioStreamGain)(arg1, arg2);"
         , "}"
         , "signed int *hs_bindgen_92fa355f815c3314 ("
         , "  SDL_AudioStream *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamInputChannelMap)(arg1, arg2);"
         , "}"
         , "signed int *hs_bindgen_9b5ffd54b64ea0ea ("
         , "  SDL_AudioStream *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamOutputChannelMap)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_d47a0e77e800172e ("
         , "  SDL_AudioStream *arg1,"
         , "  signed int const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetAudioStreamInputChannelMap)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_b53ca7ca85639b18 ("
         , "  SDL_AudioStream *arg1,"
         , "  signed int const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_SetAudioStreamOutputChannelMap)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_aaa4efec7abd5cd4 ("
         , "  SDL_AudioStream *arg1,"
         , "  void const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_PutAudioStreamData)(arg1, arg2, arg3);"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef void *SDL_AudioStreamDataCompleteCallback;"
         , "#endif"
         , "_Bool hs_bindgen_619ed51504fee204 ("
         , "  SDL_AudioStream *arg1,"
         , "  void const *arg2,"
         , "  signed int arg3,"
         , "  SDL_AudioStreamDataCompleteCallback arg4,"
         , "  void *arg5"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_PutAudioStreamDataNoCopy)(arg1, arg2, arg3, arg4, arg5);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; (void)arg4; (void)arg5; SDL_SetError(\"SDL_PutAudioStreamDataNoCopy requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "_Bool hs_bindgen_a35f9b9040c608a3 ("
         , "  SDL_AudioStream *arg1,"
         , "  void const *const *arg2,"
         , "  signed int arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return (SDL_PutAudioStreamPlanarData)(arg1, arg2, arg3, arg4);"
         , "#else"
         , "  (void)arg1; (void)arg2; (void)arg3; (void)arg4; SDL_SetError(\"SDL_PutAudioStreamPlanarData requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "signed int hs_bindgen_80c78d4a6767c5c1 ("
         , "  SDL_AudioStream *arg1,"
         , "  void *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamData)(arg1, arg2, arg3);"
         , "}"
         , "signed int hs_bindgen_2ddc379eb0f7050b ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamAvailable)(arg1);"
         , "}"
         , "signed int hs_bindgen_3c01027250fa0224 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioStreamQueued)(arg1);"
         , "}"
         , "_Bool hs_bindgen_a08de3ff3d4b6b48 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_FlushAudioStream)(arg1);"
         , "}"
         , "_Bool hs_bindgen_495b0c63dde7c64f ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_ClearAudioStream)(arg1);"
         , "}"
         , "_Bool hs_bindgen_b5ae37aa80b742a5 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_PauseAudioStreamDevice)(arg1);"
         , "}"
         , "_Bool hs_bindgen_df0b3314efa54fdd ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_ResumeAudioStreamDevice)(arg1);"
         , "}"
         , "_Bool hs_bindgen_1ff005643c24e6c0 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_AudioStreamDevicePaused)(arg1);"
         , "}"
         , "_Bool hs_bindgen_3d4874ba18717a32 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_LockAudioStream)(arg1);"
         , "}"
         , "_Bool hs_bindgen_0175d2c579f38af7 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_UnlockAudioStream)(arg1);"
         , "}"
         , "_Bool hs_bindgen_65648a5a73743f2d ("
         , "  SDL_AudioStream *arg1,"
         , "  SDL_AudioStreamCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_SetAudioStreamGetCallback)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_61ea9930449caa3b ("
         , "  SDL_AudioStream *arg1,"
         , "  SDL_AudioStreamCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_SetAudioStreamPutCallback)(arg1, arg2, arg3);"
         , "}"
         , "void hs_bindgen_2f2920f372de3f91 ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  (SDL_DestroyAudioStream)(arg1);"
         , "}"
         , "SDL_AudioStream *hs_bindgen_41a1f387b2d98901 ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioSpec const *arg2,"
         , "  SDL_AudioStreamCallback arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return (SDL_OpenAudioDeviceStream)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_4e2802e9ed6e7f25 ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioPostmixCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return (SDL_SetAudioPostmixCallback)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_a910288634dd93c9 ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2,"
         , "  SDL_AudioSpec *arg3,"
         , "  Uint8 **arg4,"
         , "  Uint32 *arg5"
         , ")"
         , "{"
         , "  return (SDL_LoadWAV_IO)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_9dc1494e309920f0 ("
         , "  char const *arg1,"
         , "  SDL_AudioSpec *arg2,"
         , "  Uint8 **arg3,"
         , "  Uint32 *arg4"
         , ")"
         , "{"
         , "  return (SDL_LoadWAV)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_f90c9509d9c249ee ("
         , "  Uint8 *arg1,"
         , "  Uint8 const *arg2,"
         , "  SDL_AudioFormat arg3,"
         , "  Uint32 arg4,"
         , "  float arg5"
         , ")"
         , "{"
         , "  return (SDL_MixAudio)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         , "_Bool hs_bindgen_ee64493d4496844f ("
         , "  SDL_AudioSpec const *arg1,"
         , "  Uint8 const *arg2,"
         , "  signed int arg3,"
         , "  SDL_AudioSpec const *arg4,"
         , "  Uint8 **arg5,"
         , "  signed int *arg6"
         , ")"
         , "{"
         , "  return (SDL_ConvertAudioSamples)(arg1, arg2, arg3, arg4, arg5, arg6);"
         , "}"
         , "char const *hs_bindgen_427a7131d02ce29b ("
         , "  SDL_AudioFormat arg1"
         , ")"
         , "{"
         , "  return (SDL_GetAudioFormatName)(arg1);"
         , "}"
         , "signed int hs_bindgen_a78d31ca2af16da3 ("
         , "  SDL_AudioFormat arg1"
         , ")"
         , "{"
         , "  return (SDL_GetSilenceValueForFormat)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetNumAudioDrivers@
foreign import ccall safe "hs_bindgen_aec6557cf376f51a"
  hs_bindgen_aec6557cf376f51a_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetNumAudioDrivers@
hs_bindgen_aec6557cf376f51a :: IO BG.CInt
hs_bindgen_aec6557cf376f51a =
  BG.fromFFIType hs_bindgen_aec6557cf376f51a_base

-- | Use this function to get the number of built-in audio drivers.
--
--     This function returns a hardcoded number. This never returns a negative value; if there are no drivers compiled into this build of SDL, this function returns zero. The presence of a driver in this list does not mean it will function, it just means SDL is capable of interacting with that interface. For example, a build of SDL might have esound support, but if there\'s no esound server available, SDL\'s esound driver would fail if used.
--
--     By default, SDL tries all drivers, in its preferred order, until one is found to be usable.
--
--     [Returns]: the number of built-in audio drivers.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAudioDriver'
--
--     [C declaration]: @SDL_GetNumAudioDrivers@, defined at @SDL3\/SDL_audio.h 477:33@
sDL_GetNumAudioDrivers :: IO BG.CInt
sDL_GetNumAudioDrivers = hs_bindgen_aec6557cf376f51a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDriver@
foreign import ccall safe "hs_bindgen_a7a9924f3ded1aac"
  hs_bindgen_a7a9924f3ded1aac_base
    :: BG.Int32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDriver@
hs_bindgen_a7a9924f3ded1aac
  :: BG.CInt
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_a7a9924f3ded1aac =
  BG.fromFFIType hs_bindgen_a7a9924f3ded1aac_base

-- | Use this function to get the name of a built in audio driver.
--
--     The list of audio drivers is given in the order that they are normally initialized by default; the drivers that seem more reasonable to choose first (as far as the SDL developers believe) are earlier in the list.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"alsa\", \"coreaudio\" or \"wasapi\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the audio driver at the requested index, or NULL if an invalid index was specified.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetNumAudioDrivers'
--
--     [C declaration]: @SDL_GetAudioDriver@, defined at @SDL3\/SDL_audio.h 501:42@
sDL_GetAudioDriver
  :: BG.CInt
  -- ^
  --
  --           [@index@]: the index of the audio driver; the value ranges from 0 to @SDL_GetNumAudioDrivers()@ - 1.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetAudioDriver = hs_bindgen_a7a9924f3ded1aac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetCurrentAudioDriver@
foreign import ccall safe "hs_bindgen_eb8c87e3006e6e3e"
  hs_bindgen_eb8c87e3006e6e3e_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetCurrentAudioDriver@
hs_bindgen_eb8c87e3006e6e3e :: IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_eb8c87e3006e6e3e =
  BG.fromFFIType hs_bindgen_eb8c87e3006e6e3e_base

-- | Get the name of the current audio driver.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"alsa\", \"coreaudio\" or \"wasapi\". These never have Unicode characters, and are not meant to be proper names.
--
--     [Returns]: the name of the current audio driver or NULL if no driver has been initialized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetCurrentAudioDriver@, defined at @SDL3\/SDL_audio.h 517:42@
sDL_GetCurrentAudioDriver :: IO (PtrConst.PtrConst BG.CChar)
sDL_GetCurrentAudioDriver =
  hs_bindgen_eb8c87e3006e6e3e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioPlaybackDevices@
foreign import ccall safe "hs_bindgen_116eecdd1dba02ce"
  hs_bindgen_116eecdd1dba02ce_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioPlaybackDevices@
hs_bindgen_116eecdd1dba02ce
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_AudioDeviceID)
hs_bindgen_116eecdd1dba02ce =
  BG.fromFFIType hs_bindgen_116eecdd1dba02ce_base

-- | Get a list of currently-connected audio playback devices.
--
--     This returns of list of available devices that play sound, perhaps to speakers or headphones (\"playback\" devices). If you want devices that record audio, like a microphone (\"recording\" devices), use @SDL_GetAudioRecordingDevices()@ instead.
--
--     This only returns a list of physical devices; it will not have any device IDs returned by @SDL_OpenAudioDevice()@.
--
--     If this function returns NULL, to signify an error, @*count@ will be set to zero.
--
--     [Returns]: a 0 terminated array of device instance IDs or NULL on error; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenAudioDevice', 'sDL_GetAudioRecordingDevices'
--
--     [C declaration]: @SDL_GetAudioPlaybackDevices@, defined at @SDL3\/SDL_audio.h 546:49@
sDL_GetAudioPlaybackDevices
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of devices returned, may be NULL.
  -> IO (BG.Ptr SDL_AudioDeviceID)
sDL_GetAudioPlaybackDevices =
  hs_bindgen_116eecdd1dba02ce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioRecordingDevices@
foreign import ccall safe "hs_bindgen_f9bbcb7cbaba1df7"
  hs_bindgen_f9bbcb7cbaba1df7_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioRecordingDevices@
hs_bindgen_f9bbcb7cbaba1df7
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr SDL_AudioDeviceID)
hs_bindgen_f9bbcb7cbaba1df7 =
  BG.fromFFIType hs_bindgen_f9bbcb7cbaba1df7_base

-- | Get a list of currently-connected audio recording devices.
--
--     This returns of list of available devices that record audio, like a microphone (\"recording\" devices). If you want devices that play sound, perhaps to speakers or headphones (\"playback\" devices), use @SDL_GetAudioPlaybackDevices()@ instead.
--
--     This only returns a list of physical devices; it will not have any device IDs returned by @SDL_OpenAudioDevice()@.
--
--     If this function returns NULL, to signify an error, @*count@ will be set to zero.
--
--     [Returns]: a 0 terminated array of device instance IDs, or NULL on failure; call SDL_GetError() for more information. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenAudioDevice', 'sDL_GetAudioPlaybackDevices'
--
--     [C declaration]: @SDL_GetAudioRecordingDevices@, defined at @SDL3\/SDL_audio.h 575:49@
sDL_GetAudioRecordingDevices
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of devices returned, may be NULL.
  -> IO (BG.Ptr SDL_AudioDeviceID)
sDL_GetAudioRecordingDevices =
  hs_bindgen_f9bbcb7cbaba1df7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDeviceName@
foreign import ccall safe "hs_bindgen_499713655ad12ded"
  hs_bindgen_499713655ad12ded_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDeviceName@
hs_bindgen_499713655ad12ded
  :: SDL_AudioDeviceID
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_499713655ad12ded =
  BG.fromFFIType hs_bindgen_499713655ad12ded_base

-- | Get the human-readable name of a specific audio device.
--
--     __WARNING__: this function will work with SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK and SDL_AUDIO_DEVICE_DEFAULT_RECORDING, returning the current default physical devices\' names. However, as the default device may change at any time, it is likely better to show a generic name to the user, like \"System default audio device\" or perhaps \"default [currently %s]\". Do not store this name to disk to reidentify the device in a later run of the program, as the default might change in general, and the string will be the name of a specific device and not the abstract system default.
--
--     [Returns]: the name of the audio device, or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAudioPlaybackDevices', 'sDL_GetAudioRecordingDevices'
--
--     [C declaration]: @SDL_GetAudioDeviceName@, defined at @SDL3\/SDL_audio.h 600:42@
sDL_GetAudioDeviceName
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the instance ID of the device to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetAudioDeviceName = hs_bindgen_499713655ad12ded

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDeviceFormat@
foreign import ccall safe "hs_bindgen_1607be856719fe9f"
  hs_bindgen_1607be856719fe9f_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDeviceFormat@
hs_bindgen_1607be856719fe9f
  :: SDL_AudioDeviceID
  -> BG.Ptr SDL_AudioSpec
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_1607be856719fe9f =
  BG.fromFFIType hs_bindgen_1607be856719fe9f_base

-- | Get the current audio format of a specific audio device.
--
--     For an opened device, this will report the format the device is currently using. If the device isn\'t yet opened, this will report the device\'s preferred format (or a reasonable default if this can\'t be determined).
--
--     You may also specify SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or SDL_AUDIO_DEVICE_DEFAULT_RECORDING here, which is useful for getting a reasonable recommendation before opening the system-recommended default device.
--
--     You can also use this to request the current device buffer size. This is specified in sample frames and represents the amount of data SDL will feed to the physical hardware in each chunk. This can be converted to milliseconds of audio with the following equation:
--
--     @ms = (int) ((((Sint64) frames) * 1000) \/ spec.freq);@
--
--     Buffer size is only important if you need low-level control over the audio playback timing. Most apps do not need this.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetAudioDeviceFormat@, defined at @SDL3\/SDL_audio.h 635:34@
sDL_GetAudioDeviceFormat
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the instance ID of the device to query.
  -> BG.Ptr SDL_AudioSpec
  -- ^
  --
  --           [@spec@]: on return, will be filled with device details.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@sample_frames@]: pointer to store device buffer size, in sample frames. Can be NULL.
  -> IO BG.CBool
sDL_GetAudioDeviceFormat =
  hs_bindgen_1607be856719fe9f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDeviceChannelMap@
foreign import ccall safe "hs_bindgen_87920ef47db02c9e"
  hs_bindgen_87920ef47db02c9e_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDeviceChannelMap@
hs_bindgen_87920ef47db02c9e
  :: SDL_AudioDeviceID
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr BG.CInt)
hs_bindgen_87920ef47db02c9e =
  BG.fromFFIType hs_bindgen_87920ef47db02c9e_base

-- | Get the current channel map of an audio device.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](CategoryAudio#channel-layouts).
--
--     Audio devices usually have no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [Returns]: an array of the current channel mapping, with as many elements as the current output spec\'s channels, or NULL if default. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamInputChannelMap'
--
--     [C declaration]: @SDL_GetAudioDeviceChannelMap@, defined at @SDL3\/SDL_audio.h 658:35@
sDL_GetAudioDeviceChannelMap
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the instance ID of the device to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: On output, set to number of channels in the map. Can be NULL.
  -> IO (BG.Ptr BG.CInt)
sDL_GetAudioDeviceChannelMap =
  hs_bindgen_87920ef47db02c9e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_OpenAudioDevice@
foreign import ccall safe "hs_bindgen_7c422eec383d378d"
  hs_bindgen_7c422eec383d378d_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_OpenAudioDevice@
hs_bindgen_7c422eec383d378d
  :: SDL_AudioDeviceID
  -> PtrConst.PtrConst SDL_AudioSpec
  -> IO SDL_AudioDeviceID
hs_bindgen_7c422eec383d378d =
  BG.fromFFIType hs_bindgen_7c422eec383d378d_base

-- | Open a specific audio device.
--
--     You can open both playback and recording devices through this function. Playback devices will take data from bound audio streams, mix it, and send it to the hardware. Recording devices will feed any bound audio streams with a copy of any incoming data.
--
--     An opened audio device starts out with no audio streams bound. To start audio playing, bind a stream and supply audio data to it. Unlike SDL2, there is no audio callback; you only bind audio streams and make sure they have data flowing into them (however, you can simulate SDL2\'s semantics fairly closely by using SDL_OpenAudioDeviceStream instead of this function).
--
--     If you don\'t care about opening a specific device, pass a @devid@ of either @SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK@ or @SDL_AUDIO_DEVICE_DEFAULT_RECORDING@. In this case, SDL will try to pick the most reasonable default, and may also switch between physical devices seamlessly later, if the most reasonable default changes during the lifetime of this opened device (user changed the default in the OS\'s system preferences, the default got unplugged so the system jumped to a new default, the user plugged in headphones on a mobile device, etc). Unless you have a good reason to choose a specific device, this is probably what you want.
--
--     You may request a specific format for the audio device, but there is no promise the device will honor that request for several reasons. As such, it\'s only meant to be a hint as to what data your app will provide. Audio streams will accept data in whatever format you specify and manage conversion for you as appropriate. SDL_GetAudioDeviceFormat can tell you the preferred format for the device before opening and the actual format the device is using after opening.
--
--     It\'s legal to open the same device ID more than once; each successful open will generate a new logical 'SDL_AudioDeviceID' that is managed separately from others on the same physical device. This allows libraries to open a device separately from the main app and bind its own streams without conflicting.
--
--     It is also legal to open a device ID returned by a previous call to this function; doing so just creates another logical device on the same physical device. This may be useful for making logical groupings of audio streams.
--
--     This function returns the opened device ID on success. This is a new, unique 'SDL_AudioDeviceID' that represents a logical device.
--
--     Some backends might offer arbitrary devices (for example, a networked audio protocol that can connect to an arbitrary server). For these, as a change from SDL2, you should open a default device ID and use an SDL hint to specify the target if you care, or otherwise let the backend figure out a reasonable default. Most backends don\'t offer anything like this, and often this would be an end user setting an environment variable for their custom need, and not something an application should specifically manage.
--
--     When done with an audio device, possibly at the end of the app\'s life, one should call @SDL_CloseAudioDevice()@ on the returned device id.
--
--     [Returns]: the device ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseAudioDevice', 'sDL_GetAudioDeviceFormat'
--
--     [C declaration]: @SDL_OpenAudioDevice@, defined at @SDL3\/SDL_audio.h 734:47@
sDL_OpenAudioDevice
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the device instance id to open, or SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or SDL_AUDIO_DEVICE_DEFAULT_RECORDING for the most reasonable default device.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@spec@]: the requested device configuration. Can be NULL to use reasonable defaults.
  -> IO SDL_AudioDeviceID
sDL_OpenAudioDevice = hs_bindgen_7c422eec383d378d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_IsAudioDevicePhysical@
foreign import ccall safe "hs_bindgen_9124a0c657594930"
  hs_bindgen_9124a0c657594930_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_IsAudioDevicePhysical@
hs_bindgen_9124a0c657594930
  :: SDL_AudioDeviceID
  -> IO BG.CBool
hs_bindgen_9124a0c657594930 =
  BG.fromFFIType hs_bindgen_9124a0c657594930_base

-- | Determine if an audio device is physical (instead of logical).
--
--     An 'SDL_AudioDeviceID' that represents physical hardware is a physical device; there is one for each piece of hardware that SDL can see. Logical devices are created by calling SDL_OpenAudioDevice or SDL_OpenAudioDeviceStream, and while each is associated with a physical device, there can be any number of logical devices on one physical device.
--
--     For the most part, logical and physical IDs are interchangeable if you try to open a logical device, SDL understands to assign that effort to the underlying physical device, etc. However, it might be useful to know if an arbitrary device ID is physical or logical. This function reports which.
--
--     This function may return either true or false for invalid device IDs.
--
--     [Returns]: true if devid is a physical device, false if it is logical.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_IsAudioDevicePhysical@, defined at @SDL3\/SDL_audio.h 759:34@
sDL_IsAudioDevicePhysical
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the device ID to query.
  -> IO BG.CBool
sDL_IsAudioDevicePhysical =
  hs_bindgen_9124a0c657594930

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_IsAudioDevicePlayback@
foreign import ccall safe "hs_bindgen_e66327fd3002e936"
  hs_bindgen_e66327fd3002e936_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_IsAudioDevicePlayback@
hs_bindgen_e66327fd3002e936
  :: SDL_AudioDeviceID
  -> IO BG.CBool
hs_bindgen_e66327fd3002e936 =
  BG.fromFFIType hs_bindgen_e66327fd3002e936_base

-- | Determine if an audio device is a playback device (instead of recording).
--
--     This function may return either true or false for invalid device IDs.
--
--     [Returns]: true if devid is a playback device, false if it is recording.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_IsAudioDevicePlayback@, defined at @SDL3\/SDL_audio.h 773:34@
sDL_IsAudioDevicePlayback
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the device ID to query.
  -> IO BG.CBool
sDL_IsAudioDevicePlayback =
  hs_bindgen_e66327fd3002e936

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PauseAudioDevice@
foreign import ccall safe "hs_bindgen_6dcc3c4ea1398f2b"
  hs_bindgen_6dcc3c4ea1398f2b_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PauseAudioDevice@
hs_bindgen_6dcc3c4ea1398f2b
  :: SDL_AudioDeviceID
  -> IO BG.CBool
hs_bindgen_6dcc3c4ea1398f2b =
  BG.fromFFIType hs_bindgen_6dcc3c4ea1398f2b_base

-- | Use this function to pause audio playback on a specified device.
--
--     This function pauses audio processing for a given device. Any bound audio streams will not progress, and no audio will be generated. Pausing one device does not prevent other unpaused devices from running.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow. Pausing a paused device is a legal no-op.
--
--     Pausing a device can be useful to halt all audio without unbinding all the audio streams. This might be useful while a game is paused, or a level is loading, etc.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @SDL_OpenAudioDevice()@ can be.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ResumeAudioDevice', 'sDL_AudioDevicePaused'
--
--     [C declaration]: @SDL_PauseAudioDevice@, defined at @SDL3\/SDL_audio.h 804:34@
sDL_PauseAudioDevice
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: a device opened by @SDL_OpenAudioDevice()@.
  -> IO BG.CBool
sDL_PauseAudioDevice = hs_bindgen_6dcc3c4ea1398f2b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_ResumeAudioDevice@
foreign import ccall safe "hs_bindgen_4fce882c920cc91a"
  hs_bindgen_4fce882c920cc91a_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_ResumeAudioDevice@
hs_bindgen_4fce882c920cc91a
  :: SDL_AudioDeviceID
  -> IO BG.CBool
hs_bindgen_4fce882c920cc91a =
  BG.fromFFIType hs_bindgen_4fce882c920cc91a_base

-- | Use this function to unpause audio playback on a specified device.
--
--     This function unpauses audio processing for a given device that has previously been paused with @SDL_PauseAudioDevice()@. Once unpaused, any bound audio streams will begin to progress again, and audio can be generated.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow. Unpausing an unpaused device is a legal no-op.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @SDL_OpenAudioDevice()@ can be.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AudioDevicePaused', 'sDL_PauseAudioDevice'
--
--     [C declaration]: @SDL_ResumeAudioDevice@, defined at @SDL3\/SDL_audio.h 832:34@
sDL_ResumeAudioDevice
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: a device opened by @SDL_OpenAudioDevice()@.
  -> IO BG.CBool
sDL_ResumeAudioDevice = hs_bindgen_4fce882c920cc91a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_AudioDevicePaused@
foreign import ccall safe "hs_bindgen_8ece1cc27cedcd76"
  hs_bindgen_8ece1cc27cedcd76_base
    :: BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_AudioDevicePaused@
hs_bindgen_8ece1cc27cedcd76
  :: SDL_AudioDeviceID
  -> IO BG.CBool
hs_bindgen_8ece1cc27cedcd76 =
  BG.fromFFIType hs_bindgen_8ece1cc27cedcd76_base

-- | Use this function to query if an audio device is paused.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @SDL_OpenAudioDevice()@ can be. Physical and invalid device IDs will report themselves as unpaused here.
--
--     [Returns]: true if device is valid and paused, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PauseAudioDevice', 'sDL_ResumeAudioDevice'
--
--     [C declaration]: @SDL_AudioDevicePaused@, defined at @SDL3\/SDL_audio.h 854:34@
sDL_AudioDevicePaused
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: a device opened by @SDL_OpenAudioDevice()@.
  -> IO BG.CBool
sDL_AudioDevicePaused = hs_bindgen_8ece1cc27cedcd76

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDeviceGain@
foreign import ccall safe "hs_bindgen_49cef71585b71d2d"
  hs_bindgen_49cef71585b71d2d_base
    :: BG.Word32
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioDeviceGain@
hs_bindgen_49cef71585b71d2d
  :: SDL_AudioDeviceID
  -> IO BG.CFloat
hs_bindgen_49cef71585b71d2d =
  BG.fromFFIType hs_bindgen_49cef71585b71d2d_base

-- | Get the gain of an audio device.
--
--     The gain of a device is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio devices default to a gain of 1.0f (no change in output).
--
--     Physical devices may not have their gain changed, only logical devices, and this function will always return -1.0f when used on physical devices.
--
--     [Returns]: the gain of the device or -1.0f on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioDeviceGain'
--
--     [C declaration]: @SDL_GetAudioDeviceGain@, defined at @SDL3\/SDL_audio.h 877:35@
sDL_GetAudioDeviceGain
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the audio device to query.
  -> IO BG.CFloat
sDL_GetAudioDeviceGain = hs_bindgen_49cef71585b71d2d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioDeviceGain@
foreign import ccall safe "hs_bindgen_b40aa45597fa463a"
  hs_bindgen_b40aa45597fa463a_base
    :: BG.Word32
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioDeviceGain@
hs_bindgen_b40aa45597fa463a
  :: SDL_AudioDeviceID
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_b40aa45597fa463a =
  BG.fromFFIType hs_bindgen_b40aa45597fa463a_base

-- | Change the gain of an audio device.
--
--     The gain of a device is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio devices default to a gain of 1.0f (no change in output).
--
--     Physical devices may not have their gain changed, only logical devices, and this function will always return false when used on physical devices. While it might seem attractive to adjust several logical devices at once in this way, it would allow an app or library to interfere with another portion of the program\'s otherwise-isolated devices.
--
--     This is applied, along with any per-audiostream gain, during playback to the hardware, and can be continuously changed to create various effects. On recording devices, this will adjust the gain before passing the data into an audiostream; that recording audiostream can then adjust its gain further when outputting the data elsewhere, if it likes, but that second gain is not applied until the data leaves the audiostream again.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAudioDeviceGain'
--
--     [C declaration]: @SDL_SetAudioDeviceGain@, defined at @SDL3\/SDL_audio.h 912:34@
sDL_SetAudioDeviceGain
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the audio device on which to change gain.
  -> BG.CFloat
  -- ^
  --
  --           [@gain@]: the gain. 1.0f is no change, 0.0f is silence.
  -> IO BG.CBool
sDL_SetAudioDeviceGain = hs_bindgen_b40aa45597fa463a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_CloseAudioDevice@
foreign import ccall safe "hs_bindgen_e8af3f72de564cf1"
  hs_bindgen_e8af3f72de564cf1_base
    :: BG.Word32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_CloseAudioDevice@
hs_bindgen_e8af3f72de564cf1
  :: SDL_AudioDeviceID
  -> IO ()
hs_bindgen_e8af3f72de564cf1 =
  BG.fromFFIType hs_bindgen_e8af3f72de564cf1_base

-- | Close a previously-opened audio device.
--
--     The application should close open audio devices once they are no longer needed.
--
--     This function may block briefly while pending audio data is played by the hardware, so that applications don\'t drop the last buffer of data they supplied if terminating immediately afterwards.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenAudioDevice'
--
--     [C declaration]: @SDL_CloseAudioDevice@, defined at @SDL3\/SDL_audio.h 933:34@
sDL_CloseAudioDevice
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device id previously returned by @SDL_OpenAudioDevice()@.
  -> IO ()
sDL_CloseAudioDevice = hs_bindgen_e8af3f72de564cf1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_BindAudioStreams@
foreign import ccall safe "hs_bindgen_0af2b20aae7d1772"
  hs_bindgen_0af2b20aae7d1772_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_BindAudioStreams@
hs_bindgen_0af2b20aae7d1772
  :: SDL_AudioDeviceID
  -> PtrConst.PtrConst (BG.Ptr SDL_AudioStream)
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_0af2b20aae7d1772 =
  BG.fromFFIType hs_bindgen_0af2b20aae7d1772_base

-- | Bind a list of audio streams to an audio device.
--
--     Audio data will flow through any bound streams. For a playback device, data for all bound streams will be mixed together and fed to the device. For a recording device, a copy of recorded data will be provided to each bound stream.
--
--     Audio streams can only be bound to an open device. This operation is atomic all streams bound in the same call will start processing at the same time, so they can stay in sync. Also: either all streams will be bound or none of them will be.
--
--     It is an error to bind an already-bound stream; it must be explicitly unbound first.
--
--     Binding a stream to a device will set its output format for playback devices, and its input format for recording devices, so they match the device\'s settings. The caller is welcome to change the other end of the stream\'s format at any time with @SDL_SetAudioStreamFormat()@. If the other end of the stream\'s format has never been set (the audio stream was created with a NULL audio spec), this function will set it to match the device end\'s format.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindAudioStreams', 'sDL_UnbindAudioStream', 'sDL_GetAudioStreamDevice'
--
--     [C declaration]: @SDL_BindAudioStreams@, defined at @SDL3\/SDL_audio.h 973:34@
sDL_BindAudioStreams
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device to bind a stream to.
  -> PtrConst.PtrConst (BG.Ptr SDL_AudioStream)
  -- ^
  --
  --           [@streams@]: an array of audio streams to bind.
  -> BG.CInt
  -- ^
  --
  --           [@num_streams@]: number streams listed in the @streams@ array.
  -> IO BG.CBool
sDL_BindAudioStreams = hs_bindgen_0af2b20aae7d1772

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_BindAudioStream@
foreign import ccall safe "hs_bindgen_63b077caa3c6f246"
  hs_bindgen_63b077caa3c6f246_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_BindAudioStream@
hs_bindgen_63b077caa3c6f246
  :: SDL_AudioDeviceID
  -> BG.Ptr SDL_AudioStream
  -> IO BG.CBool
hs_bindgen_63b077caa3c6f246 =
  BG.fromFFIType hs_bindgen_63b077caa3c6f246_base

-- | Bind a single audio stream to an audio device.
--
--     This is a convenience function, equivalent to calling @'sDL_BindAudioStreams' (devid, &stream, 1)@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindAudioStreams', 'sDL_UnbindAudioStream', 'sDL_GetAudioStreamDevice'
--
--     [C declaration]: @SDL_BindAudioStream@, defined at @SDL3\/SDL_audio.h 994:34@
sDL_BindAudioStream
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device to bind a stream to.
  -> BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: an audio stream to bind to a device.
  -> IO BG.CBool
sDL_BindAudioStream = hs_bindgen_63b077caa3c6f246

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_UnbindAudioStreams@
foreign import ccall safe "hs_bindgen_c2645d811582f0a9"
  hs_bindgen_c2645d811582f0a9_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_UnbindAudioStreams@
hs_bindgen_c2645d811582f0a9
  :: PtrConst.PtrConst (BG.Ptr SDL_AudioStream)
  -> BG.CInt
  -> IO ()
hs_bindgen_c2645d811582f0a9 =
  BG.fromFFIType hs_bindgen_c2645d811582f0a9_base

-- | Unbind a list of audio streams from their audio devices.
--
--     The streams being unbound do not all have to be on the same device. All streams on the same device will be unbound atomically (data will stop flowing through all unbound streams on the same device at the same time).
--
--     Unbinding a stream that isn\'t bound to a device is a legal no-op.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindAudioStreams'
--
--     [C declaration]: @SDL_UnbindAudioStreams@, defined at @SDL3\/SDL_audio.h 1015:34@
sDL_UnbindAudioStreams
  :: PtrConst.PtrConst (BG.Ptr SDL_AudioStream)
  -- ^
  --
  --           [@streams@]: an array of audio streams to unbind. Can be NULL or contain NULL.
  -> BG.CInt
  -- ^
  --
  --           [@num_streams@]: number streams listed in the @streams@ array.
  -> IO ()
sDL_UnbindAudioStreams = hs_bindgen_c2645d811582f0a9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_UnbindAudioStream@
foreign import ccall safe "hs_bindgen_d4d919dbf9ca4924"
  hs_bindgen_d4d919dbf9ca4924_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_UnbindAudioStream@
hs_bindgen_d4d919dbf9ca4924
  :: BG.Ptr SDL_AudioStream
  -> IO ()
hs_bindgen_d4d919dbf9ca4924 =
  BG.fromFFIType hs_bindgen_d4d919dbf9ca4924_base

-- | Unbind a single audio stream from its audio device.
--
--     This is a convenience function, equivalent to calling @'sDL_UnbindAudioStreams' (&stream, 1)@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindAudioStream'
--
--     [C declaration]: @SDL_UnbindAudioStream@, defined at @SDL3\/SDL_audio.h 1031:34@
sDL_UnbindAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: an audio stream to unbind from a device. Can be NULL.
  -> IO ()
sDL_UnbindAudioStream = hs_bindgen_d4d919dbf9ca4924

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamDevice@
foreign import ccall safe "hs_bindgen_8dd61683a1d75595"
  hs_bindgen_8dd61683a1d75595_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamDevice@
hs_bindgen_8dd61683a1d75595
  :: BG.Ptr SDL_AudioStream
  -> IO SDL_AudioDeviceID
hs_bindgen_8dd61683a1d75595 =
  BG.fromFFIType hs_bindgen_8dd61683a1d75595_base

-- | Query an audio stream for its currently-bound device.
--
--     This reports the logical audio device that an audio stream is currently bound to.
--
--     If not bound, or invalid, this returns zero, which is not a valid device ID.
--
--     [Returns]: the bound audio device, or 0 if not bound or invalid.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindAudioStream', 'sDL_BindAudioStreams'
--
--     [C declaration]: @SDL_GetAudioStreamDevice@, defined at @SDL3\/SDL_audio.h 1052:47@
sDL_GetAudioStreamDevice
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to query.
  -> IO SDL_AudioDeviceID
sDL_GetAudioStreamDevice =
  hs_bindgen_8dd61683a1d75595

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_CreateAudioStream@
foreign import ccall safe "hs_bindgen_aca7047ab74c15f6"
  hs_bindgen_aca7047ab74c15f6_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_CreateAudioStream@
hs_bindgen_aca7047ab74c15f6
  :: PtrConst.PtrConst SDL_AudioSpec
  -> PtrConst.PtrConst SDL_AudioSpec
  -> IO (BG.Ptr SDL_AudioStream)
hs_bindgen_aca7047ab74c15f6 =
  BG.fromFFIType hs_bindgen_aca7047ab74c15f6_base

-- | Create a new audio stream.
--
--     [Returns]: a new audio stream on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PutAudioStreamData', 'sDL_GetAudioStreamData', 'sDL_GetAudioStreamAvailable', 'sDL_FlushAudioStream', 'sDL_ClearAudioStream', 'sDL_SetAudioStreamFormat', 'sDL_DestroyAudioStream'
--
--     [C declaration]: @SDL_CreateAudioStream@, defined at @SDL3\/SDL_audio.h 1074:47@
sDL_CreateAudioStream
  :: PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@src_spec@]: the format details of the input audio.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@dst_spec@]: the format details of the output audio.
  -> IO (BG.Ptr SDL_AudioStream)
sDL_CreateAudioStream = hs_bindgen_aca7047ab74c15f6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamProperties@
foreign import ccall safe "hs_bindgen_cd9dda2135997250"
  hs_bindgen_cd9dda2135997250_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamProperties@
hs_bindgen_cd9dda2135997250
  :: BG.Ptr SDL_AudioStream
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_cd9dda2135997250 =
  BG.fromFFIType hs_bindgen_cd9dda2135997250_base

-- | Get the properties associated with an audio stream.
--
--     The application can hang any data it wants here, but the following properties are understood by SDL:
--
--     * @'sDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN'@: if true (the default), the stream be automatically cleaned up when the audio subsystem quits. If set to false, the streams will persist beyond that. This property is ignored for streams created through @SDL_OpenAudioDeviceStream()@, and will always be cleaned up. Streams that are not cleaned up will still be unbound from devices when the audio subsystem quits. This property was added in SDL 3.4.0.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetAudioStreamProperties@, defined at @SDL3\/SDL_audio.h 1098:46@
sDL_GetAudioStreamProperties
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetAudioStreamProperties =
  hs_bindgen_cd9dda2135997250

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamFormat@
foreign import ccall safe "hs_bindgen_5011d0cad394b582"
  hs_bindgen_5011d0cad394b582_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamFormat@
hs_bindgen_5011d0cad394b582
  :: BG.Ptr SDL_AudioStream
  -> BG.Ptr SDL_AudioSpec
  -> BG.Ptr SDL_AudioSpec
  -> IO BG.CBool
hs_bindgen_5011d0cad394b582 =
  BG.fromFFIType hs_bindgen_5011d0cad394b582_base

-- | Query the current format of an audio stream.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamFormat'
--
--     [C declaration]: @SDL_GetAudioStreamFormat@, defined at @SDL3\/SDL_audio.h 1119:34@
sDL_GetAudioStreamFormat
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> BG.Ptr SDL_AudioSpec
  -- ^
  --
  --           [@src_spec@]: where to store the input audio format; ignored if NULL.
  -> BG.Ptr SDL_AudioSpec
  -- ^
  --
  --           [@dst_spec@]: where to store the output audio format; ignored if NULL.
  -> IO BG.CBool
sDL_GetAudioStreamFormat =
  hs_bindgen_5011d0cad394b582

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamFormat@
foreign import ccall safe "hs_bindgen_b7e0d40673e5b425"
  hs_bindgen_b7e0d40673e5b425_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamFormat@
hs_bindgen_b7e0d40673e5b425
  :: BG.Ptr SDL_AudioStream
  -> PtrConst.PtrConst SDL_AudioSpec
  -> PtrConst.PtrConst SDL_AudioSpec
  -> IO BG.CBool
hs_bindgen_b7e0d40673e5b425 =
  BG.fromFFIType hs_bindgen_b7e0d40673e5b425_base

-- | Change the input and output formats of an audio stream.
--
--     Future calls to and SDL_GetAudioStreamAvailable and SDL_GetAudioStreamData will reflect the new format, and future calls to SDL_PutAudioStreamData must provide data in the new input formats.
--
--     Data that was previously queued in the stream will still be operated on in the format that was current when it was added, which is to say you can put the end of a sound file in one format to a stream, change formats for the next sound file, and start putting that new data while the previous sound file is still queued, and everything will still play back correctly.
--
--     If a stream is bound to a device, then the format of the side of the stream bound to a device cannot be changed (src_spec for recording devices, dst_spec for playback devices). Attempts to make a change to this side will be ignored, but this will not report an error. The other side\'s format can be changed.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAudioStreamFormat', 'sDL_SetAudioStreamFrequencyRatio'
--
--     [C declaration]: @SDL_SetAudioStreamFormat@, defined at @SDL3\/SDL_audio.h 1156:34@
sDL_SetAudioStreamFormat
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the format is being changed.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@src_spec@]: the new format of the audio input; if NULL, it is not changed.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@dst_spec@]: the new format of the audio output; if NULL, it is not changed.
  -> IO BG.CBool
sDL_SetAudioStreamFormat =
  hs_bindgen_b7e0d40673e5b425

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamFrequencyRatio@
foreign import ccall safe "hs_bindgen_3c13c77fea7457b6"
  hs_bindgen_3c13c77fea7457b6_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamFrequencyRatio@
hs_bindgen_3c13c77fea7457b6
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CFloat
hs_bindgen_3c13c77fea7457b6 =
  BG.fromFFIType hs_bindgen_3c13c77fea7457b6_base

-- | Get the frequency ratio of an audio stream.
--
--     [Returns]: the frequency ratio of the stream or 0.0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamFrequencyRatio'
--
--     [C declaration]: @SDL_GetAudioStreamFrequencyRatio@, defined at @SDL3\/SDL_audio.h 1172:35@
sDL_GetAudioStreamFrequencyRatio
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> IO BG.CFloat
sDL_GetAudioStreamFrequencyRatio =
  hs_bindgen_3c13c77fea7457b6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamFrequencyRatio@
foreign import ccall safe "hs_bindgen_7be7b2b980ff1f01"
  hs_bindgen_7be7b2b980ff1f01_base
    :: BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamFrequencyRatio@
hs_bindgen_7be7b2b980ff1f01
  :: BG.Ptr SDL_AudioStream
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_7be7b2b980ff1f01 =
  BG.fromFFIType hs_bindgen_7be7b2b980ff1f01_base

-- | Change the frequency ratio of an audio stream.
--
--     The frequency ratio is used to adjust the rate at which input data is consumed. Changing this effectively modifies the speed and pitch of the audio. A value greater than 1.0f will play the audio faster, and at a higher pitch. A value less than 1.0f will play the audio slower, and at a lower pitch. 1.0f means play at normal speed.
--
--     This is applied during SDL_GetAudioStreamData, and can be continuously changed to create various effects.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAudioStreamFrequencyRatio', 'sDL_SetAudioStreamFormat'
--
--     [C declaration]: @SDL_SetAudioStreamFrequencyRatio@, defined at @SDL3\/SDL_audio.h 1200:34@
sDL_SetAudioStreamFrequencyRatio
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream on which the frequency ratio is being changed.
  -> BG.CFloat
  -- ^
  --
  --           [@ratio@]: the frequency ratio. 1.0 is normal speed. Must be between 0.01 and 100.
  -> IO BG.CBool
sDL_SetAudioStreamFrequencyRatio =
  hs_bindgen_7be7b2b980ff1f01

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamGain@
foreign import ccall safe "hs_bindgen_125acd9c795cad57"
  hs_bindgen_125acd9c795cad57_base
    :: BG.Ptr BG.Void
    -> IO Float

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamGain@
hs_bindgen_125acd9c795cad57
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CFloat
hs_bindgen_125acd9c795cad57 =
  BG.fromFFIType hs_bindgen_125acd9c795cad57_base

-- | Get the gain of an audio stream.
--
--     The gain of a stream is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio streams default to a gain of 1.0f (no change in output).
--
--     [Returns]: the gain of the stream or -1.0f on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamGain'
--
--     [C declaration]: @SDL_GetAudioStreamGain@, defined at @SDL3\/SDL_audio.h 1221:35@
sDL_GetAudioStreamGain
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> IO BG.CFloat
sDL_GetAudioStreamGain = hs_bindgen_125acd9c795cad57

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamGain@
foreign import ccall safe "hs_bindgen_5684b3f0e33987ea"
  hs_bindgen_5684b3f0e33987ea_base
    :: BG.Ptr BG.Void
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamGain@
hs_bindgen_5684b3f0e33987ea
  :: BG.Ptr SDL_AudioStream
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_5684b3f0e33987ea =
  BG.fromFFIType hs_bindgen_5684b3f0e33987ea_base

-- | Change the gain of an audio stream.
--
--     The gain of a stream is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio streams default to a gain of 1.0f (no change in output).
--
--     This is applied during SDL_GetAudioStreamData, and can be continuously changed to create various effects.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAudioStreamGain'
--
--     [C declaration]: @SDL_SetAudioStreamGain@, defined at @SDL3\/SDL_audio.h 1246:34@
sDL_SetAudioStreamGain
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream on which the gain is being changed.
  -> BG.CFloat
  -- ^
  --
  --           [@gain@]: the gain. 1.0f is no change, 0.0f is silence.
  -> IO BG.CBool
sDL_SetAudioStreamGain = hs_bindgen_5684b3f0e33987ea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamInputChannelMap@
foreign import ccall safe "hs_bindgen_92fa355f815c3314"
  hs_bindgen_92fa355f815c3314_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamInputChannelMap@
hs_bindgen_92fa355f815c3314
  :: BG.Ptr SDL_AudioStream
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr BG.CInt)
hs_bindgen_92fa355f815c3314 =
  BG.fromFFIType hs_bindgen_92fa355f815c3314_base

-- | Get the current input channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](CategoryAudio#channel-layouts).
--
--     Audio streams default to no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [Returns]: an array of the current channel mapping, with as many elements as the current output spec\'s channels, or NULL if default. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamInputChannelMap'
--
--     [C declaration]: @SDL_GetAudioStreamInputChannelMap@, defined at @SDL3\/SDL_audio.h 1270:35@
sDL_GetAudioStreamInputChannelMap
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: On output, set to number of channels in the map. Can be NULL.
  -> IO (BG.Ptr BG.CInt)
sDL_GetAudioStreamInputChannelMap =
  hs_bindgen_92fa355f815c3314

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamOutputChannelMap@
foreign import ccall safe "hs_bindgen_9b5ffd54b64ea0ea"
  hs_bindgen_9b5ffd54b64ea0ea_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamOutputChannelMap@
hs_bindgen_9b5ffd54b64ea0ea
  :: BG.Ptr SDL_AudioStream
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr BG.CInt)
hs_bindgen_9b5ffd54b64ea0ea =
  BG.fromFFIType hs_bindgen_9b5ffd54b64ea0ea_base

-- | Get the current output channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](CategoryAudio#channel-layouts).
--
--     Audio streams default to no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [Returns]: an array of the current channel mapping, with as many elements as the current output spec\'s channels, or NULL if default. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamInputChannelMap'
--
--     [C declaration]: @SDL_GetAudioStreamOutputChannelMap@, defined at @SDL3\/SDL_audio.h 1294:35@
sDL_GetAudioStreamOutputChannelMap
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: On output, set to number of channels in the map. Can be NULL.
  -> IO (BG.Ptr BG.CInt)
sDL_GetAudioStreamOutputChannelMap =
  hs_bindgen_9b5ffd54b64ea0ea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamInputChannelMap@
foreign import ccall safe "hs_bindgen_d47a0e77e800172e"
  hs_bindgen_d47a0e77e800172e_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamInputChannelMap@
hs_bindgen_d47a0e77e800172e
  :: BG.Ptr SDL_AudioStream
  -> PtrConst.PtrConst BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_d47a0e77e800172e =
  BG.fromFFIType hs_bindgen_d47a0e77e800172e_base

-- | Set the current input channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](CategoryAudio#channel-layouts).
--
--     The input channel map reorders data that is added to a stream via SDL_PutAudioStreamData. Future calls to SDL_PutAudioStreamData must provide data in the new channel order.
--
--     Each item in the array represents an input channel, and its value is the channel that it should be remapped to. To reverse a stereo signal\'s left and right values, you\'d have an array of @{ 1, 0 }@. It is legal to remap multiple channels to the same thing, so @{ 1, 1 }@ would duplicate the right channel to both channels of a stereo signal. An element in the channel map set to -1 instead of a valid channel will mute that channel, setting it to a silence value.
--
--     You cannot change the number of channels through a channel map, just reorder\/mute them.
--
--     Data that was previously queued in the stream will still be operated on in the order that was current when it was added, which is to say you can put the end of a sound file in one order to a stream, change orders for the next sound file, and start putting that new data while the previous sound file is still queued, and everything will still play back correctly.
--
--     Audio streams default to no remapping applied. Passing a NULL channel map is legal, and turns off remapping.
--
--     SDL will copy the channel map; the caller does not have to save this array after this call.
--
--     If @count@ is not equal to the current number of channels in the audio stream\'s format, this will fail. This is a safety measure to make sure a race condition hasn\'t changed the format while this call is setting the channel map.
--
--     Unlike attempting to change the stream\'s format, the input channel map on a stream bound to a recording device is permitted to change at any time; any data added to the stream from the device after this call will have the new mapping, but previously-added data will still have the prior mapping.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running. Don\'t change the stream\'s format to have a different number of channels from a different thread at the same time, though!
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamInputChannelMap'
--
--     [C declaration]: @SDL_SetAudioStreamInputChannelMap@, defined at @SDL3\/SDL_audio.h 1354:34@
sDL_SetAudioStreamInputChannelMap
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to change.
  -> PtrConst.PtrConst BG.CInt
  -- ^
  --
  --           [@chmap@]: the new channel map, NULL to reset to default.
  -> BG.CInt
  -- ^
  --
  --           [@count@]: The number of channels in the map.
  -> IO BG.CBool
sDL_SetAudioStreamInputChannelMap =
  hs_bindgen_d47a0e77e800172e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamOutputChannelMap@
foreign import ccall safe "hs_bindgen_b53ca7ca85639b18"
  hs_bindgen_b53ca7ca85639b18_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamOutputChannelMap@
hs_bindgen_b53ca7ca85639b18
  :: BG.Ptr SDL_AudioStream
  -> PtrConst.PtrConst BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_b53ca7ca85639b18 =
  BG.fromFFIType hs_bindgen_b53ca7ca85639b18_base

-- | Set the current output channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](CategoryAudio#channel-layouts).
--
--     The output channel map reorders data that is leaving a stream via SDL_GetAudioStreamData.
--
--     Each item in the array represents an input channel, and its value is the channel that it should be remapped to. To reverse a stereo signal\'s left and right values, you\'d have an array of @{ 1, 0 }@. It is legal to remap multiple channels to the same thing, so @{ 1, 1 }@ would duplicate the right channel to both channels of a stereo signal. An element in the channel map set to -1 instead of a valid channel will mute that channel, setting it to a silence value.
--
--     You cannot change the number of channels through a channel map, just reorder\/mute them.
--
--     The output channel map can be changed at any time, as output remapping is applied during SDL_GetAudioStreamData.
--
--     Audio streams default to no remapping applied. Passing a NULL channel map is legal, and turns off remapping.
--
--     SDL will copy the channel map; the caller does not have to save this array after this call.
--
--     If @count@ is not equal to the current number of channels in the audio stream\'s format, this will fail. This is a safety measure to make sure a race condition hasn\'t changed the format while this call is setting the channel map.
--
--     Unlike attempting to change the stream\'s format, the output channel map on a stream bound to a recording device is permitted to change at any time; any data added to the stream after this call will have the new mapping, but previously-added data will still have the prior mapping. When the channel map doesn\'t match the hardware\'s channel layout, SDL will convert the data before feeding it to the device for playback.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running. Don\'t change the stream\'s format to have a different number of channels from a a different thread at the same time, though!
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamInputChannelMap'
--
--     [C declaration]: @SDL_SetAudioStreamOutputChannelMap@, defined at @SDL3\/SDL_audio.h 1412:34@
sDL_SetAudioStreamOutputChannelMap
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to change.
  -> PtrConst.PtrConst BG.CInt
  -- ^
  --
  --           [@chmap@]: the new channel map, NULL to reset to default.
  -> BG.CInt
  -- ^
  --
  --           [@count@]: The number of channels in the map.
  -> IO BG.CBool
sDL_SetAudioStreamOutputChannelMap =
  hs_bindgen_b53ca7ca85639b18

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PutAudioStreamData@
foreign import ccall safe "hs_bindgen_aaa4efec7abd5cd4"
  hs_bindgen_aaa4efec7abd5cd4_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PutAudioStreamData@
hs_bindgen_aaa4efec7abd5cd4
  :: BG.Ptr SDL_AudioStream
  -> PtrConst.PtrConst BG.Void
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_aaa4efec7abd5cd4 =
  BG.fromFFIType hs_bindgen_aaa4efec7abd5cd4_base

-- | Add data to the stream.
--
--     This data must match the format\/channels\/samplerate specified in the latest call to SDL_SetAudioStreamFormat, or the format specified when creating the stream if it hasn\'t been changed.
--
--     Note that this call simply copies the unconverted data for later. This is different than SDL2, where data was converted during the Put call and the Get call would just dequeue the previously-converted data.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClearAudioStream', 'sDL_FlushAudioStream', 'sDL_GetAudioStreamData', 'sDL_GetAudioStreamQueued'
--
--     [C declaration]: @SDL_PutAudioStreamData@, defined at @SDL3\/SDL_audio.h 1442:34@
sDL_PutAudioStreamData
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio data is being added to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@buf@]: a pointer to the audio data to add.
  -> BG.CInt
  -- ^
  --
  --           [@len@]: the number of bytes to write to the stream.
  -> IO BG.CBool
sDL_PutAudioStreamData = hs_bindgen_aaa4efec7abd5cd4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PutAudioStreamDataNoCopy@
foreign import ccall safe "hs_bindgen_619ed51504fee204"
  hs_bindgen_619ed51504fee204_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PutAudioStreamDataNoCopy@
hs_bindgen_619ed51504fee204
  :: BG.Ptr SDL_AudioStream
  -> PtrConst.PtrConst BG.Void
  -> BG.CInt
  -> SDL_AudioStreamDataCompleteCallback
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_619ed51504fee204 =
  BG.fromFFIType hs_bindgen_619ed51504fee204_base

-- | Add external data to an audio stream without copying it.
--
--     Unlike @SDL_PutAudioStreamData()@, this function does not make a copy of the provided data, instead storing the provided pointer. This means that the put operation does not need to allocate and copy the data, but the original data must remain available until the stream is done with it, either by being read from the stream in its entirety, or a call to @SDL_ClearAudioStream()@ or @SDL_DestroyAudioStream()@.
--
--     The data must match the format\/channels\/samplerate specified in the latest call to SDL_SetAudioStreamFormat, or the format specified when creating the stream if it hasn\'t been changed.
--
--     An optional callback may be provided, which is called when the stream no longer needs the data. Once this callback fires, the stream will not access the data again. This callback will fire for any reason the data is no longer needed, including clearing or destroying the stream.
--
--     Note that there is still an allocation to store tracking information, so this function is more efficient for larger blocks of data. If you\'re planning to put a few samples at a time, it will be more efficient to use @SDL_PutAudioStreamData()@, which allocates and buffers in blocks.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_ClearAudioStream', 'sDL_FlushAudioStream', 'sDL_GetAudioStreamData', 'sDL_GetAudioStreamQueued'
--
--     [C declaration]: @SDL_PutAudioStreamDataNoCopy@, defined at @SDL3\/SDL_audio.h 1519:34@
sDL_PutAudioStreamDataNoCopy
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio data is being added to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@buf@]: a pointer to the audio data to add.
  -> BG.CInt
  -- ^
  --
  --           [@len@]: the number of bytes to add to the stream.
  -> SDL_AudioStreamDataCompleteCallback
  -- ^
  --
  --           [@callback@]: the callback function to call when the data is no longer needed by the stream. May be NULL.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an opaque pointer provided to the callback for its own personal use.
  -> IO BG.CBool
sDL_PutAudioStreamDataNoCopy =
  hs_bindgen_619ed51504fee204

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PutAudioStreamPlanarData@
foreign import ccall safe "hs_bindgen_a35f9b9040c608a3"
  hs_bindgen_a35f9b9040c608a3_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PutAudioStreamPlanarData@
hs_bindgen_a35f9b9040c608a3
  :: BG.Ptr SDL_AudioStream
  -> PtrConst.PtrConst (PtrConst.PtrConst BG.Void)
  -> BG.CInt
  -> BG.CInt
  -> IO BG.CBool
hs_bindgen_a35f9b9040c608a3 =
  BG.fromFFIType hs_bindgen_a35f9b9040c608a3_base

-- | Add data to the stream with each channel in a separate array.
--
--     This data must match the format\/channels\/samplerate specified in the latest call to SDL_SetAudioStreamFormat, or the format specified when creating the stream if it hasn\'t been changed.
--
--     The data will be interleaved and queued. Note that 'SDL_AudioStream' only operates on interleaved data, so this is simply a convenience function for easily queueing data from sources that provide separate arrays. There is no equivalent function to retrieve planar data.
--
--     The arrays in @channel_buffers@ are ordered as they are to be interleaved; the first array will be the first sample in the interleaved data. Any individual array may be NULL; in this case, silence will be interleaved for that channel.
--
--     @num_channels@ specifies how many arrays are in @channel_buffers@. This can be used as a safety to prevent overflow, in case the stream format has changed elsewhere. If more channels are specified than the current input spec, they are ignored. If less channels are specified, the missing arrays are treated as if they are NULL (silence is written to those channels). If the count is -1, SDL will assume the array count matches the current input spec.
--
--     Note that @num_samples@ is the number of /samples per array/. This can also be thought of as the number of /sample frames/ to be queued. A value of 1 with stereo arrays will queue two samples to the stream. This is different than SDL_PutAudioStreamData, which wants the size of a single array in bytes.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_ClearAudioStream', 'sDL_FlushAudioStream', 'sDL_GetAudioStreamData', 'sDL_GetAudioStreamQueued'
--
--     [C declaration]: @SDL_PutAudioStreamPlanarData@, defined at @SDL3\/SDL_audio.h 1572:34@
sDL_PutAudioStreamPlanarData
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio data is being added to.
  -> PtrConst.PtrConst (PtrConst.PtrConst BG.Void)
  -- ^
  --
  --           [@channel_buffers@]: a pointer to an array of arrays, one array per channel.
  -> BG.CInt
  -- ^
  --
  --           [@num_channels@]: the number of arrays in @channel_buffers@ or -1.
  -> BG.CInt
  -- ^
  --
  --           [@num_samples@]: the number of /samples/ per array to write to the stream.
  -> IO BG.CBool
sDL_PutAudioStreamPlanarData =
  hs_bindgen_a35f9b9040c608a3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamData@
foreign import ccall safe "hs_bindgen_80c78d4a6767c5c1"
  hs_bindgen_80c78d4a6767c5c1_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamData@
hs_bindgen_80c78d4a6767c5c1
  :: BG.Ptr SDL_AudioStream
  -> BG.Ptr BG.Void
  -> BG.CInt
  -> IO BG.CInt
hs_bindgen_80c78d4a6767c5c1 =
  BG.fromFFIType hs_bindgen_80c78d4a6767c5c1_base

-- | Get converted\/resampled data from the stream.
--
--     The input\/output data format\/channels\/samplerate is specified when creating the stream, and can be changed after creation by calling SDL_SetAudioStreamFormat.
--
--     Note that any conversion and resampling necessary is done during this call, and SDL_PutAudioStreamData simply queues unconverted data for later. This is different than SDL2, where that work was done while inputting new data to the stream and requesting the output just copied the converted data.
--
--     [Returns]: the number of bytes read from the stream or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ClearAudioStream', 'sDL_GetAudioStreamAvailable', 'sDL_PutAudioStreamData'
--
--     [C declaration]: @SDL_GetAudioStreamData@, defined at @SDL3\/SDL_audio.h 1602:33@
sDL_GetAudioStreamData
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio is being requested from.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@buf@]: a buffer to fill with audio data.
  -> BG.CInt
  -- ^
  --
  --           [@len@]: the maximum number of bytes to fill.
  -> IO BG.CInt
sDL_GetAudioStreamData = hs_bindgen_80c78d4a6767c5c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamAvailable@
foreign import ccall safe "hs_bindgen_2ddc379eb0f7050b"
  hs_bindgen_2ddc379eb0f7050b_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamAvailable@
hs_bindgen_2ddc379eb0f7050b
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CInt
hs_bindgen_2ddc379eb0f7050b =
  BG.fromFFIType hs_bindgen_2ddc379eb0f7050b_base

-- | Get the number of converted\/resampled bytes available.
--
--     The stream may be buffering data behind the scenes until it has enough to resample correctly, so this number might be lower than what you expect, or even be zero. Add more data or flush the stream if you need the data now.
--
--     If the stream has so much data that it would overflow an int, the return value is clamped to a maximum value, but no queued data is lost; if there are gigabytes of data queued, the app might need to read some of it with SDL_GetAudioStreamData before this function\'s return value is no longer clamped.
--
--     [Returns]: the number of converted\/resampled bytes available or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAudioStreamData', 'sDL_PutAudioStreamData'
--
--     [C declaration]: @SDL_GetAudioStreamAvailable@, defined at @SDL3\/SDL_audio.h 1628:33@
sDL_GetAudioStreamAvailable
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to query.
  -> IO BG.CInt
sDL_GetAudioStreamAvailable =
  hs_bindgen_2ddc379eb0f7050b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamQueued@
foreign import ccall safe "hs_bindgen_3c01027250fa0224"
  hs_bindgen_3c01027250fa0224_base
    :: BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioStreamQueued@
hs_bindgen_3c01027250fa0224
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CInt
hs_bindgen_3c01027250fa0224 =
  BG.fromFFIType hs_bindgen_3c01027250fa0224_base

-- | Get the number of bytes currently queued.
--
--     This is the number of bytes put into a stream as input, not the number that can be retrieved as output. Because of several details, it\'s not possible to calculate one number directly from the other. If you need to know how much usable data can be retrieved right now, you should use @SDL_GetAudioStreamAvailable()@ and not this function.
--
--     Note that audio streams can change their input format at any time, even if there is still data queued in a different format, so the returned byte count will not necessarily match the number of /sample frames/ available. Users of this API should be aware of format changes they make when feeding a stream and plan accordingly.
--
--     Queued data is not converted until it is consumed by SDL_GetAudioStreamData, so this value should be representative of the exact data that was put into the stream.
--
--     If the stream has so much data that it would overflow an int, the return value is clamped to a maximum value, but no queued data is lost; if there are gigabytes of data queued, the app might need to read some of it with SDL_GetAudioStreamData before this function\'s return value is no longer clamped.
--
--     [Returns]: the number of bytes queued or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PutAudioStreamData', 'sDL_ClearAudioStream'
--
--     [C declaration]: @SDL_GetAudioStreamQueued@, defined at @SDL3\/SDL_audio.h 1667:33@
sDL_GetAudioStreamQueued
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to query.
  -> IO BG.CInt
sDL_GetAudioStreamQueued =
  hs_bindgen_3c01027250fa0224

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_FlushAudioStream@
foreign import ccall safe "hs_bindgen_a08de3ff3d4b6b48"
  hs_bindgen_a08de3ff3d4b6b48_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_FlushAudioStream@
hs_bindgen_a08de3ff3d4b6b48
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CBool
hs_bindgen_a08de3ff3d4b6b48 =
  BG.fromFFIType hs_bindgen_a08de3ff3d4b6b48_base

-- | Tell the stream that you\'re done sending data, and anything being buffered should be converted\/resampled and made available immediately.
--
--     It is legal to add more data to a stream after flushing, but there may be audio gaps in the output. Generally this is intended to signal the end of input, so the complete output becomes available.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PutAudioStreamData'
--
--     [C declaration]: @SDL_FlushAudioStream@, defined at @SDL3\/SDL_audio.h 1688:34@
sDL_FlushAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to flush.
  -> IO BG.CBool
sDL_FlushAudioStream = hs_bindgen_a08de3ff3d4b6b48

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_ClearAudioStream@
foreign import ccall safe "hs_bindgen_495b0c63dde7c64f"
  hs_bindgen_495b0c63dde7c64f_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_ClearAudioStream@
hs_bindgen_495b0c63dde7c64f
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CBool
hs_bindgen_495b0c63dde7c64f =
  BG.fromFFIType hs_bindgen_495b0c63dde7c64f_base

-- | Clear any pending data in the stream.
--
--     This drops any queued data, so there will be nothing to read from the stream until more is added.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAudioStreamAvailable', 'sDL_GetAudioStreamData', 'sDL_GetAudioStreamQueued', 'sDL_PutAudioStreamData'
--
--     [C declaration]: @SDL_ClearAudioStream@, defined at @SDL3\/SDL_audio.h 1709:34@
sDL_ClearAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to clear.
  -> IO BG.CBool
sDL_ClearAudioStream = hs_bindgen_495b0c63dde7c64f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PauseAudioStreamDevice@
foreign import ccall safe "hs_bindgen_b5ae37aa80b742a5"
  hs_bindgen_b5ae37aa80b742a5_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_PauseAudioStreamDevice@
hs_bindgen_b5ae37aa80b742a5
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CBool
hs_bindgen_b5ae37aa80b742a5 =
  BG.fromFFIType hs_bindgen_b5ae37aa80b742a5_base

-- | Use this function to pause audio playback on the audio device associated with an audio stream.
--
--     This function pauses audio processing for a given device. Any bound audio streams will not progress, and no audio will be generated. Pausing one device does not prevent other unpaused devices from running.
--
--     Pausing a device can be useful to halt all audio without unbinding all the audio streams. This might be useful while a game is paused, or a level is loading, etc.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ResumeAudioStreamDevice'
--
--     [C declaration]: @SDL_PauseAudioStreamDevice@, defined at @SDL3\/SDL_audio.h 1733:34@
sDL_PauseAudioStreamDevice
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream associated with the audio device to pause.
  -> IO BG.CBool
sDL_PauseAudioStreamDevice =
  hs_bindgen_b5ae37aa80b742a5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_ResumeAudioStreamDevice@
foreign import ccall safe "hs_bindgen_df0b3314efa54fdd"
  hs_bindgen_df0b3314efa54fdd_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_ResumeAudioStreamDevice@
hs_bindgen_df0b3314efa54fdd
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CBool
hs_bindgen_df0b3314efa54fdd =
  BG.fromFFIType hs_bindgen_df0b3314efa54fdd_base

-- | Use this function to unpause audio playback on the audio device associated with an audio stream.
--
--     This function unpauses audio processing for a given device that has previously been paused. Once unpaused, any bound audio streams will begin to progress again, and audio can be generated.
--
--     SDL_OpenAudioDeviceStream opens audio devices in a paused state, so this function call is required for audio playback to begin on such devices.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PauseAudioStreamDevice'
--
--     [C declaration]: @SDL_ResumeAudioStreamDevice@, defined at @SDL3\/SDL_audio.h 1756:34@
sDL_ResumeAudioStreamDevice
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream associated with the audio device to resume.
  -> IO BG.CBool
sDL_ResumeAudioStreamDevice =
  hs_bindgen_df0b3314efa54fdd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_AudioStreamDevicePaused@
foreign import ccall safe "hs_bindgen_1ff005643c24e6c0"
  hs_bindgen_1ff005643c24e6c0_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_AudioStreamDevicePaused@
hs_bindgen_1ff005643c24e6c0
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CBool
hs_bindgen_1ff005643c24e6c0 =
  BG.fromFFIType hs_bindgen_1ff005643c24e6c0_base

-- | Use this function to query if an audio device associated with a stream is paused.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow.
--
--     [Returns]: true if device is valid and paused, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PauseAudioStreamDevice', 'sDL_ResumeAudioStreamDevice'
--
--     [C declaration]: @SDL_AudioStreamDevicePaused@, defined at @SDL3\/SDL_audio.h 1775:34@
sDL_AudioStreamDevicePaused
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream associated with the audio device to query.
  -> IO BG.CBool
sDL_AudioStreamDevicePaused =
  hs_bindgen_1ff005643c24e6c0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_LockAudioStream@
foreign import ccall safe "hs_bindgen_3d4874ba18717a32"
  hs_bindgen_3d4874ba18717a32_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_LockAudioStream@
hs_bindgen_3d4874ba18717a32
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CBool
hs_bindgen_3d4874ba18717a32 =
  BG.fromFFIType hs_bindgen_3d4874ba18717a32_base

-- | Lock an audio stream for serialized access.
--
--     Each 'SDL_AudioStream' has an internal mutex it uses to protect its data structures from threading conflicts. This function allows an app to lock that mutex, which could be useful if registering callbacks on this stream.
--
--     One does not need to lock a stream to use in it most cases, as the stream manages this lock internally. However, this lock is held during callbacks, which may run from arbitrary threads at any time, so if an app needs to protect shared data during those callbacks, locking the stream guarantees that the callback is not running while the lock is held.
--
--     As this is just a wrapper over SDL_LockMutex for an internal lock; it has all the same attributes (recursive locks are allowed, etc).
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_UnlockAudioStream'
--
--     [C declaration]: @SDL_LockAudioStream@, defined at @SDL3\/SDL_audio.h 1804:34@
sDL_LockAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to lock.
  -> IO BG.CBool
sDL_LockAudioStream = hs_bindgen_3d4874ba18717a32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_UnlockAudioStream@
foreign import ccall safe "hs_bindgen_0175d2c579f38af7"
  hs_bindgen_0175d2c579f38af7_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_UnlockAudioStream@
hs_bindgen_0175d2c579f38af7
  :: BG.Ptr SDL_AudioStream
  -> IO BG.CBool
hs_bindgen_0175d2c579f38af7 =
  BG.fromFFIType hs_bindgen_0175d2c579f38af7_base

-- | Unlock an audio stream for serialized access.
--
--     This unlocks an audio stream after a call to SDL_LockAudioStream.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: You should only call this from the same thread that previously called SDL_LockAudioStream.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LockAudioStream'
--
--     [C declaration]: @SDL_UnlockAudioStream@, defined at @SDL3\/SDL_audio.h 1823:34@
sDL_UnlockAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to unlock.
  -> IO BG.CBool
sDL_UnlockAudioStream = hs_bindgen_0175d2c579f38af7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamGetCallback@
foreign import ccall safe "hs_bindgen_65648a5a73743f2d"
  hs_bindgen_65648a5a73743f2d_base
    :: BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamGetCallback@
hs_bindgen_65648a5a73743f2d
  :: BG.Ptr SDL_AudioStream
  -> SDL_AudioStreamCallback
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_65648a5a73743f2d =
  BG.fromFFIType hs_bindgen_65648a5a73743f2d_base

-- | Set a callback that runs when data is requested from an audio stream.
--
--     This callback is called /before/ data is obtained from the stream, giving the callback the chance to add more on-demand.
--
--     The callback can (optionally) call @SDL_PutAudioStreamData()@ to add more audio to the stream during this call; if needed, the request that triggered this callback will obtain the new data immediately.
--
--     The callback\'s @additional_amount@ argument is roughly how many bytes of /unconverted/ data (in the stream\'s input format) is needed by the caller, although this may overestimate a little for safety. This takes into account how much is already in the stream and only asks for any extra necessary to resolve the request, which means the callback may be asked for zero bytes, and a different amount on each call.
--
--     The callback is not required to supply exact amounts; it is allowed to supply too much or too little or none at all. The caller will get what\'s available, up to the amount they requested, regardless of this callback\'s outcome.
--
--     Clearing or flushing an audio stream does not call this callback.
--
--     This function obtains the stream\'s lock, which means any existing callback (get or put) in progress will finish running before setting the new callback.
--
--     Setting a NULL function turns off the callback.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information. This only fails if @stream@ is NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamPutCallback'
--
--     [C declaration]: @SDL_SetAudioStreamGetCallback@, defined at @SDL3\/SDL_audio.h 1911:34@
sDL_SetAudioStreamGetCallback
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to set the new callback on.
  -> SDL_AudioStreamCallback
  -- ^
  --
  --           [@callback@]: the new callback function to call when data is requested from the stream.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an opaque pointer provided to the callback for its own personal use.
  -> IO BG.CBool
sDL_SetAudioStreamGetCallback =
  hs_bindgen_65648a5a73743f2d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamPutCallback@
foreign import ccall safe "hs_bindgen_61ea9930449caa3b"
  hs_bindgen_61ea9930449caa3b_base
    :: BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioStreamPutCallback@
hs_bindgen_61ea9930449caa3b
  :: BG.Ptr SDL_AudioStream
  -> SDL_AudioStreamCallback
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_61ea9930449caa3b =
  BG.fromFFIType hs_bindgen_61ea9930449caa3b_base

-- | Set a callback that runs when data is added to an audio stream.
--
--     This callback is called /after/ the data is added to the stream, giving the callback the chance to obtain it immediately.
--
--     The callback can (optionally) call @SDL_GetAudioStreamData()@ to obtain audio from the stream during this call.
--
--     The callback\'s @additional_amount@ argument is how many bytes of /converted/ data (in the stream\'s output format) was provided by the caller, although this may underestimate a little for safety. This value might be less than what is currently available in the stream, if data was already there, and might be less than the caller provided if the stream needs to keep a buffer to aid in resampling. Which means the callback may be provided with zero bytes, and a different amount on each call.
--
--     The callback may call SDL_GetAudioStreamAvailable to see the total amount currently available to read from the stream, instead of the total provided by the current call.
--
--     The callback is not required to obtain all data. It is allowed to read less or none at all. Anything not read now simply remains in the stream for later access.
--
--     Clearing or flushing an audio stream does not call this callback.
--
--     This function obtains the stream\'s lock, which means any existing callback (get or put) in progress will finish running before setting the new callback.
--
--     Setting a NULL function turns off the callback.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information. This only fails if @stream@ is NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamGetCallback'
--
--     [C declaration]: @SDL_SetAudioStreamPutCallback@, defined at @SDL3\/SDL_audio.h 1960:34@
sDL_SetAudioStreamPutCallback
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to set the new callback on.
  -> SDL_AudioStreamCallback
  -- ^
  --
  --           [@callback@]: the new callback function to call when data is added to the stream.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: an opaque pointer provided to the callback for its own personal use.
  -> IO BG.CBool
sDL_SetAudioStreamPutCallback =
  hs_bindgen_61ea9930449caa3b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_DestroyAudioStream@
foreign import ccall safe "hs_bindgen_2f2920f372de3f91"
  hs_bindgen_2f2920f372de3f91_base
    :: BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_DestroyAudioStream@
hs_bindgen_2f2920f372de3f91
  :: BG.Ptr SDL_AudioStream
  -> IO ()
hs_bindgen_2f2920f372de3f91 =
  BG.fromFFIType hs_bindgen_2f2920f372de3f91_base

-- | Free an audio stream.
--
--     This will release all allocated data, including any audio that is still queued. You do not need to manually clear the stream first.
--
--     If this stream was bound to an audio device, it is unbound during this call. If this stream was created with SDL_OpenAudioDeviceStream, the audio device that was opened alongside this stream\'s creation will be closed, too.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateAudioStream'
--
--     [C declaration]: @SDL_DestroyAudioStream@, defined at @SDL3\/SDL_audio.h 1982:34@
sDL_DestroyAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to destroy.
  -> IO ()
sDL_DestroyAudioStream = hs_bindgen_2f2920f372de3f91

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_OpenAudioDeviceStream@
foreign import ccall safe "hs_bindgen_41a1f387b2d98901"
  hs_bindgen_41a1f387b2d98901_base
    :: BG.Word32
    -> BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_OpenAudioDeviceStream@
hs_bindgen_41a1f387b2d98901
  :: SDL_AudioDeviceID
  -> PtrConst.PtrConst SDL_AudioSpec
  -> SDL_AudioStreamCallback
  -> BG.Ptr BG.Void
  -> IO (BG.Ptr SDL_AudioStream)
hs_bindgen_41a1f387b2d98901 =
  BG.fromFFIType hs_bindgen_41a1f387b2d98901_base

-- | Convenience function for straightforward audio init for the common case.
--
--     If all your app intends to do is provide a single source of PCM audio, this function allows you to do all your audio setup in a single call.
--
--     This is also intended to be a clean means to migrate apps from SDL2.
--
--     This function will open an audio device, create a stream and bind it. Unlike other methods of setup, the audio device will be closed when this stream is destroyed, so the app can treat the returned 'SDL_AudioStream' as the only object needed to manage audio playback.
--
--     Also unlike other functions, the audio device begins paused. This is to map more closely to SDL2-style behavior, since there is no extra step here to bind a stream to begin audio flowing. The audio device should be resumed with @SDL_ResumeAudioStreamDevice()@.
--
--     This function works with both playback and recording devices.
--
--     The @spec@ parameter represents the app\'s side of the audio stream. That is, for recording audio, this will be the output format, and for playing audio, this will be the input format. If spec is NULL, the system will choose the format, and the app can use @SDL_GetAudioStreamFormat()@ to obtain this information later.
--
--     If you don\'t care about opening a specific audio device, you can (and probably /should/), use SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK for playback and SDL_AUDIO_DEVICE_DEFAULT_RECORDING for recording.
--
--     One can optionally provide a callback function; if NULL, the app is expected to queue audio data for playback (or unqueue audio data if capturing). Otherwise, the callback will begin to fire once the device is unpaused.
--
--     Destroying the returned stream with SDL_DestroyAudioStream will also close the audio device associated with this stream.
--
--     [Returns]: an audio stream on success, ready to use, or NULL on failure; call SDL_GetError() for more information. When done with this stream, call SDL_DestroyAudioStream to free resources and close the device.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetAudioStreamDevice', 'sDL_ResumeAudioStreamDevice'
--
--     [C declaration]: @SDL_OpenAudioDeviceStream@, defined at @SDL3\/SDL_audio.h 2045:47@
sDL_OpenAudioDeviceStream
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device to open, or SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or SDL_AUDIO_DEVICE_DEFAULT_RECORDING.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@spec@]: the audio stream\'s data format. Can be NULL.
  -> SDL_AudioStreamCallback
  -- ^
  --
  --           [@callback@]: a callback where the app will provide new data for playback, or receive new data for recording. Can be NULL, in which case the app will need to call SDL_PutAudioStreamData or SDL_GetAudioStreamData as necessary.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: app-controlled pointer passed to callback. Can be NULL. Ignored if callback is NULL.
  -> IO (BG.Ptr SDL_AudioStream)
sDL_OpenAudioDeviceStream =
  hs_bindgen_41a1f387b2d98901

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioPostmixCallback@
foreign import ccall safe "hs_bindgen_4e2802e9ed6e7f25"
  hs_bindgen_4e2802e9ed6e7f25_base
    :: BG.Word32
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_SetAudioPostmixCallback@
hs_bindgen_4e2802e9ed6e7f25
  :: SDL_AudioDeviceID
  -> SDL_AudioPostmixCallback
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_4e2802e9ed6e7f25 =
  BG.fromFFIType hs_bindgen_4e2802e9ed6e7f25_base

-- | Set a callback that fires when data is about to be fed to an audio device.
--
--     This is useful for accessing the final mix, perhaps for writing a visualizer or applying a final effect to the audio data before playback.
--
--     The buffer is the final mix of all bound audio streams on an opened device; this callback will fire regularly for any device that is both opened and unpaused. If there is no new data to mix, either because no streams are bound to the device or all the streams are empty, this callback will still fire with the entire buffer set to silence.
--
--     This callback is allowed to make changes to the data; the contents of the buffer after this call is what is ultimately passed along to the hardware.
--
--     The callback is always provided the data in float format (values from -1.0f to 1.0f), but the number of channels or sample rate may be different than the format the app requested when opening the device; SDL might have had to manage a conversion behind the scenes, or the playback might have jumped to new physical hardware when a system default changed, etc. These details may change between calls. Accordingly, the size of the buffer might change between calls as well.
--
--     This callback can run at any time, and from any thread; if you need to serialize access to your app\'s data, you should provide and use a mutex or other synchronization device.
--
--     All of this to say: there are specific needs this callback can fulfill, but it is not the simplest interface. Apps should generally provide audio in their preferred format through an 'SDL_AudioStream' and let SDL handle the difference.
--
--     This function is extremely time-sensitive; the callback should do the least amount of work possible and return as quickly as it can. The longer the callback runs, the higher the risk of audio dropouts or other problems.
--
--     This function will block until the audio device is in between iterations, so any existing callback that might be running will finish before this function sets the new callback and returns.
--
--     Setting a NULL callback function disables any previously-set callback.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetAudioPostmixCallback@, defined at @SDL3\/SDL_audio.h 2136:34@
sDL_SetAudioPostmixCallback
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the ID of an opened audio device.
  -> SDL_AudioPostmixCallback
  -- ^
  --
  --           [@callback@]: a callback function to be called. Can be NULL.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: app-controlled pointer passed to callback. Can be NULL.
  -> IO BG.CBool
sDL_SetAudioPostmixCallback =
  hs_bindgen_4e2802e9ed6e7f25

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_LoadWAV_IO@
foreign import ccall safe "hs_bindgen_a910288634dd93c9"
  hs_bindgen_a910288634dd93c9_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_LoadWAV_IO@
hs_bindgen_a910288634dd93c9
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -> BG.CBool
  -> BG.Ptr SDL_AudioSpec
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_a910288634dd93c9 =
  BG.fromFFIType hs_bindgen_a910288634dd93c9_base

-- | Load the audio data of a WAVE file into memory.
--
--     Loading a WAVE file requires @src@, @spec@, @audio_buf@ and @audio_len@ to be valid pointers. The entire data portion of the file is then loaded into memory and decoded if necessary.
--
--     Supported formats are RIFF WAVE files with the formats PCM (8, 16, 24, and 32 bits), IEEE Float (32 bits), Microsoft ADPCM and IMA ADPCM (4 bits), and A-law and mu-law (8 bits). Other formats are currently unsupported and cause an error.
--
--     If this function succeeds, the return value is zero and the pointer to the audio data allocated by the function is written to @audio_buf@ and its length in bytes to @audio_len@. The 'SDL_AudioSpec' members @freq@, @channels@, and @format@ are set to the values of the audio data in the buffer.
--
--     It\'s necessary to use SDL_free() to free the audio data returned in @audio_buf@ when it is no longer used.
--
--     Because of the underspecification of the .WAV format, there are many problematic files in the wild that cause issues with strict decoders. To provide compatibility with these files, this decoder is lenient in regards to the truncation of the file, the fact chunk, and the size of the RIFF chunk. The hints @SDL_HINT_WAVE_RIFF_CHUNK_SIZE@, @SDL_HINT_WAVE_TRUNCATION@, and @SDL_HINT_WAVE_FACT_CHUNK@ can be used to tune the behavior of the loading process.
--
--     Any file that is invalid (due to truncation, corruption, or wrong values in the headers), too big, or unsupported causes an error. Additionally, any critical I\/O error from the data source will terminate the loading process with an error. The function returns NULL on error and in all cases (with the exception of @src@ being NULL), an appropriate error message will be set.
--
--     It is required that the data source supports seeking.
--
--     Example:
--
--     @
--     SDL_LoadWAV_IO(SDL_IOFromFile(\"sample.wav\", \"rb\"), true, &spec, &buf, &len);
--     @
--
--     Note that the SDL_LoadWAV function does this same thing for you, but in a less messy way:
--
--     @
--     SDL_LoadWAV(\"sample.wav\", &spec, &buf, &len);
--     @
--
--     This function returns false if the .WAV file cannot be opened, uses an unknown data format, or is corrupt; call SDL_GetError() for more information.
--
--     [Returns]: true on success. @audio_buf@ will be filled with a pointer to an allocated buffer containing the audio data, and @audio_len@ is filled with the length of that audio buffer in bytes.
--
--     When the application is done with the data returned in @audio_buf@, it should call SDL_free() to dispose of it.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_free, 'sDL_LoadWAV'
--
--     [C declaration]: @SDL_LoadWAV_IO@, defined at @SDL3\/SDL_audio.h 2217:34@
sDL_LoadWAV_IO
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data source for the WAVE data.
  -> BG.CBool
  -- ^
  --
  --           [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
  -> BG.Ptr SDL_AudioSpec
  -- ^
  --
  --           [@spec@]: a pointer to an 'SDL_AudioSpec' that will be set to the WAVE data\'s format details on successful return.
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
  -- ^
  --
  --           [@audio_buf@]: a pointer filled with the audio data, allocated by the function.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@audio_len@]: a pointer filled with the length of the audio data buffer in bytes.
  -> IO BG.CBool
sDL_LoadWAV_IO = hs_bindgen_a910288634dd93c9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_LoadWAV@
foreign import ccall safe "hs_bindgen_9dc1494e309920f0"
  hs_bindgen_9dc1494e309920f0_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_LoadWAV@
hs_bindgen_9dc1494e309920f0
  :: PtrConst.PtrConst BG.CChar
  -> BG.Ptr SDL_AudioSpec
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_9dc1494e309920f0 =
  BG.fromFFIType hs_bindgen_9dc1494e309920f0_base

-- | Loads a WAV from a file path.
--
--     This is a convenience function that is effectively the same as:
--
--     @
--     SDL_LoadWAV_IO(SDL_IOFromFile(path, \"rb\"), true, spec, audio_buf, audio_len);
--     @
--
--     This function returns false if the .WAV file cannot be opened, uses an unknown data format, or is corrupt; call SDL_GetError() for more information.
--
--     [Returns]: true on success. @audio_buf@ will be filled with a pointer to an allocated buffer containing the audio data, and @audio_len@ is filled with the length of that audio buffer in bytes.
--
--     When the application is done with the data returned in @audio_buf@, it should call SDL_free() to dispose of it.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_free, 'sDL_LoadWAV_IO'
--
--     [C declaration]: @SDL_LoadWAV@, defined at @SDL3\/SDL_audio.h 2253:34@
sDL_LoadWAV
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the file path of the WAV file to open.
  -> BG.Ptr SDL_AudioSpec
  -- ^
  --
  --           [@spec@]: a pointer to an 'SDL_AudioSpec' that will be set to the WAVE data\'s format details on successful return.
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
  -- ^
  --
  --           [@audio_buf@]: a pointer filled with the audio data, allocated by the function.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@audio_len@]: a pointer filled with the length of the audio data buffer in bytes.
  -> IO BG.CBool
sDL_LoadWAV = hs_bindgen_9dc1494e309920f0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_MixAudio@
foreign import ccall safe "hs_bindgen_f90c9509d9c249ee"
  hs_bindgen_f90c9509d9c249ee_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Word32
    -> Float
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_MixAudio@
hs_bindgen_f90c9509d9c249ee
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -> SDL_AudioFormat
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> BG.CFloat
  -> IO BG.CBool
hs_bindgen_f90c9509d9c249ee =
  BG.fromFFIType hs_bindgen_f90c9509d9c249ee_base

-- | Mix audio data in a specified format.
--
--     This takes an audio buffer @src@ of @len@ bytes of @format@ data and mixes it into @dst@, performing addition, volume adjustment, and overflow clipping. The buffer pointed to by @dst@ must also be @len@ bytes of @format@ data.
--
--     This is provided for convenience you can mix your own audio data.
--
--     Do not use this function for mixing together more than two streams of sample data. The output from repeated application of this function may be distorted by clipping, because there is no accumulator with greater range than the input (not to mention this being an inefficient way of doing it).
--
--     It is a common misconception that this function is required to write audio data to an output stream in an audio callback. While you can do that, @SDL_MixAudio()@ is really only needed when you\'re mixing a single audio stream with a volume adjustment.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_MixAudio@, defined at @SDL3\/SDL_audio.h 2289:34@
sDL_MixAudio
  :: BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@dst@]: the destination for the mixed audio.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@src@]: the source audio buffer to be mixed.
  -> SDL_AudioFormat
  -- ^
  --
  --           [@format@]: the 'SDL_AudioFormat' structure representing the desired audio format.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@len@]: the length of the audio buffer in bytes.
  -> BG.CFloat
  -- ^
  --
  --           [@volume@]: ranges from 0.0 - 1.0, and should be set to 1.0 for full audio volume.
  -> IO BG.CBool
sDL_MixAudio = hs_bindgen_f90c9509d9c249ee

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_ConvertAudioSamples@
foreign import ccall safe "hs_bindgen_ee64493d4496844f"
  hs_bindgen_ee64493d4496844f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_ConvertAudioSamples@
hs_bindgen_ee64493d4496844f
  :: PtrConst.PtrConst SDL_AudioSpec
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -> BG.CInt
  -> PtrConst.PtrConst SDL_AudioSpec
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
  -> BG.Ptr BG.CInt
  -> IO BG.CBool
hs_bindgen_ee64493d4496844f =
  BG.fromFFIType hs_bindgen_ee64493d4496844f_base

-- | Convert some audio data of one format to another format.
--
--     Please note that this function is for convenience, but should not be used to resample audio in blocks, as it will introduce audio artifacts on the boundaries. You should only use this function if you are converting audio data in its entirety in one call. If you want to convert audio in smaller chunks, use an 'SDL_AudioStream', which is designed for this situation.
--
--     Internally, this function creates and destroys an 'SDL_AudioStream' on each use, so it\'s also less efficient than using one directly, if you need to convert multiple times.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ConvertAudioSamples@, defined at @SDL3\/SDL_audio.h 2319:34@
sDL_ConvertAudioSamples
  :: PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@src_spec@]: the format details of the input audio.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@src_data@]: the audio data to be converted.
  -> BG.CInt
  -- ^
  --
  --           [@src_len@]: the len of src_data.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@dst_spec@]: the format details of the output audio.
  -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
  -- ^
  --
  --           [@dst_data@]: will be filled with a pointer to converted audio data, which should be freed with SDL_free(). On error, it will be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@dst_len@]: will be filled with the len of dst_data.
  -> IO BG.CBool
sDL_ConvertAudioSamples = hs_bindgen_ee64493d4496844f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioFormatName@
foreign import ccall safe "hs_bindgen_427a7131d02ce29b"
  hs_bindgen_427a7131d02ce29b_base
    :: BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetAudioFormatName@
hs_bindgen_427a7131d02ce29b
  :: SDL_AudioFormat
  -> IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_427a7131d02ce29b =
  BG.fromFFIType hs_bindgen_427a7131d02ce29b_base

-- | Get the human readable name of an audio format.
--
--     [Returns]: the human readable name of the specified audio format or \"SDL_AUDIO_UNKNOWN\" if the format isn\'t recognized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetAudioFormatName@, defined at @SDL3\/SDL_audio.h 2332:42@
sDL_GetAudioFormatName
  :: SDL_AudioFormat
  -- ^
  --
  --           [@format@]: the audio format to query.
  -> IO (PtrConst.PtrConst BG.CChar)
sDL_GetAudioFormatName = hs_bindgen_427a7131d02ce29b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetSilenceValueForFormat@
foreign import ccall safe "hs_bindgen_a78d31ca2af16da3"
  hs_bindgen_a78d31ca2af16da3_base
    :: BG.Word32
    -> IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_Safe_SDL_GetSilenceValueForFormat@
hs_bindgen_a78d31ca2af16da3
  :: SDL_AudioFormat
  -> IO BG.CInt
hs_bindgen_a78d31ca2af16da3 =
  BG.fromFFIType hs_bindgen_a78d31ca2af16da3_base

-- | Get the appropriate memset value for silencing an audio format.
--
--     The value returned by this function can be used as the second argument to memset (or SDL_memset) to set an audio buffer in a specific format to silence.
--
--     [Returns]: a byte value that can be passed to memset.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSilenceValueForFormat@, defined at @SDL3\/SDL_audio.h 2348:33@
sDL_GetSilenceValueForFormat
  :: SDL_AudioFormat
  -- ^
  --
  --           [@format@]: the audio data format to query.
  -> IO BG.CInt
sDL_GetSilenceValueForFormat =
  hs_bindgen_a78d31ca2af16da3
