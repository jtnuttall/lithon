{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Value-layer source rendering (generate pass g9, M2 scope).
--
-- Emits the modules that need nothing but @lithon-core@ and @base@: enum
-- ADTs with their wire tables, FlagBits ADTs with 'FlagsWire'\/'BitPos'
-- instances and @Flags@ synonyms (compound literal values become @Flags@
-- pattern synonyms), handles, API constants, version patterns, the
-- @Lithon.Result@ 'Outcome' vocabulary, and the umbrella re-export.
--
-- Layout discipline: renderers emit legal, plainly-formatted Haskell;
-- fourmolu owns the final shape (the CLI formats every emitted module in
-- one batch invocation). Ordering is deterministic everywhere: entities
-- render in canonical-name order, enum items in (value, name) order.
--
-- Deliberate value-layer decisions, recorded here rather than in scattered
-- code comments:
--
-- * Dispatchable handles are emitted in a __staged__ form (newtype over
--   @Ptr X_T@); the M5 command milestone regenerates them carrying their
--   dispatch tables.
-- * @VK_TRUE@\/@VK_FALSE@ are not emitted as constants — 'Bool32' with its
--   @TRUE@\/@FALSE@ patterns and @From Bool@ instances supersedes them, and
--   emitting both would collide in the umbrella.
-- * Duplicate wire values within one enum block (rare, alias-shaped
--   registry quirks) keep every constructor in @toWire@ but only the first
--   (by emission order) decodes in @fromWire@.
module Lithon.Codegen.Vulkan.Generate.Render (
  RenderedModule (..),
  RenderError (..),
  renderValueLayer,
) where

import Data.Aeson (ToJSON)
import Data.Bits (popCount, shiftL, (.|.))
import Data.Char qualified as Char
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Vector qualified as V
import Lithon.Prelude
import Numeric (showHex)

import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Vulkan.Generate.Cmds (CmdDecl (..))
import Lithon.Codegen.Vulkan.Generate.Docs (DocKey (..), DocsMap (..))
import Lithon.Codegen.Vulkan.Generate.Layout (
  CarrierBit (..),
  FieldLayout (..),
  Layouts (..),
  StructLayout (..),
 )
import Lithon.Codegen.Vulkan.Generate.Lower (CPrim (..), CType (..), primSizeAlign)
import Lithon.Codegen.Vulkan.Generate.Marshal (
  CountPlan (..),
  FieldPlan (..),
  StructPlan (..),
  StructPlans (..),
  StructTiers (..),
 )
import Lithon.Codegen.Vulkan.Generate.Modules (
  ModuleMap (..),
  constantsModule,
  resultModule,
  umbrellaModule,
  versionModule,
 )
import Lithon.Codegen.Vulkan.Generate.Names (Names (..))
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Types.Enums (BitWidth (..), EnumsKind (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (CoreVersion (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBitmask (..),
  ResolvedFuncpointer (..),
  ResolvedHandle (..),
  ResolvedParam (..),
  ResolvedStruct (..),
  ResolvedTypeRef (..),
  StructKind (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (
  Constant (..),
  EnumFlow (..),
  ResolvedEnumBlock (..),
  ResolvedEnumItem (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums.Value (ConstantValue (..), EnumNumber (..))
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedFeature (..), ResolvedRegistry (..))

-- | One emitted module: its dotted path and full source text.
data RenderedModule = RenderedModule
  { meta :: Module.Meta
  , contents :: Text
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data RenderError
  = REnumValueNotInt32 {block :: Text, item :: Text, value :: Integer}
  | REnumBlockNot32Bit {block :: Text}
  | REnumValueNotBits {block :: Text, item :: Text}
  | RUnmintedName {what :: Text, name :: Text}
  | RUnsupportedField {struct :: Text, reason :: Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display RenderError where
  displayBuilder =
    displayBuilder @Text . \case
      REnumValueNotInt32{block, item, value} ->
        "enum value outside Int32 (the Open wire invariant): "
          <> block
          <> "."
          <> item
          <> " = "
          <> show value
      REnumBlockNot32Bit{block} ->
        "plain enum block is not 32-bit (the Open wire invariant): " <> block
      REnumValueNotBits{block, item} ->
        "bitmask item without a bit value: " <> block <> "." <> item
      RUnmintedName{what, name} ->
        "render: no minted name for " <> what <> " '" <> name <> "'"
      RUnsupportedField{struct, reason} ->
        "render: unsupported POD field in " <> struct <> ": " <> reason

-- | Render every value-layer module, grouped and deterministic.
renderValueLayer
  :: ( HasType ResolvedRegistry cxt
     , HasType Names cxt
     , HasType ModuleMap cxt
     , HasType Layouts cxt
     , HasType StructPlans cxt
     , HasType DocsMap cxt
     , HasType [CmdDecl] cxt
     )
  => cxt
  -> Validation (Errors RenderError) [RenderedModule]
renderValueLayer cxt =
  assemble
    <$> traverse enumDecls enumBlocks
    <*> traverse flagsSynonymDecl (Map.toList moduleMap.bitmaskModules)
    <*> traverse handleDecls (Map.toList moduleMap.handleModules)
    <*> traverse podDecl podStructs
    <*> traverse marshalDecl marshalStructs
    <*> traverse fpDecl (Map.toList moduleMap.funcpointerModules)
 where
  registry = getTyped @ResolvedRegistry cxt
  names = getTyped @Names cxt
  moduleMap = getTyped @ModuleMap cxt
  layouts' = getTyped @Layouts cxt
  plans' = getTyped @StructPlans cxt
  tiers = plans'.tiers
  docsMap = getTyped @DocsMap cxt
  -- prepend the synthesized doc block (see "Lithon.Codegen.Vulkan.Generate.Docs")
  withDocs k src = case Map.findWithDefault [] k docsMap.docs of
    [] -> src
    d -> T.intercalate "\n" (d <> [src])
  -- wrappers import their argument structs' modules; strip the self-import
  -- when the wrapper is sited in the same module as its structs
  cmdDecls =
    [ Decl
        { site = cd.site
        , needs = Set.delete ("import " <> Module.hsName cd.site) cd.needs
        , exports = cd.exports
        , source = cd.source
        }
    | cd <- getTyped @[CmdDecl] cxt
    ]

  -- PODs plus every union (non-POD unions render with the same raw-arm
  -- treatment; their pointer arms surface as raw pointers)
  podStructs =
    [ (name, at)
    | (name, at) <- Map.toList moduleMap.structModules
    , Set.member name tiers.pods || isUnionName name
    ]
  isUnionName name = case Map.lookup name registry.structs of
    Just s -> s.kind == SKUnion
    Nothing -> False

  marshalStructs =
    [ (name, at, plan)
    | (name, at) <- Map.toList moduleMap.structModules
    , Just plan@MarshalPlan{} <- [Map.lookup name plans'.plans]
    ]

  enumBlocks =
    [ (name, block, at)
    | (name, at) <- Map.toList moduleMap.enumModules
    , Just block <- [Map.lookup name registry.enums]
    ]

  -- Group all sited decls per module, append the fixed modules, then wrap
  -- each group with its header.
  assemble enums flagsSyns handles pods' marshals fps =
    let sited =
          concat enums
            <> flagsSyns
            <> concat handles
            <> pods'
            <> marshals
            <> fps
            <> cmdDecls
        grouped =
          Map.fromListWith
            (flip (<>))
            [(d.site, [d]) | d <- sited]
        entityModules =
          [ moduleSource at ds
          | (at, ds) <- Map.toAscList grouped
          ]
        fixed =
          [ constantsSource registry names
          , versionSource registry
          , resultSource names moduleMap
          , extendsSource names moduleMap plans'
          ]
        allButUmbrella = entityModules <> fixed
     in allButUmbrella
          <> [umbrellaSource ((.meta) <$> allButUmbrella)]

  -- ── enum + bits blocks ────────────────────────────────────────────────

  enumDecls (name, block, at) = case block.kind of
    KindEnum -> plainEnumDecls name block at
    KindBitmask -> bitsDecls name block at
    KindConstants -> pure [] -- not sited as modules
  plainEnumDecls name block at =
    mk <$> mintedType name <*> traverse plainItem (sortedItems block)
   where
    mk minted items =
      [ Decl
          { site = at
          , needs = Set.fromList ["import Lithon.Core.Open (HasWire (..))"]
          , exports = [ctorsExport minted items]
          , source = withDocs (DocType name) (plainEnumSource minted items)
          }
      ]
    plainItem item = case item.value of
      NumSigned v
        | v >= -2147483648 && v <= 2147483647 ->
            (,fromIntegral @_ @Integer v) <$> mintedCtor item.name
        | otherwise ->
            failing
              REnumValueNotInt32
                { block = forgetNamespace name
                , item = forgetNamespace item.name
                , value = fromIntegral v
                }
      NumBits _ ->
        failing REnumBlockNot32Bit{block = forgetNamespace name}

  bitsDecls name block at =
    mk <$> mintedType name <*> partitionItems name (sortedItems block)
   where
    (wire, wireImport) = case block.bitWidth of
      W32 -> ("Word32", "import Data.Word (Word32)")
      W64 -> ("Word64", "import Data.Word (Word64)")
    mk minted (bits, literals) =
      [ Decl
          { site = at
          , needs =
              Set.fromList
                ( ["import Lithon.Core.Flags (BitPos (..), FlagsWire)", wireImport]
                    <> [ "import Lithon.Core.Flags (Flags (..))"
                       | not (null bits && null literals)
                       ]
                )
          , exports =
              ctorsExport minted bits
                : ["pattern " <> p.ctor | p <- literals]
          , source = withDocs (DocType name) (bitsSource minted wire bits literals)
          }
      ]

  partitionItems name items =
    partitionEithers <$> traverse classify items
   where
    -- single-bit positions become ADT constructors; other values (zero,
    -- compound masks) become Flags patterns
    classify item = case item.value of
      NumBits w -> place (toInteger w) <$> mintedCtor item.name
      NumSigned v
        | v >= 0 -> place (toInteger v) <$> mintedCtor item.name
        | otherwise ->
            failing REnumValueNotBits{block = forgetNamespace name, item = forgetNamespace item.name}
    place v ctor
      | popCount v == 1 = Left (ctor, v)
      | otherwise = Right BitLiteral{ctor, value = v}

  -- ── Flags synonyms ────────────────────────────────────────────────────

  flagsSynonymDecl (name, at) = case Map.lookup name registry.bitmasks of
    Just bm
      | Just bits <- bm.bitsBlock ->
          mk [] <$> mintedType name <*> mintedType bits <*> pure []
      -- (the synonym's Flags type import is added by mk)
      -- reserved-empty: a generated empty bits ADT named after the Flags
      | otherwise ->
          ( \minted ->
              let bitsName = minted <> "Bits"
                  (wire, wireImport) = case bm.bitWidth of
                    W32 -> ("Word32", "import Data.Word (Word32)")
                    W64 -> ("Word64", "import Data.Word (Word64)")
               in mk
                    ["import Lithon.Core.Flags (BitPos (..), FlagsWire)", wireImport]
                    minted
                    bitsName
                    [emptyBitsSource bitsName wire]
          )
            <$> mintedType name
    Nothing -> failing RUnmintedName{what = "bitmask", name = forgetNamespace name}
   where
    mk needList minted bitsName emptyBits =
      Decl
        { site = at
        , needs = Set.fromList ("import Lithon.Core.Flags (Flags)" : needList)
        , exports = [minted] <> [bitsName | not (null emptyBits)]
        , source =
            T.intercalate "\n"
              $ emptyBits
              <> ["type " <> minted <> " = Flags " <> bitsName]
        }

  -- ── handles ───────────────────────────────────────────────────────────

  handleDecls (name, at) = case Map.lookup name registry.handles of
    Nothing -> pure []
    Just h
      | h.dispatchable -> mkDispatchable <$> mintedType name <*> dispatchTableFor name
      | otherwise -> mk h <$> mintedType name
   where
    mkDispatchable minted table =
      [ Decl
          { site = at
          , needs =
              Set.fromList
                [ "import Foreign.Ptr (Ptr)"
                , "import Lithon.Vk.Dispatch (" <> table <> ")"
                ]
          , exports = [minted <> "_T", minted <> " (..)"]
          , source = withDocs (DocType name) (dispatchableHandleSource minted table)
          }
      ]
    -- Which table a handle dispatches through. Validated against the five
    -- curated dispatchables; a novel one must be classified here.
    dispatchTableFor n = case forgetNamespace n of
      "VkInstance" -> pure "InstanceCmds"
      "VkPhysicalDevice" -> pure "InstanceCmds"
      "VkDevice" -> pure "DeviceCmds"
      "VkQueue" -> pure "DeviceCmds"
      "VkCommandBuffer" -> pure "DeviceCmds"
      other -> failing RUnmintedName{what = "dispatch table for handle", name = other}
    mk _h minted =
      [ Decl
          { site = at
          , needs =
              Set.fromList
                [ "import Data.Word (Word64)"
                , "import Foreign.Storable (Storable)"
                , "import Data.Primitive.Types (Prim)"
                , "import Data.Vector.Generic qualified as VG"
                , "import Data.Vector.Generic.Mutable qualified as VGM"
                , "import Data.Vector.Primitive qualified as P"
                , "import Data.Vector.Unboxed qualified as VU"
                , "import Lithon.Core.CStruct (Nil (..))"
                , "import Lithon.Core.Unbox (UnboxViaPrim (..))"
                ]
          , exports = [minted <> " (..)"]
          , source = withDocs (DocType name) (nonDispatchableHandleSource minted)
          }
      ]

  -- ── POD structs and unions ────────────────────────────────────────────

  podDecl (name, at) = case (Map.lookup name registry.structs, Map.lookup name layouts'.layouts) of
    (Just s, Just layout)
      | s.kind == SKUnion, Set.member name tiers.pods -> unionPodDecl name at layout
      | s.kind == SKUnion -> unionMarshalDecl name at layout
      | Set.member name tiers.pods -> recordPodDecl name at layout
    _ -> failing RUnmintedName{what = "struct layout", name = forgetNamespace name}

  recordPodDecl name at layout =
    mk2 <$> mintedType name <*> structCtor name <*> traverse fieldGen layout.fields
   where
    mk2 minted ctor = mk (minted, ctor)
    isPeekable = Set.member name tiers.peekable
    mk minted gens =
      Decl
        { site = at
        , needs =
            Set.delete ("import " <> Module.hsName at)
              $ Set.unions ((\(_, _, g) -> g.imports) <$> gens)
              <> Set.fromList
                [ "import Foreign.Storable (Storable (..))"
                , "import Control.Monad.IO.Class (liftIO)"
                , "import Lithon.Core.CStruct (CStruct (..), Nil (..))"
                ]
              <> Set.fromList
                ["import Lithon.Core.CStruct (FromCStruct (..))" | isPeekable]
        , exports = [fst minted <> " (..)"]
        , source = withDocs (DocType name) (recordSource minted layout gens isPeekable)
        }
    fieldGen f =
      (fieldNameOf f.name,f,) <$> fieldGenOf name f.offset f.ctype

  unionPodDecl name at layout =
    mk <$> mintedType name <*> traverse armGen layout.fields
   where
    mk minted gens =
      Decl
        { site = at
        , needs =
            Set.map dropPeekOnlyNames
              . Set.delete ("import " <> Module.hsName at)
              $ Set.unions ((\(_, _, g) -> g.imports) <$> gens)
              <> Set.fromList
                [ "import Foreign.Storable (Storable (..))"
                , "import Foreign.Marshal.Utils (fillBytes)"
                , "import Foreign.Ptr (castPtr)"
                , "import Control.Monad.IO.Class (liftIO)"
                , "import Data.Word (Word8)"
                , "import Data.Vector.Storable.Sized qualified as VSS"
                , "import Lithon.Core.CStruct (CStruct (..), FromCStruct (..), Nil (..))"
                ]
        , exports = [minted <> " (..)"]
        , source =
            withDocs (DocType name) (unionSource minted layout [(armCtor minted m, g) | (m, _, g) <- gens])
        }
    -- Union arms never run their peek expressions (peek is the raw arm),
    -- so peek-side helper names would be unused imports.
    dropPeekOnlyNames line
      | line == "import Lithon.Core.BaseTypes (toBool, pattern FALSE, pattern TRUE)" =
          "import Lithon.Core.BaseTypes (pattern FALSE, pattern TRUE)"
      | otherwise = line
    armGen f =
      (f.name,f,) <$> fieldGenOf name 0 f.ctype
    armCtor minted m = minted <> capitalizeText m

  -- Non-POD unions (marshalled or extensible arms): CStruct-only — no
  -- Storable instance (pointer arms can't sit in storable vectors), arms
  -- poke through the arena, peeks return the raw bytes.
  unionMarshalDecl name at layout =
    mk <$> mintedType name <*> traverse armGen layout.fields
   where
    armGen f = case f.ctype of
      CStructRef t
        | not (Set.member t tiers.pods) ->
            ( \minted ->
                let ext = isExtensibleStruct' t
                 in ( f.name
                    , if ext then "(" <> minted <> " '[])" else minted
                    , "nil"
                    , StructArm
                    , moduleImportOf (Map.lookup t moduleMap.structModules)
                    )
            )
              <$> mintedType t
      other ->
        (\g -> (f.name, g.hsType, g.nilE, ScalarArm (g.pokeE "v"), g.imports))
          <$> fieldGenOf name 0 other
    isExtensibleStruct' t = case Map.lookup t registry.structs of
      Just st -> not (null st.extendedBy)
      Nothing -> False
    mk minted gens =
      Decl
        { site = at
        , needs =
            Set.delete ("import " <> Module.hsName at)
              $ Set.unions [imp | (_, _, _, _, imp) <- gens]
              <> marshalBaseImports
              <> one "import Foreign.Marshal.Utils (fillBytes)"
              <> one "import Data.Vector.Storable.Sized qualified as VSS"
              <> one "import Data.Word (Word8)"
        , exports = [minted <> " (..)"]
        , source =
            withDocs
              (DocType name)
              (unionMarshalSource minted layout [(armC minted m, ty, nil', kind) | (m, ty, nil', kind, _) <- gens])
        }
    armC minted m = minted <> capitalizeText m

  -- One record\/union payload position: surface type + wire expressions.
  fieldGenOf owner off = \case
    CPrim p -> primGen p
    CBool32 ->
      Success
        FieldGen
          { hsType = "Bool"
          , peekE = "toBool <$> peekByteOff p " <> show off
          , pokeE = \v -> "pokeByteOff p " <> show off <> " (if " <> v <> " then TRUE else FALSE)"
          , nilE = "False"
          , imports =
              one "import Lithon.Core.BaseTypes (toBool, pattern FALSE, pattern TRUE)"
          }
    CEnum e -> enumGen e
    CFlags f _ ->
      ( \minted ->
          FieldGen
            { hsType = minted
            , peekE = direct
            , pokeE = directPoke
            , nilE = "mempty"
            , imports = moduleImportOf (Map.lookup f moduleMap.bitmaskModules)
            }
      )
        <$> mintedType f
    CFlagsBits b _ ->
      ( \minted ->
          FieldGen
            { hsType = "Flags " <> minted
            , peekE = direct
            , pokeE = directPoke
            , nilE = "mempty"
            , imports =
                moduleImportOf (Map.lookup b moduleMap.enumModules)
                  <> one "import Lithon.Core.Flags (Flags)"
            }
      )
        <$> mintedType b
    CHandleND h ->
      ( \minted ->
          FieldGen
            { hsType = minted
            , peekE = direct
            , pokeE = directPoke
            , nilE = "nil"
            , imports = moduleImportOf (Map.lookup h moduleMap.handleModules)
            }
      )
        <$> mintedType h
    -- dispatchable-handle members are raw pointers: a rich handle cannot
    -- be conjured at peek time (no cmds table to attach), so struct fields
    -- hold @Ptr X_T@ and users write @h.handle@ when building
    CHandleD h ->
      ( \minted ->
          FieldGen
            { hsType = "Ptr " <> minted <> "_T"
            , peekE = direct
            , pokeE = directPoke
            , nilE = "nullPtr"
            , imports =
                moduleImportOf (Map.lookup h moduleMap.handleModules)
                  <> Set.fromList ["import Foreign.Ptr (Ptr, nullPtr)"]
            }
      )
        <$> mintedType h
    CStructRef t ->
      ( \minted ->
          FieldGen
            { hsType = minted
            , peekE = direct
            , pokeE = directPoke
            , nilE = "nil"
            , imports = moduleImportOf (Map.lookup t moduleMap.structModules)
            }
      )
        <$> mintedType t
    CArray n (CPrim PChar) ->
      Success
        FieldGen
          { hsType = "ByteString"
          , peekE = "peekFixedString " <> show n <> " p " <> show off
          , pokeE = \v -> "pokeFixedString " <> show n <> " p " <> show off <> " " <> v
          , nilE = "\"\""
          , imports =
              Set.fromList
                [ "import Data.ByteString (ByteString)"
                , "import Lithon.Core.CStruct (peekFixedString, pokeFixedString)"
                ]
          }
    CArray n (CPrim PU8) ->
      Success
        FieldGen
          { hsType = "ByteString"
          , peekE = "peekFixedBytes " <> show n <> " p " <> show off
          , pokeE = \v -> "pokeFixedBytes " <> show n <> " p " <> show off <> " " <> v
          , nilE = "\"\""
          , imports =
              Set.fromList
                [ "import Data.ByteString (ByteString)"
                , "import Lithon.Core.CStruct (peekFixedBytes, pokeFixedBytes)"
                ]
          }
    CArray n e
      | arrayElemOk e ->
          ( \eg ->
              FieldGen
                { hsType = "VSS.Vector " <> show n <> " " <> parenType eg.hsType
                , peekE = direct
                , pokeE = directPoke
                , nilE = "VSS.replicate " <> parenExpr eg.nilE
                , imports =
                    eg.imports <> one "import Data.Vector.Storable.Sized qualified as VSS"
                }
          )
            <$> fieldGenOf owner 0 e
      | otherwise ->
          failing
            RUnsupportedField
              { struct = forgetNamespace owner
              , reason = "fixed array over a non-directly-Storable element"
              }
    CPlatform n ->
      Success
        FieldGen
          { hsType = n
          , peekE = direct
          , pokeE = directPoke
          , nilE = n <> " nullPtr"
          , imports =
              Set.fromList
                [ "import Lithon.Core.Platform (" <> n <> " (..))"
                , "import Foreign.Ptr (nullPtr)"
                ]
          }
    CPtr ->
      Success
        FieldGen
          { hsType = "Ptr ()"
          , peekE = direct
          , pokeE = directPoke
          , nilE = "nullPtr"
          , imports = one "import Foreign.Ptr (Ptr, nullPtr)"
          }
    -- typed with the PFN_ alias so callbacks built by the generated
    -- wrapper makers slot in directly
    CFuncPtr pfn ->
      ( \minted ->
          FieldGen
            { hsType = minted
            , peekE = direct
            , pokeE = directPoke
            , nilE = "nullFunPtr"
            , imports =
                moduleImportOf (Map.lookup pfn moduleMap.funcpointerModules)
                  <> one "import Foreign.Ptr (nullFunPtr)"
            }
      )
        <$> mintedType pfn
    other ->
      failing
        RUnsupportedField
          { struct = forgetNamespace owner
          , reason = "unexpected wire type in a POD: " <> show other
          }
   where
    direct = "peekByteOff p " <> show off
    directPoke v = "pokeByteOff p " <> show off <> " " <> v
    arrayElemOk = \case
      CPrim PPtrSized -> False
      CPrim _ -> True
      CStructRef _ -> True
      CFlags _ _ -> True
      CFlagsBits _ _ -> True
      CHandleND _ -> True
      CHandleD _ -> True
      CPlatform _ -> True
      _ -> False
    primGen p =
      ( \(t, imp) ->
          FieldGen
            { hsType = t
            , peekE = direct
            , pokeE = directPoke
            , nilE = "0"
            , imports = imp
            }
      )
        <$> primSurface p
    primSurface = \case
      PU8 -> Success ("Word8", one "import Data.Word (Word8)")
      PU16 -> Success ("Word16", one "import Data.Word (Word16)")
      PU32 -> Success ("Word32", one "import Data.Word (Word32)")
      PU64 -> Success ("Word64", one "import Data.Word (Word64)")
      PI8 -> Success ("Int8", one "import Data.Int (Int8)")
      PI16 -> Success ("Int16", one "import Data.Int (Int16)")
      PI32 -> Success ("Int32", one "import Data.Int (Int32)")
      PI64 -> Success ("Int64", one "import Data.Int (Int64)")
      PFloat -> Success ("Float", Set.empty)
      PDouble -> Success ("Double", Set.empty)
      PSizeT -> Success ("CSize", one "import Foreign.C.Types (CSize)")
      PChar -> Success ("CChar", one "import Foreign.C.Types (CChar)")
      PPtrSized ->
        failing
          RUnsupportedField
            { struct = forgetNamespace owner
            , reason = "platform value handle inside a POD"
            }
    enumGen e = mkEnum <$> mintedType e <*> zeroCtorOf e
     where
      open = case Map.lookup e registry.enums of
        Just block -> block.flow == FlowOut || block.flow == FlowBoth
        Nothing -> True
      modImport = moduleImportOf (Map.lookup e moduleMap.enumModules)
      mkEnum minted zc =
        if open then
          FieldGen
            { hsType = "Open " <> minted
            , peekE = "openFromWire <$> peekByteOff p " <> show off
            , pokeE = \v -> "pokeByteOff p " <> show off <> " (openToWire " <> v <> ")"
            , nilE = "Known " <> zc
            , imports =
                modImport
                  <> one "import Lithon.Core.Open (Open (..), openFromWire, openToWire)"
            }
        else
          FieldGen
            { hsType = minted
            , peekE = "unsafeFromWire <$> peekByteOff p " <> show off
            , pokeE = \v -> "pokeByteOff p " <> show off <> " (toWire " <> v <> ")"
            , nilE = zc
            , imports =
                modImport
                  <> one "import Lithon.Core.Open (HasWire (..), unsafeFromWire)"
            }

  -- The constructor a zero-initialized enum field takes: the block's
  -- 0-valued item when one exists, else its minimum value (rare; noted in
  -- the emitted Nil haddock at M6).
  zeroCtorOf e = case Map.lookup e registry.enums of
    Nothing -> failing RUnmintedName{what = "enum block", name = forgetNamespace e}
    Just block ->
      case sortOn (\i -> (wireOf i.value /= 0, wireOf i.value)) (V.toList block.items) of
        [] -> failing RUnmintedName{what = "zero item of enum", name = forgetNamespace e}
        (item : _) -> mintedCtor item.name
   where
    wireOf = \case
      NumSigned v -> toInteger v
      NumBits w -> toInteger w

  moduleImportOf = \case
    Just m -> one ("import " <> Module.hsName m)
    Nothing -> Set.empty

  -- ── marshalled structs ────────────────────────────────────────────────

  marshalDecl (name, at, plan) = case plan of
    MarshalPlan{fields, extensible, extends} ->
      mk <$> mintedType name <*> structCtor name <*> traverse (marshalFieldGen name) fields
     where
      isPeekable = Set.member name tiers.peekable
      mk minted ctor gens =
        Decl
          { site = at
          , needs =
              Set.delete ("import " <> Module.hsName at)
                $ Set.unions [g.imports | Just g <- gens]
                <> marshalBaseImports
          , exports = [minted <> " (..)"]
          , source =
              withDocs (DocType name)
                $ marshalStructSource
                  MarshalSrc
                    { minted
                    , ctor
                    , extensible
                    , sTypeW = plan.sTypeWire
                    , chainOff = plan.chainOffset
                    , size = layoutSizeOf name
                    , align = layoutAlignOf name
                    , peekable = isPeekable
                    , parents = extends
                    , gens = catMaybes gens
                    }
          }
    _ -> failing RUnmintedName{what = "marshal plan", name = forgetNamespace name}

  layoutSizeOf name = maybe 0 (.size) (Map.lookup name layouts'.layouts)
  layoutAlignOf name = maybe 1 (.align) (Map.lookup name layouts'.layouts)

  -- One planned member -> generated snippets. Nothing = no record field and
  -- no code beyond what a sibling emits.
  marshalFieldGen owner fp = case fp of
    FScalar{field, offset, ctype = CStructRef t}
      | not (Set.member t tiers.pods) ->
          ( \minted ->
              let f = fieldNameOf field
                  ext = isExtensibleStruct t
                  ty = if ext then "(" <> minted <> " '[])" else minted
               in Just
                    MGen
                      { fieldMay = Just (f, ty, "nil")
                      , pokeLines =
                          [ "pokeCStruct (castPtr (p `plusPtr` "
                              <> show offset
                              <> ")) x."
                              <> f
                          ]
                      , peekLines =
                          [ "v_"
                              <> f
                              <> " <- peekCStruct (castPtr (p `plusPtr` "
                              <> show offset
                              <> "))"
                          ]
                      , imports = moduleImportOf (Map.lookup t moduleMap.structModules)
                      }
          )
            <$> mintedType t
    FScalar{field, offset, ctype = CArray n e}
      | fixedNeedsLoop e ->
          ( \eg ->
              let f = fieldNameOf field
                  (esz, _) = ctypeSA e
               in Just
                    MGen
                      { fieldMay =
                          Just
                            ( f
                            , "V.Vector " <> parenType eg.hsType
                            , "V.replicate " <> show n <> " " <> parenExpr eg.nilE
                            )
                      , pokeLines =
                          [ "unless (V.length x."
                              <> f
                              <> " == "
                              <> show n
                              <> ") (error \"lithon: "
                              <> f
                              <> " must have exactly "
                              <> show n
                              <> " elements\")"
                          , "liftIO (V.imapM_ (\\i v -> " <> rebasedPoke eg esz offset <> ") x." <> f <> ")"
                          ]
                      , peekLines =
                          [ "v_"
                              <> f
                              <> " <- V.generateM "
                              <> show n
                              <> " (\\i -> "
                              <> rebasedPeek eg esz offset
                              <> ")"
                          ]
                      , imports = eg.imports
                      }
          )
            <$> fieldGenOf owner 0 e
    FScalar{field, offset, ctype} ->
      ( \g ->
          Just
            MGen
              { fieldMay = Just (fieldNameOf field, g.hsType, g.nilE)
              , pokeLines = ["liftIO (" <> g.pokeE ("x." <> fieldNameOf field) <> ")"]
              , peekLines = bindLine field ("(" <> g.peekE <> ")")
              , imports = g.imports
              }
      )
        <$> fieldGenOf owner offset ctype
    FSType{offset, wire} ->
      Success
        . Just
        $ MGen
          { fieldMay = Nothing
          , pokeLines =
              ["liftIO (pokeByteOff p " <> show offset <> " (" <> show wire <> " :: Int32))"]
          , peekLines = []
          , imports = one "import Data.Int (Int32)"
          }
    FPNextNull{offset} ->
      Success
        . Just
        $ MGen
          { fieldMay = Nothing
          , pokeLines =
              ["liftIO (pokeByteOff p " <> show offset <> " (nullPtr :: Ptr ()))"]
          , peekLines = []
          , imports = one "import Foreign.Ptr (Ptr, nullPtr)"
          }
    FChainNext{offset} ->
      Success
        . Just
        $ MGen
          { fieldMay = Just ("next", "Chain es", "nilChain")
          , pokeLines =
              ["pokeChain (castPtr (p `plusPtr` " <> show offset <> ")) x.next"]
          , peekLines =
              bindLine "next" ("peekChain =<< peekByteOff p " <> show offset)
          , imports = Set.empty
          }
    FVector{field, offset, elemTy, elemSome, count, isOptional = _} ->
      ( \minted ->
          let f = fieldNameOf field
              esz = layoutSizeOf elemTy
              eal = layoutAlignOf elemTy
           in Just
                if elemSome then
                  MGen
                    { fieldMay = Just (f, "V.Vector (SomeStruct " <> minted <> ")", "V.empty")
                    , pokeLines =
                        [ "p_" <> f <> " <- arenaBytes (" <> show esz <> " * max 1 (V.length x." <> f <> ")) " <> show eal
                        , "V.imapM_ (\\i e -> withSomeStruct e (pokeCStruct (castPtr (p_"
                            <> f
                            <> " `plusPtr` (i * "
                            <> show esz
                            <> "))))) x."
                            <> f
                        , "liftIO (pokeByteOff p "
                            <> show offset
                            <> " (if V.null x."
                            <> f
                            <> " then nullPtr else (castPtr p_"
                            <> f
                            <> " :: Ptr ())))"
                        ]
                          <> countPoke count f "V.length"
                    , peekLines = [] -- Some-elem structs are never peekable
                    , imports = entityImport elemTy
                    }
                else
                  MGen
                    { fieldMay = Just (f, "V.Vector " <> minted, "V.empty")
                    , pokeLines =
                        [ "p_" <> f <> " <- if V.null x." <> f <> " then pure nullPtr else newVector x." <> f
                        , "liftIO (pokeByteOff p " <> show offset <> " p_" <> f <> ")"
                        ]
                          <> countPoke count f "V.length"
                    , peekLines =
                        bindLine
                          field
                          ( "do { n <- "
                              <> countPeek count
                              <> "; q <- peekByteOff p "
                              <> show offset
                              <> "; if q == nullPtr then pure V.empty else peekElems "
                              <> countToElems count
                              <> " q }"
                          )
                    , imports = entityImport elemTy
                    }
      )
        <$> mintedType elemTy
    FVectorScalar{field, offset, elemC, count} ->
      ( \eg ->
          let f = fieldNameOf field
              (esz, _) = ctypeSizeAlign elemC
           in Just
                MGen
                  { fieldMay = Just (f, "V.Vector " <> parenType eg.hsType, "V.empty")
                  , pokeLines =
                      [ "p_"
                          <> f
                          <> " <- arenaBytes ("
                          <> show esz
                          <> " * max 1 (V.length x."
                          <> f
                          <> ")) "
                          <> show (snd (ctypeSizeAlign elemC))
                      , "liftIO (V.imapM_ (\\i v -> " <> elemPoke eg esz f <> ") x." <> f <> ")"
                      , "liftIO (pokeByteOff p "
                          <> show offset
                          <> " (if V.null x."
                          <> f
                          <> " then nullPtr else (castPtr p_"
                          <> f
                          <> " :: Ptr ())))"
                      ]
                        <> countPoke count f "V.length"
                  , peekLines =
                      bindLine
                        field
                        ( "do { n <- "
                            <> countPeek count
                            <> "; q <- peekByteOff p "
                            <> show offset
                            <> " :: IO (Ptr ()); if q == nullPtr then pure V.empty else V.generateM "
                            <> countToElems count
                            <> " (\\i -> "
                            <> elemPeek eg esz
                            <> ") }"
                        )
                  , imports = eg.imports
                  }
      )
        <$> fieldGenOf owner 0 elemC
    FStructPtr{field, offset, target, targetSome, isOptional} ->
      ( \minted ->
          let f = fieldNameOf field
              (ty, nil', pokeGet)
                | targetSome && isOptional =
                    ( "Maybe (SomeStruct " <> minted <> ")"
                    , "Nothing"
                    , "maybe (pure nullPtr) (\\s -> withSomeStruct s (fmap castPtr . new)) x." <> f
                    )
                | targetSome =
                    ( "SomeStruct " <> minted
                    , "SomeStruct (nil @(" <> minted <> " '[]))"
                    , "withSomeStruct x." <> f <> " (fmap castPtr . new)"
                    )
                | isOptional =
                    ("Maybe " <> minted, "Nothing", "maybe (pure nullPtr) new x." <> f)
                | otherwise = (minted, "nil", "new x." <> f)
           in Just
                MGen
                  { fieldMay = Just (f, ty, nil')
                  , pokeLines =
                      [ "p_" <> f <> " <- " <> pokeGet
                      , "liftIO (pokeByteOff p " <> show offset <> " p_" <> f <> ")"
                      ]
                  , peekLines =
                      if targetSome then
                        []
                      else
                        bindLine
                          field
                          ( if isOptional then
                              "do { q <- peekByteOff p "
                                <> show offset
                                <> "; if q == nullPtr then pure Nothing else Just <$> peekCStruct q }"
                            else
                              "peekCStruct =<< peekByteOff p " <> show offset
                          )
                  , imports = entityImport target
                  }
      )
        <$> mintedType target
    FString{field, offset, isOptional} ->
      Success
        . Just
        $ let f = fieldNameOf field
           in MGen
                { fieldMay =
                    Just
                      ( f
                      , if isOptional then "Maybe ByteString" else "ByteString"
                      , if isOptional then "Nothing" else "\"\""
                      )
                , pokeLines =
                    [ "p_"
                        <> f
                        <> " <- "
                        <> if isOptional then
                          "maybe (pure nullPtr) newCString x." <> f
                        else
                          "newCString x." <> f
                    , "liftIO (pokeByteOff p " <> show offset <> " p_" <> f <> ")"
                    ]
                , peekLines =
                    bindLine
                      field
                      ( if isOptional then
                          "do { q <- peekByteOff p "
                            <> show offset
                            <> "; if q == nullPtr then pure Nothing else Just <$> BS.packCString q }"
                        else
                          "BS.packCString =<< peekByteOff p " <> show offset
                      )
                , imports = Set.empty
                }
    FStringVector{field, offset, count} ->
      Success
        . Just
        $ let f = fieldNameOf field
           in MGen
                { fieldMay = Just (f, "V.Vector ByteString", "V.empty")
                , pokeLines =
                    [ "p_" <> f <> " <- newCStrings x." <> f
                    , "liftIO (pokeByteOff p "
                        <> show offset
                        <> " (if V.null x."
                        <> f
                        <> " then nullPtr else p_"
                        <> f
                        <> "))"
                    ]
                      <> countPoke count f "V.length"
                , peekLines =
                    bindLine
                      field
                      ( "do { n <- "
                          <> countPeek count
                          <> "; q <- peekByteOff p "
                          <> show offset
                          <> "; V.generateM "
                          <> countToElems count
                          <> " (\\i -> BS.packCString =<< peekElemOff q i) }"
                      )
                , imports = Set.empty
                }
    FBytes{field, offset, count} ->
      Success
        . Just
        $ let f = fieldNameOf field
           in MGen
                { fieldMay = Just (f, "ByteString", "\"\"")
                , pokeLines =
                    [ "p_" <> f <> " <- newBytes x." <> f
                    , "liftIO (pokeByteOff p "
                        <> show offset
                        <> " (if BS.null x."
                        <> f
                        <> " then nullPtr else (castPtr p_"
                        <> f
                        <> " :: Ptr ())))"
                    ]
                      <> countPoke count f "BS.length"
                , peekLines =
                    bindLine
                      field
                      ( "do { n <- "
                          <> countPeek count
                          <> "; q <- peekByteOff p "
                          <> show offset
                          <> "; if q == nullPtr then pure BS.empty else BS.packCStringLen (q, fromIntegral n) }"
                      )
                , imports = Set.empty
                }
    FBytesConst{field, offset, len} ->
      Success
        . Just
        $ let f = fieldNameOf field
           in MGen
                { fieldMay = Just (f, "ByteString", "\"\"")
                , pokeLines =
                    [ "unless (BS.length x."
                        <> f
                        <> " == "
                        <> show len
                        <> ") (error \"lithon: "
                        <> f
                        <> " must be exactly "
                        <> show len
                        <> " bytes\")"
                    , "p_" <> f <> " <- newBytes x." <> f
                    , "liftIO (pokeByteOff p " <> show offset <> " (castPtr p_" <> f <> " :: Ptr ()))"
                    ]
                , peekLines =
                    bindLine
                      field
                      ( "do { q <- peekByteOff p "
                          <> show offset
                          <> "; BS.packCStringLen (q, "
                          <> show len
                          <> ") }"
                      )
                , imports = Set.empty
                }
    FRawPtr{field, offset} ->
      Success
        . Just
        $ let f = fieldNameOf field
           in MGen
                { fieldMay = Just (f, "Ptr ()", "nullPtr")
                , pokeLines = ["liftIO (pokeByteOff p " <> show offset <> " x." <> f <> ")"]
                , peekLines = bindLine field ("peekByteOff p " <> show offset)
                , imports = Set.empty
                }
    FFunPtr{field, offset, pfn} ->
      ( \minted ->
          let f = fieldNameOf field
           in Just
                MGen
                  { fieldMay = Just (f, minted, "nullFunPtr")
                  , pokeLines = ["liftIO (pokeByteOff p " <> show offset <> " x." <> f <> ")"]
                  , peekLines = bindLine field ("peekByteOff p " <> show offset)
                  , imports = entityImportFp pfn
                  }
      )
        <$> mintedType pfn
   where
    bindLine field expr = ["v_" <> fieldNameOf field <> " <- " <> expr]
    entityImport t = moduleImportOf (Map.lookup t moduleMap.structModules)
    entityImportFp t = moduleImportOf (Map.lookup t moduleMap.funcpointerModules)
    countPoke count f lenFn = case count of
      CountIndependent -> []
      CountSibling{offset = co, wide, scale, drives, driver}
        | drives ->
            [ "liftIO (pokeByteOff p "
                <> show co
                <> " (fromIntegral ("
                <> (if scale /= 1 then show scale <> " * " else "")
                <> lenFn
                <> " x."
                <> f
                <> ") :: "
                <> (if wide then "Word64" else "Word32")
                <> "))"
            ]
        | otherwise ->
            [ "unless ("
                <> lenFn
                <> " x."
                <> f
                <> " == V.length x."
                <> fieldNameOf driver
                <> ") (error \"lithon: "
                <> f
                <> " length must match "
                <> fieldNameOf driver
                <> "\")"
            ]
    countPeek count = case count of
      CountSibling{offset = co, wide} ->
        "(peekByteOff p "
          <> show co
          <> " :: IO "
          <> (if wide then "Word64" else "Word32")
          <> ")"
      CountIndependent -> "pure (0 :: Word32)" -- never peeked in practice
    countToElems count = case count of
      CountSibling{scale}
        | scale /= 1 -> "(fromIntegral n `div` " <> show scale <> ")"
      _ -> "(fromIntegral n)"
    ctypeSizeAlign = \case
      CPrim pr -> primSizeAlign pr
      CBool32 -> (4, 4)
      CEnum _ -> (4, 4)
      CFlags _ w -> case w of W32 -> (4, 4); W64 -> (8, 8)
      CFlagsBits _ w -> case w of W32 -> (4, 4); W64 -> (8, 8)
      CHandleND _ -> (8, 8)
      _ -> (8, 8)
    elemPoke eg esz f =
      -- rebase the generated poke expression from (p, 0) to (p_f, i*size)
      T.replace "pokeByteOff p 0" ("pokeByteOff p_" <> f <> " (i * " <> show esz <> ")") (eg.pokeE "v")
    elemPeek eg esz =
      T.replace "peekByteOff p 0" ("peekByteOff q (i * " <> show esz <> ")") eg.peekE
    -- fixed arrays at a struct offset (no pointer indirection)
    rebasedPoke eg esz off =
      T.replace
        "pokeByteOff p 0"
        ("pokeByteOff p (" <> show off <> " + i * " <> show esz <> ")")
        (eg.pokeE "v")
    rebasedPeek eg esz off =
      T.replace
        "peekByteOff p 0"
        ("peekByteOff p (" <> show off <> " + i * " <> show esz <> ")")
        eg.peekE
    fixedNeedsLoop = \case
      CEnum _ -> True
      CBool32 -> True
      _ -> False
    isExtensibleStruct t = case Map.lookup t registry.structs of
      Just st -> not (null st.extendedBy)
      Nothing -> False
    ctypeSA = \case
      CPrim pr -> primSizeAlign pr
      CBool32 -> (4, 4)
      CEnum _ -> (4, 4)
      _ -> (8, 8)

  -- ── funcpointer synonyms ─────────────────────────────────────────────

  fpDecl (name, at) = case Map.lookup name registry.funcpointers of
    Nothing -> failing RUnmintedName{what = "funcpointer", name = forgetNamespace name}
    Just f ->
      ( \minted ->
          let fnName = "FN_" <> T.drop 4 minted -- PFN_x -> FN_x
              mkName = "mk" <> minted
              sig = T.intercalate " -> " (fmap ffiParam (V.toList f.params) <> [ffiRet f])
              -- PFN_vkVoidFunction is an opaque token (the proc-addr
              -- result), never something user code implements
              makeable = forgetNamespace name /= "PFN_vkVoidFunction"
           in Decl
                { site = at
                , needs =
                    Set.fromList
                      [ "import Foreign.Ptr (FunPtr, Ptr)"
                      , "import Data.Int (Int32, Int64)"
                      , "import Data.Word (Word32, Word64)"
                      , "import Foreign.C.Types (CSize)"
                      , "import Lithon.Core.BaseTypes (Bool32)"
                      ]
                , exports = [fnName, minted] <> [mkName | makeable]
                , source =
                    withDocs (DocType name)
                      $ T.intercalate
                        "\n"
                        ( [ "-- | The plain function shape behind '" <> minted <> "'."
                          , "type " <> fnName <> " = " <> sig
                          , ""
                          , "type " <> minted <> " = FunPtr " <> fnName
                          ]
                            <> ( if makeable then
                                   [ ""
                                   , "-- | Wrap a Haskell function as a callable '" <> minted <> "'."
                                   , "-- Release with 'Foreign.Ptr.freeHaskellFunPtr' (or bracket via"
                                   , "-- 'Lithon.Core.Funptr.withCallback')."
                                   , "foreign import ccall \"wrapper\" " <> mkName <> " :: " <> fnName <> " -> IO " <> minted
                                   ]
                                 else
                                   []
                               )
                        )
                }
      )
        <$> mintedType name
   where
    ffiParam prm
      | not (null prm.pointers) = "Ptr ()"
      | otherwise = ffiScalar prm.typeRef
    ffiRet f
      | not (null f.returnPointers) = "IO (Ptr ())"
      | forgetNamespace f.returnType.name == "void" = "IO ()"
      | otherwise = "IO " <> parenType (ffiScalar f.returnType)
    ffiScalar ref = case forgetNamespace ref.name of
      "VkBool32" -> "Bool32"
      "uint32_t" -> "Word32"
      "uint64_t" -> "Word64"
      "int32_t" -> "Int32"
      "int64_t" -> "Int64"
      "size_t" -> "CSize"
      "VkDeviceSize" -> "Word64"
      "VkDeviceAddress" -> "Word64"
      _ -> "Word32" -- enums/flags at FFI level
  mintedType n = case Map.lookup n names.typeNames of
    Just t -> Success t
    Nothing -> failing RUnmintedName{what = "type", name = forgetNamespace n}
  structCtor n = case Map.lookup n names.structCtorNames of
    Just t -> Success t
    Nothing -> failing RUnmintedName{what = "struct constructor", name = forgetNamespace n}
  mintedCtor n = case Map.lookup n names.ctorNames of
    Just t -> Success t
    Nothing -> failing RUnmintedName{what = "enum value", name = forgetNamespace n}

  failing :: RenderError -> Validation (Errors RenderError) a
  failing = Failure . errors1

-- Empty ADTs (reserved masks, empty blocks) are exported bare — a (..)
-- suffix on a constructor-less type trips -Wdodgy-exports downstream.
ctorsExport :: Text -> [a] -> Text
ctorsExport minted = \case
  [] -> minted
  _ -> minted <> " (..)"

-- Emission order within a block: by wire value, then name — stable across
-- registry reshuffles.
sortedItems :: ResolvedEnumBlock -> [ResolvedEnumItem]
sortedItems block =
  sortOn (\i -> (numKey i.value, forgetNamespace i.name)) (V.toList block.items)
 where
  numKey = \case
    NumSigned v -> toInteger v
    NumBits w -> toInteger w

-- | One declaration group destined for a module.
data Decl = Decl
  { site :: Module.Meta
  , needs :: Set Text
  -- ^ Literal import lines (deduped and sorted per module; two lines may
  -- import from the same module — legal and warning-free).
  , exports :: [Text]
  , source :: Text
  }

-- | One payload position's surface type and wire expressions. @pokeE@
-- takes the accessor text (@x.width@) so call sites read naturally.
data FieldGen = FieldGen
  { hsType :: Text
  , peekE :: Text
  , pokeE :: Text -> Text
  , nilE :: Text
  , imports :: Set Text
  }

reservedWords :: Set Text
reservedWords =
  Set.fromList
    [ "case"
    , "class"
    , "data"
    , "default"
    , "deriving"
    , "do"
    , "else"
    , "family"
    , "if"
    , "import"
    , "in"
    , "infix"
    , "infixl"
    , "infixr"
    , "instance"
    , "let"
    , "module"
    , "newtype"
    , "of"
    , "then"
    , "type"
    , "where"
    ]

fieldNameOf :: Text -> Text
fieldNameOf n
  | Set.member n reservedWords = n <> "'"
  | otherwise = n

capitalizeText :: Text -> Text
capitalizeText t = case T.uncons t of
  Just (c, cs) -> T.cons (Char.toUpper c) cs
  Nothing -> t

parenType :: Text -> Text
parenType t = if T.any (== ' ') t then "(" <> t <> ")" else t

parenExpr :: Text -> Text
parenExpr t = if T.any (== ' ') t then "(" <> t <> ")" else t

recordSource :: (Text, Text) -> StructLayout -> [(Text, FieldLayout, FieldGen)] -> Bool -> Text
recordSource (minted, ctor) layout gens isPeekable =
  T.unlines
    $ dataD
    <> [""]
    <> storableD
    <> [""]
    <> cstructD
    <> fromD
    <> [""]
    <> nilD
 where
  derivingLine = "  deriving stock (Eq, Show)"
  dataD = case gens of
    [] -> ["data " <> minted <> " = " <> ctor, derivingLine]
    ((f0, fl0, g0) : rest) ->
      ["data " <> minted <> " = " <> ctor]
        <> (("  { " <> f0 <> " :: !" <> parenType g0.hsType) : carrierNote fl0)
        <> concat
          [ ("  , " <> f <> " :: !" <> parenType g.hsType) : carrierNote fl
          | (f, fl, g) <- rest
          ]
        <> ["  }", derivingLine]
  carrierNote fl = case Map.lookup fl.name layout.carriers of
    Nothing -> []
    Just bits ->
      [ "  -- ^ Packed bitfields: "
          <> T.intercalate
            ", "
            [ b.member <> " (" <> show b.width <> " bits at " <> show b.shift <> ")"
            | b <- bits
            ]
      ]
  storableD =
    [ "instance Storable " <> minted <> " where"
    , "  sizeOf _ = " <> show layout.size
    , "  alignment _ = " <> show layout.align
    ]
      <> peekD
      <> pokeD
  peekD = case gens of
    [] -> ["  peek _ = pure " <> ctor]
    _ ->
      "  peek p ="
        : ("    " <> ctor)
        : [ "      " <> op <> " " <> parenExpr g.peekE
          | (op, (_, _, g)) <- zip ("<$>" : repeat "<*>") gens
          ]
  pokeD = case gens of
    [] -> ["  poke _ _ = pure ()"]
    _ ->
      ["  poke p x = do"]
        <> ["    " <> g.pokeE ("x." <> f) | (f, _, g) <- gens]
  cstructD =
    [ "instance CStruct " <> minted <> " where"
    , "  cSize = " <> show layout.size
    , "  cAlign = " <> show layout.align
    , "  pokeCStruct p x = liftIO (poke p x)"
    ]
  fromD =
    if isPeekable then
      [ ""
      , "instance FromCStruct " <> minted <> " where"
      , "  peekCStruct = peek"
      ]
    else
      []
  nilD =
    ["instance Nil " <> minted <> " where"] <> case gens of
      [] -> ["  nil = " <> ctor]
      ((f0, _, g0) : rest) ->
        [ "  nil ="
        , "    " <> ctor
        , "      { " <> f0 <> " = " <> g0.nilE
        ]
          <> ["      , " <> f <> " = " <> g.nilE | (f, _, g) <- rest]
          <> ["      }"]

unionSource :: Text -> StructLayout -> [(Text, FieldGen)] -> Text
unionSource minted layout arms =
  T.unlines
    $ dataD
    <> [""]
    <> storableD
    <> [""]
    <> cstructD
    <> [""]
    <> fromD
    <> [""]
    <> nilD
 where
  rawCtor = minted <> "Raw"
  rawType = "VSS.Vector " <> show layout.size <> " Word8"
  dataD =
    ["data " <> minted]
      <> case arms of
        [] -> ["  = " <> rawCtor <> " !(" <> rawType <> ")"]
        ((c0, g0) : rest) ->
          ["  = " <> c0 <> " !" <> parenType g0.hsType]
            <> ["  | " <> c <> " !" <> parenType g.hsType | (c, g) <- rest]
            <> [ "  | -- | What 'Foreign.Storable.peek' returns: the union's bytes"
               , "    -- verbatim (the wire carries no discriminant). Re-poking them"
               , "    -- reproduces the value exactly; reinterpret via the typed arms'"
               , "    -- layout when the active arm is known."
               , "    " <> rawCtor <> " !(" <> rawType <> ")"
               ]
      <> ["  deriving stock (Eq, Show)"]
  storableD =
    [ "instance Storable " <> minted <> " where"
    , "  sizeOf _ = " <> show layout.size
    , "  alignment _ = " <> show layout.align
    , "  peek p = " <> rawCtor <> " <$> peekByteOff p 0"
    , "  poke p x = do"
    , "    fillBytes (castPtr p) 0 " <> show layout.size
    , "    case x of"
    ]
      <> ["      " <> c <> " v -> " <> g.pokeE "v" | (c, g) <- arms]
      <> ["      " <> rawCtor <> " v -> pokeByteOff p 0 v"]
  cstructD =
    [ "instance CStruct " <> minted <> " where"
    , "  cSize = " <> show layout.size
    , "  cAlign = " <> show layout.align
    , "  pokeCStruct p x = liftIO (poke p x)"
    ]
  fromD =
    [ "instance FromCStruct " <> minted <> " where"
    , "  peekCStruct = peek"
    ]
  nilD = case arms of
    [] ->
      [ "instance Nil " <> minted <> " where"
      , "  nil = " <> rawCtor <> " (VSS.replicate 0)"
      ]
    ((c0, g0) : _) ->
      [ "instance Nil " <> minted <> " where"
      , "  nil = " <> c0 <> " " <> parenExpr g0.nilE
      ]

-- | One marshalled member's generated snippets. @pokeLines@ run in the
-- Alloc do-block; @peekLines@ bind @v_\<field\>@ in the IO do-block.
data MGen = MGen
  { fieldMay :: !(Maybe (Text, Text, Text))
  -- ^ (record field, type, nil expression) when the member surfaces.
  , pokeLines :: ![Text]
  , peekLines :: ![Text]
  , imports :: !(Set Text)
  }

-- Coarse but sufficient: generated-code style warnings are accepted policy,
-- so marshalled modules import their standard vocabulary wholesale.
marshalBaseImports :: Set Text
marshalBaseImports =
  Set.fromList
    [ "import Control.Monad (unless)"
    , "import Control.Monad.IO.Class (liftIO)"
    , "import Data.ByteString (ByteString)"
    , "import Data.ByteString qualified as BS"
    , "import Data.Int (Int32, Int64)"
    , "import Data.Kind (Type)"
    , "import Data.Vector qualified as V"
    , "import Data.Word (Word32, Word64)"
    , "import Foreign.C.Types (CSize)"
    , "import Foreign.Ptr (FunPtr, Ptr, castPtr, nullFunPtr, nullPtr, plusPtr)"
    , "import Foreign.Storable (peekByteOff, peekElemOff, pokeByteOff)"
    , "import Lithon.Core.Alloc (arenaBytes, newBytes, newCString, newCStrings)"
    , "import Lithon.Core.BaseTypes (Bool32, toBool, pattern FALSE, pattern TRUE)"
    , "import Lithon.Core.CStruct (CStruct (..), Chainable (..), FromCStruct (..), Nil (..), new, newVector, peekElems)"
    , "import Lithon.Core.Chain (AllExtends, Chain, Extends, NilChain (..), PeekChain (..), PokeChain (..), SomeStruct (..), withSomeStruct, pattern (:&))"
    , "import Lithon.Core.Flags (Flags)"
    , "import Lithon.Core.Open (HasWire (..), Open (..), openFromWire, openToWire, unsafeFromWire)"
    ]

data MarshalSrc = MarshalSrc
  { minted :: !Text
  , ctor :: !Text
  , extensible :: !Bool
  , sTypeW :: !(Maybe Integer)
  , chainOff :: !(Maybe Int)
  , size :: !Int
  , align :: !Int
  , peekable :: !Bool
  , parents :: ![TypeName]
  , gens :: ![MGen]
  }

marshalStructSource :: MarshalSrc -> Text
marshalStructSource ms =
  T.unlines
    $ dataD
    <> [""]
    <> cstructD
    <> fromD
    <> nilD
    <> chainableD
    <> extendsD
 where
  tyHead
    | ms.extensible = ms.minted <> " (es :: [Type])"
    | otherwise = ms.minted
  tyUse
    | ms.extensible = "(" <> ms.minted <> " es)"
    | otherwise = ms.minted
  recordFields = [f | g <- ms.gens, Just f <- [g.fieldMay]]
  dataD = case recordFields of
    [] -> ["data " <> tyHead <> " = " <> ms.ctor]
    ((f0, t0, _) : rest) ->
      ["data " <> tyHead <> " = " <> ms.ctor]
        <> ( ("  { " <> f0 <> " :: " <> t0)
               : ["  , " <> f <> " :: " <> t | (f, t, _) <- rest]
           )
        <> ["  }"]
  cstructCxt
    | ms.extensible = "(AllExtends " <> ms.minted <> " es, PokeChain es) => "
    | otherwise = ""
  cstructD =
    [ "instance " <> cstructCxt <> "CStruct " <> tyUse <> " where"
    , "  cSize = " <> show ms.size
    , "  cAlign = " <> show ms.align
    , "  pokeCStruct p x = do"
    ]
      <> ["    " <> l | g <- ms.gens, l <- g.pokeLines]
      <> ["    pure ()"]
  fromCxt
    | ms.extensible = "(AllExtends " <> ms.minted <> " es, PokeChain es, PeekChain es) => "
    | otherwise = ""
  fromD
    | not ms.peekable = []
    | otherwise =
        [ ""
        , "instance " <> fromCxt <> "FromCStruct " <> tyUse <> " where"
        , "  peekCStruct p = do"
        ]
          <> ["    " <> l | g <- ms.gens, l <- g.peekLines]
          <> [ "    pure "
                 <> ms.ctor
                 <> if null recordFields then
                   ""
                 else
                   "{"
                     <> T.intercalate ", " [f <> " = v_" <> f | (f, _, _) <- recordFields]
                     <> "}"
             ]
  nilCxt
    | ms.extensible = "(NilChain es) => "
    | otherwise = ""
  nilD =
    [ ""
    , "instance " <> nilCxt <> "Nil " <> tyUse <> " where"
    ]
      <> case recordFields of
        [] -> ["  nil = " <> ms.ctor]
        ((f0, _, n0) : rest) ->
          [ "  nil ="
          , "    " <> ms.ctor
          , "      { " <> f0 <> " = " <> n0
          ]
            <> ["      , " <> f <> " = " <> n | (f, _, n) <- rest]
            <> ["      }"]
  chainableD = case (ms.sTypeW, ms.chainOff) of
    (Just w, Just off)
      | not (null ms.parents) ->
          [ ""
          , "instance " <> cstructCxt <> "Chainable " <> tyUse <> " where"
          , "  sTypeWire = " <> show w
          , "  chainOffset = " <> show off
          ]
    _ -> []
  -- Extends instances live in the dedicated Lithon.Extends module (child
  -- modules would otherwise import their chain parents' modules, and the
  -- registry's extends topology is riddled with module-level cycles).
  extendsD = [] :: [Text]

data ArmKind = StructArm | ScalarArm Text

unionMarshalSource :: Text -> StructLayout -> [(Text, Text, Text, ArmKind)] -> Text
unionMarshalSource minted layout arms =
  T.unlines
    $ dataD
    <> [""]
    <> cstructD
    <> [""]
    <> fromD
    <> [""]
    <> nilD
 where
  rawCtor = minted <> "Raw"
  rawType = "VSS.Vector " <> show layout.size <> " Word8"
  dataD =
    ["data " <> minted]
      <> case arms of
        [] -> ["  = " <> rawCtor <> " !(" <> rawType <> ")"]
        ((c0, t0, _, _) : rest) ->
          ["  = " <> c0 <> " !" <> parenType t0]
            <> ["  | " <> c <> " !" <> parenType t | (c, t, _, _) <- rest]
            <> [ "  | -- | What peeks return: the union's bytes verbatim (no wire"
               , "    -- discriminant); reinterpret via the typed arms when known."
               , "    " <> rawCtor <> " !(" <> rawType <> ")"
               ]
  cstructD =
    [ "instance CStruct " <> minted <> " where"
    , "  cSize = " <> show layout.size
    , "  cAlign = " <> show layout.align
    , "  pokeCStruct p x = do"
    , "    liftIO (fillBytes (castPtr p) 0 " <> show layout.size <> ")"
    , "    case x of"
    ]
      <> [ "      " <> c <> " v -> " <> armPoke kind
         | (c, _, _, kind) <- arms
         ]
      <> ["      " <> rawCtor <> " v -> liftIO (pokeByteOff p 0 v)"]
  armPoke = \case
    StructArm -> "pokeCStruct (castPtr p) v"
    ScalarArm pokeE -> "liftIO (" <> pokeE <> ")"
  fromD =
    [ "instance FromCStruct " <> minted <> " where"
    , "  peekCStruct p = " <> rawCtor <> " <$> peekByteOff p 0"
    ]
  nilD = case arms of
    [] ->
      [ "instance Nil " <> minted <> " where"
      , "  nil = " <> rawCtor <> " (VSS.replicate 0)"
      ]
    ((c0, _, n0, _) : _) ->
      [ "instance Nil " <> minted <> " where"
      , "  nil = " <> c0 <> " " <> parenExpr n0
      ]

-- ── module assembly ─────────────────────────────────────────────────────

-- Generated modules are self-contained: they carry their LANGUAGE pragmas
-- explicitly rather than relying on package default-extensions, so
-- formatters and tooling can parse them in isolation (e.g. in the staging
-- directory, where no cabal context applies).
generatedHeader :: Text
generatedHeader =
  "-- Generated by lithon-codegen. DO NOT EDIT.\n\
  \-- Regenerate: cabal run lithon-codegen -- generate --profile profiles/lithon-core.json\n\
  \{-# LANGUAGE BlockArguments #-}\n\
  \{-# LANGUAGE DataKinds #-}\n\
  \{-# LANGUAGE DerivingVia #-}\n\
  \{-# LANGUAGE DuplicateRecordFields #-}\n\
  \{-# LANGUAGE ImportQualifiedPost #-}\n\
  \{-# LANGUAGE NoFieldSelectors #-}\n\
  \{-# LANGUAGE OverloadedRecordDot #-}\n\
  \{-# LANGUAGE OverloadedStrings #-}\n\
  \{-# LANGUAGE PatternSynonyms #-}\n\
  \{-# LANGUAGE TypeFamilies #-}\n\
  \{-# LANGUAGE UndecidableInstances #-}\n"

moduleSource :: Module.Meta -> [Decl] -> RenderedModule
moduleSource at ds =
  RenderedModule
    { meta = at
    , contents =
        T.unlines
          $ [ generatedHeader
            , "module " <> Module.hsName at <> " ("
            ]
          <> [ "  " <> e <> ","
             | e <- concatMap (.exports) ds
             ]
          <> [ ") where"
             , ""
             ]
          <> Set.toAscList (Set.unions ((.needs) <$> ds))
          <> concat [["", d.source] | d <- ds]
    }

plainEnumSource :: Text -> [(Text, Integer)] -> Text
plainEnumSource minted items =
  T.unlines
    $ dataDecl
    <> [ ""
       , "instance HasWire " <> minted <> " where"
       , "  toWire = \\case"
       ]
    <> ["    " <> ctor <> " -> " <> show v | (ctor, v) <- items]
    <> [ "  fromWire = \\case"
       ]
    <> [ "    " <> show v <> " -> Just " <> ctor
       | (ctor, v) <- dedupByValue items
       ]
    <> ["    _ -> Nothing"]
 where
  dataDecl = case items of
    [] -> ["data " <> minted, "  deriving stock (Eq, Ord, Show)"]
    ((c0, _) : rest) ->
      ("data " <> minted)
        : ("  = " <> c0)
        : ["  | " <> c | (c, _) <- rest]
          <> ["  deriving stock (Eq, Ord, Show)"]

data BitLiteral = BitLiteral {ctor :: !Text, value :: !Integer}

bitsSource :: Text -> Text -> [(Text, Integer)] -> [BitLiteral] -> Text
bitsSource minted wire bits literals =
  T.unlines
    $ dataDecl
    <> [ ""
       , "type instance FlagsWire " <> minted <> " = " <> wire
       , ""
       , "instance BitPos " <> minted <> " where"
       ]
    <> bitOfDecl
    <> [ "  allBits ="
       , "    [ " <> T.intercalate "\n    , " (fst <$> bits)
       , "    ]"
       ]
    <> concat
      [ [ ""
        , "pattern " <> l.ctor <> " :: Flags " <> minted
        , "pattern " <> l.ctor <> " = Flags " <> hex l.value
        ]
      | l <- literals
      ]
 where
  dataDecl = case bits of
    [] -> ["data " <> minted, "  deriving stock (Eq, Ord, Show)"]
    ((c0, _) : rest) ->
      ("data " <> minted)
        : ("  = " <> c0)
        : ["  | " <> c | (c, _) <- rest]
          <> ["  deriving stock (Eq, Ord, Show)"]
  bitOfDecl = case bits of
    [] -> ["  bitOf = \\case {}"]
    _ ->
      "  bitOf = \\case"
        : ["    " <> c <> " -> Flags " <> hex v | (c, v) <- bits]

emptyBitsSource :: Text -> Text -> Text
emptyBitsSource bitsName wire =
  T.unlines
    [ "-- | Reserved-empty mask: no bits are defined yet."
    , "data " <> bitsName
    , "  deriving stock (Eq, Ord, Show)"
    , ""
    , "type instance FlagsWire " <> bitsName <> " = " <> wire
    , ""
    , "instance BitPos " <> bitsName <> " where"
    , "  bitOf = \\case {}"
    , "  allBits = []"
    ]

nonDispatchableHandleSource :: Text -> Text
nonDispatchableHandleSource minted =
  T.unlines
    [ "newtype " <> minted <> " = " <> minted <> " Word64"
    , "  deriving newtype (Eq, Ord, Show, Storable, Prim)"
    , ""
    , "newtype instance VU.MVector s "
        <> minted
        <> " = MV_"
        <> minted
        <> " (P.MVector s "
        <> minted
        <> ")"
    , ""
    , "newtype instance VU.Vector " <> minted <> " = V_" <> minted <> " (P.Vector " <> minted <> ")"
    , ""
    , "deriving via (UnboxViaPrim " <> minted <> ") instance VGM.MVector VU.MVector " <> minted
    , ""
    , "deriving via (UnboxViaPrim " <> minted <> ") instance VG.Vector VU.Vector " <> minted
    , ""
    , "instance VU.Unbox " <> minted
    , ""
    , "-- | @VK_NULL_HANDLE@."
    , "instance Nil " <> minted <> " where"
    , "  nil = " <> minted <> " 0"
    ]

dispatchableHandleSource :: Text -> Text -> Text
dispatchableHandleSource minted table =
  T.unlines
    [ "-- | Opaque dispatch target."
    , "data " <> minted <> "_T"
    , ""
    , "-- | A rich handle: the raw pointer plus the resolved command table it"
    , "-- dispatches through. Struct members hold the raw @Ptr " <> minted <> "_T@"
    , "-- (read one off a handle as @h.handle@); commands always take and"
    , "-- return this rich form. Equality and ordering are by pointer."
    , "data " <> minted <> " = " <> minted
    , "  { handle :: Ptr " <> minted <> "_T"
    , "  , cmds :: " <> table
    , "  }"
    , ""
    , "instance Eq " <> minted <> " where"
    , "  a == b = a.handle == b.handle"
    , ""
    , "instance Ord " <> minted <> " where"
    , "  compare a b = compare a.handle b.handle"
    , ""
    , "instance Show " <> minted <> " where"
    , "  showsPrec d x ="
    , "    showParen (d >= 11) (showString \"" <> minted <> " \" . showsPrec 11 x.handle)"
    ]

dedupByValue :: [(Text, Integer)] -> [(Text, Integer)]
dedupByValue = go Set.empty
 where
  go _ [] = []
  go seen ((c, v) : rest)
    | Set.member v seen = go seen rest
    | otherwise = (c, v) : go (Set.insert v seen) rest

hex :: Integer -> Text
hex v = "0x" <> toText (showHex v "")

extendsModule :: Module.Meta
extendsModule = $$(Module.metaLit ["Lithon", "Vk", "Extends"])

-- | Every @Extends@ instance in one place (the upstream-proven shape):
-- child modules would otherwise import their chain parents' modules, whose
-- extends topology is cyclic at module granularity. Orphan-style by
-- design; re-exported by the umbrella so the instances are always in
-- scope with @import Lithon@.
extendsSource :: Names -> ModuleMap -> StructPlans -> RenderedModule
extendsSource names moduleMap sp =
  RenderedModule
    { meta = extendsModule
    , contents =
        T.unlines
          $ [ generatedHeader
            , "{-# OPTIONS_GHC -Wno-orphans #-}"
            , ""
            , "-- | The registry's structextends topology, as 'Extends' instances."
            , "module " <> Module.hsName extendsModule <> " () where"
            , ""
            , "import Lithon.Core.Chain (Extends)"
            ]
          <> ["import " <> Module.hsName m | m <- sort (toList involvedModules)]
          <> [""]
          <> instances
    }
 where
  edges =
    [ (parent, child, extensible)
    | (child, MarshalPlan{extends, extensible}) <- Map.toList sp.plans
    , parent <- extends
    ]
  involvedModules =
    Set.fromList
      [ m
      | (parent, child, _) <- edges
      , t <- [parent, child]
      , Just m <- [Map.lookup t moduleMap.structModules]
      ]
  instances =
    [ "instance Extends "
        <> minted parent
        <> " "
        <> (if extensible then "(" <> minted child <> " '[])" else minted child)
    | (parent, child, extensible) <- edges
    ]
  minted t = fromMaybe (forgetNamespace t) (Map.lookup t names.typeNames)

-- ── fixed modules ───────────────────────────────────────────────────────

constantsSource :: ResolvedRegistry -> Names -> RenderedModule
constantsSource registry names =
  RenderedModule
    { meta = constantsModule
    , contents =
        T.unlines
          $ [ generatedHeader
            , "{-# LANGUAGE OverloadedStrings #-}"
            , ""
            , "-- | The registry's API constants. @VK_TRUE@\\/@VK_FALSE@ are"
            , "-- deliberately absent — 'Lithon.Core.BaseTypes.Bool32' supersedes"
            , "-- them."
            , "module " <> Module.hsName constantsModule <> " ("
            ]
          <> ["  pattern " <> n <> "," | (_, n, _) <- rows]
          <> [ ") where"
             , ""
             ]
          <> constantImports
          <> [""]
          <> concat
            [ [ "pattern " <> n <> " :: " <> ty
              , "pattern " <> n <> " = " <> lit
              , ""
              ]
            | (_, n, (ty, lit)) <- rows
            ]
    }
 where
  rows =
    [ (cname, minted, renderConstant c.value)
    | (cname, c) <- Map.toAscList registry.constants
    , cname `notElem` skipped
    , Just minted <- [Map.lookup cname names.constantNames]
    ]
  skipped = ["VK_TRUE", "VK_FALSE"]
  constantImports =
    concat
      [ ["import Data.ByteString (ByteString)" | anyTy "ByteString"]
      , ["import Data.Int (Int64)" | anyTy "Int64"]
      , ["import Data.Word (Word32)" | anyTy "Word32"]
      , ["import Data.Word (Word64)" | anyTy "Word64"]
      ]
  anyTy t = any (\(_, _, (ty, _)) -> ty == t) rows
  renderConstant = \case
    ConstU32 w -> ("Word32", show w)
    ConstU64 w -> ("Word64", show w)
    ConstFloat f -> ("Float", show f)
    ConstInt i -> ("Int64", show i)
    ConstString s -> ("ByteString", show s)

versionSource :: ResolvedRegistry -> RenderedModule
versionSource registry =
  RenderedModule
    { meta = versionModule
    , contents =
        T.unlines
          $ [ generatedHeader
            , "-- | Curated API versions and the registry pin this binding was"
            , "-- generated from."
            , "module " <> Module.hsName versionModule <> " ("
            ]
          <> ["  pattern API_VERSION_" <> tag v <> "," | v <- versions]
          <> [ "  pattern HEADER_VERSION,"
             , "  pattern HEADER_VERSION_COMPLETE,"
             , ") where"
             , ""
             , "import Data.Word (Word32)"
             , "import Lithon.Core.BaseTypes (ApiVersion (..))"
             , ""
             ]
          <> concat
            [ [ "pattern API_VERSION_" <> tag v <> " :: ApiVersion"
              , "pattern API_VERSION_" <> tag v <> " = ApiVersion " <> encoded v
              , ""
              ]
            | v <- versions
            ]
          <> [ "pattern HEADER_VERSION :: Word32"
             , "pattern HEADER_VERSION = " <> show registry.headerVersion
             , ""
             , "pattern HEADER_VERSION_COMPLETE :: ApiVersion"
             , "pattern HEADER_VERSION_COMPLETE = ApiVersion " <> completeValue
             ]
    }
 where
  versions = [f.version | f <- V.toList registry.features]
  tag v = show v.major <> "_" <> show v.minor
  encoded v = hex (shiftL (toInteger v.major) 22 .|. shiftL (toInteger v.minor) 12)
  completeValue = case reverse versions of
    [] -> "0"
    (v : _) ->
      hex
        ( shiftL (toInteger v.major) 22
            .|. shiftL (toInteger v.minor) 12
            .|. toInteger registry.headerVersion
        )

resultSource :: Names -> ModuleMap -> RenderedModule
resultSource names moduleMap =
  RenderedModule
    { meta = resultModule
    , contents = contents'
    }
 where
  resultTy = fromMaybe "Result" (Map.lookup "VkResult" names.typeNames)
  resultAt =
    maybe "Lithon.Vk.Core10.Enums.Result" Module.hsName
      $ Map.lookup "VkResult" moduleMap.enumModules
  contents' =
    T.unlines
      [ generatedHeader
      , "-- | The canonical result vocabulary. Wrappers never throw on Vulkan"
      , "-- result codes: every @VkResult@-returning command yields an"
      , "-- 'Outcome'; failure-mode-explicit consumption goes through"
      , "-- 'toEither' (or the 'Data.These.These' iso), and 'expect' is the"
      , "-- opt-in throwing shortcut."
      , "--"
      , "-- Misuse guards are the one exception: calling a command the loader"
      , "-- never resolved throws 'Lithon.Core.Loader.MissingCommand', and a"
      , "-- vector whose length contradicts its count source is an 'error' —"
      , "-- both are API-contract violations, not driver results."
      , "module " <> Module.hsName resultModule <> " ("
      , "  Outcome (..),"
      , "  result,"
      , "  isError,"
      , "  toEither,"
      , "  expect,"
      , "  VulkanError (..),"
      , ") where"
      , ""
      , "import Control.Exception (Exception, throwIO)"
      , "import Control.Monad.IO.Class (MonadIO, liftIO)"
      , "import GHC.Records (HasField (..))"
      , "import GHC.Stack (CallStack, HasCallStack, callStack, prettyCallStack)"
      , "import Lithon.Core.Open (Open, openToWire)"
      , "import " <> resultAt <> " (" <> resultTy <> ")"
      , ""
      , "-- | A command's result code together with its payload when the code"
      , "-- is a success (wire >= 0; codes are retained — SUBOPTIMAL_KHR and"
      , "-- friends are successes with information). The constructor names"
      , "-- dodge the result-code constructors (a @Success@ constructor here"
      , "-- would collide with @VK_SUCCESS@'s)."
      , "data Outcome a"
      , "  = Err !(Open " <> resultTy <> ")"
      , "  | Ok !(Open " <> resultTy <> ") !a"
      , "  deriving stock (Eq, Show, Functor, Foldable, Traversable)"
      , ""
      , "-- | Total, monomorphic extraction: every 'Outcome' carries its code."
      , "result :: Outcome a -> Open " <> resultTy
      , "result = \\case"
      , "  Err r -> r"
      , "  Ok r _ -> r"
      , ""
      , "-- | Record-dot access: @o.result@."
      , "instance HasField \"result\" (Outcome a) (Open " <> resultTy <> ") where"
      , "  getField = result"
      , ""
      , "-- | The registry contract: error codes are negative — decidable even"
      , "-- for 'Lithon.Core.Open.Unknown' codes."
      , "isError :: Open " <> resultTy <> " -> Bool"
      , "isError r = openToWire r < 0"
      , ""
      , "-- | THE lifter: one helper takes any wrapped call into any"
      , "-- failure-mode-explicit stack (@ExceptT@, effectful @Error@, …)."
      , "-- The success code is dropped; match 'Ok' directly when it matters."
      , "toEither :: Outcome a -> Either (Open " <> resultTy <> ") a"
      , "toEither = \\case"
      , "  Err r -> Left r"
      , "  Ok _ a -> Right a"
      , ""
      , "-- | Opt-in shortcut: unwrap or throw 'VulkanError'. The exception is"
      , "-- precise — @catch \\@VulkanError@ never entangles IO exceptions."
      , "expect :: (HasCallStack, MonadIO m) => Outcome a -> m a"
      , "expect = \\case"
      , "  Ok _ a -> pure a"
      , "  Err r -> liftIO (throwIO VulkanError {result = r, callSite = callStack})"
      , ""
      , "data VulkanError = VulkanError"
      , "  { result :: !(Open " <> resultTy <> ")"
      , "  , callSite :: !CallStack"
      , "  }"
      , ""
      , "instance Show VulkanError where"
      , "  show e ="
      , "    \"VulkanError: \" <> show e.result <> \"\\n\" <> prettyCallStack e.callSite"
      , ""
      , "instance Exception VulkanError"
      ]

umbrellaSource :: [Module.Meta] -> RenderedModule
umbrellaSource paths =
  RenderedModule
    { meta = umbrellaModule
    , contents =
        T.unlines
          $ [ generatedHeader
            , "-- | Everything, re-exported. Fine-grained imports remain available"
            , "-- via the per-module tree; @lithon-core@'s marshalling vocabulary"
            , "-- is re-exported so a single import works for typical use."
            , "module " <> Module.hsName umbrellaModule <> " ("
            ]
          <> ["  module " <> Module.hsName p <> "," | p <- reexports]
          <> [ ") where"
             , ""
             ]
          <> ["import " <> Module.hsName p | p <- reexports]
    }
 where
  reexports =
    sort (coreReexports <> paths)
  coreReexports =
    $$( Module.metaLits
          [ ["Lithon", "Core", "Alloc"]
          , ["Lithon", "Core", "CStruct"]
          , ["Lithon", "Core", "Chain"]
          , ["Lithon", "Core", "Open"]
          , ["Lithon", "Core", "Flags"]
          , ["Lithon", "Core", "BaseTypes"]
          , ["Lithon", "Core", "Platform"]
          , ["Lithon", "Core", "Funptr"]
          , ["Lithon", "Core", "Unbox"]
          ]
      )
