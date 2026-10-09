{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}

{- HLINT ignore "Replace case with maybe" -}

-- | Planning and rendering a target's curated layer (@SDL3.Sys.*@ for
-- SDL3).
--
-- One module per header family, emitted with hs-bindgen's own AST and
-- renderer so the output is byte-style-identical with the Bindgen modules:
--
-- - The family's Bindgen base module (types, patterns, constants) is
--   re-exported wholesale when it exists.
--
-- - every aliased function becomes an 'SHs.Binding' whose body is a
--   module-qualified reference to the Bindgen name in the right flavor
--   module, carrying the function's translated signature, per-parameter
--   docs, and full header Haddock
module Lithon.Codegen.Bindgen.Alias (
  -- * Per-family distillation (consumed by the bindgen driver)
  FamilyDecls (..),
  CFunction (..),
  distillFamily,

  -- * Census
  functionCensus,

  -- * Planning
  AliasModule (..),
  AliasBinding (..),
  planAliasLayer,
  aliasRewriteMap,

  -- * Rendering
  renderAliasModule,
  renderRuntimeModule,
  renderUmbrella,
  sysModuleName,
) where

import Data.Char (isAlphaNum)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Language.Haskell.TH.Syntax qualified as TH
import Lithon.HsBindgen qualified as HB
import Lithon.HsBindgen.C qualified as C
import Lithon.HsBindgen.Hs qualified as Hs
import Lithon.HsBindgen.HsDoc qualified as HsDoc
import Lithon.HsBindgen.HsModule qualified as HsModule
import Lithon.HsBindgen.SHs qualified as SHs
import Lithon.Prelude hiding (group, one)
import Numeric (showHex)

import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Alias.Config (ValidatedAliasConfig (..))
import Lithon.Codegen.Bindgen.Alias.Constants (
  Combine (..),
  ConstantGroupPlan (..),
  ConstantMember (..),
 )
import Lithon.Codegen.Bindgen.Alias.Names (
  AliasError (..),
  Flavor (..),
  MintedAlias (..),
  mintAliasNames,
  primaryAliasName,
 )
import Lithon.Codegen.Bindgen.Target (
  BindgenTarget (..),
  DocHooks (..),
  NativeScalar (..),
  Prose (..),
  WidthTypedefs (..),
  bindgenNamespaceText,
  runtimeModule,
 )

-- | One bound C function, as seen by the final C AST.
data CFunction = CFunction
  { cName :: Text
  -- ^ The actual C name of this function.
  -- E.g., SDL_CreateWindow
  , hsName :: Text
  -- ^ hs-bindgen's mangled name, identical in the @.Safe@ and @.Unsafe@ modules.
  -- E.g., @sDL_CreateWindow@
  , hasCallback :: Bool
  -- ^ Some parameter is a single pointer to a function.
  }
  deriving stock (Eq, Show)

-- | The alias-relevant distillate of one header invocation.
data FamilyDecls = FamilyDecls
  { familyBase :: Text
  -- ^ The Bindgen base module, e.g. @SDL3.Sys.Bindgen.Video@.
  , headerName :: FilePath
  -- ^ @SDL_video.h@ — for module Haddock.
  , hasBaseModule :: Bool
  -- ^ Whether hs-bindgen produced a types module for this family.
  , moduleDoc :: Maybe HsDoc.Comment
  -- ^ The SDL category overview hs-bindgen peeled from the header (the
  -- same comment it places on the Bindgen base module).
  , functions :: [CFunction]
  -- ^ Header declaration order.
  , funDecls :: Map Text Hs.FunctionDecl
  -- ^ Mangled name -> the public 'Hs.FunctionDecl'
  , newtypeConstrs :: Map Text Text
  -- ^ Newtype name -> constructor name, from the family's base decls (the
  -- constants registry's target-type domain).
  , takenNames :: Set Text
  -- ^ Constructor-namespace names the base module already exports (pattern
  -- synonyms, newtype constructors): the collision domain for minted
  -- constant patterns.
  }

-- | Distill one header's artefacts.
distillFamily
  :: Text
  -> FilePath
  -> Bool
  -> Maybe HsDoc.Comment
  -> HB.ByCategory_ [Hs.Decl l]
  -> [C.Decl l C.Final]
  -> FamilyDecls
distillFamily familyBase headerName hasBaseModule moduleDoc (HB.ByCategory_ inner) cDecls =
  FamilyDecls
    { familyBase
    , headerName
    , hasBaseModule
    , moduleDoc
    , functions = mapMaybe cFunctionOf cDecls
    , funDecls =
        Map.fromList
          [ (Hs.termNameToText fd.name, fd)
          | Hs.DeclFunction fd <- getConst inner.cUnsafe
          , Hs.ExportedName _ <- [fd.name]
          ]
    , newtypeConstrs =
        Map.fromList
          [ (nt.name.text, nt.constr.text)
          | Hs.DeclNewtype nt <- baseDecls
          ]
    , takenNames =
        Set.fromList
          $ [ps.name.text | Hs.DeclPatSyn ps <- baseDecls]
          <> [nt.constr.text | Hs.DeclNewtype nt <- baseDecls]
    }
 where
  baseDecls = getConst inner.cType

-- hlint misreads the record-dot @.id@ chain as the 'id' function.
{- HLINT ignore cFunctionOf "Redundant id" -}
cFunctionOf :: C.Decl l C.Final -> Maybe CFunction
cFunctionOf decl = case decl.kind of
  C.DeclFunction fn ->
    Just
      CFunction
        { cName = decl.info.id.cName.name.text
        , hsName = decl.info.id.hsName.text
        , hasCallback = any isCallbackArg fn.args
        }
  _notAFunction -> Nothing

-- | A parameter is a callback iff its canonical type is exactly one
-- pointer to a function
isCallbackArg :: C.FunctionArg C.Final -> Bool
isCallbackArg arg = case C.getCanonicalType arg.typ.c of
  C.TypePointers 1 (C.TypeFun _ _) -> True
  _notACallback -> False

-- | The census the registry validates against: C name -> takes a callback.
functionCensus :: [FamilyDecls] -> Map Text Bool
functionCensus families =
  Map.fromList
    [ (fn.cName, fn.hasCallback)
    | family <- families
    , fn <- family.functions
    ]

-- | One alias binding to emit.
data AliasBinding = AliasBinding
  { aliasName :: Text
  , flavor :: Flavor
  , cName :: Text
  , bindgenName :: Text
  , counterpart :: Maybe Text
  -- ^ The other flavor's alias, when the function has both.
  , rationale :: Maybe Text
  -- ^ The registry rationale, surfaced in the provenance paragraph.
  , funDecl :: Hs.FunctionDecl
  }

-- | One planned @SDL3.Sys.\<Family\>@ module.
data AliasModule = AliasModule
  { moduleName :: Text
  , familyBase :: Text
  , headerName :: FilePath
  , baseModule :: Maybe Text
  , moduleDoc :: Maybe HsDoc.Comment
  -- ^ The family's SDL category overview (see 'FamilyDecls.moduleDoc').
  , constants :: [ConstantGroupPlan]
  -- ^ The family's typed-constant groups, registry order.
  , bindings :: [AliasBinding]
  }

planAliasLayer
  :: BindgenTarget
  -> ValidatedAliasConfig
  -> Map Text [ConstantGroupPlan]
  -- ^ Planned constant groups, keyed by family base module.
  -> [FamilyDecls]
  -> Either (Errors AliasError) [AliasModule]
planAliasLayer target validated constantPlans families = validationToEither
  case mintAliasNames target.functionPrefix validated.renames classified of
    Failure errs -> Failure errs
    Success minted ->
      reservedCheck minted
        *> (filter keep <$> traverse (planFamily minted) families)
 where
  -- The umbrella re-exports every family AND the Runtime bridge module, so
  -- an alias reusing a bridge name would be a duplicate export downstream.
  reservedCheck minted =
    failUnlessEmpty
      [ AliasReservedCollision{aliasName, cName, bridgeModule = runtimeModuleName target}
      | (cName, m) <- Map.toAscList minted
      , aliasName <- maybeToList m.unsafeName <> maybeToList m.safeName
      , Set.member aliasName runtimeReservedNames
      ]
      ()
  classified =
    [ (fn.cName, safety)
    | family <- families
    , fn <- family.functions
    , Just safety <- [Map.lookup fn.cName validated.safeties]
    ]

  keep m = isJust m.baseModule || not (null m.bindings) || not (null m.constants)

  planFamily minted family =
    mkModule
      <$> moduleNameV family
      <*> (concat <$> traverse (bindingsOf minted family) family.functions)
   where
    mkModule moduleName bindings =
      AliasModule
        { moduleName
        , familyBase = family.familyBase
        , headerName = family.headerName
        , baseModule =
            if family.hasBaseModule then
              Just family.familyBase
            else
              Nothing
        , moduleDoc = family.moduleDoc
        , constants = Map.findWithDefault [] family.familyBase constantPlans
        , bindings
        }

  moduleNameV family =
    either
      ( \reason ->
          Failure
            (errors1 AliasFamilyInvalid{familyModule = family.familyBase, reason})
      )
      Success
      (sysModuleName target family.familyBase)

  bindingsOf minted family fn =
    case Map.lookup fn.cName validated.safeties of
      Nothing -> Success [] -- skipped
      Just _safety ->
        case (Map.lookup fn.cName minted, Map.lookup fn.hsName family.funDecls) of
          (Just mintedAlias, Just funDecl) ->
            Success (bindingsFrom fn mintedAlias funDecl)
          _missing ->
            Failure (errors1 AliasTranslationMissing{cName = fn.cName, hsName = fn.hsName})

  bindingsFrom fn mintedAlias funDecl =
    [ mkBinding UnsafeFlavor unsafeName mintedAlias.safeName
    | Just unsafeName <- [mintedAlias.unsafeName]
    ]
      <> [ mkBinding SafeFlavor safeName mintedAlias.unsafeName
         | Just safeName <- [mintedAlias.safeName]
         ]
   where
    mkBinding flavor aliasName counterpart =
      AliasBinding
        { aliasName
        , flavor
        , cName = fn.cName
        , bindgenName = fn.hsName
        , counterpart
        , rationale = Map.lookup fn.cName validated.rationales
        , funDecl
        }

-- | The documentation cross-reference map: mangled Bindgen name -> the
-- defining alias module and primary alias name (unsuffixed when exported,
-- @Safe@ otherwise). Carrying the module lets cross-family references
-- render as qualified links instead of degrading to plain text.
aliasRewriteMap :: [AliasModule] -> Map Text (Text, Text)
aliasRewriteMap aliasModules =
  Map.fromList
    [ (key, (m.moduleName, alias))
    | m <- aliasModules
    , b <- m.bindings
    , let alias = primaryAlias b
    , -- Identifier nodes carry mangled names; bare-text mentions (doxygen
    -- resolves references only within the single header it parses, so
    -- cross-family ones never became refs) carry C names. Key both.
    key <- [b.bindgenName, b.cName]
    ]
 where
  primaryAlias b =
    primaryAliasName
      MintedAlias
        { unsafeName = case b.flavor of
            UnsafeFlavor -> Just b.aliasName
            SafeFlavor -> b.counterpart
        , safeName = case b.flavor of
            SafeFlavor -> Just b.aliasName
            UnsafeFlavor -> b.counterpart
        }

-- | @SDL3.Sys.Bindgen.Video@ -> @SDL3.Sys.Video@. Guards the namespace: the
-- family segment may not shadow the @Bindgen@ or @Runtime@ siblings.
sysModuleName :: BindgenTarget -> Text -> Either Text Text
sysModuleName target base = do
  familySeg <-
    maybeToRight ("not under " <> bindgenRoot <> ": " <> base)
      $ T.stripPrefix (bindgenRoot <> ".") base
  when ("." `T.isInfixOf` familySeg)
    $ Left ("family module has nested segments: " <> base)
  when (familySeg `elem` (["Bindgen", "Runtime"] :: [Text]))
    $ Left ("family segment shadows the " <> familySeg <> " namespace: " <> base)
  pure (Module.hsName target.namespace <> "." <> familySeg)
 where
  bindgenRoot = bindgenNamespaceText target

{-------------------------------------------------------------------------------
  Rendering
-------------------------------------------------------------------------------}

-- | Render one family module through hs-bindgen's own module assembly and
-- pretty-printer. The rewrite map sends mangled Bindgen names to primary
-- alias names inside copied documentation.
renderAliasModule :: BindgenTarget -> Map Text (Text, Text) -> AliasModule -> (Text, Text)
renderAliasModule target rewriteMap aliasModule =
  ( aliasModule.moduleName
  , renderModule hsModule <> constantsBlock aliasModule
  )
 where
  rewrite = rewriteComment target rewriteMap aliasModule.moduleName
  hsModule =
    HsModule.authoredModule
      HsModule.AuthoredModule
        { pragmas =
            -- The constant patterns are emitted as a text block (see
            -- 'constantsBlock'), so their extension cannot be resolved from
            -- @decls@ and is added explicitly.
            Set.toAscList
              $ Set.fromList
              $ pragmasFor decls
              <> [ "LANGUAGE PatternSynonyms"
                 | not (null aliasModule.constants)
                 ]
        , -- The SDL category overview leads (rewritten so its cross-references
          -- resolve to curated aliases), followed by the compact conventions
          -- block; rendered by the same pretty-printer as the Bindgen modules.
          moduleComment = Just (familyComment target rewrite aliasModule)
        , name = Hs.ModuleName aliasModule.moduleName
        , exports
        , imports
        , decls
        }

  exports =
    [ HsModule.ExportEntry (HsModule.ExportModule (Hs.ModuleName base))
    | Just base <- [aliasModule.baseModule]
    ]
      <> case aliasModule.constants of
        [] -> []
        groups ->
          [ HsModule.ExportSection
              [HsDoc.TextContent "Typed constants"]
              [ HsModule.ExportEntry (HsModule.ExportPattern member.cName)
              | group <- groups
              , member <- group.members
              ]
          ]
      <> case aliasModule.bindings of
        [] -> []
        bindings ->
          [ HsModule.ExportSection
              [HsDoc.TextContent "Function aliases"]
              [ HsModule.ExportEntry (HsModule.ExportName b.aliasName)
              | b <- bindings
              ]
          ]

  imports =
    Set.toAscList
      $ Set.fromList
        ( HsModule.resolveImports
            (HB.BaseModuleName aliasModule.familyBase)
            (Just (HB.CTerm HB.CUnsafe))
            []
            decls
        )
      <> Set.fromList
        [ HsModule.UnqualifiedImportListItem (Hs.ModuleName base) Nothing
        | Just base <- [aliasModule.baseModule]
        ]
      -- Constructor scope for the scalar bridge's 'Coerce.coerce': the
      -- 'Data.Coerce.Coercible' evidence needs the bridged newtypes'
      -- constructors visible, and bridging is exactly the transformation
      -- that removes the C type — and with it the import its signature
      -- occurrence would have forced — from the rendered module. Added
      -- structurally from the decls' own classification; the 'Set'
      -- dedupes against organic occurrences.
      <> Set.fromList
        [ HsModule.QualifiedImportListItem (Hs.ModuleName scopeModule) Nothing
        | scope <- Set.toAscList ctorScopes
        , let scopeModule = case scope of
                LibCScope -> "HsBindgen.Runtime.LibC"
                WidthScope widthModule -> widthModule
        ]

  declsWithScopes = map (bindingDecl target rewrite aliasModule.familyBase) aliasModule.bindings
  decls = map fst declsWithScopes
  ctorScopes = Set.unions (map snd declsWithScopes)

bindingDecl
  :: BindgenTarget
  -> (HsDoc.Comment -> HsDoc.Comment)
  -> Text
  -> AliasBinding
  -> (SHs.SDecl, Set CtorScope)
bindingDecl target rewrite familyBase b =
  ( SHs.DBinding
      SHs.Binding
        { name = Hs.ExportedName (Hs.UnsafeName b.aliasName)
        , parameters =
            [ SHs.Parameter (bridgedType paramTy) (rewrite <$> p.comment)
            | (paramTy, p) <- zip paramTys b.funDecl.parameters
            ]
        , result = SHs.Result (bridgedResult resultTy) Nothing
        , body
        , pragmas = []
        , comment =
            Just
              (annotatedComment target rewrite familyBase (isJust resultBridge || any isJust paramBridges) b)
        }
  , Set.fromList
      [ scope
      | Just (BridgeCoerce _ (Just scope)) <- resultBridge : paramBridges
      ]
  )
 where
  callee :: forall ctx. SHs.SExpr ctx
  callee =
    SHs.EGlobal (SHs.CustomGlobal (TH.mkName (toString b.bindgenName)) SHs.GVar flavorImport)

  paramTys = map (SHs.translateType . (.typ)) b.funDecl.parameters
  resultTy = SHs.translateType b.funDecl.result
  paramBridges = map (scalarBridge target) paramTys
  resultBridge = case resultTy of
    SHs.TApp (SHs.TGlobal io) inner
      | io == SHs.bindgenGlobalType SHs.IO_type -> scalarBridge target inner
    _notIoScalar -> Nothing

  -- Mixed emission: bindings without a scalar bridge stay thin,
  -- point-free references; bridged ones are eta-expanded with the
  -- conversions applied per argument and 'fmap'-ed over the result.
  body
    | all isNothing paramBridges && isNothing resultBridge = callee
    | otherwise = etaBody paramBridges resultBridge callee

  bridgedType t = maybe t nativeScalarType (scalarBridge target t)
  bridgedResult t = case (t, resultBridge) of
    (SHs.TApp io _inner, Just bridge) -> SHs.TApp io (nativeScalarType bridge)
    _unbridged -> t

  flavorImport =
    Hs.QualifiedImport
      (Hs.ModuleName (familyBase <> "." <> flavorSegment))
      (Just (toString flavorSegment))
  flavorSegment :: Text
  flavorSegment = case b.flavor of
    SafeFlavor -> "Safe"
    UnsafeFlavor -> "Unsafe"

-- | The scalar bridge: exactly the C types whose Haskell native twin has
-- identical width and value set, so every conversion is a representation
-- change, never a range judgment. 'CBool'⇄'Bool' is the one semantic
-- conversion (a 0\/1 compare against a 10–25ns unsafe-ccall floor);
-- everything else — 'CFloat'⇄'Float', 'CDouble'⇄'Double', the fixed-width
-- @Foreign.C@ integers ('CInt'⇄'Int32', …), @size_t@⇄'Word64', and the
-- target's own width typedefs ('WidthTypedefs'; SDL's @UintN@\/@SintN@) —
-- is a 'Data.Coerce.coerce'.
--
-- @size_t@⇄'Word64' bakes in the package's 64-bit-only support statement;
-- a hypothetical 32-bit port fails to compile at the coercion site, the
-- same loud-failure posture as the ABI assertion layer. 'CLong'\/'CULong'
-- have no bridge on purpose: no bound function uses them (the seven
-- @long@-typed stdinc clones are omitted — see the CHANGELOG) and no
-- fixed-width twin is correct on both LP64 and LLP64.
--
-- Applied to top-level curated parameters and @IO@ results only; pointee
-- types, 'FunPtr' payloads, and struct fields keep their C types.
data ScalarBridge
  = BridgeBool
  | -- | Coerce to\/from the given native scalar; 'CtorScope' names the
    -- import that keeps the 'Data.Coerce.Coercible' evidence solvable.
    BridgeCoerce Native (Maybe CtorScope)

-- | A native Haskell scalar the bridge converts to: an equal-width integer
-- ('NativeScalar', the targets' own width vocabulary) or one of the two
-- IEEE floats.
--
-- hs-bindgen 1.0's 'SHs.BindgenGlobalType' no longer lists the fixed-width
-- integers or the IEEE floats, so the native twins are the curated layer's to
-- name; 'nativeType' builds each as a 'SHs.CustomGlobal'.
data Native
  = NativeWidth NativeScalar
  | NativeFloat
  | NativeDouble
  deriving stock (Eq, Show)

-- | Which qualified import guarantees the bridged newtype's constructor is
-- in scope (nothing organic does — see the import note in
-- 'renderAliasModule'): @HsBindgen.Runtime.LibC@, or the width typedefs'
-- family module. Same-family width references need no entry: the family's
-- own base module is already imported unqualified and wholesale.
data CtorScope = LibCScope | WidthScope Text
  deriving stock (Eq, Ord, Show)

scalarBridge :: BindgenTarget -> SHs.SType ctx -> Maybe ScalarBridge
scalarBridge target = \case
  SHs.TGlobal g
    | g == SHs.bindgenGlobalType SHs.CBool_type -> Just BridgeBool
    | otherwise ->
        safeHead
          [ BridgeCoerce native (Just LibCScope)
          | (foreignC, native) <- foreignCBridges
          , g == SHs.bindgenGlobalType foreignC
          ]
  -- Same-family reference to a width typedef (the width family's own
  -- functions). Name-only match: SDL declares its eight names in
  -- @SDL_stdinc.h@ alone, and the toy golden pins a same-named semantic
  -- typedef staying raw.
  SHs.TCon n -> BridgeCoerce <$> widthNative n.text <*> pure Nothing
  SHs.TExt ref
    | Just widthModule <- widthFamilyModule
    , ref.moduleName.text == widthModule ->
        BridgeCoerce <$> widthNative ref.name.text <*> pure (Just (WidthScope widthModule))
    | ref.moduleName.text == "HsBindgen.Runtime.LibC"
    , ref.name.text == "CSize" ->
        Just (BridgeCoerce (NativeWidth NativeWord64) (Just LibCScope))
  _notBridgedScalar -> Nothing
 where
  widthFamilyModule =
    target.widthTypedefs <&> \w -> bindgenNamespaceText target <> "." <> w.family
  widthNative name = do
    w <- target.widthTypedefs
    NativeWidth <$> Map.lookup name w.natives

-- | @Foreign.C@ scalars and their equal-width native twins. 'CLong' and
-- 'CULong' are deliberately absent (platform-width; zero occurrences).
foreignCBridges :: [(SHs.BindgenGlobalType, Native)]
foreignCBridges =
  [ (SHs.CFloat_type, NativeFloat)
  , (SHs.CDouble_type, NativeDouble)
  , (SHs.CInt_type, NativeWidth NativeInt32)
  , (SHs.CUInt_type, NativeWidth NativeWord32)
  , (SHs.CShort_type, NativeWidth NativeInt16)
  , (SHs.CUShort_type, NativeWidth NativeWord16)
  , (SHs.CLLong_type, NativeWidth NativeInt64)
  , (SHs.CULLong_type, NativeWidth NativeWord64)
  ]

-- | The native scalar as a type, in the 'SHs.CustomGlobal' idiom of
-- 'coerceGlobal' and 'runtimeCBoolGlobal'.
--
-- The widths are @HsBindgen.Runtime.Support@ re-exports under the @BG@
-- alias every generated module already imports it by (the 'Set' of
-- imports dedupes, and they render as @BG.Int32@); 'Float' and 'Double'
-- are 'Prelude' names, which 'HsModule.resolveImports' adds to the module's
-- explicit @import Prelude (…)@ list (1.0 modules are @NoImplicitPrelude@).
nativeType :: Native -> SHs.SType ctx
nativeType =
  SHs.TGlobal . \case
    NativeFloat -> preludeType "Float"
    NativeDouble -> preludeType "Double"
    NativeWidth width -> supportType (widthTypeName width)

-- | The type's name in "Data.Int" \/ "Data.Word" (and the runtime's
-- re-export of them).
widthTypeName :: NativeScalar -> String
widthTypeName = \case
  NativeWord8 -> "Word8"
  NativeWord16 -> "Word16"
  NativeWord32 -> "Word32"
  NativeWord64 -> "Word64"
  NativeInt8 -> "Int8"
  NativeInt16 -> "Int16"
  NativeInt32 -> "Int32"
  NativeInt64 -> "Int64"

supportType, preludeType :: String -> SHs.Global SHs.LvlType
supportType name =
  SHs.CustomGlobal
    (TH.mkName name)
    SHs.GTyp
    (Hs.QualifiedImport (Hs.ModuleName "HsBindgen.Runtime.Support") (Just "BG"))
preludeType name =
  SHs.CustomGlobal
    (TH.mkName name)
    SHs.GTyp
    (Hs.UnqualifiedImport (Hs.ModuleName "Prelude"))

nativeScalarType :: ScalarBridge -> SHs.SType ctx
nativeScalarType = \case
  BridgeBool -> SHs.tBindgenGlobal SHs.Bool_type
  BridgeCoerce native _ctorScope -> nativeType native

-- | Argument-position conversion (native -> C at the call).
bridgeArg :: ScalarBridge -> SHs.SExpr ctx -> SHs.SExpr ctx
bridgeArg = \case
  BridgeBool -> SHs.EApp (SHs.EGlobal cboolFromBool)
  BridgeCoerce _ _ -> SHs.EApp (SHs.EGlobal coerceGlobal)

-- | Result-position conversion (C -> native, under @IO@).
bridgeResult :: ScalarBridge -> SHs.SExpr ctx -> SHs.SExpr ctx
bridgeResult bridge =
  SHs.EApp (SHs.EApp (SHs.eBindgenGlobal SHs.Functor_fmap) converter)
 where
  converter = case bridge of
    BridgeBool -> SHs.EGlobal cboolToBool
    BridgeCoerce _ _ -> SHs.EGlobal coerceGlobal

cboolFromBool, cboolToBool, coerceGlobal :: SHs.Global SHs.LvlTerm
cboolFromBool = runtimeCBoolGlobal "fromBool"
cboolToBool = runtimeCBoolGlobal "toBool"
-- 'coerce' has a compulsory unfolding: every conversion erases to a Core
-- cast at every optimization level, including -O0 — nothing to trust in
-- rewrite rules ('realToFrac' needed base's rules, which fire at -O1+) or
-- newtype-deriving method inlining ('fromIntegral' transits 'Integer'
-- whenever those don't fire). The price is scope: 'Coercible' evidence
-- needs the newtype constructors visible at the use site, which
-- 'renderAliasModule' guarantees with covering qualified imports
-- ("HsBindgen.Runtime.LibC" exports every @Foreign.C@ constructor;
-- the width family's base module exports the width typedefs').
coerceGlobal =
  SHs.CustomGlobal
    (TH.mkName "coerce")
    SHs.GVar
    (Hs.QualifiedImport (Hs.ModuleName "Data.Coerce") (Just "Coerce"))

runtimeCBoolGlobal :: String -> SHs.Global SHs.LvlTerm
runtimeCBoolGlobal name =
  SHs.CustomGlobal
    (TH.mkName name)
    SHs.GVar
    (Hs.QualifiedImport (Hs.ModuleName "HsBindgen.Runtime.CBool") (Just "CBool"))

-- | Build @\\x0 … x(n-1) -> fmap conv (target (conv x0) … (conv x(n-1)))@.
--
-- Typed de Bruijn, continuation-passing (the vendor's own n-ary wrapper
-- builder uses the same shape): each 'SHs.ELam' extends the context, and
-- the accumulated argument indices weaken by exactly 'SHs.IS'.
etaBody
  :: [Maybe ScalarBridge]
  -> Maybe ScalarBridge
  -> (forall ctx. SHs.SExpr ctx)
  -> SHs.ClosedExpr
etaBody paramBridges resultBridge callee = go (zip [0 :: Int ..] paramBridges) []
 where
  go
    :: forall ctx
     . [(Int, Maybe ScalarBridge)]
    -> [SHs.Idx ctx]
    -- \^ Bound argument indices, innermost (= last parameter) first.
    -> SHs.SExpr ctx
  go [] acc =
    let args =
          [ maybe id bridgeArg bridge (SHs.EBound ix)
          | (ix, bridge) <- zip (reverse acc) paramBridges
          ]
        call = foldl' SHs.EApp callee args
     in maybe call (`bridgeResult` call) resultBridge
  go ((i, _) : rest) acc =
    SHs.ELam
      (SHs.NameHint ("x" <> show i))
      (go rest (SHs.IZ : map SHs.IS acc))

annotatedComment
  :: BindgenTarget
  -> (HsDoc.Comment -> HsDoc.Comment)
  -> Text
  -> Bool
  -> AliasBinding
  -> HsDoc.Comment
annotatedComment target rewrite familyBase bridged b =
  rewritten
    { HsDoc.children = rewritten.children <> sysNotes
    , HsDoc.origin = rewritten.origin <|> Just b.cName
    }
 where
  rewritten = rewrite (fromMaybe mempty b.funDecl.comment)

  -- Unpadded text nodes: the renderer inserts inter-element spacing and
  -- attaches punctuation-leading text directly, so padding would double up.
  sysNotes =
    -- This produces '=== __TITLE__', which is collapsible
    HsDoc.Header
      HsDoc.Level4
      [HsDoc.Bold [HsDoc.Monospace [HsDoc.TextContent target.packageName], HsDoc.TextContent "notes"]]
      : ffiNotes
        <> scalarNotes

  scalarNotes
    | not bridged = []
    | otherwise =
        [ HsDoc.DefinitionList
            (HsDoc.TextContent "Scalars")
            [ HsDoc.Paragraph
                [ HsDoc.TextContent
                    $ "The binding generation has mapped C scalars to native Haskell "
                    <> "scalars for this function."
                ]
            , HsDoc.Paragraph
                [ HsDoc.TextContent
                    $ "Pointers and structs are untouched by this best-effort mapping. "
                    <> "Higher-level bindings are expected to map structs and pointers "
                    <> "as appropriate."
                ]
            ]
        ]

  ffiNotes =
    [ HsDoc.DefinitionList
        (HsDoc.TextContent "FFI safety")
        ( map
            HsDoc.Paragraph
            [flavorNote, counterpartNote, rationaleNote, hatchNote]
        )
    ]

  flavorNote =
    [ HsDoc.Bold [HsDoc.TextContent flavorWord]
    , HsDoc.TextContent "foreign import of"
    , HsDoc.Monospace [HsDoc.TextContent b.cName]
    , HsDoc.TextContent "."
    ]
   where
    flavorWord = case b.flavor of
      SafeFlavor -> "Safe"
      UnsafeFlavor -> "Unsafe"

  counterpartNote = case (b.flavor, b.counterpart) of
    (UnsafeFlavor, Just safe) ->
      [ HsDoc.TextContent "The safe flavor is"
      , HsDoc.Identifier safe
      ]
    (SafeFlavor, Just unsafe) ->
      [ HsDoc.TextContent "The unsafe flavor is"
      , HsDoc.Identifier unsafe
      ]
    (SafeFlavor, Nothing) ->
      [HsDoc.TextContent "The unsafe import is not exported"]
    (UnsafeFlavor, Nothing) ->
      [HsDoc.TextContent "The safe import is not exported"]

  rationaleNote = case (b.flavor, b.rationale) of
    (_, Just why) ->
      [HsDoc.TextContent (": " <> why <> ".")]
    (_, Nothing) ->
      [HsDoc.TextContent "."]

  -- Refused unsafe flavors stay reachable for callers whose FunPtrs cannot
  -- re-enter the runtime; the curated layer only declines to re-export.
  hatchNote = case (b.flavor, b.counterpart) of
    (SafeFlavor, Nothing) ->
      [ HsDoc.TextContent
          [trimmingQQ|
            If your callback is a non-Haskell function pointer that never
            re-enters the Haskell runtime, the unsafe import remains available as
          |]
      , HsDoc.Monospace [HsDoc.TextContent (familyBase <> ".Unsafe." <> b.bindgenName)]
      , HsDoc.TextContent "."
      ]
    _bothOrOptOut -> []

-- | The typed-constant pattern synonyms, appended to the rendered module
-- as a text block.
--
-- hs-bindgen's pattern-synonym AST node requires a pass-indexed C origin
-- that the entire render path ignores; synthesizing one would couple this
-- module to four frontend-internal types. The block is emitted textually
-- instead — the same controlled seam as the runtime facades and the
-- platform shims — while the export entries and the @PatternSynonyms@
-- pragma still go through the AST. Values are probed ground truth
-- (bitmasks in width-padded hex, value spaces in decimal), re-asserted on
-- every consumer platform by the ABI assertion TU.
constantsBlock :: AliasModule -> Text
constantsBlock aliasModule = case aliasModule.constants of
  [] -> ""
  groups -> T.concat (map groupBlock groups)
 where
  groupBlock group = T.concat (map (memberBlock group) group.members)

  memberBlock group member =
    T.unlines
      [ ""
      , "{-| Typed constant for macro @" <> member.cName <> "@." <> combineNote group.combine
      , "-}"
      , "pattern " <> member.cName <> " :: " <> group.typeName
      , "pattern "
          <> member.cName
          <> " = "
          <> group.constrName
          <> " "
          <> renderValue group member.value
      ]

  combineNote = \case
    Bitmask -> " Combine with @.|.@ from \"Data.Bits\"."
    ValueSpace -> ""

  renderValue group v = case group.combine of
    Bitmask ->
      let digits = max 1 (group.widthBits `div` 4)
       in "0x" <> T.justifyRight digits '0' (T.pack (showHex v ""))
    ValueSpace -> show v

-- | Rewrite documentation cross-references: identifier nodes through the
-- mangled-name map, and bare-text word tokens carrying the target's
-- function prefix (@SDL_*@) through the C-name map (with trailing sentence
-- punctuation peeled into its own node — the renderer attaches
-- punctuation-leading text without a space). Targets in another family
-- render as module-qualified links, which Haddock resolves without an
-- import. Text and link targets pass through the target's 'DocHooks'
-- first.
rewriteComment :: BindgenTarget -> Map Text (Text, Text) -> Text -> HsDoc.Comment -> HsDoc.Comment
rewriteComment target rewriteMap currentModule comment =
  comment
    { HsDoc.title = concatMap inlines <$> comment.title
    , HsDoc.children = map block comment.children
    }
 where
  block = \case
    HsDoc.Paragraph xs -> HsDoc.Paragraph (concatMap inlines xs)
    HsDoc.ListItem t bs -> HsDoc.ListItem t (map block bs)
    HsDoc.DefinitionList term bs ->
      HsDoc.DefinitionList (rewriteOne term) (map block bs)
    HsDoc.Header lvl xs -> HsDoc.Header lvl (concatMap inlines xs)
    other -> other

  -- Positions that hold exactly one inline and cannot split.
  rewriteOne = \case
    HsDoc.Identifier t | Just q <- qualified t -> HsDoc.Identifier q
    HsDoc.Monospace xs -> HsDoc.Monospace (concatMap inlines xs)
    HsDoc.Bold xs -> HsDoc.Bold (concatMap inlines xs)
    other -> other

  inlines = \case
    HsDoc.Identifier t
      | Just q <- qualified t -> [HsDoc.Identifier q]
    HsDoc.TextContent t -> textTokens (target.docs.fixText t)
    HsDoc.Monospace xs -> [HsDoc.Monospace (concatMap inlines xs)]
    HsDoc.Emph xs -> [HsDoc.Emph (concatMap inlines xs)]
    HsDoc.Bold xs -> [HsDoc.Bold (concatMap inlines xs)]
    HsDoc.Link lbl url -> [HsDoc.Link (concatMap inlines lbl) (target.docs.fixLink url)]
    other -> [other]

  qualified t = do
    (targetModule, alias) <- Map.lookup t rewriteMap
    pure
      $ if targetModule == currentModule then
        alias
      else
        targetModule <> "." <> alias

  -- Bare-text mentions: an exact prefixed word (trailing punctuation
  -- peeled) becomes a link; tokens with parentheses or other decoration
  -- stay text.
  prefix = target.functionPrefix
  textTokens t
    | not (prefix `T.isInfixOf` t) = [HsDoc.TextContent t]
    | otherwise = mergeTexts (concatMap tokenSegments (T.words t))

  tokenSegments w =
    let trimmed = T.dropWhileEnd (`T.elem` ".,;:!?") w
        punct = T.drop (T.length trimmed) w
        -- C-call spellings ("SDL_GetError()") link too: peel the parens
        -- before the lookup and drop them from the rendered link — the
        -- target is a Haskell identifier, not a C call.
        core = fromMaybe trimmed (T.stripSuffix "()" trimmed)
     in case qualified core of
          Just q
            | prefix `T.isPrefixOf` core
            , T.all (\c -> isAlphaNum c || c == '_') core ->
                HsDoc.Identifier q
                  : [HsDoc.TextContent punct | not (T.null punct)]
          _ -> [HsDoc.TextContent w]

  -- Re-join adjacent text fragments with single spaces so word-splitting
  -- does not multiply inline nodes.
  mergeTexts = foldr step []
   where
    step (HsDoc.TextContent a) (HsDoc.TextContent b : rest) =
      HsDoc.TextContent (a <> " " <> b) : rest
    step x rest = x : rest

-- | The umbrella module: every family plus the Runtime bridge module,
-- re-exported whole, with a one-line index built from each family's
-- overview title.
renderUmbrella :: BindgenTarget -> [AliasModule] -> (Text, Text)
renderUmbrella target aliasModules =
  ( umbrellaName
  , withModuleDoc (target.prose.umbrellaDoc familyIndex) (renderModule hsModule)
  )
 where
  umbrellaName = Module.hsName target.namespace
  runtimeName = runtimeModuleName target
  names = sort (runtimeName : map (.moduleName) aliasModules)

  familyIndex =
    T.intercalate "\n"
      $ map
        (\(name, title) -> "-- * \"" <> name <> "\"" <> maybe "" (" — " <>) title)
        ( sortOn
            fst
            ( (runtimeName, Just runtimeIndexTitle)
                : [(m.moduleName, titleOf m) | m <- aliasModules]
            )
        )
  titleOf m = case m.moduleDoc >>= (.title) of
    Just inlines
      | let t = firstSentence (target.docs.fixText (inlineText inlines))
      , not (T.null t) ->
          Just t
    _noTitle -> familyOneLiner target m.familyBase

  -- Category-overview fusion can glue the first declaration's prose onto
  -- a family's title (the upstream doxygen seam); the index keeps only
  -- the first sentence.
  firstSentence t = case T.breakOn ". " t of
    (h, rest)
      | T.null rest -> t
      | otherwise -> h <> "."

  hsModule =
    HsModule.authoredModule
      HsModule.AuthoredModule
        { pragmas = ["LANGUAGE DuplicateRecordFields"]
        , moduleComment = Nothing
        , name = Hs.ModuleName umbrellaName
        , exports =
            [ HsModule.ExportEntry (HsModule.ExportModule (Hs.ModuleName m))
            | m <- names
            ]
        , imports =
            [ HsModule.UnqualifiedImportListItem (Hs.ModuleName m) Nothing
            | m <- names
            ]
        , decls = []
        }

runtimeModuleName :: BindgenTarget -> Text
runtimeModuleName = Module.hsName . runtimeModule

-- | The last segment of a dotted module name: the key of the target's
-- per-family prose.
familySegment :: Text -> Text
familySegment = T.takeWhileEnd (/= '.')

-- | The target's hand-curated one-liner for a family whose overview doxygen
-- cannot attach; consulted only when no overview title exists.
familyOneLiner :: BindgenTarget -> Text -> Maybe Text
familyOneLiner target familyBase =
  Map.lookup (familySegment familyBase) target.prose.familyOneLiners

runtimeIndexTitle :: Text
runtimeIndexTitle =
  "Bridge vocabulary: C99 bool and C enum conversions, curated from the runtime."

-- | Every term-level name the Runtime bridge module exports — reserved
-- against alias minting ('planAliasLayer'), because the umbrella
-- re-exports both surfaces.
runtimeReservedNames :: Set Text
runtimeReservedNames =
  Set.fromList
    [ "toBool"
    , "fromBool"
    , "true"
    , "false"
    , "isTrue"
    , "isFalse"
    , "toCEnum"
    , "fromCEnum"
    , "isDeclared"
    , "mkDeclared"
    , "declaredValues"
    , "minDeclaredValue"
    , "maxDeclaredValue"
    , "getNames"
    ]

-- | The curated Runtime bridge module: the conversion vocabulary a
-- consumer of the curated layer actually reaches for, re-exported with
-- explicit names so the runtime modules' Prelude-clashing lifted
-- combinators (@not@, @&&@, @when@, …) stay out of the umbrella. Emitted as
-- a text template under the target's Haddock: selective class-method
-- re-exports are not expressible in the hs-bindgen export AST.
renderRuntimeModule :: BindgenTarget -> (Text, Text)
renderRuntimeModule target =
  ( runtimeName
  , target.prose.runtimeDoc
      <> "\n"
      <> [trimmingQQ|
      module $runtimeName (
          -- * C99 bool
          CBool.toBool,
          CBool.fromBool,
          CBool.true,
          CBool.false,
          CBool.isTrue,
          CBool.isFalse,
          -- * C enums
          CEnum.CEnum (CEnumZ, toCEnum, fromCEnum, isDeclared, mkDeclared, declaredValues),
          CEnum.SequentialCEnum (minDeclaredValue, maxDeclaredValue),
          CEnum.getNames,
        ) where

      import $bindgenRoot.Runtime.CBool qualified as CBool
      import $bindgenRoot.Runtime.CEnum qualified as CEnum
    |]
      <> "\n"
  )
 where
  runtimeName = runtimeModuleName target
  bindgenRoot = bindgenNamespaceText target

-- | Flatten a title's inline content to plain text for the umbrella index.
-- Mirrors the renderer's spacing rule: elements are space-separated except
-- when the following text leads with sentence punctuation. Total by
-- construction — payload-free inline forms flatten to nothing.
inlineText :: [HsDoc.CommentInlineContent] -> Text
inlineText = squash . foldr step ""
 where
  squash = T.unwords . T.words
  step x acc =
    let t = one x
        sep
          | T.null acc = ""
          | Just (c, _) <- T.uncons acc, c `T.elem` ".,;:!?)" = ""
          | otherwise = " "
     in t <> sep <> acc
  one = \case
    HsDoc.TextContent t -> t
    HsDoc.Monospace xs -> T.concat (map one xs)
    HsDoc.Emph xs -> T.concat (map one xs)
    HsDoc.Bold xs -> T.concat (map one xs)
    HsDoc.Module t -> t
    HsDoc.Identifier t -> t
    HsDoc.Type t -> t
    HsDoc.Link lbl _ -> T.concat (map one lbl)
    HsDoc.URL t -> t
    _noProsePayload -> ""

pragmasFor :: [SHs.SDecl] -> [HsModule.GhcPragma]
pragmasFor decls =
  Set.toAscList
    $ Set.fromList
      (HsModule.resolvePragmas HB.AddFieldPrefixes HB.PreQualified [] decls)

renderModule :: HsModule.HsModule -> Text
renderModule = T.pack . HsModule.render

withModuleDoc :: Text -> Text -> Text
withModuleDoc doc rendered =
  case break ("module " `T.isPrefixOf`) (T.lines rendered) of
    (before, moduleAndRest@(_ : _)) ->
      T.unlines (before <> T.lines doc <> moduleAndRest)
    _noModuleLine -> doc <> "\n" <> rendered

-- | The curated module header: the family's SDL category overview when the
-- header carried one (54 of 58 do), else a synthesized title — followed by
-- the compact conventions block and any per-family extras. The full
-- conventions story lives once, on the umbrella.
familyComment
  :: BindgenTarget -> (HsDoc.Comment -> HsDoc.Comment) -> AliasModule -> HsDoc.Comment
familyComment target rewrite aliasModule =
  lead <> conventionsComment target aliasModule <> familyExtraComment target aliasModule
 where
  lead = case aliasModule.moduleDoc of
    Just overview -> rewrite overview
    Nothing ->
      mempty
        { HsDoc.title =
            Just $ case familyOneLiner target aliasModule.familyBase of
              Just oneLiner -> [HsDoc.TextContent oneLiner]
              Nothing ->
                [ HsDoc.TextContent "Curated aliases for"
                , HsDoc.Monospace [HsDoc.TextContent (from aliasModule.headerName)]
                , HsDoc.TextContent "."
                ]
        }

-- | The per-family conventions block, deliberately compact: the flavor rule
-- and a pointer at the umbrella for the full story (registry, refusal
-- rationale, the Bindgen escape hatch).
conventionsComment :: BindgenTarget -> AliasModule -> HsDoc.Comment
conventionsComment target aliasModule =
  mempty
    { HsDoc.children =
        [ -- The pretty-printer emits @fromEnum level@ equals signs, so
          -- 'HsDoc.Level3' is what renders as a Haddock @==@ section.
          HsDoc.Header HsDoc.Level3 [HsDoc.TextContent "FFI conventions"]
        , HsDoc.Paragraph
            [ HsDoc.TextContent "Unsuffixed aliases are"
            , HsDoc.Bold [HsDoc.TextContent "unsafe"]
            , HsDoc.TextContent "foreign imports; aliases suffixed"
            , HsDoc.Monospace [HsDoc.TextContent "Safe"]
            , HsDoc.TextContent
                "are safe. Functions whose callbacks fire during the call \
                \export only the Safe alias (the genuine unsafe import stays \
                \reachable under"
            , HsDoc.Monospace [HsDoc.TextContent (aliasModule.familyBase <> ".Unsafe")]
            , HsDoc.TextContent
                "); functions curated unsafe-only export only the unsuffixed \
                \one. Each alias's documentation records its flavor and \
                \rationale."
            ]
        , HsDoc.Paragraph
            [ HsDoc.TextContent "Full conventions:"
            , HsDoc.Module (Module.hsName target.namespace)
            , HsDoc.TextContent "."
            ]
        ]
    }

-- | The target's per-family additions to the module header, keyed by the
-- family segment: usage guidance that belongs at the point of need rather
-- than in the package README.
familyExtraComment :: BindgenTarget -> AliasModule -> HsDoc.Comment
familyExtraComment target aliasModule =
  Map.findWithDefault mempty (familySegment aliasModule.moduleName) target.prose.familyExtras
