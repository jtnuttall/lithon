{-# LANGUAGE OverloadedStrings #-}

-- | End-to-end pins for the ABI assertion layer: drive a toy header
-- through the real hs-bindgen pipeline (the same @getReifiedC@ artefact
-- 'Lithon.Codegen.Sdl3.Bindgen.runHeader' demands), distill, and render
-- the @_Static_assert@ TU.
--
-- Pins, in one artifact: the skip set (bitfields, the anonymous union
-- decl behind a named member, the opaque forward decl), byte offsets for
-- plain\/array\/anon-union-typed members, negative enum constant values,
-- the \@since extraction (absent \/ at-baseline \/ post-baseline), the
-- @SDL_VERSION_ATLEAST@ guard appearing exactly for the post-baseline
-- declaration, the layout policy (prefix derived from union membership,
-- overridden in either direction), the pre-growth @#else@ branch of
-- a growth gate, and a member gate read from the member's own
-- \"(added in X.Y.Z)\" note.
module Sdl3.AbiRenderTest (
  unit_toyDistillPins,
  unit_memberSinceRegistryWins,
  unit_prefixDerivesAcrossHeaders,
  test_abiRenderGolden,
  toyAbi,
  toyOverrides,
) where

import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
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
  AbiGrowth (..),
  AbiKind (..),
  AbiLayout (..),
  AbiLayoutBefore (..),
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
        , "struct SDL_ToyBody"
        , "struct SDL_ToyPinned"
        , "struct SDL_ToyOut"
        , "struct SDL_ToyGrown"
        , "struct SDL_ToyPadded"
        , "union SDL_ToyPayload"
        , "enum SDL_ToyStatus"
        ]
  -- Bitfield members are skipped; plain, array, and anon-union-typed
  -- members are assertable.
  [(f.name, f.byteOffset) | d <- abi, d.cTypeName == "struct SDL_ToyMix", f <- d.fields]
    @?= [("plain", 0), ("tag", 5), ("wide", 16)]
  [(f.name, f.byteOffset) | d <- abi, d.cTypeName == "struct SDL_ToyHolder", f <- d.fields]
    @?= [("kind", 0), ("payload", 4)]
  [(c.name, c.value) | d <- abi, d.cTypeName == "enum SDL_ToyStatus", c <- d.constants]
    @?= [("SDL_TOY_INVALID", -1), ("SDL_TOY_OK", 0), ("SDL_TOY_BIG", 1073741824)]
  map (.since) abi
    @?= [ Just AbiSince{major = 3, minor = 2, patch = 0}
        , Just AbiSince{major = 3, minor = 4, patch = 0}
        , Just AbiSince{major = 3, minor = 2, patch = 0}
        , Just AbiSince{major = 3, minor = 2, patch = 0}
        , Just AbiSince{major = 3, minor = 2, patch = 0}
        , Just AbiSince{major = 3, minor = 2, patch = 0}
        , Just AbiSince{major = 3, minor = 2, patch = 0}
        , Nothing
        , Just AbiSince{major = 3, minor = 2, patch = 0}
        ]
  concat [d.memberTypes | d <- abi, d.cTypeName == "union SDL_ToyPayload"]
    @?= ["struct SDL_ToyMix", "struct SDL_ToyBody", "struct SDL_ToyPinned", "struct SDL_ToyGrown"]
  -- Member floors come from the member's own "(added in X.Y.Z)" note
  -- with no registry entry; members without one stay unguarded.
  [(f.name, f.byteOffset, f.since) | d <- abi, d.cTypeName == "struct SDL_ToyGrown", f <- d.fields]
    @?= [ ("type", 0, Nothing)
        , ("reserved", 4, Nothing)
        , ("timestamp", 8, Nothing)
        , ("windowID", 16, Nothing)
        , ("which", 20, Nothing)
        , ("pen_state", 24, Just AbiSince{major = 3, minor = 2, patch = 12})
        ]
  [(f.name, f.byteOffset, f.since) | d <- abi, d.cTypeName == "struct SDL_ToyPadded", f <- d.fields]
    @?= [("a", 0, Nothing), ("b", 8, Nothing), ("c", 12, Just AbiSince{major = 3, minor = 2, patch = 10})]
  [f.since | d <- abi, d.cTypeName == "struct SDL_ToyMix", f <- d.fields]
    @?= [Nothing, Nothing, Nothing]

-- | The registry's member entry wins over the member's own note, and the
-- note is still kept as provenance.
unit_memberSinceRegistryWins :: IO ()
unit_memberSinceRegistryWins = do
  abi <-
    toyAbi
      emptyAbiOverrides
        { structs =
            Map.fromList
              [
                ( "SDL_ToyGrown"
                , StructOverrides
                    { growth = Nothing
                    , layout = Nothing
                    , members = Map.fromList [("pen_state", AbiSince{major = 3, minor = 4, patch = 0})]
                    }
                )
              ]
        }
  [ (f.since, f.commentSince)
    | d <- abi
    , d.cTypeName == "struct SDL_ToyGrown"
    , f <- d.fields
    , f.name == "pen_state"
    ]
    @?= [(Just AbiSince{major = 3, minor = 4, patch = 0}, Just AbiSince{major = 3, minor = 2, patch = 12})]

unit_prefixDerivesAcrossHeaders :: IO ()
unit_prefixDerivesAcrossHeaders = do
  tu <-
    either (assertFailure . toString) pure
      $ renderAbiAssertions "3.9.0" ["SDL_a.h", "SDL_b.h"] [holder, member, other] []
  let sizeofLine ty = filter (("sizeof(" <> ty <> ")") `T.isInfixOf`) (lines tu)
  sizeofLine "struct SDL_B"
    @?= [ "_Static_assert(sizeof(struct SDL_B) LITHON_ABI_PREFIX_OP 16, \"struct SDL_B: baked sizeof 16 \" LITHON_ABI_PREFIX_MSG LITHON_ABI_HELP);"
        ]
  sizeofLine "struct SDL_C"
    @?= [ "_Static_assert(sizeof(struct SDL_C) == 16, \"struct SDL_C: baked sizeof 16 differs from your SDL3 headers\" LITHON_ABI_HELP);"
        ]
 where
  holder = (bare "union SDL_A" "SDL_a.h" AbiUnion){memberTypes = ["struct SDL_B"]}
  member = bare "struct SDL_B" "SDL_b.h" AbiStruct
  other = bare "struct SDL_C" "SDL_b.h" AbiStruct
  bare cTypeName headerName kind =
    AbiDecl
      { cTypeName
      , headerName
      , kind
      , sizeof = 16
      , alignment = 8
      , fields = []
      , constants = []
      , since = Nothing
      , growth = Nothing
      , layout = Nothing
      , memberTypes = []
      }

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
          (renderAbiAssertions "3.9.0" ["SDL_toy_abi.h"] abi toyMacroConsts)
      pure (LBS.fromStrict (TE.encodeUtf8 tu))
 where
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

-- | Every override mechanism, pinned in one golden: a decl-level
-- correction on a decl with no \since of its own (ToyPayload), a
-- growth gate + member gate on an appended member — on a derived-prefix
-- union member (ToyMix grew at "3.2.12") and on an exact struct (ToyOut
-- grew at "3.2.8") — a growth gate whose member gate comes from the
-- member's own "(added in 3.2.12)" note instead of the registry
-- (ToyGrown), a layout override in each direction (ToyPinned exact
-- despite union membership, ToyHolder prefix without it), and a value
-- gate on a baseline enum constant (TOY_BIG). Also the configuration
-- "Sdl3.AbiValidateTest" pins as valid.
toyOverrides :: AbiOverrides
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
                { growth =
                    Just
                      AbiGrowth
                        { since = AbiSince{major = 3, minor = 2, patch = 12}
                        , before = AbiLayoutBefore{sizeof = 12, alignment = 4}
                        }
                , layout = Nothing
                , members = Map.fromList [("wide", AbiSince{major = 3, minor = 2, patch = 12})]
                }
            )
          ,
            ( "SDL_ToyOut"
            , StructOverrides
                { growth =
                    Just
                      AbiGrowth
                        { since = AbiSince{major = 3, minor = 2, patch = 8}
                        , before = AbiLayoutBefore{sizeof = 8, alignment = 4}
                        }
                , layout = Nothing
                , members = Map.fromList [("scale", AbiSince{major = 3, minor = 2, patch = 8})]
                }
            )
          ,
            ( "SDL_ToyGrown"
            , StructOverrides
                { growth =
                    Just
                      AbiGrowth
                        { since = AbiSince{major = 3, minor = 2, patch = 12}
                        , before = AbiLayoutBefore{sizeof = 24, alignment = 8}
                        }
                , layout = Nothing
                , -- Deliberately empty: the member's own note gates it.
                  members = mempty
                }
            )
          ,
            ( "SDL_ToyPinned"
            , StructOverrides{growth = Nothing, layout = Just LayoutExact, members = mempty}
            )
          ,
            ( "SDL_ToyHolder"
            , StructOverrides{growth = Nothing, layout = Just LayoutPrefix, members = mempty}
            )
          ]
    }

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
    , "  char tag[4];"
    , "  double wide;"
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
    , " * A union member with a plain layout."
    , " *"
    , " * \\since This struct is available since SDL 3.2.0."
    , " */"
    , "typedef struct SDL_ToyBody {"
    , "  unsigned type;"
    , "  float x;"
    , "} SDL_ToyBody;"
    , ""
    , "/**"
    , " * A union member the registry pins exact."
    , " *"
    , " * \\since This struct is available since SDL 3.2.0."
    , " */"
    , "typedef struct SDL_ToyPinned {"
    , "  unsigned type;"
    , "  double v;"
    , "} SDL_ToyPinned;"
    , ""
    , "/**"
    , " * A caller-allocated out-struct the union reaches by pointer only."
    , " *"
    , " * \\since This struct is available since SDL 3.2.0."
    , " */"
    , "typedef struct SDL_ToyOut {"
    , "  int w;"
    , "  int h;"
    , "  double scale;"
    , "} SDL_ToyOut;"
    , ""
    , "/**"
    , " * A union member SDL appended to, noted the way SDL notes it"
    , " * (mirrors SDL_PenProximityEvent at 3.4.16)."
    , " *"
    , " * \\since This struct is available since SDL 3.2.0."
    , " */"
    , "typedef struct SDL_ToyGrown {"
    , "  unsigned type;"
    , "  unsigned reserved;"
    , "  double timestamp;"
    , "  unsigned windowID;"
    , "  unsigned which;"
    , "  unsigned pen_state; /**< Complete pen input state at time of event (added in 3.2.12). */"
    , "} SDL_ToyGrown;"
    , ""
    , "/**"
    , " * A member appended into the tail padding: sizeof unchanged."
    , " *"
    , " * \\since This struct is available since SDL 3.2.0."
    , " */"
    , "typedef struct SDL_ToyPadded {"
    , "  double a;"
    , "  unsigned b;"
    , "  unsigned c; /**< Fits the tail padding (added in 3.2.10). */"
    , "} SDL_ToyPadded;"
    , ""
    , "/**"
    , " * A tagged union; deliberately no since line."
    , " */"
    , "typedef union SDL_ToyPayload {"
    , "  int i;"
    , "  double d;"
    , "  unsigned char raw[16];"
    , "  SDL_ToyMix mix;"
    , "  SDL_ToyBody body;"
    , "  SDL_ToyPinned pinned;"
    , "  SDL_ToyOut *out;"
    , "  SDL_ToyGrown grown;"
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
