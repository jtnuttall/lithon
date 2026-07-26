{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | This header allows you to annotate your code so external tools know about dynamic shared library dependencies.
--
--     If you determine that your toolchain doesn\'t support dlopen notes, you can disable this feature by defining @SDL_DISABLE_DLOPEN_NOTES@. You can use this CMake snippet to check for support:
--
--     Use this macro with @SDL_ELF_NOTE_DLOPEN()@ to note that a dynamic shared library dependency is optional.
--
--     @
--     include(CheckCSourceCompiles)
--     find_package(SDL3 REQUIRED CONFIG COMPONENTS Headers)
--     list(APPEND CMAKE_REQUIRED_LIBRARIES SDL3::Headers)
--     check_c_source_compiles([==[
--       \#include \<SDL3\/SDL_dlopennote.h>
--       SDL_ELF_NOTE_DLOPEN(\"sdl-video\",
--         \"Support for video through SDL\",
--         SDL_ELF_NOTE_DLOPEN_PRIORITY_SUGGESTED,
--         \"libSDL-1.2.so.0\", \"libSDL-2.0.so.0\", \"libSDL3.so.0\"
--       )
--       int main(int argc, char *argv[]) {
--         return argc + argv[0][1];
--       }
--     ]==] COMPILER_SUPPORTS_SDL_ELF_NOTE_DLOPEN)
--     if(NOT COMPILER_SUPPORTS_SDL_ELF_NOTE_DLOPEN)
--       add_compile_definitions(-DSDL_DISABLE_DLOPEN_NOTE)
--     endif()
--     @
--
--     Optional functionality uses the dependency, the binary will work and the dependency is only needed for full-featured installations.
--
--     @since 3.4.0
--
--     [See also]: @SDL_ELF_NOTE_DLOPEN@, 'sDL_ELF_NOTE_DLOPEN_PRIORITY_RECOMMENDED', 'sDL_ELF_NOTE_DLOPEN_PRIORITY_REQUIRED'
module SDL3.Sys.Bindgen.Dlopennote (
  SDL3.Sys.Bindgen.Dlopennote.sDL_ELF_NOTE_DLOPEN_PRIORITY_SUGGESTED,
  SDL3.Sys.Bindgen.Dlopennote.sDL_ELF_NOTE_DLOPEN_PRIORITY_RECOMMENDED,
  SDL3.Sys.Bindgen.Dlopennote.sDL_ELF_NOTE_DLOPEN_PRIORITY_REQUIRED,
)
where

import HsBindgen.Runtime.Support qualified as BG

-- | [C declaration]: @macro SDL_ELF_NOTE_DLOPEN_PRIORITY_SUGGESTED@, literal @\"suggested\"@, defined at @SDL3\/SDL_dlopennote.h 71:9@
sDL_ELF_NOTE_DLOPEN_PRIORITY_SUGGESTED :: BG.ByteString
sDL_ELF_NOTE_DLOPEN_PRIORITY_SUGGESTED =
  BG.pack [0x73, 0x75, 0x67, 0x67, 0x65, 0x73, 0x74, 0x65, 0x64]

-- | Use this macro with @SDL_ELF_NOTE_DLOPEN()@ to note that a dynamic shared library dependency is recommended.
--
--     Important functionality needs the dependency, the binary will work but in most cases the dependency should be provided.
--
--     @since 3.4.0
--
--     [See also]: @SDL_ELF_NOTE_DLOPEN@, 'sDL_ELF_NOTE_DLOPEN_PRIORITY_SUGGESTED', 'sDL_ELF_NOTE_DLOPEN_PRIORITY_REQUIRED'
--
--     [C declaration]: @macro SDL_ELF_NOTE_DLOPEN_PRIORITY_RECOMMENDED@, literal @\"recommended\"@, defined at @SDL3\/SDL_dlopennote.h 86:9@
sDL_ELF_NOTE_DLOPEN_PRIORITY_RECOMMENDED :: BG.ByteString
sDL_ELF_NOTE_DLOPEN_PRIORITY_RECOMMENDED =
  BG.pack [0x72, 0x65, 0x63, 0x6F, 0x6D, 0x6D, 0x65, 0x6E, 0x64, 0x65, 0x64]

-- | Use this macro with @SDL_ELF_NOTE_DLOPEN()@ to note that a dynamic shared library dependency is required.
--
--     Core functionality needs the dependency, the binary will not work if it cannot be found.
--
--     @since 3.4.0
--
--     [See also]: @SDL_ELF_NOTE_DLOPEN@, 'sDL_ELF_NOTE_DLOPEN_PRIORITY_SUGGESTED', 'sDL_ELF_NOTE_DLOPEN_PRIORITY_RECOMMENDED'
--
--     [C declaration]: @macro SDL_ELF_NOTE_DLOPEN_PRIORITY_REQUIRED@, literal @\"required\"@, defined at @SDL3\/SDL_dlopennote.h 101:9@
sDL_ELF_NOTE_DLOPEN_PRIORITY_REQUIRED :: BG.ByteString
sDL_ELF_NOTE_DLOPEN_PRIORITY_REQUIRED =
  BG.pack [0x72, 0x65, 0x71, 0x75, 0x69, 0x72, 0x65, 0x64]
