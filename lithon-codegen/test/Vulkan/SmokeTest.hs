-- | Locks in tasty-discover conventions: @unit_@ (HUnit), @hprop_@ (hedgehog),
-- and @test_@ (raw 'TestTree') prefixes must all be discovered.
module Vulkan.SmokeTest (
  unit_sanity,
  hprop_reverseInvolutive,
  test_treeDiscovery,
) where

import Hedgehog (Property, forAll, property, (===))
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Lithon.Prelude
import Test.Tasty (TestTree)
import Test.Tasty.HUnit (testCase, (@?=))

unit_sanity :: IO ()
unit_sanity = (2 + 2 :: Int) @?= 4

hprop_reverseInvolutive :: Property
hprop_reverseInvolutive = property do
  xs <- forAll $ Gen.list (Range.linear 0 64) (Gen.int (Range.linear 0 100))
  {- HLINT ignore hprop_reverseInvolutive "Redundant reverse" -}
  reverse (reverse xs) === xs

test_treeDiscovery :: TestTree
test_treeDiscovery = testCase "test_ trees are discovered" ((1 :: Int) @?= 1)
