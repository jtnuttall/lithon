{-# LANGUAGE OverloadedStrings #-}

-- | Whole-registry structural invariants over the parsed pin — the
-- assumptions later phases lean on, checked where they are cheapest.
module Vulkan.InvariantTest (
  unit_offsetEncodedEnumsExtendSomething,
  unit_dependsNeverContainsNot,
  unit_unclassifiedValueLiteralsArePinned,
  unit_unclassifiedLenLevelsArePinned,
  unit_funcpointerCountPinned,
  unit_aliasTargetsNonEmpty,
) where

import Data.List.NonEmpty qualified as NE
import Data.Vector qualified as V
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, (@?=))

import Lithon.Codegen.Vulkan.Registry (Registry (..))
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr
import Lithon.Codegen.Vulkan.Registry.Micro.Len (LenLevel (..), LenSpec (..))
import Lithon.Codegen.Vulkan.Registry.Micro.Literal (ValueLiteral (..))
import Lithon.Codegen.Vulkan.Registry.Types.Commands (
  Command (..),
  CommandDefinition (..),
  Param (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Common (Raw (..))
import Lithon.Codegen.Vulkan.Registry.Types.Core (
  AliasOr (..),
  Member (..),
  StructDef (..),
  TypeBody (..),
  TypeDecl (..),
  typeBodyName,
 )
import Lithon.Codegen.Vulkan.Registry.Types.Enums (
  EnumDef (..),
  EnumValueSpec (..),
  EnumsBlock (..),
  EnumsItem (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Features (
  ChangeBlock (..),
  Extension (..),
  Feature (..),
  InterfaceItem (..),
  RemoveBlock (..),
  RequireBlock (..),
 )
import Vulkan.Support.Registry (pinnedRegistry)

allEnumDefs :: Registry -> [EnumDef]
allEnumDefs reg =
  [e | block <- V.toList reg.enums, ItemEnum e <- V.toList block.items]
    <> concatMap featureEnums (V.toList reg.features)
    <> concatMap extensionEnums (V.toList reg.extensions)
 where
  featureEnums f = concatMap changeEnums (V.toList f.changes)
  extensionEnums e = concatMap changeEnums (V.toList e.changes)
  changeEnums = \case
    ChRequire r -> [e | ReqEnum e <- V.toList r.items]
    ChRemove r -> [e | ReqEnum e <- V.toList r.items]
    ChDeprecate _ -> []

-- | Offset-encoded values only make sense against an extended enum type.
unit_offsetEncodedEnumsExtendSomething :: IO ()
unit_offsetEncodedEnumsExtendSomething = do
  let offenders =
        [ e.name
        | e <- allEnumDefs pinnedRegistry
        , isNothing e.extends
        , EvOffset{} <- [e.spec]
        ]
  offenders @?= []

-- | The depends grammar has no NOT; only protect does. Re-checked here in
-- case the parser ever loosens.
unit_dependsNeverContainsNot :: IO ()
unit_dependsNeverContainsNot = do
  let hasNot :: BoolExpr a -> Bool
      hasNot = \case
        BAtom _ -> False
        BNot _ -> True
        BAnd l r -> hasNot l || hasNot r
        BOr l r -> hasNot l || hasNot r
      offenders =
        [ raw.raw
        | raw <- allDepends pinnedRegistry
        , hasNot raw.parsed
        ]
  offenders @?= []
 where
  allDepends reg =
    mapMaybe (.depends) (V.toList reg.features)
      <> mapMaybe (.depends) (V.toList reg.extensions)
      <> concatMap featureBlocks (V.toList reg.features)
      <> concatMap extensionBlocks (V.toList reg.extensions)
  featureBlocks f = concatMap requireDepends (V.toList f.changes)
  extensionBlocks e = concatMap requireDepends (V.toList e.changes)
  requireDepends = \case
    ChRequire r -> maybe [] pure r.depends
    _ -> []

-- | Every value literal the classifier could not type is known by name; a
-- new unclassified form in a registry bump surfaces here, not silently.
unit_unclassifiedValueLiteralsArePinned :: IO ()
unit_unclassifiedValueLiteralsArePinned = do
  let exprs =
        [ raw.raw
        | e <- allEnumDefs pinnedRegistry
        , EvValue raw _ <- [e.spec]
        , VExpr _ <- [raw.parsed]
        ]
  exprs @?= []

-- | Same pinning for len= levels the classifier left raw.
unit_unclassifiedLenLevelsArePinned :: IO ()
unit_unclassifiedLenLevelsArePinned = do
  let others =
        [ level
        | Raw _ (LenSpec levels) <- allLens pinnedRegistry
        , LenOther level <- NE.toList levels
        ]
  others @?= []
 where
  allLens reg = memberLens reg <> paramLens reg
  memberLens reg =
    [ raw
    | t <- V.toList reg.types
    , TStruct (FullDef s) <- [t.body]
    , m <- V.toList s.members
    , Just raw <- [m.len]
    ]
      <> [ raw
         | t <- V.toList reg.types
         , TUnion (FullDef s) <- [t.body]
         , m <- V.toList s.members
         , Just raw <- [m.len]
         ]
  paramLens reg =
    [ raw
    | CommandDef d <- V.toList reg.commands
    , p <- V.toList d.params
    , Just raw <- [p.len]
    ]

unit_funcpointerCountPinned :: IO ()
unit_funcpointerCountPinned =
  length [() | t <- V.toList pinnedRegistry.types, TFuncpointer _ <- [t.body]] @?= 11

-- | Alias forms always name a real target string (resolution is phase 2;
-- non-emptiness is phase 1's business).
unit_aliasTargetsNonEmpty :: IO ()
unit_aliasTargetsNonEmpty = do
  let aliasTargets =
        [ (typeBodyName t.body, targetOf t.body)
        | t <- V.toList pinnedRegistry.types
        ]
      bad = [n | (n, Just target) <- aliasTargets, target == ""]
  bad @?= []
  assertBool
    "some alias forms exist"
    (length (filter (isJust . snd) aliasTargets) > 100)
 where
  targetOf = \case
    TBitmask (AliasDef{target}) -> Just target
    THandle (AliasDef{target}) -> Just target
    TEnumDecl (AliasDef{target}) -> Just target
    TStruct (AliasDef{target}) -> Just target
    TUnion (AliasDef{target}) -> Just target
    _ -> Nothing
