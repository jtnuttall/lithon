{-# LANGUAGE OverloadedStrings #-}

-- | Census golden over the COMMITTED sdl3 artifacts (like the Vulkan
-- 382-wrapper census): per-header category-module coverage, spec
-- inventory, and the wrapper-splice count, all derived from the checked-in
-- tree — no libclang, no SDL headers. Live drift against the environment
-- is scripts\/check.sh's @sdl3 generate --check@; THIS golden is the
-- reviewable record of the generated surface's shape.
module Sdl3.CensusTest (test_sdl3Census) where

import Data.Aeson qualified as Aeson
import Data.ByteString qualified as BS
import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Effectful (runPureEff)
import Effectful.Error.Dynamic (runErrorNoCallStack)
import System.Directory (listDirectory)
import Test.Tasty (TestTree)
import Test.Tasty.Golden (goldenVsStringDiff)

import Lithon.Codegen.Backend.Emit (Manifest (..), manifestFileName)
import Lithon.Codegen.Prelude
import Lithon.Codegen.Sdl3.Alias (sysModuleName, sysNamespace)
import Lithon.Codegen.Sdl3.Alias.Config (AliasConfig (..), FunctionEntry (..), decodeAliasConfig)
import Lithon.Codegen.Sdl3.Alias.Names (Safety (..))
import Lithon.Codegen.Sdl3.Bindgen (BindgenError, baseNamespace, mangleModule)

-- Paths are relative to the lithon-codegen package directory (the test
-- CWD under `cabal test`).
packageDir, specDir :: FilePath
packageDir = "../sdl3-bindgen-sys"
specDir = "sdl3/spec"

categories :: [(Text, Text)]
categories =
  [ ("types", "")
  , ("safe", ".Safe")
  , ("unsafe", ".Unsafe")
  , ("funptr", ".FunPtr")
  , ("global", ".Global")
  ]

test_sdl3Census :: TestTree
test_sdl3Census =
  goldenVsStringDiff
    "sdl3-census"
    (\ref new -> ["diff", "-u", ref, new])
    "test/golden/sdl3/census.golden"
    render
 where
  render = do
    manifest :: Manifest <-
      maybe (error "unreadable sdl3-bindgen-sys manifest") pure
        . Aeson.decode
        =<< LBS.readFile (packageDir <> "/" <> manifestFileName)
    registry <-
      either (error . ("unreadable aliases.json: " <>)) pure
        . decodeAliasConfig
        =<< LBS.readFile "sdl3/aliases.json"
    specs <- sort . map T.pack <$> listDirectory specDir
    let srcPaths = [p | p <- Map.keys manifest.files, "src/" `isPrefixOf` p]
        moduleNames =
          fromList @(Set Text)
            [ T.replace "/" "." (T.dropEnd 3 (T.drop 4 (T.pack path)))
            | path <- srcPaths
            , ".hs" `T.isSuffixOf` T.pack path
            ]
        headers = [T.dropEnd 5 spec <> ".h" | spec <- specs]
        familyOf header =
          either error id (runMangle (toString header))
        sysOf header =
          either error id (sysModuleName (familyOf header))
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
        classified safety =
          length [() | e <- Map.elems registry.functions, e.safety == safety]
    wrapperModules <- countWrapperModules srcPaths
    pure
      $ LBS.fromStrict
      . TE.encodeUtf8
      . T.unlines
      $ [ "namespace: " <> baseNamespace
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
            <> T.show (Map.size registry.renames)
            <> " skip="
            <> T.show (length registry.skip)
        , "facades: " <> T.unwords facades
        , "per-header:"
        ]
      <> map headerLine headers

-- | 'mangleModule' now runs in 'Eff' with an @Error BindgenError@ effect;
-- discharge it purely and surface the error as text for @error@.
runMangle :: FilePath -> Either Text Text
runMangle = first display . runPureEff . runErrorNoCallStack @BindgenError . mangleModule

-- | How many committed source modules embed C via the Template Haskell
-- @addCSource@ splice.
countWrapperModules :: [FilePath] -> IO Int
countWrapperModules srcPaths =
  fmap (length . filter id) . forM srcPaths $ \path -> do
    contents <- decodeUtf8 @Text <$> BS.readFile (packageDir <> "/" <> path)
    pure ("addCSource" `T.isInfixOf` contents)
