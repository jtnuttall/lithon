{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.AtomicShims.Unsafe (
  SDL3.Sys.Bindgen.AtomicShims.Unsafe.lithon_SDL_AtomicIncRef,
  SDL3.Sys.Bindgen.AtomicShims.Unsafe.lithon_SDL_AtomicDecRef,
)
where

import Prelude (IO, fmap)

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Atomic qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#define SDL_MAIN_HANDLED"
         , "#define SDL_SLOW_MEMCPY"
         , "#define SDL_SLOW_MEMMOVE"
         , "#define SDL_SLOW_MEMSET"
         , "#include <sdl3-bindgen-sys/SDL_atomic_shims.h>"
         , "signed int hs_bindgen_2bbc525ff65f8e15 ("
         , "  SDL_AtomicInt *arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_AtomicIncRef)(arg1);"
         , "}"
         , "_Bool hs_bindgen_848dcd1814dd10a0 ("
         , "  SDL_AtomicInt *arg1"
         , ")"
         , "{"
         , "  return (lithon_SDL_AtomicDecRef)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_Unsafe_lithon_SDL_AtomicIncRef@
foreign import ccall unsafe "hs_bindgen_2bbc525ff65f8e15"
  hs_bindgen_2bbc525ff65f8e15_base
    :: BG.Ptr BG.Void
    -> IO BG.CInt

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_Unsafe_lithon_SDL_AtomicIncRef@
hs_bindgen_2bbc525ff65f8e15
  :: BG.Ptr SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt
  -> IO BG.CInt
hs_bindgen_2bbc525ff65f8e15 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_2bbc525ff65f8e15_base (BG.toFFIType x0))

-- | Increment an atomic variable used as a reference count.
--
--     The SDL_AtomicIncRef macro as a function.
--
--     [Returns]: the previous value of the atomic variable.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_AtomicDecRef
--
--     [C declaration]: @lithon_SDL_AtomicIncRef@, defined at @sdl3-bindgen-sys\/SDL_atomic_shims.h 38:23@
lithon_SDL_AtomicIncRef
  :: BG.Ptr SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an SDL_AtomicInt to increment.
  -> IO BG.CInt
lithon_SDL_AtomicIncRef = hs_bindgen_2bbc525ff65f8e15

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_Unsafe_lithon_SDL_AtomicDecRef@
foreign import ccall unsafe "hs_bindgen_848dcd1814dd10a0"
  hs_bindgen_848dcd1814dd10a0_base
    :: BG.Ptr BG.Void
    -> IO BG.CBool

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_Unsafe_lithon_SDL_AtomicDecRef@
hs_bindgen_848dcd1814dd10a0
  :: BG.Ptr SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt
  -> IO BG.CBool
hs_bindgen_848dcd1814dd10a0 =
  \x0 ->
    fmap BG.fromFFIType (hs_bindgen_848dcd1814dd10a0_base (BG.toFFIType x0))

-- | Decrement an atomic variable used as a reference count.
--
--     The SDL_AtomicDecRef macro as a function.
--
--     [Returns]: true if the variable reached zero after decrementing, false otherwise.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: SDL_AtomicIncRef
--
--     [C declaration]: @lithon_SDL_AtomicDecRef@, defined at @sdl3-bindgen-sys\/SDL_atomic_shims.h 58:24@
lithon_SDL_AtomicDecRef
  :: BG.Ptr SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt
  -- ^
  --
  --           [@a@]: a pointer to an SDL_AtomicInt to decrement.
  -> IO BG.CBool
lithon_SDL_AtomicDecRef = hs_bindgen_848dcd1814dd10a0
