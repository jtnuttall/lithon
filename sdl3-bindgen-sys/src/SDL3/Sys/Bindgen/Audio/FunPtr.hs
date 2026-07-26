{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Audio.FunPtr (
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetNumAudioDrivers,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioDriver,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetCurrentAudioDriver,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioPlaybackDevices,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioRecordingDevices,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioDeviceName,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioDeviceFormat,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioDeviceChannelMap,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_OpenAudioDevice,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_IsAudioDevicePhysical,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_IsAudioDevicePlayback,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_PauseAudioDevice,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_ResumeAudioDevice,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_AudioDevicePaused,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioDeviceGain,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_SetAudioDeviceGain,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_CloseAudioDevice,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_BindAudioStreams,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_BindAudioStream,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_UnbindAudioStreams,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_UnbindAudioStream,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamDevice,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_CreateAudioStream,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamProperties,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamFormat,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_SetAudioStreamFormat,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamFrequencyRatio,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_SetAudioStreamFrequencyRatio,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamGain,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_SetAudioStreamGain,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamInputChannelMap,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamOutputChannelMap,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_SetAudioStreamInputChannelMap,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_SetAudioStreamOutputChannelMap,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_PutAudioStreamData,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_PutAudioStreamDataNoCopy,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_PutAudioStreamPlanarData,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamData,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamAvailable,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioStreamQueued,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_FlushAudioStream,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_ClearAudioStream,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_PauseAudioStreamDevice,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_ResumeAudioStreamDevice,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_AudioStreamDevicePaused,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_LockAudioStream,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_UnlockAudioStream,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_SetAudioStreamGetCallback,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_SetAudioStreamPutCallback,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_DestroyAudioStream,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_OpenAudioDeviceStream,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_SetAudioPostmixCallback,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_LoadWAV_IO,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_LoadWAV,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_MixAudio,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_ConvertAudioSamples,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetAudioFormatName,
  SDL3.Sys.Bindgen.Audio.FunPtr.sDL_GetSilenceValueForFormat,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetNumAudioDrivers */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_70df3deb87a6a291 (void)) (void)"
         , "{"
         , "  return &SDL_GetNumAudioDrivers;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDriver */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_96a59296db34206f (void)) ("
         , "  signed int arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioDriver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetCurrentAudioDriver */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_3b5e65309af7eb52 (void)) (void)"
         , "{"
         , "  return &SDL_GetCurrentAudioDriver;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioPlaybackDevices */"
         , "__attribute__ ((const))"
         , "SDL_AudioDeviceID *(*hs_bindgen_0154df1db50254cb (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioPlaybackDevices;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioRecordingDevices */"
         , "__attribute__ ((const))"
         , "SDL_AudioDeviceID *(*hs_bindgen_b1e17652d75669ba (void)) ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioRecordingDevices;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_dcc642abb8604857 (void)) ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioDeviceName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceFormat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7ee63106dd01fabe (void)) ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioSpec *arg2,"
         , "  signed int *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetAudioDeviceFormat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceChannelMap */"
         , "__attribute__ ((const))"
         , "signed int *(*hs_bindgen_d8865ee45cf3f909 (void)) ("
         , "  SDL_AudioDeviceID arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetAudioDeviceChannelMap;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_OpenAudioDevice */"
         , "__attribute__ ((const))"
         , "SDL_AudioDeviceID (*hs_bindgen_a61ac8f884503a96 (void)) ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioSpec const *arg2"
         , ")"
         , "{"
         , "  return &SDL_OpenAudioDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_IsAudioDevicePhysical */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6499cfa703c6758f (void)) ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return &SDL_IsAudioDevicePhysical;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_IsAudioDevicePlayback */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_a0086d8f92145768 (void)) ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return &SDL_IsAudioDevicePlayback;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PauseAudioDevice */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1003717acae7ce8b (void)) ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return &SDL_PauseAudioDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ResumeAudioDevice */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_df9a550a09c18c65 (void)) ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return &SDL_ResumeAudioDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_AudioDevicePaused */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4580e249e63ded2b (void)) ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return &SDL_AudioDevicePaused;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceGain */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_6f1b270afdab6bb6 (void)) ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioDeviceGain;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioDeviceGain */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_aa933d15c7bb8ed3 (void)) ("
         , "  SDL_AudioDeviceID arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_SetAudioDeviceGain;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_CloseAudioDevice */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b303dd6fccc99188 (void)) ("
         , "  SDL_AudioDeviceID arg1"
         , ")"
         , "{"
         , "  return &SDL_CloseAudioDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_BindAudioStreams */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3e9d0d17f11c1de8 (void)) ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioStream *const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_BindAudioStreams;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_BindAudioStream */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d6749d59b79ec0ff (void)) ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioStream *arg2"
         , ")"
         , "{"
         , "  return &SDL_BindAudioStream;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_UnbindAudioStreams */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_d96a4f36c25b0021 (void)) ("
         , "  SDL_AudioStream *const *arg1,"
         , "  signed int arg2"
         , ")"
         , "{"
         , "  return &SDL_UnbindAudioStreams;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_UnbindAudioStream */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_8afc843a61a3bdb8 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_UnbindAudioStream;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamDevice */"
         , "__attribute__ ((const))"
         , "SDL_AudioDeviceID (*hs_bindgen_218bd50ed6f98e9c (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_CreateAudioStream */"
         , "__attribute__ ((const))"
         , "SDL_AudioStream *(*hs_bindgen_7305536d807d048c (void)) ("
         , "  SDL_AudioSpec const *arg1,"
         , "  SDL_AudioSpec const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateAudioStream;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_73d6922c8243e33c (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamFormat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_eb3398e3b41382ce (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  SDL_AudioSpec *arg2,"
         , "  SDL_AudioSpec *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamFormat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamFormat */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_53ea32f5417e7afe (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  SDL_AudioSpec const *arg2,"
         , "  SDL_AudioSpec const *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetAudioStreamFormat;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamFrequencyRatio */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_b61bdb5d542753f6 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamFrequencyRatio;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamFrequencyRatio */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ce1524607d0065a9 (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_SetAudioStreamFrequencyRatio;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamGain */"
         , "__attribute__ ((const))"
         , "float (*hs_bindgen_a83ce7d2a5163b17 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamGain;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamGain */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_79a25e2eef272c3b (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  float arg2"
         , ")"
         , "{"
         , "  return &SDL_SetAudioStreamGain;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamInputChannelMap */"
         , "__attribute__ ((const))"
         , "signed int *(*hs_bindgen_8335e23836f4112d (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamInputChannelMap;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamOutputChannelMap */"
         , "__attribute__ ((const))"
         , "signed int *(*hs_bindgen_fa8ad3c08cbd6973 (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  signed int *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamOutputChannelMap;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamInputChannelMap */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_779c5c09495318d9 (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  signed int const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_SetAudioStreamInputChannelMap;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamOutputChannelMap */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_aea000b7665d902d (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  signed int const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_SetAudioStreamOutputChannelMap;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PutAudioStreamData */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_958cb85cef653993 (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  void const *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_PutAudioStreamData;"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "#include <SDL3/SDL_version.h>"
         , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
         , "typedef void *SDL_AudioStreamDataCompleteCallback;"
         , "#endif"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PutAudioStreamDataNoCopy */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_29041de46ea3d0a6 (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  void const *arg2,"
         , "  signed int arg3,"
         , "  SDL_AudioStreamDataCompleteCallback arg4,"
         , "  void *arg5"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_PutAudioStreamDataNoCopy;"
         , "#else"
         , "  SDL_SetError(\"SDL_PutAudioStreamDataNoCopy requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "#include <SDL3/SDL_version.h>"
         , "#include <SDL3/SDL_error.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PutAudioStreamPlanarData */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_8d42e0e8a50f7193 (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  void const *const *arg2,"
         , "  signed int arg3,"
         , "  signed int arg4"
         , ")"
         , "{"
         , "#if SDL_VERSION_ATLEAST(3, 4, 0)"
         , "  return &SDL_PutAudioStreamPlanarData;"
         , "#else"
         , "  SDL_SetError(\"SDL_PutAudioStreamPlanarData requires SDL >= 3.4.0\"); return 0;"
         , "#endif"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamData */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_c52b30082bdb58cd (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  void *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamData;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamAvailable */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_887ee267fde7c9f0 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamAvailable;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamQueued */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_30f43c9a9503bb9c (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioStreamQueued;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_FlushAudioStream */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b5a765a41b34efed (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_FlushAudioStream;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ClearAudioStream */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_66aa75f68cad1a60 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_ClearAudioStream;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PauseAudioStreamDevice */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_65bad5f751085af2 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_PauseAudioStreamDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ResumeAudioStreamDevice */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3422451103f73d83 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_ResumeAudioStreamDevice;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_AudioStreamDevicePaused */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3e6ce96a7f944949 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_AudioStreamDevicePaused;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_LockAudioStream */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_0d7bbaa2282f61af (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_LockAudioStream;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_UnlockAudioStream */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_01197b6703408060 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_UnlockAudioStream;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamGetCallback */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c3613cf8e8649c19 (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  SDL_AudioStreamCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetAudioStreamGetCallback;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamPutCallback */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_94194526836dd7bc (void)) ("
         , "  SDL_AudioStream *arg1,"
         , "  SDL_AudioStreamCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetAudioStreamPutCallback;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_DestroyAudioStream */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_8414956b9aa941e0 (void)) ("
         , "  SDL_AudioStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_DestroyAudioStream;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_OpenAudioDeviceStream */"
         , "__attribute__ ((const))"
         , "SDL_AudioStream *(*hs_bindgen_e8ad9974dfab54c1 (void)) ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioSpec const *arg2,"
         , "  SDL_AudioStreamCallback arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return &SDL_OpenAudioDeviceStream;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioPostmixCallback */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fb49ec8721a9eaae (void)) ("
         , "  SDL_AudioDeviceID arg1,"
         , "  SDL_AudioPostmixCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_SetAudioPostmixCallback;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_LoadWAV_IO */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_aeaf62387043ab14 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  _Bool arg2,"
         , "  SDL_AudioSpec *arg3,"
         , "  Uint8 **arg4,"
         , "  Uint32 *arg5"
         , ")"
         , "{"
         , "  return &SDL_LoadWAV_IO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_LoadWAV */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_23688fb6d15b1a20 (void)) ("
         , "  char const *arg1,"
         , "  SDL_AudioSpec *arg2,"
         , "  Uint8 **arg3,"
         , "  Uint32 *arg4"
         , ")"
         , "{"
         , "  return &SDL_LoadWAV;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_MixAudio */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b67274f0c4cb98dd (void)) ("
         , "  Uint8 *arg1,"
         , "  Uint8 const *arg2,"
         , "  SDL_AudioFormat arg3,"
         , "  Uint32 arg4,"
         , "  float arg5"
         , ")"
         , "{"
         , "  return &SDL_MixAudio;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ConvertAudioSamples */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_94a0a8ff1b94e777 (void)) ("
         , "  SDL_AudioSpec const *arg1,"
         , "  Uint8 const *arg2,"
         , "  signed int arg3,"
         , "  SDL_AudioSpec const *arg4,"
         , "  Uint8 **arg5,"
         , "  signed int *arg6"
         , ")"
         , "{"
         , "  return &SDL_ConvertAudioSamples;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioFormatName */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_8a62dc82ce668b2b (void)) ("
         , "  SDL_AudioFormat arg1"
         , ")"
         , "{"
         , "  return &SDL_GetAudioFormatName;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetSilenceValueForFormat */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_733e8e75537d52fb (void)) ("
         , "  SDL_AudioFormat arg1"
         , ")"
         , "{"
         , "  return &SDL_GetSilenceValueForFormat;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetNumAudioDrivers@
foreign import ccall unsafe "hs_bindgen_70df3deb87a6a291"
  hs_bindgen_70df3deb87a6a291_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetNumAudioDrivers@
hs_bindgen_70df3deb87a6a291 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_70df3deb87a6a291 =
  BG.fromFFIType hs_bindgen_70df3deb87a6a291_base

{-# NOINLINE sDL_GetNumAudioDrivers #-}

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
sDL_GetNumAudioDrivers :: BG.FunPtr (IO BG.CInt)
sDL_GetNumAudioDrivers =
  BG.unsafePerformIO hs_bindgen_70df3deb87a6a291

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDriver@
foreign import ccall unsafe "hs_bindgen_96a59296db34206f"
  hs_bindgen_96a59296db34206f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDriver@
hs_bindgen_96a59296db34206f :: IO (BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_96a59296db34206f =
  BG.fromFFIType hs_bindgen_96a59296db34206f_base

{-# NOINLINE sDL_GetAudioDriver #-}

-- | Use this function to get the name of a built in audio driver.
--
--     The list of audio drivers is given in the order that they are normally initialized by default; the drivers that seem more reasonable to choose first (as far as the SDL developers believe) are earlier in the list.
--
--     The names of drivers are all simple, low-ASCII identifiers, like \"alsa\", \"coreaudio\" or \"wasapi\". These never have Unicode characters, and are not meant to be proper names.
--
--     [@index@]: the index of the audio driver; the value ranges from 0 to @SDL_GetNumAudioDrivers()@ - 1.
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
sDL_GetAudioDriver :: BG.FunPtr (BG.CInt -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetAudioDriver =
  BG.unsafePerformIO hs_bindgen_96a59296db34206f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetCurrentAudioDriver@
foreign import ccall unsafe "hs_bindgen_3b5e65309af7eb52"
  hs_bindgen_3b5e65309af7eb52_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetCurrentAudioDriver@
hs_bindgen_3b5e65309af7eb52 :: IO (BG.FunPtr (IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_3b5e65309af7eb52 =
  BG.fromFFIType hs_bindgen_3b5e65309af7eb52_base

{-# NOINLINE sDL_GetCurrentAudioDriver #-}

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
sDL_GetCurrentAudioDriver :: BG.FunPtr (IO (PtrConst.PtrConst BG.CChar))
sDL_GetCurrentAudioDriver =
  BG.unsafePerformIO hs_bindgen_3b5e65309af7eb52

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioPlaybackDevices@
foreign import ccall unsafe "hs_bindgen_0154df1db50254cb"
  hs_bindgen_0154df1db50254cb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioPlaybackDevices@
hs_bindgen_0154df1db50254cb :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_AudioDeviceID)))
hs_bindgen_0154df1db50254cb =
  BG.fromFFIType hs_bindgen_0154df1db50254cb_base

{-# NOINLINE sDL_GetAudioPlaybackDevices #-}

-- | Get a list of currently-connected audio playback devices.
--
--     This returns of list of available devices that play sound, perhaps to speakers or headphones (\"playback\" devices). If you want devices that record audio, like a microphone (\"recording\" devices), use @SDL_GetAudioRecordingDevices()@ instead.
--
--     This only returns a list of physical devices; it will not have any device IDs returned by @SDL_OpenAudioDevice()@.
--
--     If this function returns NULL, to signify an error, @*count@ will be set to zero.
--
--     [@count@]: a pointer filled in with the number of devices returned, may be NULL.
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
sDL_GetAudioPlaybackDevices :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_AudioDeviceID))
sDL_GetAudioPlaybackDevices =
  BG.unsafePerformIO hs_bindgen_0154df1db50254cb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioRecordingDevices@
foreign import ccall unsafe "hs_bindgen_b1e17652d75669ba"
  hs_bindgen_b1e17652d75669ba_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioRecordingDevices@
hs_bindgen_b1e17652d75669ba :: IO (BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_AudioDeviceID)))
hs_bindgen_b1e17652d75669ba =
  BG.fromFFIType hs_bindgen_b1e17652d75669ba_base

{-# NOINLINE sDL_GetAudioRecordingDevices #-}

-- | Get a list of currently-connected audio recording devices.
--
--     This returns of list of available devices that record audio, like a microphone (\"recording\" devices). If you want devices that play sound, perhaps to speakers or headphones (\"playback\" devices), use @SDL_GetAudioPlaybackDevices()@ instead.
--
--     This only returns a list of physical devices; it will not have any device IDs returned by @SDL_OpenAudioDevice()@.
--
--     If this function returns NULL, to signify an error, @*count@ will be set to zero.
--
--     [@count@]: a pointer filled in with the number of devices returned, may be NULL.
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
sDL_GetAudioRecordingDevices :: BG.FunPtr (BG.Ptr BG.CInt -> IO (BG.Ptr SDL_AudioDeviceID))
sDL_GetAudioRecordingDevices =
  BG.unsafePerformIO hs_bindgen_b1e17652d75669ba

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceName@
foreign import ccall unsafe "hs_bindgen_dcc642abb8604857"
  hs_bindgen_dcc642abb8604857_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceName@
hs_bindgen_dcc642abb8604857 :: IO (BG.FunPtr (SDL_AudioDeviceID -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_dcc642abb8604857 =
  BG.fromFFIType hs_bindgen_dcc642abb8604857_base

{-# NOINLINE sDL_GetAudioDeviceName #-}

-- | Get the human-readable name of a specific audio device.
--
--     __WARNING__: this function will work with SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK and SDL_AUDIO_DEVICE_DEFAULT_RECORDING, returning the current default physical devices\' names. However, as the default device may change at any time, it is likely better to show a generic name to the user, like \"System default audio device\" or perhaps \"default [currently %s]\". Do not store this name to disk to reidentify the device in a later run of the program, as the default might change in general, and the string will be the name of a specific device and not the abstract system default.
--
--     [@devid@]: the instance ID of the device to query.
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
sDL_GetAudioDeviceName :: BG.FunPtr (SDL_AudioDeviceID -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetAudioDeviceName =
  BG.unsafePerformIO hs_bindgen_dcc642abb8604857

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceFormat@
foreign import ccall unsafe "hs_bindgen_7ee63106dd01fabe"
  hs_bindgen_7ee63106dd01fabe_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceFormat@
hs_bindgen_7ee63106dd01fabe
  :: IO (BG.FunPtr (SDL_AudioDeviceID -> BG.Ptr SDL_AudioSpec -> BG.Ptr BG.CInt -> IO BG.CBool))
hs_bindgen_7ee63106dd01fabe =
  BG.fromFFIType hs_bindgen_7ee63106dd01fabe_base

{-# NOINLINE sDL_GetAudioDeviceFormat #-}

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
--     [@devid@]: the instance ID of the device to query.
--
--     [@spec@]: on return, will be filled with device details.
--
--     [@sample_frames@]: pointer to store device buffer size, in sample frames. Can be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetAudioDeviceFormat@, defined at @SDL3\/SDL_audio.h 635:34@
sDL_GetAudioDeviceFormat
  :: BG.FunPtr (SDL_AudioDeviceID -> BG.Ptr SDL_AudioSpec -> BG.Ptr BG.CInt -> IO BG.CBool)
sDL_GetAudioDeviceFormat =
  BG.unsafePerformIO hs_bindgen_7ee63106dd01fabe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceChannelMap@
foreign import ccall unsafe "hs_bindgen_d8865ee45cf3f909"
  hs_bindgen_d8865ee45cf3f909_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceChannelMap@
hs_bindgen_d8865ee45cf3f909
  :: IO (BG.FunPtr (SDL_AudioDeviceID -> BG.Ptr BG.CInt -> IO (BG.Ptr BG.CInt)))
hs_bindgen_d8865ee45cf3f909 =
  BG.fromFFIType hs_bindgen_d8865ee45cf3f909_base

{-# NOINLINE sDL_GetAudioDeviceChannelMap #-}

-- | Get the current channel map of an audio device.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](CategoryAudio#channel-layouts).
--
--     Audio devices usually have no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [@devid@]: the instance ID of the device to query.
--
--     [@count@]: On output, set to number of channels in the map. Can be NULL.
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
  :: BG.FunPtr (SDL_AudioDeviceID -> BG.Ptr BG.CInt -> IO (BG.Ptr BG.CInt))
sDL_GetAudioDeviceChannelMap =
  BG.unsafePerformIO hs_bindgen_d8865ee45cf3f909

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_OpenAudioDevice@
foreign import ccall unsafe "hs_bindgen_a61ac8f884503a96"
  hs_bindgen_a61ac8f884503a96_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_OpenAudioDevice@
hs_bindgen_a61ac8f884503a96
  :: IO (BG.FunPtr (SDL_AudioDeviceID -> PtrConst.PtrConst SDL_AudioSpec -> IO SDL_AudioDeviceID))
hs_bindgen_a61ac8f884503a96 =
  BG.fromFFIType hs_bindgen_a61ac8f884503a96_base

{-# NOINLINE sDL_OpenAudioDevice #-}

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
--     [@devid@]: the device instance id to open, or SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or SDL_AUDIO_DEVICE_DEFAULT_RECORDING for the most reasonable default device.
--
--     [@spec@]: the requested device configuration. Can be NULL to use reasonable defaults.
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
  :: BG.FunPtr (SDL_AudioDeviceID -> PtrConst.PtrConst SDL_AudioSpec -> IO SDL_AudioDeviceID)
sDL_OpenAudioDevice =
  BG.unsafePerformIO hs_bindgen_a61ac8f884503a96

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_IsAudioDevicePhysical@
foreign import ccall unsafe "hs_bindgen_6499cfa703c6758f"
  hs_bindgen_6499cfa703c6758f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_IsAudioDevicePhysical@
hs_bindgen_6499cfa703c6758f :: IO (BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool))
hs_bindgen_6499cfa703c6758f =
  BG.fromFFIType hs_bindgen_6499cfa703c6758f_base

{-# NOINLINE sDL_IsAudioDevicePhysical #-}

-- | Determine if an audio device is physical (instead of logical).
--
--     An 'SDL_AudioDeviceID' that represents physical hardware is a physical device; there is one for each piece of hardware that SDL can see. Logical devices are created by calling SDL_OpenAudioDevice or SDL_OpenAudioDeviceStream, and while each is associated with a physical device, there can be any number of logical devices on one physical device.
--
--     For the most part, logical and physical IDs are interchangeable if you try to open a logical device, SDL understands to assign that effort to the underlying physical device, etc. However, it might be useful to know if an arbitrary device ID is physical or logical. This function reports which.
--
--     This function may return either true or false for invalid device IDs.
--
--     [@devid@]: the device ID to query.
--
--     [Returns]: true if devid is a physical device, false if it is logical.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_IsAudioDevicePhysical@, defined at @SDL3\/SDL_audio.h 759:34@
sDL_IsAudioDevicePhysical :: BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool)
sDL_IsAudioDevicePhysical =
  BG.unsafePerformIO hs_bindgen_6499cfa703c6758f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_IsAudioDevicePlayback@
foreign import ccall unsafe "hs_bindgen_a0086d8f92145768"
  hs_bindgen_a0086d8f92145768_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_IsAudioDevicePlayback@
hs_bindgen_a0086d8f92145768 :: IO (BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool))
hs_bindgen_a0086d8f92145768 =
  BG.fromFFIType hs_bindgen_a0086d8f92145768_base

{-# NOINLINE sDL_IsAudioDevicePlayback #-}

-- | Determine if an audio device is a playback device (instead of recording).
--
--     This function may return either true or false for invalid device IDs.
--
--     [@devid@]: the device ID to query.
--
--     [Returns]: true if devid is a playback device, false if it is recording.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_IsAudioDevicePlayback@, defined at @SDL3\/SDL_audio.h 773:34@
sDL_IsAudioDevicePlayback :: BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool)
sDL_IsAudioDevicePlayback =
  BG.unsafePerformIO hs_bindgen_a0086d8f92145768

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PauseAudioDevice@
foreign import ccall unsafe "hs_bindgen_1003717acae7ce8b"
  hs_bindgen_1003717acae7ce8b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PauseAudioDevice@
hs_bindgen_1003717acae7ce8b :: IO (BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool))
hs_bindgen_1003717acae7ce8b =
  BG.fromFFIType hs_bindgen_1003717acae7ce8b_base

{-# NOINLINE sDL_PauseAudioDevice #-}

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
--     [@devid@]: a device opened by @SDL_OpenAudioDevice()@.
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
sDL_PauseAudioDevice :: BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool)
sDL_PauseAudioDevice =
  BG.unsafePerformIO hs_bindgen_1003717acae7ce8b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ResumeAudioDevice@
foreign import ccall unsafe "hs_bindgen_df9a550a09c18c65"
  hs_bindgen_df9a550a09c18c65_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ResumeAudioDevice@
hs_bindgen_df9a550a09c18c65 :: IO (BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool))
hs_bindgen_df9a550a09c18c65 =
  BG.fromFFIType hs_bindgen_df9a550a09c18c65_base

{-# NOINLINE sDL_ResumeAudioDevice #-}

-- | Use this function to unpause audio playback on a specified device.
--
--     This function unpauses audio processing for a given device that has previously been paused with @SDL_PauseAudioDevice()@. Once unpaused, any bound audio streams will begin to progress again, and audio can be generated.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow. Unpausing an unpaused device is a legal no-op.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @SDL_OpenAudioDevice()@ can be.
--
--     [@devid@]: a device opened by @SDL_OpenAudioDevice()@.
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
sDL_ResumeAudioDevice :: BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool)
sDL_ResumeAudioDevice =
  BG.unsafePerformIO hs_bindgen_df9a550a09c18c65

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_AudioDevicePaused@
foreign import ccall unsafe "hs_bindgen_4580e249e63ded2b"
  hs_bindgen_4580e249e63ded2b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_AudioDevicePaused@
hs_bindgen_4580e249e63ded2b :: IO (BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool))
hs_bindgen_4580e249e63ded2b =
  BG.fromFFIType hs_bindgen_4580e249e63ded2b_base

{-# NOINLINE sDL_AudioDevicePaused #-}

-- | Use this function to query if an audio device is paused.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @SDL_OpenAudioDevice()@ can be. Physical and invalid device IDs will report themselves as unpaused here.
--
--     [@devid@]: a device opened by @SDL_OpenAudioDevice()@.
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
sDL_AudioDevicePaused :: BG.FunPtr (SDL_AudioDeviceID -> IO BG.CBool)
sDL_AudioDevicePaused =
  BG.unsafePerformIO hs_bindgen_4580e249e63ded2b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceGain@
foreign import ccall unsafe "hs_bindgen_6f1b270afdab6bb6"
  hs_bindgen_6f1b270afdab6bb6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioDeviceGain@
hs_bindgen_6f1b270afdab6bb6 :: IO (BG.FunPtr (SDL_AudioDeviceID -> IO BG.CFloat))
hs_bindgen_6f1b270afdab6bb6 =
  BG.fromFFIType hs_bindgen_6f1b270afdab6bb6_base

{-# NOINLINE sDL_GetAudioDeviceGain #-}

-- | Get the gain of an audio device.
--
--     The gain of a device is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio devices default to a gain of 1.0f (no change in output).
--
--     Physical devices may not have their gain changed, only logical devices, and this function will always return -1.0f when used on physical devices.
--
--     [@devid@]: the audio device to query.
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
sDL_GetAudioDeviceGain :: BG.FunPtr (SDL_AudioDeviceID -> IO BG.CFloat)
sDL_GetAudioDeviceGain =
  BG.unsafePerformIO hs_bindgen_6f1b270afdab6bb6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioDeviceGain@
foreign import ccall unsafe "hs_bindgen_aa933d15c7bb8ed3"
  hs_bindgen_aa933d15c7bb8ed3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioDeviceGain@
hs_bindgen_aa933d15c7bb8ed3 :: IO (BG.FunPtr (SDL_AudioDeviceID -> BG.CFloat -> IO BG.CBool))
hs_bindgen_aa933d15c7bb8ed3 =
  BG.fromFFIType hs_bindgen_aa933d15c7bb8ed3_base

{-# NOINLINE sDL_SetAudioDeviceGain #-}

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
--     [@devid@]: the audio device on which to change gain.
--
--     [@gain@]: the gain. 1.0f is no change, 0.0f is silence.
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
sDL_SetAudioDeviceGain :: BG.FunPtr (SDL_AudioDeviceID -> BG.CFloat -> IO BG.CBool)
sDL_SetAudioDeviceGain =
  BG.unsafePerformIO hs_bindgen_aa933d15c7bb8ed3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_CloseAudioDevice@
foreign import ccall unsafe "hs_bindgen_b303dd6fccc99188"
  hs_bindgen_b303dd6fccc99188_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_CloseAudioDevice@
hs_bindgen_b303dd6fccc99188 :: IO (BG.FunPtr (SDL_AudioDeviceID -> IO ()))
hs_bindgen_b303dd6fccc99188 =
  BG.fromFFIType hs_bindgen_b303dd6fccc99188_base

{-# NOINLINE sDL_CloseAudioDevice #-}

-- | Close a previously-opened audio device.
--
--     The application should close open audio devices once they are no longer needed.
--
--     This function may block briefly while pending audio data is played by the hardware, so that applications don\'t drop the last buffer of data they supplied if terminating immediately afterwards.
--
--     [@devid@]: an audio device id previously returned by @SDL_OpenAudioDevice()@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenAudioDevice'
--
--     [C declaration]: @SDL_CloseAudioDevice@, defined at @SDL3\/SDL_audio.h 933:34@
sDL_CloseAudioDevice :: BG.FunPtr (SDL_AudioDeviceID -> IO ())
sDL_CloseAudioDevice =
  BG.unsafePerformIO hs_bindgen_b303dd6fccc99188

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_BindAudioStreams@
foreign import ccall unsafe "hs_bindgen_3e9d0d17f11c1de8"
  hs_bindgen_3e9d0d17f11c1de8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_BindAudioStreams@
hs_bindgen_3e9d0d17f11c1de8
  :: IO
       ( BG.FunPtr
           (SDL_AudioDeviceID -> PtrConst.PtrConst (BG.Ptr SDL_AudioStream) -> BG.CInt -> IO BG.CBool)
       )
hs_bindgen_3e9d0d17f11c1de8 =
  BG.fromFFIType hs_bindgen_3e9d0d17f11c1de8_base

{-# NOINLINE sDL_BindAudioStreams #-}

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
--     [@devid@]: an audio device to bind a stream to.
--
--     [@streams@]: an array of audio streams to bind.
--
--     [@num_streams@]: number streams listed in the @streams@ array.
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
  :: BG.FunPtr
       (SDL_AudioDeviceID -> PtrConst.PtrConst (BG.Ptr SDL_AudioStream) -> BG.CInt -> IO BG.CBool)
sDL_BindAudioStreams =
  BG.unsafePerformIO hs_bindgen_3e9d0d17f11c1de8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_BindAudioStream@
foreign import ccall unsafe "hs_bindgen_d6749d59b79ec0ff"
  hs_bindgen_d6749d59b79ec0ff_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_BindAudioStream@
hs_bindgen_d6749d59b79ec0ff
  :: IO (BG.FunPtr (SDL_AudioDeviceID -> BG.Ptr SDL_AudioStream -> IO BG.CBool))
hs_bindgen_d6749d59b79ec0ff =
  BG.fromFFIType hs_bindgen_d6749d59b79ec0ff_base

{-# NOINLINE sDL_BindAudioStream #-}

-- | Bind a single audio stream to an audio device.
--
--     This is a convenience function, equivalent to calling @'sDL_BindAudioStreams' (devid, &stream, 1)@.
--
--     [@devid@]: an audio device to bind a stream to.
--
--     [@stream@]: an audio stream to bind to a device.
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
sDL_BindAudioStream :: BG.FunPtr (SDL_AudioDeviceID -> BG.Ptr SDL_AudioStream -> IO BG.CBool)
sDL_BindAudioStream =
  BG.unsafePerformIO hs_bindgen_d6749d59b79ec0ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_UnbindAudioStreams@
foreign import ccall unsafe "hs_bindgen_d96a4f36c25b0021"
  hs_bindgen_d96a4f36c25b0021_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_UnbindAudioStreams@
hs_bindgen_d96a4f36c25b0021
  :: IO (BG.FunPtr (PtrConst.PtrConst (BG.Ptr SDL_AudioStream) -> BG.CInt -> IO ()))
hs_bindgen_d96a4f36c25b0021 =
  BG.fromFFIType hs_bindgen_d96a4f36c25b0021_base

{-# NOINLINE sDL_UnbindAudioStreams #-}

-- | Unbind a list of audio streams from their audio devices.
--
--     The streams being unbound do not all have to be on the same device. All streams on the same device will be unbound atomically (data will stop flowing through all unbound streams on the same device at the same time).
--
--     Unbinding a stream that isn\'t bound to a device is a legal no-op.
--
--     [@streams@]: an array of audio streams to unbind. Can be NULL or contain NULL.
--
--     [@num_streams@]: number streams listed in the @streams@ array.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindAudioStreams'
--
--     [C declaration]: @SDL_UnbindAudioStreams@, defined at @SDL3\/SDL_audio.h 1015:34@
sDL_UnbindAudioStreams :: BG.FunPtr (PtrConst.PtrConst (BG.Ptr SDL_AudioStream) -> BG.CInt -> IO ())
sDL_UnbindAudioStreams =
  BG.unsafePerformIO hs_bindgen_d96a4f36c25b0021

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_UnbindAudioStream@
foreign import ccall unsafe "hs_bindgen_8afc843a61a3bdb8"
  hs_bindgen_8afc843a61a3bdb8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_UnbindAudioStream@
hs_bindgen_8afc843a61a3bdb8 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO ()))
hs_bindgen_8afc843a61a3bdb8 =
  BG.fromFFIType hs_bindgen_8afc843a61a3bdb8_base

{-# NOINLINE sDL_UnbindAudioStream #-}

-- | Unbind a single audio stream from its audio device.
--
--     This is a convenience function, equivalent to calling @'sDL_UnbindAudioStreams' (&stream, 1)@.
--
--     [@stream@]: an audio stream to unbind from a device. Can be NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_BindAudioStream'
--
--     [C declaration]: @SDL_UnbindAudioStream@, defined at @SDL3\/SDL_audio.h 1031:34@
sDL_UnbindAudioStream :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO ())
sDL_UnbindAudioStream =
  BG.unsafePerformIO hs_bindgen_8afc843a61a3bdb8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamDevice@
foreign import ccall unsafe "hs_bindgen_218bd50ed6f98e9c"
  hs_bindgen_218bd50ed6f98e9c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamDevice@
hs_bindgen_218bd50ed6f98e9c :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO SDL_AudioDeviceID))
hs_bindgen_218bd50ed6f98e9c =
  BG.fromFFIType hs_bindgen_218bd50ed6f98e9c_base

{-# NOINLINE sDL_GetAudioStreamDevice #-}

-- | Query an audio stream for its currently-bound device.
--
--     This reports the logical audio device that an audio stream is currently bound to.
--
--     If not bound, or invalid, this returns zero, which is not a valid device ID.
--
--     [@stream@]: the audio stream to query.
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
sDL_GetAudioStreamDevice :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO SDL_AudioDeviceID)
sDL_GetAudioStreamDevice =
  BG.unsafePerformIO hs_bindgen_218bd50ed6f98e9c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_CreateAudioStream@
foreign import ccall unsafe "hs_bindgen_7305536d807d048c"
  hs_bindgen_7305536d807d048c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_CreateAudioStream@
hs_bindgen_7305536d807d048c
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst SDL_AudioSpec -> PtrConst.PtrConst SDL_AudioSpec -> IO (BG.Ptr SDL_AudioStream))
       )
hs_bindgen_7305536d807d048c =
  BG.fromFFIType hs_bindgen_7305536d807d048c_base

{-# NOINLINE sDL_CreateAudioStream #-}

-- | Create a new audio stream.
--
--     [@src_spec@]: the format details of the input audio.
--
--     [@dst_spec@]: the format details of the output audio.
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
  :: BG.FunPtr
       (PtrConst.PtrConst SDL_AudioSpec -> PtrConst.PtrConst SDL_AudioSpec -> IO (BG.Ptr SDL_AudioStream))
sDL_CreateAudioStream =
  BG.unsafePerformIO hs_bindgen_7305536d807d048c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamProperties@
foreign import ccall unsafe "hs_bindgen_73d6922c8243e33c"
  hs_bindgen_73d6922c8243e33c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamProperties@
hs_bindgen_73d6922c8243e33c
  :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_73d6922c8243e33c =
  BG.fromFFIType hs_bindgen_73d6922c8243e33c_base

{-# NOINLINE sDL_GetAudioStreamProperties #-}

-- | Get the properties associated with an audio stream.
--
--     The application can hang any data it wants here, but the following properties are understood by SDL:
--
--     * @'sDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN'@: if true (the default), the stream be automatically cleaned up when the audio subsystem quits. If set to false, the streams will persist beyond that. This property is ignored for streams created through @SDL_OpenAudioDeviceStream()@, and will always be cleaned up. Streams that are not cleaned up will still be unbound from devices when the audio subsystem quits. This property was added in SDL 3.4.0.
--
--     [@stream@]: the 'SDL_AudioStream' to query.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetAudioStreamProperties@, defined at @SDL3\/SDL_audio.h 1098:46@
sDL_GetAudioStreamProperties
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetAudioStreamProperties =
  BG.unsafePerformIO hs_bindgen_73d6922c8243e33c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamFormat@
foreign import ccall unsafe "hs_bindgen_eb3398e3b41382ce"
  hs_bindgen_eb3398e3b41382ce_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamFormat@
hs_bindgen_eb3398e3b41382ce
  :: IO
       (BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.Ptr SDL_AudioSpec -> BG.Ptr SDL_AudioSpec -> IO BG.CBool))
hs_bindgen_eb3398e3b41382ce =
  BG.fromFFIType hs_bindgen_eb3398e3b41382ce_base

{-# NOINLINE sDL_GetAudioStreamFormat #-}

-- | Query the current format of an audio stream.
--
--     [@stream@]: the 'SDL_AudioStream' to query.
--
--     [@src_spec@]: where to store the input audio format; ignored if NULL.
--
--     [@dst_spec@]: where to store the output audio format; ignored if NULL.
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
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.Ptr SDL_AudioSpec -> BG.Ptr SDL_AudioSpec -> IO BG.CBool)
sDL_GetAudioStreamFormat =
  BG.unsafePerformIO hs_bindgen_eb3398e3b41382ce

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamFormat@
foreign import ccall unsafe "hs_bindgen_53ea32f5417e7afe"
  hs_bindgen_53ea32f5417e7afe_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamFormat@
hs_bindgen_53ea32f5417e7afe
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_AudioStream
             -> PtrConst.PtrConst SDL_AudioSpec
             -> PtrConst.PtrConst SDL_AudioSpec
             -> IO BG.CBool
           )
       )
hs_bindgen_53ea32f5417e7afe =
  BG.fromFFIType hs_bindgen_53ea32f5417e7afe_base

{-# NOINLINE sDL_SetAudioStreamFormat #-}

-- | Change the input and output formats of an audio stream.
--
--     Future calls to and SDL_GetAudioStreamAvailable and SDL_GetAudioStreamData will reflect the new format, and future calls to SDL_PutAudioStreamData must provide data in the new input formats.
--
--     Data that was previously queued in the stream will still be operated on in the format that was current when it was added, which is to say you can put the end of a sound file in one format to a stream, change formats for the next sound file, and start putting that new data while the previous sound file is still queued, and everything will still play back correctly.
--
--     If a stream is bound to a device, then the format of the side of the stream bound to a device cannot be changed (src_spec for recording devices, dst_spec for playback devices). Attempts to make a change to this side will be ignored, but this will not report an error. The other side\'s format can be changed.
--
--     [@stream@]: the stream the format is being changed.
--
--     [@src_spec@]: the new format of the audio input; if NULL, it is not changed.
--
--     [@dst_spec@]: the new format of the audio output; if NULL, it is not changed.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_AudioStream
         -> PtrConst.PtrConst SDL_AudioSpec
         -> PtrConst.PtrConst SDL_AudioSpec
         -> IO BG.CBool
       )
sDL_SetAudioStreamFormat =
  BG.unsafePerformIO hs_bindgen_53ea32f5417e7afe

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamFrequencyRatio@
foreign import ccall unsafe "hs_bindgen_b61bdb5d542753f6"
  hs_bindgen_b61bdb5d542753f6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamFrequencyRatio@
hs_bindgen_b61bdb5d542753f6 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CFloat))
hs_bindgen_b61bdb5d542753f6 =
  BG.fromFFIType hs_bindgen_b61bdb5d542753f6_base

{-# NOINLINE sDL_GetAudioStreamFrequencyRatio #-}

-- | Get the frequency ratio of an audio stream.
--
--     [@stream@]: the 'SDL_AudioStream' to query.
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
sDL_GetAudioStreamFrequencyRatio :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CFloat)
sDL_GetAudioStreamFrequencyRatio =
  BG.unsafePerformIO hs_bindgen_b61bdb5d542753f6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamFrequencyRatio@
foreign import ccall unsafe "hs_bindgen_ce1524607d0065a9"
  hs_bindgen_ce1524607d0065a9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamFrequencyRatio@
hs_bindgen_ce1524607d0065a9 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.CFloat -> IO BG.CBool))
hs_bindgen_ce1524607d0065a9 =
  BG.fromFFIType hs_bindgen_ce1524607d0065a9_base

{-# NOINLINE sDL_SetAudioStreamFrequencyRatio #-}

-- | Change the frequency ratio of an audio stream.
--
--     The frequency ratio is used to adjust the rate at which input data is consumed. Changing this effectively modifies the speed and pitch of the audio. A value greater than 1.0f will play the audio faster, and at a higher pitch. A value less than 1.0f will play the audio slower, and at a lower pitch. 1.0f means play at normal speed.
--
--     This is applied during SDL_GetAudioStreamData, and can be continuously changed to create various effects.
--
--     [@stream@]: the stream on which the frequency ratio is being changed.
--
--     [@ratio@]: the frequency ratio. 1.0 is normal speed. Must be between 0.01 and 100.
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
sDL_SetAudioStreamFrequencyRatio :: BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.CFloat -> IO BG.CBool)
sDL_SetAudioStreamFrequencyRatio =
  BG.unsafePerformIO hs_bindgen_ce1524607d0065a9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamGain@
foreign import ccall unsafe "hs_bindgen_a83ce7d2a5163b17"
  hs_bindgen_a83ce7d2a5163b17_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamGain@
hs_bindgen_a83ce7d2a5163b17 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CFloat))
hs_bindgen_a83ce7d2a5163b17 =
  BG.fromFFIType hs_bindgen_a83ce7d2a5163b17_base

{-# NOINLINE sDL_GetAudioStreamGain #-}

-- | Get the gain of an audio stream.
--
--     The gain of a stream is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio streams default to a gain of 1.0f (no change in output).
--
--     [@stream@]: the 'SDL_AudioStream' to query.
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
sDL_GetAudioStreamGain :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CFloat)
sDL_GetAudioStreamGain =
  BG.unsafePerformIO hs_bindgen_a83ce7d2a5163b17

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamGain@
foreign import ccall unsafe "hs_bindgen_79a25e2eef272c3b"
  hs_bindgen_79a25e2eef272c3b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamGain@
hs_bindgen_79a25e2eef272c3b :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.CFloat -> IO BG.CBool))
hs_bindgen_79a25e2eef272c3b =
  BG.fromFFIType hs_bindgen_79a25e2eef272c3b_base

{-# NOINLINE sDL_SetAudioStreamGain #-}

-- | Change the gain of an audio stream.
--
--     The gain of a stream is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio streams default to a gain of 1.0f (no change in output).
--
--     This is applied during SDL_GetAudioStreamData, and can be continuously changed to create various effects.
--
--     [@stream@]: the stream on which the gain is being changed.
--
--     [@gain@]: the gain. 1.0f is no change, 0.0f is silence.
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
sDL_SetAudioStreamGain :: BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.CFloat -> IO BG.CBool)
sDL_SetAudioStreamGain =
  BG.unsafePerformIO hs_bindgen_79a25e2eef272c3b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamInputChannelMap@
foreign import ccall unsafe "hs_bindgen_8335e23836f4112d"
  hs_bindgen_8335e23836f4112d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamInputChannelMap@
hs_bindgen_8335e23836f4112d
  :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.Ptr BG.CInt -> IO (BG.Ptr BG.CInt)))
hs_bindgen_8335e23836f4112d =
  BG.fromFFIType hs_bindgen_8335e23836f4112d_base

{-# NOINLINE sDL_GetAudioStreamInputChannelMap #-}

-- | Get the current input channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](CategoryAudio#channel-layouts).
--
--     Audio streams default to no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [@stream@]: the 'SDL_AudioStream' to query.
--
--     [@count@]: On output, set to number of channels in the map. Can be NULL.
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
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.Ptr BG.CInt -> IO (BG.Ptr BG.CInt))
sDL_GetAudioStreamInputChannelMap =
  BG.unsafePerformIO hs_bindgen_8335e23836f4112d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamOutputChannelMap@
foreign import ccall unsafe "hs_bindgen_fa8ad3c08cbd6973"
  hs_bindgen_fa8ad3c08cbd6973_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamOutputChannelMap@
hs_bindgen_fa8ad3c08cbd6973
  :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.Ptr BG.CInt -> IO (BG.Ptr BG.CInt)))
hs_bindgen_fa8ad3c08cbd6973 =
  BG.fromFFIType hs_bindgen_fa8ad3c08cbd6973_base

{-# NOINLINE sDL_GetAudioStreamOutputChannelMap #-}

-- | Get the current output channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](CategoryAudio#channel-layouts).
--
--     Audio streams default to no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [@stream@]: the 'SDL_AudioStream' to query.
--
--     [@count@]: On output, set to number of channels in the map. Can be NULL.
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
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.Ptr BG.CInt -> IO (BG.Ptr BG.CInt))
sDL_GetAudioStreamOutputChannelMap =
  BG.unsafePerformIO hs_bindgen_fa8ad3c08cbd6973

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamInputChannelMap@
foreign import ccall unsafe "hs_bindgen_779c5c09495318d9"
  hs_bindgen_779c5c09495318d9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamInputChannelMap@
hs_bindgen_779c5c09495318d9
  :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> PtrConst.PtrConst BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_779c5c09495318d9 =
  BG.fromFFIType hs_bindgen_779c5c09495318d9_base

{-# NOINLINE sDL_SetAudioStreamInputChannelMap #-}

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
--     [@stream@]: the 'SDL_AudioStream' to change.
--
--     [@chmap@]: the new channel map, NULL to reset to default.
--
--     [@count@]: The number of channels in the map.
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
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> PtrConst.PtrConst BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_SetAudioStreamInputChannelMap =
  BG.unsafePerformIO hs_bindgen_779c5c09495318d9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamOutputChannelMap@
foreign import ccall unsafe "hs_bindgen_aea000b7665d902d"
  hs_bindgen_aea000b7665d902d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamOutputChannelMap@
hs_bindgen_aea000b7665d902d
  :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> PtrConst.PtrConst BG.CInt -> BG.CInt -> IO BG.CBool))
hs_bindgen_aea000b7665d902d =
  BG.fromFFIType hs_bindgen_aea000b7665d902d_base

{-# NOINLINE sDL_SetAudioStreamOutputChannelMap #-}

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
--     [@stream@]: the 'SDL_AudioStream' to change.
--
--     [@chmap@]: the new channel map, NULL to reset to default.
--
--     [@count@]: The number of channels in the map.
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
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> PtrConst.PtrConst BG.CInt -> BG.CInt -> IO BG.CBool)
sDL_SetAudioStreamOutputChannelMap =
  BG.unsafePerformIO hs_bindgen_aea000b7665d902d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PutAudioStreamData@
foreign import ccall unsafe "hs_bindgen_958cb85cef653993"
  hs_bindgen_958cb85cef653993_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PutAudioStreamData@
hs_bindgen_958cb85cef653993
  :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool))
hs_bindgen_958cb85cef653993 =
  BG.fromFFIType hs_bindgen_958cb85cef653993_base

{-# NOINLINE sDL_PutAudioStreamData #-}

-- | Add data to the stream.
--
--     This data must match the format\/channels\/samplerate specified in the latest call to SDL_SetAudioStreamFormat, or the format specified when creating the stream if it hasn\'t been changed.
--
--     Note that this call simply copies the unconverted data for later. This is different than SDL2, where data was converted during the Put call and the Get call would just dequeue the previously-converted data.
--
--     [@stream@]: the stream the audio data is being added to.
--
--     [@buf@]: a pointer to the audio data to add.
--
--     [@len@]: the number of bytes to write to the stream.
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
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO BG.CBool)
sDL_PutAudioStreamData =
  BG.unsafePerformIO hs_bindgen_958cb85cef653993

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PutAudioStreamDataNoCopy@
foreign import ccall unsafe "hs_bindgen_29041de46ea3d0a6"
  hs_bindgen_29041de46ea3d0a6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PutAudioStreamDataNoCopy@
hs_bindgen_29041de46ea3d0a6
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_AudioStream
             -> PtrConst.PtrConst BG.Void
             -> BG.CInt
             -> SDL_AudioStreamDataCompleteCallback
             -> BG.Ptr BG.Void
             -> IO BG.CBool
           )
       )
hs_bindgen_29041de46ea3d0a6 =
  BG.fromFFIType hs_bindgen_29041de46ea3d0a6_base

{-# NOINLINE sDL_PutAudioStreamDataNoCopy #-}

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
--     [@stream@]: the stream the audio data is being added to.
--
--     [@buf@]: a pointer to the audio data to add.
--
--     [@len@]: the number of bytes to add to the stream.
--
--     [@callback@]: the callback function to call when the data is no longer needed by the stream. May be NULL.
--
--     [@userdata@]: an opaque pointer provided to the callback for its own personal use.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_AudioStream
         -> PtrConst.PtrConst BG.Void
         -> BG.CInt
         -> SDL_AudioStreamDataCompleteCallback
         -> BG.Ptr BG.Void
         -> IO BG.CBool
       )
sDL_PutAudioStreamDataNoCopy =
  BG.unsafePerformIO hs_bindgen_29041de46ea3d0a6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PutAudioStreamPlanarData@
foreign import ccall unsafe "hs_bindgen_8d42e0e8a50f7193"
  hs_bindgen_8d42e0e8a50f7193_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PutAudioStreamPlanarData@
hs_bindgen_8d42e0e8a50f7193
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_AudioStream
             -> PtrConst.PtrConst (PtrConst.PtrConst BG.Void)
             -> BG.CInt
             -> BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_8d42e0e8a50f7193 =
  BG.fromFFIType hs_bindgen_8d42e0e8a50f7193_base

{-# NOINLINE sDL_PutAudioStreamPlanarData #-}

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
--     [@stream@]: the stream the audio data is being added to.
--
--     [@channel_buffers@]: a pointer to an array of arrays, one array per channel.
--
--     [@num_channels@]: the number of arrays in @channel_buffers@ or -1.
--
--     [@num_samples@]: the number of /samples/ per array to write to the stream.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_AudioStream
         -> PtrConst.PtrConst (PtrConst.PtrConst BG.Void)
         -> BG.CInt
         -> BG.CInt
         -> IO BG.CBool
       )
sDL_PutAudioStreamPlanarData =
  BG.unsafePerformIO hs_bindgen_8d42e0e8a50f7193

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamData@
foreign import ccall unsafe "hs_bindgen_c52b30082bdb58cd"
  hs_bindgen_c52b30082bdb58cd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamData@
hs_bindgen_c52b30082bdb58cd
  :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.Ptr BG.Void -> BG.CInt -> IO BG.CInt))
hs_bindgen_c52b30082bdb58cd =
  BG.fromFFIType hs_bindgen_c52b30082bdb58cd_base

{-# NOINLINE sDL_GetAudioStreamData #-}

-- | Get converted\/resampled data from the stream.
--
--     The input\/output data format\/channels\/samplerate is specified when creating the stream, and can be changed after creation by calling SDL_SetAudioStreamFormat.
--
--     Note that any conversion and resampling necessary is done during this call, and SDL_PutAudioStreamData simply queues unconverted data for later. This is different than SDL2, where that work was done while inputting new data to the stream and requesting the output just copied the converted data.
--
--     [@stream@]: the stream the audio is being requested from.
--
--     [@buf@]: a buffer to fill with audio data.
--
--     [@len@]: the maximum number of bytes to fill.
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
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> BG.Ptr BG.Void -> BG.CInt -> IO BG.CInt)
sDL_GetAudioStreamData =
  BG.unsafePerformIO hs_bindgen_c52b30082bdb58cd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamAvailable@
foreign import ccall unsafe "hs_bindgen_887ee267fde7c9f0"
  hs_bindgen_887ee267fde7c9f0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamAvailable@
hs_bindgen_887ee267fde7c9f0 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CInt))
hs_bindgen_887ee267fde7c9f0 =
  BG.fromFFIType hs_bindgen_887ee267fde7c9f0_base

{-# NOINLINE sDL_GetAudioStreamAvailable #-}

-- | Get the number of converted\/resampled bytes available.
--
--     The stream may be buffering data behind the scenes until it has enough to resample correctly, so this number might be lower than what you expect, or even be zero. Add more data or flush the stream if you need the data now.
--
--     If the stream has so much data that it would overflow an int, the return value is clamped to a maximum value, but no queued data is lost; if there are gigabytes of data queued, the app might need to read some of it with SDL_GetAudioStreamData before this function\'s return value is no longer clamped.
--
--     [@stream@]: the audio stream to query.
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
sDL_GetAudioStreamAvailable :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CInt)
sDL_GetAudioStreamAvailable =
  BG.unsafePerformIO hs_bindgen_887ee267fde7c9f0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamQueued@
foreign import ccall unsafe "hs_bindgen_30f43c9a9503bb9c"
  hs_bindgen_30f43c9a9503bb9c_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioStreamQueued@
hs_bindgen_30f43c9a9503bb9c :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CInt))
hs_bindgen_30f43c9a9503bb9c =
  BG.fromFFIType hs_bindgen_30f43c9a9503bb9c_base

{-# NOINLINE sDL_GetAudioStreamQueued #-}

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
--     [@stream@]: the audio stream to query.
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
sDL_GetAudioStreamQueued :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CInt)
sDL_GetAudioStreamQueued =
  BG.unsafePerformIO hs_bindgen_30f43c9a9503bb9c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_FlushAudioStream@
foreign import ccall unsafe "hs_bindgen_b5a765a41b34efed"
  hs_bindgen_b5a765a41b34efed_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_FlushAudioStream@
hs_bindgen_b5a765a41b34efed :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool))
hs_bindgen_b5a765a41b34efed =
  BG.fromFFIType hs_bindgen_b5a765a41b34efed_base

{-# NOINLINE sDL_FlushAudioStream #-}

-- | Tell the stream that you\'re done sending data, and anything being buffered should be converted\/resampled and made available immediately.
--
--     It is legal to add more data to a stream after flushing, but there may be audio gaps in the output. Generally this is intended to signal the end of input, so the complete output becomes available.
--
--     [@stream@]: the audio stream to flush.
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
sDL_FlushAudioStream :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool)
sDL_FlushAudioStream =
  BG.unsafePerformIO hs_bindgen_b5a765a41b34efed

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ClearAudioStream@
foreign import ccall unsafe "hs_bindgen_66aa75f68cad1a60"
  hs_bindgen_66aa75f68cad1a60_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ClearAudioStream@
hs_bindgen_66aa75f68cad1a60 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool))
hs_bindgen_66aa75f68cad1a60 =
  BG.fromFFIType hs_bindgen_66aa75f68cad1a60_base

{-# NOINLINE sDL_ClearAudioStream #-}

-- | Clear any pending data in the stream.
--
--     This drops any queued data, so there will be nothing to read from the stream until more is added.
--
--     [@stream@]: the audio stream to clear.
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
sDL_ClearAudioStream :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool)
sDL_ClearAudioStream =
  BG.unsafePerformIO hs_bindgen_66aa75f68cad1a60

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PauseAudioStreamDevice@
foreign import ccall unsafe "hs_bindgen_65bad5f751085af2"
  hs_bindgen_65bad5f751085af2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_PauseAudioStreamDevice@
hs_bindgen_65bad5f751085af2 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool))
hs_bindgen_65bad5f751085af2 =
  BG.fromFFIType hs_bindgen_65bad5f751085af2_base

{-# NOINLINE sDL_PauseAudioStreamDevice #-}

-- | Use this function to pause audio playback on the audio device associated with an audio stream.
--
--     This function pauses audio processing for a given device. Any bound audio streams will not progress, and no audio will be generated. Pausing one device does not prevent other unpaused devices from running.
--
--     Pausing a device can be useful to halt all audio without unbinding all the audio streams. This might be useful while a game is paused, or a level is loading, etc.
--
--     [@stream@]: the audio stream associated with the audio device to pause.
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
sDL_PauseAudioStreamDevice :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool)
sDL_PauseAudioStreamDevice =
  BG.unsafePerformIO hs_bindgen_65bad5f751085af2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ResumeAudioStreamDevice@
foreign import ccall unsafe "hs_bindgen_3422451103f73d83"
  hs_bindgen_3422451103f73d83_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ResumeAudioStreamDevice@
hs_bindgen_3422451103f73d83 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool))
hs_bindgen_3422451103f73d83 =
  BG.fromFFIType hs_bindgen_3422451103f73d83_base

{-# NOINLINE sDL_ResumeAudioStreamDevice #-}

-- | Use this function to unpause audio playback on the audio device associated with an audio stream.
--
--     This function unpauses audio processing for a given device that has previously been paused. Once unpaused, any bound audio streams will begin to progress again, and audio can be generated.
--
--     SDL_OpenAudioDeviceStream opens audio devices in a paused state, so this function call is required for audio playback to begin on such devices.
--
--     [@stream@]: the audio stream associated with the audio device to resume.
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
sDL_ResumeAudioStreamDevice :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool)
sDL_ResumeAudioStreamDevice =
  BG.unsafePerformIO hs_bindgen_3422451103f73d83

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_AudioStreamDevicePaused@
foreign import ccall unsafe "hs_bindgen_3e6ce96a7f944949"
  hs_bindgen_3e6ce96a7f944949_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_AudioStreamDevicePaused@
hs_bindgen_3e6ce96a7f944949 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool))
hs_bindgen_3e6ce96a7f944949 =
  BG.fromFFIType hs_bindgen_3e6ce96a7f944949_base

{-# NOINLINE sDL_AudioStreamDevicePaused #-}

-- | Use this function to query if an audio device associated with a stream is paused.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow.
--
--     [@stream@]: the audio stream associated with the audio device to query.
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
sDL_AudioStreamDevicePaused :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool)
sDL_AudioStreamDevicePaused =
  BG.unsafePerformIO hs_bindgen_3e6ce96a7f944949

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_LockAudioStream@
foreign import ccall unsafe "hs_bindgen_0d7bbaa2282f61af"
  hs_bindgen_0d7bbaa2282f61af_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_LockAudioStream@
hs_bindgen_0d7bbaa2282f61af :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool))
hs_bindgen_0d7bbaa2282f61af =
  BG.fromFFIType hs_bindgen_0d7bbaa2282f61af_base

{-# NOINLINE sDL_LockAudioStream #-}

-- | Lock an audio stream for serialized access.
--
--     Each 'SDL_AudioStream' has an internal mutex it uses to protect its data structures from threading conflicts. This function allows an app to lock that mutex, which could be useful if registering callbacks on this stream.
--
--     One does not need to lock a stream to use in it most cases, as the stream manages this lock internally. However, this lock is held during callbacks, which may run from arbitrary threads at any time, so if an app needs to protect shared data during those callbacks, locking the stream guarantees that the callback is not running while the lock is held.
--
--     As this is just a wrapper over SDL_LockMutex for an internal lock; it has all the same attributes (recursive locks are allowed, etc).
--
--     [@stream@]: the audio stream to lock.
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
sDL_LockAudioStream :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool)
sDL_LockAudioStream =
  BG.unsafePerformIO hs_bindgen_0d7bbaa2282f61af

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_UnlockAudioStream@
foreign import ccall unsafe "hs_bindgen_01197b6703408060"
  hs_bindgen_01197b6703408060_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_UnlockAudioStream@
hs_bindgen_01197b6703408060 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool))
hs_bindgen_01197b6703408060 =
  BG.fromFFIType hs_bindgen_01197b6703408060_base

{-# NOINLINE sDL_UnlockAudioStream #-}

-- | Unlock an audio stream for serialized access.
--
--     This unlocks an audio stream after a call to SDL_LockAudioStream.
--
--     [@stream@]: the audio stream to unlock.
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
sDL_UnlockAudioStream :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO BG.CBool)
sDL_UnlockAudioStream =
  BG.unsafePerformIO hs_bindgen_01197b6703408060

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamGetCallback@
foreign import ccall unsafe "hs_bindgen_c3613cf8e8649c19"
  hs_bindgen_c3613cf8e8649c19_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamGetCallback@
hs_bindgen_c3613cf8e8649c19
  :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> SDL_AudioStreamCallback -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_c3613cf8e8649c19 =
  BG.fromFFIType hs_bindgen_c3613cf8e8649c19_base

{-# NOINLINE sDL_SetAudioStreamGetCallback #-}

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
--     [@stream@]: the audio stream to set the new callback on.
--
--     [@callback@]: the new callback function to call when data is requested from the stream.
--
--     [@userdata@]: an opaque pointer provided to the callback for its own personal use.
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
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> SDL_AudioStreamCallback -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_SetAudioStreamGetCallback =
  BG.unsafePerformIO hs_bindgen_c3613cf8e8649c19

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamPutCallback@
foreign import ccall unsafe "hs_bindgen_94194526836dd7bc"
  hs_bindgen_94194526836dd7bc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioStreamPutCallback@
hs_bindgen_94194526836dd7bc
  :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> SDL_AudioStreamCallback -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_94194526836dd7bc =
  BG.fromFFIType hs_bindgen_94194526836dd7bc_base

{-# NOINLINE sDL_SetAudioStreamPutCallback #-}

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
--     [@stream@]: the audio stream to set the new callback on.
--
--     [@callback@]: the new callback function to call when data is added to the stream.
--
--     [@userdata@]: an opaque pointer provided to the callback for its own personal use.
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
  :: BG.FunPtr (BG.Ptr SDL_AudioStream -> SDL_AudioStreamCallback -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_SetAudioStreamPutCallback =
  BG.unsafePerformIO hs_bindgen_94194526836dd7bc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_DestroyAudioStream@
foreign import ccall unsafe "hs_bindgen_8414956b9aa941e0"
  hs_bindgen_8414956b9aa941e0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_DestroyAudioStream@
hs_bindgen_8414956b9aa941e0 :: IO (BG.FunPtr (BG.Ptr SDL_AudioStream -> IO ()))
hs_bindgen_8414956b9aa941e0 =
  BG.fromFFIType hs_bindgen_8414956b9aa941e0_base

{-# NOINLINE sDL_DestroyAudioStream #-}

-- | Free an audio stream.
--
--     This will release all allocated data, including any audio that is still queued. You do not need to manually clear the stream first.
--
--     If this stream was bound to an audio device, it is unbound during this call. If this stream was created with SDL_OpenAudioDeviceStream, the audio device that was opened alongside this stream\'s creation will be closed, too.
--
--     [@stream@]: the audio stream to destroy.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateAudioStream'
--
--     [C declaration]: @SDL_DestroyAudioStream@, defined at @SDL3\/SDL_audio.h 1982:34@
sDL_DestroyAudioStream :: BG.FunPtr (BG.Ptr SDL_AudioStream -> IO ())
sDL_DestroyAudioStream =
  BG.unsafePerformIO hs_bindgen_8414956b9aa941e0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_OpenAudioDeviceStream@
foreign import ccall unsafe "hs_bindgen_e8ad9974dfab54c1"
  hs_bindgen_e8ad9974dfab54c1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_OpenAudioDeviceStream@
hs_bindgen_e8ad9974dfab54c1
  :: IO
       ( BG.FunPtr
           ( SDL_AudioDeviceID
             -> PtrConst.PtrConst SDL_AudioSpec
             -> SDL_AudioStreamCallback
             -> BG.Ptr BG.Void
             -> IO (BG.Ptr SDL_AudioStream)
           )
       )
hs_bindgen_e8ad9974dfab54c1 =
  BG.fromFFIType hs_bindgen_e8ad9974dfab54c1_base

{-# NOINLINE sDL_OpenAudioDeviceStream #-}

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
--     [@devid@]: an audio device to open, or SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or SDL_AUDIO_DEVICE_DEFAULT_RECORDING.
--
--     [@spec@]: the audio stream\'s data format. Can be NULL.
--
--     [@callback@]: a callback where the app will provide new data for playback, or receive new data for recording. Can be NULL, in which case the app will need to call SDL_PutAudioStreamData or SDL_GetAudioStreamData as necessary.
--
--     [@userdata@]: app-controlled pointer passed to callback. Can be NULL. Ignored if callback is NULL.
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
  :: BG.FunPtr
       ( SDL_AudioDeviceID
         -> PtrConst.PtrConst SDL_AudioSpec
         -> SDL_AudioStreamCallback
         -> BG.Ptr BG.Void
         -> IO (BG.Ptr SDL_AudioStream)
       )
sDL_OpenAudioDeviceStream =
  BG.unsafePerformIO hs_bindgen_e8ad9974dfab54c1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioPostmixCallback@
foreign import ccall unsafe "hs_bindgen_fb49ec8721a9eaae"
  hs_bindgen_fb49ec8721a9eaae_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_SetAudioPostmixCallback@
hs_bindgen_fb49ec8721a9eaae
  :: IO (BG.FunPtr (SDL_AudioDeviceID -> SDL_AudioPostmixCallback -> BG.Ptr BG.Void -> IO BG.CBool))
hs_bindgen_fb49ec8721a9eaae =
  BG.fromFFIType hs_bindgen_fb49ec8721a9eaae_base

{-# NOINLINE sDL_SetAudioPostmixCallback #-}

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
--     [@devid@]: the ID of an opened audio device.
--
--     [@callback@]: a callback function to be called. Can be NULL.
--
--     [@userdata@]: app-controlled pointer passed to callback. Can be NULL.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_SetAudioPostmixCallback@, defined at @SDL3\/SDL_audio.h 2136:34@
sDL_SetAudioPostmixCallback
  :: BG.FunPtr (SDL_AudioDeviceID -> SDL_AudioPostmixCallback -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_SetAudioPostmixCallback =
  BG.unsafePerformIO hs_bindgen_fb49ec8721a9eaae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_LoadWAV_IO@
foreign import ccall unsafe "hs_bindgen_aeaf62387043ab14"
  hs_bindgen_aeaf62387043ab14_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_LoadWAV_IO@
hs_bindgen_aeaf62387043ab14
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
             -> BG.CBool
             -> BG.Ptr SDL_AudioSpec
             -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_aeaf62387043ab14 =
  BG.fromFFIType hs_bindgen_aeaf62387043ab14_base

{-# NOINLINE sDL_LoadWAV_IO #-}

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
--     [@src@]: the data source for the WAVE data.
--
--     [@closeio@]: if true, calls SDL_CloseIO() on @src@ before returning, even in the case of an error.
--
--     [@spec@]: a pointer to an 'SDL_AudioSpec' that will be set to the WAVE data\'s format details on successful return.
--
--     [@audio_buf@]: a pointer filled with the audio data, allocated by the function.
--
--     [@audio_len@]: a pointer filled with the length of the audio data buffer in bytes.
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
  :: BG.FunPtr
       ( BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
         -> BG.CBool
         -> BG.Ptr SDL_AudioSpec
         -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_LoadWAV_IO =
  BG.unsafePerformIO hs_bindgen_aeaf62387043ab14

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_LoadWAV@
foreign import ccall unsafe "hs_bindgen_23688fb6d15b1a20"
  hs_bindgen_23688fb6d15b1a20_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_LoadWAV@
hs_bindgen_23688fb6d15b1a20
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> BG.Ptr SDL_AudioSpec
             -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
             -> IO BG.CBool
           )
       )
hs_bindgen_23688fb6d15b1a20 =
  BG.fromFFIType hs_bindgen_23688fb6d15b1a20_base

{-# NOINLINE sDL_LoadWAV #-}

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
--     [@path@]: the file path of the WAV file to open.
--
--     [@spec@]: a pointer to an 'SDL_AudioSpec' that will be set to the WAVE data\'s format details on successful return.
--
--     [@audio_buf@]: a pointer filled with the audio data, allocated by the function.
--
--     [@audio_len@]: a pointer filled with the length of the audio data buffer in bytes.
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
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> BG.Ptr SDL_AudioSpec
         -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
         -> IO BG.CBool
       )
sDL_LoadWAV =
  BG.unsafePerformIO hs_bindgen_23688fb6d15b1a20

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_MixAudio@
foreign import ccall unsafe "hs_bindgen_b67274f0c4cb98dd"
  hs_bindgen_b67274f0c4cb98dd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_MixAudio@
hs_bindgen_b67274f0c4cb98dd
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
             -> SDL_AudioFormat
             -> SDL3.Sys.Bindgen.Stdinc.Uint32
             -> BG.CFloat
             -> IO BG.CBool
           )
       )
hs_bindgen_b67274f0c4cb98dd =
  BG.fromFFIType hs_bindgen_b67274f0c4cb98dd_base

{-# NOINLINE sDL_MixAudio #-}

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
--     [@dst@]: the destination for the mixed audio.
--
--     [@src@]: the source audio buffer to be mixed.
--
--     [@format@]: the 'SDL_AudioFormat' structure representing the desired audio format.
--
--     [@len@]: the length of the audio buffer in bytes.
--
--     [@volume@]: ranges from 0.0 - 1.0, and should be set to 1.0 for full audio volume.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_MixAudio@, defined at @SDL3\/SDL_audio.h 2289:34@
sDL_MixAudio
  :: BG.FunPtr
       ( BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
         -> SDL_AudioFormat
         -> SDL3.Sys.Bindgen.Stdinc.Uint32
         -> BG.CFloat
         -> IO BG.CBool
       )
sDL_MixAudio =
  BG.unsafePerformIO hs_bindgen_b67274f0c4cb98dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ConvertAudioSamples@
foreign import ccall unsafe "hs_bindgen_94a0a8ff1b94e777"
  hs_bindgen_94a0a8ff1b94e777_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_ConvertAudioSamples@
hs_bindgen_94a0a8ff1b94e777
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst SDL_AudioSpec
             -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
             -> BG.CInt
             -> PtrConst.PtrConst SDL_AudioSpec
             -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
             -> BG.Ptr BG.CInt
             -> IO BG.CBool
           )
       )
hs_bindgen_94a0a8ff1b94e777 =
  BG.fromFFIType hs_bindgen_94a0a8ff1b94e777_base

{-# NOINLINE sDL_ConvertAudioSamples #-}

-- | Convert some audio data of one format to another format.
--
--     Please note that this function is for convenience, but should not be used to resample audio in blocks, as it will introduce audio artifacts on the boundaries. You should only use this function if you are converting audio data in its entirety in one call. If you want to convert audio in smaller chunks, use an 'SDL_AudioStream', which is designed for this situation.
--
--     Internally, this function creates and destroys an 'SDL_AudioStream' on each use, so it\'s also less efficient than using one directly, if you need to convert multiple times.
--
--     [@src_spec@]: the format details of the input audio.
--
--     [@src_data@]: the audio data to be converted.
--
--     [@src_len@]: the len of src_data.
--
--     [@dst_spec@]: the format details of the output audio.
--
--     [@dst_data@]: will be filled with a pointer to converted audio data, which should be freed with SDL_free(). On error, it will be NULL.
--
--     [@dst_len@]: will be filled with the len of dst_data.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ConvertAudioSamples@, defined at @SDL3\/SDL_audio.h 2319:34@
sDL_ConvertAudioSamples
  :: BG.FunPtr
       ( PtrConst.PtrConst SDL_AudioSpec
         -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
         -> BG.CInt
         -> PtrConst.PtrConst SDL_AudioSpec
         -> BG.Ptr (BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8)
         -> BG.Ptr BG.CInt
         -> IO BG.CBool
       )
sDL_ConvertAudioSamples =
  BG.unsafePerformIO hs_bindgen_94a0a8ff1b94e777

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioFormatName@
foreign import ccall unsafe "hs_bindgen_8a62dc82ce668b2b"
  hs_bindgen_8a62dc82ce668b2b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetAudioFormatName@
hs_bindgen_8a62dc82ce668b2b :: IO (BG.FunPtr (SDL_AudioFormat -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_8a62dc82ce668b2b =
  BG.fromFFIType hs_bindgen_8a62dc82ce668b2b_base

{-# NOINLINE sDL_GetAudioFormatName #-}

-- | Get the human readable name of an audio format.
--
--     [@format@]: the audio format to query.
--
--     [Returns]: the human readable name of the specified audio format or \"SDL_AUDIO_UNKNOWN\" if the format isn\'t recognized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetAudioFormatName@, defined at @SDL3\/SDL_audio.h 2332:42@
sDL_GetAudioFormatName :: BG.FunPtr (SDL_AudioFormat -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetAudioFormatName =
  BG.unsafePerformIO hs_bindgen_8a62dc82ce668b2b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetSilenceValueForFormat@
foreign import ccall unsafe "hs_bindgen_733e8e75537d52fb"
  hs_bindgen_733e8e75537d52fb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Audio_get_SDL_GetSilenceValueForFormat@
hs_bindgen_733e8e75537d52fb :: IO (BG.FunPtr (SDL_AudioFormat -> IO BG.CInt))
hs_bindgen_733e8e75537d52fb =
  BG.fromFFIType hs_bindgen_733e8e75537d52fb_base

{-# NOINLINE sDL_GetSilenceValueForFormat #-}

-- | Get the appropriate memset value for silencing an audio format.
--
--     The value returned by this function can be used as the second argument to memset (or SDL_memset) to set an audio buffer in a specific format to silence.
--
--     [@format@]: the audio data format to query.
--
--     [Returns]: a byte value that can be passed to memset.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetSilenceValueForFormat@, defined at @SDL3\/SDL_audio.h 2348:33@
sDL_GetSilenceValueForFormat :: BG.FunPtr (SDL_AudioFormat -> IO BG.CInt)
sDL_GetSilenceValueForFormat =
  BG.unsafePerformIO hs_bindgen_733e8e75537d52fb
