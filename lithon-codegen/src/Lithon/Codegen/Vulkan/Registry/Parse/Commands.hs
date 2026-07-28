{-# LANGUAGE OverloadedStrings #-}

-- | Decoders for the @\<commands\>@ section.
module Lithon.Codegen.Vulkan.Registry.Parse.Commands (
  commandsSectionD,
  commandD,
) where

import Data.Text qualified as T
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Registry.Parse.Common (
  apiAttr,
  commentAttr,
  nameListAttr,
  parseBoolText,
 )
import Lithon.Codegen.Vulkan.Registry.Parse.Decls (paramD, protoD)
import Lithon.Codegen.Vulkan.Registry.Types.Commands (
  CmdBufferLevel (..),
  Command (..),
  CommandDefinition (..),
  QueueTask (..),
  Scope (..),
 )
import Lithon.Codegen.Vulkan.Xml.Decode (
  Decode,
  attrEnumOpt,
  attrName,
  attrNameOpt,
  attrOptWith,
  currentPos,
  manyNext,
  nextChild,
  optNextChild,
  textOnly,
 )
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

commandsSectionD :: Decode (Vector Command)
commandsSectionD = do
  _comment <- commentAttr
  manyNext "command" commandD

commandD :: Decode Command
commandD = do
  pos <- currentPos
  alias <- attrNameOpt "alias"
  case alias of
    Just target -> do
      name <- attrName "name"
      api <- apiAttr
      comment <- commentAttr
      pure CommandAlias{name, alias = target, api, comment, pos}
    Nothing -> CommandDef <$> commandDefinitionD pos

commandDefinitionD :: Pos -> Decode CommandDefinition
commandDefinitionD pos = do
  api <- apiAttr
  queues <- map QueueTask <$> nameListAttr "queues"
  successCodes <- nameListAttr "successcodes"
  errorCodes <- nameListAttr "errorcodes"
  renderPass <- scopeAttr "renderpass"
  videoCoding <- scopeAttr "videocoding"
  conditionalRendering <- attrOptWith "conditionalrendering" parseBoolText
  cmdBufferLevel <- levelsAttr
  tasks <- map QueueTask <$> nameListAttr "tasks"
  allowNoQueues <- attrOptWith "allownoqueues" parseBoolText
  export <- nameListAttr "export"
  comment <- commentAttr
  proto <- nextChild "proto" protoD
  params <- manyNext "param" paramD
  implicitExternSyncParams <-
    maybe [] V.toList
      <$> optNextChild "implicitexternsyncparams" (manyNext "param" textOnly)
  pure
    CommandDefinition
      { proto
      , params
      , api
      , queues
      , successCodes
      , errorCodes
      , renderPass
      , videoCoding
      , conditionalRendering
      , cmdBufferLevel
      , tasks
      , allowNoQueues
      , export
      , implicitExternSyncParams
      , comment
      , pos
      }

scopeAttr :: Text -> Decode (Maybe Scope)
scopeAttr key =
  attrEnumOpt
    key
    [ ("inside", ScopeInside)
    , ("outside", ScopeOutside)
    , ("both", ScopeBoth)
    ]

levelsAttr :: Decode [CmdBufferLevel]
levelsAttr =
  fromMaybe []
    <$> attrOptWith "cmdbufferlevel" (traverse level . T.splitOn ",")
 where
  level = \case
    "primary" -> Right LevelPrimary
    "secondary" -> Right LevelSecondary
    other -> Left ("unknown command buffer level: " <> other)
