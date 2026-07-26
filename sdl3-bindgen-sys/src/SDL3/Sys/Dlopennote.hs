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
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Dlopennote.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Dlopennote (
  module SDL3.Sys.Bindgen.Dlopennote,
)
where

import SDL3.Sys.Bindgen.Dlopennote
