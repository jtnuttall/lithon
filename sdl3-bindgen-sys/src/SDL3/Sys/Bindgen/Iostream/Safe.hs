{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Iostream.Safe (
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_IOFromFile,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_IOFromMem,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_IOFromConstMem,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_IOFromDynamicMem,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_OpenIO,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_CloseIO,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_GetIOProperties,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_GetIOStatus,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_GetIOSize,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_SeekIO,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_TellIO,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadIO,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteIO,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_FlushIO,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_LoadFile_IO,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_LoadFile,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_SaveFile_IO,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_SaveFile,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadU8,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadS8,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadU16LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadS16LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadU16BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadS16BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadU32LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadS32LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadU32BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadS32BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadU64LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadS64LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadU64BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_ReadS64BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteU8,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteS8,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteU16LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteS16LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteU16BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteS16BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteU32LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteS32LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteU32BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteS32BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteU64LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteS64LE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteU64BE,
  SDL3.Sys.Bindgen.Iostream.Safe.sDL_WriteS64BE,
)
where

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Iostream
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_iostream.h>"
         , "SDL_IOStream *hs_bindgen_34e479a8367942af ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return (SDL_IOFromFile)(arg1, arg2);"
         , "}"
         , "SDL_IOStream *hs_bindgen_cf3ad24eb5c5fc0a ("
         , "  void *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return (SDL_IOFromMem)(arg1, arg2);"
         , "}"
         , "SDL_IOStream *hs_bindgen_5e86d852c63fbcca ("
         , "  void const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return (SDL_IOFromConstMem)(arg1, arg2);"
         , "}"
         , "SDL_IOStream *hs_bindgen_683cd141fd8245a6 (void)"
         , "{"
         , "  return (SDL_IOFromDynamicMem)();"
         , "}"
         , "SDL_IOStream *hs_bindgen_03754d9f752b3672 ("
         , "  SDL_IOStreamInterface const *arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return (SDL_OpenIO)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_3194e5e921bc697c ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_CloseIO)(arg1);"
         , "}"
         , "SDL_PropertiesID hs_bindgen_16a31766d73c85ef ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetIOProperties)(arg1);"
         , "}"
         , "SDL_IOStatus hs_bindgen_aa2e9a65d05ce21f ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetIOStatus)(arg1);"
         , "}"
         , "Sint64 hs_bindgen_54da1584c7a84cda ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetIOSize)(arg1);"
         , "}"
         , "Sint64 hs_bindgen_0c3b6f6c9596a5d8 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 arg2,"
         , "  SDL_IOWhence arg3"
         , ")"
         , "{"
         , "  return (SDL_SeekIO)(arg1, arg2, arg3);"
         , "}"
         , "Sint64 hs_bindgen_094df7d1bb2e26ac ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_TellIO)(arg1);"
         , "}"
         , "size_t hs_bindgen_04c1c6ca873e76fc ("
         , "  SDL_IOStream *arg1,"
         , "  void *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_ReadIO)(arg1, arg2, arg3);"
         , "}"
         , "size_t hs_bindgen_ec9c16b5e587afb8 ("
         , "  SDL_IOStream *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_WriteIO)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_bbb89fd7a1a95596 ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return (SDL_FlushIO)(arg1);"
         , "}"
         , "void *hs_bindgen_8fefdb56bfbc407b ("
         , "  SDL_IOStream *arg1,"
         , "  size_t *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return (SDL_LoadFile_IO)(arg1, arg2, arg3);"
         , "}"
         , "void *hs_bindgen_3ffc176218094904 ("
         , "  char const *arg1,"
         , "  size_t *arg2"
         , ")"
         , "{"
         , "  return (SDL_LoadFile)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ee2bf39575dd56cd ("
         , "  SDL_IOStream *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3,"
         , "  _Bool arg4"
         , ")"
         , "{"
         , "  return (SDL_SaveFile_IO)(arg1, arg2, arg3, arg4);"
         , "}"
         , "_Bool hs_bindgen_1157ae79ba240b92 ("
         , "  char const *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return (SDL_SaveFile)(arg1, arg2, arg3);"
         , "}"
         , "_Bool hs_bindgen_9458dbc19d3102af ("
         , "  SDL_IOStream *arg1,"
         , "  Uint8 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadU8)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_9ef691b554f38735 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint8 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadS8)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_312b11f2676e3c2f ("
         , "  SDL_IOStream *arg1,"
         , "  Uint16 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadU16LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_bfc3c7dd523a2b73 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint16 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadS16LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_9b3b157e729c0965 ("
         , "  SDL_IOStream *arg1,"
         , "  Uint16 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadU16BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_53f6414a33954d51 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint16 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadS16BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_cf9bb68f7e8594b1 ("
         , "  SDL_IOStream *arg1,"
         , "  Uint32 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadU32LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_e2c2855a2483a810 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint32 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadS32LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_8cce948b1185d898 ("
         , "  SDL_IOStream *arg1,"
         , "  Uint32 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadU32BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_74529309d09c0236 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint32 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadS32BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_a50de42944661366 ("
         , "  SDL_IOStream *arg1,"
         , "  Uint64 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadU64LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_5dc23c0193ff348f ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadS64LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_5c7313fe19df3bc5 ("
         , "  SDL_IOStream *arg1,"
         , "  Uint64 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadU64BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_77cc43bf1b465b08 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 *arg2"
         , ")"
         , "{"
         , "  return (SDL_ReadS64BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_06be6eeabea4ef7e ("
         , "  SDL_IOStream *arg1,"
         , "  Uint8 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteU8)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_b7f1551a531fd2e5 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint8 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteS8)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_dc258899c026cf6f ("
         , "  SDL_IOStream *arg1,"
         , "  Uint16 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteU16LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_a1111b4c96df3259 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint16 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteS16LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_a4cb3983fa64c5c7 ("
         , "  SDL_IOStream *arg1,"
         , "  Uint16 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteU16BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_161a5c3e908403a2 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint16 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteS16BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ae468e82155587e1 ("
         , "  SDL_IOStream *arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteU32LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_175539b403c6fd0c ("
         , "  SDL_IOStream *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteS32LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_f6e00995ced904a6 ("
         , "  SDL_IOStream *arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteU32BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_7986b77b455fd8d4 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteS32BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_065f64617e3e327c ("
         , "  SDL_IOStream *arg1,"
         , "  Uint64 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteU64LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_846e3f81a5b9c657 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteS64LE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_8f9d3f23bd1a20e7 ("
         , "  SDL_IOStream *arg1,"
         , "  Uint64 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteU64BE)(arg1, arg2);"
         , "}"
         , "_Bool hs_bindgen_ef095eaa3e7cb9b4 ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 arg2"
         , ")"
         , "{"
         , "  return (SDL_WriteS64BE)(arg1, arg2);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_IOFromFile@
foreign import ccall safe "hs_bindgen_34e479a8367942af"
  hs_bindgen_34e479a8367942af_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_IOFromFile@
hs_bindgen_34e479a8367942af
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.CChar
  -> IO (BG.Ptr SDL_IOStream)
hs_bindgen_34e479a8367942af =
  BG.fromFFIType hs_bindgen_34e479a8367942af_base

-- | Use this function to create a new 'SDL_IOStream' structure for reading from and\/or writing to a named file.
--
--     The @mode@ string is treated roughly the same as in a call to the C library\'s fopen(), even if SDL doesn\'t happen to use fopen() behind the scenes.
--
--     Available @mode@ strings:
--
--     * \"r\": Open a file for reading. The file must exist.
--
--     * \"w\": Create an empty file for writing. If a file with the same name already exists its content is erased and the file is treated as a new empty file.
--
--     * \"wx\": Create an empty file for writing. If a file with the same name already exists, the call fails.
--
--     * \"a\": Append to a file. Writing operations append data at the end of the file. The file is created if it does not exist.
--
--     * \"r+\": Open a file for update both reading and writing. The file must exist.
--
--     * \"w+\": Create an empty file for both reading and writing. If a file with the same name already exists its content is erased and the file is treated as a new empty file.
--
--     * \"w+x\": Create an empty file for both reading and writing. If a file with the same name already exists, the call fails.
--
--     * \"a+\": Open a file for reading and appending. All writing operations are performed at the end of the file, protecting the previous content to be overwritten. You can reposition (fseek, rewind) the internal pointer to anywhere in the file for reading, but writing operations will move it back to the end of file. The file is created if it does not exist.
--
--     __NOTE__: In order to open a file as a binary file, a \"b\" character has to be included in the @mode@ string. This additional \"b\" character can either be appended at the end of the string (thus making the following compound modes: \"rb\", \"wb\", \"ab\", \"r+b\", \"w+b\", \"a+b\") or be inserted between the letter and the \"+\" sign for the mixed modes (\"rb+\", \"wb+\", \"ab+\"). Additional characters may follow the sequence, although they should have no effect. For example, \"t\" is sometimes appended to make explicit the file is a text file.
--
--     This function supports Unicode filenames, but they must be encoded in UTF-8 format, regardless of the underlying operating system.
--
--     In Android, @SDL_IOFromFile()@ can be used to open content:\/\/ URIs. As a fallback, @SDL_IOFromFile()@ will transparently open a matching filename in the app\'s @assets@.
--
--     Closing the 'SDL_IOStream' will close SDL\'s internal file handle.
--
--     The following properties may be set at creation time by SDL:
--
--     * @'sDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER'@: a pointer, that can be cast to a win32 @HANDLE@, that this 'SDL_IOStream' is using to access the filesystem. If the program isn\'t running on Windows, or SDL used some other method to access the filesystem, this property will not be set.
--
--     * @'sDL_PROP_IOSTREAM_STDIO_FILE_POINTER'@: a pointer, that can be cast to a stdio @FILE *@, that this 'SDL_IOStream' is using to access the filesystem. If SDL used some other method to access the filesystem, this property will not be set. PLEASE NOTE that if SDL is using a different C runtime than your app, trying to use this pointer will almost certainly result in a crash! This is mostly a problem on Windows; make sure you build SDL and your app with the same compiler and settings to avoid it.
--
--     * @'sDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER'@: a file descriptor that this 'SDL_IOStream' is using to access the filesystem.
--
--     * @'sDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER'@: a pointer, that can be cast to an Android NDK @AAsset *@, that this 'SDL_IOStream' is using to access the filesystem. If SDL used some other method to access the filesystem, this property will not be set.
--
--     [Returns]: a pointer to the 'SDL_IOStream' structure that is created or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseIO', 'sDL_FlushIO', 'sDL_ReadIO', 'sDL_SeekIO', 'sDL_TellIO', 'sDL_WriteIO'
--
--     [C declaration]: @SDL_IOFromFile@, defined at @SDL3\/SDL_iostream.h 278:44@
sDL_IOFromFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a UTF-8 string representing the filename to open.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mode@]: an ASCII string representing the mode to be used for opening the file.
  -> IO (BG.Ptr SDL_IOStream)
sDL_IOFromFile = hs_bindgen_34e479a8367942af

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_IOFromMem@
foreign import ccall safe "hs_bindgen_cf3ad24eb5c5fc0a"
  hs_bindgen_cf3ad24eb5c5fc0a_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_IOFromMem@
hs_bindgen_cf3ad24eb5c5fc0a
  :: BG.Ptr BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr SDL_IOStream)
hs_bindgen_cf3ad24eb5c5fc0a =
  BG.fromFFIType hs_bindgen_cf3ad24eb5c5fc0a_base

-- | Use this function to prepare a read-write memory buffer for use with 'SDL_IOStream'.
--
--     This function sets up an 'SDL_IOStream' struct based on a memory area of a certain size, for both read and write access.
--
--     This memory buffer is not copied by the 'SDL_IOStream'; the pointer you provide must remain valid until you close the stream.
--
--     If you need to make sure the 'SDL_IOStream' never writes to the memory buffer, you should use @SDL_IOFromConstMem()@ with a read-only buffer of memory instead.
--
--     The following properties will be set at creation time by SDL:
--
--     * @'sDL_PROP_IOSTREAM_MEMORY_POINTER'@: this will be the @mem@ parameter that was passed to this function.
--
--     * @'sDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER'@: this will be the @size@ parameter that was passed to this function.
--
--     Additionally, the following properties are recognized:
--
--     * @'sDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER'@: if this property is set to a non-NULL value it will be interpreted as a function of SDL_free_func type and called with the passed @mem@ pointer when closing the stream. By default it is unset, i.e., the memory will not be freed.
--
--     [Returns]: a pointer to a new 'SDL_IOStream' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_IOFromConstMem', 'sDL_CloseIO', 'sDL_FlushIO', 'sDL_ReadIO', 'sDL_SeekIO', 'sDL_TellIO', 'sDL_WriteIO'
--
--     [C declaration]: @SDL_IOFromMem@, defined at @SDL3\/SDL_iostream.h 330:44@
sDL_IOFromMem
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@mem@]: a pointer to a buffer to feed an 'SDL_IOStream' stream.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the buffer size, in bytes.
  -> IO (BG.Ptr SDL_IOStream)
sDL_IOFromMem = hs_bindgen_cf3ad24eb5c5fc0a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_IOFromConstMem@
foreign import ccall safe "hs_bindgen_5e86d852c63fbcca"
  hs_bindgen_5e86d852c63fbcca_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_IOFromConstMem@
hs_bindgen_5e86d852c63fbcca
  :: PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr SDL_IOStream)
hs_bindgen_5e86d852c63fbcca =
  BG.fromFFIType hs_bindgen_5e86d852c63fbcca_base

-- | Use this function to prepare a read-only memory buffer for use with 'SDL_IOStream'.
--
--     This function sets up an 'SDL_IOStream' struct based on a memory area of a certain size. It assumes the memory area is not writable.
--
--     Attempting to write to this 'SDL_IOStream' stream will report an error without writing to the memory buffer.
--
--     This memory buffer is not copied by the 'SDL_IOStream'; the pointer you provide must remain valid until you close the stream.
--
--     If you need to write to a memory buffer, you should use @SDL_IOFromMem()@ with a writable buffer of memory instead.
--
--     The following properties will be set at creation time by SDL:
--
--     * @'sDL_PROP_IOSTREAM_MEMORY_POINTER'@: this will be the @mem@ parameter that was passed to this function.
--
--     * @'sDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER'@: this will be the @size@ parameter that was passed to this function.
--
--     Additionally, the following properties are recognized:
--
--     * @'sDL_PROP_IOSTREAM_MEMORY_FREE_FUNC_POINTER'@: if this property is set to a non-NULL value it will be interpreted as a function of SDL_free_func type and called with the passed @mem@ pointer when closing the stream. By default it is unset, i.e., the memory will not be freed.
--
--     [Returns]: a pointer to a new 'SDL_IOStream' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_IOFromMem', 'sDL_CloseIO', 'sDL_ReadIO', 'sDL_SeekIO', 'sDL_TellIO'
--
--     [C declaration]: @SDL_IOFromConstMem@, defined at @SDL3\/SDL_iostream.h 381:44@
sDL_IOFromConstMem
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@mem@]: a pointer to a read-only buffer to feed an 'SDL_IOStream' stream.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the buffer size, in bytes.
  -> IO (BG.Ptr SDL_IOStream)
sDL_IOFromConstMem = hs_bindgen_5e86d852c63fbcca

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_IOFromDynamicMem@
foreign import ccall safe "hs_bindgen_683cd141fd8245a6"
  hs_bindgen_683cd141fd8245a6_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_IOFromDynamicMem@
hs_bindgen_683cd141fd8245a6 :: IO (BG.Ptr SDL_IOStream)
hs_bindgen_683cd141fd8245a6 =
  BG.fromFFIType hs_bindgen_683cd141fd8245a6_base

-- | Use this function to create an 'SDL_IOStream' that is backed by dynamically allocated memory.
--
--     This supports the following properties to provide access to the memory and control over allocations:
--
--     * @'sDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER'@: a pointer to the internal memory of the stream. This can be set to NULL to transfer ownership of the memory to the application, which should free the memory with SDL_free(). If this is done, the next operation on the stream must be @SDL_CloseIO()@.
--
--     * @'sDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER'@: memory will be allocated in multiples of this size, defaulting to 1024.
--
--     [Returns]: a pointer to a new 'SDL_IOStream' structure or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseIO', 'sDL_ReadIO', 'sDL_SeekIO', 'sDL_TellIO', 'sDL_WriteIO'
--
--     [C declaration]: @SDL_IOFromDynamicMem@, defined at @SDL3\/SDL_iostream.h 411:44@
sDL_IOFromDynamicMem :: IO (BG.Ptr SDL_IOStream)
sDL_IOFromDynamicMem = hs_bindgen_683cd141fd8245a6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_OpenIO@
foreign import ccall safe "hs_bindgen_03754d9f752b3672"
  hs_bindgen_03754d9f752b3672_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_OpenIO@
hs_bindgen_03754d9f752b3672
  :: PtrConst.PtrConst SDL_IOStreamInterface
  -> BG.Ptr BG.Void
  -> IO (BG.Ptr SDL_IOStream)
hs_bindgen_03754d9f752b3672 =
  BG.fromFFIType hs_bindgen_03754d9f752b3672_base

-- | Create a custom 'SDL_IOStream'.
--
--     Applications do not need to use this function unless they are providing their own 'SDL_IOStream' implementation. If you just need an 'SDL_IOStream' to read\/write a common data source, you should use the built-in implementations in SDL, like @SDL_IOFromFile()@ or @SDL_IOFromMem()@, etc.
--
--     This function makes a copy of @iface@ and the caller does not need to keep it around after this call.
--
--     [Returns]: a pointer to the allocated memory on success or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_CloseIO', SDL_INIT_INTERFACE, 'sDL_IOFromConstMem', 'sDL_IOFromFile', 'sDL_IOFromMem'
--
--     [C declaration]: @SDL_OpenIO@, defined at @SDL3\/SDL_iostream.h 446:44@
sDL_OpenIO
  :: PtrConst.PtrConst SDL_IOStreamInterface
  -- ^
  --
  --           [@iface@]: the interface that implements this 'SDL_IOStream', initialized using SDL_INIT_INTERFACE().
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: the pointer that will be passed to the interface functions.
  -> IO (BG.Ptr SDL_IOStream)
sDL_OpenIO = hs_bindgen_03754d9f752b3672

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_CloseIO@
foreign import ccall safe "hs_bindgen_3194e5e921bc697c"
  hs_bindgen_3194e5e921bc697c_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_CloseIO@
hs_bindgen_3194e5e921bc697c
  :: BG.Ptr SDL_IOStream
  -> IO BG.CBool
hs_bindgen_3194e5e921bc697c =
  BG.fromFFIType hs_bindgen_3194e5e921bc697c_base

-- | Close and free an allocated 'SDL_IOStream' structure.
--
--     @SDL_CloseIO()@ closes and cleans up the 'SDL_IOStream' stream. It releases any resources used by the stream and frees the 'SDL_IOStream' itself. This returns true on success, or false if the stream failed to flush to its output (e.g. to disk).
--
--     Note that if this fails to flush the stream for any reason, this function reports an error, but the 'SDL_IOStream' is still invalid once this function returns.
--
--     This call flushes any buffered writes to the operating system, but there are no guarantees that those writes have gone to physical media; they might be in the OS\'s file cache, waiting to go to disk later. If it\'s absolutely crucial that writes go to disk immediately, so they are definitely stored even if the power fails before the file cache would have caught up, one should call @SDL_FlushIO()@ before closing. Note that flushing takes time and makes the system and your app operate less efficiently, so do so sparingly.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenIO'
--
--     [C declaration]: @SDL_CloseIO@, defined at @SDL3\/SDL_iostream.h 478:34@
sDL_CloseIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: 'SDL_IOStream' structure to close.
  -> IO BG.CBool
sDL_CloseIO = hs_bindgen_3194e5e921bc697c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_GetIOProperties@
foreign import ccall safe "hs_bindgen_16a31766d73c85ef"
  hs_bindgen_16a31766d73c85ef_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_GetIOProperties@
hs_bindgen_16a31766d73c85ef
  :: BG.Ptr SDL_IOStream
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
hs_bindgen_16a31766d73c85ef =
  BG.fromFFIType hs_bindgen_16a31766d73c85ef_base

-- | Get the properties associated with an 'SDL_IOStream'.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetIOProperties@, defined at @SDL3\/SDL_iostream.h 491:46@
sDL_GetIOProperties
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
sDL_GetIOProperties = hs_bindgen_16a31766d73c85ef

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_GetIOStatus@
foreign import ccall safe "hs_bindgen_aa2e9a65d05ce21f"
  hs_bindgen_aa2e9a65d05ce21f_base
    :: BG.Ptr BG.Void
    -> IO BG.Word32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_GetIOStatus@
hs_bindgen_aa2e9a65d05ce21f
  :: BG.Ptr SDL_IOStream
  -> IO SDL_IOStatus
hs_bindgen_aa2e9a65d05ce21f =
  BG.fromFFIType hs_bindgen_aa2e9a65d05ce21f_base

-- | Query the stream status of an 'SDL_IOStream'.
--
--     This information can be useful to decide if a short read or write was due to an error, an EOF, or a non-blocking operation that isn\'t yet ready to complete.
--
--     An 'SDL_IOStream' \'s status is only expected to change after a SDL_ReadIO or SDL_WriteIO call; don\'t expect it to change if you just call this query function in a tight loop.
--
--     [Returns]: an 'SDL_IOStatus' enum with the current state.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetIOStatus@, defined at @SDL3\/SDL_iostream.h 511:42@
sDL_GetIOStatus
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: the 'SDL_IOStream' to query.
  -> IO SDL_IOStatus
sDL_GetIOStatus = hs_bindgen_aa2e9a65d05ce21f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_GetIOSize@
foreign import ccall safe "hs_bindgen_54da1584c7a84cda"
  hs_bindgen_54da1584c7a84cda_base
    :: BG.Ptr BG.Void
    -> IO BG.Int64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_GetIOSize@
hs_bindgen_54da1584c7a84cda
  :: BG.Ptr SDL_IOStream
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
hs_bindgen_54da1584c7a84cda =
  BG.fromFFIType hs_bindgen_54da1584c7a84cda_base

-- | Use this function to get the size of the data stream in an 'SDL_IOStream'.
--
--     [Returns]: the size of the data stream in the 'SDL_IOStream' on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetIOSize@, defined at @SDL3\/SDL_iostream.h 525:36@
sDL_GetIOSize
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: the 'SDL_IOStream' to get the size of the data stream from.
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
sDL_GetIOSize = hs_bindgen_54da1584c7a84cda

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_SeekIO@
foreign import ccall safe "hs_bindgen_0c3b6f6c9596a5d8"
  hs_bindgen_0c3b6f6c9596a5d8_base
    :: BG.Ptr BG.Void
    -> BG.Int64
    -> BG.Word32
    -> IO BG.Int64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_SeekIO@
hs_bindgen_0c3b6f6c9596a5d8
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -> SDL_IOWhence
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
hs_bindgen_0c3b6f6c9596a5d8 =
  BG.fromFFIType hs_bindgen_0c3b6f6c9596a5d8_base

-- | Seek within an 'SDL_IOStream' data stream.
--
--     This function seeks to byte @offset@, relative to @whence@.
--
--     @whence@ may be any of the following values:
--
--     * @SDL_IO_SEEK_SET@: seek from the beginning of data
--
--     * @SDL_IO_SEEK_CUR@: seek relative to current read point
--
--     * @SDL_IO_SEEK_END@: seek relative to the end of data
--
--     If this stream can not seek, it will return -1.
--
--     [Returns]: the final offset in the data stream after the seek or -1 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_TellIO'
--
--     [C declaration]: @SDL_SeekIO@, defined at @SDL3\/SDL_iostream.h 554:36@
sDL_SeekIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@offset@]: an offset in bytes, relative to @whence@ location; can be negative.
  -> SDL_IOWhence
  -- ^
  --
  --           [@whence@]: any of @SDL_IO_SEEK_SET@, @SDL_IO_SEEK_CUR@, @SDL_IO_SEEK_END@.
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
sDL_SeekIO = hs_bindgen_0c3b6f6c9596a5d8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_TellIO@
foreign import ccall safe "hs_bindgen_094df7d1bb2e26ac"
  hs_bindgen_094df7d1bb2e26ac_base
    :: BG.Ptr BG.Void
    -> IO BG.Int64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_TellIO@
hs_bindgen_094df7d1bb2e26ac
  :: BG.Ptr SDL_IOStream
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
hs_bindgen_094df7d1bb2e26ac =
  BG.fromFFIType hs_bindgen_094df7d1bb2e26ac_base

-- | Determine the current read\/write offset in an 'SDL_IOStream' data stream.
--
--     SDL_TellIO is actually a wrapper function that calls the 'SDL_IOStream' \'s @seek@ method, with an offset of 0 bytes from @SDL_IO_SEEK_CUR@, to simplify application development.
--
--     [Returns]: the current offset in the stream, or -1 if the information can not be determined.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SeekIO'
--
--     [C declaration]: @SDL_TellIO@, defined at @SDL3\/SDL_iostream.h 574:36@
sDL_TellIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: an 'SDL_IOStream' data stream object from which to get the current offset.
  -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
sDL_TellIO = hs_bindgen_094df7d1bb2e26ac

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadIO@
foreign import ccall safe "hs_bindgen_04c1c6ca873e76fc"
  hs_bindgen_04c1c6ca873e76fc_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadIO@
hs_bindgen_04c1c6ca873e76fc
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_04c1c6ca873e76fc =
  BG.fromFFIType hs_bindgen_04c1c6ca873e76fc_base

-- | Read from a data source.
--
--     This function reads up @size@ bytes from the data source to the area pointed at by @ptr@. This function may read less bytes than requested.
--
--     This function will return zero when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If zero is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     A request for zero bytes on a valid stream will return zero immediately without accessing the stream, so the stream status (EOF, err, etc) will not change.
--
--     [Returns]: the number of bytes read, or 0 on end of file or other failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_WriteIO', 'sDL_GetIOStatus'
--
--     [C declaration]: @SDL_ReadIO@, defined at @SDL3\/SDL_iostream.h 604:36@
sDL_ReadIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer to read data into.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the number of bytes to read from the data source.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_ReadIO = hs_bindgen_04c1c6ca873e76fc

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteIO@
foreign import ccall safe "hs_bindgen_ec9c16b5e587afb8"
  hs_bindgen_ec9c16b5e587afb8_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word64

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteIO@
hs_bindgen_ec9c16b5e587afb8
  :: BG.Ptr SDL_IOStream
  -> PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> IO HsBindgen.Runtime.LibC.CSize
hs_bindgen_ec9c16b5e587afb8 =
  BG.fromFFIType hs_bindgen_ec9c16b5e587afb8_base

-- | Write to an 'SDL_IOStream' data stream.
--
--     This function writes exactly @size@ bytes from the area pointed at by @ptr@ to the stream. If this fails for any reason, it\'ll return less than @size@ to demonstrate how far the write progressed. On success, it returns @size@.
--
--     On error, this function still attempts to write as much as possible, so it might return a positive value less than the requested write size.
--
--     The caller can use @SDL_GetIOStatus()@ to determine if the problem is recoverable, such as a non-blocking write that can simply be retried later, or a fatal error.
--
--     A request for zero bytes on a valid stream will return zero immediately without accessing the stream, so the stream status (EOF, err, etc) will not change.
--
--     [Returns]: the number of bytes written, which will be less than @size@ on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: @SDL_IOprintf@, 'sDL_ReadIO', 'sDL_SeekIO', 'sDL_FlushIO', 'sDL_GetIOStatus'
--
--     [C declaration]: @SDL_WriteIO@, defined at @SDL3\/SDL_iostream.h 640:36@
sDL_WriteIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer containing data to write.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@size@]: the number of bytes to write.
  -> IO HsBindgen.Runtime.LibC.CSize
sDL_WriteIO = hs_bindgen_ec9c16b5e587afb8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_FlushIO@
foreign import ccall safe "hs_bindgen_bbb89fd7a1a95596"
  hs_bindgen_bbb89fd7a1a95596_base
    :: BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_FlushIO@
hs_bindgen_bbb89fd7a1a95596
  :: BG.Ptr SDL_IOStream
  -> IO BG.CBool
hs_bindgen_bbb89fd7a1a95596 =
  BG.fromFFIType hs_bindgen_bbb89fd7a1a95596_base

-- | Flush any buffered data in the stream.
--
--     This function makes sure that any buffered data is written to the stream. Normally this isn\'t necessary but if the stream is a pipe or socket it guarantees that any pending data is sent.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_OpenIO', 'sDL_WriteIO'
--
--     [C declaration]: @SDL_FlushIO@, defined at @SDL3\/SDL_iostream.h 701:34@
sDL_FlushIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: 'SDL_IOStream' structure to flush.
  -> IO BG.CBool
sDL_FlushIO = hs_bindgen_bbb89fd7a1a95596

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_LoadFile_IO@
foreign import ccall safe "hs_bindgen_8fefdb56bfbc407b"
  hs_bindgen_8fefdb56bfbc407b_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word8
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_LoadFile_IO@
hs_bindgen_8fefdb56bfbc407b
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> BG.CBool
  -> IO (BG.Ptr BG.Void)
hs_bindgen_8fefdb56bfbc407b =
  BG.fromFFIType hs_bindgen_8fefdb56bfbc407b_base

-- | Load all the data from an SDL data stream.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with SDL_free().
--
--     [Returns]: the data or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LoadFile', 'sDL_SaveFile_IO'
--
--     [C declaration]: @SDL_LoadFile_IO@, defined at @SDL3\/SDL_iostream.h 727:36@
sDL_LoadFile_IO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to read all available data from.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: a pointer filled in with the number of bytes read, may be NULL.
  -> BG.CBool
  -- ^
  --
  --           [@closeio@]: if true, calls @SDL_CloseIO()@ on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr BG.Void)
sDL_LoadFile_IO = hs_bindgen_8fefdb56bfbc407b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_LoadFile@
foreign import ccall safe "hs_bindgen_3ffc176218094904"
  hs_bindgen_3ffc176218094904_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_LoadFile@
hs_bindgen_3ffc176218094904
  :: PtrConst.PtrConst BG.CChar
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -> IO (BG.Ptr BG.Void)
hs_bindgen_3ffc176218094904 =
  BG.fromFFIType hs_bindgen_3ffc176218094904_base

-- | Load all the data from a file path.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with SDL_free().
--
--     [Returns]: the data or NULL on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_LoadFile_IO', 'sDL_SaveFile'
--
--     [C declaration]: @SDL_LoadFile@, defined at @SDL3\/SDL_iostream.h 750:36@
sDL_LoadFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the path to read all available data from.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: if not NULL, will store the number of bytes read.
  -> IO (BG.Ptr BG.Void)
sDL_LoadFile = hs_bindgen_3ffc176218094904

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_SaveFile_IO@
foreign import ccall safe "hs_bindgen_ee2bf39575dd56cd"
  hs_bindgen_ee2bf39575dd56cd_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_SaveFile_IO@
hs_bindgen_ee2bf39575dd56cd
  :: BG.Ptr SDL_IOStream
  -> PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> BG.CBool
  -> IO BG.CBool
hs_bindgen_ee2bf39575dd56cd =
  BG.fromFFIType hs_bindgen_ee2bf39575dd56cd_base

-- | Save all the data into an SDL data stream.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SaveFile', 'sDL_LoadFile_IO'
--
--     [C declaration]: @SDL_SaveFile_IO@, defined at @SDL3\/SDL_iostream.h 771:34@
sDL_SaveFile_IO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to write all data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to be written. If datasize is 0, may be NULL or a invalid pointer.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: the number of bytes to be written.
  -> BG.CBool
  -- ^
  --
  --           [@closeio@]: if true, calls @SDL_CloseIO()@ on @src@ before returning, even in the case of an error.
  -> IO BG.CBool
sDL_SaveFile_IO = hs_bindgen_ee2bf39575dd56cd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_SaveFile@
foreign import ccall safe "hs_bindgen_1157ae79ba240b92"
  hs_bindgen_1157ae79ba240b92_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_SaveFile@
hs_bindgen_1157ae79ba240b92
  :: PtrConst.PtrConst BG.CChar
  -> PtrConst.PtrConst BG.Void
  -> HsBindgen.Runtime.LibC.CSize
  -> IO BG.CBool
hs_bindgen_1157ae79ba240b92 =
  BG.fromFFIType hs_bindgen_1157ae79ba240b92_base

-- | Save all the data into a file path.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_SaveFile_IO', 'sDL_LoadFile'
--
--     [C declaration]: @SDL_SaveFile@, defined at @SDL3\/SDL_iostream.h 790:34@
sDL_SaveFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the path to write all available data into.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to be written. If datasize is 0, may be NULL or a invalid pointer.
  -> HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: the number of bytes to be written.
  -> IO BG.CBool
sDL_SaveFile = hs_bindgen_1157ae79ba240b92

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU8@
foreign import ccall safe "hs_bindgen_9458dbc19d3102af"
  hs_bindgen_9458dbc19d3102af_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU8@
hs_bindgen_9458dbc19d3102af
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_9458dbc19d3102af =
  BG.fromFFIType hs_bindgen_9458dbc19d3102af_base

-- | Use this function to read a byte from an 'SDL_IOStream'.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on success or false on failure or EOF; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU8@, defined at @SDL3\/SDL_iostream.h 816:34@
sDL_ReadU8
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to read from.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadU8 = hs_bindgen_9458dbc19d3102af

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS8@
foreign import ccall safe "hs_bindgen_9ef691b554f38735"
  hs_bindgen_9ef691b554f38735_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS8@
hs_bindgen_9ef691b554f38735
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint8
  -> IO BG.CBool
hs_bindgen_9ef691b554f38735 =
  BG.fromFFIType hs_bindgen_9ef691b554f38735_base

-- | Use this function to read a signed byte from an 'SDL_IOStream'.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS8@, defined at @SDL3\/SDL_iostream.h 835:34@
sDL_ReadS8
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to read from.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint8
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadS8 = hs_bindgen_9ef691b554f38735

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU16LE@
foreign import ccall safe "hs_bindgen_312b11f2676e3c2f"
  hs_bindgen_312b11f2676e3c2f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU16LE@
hs_bindgen_312b11f2676e3c2f
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO BG.CBool
hs_bindgen_312b11f2676e3c2f =
  BG.fromFFIType hs_bindgen_312b11f2676e3c2f_base

-- | Use this function to read 16 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU16LE@, defined at @SDL3\/SDL_iostream.h 858:34@
sDL_ReadU16LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadU16LE = hs_bindgen_312b11f2676e3c2f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS16LE@
foreign import ccall safe "hs_bindgen_bfc3c7dd523a2b73"
  hs_bindgen_bfc3c7dd523a2b73_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS16LE@
hs_bindgen_bfc3c7dd523a2b73
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -> IO BG.CBool
hs_bindgen_bfc3c7dd523a2b73 =
  BG.fromFFIType hs_bindgen_bfc3c7dd523a2b73_base

-- | Use this function to read 16 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS16LE@, defined at @SDL3\/SDL_iostream.h 881:34@
sDL_ReadS16LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadS16LE = hs_bindgen_bfc3c7dd523a2b73

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU16BE@
foreign import ccall safe "hs_bindgen_9b3b157e729c0965"
  hs_bindgen_9b3b157e729c0965_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU16BE@
hs_bindgen_9b3b157e729c0965
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO BG.CBool
hs_bindgen_9b3b157e729c0965 =
  BG.fromFFIType hs_bindgen_9b3b157e729c0965_base

-- | Use this function to read 16 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU16BE@, defined at @SDL3\/SDL_iostream.h 904:34@
sDL_ReadU16BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadU16BE = hs_bindgen_9b3b157e729c0965

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS16BE@
foreign import ccall safe "hs_bindgen_53f6414a33954d51"
  hs_bindgen_53f6414a33954d51_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS16BE@
hs_bindgen_53f6414a33954d51
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -> IO BG.CBool
hs_bindgen_53f6414a33954d51 =
  BG.fromFFIType hs_bindgen_53f6414a33954d51_base

-- | Use this function to read 16 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS16BE@, defined at @SDL3\/SDL_iostream.h 927:34@
sDL_ReadS16BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadS16BE = hs_bindgen_53f6414a33954d51

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU32LE@
foreign import ccall safe "hs_bindgen_cf9bb68f7e8594b1"
  hs_bindgen_cf9bb68f7e8594b1_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU32LE@
hs_bindgen_cf9bb68f7e8594b1
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_cf9bb68f7e8594b1 =
  BG.fromFFIType hs_bindgen_cf9bb68f7e8594b1_base

-- | Use this function to read 32 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU32LE@, defined at @SDL3\/SDL_iostream.h 950:34@
sDL_ReadU32LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadU32LE = hs_bindgen_cf9bb68f7e8594b1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS32LE@
foreign import ccall safe "hs_bindgen_e2c2855a2483a810"
  hs_bindgen_e2c2855a2483a810_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS32LE@
hs_bindgen_e2c2855a2483a810
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32
  -> IO BG.CBool
hs_bindgen_e2c2855a2483a810 =
  BG.fromFFIType hs_bindgen_e2c2855a2483a810_base

-- | Use this function to read 32 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS32LE@, defined at @SDL3\/SDL_iostream.h 973:34@
sDL_ReadS32LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadS32LE = hs_bindgen_e2c2855a2483a810

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU32BE@
foreign import ccall safe "hs_bindgen_8cce948b1185d898"
  hs_bindgen_8cce948b1185d898_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU32BE@
hs_bindgen_8cce948b1185d898
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_8cce948b1185d898 =
  BG.fromFFIType hs_bindgen_8cce948b1185d898_base

-- | Use this function to read 32 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU32BE@, defined at @SDL3\/SDL_iostream.h 996:34@
sDL_ReadU32BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadU32BE = hs_bindgen_8cce948b1185d898

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS32BE@
foreign import ccall safe "hs_bindgen_74529309d09c0236"
  hs_bindgen_74529309d09c0236_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS32BE@
hs_bindgen_74529309d09c0236
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32
  -> IO BG.CBool
hs_bindgen_74529309d09c0236 =
  BG.fromFFIType hs_bindgen_74529309d09c0236_base

-- | Use this function to read 32 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS32BE@, defined at @SDL3\/SDL_iostream.h 1019:34@
sDL_ReadS32BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadS32BE = hs_bindgen_74529309d09c0236

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU64LE@
foreign import ccall safe "hs_bindgen_a50de42944661366"
  hs_bindgen_a50de42944661366_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU64LE@
hs_bindgen_a50de42944661366
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO BG.CBool
hs_bindgen_a50de42944661366 =
  BG.fromFFIType hs_bindgen_a50de42944661366_base

-- | Use this function to read 64 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU64LE@, defined at @SDL3\/SDL_iostream.h 1042:34@
sDL_ReadU64LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadU64LE = hs_bindgen_a50de42944661366

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS64LE@
foreign import ccall safe "hs_bindgen_5dc23c0193ff348f"
  hs_bindgen_5dc23c0193ff348f_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS64LE@
hs_bindgen_5dc23c0193ff348f
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64
  -> IO BG.CBool
hs_bindgen_5dc23c0193ff348f =
  BG.fromFFIType hs_bindgen_5dc23c0193ff348f_base

-- | Use this function to read 64 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS64LE@, defined at @SDL3\/SDL_iostream.h 1065:34@
sDL_ReadS64LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadS64LE = hs_bindgen_5dc23c0193ff348f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU64BE@
foreign import ccall safe "hs_bindgen_5c7313fe19df3bc5"
  hs_bindgen_5c7313fe19df3bc5_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadU64BE@
hs_bindgen_5c7313fe19df3bc5
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO BG.CBool
hs_bindgen_5c7313fe19df3bc5 =
  BG.fromFFIType hs_bindgen_5c7313fe19df3bc5_base

-- | Use this function to read 64 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU64BE@, defined at @SDL3\/SDL_iostream.h 1088:34@
sDL_ReadU64BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadU64BE = hs_bindgen_5c7313fe19df3bc5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS64BE@
foreign import ccall safe "hs_bindgen_77cc43bf1b465b08"
  hs_bindgen_77cc43bf1b465b08_base
    :: BG.Ptr BG.Void
    -> BG.Ptr BG.Void
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_ReadS64BE@
hs_bindgen_77cc43bf1b465b08
  :: BG.Ptr SDL_IOStream
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64
  -> IO BG.CBool
hs_bindgen_77cc43bf1b465b08 =
  BG.fromFFIType hs_bindgen_77cc43bf1b465b08_base

-- | Use this function to read 64 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS64BE@, defined at @SDL3\/SDL_iostream.h 1111:34@
sDL_ReadS64BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO BG.CBool
sDL_ReadS64BE = hs_bindgen_77cc43bf1b465b08

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU8@
foreign import ccall safe "hs_bindgen_06be6eeabea4ef7e"
  hs_bindgen_06be6eeabea4ef7e_base
    :: BG.Ptr BG.Void
    -> BG.Word8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU8@
hs_bindgen_06be6eeabea4ef7e
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -> IO BG.CBool
hs_bindgen_06be6eeabea4ef7e =
  BG.fromFFIType hs_bindgen_06be6eeabea4ef7e_base

-- | Use this function to write a byte to an 'SDL_IOStream'.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU8@, defined at @SDL3\/SDL_iostream.h 1133:34@
sDL_WriteU8
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the 'SDL_IOStream' to write to.
  -> SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@value@]: the byte value to write.
  -> IO BG.CBool
sDL_WriteU8 = hs_bindgen_06be6eeabea4ef7e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS8@
foreign import ccall safe "hs_bindgen_b7f1551a531fd2e5"
  hs_bindgen_b7f1551a531fd2e5_base
    :: BG.Ptr BG.Void
    -> BG.Int8
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS8@
hs_bindgen_b7f1551a531fd2e5
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Sint8
  -> IO BG.CBool
hs_bindgen_b7f1551a531fd2e5 =
  BG.fromFFIType hs_bindgen_b7f1551a531fd2e5_base

-- | Use this function to write a signed byte to an 'SDL_IOStream'.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS8@, defined at @SDL3\/SDL_iostream.h 1147:34@
sDL_WriteS8
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the 'SDL_IOStream' to write to.
  -> SDL3.Sys.Bindgen.Stdinc.Sint8
  -- ^
  --
  --           [@value@]: the byte value to write.
  -> IO BG.CBool
sDL_WriteS8 = hs_bindgen_b7f1551a531fd2e5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU16LE@
foreign import ccall safe "hs_bindgen_dc258899c026cf6f"
  hs_bindgen_dc258899c026cf6f_base
    :: BG.Ptr BG.Void
    -> BG.Word16
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU16LE@
hs_bindgen_dc258899c026cf6f
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO BG.CBool
hs_bindgen_dc258899c026cf6f =
  BG.fromFFIType hs_bindgen_dc258899c026cf6f_base

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU16LE@, defined at @SDL3\/SDL_iostream.h 1166:34@
sDL_WriteU16LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteU16LE = hs_bindgen_dc258899c026cf6f

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS16LE@
foreign import ccall safe "hs_bindgen_a1111b4c96df3259"
  hs_bindgen_a1111b4c96df3259_base
    :: BG.Ptr BG.Void
    -> BG.Int16
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS16LE@
hs_bindgen_a1111b4c96df3259
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -> IO BG.CBool
hs_bindgen_a1111b4c96df3259 =
  BG.fromFFIType hs_bindgen_a1111b4c96df3259_base

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS16LE@, defined at @SDL3\/SDL_iostream.h 1185:34@
sDL_WriteS16LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteS16LE = hs_bindgen_a1111b4c96df3259

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU16BE@
foreign import ccall safe "hs_bindgen_a4cb3983fa64c5c7"
  hs_bindgen_a4cb3983fa64c5c7_base
    :: BG.Ptr BG.Void
    -> BG.Word16
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU16BE@
hs_bindgen_a4cb3983fa64c5c7
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -> IO BG.CBool
hs_bindgen_a4cb3983fa64c5c7 =
  BG.fromFFIType hs_bindgen_a4cb3983fa64c5c7_base

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU16BE@, defined at @SDL3\/SDL_iostream.h 1203:34@
sDL_WriteU16BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteU16BE = hs_bindgen_a4cb3983fa64c5c7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS16BE@
foreign import ccall safe "hs_bindgen_161a5c3e908403a2"
  hs_bindgen_161a5c3e908403a2_base
    :: BG.Ptr BG.Void
    -> BG.Int16
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS16BE@
hs_bindgen_161a5c3e908403a2
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -> IO BG.CBool
hs_bindgen_161a5c3e908403a2 =
  BG.fromFFIType hs_bindgen_161a5c3e908403a2_base

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS16BE@, defined at @SDL3\/SDL_iostream.h 1221:34@
sDL_WriteS16BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteS16BE = hs_bindgen_161a5c3e908403a2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU32LE@
foreign import ccall safe "hs_bindgen_ae468e82155587e1"
  hs_bindgen_ae468e82155587e1_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU32LE@
hs_bindgen_ae468e82155587e1
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_ae468e82155587e1 =
  BG.fromFFIType hs_bindgen_ae468e82155587e1_base

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU32LE@, defined at @SDL3\/SDL_iostream.h 1240:34@
sDL_WriteU32LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteU32LE = hs_bindgen_ae468e82155587e1

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS32LE@
foreign import ccall safe "hs_bindgen_175539b403c6fd0c"
  hs_bindgen_175539b403c6fd0c_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS32LE@
hs_bindgen_175539b403c6fd0c
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -> IO BG.CBool
hs_bindgen_175539b403c6fd0c =
  BG.fromFFIType hs_bindgen_175539b403c6fd0c_base

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS32LE@, defined at @SDL3\/SDL_iostream.h 1259:34@
sDL_WriteS32LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteS32LE = hs_bindgen_175539b403c6fd0c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU32BE@
foreign import ccall safe "hs_bindgen_f6e00995ced904a6"
  hs_bindgen_f6e00995ced904a6_base
    :: BG.Ptr BG.Void
    -> BG.Word32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU32BE@
hs_bindgen_f6e00995ced904a6
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -> IO BG.CBool
hs_bindgen_f6e00995ced904a6 =
  BG.fromFFIType hs_bindgen_f6e00995ced904a6_base

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU32BE@, defined at @SDL3\/SDL_iostream.h 1277:34@
sDL_WriteU32BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteU32BE = hs_bindgen_f6e00995ced904a6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS32BE@
foreign import ccall safe "hs_bindgen_7986b77b455fd8d4"
  hs_bindgen_7986b77b455fd8d4_base
    :: BG.Ptr BG.Void
    -> BG.Int32
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS32BE@
hs_bindgen_7986b77b455fd8d4
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -> IO BG.CBool
hs_bindgen_7986b77b455fd8d4 =
  BG.fromFFIType hs_bindgen_7986b77b455fd8d4_base

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS32BE@, defined at @SDL3\/SDL_iostream.h 1295:34@
sDL_WriteS32BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteS32BE = hs_bindgen_7986b77b455fd8d4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU64LE@
foreign import ccall safe "hs_bindgen_065f64617e3e327c"
  hs_bindgen_065f64617e3e327c_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU64LE@
hs_bindgen_065f64617e3e327c
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO BG.CBool
hs_bindgen_065f64617e3e327c =
  BG.fromFFIType hs_bindgen_065f64617e3e327c_base

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU64LE@, defined at @SDL3\/SDL_iostream.h 1314:34@
sDL_WriteU64LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteU64LE = hs_bindgen_065f64617e3e327c

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS64LE@
foreign import ccall safe "hs_bindgen_846e3f81a5b9c657"
  hs_bindgen_846e3f81a5b9c657_base
    :: BG.Ptr BG.Void
    -> BG.Int64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS64LE@
hs_bindgen_846e3f81a5b9c657
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -> IO BG.CBool
hs_bindgen_846e3f81a5b9c657 =
  BG.fromFFIType hs_bindgen_846e3f81a5b9c657_base

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS64LE@, defined at @SDL3\/SDL_iostream.h 1333:34@
sDL_WriteS64LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteS64LE = hs_bindgen_846e3f81a5b9c657

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU64BE@
foreign import ccall safe "hs_bindgen_8f9d3f23bd1a20e7"
  hs_bindgen_8f9d3f23bd1a20e7_base
    :: BG.Ptr BG.Void
    -> BG.Word64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteU64BE@
hs_bindgen_8f9d3f23bd1a20e7
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -> IO BG.CBool
hs_bindgen_8f9d3f23bd1a20e7 =
  BG.fromFFIType hs_bindgen_8f9d3f23bd1a20e7_base

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU64BE@, defined at @SDL3\/SDL_iostream.h 1351:34@
sDL_WriteU64BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteU64BE = hs_bindgen_8f9d3f23bd1a20e7

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS64BE@
foreign import ccall safe "hs_bindgen_ef095eaa3e7cb9b4"
  hs_bindgen_ef095eaa3e7cb9b4_base
    :: BG.Ptr BG.Void
    -> BG.Int64
    -> IO BG.Word8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_Safe_SDL_WriteS64BE@
hs_bindgen_ef095eaa3e7cb9b4
  :: BG.Ptr SDL_IOStream
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -> IO BG.CBool
hs_bindgen_ef095eaa3e7cb9b4 =
  BG.fromFFIType hs_bindgen_ef095eaa3e7cb9b4_base

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS64BE@, defined at @SDL3\/SDL_iostream.h 1369:34@
sDL_WriteS64BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO BG.CBool
sDL_WriteS64BE = hs_bindgen_ef095eaa3e7cb9b4
