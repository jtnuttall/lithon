{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
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

-- | All SDL programs need to initialize the library before starting to work with it.
--
--     Almost everything can simply call @SDL_Init()@ near startup, with a handful of flags to specify subsystems to touch. These are here to make sure SDL does not even attempt to touch low-level pieces of the operating system that you don\'t intend to use. For example, you might be using SDL for video and input but chose an external library for audio, and in this case you would just need to leave off the @'sDL_INIT_AUDIO'@ flag to make sure that external library has complete control.
--
--     Most apps, when terminating, should call @SDL_Quit()@. This will clean up (nearly) everything that SDL might have allocated, and crucially, it\'ll make sure that the display\'s resolution is back to what the user expects if you had previously changed it for your game.
--
--     SDL3 apps are strongly encouraged to call @SDL_SetAppMetadata()@ at startup to fill in details about the program. This is completely optional, but it helps in small ways (we can provide an About dialog box for the macOS menu, we can name the app in the system\'s audio mixer, etc). Those that want to provide a /lot/ of information should look at the more-detailed @SDL_SetAppMetadataProperty()@. Initialization flags for SDL_Init and\/or SDL_InitSubSystem
--
--     These are the flags which may be passed to @SDL_Init()@. You should specify the subsystems which you will be using in your application.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_Init', 'sDL_Quit', 'sDL_InitSubSystem', 'sDL_QuitSubSystem', 'sDL_WasInit'
module SDL3.Sys.Bindgen.Init (
  SDL3.Sys.Bindgen.Init.SDL_InitFlags (..),
  SDL3.Sys.Bindgen.Init.sDL_INIT_AUDIO,
  SDL3.Sys.Bindgen.Init.sDL_INIT_VIDEO,
  SDL3.Sys.Bindgen.Init.sDL_INIT_JOYSTICK,
  SDL3.Sys.Bindgen.Init.sDL_INIT_HAPTIC,
  SDL3.Sys.Bindgen.Init.sDL_INIT_GAMEPAD,
  SDL3.Sys.Bindgen.Init.sDL_INIT_EVENTS,
  SDL3.Sys.Bindgen.Init.sDL_INIT_SENSOR,
  SDL3.Sys.Bindgen.Init.sDL_INIT_CAMERA,
  SDL3.Sys.Bindgen.Init.SDL_AppResult (..),
  pattern SDL3.Sys.Bindgen.Init.SDL_APP_CONTINUE,
  pattern SDL3.Sys.Bindgen.Init.SDL_APP_SUCCESS,
  pattern SDL3.Sys.Bindgen.Init.SDL_APP_FAILURE,
  SDL3.Sys.Bindgen.Init.SDL_AppInit_func_Aux (..),
  SDL3.Sys.Bindgen.Init.SDL_AppInit_func (..),
  SDL3.Sys.Bindgen.Init.SDL_AppIterate_func_Aux (..),
  SDL3.Sys.Bindgen.Init.SDL_AppIterate_func (..),
  SDL3.Sys.Bindgen.Init.SDL_AppEvent_func_Aux (..),
  SDL3.Sys.Bindgen.Init.SDL_AppEvent_func (..),
  SDL3.Sys.Bindgen.Init.SDL_AppQuit_func_Aux (..),
  SDL3.Sys.Bindgen.Init.SDL_AppQuit_func (..),
  SDL3.Sys.Bindgen.Init.SDL_MainThreadCallback_Aux (..),
  SDL3.Sys.Bindgen.Init.SDL_MainThreadCallback (..),
  SDL3.Sys.Bindgen.Init.sDL_PROP_APP_METADATA_NAME_STRING,
  SDL3.Sys.Bindgen.Init.sDL_PROP_APP_METADATA_VERSION_STRING,
  SDL3.Sys.Bindgen.Init.sDL_PROP_APP_METADATA_IDENTIFIER_STRING,
  SDL3.Sys.Bindgen.Init.sDL_PROP_APP_METADATA_CREATOR_STRING,
  SDL3.Sys.Bindgen.Init.sDL_PROP_APP_METADATA_COPYRIGHT_STRING,
  SDL3.Sys.Bindgen.Init.sDL_PROP_APP_METADATA_URL_STRING,
  SDL3.Sys.Bindgen.Init.sDL_PROP_APP_METADATA_TYPE_STRING,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.IncompleteArray qualified as IA
import HsBindgen.Runtime.IsArray qualified as IsA
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Events qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @SDL_InitFlags@, defined at @SDL3\/SDL_init.h 78:16@
newtype SDL_InitFlags = SDL_InitFlags
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
  => BG.CompatHasField.HasField "unwrap" SDL_InitFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_InitFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_InitFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_InitFlags "unwrap" where
  type
    CFieldType SDL_InitFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | @'sDL_INIT_AUDIO'@ implies @'sDL_INIT_EVENTS'@
--
--     [C declaration]: @macro SDL_INIT_AUDIO@, defined at @SDL3\/SDL_init.h 80:9@
sDL_INIT_AUDIO :: BG.CUInt
sDL_INIT_AUDIO = (16 :: BG.CUInt)

-- | @'sDL_INIT_VIDEO'@ implies @'sDL_INIT_EVENTS'@, should be initialized on the main thread
--
--     [C declaration]: @macro SDL_INIT_VIDEO@, defined at @SDL3\/SDL_init.h 81:9@
sDL_INIT_VIDEO :: BG.CUInt
sDL_INIT_VIDEO = (32 :: BG.CUInt)

-- | @'sDL_INIT_JOYSTICK'@ implies @'sDL_INIT_EVENTS'@
--
--     [C declaration]: @macro SDL_INIT_JOYSTICK@, defined at @SDL3\/SDL_init.h 82:9@
sDL_INIT_JOYSTICK :: BG.CUInt
sDL_INIT_JOYSTICK = (512 :: BG.CUInt)

-- | [C declaration]: @macro SDL_INIT_HAPTIC@, defined at @SDL3\/SDL_init.h 83:9@
sDL_INIT_HAPTIC :: BG.CUInt
sDL_INIT_HAPTIC = (4096 :: BG.CUInt)

-- | @'sDL_INIT_GAMEPAD'@ implies @'sDL_INIT_JOYSTICK'@
--
--     [C declaration]: @macro SDL_INIT_GAMEPAD@, defined at @SDL3\/SDL_init.h 84:9@
sDL_INIT_GAMEPAD :: BG.CUInt
sDL_INIT_GAMEPAD = (8192 :: BG.CUInt)

-- | [C declaration]: @macro SDL_INIT_EVENTS@, defined at @SDL3\/SDL_init.h 85:9@
sDL_INIT_EVENTS :: BG.CUInt
sDL_INIT_EVENTS = (16384 :: BG.CUInt)

-- | @'sDL_INIT_SENSOR'@ implies @'sDL_INIT_EVENTS'@
--
--     [C declaration]: @macro SDL_INIT_SENSOR@, defined at @SDL3\/SDL_init.h 86:9@
sDL_INIT_SENSOR :: BG.CUInt
sDL_INIT_SENSOR = (32768 :: BG.CUInt)

-- | @'sDL_INIT_CAMERA'@ implies @'sDL_INIT_EVENTS'@
--
--     [C declaration]: @macro SDL_INIT_CAMERA@, defined at @SDL3\/SDL_init.h 87:9@
sDL_INIT_CAMERA :: BG.CUInt
sDL_INIT_CAMERA = (65536 :: BG.CUInt)

-- | Return values for optional main callbacks.
--
--     Returning SDL_APP_SUCCESS or SDL_APP_FAILURE from SDL_AppInit, SDL_AppEvent, or SDL_AppIterate will terminate the program and report success\/failure to the operating system. What that means is platform-dependent. On Unix, for example, on success, the process error code will be zero, and on failure it will be 1. This interface doesn\'t allow you to return specific exit codes, just whether there was an error generally or not.
--
--     Returning SDL_APP_CONTINUE from these functions will let the app continue to run.
--
--     See [Main callbacks in SDL3](https://wiki.libsdl.org/SDL3/README-main-functions#main-callbacks-in-sdl3) for complete details.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_AppResult@, defined at @SDL3\/SDL_init.h 109:14@
newtype SDL_AppResult = SDL_AppResult
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_AppResult where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_AppResult where
  readRaw =
    \ptr0 ->
      pure SDL_AppResult
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_AppResult where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AppResult unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_AppResult instance BG.Storable SDL_AppResult

deriving via BG.CUInt instance BG.Prim SDL_AppResult

instance CEnum.CEnum SDL_AppResult where
  type CEnumZ SDL_AppResult = BG.CUInt

  toCEnum = SDL_AppResult

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_APP_CONTINUE")
        , (1, BG.singleton "SDL_APP_SUCCESS")
        , (2, BG.singleton "SDL_APP_FAILURE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_AppResult"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_AppResult"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_AppResult where
  minDeclaredValue = SDL_APP_CONTINUE

  maxDeclaredValue = SDL_APP_FAILURE

instance Show SDL_AppResult where
  showsPrec = CEnum.shows

instance Read SDL_AppResult where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_AppResult ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AppResult{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_AppResult) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AppResult "unwrap" where
  type CFieldType SDL_AppResult "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Value that requests that the app continue from the main callbacks.
--
--     [C declaration]: @SDL_APP_CONTINUE@, defined at @SDL3\/SDL_init.h 111:5@
pattern SDL_APP_CONTINUE :: SDL_AppResult
pattern SDL_APP_CONTINUE = SDL_AppResult 0

-- | Value that requests termination with success from the main callbacks.
--
--     [C declaration]: @SDL_APP_SUCCESS@, defined at @SDL3\/SDL_init.h 112:5@
pattern SDL_APP_SUCCESS :: SDL_AppResult
pattern SDL_APP_SUCCESS = SDL_AppResult 1

-- | Value that requests termination with error from the main callbacks.
--
--     [C declaration]: @SDL_APP_FAILURE@, defined at @SDL3\/SDL_init.h 113:5@
pattern SDL_APP_FAILURE :: SDL_AppResult
pattern SDL_APP_FAILURE = SDL_AppResult 2

-- | Auxiliary type used by 'SDL_AppInit_func'
--
--     [C declaration]: @SDL_AppInit_func@, defined at @SDL3\/SDL_init.h 133:33@
newtype SDL_AppInit_func_Aux = SDL_AppInit_func_Aux
  { unwrap
      :: BG.Ptr (BG.Ptr BG.Void)
      -> BG.CInt
      -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
      -> IO SDL_AppResult
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_AppInit_func_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_c9f12691f8f9f34d_base
    :: (BG.Ptr BG.Void -> BG.Int32 -> BG.Ptr BG.Void -> IO BG.Word32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Int32 -> BG.Ptr BG.Void -> IO BG.Word32))

-- __unique:__ @toSDL_AppInit_func_Aux@
hs_bindgen_c9f12691f8f9f34d
  :: SDL_AppInit_func_Aux
  -> IO (BG.FunPtr SDL_AppInit_func_Aux)
hs_bindgen_c9f12691f8f9f34d =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_c9f12691f8f9f34d_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_AppInit_func_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_1ceb806dcbf0a04a_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Int32 -> BG.Ptr BG.Void -> IO BG.Word32)
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @fromSDL_AppInit_func_Aux@
hs_bindgen_1ceb806dcbf0a04a
  :: BG.FunPtr SDL_AppInit_func_Aux
  -> SDL_AppInit_func_Aux
hs_bindgen_1ceb806dcbf0a04a =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_1ceb806dcbf0a04a_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_AppInit_func_Aux where
  toFunPtr = hs_bindgen_c9f12691f8f9f34d

instance BG.FromFunPtr SDL_AppInit_func_Aux where
  fromFunPtr = hs_bindgen_1ceb806dcbf0a04a

instance
  ( ty
      ~ ( BG.Ptr (BG.Ptr BG.Void)
          -> BG.CInt
          -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
          -> IO SDL_AppResult
        )
  )
  => BG.CompatHasField.HasField "unwrap" SDL_AppInit_func_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AppInit_func_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  ( ty
      ~ ( BG.Ptr (BG.Ptr BG.Void)
          -> BG.CInt
          -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
          -> IO SDL_AppResult
        )
  )
  => BG.HasField "unwrap" (BG.Ptr SDL_AppInit_func_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AppInit_func_Aux "unwrap" where
  type
    CFieldType SDL_AppInit_func_Aux "unwrap" =
      BG.Ptr (BG.Ptr BG.Void)
      -> BG.CInt
      -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar)))
      -> IO SDL_AppResult

  offset# = \_ -> \_ -> 0

-- | Function pointer typedef for SDL_AppInit.
--
--     These are used by SDL_EnterAppMainCallbacks. This mechanism operates behind the scenes for apps using the optional main callbacks. Apps that want to use this should just implement SDL_AppInit directly.
--
--     [@appstate@]: a place where the app can optionally store a pointer for future use.
--
--     [@argc@]: the standard ANSI C main\'s argc; number of elements in @argv@.
--
--     [@argv@]: the standard ANSI C main\'s argv; array of command line arguments.
--
--     [Returns]: SDL_APP_FAILURE to terminate with an error, SDL_APP_SUCCESS to terminate with success, SDL_APP_CONTINUE to continue.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_AppInit_func@, defined at @SDL3\/SDL_init.h 133:33@
newtype SDL_AppInit_func = SDL_AppInit_func
  { unwrap :: BG.FunPtr SDL_AppInit_func_Aux
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
  (ty ~ BG.FunPtr SDL_AppInit_func_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_AppInit_func ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AppInit_func{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_AppInit_func_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_AppInit_func) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AppInit_func "unwrap" where
  type
    CFieldType SDL_AppInit_func "unwrap" =
      BG.FunPtr SDL_AppInit_func_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_AppIterate_func'
--
--     [C declaration]: @SDL_AppIterate_func@, defined at @SDL3\/SDL_init.h 148:33@
newtype SDL_AppIterate_func_Aux = SDL_AppIterate_func_Aux
  { unwrap :: BG.Ptr BG.Void -> IO SDL_AppResult
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_AppIterate_func_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_8620c17cf1102621_base
    :: (BG.Ptr BG.Void -> IO BG.Word32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO BG.Word32))

-- __unique:__ @toSDL_AppIterate_func_Aux@
hs_bindgen_8620c17cf1102621
  :: SDL_AppIterate_func_Aux
  -> IO (BG.FunPtr SDL_AppIterate_func_Aux)
hs_bindgen_8620c17cf1102621 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_8620c17cf1102621_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_AppIterate_func_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_eafa84799a5f2ef1_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO BG.Word32)
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @fromSDL_AppIterate_func_Aux@
hs_bindgen_eafa84799a5f2ef1
  :: BG.FunPtr SDL_AppIterate_func_Aux
  -> SDL_AppIterate_func_Aux
hs_bindgen_eafa84799a5f2ef1 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_eafa84799a5f2ef1_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_AppIterate_func_Aux where
  toFunPtr = hs_bindgen_8620c17cf1102621

instance BG.FromFunPtr SDL_AppIterate_func_Aux where
  fromFunPtr = hs_bindgen_eafa84799a5f2ef1

instance
  (ty ~ (BG.Ptr BG.Void -> IO SDL_AppResult))
  => BG.CompatHasField.HasField "unwrap" SDL_AppIterate_func_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AppIterate_func_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO SDL_AppResult))
  => BG.HasField "unwrap" (BG.Ptr SDL_AppIterate_func_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AppIterate_func_Aux "unwrap" where
  type
    CFieldType SDL_AppIterate_func_Aux "unwrap" =
      BG.Ptr BG.Void -> IO SDL_AppResult

  offset# = \_ -> \_ -> 0

-- | Function pointer typedef for SDL_AppIterate.
--
--     These are used by SDL_EnterAppMainCallbacks. This mechanism operates behind the scenes for apps using the optional main callbacks. Apps that want to use this should just implement SDL_AppIterate directly.
--
--     [@appstate@]: an optional pointer, provided by the app in SDL_AppInit.
--
--     [Returns]: SDL_APP_FAILURE to terminate with an error, SDL_APP_SUCCESS to terminate with success, SDL_APP_CONTINUE to continue.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_AppIterate_func@, defined at @SDL3\/SDL_init.h 148:33@
newtype SDL_AppIterate_func = SDL_AppIterate_func
  { unwrap :: BG.FunPtr SDL_AppIterate_func_Aux
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
  (ty ~ BG.FunPtr SDL_AppIterate_func_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_AppIterate_func ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AppIterate_func{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_AppIterate_func_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_AppIterate_func) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AppIterate_func "unwrap" where
  type
    CFieldType SDL_AppIterate_func "unwrap" =
      BG.FunPtr SDL_AppIterate_func_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_AppEvent_func'
--
--     [C declaration]: @SDL_AppEvent_func@, defined at @SDL3\/SDL_init.h 164:33@
newtype SDL_AppEvent_func_Aux = SDL_AppEvent_func_Aux
  { unwrap :: BG.Ptr BG.Void -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event -> IO SDL_AppResult
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_AppEvent_func_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_2b9dfae6ab23e116_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32))

-- __unique:__ @toSDL_AppEvent_func_Aux@
hs_bindgen_2b9dfae6ab23e116
  :: SDL_AppEvent_func_Aux
  -> IO (BG.FunPtr SDL_AppEvent_func_Aux)
hs_bindgen_2b9dfae6ab23e116 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_2b9dfae6ab23e116_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_AppEvent_func_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_5d33518a4254e343_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @fromSDL_AppEvent_func_Aux@
hs_bindgen_5d33518a4254e343
  :: BG.FunPtr SDL_AppEvent_func_Aux
  -> SDL_AppEvent_func_Aux
hs_bindgen_5d33518a4254e343 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_5d33518a4254e343_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_AppEvent_func_Aux where
  toFunPtr = hs_bindgen_2b9dfae6ab23e116

instance BG.FromFunPtr SDL_AppEvent_func_Aux where
  fromFunPtr = hs_bindgen_5d33518a4254e343

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event -> IO SDL_AppResult))
  => BG.CompatHasField.HasField "unwrap" SDL_AppEvent_func_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AppEvent_func_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event -> IO SDL_AppResult))
  => BG.HasField "unwrap" (BG.Ptr SDL_AppEvent_func_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AppEvent_func_Aux "unwrap" where
  type
    CFieldType SDL_AppEvent_func_Aux "unwrap" =
      BG.Ptr BG.Void -> BG.Ptr SDL3.Sys.Bindgen.Events.SDL_Event -> IO SDL_AppResult

  offset# = \_ -> \_ -> 0

-- | Function pointer typedef for SDL_AppEvent.
--
--     These are used by SDL_EnterAppMainCallbacks. This mechanism operates behind the scenes for apps using the optional main callbacks. Apps that want to use this should just implement SDL_AppEvent directly.
--
--     [@appstate@]: an optional pointer, provided by the app in SDL_AppInit.
--
--     [@event@]: the new event for the app to examine.
--
--     [Returns]: SDL_APP_FAILURE to terminate with an error, SDL_APP_SUCCESS to terminate with success, SDL_APP_CONTINUE to continue.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_AppEvent_func@, defined at @SDL3\/SDL_init.h 164:33@
newtype SDL_AppEvent_func = SDL_AppEvent_func
  { unwrap :: BG.FunPtr SDL_AppEvent_func_Aux
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
  (ty ~ BG.FunPtr SDL_AppEvent_func_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_AppEvent_func ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AppEvent_func{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_AppEvent_func_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_AppEvent_func) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AppEvent_func "unwrap" where
  type
    CFieldType SDL_AppEvent_func "unwrap" =
      BG.FunPtr SDL_AppEvent_func_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_AppQuit_func'
--
--     [C declaration]: @SDL_AppQuit_func@, defined at @SDL3\/SDL_init.h 178:24@
newtype SDL_AppQuit_func_Aux = SDL_AppQuit_func_Aux
  { unwrap :: BG.Ptr BG.Void -> SDL_AppResult -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_AppQuit_func_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_fabdaa4c4e54b1de_base
    :: (BG.Ptr BG.Void -> BG.Word32 -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Word32 -> IO ()))

-- __unique:__ @toSDL_AppQuit_func_Aux@
hs_bindgen_fabdaa4c4e54b1de
  :: SDL_AppQuit_func_Aux
  -> IO (BG.FunPtr SDL_AppQuit_func_Aux)
hs_bindgen_fabdaa4c4e54b1de =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_fabdaa4c4e54b1de_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_AppQuit_func_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_7021ade2d0ddec93_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Word32 -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO ()

-- __unique:__ @fromSDL_AppQuit_func_Aux@
hs_bindgen_7021ade2d0ddec93
  :: BG.FunPtr SDL_AppQuit_func_Aux
  -> SDL_AppQuit_func_Aux
hs_bindgen_7021ade2d0ddec93 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_7021ade2d0ddec93_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_AppQuit_func_Aux where
  toFunPtr = hs_bindgen_fabdaa4c4e54b1de

instance BG.FromFunPtr SDL_AppQuit_func_Aux where
  fromFunPtr = hs_bindgen_7021ade2d0ddec93

instance
  (ty ~ (BG.Ptr BG.Void -> SDL_AppResult -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_AppQuit_func_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AppQuit_func_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> SDL_AppResult -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_AppQuit_func_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AppQuit_func_Aux "unwrap" where
  type
    CFieldType SDL_AppQuit_func_Aux "unwrap" =
      BG.Ptr BG.Void -> SDL_AppResult -> IO ()

  offset# = \_ -> \_ -> 0

-- | Function pointer typedef for SDL_AppQuit.
--
--     These are used by SDL_EnterAppMainCallbacks. This mechanism operates behind the scenes for apps using the optional main callbacks. Apps that want to use this should just implement SDL_AppEvent directly.
--
--     [@appstate@]: an optional pointer, provided by the app in SDL_AppInit.
--
--     [@result@]: the result code that terminated the app (success or failure).
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_AppQuit_func@, defined at @SDL3\/SDL_init.h 178:24@
newtype SDL_AppQuit_func = SDL_AppQuit_func
  { unwrap :: BG.FunPtr SDL_AppQuit_func_Aux
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
  (ty ~ BG.FunPtr SDL_AppQuit_func_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_AppQuit_func ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AppQuit_func{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_AppQuit_func_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_AppQuit_func) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AppQuit_func "unwrap" where
  type
    CFieldType SDL_AppQuit_func "unwrap" =
      BG.FunPtr SDL_AppQuit_func_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_MainThreadCallback'
--
--     [C declaration]: @SDL_MainThreadCallback@, defined at @SDL3\/SDL_init.h 341:24@
newtype SDL_MainThreadCallback_Aux = SDL_MainThreadCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_MainThreadCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_0ddfb0aab2235e28_base
    :: (BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toSDL_MainThreadCallback_Aux@
hs_bindgen_0ddfb0aab2235e28
  :: SDL_MainThreadCallback_Aux
  -> IO (BG.FunPtr SDL_MainThreadCallback_Aux)
hs_bindgen_0ddfb0aab2235e28 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_0ddfb0aab2235e28_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_MainThreadCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_b1a0621ae55dc01c_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_MainThreadCallback_Aux@
hs_bindgen_b1a0621ae55dc01c
  :: BG.FunPtr SDL_MainThreadCallback_Aux
  -> SDL_MainThreadCallback_Aux
hs_bindgen_b1a0621ae55dc01c =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_b1a0621ae55dc01c_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_MainThreadCallback_Aux where
  toFunPtr = hs_bindgen_0ddfb0aab2235e28

instance BG.FromFunPtr SDL_MainThreadCallback_Aux where
  fromFunPtr = hs_bindgen_b1a0621ae55dc01c

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_MainThreadCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MainThreadCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_MainThreadCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MainThreadCallback_Aux "unwrap" where
  type
    CFieldType SDL_MainThreadCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> IO ()

  offset# = \_ -> \_ -> 0

-- | Callback run on the main thread.
--
--     [@userdata@]: an app-controlled pointer that is passed to the callback.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_RunOnMainThread'
--
--     [C declaration]: @SDL_MainThreadCallback@, defined at @SDL3\/SDL_init.h 341:24@
newtype SDL_MainThreadCallback = SDL_MainThreadCallback
  { unwrap :: BG.FunPtr SDL_MainThreadCallback_Aux
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
  (ty ~ BG.FunPtr SDL_MainThreadCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_MainThreadCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_MainThreadCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_MainThreadCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_MainThreadCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_MainThreadCallback "unwrap" where
  type
    CFieldType SDL_MainThreadCallback "unwrap" =
      BG.FunPtr SDL_MainThreadCallback_Aux

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @macro SDL_PROP_APP_METADATA_NAME_STRING@, literal @\"SDL.app.metadata.name\"@, defined at @SDL3\/SDL_init.h 470:9@
sDL_PROP_APP_METADATA_NAME_STRING :: BG.ByteString
sDL_PROP_APP_METADATA_NAME_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x61
    , 0x70
    , 0x70
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x64
    , 0x61
    , 0x74
    , 0x61
    , 0x2E
    , 0x6E
    , 0x61
    , 0x6D
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_APP_METADATA_VERSION_STRING@, literal @\"SDL.app.metadata.version\"@, defined at @SDL3\/SDL_init.h 471:9@
sDL_PROP_APP_METADATA_VERSION_STRING :: BG.ByteString
sDL_PROP_APP_METADATA_VERSION_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x61
    , 0x70
    , 0x70
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x64
    , 0x61
    , 0x74
    , 0x61
    , 0x2E
    , 0x76
    , 0x65
    , 0x72
    , 0x73
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_APP_METADATA_IDENTIFIER_STRING@, literal @\"SDL.app.metadata.identifier\"@, defined at @SDL3\/SDL_init.h 472:9@
sDL_PROP_APP_METADATA_IDENTIFIER_STRING :: BG.ByteString
sDL_PROP_APP_METADATA_IDENTIFIER_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x61
    , 0x70
    , 0x70
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x64
    , 0x61
    , 0x74
    , 0x61
    , 0x2E
    , 0x69
    , 0x64
    , 0x65
    , 0x6E
    , 0x74
    , 0x69
    , 0x66
    , 0x69
    , 0x65
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_APP_METADATA_CREATOR_STRING@, literal @\"SDL.app.metadata.creator\"@, defined at @SDL3\/SDL_init.h 473:9@
sDL_PROP_APP_METADATA_CREATOR_STRING :: BG.ByteString
sDL_PROP_APP_METADATA_CREATOR_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x61
    , 0x70
    , 0x70
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x64
    , 0x61
    , 0x74
    , 0x61
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x6F
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_APP_METADATA_COPYRIGHT_STRING@, literal @\"SDL.app.metadata.copyright\"@, defined at @SDL3\/SDL_init.h 474:9@
sDL_PROP_APP_METADATA_COPYRIGHT_STRING :: BG.ByteString
sDL_PROP_APP_METADATA_COPYRIGHT_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x61
    , 0x70
    , 0x70
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x64
    , 0x61
    , 0x74
    , 0x61
    , 0x2E
    , 0x63
    , 0x6F
    , 0x70
    , 0x79
    , 0x72
    , 0x69
    , 0x67
    , 0x68
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_APP_METADATA_URL_STRING@, literal @\"SDL.app.metadata.url\"@, defined at @SDL3\/SDL_init.h 475:9@
sDL_PROP_APP_METADATA_URL_STRING :: BG.ByteString
sDL_PROP_APP_METADATA_URL_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x61
    , 0x70
    , 0x70
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x64
    , 0x61
    , 0x74
    , 0x61
    , 0x2E
    , 0x75
    , 0x72
    , 0x6C
    ]

-- | [C declaration]: @macro SDL_PROP_APP_METADATA_TYPE_STRING@, literal @\"SDL.app.metadata.type\"@, defined at @SDL3\/SDL_init.h 476:9@
sDL_PROP_APP_METADATA_TYPE_STRING :: BG.ByteString
sDL_PROP_APP_METADATA_TYPE_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x61
    , 0x70
    , 0x70
    , 0x2E
    , 0x6D
    , 0x65
    , 0x74
    , 0x61
    , 0x64
    , 0x61
    , 0x74
    , 0x61
    , 0x2E
    , 0x74
    , 0x79
    , 0x70
    , 0x65
    ]
