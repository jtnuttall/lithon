{-# LANGUAGE OverloadedStrings #-}

-- | Authored C headers as chain units: a header lithon writes for a
-- target ('toy2Shims': @toy2-shims\/toy_thing_shims.h@ over the library's
-- @toy2\/toy_thing.h@) joins the include graph after the header it
-- includes, binds through that header's spec, and its wrapper C includes
-- it under its own root; and the data directory holds exactly the listed
-- headers ('resolveAuthoredInclude').
module Bindgen.AuthoredTest (
  unit_authoredHeaderChains,
  unit_authoredIncludeResolution,
) where

import Data.List qualified as L
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Effectful (runEff)
import Effectful.Error.Dynamic (runErrorNoCallStack)
import Lithon.Effect.ClangEnv (PkgDbEntry (..))
import Lithon.Effect.FileSystem (runFileSystem)
import Lithon.Effect.Log (runLog)
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.Directory (createDirectory, createDirectoryIfMissing)
import System.FilePath (takeDirectory, (</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure, (@?=))

import Bindgen.Support.Targets (toy2, toy2Shims)
import Bindgen.Support.Toy (ToyHeader (..), renderedPairs, runToyChain, toyEnv, wrapperC)
import Lithon.Codegen.Backend.Hs.Module qualified as Module
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
import Lithon.Codegen.Bindgen.Target (BindgenTarget, headerPlan)

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
 where
  listed = "include/toy2-shims/toy_thing_shims.h"

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
