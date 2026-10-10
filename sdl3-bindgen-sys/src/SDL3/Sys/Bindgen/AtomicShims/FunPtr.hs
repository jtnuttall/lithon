{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.AtomicShims.FunPtr (
  SDL3.Sys.Bindgen.AtomicShims.FunPtr.lithon_SDL_AtomicIncRef,
  SDL3.Sys.Bindgen.AtomicShims.FunPtr.lithon_SDL_AtomicDecRef,
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
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_get_lithon_SDL_AtomicIncRef */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_d91e850bfd3ae06a (void)) ("
         , "  SDL_AtomicInt *arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_AtomicIncRef;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_get_lithon_SDL_AtomicDecRef */"
         , "__attribute__ ((const))"
         , "_Bool (*hs_bindgen_3bf2290199609fea (void)) ("
         , "  SDL_AtomicInt *arg1"
         , ")"
         , "{"
         , "  return &lithon_SDL_AtomicDecRef;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_get_lithon_SDL_AtomicIncRef@
foreign import ccall unsafe "hs_bindgen_d91e850bfd3ae06a"
  hs_bindgen_d91e850bfd3ae06a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_get_lithon_SDL_AtomicIncRef@
hs_bindgen_d91e850bfd3ae06a
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt -> IO BG.CInt))
hs_bindgen_d91e850bfd3ae06a =
  fmap BG.fromFFIType hs_bindgen_d91e850bfd3ae06a_base

{-# NOINLINE lithon_SDL_AtomicIncRef #-}

-- | Increment an atomic variable used as a reference count.
--
--     The SDL_AtomicIncRef macro as a function.
--
--     [@a@]: a pointer to an SDL_AtomicInt to increment.
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
lithon_SDL_AtomicIncRef :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt -> IO BG.CInt)
lithon_SDL_AtomicIncRef =
  BG.unsafePerformIO hs_bindgen_d91e850bfd3ae06a

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_get_lithon_SDL_AtomicDecRef@
foreign import ccall unsafe "hs_bindgen_3bf2290199609fea"
  hs_bindgen_3bf2290199609fea_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.AtomicShims_get_lithon_SDL_AtomicDecRef@
hs_bindgen_3bf2290199609fea
  :: IO (BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt -> IO BG.CBool))
hs_bindgen_3bf2290199609fea =
  fmap BG.fromFFIType hs_bindgen_3bf2290199609fea_base

{-# NOINLINE lithon_SDL_AtomicDecRef #-}

-- | Decrement an atomic variable used as a reference count.
--
--     The SDL_AtomicDecRef macro as a function.
--
--     [@a@]: a pointer to an SDL_AtomicInt to decrement.
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
lithon_SDL_AtomicDecRef :: BG.FunPtr (BG.Ptr SDL3.Sys.Bindgen.Atomic.SDL_AtomicInt -> IO BG.CBool)
lithon_SDL_AtomicDecRef =
  BG.unsafePerformIO hs_bindgen_3bf2290199609fea
