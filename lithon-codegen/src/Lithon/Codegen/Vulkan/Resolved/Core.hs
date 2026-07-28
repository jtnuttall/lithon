{-# LANGUAGE OverloadedStrings #-}

-- | Resolved type entities: canonical names only, references classified,
-- array dimensions materialized, aliases inverted, availability attached.
--
-- Every record follows the same scheme: @name@ is canonical, @aliases@
-- carries the inverted alias spellings, @availability@ is 'Nothing' when no
-- surviving interface requires the entity (an orphan any curation prunes),
-- and @origins@ are the require-sites. Bodies that phase 3 re-parses
-- (basetypes, defines) stay as 'MixedBody'.
module Lithon.Codegen.Vulkan.Resolved.Core (
  TypeRefKind (..),
  ResolvedTypeRef (..),
  ResolvedDim (..),
  ResolvedMember (..),
  StructKind (..),
  ResolvedStruct (..),
  ResolvedHandle (..),
  ResolvedBitmask (..),
  ResolvedFuncpointer (..),
  ResolvedParam (..),
  ResolvedBasetype (..),
  ResolvedDefine (..),
  ResolvedExternal (..),

  -- * Cross-reference resolution
  CrossRefError (..),
  classifyRef,
  resolveDim,
  resolveParam,
  invertAliases,
  aliasesOf,
  deprecationFor,
  resolveStructs,
  resolveHandles,
  resolveBitmasks,
  resolveFuncpointers,
  resolveBasetypes,
  resolveDefines,
  resolveExternals,
  blockValueNames,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry (Registry, Specialized)
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (ProtectExpr)
import Lithon.Codegen.Vulkan.Registry.Micro.ExternSync (ExternSync)
import Lithon.Codegen.Vulkan.Registry.Micro.Len (AltLen, LenSpec)
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (
  ArrayDim (..),
  Declaration (..),
  MixedBody (..),
  MixedChunk (..),
  PtrLayer,
  TypeRef (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Commands (Param (..), ProtoDecl (..))
import Lithon.Codegen.Vulkan.Registry.Types.Common (Deprecation, Raw)
import Lithon.Codegen.Vulkan.Registry.Types.Core (
  AliasOr (..),
  BasetypeType (..),
  BitmaskDef (..),
  DefineType (..),
  FuncpointerDef (..),
  HandleDef (..),
  Member (..),
  StructDef (..),
  TypeBody (..),
  TypeCommon (..),
  TypeDecl (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Enums (BitWidth (..), EnumsKind (..))
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases (..), CanonicalEntry (..), canonicalize)
import Lithon.Codegen.Vulkan.Resolve.Enums (
  MaterializedBlock (..),
  MaterializedConstant (..),
  MaterializedEnums (..),
  MaterializedValue (..),
 )
import Lithon.Codegen.Vulkan.Resolve.Require (Requirements)
import Lithon.Codegen.Vulkan.Resolve.Require qualified as Require
import Lithon.Codegen.Vulkan.Resolve.Symbols (Symbols (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AliasInfo (..),
  AvailExpr,
  DeprecationInfo (..),
  InterfaceItemNamespace (..),
  Origin,
  PlatformGuard,
  availabilityOf,
  mergeDeprecation,
 )
import Lithon.Codegen.Vulkan.Resolved.Avail qualified as Avail
import Lithon.Codegen.Vulkan.Resolved.Enums.Value (ConstantValue (..))
import Lithon.Codegen.Vulkan.Xml.Types (Pos, noPos)

-- | What a resolved type reference points at.
data TypeRefKind
  = RefStruct
  | RefUnion
  | RefHandle
  | RefEnum
  | RefBitmask
  | RefFuncpointer
  | RefBasetype
  | RefExternal
  | RefDefine
  | RefInclude
  | -- | C @void@ (base of @pNext@ and PFN returns) — not a registry type.
    RefVoid
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedTypeRef = ResolvedTypeRef
  { name :: !TypeName
  -- ^ Canonical target name.
  , kind :: !TypeRefKind
  , spelledAs :: !(Maybe TypeName)
  -- ^ The alias spelling at the reference site, when it differed.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | An array dimension with named constants materialized.
data ResolvedDim
  = RDimLit !Integer
  | RDimConst {name :: !EnumValueName, size :: !Integer}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedMember = ResolvedMember
  { name :: !Text
  , typeRef :: !ResolvedTypeRef
  , pointers :: ![PtrLayer]
  , arrayDims :: ![ResolvedDim]
  , bitfield :: !(Maybe Int)
  , baseConst :: !Bool
  , values :: ![EnumValueName]
  -- ^ Permitted values (the @sType@ mechanism), canonicalized and validated
  -- against the materialized @VkStructureType@ items.
  , len :: !(Maybe (Raw LenSpec))
  , altLen :: !(Maybe (Raw AltLen))
  , stride :: !(Maybe Text)
  , isOptional :: !(Maybe (NonEmpty Bool))
  , externSync :: !(Maybe (Raw ExternSync))
  , selector :: !(Maybe Text)
  , selection :: ![Text]
  , noAutoValidity :: !Bool
  , limitType :: !(Maybe Text)
  , objectType :: !(Maybe Text)
  , featureLink :: !(Maybe Text)
  , deprecation :: !(Maybe DeprecationInfo)
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data StructKind = SKStruct | SKUnion
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedStruct = ResolvedStruct
  { name :: !TypeName
  , kind :: !StructKind
  , returnedOnly :: !Bool
  , extends :: ![TypeName]
  -- ^ @structextends=@ targets, canonicalized.
  , extendedBy :: ![TypeName]
  -- ^ Reverse pNext index (computed; name-sorted).
  , allowDuplicate :: !Bool
  , sType :: !(Maybe EnumValueName)
  -- ^ The required @VK_STRUCTURE_TYPE_*@ when the @sType@ member permits
  -- exactly one value.
  , members :: !(Vector ResolvedMember)
  , aliases :: !(Vector (AliasInfo 'TypeNS))
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , platformGuards :: ![PlatformGuard]
  , deprecation :: !(Maybe DeprecationInfo)
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedHandle = ResolvedHandle
  { name :: !TypeName
  , dispatchable :: !Bool
  , parent :: !(Maybe TypeName)
  , objectTypeValue :: !EnumValueName
  -- ^ The @VK_OBJECT_TYPE_*@ item, validated against @VkObjectType@.
  , aliases :: !(Vector (AliasInfo 'TypeNS))
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , platformGuards :: ![PlatformGuard]
  , deprecation :: !(Maybe DeprecationInfo)
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedBitmask = ResolvedBitmask
  { name :: !TypeName
  -- ^ The Flags side (e.g. @VkBufferUsageFlags2@).
  , bitWidth :: !BitWidth
  , bitsBlock :: !(Maybe TypeName)
  -- ^ The FlagBits block providing values; 'Nothing' = reserved-empty mask.
  , baseType :: !TypeName
  -- ^ @VkFlags@ or @VkFlags64@.
  , aliases :: !(Vector (AliasInfo 'TypeNS))
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , deprecation :: !(Maybe DeprecationInfo)
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A command or funcpointer parameter.
data ResolvedParam = ResolvedParam
  { name :: !Text
  , typeRef :: !ResolvedTypeRef
  , pointers :: ![PtrLayer]
  , arrayDims :: ![ResolvedDim]
  , baseConst :: !Bool
  , len :: !(Maybe (Raw LenSpec))
  , altLen :: !(Maybe (Raw AltLen))
  , stride :: !(Maybe Text)
  , isOptional :: !(Maybe (NonEmpty Bool))
  , externSync :: !(Maybe (Raw ExternSync))
  , selector :: !(Maybe Text)
  , noAutoValidity :: !Bool
  , objectType :: !(Maybe Text)
  , validStructs :: ![TypeName]
  -- ^ Canonicalized.
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedFuncpointer = ResolvedFuncpointer
  { name :: !TypeName
  , returnType :: !ResolvedTypeRef
  , returnPointers :: ![PtrLayer]
  , params :: !(Vector ResolvedParam)
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedBasetype = ResolvedBasetype
  { name :: !TypeName
  , body :: !MixedBody
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ResolvedDefine = ResolvedDefine
  { name :: !TypeName
  , body :: !MixedBody
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , deprecation :: !(Maybe DeprecationInfo)
  , protect :: !(Maybe (Raw ProtectExpr))
  , comment :: !(Maybe Text)
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Platform\/C types pulled in via @requires=@ headers (HWND,
-- @xcb_connection_t@, @uint32_t@, …). Availability and platform gating come
-- from the entities that REFERENCE them; the registry attaches none here.
data ResolvedExternal = ResolvedExternal
  { name :: !TypeName
  , header :: !(Maybe Text)
  , availability :: !(Maybe AvailExpr)
  , origins :: ![Origin]
  , pos :: !Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- ── Cross-reference resolution ───────────────────────────────────────────
--
-- Constructors for the records above: names classified against the symbol
-- tables, array-dimension constants materialized, aliases inverted,
-- availability and platform guards attached. The plural entry points build
-- their lookup indexes once per call; the per-item resolvers are private.

data CrossRefError
  = XUnknownType {ref :: !Text, owner :: !Text, pos :: !Pos}
  | XUnknownConstant {constant :: !Text, owner :: !Text, pos :: !Pos}
  | XBadDimConstant {constant :: !Text, owner :: !Text, detail :: !Text, pos :: !Pos}
  | XBadSType {value :: !Text, owner :: !Text, pos :: !Pos}
  | XBadResultCode {code :: !Text, owner :: !Text, pos :: !Pos}
  | XBadObjectType {value :: !Text, owner :: !Text, pos :: !Pos}
  | XBadHandleBody {owner :: !Text, pos :: !Pos}
  | XBadBitmaskBody {owner :: !Text, pos :: !Pos}
  | XBitsBlockMissing {owner :: !Text, block :: !Text, pos :: !Pos}
  | XBitWidthMismatch {owner :: !Text, block :: !Text, pos :: !Pos}
  | XUnknownExtends {owner :: !Text, target :: !Text, pos :: !Pos}
  | XUnknownParent {owner :: !Text, parent :: !Text, pos :: !Pos}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display CrossRefError where
  displayBuilder =
    displayBuilder @Text . \case
      XUnknownType{ref, owner} -> owner <> " references unknown type " <> ref
      XUnknownConstant{constant, owner} ->
        owner <> " sizes an array with unknown constant " <> constant
      XBadDimConstant{constant, owner, detail} ->
        owner <> " array constant " <> constant <> ": " <> detail
      XBadSType{value, owner} -> owner <> " permits unknown sType value " <> value
      XBadResultCode{code, owner} -> owner <> " lists unknown result code " <> code
      XBadObjectType{value, owner} -> owner <> " names unknown object type " <> value
      XBadHandleBody{owner} -> owner <> " has an unrecognized handle definition macro"
      XBadBitmaskBody{owner} -> owner <> " has an unrecognized bitmask base type"
      XBitsBlockMissing{owner, block} ->
        owner <> " draws bits from missing block " <> block
      XBitWidthMismatch{owner, block} ->
        owner <> " width disagrees with its bits block " <> block
      XUnknownExtends{owner, target} -> owner <> " structextends unknown type " <> target
      XUnknownParent{owner, parent} -> owner <> " has unknown parent handle " <> parent

-- | Classify a reference against the symbol tables (canonicalizing alias
-- spellings). @void@ is not a registry type but is a legal reference.
classifyRef
  :: (HasType Aliases cxt, HasType Symbols cxt)
  => cxt -> Text -> Pos -> TypeName -> Either CrossRefError ResolvedTypeRef
classifyRef cxt owner pos ref
  | ref == "void" = Right ResolvedTypeRef{name = "void", kind = RefVoid, spelledAs = Nothing}
  | otherwise = case Map.lookup canonical (cxt ^. typed @Symbols . #types) of
      Nothing -> Left XUnknownType{ref = forgetNamespace ref, owner, pos}
      Just t ->
        Right
          ResolvedTypeRef
            { name = canonical
            , kind = kindOf t.body
            , spelledAs = if ref == canonical then Nothing else Just ref
            }
 where
  canonical = canonicalize (cxt ^. typed @Aliases . #types) ref
  kindOf = \case
    TExternal _ -> RefExternal
    TInclude _ -> RefInclude
    TDefine _ -> RefDefine
    TBasetype _ -> RefBasetype
    TBitmask _ -> RefBitmask
    THandle _ -> RefHandle
    TEnumDecl _ -> RefEnum
    TFuncpointer _ -> RefFuncpointer
    TStruct _ -> RefStruct
    TUnion _ -> RefUnion

-- | Materialize an array dimension (named constants looked up through the
-- alias table into the materialized constants).
resolveDim
  :: (HasType Aliases cxt, HasType MaterializedEnums cxt)
  => cxt -> Text -> ArrayDim -> Either CrossRefError ResolvedDim
resolveDim cxt owner = \case
  DimLit n -> Right (RDimLit n)
  DimNamespace txt pos ->
    let canonical = canonicalize (cxt ^. typed @Aliases . #enumValues) txt
     in case Map.lookup canonical (cxt ^. typed @MaterializedEnums . #constants) of
          Nothing -> Left XUnknownConstant{constant = forgetNamespace txt, owner, pos}
          Just c -> case c.value of
            ConstU32 n -> Right RDimConst{name = canonical, size = fromIntegral n}
            ConstU64 n -> Right RDimConst{name = canonical, size = fromIntegral n}
            ConstInt n -> Right RDimConst{name = canonical, size = n}
            _ ->
              Left
                XBadDimConstant
                  { constant = forgetNamespace txt
                  , owner
                  , detail = "not an integer constant"
                  , pos
                  }

-- | Resolve a command or funcpointer parameter.
resolveParam
  :: (HasType Aliases cxt, HasType MaterializedEnums cxt, HasType Symbols cxt)
  => cxt -> Text -> Param -> Either CrossRefError ResolvedParam
resolveParam cxt owner p = do
  typeRef <- classifyRef cxt owner p.decl.pos p.decl.typeName.name
  arrayDims <- traverse (resolveDim cxt owner) p.decl.arrayDims
  pure
    ResolvedParam
      { name = p.decl.name
      , typeRef
      , pointers = p.decl.pointers
      , arrayDims
      , baseConst = p.decl.baseConst
      , len = p.len
      , altLen = p.altLen
      , stride = p.stride
      , isOptional = p.isOptional
      , externSync = p.externSync
      , selector = p.selector
      , noAutoValidity = p.noAutoValidity
      , objectType = p.objectType
      , validStructs = map (canonicalize (cxt ^. typed @Aliases . #types)) p.validStructs
      , pos = p.pos
      }

-- | Alias inversion: canonical name -> alias spellings with their own
-- availability, name-sorted.
invertAliases
  :: (HasType Requirements cxt)
  => cxt
  -> Map (WithNS k) (CanonicalEntry k)
  -> InterfaceItemNamespace
  -> (WithNS k -> Pos)
  -> Map (WithNS k) [AliasInfo k]
invertAliases cxt table ns posOf =
  Map.map (map snd . sortOn fst) reversed
 where
  reversed =
    Map.fromListWith
      (<>)
      [ (entry.target, [(aliasName, info aliasName entry)])
      | (aliasName, entry) <- Map.toList table
      ]
  info aliasName entry =
    let origins = Require.originsFor cxt ns (forgetNamespace aliasName)
     in AliasInfo
          { name = aliasName
          , availability = availabilityOf origins
          , origins
          , deprecated = entry.deprecated
          , pos = posOf aliasName
          }

-- | The spellings 'invertAliases' recorded for one canonical name.
aliasesOf :: Map (WithNS k) [AliasInfo k] -> WithNS k -> Vector (AliasInfo k)
aliasesOf index n = V.fromList (Map.findWithDefault [] n index)

-- | Block-level deprecation info merged with a @deprecated=@ marker.
deprecationFor
  :: (HasType Requirements cxt)
  => cxt -> InterfaceItemNamespace -> Text -> Maybe Deprecation -> Maybe DeprecationInfo
deprecationFor cxt ns n = mergeDeprecation (Require.deprecationAt cxt ns n)

-- | Resolve every struct and union, including the reverse pNext topology
-- (@extendedBy@, computed over the complete map).
resolveStructs
  :: ( HasType Aliases cxt
     , HasType MaterializedEnums cxt
     , HasType Requirements cxt
     , HasType (Specialized Registry) cxt
     , HasType Symbols cxt
     )
  => cxt -> Validation (Errors CrossRefError) (Map TypeName ResolvedStruct)
resolveStructs cxt = fillExtendedBy . Map.fromList <$> sequenceA structVs
 where
  symbols = getTyped @Symbols cxt
  aliases = getTyped @Aliases cxt
  materialized = getTyped @MaterializedEnums cxt
  canonicalType = canonicalize aliases.types
  canonicalValue = canonicalize aliases.enumValues
  typeAliasIndex = invertAliases cxt aliases.types NsType \n ->
    maybe noPos (\t -> t.common.pos) (Map.lookup n symbols.types)
  structureTypeNames = blockValueNames materialized VkStructureType

  structVs =
    [ resolveStruct name t kind s
    | (name, t) <- Map.toAscList symbols.types
    , (kind, s) <- structOf t.body
    ]
  structOf = \case
    TStruct (FullDef s) -> [(SKStruct, s)]
    TUnion (FullDef s) -> [(SKUnion, s)]
    _ -> []

  resolveStruct name t kind s =
    failUnlessEmpty
      (memberErrs <> extendsErrs)
      ( name
      , ResolvedStruct
          { name
          , kind
          , returnedOnly = s.returnedOnly
          , extends = extendsOk
          , extendedBy = []
          , allowDuplicate = fromMaybe False s.allowDuplicate
          , sType = structSType
          , members = V.fromList membersOk
          , aliases = aliasesOf typeAliasIndex name
          , availability = availabilityOf origins
          , origins
          , platformGuards = Avail.guardsFor cxt origins
          , deprecation = deprecationFor cxt NsType (forgetNamespace name) t.common.deprecated
          , comment = t.common.comment
          , pos = t.common.pos
          }
      )
   where
    origins = Require.originsFor cxt NsType (forgetNamespace name)
    (memberErrs, membersOk) =
      partitionEithers
        (map (resolveMember (forgetNamespace name) (not (null origins))) (V.toList s.members))
    (extendsErrs, extendsOk) = partitionEithers (map checkExtends s.structExtends)
    checkExtends target =
      let canonical = canonicalType target
       in if Map.member canonical symbols.types then
            Right canonical
          else
            Left
              XUnknownExtends{owner = forgetNamespace name, target = forgetNamespace target, pos = t.common.pos}
    structSType = case [m.values | m <- membersOk, m.name == "sType"] of
      [[single]] -> Just single
      _ -> Nothing

  -- Reference targets are validated only for REACHABLE owners: types of
  -- disabled\/other-api extensions survive specialization as orphans, and
  -- their sType\/object-type values legitimately have no materialization.
  resolveMember :: Text -> Bool -> Member -> Either CrossRefError ResolvedMember
  resolveMember owner reachable m = do
    typeRef <- classifyRef cxt owner m.decl.pos m.decl.typeName.name
    arrayDims <- traverse (resolveDim cxt owner) m.decl.arrayDims
    values <- traverse checkSType m.values
    pure
      ResolvedMember
        { name = m.decl.name
        , typeRef
        , pointers = m.decl.pointers
        , arrayDims
        , bitfield = m.decl.bitfield
        , baseConst = m.decl.baseConst
        , values
        , len = m.len
        , altLen = m.altLen
        , stride = m.stride
        , isOptional = m.isOptional
        , externSync = m.externSync
        , selector = m.selector
        , selection = m.selection
        , noAutoValidity = m.noAutoValidity
        , limitType = m.limitType
        , objectType = m.objectType
        , featureLink = m.featureLink
        , deprecation = deprecationForMarker m.deprecated
        , comment = m.comment
        , pos = m.pos
        }
   where
    checkSType v =
      let canonical = canonicalValue v
       in if not reachable || Set.member canonical structureTypeNames then
            Right canonical
          else
            Left XBadSType{value = forgetNamespace v, owner, pos = m.pos}
    deprecationForMarker = fmap \marker ->
      DeprecationInfo
        { supersededBy = Nothing
        , categories = []
        , since = Nothing
        , marker = Just marker
        }

  -- Reverse pNext index over the complete struct map (name-sorted).
  fillExtendedBy :: Map TypeName ResolvedStruct -> Map TypeName ResolvedStruct
  fillExtendedBy structMap =
    Map.mapWithKey (\name s -> s{extendedBy = Map.findWithDefault [] name reverseIndex}) structMap
   where
    reverseIndex =
      Map.map sort
        $ Map.fromListWith
          (<>)
          [ (target, [s.name])
          | s <- Map.elems structMap
          , target <- s.extends
          ]

-- | Resolve every handle: defining macro, parent ancestry, object type.
resolveHandles
  :: ( HasType Aliases cxt
     , HasType MaterializedEnums cxt
     , HasType Requirements cxt
     , HasType (Specialized Registry) cxt
     , HasType Symbols cxt
     )
  => cxt -> Validation (Errors CrossRefError) (Map TypeName ResolvedHandle)
resolveHandles cxt = Map.fromList <$> traverse validateEither items
 where
  symbols = getTyped @Symbols cxt
  aliases = getTyped @Aliases cxt
  materialized = getTyped @MaterializedEnums cxt
  canonicalType = canonicalize aliases.types
  canonicalValue = canonicalize aliases.enumValues
  typeAliasIndex = invertAliases cxt aliases.types NsType \n ->
    maybe noPos (\t -> t.common.pos) (Map.lookup n symbols.types)
  objectTypeNames = blockValueNames materialized VkObjectType

  items =
    [ resolveHandle name t h
    | (name, t) <- Map.toAscList symbols.types
    , THandle (FullDef h) <- [t.body]
    ]

  resolveHandle name t h = do
    dispatchable <- case definingMacro of
      Just "VK_DEFINE_HANDLE" -> Right True
      Just "VK_DEFINE_NON_DISPATCHABLE_HANDLE" -> Right False
      _ -> Left XBadHandleBody{owner = forgetNamespace name, pos = t.common.pos}
    parent <- traverse checkParent h.parent
    objectTypeValue <-
      let canonical = canonicalValue h.objTypeEnum
       in if null origins || Set.member canonical objectTypeNames then
            Right canonical
          else
            Left
              XBadObjectType
                { value = forgetNamespace h.objTypeEnum
                , owner = forgetNamespace name
                , pos = t.common.pos
                }
    pure
      ( name
      , ResolvedHandle
          { name
          , dispatchable
          , parent
          , objectTypeValue
          , aliases = aliasesOf typeAliasIndex name
          , availability = availabilityOf origins
          , origins
          , platformGuards = Avail.guardsFor cxt origins
          , deprecation = deprecationFor cxt NsType (forgetNamespace name) t.common.deprecated
          , comment = t.common.comment
          , pos = t.common.pos
          }
      )
   where
    origins = Require.originsFor cxt NsType (forgetNamespace name)
    definingMacro =
      case [n | ChunkType n _ <- V.toList h.body.chunks] of
        macro : _ -> Just macro
        [] -> Nothing
    checkParent p =
      let canonical = canonicalType p
       in case Map.lookup canonical symbols.types of
            Just TypeDecl{body = THandle _} -> Right canonical
            _ ->
              Left XUnknownParent{owner = forgetNamespace name, parent = forgetNamespace p, pos = t.common.pos}

-- | Resolve every bitmask: Flags\/FlagBits linkage and width agreement.
resolveBitmasks
  :: ( HasType Aliases cxt
     , HasType MaterializedEnums cxt
     , HasType Requirements cxt
     , HasType Symbols cxt
     )
  => cxt -> Validation (Errors CrossRefError) (Map TypeName ResolvedBitmask)
resolveBitmasks cxt = Map.fromList <$> traverse validateEither items
 where
  symbols = getTyped @Symbols cxt
  aliases = getTyped @Aliases cxt
  materialized = getTyped @MaterializedEnums cxt
  canonicalType = canonicalize aliases.types
  typeAliasIndex = invertAliases cxt aliases.types NsType \n ->
    maybe noPos (\t -> t.common.pos) (Map.lookup n symbols.types)

  items =
    [ resolveBitmask name t b
    | (name, t) <- Map.toAscList symbols.types
    , TBitmask (FullDef b) <- [t.body]
    ]

  resolveBitmask name t b = do
    (baseType, bitWidth) <- case baseTypeChunk of
      Just "VkFlags" -> Right (VkFlags, W32)
      Just "VkFlags64" -> Right (VkFlags64, W64)
      _ -> Left XBadBitmaskBody{owner = forgetNamespace name, pos = t.common.pos}
    bitsBlock <- case bitsLink of
      Nothing -> Right Nothing
      Just link ->
        let canonical = canonicalType link
         in case Map.lookup canonical materialized.blocks of
              Nothing ->
                Left
                  XBitsBlockMissing{owner = forgetNamespace name, block = forgetNamespace link, pos = t.common.pos}
              Just blk
                | blk.kind == KindBitmask && blk.bitWidth == bitWidth ->
                    Right (Just canonical)
                | otherwise ->
                    Left
                      XBitWidthMismatch{owner = forgetNamespace name, block = forgetNamespace link, pos = t.common.pos}
    pure
      ( name
      , ResolvedBitmask
          { name
          , bitWidth
          , bitsBlock
          , baseType
          , aliases = aliasesOf typeAliasIndex name
          , availability = availabilityOf origins
          , origins
          , deprecation = deprecationFor cxt NsType (forgetNamespace name) t.common.deprecated
          , comment = t.common.comment
          , pos = t.common.pos
          }
      )
   where
    origins = Require.originsFor cxt NsType (forgetNamespace name)
    baseTypeChunk = case [n | ChunkType n _ <- V.toList b.body.chunks] of
      base : _ -> Just base
      [] -> Nothing
    bitsLink = b.bitvalues <|> (WithNS <$> t.common.requires)

-- | Resolve every function pointer: return type and parameters.
resolveFuncpointers
  :: ( HasType Aliases cxt
     , HasType MaterializedEnums cxt
     , HasType Requirements cxt
     , HasType Symbols cxt
     )
  => cxt -> Validation (Errors CrossRefError) (Map TypeName ResolvedFuncpointer)
resolveFuncpointers cxt = Map.fromList <$> traverse validateEither items
 where
  symbols = getTyped @Symbols cxt

  items =
    [ resolveFuncpointer name t f
    | (name, t) <- Map.toAscList symbols.types
    , TFuncpointer f <- [t.body]
    ]

  resolveFuncpointer name t f = do
    returnType <- classifyRef cxt (forgetNamespace name) f.proto.decl.pos f.proto.decl.typeName.name
    params <- traverse (resolveParam cxt (forgetNamespace name)) (V.toList f.params)
    pure
      ( name
      , ResolvedFuncpointer
          { name
          , returnType
          , returnPointers = f.proto.decl.pointers
          , params = V.fromList params
          , availability = availabilityOf origins
          , origins
          , comment = t.common.comment
          , pos = t.common.pos
          }
      )
   where
    origins = Require.originsFor cxt NsType (forgetNamespace name)

-- | Collect every base type (infallible).
resolveBasetypes
  :: (HasType Requirements cxt, HasType Symbols cxt) => cxt -> Map TypeName ResolvedBasetype
resolveBasetypes cxt =
  Map.fromList
    [ ( name
      , ResolvedBasetype
          { name
          , body = b.body
          , availability = availabilityOf origins
          , origins
          , pos = t.common.pos
          }
      )
    | (name, t) <- Map.toAscList (cxt ^. typed @Symbols . #types)
    , let origins = Require.originsFor cxt NsType (forgetNamespace name)
    , TBasetype b <- [t.body]
    ]

-- | Collect every define (infallible).
resolveDefines
  :: (HasType Requirements cxt, HasType Symbols cxt) => cxt -> Map TypeName ResolvedDefine
resolveDefines cxt =
  Map.fromList
    [ ( name
      , ResolvedDefine
          { name
          , body = d.body
          , availability = availabilityOf origins
          , origins
          , deprecation = deprecationFor cxt NsType (forgetNamespace name) t.common.deprecated
          , protect = Nothing
          , comment = t.common.comment
          , pos = t.common.pos
          }
      )
    | (name, t) <- Map.toAscList (cxt ^. typed @Symbols . #types)
    , let origins = Require.originsFor cxt NsType (forgetNamespace name)
    , TDefine d <- [t.body]
    ]

-- | Collect every external (platform\/C) type (infallible).
resolveExternals
  :: (HasType Requirements cxt, HasType Symbols cxt) => cxt -> Map TypeName ResolvedExternal
resolveExternals cxt =
  Map.fromList
    [ ( name
      , ResolvedExternal
          { name
          , header = t.common.requires
          , availability = availabilityOf origins
          , origins
          , pos = t.common.pos
          }
      )
    | (name, t) <- Map.toAscList (cxt ^. typed @Symbols . #types)
    , let origins = Require.originsFor cxt NsType (forgetNamespace name)
    , TExternal _ <- [t.body]
    ]

-- | The materialized value names of one enum block (empty when the block is
-- not materialized).
blockValueNames :: MaterializedEnums -> TypeName -> Set EnumValueName
blockValueNames materialized blockName = case Map.lookup blockName materialized.blocks of
  Nothing -> Set.empty
  Just b -> Set.fromList [v.name | v <- V.toList b.values]
