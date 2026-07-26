{-# LANGUAGE OverloadedStrings #-}

-- | Section/category counts plus per-section content digests — the quick
-- drift overview (and the first golden layer).
module Lithon.Codegen.Vulkan.Registry.Summary (
  Summary (..),
  summarize,
  prettySummary,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Vector qualified as V
import Prettyprinter (Doc, fill, pretty, vsep, (<+>))

import Lithon.Codegen.Backend.Json (canonicalJsonBytes, digestText)
import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry
import Lithon.Codegen.Vulkan.Registry.Types.Common qualified as Common
import Lithon.Codegen.Vulkan.Registry.Types.Core (TypeBody (..), TypeDecl (..))
import Lithon.Codegen.Vulkan.Registry.Types.Enums (EnumsBlock (..), EnumsKind (..))
import Lithon.Codegen.Vulkan.Registry.Types.Features (
  Extension (..),
  ExtensionSupport (..),
  Feature (..),
  FeatureVisibility (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Misc (SyncSection (..))

data Summary = Summary
  { sectionCounts :: ![(Text, Int)]
  , typeCategories :: ![(Text, Int)]
  , enumsKinds :: ![(Text, Int)]
  , extensionSupport :: ![(Text, Int)]
  , internalFeatures :: !Int
  , sectionDigests :: ![(Text, Text)]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (ToJSON)

summarize :: Registry -> Summary
summarize reg =
  Summary
    { sectionCounts =
        [ ("platforms", V.length reg.platforms)
        , ("tags", V.length reg.tags)
        , ("types", V.length reg.types)
        , ("enums-blocks", V.length reg.enums)
        , ("commands", V.length reg.commands)
        , ("features", V.length reg.features)
        , ("extensions", V.length reg.extensions)
        , ("formats", V.length reg.formats)
        , ("spirv-extensions", V.length reg.spirvExtensions)
        , ("spirv-capabilities", V.length reg.spirvCapabilities)
        , ("sync-stages", sumSync (.stages))
        , ("sync-accesses", sumSync (.accesses))
        , ("sync-pipelines", sumSync (.pipelines))
        , ("video-codecs", V.length reg.videoCodecs)
        ]
    , typeCategories = histogram (map categoryOf (V.toList reg.types))
    , enumsKinds = histogram (map (kindLabel . (.kind)) (V.toList reg.enums))
    , extensionSupport = histogram (map (supportLabel . (.supported)) (V.toList reg.extensions))
    , internalFeatures =
        length (filter (\f -> f.apiType == VisInternal) reg.features)
    , sectionDigests =
        [ ("platforms", digest reg.platforms)
        , ("tags", digest reg.tags)
        , ("types", digest reg.types)
        , ("enums", digest reg.enums)
        , ("commands", digest reg.commands)
        , ("features", digest reg.features)
        , ("extensions", digest reg.extensions)
        , ("formats", digest reg.formats)
        , ("spirv-extensions", digest reg.spirvExtensions)
        , ("spirv-capabilities", digest reg.spirvCapabilities)
        , ("sync", digest reg.sync)
        , ("video-codecs", digest reg.videoCodecs)
        ]
    }
 where
  sumSync :: (SyncSection -> Vector a) -> Int
  sumSync f = sum (map (V.length . f) (V.toList reg.sync))
  digest :: (ToJSON a) => a -> Text
  digest = digestText . canonicalJsonBytes
  histogram :: [Text] -> [(Text, Int)]
  histogram = Map.toAscList . counts
  categoryOf t = case t.body of
    TExternal _ -> "external"
    TInclude _ -> "include"
    TDefine _ -> "define"
    TBasetype _ -> "basetype"
    TBitmask _ -> "bitmask"
    THandle _ -> "handle"
    TEnumDecl _ -> "enum"
    TFuncpointer _ -> "funcpointer"
    TStruct _ -> "struct"
    TUnion _ -> "union"
  kindLabel = \case
    KindEnum -> "enum"
    KindBitmask -> "bitmask"
    KindConstants -> "constants"
  supportLabel = \case
    SupportedDisabled -> "disabled"
    SupportedApis apis -> display (Common.Apis apis)

prettySummary :: Summary -> Doc ann
prettySummary s =
  vsep
    [ "-- sections"
    , table s.sectionCounts
    , mempty
    , "-- type categories"
    , table s.typeCategories
    , mempty
    , "-- enums block kinds"
    , table s.enumsKinds
    , mempty
    , "-- extension support"
    , table s.extensionSupport
    , mempty
    , "-- features with apitype=internal:" <+> pretty s.internalFeatures
    , mempty
    , "-- section digests"
    , vsep [fill 22 (pretty name) <+> pretty d | (name, d) <- s.sectionDigests]
    ]
 where
  table rows = vsep [fill 22 (pretty name) <+> pretty n | (name, n) <- rows]
