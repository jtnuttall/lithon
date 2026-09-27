-- | Every bindgen-sys target the CLI offers: the single registration point
-- (a target module, its @lithon-codegen\/data\/\<key\>\/@ directory, and an
-- entry here make a new @lithon-codegen \<key\>@ subcommand).
module Lithon.Codegen.Bindgen.Targets (
  bindgenTargets,
) where

import Lithon.Codegen.Bindgen.Target (BindgenTarget)
import Lithon.Codegen.Bindgen.Target.Mpv (mpv)
import Lithon.Codegen.Bindgen.Target.Sdl3 (sdl3)

bindgenTargets :: [BindgenTarget]
bindgenTargets = [sdl3, mpv]
