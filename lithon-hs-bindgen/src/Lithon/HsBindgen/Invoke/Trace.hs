{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | Structured capture of one invocation's skips (internal).
--
-- hs-bindgen's select pass is the single place that decides a selection
-- root goes unbound, and it says so in a trace for every case
-- ('TransitiveDependenciesMissing', 'SelectUnusable', 'SelectConflict'). The
-- seam keeps the run's select and resolve-binding-specs traces as they are
-- emitted ('Collector') and folds them into the lithon-owned
-- 'InvocationReport' afterwards ('invocationReport'), so the report does not
-- re-derive selection from the declaration index.
--
-- The classification below matches hs-bindgen's message types without
-- wildcards: a constructor a vendor bump adds fails to compile here, where
-- its place in the report gets decided, instead of vanishing from it.
--
-- This is the only module that imports hs-bindgen's trace vocabulary
-- ("HsBindgen.TraceMsg", "HsBindgen.Frontend.Pass.Select.IsPass",
-- "HsBindgen.Frontend.Analysis.DeclIndex").
module Lithon.HsBindgen.Invoke.Trace (
  -- * Collection
  Collector,
  newCollector,
  collectTrace,
  collected,
  Collected,

  -- * The report
  invocationReport,

  -- * Rendering
  vendorText,
  scrubPaths,
) where

import Clang.HighLevel.Types (SingleLoc (..))
import Clang.Paths (getRealPath)
import Data.Containers.ListUtils (nubOrd)
import Data.IORef (IORef, modifyIORef', newIORef, readIORef)
import Data.List.NonEmpty (NonEmpty (..), nonEmpty)
import Data.Map.Strict qualified as Map
import Data.Maybe (listToMaybe, mapMaybe)
import Data.Text (Text)
import Data.Text qualified as T
import HsBindgen.Frontend.Analysis.DeclIndex (
  UnusableEntry (..),
  UnusableReason (..),
  unusableToLoc,
 )
import HsBindgen.Frontend.Pass.Select.IsPass (
  SelectReason (..),
  TransitiveDependencyMissing (..),
 )
import HsBindgen.IR.C qualified as C
import HsBindgen.TraceMsg (
  DelayedParseMsg (..),
  FrontendMsg (..),
  ResolveBindingSpecsMsg (..),
  SelectMsg (..),
  TraceMsg (..),
 )
import HsBindgen.Util.Tracer (PrettyForTrace (..))
import System.FilePath (takeFileName)

import Lithon.HsBindgen.Skip

-- | One kept trace. The payload stays unevaluated until the report reads
-- it.
data Collected
  = CollectedSelect (C.WithLocationInfo SelectMsg)
  | CollectedResolve ResolveBindingSpecsMsg

-- | The traces one invocation has emitted so far (newest first).
newtype Collector = Collector (IORef [Collected])

newCollector :: IO Collector
newCollector = Collector <$> newIORef []

-- | Keep a trace if the report reads it. Called for every frontend trace at
-- or above @Info@, whatever the run prints.
collectTrace :: Collector -> TraceMsg -> IO ()
collectTrace (Collector ref) = \case
  TraceFrontend (FrontendSelect m) -> modifyIORef' ref (CollectedSelect m :)
  TraceFrontend (FrontendResolveBindingSpecs m) -> modifyIORef' ref (CollectedResolve m :)
  _other -> pure ()

-- | The kept traces, in emission order.
collected :: Collector -> IO [Collected]
collected (Collector ref) = reverse <$> readIORef ref

-- | Fold one invocation's traces into its report. A root reported more than
-- once (its own failure and a missing dependency) is one 'Skip' carrying
-- both reasons, at its first report's position.
invocationReport :: [Collected] -> InvocationReport
invocationReport traces =
  InvocationReport
    { skips = mergeSkips [entry | CollectedSelect m <- traces, Just entry <- [selectEntry m]]
    , omitted = [name | CollectedResolve m <- traces, ResolvedOmit name <- [resolveEntry m]]
    , overrideProblems =
        [problem | CollectedResolve m <- traces, ResolvedProblem problem <- [resolveEntry m]]
    }

mergeSkips :: [(CName, Maybe SourceLoc, SkipReason)] -> [Skip]
mergeSkips entries =
  [ Skip{name, loc, reasons}
  | key@(name, loc) <- nubOrd [(name, loc) | (name, loc, _) <- entries]
  , Just reasons <- [Map.lookup key byKey]
  ]
 where
  byKey =
    Map.fromListWith
      (flip (<>))
      [((name, loc), reason :| []) | (name, loc, reason) <- entries]

-- | A select trace that reports an unbound root, as (name, location,
-- reason).
selectEntry :: C.WithLocationInfo SelectMsg -> Maybe (CName, Maybe SourceLoc, SkipReason)
selectEntry m = do
  -- hs-bindgen attaches a declaration's name to every message about one
  -- (C.declIdLocationInfo); a nameless message is about none.
  name <- locationName m.loc
  reason <- selectReason locs m.msg
  pure (name, listToMaybe locs, reason)
 where
  locs = mapMaybe sourceLoc (C.locationInfoLocs m.loc)

selectReason :: [SourceLoc] -> SelectMsg -> Maybe SkipReason
selectReason locs = \case
  -- Selected or not, for every declaration of the run.
  SelectStatusInfo _ -> Nothing
  TransitiveDependenciesMissing selected deps -> case selected of
    SelectionRoot -> SkipDependencyMissing <$> nonEmpty (map dependency deps)
    -- Program slicing only, which lithon keeps off.
    TransitiveDependency -> Nothing
  SelectDeprecated _ -> Nothing
  -- Delayed messages about a declaration that was bound.
  SelectDelayedParseMsg _ -> Nothing
  SelectDelayedPrepareReparseMsg _ -> Nothing
  SelectDelayedReparseMacroExpansionsMsg _ -> Nothing
  SelectDelayedTranslateTypesMsg _ -> Nothing
  SelectUnusable reason -> SkipUnusable <$> rootFailure reason
  SelectConflict -> Just (SkipConflict locs)
  SelectMangleNamesSquashed _ -> Nothing
  SelectNoDeclarationsMatched -> Nothing
  -- A count of the macro failures already reported one by one.
  SelectMacrosDropped _ -> Nothing
  SelectSourceNotInIncludeGraph _ -> Nothing

-- | How an unusable declaration figures in the report.
data Unusable
  = -- | It failed.
    Fails SkipFailure
  | -- | The prescriptive spec omitted it: never a root of its own (the
    -- resolve-binding-specs trace reports it, 'omitted').
    Omitted
  | -- | A macro with an empty body (every include guard), which hs-bindgen
    -- does not try to parse and does not count as a dropped macro either.
    EmptyMacro Text

unusable :: UnusableReason -> Unusable
unusable = \case
  UnusableUnavailable -> Fails UnavailableOnPlatform
  UnusableOmitted -> Omitted
  UnusableParseFailure m -> parseFailure m
  UnusableMacroTypecheckFailure e -> Fails (MacroTypecheckFailed (vendorText e))
  UnusableMacroResolutionFailure e -> Fails (MacroResolutionFailed (vendorText e))
  UnusableMangleNamesFailure e -> Fails (NameManglingFailed (vendorText e))

rootFailure :: UnusableReason -> Maybe SkipFailure
rootFailure r = case unusable r of
  Fails failure -> Just failure
  Omitted -> Nothing
  EmptyMacro _ -> Nothing

dependencyFailure :: UnusableReason -> SkipFailure
dependencyFailure r = case unusable r of
  Fails failure -> failure
  Omitted -> OmittedByOverride
  EmptyMacro text -> MacroParseFailed text

parseFailure :: DelayedParseMsg -> Unusable
parseFailure m = case m of
  ParseUnsupportedVariadicFunction -> Fails UnsupportedVariadic
  ParseMacroEmpty{} -> EmptyMacro text
  ParseMacroErrorParse{} -> macro
  ParseMacroDefinitionNoMacroName -> macro
  ParseUnderlyingTypeFailed{} -> parse
  ParseImplicitFieldFailed{} -> parse
  ParsePotentialDuplicateSymbol{} -> parse
  ParseDeclarationNotVisible{} -> parse
  ParseFunctionOfTypeTypedef -> parse
  ParseInvalidLinkage -> parse
  ParseInvalidVisibility -> parse
  ParseNestedDeclsFailed -> parse
  ParseNonPublicVisibility -> parse
  ParseUnknownCursorAvailability{} -> parse
  ParseUnknownStorageClass{} -> parse
  ParseUnexposedType -> parse
  ParseUnsupportedUnnamedInExtern -> parse
  ParseUnsupportedUnnamedInSignature -> parse
  ParseUnsupportedBuiltin{} -> parse
  ParseUnsupportedFloatType{} -> parse
  ParseUnsupportedLinkage{} -> parse
  ParseUnsupportedTLS -> parse
  ParseUnsupportedVector -> parse
  ParseUnusableUnnamedDecl{} -> parse
  ParseExpectedFunctionType{} -> parse
  ParseUnexpectedComplexType{} -> parse
  ParseUnexpectedCursorKind{} -> parse
  ParseUnexpectedLinkage{} -> parse
  ParseUnexpectedTypeKind{} -> parse
  ParseUnexpectedVisibility{} -> parse
  ParseNoMainHeadersException{} -> parse
 where
  text = vendorText m
  macro = Fails (MacroParseFailed text)
  parse = Fails (ParseFailed text)

dependency :: TransitiveDependencyMissing -> SkipDependency
dependency = \case
  TransitiveDependencyUnusable declId entry ->
    SkipDependency
      { name = declIdName declId
      , loc = firstLoc (C.declLocsToList (unusableToLoc entry))
      , status = case entry of
          UnusableReason _ reason -> DependencyUnusable (dependencyFailure reason)
          UnusableConflict _ -> DependencyConflict
      }
  TransitiveDependencyNotSelected declId locs ->
    SkipDependency{name = declIdName declId, loc = firstLoc locs, status = DependencyNotSelected}
 where
  firstLoc = listToMaybe . mapMaybe sourceLoc

-- | What the report keeps of a resolve-binding-specs trace.
data Resolved
  = ResolvedOmit CName
  | ResolvedProblem Text
  | ResolvedNothing

resolveEntry :: ResolveBindingSpecsMsg -> Resolved
resolveEntry m = case m of
  ResolveBindingSpecsPreOmit declId -> ResolvedOmit (declIdName declId)
  -- The prescriptive spec's own problems.
  ResolveBindingSpecsModuleMismatch{} -> problem
  ResolveBindingSpecsEnumTypeMismatch{} -> problem
  ResolveBindingSpecsTypeNotUsed{} -> problem
  ResolveBindingSpecsPreEmptyDataInvalid{} -> problem
  -- External specs (hs-bindgen prints their problems), and progress.
  ResolveBindingSpecsExtHsRefNoIdentifier{} -> ResolvedNothing
  ResolveBindingSpecsNoHsTypeSpec{} -> ResolvedNothing
  ResolveBindingSpecsOmittedType{} -> ResolvedNothing
  ResolveBindingSpecsExtDecl{} -> ResolvedNothing
  ResolveBindingSpecsExtType{} -> ResolvedNothing
  ResolveBindingSpecsPreRequire{} -> ResolvedNothing
  ResolveBindingSpecsPreEmptyData{} -> ResolvedNothing
  ResolveBindingSpecsIndirectFieldDropped{} -> ResolvedNothing
 where
  problem = ResolvedProblem (vendorText m)

-- | The declaration a select trace is about. Unnamed declarations carry
-- the name hs-bindgen assigned them.
locationName :: C.LocationInfo -> Maybe CName
locationName = \case
  C.LocationDeclNamed name _ -> Just (declName False name)
  C.LocationDeclUnnamed name _ -> declName True <$> name
  C.LocationUnavailable -> Nothing

declIdName :: C.DeclId -> CName
declIdName declId = declName declId.isUnnamed declId.name

declName :: Bool -> C.DeclName -> CName
declName unnamed name =
  CName
    { text = name.text
    , namespace = case name.kind of
        C.NameKindOrdinary -> Ordinary
        C.NameKindTagged C.TagKindStruct -> Struct
        C.NameKindTagged C.TagKindUnion -> Union
        C.NameKindTagged C.TagKindEnum -> Enum
        C.NameKindMacro -> Macro
    , unnamed
    }

-- | A header location. The root header and the command line are no file.
sourceLoc :: SingleLoc C.DeclPath -> Maybe SourceLoc
sourceLoc l = case singleLocPath l of
  C.InHeader path ->
    Just SourceLoc{path = getRealPath path, line = singleLocLine l, column = singleLocColumn l}
  C.InRootHeader -> Nothing
  C.OnCommandLine -> Nothing

-- | hs-bindgen's rendering of a trace payload, the way its own output
-- spells it, on one line and with paths reduced to file names
-- ('scrubPaths').
vendorText :: (PrettyForTrace a) => a -> Text
vendorText = scrubPaths . T.unwords . T.words . T.pack . show . prettyForTrace

-- | Reduce every absolute path in the text to its file name: a word that,
-- once stripped of surrounding quotes, brackets, and punctuation, starts
-- with @\/@ and has at least two components. hs-bindgen's texts embed the
-- headers' paths (a macro parse error names its file), which differ by
-- machine; a header's name does not.
scrubPaths :: Text -> Text
scrubPaths = T.unwords . map scrub . T.words
 where
  scrub word
    | Just file <- fileOf core = lead <> file <> trail
    | otherwise = word
   where
    lead = T.takeWhile isWrapper word
    trail = T.takeWhileEnd isWrapper (T.drop (T.length lead) word)
    core = T.dropEnd (T.length trail) (T.drop (T.length lead) word)
  fileOf core = case T.uncons core of
    Just ('/', _)
      | components@(_ : _ : _) <- filter (not . T.null) (T.splitOn "/" core) ->
          Just (T.pack (takeFileName (T.unpack (T.intercalate "/" components))))
    _notAPath -> Nothing
  isWrapper c = c `elem` ("\"'`()[]{}<>,;" :: String)
