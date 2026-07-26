-- | The storage API is a high-level API designed to abstract away the portability issues that come up when using something lower-level (in SDL\'s case, this sits on top of the [Filesystem](https:\/\/wiki.libsdl.org\/SDL3\/CategoryFilesystem) and [IOStream](https:\/\/wiki.libsdl.org\/SDL3\/CategoryIOStream) subsystems). It is significantly more restrictive than a typical filesystem API, for a number of reasons:
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
--     Apps that want to supply a custom implementation of 'SDL_Storage' will fill in all the functions in this struct, and then pass it to 'openStorage' to create a custom 'SDL_Storage' object.
--
--     It is not usually necessary to do this; SDL provides standard implementations for many things you might expect to do with an 'SDL_Storage'.
--
--     This structure should be initialized using SDL_INIT_INTERFACE()
--
--     @since 3.2.0
--
--     [See also]: SDL_INIT_INTERFACE
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Storage.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Storage (
  module SDL3.Sys.Bindgen.Storage,

  -- * Function aliases
  SDL3.Sys.Storage.openTitleStorage,
  SDL3.Sys.Storage.openTitleStorageSafe,
  SDL3.Sys.Storage.openUserStorage,
  SDL3.Sys.Storage.openUserStorageSafe,
  SDL3.Sys.Storage.openFileStorage,
  SDL3.Sys.Storage.openFileStorageSafe,
  SDL3.Sys.Storage.openStorage,
  SDL3.Sys.Storage.openStorageSafe,
  SDL3.Sys.Storage.closeStorage,
  SDL3.Sys.Storage.closeStorageSafe,
  SDL3.Sys.Storage.storageReady,
  SDL3.Sys.Storage.storageReadySafe,
  SDL3.Sys.Storage.getStorageFileSize,
  SDL3.Sys.Storage.getStorageFileSizeSafe,
  SDL3.Sys.Storage.readStorageFile,
  SDL3.Sys.Storage.readStorageFileSafe,
  SDL3.Sys.Storage.writeStorageFile,
  SDL3.Sys.Storage.writeStorageFileSafe,
  SDL3.Sys.Storage.createStorageDirectory,
  SDL3.Sys.Storage.createStorageDirectorySafe,
  SDL3.Sys.Storage.enumerateStorageDirectorySafe,
  SDL3.Sys.Storage.removeStoragePath,
  SDL3.Sys.Storage.removeStoragePathSafe,
  SDL3.Sys.Storage.renameStoragePath,
  SDL3.Sys.Storage.renameStoragePathSafe,
  SDL3.Sys.Storage.copyStorageFile,
  SDL3.Sys.Storage.copyStorageFileSafe,
  SDL3.Sys.Storage.getStoragePathInfo,
  SDL3.Sys.Storage.getStoragePathInfoSafe,
  SDL3.Sys.Storage.getStorageSpaceRemaining,
  SDL3.Sys.Storage.getStorageSpaceRemainingSafe,
  SDL3.Sys.Storage.globStorageDirectory,
  SDL3.Sys.Storage.globStorageDirectorySafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Filesystem qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Storage
import SDL3.Sys.Bindgen.Storage.Safe qualified as Safe
import SDL3.Sys.Bindgen.Storage.Unsafe qualified as Unsafe

-- | Opens up a read-only container for the application\'s filesystem.
--
--     By default, 'openTitleStorage' uses the generic storage implementation. When the path override is not provided, the generic implementation will use the output of 'SDL3.Sys.Filesystem.getBasePath' as the base path.
--
--     [Returns]: a title storage container on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeStorage', 'getStorageFileSize', 'openUserStorage', 'readStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenTitleStorage@.
--                   The safe flavor is 'openTitleStorageSafe'
--                   .
--
--     [C declaration]: @SDL_OpenTitleStorage@, defined at @SDL3\/SDL_storage.h 353:43@
openTitleStorage
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@override@]: a path to override the backend\'s default title root.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: a property list that may contain backend-specific information.
  -> IO (BG.Ptr SDL_Storage)
openTitleStorage = Unsafe.sDL_OpenTitleStorage

-- | Opens up a read-only container for the application\'s filesystem.
--
--     By default, 'openTitleStorage' uses the generic storage implementation. When the path override is not provided, the generic implementation will use the output of 'SDL3.Sys.Filesystem.getBasePath' as the base path.
--
--     [Returns]: a title storage container on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeStorage', 'getStorageFileSize', 'openUserStorage', 'readStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenTitleStorage@.
--                   The unsafe flavor is 'openTitleStorage'
--                   .
--
--     [C declaration]: @SDL_OpenTitleStorage@, defined at @SDL3\/SDL_storage.h 353:43@
openTitleStorageSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@override@]: a path to override the backend\'s default title root.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: a property list that may contain backend-specific information.
  -> IO (BG.Ptr SDL_Storage)
openTitleStorageSafe = Safe.sDL_OpenTitleStorage

-- | Opens up a container for a user\'s unique read\/write filesystem.
--
--     While title storage can generally be kept open throughout runtime, user storage should only be opened when the client is ready to read\/write files. This allows the backend to properly batch file operations and flush them when the container has been closed; ensuring safe and optimal save I\/O.
--
--     [Returns]: a user storage container on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeStorage', 'getStorageFileSize', 'getStorageSpaceRemaining', 'openTitleStorage', 'readStorageFile', 'storageReady', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenUserStorage@.
--                   The safe flavor is 'openUserStorageSafe'
--                   .
--
--     [C declaration]: @SDL_OpenUserStorage@, defined at @SDL3\/SDL_storage.h 379:43@
openUserStorage
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@org@]: the name of your organization.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@app@]: the name of your application.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: a property list that may contain backend-specific information.
  -> IO (BG.Ptr SDL_Storage)
openUserStorage = Unsafe.sDL_OpenUserStorage

-- | Opens up a container for a user\'s unique read\/write filesystem.
--
--     While title storage can generally be kept open throughout runtime, user storage should only be opened when the client is ready to read\/write files. This allows the backend to properly batch file operations and flush them when the container has been closed; ensuring safe and optimal save I\/O.
--
--     [Returns]: a user storage container on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeStorage', 'getStorageFileSize', 'getStorageSpaceRemaining', 'openTitleStorage', 'readStorageFile', 'storageReady', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenUserStorage@.
--                   The unsafe flavor is 'openUserStorage'
--                   .
--
--     [C declaration]: @SDL_OpenUserStorage@, defined at @SDL3\/SDL_storage.h 379:43@
openUserStorageSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@org@]: the name of your organization.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@app@]: the name of your application.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: a property list that may contain backend-specific information.
  -> IO (BG.Ptr SDL_Storage)
openUserStorageSafe = Safe.sDL_OpenUserStorage

-- | Opens up a container for local filesystem storage.
--
--     This is provided for development and tools. Portable applications should use @'openTitleStorage'@ for access to game data and @'openUserStorage'@ for access to user data.
--
--     [Returns]: a filesystem storage container on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeStorage', 'getStorageFileSize', 'getStorageSpaceRemaining', 'openTitleStorage', 'openUserStorage', 'readStorageFile', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenFileStorage@.
--                   The safe flavor is 'openFileStorageSafe'
--                   .
--
--     [C declaration]: @SDL_OpenFileStorage@, defined at @SDL3\/SDL_storage.h 403:43@
openFileStorage
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the base path prepended to all storage paths, or NULL for no base path.
  -> IO (BG.Ptr SDL_Storage)
openFileStorage = Unsafe.sDL_OpenFileStorage

-- | Opens up a container for local filesystem storage.
--
--     This is provided for development and tools. Portable applications should use @'openTitleStorage'@ for access to game data and @'openUserStorage'@ for access to user data.
--
--     [Returns]: a filesystem storage container on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeStorage', 'getStorageFileSize', 'getStorageSpaceRemaining', 'openTitleStorage', 'openUserStorage', 'readStorageFile', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenFileStorage@.
--                   The unsafe flavor is 'openFileStorage'
--                   .
--
--     [C declaration]: @SDL_OpenFileStorage@, defined at @SDL3\/SDL_storage.h 403:43@
openFileStorageSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the base path prepended to all storage paths, or NULL for no base path.
  -> IO (BG.Ptr SDL_Storage)
openFileStorageSafe = Safe.sDL_OpenFileStorage

-- | Opens up a container using a client-provided storage interface.
--
--     Applications do not need to use this function unless they are providing their own 'SDL_Storage' implementation. If you just need an 'SDL_Storage', you should use the built-in implementations in SDL, like @'openTitleStorage'@ or @'openUserStorage'@.
--
--     This function makes a copy of @iface@ and the caller does not need to keep it around after this call.
--
--     [Returns]: a storage container on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeStorage', 'getStorageFileSize', 'getStorageSpaceRemaining', SDL_INIT_INTERFACE, 'readStorageFile', 'storageReady', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenStorage@.
--                   The safe flavor is 'openStorageSafe'
--                   .
--
--     [C declaration]: @SDL_OpenStorage@, defined at @SDL3\/SDL_storage.h 432:43@
openStorage
  :: PtrConst.PtrConst SDL_StorageInterface
  -- ^
  --
  --           [@iface@]: the interface that implements this storage, initialized using SDL_INIT_INTERFACE().
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: the pointer that will be passed to the interface functions.
  -> IO (BG.Ptr SDL_Storage)
openStorage = Unsafe.sDL_OpenStorage

-- | Opens up a container using a client-provided storage interface.
--
--     Applications do not need to use this function unless they are providing their own 'SDL_Storage' implementation. If you just need an 'SDL_Storage', you should use the built-in implementations in SDL, like @'openTitleStorage'@ or @'openUserStorage'@.
--
--     This function makes a copy of @iface@ and the caller does not need to keep it around after this call.
--
--     [Returns]: a storage container on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'closeStorage', 'getStorageFileSize', 'getStorageSpaceRemaining', SDL_INIT_INTERFACE, 'readStorageFile', 'storageReady', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenStorage@.
--                   The unsafe flavor is 'openStorage'
--                   .
--
--     [C declaration]: @SDL_OpenStorage@, defined at @SDL3\/SDL_storage.h 432:43@
openStorageSafe
  :: PtrConst.PtrConst SDL_StorageInterface
  -- ^
  --
  --           [@iface@]: the interface that implements this storage, initialized using SDL_INIT_INTERFACE().
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: the pointer that will be passed to the interface functions.
  -> IO (BG.Ptr SDL_Storage)
openStorageSafe = Safe.sDL_OpenStorage

-- | Closes and frees a storage container.
--
--     [Returns]: true if the container was freed with no errors, false otherwise; call 'SDL3.Sys.Error.getError' for more information. Even if the function returns an error, the container data will be freed; the error is only for informational purposes.
--
--     @since 3.2.0
--
--     [See also]: 'openFileStorage', 'openStorage', 'openTitleStorage', 'openUserStorage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CloseStorage@.
--                   The safe flavor is 'closeStorageSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CloseStorage@, defined at @SDL3\/SDL_storage.h 450:34@
closeStorage
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to close.
  -> IO Bool
closeStorage =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_CloseStorage x00)

-- | Closes and frees a storage container.
--
--     [Returns]: true if the container was freed with no errors, false otherwise; call 'SDL3.Sys.Error.getError' for more information. Even if the function returns an error, the container data will be freed; the error is only for informational purposes.
--
--     @since 3.2.0
--
--     [See also]: 'openFileStorage', 'openStorage', 'openTitleStorage', 'openUserStorage'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CloseStorage@.
--                   The unsafe flavor is 'closeStorage'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CloseStorage@, defined at @SDL3\/SDL_storage.h 450:34@
closeStorageSafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to close.
  -> IO Bool
closeStorageSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_CloseStorage x00)

-- | Checks if the storage container is ready to use.
--
--     This function should be called in regular intervals until it returns true - however, it is not recommended to spinwait on this call, as the backend may depend on a synchronous message loop. You might instead poll this in your game\'s main loop while processing events and drawing a loading screen.
--
--     [Returns]: true if the container is ready, false otherwise.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_StorageReady@.
--                   The safe flavor is 'storageReadySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StorageReady@, defined at @SDL3\/SDL_storage.h 465:34@
storageReady
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to query.
  -> IO Bool
storageReady =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_StorageReady x00)

-- | Checks if the storage container is ready to use.
--
--     This function should be called in regular intervals until it returns true - however, it is not recommended to spinwait on this call, as the backend may depend on a synchronous message loop. You might instead poll this in your game\'s main loop while processing events and drawing a loading screen.
--
--     [Returns]: true if the container is ready, false otherwise.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_StorageReady@.
--                   The unsafe flavor is 'storageReady'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_StorageReady@, defined at @SDL3\/SDL_storage.h 465:34@
storageReadySafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to query.
  -> IO Bool
storageReadySafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_StorageReady x00)

-- | Query the size of a file within a storage container.
--
--     [Returns]: true if the file could be queried or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'readStorageFile', 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetStorageFileSize@.
--                   The safe flavor is 'getStorageFileSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetStorageFileSize@, defined at @SDL3\/SDL_storage.h 481:34@
getStorageFileSize
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the relative path of the file to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@length@]: a pointer to be filled with the file\'s length.
  -> IO Bool
getStorageFileSize =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetStorageFileSize x00 x11 x22)

-- | Query the size of a file within a storage container.
--
--     [Returns]: true if the file could be queried or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'readStorageFile', 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetStorageFileSize@.
--                   The unsafe flavor is 'getStorageFileSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetStorageFileSize@, defined at @SDL3\/SDL_storage.h 481:34@
getStorageFileSizeSafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to query.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the relative path of the file to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@length@]: a pointer to be filled with the file\'s length.
  -> IO Bool
getStorageFileSizeSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetStorageFileSize x00 x11 x22)

-- | Synchronously read a file from a storage container into a client-provided buffer.
--
--     The value of @length@ must match the length of the file exactly; call @'getStorageFileSize'@ to get this value. This behavior may be relaxed in a future release.
--
--     [Returns]: true if the file was read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getStorageFileSize', 'storageReady', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadStorageFile@.
--                   The safe flavor is 'readStorageFileSafe'
--                   : dispatches through the storage\'s SDL_StorageInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadStorageFile@, defined at @SDL3\/SDL_storage.h 504:34@
readStorageFile
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to read from.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the relative path of the file to read.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@destination@]: a client-provided buffer to read the file into.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the length of the destination buffer.
  -> IO Bool
readStorageFile =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_ReadStorageFile x00 x11 x22 (Coerce.coerce x33))

-- | Synchronously read a file from a storage container into a client-provided buffer.
--
--     The value of @length@ must match the length of the file exactly; call @'getStorageFileSize'@ to get this value. This behavior may be relaxed in a future release.
--
--     [Returns]: true if the file was read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getStorageFileSize', 'storageReady', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadStorageFile@.
--                   The unsafe flavor is 'readStorageFile'
--                   : dispatches through the storage\'s SDL_StorageInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadStorageFile@, defined at @SDL3\/SDL_storage.h 504:34@
readStorageFileSafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to read from.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the relative path of the file to read.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@destination@]: a client-provided buffer to read the file into.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the length of the destination buffer.
  -> IO Bool
readStorageFileSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_ReadStorageFile x00 x11 x22 (Coerce.coerce x33))

-- | Synchronously write a file from client memory into a storage container.
--
--     [Returns]: true if the file was written or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getStorageSpaceRemaining', 'readStorageFile', 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteStorageFile@.
--                   The safe flavor is 'writeStorageFileSafe'
--                   : dispatches through the storage\'s SDL_StorageInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteStorageFile@, defined at @SDL3\/SDL_storage.h 522:34@
writeStorageFile
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to write to.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the relative path of the file to write.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@source@]: a client-provided buffer to write from.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the length of the source buffer.
  -> IO Bool
writeStorageFile =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_WriteStorageFile x00 x11 x22 (Coerce.coerce x33))

-- | Synchronously write a file from client memory into a storage container.
--
--     [Returns]: true if the file was written or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'getStorageSpaceRemaining', 'readStorageFile', 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteStorageFile@.
--                   The unsafe flavor is 'writeStorageFile'
--                   : dispatches through the storage\'s SDL_StorageInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteStorageFile@, defined at @SDL3\/SDL_storage.h 522:34@
writeStorageFileSafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to write to.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the relative path of the file to write.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@source@]: a client-provided buffer to write from.
  -> BG.Word64
  -- ^
  --
  --           [@length@]: the length of the source buffer.
  -> IO Bool
writeStorageFileSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_WriteStorageFile x00 x11 x22 (Coerce.coerce x33))

-- | Create a directory in a writable storage container.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateStorageDirectory@.
--                   The safe flavor is 'createStorageDirectorySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateStorageDirectory@, defined at @SDL3\/SDL_storage.h 536:34@
createStorageDirectory
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to create.
  -> IO Bool
createStorageDirectory =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_CreateStorageDirectory x00 x11)

-- | Create a directory in a writable storage container.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateStorageDirectory@.
--                   The unsafe flavor is 'createStorageDirectory'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateStorageDirectory@, defined at @SDL3\/SDL_storage.h 536:34@
createStorageDirectorySafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to create.
  -> IO Bool
createStorageDirectorySafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_CreateStorageDirectory x00 x11)

-- | Enumerate a directory in a storage container through a callback function.
--
--     This function provides every directory entry through an app-provided callback, called once for each directory entry, until all results have been provided or the callback returns either SDL_ENUM_SUCCESS or SDL_ENUM_FAILURE.
--
--     This will return false if there was a system problem in general, or if a callback returns SDL_ENUM_FAILURE. A successful return means a callback returned SDL_ENUM_SUCCESS to halt enumeration, or all directory entries were enumerated.
--
--     If @path@ is NULL, this is treated as a request to enumerate the root of the storage container\'s tree. An empty string also works for this.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EnumerateStorageDirectory@.
--                   The unsafe import is not exported
--                   : invokes the callback per entry synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Storage.Unsafe.sDL_EnumerateStorageDirectory@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_EnumerateStorageDirectory@, defined at @SDL3\/SDL_storage.h 565:34@
enumerateStorageDirectorySafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to enumerate, or NULL for the root.
  -> SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback
  -- ^
  --
  --           [@callback@]: a function that is called for each entry in the directory.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @callback@.
  -> IO Bool
enumerateStorageDirectorySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_EnumerateStorageDirectory x00 x11 x22 x33)

-- | Remove a file or an empty directory in a writable storage container.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RemoveStoragePath@.
--                   The safe flavor is 'removeStoragePathSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RemoveStoragePath@, defined at @SDL3\/SDL_storage.h 579:34@
removeStoragePath
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to enumerate.
  -> IO Bool
removeStoragePath =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_RemoveStoragePath x00 x11)

-- | Remove a file or an empty directory in a writable storage container.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RemoveStoragePath@.
--                   The unsafe flavor is 'removeStoragePath'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RemoveStoragePath@, defined at @SDL3\/SDL_storage.h 579:34@
removeStoragePathSafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to enumerate.
  -> IO Bool
removeStoragePathSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_RemoveStoragePath x00 x11)

-- | Rename a file or directory in a writable storage container.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenameStoragePath@.
--                   The safe flavor is 'renameStoragePathSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenameStoragePath@, defined at @SDL3\/SDL_storage.h 594:34@
renameStoragePath
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@oldpath@]: the old path.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@newpath@]: the new path.
  -> IO Bool
renameStoragePath =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_RenameStoragePath x00 x11 x22)

-- | Rename a file or directory in a writable storage container.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenameStoragePath@.
--                   The unsafe flavor is 'renameStoragePath'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenameStoragePath@, defined at @SDL3\/SDL_storage.h 594:34@
renameStoragePathSafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@oldpath@]: the old path.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@newpath@]: the new path.
  -> IO Bool
renameStoragePathSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_RenameStoragePath x00 x11 x22)

-- | Copy a file in a writable storage container.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CopyStorageFile@.
--                   The safe flavor is 'copyStorageFileSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyStorageFile@, defined at @SDL3\/SDL_storage.h 609:34@
copyStorageFile
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@oldpath@]: the old path.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@newpath@]: the new path.
  -> IO Bool
copyStorageFile =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_CopyStorageFile x00 x11 x22)

-- | Copy a file in a writable storage container.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CopyStorageFile@.
--                   The unsafe flavor is 'copyStorageFile'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyStorageFile@, defined at @SDL3\/SDL_storage.h 609:34@
copyStorageFileSafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@oldpath@]: the old path.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@newpath@]: the new path.
  -> IO Bool
copyStorageFileSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_CopyStorageFile x00 x11 x22)

-- | Get information about a filesystem path in a storage container.
--
--     [Returns]: true on success or false if the file doesn\'t exist, or another failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetStoragePathInfo@.
--                   The safe flavor is 'getStoragePathInfoSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetStoragePathInfo@, defined at @SDL3\/SDL_storage.h 625:34@
getStoragePathInfo
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo
  -- ^
  --
  --           [@info@]: a pointer filled in with information about the path, or NULL to check for the existence of a file.
  -> IO Bool
getStoragePathInfo =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_GetStoragePathInfo x00 x11 x22)

-- | Get information about a filesystem path in a storage container.
--
--     [Returns]: true on success or false if the file doesn\'t exist, or another failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetStoragePathInfo@.
--                   The unsafe flavor is 'getStoragePathInfo'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetStoragePathInfo@, defined at @SDL3\/SDL_storage.h 625:34@
getStoragePathInfoSafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path to query.
  -> BG.Ptr SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo
  -- ^
  --
  --           [@info@]: a pointer filled in with information about the path, or NULL to check for the existence of a file.
  -> IO Bool
getStoragePathInfoSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_GetStoragePathInfo x00 x11 x22)

-- | Queries the remaining space in a storage container.
--
--     [Returns]: the amount of remaining space, in bytes.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetStorageSpaceRemaining@.
--                   The safe flavor is 'getStorageSpaceRemainingSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetStorageSpaceRemaining@, defined at @SDL3\/SDL_storage.h 638:36@
getStorageSpaceRemaining
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to query.
  -> IO BG.Word64
getStorageSpaceRemaining =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_GetStorageSpaceRemaining x00)

-- | Queries the remaining space in a storage container.
--
--     [Returns]: the amount of remaining space, in bytes.
--
--     @since 3.2.0
--
--     [See also]: 'storageReady', 'writeStorageFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetStorageSpaceRemaining@.
--                   The unsafe flavor is 'getStorageSpaceRemaining'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetStorageSpaceRemaining@, defined at @SDL3\/SDL_storage.h 638:36@
getStorageSpaceRemainingSafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to query.
  -> IO BG.Word64
getStorageSpaceRemainingSafe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_GetStorageSpaceRemaining x00)

-- | Enumerate a directory tree, filtered by pattern, and return a list.
--
--     Files are filtered out if they don\'t match the string in @pattern@, which may contain wildcard characters @*@ (match everything) and @?@ (match one character). If pattern is NULL, no filtering is done and all results are returned. Subdirectories are permitted, and are specified with a path separator of \'\/\'. Wildcard characters @*@ and @?@ never match a path separator.
--
--     @flags@ may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching case-insensitive.
--
--     The returned array is always NULL-terminated, for your iterating convenience, but if @count@ is non-NULL, on return it will contain the number of items in the array, not counting the NULL terminator.
--
--     If @path@ is NULL, this is treated as a request to enumerate the root of the storage container\'s tree. An empty string also works for this.
--
--     [Returns]: an array of strings on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. The caller should pass the returned pointer to 'SDL3.Sys.Stdinc.free' when done with it. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, assuming the @storage@ object is thread-safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GlobStorageDirectory@.
--                   The safe flavor is 'globStorageDirectorySafe'
--                   : dispatches through the storage\'s SDL_StorageInterface, which may be implemented in Haskell.
--
--     [C declaration]: @SDL_GlobStorageDirectory@, defined at @SDL3\/SDL_storage.h 678:37@
globStorageDirectory
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to enumerate, or NULL for the root.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@pattern@]: the pattern that files in the directory must match. Can be NULL.
  -> SDL3.Sys.Bindgen.Filesystem.SDL_GlobFlags
  -- ^
  --
  --           [@flags@]: @SDL_GLOB_*@ bitflags that affect this search.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: on return, will be set to the number of items in the returned array. Can be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
globStorageDirectory =
  Unsafe.sDL_GlobStorageDirectory

-- | Enumerate a directory tree, filtered by pattern, and return a list.
--
--     Files are filtered out if they don\'t match the string in @pattern@, which may contain wildcard characters @*@ (match everything) and @?@ (match one character). If pattern is NULL, no filtering is done and all results are returned. Subdirectories are permitted, and are specified with a path separator of \'\/\'. Wildcard characters @*@ and @?@ never match a path separator.
--
--     @flags@ may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching case-insensitive.
--
--     The returned array is always NULL-terminated, for your iterating convenience, but if @count@ is non-NULL, on return it will contain the number of items in the array, not counting the NULL terminator.
--
--     If @path@ is NULL, this is treated as a request to enumerate the root of the storage container\'s tree. An empty string also works for this.
--
--     [Returns]: an array of strings on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. The caller should pass the returned pointer to 'SDL3.Sys.Stdinc.free' when done with it. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, assuming the @storage@ object is thread-safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GlobStorageDirectory@.
--                   The unsafe flavor is 'globStorageDirectory'
--                   : dispatches through the storage\'s SDL_StorageInterface, which may be implemented in Haskell.
--
--     [C declaration]: @SDL_GlobStorageDirectory@, defined at @SDL3\/SDL_storage.h 678:37@
globStorageDirectorySafe
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to enumerate, or NULL for the root.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@pattern@]: the pattern that files in the directory must match. Can be NULL.
  -> SDL3.Sys.Bindgen.Filesystem.SDL_GlobFlags
  -- ^
  --
  --           [@flags@]: @SDL_GLOB_*@ bitflags that affect this search.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: on return, will be set to the number of items in the returned array. Can be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
globStorageDirectorySafe =
  Safe.sDL_GlobStorageDirectory
