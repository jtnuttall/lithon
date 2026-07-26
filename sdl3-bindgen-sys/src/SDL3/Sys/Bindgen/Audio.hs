{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

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
--     SDL also provides a simple .WAV loader in SDL_LoadWAV (and SDL_LoadWAV_IO if you aren\'t reading from a file) as a basic means to load sound data into your program.
--
--     Logical audio devices
--
--     In SDL3, opening a physical device (like a SoundBlaster 16 Pro) gives you a logical device ID that you can bind audio streams to. In almost all cases, logical devices can be used anywhere in the API that a physical device is normally used. However, since each device opening generates a new logical device, different parts of the program (say, a VoIP library, or text-to-speech framework, or maybe some other sort of mixer on top of SDL) can have their own device opens that do not interfere with each other; each logical device will mix its separate audio down to a single buffer, fed to the physical device, behind the scenes. As many logical devices as you like can come and go; SDL will only have to open the physical device at the OS level once, and will manage all the logical devices on top of it internally.
--
--     One other benefit of logical devices: if you don\'t open a specific physical device, instead opting for the default, SDL can automatically migrate those logical devices to different hardware as circumstances change: a user plugged in headphones? The system default changed? SDL can transparently migrate the logical devices to the correct physical device seamlessly and keep playing; the app doesn\'t even have to know it happened if it doesn\'t want to.
--
--     Simplified audio
--
--     As a simplified model for when a single source of audio is all that\'s needed, an app can use SDL_OpenAudioDeviceStream, which is a single function to open an audio device, create an audio stream, bind that stream to the newly-opened device, and (optionally) provide a callback for obtaining audio data. When using this function, the primary interface is the 'SDL_AudioStream' and the device handle is mostly hidden away; destroying a stream created through this function will also close the device, stream bindings cannot be changed, etc. One other quirk of this is that the device is started in a /paused/ state and must be explicitly resumed; this is partially to offer a clean migration for SDL2 apps and partially because the app might have to do more setup before playback begins; in the non-simplified form, nothing will play until a stream is bound to a device, so they start /unpaused/.
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
module SDL3.Sys.Bindgen.Audio (
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_MASK_BITSIZE,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_MASK_FLOAT,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_MASK_BIG_ENDIAN,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_MASK_SIGNED,
  SDL3.Sys.Bindgen.Audio.SDL_AudioFormat (..),
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_UNKNOWN,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_U8,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_S8,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_S16LE,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_S16BE,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_S32LE,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_S32BE,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_F32LE,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_F32BE,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_S16,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_S32,
  pattern SDL3.Sys.Bindgen.Audio.SDL_AUDIO_F32,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_BITSIZE,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_BYTESIZE,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_ISFLOAT,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_ISBIGENDIAN,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_ISLITTLEENDIAN,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_ISSIGNED,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_ISINT,
  SDL3.Sys.Bindgen.Audio.sDL_AUDIO_ISUNSIGNED,
  SDL3.Sys.Bindgen.Audio.SDL_AudioDeviceID (..),
  SDL3.Sys.Bindgen.Audio.SDL_AudioSpec (..),
  SDL3.Sys.Bindgen.Audio.SDL_AudioStream,
  SDL3.Sys.Bindgen.Audio.sDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN,
  SDL3.Sys.Bindgen.Audio.SDL_AudioStreamDataCompleteCallback_Aux (..),
  SDL3.Sys.Bindgen.Audio.SDL_AudioStreamDataCompleteCallback (..),
  SDL3.Sys.Bindgen.Audio.SDL_AudioStreamCallback_Aux (..),
  SDL3.Sys.Bindgen.Audio.SDL_AudioStreamCallback (..),
  SDL3.Sys.Bindgen.Audio.SDL_AudioPostmixCallback_Aux (..),
  SDL3.Sys.Bindgen.Audio.SDL_AudioPostmixCallback (..),
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @macro SDL_AUDIO_MASK_BITSIZE@, defined at @SDL3\/SDL_audio.h 151:9@
sDL_AUDIO_MASK_BITSIZE :: BG.CUInt
sDL_AUDIO_MASK_BITSIZE = (255 :: BG.CUInt)

-- | Mask of bits in an 'SDL_AudioFormat' that contain the floating point flag.
--
--     Generally one should use SDL_AUDIO_ISFLOAT instead of this macro directly.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_MASK_FLOAT@, defined at @SDL3\/SDL_audio.h 160:9@
sDL_AUDIO_MASK_FLOAT :: BG.CUInt
sDL_AUDIO_MASK_FLOAT =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (8 :: BG.CInt)

-- | Mask of bits in an 'SDL_AudioFormat' that contain the bigendian flag.
--
--     Generally one should use SDL_AUDIO_ISBIGENDIAN or SDL_AUDIO_ISLITTLEENDIAN instead of this macro directly.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_MASK_BIG_ENDIAN@, defined at @SDL3\/SDL_audio.h 170:9@
sDL_AUDIO_MASK_BIG_ENDIAN :: BG.CUInt
sDL_AUDIO_MASK_BIG_ENDIAN =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (12 :: BG.CInt)

-- | Mask of bits in an 'SDL_AudioFormat' that contain the signed data flag.
--
--     Generally one should use SDL_AUDIO_ISSIGNED instead of this macro directly.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_MASK_SIGNED@, defined at @SDL3\/SDL_audio.h 179:9@
sDL_AUDIO_MASK_SIGNED :: BG.CUInt
sDL_AUDIO_MASK_SIGNED =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (15 :: BG.CInt)

-- | Audio format.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AUDIO_BITSIZE', 'sDL_AUDIO_BYTESIZE', 'sDL_AUDIO_ISINT', 'sDL_AUDIO_ISFLOAT', 'sDL_AUDIO_ISBIGENDIAN', 'sDL_AUDIO_ISLITTLEENDIAN', 'sDL_AUDIO_ISSIGNED', 'sDL_AUDIO_ISUNSIGNED'
--
--     [C declaration]: @enum SDL_AudioFormat@, defined at @SDL3\/SDL_audio.h 221:14@
newtype SDL_AudioFormat = SDL_AudioFormat
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_AudioFormat where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_AudioFormat where
  readRaw =
    \ptr0 ->
      pure SDL_AudioFormat
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_AudioFormat where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AudioFormat unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_AudioFormat instance BG.Storable SDL_AudioFormat

deriving via BG.CUInt instance BG.Prim SDL_AudioFormat

instance CEnum.CEnum SDL_AudioFormat where
  type CEnumZ SDL_AudioFormat = BG.CUInt

  toCEnum = SDL_AudioFormat

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_AUDIO_UNKNOWN")
        , (8, BG.singleton "SDL_AUDIO_U8")
        , (32776, BG.singleton "SDL_AUDIO_S8")
        , (32784, ("SDL_AUDIO_S16LE" BG.:| ["SDL_AUDIO_S16"]))
        , (32800, ("SDL_AUDIO_S32LE" BG.:| ["SDL_AUDIO_S32"]))
        , (33056, ("SDL_AUDIO_F32LE" BG.:| ["SDL_AUDIO_F32"]))
        , (36880, BG.singleton "SDL_AUDIO_S16BE")
        , (36896, BG.singleton "SDL_AUDIO_S32BE")
        , (37152, BG.singleton "SDL_AUDIO_F32BE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_AudioFormat"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_AudioFormat"

instance Show SDL_AudioFormat where
  showsPrec = CEnum.shows

instance Read SDL_AudioFormat where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_AudioFormat ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioFormat{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_AudioFormat) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AudioFormat "unwrap" where
  type CFieldType SDL_AudioFormat "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Unspecified audio format
--
--     [C declaration]: @SDL_AUDIO_UNKNOWN@, defined at @SDL3\/SDL_audio.h 223:5@
pattern SDL_AUDIO_UNKNOWN :: SDL_AudioFormat
pattern SDL_AUDIO_UNKNOWN = SDL_AudioFormat 0

-- | Unsigned 8-bit samples
--
--     [C declaration]: @SDL_AUDIO_U8@, defined at @SDL3\/SDL_audio.h 224:5@
pattern SDL_AUDIO_U8 :: SDL_AudioFormat
pattern SDL_AUDIO_U8 = SDL_AudioFormat 8

-- | Signed 8-bit samples
--
--     [C declaration]: @SDL_AUDIO_S8@, defined at @SDL3\/SDL_audio.h 226:5@
pattern SDL_AUDIO_S8 :: SDL_AudioFormat
pattern SDL_AUDIO_S8 = SDL_AudioFormat 32776

-- | Signed 16-bit samples
--
--     [C declaration]: @SDL_AUDIO_S16LE@, defined at @SDL3\/SDL_audio.h 228:5@
pattern SDL_AUDIO_S16LE :: SDL_AudioFormat
pattern SDL_AUDIO_S16LE = SDL_AudioFormat 32784

-- | As above, but big-endian byte order
--
--     [C declaration]: @SDL_AUDIO_S16BE@, defined at @SDL3\/SDL_audio.h 230:5@
pattern SDL_AUDIO_S16BE :: SDL_AudioFormat
pattern SDL_AUDIO_S16BE = SDL_AudioFormat 36880

-- | 32-bit integer samples
--
--     [C declaration]: @SDL_AUDIO_S32LE@, defined at @SDL3\/SDL_audio.h 232:5@
pattern SDL_AUDIO_S32LE :: SDL_AudioFormat
pattern SDL_AUDIO_S32LE = SDL_AudioFormat 32800

-- | As above, but big-endian byte order
--
--     [C declaration]: @SDL_AUDIO_S32BE@, defined at @SDL3\/SDL_audio.h 234:5@
pattern SDL_AUDIO_S32BE :: SDL_AudioFormat
pattern SDL_AUDIO_S32BE = SDL_AudioFormat 36896

-- | 32-bit floating point samples
--
--     [C declaration]: @SDL_AUDIO_F32LE@, defined at @SDL3\/SDL_audio.h 236:5@
pattern SDL_AUDIO_F32LE :: SDL_AudioFormat
pattern SDL_AUDIO_F32LE = SDL_AudioFormat 33056

-- | As above, but big-endian byte order
--
--     [C declaration]: @SDL_AUDIO_F32BE@, defined at @SDL3\/SDL_audio.h 238:5@
pattern SDL_AUDIO_F32BE :: SDL_AudioFormat
pattern SDL_AUDIO_F32BE = SDL_AudioFormat 37152

-- | [C declaration]: @SDL_AUDIO_S16@, defined at @SDL3\/SDL_audio.h 243:5@
pattern SDL_AUDIO_S16 :: SDL_AudioFormat
pattern SDL_AUDIO_S16 = SDL_AudioFormat 32784

-- | [C declaration]: @SDL_AUDIO_S32@, defined at @SDL3\/SDL_audio.h 244:5@
pattern SDL_AUDIO_S32 :: SDL_AudioFormat
pattern SDL_AUDIO_S32 = SDL_AudioFormat 32800

-- | [C declaration]: @SDL_AUDIO_F32@, defined at @SDL3\/SDL_audio.h 245:5@
pattern SDL_AUDIO_F32 :: SDL_AudioFormat
pattern SDL_AUDIO_F32 = SDL_AudioFormat 33056

-- | Retrieve the size, in bits, from an 'SDL_AudioFormat'.
--
--     For example, @SDL_AUDIO_BITSIZE(SDL_AUDIO_S16)@ returns 16.
--
--     [@x@]: an 'SDL_AudioFormat' value.
--
--     [Returns]: data size in bits.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_BITSIZE@, defined at @SDL3\/SDL_audio.h 266:9@
sDL_AUDIO_BITSIZE
  :: forall a0. (C.Expr.HostPlatform.Bitwise a0 BG.CUInt) => a0 -> C.Expr.HostPlatform.BitsRes a0 BG.CUInt
sDL_AUDIO_BITSIZE =
  \x0 ->
    (C.Expr.HostPlatform..&.) x0 sDL_AUDIO_MASK_BITSIZE

-- | Retrieve the size, in bytes, from an 'SDL_AudioFormat'.
--
--     For example, @SDL_AUDIO_BYTESIZE(SDL_AUDIO_S16)@ returns 2.
--
--     [@x@]: an 'SDL_AudioFormat' value.
--
--     [Returns]: data size in bytes.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_BYTESIZE@, defined at @SDL3\/SDL_audio.h 280:9@
sDL_AUDIO_BYTESIZE
  :: forall a0
   . (C.Expr.HostPlatform.Div (C.Expr.HostPlatform.BitsRes a0 BG.CUInt) BG.CInt)
  => (C.Expr.HostPlatform.Bitwise a0 BG.CUInt)
  => a0 -> C.Expr.HostPlatform.DivRes (C.Expr.HostPlatform.BitsRes a0 BG.CUInt) BG.CInt
sDL_AUDIO_BYTESIZE =
  \x0 ->
    (C.Expr.HostPlatform./) (sDL_AUDIO_BITSIZE x0) (8 :: BG.CInt)

-- | Determine if an 'SDL_AudioFormat' represents floating point data.
--
--     For example, @SDL_AUDIO_ISFLOAT(SDL_AUDIO_S16)@ returns 0.
--
--     [@x@]: an 'SDL_AudioFormat' value.
--
--     [Returns]: non-zero if format is floating point, zero otherwise.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_ISFLOAT@, defined at @SDL3\/SDL_audio.h 294:9@
sDL_AUDIO_ISFLOAT
  :: forall a0. (C.Expr.HostPlatform.Bitwise a0 BG.CUInt) => a0 -> C.Expr.HostPlatform.BitsRes a0 BG.CUInt
sDL_AUDIO_ISFLOAT =
  \x0 ->
    (C.Expr.HostPlatform..&.) x0 sDL_AUDIO_MASK_FLOAT

-- | Determine if an 'SDL_AudioFormat' represents bigendian data.
--
--     For example, @SDL_AUDIO_ISBIGENDIAN(SDL_AUDIO_S16LE)@ returns 0.
--
--     [@x@]: an 'SDL_AudioFormat' value.
--
--     [Returns]: non-zero if format is bigendian, zero otherwise.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_ISBIGENDIAN@, defined at @SDL3\/SDL_audio.h 308:9@
sDL_AUDIO_ISBIGENDIAN
  :: forall a0. (C.Expr.HostPlatform.Bitwise a0 BG.CUInt) => a0 -> C.Expr.HostPlatform.BitsRes a0 BG.CUInt
sDL_AUDIO_ISBIGENDIAN =
  \x0 ->
    (C.Expr.HostPlatform..&.) x0 sDL_AUDIO_MASK_BIG_ENDIAN

-- | Determine if an 'SDL_AudioFormat' represents littleendian data.
--
--     For example, @SDL_AUDIO_ISLITTLEENDIAN(SDL_AUDIO_S16BE)@ returns 0.
--
--     [@x@]: an 'SDL_AudioFormat' value.
--
--     [Returns]: non-zero if format is littleendian, zero otherwise.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_ISLITTLEENDIAN@, defined at @SDL3\/SDL_audio.h 322:9@
sDL_AUDIO_ISLITTLEENDIAN
  :: forall a0
   . (C.Expr.HostPlatform.Not (C.Expr.HostPlatform.BitsRes a0 BG.CUInt))
  => (C.Expr.HostPlatform.Bitwise a0 BG.CUInt)
  => a0 -> BG.CInt
sDL_AUDIO_ISLITTLEENDIAN =
  \x0 ->
    C.Expr.HostPlatform.not (sDL_AUDIO_ISBIGENDIAN x0)

-- | Determine if an 'SDL_AudioFormat' represents signed data.
--
--     For example, @SDL_AUDIO_ISSIGNED(SDL_AUDIO_U8)@ returns 0.
--
--     [@x@]: an 'SDL_AudioFormat' value.
--
--     [Returns]: non-zero if format is signed, zero otherwise.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_ISSIGNED@, defined at @SDL3\/SDL_audio.h 336:9@
sDL_AUDIO_ISSIGNED
  :: forall a0. (C.Expr.HostPlatform.Bitwise a0 BG.CUInt) => a0 -> C.Expr.HostPlatform.BitsRes a0 BG.CUInt
sDL_AUDIO_ISSIGNED =
  \x0 ->
    (C.Expr.HostPlatform..&.) x0 sDL_AUDIO_MASK_SIGNED

-- | Determine if an 'SDL_AudioFormat' represents integer data.
--
--     For example, @SDL_AUDIO_ISINT(SDL_AUDIO_F32)@ returns 0.
--
--     [@x@]: an 'SDL_AudioFormat' value.
--
--     [Returns]: non-zero if format is integer, zero otherwise.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_ISINT@, defined at @SDL3\/SDL_audio.h 350:9@
sDL_AUDIO_ISINT
  :: forall a0
   . (C.Expr.HostPlatform.Not (C.Expr.HostPlatform.BitsRes a0 BG.CUInt))
  => (C.Expr.HostPlatform.Bitwise a0 BG.CUInt)
  => a0 -> BG.CInt
sDL_AUDIO_ISINT =
  \x0 -> C.Expr.HostPlatform.not (sDL_AUDIO_ISFLOAT x0)

-- | Determine if an 'SDL_AudioFormat' represents unsigned data.
--
--     For example, @SDL_AUDIO_ISUNSIGNED(SDL_AUDIO_S16)@ returns 0.
--
--     [@x@]: an 'SDL_AudioFormat' value.
--
--     [Returns]: non-zero if format is unsigned, zero otherwise.
--
--     [Thread safety]: It is safe to call this macro from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_AUDIO_ISUNSIGNED@, defined at @SDL3\/SDL_audio.h 364:9@
sDL_AUDIO_ISUNSIGNED
  :: forall a0
   . (C.Expr.HostPlatform.Not (C.Expr.HostPlatform.BitsRes a0 BG.CUInt))
  => (C.Expr.HostPlatform.Bitwise a0 BG.CUInt)
  => a0 -> BG.CInt
sDL_AUDIO_ISUNSIGNED =
  \x0 ->
    C.Expr.HostPlatform.not (sDL_AUDIO_ISSIGNED x0)

-- | SDL Audio Device instance IDs.
--
--     Zero is used to signify an invalid\/null device.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_AudioDeviceID@, defined at @SDL3\/SDL_audio.h 374:16@
newtype SDL_AudioDeviceID = SDL_AudioDeviceID
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
  }
  deriving stock (BG.Generic, Eq, Ord, Read, Show)
  deriving newtype
    ( BG.Bitfield
    , BG.Bits
    , BG.FiniteBits
    , BG.HasFFIType
    , BG.Ix
    , BG.Prim
    , BG.Storable
    , Bounded
    , Enum
    , Integral
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    , Num
    , Real
    )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_AudioDeviceID ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioDeviceID{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_AudioDeviceID) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AudioDeviceID "unwrap" where
  type
    CFieldType SDL_AudioDeviceID "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | Format specifier for audio data.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_AudioFormat'
--
--     [C declaration]: @struct SDL_AudioSpec@, defined at @SDL3\/SDL_audio.h 405:16@
data SDL_AudioSpec = SDL_AudioSpec
  { format :: SDL_AudioFormat
  -- ^ Audio data format
  --
  --          [C declaration]: @format@, defined at @SDL3\/SDL_audio.h 407:21@
  , channels :: BG.CInt
  -- ^ Number of channels: 1 mono, 2 stereo, etc
  --
  --          [C declaration]: @channels@, defined at @SDL3\/SDL_audio.h 408:9@
  , freq :: BG.CInt
  -- ^ sample rate: sample frames per second
  --
  --          [C declaration]: @freq@, defined at @SDL3\/SDL_audio.h 409:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_AudioSpec where
  staticSizeOf = \_ -> (12 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_AudioSpec where
  readRaw =
    \ptr0 ->
      pure SDL_AudioSpec
        <*> HasCField.readRaw (BG.Proxy @"format") ptr0
        <*> HasCField.readRaw (BG.Proxy @"channels") ptr0
        <*> HasCField.readRaw (BG.Proxy @"freq") ptr0

instance Marshal.WriteRaw SDL_AudioSpec where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AudioSpec format2 channels3 freq4 ->
            HasCField.writeRaw (BG.Proxy @"format") ptr0 format2
              >> HasCField.writeRaw (BG.Proxy @"channels") ptr0 channels3
              >> HasCField.writeRaw (BG.Proxy @"freq") ptr0 freq4

deriving via Marshal.EquivStorable SDL_AudioSpec instance BG.Storable SDL_AudioSpec

instance
  (ty ~ SDL_AudioFormat)
  => BG.CompatHasField.HasField "format" SDL_AudioSpec ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioSpec
            { format = y1
            , channels = BG.getField @"channels" x0
            , freq = BG.getField @"freq" x0
            }
      , BG.getField @"format" x0
      )

instance
  (ty ~ SDL_AudioFormat)
  => BG.HasField "format" (BG.Ptr SDL_AudioSpec) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"format")

instance HasCField.HasCField SDL_AudioSpec "format" where
  type
    CFieldType SDL_AudioSpec "format" =
      SDL_AudioFormat

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "channels" SDL_AudioSpec ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioSpec
            { channels = y1
            , format = BG.getField @"format" x0
            , freq = BG.getField @"freq" x0
            }
      , BG.getField @"channels" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "channels" (BG.Ptr SDL_AudioSpec) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"channels")

instance HasCField.HasCField SDL_AudioSpec "channels" where
  type CFieldType SDL_AudioSpec "channels" = BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "freq" SDL_AudioSpec ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioSpec
            { freq = y1
            , format = BG.getField @"format" x0
            , channels = BG.getField @"channels" x0
            }
      , BG.getField @"freq" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "freq" (BG.Ptr SDL_AudioSpec) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"freq")

instance HasCField.HasCField SDL_AudioSpec "freq" where
  type CFieldType SDL_AudioSpec "freq" = BG.CInt

  offset# = \_ -> \_ -> 8

-- | The opaque handle that represents an audio stream.
--
--     'SDL_AudioStream' is an audio conversion interface.
--
--     * It can handle resampling data in chunks without generating artifacts, when it doesn\'t have the complete buffer available.
--
--     * It can handle incoming data in any variable size.
--
--     * It can handle input\/output format changes on the fly.
--
--     * It can remap audio channels between inputs and outputs.
--
--     * You push data as you have it, and pull it when you need it
--
--     * It can also function as a basic audio data queue even if you just have sound that needs to pass from one place to another.
--
--     * You can hook callbacks up to them when more data is added or requested, to manage data on-the-fly.
--
--     Audio streams are the core of the SDL3 audio interface. You create one or more of them, bind them to an opened audio device, and feed data to them (or for recording, consume data from them).
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateAudioStream'
--
--     [C declaration]: @struct SDL_AudioStream@, defined at @SDL3\/SDL_audio.h 451:16@
data SDL_AudioStream

-- | [C declaration]: @macro SDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN@, literal @\"SDL.audiostream.auto_cleanup\"@, defined at @SDL3\/SDL_audio.h 1100:9@
sDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN :: BG.ByteString
sDL_PROP_AUDIOSTREAM_AUTO_CLEANUP_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x61
    , 0x75
    , 0x64
    , 0x69
    , 0x6F
    , 0x73
    , 0x74
    , 0x72
    , 0x65
    , 0x61
    , 0x6D
    , 0x2E
    , 0x61
    , 0x75
    , 0x74
    , 0x6F
    , 0x5F
    , 0x63
    , 0x6C
    , 0x65
    , 0x61
    , 0x6E
    , 0x75
    , 0x70
    ]

-- | Auxiliary type used by 'SDL_AudioStreamDataCompleteCallback'
--
--     [C declaration]: @SDL_AudioStreamDataCompleteCallback@, defined at @SDL3\/SDL_audio.h 1472:24@
newtype SDL_AudioStreamDataCompleteCallback_Aux = SDL_AudioStreamDataCompleteCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_AudioStreamDataCompleteCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_d632898096a732d7_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> IO ()))

-- __unique:__ @toSDL_AudioStreamDataCompleteCallback_Aux@
hs_bindgen_d632898096a732d7
  :: SDL_AudioStreamDataCompleteCallback_Aux
  -> IO (BG.FunPtr SDL_AudioStreamDataCompleteCallback_Aux)
hs_bindgen_d632898096a732d7 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_d632898096a732d7_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_AudioStreamDataCompleteCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_13d85e7076fc6ef1_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO ()

-- __unique:__ @fromSDL_AudioStreamDataCompleteCallback_Aux@
hs_bindgen_13d85e7076fc6ef1
  :: BG.FunPtr SDL_AudioStreamDataCompleteCallback_Aux
  -> SDL_AudioStreamDataCompleteCallback_Aux
hs_bindgen_13d85e7076fc6ef1 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_13d85e7076fc6ef1_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_AudioStreamDataCompleteCallback_Aux where
  toFunPtr = hs_bindgen_d632898096a732d7

instance BG.FromFunPtr SDL_AudioStreamDataCompleteCallback_Aux where
  fromFunPtr = hs_bindgen_13d85e7076fc6ef1

instance
  (ty ~ (BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_AudioStreamDataCompleteCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioStreamDataCompleteCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_AudioStreamDataCompleteCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AudioStreamDataCompleteCallback_Aux "unwrap" where
  type
    CFieldType SDL_AudioStreamDataCompleteCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> BG.CInt -> IO ()

  offset# = \_ -> \_ -> 0

-- | A callback that fires for completed @SDL_PutAudioStreamDataNoCopy()@ data.
--
--     When using @SDL_PutAudioStreamDataNoCopy()@ to provide data to an 'SDL_AudioStream', it\'s not safe to dispose of the data until the stream has completely consumed it. Often times it\'s difficult to know exactly when this has happened.
--
--     This callback fires once when the stream no longer needs the buffer, allowing the app to easily free or reuse it.
--
--     [@userdata@]: an opaque pointer provided by the app for their personal use.
--
--     [@buf@]: the pointer provided to @SDL_PutAudioStreamDataNoCopy()@.
--
--     [@buflen@]: the size of buffer, in bytes, provided to @SDL_PutAudioStreamDataNoCopy()@.
--
--     [Thread safety]: This callbacks may run from any thread, so if you need to protect shared data, you should use SDL_LockAudioStream to serialize access; this lock will be held before your callback is called, so your callback does not need to manage the lock explicitly.
--
--     @since 3.4.0
--
--     [See also]: 'sDL_SetAudioStreamGetCallback', 'sDL_SetAudioStreamPutCallback'
--
--     [C declaration]: @SDL_AudioStreamDataCompleteCallback@, defined at @SDL3\/SDL_audio.h 1472:24@
newtype SDL_AudioStreamDataCompleteCallback = SDL_AudioStreamDataCompleteCallback
  { unwrap :: BG.FunPtr SDL_AudioStreamDataCompleteCallback_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_AudioStreamDataCompleteCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_AudioStreamDataCompleteCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioStreamDataCompleteCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_AudioStreamDataCompleteCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_AudioStreamDataCompleteCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AudioStreamDataCompleteCallback "unwrap" where
  type
    CFieldType SDL_AudioStreamDataCompleteCallback "unwrap" =
      BG.FunPtr SDL_AudioStreamDataCompleteCallback_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_AudioStreamCallback'
--
--     [C declaration]: @SDL_AudioStreamCallback@, defined at @SDL3\/SDL_audio.h 1865:24@
newtype SDL_AudioStreamCallback_Aux = SDL_AudioStreamCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> BG.Ptr SDL_AudioStream -> BG.CInt -> BG.CInt -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_AudioStreamCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_2ba16e119c56cb1b_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> BG.Int32 -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> BG.Int32 -> IO ()))

-- __unique:__ @toSDL_AudioStreamCallback_Aux@
hs_bindgen_2ba16e119c56cb1b
  :: SDL_AudioStreamCallback_Aux
  -> IO (BG.FunPtr SDL_AudioStreamCallback_Aux)
hs_bindgen_2ba16e119c56cb1b =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_2ba16e119c56cb1b_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_AudioStreamCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_a0fafe03b8b6d008_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> BG.Int32 -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Int32
    -> IO ()

-- __unique:__ @fromSDL_AudioStreamCallback_Aux@
hs_bindgen_a0fafe03b8b6d008
  :: BG.FunPtr SDL_AudioStreamCallback_Aux
  -> SDL_AudioStreamCallback_Aux
hs_bindgen_a0fafe03b8b6d008 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_a0fafe03b8b6d008_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_AudioStreamCallback_Aux where
  toFunPtr = hs_bindgen_2ba16e119c56cb1b

instance BG.FromFunPtr SDL_AudioStreamCallback_Aux where
  fromFunPtr = hs_bindgen_a0fafe03b8b6d008

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr SDL_AudioStream -> BG.CInt -> BG.CInt -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_AudioStreamCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioStreamCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr SDL_AudioStream -> BG.CInt -> BG.CInt -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_AudioStreamCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AudioStreamCallback_Aux "unwrap" where
  type
    CFieldType SDL_AudioStreamCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> BG.Ptr SDL_AudioStream -> BG.CInt -> BG.CInt -> IO ()

  offset# = \_ -> \_ -> 0

-- | A callback that fires when data passes through an 'SDL_AudioStream'.
--
--     Apps can (optionally) register a callback with an audio stream that is called when data is added with SDL_PutAudioStreamData, or requested with SDL_GetAudioStreamData.
--
--     Two values are offered here: one is the amount of additional data needed to satisfy the immediate request (which might be zero if the stream already has enough data queued) and the other is the total amount being requested. In a Get call triggering a Put callback, these values can be different. In a Put call triggering a Get callback, these values are always the same.
--
--     Byte counts might be slightly overestimated due to buffering or resampling, and may change from call to call.
--
--     This callback is not required to do anything. Generally this is useful for adding\/reading data on demand, and the app will often put\/get data as appropriate, but the system goes on with the data currently available to it if this callback does nothing.
--
--     [@stream@]: the SDL audio stream associated with this callback.
--
--     [@additional_amount@]: the amount of data, in bytes, that is needed right now.
--
--     [@total_amount@]: the total amount of data requested, in bytes, that is requested or available.
--
--     [@userdata@]: an opaque pointer provided by the app for their personal use.
--
--     [Thread safety]: This callbacks may run from any thread, so if you need to protect shared data, you should use SDL_LockAudioStream to serialize access; this lock will be held before your callback is called, so your callback does not need to manage the lock explicitly.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioStreamGetCallback', 'sDL_SetAudioStreamPutCallback'
--
--     [C declaration]: @SDL_AudioStreamCallback@, defined at @SDL3\/SDL_audio.h 1865:24@
newtype SDL_AudioStreamCallback = SDL_AudioStreamCallback
  { unwrap :: BG.FunPtr SDL_AudioStreamCallback_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_AudioStreamCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_AudioStreamCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioStreamCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_AudioStreamCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_AudioStreamCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AudioStreamCallback "unwrap" where
  type
    CFieldType SDL_AudioStreamCallback "unwrap" =
      BG.FunPtr SDL_AudioStreamCallback_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_AudioPostmixCallback'
--
--     [C declaration]: @SDL_AudioPostmixCallback@, defined at @SDL3\/SDL_audio.h 2082:24@
newtype SDL_AudioPostmixCallback_Aux = SDL_AudioPostmixCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> PtrConst.PtrConst SDL_AudioSpec -> BG.Ptr BG.CFloat -> BG.CInt -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_AudioPostmixCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_303b6f766f2a421d_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> IO ()))

-- __unique:__ @toSDL_AudioPostmixCallback_Aux@
hs_bindgen_303b6f766f2a421d
  :: SDL_AudioPostmixCallback_Aux
  -> IO (BG.FunPtr SDL_AudioPostmixCallback_Aux)
hs_bindgen_303b6f766f2a421d =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_303b6f766f2a421d_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_AudioPostmixCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_148fa618325eaf19_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO ()

-- __unique:__ @fromSDL_AudioPostmixCallback_Aux@
hs_bindgen_148fa618325eaf19
  :: BG.FunPtr SDL_AudioPostmixCallback_Aux
  -> SDL_AudioPostmixCallback_Aux
hs_bindgen_148fa618325eaf19 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_148fa618325eaf19_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_AudioPostmixCallback_Aux where
  toFunPtr = hs_bindgen_303b6f766f2a421d

instance BG.FromFunPtr SDL_AudioPostmixCallback_Aux where
  fromFunPtr = hs_bindgen_148fa618325eaf19

instance
  (ty ~ (BG.Ptr BG.Void -> PtrConst.PtrConst SDL_AudioSpec -> BG.Ptr BG.CFloat -> BG.CInt -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_AudioPostmixCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioPostmixCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> PtrConst.PtrConst SDL_AudioSpec -> BG.Ptr BG.CFloat -> BG.CInt -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_AudioPostmixCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AudioPostmixCallback_Aux "unwrap" where
  type
    CFieldType SDL_AudioPostmixCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> PtrConst.PtrConst SDL_AudioSpec -> BG.Ptr BG.CFloat -> BG.CInt -> IO ()

  offset# = \_ -> \_ -> 0

-- | A callback that fires when data is about to be fed to an audio device.
--
--     This is useful for accessing the final mix, perhaps for writing a visualizer or applying a final effect to the audio data before playback.
--
--     This callback should run as quickly as possible and not block for any significant time, as this callback delays submission of data to the audio device, which can cause audio playback problems.
--
--     The postmix callback /must/ be able to handle any audio data format specified in @spec@, which can change between callbacks if the audio device changed. However, this only covers frequency and channel count; data is always provided here in SDL_AUDIO_F32 format.
--
--     The postmix callback runs /after/ logical device gain and audiostream gain have been applied, which is to say you can make the output data louder at this point than the gain settings would suggest.
--
--     [@userdata@]: a pointer provided by the app through SDL_SetAudioPostmixCallback, for its own use.
--
--     [@spec@]: the current format of audio that is to be submitted to the audio device.
--
--     [@buffer@]: the buffer of audio samples to be submitted. The callback can inspect and\/or modify this data.
--
--     [@buflen@]: the size of @buffer@ in bytes.
--
--     [Thread safety]: This will run from a background thread owned by SDL. The application is responsible for locking resources the callback touches that need to be protected.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SetAudioPostmixCallback'
--
--     [C declaration]: @SDL_AudioPostmixCallback@, defined at @SDL3\/SDL_audio.h 2082:24@
newtype SDL_AudioPostmixCallback = SDL_AudioPostmixCallback
  { unwrap :: BG.FunPtr SDL_AudioPostmixCallback_Aux
  }
  deriving stock (BG.Generic, Eq, Ord, Show)
  deriving newtype
    ( BG.HasFFIType
    , BG.Storable
    , Marshal.ReadRaw
    , Marshal.StaticSize
    , Marshal.WriteRaw
    )

instance
  (ty ~ BG.FunPtr SDL_AudioPostmixCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_AudioPostmixCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AudioPostmixCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_AudioPostmixCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_AudioPostmixCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AudioPostmixCallback "unwrap" where
  type
    CFieldType SDL_AudioPostmixCallback "unwrap" =
      BG.FunPtr SDL_AudioPostmixCallback_Aux

  offset# = \_ -> \_ -> 0
