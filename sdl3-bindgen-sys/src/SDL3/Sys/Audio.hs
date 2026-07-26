-- | Audio functionality for the SDL library.
--
--     All audio in SDL3 revolves around 'SDL_AudioStream'. Whether you want to play or record audio, convert it, stream it, buffer it, or mix it, you\'re going to be passing it through an audio stream.
--
--     Audio streams are quite flexible; they can accept any amount of data at a time, in any supported format, and output it as needed in any other format, even if the data format changes on either side halfway through.
--
--     An app opens an audio device and binds any number of audio streams to it, feeding more data to the streams as available. When the device needs more data, it will pull it from all bound streams and mix them together for playback.
--
--     Audio streams can also use an app-provided callback to supply data on-demand, which maps pretty closely to the SDL2 audio model.
--
--     SDL also provides a simple .WAV loader in 'loadWAV' (and 'loadWAVIO' if you aren\'t reading from a file) as a basic means to load sound data into your program.
--
--     Logical audio devices
--
--     In SDL3, opening a physical device (like a SoundBlaster 16 Pro) gives you a logical device ID that you can bind audio streams to. In almost all cases, logical devices can be used anywhere in the API that a physical device is normally used. However, since each device opening generates a new logical device, different parts of the program (say, a VoIP library, or text-to-speech framework, or maybe some other sort of mixer on top of SDL) can have their own device opens that do not interfere with each other; each logical device will mix its separate audio down to a single buffer, fed to the physical device, behind the scenes. As many logical devices as you like can come and go; SDL will only have to open the physical device at the OS level once, and will manage all the logical devices on top of it internally.
--
--     One other benefit of logical devices: if you don\'t open a specific physical device, instead opting for the default, SDL can automatically migrate those logical devices to different hardware as circumstances change: a user plugged in headphones? The system default changed? SDL can transparently migrate the logical devices to the correct physical device seamlessly and keep playing; the app doesn\'t even have to know it happened if it doesn\'t want to.
--
--     Simplified audio
--
--     As a simplified model for when a single source of audio is all that\'s needed, an app can use 'openAudioDeviceStream', which is a single function to open an audio device, create an audio stream, bind that stream to the newly-opened device, and (optionally) provide a callback for obtaining audio data. When using this function, the primary interface is the 'SDL_AudioStream' and the device handle is mostly hidden away; destroying a stream created through this function will also close the device, stream bindings cannot be changed, etc. One other quirk of this is that the device is started in a /paused/ state and must be explicitly resumed; this is partially to offer a clean migration for SDL2 apps and partially because the app might have to do more setup before playback begins; in the non-simplified form, nothing will play until a stream is bound to a device, so they start /unpaused/.
--
--     Channel layouts
--
--     Audio data passing through SDL is uncompressed PCM data, interleaved. One can provide their own decompression through an MP3, etc, decoder, but SDL does not provide this directly. Each interleaved channel of data is meant to be in a specific order.
--
--     Abbreviations:
--
--     * FRONT = single mono speaker
--
--     * FL = front left speaker
--
--     * FR = front right speaker
--
--     * FC = front center speaker
--
--     * BL = back left speaker
--
--     * BR = back right speaker
--
--     * SR = surround right speaker
--
--     * SL = surround left speaker
--
--     * BC = back center speaker
--
--     * LFE = low-frequency speaker
--
--     These are listed in the order they are laid out in memory, so \"FL, FR\" means \"the front left speaker is laid out in memory first, then the front right, then it repeats for the next audio frame\".
--
--     * 1 channel (mono) layout: FRONT
--
--     * 2 channels (stereo) layout: FL, FR
--
--     * 3 channels (2.1) layout: FL, FR, LFE
--
--     * 4 channels (quad) layout: FL, FR, BL, BR
--
--     * 5 channels (4.1) layout: FL, FR, LFE, BL, BR
--
--     * 6 channels (5.1) layout: FL, FR, FC, LFE, BL, BR (last two can also be SL, SR)
--
--     * 7 channels (6.1) layout: FL, FR, FC, LFE, BC, SL, SR
--
--     * 8 channels (7.1) layout: FL, FR, FC, LFE, BL, BR, SL, SR
--
--     This is the same order as DirectSound expects, but applied to all platforms; SDL will swizzle the channels as necessary if a platform expects something different.
--
--     'SDL_AudioStream' can also be provided channel maps to change this ordering to whatever is necessary, in other audio processing scenarios. Mask of bits in an 'SDL_AudioFormat' that contains the format bit size.
--
--     Generally one should use SDL_AUDIO_BITSIZE instead of this macro directly.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Audio.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Audio (
  module SDL3.Sys.Bindgen.Audio,

  -- * Function aliases
  SDL3.Sys.Audio.getNumAudioDrivers,
  SDL3.Sys.Audio.getNumAudioDriversSafe,
  SDL3.Sys.Audio.getAudioDriver,
  SDL3.Sys.Audio.getAudioDriverSafe,
  SDL3.Sys.Audio.getCurrentAudioDriver,
  SDL3.Sys.Audio.getCurrentAudioDriverSafe,
  SDL3.Sys.Audio.getAudioPlaybackDevices,
  SDL3.Sys.Audio.getAudioPlaybackDevicesSafe,
  SDL3.Sys.Audio.getAudioRecordingDevices,
  SDL3.Sys.Audio.getAudioRecordingDevicesSafe,
  SDL3.Sys.Audio.getAudioDeviceName,
  SDL3.Sys.Audio.getAudioDeviceNameSafe,
  SDL3.Sys.Audio.getAudioDeviceFormat,
  SDL3.Sys.Audio.getAudioDeviceFormatSafe,
  SDL3.Sys.Audio.getAudioDeviceChannelMap,
  SDL3.Sys.Audio.getAudioDeviceChannelMapSafe,
  SDL3.Sys.Audio.openAudioDevice,
  SDL3.Sys.Audio.openAudioDeviceSafe,
  SDL3.Sys.Audio.isAudioDevicePhysical,
  SDL3.Sys.Audio.isAudioDevicePhysicalSafe,
  SDL3.Sys.Audio.isAudioDevicePlayback,
  SDL3.Sys.Audio.isAudioDevicePlaybackSafe,
  SDL3.Sys.Audio.pauseAudioDevice,
  SDL3.Sys.Audio.pauseAudioDeviceSafe,
  SDL3.Sys.Audio.resumeAudioDevice,
  SDL3.Sys.Audio.resumeAudioDeviceSafe,
  SDL3.Sys.Audio.audioDevicePaused,
  SDL3.Sys.Audio.audioDevicePausedSafe,
  SDL3.Sys.Audio.getAudioDeviceGain,
  SDL3.Sys.Audio.getAudioDeviceGainSafe,
  SDL3.Sys.Audio.setAudioDeviceGain,
  SDL3.Sys.Audio.setAudioDeviceGainSafe,
  SDL3.Sys.Audio.closeAudioDevice,
  SDL3.Sys.Audio.closeAudioDeviceSafe,
  SDL3.Sys.Audio.bindAudioStreams,
  SDL3.Sys.Audio.bindAudioStreamsSafe,
  SDL3.Sys.Audio.bindAudioStream,
  SDL3.Sys.Audio.bindAudioStreamSafe,
  SDL3.Sys.Audio.unbindAudioStreams,
  SDL3.Sys.Audio.unbindAudioStreamsSafe,
  SDL3.Sys.Audio.unbindAudioStream,
  SDL3.Sys.Audio.unbindAudioStreamSafe,
  SDL3.Sys.Audio.getAudioStreamDevice,
  SDL3.Sys.Audio.getAudioStreamDeviceSafe,
  SDL3.Sys.Audio.createAudioStream,
  SDL3.Sys.Audio.createAudioStreamSafe,
  SDL3.Sys.Audio.getAudioStreamProperties,
  SDL3.Sys.Audio.getAudioStreamPropertiesSafe,
  SDL3.Sys.Audio.getAudioStreamFormat,
  SDL3.Sys.Audio.getAudioStreamFormatSafe,
  SDL3.Sys.Audio.setAudioStreamFormat,
  SDL3.Sys.Audio.setAudioStreamFormatSafe,
  SDL3.Sys.Audio.getAudioStreamFrequencyRatio,
  SDL3.Sys.Audio.getAudioStreamFrequencyRatioSafe,
  SDL3.Sys.Audio.setAudioStreamFrequencyRatio,
  SDL3.Sys.Audio.setAudioStreamFrequencyRatioSafe,
  SDL3.Sys.Audio.getAudioStreamGain,
  SDL3.Sys.Audio.getAudioStreamGainSafe,
  SDL3.Sys.Audio.setAudioStreamGain,
  SDL3.Sys.Audio.setAudioStreamGainSafe,
  SDL3.Sys.Audio.getAudioStreamInputChannelMap,
  SDL3.Sys.Audio.getAudioStreamInputChannelMapSafe,
  SDL3.Sys.Audio.getAudioStreamOutputChannelMap,
  SDL3.Sys.Audio.getAudioStreamOutputChannelMapSafe,
  SDL3.Sys.Audio.setAudioStreamInputChannelMap,
  SDL3.Sys.Audio.setAudioStreamInputChannelMapSafe,
  SDL3.Sys.Audio.setAudioStreamOutputChannelMap,
  SDL3.Sys.Audio.setAudioStreamOutputChannelMapSafe,
  SDL3.Sys.Audio.putAudioStreamData,
  SDL3.Sys.Audio.putAudioStreamDataSafe,
  SDL3.Sys.Audio.putAudioStreamDataNoCopy,
  SDL3.Sys.Audio.putAudioStreamDataNoCopySafe,
  SDL3.Sys.Audio.putAudioStreamPlanarData,
  SDL3.Sys.Audio.putAudioStreamPlanarDataSafe,
  SDL3.Sys.Audio.getAudioStreamData,
  SDL3.Sys.Audio.getAudioStreamDataSafe,
  SDL3.Sys.Audio.getAudioStreamAvailable,
  SDL3.Sys.Audio.getAudioStreamAvailableSafe,
  SDL3.Sys.Audio.getAudioStreamQueued,
  SDL3.Sys.Audio.getAudioStreamQueuedSafe,
  SDL3.Sys.Audio.flushAudioStream,
  SDL3.Sys.Audio.flushAudioStreamSafe,
  SDL3.Sys.Audio.clearAudioStream,
  SDL3.Sys.Audio.clearAudioStreamSafe,
  SDL3.Sys.Audio.pauseAudioStreamDevice,
  SDL3.Sys.Audio.pauseAudioStreamDeviceSafe,
  SDL3.Sys.Audio.resumeAudioStreamDevice,
  SDL3.Sys.Audio.resumeAudioStreamDeviceSafe,
  SDL3.Sys.Audio.audioStreamDevicePaused,
  SDL3.Sys.Audio.audioStreamDevicePausedSafe,
  SDL3.Sys.Audio.lockAudioStream,
  SDL3.Sys.Audio.lockAudioStreamSafe,
  SDL3.Sys.Audio.unlockAudioStream,
  SDL3.Sys.Audio.unlockAudioStreamSafe,
  SDL3.Sys.Audio.setAudioStreamGetCallback,
  SDL3.Sys.Audio.setAudioStreamGetCallbackSafe,
  SDL3.Sys.Audio.setAudioStreamPutCallback,
  SDL3.Sys.Audio.setAudioStreamPutCallbackSafe,
  SDL3.Sys.Audio.destroyAudioStream,
  SDL3.Sys.Audio.destroyAudioStreamSafe,
  SDL3.Sys.Audio.openAudioDeviceStream,
  SDL3.Sys.Audio.openAudioDeviceStreamSafe,
  SDL3.Sys.Audio.setAudioPostmixCallback,
  SDL3.Sys.Audio.setAudioPostmixCallbackSafe,
  SDL3.Sys.Audio.loadWAVIO,
  SDL3.Sys.Audio.loadWAVIOSafe,
  SDL3.Sys.Audio.loadWAV,
  SDL3.Sys.Audio.loadWAVSafe,
  SDL3.Sys.Audio.mixAudio,
  SDL3.Sys.Audio.mixAudioSafe,
  SDL3.Sys.Audio.convertAudioSamples,
  SDL3.Sys.Audio.convertAudioSamplesSafe,
  SDL3.Sys.Audio.getAudioFormatName,
  SDL3.Sys.Audio.getAudioFormatNameSafe,
  SDL3.Sys.Audio.getSilenceValueForFormat,
  SDL3.Sys.Audio.getSilenceValueForFormatSafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Audio
import SDL3.Sys.Bindgen.Audio.Safe qualified as Safe
import SDL3.Sys.Bindgen.Audio.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Iostream qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified

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
--     [See also]: 'getAudioDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetNumAudioDrivers@.
--                   The safe flavor is 'getNumAudioDriversSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumAudioDrivers@, defined at @SDL3\/SDL_audio.h 477:33@
getNumAudioDrivers :: IO BG.Int32
getNumAudioDrivers =
  fmap Coerce.coerce Unsafe.sDL_GetNumAudioDrivers

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
--     [See also]: 'getAudioDriver'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetNumAudioDrivers@.
--                   The unsafe flavor is 'getNumAudioDrivers'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetNumAudioDrivers@, defined at @SDL3\/SDL_audio.h 477:33@
getNumAudioDriversSafe :: IO BG.Int32
getNumAudioDriversSafe =
  fmap Coerce.coerce Safe.sDL_GetNumAudioDrivers

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
--     [See also]: 'getNumAudioDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioDriver@.
--                   The safe flavor is 'getAudioDriverSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioDriver@, defined at @SDL3\/SDL_audio.h 501:42@
getAudioDriver
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of the audio driver; the value ranges from 0 to @'getNumAudioDrivers'@ - 1.
  -> IO (PtrConst.PtrConst BG.CChar)
getAudioDriver =
  \x00 -> Unsafe.sDL_GetAudioDriver (Coerce.coerce x00)

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
--     [See also]: 'getNumAudioDrivers'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioDriver@.
--                   The unsafe flavor is 'getAudioDriver'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioDriver@, defined at @SDL3\/SDL_audio.h 501:42@
getAudioDriverSafe
  :: BG.Int32
  -- ^
  --
  --           [@index@]: the index of the audio driver; the value ranges from 0 to @'getNumAudioDrivers'@ - 1.
  -> IO (PtrConst.PtrConst BG.CChar)
getAudioDriverSafe =
  \x00 -> Safe.sDL_GetAudioDriver (Coerce.coerce x00)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCurrentAudioDriver@.
--                   The safe flavor is 'getCurrentAudioDriverSafe'
--                   .
--
--     [C declaration]: @SDL_GetCurrentAudioDriver@, defined at @SDL3\/SDL_audio.h 517:42@
getCurrentAudioDriver :: IO (PtrConst.PtrConst BG.CChar)
getCurrentAudioDriver =
  Unsafe.sDL_GetCurrentAudioDriver

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCurrentAudioDriver@.
--                   The unsafe flavor is 'getCurrentAudioDriver'
--                   .
--
--     [C declaration]: @SDL_GetCurrentAudioDriver@, defined at @SDL3\/SDL_audio.h 517:42@
getCurrentAudioDriverSafe :: IO (PtrConst.PtrConst BG.CChar)
getCurrentAudioDriverSafe =
  Safe.sDL_GetCurrentAudioDriver

-- | Get a list of currently-connected audio playback devices.
--
--     This returns of list of available devices that play sound, perhaps to speakers or headphones (\"playback\" devices). If you want devices that record audio, like a microphone (\"recording\" devices), use @'getAudioRecordingDevices'@ instead.
--
--     This only returns a list of physical devices; it will not have any device IDs returned by @'openAudioDevice'@.
--
--     If this function returns NULL, to signify an error, @*count@ will be set to zero.
--
--     [Returns]: a 0 terminated array of device instance IDs or NULL on error; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openAudioDevice', 'getAudioRecordingDevices'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioPlaybackDevices@.
--                   The safe flavor is 'getAudioPlaybackDevicesSafe'
--                   .
--
--     [C declaration]: @SDL_GetAudioPlaybackDevices@, defined at @SDL3\/SDL_audio.h 546:49@
getAudioPlaybackDevices
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of devices returned, may be NULL.
  -> IO (BG.Ptr SDL_AudioDeviceID)
getAudioPlaybackDevices =
  Unsafe.sDL_GetAudioPlaybackDevices

-- | Get a list of currently-connected audio playback devices.
--
--     This returns of list of available devices that play sound, perhaps to speakers or headphones (\"playback\" devices). If you want devices that record audio, like a microphone (\"recording\" devices), use @'getAudioRecordingDevices'@ instead.
--
--     This only returns a list of physical devices; it will not have any device IDs returned by @'openAudioDevice'@.
--
--     If this function returns NULL, to signify an error, @*count@ will be set to zero.
--
--     [Returns]: a 0 terminated array of device instance IDs or NULL on error; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openAudioDevice', 'getAudioRecordingDevices'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioPlaybackDevices@.
--                   The unsafe flavor is 'getAudioPlaybackDevices'
--                   .
--
--     [C declaration]: @SDL_GetAudioPlaybackDevices@, defined at @SDL3\/SDL_audio.h 546:49@
getAudioPlaybackDevicesSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of devices returned, may be NULL.
  -> IO (BG.Ptr SDL_AudioDeviceID)
getAudioPlaybackDevicesSafe =
  Safe.sDL_GetAudioPlaybackDevices

-- | Get a list of currently-connected audio recording devices.
--
--     This returns of list of available devices that record audio, like a microphone (\"recording\" devices). If you want devices that play sound, perhaps to speakers or headphones (\"playback\" devices), use @'getAudioPlaybackDevices'@ instead.
--
--     This only returns a list of physical devices; it will not have any device IDs returned by @'openAudioDevice'@.
--
--     If this function returns NULL, to signify an error, @*count@ will be set to zero.
--
--     [Returns]: a 0 terminated array of device instance IDs, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openAudioDevice', 'getAudioPlaybackDevices'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioRecordingDevices@.
--                   The safe flavor is 'getAudioRecordingDevicesSafe'
--                   .
--
--     [C declaration]: @SDL_GetAudioRecordingDevices@, defined at @SDL3\/SDL_audio.h 575:49@
getAudioRecordingDevices
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of devices returned, may be NULL.
  -> IO (BG.Ptr SDL_AudioDeviceID)
getAudioRecordingDevices =
  Unsafe.sDL_GetAudioRecordingDevices

-- | Get a list of currently-connected audio recording devices.
--
--     This returns of list of available devices that record audio, like a microphone (\"recording\" devices). If you want devices that play sound, perhaps to speakers or headphones (\"playback\" devices), use @'getAudioPlaybackDevices'@ instead.
--
--     This only returns a list of physical devices; it will not have any device IDs returned by @'openAudioDevice'@.
--
--     If this function returns NULL, to signify an error, @*count@ will be set to zero.
--
--     [Returns]: a 0 terminated array of device instance IDs, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'openAudioDevice', 'getAudioPlaybackDevices'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioRecordingDevices@.
--                   The unsafe flavor is 'getAudioRecordingDevices'
--                   .
--
--     [C declaration]: @SDL_GetAudioRecordingDevices@, defined at @SDL3\/SDL_audio.h 575:49@
getAudioRecordingDevicesSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of devices returned, may be NULL.
  -> IO (BG.Ptr SDL_AudioDeviceID)
getAudioRecordingDevicesSafe =
  Safe.sDL_GetAudioRecordingDevices

-- | Get the human-readable name of a specific audio device.
--
--     __WARNING__: this function will work with SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK and SDL_AUDIO_DEVICE_DEFAULT_RECORDING, returning the current default physical devices\' names. However, as the default device may change at any time, it is likely better to show a generic name to the user, like \"System default audio device\" or perhaps \"default [currently %s]\". Do not store this name to disk to reidentify the device in a later run of the program, as the default might change in general, and the string will be the name of a specific device and not the abstract system default.
--
--     [Returns]: the name of the audio device, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioPlaybackDevices', 'getAudioRecordingDevices'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioDeviceName@.
--                   The safe flavor is 'getAudioDeviceNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetAudioDeviceName@, defined at @SDL3\/SDL_audio.h 600:42@
getAudioDeviceName
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the instance ID of the device to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getAudioDeviceName = Unsafe.sDL_GetAudioDeviceName

-- | Get the human-readable name of a specific audio device.
--
--     __WARNING__: this function will work with SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK and SDL_AUDIO_DEVICE_DEFAULT_RECORDING, returning the current default physical devices\' names. However, as the default device may change at any time, it is likely better to show a generic name to the user, like \"System default audio device\" or perhaps \"default [currently %s]\". Do not store this name to disk to reidentify the device in a later run of the program, as the default might change in general, and the string will be the name of a specific device and not the abstract system default.
--
--     [Returns]: the name of the audio device, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioPlaybackDevices', 'getAudioRecordingDevices'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioDeviceName@.
--                   The unsafe flavor is 'getAudioDeviceName'
--                   .
--
--     [C declaration]: @SDL_GetAudioDeviceName@, defined at @SDL3\/SDL_audio.h 600:42@
getAudioDeviceNameSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the instance ID of the device to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getAudioDeviceNameSafe = Safe.sDL_GetAudioDeviceName

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioDeviceFormat@.
--                   The safe flavor is 'getAudioDeviceFormatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioDeviceFormat@, defined at @SDL3\/SDL_audio.h 635:34@
getAudioDeviceFormat
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
  -> IO Bool
getAudioDeviceFormat =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetAudioDeviceFormat x00 x11 x22)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioDeviceFormat@.
--                   The unsafe flavor is 'getAudioDeviceFormat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioDeviceFormat@, defined at @SDL3\/SDL_audio.h 635:34@
getAudioDeviceFormatSafe
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
  -> IO Bool
getAudioDeviceFormatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetAudioDeviceFormat x00 x11 x22)

-- | Get the current channel map of an audio device.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     Audio devices usually have no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [Returns]: an array of the current channel mapping, with as many elements as the current output spec\'s channels, or NULL if default. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioDeviceChannelMap@.
--                   The safe flavor is 'getAudioDeviceChannelMapSafe'
--                   .
--
--     [C declaration]: @SDL_GetAudioDeviceChannelMap@, defined at @SDL3\/SDL_audio.h 658:35@
getAudioDeviceChannelMap
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the instance ID of the device to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: On output, set to number of channels in the map. Can be NULL.
  -> IO (BG.Ptr BG.CInt)
getAudioDeviceChannelMap =
  Unsafe.sDL_GetAudioDeviceChannelMap

-- | Get the current channel map of an audio device.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     Audio devices usually have no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [Returns]: an array of the current channel mapping, with as many elements as the current output spec\'s channels, or NULL if default. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioDeviceChannelMap@.
--                   The unsafe flavor is 'getAudioDeviceChannelMap'
--                   .
--
--     [C declaration]: @SDL_GetAudioDeviceChannelMap@, defined at @SDL3\/SDL_audio.h 658:35@
getAudioDeviceChannelMapSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the instance ID of the device to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: On output, set to number of channels in the map. Can be NULL.
  -> IO (BG.Ptr BG.CInt)
getAudioDeviceChannelMapSafe =
  Safe.sDL_GetAudioDeviceChannelMap

-- | Open a specific audio device.
--
--     You can open both playback and recording devices through this function. Playback devices will take data from bound audio streams, mix it, and send it to the hardware. Recording devices will feed any bound audio streams with a copy of any incoming data.
--
--     An opened audio device starts out with no audio streams bound. To start audio playing, bind a stream and supply audio data to it. Unlike SDL2, there is no audio callback; you only bind audio streams and make sure they have data flowing into them (however, you can simulate SDL2\'s semantics fairly closely by using 'openAudioDeviceStream' instead of this function).
--
--     If you don\'t care about opening a specific device, pass a @devid@ of either @SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK@ or @SDL_AUDIO_DEVICE_DEFAULT_RECORDING@. In this case, SDL will try to pick the most reasonable default, and may also switch between physical devices seamlessly later, if the most reasonable default changes during the lifetime of this opened device (user changed the default in the OS\'s system preferences, the default got unplugged so the system jumped to a new default, the user plugged in headphones on a mobile device, etc). Unless you have a good reason to choose a specific device, this is probably what you want.
--
--     You may request a specific format for the audio device, but there is no promise the device will honor that request for several reasons. As such, it\'s only meant to be a hint as to what data your app will provide. Audio streams will accept data in whatever format you specify and manage conversion for you as appropriate. 'getAudioDeviceFormat' can tell you the preferred format for the device before opening and the actual format the device is using after opening.
--
--     It\'s legal to open the same device ID more than once; each successful open will generate a new logical 'SDL_AudioDeviceID' that is managed separately from others on the same physical device. This allows libraries to open a device separately from the main app and bind its own streams without conflicting.
--
--     It is also legal to open a device ID returned by a previous call to this function; doing so just creates another logical device on the same physical device. This may be useful for making logical groupings of audio streams.
--
--     This function returns the opened device ID on success. This is a new, unique 'SDL_AudioDeviceID' that represents a logical device.
--
--     Some backends might offer arbitrary devices (for example, a networked audio protocol that can connect to an arbitrary server). For these, as a change from SDL2, you should open a default device ID and use an SDL hint to specify the target if you care, or otherwise let the backend figure out a reasonable default. Most backends don\'t offer anything like this, and often this would be an end user setting an environment variable for their custom need, and not something an application should specifically manage.
--
--     When done with an audio device, possibly at the end of the app\'s life, one should call @'closeAudioDevice'@ on the returned device id.
--
--     [Returns]: the device ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeAudioDevice', 'getAudioDeviceFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenAudioDevice@.
--                   The safe flavor is 'openAudioDeviceSafe'
--                   .
--
--     [C declaration]: @SDL_OpenAudioDevice@, defined at @SDL3\/SDL_audio.h 734:47@
openAudioDevice
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the device instance id to open, or SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or SDL_AUDIO_DEVICE_DEFAULT_RECORDING for the most reasonable default device.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@spec@]: the requested device configuration. Can be NULL to use reasonable defaults.
  -> IO SDL_AudioDeviceID
openAudioDevice = Unsafe.sDL_OpenAudioDevice

-- | Open a specific audio device.
--
--     You can open both playback and recording devices through this function. Playback devices will take data from bound audio streams, mix it, and send it to the hardware. Recording devices will feed any bound audio streams with a copy of any incoming data.
--
--     An opened audio device starts out with no audio streams bound. To start audio playing, bind a stream and supply audio data to it. Unlike SDL2, there is no audio callback; you only bind audio streams and make sure they have data flowing into them (however, you can simulate SDL2\'s semantics fairly closely by using 'openAudioDeviceStream' instead of this function).
--
--     If you don\'t care about opening a specific device, pass a @devid@ of either @SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK@ or @SDL_AUDIO_DEVICE_DEFAULT_RECORDING@. In this case, SDL will try to pick the most reasonable default, and may also switch between physical devices seamlessly later, if the most reasonable default changes during the lifetime of this opened device (user changed the default in the OS\'s system preferences, the default got unplugged so the system jumped to a new default, the user plugged in headphones on a mobile device, etc). Unless you have a good reason to choose a specific device, this is probably what you want.
--
--     You may request a specific format for the audio device, but there is no promise the device will honor that request for several reasons. As such, it\'s only meant to be a hint as to what data your app will provide. Audio streams will accept data in whatever format you specify and manage conversion for you as appropriate. 'getAudioDeviceFormat' can tell you the preferred format for the device before opening and the actual format the device is using after opening.
--
--     It\'s legal to open the same device ID more than once; each successful open will generate a new logical 'SDL_AudioDeviceID' that is managed separately from others on the same physical device. This allows libraries to open a device separately from the main app and bind its own streams without conflicting.
--
--     It is also legal to open a device ID returned by a previous call to this function; doing so just creates another logical device on the same physical device. This may be useful for making logical groupings of audio streams.
--
--     This function returns the opened device ID on success. This is a new, unique 'SDL_AudioDeviceID' that represents a logical device.
--
--     Some backends might offer arbitrary devices (for example, a networked audio protocol that can connect to an arbitrary server). For these, as a change from SDL2, you should open a default device ID and use an SDL hint to specify the target if you care, or otherwise let the backend figure out a reasonable default. Most backends don\'t offer anything like this, and often this would be an end user setting an environment variable for their custom need, and not something an application should specifically manage.
--
--     When done with an audio device, possibly at the end of the app\'s life, one should call @'closeAudioDevice'@ on the returned device id.
--
--     [Returns]: the device ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeAudioDevice', 'getAudioDeviceFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenAudioDevice@.
--                   The unsafe flavor is 'openAudioDevice'
--                   .
--
--     [C declaration]: @SDL_OpenAudioDevice@, defined at @SDL3\/SDL_audio.h 734:47@
openAudioDeviceSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the device instance id to open, or SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK or SDL_AUDIO_DEVICE_DEFAULT_RECORDING for the most reasonable default device.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@spec@]: the requested device configuration. Can be NULL to use reasonable defaults.
  -> IO SDL_AudioDeviceID
openAudioDeviceSafe = Safe.sDL_OpenAudioDevice

-- | Determine if an audio device is physical (instead of logical).
--
--     An 'SDL_AudioDeviceID' that represents physical hardware is a physical device; there is one for each piece of hardware that SDL can see. Logical devices are created by calling 'openAudioDevice' or 'openAudioDeviceStream', and while each is associated with a physical device, there can be any number of logical devices on one physical device.
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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IsAudioDevicePhysical@.
--                   The safe flavor is 'isAudioDevicePhysicalSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsAudioDevicePhysical@, defined at @SDL3\/SDL_audio.h 759:34@
isAudioDevicePhysical
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the device ID to query.
  -> IO Bool
isAudioDevicePhysical =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_IsAudioDevicePhysical x00)

-- | Determine if an audio device is physical (instead of logical).
--
--     An 'SDL_AudioDeviceID' that represents physical hardware is a physical device; there is one for each piece of hardware that SDL can see. Logical devices are created by calling 'openAudioDevice' or 'openAudioDeviceStream', and while each is associated with a physical device, there can be any number of logical devices on one physical device.
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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IsAudioDevicePhysical@.
--                   The unsafe flavor is 'isAudioDevicePhysical'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsAudioDevicePhysical@, defined at @SDL3\/SDL_audio.h 759:34@
isAudioDevicePhysicalSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the device ID to query.
  -> IO Bool
isAudioDevicePhysicalSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_IsAudioDevicePhysical x00)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IsAudioDevicePlayback@.
--                   The safe flavor is 'isAudioDevicePlaybackSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsAudioDevicePlayback@, defined at @SDL3\/SDL_audio.h 773:34@
isAudioDevicePlayback
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the device ID to query.
  -> IO Bool
isAudioDevicePlayback =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_IsAudioDevicePlayback x00)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IsAudioDevicePlayback@.
--                   The unsafe flavor is 'isAudioDevicePlayback'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IsAudioDevicePlayback@, defined at @SDL3\/SDL_audio.h 773:34@
isAudioDevicePlaybackSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the device ID to query.
  -> IO Bool
isAudioDevicePlaybackSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_IsAudioDevicePlayback x00)

-- | Use this function to pause audio playback on a specified device.
--
--     This function pauses audio processing for a given device. Any bound audio streams will not progress, and no audio will be generated. Pausing one device does not prevent other unpaused devices from running.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow. Pausing a paused device is a legal no-op.
--
--     Pausing a device can be useful to halt all audio without unbinding all the audio streams. This might be useful while a game is paused, or a level is loading, etc.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @'openAudioDevice'@ can be.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'resumeAudioDevice', 'audioDevicePaused'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PauseAudioDevice@.
--                   The safe flavor is 'pauseAudioDeviceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PauseAudioDevice@, defined at @SDL3\/SDL_audio.h 804:34@
pauseAudioDevice
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: a device opened by @'openAudioDevice'@.
  -> IO Bool
pauseAudioDevice =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_PauseAudioDevice x00)

-- | Use this function to pause audio playback on a specified device.
--
--     This function pauses audio processing for a given device. Any bound audio streams will not progress, and no audio will be generated. Pausing one device does not prevent other unpaused devices from running.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow. Pausing a paused device is a legal no-op.
--
--     Pausing a device can be useful to halt all audio without unbinding all the audio streams. This might be useful while a game is paused, or a level is loading, etc.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @'openAudioDevice'@ can be.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'resumeAudioDevice', 'audioDevicePaused'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PauseAudioDevice@.
--                   The unsafe flavor is 'pauseAudioDevice'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PauseAudioDevice@, defined at @SDL3\/SDL_audio.h 804:34@
pauseAudioDeviceSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: a device opened by @'openAudioDevice'@.
  -> IO Bool
pauseAudioDeviceSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_PauseAudioDevice x00)

-- | Use this function to unpause audio playback on a specified device.
--
--     This function unpauses audio processing for a given device that has previously been paused with @'pauseAudioDevice'@. Once unpaused, any bound audio streams will begin to progress again, and audio can be generated.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow. Unpausing an unpaused device is a legal no-op.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @'openAudioDevice'@ can be.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'audioDevicePaused', 'pauseAudioDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ResumeAudioDevice@.
--                   The safe flavor is 'resumeAudioDeviceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ResumeAudioDevice@, defined at @SDL3\/SDL_audio.h 832:34@
resumeAudioDevice
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: a device opened by @'openAudioDevice'@.
  -> IO Bool
resumeAudioDevice =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_ResumeAudioDevice x00)

-- | Use this function to unpause audio playback on a specified device.
--
--     This function unpauses audio processing for a given device that has previously been paused with @'pauseAudioDevice'@. Once unpaused, any bound audio streams will begin to progress again, and audio can be generated.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow. Unpausing an unpaused device is a legal no-op.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @'openAudioDevice'@ can be.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'audioDevicePaused', 'pauseAudioDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ResumeAudioDevice@.
--                   The unsafe flavor is 'resumeAudioDevice'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ResumeAudioDevice@, defined at @SDL3\/SDL_audio.h 832:34@
resumeAudioDeviceSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: a device opened by @'openAudioDevice'@.
  -> IO Bool
resumeAudioDeviceSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_ResumeAudioDevice x00)

-- | Use this function to query if an audio device is paused.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @'openAudioDevice'@ can be. Physical and invalid device IDs will report themselves as unpaused here.
--
--     [Returns]: true if device is valid and paused, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pauseAudioDevice', 'resumeAudioDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AudioDevicePaused@.
--                   The safe flavor is 'audioDevicePausedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AudioDevicePaused@, defined at @SDL3\/SDL_audio.h 854:34@
audioDevicePaused
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: a device opened by @'openAudioDevice'@.
  -> IO Bool
audioDevicePaused =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_AudioDevicePaused x00)

-- | Use this function to query if an audio device is paused.
--
--     Unlike in SDL2, audio devices start in an /unpaused/ state, since an app has to bind a stream before any audio will flow.
--
--     Physical devices can not be paused or unpaused, only logical devices created through @'openAudioDevice'@ can be. Physical and invalid device IDs will report themselves as unpaused here.
--
--     [Returns]: true if device is valid and paused, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pauseAudioDevice', 'resumeAudioDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AudioDevicePaused@.
--                   The unsafe flavor is 'audioDevicePaused'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AudioDevicePaused@, defined at @SDL3\/SDL_audio.h 854:34@
audioDevicePausedSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: a device opened by @'openAudioDevice'@.
  -> IO Bool
audioDevicePausedSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_AudioDevicePaused x00)

-- | Get the gain of an audio device.
--
--     The gain of a device is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio devices default to a gain of 1.0f (no change in output).
--
--     Physical devices may not have their gain changed, only logical devices, and this function will always return -1.0f when used on physical devices.
--
--     [Returns]: the gain of the device or -1.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioDeviceGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioDeviceGain@.
--                   The safe flavor is 'getAudioDeviceGainSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioDeviceGain@, defined at @SDL3\/SDL_audio.h 877:35@
getAudioDeviceGain
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the audio device to query.
  -> IO Float
getAudioDeviceGain =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetAudioDeviceGain x00)

-- | Get the gain of an audio device.
--
--     The gain of a device is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio devices default to a gain of 1.0f (no change in output).
--
--     Physical devices may not have their gain changed, only logical devices, and this function will always return -1.0f when used on physical devices.
--
--     [Returns]: the gain of the device or -1.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioDeviceGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioDeviceGain@.
--                   The unsafe flavor is 'getAudioDeviceGain'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioDeviceGain@, defined at @SDL3\/SDL_audio.h 877:35@
getAudioDeviceGainSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the audio device to query.
  -> IO Float
getAudioDeviceGainSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetAudioDeviceGain x00)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioDeviceGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAudioDeviceGain@.
--                   The safe flavor is 'setAudioDeviceGainSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioDeviceGain@, defined at @SDL3\/SDL_audio.h 912:34@
setAudioDeviceGain
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the audio device on which to change gain.
  -> Float
  -- ^
  --
  --           [@gain@]: the gain. 1.0f is no change, 0.0f is silence.
  -> IO Bool
setAudioDeviceGain =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetAudioDeviceGain x00 (Coerce.coerce x11))

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioDeviceGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAudioDeviceGain@.
--                   The unsafe flavor is 'setAudioDeviceGain'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioDeviceGain@, defined at @SDL3\/SDL_audio.h 912:34@
setAudioDeviceGainSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: the audio device on which to change gain.
  -> Float
  -- ^
  --
  --           [@gain@]: the gain. 1.0f is no change, 0.0f is silence.
  -> IO Bool
setAudioDeviceGainSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetAudioDeviceGain x00 (Coerce.coerce x11))

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
--     [See also]: 'openAudioDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CloseAudioDevice@.
--                   The safe flavor is 'closeAudioDeviceSafe'
--                   .
--
--     [C declaration]: @SDL_CloseAudioDevice@, defined at @SDL3\/SDL_audio.h 933:34@
closeAudioDevice
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device id previously returned by @'openAudioDevice'@.
  -> IO ()
closeAudioDevice = Unsafe.sDL_CloseAudioDevice

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
--     [See also]: 'openAudioDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CloseAudioDevice@.
--                   The unsafe flavor is 'closeAudioDevice'
--                   .
--
--     [C declaration]: @SDL_CloseAudioDevice@, defined at @SDL3\/SDL_audio.h 933:34@
closeAudioDeviceSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device id previously returned by @'openAudioDevice'@.
  -> IO ()
closeAudioDeviceSafe = Safe.sDL_CloseAudioDevice

-- | Bind a list of audio streams to an audio device.
--
--     Audio data will flow through any bound streams. For a playback device, data for all bound streams will be mixed together and fed to the device. For a recording device, a copy of recorded data will be provided to each bound stream.
--
--     Audio streams can only be bound to an open device. This operation is atomic all streams bound in the same call will start processing at the same time, so they can stay in sync. Also: either all streams will be bound or none of them will be.
--
--     It is an error to bind an already-bound stream; it must be explicitly unbound first.
--
--     Binding a stream to a device will set its output format for playback devices, and its input format for recording devices, so they match the device\'s settings. The caller is welcome to change the other end of the stream\'s format at any time with @'setAudioStreamFormat'@. If the other end of the stream\'s format has never been set (the audio stream was created with a NULL audio spec), this function will set it to match the device end\'s format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bindAudioStreams', 'unbindAudioStream', 'getAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindAudioStreams@.
--                   The safe flavor is 'bindAudioStreamsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindAudioStreams@, defined at @SDL3\/SDL_audio.h 973:34@
bindAudioStreams
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device to bind a stream to.
  -> PtrConst.PtrConst (BG.Ptr SDL_AudioStream)
  -- ^
  --
  --           [@streams@]: an array of audio streams to bind.
  -> BG.Int32
  -- ^
  --
  --           [@num_streams@]: number streams listed in the @streams@ array.
  -> IO Bool
bindAudioStreams =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_BindAudioStreams x00 x11 (Coerce.coerce x22))

-- | Bind a list of audio streams to an audio device.
--
--     Audio data will flow through any bound streams. For a playback device, data for all bound streams will be mixed together and fed to the device. For a recording device, a copy of recorded data will be provided to each bound stream.
--
--     Audio streams can only be bound to an open device. This operation is atomic all streams bound in the same call will start processing at the same time, so they can stay in sync. Also: either all streams will be bound or none of them will be.
--
--     It is an error to bind an already-bound stream; it must be explicitly unbound first.
--
--     Binding a stream to a device will set its output format for playback devices, and its input format for recording devices, so they match the device\'s settings. The caller is welcome to change the other end of the stream\'s format at any time with @'setAudioStreamFormat'@. If the other end of the stream\'s format has never been set (the audio stream was created with a NULL audio spec), this function will set it to match the device end\'s format.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bindAudioStreams', 'unbindAudioStream', 'getAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindAudioStreams@.
--                   The unsafe flavor is 'bindAudioStreams'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindAudioStreams@, defined at @SDL3\/SDL_audio.h 973:34@
bindAudioStreamsSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device to bind a stream to.
  -> PtrConst.PtrConst (BG.Ptr SDL_AudioStream)
  -- ^
  --
  --           [@streams@]: an array of audio streams to bind.
  -> BG.Int32
  -- ^
  --
  --           [@num_streams@]: number streams listed in the @streams@ array.
  -> IO Bool
bindAudioStreamsSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_BindAudioStreams x00 x11 (Coerce.coerce x22))

-- | Bind a single audio stream to an audio device.
--
--     This is a convenience function, equivalent to calling @'bindAudioStreams' (devid, &stream, 1)@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bindAudioStreams', 'unbindAudioStream', 'getAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_BindAudioStream@.
--                   The safe flavor is 'bindAudioStreamSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindAudioStream@, defined at @SDL3\/SDL_audio.h 994:34@
bindAudioStream
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device to bind a stream to.
  -> BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: an audio stream to bind to a device.
  -> IO Bool
bindAudioStream =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_BindAudioStream x00 x11)

-- | Bind a single audio stream to an audio device.
--
--     This is a convenience function, equivalent to calling @'bindAudioStreams' (devid, &stream, 1)@.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bindAudioStreams', 'unbindAudioStream', 'getAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_BindAudioStream@.
--                   The unsafe flavor is 'bindAudioStream'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_BindAudioStream@, defined at @SDL3\/SDL_audio.h 994:34@
bindAudioStreamSafe
  :: SDL_AudioDeviceID
  -- ^
  --
  --           [@devid@]: an audio device to bind a stream to.
  -> BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: an audio stream to bind to a device.
  -> IO Bool
bindAudioStreamSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_BindAudioStream x00 x11)

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
--     [See also]: 'bindAudioStreams'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnbindAudioStreams@.
--                   The safe flavor is 'unbindAudioStreamsSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UnbindAudioStreams@, defined at @SDL3\/SDL_audio.h 1015:34@
unbindAudioStreams
  :: PtrConst.PtrConst (BG.Ptr SDL_AudioStream)
  -- ^
  --
  --           [@streams@]: an array of audio streams to unbind. Can be NULL or contain NULL.
  -> BG.Int32
  -- ^
  --
  --           [@num_streams@]: number streams listed in the @streams@ array.
  -> IO ()
unbindAudioStreams =
  \x00 ->
    \x11 ->
      Unsafe.sDL_UnbindAudioStreams x00 (Coerce.coerce x11)

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
--     [See also]: 'bindAudioStreams'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnbindAudioStreams@.
--                   The unsafe flavor is 'unbindAudioStreams'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UnbindAudioStreams@, defined at @SDL3\/SDL_audio.h 1015:34@
unbindAudioStreamsSafe
  :: PtrConst.PtrConst (BG.Ptr SDL_AudioStream)
  -- ^
  --
  --           [@streams@]: an array of audio streams to unbind. Can be NULL or contain NULL.
  -> BG.Int32
  -- ^
  --
  --           [@num_streams@]: number streams listed in the @streams@ array.
  -> IO ()
unbindAudioStreamsSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_UnbindAudioStreams x00 (Coerce.coerce x11)

-- | Unbind a single audio stream from its audio device.
--
--     This is a convenience function, equivalent to calling @'unbindAudioStreams' (&stream, 1)@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bindAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnbindAudioStream@.
--                   The safe flavor is 'unbindAudioStreamSafe'
--                   .
--
--     [C declaration]: @SDL_UnbindAudioStream@, defined at @SDL3\/SDL_audio.h 1031:34@
unbindAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: an audio stream to unbind from a device. Can be NULL.
  -> IO ()
unbindAudioStream = Unsafe.sDL_UnbindAudioStream

-- | Unbind a single audio stream from its audio device.
--
--     This is a convenience function, equivalent to calling @'unbindAudioStreams' (&stream, 1)@.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'bindAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnbindAudioStream@.
--                   The unsafe flavor is 'unbindAudioStream'
--                   .
--
--     [C declaration]: @SDL_UnbindAudioStream@, defined at @SDL3\/SDL_audio.h 1031:34@
unbindAudioStreamSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: an audio stream to unbind from a device. Can be NULL.
  -> IO ()
unbindAudioStreamSafe = Safe.sDL_UnbindAudioStream

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
--     [See also]: 'bindAudioStream', 'bindAudioStreams'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamDevice@.
--                   The safe flavor is 'getAudioStreamDeviceSafe'
--                   .
--
--     [C declaration]: @SDL_GetAudioStreamDevice@, defined at @SDL3\/SDL_audio.h 1052:47@
getAudioStreamDevice
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to query.
  -> IO SDL_AudioDeviceID
getAudioStreamDevice =
  Unsafe.sDL_GetAudioStreamDevice

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
--     [See also]: 'bindAudioStream', 'bindAudioStreams'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamDevice@.
--                   The unsafe flavor is 'getAudioStreamDevice'
--                   .
--
--     [C declaration]: @SDL_GetAudioStreamDevice@, defined at @SDL3\/SDL_audio.h 1052:47@
getAudioStreamDeviceSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to query.
  -> IO SDL_AudioDeviceID
getAudioStreamDeviceSafe =
  Safe.sDL_GetAudioStreamDevice

-- | Create a new audio stream.
--
--     [Returns]: a new audio stream on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'putAudioStreamData', 'getAudioStreamData', 'getAudioStreamAvailable', 'flushAudioStream', 'clearAudioStream', 'setAudioStreamFormat', 'destroyAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateAudioStream@.
--                   The safe flavor is 'createAudioStreamSafe'
--                   .
--
--     [C declaration]: @SDL_CreateAudioStream@, defined at @SDL3\/SDL_audio.h 1074:47@
createAudioStream
  :: PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@src_spec@]: the format details of the input audio.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@dst_spec@]: the format details of the output audio.
  -> IO (BG.Ptr SDL_AudioStream)
createAudioStream = Unsafe.sDL_CreateAudioStream

-- | Create a new audio stream.
--
--     [Returns]: a new audio stream on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'putAudioStreamData', 'getAudioStreamData', 'getAudioStreamAvailable', 'flushAudioStream', 'clearAudioStream', 'setAudioStreamFormat', 'destroyAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateAudioStream@.
--                   The unsafe flavor is 'createAudioStream'
--                   .
--
--     [C declaration]: @SDL_CreateAudioStream@, defined at @SDL3\/SDL_audio.h 1074:47@
createAudioStreamSafe
  :: PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@src_spec@]: the format details of the input audio.
  -> PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@dst_spec@]: the format details of the output audio.
  -> IO (BG.Ptr SDL_AudioStream)
createAudioStreamSafe = Safe.sDL_CreateAudioStream

-- | Get the properties associated with an audio stream.
--
--     The application can hang any data it wants here, but the following properties are understood by SDL:
--
--     * @'sDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN'@: if true (the default), the stream be automatically cleaned up when the audio subsystem quits. If set to false, the streams will persist beyond that. This property is ignored for streams created through @'openAudioDeviceStream'@, and will always be cleaned up. Streams that are not cleaned up will still be unbound from devices when the audio subsystem quits. This property was added in SDL 3.4.0.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamProperties@.
--                   The safe flavor is 'getAudioStreamPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetAudioStreamProperties@, defined at @SDL3\/SDL_audio.h 1098:46@
getAudioStreamProperties
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getAudioStreamProperties =
  Unsafe.sDL_GetAudioStreamProperties

-- | Get the properties associated with an audio stream.
--
--     The application can hang any data it wants here, but the following properties are understood by SDL:
--
--     * @'sDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN'@: if true (the default), the stream be automatically cleaned up when the audio subsystem quits. If set to false, the streams will persist beyond that. This property is ignored for streams created through @'openAudioDeviceStream'@, and will always be cleaned up. Streams that are not cleaned up will still be unbound from devices when the audio subsystem quits. This property was added in SDL 3.4.0.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamProperties@.
--                   The unsafe flavor is 'getAudioStreamProperties'
--                   .
--
--     [C declaration]: @SDL_GetAudioStreamProperties@, defined at @SDL3\/SDL_audio.h 1098:46@
getAudioStreamPropertiesSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getAudioStreamPropertiesSafe =
  Safe.sDL_GetAudioStreamProperties

-- | Query the current format of an audio stream.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamFormat@.
--                   The safe flavor is 'getAudioStreamFormatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamFormat@, defined at @SDL3\/SDL_audio.h 1119:34@
getAudioStreamFormat
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
  -> IO Bool
getAudioStreamFormat =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetAudioStreamFormat x00 x11 x22)

-- | Query the current format of an audio stream.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamFormat@.
--                   The unsafe flavor is 'getAudioStreamFormat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamFormat@, defined at @SDL3\/SDL_audio.h 1119:34@
getAudioStreamFormatSafe
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
  -> IO Bool
getAudioStreamFormatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetAudioStreamFormat x00 x11 x22)

-- | Change the input and output formats of an audio stream.
--
--     Future calls to and 'getAudioStreamAvailable' and 'getAudioStreamData' will reflect the new format, and future calls to 'putAudioStreamData' must provide data in the new input formats.
--
--     Data that was previously queued in the stream will still be operated on in the format that was current when it was added, which is to say you can put the end of a sound file in one format to a stream, change formats for the next sound file, and start putting that new data while the previous sound file is still queued, and everything will still play back correctly.
--
--     If a stream is bound to a device, then the format of the side of the stream bound to a device cannot be changed (src_spec for recording devices, dst_spec for playback devices). Attempts to make a change to this side will be ignored, but this will not report an error. The other side\'s format can be changed.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamFormat', 'setAudioStreamFrequencyRatio'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAudioStreamFormat@.
--                   The safe flavor is 'setAudioStreamFormatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamFormat@, defined at @SDL3\/SDL_audio.h 1156:34@
setAudioStreamFormat
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
  -> IO Bool
setAudioStreamFormat =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetAudioStreamFormat x00 x11 x22)

-- | Change the input and output formats of an audio stream.
--
--     Future calls to and 'getAudioStreamAvailable' and 'getAudioStreamData' will reflect the new format, and future calls to 'putAudioStreamData' must provide data in the new input formats.
--
--     Data that was previously queued in the stream will still be operated on in the format that was current when it was added, which is to say you can put the end of a sound file in one format to a stream, change formats for the next sound file, and start putting that new data while the previous sound file is still queued, and everything will still play back correctly.
--
--     If a stream is bound to a device, then the format of the side of the stream bound to a device cannot be changed (src_spec for recording devices, dst_spec for playback devices). Attempts to make a change to this side will be ignored, but this will not report an error. The other side\'s format can be changed.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamFormat', 'setAudioStreamFrequencyRatio'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAudioStreamFormat@.
--                   The unsafe flavor is 'setAudioStreamFormat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamFormat@, defined at @SDL3\/SDL_audio.h 1156:34@
setAudioStreamFormatSafe
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
  -> IO Bool
setAudioStreamFormatSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetAudioStreamFormat x00 x11 x22)

-- | Get the frequency ratio of an audio stream.
--
--     [Returns]: the frequency ratio of the stream or 0.0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamFrequencyRatio'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamFrequencyRatio@.
--                   The safe flavor is 'getAudioStreamFrequencyRatioSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamFrequencyRatio@, defined at @SDL3\/SDL_audio.h 1172:35@
getAudioStreamFrequencyRatio
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> IO Float
getAudioStreamFrequencyRatio =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetAudioStreamFrequencyRatio x00)

-- | Get the frequency ratio of an audio stream.
--
--     [Returns]: the frequency ratio of the stream or 0.0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamFrequencyRatio'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamFrequencyRatio@.
--                   The unsafe flavor is 'getAudioStreamFrequencyRatio'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamFrequencyRatio@, defined at @SDL3\/SDL_audio.h 1172:35@
getAudioStreamFrequencyRatioSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> IO Float
getAudioStreamFrequencyRatioSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetAudioStreamFrequencyRatio x00)

-- | Change the frequency ratio of an audio stream.
--
--     The frequency ratio is used to adjust the rate at which input data is consumed. Changing this effectively modifies the speed and pitch of the audio. A value greater than 1.0f will play the audio faster, and at a higher pitch. A value less than 1.0f will play the audio slower, and at a lower pitch. 1.0f means play at normal speed.
--
--     This is applied during 'getAudioStreamData', and can be continuously changed to create various effects.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamFrequencyRatio', 'setAudioStreamFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAudioStreamFrequencyRatio@.
--                   The safe flavor is 'setAudioStreamFrequencyRatioSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamFrequencyRatio@, defined at @SDL3\/SDL_audio.h 1200:34@
setAudioStreamFrequencyRatio
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream on which the frequency ratio is being changed.
  -> Float
  -- ^
  --
  --           [@ratio@]: the frequency ratio. 1.0 is normal speed. Must be between 0.01 and 100.
  -> IO Bool
setAudioStreamFrequencyRatio =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetAudioStreamFrequencyRatio x00 (Coerce.coerce x11))

-- | Change the frequency ratio of an audio stream.
--
--     The frequency ratio is used to adjust the rate at which input data is consumed. Changing this effectively modifies the speed and pitch of the audio. A value greater than 1.0f will play the audio faster, and at a higher pitch. A value less than 1.0f will play the audio slower, and at a lower pitch. 1.0f means play at normal speed.
--
--     This is applied during 'getAudioStreamData', and can be continuously changed to create various effects.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamFrequencyRatio', 'setAudioStreamFormat'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAudioStreamFrequencyRatio@.
--                   The unsafe flavor is 'setAudioStreamFrequencyRatio'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamFrequencyRatio@, defined at @SDL3\/SDL_audio.h 1200:34@
setAudioStreamFrequencyRatioSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream on which the frequency ratio is being changed.
  -> Float
  -- ^
  --
  --           [@ratio@]: the frequency ratio. 1.0 is normal speed. Must be between 0.01 and 100.
  -> IO Bool
setAudioStreamFrequencyRatioSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetAudioStreamFrequencyRatio x00 (Coerce.coerce x11))

-- | Get the gain of an audio stream.
--
--     The gain of a stream is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio streams default to a gain of 1.0f (no change in output).
--
--     [Returns]: the gain of the stream or -1.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamGain@.
--                   The safe flavor is 'getAudioStreamGainSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamGain@, defined at @SDL3\/SDL_audio.h 1221:35@
getAudioStreamGain
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> IO Float
getAudioStreamGain =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetAudioStreamGain x00)

-- | Get the gain of an audio stream.
--
--     The gain of a stream is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio streams default to a gain of 1.0f (no change in output).
--
--     [Returns]: the gain of the stream or -1.0f on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamGain@.
--                   The unsafe flavor is 'getAudioStreamGain'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamGain@, defined at @SDL3\/SDL_audio.h 1221:35@
getAudioStreamGainSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> IO Float
getAudioStreamGainSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetAudioStreamGain x00)

-- | Change the gain of an audio stream.
--
--     The gain of a stream is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio streams default to a gain of 1.0f (no change in output).
--
--     This is applied during 'getAudioStreamData', and can be continuously changed to create various effects.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAudioStreamGain@.
--                   The safe flavor is 'setAudioStreamGainSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamGain@, defined at @SDL3\/SDL_audio.h 1246:34@
setAudioStreamGain
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream on which the gain is being changed.
  -> Float
  -- ^
  --
  --           [@gain@]: the gain. 1.0f is no change, 0.0f is silence.
  -> IO Bool
setAudioStreamGain =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_SetAudioStreamGain x00 (Coerce.coerce x11))

-- | Change the gain of an audio stream.
--
--     The gain of a stream is its volume; a larger gain means a louder output, with a gain of zero being silence.
--
--     Audio streams default to a gain of 1.0f (no change in output).
--
--     This is applied during 'getAudioStreamData', and can be continuously changed to create various effects.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamGain'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAudioStreamGain@.
--                   The unsafe flavor is 'setAudioStreamGain'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamGain@, defined at @SDL3\/SDL_audio.h 1246:34@
setAudioStreamGainSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream on which the gain is being changed.
  -> Float
  -- ^
  --
  --           [@gain@]: the gain. 1.0f is no change, 0.0f is silence.
  -> IO Bool
setAudioStreamGainSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_SetAudioStreamGain x00 (Coerce.coerce x11))

-- | Get the current input channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     Audio streams default to no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [Returns]: an array of the current channel mapping, with as many elements as the current output spec\'s channels, or NULL if default. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamInputChannelMap@.
--                   The safe flavor is 'getAudioStreamInputChannelMapSafe'
--                   .
--
--     [C declaration]: @SDL_GetAudioStreamInputChannelMap@, defined at @SDL3\/SDL_audio.h 1270:35@
getAudioStreamInputChannelMap
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: On output, set to number of channels in the map. Can be NULL.
  -> IO (BG.Ptr BG.CInt)
getAudioStreamInputChannelMap =
  Unsafe.sDL_GetAudioStreamInputChannelMap

-- | Get the current input channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     Audio streams default to no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [Returns]: an array of the current channel mapping, with as many elements as the current output spec\'s channels, or NULL if default. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamInputChannelMap@.
--                   The unsafe flavor is 'getAudioStreamInputChannelMap'
--                   .
--
--     [C declaration]: @SDL_GetAudioStreamInputChannelMap@, defined at @SDL3\/SDL_audio.h 1270:35@
getAudioStreamInputChannelMapSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: On output, set to number of channels in the map. Can be NULL.
  -> IO (BG.Ptr BG.CInt)
getAudioStreamInputChannelMapSafe =
  Safe.sDL_GetAudioStreamInputChannelMap

-- | Get the current output channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     Audio streams default to no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [Returns]: an array of the current channel mapping, with as many elements as the current output spec\'s channels, or NULL if default. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamOutputChannelMap@.
--                   The safe flavor is 'getAudioStreamOutputChannelMapSafe'
--                   .
--
--     [C declaration]: @SDL_GetAudioStreamOutputChannelMap@, defined at @SDL3\/SDL_audio.h 1294:35@
getAudioStreamOutputChannelMap
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: On output, set to number of channels in the map. Can be NULL.
  -> IO (BG.Ptr BG.CInt)
getAudioStreamOutputChannelMap =
  Unsafe.sDL_GetAudioStreamOutputChannelMap

-- | Get the current output channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     Audio streams default to no remapping applied. This is represented by returning NULL, and does not signify an error.
--
--     [Returns]: an array of the current channel mapping, with as many elements as the current output spec\'s channels, or NULL if default. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamOutputChannelMap@.
--                   The unsafe flavor is 'getAudioStreamOutputChannelMap'
--                   .
--
--     [C declaration]: @SDL_GetAudioStreamOutputChannelMap@, defined at @SDL3\/SDL_audio.h 1294:35@
getAudioStreamOutputChannelMapSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to query.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: On output, set to number of channels in the map. Can be NULL.
  -> IO (BG.Ptr BG.CInt)
getAudioStreamOutputChannelMapSafe =
  Safe.sDL_GetAudioStreamOutputChannelMap

-- | Set the current input channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     The input channel map reorders data that is added to a stream via 'putAudioStreamData'. Future calls to 'putAudioStreamData' must provide data in the new channel order.
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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running. Don\'t change the stream\'s format to have a different number of channels from a different thread at the same time, though!
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAudioStreamInputChannelMap@.
--                   The safe flavor is 'setAudioStreamInputChannelMapSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamInputChannelMap@, defined at @SDL3\/SDL_audio.h 1354:34@
setAudioStreamInputChannelMap
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to change.
  -> PtrConst.PtrConst BG.CInt
  -- ^
  --
  --           [@chmap@]: the new channel map, NULL to reset to default.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: The number of channels in the map.
  -> IO Bool
setAudioStreamInputChannelMap =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetAudioStreamInputChannelMap x00 x11 (Coerce.coerce x22))

-- | Set the current input channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     The input channel map reorders data that is added to a stream via 'putAudioStreamData'. Future calls to 'putAudioStreamData' must provide data in the new channel order.
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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running. Don\'t change the stream\'s format to have a different number of channels from a different thread at the same time, though!
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAudioStreamInputChannelMap@.
--                   The unsafe flavor is 'setAudioStreamInputChannelMap'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamInputChannelMap@, defined at @SDL3\/SDL_audio.h 1354:34@
setAudioStreamInputChannelMapSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to change.
  -> PtrConst.PtrConst BG.CInt
  -- ^
  --
  --           [@chmap@]: the new channel map, NULL to reset to default.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: The number of channels in the map.
  -> IO Bool
setAudioStreamInputChannelMapSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetAudioStreamInputChannelMap x00 x11 (Coerce.coerce x22))

-- | Set the current output channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     The output channel map reorders data that is leaving a stream via 'getAudioStreamData'.
--
--     Each item in the array represents an input channel, and its value is the channel that it should be remapped to. To reverse a stereo signal\'s left and right values, you\'d have an array of @{ 1, 0 }@. It is legal to remap multiple channels to the same thing, so @{ 1, 1 }@ would duplicate the right channel to both channels of a stereo signal. An element in the channel map set to -1 instead of a valid channel will mute that channel, setting it to a silence value.
--
--     You cannot change the number of channels through a channel map, just reorder\/mute them.
--
--     The output channel map can be changed at any time, as output remapping is applied during 'getAudioStreamData'.
--
--     Audio streams default to no remapping applied. Passing a NULL channel map is legal, and turns off remapping.
--
--     SDL will copy the channel map; the caller does not have to save this array after this call.
--
--     If @count@ is not equal to the current number of channels in the audio stream\'s format, this will fail. This is a safety measure to make sure a race condition hasn\'t changed the format while this call is setting the channel map.
--
--     Unlike attempting to change the stream\'s format, the output channel map on a stream bound to a recording device is permitted to change at any time; any data added to the stream after this call will have the new mapping, but previously-added data will still have the prior mapping. When the channel map doesn\'t match the hardware\'s channel layout, SDL will convert the data before feeding it to the device for playback.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running. Don\'t change the stream\'s format to have a different number of channels from a a different thread at the same time, though!
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAudioStreamOutputChannelMap@.
--                   The safe flavor is 'setAudioStreamOutputChannelMapSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamOutputChannelMap@, defined at @SDL3\/SDL_audio.h 1412:34@
setAudioStreamOutputChannelMap
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to change.
  -> PtrConst.PtrConst BG.CInt
  -- ^
  --
  --           [@chmap@]: the new channel map, NULL to reset to default.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: The number of channels in the map.
  -> IO Bool
setAudioStreamOutputChannelMap =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetAudioStreamOutputChannelMap x00 x11 (Coerce.coerce x22))

-- | Set the current output channel map of an audio stream.
--
--     Channel maps are optional; most things do not need them, instead passing data in the [order that SDL expects](https://wiki.libsdl.org/SDL3/CategoryAudio#channel-layouts).
--
--     The output channel map reorders data that is leaving a stream via 'getAudioStreamData'.
--
--     Each item in the array represents an input channel, and its value is the channel that it should be remapped to. To reverse a stereo signal\'s left and right values, you\'d have an array of @{ 1, 0 }@. It is legal to remap multiple channels to the same thing, so @{ 1, 1 }@ would duplicate the right channel to both channels of a stereo signal. An element in the channel map set to -1 instead of a valid channel will mute that channel, setting it to a silence value.
--
--     You cannot change the number of channels through a channel map, just reorder\/mute them.
--
--     The output channel map can be changed at any time, as output remapping is applied during 'getAudioStreamData'.
--
--     Audio streams default to no remapping applied. Passing a NULL channel map is legal, and turns off remapping.
--
--     SDL will copy the channel map; the caller does not have to save this array after this call.
--
--     If @count@ is not equal to the current number of channels in the audio stream\'s format, this will fail. This is a safety measure to make sure a race condition hasn\'t changed the format while this call is setting the channel map.
--
--     Unlike attempting to change the stream\'s format, the output channel map on a stream bound to a recording device is permitted to change at any time; any data added to the stream after this call will have the new mapping, but previously-added data will still have the prior mapping. When the channel map doesn\'t match the hardware\'s channel layout, SDL will convert the data before feeding it to the device for playback.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, as it holds a stream-specific mutex while running. Don\'t change the stream\'s format to have a different number of channels from a a different thread at the same time, though!
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamInputChannelMap'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAudioStreamOutputChannelMap@.
--                   The unsafe flavor is 'setAudioStreamOutputChannelMap'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamOutputChannelMap@, defined at @SDL3\/SDL_audio.h 1412:34@
setAudioStreamOutputChannelMapSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the 'SDL_AudioStream' to change.
  -> PtrConst.PtrConst BG.CInt
  -- ^
  --
  --           [@chmap@]: the new channel map, NULL to reset to default.
  -> BG.Int32
  -- ^
  --
  --           [@count@]: The number of channels in the map.
  -> IO Bool
setAudioStreamOutputChannelMapSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetAudioStreamOutputChannelMap x00 x11 (Coerce.coerce x22))

-- | Add data to the stream.
--
--     This data must match the format\/channels\/samplerate specified in the latest call to 'setAudioStreamFormat', or the format specified when creating the stream if it hasn\'t been changed.
--
--     Note that this call simply copies the unconverted data for later. This is different than SDL2, where data was converted during the Put call and the Get call would just dequeue the previously-converted data.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.2.0
--
--     [See also]: 'clearAudioStream', 'flushAudioStream', 'getAudioStreamData', 'getAudioStreamQueued'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PutAudioStreamData@.
--                   The safe flavor is 'putAudioStreamDataSafe'
--                   : runs a registered put callback synchronously on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PutAudioStreamData@, defined at @SDL3\/SDL_audio.h 1442:34@
putAudioStreamData
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio data is being added to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@buf@]: a pointer to the audio data to add.
  -> BG.Int32
  -- ^
  --
  --           [@len@]: the number of bytes to write to the stream.
  -> IO Bool
putAudioStreamData =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_PutAudioStreamData x00 x11 (Coerce.coerce x22))

-- | Add data to the stream.
--
--     This data must match the format\/channels\/samplerate specified in the latest call to 'setAudioStreamFormat', or the format specified when creating the stream if it hasn\'t been changed.
--
--     Note that this call simply copies the unconverted data for later. This is different than SDL2, where data was converted during the Put call and the Get call would just dequeue the previously-converted data.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.2.0
--
--     [See also]: 'clearAudioStream', 'flushAudioStream', 'getAudioStreamData', 'getAudioStreamQueued'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PutAudioStreamData@.
--                   The unsafe flavor is 'putAudioStreamData'
--                   : runs a registered put callback synchronously on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PutAudioStreamData@, defined at @SDL3\/SDL_audio.h 1442:34@
putAudioStreamDataSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio data is being added to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@buf@]: a pointer to the audio data to add.
  -> BG.Int32
  -- ^
  --
  --           [@len@]: the number of bytes to write to the stream.
  -> IO Bool
putAudioStreamDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_PutAudioStreamData x00 x11 (Coerce.coerce x22))

-- | Add external data to an audio stream without copying it.
--
--     Unlike @'putAudioStreamData'@, this function does not make a copy of the provided data, instead storing the provided pointer. This means that the put operation does not need to allocate and copy the data, but the original data must remain available until the stream is done with it, either by being read from the stream in its entirety, or a call to @'clearAudioStream'@ or @'destroyAudioStream'@.
--
--     The data must match the format\/channels\/samplerate specified in the latest call to 'setAudioStreamFormat', or the format specified when creating the stream if it hasn\'t been changed.
--
--     An optional callback may be provided, which is called when the stream no longer needs the data. Once this callback fires, the stream will not access the data again. This callback will fire for any reason the data is no longer needed, including clearing or destroying the stream.
--
--     Note that there is still an allocation to store tracking information, so this function is more efficient for larger blocks of data. If you\'re planning to put a few samples at a time, it will be more efficient to use @'putAudioStreamData'@, which allocates and buffers in blocks.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.4.0
--
--     [See also]: 'clearAudioStream', 'flushAudioStream', 'getAudioStreamData', 'getAudioStreamQueued'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PutAudioStreamDataNoCopy@.
--                   The safe flavor is 'putAudioStreamDataNoCopySafe'
--                   : completion callback is deferred; see the curated stream teardown entries.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PutAudioStreamDataNoCopy@, defined at @SDL3\/SDL_audio.h 1519:34@
putAudioStreamDataNoCopy
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio data is being added to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@buf@]: a pointer to the audio data to add.
  -> BG.Int32
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
  -> IO Bool
putAudioStreamDataNoCopy =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_PutAudioStreamDataNoCopy x00 x11 (Coerce.coerce x22) x33 x44)

-- | Add external data to an audio stream without copying it.
--
--     Unlike @'putAudioStreamData'@, this function does not make a copy of the provided data, instead storing the provided pointer. This means that the put operation does not need to allocate and copy the data, but the original data must remain available until the stream is done with it, either by being read from the stream in its entirety, or a call to @'clearAudioStream'@ or @'destroyAudioStream'@.
--
--     The data must match the format\/channels\/samplerate specified in the latest call to 'setAudioStreamFormat', or the format specified when creating the stream if it hasn\'t been changed.
--
--     An optional callback may be provided, which is called when the stream no longer needs the data. Once this callback fires, the stream will not access the data again. This callback will fire for any reason the data is no longer needed, including clearing or destroying the stream.
--
--     Note that there is still an allocation to store tracking information, so this function is more efficient for larger blocks of data. If you\'re planning to put a few samples at a time, it will be more efficient to use @'putAudioStreamData'@, which allocates and buffers in blocks.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.4.0
--
--     [See also]: 'clearAudioStream', 'flushAudioStream', 'getAudioStreamData', 'getAudioStreamQueued'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PutAudioStreamDataNoCopy@.
--                   The unsafe flavor is 'putAudioStreamDataNoCopy'
--                   : completion callback is deferred; see the curated stream teardown entries.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PutAudioStreamDataNoCopy@, defined at @SDL3\/SDL_audio.h 1519:34@
putAudioStreamDataNoCopySafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio data is being added to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@buf@]: a pointer to the audio data to add.
  -> BG.Int32
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
  -> IO Bool
putAudioStreamDataNoCopySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_PutAudioStreamDataNoCopy x00 x11 (Coerce.coerce x22) x33 x44)

-- | Add data to the stream with each channel in a separate array.
--
--     This data must match the format\/channels\/samplerate specified in the latest call to 'setAudioStreamFormat', or the format specified when creating the stream if it hasn\'t been changed.
--
--     The data will be interleaved and queued. Note that 'SDL_AudioStream' only operates on interleaved data, so this is simply a convenience function for easily queueing data from sources that provide separate arrays. There is no equivalent function to retrieve planar data.
--
--     The arrays in @channel_buffers@ are ordered as they are to be interleaved; the first array will be the first sample in the interleaved data. Any individual array may be NULL; in this case, silence will be interleaved for that channel.
--
--     @num_channels@ specifies how many arrays are in @channel_buffers@. This can be used as a safety to prevent overflow, in case the stream format has changed elsewhere. If more channels are specified than the current input spec, they are ignored. If less channels are specified, the missing arrays are treated as if they are NULL (silence is written to those channels). If the count is -1, SDL will assume the array count matches the current input spec.
--
--     Note that @num_samples@ is the number of /samples per array/. This can also be thought of as the number of /sample frames/ to be queued. A value of 1 with stereo arrays will queue two samples to the stream. This is different than 'putAudioStreamData', which wants the size of a single array in bytes.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.4.0
--
--     [See also]: 'clearAudioStream', 'flushAudioStream', 'getAudioStreamData', 'getAudioStreamQueued'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PutAudioStreamPlanarData@.
--                   The safe flavor is 'putAudioStreamPlanarDataSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PutAudioStreamPlanarData@, defined at @SDL3\/SDL_audio.h 1572:34@
putAudioStreamPlanarData
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio data is being added to.
  -> PtrConst.PtrConst (PtrConst.PtrConst BG.Void)
  -- ^
  --
  --           [@channel_buffers@]: a pointer to an array of arrays, one array per channel.
  -> BG.Int32
  -- ^
  --
  --           [@num_channels@]: the number of arrays in @channel_buffers@ or -1.
  -> BG.Int32
  -- ^
  --
  --           [@num_samples@]: the number of /samples/ per array to write to the stream.
  -> IO Bool
putAudioStreamPlanarData =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Unsafe.sDL_PutAudioStreamPlanarData x00 x11 (Coerce.coerce x22) (Coerce.coerce x33))

-- | Add data to the stream with each channel in a separate array.
--
--     This data must match the format\/channels\/samplerate specified in the latest call to 'setAudioStreamFormat', or the format specified when creating the stream if it hasn\'t been changed.
--
--     The data will be interleaved and queued. Note that 'SDL_AudioStream' only operates on interleaved data, so this is simply a convenience function for easily queueing data from sources that provide separate arrays. There is no equivalent function to retrieve planar data.
--
--     The arrays in @channel_buffers@ are ordered as they are to be interleaved; the first array will be the first sample in the interleaved data. Any individual array may be NULL; in this case, silence will be interleaved for that channel.
--
--     @num_channels@ specifies how many arrays are in @channel_buffers@. This can be used as a safety to prevent overflow, in case the stream format has changed elsewhere. If more channels are specified than the current input spec, they are ignored. If less channels are specified, the missing arrays are treated as if they are NULL (silence is written to those channels). If the count is -1, SDL will assume the array count matches the current input spec.
--
--     Note that @num_samples@ is the number of /samples per array/. This can also be thought of as the number of /sample frames/ to be queued. A value of 1 with stereo arrays will queue two samples to the stream. This is different than 'putAudioStreamData', which wants the size of a single array in bytes.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.4.0
--
--     [See also]: 'clearAudioStream', 'flushAudioStream', 'getAudioStreamData', 'getAudioStreamQueued'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PutAudioStreamPlanarData@.
--                   The unsafe flavor is 'putAudioStreamPlanarData'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PutAudioStreamPlanarData@, defined at @SDL3\/SDL_audio.h 1572:34@
putAudioStreamPlanarDataSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio data is being added to.
  -> PtrConst.PtrConst (PtrConst.PtrConst BG.Void)
  -- ^
  --
  --           [@channel_buffers@]: a pointer to an array of arrays, one array per channel.
  -> BG.Int32
  -- ^
  --
  --           [@num_channels@]: the number of arrays in @channel_buffers@ or -1.
  -> BG.Int32
  -- ^
  --
  --           [@num_samples@]: the number of /samples/ per array to write to the stream.
  -> IO Bool
putAudioStreamPlanarDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap
            CBool.toBool
            (Safe.sDL_PutAudioStreamPlanarData x00 x11 (Coerce.coerce x22) (Coerce.coerce x33))

-- | Get converted\/resampled data from the stream.
--
--     The input\/output data format\/channels\/samplerate is specified when creating the stream, and can be changed after creation by calling 'setAudioStreamFormat'.
--
--     Note that any conversion and resampling necessary is done during this call, and 'putAudioStreamData' simply queues unconverted data for later. This is different than SDL2, where that work was done while inputting new data to the stream and requesting the output just copied the converted data.
--
--     [Returns]: the number of bytes read from the stream or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.2.0
--
--     [See also]: 'clearAudioStream', 'getAudioStreamAvailable', 'putAudioStreamData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamData@.
--                   The safe flavor is 'getAudioStreamDataSafe'
--                   : runs a registered get callback synchronously on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamData@, defined at @SDL3\/SDL_audio.h 1602:33@
getAudioStreamData
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio is being requested from.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@buf@]: a buffer to fill with audio data.
  -> BG.Int32
  -- ^
  --
  --           [@len@]: the maximum number of bytes to fill.
  -> IO BG.Int32
getAudioStreamData =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_GetAudioStreamData x00 x11 (Coerce.coerce x22))

-- | Get converted\/resampled data from the stream.
--
--     The input\/output data format\/channels\/samplerate is specified when creating the stream, and can be changed after creation by calling 'setAudioStreamFormat'.
--
--     Note that any conversion and resampling necessary is done during this call, and 'putAudioStreamData' simply queues unconverted data for later. This is different than SDL2, where that work was done while inputting new data to the stream and requesting the output just copied the converted data.
--
--     [Returns]: the number of bytes read from the stream or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but if the stream has a callback set, the caller might need to manage extra locking.
--
--     @since 3.2.0
--
--     [See also]: 'clearAudioStream', 'getAudioStreamAvailable', 'putAudioStreamData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamData@.
--                   The unsafe flavor is 'getAudioStreamData'
--                   : runs a registered get callback synchronously on the calling thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamData@, defined at @SDL3\/SDL_audio.h 1602:33@
getAudioStreamDataSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the stream the audio is being requested from.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@buf@]: a buffer to fill with audio data.
  -> BG.Int32
  -- ^
  --
  --           [@len@]: the maximum number of bytes to fill.
  -> IO BG.Int32
getAudioStreamDataSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_GetAudioStreamData x00 x11 (Coerce.coerce x22))

-- | Get the number of converted\/resampled bytes available.
--
--     The stream may be buffering data behind the scenes until it has enough to resample correctly, so this number might be lower than what you expect, or even be zero. Add more data or flush the stream if you need the data now.
--
--     If the stream has so much data that it would overflow an int, the return value is clamped to a maximum value, but no queued data is lost; if there are gigabytes of data queued, the app might need to read some of it with 'getAudioStreamData' before this function\'s return value is no longer clamped.
--
--     [Returns]: the number of converted\/resampled bytes available or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamData', 'putAudioStreamData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamAvailable@.
--                   The safe flavor is 'getAudioStreamAvailableSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamAvailable@, defined at @SDL3\/SDL_audio.h 1628:33@
getAudioStreamAvailable
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to query.
  -> IO BG.Int32
getAudioStreamAvailable =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetAudioStreamAvailable x00)

-- | Get the number of converted\/resampled bytes available.
--
--     The stream may be buffering data behind the scenes until it has enough to resample correctly, so this number might be lower than what you expect, or even be zero. Add more data or flush the stream if you need the data now.
--
--     If the stream has so much data that it would overflow an int, the return value is clamped to a maximum value, but no queued data is lost; if there are gigabytes of data queued, the app might need to read some of it with 'getAudioStreamData' before this function\'s return value is no longer clamped.
--
--     [Returns]: the number of converted\/resampled bytes available or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamData', 'putAudioStreamData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamAvailable@.
--                   The unsafe flavor is 'getAudioStreamAvailable'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamAvailable@, defined at @SDL3\/SDL_audio.h 1628:33@
getAudioStreamAvailableSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to query.
  -> IO BG.Int32
getAudioStreamAvailableSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetAudioStreamAvailable x00)

-- | Get the number of bytes currently queued.
--
--     This is the number of bytes put into a stream as input, not the number that can be retrieved as output. Because of several details, it\'s not possible to calculate one number directly from the other. If you need to know how much usable data can be retrieved right now, you should use @'getAudioStreamAvailable'@ and not this function.
--
--     Note that audio streams can change their input format at any time, even if there is still data queued in a different format, so the returned byte count will not necessarily match the number of /sample frames/ available. Users of this API should be aware of format changes they make when feeding a stream and plan accordingly.
--
--     Queued data is not converted until it is consumed by 'getAudioStreamData', so this value should be representative of the exact data that was put into the stream.
--
--     If the stream has so much data that it would overflow an int, the return value is clamped to a maximum value, but no queued data is lost; if there are gigabytes of data queued, the app might need to read some of it with 'getAudioStreamData' before this function\'s return value is no longer clamped.
--
--     [Returns]: the number of bytes queued or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'putAudioStreamData', 'clearAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioStreamQueued@.
--                   The safe flavor is 'getAudioStreamQueuedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamQueued@, defined at @SDL3\/SDL_audio.h 1667:33@
getAudioStreamQueued
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to query.
  -> IO BG.Int32
getAudioStreamQueued =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetAudioStreamQueued x00)

-- | Get the number of bytes currently queued.
--
--     This is the number of bytes put into a stream as input, not the number that can be retrieved as output. Because of several details, it\'s not possible to calculate one number directly from the other. If you need to know how much usable data can be retrieved right now, you should use @'getAudioStreamAvailable'@ and not this function.
--
--     Note that audio streams can change their input format at any time, even if there is still data queued in a different format, so the returned byte count will not necessarily match the number of /sample frames/ available. Users of this API should be aware of format changes they make when feeding a stream and plan accordingly.
--
--     Queued data is not converted until it is consumed by 'getAudioStreamData', so this value should be representative of the exact data that was put into the stream.
--
--     If the stream has so much data that it would overflow an int, the return value is clamped to a maximum value, but no queued data is lost; if there are gigabytes of data queued, the app might need to read some of it with 'getAudioStreamData' before this function\'s return value is no longer clamped.
--
--     [Returns]: the number of bytes queued or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'putAudioStreamData', 'clearAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioStreamQueued@.
--                   The unsafe flavor is 'getAudioStreamQueued'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetAudioStreamQueued@, defined at @SDL3\/SDL_audio.h 1667:33@
getAudioStreamQueuedSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to query.
  -> IO BG.Int32
getAudioStreamQueuedSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetAudioStreamQueued x00)

-- | Tell the stream that you\'re done sending data, and anything being buffered should be converted\/resampled and made available immediately.
--
--     It is legal to add more data to a stream after flushing, but there may be audio gaps in the output. Generally this is intended to signal the end of input, so the complete output becomes available.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'putAudioStreamData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_FlushAudioStream@.
--                   The safe flavor is 'flushAudioStreamSafe'
--                   : may invoke a pending data-complete callback synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushAudioStream@, defined at @SDL3\/SDL_audio.h 1688:34@
flushAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to flush.
  -> IO Bool
flushAudioStream =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_FlushAudioStream x00)

-- | Tell the stream that you\'re done sending data, and anything being buffered should be converted\/resampled and made available immediately.
--
--     It is legal to add more data to a stream after flushing, but there may be audio gaps in the output. Generally this is intended to signal the end of input, so the complete output becomes available.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'putAudioStreamData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FlushAudioStream@.
--                   The unsafe flavor is 'flushAudioStream'
--                   : may invoke a pending data-complete callback synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushAudioStream@, defined at @SDL3\/SDL_audio.h 1688:34@
flushAudioStreamSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to flush.
  -> IO Bool
flushAudioStreamSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_FlushAudioStream x00)

-- | Clear any pending data in the stream.
--
--     This drops any queued data, so there will be nothing to read from the stream until more is added.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamAvailable', 'getAudioStreamData', 'getAudioStreamQueued', 'putAudioStreamData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ClearAudioStream@.
--                   The safe flavor is 'clearAudioStreamSafe'
--                   : may invoke a pending data-complete callback synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearAudioStream@, defined at @SDL3\/SDL_audio.h 1709:34@
clearAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to clear.
  -> IO Bool
clearAudioStream =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_ClearAudioStream x00)

-- | Clear any pending data in the stream.
--
--     This drops any queued data, so there will be nothing to read from the stream until more is added.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamAvailable', 'getAudioStreamData', 'getAudioStreamQueued', 'putAudioStreamData'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ClearAudioStream@.
--                   The unsafe flavor is 'clearAudioStream'
--                   : may invoke a pending data-complete callback synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ClearAudioStream@, defined at @SDL3\/SDL_audio.h 1709:34@
clearAudioStreamSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to clear.
  -> IO Bool
clearAudioStreamSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_ClearAudioStream x00)

-- | Use this function to pause audio playback on the audio device associated with an audio stream.
--
--     This function pauses audio processing for a given device. Any bound audio streams will not progress, and no audio will be generated. Pausing one device does not prevent other unpaused devices from running.
--
--     Pausing a device can be useful to halt all audio without unbinding all the audio streams. This might be useful while a game is paused, or a level is loading, etc.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'resumeAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_PauseAudioStreamDevice@.
--                   The safe flavor is 'pauseAudioStreamDeviceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PauseAudioStreamDevice@, defined at @SDL3\/SDL_audio.h 1733:34@
pauseAudioStreamDevice
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream associated with the audio device to pause.
  -> IO Bool
pauseAudioStreamDevice =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_PauseAudioStreamDevice x00)

-- | Use this function to pause audio playback on the audio device associated with an audio stream.
--
--     This function pauses audio processing for a given device. Any bound audio streams will not progress, and no audio will be generated. Pausing one device does not prevent other unpaused devices from running.
--
--     Pausing a device can be useful to halt all audio without unbinding all the audio streams. This might be useful while a game is paused, or a level is loading, etc.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'resumeAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_PauseAudioStreamDevice@.
--                   The unsafe flavor is 'pauseAudioStreamDevice'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_PauseAudioStreamDevice@, defined at @SDL3\/SDL_audio.h 1733:34@
pauseAudioStreamDeviceSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream associated with the audio device to pause.
  -> IO Bool
pauseAudioStreamDeviceSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_PauseAudioStreamDevice x00)

-- | Use this function to unpause audio playback on the audio device associated with an audio stream.
--
--     This function unpauses audio processing for a given device that has previously been paused. Once unpaused, any bound audio streams will begin to progress again, and audio can be generated.
--
--     'openAudioDeviceStream' opens audio devices in a paused state, so this function call is required for audio playback to begin on such devices.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pauseAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ResumeAudioStreamDevice@.
--                   The safe flavor is 'resumeAudioStreamDeviceSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ResumeAudioStreamDevice@, defined at @SDL3\/SDL_audio.h 1756:34@
resumeAudioStreamDevice
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream associated with the audio device to resume.
  -> IO Bool
resumeAudioStreamDevice =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_ResumeAudioStreamDevice x00)

-- | Use this function to unpause audio playback on the audio device associated with an audio stream.
--
--     This function unpauses audio processing for a given device that has previously been paused. Once unpaused, any bound audio streams will begin to progress again, and audio can be generated.
--
--     'openAudioDeviceStream' opens audio devices in a paused state, so this function call is required for audio playback to begin on such devices.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'pauseAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ResumeAudioStreamDevice@.
--                   The unsafe flavor is 'resumeAudioStreamDevice'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ResumeAudioStreamDevice@, defined at @SDL3\/SDL_audio.h 1756:34@
resumeAudioStreamDeviceSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream associated with the audio device to resume.
  -> IO Bool
resumeAudioStreamDeviceSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_ResumeAudioStreamDevice x00)

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
--     [See also]: 'pauseAudioStreamDevice', 'resumeAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_AudioStreamDevicePaused@.
--                   The safe flavor is 'audioStreamDevicePausedSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AudioStreamDevicePaused@, defined at @SDL3\/SDL_audio.h 1775:34@
audioStreamDevicePaused
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream associated with the audio device to query.
  -> IO Bool
audioStreamDevicePaused =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_AudioStreamDevicePaused x00)

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
--     [See also]: 'pauseAudioStreamDevice', 'resumeAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_AudioStreamDevicePaused@.
--                   The unsafe flavor is 'audioStreamDevicePaused'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_AudioStreamDevicePaused@, defined at @SDL3\/SDL_audio.h 1775:34@
audioStreamDevicePausedSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream associated with the audio device to query.
  -> IO Bool
audioStreamDevicePausedSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_AudioStreamDevicePaused x00)

-- | Lock an audio stream for serialized access.
--
--     Each 'SDL_AudioStream' has an internal mutex it uses to protect its data structures from threading conflicts. This function allows an app to lock that mutex, which could be useful if registering callbacks on this stream.
--
--     One does not need to lock a stream to use in it most cases, as the stream manages this lock internally. However, this lock is held during callbacks, which may run from arbitrary threads at any time, so if an app needs to protect shared data during those callbacks, locking the stream guarantees that the callback is not running while the lock is held.
--
--     As this is just a wrapper over 'SDL3.Sys.Mutex.lockMutex' for an internal lock; it has all the same attributes (recursive locks are allowed, etc).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'unlockAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LockAudioStream@.
--                   The safe flavor is 'lockAudioStreamSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockAudioStream@, defined at @SDL3\/SDL_audio.h 1804:34@
lockAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to lock.
  -> IO Bool
lockAudioStream =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_LockAudioStream x00)

-- | Lock an audio stream for serialized access.
--
--     Each 'SDL_AudioStream' has an internal mutex it uses to protect its data structures from threading conflicts. This function allows an app to lock that mutex, which could be useful if registering callbacks on this stream.
--
--     One does not need to lock a stream to use in it most cases, as the stream manages this lock internally. However, this lock is held during callbacks, which may run from arbitrary threads at any time, so if an app needs to protect shared data during those callbacks, locking the stream guarantees that the callback is not running while the lock is held.
--
--     As this is just a wrapper over 'SDL3.Sys.Mutex.lockMutex' for an internal lock; it has all the same attributes (recursive locks are allowed, etc).
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'unlockAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LockAudioStream@.
--                   The unsafe flavor is 'lockAudioStream'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LockAudioStream@, defined at @SDL3\/SDL_audio.h 1804:34@
lockAudioStreamSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to lock.
  -> IO Bool
lockAudioStreamSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_LockAudioStream x00)

-- | Unlock an audio stream for serialized access.
--
--     This unlocks an audio stream after a call to 'lockAudioStream'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: You should only call this from the same thread that previously called 'lockAudioStream'.
--
--     @since 3.2.0
--
--     [See also]: 'lockAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_UnlockAudioStream@.
--                   The safe flavor is 'unlockAudioStreamSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UnlockAudioStream@, defined at @SDL3\/SDL_audio.h 1823:34@
unlockAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to unlock.
  -> IO Bool
unlockAudioStream =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_UnlockAudioStream x00)

-- | Unlock an audio stream for serialized access.
--
--     This unlocks an audio stream after a call to 'lockAudioStream'.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: You should only call this from the same thread that previously called 'lockAudioStream'.
--
--     @since 3.2.0
--
--     [See also]: 'lockAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_UnlockAudioStream@.
--                   The unsafe flavor is 'unlockAudioStream'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_UnlockAudioStream@, defined at @SDL3\/SDL_audio.h 1823:34@
unlockAudioStreamSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to unlock.
  -> IO Bool
unlockAudioStreamSafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_UnlockAudioStream x00)

-- | Set a callback that runs when data is requested from an audio stream.
--
--     This callback is called /before/ data is obtained from the stream, giving the callback the chance to add more on-demand.
--
--     The callback can (optionally) call @'putAudioStreamData'@ to add more audio to the stream during this call; if needed, the request that triggered this callback will obtain the new data immediately.
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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information. This only fails if @stream@ is NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamPutCallback'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAudioStreamGetCallback@.
--                   The safe flavor is 'setAudioStreamGetCallbackSafe'
--                   : registration; fires on the audio thread and synchronously during SDL_GetAudioStreamData.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamGetCallback@, defined at @SDL3\/SDL_audio.h 1911:34@
setAudioStreamGetCallback
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
  -> IO Bool
setAudioStreamGetCallback =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetAudioStreamGetCallback x00 x11 x22)

-- | Set a callback that runs when data is requested from an audio stream.
--
--     This callback is called /before/ data is obtained from the stream, giving the callback the chance to add more on-demand.
--
--     The callback can (optionally) call @'putAudioStreamData'@ to add more audio to the stream during this call; if needed, the request that triggered this callback will obtain the new data immediately.
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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information. This only fails if @stream@ is NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamPutCallback'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAudioStreamGetCallback@.
--                   The unsafe flavor is 'setAudioStreamGetCallback'
--                   : registration; fires on the audio thread and synchronously during SDL_GetAudioStreamData.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamGetCallback@, defined at @SDL3\/SDL_audio.h 1911:34@
setAudioStreamGetCallbackSafe
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
  -> IO Bool
setAudioStreamGetCallbackSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetAudioStreamGetCallback x00 x11 x22)

-- | Set a callback that runs when data is added to an audio stream.
--
--     This callback is called /after/ the data is added to the stream, giving the callback the chance to obtain it immediately.
--
--     The callback can (optionally) call @'getAudioStreamData'@ to obtain audio from the stream during this call.
--
--     The callback\'s @additional_amount@ argument is how many bytes of /converted/ data (in the stream\'s output format) was provided by the caller, although this may underestimate a little for safety. This value might be less than what is currently available in the stream, if data was already there, and might be less than the caller provided if the stream needs to keep a buffer to aid in resampling. Which means the callback may be provided with zero bytes, and a different amount on each call.
--
--     The callback may call 'getAudioStreamAvailable' to see the total amount currently available to read from the stream, instead of the total provided by the current call.
--
--     The callback is not required to obtain all data. It is allowed to read less or none at all. Anything not read now simply remains in the stream for later access.
--
--     Clearing or flushing an audio stream does not call this callback.
--
--     This function obtains the stream\'s lock, which means any existing callback (get or put) in progress will finish running before setting the new callback.
--
--     Setting a NULL function turns off the callback.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information. This only fails if @stream@ is NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamGetCallback'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAudioStreamPutCallback@.
--                   The safe flavor is 'setAudioStreamPutCallbackSafe'
--                   : registration; fires on the audio thread and synchronously during SDL_PutAudioStreamData.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamPutCallback@, defined at @SDL3\/SDL_audio.h 1960:34@
setAudioStreamPutCallback
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
  -> IO Bool
setAudioStreamPutCallback =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetAudioStreamPutCallback x00 x11 x22)

-- | Set a callback that runs when data is added to an audio stream.
--
--     This callback is called /after/ the data is added to the stream, giving the callback the chance to obtain it immediately.
--
--     The callback can (optionally) call @'getAudioStreamData'@ to obtain audio from the stream during this call.
--
--     The callback\'s @additional_amount@ argument is how many bytes of /converted/ data (in the stream\'s output format) was provided by the caller, although this may underestimate a little for safety. This value might be less than what is currently available in the stream, if data was already there, and might be less than the caller provided if the stream needs to keep a buffer to aid in resampling. Which means the callback may be provided with zero bytes, and a different amount on each call.
--
--     The callback may call 'getAudioStreamAvailable' to see the total amount currently available to read from the stream, instead of the total provided by the current call.
--
--     The callback is not required to obtain all data. It is allowed to read less or none at all. Anything not read now simply remains in the stream for later access.
--
--     Clearing or flushing an audio stream does not call this callback.
--
--     This function obtains the stream\'s lock, which means any existing callback (get or put) in progress will finish running before setting the new callback.
--
--     Setting a NULL function turns off the callback.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information. This only fails if @stream@ is NULL.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'setAudioStreamGetCallback'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAudioStreamPutCallback@.
--                   The unsafe flavor is 'setAudioStreamPutCallback'
--                   : registration; fires on the audio thread and synchronously during SDL_PutAudioStreamData.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioStreamPutCallback@, defined at @SDL3\/SDL_audio.h 1960:34@
setAudioStreamPutCallbackSafe
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
  -> IO Bool
setAudioStreamPutCallbackSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetAudioStreamPutCallback x00 x11 x22)

-- | Free an audio stream.
--
--     This will release all allocated data, including any audio that is still queued. You do not need to manually clear the stream first.
--
--     If this stream was bound to an audio device, it is unbound during this call. If this stream was created with 'openAudioDeviceStream', the audio device that was opened alongside this stream\'s creation will be closed, too.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_DestroyAudioStream@.
--                   The safe flavor is 'destroyAudioStreamSafe'
--                   : may invoke a pending data-complete callback synchronously.
--
--     [C declaration]: @SDL_DestroyAudioStream@, defined at @SDL3\/SDL_audio.h 1982:34@
destroyAudioStream
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to destroy.
  -> IO ()
destroyAudioStream = Unsafe.sDL_DestroyAudioStream

-- | Free an audio stream.
--
--     This will release all allocated data, including any audio that is still queued. You do not need to manually clear the stream first.
--
--     If this stream was bound to an audio device, it is unbound during this call. If this stream was created with 'openAudioDeviceStream', the audio device that was opened alongside this stream\'s creation will be closed, too.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'createAudioStream'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_DestroyAudioStream@.
--                   The unsafe flavor is 'destroyAudioStream'
--                   : may invoke a pending data-complete callback synchronously.
--
--     [C declaration]: @SDL_DestroyAudioStream@, defined at @SDL3\/SDL_audio.h 1982:34@
destroyAudioStreamSafe
  :: BG.Ptr SDL_AudioStream
  -- ^
  --
  --           [@stream@]: the audio stream to destroy.
  -> IO ()
destroyAudioStreamSafe = Safe.sDL_DestroyAudioStream

-- | Convenience function for straightforward audio init for the common case.
--
--     If all your app intends to do is provide a single source of PCM audio, this function allows you to do all your audio setup in a single call.
--
--     This is also intended to be a clean means to migrate apps from SDL2.
--
--     This function will open an audio device, create a stream and bind it. Unlike other methods of setup, the audio device will be closed when this stream is destroyed, so the app can treat the returned 'SDL_AudioStream' as the only object needed to manage audio playback.
--
--     Also unlike other functions, the audio device begins paused. This is to map more closely to SDL2-style behavior, since there is no extra step here to bind a stream to begin audio flowing. The audio device should be resumed with @'resumeAudioStreamDevice'@.
--
--     This function works with both playback and recording devices.
--
--     The @spec@ parameter represents the app\'s side of the audio stream. That is, for recording audio, this will be the output format, and for playing audio, this will be the input format. If spec is NULL, the system will choose the format, and the app can use @'getAudioStreamFormat'@ to obtain this information later.
--
--     If you don\'t care about opening a specific audio device, you can (and probably /should/), use SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK for playback and SDL_AUDIO_DEVICE_DEFAULT_RECORDING for recording.
--
--     One can optionally provide a callback function; if NULL, the app is expected to queue audio data for playback (or unqueue audio data if capturing). Otherwise, the callback will begin to fire once the device is unpaused.
--
--     Destroying the returned stream with 'destroyAudioStream' will also close the audio device associated with this stream.
--
--     [Returns]: an audio stream on success, ready to use, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. When done with this stream, call 'destroyAudioStream' to free resources and close the device.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamDevice', 'resumeAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenAudioDeviceStream@.
--                   The safe flavor is 'openAudioDeviceStreamSafe'
--                   : callback is optional (NULL bypass) and fires on the audio thread.
--
--     [C declaration]: @SDL_OpenAudioDeviceStream@, defined at @SDL3\/SDL_audio.h 2045:47@
openAudioDeviceStream
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
  --           [@callback@]: a callback where the app will provide new data for playback, or receive new data for recording. Can be NULL, in which case the app will need to call 'putAudioStreamData' or 'getAudioStreamData' as necessary.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: app-controlled pointer passed to callback. Can be NULL. Ignored if callback is NULL.
  -> IO (BG.Ptr SDL_AudioStream)
openAudioDeviceStream =
  Unsafe.sDL_OpenAudioDeviceStream

-- | Convenience function for straightforward audio init for the common case.
--
--     If all your app intends to do is provide a single source of PCM audio, this function allows you to do all your audio setup in a single call.
--
--     This is also intended to be a clean means to migrate apps from SDL2.
--
--     This function will open an audio device, create a stream and bind it. Unlike other methods of setup, the audio device will be closed when this stream is destroyed, so the app can treat the returned 'SDL_AudioStream' as the only object needed to manage audio playback.
--
--     Also unlike other functions, the audio device begins paused. This is to map more closely to SDL2-style behavior, since there is no extra step here to bind a stream to begin audio flowing. The audio device should be resumed with @'resumeAudioStreamDevice'@.
--
--     This function works with both playback and recording devices.
--
--     The @spec@ parameter represents the app\'s side of the audio stream. That is, for recording audio, this will be the output format, and for playing audio, this will be the input format. If spec is NULL, the system will choose the format, and the app can use @'getAudioStreamFormat'@ to obtain this information later.
--
--     If you don\'t care about opening a specific audio device, you can (and probably /should/), use SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK for playback and SDL_AUDIO_DEVICE_DEFAULT_RECORDING for recording.
--
--     One can optionally provide a callback function; if NULL, the app is expected to queue audio data for playback (or unqueue audio data if capturing). Otherwise, the callback will begin to fire once the device is unpaused.
--
--     Destroying the returned stream with 'destroyAudioStream' will also close the audio device associated with this stream.
--
--     [Returns]: an audio stream on success, ready to use, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. When done with this stream, call 'destroyAudioStream' to free resources and close the device.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getAudioStreamDevice', 'resumeAudioStreamDevice'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenAudioDeviceStream@.
--                   The unsafe flavor is 'openAudioDeviceStream'
--                   : callback is optional (NULL bypass) and fires on the audio thread.
--
--     [C declaration]: @SDL_OpenAudioDeviceStream@, defined at @SDL3\/SDL_audio.h 2045:47@
openAudioDeviceStreamSafe
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
  --           [@callback@]: a callback where the app will provide new data for playback, or receive new data for recording. Can be NULL, in which case the app will need to call 'putAudioStreamData' or 'getAudioStreamData' as necessary.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: app-controlled pointer passed to callback. Can be NULL. Ignored if callback is NULL.
  -> IO (BG.Ptr SDL_AudioStream)
openAudioDeviceStreamSafe =
  Safe.sDL_OpenAudioDeviceStream

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SetAudioPostmixCallback@.
--                   The safe flavor is 'setAudioPostmixCallbackSafe'
--                   : registration; fires on the audio thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioPostmixCallback@, defined at @SDL3\/SDL_audio.h 2136:34@
setAudioPostmixCallback
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
  -> IO Bool
setAudioPostmixCallback =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SetAudioPostmixCallback x00 x11 x22)

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
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SetAudioPostmixCallback@.
--                   The unsafe flavor is 'setAudioPostmixCallback'
--                   : registration; fires on the audio thread.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SetAudioPostmixCallback@, defined at @SDL3\/SDL_audio.h 2136:34@
setAudioPostmixCallbackSafe
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
  -> IO Bool
setAudioPostmixCallbackSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SetAudioPostmixCallback x00 x11 x22)

-- | Load the audio data of a WAVE file into memory.
--
--     Loading a WAVE file requires @src@, @spec@, @audio_buf@ and @audio_len@ to be valid pointers. The entire data portion of the file is then loaded into memory and decoded if necessary.
--
--     Supported formats are RIFF WAVE files with the formats PCM (8, 16, 24, and 32 bits), IEEE Float (32 bits), Microsoft ADPCM and IMA ADPCM (4 bits), and A-law and mu-law (8 bits). Other formats are currently unsupported and cause an error.
--
--     If this function succeeds, the return value is zero and the pointer to the audio data allocated by the function is written to @audio_buf@ and its length in bytes to @audio_len@. The 'SDL_AudioSpec' members @freq@, @channels@, and @format@ are set to the values of the audio data in the buffer.
--
--     It\'s necessary to use 'SDL3.Sys.Stdinc.free' to free the audio data returned in @audio_buf@ when it is no longer used.
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
--     Note that the 'loadWAV' function does this same thing for you, but in a less messy way:
--
--     @
--     SDL_LoadWAV(\"sample.wav\", &spec, &buf, &len);
--     @
--
--     This function returns false if the .WAV file cannot be opened, uses an unknown data format, or is corrupt; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Returns]: true on success. @audio_buf@ will be filled with a pointer to an allocated buffer containing the audio data, and @audio_len@ is filled with the length of that audio buffer in bytes.
--
--     When the application is done with the data returned in @audio_buf@, it should call 'SDL3.Sys.Stdinc.free' to dispose of it.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Stdinc.free', 'loadWAV'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadWAV_IO@.
--                   The safe flavor is 'loadWAVIOSafe'
--                   : reads the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadWAV_IO@, defined at @SDL3\/SDL_audio.h 2217:34@
loadWAVIO
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data source for the WAVE data.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
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
  -> IO Bool
loadWAVIO =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_LoadWAV_IO x00 (CBool.fromBool x11) x22 x33 x44)

-- | Load the audio data of a WAVE file into memory.
--
--     Loading a WAVE file requires @src@, @spec@, @audio_buf@ and @audio_len@ to be valid pointers. The entire data portion of the file is then loaded into memory and decoded if necessary.
--
--     Supported formats are RIFF WAVE files with the formats PCM (8, 16, 24, and 32 bits), IEEE Float (32 bits), Microsoft ADPCM and IMA ADPCM (4 bits), and A-law and mu-law (8 bits). Other formats are currently unsupported and cause an error.
--
--     If this function succeeds, the return value is zero and the pointer to the audio data allocated by the function is written to @audio_buf@ and its length in bytes to @audio_len@. The 'SDL_AudioSpec' members @freq@, @channels@, and @format@ are set to the values of the audio data in the buffer.
--
--     It\'s necessary to use 'SDL3.Sys.Stdinc.free' to free the audio data returned in @audio_buf@ when it is no longer used.
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
--     Note that the 'loadWAV' function does this same thing for you, but in a less messy way:
--
--     @
--     SDL_LoadWAV(\"sample.wav\", &spec, &buf, &len);
--     @
--
--     This function returns false if the .WAV file cannot be opened, uses an unknown data format, or is corrupt; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Returns]: true on success. @audio_buf@ will be filled with a pointer to an allocated buffer containing the audio data, and @audio_len@ is filled with the length of that audio buffer in bytes.
--
--     When the application is done with the data returned in @audio_buf@, it should call 'SDL3.Sys.Stdinc.free' to dispose of it.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Stdinc.free', 'loadWAV'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadWAV_IO@.
--                   The unsafe flavor is 'loadWAVIO'
--                   : reads the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadWAV_IO@, defined at @SDL3\/SDL_audio.h 2217:34@
loadWAVIOSafe
  :: BG.Ptr SDL3.Sys.Bindgen.Iostream.SDL_IOStream
  -- ^
  --
  --           [@src@]: the data source for the WAVE data.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls 'SDL3.Sys.Iostream.closeIO' on @src@ before returning, even in the case of an error.
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
  -> IO Bool
loadWAVIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_LoadWAV_IO x00 (CBool.fromBool x11) x22 x33 x44)

-- | Loads a WAV from a file path.
--
--     This is a convenience function that is effectively the same as:
--
--     @
--     SDL_LoadWAV_IO(SDL_IOFromFile(path, \"rb\"), true, spec, audio_buf, audio_len);
--     @
--
--     This function returns false if the .WAV file cannot be opened, uses an unknown data format, or is corrupt; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Returns]: true on success. @audio_buf@ will be filled with a pointer to an allocated buffer containing the audio data, and @audio_len@ is filled with the length of that audio buffer in bytes.
--
--     When the application is done with the data returned in @audio_buf@, it should call 'SDL3.Sys.Stdinc.free' to dispose of it.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Stdinc.free', 'loadWAVIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadWAV@.
--                   The safe flavor is 'loadWAVSafe'
--                   : blocks on whole-file I\/O.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadWAV@, defined at @SDL3\/SDL_audio.h 2253:34@
loadWAV
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
  -> IO Bool
loadWAV =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_LoadWAV x00 x11 x22 x33)

-- | Loads a WAV from a file path.
--
--     This is a convenience function that is effectively the same as:
--
--     @
--     SDL_LoadWAV_IO(SDL_IOFromFile(path, \"rb\"), true, spec, audio_buf, audio_len);
--     @
--
--     This function returns false if the .WAV file cannot be opened, uses an unknown data format, or is corrupt; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Returns]: true on success. @audio_buf@ will be filled with a pointer to an allocated buffer containing the audio data, and @audio_len@ is filled with the length of that audio buffer in bytes.
--
--     When the application is done with the data returned in @audio_buf@, it should call 'SDL3.Sys.Stdinc.free' to dispose of it.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'SDL3.Sys.Stdinc.free', 'loadWAVIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadWAV@.
--                   The unsafe flavor is 'loadWAV'
--                   : blocks on whole-file I\/O.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadWAV@, defined at @SDL3\/SDL_audio.h 2253:34@
loadWAVSafe
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
  -> IO Bool
loadWAVSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_LoadWAV x00 x11 x22 x33)

-- | Mix audio data in a specified format.
--
--     This takes an audio buffer @src@ of @len@ bytes of @format@ data and mixes it into @dst@, performing addition, volume adjustment, and overflow clipping. The buffer pointed to by @dst@ must also be @len@ bytes of @format@ data.
--
--     This is provided for convenience you can mix your own audio data.
--
--     Do not use this function for mixing together more than two streams of sample data. The output from repeated application of this function may be distorted by clipping, because there is no accumulator with greater range than the input (not to mention this being an inefficient way of doing it).
--
--     It is a common misconception that this function is required to write audio data to an output stream in an audio callback. While you can do that, @'mixAudio'@ is really only needed when you\'re mixing a single audio stream with a volume adjustment.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MixAudio@.
--                   The safe flavor is 'mixAudioSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MixAudio@, defined at @SDL3\/SDL_audio.h 2289:34@
mixAudio
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
  -> BG.Word32
  -- ^
  --
  --           [@len@]: the length of the audio buffer in bytes.
  -> Float
  -- ^
  --
  --           [@volume@]: ranges from 0.0 - 1.0, and should be set to 1.0 for full audio volume.
  -> IO Bool
mixAudio =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Unsafe.sDL_MixAudio x00 x11 x22 (Coerce.coerce x33) (Coerce.coerce x44))

-- | Mix audio data in a specified format.
--
--     This takes an audio buffer @src@ of @len@ bytes of @format@ data and mixes it into @dst@, performing addition, volume adjustment, and overflow clipping. The buffer pointed to by @dst@ must also be @len@ bytes of @format@ data.
--
--     This is provided for convenience you can mix your own audio data.
--
--     Do not use this function for mixing together more than two streams of sample data. The output from repeated application of this function may be distorted by clipping, because there is no accumulator with greater range than the input (not to mention this being an inefficient way of doing it).
--
--     It is a common misconception that this function is required to write audio data to an output stream in an audio callback. While you can do that, @'mixAudio'@ is really only needed when you\'re mixing a single audio stream with a volume adjustment.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MixAudio@.
--                   The unsafe flavor is 'mixAudio'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MixAudio@, defined at @SDL3\/SDL_audio.h 2289:34@
mixAudioSafe
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
  -> BG.Word32
  -- ^
  --
  --           [@len@]: the length of the audio buffer in bytes.
  -> Float
  -- ^
  --
  --           [@volume@]: ranges from 0.0 - 1.0, and should be set to 1.0 for full audio volume.
  -> IO Bool
mixAudioSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            fmap CBool.toBool (Safe.sDL_MixAudio x00 x11 x22 (Coerce.coerce x33) (Coerce.coerce x44))

-- | Convert some audio data of one format to another format.
--
--     Please note that this function is for convenience, but should not be used to resample audio in blocks, as it will introduce audio artifacts on the boundaries. You should only use this function if you are converting audio data in its entirety in one call. If you want to convert audio in smaller chunks, use an 'SDL_AudioStream', which is designed for this situation.
--
--     Internally, this function creates and destroys an 'SDL_AudioStream' on each use, so it\'s also less efficient than using one directly, if you need to convert multiple times.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ConvertAudioSamples@.
--                   The safe flavor is 'convertAudioSamplesSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ConvertAudioSamples@, defined at @SDL3\/SDL_audio.h 2319:34@
convertAudioSamples
  :: PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@src_spec@]: the format details of the input audio.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@src_data@]: the audio data to be converted.
  -> BG.Int32
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
  --           [@dst_data@]: will be filled with a pointer to converted audio data, which should be freed with 'SDL3.Sys.Stdinc.free'. On error, it will be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@dst_len@]: will be filled with the len of dst_data.
  -> IO Bool
convertAudioSamples =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Unsafe.sDL_ConvertAudioSamples x00 x11 (Coerce.coerce x22) x33 x44 x55)

-- | Convert some audio data of one format to another format.
--
--     Please note that this function is for convenience, but should not be used to resample audio in blocks, as it will introduce audio artifacts on the boundaries. You should only use this function if you are converting audio data in its entirety in one call. If you want to convert audio in smaller chunks, use an 'SDL_AudioStream', which is designed for this situation.
--
--     Internally, this function creates and destroys an 'SDL_AudioStream' on each use, so it\'s also less efficient than using one directly, if you need to convert multiple times.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ConvertAudioSamples@.
--                   The unsafe flavor is 'convertAudioSamples'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ConvertAudioSamples@, defined at @SDL3\/SDL_audio.h 2319:34@
convertAudioSamplesSafe
  :: PtrConst.PtrConst SDL_AudioSpec
  -- ^
  --
  --           [@src_spec@]: the format details of the input audio.
  -> PtrConst.PtrConst SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@src_data@]: the audio data to be converted.
  -> BG.Int32
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
  --           [@dst_data@]: will be filled with a pointer to converted audio data, which should be freed with 'SDL3.Sys.Stdinc.free'. On error, it will be NULL.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@dst_len@]: will be filled with the len of dst_data.
  -> IO Bool
convertAudioSamplesSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          \x44 ->
            \x55 ->
              fmap CBool.toBool (Safe.sDL_ConvertAudioSamples x00 x11 (Coerce.coerce x22) x33 x44 x55)

-- | Get the human readable name of an audio format.
--
--     [Returns]: the human readable name of the specified audio format or \"SDL_AUDIO_UNKNOWN\" if the format isn\'t recognized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetAudioFormatName@.
--                   The safe flavor is 'getAudioFormatNameSafe'
--                   .
--
--     [C declaration]: @SDL_GetAudioFormatName@, defined at @SDL3\/SDL_audio.h 2332:42@
getAudioFormatName
  :: SDL_AudioFormat
  -- ^
  --
  --           [@format@]: the audio format to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getAudioFormatName = Unsafe.sDL_GetAudioFormatName

-- | Get the human readable name of an audio format.
--
--     [Returns]: the human readable name of the specified audio format or \"SDL_AUDIO_UNKNOWN\" if the format isn\'t recognized.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetAudioFormatName@.
--                   The unsafe flavor is 'getAudioFormatName'
--                   .
--
--     [C declaration]: @SDL_GetAudioFormatName@, defined at @SDL3\/SDL_audio.h 2332:42@
getAudioFormatNameSafe
  :: SDL_AudioFormat
  -- ^
  --
  --           [@format@]: the audio format to query.
  -> IO (PtrConst.PtrConst BG.CChar)
getAudioFormatNameSafe = Safe.sDL_GetAudioFormatName

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetSilenceValueForFormat@.
--                   The safe flavor is 'getSilenceValueForFormatSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSilenceValueForFormat@, defined at @SDL3\/SDL_audio.h 2348:33@
getSilenceValueForFormat
  :: SDL_AudioFormat
  -- ^
  --
  --           [@format@]: the audio data format to query.
  -> IO BG.Int32
getSilenceValueForFormat =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetSilenceValueForFormat x00)

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
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetSilenceValueForFormat@.
--                   The unsafe flavor is 'getSilenceValueForFormat'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetSilenceValueForFormat@, defined at @SDL3\/SDL_audio.h 2348:33@
getSilenceValueForFormatSafe
  :: SDL_AudioFormat
  -- ^
  --
  --           [@format@]: the audio data format to query.
  -> IO BG.Int32
getSilenceValueForFormatSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetSilenceValueForFormat x00)
