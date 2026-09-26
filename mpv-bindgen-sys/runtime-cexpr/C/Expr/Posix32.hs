{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE UndecidableInstances #-}
-- Some options to make this module faster to compile
{-# OPTIONS_GHC -O0 -fmax-pmcheck-models=1 #-}
{-# OPTIONS_GHC -Wno-orphans -Wno-unused-matches #-}

module C.Expr.Posix32 (
  module C.Operator.Classes,
  module C.Expr.Posix32,
) where

-- c-expr

import C.Operator.Classes
import C.Operator.GenInstances (cExprInstances)
import C.Type (OS (..), Platform (..), WordWidth (..))

--------------------------------------------------------------------------------

$( cExprInstances
     ( Platform
         { platformWordWidth = WordWidth32
         , platformOS = Posix
         }
     )
 )
