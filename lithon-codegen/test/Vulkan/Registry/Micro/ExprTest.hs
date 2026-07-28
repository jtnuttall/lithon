{-# LANGUAGE OverloadedStrings #-}

-- | The depends\/protect boolean-expression grammar, including the
-- registry's equal-precedence left-associative operator rule
-- (registry.adoc:1199) and minimal-parenthesis rendering round-trips.
module Vulkan.Registry.Micro.ExprTest (
  unit_singleAtom,
  unit_featurePathAtom,
  unit_leftAssocOrThenAnd,
  unit_leftAssocAndThenOr,
  unit_parenthesizedLeft,
  unit_parenthesizedRight,
  unit_featurePathList,
  unit_dependsRejectsNot,
  unit_dependsRejectsSpaces,
  unit_dependsRejectsEmpty,
  unit_protectAcceptsNot,
  unit_renderMinimalParens,
  hprop_dependsRoundTrip,
  hprop_protectRoundTrip,
) where

import Data.Text qualified as T
import Hedgehog (Gen, Property, forAll, property, (===))
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, (@?=))

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr
import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath (..))

name :: Text -> BoolExpr DependsAtom
name = BAtom . DependsName

feat :: Text -> Text -> BoolExpr DependsAtom
feat s m = BAtom (DependsFeature FeaturePath{struct = WithNS s, member = m})

unit_singleAtom :: IO ()
unit_singleAtom = parseDepends "VK_KHR_surface" @?= Right (name "VK_KHR_surface")

unit_featurePathAtom :: IO ()
unit_featurePathAtom =
  parseDepends "VkPhysicalDeviceVulkan12Features::descriptorIndexing"
    @?= Right (feat "VkPhysicalDeviceVulkan12Features" "descriptorIndexing")

-- | @a,b+c@ = @(a OR b) AND c@ — the equal-precedence rule.
unit_leftAssocOrThenAnd :: IO ()
unit_leftAssocOrThenAnd =
  parseDepends "a,b+c" @?= Right (BAnd (BOr (name "a") (name "b")) (name "c"))

unit_leftAssocAndThenOr :: IO ()
unit_leftAssocAndThenOr =
  parseDepends "a+b,c" @?= Right (BOr (BAnd (name "a") (name "b")) (name "c"))

-- | Verbatim from VK_KHR_video_queue's dependency.
unit_parenthesizedLeft :: IO ()
unit_parenthesizedLeft =
  parseDepends "(VK_VERSION_1_1+VK_KHR_synchronization2),VK_VERSION_1_3"
    @?= Right
      (BOr (BAnd (name "VK_VERSION_1_1") (name "VK_KHR_synchronization2")) (name "VK_VERSION_1_3"))

-- | Verbatim from VK_KHR_video_decode_queue's dependency.
unit_parenthesizedRight :: IO ()
unit_parenthesizedRight =
  parseDepends "VK_KHR_video_queue+(VK_KHR_synchronization2,VK_VERSION_1_3)"
    @?= Right
      (BAnd (name "VK_KHR_video_queue") (BOr (name "VK_KHR_synchronization2") (name "VK_VERSION_1_3")))

-- | Verbatim from a VK_VERSION_1_2 require block.
unit_featurePathList :: IO ()
unit_featurePathList =
  parseDepends
    "VkPhysicalDeviceShaderAtomicInt64Features::shaderSharedInt64Atomics,VkPhysicalDeviceShaderAtomicInt64Features::shaderBufferInt64Atomics"
    @?= Right
      ( BOr
          (feat "VkPhysicalDeviceShaderAtomicInt64Features" "shaderSharedInt64Atomics")
          (feat "VkPhysicalDeviceShaderAtomicInt64Features" "shaderBufferInt64Atomics")
      )

unit_dependsRejectsNot :: IO ()
unit_dependsRejectsNot = assertBool "depends must not accept !" (isLeft (parseDepends "!VK_X"))

unit_dependsRejectsSpaces :: IO ()
unit_dependsRejectsSpaces = assertBool "spaces are malformed" (isLeft (parseDepends "a + b"))

unit_dependsRejectsEmpty :: IO ()
unit_dependsRejectsEmpty = assertBool "empty is malformed" (isLeft (parseDepends ""))

unit_protectAcceptsNot :: IO ()
unit_protectAcceptsNot =
  parseProtect "!VK_ENABLE_BETA_EXTENSIONS" @?= Right (BNot (BAtom "VK_ENABLE_BETA_EXTENSIONS"))

unit_renderMinimalParens :: IO ()
unit_renderMinimalParens = do
  display (BAnd (BOr (name "a") (name "b")) (name "c")) @?= ("a,b+c" :: Text)
  display (BAnd (name "a") (BOr (name "b") (name "c"))) @?= ("a+(b,c)" :: Text)
  display (BOr (BAnd (name "a") (name "b")) (name "c")) @?= ("a+b,c" :: Text)

genIdent :: Gen Text
genIdent = T.cons <$> Gen.alpha <*> Gen.text (Range.linear 0 8) genIdentChar
 where
  genIdentChar = Gen.frequency [(20, Gen.alphaNum), (1, pure '_')]

genDependsExpr :: Gen DependsExpr
genDependsExpr =
  Gen.recursive
    Gen.choice
    [BAtom <$> genAtom]
    [ Gen.subterm2 genDependsExpr genDependsExpr BAnd
    , Gen.subterm2 genDependsExpr genDependsExpr BOr
    ]
 where
  genAtom =
    Gen.choice
      [ DependsName <$> genIdent
      , DependsFeature <$> (FeaturePath . WithNS <$> genIdent <*> genIdent)
      ]

genProtectExpr :: Gen ProtectExpr
genProtectExpr =
  Gen.recursive
    Gen.choice
    [BAtom <$> genIdent]
    [ Gen.subterm genProtectExpr BNot
    , Gen.subterm2 genProtectExpr genProtectExpr BAnd
    , Gen.subterm2 genProtectExpr genProtectExpr BOr
    ]

hprop_dependsRoundTrip :: Property
hprop_dependsRoundTrip = property do
  expr <- forAll genDependsExpr
  parseDepends (display expr) === Right expr

hprop_protectRoundTrip :: Property
hprop_protectRoundTrip = property do
  expr <- forAll genProtectExpr
  parseProtect (display expr) === Right expr
