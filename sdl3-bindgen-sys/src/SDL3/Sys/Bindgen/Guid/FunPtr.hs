{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Guid.FunPtr (
  SDL3.Sys.Bindgen.Guid.FunPtr.sDL_GUIDToString,
  SDL3.Sys.Bindgen.Guid.FunPtr.sDL_StringToGUID,
)
where

import HsBindgen.Runtime.PtrConst qualified as PtrConst
import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Guid

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_guid.h>"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Guid_get_SDL_GUIDToString */"
         , "__attribute__ ((const))"
         , "void (*hs_bindgen_b89f8bb369b8de4d (void)) ("
         , "  SDL_GUID arg1,"
         , "  char *arg2,"
         , "  signed int arg3"
         , ")"
         , "{"
         , "  return &SDL_GUIDToString;"
         , "}"
         , "/* sdl3bindgensys_SDL3.Sys.Bindgen.Guid_get_SDL_StringToGUID */"
         , "__attribute__ ((const))"
         , "SDL_GUID (*hs_bindgen_0ce736a26b941e7b (void)) ("
         , "  char const *arg1"
         , ")"
         , "{"
         , "  return &SDL_StringToGUID;"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Guid_get_SDL_GUIDToString@
foreign import ccall unsafe "hs_bindgen_b89f8bb369b8de4d"
  hs_bindgen_b89f8bb369b8de4d_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Guid_get_SDL_GUIDToString@
hs_bindgen_b89f8bb369b8de4d :: IO (BG.FunPtr (SDL_GUID -> BG.Ptr BG.CChar -> BG.CInt -> IO ()))
hs_bindgen_b89f8bb369b8de4d =
  BG.fromFFIType hs_bindgen_b89f8bb369b8de4d_base

{-# NOINLINE sDL_GUIDToString #-}

-- | Get an ASCII string representation for a given 'SDL_GUID'.
--
--     [@guid@]: the 'SDL_GUID' you wish to convert to string.
--
--     [@pszGUID@]: buffer in which to write the ASCII string.
--
--     [@cbGUID@]: the size of pszGUID, should be at least 33 bytes.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_StringToGUID'
--
--     [C declaration]: @SDL_GUIDToString@, defined at @SDL3\/SDL_guid.h 80:34@
sDL_GUIDToString :: BG.FunPtr (SDL_GUID -> BG.Ptr BG.CChar -> BG.CInt -> IO ())
sDL_GUIDToString =
  BG.unsafePerformIO hs_bindgen_b89f8bb369b8de4d

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Guid_get_SDL_StringToGUID@
foreign import ccall unsafe "hs_bindgen_0ce736a26b941e7b"
  hs_bindgen_0ce736a26b941e7b_base
    :: IO (BG.FunPtr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Guid_get_SDL_StringToGUID@
hs_bindgen_0ce736a26b941e7b :: IO (BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL_GUID))
hs_bindgen_0ce736a26b941e7b =
  BG.fromFFIType hs_bindgen_0ce736a26b941e7b_base

{-# NOINLINE sDL_StringToGUID #-}

-- | Convert a GUID string into a 'SDL_GUID' structure.
--
--     Performs no error checking. If this function is given a string containing an invalid GUID, the function will silently succeed, but the GUID generated will not be useful.
--
--     [@pchGUID@]: string containing an ASCII representation of a GUID.
--
--     [Returns]: a 'SDL_GUID' structure.
--
--     [Thread safety]: It is safe to call this function from any thread.
--
--     @since 3.2.0
--
--     [See also]: 'sDL_GUIDToString'
--
--     [C declaration]: @SDL_StringToGUID@, defined at @SDL3\/SDL_guid.h 98:38@
sDL_StringToGUID :: BG.FunPtr (PtrConst.PtrConst BG.CChar -> IO SDL_GUID)
sDL_StringToGUID =
  BG.unsafePerformIO hs_bindgen_0ce736a26b941e7b
