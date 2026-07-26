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

-- | Process control support.
--
--     These functions provide a cross-platform way to spawn and manage OS-level processes.
--
--     You can create a new subprocess with @SDL_CreateProcess()@ and optionally read and write to it using @SDL_ReadProcess()@ or @SDL_GetProcessInput()@ and @SDL_GetProcessOutput()@. If more advanced functionality like chaining input between processes is necessary, you can use @SDL_CreateProcessWithProperties()@.
--
--     You can get the status of a created process with @SDL_WaitProcess()@, or terminate the process with @SDL_KillProcess()@.
--
--     Don\'t forget to call @SDL_DestroyProcess()@ to clean up, whether the process process was killed, terminated on its own, or is still running! An opaque handle representing a system process.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcess'
module SDL3.Sys.Bindgen.Process (
  SDL3.Sys.Bindgen.Process.SDL_Process,
  SDL3.Sys.Bindgen.Process.SDL_ProcessIO (..),
  pattern SDL3.Sys.Bindgen.Process.SDL_PROCESS_STDIO_INHERITED,
  pattern SDL3.Sys.Bindgen.Process.SDL_PROCESS_STDIO_NULL,
  pattern SDL3.Sys.Bindgen.Process.SDL_PROCESS_STDIO_APP,
  pattern SDL3.Sys.Bindgen.Process.SDL_PROCESS_STDIO_REDIRECT,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_ARGS_POINTER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_STDIN_NUMBER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_STDIN_POINTER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_STDOUT_POINTER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_STDERR_NUMBER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_STDERR_POINTER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_CREATE_CMDLINE_STRING,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_PID_NUMBER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_STDIN_POINTER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_STDOUT_POINTER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_STDERR_POINTER,
  SDL3.Sys.Bindgen.Process.sDL_PROP_PROCESS_BACKGROUND_BOOLEAN,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @struct SDL_Process@, defined at @SDL3\/SDL_process.h 64:16@
data SDL_Process

-- | Description of where standard I\/O should be directed when creating a process.
--
--     If a standard I\/O stream is set to SDL_PROCESS_STDIO_INHERITED, it will go to the same place as the application\'s I\/O stream. This is the default for standard output and standard error.
--
--     If a standard I\/O stream is set to SDL_PROCESS_STDIO_NULL, it is connected to @NUL:@ on Windows and @\/dev\/null@ on POSIX systems. This is the default for standard input.
--
--     If a standard I\/O stream is set to SDL_PROCESS_STDIO_APP, it is connected to a new SDL_IOStream that is available to the application. Standard input will be available as @'sDL_PROP_PROCESS_STDIN_POINTER'@ and allows @SDL_GetProcessInput()@, standard output will be available as @'sDL_PROP_PROCESS_STDOUT_POINTER'@ and allows @SDL_ReadProcess()@ and @SDL_GetProcessOutput()@, and standard error will be available as @'sDL_PROP_PROCESS_STDERR_POINTER'@ in the properties for the created process.
--
--     If a standard I\/O stream is set to SDL_PROCESS_STDIO_REDIRECT, it is connected to an existing SDL_IOStream provided by the application. Standard input is provided using @'sDL_PROP_PROCESS_CREATE_STDIN_POINTER'@, standard output is provided using @'sDL_PROP_PROCESS_CREATE_STDOUT_POINTER'@, and standard error is provided using @'sDL_PROP_PROCESS_CREATE_STDERR_POINTER'@ in the creation properties. These existing streams should be closed by the application once the new process is created.
--
--     In order to use an SDL_IOStream with SDL_PROCESS_STDIO_REDIRECT, it must have @SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER@ or @SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER@ set. This is true for streams representing files and process I\/O.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateProcessWithProperties', 'sDL_GetProcessProperties', 'sDL_ReadProcess', 'sDL_GetProcessInput', 'sDL_GetProcessOutput'
--
--     [C declaration]: @enum SDL_ProcessIO@, defined at @SDL3\/SDL_process.h 150:14@
newtype SDL_ProcessIO = SDL_ProcessIO
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_ProcessIO where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_ProcessIO where
  readRaw =
    \ptr0 ->
      pure SDL_ProcessIO
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_ProcessIO where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_ProcessIO unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_ProcessIO instance BG.Storable SDL_ProcessIO

deriving via BG.CUInt instance BG.Prim SDL_ProcessIO

instance CEnum.CEnum SDL_ProcessIO where
  type CEnumZ SDL_ProcessIO = BG.CUInt

  toCEnum = SDL_ProcessIO

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_PROCESS_STDIO_INHERITED")
        , (1, BG.singleton "SDL_PROCESS_STDIO_NULL")
        , (2, BG.singleton "SDL_PROCESS_STDIO_APP")
        , (3, BG.singleton "SDL_PROCESS_STDIO_REDIRECT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_ProcessIO"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_ProcessIO"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_ProcessIO where
  minDeclaredValue = SDL_PROCESS_STDIO_INHERITED

  maxDeclaredValue = SDL_PROCESS_STDIO_REDIRECT

instance Show SDL_ProcessIO where
  showsPrec = CEnum.shows

instance Read SDL_ProcessIO where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_ProcessIO ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_ProcessIO{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_ProcessIO) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_ProcessIO "unwrap" where
  type CFieldType SDL_ProcessIO "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The I\/O stream is inherited from the application.
--
--     [C declaration]: @SDL_PROCESS_STDIO_INHERITED@, defined at @SDL3\/SDL_process.h 152:5@
pattern SDL_PROCESS_STDIO_INHERITED :: SDL_ProcessIO
pattern SDL_PROCESS_STDIO_INHERITED = SDL_ProcessIO 0

-- | The I\/O stream is ignored.
--
--     [C declaration]: @SDL_PROCESS_STDIO_NULL@, defined at @SDL3\/SDL_process.h 153:5@
pattern SDL_PROCESS_STDIO_NULL :: SDL_ProcessIO
pattern SDL_PROCESS_STDIO_NULL = SDL_ProcessIO 1

-- | The I\/O stream is connected to a new SDL_IOStream that the application can read or write
--
--     [C declaration]: @SDL_PROCESS_STDIO_APP@, defined at @SDL3\/SDL_process.h 154:5@
pattern SDL_PROCESS_STDIO_APP :: SDL_ProcessIO
pattern SDL_PROCESS_STDIO_APP = SDL_ProcessIO 2

-- | The I\/O stream is redirected to an existing SDL_IOStream.
--
--     [C declaration]: @SDL_PROCESS_STDIO_REDIRECT@, defined at @SDL3\/SDL_process.h 155:5@
pattern SDL_PROCESS_STDIO_REDIRECT :: SDL_ProcessIO
pattern SDL_PROCESS_STDIO_REDIRECT = SDL_ProcessIO 3

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_ARGS_POINTER@, literal @\"SDL.process.create.args\"@, defined at @SDL3\/SDL_process.h 229:9@
sDL_PROP_PROCESS_CREATE_ARGS_POINTER :: BG.ByteString
sDL_PROP_PROCESS_CREATE_ARGS_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x61
    , 0x72
    , 0x67
    , 0x73
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER@, literal @\"SDL.process.create.environment\"@, defined at @SDL3\/SDL_process.h 230:9@
sDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER :: BG.ByteString
sDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x65
    , 0x6E
    , 0x76
    , 0x69
    , 0x72
    , 0x6F
    , 0x6E
    , 0x6D
    , 0x65
    , 0x6E
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING@, literal @\"SDL.process.create.working_directory\"@, defined at @SDL3\/SDL_process.h 231:9@
sDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING :: BG.ByteString
sDL_PROP_PROCESS_CREATE_WORKING_DIRECTORY_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x77
    , 0x6F
    , 0x72
    , 0x6B
    , 0x69
    , 0x6E
    , 0x67
    , 0x5F
    , 0x64
    , 0x69
    , 0x72
    , 0x65
    , 0x63
    , 0x74
    , 0x6F
    , 0x72
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_STDIN_NUMBER@, literal @\"SDL.process.create.stdin_option\"@, defined at @SDL3\/SDL_process.h 232:9@
sDL_PROP_PROCESS_CREATE_STDIN_NUMBER :: BG.ByteString
sDL_PROP_PROCESS_CREATE_STDIN_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x69
    , 0x6E
    , 0x5F
    , 0x6F
    , 0x70
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_STDIN_POINTER@, literal @\"SDL.process.create.stdin_source\"@, defined at @SDL3\/SDL_process.h 233:9@
sDL_PROP_PROCESS_CREATE_STDIN_POINTER :: BG.ByteString
sDL_PROP_PROCESS_CREATE_STDIN_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x69
    , 0x6E
    , 0x5F
    , 0x73
    , 0x6F
    , 0x75
    , 0x72
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER@, literal @\"SDL.process.create.stdout_option\"@, defined at @SDL3\/SDL_process.h 234:9@
sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER :: BG.ByteString
sDL_PROP_PROCESS_CREATE_STDOUT_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x6F
    , 0x75
    , 0x74
    , 0x5F
    , 0x6F
    , 0x70
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_STDOUT_POINTER@, literal @\"SDL.process.create.stdout_source\"@, defined at @SDL3\/SDL_process.h 235:9@
sDL_PROP_PROCESS_CREATE_STDOUT_POINTER :: BG.ByteString
sDL_PROP_PROCESS_CREATE_STDOUT_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x6F
    , 0x75
    , 0x74
    , 0x5F
    , 0x73
    , 0x6F
    , 0x75
    , 0x72
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_STDERR_NUMBER@, literal @\"SDL.process.create.stderr_option\"@, defined at @SDL3\/SDL_process.h 236:9@
sDL_PROP_PROCESS_CREATE_STDERR_NUMBER :: BG.ByteString
sDL_PROP_PROCESS_CREATE_STDERR_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x65
    , 0x72
    , 0x72
    , 0x5F
    , 0x6F
    , 0x70
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_STDERR_POINTER@, literal @\"SDL.process.create.stderr_source\"@, defined at @SDL3\/SDL_process.h 237:9@
sDL_PROP_PROCESS_CREATE_STDERR_POINTER :: BG.ByteString
sDL_PROP_PROCESS_CREATE_STDERR_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x65
    , 0x72
    , 0x72
    , 0x5F
    , 0x73
    , 0x6F
    , 0x75
    , 0x72
    , 0x63
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN@, literal @\"SDL.process.create.stderr_to_stdout\"@, defined at @SDL3\/SDL_process.h 238:9@
sDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN :: BG.ByteString
sDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x65
    , 0x72
    , 0x72
    , 0x5F
    , 0x74
    , 0x6F
    , 0x5F
    , 0x73
    , 0x74
    , 0x64
    , 0x6F
    , 0x75
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN@, literal @\"SDL.process.create.background\"@, defined at @SDL3\/SDL_process.h 239:9@
sDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN :: BG.ByteString
sDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x62
    , 0x61
    , 0x63
    , 0x6B
    , 0x67
    , 0x72
    , 0x6F
    , 0x75
    , 0x6E
    , 0x64
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_CREATE_CMDLINE_STRING@, literal @\"SDL.process.create.cmdline\"@, defined at @SDL3\/SDL_process.h 240:9@
sDL_PROP_PROCESS_CREATE_CMDLINE_STRING :: BG.ByteString
sDL_PROP_PROCESS_CREATE_CMDLINE_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x63
    , 0x72
    , 0x65
    , 0x61
    , 0x74
    , 0x65
    , 0x2E
    , 0x63
    , 0x6D
    , 0x64
    , 0x6C
    , 0x69
    , 0x6E
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_PID_NUMBER@, literal @\"SDL.process.pid\"@, defined at @SDL3\/SDL_process.h 273:9@
sDL_PROP_PROCESS_PID_NUMBER :: BG.ByteString
sDL_PROP_PROCESS_PID_NUMBER =
  BG.pack [0x53, 0x44, 0x4C, 0x2E, 0x70, 0x72, 0x6F, 0x63, 0x65, 0x73, 0x73, 0x2E, 0x70, 0x69, 0x64]

-- | [C declaration]: @macro SDL_PROP_PROCESS_STDIN_POINTER@, literal @\"SDL.process.stdin\"@, defined at @SDL3\/SDL_process.h 274:9@
sDL_PROP_PROCESS_STDIN_POINTER :: BG.ByteString
sDL_PROP_PROCESS_STDIN_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x69
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_STDOUT_POINTER@, literal @\"SDL.process.stdout\"@, defined at @SDL3\/SDL_process.h 275:9@
sDL_PROP_PROCESS_STDOUT_POINTER :: BG.ByteString
sDL_PROP_PROCESS_STDOUT_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x6F
    , 0x75
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_STDERR_POINTER@, literal @\"SDL.process.stderr\"@, defined at @SDL3\/SDL_process.h 276:9@
sDL_PROP_PROCESS_STDERR_POINTER :: BG.ByteString
sDL_PROP_PROCESS_STDERR_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x65
    , 0x72
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_PROCESS_BACKGROUND_BOOLEAN@, literal @\"SDL.process.background\"@, defined at @SDL3\/SDL_process.h 277:9@
sDL_PROP_PROCESS_BACKGROUND_BOOLEAN :: BG.ByteString
sDL_PROP_PROCESS_BACKGROUND_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x70
    , 0x72
    , 0x6F
    , 0x63
    , 0x65
    , 0x73
    , 0x73
    , 0x2E
    , 0x62
    , 0x61
    , 0x63
    , 0x6B
    , 0x67
    , 0x72
    , 0x6F
    , 0x75
    , 0x6E
    , 0x64
    ]
