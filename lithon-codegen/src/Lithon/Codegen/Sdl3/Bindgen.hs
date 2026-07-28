{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}

-- | Driving hs-bindgen over the SDL3 headers.
--
-- Mirrors upstream's own multi-header idiom (@examples\/cef@ in the
-- vendored tree).
module Lithon.Codegen.Sdl3.Bindgen (
  BindgenError (..),
  HeaderUnit (..),
  HeaderResult (..),
  preflightGraph,
  planHeaders,
  chainHeaders,
  baseNamespace,
  mainIncludes,
  mangleModule,
  stubEditsFor,
  textEditsFor,
) where

import Data.Aeson qualified as A
import Data.List qualified as L
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Effectful
import Effectful.Error.Dynamic
import Lithon.Effect.Log
import Lithon.Effect.Temporary (SystemTempDir (SystemTempDir))
import Lithon.HsBindgen qualified as HB
import Lithon.HsBindgen.C qualified as C
import Lithon.Prelude
import System.FilePath ((<.>), (</>))

import Lithon.Codegen.Sdl3.Abi (AbiDecl, AbiSince (..), declSince, distillAbi, sdlBaseline)
import Lithon.Codegen.Sdl3.Alias (FamilyDecls, distillFamily)
import Lithon.Codegen.Sdl3.Env
import Lithon.Codegen.Sdl3.Versions (
  PrologueEntry (..),
  TypedefShape (..),
  Versioned (..),
  VersionsRegistry (..),
  abiOverrides,
 )

data BindgenError
  = DuplicateModules (Set Text)
  | NoHeadersFound
  | UnexpectedHeaderName FilePath
  | HsBindgenError Text HB.BindgenFailure
  | ModuleShimFailed FilePath HB.TransformError
  | AbiDistillationFailure FilePath Text
  | BindgenPanic Text
  deriving stock (Show)

instance Display BindgenError where
  displayBuilder = \case
    DuplicateModules dupes -> "module name collisions:" <> intercalateTB "\n - " (map from . toList $ dupes)
    NoHeadersFound -> "no SDL3 headers found in the include graph"
    UnexpectedHeaderName path ->
      "found an SDL header that does not conform to the SDL_name.h convention: " <> from path
    HsBindgenError cxt err ->
      let errd = display err
       in from
            [trimmingQQ|
              $cxt: hs-bindgen invokation failed:

              $errd
            |]
    ModuleShimFailed header terr ->
      let headerd = from header
          detail = case terr of
            HB.StubEditMissed label symbol target ->
              "stub edit "
                <> label
                <> " landed on no wrapper of "
                <> symbol
                <> " (expected: "
                <> target
                <> ")"
            HB.TextEditMissed label needle ->
              "text edit " <> label <> " matched no module (needle=" <> needle <> ")"
          detaild = detail
       in from
            [trimmingQQ|
              $headerd: platform shim drifted: $detaild
            |]
    AbiDistillationFailure header reason ->
      let headerd = from header
       in from
            [trimmingQQ|
              $headerd: failed while trying to distill ABI.

              $reason
            |]
    BindgenPanic what ->
      from
        [trimmingQQ|
          panicked while trying to generate bindings via hs-bindgen: 

            $what

          This is a bug in lithon-codegen; please open an issue upstream.
        |]

-- | One public header = one invocation = one module family.
data HeaderUnit = HeaderUnit
  { include :: FilePath
  -- ^ The hash-include argument, e.g. @SDL3\/SDL_video.h@.
  , headerName :: FilePath
  -- ^ Basename, e.g. @SDL_video.h@ — the census\/artifact key.
  , moduleName :: Text
  -- ^ The types module, e.g. @SDL3.Sys.Bindgen.Video@; term categories
  -- hang off it (@.Safe@, @.Unsafe@, @.FunPtr@, @.Global@).
  , specFile :: FilePath
  -- ^ Spec artifact basename, e.g. @SDL_video.yaml@.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (A.ToJSON)

-- | The rendered output of one header's invocation.
data HeaderResult = HeaderResult
  { unit :: HeaderUnit
  , modules :: [(Text, Text)]
  -- ^ Module name -> source text, for the categories hs-bindgen produced.
  , facts :: FamilyDecls
  -- ^ The alias-layer distillate (function census + translated decls).
  , abi :: [AbiDecl]
  -- ^ The layout distillate feeding the ABI assertion TU.
  }

-- | Root of the generated namespace.
baseNamespace :: Text
baseNamespace = "SDL3.Sys.Bindgen"

excludedHeaders :: Set FilePath
excludedHeaders = sdlMain <> sdlInternal <> egl <> gl
 where
  sdlMain = ["SDL.h", "SDL_main_impl.h"]
  sdlInternal =
    [ "SDL_begin_code.h"
    , "SDL_close_code.h"
    , "SDL_copying.h"
    , "SDL_oldnames.h"
    ]
  egl = ["SDL_egl.h"]
  gl =
    from
      [ "SDL_opengl" <> suffix <.> "h"
      | suffix <-
          ["", "_glext", "es", "es2", "es2_gl2", "es2_gl2ext", "es2_gl2platform", "es2_khrplatform"]
      ]

-- | Headers bound although @SDL.h@ does not include them.
extraMains :: [FilePath]
extraMains = ["SDL3/SDL_vulkan.h", "SDL3/SDL_main.h"]

-- | The census include set — the umbrella plus 'extraMains'. Consumers
-- that must mirror generation exactly (the preflight, the ABI assertion
-- TU's prologue) take it from here so they cannot drift from the chain.
mainIncludes :: [FilePath]
mainIncludes = "SDL3/SDL.h" : extraMains

-- | Invocation environment shared by every hs-bindgen run.
--
-- - @SDL_MAIN_HANDLED@ keeps @SDL_main.h@ from planting its @#define main@
-- hijack (the declarations remain).
--
-- - Field prefixes are omitted per the lithon record style; hs-bindgen emits
-- @DuplicateRecordFields@ + @NoFieldSelectors@ pragmas as needed.
--
-- - Program slicing stays OFF (the seam's default): the SDL headers are
-- self-contained, so an unresolved reference will fail loudly.
sdl3InvocationEnv :: Sdl3Env -> HB.InvocationEnv
sdl3InvocationEnv env =
  HB.InvocationEnv
    { extraIncludeDirs = [env.includeDir]
    , defineMacros = ["SDL_MAIN_HANDLED"]
    , -- SDL's Doxyfile defines \threadsafety; without the alias doxygen
      -- passes the command through as literal text and every function doc
      -- leaks "\threadsafety ..." verbatim. \par routes it through the
      -- existing simplesect rendering as a bold "Thread safety:" line.
      doxygenAliases = [("threadsafety", "\\par Thread safety:^^")]
    , fieldNaming = HB.OmitFieldPrefixes
    , uniqueId = "sdl3-bindgen-sys"
    }

-- | One boot+frontend run over the umbrella + extras, returning the
-- include graph (dependency-ordered source paths) that orders the real
-- per-header chain.
preflightGraph :: (IOE :> es, Sdl3Gen :> es, Error BindgenError :> es) => Eff es [FilePath]
preflightGraph = runSdl3Bindgen [] Nothing "Preflight" mainIncludes HB.sortedIncludeGraph

-- | Project the include graph onto the bound header set, in dependency order.
planHeaders :: (Error BindgenError :> es) => [FilePath] -> Eff es [HeaderUnit]
planHeaders graph = do
  let inScope =
        [ basename
        | path <- graph
        , Just basename <- [sdl3Basename path]
        , basename `notElem` excludedHeaders
        ]
  units <- traverse toUnit inScope

  case duplicates (map (.moduleName) units) of
    [] -> pure ()
    collisions -> throwError $ DuplicateModules collisions

  when (null units) $ throwError NoHeadersFound
  pure units
 where
  toUnit basename = do
    moduleName <- mangleModule basename
    pure
      HeaderUnit
        { include = "SDL3" </> basename
        , headerName = basename
        , moduleName
        , specFile = toString (T.dropEnd 2 (T.pack basename)) <.> "yaml"
        }

-- | Absolute source path -> SDL3 public-header basename (@Nothing@ for
-- libc headers, clang builtins, and anything else outside @SDL3\/@).
sdl3Basename :: FilePath -> Maybe FilePath
sdl3Basename path =
  case T.splitOn "/SDL3/" (T.pack path) of
    [_, basename]
      | not (T.null basename)
      , not ("/" `T.isInfixOf` basename) ->
          Just (toString basename)
    _ -> Nothing

-- | @SDL_platform_defines.h@ -> @SDL3.Sys.Bindgen.PlatformDefines@.
mangleModule :: (Error BindgenError :> es) => FilePath -> Eff es Text
mangleModule basename = do
  let mstem = T.stripPrefix "SDL_" (T.pack basename) >>= T.stripSuffix ".h"
  stem <- maybe (throwError (UnexpectedHeaderName basename)) pure mstem
  let segments = filter (not . T.null) (T.splitOn "_" stem)
  when (null segments) do
    throwError $ BindgenPanic ("header name mangles to nothing: " <> T.pack basename)

  pure (baseNamespace <> "." <> T.concat (map capitalize segments))
 where
  capitalize seg = T.toUpper (T.take 1 seg) <> T.drop 1 seg

-- | Fold the chain in dependency order: every invocation consumes the
-- specs generated by its predecessors (plus the stdlib spec) as external
-- binding specifications and writes its own into @specDir@.
chainHeaders
  :: (IOE :> es, Log :> es, Error BindgenError :> es, Sdl3Gen :> es)
  => Maybe FilePath
  -- ^ The curated prescriptive spec (overrides), if present.
  -> VersionsRegistry
  -- ^ The empirical availability registry (@sdl3\/versions.json@).
  -> [HeaderUnit]
  -> Eff es [HeaderResult]
chainHeaders overrides registry = go []
 where
  go _ [] = pure []
  go priorSpecs (unit : rest) = do
    SystemTempDir specDir <- getScratchDirectory
    logInfo $ "processing header" :# ["unit" .= unit]
    res <- runHeader specDir priorSpecs overrides registry unit
    (res :) <$> go ((specDir </> unit.specFile) : priorSpecs) rest

-- | One header's invocation: translate every category module, apply the
-- platform shims at the AST level, render, and write the header's binding
-- spec (executed only if no error trace fired).
runHeader
  :: (IOE :> es, Error BindgenError :> es, Sdl3Gen :> es)
  => FilePath
  -> [FilePath]
  -> Maybe FilePath
  -> VersionsRegistry
  -> HeaderUnit
  -> Eff es HeaderResult
runHeader specDir priorSpecs overrides registry unit = do
  (family, hsDecls, cDecls, mdoc) <- invoke
  shimmed <-
    liftEither
      . first (ModuleShimFailed unit.headerName)
      $ HB.applyStubEdits
        (stubEditsFor unit.headerName <> versionStubEdits registry unit.headerName cDecls)
        family
  modules <-
    liftEither
      . first (ModuleShimFailed unit.headerName)
      $ HB.renderFamilyWith (textEditsFor unit.headerName) shimmed
  abi <-
    liftEither
      . first (AbiDistillationFailure unit.headerName)
      $ distillAbi unit.headerName (abiOverrides registry) cDecls
  let hasBaseModule = unit.moduleName `elem` map fst modules
  pure
    HeaderResult
      { unit
      , modules
      , facts =
          distillFamily unit.moduleName unit.headerName hasBaseModule mdoc hsDecls cDecls
      , abi
      }
 where
  invoke = runSdl3Bindgen priorSpecs overrides unit.moduleName [unit.include] do
    family <- HB.translatedFamily
    hsDecls <- HB.reifiedHs
    cDecls <- HB.reifiedC
    mdoc <- HB.headerComment
    HB.writeSpec (specDir </> unit.specFile)
    pure (family, hsDecls, cDecls, mdoc)

-- | One seam invocation with the shared SDL3 environment.
runSdl3Bindgen
  :: (IOE :> es, Sdl3Gen :> es, Error BindgenError :> es)
  => [FilePath]
  -> Maybe FilePath
  -> Text
  -> [FilePath]
  -> HB.BindgenM a
  -> Eff es a
runSdl3Bindgen priorSpecs overrides baseModule includes ops = do
  env <- getSdl3Env
  let spec =
        HB.InvocationSpec
          { baseModule
          , includes
          , priorSpecs
          , prescriptiveSpec = overrides
          }
  res <- liftIO $ HB.runBindgen (sdl3InvocationEnv env) spec ops
  either (throwError . HsBindgenError baseModule) pure res

-- | Platform forward-compat shims by header, as data; the seam owns the
-- mechanism ("Lithon.HsBindgen.Transform") and fails loudly when a shim
-- no longer finds its target.
--
-- The embedded wrapper C compiles against the USER'S headers, so anything
-- the target platform does not declare must be guarded here:
-- @SDL_SetLinuxThreadPriority(AndPolicy)@ are the only bound functions
-- SDL declares under a platform @#ifdef@; off-Linux the wrappers become
-- stubs that raise @SDL_SetError@ and return false \/ a NULL function
-- pointer, so the module still compiles and misuse fails loudly at the
-- call site (@SDL_system.h@ includes @SDL_error.h@, so @SDL_SetError@ is
-- always declared). Haskell surface unchanged.
stubEditsFor :: FilePath -> [HB.StubEdit]
stubEditsFor = \case
  "SDL_system.h" ->
    linuxGuard
      "SDL_SetLinuxThreadPriority"
      "(SDL_SetLinuxThreadPriority)(arg1, arg2);"
      "(void)arg1; (void)arg2; return SDL_SetError(\"SDL_SetLinuxThreadPriority is only available on Linux\");"
      <> linuxGuard
        "SDL_SetLinuxThreadPriorityAndPolicy"
        "(SDL_SetLinuxThreadPriorityAndPolicy)(arg1, arg2, arg3);"
        "(void)arg1; (void)arg2; (void)arg3; return SDL_SetError(\"SDL_SetLinuxThreadPriorityAndPolicy is only available on Linux\");"
  _otherHeader -> []
 where
  -- Guard both wrapper shapes of one symbol: the call wrapper
  -- (Safe/Unsafe) and the FunPtr address getter.
  linuxGuard :: Text -> Text -> Text -> [HB.StubEdit]
  linuxGuard symbol call stub =
    [ HB.replaceStubLine
        (symbol <> " call")
        symbol
        ("  return " <> call)
        [ "#ifdef SDL_PLATFORM_LINUX"
        , "  return " <> call
        , "#else"
        , "  " <> stub
        , "#endif"
        ]
    , HB.replaceStubLine
        (symbol <> " address")
        symbol
        ("  return &" <> symbol <> ";")
        [ "#ifdef SDL_PLATFORM_LINUX"
        , "  return &" <> symbol <> ";"
        , "#else"
        , "  SDL_SetError(\"" <> symbol <> " is only available on Linux\"); return 0;"
        , "#endif"
        ]
    ]

-- | Rendered-text shims by header — the escape hatch for edits the
-- wrapper model cannot express. @SDL_main.h@: without @SDL_MAIN_HANDLED@
-- defined BEFORE the include, Windows\/mobile headers @#define main
-- SDL_main@ and compile a real entry point into the wrapper object
-- (guaranteed link failure); the wrapper renderer emits all includes
-- before any body text, so the define has no structural home. Harmless
-- elsewhere.
textEditsFor :: FilePath -> [HB.TextEdit]
textEditsFor = \case
  "SDL_main.h" ->
    [ HB.TextEdit
        { label = "SDL_MAIN_HANDLED prologue"
        , needle = "[ \"#include <SDL3/SDL_main.h>\""
        , replacement = "[ \"#define SDL_MAIN_HANDLED\"\n  , \"#include <SDL3/SDL_main.h>\""
        }
    ]
  _otherHeader -> []

-- | Version gates for the @>= 3.2@ floor: every function whose
-- registry-corrected @\\since@ is later than the 3.2.0 baseline gets its
-- wrapper bodies guarded on SDL's own version macros — the call (or
-- FunPtr address) stays live at or above the version; below it the stub
-- raises @SDL_SetError@ and returns the zero of its return class. The
-- wrapper SYMBOL always exists, so consumer links never break; misuse on
-- an old SDL fails loudly at the call site. Each gated stub carries its
-- own prologue: @SDL_version.h@ plus ABI-equivalent stand-ins (from the
-- registry) for type names its signature uses that pre-3.4 headers do
-- not declare — linkage ignores C types, so an @int@\/pointer stand-in
-- is exact.
versionStubEdits :: VersionsRegistry -> FilePath -> [C.Decl l C.Final] -> [HB.StubEdit]
versionStubEdits registry headerName cDecls =
  retypePrologue
    <> [ versionGate name since (length fn.args)
       | decl <- cDecls
       , let name = decl.info.id.cName.name.text
       , C.DeclFunction fn <- [decl.kind]
       , Just since <-
           [ Map.lookup name declOverrides
               <|> declSince decl.info
           ]
       , since > sdlBaseline
       ]
 where
  declOverrides = (.since) <$> registry.decls

  -- The retype class: wrappers of functions that exist at 3.2 but whose
  -- 3.4 signatures use type names pre-3.4 headers do not declare. One
  -- family-wide edit prepends the guarded stand-ins to every wrapper
  -- that references one; hidden at or above 3.4, they can never
  -- conflict with the real declarations.
  retypePrologue = case headerTypedefs of
    [] -> []
    entries ->
      [ HB.StubEdit
          { label = T.pack headerName <> " version prologue"
          , symbol = Nothing
          , target = "wrappers referencing " <> T.intercalate ", " (map fst entries)
          , edit = \ls ->
              if any (\(n, _) -> any (n `T.isInfixOf`) ls) entries then
                Just
                  ( ["#include <SDL3/SDL_version.h>", "#if !SDL_VERSION_ATLEAST(3, 4, 0)"]
                      <> map snd entries
                      <> ["#endif"]
                      <> ls
                  )
              else
                Nothing
          }
      ]

  headerTypedefs =
    [ (n, typedefLine n e.shape)
    | (n, e) <- Map.toList registry.prologueTypedefs
    , headerName `elem` e.headers
    ]

  typedefLine n = \case
    ShapeInt -> "typedef int " <> n <> ";"
    ShapeUint32 -> "typedef Uint32 " <> n <> ";"
    ShapeOpaqueStruct -> "typedef struct " <> n <> " " <> n <> ";"
    ShapeVoidPtr -> "typedef void *" <> n <> ";"

  versionGate sym since arity =
    HB.StubEdit
      { label = sym <> " version gate"
      , symbol = Just sym
      , target = "the call/address line of " <> sym
      , edit = \ls -> do
          i <- L.findIndex isTargetLine ls
          line <- ls L.!? i
          pure (prologue ls <> take i ls <> guardBlock line <> drop (i + 1) ls)
      }
   where
    isTargetLine l =
      ("  return (" <> sym <> ")(")
        `T.isPrefixOf` l
        || ("  (" <> sym <> ")(")
        `T.isPrefixOf` l
        || l
        == ("  return &" <> sym <> ";")

    guardBlock line =
      [ "#if SDL_VERSION_ATLEAST(" <> versionArgs <> ")"
      , line
      , "#else"
      , "  " <> stubLine line
      , "#endif"
      ]

    stubLine line
      | line == ("  return &" <> sym <> ";") = setError <> " return 0;"
      | "  return " `T.isPrefixOf` line = silence <> setError <> " return 0;"
      | otherwise = silence <> setError

    setError = "SDL_SetError(\"" <> sym <> " requires SDL >= " <> versionText <> "\");"
    silence = T.concat ["(void)arg" <> show n <> "; " | n <- [1 .. arity]]

    -- The guard macro's home and the stub's error channel; per-header
    -- TUs reach neither on their own at 3.2 (SDL_cpuinfo.h has no
    -- transitive SDL_error.h there). Stand-in typedefs come from the
    -- family-wide retype prologue.
    prologue _ls =
      [ "#include <SDL3/SDL_version.h>"
      , "#include <SDL3/SDL_error.h>"
      ]

    versionArgs =
      T.intercalate ", " (map show [since.major, since.minor, since.patch])
    versionText =
      T.intercalate "." (map show [since.major, since.minor, since.patch])
