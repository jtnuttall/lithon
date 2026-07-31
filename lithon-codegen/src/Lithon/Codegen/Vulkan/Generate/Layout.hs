{-# LANGUAGE OverloadedStrings #-}

-- | C layout computation (generate pass g3) under the LP64\/LLP64-
-- coincident 64-bit ABI lithon targets (32-bit targets are unsupported,
-- deliberately).
--
-- Standard C algorithm: each field lands at the next multiple of its
-- alignment; struct alignment is the max member alignment; struct size
-- rounds up to it. Unions are max-size\/max-align. Fixed arrays multiply
-- (multidimensional dims arrive pre-flattened from lowering).
--
-- Adjacent bitfield members over the same-size base unit merge into
-- __carrier__ fields (one @Word32@\/@Word64@ record field each), with the
-- member shifts\/widths recorded for accessor emission. This matches C's
-- allocation-unit behavior for every construct in the curated surface
-- (verified by the ABI gate, which asserts @sizeof@\/@alignof@\/@offsetof@
-- against real Vulkan headers).
--
-- Structs are processed in dependency order (by-value references form a
-- DAG in legal C; a cycle is a hard error).
module Lithon.Codegen.Vulkan.Generate.Layout (
  FieldLayout (..),
  CarrierBit (..),
  StructLayout (..),
  Layouts (..),
  LayoutError (..),
  computeLayouts,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Backend.Hs (capitalize)
import Lithon.Codegen.Vulkan.Generate.Lower (
  CPrim (..),
  CType (..),
  Lowered (..),
  LoweredMember (..),
  primSizeAlign,
 )
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Types.Enums (BitWidth (..))
import Lithon.Codegen.Vulkan.Resolved.Core (ResolvedStruct (..), StructKind (..))
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))

-- | One laid-out field. Bitfield runs appear as a single carrier field
-- (synthetic name, 'CPrim' carrier type) with the packing recorded in
-- 'StructLayout.carriers'.
data FieldLayout = FieldLayout
  { name :: !Text
  , offset :: !Int
  , ctype :: !CType
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | One original bitfield member inside a carrier.
data CarrierBit = CarrierBit
  { member :: !Text
  , shift :: !Int
  , width :: !Int
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data StructLayout = StructLayout
  { size :: !Int
  , align :: !Int
  , fields :: ![FieldLayout]
  -- ^ In declaration order; for unions every offset is 0.
  , carriers :: !(Map Text [CarrierBit])
  -- ^ Carrier field name -> packed members (LSB-first).
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

newtype Layouts = Layouts
  { layouts :: Map TypeName StructLayout
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data LayoutError
  = LayoutCycle {trail :: ![Text]}
  | LayoutMissing {struct :: !Text, member :: !Text, target :: !Text}
  | LayoutBitfieldOverflow {struct :: !Text, member :: !Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display LayoutError where
  displayBuilder =
    displayBuilder @Text . \case
      LayoutCycle{trail} ->
        "by-value struct reference cycle: " <> T.intercalate " -> " trail
      LayoutMissing{struct, member, target} ->
        "no layout for by-value reference '"
          <> target
          <> "' ("
          <> struct
          <> "."
          <> member
          <> ")"
      LayoutBitfieldOverflow{struct, member} ->
        "bitfield does not fit its base unit: " <> struct <> "." <> member

-- | Lay out every lowered struct and union.
computeLayouts
  :: (HasType Lowered cxt, HasType ResolvedRegistry cxt)
  => cxt
  -> Validation (Errors LayoutError) Layouts
computeLayouts cxt = case go Map.empty Set.empty (Map.keys lowered.structs) of
  Right done -> Success (Layouts done)
  Left err -> Failure (errors1 err)
 where
  lowered = getTyped @Lowered cxt
  registry = getTyped @ResolvedRegistry cxt

  isUnion name = case Map.lookup name registry.structs of
    Just s -> s.kind == SKUnion
    Nothing -> False

  -- DFS with memo + on-stack cycle detection.
  go done _ [] = Right done
  go done stack (name : rest)
    | Map.member name done = go done stack rest
    | otherwise = do
        done' <- visit done stack name
        go done' stack rest

  visit done stack name
    | Map.member name done = Right done
    | Set.member name stack =
        Left LayoutCycle{trail = map forgetNamespace (toList stack) <> [forgetNamespace name]}
    | otherwise = do
        let members = fromMaybe [] (Map.lookup name lowered.structs)
            stack' = Set.insert name stack
        -- lay out every by-value dependency first
        done' <- foldlM (`visit` stack') done (deps members)
        layout <- layoutOne done' name members
        pure (Map.insert name layout done')

  deps members =
    ordNub [t | m <- members, t <- ctypeDeps m.ctype]
  ctypeDeps = \case
    CStructRef t -> [t]
    CArray _ e -> ctypeDeps e
    _ -> []

  layoutOne done name members
    | isUnion name = unionLayout done name members
    | otherwise = structLayout done name members

  sizeAlignOf done owner memberName = \case
    CPrim p -> Right (primSizeAlign p)
    CBool32 -> Right (4, 4)
    CEnum _ -> Right (4, 4)
    CFlags _ w -> Right case w of W32 -> (4, 4); W64 -> (8, 8)
    CFlagsBits _ w -> Right case w of W32 -> (4, 4); W64 -> (8, 8)
    CHandleND _ -> Right (8, 8)
    CHandleD _ -> Right (8, 8)
    CPtr -> Right (8, 8)
    CFuncPtr _ -> Right (8, 8)
    CStructRef t -> case Map.lookup t done of
      Just l -> Right (l.size, l.align)
      Nothing ->
        Left LayoutMissing{struct = forgetNamespace owner, member = memberName, target = forgetNamespace t}
    CArray n e -> do
      (es, ea) <- sizeAlignOf done owner memberName e
      Right (fromIntegral n * es, ea)
    CBitfield _ p -> Right (primSizeAlign p)
    CPlatform _ -> Right (8, 8)

  structLayout done name members = do
    (flds, cars, off, maxAl) <- foldlM step ([], Map.empty, 0, 1) (groupBitfields members)
    let al = max 1 maxAl
        sz = alignUp off al
    pure
      StructLayout
        { size = max 1 sz -- C structs are never zero-sized
        , align = al
        , fields = reverse flds
        , carriers = cars
        }
   where
    step (flds, cars, off, maxAl) = \case
      Plain m -> do
        (s, a) <- sizeAlignOf done name m.name m.ctype
        let o = alignUp off a
        pure
          ( FieldLayout{name = m.name, offset = o, ctype = m.ctype} : flds
          , cars
          , o + s
          , max maxAl a
          )
      Packed carrierPrim bits -> do
        let (s, a) = primSizeAlign carrierPrim
            unitBits = s * 8
        case find (\(_, w) -> w > unitBits) bits of
          Just (mn, _) ->
            Left LayoutBitfieldOverflow{struct = forgetNamespace name, member = mn}
          Nothing -> pure ()
        -- C allocation units: a bitfield that does not fit the remaining
        -- space of the current unit starts a new one.
        let units = splitIntoUnits unitBits bits
            emitUnit (flds', cars', off', maxAl') unit =
              let o = alignUp off' a
                  carrierName = carrierNameOf unit
               in ( FieldLayout{name = carrierName, offset = o, ctype = CPrim carrierPrim} : flds'
                  , Map.insert carrierName unit cars'
                  , o + s
                  , max maxAl' a
                  )
        pure (foldl' emitUnit (flds, cars, off, maxAl) units)

    splitIntoUnits unitBits bits =
      let step' (units, cur, sh) (mn, w)
            | sh + w > unitBits =
                (reverse cur : units, [CarrierBit{member = mn, shift = 0, width = w}], w)
            | otherwise =
                (units, CarrierBit{member = mn, shift = sh, width = w} : cur, sh + w)
          (units', cur', _) = foldl' step' ([], [], 0) bits
       in reverse (if null cur' then units' else reverse cur' : units')

  unionLayout done name members = do
    sas <- traverse (\m -> sizeAlignOf done name m.name m.ctype) members
    let al = max 1 (foldl' max 1 (snd <$> sas))
        sz = alignUp (foldl' max 1 (fst <$> sas)) al
    pure StructLayout{size = sz, align = al, fields = unionFields, carriers = Map.empty}
   where
    unionFields =
      [FieldLayout{name = m.name, offset = 0, ctype = m.ctype} | m <- members]

  carrierNameOf packed = case packed of
    [] -> "packedBits"
    (b : rest) ->
      b.member
        <> mconcat ["And" <> capitalize r.member | r <- rest]

alignUp :: Int -> Int -> Int
alignUp off a = ((off + a - 1) `div` a) * a

-- | Group a member list into plain members and same-unit bitfield runs.
data MemberGroup
  = Plain LoweredMember
  | Packed CPrim [(Text, Int)]

groupBitfields :: [LoweredMember] -> [MemberGroup]
groupBitfields = go
 where
  go [] = []
  go (m : ms) = case m.ctype of
    CBitfield w p ->
      let (run, rest) = spanRun p ms
       in Packed p ((m.name, w) : run) : go rest
    _ -> Plain m : go ms
  spanRun p = \case
    (m : ms)
      | CBitfield w q <- m.ctype
      , samePrimSize p q ->
          let (run, rest) = spanRun p ms
           in ((m.name, w) : run, rest)
    ms -> ([], ms)
  samePrimSize p q = fst (primSizeAlign p) == fst (primSizeAlign q)
