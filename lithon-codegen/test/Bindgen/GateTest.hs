{-# LANGUAGE OverloadedStrings #-}

-- | The version gates and the retype prologue, rendered through the real
-- hs-bindgen seam and the target's own visitor (its passes in production
-- order — shims, retype prologue, gates — and its finalizer), for both
-- version schemes:
--
-- * SDL's (three parts, a failure statement, a stub include), pinned line
--   by line against the shapes the committed @sdl3-bindgen-sys@ carries:
--   returning and void calls of arity zero and more, address getters, a
--   registry correction beating the docs, and the retype prologue.
--
-- * The mpv-shaped @toy2@'s (two parts through a comparison macro, no
--   failure statement, the registry as the only availability source,
--   @stub-return@ sentinels and polyfills, a prologue with two release
--   blocks), pinned by golden and — when a C compiler is on the path —
--   compiled against toy headers declaring what each release declares, at
--   the newest release, between the gates, and at the baseline.
--
-- A @stub-return@ no gated stub returns (on an ungated decl, or on a void
-- function) is reported as dead configuration.
module Bindgen.GateTest (
  unit_sdl3GateShapes,
  test_toy2GateGolden,
  unit_toy2GatesCompile,
  unit_unusedStubReturnsFlagged,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.List qualified as L
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Text.IO qualified as TIO
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.Directory (findExecutable)
import System.Exit (ExitCode (..))
import System.FilePath ((</>))
import System.Process (readProcessWithExitCode)
import Test.Tasty (TestTree)
import Test.Tasty.Golden (goldenVsStringDiff)
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Bindgen.Support.Targets (toy2)
import Bindgen.Support.Toy (ToyHeader (..), invokeToy, renderedPairs, toyEnv, withToyRoot)
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Chain (
  BindgenPayload (..),
  GatedDecl (..),
  UnusedStubReturn (..),
  bindgenVisitor,
  moduleFor,
  unusedStubReturns,
 )
import Lithon.Codegen.Bindgen.Driver (
  HeaderUnit (..),
  Passes (..),
  Visitor (..),
  defaultSpecFileName,
 )
import Lithon.Codegen.Bindgen.Target (BindgenTarget (..), VersionScheme (..), includeArg)
import Lithon.Codegen.Bindgen.Target.Sdl3 (sdl3)
import Lithon.Codegen.Bindgen.Versions (VersionsRegistry, decodeVersionsRegistry)

-- | One header's family after the target's visitor: the wrapper C of each
-- module that carries any (dotted module name, C lines), and the payload.
data Gated = Gated
  { wrappers :: [(Text, [Text])]
  , payload :: BindgenPayload
  }

-- | Run one header (under an existing toy root) through the seam, then
-- the target's production visitor.
gateFamily :: BindgenTarget -> VersionsRegistry -> String -> FilePath -> FilePath -> IO Gated
gateFamily target registry uniqueId root headerName = do
  moduleName <-
    either (assertFailure . toString . display) pure (moduleFor target headerName)
  let unit =
        HeaderUnit
          { include = includeArg target headerName
          , headerName
          , moduleName
          , specFile = defaultSpecFileName headerName
          }
      visitor = bindgenVisitor target registry
  arts <-
    invokeToy root (toyEnv uniqueId) (Module.hsName moduleName) [unit.include] HB.collectArtefacts
  shimmed <-
    either (assertFailure . show) pure
      $ HB.applyStubEdits (visitor.passes.stubEdits unit arts) arts.family
  rendered <-
    either (assertFailure . show) pure
      $ HB.renderFamilyWith (visitor.passes.textEdits unit arts) shimmed
  payload <- either (assertFailure . toString) pure (visitor.finalize unit arts rendered)
  pure
    Gated
      { wrappers =
          [ (name, c)
          | (name, source) <- sortOn fst (renderedPairs rendered)
          , let c = wrapperC source
          , not (null c)
          ]
      , payload
      }

-- | The C source of a rendered module's wrapper splice
-- (@addCSource (unlines [ "…", … ])@), one element per line.
wrapperC :: Text -> [Text]
wrapperC source =
  [ toText c
  | line <- dropWhile (not . T.isInfixOf "addCSource") (T.lines source)
  , Just literal <- [T.stripPrefix "[ " (T.stripStart line) <|> T.stripPrefix ", " (T.stripStart line)]
  , Just (c :: String) <- [readMaybe (toString literal)]
  ]

registryAt :: Int -> LByteString -> IO VersionsRegistry
registryAt arity = either (assertFailure . toString) pure . decodeVersionsRegistry arity

{-------------------------------------------------------------------------------
  SDL
-------------------------------------------------------------------------------}

sdlHeader :: Text
sdlHeader =
  unlines
    [ "#ifndef SDL_TOY_GATE_H"
    , "#define SDL_TOY_GATE_H"
    , ""
    , "typedef struct SDL_ToyThing SDL_ToyThing;"
    , "typedef int SDL_ToyMode;"
    , ""
    , "/**"
    , " * At the baseline: never gated."
    , " *"
    , " * \\since This function is available since SDL 3.2.0."
    , " */"
    , "int SDL_ToyBaseline(SDL_ToyThing *thing);"
    , ""
    , "/**"
    , " * A returning call with parameters."
    , " *"
    , " * \\since This function is available since SDL 3.4.0."
    , " */"
    , "int SDL_ToyGatedCall(SDL_ToyThing *thing, int flags);"
    , ""
    , "/**"
    , " * A returning call without parameters."
    , " *"
    , " * \\since This function is available since SDL 3.4.0."
    , " */"
    , "int SDL_ToyGatedNullary(void);"
    , ""
    , "/**"
    , " * A void call with a parameter."
    , " *"
    , " * \\since This function is available since SDL 3.4.0."
    , " */"
    , "void SDL_ToyGatedVoid(SDL_ToyThing *thing);"
    , ""
    , "/**"
    , " * A void call without parameters."
    , " *"
    , " * \\since This function is available since SDL 3.4.0."
    , " */"
    , "void SDL_ToyGatedVoidNullary(void);"
    , ""
    , "/**"
    , " * Its docs claim 3.4.0; the registry knows better."
    , " *"
    , " * \\since This function is available since SDL 3.4.0."
    , " */"
    , "int SDL_ToyCorrected(int x);"
    , ""
    , "/**"
    , " * The retype class: exists at the baseline, names SDL_ToyMode at 3.4."
    , " *"
    , " * \\since This function is available since SDL 3.2.0."
    , " */"
    , "SDL_ToyMode SDL_ToyGetMode(SDL_ToyThing *thing);"
    , ""
    , "#endif"
    ]

sdlRegistry :: LByteString
sdlRegistry =
  "{\"decls\": {\"SDL_ToyCorrected\": {\"since\": \"3.2.4\"}},\
  \ \"prologue-typedefs\": {\
  \  \"SDL_ToyMode\": {\"since\": \"3.4.0\", \"shape\": \"int\", \"headers\": [\"SDL_toy_gate.h\"]},\
  \  \"SDL_ToyID\": {\"since\": \"3.4.0\", \"shape\": \"Uint32\", \"headers\": [\"SDL_toy_gate.h\"]}}}"

unit_sdl3GateShapes :: IO ()
unit_sdl3GateShapes = do
  registry <- registryAt sdl3.versioning.arity sdlRegistry
  gated <-
    withToyRoot [ToyHeader{include = "SDL3/SDL_toy_gate.h", source = sdlHeader}] \root ->
      gateFamily sdl3 registry "lithon-gate-sdl3" root "SDL_toy_gate.h"
  [(decl.name, decl.returnsVoid) | decl <- gated.payload.gated]
    @?= [ ("SDL_ToyGatedCall", False)
        , ("SDL_ToyGatedNullary", False)
        , ("SDL_ToyGatedVoid", True)
        , ("SDL_ToyGatedVoidNullary", True)
        , ("SDL_ToyCorrected", False)
        ]
  calls <- wrappersOf gated "SDL3.Sys.Bindgen.ToyGate.Unsafe"
  addresses <- wrappersOf gated "SDL3.Sys.Bindgen.ToyGate.FunPtr"
  let stub sym since = "SDL_SetError(\"" <> sym <> " requires SDL >= " <> since <> "\");"
      gate since live dead = ["#if SDL_VERSION_ATLEAST(" <> since <> ")", live, "#else", dead, "#endif"]
  -- The five call shapes.
  calls
    `contains` gate
      "3, 4, 0"
      "  return (SDL_ToyGatedCall)(arg1, arg2);"
      ("  (void)arg1; (void)arg2; " <> stub "SDL_ToyGatedCall" "3.4.0" <> " return 0;")
  calls
    `contains` gate
      "3, 4, 0"
      "  return (SDL_ToyGatedNullary)();"
      ("  " <> stub "SDL_ToyGatedNullary" "3.4.0" <> " return 0;")
  calls
    `contains` gate
      "3, 4, 0"
      "  (SDL_ToyGatedVoid)(arg1);"
      ("  (void)arg1; " <> stub "SDL_ToyGatedVoid" "3.4.0")
  calls
    `contains` gate
      "3, 4, 0"
      "  (SDL_ToyGatedVoidNullary)();"
      ("  " <> stub "SDL_ToyGatedVoidNullary" "3.4.0")
  -- The registry beats the header's own \since.
  calls
    `contains` gate
      "3, 2, 4"
      "  return (SDL_ToyCorrected)(arg1);"
      ("  (void)arg1; " <> stub "SDL_ToyCorrected" "3.2.4" <> " return 0;")
  -- Every gated wrapper carries the version macros' and the failure
  -- channel's homes; the baseline function stays ungated.
  occurrences ["#include <SDL3/SDL_version.h>", "#include <SDL3/SDL_error.h>"] calls @?= 5
  calls `contains` ["{", "  return (SDL_ToyBaseline)(arg1);", "}"]
  -- The address shape: no arguments to silence.
  addresses
    `contains` gate
      "3, 4, 0"
      "  return &SDL_ToyGatedVoid;"
      ("  " <> stub "SDL_ToyGatedVoid" "3.4.0" <> " return 0;")
  -- The retype prologue: the macro home, then the stand-ins below their
  -- release, sorted by name, on every wrapper naming one.
  let prologue =
        [ "#include <SDL3/SDL_version.h>"
        , "#if !SDL_VERSION_ATLEAST(3, 4, 0)"
        , "typedef Uint32 SDL_ToyID;"
        , "typedef int SDL_ToyMode;"
        , "#endif"
        ]
  occurrences prologue calls @?= 1
  occurrences prologue addresses @?= 1

{-------------------------------------------------------------------------------
  toy2 (mpv-shaped)
-------------------------------------------------------------------------------}

-- | The version macros, spelled as libmpv spells its own; the header's
-- release defaults to the newest, and a compile overrides it to play an
-- older one.
toyVersionHeader :: Text
toyVersionHeader =
  unlines
    [ "#ifndef TOY_VERSION_H"
    , "#define TOY_VERSION_H"
    , "#define TOY_MAKE_VERSION(major, minor) (((major) << 16) | (minor) | 0UL)"
    , "#ifndef TOY_API_VERSION"
    , "#define TOY_API_VERSION TOY_MAKE_VERSION(2, 2)"
    , "#endif"
    , "#endif"
    ]

-- | Declares exactly what each release declares: 2.1 retypes
-- @toy_set_mode@ to a new enum and adds @toy_remove@; 2.2 adds a
-- nanosecond clock, a nullary query, a void call, and two functions over
-- new types.
toyGateHeader :: Text
toyGateHeader =
  unlines
    [ "#ifndef TOY_GATE_H"
    , "#define TOY_GATE_H"
    , ""
    , "#include \"toy_version.h\""
    , ""
    , "typedef struct toy_handle toy_handle;"
    , ""
    , "typedef enum toy_error {"
    , "  TOY_ERROR_SUCCESS = 0,"
    , "  TOY_ERROR_UNSUPPORTED = -18"
    , "} toy_error;"
    , ""
    , "int toy_open(toy_handle **out);"
    , "long long toy_time_us(toy_handle *h);"
    , ""
    , "#if TOY_API_VERSION >= TOY_MAKE_VERSION(2, 1)"
    , "typedef enum toy_mode { TOY_MODE_OFF = 0, TOY_MODE_ON = 1 } toy_mode;"
    , "int toy_set_mode(toy_handle *h, toy_mode mode);"
    , "int toy_remove(toy_handle *h, const char *name);"
    , "#else"
    , "int toy_set_mode(toy_handle *h, int mode);"
    , "#endif"
    , ""
    , "#if TOY_API_VERSION >= TOY_MAKE_VERSION(2, 2)"
    , "typedef struct toy_node toy_node;"
    , "typedef void (*toy_log_fn)(const char *line);"
    , "long long toy_time_ns(toy_handle *h);"
    , "int toy_pending(void);"
    , "void toy_flush(toy_handle *h);"
    , "int toy_attach(toy_handle *h, toy_node *node);"
    , "int toy_set_logger(toy_handle *h, toy_log_fn fn);"
    , "#endif"
    , ""
    , "#endif"
    ]

toyRegistry :: LByteString
toyRegistry =
  "{\"decls\": {\
  \  \"toy_remove\": {\"since\": \"2.1\", \"stub-return\": \"TOY_ERROR_UNSUPPORTED\"},\
  \  \"toy_time_ns\": {\"since\": \"2.2\", \"stub-return\": \"toy_time_us(arg1) * 1000\"},\
  \  \"toy_pending\": {\"since\": \"2.2\"},\
  \  \"toy_flush\": {\"since\": \"2.2\"},\
  \  \"toy_attach\": {\"since\": \"2.2\"},\
  \  \"toy_set_logger\": {\"since\": \"2.2\"}},\
  \ \"prologue-typedefs\": {\
  \  \"toy_mode\": {\"since\": \"2.1\", \"shape\": \"int\", \"headers\": [\"toy_gate.h\"]},\
  \  \"toy_node\": {\"since\": \"2.2\", \"shape\": \"opaque-struct\", \"headers\": [\"toy_gate.h\"]},\
  \  \"toy_log_fn\": {\"since\": \"2.2\", \"shape\": \"void-ptr\", \"headers\": [\"toy_gate.h\"]}}}"

toyHeaders :: [ToyHeader]
toyHeaders =
  [ ToyHeader{include = "toy2/toy_version.h", source = toyVersionHeader}
  , ToyHeader{include = "toy2/toy_gate.h", source = toyGateHeader}
  ]

-- | The toy2 family under a live toy root.
withToy2Gated :: (FilePath -> Gated -> IO a) -> IO a
withToy2Gated k = do
  registry <- registryAt toy2.versioning.arity toyRegistry
  withToyRoot toyHeaders \root ->
    k root =<< gateFamily toy2 registry "lithon-gate-toy2" root "toy_gate.h"

-- | The address getters and the unsafe call wrappers (the safe module's
-- are the same C under other symbol names; 'unit_toy2GatesCompile'
-- compiles all three).
test_toy2GateGolden :: TestTree
test_toy2GateGolden =
  goldenVsStringDiff
    "gate-toy2"
    (\ref new -> ["diff", "-u", ref, new])
    ("test/golden/bindgen" </> "gate-toy2.golden")
    do
      gated <- withToy2Gated \_root gated -> pure gated
      pure
        . LBS.fromStrict
        . TE.encodeUtf8
        . T.unlines
        $ ("/* gated: " <> T.unwords (map (.name) gated.payload.gated) <> " */")
        : concat
          [ ("/* ---- " <> name <> " ---- */") : c
          | (name, c) <- gated.wrappers
          , not (".Safe" `T.isSuffixOf` name)
          ]

-- | Every wrapper TU compiles against the headers of the newest release,
-- of the release between the gates, and of the baseline: the gates hide
-- what an older release lacks, the stand-ins name what it does not
-- declare, and the stub returns are expressions it does declare.
unit_toy2GatesCompile :: IO ()
unit_toy2GatesCompile =
  findExecutable "cc" >>= \case
    Nothing ->
      putStrLn @Text
        "TOY2 GATE COMPILE SKIPPED: no cc on PATH; run inside the dev shell for the real check"
    Just cc -> withToy2Gated \root gated -> do
      length gated.wrappers @?= 3
      for_ gated.wrappers \(name, c) -> do
        let file = root </> toString name <> ".c"
        TIO.writeFile file (T.unlines c)
        for_ [Nothing, Just "2, 1", Just ("2, 0" :: Text)] \release -> do
          let args =
                ["-std=c17", "-fsyntax-only", "-Werror=implicit-function-declaration", "-I", root]
                  <> ["-DTOY_API_VERSION=TOY_MAKE_VERSION(" <> toString r <> ")" | Just r <- [release]]
                  <> [file]
          (code, _out, err) <- readProcessWithExitCode cc args ""
          assertBool
            (toString name <> " at " <> maybe "the newest release" toString release <> ":\n" <> err)
            (code == ExitSuccess)

-- | A @stub-return@ is only meaningful on a gated function that returns a
-- value; one on a baseline function, on a non-function, or on a gated
-- void function is dead configuration.
unit_unusedStubReturnsFlagged :: IO ()
unit_unusedStubReturnsFlagged = do
  stray <-
    registryAt
      2
      "{\"decls\": {\
      \  \"toy_remove\": {\"since\": \"2.1\", \"stub-return\": \"TOY_ERROR_UNSUPPORTED\"},\
      \  \"toy_open\": {\"since\": \"2.0\", \"stub-return\": \"-1\"},\
      \  \"toy_error\": {\"since\": \"2.1\", \"stub-return\": \"0\"},\
      \  \"toy_flush\": {\"since\": \"2.2\", \"stub-return\": \"0\"}}}"
  registry <- registryAt 2 toyRegistry
  withToy2Gated \_root gated -> do
    unusedStubReturns registry [gated.payload] @?= []
    unusedStubReturns stray [gated.payload]
      @?= [("toy_error", NotGated), ("toy_flush", ReturnsVoid), ("toy_open", NotGated)]

{-------------------------------------------------------------------------------
  Line matching
-------------------------------------------------------------------------------}

wrappersOf :: Gated -> Text -> IO [Text]
wrappersOf gated name =
  maybe (assertFailure ("no wrapper C in " <> toString name)) pure (L.lookup name gated.wrappers)

contains :: [Text] -> [Text] -> IO ()
contains haystack needle =
  assertBool
    (toString (T.unlines ("expected the block:" : needle <> ["in:"] <> haystack)))
    (needle `L.isInfixOf` haystack)

occurrences :: [Text] -> [Text] -> Int
occurrences needle haystack = length (filter (needle `L.isPrefixOf`) (L.tails haystack))
