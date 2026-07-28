{-# LANGUAGE OverloadedStrings #-}

-- | Decoders for @\<enums\>@ blocks and the shared @\<enum\>@ element.
module Lithon.Codegen.Vulkan.Registry.Parse.Enums (
  enumsBlockD,
  enumDefD,
) where

import Lithon.Prelude

import Lithon.Codegen.Vulkan.Registry.Micro.Common (rawEither)
import Lithon.Codegen.Vulkan.Registry.Micro.Literal (parseValueLiteral)
import Lithon.Codegen.Vulkan.Registry.Parse.Common (
  apiAttr,
  commentAttr,
  deprecatedAttr,
  intAttrOpt,
  protectAttr,
 )
import Lithon.Codegen.Vulkan.Registry.Types.Enums (
  BitWidth (..),
  EnumDef (..),
  EnumValueSpec (..),
  EnumValueType (..),
  EnumsBlock (..),
  EnumsItem (..),
  EnumsKind (..),
  UnusedRange (..),
 )
import Lithon.Codegen.Vulkan.Xml.Decode (
  Decode,
  ErrorKind (..),
  abortWith,
  attr,
  attrEnum,
  attrEnumDefault,
  attrEnumOpt,
  attrName,
  attrNameOpt,
  attrOpt,
  attrOptWith,
  currentPos,
  dispatchRest,
  textOnly,
 )

enumsBlockD :: Decode EnumsBlock
enumsBlockD = do
  pos <- currentPos
  name <- attrName "name"
  kind <-
    attrEnum
      "type"
      [ ("enum", KindEnum)
      , ("bitmask", KindBitmask)
      , ("constants", KindConstants)
      ]
  bitWidth <- attrEnumDefault "bitwidth" W32 [("64", W64)]
  comment <- commentAttr
  items <-
    dispatchRest
      [ ("enum", ItemEnum <$> enumDefD)
      , ("unused", ItemUnused <$> unusedD)
      , ("comment", ItemComment <$> textOnly)
      ]
  pure EnumsBlock{name, kind, bitWidth, comment, items, pos}

unusedD :: Decode UnusedRange
unusedD = do
  pos <- currentPos
  start <- attrWithLiteral "start"
  end <- attrOptWith "end" (rawEither parseValueLiteral)
  vendor <- attrOpt "vendor"
  comment <- commentAttr
  pure UnusedRange{start, end, vendor, comment, pos}
 where
  attrWithLiteral key = do
    raw <- attr key
    either (abortWith . MalformedAttribute key raw) pure (rawEither parseValueLiteral raw)

-- | The one @\<enum\>@ schema, shared by @\<enums\>@ blocks and
-- feature\/extension @\<require\>@\/@\<remove\>@ items.
enumDefD :: Decode EnumDef
enumDefD = do
  pos <- currentPos
  name <- attrName "name"
  extends <- attrNameOpt "extends"
  extNumber <- intAttrOpt "extnumber"
  valueType <-
    attrEnumOpt
      "type"
      [ ("float", EVTFloat)
      , ("uint32_t", EVTUInt32)
      , ("uint64_t", EVTUInt64)
      ]
  api <- apiAttr
  protect <- protectAttr
  deprecated <- deprecatedAttr
  comment <- commentAttr
  spec <- valueSpecD
  pure
    EnumDef{..}

valueSpecD :: Decode EnumValueSpec
valueSpecD = do
  value <- attrOptWith "value" (rawEither parseValueLiteral)
  bitpos <- intAttrOpt "bitpos"
  offset <- intAttrOpt "offset"
  alias <- attrNameOpt "alias"
  dir <- attrEnumOpt "dir" [("-", ())]
  case (value, bitpos, offset, alias, dir) of
    (Just v, Nothing, Nothing, a, Nothing) -> pure (EvValue v a)
    (Nothing, Just b, Nothing, a, Nothing) -> pure (EvBitpos b a)
    (Nothing, Nothing, Just o, Nothing, d) ->
      pure EvOffset{offset = o, negative = d == Just ()}
    (Nothing, Nothing, Nothing, Just a, Nothing) -> pure (EvAlias a)
    (Nothing, Nothing, Nothing, Nothing, Nothing) -> pure EvNone
    _ ->
      abortWith
        (CustomError "conflicting enum value encodings (value/bitpos/offset/alias/dir)")
