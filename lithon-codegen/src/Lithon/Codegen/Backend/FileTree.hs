{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE UndecidableInstances #-}

-- |
-- Simple in-memory file tree for copying directories.
--
-- Import qualified.
module Lithon.Codegen.Backend.FileTree (
  DuplicateFiles (..),
  FileTree,
  pattern FileTree,
  fromList,
  fromUniqueList,
  fromUniqueListBS,
  prependPath,
  cata,
) where

import Data.Foldable.WithIndex (FoldableWithIndex (..))
import Data.Map.Strict qualified as Map
import Data.Monoid (Ap (Ap, getAp))
import Data.Set.NonEmpty qualified as NESet
import Lithon.Prelude hiding (fromList)
import System.FilePath ((</>))
import Witch (TryFromException (TryFromException))

-- $setup
-- >>> import Data.List.NonEmpty qualified as NE

newtype DuplicateFiles = DuplicateFiles (NESet FilePath)
  deriving stock (Eq, Show)
  deriving newtype (Semigroup)
  deriving anyclass (Exception)

instance Display DuplicateFiles where
  displayBuilder = \case
    DuplicateFiles dupes -> "Found duplicates while merging file trees: " <> show dupes

newtype FileTree' a = MkFileTree (Map FilePath a)
  deriving stock (Show)
  deriving newtype (Container, Foldable, FoldableWithIndex FilePath, Functor)

type FileTree = FileTree' Text

pattern FileTree :: Map FilePath Text -> FileTree
pattern FileTree m <- MkFileTree m
{-# COMPLETE FileTree #-}

fromList :: [(FilePath, Text)] -> Either DuplicateFiles FileTree
fromList =
  validationToEither
    . fmap MkFileTree
    . getAp
    . sequenceA
    . Map.fromListWithKey guardDuplicates
    . map (second pure)

fromUniqueList :: [(FilePath, Text)] -> FileTree
fromUniqueList = MkFileTree . Map.fromList

fromUniqueListBS :: [(FilePath, ByteString)] -> FileTree
fromUniqueListBS = fromUniqueList . map (second decodeUtf8)

instance TryFrom [(FilePath, Text)] FileTree where
  tryFrom v = first (TryFromException v . Just . SomeException) (fromList v)

instance TryFrom [(FilePath, ByteString)] FileTree where
  tryFrom v = first (TryFromException v . Just . SomeException) . tryFrom $ map (second (decodeUtf8 @Text)) v

prependPath :: FilePath -> FileTree -> FileTree
prependPath root (MkFileTree m) = MkFileTree (Map.mapKeys (root </>) m)

-- |
-- >>> cata (NE.fromList [fromUniqueList [("a", "b")], fromUniqueList [("a", "b"), ("b", "c")]])
-- Right (MkFileTree (fromList [("a","b"),("b","c")]))
--
-- >>> cata (NE.fromList [fromUniqueListBS [("a", "b")], fromUniqueList [("a", "c")], fromUniqueList [("d", "e")], fromUniqueList [("x", "y")]])
-- Left (DuplicateFiles (fromList ("a" :| [])))
--
-- >>> cata (NE.fromList [fromUniqueListBS [("a", "b")], fromUniqueList [("x", "y")], fromUniqueList [("d", "e")], fromUniqueList [("d", "f")]])
-- Left (DuplicateFiles (fromList ("d" :| [])))
cata :: NonEmpty FileTree -> Either DuplicateFiles FileTree
cata =
  validationToEither
    . fmap MkFileTree
    . getAp
    . sequenceA
    . foldr1 (Map.unionWithKey guardDuplicates)
    . map (\(FileTree t) -> map (Ap . Success) t)

----------------------------------------------------------------------------------------------------
-- Utility
----------------------------------------------------------------------------------------------------

guardDuplicates
  :: (Eq a, Semigroup a)
  => FilePath
  -> Ap (Validation DuplicateFiles) a
  -> Ap (Validation DuplicateFiles) a
  -> Ap (Validation DuplicateFiles) a
guardDuplicates fp vl vr
  | vl == vr = vl
  | otherwise = Ap (Failure (DuplicateFiles (NESet.singleton fp))) <> vl <> vr
