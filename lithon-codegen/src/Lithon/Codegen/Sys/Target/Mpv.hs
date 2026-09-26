{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The libmpv target: @lithon-codegen mpv@ generates @mpv-bindgen-sys@
-- (raw @Mpv.Sys.Bindgen.*@ families, the curated @Mpv.Sys.*@ layer) from
-- the libmpv client API headers @pkg-config mpv@ resolves, with data under
-- @lithon-codegen\/data\/mpv\/@.
module Lithon.Codegen.Sys.Target.Mpv (
  mpv,
) where

import Lithon.HsBindgen.HsDoc qualified as HsDoc
import Lithon.Prelude

import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Sys.Target
import Lithon.Codegen.Sys.Version (mkVersion, versionArgs)

mpv :: SysTarget
mpv =
  SysTarget
    { key = "mpv"
    , packageName = "mpv-bindgen-sys"
    , displayName = "libmpv"
    , versionLabel = "libmpv client API"
    , namespace = $$(Module.metaLit ["Mpv", "Sys"])
    , functionPrefix = "mpv_"
    , pkgConfig = "mpv"
    , headers =
        HeaderSpec
          { includeRoot = "mpv"
          , -- libmpv has no umbrella header: the four public headers, which
            -- reach each other through quoted includes (render.h and
            -- stream_cb.h include client.h; render_gl.h includes render.h).
            mainIncludes = ["client.h", "render.h", "render_gl.h", "stream_cb.h"]
          , excluded = []
          , -- @render_gl.h@ -> @Mpv.Sys.Bindgen.RenderGl@: 'Module.JoinConcat'
            -- fuses the underscore-split words into one PascalCase segment.
            mangle = def{Module.segmentJoin = Module.JoinConcat}
          }
    , parse = ParseEnv{defines = [], doxygenAliases = []}
    , versioning =
        VersionScheme
          { arity = 2
          , -- Client API 2.0 (mpv 0.35), the floor.
            baseline = mkVersion (2 :| [0])
          , atLeast = \v -> "MPV_CLIENT_API_VERSION >= MPV_MAKE_VERSION(" <> versionArgs v <> ")"
          , below = \v -> "MPV_CLIENT_API_VERSION < MPV_MAKE_VERSION(" <> versionArgs v <> ")"
          , guardIncludes = ["client.h"]
          , -- libmpv states availability only in free prose ("Since API
            -- version 1.108"), all of it below the floor: the registry is
            -- the only source.
            declSince = const Nothing
          , fieldSince = const Nothing
          }
    , -- libmpv has no error channel to report a gated call through; each
      -- gated function's stub-return in versions.json is the report.
      gateStubs = GateStubs{includes = [], failure = Nothing}
    , shims = mempty
    , widthTypedefs = Nothing
    , docs = DocHooks{fixText = id, fixLink = id}
    , prose =
        Prose
          { familyOneLiners
          , familyExtras = [("Client", readingEvents)]
          , umbrellaDoc
          , runtimeDoc
          , abiBanner
          }
    }

-- | The family titles (libmpv's headers carry no category overview), as
-- the package README's module table words them.
familyOneLiners :: Map Text Text
familyOneLiners =
  [ ("Client", "Core client API: handles, options, commands, properties, events.")
  , ("Render", "Render API: drive video output from your own rendering loop.")
  , ("RenderGl", "OpenGL backend parameters for the render API.")
  , ("StreamCb", "Custom stream protocols via user callbacks.")
  ]

-- | Usage guidance for the Client family, at the point of need rather than
-- in the package README.
readingEvents :: HsDoc.Comment
readingEvents =
  mempty
    { HsDoc.children =
        [ HsDoc.Header HsDoc.Level3 [HsDoc.TextContent "Reading events"]
        , HsDoc.Paragraph
            [ HsDoc.Identifier "Mpv_event"
            , HsDoc.TextContent "carries its payload behind an untyped pointer, the"
            , HsDoc.Monospace [HsDoc.TextContent "data'"]
            , HsDoc.TextContent "field (C's"
            , HsDoc.Monospace [HsDoc.TextContent "data"]
            , HsDoc.TextContent "): read"
            , HsDoc.Monospace [HsDoc.TextContent "event_id"]
            , HsDoc.TextContent "first, then cast"
            , HsDoc.Monospace [HsDoc.TextContent "data'"]
            , HsDoc.TextContent "to a pointer to the struct that event documents ("
            , HsDoc.Identifier "Mpv_event_end_file"
            , HsDoc.TextContent "for"
            , HsDoc.Identifier "MPV_EVENT_END_FILE"
            , HsDoc.TextContent ","
            , HsDoc.Identifier "Mpv_event_property"
            , HsDoc.TextContent "for"
            , HsDoc.Identifier "MPV_EVENT_PROPERTY_CHANGE"
            , HsDoc.TextContent
                ", …; the other events leave it null). The event belongs to \
                \libmpv and stays valid until the next wait on the same handle. \
                \The"
            , HsDoc.Monospace [HsDoc.TextContent "mpv-headless"]
            , HsDoc.TextContent "example in the repository shows the full idiom;"
            , HsDoc.Identifier "waitEventSafe"
            , HsDoc.TextContent "and the"
            , HsDoc.Monospace [HsDoc.TextContent "MPV_EVENT_*"]
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
    -- Struct fields deliberately keep their C types (an event's @error@
    -- field is a C @int@; its @event_id@ is the @Mpv_event_id@ enum
    -- newtype); plain 'Prelude.fromIntegral' converts the integers, and
    -- 'fromCEnum' and 'toCEnum' the enums. libmpv's flags are C @int@s,
    -- not C99 bools. The full runtime surface — including the lifted
    -- 'Prelude'-shadowing combinators these exports leave behind — stays
    -- available under "Mpv.Sys.Bindgen.Runtime" and its submodules.
  |]

-- | The ABI assertion TU's banner.
abiBanner :: [Text]
abiBanner =
  [ "Every size, alignment, field offset, and enum value baked into the"
  , "generated Haskell is re-asserted here against the libmpv headers this"
  , "package is compiled with. A failing line means the bindings would"
  , "corrupt memory under this platform/libmpv — the build stops instead."
  , "See the package README, section \"ABI verification\"."
  , ""
  , "#if guards on libmpv's own version macro, MPV_CLIENT_API_VERSION,"
  , "come only from the empirical availability registry"
  , "(lithon-codegen mpv/versions.json)."
  ]

-- | The umbrella module's Haddock, around the family index.
umbrellaDoc :: Text -> Text
umbrellaDoc familyIndex =
  [trimmingQQ|
  -- |
  -- Curated low-level libmpv surface: Re-exports every per-header module.
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
  -- * Function aliases follow the camel-segments rule: strip @mpv_@ and
  --   join the underscore segments (@mpv_set_property@ -> @setProperty@,
  --   @mpv_render_context_create@ -> @renderContextCreate@,
  --   @mpv_get_time_ns@ -> @getTimeNs@).
  --
  -- * An /unsuffixed/ alias is always the __unsafe__ foreign import; a
  --   @Safe@-suffixed alias is always the __safe__ one.
  --
  -- * Functions that unavoidably invoke a callback during the call export
  --   only the @Safe@ alias — re-entering Haskell from an unsafe call is undefined
  --   behavior, so the footgun is simply not handed out. NB: A non-Haskell
  --   callback function (e.g., written in C or Rust) cannot re-enter the runtime;
  --   for that case the unsafe imports stay available under the
  --   @Mpv.Sys.Bindgen.*.Unsafe@ modules.
  --
  -- * Functions curated @unsafe-only@ — quick, nonblocking, callback-free —
  --   export only the unsuffixed alias: paying the safe-call overhead for
  --   them buys nothing. Each alias's documentation records its rationale.
  --
  -- * libmpv may run the wakeup callback synchronously inside many API calls
  --   (@client.h@ warns that it can be reentrant). With a Haskell callback
  --   registered, prefer the @Safe@ aliases for everything but the
  --   @unsafe-only@ functions; see the package README, section
  --   /Safe and unsafe FFI/.
  --
  -- * Types, enum patterns, and macro constants re-export verbatim from the
  --   @Mpv.Sys.Bindgen.*@ base modules.
  --
  -- * The @free@ alias (@mpv_free@) collides with @free@ from
  --   "Foreign.Marshal.Alloc"; import this module qualified or curate your
  --   import list.
  --
  -- == Families
  --
  $familyIndex
  --
  |]
