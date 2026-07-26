{-# LANGUAGE OverloadedStrings #-}

-- | C -> Haskell name resolution (generate pass g1).
--
-- Every generated identifier is minted here, up front and totally, so the
-- rest of the pipeline never invents a name and collisions surface as one
-- pass's errors rather than as broken output:
--
-- * Types: strip @Vk@ (@VkImageCreateInfo@ -> @ImageCreateInfo@).
-- * Commands: strip @vk@, lower the first letter (@vkCreateDevice@ ->
--   @createDevice@).
-- * Enum values (plain enums, bit positions, and compound bitmask values
--   alike): strip @VK_@ and PascalCase each underscore segment. Within a
--   segment the first character is upcased and the rest lowercased, except
--   that characters following a digit keep their source case (so
--   @R8G8B8A8@ and @ASTC_4x4@ survive as @R8G8B8A8@ and @Astc4x4@, and
--   @2D@ stays @2D@); segments matching a registry vendor tag are kept
--   verbatim (@…_BLOCK_EXT@ -> @…BlockEXT@). The type-derived leading
--   segments are retained wholesale — no prefix stripping — so
--   constructors are unique under whole-library re-export and never start
--   with a digit.
-- * API constants: strip @VK_@ only (@VK_WHOLE_SIZE@ -> pattern
--   @WHOLE_SIZE@), maximally recognizable in the SCREAMING_SNAKE shape
--   Vulkan users know.
-- * Extension modules: strip @VK_@ (@VK_KHR_swapchain@ ->
--   @Lithon.Extensions.KHR_swapchain@'s trailing segment).
--
-- The curated surface was measured collision-free under these rules across
-- every scope, so a collision is a hard 'NameError' (fail loud, decide
-- policy with the evidence in hand), not a silent rename.
module Lithon.Codegen.Vulkan.Generate.Names (
  Names (..),
  NameError (..),
  buildNames,

  -- * Casing primitives (exposed for tests and downstream passes)
  pascalValueName,
  stripVkType,
  stripVkCommand,
  stripVkPrefix,
) where

import Data.Aeson (ToJSON)
import Data.Char qualified as Char
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Vector qualified as V

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Types.Common (VendorTag (..))
import Lithon.Codegen.Vulkan.Resolved.Enums (
  Constant (..),
  ResolvedEnumBlock (..),
  ResolvedEnumItem (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))

-- | The total name maps for the curated surface. Keys are canonical
-- registry spellings; values are the Haskell identifiers phase 3 emits.
data Names = Names
  { typeNames :: !(Map TypeName Text)
  -- ^ Every named type (structs, unions, handles, enums, bitmasks,
  -- funcpointers, basetypes) -> Haskell type constructor name.
  , commandNames :: !(Map CommandName Text)
  -- ^ Command -> Haskell function name.
  , ctorNames :: !(Map EnumValueName Text)
  -- ^ Enum item (canonical spelling) -> Haskell constructor \/ pattern name.
  -- Item names are globally unique in the registry, so one map suffices.
  , constantNames :: !(Map EnumValueName Text)
  -- ^ API constant -> Haskell pattern name.
  , extensionModules :: !(Map ExtensionName Text)
  -- ^ Extension -> trailing module segment (@KHR_swapchain@).
  , structCtorNames :: !(Map TypeName Text)
  -- ^ Struct record\/constructor names: the type name, unless that
  -- collides with an enum-value\/constant constructor at the term level
  -- (the registry names @VkPipelineCacheHeaderVersionOne@ — the struct —
  -- after @VK_PIPELINE_CACHE_HEADER_VERSION_ONE@ — the value), in which
  -- case @Mk@ prefixes.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data NameError
  = NameEmptyAfterStrip
      { kind :: !Namespace
      , original :: !Text
      }
  | NameCollision
      { kind :: !Namespace
      , minted :: !Text
      , originals :: ![Text]
      -- ^ Every registry spelling that mapped to the same identifier,
      -- name-sorted.
      }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display NameError where
  displayBuilder =
    displayBuilder @Text . \case
      NameEmptyAfterStrip{kind, original} ->
        "name is empty after prefix strip: "
          <> display kind
          <> " '"
          <> original
          <> "'"
      NameCollision{kind, minted, originals} ->
        "generated "
          <> display kind
          <> " name '"
          <> minted
          <> "' collides between: "
          <> T.intercalate ", " originals

-- | Mint every generated identifier for the curated registry.
buildNames
  :: (HasType ResolvedRegistry cxt)
  => cxt
  -> Validation (Errors NameError) Names
buildNames cxt =
  Names
    <$> uniquely TypeNS typeEntries
    <*> uniquely CommandNS commandEntries
    <*> uniquely EnumValueNS ctorEntries
    <*> uniquely EnumValueNS constantEntries
    <*> uniquely ExtensionNS extensionEntries
    <*> uniquely TypeNS structCtorEntries
 where
  registry = getTyped @ResolvedRegistry cxt
  vendorTags = Set.fromList [t.name | t <- V.toList registry.tags]

  typeEntries =
    [ (name, stripVkType (forgetNamespace name))
    | name <-
        Map.keys registry.structs
          <> Map.keys registry.handles
          <> Map.keys registry.bitmasks
          <> Map.keys registry.funcpointers
          <> Map.keys registry.basetypes
          <> Map.keys registry.enums
    ]

  commandEntries =
    [ (name, stripVkCommand (forgetNamespace name))
    | name <- Map.keys registry.commands
    ]

  ctorEntries =
    [ (item.name, pascalValueName vendorTags (forgetNamespace item.name))
    | block <- Map.elems registry.enums
    , item <- V.toList block.items
    ]

  constantEntries =
    [ (c.name, stripVkPrefix (forgetNamespace c.name))
    | c <- Map.elems registry.constants
    ]

  extensionEntries =
    [ (name, stripVkPrefix (forgetNamespace name))
    | name <- Map.keys registry.extensions
    ]

  structCtorEntries =
    [ (name, dodge (stripVkType (forgetNamespace name)))
    | name <- Map.keys registry.structs
    ]
   where
    dodge minted
      | Set.member minted termCtors = "Mk" <> minted
      | otherwise = minted
    termCtors =
      Set.fromList (snd <$> ctorEntries)
        <> Set.fromList (snd <$> constantEntries)

  -- Validate one scope: every minted name nonempty and unique.
  uniquely
    :: forall (k :: Namespace)
     . Namespace
    -> [(WithNS k, Text)]
    -> Validation (Errors NameError) (Map (WithNS k) Text)
  uniquely kind entries =
    failUnlessEmpty (empties <> collisions) (Map.fromList entries)
   where
    empties =
      [ NameEmptyAfterStrip{kind, original = display orig}
      | (orig, minted) <- entries
      , T.null minted
      ]
    collisions =
      [ NameCollision{kind, minted, originals = sort (map display origs)}
      | (minted, origs) <- Map.toList byMinted
      , length origs > 1
      ]
    byMinted =
      Map.fromListWith
        (<>)
        [(minted, [orig]) | (orig, minted) <- entries]

-- | @VkImageCreateInfo@ -> @ImageCreateInfo@. Names without the prefix pass
-- through (externals like @xcb_connection_t@ are mapped elsewhere).
stripVkType :: Text -> Text
stripVkType t = fromMaybe t (T.stripPrefix "Vk" t)

-- | @vkCreateDevice@ -> @createDevice@.
stripVkCommand :: Text -> Text
stripVkCommand t = case T.stripPrefix "vk" t of
  Just rest -> lowerFirst rest
  Nothing -> lowerFirst t
 where
  lowerFirst s = case T.uncons s of
    Just (c, cs) -> T.cons (Char.toLower c) cs
    Nothing -> s

stripVkPrefix :: Text -> Text
stripVkPrefix t = fromMaybe t (T.stripPrefix "VK_" t)

-- | The enum-value casing rule (see module header). Total over any
-- SCREAMING_SNAKE registry value name.
pascalValueName :: Set Text -> Text -> Text
pascalValueName vendorTags =
  T.concat . map pascalSegment . T.splitOn "_" . stripVkPrefix
 where
  pascalSegment seg
    | T.null seg = seg
    | Set.member seg vendorTags = seg
    | otherwise = case T.uncons seg of
        Nothing -> seg
        Just (c0, rest) ->
          T.cons (Char.toUpper c0) (snd (T.mapAccumL keepAfterDigit c0 rest))
  keepAfterDigit prev c =
    (c, if Char.isDigit prev then c else Char.toLower c)
