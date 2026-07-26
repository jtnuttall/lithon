{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Storage.Unsafe (
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_OpenTitleStorage,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_OpenUserStorage,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_OpenFileStorage,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_OpenStorage,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_CloseStorage,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_StorageReady,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_GetStorageFileSize,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_ReadStorageFile,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_WriteStorageFile,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_CreateStorageDirectory,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_EnumerateStorageDirectory,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_RemoveStoragePath,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_RenameStoragePath,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_CopyStorageFile,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_GetStoragePathInfo,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_GetStorageSpaceRemaining,
  SDL3.Sys.Bindgen.Storage.Unsafe.sDL_GlobStorageDirectory,
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
         , "SDL_Storage *hs_bindgen_3efb7b0f89cc88bf ("
         , "  char const *arg1,"
         , "  SDL_PropertiesID arg2"
         , ")"
         , "{"
         , "  return (SDL_OpenTitleStorage)(arg1, arg2);"
         , "}"
         , "SDL_Storage *hs_bindgen_091f6a568e98e088 ("
         , "  char const *arg1,"
         , "  char const *arg2,"
         , "  SDL_PropertiesID arg3"
         , ")"
         , "{"
         , "  return (SDL_OpenUserStorage)(arg1, arg2, arg3);"
         , "}"
         , "SDL_Storage *hs_bindgen_7005113c31f7da2f ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return (SDL_OpenFileStorage)(arg1);"
         , "}"
         , "SDL_Storage *hs_bindgen_b8dda6b007805de7 ("
         , "  SDL_StorageInterface const *arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return (SDL_OpenStorage)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_cbfe2f0e9b4cbc36 ("
         , "  SDL_Storage *arg1"
         , ")"
         , "{"
         , "  return (SDL_CloseStorage)(arg1);"
         , "}"
         , "_Bool hs_bindgen_2696a9ea9d0fe58b ("
         , "  SDL_Storage *arg1"
         , ")"
         , "{"
         , "  return (SDL_StorageReady)(arg1);"
         , "}"
         , "_Bool hs_bindgen_4355da006df8358e ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  Uint64 *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetStorageFileSize)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_9bef126210db7928 ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  void *arg3,"
         , "  Uint64 arg4"
         , ")"
         , "{"
         , "  return (SDL_ReadStorageFile)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_b7b6d20d57e278de ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  void const *arg3,"
         , "  Uint64 arg4"
         , ")"
         , "{"
         , "  return (SDL_WriteStorageFile)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_ca002acf3667a014 ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_CreateStorageDirectory)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_26712abeb8ac186f ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  SDL_EnumerateDirectoryCallback arg3,"
         , "  void *arg4"
         , ")"
         , "{"
         , "  return (SDL_EnumerateStorageDirectory)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_76b7043c8ce038fa ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_RemoveStoragePath)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_27e9f0759ca9fa2b ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return (SDL_RenameStoragePath)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_d46668712d52c888 ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3"
         , ")"
         , "{"
         , "  return (SDL_CopyStorageFile)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_a307c310a8b1e035 ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  SDL_PathInfo *arg3"
         , ")"
         , "{"
         , "  return (SDL_GetStoragePathInfo)(arg1, arg2, arg3);"
         , "}"
         , "Uint64 hs_bindgen_0980e8da26f68acf ("
         , "  SDL_Storage *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetStorageSpaceRemaining)(arg1);"
         , "}"
         , "char **hs_bindgen_c0ca5ffb0ed420ff ("
         , "  SDL_Storage *arg1,"
         , "  char const *arg2,"
         , "  char const *arg3,"
         , "  SDL_GlobFlags arg4,"
         , "  signed int *arg5"
         , ")"
         , "{"
         , "  return (SDL_GlobStorageDirectory)(arg1, arg2, arg3, arg4, arg5);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_OpenTitleStorage@
foreign import ccall unsafe "hs_bindgen_3efb7b0f89cc88bf"
  hs_bindgen_3efb7b0f89cc88bf_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_OpenTitleStorage@
hs_bindgen_3efb7b0f89cc88bf
  :: PtrConst.PtrConst BG.CChar
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO (BG.Ptr SDL_Storage)
hs_bindgen_3efb7b0f89cc88bf =
  BG.fromFFIType hs_bindgen_3efb7b0f89cc88bf_base

-- | Opens up a read-only container for the application\'s filesystem.
--
--     By default, SDL_OpenTitleStorage uses the generic storage implementation. When the path override is not provided, the generic implementation will use the output of SDL_GetBasePath as the base path.
--
--     [Returns]: a title storage container on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseStorage', 'sDL_GetStorageFileSize', 'sDL_OpenUserStorage', 'sDL_ReadStorageFile'
--
--     [C declaration]: @SDL_OpenTitleStorage@, defined at @SDL3\/SDL_storage.h 353:43@
sDL_OpenTitleStorage
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@override@]: a path to override the backend\'s default title root.
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -- ^
  --
  --           [@props@]: a property list that may contain backend-specific information.
  -> IO (BG.Ptr SDL_Storage)
sDL_OpenTitleStorage = hs_bindgen_3efb7b0f89cc88bf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_OpenUserStorage@
foreign import ccall unsafe "hs_bindgen_091f6a568e98e088"
  hs_bindgen_091f6a568e98e088_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_OpenUserStorage@
hs_bindgen_091f6a568e98e088
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
  -> IO (BG.Ptr SDL_Storage)
hs_bindgen_091f6a568e98e088 =
  BG.fromFFIType hs_bindgen_091f6a568e98e088_base

-- | Opens up a container for a user\'s unique read\/write filesystem.
--
--     While title storage can generally be kept open throughout runtime, user storage should only be opened when the client is ready to read\/write files. This allows the backend to properly batch file operations and flush them when the container has been closed; ensuring safe and optimal save I\/O.
--
--     [Returns]: a user storage container on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseStorage', 'sDL_GetStorageFileSize', 'sDL_GetStorageSpaceRemaining', 'sDL_OpenTitleStorage', 'sDL_ReadStorageFile', 'sDL_StorageReady', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_OpenUserStorage@, defined at @SDL3\/SDL_storage.h 379:43@
sDL_OpenUserStorage
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
sDL_OpenUserStorage = hs_bindgen_091f6a568e98e088

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_OpenFileStorage@
foreign import ccall unsafe "hs_bindgen_7005113c31f7da2f"
  hs_bindgen_7005113c31f7da2f_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_OpenFileStorage@
hs_bindgen_7005113c31f7da2f
  :: PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_Storage)
hs_bindgen_7005113c31f7da2f =
  BG.fromFFIType hs_bindgen_7005113c31f7da2f_base

-- | Opens up a container for local filesystem storage.
--
--     This is provided for development and tools. Portable applications should use @SDL_OpenTitleStorage()@ for access to game data and @SDL_OpenUserStorage()@ for access to user data.
--
--     [Returns]: a filesystem storage container on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseStorage', 'sDL_GetStorageFileSize', 'sDL_GetStorageSpaceRemaining', 'sDL_OpenTitleStorage', 'sDL_OpenUserStorage', 'sDL_ReadStorageFile', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_OpenFileStorage@, defined at @SDL3\/SDL_storage.h 403:43@
sDL_OpenFileStorage
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the base path prepended to all storage paths, or NULL for no base path.
  -> IO (BG.Ptr SDL_Storage)
sDL_OpenFileStorage = hs_bindgen_7005113c31f7da2f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_OpenStorage@
foreign import ccall unsafe "hs_bindgen_b8dda6b007805de7"
  hs_bindgen_b8dda6b007805de7_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_OpenStorage@
hs_bindgen_b8dda6b007805de7
  :: PtrConst.PtrConst SDL_StorageInterface
  -> BG.Ptr BG.Void
  -> IO (BG.Ptr SDL_Storage)
hs_bindgen_b8dda6b007805de7 =
  BG.fromFFIType hs_bindgen_b8dda6b007805de7_base

-- | Opens up a container using a client-provided storage interface.
--
--     Applications do not need to use this function unless they are providing their own 'SDL_Storage' implementation. If you just need an 'SDL_Storage', you should use the built-in implementations in SDL, like @SDL_OpenTitleStorage()@ or @SDL_OpenUserStorage()@.
--
--     This function makes a copy of @iface@ and the caller does not need to keep it around after this call.
--
--     [Returns]: a storage container on success or NULL on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseStorage', 'sDL_GetStorageFileSize', 'sDL_GetStorageSpaceRemaining', SDL_INIT_INTERFACE, 'sDL_ReadStorageFile', 'sDL_StorageReady', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_OpenStorage@, defined at @SDL3\/SDL_storage.h 432:43@
sDL_OpenStorage
  :: PtrConst.PtrConst SDL_StorageInterface
  -- ^
  --
  --           [@iface@]: the interface that implements this storage, initialized using SDL_INIT_INTERFACE().
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: the pointer that will be passed to the interface functions.
  -> IO (BG.Ptr SDL_Storage)
sDL_OpenStorage = hs_bindgen_b8dda6b007805de7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_CloseStorage@
foreign import ccall unsafe "hs_bindgen_cbfe2f0e9b4cbc36"
  hs_bindgen_cbfe2f0e9b4cbc36_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_CloseStorage@
hs_bindgen_cbfe2f0e9b4cbc36
  :: BG.Ptr SDL_Storage
  -> IO BG.CBool
hs_bindgen_cbfe2f0e9b4cbc36 =
  BG.fromFFIType hs_bindgen_cbfe2f0e9b4cbc36_base

-- | Closes and frees a storage container.
--
--     [Returns]: true if the container was freed with no errors, false otherwise; call SDL_GetError() for more information. Even if the function returns an error, the container data will be freed; the error is only for informational purposes.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenFileStorage', 'sDL_OpenStorage', 'sDL_OpenTitleStorage', 'sDL_OpenUserStorage'
--
--     [C declaration]: @SDL_CloseStorage@, defined at @SDL3\/SDL_storage.h 450:34@
sDL_CloseStorage
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to close.
  -> IO BG.CBool
sDL_CloseStorage = hs_bindgen_cbfe2f0e9b4cbc36

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_StorageReady@
foreign import ccall unsafe "hs_bindgen_2696a9ea9d0fe58b"
  hs_bindgen_2696a9ea9d0fe58b_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_StorageReady@
hs_bindgen_2696a9ea9d0fe58b
  :: BG.Ptr SDL_Storage
  -> IO BG.CBool
hs_bindgen_2696a9ea9d0fe58b =
  BG.fromFFIType hs_bindgen_2696a9ea9d0fe58b_base

-- | Checks if the storage container is ready to use.
--
--     This function should be called in regular intervals until it returns true - however, it is not recommended to spinwait on this call, as the backend may depend on a synchronous message loop. You might instead poll this in your game\'s main loop while processing events and drawing a loading screen.
--
--     [Returns]: true if the container is ready, false otherwise.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_StorageReady@, defined at @SDL3\/SDL_storage.h 465:34@
sDL_StorageReady
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to query.
  -> IO BG.CBool
sDL_StorageReady = hs_bindgen_2696a9ea9d0fe58b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_GetStorageFileSize@
foreign import ccall unsafe "hs_bindgen_4355da006df8358e"
  hs_bindgen_4355da006df8358e_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_GetStorageFileSize@
hs_bindgen_4355da006df8358e
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO BG.CBool
hs_bindgen_4355da006df8358e =
  BG.fromFFIType hs_bindgen_4355da006df8358e_base

-- | Query the size of a file within a storage container.
--
--     [Returns]: true if the file could be queried or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_ReadStorageFile', 'sDL_StorageReady'
--
--     [C declaration]: @SDL_GetStorageFileSize@, defined at @SDL3\/SDL_storage.h 481:34@
sDL_GetStorageFileSize
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
  -> IO BG.CBool
sDL_GetStorageFileSize = hs_bindgen_4355da006df8358e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_ReadStorageFile@
foreign import ccall unsafe "hs_bindgen_9bef126210db7928"
  hs_bindgen_9bef126210db7928_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_ReadStorageFile@
hs_bindgen_9bef126210db7928
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr BG.Void
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO BG.CBool
hs_bindgen_9bef126210db7928 =
  BG.fromFFIType hs_bindgen_9bef126210db7928_base

-- | Synchronously read a file from a storage container into a client-provided buffer.
--
--     The value of @length@ must match the length of the file exactly; call @SDL_GetStorageFileSize()@ to get this value. This behavior may be relaxed in a future release.
--
--     [Returns]: true if the file was read or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetStorageFileSize', 'sDL_StorageReady', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_ReadStorageFile@, defined at @SDL3\/SDL_storage.h 504:34@
sDL_ReadStorageFile
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
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@length@]: the length of the destination buffer.
  -> IO BG.CBool
sDL_ReadStorageFile = hs_bindgen_9bef126210db7928

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_WriteStorageFile@
foreign import ccall unsafe "hs_bindgen_b7b6d20d57e278de"
  hs_bindgen_b7b6d20d57e278de_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_WriteStorageFile@
hs_bindgen_b7b6d20d57e278de
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.Void
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO BG.CBool
hs_bindgen_b7b6d20d57e278de =
  BG.fromFFIType hs_bindgen_b7b6d20d57e278de_base

-- | Synchronously write a file from client memory into a storage container.
--
--     [Returns]: true if the file was written or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetStorageSpaceRemaining', 'sDL_ReadStorageFile', 'sDL_StorageReady'
--
--     [C declaration]: @SDL_WriteStorageFile@, defined at @SDL3\/SDL_storage.h 522:34@
sDL_WriteStorageFile
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
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@length@]: the length of the source buffer.
  -> IO BG.CBool
sDL_WriteStorageFile = hs_bindgen_b7b6d20d57e278de

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_CreateStorageDirectory@
foreign import ccall unsafe "hs_bindgen_ca002acf3667a014"
  hs_bindgen_ca002acf3667a014_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_CreateStorageDirectory@
hs_bindgen_ca002acf3667a014
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_ca002acf3667a014 =
  BG.fromFFIType hs_bindgen_ca002acf3667a014_base

-- | Create a directory in a writable storage container.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_CreateStorageDirectory@, defined at @SDL3\/SDL_storage.h 536:34@
sDL_CreateStorageDirectory
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to create.
  -> IO BG.CBool
sDL_CreateStorageDirectory =
  hs_bindgen_ca002acf3667a014

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_EnumerateStorageDirectory@
foreign import ccall unsafe "hs_bindgen_26712abeb8ac186f"
  hs_bindgen_26712abeb8ac186f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.FunPtr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_EnumerateStorageDirectory@
hs_bindgen_26712abeb8ac186f
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> SDL3.Sys.Bindgen.Filesystem.SDL_EnumerateDirectoryCallback
  -> BG.Ptr BG.Void
  -> IO BG.CBool
hs_bindgen_26712abeb8ac186f =
  BG.fromFFIType hs_bindgen_26712abeb8ac186f_base

-- | Enumerate a directory in a storage container through a callback function.
--
--     This function provides every directory entry through an app-provided callback, called once for each directory entry, until all results have been provided or the callback returns either SDL_ENUM_SUCCESS or SDL_ENUM_FAILURE.
--
--     This will return false if there was a system problem in general, or if a callback returns SDL_ENUM_FAILURE. A successful return means a callback returned SDL_ENUM_SUCCESS to halt enumeration, or all directory entries were enumerated.
--
--     If @path@ is NULL, this is treated as a request to enumerate the root of the storage container\'s tree. An empty string also works for this.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_EnumerateStorageDirectory@, defined at @SDL3\/SDL_storage.h 565:34@
sDL_EnumerateStorageDirectory
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
  -> IO BG.CBool
sDL_EnumerateStorageDirectory =
  hs_bindgen_26712abeb8ac186f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_RemoveStoragePath@
foreign import ccall unsafe "hs_bindgen_76b7043c8ce038fa"
  hs_bindgen_76b7043c8ce038fa_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_RemoveStoragePath@
hs_bindgen_76b7043c8ce038fa
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_76b7043c8ce038fa =
  BG.fromFFIType hs_bindgen_76b7043c8ce038fa_base

-- | Remove a file or an empty directory in a writable storage container.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_RemoveStoragePath@, defined at @SDL3\/SDL_storage.h 579:34@
sDL_RemoveStoragePath
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@path@]: the path of the directory to enumerate.
  -> IO BG.CBool
sDL_RemoveStoragePath = hs_bindgen_76b7043c8ce038fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_RenameStoragePath@
foreign import ccall unsafe "hs_bindgen_27e9f0759ca9fa2b"
  hs_bindgen_27e9f0759ca9fa2b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_RenameStoragePath@
hs_bindgen_27e9f0759ca9fa2b
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_27e9f0759ca9fa2b =
  BG.fromFFIType hs_bindgen_27e9f0759ca9fa2b_base

-- | Rename a file or directory in a writable storage container.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_RenameStoragePath@, defined at @SDL3\/SDL_storage.h 594:34@
sDL_RenameStoragePath
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
  -> IO BG.CBool
sDL_RenameStoragePath = hs_bindgen_27e9f0759ca9fa2b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_CopyStorageFile@
foreign import ccall unsafe "hs_bindgen_d46668712d52c888"
  hs_bindgen_d46668712d52c888_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_CopyStorageFile@
hs_bindgen_d46668712d52c888
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO BG.CBool
hs_bindgen_d46668712d52c888 =
  BG.fromFFIType hs_bindgen_d46668712d52c888_base

-- | Copy a file in a writable storage container.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_CopyStorageFile@, defined at @SDL3\/SDL_storage.h 609:34@
sDL_CopyStorageFile
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
  -> IO BG.CBool
sDL_CopyStorageFile = hs_bindgen_d46668712d52c888

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_GetStoragePathInfo@
foreign import ccall unsafe "hs_bindgen_a307c310a8b1e035"
  hs_bindgen_a307c310a8b1e035_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_GetStoragePathInfo@
hs_bindgen_a307c310a8b1e035
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> BG.Ptr SDL3.Sys.Bindgen.Filesystem.SDL_PathInfo
  -> IO BG.CBool
hs_bindgen_a307c310a8b1e035 =
  BG.fromFFIType hs_bindgen_a307c310a8b1e035_base

-- | Get information about a filesystem path in a storage container.
--
--     [Returns]: true on success or false if the file doesn\'t exist, or another failure; call SDL_GetError() for more information.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady'
--
--     [C declaration]: @SDL_GetStoragePathInfo@, defined at @SDL3\/SDL_storage.h 625:34@
sDL_GetStoragePathInfo
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
  -> IO BG.CBool
sDL_GetStoragePathInfo = hs_bindgen_a307c310a8b1e035

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_GetStorageSpaceRemaining@
foreign import ccall unsafe "hs_bindgen_0980e8da26f68acf"
  hs_bindgen_0980e8da26f68acf_base
    :: BG.Ptr BG.Void
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_GetStorageSpaceRemaining@
hs_bindgen_0980e8da26f68acf
  :: BG.Ptr SDL_Storage
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
hs_bindgen_0980e8da26f68acf =
  BG.fromFFIType hs_bindgen_0980e8da26f68acf_base

-- | Queries the remaining space in a storage container.
--
--     [Returns]: the amount of remaining space, in bytes.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StorageReady', 'sDL_WriteStorageFile'
--
--     [C declaration]: @SDL_GetStorageSpaceRemaining@, defined at @SDL3\/SDL_storage.h 638:36@
sDL_GetStorageSpaceRemaining
  :: BG.Ptr SDL_Storage
  -- ^
  --
  --           [@storage@]: a storage container to query.
  -> IO SDL3.Sys.Bindgen.Stdinc.Uint64
sDL_GetStorageSpaceRemaining =
  hs_bindgen_0980e8da26f68acf

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_GlobStorageDirectory@
foreign import ccall unsafe "hs_bindgen_c0ca5ffb0ed420ff"
  hs_bindgen_c0ca5ffb0ed420ff_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word32
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Storage_Unsafe_SDL_GlobStorageDirectory@
hs_bindgen_c0ca5ffb0ed420ff
  :: BG.Ptr SDL_Storage
  -> PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> SDL3.Sys.Bindgen.Filesystem.SDL_GlobFlags
  -> BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr BG.CChar))
hs_bindgen_c0ca5ffb0ed420ff =
  BG.fromFFIType hs_bindgen_c0ca5ffb0ed420ff_base

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
--     [Returns]: an array of strings on success or NULL on failure; call SDL_GetError() for more information. The caller should pass the returned pointer to SDL_free when done with it. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: It is safe to call this function from any thread, assuming the @storage@ object is thread-safe.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GlobStorageDirectory@, defined at @SDL3\/SDL_storage.h 678:37@
sDL_GlobStorageDirectory
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
sDL_GlobStorageDirectory =
  hs_bindgen_c0ca5ffb0ed420ff
