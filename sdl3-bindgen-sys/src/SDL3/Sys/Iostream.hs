-- | SDL provides an abstract interface for reading and writing data streams. It offers implementations for files, memory, etc, and the app can provide their own implementations, too.
--
--     'SDL_IOStream' is not related to the standard C++ iostream class, other than both are abstract interfaces to read\/write data. 'SDL_IOStream' status, set by a read or write operation.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Iostream.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Iostream (
  module SDL3.Sys.Bindgen.Iostream,

  -- * Function aliases
  SDL3.Sys.Iostream.ioFromFile,
  SDL3.Sys.Iostream.ioFromFileSafe,
  SDL3.Sys.Iostream.ioFromMem,
  SDL3.Sys.Iostream.ioFromMemSafe,
  SDL3.Sys.Iostream.ioFromConstMem,
  SDL3.Sys.Iostream.ioFromConstMemSafe,
  SDL3.Sys.Iostream.ioFromDynamicMem,
  SDL3.Sys.Iostream.ioFromDynamicMemSafe,
  SDL3.Sys.Iostream.openIO,
  SDL3.Sys.Iostream.openIOSafe,
  SDL3.Sys.Iostream.closeIO,
  SDL3.Sys.Iostream.closeIOSafe,
  SDL3.Sys.Iostream.getIOProperties,
  SDL3.Sys.Iostream.getIOPropertiesSafe,
  SDL3.Sys.Iostream.getIOStatus,
  SDL3.Sys.Iostream.getIOStatusSafe,
  SDL3.Sys.Iostream.getIOSize,
  SDL3.Sys.Iostream.getIOSizeSafe,
  SDL3.Sys.Iostream.seekIO,
  SDL3.Sys.Iostream.seekIOSafe,
  SDL3.Sys.Iostream.tellIO,
  SDL3.Sys.Iostream.tellIOSafe,
  SDL3.Sys.Iostream.readIO,
  SDL3.Sys.Iostream.readIOSafe,
  SDL3.Sys.Iostream.writeIO,
  SDL3.Sys.Iostream.writeIOSafe,
  SDL3.Sys.Iostream.flushIO,
  SDL3.Sys.Iostream.flushIOSafe,
  SDL3.Sys.Iostream.loadFileIO,
  SDL3.Sys.Iostream.loadFileIOSafe,
  SDL3.Sys.Iostream.loadFile,
  SDL3.Sys.Iostream.loadFileSafe,
  SDL3.Sys.Iostream.saveFileIO,
  SDL3.Sys.Iostream.saveFileIOSafe,
  SDL3.Sys.Iostream.saveFile,
  SDL3.Sys.Iostream.saveFileSafe,
  SDL3.Sys.Iostream.readU8,
  SDL3.Sys.Iostream.readU8Safe,
  SDL3.Sys.Iostream.readS8,
  SDL3.Sys.Iostream.readS8Safe,
  SDL3.Sys.Iostream.readU16LE,
  SDL3.Sys.Iostream.readU16LESafe,
  SDL3.Sys.Iostream.readS16LE,
  SDL3.Sys.Iostream.readS16LESafe,
  SDL3.Sys.Iostream.readU16BE,
  SDL3.Sys.Iostream.readU16BESafe,
  SDL3.Sys.Iostream.readS16BE,
  SDL3.Sys.Iostream.readS16BESafe,
  SDL3.Sys.Iostream.readU32LE,
  SDL3.Sys.Iostream.readU32LESafe,
  SDL3.Sys.Iostream.readS32LE,
  SDL3.Sys.Iostream.readS32LESafe,
  SDL3.Sys.Iostream.readU32BE,
  SDL3.Sys.Iostream.readU32BESafe,
  SDL3.Sys.Iostream.readS32BE,
  SDL3.Sys.Iostream.readS32BESafe,
  SDL3.Sys.Iostream.readU64LE,
  SDL3.Sys.Iostream.readU64LESafe,
  SDL3.Sys.Iostream.readS64LE,
  SDL3.Sys.Iostream.readS64LESafe,
  SDL3.Sys.Iostream.readU64BE,
  SDL3.Sys.Iostream.readU64BESafe,
  SDL3.Sys.Iostream.readS64BE,
  SDL3.Sys.Iostream.readS64BESafe,
  SDL3.Sys.Iostream.writeU8,
  SDL3.Sys.Iostream.writeU8Safe,
  SDL3.Sys.Iostream.writeS8,
  SDL3.Sys.Iostream.writeS8Safe,
  SDL3.Sys.Iostream.writeU16LE,
  SDL3.Sys.Iostream.writeU16LESafe,
  SDL3.Sys.Iostream.writeS16LE,
  SDL3.Sys.Iostream.writeS16LESafe,
  SDL3.Sys.Iostream.writeU16BE,
  SDL3.Sys.Iostream.writeU16BESafe,
  SDL3.Sys.Iostream.writeS16BE,
  SDL3.Sys.Iostream.writeS16BESafe,
  SDL3.Sys.Iostream.writeU32LE,
  SDL3.Sys.Iostream.writeU32LESafe,
  SDL3.Sys.Iostream.writeS32LE,
  SDL3.Sys.Iostream.writeS32LESafe,
  SDL3.Sys.Iostream.writeU32BE,
  SDL3.Sys.Iostream.writeU32BESafe,
  SDL3.Sys.Iostream.writeS32BE,
  SDL3.Sys.Iostream.writeS32BESafe,
  SDL3.Sys.Iostream.writeU64LE,
  SDL3.Sys.Iostream.writeU64LESafe,
  SDL3.Sys.Iostream.writeS64LE,
  SDL3.Sys.Iostream.writeS64LESafe,
  SDL3.Sys.Iostream.writeU64BE,
  SDL3.Sys.Iostream.writeU64BESafe,
  SDL3.Sys.Iostream.writeS64BE,
  SDL3.Sys.Iostream.writeS64BESafe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Iostream
import SDL3.Sys.Bindgen.Iostream.Safe qualified as Safe
import SDL3.Sys.Bindgen.Iostream.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Properties qualified
import SDL3.Sys.Bindgen.Stdinc qualified

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
--     In Android, @'ioFromFile'@ can be used to open content:\/\/ URIs. As a fallback, @'ioFromFile'@ will transparently open a matching filename in the app\'s @assets@.
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
--     [Returns]: a pointer to the 'SDL_IOStream' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeIO', 'flushIO', 'readIO', 'seekIO', 'tellIO', 'writeIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IOFromFile@.
--                   The safe flavor is 'ioFromFileSafe'
--                   .
--
--     [C declaration]: @SDL_IOFromFile@, defined at @SDL3\/SDL_iostream.h 278:44@
ioFromFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a UTF-8 string representing the filename to open.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mode@]: an ASCII string representing the mode to be used for opening the file.
  -> IO (BG.Ptr SDL_IOStream)
ioFromFile = Unsafe.sDL_IOFromFile

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
--     In Android, @'ioFromFile'@ can be used to open content:\/\/ URIs. As a fallback, @'ioFromFile'@ will transparently open a matching filename in the app\'s @assets@.
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
--     [Returns]: a pointer to the 'SDL_IOStream' structure that is created or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeIO', 'flushIO', 'readIO', 'seekIO', 'tellIO', 'writeIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IOFromFile@.
--                   The unsafe flavor is 'ioFromFile'
--                   .
--
--     [C declaration]: @SDL_IOFromFile@, defined at @SDL3\/SDL_iostream.h 278:44@
ioFromFileSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: a UTF-8 string representing the filename to open.
  -> PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@mode@]: an ASCII string representing the mode to be used for opening the file.
  -> IO (BG.Ptr SDL_IOStream)
ioFromFileSafe = Safe.sDL_IOFromFile

-- | Use this function to prepare a read-write memory buffer for use with 'SDL_IOStream'.
--
--     This function sets up an 'SDL_IOStream' struct based on a memory area of a certain size, for both read and write access.
--
--     This memory buffer is not copied by the 'SDL_IOStream'; the pointer you provide must remain valid until you close the stream.
--
--     If you need to make sure the 'SDL_IOStream' never writes to the memory buffer, you should use @'ioFromConstMem'@ with a read-only buffer of memory instead.
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
--     [Returns]: a pointer to a new 'SDL_IOStream' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'ioFromConstMem', 'closeIO', 'flushIO', 'readIO', 'seekIO', 'tellIO', 'writeIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IOFromMem@.
--                   The safe flavor is 'ioFromMemSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IOFromMem@, defined at @SDL3\/SDL_iostream.h 330:44@
ioFromMem
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@mem@]: a pointer to a buffer to feed an 'SDL_IOStream' stream.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the buffer size, in bytes.
  -> IO (BG.Ptr SDL_IOStream)
ioFromMem =
  \x00 ->
    \x11 -> Unsafe.sDL_IOFromMem x00 (Coerce.coerce x11)

-- | Use this function to prepare a read-write memory buffer for use with 'SDL_IOStream'.
--
--     This function sets up an 'SDL_IOStream' struct based on a memory area of a certain size, for both read and write access.
--
--     This memory buffer is not copied by the 'SDL_IOStream'; the pointer you provide must remain valid until you close the stream.
--
--     If you need to make sure the 'SDL_IOStream' never writes to the memory buffer, you should use @'ioFromConstMem'@ with a read-only buffer of memory instead.
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
--     [Returns]: a pointer to a new 'SDL_IOStream' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'ioFromConstMem', 'closeIO', 'flushIO', 'readIO', 'seekIO', 'tellIO', 'writeIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IOFromMem@.
--                   The unsafe flavor is 'ioFromMem'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IOFromMem@, defined at @SDL3\/SDL_iostream.h 330:44@
ioFromMemSafe
  :: BG.Ptr BG.Void
  -- ^
  --
  --           [@mem@]: a pointer to a buffer to feed an 'SDL_IOStream' stream.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the buffer size, in bytes.
  -> IO (BG.Ptr SDL_IOStream)
ioFromMemSafe =
  \x00 ->
    \x11 -> Safe.sDL_IOFromMem x00 (Coerce.coerce x11)

-- | Use this function to prepare a read-only memory buffer for use with 'SDL_IOStream'.
--
--     This function sets up an 'SDL_IOStream' struct based on a memory area of a certain size. It assumes the memory area is not writable.
--
--     Attempting to write to this 'SDL_IOStream' stream will report an error without writing to the memory buffer.
--
--     This memory buffer is not copied by the 'SDL_IOStream'; the pointer you provide must remain valid until you close the stream.
--
--     If you need to write to a memory buffer, you should use @'ioFromMem'@ with a writable buffer of memory instead.
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
--     [Returns]: a pointer to a new 'SDL_IOStream' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'ioFromMem', 'closeIO', 'readIO', 'seekIO', 'tellIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IOFromConstMem@.
--                   The safe flavor is 'ioFromConstMemSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IOFromConstMem@, defined at @SDL3\/SDL_iostream.h 381:44@
ioFromConstMem
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@mem@]: a pointer to a read-only buffer to feed an 'SDL_IOStream' stream.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the buffer size, in bytes.
  -> IO (BG.Ptr SDL_IOStream)
ioFromConstMem =
  \x00 ->
    \x11 ->
      Unsafe.sDL_IOFromConstMem x00 (Coerce.coerce x11)

-- | Use this function to prepare a read-only memory buffer for use with 'SDL_IOStream'.
--
--     This function sets up an 'SDL_IOStream' struct based on a memory area of a certain size. It assumes the memory area is not writable.
--
--     Attempting to write to this 'SDL_IOStream' stream will report an error without writing to the memory buffer.
--
--     This memory buffer is not copied by the 'SDL_IOStream'; the pointer you provide must remain valid until you close the stream.
--
--     If you need to write to a memory buffer, you should use @'ioFromMem'@ with a writable buffer of memory instead.
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
--     [Returns]: a pointer to a new 'SDL_IOStream' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'ioFromMem', 'closeIO', 'readIO', 'seekIO', 'tellIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IOFromConstMem@.
--                   The unsafe flavor is 'ioFromConstMem'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_IOFromConstMem@, defined at @SDL3\/SDL_iostream.h 381:44@
ioFromConstMemSafe
  :: PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@mem@]: a pointer to a read-only buffer to feed an 'SDL_IOStream' stream.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the buffer size, in bytes.
  -> IO (BG.Ptr SDL_IOStream)
ioFromConstMemSafe =
  \x00 ->
    \x11 ->
      Safe.sDL_IOFromConstMem x00 (Coerce.coerce x11)

-- | Use this function to create an 'SDL_IOStream' that is backed by dynamically allocated memory.
--
--     This supports the following properties to provide access to the memory and control over allocations:
--
--     * @'sDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER'@: a pointer to the internal memory of the stream. This can be set to NULL to transfer ownership of the memory to the application, which should free the memory with 'SDL3.Sys.Stdinc.free'. If this is done, the next operation on the stream must be @'closeIO'@.
--
--     * @'sDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER'@: memory will be allocated in multiples of this size, defaulting to 1024.
--
--     [Returns]: a pointer to a new 'SDL_IOStream' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeIO', 'readIO', 'seekIO', 'tellIO', 'writeIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_IOFromDynamicMem@.
--                   The safe flavor is 'ioFromDynamicMemSafe'
--                   .
--
--     [C declaration]: @SDL_IOFromDynamicMem@, defined at @SDL3\/SDL_iostream.h 411:44@
ioFromDynamicMem :: IO (BG.Ptr SDL_IOStream)
ioFromDynamicMem = Unsafe.sDL_IOFromDynamicMem

-- | Use this function to create an 'SDL_IOStream' that is backed by dynamically allocated memory.
--
--     This supports the following properties to provide access to the memory and control over allocations:
--
--     * @'sDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER'@: a pointer to the internal memory of the stream. This can be set to NULL to transfer ownership of the memory to the application, which should free the memory with 'SDL3.Sys.Stdinc.free'. If this is done, the next operation on the stream must be @'closeIO'@.
--
--     * @'sDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER'@: memory will be allocated in multiples of this size, defaulting to 1024.
--
--     [Returns]: a pointer to a new 'SDL_IOStream' structure or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeIO', 'readIO', 'seekIO', 'tellIO', 'writeIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_IOFromDynamicMem@.
--                   The unsafe flavor is 'ioFromDynamicMem'
--                   .
--
--     [C declaration]: @SDL_IOFromDynamicMem@, defined at @SDL3\/SDL_iostream.h 411:44@
ioFromDynamicMemSafe :: IO (BG.Ptr SDL_IOStream)
ioFromDynamicMemSafe = Safe.sDL_IOFromDynamicMem

-- | Create a custom 'SDL_IOStream'.
--
--     Applications do not need to use this function unless they are providing their own 'SDL_IOStream' implementation. If you just need an 'SDL_IOStream' to read\/write a common data source, you should use the built-in implementations in SDL, like @'ioFromFile'@ or @'ioFromMem'@, etc.
--
--     This function makes a copy of @iface@ and the caller does not need to keep it around after this call.
--
--     [Returns]: a pointer to the allocated memory on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeIO', SDL_INIT_INTERFACE, 'ioFromConstMem', 'ioFromFile', 'ioFromMem'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_OpenIO@.
--                   The safe flavor is 'openIOSafe'
--                   .
--
--     [C declaration]: @SDL_OpenIO@, defined at @SDL3\/SDL_iostream.h 446:44@
openIO
  :: PtrConst.PtrConst SDL_IOStreamInterface
  -- ^
  --
  --           [@iface@]: the interface that implements this 'SDL_IOStream', initialized using SDL_INIT_INTERFACE().
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: the pointer that will be passed to the interface functions.
  -> IO (BG.Ptr SDL_IOStream)
openIO = Unsafe.sDL_OpenIO

-- | Create a custom 'SDL_IOStream'.
--
--     Applications do not need to use this function unless they are providing their own 'SDL_IOStream' implementation. If you just need an 'SDL_IOStream' to read\/write a common data source, you should use the built-in implementations in SDL, like @'ioFromFile'@ or @'ioFromMem'@, etc.
--
--     This function makes a copy of @iface@ and the caller does not need to keep it around after this call.
--
--     [Returns]: a pointer to the allocated memory on success or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'closeIO', SDL_INIT_INTERFACE, 'ioFromConstMem', 'ioFromFile', 'ioFromMem'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_OpenIO@.
--                   The unsafe flavor is 'openIO'
--                   .
--
--     [C declaration]: @SDL_OpenIO@, defined at @SDL3\/SDL_iostream.h 446:44@
openIOSafe
  :: PtrConst.PtrConst SDL_IOStreamInterface
  -- ^
  --
  --           [@iface@]: the interface that implements this 'SDL_IOStream', initialized using SDL_INIT_INTERFACE().
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@userdata@]: the pointer that will be passed to the interface functions.
  -> IO (BG.Ptr SDL_IOStream)
openIOSafe = Safe.sDL_OpenIO

-- | Close and free an allocated 'SDL_IOStream' structure.
--
--     @'closeIO'@ closes and cleans up the 'SDL_IOStream' stream. It releases any resources used by the stream and frees the 'SDL_IOStream' itself. This returns true on success, or false if the stream failed to flush to its output (e.g. to disk).
--
--     Note that if this fails to flush the stream for any reason, this function reports an error, but the 'SDL_IOStream' is still invalid once this function returns.
--
--     This call flushes any buffered writes to the operating system, but there are no guarantees that those writes have gone to physical media; they might be in the OS\'s file cache, waiting to go to disk later. If it\'s absolutely crucial that writes go to disk immediately, so they are definitely stored even if the power fails before the file cache would have caught up, one should call @'flushIO'@ before closing. Note that flushing takes time and makes the system and your app operate less efficiently, so do so sparingly.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'openIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_CloseIO@.
--                   The safe flavor is 'closeIOSafe'
--                   : flushes and closes through the stream\'s SDL_IOStreamInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CloseIO@, defined at @SDL3\/SDL_iostream.h 478:34@
closeIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: 'SDL_IOStream' structure to close.
  -> IO Bool
closeIO =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_CloseIO x00)

-- | Close and free an allocated 'SDL_IOStream' structure.
--
--     @'closeIO'@ closes and cleans up the 'SDL_IOStream' stream. It releases any resources used by the stream and frees the 'SDL_IOStream' itself. This returns true on success, or false if the stream failed to flush to its output (e.g. to disk).
--
--     Note that if this fails to flush the stream for any reason, this function reports an error, but the 'SDL_IOStream' is still invalid once this function returns.
--
--     This call flushes any buffered writes to the operating system, but there are no guarantees that those writes have gone to physical media; they might be in the OS\'s file cache, waiting to go to disk later. If it\'s absolutely crucial that writes go to disk immediately, so they are definitely stored even if the power fails before the file cache would have caught up, one should call @'flushIO'@ before closing. Note that flushing takes time and makes the system and your app operate less efficiently, so do so sparingly.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'openIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_CloseIO@.
--                   The unsafe flavor is 'closeIO'
--                   : flushes and closes through the stream\'s SDL_IOStreamInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_CloseIO@, defined at @SDL3\/SDL_iostream.h 478:34@
closeIOSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: 'SDL_IOStream' structure to close.
  -> IO Bool
closeIOSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_CloseIO x00)

-- | Get the properties associated with an 'SDL_IOStream'.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetIOProperties@.
--                   The safe flavor is 'getIOPropertiesSafe'
--                   .
--
--     [C declaration]: @SDL_GetIOProperties@, defined at @SDL3\/SDL_iostream.h 491:46@
getIOProperties
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getIOProperties = Unsafe.sDL_GetIOProperties

-- | Get the properties associated with an 'SDL_IOStream'.
--
--     [Returns]: a valid property ID on success or 0 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetIOProperties@.
--                   The unsafe flavor is 'getIOProperties'
--                   .
--
--     [C declaration]: @SDL_GetIOProperties@, defined at @SDL3\/SDL_iostream.h 491:46@
getIOPropertiesSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID
getIOPropertiesSafe = Safe.sDL_GetIOProperties

-- | Query the stream status of an 'SDL_IOStream'.
--
--     This information can be useful to decide if a short read or write was due to an error, an EOF, or a non-blocking operation that isn\'t yet ready to complete.
--
--     An 'SDL_IOStream' \'s status is only expected to change after a 'readIO' or 'writeIO' call; don\'t expect it to change if you just call this query function in a tight loop.
--
--     [Returns]: an 'SDL_IOStatus' enum with the current state.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetIOStatus@.
--                   The safe flavor is 'getIOStatusSafe'
--                   .
--
--     [C declaration]: @SDL_GetIOStatus@, defined at @SDL3\/SDL_iostream.h 511:42@
getIOStatus
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: the 'SDL_IOStream' to query.
  -> IO SDL_IOStatus
getIOStatus = Unsafe.sDL_GetIOStatus

-- | Query the stream status of an 'SDL_IOStream'.
--
--     This information can be useful to decide if a short read or write was due to an error, an EOF, or a non-blocking operation that isn\'t yet ready to complete.
--
--     An 'SDL_IOStream' \'s status is only expected to change after a 'readIO' or 'writeIO' call; don\'t expect it to change if you just call this query function in a tight loop.
--
--     [Returns]: an 'SDL_IOStatus' enum with the current state.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetIOStatus@.
--                   The unsafe flavor is 'getIOStatus'
--                   .
--
--     [C declaration]: @SDL_GetIOStatus@, defined at @SDL3\/SDL_iostream.h 511:42@
getIOStatusSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: the 'SDL_IOStream' to query.
  -> IO SDL_IOStatus
getIOStatusSafe = Safe.sDL_GetIOStatus

-- | Use this function to get the size of the data stream in an 'SDL_IOStream'.
--
--     [Returns]: the size of the data stream in the 'SDL_IOStream' on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetIOSize@.
--                   The safe flavor is 'getIOSizeSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetIOSize@, defined at @SDL3\/SDL_iostream.h 525:36@
getIOSize
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: the 'SDL_IOStream' to get the size of the data stream from.
  -> IO BG.Int64
getIOSize =
  \x00 -> fmap Coerce.coerce (Unsafe.sDL_GetIOSize x00)

-- | Use this function to get the size of the data stream in an 'SDL_IOStream'.
--
--     [Returns]: the size of the data stream in the 'SDL_IOStream' on success or a negative error code on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetIOSize@.
--                   The unsafe flavor is 'getIOSize'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_GetIOSize@, defined at @SDL3\/SDL_iostream.h 525:36@
getIOSizeSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: the 'SDL_IOStream' to get the size of the data stream from.
  -> IO BG.Int64
getIOSizeSafe =
  \x00 -> fmap Coerce.coerce (Safe.sDL_GetIOSize x00)

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
--     [Returns]: the final offset in the data stream after the seek or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'tellIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SeekIO@.
--                   The safe flavor is 'seekIOSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SeekIO@, defined at @SDL3\/SDL_iostream.h 554:36@
seekIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> BG.Int64
  -- ^
  --
  --           [@offset@]: an offset in bytes, relative to @whence@ location; can be negative.
  -> SDL_IOWhence
  -- ^
  --
  --           [@whence@]: any of @SDL_IO_SEEK_SET@, @SDL_IO_SEEK_CUR@, @SDL_IO_SEEK_END@.
  -> IO BG.Int64
seekIO =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_SeekIO x00 (Coerce.coerce x11) x22)

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
--     [Returns]: the final offset in the data stream after the seek or -1 on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'tellIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SeekIO@.
--                   The unsafe flavor is 'seekIO'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SeekIO@, defined at @SDL3\/SDL_iostream.h 554:36@
seekIOSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> BG.Int64
  -- ^
  --
  --           [@offset@]: an offset in bytes, relative to @whence@ location; can be negative.
  -> SDL_IOWhence
  -- ^
  --
  --           [@whence@]: any of @SDL_IO_SEEK_SET@, @SDL_IO_SEEK_CUR@, @SDL_IO_SEEK_END@.
  -> IO BG.Int64
seekIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_SeekIO x00 (Coerce.coerce x11) x22)

-- | Determine the current read\/write offset in an 'SDL_IOStream' data stream.
--
--     'tellIO' is actually a wrapper function that calls the 'SDL_IOStream' \'s @seek@ method, with an offset of 0 bytes from @SDL_IO_SEEK_CUR@, to simplify application development.
--
--     [Returns]: the current offset in the stream, or -1 if the information can not be determined.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'seekIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_TellIO@.
--                   The safe flavor is 'tellIOSafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TellIO@, defined at @SDL3\/SDL_iostream.h 574:36@
tellIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: an 'SDL_IOStream' data stream object from which to get the current offset.
  -> IO BG.Int64
tellIO =
  \x00 -> fmap Coerce.coerce (Unsafe.sDL_TellIO x00)

-- | Determine the current read\/write offset in an 'SDL_IOStream' data stream.
--
--     'tellIO' is actually a wrapper function that calls the 'SDL_IOStream' \'s @seek@ method, with an offset of 0 bytes from @SDL_IO_SEEK_CUR@, to simplify application development.
--
--     [Returns]: the current offset in the stream, or -1 if the information can not be determined.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'seekIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_TellIO@.
--                   The unsafe flavor is 'tellIO'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_TellIO@, defined at @SDL3\/SDL_iostream.h 574:36@
tellIOSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: an 'SDL_IOStream' data stream object from which to get the current offset.
  -> IO BG.Int64
tellIOSafe =
  \x00 -> fmap Coerce.coerce (Safe.sDL_TellIO x00)

-- | Read from a data source.
--
--     This function reads up @size@ bytes from the data source to the area pointed at by @ptr@. This function may read less bytes than requested.
--
--     This function will return zero when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If zero is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     A request for zero bytes on a valid stream will return zero immediately without accessing the stream, so the stream status (EOF, err, etc) will not change.
--
--     [Returns]: the number of bytes read, or 0 on end of file or other failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'writeIO', 'getIOStatus'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadIO@.
--                   The safe flavor is 'readIOSafe'
--                   : dispatches through the stream\'s SDL_IOStreamInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadIO@, defined at @SDL3\/SDL_iostream.h 604:36@
readIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer to read data into.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the number of bytes to read from the data source.
  -> IO BG.Word64
readIO =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_ReadIO x00 x11 (Coerce.coerce x22))

-- | Read from a data source.
--
--     This function reads up @size@ bytes from the data source to the area pointed at by @ptr@. This function may read less bytes than requested.
--
--     This function will return zero when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If zero is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     A request for zero bytes on a valid stream will return zero immediately without accessing the stream, so the stream status (EOF, err, etc) will not change.
--
--     [Returns]: the number of bytes read, or 0 on end of file or other failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'writeIO', 'getIOStatus'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadIO@.
--                   The unsafe flavor is 'readIO'
--                   : dispatches through the stream\'s SDL_IOStreamInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadIO@, defined at @SDL3\/SDL_iostream.h 604:36@
readIOSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> BG.Ptr BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer to read data into.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the number of bytes to read from the data source.
  -> IO BG.Word64
readIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_ReadIO x00 x11 (Coerce.coerce x22))

-- | Write to an 'SDL_IOStream' data stream.
--
--     This function writes exactly @size@ bytes from the area pointed at by @ptr@ to the stream. If this fails for any reason, it\'ll return less than @size@ to demonstrate how far the write progressed. On success, it returns @size@.
--
--     On error, this function still attempts to write as much as possible, so it might return a positive value less than the requested write size.
--
--     The caller can use @'getIOStatus'@ to determine if the problem is recoverable, such as a non-blocking write that can simply be retried later, or a fatal error.
--
--     A request for zero bytes on a valid stream will return zero immediately without accessing the stream, so the stream status (EOF, err, etc) will not change.
--
--     [Returns]: the number of bytes written, which will be less than @size@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: @SDL_IOprintf@, 'readIO', 'seekIO', 'flushIO', 'getIOStatus'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteIO@.
--                   The safe flavor is 'writeIOSafe'
--                   : dispatches through the stream\'s SDL_IOStreamInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteIO@, defined at @SDL3\/SDL_iostream.h 640:36@
writeIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer containing data to write.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the number of bytes to write.
  -> IO BG.Word64
writeIO =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Unsafe.sDL_WriteIO x00 x11 (Coerce.coerce x22))

-- | Write to an 'SDL_IOStream' data stream.
--
--     This function writes exactly @size@ bytes from the area pointed at by @ptr@ to the stream. If this fails for any reason, it\'ll return less than @size@ to demonstrate how far the write progressed. On success, it returns @size@.
--
--     On error, this function still attempts to write as much as possible, so it might return a positive value less than the requested write size.
--
--     The caller can use @'getIOStatus'@ to determine if the problem is recoverable, such as a non-blocking write that can simply be retried later, or a fatal error.
--
--     A request for zero bytes on a valid stream will return zero immediately without accessing the stream, so the stream status (EOF, err, etc) will not change.
--
--     [Returns]: the number of bytes written, which will be less than @size@ on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: @SDL_IOprintf@, 'readIO', 'seekIO', 'flushIO', 'getIOStatus'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteIO@.
--                   The unsafe flavor is 'writeIO'
--                   : dispatches through the stream\'s SDL_IOStreamInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteIO@, defined at @SDL3\/SDL_iostream.h 640:36@
writeIOSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: a pointer to an 'SDL_IOStream' structure.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@ptr@]: a pointer to a buffer containing data to write.
  -> BG.Word64
  -- ^
  --
  --           [@size@]: the number of bytes to write.
  -> IO BG.Word64
writeIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap Coerce.coerce (Safe.sDL_WriteIO x00 x11 (Coerce.coerce x22))

-- | Flush any buffered data in the stream.
--
--     This function makes sure that any buffered data is written to the stream. Normally this isn\'t necessary but if the stream is a pipe or socket it guarantees that any pending data is sent.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'openIO', 'writeIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_FlushIO@.
--                   The safe flavor is 'flushIOSafe'
--                   : dispatches through the stream\'s SDL_IOStreamInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushIO@, defined at @SDL3\/SDL_iostream.h 701:34@
flushIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: 'SDL_IOStream' structure to flush.
  -> IO Bool
flushIO =
  \x00 -> fmap CBool.toBool (Unsafe.sDL_FlushIO x00)

-- | Flush any buffered data in the stream.
--
--     This function makes sure that any buffered data is written to the stream. Normally this isn\'t necessary but if the stream is a pipe or socket it guarantees that any pending data is sent.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'openIO', 'writeIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_FlushIO@.
--                   The unsafe flavor is 'flushIO'
--                   : dispatches through the stream\'s SDL_IOStreamInterface, which may be implemented in Haskell.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_FlushIO@, defined at @SDL3\/SDL_iostream.h 701:34@
flushIOSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@context@]: 'SDL_IOStream' structure to flush.
  -> IO Bool
flushIOSafe =
  \x00 -> fmap CBool.toBool (Safe.sDL_FlushIO x00)

-- | Load all the data from an SDL data stream.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with 'SDL3.Sys.Stdinc.free'.
--
--     [Returns]: the data or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'loadFile', 'saveFileIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadFile_IO@.
--                   The safe flavor is 'loadFileIOSafe'
--                   : reads the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadFile_IO@, defined at @SDL3\/SDL_iostream.h 727:36@
loadFileIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to read all available data from.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: a pointer filled in with the number of bytes read, may be NULL.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls @'closeIO'@ on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr BG.Void)
loadFileIO =
  \x00 ->
    \x11 ->
      \x22 ->
        Unsafe.sDL_LoadFile_IO x00 x11 (CBool.fromBool x22)

-- | Load all the data from an SDL data stream.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with 'SDL3.Sys.Stdinc.free'.
--
--     [Returns]: the data or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'loadFile', 'saveFileIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadFile_IO@.
--                   The unsafe flavor is 'loadFileIO'
--                   : reads the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_LoadFile_IO@, defined at @SDL3\/SDL_iostream.h 727:36@
loadFileIOSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to read all available data from.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: a pointer filled in with the number of bytes read, may be NULL.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls @'closeIO'@ on @src@ before returning, even in the case of an error.
  -> IO (BG.Ptr BG.Void)
loadFileIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        Safe.sDL_LoadFile_IO x00 x11 (CBool.fromBool x22)

-- | Load all the data from a file path.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with 'SDL3.Sys.Stdinc.free'.
--
--     [Returns]: the data or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'loadFileIO', 'saveFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_LoadFile@.
--                   The safe flavor is 'loadFileSafe'
--                   : blocks on whole-file I\/O; an unsafe call stalls every capability and GC for the duration.
--
--     [C declaration]: @SDL_LoadFile@, defined at @SDL3\/SDL_iostream.h 750:36@
loadFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the path to read all available data from.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: if not NULL, will store the number of bytes read.
  -> IO (BG.Ptr BG.Void)
loadFile = Unsafe.sDL_LoadFile

-- | Load all the data from a file path.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with 'SDL3.Sys.Stdinc.free'.
--
--     [Returns]: the data or NULL on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'loadFileIO', 'saveFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_LoadFile@.
--                   The unsafe flavor is 'loadFile'
--                   : blocks on whole-file I\/O; an unsafe call stalls every capability and GC for the duration.
--
--     [C declaration]: @SDL_LoadFile@, defined at @SDL3\/SDL_iostream.h 750:36@
loadFileSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the path to read all available data from.
  -> BG.Ptr HsBindgen.Runtime.LibC.CSize
  -- ^
  --
  --           [@datasize@]: if not NULL, will store the number of bytes read.
  -> IO (BG.Ptr BG.Void)
loadFileSafe = Safe.sDL_LoadFile

-- | Save all the data into an SDL data stream.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'saveFile', 'loadFileIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SaveFile_IO@.
--                   The safe flavor is 'saveFileIOSafe'
--                   : writes the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SaveFile_IO@, defined at @SDL3\/SDL_iostream.h 771:34@
saveFileIO
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to write all data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to be written. If datasize is 0, may be NULL or a invalid pointer.
  -> BG.Word64
  -- ^
  --
  --           [@datasize@]: the number of bytes to be written.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls @'closeIO'@ on @src@ before returning, even in the case of an error.
  -> IO Bool
saveFileIO =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Unsafe.sDL_SaveFile_IO x00 x11 (Coerce.coerce x22) (CBool.fromBool x33))

-- | Save all the data into an SDL data stream.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [See also]: 'saveFile', 'loadFileIO'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SaveFile_IO@.
--                   The unsafe flavor is 'saveFileIO'
--                   : writes the whole stream; a Haskell SDL_IOStreamInterface re-enters synchronously.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SaveFile_IO@, defined at @SDL3\/SDL_iostream.h 771:34@
saveFileIOSafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to write all data to.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to be written. If datasize is 0, may be NULL or a invalid pointer.
  -> BG.Word64
  -- ^
  --
  --           [@datasize@]: the number of bytes to be written.
  -> Bool
  -- ^
  --
  --           [@closeio@]: if true, calls @'closeIO'@ on @src@ before returning, even in the case of an error.
  -> IO Bool
saveFileIOSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        \x33 ->
          fmap CBool.toBool (Safe.sDL_SaveFile_IO x00 x11 (Coerce.coerce x22) (CBool.fromBool x33))

-- | Save all the data into a file path.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'saveFileIO', 'loadFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SaveFile@.
--                   The safe flavor is 'saveFileSafe'
--                   : blocks on whole-file I\/O.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SaveFile@, defined at @SDL3\/SDL_iostream.h 790:34@
saveFile
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the path to write all available data into.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to be written. If datasize is 0, may be NULL or a invalid pointer.
  -> BG.Word64
  -- ^
  --
  --           [@datasize@]: the number of bytes to be written.
  -> IO Bool
saveFile =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Unsafe.sDL_SaveFile x00 x11 (Coerce.coerce x22))

-- | Save all the data into a file path.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'saveFileIO', 'loadFile'
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_SaveFile@.
--                   The unsafe flavor is 'saveFile'
--                   : blocks on whole-file I\/O.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SaveFile@, defined at @SDL3\/SDL_iostream.h 790:34@
saveFileSafe
  :: PtrConst.PtrConst BG.CChar
  -- ^
  --
  --           [@file@]: the path to write all available data into.
  -> PtrConst.PtrConst BG.Void
  -- ^
  --
  --           [@data@]: the data to be written. If datasize is 0, may be NULL or a invalid pointer.
  -> BG.Word64
  -- ^
  --
  --           [@datasize@]: the number of bytes to be written.
  -> IO Bool
saveFileSafe =
  \x00 ->
    \x11 ->
      \x22 ->
        fmap CBool.toBool (Safe.sDL_SaveFile x00 x11 (Coerce.coerce x22))

-- | Use this function to read a byte from an 'SDL_IOStream'.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on success or false on failure or EOF; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadU8@.
--                   The safe flavor is 'readU8Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU8@, defined at @SDL3\/SDL_iostream.h 816:34@
readU8
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to read from.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU8 =
  \x00 ->
    \x11 -> fmap CBool.toBool (Unsafe.sDL_ReadU8 x00 x11)

-- | Use this function to read a byte from an 'SDL_IOStream'.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on success or false on failure or EOF; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadU8@.
--                   The unsafe flavor is 'readU8'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU8@, defined at @SDL3\/SDL_iostream.h 816:34@
readU8Safe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to read from.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU8Safe =
  \x00 ->
    \x11 -> fmap CBool.toBool (Safe.sDL_ReadU8 x00 x11)

-- | Use this function to read a signed byte from an 'SDL_IOStream'.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadS8@.
--                   The safe flavor is 'readS8Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS8@, defined at @SDL3\/SDL_iostream.h 835:34@
readS8
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to read from.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint8
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS8 =
  \x00 ->
    \x11 -> fmap CBool.toBool (Unsafe.sDL_ReadS8 x00 x11)

-- | Use this function to read a signed byte from an 'SDL_IOStream'.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on success or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadS8@.
--                   The unsafe flavor is 'readS8'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS8@, defined at @SDL3\/SDL_iostream.h 835:34@
readS8Safe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the 'SDL_IOStream' to read from.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint8
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS8Safe =
  \x00 ->
    \x11 -> fmap CBool.toBool (Safe.sDL_ReadS8 x00 x11)

-- | Use this function to read 16 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadU16LE@.
--                   The safe flavor is 'readU16LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU16LE@, defined at @SDL3\/SDL_iostream.h 858:34@
readU16LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU16LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadU16LE x00 x11)

-- | Use this function to read 16 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadU16LE@.
--                   The unsafe flavor is 'readU16LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU16LE@, defined at @SDL3\/SDL_iostream.h 858:34@
readU16LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU16LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadU16LE x00 x11)

-- | Use this function to read 16 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadS16LE@.
--                   The safe flavor is 'readS16LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS16LE@, defined at @SDL3\/SDL_iostream.h 881:34@
readS16LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS16LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadS16LE x00 x11)

-- | Use this function to read 16 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadS16LE@.
--                   The unsafe flavor is 'readS16LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS16LE@, defined at @SDL3\/SDL_iostream.h 881:34@
readS16LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS16LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadS16LE x00 x11)

-- | Use this function to read 16 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadU16BE@.
--                   The safe flavor is 'readU16BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU16BE@, defined at @SDL3\/SDL_iostream.h 904:34@
readU16BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU16BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadU16BE x00 x11)

-- | Use this function to read 16 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadU16BE@.
--                   The unsafe flavor is 'readU16BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU16BE@, defined at @SDL3\/SDL_iostream.h 904:34@
readU16BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU16BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadU16BE x00 x11)

-- | Use this function to read 16 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadS16BE@.
--                   The safe flavor is 'readS16BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS16BE@, defined at @SDL3\/SDL_iostream.h 927:34@
readS16BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS16BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadS16BE x00 x11)

-- | Use this function to read 16 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadS16BE@.
--                   The unsafe flavor is 'readS16BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS16BE@, defined at @SDL3\/SDL_iostream.h 927:34@
readS16BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS16BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadS16BE x00 x11)

-- | Use this function to read 32 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadU32LE@.
--                   The safe flavor is 'readU32LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU32LE@, defined at @SDL3\/SDL_iostream.h 950:34@
readU32LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU32LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadU32LE x00 x11)

-- | Use this function to read 32 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadU32LE@.
--                   The unsafe flavor is 'readU32LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU32LE@, defined at @SDL3\/SDL_iostream.h 950:34@
readU32LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU32LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadU32LE x00 x11)

-- | Use this function to read 32 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadS32LE@.
--                   The safe flavor is 'readS32LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS32LE@, defined at @SDL3\/SDL_iostream.h 973:34@
readS32LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS32LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadS32LE x00 x11)

-- | Use this function to read 32 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadS32LE@.
--                   The unsafe flavor is 'readS32LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS32LE@, defined at @SDL3\/SDL_iostream.h 973:34@
readS32LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS32LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadS32LE x00 x11)

-- | Use this function to read 32 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadU32BE@.
--                   The safe flavor is 'readU32BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU32BE@, defined at @SDL3\/SDL_iostream.h 996:34@
readU32BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU32BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadU32BE x00 x11)

-- | Use this function to read 32 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadU32BE@.
--                   The unsafe flavor is 'readU32BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU32BE@, defined at @SDL3\/SDL_iostream.h 996:34@
readU32BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU32BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadU32BE x00 x11)

-- | Use this function to read 32 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadS32BE@.
--                   The safe flavor is 'readS32BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS32BE@, defined at @SDL3\/SDL_iostream.h 1019:34@
readS32BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS32BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadS32BE x00 x11)

-- | Use this function to read 32 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadS32BE@.
--                   The unsafe flavor is 'readS32BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS32BE@, defined at @SDL3\/SDL_iostream.h 1019:34@
readS32BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS32BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadS32BE x00 x11)

-- | Use this function to read 64 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadU64LE@.
--                   The safe flavor is 'readU64LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU64LE@, defined at @SDL3\/SDL_iostream.h 1042:34@
readU64LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU64LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadU64LE x00 x11)

-- | Use this function to read 64 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadU64LE@.
--                   The unsafe flavor is 'readU64LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU64LE@, defined at @SDL3\/SDL_iostream.h 1042:34@
readU64LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU64LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadU64LE x00 x11)

-- | Use this function to read 64 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadS64LE@.
--                   The safe flavor is 'readS64LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS64LE@, defined at @SDL3\/SDL_iostream.h 1065:34@
readS64LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS64LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadS64LE x00 x11)

-- | Use this function to read 64 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadS64LE@.
--                   The unsafe flavor is 'readS64LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS64LE@, defined at @SDL3\/SDL_iostream.h 1065:34@
readS64LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS64LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadS64LE x00 x11)

-- | Use this function to read 64 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadU64BE@.
--                   The safe flavor is 'readU64BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU64BE@, defined at @SDL3\/SDL_iostream.h 1088:34@
readU64BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU64BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadU64BE x00 x11)

-- | Use this function to read 64 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadU64BE@.
--                   The unsafe flavor is 'readU64BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadU64BE@, defined at @SDL3\/SDL_iostream.h 1088:34@
readU64BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readU64BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadU64BE x00 x11)

-- | Use this function to read 64 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_ReadS64BE@.
--                   The safe flavor is 'readS64BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS64BE@, defined at @SDL3\/SDL_iostream.h 1111:34@
readS64BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS64BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_ReadS64BE x00 x11)

-- | Use this function to read 64 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @'getIOStatus'@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @'getIOStatus'@ will return a different error value and 'SDL3.Sys.Error.getError' will offer a human-readable message.
--
--     [Returns]: true on successful read or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_ReadS64BE@.
--                   The unsafe flavor is 'readS64BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_ReadS64BE@, defined at @SDL3\/SDL_iostream.h 1111:34@
readS64BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@src@]: the stream from which to read data.
  -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64
  -- ^
  --
  --           [@value@]: a pointer filled in with the data read.
  -> IO Bool
readS64BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_ReadS64BE x00 x11)

-- | Use this function to write a byte to an 'SDL_IOStream'.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteU8@.
--                   The safe flavor is 'writeU8Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU8@, defined at @SDL3\/SDL_iostream.h 1133:34@
writeU8
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the 'SDL_IOStream' to write to.
  -> BG.Word8
  -- ^
  --
  --           [@value@]: the byte value to write.
  -> IO Bool
writeU8 =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteU8 x00 (Coerce.coerce x11))

-- | Use this function to write a byte to an 'SDL_IOStream'.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteU8@.
--                   The unsafe flavor is 'writeU8'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU8@, defined at @SDL3\/SDL_iostream.h 1133:34@
writeU8Safe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the 'SDL_IOStream' to write to.
  -> BG.Word8
  -- ^
  --
  --           [@value@]: the byte value to write.
  -> IO Bool
writeU8Safe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteU8 x00 (Coerce.coerce x11))

-- | Use this function to write a signed byte to an 'SDL_IOStream'.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteS8@.
--                   The safe flavor is 'writeS8Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS8@, defined at @SDL3\/SDL_iostream.h 1147:34@
writeS8
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the 'SDL_IOStream' to write to.
  -> BG.Int8
  -- ^
  --
  --           [@value@]: the byte value to write.
  -> IO Bool
writeS8 =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteS8 x00 (Coerce.coerce x11))

-- | Use this function to write a signed byte to an 'SDL_IOStream'.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteS8@.
--                   The unsafe flavor is 'writeS8'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS8@, defined at @SDL3\/SDL_iostream.h 1147:34@
writeS8Safe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the 'SDL_IOStream' to write to.
  -> BG.Int8
  -- ^
  --
  --           [@value@]: the byte value to write.
  -> IO Bool
writeS8Safe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteS8 x00 (Coerce.coerce x11))

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteU16LE@.
--                   The safe flavor is 'writeU16LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU16LE@, defined at @SDL3\/SDL_iostream.h 1166:34@
writeU16LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU16LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteU16LE x00 (Coerce.coerce x11))

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteU16LE@.
--                   The unsafe flavor is 'writeU16LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU16LE@, defined at @SDL3\/SDL_iostream.h 1166:34@
writeU16LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU16LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteU16LE x00 (Coerce.coerce x11))

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteS16LE@.
--                   The safe flavor is 'writeS16LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS16LE@, defined at @SDL3\/SDL_iostream.h 1185:34@
writeS16LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS16LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteS16LE x00 (Coerce.coerce x11))

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteS16LE@.
--                   The unsafe flavor is 'writeS16LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS16LE@, defined at @SDL3\/SDL_iostream.h 1185:34@
writeS16LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS16LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteS16LE x00 (Coerce.coerce x11))

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteU16BE@.
--                   The safe flavor is 'writeU16BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU16BE@, defined at @SDL3\/SDL_iostream.h 1203:34@
writeU16BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU16BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteU16BE x00 (Coerce.coerce x11))

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteU16BE@.
--                   The unsafe flavor is 'writeU16BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU16BE@, defined at @SDL3\/SDL_iostream.h 1203:34@
writeU16BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU16BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteU16BE x00 (Coerce.coerce x11))

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteS16BE@.
--                   The safe flavor is 'writeS16BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS16BE@, defined at @SDL3\/SDL_iostream.h 1221:34@
writeS16BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS16BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteS16BE x00 (Coerce.coerce x11))

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteS16BE@.
--                   The unsafe flavor is 'writeS16BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS16BE@, defined at @SDL3\/SDL_iostream.h 1221:34@
writeS16BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int16
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS16BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteS16BE x00 (Coerce.coerce x11))

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteU32LE@.
--                   The safe flavor is 'writeU32LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU32LE@, defined at @SDL3\/SDL_iostream.h 1240:34@
writeU32LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU32LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteU32LE x00 (Coerce.coerce x11))

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteU32LE@.
--                   The unsafe flavor is 'writeU32LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU32LE@, defined at @SDL3\/SDL_iostream.h 1240:34@
writeU32LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU32LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteU32LE x00 (Coerce.coerce x11))

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteS32LE@.
--                   The safe flavor is 'writeS32LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS32LE@, defined at @SDL3\/SDL_iostream.h 1259:34@
writeS32LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS32LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteS32LE x00 (Coerce.coerce x11))

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteS32LE@.
--                   The unsafe flavor is 'writeS32LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS32LE@, defined at @SDL3\/SDL_iostream.h 1259:34@
writeS32LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS32LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteS32LE x00 (Coerce.coerce x11))

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteU32BE@.
--                   The safe flavor is 'writeU32BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU32BE@, defined at @SDL3\/SDL_iostream.h 1277:34@
writeU32BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU32BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteU32BE x00 (Coerce.coerce x11))

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteU32BE@.
--                   The unsafe flavor is 'writeU32BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU32BE@, defined at @SDL3\/SDL_iostream.h 1277:34@
writeU32BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU32BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteU32BE x00 (Coerce.coerce x11))

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteS32BE@.
--                   The safe flavor is 'writeS32BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS32BE@, defined at @SDL3\/SDL_iostream.h 1295:34@
writeS32BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS32BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteS32BE x00 (Coerce.coerce x11))

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteS32BE@.
--                   The unsafe flavor is 'writeS32BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS32BE@, defined at @SDL3\/SDL_iostream.h 1295:34@
writeS32BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int32
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS32BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteS32BE x00 (Coerce.coerce x11))

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteU64LE@.
--                   The safe flavor is 'writeU64LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU64LE@, defined at @SDL3\/SDL_iostream.h 1314:34@
writeU64LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU64LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteU64LE x00 (Coerce.coerce x11))

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteU64LE@.
--                   The unsafe flavor is 'writeU64LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU64LE@, defined at @SDL3\/SDL_iostream.h 1314:34@
writeU64LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU64LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteU64LE x00 (Coerce.coerce x11))

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteS64LE@.
--                   The safe flavor is 'writeS64LESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS64LE@, defined at @SDL3\/SDL_iostream.h 1333:34@
writeS64LE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS64LE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteS64LE x00 (Coerce.coerce x11))

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteS64LE@.
--                   The unsafe flavor is 'writeS64LE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS64LE@, defined at @SDL3\/SDL_iostream.h 1333:34@
writeS64LESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS64LESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteS64LE x00 (Coerce.coerce x11))

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteU64BE@.
--                   The safe flavor is 'writeU64BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU64BE@, defined at @SDL3\/SDL_iostream.h 1351:34@
writeU64BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU64BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteU64BE x00 (Coerce.coerce x11))

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteU64BE@.
--                   The unsafe flavor is 'writeU64BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteU64BE@, defined at @SDL3\/SDL_iostream.h 1351:34@
writeU64BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Word64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeU64BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteU64BE x00 (Coerce.coerce x11))

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_WriteS64BE@.
--                   The safe flavor is 'writeS64BESafe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS64BE@, defined at @SDL3\/SDL_iostream.h 1369:34@
writeS64BE
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS64BE =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Unsafe.sDL_WriteS64BE x00 (Coerce.coerce x11))

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [Returns]: true on successful write or false on failure; call 'SDL3.Sys.Error.getError' for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_WriteS64BE@.
--                   The unsafe flavor is 'writeS64BE'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_WriteS64BE@, defined at @SDL3\/SDL_iostream.h 1369:34@
writeS64BESafe
  :: BG.Ptr SDL_IOStream
  -- ^
  --
  --           [@dst@]: the stream to which data will be written.
  -> BG.Int64
  -- ^
  --
  --           [@value@]: the data to be written, in native format.
  -> IO Bool
writeS64BESafe =
  \x00 ->
    \x11 ->
      fmap CBool.toBool (Safe.sDL_WriteS64BE x00 (Coerce.coerce x11))
