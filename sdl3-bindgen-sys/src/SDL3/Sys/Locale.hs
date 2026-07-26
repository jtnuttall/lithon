-- | SDL locale services.
--
--     This provides a way to get a list of preferred locales (language plus country) for the user. There is exactly one function: @'getPreferredLocales'@, which handles all the heavy lifting, and offers documentation on all the strange ways humans might have configured their language settings. A struct to provide locale data.
--
--     Locale data is split into a spoken language, like English, and an optional country, like Canada. The language will be in ISO-639 format (so English would be \"en\"), and the country, if not NULL, will be an ISO-3166 country code (so Canada would be \"CA\").
--
--     @since 3.2.0
--
--     [See also]: 'getPreferredLocales'
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Locale.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Locale (
  module SDL3.Sys.Bindgen.Locale,

  -- * Function aliases
  SDL3.Sys.Locale.getPreferredLocales,
  SDL3.Sys.Locale.getPreferredLocalesSafe,
)
where

import HsBindgen.Runtime.Support qualified as BG
import SDL3.Sys.Bindgen.Locale
import SDL3.Sys.Bindgen.Locale.Safe qualified as Safe
import SDL3.Sys.Bindgen.Locale.Unsafe qualified as Unsafe

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
--     [Returns]: a NULL terminated array of locale pointers, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Unsafe__ foreign import of @SDL_GetPreferredLocales@.
--                   The safe flavor is 'getPreferredLocalesSafe'
--                   .
--
--     [C declaration]: @SDL_GetPreferredLocales@, defined at @SDL3\/SDL_locale.h 109:43@
getPreferredLocales
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of locales returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Locale))
getPreferredLocales = Unsafe.sDL_GetPreferredLocales

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
--     [Returns]: a NULL terminated array of locale pointers, or NULL on failure; call 'SDL3.Sys.Error.getError' for more information. This is a single allocation that should be freed with 'SDL3.Sys.Stdinc.free' when it is no longer needed.
--
--     [Thread safety]: This function is not thread safe.
--
--     @since 3.2.0
--
--     === __@sdl3-bindgen-sys@ notes__
--
--     [FFI safety]: __Safe__ foreign import of @SDL_GetPreferredLocales@.
--                   The unsafe flavor is 'getPreferredLocales'
--                   .
--
--     [C declaration]: @SDL_GetPreferredLocales@, defined at @SDL3\/SDL_locale.h 109:43@
getPreferredLocalesSafe
  :: BG.Ptr BG.CInt
  -- ^
  --
  --           [@count@]: a pointer filled in with the number of locales returned, may be NULL.
  -> IO (BG.Ptr (BG.Ptr SDL_Locale))
getPreferredLocalesSafe =
  Safe.sDL_GetPreferredLocales
