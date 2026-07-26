{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Filesystem.FunPtr (
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_GetBasePath,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_GetPrefPath,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_GetUserFolder,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_CreateDirectory,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_EnumerateDirectory,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_RemovePath,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_RenamePath,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_CopyFile,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_GetPathInfo,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_GlobDirectory,
  SDL3.Sys.Bindgen.Filesystem.FunPtr.sDL_GetCurrentDirectory,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Filesystem

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_filesystem.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetBasePath */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_2ed5dba72836bf2d (void)) (void)"
         , "{"
         , "  return &SDL_GetBasePath;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetPrefPath */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_693f7d2fd575601d (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetPrefPath;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetUserFolder */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_53fe991909d2361a (void)) ("
         , "  SDL_Folder arg1"
         , ")"
         , "{"
         , "  return &SDL_GetUserFolder;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_CreateDirectory */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2a04cc89206a07e4 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_CreateDirectory;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_EnumerateDirectory */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f96b84c7478907dc (void)) ("
         , "  char const *arg1,"
         , "  SDL_EnumerateDirectoryCallback arg2,"
         , "  void *arg3"
         , ")"
         , "{"
         , "  return &SDL_EnumerateDirectory;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_RemovePath */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4ae39f185b082764 (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_RemovePath;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_RenamePath */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_adef5cb596ea35b1 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_RenamePath;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_CopyFile */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_0ba2df1188540129 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CopyFile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetPathInfo */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e161df4dd9e79e80 (void)) ("
         , "  char const *arg1,"
         , "  SDL_PathInfo *arg2"
         , ")"
         , "{"
         , "  return &SDL_GetPathInfo;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GlobDirectory */"
         , "__attribute__ ((const))"
         , "char **(*hs_bindgen_ddd930892e7124f6 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  SDL_GlobFlags arg3,"
         , "  signed int *arg4"
         , ")"
         , "{"
         , "  return &SDL_GlobDirectory;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetCurrentDirectory */"
         , "__attribute__ ((const))"
         , "char *(*hs_bindgen_8a07612d881643ee (void)) (void)"
         , "{"
         , "  return &SDL_GetCurrentDirectory;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetBasePath@
foreign import ccall unsafe "hs_bindgen_2ed5dba72836bf2d"
  hs_bindgen_2ed5dba72836bf2d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetBasePath@
hs_bindgen_2ed5dba72836bf2d :: IO (BG.FunPtr (IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_2ed5dba72836bf2d =
  BG.fromFFIType hs_bindgen_2ed5dba72836bf2d_base

{-# NOINLINE sDL_GetBasePath #-}

-- | [C declaration]: @SDL_GetBasePath@, defined at @SDL3\/SDL_filesystem.h 101:42@
sDL_GetBasePath :: BG.FunPtr (IO (PtrConst.PtrConst BG.CChar))
sDL_GetBasePath =
  BG.unsafePerformIO hs_bindgen_2ed5dba72836bf2d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetPrefPath@
foreign import ccall unsafe "hs_bindgen_693f7d2fd575601d"
  hs_bindgen_693f7d2fd575601d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetPrefPath@
hs_bindgen_693f7d2fd575601d
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar)))
hs_bindgen_693f7d2fd575601d =
  BG.fromFFIType hs_bindgen_693f7d2fd575601d_base

{-# NOINLINE sDL_GetPrefPath #-}

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
--     You should assume the path returned by this function is the only safe place to write files (and that @SDL_GetBasePath()@, while it might be writable, or even the parent of the returned path, isn\'t where you should be writing things).
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
--     [@org@]: the name of your organization.
--
--     [@app@]: the name of your application.
--
--     [Returns]: a UTF-8 string of the user directory in platform-dependent notation. NULL if there\'s a problem (creating directory failed, etc.). This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetBasePath'
--
--     [C declaration]: @SDL_GetPrefPath@, defined at @SDL3\/SDL_filesystem.h 164:36@
sDL_GetPrefPath
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr BG.CChar))
sDL_GetPrefPath =
  BG.unsafePerformIO hs_bindgen_693f7d2fd575601d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetUserFolder@
foreign import ccall unsafe "hs_bindgen_53fe991909d2361a"
  hs_bindgen_53fe991909d2361a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetUserFolder@
hs_bindgen_53fe991909d2361a :: IO (BG.FunPtr (SDL_Folder -> IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_53fe991909d2361a =
  BG.fromFFIType hs_bindgen_53fe991909d2361a_base

{-# NOINLINE sDL_GetUserFolder #-}

-- | Finds the most suitable user folder for a specific purpose.
--
--     Many OSes provide certain standard folders for certain purposes, such as storing pictures, music or videos for a certain user. This function gives the path for many of those special locations.
--
--     This function is specifically for /user/ folders, which are meant for the user to access and manage. For application-specific folders, meant to hold data for the application to manage, see @SDL_GetBasePath()@ and @SDL_GetPrefPath()@.
--
--     The returned path is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     If NULL is returned, the error may be obtained with SDL_GetError().
--
--     [@folder@]: the type of folder to find.
--
--     [Returns]: either a null-terminated C string containing the full path to the folder, or NULL if an error happened.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetUserFolder@, defined at @SDL3\/SDL_filesystem.h 236:42@
sDL_GetUserFolder :: BG.FunPtr (SDL_Folder -> IO (PtrConst.PtrConst BG.CChar))
sDL_GetUserFolder =
  BG.unsafePerformIO hs_bindgen_53fe991909d2361a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_CreateDirectory@
foreign import ccall unsafe "hs_bindgen_2a04cc89206a07e4"
  hs_bindgen_2a04cc89206a07e4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_CreateDirectory@
hs_bindgen_2a04cc89206a07e4 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_2a04cc89206a07e4 =
  BG.fromFFIType hs_bindgen_2a04cc89206a07e4_base

{-# NOINLINE sDL_CreateDirectory #-}

-- | Create a directory, and any missing parent directories.
--
--     This reports success if @path@ already exists as a directory.
--
--     If parent directories are missing, it will also create them. Note that if this fails, it will not remove any parent directories it already made.
--
--     [@path@]: the path of the directory to create.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CreateDirectory@, defined at @SDL3\/SDL_filesystem.h 304:34@
sDL_CreateDirectory :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_CreateDirectory =
  BG.unsafePerformIO hs_bindgen_2a04cc89206a07e4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_EnumerateDirectory@
foreign import ccall unsafe "hs_bindgen_f96b84c7478907dc"
  hs_bindgen_f96b84c7478907dc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_EnumerateDirectory@
hs_bindgen_f96b84c7478907dc
  :: IO
       ( BG.FunPtr
           (PtrConst.PtrConst BG.CChar -> SDL_EnumerateDirectoryCallback -> BG.Ptr BG.Void -> IO BG.CBool)
       )
hs_bindgen_f96b84c7478907dc =
  BG.fromFFIType hs_bindgen_f96b84c7478907dc_base

{-# NOINLINE sDL_EnumerateDirectory #-}

-- | Enumerate a directory through a callback function.
--
--     This function provides every directory entry through an app-provided callback, called once for each directory entry, until all results have been provided or the callback returns either SDL_ENUM_SUCCESS or SDL_ENUM_FAILURE.
--
--     This will return false if there was a system problem in general, or if a callback returns SDL_ENUM_FAILURE. A successful return means a callback returned SDL_ENUM_SUCCESS to halt enumeration, or all directory entries were enumerated.
--
--     [@path@]: the path of the directory to enumerate.
--
--     [@callback@]: a function that is called for each entry in the directory.
--
--     [@userdata@]: a pointer that is passed to @callback@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_EnumerateDirectory@, defined at @SDL3\/SDL_filesystem.h 369:34@
sDL_EnumerateDirectory
  :: BG.FunPtr
       (PtrConst.PtrConst BG.CChar -> SDL_EnumerateDirectoryCallback -> BG.Ptr BG.Void -> IO BG.CBool)
sDL_EnumerateDirectory =
  BG.unsafePerformIO hs_bindgen_f96b84c7478907dc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_RemovePath@
foreign import ccall unsafe "hs_bindgen_4ae39f185b082764"
  hs_bindgen_4ae39f185b082764_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_RemovePath@
hs_bindgen_4ae39f185b082764 :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_4ae39f185b082764 =
  BG.fromFFIType hs_bindgen_4ae39f185b082764_base

{-# NOINLINE sDL_RemovePath #-}

-- | Remove a file or an empty directory.
--
--     Directories that are not empty will fail; this function will not recursely delete directory trees.
--
--     [@path@]: the path to remove from the filesystem.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RemovePath@, defined at @SDL3\/SDL_filesystem.h 385:34@
sDL_RemovePath :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_RemovePath =
  BG.unsafePerformIO hs_bindgen_4ae39f185b082764

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_RenamePath@
foreign import ccall unsafe "hs_bindgen_adef5cb596ea35b1"
  hs_bindgen_adef5cb596ea35b1_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_RenamePath@
hs_bindgen_adef5cb596ea35b1
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_adef5cb596ea35b1 =
  BG.fromFFIType hs_bindgen_adef5cb596ea35b1_base

{-# NOINLINE sDL_RenamePath #-}

-- | Rename a file or directory.
--
--     If the file at @newpath@ already exists, it will be replaced.
--
--     Note that this will not copy files across filesystems\/drives\/volumes, as that is a much more complicated (and possibly time-consuming) operation.
--
--     Which is to say, if this function fails, @SDL_CopyFile()@ to a temporary file in the same directory as @newpath@, then @SDL_RenamePath()@ from the temporary file to @newpath@ and @SDL_RemovePath()@ on @oldpath@ might work for files. Renaming a non-empty directory across filesystems is dramatically more complex, however.
--
--     [@oldpath@]: the old path.
--
--     [@newpath@]: the new path.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_RenamePath@, defined at @SDL3\/SDL_filesystem.h 410:34@
sDL_RenamePath
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_RenamePath =
  BG.unsafePerformIO hs_bindgen_adef5cb596ea35b1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_CopyFile@
foreign import ccall unsafe "hs_bindgen_0ba2df1188540129"
  hs_bindgen_0ba2df1188540129_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_CopyFile@
hs_bindgen_0ba2df1188540129
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_0ba2df1188540129 =
  BG.fromFFIType hs_bindgen_0ba2df1188540129_base

{-# NOINLINE sDL_CopyFile #-}

-- | Copy a file.
--
--     If the file at @newpath@ already exists, it will be overwritten with the contents of the file at @oldpath@.
--
--     This function will block until the copy is complete, which might be a significant time for large files on slow disks. On some platforms, the copy can be handed off to the OS itself, but on others SDL might just open both paths, and read from one and write to the other.
--
--     Note that this is not an atomic operation! If something tries to read from @newpath@ while the copy is in progress, it will see an incomplete copy of the data, and if the calling thread terminates (or the power goes out) during the copy, @newpath@ \'s previous contents will be gone, replaced with an incomplete copy of the data. To avoid this risk, it is recommended that the app copy to a temporary file in the same directory as @newpath@, and if the copy is successful, use @SDL_RenamePath()@ to replace @newpath@ with the temporary file. This will ensure that reads of @newpath@ will either see a complete copy of the data, or it will see the pre-copy state of @newpath@.
--
--     This function attempts to synchronize the newly-copied data to disk before returning, if the platform allows it, so that the renaming trick will not have a problem in a system crash or power failure, where the file could be renamed but the contents never made it from the system file cache to the physical disk.
--
--     If the copy fails for any reason, the state of @newpath@ is undefined. It might be half a copy, it might be the untouched data of what was already there, or it might be a zero-byte file, etc.
--
--     [@oldpath@]: the old path.
--
--     [@newpath@]: the new path.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread, but this operation is not atomic, so the app might need to protect access to specific paths from other threads if appropriate.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_CopyFile@, defined at @SDL3\/SDL_filesystem.h 454:34@
sDL_CopyFile :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_CopyFile =
  BG.unsafePerformIO hs_bindgen_0ba2df1188540129

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetPathInfo@
foreign import ccall unsafe "hs_bindgen_e161df4dd9e79e80"
  hs_bindgen_e161df4dd9e79e80_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetPathInfo@
hs_bindgen_e161df4dd9e79e80
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr SDL_PathInfo -> IO BG.CBool))
hs_bindgen_e161df4dd9e79e80 =
  BG.fromFFIType hs_bindgen_e161df4dd9e79e80_base

{-# NOINLINE sDL_GetPathInfo #-}

-- | Get information about a filesystem path.
--
--     Symlinks, on filesystems that support them, are always followed, so you will always get information on what the symlink eventually points to, and not the symlink itself.
--
--     [@path@]: the path to query.
--
--     [@info@]: a pointer filled in with information about the path, or NULL to check for the existence of a file.
--
--     [Returns]: true on success or false if the file doesn\'t exist, or another failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetPathInfo@, defined at @SDL3\/SDL_filesystem.h 473:34@
sDL_GetPathInfo :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr SDL_PathInfo -> IO BG.CBool)
sDL_GetPathInfo =
  BG.unsafePerformIO hs_bindgen_e161df4dd9e79e80

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GlobDirectory@
foreign import ccall unsafe "hs_bindgen_ddd930892e7124f6"
  hs_bindgen_ddd930892e7124f6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GlobDirectory@
hs_bindgen_ddd930892e7124f6
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> SDL_GlobFlags
             -> BG.Ptr BG.CInt
             -> IO (BG.Ptr (BG.Ptr BG.CChar))
           )
       )
hs_bindgen_ddd930892e7124f6 =
  BG.fromFFIType hs_bindgen_ddd930892e7124f6_base

{-# NOINLINE sDL_GlobDirectory #-}

-- | Enumerate a directory tree, filtered by pattern, and return a list.
--
--     Files are filtered out if they don\'t match the string in @pattern@, which may contain wildcard characters @*@ (match everything) and @?@ (match one character). If pattern is NULL, no filtering is done and all results are returned. Subdirectories are permitted, and are specified with a path separator of @\/@. Wildcard characters @*@ and @?@ never match a path separator.
--
--     @flags@ may be set to SDL_GLOB_CASEINSENSITIVE to make the pattern matching case-insensitive.
--
--     The returned array is always NULL-terminated, for your iterating convenience, but if @count@ is non-NULL, on return it will contain the number of items in the array, not counting the NULL terminator.
--
--     [@path@]: the path of the directory to enumerate.
--
--     [@pattern@]: the pattern that files in the directory must match. Can be NULL.
--
--     [@flags@]: @SDL_GLOB_*@ bitflags that affect this search.
--
--     [@count@]: on return, will be set to the number of items in the returned array. Can be NULL.
--
--     [Returns]: an array of strings on success or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GlobDirectory@, defined at @SDL3\/SDL_filesystem.h 506:37@
sDL_GlobDirectory
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> SDL_GlobFlags
         -> BG.Ptr BG.CInt
         -> IO (BG.Ptr (BG.Ptr BG.CChar))
       )
sDL_GlobDirectory =
  BG.unsafePerformIO hs_bindgen_ddd930892e7124f6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetCurrentDirectory@
foreign import ccall unsafe "hs_bindgen_8a07612d881643ee"
  hs_bindgen_8a07612d881643ee_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Filesystem_get_SDL_GetCurrentDirectory@
hs_bindgen_8a07612d881643ee :: IO (BG.FunPtr (IO (BG.Ptr BG.CChar)))
hs_bindgen_8a07612d881643ee =
  BG.fromFFIType hs_bindgen_8a07612d881643ee_base

{-# NOINLINE sDL_GetCurrentDirectory #-}

-- | Get what the system believes is the \"current working directory.\"
--
--     For systems without a concept of a current working directory, this will still attempt to provide something reasonable.
--
--     SDL does not provide a means to /change/ the current working directory; for platforms without this concept, this would cause surprises with file access outside of SDL.
--
--     The returned path is guaranteed to end with a path separator (\'\\\' on Windows, \'\/\' on most other platforms).
--
--     [Returns]: a UTF-8 string of the current working directory in platform-dependent notation. NULL if there\'s a problem. This should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetCurrentDirectory@, defined at @SDL3\/SDL_filesystem.h 529:36@
sDL_GetCurrentDirectory :: BG.FunPtr (IO (BG.Ptr BG.CChar))
sDL_GetCurrentDirectory =
  BG.unsafePerformIO hs_bindgen_8a07612d881643ee
