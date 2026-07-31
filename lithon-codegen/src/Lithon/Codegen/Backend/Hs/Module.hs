{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE UndecidableInstances #-}

-- | Simple handling of Haskell module names under a newtype
--
-- Provides unified C header name mangling utilities
module Lithon.Codegen.Backend.Hs.Module (
  -- * Module metadata
  MetaError (..),
  Meta,
  HasMeta (..),
  fromSegments,
  metaLit,
  metaLits,
  hsName,
  path,
  prependName,
  appendName,

  -- * Header name mangling, for use with hs-bindgen
  MangleError (..),
  HeaderPathStrategy (..),
  HeaderCaseStrategy (..),
  SegmentJoin (..),
  MangleOpts (..),
  MangledMeta,
  mangleHeader,
) where

import Control.Lens (traverseOf, _head)
import Control.Lens.Setter
import Data.Aeson qualified as A
import Data.Char (isAlphaNum, isUpper, toUpper)
import Data.List.Extra qualified as L
import Data.List.NonEmpty qualified as NE
import Data.Text qualified as T
import Language.Haskell.TH qualified as TH
import Language.Haskell.TH.Syntax qualified as TH
import Lithon.Prelude
import System.FilePath (extSeparator, joinPath, splitDirectories, takeFileName, (<.>))
import Witch (TryFromException (..))

----------------------------------------------------------------------------------------------------
-- Module metadata
----------------------------------------------------------------------------------------------------

data MetaError
  = EmptyModuleName
  | EmptyModuleSegment [Text]
  | InvalidModuleName [Text] Text
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (A.ToJSON, Exception, NFData)

instance Display MetaError where
  displayBuilder = \case
    EmptyModuleName -> "The provided module name is empty"
    EmptyModuleSegment orig -> "The provided module name contains empty segments: " <> show orig
    InvalidModuleName orig msg -> "The provided module name " <> show orig <> " is invalid: " <> from msg

newtype Meta = Meta
  {segments :: NonEmpty Text}
  deriving stock (Generic, Show, TH.Lift)
  deriving newtype (Container, Eq, NFData, Ord, Semigroup)

-- | Serializes as the dotted name, matching the pre-'Meta' representation in
-- dumps and goldens.
instance A.ToJSON Meta where
  toJSON = A.toJSON . hsName

class HasMeta a where
  metaL :: Lens' a Meta

-- |
-- >>> hsName (Meta (fromList ["SDL3", "Sys", "Bindgen", "Controller"]))
-- "SDL3.Sys.Bindgen.Controller"
hsName :: (HasMeta a) => a -> Text
hsName = T.intercalate "." . toList . view metaL

path :: (HasMeta a) => a -> FilePath
path = (<.> "hs") . joinPath . map toString . toList . view metaL

modifyMeta :: (HasMeta t) => ([Text] -> [Text]) -> t -> Either MetaError t
modifyMeta f = traverseOf metaL \(Meta m) -> fromSegments (f (toList m))

prependName :: (HasMeta a) => [Text] -> a -> Either MetaError a
prependName p = modifyMeta (p <>)

appendName :: (HasMeta a) => a -> [Text] -> Either MetaError a
appendName a p = modifyMeta (<> p) a

instance HasMeta Meta where
  metaL = id

instance Display Meta where
  displayBuilder = from . hsName

instance TryFrom [Text] Meta where
  tryFrom v = first (TryFromException v . Just . SomeException) $ fromSegments v

-- | Validation only — never rewrites its input. Each segment must be a legal
-- Haskell @conid@: an uppercase head, then alphanumerics, underscores, or
-- apostrophes. Callers that need case normalization do it explicitly (see
-- 'mangleHeader').
fromSegments :: [Text] -> Either MetaError Meta
fromSegments raw = do
  let invalid = Left . InvalidModuleName raw
  segs <- maybeToRight EmptyModuleName $ nonEmpty raw
  when (any null segs) $ Left (EmptyModuleSegment raw)
  unless (all (isUpper . T.head) segs) $ invalid "a segment starts with a non-uppercase character"
  unless (all (T.all isConidChar . T.drop 1) segs) $ invalid "segment contains a character not valid in a module name"
  pure $ Meta segs
 where
  isConidChar c = isAlphaNum c || c == '_' || c == '\''

metaLit :: [Text] -> TH.Code TH.Q Meta
metaLit segs = case fromSegments segs of
  Left err -> TH.liftCode $ fail (show (display err))
  Right m -> [||$$(TH.liftTyped m)||]

metaLits :: [[Text]] -> TH.Code TH.Q [Meta]
metaLits segss = TH.unsafeCodeCoerce $ TH.listE (map (TH.unTypeCode . metaLit) segss)

----------------------------------------------------------------------------------------------------
-- Header name mangling
----------------------------------------------------------------------------------------------------

data MangleError
  = HeaderNameDoesNotMatch FilePath MangleOpts Text
  | MangledNameEmpty FilePath MangleOpts Text
  | MetaError MetaError
  deriving stock (Show)

instance From MetaError MangleError where
  from = MetaError

instance Display MangleError where
  displayBuilder = \case
    HeaderNameDoesNotMatch fp opts msg ->
      let expected =
            fromMaybe "" opts.stripPrefix
              <> "{headerName}"
              <> fromMaybe "" opts.stripSuffix
              <> "."
              <> from opts.headerExt
       in "header " <> show fp <> " does not match " <> show expected <> ": " <> from msg
    MangledNameEmpty fp opts msg -> "header name for " <> show fp <> " mangles to nothing: " <> from msg <> "\ngiven: " <> show opts
    MetaError err -> "invalid mangled module name: " <> displayBuilder err

data HeaderPathStrategy
  = SplitPath
  | TakeFileName
  | DropPrefix [FilePath]
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (A.ToJSON)

applyPathStrategy :: HeaderPathStrategy -> FilePath -> [Text]
applyPathStrategy strat p = map toText case strat of
  SplitPath -> split
  TakeFileName -> [takeFileName p]
  DropPrefix pre
    | pre `isPrefixOf` split -> L.dropPrefix pre split
    | otherwise -> []
 where
  split = splitDirectories p

data HeaderCaseStrategy
  = SplitUppercase
  | SplitUnderscore
  | SplitHyphen
  | NoSplit
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (A.ToJSON)

-- |
-- >>> applyCaseStrategy SplitUppercase "helloWorldHERE-is_AStrinG123G456"
-- ["hello","World","H","E","R","E-is_","A","Strin","G123","G456"]
--
-- >>> applyCaseStrategy SplitUppercase "AA"
-- ["A","A"]
--
-- >>> applyCaseStrategy SplitUppercase "aAA"
-- ["a","A","A"]
--
-- >>> applyCaseStrategy SplitUppercase "BaAAaaAAABBB"
-- ["Ba","A","Aaa","A","A","A","B","B","B"]
--
-- >>> applyCaseStrategy SplitUnderscore "HeLLo_woRLd_hE-RE_is_a_string456_123"
-- ["HeLLo","woRLd","hE-RE","is","a","string456","123"]
--
-- >>> applyCaseStrategy SplitHyphen "HeLLo_woRLd_hE-RE_is_a_string-456_123"
-- ["HeLLo_woRLd_hE","RE_is_a_string","456_123"]
-- >>> applyCaseStrategy NoSplit "HeLLo_woRLd_hE-RE_is_a_string-456_123"
-- ["HeLLo_woRLd_hE-RE_is_a_string-456_123"]
applyCaseStrategy :: HeaderCaseStrategy -> Text -> [Text]
applyCaseStrategy strat p = case strat of
  SplitUppercase -> applyWhen (not (null p) && isUpper (T.head p)) (drop 1) $ splitUppercase p
  SplitUnderscore -> T.splitOn "_" p
  SplitHyphen -> T.splitOn "-" p
  NoSplit -> [p]
 where
  splitUppercase t
    | null b = [a]
    | otherwise = a : over _head (T.take 1 b <>) (splitUppercase (T.drop 1 b))
   where
    (a, b) = T.break isUpper t

-- | What becomes of the case-split words of the header name:
-- 'JoinSegments' makes each its own module segment
-- (@SDL_platform_defines.h@ -> @….Platform.Defines@); 'JoinConcat' upcases
-- each and concatenates them into ONE segment
-- (@SDL_platform_defines.h@ -> @….PlatformDefines@).
data SegmentJoin
  = JoinSegments
  | JoinConcat
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (A.ToJSON)

data MangleOpts = MangleOpts
  { pathStrategy :: HeaderPathStrategy
  -- ^ How to split the path to the module
  , caseStrategy :: HeaderCaseStrategy
  -- ^ How to split the actual header name (the terminal element of the path,
  -- regardless of path strategy)
  , segmentJoin :: SegmentJoin
  , stripPrefix :: Maybe Text
  , stripSuffix :: Maybe Text
  , headerExt :: FilePath
  }
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON)

instance Default MangleOpts where
  def =
    MangleOpts
      { pathStrategy = TakeFileName
      , caseStrategy = SplitUnderscore
      , segmentJoin = JoinSegments
      , stripPrefix = Nothing
      , stripSuffix = Nothing
      , headerExt = "h"
      }

data MangledMeta = MangledMeta
  { headerPath :: FilePath
  , meta :: Meta
  }
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (A.ToJSON)

instance HasMeta MangledMeta where
  metaL = lens (.meta) (\x y -> x{meta = y})

-- |
-- >>> mangleHeader (joinPath ["some", "path", "SDL_MetalView.h"]) def{stripPrefix = Just "SDL_"}
-- Right (MangledMeta {headerPath = "some/path/SDL_MetalView.h", meta = Meta {segments = "MetalView" :| []}})
--
-- >>> mangleHeader (joinPath ["some", "path" , "SDL_MetalView.h"]) def{pathStrategy = SplitPath}
-- Right (MangledMeta {headerPath = "some/path/SDL_MetalView.h", meta = Meta {segments = "Some" :| ["Path","SDL","MetalView"]}})
--
-- >>> mangleHeader "SDL_platform_defines.h" def{stripPrefix = Just "SDL_", segmentJoin = JoinConcat}
-- Right (MangledMeta {headerPath = "SDL_platform_defines.h", meta = Meta {segments = "PlatformDefines" :| []}})
mangleHeader :: FilePath -> MangleOpts -> Either MangleError MangledMeta
mangleHeader headerPath opts = do
  let nameEmpty = MangledNameEmpty headerPath opts
      noMatch = HeaderNameDoesNotMatch headerPath opts

  (pathSegments, headerFileName) <- first nameEmpty do
    segs <-
      maybeToRight "splitting path"
        . nonEmpty
        . map toText
        $ applyPathStrategy opts.pathStrategy headerPath
    pure (NE.init segs, NE.last segs)

  strippedHeaderName <- first noMatch do
    noExt <-
      maybeToRight "stripping file extension"
        $ T.stripSuffix (toText $ extSeparator : opts.headerExt) headerFileName
    noPre <- maybeToRight "stripping prefix" $ maybe Just T.stripPrefix opts.stripPrefix noExt
    maybeToRight "stripping suffix" $ maybe Just T.stripSuffix opts.stripSuffix noPre

  fileSegments <-
    first nameEmpty
      $ maybeToRight "splitting by case strategy"
      $ nonEmpty
      $ applyCaseStrategy opts.caseStrategy strippedHeaderName

  -- Mangling normalizes case (validation deliberately does not): every
  -- segment's head is upcased before the conid check. Under 'JoinConcat'
  -- the case-split words fuse into one PascalCase segment (empty words
  -- vanish in the concat, mirroring split-on-underscore conventions).
  let joined = case opts.segmentJoin of
        JoinSegments -> NE.toList fileSegments
        JoinConcat -> [T.concat (map (over _head toUpper) (NE.toList fileSegments))]
      segments = map (over _head toUpper) (pathSegments <> joined)

  meta <- first from $ fromSegments segments

  pure MangledMeta{..}
