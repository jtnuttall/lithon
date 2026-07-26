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

module SDL3.Sys.Bindgen.Stdinc (
  SDL3.Sys.Bindgen.Stdinc.Sint8 (..),
  SDL3.Sys.Bindgen.Stdinc.Uint8 (..),
  SDL3.Sys.Bindgen.Stdinc.Sint16 (..),
  SDL3.Sys.Bindgen.Stdinc.Uint16 (..),
  SDL3.Sys.Bindgen.Stdinc.Sint32 (..),
  SDL3.Sys.Bindgen.Stdinc.Uint32 (..),
  SDL3.Sys.Bindgen.Stdinc.Sint64 (..),
  SDL3.Sys.Bindgen.Stdinc.Uint64 (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_Time (..),
  SDL3.Sys.Bindgen.Stdinc.sDL_FLT_EPSILON,
  SDL3.Sys.Bindgen.Stdinc.sDL_PRILL_PREFIX,
  SDL3.Sys.Bindgen.Stdinc.SDL_alignment_test (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_DUMMY_ENUM (..),
  pattern SDL3.Sys.Bindgen.Stdinc.DUMMY_ENUM_VALUE,
  SDL3.Sys.Bindgen.Stdinc.SDL_malloc_func_Aux (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_malloc_func (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_calloc_func_Aux (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_calloc_func (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_realloc_func_Aux (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_realloc_func (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_free_func_Aux (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_free_func (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_Environment,
  SDL3.Sys.Bindgen.Stdinc.SDL_CompareCallback_Aux (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_CompareCallback (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_CompareCallback_r_Aux (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_CompareCallback_r (..),
  SDL3.Sys.Bindgen.Stdinc.sDL_INVALID_UNICODE_CODEPOINT,
  SDL3.Sys.Bindgen.Stdinc.sDL_PI_D,
  SDL3.Sys.Bindgen.Stdinc.sDL_PI_F,
  SDL3.Sys.Bindgen.Stdinc.SDL_iconv_data_t,
  SDL3.Sys.Bindgen.Stdinc.SDL_iconv_t (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer_Aux (..),
  SDL3.Sys.Bindgen.Stdinc.SDL_FunctionPointer (..),
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | A signed 8-bit integer type.
--
--     @since 3.2.0
--
--     [C declaration]: @Sint8@, defined at @SDL3\/SDL_stdinc.h 437:16@
newtype Sint8 = Sint8
  { unwrap :: HsBindgen.Runtime.LibC.Int8
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
  (ty ~ HsBindgen.Runtime.LibC.Int8)
  => BG.CompatHasField.HasField "unwrap" Sint8 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Sint8{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Int8)
  => BG.HasField "unwrap" (BG.Ptr Sint8) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Sint8 "unwrap" where
  type
    CFieldType Sint8 "unwrap" =
      HsBindgen.Runtime.LibC.Int8

  offset# = \_ -> \_ -> 0

-- | An unsigned 8-bit integer type.
--
--     @since 3.2.0
--
--     [C declaration]: @Uint8@, defined at @SDL3\/SDL_stdinc.h 446:17@
newtype Uint8 = Uint8
  { unwrap :: HsBindgen.Runtime.LibC.Word8
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
  (ty ~ HsBindgen.Runtime.LibC.Word8)
  => BG.CompatHasField.HasField "unwrap" Uint8 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Uint8{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Word8)
  => BG.HasField "unwrap" (BG.Ptr Uint8) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Uint8 "unwrap" where
  type
    CFieldType Uint8 "unwrap" =
      HsBindgen.Runtime.LibC.Word8

  offset# = \_ -> \_ -> 0

-- | A signed 16-bit integer type.
--
--     @since 3.2.0
--
--     [C declaration]: @Sint16@, defined at @SDL3\/SDL_stdinc.h 455:17@
newtype Sint16 = Sint16
  { unwrap :: HsBindgen.Runtime.LibC.Int16
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
  (ty ~ HsBindgen.Runtime.LibC.Int16)
  => BG.CompatHasField.HasField "unwrap" Sint16 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Sint16{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Int16)
  => BG.HasField "unwrap" (BG.Ptr Sint16) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Sint16 "unwrap" where
  type
    CFieldType Sint16 "unwrap" =
      HsBindgen.Runtime.LibC.Int16

  offset# = \_ -> \_ -> 0

-- | An unsigned 16-bit integer type.
--
--     @since 3.2.0
--
--     [C declaration]: @Uint16@, defined at @SDL3\/SDL_stdinc.h 464:18@
newtype Uint16 = Uint16
  { unwrap :: HsBindgen.Runtime.LibC.Word16
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
  (ty ~ HsBindgen.Runtime.LibC.Word16)
  => BG.CompatHasField.HasField "unwrap" Uint16 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Uint16{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Word16)
  => BG.HasField "unwrap" (BG.Ptr Uint16) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Uint16 "unwrap" where
  type
    CFieldType Uint16 "unwrap" =
      HsBindgen.Runtime.LibC.Word16

  offset# = \_ -> \_ -> 0

-- | A signed 32-bit integer type.
--
--     @since 3.2.0
--
--     [C declaration]: @Sint32@, defined at @SDL3\/SDL_stdinc.h 473:17@
newtype Sint32 = Sint32
  { unwrap :: HsBindgen.Runtime.LibC.Int32
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
  (ty ~ HsBindgen.Runtime.LibC.Int32)
  => BG.CompatHasField.HasField "unwrap" Sint32 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Sint32{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Int32)
  => BG.HasField "unwrap" (BG.Ptr Sint32) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Sint32 "unwrap" where
  type
    CFieldType Sint32 "unwrap" =
      HsBindgen.Runtime.LibC.Int32

  offset# = \_ -> \_ -> 0

-- | An unsigned 32-bit integer type.
--
--     @since 3.2.0
--
--     [C declaration]: @Uint32@, defined at @SDL3\/SDL_stdinc.h 482:18@
newtype Uint32 = Uint32
  { unwrap :: HsBindgen.Runtime.LibC.Word32
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
  (ty ~ HsBindgen.Runtime.LibC.Word32)
  => BG.CompatHasField.HasField "unwrap" Uint32 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Uint32{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Word32)
  => BG.HasField "unwrap" (BG.Ptr Uint32) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Uint32 "unwrap" where
  type
    CFieldType Uint32 "unwrap" =
      HsBindgen.Runtime.LibC.Word32

  offset# = \_ -> \_ -> 0

-- | A signed 64-bit integer type.
--
--     @since 3.2.0
--
--     [See also]: @SDL_SINT64_C@
--
--     [C declaration]: @Sint64@, defined at @SDL3\/SDL_stdinc.h 493:17@
newtype Sint64 = Sint64
  { unwrap :: HsBindgen.Runtime.LibC.Int64
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
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.CompatHasField.HasField "unwrap" Sint64 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Sint64{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Int64)
  => BG.HasField "unwrap" (BG.Ptr Sint64) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Sint64 "unwrap" where
  type
    CFieldType Sint64 "unwrap" =
      HsBindgen.Runtime.LibC.Int64

  offset# = \_ -> \_ -> 0

-- | An unsigned 64-bit integer type.
--
--     @since 3.2.0
--
--     [See also]: @SDL_UINT64_C@
--
--     [C declaration]: @Uint64@, defined at @SDL3\/SDL_stdinc.h 504:18@
newtype Uint64 = Uint64
  { unwrap :: HsBindgen.Runtime.LibC.Word64
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
  (ty ~ HsBindgen.Runtime.LibC.Word64)
  => BG.CompatHasField.HasField "unwrap" Uint64 ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          Uint64{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ HsBindgen.Runtime.LibC.Word64)
  => BG.HasField "unwrap" (BG.Ptr Uint64) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField Uint64 "unwrap" where
  type
    CFieldType Uint64 "unwrap" =
      HsBindgen.Runtime.LibC.Word64

  offset# = \_ -> \_ -> 0

-- | SDL times are signed, 64-bit integers representing nanoseconds since the Unix epoch (Jan 1, 1970).
--
--     They can be converted between POSIX time_t values with SDL_NS_TO_SECONDS() and SDL_SECONDS_TO_NS(), and between Windows FILETIME values with SDL_TimeToWindows() and SDL_TimeFromWindows().
--
--     @since 3.2.0
--
--     [See also]: @SDL_MAX_SINT64@, @SDL_MIN_SINT64@
--
--     [C declaration]: @SDL_Time@, defined at @SDL3\/SDL_stdinc.h 521:16@
newtype SDL_Time = SDL_Time
  { unwrap :: Sint64
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

instance (ty ~ Sint64) => BG.CompatHasField.HasField "unwrap" SDL_Time ty where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Time{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ Sint64)
  => BG.HasField "unwrap" (BG.Ptr SDL_Time) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_Time "unwrap" where
  type CFieldType SDL_Time "unwrap" = Sint64

  offset# = \_ -> \_ -> 0

-- | Epsilon constant, used for comparing floating-point numbers.
--
--     Equals by default to platform-defined @FLT_EPSILON@, or @1.1920928955078125e-07F@ if that\'s not available.
--
--     @since 3.2.0
--
--     [C declaration]: @macro SDL_FLT_EPSILON@, defined at @SDL3\/SDL_stdinc.h 544:9@
sDL_FLT_EPSILON :: BG.CFloat
sDL_FLT_EPSILON = (1.1920929e-7 :: BG.CFloat)

-- | [C declaration]: @macro SDL_PRILL_PREFIX@, literal @\"ll\"@, defined at @SDL3\/SDL_stdinc.h 808:9@
sDL_PRILL_PREFIX :: BG.ByteString
sDL_PRILL_PREFIX = BG.pack [0x6C, 0x6C]

-- | [C declaration]: @struct SDL_alignment_test@, defined at @SDL3\/SDL_stdinc.h 1182:16@
data SDL_alignment_test = SDL_alignment_test
  { a :: Uint8
  -- ^ [C declaration]: @a@, defined at @SDL3\/SDL_stdinc.h 1184:11@
  , b :: BG.Ptr BG.Void
  -- ^ [C declaration]: @b@, defined at @SDL3\/SDL_stdinc.h 1185:11@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_alignment_test where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_alignment_test where
  readRaw =
    \ptr0 ->
      pure SDL_alignment_test
        <*> HasCField.readRaw (BG.Proxy @"a") ptr0
        <*> HasCField.readRaw (BG.Proxy @"b") ptr0

instance Marshal.WriteRaw SDL_alignment_test where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_alignment_test a2 b3 ->
            HasCField.writeRaw (BG.Proxy @"a") ptr0 a2
              >> HasCField.writeRaw (BG.Proxy @"b") ptr0 b3

deriving via Marshal.EquivStorable SDL_alignment_test instance BG.Storable SDL_alignment_test

instance
  (ty ~ Uint8)
  => BG.CompatHasField.HasField "a" SDL_alignment_test ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_alignment_test{a = y1, b = BG.getField @"b" x0}
      , BG.getField @"a" x0
      )

instance
  (ty ~ Uint8)
  => BG.HasField "a" (BG.Ptr SDL_alignment_test) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"a")

instance HasCField.HasCField SDL_alignment_test "a" where
  type CFieldType SDL_alignment_test "a" = Uint8

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.CompatHasField.HasField "b" SDL_alignment_test ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_alignment_test{b = y1, a = BG.getField @"a" x0}
      , BG.getField @"b" x0
      )

instance
  (ty ~ BG.Ptr BG.Void)
  => BG.HasField "b" (BG.Ptr SDL_alignment_test) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"b")

instance HasCField.HasCField SDL_alignment_test "b" where
  type
    CFieldType SDL_alignment_test "b" =
      BG.Ptr BG.Void

  offset# = \_ -> \_ -> 8

-- | [C declaration]: @enum SDL_DUMMY_ENUM@, defined at @SDL3\/SDL_stdinc.h 1202:14@
newtype SDL_DUMMY_ENUM = SDL_DUMMY_ENUM
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_DUMMY_ENUM where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_DUMMY_ENUM where
  readRaw =
    \ptr0 ->
      pure SDL_DUMMY_ENUM
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_DUMMY_ENUM where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_DUMMY_ENUM unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_DUMMY_ENUM instance BG.Storable SDL_DUMMY_ENUM

deriving via BG.CUInt instance BG.Prim SDL_DUMMY_ENUM

instance CEnum.CEnum SDL_DUMMY_ENUM where
  type CEnumZ SDL_DUMMY_ENUM = BG.CUInt

  toCEnum = SDL_DUMMY_ENUM

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList [(0, BG.singleton "DUMMY_ENUM_VALUE")]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_DUMMY_ENUM"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_DUMMY_ENUM"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_DUMMY_ENUM where
  minDeclaredValue = DUMMY_ENUM_VALUE

  maxDeclaredValue = DUMMY_ENUM_VALUE

instance Show SDL_DUMMY_ENUM where
  showsPrec = CEnum.shows

instance Read SDL_DUMMY_ENUM where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_DUMMY_ENUM ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DUMMY_ENUM{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_DUMMY_ENUM) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_DUMMY_ENUM "unwrap" where
  type CFieldType SDL_DUMMY_ENUM "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @DUMMY_ENUM_VALUE@, defined at @SDL3\/SDL_stdinc.h 1204:5@
pattern DUMMY_ENUM_VALUE :: SDL_DUMMY_ENUM
pattern DUMMY_ENUM_VALUE = SDL_DUMMY_ENUM 0

-- | Auxiliary type used by 'SDL_malloc_func'
--
--     [C declaration]: @SDL_malloc_func@, defined at @SDL3\/SDL_stdinc.h 1445:25@
newtype SDL_malloc_func_Aux = SDL_malloc_func_Aux
  { unwrap :: HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_malloc_func_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_5c5a0694498aea22_base
    :: (BG.Word64 -> IO (BG.Ptr BG.Void))
    -> IO (BG.FunPtr (BG.Word64 -> IO (BG.Ptr BG.Void)))

-- __unique:__ @toSDL_malloc_func_Aux@
hs_bindgen_5c5a0694498aea22
  :: SDL_malloc_func_Aux
  -> IO (BG.FunPtr SDL_malloc_func_Aux)
hs_bindgen_5c5a0694498aea22 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_5c5a0694498aea22_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_malloc_func_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_3dfc01b3bec18b2f_base
    :: BG.FunPtr (BG.Word64 -> IO (BG.Ptr BG.Void))
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @fromSDL_malloc_func_Aux@
hs_bindgen_3dfc01b3bec18b2f
  :: BG.FunPtr SDL_malloc_func_Aux
  -> SDL_malloc_func_Aux
hs_bindgen_3dfc01b3bec18b2f =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_3dfc01b3bec18b2f_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_malloc_func_Aux where
  toFunPtr = hs_bindgen_5c5a0694498aea22

instance BG.FromFunPtr SDL_malloc_func_Aux where
  fromFunPtr = hs_bindgen_3dfc01b3bec18b2f

instance
  (ty ~ (HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
  => BG.CompatHasField.HasField "unwrap" SDL_malloc_func_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_malloc_func_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
  => BG.HasField "unwrap" (BG.Ptr SDL_malloc_func_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_malloc_func_Aux "unwrap" where
  type
    CFieldType SDL_malloc_func_Aux "unwrap" =
      HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)

  offset# = \_ -> \_ -> 0

-- | A callback used to implement @SDL_malloc()@.
--
--     SDL will always ensure that the passed @size@ is greater than 0.
--
--     [@size@]: the size to allocate.
--
--     [Returns]: a pointer to the allocated memory, or NULL if allocation failed.
--
--     [Thread safety]: It should be safe to call this callback from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_malloc', 'sDL_GetOriginalMemoryFunctions', 'sDL_GetMemoryFunctions', 'sDL_SetMemoryFunctions'
--
--     [C declaration]: @SDL_malloc_func@, defined at @SDL3\/SDL_stdinc.h 1445:25@
newtype SDL_malloc_func = SDL_malloc_func
  { unwrap :: BG.FunPtr SDL_malloc_func_Aux
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
  (ty ~ BG.FunPtr SDL_malloc_func_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_malloc_func ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_malloc_func{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_malloc_func_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_malloc_func) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_malloc_func "unwrap" where
  type
    CFieldType SDL_malloc_func "unwrap" =
      BG.FunPtr SDL_malloc_func_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_calloc_func'
--
--     [C declaration]: @SDL_calloc_func@, defined at @SDL3\/SDL_stdinc.h 1466:25@
newtype SDL_calloc_func_Aux = SDL_calloc_func_Aux
  { unwrap :: HsBindgen.Runtime.LibC.CSize -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_calloc_func_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_e0fe0baaf22a9277_base
    :: (BG.Word64 -> BG.Word64 -> IO (BG.Ptr BG.Void))
    -> IO (BG.FunPtr (BG.Word64 -> BG.Word64 -> IO (BG.Ptr BG.Void)))

-- __unique:__ @toSDL_calloc_func_Aux@
hs_bindgen_e0fe0baaf22a9277
  :: SDL_calloc_func_Aux
  -> IO (BG.FunPtr SDL_calloc_func_Aux)
hs_bindgen_e0fe0baaf22a9277 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_e0fe0baaf22a9277_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_calloc_func_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_3046202e62b950f1_base
    :: BG.FunPtr (BG.Word64 -> BG.Word64 -> IO (BG.Ptr BG.Void))
    -> BG.Word64
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @fromSDL_calloc_func_Aux@
hs_bindgen_3046202e62b950f1
  :: BG.FunPtr SDL_calloc_func_Aux
  -> SDL_calloc_func_Aux
hs_bindgen_3046202e62b950f1 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_3046202e62b950f1_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_calloc_func_Aux where
  toFunPtr = hs_bindgen_e0fe0baaf22a9277

instance BG.FromFunPtr SDL_calloc_func_Aux where
  fromFunPtr = hs_bindgen_3046202e62b950f1

instance
  (ty ~ (HsBindgen.Runtime.LibC.CSize -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
  => BG.CompatHasField.HasField "unwrap" SDL_calloc_func_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_calloc_func_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (HsBindgen.Runtime.LibC.CSize -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
  => BG.HasField "unwrap" (BG.Ptr SDL_calloc_func_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_calloc_func_Aux "unwrap" where
  type
    CFieldType SDL_calloc_func_Aux "unwrap" =
      HsBindgen.Runtime.LibC.CSize -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)

  offset# = \_ -> \_ -> 0

-- | A callback used to implement SDL_calloc().
--
--     SDL will always ensure that the passed @nmemb@ and @size@ are both greater than 0.
--
--     [@nmemb@]: the number of elements in the array.
--
--     [@size@]: the size of each element of the array.
--
--     [Returns]: a pointer to the allocated array, or NULL if allocation failed.
--
--     [Thread safety]: It should be safe to call this callback from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_calloc, 'sDL_GetOriginalMemoryFunctions', 'sDL_GetMemoryFunctions', 'sDL_SetMemoryFunctions'
--
--     [C declaration]: @SDL_calloc_func@, defined at @SDL3\/SDL_stdinc.h 1466:25@
newtype SDL_calloc_func = SDL_calloc_func
  { unwrap :: BG.FunPtr SDL_calloc_func_Aux
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
  (ty ~ BG.FunPtr SDL_calloc_func_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_calloc_func ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_calloc_func{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_calloc_func_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_calloc_func) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_calloc_func "unwrap" where
  type
    CFieldType SDL_calloc_func "unwrap" =
      BG.FunPtr SDL_calloc_func_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_realloc_func'
--
--     [C declaration]: @SDL_realloc_func@, defined at @SDL3\/SDL_stdinc.h 1487:25@
newtype SDL_realloc_func_Aux = SDL_realloc_func_Aux
  { unwrap :: BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_realloc_func_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_ae5f282d8127c075_base
    :: (BG.Ptr BG.Void -> BG.Word64 -> IO (BG.Ptr BG.Void))
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Word64 -> IO (BG.Ptr BG.Void)))

-- __unique:__ @toSDL_realloc_func_Aux@
hs_bindgen_ae5f282d8127c075
  :: SDL_realloc_func_Aux
  -> IO (BG.FunPtr SDL_realloc_func_Aux)
hs_bindgen_ae5f282d8127c075 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_ae5f282d8127c075_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_realloc_func_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_60fef27e3e28e137_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Word64 -> IO (BG.Ptr BG.Void))
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @fromSDL_realloc_func_Aux@
hs_bindgen_60fef27e3e28e137
  :: BG.FunPtr SDL_realloc_func_Aux
  -> SDL_realloc_func_Aux
hs_bindgen_60fef27e3e28e137 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_60fef27e3e28e137_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_realloc_func_Aux where
  toFunPtr = hs_bindgen_ae5f282d8127c075

instance BG.FromFunPtr SDL_realloc_func_Aux where
  fromFunPtr = hs_bindgen_60fef27e3e28e137

instance
  (ty ~ (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
  => BG.CompatHasField.HasField "unwrap" SDL_realloc_func_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_realloc_func_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
  => BG.HasField "unwrap" (BG.Ptr SDL_realloc_func_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_realloc_func_Aux "unwrap" where
  type
    CFieldType SDL_realloc_func_Aux "unwrap" =
      BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)

  offset# = \_ -> \_ -> 0

-- | A callback used to implement SDL_realloc().
--
--     SDL will always ensure that the passed @size@ is greater than 0.
--
--     [@mem@]: a pointer to allocated memory to reallocate, or NULL.
--
--     [@size@]: the new size of the memory.
--
--     [Returns]: a pointer to the newly allocated memory, or NULL if allocation failed.
--
--     [Thread safety]: It should be safe to call this callback from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_realloc, 'sDL_GetOriginalMemoryFunctions', 'sDL_GetMemoryFunctions', 'sDL_SetMemoryFunctions'
--
--     [C declaration]: @SDL_realloc_func@, defined at @SDL3\/SDL_stdinc.h 1487:25@
newtype SDL_realloc_func = SDL_realloc_func
  { unwrap :: BG.FunPtr SDL_realloc_func_Aux
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
  (ty ~ BG.FunPtr SDL_realloc_func_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_realloc_func ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_realloc_func{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_realloc_func_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_realloc_func) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_realloc_func "unwrap" where
  type
    CFieldType SDL_realloc_func "unwrap" =
      BG.FunPtr SDL_realloc_func_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_free_func'
--
--     [C declaration]: @SDL_free_func@, defined at @SDL3\/SDL_stdinc.h 1505:24@
newtype SDL_free_func_Aux = SDL_free_func_Aux
  { unwrap :: BG.Ptr BG.Void -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_free_func_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_f13c0d9d2bec2096_base
    :: (BG.Ptr BG.Void -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> IO ()))

-- __unique:__ @toSDL_free_func_Aux@
hs_bindgen_f13c0d9d2bec2096
  :: SDL_free_func_Aux
  -> IO (BG.FunPtr SDL_free_func_Aux)
hs_bindgen_f13c0d9d2bec2096 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_f13c0d9d2bec2096_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_free_func_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_05ceac4716402972_base
    :: BG.FunPtr (BG.Ptr BG.Void -> IO ())
    -> BG.Ptr BG.Void
    -> IO ()

-- __unique:__ @fromSDL_free_func_Aux@
hs_bindgen_05ceac4716402972
  :: BG.FunPtr SDL_free_func_Aux
  -> SDL_free_func_Aux
hs_bindgen_05ceac4716402972 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_05ceac4716402972_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_free_func_Aux where
  toFunPtr = hs_bindgen_f13c0d9d2bec2096

instance BG.FromFunPtr SDL_free_func_Aux where
  fromFunPtr = hs_bindgen_05ceac4716402972

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_free_func_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_free_func_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_free_func_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_free_func_Aux "unwrap" where
  type
    CFieldType SDL_free_func_Aux "unwrap" =
      BG.Ptr BG.Void -> IO ()

  offset# = \_ -> \_ -> 0

-- | A callback used to implement @SDL_free()@.
--
--     SDL will always ensure that the passed @mem@ is a non-NULL pointer.
--
--     [@mem@]: a pointer to allocated memory.
--
--     [Thread safety]: It should be safe to call this callback from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_free', 'sDL_GetOriginalMemoryFunctions', 'sDL_GetMemoryFunctions', 'sDL_SetMemoryFunctions'
--
--     [C declaration]: @SDL_free_func@, defined at @SDL3\/SDL_stdinc.h 1505:24@
newtype SDL_free_func = SDL_free_func
  { unwrap :: BG.FunPtr SDL_free_func_Aux
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
  (ty ~ BG.FunPtr SDL_free_func_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_free_func ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_free_func{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_free_func_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_free_func) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_free_func "unwrap" where
  type
    CFieldType SDL_free_func "unwrap" =
      BG.FunPtr SDL_free_func_Aux

  offset# = \_ -> \_ -> 0

-- | A thread-safe set of environment variables
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetEnvironment', 'sDL_CreateEnvironment', 'sDL_GetEnvironmentVariable', 'sDL_GetEnvironmentVariables', 'sDL_SetEnvironmentVariable', 'sDL_UnsetEnvironmentVariable', 'sDL_DestroyEnvironment'
--
--     [C declaration]: @struct SDL_Environment@, defined at @SDL3\/SDL_stdinc.h 1649:16@
data SDL_Environment

-- | Auxiliary type used by 'SDL_CompareCallback'
--
--     [C declaration]: @SDL_CompareCallback@, defined at @SDL3\/SDL_stdinc.h 1877:23@
newtype SDL_CompareCallback_Aux = SDL_CompareCallback_Aux
  { unwrap :: PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> IO BG.CInt
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_CompareCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_b4335f7e8ef40f79_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Int32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Int32))

-- __unique:__ @toSDL_CompareCallback_Aux@
hs_bindgen_b4335f7e8ef40f79
  :: SDL_CompareCallback_Aux
  -> IO (BG.FunPtr SDL_CompareCallback_Aux)
hs_bindgen_b4335f7e8ef40f79 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_b4335f7e8ef40f79_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_CompareCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_72d385fa3e33955d_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Int32)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @fromSDL_CompareCallback_Aux@
hs_bindgen_72d385fa3e33955d
  :: BG.FunPtr SDL_CompareCallback_Aux
  -> SDL_CompareCallback_Aux
hs_bindgen_72d385fa3e33955d =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_72d385fa3e33955d_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_CompareCallback_Aux where
  toFunPtr = hs_bindgen_b4335f7e8ef40f79

instance BG.FromFunPtr SDL_CompareCallback_Aux where
  fromFunPtr = hs_bindgen_72d385fa3e33955d

instance
  (ty ~ (PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> IO BG.CInt))
  => BG.CompatHasField.HasField "unwrap" SDL_CompareCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CompareCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> IO BG.CInt))
  => BG.HasField "unwrap" (BG.Ptr SDL_CompareCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_CompareCallback_Aux "unwrap" where
  type
    CFieldType SDL_CompareCallback_Aux "unwrap" =
      PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> IO BG.CInt

  offset# = \_ -> \_ -> 0

-- | A callback used with SDL sorting and binary search functions.
--
--     [@a@]: a pointer to the first element being compared.
--
--     [@b@]: a pointer to the second element being compared.
--
--     [Returns]: -1 if @a@ should be sorted before @b@, 1 if @b@ should be sorted before @a@, 0 if they are equal. If two elements are equal, their order in the sorted array is undefined.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_bsearch', 'sDL_qsort'
--
--     [C declaration]: @SDL_CompareCallback@, defined at @SDL3\/SDL_stdinc.h 1877:23@
newtype SDL_CompareCallback = SDL_CompareCallback
  { unwrap :: BG.FunPtr SDL_CompareCallback_Aux
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
  (ty ~ BG.FunPtr SDL_CompareCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_CompareCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CompareCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_CompareCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_CompareCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_CompareCallback "unwrap" where
  type
    CFieldType SDL_CompareCallback "unwrap" =
      BG.FunPtr SDL_CompareCallback_Aux

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_CompareCallback_r'
--
--     [C declaration]: @SDL_CompareCallback_r@, defined at @SDL3\/SDL_stdinc.h 1990:23@
newtype SDL_CompareCallback_r_Aux = SDL_CompareCallback_r_Aux
  { unwrap :: BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> IO BG.CInt
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_CompareCallback_r_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_a12f359999653344_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Int32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Int32))

-- __unique:__ @toSDL_CompareCallback_r_Aux@
hs_bindgen_a12f359999653344
  :: SDL_CompareCallback_r_Aux
  -> IO (BG.FunPtr SDL_CompareCallback_r_Aux)
hs_bindgen_a12f359999653344 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_a12f359999653344_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_CompareCallback_r_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_c41d0998fdad0a16_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Int32)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Int32

-- __unique:__ @fromSDL_CompareCallback_r_Aux@
hs_bindgen_c41d0998fdad0a16
  :: BG.FunPtr SDL_CompareCallback_r_Aux
  -> SDL_CompareCallback_r_Aux
hs_bindgen_c41d0998fdad0a16 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_c41d0998fdad0a16_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_CompareCallback_r_Aux where
  toFunPtr = hs_bindgen_a12f359999653344

instance BG.FromFunPtr SDL_CompareCallback_r_Aux where
  fromFunPtr = hs_bindgen_c41d0998fdad0a16

instance
  (ty ~ (BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> IO BG.CInt))
  => BG.CompatHasField.HasField "unwrap" SDL_CompareCallback_r_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CompareCallback_r_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> IO BG.CInt))
  => BG.HasField "unwrap" (BG.Ptr SDL_CompareCallback_r_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_CompareCallback_r_Aux "unwrap" where
  type
    CFieldType SDL_CompareCallback_r_Aux "unwrap" =
      BG.Ptr BG.Void -> PtrConst.PtrConst BG.Void -> PtrConst.PtrConst BG.Void -> IO BG.CInt

  offset# = \_ -> \_ -> 0

-- | A callback used with SDL sorting and binary search functions.
--
--     [@userdata@]: the @userdata@ pointer passed to the sort function.
--
--     [@a@]: a pointer to the first element being compared.
--
--     [@b@]: a pointer to the second element being compared.
--
--     [Returns]: -1 if @a@ should be sorted before @b@, 1 if @b@ should be sorted before @a@, 0 if they are equal. If two elements are equal, their order in the sorted array is undefined.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_qsort_r', 'sDL_bsearch_r'
--
--     [C declaration]: @SDL_CompareCallback_r@, defined at @SDL3\/SDL_stdinc.h 1990:23@
newtype SDL_CompareCallback_r = SDL_CompareCallback_r
  { unwrap :: BG.FunPtr SDL_CompareCallback_r_Aux
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
  (ty ~ BG.FunPtr SDL_CompareCallback_r_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_CompareCallback_r ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_CompareCallback_r{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_CompareCallback_r_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_CompareCallback_r) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_CompareCallback_r "unwrap" where
  type
    CFieldType SDL_CompareCallback_r "unwrap" =
      BG.FunPtr SDL_CompareCallback_r_Aux

  offset# = \_ -> \_ -> 0

-- | The Unicode REPLACEMENT CHARACTER codepoint.
--
--     @SDL_StepUTF8()@ and @SDL_StepBackUTF8()@ report this codepoint when they encounter a UTF-8 string with encoding errors.
--
--     This tends to render as something like a question mark in most places.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StepBackUTF8', 'sDL_StepUTF8'
--
--     [C declaration]: @macro SDL_INVALID_UNICODE_CODEPOINT@, defined at @SDL3\/SDL_stdinc.h 3977:9@
sDL_INVALID_UNICODE_CODEPOINT :: BG.CInt
sDL_INVALID_UNICODE_CODEPOINT = (65533 :: BG.CInt)

-- | The value of Pi, as a double-precision floating point literal.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PI_F' pi (double)
--
--     [C declaration]: @macro SDL_PI_D@, defined at @SDL3\/SDL_stdinc.h 4472:9@
sDL_PI_D :: BG.CDouble
sDL_PI_D = (3.141592653589793 :: BG.CDouble)

-- | The value of Pi, as a single-precision floating point literal.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_PI_D' pi (float)
--
--     [C declaration]: @macro SDL_PI_F@, defined at @SDL3\/SDL_stdinc.h 4484:9@
sDL_PI_F :: BG.CFloat
sDL_PI_F = (3.1415927 :: BG.CFloat)

-- | [C declaration]: @struct SDL_iconv_data_t@, defined at @SDL3\/SDL_stdinc.h 5807:16@
data SDL_iconv_data_t

-- | An opaque handle representing string encoding conversion state.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_iconv_open'
--
--     [C declaration]: @SDL_iconv_t@, defined at @SDL3\/SDL_stdinc.h 5807:34@
newtype SDL_iconv_t = SDL_iconv_t
  { unwrap :: BG.Ptr SDL_iconv_data_t
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
  (ty ~ BG.Ptr SDL_iconv_data_t)
  => BG.CompatHasField.HasField "unwrap" SDL_iconv_t ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_iconv_t{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.Ptr SDL_iconv_data_t)
  => BG.HasField "unwrap" (BG.Ptr SDL_iconv_t) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_iconv_t "unwrap" where
  type
    CFieldType SDL_iconv_t "unwrap" =
      BG.Ptr SDL_iconv_data_t

  offset# = \_ -> \_ -> 0

-- | Auxiliary type used by 'SDL_FunctionPointer'
--
--     [C declaration]: @SDL_FunctionPointer@, defined at @SDL3\/SDL_stdinc.h 6169:16@
newtype SDL_FunctionPointer_Aux = SDL_FunctionPointer_Aux
  { unwrap :: IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_FunctionPointer_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_8e3379ae5ebc8b29_base
    :: IO ()
    -> IO (BG.FunPtr (IO ()))

-- __unique:__ @toSDL_FunctionPointer_Aux@
hs_bindgen_8e3379ae5ebc8b29
  :: SDL_FunctionPointer_Aux
  -> IO (BG.FunPtr SDL_FunctionPointer_Aux)
hs_bindgen_8e3379ae5ebc8b29 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_8e3379ae5ebc8b29_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_FunctionPointer_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_8a4eac10e33e73be_base
    :: BG.FunPtr (IO ())
    -> IO ()

-- __unique:__ @fromSDL_FunctionPointer_Aux@
hs_bindgen_8a4eac10e33e73be
  :: BG.FunPtr SDL_FunctionPointer_Aux
  -> SDL_FunctionPointer_Aux
hs_bindgen_8a4eac10e33e73be =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_8a4eac10e33e73be_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_FunctionPointer_Aux where
  toFunPtr = hs_bindgen_8e3379ae5ebc8b29

instance BG.FromFunPtr SDL_FunctionPointer_Aux where
  fromFunPtr = hs_bindgen_8a4eac10e33e73be

instance
  (ty ~ IO ())
  => BG.CompatHasField.HasField "unwrap" SDL_FunctionPointer_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FunctionPointer_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ IO ())
  => BG.HasField "unwrap" (BG.Ptr SDL_FunctionPointer_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_FunctionPointer_Aux "unwrap" where
  type
    CFieldType SDL_FunctionPointer_Aux "unwrap" =
      IO ()

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_FunctionPointer@, defined at @SDL3\/SDL_stdinc.h 6169:16@
newtype SDL_FunctionPointer = SDL_FunctionPointer
  { unwrap :: BG.FunPtr SDL_FunctionPointer_Aux
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
  (ty ~ BG.FunPtr SDL_FunctionPointer_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_FunctionPointer ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FunctionPointer{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_FunctionPointer_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_FunctionPointer) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_FunctionPointer "unwrap" where
  type
    CFieldType SDL_FunctionPointer "unwrap" =
      BG.FunPtr SDL_FunctionPointer_Aux

  offset# = \_ -> \_ -> 0
