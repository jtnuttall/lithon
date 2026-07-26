{-# LANGUAGE OverloadedStrings #-}

-- | THE headline test: the entire pinned vk.xml parses into the typed
-- 'Registry' with zero errors, and section counts match the census taken
-- independently with grep/awk.
module Vulkan.RegistryDraftTest (
  unit_pinnedRegistryParses,
) where

import Data.ByteString qualified as BS
import Data.Text qualified as T
import Data.Vector qualified as V
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry (
  ParseFailure (..),
  ParseSuccess (..),
  Registry (..),
  parseRegistry,
 )
import Lithon.Codegen.Vulkan.Registry.Types.Core (TypeBody (..), TypeDecl (..))
import Lithon.Codegen.Vulkan.Registry.Types.Enums (BitWidth (..), EnumsBlock (..), EnumsKind (..))
import Lithon.Codegen.Vulkan.Registry.Types.Features (
  Extension (..),
  ExtensionSupport (..),
  Feature (..),
  FeatureVisibility (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Misc (SyncSection (..))
import Lithon.Codegen.Vulkan.Xml.Load (loadXmlBytes)
import Vulkan.Support.Paths (registryXmlPath)

unit_pinnedRegistryParses :: IO ()
unit_pinnedRegistryParses = do
  path <- registryXmlPath
  bytes <- BS.readFile path
  root <- either (assertFailure . show) pure (loadXmlBytes bytes)
  reg <- case parseRegistry root of
    Left failure ->
      assertFailure
        ( show (length failure.errors)
            <> " errors; first 20:\n"
            <> T.unpack
              (T.unlines (map display (take 20 (foldr (:) [] failure.errors))))
        )
    Right ok -> pure ok.registry
  V.length reg.platforms @?= 18
  V.length reg.tags @?= 43
  V.length reg.types @?= 2663
  V.length reg.enums @?= 355
  length (filter (\b -> b.kind == KindConstants) reg.enums) @?= 1
  length (filter (\b -> b.bitWidth == W64) reg.enums) @?= 16
  let structCount = length [() | t <- V.toList reg.types, TStruct _ <- [t.body]]
  assertBool ("expected >1700 structs, got " <> show structCount) (structCount > 1_700)
  V.length reg.commands @?= 864
  V.length reg.features @?= 21
  V.length reg.extensions @?= 696
  length (filter (\f -> f.apiType == VisInternal) reg.features) @?= 15
  length (filter (\e -> e.supported == SupportedDisabled) reg.extensions) @?= 219
  V.length reg.formats @?= 297
  V.length reg.spirvExtensions @?= 113
  V.length reg.spirvCapabilities @?= 201
  V.length reg.sync @?= 1
  case V.toList reg.sync of
    [s] -> do
      V.length s.stages @?= 46
      V.length s.accesses @?= 51
      V.length s.pipelines @?= 17
    _ -> assertFailure "expected exactly one sync section"
  V.length reg.videoCodecs @?= 9
