{-# LANGUAGE OverloadedStrings #-}

-- | Pins for the growth validation over the distilled ABI: the prose
-- parsers, the toy fixture failing without a growth entry for the struct
-- whose member note gates it (and passing with the golden's overrides),
-- registry entries that contradict the offsets, and the hand-built
-- shapes (multi-step, unexplained, non-monotone, unions).
module Bindgen.AbiValidateTest (
  unit_parseSinceProse,
  unit_parseSinceProseTwoParts,
  unit_addedInSinceProse,
  unit_validateRejectsUnrecordedGrowth,
  unit_validateAcceptsGolden,
  unit_validateRejectsInconsistentBefore,
  unit_validateRejectsWrongGate,
  unit_validateRejectsMultiStep,
  unit_validateRejectsUnexplainedGrowth,
  unit_validateRejectsNonMonotone,
  unit_validateSkipsUnionsAndBaselineGates,
  unit_enumHistoryRejectsUnrecorded,
  unit_enumHistoryRejectsStaleFloor,
  unit_enumHistoryAcceptsFloor,
  unit_enumHistoryRejectsRenumbered,
  unit_enumHistorySkips,
  unit_enumHistoryAcceptsGolden,
) where

import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Lithon.Prelude
import System.FilePath ((</>))
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Bindgen.AbiRenderTest (toyAbi, toyOverrides)
import Lithon.Codegen.Bindgen.Abi (
  AbiDecl (..),
  AbiEnumConst (..),
  AbiField (..),
  AbiGrowth (..),
  AbiKind (..),
  AbiLayoutBefore (..),
  AbiOverrides (..),
  StructOverrides (..),
  emptyAbiOverrides,
 )
import Lithon.Codegen.Bindgen.Abi.Previous (PreviousRender (..), parsePreviousRender)
import Lithon.Codegen.Bindgen.Abi.Validate (
  AbiProblem (..),
  AbiProblemKind (..),
  GrowthStep (..),
  LibraryRef (..),
  RenderDelta (..),
  validateAbi,
  validateEnumHistory,
 )
import Lithon.Codegen.Bindgen.Target (BindgenTarget (..), VersionScheme (..), registryDisplayPath)
import Lithon.Codegen.Bindgen.Target.Sdl3 (sdl3)
import Lithon.Codegen.Bindgen.Version (Version, mkVersion, renderVersion)
import Lithon.Codegen.Bindgen.Version.Doc (addedInProse, parseVersionProse, versionToken)

v :: Int -> Int -> Int -> Version
v major minor patch = mkVersion (major :| [minor, patch])

unit_parseSinceProse :: IO ()
unit_parseSinceProse = do
  versionToken 3 "This function is available since SDL 3.2.0." @?= Just (v 3 2 0)
  parseVersionProse 3 "3.4.16)." @?= Just (v 3 4 16)
  parseVersionProse 3 "3.4" @?= Just (v 3 4 0)
  parseVersionProse 3 "1.2.3.4" @?= Nothing
  parseVersionProse 3 "v3.4" @?= Nothing
  parseVersionProse 3 "3" @?= Nothing
  parseVersionProse 3 "3..4" @?= Nothing

-- | A two-part scheme reads exactly two groups: never padded, never
-- truncated.
unit_parseSinceProseTwoParts :: IO ()
unit_parseSinceProseTwoParts = do
  let v2 major minor = mkVersion (major :| [minor])
  versionToken 2 "added in client API 2.1 (mpv 0.36)" @?= Just (v2 2 1)
  parseVersionProse 2 "2.5," @?= Just (v2 2 5)
  parseVersionProse 2 "2.1.0" @?= Nothing
  parseVersionProse 2 "2" @?= Nothing
  addedInProse 2 [] "(added in 2.2)" @?= Just (v2 2 2)
  -- Skipped words are the target's; nothing is skipped by default.
  addedInProse 2 [] "added in mpv 0.37" @?= Nothing
  addedInProse 2 ["mpv"] "added in mpv 0.37" @?= Just (v2 0 37)

unit_addedInSinceProse :: IO ()
unit_addedInSinceProse = do
  added "Complete pen input state at time of event (added in 3.4.16)." @?= Just (v 3 4 16)
  added "(Added In SDL 3.4.0)" @?= Just (v 3 4 0)
  added "The window with pen focus, if any" @?= Nothing
  -- Only the "added in" phrase gates; other version prose is inert.
  added "This macro is available since SDL 3.4.0." @?= Nothing
 where
  added = addedInProse 3 ["sdl"]

problems :: Text -> [AbiDecl] -> [AbiProblem]
problems sdlVersion decls = case validateAbi sdl3.versioning.baseline (library sdlVersion) decls of
  Success () -> []
  Failure errs -> toList errs

library :: Text -> LibraryRef
library sdlVersion =
  LibraryRef
    { label = sdl3.versionLabel
    , version = sdlVersion
    , registry = registryDisplayPath sdl3 "versions.json"
    }

kinds :: Text -> [AbiDecl] -> [(Text, AbiProblemKind)]
kinds sdlVersion decls = [(p.decl.cTypeName, p.kind) | p <- problems sdlVersion decls]

-- | The toy fixture without any registry entry: ToyGrown's member note
-- gates pen_state, so the struct grew with nothing recording its
-- pre-growth layout — the SDL_PenProximityEvent 3.4.16 regeneration.
unit_validateRejectsUnrecordedGrowth :: IO ()
unit_validateRejectsUnrecordedGrowth = do
  abi <- toyAbi emptyAbiOverrides
  case problems "3.9.0" abi of
    [p] -> do
      p.decl.cTypeName @?= "struct SDL_ToyGrown"
      p.outer @?= v 3 2 0
      case p.kind of
        GrowthUnrecorded step -> do
          step.since @?= v 3 2 12
          map (.name) (toList step.members) @?= ["pen_state"]
          step.preSizeof @?= 24
          step.postSizeof @?= 32
        other -> assertFailure ("unexpected problem kind: " <> show other)
      let rendered = display p
      for_
        [ "struct SDL_ToyGrown (SDL_toy_abi.h)"
        , "SDL 3.9.0"
        , "from the member's comment"
        , "\"SDL_ToyGrown\": {"
        , "\"sizeof-since\": \"3.2.12\""
        , "\"before\": { \"sizeof\": 24, \"alignment\": 8 }"
        , "\"members\": { \"pen_state\": \"3.2.12\" }"
        ]
        \needle ->
          assertBool (toString ("missing " <> needle <> " in:\n" <> rendered)) (needle `T.isInfixOf` rendered)
    ps -> assertFailure ("expected exactly one problem, got " <> show (length ps) <> ": " <> show ps)

-- | The golden's overrides are a complete growth story for every toy
-- struct (same-alignment, alignment-raising, and tail-padding appends).
unit_validateAcceptsGolden :: IO ()
unit_validateAcceptsGolden = do
  abi <- toyAbi toyOverrides
  problems "3.9.0" abi @?= []

grownWith :: AbiGrowth -> AbiOverrides
grownWith growth =
  emptyAbiOverrides
    { structs =
        Map.fromList
          [("SDL_ToyGrown", StructOverrides{growth = Just growth, layout = Nothing, members = mempty})]
    }

unit_validateRejectsInconsistentBefore :: IO ()
unit_validateRejectsInconsistentBefore = do
  wrongSize <-
    toyAbi (grownWith AbiGrowth{since = v 3 2 12, before = AbiLayoutBefore{sizeof = 16, alignment = 8}})
  case kinds "3.9.0" wrongSize of
    [("struct SDL_ToyGrown", GrowthMismatch _ step why)] -> do
      step.preSizeof @?= 24
      assertBool (toString why) ("before.sizeof 16" `T.isInfixOf` why && "gives 24" `T.isInfixOf` why)
    other -> assertFailure ("unexpected: " <> show other)
  wrongAlign <-
    toyAbi
      (grownWith AbiGrowth{since = v 3 2 12, before = AbiLayoutBefore{sizeof = 24, alignment = 16}})
  case kinds "3.9.0" wrongAlign of
    [("struct SDL_ToyGrown", GrowthMismatch _ _ why)] ->
      assertBool (toString why) ("exceeds the baked alignment 8" `T.isInfixOf` why)
    other -> assertFailure ("unexpected: " <> show other)

unit_validateRejectsWrongGate :: IO ()
unit_validateRejectsWrongGate = do
  abi <-
    toyAbi (grownWith AbiGrowth{since = v 3 2 8, before = AbiLayoutBefore{sizeof = 24, alignment = 8}})
  case kinds "3.9.0" abi of
    [("struct SDL_ToyGrown", GrowthMismatch g _ why)] -> do
      g.since @?= v 3 2 8
      assertBool
        (toString why)
        ("gates sizeof at 3.2.8" `T.isInfixOf` why && "gated at 3.2.12" `T.isInfixOf` why)
    other -> assertFailure ("unexpected: " <> show other)

field :: Text -> Int -> Maybe Version -> AbiField
field name byteOffset since = AbiField{name, byteOffset, since, commentSince = Nothing}

decl :: AbiKind -> Text -> [AbiField] -> Int -> Int -> Maybe AbiGrowth -> AbiDecl
decl kind cTypeName fields sizeof alignment growth =
  AbiDecl
    { cTypeName
    , headerName = "SDL_toy.h"
    , kind
    , sizeof
    , alignment
    , fields
    , constants = []
    , since = Nothing
    , growth
    , layout = Nothing
    , memberTypes = []
    }

unit_validateRejectsMultiStep :: IO ()
unit_validateRejectsMultiStep =
  case kinds "3.9.0" [twice] of
    [("struct SDL_Twice", GrowthMultiStep steps)] ->
      [(s.since, map (.name) (toList s.members), s.preSizeof, s.postSizeof) | s <- toList steps]
        @?= [(v 3 2 12, ["b"], 8, 16), (v 3 4 16, ["c"], 16, 24)]
    other -> assertFailure ("unexpected: " <> show other)
 where
  twice =
    decl
      AbiStruct
      "struct SDL_Twice"
      [field "a" 0 Nothing, field "b" 8 (Just (v 3 2 12)), field "c" 16 (Just (v 3 4 16))]
      24
      8
      Nothing

unit_validateRejectsUnexplainedGrowth :: IO ()
unit_validateRejectsUnexplainedGrowth =
  case kinds "3.9.0" [ungated] of
    [("struct SDL_Ungated", GrowthUnexplained g)] -> g.since @?= v 3 2 12
    other -> assertFailure ("unexpected: " <> show other)
 where
  ungated =
    decl
      AbiStruct
      "struct SDL_Ungated"
      [field "a" 0 Nothing, field "b" 8 Nothing]
      16
      8
      (Just AbiGrowth{since = v 3 2 12, before = AbiLayoutBefore{sizeof = 8, alignment = 8}})

unit_validateRejectsNonMonotone :: IO ()
unit_validateRejectsNonMonotone =
  case kinds "3.9.0" [shuffled] of
    [("struct SDL_Shuffled", TrailingGatesNotMonotone fs)] -> map (.name) fs @?= ["b", "c"]
    other -> assertFailure ("unexpected: " <> show other)
 where
  shuffled =
    decl
      AbiStruct
      "struct SDL_Shuffled"
      [field "a" 0 Nothing, field "b" 8 (Just (v 3 4 16)), field "c" 16 (Just (v 3 2 12))]
      24
      8
      Nothing

-- | Unions have no member layout story, and a member gate at or below
-- the struct's own floor is not a gate (the renderer emits it bare).
unit_validateSkipsUnionsAndBaselineGates :: IO ()
unit_validateSkipsUnionsAndBaselineGates =
  problems "3.9.0" [union, baseline, slotIn] @?= []
 where
  union = decl AbiUnion "union SDL_U" [] 32 8 Nothing
  baseline =
    decl AbiStruct "struct SDL_Base" [field "a" 0 Nothing, field "b" 8 (Just (v 3 2 0))] 16 8 Nothing
  -- Gated, but not trailing: a slot-in ahead of pre-existing padding.
  slotIn =
    decl
      AbiStruct
      "struct SDL_Slot"
      [field "a" 0 Nothing, field "b" 4 (Just (v 3 4 0)), field "pad" 6 Nothing]
      8
      4
      Nothing

{-------------------------------------------------------------------------------
  Enum history: this render against the previous one
-------------------------------------------------------------------------------}

enumDecl :: Text -> [(Text, Integer, Maybe Version)] -> AbiDecl
enumDecl cTypeName consts =
  AbiDecl
    { cTypeName
    , headerName = "SDL_toy.h"
    , kind = AbiEnum
    , sizeof = 4
    , alignment = 4
    , fields = []
    , constants = [AbiEnumConst{name, value, since} | (name, value, since) <- consts]
    , since = Nothing
    , growth = Nothing
    , layout = Nothing
    , memberTypes = []
    }

-- | The SDL 3.4.16 render's view of SDL_GamepadType: GAMECUBE last before
-- the sentinel, COUNT at 12.
previous3416 :: PreviousRender
previous3416 =
  PreviousRender
    { path = "sdl3-bindgen-sys/cbits/abi_assertions.c"
    , versionText = "3.4.16"
    , version = v 3 4 16
    , enums =
        Map.fromList
          [
            ( "enum SDL_GamepadType"
            , Map.fromList [("SDL_GAMEPAD_TYPE_GAMECUBE", 11), ("SDL_GAMEPAD_TYPE_COUNT", 12)]
            )
          ]
    }

-- | SDL 3.4.18's SDL_GamepadType: STEAM slotted in at 12, COUNT moved to
-- 13, each with the floor under test.
gamepad :: Maybe Version -> Maybe Version -> AbiDecl
gamepad steamSince countSince =
  enumDecl
    "enum SDL_GamepadType"
    [ ("SDL_GAMEPAD_TYPE_GAMECUBE", 11, Just (v 3 4 0))
    , ("SDL_GAMEPAD_TYPE_STEAM", 12, steamSince)
    , ("SDL_GAMEPAD_TYPE_COUNT", 13, countSince)
    ]

history :: Version -> PreviousRender -> [AbiDecl] -> [AbiProblem]
history current previous decls =
  case validateEnumHistory sdl3.versioning current (library (renderVersion current)) previous decls of
    Success () -> []
    Failure errs -> toList errs

-- | The 3.4.18 regeneration as it slipped through: STEAM with no entry.
unit_enumHistoryRejectsUnrecorded :: IO ()
unit_enumHistoryRejectsUnrecorded =
  case history (v 3 4 18) previous3416 [gamepad Nothing (Just (v 3 4 18))] of
    [p] -> do
      p.decl.cTypeName @?= "enum SDL_GamepadType"
      case p.kind of
        EnumConstUnrecorded delta c -> do
          c.name @?= "SDL_GAMEPAD_TYPE_STEAM"
          delta.previousVersion @?= "3.4.16"
          delta.suggested @?= v 3 4 18
        other -> assertFailure ("unexpected kind: " <> show other)
      let rendered = display p
      for_
        [ "SDL_GAMEPAD_TYPE_STEAM is new since the previous render"
        , "Previous render: SDL 3.4.16 (sdl3-bindgen-sys/cbits/abi_assertions.c); this render: SDL 3.4.18."
        , "Add it under \"enum-constants\""
        , "\"SDL_GAMEPAD_TYPE_STEAM\": { \"since\": \"3.4.18\" }"
        ]
        \needle ->
          assertBool (toString ("missing " <> needle <> " in:\n" <> rendered)) (needle `T.isInfixOf` rendered)
    ps -> assertFailure ("expected exactly one problem, got " <> show (length ps) <> ": " <> show ps)

-- | A floor at or below the previous render is no floor: that render did
-- not have the constant.
unit_enumHistoryRejectsStaleFloor :: IO ()
unit_enumHistoryRejectsStaleFloor =
  case history (v 3 4 18) previous3416 [gamepad (Just (v 3 4 16)) (Just (v 3 4 18))] of
    [p] -> do
      case p.kind of
        EnumConstUnrecorded _ c -> c.since @?= Just (v 3 4 16)
        other -> assertFailure ("unexpected kind: " <> show other)
      let rendered = display p
      for_ ["Annotated: since 3.4.16, at or below the previous render.", "Raise it under"] \needle ->
        assertBool (toString ("missing " <> needle <> " in:\n" <> rendered)) (needle `T.isInfixOf` rendered)
    ps -> assertFailure ("expected exactly one problem, got " <> show (length ps) <> ": " <> show ps)

unit_enumHistoryAcceptsFloor :: IO ()
unit_enumHistoryAcceptsFloor =
  history (v 3 4 18) previous3416 [gamepad (Just (v 3 4 18)) (Just (v 3 4 18))] @?= []

-- | COUNT moved 12 -> 13: with no value gate, and with the 3.4.0 one the
-- registry carried from the previous renumbering.
unit_enumHistoryRejectsRenumbered :: IO ()
unit_enumHistoryRejectsRenumbered = do
  case history (v 3 4 18) previous3416 [gamepad (Just (v 3 4 18)) Nothing] of
    [p] -> do
      case p.kind of
        EnumValueGateStale _ was c -> do
          was @?= 12
          c.name @?= "SDL_GAMEPAD_TYPE_COUNT"
          c.value @?= 13
        other -> assertFailure ("unexpected kind: " <> show other)
      let rendered = display p
      for_
        [ "SDL_GAMEPAD_TYPE_COUNT changed value since the previous render (12 -> 13), but no value gate records it."
        , "SDL 3.4.16 included"
        , "Add it under \"value-gates\""
        , "\"SDL_GAMEPAD_TYPE_COUNT\": { \"since\": \"3.4.18\", \"note\": \"12 -> 13.\" }"
        ]
        \needle ->
          assertBool (toString ("missing " <> needle <> " in:\n" <> rendered)) (needle `T.isInfixOf` rendered)
    ps -> assertFailure ("expected exactly one problem, got " <> show (length ps) <> ": " <> show ps)
  case history (v 3 4 18) previous3416 [gamepad (Just (v 3 4 18)) (Just (v 3 4 0))] of
    [p] -> do
      let rendered = display p
      for_
        [ "but its value gate is stale."
        , "Annotated: since 3.4.0, at or below the previous render, so the baked 13 is asserted"
        , "from SDL 3.4.0 up to SDL 3.4.16, where the value was 12."
        , "Raise it under \"value-gates\""
        ]
        \needle ->
          assertBool (toString ("missing " <> needle <> " in:\n" <> rendered)) (needle `T.isInfixOf` rendered)
    ps -> assertFailure ("expected exactly one problem, got " <> show (length ps) <> ": " <> show ps)

-- | Nothing to compare when the headers are not newer than the previous
-- render, when the enum was not asserted before, or for non-enums.
unit_enumHistorySkips :: IO ()
unit_enumHistorySkips = do
  history (v 3 4 16) previous3416 [gamepad Nothing Nothing] @?= []
  history (v 3 4 10) previous3416 [gamepad Nothing Nothing] @?= []
  history (v 3 4 18) previous3416 [enumDecl "enum SDL_New" [("SDL_NEW_A", 0, Nothing)]] @?= []
  history
    (v 3 4 18)
    previous3416
    [decl AbiStruct "struct SDL_GamepadType" [field "a" 0 Nothing] 8 8 Nothing]
    @?= []

-- | The toy fixture against the committed golden, one release on: no
-- constant changed, so nothing is reported.
unit_enumHistoryAcceptsGolden :: IO ()
unit_enumHistoryAcceptsGolden = do
  contents <- TIO.readFile ("test/golden/sdl3" </> "abi-toy-assertions.golden")
  previous <- either (assertFailure . toString) pure (parsePreviousRender "SDL" "golden" contents)
  abi <- toyAbi toyOverrides
  history (v 3 10 0) previous abi @?= []
