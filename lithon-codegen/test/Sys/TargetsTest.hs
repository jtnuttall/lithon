-- | Every registered bindgen-sys target is a well-formed record, and no
-- two targets claim the same key, package, or namespace.
module Sys.TargetsTest (
  unit_targetsValidate,
) where

import Lithon.Prelude
import Test.Tasty.HUnit (Assertion, (@?=))

import Lithon.Codegen.Sys.Target (validateTargets)
import Lithon.Codegen.Sys.Targets (sysTargets)

unit_targetsValidate :: Assertion
unit_targetsValidate = validateTargets sysTargets @?= Right ()
