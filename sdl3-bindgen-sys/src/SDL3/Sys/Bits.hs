-- | Functions for fiddling with bits and bitmasks. Get the index of the most significant (set) bit in a 32-bit number.
--
--     Result is undefined when called with 0. This operation can also be stated as \"count leading zeroes\" and \"log base 2\".
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [@x@]: the 32-bit value to examine.
--
--     [Returns]: the index of the most significant bit, or -1 if the value is 0.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Bits.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Bits (
  -- * Function aliases
  SDL3.Sys.Bits.mostSignificantBitIndex32,
  SDL3.Sys.Bits.mostSignificantBitIndex32Safe,
  SDL3.Sys.Bits.hasExactlyOneBitSet32,
  SDL3.Sys.Bits.hasExactlyOneBitSet32Safe,
)
where

import Data.Coerce qualified as Coerce

import HsBindgen.Runtime.CBool qualified as CBool
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Bits.Safe qualified as Safe
import SDL3.Sys.Bindgen.Bits.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_MostSignificantBitIndex32@.
--                   The safe flavor is 'mostSignificantBitIndex32Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MostSignificantBitIndex32@, defined at @SDL3\/SDL_bits.h 66:22@
mostSignificantBitIndex32
  :: BG.Word32
  -- ^ [C declaration]: @x@
  -> IO BG.Int32
mostSignificantBitIndex32 =
  \x00 ->
    fmap Coerce.coerce (Unsafe.sDL_MostSignificantBitIndex32 (Coerce.coerce x00))

-- |
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_MostSignificantBitIndex32@.
--                   The unsafe flavor is 'mostSignificantBitIndex32'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_MostSignificantBitIndex32@, defined at @SDL3\/SDL_bits.h 66:22@
mostSignificantBitIndex32Safe
  :: BG.Word32
  -- ^ [C declaration]: @x@
  -> IO BG.Int32
mostSignificantBitIndex32Safe =
  \x00 ->
    fmap Coerce.coerce (Safe.sDL_MostSignificantBitIndex32 (Coerce.coerce x00))

-- | Determine if a unsigned 32-bit value has exactly one bit set.
--
--     If there are no bits set (@x@ is zero), or more than one bit set, this returns false. If any one bit is exclusively set, this returns true.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: true if exactly one bit is set in @x@, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_HasExactlyOneBitSet32@.
--                   The safe flavor is 'hasExactlyOneBitSet32Safe'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasExactlyOneBitSet32@, defined at @SDL3\/SDL_bits.h 133:23@
hasExactlyOneBitSet32
  :: BG.Word32
  -- ^
  --
  --           [@x@]: the 32-bit value to examine.
  -> IO Bool
hasExactlyOneBitSet32 =
  \x00 ->
    fmap CBool.toBool (Unsafe.sDL_HasExactlyOneBitSet32 (Coerce.coerce x00))

-- | Determine if a unsigned 32-bit value has exactly one bit set.
--
--     If there are no bits set (@x@ is zero), or more than one bit set, this returns false. If any one bit is exclusively set, this returns true.
--
--     Note that this is a forced-inline function in a header, and not a public API function available in the SDL library (which is to say, the code is embedded in the calling program and the linker and dynamic loader will not be able to find this function inside SDL itself).
--
--     [Returns]: true if exactly one bit is set in @x@, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_HasExactlyOneBitSet32@.
--                   The unsafe flavor is 'hasExactlyOneBitSet32'
--                   .
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @SDL_HasExactlyOneBitSet32@, defined at @SDL3\/SDL_bits.h 133:23@
hasExactlyOneBitSet32Safe
  :: BG.Word32
  -- ^
  --
  --           [@x@]: the 32-bit value to examine.
  -> IO Bool
hasExactlyOneBitSet32Safe =
  \x00 ->
    fmap CBool.toBool (Safe.sDL_HasExactlyOneBitSet32 (Coerce.coerce x00))
