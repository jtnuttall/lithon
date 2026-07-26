{-# LANGUAGE OverloadedStrings #-}

-- | Decoders for @\<feature\>@ blocks and the @\<extensions\>@ section.
module Lithon.Codegen.Vulkan.Registry.Parse.Features (
  featureD,
  extensionsSectionD,
) where

import Data.List.NonEmpty qualified as NE
import Data.Set.NonEmpty qualified as NESet
import Data.Text qualified as T

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.Common (parseDecimal, rawEither)
import Lithon.Codegen.Vulkan.Registry.Micro.Literal (parseVersion)
import Lithon.Codegen.Vulkan.Registry.Parse.Common (
  apiAttr,
  commentAttr,
  dependsAttr,
  intAttrOpt,
  nameListAttr,
  parseBoolText,
  protectAttr,
 )
import Lithon.Codegen.Vulkan.Registry.Parse.Enums (enumDefD)
import Lithon.Codegen.Vulkan.Registry.Types.Common (Api, parseApi, parseApiList)
import Lithon.Codegen.Vulkan.Registry.Types.Features (
  ChangeBlock (..),
  DeprecateBlock (..),
  DeprecateItem (..),
  Extension (..),
  ExtensionSupport (..),
  ExtensionType (..),
  Feature (..),
  FeatureVisibility (..),
  InterfaceItem (..),
  RemoveBlock (..),
  RequireBlock (..),
 )
import Lithon.Codegen.Vulkan.Xml.Decode (
  Decode,
  attr,
  attrEnumDefault,
  attrEnumOpt,
  attrName,
  attrOpt,
  attrOptDefault,
  attrOptWith,
  attrWith,
  currentPos,
  dispatchRest,
  manyNext,
  textOnly,
 )
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

featureD :: Decode Feature
featureD = do
  pos <- currentPos
  api <- attrWith "api" parseApiList
  apiType <- attrEnumDefault "apitype" VisPublic [("internal", VisInternal), ("public", VisPublic)]
  name <- attrName "name"
  number <- attrOptWith "number" (rawEither parseVersion)
  depends <- dependsAttr
  protect <- protectAttr
  sortOrder <- intAttrOpt "sortorder"
  comment <- commentAttr
  changes <- changeBlocksD
  pure Feature{api, apiType, name, number, depends, protect, sortOrder, comment, changes, pos}

changeBlocksD :: Decode (Vector ChangeBlock)
changeBlocksD =
  dispatchRest
    [ ("require", ChRequire <$> requireD)
    , ("deprecate", ChDeprecate <$> deprecateD)
    , ("remove", ChRemove <$> removeD)
    ]

requireD :: Decode RequireBlock
requireD = do
  pos <- currentPos
  api <- apiAttr
  profile <- attrOpt "profile"
  depends <- dependsAttr
  comment <- commentAttr
  items <- interfaceItemsD
  pure RequireBlock{api, profile, depends, comment, items, pos}

interfaceItemsD :: Decode (Vector InterfaceItem)
interfaceItemsD =
  dispatchRest
    [ ("type", namedRef ReqType)
    , ("enum", ReqEnum <$> enumDefD)
    , ("command", namedRef ReqCommand)
    , ("feature", featureRefD)
    , ("comment", ReqComment <$> textOnly)
    ]

namedRef :: (Text -> Maybe Text -> Pos -> InterfaceItem) -> Decode InterfaceItem
namedRef mk = do
  pos <- currentPos
  name <- attr "name"
  comment <- commentAttr
  pure (mk name comment pos)

featureRefD :: Decode InterfaceItem
featureRefD = do
  pos <- currentPos
  names <- attrWith "name" commaNames1
  struct <- attrName "struct"
  comment <- commentAttr
  pure ReqFeature{names, struct, comment, pos}

deprecateD :: Decode DeprecateBlock
deprecateD = do
  pos <- currentPos
  explanationLink <- attr "explanationlink"
  api <- apiAttr
  comment <- commentAttr
  items <-
    dispatchRest
      [ ("type", nameOnly DepType)
      , ("command", nameOnly DepCommand)
      , ("feature", depFeatureD)
      ]
  pure DeprecateBlock{explanationLink, api, comment, items, pos}
 where
  nameOnly mk = do
    pos <- currentPos
    name <- attr "name"
    supersededBy <- attrOpt "supersededby"
    pure (mk name supersededBy pos)
  depFeatureD = do
    pos <- currentPos
    names <- attrWith "name" commaNames1
    struct <- attrName "struct"
    pure DepFeature{names, struct, pos}

removeD :: Decode RemoveBlock
removeD = do
  pos <- currentPos
  reasonLink <- attrOpt "reasonlink"
  api <- apiAttr
  comment <- commentAttr
  items <- interfaceItemsD
  pure RemoveBlock{reasonLink, api, comment, items, pos}

extensionsSectionD :: Decode (Vector Extension)
extensionsSectionD = do
  _comment <- commentAttr
  manyNext "extension" extensionD

extensionD :: Decode Extension
extensionD = do
  pos <- currentPos
  name <- attrName "name"
  number <- attrWith "number" intText
  extensionType <-
    attrEnumOpt "type" [("instance", ExtInstance), ("device", ExtDevice)]
  author <- attrOpt "author"
  contact <- attrOpt "contact"
  depends <- dependsAttr
  supported <- attrWith "supported" parseSupported
  ratified <- attrOptDefault "ratified" [] commaApis
  platform <- attrOpt "platform"
  protect <- protectAttr
  promotedTo <- attrOpt "promotedto"
  deprecatedBy <- attrOpt "deprecatedby"
  obsoletedBy <- attrOpt "obsoletedby"
  provisional <- attrOptDefault "provisional" False parseBoolText
  specialUse <- nameListAttr "specialuse"
  noFeatures <- attrOptWith "nofeatures" parseBoolText
  sortOrder <- intAttrOpt "sortorder"
  comment <- commentAttr
  changes <- changeBlocksD
  pure
    Extension{..}
 where
  parseSupported = \case
    "disabled" -> Right SupportedDisabled
    other -> do
      apis <- parseApiList other
      let set = NESet.fromList apis
      if NESet.size set == length apis then
        Right (SupportedApis set)
      else
        Left "duplicate api variant in supported list"

-- | One-or-more comma-separated names (nested feature refs).
commaNames1 :: Text -> Either Text (NonEmpty Text)
commaNames1 input = case NE.nonEmpty (T.splitOn "," input) of
  Just names | not (any T.null names) -> Right names
  _ -> Left "expected a non-empty comma-separated name list"

commaApis :: Text -> Either Text [Api]
commaApis = traverse parseApi . T.splitOn ","

intText :: Text -> Either Text Int
intText = parseDecimal
