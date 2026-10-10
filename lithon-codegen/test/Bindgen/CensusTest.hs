{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Census golden over each registered target's COMMITTED artifacts (like
-- the Vulkan 382-wrapper census): per-header category-module coverage,
-- spec inventory, the wrapper-splice count, and the skip ledger's
-- totals by disposition, all derived from the checked-in tree — no
-- libclang, no library headers. Live drift against
-- the environment is scripts\/check.sh's @\<key\> generate --check@;
-- THESE goldens (@test\/golden\/\<key\>\/census.golden@) are the
-- reviewable record of each generated surface's shape.
module Bindgen.CensusTest (test_census, test_allowBoundMatchesCensus) where

import Data.Aeson qualified as Aeson
import Data.ByteString qualified as BS
import Data.ByteString.Lazy qualified as LBS
import Data.FileEmbed (makeRelativeToProject)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Language.Haskell.TH (stringE)
import Lithon.Prelude
import System.Directory (listDirectory)
import System.FilePath ((</>))
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.Golden (goldenVsStringDiff)
import Test.Tasty.HUnit (assertFailure, testCase, (@?=))

import Lithon.Codegen.Backend.Emit (Manifest (..), manifestFileName)
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Alias (sysModuleName)
import Lithon.Codegen.Bindgen.Alias.Config (
  AliasConfig (..),
  AllowEntry (..),
  FunctionEntry (..),
  decodeAliasConfig,
 )
import Lithon.Codegen.Bindgen.Alias.Names (Safety (..))
import Lithon.Codegen.Bindgen.Target (BindgenTarget (..), bindgenNamespaceText, moduleFor)
import Lithon.Codegen.Bindgen.Targets (bindgenTargets)
import Lithon.Codegen.Bindgen.Unbound (
  UnboundConfig (..),
  UnboundGroup (..),
  decodeUnboundConfig,
  dispositionText,
 )

-- | The lithon-codegen package directory; every target's committed
-- artifacts derive from it: @..\/\<packageName\>@ and
-- @data\/\<key\>\/@.
projectDir :: FilePath
projectDir = $(stringE =<< makeRelativeToProject ".")

categories :: [(Text, Text)]
categories =
  [ ("types", "")
  , ("safe", ".Safe")
  , ("unsafe", ".Unsafe")
  , ("funptr", ".FunPtr")
  , ("global", ".Global")
  ]

test_census :: TestTree
test_census = testGroup "census" (map census bindgenTargets)

census :: BindgenTarget -> TestTree
census target =
  goldenVsStringDiff
    (toString target.key <> "-census")
    (\ref new -> ["diff", "-u", ref, new])
    ("test/golden" </> toString target.key </> "census.golden")
    render
 where
  packageDir = projectDir </> ".." </> toString target.packageName
  dataDir = projectDir </> "data" </> toString target.key
  render = do
    manifest :: Manifest <-
      maybe (error ("unreadable " <> target.packageName <> " manifest")) pure
        . Aeson.decode
        =<< LBS.readFile (packageDir </> manifestFileName)
    aliasesRegistry :: AliasConfig <-
      either (\e -> error ("aliases.json failed to decode: " <> show e)) pure
        . decodeAliasConfig
        =<< LBS.readFile (dataDir </> "aliases.json")
    unboundRegistry :: UnboundConfig <-
      either (\e -> error ("unbound.json failed to decode: " <> show e)) pure
        . decodeUnboundConfig
        =<< LBS.readFile (dataDir </> "unbound.json")
    specs <- sort . map T.pack <$> listDirectory (dataDir </> "spec")
    let srcPaths = [p | p <- Map.keys manifest.files, "src/" `isPrefixOf` p]
        moduleNames =
          fromList @(Set Text)
            [ T.replace "/" "." (T.dropEnd 3 (T.drop 4 (T.pack path)))
            | path <- srcPaths
            , ".hs" `T.isSuffixOf` T.pack path
            ]
        headers = [T.dropEnd 5 spec <> ".h" | spec <- specs]
        sysNamespace = Module.hsName target.namespace
        familyOf header =
          either error id (runMangle (toString header))
        sysOf header =
          either error id (sysModuleName target (familyOf header))
        familyModules =
          fromList @(Set Text)
            [ familyOf header <> suffix
            | header <- headers
            , (_, suffix) <- categories
            ]
        curatedModules =
          fromList @(Set Text)
            (sysNamespace : [sysOf header | header <- headers])
            `Set.intersection` moduleNames
        headerLine header =
          let base = familyOf header
              present =
                [label | (label, suffix) <- categories, (base <> suffix) `Set.member` moduleNames]
                  <> ["sys" | sysOf header `Set.member` moduleNames]
           in "  " <> header <> ": " <> T.unwords present
        facades =
          Set.toList
            (moduleNames `Set.difference` familyModules `Set.difference` curatedModules)
        unboundTotals =
          Map.fromListWith (+) [(g.disposition, length g.names) | g <- unboundRegistry.groups]
        classified safety =
          length [() | e <- Map.elems aliasesRegistry.functions, e.safety == safety]
    wrapperModules <- countWrapperModules packageDir srcPaths
    pure
      $ LBS.fromStrict
      . TE.encodeUtf8
      . T.unlines
      $ [ "namespace: " <> bindgenNamespaceText target
        , "curated namespace: " <> sysNamespace
        , "headers (specs): " <> T.show (length specs)
        , "modules: " <> T.show (Set.size moduleNames)
        , "curated modules: " <> T.show (Set.size curatedModules)
        , "wrapper-splice modules: " <> T.show wrapperModules
        , "registry: both="
            <> T.show (classified Both)
            <> " safe-only="
            <> T.show (classified SafeOnly)
            <> " unsafe-only="
            <> T.show (classified UnsafeOnly)
            <> " renames="
            <> T.show (Map.size aliasesRegistry.renames)
            <> " skip="
            <> T.show (length aliasesRegistry.skip)
            <> " allow="
            <> T.show (Map.size aliasesRegistry.allow)
            <> "/"
            <> T.show (sum (map (length . (.names)) (Map.elems aliasesRegistry.allow)))
        , "unbound:"
            <> T.concat
              [ " " <> dispositionText d <> "=" <> T.show (Map.findWithDefault 0 d unboundTotals)
              | d <- [minBound .. maxBound]
              ]
        , "facades: " <> T.unwords facades
        , "per-header:"
        ]
      <> map headerLine headers

  -- Header basename -> dotted module name, through the chain's own
  -- minting ('moduleFor') — the census cannot drift from generation.
  runMangle :: FilePath -> Either Text Text
  runMangle = bimap display Module.hsName . moduleFor target

-- | Each committed allowlist's @bound@ is its header's committed census:
-- the functions its raw family's @.Unsafe@ module exports (one per bound
-- function). Generation enforces the same equality against the live
-- census; this pins the committed pair.
test_allowBoundMatchesCensus :: TestTree
test_allowBoundMatchesCensus =
  testGroup "allow-bound" [testCase (toString target.key) (check target) | target <- bindgenTargets]
 where
  check target = do
    registry <-
      either (\e -> assertFailure ("aliases.json failed to decode: " <> show e)) pure
        . decodeAliasConfig
        =<< LBS.readFile (projectDir </> "data" </> toString target.key </> "aliases.json")
    for_ (Map.toList registry.allow) \(header, entry) -> do
      unsafeModule <-
        either (assertFailure . toString . display) (pure . (<> ".Unsafe") . Module.hsName)
          $ moduleFor target (toString header)
      let unsafePath =
            projectDir
              </> ".."
              </> toString target.packageName
              </> "src"
              </> toString (T.replace "." "/" unsafeModule <> ".hs")
      exports <-
        length
          . filter (("  " <> unsafeModule <> ".") `T.isPrefixOf`)
          . T.lines
          . decodeUtf8
          <$> BS.readFile unsafePath
      (header, exports) @?= (header, entry.bound)

-- | How many committed source modules embed C via the Template Haskell
-- @addCSource@ splice.
countWrapperModules :: FilePath -> [FilePath] -> IO Int
countWrapperModules packageDir srcPaths =
  fmap (length . filter id) . forM srcPaths $ \path -> do
    contents <- decodeUtf8 @Text <$> BS.readFile (packageDir </> path)
    pure ("addCSource" `T.isInfixOf` contents)
