-- | Enum flow classification: does a value cross the boundary app->driver
-- ('FlowIn'), driver->app ('FlowOut'), or both? This drives phase 3's
-- open-ADT decision — driver-returned enums can carry values the binding
-- was not generated against, so their Haskell type needs an unknown hole;
-- app-provided ones can be closed.
--
-- Fixpoint over the type graph. Seeds: command return types flow out;
-- pointer parameters with a mutable pointee flow out, everything else in;
-- @returnedOnly@ structs flow out. Propagation: a struct passes its
-- direction to its member types and to the structs that extend it (pNext
-- chains follow their base); funcpointers are app-implemented callbacks, so
-- their parameters flow out (driver->app) and their return flows in. Enum
-- and bitmask hits are recorded on the owning FlagBits\/values block.
--
-- Deliberate approximation, documented for phase 3: members inherit their
-- struct's direction wholesale (no per-member pointer analysis inside
-- structs).
module Lithon.Codegen.Vulkan.Resolve.Flow (
  EnumFlow (..),
  Flows (..),
  flowOf,
  classifyFlow,
) where

import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Vector qualified as V

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Resolve.CrossRef (TypeGraph (..))
import Lithon.Codegen.Vulkan.Resolve.Enums (MaterializedEnums (..))
import Lithon.Codegen.Vulkan.Resolved.Commands (ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBitmask (..),
  ResolvedFuncpointer (..),
  ResolvedMember (..),
  ResolvedParam (..),
  ResolvedStruct (..),
  ResolvedTypeRef (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (EnumFlow (..), Flows (..), flowOf)

data Dir = DirIn | DirOut
  deriving stock (Eq, Ord, Show)

-- | Flow per enums-block name (covers plain enums and FlagBits blocks).
classifyFlow :: (HasType TypeGraph cxt, HasType MaterializedEnums cxt) => cxt -> Flows
classifyFlow cxt =
  Flows
    $ Map.fromList
      [ (blockName, classify blockName)
      | blockName <- Map.keys materialized.blocks
      ]
 where
  graph = getTyped @TypeGraph cxt
  materialized = getTyped @MaterializedEnums cxt

  classify blockName =
    case (Set.member (blockName, DirIn) hits, Set.member (blockName, DirOut) hits) of
      (True, True) -> FlowBoth
      (True, False) -> FlowIn
      (False, True) -> FlowOut
      (False, False) -> FlowUnreferenced

  -- Every (block, direction) fact, from the seed worklist to fixpoint.
  hits :: Set (TypeName, Dir)
  hits = go Set.empty Set.empty seeds

  seeds :: [(TypeName, Dir)]
  seeds = concatMap commandSeeds (Map.elems graph.commands) <> returnedOnlySeeds
  commandSeeds cmd =
    (cmd.returnType.name, DirOut)
      : [ (p.typeRef.name, paramDir p)
        | p <- V.toList cmd.params
        ]
  paramDir p
    | null p.pointers = DirIn
    | p.baseConst = DirIn
    | otherwise = DirOut
  returnedOnlySeeds =
    [(s.name, DirOut) | s <- Map.elems graph.structs, s.returnedOnly]

  -- Worklist fixpoint. @recorded@ holds enum-block facts; @visited@ guards
  -- (typeName, dir) expansion.
  go :: Set (TypeName, Dir) -> Set (TypeName, Dir) -> [(TypeName, Dir)] -> Set (TypeName, Dir)
  go recorded _ [] = recorded
  go recorded visited ((name, dir) : rest)
    | Set.member (name, dir) visited = go recorded visited rest
    | otherwise =
        let visited' = Set.insert (name, dir) visited
         in case expand name dir of
              Record blockName ->
                go (Set.insert (blockName, dir) recorded) visited' rest
              Expand next -> go recorded visited' (next <> rest)

  expand :: TypeName -> Dir -> Expansion
  expand name dir
    | Just s <- Map.lookup name graph.structs =
        Expand
          $ [(m.typeRef.name, dir) | m <- V.toList s.members]
          <> [(ext, dir) | ext <- s.extendedBy]
    | Just b <- Map.lookup name graph.bitmasks =
        case b.bitsBlock of
          Just blockName -> Record blockName
          Nothing -> Expand []
    | Map.member name materialized.blocks = Record name
    | Just f <- Map.lookup name graph.funcpointers =
        Expand
          $ (f.returnType.name, DirIn)
          : [(p.typeRef.name, DirOut) | p <- V.toList f.params]
    | otherwise = Expand [] -- handles, basetypes, externals, defines, void

data Expansion
  = Record !TypeName
  | Expand ![(TypeName, Dir)]
