{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | Driving hs-bindgen: lithon-owned invocation configuration and the
-- artefact operations lithon consumes.
--
-- This is the rewrap boundary. Consumers describe an invocation with
-- 'InvocationEnv' \/ 'InvocationSpec' — plain lithon-owned records — and
-- run 'BindgenM' operations; hs-bindgen's own configuration vocabulary
-- ('Config_', @BindgenConfig@, tracer plumbing, artefact constructors)
-- stays behind this module. On a vendor bump, this file breaks so the
-- rest of lithon does not.
module Lithon.HsBindgen.Invoke (
  -- * Invocation
  InvocationEnv (..),
  InvocationSpec (..),
  BindgenFailure (..),
  runBindgen,

  -- * Operations
  BindgenM,
  HsModule,
  NameableModule (..),
  moduleName,
  moduleNameSegments,
  moduleImports,
  HeaderArtefacts (..),
  collectArtefacts,
  translatedFamily,
  reifiedHs,
  reifiedC,
  headerComment,
  writeSpec,
  sortedIncludeGraph,
) where

import Clang.Paths (getSourcePath)
import Control.Monad (when)
import Data.Default (def)
import Data.Foldable (toList)
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.Builder.Linear qualified as TB
import Doxygen.Parser qualified as Doxy
import GHC.Generics (Generic)
import HsBindgen
import HsBindgen.Artefact (ArtefactMsg (..))
import HsBindgen.ArtefactM (DirPolicy (..), FilePolicy (..))
import HsBindgen.Backend.Category (
  ByCategory_ (..),
  Category,
  mapWithCategory_,
 )
import HsBindgen.Backend.Hs.AST qualified as Hs
import HsBindgen.Backend.Hs.Haddock.Documentation qualified as HsDoc
import HsBindgen.Backend.HsModule.Translation (
  HsModule (..),
  ImportListItem (..),
  translateModuleMultiple,
 )
import HsBindgen.BindingSpec hiding (moduleName)
import HsBindgen.Config hiding (ConfigTH (..))
import HsBindgen.Config.ClangArgs
import HsBindgen.Config.Prelims (
  fromBaseModuleName,
 )
import HsBindgen.Frontend.Analysis.IncludeGraph qualified as IncludeGraph
import HsBindgen.Frontend.Pass.Final (Final)
import HsBindgen.IR.C qualified as C
import HsBindgen.Language.Haskell (ModuleName (..))
import HsBindgen.Macro (CExpr, cExpr)
import HsBindgen.Util.Tracer
import Lithon.Prelude ((&), (.~))
import Lithon.Prelude.Display (Display (..))

-- | Per-project invocation environment: everything lithon varies about
-- how hs-bindgen parses and names things. The consumer supplies the
-- domain data; the hs-bindgen configuration is assembled here.
data InvocationEnv = InvocationEnv
  { extraIncludeDirs :: [FilePath]
  , defineMacros :: [String]
  , doxygenAliases :: [(Text, Text)]
  -- ^ Doxyfile @ALIASES@ entries, for headers that use project-local
  -- doxygen commands (e.g. SDL's @\\threadsafety@).
  , fieldNaming :: FieldNamingStrategy
  , uniqueId :: String
  -- ^ Disambiguates generated global C names across packages.
  }

-- | Per-invocation inputs: one header (or umbrella) run.
data InvocationSpec = InvocationSpec
  { baseModule :: Text
  -- ^ The base module name; category modules hang off it.
  , includes :: [FilePath]
  -- ^ Hash-include arguments, e.g. @SDL3\/SDL_video.h@.
  , priorSpecs :: [FilePath]
  -- ^ External binding specifications consumed by this run.
  , prescriptiveSpec :: Maybe FilePath
  -- ^ The curated prescriptive spec (overrides), if present.
  }

-- | An hs-bindgen invocation failure, rendered. The vendor error type
-- does not cross the seam.
newtype BindgenFailure = BindgenFailure Text
  deriving stock (Show)

instance Display BindgenFailure where
  displayBuilder (BindgenFailure t) = TB.fromText t

-- | The artefact operations available inside one invocation.
newtype BindgenM a = BindgenM (Artefact CExpr a)
  deriving newtype (Applicative, Functor, Monad)

-- | Run one hs-bindgen invocation.
runBindgen :: InvocationEnv -> InvocationSpec -> BindgenM a -> IO (Either BindgenFailure a)
runBindgen env spec (BindgenM artefacts) =
  either (Left . toFailure) Right
    <$> hsBindgenEMacroLang (pure . cExpr) quietTracer def bindgenConfig spec.includes artefacts
 where
  toFailure e = BindgenFailure (T.pack (show (prettyForTrace e)))

  -- TODO: make verbosity configurable from InvocationEnv.
  quietTracer = def{verbosity = Verbosity Error}

  bindgenConfig =
    toBindgenConfig config (UniqueId env.uniqueId) (BaseModuleName spec.baseModule) def

  config =
    (def :: Config_ FilePath)
      { clang =
          (def :: ClangArgsConfig FilePath)
            & (#extraIncludeDirs .~ env.extraIncludeDirs)
            & (#defineMacros .~ env.defineMacros)
      , fieldNamingStrategy = env.fieldNaming
      , doxygenConfig = Doxy.defaultConfig{Doxy.aliases = env.doxygenAliases}
      , bindingSpec =
          def
            { extBindingSpecs = spec.priorSpecs
            , prescriptiveBindingSpec = spec.prescriptiveSpec
            }
      }

data NameableModule a = NameableModule
  { name :: BaseModuleName
  , category :: Maybe Category
  , hsModule :: a
  }
  deriving stock (Functor, Generic)

-- | The full dotted module name of one family member (base + category
-- suffix). Reads only the name metadata, so it works on any payload —
-- pre-render 'HsModule' or post-render alike.
moduleName :: NameableModule a -> Text
moduleName m = (fromBaseModuleName m.name m.category).text

moduleNameSegments :: NameableModule a -> [Text]
moduleNameSegments = T.splitOn "." . moduleName

-- | The dotted names of a translated module's typed imports — read from
-- the AST, never scraped back out of rendered text.
moduleImports :: HsModule -> [Text]
moduleImports m =
  [ n.text
  | item <- m.imports
  , n <- case item of
      QualifiedImportListItem n' _ -> [n']
      UnqualifiedImportListItem n' _ -> [n']
  ]

-- | The per-invocation artefact bundle every visitor reads: the translated
-- family plus the reified declarations and the header's module comment.
-- 'CExpr' is named only here, inside the seam; callers stay polymorphic in
-- the macro-expression parameter.
data HeaderArtefacts = HeaderArtefacts
  { family :: [NameableModule HsModule]
  , hsDecls :: ByCategory_ [Hs.Decl CExpr]
  , cDecls :: [C.Decl CExpr Final]
  , headerComment :: Maybe HsDoc.Comment
  }

-- | 'translatedFamily' + 'reifiedHs' + 'reifiedC' + 'headerComment' in one
-- bundle — what the generic driver hands each visitor.
collectArtefacts :: BindgenM HeaderArtefacts
collectArtefacts = do
  family <- translatedFamily
  hsDecls <- reifiedHs
  cDecls <- reifiedC
  comment <- headerComment
  pure HeaderArtefacts{family, hsDecls, cDecls, headerComment = comment}

-- | The translated (pre-render) module family: module name -> module AST,
-- one entry per non-empty binding category, names minted by hs-bindgen's
-- own category mapping. Feed the result through
-- "Lithon.HsBindgen.Transform" and render there.
translatedFamily :: BindgenM [NameableModule HsModule]
translatedFamily = BindgenM do
  name <- ModuleBaseName
  decls <- FinalDecls
  tags <- getExportTags
  mdoc <- getModuleComment
  when (all nullDecls decls) $
    EmitTrace $
      NoBindingsMultipleModules name
  config <- getConfig
  let fns = config.frontend.fieldNamingStrategy
  pure . familyModules name $
    translateModuleMultiple fns def name mdoc (resolveExports tags) decls
 where
  nullDecls :: (Foldable f, Foldable g) => (f a, g b) -> Bool
  nullDecls (xs, ys) = null xs && null ys

  -- Vendor 'toList' order (cType, cSafe, cUnsafe, cFunPtr, cGlobal) is the
  -- family order downstream sees.
  familyModules :: BaseModuleName -> ByCategory_ (Maybe HsModule) -> [NameableModule HsModule]
  familyModules name modules =
    [ NameableModule{name, category = Just cat, hsModule}
    | (cat, Just hsModule) <- toList (mapWithCategory_ (,) modules)
    ]

-- | The final Haskell declarations, by category.
reifiedHs :: BindgenM (ByCategory_ [Hs.Decl CExpr])
reifiedHs = BindgenM HsDecls

-- | The final C declarations.
reifiedC :: BindgenM [C.Decl CExpr Final]
reifiedC = BindgenM getReifiedC

-- | The header's translated module comment, if any.
headerComment :: BindgenM (Maybe HsDoc.Comment)
headerComment = BindgenM getModuleComment

-- | Write this run's binding specification (overwrites; creates parents).
writeSpec :: FilePath -> BindgenM ()
writeSpec = BindgenM . writeBindingSpec AllowFileOverwrite CreateOutputDirs

-- | The include graph in dependency order, as source paths.
sortedIncludeGraph :: BindgenM [FilePath]
sortedIncludeGraph =
  BindgenM (map getSourcePath . IncludeGraph.toSortedList <$> getIncludeGraph)
