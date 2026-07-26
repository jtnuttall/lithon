{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}

-- | sType\/pNext chain machinery.
--
-- A chain-extensible struct is generated as @X (es :: [Type])@ with a field
-- @next :: 'Chain' es@ — an @sop-core@ 'NP' of the extension structs, in
-- order. Construct with the 'I'-free pattern synonym:
--
-- > nil { next = vulkan13Features :& Nil, … }
--
-- Which structs may extend which is policed by the generated 'Extends'
-- instances (from the registry's @structextends@ topology).
--
-- Poking allocates each element in the ambient arena and links the pNext
-- slots; peeking is __planted-chains only__: 'peekChain' walks pointers this
-- binding wrote (e.g. a features2 query skeleton), verifying each node's
-- sType — it does not discover arbitrary driver-provided chains.
--
-- The spine traversals are hand-rolled class recursion with INLINE pragmas;
-- at @-O@ GHC unfolds them to straight-line pokes with no 'NP'\/'I' residue.
module Lithon.Core.Chain (
  -- * Chains
  Chain,
  pattern (:&),
  pattern Nil,

  -- * Extension topology
  Extends,
  AllExtends,

  -- * Chain operations
  PokeChain (..),
  PeekChain (..),
  NilChain (..),

  -- * Heterogeneous collections of one chainable struct
  SomeStruct (..),
  withSomeStruct,

  -- * Errors
  ChainError (..),
) where

import Control.Exception (Exception, throwIO)
import Control.Monad (unless, when)
import Control.Monad.IO.Class (liftIO)
import Data.Int (Int32)
import Data.Kind (Constraint, Type)
import Data.SOP (I (..), NP (Nil, (:*)))
import Foreign.Ptr (Ptr, castPtr, nullPtr, plusPtr, ptrToWordPtr)
import Foreign.Ptr qualified as Ptr
import Foreign.Storable (peek, peekByteOff, poke)

import Lithon.Core.Alloc (Alloc)
import Lithon.Core.CStruct (CStruct (..), Chainable (..), FromCStruct (..), Nil (..), new)

-- | The pNext chain of a struct: a product of its extension structs.
type Chain (es :: [Type]) = NP I es

-- | Cons an extension struct onto a chain without writing 'I':
-- @a :& b :& Nil@. The empty chain is @sop-core@'s 'Nil', re-exported.
pattern (:&) :: e -> Chain es -> Chain (e ': es)
pattern e :& es = I e :* es

infixr 5 :&

{-# COMPLETE (:&), Nil #-}

-- | @Extends parent child@ holds when @child@ may appear in @parent@'s
-- pNext chain. Instances are generated from the registry.
class Extends (parent :: [Type] -> Type) (child :: Type)

-- | Every element of @es@ may extend @f@.
type family AllExtends (f :: [Type] -> Type) (es :: [Type]) :: Constraint where
  AllExtends _ '[] = ()
  AllExtends f (e ': es) = (Extends f e, AllExtends f es)

-- | Chain poking: @pokeChain slot chain@ fills the pNext /slot/ it is given
-- (writing 'nullPtr' for the empty chain), allocating each element in the
-- ambient arena. Elements write their own sType and a null pNext; the
-- recursion then overwrites that null with the next element's address.
type PokeChain :: [Type] -> Constraint
class PokeChain es where
  pokeChain :: Ptr (Ptr ()) -> Chain es -> Alloc ()

-- | Chain peeking, planted-chains only. Given the /value/ of a pNext pointer
-- (not a slot), verify and deep-copy each expected node in order. The chain
-- must end where the type says it ends.
type PeekChain :: [Type] -> Constraint
class PeekChain es where
  peekChain :: Ptr () -> IO (Chain es)

-- | The all-'nil' chain — the skeleton planted for query readbacks
-- (features2 and friends).
type NilChain :: [Type] -> Constraint
class NilChain es where
  nilChain :: Chain es

instance PokeChain '[] where
  pokeChain slot Nil = liftIO (poke slot nullPtr)
  {-# INLINE pokeChain #-}

instance (Chainable e, PokeChain es) => PokeChain (e ': es) where
  pokeChain slot (e :& rest) = do
    pe <- new e
    liftIO (poke slot (castPtr pe))
    pokeChain (castPtr (pe `plusPtr` chainOffset @e)) rest
  {-# INLINE pokeChain #-}

instance PeekChain '[] where
  peekChain p = do
    unless (p == nullPtr) $
      throwIO ChainUnexpectedTail{tail_ = ptrToWordPtr p}
    pure Nil
  {-# INLINE peekChain #-}

instance (Chainable e, FromCStruct e, PeekChain es) => PeekChain (e ': es) where
  peekChain p = do
    when (p == nullPtr) $
      throwIO ChainUnexpectedEnd{expected = sTypeWire @e}
    actual <- peek (castPtr p :: Ptr Int32)
    unless (actual == sTypeWire @e) $
      throwIO ChainMismatch{expected = sTypeWire @e, actual}
    x <- peekCStruct (castPtr p :: Ptr e)
    nextP <- peekByteOff p (chainOffset @e)
    rest <- peekChain @es nextP
    pure (x :& rest)
  {-# INLINE peekChain #-}

instance NilChain '[] where
  nilChain = Nil
  {-# INLINE nilChain #-}

instance (Nil e, NilChain es) => NilChain (e ': es) where
  nilChain = nil :& nilChain @es
  {-# INLINE nilChain #-}

-- | A chainable struct with its chain type hidden — the element type of
-- heterogeneous arrays like @vkCreateGraphicsPipelines@' create-infos, where
-- each element may carry a different chain. Generated @CStruct (f es)@
-- instances carry the 'AllExtends' validity constraints, so a 'SomeStruct'
-- can always be poked.
data SomeStruct (f :: [Type] -> Type) where
  SomeStruct :: (CStruct (f es), PokeChain es) => f es -> SomeStruct f

-- | Eliminate a 'SomeStruct'.
withSomeStruct
  :: SomeStruct f
  -> (forall es. (CStruct (f es), PokeChain es) => f es -> r)
  -> r
withSomeStruct (SomeStruct x) k = k x
{-# INLINEABLE withSomeStruct #-}

-- | A planted chain read back in a shape other than the one planted —
-- driver misbehavior (or a lithon bug), not a user error.
data ChainError
  = ChainMismatch {expected :: !Int32, actual :: !Int32}
  | ChainUnexpectedEnd {expected :: !Int32}
  | ChainUnexpectedTail {tail_ :: !Ptr.WordPtr}
  deriving stock (Eq, Show)

instance Exception ChainError
