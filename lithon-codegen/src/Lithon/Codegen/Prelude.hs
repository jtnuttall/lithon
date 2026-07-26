-- | Compat shim: the codegen prelude now lives in lithon-prelude
-- ("Lithon.Prelude"); the codegen-local naming vocabulary
-- ("Lithon.Codegen.Prelude.Naming") stays here. Import those directly in
-- new code; this re-export retires post-release.
module Lithon.Codegen.Prelude (
  module Lithon.Codegen.Prelude.Naming,
  module Lithon.Prelude,
) where

import Lithon.Codegen.Prelude.Naming
import Lithon.Prelude
