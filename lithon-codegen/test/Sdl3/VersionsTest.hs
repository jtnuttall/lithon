{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Sdl3.VersionsTest where

import Data.ByteString.Lazy qualified as LBS
import Data.FileEmbed (embedFileRelative)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Sdl3.Abi (
  AbiGrowth (..),
  AbiLayout (..),
  AbiLayoutBefore (..),
  AbiOverrides (..),
  AbiSince (..),
  StructOverrides (..),
 )
import Lithon.Codegen.Sdl3.Versions (
  StructEntry (..),
  VersionsRegistry (..),
  abiOverrides,
  decodeVersionsRegistry,
  encodeVersionsRegistry,
 )

committedRegistry :: LBS.ByteString
committedRegistry = LBS.fromStrict $(embedFileRelative "data/sdl3/versions.json")

unit_committedRegistryDecodes :: IO ()
unit_committedRegistryDecodes = do
  reg <- either (assertFailure . toString) pure (decodeVersionsRegistry committedRegistry)
  wheel <-
    maybe (assertFailure "SDL_MouseWheelEvent missing from structs") pure
      $ Map.lookup "SDL_MouseWheelEvent" reg.structs
  wheel.sizeofSince @?= Just wheelGate
  wheel.before @?= Just wheelBefore
  wheel.layout @?= Nothing
  wheel.members @?= Map.fromList [("integer_x", wheelGate), ("integer_y", wheelGate)]
  fmap (.growth) (Map.lookup "SDL_MouseWheelEvent" (abiOverrides reg).structs)
    @?= Just (Just AbiGrowth{since = wheelGate, before = wheelBefore})
 where
  wheelGate = AbiSince{major = 3, minor = 2, patch = 12}
  wheelBefore = AbiLayoutBefore{sizeof = 48, alignment = 8}

unit_structEntryDecodesLayoutAndBefore :: IO ()
unit_structEntryDecodesLayoutAndBefore = do
  reg <-
    either (assertFailure . toString) pure
      $ decodeVersionsRegistry
        "{\"structs\": {\"X\": {\"layout\": \"prefix\", \"sizeof-since\": \"3.2.12\", \"before\": {\"sizeof\": 8, \"alignment\": 4}}, \"Y\": {\"layout\": \"exact\"}}}"
  reg.structs
    @?= Map.fromList
      [
        ( "X"
        , StructEntry
            { sizeofSince = Just AbiSince{major = 3, minor = 2, patch = 12}
            , before = Just AbiLayoutBefore{sizeof = 8, alignment = 4}
            , layout = Just LayoutPrefix
            , note = Nothing
            , members = mempty
            }
        )
      ,
        ( "Y"
        , StructEntry
            { sizeofSince = Nothing
            , before = Nothing
            , layout = Just LayoutExact
            , note = Nothing
            , members = mempty
            }
        )
      ]

unit_sizeofSinceRequiresBefore :: IO ()
unit_sizeofSinceRequiresBefore = do
  case decodeVersionsRegistry (structX "{\"sizeof-since\": \"3.2.12\"}") of
    Left err -> assertBool ("names the missing key: " <> toString err) ("before" `T.isInfixOf` err)
    Right reg -> assertFailure ("sizeof-since without before decoded: " <> show reg)
  assertBool
    "before without sizeof-since is rejected"
    (isLeft (decodeVersionsRegistry (structX "{\"before\": {\"sizeof\": 8, \"alignment\": 4}}")))

unit_layoutRejectsUnknownSpelling :: IO ()
unit_layoutRejectsUnknownSpelling =
  assertBool
    "loose is not a layout"
    (isLeft (decodeVersionsRegistry (structX "{\"layout\": \"loose\"}")))

unit_registryRoundTrips :: IO ()
unit_registryRoundTrips = do
  reg <- either (assertFailure . toString) pure (decodeVersionsRegistry committedRegistry)
  decodeVersionsRegistry (encodeVersionsRegistry reg) @?= Right reg

structX :: LBS.ByteString -> LBS.ByteString
structX entry = "{\"structs\": {\"X\": " <> entry <> "}}"
