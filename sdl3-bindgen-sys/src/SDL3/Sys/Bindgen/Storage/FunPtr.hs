{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Storage.FunPtr (
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_OpenTitleStorage,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_OpenUserStorage,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_OpenFileStorage,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_OpenStorage,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_CloseStorage,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_StorageReady,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_GetStorageFileSize,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_ReadStorageFile,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_WriteStorageFile,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_CreateStorageDirectory,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_EnumerateStorageDirectory,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_RemoveStoragePath,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_RenameStoragePath,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_CopyStorageFile,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_GetStoragePathInfo,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_GetStorageSpaceRemaining,
  SDL3.Sys.Bindgen.Storage.FunPtr.sDL_GlobStorageDirectory,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Filesystem qualified
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified
import SDL3.Sys.Bindgen.Storage

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_storage.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenTitleStorage */"
         , "__attribute__ ((const))"
         , "SDL_Storage *(*hs_bindgen_41dc0d42da3c13fb (void)) ("
         , "  char const *arg1,"
         , "  SDL_PropertiesID arg2"
         , ")"
         , "{"
         , "  return &SDL_OpenTitleStorage;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenUserStorage */"
         , "__attribute__ ((const))"
         , "SDL_Storage *(*hs_bindgen_12c55994171bb882 (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  SDL_PropertiesID arg3"
         , ")"
         , "{"
         , "  return &SDL_OpenUserStorage;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenFileStorage */"
         , "__attribute__ ((const))"
         , "SDL_Storage *(*hs_bindgen_fef879e18b533feb (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_OpenFileStorage;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenStorage */"
         , "__attribute__ ((const))"
         , "SDL_Storage *(*hs_bindgen_21801b8b233def48 (void)) ("
         , "  SDL_StorageInterface const *arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_OpenStorage;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_CloseStorage */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_df81ee6f0c32e051 (void)) ("
         , "  SDL_Storage *arg1"
         , ")"
         , "{"
         , "  return &SDL_CloseStorage;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_StorageReady */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_026acf35472ecd32 (void)) ("
         , "  SDL_Storage *arg1"
         , ")"
         , "{"
         , "  return &SDL_StorageReady;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GetStorageFileSize */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_24ba0ea421ce2ba3 (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  Uint64 *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetStorageFileSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_ReadStorageFile */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1b79f3ffe3c4acb4 (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  void *arg3,"
         , "  Uint64 arg4"
         , ")"
         , "{"
         , "  return &SDL_ReadStorageFile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_WriteStorageFile */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_cf1d254ac8e06322 (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  void const *arg3,"
         , "  Uint64 arg4"
         , ")"
         , "{"
         , "  return &SDL_WriteStorageFile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_CreateStorageDirectory */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1ccf47e38725aac9 (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_CreateStorageDirectory;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_EnumerateStorageDirectory */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c662a58224242e1a (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  SDL_EnumerateDirectoryCallback arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return &SDL_EnumerateStorageDirectory;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_RemoveStoragePath */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6e74dd5d268a0290 (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_RemoveStoragePath;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_RenameStoragePath */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d9c1fb4dbd31bb7f (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &SDL_RenameStoragePath;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_CopyStorageFile */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_af4030dd32ec02ae (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return &SDL_CopyStorageFile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GetStoragePathInfo */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_5eb9dbc0d85e32f2 (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  SDL_PathInfo *arg3"
         , ")"
         , "{"
         , "  return &SDL_GetStoragePathInfo;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GetStorageSpaceRemaining */"
         , "__attribute__ ((const))"
         , "Uint64 (*hs_bindgen_848d4258c8d4d64e (void)) ("
         , "  SDL_Storage *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetStorageSpaceRemaining;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GlobStorageDirectory */"
         , "__attribute__ ((const))"
         , "char **(*hs_bindgen_d50b8834aa3490cc (void)) ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  SDL_GlobFlags arg4,"
         , "  signed int *arg5"
         , ")"
         , "{"
         , "  return &SDL_GlobStorageDirectory;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenTitleStorage@
foreign import ccall unsafe "hs_bindgen_41dc0d42da3c13fb"
  hs_bindgen_41dc0d42da3c13fb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenTitleStorage@
hs_bindgen_41dc0d42da3c13fb
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
             -> IO (BG.Ptr SDL_Storage)
           )
       )
hs_bindgen_41dc0d42da3c13fb =
  BG.fromFFIType hs_bindgen_41dc0d42da3c13fb_base

{-# NOINLINE sDL_OpenTitleStorage #-}

-- | Opens up a read-only container for the application\'s filesystem.
--
--     By default, SDL_OpenTitleStorage uses the generic storage implementation. When the path override is not provided, the generic implementation will use the output of SDL_GetBasePath as the base path.
--
--     [@override@]: a path to override the backend\'s default title root.
--
--     [@props@]: a property list that may contain backend-specific information.
--
--     [Returns]: a title storage container on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseStorage', 'sDL_GetStorageFileSize', 'sDL_OpenUserStorage', 'sDL_ReadStorageFile'
--
--     [C declaration]: @SDL_OpenTitleStorage@, defined at @SDL3\/SDL_storage.h 353:43@
sDL_OpenTitleStorage
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
         -> IO (BG.Ptr SDL_Storage)
       )
sDL_OpenTitleStorage =
  BG.unsafePerformIO hs_bindgen_41dc0d42da3c13fb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenUserStorage@
foreign import ccall unsafe "hs_bindgen_12c55994171bb882"
  hs_bindgen_12c55994171bb882_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenUserStorage@
hs_bindgen_12c55994171bb882
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
             -> IO (BG.Ptr SDL_Storage)
           )
       )
hs_bindgen_12c55994171bb882 =
  BG.fromFFIType hs_bindgen_12c55994171bb882_base

{-# NOINLINE sDL_OpenUserStorage #-}

-- | Opens up a container for a user\'s unique read\/write filesystem.
--
--     While title storage can generally be kept open throughout runtime, user storage should only be opened when the client is ready to read\/write files. This allows the backend to properly batch file operations and flush them when the container has been closed; ensuring safe and optimal save I\/O.
--
--     [@org@]: the name of your organization.
--
--     [@app@]: the name of your application.
--
--     [@props@]: a property list that may contain backend-specific information.
--
--     [Returns]: a user storage container on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseStorage', 'sDL_GetStorageFileSize', 'sDL_GetStorageSpaceRemaining', 'sDL_OpenTitleStorage', 'sDL_ReadStorageFile', 'sDL_StorageReady', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_OpenUserStorage@, defined at @SDL3\/SDL_storage.h 379:43@
sDL_OpenUserStorage
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
         -> IO (BG.Ptr SDL_Storage)
       )
sDL_OpenUserStorage =
  BG.unsafePerformIO hs_bindgen_12c55994171bb882

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenFileStorage@
foreign import ccall unsafe "hs_bindgen_fef879e18b533feb"
  hs_bindgen_fef879e18b533feb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenFileStorage@
hs_bindgen_fef879e18b533feb
  :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Storage)))
hs_bindgen_fef879e18b533feb =
  BG.fromFFIType hs_bindgen_fef879e18b533feb_base

{-# NOINLINE sDL_OpenFileStorage #-}

-- | Opens up a container for local filesystem storage.
--
--     This is provided for development and tools. Portable applications should use @SDL_OpenTitleStorage()@ for access to game data and @SDL_OpenUserStorage()@ for access to user data.
--
--     [@path@]: the base path prepended to all storage paths, or NULL for no base path.
--
--     [Returns]: a filesystem storage container on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseStorage', 'sDL_GetStorageFileSize', 'sDL_GetStorageSpaceRemaining', 'sDL_OpenTitleStorage', 'sDL_OpenUserStorage', 'sDL_ReadStorageFile', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_OpenFileStorage@, defined at @SDL3\/SDL_storage.h 403:43@
sDL_OpenFileStorage :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_Storage))
sDL_OpenFileStorage =
  BG.unsafePerformIO hs_bindgen_fef879e18b533feb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenStorage@
foreign import ccall unsafe "hs_bindgen_21801b8b233def48"
  hs_bindgen_21801b8b233def48_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_OpenStorage@
hs_bindgen_21801b8b233def48
  :: IO (BG.FunPtr (PtrConst.PtrConst SDL_StorageInterface -> BG.Ptr BG.Void -> IO (BG.Ptr SDL_Storage)))
hs_bindgen_21801b8b233def48 =
  BG.fromFFIType hs_bindgen_21801b8b233def48_base

{-# NOINLINE sDL_OpenStorage #-}

-- | Opens up a container using a client-provided storage interface.
--
--     Applications do not need to use this function unless they are providing their own 'SDL_Storage' implementation. If you just need an 'SDL_Storage', you should use the built-in implementations in SDL, like @SDL_OpenTitleStorage()@ or @SDL_OpenUserStorage()@.
--
--     This function makes a copy of @iface@ and the caller does not need to keep it around after this call.
--
--     [@iface@]: the interface that implements this storage, initialized using SDL_INIT_INTERFACE().
--
--     [@userdata@]: the pointer that will be passed to the interface functions.
--
--     [Returns]: a storage container on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseStorage', 'sDL_GetStorageFileSize', 'sDL_GetStorageSpaceRemaining', SDL_INIT_INTERFACE, 'sDL_ReadStorageFile', 'sDL_StorageReady', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_OpenStorage@, defined at @SDL3\/SDL_storage.h 432:43@
sDL_OpenStorage
  :: BG.FunPtr (PtrConst.PtrConst SDL_StorageInterface -> BG.Ptr BG.Void -> IO (BG.Ptr SDL_Storage))
sDL_OpenStorage =
  BG.unsafePerformIO hs_bindgen_21801b8b233def48

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_CloseStorage@
foreign import ccall unsafe "hs_bindgen_df81ee6f0c32e051"
  hs_bindgen_df81ee6f0c32e051_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_CloseStorage@
hs_bindgen_df81ee6f0c32e051 :: IO (BG.FunPtr (BG.Ptr SDL_Storage -> IO BG.CBool))
hs_bindgen_df81ee6f0c32e051 =
  BG.fromFFIType hs_bindgen_df81ee6f0c32e051_base

{-# NOINLINE sDL_CloseStorage #-}

-- | Closes and frees a storage container.
--
--     [@storage@]: a storage container to close.
--
--     [Returns]: true if the container was freed with no errors, false otherwise; call SDL_GetError() for more information. Even if the function returns an error, the container data will be freed; the error is only for informational purposes.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenFileStorage', 'sDL_OpenStorage', 'sDL_OpenTitleStorage', 'sDL_OpenUserStorage'
--
--     [C declaration]: @SDL_CloseStorage@, defined at @SDL3\/SDL_storage.h 450:34@
sDL_CloseStorage :: BG.FunPtr (BG.Ptr SDL_Storage -> IO BG.CBool)
sDL_CloseStorage =
  BG.unsafePerformIO hs_bindgen_df81ee6f0c32e051

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_StorageReady@
foreign import ccall unsafe "hs_bindgen_026acf35472ecd32"
  hs_bindgen_026acf35472ecd32_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_StorageReady@
hs_bindgen_026acf35472ecd32 :: IO (BG.FunPtr (BG.Ptr SDL_Storage -> IO BG.CBool))
hs_bindgen_026acf35472ecd32 =
  BG.fromFFIType hs_bindgen_026acf35472ecd32_base

{-# NOINLINE sDL_StorageReady #-}

-- | Checks if the storage container is ready to use.
--
--     This function should be called in regular intervals until it returns true - however, it is not recommended to spinwait on this call, as the backend may depend on a synchronous message loop. You might instead poll this in your game\'s main loop while processing events and drawing a loading screen.
--
--     [@storage@]: a storage container to query.
--
--     [Returns]: true if the container is ready, false otherwise.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_StorageReady@, defined at @SDL3\/SDL_storage.h 465:34@
sDL_StorageReady :: BG.FunPtr (BG.Ptr SDL_Storage -> IO BG.CBool)
sDL_StorageReady =
  BG.unsafePerformIO hs_bindgen_026acf35472ecd32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GetStorageFileSize@
foreign import ccall unsafe "hs_bindgen_24ba0ea421ce2ba3"
  hs_bindgen_24ba0ea421ce2ba3_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GetStorageFileSize@
hs_bindgen_24ba0ea421ce2ba3
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Storage
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
             -> IO BG.CBool
           )
       )
hs_bindgen_24ba0ea421ce2ba3 =
  BG.fromFFIType hs_bindgen_24ba0ea421ce2ba3_base

{-# NOINLINE sDL_GetStorageFileSize #-}

-- | Query the size of a file within a storage container.
--
--     [@storage@]: a storage container to query.
--
--     [@path@]: the relative path of the file to query.
--
--     [@length@]: a pointer to be filled with the file\'s length.
--
--     [Returns]: true if the file could be queried or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ReadStorageFile', 'sDL_StorageReady'
--
--     [C declaration]: @SDL_GetStorageFileSize@, defined at @SDL3\/SDL_storage.h 481:34@
sDL_GetStorageFileSize
  :: BG.FunPtr
       ( BG.Ptr SDL_Storage
         -> PtrConst.PtrConst BG.CChar
         -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
         -> IO BG.CBool
       )
sDL_GetStorageFileSize =
  BG.unsafePerformIO hs_bindgen_24ba0ea421ce2ba3

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_ReadStorageFile@
foreign import ccall unsafe "hs_bindgen_1b79f3ffe3c4acb4"
  hs_bindgen_1b79f3ffe3c4acb4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_ReadStorageFile@
hs_bindgen_1b79f3ffe3c4acb4
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Storage
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint64
             -> IO BG.CBool
           )
       )
hs_bindgen_1b79f3ffe3c4acb4 =
  BG.fromFFIType hs_bindgen_1b79f3ffe3c4acb4_base

{-# NOINLINE sDL_ReadStorageFile #-}

-- | Synchronously read a file from a storage container into a client-provided buffer.
--
--     The value of @length@ must match the length of the file exactly; call @SDL_GetStorageFileSize()@ to get this value. This behavior may be relaxed in a future release.
--
--     [@storage@]: a storage container to read from.
--
--     [@path@]: the relative path of the file to read.
--
--     [@destination@]: a client-provided buffer to read the file into.
--
--     [@length@]: the length of the destination buffer.
--
--     [Returns]: true if the file was read or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetStorageFileSize', 'sDL_StorageReady', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_ReadStorageFile@, defined at @SDL3\/SDL_storage.h 504:34@
sDL_ReadStorageFile
  :: BG.FunPtr
       ( BG.Ptr SDL_Storage
         -> PtrConst.PtrConst BG.CChar
         -> BG.Ptr BG.Void
         -> SDL3.Sys.Bindgen.Stdinc.Uint64
         -> IO BG.CBool
       )
sDL_ReadStorageFile =
  BG.unsafePerformIO hs_bindgen_1b79f3ffe3c4acb4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_WriteStorageFile@
foreign import ccall unsafe "hs_bindgen_cf1d254ac8e06322"
  hs_bindgen_cf1d254ac8e06322_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_WriteStorageFile@
hs_bindgen_cf1d254ac8e06322
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Storage
             -> PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.Void
             -> SDL3.Sys.Bindgen.Stdinc.Uint64
             -> IO BG.CBool
           )
       )
hs_bindgen_cf1d254ac8e06322 =
  BG.fromFFIType hs_bindgen_cf1d254ac8e06322_base

{-# NOINLINE sDL_WriteStorageFile #-}

-- | Synchronously write a file from client memory into a storage container.
--
--     [@storage@]: a storage container to write to.
--
--     [@path@]: the relative path of the file to write.
--
--     [@source@]: a client-provided buffer to write from.
--
--     [@length@]: the length of the source buffer.
--
--     [Returns]: true if the file was written or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetStorageSpaceRemaining', 'sDL_ReadStorageFile', 'sDL_StorageReady'
--
--     [C declaration]: @SDL_WriteStorageFile@, defined at @SDL3\/SDL_storage.h 522:34@
sDL_WriteStorageFile
  :: BG.FunPtr
       ( BG.Ptr SDL_Storage
         -> PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.Void
         -> SDL3.Sys.Bindgen.Stdinc.Uint64
         -> IO BG.CBool
       )
sDL_WriteStorageFile =
  BG.unsafePerformIO hs_bindgen_cf1d254ac8e06322

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_CreateStorageDirectory@
foreign import ccall unsafe "hs_bindgen_1ccf47e38725aac9"
  hs_bindgen_1ccf47e38725aac9_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_CreateStorageDirectory@
hs_bindgen_1ccf47e38725aac9
  :: IO (BG.FunPtr (BG.Ptr SDL_Storage -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_1ccf47e38725aac9 =
  BG.fromFFIType hs_bindgen_1ccf47e38725aac9_base

{-# NOINLINE sDL_CreateStorageDirectory #-}

-- | Create a directory in a writable storage container.
--
--     [@storage@]: a storage container.
--
--     [@path@]: the path of the directory to create.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_CreateStorageDirectory@, defined at @SDL3\/SDL_storage.h 536:34@
sDL_CreateStorageDirectory
  :: BG.FunPtr (BG.Ptr SDL_Storage -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_CreateStorageDirectory =
  BG.unsafePerformIO hs_bindgen_1ccf47e38725aac9

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_EnumerateStorageDirectory@
foreign import ccall unsafe "hs_bindgen_c662a58224242e1a"
  hs_bindgen_c662a58224242e1a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_EnumerateStorageDirectory@
hs_bindgen_c662a58224242e1a
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Storage
             -> PtrConst.PtrConst BG.CChar
             -> SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback
             -> BG.Ptr BG.Void
             -> IO BG.CBool
           )
       )
hs_bindgen_c662a58224242e1a =
  BG.fromFFIType hs_bindgen_c662a58224242e1a_base

{-# NOINLINE sDL_EnumerateStorageDirectory #-}

-- | Enumerate a directory in a storage container through a callback function.
--
--     This function provides every directory entry through an app-provided callback, called once for each directory entry, until all results have been provided or the callback returns either SDL_ENUM_SUCCESS or SDL_ENUM_FAILURE.
--
--     This will return false if there was a system problem in general, or if a callback returns SDL_ENUM_FAILURE. A successful return means a callback returned SDL_ENUM_SUCCESS to halt enumeration, or all directory entries were enumerated.
--
--     If @path@ is NULL, this is treated as a request to enumerate the root of the storage container\'s tree. An empty string also works for this.
--
--     [@storage@]: a storage container.
--
--     [@path@]: the path of the directory to enumerate, or NULL for the root.
--
--     [@callback@]: a function that is called for each entry in the directory.
--
--     [@userdata@]: a pointer that is passed to @callback@.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_EnumerateStorageDirectory@, defined at @SDL3\/SDL_storage.h 565:34@
sDL_EnumerateStorageDirectory
  :: BG.FunPtr
       ( BG.Ptr SDL_Storage
         -> PtrConst.PtrConst BG.CChar
         -> SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback
         -> BG.Ptr BG.Void
         -> IO BG.CBool
       )
sDL_EnumerateStorageDirectory =
  BG.unsafePerformIO hs_bindgen_c662a58224242e1a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_RemoveStoragePath@
foreign import ccall unsafe "hs_bindgen_6e74dd5d268a0290"
  hs_bindgen_6e74dd5d268a0290_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_RemoveStoragePath@
hs_bindgen_6e74dd5d268a0290
  :: IO (BG.FunPtr (BG.Ptr SDL_Storage -> PtrConst.PtrConst BG.CChar -> IO BG.CBool))
hs_bindgen_6e74dd5d268a0290 =
  BG.fromFFIType hs_bindgen_6e74dd5d268a0290_base

{-# NOINLINE sDL_RemoveStoragePath #-}

-- | Remove a file or an empty directory in a writable storage container.
--
--     [@storage@]: a storage container.
--
--     [@path@]: the path of the directory to enumerate.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_RemoveStoragePath@, defined at @SDL3\/SDL_storage.h 579:34@
sDL_RemoveStoragePath :: BG.FunPtr (BG.Ptr SDL_Storage -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_RemoveStoragePath =
  BG.unsafePerformIO hs_bindgen_6e74dd5d268a0290

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_RenameStoragePath@
foreign import ccall unsafe "hs_bindgen_d9c1fb4dbd31bb7f"
  hs_bindgen_d9c1fb4dbd31bb7f_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_RenameStoragePath@
hs_bindgen_d9c1fb4dbd31bb7f
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Storage -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
       )
hs_bindgen_d9c1fb4dbd31bb7f =
  BG.fromFFIType hs_bindgen_d9c1fb4dbd31bb7f_base

{-# NOINLINE sDL_RenameStoragePath #-}

-- | Rename a file or directory in a writable storage container.
--
--     [@storage@]: a storage container.
--
--     [@oldpath@]: the old path.
--
--     [@newpath@]: the new path.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_RenameStoragePath@, defined at @SDL3\/SDL_storage.h 594:34@
sDL_RenameStoragePath
  :: BG.FunPtr
       (BG.Ptr SDL_Storage -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_RenameStoragePath =
  BG.unsafePerformIO hs_bindgen_d9c1fb4dbd31bb7f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_CopyStorageFile@
foreign import ccall unsafe "hs_bindgen_af4030dd32ec02ae"
  hs_bindgen_af4030dd32ec02ae_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_CopyStorageFile@
hs_bindgen_af4030dd32ec02ae
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_Storage -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
       )
hs_bindgen_af4030dd32ec02ae =
  BG.fromFFIType hs_bindgen_af4030dd32ec02ae_base

{-# NOINLINE sDL_CopyStorageFile #-}

-- | Copy a file in a writable storage container.
--
--     [@storage@]: a storage container.
--
--     [@oldpath@]: the old path.
--
--     [@newpath@]: the new path.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_CopyStorageFile@, defined at @SDL3\/SDL_storage.h 609:34@
sDL_CopyStorageFile
  :: BG.FunPtr
       (BG.Ptr SDL_Storage -> PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO BG.CBool)
sDL_CopyStorageFile =
  BG.unsafePerformIO hs_bindgen_af4030dd32ec02ae

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GetStoragePathInfo@
foreign import ccall unsafe "hs_bindgen_5eb9dbc0d85e32f2"
  hs_bindgen_5eb9dbc0d85e32f2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GetStoragePathInfo@
hs_bindgen_5eb9dbc0d85e32f2
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Storage
             -> PtrConst.PtrConst BG.CChar
             -> BG.Ptr SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo
             -> IO BG.CBool
           )
       )
hs_bindgen_5eb9dbc0d85e32f2 =
  BG.fromFFIType hs_bindgen_5eb9dbc0d85e32f2_base

{-# NOINLINE sDL_GetStoragePathInfo #-}

-- | Get information about a filesystem path in a storage container.
--
--     [@storage@]: a storage container.
--
--     [@path@]: the path to query.
--
--     [@info@]: a pointer filled in with information about the path, or NULL to check for the existence of a file.
--
--     [Returns]: true on success or false if the file doesn\'t exist, or another failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_GetStoragePathInfo@, defined at @SDL3\/SDL_storage.h 625:34@
sDL_GetStoragePathInfo
  :: BG.FunPtr
       ( BG.Ptr SDL_Storage
         -> PtrConst.PtrConst BG.CChar
         -> BG.Ptr SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo
         -> IO BG.CBool
       )
sDL_GetStoragePathInfo =
  BG.unsafePerformIO hs_bindgen_5eb9dbc0d85e32f2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GetStorageSpaceRemaining@
foreign import ccall unsafe "hs_bindgen_848d4258c8d4d64e"
  hs_bindgen_848d4258c8d4d64e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GetStorageSpaceRemaining@
hs_bindgen_848d4258c8d4d64e
  :: IO (BG.FunPtr (BG.Ptr SDL_Storage -> IO SDL3.Sys.Bindgen.Stdinc.Uint64))
hs_bindgen_848d4258c8d4d64e =
  BG.fromFFIType hs_bindgen_848d4258c8d4d64e_base

{-# NOINLINE sDL_GetStorageSpaceRemaining #-}

-- | Queries the remaining space in a storage container.
--
--     [@storage@]: a storage container to query.
--
--     [Returns]: the amount of remaining space, in bytes.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_GetStorageSpaceRemaining@, defined at @SDL3\/SDL_storage.h 638:36@
sDL_GetStorageSpaceRemaining :: BG.FunPtr (BG.Ptr SDL_Storage -> IO SDL3.Sys.Bindgen.Stdinc.Uint64)
sDL_GetStorageSpaceRemaining =
  BG.unsafePerformIO hs_bindgen_848d4258c8d4d64e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GlobStorageDirectory@
foreign import ccall unsafe "hs_bindgen_d50b8834aa3490cc"
  hs_bindgen_d50b8834aa3490cc_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_get_SDL_GlobStorageDirectory@
hs_bindgen_d50b8834aa3490cc
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_Storage
             -> PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.CChar
             -> SDL3.Sys.Bindgen.Filesystem.SDL_GlobFlags
             -> BG.Ptr BG.CInt
             -> IO (BG.Ptr (BG.Ptr BG.CChar))
           )
       )
hs_bindgen_d50b8834aa3490cc =
  BG.fromFFIType hs_bindgen_d50b8834aa3490cc_base

{-# NOINLINE sDL_GlobStorageDirectory #-}

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
--     [@storage@]: a storage container.
--
--     [@path@]: the path of the directory to enumerate, or NULL for the root.
--
--     [@pattern@]: the pattern that files in the directory must match. Can be NULL.
--
--     [@flags@]: @SDL_GLOB_*@ bitflags that affect this search.
--
--     [@count@]: on return, will be set to the number of items in the returned array. Can be NULL.
--
--     [Returns]: an array of strings on success or NULL on failure; call SDL_GetError() for more information. The caller should pass the returned pointer to SDL_free when done with it. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, assuming the @storage@ object is thread-safe.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GlobStorageDirectory@, defined at @SDL3\/SDL_storage.h 678:37@
sDL_GlobStorageDirectory
  :: BG.FunPtr
       ( BG.Ptr SDL_Storage
         -> PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.CChar
         -> SDL3.Sys.Bindgen.Filesystem.SDL_GlobFlags
         -> BG.Ptr BG.CInt
         -> IO (BG.Ptr (BG.Ptr BG.CChar))
       )
sDL_GlobStorageDirectory =
  BG.unsafePerformIO hs_bindgen_d50b8834aa3490cc
