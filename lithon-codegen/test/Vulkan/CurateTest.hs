{-# LANGUAGE OverloadedStrings #-}

-- | Curation of the checked-in lithon-core profile: the no-dangling
-- invariant over the pruned output (the plan's critical whole-output
-- check), surface spot checks, and the reviewable goldens (curation report
-- + curated summary).
module Vulkan.CurateTest where

import Data.ByteString.Lazy qualified as LBS
import Data.Hash.RapidHash
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Vector qualified as V
import Lithon.Prelude
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.Golden (goldenVsStringDiff)
import Test.Tasty.HUnit (assertBool, (@?=))

import Lithon.Codegen.Backend.Json (canonicalJsonBytes)
import Lithon.Codegen.Vulkan.Curate (Curated (..))
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Resolved.Commands (ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBitmask (..),
  ResolvedDim (..),
  ResolvedFuncpointer (..),
  ResolvedHandle (..),
  ResolvedMember (..),
  ResolvedParam (..),
  ResolvedStruct (..),
  ResolvedTypeRef (..),
  TypeRefKind (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (ResolvedEnumBlock (..), ResolvedEnumItem (..))
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))
import Lithon.Codegen.Vulkan.Resolved.Summary (summarizeResolved)
import Vulkan.Support.Resolve (pinnedCurated)

unit_curatedSurfaceSpotChecks :: IO ()
unit_curatedSurfaceSpotChecks = do
  let reg = pinnedCurated.registry
  Map.size reg.extensions @?= 95
  -- Legacy sync1/renderpass1 command surfaces are out; replacements in.
  Map.member "vkCmdPipelineBarrier" reg.commands @?= False
  Map.member "vkCmdPipelineBarrier2" reg.commands @?= True
  Map.member "vkCmdBeginRenderPass" reg.commands @?= False
  Map.member "vkCreateFramebuffer" reg.commands @?= False
  Map.member "VkRenderingInfo" reg.structs @?= True
  -- VkRenderPassBeginInfo is retained ONLY via a reference edge (an
  -- included sample-locations struct extends it) — the designed behavior
  -- for legacy items something selected still points at.
  Map.member "VkRenderPassBeginInfo" reg.structs @?= True
  -- Descriptor-set machinery is retained (its replacement is not curated).
  Map.member "VkPipelineLayoutCreateInfo" reg.structs @?= True
  Map.member "vkCreateDescriptorSetLayout" reg.commands @?= True
  -- Video never leaks in.
  assertBool
    "no video types"
    (not (any (T.isInfixOf "Video" . forgetNamespace) (Map.keys reg.structs)))
  -- WSI + RT + mesh entry points survive.
  sequence_
    [ assertBool (show c <> " curated") (Map.member c reg.commands)
    | c <-
        [ "vkCreateSwapchainKHR"
        , "vkCmdTraceRaysKHR"
        , "vkCmdDrawMeshTasksEXT"
        , "vkCmdBindDescriptorBuffersEXT"
        ]
          :: [CommandName]
    ]

-- | Every name the curated output mentions resolves inside the curated
-- output.
unit_noDanglingReferences :: IO ()
unit_noDanglingReferences = do
  let reg = pinnedCurated.registry
      typeNames =
        Set.unions
          [ Map.keysSet reg.structs
          , Map.keysSet reg.handles
          , Map.keysSet reg.bitmasks
          , Map.keysSet reg.funcpointers
          , Map.keysSet reg.basetypes
          , Map.keysSet reg.defines
          , Map.keysSet reg.externals
          , Map.keysSet reg.enums
          ]
      valueNames =
        Map.keysSet reg.constants
          <> Set.fromList
            [ v.name
            | b <- Map.elems reg.enums
            , v <- V.toList b.items
            ]
      typeOk r = r.kind == RefVoid || Set.member r.name typeNames
      dangling =
        concat
          [ [ "struct " <> display s.name <> " member " <> m.name <> " -> " <> display m.typeRef.name
            | s <- Map.elems reg.structs
            , m <- V.toList s.members
            , not (typeOk m.typeRef)
            ]
          , [ "struct " <> display s.name <> " member " <> m.name <> " dim " <> display n
            | s <- Map.elems reg.structs
            , m <- V.toList s.members
            , RDimConst{name = n} <- m.arrayDims
            , not (Set.member n valueNames)
            ]
          , [ "struct " <> display s.name <> " sType " <> display v
            | s <- Map.elems reg.structs
            , m <- V.toList s.members
            , v <- m.values
            , not (Set.member v valueNames)
            ]
          , [ "struct " <> display s.name <> " extends " <> display t
            | s <- Map.elems reg.structs
            , t <- s.extends <> s.extendedBy
            , not (Set.member t typeNames)
            ]
          , [ "handle " <> display h.name <> " parent " <> display p
            | h <- Map.elems reg.handles
            , Just p <- [h.parent]
            , not (Set.member p typeNames)
            ]
          , [ "handle " <> display h.name <> " objectType " <> display h.objectTypeValue
            | h <- Map.elems reg.handles
            , not (Set.member h.objectTypeValue valueNames)
            ]
          , [ "bitmask " <> display b.name <> " bits " <> display blockName
            | b <- Map.elems reg.bitmasks
            , Just blockName <- [b.bitsBlock]
            , not (Set.member blockName typeNames)
            ]
          , [ "funcpointer " <> display f.name <> " -> " <> display r.name
            | f <- Map.elems reg.funcpointers
            , r <- f.returnType : map (.typeRef) (V.toList f.params)
            , not (typeOk r)
            ]
          , [ "command " <> display c.name <> " -> " <> display r.name
            | c <- Map.elems reg.commands
            , r <- c.returnType : map (.typeRef) (V.toList c.params)
            , not (typeOk r)
            ]
          , [ "command " <> display c.name <> " code " <> display code
            | c <- Map.elems reg.commands
            , code <- c.successCodes <> c.errorCodes
            , not (Set.member code valueNames)
            ]
          ]
  dangling @?= []

test_curatedGoldens :: TestTree
test_curatedGoldens =
  testGroup
    "curated goldens"
    [ golden
        "curation-report"
        "test/golden/curation-report.golden"
        (canonicalJsonBytes pinnedCurated.report)
    , golden
        "curated-summary"
        "test/golden/curated-summary.golden"
        (canonicalJsonBytes (summarizeResolved pinnedCurated.registry))
    , golden
        "curated-dump-digest"
        "test/golden/curated.digest"
        (show @LByteString (rapidhash (LBS.toStrict (canonicalJsonBytes pinnedCurated.registry) <> "\n")))
    ]
 where
  golden name path bytes = goldenVsStringDiff name diffCmd path (pure bytes)
  diffCmd ref new = ["diff", "-u", ref, new]
