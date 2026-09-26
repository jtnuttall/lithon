{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | A target's configuration of the generic bindgen fold
-- ("Lithon.Codegen.Bindgen"): the header plan, the invocation environment,
-- and the visitor — the target's shims, the version gates, and the
-- finalizer distilling the alias-layer facts and the ABI assertion inputs.
module Lithon.Codegen.Sys.Chain (
  -- * Plan + environment
  headerPlan,
  bindgenOpts,
  moduleFor,

  -- * Visitors
  SysPayload (..),
  sysVisitor,
  versionGates,
) where

import Data.List qualified as L
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.HsBindgen qualified as HB
import Lithon.HsBindgen.C qualified as C
import Lithon.Prelude

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
import Lithon.Codegen.Sys.Abi (AbiDecl, distillAbi)
import Lithon.Codegen.Sys.Alias (FamilyDecls, distillFamily)
import Lithon.Codegen.Sys.Env
import Lithon.Codegen.Sys.Target (
  GateStubs (..),
  HeaderSpec (..),
  ParseEnv (..),
  SysTarget (..),
  VersionScheme (..),
  bindgenNamespace,
  defineArg,
  includeArg,
  includeLine,
  mainIncludeArgs,
  projectHeaderUnder,
 )
import Lithon.Codegen.Sys.Version (AbiSince (..))
import Lithon.Codegen.Sys.Versions (
  PrologueEntry (..),
  TypedefShape (..),
  Versioned (..),
  VersionsRegistry (..),
  abiOverrides,
 )

-- | The full module name for one public-header basename (the census
-- derives header->module rows through this, so it cannot drift from the
-- chain's own minting).
moduleFor :: SysTarget -> FilePath -> Either Module.MangleError Module.Meta
moduleFor target basename =
  (bindgenNamespace target <>)
    . view Module.metaL
    <$> Module.mangleHeader basename target.headers.mangle

-- | The target's header universe, as data.
headerPlan :: SysTarget -> HeaderPlan
headerPlan target =
  HeaderPlan
    { baseNamespace = bindgenNamespace target
    , mangle = target.headers.mangle
    , projectHeader = projectHeaderUnder target.headers.includeRoot
    , includeArg = includeArg target
    , excludedHeaders = target.headers.excluded
    , mainIncludes = mainIncludeArgs target
    , specFileName = defaultSpecFileName
    }

-- | Invocation environment shared by every hs-bindgen run.
--
-- - The target's defines and doxygen aliases apply to every header.
--
-- - Field prefixes are omitted per the lithon record style; hs-bindgen emits
-- @DuplicateRecordFields@ + @NoFieldSelectors@ pragmas as needed.
--
-- - Program slicing stays OFF (the seam's default): the headers are
-- expected to be self-contained, so an unresolved reference will fail
-- loudly.
--
-- - The package name is the @uniqueId@: it seeds the wrapper symbol hashes.
invocationEnv :: SysTarget -> SysEnv -> HB.InvocationEnv
invocationEnv target env =
  HB.InvocationEnv
    { extraIncludeDirs = [env.includeDir]
    , defineMacros = map defineArg target.parse.defines
    , doxygenAliases = target.parse.doxygenAliases
    , fieldNaming = HB.OmitFieldPrefixes
    , uniqueId = toString target.packageName
    }

-- | The target's generation run: the shared invocation environment plus
-- the prescriptive overrides registry, when present.
bindgenOpts :: SysTarget -> SysEnv -> BindgenOpts
bindgenOpts target env =
  BindgenOpts
    { invocationEnv = invocationEnv target env
    , prescriptiveSpec = env.overridesRegistryPath
    , packageInfo =
        PackageInfo
          { name = target.packageName
          , dataDir = env.dataDir
          , version = Nothing
          }
    }

-- | The per-header payload distilled from each fold step.
data SysPayload = SysPayload
  { facts :: FamilyDecls
  -- ^ The alias-layer distillate (function census + translated decls).
  , abi :: [AbiDecl]
  -- ^ The layout distillate feeding the ABI assertion TU.
  }

-- | The whole visitor: the target's shims before the version gates (gates
-- match lines the shims may have rewritten — ordering is contract), then
-- the payload distillation.
sysVisitor :: SysTarget -> VersionsRegistry -> Visitor SysPayload
sysVisitor target registry =
  Visitor
    { passes = target.shims <> versionGates target registry
    , finalize = \unit arts _rendered -> do
        abi <- distillAbi target.versioning unit.headerName (abiOverrides registry) arts.cDecls
        -- A base (types) module exists iff hs-bindgen produced the CType
        -- category — the alias layer's sys modules re-export it only then.
        let hasBaseModule = any ((== Just HB.CType) . (.category)) arts.family
        pure
          SysPayload
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

-- | The version gates for the target's floor, as a composable pass set
-- (reads the reified C declarations).
versionGates :: SysTarget -> VersionsRegistry -> Passes
versionGates target registry =
  Passes
    { stubEdits = \unit arts -> versionStubEdits target registry unit.headerName arts.cDecls
    , textEdits = \_ _ -> []
    }

-- | Version gates for the target's floor: every function whose
-- registry-corrected availability is later than the baseline gets its
-- wrapper bodies guarded on the library's own version macros — the call
-- (or FunPtr address) stays live at or above the version; below it the
-- stub reports the failure through the target's channel (SDL:
-- @SDL_SetError@) and returns the zero of its return class. The wrapper
-- SYMBOL always exists, so consumer links never break; misuse on an old
-- library fails loudly at the call site. Each gated stub carries its own
-- prologue: the version macros' home plus ABI-equivalent stand-ins (from
-- the registry) for type names its signature uses that older headers do
-- not declare — linkage ignores C types, so an @int@\/pointer stand-in is
-- exact.
versionStubEdits
  :: SysTarget -> VersionsRegistry -> FilePath -> [C.Decl l C.Final] -> [HB.StubEdit]
versionStubEdits target registry headerName cDecls =
  retypePrologue
    <> [ versionGate name since (length fn.args)
       | decl <- cDecls
       , let name = decl.info.id.cName.name.text
       , C.DeclFunction fn <- [decl.kind]
       , Just since <-
           [ Map.lookup name declOverrides
               <|> scheme.declSince decl.info
           ]
       , since > scheme.baseline
       ]
 where
  scheme = target.versioning
  declOverrides = (.since) <$> registry.decls

  -- The retype class: wrappers of functions that exist at the baseline but
  -- whose newer signatures use type names older headers do not declare.
  -- One family-wide edit prepends the guarded stand-ins to every wrapper
  -- that references one; hidden at or above their version, they can never
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
                  ( map (includeLine target) scheme.guardIncludes
                      <> ["#if " <> scheme.below retypeSince]
                      <> map snd entries
                      <> ["#endif"]
                      <> ls
                  )
              else
                Nothing
          }
      ]

  -- TODO(A2): SDL's twelve prologue typedefs all appeared at 3.4.0; the
  -- version belongs to each registry entry (prologue-typedefs.<name>.since).
  retypeSince = AbiSince{major = 3, minor = 4, patch = 0}

  headerTypedefs =
    [ (n, typedefLine n e.shape)
    | (n, e) <- Map.toList registry.prologueTypedefs
    , headerName `elem` e.headers
    ]

  -- TODO(A2): ShapeUint32 spells SDL's Uint32; the registry names the
  -- aliased C type instead (ShapeAlias).
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
    addressLine = "  return &" <> sym <> ";"

    isTargetLine l =
      or @[Bool]
        [ ("  return (" <> sym <> ")(") `T.isPrefixOf` l
        , ("  (" <> sym <> ")(") `T.isPrefixOf` l
        , l == addressLine
        ]

    guardBlock line =
      [ "#if " <> scheme.atLeast since
      , line
      , "#else"
      , "  " <> stubLine line
      , "#endif"
      ]

    -- Address getters return a null function pointer; returning calls
    -- silence their arguments and return zero; void calls only silence.
    stubLine line
      | line == addressLine = T.unwords (failure <> ["return 0;"])
      | "  return " `T.isPrefixOf` line = T.unwords (silence <> failure <> ["return 0;"])
      | otherwise = T.unwords (silence <> failure)

    failure = [report sym since | Just report <- [target.gateStubs.failure]]
    silence = ["(void)arg" <> show n <> ";" | n <- [1 .. arity]]

    -- The guard macro's home and the failure channel's; per-header TUs may
    -- reach neither on their own at the baseline. Stand-in typedefs come
    -- from the family-wide retype prologue.
    prologue _ls = map (includeLine target) (scheme.guardIncludes <> target.gateStubs.includes)
