{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | The skip ledger: everything hs-bindgen leaves unbound in a target's
-- bound headers, each with a curated disposition.
--
-- hs-bindgen skips declarations it cannot translate (variadic functions,
-- unsupported types, most function-like macros, same-name conflicts, and
-- whatever depends on those), and reports most macro failures below the
-- level a default run prints. The seam captures every skip regardless
-- ('HB.InvocationReport'); this module joins the skips of a chain run with
-- the target's checked-in triage, @lithon-codegen\/data\/\<key\>\/unbound.json@,
-- in both directions: a skip without a disposition is an error, and so is a
-- disposition for a name that is no longer skipped. The joined ledger is
-- rendered as the machine-owned @unbound.md@ beside it, so the decisions
-- are reviewable and @generate --check@ catches drift.
--
-- Dispositions key on rendered names ('HB.renderCName': @SDL_Log@,
-- @macro SDL_memcpy@), never on hs-bindgen's message text, so a vendor bump
-- that rewords a failure changes @unbound.md@ only.
module Lithon.Codegen.Bindgen.Unbound (
  -- * The registry
  Disposition (..),
  dispositionText,
  UnboundGroup (..),
  UnboundConfig (..),
  decodeUnboundConfig,
  encodeUnboundConfig,

  -- * The ledger
  LedgerRow (..),
  unboundLedger,
  reasonClass,
  rowClass,

  -- * Triage
  UnboundError (..),
  TriagedGroup (..),
  validateUnbound,
  untriagedSnippets,

  -- * The document
  LedgerSource (..),
  UnboundDoc (..),
  unboundDoc,
  renderUnbound,
) where

import Autodocodec (
  HasCodec (codec),
  JSONCodec,
  bimapCodec,
  object,
  optionalFieldOrNull,
  requiredField,
  requiredFieldWith,
  stringConstCodec,
  (.=),
 )
import Autodocodec.Aeson (eitherDecodeJSONViaCodec, encodeJSONViaCodec)
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.FilePath (takeFileName)

import Lithon.Codegen.Bindgen.Driver (HeaderPlan (..), HeaderResult (..), HeaderUnit (..))

-- | What lithon does about a skipped name.
data Disposition
  = -- | A lithon-authored C shim binds it instead.
    Shim
  | -- | lithon binds its value as a typed constant (@constants.json@).
    Constant
  | -- | It stays unbound on purpose; the note says why.
    WontFix
  | -- | It waits on an hs-bindgen fix; the group links the issue.
    Upstream
  deriving stock (Bounded, Enum, Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

-- | The registry spelling.
dispositionText :: Disposition -> Text
dispositionText = \case
  Shim -> "shim"
  Constant -> "constant"
  WontFix -> "wontfix"
  Upstream -> "upstream"

instance Display Disposition where
  displayBuilder = displayBuilder . dispositionText

-- | One group of the registry: names that share a disposition and a reason.
data UnboundGroup = UnboundGroup
  { disposition :: Disposition
  , note :: Text
  -- ^ One line on why (required, not blank).
  , issue :: Maybe Text
  -- ^ The upstream issue's URL, where there is one.
  , names :: [Text]
  -- ^ Rendered names: @SDL_Log@, @macro SDL_memcpy@, @struct SDL_Foo@.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | @unbound.json@: the groups, in the order @unbound.md@ renders them.
newtype UnboundConfig = UnboundConfig
  { groups :: [UnboundGroup]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

decodeUnboundConfig :: LBS.ByteString -> Either Text UnboundConfig
decodeUnboundConfig = first T.pack . eitherDecodeJSONViaCodec

encodeUnboundConfig :: UnboundConfig -> LBS.ByteString
encodeUnboundConfig = encodeJSONViaCodec

instance HasCodec UnboundConfig where
  codec =
    object "UnboundConfig"
      $ UnboundConfig
      <$> requiredField "groups" "every name hs-bindgen skips, grouped by disposition"
      .= (.groups)

instance HasCodec UnboundGroup where
  codec =
    object "UnboundGroup"
      $ UnboundGroup
      <$> requiredFieldWith "disposition" dispositionCodec dispositionDoc
      .= (.disposition)
      <*> requiredFieldWith "note" noteCodec "one line on why (required)"
      .= (.note)
      <*> optionalFieldOrNull "issue" "the upstream issue's URL"
      .= (.issue)
      <*> requiredField "names" "the skipped names, as hs-bindgen renders them (macro SDL_memcpy)"
      .= (.names)
   where
    dispositionDoc =
      "shim = a lithon C shim binds it; constant = a typed constant binds its value; "
        <> "wontfix = unbound on purpose; upstream = waits on hs-bindgen"

dispositionCodec :: JSONCodec Disposition
dispositionCodec =
  stringConstCodec
    ( (Shim, "shim")
        :| [(Constant, "constant"), (WontFix, "wontfix"), (Upstream, "upstream")]
    )

noteCodec :: JSONCodec Text
noteCodec = bimapCodec nonBlank id codec
 where
  nonBlank t
    | T.null (T.strip t) = Left "a note says why; it may not be blank"
    | otherwise = Right t

-- | One skipped name of one bound header.
data LedgerRow = LedgerRow
  { key :: Text
  -- ^ 'HB.renderCName' of the name: what the registry lists.
  , name :: HB.CName
  , header :: FilePath
  -- ^ The bound header declaring it (basename).
  , line :: Int
  , reasons :: NonEmpty HB.SkipReason
  }
  deriving stock (Eq, Show)

-- | The chain's skips, each attributed to the unit whose header declares
-- it. A run reports only its own main header's roots, so this drops what
-- belongs to no bound header: a root directive's macro, and hs-bindgen's
-- bug-level reports about declarations of other headers.
unboundLedger :: HeaderPlan -> [HeaderResult r] -> [LedgerRow]
unboundLedger plan results =
  [ LedgerRow
      { key = HB.renderCName skip.name
      , name = skip.name
      , header = r.unit.headerName
      , line = loc.line
      , reasons = skip.reasons
      }
  | r <- results
  , skip <- r.report.skips
  , Just loc <- [skip.loc]
  , plan.projectHeader loc.path == Just r.unit.headerName
  ]

-- | The kind of a skip reason, as messages and @unbound.md@ name it.
reasonClass :: HB.SkipReason -> Text
reasonClass = \case
  HB.SkipUnusable failure -> failureClass failure
  HB.SkipConflict _ -> "conflict"
  HB.SkipDependencyMissing _ -> "dependency"

failureClass :: HB.SkipFailure -> Text
failureClass = \case
  HB.UnsupportedVariadic -> "variadic"
  HB.ParseFailed _ -> "parse"
  HB.MacroParseFailed _ -> "macro-parse"
  HB.MacroTypecheckFailed _ -> "macro-typecheck"
  HB.MacroResolutionFailed _ -> "macro-resolution"
  HB.NameManglingFailed _ -> "mangle"
  HB.UnavailableOnPlatform -> "unavailable"
  HB.OmittedByOverride -> "omitted"

-- | A row's class: its own failure's, when it has one besides a missing
-- dependency.
rowClass :: LedgerRow -> Text
rowClass row = reasonClass (fromMaybe (head row.reasons) (find (not . isDependency) row.reasons))
 where
  isDependency = \case
    HB.SkipDependencyMissing _ -> True
    HB.SkipUnusable _ -> False
    HB.SkipConflict _ -> False

-- | Why the registry and the chain's skips disagree.
data UnboundError
  = -- | A skip without a disposition.
    UnboundUntriaged {name :: Text, header :: FilePath, line :: Int, reasonClass :: Text}
  | -- | A disposition for a name that is no longer skipped.
    UnboundStale {name :: Text, disposition :: Disposition}
  | -- | A name listed more than once (the dispositions of each listing).
    UnboundDuplicate {name :: Text, dispositions :: [Disposition]}
  | -- | A group without names.
    UnboundEmptyGroup {disposition :: Disposition, note :: Text}
  deriving stock (Eq, Show)

instance Display UnboundError where
  displayBuilder =
    displayBuilder @Text . \case
      UnboundUntriaged{name, header, line, reasonClass = cls} ->
        name
          <> " ("
          <> toText header
          <> ":"
          <> show line
          <> ", "
          <> cls
          <> "): skipped, with no disposition"
      UnboundStale{name, disposition} ->
        name <> " (" <> dispositionText disposition <> "): no longer skipped; delete it"
      UnboundDuplicate{name, dispositions} ->
        name
          <> ": listed more than once ("
          <> T.intercalate ", " (map dispositionText dispositions)
          <> "); keep one listing"
      UnboundEmptyGroup{disposition, note = why} ->
        "a " <> dispositionText disposition <> " group lists no names (" <> why <> "); delete it"

-- | A registry group with the rows it covers, sorted by header, then line.
data TriagedGroup = TriagedGroup
  { entry :: UnboundGroup
  , rows :: [LedgerRow]
  }
  deriving stock (Eq, Show)

-- | Join the registry with the ledger, in both directions: every row's
-- name is listed exactly once, every listed name is skipped, and no group
-- is empty. Accumulates every error.
validateUnbound :: UnboundConfig -> [LedgerRow] -> Either (Errors UnboundError) [TriagedGroup]
validateUnbound config rows =
  validationToEither
    $ failUnlessEmpty
      (untriaged <> stale <> duplicate <> emptyGroups)
      [ TriagedGroup
          { entry = g
          , rows = sortOn rowOrder [r | r <- rows, r.key `Set.member` Set.fromList g.names]
          }
      | g <- config.groups
      ]
 where
  listings = Map.fromListWith (flip (<>)) [(n, [g.disposition]) | g <- config.groups, n <- g.names]
  skipped = Set.fromList (map (.key) rows)
  untriaged =
    [ UnboundUntriaged{name = r.key, header = r.header, line = r.line, reasonClass = rowClass r}
    | r <- rows
    , not (Map.member r.key listings)
    ]
  stale =
    [ UnboundStale{name = n, disposition = g.disposition}
    | g <- config.groups
    , n <- g.names
    , not (Set.member n skipped)
    ]
  duplicate =
    [UnboundDuplicate{name = n, dispositions = ds} | (n, ds@(_ : _ : _)) <- Map.toList listings]
  emptyGroups =
    [UnboundEmptyGroup{disposition = g.disposition, note = g.note} | g <- config.groups, null g.names]

rowOrder :: LedgerRow -> (FilePath, Int, Text)
rowOrder r = (r.header, r.line, r.key)

-- | For bootstrapping a registry: the untriaged names as one pasteable
-- group per reason class, in the order the classes first appear.
untriagedSnippets :: [UnboundError] -> [Text]
untriagedSnippets errs =
  [ T.unlines
      $ [ "{"
        , "  \"disposition\": \"shim | constant | wontfix | upstream\","
        , "  \"note\": \"TODO: why (" <> cls <> ")\","
        , "  \"names\": ["
        ]
      <> zipWith (\i n -> "    " <> show n <> (if i < length names then "," else "")) [1 :: Int ..] names
      <> ["  ]", "},"]
  | cls <- nubOrd [c | UnboundUntriaged{reasonClass = c} <- errs]
  , let names = nubOrd [n | UnboundUntriaged{name = n, reasonClass = c} <- errs, c == cls]
  ]

-- | What @unbound.md@ says about where the ledger comes from.
data LedgerSource = LedgerSource
  { key :: Text
  -- ^ The target's key: @sdl3@.
  , library :: Text
  -- ^ The headers' library and version: @SDL 3.4.16@.
  }
  deriving stock (Eq, Show)

-- | Everything @unbound.md@ renders.
data UnboundDoc = UnboundDoc
  { source :: LedgerSource
  , groups :: [TriagedGroup]
  , blocking :: [(HB.SkipDependency, Int)]
  -- ^ Dependencies outside the bound headers, each with how many rows it
  -- blocks, by name.
  , omitted :: [(FilePath, FilePath, [Text])]
  -- ^ Per bound header with an override: the header, the override's file
  -- name, and the names it omits.
  , excluded :: [FilePath]
  -- ^ Headers the target never binds.
  }
  deriving stock (Eq, Show)

-- | The ledger of a chain run, triaged against the registry.
unboundDoc
  :: LedgerSource
  -> HeaderPlan
  -> UnboundConfig
  -> [HeaderResult r]
  -> Either (Errors UnboundError) UnboundDoc
unboundDoc source plan config results = do
  let rows = unboundLedger plan results
  groups <- validateUnbound config rows
  pure
    UnboundDoc
      { source
      , groups
      , blocking = blockingDependencies rows
      , omitted =
          [ (r.unit.headerName, r.unit.specFile, map HB.renderCName r.report.omitted)
          | r <- results
          , not (null r.report.omitted)
          ]
      , excluded = sort (toList plan.excludedHeaders)
      }
 where
  bound = Set.fromList (map (.unit.headerName) results)
  isBound dep = case dep.loc of
    Just loc | Just header <- plan.projectHeader loc.path -> header `Set.member` bound
    _outside -> False
  blockingDependencies rows =
    [ (dep, length (nubOrd dependents))
    | (dep, dependents) <-
        Map.elems
          $ Map.fromListWith
            (\(_, new) (dep, old) -> (dep, old <> new))
            [ (HB.renderCName dep.name, (dep, [rowOrder row]))
            | row <- rows
            , HB.SkipDependencyMissing deps <- toList row.reasons
            , dep <- toList deps
            , not (isBound dep)
            ]
    ]

-- | @unbound.md@, machine-owned (written beside the registry by @spec@ and
-- @generate@): the counts by disposition, one section per registry group
-- in registry order, the dependencies outside the bound headers, what the
-- overrides omit, and the headers never bound. Paths are file names only,
-- so the document is the same on every machine.
renderUnbound :: UnboundDoc -> Text
renderUnbound doc =
  T.intercalate "\n"
    . map T.unlines
    $ [ ["# Unbound declarations"]
      ,
        [ "<!-- Generated by lithon-codegen from unbound.json: edit that, then rerun"
            <> " `lithon-codegen "
            <> doc.source.key
            <> " spec`. -->"
        ]
      ,
        [ "hs-bindgen does not bind these declarations of the "
            <> doc.source.library
            <> " headers. [`unbound.json`](unbound.json) gives each one a disposition, and"
            <> " `spec` and `generate` fail on a skip without one and on a disposition for a"
            <> " name that is bound now."
        ]
      , countsTable
      , ["- `" <> dispositionText d <> "`: " <> meaning d | d <- universe]
      ]
    <> concatMap groupSection doc.groups
    <> [ ["## Blocking dependencies outside the bound headers"]
       ,
         [ "Declarations the skips above need that no bound header declares, with how many"
             <> " skips each blocks."
         ]
       , orNone [dependencyLine dep n | (dep, n) <- doc.blocking]
       , ["## Omitted by overrides"]
       , orNone
           [ "- `"
               <> toText header
               <> "` ([`overrides/"
               <> toText file
               <> "`](overrides/"
               <> toText file
               <> ")): "
               <> T.intercalate ", " (map code names)
           | (header, file, names) <- doc.omitted
           ]
       , ["## Headers not bound"]
       , ["The target excludes these headers, so none of their declarations is listed above."]
       , orNone ["- `" <> toText header <> "`" | header <- doc.excluded]
       ]
 where
  universe = [minBound .. maxBound]
  tally =
    Map.fromListWith (+) [(g.entry.disposition, length g.rows) | g <- doc.groups]
  countsTable =
    let cells = [("`" <> dispositionText d <> "`", show (Map.findWithDefault 0 d tally)) | d <- universe]
        rows = ("Disposition", "Skips") :| cells
        w1 = maximum (fmap (T.length . fst) rows)
        w2 = maximum (fmap (T.length . snd) rows)
        row (a, b) = "| " <> T.justifyLeft w1 ' ' a <> " | " <> T.justifyRight w2 ' ' b <> " |"
     in row ("Disposition", "Skips")
          : ("| " <> T.replicate w1 "-" <> " | " <> T.replicate (w2 - 1) "-" <> ": |")
          : map row cells
  meaning = \case
    Shim -> "a lithon-authored C shim binds it instead."
    Constant -> "lithon binds its value as a typed constant (`constants.json`)."
    WontFix -> "it stays unbound on purpose."
    Upstream -> "it waits on an hs-bindgen fix."
  groupSection g =
    [ ["## `" <> dispositionText g.entry.disposition <> "` (" <> show (length g.rows) <> ")"]
    , [g.entry.note]
    ]
      <> [["Issue: <" <> url <> ">"] | Just url <- [g.entry.issue]]
      <> [map rowLine g.rows]
  rowLine r =
    "- "
      <> code r.key
      <> " ("
      <> toText r.header
      <> ":"
      <> show r.line
      <> "): "
      <> T.intercalate "; " (map renderReason (toList r.reasons))
  dependencyLine dep n =
    "- "
      <> code (HB.renderCName dep.name)
      <> maybe "" (\loc -> " (" <> renderLoc loc <> ")") dep.loc
      <> ": "
      <> dependencyDetail dep.status
      <> "; blocks "
      <> show n
  orNone = \case
    [] -> ["None."]
    ls -> ls

renderReason :: HB.SkipReason -> Text
renderReason = \case
  HB.SkipUnusable failure -> renderFailure failure
  HB.SkipConflict locs ->
    "conflict with a same-name declaration (" <> T.intercalate ", " (map renderLoc locs) <> ")"
  HB.SkipDependencyMissing deps ->
    "needs "
      <> T.intercalate
        ", "
        [code (HB.renderCName d.name) <> " (" <> dependencyClass d.status <> ")" | d <- toList deps]

renderFailure :: HB.SkipFailure -> Text
renderFailure failure = failureClass failure <> maybe "" ((": " <>) . code) (failureText failure)

failureText :: HB.SkipFailure -> Maybe Text
failureText = \case
  HB.UnsupportedVariadic -> Nothing
  HB.ParseFailed t -> Just t
  HB.MacroParseFailed t -> Just t
  HB.MacroTypecheckFailed t -> Just t
  HB.MacroResolutionFailed t -> Just t
  HB.NameManglingFailed t -> Just t
  HB.UnavailableOnPlatform -> Nothing
  HB.OmittedByOverride -> Nothing

dependencyClass :: HB.DependencyStatus -> Text
dependencyClass = \case
  HB.DependencyNotSelected -> "not selected"
  HB.DependencyUnusable failure -> failureClass failure
  HB.DependencyConflict -> "conflict"

dependencyDetail :: HB.DependencyStatus -> Text
dependencyDetail = \case
  HB.DependencyNotSelected -> "not selected"
  HB.DependencyUnusable failure -> renderFailure failure
  HB.DependencyConflict -> "conflict"

-- | A location as a file name and line: never the absolute path.
renderLoc :: HB.SourceLoc -> Text
renderLoc loc = toText (takeFileName loc.path) <> ":" <> show loc.line

-- | A code span, fenced past any backticks the text holds.
code :: Text -> Text
code t
  | "`" `T.isInfixOf` t = "`` " <> t <> " ``"
  | otherwise = "`" <> t <> "`"
