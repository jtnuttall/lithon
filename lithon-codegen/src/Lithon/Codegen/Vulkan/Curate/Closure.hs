{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StrictData #-}

-- | Dependency closure: from a profile's seeds (core versions + curated
-- extensions) to the full set of extensions and interface items the curated
-- binding must contain, with a provenance trace per inclusion.
--
-- Extension phase: seeds (profile list, plus the spellings of everything
-- promoted to an optional core version when the policy asks) are validated
-- against policy gates (bans, provisional, specialuse, platform,
-- deprecation), then extension @depends@ expressions are satisfied
-- transitively. OR branches prefer what is already satisfied, then core
-- versions, then the branch adding the fewest new extensions
-- (name-sorted tie-break — closure output is deterministic).
--
-- Item phase: an item is seeded when some origin's source is selected and
-- its block condition holds at max capability (device features assumed
-- present); reference edges (member\/param\/return types, parents,
-- structextends bases, bits blocks, object types, sType values, array-dim
-- constants) then close the set. Native values of an included enum block
-- ride along with it. Items whose only selected-source origins have
-- unsatisfiable conditions are recorded as 'UnsatisfiedNote's for the
-- report; legacy-excluded items skip core seeding but stay reachable via
-- references (reported as warnings).
module Lithon.Codegen.Vulkan.Curate.Closure (
  Closure (..),
  InclusionReason (..),
  InclusionTrace (..),
  UnsatisfiedNote (..),
  CurateError (..),
  computeClosure,
  renderReason,
  explainName,
) where

import Control.Monad.Error.Class (throwError)
import Control.Monad.Reader (ask)
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Vector qualified as V

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Curate.Profile (
  DependencyPolicy (..),
  LegacyCoreMode (..),
  LegacyCorePolicy (..),
  Profile (..),
  ProfileCore (..),
  ProfileExtension (..),
  ProfilePolicy (..),
 )
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (
  pattern BAnd,
  pattern BAtom,
  pattern BNot,
  pattern BOr,
 )
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AvailAtom (..),
  CapabilityEnv (..),
  CoreVersion,
  DeprecationInfo (..),
  FeatureMode (..),
  InterfaceItemNamespace (..),
  ItemKey (..),
  Origin (..),
  OriginSource (..),
  PlatformGuard (..),
  evalAvail,
 )
import Lithon.Codegen.Vulkan.Resolved.Commands (ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBasetype (..),
  ResolvedBitmask (..),
  ResolvedDefine (..),
  ResolvedDim (..),
  ResolvedExternal (..),
  ResolvedFuncpointer (..),
  ResolvedHandle (..),
  ResolvedMember (..),
  ResolvedParam (..),
  ResolvedStruct (..),
  ResolvedTypeRef (..),
  TypeRefKind (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (
  Constant (..),
  ResolvedEnumBlock (..),
  ResolvedEnumItem (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Registry (
  ExtensionStatus (..),
  PromotionTarget (..),
  ResolvedExtension (..),
  ResolvedFeature (..),
  ResolvedRegistry (..),
  deprecationOf,
 )

data InclusionReason
  = -- | Listed in the profile.
    SeedProfile {rationale :: Maybe Text}
  | -- | Auto-selected spelling of something promoted to an optional core.
    SeedPromoted {version :: CoreVersion}
  | -- | Needed by another selected extension's depends expression.
    DependencyOf {dependent :: ExtensionName}
  | -- | Listed in a require block of a selected feature\/extension.
    InterfaceOf {source :: OriginSource}
  | -- | Structurally referenced by an included item.
    ReferencedBy {referrer :: ItemKey}
  | -- | Native value of an included enum block.
    NativeOf {block :: TypeName}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | Why something is in the closure; the head is the discovery reason.
newtype InclusionTrace = InclusionTrace
  { reasons :: NonEmpty InclusionReason
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | An item left out because every selected-source origin carried an
-- unsatisfiable condition — report fodder, not an error.
data UnsatisfiedNote = UnsatisfiedNote
  { key :: ItemKey
  , condition :: Text
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

data Closure = Closure
  { coreVersions :: Set CoreVersion
  , selectedExtensions :: Map ExtensionName InclusionTrace
  , items :: Map ItemKey InclusionTrace
  , unsatisfied :: [UnsatisfiedNote]
  , legacyExcluded :: [ItemKey]
  -- ^ Dropped by the legacy-core policy (not version gating).
  , warnings :: [Text]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

data CurateError
  = UnknownExtensionInProfile {name :: ExtensionName}
  | UnknownPlatformInProfile {platform :: PlatformName}
  | UnknownCoreVersion {version :: Text}
  | MaxBelowBaseline
  | BannedButRequired {banned :: ExtensionName, dependent :: Maybe ExtensionName}
  | ProvisionalNotAllowed {name :: ExtensionName}
  | SpecialUseDenied {name :: ExtensionName, uses :: [Text]}
  | PlatformNotSelected {name :: ExtensionName, platform :: PlatformName}
  | DeprecatedExtension {name :: ExtensionName, replacement :: Maybe ExtensionName}
  | StrictDependencyMissing {name :: ExtensionName, neededBy :: ExtensionName}
  | UnsatisfiableDepends {name :: ExtensionName, rendered :: Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

instance Display CurateError where
  displayBuilder = \case
    UnknownExtensionInProfile{name} -> "profile names unknown extension: " <> from name
    UnknownPlatformInProfile{platform} -> "profile names unknown platform: " <> from platform
    UnknownCoreVersion{version} -> "no such core version: " <> from version
    MaxBelowBaseline -> "core.max is below core.baseline"
    BannedButRequired{banned, dependent} ->
      "banned extension "
        <> from banned
        <> maybe " is seeded by the profile" ((" is required by " <>) . from) dependent
    ProvisionalNotAllowed{name} ->
      "provisional extension " <> from name <> " is not on the allowProvisional list"
    SpecialUseDenied{name, uses} ->
      from name <> " has denied specialuse: " <> from (T.intercalate ", " uses)
    PlatformNotSelected{name, platform} ->
      from name <> " needs platform " <> from platform <> ", which the profile does not select"
    DeprecatedExtension{name, replacement} ->
      from name <> " is deprecated" <> maybe "" ((" by " <>) . from) replacement
    StrictDependencyMissing{name, neededBy} ->
      from neededBy <> " needs " <> from name <> ", which strict mode requires listing explicitly"
    UnsatisfiableDepends{name, rendered} ->
      from name <> " has unsatisfiable depends: " <> from rendered

data ClosureEnv = ClosureEnv
  { profile :: Profile
  , registry :: ResolvedRegistry
  }

computeClosure
  :: (MonadError (Errors CurateError) m, HasType Profile cxt, HasType ResolvedRegistry cxt)
  => cxt -> m Closure
computeClosure cxt = flip runReaderT (ClosureEnv profile reg) do
  coreVersions <- coreSelection
  (selectedExtensions, extWarnings) <- extensionSelection
  let selection =
        SelectionEnv
          { policy = profile.policy
          , capability =
              CapabilityEnv
                { core = profile.core.maxCore
                , extensions = Map.keysSet selectedExtensions
                , featureMode = FeaturesAssumedTrue
                }
          , coreVersions
          , selectedExtensions
          }
      outcome = seedItems selection reg
      (items, legacyWarnings) = closeItems selection reg outcome.seeded
  pure
    Closure
      { coreVersions
      , selectedExtensions
      , items
      , unsatisfied = outcome.unsatisfied
      , legacyExcluded = outcome.legacyDropped
      , warnings = extWarnings <> legacyWarnings
      }
 where
  profile = getTyped @Profile cxt
  reg = getTyped @ResolvedRegistry cxt

-- ── item selection ────────────────────────────────────────────────────

-- | What the item phase evaluates origins against: the selected cores and
-- extensions, the max-capability oracle, and the curation policy.
data SelectionEnv = SelectionEnv
  { policy :: ProfilePolicy
  , capability :: CapabilityEnv
  , coreVersions :: Set CoreVersion
  , selectedExtensions :: Map ExtensionName InclusionTrace
  }

sourceSelected :: SelectionEnv -> OriginSource -> Bool
sourceSelected env = \case
  FromFeature{version} -> Set.member version env.coreVersions
  FromExtension{extension} -> Map.member extension env.selectedExtensions

-- | Selected source AND satisfiable require-block condition at max
-- capability (device features assumed present).
originSatisfied :: SelectionEnv -> Origin -> Bool
originSatisfied env o =
  sourceSelected env o.source && maybe True (evalAvail env.capability) o.condition

-- | Does the legacy-core policy exclude an item with this deprecation?
legacyExcludedBy :: ProfilePolicy -> Maybe DeprecationInfo -> Bool
legacyExcludedBy policy deprecation = case (policy.legacyCore.mode, deprecation) of
  (LegacyExclude, Just info)
    | not (null info.categories) ->
        null policy.legacyCore.categories
          || any (`elem` policy.legacyCore.categories) info.categories
  _ -> False

-- | Legacy-excluded items may not seed from CORE origins; extension origins
-- still count (the extension was asked for explicitly).
allowedOrigins :: ProfilePolicy -> Maybe DeprecationInfo -> [Origin] -> [Origin]
allowedOrigins policy deprecation origins
  | legacyExcludedBy policy deprecation = [o | o <- origins, isExtensionOrigin o]
  | otherwise = origins
 where
  isExtensionOrigin o = case o.source of
    FromExtension{} -> True
    FromFeature{} -> False

-- | The seed pass's accumulated verdicts.
data SeedOutcome = SeedOutcome
  { seeded :: Map ItemKey InclusionTrace
  , unsatisfied :: [UnsatisfiedNote]
  , legacyDropped :: [ItemKey]
  }
  deriving stock (Generic)

instance Semigroup SeedOutcome where
  a <> b =
    SeedOutcome
      { seeded = a.seeded <> b.seeded
      , unsatisfied = a.unsatisfied <> b.unsatisfied
      , legacyDropped = a.legacyDropped <> b.legacyDropped
      }

instance Monoid SeedOutcome where
  mempty = SeedOutcome{seeded = Map.empty, unsatisfied = [], legacyDropped = []}

-- | Every item that could seed, with its deprecation and origins.
seedCandidates :: ResolvedRegistry -> [(ItemKey, Maybe DeprecationInfo, [Origin])]
seedCandidates reg =
  concat
    [ [(ItemKey NsType (forgetNamespace s.name), s.deprecation, s.origins) | s <- Map.elems reg.structs]
    , [(ItemKey NsType (forgetNamespace h.name), h.deprecation, h.origins) | h <- Map.elems reg.handles]
    , [(ItemKey NsType (forgetNamespace b.name), b.deprecation, b.origins) | b <- Map.elems reg.bitmasks]
    , [(ItemKey NsType (forgetNamespace f.name), Nothing, f.origins) | f <- Map.elems reg.funcpointers]
    , [(ItemKey NsType (forgetNamespace b.name), Nothing, b.origins) | b <- Map.elems reg.basetypes]
    , [(ItemKey NsType (forgetNamespace d.name), d.deprecation, d.origins) | d <- Map.elems reg.defines]
    , [(ItemKey NsType (forgetNamespace x.name), Nothing, x.origins) | x <- Map.elems reg.externals]
    , [(ItemKey NsType (forgetNamespace e.name), Nothing, e.origins) | e <- Map.elems reg.enums]
    , [ (ItemKey NsCommand (forgetNamespace c.name), c.deprecation, c.origins) | c <- Map.elems reg.commands
      ]
    , [ (ItemKey NsEnumValue (forgetNamespace v.name), v.deprecation, v.origins)
      | b <- Map.elems reg.enums
      , v <- V.toList b.items
      ]
    , [ (ItemKey NsEnumValue (forgetNamespace c.name), c.deprecation, c.origins)
      | c <- Map.elems reg.constants
      ]
    ]

-- | Seed pass over every table. An item some selected source lists but that
-- did not seed is either policy-excluded (legacy) or genuinely version-gated
-- (unsatisfied condition) — reported separately.
seedItems :: SelectionEnv -> ResolvedRegistry -> SeedOutcome
seedItems env reg = foldMap seed (seedCandidates reg)
 where
  seed (key, deprecation, origins) =
    case filter (originSatisfied env) (allowedOrigins env.policy deprecation origins) of
      o : _ ->
        mempty
          { seeded =
              Map.singleton key (InclusionTrace (NE.singleton InterfaceOf{source = o.source}))
          }
      []
        | legacyExcludedBy env.policy deprecation
        , any (originSatisfied env) origins ->
            mempty{legacyDropped = [key]}
        | (o : _) <- [o | o <- origins, sourceSelected env o.source] ->
            mempty
              & #unsatisfied
              .~ [UnsatisfiedNote{key, condition = maybe "" display o.condition}]
        | otherwise -> mempty

-- | Reference fixpoint: close the seeded set over structural reference
-- edges, recording a warning for each legacy-excluded item retained only
-- via references.
closeItems
  :: SelectionEnv
  -> ResolvedRegistry
  -> Map ItemKey InclusionTrace
  -> (Map ItemKey InclusionTrace, [Text])
closeItems env reg initial = loop initial (Map.keys initial) []
 where
  loop acc [] legacyWarnings = (acc, legacyWarnings)
  loop acc (key : rest) legacyWarnings =
    let refs = refsOf reg key
        (acc', added, newWarnings) = foldr (absorb key) (acc, [], legacyWarnings) refs
     in loop acc' (added <> rest) newWarnings
  absorb referrer key (acc, added, ws)
    | Map.member key acc = (acc, added, ws)
    | otherwise =
        ( Map.insert key (InclusionTrace (NE.singleton reason)) acc
        , key : added
        , ws <> legacyNote
        )
   where
    reason
      | key.namespace == NsEnumValue
      , referrer.namespace == NsType
      , Map.member (WithNS referrer.name) reg.enums =
          NativeOf{block = WithNS referrer.name}
      | otherwise = ReferencedBy{referrer}
    legacyNote = case deprecationOf reg key of
      Just info
        | legacyExcludedBy env.policy (Just info) ->
            ["legacy item retained via references: " <> key.name]
      _ -> []

-- | Structural reference edges out of one item (member\/param\/return
-- types, parents, structextends bases, bits blocks, array-dim constants,
-- object types, sType values, native enum values).
refsOf :: ResolvedRegistry -> ItemKey -> [ItemKey]
refsOf reg key = case key.namespace of
  NsCommand -> maybe [] commandRefs (Map.lookup (WithNS key.name) reg.commands)
  NsEnumValue -> []
  NsType ->
    concat
      [ maybe [] structRefs (Map.lookup (WithNS key.name) reg.structs)
      , maybe [] handleRefs (Map.lookup (WithNS key.name) reg.handles)
      , maybe [] bitmaskRefs (Map.lookup (WithNS key.name) reg.bitmasks)
      , maybe [] funcpointerRefs (Map.lookup (WithNS key.name) reg.funcpointers)
      , maybe [] enumBlockRefs (Map.lookup (WithNS key.name) reg.enums)
      ]
 where
  typeKey = ItemKey NsType . forgetNamespace
  valueKey = ItemKey NsEnumValue . forgetNamespace
  structRefs s =
    concatMap memberRefs (V.toList s.members) <> (typeKey <$> s.extends)
  memberRefs m =
    concat
      [ [typeKey m.typeRef.name | m.typeRef.kind /= RefVoid]
      , [valueKey n | RDimConst{name = n} <- m.arrayDims]
      , [valueKey v | v <- m.values]
      ]
  handleRefs h =
    [typeKey p | Just p <- [h.parent]]
      <> [valueKey h.objectTypeValue]
  bitmaskRefs b =
    [typeKey blockName | Just blockName <- [b.bitsBlock]]
  funcpointerRefs f =
    [typeKey f.returnType.name | f.returnType.kind /= RefVoid]
      <> concatMap paramRefs (V.toList f.params)
  commandRefs c =
    [typeKey c.returnType.name | c.returnType.kind /= RefVoid]
      ++ concatMap paramRefs (V.toList c.params)
  paramRefs p =
    concat
      [ [typeKey p.typeRef.name | p.typeRef.kind /= RefVoid]
      , [valueKey n | RDimConst{name = n} <- p.arrayDims]
      , [typeKey v | v <- p.validStructs]
      ]
  enumBlockRefs b =
    [valueKey v.name | v <- V.toList b.items, null v.origins]

-- ── core versions ───────────────────────────────────────────────────

-- |
-- A device at the baseline has every earlier core version too, so the
-- selected set is every feature version up to the optional maximum;
-- baseline matters for guaranteed-vs-optional reporting, not inclusion.
coreSelection
  :: (MonadReader ClosureEnv m, MonadError (Errors CurateError) m) => m (Set CoreVersion)
coreSelection = do
  ClosureEnv{..} <- ask

  let featureVersions = Set.fromList . V.toList $ fmap (.version) registry.features
      assertKnownCore v =
        unless (Set.member v featureVersions)
          $ throwError
          $ errors1 UnknownCoreVersion{version = display v}

  assertKnownCore profile.core.baseline
  assertKnownCore profile.core.maxCore

  unless (profile.core.maxCore >= profile.core.baseline) $ throwError (errors1 MaxBelowBaseline)

  pure $ Set.filter (<= profile.core.maxCore) featureVersions

extensionSelection
  :: (MonadReader ClosureEnv m, MonadError (Errors CurateError) m)
  => m (Map ExtensionName InclusionTrace, [Text])
extensionSelection = do
  ClosureEnv{..} <- ask

  let
    policy = profile.policy
    platformSet = Set.fromList profile.platforms
    knownPlatforms =
      Set.fromList (mapMaybe (fmap (.platform) . (.platformGuard)) (toList registry.extensions))
    platformErrs =
      [ UnknownPlatformInProfile{platform = p}
      | p <- profile.platforms
      , not (Set.member p knownPlatforms)
      ]
    (seedErrs, seeds) =
      let (errLists, seedLists) = unzip (map validateSeed seedList)
       in (concat errLists, concat seedLists)
    seedList =
      [ (pe.name, SeedProfile{rationale = pe.rationale})
      | pe <- profile.extensions
      ]
        <> promotedSeeds
    promotedSeeds
      | policy.includePromotedToOptionalCores =
          [ (e.name, SeedPromoted{version = v})
          | e <- Map.elems registry.extensions
          , StatusPromoted (PromotedToVersion v) <- [e.status]
          , profile.core.baseline < v
          , v <= profile.core.maxCore
          ]
      | otherwise = []
    validateSeed (name, reason)
      | not (Map.member name registry.extensions) = ([UnknownExtensionInProfile{name}], [])
      | name `elem` profile.exclude = ([BannedButRequired{banned = name, dependent = Nothing}], [])
      | otherwise = ([], [(name, reason)])

    -- Worklist over (extension, reason); gates checked at selection time.
    go selected warnings = \case
      [] -> pure (selected, warnings)
      (name, reason) : rest
        | Map.member name selected ->
            go (Map.adjust (appendReason reason) name selected) warnings rest
        | otherwise -> case Map.lookup name registry.extensions of
            Nothing -> throwError $ errors1 UnknownExtensionInProfile{name}
            Just e -> case gate e reason of
              Left err -> throwError $ errors1 err
              Right gateWarnings -> case additionsFor e of
                Left err -> throwError $ errors1 err
                Right adds -> case policy.dependencies of
                  DepsStrict
                    | not (null adds) ->
                        throwError
                          $ from
                          $ NE.fromList
                            [ StrictDependencyMissing{name = a, neededBy = e.name}
                            | a <- adds
                            ]
                  _ ->
                    go
                      (Map.insert name (InclusionTrace (NE.singleton reason)) selected)
                      (warnings <> gateWarnings)
                      (rest <> [(a, DependencyOf{dependent = e.name}) | a <- adds])
       where
        additionsFor e = case e.depends of
          Nothing -> Right []
          Just expr -> satisfy selected expr e.name
        gate e reason' = do
          _ <- checkBanned reason'
          _ <- checkProvisional
          _ <- checkSpecialUse
          _ <- checkPlatform
          checkDeprecated
         where
          checkBanned r
            | e.name `elem` profile.exclude =
                Left BannedButRequired{banned = e.name, dependent = dependentOf r}
            | otherwise = Right []
          dependentOf = \case
            DependencyOf{dependent} -> Just dependent
            _ -> Nothing
          checkProvisional
            | e.provisional && e.name `notElem` policy.allowProvisional =
                Left ProvisionalNotAllowed{name = e.name}
            | otherwise = Right []
          checkSpecialUse =
            case filter (`elem` policy.denySpecialUse) e.specialUse of
              [] -> Right []
              denied -> Left SpecialUseDenied{name = e.name, uses = denied}
          checkPlatform = case e.platformGuard of
            Just g
              | not (Set.member g.platform platformSet) ->
                  Left PlatformNotSelected{name = e.name, platform = g.platform}
            _ -> Right []
          checkDeprecated = case e.status of
            StatusDeprecated replacement
              | policy.allowDeprecated ->
                  Right
                    [ display e.name
                        <> " is deprecated"
                        <> maybe "" ((" by " <>) . display) replacement
                        <> " but selected anyway"
                    ]
              | otherwise -> Left DeprecatedExtension{name = e.name, replacement}
            StatusObsoleted replacement
              | policy.allowDeprecated ->
                  Right
                    [ display e.name
                        <> " is obsolete"
                        <> maybe "" ((" per " <>) . display) replacement
                        <> " but selected anyway"
                    ]
              | otherwise -> Left DeprecatedExtension{name = e.name, replacement}
            _ -> Right []

    appendReason r (InclusionTrace rs) = InclusionTrace (rs <> NE.singleton r)

    -- Extensions to add so @expr@ holds; Left = unsatisfiable even with
    -- additions.
    satisfy selected expr owner = go' expr
     where
      go' = \case
        BAtom (AvailVersion v)
          | v <= profile.core.maxCore -> Right []
          | otherwise ->
              Left UnsatisfiableDepends{name = owner, rendered = display expr}
        BAtom (AvailFeature _) -> Right []
        BAtom (AvailExtension x)
          | Map.member x selected -> Right []
          | otherwise -> Right [x]
        BAnd l r -> (<>) <$> go' l <*> go' r
        BOr l r -> case (go' l, go' r) of
          (Right [], _) -> Right []
          (_, Right []) -> Right []
          (Right ls, Right rs) -> Right (pickBranch ls rs)
          (Right ls, Left _) -> Right ls
          (Left _, Right rs) -> Right rs
          (Left e, Left _) -> Left e
        BNot _ ->
          Left UnsatisfiableDepends{name = owner, rendered = display expr}
      pickBranch ls rs
        | length ls < length rs = ls
        | length rs < length ls = rs
        | otherwise = min (sort ls) (sort rs)

  liftValidation (failUnlessEmpty (platformErrs <> seedErrs) ())
  go Map.empty [] seeds

-- | One inclusion reason, rendered for the report and @--explain@.
renderReason :: InclusionReason -> Text
renderReason = \case
  SeedProfile{rationale} -> "profile" <> maybe "" (\r -> " (" <> r <> ")") rationale
  SeedPromoted{version} -> "promoted to optional core " <> display version
  DependencyOf{dependent} -> "required by " <> display dependent
  InterfaceOf{source} -> "interface of " <> sourceName source
  ReferencedBy{referrer} -> "referenced by " <> display referrer
  NativeOf{block} -> "native value of " <> display block
 where
  sourceName = \case
    FromFeature{feature} -> display feature
    FromExtension{extension} -> display extension

-- | Provenance chain for one name (extension or item), for @--explain@.
explainName :: Closure -> Text -> Maybe Text
explainName closure query =
  extensionExplain <|> itemExplain
 where
  extensionExplain = do
    trace <- Map.lookup (WithNS query) closure.selectedExtensions
    pure (query <> ": " <> T.intercalate "; " (map renderReason (NE.toList trace.reasons)))
  itemExplain =
    case mapMaybe hit [NsType, NsCommand, NsEnumValue] of
      [] -> Nothing
      hits ->
        Just
          $ T.intercalate
            "\n"
            [ display key <> ": " <> T.intercalate "; " (chain 0 trace)
            | (key, trace) <- hits
            ]
  hit ns =
    let key = ItemKey{namespace = ns, name = query}
     in (key,) <$> Map.lookup key closure.items
  -- Follow ReferencedBy links a few levels for a readable chain.
  chain :: Int -> InclusionTrace -> [Text]
  chain depth trace =
    concatMap (\reason -> renderReason reason : deeper reason) (NE.toList trace.reasons)
   where
    deeper = \case
      ReferencedBy{referrer}
        | depth < 5
        , Just parent <- Map.lookup referrer closure.items ->
            map ("… " <>) (chain (depth + 1) parent)
      _ -> []
