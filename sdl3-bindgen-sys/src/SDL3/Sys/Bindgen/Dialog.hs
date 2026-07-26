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

-- | File dialog support.
--
--     SDL offers file dialogs, to let users select files with native GUI interfaces. There are \"open\" dialogs, \"save\" dialogs, and folder selection dialogs. The app can control some details, such as filtering to specific files, or whether multiple files can be selected by the user.
--
--     Note that launching a file dialog is a non-blocking operation; control returns to the app immediately, and a callback is called later (possibly in another thread) when the user makes a choice. An entry for filters for file dialogs.
--
--     @name@ is a user-readable label for the filter (for example, \"Office document\").
--
--     @pattern@ is a semicolon-separated list of file extensions (for example, \"doc;docx\"). File extensions may only contain alphanumeric characters, hyphens, underscores and periods. Alternatively, the whole string can be a single asterisk (\"*\"), which serves as an \"All files\" filter.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DialogFileCallback', 'sDL_ShowOpenFileDialog', 'sDL_ShowSaveFileDialog', 'sDL_ShowOpenFolderDialog', 'sDL_ShowFileDialogWithProperties'
module SDL3.Sys.Bindgen.Dialog (
  SDL3.Sys.Bindgen.Dialog.SDL_DialogFileFilter (..),
  SDL3.Sys.Bindgen.Dialog.SDL_DialogFileCallback_Aux (..),
  SDL3.Sys.Bindgen.Dialog.SDL_DialogFileCallback (..),
  SDL3.Sys.Bindgen.Dialog.SDL_FileDialogType (..),
  pattern SDL3.Sys.Bindgen.Dialog.SDL_FILEDIALOG_OPENFILE,
  pattern SDL3.Sys.Bindgen.Dialog.SDL_FILEDIALOG_SAVEFILE,
  pattern SDL3.Sys.Bindgen.Dialog.SDL_FILEDIALOG_OPENFOLDER,
  SDL3.Sys.Bindgen.Dialog.sDL_PROP_FILE_DIALOG_FILTERS_POINTER,
  SDL3.Sys.Bindgen.Dialog.sDL_PROP_FILE_DIALOG_NFILTERS_NUMBER,
  SDL3.Sys.Bindgen.Dialog.sDL_PROP_FILE_DIALOG_WINDOW_POINTER,
  SDL3.Sys.Bindgen.Dialog.sDL_PROP_FILE_DIALOG_LOCATION_STRING,
  SDL3.Sys.Bindgen.Dialog.sDL_PROP_FILE_DIALOG_MANY_BOOLEAN,
  SDL3.Sys.Bindgen.Dialog.sDL_PROP_FILE_DIALOG_TITLE_STRING,
  SDL3.Sys.Bindgen.Dialog.sDL_PROP_FILE_DIALOG_ACCEPT_STRING,
  SDL3.Sys.Bindgen.Dialog.sDL_PROP_FILE_DIALOG_CANCEL_STRING,
)
where

import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField

-- | [C declaration]: @struct SDL_DialogFileFilter@, defined at @SDL3\/SDL_dialog.h 70:16@
data SDL_DialogFileFilter = SDL_DialogFileFilter
  { name :: PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @name@, defined at @SDL3\/SDL_dialog.h 72:17@
  , pattern' :: PtrConst.PtrConst BG.CChar
  -- ^ [C declaration]: @pattern@, defined at @SDL3\/SDL_dialog.h 73:17@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_DialogFileFilter where
  staticSizeOf = \_ -> (16 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_DialogFileFilter where
  readRaw =
    \ptr0 ->
      pure SDL_DialogFileFilter
        <*> HasCField.readRaw (BG.Proxy @"name") ptr0
        <*> HasCField.readRaw (BG.Proxy @"pattern'") ptr0

instance Marshal.WriteRaw SDL_DialogFileFilter where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_DialogFileFilter name2 pattern'3 ->
            HasCField.writeRaw (BG.Proxy @"name") ptr0 name2
              >> HasCField.writeRaw (BG.Proxy @"pattern'") ptr0 pattern'3

deriving via Marshal.EquivStorable SDL_DialogFileFilter instance BG.Storable SDL_DialogFileFilter

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "name" SDL_DialogFileFilter ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DialogFileFilter{name = y1, pattern' = BG.getField @"pattern'" x0}
      , BG.getField @"name" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "name" (BG.Ptr SDL_DialogFileFilter) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"name")

instance HasCField.HasCField SDL_DialogFileFilter "name" where
  type
    CFieldType SDL_DialogFileFilter "name" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 0

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.CompatHasField.HasField "pattern'" SDL_DialogFileFilter ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DialogFileFilter{pattern' = y1, name = BG.getField @"name" x0}
      , BG.getField @"pattern'" x0
      )

instance
  (ty ~ PtrConst.PtrConst BG.CChar)
  => BG.HasField "pattern'" (BG.Ptr SDL_DialogFileFilter) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"pattern'")

instance HasCField.HasCField SDL_DialogFileFilter "pattern'" where
  type
    CFieldType SDL_DialogFileFilter "pattern'" =
      PtrConst.PtrConst BG.CChar

  offset# = \_ -> \_ -> 8

-- | Auxiliary type used by 'SDL_DialogFileCallback'
--
--     [C declaration]: @SDL_DialogFileCallback@, defined at @SDL3\/SDL_dialog.h 113:24@
newtype SDL_DialogFileCallback_Aux = SDL_DialogFileCallback_Aux
  { unwrap :: BG.Ptr BG.Void -> PtrConst.PtrConst (PtrConst.PtrConst BG.CChar) -> BG.CInt -> IO ()
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_DialogFileCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_99f6498d5c37dad6_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> IO ())
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> IO ()))

-- __unique:__ @toSDL_DialogFileCallback_Aux@
hs_bindgen_99f6498d5c37dad6
  :: SDL_DialogFileCallback_Aux
  -> IO (BG.FunPtr SDL_DialogFileCallback_Aux)
hs_bindgen_99f6498d5c37dad6 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_99f6498d5c37dad6_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_DialogFileCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_10f8f9d1eb0aafd5_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Int32 -> IO ())
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Int32
    -> IO ()

-- __unique:__ @fromSDL_DialogFileCallback_Aux@
hs_bindgen_10f8f9d1eb0aafd5
  :: BG.FunPtr SDL_DialogFileCallback_Aux
  -> SDL_DialogFileCallback_Aux
hs_bindgen_10f8f9d1eb0aafd5 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_10f8f9d1eb0aafd5_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_DialogFileCallback_Aux where
  toFunPtr = hs_bindgen_99f6498d5c37dad6

instance BG.FromFunPtr SDL_DialogFileCallback_Aux where
  fromFunPtr = hs_bindgen_10f8f9d1eb0aafd5

instance
  (ty ~ (BG.Ptr BG.Void -> PtrConst.PtrConst (PtrConst.PtrConst BG.CChar) -> BG.CInt -> IO ()))
  => BG.CompatHasField.HasField "unwrap" SDL_DialogFileCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DialogFileCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ (BG.Ptr BG.Void -> PtrConst.PtrConst (PtrConst.PtrConst BG.CChar) -> BG.CInt -> IO ()))
  => BG.HasField "unwrap" (BG.Ptr SDL_DialogFileCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_DialogFileCallback_Aux "unwrap" where
  type
    CFieldType SDL_DialogFileCallback_Aux "unwrap" =
      BG.Ptr BG.Void -> PtrConst.PtrConst (PtrConst.PtrConst BG.CChar) -> BG.CInt -> IO ()

  offset# = \_ -> \_ -> 0

-- | Callback used by file dialog functions.
--
--     The specific usage is described in each function.
--
--     If @filelist@ is:
--
--     * NULL, an error occurred. Details can be obtained with SDL_GetError().
--
--     * A pointer to NULL, the user either didn\'t choose any file or canceled the dialog.
--
--     * A pointer to non- @NULL@, the user chose one or more files. The argument is a null-terminated array of pointers to UTF-8 encoded strings, each containing a path.
--
--     The filelist argument should not be freed; it will automatically be freed when the callback returns.
--
--     The filter argument is the index of the filter that was selected, or -1 if no filter was selected or if the platform or method doesn\'t support fetching the selected filter.
--
--     In Android, the @filelist@ are @content:\/\/@ URIs. They should be opened using SDL_IOFromFile() with appropriate modes. This applies both to open and save file dialog.
--
--     [@userdata@]: an app-provided pointer, for the callback\'s use.
--
--     [@filelist@]: the file(s) chosen by the user.
--
--     [@filter@]: index of the selected filter.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_DialogFileFilter', 'sDL_ShowOpenFileDialog', 'sDL_ShowSaveFileDialog', 'sDL_ShowOpenFolderDialog', 'sDL_ShowFileDialogWithProperties'
--
--     [C declaration]: @SDL_DialogFileCallback@, defined at @SDL3\/SDL_dialog.h 113:24@
newtype SDL_DialogFileCallback = SDL_DialogFileCallback
  { unwrap :: BG.FunPtr SDL_DialogFileCallback_Aux
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
  (ty ~ BG.FunPtr SDL_DialogFileCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_DialogFileCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_DialogFileCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_DialogFileCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_DialogFileCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_DialogFileCallback "unwrap" where
  type
    CFieldType SDL_DialogFileCallback "unwrap" =
      BG.FunPtr SDL_DialogFileCallback_Aux

  offset# = \_ -> \_ -> 0

-- | Various types of file dialogs.
--
--     This is used by @SDL_ShowFileDialogWithProperties()@ to decide what kind of dialog to present to the user.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ShowFileDialogWithProperties'
--
--     [C declaration]: @enum SDL_FileDialogType@, defined at @SDL3\/SDL_dialog.h 272:14@
newtype SDL_FileDialogType = SDL_FileDialogType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_FileDialogType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_FileDialogType where
  readRaw =
    \ptr0 ->
      pure SDL_FileDialogType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_FileDialogType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_FileDialogType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_FileDialogType instance BG.Storable SDL_FileDialogType

deriving via BG.CUInt instance BG.Prim SDL_FileDialogType

instance CEnum.CEnum SDL_FileDialogType where
  type CEnumZ SDL_FileDialogType = BG.CUInt

  toCEnum = SDL_FileDialogType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_FILEDIALOG_OPENFILE")
        , (1, BG.singleton "SDL_FILEDIALOG_SAVEFILE")
        , (2, BG.singleton "SDL_FILEDIALOG_OPENFOLDER")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_FileDialogType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_FileDialogType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_FileDialogType where
  minDeclaredValue = SDL_FILEDIALOG_OPENFILE

  maxDeclaredValue = SDL_FILEDIALOG_OPENFOLDER

instance Show SDL_FileDialogType where
  showsPrec = CEnum.shows

instance Read SDL_FileDialogType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_FileDialogType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_FileDialogType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_FileDialogType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_FileDialogType "unwrap" where
  type
    CFieldType SDL_FileDialogType "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @SDL_FILEDIALOG_OPENFILE@, defined at @SDL3\/SDL_dialog.h 274:5@
pattern SDL_FILEDIALOG_OPENFILE :: SDL_FileDialogType
pattern SDL_FILEDIALOG_OPENFILE = SDL_FileDialogType 0

-- | [C declaration]: @SDL_FILEDIALOG_SAVEFILE@, defined at @SDL3\/SDL_dialog.h 275:5@
pattern SDL_FILEDIALOG_SAVEFILE :: SDL_FileDialogType
pattern SDL_FILEDIALOG_SAVEFILE = SDL_FileDialogType 1

-- | [C declaration]: @SDL_FILEDIALOG_OPENFOLDER@, defined at @SDL3\/SDL_dialog.h 276:5@
pattern SDL_FILEDIALOG_OPENFOLDER :: SDL_FileDialogType
pattern SDL_FILEDIALOG_OPENFOLDER = SDL_FileDialogType 2

-- | [C declaration]: @macro SDL_PROP_FILE_DIALOG_FILTERS_POINTER@, literal @\"SDL.filedialog.filters\"@, defined at @SDL3\/SDL_dialog.h 328:9@
sDL_PROP_FILE_DIALOG_FILTERS_POINTER :: BG.ByteString
sDL_PROP_FILE_DIALOG_FILTERS_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    , 0x64
    , 0x69
    , 0x61
    , 0x6C
    , 0x6F
    , 0x67
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x74
    , 0x65
    , 0x72
    , 0x73
    ]

-- | [C declaration]: @macro SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER@, literal @\"SDL.filedialog.nfilters\"@, defined at @SDL3\/SDL_dialog.h 329:9@
sDL_PROP_FILE_DIALOG_NFILTERS_NUMBER :: BG.ByteString
sDL_PROP_FILE_DIALOG_NFILTERS_NUMBER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    , 0x64
    , 0x69
    , 0x61
    , 0x6C
    , 0x6F
    , 0x67
    , 0x2E
    , 0x6E
    , 0x66
    , 0x69
    , 0x6C
    , 0x74
    , 0x65
    , 0x72
    , 0x73
    ]

-- | [C declaration]: @macro SDL_PROP_FILE_DIALOG_WINDOW_POINTER@, literal @\"SDL.filedialog.window\"@, defined at @SDL3\/SDL_dialog.h 330:9@
sDL_PROP_FILE_DIALOG_WINDOW_POINTER :: BG.ByteString
sDL_PROP_FILE_DIALOG_WINDOW_POINTER =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    , 0x64
    , 0x69
    , 0x61
    , 0x6C
    , 0x6F
    , 0x67
    , 0x2E
    , 0x77
    , 0x69
    , 0x6E
    , 0x64
    , 0x6F
    , 0x77
    ]

-- | [C declaration]: @macro SDL_PROP_FILE_DIALOG_LOCATION_STRING@, literal @\"SDL.filedialog.location\"@, defined at @SDL3\/SDL_dialog.h 331:9@
sDL_PROP_FILE_DIALOG_LOCATION_STRING :: BG.ByteString
sDL_PROP_FILE_DIALOG_LOCATION_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    , 0x64
    , 0x69
    , 0x61
    , 0x6C
    , 0x6F
    , 0x67
    , 0x2E
    , 0x6C
    , 0x6F
    , 0x63
    , 0x61
    , 0x74
    , 0x69
    , 0x6F
    , 0x6E
    ]

-- | [C declaration]: @macro SDL_PROP_FILE_DIALOG_MANY_BOOLEAN@, literal @\"SDL.filedialog.many\"@, defined at @SDL3\/SDL_dialog.h 332:9@
sDL_PROP_FILE_DIALOG_MANY_BOOLEAN :: BG.ByteString
sDL_PROP_FILE_DIALOG_MANY_BOOLEAN =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    , 0x64
    , 0x69
    , 0x61
    , 0x6C
    , 0x6F
    , 0x67
    , 0x2E
    , 0x6D
    , 0x61
    , 0x6E
    , 0x79
    ]

-- | [C declaration]: @macro SDL_PROP_FILE_DIALOG_TITLE_STRING@, literal @\"SDL.filedialog.title\"@, defined at @SDL3\/SDL_dialog.h 333:9@
sDL_PROP_FILE_DIALOG_TITLE_STRING :: BG.ByteString
sDL_PROP_FILE_DIALOG_TITLE_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    , 0x64
    , 0x69
    , 0x61
    , 0x6C
    , 0x6F
    , 0x67
    , 0x2E
    , 0x74
    , 0x69
    , 0x74
    , 0x6C
    , 0x65
    ]

-- | [C declaration]: @macro SDL_PROP_FILE_DIALOG_ACCEPT_STRING@, literal @\"SDL.filedialog.accept\"@, defined at @SDL3\/SDL_dialog.h 334:9@
sDL_PROP_FILE_DIALOG_ACCEPT_STRING :: BG.ByteString
sDL_PROP_FILE_DIALOG_ACCEPT_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    , 0x64
    , 0x69
    , 0x61
    , 0x6C
    , 0x6F
    , 0x67
    , 0x2E
    , 0x61
    , 0x63
    , 0x63
    , 0x65
    , 0x70
    , 0x74
    ]

-- | [C declaration]: @macro SDL_PROP_FILE_DIALOG_CANCEL_STRING@, literal @\"SDL.filedialog.cancel\"@, defined at @SDL3\/SDL_dialog.h 335:9@
sDL_PROP_FILE_DIALOG_CANCEL_STRING :: BG.ByteString
sDL_PROP_FILE_DIALOG_CANCEL_STRING =
  BG.pack
    [ 0x53
    , 0x44
    , 0x4C
    , 0x2E
    , 0x66
    , 0x69
    , 0x6C
    , 0x65
    , 0x64
    , 0x69
    , 0x61
    , 0x6C
    , 0x6F
    , 0x67
    , 0x2E
    , 0x63
    , 0x61
    , 0x6E
    , 0x63
    , 0x65
    , 0x6C
    ]
