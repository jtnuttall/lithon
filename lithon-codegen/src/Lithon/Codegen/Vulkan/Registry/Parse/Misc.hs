{-# LANGUAGE OverloadedStrings #-}

-- | Decoders for the formats, sync, SPIR-V, and video-codec sections.
module Lithon.Codegen.Vulkan.Registry.Parse.Misc (
  formatsSectionD,
  syncSectionD,
  spirvExtensionsSectionD,
  spirvCapabilitiesSectionD,
  videoCodecsSectionD,
) where

import Data.Text qualified as T

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.Common (parseDecimal, rawEither)
import Lithon.Codegen.Vulkan.Registry.Parse.Common (
  commentAttr,
  dependsAttr,
  intAttrOpt,
  nameListAttr,
 )
import Lithon.Codegen.Vulkan.Registry.Types.Misc (
  BitsSpec (..),
  Chroma (..),
  Component (..),
  Enable (..),
  Format (..),
  NumericFormat (..),
  Plane (..),
  SpirvCapability (..),
  SpirvExtension (..),
  SyncAccess (..),
  SyncEquivalent (..),
  SyncPipeline (..),
  SyncPipelineStage (..),
  SyncSection (..),
  SyncStage (..),
  SyncSupport (..),
  VideoCodec (..),
  VideoFormat (..),
  VideoProfileMember (..),
  VideoProfileValue (..),
  VideoProfiles (..),
  VideoRequireCapabilities (..),
 )
import Lithon.Codegen.Vulkan.Xml.Decode (
  Decode,
  abortWith,
  attr,
  attrEnum,
  attrEnumOpt,
  attrOpt,
  attrOptWith,
  attrWith,
  currentPos,
  manyNext,
  optNextChild,
  textOnly,
 )
import Lithon.Codegen.Vulkan.Xml.Decode qualified as Decode

-- Formats ---------------------------------------------------------------------

formatsSectionD :: Decode (Vector Format)
formatsSectionD = manyNext "format" formatD

formatD :: Decode Format
formatD = do
  pos <- currentPos
  name <- attr "name"
  compatibilityClass <- attr "class"
  blockSize <- attrWith "blockSize" parseDecimal
  texelsPerBlock <- attrWith "texelsPerBlock" parseDecimal
  blockExtent <- attrOptWith "blockExtent" (rawEither extent3)
  packed <- intAttrOpt "packed"
  compressed <- attrOpt "compressed"
  chroma <-
    attrEnumOpt "chroma" [("420", Chroma420), ("422", Chroma422), ("444", Chroma444)]
  components <- manyNext "component" componentD
  planes <- manyNext "plane" planeD
  spirvImageFormats <- manyNext "spirvimageformat" (attr "name")
  pure
    Format
      { name
      , compatibilityClass
      , blockSize
      , texelsPerBlock
      , blockExtent
      , packed
      , compressed
      , chroma
      , components
      , planes
      , spirvImageFormats
      , pos
      }
 where
  extent3 input = case T.splitOn "," input of
    [a, b, c] -> (,,) <$> parseDecimal a <*> parseDecimal b <*> parseDecimal c
    _ -> Left "expected three comma-separated integers"

componentD :: Decode Component
componentD = do
  pos <- currentPos
  name <- attr "name"
  bits <- attrWith "bits" \case
    "compressed" -> Right BitsCompressed
    other -> BitsInt <$> parseDecimal other
  numericFormat <-
    attrEnum
      "numericFormat"
      [ ("UNORM", NFUnorm)
      , ("SNORM", NFSnorm)
      , ("USCALED", NFUscaled)
      , ("SSCALED", NFSscaled)
      , ("UINT", NFUint)
      , ("SINT", NFSint)
      , ("UFLOAT", NFUfloat)
      , ("SFLOAT", NFSfloat)
      , ("SRGB", NFSrgb)
      , ("SFIXED5", NFSfixed5)
      , ("BOOL", NFBool)
      ]
  planeIndex <- intAttrOpt "planeIndex"
  pure Component{name, bits, numericFormat, planeIndex, pos}

planeD :: Decode Plane
planeD = do
  pos <- currentPos
  index <- attrWith "index" parseDecimal
  widthDivisor <- attrWith "widthDivisor" parseDecimal
  heightDivisor <- attrWith "heightDivisor" parseDecimal
  compatible <- attr "compatible"
  pure Plane{index, widthDivisor, heightDivisor, compatible, pos}

-- Sync ------------------------------------------------------------------------

syncSectionD :: Decode SyncSection
syncSectionD = do
  comment <- commentAttr
  stages <- manyNext "syncstage" syncStageD
  accesses <- manyNext "syncaccess" syncAccessD
  pipelines <- manyNext "syncpipeline" syncPipelineD
  pure SyncSection{comment, stages, accesses, pipelines}

syncStageD :: Decode SyncStage
syncStageD = do
  pos <- currentPos
  name <- attr "name"
  alias <- attrOpt "alias"
  support <- optNextChild "syncsupport" syncSupportD
  equivalent <- optNextChild "syncequivalent" syncEquivalentD
  pure SyncStage{name, alias, support, equivalent, pos}

syncAccessD :: Decode SyncAccess
syncAccessD = do
  pos <- currentPos
  name <- attr "name"
  alias <- attrOpt "alias"
  comment <- optNextChild "comment" textOnly
  support <- optNextChild "syncsupport" syncSupportD
  equivalent <- optNextChild "syncequivalent" syncEquivalentD
  pure SyncAccess{name, alias, comment, support, equivalent, pos}

syncSupportD :: Decode SyncSupport
syncSupportD = do
  queues <- nameListAttr "queues"
  stages <- nameListAttr "stage"
  pure SyncSupport{queues, stages}

syncEquivalentD :: Decode SyncEquivalent
syncEquivalentD = do
  stages <- nameListAttr "stage"
  accesses <- nameListAttr "access"
  pure SyncEquivalent{stages, accesses}

syncPipelineD :: Decode SyncPipeline
syncPipelineD = do
  pos <- currentPos
  name <- attr "name"
  depends <- dependsAttr
  stages <- manyNext "syncpipelinestage" do
    stagePos <- currentPos
    order <- attrOpt "order"
    before <- attrOpt "before"
    after <- attrOpt "after"
    stage <- textOnly
    pure SyncPipelineStage{order, before, after, stage, pos = stagePos}
  pure SyncPipeline{name, depends, stages, pos}

-- SPIR-V ----------------------------------------------------------------------

spirvExtensionsSectionD :: Decode (Vector SpirvExtension)
spirvExtensionsSectionD = do
  _comment <- commentAttr
  manyNext "spirvextension" do
    pos <- currentPos
    name <- attr "name"
    enables <- manyNext "enable" enableD
    pure SpirvExtension{name, enables, pos}

spirvCapabilitiesSectionD :: Decode (Vector SpirvCapability)
spirvCapabilitiesSectionD = do
  _comment <- commentAttr
  manyNext "spirvcapability" do
    pos <- currentPos
    name <- attr "name"
    enables <- manyNext "enable" enableD
    pure SpirvCapability{name, enables, pos}

enableD :: Decode Enable
enableD = do
  version <- attrOpt "version"
  extension <- attrOpt "extension"
  struct <- attrOpt "struct"
  property <- attrOpt "property"
  case (version, extension, struct, property) of
    (Just v, Nothing, Nothing, Nothing) -> pure (EnableVersion v)
    (Nothing, Just e, Nothing, Nothing) -> pure (EnableExtension (WithNS e))
    (Nothing, Nothing, Just s, Nothing) -> do
      feature <- attr "feature"
      requires <- attrOpt "requires"
      alias <- attrOpt "alias"
      pure EnableFeature{struct = s, feature, requires, alias}
    (Nothing, Nothing, Nothing, Just p) -> do
      member <- attr "member"
      value <- attr "value"
      requires <- attrOpt "requires"
      pure EnableProperty{property = p, member, value, requires}
    _ ->
      abortWith
        (Decode.CustomError "expected exactly one of version/extension/struct/property on <enable>")

-- Video codecs ----------------------------------------------------------------

videoCodecsSectionD :: Decode (Vector VideoCodec)
videoCodecsSectionD = do
  _comment <- commentAttr
  manyNext "videocodec" videoCodecD

videoCodecD :: Decode VideoCodec
videoCodecD = do
  pos <- currentPos
  name <- attr "name"
  extend <- attrOpt "extend"
  value <- attrOpt "value"
  profiles <- manyNext "videoprofiles" videoProfilesD
  capabilities <- manyNext "videocapabilities" (attr "struct")
  formats <- manyNext "videoformat" videoFormatD
  pure VideoCodec{name, extend, value, profiles, capabilities, formats, pos}

videoProfilesD :: Decode VideoProfiles
videoProfilesD = do
  pos <- currentPos
  struct <- attr "struct"
  members <- manyNext "videoprofilemember" do
    memberPos <- currentPos
    name <- attr "name"
    values <- manyNext "videoprofile" do
      valuePos <- currentPos
      name' <- attr "name"
      value <- attr "value"
      pure VideoProfileValue{name = name', value, pos = valuePos}
    pure VideoProfileMember{name, values, pos = memberPos}
  pure VideoProfiles{struct, members, pos}

videoFormatD :: Decode VideoFormat
videoFormatD = do
  pos <- currentPos
  name <- attrOpt "name"
  usage <- attrOpt "usage"
  extend <- attrOpt "extend"
  requireCapabilities <- manyNext "videorequirecapabilities" do
    capPos <- currentPos
    struct <- attr "struct"
    member <- attr "member"
    value <- attr "value"
    pure VideoRequireCapabilities{struct, member, value, pos = capPos}
  properties <- manyNext "videoformatproperties" (attr "struct")
  pure VideoFormat{name, usage, extend, requireCapabilities, properties, pos}
