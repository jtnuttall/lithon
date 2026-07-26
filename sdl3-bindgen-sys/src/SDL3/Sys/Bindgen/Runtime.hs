-- | The runtime vocabulary used by the generated bindings.
--
-- Generated signatures mention runtime types (CEnum, constant and
-- incomplete arrays, read-only pointers, …); this facade makes them
-- nameable downstream. The runtime itself is a verbatim, PRIVATE copy
-- of the pinned hs-bindgen runtime (see LICENSE_hs-bindgen-runtime);
-- once hs-bindgen releases, it becomes a real dependency and this
-- module keeps downstream code source-compatible.
module SDL3.Sys.Bindgen.Runtime (
  module HsBindgen.Runtime.Prelude,
  module HsBindgen.Runtime.LibC,
) where

import HsBindgen.Runtime.LibC
import HsBindgen.Runtime.Prelude
