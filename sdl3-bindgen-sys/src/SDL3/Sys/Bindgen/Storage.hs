{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE EmptyDataDecls #-}
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

-- | The storage API is a high-level API designed to abstract away the portability issues that come up when using something lower-level (in SDL\'s case, this sits on top of the [Filesystem](CategoryFilesystem) and [IOStream](CategoryIOStream) subsystems). It is significantly more restrictive than a typical filesystem API, for a number of reasons:
--
--     1. __What to Access:__ A common pitfall with existing filesystem APIs is the assumption that all storage is monolithic. However, many other platforms (game consoles in particular) are more strict about what /type/ of filesystem is being accessed; for example, game content and user data are usually two separate storage devices with entirely different characteristics (and possibly different low-level APIs altogether!).
--
--     2. __How to Access:__ Another common mistake is applications assuming that all storage is universally writeable - again, many platforms treat game content and user data as two separate storage devices, and only user data is writeable while game content is read-only.
--
--     3. __When to Access:__ The most common portability issue with filesystem access is /timing/ - you cannot always assume that the storage device is always accessible all of the time, nor can you assume that there are no limits to how long you have access to a particular device.
--
--     Consider the following example:
--
--     @
--     void ReadGameData(void)
--     {
--         extern char** fileNames;
--         extern size_t numFiles;
--         for (size_t i = 0; i \< numFiles; i += 1) {
--             FILE *data = fopen(fileNames[i], \"rwb\");
--             if (data == NULL) {
--                 \/\/ Something bad happened!
--             } else {
--                 \/\/ A bunch of stuff happens here
--                 fclose(data);
--             }
--         }
--     }
--
--     void ReadSave(void)
--     {
--         FILE *save = fopen(\"saves\/save0.sav\", \"rb\");
--         if (save == NULL) {
--             \/\/ Something bad happened!
--         } else {
--             \/\/ A bunch of stuff happens here
--             fclose(save);
--         }
--     }
--
--     void WriteSave(void)
--     {
--         FILE *save = fopen(\"saves\/save0.sav\", \"wb\");
--         if (save == NULL) {
--             \/\/ Something bad happened!
--         } else {
--             \/\/ A bunch of stuff happens here
--             fclose(save);
--         }
--     }
--     @
--
--     Going over the bullet points again:
--
--     1. __What to Access:__ This code accesses a global filesystem; game data and saves are all presumed to be in the current working directory (which may or may not be the game\'s installation folder!).
--
--     2. __How to Access:__ This code assumes that content paths are writeable, and that save data is also writeable despite being in the same location as the game data.
--
--     3. __When to Access:__ This code assumes that they can be called at any time, since the filesystem is always accessible and has no limits on how long the filesystem is being accessed.
--
--     Due to these assumptions, the filesystem code is not portable and will fail under these common scenarios:
--
--     * The game is installed on a device that is read-only, both content loading and game saves will fail or crash outright
--
--     * Game\/User storage is not implicitly mounted, so no files will be found for either scenario when a platform requires explicitly mounting filesystems
--
--     * Save data may not be safe since the I\/O is not being flushed or validated, so an error occurring elsewhere in the program may result in missing\/corrupted save data
--
--     When using 'SDL_Storage', these types of problems are virtually impossible to trip over:
--
--     @
--     void ReadGameData(void)
--     {
--         extern char** fileNames;
--         extern size_t numFiles;
--
--         SDL_Storage *title = SDL_OpenTitleStorage(NULL, 0);
--         if (title == NULL) {
--             \/\/ Something bad happened!
--         }
--         while (!SDL_StorageReady(title)) {
--             SDL_Delay(1);
--         }
--
--         for (size_t i = 0; i \< numFiles; i += 1) {
--             void* dst;
--             Uint64 dstLen = 0;
--
--             if (SDL_GetStorageFileSize(title, fileNames[i], &dstLen) && dstLen > 0) {
--                 dst = SDL_malloc(dstLen);
--                 if (SDL_ReadStorageFile(title, fileNames[i], dst, dstLen)) {
--                     \/\/ A bunch of stuff happens here
--                 } else {
--                     \/\/ Something bad happened!
--                 }
--                 SDL_free(dst);
--             } else {
--                 \/\/ Something bad happened!
--             }
--         }
--
--         SDL_CloseStorage(title);
--     }
--
--     void ReadSave(void)
--     {
--         SDL_Storage *user = SDL_OpenUserStorage(\"libsdl\", \"Storage Example\", 0);
--         if (user == NULL) {
--             \/\/ Something bad happened!
--         }
--         while (!SDL_StorageReady(user)) {
--             SDL_Delay(1);
--         }
--
--         Uint64 saveLen = 0;
--         if (SDL_GetStorageFileSize(user, \"save0.sav\", &saveLen) && saveLen > 0) {
--             void* dst = SDL_malloc(saveLen);
--             if (SDL_ReadStorageFile(user, \"save0.sav\", dst, saveLen)) {
--                 \/\/ A bunch of stuff happens here
--             } else {
--                 \/\/ Something bad happened!
--             }
--             SDL_free(dst);
--         } else {
--             \/\/ Something bad happened!
--         }
--
--         SDL_CloseStorage(user);
--     }
--
--     void WriteSave(void)
--     {
--         SDL_Storage *user = SDL_OpenUserStorage(\"libsdl\", \"Storage Example\", 0);
--         if (user == NULL) {
--             \/\/ Something bad happened!
--         }
--         while (!SDL_StorageReady(user)) {
--             SDL_Delay(1);
--         }
--
--         extern void *saveData; \/\/ A bunch of stuff happened here...
--         extern Uint64 saveLen;
--         if (!SDL_WriteStorageFile(user, \"save0.sav\", saveData, saveLen)) {
--             \/\/ Something bad happened!
--         }
--
--         SDL_CloseStorage(user);
--     }
--     @
--
--     Note the improvements that 'SDL_Storage' makes:
--
--     1. __What to Access:__ This code explicitly reads from a title or user storage device based on the context of the function.
--
--     2. __How to Access:__ This code explicitly uses either a read or write function based on the context of the function.
--
--     3. __When to Access:__ This code explicitly opens the device when it needs to, and closes it when it is finished working with the filesystem.
--
--     The result is an application that is significantly more robust against the increasing demands of platforms and their filesystems!
--
--     A publicly available example of an 'SDL_Storage' backend is the [Steam Cloud](https://partner.steamgames.com/doc/features/cloud) backend - you can initialize Steamworks when starting the program, and then SDL will recognize that Steamworks is initialized and automatically use ISteamRemoteStorage when the application opens user storage. More importantly, when you /open/ storage it knows to begin a \"batch\" of filesystem operations, and when you /close/ storage it knows to end and flush the batch. This is used by Steam to support [Dynamic Cloud Sync](https://steamcommunity.com/groups/steamworks/announcements/detail/3142949576401813670); users can save data on one PC, put the device to sleep, and then continue playing on another PC (and vice versa) with the save data fully synchronized across all devices, allowing for a seamless experience without having to do full restarts of the program.
--
--     Notes on valid paths
--
--     All paths in the Storage API use Unix-style path separators (\'\/\'). Using a different path separator will not work, even if the underlying platform would otherwise accept it. This is to keep code using the Storage API portable between platforms and Storage implementations and simplify app code.
--
--     Paths with relative directories (\".\" and \"..\") are forbidden by the Storage API.
--
--     All valid UTF-8 strings (discounting the NULL terminator character and the \'\/\' path separator) are usable for filenames, however, an underlying Storage implementation may not support particularly strange sequences and refuse to create files with those names, etc. Function interface for 'SDL_Storage'.
--
--     Apps that want to supply a custom implementation of 'SDL_Storage' will fill in all the functions in this struct, and then pass it to SDL_OpenStorage to create a custom 'SDL_Storage' object.
--
--     It is not usually necessary to do this; SDL provides standard implementations for many things you might expect to do with an 'SDL_Storage'.
--
--     This structure should be initialized using SDL_INIT_INTERFACE()
--
--     @since 3.2.0
--
--     [See also]: SDL_INIT_INTERFACE
module SDL3.Sys.Bindgen.Storage (
  SDL3.Sys.Bindgen.Storage.SDL_StorageInterface (..),
  SDL3.Sys.Bindgen.Storage.SDL_Storage,
)
where

import HsBindgen.Runtime.HasCField qualified as HasCField
import HsBindgen.Runtime.Marshal qualified as Marshal
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CompatHasField qualified as BG.CompatHasField
import SDL3.Sys.Bindgen.Filesystem qualified
import SDL3.Sys.Bindgen.Stdinc qualified

-- | [C declaration]: @struct SDL_StorageInterface@, defined at @SDL3\/SDL_storage.h 274:16@
data SDL_StorageInterface = SDL_StorageInterface
  { version :: SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^ [C declaration]: @version@, defined at @SDL3\/SDL_storage.h 277:12@
  , close :: BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool)
  -- ^ [C declaration]: @close@, defined at @SDL3\/SDL_storage.h 280:20@
  , ready :: BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool)
  -- ^ [C declaration]: @ready@, defined at @SDL3\/SDL_storage.h 283:20@
  , enumerate
      :: BG.FunPtr
           ( BG.Ptr BG.Void
             -> PtrConst.PtrConst BG.CChar
             -> SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback
             -> BG.Ptr BG.Void
             -> IO BG.CBool
           )
  -- ^ [C declaration]: @enumerate@, defined at @SDL3\/SDL_storage.h 286:20@
  , info
      :: BG.FunPtr
           ( BG.Ptr BG.Void
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo
             -> IO BG.CBool
           )
  -- ^ [C declaration]: @info@, defined at @SDL3\/SDL_storage.h 289:20@
  , read_file
      :: BG.FunPtr
           ( BG.Ptr BG.Void
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint64
             -> IO BG.CBool
           )
  -- ^ [C declaration]: @read_file@, defined at @SDL3\/SDL_storage.h 292:20@
  , write_file
      :: BG.FunPtr
           ( BG.Ptr BG.Void
             -> PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint64
             -> IO BG.CBool
           )
  -- ^ [C declaration]: @write_file@, defined at @SDL3\/SDL_storage.h 295:20@
  , mkdir :: BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
  -- ^ [C declaration]: @mkdir@, defined at @SDL3\/SDL_storage.h 298:20@
  , remove :: BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
  -- ^ [C declaration]: @remove@, defined at @SDL3\/SDL_storage.h 301:20@
  , rename
      :: BG.FunPtr
           (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
  -- ^ [C declaration]: @rename@, defined at @SDL3\/SDL_storage.h 304:20@
  , copy
      :: BG.FunPtr
           (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
  -- ^ [C declaration]: @copy@, defined at @SDL3\/SDL_storage.h 307:20@
  , space_remaining :: BG.FunPtr (BG.Ptr BG.Void -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
  -- ^ [C declaration]: @space_remaining@, defined at @SDL3\/SDL_storage.h 310:22@
  }
  deriving stock (BG.Generic, Eq, Show)

instance Marshal.StaticSize SDL_StorageInterface where
  staticSizeOf = \_ -> (96 :: Int)

  staticAlignment = \_ -> (8 :: Int)

instance Marshal.ReadRaw SDL_StorageInterface where
  readRaw =
    \ptr0 ->
      pure SDL_StorageInterface
        <*> HasCField.readRaw (BG.Proxy @"version") ptr0
        <*> HasCField.readRaw (BG.Proxy @"close") ptr0
        <*> HasCField.readRaw (BG.Proxy @"ready") ptr0
        <*> HasCField.readRaw (BG.Proxy @"enumerate") ptr0
        <*> HasCField.readRaw (BG.Proxy @"info") ptr0
        <*> HasCField.readRaw (BG.Proxy @"read_file") ptr0
        <*> HasCField.readRaw (BG.Proxy @"write_file") ptr0
        <*> HasCField.readRaw (BG.Proxy @"mkdir") ptr0
        <*> HasCField.readRaw (BG.Proxy @"remove") ptr0
        <*> HasCField.readRaw (BG.Proxy @"rename") ptr0
        <*> HasCField.readRaw (BG.Proxy @"copy") ptr0
        <*> HasCField.readRaw (BG.Proxy @"space_remaining") ptr0

instance Marshal.WriteRaw SDL_StorageInterface where
  writeRaw =
    \ptr0 ->
      \s1 ->
        case s1 of
          SDL_StorageInterface
            version2
            close3
            ready4
            enumerate5
            info6
            read_file7
            write_file8
            mkdir9
            remove10
            rename11
            copy12
            space_remaining13 ->
              HasCField.writeRaw (BG.Proxy @"version") ptr0 version2
                >> HasCField.writeRaw (BG.Proxy @"close") ptr0 close3
                >> HasCField.writeRaw (BG.Proxy @"ready") ptr0 ready4
                >> HasCField.writeRaw (BG.Proxy @"enumerate") ptr0 enumerate5
                >> HasCField.writeRaw (BG.Proxy @"info") ptr0 info6
                >> HasCField.writeRaw (BG.Proxy @"read_file") ptr0 read_file7
                >> HasCField.writeRaw (BG.Proxy @"write_file") ptr0 write_file8
                >> HasCField.writeRaw (BG.Proxy @"mkdir") ptr0 mkdir9
                >> HasCField.writeRaw (BG.Proxy @"remove") ptr0 remove10
                >> HasCField.writeRaw (BG.Proxy @"rename") ptr0 rename11
                >> HasCField.writeRaw (BG.Proxy @"copy") ptr0 copy12
                >> HasCField.writeRaw (BG.Proxy @"space_remaining") ptr0 space_remaining13

deriving via Marshal.EquivStorable SDL_StorageInterface instance BG.Storable SDL_StorageInterface

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.CompatHasField.HasField "version" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { version = y1
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"version" x0
      )

instance
  (ty ~ SDL3.Sys.Bindgen.Stdinc.Uint32)
  => BG.HasField "version" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"version")

instance HasCField.HasCField SDL_StorageInterface "version" where
  type
    CFieldType SDL_StorageInterface "version" =
      SDL3.Sys.Bindgen.Stdinc.Uint32

  offset# = \_ -> \_ -> 0

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool))
  => BG.CompatHasField.HasField "close" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { close = y1
            , version = BG.getField @"version" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"close" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool))
  => BG.HasField "close" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"close")

instance HasCField.HasCField SDL_StorageInterface "close" where
  type
    CFieldType SDL_StorageInterface "close" =
      BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool)

  offset# = \_ -> \_ -> 8

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool))
  => BG.CompatHasField.HasField "ready" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { ready = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"ready" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool))
  => BG.HasField "ready" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"ready")

instance HasCField.HasCField SDL_StorageInterface "ready" where
  type
    CFieldType SDL_StorageInterface "ready" =
      BG.FunPtr (BG.Ptr BG.Void -> IO BG.CBool)

  offset# = \_ -> \_ -> 16

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.CChar
            -> SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback
            -> BG.Ptr BG.Void
            -> IO BG.CBool
          )
  )
  => BG.CompatHasField.HasField "enumerate" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { enumerate = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"enumerate" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.CChar
            -> SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback
            -> BG.Ptr BG.Void
            -> IO BG.CBool
          )
  )
  => BG.HasField "enumerate" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"enumerate")

instance HasCField.HasCField SDL_StorageInterface "enumerate" where
  type
    CFieldType SDL_StorageInterface "enumerate" =
      BG.FunPtr
        ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback
          -> BG.Ptr BG.Void
          -> IO BG.CBool
        )

  offset# = \_ -> \_ -> 24

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.CChar
            -> BG.Ptr SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo
            -> IO BG.CBool
          )
  )
  => BG.CompatHasField.HasField "info" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { info = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"info" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.CChar
            -> BG.Ptr SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo
            -> IO BG.CBool
          )
  )
  => BG.HasField "info" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"info")

instance HasCField.HasCField SDL_StorageInterface "info" where
  type
    CFieldType SDL_StorageInterface "info" =
      BG.FunPtr
        ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> BG.Ptr SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo
          -> IO BG.CBool
        )

  offset# = \_ -> \_ -> 32

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.CChar
            -> BG.Ptr BG.Void
            -> SDL3.Sys.Bindgen.Stdinc.Uint64
            -> IO BG.CBool
          )
  )
  => BG.CompatHasField.HasField "read_file" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { read_file = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"read_file" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.CChar
            -> BG.Ptr BG.Void
            -> SDL3.Sys.Bindgen.Stdinc.Uint64
            -> IO BG.CBool
          )
  )
  => BG.HasField "read_file" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"read_file")

instance HasCField.HasCField SDL_StorageInterface "read_file" where
  type
    CFieldType SDL_StorageInterface "read_file" =
      BG.FunPtr
        ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> BG.Ptr BG.Void
          -> SDL3.Sys.Bindgen.Stdinc.Uint64
          -> IO BG.CBool
        )

  offset# = \_ -> \_ -> 40

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.CChar
            -> PtrConst.PtrConst BG.Void
            -> SDL3.Sys.Bindgen.Stdinc.Uint64
            -> IO BG.CBool
          )
  )
  => BG.CompatHasField.HasField "write_file" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { write_file = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"write_file" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          ( BG.Ptr BG.Void
            -> PtrConst.PtrConst BG.CChar
            -> PtrConst.PtrConst BG.Void
            -> SDL3.Sys.Bindgen.Stdinc.Uint64
            -> IO BG.CBool
          )
  )
  => BG.HasField "write_file" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"write_file")

instance HasCField.HasCField SDL_StorageInterface "write_file" where
  type
    CFieldType SDL_StorageInterface "write_file" =
      BG.FunPtr
        ( BG.Ptr BG.Void
          -> PtrConst.PtrConst BG.CChar
          -> PtrConst.PtrConst BG.Void
          -> SDL3.Sys.Bindgen.Stdinc.Uint64
          -> IO BG.CBool
        )

  offset# = \_ -> \_ -> 48

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
  => BG.CompatHasField.HasField "mkdir" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { mkdir = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"mkdir" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
  => BG.HasField "mkdir" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"mkdir")

instance HasCField.HasCField SDL_StorageInterface "mkdir" where
  type
    CFieldType SDL_StorageInterface "mkdir" =
      BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)

  offset# = \_ -> \_ -> 56

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
  => BG.CompatHasField.HasField "remove" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { remove = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"remove" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
  => BG.HasField "remove" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"remove")

instance HasCField.HasCField SDL_StorageInterface "remove" where
  type
    CFieldType SDL_StorageInterface "remove" =
      BG.FunPtr (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)

  offset# = \_ -> \_ -> 64

instance
  ( ty
      ~ BG.FunPtr
          (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
  )
  => BG.CompatHasField.HasField "rename" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { rename = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , copy = BG.getField @"copy" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"rename" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
  )
  => BG.HasField "rename" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"rename")

instance HasCField.HasCField SDL_StorageInterface "rename" where
  type
    CFieldType SDL_StorageInterface "rename" =
      BG.FunPtr
        (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)

  offset# = \_ -> \_ -> 72

instance
  ( ty
      ~ BG.FunPtr
          (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
  )
  => BG.CompatHasField.HasField "copy" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { copy = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , space_remaining = BG.getField @"space_remaining" x0
            }
      , BG.getField @"copy" x0
      )

instance
  ( ty
      ~ BG.FunPtr
          (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
  )
  => BG.HasField "copy" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField = HasCField.fromPtr (BG.Proxy @"copy")

instance HasCField.HasCField SDL_StorageInterface "copy" where
  type
    CFieldType SDL_StorageInterface "copy" =
      BG.FunPtr
        (BG.Ptr BG.Void -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)

  offset# = \_ -> \_ -> 80

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
  => BG.CompatHasField.HasField "space_remaining" SDL_StorageInterface ty
  where
  hasField =
    \x0 ->
      ( \y1 ->
          SDL_StorageInterface
            { space_remaining = y1
            , version = BG.getField @"version" x0
            , close = BG.getField @"close" x0
            , ready = BG.getField @"ready" x0
            , enumerate = BG.getField @"enumerate" x0
            , info = BG.getField @"info" x0
            , read_file = BG.getField @"read_file" x0
            , write_file = BG.getField @"write_file" x0
            , mkdir = BG.getField @"mkdir" x0
            , remove = BG.getField @"remove" x0
            , rename = BG.getField @"rename" x0
            , copy = BG.getField @"copy" x0
            }
      , BG.getField @"space_remaining" x0
      )

instance
  (ty ~ BG.FunPtr (BG.Ptr BG.Void -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
  => BG.HasField "space_remaining" (BG.Ptr SDL_StorageInterface) (BG.Ptr ty)
  where
  getField =
    HasCField.fromPtr (BG.Proxy @"space_remaining")

instance HasCField.HasCField SDL_StorageInterface "space_remaining" where
  type
    CFieldType SDL_StorageInterface "space_remaining" =
      BG.FunPtr (BG.Ptr BG.Void -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)

  offset# = \_ -> \_ -> 88

-- | An abstract interface for filesystem access.
--
--     This is an opaque datatype. One can create this object using standard SDL functions like SDL_OpenTitleStorage or SDL_OpenUserStorage, etc, or create an object with a custom implementation using SDL_OpenStorage.
--
--     @since 3.2.0
--
--     [C declaration]: @struct SDL_Storage@, defined at @SDL3\/SDL_storage.h 332:16@
data SDL_Storage
