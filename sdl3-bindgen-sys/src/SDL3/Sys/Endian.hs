-- | Functions for reading and writing endian-specific values.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Endian.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Endian (
  module SDL3.Sys.Bindgen.Endian,

  -- * Function aliases
  SDL3.Sys.Endian.swapFloat,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.LibC qualified
import SDL3.Sys.Bindgen.Endian
import SDL3.Sys.Bindgen.Endian.Unsafe qualified as Unsafe

-- | Byte-swap a floating point number.
--
--     This will always byte-swap the value, whether it\'s currently in the native byteorder of the system or not. You should use SDL_SwapFloatLE or SDL_SwapFloatBE instead, in most cases.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: x, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_SwapFloat@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_SwapFloat@, defined at @SDL3\/SDL_endian.h 408:24@
swapFloat
  :: Float
  -- ^
  --
  --           [@x@]: the value to byte-swap.
  -> IO Float
swapFloat =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_SwapFloat (Coerce.coerce x00))
