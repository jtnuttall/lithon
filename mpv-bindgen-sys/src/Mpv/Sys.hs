{-# LANGUAGE DuplicateRecordFields #-}

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
--   @mpv_render_context_render@ -> @renderContextRender@,
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
-- * "Mpv.Sys.Client" — Core client API: handles, options, commands, properties, events.
-- * "Mpv.Sys.Render" — Render API: drive video output from your own rendering loop.
-- * "Mpv.Sys.RenderGl" — OpenGL backend parameters for the render API.
-- * "Mpv.Sys.Runtime" — Bridge vocabulary: C99 bool and C enum conversions, curated from the runtime.
-- * "Mpv.Sys.StreamCb" — Custom stream protocols via user callbacks.
module Mpv.Sys (
  module Mpv.Sys.Client,
  module Mpv.Sys.Render,
  module Mpv.Sys.RenderGl,
  module Mpv.Sys.Runtime,
  module Mpv.Sys.StreamCb,
)
where

import Mpv.Sys.Client
import Mpv.Sys.Render
import Mpv.Sys.RenderGl
import Mpv.Sys.Runtime
import Mpv.Sys.StreamCb
