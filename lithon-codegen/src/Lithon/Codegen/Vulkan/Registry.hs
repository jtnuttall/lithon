{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

module Lithon.Codegen.Vulkan.Registry (
  -- * Parsing
  Registry (..),
  ParseSuccess (..),
  ParseFailure (..),
  parseRegistry,

  -- * Specialization
  Specialize (..),
  SpecializeError (..),
  Specialized,
) where

import Data.Aeson (ToJSON)
import Data.List.NonEmpty qualified as NE
import Data.Set.NonEmpty qualified as NESet
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.IgnoreList
import Lithon.Codegen.Vulkan.Registry.Parse.Commands
import Lithon.Codegen.Vulkan.Registry.Parse.Enums
import Lithon.Codegen.Vulkan.Registry.Parse.Features
import Lithon.Codegen.Vulkan.Registry.Parse.Misc
import Lithon.Codegen.Vulkan.Registry.Parse.Types
import Lithon.Codegen.Vulkan.Registry.Specialize
import Lithon.Codegen.Vulkan.Registry.Types.Commands
import Lithon.Codegen.Vulkan.Registry.Types.Common
import Lithon.Codegen.Vulkan.Registry.Types.Core
import Lithon.Codegen.Vulkan.Registry.Types.Enums
import Lithon.Codegen.Vulkan.Registry.Types.Features
import Lithon.Codegen.Vulkan.Registry.Types.Misc
import Lithon.Codegen.Vulkan.Xml.Decode
import Lithon.Codegen.Vulkan.Xml.Types

-- | The phase-1 intermediate representation: a faithful, position-annotated
-- transliteration of the whole registry, in document order per section.
-- WithNS-keyed maps, alias resolution, enum-value arithmetic, and api
-- specialization are later passes over this structure.
data Registry = Registry
  { comments :: Vector Text
  , platforms :: Vector Platform
  , tags :: Vector VendorTag
  , types :: Vector TypeDecl
  , typesComments :: Vector Text
  , enums :: Vector EnumsBlock
  , commands :: Vector Command
  , features :: Vector Feature
  , extensions :: Vector Extension
  , formats :: Vector Format
  , spirvExtensions :: Vector SpirvExtension
  , spirvCapabilities :: Vector SpirvCapability
  , sync :: Vector SyncSection
  , videoCodecs :: Vector VideoCodec
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data SpecializeError = DuplicateName
  { namespace :: Namespace
  , name :: Text
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance Display SpecializeError where
  displayBuilder e = "duplicate " <> from e.namespace <> " name after specialization: " <> from e.name

-- | Restrict the registry to one API variant. Total on well-formed input;
-- fails only if specialization leaves colliding top-level names.
instance (HasType Api cxt) => Specialize cxt (Errors SpecializeError) Registry where
  specialize cxt reg =
    let specialized =
          Specialized
            $ reg
            & (#types %~ fmap specializeType . filter \t -> keep t.common.api)
            & (#enums %~ fmap specializeEnums)
            & (#commands %~ fmap specializeCommand . filter keepCommand)
            & (#features %~ fmap specializeFeature . filter \f -> api `elem` f.api)
            & (#extensions %~ fmap specializeExtension . filter keepExtension)

        duplicateErrors =
          concat
            [ dupes STypeNS [typeBodyName t.body | t <- toList specialized.types]
            , dupes SEnumsBlockNS ((.name) <$> toList specialized.enums)
            , dupes SCommandNS (commandName <$> toList specialized.commands)
            , dupes SFeatureNS [f.name | f <- toList specialized.features]
            , dupes SExtensionNS [e.name | e <- toList specialized.extensions]
            ]
     in failUnlessEmpty duplicateErrors specialized
   where
    api = getTyped @Api cxt

    keep :: ApiSet -> Bool
    keep = apiSetContains api

    specializeType :: TypeDecl -> TypeDecl
    specializeType t = t & #body %~ bodyOf
     where
      bodyOf = \case
        TStruct s -> TStruct (structOf s)
        TUnion s -> TUnion (structOf s)
        other -> other
      structOf = \case
        a@AliasDef{} -> a
        FullDef s -> FullDef (s & #members %~ filter \m -> keep m.api)

    specializeEnums :: EnumsBlock -> EnumsBlock
    specializeEnums block = block & #items %~ filter keepItem
     where
      keepItem = \case
        ItemEnum e -> keep e.api
        _ -> True

    keepCommand = \case
      CommandAlias{api = a} -> keep a
      CommandDef d -> keep d.api

    specializeCommand = \case
      alias@CommandAlias{} -> alias
      CommandDef d ->
        CommandDef (d & #params %~ filter (\p -> keep p.api))

    specializeFeature :: Feature -> Feature
    specializeFeature = #changes %~ specializeChanges

    keepExtension e = case e.supported of
      SupportedDisabled -> False
      SupportedApis apis -> NESet.member api apis

    specializeExtension :: Extension -> Extension
    specializeExtension = #changes %~ specializeChanges

    specializeChanges :: Vector ChangeBlock -> Vector ChangeBlock
    specializeChanges = fmap inner . filter keepBlock
     where
      keepBlock = \case
        ChRequire r -> keep r.api
        ChDeprecate d -> keep d.api
        ChRemove r -> keep r.api
      inner = \case
        ChRequire r -> ChRequire (r & #items %~ filter keepInterface)
        ChDeprecate d -> ChDeprecate d
        ChRemove r -> ChRemove (r & #items %~ filter keepInterface)
      keepInterface = \case
        ReqEnum e -> keep e.api
        _ -> True

dupes :: SNamespace k -> [WithNS k] -> [SpecializeError]
dupes ns pool = [DuplicateName{namespace, name} | (namespace, name) <- duplicateNames ns pool]

data ParseSuccess = ParseSuccess
  { registry :: Registry
  , warnings :: [Warning]
  }
  deriving stock (Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ParseFailure = ParseFailure
  { errors :: NonEmpty ParseError
  , warnings :: [Warning]
  }
  deriving stock (Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Parse a loaded @vk.xml@ root element. Any recorded error fails the
-- whole parse — with every error the run discovered, not just the first.
--
-- Every section of vk.xml decodes into the typed 'Registry', strictly —
-- any unconsumed attribute, element, or text anywhere in the document is an
-- error.
parseRegistry :: XElement -> Either ParseFailure ParseSuccess
parseRegistry el =
  case (result, NE.nonEmpty errors) of
    (Just registry, Nothing) -> Right ParseSuccess{registry, warnings}
    (_, Just errs) -> Left ParseFailure{errors = errs, warnings}
    (Nothing, Nothing) ->
      -- Impossible by construction: an abort always records its error first.
      error "parseRegistry: decoder aborted without recording an error"
 where
  (result, errors, warnings) = runDecodeRoot registryIgnoreList "registry" registryD el

data Part
  = PComment Text
  | PPlatforms (Vector Platform)
  | PTags (Vector VendorTag)
  | PTypes TypesSection
  | PEnums EnumsBlock
  | PCommands (Vector Command)
  | PFeature Feature
  | PExtensions (Vector Extension)
  | PFormats (Vector Format)
  | PSpirvExtensions (Vector SpirvExtension)
  | PSpirvCapabilities (Vector SpirvCapability)
  | PSync SyncSection
  | PVideoCodecs (Vector VideoCodec)
  deriving stock (Generic)
  deriving anyclass (NFData)

registryD :: Decode Registry
registryD = do
  parts <- V.toList <$> dispatchRest table
  -- registry.rnc permits sections to repeat; contents concatenate in
  -- document order.
  pure
    Registry
      { comments = V.fromList [c | PComment c <- parts]
      , platforms = V.concat [ps | PPlatforms ps <- parts]
      , tags = V.concat [ts | PTags ts <- parts]
      , types = V.concat [s.types | PTypes s <- parts]
      , typesComments = V.concat [s.comments | PTypes s <- parts]
      , enums = V.fromList [block | PEnums block <- parts]
      , commands = V.concat [cs | PCommands cs <- parts]
      , features = V.fromList [f | PFeature f <- parts]
      , extensions = V.concat [es | PExtensions es <- parts]
      , formats = V.concat [fs | PFormats fs <- parts]
      , spirvExtensions = V.concat [xs | PSpirvExtensions xs <- parts]
      , spirvCapabilities = V.concat [xs | PSpirvCapabilities xs <- parts]
      , sync = V.fromList [s | PSync s <- parts]
      , videoCodecs = V.concat [vs | PVideoCodecs vs <- parts]
      }
 where
  table =
    [ ("comment", PComment <$> textOnly)
    , ("platforms", PPlatforms <$> platformsD)
    , ("tags", PTags <$> tagsD)
    , ("types", PTypes <$> typesSectionD)
    , ("enums", PEnums <$> enumsBlockD)
    , ("commands", PCommands <$> commandsSectionD)
    , ("feature", PFeature <$> featureD)
    , ("extensions", PExtensions <$> extensionsSectionD)
    , ("formats", PFormats <$> formatsSectionD)
    , ("spirvextensions", PSpirvExtensions <$> spirvExtensionsSectionD)
    , ("spirvcapabilities", PSpirvCapabilities <$> spirvCapabilitiesSectionD)
    , ("sync", PSync <$> syncSectionD)
    , ("videocodecs", PVideoCodecs <$> videoCodecsSectionD)
    ]

platformsD :: Decode (Vector Platform)
platformsD = do
  _comment <- attrOpt "comment"
  manyNext "platform" do
    pos <- currentPos
    name <- attrName "name"
    protect <- attr "protect"
    comment <- attrOpt "comment"
    pure Platform{name, protect, comment, pos}

tagsD :: Decode (Vector VendorTag)
tagsD = do
  _comment <- attrOpt "comment"
  manyNext "tag" do
    pos <- currentPos
    name <- attr "name"
    author <- attr "author"
    contact <- attr "contact"
    pure VendorTag{name, author, contact, pos}
