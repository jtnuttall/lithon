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

-- | A helpful assertion macro!
--
--     SDL assertions operate like your usual @assert@ macro, but with some added features:
--
--     * It uses a trick with the @sizeof@ operator, so disabled assertions vaporize out of the compiled code, but variables only referenced in the assertion won\'t trigger compiler warnings about being unused.
--
--     * It is safe to use with a dangling-else: @if (x) SDL_assert(y); else do_something();@
--
--     * It works the same everywhere, instead of counting on various platforms\' compiler and C runtime to behave.
--
--     * It provides multiple levels of assertion (SDL_assert, SDL_assert_release, SDL_assert_paranoid) instead of a single all-or-nothing option.
--
--     * It offers a variety of responses when an assertion fails (retry, trigger the debugger, abort the program, ignore the failure once, ignore it for the rest of the program\'s run).
--
--     * It tries to show the user a dialog by default, if possible, but the app can provide a callback to handle assertion failures however they like.
--
--     * It lets failed assertions be retried. Perhaps you had a network failure and just want to retry the test after plugging your network cable back in? You can.
--
--     * It lets the user ignore an assertion failure, if there\'s a harmless problem that one can continue past.
--
--     * It lets the user mark an assertion as ignored for the rest of the program\'s run; if there\'s a harmless problem that keeps popping up.
--
--     * It provides statistics and data on all failed assertions to the app.
--
--     * It allows the default assertion handler to be controlled with environment variables, in case an automated script needs to control it.
--
--     * It can be used as an aid to Clang\'s static analysis; it will treat SDL assertions as universally true (under the assumption that you are serious about the asserted claims and that your debug builds will detect when these claims were wrong). This can help the analyzer avoid false positives.
--
--     To use it: compile a debug build and just sprinkle around tests to check your code!
module SDL3.Sys.Bindgen.Assert (
  SDL3.Sys.Bindgen.Assert.sDL_ASSERT_LEVEL,
  SDL3.Sys.Bindgen.Assert.sDL_NULL_WHILE_LOOP_CONDITION,
  SDL3.Sys.Bindgen.Assert.SDL_AssertState (..),
  pattern SDL3.Sys.Bindgen.Assert.SDL_ASSERTION_RETRY,
  pattern SDL3.Sys.Bindgen.Assert.SDL_ASSERTION_BREAK,
  pattern SDL3.Sys.Bindgen.Assert.SDL_ASSERTION_ABORT,
  pattern SDL3.Sys.Bindgen.Assert.SDL_ASSERTION_IGNORE,
  pattern SDL3.Sys.Bindgen.Assert.SDL_ASSERTION_ALWAYS_IGNORE,
  SDL3.Sys.Bindgen.Assert.SDL_AssertData (..),
  SDL3.Sys.Bindgen.Assert.SDL_AssertionHandler_Aux (..),
  SDL3.Sys.Bindgen.Assert.SDL_AssertionHandler (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @macro SDL_ASSERT_LEVEL@, defined at @SDL3\/SDL_assert.h 101:9@
sDL_ASSERT_LEVEL :: BG.CInt
sDL_ASSERT_LEVEL = (2 :: BG.CInt)

-- | [C declaration]: @macro SDL_NULL_WHILE_LOOP_CONDITION@, defined at @SDL3\/SDL_assert.h 273:9@
sDL_NULL_WHILE_LOOP_CONDITION :: BG.CInt
sDL_NULL_WHILE_LOOP_CONDITION = (0 :: BG.CInt)

-- | Possible outcomes from a triggered assertion.
--
--     When an enabled assertion triggers, it may call the assertion handler (possibly one provided by the app via SDL_SetAssertionHandler), which will return one of these values, possibly after asking the user.
--
--     Then SDL will respond based on this outcome (loop around to retry the condition, try to break in a debugger, kill the program, or ignore the problem).
--
--     @since 3.2.0
--
--     [C declaration]: @enum SDL_AssertState@, defined at @SDL3\/SDL_assert.h 306:14@
newtype SDL_AssertState = SDL_AssertState
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_AssertState where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_AssertState where
  readRaw =
    \ptr0 ->
      pure SDL_AssertState
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_AssertState where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AssertState unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_AssertState instance BG.Storable SDL_AssertState

deriving via BG.CUInt instance BG.Prim SDL_AssertState

instance CEnum.CEnum SDL_AssertState where
  type CEnumZ SDL_AssertState = BG.CUInt

  toCEnum = SDL_AssertState

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_ASSERTION_RETRY")
        , (1, BG.singleton "SDL_ASSERTION_BREAK")
        , (2, BG.singleton "SDL_ASSERTION_ABORT")
        , (3, BG.singleton "SDL_ASSERTION_IGNORE")
        , (4, BG.singleton "SDL_ASSERTION_ALWAYS_IGNORE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_AssertState"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_AssertState"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_AssertState where
  minDeclaredValue = SDL_ASSERTION_RETRY

  maxDeclaredValue = SDL_ASSERTION_ALWAYS_IGNORE

instance Show SDL_AssertState where
  showsPrec = CEnum.shows

instance Read SDL_AssertState where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_AssertState ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertState{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_AssertState) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AssertState "unwrap" where
  type CFieldType SDL_AssertState "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Retry the assert immediately.
--
--     [C declaration]: @SDL_ASSERTION_RETRY@, defined at @SDL3\/SDL_assert.h 308:5@
pattern SDL_ASSERTION_RETRY :: SDL_AssertState
pattern SDL_ASSERTION_RETRY = SDL_AssertState 0

-- | Make the debugger trigger a breakpoint.
--
--     [C declaration]: @SDL_ASSERTION_BREAK@, defined at @SDL3\/SDL_assert.h 309:5@
pattern SDL_ASSERTION_BREAK :: SDL_AssertState
pattern SDL_ASSERTION_BREAK = SDL_AssertState 1

-- | Terminate the program.
--
--     [C declaration]: @SDL_ASSERTION_ABORT@, defined at @SDL3\/SDL_assert.h 310:5@
pattern SDL_ASSERTION_ABORT :: SDL_AssertState
pattern SDL_ASSERTION_ABORT = SDL_AssertState 2

-- | Ignore the assert.
--
--     [C declaration]: @SDL_ASSERTION_IGNORE@, defined at @SDL3\/SDL_assert.h 311:5@
pattern SDL_ASSERTION_IGNORE :: SDL_AssertState
pattern SDL_ASSERTION_IGNORE = SDL_AssertState 3

-- | Ignore the assert from now on.
--
--     [C declaration]: @SDL_ASSERTION_ALWAYS_IGNORE@, defined at @SDL3\/SDL_assert.h 312:5@
pattern SDL_ASSERTION_ALWAYS_IGNORE :: SDL_AssertState
pattern SDL_ASSERTION_ALWAYS_IGNORE = SDL_AssertState 4

-- | Information about an assertion failure.
--
--     This structure is filled in with information about a triggered assertion, used by the assertion handler, then added to the assertion report. This is returned as a linked list from @SDL_GetAssertionReport()@.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_AssertData@, defined at @SDL3\/SDL_assert.h 324:16@
data SDL_AssertData = SDL_AssertData
  { always_ignore :: BG.CBool
  -- ^ true if app should always continue when assertion is triggered.
  --
  --          [C declaration]: @always_ignore@, defined at @SDL3\/SDL_assert.h 326:10@
  , trigger_count :: BG.CUInt
  -- ^ Number of times this assertion has been triggered.
  --
  --          [C declaration]: @trigger_count@, defined at @SDL3\/SDL_assert.h 327:18@
  , condition :: PtrConst.PtrConst BG.CChar
  -- ^ A string of this assert\'s test code.
  --
  --          [C declaration]: @condition@, defined at @SDL3\/SDL_assert.h 328:17@
  , filename :: PtrConst.PtrConst BG.CChar
  -- ^ The source file where this assert lives.
  --
  --          [C declaration]: @filename@, defined at @SDL3\/SDL_assert.h 329:17@
  , linenum :: BG.CInt
  -- ^ The line in @filename@ where this assert lives.
  --
  --          [C declaration]: @linenum@, defined at @SDL3\/SDL_assert.h 330:9@
  , function :: PtrConst.PtrConst BG.CChar
  -- ^ The name of the function where this assert lives.
  --
  --          [C declaration]: @function@, defined at @SDL3\/SDL_assert.h 331:17@
  , next :: PtrConst.PtrConst SDL_AssertData
  -- ^ next item in the linked list.
  --
  --          [C declaration]: @next@, defined at @SDL3\/SDL_assert.h 332:34@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_AssertData where
  staticSizeOf = \_ -> (48 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_AssertData where
  readRaw =
    \ptr0 ->
      pure SDL_AssertData
        <*> HasCField.readRaw (BG.Proxy @"always_ignore") ptr0
        <*> HasCField.readRaw (BG.Proxy @"trigger_count") ptr0
        <*> HasCField.readRaw (BG.Proxy @"condition") ptr0
        <*> HasCField.readRaw (BG.Proxy @"filename") ptr0
        <*> HasCField.readRaw (BG.Proxy @"linenum") ptr0
        <*> HasCField.readRaw (BG.Proxy @"function") ptr0
        <*> HasCField.readRaw (BG.Proxy @"next") ptr0

instance Marshal.WriteRaw SDL_AssertData where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_AssertData
            always_ignore2
            trigger_count3
            condition4
            filename5
            linenum6
            function7
            next8 ->
              HasCField.writeRaw (BG.Proxy @"always_ignore") ptr0 always_ignore2
                >> HasCField.writeRaw (BG.Proxy @"trigger_count") ptr0 trigger_count3
                >> HasCField.writeRaw (BG.Proxy @"condition") ptr0 condition4
                >> HasCField.writeRaw (BG.Proxy @"filename") ptr0 filename5
                >> HasCField.writeRaw (BG.Proxy @"linenum") ptr0 linenum6
                >> HasCField.writeRaw (BG.Proxy @"function") ptr0 function7
                >> HasCField.writeRaw (BG.Proxy @"next") ptr0 next8

deriving via Marshal.EquivStorable SDL_AssertData instance BG.Storable SDL_AssertData

instance
  (ty ~ BG.CBool)
  => BG.CompatHasField.HasField "always_ignore" SDL_AssertData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertData
            { always_ignore = y1
            , trigger_count = BG.getField @"trigger_count" x0
            , condition = BG.getField @"condition" x0
            , filename = BG.getField @"filename" x0
            , linenum = BG.getField @"linenum" x0
            , function = BG.getField @"function" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"always_ignore" x0
      )

instance
  (ty ~ BG.CBool)
  => BG.HasField "always_ignore" (BG.Ptr SDL_AssertData) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"always_ignore")

instance HasCField.HasCField SDL_AssertData "always_ignore" where
  type
    CFieldType SDL_AssertData "always_ignore" =
      BG.CBool

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "trigger_count" SDL_AssertData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertData
            { trigger_count = y1
            , always_ignore = BG.getField @"always_ignore" x0
            , condition = BG.getField @"condition" x0
            , filename = BG.getField @"filename" x0
            , linenum = BG.getField @"linenum" x0
            , function = BG.getField @"function" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"trigger_count" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "trigger_count" (BG.Ptr SDL_AssertData) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"trigger_count")

instance HasCField.HasCField SDL_AssertData "trigger_count" where
  type
    CFieldType SDL_AssertData "trigger_count" =
      BG.CUInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "condition" SDL_AssertData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertData
            { condition = y1
            , always_ignore = BG.getField @"always_ignore" x0
            , trigger_count = BG.getField @"trigger_count" x0
            , filename = BG.getField @"filename" x0
            , linenum = BG.getField @"linenum" x0
            , function = BG.getField @"function" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"condition" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "condition" (BG.Ptr SDL_AssertData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"condition")

instance HasCField.HasCField SDL_AssertData "condition" where
  type
    CFieldType SDL_AssertData "condition" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 8

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "filename" SDL_AssertData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertData
            { filename = y1
            , always_ignore = BG.getField @"always_ignore" x0
            , trigger_count = BG.getField @"trigger_count" x0
            , condition = BG.getField @"condition" x0
            , linenum = BG.getField @"linenum" x0
            , function = BG.getField @"function" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"filename" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "filename" (BG.Ptr SDL_AssertData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"filename")

instance HasCField.HasCField SDL_AssertData "filename" where
  type
    CFieldType SDL_AssertData "filename" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "linenum" SDL_AssertData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertData
            { linenum = y1
            , always_ignore = BG.getField @"always_ignore" x0
            , trigger_count = BG.getField @"trigger_count" x0
            , condition = BG.getField @"condition" x0
            , filename = BG.getField @"filename" x0
            , function = BG.getField @"function" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"linenum" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "linenum" (BG.Ptr SDL_AssertData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"linenum")

instance HasCField.HasCField SDL_AssertData "linenum" where
  type CFieldType SDL_AssertData "linenum" = BG.CInt

  offset# = \_ -> \_ -> 24

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "function" SDL_AssertData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertData
            { function = y1
            , always_ignore = BG.getField @"always_ignore" x0
            , trigger_count = BG.getField @"trigger_count" x0
            , condition = BG.getField @"condition" x0
            , filename = BG.getField @"filename" x0
            , linenum = BG.getField @"linenum" x0
            , next = BG.getField @"next" x0
            }
      , BG.getField @"function" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "function" (BG.Ptr SDL_AssertData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"function")

instance HasCField.HasCField SDL_AssertData "function" where
  type
    CFieldType SDL_AssertData "function" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 32

instance
  (ty ~ PtrConst.PtrConst SDL_AssertData)
  => BG.CompatHasField.HasField "next" SDL_AssertData ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertData
            { next = y1
            , always_ignore = BG.getField @"always_ignore" x0
            , trigger_count = BG.getField @"trigger_count" x0
            , condition = BG.getField @"condition" x0
            , filename = BG.getField @"filename" x0
            , linenum = BG.getField @"linenum" x0
            , function = BG.getField @"function" x0
            }
      , BG.getField @"next" x0
      )

instance
  (ty ~ PtrConst.PtrConst SDL_AssertData)
  => BG.HasField "next" (BG.Ptr SDL_AssertData) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"next")

instance HasCField.HasCField SDL_AssertData "next" where
  type
    CFieldType SDL_AssertData "next" =
      PtrConst.PtrConst SDL_AssertData

  offset# = \_ -> \_ -> 40

-- | Auxiliary type used by 'SDL_AssertionHandler'
--
--     [C declaration]: @SDL_AssertionHandler@, defined at @SDL3\/SDL_assert.h 565:35@
newtype SDL_AssertionHandler_Aux = SDL_AssertionHandler_Aux
  { unwrap :: PtrConst.PtrConst SDL_AssertData -> BG.Ptr BG.Void -> IO SDL_AssertState
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_AssertionHandler_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_4cf4facc2fb068b6_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32))

-- __unique:__ @toSDL_AssertionHandler_Aux@
hs_bindgen_4cf4facc2fb068b6
  :: SDL_AssertionHandler_Aux
  -> IO (BG.FunPtr SDL_AssertionHandler_Aux)
hs_bindgen_4cf4facc2fb068b6 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_4cf4facc2fb068b6_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_AssertionHandler_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_a1f4d13109856a1b_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @fromSDL_AssertionHandler_Aux@
hs_bindgen_a1f4d13109856a1b
  :: BG.FunPtr SDL_AssertionHandler_Aux
  -> SDL_AssertionHandler_Aux
hs_bindgen_a1f4d13109856a1b =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_a1f4d13109856a1b_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_AssertionHandler_Aux where
  toFunPtr = hs_bindgen_4cf4facc2fb068b6

instance BG.FromFunPtr SDL_AssertionHandler_Aux where
  fromFunPtr = hs_bindgen_a1f4d13109856a1b

instance
  (ty ~ (PtrConst.PtrConst SDL_AssertData -> BG.Ptr BG.Void -> IO SDL_AssertState))
  => BG.CompatHasField.HasField "unwrap" SDL_AssertionHandler_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertionHandler_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (PtrConst.PtrConst SDL_AssertData -> BG.Ptr BG.Void -> IO SDL_AssertState))
  => BG.HasField "unwrap" (BG.Ptr SDL_AssertionHandler_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AssertionHandler_Aux "unwrap" where
  type
    CFieldType SDL_AssertionHandler_Aux "unwrap" =
      PtrConst.PtrConst SDL_AssertData -> BG.Ptr BG.Void -> IO SDL_AssertState

  offset# = \_ -> \_ -> 0

-- | A callback that fires when an SDL assertion fails.
--
--     [@data@]: a pointer to the 'SDL_AssertData' structure corresponding to the current assertion.
--
--     [@userdata@]: what was passed as @userdata@ to @SDL_SetAssertionHandler()@.
--
--     [Returns]: an 'SDL_AssertState' value indicating how to handle the failure.
--
--     [Thread safety]: This callback may be called from any thread that triggers an assert at any time.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_AssertionHandler@, defined at @SDL3\/SDL_assert.h 565:35@
newtype SDL_AssertionHandler = SDL_AssertionHandler
  { unwrap :: BG.FunPtr SDL_AssertionHandler_Aux
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
  (ty ~ BG.FunPtr SDL_AssertionHandler_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_AssertionHandler ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_AssertionHandler{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_AssertionHandler_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_AssertionHandler) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_AssertionHandler "unwrap" where
  type
    CFieldType SDL_AssertionHandler "unwrap" =
      BG.FunPtr SDL_AssertionHandler_Aux

  offset# = \_ -> \_ -> 0
