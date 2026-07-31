{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

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
import Data.FileEmbed (embedFileRelative, makeRelativeToProject)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Language.Haskell.TH (stringE)
import Lithon.Prelude
import System.Directory (listDirectory)
import Test.Tasty (TestTree)
import Test.Tasty.Golden (goldenVsStringDiff)

import Lithon.Codegen.Backend.Emit (Manifest (..), manifestFileName)
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Sdl3.Alias (sysModuleName, sysNamespace)
import Lithon.Codegen.Sdl3.Alias.Config (AliasConfig (..), FunctionEntry (..), decodeAliasConfig)
import Lithon.Codegen.Sdl3.Alias.Names (Safety (..))
import Lithon.Codegen.Sdl3.Bindgen (baseNamespace, sdl3ModuleFor)

packageDir, specDir :: FilePath
packageDir = $(stringE =<< makeRelativeToProject "../sdl3-bindgen-sys")
specDir = $(stringE =<< makeRelativeToProject "data/sdl3/spec")

aliasesRegistry :: AliasConfig
aliasesRegistry = case decodeAliasConfig $ LBS.fromStrict $(embedFileRelative "data/sdl3/aliases.json") of
  Left e -> error $ "aliases.json failed to decode: " <> show e
  Right a -> a

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
          length [() | e <- Map.elems aliasesRegistry.functions, e.safety == safety]
    wrapperModules <- countWrapperModules srcPaths
    pure
      $ LBS.fromStrict
      . TE.encodeUtf8
      . T.unlines
      $ [ "namespace: " <> Module.hsName baseNamespace
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
        , "facades: " <> T.unwords facades
        , "per-header:"
        ]
      <> map headerLine headers

-- | Header basename -> dotted module name, through the chain's own minting
-- ('sdl3ModuleFor') — the census cannot drift from generation.
runMangle :: FilePath -> Either Text Text
runMangle = bimap display Module.hsName . sdl3ModuleFor

-- | How many committed source modules embed C via the Template Haskell
-- @addCSource@ splice.
countWrapperModules :: [FilePath] -> IO Int
countWrapperModules srcPaths =
  fmap (length . filter id) . forM srcPaths $ \path -> do
    contents <- decodeUtf8 @Text <$> BS.readFile (packageDir <> "/" <> path)
    pure ("addCSource" `T.isInfixOf` contents)
