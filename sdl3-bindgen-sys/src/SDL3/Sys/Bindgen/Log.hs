{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
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

-- | Simple log messages with priorities and categories. A message\'s 'SDL_LogPriority' signifies how important the message is. A message\'s 'SDL_LogCategory' signifies from what domain it belongs to. Every category has a minimum priority specified: when a message belongs to that category, it will only be sent out if it has that minimum priority or higher.
--
--     SDL\'s own logs are sent below the default priority threshold, so they are quiet by default.
--
--     You can change the log verbosity programmatically using @SDL_SetLogPriority()@ or with SDL_SetHint(SDL_HINT_LOGGING, ...), or with the \"SDL_LOGGING\" environment variable. This variable is a comma separated set of category=level tokens that define the default logging levels for SDL applications.
--
--     The category can be a numeric category, one of \"app\", \"error\", \"assert\", \"system\", \"audio\", \"video\", \"render\", \"input\", \"test\", or @*@ for any unspecified category.
--
--     The level can be a numeric level, one of \"trace\", \"verbose\", \"debug\", \"info\", \"warn\", \"error\", \"critical\", or \"quiet\" to disable that category.
--
--     You can omit the category if you want to set the logging level for all categories.
--
--     If this hint isn\'t set, the default log levels are equivalent to:
--
--     @app=info,assert=warn,test=verbose,*=error@
--
--     Here\'s where the messages go on different platforms:
--
--     * Windows: debug output stream
--
--     * Android: log output
--
--     * Others: standard error output (stderr)
--
--     You don\'t need to have a newline (@\\n@) on the end of messages, the functions will do that for you. For consistent behavior cross-platform, you shouldn\'t have any newlines in messages, such as to log multiple lines in one call; unusual platform-specific behavior can be observed in such usage. Do one log call per line instead, with no newlines in messages.
--
--     Each log call is atomic, so you won\'t see log messages cut off one another when logging from multiple threads. The predefined log categories
--
--     By default the application and gpu categories are enabled at the INFO level, the assert category is enabled at the WARN level, test is enabled at the VERBOSE level and all other categories are enabled at the ERROR level.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Log (
  SDL3.Sys.Bindgen.Log.SDL_LogCategory (..),
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_APPLICATION,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_ERROR,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_ASSERT,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_SYSTEM,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_AUDIO,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_VIDEO,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RENDER,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_INPUT,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_TEST,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_GPU,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RESERVED2,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RESERVED3,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RESERVED4,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RESERVED5,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RESERVED6,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RESERVED7,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RESERVED8,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RESERVED9,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_RESERVED10,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_CATEGORY_CUSTOM,
  SDL3.Sys.Bindgen.Log.SDL_LogPriority (..),
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_PRIORITY_INVALID,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_PRIORITY_TRACE,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_PRIORITY_VERBOSE,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_PRIORITY_DEBUG,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_PRIORITY_INFO,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_PRIORITY_WARN,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_PRIORITY_ERROR,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_PRIORITY_CRITICAL,
  pattern SDL3.Sys.Bindgen.Log.SDL_LOG_PRIORITY_COUNT,
  SDL3.Sys.Bindgen.Log.SDL_LogOutputFunction_Aux (..),
  SDL3.Sys.Bindgen.Log.SDL_LogOutputFunction (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @enum SDL_LogCategory@, defined at @SDL3\/SDL_log.h 90:14@
newtype SDL_LogCategory = SDL_LogCategory
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_LogCategory where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_LogCategory where
  readRaw =
    \ptr0 ->
      pure SDL_LogCategory
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_LogCategory where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_LogCategory unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_LogCategory instance BG.Storable SDL_LogCategory

deriving via BG.CUInt instance BG.Prim SDL_LogCategory

instance CEnum.CEnum SDL_LogCategory where
  type CEnumZ SDL_LogCategory = BG.CUInt

  toCEnum = SDL_LogCategory

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_LOG_CATEGORY_APPLICATION")
        , (1, BG.singleton "SDL_LOG_CATEGORY_ERROR")
        , (2, BG.singleton "SDL_LOG_CATEGORY_ASSERT")
        , (3, BG.singleton "SDL_LOG_CATEGORY_SYSTEM")
        , (4, BG.singleton "SDL_LOG_CATEGORY_AUDIO")
        , (5, BG.singleton "SDL_LOG_CATEGORY_VIDEO")
        , (6, BG.singleton "SDL_LOG_CATEGORY_RENDER")
        , (7, BG.singleton "SDL_LOG_CATEGORY_INPUT")
        , (8, BG.singleton "SDL_LOG_CATEGORY_TEST")
        , (9, BG.singleton "SDL_LOG_CATEGORY_GPU")
        , (10, BG.singleton "SDL_LOG_CATEGORY_RESERVED2")
        , (11, BG.singleton "SDL_LOG_CATEGORY_RESERVED3")
        , (12, BG.singleton "SDL_LOG_CATEGORY_RESERVED4")
        , (13, BG.singleton "SDL_LOG_CATEGORY_RESERVED5")
        , (14, BG.singleton "SDL_LOG_CATEGORY_RESERVED6")
        , (15, BG.singleton "SDL_LOG_CATEGORY_RESERVED7")
        , (16, BG.singleton "SDL_LOG_CATEGORY_RESERVED8")
        , (17, BG.singleton "SDL_LOG_CATEGORY_RESERVED9")
        , (18, BG.singleton "SDL_LOG_CATEGORY_RESERVED10")
        , (19, BG.singleton "SDL_LOG_CATEGORY_CUSTOM")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_LogCategory"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_LogCategory"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_LogCategory where
  minDeclaredValue = SDL_LOG_CATEGORY_APPLICATION

  maxDeclaredValue = SDL_LOG_CATEGORY_CUSTOM

instance Show SDL_LogCategory where
  showsPrec = CEnum.shows

instance Read SDL_LogCategory where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_LogCategory ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_LogCategory{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_LogCategory) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_LogCategory "unwrap" where
  type CFieldType SDL_LogCategory "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_LOG_CATEGORY_APPLICATION@, defined at @SDL3\/SDL_log.h 92:5@
pattern SDL_LOG_CATEGORY_APPLICATION :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_APPLICATION = SDL_LogCategory 0

-- | [C declaration]: @SDL_LOG_CATEGORY_ERROR@, defined at @SDL3\/SDL_log.h 93:5@
pattern SDL_LOG_CATEGORY_ERROR :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_ERROR = SDL_LogCategory 1

-- | [C declaration]: @SDL_LOG_CATEGORY_ASSERT@, defined at @SDL3\/SDL_log.h 94:5@
pattern SDL_LOG_CATEGORY_ASSERT :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_ASSERT = SDL_LogCategory 2

-- | [C declaration]: @SDL_LOG_CATEGORY_SYSTEM@, defined at @SDL3\/SDL_log.h 95:5@
pattern SDL_LOG_CATEGORY_SYSTEM :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_SYSTEM = SDL_LogCategory 3

-- | [C declaration]: @SDL_LOG_CATEGORY_AUDIO@, defined at @SDL3\/SDL_log.h 96:5@
pattern SDL_LOG_CATEGORY_AUDIO :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_AUDIO = SDL_LogCategory 4

-- | [C declaration]: @SDL_LOG_CATEGORY_VIDEO@, defined at @SDL3\/SDL_log.h 97:5@
pattern SDL_LOG_CATEGORY_VIDEO :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_VIDEO = SDL_LogCategory 5

-- | [C declaration]: @SDL_LOG_CATEGORY_RENDER@, defined at @SDL3\/SDL_log.h 98:5@
pattern SDL_LOG_CATEGORY_RENDER :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RENDER = SDL_LogCategory 6

-- | [C declaration]: @SDL_LOG_CATEGORY_INPUT@, defined at @SDL3\/SDL_log.h 99:5@
pattern SDL_LOG_CATEGORY_INPUT :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_INPUT = SDL_LogCategory 7

-- | [C declaration]: @SDL_LOG_CATEGORY_TEST@, defined at @SDL3\/SDL_log.h 100:5@
pattern SDL_LOG_CATEGORY_TEST :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_TEST = SDL_LogCategory 8

-- | [C declaration]: @SDL_LOG_CATEGORY_GPU@, defined at @SDL3\/SDL_log.h 101:5@
pattern SDL_LOG_CATEGORY_GPU :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_GPU = SDL_LogCategory 9

-- | [C declaration]: @SDL_LOG_CATEGORY_RESERVED2@, defined at @SDL3\/SDL_log.h 104:5@
pattern SDL_LOG_CATEGORY_RESERVED2 :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RESERVED2 = SDL_LogCategory 10

-- | [C declaration]: @SDL_LOG_CATEGORY_RESERVED3@, defined at @SDL3\/SDL_log.h 105:5@
pattern SDL_LOG_CATEGORY_RESERVED3 :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RESERVED3 = SDL_LogCategory 11

-- | [C declaration]: @SDL_LOG_CATEGORY_RESERVED4@, defined at @SDL3\/SDL_log.h 106:5@
pattern SDL_LOG_CATEGORY_RESERVED4 :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RESERVED4 = SDL_LogCategory 12

-- | [C declaration]: @SDL_LOG_CATEGORY_RESERVED5@, defined at @SDL3\/SDL_log.h 107:5@
pattern SDL_LOG_CATEGORY_RESERVED5 :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RESERVED5 = SDL_LogCategory 13

-- | [C declaration]: @SDL_LOG_CATEGORY_RESERVED6@, defined at @SDL3\/SDL_log.h 108:5@
pattern SDL_LOG_CATEGORY_RESERVED6 :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RESERVED6 = SDL_LogCategory 14

-- | [C declaration]: @SDL_LOG_CATEGORY_RESERVED7@, defined at @SDL3\/SDL_log.h 109:5@
pattern SDL_LOG_CATEGORY_RESERVED7 :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RESERVED7 = SDL_LogCategory 15

-- | [C declaration]: @SDL_LOG_CATEGORY_RESERVED8@, defined at @SDL3\/SDL_log.h 110:5@
pattern SDL_LOG_CATEGORY_RESERVED8 :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RESERVED8 = SDL_LogCategory 16

-- | [C declaration]: @SDL_LOG_CATEGORY_RESERVED9@, defined at @SDL3\/SDL_log.h 111:5@
pattern SDL_LOG_CATEGORY_RESERVED9 :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RESERVED9 = SDL_LogCategory 17

-- | [C declaration]: @SDL_LOG_CATEGORY_RESERVED10@, defined at @SDL3\/SDL_log.h 112:5@
pattern SDL_LOG_CATEGORY_RESERVED10 :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_RESERVED10 = SDL_LogCategory 18

-- | [C declaration]: @SDL_LOG_CATEGORY_CUSTOM@, defined at @SDL3\/SDL_log.h 122:5@
pattern SDL_LOG_CATEGORY_CUSTOM :: SDL_LogCategory
pattern SDL_LOG_CATEGORY_CUSTOM = SDL_LogCategory 19

-- | The predefined log priorities
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_LogPriority@, defined at @SDL3\/SDL_log.h 130:14@
newtype SDL_LogPriority = SDL_LogPriority
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_LogPriority where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_LogPriority where
  readRaw =
    \ptr0 ->
      pure SDL_LogPriority
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_LogPriority where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_LogPriority unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_LogPriority instance BG.Storable SDL_LogPriority

deriving via BG.CUInt instance BG.Prim SDL_LogPriority

instance CEnum.CEnum SDL_LogPriority where
  type CEnumZ SDL_LogPriority = BG.CUInt

  toCEnum = SDL_LogPriority

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_LOG_PRIORITY_INVALID")
        , (1, BG.singleton "SDL_LOG_PRIORITY_TRACE")
        , (2, BG.singleton "SDL_LOG_PRIORITY_VERBOSE")
        , (3, BG.singleton "SDL_LOG_PRIORITY_DEBUG")
        , (4, BG.singleton "SDL_LOG_PRIORITY_INFO")
        , (5, BG.singleton "SDL_LOG_PRIORITY_WARN")
        , (6, BG.singleton "SDL_LOG_PRIORITY_ERROR")
        , (7, BG.singleton "SDL_LOG_PRIORITY_CRITICAL")
        , (8, BG.singleton "SDL_LOG_PRIORITY_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_LogPriority"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_LogPriority"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_LogPriority where
  minDeclaredValue = SDL_LOG_PRIORITY_INVALID

  maxDeclaredValue = SDL_LOG_PRIORITY_COUNT

instance Show SDL_LogPriority where
  showsPrec = CEnum.shows

instance Read SDL_LogPriority where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_LogPriority ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_LogPriority{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_LogPriority) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_LogPriority "unwrap" where
  type CFieldType SDL_LogPriority "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_LOG_PRIORITY_INVALID@, defined at @SDL3\/SDL_log.h 132:5@
pattern SDL_LOG_PRIORITY_INVALID :: SDL_LogPriority
pattern SDL_LOG_PRIORITY_INVALID = SDL_LogPriority 0

-- | [C declaration]: @SDL_LOG_PRIORITY_TRACE@, defined at @SDL3\/SDL_log.h 133:5@
pattern SDL_LOG_PRIORITY_TRACE :: SDL_LogPriority
pattern SDL_LOG_PRIORITY_TRACE = SDL_LogPriority 1

-- | [C declaration]: @SDL_LOG_PRIORITY_VERBOSE@, defined at @SDL3\/SDL_log.h 134:5@
pattern SDL_LOG_PRIORITY_VERBOSE :: SDL_LogPriority
pattern SDL_LOG_PRIORITY_VERBOSE = SDL_LogPriority 2

-- | [C declaration]: @SDL_LOG_PRIORITY_DEBUG@, defined at @SDL3\/SDL_log.h 135:5@
pattern SDL_LOG_PRIORITY_DEBUG :: SDL_LogPriority
pattern SDL_LOG_PRIORITY_DEBUG = SDL_LogPriority 3

-- | [C declaration]: @SDL_LOG_PRIORITY_INFO@, defined at @SDL3\/SDL_log.h 136:5@
pattern SDL_LOG_PRIORITY_INFO :: SDL_LogPriority
pattern SDL_LOG_PRIORITY_INFO = SDL_LogPriority 4

-- | [C declaration]: @SDL_LOG_PRIORITY_WARN@, defined at @SDL3\/SDL_log.h 137:5@
pattern SDL_LOG_PRIORITY_WARN :: SDL_LogPriority
pattern SDL_LOG_PRIORITY_WARN = SDL_LogPriority 5

-- | [C declaration]: @SDL_LOG_PRIORITY_ERROR@, defined at @SDL3\/SDL_log.h 138:5@
pattern SDL_LOG_PRIORITY_ERROR :: SDL_LogPriority
pattern SDL_LOG_PRIORITY_ERROR = SDL_LogPriority 6

-- | [C declaration]: @SDL_LOG_PRIORITY_CRITICAL@, defined at @SDL3\/SDL_log.h 139:5@
pattern SDL_LOG_PRIORITY_CRITICAL :: SDL_LogPriority
pattern SDL_LOG_PRIORITY_CRITICAL = SDL_LogPriority 7

-- | [C declaration]: @SDL_LOG_PRIORITY_COUNT@, defined at @SDL3\/SDL_log.h 140:5@
pattern SDL_LOG_PRIORITY_COUNT :: SDL_LogPriority
pattern SDL_LOG_PRIORITY_COUNT = SDL_LogPriority 8

-- | Auxiliary type used by 'SDL_LogOutputFunction'
--
--     [C declaration]: @SDL_LogOutputFunction@, defined at @SDL3\/SDL_log.h 485:24@
newtype SDL_LogOutputFunction_Aux = SDL_LogOutputFunction_Aux
  { unwrap :: BG.Ptr BG.Void -> BG.CInt -> SDL_LogPriority -> PtrConst.PtrConst BG.CChar -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_LogOutputFunction_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_e51284d24485bac7_base
    :: (BG.Ptr BG.Void -> BG.Int32 -> BG.Word32 -> BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Int32 -> BG.Word32 -> BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toSDL_LogOutputFunction_Aux@
hs_bindgen_e51284d24485bac7
  :: SDL_LogOutputFunction_Aux
  -> IO (BG.FunPtr SDL_LogOutputFunction_Aux)
hs_bindgen_e51284d24485bac7 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_e51284d24485bac7_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_LogOutputFunction_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_0538751d36e72086_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Int32 -> BG.Word32 -> BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_LogOutputFunction_Aux@
hs_bindgen_0538751d36e72086
  :: BG.FunPtr SDL_LogOutputFunction_Aux
  -> SDL_LogOutputFunction_Aux
hs_bindgen_0538751d36e72086 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_0538751d36e72086_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_LogOutputFunction_Aux where
  toFunPtr = hs_bindgen_e51284d24485bac7

instance BG.FromFunPtr SDL_LogOutputFunction_Aux where
  fromFunPtr = hs_bindgen_0538751d36e72086

instance
  (ty ~ (BG.Ptr BG.Void -> BG.CInt -> SDL_LogPriority -> PtrConst.PtrConst BG.CChar -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_LogOutputFunction_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_LogOutputFunction_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> BG.CInt -> SDL_LogPriority -> PtrConst.PtrConst BG.CChar -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_LogOutputFunction_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_LogOutputFunction_Aux "unwrap" where
  type
    CFieldType SDL_LogOutputFunction_Aux "unwrap" =
      BG.Ptr BG.Void -> BG.CInt -> SDL_LogPriority -> PtrConst.PtrConst BG.CChar -> IO ()

  offset# = \_ -> \_ -> 0

-- | The prototype for the log output callback function.
--
--     This function is called by SDL when there is new text to be logged. A mutex is held so that this function is never called by more than one thread at once.
--
--     [@userdata@]: what was passed as @userdata@ to @SDL_SetLogOutputFunction()@.
--
--     [@category@]: the category of the message.
--
--     [@priority@]: the priority of the message.
--
--     [@message@]: the message being output.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_LogOutputFunction@, defined at @SDL3\/SDL_log.h 485:24@
newtype SDL_LogOutputFunction = SDL_LogOutputFunction
  { unwrap :: BG.FunPtr SDL_LogOutputFunction_Aux
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
  (ty ~ BG.FunPtr SDL_LogOutputFunction_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_LogOutputFunction ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_LogOutputFunction{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_LogOutputFunction_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_LogOutputFunction) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_LogOutputFunction "unwrap" where
  type
    CFieldType SDL_LogOutputFunction "unwrap" =
      BG.FunPtr SDL_LogOutputFunction_Aux

  offset# = \_ -> \_ -> 0
