-- | OpenGL backend parameters for the render API.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @Mpv.Sys.Bindgen.RenderGl.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "Mpv.Sys".
module Mpv.Sys.RenderGl (
  module Mpv.Sys.Bindgen.RenderGl,
)
where

import Mpv.Sys.Bindgen.RenderGl
