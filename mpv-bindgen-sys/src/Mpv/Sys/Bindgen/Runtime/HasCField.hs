-- | Facade over @HsBindgen.Runtime.HasCField@ from the vendored hs-bindgen runtime.
--
-- Intended for qualified import:
--
-- > import qualified Mpv.Sys.Bindgen.Runtime.HasCField as HasCField
--
-- For licensing information, see LICENSE_hs-bindgen-runtime in this package's root.
module Mpv.Sys.Bindgen.Runtime.HasCField (
  module HsBindgen.Runtime.HasCField,
) where

import HsBindgen.Runtime.HasCField
