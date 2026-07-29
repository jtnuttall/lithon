{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Assembling the @sdl3-bindgen-sys@ package itself. The code generator
-- owns everything in the package; nothing in it is ever edited by hand.
module Lithon.Codegen.Sdl3.Package (
  FileTree (..),
  assemblePackage,
  packageYaml,
  readme,
  changelog,
) where

import Data.FileEmbed (embedFileRelative)
import Data.List.Extra (dropPrefix)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Text.Encoding qualified as T
import Effectful
import Effectful.FileSystem.IO.ByteString qualified as EBS
import Lithon.Effect.FileSystem
import Lithon.Effect.Log
import Lithon.Prelude
import System.FilePath (addTrailingPathSeparator, isRelative, joinPath, (</>))

import Lithon.Codegen.Backend.Hs (moduleNameFilePath)
import Lithon.Codegen.Sdl3.Abi (AbiMacroConst, renderAbiAssertions)
import Lithon.Codegen.Sdl3.Bindgen (HeaderResult (..), baseNamespace, mainIncludes)

-- | The pinned submodules' runtime sources and licenses.
vendorRuntimeDir, vendorCExprDir :: FilePath
vendorRuntimeDir = joinPath ["lithon-hs-bindgen", "vendor", "hs-bindgen", "hs-bindgen-runtime"]
vendorCExprDir = joinPath ["lithon-hs-bindgen", "vendor", "c-expr"]

-- | Build the full file map for the package directory: generated Bindgen
-- modules, the rendered @SDL3.Sys.*@ alias layer, runtime copies, facades,
-- and metadata.
assemblePackage
  :: (HasCallStack, FileSystem :> es, Log :> es)
  => [(Text, Text)]
  -> [AbiMacroConst]
  -- ^ Probed typed-constant values (curated layer), re-asserted in the TU.
  -> [HeaderResult]
  -> Eff es (Either Text FileTree)
assemblePackage aliasModules macroConsts results = do
  runtime <- readTree (vendorRuntimeDir </> "src") "runtime"
  -- c-expr-runtime keeps two source dirs upstream (core + lib); the module
  -- trees are disjoint, so they merge into one here.
  cexprCore <- readTree (vendorCExprDir </> "c-expr-runtime" </> "core") "runtime-cexpr"
  cexprLib <- readTree (vendorCExprDir </> "c-expr-runtime" </> "lib") "runtime-cexpr"
  hsBindgenLicense <- decodeUtf8 <$> EBS.readFile (vendorRuntimeDir </> "LICENSE")
  cexprLicense <- decodeUtf8 <$> EBS.readFile (vendorCExprDir </> "LICENSE")
  logInfo "Resolved file trees"

  pure do
    let generated =
          Map.fromList
            [ (moduleNameFilePath name, source)
            | r <- results
            , (name, source) <- r.modules
            ]
        aliases =
          Map.fromList
            [ (moduleNameFilePath name, source)
            | (name, source) <- aliasModules
            ]
        census = runtimeImports (Map.elems generated <> Map.elems aliases)
    facades <- hsBindgenRuntimeReexports census
    abiAssertions <- renderAbiAssertions mainIncludes (concatMap (.abi) results) macroConsts
    Right
      $ mconcat
        [ FileTree generated
        , FileTree aliases
        , runtime
        , cexprCore
        , cexprLib
        , FileTree
            $ Map.fromList
              [ (moduleNameFilePath name, source)
              | (name, source) <- facades
              ]
        , FileTree
            $ Map.fromList
              [ ("package.yaml", packageYaml)
              , ("README.md", readme)
              , ("CHANGELOG.md", changelog)
              , ("cbits/abi_assertions.c", abiAssertions)
              , ("LICENSE", lithonLicense)
              , ("LICENSE_SDL", sdlLicense)
              , ("LICENSE_hs-bindgen-runtime", hsBindgenLicense)
              , ("LICENSE_c-expr-runtime", cexprLicense)
              ]
        ]

-- | Every @HsBindgen.Runtime.*@ \/ @C.Expr.*@ module imported by the
-- generated sources.
runtimeImports :: [Text] -> Set Text
runtimeImports sources =
  fromList
    [ imported
    | source <- sources
    , line <- T.lines source
    , Just rest <- [T.stripPrefix "import " (T.stripStart line)]
    , imported <- take 1 do
        token <- T.words rest
        guard $ ("HsBindgen.Runtime." `T.isPrefixOf` token) || ("C.Expr." `T.isPrefixOf` token)
        pure token
    ]

-- | The public runtime re-exports. Downstream codes can name the hs-bindgen
-- runtime vocabulary that appears in the generated signature without waiting
-- on an hs-bindgen official release.
--
-- Once hs-bindgen releases, this becomes a real dependency and re-exports
-- from the runtime. Depending on the final export surface of the released hs-bindgen,
-- there is a good chance that this breaks nothing in downstream code.
--
-- @HsBindgen.Runtime.Prelude@ is upstream's designed flat user surface
-- (LibC joins when generated signatures mention its types).
hsBindgenRuntimeReexports :: Set Text -> Either Text [(Text, Text)]
hsBindgenRuntimeReexports census = do
  case Set.toList (Set.filter unexpected census) of
    [] -> pure ()
    surprises ->
      Left
        ( "generated code imports vendored-runtime modules outside the"
            <> " expected surface: "
            <> T.intercalate ", " surprises
        )
  pure
    $ [ (baseNamespace <> ".Runtime", runtimeFacade)
      , (baseNamespace <> ".Runtime.CExpr", cexprFacade)
      ]
    <> [ (baseNamespace <> ".Runtime." <> leaf, leafFacade leaf)
       | leaf <- runtimeLeafFacades
       ]
 where
  unexpected m =
    "C.Expr." `T.isPrefixOf` m && m /= "C.Expr.HostPlatform"
  runtimeReexports =
    ["HsBindgen.Runtime.Prelude"]
      <> ["HsBindgen.Runtime.LibC" | "HsBindgen.Runtime.LibC" `Set.member` census]

  leafFacade leaf =
    [trimmingQQ|
      -- | Facade over @HsBindgen.Runtime.$leaf@ from the vendored hs-bindgen runtime.
      --
      -- Intended for qualified import:
      --
      -- > import qualified $baseNamespace.Runtime.$leaf as $leaf
      --
      -- For licensing information, see LICENSE_hs-bindgen-runtime in this package's root.
      module $baseNamespace.Runtime.$leaf (
        module HsBindgen.Runtime.$leaf
      ) where

      import HsBindgen.Runtime.$leaf
    |]

  runtimeFacade =
    let modules = T.unlines . map (("module " <>) . (<> ",")) $ runtimeReexports
        imports = T.unlines . map ("import " <>) $ runtimeReexports
     in [trimmingQQ|
      -- | The runtime vocabulary used by the generated bindings.
      --
      -- Generated signatures mention runtime types (CEnum, constant and
      -- incomplete arrays, read-only pointers, …); this facade makes them
      -- nameable downstream. The runtime itself is a verbatim, PRIVATE copy
      -- of the pinned hs-bindgen runtime (see LICENSE_hs-bindgen-runtime);
      -- once hs-bindgen releases, it becomes a real dependency and this
      -- module keeps downstream code source-compatible.
      module $baseNamespace.Runtime (
        $modules
      ) where

      $imports
    |]

  cexprFacade =
    [trimmingQQ|
      -- | The C-expression vocabulary used by translated macros.
      --
      -- Re-exports @C.Expr.HostPlatform@ from the vendored copy of c-expr-runtime 
      -- 
      -- Import qualified. Exports are operator classes like @+@, @*@, ...
      --
      -- For licensing information, see LICENSE_c-expr-runtime in this package's root.
      module $baseNamespace.Runtime.CExpr (
        module C.Expr.HostPlatform,
      ) where

      import C.Expr.HostPlatform
    |]

-- | Every public module of the vendored hs-bindgen runtime.
runtimeLeafFacades :: [Text]
runtimeLeafFacades =
  [ "BitfieldPtr"
  , "Block"
  , "CBool"
  , "CEnum"
  , "ConstantArray"
  , "FLAM"
  , "HasCBitfield"
  , "HasCField"
  , "IncompleteArray"
  , "IsArray"
  , "Marshal"
  , "PtrConst"
  , "Union"
  ]

packageYaml :: Text
packageYaml = T.decodeUtf8 $(embedFileRelative "data/sdl3/static/package.yaml")

readme :: Text
readme = T.decodeUtf8 $(embedFileRelative "data/sdl3/static/README.md")

changelog :: Text
changelog = T.decodeUtf8 $(embedFileRelative "data/sdl3/static/CHANGELOG.md")

lithonLicense :: Text
lithonLicense = T.decodeUtf8 $(embedFileRelative "../LICENSE")

-- | SDL's zlib notice, covering the header documentation embedded in the
-- generated haddocks. zlib condition 3 forbids removing the notice from
-- source distributions, so it ships in the sdist. The embedded root file
-- already leads with the derived-documentation preamble; its license text
-- mirrors the pinned SDL's LICENSE.txt — refresh alongside SDL bumps.
sdlLicense :: Text
sdlLicense = T.decodeUtf8 $(embedFileRelative "../LICENSE_SDL3")

newtype FileTree = FileTree (Map FilePath Text)
  deriving stock (Show)
  deriving newtype (Monoid, Semigroup)

-- | Read a source tree verbatim: relative path under @root@ -> text,
-- re-rooted at @dest@.
readTree :: (HasCallStack, Log :> es, FileSystem :> es) => FilePath -> FilePath -> Eff es FileTree
readTree root dest
  | isRelative root = do
      logInfo $ "reading tree" :# ["root" .= root, "dest" .= dest]
      paths <- listFilesRecursive root
      FileTree . Map.fromList <$> for paths \rootPath -> do
        contents <- decodeUtf8 <$> EBS.readFile rootPath
        let pathSeg = dropPrefix (addTrailingPathSeparator root) rootPath
        pure (dest </> pathSeg, contents)
  | otherwise = error $ "root of readTreeRelative must be relative, but got: " <> show root
