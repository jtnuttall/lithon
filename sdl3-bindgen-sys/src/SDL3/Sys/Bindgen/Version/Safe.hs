{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Version.Safe (
  SDL3.Sys.Bindgen.Version.Safe.sDL_GetVersion,
  SDL3.Sys.Bindgen.Version.Safe.sDL_GetRevision,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_version.h>"
         , "signed int hs_bindgen_773c658657d9ec27 (void)"
         , "{"
         , "  return (SDL_GetVersion)();"
         , "}"
         , "char const *hs_bindgen_56f1110e8f8cc4a0 (void)"
         , "{"
         , "  return (SDL_GetRevision)();"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Version_Safe_SDL_GetVersion@
foreign import ccall safe "hs_bindgen_773c658657d9ec27"
  hs_bindgen_773c658657d9ec27_base
    :: IO BG.Int32

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Version_Safe_SDL_GetVersion@
hs_bindgen_773c658657d9ec27 :: IO BG.CInt
hs_bindgen_773c658657d9ec27 =
  BG.fromFFIType hs_bindgen_773c658657d9ec27_base

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
sDL_GetVersion :: IO BG.CInt
sDL_GetVersion = hs_bindgen_773c658657d9ec27

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Version_Safe_SDL_GetRevision@
foreign import ccall safe "hs_bindgen_56f1110e8f8cc4a0"
  hs_bindgen_56f1110e8f8cc4a0_base
    :: IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Version_Safe_SDL_GetRevision@
hs_bindgen_56f1110e8f8cc4a0 :: IO (PtrConst.PtrConst BG.CChar)
hs_bindgen_56f1110e8f8cc4a0 =
  BG.fromFFIType hs_bindgen_56f1110e8f8cc4a0_base

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
sDL_GetRevision :: IO (PtrConst.PtrConst BG.CChar)
sDL_GetRevision = hs_bindgen_56f1110e8f8cc4a0
