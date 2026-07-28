{-# LANGUAGE OverloadedStrings #-}

-- | Len\/altlen, externsync, and value-literal micro-grammars: every form
-- censused from the pinned registry, plus round-trips.
module Vulkan.Registry.Micro.ValueTest (
  unit_lenNullTerminated,
  unit_lenSingleName,
  unit_lenArrowPath,
  unit_lenTwoLevels,
  unit_lenConstLevel,
  unit_lenLatexKeepsCommas,
  unit_lenUnbalancedRejected,
  unit_altLenParenAwareSplit,
  unit_externSyncForms,
  unit_externSyncPartialKeywordIsPath,
  unit_externSyncRejectsGarbage,
  unit_literalForms,
  unit_literalEmptyRejected,
  unit_versionNumbers,
  hprop_lenRoundTrip,
  hprop_externSyncRoundTrip,
  hprop_literalRoundTrip,
) where

import Data.Text qualified as T
import Hedgehog (Gen, Property, forAll, property, (===))
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, (@?=))

import Lithon.Codegen.Vulkan.Registry.Micro.ExternSync (
  ExternSync (..),
  SyncPath (..),
  SyncSeg (..),
  parseExternSync,
 )
import Lithon.Codegen.Vulkan.Registry.Micro.Len (
  AltLen (..),
  LenLevel (..),
  LenSpec (..),
  parseAltLen,
  parseLen,
 )
import Lithon.Codegen.Vulkan.Registry.Micro.Literal (
  ComplementWidth (..),
  ValueLiteral (..),
  parseValueLiteral,
  parseVersion,
  renderVersion,
 )

unit_lenNullTerminated :: IO ()
unit_lenNullTerminated =
  parseLen "null-terminated" @?= Right (LenSpec (LenNullTerminated :| []))

unit_lenSingleName :: IO ()
unit_lenSingleName =
  parseLen "pPropertyCount" @?= Right (LenSpec (LenPath ("pPropertyCount" :| []) :| []))

unit_lenArrowPath :: IO ()
unit_lenArrowPath =
  parseLen "pAllocateInfo->descriptorSetCount"
    @?= Right (LenSpec (LenPath ("pAllocateInfo" :| ["descriptorSetCount"]) :| []))

unit_lenTwoLevels :: IO ()
unit_lenTwoLevels =
  parseLen "enabledExtensionCount,null-terminated"
    @?= Right (LenSpec (LenPath ("enabledExtensionCount" :| []) :| [LenNullTerminated]))

unit_lenConstLevel :: IO ()
unit_lenConstLevel =
  parseLen "geometryCount,1"
    @?= Right (LenSpec (LenPath ("geometryCount" :| []) :| [LenConst 1]))

unit_lenLatexKeepsCommas :: IO ()
unit_lenLatexKeepsCommas = do
  parseLen "latexmath:[\\lceil{\\mathit{samples} \\over 32}\\rceil]"
    @?= Right (LenSpec (LenLatex "latexmath:[\\lceil{\\mathit{samples} \\over 32}\\rceil]" :| []))
  parseLen "latexmath:[f(a,b)],count"
    @?= Right (LenSpec (LenLatex "latexmath:[f(a,b)]" :| [LenPath ("count" :| [])]))

unit_lenUnbalancedRejected :: IO ()
unit_lenUnbalancedRejected = do
  assertBool "dangling close" (isLeft (parseLen "a]b"))
  assertBool "dangling open" (isLeft (parseLen "latexmath:[oops"))

unit_altLenParenAwareSplit :: IO ()
unit_altLenParenAwareSplit = do
  parseAltLen "(rasterizationSamples + 31) / 32"
    @?= Right (AltLen ("(rasterizationSamples + 31) / 32" :| []))
  parseAltLen "codeSize / 4" @?= Right (AltLen ("codeSize / 4" :| []))
  parseAltLen "f(a,b),c" @?= Right (AltLen ("f(a,b)" :| ["c"]))

unit_externSyncForms :: IO ()
unit_externSyncForms = do
  parseExternSync "true" @?= Right SyncTrue
  parseExternSync "maybe" @?= Right SyncMaybe
  parseExternSync "pNameInfo->objectHandle"
    @?= Right
      ( SyncParams
          (SyncPath (SyncSeg "pNameInfo" False :| [SyncSeg "objectHandle" False]) :| [])
      )
  parseExternSync "maybe:pDescriptorWrites[].dstSet"
    @?= Right
      ( SyncMaybeParams
          (SyncPath (SyncSeg "pDescriptorWrites" True :| [SyncSeg "dstSet" False]) :| [])
      )
  parseExternSync "a.b,c[].d"
    @?= Right
      ( SyncParams
          ( SyncPath (SyncSeg "a" False :| [SyncSeg "b" False])
              :| [SyncPath (SyncSeg "c" True :| [SyncSeg "d" False])]
          )
      )

-- | Fields that merely start with the keywords must parse as paths.
unit_externSyncPartialKeywordIsPath :: IO ()
unit_externSyncPartialKeywordIsPath = do
  parseExternSync "maybelater"
    @?= Right (SyncParams (SyncPath (SyncSeg "maybelater" False :| []) :| []))
  parseExternSync "truex"
    @?= Right (SyncParams (SyncPath (SyncSeg "truex" False :| []) :| []))

unit_externSyncRejectsGarbage :: IO ()
unit_externSyncRejectsGarbage = do
  assertBool "bang" (isLeft (parseExternSync "!x"))
  assertBool "trailing dot" (isLeft (parseExternSync "a."))
  assertBool "empty" (isLeft (parseExternSync ""))

unit_literalForms :: IO ()
unit_literalForms = do
  parseValueLiteral "256" @?= Right (VInt 256)
  parseValueLiteral "-1" @?= Right (VInt (-1))
  parseValueLiteral "0x00000001" @?= Right (VInt 1)
  parseValueLiteral "(~0ULL)" @?= Right (VComplement 0 CW64)
  parseValueLiteral "(~0U)" @?= Right (VComplement 0 CW32)
  parseValueLiteral "(~1U)" @?= Right (VComplement 1 CW32)
  parseValueLiteral "1000.0F" @?= Right (VFloat 1000.0)
  parseValueLiteral "\"VK_KHR_surface\"" @?= Right (VString "VK_KHR_surface")
  parseValueLiteral "2*VK_UUID_SIZE" @?= Right (VExpr "2*VK_UUID_SIZE")

unit_literalEmptyRejected :: IO ()
unit_literalEmptyRejected = assertBool "empty literal" (isLeft (parseValueLiteral ""))

unit_versionNumbers :: IO ()
unit_versionNumbers = do
  parseVersion "1.4" @?= Right (1, 4)
  parseVersion "1.0" @?= Right (1, 0)
  renderVersion (1, 4) @?= "1.4"
  assertBool "junk version" (isLeft (parseVersion "1.x"))

genFieldIdent :: Gen Text
genFieldIdent =
  Gen.filter (`notElem` (["true", "maybe"] :: [Text]))
    $ T.cons
    <$> Gen.alpha
    <*> Gen.text (Range.linear 0 8) Gen.alphaNum

genLenSpec :: Gen LenSpec
genLenSpec = LenSpec <$> Gen.nonEmpty (Range.linear 1 3) genLevel
 where
  genLevel =
    Gen.choice
      [ pure LenNullTerminated
      , LenConst <$> Gen.integral (Range.linear 0 512)
      , LenPath <$> Gen.nonEmpty (Range.linear 1 3) genFieldIdent
      ]

hprop_lenRoundTrip :: Property
hprop_lenRoundTrip = property do
  spec <- forAll genLenSpec
  parseLen (display spec) === Right spec

genExternSync :: Gen ExternSync
genExternSync =
  Gen.choice
    [ pure SyncTrue
    , pure SyncMaybe
    , SyncParams <$> genPaths
    , SyncMaybeParams <$> genPaths
    ]
 where
  genPaths = Gen.nonEmpty (Range.linear 1 3) genPath
  genPath = SyncPath <$> Gen.nonEmpty (Range.linear 1 3) genSeg
  genSeg = SyncSeg <$> genFieldIdent <*> Gen.bool

hprop_externSyncRoundTrip :: Property
hprop_externSyncRoundTrip = property do
  sync <- forAll genExternSync
  parseExternSync (display sync) === Right sync

genLiteral :: Gen ValueLiteral
genLiteral =
  Gen.choice
    [ VInt <$> Gen.integral (Range.linearFrom 0 (-4096) 4096)
    , VComplement
        <$> Gen.integral (Range.linear 0 8)
        <*> Gen.element [CW32, CW64]
    , VString <$> Gen.text (Range.linear 0 16) Gen.alphaNum
    ]

hprop_literalRoundTrip :: Property
hprop_literalRoundTrip = property do
  lit <- forAll genLiteral
  parseValueLiteral (display lit) === Right lit
