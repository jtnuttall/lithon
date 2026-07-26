{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Canonicalization tables for the three aliasable namespaces.
--
-- The registry aliases types ('AliasDef' bodies), commands
-- ('CommandAlias'), and enum values ('EvAlias' sites); the canonical
-- definition always carries the core\/promoted spelling and the alias
-- points at it. This pass inverts that into per-namespace
-- @alias -> 'CanonicalEntry'@ tables with chains followed to their final
-- definition, so later passes never see an alias name without knowing its
-- target. It produces TABLES, not a rewritten registry — phase-1 types have
-- nowhere to carry provenance, and the resolved IR (which does) is
-- assembled later from these.
--
-- Errors: cycles, aliases whose final target is not a definition, one
-- alias name pointing at conflicting targets, and enum value names that are
-- simultaneously alias and definition (a registry anomaly this tooling
-- refuses to guess about).
module Lithon.Codegen.Vulkan.Resolve.Aliases (
  Aliases (..),
  CanonicalEntry (..),
  AliasError (..),
  resolveAliases,
  canonicalize,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Types.Commands (Command (..))
import Lithon.Codegen.Vulkan.Registry.Types.Common (Deprecation)
import Lithon.Codegen.Vulkan.Registry.Types.Core (
  AliasOr (..),
  TypeBody (..),
  TypeCommon (..),
  TypeDecl (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Enums (EnumDef (..), EnumValueSpec (..))
import Lithon.Codegen.Vulkan.Resolve.Symbols (EnumValueSite (..), Symbols (..), tableFor)

-- | The resolution of one alias spelling.
data CanonicalEntry (k :: Namespace) = CanonicalEntry
  { target :: WithNS k
  -- ^ The final, non-alias definition name.
  , chain :: [WithNS k]
  -- ^ Intermediate aliases traversed (usually empty).
  , deprecated :: Maybe Deprecation
  -- ^ Deprecation on the alias site itself.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Aliases = Aliases
  { types :: Map TypeName (CanonicalEntry 'TypeNS)
  , commands :: Map CommandName (CanonicalEntry 'CommandNS)
  , enumValues :: Map EnumValueName (CanonicalEntry 'EnumValueNS)
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data AliasError
  = AliasCycle {namespace :: Namespace, chain :: [Text]}
  | AliasDangling {namespace :: Namespace, alias :: Text, target :: Text}
  | AliasConflict {namespace :: Namespace, alias :: Text, targets :: [Text]}
  | AliasShadowsDefinition {namespace :: Namespace, name :: Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display AliasError where
  displayBuilder =
    displayBuilder @Text . \case
      AliasCycle{namespace, chain} ->
        "alias cycle in " <> display namespace <> " namespace: " <> T.intercalate " -> " chain
      AliasDangling{namespace, alias, target} ->
        display namespace <> " alias " <> alias <> " resolves to missing name " <> target
      AliasConflict{namespace, alias, targets} ->
        display namespace
          <> " alias "
          <> alias
          <> " has conflicting targets: "
          <> T.intercalate ", " targets
      AliasShadowsDefinition{namespace, name} ->
        display namespace <> " name " <> name <> " is both an alias and a definition"

-- | Total lookup: identity on non-alias names.
canonicalize :: Map (WithNS k) (CanonicalEntry k) -> WithNS k -> WithNS k
canonicalize table name = maybe name (.target) (Map.lookup name table)

resolveAliases :: (HasType Symbols cxt) => cxt -> Validation (Errors AliasError) Aliases
resolveAliases cxt = failUnlessEmpty errors aliases
 where
  symbols = getTyped @Symbols cxt
  aliases = Aliases{types = typeTable, commands = commandTable, enumValues = valueTable}
  errors = typeErrs <> commandErrs <> valueConflicts <> shadowErrs <> valueErrs

  (typeErrs, typeTable) = walkAll STypeNS typeEdges
  (commandErrs, commandTable) = walkAll SCommandNS commandEdges
  (valueErrs, valueTable) = walkAll SEnumValueNS valueEdges

  typeEdges :: Map TypeName (TypeName, Maybe Deprecation)
  typeEdges =
    Map.fromList
      [ (name, (target, t.common.deprecated))
      | t <- Map.elems symbols.types
      , (name, target) <- aliasPairOf t.body
      ]
  aliasPairOf = \case
    TBitmask a -> aliasPair a
    THandle a -> aliasPair a
    TEnumDecl a -> aliasPair a
    TStruct a -> aliasPair a
    TUnion a -> aliasPair a
    _ -> []
   where
    aliasPair :: AliasOr a -> [(TypeName, TypeName)]
    aliasPair = \case
      AliasDef{name, target} -> [(name, target)]
      FullDef _ -> []

  commandEdges :: Map CommandName (CommandName, Maybe Deprecation)
  commandEdges =
    Map.fromList
      [ (name, (target, Nothing))
      | CommandAlias{name, alias = target} <- Map.elems symbols.commands
      ]

  -- Enum value edges come from EvAlias sites; a name with several sites is
  -- an edge only if EVERY site is an alias (mixtures are shadow errors),
  -- and all sites must agree on the target.
  valueEdges :: Map EnumValueName (EnumValueName, Maybe Deprecation)
  valueEdges =
    Map.fromList
      [ (name, (target, firstDeprecation sites))
      | (name, sites) <- Map.toAscList symbols.enumValues
      , all (isAliasSite . (.def.spec)) (toList sites)
      , [target] <- [ordNub (aliasTargets sites)]
      ]
  valueConflicts =
    [ AliasConflict
        { namespace = EnumValueNS
        , alias = forgetNamespace name
        , targets = map forgetNamespace targets
        }
    | (name, sites) <- Map.toAscList symbols.enumValues
    , let targets = ordNub (aliasTargets sites)
    , length targets > 1
    ]
  shadowErrs =
    [ AliasShadowsDefinition{namespace = EnumValueNS, name = forgetNamespace name}
    | (name, sites) <- Map.toAscList symbols.enumValues
    , let specs = map (.def.spec) (toList sites)
    , any isAliasSite specs && not (all isAliasSite specs)
    ]
  aliasTargets sites = mapMaybe (aliasTargetOf . (.def.spec)) (toList sites)
  aliasTargetOf = \case
    EvAlias target -> Just target
    _ -> Nothing
  isAliasSite = \case
    EvAlias _ -> True
    _ -> False
  firstDeprecation sites = case mapMaybe (.def.deprecated) (toList sites) of
    d : _ -> Just d
    [] -> Nothing

  walkAll
    :: SNamespace k
    -> Map (WithNS k) (WithNS k, Maybe Deprecation)
    -> ([AliasError], Map (WithNS k) (CanonicalEntry k))
  walkAll ns edges =
    second Map.fromList (partitionWith classify (Map.toAscList edges))
   where
    namespace = fromSing ns
    isDefined = (`Map.member` tableFor ns symbols)
    classify (aliasName, (target0, deprecated)) =
      go [aliasName] target0 <&> \(target, chain) ->
        (aliasName, CanonicalEntry{target, chain, deprecated})
     where
      go seen current
        | current `elem` seen =
            Left AliasCycle{namespace, chain = map forgetNamespace (reverse (current : seen))}
        | otherwise = case Map.lookup current edges of
            Just (next, _) -> do
              (target, mids) <- go (current : seen) next
              pure (target, current : mids)
            Nothing
              | isDefined current -> Right (current, [])
              | otherwise ->
                  Left AliasDangling{namespace, alias = forgetNamespace aliasName, target = forgetNamespace current}
