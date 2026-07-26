{-# LANGUAGE PatternSynonyms #-}

-- | SDL offers an API for examining and manipulating the system\'s filesystem. This covers most things one would need to do with directories, except for actual file I\/O (which is covered by [CategoryIOStream](https:\/\/wiki.libsdl.org\/SDL3\/CategoryIOStream) and [CategoryAsyncIO](https:\/\/wiki.libsdl.org\/SDL3\/CategoryAsyncIO) instead).
--
--     There are functions to answer necessary path questions:
--
--     * Where is my app\'s data? @'getBasePath'@.
--
--     * Where can I safely write files? @'getPrefPath'@.
--
--     * Where are paths like Downloads, Desktop, Music? @'getUserFolder'@.
--
--     * What is this thing at this location? @'getPathInfo'@.
--
--     * What items live in this folder? @'enumerateDirectorySafe'@.
--
--     * What items live in this folder by wildcard? @'globDirectory'@.
--
--     * What is my current working directory? @'getCurrentDirectory'@.
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
--     [Returns]: an absolute path in UTF-8 encoding to the application data directory. NULL will be returned on error or when the platform doesn\'t implement this functionality, call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getPrefPath'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Filesystem.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Filesystem (
  module SDL3.Sys.Bindgen.Filesystem,

  -- * Typed constants
  pattern SDL3.Sys.Filesystem.SDL_GLOB_CASEINSENSITIVE,

  -- * Function aliases
  SDL3.Sys.Filesystem.getBasePath,
  SDL3.Sys.Filesystem.getBasePathSafe,
  SDL3.Sys.Filesystem.getPrefPath,
  SDL3.Sys.Filesystem.getPrefPathSafe,
  SDL3.Sys.Filesystem.getUserFolder,
  SDL3.Sys.Filesystem.getUserFolderSafe,
  SDL3.Sys.Filesystem.createDirectory,
  SDL3.Sys.Filesystem.createDirectorySafe,
  SDL3.Sys.Filesystem.enumerateDirectorySafe,
  SDL3.Sys.Filesystem.removePath,
  SDL3.Sys.Filesystem.removePathSafe,
  SDL3.Sys.Filesystem.renamePath,
  SDL3.Sys.Filesystem.renamePathSafe,
  SDL3.Sys.Filesystem.copyFile,
  SDL3.Sys.Filesystem.copyFileSafe,
  SDL3.Sys.Filesystem.getPathInfo,
  SDL3.Sys.Filesystem.getPathInfoSafe,
  SDL3.Sys.Filesystem.globDirectory,
  SDL3.Sys.Filesystem.globDirectorySafe,
  SDL3.Sys.Filesystem.getCurrentDirectory,
  SDL3.Sys.Filesystem.getCurrentDirectorySafe,
)
where

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Filesystem
import SDL3.Sys.Bindgen.Filesystem.Safe qualified as Safe
import SDL3.Sys.Bindgen.Filesystem.Unsafe qualified as Unsafe

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetBasePath@.
--                   The safe flavor is 'getBasePathSafe'
--                   .
--
--     [C declaration]: @SDL_GetBasePath@, defined at @SDL3\/SDL_filesystem.h 101:42@
getBasePath :: IO (PtrConst.PtrConst BG.CChar)
getBasePath = Unsafe.sDL_GetBasePath

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetBasePath@.
--                   The unsafe flavor is 'getBasePath'
--                   .
--
--     [C declaration]: @SDL_GetBasePath@, defined at @SDL3\/SDL_filesystem.h 101:42@
getBasePathSafe :: IO (PtrConst.PtrConst BG.CChar)
getBasePathSafe = Safe.sDL_GetBasePath

-- | Get the user-and-app-specific path where files can be written.
--
--     Get the \"pref dir\". This is meant to be where users can write personal files (preferences and save games, etc) that are specific to your application. This directory is unique per user, per application.
--
--     This function will decide the appropriate location in the native filesystem, create the directory if necessary, and return a string of the absolute path to the directory in UTF-8 encoding.
--
--     On Windows, the string might look like:
--
--     @C:\\\\Users\\\\bob\\\\AppData\\\\Roaming\\\\My Company\\\\My Program Name\\\\@
--
--     On Linux, the string might look like:
--
--     @\/home\/bob\/.local\/share\/My Program Name\/@
--
--     On macOS, the string might look like:
--
--     @\/Users\/bob\/Library\/Application Support\/My Program Name\/@
--
--     You should assume the path returned by this function is the only safe place to write files (and that @'getBasePath'@, while it might be writable, or even the parent of the returned path, isn\'t where you should be writing things).
--
--     Both the org and app strings may become part of a directory name, so please follow these rules:
--
--     * Try to use the same org string (/including case-sensitivity/) for all your applications that use this function.
--
--     * Always use a unique app string for each one, and make sure it never changes for an app once you\'ve decided on it.
--
--     * Unicode characters are legal, as long as they are UTF-8 encoded, but...
--
--     * ...only use letters, numbers, and spaces. Avoid punctuation like \"Game Name 2: Bad Guy\'s Revenge!\" ... \"Game Name 2\" is sufficient.
--
--     Due to historical mistakes, @org@ is allowed to be NULL or \"\". In such cases, SDL will omit the org subdirectory, including on platforms where it shouldn\'t, and including on platforms where this would make your app fail certification for an app store. New apps should definitely specify a real string for @org@.
--
--     The returned path is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     [Returns]: a UTF-8 string of the user directory in platform-dependent notation. NULL if there\'s a problem (creating directory failed, etc.). This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getBasePath'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPrefPath@.
--                   The safe flavor is 'getPrefPathSafe'
--                   .
--
--     [C declaration]: @SDL_GetPrefPath@, defined at @SDL3\/SDL_filesystem.h 164:36@
getPrefPath
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@org@]: the name of your organization.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@app@]: the name of your application.
  -> IO (BG.Ptr BG.CChar)
getPrefPath = Unsafe.sDL_GetPrefPath

-- | Get the user-and-app-specific path where files can be written.
--
--     Get the \"pref dir\". This is meant to be where users can write personal files (preferences and save games, etc) that are specific to your application. This directory is unique per user, per application.
--
--     This function will decide the appropriate location in the native filesystem, create the directory if necessary, and return a string of the absolute path to the directory in UTF-8 encoding.
--
--     On Windows, the string might look like:
--
--     @C:\\\\Users\\\\bob\\\\AppData\\\\Roaming\\\\My Company\\\\My Program Name\\\\@
--
--     On Linux, the string might look like:
--
--     @\/home\/bob\/.local\/share\/My Program Name\/@
--
--     On macOS, the string might look like:
--
--     @\/Users\/bob\/Library\/Application Support\/My Program Name\/@
--
--     You should assume the path returned by this function is the only safe place to write files (and that @'getBasePath'@, while it might be writable, or even the parent of the returned path, isn\'t where you should be writing things).
--
--     Both the org and app strings may become part of a directory name, so please follow these rules:
--
--     * Try to use the same org string (/including case-sensitivity/) for all your applications that use this function.
--
--     * Always use a unique app string for each one, and make sure it never changes for an app once you\'ve decided on it.
--
--     * Unicode characters are legal, as long as they are UTF-8 encoded, but...
--
--     * ...only use letters, numbers, and spaces. Avoid punctuation like \"Game Name 2: Bad Guy\'s Revenge!\" ... \"Game Name 2\" is sufficient.
--
--     Due to historical mistakes, @org@ is allowed to be NULL or \"\". In such cases, SDL will omit the org subdirectory, including on platforms where it shouldn\'t, and including on platforms where this would make your app fail certification for an app store. New apps should definitely specify a real string for @org@.
--
--     The returned path is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     [Returns]: a UTF-8 string of the user directory in platform-dependent notation. NULL if there\'s a problem (creating directory failed, etc.). This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'getBasePath'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPrefPath@.
--                   The unsafe flavor is 'getPrefPath'
--                   .
--
--     [C declaration]: @SDL_GetPrefPath@, defined at @SDL3\/SDL_filesystem.h 164:36@
getPrefPathSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@org@]: the name of your organization.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@app@]: the name of your application.
  -> IO (BG.Ptr BG.CChar)
getPrefPathSafe = Safe.sDL_GetPrefPath

-- | Finds the most suitable user folder for a specific purpose.
--
--     Many OSes provide certain standard folders for certain purposes, such as storing pictures, music or videos for a certain user. This function gives the path for many of those special locations.
--
--     This function is specifically for /user/ folders, which are meant for the user to access and manage. For application-specific folders, meant to hold data for the application to manage, see @'getBasePath'@ and @'getPrefPath'@.
--
--     The returned path is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     If NULL is returned, the error may be obtained with 'SDL3.Sys.Error.getError'.
--
--     [Returns]: either a null-terminated C string containing the full path to the folder, or NULL if an error happened.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetUserFolder@.
--                   The safe flavor is 'getUserFolderSafe'
--                   .
--
--     [C declaration]: @SDL_GetUserFolder@, defined at @SDL3\/SDL_filesystem.h 236:42@
getUserFolder
  :: SDL_Folder
  -- ^
  --
  --           [@folder@]: the type of folder to find.
  -> IO (PtrConst.PtrConst BG.CChar)
getUserFolder = Unsafe.sDL_GetUserFolder

-- | Finds the most suitable user folder for a specific purpose.
--
--     Many OSes provide certain standard folders for certain purposes, such as storing pictures, music or videos for a certain user. This function gives the path for many of those special locations.
--
--     This function is specifically for /user/ folders, which are meant for the user to access and manage. For application-specific folders, meant to hold data for the application to manage, see @'getBasePath'@ and @'getPrefPath'@.
--
--     The returned path is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     If NULL is returned, the error may be obtained with 'SDL3.Sys.Error.getError'.
--
--     [Returns]: either a null-terminated C string containing the full path to the folder, or NULL if an error happened.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetUserFolder@.
--                   The unsafe flavor is 'getUserFolder'
--                   .
--
--     [C declaration]: @SDL_GetUserFolder@, defined at @SDL3\/SDL_filesystem.h 236:42@
getUserFolderSafe
  :: SDL_Folder
  -- ^
  --
  --           [@folder@]: the type of folder to find.
  -> IO (PtrConst.PtrConst BG.CChar)
getUserFolderSafe = Safe.sDL_GetUserFolder

-- | Create a directory, and any missing parent directories.
--
--     This reports success if @path@ already exists as a directory.
--
--     If parent directories are missing, it will also create them. Note that if this fails, it will not remove any parent directories it already made.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CreateDirectory@.
--                   The safe flavor is 'createDirectorySafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateDirectory@, defined at @SDL3\/SDL_filesystem.h 304:34@
createDirectory
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to create.
  -> IO Bool
createDirectory =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_CreateDirectory x00)

-- | Create a directory, and any missing parent directories.
--
--     This reports success if @path@ already exists as a directory.
--
--     If parent directories are missing, it will also create them. Note that if this fails, it will not remove any parent directories it already made.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CreateDirectory@.
--                   The unsafe flavor is 'createDirectory'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CreateDirectory@, defined at @SDL3\/SDL_filesystem.h 304:34@
createDirectorySafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to create.
  -> IO Bool
createDirectorySafe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_CreateDirectory x00)

-- | Enumerate a directory through a callback function.
--
--     This function provides every directory entry through an app-provided callback, called once for each directory entry, until all results have been provided or the callback returns either SDL_ENUM_SUCCESS or SDL_ENUM_FAILURE.
--
--     This will return false if there was a system problem in general, or if a callback returns SDL_ENUM_FAILURE. A successful return means a callback returned SDL_ENUM_SUCCESS to halt enumeration, or all directory entries were enumerated.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_EnumerateDirectory@.
--                   The unsafe import is not exported
--                   : invokes the callback per entry synchronously.
--                   If your callback is a non-Haskell function pointer that never
-- re-enters the Haskell runtime, the unsafe import remains available as @SDL3.Sys.Bindgen.Filesystem.Unsafe.sDL_EnumerateDirectory@.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_EnumerateDirectory@, defined at @SDL3\/SDL_filesystem.h 369:34@
enumerateDirectorySafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to enumerate.
  -> SDL_EnumerateDirectoryCallback
  -- ^
  --
  --           [@callback@]: a function that is called for each entry in the directory.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: a pointer that is passed to @callback@.
  -> IO Bool
enumerateDirectorySafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_EnumerateDirectory x00 x11 x22)

-- | Remove a file or an empty directory.
--
--     Directories that are not empty will fail; this function will not recursely delete directory trees.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RemovePath@.
--                   The safe flavor is 'removePathSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RemovePath@, defined at @SDL3\/SDL_filesystem.h 385:34@
removePath
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path to remove from the filesystem.
  -> IO Bool
removePath =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_RemovePath x00)

-- | Remove a file or an empty directory.
--
--     Directories that are not empty will fail; this function will not recursely delete directory trees.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RemovePath@.
--                   The unsafe flavor is 'removePath'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RemovePath@, defined at @SDL3\/SDL_filesystem.h 385:34@
removePathSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path to remove from the filesystem.
  -> IO Bool
removePathSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_RemovePath x00)

-- | Rename a file or directory.
--
--     If the file at @newpath@ already exists, it will be replaced.
--
--     Note that this will not copy files across filesystems\/drives\/volumes, as that is a much more complicated (and possibly time-consuming) operation.
--
--     Which is to say, if this function fails, @'copyFile'@ to a temporary file in the same directory as @newpath@, then @'renamePath'@ from the temporary file to @newpath@ and @'removePath'@ on @oldpath@ might work for files. Renaming a non-empty directory across filesystems is dramatically more complex, however.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_RenamePath@.
--                   The safe flavor is 'renamePathSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenamePath@, defined at @SDL3\/SDL_filesystem.h 410:34@
renamePath
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@oldpath@]: the old path.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@newpath@]: the new path.
  -> IO Bool
renamePath =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_RenamePath x00 x11)

-- | Rename a file or directory.
--
--     If the file at @newpath@ already exists, it will be replaced.
--
--     Note that this will not copy files across filesystems\/drives\/volumes, as that is a much more complicated (and possibly time-consuming) operation.
--
--     Which is to say, if this function fails, @'copyFile'@ to a temporary file in the same directory as @newpath@, then @'renamePath'@ from the temporary file to @newpath@ and @'removePath'@ on @oldpath@ might work for files. Renaming a non-empty directory across filesystems is dramatically more complex, however.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_RenamePath@.
--                   The unsafe flavor is 'renamePath'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_RenamePath@, defined at @SDL3\/SDL_filesystem.h 410:34@
renamePathSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@oldpath@]: the old path.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@newpath@]: the new path.
  -> IO Bool
renamePathSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_RenamePath x00 x11)

-- | Copy a file.
--
--     If the file at @newpath@ already exists, it will be overwritten with the contents of the file at @oldpath@.
--
--     This function will block until the copy is complete, which might be a significant time for large files on slow disks. On some platforms, the copy can be handed off to the OS itself, but on others SDL might just open both paths, and read from one and write to the other.
--
--     Note that this is not an atomic operation! If something tries to read from @newpath@ while the copy is in progress, it will see an incomplete copy of the data, and if the calling thread terminates (or the power goes out) during the copy, @newpath@ \'s previous contents will be gone, replaced with an incomplete copy of the data. To avoid this risk, it is recommended that the app copy to a temporary file in the same directory as @newpath@, and if the copy is successful, use @'renamePath'@ to replace @newpath@ with the temporary file. This will ensure that reads of @newpath@ will either see a complete copy of the data, or it will see the pre-copy state of @newpath@.
--
--     This function attempts to synchronize the newly-copied data to disk before returning, if the platform allows it, so that the renaming trick will not have a problem in a system crash or power failure, where the file could be renamed but the contents never made it from the system file cache to the physical disk.
--
--     If the copy fails for any reason, the state of @newpath@ is undefined. It might be half a copy, it might be the untouched data of what was already there, or it might be a zero-byte file, etc.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but this operation is not atomic, so the app might need to protect access to specific paths from other threads if appropriate.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CopyFile@.
--                   The safe flavor is 'copyFileSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyFile@, defined at @SDL3\/SDL_filesystem.h 454:34@
copyFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@oldpath@]: the old path.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@newpath@]: the new path.
  -> IO Bool
copyFile =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_CopyFile x00 x11)

-- | Copy a file.
--
--     If the file at @newpath@ already exists, it will be overwritten with the contents of the file at @oldpath@.
--
--     This function will block until the copy is complete, which might be a significant time for large files on slow disks. On some platforms, the copy can be handed off to the OS itself, but on others SDL might just open both paths, and read from one and write to the other.
--
--     Note that this is not an atomic operation! If something tries to read from @newpath@ while the copy is in progress, it will see an incomplete copy of the data, and if the calling thread terminates (or the power goes out) during the copy, @newpath@ \'s previous contents will be gone, replaced with an incomplete copy of the data. To avoid this risk, it is recommended that the app copy to a temporary file in the same directory as @newpath@, and if the copy is successful, use @'renamePath'@ to replace @newpath@ with the temporary file. This will ensure that reads of @newpath@ will either see a complete copy of the data, or it will see the pre-copy state of @newpath@.
--
--     This function attempts to synchronize the newly-copied data to disk before returning, if the platform allows it, so that the renaming trick will not have a problem in a system crash or power failure, where the file could be renamed but the contents never made it from the system file cache to the physical disk.
--
--     If the copy fails for any reason, the state of @newpath@ is undefined. It might be half a copy, it might be the untouched data of what was already there, or it might be a zero-byte file, etc.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but this operation is not atomic, so the app might need to protect access to specific paths from other threads if appropriate.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CopyFile@.
--                   The unsafe flavor is 'copyFile'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CopyFile@, defined at @SDL3\/SDL_filesystem.h 454:34@
copyFileSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@oldpath@]: the old path.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@newpath@]: the new path.
  -> IO Bool
copyFileSafe =
  \x00 ->
    \x11 -> fmap CBool.toBool (Safe.sDL_CopyFile x00 x11)

-- | Get information about a filesystem path.
--
--     Symlinks, on filesystems that support them, are always followed, so you will always get information on what the symlink eventually points to, and not the symlink itself.
--
--     [Returns]: true on success or false if the file doesn\'t exist, or another failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPathInfo@.
--                   The safe flavor is 'getPathInfoSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetPathInfo@, defined at @SDL3\/SDL_filesystem.h 473:34@
getPathInfo
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path to query.
  -> BG.Ptr SDL_PathInfo
  -- ^
  --
  --           [@info@]: a pointer filled in with information about the path, or NULL to check for the existence of a file.
  -> IO Bool
getPathInfo =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_GetPathInfo x00 x11)

-- | Get information about a filesystem path.
--
--     Symlinks, on filesystems that support them, are always followed, so you will always get information on what the symlink eventually points to, and not the symlink itself.
--
--     [Returns]: true on success or false if the file doesn\'t exist, or another failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPathInfo@.
--                   The unsafe flavor is 'getPathInfo'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetPathInfo@, defined at @SDL3\/SDL_filesystem.h 473:34@
getPathInfoSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path to query.
  -> BG.Ptr SDL_PathInfo
  -- ^
  --
  --           [@info@]: a pointer filled in with information about the path, or NULL to check for the existence of a file.
  -> IO Bool
getPathInfoSafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_GetPathInfo x00 x11)

-- | Enumerate a directory tree, filtered by pattern, and return a list.
--
--     Files are filtered out if they don\'t match the string in @pattern@, which may contain wildcard characters @*@ (match everything) and @?@ (match one character). If pattern is NULL, no filtering is done and all results are returned. Subdirectories are permitted, and are specified with a path separator of @\/@. Wildcard characters @*@ and @?@ never match a path separator.
--
--     @flags@ may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching case-insensitive.
--
--     The returned array is always NULL-terminated, for your iterating convenience, but if @count@ is non-NULL, on return it will contain the number of items in the array, not counting the NULL terminator.
--
--     [Returns]: an array of strings on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GlobDirectory@.
--                   The safe flavor is 'globDirectorySafe'
--                   : blocks on directory traversal.
--
--     [C declaration]: @SDL_GlobDirectory@, defined at @SDL3\/SDL_filesystem.h 506:37@
globDirectory
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to enumerate.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@pattern@]: the pattern that files in the directory must match. Can be NULL.
  -> SDL_GlobFlags
  -- ^
  --
  --           [@flags@]: @SDL_GLOB_*@ bitflags that affect this search.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: on return, will be set to the number of items in the returned array. Can be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
globDirectory = Unsafe.sDL_GlobDirectory

-- | Enumerate a directory tree, filtered by pattern, and return a list.
--
--     Files are filtered out if they don\'t match the string in @pattern@, which may contain wildcard characters @*@ (match everything) and @?@ (match one character). If pattern is NULL, no filtering is done and all results are returned. Subdirectories are permitted, and are specified with a path separator of @\/@. Wildcard characters @*@ and @?@ never match a path separator.
--
--     @flags@ may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching case-insensitive.
--
--     The returned array is always NULL-terminated, for your iterating convenience, but if @count@ is non-NULL, on return it will contain the number of items in the array, not counting the NULL terminator.
--
--     [Returns]: an array of strings on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GlobDirectory@.
--                   The unsafe flavor is 'globDirectory'
--                   : blocks on directory traversal.
--
--     [C declaration]: @SDL_GlobDirectory@, defined at @SDL3\/SDL_filesystem.h 506:37@
globDirectorySafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to enumerate.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@pattern@]: the pattern that files in the directory must match. Can be NULL.
  -> SDL_GlobFlags
  -- ^
  --
  --           [@flags@]: @SDL_GLOB_*@ bitflags that affect this search.
  -> BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: on return, will be set to the number of items in the returned array. Can be NULL.
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
globDirectorySafe = Safe.sDL_GlobDirectory

-- | Get what the system believes is the \"current working directory.\"
--
--     For systems without a concept of a current working directory, this will still attempt to provide something reasonable.
--
--     SDL does not provide a means to /change/ the current working directory; for platforms without this concept, this would cause surprises with file access outside of SDL.
--
--     The returned path is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     [Returns]: a UTF-8 string of the current working directory in platform-dependent notation. NULL if there\'s a problem. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetCurrentDirectory@.
--                   The safe flavor is 'getCurrentDirectorySafe'
--                   .
--
--     [C declaration]: @SDL_GetCurrentDirectory@, defined at @SDL3\/SDL_filesystem.h 529:36@
getCurrentDirectory :: IO (BG.Ptr BG.CChar)
getCurrentDirectory = Unsafe.sDL_GetCurrentDirectory

-- | Get what the system believes is the \"current working directory.\"
--
--     For systems without a concept of a current working directory, this will still attempt to provide something reasonable.
--
--     SDL does not provide a means to /change/ the current working directory; for platforms without this concept, this would cause surprises with file access outside of SDL.
--
--     The returned path is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     [Returns]: a UTF-8 string of the current working directory in platform-dependent notation. NULL if there\'s a problem. This should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetCurrentDirectory@.
--                   The unsafe flavor is 'getCurrentDirectory'
--                   .
--
--     [C declaration]: @SDL_GetCurrentDirectory@, defined at @SDL3\/SDL_filesystem.h 529:36@
getCurrentDirectorySafe :: IO (BG.Ptr BG.CChar)
getCurrentDirectorySafe =
  Safe.sDL_GetCurrentDirectory

-- | Typed constant for macro @SDL_GLOB_CASEINSENSITIVE@. Combine with @.|.@ from "Data.Bits".
pattern SDL_GLOB_CASEINSENSITIVE :: SDL_GlobFlags
pattern SDL_GLOB_CASEINSENSITIVE = SDL_GlobFlags 0x00000001
