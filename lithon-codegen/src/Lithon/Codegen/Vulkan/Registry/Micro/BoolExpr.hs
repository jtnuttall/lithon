{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

-- | The registry's boolean expression grammar, used by @depends=@ (features,
-- extensions, require blocks, sync pipelines) and @protect=@.
--
-- Normative grammar (registry.adoc:1194–1213, 1677–1681):
--
-- * @,@ is logical OR, @+@ is logical AND;
-- * @,@ and @+@ have EQUAL precedence, lower than @( )@, and expressions
--   evaluate left-to-right — so @a,b+c@ is @(a OR b) AND c@;
-- * @!@ prefixes a term for logical NOT (@protect=@ only; @depends=@ never
--   uses it — enforced by construction here and re-checked by registry
--   invariants);
-- * no whitespace anywhere.
module Lithon.Codegen.Vulkan.Registry.Micro.BoolExpr (
  BoolExpr,
  pattern BAnd,
  pattern BOr,
  pattern BNot,
  pattern BAtom,
  DependsAtom (..),
  DependsExpr,
  ProtectExpr,
  parseDepends,
  parseProtect,
  evalBoolExpr,
  boolExprAtoms,
) where

import Control.DeepSeq (NFData1)
import Data.Aeson (ToJSON, ToJSON1)
import Data.DList.DNonEmpty qualified as DNonEmpty
import Data.Deriving (deriveEq1, deriveShow1)
import Data.Fix (Fix (Fix))
import Data.Functor.Foldable (cata, para)
import GHC.Generics (Generic1)
import Text.Megaparsec (between, many)
import Text.Megaparsec.Char (char, string)

import Lithon.Codegen.Prelude hiding (many)
import Lithon.Codegen.Vulkan.Registry.Micro.Common (
  FeaturePath (..),
  P,
  identifier,
  viaMegaparsec,
 )

type BoolExpr a = Fix (BoolExprF a)

instance (Display a) => Display (BoolExpr a) where
  displayBuilder = para \case
    AtomF a -> displayBuilder a
    UnOpF op (s, t) -> displayBuilder op <> parens s t
    BinOpF op (_, tl) (sr, tr) -> tl <> displayBuilder op <> parens sr tr
   where
    parens (Fix s) = displayParen (has #_BinOpF s)

-- | Evaluate against an atom oracle
evalBoolExpr :: (a -> Bool) -> BoolExpr a -> Bool
evalBoolExpr f = cata \case
  AtomF a -> f a
  UnOpF o b -> unOp o b
  BinOpF o l r -> binOp o l r

-- | All atoms, left to right, ignoring the boolean structure. Feature-level
-- @depends=@ uses its atoms as prerequisite edges rather than a satisfiable
-- formula (registry.adoc; reg.py @get_dependencies@), so consumers of those
-- expressions want exactly this flattening.
boolExprAtoms :: BoolExpr a -> NonEmpty a
boolExprAtoms =
  from . cata \case
    AtomF a -> DNonEmpty.singleton a
    UnOpF _ t -> t
    BinOpF _ l r -> l <> r

data BoolExprF a b
  = AtomF a
  | UnOpF UnOp b
  | BinOpF BinOp b b
  deriving stock (Eq, Foldable, Functor, Generic, Generic1, Show, Traversable)
  deriving anyclass (Container, NFData, NFData1, ToJSON, ToJSON1)

data UnOp = NotF
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display UnOp where
  displayBuilder = \case
    NotF -> "!"

unOp :: UnOp -> Bool -> Bool
unOp NotF = not

data BinOp
  = AndF
  | OrF
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display BinOp where
  displayBuilder = \case
    AndF -> "+"
    OrF -> ","

binOp :: BinOp -> Bool -> Bool -> Bool
binOp = \case
  AndF -> (&&)
  OrF -> (||)

deriveEq1 ''BoolExprF
deriveShow1 ''BoolExprF

pattern BAtom :: a -> BoolExpr a
pattern BAtom a = Fix (AtomF a)
pattern BNot :: BoolExpr a -> BoolExpr a
pattern BNot a = Fix (UnOpF NotF a)
pattern BAnd :: BoolExpr a -> BoolExpr a -> BoolExpr a
pattern BAnd a b = Fix (BinOpF AndF a b)
pattern BOr :: BoolExpr a -> BoolExpr a -> BoolExpr a
pattern BOr a b = Fix (BinOpF OrF a b)
{-# COMPLETE BAtom, BNot, BAnd, BOr #-}

-- | An atom of a @depends=@ expression. Names are deliberately NOT
-- classified into version/extension/feature-tier here — that requires the
-- symbol tables of the resolve phase.
data DependsAtom
  = DependsName !Text
  | DependsFeature !FeaturePath
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData, ToJSON)

instance Display DependsAtom where
  displayBuilder = \case
    DependsName n -> displayBuilder n
    DependsFeature fp -> displayBuilder fp

type DependsExpr = BoolExpr DependsAtom

dependsAtomP :: P DependsAtom
dependsAtomP = do
  name <- identifier
  path <- optional (string "::" *> identifier)
  pure case path of
    Nothing -> DependsName name
    Just member -> DependsFeature FeaturePath{struct = WithNS name, member}

parseDepends :: Text -> Either Text DependsExpr
parseDepends = viaMegaparsec (boolExprP False dependsAtomP)

type ProtectExpr = BoolExpr Text

parseProtect :: Text -> Either Text ProtectExpr
parseProtect = viaMegaparsec (boolExprP True identifier)

-- | The flat, equal-precedence, left-associative operator chain.
boolExprP :: Bool -> P a -> P (BoolExpr a)
boolExprP allowNot atomP = chain
 where
  chain = do
    lhs <- term
    rest <- many ((,) <$> operator <*> term)
    pure (foldl' (\l (op, r) -> op l r) lhs rest)
  operator = (BOr <$ char ',') <|> (BAnd <$ char '+')
  term
    | allowNot = notP <|> parens <|> (BAtom <$> atomP)
    | otherwise = parens <|> (BAtom <$> atomP)
  notP = BNot <$> (char '!' *> term)
  parens = between (char '(') (char ')') chain
