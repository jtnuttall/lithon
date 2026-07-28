{-# LANGUAGE OverloadedStrings #-}

-- | C -> Haskell alias-name minting for the curated @SDL3.Sys.*@ layer.
--
-- * Strip @SDL_@ and split on underscores.
-- * First segment: lower a leading acronym run, keeping its last letter
--   when a lowercase word follows (@GPUSupports…@ -> @gpuSupports…@,
--   @IOFromFile@ -> @ioFromFile@, @GL@ -> @gl@, @GetError@ -> @getError@,
--   @hid@ -> @hid@).
-- * Later segments join capitalized (@qsort_r@ -> @qsortR@, @iconv_string@
--   -> @iconvString@), except digit-led segments, which keep their
--   underscore (@murmur3_32@ -> @murmur3_32@).
module Lithon.Codegen.Sdl3.Alias.Names (
  -- * Vocabulary
  Flavor (..),
  Safety (..),
  MintedAlias (..),
  primaryAliasName,

  -- * Errors
  AliasError (..),

  -- * Minting
  mintAliasNames,

  -- * Primitives (exposed for tests and downstream passes)
  normalizeFunctionName,
  validVarId,
  haskellKeywords,
) where

import Data.Char qualified as Char
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude

-- | Foreign-import safety flavor of a single alias binding.
data Flavor = SafeFlavor | UnsafeFlavor
  deriving stock (Bounded, Enum, Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

-- | Per-function flavor surface: which foreign imports the curated layer
-- exports for one C function.
data Safety
  = -- | @foo@ only — an explicit opt-out of the safe alias (non-callback
    -- functions only; never the default).
    UnsafeOnly
  | -- | @foo@ and @fooSafe@ — the default: every function exposes both
    -- flavors. Curated entries with a rationale document why the choice
    -- matters (blocking\/reentrant semantics) in the generated haddocks.
    Both
  | -- | @fooSafe@ only — the unsafe import is refused because the function
    -- unavoidably invokes a callback synchronously (re-entering Haskell
    -- during an unsafe call is undefined behavior).
    SafeOnly
  deriving stock (Bounded, Enum, Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

-- | The minted alias surface of one C function.
data MintedAlias = MintedAlias
  { unsafeName :: !(Maybe Text)
  -- ^ The unsuffixed alias, bound to the unsafe foreign import.
  , safeName :: !(Maybe Text)
  -- ^ The @Safe@-suffixed alias, bound to the safe foreign import.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

-- | The name documentation cross-references should point at: the unsuffixed
-- alias when it exists, otherwise the @Safe@ one.
primaryAliasName :: MintedAlias -> Text
primaryAliasName minted =
  fromMaybe
    (fromMaybe "" minted.safeName)
    minted.unsafeName

data AliasError
  = -- | A minted alias is not a valid Haskell variable identifier (empty,
    -- keyword, bad first character, …).
    AliasNameInvalid
      { cName :: !Text
      , minted :: !Text
      , reason :: !Text
      }
  | -- | Two or more C functions minted the same alias.
    AliasNameCollision
      { minted :: !Text
      , cNames :: ![Text]
      -- ^ Every C function name that mapped to the same alias, sorted.
      }
  | -- | Configuration references a C function the census does not contain.
    AliasUnknownFunction
      { context :: !Text
      -- ^ Which part of the configuration named it (@forceSafe@, @renames@, …).
      , cName :: !Text
      }
  | -- | A function takes a callback parameter but @aliases.json@ does not
    -- classify it; classification is deliberately explicit, never inferred.
    AliasUnclassifiedCallback
      { cName :: !Text
      }
  | -- | Contradictory configuration for one function.
    AliasConfigConflict
      { cName :: !Text
      , reason :: !Text
      }
  | -- | A function in the C AST has no translated 'FunctionDecl' twin (or
    -- vice versa) — an hs-bindgen invariant violation, not a user error.
    AliasTranslationMissing
      { cName :: !Text
      , hsName :: !Text
      }
  | -- | A family module name falls outside the expected namespace shape.
    AliasFamilyInvalid
      { familyModule :: !Text
      , reason :: !Text
      }
  | -- | A minted alias collides with a name the curated
    -- @SDL3.Sys.Runtime@ bridge module reserves — the umbrella re-exports
    -- both, so the duplicate would otherwise only surface as a downstream
    -- GHC ambiguity.
    AliasReservedCollision
      { aliasName :: !Text
      , cName :: !Text
      }
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

instance Display AliasError where
  displayBuilder =
    displayBuilder @Text . \case
      AliasNameInvalid{cName, minted, reason} ->
        "alias '"
          <> minted
          <> "' minted for "
          <> cName
          <> " is not a valid Haskell identifier ("
          <> reason
          <> "); add a rename to aliases.json"
      AliasNameCollision{minted, cNames} ->
        "generated alias '"
          <> minted
          <> "' collides between: "
          <> T.intercalate ", " cNames
          <> "; resolve with a rename in aliases.json"
      AliasUnknownFunction{context, cName} ->
        "aliases.json "
          <> context
          <> " references unknown function '"
          <> cName
          <> "'"
      AliasUnclassifiedCallback{cName} ->
        "'"
          <> cName
          <> "' takes a callback parameter but has no entry in aliases.json; "
          <> "classify it as \"both\" (registration-only or bypassable callback) "
          <> "or \"safe-only\" (invoked synchronously; unsafe would be UB)"
      AliasConfigConflict{cName, reason} ->
        "aliases.json entry for '" <> cName <> "' is contradictory: " <> reason
      AliasTranslationMissing{cName, hsName} ->
        "C function '"
          <> cName
          <> "' has no translated declaration '"
          <> hsName
          <> "' (hs-bindgen invariant violation)"
      AliasFamilyInvalid{familyModule, reason} ->
        "family module '" <> familyModule <> "': " <> reason
      AliasReservedCollision{aliasName, cName} ->
        "alias '"
          <> aliasName
          <> "' minted for "
          <> cName
          <> " collides with the SDL3.Sys.Runtime bridge vocabulary; "
          <> "resolve with a rename in aliases.json"

-- | Mint the alias surface for every function, validating identifiers and
-- global (whole-library) uniqueness in one accumulating pass.
--
-- @renames@ overrides the normalization rule per C name (the value is the
-- unsuffixed shape; a @Safe@ variant derives from it). Callers validate the
-- rename keys against the census before minting.
mintAliasNames
  :: Map Text Text
  -- ^ Renames: C name -> unsuffixed alias override.
  -> [(Text, Safety)]
  -- ^ The functions to alias, with their classified flavor surface.
  -> Validation (Errors AliasError) (Map Text MintedAlias)
mintAliasNames renames functions =
  failUnlessEmpty (invalids <> collisions) (Map.fromList entries)
 where
  entries =
    [ (cName, mintOne cName safety)
    | (cName, safety) <- functions
    ]

  mintOne cName safety =
    let base = fromMaybe (normalizeFunctionName cName) (Map.lookup cName renames)
     in MintedAlias
          { unsafeName = case safety of
              SafeOnly -> Nothing
              _hasUnsafe -> Just base
          , safeName = case safety of
              UnsafeOnly -> Nothing
              _hasSafe -> Just (base <> "Safe")
          }

  exported =
    [ (name, cName)
    | (cName, minted) <- entries
    , name <- maybeToList minted.unsafeName <> maybeToList minted.safeName
    ]

  invalids =
    [ AliasNameInvalid{cName, minted = name, reason}
    | (name, cName) <- exported
    , Just reason <- [validVarId name]
    ]

  collisions =
    [ AliasNameCollision{minted = name, cNames = sort origs}
    | (name, origs) <- Map.toList byMinted
    , length origs > 1
    ]

  byMinted =
    Map.fromListWith
      (<>)
      [(name, [cName]) | (name, cName) <- exported]

-- | The camelCase-segments rule (see module header). Total over any C
-- function name; names without the @SDL_@ prefix normalize from their full
-- spelling.
normalizeFunctionName :: Text -> Text
normalizeFunctionName cName =
  case filter (not . T.null) (T.splitOn "_" stripped) of
    [] -> ""
    (s0 : rest) -> T.concat (firstSegment s0 : map laterSegment rest)
 where
  stripped = fromMaybe cName (T.stripPrefix "SDL_" cName)

  -- Lower a leading acronym run; when a lowercase word follows a multi-letter
  -- run, the run's last letter starts that word (GUIDToString -> guidToString).
  firstSegment seg =
    let (run, rest) = T.span Char.isUpper seg
     in case T.uncons rest of
          Just (c, _)
            | Char.isLower c && T.length run > 1 ->
                T.toLower (T.dropEnd 1 run) <> T.takeEnd 1 run <> rest
          _fullRunOrNoRun -> T.toLower run <> rest

  -- Later segments join capitalized; digit-led segments keep their
  -- underscore (murmur3_32).
  laterSegment seg = case T.uncons seg of
    Nothing -> seg
    Just (c, cs)
      | Char.isDigit c -> "_" <> seg
      | otherwise -> T.cons (Char.toUpper c) cs

-- | 'Nothing' when the text is a valid (non-keyword) Haskell variable
-- identifier; otherwise the reason it is not.
validVarId :: Text -> Maybe Text
validVarId t
  | T.null t = Just "empty after prefix strip"
  | Set.member t haskellKeywords = Just "Haskell keyword"
  | Just (c, _) <- T.uncons t
  , not (Char.isLower c || c == '_') =
      Just "does not start with a lowercase letter"
  | not (T.all identChar t) =
      Just "contains characters invalid in a Haskell identifier"
  | otherwise = Nothing
 where
  identChar c = Char.isAlphaNum c || c == '_' || c == '\''

haskellKeywords :: Set Text
haskellKeywords =
  Set.fromList
    [ "case"
    , "class"
    , "data"
    , "default"
    , "deriving"
    , "do"
    , "else"
    , "family"
    , "forall"
    , "foreign"
    , "if"
    , "import"
    , "in"
    , "infix"
    , "infixl"
    , "infixr"
    , "instance"
    , "let"
    , "mdo"
    , "module"
    , "newtype"
    , "of"
    , "pattern"
    , "proc"
    , "rec"
    , "role"
    , "static"
    , "then"
    , "type"
    , "where"
    ]
