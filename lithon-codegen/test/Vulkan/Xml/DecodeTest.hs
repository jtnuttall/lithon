{-# LANGUAGE OverloadedStrings #-}

-- | Decoder-combinator semantics: total consumption, leftover reporting,
-- per-item recovery, multi-error accumulation, path/position quality, and
-- ignore-list suppression.
module Vulkan.Xml.DecodeTest (
  unit_attrsConsumedCleanly,
  unit_leftoverAttrReported,
  unit_missingAttrAborts,
  unit_malformedAttrCarriesMessage,
  unit_attrEnumRejectsUnknownValue,
  unit_attrBoolDefaults,
  unit_nextChildInOrder,
  unit_nextChildWrongOrderAborts,
  unit_optNextChildAbsent,
  unit_manyNextThenLeftover,
  unit_manyNextRecoversPerItem,
  unit_dispatchRestOrderAndUnknowns,
  unit_leftoverTextAndChildReported,
  unit_textOnlyHappy,
  unit_textOnlyRejectsElement,
  unit_mixedNodesDrainsEverything,
  unit_nestedPathsInErrors,
  unit_pathSegsCarryNameAttr,
  unit_ignoreListSuppressesExactly,
  unit_warnIsNotAnError,
  unit_wrongRootNameReported,
) where

import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Vector qualified as V
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure, (@?=))

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Xml.Decode (
  Decode,
  ErrorKind (..),
  IgnoreList (..),
  ParseError (..),
  Warning (..),
  attr,
  attrBool,
  attrEnum,
  attrWith,
  dispatchRest,
  emptyIgnoreList,
  manyNext,
  mixedNodes,
  nextChild,
  optNextChild,
  runDecodeRoot,
  textOnly,
  warn,
 )
import Lithon.Codegen.Vulkan.Xml.Load (loadXmlBytes)
import Lithon.Codegen.Vulkan.Xml.Types (XElement (..), XNode (..), XPath)

-- | Load a fixture and decode its root (root-name check bypassed by using
-- the actual root name).
runOn :: ByteString -> Decode a -> (Maybe a, [ParseError], [Text])
runOn bytes decoder = case loadXmlBytes bytes of
  Left err -> error ("fixture failed to load: " <> show err)
  Right el ->
    let (r, es, ws) = runDecodeRoot emptyIgnoreList el.name decoder el
     in (r, es, map (.message) ws)

runOnIgnoring :: IgnoreList -> ByteString -> Decode a -> (Maybe a, [ParseError], [Text])
runOnIgnoring ignore bytes decoder = case loadXmlBytes bytes of
  Left err -> error ("fixture failed to load: " <> show err)
  Right el ->
    let (r, es, ws) = runDecodeRoot ignore el.name decoder el
     in (r, es, map (.message) ws)

kinds :: [ParseError] -> [ErrorKind]
kinds = map (.kind)

pathContains :: Text -> ParseError -> Assertion
pathContains needle err =
  assertBool
    ("expected path containing " <> show needle <> ", got " <> show (display @XPath err.path))
    (needle `T.isInfixOf` display err.path)

unit_attrsConsumedCleanly :: IO ()
unit_attrsConsumedCleanly = do
  let (r, es, _) = runOn "<r a=\"1\" b=\"2\"/>" ((,) <$> attr "a" <*> attr "b")
  r @?= Just ("1", "2")
  es @?= []

unit_leftoverAttrReported :: IO ()
unit_leftoverAttrReported = do
  let (r, es, _) = runOn "<r a=\"1\" extra=\"x\"/>" (attr "a")
  r @?= Just "1"
  kinds es @?= [UnknownAttribute "extra" "x"]

unit_missingAttrAborts :: IO ()
unit_missingAttrAborts = do
  let (r, es, _) = runOn "<r/>" (attr "z")
  r @?= (Nothing :: Maybe Text)
  kinds es @?= [MissingAttribute "z"]

unit_malformedAttrCarriesMessage :: IO ()
unit_malformedAttrCarriesMessage = do
  let (r, es, _) =
        runOn "<r a=\"nope\"/>" (attrWith "a" (\_ -> Left "boom" :: Either Text ()))
  r @?= Nothing
  kinds es @?= [MalformedAttribute "a" "nope" "boom"]

unit_attrEnumRejectsUnknownValue :: IO ()
unit_attrEnumRejectsUnknownValue = do
  let table = [("inside", True), ("outside", False)]
  let (r1, es1, _) = runOn "<r scope=\"inside\"/>" (attrEnum "scope" table)
  r1 @?= Just True
  es1 @?= []
  let (r2, es2, _) = runOn "<r scope=\"sideways\"/>" (attrEnum "scope" table)
  r2 @?= Nothing
  case kinds es2 of
    [MalformedAttribute "scope" "sideways" _] -> pure ()
    other -> assertFailure ("unexpected errors: " <> show other)

unit_attrBoolDefaults :: IO ()
unit_attrBoolDefaults = do
  let (r1, es1, _) = runOn "<r/>" (attrBool "flag" False)
  (r1, es1) @?= (Just False, [])
  let (r2, es2, _) = runOn "<r flag=\"true\"/>" (attrBool "flag" False)
  (r2, es2) @?= (Just True, [])

unit_nextChildInOrder :: IO ()
unit_nextChildInOrder = do
  let (r, es, _) =
        runOn "<r>\n  <x/>\n  <y/>\n</r>" (nextChild "x" (pure ()) *> nextChild "y" (pure ()))
  r @?= Just ()
  es @?= []

unit_nextChildWrongOrderAborts :: IO ()
unit_nextChildWrongOrderAborts = do
  let (r, es, _) = runOn "<r><x/><y/></r>" (nextChild "y" (pure ()))
  r @?= Nothing
  kinds es @?= [MissingChild "y"]

unit_optNextChildAbsent :: IO ()
unit_optNextChildAbsent = do
  let (r, es, _) = runOn "<r><y/></r>" (optNextChild "x" (pure ()) <* nextChild "y" (pure ()))
  r @?= Just Nothing
  es @?= []

unit_manyNextThenLeftover :: IO ()
unit_manyNextThenLeftover = do
  let (r, es, _) = runOn "<r><i v=\"1\"/><i v=\"2\"/><j/></r>" (manyNext "i" (attr "v"))
  r @?= Just (V.fromList ["1", "2"])
  kinds es @?= [UnknownElement "j"]

unit_manyNextRecoversPerItem :: IO ()
unit_manyNextRecoversPerItem = do
  let (r, es, _) = runOn "<r><i v=\"1\"/><i/><i v=\"3\"/></r>" (manyNext "i" (attr "v"))
  r @?= Just (V.fromList ["1", "3"])
  kinds es @?= [MissingAttribute "v"]
  case es of
    [e] -> pathContains "i[1]" e
    _ -> assertFailure "expected exactly one error"

unit_dispatchRestOrderAndUnknowns :: IO ()
unit_dispatchRestOrderAndUnknowns = do
  let (r, es, _) =
        runOn
          "<r><x/><y/><z/><x/></r>"
          (dispatchRest [("x", pure @Decode ("x" :: Text)), ("y", pure "y")])
  r @?= Just (V.fromList ["x", "y", "x"])
  kinds es @?= [UnknownElement "z"]
  case es of
    [e] -> pathContains "z[2]" e
    _ -> assertFailure "expected exactly one error"

unit_leftoverTextAndChildReported :: IO ()
unit_leftoverTextAndChildReported = do
  let (r, es, _) = runOn "<r>stray<x/></r>" (pure ())
  r @?= Just ()
  kinds es @?= [UnexpectedText "stray", UnknownElement "x"]

unit_textOnlyHappy :: IO ()
unit_textOnlyHappy = do
  let (r, es, _) = runOn "<r>hello world</r>" textOnly
  (r, es) @?= (Just "hello world", [])

unit_textOnlyRejectsElement :: IO ()
unit_textOnlyRejectsElement = do
  let (r, es, _) = runOn "<r>hello <b/></r>" textOnly
  r @?= Nothing
  case kinds es of
    [CustomError msg] -> assertBool "mentions <b>" ("<b>" `T.isInfixOf` msg)
    other -> assertFailure ("unexpected errors: " <> show other)

unit_mixedNodesDrainsEverything :: IO ()
unit_mixedNodesDrainsEverything = do
  let (r, es, _) = runOn "<r>const <t>uint32_t</t>* <n>pCode</n></r>" mixedNodes
  es @?= []
  case r of
    Just nodes ->
      [n | XText n _ <- nodes] @?= ["const ", "* "]
    Nothing -> assertFailure "decoder aborted"

unit_nestedPathsInErrors :: IO ()
unit_nestedPathsInErrors = do
  let (r, es, _) =
        runOn "<r><a><b bad=\"1\"/></a></r>" (nextChild "a" (nextChild "b" (pure ())))
  r @?= Just ()
  kinds es @?= [UnknownAttribute "bad" "1"]
  case es of
    [e] -> pathContains "a[0]/b[0]" e
    _ -> assertFailure "expected exactly one error"

unit_pathSegsCarryNameAttr :: IO ()
unit_pathSegsCarryNameAttr = do
  let (_, es, _) =
        runOn "<r><t name=\"VkFoo\" bogus=\"1\"/></r>" (nextChild "t" (attr "name"))
  case es of
    [e] -> pathContains "t[0]{VkFoo}" e
    _ -> assertFailure ("expected exactly one error, got " <> show es)

unit_ignoreListSuppressesExactly :: IO ()
unit_ignoreListSuppressesExactly = do
  let ignore =
        IgnoreList
          { attributes = Map.singleton "r" (Set.singleton "legacy")
          , children = Map.singleton "r" (Set.singleton "junk")
          }
  let (r, es, _) =
        runOnIgnoring ignore "<r legacy=\"1\" other=\"2\"><junk/><mystery/></r>" (pure ())
  r @?= Just ()
  kinds es @?= [UnknownAttribute "other" "2", UnknownElement "mystery"]

unit_warnIsNotAnError :: IO ()
unit_warnIsNotAnError = do
  let (r, es, ws) = runOn "<r/>" (warn "heads up")
  (r, es) @?= (Just (), [])
  ws @?= ["heads up"]

unit_wrongRootNameReported :: IO ()
unit_wrongRootNameReported = do
  let outcome = case loadXmlBytes "<notregistry/>" of
        Left err -> error (show err)
        Right el -> runDecodeRoot emptyIgnoreList "registry" (pure ()) el
  case outcome of
    (Just (), [e], _) -> case e.kind of
      CustomError msg -> assertBool "names expected root" ("registry" `T.isInfixOf` msg)
      other -> assertFailure ("unexpected kind: " <> show other)
    other -> assertFailure ("unexpected outcome: " <> show ((\(a, b, _) -> (a, b)) other))
