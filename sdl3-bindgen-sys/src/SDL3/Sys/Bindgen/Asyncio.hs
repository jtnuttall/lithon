{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
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

-- | SDL offers a way to perform I\/O asynchronously. This allows an app to read or write files without waiting for data to actually transfer; the functions that request I\/O never block while the request is fulfilled.
--
--     Instead, the data moves in the background and the app can check for results at their leisure.
--
--     This is more complicated than just reading and writing files in a synchronous way, but it can allow for more efficiency, and never having framerate drops as the hard drive catches up, etc.
--
--     The general usage pattern for async I\/O is:
--
--     * Create one or more 'SDL_AsyncIOQueue' objects.
--
--     * Open files with SDL_AsyncIOFromFile.
--
--     * Start I\/O tasks to the files with SDL_ReadAsyncIO or SDL_WriteAsyncIO, putting those tasks into one of the queues.
--
--     * Later on, use SDL_GetAsyncIOResult on a queue to see if any task is finished without blocking. Tasks might finish in any order with success or failure.
--
--     * When all your tasks are done, close the file with SDL_CloseAsyncIO. This also generates a task, since it might flush data to disk!
--
--     This all works, without blocking, in a single thread, but one can also wait on a queue in a background thread, sleeping until new results have arrived:
--
--     * Call SDL_WaitAsyncIOResult from one or more threads to efficiently block until new tasks complete.
--
--     * When shutting down, call SDL_SignalAsyncIOQueue to unblock any sleeping threads despite there being no new tasks completed.
--
--     And, of course, to match the synchronous SDL_LoadFile, we offer SDL_LoadFileAsync as a convenience function. This will handle allocating a buffer, slurping in the file data, and null-terminating it; you still check for results later.
--
--     Behind the scenes, SDL will use newer, efficient APIs on platforms that support them: Linux\'s io_uring and Windows 11\'s IoRing, for example. If those technologies aren\'t available, SDL will offload the work to a thread pool that will manage otherwise-synchronous loads without blocking the app.
--
--     Best Practices
--
--     Simple non-blocking I\/O for an app that just wants to pick up data whenever it\'s ready without losing framerate waiting on disks to spin can use whatever pattern works well for the program. In this case, simply call SDL_ReadAsyncIO, or maybe SDL_LoadFileAsync, as needed. Once a frame, call SDL_GetAsyncIOResult to check for any completed tasks and deal with the data as it arrives.
--
--     If two separate pieces of the same program need their own I\/O, it is legal for each to create their own queue. This will prevent either piece from accidentally consuming the other\'s completed tasks. Each queue does require some amount of resources, but it is not an overwhelming cost. Do not make a queue for each task, however. It is better to put many tasks into a single queue. They will be reported in order of completion, not in the order they were submitted, so it doesn\'t generally matter what order tasks are started.
--
--     One async I\/O queue can be shared by multiple threads, or one thread can have more than one queue, but the most efficient way if ruthless efficiency is the goal is to have one queue per thread, with multiple threads working in parallel, and attempt to keep each queue loaded with tasks that are both started by and consumed by the same thread. On modern platforms that can use newer interfaces, this can keep data flowing as efficiently as possible all the way from storage hardware to the app, with no contention between threads for access to the same queue.
--
--     Written data is not guaranteed to make it to physical media by the time a closing task is completed, unless SDL_CloseAsyncIO is called with its @flush@ parameter set to true, which is to say that a successful result here can still result in lost data during an unfortunately-timed power outage if not flushed. However, flushing will take longer and may be unnecessary, depending on the app\'s needs. The asynchronous I\/O operation structure.
--
--     This operates as an opaque handle. One can then request read or write operations on it.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_AsyncIOFromFile'
module SDL3.Sys.Bindgen.Asyncio (
  SDL3.Sys.Bindgen.Asyncio.SDL_AsyncIO,
  SDL3.Sys.Bindgen.Asyncio.SDL_AsyncIOTaskType (..),
  pattern SDL3.Sys.Bindgen.Asyncio.SDL_ASYNCIO_TASK_READ,
  pattern SDL3.Sys.Bindgen.Asyncio.SDL_ASYNCIO_TASK_WRITE,
  pattern SDL3.Sys.Bindgen.Asyncio.SDL_ASYNCIO_TASK_CLOSE,
  SDL3.Sys.Bindgen.Asyncio.SDL_AsyncIOResult (..),
  pattern SDL3.Sys.Bindgen.Asyncio.SDL_ASYNCIO_COMPLETE,
  pattern SDL3.Sys.Bindgen.Asyncio.SDL_ASYNCIO_FAILURE,
  pattern SDL3.Sys.Bindgen.Asyncio.SDL_ASYNCIO_CANCELED,
  SDL3.Sys.Bindgen.Asyncio.SDL_AsyncIOOutcome (..),
  SDL3.Sys.Bindgen.Asyncio.SDL_AsyncIOQueue,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @struct SDL_AsyncIO@, defined at @SDL3\/SDL_asyncio.h 124:16@
data SDL_AsyncIO

-- | Types of asynchronous I\/O tasks.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_AsyncIOTaskType@, defined at @SDL3\/SDL_asyncio.h 131:14@
newtype SDL_AsyncIOTaskType = SDL_AsyncIOTaskType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_AsyncIOTaskType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_AsyncIOTaskType where
  readRaw =
    \ptr0 ->
      pure SDL_AsyncIOTaskType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_AsyncIOTaskType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AsyncIOTaskType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_AsyncIOTaskType instance BG.Storable SDL_AsyncIOTaskType

deriving via BG.CUInt instance BG.Prim SDL_AsyncIOTaskType

instance CEnum.CEnum SDL_AsyncIOTaskType where
  type CEnumZ SDL_AsyncIOTaskType = BG.CUInt

  toCEnum = SDL_AsyncIOTaskType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_ASYNCIO_TASK_READ")
        , (1, BG.singleton "SDL_ASYNCIO_TASK_WRITE")
        , (2, BG.singleton "SDL_ASYNCIO_TASK_CLOSE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_AsyncIOTaskType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_AsyncIOTaskType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_AsyncIOTaskType where
  minDeclaredValue = SDL_ASYNCIO_TASK_READ

  maxDeclaredValue = SDL_ASYNCIO_TASK_CLOSE

instance Show SDL_AsyncIOTaskType where
  showsPrec = CEnum.shows

instance Read SDL_AsyncIOTaskType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_AsyncIOTaskType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOTaskType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_AsyncIOTaskType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AsyncIOTaskType "unwrap" where
  type
    CFieldType SDL_AsyncIOTaskType "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | A read operation.
--
--     [C declaration]: @SDL_ASYNCIO_TASK_READ@, defined at @SDL3\/SDL_asyncio.h 133:5@
pattern SDL_ASYNCIO_TASK_READ :: SDL_AsyncIOTaskType
pattern SDL_ASYNCIO_TASK_READ = SDL_AsyncIOTaskType 0

-- | A write operation.
--
--     [C declaration]: @SDL_ASYNCIO_TASK_WRITE@, defined at @SDL3\/SDL_asyncio.h 134:5@
pattern SDL_ASYNCIO_TASK_WRITE :: SDL_AsyncIOTaskType
pattern SDL_ASYNCIO_TASK_WRITE = SDL_AsyncIOTaskType 1

-- | A close operation.
--
--     [C declaration]: @SDL_ASYNCIO_TASK_CLOSE@, defined at @SDL3\/SDL_asyncio.h 135:5@
pattern SDL_ASYNCIO_TASK_CLOSE :: SDL_AsyncIOTaskType
pattern SDL_ASYNCIO_TASK_CLOSE = SDL_AsyncIOTaskType 2

-- | Possible outcomes of an asynchronous I\/O task.
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_AsyncIOResult@, defined at @SDL3\/SDL_asyncio.h 143:14@
newtype SDL_AsyncIOResult = SDL_AsyncIOResult
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_AsyncIOResult where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_AsyncIOResult where
  readRaw =
    \ptr0 ->
      pure SDL_AsyncIOResult
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_AsyncIOResult where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AsyncIOResult unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_AsyncIOResult instance BG.Storable SDL_AsyncIOResult

deriving via BG.CUInt instance BG.Prim SDL_AsyncIOResult

instance CEnum.CEnum SDL_AsyncIOResult where
  type CEnumZ SDL_AsyncIOResult = BG.CUInt

  toCEnum = SDL_AsyncIOResult

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_ASYNCIO_COMPLETE")
        , (1, BG.singleton "SDL_ASYNCIO_FAILURE")
        , (2, BG.singleton "SDL_ASYNCIO_CANCELED")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_AsyncIOResult"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_AsyncIOResult"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_AsyncIOResult where
  minDeclaredValue = SDL_ASYNCIO_COMPLETE

  maxDeclaredValue = SDL_ASYNCIO_CANCELED

instance Show SDL_AsyncIOResult where
  showsPrec = CEnum.shows

instance Read SDL_AsyncIOResult where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_AsyncIOResult ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOResult{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_AsyncIOResult) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AsyncIOResult "unwrap" where
  type CFieldType SDL_AsyncIOResult "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | request was completed without error
--
--     [C declaration]: @SDL_ASYNCIO_COMPLETE@, defined at @SDL3\/SDL_asyncio.h 145:5@
pattern SDL_ASYNCIO_COMPLETE :: SDL_AsyncIOResult
pattern SDL_ASYNCIO_COMPLETE = SDL_AsyncIOResult 0

-- | request failed for some reason; check SDL_GetError()!
--
--     [C declaration]: @SDL_ASYNCIO_FAILURE@, defined at @SDL3\/SDL_asyncio.h 146:5@
pattern SDL_ASYNCIO_FAILURE :: SDL_AsyncIOResult
pattern SDL_ASYNCIO_FAILURE = SDL_AsyncIOResult 1

-- | request was canceled before completing.
--
--     [C declaration]: @SDL_ASYNCIO_CANCELED@, defined at @SDL3\/SDL_asyncio.h 147:5@
pattern SDL_ASYNCIO_CANCELED :: SDL_AsyncIOResult
pattern SDL_ASYNCIO_CANCELED = SDL_AsyncIOResult 2

-- | Information about a completed asynchronous I\/O request.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_AsyncIOOutcome@, defined at @SDL3\/SDL_asyncio.h 155:16@
data SDL_AsyncIOOutcome = SDL_AsyncIOOutcome
  { asyncio :: BG.Ptr SDL_AsyncIO
  -- ^ what generated this task. This pointer will be invalid if it was closed!
  --
  --          [C declaration]: @asyncio@, defined at @SDL3\/SDL_asyncio.h 157:18@
  , type' :: SDL_AsyncIOTaskType
  -- ^ What sort of task was this? Read, write, etc?
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_asyncio.h 158:25@
  , result :: SDL_AsyncIOResult
  -- ^ the result of the work (success, failure, cancellation).
  --
  --          [C declaration]: @result@, defined at @SDL3\/SDL_asyncio.h 159:23@
  , buffer :: BG.Ptr BG.Void
  -- ^ buffer where data was read\/written.
  --
  --          [C declaration]: @buffer@, defined at @SDL3\/SDL_asyncio.h 160:11@
  , offset :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ offset in the 'SDL_AsyncIO' where data was read\/written.
  --
  --          [C declaration]: @offset@, defined at @SDL3\/SDL_asyncio.h 161:12@
  , bytes_requested :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ number of bytes the task was to read\/write.
  --
  --          [C declaration]: @bytes_requested@, defined at @SDL3\/SDL_asyncio.h 162:12@
  , bytes_transferred :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ actual number of bytes that were read\/written.
  --
  --          [C declaration]: @bytes_transferred@, defined at @SDL3\/SDL_asyncio.h 163:12@
  , userdata :: BG.Ptr BG.Void
  -- ^ pointer provided by the app when starting the task
  --
  --          [C declaration]: @userdata@, defined at @SDL3\/SDL_asyncio.h 164:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_AsyncIOOutcome where
  staticSizeOf = \_ -> (56 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_AsyncIOOutcome where
  readRaw =
    \ptr0 ->
      pure SDL_AsyncIOOutcome
        <*> HasCField.readRaw (BG.Proxy @"asyncio") ptr0
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"result") ptr0
        <*> HasCField.readRaw (BG.Proxy @"buffer") ptr0
        <*> HasCField.readRaw (BG.Proxy @"offset") ptr0
        <*> HasCField.readRaw (BG.Proxy @"bytes_requested") ptr0
        <*> HasCField.readRaw (BG.Proxy @"bytes_transferred") ptr0
        <*> HasCField.readRaw (BG.Proxy @"userdata") ptr0

instance Marshal.WriteRaw SDL_AsyncIOOutcome where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AsyncIOOutcome
            asyncio2
            type'3
            result4
            buffer5
            offset6
            bytes_requested7
            bytes_transferred8
            userdata9 ->
              HasCField.writeRaw (BG.Proxy @"asyncio") ptr0 asyncio2
                >> HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'3
                >> HasCField.writeRaw (BG.Proxy @"result") ptr0 result4
                >> HasCField.writeRaw (BG.Proxy @"buffer") ptr0 buffer5
                >> HasCField.writeRaw (BG.Proxy @"offset") ptr0 offset6
                >> HasCField.writeRaw (BG.Proxy @"bytes_requested") ptr0 bytes_requested7
                >> HasCField.writeRaw (BG.Proxy @"bytes_transferred") ptr0 bytes_transferred8
                >> HasCField.writeRaw (BG.Proxy @"userdata") ptr0 userdata9

deriving via Marshal.EquivStorable SDL_AsyncIOOutcome instance BG.Storable SDL_AsyncIOOutcome

instance
  (ty ~ BG.Ptr SDL_AsyncIO)
  => BG.CompatHasField.HasField "asyncio" SDL_AsyncIOOutcome ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOOutcome
            { asyncio = y1
            , type' = BG.getField @"type'" x0
            , result = BG.getField @"result" x0
            , buffer = BG.getField @"buffer" x0
            , offset = BG.getField @"offset" x0
            , bytes_requested = BG.getField @"bytes_requested" x0
            , bytes_transferred = BG.getField @"bytes_transferred" x0
            , userdata = BG.getField @"userdata" x0
            }
      , BG.getField @"asyncio" x0
      )

instance
  (ty ~ BG.Ptr SDL_AsyncIO)
  => BG.HasField "asyncio" (BG.Ptr SDL_AsyncIOOutcome) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"asyncio")

instance HasCField.HasCField SDL_AsyncIOOutcome "asyncio" where
  type
    CFieldType SDL_AsyncIOOutcome "asyncio" =
      BG.Ptr SDL_AsyncIO

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL_AsyncIOTaskType)
  => BG.CompatHasField.HasField "type'" SDL_AsyncIOOutcome ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOOutcome
            { type' = y1
            , asyncio = BG.getField @"asyncio" x0
            , result = BG.getField @"result" x0
            , buffer = BG.getField @"buffer" x0
            , offset = BG.getField @"offset" x0
            , bytes_requested = BG.getField @"bytes_requested" x0
            , bytes_transferred = BG.getField @"bytes_transferred" x0
            , userdata = BG.getField @"userdata" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_AsyncIOTaskType)
  => BG.HasField "type'" (BG.Ptr SDL_AsyncIOOutcome) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_AsyncIOOutcome "type'" where
  type
    CFieldType SDL_AsyncIOOutcome "type'" =
      SDL_AsyncIOTaskType

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL_AsyncIOResult)
  => BG.CompatHasField.HasField "result" SDL_AsyncIOOutcome ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOOutcome
            { result = y1
            , asyncio = BG.getField @"asyncio" x0
            , type' = BG.getField @"type'" x0
            , buffer = BG.getField @"buffer" x0
            , offset = BG.getField @"offset" x0
            , bytes_requested = BG.getField @"bytes_requested" x0
            , bytes_transferred = BG.getField @"bytes_transferred" x0
            , userdata = BG.getField @"userdata" x0
            }
      , BG.getField @"result" x0
      )

instance
  (ty ~ SDL_AsyncIOResult)
  => BG.HasField "result" (BG.Ptr SDL_AsyncIOOutcome) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"result")

instance HasCField.HasCField SDL_AsyncIOOutcome "result" where
  type
    CFieldType SDL_AsyncIOOutcome "result" =
      SDL_AsyncIOResult

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "buffer" SDL_AsyncIOOutcome ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOOutcome
            { buffer = y1
            , asyncio = BG.getField @"asyncio" x0
            , type' = BG.getField @"type'" x0
            , result = BG.getField @"result" x0
            , offset = BG.getField @"offset" x0
            , bytes_requested = BG.getField @"bytes_requested" x0
            , bytes_transferred = BG.getField @"bytes_transferred" x0
            , userdata = BG.getField @"userdata" x0
            }
      , BG.getField @"buffer" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "buffer" (BG.Ptr SDL_AsyncIOOutcome) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"buffer")

instance HasCField.HasCField SDL_AsyncIOOutcome "buffer" where
  type
    CFieldType SDL_AsyncIOOutcome "buffer" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "offset" SDL_AsyncIOOutcome ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOOutcome
            { offset = y1
            , asyncio = BG.getField @"asyncio" x0
            , type' = BG.getField @"type'" x0
            , result = BG.getField @"result" x0
            , buffer = BG.getField @"buffer" x0
            , bytes_requested = BG.getField @"bytes_requested" x0
            , bytes_transferred = BG.getField @"bytes_transferred" x0
            , userdata = BG.getField @"userdata" x0
            }
      , BG.getField @"offset" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "offset" (BG.Ptr SDL_AsyncIOOutcome) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"offset")

instance HasCField.HasCField SDL_AsyncIOOutcome "offset" where
  type
    CFieldType SDL_AsyncIOOutcome "offset" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "bytes_requested" SDL_AsyncIOOutcome ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOOutcome
            { bytes_requested = y1
            , asyncio = BG.getField @"asyncio" x0
            , type' = BG.getField @"type'" x0
            , result = BG.getField @"result" x0
            , buffer = BG.getField @"buffer" x0
            , offset = BG.getField @"offset" x0
            , bytes_transferred = BG.getField @"bytes_transferred" x0
            , userdata = BG.getField @"userdata" x0
            }
      , BG.getField @"bytes_requested" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "bytes_requested" (BG.Ptr SDL_AsyncIOOutcome) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"bytes_requested")

instance HasCField.HasCField SDL_AsyncIOOutcome "bytes_requested" where
  type
    CFieldType SDL_AsyncIOOutcome "bytes_requested" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 32

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "bytes_transferred" SDL_AsyncIOOutcome ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOOutcome
            { bytes_transferred = y1
            , asyncio = BG.getField @"asyncio" x0
            , type' = BG.getField @"type'" x0
            , result = BG.getField @"result" x0
            , buffer = BG.getField @"buffer" x0
            , offset = BG.getField @"offset" x0
            , bytes_requested = BG.getField @"bytes_requested" x0
            , userdata = BG.getField @"userdata" x0
            }
      , BG.getField @"bytes_transferred" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "bytes_transferred" (BG.Ptr SDL_AsyncIOOutcome) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"bytes_transferred")

instance HasCField.HasCField SDL_AsyncIOOutcome "bytes_transferred" where
  type
    CFieldType SDL_AsyncIOOutcome "bytes_transferred" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 40

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "userdata" SDL_AsyncIOOutcome ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AsyncIOOutcome
            { userdata = y1
            , asyncio = BG.getField @"asyncio" x0
            , type' = BG.getField @"type'" x0
            , result = BG.getField @"result" x0
            , buffer = BG.getField @"buffer" x0
            , offset = BG.getField @"offset" x0
            , bytes_requested = BG.getField @"bytes_requested" x0
            , bytes_transferred = BG.getField @"bytes_transferred" x0
            }
      , BG.getField @"userdata" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "userdata" (BG.Ptr SDL_AsyncIOOutcome) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"userdata")

instance HasCField.HasCField SDL_AsyncIOOutcome "userdata" where
  type
    CFieldType SDL_AsyncIOOutcome "userdata" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 48

-- | A queue of completed asynchronous I\/O tasks.
--
--     When starting an asynchronous operation, you specify a queue for the new task. A queue can be asked later if any tasks in it have completed, allowing an app to manage multiple pending tasks in one place, in whatever order they complete.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CreateAsyncIOQueue', 'sDL_ReadAsyncIO', 'sDL_WriteAsyncIO', 'sDL_GetAsyncIOResult', 'sDL_WaitAsyncIOResult'
--
--     [C declaration]: @struct SDL_AsyncIOQueue@, defined at @SDL3\/SDL_asyncio.h 183:16@
data SDL_AsyncIOQueue
