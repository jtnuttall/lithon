{-# LANGUAGE OverloadedStrings #-}

-- | Pins for the growth validation over the distilled ABI: the prose
-- parsers, the toy fixture failing without a growth entry for the struct
-- whose member note gates it (and passing with the golden's overrides),
-- registry entries that contradict the offsets, and the hand-built
-- shapes (multi-step, unexplained, non-monotone, unions).
module Sdl3.AbiValidateTest (
  unit_parseSinceProse,
  unit_addedInSinceProse,
  unit_validateRejectsUnrecordedGrowth,
  unit_validateAcceptsGolden,
  unit_validateRejectsInconsistentBefore,
  unit_validateRejectsWrongGate,
  unit_validateRejectsMultiStep,
  unit_validateRejectsUnexplainedGrowth,
  unit_validateRejectsNonMonotone,
  unit_validateSkipsUnionsAndBaselineGates,
) where

import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Sdl3.Abi (
  AbiDecl (..),
  AbiField (..),
  AbiGrowth (..),
  AbiKind (..),
  AbiLayoutBefore (..),
  AbiOverrides (..),
  AbiSince (..),
  StructOverrides (..),
  addedInSince,
  emptyAbiOverrides,
  parseSince,
  versionToken,
 )
import Lithon.Codegen.Sdl3.Abi.Validate (
  AbiProblem (..),
  AbiProblemKind (..),
  GrowthStep (..),
  validateAbi,
 )
import Sdl3.AbiRenderTest (toyAbi, toyOverrides)

v :: Int -> Int -> Int -> AbiSince
v major minor patch = AbiSince{major, minor, patch}

unit_parseSinceProse :: IO ()
unit_parseSinceProse = do
  versionToken "This function is available since SDL 3.2.0." @?= Just (v 3 2 0)
  parseSince "3.4.16)." @?= Just (v 3 4 16)
  parseSince "3.4" @?= Just (v 3 4 0)
  parseSince "1.2.3.4" @?= Nothing
  parseSince "v3.4" @?= Nothing
  parseSince "3" @?= Nothing
  parseSince "3..4" @?= Nothing

unit_addedInSinceProse :: IO ()
unit_addedInSinceProse = do
  addedInSince "Complete pen input state at time of event (added in 3.4.16)." @?= Just (v 3 4 16)
  addedInSince "(Added In SDL 3.4.0)" @?= Just (v 3 4 0)
  addedInSince "The window with pen focus, if any" @?= Nothing
  -- Only the "added in" phrase gates; other version prose is inert.
  addedInSince "This macro is available since SDL 3.4.0." @?= Nothing

problems :: Text -> [AbiDecl] -> [AbiProblem]
problems sdlVersion decls = case validateAbi sdlVersion decls of
  Success () -> []
  Failure errs -> toList errs

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

field :: Text -> Int -> Maybe AbiSince -> AbiField
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
