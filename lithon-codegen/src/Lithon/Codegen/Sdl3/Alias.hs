{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StrictData #-}

{- HLINT ignore "Replace case with maybe" -}

-- | Planning and rendering the @SDL3.Sys.*@ layer.
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
module Lithon.Codegen.Sdl3.Alias (
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
  sysNamespace,
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
import Numeric (showHex)

import Lithon.Codegen.Prelude hiding (group, one)
import Lithon.Codegen.Sdl3.Alias.Config (ValidatedAliasConfig (..))
import Lithon.Codegen.Sdl3.Alias.Constants (
  Combine (..),
  ConstantGroupPlan (..),
  ConstantMember (..),
 )
import Lithon.Codegen.Sdl3.Alias.Names (
  AliasError (..),
  Flavor (..),
  MintedAlias (..),
  mintAliasNames,
  primaryAliasName,
 )

sysNamespace :: Text
sysNamespace = "SDL3.Sys"

bindgenNamespace :: Text
bindgenNamespace = "SDL3.Sys.Bindgen"

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
isCallbackArg arg = case C.getCanonicalType arg.argTyp.typ of
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
  :: ValidatedAliasConfig
  -> Map Text [ConstantGroupPlan]
  -- ^ Planned constant groups, keyed by family base module.
  -> [FamilyDecls]
  -> Validation (Errors AliasError) [AliasModule]
planAliasLayer validated constantPlans families =
  case mintAliasNames validated.renames classified of
    Failure errs -> Failure errs
    Success minted ->
      reservedCheck minted
        *> (filter keep <$> traverse (planFamily minted) families)
 where
  -- The umbrella re-exports every family AND the Runtime bridge module, so
  -- an alias reusing a bridge name would be a duplicate export downstream.
  reservedCheck minted =
    failUnlessEmpty
      [ AliasReservedCollision{aliasName, cName}
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
      (sysModuleName family.familyBase)

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
sysModuleName :: Text -> Either Text Text
sysModuleName base = do
  familySeg <-
    maybeToRight ("not under " <> bindgenNamespace <> ": " <> base)
      $ T.stripPrefix (bindgenNamespace <> ".") base
  when ("." `T.isInfixOf` familySeg)
    $ Left ("family module has nested segments: " <> base)
  when (familySeg `elem` (["Bindgen", "Runtime"] :: [Text]))
    $ Left ("family segment shadows the " <> familySeg <> " namespace: " <> base)
  pure (sysNamespace <> "." <> familySeg)

{-------------------------------------------------------------------------------
  Rendering
-------------------------------------------------------------------------------}

-- | Render one family module through hs-bindgen's own module assembly and
-- pretty-printer. The rewrite map sends mangled Bindgen names to primary
-- alias names inside copied documentation.
renderAliasModule :: Map Text (Text, Text) -> AliasModule -> (Text, Text)
renderAliasModule rewriteMap aliasModule =
  ( aliasModule.moduleName
  , renderModule hsModule <> constantsBlock aliasModule
  )
 where
  rewrite = rewriteComment rewriteMap aliasModule.moduleName
  hsModule =
    HsModule.HsModule
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
        moduleComment = Just (familyComment rewrite aliasModule)
      , name = Hs.ModuleName aliasModule.moduleName
      , exports
      , imports
      , qualifiedStyle = HB.PreQualified
      , cWrappers = []
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
                StdincScope -> bindgenNamespace <> ".Stdinc"
        ]

  declsWithScopes = map (bindingDecl rewrite aliasModule.familyBase) aliasModule.bindings
  decls = map fst declsWithScopes
  ctorScopes = Set.unions (map snd declsWithScopes)

bindingDecl
  :: (HsDoc.Comment -> HsDoc.Comment) -> Text -> AliasBinding -> (SHs.SDecl, Set CtorScope)
bindingDecl rewrite familyBase b =
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
            Just (annotatedComment rewrite familyBase (isJust resultBridge || any isJust paramBridges) b)
        }
  , Set.fromList
      [ scope
      | Just (BridgeCoerce _ (Just scope)) <- resultBridge : paramBridges
      ]
  )
 where
  target :: forall ctx. SHs.SExpr ctx
  target =
    SHs.EGlobal (SHs.CustomGlobal (TH.mkName (toString b.bindgenName)) SHs.GVar flavorImport)

  paramTys = map (SHs.translateType . (.typ)) b.funDecl.parameters
  resultTy = SHs.translateType b.funDecl.result
  paramBridges = map scalarBridge paramTys
  resultBridge = case resultTy of
    SHs.TApp (SHs.TGlobal io) inner
      | io == SHs.bindgenGlobalType SHs.IO_type -> scalarBridge inner
    _notIoScalar -> Nothing

  -- Mixed emission: bindings without a scalar bridge stay thin,
  -- point-free references; bridged ones are eta-expanded with the
  -- conversions applied per argument and 'fmap'-ed over the result.
  body
    | all isNothing paramBridges && isNothing resultBridge = target
    | otherwise = etaBody paramBridges resultBridge target

  bridgedType t = maybe t nativeScalarType (scalarBridge t)
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
-- @Foreign.C@ integers ('CInt'⇄'Int32', …), @size_t@⇄'Word64', and SDL's
-- own @UintN@\/@SintN@ width typedefs — is a 'Data.Coerce.coerce'.
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
  | -- | Coerce to\/from the given native global; 'CtorScope' names the
    -- import that keeps the 'Data.Coerce.Coercible' evidence solvable.
    BridgeCoerce SHs.BindgenGlobalType (Maybe CtorScope)

-- | Which qualified import guarantees the bridged newtype's constructor is
-- in scope (nothing organic does — see the import note in
-- 'renderAliasModule'). Same-family Stdinc references need no entry: the
-- family's own base module is already imported unqualified and wholesale.
data CtorScope = LibCScope | StdincScope
  deriving stock (Eq, Ord, Show)

scalarBridge :: SHs.SType ctx -> Maybe ScalarBridge
scalarBridge = \case
  SHs.TGlobal g
    | g == SHs.bindgenGlobalType SHs.CBool_type -> Just BridgeBool
    | otherwise ->
        safeHead
          [ BridgeCoerce native (Just LibCScope)
          | (foreignC, native) <- foreignCBridges
          , g == SHs.bindgenGlobalType foreignC
          ]
  -- Same-family reference to an SDL width typedef (the Stdinc module's own
  -- functions). Name-only match: SDL declares these eight names in
  -- @SDL_stdinc.h@ alone, and the toy golden pins a same-named semantic
  -- typedef staying raw.
  SHs.TCon n -> BridgeCoerce <$> stdincNative n.text <*> pure Nothing
  SHs.TExt ref _cTypeSpec _hsTypeSpec
    | ref.moduleName.text == bindgenNamespace <> ".Stdinc" ->
        BridgeCoerce <$> stdincNative ref.name.text <*> pure (Just StdincScope)
    | ref.moduleName.text == "HsBindgen.Runtime.LibC"
    , ref.name.text == "CSize" ->
        Just (BridgeCoerce SHs.Word64_type (Just LibCScope))
  _notBridgedScalar -> Nothing

-- | @Foreign.C@ scalars and their equal-width native twins. 'CLong' and
-- 'CULong' are deliberately absent (platform-width; zero occurrences).
foreignCBridges :: [(SHs.BindgenGlobalType, SHs.BindgenGlobalType)]
foreignCBridges =
  [ (SHs.CFloat_type, SHs.Float_type)
  , (SHs.CDouble_type, SHs.Double_type)
  , (SHs.CInt_type, SHs.Int32_type)
  , (SHs.CUInt_type, SHs.Word32_type)
  , (SHs.CShort_type, SHs.Int16_type)
  , (SHs.CUShort_type, SHs.Word16_type)
  , (SHs.CLLong_type, SHs.Int64_type)
  , (SHs.CULLong_type, SHs.Word64_type)
  ]

-- | The eight SDL width typedefs (newtypes over the equal-width GHC
-- primitives in the generated Stdinc module). Semantic typedefs layered on
-- top of these ('SDL_JoystickID', 'SDL_InitFlags', …) are different names
-- and therefore never match — they keep their newtypes by design.
stdincNative :: Text -> Maybe SHs.BindgenGlobalType
stdincNative = \case
  "Uint8" -> Just SHs.Word8_type
  "Uint16" -> Just SHs.Word16_type
  "Uint32" -> Just SHs.Word32_type
  "Uint64" -> Just SHs.Word64_type
  "Sint8" -> Just SHs.Int8_type
  "Sint16" -> Just SHs.Int16_type
  "Sint32" -> Just SHs.Int32_type
  "Sint64" -> Just SHs.Int64_type
  _notWidthTypedef -> Nothing

nativeScalarType :: ScalarBridge -> SHs.SType ctx
nativeScalarType =
  SHs.tBindgenGlobal . \case
    BridgeBool -> SHs.Bool_type
    BridgeCoerce native _ctorScope -> native

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
-- the Stdinc base module exports the width typedefs').
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
etaBody paramBridges resultBridge target = go (zip [0 :: Int ..] paramBridges) []
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
        call = foldl' SHs.EApp target args
     in maybe call (`bridgeResult` call) resultBridge
  go ((i, _) : rest) acc =
    SHs.ELam
      (SHs.NameHint ("x" <> show i))
      (go rest (SHs.IZ : map SHs.IS acc))

annotatedComment
  :: (HsDoc.Comment -> HsDoc.Comment) -> Text -> Bool -> AliasBinding -> HsDoc.Comment
annotatedComment rewrite familyBase bridged b =
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
      [HsDoc.Bold [HsDoc.Monospace [HsDoc.TextContent "sdl3-bindgen-sys"], HsDoc.TextContent "notes"]]
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
    ValueSpace -> T.pack (show v)

-- | Doxygen leaves SDL-wiki-relative markdown links (@[x](CategoryY)@) as
-- plain text inside peeled category overviews, where they never become
-- 'HsDoc.Link' nodes; the exact-prefix substitution points them at the SDL
-- wiki, whose page names are exactly these identifiers. Link-node targets
-- get the same treatment in 'rewriteComment'.
wikiFixLinks :: Text -> Text
wikiFixLinks = T.replace "](Category" "](https://wiki.libsdl.org/SDL3/Category"

-- | Rewrite documentation cross-references: identifier nodes through the
-- mangled-name map, and bare-text @SDL_*@ word tokens through the C-name
-- map (with trailing sentence punctuation peeled into its own node — the
-- renderer attaches punctuation-leading text without a space). Targets in
-- another family render as module-qualified links, which Haddock resolves
-- without an import.
rewriteComment :: Map Text (Text, Text) -> Text -> HsDoc.Comment -> HsDoc.Comment
rewriteComment rewriteMap currentModule comment =
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
    HsDoc.TextContent t -> textTokens (wikiFixLinks t)
    HsDoc.Monospace xs -> [HsDoc.Monospace (concatMap inlines xs)]
    HsDoc.Emph xs -> [HsDoc.Emph (concatMap inlines xs)]
    HsDoc.Bold xs -> [HsDoc.Bold (concatMap inlines xs)]
    HsDoc.Link lbl url -> [HsDoc.Link (concatMap inlines lbl) (sdlWikiUrl url)]
    other -> [other]

  -- Doxygen leaves SDL-wiki-relative link targets (@CategoryAudio@,
  -- @CategoryAudio#anchor@) unresolved — they only mean something on the
  -- SDL wiki. Anything with a scheme (https:, mailto:, …) passes through;
  -- scheme-less targets get pointed at the wiki, whose page names are
  -- exactly these identifiers.
  sdlWikiUrl url
    | ":" `T.isInfixOf` url = url
    | otherwise = "https://wiki.libsdl.org/SDL3/" <> url

  qualified t = do
    (targetModule, alias) <- Map.lookup t rewriteMap
    pure
      $ if targetModule == currentModule then
        alias
      else
        targetModule <> "." <> alias

  -- Bare-text mentions: an exact SDL_* word (trailing punctuation peeled)
  -- becomes a link; tokens with parentheses or other decoration stay text.
  textTokens t
    | not ("SDL_" `T.isInfixOf` t) = [HsDoc.TextContent t]
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
            | "SDL_" `T.isPrefixOf` core
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
-- re-exported whole, with a one-line index built from each family's SDL
-- overview title.
renderUmbrella :: [AliasModule] -> (Text, Text)
renderUmbrella aliasModules =
  ( sysNamespace
  , withModuleDoc (umbrellaDoc familyIndex) (renderModule hsModule)
  )
 where
  names = sort (runtimeModuleName : map (.moduleName) aliasModules)

  familyIndex =
    T.intercalate "\n"
      $ map
        (\(name, title) -> "-- * \"" <> name <> "\"" <> maybe "" (" — " <>) title)
        ( sortOn
            fst
            ( (runtimeModuleName, Just runtimeIndexTitle)
                : [(m.moduleName, titleOf m) | m <- aliasModules]
            )
        )
  titleOf m = case m.moduleDoc >>= (.title) of
    Just inlines
      | let t = firstSentence (wikiFixLinks (inlineText inlines))
      , not (T.null t) ->
          Just t
    _noTitle -> familyOneLiner m.familyBase

  -- Category-overview fusion can glue the first declaration's prose onto
  -- a family's title (the upstream doxygen seam); the index keeps only
  -- the first sentence.
  firstSentence t = case T.breakOn ". " t of
    (h, rest)
      | T.null rest -> t
      | otherwise -> h <> "."

  hsModule =
    HsModule.HsModule
      { pragmas = ["LANGUAGE DuplicateRecordFields"]
      , moduleComment = Nothing
      , name = Hs.ModuleName sysNamespace
      , exports =
          [ HsModule.ExportEntry (HsModule.ExportModule (Hs.ModuleName m))
          | m <- names
          ]
      , imports =
          [ HsModule.UnqualifiedImportListItem (Hs.ModuleName m) Nothing
          | m <- names
          ]
      , qualifiedStyle = HB.PreQualified
      , cWrappers = []
      , decls = []
      }

runtimeModuleName :: Text
runtimeModuleName = "SDL3.Sys.Runtime"

-- | Hand-curated one-liners for the families whose SDL category overview
-- doxygen cannot attach (their category comments precede macros libclang
-- never surfaces, so the peel finds nothing). Consulted only when no
-- overview title exists; phrasing follows SDL's own category summaries
-- where one exists.
familyOneLiner :: Text -> Maybe Text
familyOneLiner familyBase =
  case T.takeWhileEnd (/= '.') familyBase of
    "Endian" -> Just "Functions for reading and writing endian-specific values."
    "Error" -> Just "Simple error message routines for SDL."
    "Main" -> Just "App entry-point handling; SDL_main is not bound here."
    "Mutex" ->
      Just
        "Thread synchronization primitives: mutexes, semaphores, condition variables, and read/write locks."
    "PlatformDefines" -> Just "Platform-detection defines, baked at generation time."
    "Stdinc" -> Just "SDL's C-library replacements: memory, strings, math, and conversions."
    "System" -> Just "Platform-specific SDL API functions."
    "Vulkan" -> Just "Functions for creating Vulkan surfaces on SDL windows."
    _hasOverview -> Nothing

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

-- | The curated Runtime bridge module: the conversion vocabulary an
-- @SDL3.Sys@ consumer actually reaches for, re-exported with explicit
-- names so the runtime modules' Prelude-clashing lifted combinators
-- (@not@, @&&@, @when@, …) stay out of the umbrella. Emitted as a text
-- template: selective class-method re-exports are not expressible in the
-- hs-bindgen export AST.
renderRuntimeModule :: (Text, Text)
renderRuntimeModule =
  ( runtimeModuleName
  , [trimmingQQ|
      -- | Bridge vocabulary for the curated layer: C99 bool conversions and
      -- the C enum classes, curated from the vendored hs-bindgen runtime.
      --
      -- Struct fields deliberately keep their C types (a keyboard event's
      -- @repeat@ field is a @CBool@; a rect's @x@ is a C @int@); 'toBool'
      -- bridges the bool case, and plain 'Prelude.fromIntegral' or
      -- 'Data.Coerce.coerce' the fixed-width integer typedefs. The full
      -- runtime surface — including the lifted 'Prelude'-shadowing
      -- combinators these exports leave behind — stays available under
      -- "SDL3.Sys.Bindgen.Runtime" and its submodules.
      module SDL3.Sys.Runtime (
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

      import SDL3.Sys.Bindgen.Runtime.CBool qualified as CBool
      import SDL3.Sys.Bindgen.Runtime.CEnum qualified as CEnum
    |]
      <> "\n"
  )

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
familyComment :: (HsDoc.Comment -> HsDoc.Comment) -> AliasModule -> HsDoc.Comment
familyComment rewrite aliasModule =
  lead <> conventionsComment aliasModule <> familyExtraComment aliasModule
 where
  lead = case aliasModule.moduleDoc of
    Just overview -> rewrite overview
    Nothing ->
      mempty
        { HsDoc.title =
            Just $ case familyOneLiner aliasModule.familyBase of
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
conventionsComment :: AliasModule -> HsDoc.Comment
conventionsComment aliasModule =
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
            , HsDoc.Module sysNamespace
            , HsDoc.TextContent "."
            ]
        ]
    }

-- | Per-family additions to the module header, keyed by the family
-- segment. The place for usage guidance that belongs at the point of
-- need rather than in the package README.
familyExtraComment :: AliasModule -> HsDoc.Comment
familyExtraComment aliasModule =
  case T.takeWhileEnd (/= '.') aliasModule.moduleName of
    "Events" ->
      mempty
        { HsDoc.children =
            [ HsDoc.Header HsDoc.Level3 [HsDoc.TextContent "Reading events"]
            , HsDoc.Paragraph
                [ HsDoc.Monospace [HsDoc.TextContent "SDL_Event"]
                , HsDoc.TextContent "is a C union: poll into an"
                , HsDoc.Monospace [HsDoc.TextContent "alloca"]
                , HsDoc.TextContent
                    "buffer, read the event-type discriminant first, then \
                    \peek the payload member for that type. The"
                , HsDoc.Monospace [HsDoc.TextContent "sdl3-raw"]
                , HsDoc.TextContent
                    "example in the repository shows the full idiom;"
                , HsDoc.Identifier "pollEvent"
                , HsDoc.TextContent "and the"
                , HsDoc.Monospace [HsDoc.TextContent "SDL_EVENT_*"]
                , HsDoc.TextContent "patterns live in this module."
                ]
            ]
        }
    _ -> mempty

umbrellaDoc :: Text -> Text
umbrellaDoc familyIndex =
  [trimmingQQ|
  -- |
  -- Curated low-level SDL3 surface: Re-exports every per-header module.
  --
  -- This is a low-level module intended to provide the building blocks for
  -- higher-level libraries.
  --
  -- Contributing is encouraged. Please submit either an issue or PR to the
  -- upstream repository if you run into problems with these generated bindings.
  --
  -- These bindings are still experimental and in flux, and will not stabilize
  -- at least until hs-bindgen is itself released stably. 
  --
  -- Pin to a minor version (e.g. @>=0.0.0.1 && <0.0.1@) until this library hits @0.1.0.0@.
  --
  -- __Conventions__
  --
  -- * Every function's foreign-import flavor is classified deterministically
  --   by the checked-in registry. Most functions export both @safe@ and @unsafe@
  --   FFI bindings.
  --
  -- * Function aliases follow the camel-segments rule: strip @SDL_@ and
  --   join the underscore segments (@SDL_CreateWindow@ -> @createWindow@,
  --   @SDL_GL_SwapWindow@ -> @glSwapWindow@, @SDL_GUIDToString@ ->
  --   @guidToString@).
  --
  -- * An /unsuffixed/ alias is always the __unsafe__ foreign import; a
  --   @Safe@-suffixed alias is always the __safe__ one. 
  --
  -- * Functions that unavoidably invoke a callback during the call export 
  --   only the @Safe@ alias — re-entering Haskell from an unsafe call is undefined
  --   behavior, so the footgun is simply not handed out. NB: A non-Haskell 
  --   callback function (e.g., written in C or Rust) cannot re-enter the runtime; 
  --   for that case the unsafe imports stay available under the 
  --   @SDL3.Sys.Bindgen.*.Unsafe@ modules.
  --
  -- * Functions curated @unsafe-only@ — quick, nonblocking, callback-free —
  --   export only the unsuffixed alias: paying the safe-call overhead for
  --   them buys nothing. Each alias's documentation records its rationale.
  --
  -- * Types, enum patterns, macro constants, and property keys re-export
  --   verbatim from the @SDL3.Sys.Bindgen.*@ base modules.
  --
  -- * This layer additionally provides typed pattern synonyms for
  --   the macro constant groups in SDL headers.
  --
  -- * Some aliases (@free@, @abs@, @init@, …) collide with the "Prelude";
  --   import this module qualified or curate your import list.
  --
  -- == Families
  --
  $familyIndex
  --
  |]
