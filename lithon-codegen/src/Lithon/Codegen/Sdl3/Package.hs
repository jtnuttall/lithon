{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE UndecidableInstances #-}

-- | Assembling the @sdl3-bindgen-sys@ package itself. The code generator
-- owns everything in the package; nothing in it is ever edited by hand.
module Lithon.Codegen.Sdl3.Package (
  PackageAssemblyError (..),
  assemblePackage,
  packageYaml,
  readme,
  changelog,
) where

import Data.FileEmbed (embedFileRelative)
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Text.Encoding qualified as T
import Lithon.HsBindgen qualified as HB
import Lithon.HsBindgen.Runtime (
  cexprRuntimeCoreTree,
  cexprRuntimeLibTree,
  cexprRuntimeLicense,
  hsBindgenRuntimeLicense,
  hsBindgenRuntimeTree,
 )
import Lithon.Prelude
import System.FilePath (isAbsolute)
import Witch (TryFromException (..))

import Lithon.Codegen.Backend.FileTree (FileTree)
import Lithon.Codegen.Backend.FileTree qualified as FileTree
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Sdl3.Abi (AbiMacroConst, renderAbiAssertions)
import Lithon.Codegen.Sdl3.Bindgen (HeaderResult (..), baseNamespace, mainIncludes)

-- Cheap compile-time sanity check. These are embedded directory tries from 'Data.FileEmbed'.
do
  let absPaths = filter (isAbsolute . fst) $ hsBindgenRuntimeTree <> cexprRuntimeCoreTree <> cexprRuntimeLibTree
  unless (null absPaths)
    $ fail
      ( "Expected the embedded runtime paths to be relative, but the following are absolute:\n - "
          <> intercalate "\n - " (map fst absPaths)
      )
  pure []

packageYaml :: Text
packageYaml = T.decodeUtf8 $(embedFileRelative "data/sdl3/static/package.yaml")

readme :: Text
readme = T.decodeUtf8 $(embedFileRelative "data/sdl3/static/README.md")

changelog :: Text
changelog = T.decodeUtf8 $(embedFileRelative "data/sdl3/static/CHANGELOG.md")

lithonLicense :: Text
lithonLicense = T.decodeUtf8 $(embedFileRelative "LICENSE")

sdlLicense :: Text
sdlLicense = T.decodeUtf8 $(embedFileRelative "LICENSE_SDL3")

hsbindgenRuntimeOut, cexprRuntimeOut :: FilePath
hsbindgenRuntimeOut = "runtime"
cexprRuntimeOut = "runtime-cexpr"

-- data PackageSpec = PackageSpec
--   { root :: PackageRootFiles
--   , src :: FileTree
--   , test :: Maybe FileTree
--   , bench :: Maybe FileTree
--   }
--   deriving stock (Show)
--
-- data PackageRootFiles = PackageRootFiles
--   { hpackPackage :: Text
--   , readme :: Text
--   , license :: Text
--   }
--   deriving stock (Show)

data PackageAssemblyError
  = MergedTreeInvalid FileTree.DuplicateFiles
  | GeneratorOutputInvalid Text (TryFromException [(FilePath, Text)] FileTree)
  | GeneratorEmittedInvalidModuleName Text Text Module.MetaError
  | GeneratorEmittedOutOfTreeModules [Text]
  | AbiAssertionsInvalid Text
  deriving stock (Show)

instance From FileTree.DuplicateFiles PackageAssemblyError where
  from = MergedTreeInvalid

instance Display PackageAssemblyError where
  displayBuilder = \case
    MergedTreeInvalid dupes -> "while trying to assemble package, " <> displayBuilder dupes
    GeneratorOutputInvalid what except -> "[" <> from what <> "]: generator emitted duplicate paths: " <> show except
    GeneratorEmittedInvalidModuleName what name err ->
      "[" <> from what <> "]: generator emitted invalid module name " <> show name <> ": " <> displayBuilder err
    GeneratorEmittedOutOfTreeModules mods ->
      "generated code imports vendored-runtime modules outside the"
        <> " expected surface: "
        <> intercalateTB ", " (map from mods)
    AbiAssertionsInvalid msg -> from msg

-- |
-- Build the full file map for the package directory: generated Bindgen
-- modules, the rendered @SDL3.Sys.*@ alias layer, runtime copies, hs-bindgen facades,
-- and metadata.
assemblePackage
  :: [(Text, Text)]
  -> [AbiMacroConst]
  -- ^ Probed typed-constant values (curated layer), re-asserted in the TU.
  -> [HeaderResult]
  -> Either PackageAssemblyError FileTree
assemblePackage aliasModules macroConsts results = do
  generatedPairs <- for (concatMap (.modules) results) \m -> do
    p <- pathFor "generated modules" (HB.moduleNameSegments m)
    pure (p, m.hsModule.text)
  aliasPairs <- for aliasModules \(name, contents) -> do
    p <- pathFor "aliases" (T.splitOn "." name)
    pure (p, contents)
  hsBindgenFacades <-
    hsBindgenRuntimeReexports . runtimeImports . map snd $ generatedPairs <> aliasPairs
  abiAssertions <-
    first AbiAssertionsInvalid $ renderAbiAssertions mainIncludes (concatMap (.abi) results) macroConsts

  generated :: FileTree <- first (GeneratorOutputInvalid "generated modules") $ tryFrom generatedPairs
  aliases :: FileTree <- first (GeneratorOutputInvalid "aliases") $ tryFrom aliasPairs

  facadePairs <- for hsBindgenFacades \(name, contents) -> do
    p <- pathFor "hs-bindgen facades" (T.splitOn "." name)
    pure (p, contents)
  facades <- first (GeneratorOutputInvalid "hs-bindgen facades") $ tryFrom facadePairs

  let hsBindgenRuntime = FileTree.prependPath hsbindgenRuntimeOut $ FileTree.fromUniqueListBS hsBindgenRuntimeTree
      cexprRuntimeCore = FileTree.prependPath cexprRuntimeOut $ FileTree.fromUniqueListBS cexprRuntimeCoreTree
      cexprRuntimeLib = FileTree.prependPath cexprRuntimeOut $ FileTree.fromUniqueListBS cexprRuntimeLibTree
      rootFiles =
        FileTree.fromUniqueList
          [ ("package.yaml", packageYaml)
          , ("README.md", readme)
          , ("CHANGELOG.md", changelog)
          , ("cbits/abi_assertions.c", abiAssertions)
          , ("LICENSE", lithonLicense)
          , ("LICENSE_SDL", sdlLicense)
          , ("LICENSE_hs-bindgen-runtime", decodeUtf8 hsBindgenRuntimeLicense)
          , ("LICENSE_c-expr-runtime", decodeUtf8 cexprRuntimeLicense)
          ]

      tree =
        hsBindgenRuntime
          :| [ cexprRuntimeCore
             , cexprRuntimeLib
             , FileTree.prependPath "src" generated
             , FileTree.prependPath "src" aliases
             , FileTree.prependPath "src" facades
             , rootFiles
             ]

  first from $ FileTree.cata tree
 where
  pathFor what segs =
    bimap (GeneratorEmittedInvalidModuleName what (T.intercalate "." segs)) Module.path
      $ Module.fromSegments segs

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

-- | The public runtime re-exports. Downstream code can name the hs-bindgen
-- runtime vocabulary that appears in the generated signature without waiting
-- on an hs-bindgen official release.
--
-- Once hs-bindgen releases, this becomes a real dependency and re-exports
-- from the runtime. Depending on the final export surface of the released hs-bindgen,
-- there is a good chance that this breaks nothing in downstream code.
hsBindgenRuntimeReexports :: Set Text -> Either PackageAssemblyError [(Text, Text)]
hsBindgenRuntimeReexports census = do
  case Set.toList (Set.filter unexpected census) of
    [] -> pure ()
    surprises -> Left $ GeneratorEmittedOutOfTreeModules surprises
  pure
    $ [ (baseNamespace <> ".Runtime", runtimeFacade)
      , (baseNamespace <> ".Runtime.CExpr", cexprFacade)
      ]
    <> [ (baseNamespace <> ".Runtime." <> leaf, leafFacade leaf)
       | leaf <- runtimeLeafhsBindgenFacades
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
runtimeLeafhsBindgenFacades :: [Text]
runtimeLeafhsBindgenFacades =
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
