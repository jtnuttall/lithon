{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}

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

import Lithon.Codegen.Backend.Hs.Module qualified as Module
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
  { enumModules :: Map TypeName Module.Meta
  -- ^ Enum and FlagBits blocks ('KindConstants' blocks are not emitted as
  -- modules — the API-constants surface is 'constantsModule').
  , bitmaskModules :: Map TypeName Module.Meta
  -- ^ @Flags@ synonyms — the module of their bits block, or their own.
  , handleModules :: Map TypeName Module.Meta
  , structModules :: Map TypeName Module.Meta
  , funcpointerModules :: Map TypeName Module.Meta
  , commandModules :: Map CommandName Module.Meta
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
      { kind :: Namespace
      , name :: Text
      }
  | ModuleUnmintedName
      { kind :: Namespace
      , name :: Text
      }
  | ModuleMetaError Module.MetaError
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance From Module.MetaError ModuleError where
  from = ModuleMetaError

instance Display ModuleError where
  displayBuilder =
    \case
      ModuleNoOrigin{kind, name} ->
        "cannot assign a module: no origins on " <> from kind <> " '" <> from name <> "'"
      ModuleUnmintedName{kind, name} ->
        "cannot assign a module: no minted name for " <> from kind <> " '" <> from name <> "'"
      ModuleMetaError err -> displayBuilder err

constantsModule :: Module.Meta
constantsModule = $$(Module.metaLit ["Lithon", "Vk", "Constants"])

versionModule :: Module.Meta
versionModule = $$(Module.metaLit ["Lithon", "Vk", "Version"])

resultModule :: Module.Meta
resultModule = $$(Module.metaLit ["Lithon", "Vk", "Result"])

extensionModule :: Module.Meta
extensionModule = $$(Module.metaLit ["Lithon", "Vk", "Extensions"])

umbrellaModule :: Module.Meta
umbrellaModule = $$(Module.metaLit ["Lithon", "Vk"])

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
            <$> liftErrors enumAssignments
            <*> bitmaskAssignments
            <*> liftErrors handleAssignments
            <*> structAssignments
            <*> funcpointerAssignments
            <*> commandAssignments
        )
 where
  lowered = getTyped @Lowered cxt

  liftErrors = first errors1 . eitherToValidation

  mergeCycles mm =
    let remap = cycleRemap mm
        apply :: Map k Module.Meta -> Map k Module.Meta
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

  assignTypeModule
    :: (HasField' "origins" r [Origin], HasField' "aliases" r (Vector (AliasInfo k)))
    => TypeName -> r -> Either ModuleError (TypeName, Module.Meta)
  assignTypeModule name block = do
    base <-
      baseOf TypeNS (forgetNamespace name) (withAliasOrigins (block ^. #origins) (block ^. #aliases))
    minted <- mintedType name
    (name,) <$> nest base ["Enums", minted]

  enumAssignments =
    fmap Map.fromList
      . traverse (uncurry assignTypeModule)
      . Map.toList
      $ Map.filter (\b -> b.kind /= KindConstants) registry.enums

  bitmaskAssignments =
    fmap Map.fromList . traverse assignBitmask . Map.toList $ registry.bitmasks

  assignBitmask (name, bm) = first errors1 $ eitherToValidation do
    case bm.bitsBlock of
      -- Co-locate with the bits block: its origins AND its minted name decide
      -- the module (the Flags synonym lives in its FlagBits module).
      Just bits -> do
        block <-
          noteErr (ModuleNoOrigin{kind = TypeNS, name = forgetNamespace bits})
            $ Map.lookup bits registry.enums
        (_bits, meta) <- assignTypeModule bits block
        pure (name, meta)
      -- Reserved-empty mask: its own Enums module, from its own origins.
      Nothing -> do
        assignTypeModule name bm

  handleAssignments =
    fmap Map.fromList
      . traverse assignHandle
      . Map.toList
      $ registry.handles

  assignHandle (name, h) = do
    base <- baseOf TypeNS (forgetNamespace name) (withAliasOrigins h.origins h.aliases)
    (name,) <$> nest base ["Handles"]

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
  structSite :: Text -> [Origin] -> Validation (Errors ModuleError) Module.Meta
  structSite name origins = eitherToValidation case filter originCurated origins <> origins of
    [] -> Left $ errors1 ModuleNoOrigin{kind = TypeNS, name}
    allOrigins@(o : _) -> first (errors1 . from) case o.source of
      FromExtension{extension} -> mintExtModule names extension
      FromFeature{version = CoreVersion{major, minor}}
        | (major, minor) == (1, 0) ->
            Module.fromSegments ["Lithon", "Vk", "Core10", maybe "Other" groupLabel o.blockComment]
        | otherwise ->
            Module.fromSegments
              [ "Lithon"
              , "Vk"
              , "Core" <> show major <> show minor
              , promotedLabel allOrigins
              ]

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

  baseOf :: Namespace -> Text -> [Origin] -> Either ModuleError Base
  baseOf kind name origins = case filter originCurated origins <> origins of
    [] -> Left $ ModuleNoOrigin{kind, name}
    (o : _) -> first from case o.source of
      FromFeature{version = CoreVersion{major, minor}} ->
        pure (BaseCore (show major <> show minor))
      FromExtension{extension} -> BaseExtension <$> mintExtModule names extension

  -- An origin survives when its source did: curated features are exactly
  -- the registry's feature vector, curated extensions its extensions map.
  originCurated o = case o.source of
    FromFeature{version} -> Set.member version curatedVersions
    FromExtension{extension} -> Map.member extension registry.extensions
  curatedVersions =
    Set.fromList [f.version | f <- toList registry.features]

  mintedType name = case Map.lookup name names.typeNames of
    Just t -> Right t
    Nothing -> Left ModuleUnmintedName{kind = TypeNS, name = forgetNamespace name}

mintExtModule :: Names -> ExtensionName -> Either Module.MetaError Module.Meta
mintExtModule names ext = fmap (extensionModule <>) case Map.lookup ext names.extensionModules of
  Just mods -> pure mods
  Nothing -> Module.fromSegments [stripVkPrefix (forgetNamespace ext)]

-- | Core versions nest (@Lithon.Core10.Enums.Result@); extension modules
-- are flat (@Lithon.Extensions.KHR_swapchain@ holds everything the
-- extension introduces).
data Base = BaseCore Text | BaseExtension Module.Meta

nest :: Base -> [Text] -> Either ModuleError Module.Meta
nest base leaves = first from case base of
  BaseCore v -> Module.fromSegments $ ["Lithon", "Vk", "Core" <> v] <> leaves
  -- Extension modules are flat and 'mintExtModule' already prefixed the
  -- extension namespace; the leaves apply only to versioned core homes.
  BaseExtension m -> pure m
