-- | The C-expression vocabulary used by translated macros.
--
-- Re-exports @C.Expr.HostPlatform@ from the vendored copy of c-expr-runtime
--
-- Import qualified. Exports are operator classes like @+@, @*@, ...
--
-- For licensing information, see LICENSE_c-expr-runtime in this package's root.
module SDL3.Sys.Bindgen.Runtime.CExpr (
  module C.Expr.HostPlatform,
) where

import C.Expr.HostPlatform
