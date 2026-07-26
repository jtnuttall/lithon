{-# LANGUAGE OverloadedStrings #-}

-- | The ABI ground-truth gate: every computed layout is asserted against
-- real Vulkan headers with C @_Static_assert@s — @sizeof@ and @alignof@
-- for every struct and union, @offsetof@ for every plain struct field
-- (bitfield carriers and union members are skipped: C forbids @offsetof@
-- on bitfields, and union members are all at 0).
--
-- The header is generated from the PINNED registry via Vulkan-Docs'
-- @genvk.py@ (so there is no version skew); @vk_platform.h@\/@vk_video@
-- companions come from the system @vulkan-headers@ via @pkg-config@. When
-- the toolchain (cc, python3+pyparsing, pkg-config) is unavailable the
-- test passes with a loud notice rather than failing — CI runs with the
-- full devshell.
module Vulkan.Generate.AbiTest (
  unit_abiStaticAsserts,
) where

import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import System.Directory (
  createDirectoryIfMissing,
  findExecutable,
  getTemporaryDirectory,
  removePathForcibly,
 )
import System.Exit (ExitCode (..))
import System.FilePath ((</>))
import System.Process (readProcessWithExitCode)
import Test.Tasty.HUnit (Assertion, assertBool, assertFailure)

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Curate (Curated (..))
import Lithon.Codegen.Vulkan.Generate.Layout (
  FieldLayout (..),
  Layouts (..),
  StructLayout (..),
  computeLayouts,
 )
import Lithon.Codegen.Vulkan.Generate.Lower (lowerStructs)
import Lithon.Codegen.Vulkan.Resolved.Avail (PlatformGuard (..))
import Lithon.Codegen.Vulkan.Resolved.Core (ResolvedStruct (..), StructKind (..))
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))
import Vulkan.Support.Paths (registryXmlPath)
import Vulkan.Support.Resolve (pinnedCurated)

unit_abiStaticAsserts :: Assertion
unit_abiStaticAsserts = do
  tools <- traverse findExecutable ["cc", "python3", "pkg-config"]
  pyparsingOk <- probePyparsing
  if any isNothing tools || not pyparsingOk then
    putStrLn @Text
      "ABI GATE SKIPPED: needs cc + python3 (with pyparsing) + pkg-config; \
      \run inside the dev shell for the real gate"
  else
    runGate

probePyparsing :: IO Bool
probePyparsing = do
  (code, _, _) <- readProcessWithExitCode "python3" ["-c", "import pyparsing"] ""
  pure (code == ExitSuccess)

runGate :: Assertion
runGate = do
  layouts <- case lowered of
    Failure errs -> assertFailure (toString ("lower: " <> display errs))
    Success lw -> case computeLayouts (lw, registry) of
      Failure errs -> assertFailure (toString ("layout: " <> display errs))
      Success ls -> pure ls
  tmpRoot <- getTemporaryDirectory
  let dir = tmpRoot </> "lithon-abi-gate"
  removePathForcibly dir
  createDirectoryIfMissing True dir
  -- the exactly-pinned core header
  xml <- registryXmlPath
  let vkDocs = T.unpack (fst (T.breakOn "/xml/vk.xml" (T.pack xml)))
  forM_ ["vulkan_core.h", "vulkan_beta.h"] \header -> do
    (gcode, _, gerr) <-
      readProcessWithExitCode
        "python3"
        [vkDocs </> "scripts/genvk.py", "-registry", xml, "-o", dir, header]
        ""
    case gcode of
      ExitSuccess -> pure ()
      ExitFailure n ->
        assertFailure ("genvk.py " <> header <> " failed (" <> show n <> "): " <> gerr)
  -- companions (vk_platform.h, vk_video/*) via the system headers
  (_, incFlags, _) <- readProcessWithExitCode "pkg-config" ["--cflags-only-I", "vulkan"] ""
  let tu = dir </> "lithon_abi.c"
  TIO.writeFile tu (renderAsserts registry layouts)
  (ccode, _, cerr) <-
    readProcessWithExitCode
      "cc"
      (["-fsyntax-only"] <> includeChain incFlags <> [tu])
      ""
  case ccode of
    ExitSuccess ->
      assertBool "asserted a real surface" (Map.size layouts.layouts > 400)
    ExitFailure _ ->
      assertFailure ("ABI static asserts failed:\n" <> cerr)
 where
  registry = pinnedCurated.registry
  lowered = lowerStructs registry
  -- pkg-config hands us -I<inc>; the pinned core generated OUTSIDE the
  -- real header tree additionally needs -I<inc>/vulkan so its quoted
  -- @#include "vk_platform.h"@ resolves (vk_video/… resolves via <inc>).
  includeChain incFlags =
    concat
      [ [flag, flag <> "/vulkan"]
      | flag <- map toString (words (toText incFlags))
      ]

-- | Structs guarded by a window-system platform macro are skipped (their
-- declarations need windows.h\/Xlib.h\/… — unbuildable off-platform); beta
-- extensions are asserted by defining VK_ENABLE_BETA_EXTENSIONS and
-- including vulkan_beta.h.
skipsPlatform :: ResolvedRegistry -> TypeName -> Bool
skipsPlatform registry name = case Map.lookup name registry.structs of
  Just s -> any (\g -> g.protect /= "VK_ENABLE_BETA_EXTENSIONS") s.platformGuards
  Nothing -> False

renderAsserts :: ResolvedRegistry -> Layouts -> Text
renderAsserts registry layouts =
  T.unlines
    $ [ "#include <stddef.h>"
      , "#define VK_ENABLE_BETA_EXTENSIONS 1"
      , "#include \"vulkan_core.h\""
      , "#include \"vulkan_beta.h\""
      , "// window-system-guarded structs skipped: " <> show (length skipped)
      , ""
      ]
    <> concatMap assertsFor kept
 where
  (skipped, kept) =
    partition (\(n, _) -> skipsPlatform registry n) (Map.toAscList layouts.layouts)
  assertsFor (name, layout) =
    [ sassert ("sizeof(" <> cname <> ") == " <> show layout.size) (cname <> " size")
    , sassert ("_Alignof(" <> cname <> ") == " <> show layout.align) (cname <> " align")
    ]
      <> [ sassert
             ("offsetof(" <> cname <> ", " <> f.name <> ") == " <> show f.offset)
             (cname <> "." <> f.name)
         | not isUnion
         , f <- layout.fields
         , not (Map.member f.name layout.carriers)
         ]
   where
    cname = forgetNamespace name
    isUnion = case Map.lookup name registry.structs of
      Just s -> s.kind == SKUnion
      Nothing -> False
  sassert cond label =
    "_Static_assert(" <> cond <> ", \"" <> label <> "\");"
