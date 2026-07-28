{-# LANGUAGE OverloadedStrings #-}

-- | End-to-end pins for the ABI assertion layer: drive a toy header
-- through the real hs-bindgen pipeline (the same @getReifiedC@ artefact
-- 'Lithon.Codegen.Sdl3.Bindgen.runHeader' demands), distill, and render
-- the @_Static_assert@ TU.
--
-- Pins, in one artifact: the skip set (bitfields, the anonymous union
-- decl behind a named member, the opaque forward decl), byte offsets for
-- plain\/array\/anon-union-typed members, negative enum constant values,
-- the \@since extraction (absent \/ at-baseline \/ post-baseline), and
-- the @SDL_VERSION_ATLEAST@ guard appearing exactly for the
-- post-baseline declaration.
module Sdl3.AbiRenderTest (
  unit_toyDistillPins,
  test_abiRenderGolden,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Text.Encoding qualified as TE
import Data.Text.IO qualified as TIO
import Lithon.HsBindgen qualified as HB
import Lithon.Prelude
import System.FilePath ((</>))
import System.IO.Temp (withSystemTempDirectory)
import Test.Tasty (TestTree)
import Test.Tasty.Golden (goldenVsStringDiff)
import Test.Tasty.HUnit (assertFailure, (@?=))

import Lithon.Codegen.Sdl3.Abi (
  AbiDecl (..),
  AbiEnumConst (..),
  AbiField (..),
  AbiMacroConst (..),
  AbiOverrides (..),
  AbiSince (..),
  StructOverrides (..),
  distillAbi,
  emptyAbiOverrides,
  renderAbiAssertions,
 )

unit_toyDistillPins :: IO ()
unit_toyDistillPins = do
  abi <- toyAbi emptyAbiOverrides
  map (.cTypeName) abi
    @?= [ "struct SDL_ToyMix"
        , "struct SDL_ToyHolder"
        , "union SDL_ToyPayload"
        , "enum SDL_ToyStatus"
        ]
  -- Bitfield members are skipped; plain, array, and anon-union-typed
  -- members are assertable.
  [(f.name, f.byteOffset) | d <- abi, d.cTypeName == "struct SDL_ToyMix", f <- d.fields]
    @?= [("plain", 0), ("wide", 8), ("tag", 16)]
  [(f.name, f.byteOffset) | d <- abi, d.cTypeName == "struct SDL_ToyHolder", f <- d.fields]
    @?= [("kind", 0), ("payload", 4)]
  [(c.name, c.value) | d <- abi, d.cTypeName == "enum SDL_ToyStatus", c <- d.constants]
    @?= [("SDL_TOY_INVALID", -1), ("SDL_TOY_OK", 0), ("SDL_TOY_BIG", 1073741824)]
  map (.since) abi
    @?= [ Just AbiSince{major = 3, minor = 2, patch = 0}
        , Just AbiSince{major = 3, minor = 4, patch = 0}
        , Nothing
        , Just AbiSince{major = 3, minor = 2, patch = 0}
        ]

test_abiRenderGolden :: TestTree
test_abiRenderGolden =
  goldenVsStringDiff
    "abi-toy-assertions"
    (\ref new -> ["diff", "-u", ref, new])
    ("test/golden/sdl3" </> "abi-toy-assertions.golden")
    do
      abi <- toyAbi toyOverrides
      tu <-
        either
          (assertFailure . toString)
          pure
          (renderAbiAssertions ["SDL_toy_abi.h"] abi toyMacroConsts)
      pure (LBS.fromStrict (TE.encodeUtf8 tu))
 where
  -- Every override mechanism, pinned in one golden: a decl-level
  -- correction on a decl with no \since of its own (ToyPayload), a
  -- sizeof gate + member gate on a baseline struct (ToyMix grew at
  -- "3.2.12"), and a value gate on a baseline enum constant (TOY_BIG).
  toyOverrides =
    AbiOverrides
      { decls = Map.fromList [("SDL_ToyPayload", AbiSince{major = 3, minor = 4, patch = 0})]
      , constants = Map.fromList [("SDL_TOY_BIG", AbiSince{major = 3, minor = 4, patch = 0})]
      , macros = mempty
      , structs =
          Map.fromList
            [
              ( "SDL_ToyMix"
              , StructOverrides
                  { sizeofSince = Just AbiSince{major = 3, minor = 2, patch = 12}
                  , members = Map.fromList [("wide", AbiSince{major = 3, minor = 2, patch = 12})]
                  }
              )
            ]
      }
  -- The typed-constant section: probed curated-layer values re-asserted
  -- with ull literals (a 64-bit one included to pin the width story).
  toyMacroConsts =
    [ AbiMacroConst{name = "SDL_TOY_A", value = 1, headerName = "SDL_toy_abi.h", since = Nothing}
    , -- A post-baseline typed constant: pins the guard on macro-value
      -- asserts (the registry's macro-constants table).
      AbiMacroConst
        { name = "SDL_TOY_WIDE"
        , value = 0x8000000000000000
        , headerName = "SDL_toy_abi.h"
        , since = Just AbiSince{major = 3, minor = 4, patch = 0}
        }
    ]

-- | Run the toy header through the same artefact demand as @runHeader@
-- and distill it. A unique temp dir per invocation, mirroring
-- "Sdl3.AliasRenderTest" (the fixed shared name raced under tasty
-- parallelism there).
toyAbi :: AbiOverrides -> IO [AbiDecl]
toyAbi overrides = withSystemTempDirectory "lithon-sdl3-abi-toy" \dir -> do
  TIO.writeFile (dir </> "SDL_toy_abi.h") toyHeader
  let env =
        HB.InvocationEnv
          { extraIncludeDirs = [dir]
          , defineMacros = []
          , doxygenAliases = []
          , fieldNaming = HB.AddFieldPrefixes
          , uniqueId = "lithon-abi-toy"
          }
      spec =
        HB.InvocationSpec
          { baseModule = "SDL3.Sys.Bindgen.ToyAbi"
          , includes = ["SDL_toy_abi.h"]
          , priorSpecs = []
          , prescriptiveSpec = Nothing
          }
  eres <- HB.runBindgen env spec HB.reifiedC
  case eres of
    Left err -> assertFailure ("bindgen error: " <> toString (display err))
    Right cDecls ->
      either (assertFailure . toString) pure (distillAbi "SDL_toy_abi.h" overrides cDecls)

-- | Toy header exercising every distiller rule on x86_64 layouts (the
-- suite runs on the Linux generation host, like generation itself).
toyHeader :: Text
toyHeader =
  unlines
    [ "#ifndef SDL_TOY_ABI_H"
    , "#define SDL_TOY_ABI_H"
    , ""
    , "/**"
    , " * A struct mixing plain members, bitfields, and an array."
    , " *"
    , " * \\since This struct is available since SDL 3.2.0."
    , " */"
    , "typedef struct SDL_ToyMix {"
    , "  int plain;"
    , "  unsigned bits_lo:3;"
    , "  unsigned bits_hi:5;"
    , "  double wide;"
    , "  char tag[4];"
    , "} SDL_ToyMix;"
    , ""
    , "/**"
    , " * A struct with a named member of anonymous union type."
    , " *"
    , " * \\since This struct is available since SDL 3.4.0."
    , " */"
    , "typedef struct SDL_ToyHolder {"
    , "  int kind;"
    , "  union {"
    , "    int ival;"
    , "    float fval;"
    , "  } payload;"
    , "} SDL_ToyHolder;"
    , ""
    , "/**"
    , " * A tagged union; deliberately no since line."
    , " */"
    , "typedef union SDL_ToyPayload {"
    , "  int i;"
    , "  double d;"
    , "  unsigned char raw[16];"
    , "} SDL_ToyPayload;"
    , ""
    , "/**"
    , " * Toy status codes."
    , " *"
    , " * \\since This enum is available since SDL 3.2.0."
    , " */"
    , "typedef enum SDL_ToyStatus {"
    , "  SDL_TOY_INVALID = -1,"
    , "  SDL_TOY_OK = 0,"
    , "  SDL_TOY_BIG = 0x40000000"
    , "} SDL_ToyStatus;"
    , ""
    , "/**"
    , " * An opaque forward declaration."
    , " */"
    , "typedef struct SDL_ToyOpaque SDL_ToyOpaque;"
    , ""
    , "#endif"
    ]
