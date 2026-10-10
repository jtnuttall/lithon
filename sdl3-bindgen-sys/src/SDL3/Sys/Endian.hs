{-# LANGUAGE NoImplicitPrelude #-}

-- | Functions for reading and writing endian-specific values.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Endian.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     The C shims are functions this package defines in C over what the FFI cannot call directly (variadic functions, function-like macros), each named after what it wraps; the same flavor rules apply. Their raw imports live under "SDL3.Sys.Bindgen.EndianShims".
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Endian (
  module SDL3.Sys.Bindgen.Endian,

  -- * Function aliases
  SDL3.Sys.Endian.swapFloat,

  -- * C shims
  SDL3.Sys.Endian.swap16,
  SDL3.Sys.Endian.swap32,
  SDL3.Sys.Endian.swap64,
  SDL3.Sys.Endian.swap16LE,
  SDL3.Sys.Endian.swap32LE,
  SDL3.Sys.Endian.swap64LE,
  SDL3.Sys.Endian.swapFloatLE,
  SDL3.Sys.Endian.swap16BE,
  SDL3.Sys.Endian.swap32BE,
  SDL3.Sys.Endian.swap64BE,
  SDL3.Sys.Endian.swapFloatBE,
)
where

import Data.Coerce qualified as Coerce
import Prelude (Float, IO, fmap)

import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Endian
import SDL3.Sys.Bindgen.Endian.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.EndianShims.Unsafe qualified as Unsafe
import SDL3.Sys.Bindgen.Stdinc qualified

-- | Byte-swap a floating point number.
--
--     This will always byte-swap the value, whether it\'s currently in the native byteorder of the system or not. You should use 'swapFloatLE' or 'swapFloatBE' instead, in most cases.
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

-- | Byte-swap an unsigned 16-bit number.
--
--     The SDL_Swap16 macro as a function. It always byte-swaps the value, whatever the system\'s byte order; 'swap16LE' or 'swap16BE' are what you want in most cases.
--
--     [Returns]: @x@, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Swap16@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Swap16@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 38:26@
swap16
  :: BG.Word16
  -- ^
  --
  --           [@x@]: the value to byte-swap.
  -> IO BG.Word16
swap16 =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_Swap16 (Coerce.coerce x00))

-- | Byte-swap an unsigned 32-bit number.
--
--     The SDL_Swap32 macro as a function. It always byte-swaps the value, whatever the system\'s byte order; 'swap32LE' or 'swap32BE' are what you want in most cases.
--
--     [Returns]: @x@, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Swap32@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Swap32@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 57:26@
swap32
  :: BG.Word32
  -- ^
  --
  --           [@x@]: the value to byte-swap.
  -> IO BG.Word32
swap32 =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_Swap32 (Coerce.coerce x00))

-- | Byte-swap an unsigned 64-bit number.
--
--     The SDL_Swap64 macro as a function. It always byte-swaps the value, whatever the system\'s byte order; 'swap64LE' or 'swap64BE' are what you want in most cases.
--
--     [Returns]: @x@, with its bytes in the opposite endian order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Swap64@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Swap64@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 76:26@
swap64
  :: BG.Word64
  -- ^
  --
  --           [@x@]: the value to byte-swap.
  -> IO BG.Word64
swap64 =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_Swap64 (Coerce.coerce x00))

-- | Swap a 16-bit value from littleendian to native byte order.
--
--     The SDL_Swap16LE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Swap16LE@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Swap16LE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 94:26@
swap16LE
  :: BG.Word16
  -- ^
  --
  --           [@x@]: the value to swap, in littleendian byte order.
  -> IO BG.Word16
swap16LE =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_Swap16LE (Coerce.coerce x00))

-- | Swap a 32-bit value from littleendian to native byte order.
--
--     The SDL_Swap32LE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Swap32LE@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Swap32LE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 112:26@
swap32LE
  :: BG.Word32
  -- ^
  --
  --           [@x@]: the value to swap, in littleendian byte order.
  -> IO BG.Word32
swap32LE =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_Swap32LE (Coerce.coerce x00))

-- | Swap a 64-bit value from littleendian to native byte order.
--
--     The SDL_Swap64LE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Swap64LE@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Swap64LE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 130:26@
swap64LE
  :: BG.Word64
  -- ^
  --
  --           [@x@]: the value to swap, in littleendian byte order.
  -> IO BG.Word64
swap64LE =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_Swap64LE (Coerce.coerce x00))

-- | Swap a floating point value from littleendian to native byte order.
--
--     The SDL_SwapFloatLE macro as a function. If this is running on a littleendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_SwapFloatLE@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_SwapFloatLE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 148:25@
swapFloatLE
  :: Float
  -- ^
  --
  --           [@x@]: the value to swap, in littleendian byte order.
  -> IO Float
swapFloatLE =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_SwapFloatLE (Coerce.coerce x00))

-- | Swap a 16-bit value from bigendian to native byte order.
--
--     The SDL_Swap16BE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Swap16BE@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Swap16BE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 166:26@
swap16BE
  :: BG.Word16
  -- ^
  --
  --           [@x@]: the value to swap, in bigendian byte order.
  -> IO BG.Word16
swap16BE =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_Swap16BE (Coerce.coerce x00))

-- | Swap a 32-bit value from bigendian to native byte order.
--
--     The SDL_Swap32BE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Swap32BE@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Swap32BE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 184:26@
swap32BE
  :: BG.Word32
  -- ^
  --
  --           [@x@]: the value to swap, in bigendian byte order.
  -> IO BG.Word32
swap32BE =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_Swap32BE (Coerce.coerce x00))

-- | Swap a 64-bit value from bigendian to native byte order.
--
--     The SDL_Swap64BE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_Swap64BE@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_Swap64BE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 202:26@
swap64BE
  :: BG.Word64
  -- ^
  --
  --           [@x@]: the value to swap, in bigendian byte order.
  -> IO BG.Word64
swap64BE =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_Swap64BE (Coerce.coerce x00))

-- | Swap a floating point value from bigendian to native byte order.
--
--     The SDL_SwapFloatBE macro as a function. If this is running on a bigendian system, @x@ is returned unchanged.
--
--     [Returns]: @x@ in native byte order.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @lithon_SDL_SwapFloatBE@.
--                   The safe import is not exported
--                   : pure bit manipulation on an immediate value; cannot block, lock, or call back.
--
--     [Scalars]: The binding generation has mapped C scalars to native Haskell scalars for this function.
--                Pointers and structs are untouched by this best-effort mapping. Higher-level bindings are expected to map structs and pointers as appropriate.
--
--     [C declaration]: @lithon_SDL_SwapFloatBE@, defined at @sdl3-bindgen-sys\/SDL_endian_shims.h 220:25@
swapFloatBE
  :: Float
  -- ^
  --
  --           [@x@]: the value to swap, in bigendian byte order.
  -> IO Float
swapFloatBE =
  \x00 ->
    fmap Coerce.coerce (Unsafe.lithon_SDL_SwapFloatBE (Coerce.coerce x00))
