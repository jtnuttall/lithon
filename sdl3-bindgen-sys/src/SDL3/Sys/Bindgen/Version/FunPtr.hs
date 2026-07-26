{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Version.FunPtr (
  SDL3.Sys.Bindgen.Version.FunPtr.sDL_GetVersion,
  SDL3.Sys.Bindgen.Version.FunPtr.sDL_GetRevision,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_version.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Version_get_SDL_GetVersion */"
         , "__attribute__ ((const))"
         , "signed int (*hs_bindgen_44ed10f40287cec8 (void)) (void)"
         , "{"
         , "  return &SDL_GetVersion;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Version_get_SDL_GetRevision */"
         , "__attribute__ ((const))"
         , "char const *(*hs_bindgen_e9f711a7185d859a (void)) (void)"
         , "{"
         , "  return &SDL_GetRevision;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Version_get_SDL_GetVersion@
foreign import ccall unsafe "hs_bindgen_44ed10f40287cec8"
  hs_bindgen_44ed10f40287cec8_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Version_get_SDL_GetVersion@
hs_bindgen_44ed10f40287cec8 :: IO (BG.FunPtr (IO BG.CInt))
hs_bindgen_44ed10f40287cec8 =
  BG.fromFFIType hs_bindgen_44ed10f40287cec8_base

{-# NOINLINE sDL_GetVersion #-}

-- | Get the version of SDL that is linked against your program.
--
--     If you are linking to SDL dynamically, then it is possible that the current version will be different than the version you compiled against. This function returns the current version, while SDL_VERSION is the version you compiled with.
--
--     This function may be called safely at any time, even before SDL_Init().
--
--     [Returns]: the version of the linked library.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetRevision'
--
--     [C declaration]: @SDL_GetVersion@, defined at @SDL3\/SDL_version.h 160:33@
sDL_GetVersion :: BG.FunPtr (IO BG.CInt)
sDL_GetVersion =
  BG.unsafePerformIO hs_bindgen_44ed10f40287cec8

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Version_get_SDL_GetRevision@
foreign import ccall unsafe "hs_bindgen_e9f711a7185d859a"
  hs_bindgen_e9f711a7185d859a_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Version_get_SDL_GetRevision@
hs_bindgen_e9f711a7185d859a :: IO (BG.FunPtr (IO (PtrConst.PtrConst BG.CChar)))
hs_bindgen_e9f711a7185d859a =
  BG.fromFFIType hs_bindgen_e9f711a7185d859a_base

{-# NOINLINE sDL_GetRevision #-}

-- | Get the code revision of the SDL library that is linked against your program.
--
--     This value is the revision of the code you are linking against and may be different from the code you are compiling with, which is found in the constant SDL_REVISION if you explicitly include SDL_revision.h
--
--     The revision is an arbitrary string (a hash value) uniquely identifying the exact revision of the SDL library in use, and is only useful in comparing against other revisions. It is NOT an incrementing number.
--
--     If SDL wasn\'t built from a git repository with the appropriate tools, this will return an empty string.
--
--     You shouldn\'t use this function for anything but logging it for debugging purposes. The string is not intended to be reliable in any way.
--
--     [Returns]: an arbitrary string, uniquely identifying the exact revision of the SDL library in use.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GetVersion'
--
--     [C declaration]: @SDL_GetRevision@, defined at @SDL3\/SDL_version.h 189:42@
sDL_GetRevision :: BG.FunPtr (IO (PtrConst.PtrConst BG.CChar))
sDL_GetRevision =
  BG.unsafePerformIO hs_bindgen_e9f711a7185d859a
