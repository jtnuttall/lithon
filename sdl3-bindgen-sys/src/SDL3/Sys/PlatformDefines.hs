-- | Platform-detection defines, baked at generation time.
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.PlatformDefines.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.PlatformDefines (
  module SDL3.Sys.Bindgen.PlatformDefines,
)
where

import SDL3.Sys.Bindgen.PlatformDefines
