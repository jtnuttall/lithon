{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- At present, HLINT flags OverloadedRecordDot x.id.y as a redundant `id`
-- application.
{- HLINT ignore "Redundant id" -}

-- | Rendering the availability annotations (@versions.json@,
-- "Lithon.Codegen.Bindgen.Versions") into the wrapper C of each translated
-- family, and checking what they ask for:
--
-- * 'retypePrologue' renders @prologue-typedefs@: stand-ins, guarded to
--   the releases that lack them, prepended to every wrapper naming one.
--
-- * 'versionGates' renders @decls@: an @#if@ guard around each call of a
--   function whose availability (its @since@ there, else the documented
--   one) is later than the baseline, and below it a stub returning the
--   entry's @stub-return@.
--
-- * 'unusedStubReturns' reports each @stub-return@ no gated stub returns.
--
-- Both renderers are 'Passes', and their order is the caller's contract:
-- the target's shims, then the retype prologue, then the gates. The gates
-- match call lines the shims may have rewritten, and a gated wrapper's
-- own includes land above the prologue.
module Lithon.Codegen.Bindgen.Versions.Guards (
  -- * Passes
  retypePrologue,
  versionGates,

  -- * Gated functions
  GatedDecl (..),
  gatedDecls,

  -- * Checks
  UnusedStubReturn (..),
  unusedStubReturns,
) where

import Data.List qualified as L
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.HsBindgen qualified as HB
import Lithon.HsBindgen.C qualified as C
import Lithon.Prelude

import Lithon.Codegen.Bindgen.Driver (HeaderUnit (..), Passes (..))
import Lithon.Codegen.Bindgen.Target (
  BindgenTarget (..),
  GateStubs (..),
  VersionScheme (..),
  includeLine,
 )
import Lithon.Codegen.Bindgen.Version (Version)
import Lithon.Codegen.Bindgen.Versions (
  DeclEntry (..),
  PrologueEntry (..),
  ShapeSpec (..),
  VersionsRegistry (..),
 )

-- | A function the version gates guard, as 'unusedStubReturns' sees it.
data GatedDecl = GatedDecl
  { name :: Text
  -- ^ Its C name.
  , returnsVoid :: Bool
  -- ^ Its call wrappers return nothing, so below the gate its stub
  -- returns nothing either.
  }
  deriving stock (Eq, Show)

-- | The functions among one header's declarations whose wrappers the
-- version gates guard, in declaration order.
gatedDecls :: BindgenTarget -> VersionsRegistry -> [C.Decl l C.Final] -> [GatedDecl]
gatedDecls target registry cDecls =
  [ GatedDecl{name = fn.name, returnsVoid = fn.returnsVoid}
  | fn <- gatedFunctions target registry cDecls
  ]

-- | Why a @stub-return@ annotation is dead configuration.
data UnusedStubReturn
  = -- | No header gates the decl: its availability is at or below the
    -- baseline, or it is not a bound function.
    NotGated
  | -- | The function is gated, but it returns void: its stubs return
    -- nothing.
    ReturnsVoid
  deriving stock (Eq, Show)

-- | The annotations' @stub-return@ entries no gated stub returns, by name,
-- given every header's gated functions: dead configuration, reported
-- rather than ignored.
unusedStubReturns :: VersionsRegistry -> [GatedDecl] -> [(Text, UnusedStubReturn)]
unusedStubReturns registry gated =
  [ (name, unused)
  | (name, entry) <- Map.toAscList registry.decls
  , isJust entry.stubReturn
  , unused <- case Map.lookup name byName of
      Nothing -> [NotGated]
      Just decl -> [ReturnsVoid | decl.returnsVoid]
  ]
 where
  byName = Map.fromList [(decl.name, decl) | decl <- gated]

-- | A function whose annotation-corrected availability is later than the
-- target's baseline.
data GatedFunction = GatedFunction
  { name :: Text
  , since :: Version
  , params :: Int
  , stubReturn :: Maybe Text
  -- ^ Its @stub-return@ annotation, if any.
  , returnsVoid :: Bool
  -- ^ Its result type is @void@: hs-bindgen's own test for a call
  -- wrapper that returns nothing.
  }

gatedFunctions :: BindgenTarget -> VersionsRegistry -> [C.Decl l C.Final] -> [GatedFunction]
gatedFunctions target registry cDecls =
  [ GatedFunction
      { name
      , since
      , params = length fn.args
      , stubReturn = entry >>= (.stubReturn)
      , returnsVoid = case fn.res.c of
          C.TypeVoid -> True
          _nonVoid -> False
      }
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
-- the guarded stand-ins (from the annotations) to every wrapper that
-- references one: the guard macro's home, then one block per release
-- that introduced names, below which they are declared. Hidden at or
-- above their version, they can never conflict with the real
-- declarations; linkage ignores C types, so an @int@\/pointer stand-in
-- is exact.
retypePrologue :: BindgenTarget -> VersionsRegistry -> Passes
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
-- annotation-corrected availability is later than the baseline gets its
-- wrapper bodies guarded on the library's own version macros — the call
-- (or FunPtr address) stays live at or above the version; below it the
-- stub silences the arguments, reports the failure through the target's
-- channel (SDL: @SDL_SetError@) when it has one, and returns the
-- @stub-return@ annotation (default zero) — a FunPtr getter a null
-- pointer, a void call nothing. The wrapper SYMBOL always exists, so
-- consumer links never break; misuse on an old library fails loudly at
-- the call site. Each gated stub carries its own prologue: the version
-- macros' home and the failure channel's; stand-ins for type names its
-- signature uses that older headers do not declare come from the
-- family-wide retype prologue.
versionGates :: BindgenTarget -> VersionsRegistry -> Passes
versionGates target registry =
  Passes
    { stubEdits = \_unit arts -> map (versionGate target) (gatedFunctions target registry arts.cDecls)
    , textEdits = \_ _ -> []
    }

versionGate :: BindgenTarget -> GatedFunction -> HB.StubEdit
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
