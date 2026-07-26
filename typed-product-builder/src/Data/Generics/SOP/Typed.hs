{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# OPTIONS_GHC -Wno-orphans #-}
{-# OPTIONS_GHC -Wno-redundant-constraints #-}

module Data.Generics.SOP.Typed (
  AllUnique,
  AllUniqueExp,
  ConsUniq,
  Duplicates,
  AllUniqueTyped,
  TypeIn,
  npFromTyped,
  productFromTyped,
) where

import Data.Constraint.Flip (FlipC)
import Data.Generics.Product.Typed (HasType (getTyped, setTyped))
import Data.Kind (Constraint)
import Data.Type.Bool (If)
import Fcf.Combinators (type (>>=))
import Fcf.Core (Eval, Exp)
import Fcf.Data.Common (Fst)
import Fcf.Data.List (Elem, Foldr, Null)
import GHC.TypeError (Assert, ErrorMessage (..), TypeError, Unsatisfiable)
import Generics.SOP (
  All,
  HPure (hcpure),
  I (..),
  IsProductType,
  NP ((:*)),
  Proxy (Proxy),
  productTypeTo,
 )
import Prelude ((.))

type AllUnique xs msg = Eval (AllUniqueExp xs msg)

data AllUniqueExp :: [k] -> ErrorMessage -> Exp Constraint
type instance
  Eval (AllUniqueExp xs msg) =
    Assert
      (Eval (Duplicates xs >>= Null))
      ( Unsatisfiable
          ( TypeError
              (msg :$$: Text "Duplicates: " :<>: ShowType (Eval (Duplicates xs)))
          )
      )

data ConsUniq :: k -> [k] -> Exp [k]
type instance
  Eval (ConsUniq x xs) =
    If (Eval (x `Elem` xs)) xs (x : xs)

-- | I love me the sound of O(n^2) in the morning
data Duplicates :: [k] -> Exp [k]

type instance
  Eval (Duplicates xs) =
    Eval (Foldr DuplicatesHelper '( '[], '( '[], xs)) xs >>= Fst)

data DuplicatesHelper :: k -> ([k], ([k], [k])) -> Exp ([k], ([k], [k]))
type instance
  Eval (DuplicatesHelper x '(dupes, '(seen, all))) =
    '( If (Eval (x `Elem` seen)) (Eval (ConsUniq x dupes)) dupes
     , '(Eval (ConsUniq x seen), all)
     )

type AllUniqueTyped xs = AllUnique xs (Text "All fields in product must be unique")

instance
  {-# OVERLAPPING #-}
  (Unsatisfiable (Text "Could not resolve type in n-ary product: " :<>: ShowType t))
  => HasType t (NP I '[])

instance
  {-# OVERLAPPING #-}
  (AllUniqueTyped (x : ts), HasType t (NP I ts))
  => HasType t (NP I (x : ts))
  where
  getTyped (_ :* ts) = getTyped ts
  setTyped v (t :* ts) = t :* setTyped v ts

instance {-# OVERLAPPING #-} (AllUniqueTyped (t : ts)) => HasType t (NP I (t : ts)) where
  getTyped (I t :* _) = t
  setTyped v (I _ :* ts) = I v :* ts

type TypeIn = FlipC HasType

npFromTyped :: forall a tys. (All (TypeIn a) tys, AllUniqueTyped tys) => a -> NP I tys
npFromTyped a = hcpure (Proxy @(TypeIn a)) (I (getTyped a))

productFromTyped
  :: forall a b tys. (All (TypeIn a) tys, AllUniqueTyped tys, IsProductType b tys) => a -> b
productFromTyped = productTypeTo . npFromTyped
