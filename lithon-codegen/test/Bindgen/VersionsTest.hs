{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Bindgen.VersionsTest where

import Data.ByteString.Lazy qualified as LBS
import Data.FileEmbed (embedFileRelative)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Bindgen.Abi (
  AbiGrowth (..),
  AbiLayout (..),
  AbiLayoutBefore (..),
  AbiOverrides (..),
  StructOverrides (..),
 )
import Lithon.Codegen.Bindgen.Version (Version, mkVersion, parseVersionExact, renderVersion)
import Lithon.Codegen.Bindgen.Versions (
  DeclEntry (..),
  PrologueEntry (..),
  ShapeSpec (..),
  StructEntry (..),
  VersionsRegistry (..),
  abiOverrides,
  decodeVersionsRegistry,
  encodeVersionsRegistry,
 )

committedRegistry :: LBS.ByteString
committedRegistry = LBS.fromStrict $(embedFileRelative "data/sdl3/versions.json")

v3 :: Int -> Int -> Int -> Version
v3 major minor patch = mkVersion (major :| [minor, patch])

v2 :: Int -> Int -> Version
v2 major minor = mkVersion (major :| [minor])

unit_committedRegistryDecodes :: IO ()
unit_committedRegistryDecodes = do
  reg <- either (assertFailure . toString) pure (decodeVersionsRegistry 3 committedRegistry)
  wheel <-
    maybe (assertFailure "SDL_MouseWheelEvent missing from structs") pure
      $ Map.lookup "SDL_MouseWheelEvent" reg.structs
  wheel.sizeofSince @?= Just wheelGate
  wheel.before @?= Just wheelBefore
  wheel.layout @?= Nothing
  wheel.members @?= Map.fromList [("integer_x", wheelGate), ("integer_y", wheelGate)]
  fmap (.growth) (Map.lookup "SDL_MouseWheelEvent" (abiOverrides reg).structs)
    @?= Just (Just AbiGrowth{since = wheelGate, before = wheelBefore})
  -- SDL 3.4.16 appended pen_state (24 -> 32); the entry the validation
  -- layer demands for it.
  pen <-
    maybe (assertFailure "SDL_PenProximityEvent missing from structs") pure
      $ Map.lookup "SDL_PenProximityEvent" reg.structs
  pen.sizeofSince @?= Just penGate
  pen.before @?= Just AbiLayoutBefore{sizeof = 24, alignment = 8}
  pen.layout @?= Nothing
  pen.members @?= Map.fromList [("pen_state", penGate)]
  -- SDL's twelve retype stand-ins all appeared at 3.4.0, in all three
  -- shape spellings; the aliased type is spelled as C spells it.
  Map.size reg.prologueTypedefs @?= 12
  assertBool
    "every prologue typedef is since 3.4.0"
    (all (\e -> e.since == v3 3 4 0) reg.prologueTypedefs)
  (.shape) <$> Map.lookup "SDL_CameraPermissionState" reg.prologueTypedefs @?= Just (ShapeAlias "int")
  (.shape) <$> Map.lookup "SDL_PropertiesID" reg.prologueTypedefs @?= Just (ShapeAlias "Uint32")
  (.shape) <$> Map.lookup "SDL_GPURenderState" reg.prologueTypedefs @?= Just ShapeOpaqueStruct
  (.shape) <$> Map.lookup "SDL_MouseMotionTransformCallback" reg.prologueTypedefs
    @?= Just ShapeVoidPtr
  -- SDL's gated stubs keep the default zero return.
  [n | (n, e) <- Map.toList reg.decls, isJust e.stubReturn] @?= []
 where
  wheelGate = v3 3 2 12
  wheelBefore = AbiLayoutBefore{sizeof = 48, alignment = 8}
  penGate = v3 3 4 16

unit_structEntryDecodesLayoutAndBefore :: IO ()
unit_structEntryDecodesLayoutAndBefore = do
  reg <-
    either (assertFailure . toString) pure
      $ decodeVersionsRegistry
        3
        "{\"structs\": {\"X\": {\"layout\": \"prefix\", \"sizeof-since\": \"3.2.12\", \"before\": {\"sizeof\": 8, \"alignment\": 4}}, \"Y\": {\"layout\": \"exact\"}}}"
  reg.structs
    @?= Map.fromList
      [
        ( "X"
        , StructEntry
            { sizeofSince = Just (v3 3 2 12)
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
  case decodeVersionsRegistry 3 (structX "{\"sizeof-since\": \"3.2.12\"}") of
    Left err -> assertBool ("names the missing key: " <> toString err) ("before" `T.isInfixOf` err)
    Right reg -> assertFailure ("sizeof-since without before decoded: " <> show reg)
  assertBool
    "before without sizeof-since is rejected"
    (isLeft (decodeVersionsRegistry 3 (structX "{\"before\": {\"sizeof\": 8, \"alignment\": 4}}")))

unit_layoutRejectsUnknownSpelling :: IO ()
unit_layoutRejectsUnknownSpelling =
  assertBool
    "loose is not a layout"
    (isLeft (decodeVersionsRegistry 3 (structX "{\"layout\": \"loose\"}")))

unit_registryRoundTrips :: IO ()
unit_registryRoundTrips = do
  reg <- either (assertFailure . toString) pure (decodeVersionsRegistry 3 committedRegistry)
  decodeVersionsRegistry 3 (encodeVersionsRegistry 3 reg) @?= Right reg

-- | An mpv-shaped registry: two-part versions, gated decls with and
-- without a @stub-return@ (a sentinel, and a polyfill over the wrapper's
-- parameters), and a prologue stand-in aliasing a type C spells in two
-- words.
unit_twoPartRegistryDecodes :: IO ()
unit_twoPartRegistryDecodes = do
  reg <- either (assertFailure . toString) pure (decodeVersionsRegistry 2 twoPartRegistry)
  reg.decls
    @?= Map.fromList
      [
        ( "toy_del"
        , DeclEntry
            { since = v2 2 1
            , stubReturn = Just "TOY_ERROR_UNSUPPORTED"
            , note = Just "added in API 2.1"
            }
        )
      ,
        ( "toy_time_ns"
        , DeclEntry{since = v2 2 2, stubReturn = Just "toy_time_us(arg1) * 1000", note = Nothing}
        )
      , ("toy_wake", DeclEntry{since = v2 2 2, stubReturn = Nothing, note = Nothing})
      ]
  reg.prologueTypedefs
    @?= Map.fromList
      [
        ( "toy_count"
        , PrologueEntry
            { since = v2 2 2
            , shape = ShapeAlias "unsigned long"
            , headers = ["toy.h"]
            , note = Nothing
            }
        )
      ]
  let overrides = abiOverrides reg
  overrides.decls
    @?= Map.fromList [("toy_del", v2 2 1), ("toy_time_ns", v2 2 2), ("toy_wake", v2 2 2)]
  decodeVersionsRegistry 2 (encodeVersionsRegistry 2 reg) @?= Right reg
 where
  twoPartRegistry =
    "{\"decls\": {\
    \  \"toy_del\": {\"since\": \"2.1\", \"stub-return\": \"TOY_ERROR_UNSUPPORTED\", \"note\": \"added in API 2.1\"},\
    \  \"toy_time_ns\": {\"since\": \"2.2\", \"stub-return\": \"toy_time_us(arg1) * 1000\"},\
    \  \"toy_wake\": {\"since\": \"2.2\"}},\
    \ \"prologue-typedefs\": {\
    \  \"toy_count\": {\"since\": \"2.2\", \"shape\": \"unsigned long\", \"headers\": [\"toy.h\"]}}}"

-- | Every version in a registry has the target's arity, wherever it
-- appears; the error names the expected count.
unit_wrongArityRejected :: IO ()
unit_wrongArityRejected = do
  rejects 2 "{\"decls\": {\"toy_del\": {\"since\": \"2.1.0\"}}}"
  rejects 3 "{\"decls\": {\"toy_del\": {\"since\": \"2.1\"}}}"
  rejects 2 "{\"enum-constants\": {\"TOY_X\": {\"since\": \"2\"}}}"
  rejects 2 "{\"structs\": {\"X\": {\"members\": {\"m\": \"2.1.4\"}}}}"
  rejects 2 "{\"prologue-typedefs\": {\"t\": {\"since\": \"2.1.4\", \"shape\": \"int\"}}}"
  case decodeVersionsRegistry 2 committedRegistry of
    Left err -> assertBool (toString err) ("with 2 parts" `T.isInfixOf` err)
    Right _ -> assertFailure "the three-part SDL registry decoded at arity 2"
 where
  rejects arity bytes =
    assertBool
      ("decoded at arity " <> show arity <> ": " <> show bytes)
      (isLeft (decodeVersionsRegistry arity bytes))

unit_prologueEntrySpellings :: IO ()
unit_prologueEntrySpellings = do
  shapeOf "\"int\"" @?= Right (ShapeAlias "int")
  shapeOf "\"Uint32\"" @?= Right (ShapeAlias "Uint32")
  shapeOf "\"opaque-struct\"" @?= Right ShapeOpaqueStruct
  shapeOf "\"void-ptr\"" @?= Right ShapeVoidPtr
  assertBool "an empty spelling is no C type" (isLeft (shapeOf "\"  \""))
  -- The stand-in's version is required: it decides the guard.
  assertBool
    "since is required"
    (isLeft (decodeVersionsRegistry 3 "{\"prologue-typedefs\": {\"t\": {\"shape\": \"int\"}}}"))
 where
  shapeOf shape = do
    reg <-
      decodeVersionsRegistry
        3
        ("{\"prologue-typedefs\": {\"t\": {\"since\": \"3.4.0\", \"shape\": " <> shape <> "}}}")
    maybeToRight "missing" ((.shape) <$> Map.lookup "t" reg.prologueTypedefs)

unit_versionPartsAreDigits :: IO ()
unit_versionPartsAreDigits = do
  renderVersion <$> parseVersionExact 3 "3.4.16" @?= Right "3.4.16"
  renderVersion <$> parseVersionExact 2 "2.10" @?= Right "2.10"
  for_ ["3.4.x", "3.-1.0", "3..4", "", " 3.4.0", "3.4.0 "] \t ->
    assertBool ("parsed: " <> show t) (isLeft (parseVersionExact 3 t))
  -- Ordering is numeric per part, not textual.
  assertBool "2.9 < 2.10" (v2 2 9 < v2 2 10)

structX :: LBS.ByteString -> LBS.ByteString
structX entry = "{\"structs\": {\"X\": " <> entry <> "}}"
