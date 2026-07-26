-- | Unboxed-vector support for generated handle types.
--
-- Non-dispatchable Vulkan handles are newtypes over 'Data.Word.Word64' with
-- derived 'Foreign.Storable.Storable' and 'Data.Primitive.Types.Prim'
-- instances, which makes 'Data.Vector.Unboxed.Unbox' derivable via
-- 'UnboxViaPrim'. Generated code follows this recipe (two data-family
-- instances are still required by @vector@'s design):
--
-- > newtype Buffer = Buffer Word64
-- >   deriving newtype (Eq, Ord, Show, Storable, Prim)
-- >
-- > newtype instance VU.MVector s Buffer = MV_Buffer (P.MVector s Buffer)
-- > newtype instance VU.Vector Buffer = V_Buffer (P.Vector Buffer)
-- > deriving via (UnboxViaPrim Buffer) instance VGM.MVector VU.MVector Buffer
-- > deriving via (UnboxViaPrim Buffer) instance VG.Vector VU.Vector Buffer
-- > instance VU.Unbox Buffer
module Lithon.Core.Unbox (
  UnboxViaPrim (..),
) where

import Data.Vector.Unboxed (UnboxViaPrim (..))
