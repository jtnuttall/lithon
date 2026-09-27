-- | Facade over @HsBindgen.Runtime.CEnum@ from the vendored hs-bindgen runtime.
--
-- Intended for qualified import:
--
-- > import qualified Mpv.Sys.Bindgen.Runtime.CEnum as CEnum
--
-- For licensing information, see LICENSE_hs-bindgen-runtime in this package's root.
module Mpv.Sys.Bindgen.Runtime.CEnum (
  module HsBindgen.Runtime.CEnum,
) where

import HsBindgen.Runtime.CEnum
