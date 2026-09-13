{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Consistency checks over the distilled ABI ('Lithon.Codegen.Sdl3.Abi'),
-- run on every generation before anything is written.
--
-- The assertion TU guards each member's @offsetof@ on that member's
-- availability, but a struct's @sizeof@\/@_Alignof@ asserts are guarded
-- only by a registry growth gate ('AbiGrowth'). A member SDL appended in
-- a later release therefore needs both: its own gate (from the registry
-- or its \"(added in X.Y.Z)\" note) /and/ a recorded pre-growth layout,
-- or the baked @sizeof@ is asserted unconditionally and the package
-- stops compiling on every SDL older than the one it was generated from
-- (SDL 3.4.16 appending @pen_state@ to @SDL_PenProximityEvent@ was the
-- precedent). 'validateAbi' finds every such struct and says exactly what
-- to record; the registry stays the source of truth for the pre-growth
-- layout, because the new headers cannot prove the old alignment.
module Lithon.Codegen.Sdl3.Abi.Validate (
  AbiProblem (..),
  AbiProblemKind (..),
  GrowthStep (..),
  growthSteps,
  validateAbi,
  roundUp,
) where

import Data.List.NonEmpty qualified as NE
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Sdl3.Abi (
  AbiDecl (..),
  AbiField (..),
  AbiGrowth (..),
  AbiKind (..),
  AbiLayoutBefore (..),
  AbiSince,
  renderSince,
  sdlBaseline,
 )

-- | One size-changing append: the trailing members first gated at
-- @since@, and the @sizeof@ the struct must have had just before them.
data GrowthStep = GrowthStep
  { since :: AbiSince
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
    -- baked @sizeof@ would be asserted on every SDL.
    GrowthUnrecorded GrowthStep
  | -- | A growth gate is recorded but disagrees with the baked offsets;
    -- the text says how.
    GrowthMismatch AbiGrowth GrowthStep Text
  | -- | The struct grew at more than one version; the registry's single
    -- @sizeof-since@\/@before@ cannot express that.
    GrowthMultiStep (NonEmpty GrowthStep)
  | -- | A growth gate is recorded but no trailing member is gated above
    -- the struct's floor: the appended members' offsets would be asserted
    -- on every SDL.
    GrowthUnexplained AbiGrowth
  | -- | The gated trailing members are not in non-decreasing version
    -- order, which no append sequence can produce.
    TrailingGatesNotMonotone [AbiField]
  deriving stock (Eq, Generic, Show)

data AbiProblem = AbiProblem
  { sdlVersion :: Text
  -- ^ The SDL the layout was distilled from.
  , decl :: AbiDecl
  , outer :: AbiSince
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
-- fit inside the pre-existing layout). 'Left' when the trailing gates are
-- not monotone.
growthSteps :: AbiDecl -> Either AbiProblemKind [GrowthStep]
growthSteps d
  | d.kind /= AbiStruct = Right []
  | not monotone = Left (TrailingGatesNotMonotone run)
  | otherwise =
      Right
        [ GrowthStep{since, members, preSizeof, postSizeof}
        | ((since, members), preSizeof, postSizeof) <- zip3 groups pres posts
        , preSizeof < postSizeof
        ]
 where
  outer = fromMaybe sdlBaseline d.since
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

-- | Every struct whose growth story is missing or inconsistent, with the
-- generation SDL version for the messages.
validateAbi :: Text -> [AbiDecl] -> Validation (Errors AbiProblem) ()
validateAbi sdlVersion decls = failUnlessEmpty (mapMaybe problemOf decls) ()
 where
  problemOf d = do
    kind <- kindOf d
    pure AbiProblem{sdlVersion, decl = d, outer = fromMaybe sdlBaseline d.since, kind}

  kindOf d = case growthSteps d of
    Left problem -> Just problem
    Right [] -> GrowthUnexplained <$> d.growth
    Right [step] -> case d.growth of
      Nothing -> Just (GrowthUnrecorded step)
      Just g -> GrowthMismatch g step <$> mismatch d g step
    Right (step : more) -> Just (GrowthMultiStep (step :| more))

  mismatch d g step
    | g.since /= step.since =
        Just
          ( "the registry gates sizeof at "
              <> renderSince g.since
              <> " but the appended members are gated at "
              <> renderSince step.since
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
      ( "grew at " <> renderSince step.since <> ", but the registry records no growth gate."
      , gatedMembers (toList step.members)
          <> [ ""
             , baked
             , "Implied pre-"
                 <> renderSince step.since
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
             , "SDL < "
                 <> renderSince step.since
                 <> ". Add under \"structs\" in lithon-codegen/data/sdl3/versions.json:"
             , ""
             ]
          <> map ("  " <>) (snippet step)
      )
    GrowthMismatch g step why ->
      ( "the registry's growth gate disagrees with the baked offsets: " <> why <> "."
      , gatedMembers (toList step.members)
          <> [ ""
             , baked
             , "Registry: sizeof-since "
                 <> renderSince g.since
                 <> ", before sizeof "
                 <> show g.before.sizeof
                 <> ", alignment "
                 <> show g.before.alignment
                 <> "."
             , "Offsets imply: sizeof-since "
                 <> renderSince step.since
                 <> ", before sizeof "
                 <> show step.preSizeof
                 <> " (alignment assumed unchanged)."
             , "Fix the "
                 <> bare
                 <> " entry in lithon-codegen/data/sdl3/versions.json against the release headers."
             ]
      )
    GrowthMultiStep steps ->
      ( "grew at "
          <> T.intercalate " and " (map (renderSince . (.since)) (toList steps))
          <> "; the registry can only record one growth gate."
      , concat
          [ ("At " <> renderSince s.since <> ": sizeof " <> show s.preSizeof <> " -> " <> show s.postSizeof)
              : gatedMembers (toList s.members)
          | s <- toList steps
          ]
          <> [ ""
             , baked
             , "A single sizeof-since/before cannot express two steps; extend the registry's growth"
             , "vocabulary (structs.<name>.growth as a list) and the emitter's #elif chain first."
             ]
      )
    GrowthUnexplained g ->
      ( "the registry records growth at "
          <> renderSince g.since
          <> " but no trailing member is gated above the struct's floor ("
          <> renderSince p.outer
          <> ")."
      ,
        [ baked
        , "Registry: before sizeof "
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
             , "lithon-codegen/data/sdl3/versions.json (structs." <> bare <> ".members)."
             ]
      )
  bare = fromMaybe d.cTypeName (T.stripPrefix "struct " d.cTypeName)
  baked =
    "Baked layout from SDL "
      <> p.sdlVersion
      <> ": sizeof "
      <> show d.sizeof
      <> ", alignment "
      <> show d.alignment
      <> "."
  gatedMembers fs =
    ("Trailing members gated above the struct's floor (" <> renderSince p.outer <> "):")
      : [ "  "
            <> f.name
            <> "  offset "
            <> show f.byteOffset
            <> "  since "
            <> maybe "?" renderSince f.since
            <> provenance f
        | f <- fs
        ]
  provenance f
    | isJust f.since, f.since == f.commentSince = "  (from the member's comment)"
    | isJust f.since = "  (registry)"
    | otherwise = ""
  snippet step =
    [ "\"" <> bare <> "\": {"
    , "  \"sizeof-since\": \"" <> renderSince step.since <> "\","
    , "  \"before\": { \"sizeof\": "
        <> show step.preSizeof
        <> ", \"alignment\": "
        <> show d.alignment
        <> " },"
    , "  \"note\": \""
        <> T.intercalate "/" (map (.name) (toList step.members))
        <> " added in "
        <> renderSince step.since
        <> "; sizeof "
        <> show step.preSizeof
        <> " -> "
        <> show step.postSizeof
        <> ".\","
    , "  \"members\": { "
        <> T.intercalate
          ", "
          ["\"" <> f.name <> "\": \"" <> renderSince step.since <> "\"" | f <- toList step.members]
        <> " }"
    , "}"
    ]
