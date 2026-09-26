-- | Every bindgen-sys target the CLI offers: the single registration point
-- (a target module, its @lithon-codegen\/data\/\<key\>\/@ directory, and an
-- entry here make a new @lithon-codegen \<key\>@ subcommand).
module Lithon.Codegen.Sys.Targets (
  sysTargets,
) where

import Lithon.Codegen.Sys.Target (SysTarget)
import Lithon.Codegen.Sys.Target.Mpv (mpv)
import Lithon.Codegen.Sys.Target.Sdl3 (sdl3)

sysTargets :: [SysTarget]
sysTargets = [sdl3, mpv]
