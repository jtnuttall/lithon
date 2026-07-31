{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The SDL3 configuration of the generic bindgen fold
-- ("Lithon.Codegen.Bindgen"): the header plan, the invocation environment,
-- and the visitors — platform shims, version gates, and the finalizer
-- distilling the alias-layer facts and the ABI assertion inputs.
module Lithon.Codegen.Sdl3.Bindgen (
  -- * Plan + environment
  baseNamespace,
  mainIncludes,
  sdl3Plan,
  sdl3BindgenOpts,
  sdl3ModuleFor,

  -- * Visitors
  Sdl3Payload (..),
  sdl3Visitor,
  platformShims,
  versionGates,
  stubEditsFor,
  textEditsFor,
) where

import Data.List qualified as L
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.HsBindgen qualified as HB
import Lithon.HsBindgen.C qualified as C
import Lithon.Prelude
import System.FilePath ((<.>), (</>))

import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen (
  BindgenOpts (..),
  HeaderPlan (..),
  HeaderUnit (..),
  PackageInfo (..),
  Passes (..),
  Visitor (..),
  defaultSpecFileName,
 )
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

-- | Root of the generated namespace.
baseNamespace :: Module.Meta
baseNamespace = $$(Module.metaLit ["SDL3", "Sys", "Bindgen"])

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

-- | @SDL_platform_defines.h@ -> @SDL3.Sys.Bindgen.PlatformDefines@:
-- 'Module.JoinConcat' fuses the underscore-split words into one PascalCase
-- segment, reproducing the historical SDL3 module names byte-for-byte.
sdl3Mangle :: Module.MangleOpts
sdl3Mangle = def{Module.stripPrefix = Just "SDL_", Module.segmentJoin = Module.JoinConcat}

-- | The full module name for one SDL public-header basename (the census
-- derives header->module rows through this, so it cannot drift from the
-- chain's own minting).
sdl3ModuleFor :: FilePath -> Either Module.MangleError Module.Meta
sdl3ModuleFor basename =
  (baseNamespace <>) . view Module.metaL <$> Module.mangleHeader basename sdl3Mangle

-- | The SDL3 header universe, as data.
sdl3Plan :: HeaderPlan
sdl3Plan =
  HeaderPlan
    { baseNamespace
    , mangle = sdl3Mangle
    , projectHeader = sdl3Basename
    , includeArg = ("SDL3" </>)
    , excludedHeaders
    , mainIncludes
    , specFileName = defaultSpecFileName
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

-- | The SDL3 generation run: the shared invocation environment plus the
-- prescriptive overrides registry, when present.
sdl3BindgenOpts :: Sdl3Env -> BindgenOpts
sdl3BindgenOpts env =
  BindgenOpts
    { invocationEnv = sdl3InvocationEnv env
    , prescriptiveSpec = env.overridesRegistryPath
    , packageInfo =
        PackageInfo
          { name = "sdl3-bindgen-sys"
          , dataDir = env.sdl3SpecDir
          , version = Nothing
          }
    }

-- | The per-header payload SDL3 distills from each fold step.
data Sdl3Payload = Sdl3Payload
  { facts :: FamilyDecls
  -- ^ The alias-layer distillate (function census + translated decls).
  , abi :: [AbiDecl]
  -- ^ The layout distillate feeding the ABI assertion TU.
  }

-- | The whole SDL3 visitor: platform shims before version gates (gates
-- match lines the shims may have rewritten — ordering is contract), then
-- the payload distillation.
sdl3Visitor :: VersionsRegistry -> Visitor Sdl3Payload
sdl3Visitor registry =
  Visitor
    { passes = platformShims <> versionGates registry
    , finalize = \unit arts _rendered -> do
        abi <- distillAbi unit.headerName (abiOverrides registry) arts.cDecls
        -- A base (types) module exists iff hs-bindgen produced the CType
        -- category — the alias layer's sys modules re-export it only then.
        let hasBaseModule = any ((== Just HB.CType) . (.category)) arts.family
        pure
          Sdl3Payload
            { facts =
                distillFamily
                  (Module.hsName unit.moduleName)
                  unit.headerName
                  hasBaseModule
                  arts.headerComment
                  arts.hsDecls
                  arts.cDecls
            , abi
            }
    }

-- | The platform forward-compat shims, as a composable pass set.
platformShims :: Passes
platformShims =
  Passes
    { stubEdits = \unit _arts -> stubEditsFor unit.headerName
    , textEdits = \unit _arts -> textEditsFor unit.headerName
    }

-- | The version gates for the @>= 3.2@ floor, as a composable pass set
-- (reads the reified C declarations).
versionGates :: VersionsRegistry -> Passes
versionGates registry =
  Passes
    { stubEdits = \unit arts -> versionStubEdits registry unit.headerName arts.cDecls
    , textEdits = \_ _ -> []
    }

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
        , onMiss = HB.RequireHit
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
          , onMiss = HB.RequireHit
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
      , onMiss = HB.RequireHit
      , edit = \ls -> do
          i <- L.findIndex isTargetLine ls
          line <- ls L.!? i
          pure (prologue ls <> take i ls <> guardBlock line <> drop (i + 1) ls)
      }
   where
    isTargetLine l =
      or @[Bool]
        [ ("  return (" <> sym <> ")(") `T.isPrefixOf` l
        , ("  (" <> sym <> ")(") `T.isPrefixOf` l
        , l == ("  return &" <> sym <> ";")
        ]

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
