{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- At present, HLINT flags OverloadedRecordDot x.id.y as a redundant `id`
-- application.
{- HLINT ignore "Redundant id" -}

-- | A target's configuration of the generic bindgen fold
-- ("Lithon.Codegen.Bindgen"): the header plan, the invocation environment,
-- and the visitor — the target's shims, the retype prologue, the version
-- gates, and the finalizer distilling the alias-layer facts and the ABI
-- assertion inputs.
module Lithon.Codegen.Sys.Chain (
  -- * Plan + environment
  headerPlan,
  bindgenOpts,
  moduleFor,

  -- * Visitors
  SysPayload (..),
  sysVisitor,
  ungatedStubReturns,
) where

import Data.List qualified as L
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
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
import Lithon.Codegen.Sys.Version (Version)
import Lithon.Codegen.Sys.Versions (
  DeclEntry (..),
  PrologueEntry (..),
  ShapeSpec (..),
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
    , prescriptiveSpec = env.paths.overrides
    , packageInfo =
        PackageInfo
          { name = target.packageName
          , dataDir = env.paths.dataDir
          , version = Nothing
          }
    }

-- | The per-header payload distilled from each fold step.
data SysPayload = SysPayload
  { facts :: FamilyDecls
  -- ^ The alias-layer distillate (function census + translated decls).
  , abi :: [AbiDecl]
  -- ^ The layout distillate feeding the ABI assertion TU.
  , gated :: [Text]
  -- ^ The C names of the functions whose wrappers the version gates
  -- guard, header declaration order.
  }

-- | The whole visitor: the target's shims, then the retype prologue, then
-- the version gates (gates match lines the shims may have rewritten —
-- ordering is contract), then the payload distillation.
sysVisitor :: SysTarget -> VersionsRegistry -> Visitor SysPayload
sysVisitor target registry =
  Visitor
    { passes = target.shims <> retypePrologue target registry <> versionGates target registry
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
            , gated = map (.name) (gatedFunctions target registry arts.cDecls)
            }
    }

-- | The registry's @stub-return@ entries naming a decl no header gated
-- (at or below the baseline, or not a bound function): dead
-- configuration, reported rather than ignored.
ungatedStubReturns :: VersionsRegistry -> [SysPayload] -> [Text]
ungatedStubReturns registry payloads =
  [ name
  | (name, entry) <- Map.toAscList registry.decls
  , isJust entry.stubReturn
  , name `Set.notMember` gated
  ]
 where
  gated = Set.fromList (concatMap (.gated) payloads)

-- | A function whose registry-corrected availability is later than the
-- target's baseline.
data GatedFunction = GatedFunction
  { name :: Text
  , since :: Version
  , params :: Int
  , stubReturn :: Maybe Text
  -- ^ The registry's @stub-return@, if any.
  }

gatedFunctions :: SysTarget -> VersionsRegistry -> [C.Decl l C.Final] -> [GatedFunction]
gatedFunctions target registry cDecls =
  [ GatedFunction{name, since, params = length fn.args, stubReturn = entry >>= (.stubReturn)}
  | decl <- cDecls
  , let name = decl.info.id.cName.name.text
        entry = Map.lookup name registry.decls
  , C.DeclFunction fn <- [decl.kind]
  , Just since <- [((.since) <$> entry) <|> scheme.declSince decl.info]
  , since > scheme.baseline
  ]
 where
  scheme = target.versioning

-- | The retype class: wrappers of functions that exist at the baseline but
-- whose newer signatures use type names older headers do not declare
-- (and gated wrappers naming such a type). One family-wide edit prepends
-- the guarded stand-ins (from the registry) to every wrapper that
-- references one: the guard macro's home, then one block per release
-- that introduced names, below which they are declared. Hidden at or
-- above their version, they can never conflict with the real
-- declarations; linkage ignores C types, so an @int@\/pointer stand-in
-- is exact.
retypePrologue :: SysTarget -> VersionsRegistry -> Passes
retypePrologue target registry =
  Passes
    { stubEdits = \unit _arts -> retypeEdits unit.headerName
    , textEdits = \_ _ -> []
    }
 where
  scheme = target.versioning

  retypeEdits headerName = case headerEntries of
    [] -> []
    entries ->
      [ HB.StubEdit
          { label = T.pack headerName <> " version prologue"
          , symbol = Nothing
          , target = "wrappers referencing " <> T.intercalate ", " (map fst entries)
          , onMiss = HB.RequireHit
          , edit = \ls ->
              if any (\(n, _) -> any (n `T.isInfixOf`) ls) entries then
                Just (prologue entries <> ls)
              else
                Nothing
          }
      ]
   where
    headerEntries =
      [ (n, e)
      | (n, e) <- Map.toList registry.prologueTypedefs
      , headerName `elem` e.headers
      ]

  prologue entries =
    map (includeLine target) scheme.guardIncludes
      <> concat
        [ ["#if " <> scheme.below since]
            <> [typedefLine n e.shape | (n, e) <- sortOn fst introduced]
            <> ["#endif"]
        | (since, introduced) <-
            Map.toAscList (Map.fromListWith (<>) [(e.since, [(n, e)]) | (n, e) <- entries])
        ]

  typedefLine n = \case
    ShapeAlias spelling -> "typedef " <> spelling <> " " <> n <> ";"
    ShapeOpaqueStruct -> "typedef struct " <> n <> " " <> n <> ";"
    ShapeVoidPtr -> "typedef void *" <> n <> ";"

-- | Version gates for the target's floor: every function whose
-- registry-corrected availability is later than the baseline gets its
-- wrapper bodies guarded on the library's own version macros — the call
-- (or FunPtr address) stays live at or above the version; below it the
-- stub silences the arguments, reports the failure through the target's
-- channel (SDL: @SDL_SetError@) when it has one, and returns the
-- registry's @stub-return@ (default zero) — a FunPtr getter a null
-- pointer, a void call nothing. The wrapper SYMBOL always exists, so
-- consumer links never break; misuse on an old library fails loudly at
-- the call site. Each gated stub carries its own prologue: the version
-- macros' home and the failure channel's; stand-ins for type names its
-- signature uses that older headers do not declare come from the
-- family-wide retype prologue.
versionGates :: SysTarget -> VersionsRegistry -> Passes
versionGates target registry =
  Passes
    { stubEdits = \_unit arts -> map (versionGate target) (gatedFunctions target registry arts.cDecls)
    , textEdits = \_ _ -> []
    }

versionGate :: SysTarget -> GatedFunction -> HB.StubEdit
versionGate target fn =
  HB.StubEdit
    { label = sym <> " version gate"
    , symbol = Just sym
    , target = "the call/address line of " <> sym
    , onMiss = HB.RequireHit
    , edit = \ls -> do
        i <- L.findIndex isTargetLine ls
        line <- ls L.!? i
        pure (prologue <> take i ls <> guardBlock line <> drop (i + 1) ls)
    }
 where
  scheme = target.versioning
  sym = fn.name
  addressLine = "  return &" <> sym <> ";"

  isTargetLine l =
    or @[Bool]
      [ ("  return (" <> sym <> ")(") `T.isPrefixOf` l
      , ("  (" <> sym <> ")(") `T.isPrefixOf` l
      , l == addressLine
      ]

  guardBlock line =
    [ "#if " <> scheme.atLeast fn.since
    , line
    , "#else"
    , "  " <> T.unwords (silence <> failure <> ret)
    , "#endif"
    ]
   where
    -- Address getters return a null function pointer; returning calls
    -- silence their arguments and return the stub value; void calls only
    -- silence.
    address = line == addressLine
    silence = ["(void)arg" <> show n <> ";" | not address, n <- [1 .. fn.params]]
    failure = [report sym fn.since | Just report <- [target.gateStubs.failure]]
    ret
      | address = ["return 0;"]
      | "  return " `T.isPrefixOf` line = ["return " <> fromMaybe "0" fn.stubReturn <> ";"]
      | otherwise = []

  -- The guard macro's home and the failure channel's; per-header TUs may
  -- reach neither on their own at the baseline.
  prologue = map (includeLine target) (scheme.guardIncludes <> target.gateStubs.includes)
