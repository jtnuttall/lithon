{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Consistency checks over the distilled ABI ('Lithon.Codegen.Bindgen.Abi'),
-- run on every generation before anything is written.
--
-- The assertion TU guards each member's @offsetof@ on that member's
-- availability, but a struct's @sizeof@\/@_Alignof@ asserts are guarded
-- only by a growth gate in the availability annotations ('AbiGrowth'). A
-- member the library appended in a later release therefore needs both:
-- its own gate (from the annotations or its documented availability, like
-- SDL's \"(added in X.Y.Z)\" note) /and/ a recorded pre-growth layout, or
-- the baked @sizeof@ is asserted unconditionally and the package stops
-- compiling on every release older than the one it was generated from
-- (SDL 3.4.16 appending @pen_state@ to @SDL_PenProximityEvent@ was the
-- precedent). 'validateAbi' finds every such struct and says exactly what
-- to record; the annotations stay the source of truth for the pre-growth
-- layout, because the new headers cannot prove the old alignment.
--
-- Enum constants have the mirror-image gap: their value asserts are
-- guarded only by a gate in the annotations (enumerators carry no
-- availability upstream), so a regeneration from newer headers bakes a
-- constant the library added, or renumbered, unguarded unless the
-- annotations already know about it (SDL 3.4.18 adding
-- @SDL_GAMEPAD_TYPE_STEAM@ ahead of @SDL_GAMEPAD_TYPE_COUNT@ was the
-- precedent). The new headers cannot say which constants those are; the
-- previous render can ("Lithon.Codegen.Bindgen.Abi.Previous"), and
-- 'validateEnumHistory' compares against it.
module Lithon.Codegen.Bindgen.Abi.Validate (
  LibraryRef (..),
  AbiProblem (..),
  AbiProblemKind (..),
  GrowthStep (..),
  RenderDelta (..),
  growthSteps,
  validateAbi,
  validateEnumHistory,
  roundUp,
) where

import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Bindgen.Abi (
  AbiDecl (..),
  AbiEnumConst (..),
  AbiField (..),
  AbiGrowth (..),
  AbiKind (..),
  AbiLayoutBefore (..),
 )
import Lithon.Codegen.Bindgen.Abi.Previous (PreviousRender (..))
import Lithon.Codegen.Bindgen.Target (VersionScheme (..))
import Lithon.Codegen.Bindgen.Version (Version, fitArity, renderVersion)

-- | One size-changing append: the trailing members first gated at
-- @since@, and the @sizeof@ the struct must have had just before them.
data GrowthStep = GrowthStep
  { since :: Version
  , members :: NonEmpty AbiField
  -- ^ Declaration order.
  , preSizeof :: Int
  -- ^ The first member's offset rounded up to the baked alignment.
  , postSizeof :: Int
  -- ^ The next step's 'preSizeof', or the baked @sizeof@ for the last.
  }
  deriving stock (Eq, Generic, Show)

data AbiProblemKind
  = -- | Appended members are gated but no growth gate is recorded: the
    -- baked @sizeof@ would be asserted on every release of the library,
    -- the older ones included.
    GrowthUnrecorded GrowthStep
  | -- | A growth gate is recorded but disagrees with the baked offsets;
    -- the text says how.
    GrowthMismatch AbiGrowth GrowthStep Text
  | -- | The struct grew at more than one version; the annotations' single
    -- @sizeof-since@\/@before@ cannot express that.
    GrowthMultiStep (NonEmpty GrowthStep)
  | -- | A growth gate is recorded but no trailing member is gated above
    -- the struct's floor: the appended members' offsets would be asserted
    -- on every release of the library, the older ones included.
    GrowthUnexplained AbiGrowth
  | -- | The gated trailing members are not in non-decreasing version
    -- order, which no append sequence can produce.
    TrailingGatesNotMonotone [AbiField]
  | -- | A constant the previous render did not assert, with no floor
    -- above that render's version: its value assert would be compiled
    -- against every older release, where the constant does not exist.
    EnumConstUnrecorded RenderDelta AbiEnumConst
  | -- | A constant the previous render asserted at another value (carried
    -- here), with no value gate above that render's version: the new
    -- value would be asserted on releases that still have the old one.
    EnumValueGateStale RenderDelta Integer AbiEnumConst
  deriving stock (Eq, Generic, Show)

-- | The two renders an enum-history problem lies between.
data RenderDelta = RenderDelta
  { previousPath :: FilePath
  , previousVersion :: Text
  -- ^ As the previous render's @LITHON_ABI_HELP@ line spells it.
  , suggested :: Version
  -- ^ This render's library version at the scheme's arity: the floor to
  -- record, unless a release in between is known to have the change.
  }
  deriving stock (Eq, Generic, Show)

-- | The library a layout was distilled from, as problem reports name it.
data LibraryRef = LibraryRef
  { label :: Text
  -- ^ The word before a version (@SDL@).
  , version :: Text
  -- ^ The version the layout was distilled from.
  , registry :: FilePath
  -- ^ The @versions.json@ to record fixes in, as displayed.
  }
  deriving stock (Eq, Generic, Show)

data AbiProblem = AbiProblem
  { library :: LibraryRef
  , decl :: AbiDecl
  , outer :: Version
  -- ^ The struct's own floor (its gate, or the baseline).
  , kind :: AbiProblemKind
  }
  deriving stock (Eq, Generic, Show)

roundUp :: Int -> Int -> Int
roundUp n align
  | align <= 0 = n
  | otherwise = ((n + align - 1) `div` align) * align

-- | The size-changing appends implied by a struct's gated trailing
-- members (empty for unions, enums, and structs whose gated members all
-- fit inside the pre-existing layout), given the target's baseline. 'Left'
-- when the trailing gates are not monotone.
growthSteps :: Version -> AbiDecl -> Either AbiProblemKind [GrowthStep]
growthSteps baseline d
  | d.kind /= AbiStruct = Right []
  | not monotone = Left (TrailingGatesNotMonotone run)
  | otherwise =
      Right
        [ GrowthStep{since, members, preSizeof, postSizeof}
        | ((since, members), preSizeof, postSizeof) <- zip3 groups pres posts
        , preSizeof < postSizeof
        ]
 where
  outer = fromMaybe baseline d.since
  gateOf f = case f.since of
    Just v | v > outer -> Just v
    _atOrBelowOuter -> Nothing
  -- The maximal trailing run of gated members, in declaration order —
  -- the same order the renderer emits their guard blocks in.
  run = reverse (takeWhile (isJust . gateOf) (reverse d.fields))
  gated = [(v, f) | f <- run, Just v <- [gateOf f]]
  gates = map fst gated
  monotone = and (zipWith (<=) gates (drop 1 gates))
  groups = [(fst (NE.head g), fmap snd g) | g <- NE.groupBy ((==) `on` fst) gated]
  pres = [roundUp (NE.head members).byteOffset d.alignment | (_, members) <- groups]
  posts = drop 1 pres <> [d.sizeof]

-- | Every struct whose growth story is missing or inconsistent, given the
-- target's baseline and, for the messages, the generation library.
validateAbi :: Version -> LibraryRef -> [AbiDecl] -> Validation (Errors AbiProblem) ()
validateAbi baseline library decls = failUnlessEmpty (mapMaybe problemOf decls) ()
 where
  problemOf d = do
    kind <- kindOf d
    pure AbiProblem{library, decl = d, outer = fromMaybe baseline d.since, kind}

  kindOf d = case growthSteps baseline d of
    Left problem -> Just problem
    Right [] -> GrowthUnexplained <$> d.growth
    Right [step] -> case d.growth of
      Nothing -> Just (GrowthUnrecorded step)
      Just g -> GrowthMismatch g step <$> mismatch d g step
    Right (step : more) -> Just (GrowthMultiStep (step :| more))

  mismatch d g step
    | g.since /= step.since =
        Just
          ( "sizeof-since gates sizeof at "
              <> renderVersion g.since
              <> " but the appended members are gated at "
              <> renderVersion step.since
          )
    | g.before.alignment > d.alignment =
        Just
          ( "before.alignment "
              <> show g.before.alignment
              <> " exceeds the baked alignment "
              <> show d.alignment
              <> "; appending members cannot lower a struct's alignment"
          )
    | g.before.alignment == d.alignment
    , g.before.sizeof /= step.preSizeof =
        Just
          ( "before.sizeof "
              <> show g.before.sizeof
              <> " contradicts the first appended offset "
              <> show start
              <> " (rounded up to alignment "
              <> show d.alignment
              <> " gives "
              <> show step.preSizeof
              <> ")"
          )
    | g.before.alignment < d.alignment
    , g.before.sizeof > start || g.before.sizeof `mod` g.before.alignment /= 0 =
        Just
          ( "before.sizeof "
              <> show g.before.sizeof
              <> " must be a multiple of before.alignment "
              <> show g.before.alignment
              <> " and at most the first appended offset "
              <> show start
          )
    | otherwise = Nothing
   where
    start = (NE.head step.members).byteOffset

-- | Every enum constant this render bakes that the previous render did
-- not assert, or asserted at another value, and that the annotations do
-- not gate above the previous render's version. Enums the previous
-- render did not assert are skipped (a newly bound enum is gated by its
-- own @\\since@), as is the whole check when the headers are not newer
-- than the previous render: the same headers cannot add or renumber a
-- constant, while a changed binding surface can, and needs no floor.
validateEnumHistory
  :: VersionScheme
  -> Version
  -- ^ This render's library version, parsed loosely.
  -> LibraryRef
  -> PreviousRender
  -> [AbiDecl]
  -> Validation (Errors AbiProblem) ()
validateEnumHistory scheme libraryVersion library previous decls
  | previousVersion >= current = Success ()
  | otherwise = failUnlessEmpty (concatMap problemsOf decls) ()
 where
  current = fitArity scheme.arity libraryVersion
  previousVersion = fitArity scheme.arity previous.version
  delta =
    RenderDelta
      { previousPath = previous.path
      , previousVersion = previous.versionText
      , suggested = current
      }
  gatedAbove c = maybe False (> previousVersion) c.since
  problemsOf d = case Map.lookup d.cTypeName previous.enums of
    Just old
      | d.kind == AbiEnum ->
          [ AbiProblem{library, decl = d, outer = fromMaybe scheme.baseline d.since, kind}
          | c <- d.constants
          , not (gatedAbove c)
          , Just kind <- [kindOf old c]
          ]
    _unassertedBefore -> []
  kindOf old c = case Map.lookup c.name old of
    Nothing -> Just (EnumConstUnrecorded delta c)
    Just was
      | was /= c.value -> Just (EnumValueGateStale delta was c)
      | otherwise -> Nothing

instance Display AbiProblem where
  displayBuilder = from . renderProblem

renderProblem :: AbiProblem -> Text
renderProblem p = T.intercalate "\n" (heading : "" : map indent body)
 where
  d = p.decl
  indent l = if T.null l then l else "  " <> l
  heading = d.cTypeName <> " (" <> toText d.headerName <> "): " <> headline
  (headline, body) = case p.kind of
    GrowthUnrecorded step ->
      ( "grew at " <> renderVersion step.since <> ", but the annotations record no growth gate."
      , gatedMembers (toList step.members)
          <> [ ""
             , baked
             , "Implied pre-"
                 <> renderVersion step.since
                 <> " layout: sizeof "
                 <> show step.preSizeof
                 <> " (offset "
                 <> show (NE.head step.members).byteOffset
                 <> " rounded up to alignment "
                 <> show d.alignment
                 <> "), alignment "
                 <> show d.alignment
                 <> ";"
             , "this assumes the appended members did not raise the struct's alignment — confirm"
             , "against the previous release's header before recording it."
             , ""
             , "Without the gate the unguarded sizeof/alignment asserts fail to compile on every"
             , p.library.label
                 <> " < "
                 <> renderVersion step.since
                 <> ". Add under \"structs\" in "
                 <> toText p.library.registry
                 <> ":"
             , ""
             ]
          <> map ("  " <>) (snippet step)
      )
    GrowthMismatch g step why ->
      ( "the annotated growth gate disagrees with the baked offsets: " <> why <> "."
      , gatedMembers (toList step.members)
          <> [ ""
             , baked
             , "Annotated: sizeof-since "
                 <> renderVersion g.since
                 <> ", before sizeof "
                 <> show g.before.sizeof
                 <> ", alignment "
                 <> show g.before.alignment
                 <> "."
             , "Offsets imply: sizeof-since "
                 <> renderVersion step.since
                 <> ", before sizeof "
                 <> show step.preSizeof
                 <> " (alignment assumed unchanged)."
             , "Fix the "
                 <> bare
                 <> " entry in "
                 <> toText p.library.registry
                 <> " against the release headers."
             ]
      )
    GrowthMultiStep steps ->
      ( "grew at "
          <> T.intercalate " and " (map (renderVersion . (.since)) (toList steps))
          <> "; the annotations can only record one growth gate."
      , concat
          [ ("At " <> renderVersion s.since <> ": sizeof " <> show s.preSizeof <> " -> " <> show s.postSizeof)
              : gatedMembers (toList s.members)
          | s <- toList steps
          ]
          <> [ ""
             , baked
             , "A single sizeof-since/before cannot express two steps; extend the annotations' growth"
             , "vocabulary (structs.<name>.growth as a list) and the emitter's #elif chain first."
             ]
      )
    GrowthUnexplained g ->
      ( "the annotations record growth at "
          <> renderVersion g.since
          <> " but no trailing member is gated above the struct's floor ("
          <> renderVersion p.outer
          <> ")."
      ,
        [ baked
        , "Annotated: before sizeof "
            <> show g.before.sizeof
            <> ", alignment "
            <> show g.before.alignment
            <> "."
        , "Either gate the appended members (structs." <> bare <> ".members) so their offsetof asserts"
        , "are guarded too, or drop the sizeof-since/before pair if the struct never grew."
        ]
      )
    TrailingGatesNotMonotone fs ->
      ( "its gated trailing members are not in non-decreasing version order."
      , gatedMembers fs
          <> [ ""
             , "No sequence of appends produces this; check the member gates in"
             , toText p.library.registry <> " (structs." <> bare <> ".members)."
             ]
      )
    EnumConstUnrecorded delta c ->
      ( c.name <> " is new since the previous render, but the annotations record no floor above it."
      , renders delta
          <> ["Baked value " <> show c.value <> "."]
          <> annotated c
          <> [ ""
             , "Without a floor the value assert is compiled against every "
                 <> p.library.label
                 <> ", and "
                 <> previousLibrary delta
                 <> " does not"
             , "have the constant. "
                 <> (if isJust c.since then "Raise it" else "Add it")
                 <> " under \"enum-constants\" in "
                 <> toText p.library.registry
                 <> " ("
                 <> renderVersion delta.suggested
             , "is this render's version; confirm against any release headers in between):"
             , ""
             , "  \"" <> c.name <> "\": { \"since\": \"" <> renderVersion delta.suggested <> "\" }"
             ]
      )
    EnumValueGateStale delta was c ->
      ( c.name
          <> " changed value since the previous render ("
          <> show was
          <> " -> "
          <> show c.value
          <> "), but "
          <> (if isJust c.since then "its value gate is stale." else "no value gate records it.")
      , renders delta
          <> [ "Baked value " <> show c.value <> "; " <> previousLibrary delta <> " asserted " <> show was <> "."
             ]
          <> case c.since of
            Just s ->
              [ "Annotated: since "
                  <> renderVersion s
                  <> ", at or below the previous render, so the baked "
                  <> show c.value
                  <> " is asserted"
              , "from "
                  <> p.library.label
                  <> " "
                  <> renderVersion s
                  <> " up to "
                  <> previousLibrary delta
                  <> ", where the value was "
                  <> show was
                  <> "."
              ]
            Nothing ->
              [ "Without a value gate the baked "
                  <> show c.value
                  <> " is asserted against every "
                  <> p.library.label
                  <> ", "
                  <> previousLibrary delta
                  <> " included,"
              , "where the value was " <> show was <> "."
              ]
          <> [ ""
             , (if isJust c.since then "Raise it" else "Add it")
                 <> " under \"value-gates\" in "
                 <> toText p.library.registry
                 <> " ("
                 <> renderVersion delta.suggested
                 <> " is this render's version;"
             , "confirm against any release headers in between, and keep the history in the note):"
             , ""
             , "  \""
                 <> c.name
                 <> "\": { \"since\": \""
                 <> renderVersion delta.suggested
                 <> "\", \"note\": \""
                 <> show was
                 <> " -> "
                 <> show c.value
                 <> ".\" }"
             ]
      )
  bare = fromMaybe d.cTypeName (T.stripPrefix "struct " d.cTypeName)
  previousLibrary delta = p.library.label <> " " <> delta.previousVersion
  renders delta =
    [ "Previous render: "
        <> previousLibrary delta
        <> " ("
        <> toText delta.previousPath
        <> "); this render: "
        <> p.library.label
        <> " "
        <> p.library.version
        <> "."
    ]
  annotated c =
    [ "Annotated: since " <> renderVersion s <> ", at or below the previous render."
    | Just s <- [c.since]
    ]
  baked =
    "Baked layout from "
      <> p.library.label
      <> " "
      <> p.library.version
      <> ": sizeof "
      <> show d.sizeof
      <> ", alignment "
      <> show d.alignment
      <> "."
  gatedMembers fs =
    ("Trailing members gated above the struct's floor (" <> renderVersion p.outer <> "):")
      : [ "  "
            <> f.name
            <> "  offset "
            <> show f.byteOffset
            <> "  since "
            <> maybe "?" renderVersion f.since
            <> provenance f
        | f <- fs
        ]
  provenance f
    | isJust f.since, f.since == f.commentSince = "  (from the member's comment)"
    | isJust f.since = "  (from the annotations)"
    | otherwise = ""
  snippet step =
    [ "\"" <> bare <> "\": {"
    , "  \"sizeof-since\": \"" <> renderVersion step.since <> "\","
    , "  \"before\": { \"sizeof\": "
        <> show step.preSizeof
        <> ", \"alignment\": "
        <> show d.alignment
        <> " },"
    , "  \"note\": \""
        <> T.intercalate "/" (map (.name) (toList step.members))
        <> " added in "
        <> renderVersion step.since
        <> "; sizeof "
        <> show step.preSizeof
        <> " -> "
        <> show step.postSizeof
        <> ".\","
    , "  \"members\": { "
        <> T.intercalate
          ", "
          ["\"" <> f.name <> "\": \"" <> renderVersion step.since <> "\"" | f <- toList step.members]
        <> " }"
    , "}"
    ]
