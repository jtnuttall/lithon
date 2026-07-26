-- | Facade over @HsBindgen.Runtime.Marshal@ from the vendored hs-bindgen runtime.
--
-- Intended for qualified import:
--
-- > import qualified SDL3.Sys.Bindgen.Runtime.Marshal as Marshal
--
-- For licensing information, see LICENSE_hs-bindgen-runtime in this package's root.
module SDL3.Sys.Bindgen.Runtime.Marshal (
  module HsBindgen.Runtime.Marshal,
) where

import HsBindgen.Runtime.Marshal
