{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StrictData #-}

-- | Shared vocabulary of the resolved IR: classified availability
-- expressions, item provenance, and deprecation metadata.
--
-- An 'AvailExpr' is a 'DependsExpr' whose atoms have been classified
-- against the symbol tables — every name is known to be a core version, an
-- extension, or a runtime device-feature path. The first two are decidable
-- at curation time; 'AvailFeature' atoms remain as runtime conditions the
-- engine checks during device selection.
module Lithon.Codegen.Vulkan.Resolved.Avail (
  CoreVersion (..),
  AvailAtom (..),
  AvailExpr,
  OriginSource (..),
  Origin (..),
  InterfaceItemNamespace (..),
  ItemKey (..),
  nameKind,
  DeprecationInfo (..),
  mergeDeprecation,
  FeatureRequirement (..),
  PlatformGuard (..),
  guardsFor,
  AliasInfo (..),

  -- * Classification and evaluation of @depends=@ expressions
  AvailError (..),
  canonicalFeaturePath,
  classifyAtom,
  classifyDepends,
  normalizeAvail,
  sourceAtom,
  availabilityOf,
  FeatureMode (..),
  CapabilityEnv (..),
  evalAvail,
) where

import Data.Aeson (ToJSON)
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry (Registry, Specialized)
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (
  BoolExpr,
  DependsAtom (..),
  DependsExpr,
  evalBoolExpr,
  pattern BAnd,
  pattern BAtom,
  pattern BNot,
  pattern BOr,
 )
import Lithon.Codegen.Vulkan.Registry.Micro.Common (FeaturePath (..))
import Lithon.Codegen.Vulkan.Registry.Types.Common (Deprecation, Platform (..), Raw (..))
import Lithon.Codegen.Vulkan.Registry.Types.Features (Extension (..), Feature (..))
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases (..), canonicalize)
import Lithon.Codegen.Vulkan.Resolve.Symbols (Symbols (..))
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

data CoreVersion = CoreVersion
  { major :: !Int
  , minor :: !Int
  }
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData, ToJSON)

instance Display CoreVersion where
  displayBuilder v = displayBuilder v.major <> "." <> displayBuilder v.minor

-- | A classified @depends=@ atom.
data AvailAtom
  = -- | Satisfied when the target core version is at least this.
    AvailVersion !CoreVersion
  | -- | Satisfied when the extension is enabled.
    AvailExtension !ExtensionName
  | -- | A runtime device-feature bit (@Struct::member@); undecidable at
    -- curation time.
    AvailFeature !FeaturePath
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData, ToJSON)

type AvailExpr = BoolExpr AvailAtom

-- | Registry-style rendering (versions as @VK_VERSION_x_y@), matching the
-- @depends=@ grammar; 'AvailExpr' rendering follows via the 'BoolExpr'
-- instance.
instance Display AvailAtom where
  displayBuilder = \case
    AvailVersion v -> "VK_VERSION_" <> displayBuilder v.major <> "_" <> displayBuilder v.minor
    AvailExtension name -> displayBuilder name
    AvailFeature path -> displayBuilder path

-- | Which interface (feature or extension) required an item.
data OriginSource
  = FromFeature {feature :: !FeatureName, version :: !CoreVersion}
  | FromExtension {extension :: !ExtensionName, number :: !Int}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | One require-site of an item. Items required from several places carry
-- several origins.
data Origin = Origin
  { source :: !OriginSource
  , tier :: !(Maybe FeatureName)
  -- ^ The internal tier the block was merged from, if any (provenance).
  , blockIndex :: !Int
  -- ^ Index of the require block within the (merged) source.
  , condition :: !(Maybe AvailExpr)
  -- ^ The require block's @depends=@, classified.
  , profile :: !(Maybe Text)
  -- ^ The require block's @profile=@ attribute (rare, kept faithfully).
  , blockComment :: !(Maybe Text)
  -- ^ The require block's @comment=@ — the registry's own grouping label
  -- (\"Device initialization\", \"Queue commands\", …). Phase 3 keys Core-1.0
  -- module grouping off this; Core 1.1+ blocks rarely carry one.
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The namespaces interface items live in — the three a require\/remove
-- block can reference, and therefore the tag on every tracked 'ItemKey'
-- (including reference-closed items no block ever listed).
data InterfaceItemNamespace = NsType | NsEnumValue | NsCommand
  deriving stock (Bounded, Enum, Eq, Generic, Ord, Show)
  deriving anyclass (NFData, ToJSON)

instance Display InterfaceItemNamespace where
  displayBuilder = \case
    NsType -> "type"
    NsEnumValue -> "enum value"
    NsCommand -> "command"

data ItemKey = ItemKey
  { namespace :: InterfaceItemNamespace
  , name :: Text
  }
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData, ToJSON)

-- | Every require-item namespace is also a definable name kind.
nameKind :: InterfaceItemNamespace -> Namespace
nameKind = \case
  NsType -> TypeNS
  NsEnumValue -> EnumValueNS
  NsCommand -> CommandNS

instance Display ItemKey where
  displayBuilder k = displayBuilder k.namespace <> " " <> displayBuilder k.name

-- | Deprecation metadata, merged from the @deprecated=@ attribute vocabulary
-- and @\<deprecate\>@ blocks. One item can sit in several deprecate blocks
-- (e.g. @vkCmdPipelineBarrier@ under both @deprecation-sync2@ and
-- @legacy-buffer-commands@), so every category is kept.
data DeprecationInfo = DeprecationInfo
  { supersededBy :: Maybe Text
  , categories :: [Text]
  -- ^ The @\<deprecate explanationlink=\>@ categories, discovery order.
  , since :: Maybe AvailAtom
  -- ^ The version\/extension whose deprecate block fired first.
  , marker :: Maybe Deprecation
  -- ^ The @deprecated=@ attribute, when that is the source.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Leftmost-Just-wins. `categories` maintains discovery order and is kept unique assuming
-- all members have unique lists.
-- Map.fromListWith combines new-then-old; walk order is preserved by
-- keeping the OLD entry's lead and appending the new categories.
--
-- XXX: Might want to use `OSet` but it doesn't provide NFData so I'd need to fork it. Could
-- vendor without too much difficulty but not worth it for small collections.
instance Semigroup DeprecationInfo where
  a <> b =
    DeprecationInfo
      { supersededBy = a.supersededBy <|> b.supersededBy
      , categories = a.categories <> filter (`notElem` a.categories) b.categories
      , since = a.since <|> b.since
      , marker = a.marker <|> b.marker
      }

instance Monoid DeprecationInfo where
  mempty = DeprecationInfo Nothing [] Nothing Nothing

-- | Combine @\<deprecate\>@-block info with a @deprecated=@ attribute
-- marker; the block's fields win, the marker rides along.
mergeDeprecation :: Maybe DeprecationInfo -> Maybe Deprecation -> Maybe DeprecationInfo
mergeDeprecation block marker = case (block, marker) of
  (Nothing, Nothing) -> Nothing
  (Just info, m) -> Just (info & #marker .~ m)
  (Nothing, Just m) -> Just (mempty & #marker ?~ m)

-- | A platform gate: the registry platform name and its C protect macro
-- (@VK_USE_PLATFORM_*@, or @VK_ENABLE_BETA_EXTENSIONS@ for provisional).
data PlatformGuard = PlatformGuard
  { platform :: PlatformName
  , protect :: Text
  }
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData, ToJSON)

-- | Platform gates for an item's origins. Guards apply only when EVERY
-- origin is a platformed extension — any origin from a feature or an
-- unplatformed extension means the item is reachable without a gate.
guardsFor
  :: (HasType Symbols cxt, HasType (Specialized Registry) cxt)
  => cxt -> [Origin] -> [PlatformGuard]
guardsFor cxt origins = case traverse originPlatform origins of
  Just ps@(_ : _) ->
    [ PlatformGuard{platform, protect}
    | platform <- ordNub ps
    , Just protect <- [Map.lookup platform platformProtect]
    ]
  _ -> []
 where
  symbols = getTyped @Symbols cxt
  platformProtect =
    Map.fromList
      [ (p.name, p.protect)
      | p <- toList (cxt ^. typed @(Specialized Registry) . #platforms)
      ]
  originPlatform o = case o.source of
    FromExtension{extension} -> platformOf =<< Map.lookup extension symbols.extensions
    FromFeature{} -> Nothing
  platformOf e = WithNS <$> e.platform

-- | An alias spelling attached to its canonical entity (alias inversion).
data AliasInfo (k :: Namespace) = AliasInfo
  { name :: WithNS k
  , availability :: Maybe AvailExpr
  -- ^ When this SPELLING is reachable ('Nothing': no surviving interface
  -- requires it).
  , origins :: [Origin]
  , deprecated :: Maybe Deprecation
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | One mandatory-device-feature row of a feature or extension: the
-- @\<feature name=… struct=…\/\>@ markers (comma names are any-of
-- alternatives within the struct).
data FeatureRequirement = FeatureRequirement
  { paths :: NonEmpty FeaturePath
  , condition :: Maybe AvailExpr
  -- ^ The enclosing require block's @depends=@, classified.
  , removedBy :: Maybe Text
  -- ^ Extension whose @\<remove\>@ waives this requirement
  -- (@VK_KHR_portability_subset@ and @robustBufferAccess@).
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- ── Classification and evaluation of @depends=@ expressions ─────────────
--
-- Classification turns 'DependsExpr' atoms into 'AvailAtom's using the
-- symbol tables (the atom classification phase 1 deliberately deferred).
-- Internal tier names never reach this: feature-level @depends=@ were
-- consumed by the tier merge. Evaluation is oracle-based over a
-- 'CapabilityEnv'; the two 'FeatureMode's implement the two questions
-- curation asks (reachable at MAX capability / guaranteed at MIN baseline).

data AvailError
  = -- | A @depends=@ name that is neither a (public) feature nor an
    -- extension.
    UnknownDependsName {name :: !Text}
  | -- | A @Struct::member@ atom naming no known struct member.
    UnknownFeaturePath {path :: !Text}
  | -- | A feature without a @number=@ cannot become a version atom.
    FeatureWithoutNumber {feature :: !Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display AvailError where
  displayBuilder =
    displayBuilder @Text . \case
      UnknownDependsName{name} ->
        "depends atom names no known feature or extension: " <> name
      UnknownFeaturePath{path} ->
        "depends atom names no known struct member: " <> path
      FeatureWithoutNumber{feature} ->
        "feature has no version number: " <> feature

-- | Canonicalize a feature path's struct component through the type alias
-- table (the registry spells paths with alias struct names in older
-- extensions, e.g. @VkPhysicalDeviceDynamicRenderingFeaturesKHR::…@), then
-- failUnlessEmpty it. Paths are STORED canonicalized so rows referring to the same
-- device-feature bit compare equal regardless of spelling.
canonicalFeaturePath :: Symbols -> Aliases -> FeaturePath -> Either AvailError FeaturePath
canonicalFeaturePath symbols aliases path
  | Set.member canonical symbols.featurePaths = Right canonical
  | otherwise = Left UnknownFeaturePath{path = display path}
 where
  canonical =
    FeaturePath
      { struct = canonicalize aliases.types path.struct
      , member = path.member
      }

classifyAtom :: Symbols -> Aliases -> DependsAtom -> Either AvailError AvailAtom
classifyAtom symbols aliases = \case
  DependsName name
    | Just f <- Map.lookup (WithNS name) symbols.features -> case f.number of
        Just n -> Right (AvailVersion CoreVersion{major = fst n.parsed, minor = snd n.parsed})
        Nothing -> Left FeatureWithoutNumber{feature = name}
    | Map.member (WithNS name) symbols.extensions -> Right (AvailExtension (WithNS name))
    | otherwise -> Left UnknownDependsName{name}
  DependsFeature path -> AvailFeature <$> canonicalFeaturePath symbols aliases path

-- | Classify every atom, accumulating all failures.
classifyDepends :: Symbols -> Aliases -> DependsExpr -> Either (NonEmpty AvailError) AvailExpr
classifyDepends symbols aliases = validationToEither . go
 where
  go :: DependsExpr -> Validation (NonEmpty AvailError) AvailExpr
  go = \case
    BAtom a ->
      eitherToValidation (first NE.singleton (BAtom <$> classifyAtom symbols aliases a))
    BNot e -> BNot <$> go e
    BAnd l r -> BAnd <$> go l <*> go r
    BOr l r -> BOr <$> go l <*> go r

-- | Deterministic normal form: same-operator chains flattened, operands
-- sorted by rendering, duplicates dropped. Preserves evaluation under any
-- oracle (AND\/OR are commutative, associative, idempotent); used so
-- availability expressions render stably in reports and goldens.
normalizeAvail :: AvailExpr -> AvailExpr
normalizeAvail = go
 where
  go e = case e of
    BAtom _ -> e
    BNot inner -> BNot (go inner)
    BAnd _ _ -> rebuild BAnd (operands isAnd e)
    BOr _ _ -> rebuild BOr (operands isOr e)

  -- Flatten a same-operator chain into normalized operands.
  operands :: (AvailExpr -> Bool) -> AvailExpr -> [AvailExpr]
  operands same = dedupeSorted . map go . flatten
   where
    flatten expr
      | same expr, BAnd l r <- expr = flatten l <> flatten r
      | same expr, BOr l r <- expr = flatten l <> flatten r
      | otherwise = [expr]

  isAnd = \case BAnd _ _ -> True; _ -> False
  isOr = \case BOr _ _ -> True; _ -> False

  dedupeSorted = map NE.head . NE.groupBy eq . sortOn (display @AvailExpr)
   where
    eq a b = display @AvailExpr a == display b

  rebuild op = \case
    [] -> error "normalizeAvail: empty operand chain (impossible)"
    [single] -> single
    x : rest -> foldl' op x rest

-- | The availability atom an origin's source contributes.
sourceAtom :: OriginSource -> AvailAtom
sourceAtom = \case
  FromFeature{version} -> AvailVersion version
  FromExtension{extension} -> AvailExtension extension

-- | Fold an item's origins into one availability condition: OR over
-- sources, each ANDed with its require-block condition. 'Nothing' when the
-- item has no origins (unreachable through any surviving interface).
availabilityOf :: [Origin] -> Maybe AvailExpr
availabilityOf origins = case map originExpr origins of
  [] -> Nothing
  e : es -> Just (normalizeAvail (foldl BOr e es))
 where
  originExpr o = case o.condition of
    Nothing -> BAtom (sourceAtom o.source)
    Just cond -> BAnd (BAtom (sourceAtom o.source)) cond

data FeatureMode
  = -- | Device-feature atoms count as satisfied (reachable-at-max).
    FeaturesAssumedTrue
  | -- | Device-feature atoms count as unsatisfied (guaranteed-at-min).
    FeaturesAssumedFalse
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data CapabilityEnv = CapabilityEnv
  { core :: !CoreVersion
  , extensions :: !(Set ExtensionName)
  , featureMode :: !FeatureMode
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

evalAvail :: CapabilityEnv -> AvailExpr -> Bool
evalAvail env = evalBoolExpr \case
  AvailVersion v -> v <= env.core
  AvailExtension name -> Set.member name env.extensions
  AvailFeature _ -> case env.featureMode of
    FeaturesAssumedTrue -> True
    FeaturesAssumedFalse -> False
