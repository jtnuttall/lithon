{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Enum-value materialization: every literal encoding becomes a number.
--
-- Inputs are the definition sites the symbol pass collected (block items
-- plus require-block additions). Per name, every site's value is computed
-- and all must agree — the same name added by several sources (promoted
-- pairs) merges silently only when the numbers match; a mismatch is an
-- error, never a silent pick. Offset encodings use the site's explicit
-- @extnumber=@ or fall back to the enclosing extension's number.
--
-- Outputs are pass-local: 'MaterializedBlock's (values in block document
-- order followed by additions sorted by value) and the
-- 'MaterializedConstant' table (API constants plus extension-local
-- SPEC_VERSION\/EXTENSION_NAME definitions). The resolved-IR assembly later
-- attaches aliases and availability.
module Lithon.Codegen.Vulkan.Resolve.Enums (
  MaterializedEnums (..),
  MaterializedBlock (..),
  MaterializedValue (..),
  MaterializedConstant (..),
  EnumError (..),
  offsetValue,
  materializeEnums,
) where

import Data.Aeson (ToJSON)
import Data.Bits (bit, complement)
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (ProtectExpr)
import Lithon.Codegen.Vulkan.Registry.Micro.Literal (
  ComplementWidth (..),
  ValueLiteral (..),
 )
import Lithon.Codegen.Vulkan.Registry.Types.Common (Deprecation, Raw (..))
import Lithon.Codegen.Vulkan.Registry.Types.Enums (
  BitWidth (..),
  EnumDef (..),
  EnumValueSpec (..),
  EnumValueType (..),
  EnumsBlock (..),
  EnumsItem (..),
  EnumsKind (..),
  declaredType,
 )
import Lithon.Codegen.Vulkan.Registry.Types.Features (Extension (..))
import Lithon.Codegen.Vulkan.Resolve.Aliases (Aliases (..), canonicalize)
import Lithon.Codegen.Vulkan.Resolve.Require (Requirements (..))
import Lithon.Codegen.Vulkan.Resolve.Symbols (
  EnumValueSite (..),
  SymbolProvenance (..),
  Symbols (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Avail (InterfaceItemNamespace (..), ItemKey (..), Origin)
import Lithon.Codegen.Vulkan.Resolved.Enums.Value (
  ConstantValue (..),
  EnumNumber (..),
  ValueEncoding (..),
 )
import Lithon.Codegen.Vulkan.Xml.Types (Pos)

data MaterializedValue = MaterializedValue
  { name :: EnumValueName
  , value :: EnumNumber
  , encoding :: ValueEncoding
  -- ^ From the first definition site (encounts order).
  , origins :: [Origin]
  -- ^ Require-sites referencing this value; empty means block-native and
  -- never individually required.
  , protect :: Maybe (Raw ProtectExpr)
  , deprecated :: Maybe Deprecation
  , comment :: Maybe Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

data MaterializedBlock = MaterializedBlock
  { name :: TypeName
  , kind :: EnumsKind
  , bitWidth :: BitWidth
  , comment :: Maybe Text
  , values :: Vector MaterializedValue
  -- ^ Block-native values in document order, then additions sorted by
  -- (value, name) — deterministic regardless of walk order.
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

data MaterializedConstant = MaterializedConstant
  { name :: EnumValueName
  , value :: ConstantValue
  , origins :: [Origin]
  , deprecated :: Maybe Deprecation
  , comment :: Maybe Text
  , pos :: Pos
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

data MaterializedEnums = MaterializedEnums
  { blocks :: Map TypeName MaterializedBlock
  -- ^ @KindEnum@ and @KindBitmask@ blocks only.
  , constants :: Map EnumValueName MaterializedConstant
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

data EnumError
  = EnumValueClash
      { name :: EnumValueName
      , placement :: Text
      , first :: Text
      , conflicting :: Text
      , pos :: Pos
      }
  | EnumPlacementConflict {name :: EnumValueName, placements :: [Text], pos :: Pos}
  | OffsetWithoutExtNumber {name :: EnumValueName, pos :: Pos}
  | EncodingMismatch
      { name :: EnumValueName
      , placement :: Text
      , detail :: Text
      , pos :: Pos
      }
  | BitposOutOfRange {name :: EnumValueName, block :: EnumsBlockName, bitpos :: Int, pos :: Pos}
  | ValueOutOfRange {name :: EnumValueName, block :: EnumsBlockName, rendered :: Text, pos :: Pos}
  | UnclassifiedLiteral {name :: EnumValueName, raw :: Text, pos :: Pos}
  | AliasAnnotationMismatch {name :: EnumValueName, annotated :: EnumValueName, pos :: Pos}
  | UnknownBlock {name :: EnumValueName, block :: EnumsBlockName, pos :: Pos}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display EnumError where
  displayBuilder =
    displayBuilder @Text . \case
      EnumValueClash{name, placement, first = firstValue, conflicting} ->
        "conflicting values for "
          <> display name
          <> " in "
          <> placement
          <> ": "
          <> firstValue
          <> " vs "
          <> conflicting
      EnumPlacementConflict{..} ->
        display name <> " is defined into different places: " <> T.intercalate ", " placements
      OffsetWithoutExtNumber{..} ->
        "offset-encoded " <> display name <> " has no extension number"
      EncodingMismatch{..} ->
        display name <> " in " <> placement <> ": " <> detail
      BitposOutOfRange{..} ->
        display name <> " bitpos " <> T.show bitpos <> " exceeds the width of " <> display block
      ValueOutOfRange{..} ->
        display name <> " value " <> rendered <> " does not fit " <> display block
      UnclassifiedLiteral{..} ->
        display name <> " has an unclassifiable value literal: " <> raw
      AliasAnnotationMismatch{..} ->
        display name <> " and its annotated alias " <> display annotated <> " have different values"
      UnknownBlock{..} ->
        display name <> " extends unknown enums block " <> display block

-- | The registry's extension-enum offset formula.
offsetValue :: Int -> Int -> Bool -> Int64
offsetValue extNumber offset negative =
  signOf (1000000000 + fromIntegral (extNumber - 1) * 1000 + fromIntegral offset)
 where
  signOf n = if negative then negate n else n

-- | Placement and result of one materialized definition site.
data Placed
  = PlacedEnum EnumsBlockName EnumNumber ValueEncoding
  | PlacedConstant ConstantValue ValueEncoding
  deriving stock (Eq, Show)

-- | The block a placement targets (@"constants"@ for the constant table).
placementOf :: Placed -> Text
placementOf = \case
  PlacedEnum blockName _ _ -> forgetNamespace blockName
  PlacedConstant _ _ -> "constants"

-- | Rendered value, for clash reporting.
renderedOf :: Placed -> Text
renderedOf = \case
  PlacedEnum _ n _ -> display n
  PlacedConstant c _ -> display c

-- | The comparable payload of a placement (encoding-independent).
numberOf :: Placed -> Either EnumNumber ConstantValue
numberOf = \case
  PlacedEnum _ n _ -> Left n
  PlacedConstant c _ -> Right c

-- | Every name's definition sites, placed and merged — the pivot between
-- site placement and output assembly.
type PlacedSites = Map EnumValueName (Placed, NonEmpty EnumValueSite)

materializeEnums
  :: ( HasType Symbols cxt
     , HasType Aliases cxt
     , HasType Requirements cxt
     )
  => cxt
  -> Validation (Errors EnumError) MaterializedEnums
materializeEnums cxt = failUnlessEmpty errors materialized
 where
  symbols = getTyped @Symbols cxt
  aliases = getTyped @Aliases cxt
  requirements = getTyped @Requirements cxt

  (mergeErrors, resolved) = resolveSites symbols
  errors = mergeErrors <> annotationErrors aliases resolved
  materialized =
    MaterializedEnums
      { blocks = materializeBlocks requirements symbols resolved
      , constants = materializeConstants requirements resolved
      }

-- Site placement: compute every definition site's number and target block,
-- and require all sites of one name to agree.

-- | Per name: place every non-alias site and require agreement.
resolveSites :: Symbols -> ([EnumError], PlacedSites)
resolveSites symbols = (mergeErrors, Map.fromList resolvedKvs)
 where
  perName =
    [ (name, mergeSites symbols name defSites)
    | (name, allSites) <- Map.toAscList symbols.enumValues
    , defSites <- maybeToList (NE.nonEmpty (NE.filter (not . isAliasSite) allSites))
    ]
  (mergeErrors, resolvedKvs) =
    first concat $ partitionWith (\(name, r) -> (name,) <$> r) perName

isAliasSite :: EnumValueSite -> Bool
isAliasSite site = case site.def.spec of
  EvAlias _ -> True
  _ -> False

-- | Place all definition sites of one name; every placement must agree.
mergeSites
  :: Symbols
  -> EnumValueName
  -> NonEmpty EnumValueSite
  -> Either [EnumError] (Placed, NonEmpty EnumValueSite)
mergeSites symbols name defSites =
  case partitionEithers (map (placeSite symbols name) (NE.toList defSites)) of
    (e : es, _) -> Left (e : es)
    ([], []) -> Left [] -- unreachable: defSites is nonempty
    ([], p0 : rest) -> case concatMap (agreeWith p0) rest of
      [] -> Right (p0, defSites)
      conflicts -> Left conflicts
 where
  firstPos = NE.head defSites ^. #def . #pos
  agreeWith p0 p
    | placementOf p0 /= placementOf p =
        [EnumPlacementConflict{name, placements = [placementOf p0, placementOf p], pos = firstPos}]
    | renderedOf p0 /= renderedOf p =
        [ EnumValueClash
            { name
            , placement = placementOf p0
            , first = renderedOf p0
            , conflicting = renderedOf p
            , pos = firstPos
            }
        ]
    | otherwise = []

-- | Compute one site's placement and number.
placeSite :: Symbols -> EnumValueName -> EnumValueSite -> Either EnumError Placed
placeSite symbols name site = case site.block of
  Nothing -> placeConstant name site
  Just blockName -> case Map.lookup blockName symbols.enumsBlocks of
    Nothing -> Left UnknownBlock{name, block = blockName, pos = site.def.pos}
    Just b
      | b.kind == KindConstants -> placeConstant name site
      | otherwise -> placeEnum symbols name site b

placeEnum :: Symbols -> EnumValueName -> EnumValueSite -> EnumsBlock -> Either EnumError Placed
placeEnum symbols name site b = case site.def.spec of
  EvValue raw _ -> case raw.parsed of
    VInt n -> do
      number <- case b.kind of
        KindEnum -> signedIn name b n site.def.pos
        _ -> bitsIn name b n site.def.pos
      Right (PlacedEnum b.name number (FromLiteral raw))
    VExpr e -> Left UnclassifiedLiteral{name, raw = e, pos = site.def.pos}
    other ->
      Left
        EncodingMismatch
          { name
          , placement = forgetNamespace b.name
          , detail = "unexpected literal form " <> display other
          , pos = site.def.pos
          }
  EvBitpos n _
    | b.kind == KindBitmask ->
        if n >= 0 && n < widthBits b.bitWidth then
          Right (PlacedEnum b.name (NumBits (bit n)) (FromBitpos n))
        else
          Left BitposOutOfRange{name, block = b.name, bitpos = n, pos = site.def.pos}
    | otherwise ->
        Left
          EncodingMismatch
            { name
            , placement = forgetNamespace b.name
            , detail = "bitpos encoding outside a bitmask block"
            , pos = site.def.pos
            }
  EvOffset{offset, negative}
    | b.kind /= KindEnum ->
        Left
          EncodingMismatch
            { name
            , placement = forgetNamespace b.name
            , detail = "offset encoding outside a plain enum block"
            , pos = site.def.pos
            }
    | otherwise -> do
        extNumber <- case site.def.extNumber of
          Just n -> Right n
          Nothing -> case site.declaredIn of
            InExtension{extension} ->
              case Map.lookup extension symbols.extensions of
                Just e -> Right e.number
                Nothing -> Left OffsetWithoutExtNumber{name, pos = site.def.pos}
            _ -> Left OffsetWithoutExtNumber{name, pos = site.def.pos}
        let number = offsetValue extNumber offset negative
        Right (PlacedEnum b.name (NumSigned number) FromOffset{extNumber, offset, negative})
  EvAlias _ ->
    Left
      EncodingMismatch
        { name
        , placement = forgetNamespace b.name
        , detail = "alias site reached materialization"
        , pos = site.def.pos
        }
  EvNone ->
    Left
      EncodingMismatch
        { name
        , placement = forgetNamespace b.name
        , detail = "bare reference collected as a definition"
        , pos = site.def.pos
        }

signedIn :: EnumValueName -> EnumsBlock -> Integer -> Pos -> Either EnumError EnumNumber
signedIn name b n pos
  | b.bitWidth == W32 && (n < -2147483648 || n > 2147483647) =
      Left ValueOutOfRange{name, block = b.name, rendered = T.show n, pos}
  | n < fromIntegral (minBound :: Int64) || n > fromIntegral (maxBound :: Int64) =
      Left ValueOutOfRange{name, block = b.name, rendered = T.show n, pos}
  | otherwise = Right (NumSigned (fromIntegral n))

bitsIn :: EnumValueName -> EnumsBlock -> Integer -> Pos -> Either EnumError EnumNumber
bitsIn name b n pos
  | n < 0 || n >= 2 ^ widthBits b.bitWidth =
      Left ValueOutOfRange{name, block = b.name, rendered = T.show n, pos}
  | otherwise = Right (NumBits (fromIntegral n))

widthBits :: BitWidth -> Int
widthBits = \case
  W32 -> 32
  W64 -> 64

placeConstant :: EnumValueName -> EnumValueSite -> Either EnumError Placed
placeConstant name site = case site.def.spec of
  EvValue raw _ -> case raw.parsed of
    VInt n -> case site.def.valueType of
      Just EVTUInt32
        | n >= 0 && n <= fromIntegral (maxBound :: Word32) ->
            ok (ConstU32 (fromIntegral n)) raw
        | otherwise -> outOfRange n
      Just EVTUInt64
        | n >= 0 && n <= fromIntegral (maxBound :: Word64) ->
            ok (ConstU64 (fromIntegral n)) raw
        | otherwise -> outOfRange n
      Just EVTFloat -> mismatch "integer literal typed as float"
      Nothing -> ok (ConstInt n) raw
    VComplement k width -> case (width, site.def.valueType) of
      (CW32, vt)
        | vt == Just EVTUInt32 || isNothing vt ->
            ok (ConstU32 (complement (fromIntegral k))) raw
      (CW64, vt)
        | vt == Just EVTUInt64 || isNothing vt ->
            ok (ConstU64 (complement (fromIntegral k))) raw
      _ -> mismatch "complement width disagrees with declared type"
    VFloat s
      | site.def.valueType == Just EVTFloat || isNothing site.def.valueType ->
          ok (ConstFloat s) raw
      | otherwise -> mismatch "float literal with non-float declared type"
    VString s -> ok (ConstString s) raw
    VExpr e -> Left UnclassifiedLiteral{name, raw = e, pos = site.def.pos}
  _ -> mismatch "non-value encoding outside an enum block"
 where
  ok cv raw = Right (PlacedConstant cv (FromLiteral raw))
  outOfRange n =
    Left
      ValueOutOfRange
        { name
        , block = "constants"
        , rendered = T.show n
        , pos = site.def.pos
        }
  mismatch detail =
    Left
      EncodingMismatch{name, placement = "constants", detail, pos = site.def.pos}

-- Assembly: project the placed sites into materialized blocks and the
-- constant table.

-- | Alias annotations alongside value/bitpos must agree with their target.
annotationErrors :: Aliases -> PlacedSites -> [EnumError]
annotationErrors aliases resolved =
  [ AliasAnnotationMismatch{name, annotated, pos = site.def.pos}
  | (name, (placed, sites)) <- Map.toList resolved
  , site <- NE.toList sites
  , annotated <- maybeToList (annotationOf site.def.spec)
  , let target = canonicalize aliases.enumValues annotated
  , not (annotationAgrees placed (Map.lookup target resolved))
  ]
 where
  annotationAgrees placed = \case
    Nothing -> False
    Just (other, _) -> numberOf placed == numberOf other

-- | The alias annotation carried alongside a value\/bitpos, when present.
annotationOf :: EnumValueSpec -> Maybe EnumValueName
annotationOf = \case
  EvValue _ a -> a
  EvBitpos _ a -> a
  _ -> Nothing

-- | Assemble blocks: native values in document order, additions sorted by
-- (value, name). Keyed by each block's declared type; the API-Constants
-- block ('KindConstants') declares none and feeds the constants table.
materializeBlocks :: Requirements -> Symbols -> PlacedSites -> Map TypeName MaterializedBlock
materializeBlocks requirements symbols resolved =
  Map.fromList
    [ (typeName, materializeBlock requirements resolved typeName b)
    | b <- Map.elems symbols.enumsBlocks
    , typeName <- maybeToList (declaredType b)
    ]

materializeBlock :: Requirements -> PlacedSites -> TypeName -> EnumsBlock -> MaterializedBlock
materializeBlock requirements resolved typeName b =
  MaterializedBlock
    { name = typeName
    , kind = b.kind
    , bitWidth = b.bitWidth
    , comment = b.comment
    , values = V.fromList (natives <> additions)
    , pos = b.pos
    }
 where
  nativeNames =
    [ d.name
    | ItemEnum d <- V.toList b.items
    , case d.spec of EvAlias _ -> False; _ -> True
    ]
  natives = mapMaybe (valueFor requirements resolved) nativeNames
  nativeSet = Map.fromList (map (,()) nativeNames)
  additions =
    sortOn
      sortKey
      [ v
      | (name, (PlacedEnum blockName _ _, _)) <- Map.toList resolved
      , blockName == b.name
      , not (Map.member name nativeSet)
      , v <- maybeToList (valueFor requirements resolved name)
      ]
  sortKey v = (numKey v.value, v.name)
  numKey = \case
    NumSigned n -> Left n
    NumBits n -> Right n

-- | The materialized value of a placed enum name, when it is one.
valueFor :: Requirements -> PlacedSites -> EnumValueName -> Maybe MaterializedValue
valueFor requirements resolved name = case Map.lookup name resolved of
  Just (PlacedEnum _ number encoding, sites) ->
    Just (mkValue requirements name number encoding sites)
  _ -> Nothing

mkValue
  :: Requirements
  -> EnumValueName
  -> EnumNumber
  -> ValueEncoding
  -> NonEmpty EnumValueSite
  -> MaterializedValue
mkValue requirements name number encoding sites =
  MaterializedValue
    { name
    , value = number
    , encoding
    , origins = originsOf requirements name
    , protect = firstDef.protect
    , deprecated = firstDef.deprecated
    , comment = firstDef.comment
    , pos = firstDef.pos
    }
 where
  firstDef = firstDefOf sites

materializeConstants :: Requirements -> PlacedSites -> Map EnumValueName MaterializedConstant
materializeConstants requirements resolved =
  Map.fromList
    [ (name, mkConstant requirements name cv sites)
    | (name, (PlacedConstant cv _, sites)) <- Map.toList resolved
    ]

mkConstant
  :: Requirements -> EnumValueName -> ConstantValue -> NonEmpty EnumValueSite -> MaterializedConstant
mkConstant requirements name cv sites =
  MaterializedConstant
    { name
    , value = cv
    , origins = originsOf requirements name
    , deprecated = firstDef.deprecated
    , comment = firstDef.comment
    , pos = firstDef.pos
    }
 where
  firstDef = firstDefOf sites

-- | The first definition site (encounts order) — the metadata donor.
firstDefOf :: NonEmpty EnumValueSite -> EnumDef
firstDefOf sites = NE.head sites ^. #def

-- | Require-sites referencing a value; empty means block-native and never
-- individually required.
originsOf :: Requirements -> EnumValueName -> [Origin]
originsOf requirements name =
  maybe [] NE.toList (Map.lookup (ItemKey NsEnumValue (forgetNamespace name)) requirements.required)
