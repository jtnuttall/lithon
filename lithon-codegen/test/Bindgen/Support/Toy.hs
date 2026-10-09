{-# LANGUAGE OverloadedStrings #-}

-- | The shared toy-header harness: write toy headers under a fresh
-- temporary include root and drive them through the real hs-bindgen seam
-- ('runToy', 'toyArtefacts') or the whole generic fold ('runToyChain').
--
-- The include root is unique per call (a fixed shared name raced under
-- tasty parallelism and was squattable in a shared @\/tmp@) and dies with
-- the bracket; everything the tests keep derives from the in-memory
-- results. A test that must read a file the invocation wrote (a binding
-- spec) does so inside 'withToyRoot'.
module Bindgen.Support.Toy (
  -- * Toy inputs
  ToyHeader (..),
  ToyEnv (..),
  toyEnv,

  -- * Seam invocations
  withToyRoot,
  invokeToy,
  runToy,
  toyArtefacts,
  renderedPairs,
  wrapperC,

  -- * The generic fold
  runToyChain,
) where

import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Effectful (runEff)
import Lithon.Effect.Error
import Lithon.Effect.Log (runLog)
import Lithon.Effect.Temporary (runTemporary)
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.Directory (createDirectoryIfMissing)
import System.FilePath (takeDirectory, (</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty.HUnit (assertFailure)

import Lithon.Codegen.Bindgen.Driver (
  DriverError,
  DriverOpts (..),
  HeaderPlan,
  HeaderResult,
  PackageInfo (..),
  Visitor,
  runDriver,
  runHeaderChain,
 )

-- | One toy header: its path under the include root — also its
-- hash-include argument (@SDL_toy.h@, @SDL3\/SDL_main.h@) — and its text.
data ToyHeader = ToyHeader
  { include :: FilePath
  , source :: Text
  }

-- | The per-test invocation knobs ('HB.InvocationEnv' minus the include
-- root, which the harness owns). 'uniqueId' seeds hs-bindgen's wrapper
-- symbol hashes, so a golden pins its test's value: keep each test's
-- own.
data ToyEnv = ToyEnv
  { uniqueId :: String
  , fieldNaming :: HB.FieldNamingStrategy
  , doxygenAliases :: [(Text, Text)]
  , defineMacros :: [(Text, Text)]
  -- ^ @(name, body)@; an empty body is a bare @#define name@.
  }

-- | A toy environment with hs-bindgen's prefixed field naming, no doxygen
-- aliases, and no defines.
toyEnv :: String -> ToyEnv
toyEnv uniqueId =
  ToyEnv
    { uniqueId
    , fieldNaming = HB.AddFieldPrefixes
    , doxygenAliases = []
    , defineMacros = []
    }

invocationEnv :: ToyEnv -> FilePath -> HB.InvocationEnv
invocationEnv env root =
  HB.InvocationEnv
    { extraIncludeDirs = [root]
    , defineMacros = env.defineMacros
    , doxygenAliases = env.doxygenAliases
    , fieldNaming = env.fieldNaming
    , uniqueId = env.uniqueId
    , -- The tests read results, not hs-bindgen's traces.
      verbosity = HB.Quiet
    }

-- | Write the headers under a fresh temporary include root and hand the
-- continuation its path.
withToyRoot :: [ToyHeader] -> (FilePath -> IO a) -> IO a
withToyRoot headers k = withSystemTempDirectory "lithon-toy" \root -> do
  for_ headers \h -> do
    createDirectoryIfMissing True (takeDirectory (root </> h.include))
    TIO.writeFile (root </> h.include) h.source
  k root

-- | One seam invocation under an existing include root: the given base
-- module and includes, no prior specs, no prescriptive spec. A bindgen
-- failure fails the test.
invokeToy :: FilePath -> ToyEnv -> Text -> [FilePath] -> HB.BindgenM a -> IO a
invokeToy root env baseModule includes ops = do
  eres <-
    HB.runBindgen
      (invocationEnv env root)
      HB.InvocationSpec
        { baseModule
        , includes
        , priorSpecs = []
        , prescriptiveSpec = Nothing
        }
      ops
  either (\err -> assertFailure ("bindgen error: " <> toString (display err))) pure eres

-- | One seam invocation over the toy headers (each one an include, in
-- list order) under the given base module.
runToy :: ToyEnv -> Text -> [ToyHeader] -> HB.BindgenM a -> IO a
runToy env baseModule headers ops =
  withToyRoot headers \root -> invokeToy root env baseModule (map (.include) headers) ops

-- | One header through the same artefact demands the generic driver
-- makes of every header ('HB.collectArtefacts').
toyArtefacts :: ToyEnv -> Text -> ToyHeader -> IO HB.HeaderArtefacts
toyArtefacts env baseModule header = runToy env baseModule [header] HB.collectArtefacts

-- | Project a rendered family onto (dotted name, source) pairs — the seam
-- types deliberately carry no 'Eq'\/'Show'.
renderedPairs :: [HB.NameableModule HB.RenderedHsModule] -> [(Text, Text)]
renderedPairs = map \m -> (HB.moduleName m, m.hsModule.text)

-- | The C source of a rendered module's wrapper splice
-- (@addCSource (unlines [ "…", … ])@), one element per line.
wrapperC :: Text -> [Text]
wrapperC source =
  [ toText c
  | line <- dropWhile (not . T.isInfixOf "addCSource") (T.lines source)
  , Just literal <- [T.stripPrefix "[ " (T.stripStart line) <|> T.stripPrefix ", " (T.stripStart line)]
  , Just (c :: String) <- [readMaybe (toString literal)]
  ]

-- | The whole generic fold ('runHeaderChain': preflight, plan, chain)
-- over the toy headers under the real effect stack. 'Left' carries the
-- displayed error, so tests can assert on what a user would read.
runToyChain :: ToyEnv -> [ToyHeader] -> HeaderPlan -> Visitor r -> IO (Either Text [HeaderResult r])
runToyChain env headers plan visitor = withToyRoot headers \root ->
  fmap (first snd)
    . runEff
    . runLog "toy-chain"
    . runError @Text
    . runErrorDisplay @DriverError
    . runTemporary
    . runDriver
      DriverOpts
        { invocationEnv = invocationEnv env root
        , prescriptiveSpec = Nothing
        , packageInfo = PackageInfo{name = toText env.uniqueId, dataDir = root, version = Nothing}
        }
    $ runHeaderChain plan visitor
