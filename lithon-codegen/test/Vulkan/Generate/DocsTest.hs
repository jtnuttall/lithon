{-# LANGUAGE OverloadedStrings #-}

-- | The docs pass: escaping safety (property) and content exemplars.
-- @cabal haddock lithon@ is the whole-surface gate; these keep the
-- escaping function honest under arbitrary registry prose.
module Vulkan.Generate.DocsTest (
  hprop_escapeNeutralizesMarkup,
  hprop_escapeSingleLine,
  unit_docExemplars,
) where

import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Hedgehog
import Hedgehog.Gen qualified as Gen
import Hedgehog.Range qualified as Range
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool)

import Lithon.Codegen.Backend.Hs (escapeHaddock)
import Lithon.Codegen.Vulkan.Curate (Curated (..))
import Lithon.Codegen.Vulkan.Generate.Docs (DocKey (..), DocsMap (..), synthesizeDocs)
import Lithon.Codegen.Vulkan.Generate.Layout (computeLayouts)
import Lithon.Codegen.Vulkan.Generate.Lower (lowerStructs)
import Lithon.Codegen.Vulkan.Generate.Marshal (planStructs)
import Vulkan.Support.Resolve (pinnedCurated)

-- every markup-significant character comes out backslash-escaped:
-- consuming escape pairs left to right leaves no bare special behind
hprop_escapeNeutralizesMarkup :: Property
hprop_escapeNeutralizesMarkup = property do
  t <- forAll (Gen.text (Range.linear 0 200) Gen.unicode)
  let escaped = escapeHaddock t
      specials = "\\/'`\"@<>$#*&[]{}" :: String
      ok ('\\' : c : rest) | c `elem` specials = ok rest
      ok (c : rest) = c `notElem` specials && ok rest
      ok [] = True
  annotateShow escaped
  assert (ok (T.unpack escaped))

-- newlines can never escape the comment line
hprop_escapeSingleLine :: Property
hprop_escapeSingleLine = property do
  t <- forAll (Gen.text (Range.linear 0 200) Gen.unicode)
  assert (not (T.any (\c -> c == '\n' || c == '\r') (escapeHaddock t)))

unit_docExemplars :: IO ()
unit_docExemplars = do
  let registry = pinnedCurated.registry
      req what = either (\e -> error (what <> " failed: " <> display e)) id . validationToEither
      lowered = req "lower" (lowerStructs registry)
      layouts = req "layout" (computeLayouts (registry, lowered))
      structPlans = req "marshal" (planStructs (registry, lowered, layouts))
      DocsMap docs = req "docs" (synthesizeDocs (registry, structPlans))
      docOf k = Map.findWithDefault [] k docs
      hasDoc k needle = any (needle `T.isInfixOf`) (docOf k)
  assertBool
    "ImageCreateInfo carries its man link"
    (hasDoc (DocType "VkImageCreateInfo") "VkImageCreateInfo.html")
  assertBool
    "ImageCreateInfo notes the derived count"
    (hasDoc (DocType "VkImageCreateInfo") "queueFamilyIndexCount")
  assertBool
    "createInstance carries availability"
    (hasDoc (DocCommand "vkCreateInstance") "Available:")
  assertBool
    "swapchain type is marked platform-agnostic core-or-extension available"
    (not (null (docOf (DocType "VkSwapchainCreateInfoKHR"))))
  assertBool
    "PresentInfoKHR notes the raw pResults escape"
    (hasDoc (DocType "VkPresentInfoKHR") "pResults")
