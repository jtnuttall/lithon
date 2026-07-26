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

-- | SDL provides an abstract interface for reading and writing data streams. It offers implementations for files, memory, etc, and the app can provide their own implementations, too.
--
--     'SDL_IOStream' is not related to the standard C++ iostream class, other than both are abstract interfaces to read\/write data. 'SDL_IOStream' status, set by a read or write operation.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Iostream (
  SDL3.Sys.Bindgen.Iostream.SDL_IOStatus (..),
  pattern SDL3.Sys.Bindgen.Iostream.SDL_IO_STATUS_READY,
  pattern SDL3.Sys.Bindgen.Iostream.SDL_IO_STATUS_ERROR,
  pattern SDL3.Sys.Bindgen.Iostream.SDL_IO_STATUS_EOF,
  pattern SDL3.Sys.Bindgen.Iostream.SDL_IO_STATUS_NOT_READY,
  pattern SDL3.Sys.Bindgen.Iostream.SDL_IO_STATUS_READONLY,
  pattern SDL3.Sys.Bindgen.Iostream.SDL_IO_STATUS_WRITEONLY,
  SDL3.Sys.Bindgen.Iostream.SDL_IOWhence (..),
  pattern SDL3.Sys.Bindgen.Iostream.SDL_IO_SEEK_SET,
  pattern SDL3.Sys.Bindgen.Iostream.SDL_IO_SEEK_CUR,
  pattern SDL3.Sys.Bindgen.Iostream.SDL_IO_SEEK_END,
  SDL3.Sys.Bindgen.Iostream.SDL_IOStreamInterface (..),
  SDL3.Sys.Bindgen.Iostream.SDL_IOStream,
  SDL3.Sys.Bindgen.Iostream.sDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER,
  SDL3.Sys.Bindgen.Iostream.sDL_PROP_IOSTREAM_STDIO_FILE_POINTER,
  SDL3.Sys.Bindgen.Iostream.sDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER,
  SDL3.Sys.Bindgen.Iostream.sDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER,
  SDL3.Sys.Bindgen.Iostream.sDL_PROP_IOSTREAM_MEMORY_POINTER,
  SDL3.Sys.Bindgen.Iostream.sDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER,
  SDL3.Sys.Bindgen.Iostream.sDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER,
  SDL3.Sys.Bindgen.Iostream.sDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER,
  SDL3.Sys.Bindgen.Iostream.sDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @enum SDL_IOStatus@, defined at @SDL3\/SDL_iostream.h 53:14@
newtype SDL_IOStatus = SDL_IOStatus
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_IOStatus where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_IOStatus where
  readRaw =
    \ptr0 ->
      pure SDL_IOStatus
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_IOStatus where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_IOStatus unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_IOStatus instance BG.Storable SDL_IOStatus

deriving via BG.CUInt instance BG.Prim SDL_IOStatus

instance CEnum.CEnum SDL_IOStatus where
  type CEnumZ SDL_IOStatus = BG.CUInt

  toCEnum = SDL_IOStatus

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_IO_STATUS_READY")
        , (1, BG.singleton "SDL_IO_STATUS_ERROR")
        , (2, BG.singleton "SDL_IO_STATUS_EOF")
        , (3, BG.singleton "SDL_IO_STATUS_NOT_READY")
        , (4, BG.singleton "SDL_IO_STATUS_READONLY")
        , (5, BG.singleton "SDL_IO_STATUS_WRITEONLY")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_IOStatus"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_IOStatus"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_IOStatus where
  minDeclaredValue = SDL_IO_STATUS_READY

  maxDeclaredValue = SDL_IO_STATUS_WRITEONLY

instance Show SDL_IOStatus where
  showsPrec = CEnum.shows

instance Read SDL_IOStatus where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_IOStatus ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_IOStatus{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_IOStatus) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_IOStatus "unwrap" where
  type CFieldType SDL_IOStatus "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Everything is ready (no errors and not EOF).
--
--     [C declaration]: @SDL_IO_STATUS_READY@, defined at @SDL3\/SDL_iostream.h 55:5@
pattern SDL_IO_STATUS_READY :: SDL_IOStatus
pattern SDL_IO_STATUS_READY = SDL_IOStatus 0

-- | Read or write I\/O error
--
--     [C declaration]: @SDL_IO_STATUS_ERROR@, defined at @SDL3\/SDL_iostream.h 56:5@
pattern SDL_IO_STATUS_ERROR :: SDL_IOStatus
pattern SDL_IO_STATUS_ERROR = SDL_IOStatus 1

-- | End of file
--
--     [C declaration]: @SDL_IO_STATUS_EOF@, defined at @SDL3\/SDL_iostream.h 57:5@
pattern SDL_IO_STATUS_EOF :: SDL_IOStatus
pattern SDL_IO_STATUS_EOF = SDL_IOStatus 2

-- | Non blocking I\/O, not ready
--
--     [C declaration]: @SDL_IO_STATUS_NOT_READY@, defined at @SDL3\/SDL_iostream.h 58:5@
pattern SDL_IO_STATUS_NOT_READY :: SDL_IOStatus
pattern SDL_IO_STATUS_NOT_READY = SDL_IOStatus 3

-- | Tried to write a read-only buffer
--
--     [C declaration]: @SDL_IO_STATUS_READONLY@, defined at @SDL3\/SDL_iostream.h 59:5@
pattern SDL_IO_STATUS_READONLY :: SDL_IOStatus
pattern SDL_IO_STATUS_READONLY = SDL_IOStatus 4

-- | Tried to read a write-only buffer
--
--     [C declaration]: @SDL_IO_STATUS_WRITEONLY@, defined at @SDL3\/SDL_iostream.h 60:5@
pattern SDL_IO_STATUS_WRITEONLY :: SDL_IOStatus
pattern SDL_IO_STATUS_WRITEONLY = SDL_IOStatus 5

-- | Possible @whence@ values for 'SDL_IOStream' seeking.
--
--     These map to the same \"whence\" concept that @fseek@ or @lseek@ use in the standard C runtime.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_IOWhence@, defined at @SDL3\/SDL_iostream.h 71:14@
newtype SDL_IOWhence = SDL_IOWhence
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_IOWhence where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_IOWhence where
  readRaw =
    \ptr0 ->
      pure SDL_IOWhence
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_IOWhence where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_IOWhence unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_IOWhence instance BG.Storable SDL_IOWhence

deriving via BG.CUInt instance BG.Prim SDL_IOWhence

instance CEnum.CEnum SDL_IOWhence where
  type CEnumZ SDL_IOWhence = BG.CUInt

  toCEnum = SDL_IOWhence

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_IO_SEEK_SET")
        , (1, BG.singleton "SDL_IO_SEEK_CUR")
        , (2, BG.singleton "SDL_IO_SEEK_END")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_IOWhence"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_IOWhence"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_IOWhence where
  minDeclaredValue = SDL_IO_SEEK_SET

  maxDeclaredValue = SDL_IO_SEEK_END

instance Show SDL_IOWhence where
  showsPrec = CEnum.shows

instance Read SDL_IOWhence where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_IOWhence ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_IOWhence{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_IOWhence) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_IOWhence "unwrap" where
  type CFieldType SDL_IOWhence "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Seek from the beginning of data
--
--     [C declaration]: @SDL_IO_SEEK_SET@, defined at @SDL3\/SDL_iostream.h 73:5@
pattern SDL_IO_SEEK_SET :: SDL_IOWhence
pattern SDL_IO_SEEK_SET = SDL_IOWhence 0

-- | Seek relative to current read point
--
--     [C declaration]: @SDL_IO_SEEK_CUR@, defined at @SDL3\/SDL_iostream.h 74:5@
pattern SDL_IO_SEEK_CUR :: SDL_IOWhence
pattern SDL_IO_SEEK_CUR = SDL_IOWhence 1

-- | Seek relative to the end of data
--
--     [C declaration]: @SDL_IO_SEEK_END@, defined at @SDL3\/SDL_iostream.h 75:5@
pattern SDL_IO_SEEK_END :: SDL_IOWhence
pattern SDL_IO_SEEK_END = SDL_IOWhence 2

-- | The function pointers that drive an 'SDL_IOStream'.
--
--     Applications can provide this struct to @SDL_OpenIO()@ to create their own implementation of 'SDL_IOStream'. This is not necessarily required, as SDL already offers several common types of I\/O streams, via functions like @SDL_IOFromFile()@ and @SDL_IOFromMem()@.
--
--     This structure should be initialized using SDL_INIT_INTERFACE()
--
--     @since 3.2.0
--
--     [See also]: SDL_INIT_INTERFACE
--
--     [C declaration]: @struct SDL_IOStreamInterface@, defined at @SDL3\/SDL_iostream.h 92:16@
data SDL_IOStreamInterface = SDL_IOStreamInterface
  { version :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @version@, defined at @SDL3\/SDL_iostream.h 95:12@
  , size :: BG.FunPtr (BG.Ptr BG.Void -> IO SDL3.Sys.Bindgen.Stdinc.Sint64)
  -- ^ [C declaration]: @size@, defined at @SDL3\/SDL_iostream.h 102:22@
  , seek
      :: BG.FunPtr
           ( BG.Ptr BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Sint64
             -> SDL_IOWhence
             -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
           )
  -- ^ [C declaration]: @seek@, defined at @SDL3\/SDL_iostream.h 110:22@
  , read
      :: BG.FunPtr
           ( BG.Ptr BG.Void
             -> BG.Ptr BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> BG.Ptr SDL_IOStatus
             -> IO HsBindgen.Runtime.LibC.CSize
           )
  -- ^ [C declaration]: @read@, defined at @SDL3\/SDL_iostream.h 122:22@
  , write
      :: BG.FunPtr
           ( BG.Ptr BG.Void
             -> PtrConst.PtrConst BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> BG.Ptr SDL_IOStatus
             -> IO HsBindgen.Runtime.LibC.CSize
           )
  -- ^ [C declaration]: @write@, defined at @SDL3\/SDL_iostream.h 134:22@
  , flush :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr SDL_IOStatus -> IO BG.CBool)
  -- ^ [C declaration]: @flush@, defined at @SDL3\/SDL_iostream.h 145:20@
  , close :: BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool)
  -- ^ [C declaration]: @close@, defined at @SDL3\/SDL_iostream.h 158:20@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_IOStreamInterface where
  staticSizeOf = \_ -> (56 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_IOStreamInterface where
  readRaw =
    \ptr0 ->
      pure SDL_IOStreamInterface
        <*> HasCField.readRaw (BG.Proxy @"version") ptr0
        <*> HasCField.readRaw (BG.Proxy @"size") ptr0
        <*> HasCField.readRaw (BG.Proxy @"seek") ptr0
        <*> HasCField.readRaw (BG.Proxy @"read") ptr0
        <*> HasCField.readRaw (BG.Proxy @"write") ptr0
        <*> HasCField.readRaw (BG.Proxy @"flush") ptr0
        <*> HasCField.readRaw (BG.Proxy @"close") ptr0

instance Marshal.WriteRaw SDL_IOStreamInterface where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_IOStreamInterface version2 size3 seek4 read5 write6 flush7 close8 ->
            HasCField.writeRaw (BG.Proxy @"version") ptr0 version2
              >> HasCField.writeRaw (BG.Proxy @"size") ptr0 size3
              >> HasCField.writeRaw (BG.Proxy @"seek") ptr0 seek4
              >> HasCField.writeRaw (BG.Proxy @"read") ptr0 read5
              >> HasCField.writeRaw (BG.Proxy @"write") ptr0 write6
              >> HasCField.writeRaw (BG.Proxy @"flush") ptr0 flush7
              >> HasCField.writeRaw (BG.Proxy @"close") ptr0 close8

deriving via Marshal.EquivStorable SDL_IOStreamInterface instance BG.Storable SDL_IOStreamInterface

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "version" SDL_IOStreamInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_IOStreamInterface
            { version = y1
            , size = BG.getField @"size" x0
            , seek = BG.getField @"seek" x0
            , read = BG.getField @"read" x0
            , write = BG.getField @"write" x0
            , flush = BG.getField @"flush" x0
            , close = BG.getField @"close" x0
            }
      , BG.getField @"version" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "version" (BG.Ptr SDL_IOStreamInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"version")

instance HasCField.HasCField SDL_IOStreamInterface "version" where
  type
    CFieldType SDL_IOStreamInterface "version" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO SDL3.Sys.Bindgen.Stdinc.Sint64))
  => BG.CompatHasField.HasField "size" SDL_IOStreamInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_IOStreamInterface
            { size = y1
            , version = BG.getField @"version" x0
            , seek = BG.getField @"seek" x0
            , read = BG.getField @"read" x0
            , write = BG.getField @"write" x0
            , flush = BG.getField @"flush" x0
            , close = BG.getField @"close" x0
            }
      , BG.getField @"size" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO SDL3.Sys.Bindgen.Stdinc.Sint64))
  => BG.HasField "size" (BG.Ptr SDL_IOStreamInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"size")

instance HasCField.HasCField SDL_IOStreamInterface "size" where
  type
    CFieldType SDL_IOStreamInterface "size" =
      BG.FunPtr (BG.Ptr BG.Void -> IO SDL3.Sys.Bindgen.Stdinc.Sint64)

  offset# = \_ -> \_ -> 8

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> SDL3.Sys.Bindgen.Stdinc.Sint64
            -> SDL_IOWhence
            -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
          )
  )
  => BG.CompatHasField.HasField "seek" SDL_IOStreamInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_IOStreamInterface
            { seek = y1
            , version = BG.getField @"version" x0
            , size = BG.getField @"size" x0
            , read = BG.getField @"read" x0
            , write = BG.getField @"write" x0
            , flush = BG.getField @"flush" x0
            , close = BG.getField @"close" x0
            }
      , BG.getField @"seek" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> SDL3.Sys.Bindgen.Stdinc.Sint64
            -> SDL_IOWhence
            -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
          )
  )
  => BG.HasField "seek" (BG.Ptr SDL_IOStreamInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"seek")

instance HasCField.HasCField SDL_IOStreamInterface "seek" where
  type
    CFieldType SDL_IOStreamInterface "seek" =
      BG.FunPtr
        ( BG.Ptr BG.Void
          -> SDL3.Sys.Bindgen.Stdinc.Sint64
          -> SDL_IOWhence
          -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
        )

  offset# = \_ -> \_ -> 16

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> BG.Ptr BG.Void
            -> HsBindgen.Runtime.LibC.CSize
            -> BG.Ptr SDL_IOStatus
            -> IO HsBindgen.Runtime.LibC.CSize
          )
  )
  => BG.CompatHasField.HasField "read" SDL_IOStreamInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_IOStreamInterface
            { read = y1
            , version = BG.getField @"version" x0
            , size = BG.getField @"size" x0
            , seek = BG.getField @"seek" x0
            , write = BG.getField @"write" x0
            , flush = BG.getField @"flush" x0
            , close = BG.getField @"close" x0
            }
      , BG.getField @"read" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> BG.Ptr BG.Void
            -> HsBindgen.Runtime.LibC.CSize
            -> BG.Ptr SDL_IOStatus
            -> IO HsBindgen.Runtime.LibC.CSize
          )
  )
  => BG.HasField "read" (BG.Ptr SDL_IOStreamInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"read")

instance HasCField.HasCField SDL_IOStreamInterface "read" where
  type
    CFieldType SDL_IOStreamInterface "read" =
      BG.FunPtr
        ( BG.Ptr BG.Void
          -> BG.Ptr BG.Void
          -> HsBindgen.Runtime.LibC.CSize
          -> BG.Ptr SDL_IOStatus
          -> IO HsBindgen.Runtime.LibC.CSize
        )

  offset# = \_ -> \_ -> 24

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.Void
            -> HsBindgen.Runtime.LibC.CSize
            -> BG.Ptr SDL_IOStatus
            -> IO HsBindgen.Runtime.LibC.CSize
          )
  )
  => BG.CompatHasField.HasField "write" SDL_IOStreamInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_IOStreamInterface
            { write = y1
            , version = BG.getField @"version" x0
            , size = BG.getField @"size" x0
            , seek = BG.getField @"seek" x0
            , read = BG.getField @"read" x0
            , flush = BG.getField @"flush" x0
            , close = BG.getField @"close" x0
            }
      , BG.getField @"write" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.Void
            -> HsBindgen.Runtime.LibC.CSize
            -> BG.Ptr SDL_IOStatus
            -> IO HsBindgen.Runtime.LibC.CSize
          )
  )
  => BG.HasField "write" (BG.Ptr SDL_IOStreamInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"write")

instance HasCField.HasCField SDL_IOStreamInterface "write" where
  type
    CFieldType SDL_IOStreamInterface "write" =
      BG.FunPtr
        ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.Void
          -> HsBindgen.Runtime.LibC.CSize
          -> BG.Ptr SDL_IOStatus
          -> IO HsBindgen.Runtime.LibC.CSize
        )

  offset# = \_ -> \_ -> 32

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr SDL_IOStatus -> IO BG.CBool))
  => BG.CompatHasField.HasField "flush" SDL_IOStreamInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_IOStreamInterface
            { flush = y1
            , version = BG.getField @"version" x0
            , size = BG.getField @"size" x0
            , seek = BG.getField @"seek" x0
            , read = BG.getField @"read" x0
            , write = BG.getField @"write" x0
            , close = BG.getField @"close" x0
            }
      , BG.getField @"flush" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr SDL_IOStatus -> IO BG.CBool))
  => BG.HasField "flush" (BG.Ptr SDL_IOStreamInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"flush")

instance HasCField.HasCField SDL_IOStreamInterface "flush" where
  type
    CFieldType SDL_IOStreamInterface "flush" =
      BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr SDL_IOStatus -> IO BG.CBool)

  offset# = \_ -> \_ -> 40

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool))
  => BG.CompatHasField.HasField "close" SDL_IOStreamInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_IOStreamInterface
            { close = y1
            , version = BG.getField @"version" x0
            , size = BG.getField @"size" x0
            , seek = BG.getField @"seek" x0
            , read = BG.getField @"read" x0
            , write = BG.getField @"write" x0
            , flush = BG.getField @"flush" x0
            }
      , BG.getField @"close" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool))
  => BG.HasField "close" (BG.Ptr SDL_IOStreamInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"close")

instance HasCField.HasCField SDL_IOStreamInterface "close" where
  type
    CFieldType SDL_IOStreamInterface "close" =
      BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool)

  offset# = \_ -> \_ -> 48

-- | The read\/write operation structure.
--
--     This operates as an opaque handle. There are several APIs to create various types of I\/O streams, or an app can supply an 'SDL_IOStreamInterface' to @SDL_OpenIO()@ to provide their own stream implementation behind this struct\'s abstract interface.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_IOStream@, defined at @SDL3\/SDL_iostream.h 182:16@
data SDL_IOStream

-- | [C declaration]: @macro SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER@, literal @\"SDL.iostream.windows.handle\"@, defined at @SDL3\/SDL_iostream.h 280:9@
sDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER :: BG.ByteString
sDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x69
    , 0x6F
    , 0x73
    , 0x74
    , 0x72
    , 0x65
    , 0x61
    , 0x6D
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    , 0x73
    , 0x2E
    , 0x68
    , 0x61
    , 0x6E
    , 0x64
    , 0x6C
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_IOSTREAM_STDIO_FILE_POINTER@, literal @\"SDL.iostream.stdio.file\"@, defined at @SDL3\/SDL_iostream.h 281:9@
sDL_PROP_IOSTREAM_STDIO_FILE_POINTER :: BG.ByteString
sDL_PROP_IOSTREAM_STDIO_FILE_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x69
    , 0x6F
    , 0x73
    , 0x74
    , 0x72
    , 0x65
    , 0x61
    , 0x6D
    , 0x2E
    , 0x73
    , 0x74
    , 0x64
    , 0x69
    , 0x6F
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER@, literal @\"SDL.iostream.file_descriptor\"@, defined at @SDL3\/SDL_iostream.h 282:9@
sDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER :: BG.ByteString
sDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x69
    , 0x6F
    , 0x73
    , 0x74
    , 0x72
    , 0x65
    , 0x61
    , 0x6D
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    , 0x5F
    , 0x64
    , 0x65
    , 0x73
    , 0x63
    , 0x72
    , 0x69
    , 0x70
    , 0x74
    , 0x6F
    , 0x72
    ]

-- | [C declaration]: @macro SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER@, literal @\"SDL.iostream.android.aasset\"@, defined at @SDL3\/SDL_iostream.h 283:9@
sDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER :: BG.ByteString
sDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
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
    , 0x6E
    , 0x64
    , 0x72
    , 0x6F
    , 0x69
    , 0x64
    , 0x2E
    , 0x61
    , 0x61
    , 0x73
    , 0x73
    , 0x65
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_IOSTREAM_MEMORY_POINTER@, literal @\"SDL.iostream.memory.base\"@, defined at @SDL3\/SDL_iostream.h 332:9@
sDL_PROP_IOSTREAM_MEMORY_POINTER :: BG.ByteString
sDL_PROP_IOSTREAM_MEMORY_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x69
    , 0x6F
    , 0x73
    , 0x74
    , 0x72
    , 0x65
    , 0x61
    , 0x6D
    , 0x2E
    , 0x6D
    , 0x65
    , 0x6D
    , 0x6F
    , 0x72
    , 0x79
    , 0x2E
    , 0x62
    , 0x61
    , 0x73
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER@, literal @\"SDL.iostream.memory.size\"@, defined at @SDL3\/SDL_iostream.h 333:9@
sDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER :: BG.ByteString
sDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x69
    , 0x6F
    , 0x73
    , 0x74
    , 0x72
    , 0x65
    , 0x61
    , 0x6D
    , 0x2E
    , 0x6D
    , 0x65
    , 0x6D
    , 0x6F
    , 0x72
    , 0x79
    , 0x2E
    , 0x73
    , 0x69
    , 0x7A
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER@, literal @\"SDL.iostream.memory.free\"@, defined at @SDL3\/SDL_iostream.h 334:9@
sDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER :: BG.ByteString
sDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x69
    , 0x6F
    , 0x73
    , 0x74
    , 0x72
    , 0x65
    , 0x61
    , 0x6D
    , 0x2E
    , 0x6D
    , 0x65
    , 0x6D
    , 0x6F
    , 0x72
    , 0x79
    , 0x2E
    , 0x66
    , 0x72
    , 0x65
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER@, literal @\"SDL.iostream.dynamic.memory\"@, defined at @SDL3\/SDL_iostream.h 413:9@
sDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER :: BG.ByteString
sDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x69
    , 0x6F
    , 0x73
    , 0x74
    , 0x72
    , 0x65
    , 0x61
    , 0x6D
    , 0x2E
    , 0x64
    , 0x79
    , 0x6E
    , 0x61
    , 0x6D
    , 0x69
    , 0x63
    , 0x2E
    , 0x6D
    , 0x65
    , 0x6D
    , 0x6F
    , 0x72
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER@, literal @\"SDL.iostream.dynamic.chunksize\"@, defined at @SDL3\/SDL_iostream.h 414:9@
sDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER :: BG.ByteString
sDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x69
    , 0x6F
    , 0x73
    , 0x74
    , 0x72
    , 0x65
    , 0x61
    , 0x6D
    , 0x2E
    , 0x64
    , 0x79
    , 0x6E
    , 0x61
    , 0x6D
    , 0x69
    , 0x63
    , 0x2E
    , 0x63
    , 0x68
    , 0x75
    , 0x6E
    , 0x6B
    , 0x73
    , 0x69
    , 0x7A
    , 0x65
    ]
