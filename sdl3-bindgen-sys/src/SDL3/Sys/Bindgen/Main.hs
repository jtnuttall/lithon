{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}

module SDL3.Sys.Bindgen.Main (
  SDL3.Sys.Bindgen.Main.SDL_main_func_Aux (..),
  SDL3.Sys.Bindgen.Main.SDL_main_func (..),
)
where

import Prelude (Eq, IO, Ord, Show, fmap, type (~))

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.IncompleteArray qualified as IA
import HsBindgen.Runtime.IsArray qualified as IsA
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | Auxiliary type used by 'SDL_main_func'
--
--     [C declaration]: @SDL_main_func@, defined at @SDL3\/SDL_main.h 499:23@
newtype SDL_main_func_Aux = SDL_main_func_Aux
  { unwrap :: BG.CInt -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar))) -> IO BG.CInt
  }
  deriving stock (BG.Generic)

-- __unique:__ @toSDL_main_func_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_637d4c26522acb68_base
    :: (BG.CInt -> BG.Ptr BG.Void -> IO BG.CInt)
    -> IO (BG.FunPtr (BG.CInt -> BG.Ptr BG.Void -> IO BG.CInt))

-- __unique:__ @toSDL_main_func_Aux@
hs_bindgen_637d4c26522acb68
  :: SDL_main_func_Aux
  -> IO (BG.FunPtr SDL_main_func_Aux)
hs_bindgen_637d4c26522acb68 =
  \fun0 ->
    fmap
      BG.castFunPtr
      ( hs_bindgen_637d4c26522acb68_base
          ( \x1 ->
              \x2 ->
                fmap BG.toFFIType (BG.getField @"unwrap" fun0 (BG.fromFFIType x1) (BG.fromFFIType x2))
          )
      )

-- __unique:__ @fromSDL_main_func_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_7875a01662c70189_base
    :: BG.FunPtr (BG.CInt -> BG.Ptr BG.Void -> IO BG.CInt)
    -> BG.CInt
    -> BG.Ptr BG.Void
    -> IO BG.CInt

-- __unique:__ @fromSDL_main_func_Aux@
hs_bindgen_7875a01662c70189
  :: BG.FunPtr SDL_main_func_Aux
  -> SDL_main_func_Aux
hs_bindgen_7875a01662c70189 =
  \funPtr0 ->
    SDL_main_func_Aux
      ( \x1 ->
          \x2 ->
            fmap
              BG.fromFFIType
              (hs_bindgen_7875a01662c70189_base (BG.castFunPtr funPtr0) (BG.toFFIType x1) (BG.toFFIType x2))
      )

instance BG.ToFunPtr SDL_main_func_Aux where
  toFunPtr = hs_bindgen_637d4c26522acb68

instance BG.FromFunPtr SDL_main_func_Aux where
  fromFunPtr = hs_bindgen_7875a01662c70189

instance
  (ty ~ (BG.CInt -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar))) -> IO BG.CInt))
  => BG.CompatHasField.HasField "unwrap" SDL_main_func_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_main_func_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.CInt -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar))) -> IO BG.CInt))
  => BG.HasField "unwrap" (BG.Ptr SDL_main_func_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_main_func_Aux "unwrap" where
  type
    CFieldType SDL_main_func_Aux "unwrap" =
      BG.CInt -> BG.Ptr (IsA.Elem (IA.IncompleteArray (BG.Ptr BG.CChar))) -> IO BG.CInt

  offset# = \_ -> \_ -> 0

-- | The prototype for the application\'s main() function
--
--     [@argc@]: an ANSI-C style main function\'s argc.
--
--     [@argv@]: an ANSI-C style main function\'s argv.
--
--     [Returns]: an ANSI-C main return code; generally 0 is considered successful program completion, and small non-zero values are considered errors.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_main_func@, defined at @SDL3\/SDL_main.h 499:23@
newtype SDL_main_func = SDL_main_func
  { unwrap :: BG.FunPtr SDL_main_func_Aux
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
  (ty ~ BG.FunPtr SDL_main_func_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_main_func ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_main_func{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_main_func_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_main_func) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_main_func "unwrap" where
  type
    CFieldType SDL_main_func "unwrap" =
      BG.FunPtr SDL_main_func_Aux

  offset# = \_ -> \_ -> 0
