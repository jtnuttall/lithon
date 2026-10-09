{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The SDL3 target: @lithon-codegen sdl3@ generates @sdl3-bindgen-sys@
-- (raw @SDL3.Sys.Bindgen.*@ families, the curated @SDL3.Sys.*@ layer) from
-- the SDL3 headers @pkg-config sdl3@ resolves, with data under
-- @lithon-codegen\/data\/sdl3\/@.
module Lithon.Codegen.Bindgen.Target.Sdl3 (
  sdl3,

  -- * Platform shims (pinned by the platform-shim tests)
  stubEditsFor,
) where

import Data.Text qualified as T
import Lithon.HsBindgen qualified as HB
import Lithon.HsBindgen.HsDoc qualified as HsDoc
import Lithon.Prelude
import System.FilePath (dropExtension, (<.>))

import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Driver (HeaderUnit (..), Passes (..))
import Lithon.Codegen.Bindgen.Target
import Lithon.Codegen.Bindgen.Version (mkVersion, renderVersion, versionArgs)
import Lithon.Codegen.Bindgen.Version.Doc qualified as Doc

sdl3 :: BindgenTarget
sdl3 =
  BindgenTarget
    { key = "sdl3"
    , packageName = "sdl3-bindgen-sys"
    , displayName = "SDL3"
    , versionLabel = "SDL"
    , namespace = $$(Module.metaLit ["SDL3", "Sys"])
    , functionPrefix = "SDL_"
    , pkgConfig = "sdl3"
    , headers =
        HeaderSpec
          { includeRoot = "SDL3"
          , -- The umbrella, plus the headers bound although @SDL.h@ does
            -- not include them.
            mainIncludes = ["SDL.h", "SDL_vulkan.h", "SDL_main.h"]
          , excluded = excludedHeaders
          , -- @SDL_platform_defines.h@ -> @SDL3.Sys.Bindgen.PlatformDefines@:
            -- 'Module.JoinConcat' fuses the underscore-split words into one
            -- PascalCase segment, reproducing the historical SDL3 module
            -- names byte-for-byte.
            mangle = def{Module.stripPrefix = Just "SDL_", Module.segmentJoin = Module.JoinConcat}
          }
    , parse =
        ParseEnv
          { -- @SDL_MAIN_HANDLED@ keeps @SDL_main.h@ from planting its
            -- @#define main@ hijack (the declarations remain): without it,
            -- Windows\/mobile headers compile a real entry point into the
            -- wrapper object (guaranteed link failure). It has to precede
            -- @#include <SDL3/SDL_main.h>@ (the header tests it with
            -- @#ifndef@); as a root directive it does, because the seam
            -- (@Lithon.HsBindgen.Invoke.runBindgen@) lists the defines before
            -- the includes and hs-bindgen renders the root directives, in
            -- order, at the top of every wrapper translation unit. Harmless
            -- where @SDL_main.h@ leaves @main@ alone.
            defines =
              [ CDefine{name = "SDL_MAIN_HANDLED", value = Nothing}
              , -- @SDL_stdinc.h@ otherwise @#define@s @SDL_memcpy memcpy@
                -- (likewise memmove, memset) to take advantage of the
                -- compiler's own copy, and hs-bindgen drops a function
                -- shadowed by a same-name macro: neither would bind. The
                -- defines land in the wrapper C prologue, the ABI
                -- translation unit and the constants probe, where they only
                -- make SDL's inline helpers call SDL's own functions.
                CDefine{name = "SDL_SLOW_MEMCPY", value = Nothing}
              , CDefine{name = "SDL_SLOW_MEMMOVE", value = Nothing}
              , CDefine{name = "SDL_SLOW_MEMSET", value = Nothing}
              ]
          , -- SDL's Doxyfile defines \threadsafety; without the alias doxygen
            -- passes the command through as literal text and every function doc
            -- leaks "\threadsafety ..." verbatim. \par routes it through the
            -- existing simplesect rendering as a bold "Thread safety:" line.
            doxygenAliases = [("threadsafety", "\\par Thread safety:^^")]
          }
    , versioning =
        VersionScheme
          { arity = sdlArity
          , -- The oldest SDL with a stable ABI.
            baseline = mkVersion (3 :| [2, 0])
          , atLeast = \v -> "SDL_VERSION_ATLEAST(" <> versionArgs v <> ")"
          , below = \v -> "!SDL_VERSION_ATLEAST(" <> versionArgs v <> ")"
          , guardIncludes = ["SDL_version.h"]
          , -- SDL states availability in each declaration's doxygen \since
            -- and in a late member's "(added in [SDL] X.Y.Z)" note.
            declSince = Doc.doxygenSince sdlArity
          , fieldSince = Doc.addedInNote sdlArity ["sdl"]
          }
    , -- The gated stub's error channel; per-header TUs do not reach it on
      -- their own at 3.2 (SDL_cpuinfo.h has no transitive SDL_error.h
      -- there).
      gateStubs =
        GateStubs
          { includes = ["SDL_error.h"]
          , failure = Just \sym since ->
              "SDL_SetError(\"" <> sym <> " requires SDL >= " <> renderVersion since <> "\");"
          }
    , shims = platformShims
    , widthTypedefs =
        Just
          WidthTypedefs
            { family = "Stdinc"
            , -- The eight SDL width typedefs (newtypes over the equal-width
              -- GHC primitives in the generated Stdinc module). Semantic
              -- typedefs layered on top of these ('SDL_JoystickID',
              -- 'SDL_InitFlags', …) are different names and therefore never
              -- match — they keep their newtypes by design.
              natives =
                [ ("Uint8", NativeWord8)
                , ("Uint16", NativeWord16)
                , ("Uint32", NativeWord32)
                , ("Uint64", NativeWord64)
                , ("Sint8", NativeInt8)
                , ("Sint16", NativeInt16)
                , ("Sint32", NativeInt32)
                , ("Sint64", NativeInt64)
                ]
            }
    , docs = DocHooks{fixText = wikiFixLinks, fixLink = sdlWikiUrl}
    , prose =
        Prose
          { familyOneLiners
          , familyExtras = [("Events", readingEvents)]
          , umbrellaDoc
          , runtimeDoc
          , abiBanner
          }
    , -- The C shims: fixed-arity functions over SDL's variadic functions
      -- and the function-like macros hs-bindgen cannot translate, one header
      -- per SDL header they extend (@SDL_log.h@ -> @SDL_log_shims.h@, raw
      -- family @SDL3.Sys.Bindgen.LogShims@, exported from @SDL3.Sys.Log@).
      -- Each function is @lithon_@ and the SDL name it wraps.
      authored =
        Just
          AuthoredHeaders
            { includeRoot = "sdl3-bindgen-sys"
            , namePrefix = "lithon_"
            , headers =
                map
                  shimsFor
                  [ "SDL_atomic.h"
                  , "SDL_audio.h"
                  , "SDL_endian.h"
                  , "SDL_error.h"
                  , "SDL_iostream.h"
                  , "SDL_log.h"
                  , "SDL_pixels.h"
                  , "SDL_stdinc.h"
                  , "SDL_surface.h"
                  , "SDL_thread.h"
                  , "SDL_timer.h"
                  ]
            }
    }
 where
  shimsFor host = AuthoredHeader{file = dropExtension host <> "_shims.h", extends = Just host}

-- | SDL versions are MAJOR.MINOR.PATCH, in the annotations and in the docs.
sdlArity :: Int
sdlArity = 3

excludedHeaders :: Set FilePath
excludedHeaders = sdlMain <> sdlInternal <> egl <> gl
 where
  sdlMain = ["SDL.h", "SDL_main_impl.h"]
  sdlInternal =
    [ "SDL_begin_code.h"
    , "SDL_close_code.h"
    , "SDL_copying.h"
    , "SDL_oldnames.h"
    ]
  egl = ["SDL_egl.h"]
  gl =
    from
      [ "SDL_opengl" <> suffix <.> "h"
      | suffix <-
          ["", "_glext", "es", "es2", "es2_gl2", "es2_gl2ext", "es2_gl2platform", "es2_khrplatform"]
      ]

-- | The platform forward-compat shims, as a composable pass set.
platformShims :: Passes
platformShims =
  Passes
    { stubEdits = \unit _arts -> stubEditsFor unit.headerName
    , -- No rendered-text shim remains: the define SDL needed ahead of the
      -- @SDL_main.h@ include is a root directive now (see @parse.defines@
      -- in 'sdl3').
      textEdits = \_ _ -> []
    }

-- | Platform forward-compat shims by header, as data; the seam owns the
-- mechanism ("Lithon.HsBindgen.Transform") and fails loudly when a shim
-- no longer finds its target.
--
-- The embedded wrapper C compiles against the USER'S headers, so anything
-- the target platform does not declare must be guarded here:
-- @SDL_SetLinuxThreadPriority(AndPolicy)@ are the only bound functions
-- SDL declares under a platform @#ifdef@; off-Linux the wrappers become
-- stubs that raise @SDL_SetError@ and return false \/ a NULL function
-- pointer, so the module still compiles and misuse fails loudly at the
-- call site (@SDL_system.h@ includes @SDL_error.h@, so @SDL_SetError@ is
-- always declared). Haskell surface unchanged.
stubEditsFor :: FilePath -> [HB.StubEdit]
stubEditsFor = \case
  "SDL_system.h" ->
    linuxGuard
      "SDL_SetLinuxThreadPriority"
      "(SDL_SetLinuxThreadPriority)(arg1, arg2);"
      "(void)arg1; (void)arg2; return SDL_SetError(\"SDL_SetLinuxThreadPriority is only available on Linux\");"
      <> linuxGuard
        "SDL_SetLinuxThreadPriorityAndPolicy"
        "(SDL_SetLinuxThreadPriorityAndPolicy)(arg1, arg2, arg3);"
        "(void)arg1; (void)arg2; (void)arg3; return SDL_SetError(\"SDL_SetLinuxThreadPriorityAndPolicy is only available on Linux\");"
  _otherHeader -> []
 where
  -- Guard both wrapper shapes of one symbol: the call wrapper
  -- (Safe/Unsafe) and the FunPtr address getter.
  linuxGuard :: Text -> Text -> Text -> [HB.StubEdit]
  linuxGuard symbol call stub =
    [ HB.replaceStubLine
        (symbol <> " call")
        symbol
        ("  return " <> call)
        [ "#ifdef SDL_PLATFORM_LINUX"
        , "  return " <> call
        , "#else"
        , "  " <> stub
        , "#endif"
        ]
    , HB.replaceStubLine
        (symbol <> " address")
        symbol
        ("  return &" <> symbol <> ";")
        [ "#ifdef SDL_PLATFORM_LINUX"
        , "  return &" <> symbol <> ";"
        , "#else"
        , "  SDL_SetError(\"" <> symbol <> " is only available on Linux\"); return 0;"
        , "#endif"
        ]
    ]

-- | Doxygen leaves SDL-wiki-relative markdown links (@[x](CategoryY)@) as
-- plain text inside peeled category overviews, where they never become
-- 'HsDoc.Link' nodes; the exact-prefix substitution points them at the SDL
-- wiki, whose page names are exactly these identifiers.
wikiFixLinks :: Text -> Text
wikiFixLinks = T.replace "](Category" "](https://wiki.libsdl.org/SDL3/Category"

-- | Doxygen leaves SDL-wiki-relative link targets (@CategoryAudio@,
-- @CategoryAudio#anchor@) unresolved — they only mean something on the
-- SDL wiki. Anything with a scheme (https:, mailto:, …) passes through;
-- scheme-less targets get pointed at the wiki, whose page names are
-- exactly these identifiers.
sdlWikiUrl :: Text -> Text
sdlWikiUrl url
  | ":" `T.isInfixOf` url = url
  | otherwise = "https://wiki.libsdl.org/SDL3/" <> url

-- | Hand-curated one-liners for the families whose SDL category overview
-- doxygen cannot attach (their category comments precede macros libclang
-- never surfaces, so the peel finds nothing). Consulted only when no
-- overview title exists; phrasing follows SDL's own category summaries
-- where one exists.
familyOneLiners :: Map Text Text
familyOneLiners =
  [ ("Endian", "Functions for reading and writing endian-specific values.")
  , ("Error", "Simple error message routines for SDL.")
  , ("Main", "App entry-point handling; SDL_main is not bound here.")
  ,
    ( "Mutex"
    , "Thread synchronization primitives: mutexes, semaphores, condition variables, and read/write locks."
    )
  , ("PlatformDefines", "Platform-detection defines, baked at generation time.")
  , ("Stdinc", "SDL's C-library replacements: memory, strings, math, and conversions.")
  , ("System", "Platform-specific SDL API functions.")
  , ("Vulkan", "Functions for creating Vulkan surfaces on SDL windows.")
  ]

-- | Usage guidance for the Events family, at the point of need rather than
-- in the package README.
readingEvents :: HsDoc.Comment
readingEvents =
  mempty
    { HsDoc.children =
        [ HsDoc.Header HsDoc.Level3 [HsDoc.TextContent "Reading events"]
        , HsDoc.Paragraph
            [ HsDoc.Monospace [HsDoc.TextContent "SDL_Event"]
            , HsDoc.TextContent "is a C union: poll into an"
            , HsDoc.Monospace [HsDoc.TextContent "alloca"]
            , HsDoc.TextContent
                "buffer, read the event-type discriminant first, then \
                \peek the payload member for that type. The"
            , HsDoc.Monospace [HsDoc.TextContent "sdl3-raw"]
            , HsDoc.TextContent
                "example in the repository shows the full idiom;"
            , HsDoc.Identifier "pollEvent"
            , HsDoc.TextContent "and the"
            , HsDoc.Monospace [HsDoc.TextContent "SDL_EVENT_*"]
            , HsDoc.TextContent "patterns live in this module."
            ]
        ]
    }

-- | The Runtime bridge module's Haddock.
runtimeDoc :: Text
runtimeDoc =
  [trimmingQQ|
    -- | Bridge vocabulary for the curated layer: C99 bool conversions and
    -- the C enum classes, curated from the vendored hs-bindgen runtime.
    --
    -- Struct fields deliberately keep their C types (a keyboard event's
    -- @repeat@ field is a @CBool@; a rect's @x@ is a C @int@); 'toBool'
    -- bridges the bool case, and plain 'Prelude.fromIntegral' or
    -- 'Data.Coerce.coerce' the fixed-width integer typedefs. The full
    -- runtime surface — including the lifted 'Prelude'-shadowing
    -- combinators these exports leave behind — stays available under
    -- "SDL3.Sys.Bindgen.Runtime" and its submodules.
  |]

-- | The ABI assertion TU's banner.
abiBanner :: [Text]
abiBanner =
  [ "Every size, alignment, field offset, and enum value baked into the"
  , "generated Haskell is re-asserted here against the SDL headers this"
  , "package is compiled with. A failing line means the bindings would"
  , "corrupt memory under this platform/SDL — the build stops instead."
  , "See the package README, section \"ABI verification\"."
  , "A sizeof asserted with >= belongs to a struct the bindings only ever"
  , "read inside a named union (SDL_Event, SDL_HapticEffect) or one the"
  , "annotations mark layout: prefix. SDL may append fields to it; its known"
  , "fields stay pinned by offset and the union's own size stays exact."
  , "Building with the cabal flag abi-assertions-exact makes every sizeof"
  , "exact again, for checking a newer SDL."
  , ""
  , "#if guards mirror each declaration's documented @since and each"
  , "member's \"(added in X.Y.Z)\" note — corrected and refined by the"
  , "availability annotations (lithon-codegen data/sdl3/versions.json)"
  , "— on SDL's own version macros."
  ]

-- | The umbrella module's Haddock, around the family index.
umbrellaDoc :: Text -> Text
umbrellaDoc familyIndex =
  [trimmingQQ|
  -- |
  -- Curated low-level SDL3 surface: Re-exports every per-header module.
  --
  -- This is a low-level module intended to provide the building blocks for
  -- higher-level libraries.
  --
  -- Contributing is encouraged. Please submit either an issue or PR to the
  -- upstream repository if you run into problems with these generated bindings.
  --
  -- These bindings are still experimental and in flux, and will not stabilize
  -- at least until hs-bindgen is itself released stably. 
  --
  -- Pin to a minor version (e.g. @>=0.0.0.1 && <0.0.1@) until this library hits @0.1.0.0@.
  --
  -- __Conventions__
  --
  -- * Every function's foreign-import flavor is classified deterministically
  --   by the checked-in registry. Most functions export both @safe@ and @unsafe@
  --   FFI bindings.
  --
  -- * Function aliases follow the camel-segments rule: strip @SDL_@ and
  --   join the underscore segments (@SDL_CreateWindow@ -> @createWindow@,
  --   @SDL_GL_SwapWindow@ -> @glSwapWindow@, @SDL_GUIDToString@ ->
  --   @guidToString@).
  --
  -- * An /unsuffixed/ alias is always the __unsafe__ foreign import; a
  --   @Safe@-suffixed alias is always the __safe__ one. 
  --
  -- * Functions that unavoidably invoke a callback during the call export 
  --   only the @Safe@ alias — re-entering Haskell from an unsafe call is undefined
  --   behavior, so the footgun is simply not handed out. NB: A non-Haskell 
  --   callback function (e.g., written in C or Rust) cannot re-enter the runtime; 
  --   for that case the unsafe imports stay available under the 
  --   @SDL3.Sys.Bindgen.*.Unsafe@ modules.
  --
  -- * Functions curated @unsafe-only@ — quick, nonblocking, callback-free —
  --   export only the unsuffixed alias: paying the safe-call overhead for
  --   them buys nothing. Each alias's documentation records its rationale.
  --
  -- * Types, enum patterns, macro constants, and property keys re-export
  --   verbatim from the @SDL3.Sys.Bindgen.*@ base modules.
  --
  -- * This layer additionally provides typed pattern synonyms for
  --   the macro constant groups in SDL headers.
  --
  -- * What the FFI cannot call — SDL's variadic functions and the
  --   function-like macros hs-bindgen cannot translate — is reached through
  --   C shims: fixed-arity functions this package defines in C, exported
  --   from the module of the header they extend, in its C shims section,
  --   and named like what they wrap (@SDL_LogMessage@ -> @logMessage@,
  --   @SDL_MUSTLOCK@ -> @mustLock@). The variadic functions' shims take
  --   their message verbatim, never as a printf-style format string.
  --   @SDL_Log@ is @logApplication@: @log@ is the math function.
  --
  -- * Some aliases (@free@, @abs@, @init@, …) collide with the "Prelude";
  --   import this module qualified or curate your import list.
  --
  -- == Families
  --
  $familyIndex
  --
  |]
