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

-- | SDL offers an API for examining and manipulating the system\'s filesystem. This covers most things one would need to do with directories, except for actual file I\/O (which is covered by [CategoryIOStream](CategoryIOStream) and [CategoryAsyncIO](CategoryAsyncIO) instead).
--
--     There are functions to answer necessary path questions:
--
--     * Where is my app\'s data? @SDL_GetBasePath()@.
--
--     * Where can I safely write files? @SDL_GetPrefPath()@.
--
--     * Where are paths like Downloads, Desktop, Music? @SDL_GetUserFolder()@.
--
--     * What is this thing at this location? @SDL_GetPathInfo()@.
--
--     * What items live in this folder? @SDL_EnumerateDirectory()@.
--
--     * What items live in this folder by wildcard? @SDL_GlobDirectory()@.
--
--     * What is my current working directory? @SDL_GetCurrentDirectory()@.
--
--     SDL also offers functions to manipulate the directory tree: renaming, removing, copying files. Get the directory where the application was run from.
--
--     SDL caches the result of this call internally, but the first call to this function is not necessarily fast, so plan accordingly.
--
--     __macOS and iOS Specific Functionality__: If the application is in a \".app\" bundle, this function returns the Resource directory (e.g. MyApp.app\/Contents\/Resources\/). This behaviour can be overridden by adding a property to the Info.plist file. Adding a string key with the name SDL_FILESYSTEM_BASE_DIR_TYPE with a supported value will change the behaviour.
--
--     Supported values for the SDL_FILESYSTEM_BASE_DIR_TYPE property (Given an application in \/Applications\/SDLApp\/MyApp.app):
--
--     * @resource@: bundle resource directory (the default). For example: @\/Applications\/SDLApp\/MyApp.app\/Contents\/Resources@
--
--     * @bundle@: the Bundle directory. For example: @\/Applications\/SDLApp\/MyApp.app\/@
--
--     * @parent@: the containing directory of the bundle. For example: @\/Applications\/SDLApp\/@
--
--     __Android Specific Functionality__: This function returns \".\/\", which allows filesystem operations to use internal storage and the asset system.
--
--     __Nintendo 3DS Specific Functionality__: This function returns \"romfs\" directory of the application as it is uncommon to store resources outside the executable. As such it is not a writable directory.
--
--     The returned path is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     [Returns]: an absolute path in UTF-8 encoding to the application data directory. NULL will be returned on error or when the platform doesn\'t implement this functionality, call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPrefPath'
module SDL3.Sys.Bindgen.Filesystem (
  SDL3.Sys.Bindgen.Filesystem.SDL_Folder (..),
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_HOME,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_DESKTOP,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_DOCUMENTS,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_DOWNLOADS,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_MUSIC,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_PICTURES,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_PUBLICSHARE,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_SAVEDGAMES,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_SCREENSHOTS,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_TEMPLATES,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_VIDEOS,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_FOLDER_COUNT,
  SDL3.Sys.Bindgen.Filesystem.SDL_PathType (..),
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_PATHTYPE_NONE,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_PATHTYPE_FILE,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_PATHTYPE_DIRECTORY,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_PATHTYPE_OTHER,
  SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo (..),
  SDL3.Sys.Bindgen.Filesystem.SDL_GlobFlags (..),
  SDL3.Sys.Bindgen.Filesystem.sDL_GLOB_CASEINSENSITIVE,
  SDL3.Sys.Bindgen.Filesystem.SDL_EnumerationResult (..),
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_ENUM_CONTINUE,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_ENUM_SUCCESS,
  pattern SDL3.Sys.Bindgen.Filesystem.SDL_ENUM_FAILURE,
  SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback_Aux (..),
  SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback (..),
)
where

import C.Expr.HostPlatform qualified
import HsBindgen.Runtime.CEnum qualified as CEnum
import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Stdinc qualified

-- | The type of the OS-provided default folder for a specific purpose.
--
--     Note that the Trash folder isn\'t included here, because trashing files usually involves extra OS-specific functionality to remember the file\'s original location.
--
--     The folders supported per platform are:
--
--     Windows
--
--     macOS\/iOS
--
--     tvOS
--
--     Unix (XDG)
--
--     Haiku
--
--     Emscripten
--
--     HOME
--
--     X
--
--     X
--
--     X
--
--     X
--
--     X
--
--     DESKTOP
--
--     X
--
--     X
--
--     X
--
--     X
--
--     DOCUMENTS
--
--     X
--
--     X
--
--     X
--
--     DOWNLOADS
--
--     Vista+
--
--     X
--
--     X
--
--     MUSIC
--
--     X
--
--     X
--
--     X
--
--     PICTURES
--
--     X
--
--     X
--
--     X
--
--     PUBLICSHARE
--
--     X
--
--     X
--
--     SAVEDGAMES
--
--     Vista+
--
--     SCREENSHOTS
--
--     Vista+
--
--     TEMPLATES
--
--     X
--
--     X
--
--     X
--
--     VIDEOS
--
--     X
--
--     X*
--
--     X
--
--     Note that on macOS\/iOS, the Videos folder is called \"Movies\".
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetUserFolder'
--
--     [C declaration]: @enum SDL_Folder@, defined at @SDL3\/SDL_filesystem.h 195:14@
newtype SDL_Folder = SDL_Folder
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_Folder where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_Folder where
  readRaw =
    \ptr0 ->
      pure SDL_Folder
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_Folder where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_Folder unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_Folder instance BG.Storable SDL_Folder

deriving via BG.CUInt instance BG.Prim SDL_Folder

instance CEnum.CEnum SDL_Folder where
  type CEnumZ SDL_Folder = BG.CUInt

  toCEnum = SDL_Folder

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_FOLDER_HOME")
        , (1, BG.singleton "SDL_FOLDER_DESKTOP")
        , (2, BG.singleton "SDL_FOLDER_DOCUMENTS")
        , (3, BG.singleton "SDL_FOLDER_DOWNLOADS")
        , (4, BG.singleton "SDL_FOLDER_MUSIC")
        , (5, BG.singleton "SDL_FOLDER_PICTURES")
        , (6, BG.singleton "SDL_FOLDER_PUBLICSHARE")
        , (7, BG.singleton "SDL_FOLDER_SAVEDGAMES")
        , (8, BG.singleton "SDL_FOLDER_SCREENSHOTS")
        , (9, BG.singleton "SDL_FOLDER_TEMPLATES")
        , (10, BG.singleton "SDL_FOLDER_VIDEOS")
        , (11, BG.singleton "SDL_FOLDER_COUNT")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_Folder"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_Folder"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_Folder where
  minDeclaredValue = SDL_FOLDER_HOME

  maxDeclaredValue = SDL_FOLDER_COUNT

instance Show SDL_Folder where
  showsPrec = CEnum.shows

instance Read SDL_Folder where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_Folder ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_Folder{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_Folder) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_Folder "unwrap" where
  type CFieldType SDL_Folder "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | The folder which contains all of the current user\'s data, preferences, and documents. It usually contains most of the other folders. If a requested folder does not exist, the home folder can be considered a safe fallback to store a user\'s documents.
--
--     [C declaration]: @SDL_FOLDER_HOME@, defined at @SDL3\/SDL_filesystem.h 197:5@
pattern SDL_FOLDER_HOME :: SDL_Folder
pattern SDL_FOLDER_HOME = SDL_Folder 0

-- | The folder of files that are displayed on the desktop. Note that the existence of a desktop folder does not guarantee that the system does show icons on its desktop; certain GNU\/Linux distros with a graphical environment may not have desktop icons.
--
--     [C declaration]: @SDL_FOLDER_DESKTOP@, defined at @SDL3\/SDL_filesystem.h 198:5@
pattern SDL_FOLDER_DESKTOP :: SDL_Folder
pattern SDL_FOLDER_DESKTOP = SDL_Folder 1

-- | User document files, possibly application-specific. This is a good place to save a user\'s projects.
--
--     [C declaration]: @SDL_FOLDER_DOCUMENTS@, defined at @SDL3\/SDL_filesystem.h 199:5@
pattern SDL_FOLDER_DOCUMENTS :: SDL_Folder
pattern SDL_FOLDER_DOCUMENTS = SDL_Folder 2

-- | Standard folder for user files downloaded from the internet.
--
--     [C declaration]: @SDL_FOLDER_DOWNLOADS@, defined at @SDL3\/SDL_filesystem.h 200:5@
pattern SDL_FOLDER_DOWNLOADS :: SDL_Folder
pattern SDL_FOLDER_DOWNLOADS = SDL_Folder 3

-- | Music files that can be played using a standard music player (mp3, ogg...).
--
--     [C declaration]: @SDL_FOLDER_MUSIC@, defined at @SDL3\/SDL_filesystem.h 201:5@
pattern SDL_FOLDER_MUSIC :: SDL_Folder
pattern SDL_FOLDER_MUSIC = SDL_Folder 4

-- | Image files that can be displayed using a standard viewer (png, jpg...).
--
--     [C declaration]: @SDL_FOLDER_PICTURES@, defined at @SDL3\/SDL_filesystem.h 202:5@
pattern SDL_FOLDER_PICTURES :: SDL_Folder
pattern SDL_FOLDER_PICTURES = SDL_Folder 5

-- | Files that are meant to be shared with other users on the same computer.
--
--     [C declaration]: @SDL_FOLDER_PUBLICSHARE@, defined at @SDL3\/SDL_filesystem.h 203:5@
pattern SDL_FOLDER_PUBLICSHARE :: SDL_Folder
pattern SDL_FOLDER_PUBLICSHARE = SDL_Folder 6

-- | Save files for games.
--
--     [C declaration]: @SDL_FOLDER_SAVEDGAMES@, defined at @SDL3\/SDL_filesystem.h 204:5@
pattern SDL_FOLDER_SAVEDGAMES :: SDL_Folder
pattern SDL_FOLDER_SAVEDGAMES = SDL_Folder 7

-- | Application screenshots.
--
--     [C declaration]: @SDL_FOLDER_SCREENSHOTS@, defined at @SDL3\/SDL_filesystem.h 205:5@
pattern SDL_FOLDER_SCREENSHOTS :: SDL_Folder
pattern SDL_FOLDER_SCREENSHOTS = SDL_Folder 8

-- | Template files to be used when the user requests the desktop environment to create a new file in a certain folder, such as \"New Text File.txt\". Any file in the Templates folder can be used as a starting point for a new file.
--
--     [C declaration]: @SDL_FOLDER_TEMPLATES@, defined at @SDL3\/SDL_filesystem.h 206:5@
pattern SDL_FOLDER_TEMPLATES :: SDL_Folder
pattern SDL_FOLDER_TEMPLATES = SDL_Folder 9

-- | Video files that can be played using a standard video player (mp4, webm...).
--
--     [C declaration]: @SDL_FOLDER_VIDEOS@, defined at @SDL3\/SDL_filesystem.h 207:5@
pattern SDL_FOLDER_VIDEOS :: SDL_Folder
pattern SDL_FOLDER_VIDEOS = SDL_Folder 10

-- | Total number of types in this enum, not a folder type by itself.
--
--     [C declaration]: @SDL_FOLDER_COUNT@, defined at @SDL3\/SDL_filesystem.h 208:5@
pattern SDL_FOLDER_COUNT :: SDL_Folder
pattern SDL_FOLDER_COUNT = SDL_Folder 11

-- | Types of filesystem entries.
--
--     Note that there may be other sorts of items on a filesystem: devices, named pipes, etc. They are currently reported as SDL_PATHTYPE_OTHER.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_PathInfo'
--
--     [C declaration]: @enum SDL_PathType@, defined at @SDL3\/SDL_filesystem.h 251:14@
newtype SDL_PathType = SDL_PathType
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_PathType where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_PathType where
  readRaw =
    \ptr0 ->
      pure SDL_PathType
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_PathType where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PathType unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_PathType instance BG.Storable SDL_PathType

deriving via BG.CUInt instance BG.Prim SDL_PathType

instance CEnum.CEnum SDL_PathType where
  type CEnumZ SDL_PathType = BG.CUInt

  toCEnum = SDL_PathType

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_PATHTYPE_NONE")
        , (1, BG.singleton "SDL_PATHTYPE_FILE")
        , (2, BG.singleton "SDL_PATHTYPE_DIRECTORY")
        , (3, BG.singleton "SDL_PATHTYPE_OTHER")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_PathType"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_PathType"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_PathType where
  minDeclaredValue = SDL_PATHTYPE_NONE

  maxDeclaredValue = SDL_PATHTYPE_OTHER

instance Show SDL_PathType where
  showsPrec = CEnum.shows

instance Read SDL_PathType where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_PathType ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PathType{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_PathType) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_PathType "unwrap" where
  type CFieldType SDL_PathType "unwrap" = BG.CUInt

  offset# = \_ -> \_ -> 0

-- | path does not exist
--
--     [C declaration]: @SDL_PATHTYPE_NONE@, defined at @SDL3\/SDL_filesystem.h 253:5@
pattern SDL_PATHTYPE_NONE :: SDL_PathType
pattern SDL_PATHTYPE_NONE = SDL_PathType 0

-- | a normal file
--
--     [C declaration]: @SDL_PATHTYPE_FILE@, defined at @SDL3\/SDL_filesystem.h 254:5@
pattern SDL_PATHTYPE_FILE :: SDL_PathType
pattern SDL_PATHTYPE_FILE = SDL_PathType 1

-- | a directory
--
--     [C declaration]: @SDL_PATHTYPE_DIRECTORY@, defined at @SDL3\/SDL_filesystem.h 255:5@
pattern SDL_PATHTYPE_DIRECTORY :: SDL_PathType
pattern SDL_PATHTYPE_DIRECTORY = SDL_PathType 2

-- | something completely different like a device node (not a symlink, those are always followed)
--
--     [C declaration]: @SDL_PATHTYPE_OTHER@, defined at @SDL3\/SDL_filesystem.h 256:5@
pattern SDL_PATHTYPE_OTHER :: SDL_PathType
pattern SDL_PATHTYPE_OTHER = SDL_PathType 3

-- | Information about a path on the filesystem.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetPathInfo', SDL_GetStoragePathInfo
--
--     [C declaration]: @struct SDL_PathInfo@, defined at @SDL3\/SDL_filesystem.h 267:16@
data SDL_PathInfo = SDL_PathInfo
  { type' :: SDL_PathType
  -- ^ the path type
  --
  --          [C declaration]: @type@, defined at @SDL3\/SDL_filesystem.h 269:18@
  , size :: SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^ the file size in bytes
  --
  --          [C declaration]: @size@, defined at @SDL3\/SDL_filesystem.h 270:12@
  , create_time :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^ the time when the path was created
  --
  --          [C declaration]: @create_time@, defined at @SDL3\/SDL_filesystem.h 271:14@
  , modify_time :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^ the last time the path was modified
  --
  --          [C declaration]: @modify_time@, defined at @SDL3\/SDL_filesystem.h 272:14@
  , access_time :: SDL3.Sys.Bindgen.Stdinc.SDL_Time
  -- ^ the last time the path was read
  --
  --          [C declaration]: @access_time@, defined at @SDL3\/SDL_filesystem.h 273:14@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_PathInfo where
  staticSizeOf = \_ -> (40 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_PathInfo where
  readRaw =
    \ptr0 ->
      pure SDL_PathInfo
        <*> HasCField.readRaw (BG.Proxy @"type'") ptr0
        <*> HasCField.readRaw (BG.Proxy @"size") ptr0
        <*> HasCField.readRaw (BG.Proxy @"create_time") ptr0
        <*> HasCField.readRaw (BG.Proxy @"modify_time") ptr0
        <*> HasCField.readRaw (BG.Proxy @"access_time") ptr0

instance Marshal.WriteRaw SDL_PathInfo where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_PathInfo type'2 size3 create_time4 modify_time5 access_time6 ->
            HasCField.writeRaw (BG.Proxy @"type'") ptr0 type'2
              >> HasCField.writeRaw (BG.Proxy @"size") ptr0 size3
              >> HasCField.writeRaw (BG.Proxy @"create_time") ptr0 create_time4
              >> HasCField.writeRaw (BG.Proxy @"modify_time") ptr0 modify_time5
              >> HasCField.writeRaw (BG.Proxy @"access_time") ptr0 access_time6

deriving via Marshal.EquivStorable SDL_PathInfo instance BG.Storable SDL_PathInfo

instance
  (ty ~ SDL_PathType)
  => BG.CompatHasField.HasField "type'" SDL_PathInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PathInfo
            { type' = y1
            , size = BG.getField @"size" x0
            , create_time = BG.getField @"create_time" x0
            , modify_time = BG.getField @"modify_time" x0
            , access_time = BG.getField @"access_time" x0
            }
      , BG.getField @"type'" x0
      )

instance
  (ty ~ SDL_PathType)
  => BG.HasField "type'" (BG.Ptr SDL_PathInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"type'")

instance HasCField.HasCField SDL_PathInfo "type'" where
  type CFieldType SDL_PathInfo "type'" = SDL_PathType

  offset# = \_ -> \_ -> 0

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.CompatHasField.HasField "size" SDL_PathInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PathInfo
            { size = y1
            , type' = BG.getField @"type'" x0
            , create_time = BG.getField @"create_time" x0
            , modify_time = BG.getField @"modify_time" x0
            , access_time = BG.getField @"access_time" x0
            }
      , BG.getField @"size" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint64)
  => BG.HasField "size" (BG.Ptr SDL_PathInfo) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"size")

instance HasCField.HasCField SDL_PathInfo "size" where
  type
    CFieldType SDL_PathInfo "size" =
      SDL3.Sys.Bindgen.Stdinc.Uint64

  offset# = \_ -> \_ -> 8

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.SDL_Time)
  => BG.CompatHasField.HasField "create_time" SDL_PathInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PathInfo
            { create_time = y1
            , type' = BG.getField @"type'" x0
            , size = BG.getField @"size" x0
            , modify_time = BG.getField @"modify_time" x0
            , access_time = BG.getField @"access_time" x0
            }
      , BG.getField @"create_time" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.SDL_Time)
  => BG.HasField "create_time" (BG.Ptr SDL_PathInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"create_time")

instance HasCField.HasCField SDL_PathInfo "create_time" where
  type
    CFieldType SDL_PathInfo "create_time" =
      SDL3.Sys.Bindgen.Stdinc.SDL_Time

  offset# = \_ -> \_ -> 16

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.SDL_Time)
  => BG.CompatHasField.HasField "modify_time" SDL_PathInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PathInfo
            { modify_time = y1
            , type' = BG.getField @"type'" x0
            , size = BG.getField @"size" x0
            , create_time = BG.getField @"create_time" x0
            , access_time = BG.getField @"access_time" x0
            }
      , BG.getField @"modify_time" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.SDL_Time)
  => BG.HasField "modify_time" (BG.Ptr SDL_PathInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"modify_time")

instance HasCField.HasCField SDL_PathInfo "modify_time" where
  type
    CFieldType SDL_PathInfo "modify_time" =
      SDL3.Sys.Bindgen.Stdinc.SDL_Time

  offset# = \_ -> \_ -> 24

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.SDL_Time)
  => BG.CompatHasField.HasField "access_time" SDL_PathInfo ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_PathInfo
            { access_time = y1
            , type' = BG.getField @"type'" x0
            , size = BG.getField @"size" x0
            , create_time = BG.getField @"create_time" x0
            , modify_time = BG.getField @"modify_time" x0
            }
      , BG.getField @"access_time" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.SDL_Time)
  => BG.HasField "access_time" (BG.Ptr SDL_PathInfo) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"access_time")

instance HasCField.HasCField SDL_PathInfo "access_time" where
  type
    CFieldType SDL_PathInfo "access_time" =
      SDL3.Sys.Bindgen.Stdinc.SDL_Time

  offset# = \_ -> \_ -> 32

-- | Flags for path matching.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GlobDirectory', SDL_GlobStorageDirectory
--
--     [C declaration]: @SDL_GlobFlags@, defined at @SDL3\/SDL_filesystem.h 284:16@
newtype SDL_GlobFlags = SDL_GlobFlags
  { unwrap :: SDL3.Sys.Bindgen.Stdinc.Uint32
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
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "unwrap" SDL_GlobFlags ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_GlobFlags{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "unwrap" (BG.Ptr SDL_GlobFlags) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_GlobFlags "unwrap" where
  type
    CFieldType SDL_GlobFlags "unwrap" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

-- | [C declaration]: @macro SDL_GLOB_CASEINSENSITIVE@, defined at @SDL3\/SDL_filesystem.h 286:9@
sDL_GLOB_CASEINSENSITIVE :: BG.CUInt
sDL_GLOB_CASEINSENSITIVE =
  (C.Expr.HostPlatform.<<) (1 :: BG.CUInt) (0 :: BG.CInt)

-- | Possible results from an enumeration callback.
--
--     @since 3.2.0
--
--     [See also]: 'SDL_EnumerateDirectoryCallback'
--
--     [C declaration]: @enum SDL_EnumerationResult@, defined at @SDL3\/SDL_filesystem.h 313:14@
newtype SDL_EnumerationResult = SDL_EnumerationResult
  { unwrap :: BG.CUInt
  }
  deriving stock (BG.Generic, Eq, Ord)
  deriving newtype (BG.HasFFIType)

instance Marshal.StaticSize SDL_EnumerationResult where
  staticSizeOf = \_ -> (4 :: Int)

  staticAlignment = \_ -> (4 :: Int)

instance Marshal.ReadRaw SDL_EnumerationResult where
  readRaw =
    \ptr0 ->
      pure SDL_EnumerationResult
        <*> Marshal.readRawByteOff ptr0 (0 :: Int)

instance Marshal.WriteRaw SDL_EnumerationResult where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_EnumerationResult unwrap2 ->
            Marshal.writeRawByteOff ptr0 (0 :: Int) unwrap2

deriving via Marshal.EquivStorable SDL_EnumerationResult instance BG.Storable SDL_EnumerationResult

deriving via BG.CUInt instance BG.Prim SDL_EnumerationResult

instance CEnum.CEnum SDL_EnumerationResult where
  type CEnumZ SDL_EnumerationResult = BG.CUInt

  toCEnum = SDL_EnumerationResult

  fromCEnum = BG.getField @"unwrap"

  declaredValues =
    \_ ->
      CEnum.declaredValuesFromList
        [ (0, BG.singleton "SDL_ENUM_CONTINUE")
        , (1, BG.singleton "SDL_ENUM_SUCCESS")
        , (2, BG.singleton "SDL_ENUM_FAILURE")
        ]

  showsUndeclared =
    CEnum.showsWrappedUndeclared "SDL_EnumerationResult"

  readPrecUndeclared =
    CEnum.readPrecWrappedUndeclared "SDL_EnumerationResult"

  isDeclared = CEnum.seqIsDeclared

  mkDeclared = CEnum.seqMkDeclared

instance CEnum.SequentialCEnum SDL_EnumerationResult where
  minDeclaredValue = SDL_ENUM_CONTINUE

  maxDeclaredValue = SDL_ENUM_FAILURE

instance Show SDL_EnumerationResult where
  showsPrec = CEnum.shows

instance Read SDL_EnumerationResult where
  readPrec = CEnum.readPrec

  readList = BG.readListDefault

  readListPrec = BG.readListPrecDefault

instance
  (ty ~ BG.CUInt)
  => BG.CompatHasField.HasField "unwrap" SDL_EnumerationResult ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EnumerationResult{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.CUInt)
  => BG.HasField "unwrap" (BG.Ptr SDL_EnumerationResult) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EnumerationResult "unwrap" where
  type
    CFieldType SDL_EnumerationResult "unwrap" =
      BG.CUInt

  offset# = \_ -> \_ -> 0

-- | Value that requests that enumeration continue.
--
--     [C declaration]: @SDL_ENUM_CONTINUE@, defined at @SDL3\/SDL_filesystem.h 315:5@
pattern SDL_ENUM_CONTINUE :: SDL_EnumerationResult
pattern SDL_ENUM_CONTINUE = SDL_EnumerationResult 0

-- | Value that requests that enumeration stop, successfully.
--
--     [C declaration]: @SDL_ENUM_SUCCESS@, defined at @SDL3\/SDL_filesystem.h 316:5@
pattern SDL_ENUM_SUCCESS :: SDL_EnumerationResult
pattern SDL_ENUM_SUCCESS = SDL_EnumerationResult 1

-- | Value that requests that enumeration stop, as a failure.
--
--     [C declaration]: @SDL_ENUM_FAILURE@, defined at @SDL3\/SDL_filesystem.h 317:5@
pattern SDL_ENUM_FAILURE :: SDL_EnumerationResult
pattern SDL_ENUM_FAILURE = SDL_EnumerationResult 2

-- | Auxiliary type used by 'SDL_EnumerateDirectoryCallback'
--
--     [C declaration]: @SDL_EnumerateDirectoryCallback@, defined at @SDL3\/SDL_filesystem.h 344:41@
newtype SDL_EnumerateDirectoryCallback_Aux = SDL_EnumerateDirectoryCallback_Aux
  { unwrap
      :: BG.Ptr BG.Void
      -> PtrConst.PtrConst BG.CChar
      -> PtrConst.PtrConst BG.CChar
      -> IO SDL_EnumerationResult
  }
  deriving stock (BG.Generic)
  deriving newtype (BG.HasFFIType)

-- __unique:__ @toSDL_EnumerateDirectoryCallback_Aux@
foreign import ccall safe "wrapper"
  hs_bindgen_a7027a1d7d8836f6_base
    :: (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32)
    -> IO (BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32))

-- __unique:__ @toSDL_EnumerateDirectoryCallback_Aux@
hs_bindgen_a7027a1d7d8836f6
  :: SDL_EnumerateDirectoryCallback_Aux
  -> IO (BG.FunPtr SDL_EnumerateDirectoryCallback_Aux)
hs_bindgen_a7027a1d7d8836f6 =
  \fun0 ->
    fmap BG.castFunPtrFromFFIType (hs_bindgen_a7027a1d7d8836f6_base (BG.toFFIType fun0))

-- __unique:__ @fromSDL_EnumerateDirectoryCallback_Aux@
foreign import ccall safe "dynamic"
  hs_bindgen_62890ffdaab536a5_base
    :: BG.FunPtr (BG.Ptr BG.Void -> BG.Ptr BG.Void -> BG.Ptr BG.Void -> IO BG.Word32)
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @fromSDL_EnumerateDirectoryCallback_Aux@
hs_bindgen_62890ffdaab536a5
  :: BG.FunPtr SDL_EnumerateDirectoryCallback_Aux
  -> SDL_EnumerateDirectoryCallback_Aux
hs_bindgen_62890ffdaab536a5 =
  \funPtr0 ->
    BG.fromFFIType (hs_bindgen_62890ffdaab536a5_base (BG.castFunPtrToFFIType funPtr0))

instance BG.ToFunPtr SDL_EnumerateDirectoryCallback_Aux where
  toFunPtr = hs_bindgen_a7027a1d7d8836f6

instance BG.FromFunPtr SDL_EnumerateDirectoryCallback_Aux where
  fromFunPtr = hs_bindgen_62890ffdaab536a5

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> PtrConst.PtrConst BG.CChar
          -> IO SDL_EnumerationResult
        )
  )
  => BG.CompatHasField.HasField "unwrap" SDL_EnumerateDirectoryCallback_Aux ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_EnumerateDirectoryCallback_Aux{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  ( ty
      ~ ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> PtrConst.PtrConst BG.CChar
          -> IO SDL_EnumerationResult
        )
  )
  => BG.HasField "unwrap" (BG.Ptr SDL_EnumerateDirectoryCallback_Aux) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EnumerateDirectoryCallback_Aux "unwrap" where
  type
    CFieldType SDL_EnumerateDirectoryCallback_Aux "unwrap" =
      BG.Ptr BG.Void
      -> PtrConst.PtrConst BG.CChar
      -> PtrConst.PtrConst BG.CChar
      -> IO SDL_EnumerationResult

  offset# = \_ -> \_ -> 0

-- | Callback for directory enumeration.
--
--     Enumeration of directory entries will continue until either all entries have been provided to the callback, or the callback has requested a stop through its return value.
--
--     Returning SDL_ENUM_CONTINUE will let enumeration proceed, calling the callback with further entries. SDL_ENUM_SUCCESS and SDL_ENUM_FAILURE will terminate the enumeration early, and dictate the return value of the enumeration function itself.
--
--     @dirname@ is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     [@userdata@]: an app-controlled pointer that is passed to the callback.
--
--     [@dirname@]: the directory that is being enumerated.
--
--     [@fname@]: the next entry in the enumeration.
--
--     [Returns]: how the enumeration should proceed.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_EnumerateDirectory'
--
--     [C declaration]: @SDL_EnumerateDirectoryCallback@, defined at @SDL3\/SDL_filesystem.h 344:41@
newtype SDL_EnumerateDirectoryCallback = SDL_EnumerateDirectoryCallback
  { unwrap :: BG.FunPtr SDL_EnumerateDirectoryCallback_Aux
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
  (ty ~ BG.FunPtr SDL_EnumerateDirectoryCallback_Aux)
  => BG.CompatHasField.HasField "unwrap" SDL_EnumerateDirectoryCallback ty
  where
  hasField =
    \x0 ->
      ( \y1 -> SDL_EnumerateDirectoryCallback{unwrap = y1}
      , BG.getField @"unwrap" x0
      )

instance
  (ty ~ BG.FunPtr SDL_EnumerateDirectoryCallback_Aux)
  => BG.HasField "unwrap" (BG.Ptr SDL_EnumerateDirectoryCallback) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"unwrap")

instance HasCField.HasCField SDL_EnumerateDirectoryCallback "unwrap" where
  type
    CFieldType SDL_EnumerateDirectoryCallback "unwrap" =
      BG.FunPtr SDL_EnumerateDirectoryCallback_Aux

  offset# = \_ -> \_ -> 0
