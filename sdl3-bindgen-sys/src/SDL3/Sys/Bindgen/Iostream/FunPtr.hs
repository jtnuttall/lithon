{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Iostream.FunPtr (
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_IOFromFile,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_IOFromMem,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_IOFromConstMem,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_IOFromDynamicMem,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_OpenIO,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_CloseIO,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_GetIOProperties,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_GetIOStatus,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_GetIOSize,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_SeekIO,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_TellIO,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadIO,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteIO,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_FlushIO,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_LoadFile_IO,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_LoadFile,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_SaveFile_IO,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_SaveFile,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadU8,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadS8,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadU16LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadS16LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadU16BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadS16BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadU32LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadS32LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadU32BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadS32BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadU64LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadS64LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadU64BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_ReadS64BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteU8,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteS8,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteU16LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteS16LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteU16BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteS16BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteU32LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteS32LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteU32BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteS32BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteU64LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteS64LE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteU64BE,
  SDL3.Sys.Bindgen.Iostream.FunPtr.sDL_WriteS64BE,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromFile */"
         , "__attribute__ ((const))"
         , "SDL_IOStream *(*hs_bindgen_201a8b6453f8984e (void)) ("
         , "  char const *arg1,"
         , "  char const *arg2"
         , ")"
         , "{"
         , "  return &SDL_IOFromFile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromMem */"
         , "__attribute__ ((const))"
         , "SDL_IOStream *(*hs_bindgen_85f5d4c89469983e (void)) ("
         , "  void *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return &SDL_IOFromMem;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromConstMem */"
         , "__attribute__ ((const))"
         , "SDL_IOStream *(*hs_bindgen_8e9894d9b76b4508 (void)) ("
         , "  void const *arg1,"
         , "  size_t arg2"
         , ")"
         , "{"
         , "  return &SDL_IOFromConstMem;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromDynamicMem */"
         , "__attribute__ ((const))"
         , "SDL_IOStream *(*hs_bindgen_0bc01e6fcc469c5d (void)) (void)"
         , "{"
         , "  return &SDL_IOFromDynamicMem;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_OpenIO */"
         , "__attribute__ ((const))"
         , "SDL_IOStream *(*hs_bindgen_6ff7847ea63b8084 (void)) ("
         , "  SDL_IOStreamInterface const *arg1,"
         , "  void *arg2"
         , ")"
         , "{"
         , "  return &SDL_OpenIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_CloseIO */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_f6068828da8e5825 (void)) ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_CloseIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_GetIOProperties */"
         , "__attribute__ ((const))"
         , "SDL_PropertiesID (*hs_bindgen_8dacbe3916578a37 (void)) ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetIOProperties;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_GetIOStatus */"
         , "__attribute__ ((const))"
         , "SDL_IOStatus (*hs_bindgen_31f5af3182a34a32 (void)) ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetIOStatus;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_GetIOSize */"
         , "__attribute__ ((const))"
         , "Sint64 (*hs_bindgen_322d6819ddbd6d39 (void)) ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_GetIOSize;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_SeekIO */"
         , "__attribute__ ((const))"
         , "Sint64 (*hs_bindgen_0a9b2c955dab0026 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 arg2,"
         , "  SDL_IOWhence arg3"
         , ")"
         , "{"
         , "  return &SDL_SeekIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_TellIO */"
         , "__attribute__ ((const))"
         , "Sint64 (*hs_bindgen_bef67ceee53b6142 (void)) ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_TellIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadIO */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_0c9d4db36a2719b6 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  void *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_ReadIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteIO */"
         , "__attribute__ ((const))"
         , "size_t (*hs_bindgen_d9956d7898ea90e2 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_WriteIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_FlushIO */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ae112d17ec9c64f0 (void)) ("
         , "  SDL_IOStream *arg1"
         , ")"
         , "{"
         , "  return &SDL_FlushIO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_LoadFile_IO */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_e46ab82952c4c1d4 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  size_t *arg2,"
         , "  _Bool arg3"
         , ")"
         , "{"
         , "  return &SDL_LoadFile_IO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_LoadFile */"
         , "__attribute__ ((const))"
         , "void *(*hs_bindgen_ea9bbd4467b9e2c6 (void)) ("
         , "  char const *arg1,"
         , "  size_t *arg2"
         , ")"
         , "{"
         , "  return &SDL_LoadFile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_SaveFile_IO */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_de0267086f8fc295 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3,"
         , "  _Bool arg4"
         , ")"
         , "{"
         , "  return &SDL_SaveFile_IO;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_SaveFile */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_841c544344507810 (void)) ("
         , "  char const *arg1,"
         , "  void const *arg2,"
         , "  size_t arg3"
         , ")"
         , "{"
         , "  return &SDL_SaveFile;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU8 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c304f9e2b3baf9dd (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint8 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadU8;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS8 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_c39406dce63371f8 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint8 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadS8;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU16LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6849a0e565e7ac74 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint16 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadU16LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS16LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fe15c03a2323f8ee (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint16 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadS16LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU16BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_04f5c88868a2821e (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint16 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadU16BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS16BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ab83010c5ae7ab35 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint16 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadS16BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU32LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_4dedf81005dea655 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint32 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadU32LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS32LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fffd09bacab3320d (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint32 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadS32LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU32BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_42b0f1d027be0c67 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint32 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadU32BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS32BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_97bc8b4d68748597 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint32 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadS32BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU64LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_076f54bb27254ddb (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint64 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadU64LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS64LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_1aa96b5b13230b9b (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadS64LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU64BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b0379b9f20acb50b (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint64 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadU64BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS64BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_91c79c6f23b10cea (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 *arg2"
         , ")"
         , "{"
         , "  return &SDL_ReadS64BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU8 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_6a41201b6dedc01d (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint8 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteU8;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS8 */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_7779de5157457a4b (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint8 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteS8;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU16LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_d47e66728dda1cb5 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint16 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteU16LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS16LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_93f38ce5f51dbf43 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint16 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteS16LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU16BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_e336b4900affdc95 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint16 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteU16BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS16BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_ae3652657a7f54ff (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint16 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteS16BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU32LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3eafe174eec9869a (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteU32LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS32LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_93d996acdc68faa4 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteS32LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU32BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_b65faf115109388d (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteU32BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS32BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_dfe1b91f6dd8a3fa (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint32 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteS32BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU64LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_2d1c699323094d03 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint64 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteU64LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS64LE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fe1f17e206d55f2a (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteS64LE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU64BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_9dd43ac41e9a2bb2 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Uint64 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteU64BE;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS64BE */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_fbc1776f62682806 (void)) ("
         , "  SDL_IOStream *arg1,"
         , "  Sint64 arg2"
         , ")"
         , "{"
         , "  return &SDL_WriteS64BE;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromFile@
foreign import ccall unsafe "hs_bindgen_201a8b6453f8984e"
  hs_bindgen_201a8b6453f8984e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromFile@
hs_bindgen_201a8b6453f8984e
  :: IO
       (BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_IOStream)))
hs_bindgen_201a8b6453f8984e =
  BG.fromFFIType hs_bindgen_201a8b6453f8984e_base

{-# NOINLINE sDL_IOFromFile #-}

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
--     [@file@]: a UTF-8 string representing the filename to open.
--
--     [@mode@]: an ASCII string representing the mode to be used for opening the file.
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
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> PtrConst.PtrConst BG.CChar -> IO (BG.Ptr SDL_IOStream))
sDL_IOFromFile =
  BG.unsafePerformIO hs_bindgen_201a8b6453f8984e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromMem@
foreign import ccall unsafe "hs_bindgen_85f5d4c89469983e"
  hs_bindgen_85f5d4c89469983e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromMem@
hs_bindgen_85f5d4c89469983e
  :: IO (BG.FunPtr (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr SDL_IOStream)))
hs_bindgen_85f5d4c89469983e =
  BG.fromFFIType hs_bindgen_85f5d4c89469983e_base

{-# NOINLINE sDL_IOFromMem #-}

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
--     [@mem@]: a pointer to a buffer to feed an 'SDL_IOStream' stream.
--
--     [@size@]: the buffer size, in bytes.
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
  :: BG.FunPtr (BG.Ptr BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr SDL_IOStream))
sDL_IOFromMem =
  BG.unsafePerformIO hs_bindgen_85f5d4c89469983e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromConstMem@
foreign import ccall unsafe "hs_bindgen_8e9894d9b76b4508"
  hs_bindgen_8e9894d9b76b4508_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromConstMem@
hs_bindgen_8e9894d9b76b4508
  :: IO
       (BG.FunPtr (PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr SDL_IOStream)))
hs_bindgen_8e9894d9b76b4508 =
  BG.fromFFIType hs_bindgen_8e9894d9b76b4508_base

{-# NOINLINE sDL_IOFromConstMem #-}

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
--     [@mem@]: a pointer to a read-only buffer to feed an 'SDL_IOStream' stream.
--
--     [@size@]: the buffer size, in bytes.
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
  :: BG.FunPtr (PtrConst.PtrConst BG.Void -> HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr SDL_IOStream))
sDL_IOFromConstMem =
  BG.unsafePerformIO hs_bindgen_8e9894d9b76b4508

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromDynamicMem@
foreign import ccall unsafe "hs_bindgen_0bc01e6fcc469c5d"
  hs_bindgen_0bc01e6fcc469c5d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_IOFromDynamicMem@
hs_bindgen_0bc01e6fcc469c5d :: IO (BG.FunPtr (IO (BG.Ptr SDL_IOStream)))
hs_bindgen_0bc01e6fcc469c5d =
  BG.fromFFIType hs_bindgen_0bc01e6fcc469c5d_base

{-# NOINLINE sDL_IOFromDynamicMem #-}

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
sDL_IOFromDynamicMem :: BG.FunPtr (IO (BG.Ptr SDL_IOStream))
sDL_IOFromDynamicMem =
  BG.unsafePerformIO hs_bindgen_0bc01e6fcc469c5d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_OpenIO@
foreign import ccall unsafe "hs_bindgen_6ff7847ea63b8084"
  hs_bindgen_6ff7847ea63b8084_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_OpenIO@
hs_bindgen_6ff7847ea63b8084
  :: IO
       (BG.FunPtr (PtrConst.PtrConst SDL_IOStreamInterface -> BG.Ptr BG.Void -> IO (BG.Ptr SDL_IOStream)))
hs_bindgen_6ff7847ea63b8084 =
  BG.fromFFIType hs_bindgen_6ff7847ea63b8084_base

{-# NOINLINE sDL_OpenIO #-}

-- | Create a custom 'SDL_IOStream'.
--
--     Applications do not need to use this function unless they are providing their own 'SDL_IOStream' implementation. If you just need an 'SDL_IOStream' to read\/write a common data source, you should use the built-in implementations in SDL, like @SDL_IOFromFile()@ or @SDL_IOFromMem()@, etc.
--
--     This function makes a copy of @iface@ and the caller does not need to keep it around after this call.
--
--     [@iface@]: the interface that implements this 'SDL_IOStream', initialized using SDL_INIT_INTERFACE().
--
--     [@userdata@]: the pointer that will be passed to the interface functions.
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
  :: BG.FunPtr (PtrConst.PtrConst SDL_IOStreamInterface -> BG.Ptr BG.Void -> IO (BG.Ptr SDL_IOStream))
sDL_OpenIO =
  BG.unsafePerformIO hs_bindgen_6ff7847ea63b8084

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_CloseIO@
foreign import ccall unsafe "hs_bindgen_f6068828da8e5825"
  hs_bindgen_f6068828da8e5825_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_CloseIO@
hs_bindgen_f6068828da8e5825 :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> IO BG.CBool))
hs_bindgen_f6068828da8e5825 =
  BG.fromFFIType hs_bindgen_f6068828da8e5825_base

{-# NOINLINE sDL_CloseIO #-}

-- | Close and free an allocated 'SDL_IOStream' structure.
--
--     @SDL_CloseIO()@ closes and cleans up the 'SDL_IOStream' stream. It releases any resources used by the stream and frees the 'SDL_IOStream' itself. This returns true on success, or false if the stream failed to flush to its output (e.g. to disk).
--
--     Note that if this fails to flush the stream for any reason, this function reports an error, but the 'SDL_IOStream' is still invalid once this function returns.
--
--     This call flushes any buffered writes to the operating system, but there are no guarantees that those writes have gone to physical media; they might be in the OS\'s file cache, waiting to go to disk later. If it\'s absolutely crucial that writes go to disk immediately, so they are definitely stored even if the power fails before the file cache would have caught up, one should call @SDL_FlushIO()@ before closing. Note that flushing takes time and makes the system and your app operate less efficiently, so do so sparingly.
--
--     [@context@]: 'SDL_IOStream' structure to close.
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
sDL_CloseIO :: BG.FunPtr (BG.Ptr SDL_IOStream -> IO BG.CBool)
sDL_CloseIO =
  BG.unsafePerformIO hs_bindgen_f6068828da8e5825

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_GetIOProperties@
foreign import ccall unsafe "hs_bindgen_8dacbe3916578a37"
  hs_bindgen_8dacbe3916578a37_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_GetIOProperties@
hs_bindgen_8dacbe3916578a37
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID))
hs_bindgen_8dacbe3916578a37 =
  BG.fromFFIType hs_bindgen_8dacbe3916578a37_base

{-# NOINLINE sDL_GetIOProperties #-}

-- | Get the properties associated with an 'SDL_IOStream'.
--
--     [@context@]: a pointer to an 'SDL_IOStream' structure.
--
--     [Returns]: a valid property ID on success or 0 on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetIOProperties@, defined at @SDL3\/SDL_iostream.h 491:46@
sDL_GetIOProperties
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> IO SDL3.Sys.Bindgen.Properties.SDL_PropertiesID)
sDL_GetIOProperties =
  BG.unsafePerformIO hs_bindgen_8dacbe3916578a37

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_GetIOStatus@
foreign import ccall unsafe "hs_bindgen_31f5af3182a34a32"
  hs_bindgen_31f5af3182a34a32_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_GetIOStatus@
hs_bindgen_31f5af3182a34a32 :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> IO SDL_IOStatus))
hs_bindgen_31f5af3182a34a32 =
  BG.fromFFIType hs_bindgen_31f5af3182a34a32_base

{-# NOINLINE sDL_GetIOStatus #-}

-- | Query the stream status of an 'SDL_IOStream'.
--
--     This information can be useful to decide if a short read or write was due to an error, an EOF, or a non-blocking operation that isn\'t yet ready to complete.
--
--     An 'SDL_IOStream' \'s status is only expected to change after a SDL_ReadIO or SDL_WriteIO call; don\'t expect it to change if you just call this query function in a tight loop.
--
--     [@context@]: the 'SDL_IOStream' to query.
--
--     [Returns]: an 'SDL_IOStatus' enum with the current state.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetIOStatus@, defined at @SDL3\/SDL_iostream.h 511:42@
sDL_GetIOStatus :: BG.FunPtr (BG.Ptr SDL_IOStream -> IO SDL_IOStatus)
sDL_GetIOStatus =
  BG.unsafePerformIO hs_bindgen_31f5af3182a34a32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_GetIOSize@
foreign import ccall unsafe "hs_bindgen_322d6819ddbd6d39"
  hs_bindgen_322d6819ddbd6d39_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_GetIOSize@
hs_bindgen_322d6819ddbd6d39
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> IO SDL3.Sys.Bindgen.Stdinc.Sint64))
hs_bindgen_322d6819ddbd6d39 =
  BG.fromFFIType hs_bindgen_322d6819ddbd6d39_base

{-# NOINLINE sDL_GetIOSize #-}

-- | Use this function to get the size of the data stream in an 'SDL_IOStream'.
--
--     [@context@]: the 'SDL_IOStream' to get the size of the data stream from.
--
--     [Returns]: the size of the data stream in the 'SDL_IOStream' on success or a negative error code on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetIOSize@, defined at @SDL3\/SDL_iostream.h 525:36@
sDL_GetIOSize :: BG.FunPtr (BG.Ptr SDL_IOStream -> IO SDL3.Sys.Bindgen.Stdinc.Sint64)
sDL_GetIOSize =
  BG.unsafePerformIO hs_bindgen_322d6819ddbd6d39

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_SeekIO@
foreign import ccall unsafe "hs_bindgen_0a9b2c955dab0026"
  hs_bindgen_0a9b2c955dab0026_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_SeekIO@
hs_bindgen_0a9b2c955dab0026
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_IOStream
             -> SDL3.Sys.Bindgen.Stdinc.Sint64
             -> SDL_IOWhence
             -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
           )
       )
hs_bindgen_0a9b2c955dab0026 =
  BG.fromFFIType hs_bindgen_0a9b2c955dab0026_base

{-# NOINLINE sDL_SeekIO #-}

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
--     [@context@]: a pointer to an 'SDL_IOStream' structure.
--
--     [@offset@]: an offset in bytes, relative to @whence@ location; can be negative.
--
--     [@whence@]: any of @SDL_IO_SEEK_SET@, @SDL_IO_SEEK_CUR@, @SDL_IO_SEEK_END@.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_IOStream
         -> SDL3.Sys.Bindgen.Stdinc.Sint64
         -> SDL_IOWhence
         -> IO SDL3.Sys.Bindgen.Stdinc.Sint64
       )
sDL_SeekIO =
  BG.unsafePerformIO hs_bindgen_0a9b2c955dab0026

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_TellIO@
foreign import ccall unsafe "hs_bindgen_bef67ceee53b6142"
  hs_bindgen_bef67ceee53b6142_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_TellIO@
hs_bindgen_bef67ceee53b6142
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> IO SDL3.Sys.Bindgen.Stdinc.Sint64))
hs_bindgen_bef67ceee53b6142 =
  BG.fromFFIType hs_bindgen_bef67ceee53b6142_base

{-# NOINLINE sDL_TellIO #-}

-- | Determine the current read\/write offset in an 'SDL_IOStream' data stream.
--
--     SDL_TellIO is actually a wrapper function that calls the 'SDL_IOStream' \'s @seek@ method, with an offset of 0 bytes from @SDL_IO_SEEK_CUR@, to simplify application development.
--
--     [@context@]: an 'SDL_IOStream' data stream object from which to get the current offset.
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
sDL_TellIO :: BG.FunPtr (BG.Ptr SDL_IOStream -> IO SDL3.Sys.Bindgen.Stdinc.Sint64)
sDL_TellIO =
  BG.unsafePerformIO hs_bindgen_bef67ceee53b6142

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadIO@
foreign import ccall unsafe "hs_bindgen_0c9d4db36a2719b6"
  hs_bindgen_0c9d4db36a2719b6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadIO@
hs_bindgen_0c9d4db36a2719b6
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_IOStream
             -> BG.Ptr BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> IO HsBindgen.Runtime.LibC.CSize
           )
       )
hs_bindgen_0c9d4db36a2719b6 =
  BG.fromFFIType hs_bindgen_0c9d4db36a2719b6_base

{-# NOINLINE sDL_ReadIO #-}

-- | Read from a data source.
--
--     This function reads up @size@ bytes from the data source to the area pointed at by @ptr@. This function may read less bytes than requested.
--
--     This function will return zero when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If zero is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     A request for zero bytes on a valid stream will return zero immediately without accessing the stream, so the stream status (EOF, err, etc) will not change.
--
--     [@context@]: a pointer to an 'SDL_IOStream' structure.
--
--     [@ptr@]: a pointer to a buffer to read data into.
--
--     [@size@]: the number of bytes to read from the data source.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_IOStream
         -> BG.Ptr BG.Void
         -> HsBindgen.Runtime.LibC.CSize
         -> IO HsBindgen.Runtime.LibC.CSize
       )
sDL_ReadIO =
  BG.unsafePerformIO hs_bindgen_0c9d4db36a2719b6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteIO@
foreign import ccall unsafe "hs_bindgen_d9956d7898ea90e2"
  hs_bindgen_d9956d7898ea90e2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteIO@
hs_bindgen_d9956d7898ea90e2
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_IOStream
             -> PtrConst.PtrConst BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> IO HsBindgen.Runtime.LibC.CSize
           )
       )
hs_bindgen_d9956d7898ea90e2 =
  BG.fromFFIType hs_bindgen_d9956d7898ea90e2_base

{-# NOINLINE sDL_WriteIO #-}

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
--     [@context@]: a pointer to an 'SDL_IOStream' structure.
--
--     [@ptr@]: a pointer to a buffer containing data to write.
--
--     [@size@]: the number of bytes to write.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_IOStream
         -> PtrConst.PtrConst BG.Void
         -> HsBindgen.Runtime.LibC.CSize
         -> IO HsBindgen.Runtime.LibC.CSize
       )
sDL_WriteIO =
  BG.unsafePerformIO hs_bindgen_d9956d7898ea90e2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_FlushIO@
foreign import ccall unsafe "hs_bindgen_ae112d17ec9c64f0"
  hs_bindgen_ae112d17ec9c64f0_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_FlushIO@
hs_bindgen_ae112d17ec9c64f0 :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> IO BG.CBool))
hs_bindgen_ae112d17ec9c64f0 =
  BG.fromFFIType hs_bindgen_ae112d17ec9c64f0_base

{-# NOINLINE sDL_FlushIO #-}

-- | Flush any buffered data in the stream.
--
--     This function makes sure that any buffered data is written to the stream. Normally this isn\'t necessary but if the stream is a pipe or socket it guarantees that any pending data is sent.
--
--     [@context@]: 'SDL_IOStream' structure to flush.
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
sDL_FlushIO :: BG.FunPtr (BG.Ptr SDL_IOStream -> IO BG.CBool)
sDL_FlushIO =
  BG.unsafePerformIO hs_bindgen_ae112d17ec9c64f0

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_LoadFile_IO@
foreign import ccall unsafe "hs_bindgen_e46ab82952c4c1d4"
  hs_bindgen_e46ab82952c4c1d4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_LoadFile_IO@
hs_bindgen_e46ab82952c4c1d4
  :: IO
       ( BG.FunPtr
           (BG.Ptr SDL_IOStream -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> BG.CBool -> IO (BG.Ptr BG.Void))
       )
hs_bindgen_e46ab82952c4c1d4 =
  BG.fromFFIType hs_bindgen_e46ab82952c4c1d4_base

{-# NOINLINE sDL_LoadFile_IO #-}

-- | Load all the data from an SDL data stream.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with SDL_free().
--
--     [@src@]: the 'SDL_IOStream' to read all available data from.
--
--     [@datasize@]: a pointer filled in with the number of bytes read, may be NULL.
--
--     [@closeio@]: if true, calls @SDL_CloseIO()@ on @src@ before returning, even in the case of an error.
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
  :: BG.FunPtr
       (BG.Ptr SDL_IOStream -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> BG.CBool -> IO (BG.Ptr BG.Void))
sDL_LoadFile_IO =
  BG.unsafePerformIO hs_bindgen_e46ab82952c4c1d4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_LoadFile@
foreign import ccall unsafe "hs_bindgen_ea9bbd4467b9e2c6"
  hs_bindgen_ea9bbd4467b9e2c6_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_LoadFile@
hs_bindgen_ea9bbd4467b9e2c6
  :: IO
       (BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void)))
hs_bindgen_ea9bbd4467b9e2c6 =
  BG.fromFFIType hs_bindgen_ea9bbd4467b9e2c6_base

{-# NOINLINE sDL_LoadFile #-}

-- | Load all the data from a file path.
--
--     The data is allocated with a zero byte at the end (null terminated) for convenience. This extra byte is not included in the value reported via @datasize@.
--
--     The data should be freed with SDL_free().
--
--     [@file@]: the path to read all available data from.
--
--     [@datasize@]: if not NULL, will store the number of bytes read.
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
  :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> BG.Ptr HsBindgen.Runtime.LibC.CSize -> IO (BG.Ptr BG.Void))
sDL_LoadFile =
  BG.unsafePerformIO hs_bindgen_ea9bbd4467b9e2c6

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_SaveFile_IO@
foreign import ccall unsafe "hs_bindgen_de0267086f8fc295"
  hs_bindgen_de0267086f8fc295_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_SaveFile_IO@
hs_bindgen_de0267086f8fc295
  :: IO
       ( BG.FunPtr
           ( BG.Ptr SDL_IOStream
             -> PtrConst.PtrConst BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> BG.CBool
             -> IO BG.CBool
           )
       )
hs_bindgen_de0267086f8fc295 =
  BG.fromFFIType hs_bindgen_de0267086f8fc295_base

{-# NOINLINE sDL_SaveFile_IO #-}

-- | Save all the data into an SDL data stream.
--
--     [@src@]: the 'SDL_IOStream' to write all data to.
--
--     [@data@]: the data to be written. If datasize is 0, may be NULL or a invalid pointer.
--
--     [@datasize@]: the number of bytes to be written.
--
--     [@closeio@]: if true, calls @SDL_CloseIO()@ on @src@ before returning, even in the case of an error.
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
  :: BG.FunPtr
       ( BG.Ptr SDL_IOStream
         -> PtrConst.PtrConst BG.Void
         -> HsBindgen.Runtime.LibC.CSize
         -> BG.CBool
         -> IO BG.CBool
       )
sDL_SaveFile_IO =
  BG.unsafePerformIO hs_bindgen_de0267086f8fc295

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_SaveFile@
foreign import ccall unsafe "hs_bindgen_841c544344507810"
  hs_bindgen_841c544344507810_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_SaveFile@
hs_bindgen_841c544344507810
  :: IO
       ( BG.FunPtr
           ( PtrConst.PtrConst BG.CChar
             -> PtrConst.PtrConst BG.Void
             -> HsBindgen.Runtime.LibC.CSize
             -> IO BG.CBool
           )
       )
hs_bindgen_841c544344507810 =
  BG.fromFFIType hs_bindgen_841c544344507810_base

{-# NOINLINE sDL_SaveFile #-}

-- | Save all the data into a file path.
--
--     [@file@]: the path to write all available data into.
--
--     [@data@]: the data to be written. If datasize is 0, may be NULL or a invalid pointer.
--
--     [@datasize@]: the number of bytes to be written.
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
  :: BG.FunPtr
       ( PtrConst.PtrConst BG.CChar
         -> PtrConst.PtrConst BG.Void
         -> HsBindgen.Runtime.LibC.CSize
         -> IO BG.CBool
       )
sDL_SaveFile =
  BG.unsafePerformIO hs_bindgen_841c544344507810

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU8@
foreign import ccall unsafe "hs_bindgen_c304f9e2b3baf9dd"
  hs_bindgen_c304f9e2b3baf9dd_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU8@
hs_bindgen_c304f9e2b3baf9dd
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool))
hs_bindgen_c304f9e2b3baf9dd =
  BG.fromFFIType hs_bindgen_c304f9e2b3baf9dd_base

{-# NOINLINE sDL_ReadU8 #-}

-- | Use this function to read a byte from an 'SDL_IOStream'.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the 'SDL_IOStream' to read from.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on success or false on failure or EOF; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU8@, defined at @SDL3\/SDL_iostream.h 816:34@
sDL_ReadU8 :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool)
sDL_ReadU8 =
  BG.unsafePerformIO hs_bindgen_c304f9e2b3baf9dd

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS8@
foreign import ccall unsafe "hs_bindgen_c39406dce63371f8"
  hs_bindgen_c39406dce63371f8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS8@
hs_bindgen_c39406dce63371f8
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint8 -> IO BG.CBool))
hs_bindgen_c39406dce63371f8 =
  BG.fromFFIType hs_bindgen_c39406dce63371f8_base

{-# NOINLINE sDL_ReadS8 #-}

-- | Use this function to read a signed byte from an 'SDL_IOStream'.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the 'SDL_IOStream' to read from.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on success or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS8@, defined at @SDL3\/SDL_iostream.h 835:34@
sDL_ReadS8 :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint8 -> IO BG.CBool)
sDL_ReadS8 =
  BG.unsafePerformIO hs_bindgen_c39406dce63371f8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU16LE@
foreign import ccall unsafe "hs_bindgen_6849a0e565e7ac74"
  hs_bindgen_6849a0e565e7ac74_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU16LE@
hs_bindgen_6849a0e565e7ac74
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool))
hs_bindgen_6849a0e565e7ac74 =
  BG.fromFFIType hs_bindgen_6849a0e565e7ac74_base

{-# NOINLINE sDL_ReadU16LE #-}

-- | Use this function to read 16 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU16LE@, defined at @SDL3\/SDL_iostream.h 858:34@
sDL_ReadU16LE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
sDL_ReadU16LE =
  BG.unsafePerformIO hs_bindgen_6849a0e565e7ac74

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS16LE@
foreign import ccall unsafe "hs_bindgen_fe15c03a2323f8ee"
  hs_bindgen_fe15c03a2323f8ee_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS16LE@
hs_bindgen_fe15c03a2323f8ee
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool))
hs_bindgen_fe15c03a2323f8ee =
  BG.fromFFIType hs_bindgen_fe15c03a2323f8ee_base

{-# NOINLINE sDL_ReadS16LE #-}

-- | Use this function to read 16 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS16LE@, defined at @SDL3\/SDL_iostream.h 881:34@
sDL_ReadS16LE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool)
sDL_ReadS16LE =
  BG.unsafePerformIO hs_bindgen_fe15c03a2323f8ee

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU16BE@
foreign import ccall unsafe "hs_bindgen_04f5c88868a2821e"
  hs_bindgen_04f5c88868a2821e_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU16BE@
hs_bindgen_04f5c88868a2821e
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool))
hs_bindgen_04f5c88868a2821e =
  BG.fromFFIType hs_bindgen_04f5c88868a2821e_base

{-# NOINLINE sDL_ReadU16BE #-}

-- | Use this function to read 16 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU16BE@, defined at @SDL3\/SDL_iostream.h 904:34@
sDL_ReadU16BE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
sDL_ReadU16BE =
  BG.unsafePerformIO hs_bindgen_04f5c88868a2821e

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS16BE@
foreign import ccall unsafe "hs_bindgen_ab83010c5ae7ab35"
  hs_bindgen_ab83010c5ae7ab35_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS16BE@
hs_bindgen_ab83010c5ae7ab35
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool))
hs_bindgen_ab83010c5ae7ab35 =
  BG.fromFFIType hs_bindgen_ab83010c5ae7ab35_base

{-# NOINLINE sDL_ReadS16BE #-}

-- | Use this function to read 16 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS16BE@, defined at @SDL3\/SDL_iostream.h 927:34@
sDL_ReadS16BE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool)
sDL_ReadS16BE =
  BG.unsafePerformIO hs_bindgen_ab83010c5ae7ab35

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU32LE@
foreign import ccall unsafe "hs_bindgen_4dedf81005dea655"
  hs_bindgen_4dedf81005dea655_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU32LE@
hs_bindgen_4dedf81005dea655
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_4dedf81005dea655 =
  BG.fromFFIType hs_bindgen_4dedf81005dea655_base

{-# NOINLINE sDL_ReadU32LE #-}

-- | Use this function to read 32 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU32LE@, defined at @SDL3\/SDL_iostream.h 950:34@
sDL_ReadU32LE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_ReadU32LE =
  BG.unsafePerformIO hs_bindgen_4dedf81005dea655

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS32LE@
foreign import ccall unsafe "hs_bindgen_fffd09bacab3320d"
  hs_bindgen_fffd09bacab3320d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS32LE@
hs_bindgen_fffd09bacab3320d
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool))
hs_bindgen_fffd09bacab3320d =
  BG.fromFFIType hs_bindgen_fffd09bacab3320d_base

{-# NOINLINE sDL_ReadS32LE #-}

-- | Use this function to read 32 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS32LE@, defined at @SDL3\/SDL_iostream.h 973:34@
sDL_ReadS32LE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool)
sDL_ReadS32LE =
  BG.unsafePerformIO hs_bindgen_fffd09bacab3320d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU32BE@
foreign import ccall unsafe "hs_bindgen_42b0f1d027be0c67"
  hs_bindgen_42b0f1d027be0c67_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU32BE@
hs_bindgen_42b0f1d027be0c67
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_42b0f1d027be0c67 =
  BG.fromFFIType hs_bindgen_42b0f1d027be0c67_base

{-# NOINLINE sDL_ReadU32BE #-}

-- | Use this function to read 32 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU32BE@, defined at @SDL3\/SDL_iostream.h 996:34@
sDL_ReadU32BE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_ReadU32BE =
  BG.unsafePerformIO hs_bindgen_42b0f1d027be0c67

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS32BE@
foreign import ccall unsafe "hs_bindgen_97bc8b4d68748597"
  hs_bindgen_97bc8b4d68748597_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS32BE@
hs_bindgen_97bc8b4d68748597
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool))
hs_bindgen_97bc8b4d68748597 =
  BG.fromFFIType hs_bindgen_97bc8b4d68748597_base

{-# NOINLINE sDL_ReadS32BE #-}

-- | Use this function to read 32 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS32BE@, defined at @SDL3\/SDL_iostream.h 1019:34@
sDL_ReadS32BE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool)
sDL_ReadS32BE =
  BG.unsafePerformIO hs_bindgen_97bc8b4d68748597

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU64LE@
foreign import ccall unsafe "hs_bindgen_076f54bb27254ddb"
  hs_bindgen_076f54bb27254ddb_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU64LE@
hs_bindgen_076f54bb27254ddb
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO BG.CBool))
hs_bindgen_076f54bb27254ddb =
  BG.fromFFIType hs_bindgen_076f54bb27254ddb_base

{-# NOINLINE sDL_ReadU64LE #-}

-- | Use this function to read 64 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU64LE@, defined at @SDL3\/SDL_iostream.h 1042:34@
sDL_ReadU64LE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO BG.CBool)
sDL_ReadU64LE =
  BG.unsafePerformIO hs_bindgen_076f54bb27254ddb

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS64LE@
foreign import ccall unsafe "hs_bindgen_1aa96b5b13230b9b"
  hs_bindgen_1aa96b5b13230b9b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS64LE@
hs_bindgen_1aa96b5b13230b9b
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool))
hs_bindgen_1aa96b5b13230b9b =
  BG.fromFFIType hs_bindgen_1aa96b5b13230b9b_base

{-# NOINLINE sDL_ReadS64LE #-}

-- | Use this function to read 64 bits of little-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS64LE@, defined at @SDL3\/SDL_iostream.h 1065:34@
sDL_ReadS64LE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool)
sDL_ReadS64LE =
  BG.unsafePerformIO hs_bindgen_1aa96b5b13230b9b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU64BE@
foreign import ccall unsafe "hs_bindgen_b0379b9f20acb50b"
  hs_bindgen_b0379b9f20acb50b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadU64BE@
hs_bindgen_b0379b9f20acb50b
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO BG.CBool))
hs_bindgen_b0379b9f20acb50b =
  BG.fromFFIType hs_bindgen_b0379b9f20acb50b_base

{-# NOINLINE sDL_ReadU64BE #-}

-- | Use this function to read 64 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadU64BE@, defined at @SDL3\/SDL_iostream.h 1088:34@
sDL_ReadU64BE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO BG.CBool)
sDL_ReadU64BE =
  BG.unsafePerformIO hs_bindgen_b0379b9f20acb50b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS64BE@
foreign import ccall unsafe "hs_bindgen_91c79c6f23b10cea"
  hs_bindgen_91c79c6f23b10cea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_ReadS64BE@
hs_bindgen_91c79c6f23b10cea
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool))
hs_bindgen_91c79c6f23b10cea =
  BG.fromFFIType hs_bindgen_91c79c6f23b10cea_base

{-# NOINLINE sDL_ReadS64BE #-}

-- | Use this function to read 64 bits of big-endian data from an 'SDL_IOStream' and return in native format.
--
--     SDL byteswaps the data only if necessary, so the data returned will be in the native byte order.
--
--     This function will return false when the data stream is completely read, and @SDL_GetIOStatus()@ will return SDL_IO_STATUS_EOF. If false is returned and the stream is not at EOF, @SDL_GetIOStatus()@ will return a different error value and SDL_GetError() will offer a human-readable message.
--
--     [@src@]: the stream from which to read data.
--
--     [@value@]: a pointer filled in with the data read.
--
--     [Returns]: true on successful read or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_ReadS64BE@, defined at @SDL3\/SDL_iostream.h 1111:34@
sDL_ReadS64BE
  :: BG.FunPtr (BG.Ptr SDL_IOStream -> BG.Ptr SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool)
sDL_ReadS64BE =
  BG.unsafePerformIO hs_bindgen_91c79c6f23b10cea

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU8@
foreign import ccall unsafe "hs_bindgen_6a41201b6dedc01d"
  hs_bindgen_6a41201b6dedc01d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU8@
hs_bindgen_6a41201b6dedc01d
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool))
hs_bindgen_6a41201b6dedc01d =
  BG.fromFFIType hs_bindgen_6a41201b6dedc01d_base

{-# NOINLINE sDL_WriteU8 #-}

-- | Use this function to write a byte to an 'SDL_IOStream'.
--
--     [@dst@]: the 'SDL_IOStream' to write to.
--
--     [@value@]: the byte value to write.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU8@, defined at @SDL3\/SDL_iostream.h 1133:34@
sDL_WriteU8 :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint8 -> IO BG.CBool)
sDL_WriteU8 =
  BG.unsafePerformIO hs_bindgen_6a41201b6dedc01d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS8@
foreign import ccall unsafe "hs_bindgen_7779de5157457a4b"
  hs_bindgen_7779de5157457a4b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS8@
hs_bindgen_7779de5157457a4b
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint8 -> IO BG.CBool))
hs_bindgen_7779de5157457a4b =
  BG.fromFFIType hs_bindgen_7779de5157457a4b_base

{-# NOINLINE sDL_WriteS8 #-}

-- | Use this function to write a signed byte to an 'SDL_IOStream'.
--
--     [@dst@]: the 'SDL_IOStream' to write to.
--
--     [@value@]: the byte value to write.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS8@, defined at @SDL3\/SDL_iostream.h 1147:34@
sDL_WriteS8 :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint8 -> IO BG.CBool)
sDL_WriteS8 =
  BG.unsafePerformIO hs_bindgen_7779de5157457a4b

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU16LE@
foreign import ccall unsafe "hs_bindgen_d47e66728dda1cb5"
  hs_bindgen_d47e66728dda1cb5_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU16LE@
hs_bindgen_d47e66728dda1cb5
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool))
hs_bindgen_d47e66728dda1cb5 =
  BG.fromFFIType hs_bindgen_d47e66728dda1cb5_base

{-# NOINLINE sDL_WriteU16LE #-}

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU16LE@, defined at @SDL3\/SDL_iostream.h 1166:34@
sDL_WriteU16LE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
sDL_WriteU16LE =
  BG.unsafePerformIO hs_bindgen_d47e66728dda1cb5

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS16LE@
foreign import ccall unsafe "hs_bindgen_93f38ce5f51dbf43"
  hs_bindgen_93f38ce5f51dbf43_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS16LE@
hs_bindgen_93f38ce5f51dbf43
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool))
hs_bindgen_93f38ce5f51dbf43 =
  BG.fromFFIType hs_bindgen_93f38ce5f51dbf43_base

{-# NOINLINE sDL_WriteS16LE #-}

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS16LE@, defined at @SDL3\/SDL_iostream.h 1185:34@
sDL_WriteS16LE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool)
sDL_WriteS16LE =
  BG.unsafePerformIO hs_bindgen_93f38ce5f51dbf43

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU16BE@
foreign import ccall unsafe "hs_bindgen_e336b4900affdc95"
  hs_bindgen_e336b4900affdc95_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU16BE@
hs_bindgen_e336b4900affdc95
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool))
hs_bindgen_e336b4900affdc95 =
  BG.fromFFIType hs_bindgen_e336b4900affdc95_base

{-# NOINLINE sDL_WriteU16BE #-}

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU16BE@, defined at @SDL3\/SDL_iostream.h 1203:34@
sDL_WriteU16BE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint16 -> IO BG.CBool)
sDL_WriteU16BE =
  BG.unsafePerformIO hs_bindgen_e336b4900affdc95

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS16BE@
foreign import ccall unsafe "hs_bindgen_ae3652657a7f54ff"
  hs_bindgen_ae3652657a7f54ff_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS16BE@
hs_bindgen_ae3652657a7f54ff
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool))
hs_bindgen_ae3652657a7f54ff =
  BG.fromFFIType hs_bindgen_ae3652657a7f54ff_base

{-# NOINLINE sDL_WriteS16BE #-}

-- | Use this function to write 16 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS16BE@, defined at @SDL3\/SDL_iostream.h 1221:34@
sDL_WriteS16BE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint16 -> IO BG.CBool)
sDL_WriteS16BE =
  BG.unsafePerformIO hs_bindgen_ae3652657a7f54ff

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU32LE@
foreign import ccall unsafe "hs_bindgen_3eafe174eec9869a"
  hs_bindgen_3eafe174eec9869a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU32LE@
hs_bindgen_3eafe174eec9869a
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_3eafe174eec9869a =
  BG.fromFFIType hs_bindgen_3eafe174eec9869a_base

{-# NOINLINE sDL_WriteU32LE #-}

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU32LE@, defined at @SDL3\/SDL_iostream.h 1240:34@
sDL_WriteU32LE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_WriteU32LE =
  BG.unsafePerformIO hs_bindgen_3eafe174eec9869a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS32LE@
foreign import ccall unsafe "hs_bindgen_93d996acdc68faa4"
  hs_bindgen_93d996acdc68faa4_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS32LE@
hs_bindgen_93d996acdc68faa4
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool))
hs_bindgen_93d996acdc68faa4 =
  BG.fromFFIType hs_bindgen_93d996acdc68faa4_base

{-# NOINLINE sDL_WriteS32LE #-}

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS32LE@, defined at @SDL3\/SDL_iostream.h 1259:34@
sDL_WriteS32LE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool)
sDL_WriteS32LE =
  BG.unsafePerformIO hs_bindgen_93d996acdc68faa4

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU32BE@
foreign import ccall unsafe "hs_bindgen_b65faf115109388d"
  hs_bindgen_b65faf115109388d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU32BE@
hs_bindgen_b65faf115109388d
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool))
hs_bindgen_b65faf115109388d =
  BG.fromFFIType hs_bindgen_b65faf115109388d_base

{-# NOINLINE sDL_WriteU32BE #-}

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU32BE@, defined at @SDL3\/SDL_iostream.h 1277:34@
sDL_WriteU32BE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint32 -> IO BG.CBool)
sDL_WriteU32BE =
  BG.unsafePerformIO hs_bindgen_b65faf115109388d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS32BE@
foreign import ccall unsafe "hs_bindgen_dfe1b91f6dd8a3fa"
  hs_bindgen_dfe1b91f6dd8a3fa_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS32BE@
hs_bindgen_dfe1b91f6dd8a3fa
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool))
hs_bindgen_dfe1b91f6dd8a3fa =
  BG.fromFFIType hs_bindgen_dfe1b91f6dd8a3fa_base

{-# NOINLINE sDL_WriteS32BE #-}

-- | Use this function to write 32 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS32BE@, defined at @SDL3\/SDL_iostream.h 1295:34@
sDL_WriteS32BE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint32 -> IO BG.CBool)
sDL_WriteS32BE =
  BG.unsafePerformIO hs_bindgen_dfe1b91f6dd8a3fa

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU64LE@
foreign import ccall unsafe "hs_bindgen_2d1c699323094d03"
  hs_bindgen_2d1c699323094d03_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU64LE@
hs_bindgen_2d1c699323094d03
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO BG.CBool))
hs_bindgen_2d1c699323094d03 =
  BG.fromFFIType hs_bindgen_2d1c699323094d03_base

{-# NOINLINE sDL_WriteU64LE #-}

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU64LE@, defined at @SDL3\/SDL_iostream.h 1314:34@
sDL_WriteU64LE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO BG.CBool)
sDL_WriteU64LE =
  BG.unsafePerformIO hs_bindgen_2d1c699323094d03

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS64LE@
foreign import ccall unsafe "hs_bindgen_fe1f17e206d55f2a"
  hs_bindgen_fe1f17e206d55f2a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS64LE@
hs_bindgen_fe1f17e206d55f2a
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool))
hs_bindgen_fe1f17e206d55f2a =
  BG.fromFFIType hs_bindgen_fe1f17e206d55f2a_base

{-# NOINLINE sDL_WriteS64LE #-}

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as little-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in little-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS64LE@, defined at @SDL3\/SDL_iostream.h 1333:34@
sDL_WriteS64LE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool)
sDL_WriteS64LE =
  BG.unsafePerformIO hs_bindgen_fe1f17e206d55f2a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU64BE@
foreign import ccall unsafe "hs_bindgen_9dd43ac41e9a2bb2"
  hs_bindgen_9dd43ac41e9a2bb2_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteU64BE@
hs_bindgen_9dd43ac41e9a2bb2
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO BG.CBool))
hs_bindgen_9dd43ac41e9a2bb2 =
  BG.fromFFIType hs_bindgen_9dd43ac41e9a2bb2_base

{-# NOINLINE sDL_WriteU64BE #-}

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteU64BE@, defined at @SDL3\/SDL_iostream.h 1351:34@
sDL_WriteU64BE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Uint64 -> IO BG.CBool)
sDL_WriteU64BE =
  BG.unsafePerformIO hs_bindgen_9dd43ac41e9a2bb2

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS64BE@
foreign import ccall unsafe "hs_bindgen_fbc1776f62682806"
  hs_bindgen_fbc1776f62682806_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Iostream_get_SDL_WriteS64BE@
hs_bindgen_fbc1776f62682806
  :: IO (BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool))
hs_bindgen_fbc1776f62682806 =
  BG.fromFFIType hs_bindgen_fbc1776f62682806_base

{-# NOINLINE sDL_WriteS64BE #-}

-- | Use this function to write 64 bits in native format to an 'SDL_IOStream' as big-endian data.
--
--     SDL byteswaps the data only if necessary, so the application always specifies native format, and the data written will be in big-endian format.
--
--     [@dst@]: the stream to which data will be written.
--
--     [@value@]: the data to be written, in native format.
--
--     [Returns]: true on successful write or false on failure; call SDL_GetError() for more information.
--
--     [Thread safety]: Do not use the same 'SDL_IOStream' from two threads at once.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_WriteS64BE@, defined at @SDL3\/SDL_iostream.h 1369:34@
sDL_WriteS64BE :: BG.FunPtr (BG.Ptr SDL_IOStream -> SDL3.Sys.Bindgen.Stdinc.Sint64 -> IO BG.CBool)
sDL_WriteS64BE =
  BG.unsafePerformIO hs_bindgen_fbc1776f62682806
