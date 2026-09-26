-- | Every registered bindgen-sys target is a well-formed record, and no
-- two targets claim the same key, package, or namespace.
module Sys.TargetsTest (
  unit_targetsValidate,
  unit_toy2Validates,
) where

import Lithon.Prelude
import Test.Tasty.HUnit (Assertion, (@?=))

import Lithon.Codegen.Sys.Target (validateTarget, validateTargets)
import Lithon.Codegen.Sys.Targets (sysTargets)
import Sys.Support.Targets (toy2)

unit_targetsValidate :: Assertion
unit_targetsValidate = validateTargets sysTargets @?= Right ()

-- | The test-only mpv-shaped target is a well-formed record too, and
-- coexists with every registered one.
unit_toy2Validates :: Assertion
unit_toy2Validates = do
  validateTarget toy2 @?= Right ()
  validateTargets (toy2 : sysTargets) @?= Right ()
