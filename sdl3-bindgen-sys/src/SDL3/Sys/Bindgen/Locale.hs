{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | SDL locale services.
--
--     This provides a way to get a list of preferred locales (language plus country) for the user. There is exactly one function: @SDL_GetPreferredLocales()@, which handles all the heavy lifting, and offers documentation on all the strange ways humans might have configured their language settings. A struct to provide locale data.
--
--     Locale data is split into a spoken language, like English, and an optional country, like Canada. The language will be in ISO-639 format (so English would be \"en\"), and the country, if not NULL, will be an ISO-3166 country code (so Canada would be \"CA\").
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPreferredLocales'
module SDL3.Sys.Bindgen.Locale (
  SDL3.Sys.Bindgen.Locale.SDL_Locale (..),
)
where

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @struct SDL_Locale@, defined at @SDL3\/SDL_locale.h 60:16@
data SDL_Locale = SDL_Locale
  { language :: PtrConst.PtrConst BG.CChar
  -- ^ A language name, like \"en\" for English.
  --
  --          [C declaration]: @language@, defined at @SDL3\/SDL_locale.h 62:17@
  , country :: PtrConst.PtrConst BG.CChar
  -- ^ A country, like \"US\" for America. Can be NULL.
  --
  --          [C declaration]: @country@, defined at @SDL3\/SDL_locale.h 63:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_Locale where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_Locale where
  readRaw =
    \ptr0 ->
      pure SDL_Locale
        <*> HasCField.readRaw (BG.Proxy @"language") ptr0
        <*> HasCField.readRaw (BG.Proxy @"country") ptr0

instance Marshal.WriteRaw SDL_Locale where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Locale language2 country3 ->
            HasCField.writeRaw (BG.Proxy @"language") ptr0 language2
              >> HasCField.writeRaw (BG.Proxy @"country") ptr0 country3

deriving via Marshal.EquivStorable SDL_Locale instance BG.Storable SDL_Locale

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "language" SDL_Locale ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Locale{language = y1, country = BG.getField @"country" x0}
      , BG.getField @"language" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "language" (BG.Ptr SDL_Locale) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"language")

instance HasCField.HasCField SDL_Locale "language" where
  type
    CFieldType SDL_Locale "language" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 0

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "country" SDL_Locale ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Locale{country = y1, language = BG.getField @"language" x0}
      , BG.getField @"country" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "country" (BG.Ptr SDL_Locale) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"country")

instance HasCField.HasCField SDL_Locale "country" where
  type
    CFieldType SDL_Locale "country" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 8
