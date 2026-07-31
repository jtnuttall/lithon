{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Struct marshal planning (generate pass g4).
--
-- Classifies every struct into a tier and, for the marshalled tier, plans
-- each member's emission:
--
-- * __POD__ structs (no pointers, no dispatchable handles, transitively):
--   real 'Foreign.Storable.Storable' instances, block-copyable.
-- * __Marshalled__ structs: high-level records — counted pointer+length
--   pairs collapse to @Vector@s (shared counts are driven by the first
--   array in declaration order and length-checked against the rest),
--   strings to @ByteString@, optional pointers to @Maybe@, @sType@ written
--   automatically, @pNext@ becoming a 'Lithon.Core.Chain.Chain' type
--   parameter on extensible structs — all poked through the arena.
--
-- A small hand-audited set of guards covers the registry's genuinely odd
-- members (latexmath lengths like @codeSize \/ 4@, out-arrays inside input
-- structs like @VkPresentInfoKHR.pResults@, array-of-pointer alternates
-- like @ppGeometries@); everything else classifies mechanically, and
-- anything that doesn't is a loud 'MarshalError'.
module Lithon.Codegen.Vulkan.Generate.Marshal (
  StructTiers (..),
  CountPlan (..),
  FieldPlan (..),
  StructPlan (..),
  StructPlans (..),
  MarshalError (..),
  planStructs,
) where

import Data.Aeson (ToJSON)
import Data.Map.Lazy qualified as ML
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Generate.Layout (FieldLayout (..), Layouts (..), StructLayout (..))
import Lithon.Codegen.Backend.Hs (lowerFirst, startsUpper)
import Lithon.Codegen.Vulkan.Generate.Lower (
  CPrim (..),
  CType (..),
  Lowered (..),
  LoweredMember (..),
 )
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Micro.Common (Raw (..))
import Lithon.Codegen.Vulkan.Registry.Micro.Len (LenLevel (..), LenSpec (..))
import Lithon.Codegen.Vulkan.Registry.Types.Enums (EnumsKind (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBitmask (..),
  ResolvedHandle (..),
  ResolvedMember (..),
  ResolvedStruct (..),
  ResolvedTypeRef (..),
  StructKind (..),
  TypeRefKind (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (ResolvedEnumBlock (..), ResolvedEnumItem (..))
import Lithon.Codegen.Vulkan.Resolved.Enums.Value (EnumNumber (..))
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))

data StructTiers = StructTiers
  { pods :: !(Set TypeName)
  , peekable :: !(Set TypeName)
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | How a collapsed array's C count member is produced.
data CountPlan
  = CountSibling
      { member :: Text
      -- ^ The dropped count member's C name.
      , offset :: Int
      , wide :: Bool
      -- ^ True: size_t\/uint64-wide count; else uint32.
      , scale :: Int
      -- ^ C count = scale × element count (@codeSize@ = 4 × words).
      , drives :: Bool
      -- ^ False: another array already wrote it; length-check instead.
      , driver :: Text
      -- ^ The driving array's C member name (== the field name when
      -- @drives@).
      }
  | -- | The length references a live field (@pSampleMask@): poke the array,
    -- manage no count.
    CountIndependent
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | One member's emission plan (offsets from layout).
data FieldPlan
  = FScalar {field :: Text, offset :: Int, ctype :: CType}
  | FSType {offset :: Int, wire :: Integer}
  | FChainNext {offset :: Int}
  | FPNextNull {offset :: Int}
  | FVector
      { field :: Text
      , offset :: Int
      , elemTy :: TypeName
      , elemSome :: Bool
      , count :: CountPlan
      , isOptional :: Bool
      }
  | FVectorScalar
      { field :: Text
      , offset :: Int
      , elemC :: CType
      , count :: CountPlan
      , isOptional :: Bool
      }
  | FStructPtr
      { field :: Text
      , offset :: Int
      , target :: TypeName
      , targetSome :: Bool
      , isOptional :: Bool
      }
  | FString {field :: Text, offset :: Int, isOptional :: Bool}
  | FStringVector {field :: Text, offset :: Int, count :: CountPlan}
  | FBytes {field :: Text, offset :: Int, count :: CountPlan}
  | FBytesConst {field :: Text, offset :: Int, len :: Int}
  | -- | Deliberately un-modeled pointer (out-arrays inside input structs,
    -- array-of-pointer alternates): surfaced as @Ptr ()@ with docs.
    FRawPtr {field :: Text, offset :: Int}
  | FFunPtr {field :: Text, offset :: Int, pfn :: TypeName}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data StructPlan
  = PodPlan
  | UnionPlan
  | MarshalPlan
      { fields :: [FieldPlan]
      , extensible :: Bool
      , extends :: [TypeName]
      , sTypeWire :: Maybe Integer
      , chainOffset :: Maybe Int
      }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data StructPlans = StructPlans
  { plans :: Map TypeName StructPlan
  , tiers :: StructTiers
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data MarshalError
  = MUnplannable {struct :: Text, member :: Text, reason :: Text}
  | MNoSTypeValue {struct :: Text, item :: Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display MarshalError where
  displayBuilder =
    displayBuilder @Text . \case
      MUnplannable{struct, member, reason} ->
        "cannot plan " <> struct <> "." <> member <> ": " <> reason
      MNoSTypeValue{struct, item} ->
        "no StructureType wire value for " <> struct <> " (" <> item <> ")"

-- | Plan every curated struct.
planStructs
  :: ( HasType ResolvedRegistry cxt
     , HasType Lowered cxt
     , HasType Layouts cxt
     )
  => cxt
  -> Validation (Errors MarshalError) StructPlans
planStructs cxt =
  mkPlans <$> traverse planOne (Map.toList registry.structs)
 where
  registry = getTyped @ResolvedRegistry cxt
  lowered = getTyped @Lowered cxt
  layouts' = getTyped @Layouts cxt

  mkPlans planned =
    let plans = Map.fromList planned
     in StructPlans
          { plans
          , tiers = StructTiers{pods = podSet, peekable = peekSet plans}
          }

  -- ── tiers ───────────────────────────────────────────────────────────

  podSet = Set.fromList [k | (k, True) <- ML.toList podMap]
  podMap :: ML.Map TypeName Bool
  podMap =
    ML.fromList
      [ (name, all (podOk . (.ctype)) members)
      | (name, members) <- Map.toList lowered.structs
      ]
  podOk = \case
    CPtr -> False
    CFuncPtr _ -> False
    CHandleD _ -> False
    CStructRef t -> ML.findWithDefault False t podMap
    CArray _ e -> podOk e
    _ -> True

  -- Peekability over the finished plans: existential chain elements block
  -- read-back (their @es@ can't be known); everything else — including
  -- deliberately raw pointers — peeks.
  peekSet plans = Set.fromList [k | (k, True) <- ML.toList m]
   where
    m =
      ML.fromList
        [ (name, peekablePlan plan)
        | (name, plan) <- Map.toList plans
        ]
    peekablePlan = \case
      PodPlan -> True
      UnionPlan -> True
      MarshalPlan{fields} -> all fieldPeeks fields
    fieldPeeks = \case
      FVector{elemSome, elemTy} ->
        not elemSome && ML.findWithDefault True elemTy m
      FStructPtr{targetSome, target} ->
        not targetSome && ML.findWithDefault True target m
      FScalar{ctype = CStructRef t} -> ML.findWithDefault True t m
      _ -> True

  -- ── per-struct planning ─────────────────────────────────────────────

  planOne (name, s)
    | Set.member name podSet =
        Success (name, if s.kind == SKUnion then UnionPlan else PodPlan)
    | s.kind == SKUnion =
        -- Non-POD unions (pointer arms, the device-or-host addresses):
        -- they still poke through their raw layout via the containing
        -- struct; a dedicated typed treatment lands with the RT build
        -- wrappers. Plan as unions so containers can reference them.
        Success (name, UnionPlan)
    | otherwise = case Map.lookup name layouts'.layouts of
        Nothing ->
          failing
            MUnplannable
              { struct = forgetNamespace name
              , member = "<layout>"
              , reason = "missing layout"
              }
        Just layout -> planMarshal name s layout

  planMarshal name s layout =
    finish <$> traverse (planMember name s countRoles layout) pairs
   where
    pairs = zip (V.toList s.members) layout.fields
    countRoles = countRolesOf s
    finish fps =
      ( name
      , MarshalPlan
          { fields = catMaybes fps
          , extensible = not (null s.extendedBy)
          , extends = s.extends
          , sTypeWire = sTypeWireOf s
          , chainOffset = pNextOffset
          }
      )
    pNextOffset = case [f.offset | (m, f) <- pairs, m.name == "pNext"] of
      (o : _) -> Just o
      [] -> Nothing

  -- Count members: sibling names referenced by single-segment len paths,
  -- plus the hand-known @codeSize@. Arrays listed in reference order.
  countRolesOf s =
    Map.fromListWith (flip (<>))
      $ [ (countName, [m.name])
        | m <- V.toList s.members
        , Just countName <- [singleSiblingLen m]
        ]
      <> [ ("codeSize", ["pCode"])
         | s.sType == Just "VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO"
         ]
  singleSiblingLen m = case m.len of
    Just Raw{parsed = LenSpec (LenPath (p :| []) :| _)} -> Just p
    _ -> Nothing

  sTypeWireOf s = do
    item <- s.sType
    Map.lookup item structureTypeWires
  structureTypeWires =
    Map.fromList
      [ (item.name, wireOf item.value)
      | Just block <- [Map.lookup "VkStructureType" registry.enums]
      , item <- V.toList block.items
      ]
  wireOf = \case
    NumSigned v -> toInteger v
    NumBits w -> toInteger w

  planMember name s countRoles layout (m, fl) = case (forgetNamespace name, m.name) of
    -- ── hand-audited odd members (see module header) ──────────────────
    ("VkPresentInfoKHR", "pResults") -> rawPtr
    ("VkAccelerationStructureBuildGeometryInfoKHR", "ppGeometries") -> rawPtr
    (_, "ppUsageCounts") -> rawPtr -- both micromap owners
    -- fault-info arrays are sized by a sibling struct (VkDeviceFaultCountsEXT),
    -- not a sibling member; the vkGetDeviceFaultInfoEXT override deep-copies
    ("VkDeviceFaultInfoEXT", "pAddressInfos") -> rawPtr
    ("VkDeviceFaultInfoEXT", "pVendorInfos") -> rawPtr
    ("VkDeviceFaultInfoEXT", "pVendorBinaryData") -> rawPtr
    ("VkShaderModuleCreateInfo", "pCode") ->
      ( \o ->
          Just
            FVectorScalar
              { field = "code"
              , offset = fl.offset
              , elemC = CPrim PU32
              , count =
                  CountSibling
                    { member = "codeSize"
                    , offset = o
                    , wide = True
                    , scale = 4
                    , drives = True
                    , driver = "pCode"
                    }
              , isOptional = False
              }
      )
        <$> offsetOf "codeSize"
    (_, "pVersionData") ->
      -- 2 × VK_UUID_SIZE, both version-info structs
      Success (Just FBytesConst{field = "versionData", offset = fl.offset, len = 32})
    ("VkPipelineMultisampleStateCreateInfo", "pSampleMask") ->
      Success
        ( Just
            FVectorScalar
              { field = "sampleMask"
              , offset = fl.offset
              , elemC = CPrim PU32
              , count = CountIndependent
              , isOptional = True
              }
        )
    -- ── mechanical ────────────────────────────────────────────────────
    _
      | m.name == "sType" -> case sTypeWireOf s of
          Just w -> Success (Just FSType{offset = fl.offset, wire = w})
          Nothing -> case s.sType of
            Just item ->
              failing MNoSTypeValue{struct = forgetNamespace name, item = forgetNamespace item}
            Nothing ->
              Success (Just FScalar{field = "sType", offset = fl.offset, ctype = fl.ctype})
      | m.name == "pNext" ->
          Success
            . Just
            $ if null s.extendedBy then
              FPNextNull{offset = fl.offset}
            else
              FChainNext{offset = fl.offset}
      | Map.member m.name countRoles ->
          Success Nothing -- absorbed into the driving array's CountPlan
      | null m.pointers ->
          Success (Just FScalar{field = m.name, offset = fl.offset, ctype = fl.ctype})
      | otherwise -> pointerPlan
   where
    rawPtr = Success (Just FRawPtr{field = m.name, offset = fl.offset})
    offsetOf n =
      case [f.offset | (mm, f) <- zip (V.toList s.members) layout.fields, mm.name == n] of
        (o : _) -> Success o
        [] ->
          failing
            MUnplannable
              { struct = forgetNamespace name
              , member = m.name
              , reason = "sibling '" <> n <> "' not found"
              }
    pointerPlan = case (m.typeRef.kind, m.len) of
      (RefExternal, Just Raw{parsed = LenSpec (LenNullTerminated :| _)})
        | forgetNamespace m.typeRef.name == "char" ->
            Success (Just FString{field = hungarian m.name, offset = fl.offset, isOptional = isOptional m})
      (RefExternal, Just Raw{parsed = LenSpec (LenPath (_ :| []) :| [LenNullTerminated])})
        | forgetNamespace m.typeRef.name == "char" ->
            withCount \c -> FStringVector{field = hungarian m.name, offset = fl.offset, count = c}
      (RefVoid, Just Raw{parsed = LenSpec (LenPath (_ :| []) :| _)}) ->
        withCount \c -> FBytes{field = hungarian m.name, offset = fl.offset, count = c}
      (_, Just Raw{parsed = LenSpec (LenPath (_ :| []) :| _)}) ->
        withCount elemPlan
      (RefStruct, Nothing) -> Success (Just (structPtr m fl))
      (RefUnion, Nothing) -> Success (Just (structPtr m fl))
      (RefVoid, Nothing) ->
        Success (Just FRawPtr{field = m.name, offset = fl.offset})
      (RefFuncpointer, _) ->
        Success (Just FFunPtr{field = hungarian m.name, offset = fl.offset, pfn = m.typeRef.name})
      (_, Nothing) ->
        Success (Just FRawPtr{field = m.name, offset = fl.offset})
      _ ->
        failing
          MUnplannable
            { struct = forgetNamespace name
            , member = m.name
            , reason = "unrecognized pointer/len shape"
            }
    withCount k = case singleSiblingLen m of
      Just countName ->
        Just . k <$> countPlanFor name s countRoles layout countName m.name
      Nothing ->
        failing
          MUnplannable
            { struct = forgetNamespace name
            , member = m.name
            , reason = "counted pointer without a sibling count"
            }
    elemPlan c = case m.typeRef.kind of
      RefStruct ->
        FVector
          { field = hungarian m.name
          , offset = fl.offset
          , elemTy = m.typeRef.name
          , elemSome = extensibleTarget m.typeRef.name
          , count = c
          , isOptional = isOptional m
          }
      RefUnion ->
        FVector
          { field = hungarian m.name
          , offset = fl.offset
          , elemTy = m.typeRef.name
          , elemSome = False
          , count = c
          , isOptional = isOptional m
          }
      _ ->
        FVectorScalar
          { field = hungarian m.name
          , offset = fl.offset
          , elemC = pointeeScalar
          , count = c
          , isOptional = isOptional m
          }
    -- the pointee's scalar shape (the layout field carries CPtr; the
    -- element type is re-derived from the reference)
    pointeeScalar = case m.typeRef.kind of
      RefEnum -> case Map.lookup m.typeRef.name registry.enums of
        Just block
          | block.kind == KindBitmask ->
              CFlagsBits m.typeRef.name block.bitWidth
        _ -> CEnum m.typeRef.name
      RefBitmask -> case Map.lookup m.typeRef.name registry.bitmasks of
        Just bm -> CFlags m.typeRef.name bm.bitWidth
        Nothing -> CPrim PU32
      RefHandle -> case Map.lookup m.typeRef.name registry.handles of
        Just h | h.dispatchable -> CHandleD m.typeRef.name
        _ -> CHandleND m.typeRef.name
      RefBasetype -> case forgetNamespace m.typeRef.name of
        "VkBool32" -> CBool32
        "VkDeviceSize" -> CPrim PU64
        "VkDeviceAddress" -> CPrim PU64
        "VkSampleMask" -> CPrim PU32
        _ -> CPrim PU32
      RefExternal -> case forgetNamespace m.typeRef.name of
        "uint64_t" -> CPrim PU64
        "int64_t" -> CPrim PI64
        "int32_t" -> CPrim PI32
        "float" -> CPrim PFloat
        "double" -> CPrim PDouble
        "uint8_t" -> CPrim PU8
        "uint16_t" -> CPrim PU16
        "size_t" -> CPrim PSizeT
        _ -> CPrim PU32
      _ -> CPrim PU32
    structPtr mm fl' =
      FStructPtr
        { field = hungarian mm.name
        , offset = fl'.offset
        , target = mm.typeRef.name
        , targetSome = extensibleTarget mm.typeRef.name
        , isOptional = isOptional mm
        }

  extensibleTarget t = case Map.lookup t registry.structs of
    Just s -> not (null s.extendedBy)
    Nothing -> False

  isOptional m = case m.isOptional of
    Just (o :| _) -> o
    Nothing -> False

  countPlanFor name s countRoles layout countName arrayName =
    case findCount of
      Just (_, cfl) -> case cfl.ctype of
        CPrim p ->
          Success
            CountSibling
              { member = countName
              , offset = cfl.offset
              , wide = p == PSizeT || p == PU64
              , scale = 1
              , drives = drivesIt
              , driver = hungarian drivingArray
              }
        _ ->
          failing
            MUnplannable
              { struct = forgetNamespace name
              , member = arrayName
              , reason = "count member '" <> countName <> "' is not an integer"
              }
      Nothing
        | any (\mm -> mm.name == countName) (V.toList s.members) ->
            Success CountIndependent
        | otherwise ->
            failing
              MUnplannable
                { struct = forgetNamespace name
                , member = arrayName
                , reason = "count member '" <> countName <> "' not found"
                }
   where
    findCount =
      case [ (mm, fl)
           | (mm, fl) <- zip (V.toList s.members) layout.fields
           , mm.name == countName
           , Map.member countName countRoles
           ] of
        (x : _) -> Just x
        [] -> Nothing
    drivesIt = drivingArray == arrayName
    drivingArray = case Map.lookup countName countRoles of
      Just (firstArray : _) -> firstArray
      _ -> arrayName

  failing :: MarshalError -> Validation (Errors MarshalError) a
  failing = Failure . errors1

-- | @pQueuePriorities@ -> @queuePriorities@, @ppEnabledLayerNames@ ->
-- @enabledLayerNames@ — applied to modeled pointer members only (raw
-- pointers keep their Hungarian names as a deliberate signal).
hungarian :: Text -> Text
hungarian n
  | Just rest <- T.stripPrefix "pp" n, startsUpper rest = lowerFirst rest
  | Just rest <- T.stripPrefix "p" n, startsUpper rest = lowerFirst rest
  | otherwise = n
