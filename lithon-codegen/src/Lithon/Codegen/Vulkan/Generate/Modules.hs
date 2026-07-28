{-# LANGUAGE OverloadedStrings #-}

-- | Module assignment (generate pass g6), value-layer scope.
--
-- Every entity is emitted into exactly one module, chosen from its
-- __earliest curated origin__ — the head of its own require-site list
-- extended by its alias spellings' lists, after dropping origins whose
-- source didn't survive curation. Both provisions matter in practice:
-- pruning keeps full origin lists, so an uncurated 2026 extension can be
-- the /first/ require-site of a thoroughly core enum; and an entity can be
-- curated purely through an alias spelling (VK_EXT_device_fault requires
-- @VkDeviceFaultAddressTypeEXT@, whose canonical KHR spelling has only
-- uncurated own-origins). Phase 2 records lists in walk order (features
-- version-ascending, then extensions), so promoted entities land in the
-- core version that promoted them:
--
-- * Feature-originated enum\/bitmask blocks -> @Lithon.Core1X.Enums.\<WithNS\>@
--   (one module per block: enums are leaves, which keeps the import graph
--   acyclic by construction).
-- * Feature-originated handles -> @Lithon.Core1X.Handles@.
-- * Extension-originated entities -> that extension's single module,
--   @Lithon.Extensions.\<KHR_swapchain\>@.
-- * A @Flags@ synonym co-locates with its FlagBits block; reserved-empty
--   bitmasks (no bits block) get their own @Enums@ module.
--
-- Every curated enum\/bitmask\/handle resolves through one of those three
-- tiers (curated own origin -> curated alias origin -> raw home extension;
-- all three occur in the pinned surface, measured). An entity with no
-- origins anywhere is a hard 'ModuleError'.
--
-- Struct\/command assignment (require-block comments for Core10 groups,
-- promotion provenance for Core11+, SCC cycle checking) arrives with their
-- emission milestones; this pass grows in place.
module Lithon.Codegen.Vulkan.Generate.Modules (
  ModuleMap (..),
  ModuleError (..),
  assignModules,

  -- * Fixed module paths
  constantsModule,
  versionModule,
  resultModule,
  umbrellaModule,
) where

import Algebra.Graph.AdjacencyMap qualified as AM
import Algebra.Graph.AdjacencyMap.Algorithm qualified as AMA
import Algebra.Graph.NonEmpty.AdjacencyMap qualified as NAM
import Data.Aeson (ToJSON)
import Data.Char qualified as Char
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Backend.Hs (ModulePath (..))
import Lithon.Codegen.Vulkan.Generate.Lower (CType (..), Lowered (..), LoweredMember (..))
import Lithon.Codegen.Vulkan.Generate.Names (Names (..), stripVkPrefix)
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Types.Enums (EnumsKind (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AliasInfo (..),
  CoreVersion (..),
  Origin (..),
  OriginSource (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Commands (ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBitmask (..),
  ResolvedFuncpointer (..),
  ResolvedHandle (..),
  ResolvedParam (..),
  ResolvedStruct (..),
  ResolvedTypeRef (..),
  TypeRefKind (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (ResolvedEnumBlock (..))
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedFeature (..), ResolvedRegistry (..))

-- | Where each value-layer entity is emitted. Keys are canonical registry
-- spellings.
data ModuleMap = ModuleMap
  { enumModules :: !(Map TypeName ModulePath)
  -- ^ Enum and FlagBits blocks ('KindConstants' blocks are not emitted as
  -- modules — the API-constants surface is 'constantsModule').
  , bitmaskModules :: !(Map TypeName ModulePath)
  -- ^ @Flags@ synonyms — the module of their bits block, or their own.
  , handleModules :: !(Map TypeName ModulePath)
  , structModules :: !(Map TypeName ModulePath)
  , funcpointerModules :: !(Map TypeName ModulePath)
  , commandModules :: !(Map CommandName ModulePath)
  -- ^ Structs and unions. Core 1.0 groups by require-block comment
  -- (\"Device initialization\" -> @Core10.DeviceInitialization@); Core 1.1+
  -- blocks rarely carry comments, so those group by promoted-from
  -- provenance (the first extension origin anywhere in the entity's
  -- own+alias origin lists -> @Core13.Promoted_From_KHR_synchronization2@),
  -- falling back to @Other@.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ModuleError
  = ModuleNoOrigin
      { kind :: !Namespace
      , name :: !Text
      }
  | ModuleUnmintedName
      { kind :: !Namespace
      , name :: !Text
      }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display ModuleError where
  displayBuilder =
    displayBuilder @Text . \case
      ModuleNoOrigin{kind, name} ->
        "cannot assign a module: no origins on " <> display kind <> " '" <> name <> "'"
      ModuleUnmintedName{kind, name} ->
        "cannot assign a module: no minted name for " <> display kind <> " '" <> name <> "'"

constantsModule :: ModulePath
constantsModule = ModulePath "Lithon.Vk.Constants"

versionModule :: ModulePath
versionModule = ModulePath "Lithon.Vk.Version"

resultModule :: ModulePath
resultModule = ModulePath "Lithon.Vk.Result"

umbrellaModule :: ModulePath
umbrellaModule = ModulePath "Lithon.Vk"

-- | Assign every entity to its module, then deterministically merge any
-- module-level reference cycles (the registry's require-groups are not
-- topologically disciplined — e.g. ray-tracing structs and the Core11+
-- promotion buckets reference each other): every module in a nontrivial
-- SCC is remapped to the lexicographically-first member. The module-map
-- golden makes each merge reviewable.
assignModules
  :: (HasType ResolvedRegistry cxt, HasType Names cxt, HasType Lowered cxt)
  => cxt
  -> Validation (Errors ModuleError) ModuleMap
assignModules cxt =
  mergeCycles
    <$> ( ModuleMap
            <$> enumAssignments
            <*> bitmaskAssignments
            <*> handleAssignments
            <*> structAssignments
            <*> funcpointerAssignments
            <*> commandAssignments
        )
 where
  lowered = getTyped @Lowered cxt

  mergeCycles mm =
    let remap = cycleRemap mm
        apply :: Map k ModulePath -> Map k ModulePath
        apply = Map.map (\at -> Map.findWithDefault at at remap)
     in ModuleMap
          { enumModules = apply mm.enumModules
          , bitmaskModules = apply mm.bitmaskModules
          , handleModules = apply mm.handleModules
          , structModules = apply mm.structModules
          , funcpointerModules = apply mm.funcpointerModules
          , commandModules = apply mm.commandModules
          }

  -- module -> representative for members of nontrivial SCCs
  cycleRemap mm =
    Map.fromList
      [ (member, rep)
      | component <- AM.vertexList (AMA.scc (moduleGraph mm))
      , let members = sort (toList (NAM.vertexList1 component))
      , length members > 1
      , rep : _ <- [members]
      , member <- members
      ]

  moduleGraph mm =
    AM.overlay
      (AM.vertices (Map.elems mm.structModules))
      ( AM.edges
          ( [ (from', to')
            | (name, members) <- Map.toList lowered.structs
            , Just from' <- [Map.lookup name mm.structModules]
            , to' <- ordNub (concatMap (mapMaybe (refModule mm) . ctypeRefs . (.ctype)) members)
            , from' /= to'
            ]
              <> [ (from', to')
                 | (name, cmd) <- Map.toList registry.commands
                 , Just from' <- [Map.lookup name mm.commandModules]
                 , r <- cmd.returnType : fmap (.typeRef) (toList cmd.params)
                 , Just to' <- [refModule mm (refSide r)]
                 , from' /= to'
                 ]
          )
      )

  refSide r = case r.kind of
    RefBitmask -> Right r.name
    _ -> Left r.name

  ctypeRefs = \case
    CEnum t -> [Left t]
    CFlags t _ -> [Right t]
    CFlagsBits t _ -> [Left t]
    CHandleND t -> [Left t]
    CHandleD t -> [Left t]
    CStructRef t -> [Left t]
    CArray _ e -> ctypeRefs e
    _ -> []

  refModule mm = \case
    Left t ->
      asum
        [ Map.lookup t mm.structModules
        , Map.lookup t mm.enumModules
        , Map.lookup t mm.handleModules
        , Map.lookup t mm.funcpointerModules
        ]
    Right t -> Map.lookup t mm.bitmaskModules

  registry = getTyped @ResolvedRegistry cxt
  names = getTyped @Names cxt

  enumAssignments =
    fmap Map.fromList
      . traverse assignEnum
      . Map.toList
      $ Map.filter (\b -> b.kind /= KindConstants) registry.enums
  assignEnum (name, block) =
    enumsSited name
      <$> baseOf TypeNS (forgetNamespace name) (withAliasOrigins block.origins block.aliases)
      <*> mintedType name

  bitmaskAssignments =
    fmap Map.fromList . traverse assignBitmask . Map.toList $ registry.bitmasks
  assignBitmask (name, bm) = case bm.bitsBlock of
    -- co-locate with the bits block (which always has kind /= KindConstants)
    Just bits -> case Map.lookup bits registry.enums of
      Nothing -> failing ModuleNoOrigin{kind = TypeNS, name = forgetNamespace bits}
      Just block ->
        enumsSited name
          <$> baseOf TypeNS (forgetNamespace bits) (withAliasOrigins block.origins block.aliases)
          <*> mintedType bits
    -- reserved-empty mask: its own Enums module, from its own origins
    Nothing ->
      enumsSited name
        <$> baseOf TypeNS (forgetNamespace name) (withAliasOrigins bm.origins bm.aliases)
        <*> mintedType name

  enumsSited name base leaf = (name, nest base ("Enums." <> leaf))

  handleAssignments =
    fmap Map.fromList . traverse assignHandle . Map.toList $ registry.handles
  assignHandle (name, h) =
    (\base -> (name, nest base "Handles"))
      <$> baseOf TypeNS (forgetNamespace name) (withAliasOrigins h.origins h.aliases)

  structAssignments =
    fmap Map.fromList . traverse assignStruct . Map.toList $ registry.structs
  assignStruct (name, s) =
    (name,)
      <$> structSite (forgetNamespace name) (withAliasOrigins s.origins s.aliases)

  funcpointerAssignments =
    fmap Map.fromList . traverse assignFp . Map.toList $ registry.funcpointers
  assignFp (name, fp) =
    (name,) <$> structSite (forgetNamespace name) fp.origins

  commandAssignments =
    fmap Map.fromList . traverse assignCmd . Map.toList $ registry.commands
  assignCmd (name, cmd) =
    (name,)
      <$> structSite (forgetNamespace name) (cmd.origins <> concatMap (.origins) (toList cmd.aliases))

  -- Structs land in require-group modules rather than flat version
  -- buckets; the group label depends on the era of the earliest curated
  -- (or raw — same fallback as 'baseOf') origin.
  structSite :: Text -> [Origin] -> Validation (Errors ModuleError) ModulePath
  structSite name origins = case filter originCurated origins <> origins of
    [] -> failing ModuleNoOrigin{kind = TypeNS, name}
    all'@(o : _) -> case o.source of
      FromExtension{extension} ->
        pure
          . extensionPath
          $ fromMaybe
            (stripVkPrefix (forgetNamespace extension))
            (Map.lookup extension names.extensionModules)
      FromFeature{version = CoreVersion{major, minor}}
        | (major, minor) == (1, 0) ->
            pure
              . ModulePath
              $ "Lithon.Vk.Core10."
              <> maybe "Other" groupLabel o.blockComment
        | otherwise ->
            pure
              . ModulePath
              $ "Lithon.Vk.Core"
              <> show major
              <> show minor
              <> "."
              <> promotedLabel all'

  -- \"Device initialization\" -> DeviceInitialization (words PascalCased,
  -- non-alphanumerics dropped).
  groupLabel comment =
    case mconcat (capWord <$> words comment) of
      "" -> "Other"
      label -> label
  capWord w = case T.uncons (T.filter Char.isAlphaNum w) of
    Just (c, cs) -> T.cons (Char.toUpper c) cs
    Nothing -> ""

  -- The first extension origin ANYWHERE in the (own <> alias) lists names
  -- the promoted-from module; raw origins deliberately count (the promoted-
  -- from extension is usually uncurated — that is what promotion means).
  promotedLabel origins =
    case [e | Origin{source = FromExtension{extension = e}} <- origins] of
      (e : _) -> "Promoted_From_" <> stripVkPrefix (forgetNamespace e)
      [] -> "Other"

  -- Own origins first (the canonical spelling's sites win when curated),
  -- alias origins after, in spelling order.
  withAliasOrigins :: [Origin] -> Vector (AliasInfo k) -> [Origin]
  withAliasOrigins own aliases = own <> concatMap (.origins) (toList aliases)

  -- The base module of an entity's earliest curated origin — or, for
  -- reference-closed entities with no curated require-site at all (e.g.
  -- VkBlendOverlapEXT, pulled in because extended_dynamic_state3's structs
  -- reference it), the earliest RAW origin: the type's true home extension
  -- names its module even when that extension isn't otherwise bound. Docs
  -- mark such modules as referenced-types-only (M6). Extension modules are
  -- flat (entities co-live in the one extension module), so nesting only
  -- applies to core versions.
  baseOf :: Namespace -> Text -> [Origin] -> Validation (Errors ModuleError) Base
  baseOf kind name origins = case filter originCurated origins <> origins of
    [] -> failing ModuleNoOrigin{kind, name}
    (o : _) -> case o.source of
      FromFeature{version = CoreVersion{major, minor}} ->
        pure (BaseCore (show major <> show minor))
      FromExtension{extension} ->
        -- Uncurated home extensions aren't in the minted map; their
        -- segment is minted on the spot (same rule, collisions would
        -- surface as duplicate emission paths).
        pure
          . BaseExtension
          $ fromMaybe
            (stripVkPrefix (forgetNamespace extension))
            (Map.lookup extension names.extensionModules)

  -- An origin survives when its source did: curated features are exactly
  -- the registry's feature vector, curated extensions its extensions map.
  originCurated o = case o.source of
    FromFeature{version} -> Set.member version curatedVersions
    FromExtension{extension} -> Map.member extension registry.extensions
  curatedVersions =
    Set.fromList [f.version | f <- toList registry.features]

  mintedType name = case Map.lookup name names.typeNames of
    Just t -> pure t
    Nothing -> failing ModuleUnmintedName{kind = TypeNS, name = forgetNamespace name}

  failing :: ModuleError -> Validation (Errors ModuleError) a
  failing = Failure . errors1

-- | Core versions nest (@Lithon.Core10.Enums.Result@); extension modules
-- are flat (@Lithon.Extensions.KHR_swapchain@ holds everything the
-- extension introduces).
data Base = BaseCore Text | BaseExtension Text

nest :: Base -> Text -> ModulePath
nest base leaf = case base of
  BaseCore v -> ModulePath ("Lithon.Vk.Core" <> v <> "." <> leaf)
  BaseExtension seg -> extensionPath seg

extensionPath :: Text -> ModulePath
extensionPath seg = ModulePath ("Lithon.Vk.Extensions." <> seg)
