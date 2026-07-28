{-# LANGUAGE OverloadedStrings #-}

-- | Shared attribute decoders wiring the micro-grammars into 'Decode'.
module Lithon.Codegen.Vulkan.Registry.Parse.Common (
  apiAttr,
  commentAttr,
  deprecatedAttr,
  protectAttr,
  dependsAttr,
  nameListAttr,
  namesAttr,
  boolListAttr,
  intAttrOpt,
  parseBoolText,
) where

import Data.List.NonEmpty qualified as NE
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (
  DependsExpr,
  ProtectExpr,
  parseDepends,
  parseProtect,
 )
import Lithon.Codegen.Vulkan.Registry.Micro.Common (parseDecimal, rawEither)
import Lithon.Codegen.Vulkan.Registry.Types.Common (
  ApiSet (..),
  Deprecation,
  Raw,
  deprecationTable,
  parseApiSet,
 )
import Lithon.Codegen.Vulkan.Xml.Decode (Decode, attrEnumOpt, attrOpt, attrOptDefault, attrOptWith)

-- | @api=@ — absent means all APIs.
apiAttr :: Decode ApiSet
apiAttr = attrOptDefault "api" AllApis parseApiSet

commentAttr :: Decode (Maybe Text)
commentAttr = attrOpt "comment"

deprecatedAttr :: Decode (Maybe Deprecation)
deprecatedAttr = attrEnumOpt "deprecated" deprecationTable

protectAttr :: Decode (Maybe (Raw ProtectExpr))
protectAttr = attrOptWith "protect" (rawEither parseProtect)

dependsAttr :: Decode (Maybe (Raw DependsExpr))
dependsAttr = attrOptWith "depends" (rawEither parseDepends)

-- | A comma-separated typed-name list; absent means empty.
namesAttr :: Text -> Decode [WithNS k]
namesAttr key = map WithNS <$> nameListAttr key

-- | A comma-separated name list; absent means empty.
nameListAttr :: Text -> Decode [Text]
nameListAttr key = attrOptDefault key [] split
 where
  split input
    | T.null input = Left "empty name list"
    | any T.null pieces = Left "empty entry in name list"
    | otherwise = Right pieces
   where
    pieces = T.splitOn "," input

-- | A comma-separated boolean list (@optional=\"false,true\"@).
boolListAttr :: Text -> Decode (Maybe (NonEmpty Bool))
boolListAttr key = attrOptWith key \input -> do
  pieces <- maybe (Left "empty boolean list") Right (NE.nonEmpty (T.splitOn "," input))
  traverse parseBoolText pieces

parseBoolText :: Text -> Either Text Bool
parseBoolText = \case
  "true" -> Right True
  "false" -> Right False
  _ -> Left "expected true or false"

intAttrOpt :: Text -> Decode (Maybe Int)
intAttrOpt key = attrOptWith key parseDecimal
