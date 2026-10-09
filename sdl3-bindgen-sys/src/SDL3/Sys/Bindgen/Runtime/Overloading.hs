-- | Facade over @HsBindgen.Runtime.Overloading@ from the vendored hs-bindgen runtime.
--
-- Intended for qualified import:
--
-- > import qualified SDL3.Sys.Bindgen.Runtime.Overloading as Overloading
--
-- For licensing information, see LICENSE_hs-bindgen-runtime in this package's root.
module SDL3.Sys.Bindgen.Runtime.Overloading (
  module HsBindgen.Runtime.Overloading,
) where

import HsBindgen.Runtime.Overloading
