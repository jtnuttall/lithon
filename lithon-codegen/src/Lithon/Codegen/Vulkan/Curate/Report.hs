{-# LANGUAGE OverloadedStrings #-}

-- | The curation report: the reviewable artifact describing exactly what
-- the curated surface contains and why — selected extensions with
-- provenance, counts, everything dropped or narrowed, and warnings. The
-- JSON form is a golden; the text form is the CLI output.
module Lithon.Codegen.Vulkan.Curate.Report (
  CurationReport (..),
  SelectedExtension (..),
  buildReport,
  prettyReport,
) where

import Data.Aeson (ToJSON)
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude
import Prettyprinter (
  Doc,
  Pretty,
  annotate,
  comma,
  hsep,
  indent,
  pretty,
  punctuate,
  semi,
  vsep,
  (<+>),
 )
import Prettyprinter.Render.Terminal (AnsiStyle, Color (..), bold, color, italicized)

import Lithon.Codegen.Vulkan.Curate.Closure (
  Closure (..),
  InclusionTrace (..),
  UnsatisfiedNote (..),
  renderReason,
 )
import Lithon.Codegen.Vulkan.Curate.Profile (Profile (..), ProfilePolicy (..), RegistryPin (..))
import Lithon.Codegen.Vulkan.Curate.Prune (PruneNotes (..), Pruned (..))
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))
import Lithon.Codegen.Vulkan.Resolved.Summary (ResolvedSummary, summarizeResolved)

data SelectedExtension = SelectedExtension
  { name :: !Text
  , reasons :: ![Text]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data CurationReport = CurationReport
  { profileName :: !Text
  , headerVersion :: !Int
  , headerVersionDrift :: !(Maybe Text)
  , coreVersions :: ![Text]
  , selectedExtensions :: ![SelectedExtension]
  , curatedSummary :: !ResolvedSummary
  , unsatisfied :: ![Text]
  , legacyExcluded :: ![Text]
  , droppedResultCodes :: ![Text]
  , droppedSpirv :: ![Text]
  , warnings :: ![Text]
  }
  deriving stock (Generic)
  deriving anyclass (NFData, ToJSON)

buildReport
  :: (HasType Profile cxt, HasType Closure cxt, HasType Pruned cxt)
  => cxt -> CurationReport
buildReport cxt =
  CurationReport
    { profileName = profile.name
    , headerVersion = pruned.registry.headerVersion
    , headerVersionDrift = drift
    , coreVersions = map display (Set.toAscList closure.coreVersions)
    , selectedExtensions =
        [ SelectedExtension
            { name = forgetNamespace name
            , reasons = map renderReason (NE.toList trace.reasons)
            }
        | (name, trace) <- Map.toAscList closure.selectedExtensions
        ]
    , curatedSummary = summarizeResolved pruned.registry
    , unsatisfied =
        [ withMsg (display n.key)
        | n <- closure.unsatisfied
        , let withMsg = applyWhen (not (null n.condition)) (<> " (needs " <> n.condition <> ")")
        ]
    , legacyExcluded = map display closure.legacyExcluded
    , droppedResultCodes =
        [display cmd <> ": " <> display code | (cmd, code) <- pruned.notes.droppedResultCodes]
    , droppedSpirv =
        map ("capability: " <>) pruned.notes.droppedSpirvCapabilities
          <> map ("extension: " <>) pruned.notes.droppedSpirvExtensions
    , warnings = closure.warnings
    }
 where
  profile = getTyped @Profile cxt
  closure = getTyped @Closure cxt
  pruned = getTyped @Pruned cxt

  drift = case (profile.registry.headerVersion, profile.policy.warnOnRegistryDrift) of
    (Just expected, True)
      | expected /= pruned.registry.headerVersion ->
          Just
            ( "profile pins VK_HEADER_VERSION "
                <> T.show expected
                <> " but the registry is "
                <> T.show pruned.registry.headerVersion
            )
    _ -> Nothing

prettyReport :: CurationReport -> Doc AnsiStyle
prettyReport r =
  vsep
    . concat
    $ [ [annotate (color Cyan <> bold) $ "curation report:" <+> pretty r.profileName]
      , [indent 2 $ annotate bold "registry: header version" <+> pretty r.headerVersion]
      , [ indent 2 $ annotate (color Red <> italicized) "DRIFT:" <+> pretty d
        | Just d <- [r.headerVersionDrift]
        ]
      , [indent 2 $ annotate bold "core versions:" <+> hsep (punctuate comma (map pretty r.coreVersions))]
      , [indent 2 $ annotate bold "extensions (" <> pretty (length r.selectedExtensions) <> "):"]
      , [ indent 4 $ pretty e.name <+> "—" <+> hsep (punctuate semi (map pretty e.reasons))
        | e <- r.selectedExtensions
        ]
      , prettyExcluded "unsatisfied (version-gated out)" r.unsatisfied
      , prettyExcluded "legacy-core excluded" r.legacyExcluded
      , prettyExcluded "dropped result codes" r.droppedResultCodes
      , prettyExcluded "dropped spirv entries" r.droppedSpirv
      , prettyExcluded "warnings" r.warnings
      ]

prettyExcluded :: (Pretty a) => Text -> [a] -> [Doc AnsiStyle]
prettyExcluded _ [] = []
prettyExcluded title items =
  annotate (color Yellow) (indent 2 (pretty title <+> "(" <> pretty (length items) <> "):"))
    : map (indent 4 . pretty) items
