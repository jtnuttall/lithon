-- | Facade over @HsBindgen.Runtime.Struct@ from the vendored hs-bindgen runtime.
--
-- Intended for qualified import:
--
-- > import qualified Mpv.Sys.Bindgen.Runtime.Struct as Struct
--
-- For licensing information, see LICENSE_hs-bindgen-runtime in this package's root.
module Mpv.Sys.Bindgen.Runtime.Struct (
  module HsBindgen.Runtime.Struct,
) where

import HsBindgen.Runtime.Struct
