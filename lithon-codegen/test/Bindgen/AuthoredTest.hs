{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Authored C headers as chain units: a header lithon writes for a
-- target ('toy2Shims': @toy2-shims\/toy_thing_shims.h@ over the library's
-- @toy2\/toy_thing.h@) joins the include graph after the header it
-- includes, binds through that header's spec, and its wrapper C includes
-- it under its own root; the data directory holds exactly the listed
-- headers ('resolveAuthoredInclude'); and the curated layer merges an
-- authored header's functions into the module of the header it extends,
-- under a "C shims" section, linking the library's mentions of what they
-- wrap (the @alias-toy-shims-module@ golden), a bound function of that
-- name winning the link; an authored header extending nothing gets a
-- module of its own; and an authored header whose host is not bound, or
-- that declares types or misnamed functions, is refused. The committed SDL
-- shim headers load, and compile against the SDL @pkg-config@ resolves.
module Bindgen.AuthoredTest (
  unit_authoredHeaderChains,
  unit_authoredIncludeResolution,
  test_authoredMergeGolden,
  unit_standaloneAuthoredModule,
  unit_rewriteMapPrefersBound,
  unit_orphanAuthoredRejected,
  unit_authoredTypesRejected,
  unit_sdl3ShimHeadersCompile,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.FileEmbed (makeRelativeToProject)
import Data.List qualified as L
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Text.IO qualified as TIO
import Effectful (runEff)
import Effectful.Error.Dynamic (runErrorNoCallStack)
import Language.Haskell.TH (stringE)
import Lithon.Effect.ClangEnv (PkgDbEntry (..))
import Lithon.Effect.FileSystem (runFileSystem)
import Lithon.Effect.Log (runLog)
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.Directory (createDirectory, createDirectoryIfMissing, findExecutable)
import System.Exit (ExitCode (..))
import System.FilePath (takeDirectory, (</>))
import System.IO.Temp (withSystemTempDirectory)
import System.Process (readProcessWithExitCode)
import Test.Tasty (TestTree)
import Test.Tasty.Golden (goldenVsStringDiff)
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure, (@?=))

import Bindgen.Support.Targets (toy2, toy2Shims)
import Bindgen.Support.Toy (
  ToyEnv (..),
  ToyHeader (..),
  renderedPairs,
  runToyChain,
  toyEnv,
  wrapperC,
 )
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen (bindgenVisitor)
import Lithon.Codegen.Bindgen.Alias (
  AliasModule (..),
  CFunction (..),
  FamilyDecls (..),
  aliasRewriteMap,
  functionCensus,
  planAliasLayer,
  renderAliasModule,
 )
import Lithon.Codegen.Bindgen.Alias.Config (
  AliasConfig (..),
  FunctionEntry (..),
  NamingRule (..),
  ValidatedAliasConfig (..),
  validateAliasConfig,
 )
import Lithon.Codegen.Bindgen.Alias.Names (AliasError (..), Safety (..))
import Lithon.Codegen.Bindgen.Driver (HeaderResult (..), HeaderUnit (..), Visitor (..))
import Lithon.Codegen.Bindgen.Env (
  AuthoredRefusal (..),
  BindgenEnv (..),
  BindgenPaths (..),
  BindgenResolutionError (..),
  headerSourcePath,
  loadAuthoredHeaders,
  resolveAuthoredInclude,
 )
import Lithon.Codegen.Bindgen.Payload (BindgenPayload (..))
import Lithon.Codegen.Bindgen.Target (
  BindgenTarget (..),
  HeaderSpec (..),
  defineLine,
  headerPlan,
 )
-- Qualified: the authored-header records share field names with the
-- target's own (@includeRoot@, @headers@).
import Lithon.Codegen.Bindgen.Target qualified as Target
import Lithon.Codegen.Bindgen.Target.Sdl3 (sdl3)
import Lithon.Codegen.Bindgen.Versions (decodeVersionsRegistry)

-- | The library header: a typedef the shims use, a variadic function and a
-- function-like macro hs-bindgen cannot bind, and one it can.
toyThingHeader :: Text
toyThingHeader =
  unlines
    [ "#ifndef TOY_THING_H"
    , "#define TOY_THING_H"
    , ""
    , "/** A count of things. */"
    , "typedef int toy_count;"
    , ""
    , "/** Log a formatted message. */"
    , "void toy_log(const char *fmt, ...);"
    , ""
    , "/** Add two counts. */"
    , "#define TOY_SUM2(a, b) ((toy_count)(a) + (toy_count)(b))"
    , ""
    , "/** Open the thing. */"
    , "int toy_open(void);"
    , ""
    , "#endif"
    ]

-- | The authored header: fixed-arity functions over the two.
toyShimsHeader :: Text
toyShimsHeader =
  unlines
    [ "/* toy C shims for <toy2/toy_thing.h>. */"
    , "#ifndef TOY_THING_SHIMS_H"
    , "#define TOY_THING_SHIMS_H"
    , ""
    , "#include <toy2/toy_thing.h>"
    , ""
    , "/**"
    , " * Log a message verbatim."
    , " *"
    , " * \\param message the message."
    , " */"
    , "static inline void lithon_toy_log(const char *message) { toy_log(\"%s\", message); }"
    , ""
    , "/**"
    , " * The TOY_SUM2 macro as a function."
    , " */"
    , "static inline toy_count lithon_toy_sum2(toy_count a, toy_count b) { return TOY_SUM2(a, b); }"
    , ""
    , "#endif"
    ]

toyHeaders :: [ToyHeader]
toyHeaders =
  [ ToyHeader{include = "toy2/toy_thing.h", source = toyThingHeader}
  , ToyHeader{include = "toy2-shims/toy_thing_shims.h", source = toyShimsHeader}
  ]

-- | The authored header chains after its host, under its own include
-- argument and module name, has no types module (it declares functions
-- only), binds against the host's spec (its Unsafe module imports the
-- host's family for @toy_count@), and its wrapper C includes it by its
-- authored root and calls the authored function.
unit_authoredHeaderChains :: Assertion
unit_authoredHeaderChains = do
  results <-
    either (assertFailure . toString) pure
      =<< runToyChain
        (toyEnv "lithon-authored-toy")
        toyHeaders
        (headerPlan toy2Shims)
        Visitor{passes = mempty, finalize = \_ _ _ -> Right ()}
  map (.unit.headerName) results @?= ["toy_thing.h", "toy_thing_shims.h"]
  shims <- case results of
    [_host, shims] -> pure shims
    _other -> assertFailure "expected two units"
  shims.unit.include @?= "toy2-shims/toy_thing_shims.h"
  Module.hsName shims.unit.moduleName @?= "Toy2.Sys.Bindgen.ToyThingShims"
  let names = map fst (renderedPairs shims.modules)
  assertBool
    ("no types module for the authored header: " <> show names)
    ("Toy2.Sys.Bindgen.ToyThingShims" `notElem` names)
  unsafeModule <-
    maybe
      (assertFailure ("no Unsafe module in " <> show names))
      pure
      (L.find ((== "Toy2.Sys.Bindgen.ToyThingShims.Unsafe") . HB.moduleName) shims.modules)
  assertBool
    ("the Unsafe module binds through the host's spec: " <> show unsafeModule.hsModule.importedModules)
    ("Toy2.Sys.Bindgen.ToyThing" `elem` unsafeModule.hsModule.importedModules)
  let c = wrapperC unsafeModule.hsModule.text
  assertBool
    ("the wrapper includes the authored header by its root:\n" <> toString (T.unlines c))
    ("#include <toy2-shims/toy_thing_shims.h>" `elem` c)
  assertBool
    ("the wrapper calls the authored function:\n" <> toString (T.unlines c))
    (any ("return (lithon_toy_sum2)(arg1, arg2);" `T.isInfixOf`) c)

-- | @include\/@ holds exactly the authored root, and the root exactly the
-- listed headers; a target that authors none has no @include\/@.
unit_authoredIncludeResolution :: Assertion
unit_authoredIncludeResolution = do
  -- No authored headers, no include/.
  withDataDir [] \dir -> resolved toy2 dir >>= found Nothing
  -- No authored headers, but an include/.
  withDataDir [] \dir -> do
    createDirectory (dir </> "include")
    resolved toy2 dir >>= refused (dir </> "include") NoAuthoredHeaders
  -- Exactly the listed headers: found, shipped by package path, and read
  -- from the data directory.
  withDataDir [listed] \dir -> do
    resolved toy2Shims dir >>= found (Just (dir </> "include"))
    let env = envFor dir (Just (dir </> "include"))
    loaded <- runEff . runFileSystem $ loadAuthoredHeaders toy2Shims env
    loaded @?= [("include/toy2-shims/toy_thing_shims.h", toyShimsHeader)]
    headerSourcePath toy2Shims env "toy_thing_shims.h" @?= dir </> listed
    headerSourcePath toy2Shims env "toy_thing.h" @?= "/nonexistent/toy2/toy_thing.h"
  -- The root, or a listed header, missing.
  withDataDir [] \dir -> do
    createDirectory (dir </> "include")
    resolved toy2Shims dir >>= missing (dir </> "include/toy2-shims")
  withDataDir [] \dir -> do
    createDirectoryIfMissing True (dir </> "include/toy2-shims")
    resolved toy2Shims dir >>= missing (dir </> listed)
  -- Anything unlisted in the root: a file, a dotfile, a directory.
  for_ ["include/toy2-shims/notes.txt", "include/toy2-shims/.toy_thing_shims.h.swp"] \stray ->
    withDataDir [listed, stray] \dir ->
      resolved toy2Shims dir >>= refused (dir </> stray) Unlisted
  withDataDir [listed] \dir -> do
    createDirectory (dir </> "include/toy2-shims/nested")
    resolved toy2Shims dir >>= refused (dir </> "include/toy2-shims/nested") Unlisted
  -- Anything beside the root.
  withDataDir [listed, "include/other.h"] \dir ->
    resolved toy2Shims dir >>= refused (dir </> "include/other.h") OutsideTheRoot
  -- The committed SDL set: the eleven listed headers, nothing else.
  resolved sdl3 sdl3DataDir >>= found (Just (sdl3DataDir </> "include"))
  loaded <-
    runEff
      . runFileSystem
      $ loadAuthoredHeaders sdl3 (envFor sdl3DataDir (Just (sdl3DataDir </> "include")))
  map fst loaded @?= map ("include/sdl3-bindgen-sys" </>) sdl3ShimFiles
 where
  listed = "include/toy2-shims/toy_thing_shims.h"

-- | @lithon-codegen\/data\/sdl3@.
sdl3DataDir :: FilePath
sdl3DataDir = $(stringE =<< makeRelativeToProject "data/sdl3")

sdl3ShimFiles :: [FilePath]
sdl3ShimFiles =
  [ "SDL_" <> x <> "_shims.h"
  | x <-
      [ "atomic"
      , "audio"
      , "endian"
      , "error"
      , "iostream"
      , "log"
      , "pixels"
      , "stdinc"
      , "surface"
      , "thread"
      , "timer"
      ]
  ]

-- | One translation unit including every committed shim header, as the
-- wrapper C does (the target's defines first), compiles warning-free against
-- the SDL @pkg-config@ resolves. Skipped without a C compiler or SDL.
-- @-c@, not @-fsyntax-only@: the dev shell's compiler wrapper adds linker
-- flags to a syntax-only run, which @-Werror@ then rejects as unused.
unit_sdl3ShimHeadersCompile :: Assertion
unit_sdl3ShimHeadersCompile =
  (,) <$> findExecutable "cc" <*> findExecutable "pkg-config" >>= \case
    (Nothing, _) -> skipped "no cc on PATH"
    (_, Nothing) -> skipped "no pkg-config on PATH"
    (Just cc, Just pkgConfig) -> do
      (pkgCode, cflags, _) <- readProcessWithExitCode pkgConfig ["--cflags", "sdl3"] ""
      if pkgCode /= ExitSuccess then
        skipped "pkg-config --cflags sdl3 failed"
      else withSystemTempDirectory "lithon-shims" \dir -> do
        let tu = dir </> "shims.c"
        TIO.writeFile tu
          . T.unlines
          $ map defineLine sdl3.parse.defines
          <> ["#include <sdl3-bindgen-sys/" <> toText f <> ">" | f <- sdl3ShimFiles]
        let args =
              ["-std=c11", "-Wall", "-Wextra", "-Werror", "-c", "-o", dir </> "shims.o"]
                <> ["-I", sdl3DataDir </> "include"]
                <> map toString (words (toText cflags))
                <> [tu]
        (code, _out, err) <- readProcessWithExitCode cc args ""
        assertBool ("the shim headers do not compile:\n" <> err) (code == ExitSuccess)
 where
  skipped why =
    putStrLn @Text
      ("SDL SHIM HEADER COMPILE SKIPPED: " <> why <> "; run inside the dev shell for the real check")

-- | A fresh data directory holding the given files (the authored header's
-- own text, whatever the path).
withDataDir :: [FilePath] -> (FilePath -> IO a) -> IO a
withDataDir files k = withSystemTempDirectory "lithon-authored" \dir -> do
  for_ files \file -> do
    createDirectoryIfMissing True (takeDirectory (dir </> file))
    TIO.writeFile (dir </> file) toyShimsHeader
  k dir

type Resolution = Either BindgenResolutionError (Maybe FilePath)

resolved :: BindgenTarget -> FilePath -> IO Resolution
resolved target dir =
  runEff
    . runLog "authored-test"
    . runFileSystem
    . runErrorNoCallStack
    $ resolveAuthoredInclude target dir

found :: Maybe FilePath -> Resolution -> Assertion
found expected = \case
  Right include -> include @?= expected
  Left err -> assertFailure ("expected the include directory resolved, got: " <> toString (display err))

missing :: FilePath -> Resolution -> Assertion
missing expected = \case
  Left (AuthoredMissing path) -> path @?= expected
  other -> assertFailure ("expected " <> expected <> " missing, got: " <> shown other)

refused :: FilePath -> AuthoredRefusal -> Resolution -> Assertion
refused expected why = \case
  Left err@(AuthoredUnexpected path refusal) -> do
    (path, refusal) @?= (expected, why)
    assertBool "the message names the entry" (toText expected `T.isInfixOf` display err)
  other -> assertFailure ("expected " <> expected <> " refused, got: " <> shown other)

shown :: Resolution -> String
shown = either (toString . display) (("resolved " <>) . show)

envFor :: FilePath -> Maybe FilePath -> BindgenEnv
envFor dir include =
  BindgenEnv
    { includeDir = "/nonexistent"
    , libraryVersion = "0"
    , pkgDbEntry = PkgDbEntry{name = "none", description = Nothing, version = Nothing, vars = mempty}
    , paths =
        BindgenPaths
          { dataDir = dir
          , versions = dir </> "versions.json"
          , aliases = dir </> "aliases.json"
          , constants = dir </> "constants.json"
          , unbound = dir </> "unbound.json"
          , static = dir </> "static"
          , overrides = mempty
          , include
          }
    }

{-------------------------------------------------------------------------------
  The curated layer
-------------------------------------------------------------------------------}

-- | 'sdl3' binding the SDL-shaped @SDL3\/SDL_toy.h@ alone, plus the
-- authored @sdl3-bindgen-sys\/SDL_toy_shims.h@ extending it.
sdl3Shims :: BindgenTarget
sdl3Shims =
  sdl3
    { headers = sdl3.headers{mainIncludes = ["SDL_toy.h"]}
    , authored =
        Just
          Target.AuthoredHeaders
            { Target.includeRoot = "sdl3-bindgen-sys"
            , Target.namePrefix = "lithon_"
            , Target.headers =
                [Target.AuthoredHeader{Target.file = "SDL_toy_shims.h", Target.extends = Just "SDL_toy.h"}]
            }
    }

-- | The host: a category overview, a typedef, a variadic function and a
-- function-like macro hs-bindgen leaves unbound, and a bound function whose
-- docs mention both (a C call, a bare name, and a @\\sa@ reference).
sdlToyHeader :: Text
sdlToyHeader =
  unlines
    [ "#ifndef SDL_TOY_H"
    , "#define SDL_TOY_H"
    , ""
    , "/**"
    , " * # CategoryToy"
    , " *"
    , " * Toy overview prose."
    , " */"
    , ""
    , "/**"
    , " * A count of toys."
    , " */"
    , "typedef int SDL_ToyCount;"
    , ""
    , "/**"
    , " * Log a toy message."
    , " *"
    , " * \\param fmt a printf() style message format string."
    , " * \\param ... additional parameters."
    , " *"
    , " * \\since This function is available since SDL 3.2.0."
    , " */"
    , "void SDL_ToyLog(const char *fmt, ...);"
    , ""
    , "/**"
    , " * Add two toy counts."
    , " *"
    , " * \\since This macro is available since SDL 3.2.0."
    , " */"
    , "#define SDL_TOY_SUM2(a, b) ((SDL_ToyCount)(a) + (SDL_ToyCount)(b))"
    , ""
    , "/**"
    , " * Open the toy box."
    , " *"
    , " * Report problems with SDL_ToyLog(); add counts with SDL_TOY_SUM2."
    , " *"
    , " * \\returns the number of toys."
    , " *"
    , " * \\since This function is available since SDL 3.2.0."
    , " *"
    , " * \\sa SDL_ToyLog"
    , " */"
    , "SDL_ToyCount SDL_ToyOpen(void);"
    , ""
    , "#endif"
    ]

-- | The authored header, shaped like SDL's shim headers.
sdlToyShimsHeader :: Text
sdlToyShimsHeader =
  unlines
    [ "/*"
    , " * toy C shims for <SDL3/SDL_toy.h>."
    , " */"
    , "#ifndef SDL3_BINDGEN_SYS_SDL_TOY_SHIMS_H"
    , "#define SDL3_BINDGEN_SYS_SDL_TOY_SHIMS_H"
    , ""
    , "#include <SDL3/SDL_toy.h>"
    , ""
    , "/**"
    , " * Log a toy message."
    , " *"
    , " * A fixed-arity shim over the variadic SDL_ToyLog: `message` is logged"
    , " * verbatim."
    , " *"
    , " * \\param message the message to log."
    , " *"
    , " * \\since This function is available since SDL 3.2.0."
    , " *"
    , " * \\sa SDL_ToyOpen"
    , " */"
    , "static inline void lithon_SDL_ToyLog(const char *message) { SDL_ToyLog(\"%s\", message); }"
    , ""
    , "/**"
    , " * Add two toy counts."
    , " *"
    , " * The SDL_TOY_SUM2 macro as a function."
    , " *"
    , " * \\param a the first count."
    , " * \\param b the second count."
    , " * \\returns the sum."
    , " *"
    , " * \\since This function is available since SDL 3.2.0."
    , " */"
    , "static inline SDL_ToyCount lithon_SDL_TOY_SUM2(SDL_ToyCount a, SDL_ToyCount b) {"
    , "  return SDL_TOY_SUM2(a, b);"
    , "}"
    , ""
    , "#endif"
    ]

-- | The host's curated module with the shims merged in: the base module
-- and both flavor imports of both families, the host's aliases and then a
-- "C shims" section, the conventions paragraph on shims, and the host's
-- mentions of the unbound originals (@SDL_ToyLog()@, @SDL_TOY_SUM2@, the
-- @\\sa@) linked to the shims.
test_authoredMergeGolden :: TestTree
test_authoredMergeGolden =
  goldenVsStringDiff
    "alias-toy-shims-module"
    (\ref new -> ["diff", "-u", ref, new])
    ("test/golden/sdl3" </> "alias-toy-shims-module.golden")
    (LBS.fromStrict . TE.encodeUtf8 <$> rendered)
 where
  rendered = do
    families <- sdlToyFamilies "lithon-authored-sdl3" sdl3Shims sdlToyShimsHeader
    modules <- plannedModules sdl3Shims shimsConfig families
    case modules of
      [m] -> do
        m.moduleName @?= "SDL3.Sys.Toy"
        pure (snd (renderAliasModule sdl3Shims (aliasRewriteMap sdl3Shims families modules) m))
      _other -> assertFailure ("expected the one merged module, got " <> show (map (.moduleName) modules))

-- | An authored header that extends nothing gets a curated module of its
-- own, named for its family: no base module to re-export (it declares no
-- types), and its functions in a "C shims" section, the only one. The
-- library header's module keeps its own functions alone.
unit_standaloneAuthoredModule :: Assertion
unit_standaloneAuthoredModule = do
  families <- sdlToyFamilies "lithon-authored-standalone" sdl3Standalone sdlToyShimsHeader
  modules <- plannedModules sdl3Standalone shimsConfig families
  map (.moduleName) modules @?= ["SDL3.Sys.Toy", "SDL3.Sys.ToyShims"]
  let render = snd . renderAliasModule sdl3Standalone (aliasRewriteMap sdl3Standalone families modules)
  case map render modules of
    [host, standalone] -> do
      exportSections host @?= ["Function aliases"]
      exportSections standalone @?= ["C shims"]
      assertBool
        ("the standalone module re-exports a base module:\n" <> toString standalone)
        (not ("( module " `T.isInfixOf` standalone))
      for_ ["SDL3.Sys.ToyShims.toyLog", "SDL3.Sys.ToyShims.toyLogSafe", "SDL3.Sys.ToyShims.toySum2"] \name ->
        assertBool
          ("the standalone module does not export " <> toString name <> ":\n" <> toString standalone)
          (name `T.isInfixOf` standalone)
    _other -> assertFailure "expected two modules"
 where
  -- A section heading may share its line with the export list's opening.
  exportSections text =
    [ T.strip title
    | line <- T.lines text
    , Just title <- [T.stripPrefix "-- * " (snd (T.breakOn "-- * " line))]
    ]

-- | The documentation links key an authored function by the name it wraps
-- too, and a bound function of that name wins: with a shim over the bound
-- @SDL_ToyOpen@, the library's mentions of @SDL_ToyOpen@ still link to
-- 'toyOpen', while the shim is reached by its own C name, and the unbound
-- @SDL_ToyLog@'s mentions link to its shim.
unit_rewriteMapPrefersBound :: Assertion
unit_rewriteMapPrefersBound = do
  families <- sdlToyFamilies "lithon-authored-rewrite" sdl3Shims overlappingShimsHeader
  modules <- plannedModules sdl3Shims overlappingConfig families
  let links = aliasRewriteMap sdl3Shims families modules
  Map.lookup "SDL_ToyOpen" links @?= Just ("SDL3.Sys.Toy", "toyOpen")
  Map.lookup "sDL_ToyOpen" links @?= Just ("SDL3.Sys.Toy", "toyOpen")
  Map.lookup "lithon_SDL_ToyOpen" links @?= Just ("SDL3.Sys.Toy", "toyOpenShim")
  Map.lookup "SDL_ToyLog" links @?= Just ("SDL3.Sys.Toy", "toyLog")
 where
  overlappingShimsHeader =
    T.replace
      "\n#endif\n"
      ( T.unlines
          [ ""
          , "/**"
          , " * Open the toy box through a shim."
          , " *"
          , " * \\since This function is available since SDL 3.2.0."
          , " */"
          , "static inline SDL_ToyCount lithon_SDL_ToyOpen(void) { return SDL_ToyOpen(); }"
          , ""
          , "#endif"
          ]
      )
      sdlToyShimsHeader
  overlappingConfig =
    AliasConfig
      { naming = CamelSegments
      , functions =
          shimsConfig.functions
            <> Map.fromList [("lithon_SDL_ToyOpen", FunctionEntry UnsafeOnly (Just "a toy"))]
      , renames = shimsConfig.renames <> Map.fromList [("lithon_SDL_ToyOpen", "toyOpenShim")]
      , skip = []
      , allow = mempty
      }

-- | 'sdl3Shims' with its authored header extending nothing.
sdl3Standalone :: BindgenTarget
sdl3Standalone =
  sdl3Shims
    { authored =
        Just
          Target.AuthoredHeaders
            { Target.includeRoot = "sdl3-bindgen-sys"
            , Target.namePrefix = "lithon_"
            , Target.headers =
                [Target.AuthoredHeader{Target.file = "SDL_toy_shims.h", Target.extends = Nothing}]
            }
    }

-- | The SDL-shaped toy chain (the host, then the given authored header)
-- through the target's own visitor: each unit's families.
sdlToyFamilies :: String -> BindgenTarget -> Text -> IO [FamilyDecls]
sdlToyFamilies uniqueId target shimsHeader = do
  registry <- either (assertFailure . toString) pure (decodeVersionsRegistry 3 "{}")
  results <-
    either (assertFailure . toString) pure
      =<< runToyChain
        (toyEnv uniqueId){doxygenAliases = sdl3.parse.doxygenAliases}
        [ ToyHeader{include = "SDL3/SDL_toy.h", source = sdlToyHeader}
        , ToyHeader{include = "sdl3-bindgen-sys/SDL_toy_shims.h", source = shimsHeader}
        ]
        (headerPlan target)
        (bindgenVisitor target registry)
  pure (map (.payload.facts) results)

-- | The toy shims' registry entries: the log may call back, the sum is
-- pure.
shimsConfig :: AliasConfig
shimsConfig =
  AliasConfig
    { naming = CamelSegments
    , functions =
        Map.fromList
          [ ("lithon_SDL_ToyLog", FunctionEntry Both (Just "the toy log may call back"))
          , ("lithon_SDL_TOY_SUM2", FunctionEntry UnsafeOnly (Just "pure arithmetic"))
          ]
    , renames = Map.fromList [("lithon_SDL_TOY_SUM2", "toySum2")]
    , skip = []
    , allow = mempty
    }

-- | Validate the registry against the families' census and plan the
-- curated layer (no constants).
plannedModules :: BindgenTarget -> AliasConfig -> [FamilyDecls] -> IO [AliasModule]
plannedModules target config families = do
  validated <-
    either (assertFailure . toString . display) pure
      $ validateAliasConfig target.functionPrefix (functionCensus families) config
  either (assertFailure . toString . display) pure
    $ planAliasLayer target validated mempty families

-- | A guest without its host: the header it extends is not bound.
unit_orphanAuthoredRejected :: Assertion
unit_orphanAuthoredRejected =
  rejected [shimsFamily] "extends SDL_toy.h, which no bound library header produces"

-- | An authored header declares functions only, each named for what it
-- wraps.
unit_authoredTypesRejected :: Assertion
unit_authoredTypesRejected = do
  rejected [hostFamily, shimsFamily{hasBaseModule = True}] "declares types"
  rejected
    [hostFamily, familyOf "SDL3.Sys.Bindgen.ToyShims" "SDL_toy_shims.h" [misnamed]]
    "the authored function SDL_ToyLog2 is not named lithon_SDL_"
 where
  misnamed = CFunction{cName = "SDL_ToyLog2", hsName = "sDL_ToyLog2", hasCallback = False}

-- | Plan the families with no function aliased (only the family rules
-- apply) and expect an 'AliasFamilyInvalid' saying the given text.
rejected :: [FamilyDecls] -> Text -> Assertion
rejected families needle =
  case planAliasLayer sdl3Shims validated mempty families of
    Right modules -> assertFailure ("planned " <> show (map (.moduleName) modules))
    Left errs ->
      assertBool
        ("no family error says " <> show needle <> " in:\n" <> toString (display errs))
        (any isFamilyError (toList errs))
 where
  isFamilyError = \case
    AliasFamilyInvalid{reason} -> needle `T.isInfixOf` reason
    _other -> False
  validated =
    ValidatedAliasConfig
      { naming = CamelSegments
      , safeties = mempty
      , rationales = mempty
      , renames = mempty
      , skipped = mempty
      , allowlisted = mempty
      }

hostFamily, shimsFamily :: FamilyDecls
hostFamily = familyOf "SDL3.Sys.Bindgen.Toy" "SDL_toy.h" []
shimsFamily = familyOf "SDL3.Sys.Bindgen.ToyShims" "SDL_toy_shims.h" []

-- | A family with only its functions' C names (no translations).
familyOf :: Text -> FilePath -> [CFunction] -> FamilyDecls
familyOf familyBase headerName functions =
  FamilyDecls
    { familyBase
    , headerName
    , hasBaseModule = False
    , moduleDoc = Nothing
    , functions
    , funDecls = mempty
    , newtypeConstrs = mempty
    , takenNames = mempty
    }
