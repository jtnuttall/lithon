{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# OPTIONS_HADDOCK prune #-}

module SDL3.Sys.Bindgen.Locale.Safe (
  SDL3.Sys.Bindgen.Locale.Safe.sDL_GetPreferredLocales,
)
where

import HsBindgen.Runtime.Support qualified as BG
import HsBindgen.Runtime.Support.CAPI qualified
import SDL3.Sys.Bindgen.Locale

$( HsBindgen.Runtime.Support.CAPI.addCSource
     ( HsBindgen.Runtime.Support.CAPI.unlines
         [ "#include <SDL3/SDL_locale.h>"
         , "SDL_Locale **hs_bindgen_3153090c14b68521 ("
         , "  signed int *arg1"
         , ")"
         , "{"
         , "  return (SDL_GetPreferredLocales)(arg1);"
         , "}"
         ]
     )
 )

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Locale_Safe_SDL_GetPreferredLocales@
foreign import ccall safe "hs_bindgen_3153090c14b68521"
  hs_bindgen_3153090c14b68521_base
    :: BG.Ptr BG.Void
    -> IO (BG.Ptr BG.Void)

-- __unique:__ @sdl3bindgensys_SDL3.Sys.Bindgen.Locale_Safe_SDL_GetPreferredLocales@
hs_bindgen_3153090c14b68521
  :: BG.Ptr BG.CInt
  -> IO (BG.Ptr (BG.Ptr SDL_Locale))
hs_bindgen_3153090c14b68521 =
  BG.fromFFIType hs_bindgen_3153090c14b68521_base

-- | Report the user\'s preferred locale.
--
--     Returned language strings are in the format xx, where \'xx\' is an ISO-639 language specifier (such as \"en\" for English, \"de\" for German, etc). Country strings are in the format YY, where \"YY\" is an ISO-3166 country code (such as \"US\" for the United States, \"CA\" for Canada, etc). Country might be NULL if there\'s no specific guidance on them (so you might get { \"en\", \"US\" } for American English, but { \"en\", NULL } means \"English language, generically\"). Language strings are never NULL, except to terminate the array.
--
--     Please note that not all of these strings are 2 characters; some are three or more.
--
--     The returned list of locales are in the order of the user\'s preference. For example, a German citizen that is fluent in US English and knows enough Japanese to navigate around Tokyo might have a list like: { \"de\", \"en_US\", \"jp\", NULL }. Someone from England might prefer British English (where \"color\" is spelled \"colour\", etc), but will settle for anything like it: { \"en_GB\", \"en\", NULL }.
--
--     This function returns NULL on error, including when the platform does not supply this information at all.
--
--     This might be a \"slow\" call that has to query the operating system. It\'s best to ask for this once and save the results. However, this list can change, usually because the user has changed a system preference outside of your program; SDL will send an SDL_EVENT_LOCALE_CHANGED event in this case, if possible, and you can call this function again to get an updated copy of preferred locales.
--
--     [Returns]: a NULL terminated array of locale pointers, or NULL on failure; call SDL_GetError() for more information. This is a single allocation that should be freed with SDL_free() when it is no longer needed.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     [C declaration]: @SDL_GetPreferredLocales@, defined at @SDL3\/SDL_locale.h 109:43@
sDL_GetPreferredLocales
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of locales returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Locale))
sDL_GetPreferredLocales = hs_bindgen_3153090c14b68521
