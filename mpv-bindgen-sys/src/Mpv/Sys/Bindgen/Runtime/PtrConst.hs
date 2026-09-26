-- | Facade over @HsBindgen.Runtime.PtrConst@ from the vendored hs-bindgen runtime.
--
-- Intended for qualified import:
--
-- > import qualified Mpv.Sys.Bindgen.Runtime.PtrConst as PtrConst
--
-- For licensing information, see LICENSE_hs-bindgen-runtime in this package's root.
module Mpv.Sys.Bindgen.Runtime.PtrConst (
  module HsBindgen.Runtime.PtrConst,
) where

import HsBindgen.Runtime.PtrConst
