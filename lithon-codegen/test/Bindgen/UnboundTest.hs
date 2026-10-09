{-# LANGUAGE OverloadedStrings #-}

-- | The skip ledger's registry and triage, without hs-bindgen: the codec
-- (dispositions are a closed set, a note may not be blank), and the
-- two-way join of the registry with the ledger rows (a skip without a
-- disposition, a disposition for a name no longer skipped, a name listed
-- twice, and an empty group are each an error, all reported together),
-- the checks of @constant@ dispositions against the planned constants and
-- of @shim@ dispositions against the bound authored functions, and the
-- bootstrap snippets.
module Bindgen.UnboundTest (
  unit_completeTriageGroupsRows,
  unit_untriagedRejected,
  unit_staleRejected,
  unit_duplicateRejected,
  unit_emptyGroupRejected,
  unit_errorsAccumulate,
  unit_constantDispositionsBound,
  unit_constantMissingRejected,
  unit_shimDispositionsBound,
  unit_shimMissingRejected,
  unit_snippetsGroupByClass,
  unit_codecRoundTrips,
  unit_codecRejectsUnknownDisposition,
  unit_codecRejectsBlankNote,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.Text qualified as T
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure, (@?=))

import Lithon.Codegen.Bindgen.Unbound (
  Disposition (..),
  LedgerRow (..),
  TriagedGroup (..),
  UnboundConfig (..),
  UnboundError (..),
  UnboundGroup (..),
  decodeUnboundConfig,
  encodeUnboundConfig,
  untriagedSnippets,
  validateConstantDispositions,
  validateShimDispositions,
  validateUnbound,
 )

row :: HB.Namespace -> Text -> FilePath -> Int -> HB.SkipReason -> LedgerRow
row namespace text header line reason =
  LedgerRow
    { key = HB.renderCName name
    , name
    , header
    , line
    , reasons = reason :| []
    }
 where
  name = HB.CName{text, namespace, unnamed = False}

variadic, typecheck :: HB.SkipReason
variadic = HB.SkipUnusable HB.UnsupportedVariadic
typecheck = HB.SkipUnusable (HB.MacroTypecheckFailed "Failed to typecheck macro")

rows :: [LedgerRow]
rows =
  [ row HB.Ordinary "SDL_LogWarn" "SDL_log.h" 300 variadic
  , row HB.Ordinary "SDL_Log" "SDL_log.h" 200 variadic
  , row HB.Macro "SDL_MAX_SINT8" "SDL_stdinc.h" 40 typecheck
  ]

groupOf :: Disposition -> [Text] -> UnboundGroup
groupOf disposition names =
  UnboundGroup{disposition, note = "why " <> dispositionWord disposition, issue = Nothing, names}
 where
  dispositionWord = T.toLower . show

complete :: UnboundConfig
complete =
  UnboundConfig
    { groups =
        [ groupOf Shim ["SDL_LogWarn", "SDL_Log"]
        , groupOf Constant ["macro SDL_MAX_SINT8"]
        ]
    }

errorsOf :: UnboundConfig -> [LedgerRow] -> IO [UnboundError]
errorsOf config ledger = case validateUnbound config ledger of
  Right _ -> assertFailure "expected the triage to fail"
  Left errs -> pure (toList errs)

-- | Every row triaged exactly once: each group gets its rows, sorted by
-- header, then line, and the groups keep registry order.
unit_completeTriageGroupsRows :: Assertion
unit_completeTriageGroupsRows = case validateUnbound complete rows of
  Left errs -> assertFailure ("triage failed:" <> toString (display errs))
  Right groups ->
    [(g.entry.disposition, map (.key) g.rows) | g <- groups]
      @?= [(Shim, ["SDL_Log", "SDL_LogWarn"]), (Constant, ["macro SDL_MAX_SINT8"])]

unit_untriagedRejected :: Assertion
unit_untriagedRejected = do
  errs <- errorsOf complete{groups = take 1 complete.groups} rows
  errs
    @?= [ UnboundUntriaged
            { name = "macro SDL_MAX_SINT8"
            , header = "SDL_stdinc.h"
            , line = 40
            , reasonClass = "macro-typecheck"
            }
        ]

-- | A name that is listed but no longer skipped (bound now, or renamed
-- upstream) is stale, with the disposition it had.
unit_staleRejected :: Assertion
unit_staleRejected = do
  errs <- errorsOf complete{groups = complete.groups <> [groupOf Upstream ["SDL_memcpy"]]} rows
  errs @?= [UnboundStale{name = "SDL_memcpy", disposition = Upstream}]

unit_duplicateRejected :: Assertion
unit_duplicateRejected = do
  errs <- errorsOf complete{groups = complete.groups <> [groupOf WontFix ["SDL_Log"]]} rows
  errs @?= [UnboundDuplicate{name = "SDL_Log", dispositions = [Shim, WontFix]}]

unit_emptyGroupRejected :: Assertion
unit_emptyGroupRejected = do
  errs <- errorsOf complete{groups = complete.groups <> [groupOf WontFix []]} rows
  errs @?= [UnboundEmptyGroup{disposition = WontFix, note = "why wontfix"}]

-- | One run reports every disagreement, untriaged rows first.
unit_errorsAccumulate :: Assertion
unit_errorsAccumulate = do
  errs <-
    errorsOf
      UnboundConfig{groups = [groupOf Shim ["SDL_Log", "SDL_gone"], groupOf WontFix []]}
      rows
  map kind errs @?= ["untriaged", "untriaged", "stale", "empty"]
 where
  kind :: UnboundError -> Text
  kind = \case
    UnboundUntriaged{} -> "untriaged"
    UnboundStale{} -> "stale"
    UnboundDuplicate{} -> "duplicate"
    UnboundEmptyGroup{} -> "empty"
    UnboundConstantMissing{} -> "constant"
    UnboundShimMissing{} -> "shim"

-- | A @constant@ disposition holds when a constants.json group binds the
-- macro. constants.json may bind more, including macros hs-bindgen binds
-- itself, and the other dispositions are not its business.
unit_constantDispositionsBound :: Assertion
unit_constantDispositionsBound =
  validateConstantDispositions complete (fromList ["SDL_MAX_SINT8", "SDL_INIT_VIDEO"]) @?= Right ()

-- | A @constant@ name no group binds is an error, every one reported. The
-- names are rendered: an ordinary name is never a bound macro.
unit_constantMissingRejected :: Assertion
unit_constantMissingRejected =
  case validateConstantDispositions config (fromList ["SDL_MAX_SINT8", "SDL_SIZE_MAX"]) of
    Right () -> assertFailure "expected the check to fail"
    Left errs -> do
      toList errs
        @?= [ UnboundConstantMissing{name = "macro SDL_MIN_SINT8"}
            , UnboundConstantMissing{name = "SDL_SIZE_MAX"}
            ]
      assertBool
        ("the message: " <> toString (display errs))
        ( ( "macro SDL_MIN_SINT8: disposition constant, but no constants.json group binds it;"
              <> " add it to a constants.json group or change its disposition"
          )
            `T.isInfixOf` display errs
        )
 where
  config = complete{groups = complete.groups <> [groupOf Constant ["macro SDL_MIN_SINT8", "SDL_SIZE_MAX"]]}

-- | A @shim@ disposition holds when an authored function named the prefix
-- and the listed name's C identifier is bound; the authored headers may
-- bind more (a shim over a macro hs-bindgen binds itself).
unit_shimDispositionsBound :: Assertion
unit_shimDispositionsBound =
  validateShimDispositions
    (Just "lithon_")
    complete{groups = complete.groups <> [groupOf Shim ["macro SDL_FOURCC"]]}
    (fromList ["lithon_SDL_Log", "lithon_SDL_LogWarn", "lithon_SDL_FOURCC", "lithon_SDL_Swap16LE"])
    @?= Right ()

-- | A @shim@ name no authored function binds is an error naming the
-- function it needs, every one reported; for a target that authors no C
-- headers, every @shim@ name is.
unit_shimMissingRejected :: Assertion
unit_shimMissingRejected = do
  case validateShimDispositions (Just "lithon_") config (fromList ["lithon_SDL_Log"]) of
    Right () -> assertFailure "expected the check to fail"
    Left errs -> do
      toList errs
        @?= [ UnboundShimMissing{name = "SDL_LogWarn", shim = Just "lithon_SDL_LogWarn"}
            , UnboundShimMissing{name = "macro SDL_FOURCC", shim = Just "lithon_SDL_FOURCC"}
            ]
      assertBool
        ("the message: " <> toString (display errs))
        ( "macro SDL_FOURCC: disposition shim, but no authored C header binds lithon_SDL_FOURCC"
            `T.isInfixOf` display errs
        )
  case validateShimDispositions Nothing complete mempty of
    Right () -> assertFailure "expected the check to fail"
    Left errs ->
      toList errs
        @?= [ UnboundShimMissing{name = "SDL_LogWarn", shim = Nothing}
            , UnboundShimMissing{name = "SDL_Log", shim = Nothing}
            ]
 where
  config = complete{groups = complete.groups <> [groupOf Shim ["macro SDL_FOURCC"]]}

-- | The bootstrap snippets: one group per reason class, in the order the
-- classes first appear, each name once.
unit_snippetsGroupByClass :: Assertion
unit_snippetsGroupByClass = do
  errs <- errorsOf UnboundConfig{groups = []} (rows <> take 1 rows)
  let snippets = untriagedSnippets errs
  length snippets @?= 2
  case snippets of
    [variadics, typechecks] -> do
      assertBool
        ("variadic first: " <> toString variadics)
        ("TODO: why (variadic)" `T.isInfixOf` variadics)
      T.count "\"SDL_LogWarn\"" variadics @?= 1
      assertBool "the typecheck group" ("\"macro SDL_MAX_SINT8\"" `T.isInfixOf` typechecks)
    _other -> assertFailure "expected two snippets"

unit_codecRoundTrips :: Assertion
unit_codecRoundTrips = do
  let config = complete{groups = [(groupOf Upstream ["SDL_memcpy"]){issue = Just "https://example.org/1"}]}
  decodeUnboundConfig (encodeUnboundConfig config) @?= Right config

unit_codecRejectsUnknownDisposition :: Assertion
unit_codecRejectsUnknownDisposition =
  assertBool "decoded an unknown disposition"
    . isLeft
    . decodeUnboundConfig
    $ registryWith "{\"disposition\": \"later\", \"note\": \"why\", \"names\": [\"SDL_Log\"]}"

unit_codecRejectsBlankNote :: Assertion
unit_codecRejectsBlankNote =
  assertBool "decoded a blank note"
    . isLeft
    . decodeUnboundConfig
    $ registryWith "{\"disposition\": \"wontfix\", \"note\": \"  \", \"names\": [\"SDL_Log\"]}"

registryWith :: LBS.ByteString -> LBS.ByteString
registryWith g = "{\"groups\": [" <> g <> "]}"
