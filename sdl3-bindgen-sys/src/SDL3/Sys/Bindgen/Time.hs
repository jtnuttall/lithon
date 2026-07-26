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

-- | SDL realtime clock and date\/time routines.
--
--     There are two data types that are used in this category: SDL_Time, which represents the nanoseconds since a specific moment (an \"epoch\"), and 'SDL_DateTime', which breaks time down into human-understandable components: years, months, days, hours, etc.
--
--     Much of the functionality is involved in converting those two types to other useful forms. A structure holding a calendar date and time broken down into its components.
--
--     @since 3.2.0
module SDL3.Sys.Bindgen.Time (
  SDL3.Sys.Bindgen.Time.SDL_DateTime (..),
  SDL3.Sys.Bindgen.Time.SDL_DateFormat (..),
  pattern SDL3.Sys.Bindgen.Time.SDL_DATE_FORMAT_YYYYMMDD,
  pattern SDL3.Sys.Bindgen.Time.SDL_DATE_FORMAT_DDMMYYYY,
  pattern SDL3.Sys.Bindgen.Time.SDL_DATE_FORMAT_MMDDYYYY,
  SDL3.Sys.Bindgen.Time.SDL_TimeFormat (..),
  pattern SDL3.Sys.Bindgen.Time.SDL_TIME_FORMAT_24HR,
  pattern SDL3.Sys.Bindgen.Time.SDL_TIME_FORMAT_12HR,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @struct SDL_DateTime@, defined at @SDL3\/SDL_time.h 54:16@
data SDL_DateTime = SDL_DateTime
  { year :: BG.CInt
  -- ^ Year
  --
  --          [C declaration]: @year@, defined at @SDL3\/SDL_time.h 56:9@
  , month :: BG.CInt
  -- ^ Month [01-12]
  --
  --          [C declaration]: @month@, defined at @SDL3\/SDL_time.h 57:9@
  , day :: BG.CInt
  -- ^ Day of the month [01-31]
  --
  --          [C declaration]: @day@, defined at @SDL3\/SDL_time.h 58:9@
  , hour :: BG.CInt
  -- ^ Hour [0-23]
  --
  --          [C declaration]: @hour@, defined at @SDL3\/SDL_time.h 59:9@
  , minute :: BG.CInt
  -- ^ Minute [0-59]
  --
  --          [C declaration]: @minute@, defined at @SDL3\/SDL_time.h 60:9@
  , second :: BG.CInt
  -- ^ Seconds [0-60]
  --
  --          [C declaration]: @second@, defined at @SDL3\/SDL_time.h 61:9@
  , nanosecond :: BG.CInt
  -- ^ Nanoseconds [0-999999999]
  --
  --          [C declaration]: @nanosecond@, defined at @SDL3\/SDL_time.h 62:9@
  , day_of_week :: BG.CInt
  -- ^ Day of the week [0-6] (0 being Sunday)
  --
  --          [C declaration]: @day_of_week@, defined at @SDL3\/SDL_time.h 63:9@
  , utc_offset :: BG.CInt
  -- ^ Seconds east of UTC
  --
  --          [C declaration]: @utc_offset@, defined at @SDL3\/SDL_time.h 64:9@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_DateTime where
  staticSizeOf = \_ -> (36 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_DateTime where
  readRaw =
    \ptr0 ->
      pure SDL_DateTime
        <*> HasCField.readRaw (BG.Proxy @"year") ptr0
        <*> HasCField.readRaw (BG.Proxy @"month") ptr0
        <*> HasCField.readRaw (BG.Proxy @"day") ptr0
        <*> HasCField.readRaw (BG.Proxy @"hour") ptr0
        <*> HasCField.readRaw (BG.Proxy @"minute") ptr0
        <*> HasCField.readRaw (BG.Proxy @"second") ptr0
        <*> HasCField.readRaw (BG.Proxy @"nanosecond") ptr0
        <*> HasCField.readRaw (BG.Proxy @"day_of_week") ptr0
        <*> HasCField.readRaw (BG.Proxy @"utc_offset") ptr0

instance Marshal.WriteRaw SDL_DateTime where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_DateTime
            year2
            month3
            day4
            hour5
            minute6
            second7
            nanosecond8
            day_of_week9
            utc_offset10 ->
              HasCField.writeRaw (BG.Proxy @"year") ptr0 year2
                >> HasCField.writeRaw (BG.Proxy @"month") ptr0 month3
                >> HasCField.writeRaw (BG.Proxy @"day") ptr0 day4
                >> HasCField.writeRaw (BG.Proxy @"hour") ptr0 hour5
                >> HasCField.writeRaw (BG.Proxy @"minute") ptr0 minute6
                >> HasCField.writeRaw (BG.Proxy @"second") ptr0 second7
                >> HasCField.writeRaw (BG.Proxy @"nanosecond") ptr0 nanosecond8
                >> HasCField.writeRaw (BG.Proxy @"day_of_week") ptr0 day_of_week9
                >> HasCField.writeRaw (BG.Proxy @"utc_offset") ptr0 utc_offset10

deriving via Marshal.EquivStorable SDL_DateTime instance BG.Storable SDL_DateTime

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "year" SDL_DateTime ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateTime
            { year = y1
            , month = BG.getField @"month" x0
            , day = BG.getField @"day" x0
            , hour = BG.getField @"hour" x0
            , minute = BG.getField @"minute" x0
            , second = BG.getField @"second" x0
            , nanosecond = BG.getField @"nanosecond" x0
            , day_of_week = BG.getField @"day_of_week" x0
            , utc_offset = BG.getField @"utc_offset" x0
            }
      , BG.getField @"year" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "year" (BG.Ptr SDL_DateTime) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"year")

instance HasCField.HasCField SDL_DateTime "year" where
  type CFieldType SDL_DateTime "year" = BG.CInt

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "month" SDL_DateTime ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateTime
            { month = y1
            , year = BG.getField @"year" x0
            , day = BG.getField @"day" x0
            , hour = BG.getField @"hour" x0
            , minute = BG.getField @"minute" x0
            , second = BG.getField @"second" x0
            , nanosecond = BG.getField @"nanosecond" x0
            , day_of_week = BG.getField @"day_of_week" x0
            , utc_offset = BG.getField @"utc_offset" x0
            }
      , BG.getField @"month" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "month" (BG.Ptr SDL_DateTime) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"month")

instance HasCField.HasCField SDL_DateTime "month" where
  type CFieldType SDL_DateTime "month" = BG.CInt

  offset# = \_ -> \_ -> 4

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "day" SDL_DateTime ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateTime
            { day = y1
            , year = BG.getField @"year" x0
            , month = BG.getField @"month" x0
            , hour = BG.getField @"hour" x0
            , minute = BG.getField @"minute" x0
            , second = BG.getField @"second" x0
            , nanosecond = BG.getField @"nanosecond" x0
            , day_of_week = BG.getField @"day_of_week" x0
            , utc_offset = BG.getField @"utc_offset" x0
            }
      , BG.getField @"day" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "day" (BG.Ptr SDL_DateTime) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"day")

instance HasCField.HasCField SDL_DateTime "day" where
  type CFieldType SDL_DateTime "day" = BG.CInt

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "hour" SDL_DateTime ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateTime
            { hour = y1
            , year = BG.getField @"year" x0
            , month = BG.getField @"month" x0
            , day = BG.getField @"day" x0
            , minute = BG.getField @"minute" x0
            , second = BG.getField @"second" x0
            , nanosecond = BG.getField @"nanosecond" x0
            , day_of_week = BG.getField @"day_of_week" x0
            , utc_offset = BG.getField @"utc_offset" x0
            }
      , BG.getField @"hour" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "hour" (BG.Ptr SDL_DateTime) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"hour")

instance HasCField.HasCField SDL_DateTime "hour" where
  type CFieldType SDL_DateTime "hour" = BG.CInt

  offset# = \_ -> \_ -> 12

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "minute" SDL_DateTime ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateTime
            { minute = y1
            , year = BG.getField @"year" x0
            , month = BG.getField @"month" x0
            , day = BG.getField @"day" x0
            , hour = BG.getField @"hour" x0
            , second = BG.getField @"second" x0
            , nanosecond = BG.getField @"nanosecond" x0
            , day_of_week = BG.getField @"day_of_week" x0
            , utc_offset = BG.getField @"utc_offset" x0
            }
      , BG.getField @"minute" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "minute" (BG.Ptr SDL_DateTime) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"minute")

instance HasCField.HasCField SDL_DateTime "minute" where
  type CFieldType SDL_DateTime "minute" = BG.CInt

  offset# = \_ -> \_ -> 16

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "second" SDL_DateTime ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateTime
            { second = y1
            , year = BG.getField @"year" x0
            , month = BG.getField @"month" x0
            , day = BG.getField @"day" x0
            , hour = BG.getField @"hour" x0
            , minute = BG.getField @"minute" x0
            , nanosecond = BG.getField @"nanosecond" x0
            , day_of_week = BG.getField @"day_of_week" x0
            , utc_offset = BG.getField @"utc_offset" x0
            }
      , BG.getField @"second" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "second" (BG.Ptr SDL_DateTime) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"second")

instance HasCField.HasCField SDL_DateTime "second" where
  type CFieldType SDL_DateTime "second" = BG.CInt

  offset# = \_ -> \_ -> 20

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "nanosecond" SDL_DateTime ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateTime
            { nanosecond = y1
            , year = BG.getField @"year" x0
            , month = BG.getField @"month" x0
            , day = BG.getField @"day" x0
            , hour = BG.getField @"hour" x0
            , minute = BG.getField @"minute" x0
            , second = BG.getField @"second" x0
            , day_of_week = BG.getField @"day_of_week" x0
            , utc_offset = BG.getField @"utc_offset" x0
            }
      , BG.getField @"nanosecond" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "nanosecond" (BG.Ptr SDL_DateTime) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"nanosecond")

instance HasCField.HasCField SDL_DateTime "nanosecond" where
  type CFieldType SDL_DateTime "nanosecond" = BG.CInt

  offset# = \_ -> \_ -> 24

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "day_of_week" SDL_DateTime ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateTime
            { day_of_week = y1
            , year = BG.getField @"year" x0
            , month = BG.getField @"month" x0
            , day = BG.getField @"day" x0
            , hour = BG.getField @"hour" x0
            , minute = BG.getField @"minute" x0
            , second = BG.getField @"second" x0
            , nanosecond = BG.getField @"nanosecond" x0
            , utc_offset = BG.getField @"utc_offset" x0
            }
      , BG.getField @"day_of_week" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "day_of_week" (BG.Ptr SDL_DateTime) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"day_of_week")

instance HasCField.HasCField SDL_DateTime "day_of_week" where
  type CFieldType SDL_DateTime "day_of_week" = BG.CInt

  offset# = \_ -> \_ -> 28

instance
  (ty ~ BG.CInt)
  => BG.CompatHasField.HasField "utc_offset" SDL_DateTime ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateTime
            { utc_offset = y1
            , year = BG.getField @"year" x0
            , month = BG.getField @"month" x0
            , day = BG.getField @"day" x0
            , hour = BG.getField @"hour" x0
            , minute = BG.getField @"minute" x0
            , second = BG.getField @"second" x0
            , nanosecond = BG.getField @"nanosecond" x0
            , day_of_week = BG.getField @"day_of_week" x0
            }
      , BG.getField @"utc_offset" x0
      )

instance
  (ty ~ BG.CInt)
  => BG.HasField "utc_offset" (BG.Ptr SDL_DateTime) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"utc_offset")

instance HasCField.HasCField SDL_DateTime "utc_offset" where
  type CFieldType SDL_DateTime "utc_offset" = BG.CInt

  offset# = \_ -> \_ -> 32

-- | The preferred date format of the current system locale.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDateTimeLocalePreferences'
--
--     [C declaration]: @enum SDL_DateFormat@, defined at @SDL3\/SDL_time.h 74:14@
newtype SDL_DateFormat = SDL_DateFormat
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_DateFormat where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_DateFormat where
  readRaw =
    \ptr0 ->
      pure SDL_DateFormat
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_DateFormat where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_DateFormat unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_DateFormat instance BG.Storable SDL_DateFormat

deriving via BG.CUInt instance BG.Prim SDL_DateFormat

instance CEnum.CEnum SDL_DateFormat where
  type CEnumZ SDL_DateFormat = BG.CUInt

  toCEnum = SDL_DateFormat

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_DATE_FORMAT_YYYYMMDD")
        , (1, BG.singleton "SDL_DATE_FORMAT_DDMMYYYY")
        , (2, BG.singleton "SDL_DATE_FORMAT_MMDDYYYY")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_DateFormat"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_DateFormat"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_DateFormat where
  minDeclaredValue = SDL_DATE_FORMAT_YYYYMMDD

  maxDeclaredValue = SDL_DATE_FORMAT_MMDDYYYY

instance Show SDL_DateFormat where
  showsPrec = CEnum.shows

instance Read SDL_DateFormat where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_DateFormat ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DateFormat{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_DateFormat) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_DateFormat "unwrap" where
  type CFieldType SDL_DateFormat "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Year\/Month\/Day
--
--     [C declaration]: @SDL_DATE_FORMAT_YYYYMMDD@, defined at @SDL3\/SDL_time.h 76:5@
pattern SDL_DATE_FORMAT_YYYYMMDD :: SDL_DateFormat
pattern SDL_DATE_FORMAT_YYYYMMDD = SDL_DateFormat 0

-- | Day\/Month\/Year
--
--     [C declaration]: @SDL_DATE_FORMAT_DDMMYYYY@, defined at @SDL3\/SDL_time.h 77:5@
pattern SDL_DATE_FORMAT_DDMMYYYY :: SDL_DateFormat
pattern SDL_DATE_FORMAT_DDMMYYYY = SDL_DateFormat 1

-- | Month\/Day\/Year
--
--     [C declaration]: @SDL_DATE_FORMAT_MMDDYYYY@, defined at @SDL3\/SDL_time.h 78:5@
pattern SDL_DATE_FORMAT_MMDDYYYY :: SDL_DateFormat
pattern SDL_DATE_FORMAT_MMDDYYYY = SDL_DateFormat 2

-- | The preferred time format of the current system locale.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetDateTimeLocalePreferences'
--
--     [C declaration]: @enum SDL_TimeFormat@, defined at @SDL3\/SDL_time.h 88:14@
newtype SDL_TimeFormat = SDL_TimeFormat
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_TimeFormat where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_TimeFormat where
  readRaw =
    \ptr0 ->
      pure SDL_TimeFormat
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_TimeFormat where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_TimeFormat unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_TimeFormat instance BG.Storable SDL_TimeFormat

deriving via BG.CUInt instance BG.Prim SDL_TimeFormat

instance CEnum.CEnum SDL_TimeFormat where
  type CEnumZ SDL_TimeFormat = BG.CUInt

  toCEnum = SDL_TimeFormat

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_TIME_FORMAT_24HR")
        , (1, BG.singleton "SDL_TIME_FORMAT_12HR")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_TimeFormat"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_TimeFormat"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_TimeFormat where
  minDeclaredValue = SDL_TIME_FORMAT_24HR

  maxDeclaredValue = SDL_TIME_FORMAT_12HR

instance Show SDL_TimeFormat where
  showsPrec = CEnum.shows

instance Read SDL_TimeFormat where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_TimeFormat ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_TimeFormat{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_TimeFormat) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_TimeFormat "unwrap" where
  type CFieldType SDL_TimeFormat "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | 24 hour time
--
--     [C declaration]: @SDL_TIME_FORMAT_24HR@, defined at @SDL3\/SDL_time.h 90:5@
pattern SDL_TIME_FORMAT_24HR :: SDL_TimeFormat
pattern SDL_TIME_FORMAT_24HR = SDL_TimeFormat 0

-- | 12 hour time
--
--     [C declaration]: @SDL_TIME_FORMAT_12HR@, defined at @SDL3\/SDL_time.h 91:5@
pattern SDL_TIME_FORMAT_12HR :: SDL_TimeFormat
pattern SDL_TIME_FORMAT_12HR = SDL_TimeFormat 1
