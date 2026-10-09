-- | Facade over @HsBindgen.Runtime.Macro@ from the vendored hs-bindgen runtime.
--
-- Intended for qualified import:
--
-- > import qualified Mpv.Sys.Bindgen.Runtime.Macro as Macro
--
-- For licensing information, see LICENSE_hs-bindgen-runtime in this package's root.
module Mpv.Sys.Bindgen.Runtime.Macro (
  module HsBindgen.Runtime.Macro,
) where

import HsBindgen.Runtime.Macro
