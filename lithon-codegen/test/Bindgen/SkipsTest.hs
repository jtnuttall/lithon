{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The skip ledger end to end over toy headers: the seam reports every
-- skipped selection root, Info-level macro failures included, under the
-- quietest verbosity; the ledger attributes each skip to the unit whose
-- header declares it, a conflict with another header's macro included;
-- and a triaged toy ledger renders to a golden that names files, never the
-- toy root's absolute paths.
module Bindgen.SkipsTest (
  unit_skipsCapturedUnderQuiet,
  unit_ledgerAttributesToUnits,
  unit_crossHeaderConflictAttributed,
  test_unboundToyGolden,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.FilePath (takeFileName, (</>))
import Test.Tasty (TestTree)
import Test.Tasty.Golden (goldenVsStringDiff)
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure, (@?=))

import Bindgen.Support.Toy (
  ToyEnv (..),
  ToyHeader (..),
  invokeToyReporting,
  runToyChain,
  toyEnv,
  withToyRoot,
 )
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Driver (
  HeaderPlan (..),
  HeaderResult (..),
  HeaderUnit (..),
  Visitor (..),
  defaultSpecFileName,
 )
import Lithon.Codegen.Bindgen.Unbound (
  Disposition (..),
  LedgerRow (..),
  LedgerSource (..),
  UnboundConfig (..),
  UnboundGroup (..),
  reasonClass,
  renderUnbound,
  unboundDoc,
  unboundLedger,
 )

-- | One of each skip shape: a macro whose cast to a typedef fails to
-- typecheck (reported at Info, below a default run's output), a variadic
-- function, a @long double@ typedef and a function returning it, a
-- function over a type from a header the plan excludes, a function shadowed
-- by a same-name macro (both halves are dropped), one function that
-- binds, and a cast macro over a type parameter (which fails to parse)
-- used twice by another macro, whose typecheck failure names it once per
-- use: the ledger says it once (the @unbound-toy@ golden).
skipHeader :: Text
skipHeader =
  unlines
    [ "#ifndef TOY_SKIP_H"
    , "#define TOY_SKIP_H"
    , "#include <stddef.h>"
    , "#include \"toy_hidden.h\""
    , "typedef size_t toy_size;"
    , "#define TOY_MAX_SIZE ((toy_size)-1)"
    , "int toy_log(const char *fmt, ...);"
    , "typedef long double toy_wide;"
    , "toy_wide toy_wide_get(void);"
    , "toy_hidden toy_hidden_get(void);"
    , "void *toy_memcpy(void *dst, const void *src, size_t len);"
    , "#define toy_memcpy memcpy"
    , "int toy_ok(int x);"
    , "int toy_also(int x);"
    , "#define toy_cast(type, x) ((type)(x))"
    , "#define TOY_TWICE(x) (toy_cast(toy_size, x) + toy_cast(toy_size, x))"
    , "#endif"
    ]

hiddenHeader :: Text
hiddenHeader =
  unlines
    [ "#ifndef TOY_HIDDEN_H"
    , "#define TOY_HIDDEN_H"
    , "typedef struct toy_hidden { int x; } toy_hidden;"
    , "#endif"
    ]

-- | Includes @toy_skip.h@ and skips one of its own.
otherHeader :: Text
otherHeader =
  unlines
    [ "#ifndef TOY_OTHER_H"
    , "#define TOY_OTHER_H"
    , "#include \"toy_skip.h\""
    , "int toy_other_log(toy_size n, ...);"
    , "int toy_other_ok(toy_size n);"
    , "#endif"
    ]

toyHeaders :: [ToyHeader]
toyHeaders =
  [ ToyHeader{include = "toy" </> "toy_hidden.h", source = hiddenHeader}
  , ToyHeader{include = "toy" </> "toy_skip.h", source = skipHeader}
  , ToyHeader{include = "toy" </> "toy_other.h", source = otherHeader}
  ]

-- | @toy_skip.h@ and @toy_other.h@ are bound; @toy_hidden.h@ is not.
toyPlan :: HeaderPlan
toyPlan =
  HeaderPlan
    { baseNamespace = $$(Module.metaLit ["Toy", "Bindgen"])
    , mangle = def{Module.stripPrefix = Just "toy_", Module.segmentJoin = Module.JoinConcat}
    , projectHeader = \path -> case T.splitOn "/toy/" (T.pack path) of
        [_, basename]
          | not (T.null basename)
          , not ("/" `T.isInfixOf` basename) ->
              Just (toString basename)
        _ -> Nothing
    , includeArg = ("toy" </>)
    , excludedHeaders = ["toy_hidden.h"]
    , mainIncludes = ["toy/toy_other.h"]
    , specFileName = defaultSpecFileName
    }

-- | An override omitting @toy_ok@, so the ledger lists what overrides
-- omit.
omitOk :: Text
omitOk =
  unlines
    [ "version:"
    , "  hs_bindgen: 0.1.0"
    , "  binding_specification: \"1.0\""
    , "ctypes:"
    , "  - omit:"
    , "      headers: toy/toy_skip.h"
    , "      cname: toy_ok"
    ]

runChain :: String -> IO [HeaderResult ()]
runChain uniqueId =
  either (assertFailure . toString) pure
    =<< runToyChain
      (toyEnv uniqueId){overrides = [("toy_skip.yaml", omitOk)]}
      toyHeaders
      toyPlan
      Visitor{passes = mempty, finalize = \_ _ _ -> Right ()}

-- | A run under 'HB.Quiet' prints errors only, yet reports every skipped
-- root, in hs-bindgen's order: the Info-level macro failure, the
-- warning-level parse failures, the missing dependency, both halves of
-- the conflict, and the cast macro's parse failure and the failures of the
-- macro using it (its own, and its missing dependency's). The include
-- guard (an empty macro) is not a skip, and neither is anything of the
-- non-main @toy_hidden.h@ or @<stddef.h>@.
unit_skipsCapturedUnderQuiet :: Assertion
unit_skipsCapturedUnderQuiet = do
  (_, report) <-
    withToyRoot toyHeaders \root ->
      invokeToyReporting
        root
        (toyEnv "lithon-skips-quiet")
        "Toy.Skip"
        ["toy/toy_skip.h"]
        HB.collectArtefacts
  [(HB.renderCName s.name, map reasonClass (toList s.reasons)) | s <- report.skips]
    @?= [ ("macro TOY_MAX_SIZE", ["macro-typecheck"])
        , ("toy_log", ["variadic"])
        , ("toy_wide", ["parse"])
        , ("toy_wide_get", ["parse"])
        , ("toy_hidden_get", ["dependency"])
        , ("toy_memcpy", ["conflict"])
        , ("macro toy_memcpy", ["conflict"])
        , ("macro toy_cast", ["macro-parse"])
        , ("macro TOY_TWICE", ["dependency", "macro-typecheck"])
        ]
  report.omitted @?= []
  report.overrideProblems @?= []

-- | Through the whole fold: each unit's run reports its own header's
-- roots, and the ledger files each under that header, with the line it
-- is declared on.
unit_ledgerAttributesToUnits :: Assertion
unit_ledgerAttributesToUnits = do
  results <- runChain "lithon-skips-ledger"
  map (.unit.headerName) results @?= ["toy_skip.h", "toy_other.h"]
  [(row.key, row.header, row.line) | row <- unboundLedger toyPlan results]
    @?= [ ("macro TOY_MAX_SIZE", "toy_skip.h", 6)
        , ("toy_log", "toy_skip.h", 7)
        , ("toy_wide", "toy_skip.h", 8)
        , ("toy_wide_get", "toy_skip.h", 9)
        , ("toy_hidden_get", "toy_skip.h", 10)
        , ("toy_memcpy", "toy_skip.h", 11)
        , ("macro toy_memcpy", "toy_skip.h", 11)
        , ("macro toy_cast", "toy_skip.h", 15)
        , ("macro TOY_TWICE", "toy_skip.h", 16)
        , ("toy_other_log", "toy_other.h", 4)
        ]
  [map HB.renderCName r.report.omitted | r <- results] @?= [["toy_ok"], []]

-- | A function and a same-name macro in two bound headers: @toy_z.h@
-- declares @zz_conflict@ (line 4), then includes @toy_a.h@, whose macro
-- (line 3) shadows it (SDL's @SDL_memcpy@ shape, across headers).
-- @toy_a.h@'s own run binds the macro. @toy_z.h@'s run drops both halves
-- and reports each at the smallest of the conflict's locations,
-- @toy_a.h@'s, which the ledger used to drop as another header's; it now
-- files both under @toy_z.h@, at the line there (4, not the macro's 3). The
-- locations do not say which declaration is which, so the macro's row
-- lands there too: a row too many asks for a disposition, where a row too
-- few hid the function's skip.
unit_crossHeaderConflictAttributed :: Assertion
unit_crossHeaderConflictAttributed = do
  results <-
    either (assertFailure . toString) pure
      =<< runToyChain
        (toyEnv "lithon-skips-cross")
        [ ToyHeader{include = "toy" </> "toy_a.h", source = aHeader}
        , ToyHeader{include = "toy" </> "toy_z.h", source = zHeader}
        ]
        plan
        Visitor{passes = mempty, finalize = \_ _ _ -> Right ()}
  -- The shape under test: the conflict's first location is the macro's.
  [ ( r.unit.headerName
    , [(HB.renderCName s.name, takeFileName . (.path) <$> s.loc) | s <- r.report.skips]
    )
    | r <- results
    ]
    @?= [ ("toy_a.h", [])
        , ("toy_z.h", [("zz_conflict", Just "toy_a.h"), ("macro zz_conflict", Just "toy_a.h")])
        ]
  [(row.key, row.header, row.line) | row <- unboundLedger plan results]
    @?= [("zz_conflict", "toy_z.h", 4), ("macro zz_conflict", "toy_z.h", 4)]
 where
  plan = toyPlan{excludedHeaders = [], mainIncludes = ["toy/toy_z.h"]}
  aHeader =
    unlines
      [ "#ifndef TOY_A_H"
      , "#define TOY_A_H"
      , "#define zz_conflict 1"
      , "#endif"
      ]
  zHeader =
    unlines
      [ "#ifndef TOY_Z_H"
      , "#define TOY_Z_H"
      , "/* A later include's macro shadows this. */"
      , "int zz_conflict(int x);"
      , "#include \"toy_a.h\""
      , "#endif"
      ]

toyRegistry :: UnboundConfig
toyRegistry =
  UnboundConfig
    { groups =
        [ UnboundGroup
            { disposition = Shim
            , note = "Variadic; a C shim binds a fixed-arity twin."
            , issue = Nothing
            , names = ["toy_log", "toy_other_log"]
            }
        , UnboundGroup
            { disposition = Constant
            , note = "A cast to a typedef; the typed constant carries the value."
            , issue = Nothing
            , names = ["macro TOY_MAX_SIZE"]
            }
        , UnboundGroup
            { disposition = Upstream
            , note = "A function shadowed by a same-name macro; hs-bindgen drops both."
            , issue = Just "https://github.com/well-typed/hs-bindgen/issues/2097"
            , names = ["toy_memcpy", "macro toy_memcpy"]
            }
        , UnboundGroup
            { disposition = WontFix
            , note = "No Haskell FFI type for long double; the hidden type is never bound."
            , issue = Nothing
            , names = ["toy_wide", "toy_wide_get", "toy_hidden_get"]
            }
        , UnboundGroup
            { disposition = WontFix
            , note = "A cast over a type parameter, and a macro casting through it twice."
            , issue = Nothing
            , names = ["macro toy_cast", "macro TOY_TWICE"]
            }
        ]
    }

-- | The triaged toy ledger. The toy root is a fresh temporary directory per
-- run, so a path leaking into the document breaks the golden; the test
-- also checks that no word of it is an absolute path.
test_unboundToyGolden :: TestTree
test_unboundToyGolden =
  goldenVsStringDiff
    "unbound-toy"
    (\ref new -> ["diff", "-u", ref, new])
    ("test/golden/bindgen" </> "unbound-toy.golden")
    do
      results <- runChain "lithon-skips-golden"
      doc <-
        either (\errs -> assertFailure ("triage failed:" <> toString (display errs))) pure
          $ unboundDoc LedgerSource{key = "toy", library = "Toy 1.0"} toyPlan toyRegistry results
      let rendered = renderUnbound doc
          absolute =
            [ word
            | word <- T.words rendered
            , "/" `T.isPrefixOf` T.dropWhile (`elem` ("\"'`([<" :: String)) word
            ]
      assertBool ("absolute paths in the ledger: " <> show absolute) (null absolute)
      pure (LBS.fromStrict (TE.encodeUtf8 rendered))
