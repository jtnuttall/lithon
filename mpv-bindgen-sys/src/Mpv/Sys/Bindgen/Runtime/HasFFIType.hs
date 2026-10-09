-- | Facade over @HsBindgen.Runtime.HasFFIType@ from the vendored hs-bindgen runtime.
--
-- Intended for qualified import:
--
-- > import qualified Mpv.Sys.Bindgen.Runtime.HasFFIType as HasFFIType
--
-- For licensing information, see LICENSE_hs-bindgen-runtime in this package's root.
module Mpv.Sys.Bindgen.Runtime.HasFFIType (
  module HsBindgen.Runtime.HasFFIType,
) where

import HsBindgen.Runtime.HasFFIType
