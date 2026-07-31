{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

-- | Command planning and rendering (generate pass g5).
--
-- Two chained passes share this module:
--
-- * 'planCommands' — the pure plan layer: per-command parameter
--   classification, unified count\/len resolution ('CountSource'), shape
--   taxonomy ('CmdShape', the census the goldens pin), return-channel
--   classification, and dispatch metadata. All decisions are data; nothing
--   here is prose. Planning is fail-fast /within/ a command ('Either') and
--   accumulates errors /across/ commands.
-- * 'renderCommands' — consumes 'CommandPlans' and emits:
--
--     1. __@Lithon.Dispatch@__ — for every command a C-shape type synonym
--        (raw wire types only: pointers are @Ptr ()@, enums are their wire
--        words, so the module is self-contained), a @foreign import ccall
--        \"dynamic\"@ invoker (@unsafe@ except the curated blocking list),
--        and the three FunPtr tables — 'GlobalCmds', 'InstanceCmds',
--        'DeviceCmds' — with initializers that resolve canonical-then-alias
--        spellings through 'Lithon.Core.Loader.getFirstProcAddr'.
--     2. __Wrappers__ in each command's require-group module: @MonadIO@-
--        polymorphic, one pooled-arena checkout per call (skipped entirely
--        for wrappers that marshal nothing), dispatch-table reads guarded
--        by 'Lithon.Core.Loader.checkCommandPtr', params marshalled by the
--        same rules as struct members, @VkResult@ returns as 'Outcome'
--        (never thrown; the registry-derived 'ResultPolicy' folds positive
--        error codes into the @Err@ arm and gates payload peeks on codes
--        the driver actually writes), dual-call enumerations looping on
--        @VK_INCOMPLETE@, created dispatchable handles wrapped with their
--        tables.
--
-- The classifier is total: any parameter it cannot place is a loud
-- 'CmdsError' naming the command and parameter. There are no silent
-- fallbacks — unresolvable counts, unknown scalar returns, and missing
-- receivers are all hard errors.
module Lithon.Codegen.Vulkan.Generate.Cmds (
  BracketKind (..),
  BracketPlan (..),
  CmdDecl (..),
  CmdsError (..),
  CmdShape (..),
  CommandPlan (..),
  CommandPlans (..),
  CountBind (..),
  CountSource (..),
  DualCount (..),
  GenReport (..),
  OutGen (..),
  OutKind (..),
  ParamPlan (..),
  ResultPolicy (..),
  RetKind (..),
  genReport,
  planCommands,
  planNeedsArena,
  renderCommands,
  dispatchModule,
  excludedCommands,
  payloadAlwaysWritten,
  payloadUnwrittenOn,
  resultWatchSet,
  safeList,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Backend.Hs (capitalize, lowerFirst, parenIfSpaced, primeReserved, startsUpper)
import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Vulkan.Generate.Docs (DocKey (..), DocsMap (..))
import Lithon.Codegen.Vulkan.Generate.Layout (FieldLayout (..), Layouts (..), StructLayout (..))
import Lithon.Codegen.Vulkan.Generate.Marshal (
  CountPlan (..),
  FieldPlan (..),
  StructPlan (..),
  StructPlans (..),
 )
import Lithon.Codegen.Vulkan.Generate.Modules (ModuleMap (..))
import Lithon.Codegen.Vulkan.Generate.Names (Names (..))
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Micro.Common (Raw (..))
import Lithon.Codegen.Vulkan.Registry.Micro.Len (LenLevel (..), LenSpec (..))
import Lithon.Codegen.Vulkan.Registry.Types.Enums (BitWidth (..), EnumsKind (..))
import Lithon.Codegen.Vulkan.Resolved.Avail (AliasInfo (..))
import Lithon.Codegen.Vulkan.Resolved.Commands (DispatchLevel (..), ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedBitmask (..),
  ResolvedDim (..),
  ResolvedHandle (..),
  ResolvedMember (..),
  ResolvedParam (..),
  ResolvedStruct (..),
  ResolvedTypeRef (..),
  TypeRefKind (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (
  EnumFlow (..),
  EnumNumber (..),
  ResolvedEnumBlock (..),
  ResolvedEnumItem (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))

-- | A rendered declaration group destined for a module (mirrors the struct
-- renderer's internal shape; the render pass adapts it).
data CmdDecl = CmdDecl
  { site :: Module.Meta
  , needs :: Set Text
  , exports :: [Text]
  , source :: Text
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data CmdsError
  = CUnplannable {command :: !Text, param :: !Text, reason :: !Text}
  | CUnminted {command :: !Text, what :: !Text}
  | CResultPolicy {command :: !Text, reason :: !Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display CmdsError where
  displayBuilder =
    displayBuilder @Text . \case
      CUnplannable{command, param, reason} ->
        "cannot plan " <> command <> "(" <> param <> "): " <> reason
      CUnminted{command, what} ->
        "command " <> command <> ": no minted name for " <> what
      CResultPolicy{command, reason} ->
        "result policy for " <> command <> ": " <> reason

dispatchModule :: Module.Meta
dispatchModule = $$(Module.metaLit ["Lithon", "Vk", "Dispatch"])

-- | Curated blocking-prone commands: imported @safe@ so a stalled or
-- long-running driver call cannot wedge the RTS. Two classes qualify:
-- host-blocking sync (waits, acquires, submits) and long-running driver
-- work (pipeline/shader compilation runs 10s-100s of ms in-driver; swapchain
-- creation can block on the presentation engine).
safeList :: Set Text
safeList =
  Set.fromList
    [ "vkAcquireNextImage2KHR"
    , "vkAcquireNextImageKHR"
    , "vkAcquireProfilingLockKHR"
    , "vkBuildAccelerationStructuresKHR"
    , "vkBuildMicromapsEXT"
    , "vkCopyAccelerationStructureKHR"
    , "vkCopyAccelerationStructureToMemoryKHR"
    , "vkCopyImageToImage"
    , "vkCopyImageToMemory"
    , "vkCopyMemoryToAccelerationStructureKHR"
    , "vkCopyMemoryToImage"
    , "vkCopyMemoryToMicromapEXT"
    , "vkCopyMicromapEXT"
    , "vkCopyMicromapToMemoryEXT"
    , "vkCreateComputePipelines"
    , "vkCreateGraphicsPipelines"
    , "vkCreateRayTracingPipelinesKHR"
    , "vkCreateShadersEXT"
    , "vkCreateSwapchainKHR"
    , "vkDeferredOperationJoinKHR"
    , "vkDeviceWaitIdle"
    , "vkGetQueryPoolResults"
    , "vkQueuePresentKHR"
    , "vkQueueSubmit"
    , "vkQueueSubmit2"
    , "vkQueueWaitIdle"
    , "vkReleaseSwapchainImagesKHR"
    , "vkWaitForFences"
    , "vkWaitForPresentKHR"
    , "vkWaitSemaphores"
    ]

-- | Success codes on which the driver does NOT write a command's out
-- params. The wrapper returns @Ok code Nothing@ for these instead of
-- peeking driver-unwritten memory (zeroed by the arena, but still not a
-- real result). Keys are C command names; codes are canonical VkResult
-- spellings, validated against the command's successcodes at plan time.
payloadUnwrittenOn :: Map Text (Set Text)
payloadUnwrittenOn =
  Map.fromList
    [ ("vkAcquireNextImage2KHR", Set.fromList ["VK_NOT_READY", "VK_TIMEOUT"])
    , ("vkAcquireNextImageKHR", Set.fromList ["VK_NOT_READY", "VK_TIMEOUT"])
    , ("vkGetQueryPoolResults", Set.fromList ["VK_NOT_READY"])
    ]

-- | Watch-set commands whose out params ARE fully written on every success
-- code — the curated waiver for the classification rule below. The
-- pipeline-create family writes every @pPipelines@ element (VK_NULL_HANDLE
-- for compile-required/failed entries) even on VK_PIPELINE_COMPILE_REQUIRED.
payloadAlwaysWritten :: Set Text
payloadAlwaysWritten =
  Set.fromList
    [ "vkCreateComputePipelines"
    , "vkCreateGraphicsPipelines"
    , "vkCreateRayTracingPipelinesKHR"
    ]

-- | Success codes that mean "completed without doing the thing". Any
-- planned command returning one of these that also has out params must be
-- classified in 'payloadUnwrittenOn' or 'payloadAlwaysWritten' — otherwise
-- generation fails, so a registry bump introducing a new such command
-- forces a human decision instead of silently peeking garbage.
resultWatchSet :: Set Text
resultWatchSet =
  Set.fromList
    [ "VK_NOT_READY"
    , "VK_OPERATION_DEFERRED_KHR"
    , "VK_OPERATION_NOT_DEFERRED_KHR"
    , "VK_PIPELINE_COMPILE_REQUIRED"
    , "VK_THREAD_DONE_KHR"
    , "VK_THREAD_IDLE_KHR"
    , "VK_TIMEOUT"
    ]

-- | Wire value of a materialized VkResult code. Loud on any miss — resolved
-- codes were validated against the materialized block upstream, but no
-- silent fallbacks here either.
vkResultWire :: ResolvedRegistry -> Text -> EnumValueName -> Either (Errors CmdsError) Int64
vkResultWire registry ctx code = case Map.lookup VkResult registry.enums of
  Nothing ->
    Left
      ( errors1
          CResultPolicy{command = ctx, reason = "VkResult enum block missing from the resolved registry"}
      )
  Just blk -> case V.find (\i -> i.name == code) blk.items of
    Nothing ->
      Left
        ( errors1
            CResultPolicy
              { command = ctx
              , reason = "VkResult has no materialized value for " <> display code
              }
        )
    Just item -> case item.value of
      NumSigned v -> pure v
      NumBits{} ->
        Left
          ( errors1
              CResultPolicy
                { command = ctx
                , reason = "VkResult value " <> display code <> " materialized as a bit pattern"
                }
          )

-- | Commands that get FFI table entries but NO generated wrapper: the
-- proc-addr seam belongs to 'Lithon.Core.Loader' \/ @Lithon.Dispatch@
-- (@vkGetInstanceProcAddr@ additionally has an /optional/ receiver, which
-- no other curated command has).
excludedCommands :: Set Text
excludedCommands = Set.fromList ["vkGetInstanceProcAddr", "vkGetDeviceProcAddr"]

-- ── plan types ──────────────────────────────────────────────────────────

-- | The census taxonomy. Classification priority for multi-out commands
-- (top wins): Override -> BytesOut -> DualCall -> SizedOutArray -> ChainOut ->
-- FixedOut -> ScalarRet -> ResultOnly -> Unit. So @vkGetPipelineBinaryDataKHR@
-- (fixed struct out + dual bytes out) is BytesOut, and a dual chain-array
-- command is DualCall.
data CmdShape
  = ShapeUnit
  | ShapeScalarRet
  | ShapeResultOnly
  | ShapeFixedOut
  | ShapeChainOut
  | ShapeSizedOutArray
  | ShapeDualCall
  | ShapeBytesOut
  | ShapeOverride
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData, ToJSON)

-- | Where a pre-call count VALUE comes from. Every needed count resolves
-- to one of these or planning fails loudly — the old @\"0\"@ fallback is
-- gone.
data CountSource
  = -- | @fromIntegral (V.length a)@ (or @BS.length@) of a driving input
    -- array parameter (never optional — enforced at resolution).
    CSInVectorLen {arg :: !Text, lenFn :: !Text}
  | -- | @fromIntegral a.field@ — an arrow len whose referenced member
    -- survives as a scalar record field (@pAllocateInfo->commandBufferCount@).
    CSRetainedField {arg :: !Text, field :: !Text}
  | -- | @fromIntegral (V.length a.vec * scale)@ — an arrow len whose
    -- referenced member was absorbed as a vector length by the struct
    -- marshaller (@pAllocateInfo->descriptorSetCount@ ⇒ @setLayouts@).
    CSAbsorbedVec {arg :: !Text, vecField :: !Text, scale :: !Int}
  | -- | The count stays a user-facing scalar parameter (the @dataSize@
    -- family: only OUT arrays reference it, so nothing can derive it).
    CSInScalar {arg :: !Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A pre-call @let@ bind: @let n_X = &lt;source&gt; :: wireTy; n_X' = n_X@.
-- The primed twin exists so dual-call and straight bodies read counts
-- uniformly post-call.
data CountBind = CountBind
  { bindName :: !Text
  , source :: !CountSource
  , wireTy :: !Text
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The mutable count pointer of a dual-call command. At most one per
-- command (enforced); read back through @p_n_@.
data DualCount = DualCount
  { cname :: !Text
  , bindName :: !Text
  , wireTy :: !Text
  , byteSize :: !Int
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Return channel, precomputed to text at plan time (loud on unknown
-- scalar returns — no @Word64@ fallback).
data RetKind
  = RetResult
  | RetVoid
  | -- | @expr@ converts the raw @retw_@ bind to the surface value.
    RetScalar {ty :: !Text, expr :: !Text, imports :: !(Set Text)}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | How a @withX@ bracket cleans up its created payload.
data BracketKind
  = -- | The created handle destroys itself (Instance, Device).
    BSelf
  | -- | @destroyX rcv h [allocator]@.
    BSingle
  | -- | The create returns a vector; destroy each element.
    BVector
  | -- | Pool-allocated vectors free through @freeX rcv pool vec@; the pool
    -- is a retained field of the create's info struct.
    BPoolFree {poolExpr :: !Text, freeReturnsResult :: !Bool}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | A (create, destroy) pairing rendered as an exception-safe @withX@:
-- the continuation always runs and receives the 'Outcome'; cleanup runs
-- only on @Ok@.
data BracketPlan = BracketPlan
  { withName :: !Text
  , destroyMinted :: !Text
  , destroyModule :: !(Maybe Text)
  -- ^ Dotted module of the destroy wrapper (imported when cross-module).
  , kind :: !BracketKind
  , allocatorExpr :: !(Maybe Text)
  -- ^ What to pass for the destroy's allocator param, when it has one:
  -- the create's own allocator arg, or @Nothing@.
  , rcvExpr :: !(Maybe Text)
  -- ^ The destroy's receiver (the create's receiver arg), when it has one.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Destroy-side classification for the pairing pass (internal): does the
-- cleanup destroy the receiver itself, a single handle (Bool: takes an
-- allocator), or free a pool-allocated vector (Bool: returns VkResult)?
data DKind = DSelf !Bool | DSingle !Bool | DPoolFree !Bool

-- | What an out-param produces (drives shape classification and tests).
data OutKind
  = OKScalar
  | OKPtr
  | OKStruct
  | OKChainStruct
  | OKHandle
  | OKScalarVector
  | OKStructVector
  | OKChainStructVector
  | OKHandleVector
  | OKBytes
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData, ToJSON)

data OutGen = OutGen
  { kind :: !OutKind
  , bindName :: !Text
  , hsOutType :: !Text
  , allocStmts :: ![Text]
  , callExpr :: !Text
  , peekStmts :: ![Text]
  , imports :: !(Set Text)
  , constraints :: ![Text]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ParamPlan
  = PReceiver {arg :: !Text, handle :: !TypeName}
  | PIn
      { arg :: !Text
      , hsType :: !Text
      , callExpr :: !Text
      , marshalStmts :: ![Text]
      , imports :: !(Set Text)
      , constraints :: ![Text]
      }
  | -- | A dropped count parameter; 'callExpr' is fully resolved at plan
    -- time (a @n_…@ bind reference, or @castPtr p_n_@ for the dual count).
    PCount {cname :: !Text, callExpr :: !Text}
  | POut {out :: !OutGen, dual :: !Bool}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Per-command VkResult rendering policy, materialized at plan time so the
-- renderer stays total. 'positiveErrWires' is fully registry-derived: any
-- error code whose wire value is non-negative joins the @Err@ test (the
-- sign convention has exactly one exception today,
-- @vkAcquireProfilingLockKHR@'s VK_TIMEOUT). 'unwrittenCodes' comes from
-- 'payloadUnwrittenOn': on these success codes the wrapper returns
-- @Ok code Nothing@ instead of peeking.
data ResultPolicy = ResultPolicy
  { positiveErrWires :: ![Int64]
  , unwrittenCodes :: ![(Text, Int64)]
  -- ^ (canonical name, wire) — names feed the generated doc line.
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Everything the renderer (and the census golden, and the tests) needs
-- to know about one command.
data CommandPlan = CommandPlan
  { name :: !CommandName
  , minted :: !Text
  , level :: !DispatchLevel
  -- ^ Effective level (@vkGetDeviceProcAddr@ lives in the instance table).
  , shape :: !CmdShape
  , params :: ![ParamPlan]
  -- ^ C parameter order.
  , counts :: ![CountBind]
  -- ^ Pre-call binds, emitted before any marshalling.
  , dualCount :: !(Maybe DualCount)
  , ret :: !RetKind
  , resultPolicy :: !(Maybe ResultPolicy)
  -- ^ Present exactly when 'ret' is 'RetResult' and the command is not an
  -- override (overrides encode their policy in the spliced source).
  , imports :: !(Set Text)
  , overrideSource :: !(Maybe Text)
  -- ^ Hand-planned wrapper source (protocols the mechanical planner cannot
  -- express); when present the renderer splices it verbatim.
  , bracket :: !(Maybe BracketPlan)
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Whether a wrapper body allocates — and so brackets a pooled-arena
-- checkout. Pure handle-unwrap wrappers (a quarter of the surface,
-- including every hot @vkCmd*@) skip the arena entirely. Every non-empty
-- 'marshalStmts' list allocates today, so presence is the predicate; if a
-- future marshal shape were pure-only this errs conservative (keeps an
-- arena), while the opposite mistake cannot ship — an Alloc primitive in
-- the plain-IO fallback body is a generated-tree compile error. Exported
-- so the census test can pin the partition.
planNeedsArena :: CommandPlan -> Bool
planNeedsArena plan =
  isJust plan.overrideSource
    || isJust plan.dualCount
    || any isOut plan.params
    || any marshals plan.params
 where
  isOut = \case
    POut{} -> True
    _ -> False
  marshals = \case
    PIn{marshalStmts} -> not (null marshalStmts)
    _ -> False

newtype CommandPlans = CommandPlans
  { plans :: Map CommandName CommandPlan
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | The reviewable summary of what command planning decided: the shape
-- census the goldens pin, plus everything deliberately NOT generated.
data GenReport = GenReport
  { commandCensus :: !(Map Text Int)
  , unpairedCreates :: ![Text]
  -- ^ Creates with a handle out but no @withX@ (no destroy exists, or the
  -- command is an override).
  , retainedInputCounts :: ![(Text, Text)]
  -- ^ (command, param) where a count stays user-facing (the @dataSize@
  -- family: only out arrays reference it).
  , safeCommands :: ![Text]
  -- ^ The effective @safe@-import partition (planned ∩ 'safeList') — the
  -- reviewable form of what src-Lithon-Dispatch.hs.golden pins verbatim.
  , excluded :: ![Text]
  -- ^ Commands with table entries but no wrapper (the proc-addr seam).
  , notes :: ![Text]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

-- | Derive the report from finished plans (pure; goldened).
genReport :: CommandPlans -> GenReport
genReport (CommandPlans m) =
  GenReport
    { commandCensus =
        Map.fromListWith (+) [(shapeTag p.shape, 1) | p <- Map.elems m]
    , unpairedCreates =
        [ forgetNamespace p.name
        | p <- Map.elems m
        , isNothing p.bracket
        , any (`T.isPrefixOf` forgetNamespace p.name) (["vkCreate", "vkAllocate"] :: [Text])
        , any isHandleOut p.params || isJust p.overrideSource
        ]
    , retainedInputCounts =
        [ (forgetNamespace p.name, a)
        | p <- Map.elems m
        , b <- p.counts
        , CSInScalar{arg = a} <- [b.source]
        ]
    , safeCommands =
        sort
          [ forgetNamespace p.name
          | p <- Map.elems m
          , Set.member (forgetNamespace p.name) safeList
          ]
    , excluded = sort (toList excludedCommands)
    , notes =
        [ "VkPipelineCreateInfoKHR is not structextends-extended in the registry; its pNext is emitted write-only-null (affects vkGetPipelineKeyKHR's optional create-info)."
        ]
    }
 where
  shapeTag = T.drop 5 . show -- "ShapeUnit" -> "Unit"
  isHandleOut = \case
    POut o _ -> o.kind `elem` [OKHandle, OKHandleVector]
    _ -> False

-- ── the plan pass ───────────────────────────────────────────────────────

-- | Plan every curated command (minus 'excludedCommands').
planCommands
  :: ( HasType ResolvedRegistry cxt
     , HasType Names cxt
     , HasType ModuleMap cxt
     , HasType Layouts cxt
     , HasType StructPlans cxt
     )
  => cxt
  -> Validation (Errors CmdsError) CommandPlans
planCommands cxt =
  eitherToValidation do
    cps <-
      validationToEither
        (mk <$> traverse (eitherToValidation . planCommand) (Map.toList registry.commands))
    case policyClosure cps of
      [] -> pure cps
      e : es -> Left (foldl' (\acc x -> acc <> errors1 x) (errors1 e) es)
 where
  mk = CommandPlans . attachBrackets . Map.fromList . catMaybes
  registry = getTyped @ResolvedRegistry cxt
  names = getTyped @Names cxt
  moduleMap = getTyped @ModuleMap cxt
  layouts' = getTyped @Layouts cxt
  plans' = getTyped @StructPlans cxt

  -- Closure rules over the finished plan set: the payload tables must name
  -- planned commands (no stale entries), every watch-set command with outs
  -- must be classified (the deterministic prompt on registry bumps), and
  -- waivers must still be earning their keep.
  policyClosure (CommandPlans m) = stale <> unforced <> deadWaiver
   where
    planned = Map.fromList [(forgetNamespace p.name, p) | p <- Map.elems m]
    hasOuts p =
      any (\case POut{} -> True; _ -> False) p.params || isJust p.overrideSource
    watchHit p = case Map.lookup p.name registry.commands of
      Just c -> any ((`Set.member` resultWatchSet) . forgetNamespace) c.successCodes
      Nothing -> False
    watchForced p = p.ret == RetResult && hasOuts p && watchHit p
    classified n = Map.member n payloadUnwrittenOn || Set.member n payloadAlwaysWritten
    stale =
      [ CResultPolicy
          { command = k
          , reason = "payload table names a command that is not planned (stale entry)"
          }
      | k <- Map.keys payloadUnwrittenOn <> Set.toList payloadAlwaysWritten
      , not (Map.member k planned)
      ]
    unforced =
      [ CResultPolicy
          { command = n
          , reason =
              "successcodes include a watch-set code and the command has out params;"
                <> " classify it in payloadUnwrittenOn or payloadAlwaysWritten"
          }
      | (n, p) <- Map.toList planned
      , watchForced p
      , not (classified n)
      ]
    deadWaiver =
      [ CResultPolicy
          { command = n
          , reason = "payloadAlwaysWritten entry no longer meets the watch precondition (dead waiver)"
          }
      | n <- Set.toList payloadAlwaysWritten
      , Just p <- [Map.lookup n planned]
      , not (watchForced p)
      ]

  planCommand (name, c)
    | Set.member (forgetNamespace name) excludedCommands = pure Nothing
    | otherwise = do
        let minted = mintedCmdT name
        override <- overrideFor name minted c
        case override of
          Just (imps, src) -> do
            -- Overrides splice verbatim source, so the mechanical policy
            -- render cannot reach them: refuse configurations that would
            -- need it instead of silently mis-rendering.
            when (Map.member (forgetNamespace name) payloadUnwrittenOn)
              $ failing
                CResultPolicy
                  { command = forgetNamespace name
                  , reason = "payloadUnwrittenOn cannot apply to an override; encode the policy in the override source"
                  }
            errWires <- traverse (vkResultWire registry (forgetNamespace name)) c.errorCodes
            when (any (>= 0) errWires)
              $ failing
                CResultPolicy
                  { command = forgetNamespace name
                  , reason = "override command has positive error codes; hand-update the override source"
                  }
            pure
              ( Just
                  ( name
                  , CommandPlan
                      { name
                      , minted
                      , level = effectiveLevel name c
                      , shape = ShapeOverride
                      , params = []
                      , counts = []
                      , dualCount = Nothing
                      , ret = RetResult
                      , resultPolicy = Nothing
                      , imports = wrapperBaseImports <> imps <> receiverImport c
                      , overrideSource = Just src
                      , bracket = Nothing
                      }
                  )
              )
          Nothing -> do
            dual <- dualCountOf name c
            countBinds <- resolveCounts name c dual
            plans <- planParams name c dual countBinds
            ret <- retKindOf name c
            resultPolicy <- resultPolicyFor name c dual plans ret
            pure
              ( Just
                  ( name
                  , CommandPlan
                      { name
                      , minted
                      , level = effectiveLevel name c
                      , shape = shapeOf plans ret
                      , params = plans
                      , counts = countBinds
                      , dualCount = dual
                      , ret
                      , resultPolicy
                      , imports =
                          wrapperBaseImports
                            <> Set.unions (planImports <$> plans)
                            <> retImports ret
                      , overrideSource = Nothing
                      , bracket = Nothing
                      }
                  )
              )

  -- Materialize the VkResult policy for one mechanically-planned command:
  -- registry-derived positive error wires, plus the curated unwritten set
  -- (validated: codes ⊆ successcodes, command has outs, straight-body).
  resultPolicyFor name c dual plans ret = case ret of
    RetResult -> do
      errWires <- traverse (vkResultWire registry (forgetNamespace name)) c.errorCodes
      unwritten <- case Map.lookup (forgetNamespace name) payloadUnwrittenOn of
        Nothing -> pure []
        Just codes -> do
          let missing =
                Set.filter
                  (\cd -> cd `notElem` fmap forgetNamespace c.successCodes)
                  codes
          unless (null missing)
            $ failing
              CResultPolicy
                { command = forgetNamespace name
                , reason =
                    "payloadUnwrittenOn codes not in successcodes: "
                      <> T.intercalate ", " (Set.toList missing)
                }
          unless (any (\case POut{} -> True; _ -> False) plans)
            $ failing
              CResultPolicy
                { command = forgetNamespace name
                , reason = "payloadUnwrittenOn entry but the command has no out params"
                }
          when (isJust dual)
            $ failing
              CResultPolicy
                { command = forgetNamespace name
                , reason = "payloadUnwrittenOn does not support dual-call commands"
                }
          traverse
            (\sc -> (forgetNamespace sc,) <$> vkResultWire registry (forgetNamespace name) sc)
            [sc | sc <- c.successCodes, forgetNamespace sc `Set.member` codes]
      pure
        ( Just
            ResultPolicy
              { positiveErrWires = filter (>= 0) errWires
              , unwrittenCodes = unwritten
              }
        )
    _ -> pure Nothing

  planImports = \case
    PIn{imports} -> imports
    POut{out} -> out.imports
    PCount{} -> Set.empty
    PReceiver{handle} -> handleImport handle

  receiverImport c = case V.toList c.params of
    (p0 : _) | RefHandle <- p0.typeRef.kind -> handleImport p0.typeRef.name
    _ -> Set.empty

  retImports = \case
    RetResult -> Set.empty
    RetVoid -> Set.empty
    RetScalar{imports} -> imports

  -- vkGetDeviceProcAddr's first param is a device (registry: device level),
  -- but the DEVICE table is resolved THROUGH it — it must live in the
  -- instance table.
  effectiveLevel n c
    | forgetNamespace n == "vkGetDeviceProcAddr" = DispatchInstance
    | otherwise = c.dispatch

  -- ── receiver ────────────────────────────────────────────────────────

  -- The dispatch receiver is always parameter 0. Registry-optional
  -- receivers exist (vkDestroy{Instance,Device} accept VK_NULL_HANDLE in
  -- C; vkGetInstanceProcAddr is excluded outright) but the Haskell surface
  -- always passes a real rich handle, so optionality needs no modelling.
  isDispatchableScalar p =
    null p.pointers
      && null p.arrayDims
      && p.typeRef.kind
      == RefHandle
      && maybe False (.dispatchable) (Map.lookup p.typeRef.name registry.handles)

  receiverArgOf name c = case V.toList c.params of
    (p0 : _) | isDispatchableScalar p0 -> pure (hungarianArg p0.name)
    _ ->
      failing
        CUnminted{command = forgetNamespace name, what = "dispatch receiver (needed to wrap a handle out)"}

  -- ── brackets ────────────────────────────────────────────────────────
  --
  -- Pair every vkCreate*/vkAllocate* that produces a handle with the
  -- destroy/free command for that handle type; render each pair as a
  -- @withX@ in the create's module. Overrides and unpaired creates are
  -- skipped (the report lists them).

  attachBrackets m = Map.mapWithKey attach m
   where
    attach name plan = plan{bracket = bracketFor name plan}

    -- destroyed-handle type -> (destroy command, shape)
    destroyIndex =
      Map.fromList (mapMaybe classifyDestroy (Map.toList registry.commands))
    classifyDestroy (dn, dc)
      | "vkDestroy" `T.isPrefixOf` forgetNamespace dn = case V.toList dc.params of
          [h, pa]
            | RefHandle <- h.typeRef.kind
            , null h.pointers ->
                Just (h.typeRef.name, (dn, DSelf (isAlloc pa)))
          [_rcv, h, pa]
            | RefHandle <- h.typeRef.kind
            , null h.pointers ->
                Just (h.typeRef.name, (dn, DSingle (isAlloc pa)))
          _ -> Nothing
      | "vkFree" `T.isPrefixOf` forgetNamespace dn = case V.toList dc.params of
          [_rcv, h, pa]
            | RefHandle <- h.typeRef.kind
            , null h.pointers ->
                Just (h.typeRef.name, (dn, DSingle (isAlloc pa)))
          [_rcv, _pool, _cnt, arr]
            | RefHandle <- arr.typeRef.kind
            , not (null arr.pointers) ->
                Just (arr.typeRef.name, (dn, DPoolFree (forgetNamespace dc.returnType.name == "VkResult")))
          _ -> Nothing
      | otherwise = Nothing
    isAlloc pa = forgetNamespace pa.typeRef.name == "VkAllocationCallbacks"

    bracketFor name plan
      | isNothing plan.overrideSource
      , "vkCreate" `T.isPrefixOf` forgetNamespace name || "vkAllocate" `T.isPrefixOf` forgetNamespace name
      , Just c <- Map.lookup name registry.commands
      , Just (outT, isVec) <- createdHandleOf c
      , Just (dn, dkind) <- Map.lookup outT destroyIndex
      , Just dplan <- Map.lookup dn m =
          let rcv = case plan.params of
                (PReceiver{arg} : _) -> Just arg
                _ -> Nothing
              createAllocArg =
                safeHead
                  [ q
                  | PIn{arg = q, hsType} <- plan.params
                  , hsType == "Maybe AllocationCallbacks"
                  ]
              allocFor takes
                | takes = Just (fromMaybe "Nothing" createAllocArg)
                | otherwise = Nothing
              stripped =
                fromMaybe plan.minted
                  $ asum
                    [ T.stripPrefix "create" plan.minted
                    , T.stripPrefix "allocate" plan.minted
                    ]
              mkBracket k alloc r =
                BracketPlan
                  { withName = "with" <> capitalize stripped
                  , destroyMinted = dplan.minted
                  , destroyModule = Module.hsName <$> Map.lookup dn moduleMap.commandModules
                  , kind = k
                  , allocatorExpr = alloc
                  , rcvExpr = r
                  }
           in case dkind of
                DSelf takes -> Just (mkBracket BSelf (allocFor takes) Nothing)
                DSingle takes
                  | isVec -> Just (mkBracket BVector (allocFor takes) rcv)
                  | otherwise -> Just (mkBracket BSingle (allocFor takes) rcv)
                DPoolFree frr -> do
                  poolE <- poolExprFor name plan
                  Just (mkBracket BPoolFree{poolExpr = poolE, freeReturnsResult = frr} Nothing rcv)
      | otherwise = Nothing

    -- the pool a pool-allocated vector frees back into: a retained field
    -- of the create's info struct (hand table — two commands)
    poolExprFor name plan = do
      field <- case forgetNamespace name of
        "vkAllocateCommandBuffers" -> Just ("commandPool" :: Text)
        "vkAllocateDescriptorSets" -> Just "descriptorPool"
        _ -> Nothing
      infoArg <- safeHead [arg | PIn{arg} <- plan.params]
      pure (infoArg <> "." <> field)

    -- the handle-out param of a create (type, is-vector)
    createdHandleOf c = case reverse (V.toList c.params) of
      (p : _)
        | RefHandle <- p.typeRef.kind
        , not (null p.pointers)
        , not p.baseConst ->
            Just (p.typeRef.name, isJust p.len)
      _ -> Nothing

  -- ── overrides ───────────────────────────────────────────────────────
  --
  -- Hand-planned protocols the mechanical planner cannot express. Offsets,
  -- sizes and sType wires are read from the layout/marshal passes at
  -- generation time, so registry bumps reshape them automatically; the
  -- shape of the protocol itself is what is pinned here.

  overrideFor name minted c = case forgetNamespace name of
    "vkGetDeviceFaultInfoEXT" -> Just <$> faultInfoOverride minted c
    "vkCreatePipelineBinariesKHR" -> Just <$> pipelineBinariesOverride minted c
    _ -> pure Nothing

  -- Two-phase counts->arrays protocol through TWO structs: query counts
  -- with pFaultInfo=NULL, arena-back the three payload slots, requery,
  -- deep-copy out.
  faultInfoOverride minted c = do
    (countsT, infoT) <- case V.toList c.params of
      [_, pc, pi'] -> pure (pc.typeRef.name, pi'.typeRef.name)
      _ ->
        failing
          CUnplannable{command = "vkGetDeviceFaultInfoEXT", param = "<params>", reason = "unexpected arity"}
    for_ [countsT, infoT] $ \t ->
      when (isExtensible t)
        $ failing
          CUnplannable
            { command = "vkGetDeviceFaultInfoEXT"
            , param = forgetNamespace t
            , reason = "override assumes non-extensible fault structs"
            }
    countsM <- mintedTypeOf c.name countsT
    infoM <- mintedTypeOf c.name infoT
    addrT <- memberTypeOf infoT "pAddressInfos"
    vendT <- memberTypeOf infoT "pVendorInfos"
    addrM <- mintedTypeOf c.name addrT
    vendM <- mintedTypeOf c.name vendT
    offAddr <- offsetOfField infoT "pAddressInfos"
    offVend <- offsetOfField infoT "pVendorInfos"
    offBin <- offsetOfField infoT "pVendorBinaryData"
    for_ ["addressInfoCount", "vendorInfoCount", "vendorBinarySize"] (offsetOfField countsT)
    let (addrSz, addrAl) = structSizeAlign addrT
        (vendSz, vendAl) = structSizeAlign vendT
        call args =
          "mkGetDeviceFaultInfoEXT (checkCommandPtr \"vkGetDeviceFaultInfoEXT\" device.cmds.pGetDeviceFaultInfoEXT) (castPtr device.handle) "
            <> args
        src =
          T.unlines
            [ minted <> " ::"
            , "  forall m."
            , "  (MonadIO m) =>"
            , "  Device ->"
            , "  m (Outcome ("
                <> countsM
                <> ", ByteString, V.Vector "
                <> addrM
                <> ", V.Vector "
                <> vendM
                <> ", ByteString))"
            , minted <> " device ="
            , "  liftIO $ withArena \\arena_ -> runAlloc arena_ do"
            , "    p_counts :: Ptr () <- castPtr <$> new (nil :: " <> countsM <> ")"
            , "    r1_ <- liftIO (" <> call "p_counts nullPtr" <> ")"
            , "    if r1_ < 0"
            , "      then pure (Err (openFromWire r1_))"
            , "      else do"
            , "        counts_ <- liftIO (peekCStruct (castPtr p_counts) :: IO " <> countsM <> ")"
            , "        p_info :: Ptr () <- castPtr <$> new (nil :: " <> infoM <> ")"
            , "        p_addr_ <- arenaBytes ("
                <> show addrSz
                <> " * max 1 (fromIntegral counts_.addressInfoCount)) "
                <> show addrAl
            , "        p_vend_ <- arenaBytes ("
                <> show vendSz
                <> " * max 1 (fromIntegral counts_.vendorInfoCount)) "
                <> show vendAl
            , "        p_bin_ <- arenaBytes (max 1 (fromIntegral counts_.vendorBinarySize)) 8"
            , "        liftIO (pokeByteOff p_info " <> show offAddr <> " (castPtr p_addr_ :: Ptr ()))"
            , "        liftIO (pokeByteOff p_info " <> show offVend <> " (castPtr p_vend_ :: Ptr ()))"
            , "        liftIO (pokeByteOff p_info " <> show offBin <> " (castPtr p_bin_ :: Ptr ()))"
            , "        r2_ <- liftIO (" <> call "p_counts p_info" <> ")"
            , "        if r2_ < 0"
            , "          then pure (Err (openFromWire r2_))"
            , "          else do"
            , "            counts'_ <- liftIO (peekCStruct (castPtr p_counts) :: IO " <> countsM <> ")"
            , "            info_ <- liftIO (peekCStruct (castPtr p_info) :: IO " <> infoM <> ")"
            , "            addrs_ <- liftIO (peekElems (fromIntegral counts'_.addressInfoCount) (castPtr p_addr_))"
            , "            vends_ <- liftIO (peekElems (fromIntegral counts'_.vendorInfoCount) (castPtr p_vend_))"
            , "            bin_ <- liftIO (BS.packCStringLen (castPtr p_bin_, fromIntegral counts'_.vendorBinarySize))"
            , "            pure (Ok (openFromWire r2_) (counts'_, info_.description, addrs_, vends_, bin_))"
            ]
    pure
      ( Set.unions [structImport countsT, structImport infoT, structImport addrT, structImport vendT]
      , src
      )

  -- Dual-call through an in/out handles-info struct: sType/count/array
  -- slots poked by offset, VK_INCOMPLETE loops the whole protocol.
  pipelineBinariesOverride minted c = do
    (createT, handlesT) <- case V.toList c.params of
      [_, pc, _, pb] -> pure (pc.typeRef.name, pb.typeRef.name)
      _ ->
        failing
          CUnplannable
            { command = "vkCreatePipelineBinariesKHR"
            , param = "<params>"
            , reason = "unexpected arity"
            }
    when (isExtensible createT)
      $ failing
        CUnplannable
          { command = "vkCreatePipelineBinariesKHR"
          , param = forgetNamespace createT
          , reason = "override assumes non-extensible create info"
          }
    createM <- mintedTypeOf c.name createT
    binT <- memberTypeOf handlesT "pPipelineBinaries"
    binM <- mintedTypeOf c.name binT
    allocT <- allocationCallbacksName c
    allocM <- mintedTypeOf c.name allocT
    sTypeW <- sTypeWireOf handlesT
    incW <- vkResultWire registry "vkCreatePipelineBinariesKHR" "VK_INCOMPLETE"
    offPNext <- offsetOfField handlesT "pNext"
    offCount <- offsetOfField handlesT "pipelineBinaryCount"
    offArr <- offsetOfField handlesT "pPipelineBinaries"
    let (hSz, hAl) = structSizeAlign handlesT
        call =
          "mkCreatePipelineBinariesKHR (checkCommandPtr \"vkCreatePipelineBinariesKHR\" device.cmds.pCreatePipelineBinariesKHR) (castPtr device.handle) p_createInfo p_allocator (castPtr p_handles_)"
        src =
          T.unlines
            [ minted <> " ::"
            , "  forall m."
            , "  (MonadIO m) =>"
            , "  Device ->"
            , "  " <> createM <> " ->"
            , "  Maybe " <> allocM <> " ->"
            , "  m (Outcome (V.Vector " <> binM <> "))"
            , minted <> " device createInfo allocator ="
            , "  liftIO $ withArena \\arena_ -> runAlloc arena_ do"
            , "    p_createInfo :: Ptr () <- castPtr <$> new createInfo"
            , "    p_allocator :: Ptr () <- maybe (pure nullPtr) (fmap castPtr . new) allocator"
            , "    p_handles_ <- arenaBytes " <> show hSz <> " " <> show hAl
            , "    let goDual_ = do"
            , "          liftIO (pokeByteOff p_handles_ 0 (" <> show sTypeW <> " :: Int32))"
            , "          liftIO (pokeByteOff p_handles_ " <> show offPNext <> " (nullPtr :: Ptr ()))"
            , "          liftIO (pokeByteOff p_handles_ " <> show offCount <> " (0 :: Word32))"
            , "          liftIO (pokeByteOff p_handles_ " <> show offArr <> " (nullPtr :: Ptr ()))"
            , "          r1_ <- liftIO (" <> call <> ")"
            , "          if r1_ < 0"
            , "            then pure (Err (openFromWire r1_))"
            , "            else do"
            , "              n_ <- liftIO (peekByteOff p_handles_ " <> show offCount <> " :: IO Word32)"
            , "              p_arr_ <- arenaBytes (8 * max 1 (fromIntegral n_)) 8"
            , "              liftIO (pokeByteOff p_handles_ " <> show offArr <> " (castPtr p_arr_ :: Ptr ()))"
            , "              r2_ <- liftIO (" <> call <> ")"
            , "              n'_ <- liftIO (peekByteOff p_handles_ " <> show offCount <> " :: IO Word32)"
            , "              if r2_ == " <> show incW
            , "                then goDual_"
            , "                else"
            , "                  if r2_ < 0"
            , "                    then pure (Err (openFromWire r2_))"
            , "                    else do"
            , "                      hs_ <- liftIO (V.generateM (fromIntegral n'_) (\\i -> "
                <> binM
                <> " <$> peekElemOff (castPtr p_arr_ :: Ptr Word64) i))"
            , "                      pure (Ok (openFromWire r2_) hs_)"
            , "    goDual_"
            ]
    pure
      ( Set.unions
          [ structImport createT
          , structImport handlesT
          , structImport allocT
          , handleImport binT
          ]
      , src
      )

  allocationCallbacksName c = case V.toList c.params of
    [_, _, pa, _] -> pure pa.typeRef.name
    _ ->
      failing
        CUnplannable
          { command = "vkCreatePipelineBinariesKHR"
          , param = "pAllocator"
          , reason = "unexpected arity"
          }

  memberTypeOf structT member = case Map.lookup structT registry.structs of
    Just s -> case find (\m -> m.name == member) (V.toList s.members) of
      Just m -> pure m.typeRef.name
      Nothing -> failing CUnminted{command = forgetNamespace structT, what = "member " <> member}
    Nothing -> failing CUnminted{command = forgetNamespace structT, what = "struct"}

  offsetOfField structT member = case Map.lookup structT layouts'.layouts of
    Just l -> case find (\fl -> fl.name == member) l.fields of
      Just fl -> pure fl.offset
      Nothing -> failing CUnminted{command = forgetNamespace structT, what = "layout field " <> member}
    Nothing -> failing CUnminted{command = forgetNamespace structT, what = "layout"}

  sTypeWireOf structT = case Map.lookup structT plans'.plans of
    Just MarshalPlan{sTypeWire = Just w} -> pure w
    _ -> failing CUnminted{command = forgetNamespace structT, what = "sType wire"}

  -- ── counts ──────────────────────────────────────────────────────────

  -- All params whose single-segment len references the given scalar name.
  countRefs c =
    Map.fromListWith
      (flip (<>))
      [ (cn, [p])
      | p <- V.toList c.params
      , Just cn <- [paramSiblingLen p]
      ]
  paramSiblingLen p = case p.len of
    Just Raw{parsed = LenSpec (LenPath (n :| []) :| _)} -> Just n
    _ -> Nothing
  paramArrowLen p = case p.len of
    Just Raw{parsed = LenSpec (LenPath (root :| [fld]) :| _)} -> Just (root, fld)
    _ -> Nothing

  isCountParam c pname =
    Map.member pname (countRefs c) && any (\q -> q.name == pname) (V.toList c.params)

  -- The (at most one) mutable count pointer: a non-const pointer scalar
  -- referenced as a length.
  dualCountOf name c =
    case [ q
         | q <- V.toList c.params
         , Map.member q.name (countRefs c)
         , not (null q.pointers)
         , not q.baseConst
         ] of
      [] -> pure Nothing
      [q] ->
        let (w, sz) = countWire q
         in pure
              (Just DualCount{cname = q.name, bindName = "n_" <> sanitizeBind q.name, wireTy = w, byteSize = sz})
      (q : _ : _) ->
        failing
          CUnplannable
            { command = forgetNamespace name
            , param = q.name
            , reason = "more than one mutable count pointer"
            }

  countWire q = case q.typeRef.kind of
    RefExternal | forgetNamespace q.typeRef.name == "size_t" -> ("CSize", 8 :: Int)
    RefBasetype | forgetNamespace q.typeRef.name == "VkDeviceSize" -> ("Word64", 8)
    RefExternal | forgetNamespace q.typeRef.name == "uint64_t" -> ("Word64", 8)
    _ -> ("Word32", 4)

  -- One resolved bind per needed count: every dropped scalar count param
  -- (drivers or user-facing), plus every arrow len (input checks and out
  -- sizing read the same bind).
  resolveCounts name c dual = do
    scalarBinds <-
      traverse
        (uncurry (resolveScalarCount name))
        [ (q, refs)
        | (cn, refs) <- Map.toList (countRefs c)
        , maybe True (\d -> d.cname /= cn) dual
        , Just q <- [find (\q' -> q'.name == cn) (V.toList c.params)]
        , null q.pointers -- pointer counts are the dual machinery's
        ]
    arrowBinds <-
      traverse
        (uncurry (resolveArrowCount name c))
        (ordNub [af | p <- V.toList c.params, Just af <- [paramArrowLen p]])
    pure (dedupeBinds (scalarBinds <> arrowBinds))
   where
    -- deterministic (bind-name-sorted) and unique
    dedupeBinds = Map.elems . Map.fromList . fmap (\b -> (b.bindName :: Text, b))

  -- A scalar count param: sourced from the first const non-optional
  -- referencing array, or — when only OUT arrays reference it — kept as a
  -- user-facing input.
  resolveScalarCount name q refs = do
    let constRefs = [r | r <- refs, r.baseConst]
        eligible = [r | r <- constRefs, not (paramOptional r)]
    case eligible of
      (driver : _) ->
        pure
          CountBind
            { bindName = "n_" <> sanitizeBind q.name
            , source = CSInVectorLen{arg = hungarianArg driver.name, lenFn = lenFnOf driver}
            , wireTy = fst (countWire q)
            }
      []
        | null constRefs ->
            -- only outs reference it: the count is a real input
            pure
              CountBind
                { bindName = "n_" <> sanitizeBind q.name
                , source = CSInScalar{arg = hungarianArg q.name}
                , wireTy = fst (countWire q)
                }
        | otherwise ->
            failing
              CUnplannable
                { command = forgetNamespace name
                , param = q.name
                , reason = "count is only referenced by optional arrays — no non-optional driver"
                }

  lenFnOf q
    | RefVoid <- q.typeRef.kind = "BS.length"
    | otherwise = "V.length"

  -- An arrow len (@pInfo->member@): the root must be a const struct param;
  -- the member is either retained (scalar record field) or absorbed
  -- (vector length) per the struct marshal plan.
  resolveArrowCount name c root fld = do
    rootP <- case find (\q -> q.name == root) (V.toList c.params) of
      Just q
        | q.baseConst
        , q.typeRef.kind `elem` [RefStruct, RefUnion] ->
            pure q
      _ ->
        failing
          CUnplannable
            { command = forgetNamespace name
            , param = root
            , reason = "arrow len root is not a const struct parameter"
            }
    when (paramOptional rootP)
      $ failing
        CUnplannable
          { command = forgetNamespace name
          , param = root
          , reason = "arrow len root is optional — count would be unsourceable"
          }
    fieldPlans <- case Map.lookup rootP.typeRef.name plans'.plans of
      Just MarshalPlan{fields} -> pure fields
      Just PodPlan -> pure [] -- POD: every member survives verbatim
      _ ->
        failing
          CUnplannable
            { command = forgetNamespace name
            , param = root
            , reason = "arrow len root has no marshal plan"
            }
    let rootArg = hungarianArg root
        bind = "n_" <> sanitizeBind root <> "_" <> sanitizeBind fld
        retained =
          [ f | FScalar{field = f} <- fieldPlans, f == fld
          ]
        absorbed =
          [ (vecField, cp.scale)
          | fp <- fieldPlans
          , Just (vecField, cp) <- [vecCountOf fp]
          , CountSibling{member, drives = True} <- [cp]
          , member == fld
          ]
    case (retained, absorbed, Map.lookup rootP.typeRef.name plans'.plans) of
      (f : _, _, _) ->
        pure
          CountBind{bindName = bind, source = CSRetainedField{arg = rootArg, field = f}, wireTy = "Word32"}
      ([], (vf, sc) : _, _) ->
        pure
          CountBind
            { bindName = bind
            , source = CSAbsorbedVec{arg = rootArg, vecField = vf, scale = sc}
            , wireTy = "Word32"
            }
      ([], [], Just PodPlan) ->
        -- POD structs keep every member as-is
        pure
          CountBind{bindName = bind, source = CSRetainedField{arg = rootArg, field = fld}, wireTy = "Word32"}
      _ ->
        failing
          CUnplannable
            { command = forgetNamespace name
            , param = root
            , reason = "arrow member '" <> fld <> "' is neither retained nor an absorbed vector count"
            }

  vecCountOf = \case
    FVector{field, count} -> Just (field, count)
    FVectorScalar{field, count} -> Just (field, count)
    FStringVector{field, count} -> Just (field, count)
    FBytes{field, count} -> Just (field, count)
    _ -> Nothing

  -- ── parameter planning ──────────────────────────────────────────────

  planParams name c dual countBinds = do
    let params = V.toList c.params
    plansM <- traverse (planParam name c dual countBinds) (zip [0 ..] params)
    pure (catMaybes plansM)

  planParam name c dual countBinds (idx, p) = case () of
    ()
      -- the dispatch receiver (first param, dispatchable handle)
      | idx == (0 :: Int)
      , isDispatchableScalar p ->
          ok PReceiver{arg = hungarianArg p.name, handle = p.typeRef.name}
      -- dual count pointer
      | Just d <- dual
      , d.cname == p.name ->
          ok PCount{cname = p.name, callExpr = "castPtr p_n_"}
      -- dropped scalar count param (a bind supplies the value at the call)
      | isCountParam c p.name
      , null p.pointers
      , Just b <- find (\cb -> cb.bindName == "n_" <> sanitizeBind p.name) countBinds ->
          case b.source of
            CSInScalar{} -> scalarIn -- stays user-facing; PIn.callExpr passes it
            _ -> ok PCount{cname = p.name, callExpr = b.bindName}
      -- fixed-size array params (float[4] blend constants, enum[2] combiner
      -- ops): a Vector with an exact-length runtime check
      | null p.pointers
      , not (null p.arrayDims) ->
          fixedArrayIn
      -- scalar inputs
      | null p.pointers -> scalarIn
      -- pointer params
      | otherwise -> pointerPlan
   where
    ok = pure . Just
    arg = hungarianArg p.name
    isOptional = paramOptional p

    lengthCheckAgainst bindName lenFn v =
      "unless ("
        <> lenFn
        <> " "
        <> v
        <> " == fromIntegral "
        <> bindName
        <> ") (error \"lithon: "
        <> forgetNamespace name
        <> ": "
        <> arg
        <> " length must match the count source\")"

    -- the resolved bind for this param's single-segment or arrow len, if any
    lenBindOf = case (paramSiblingLen p, paramArrowLen p) of
      (Just cn, _)
        | Just d <- dual, d.cname == cn -> Nothing -- dual: no pre-call value
        | otherwise -> find (\b -> b.bindName == "n_" <> sanitizeBind cn) countBinds
      (_, Just (root, fld)) ->
        find (\b -> b.bindName == "n_" <> sanitizeBind root <> "_" <> sanitizeBind fld) countBinds
      _ -> Nothing

    -- is this param the driving array of its count bind?
    isDriver = case lenBindOf of
      Just CountBind{source = CSInVectorLen{arg = a}} -> a == arg
      _ -> False

    scalarIn = do
      g <- scalarGen name p.typeRef p.name
      ok
        PIn
          { arg
          , hsType = g.ty
          , callExpr = parenIfSpaced (g.toWire arg)
          , marshalStmts = []
          , imports = g.imports
          , constraints = []
          }

    fixedArrayIn = do
      g <- scalarGen name p.typeRef p.name
      let (esz, eal) = g.sizeAlign
          n = product (dimLits p.arrayDims)
      ok
        PIn
          { arg
          , hsType = "V.Vector " <> parenIfSpaced g.ty
          , callExpr = "(castPtr p_" <> arg <> ")"
          , marshalStmts =
              [ "unless (V.length "
                  <> arg
                  <> " == "
                  <> show n
                  <> ") (error \"lithon: "
                  <> forgetNamespace name
                  <> ": "
                  <> arg
                  <> " must have exactly "
                  <> show n
                  <> " elements\")"
              , "p_" <> arg <> " <- arenaBytes " <> show (esz * max 1 n) <> " " <> show eal
              , "liftIO (V.imapM_ (\\i v_ -> pokeByteOff p_"
                  <> arg
                  <> " (i * "
                  <> show esz
                  <> ") "
                  <> parenIfSpaced (g.toWire "v_")
                  <> ") "
                  <> arg
                  <> ")"
              ]
          , imports = g.imports
          , constraints = []
          }

    pointerPlan = case (p.typeRef.kind, p.len, p.baseConst) of
      -- const struct/union pointer(s)
      (RefStruct, Nothing, True) -> structIn
      (RefUnion, Nothing, True) -> structIn
      -- counted const arrays
      (_, Just Raw{parsed = LenSpec (LenPath (_ :| []) :| rest)}, True)
        | RefExternal <- p.typeRef.kind
        , forgetNamespace p.typeRef.name == "char"
        , [LenNullTerminated] <- rest ->
            stringVectorIn
        | RefVoid <- p.typeRef.kind -> bytesIn
        | RefStruct <- p.typeRef.kind -> vectorStructIn
        | RefUnion <- p.typeRef.kind -> vectorStructIn
        | otherwise -> vectorScalarIn
      -- arrow-len const arrays: sized by a resolved bind; poke the array,
      -- write no count
      (_, Just Raw{parsed = LenSpec (LenPath (_ :| (_ : _)) :| _)}, True)
        | RefStruct <- p.typeRef.kind -> vectorStructIn
        | otherwise -> vectorScalarIn
      -- latex-len const arrays (pSampleMask): poke, manage no count, doc note
      (_, Just Raw{parsed = LenSpec (LenLatex _ :| _)}, True) ->
        vectorScalarIn
      -- null-terminated string
      (RefExternal, Just Raw{parsed = LenSpec (LenNullTerminated :| _)}, True)
        | forgetNamespace p.typeRef.name == "char" -> stringIn
      -- const void* without len: opaque user data
      (RefVoid, Nothing, True) ->
        ok
          PIn
            { arg
            , hsType = "Ptr ()"
            , callExpr = arg
            , marshalStmts = []
            , imports = Set.empty
            , constraints = []
            }
      -- opaque platform connection pointers (Display*, xcb_connection_t*,
      -- wl_display*): non-const at the C level but inputs
      (RefExternal, Nothing, False)
        | forgetNamespace p.typeRef.name `Set.member` opaquePtrExternals ->
            ok
              PIn
                { arg
                , hsType = "Ptr ()"
                , callExpr = arg
                , marshalStmts = []
                , imports = Set.empty
                , constraints = []
                }
      -- const scalar pointer without len: a single value by-pointer
      -- (vkCmdDrawMultiIndexedEXT's optional pVertexOffset)
      (_, Nothing, True) -> scalarPtrIn
      -- OUT params ------------------------------------------------------
      (_, Just Raw{parsed = LenSpec (LenPath (_ :| []) :| _)}, False)
        | Just d <- dual
        , Just d.cname == paramSiblingLen p ->
            outVector True
        | otherwise -> outVector False
      (_, Just Raw{parsed = LenSpec (LenPath (_ :| (_ : _)) :| _)}, False) ->
        outVector False -- arrow-len outs (pAllocateInfo->…)
      (_, Nothing, False) -> outSingle
      _ ->
        failing
          CUnplannable
            { command = forgetNamespace name
            , param = p.name
            , reason = "unrecognized pointer/len/const shape"
            }

    structIn = do
      let t = p.typeRef.name
      minted <- mintedTypeOf name t
      let ext = isExtensible t
          esv = "es" <> show idx
          core =
            if ext then
              minted <> " " <> esv
            else
              minted
      ok
        PIn
          { arg
          , hsType = if isOptional then "Maybe " <> parenIfSpaced core else core
          , callExpr = "p_" <> arg
          , marshalStmts =
              if isOptional then
                [ "p_"
                    <> arg
                    <> " :: Ptr () <- maybe (pure nullPtr) (fmap castPtr . new) "
                    <> arg
                ]
              else
                ["p_" <> arg <> " :: Ptr () <- castPtr <$> new " <> arg]
          , imports = structImport t
          , constraints =
              if ext then
                [ "AllExtends " <> minted <> " " <> esv
                , "PokeChain " <> esv
                ]
              else
                []
          }

    vectorStructIn = do
      let t = p.typeRef.name
      minted <- mintedTypeOf name t
      let ext = isExtensible t
          elemT = if ext then "SomeStruct " <> minted else minted
          (esz, eal) = structSizeAlign t
          checks v' =
            [ lengthCheckAgainst b.bindName "V.length" v'
            | not isDriver
            , Just b <- [lenBindOf]
            ]
          body v' =
            if ext then
              [ "pv_ <- arenaBytes (" <> show esz <> " * max 1 (V.length " <> v' <> ")) " <> show eal
              , "V.imapM_ (\\i e_ -> withSomeStruct e_ (pokeCStruct (castPtr (pv_ `plusPtr` (i * "
                  <> show esz
                  <> "))))) "
                  <> v'
              , "pure (castPtr pv_ :: Ptr ())"
              ]
            else
              [ "pv_ <- newVector " <> v'
              , "pure (castPtr pv_ :: Ptr ())"
              ]
      ok
        PIn
          { arg
          , hsType =
              let core = "V.Vector " <> parenIfSpaced elemT
               in if isOptional then "Maybe " <> parenIfSpaced core else core
          , callExpr = "p_" <> arg
          , marshalStmts =
              if isOptional then
                [ "p_"
                    <> arg
                    <> " <- maybe (pure nullPtr) (\\v_ -> do { "
                    <> T.intercalate "; " (checks "v_" <> body "v_")
                    <> " }) "
                    <> arg
                ]
              else
                [ "p_"
                    <> arg
                    <> " <- do { "
                    <> T.intercalate "; " (checks arg <> body arg)
                    <> " }"
                ]
          , imports = structImport t
          , constraints = []
          }

    vectorScalarIn = do
      g <- scalarGen name p.typeRef p.name
      let (esz, eal) = g.sizeAlign
          checks v' =
            [ lengthCheckAgainst b.bindName "V.length" v'
            | not isDriver
            , Just b <- [lenBindOf]
            ]
          body v' =
            [ "pv_ <- arenaBytes (" <> show esz <> " * max 1 (V.length " <> v' <> ")) " <> show eal
            , "liftIO (V.imapM_ (\\i v_e -> pokeByteOff pv_ (i * "
                <> show esz
                <> ") "
                <> parenIfSpaced (g.toWire "v_e")
                <> ") "
                <> v'
                <> ")"
            , "pure (castPtr pv_ :: Ptr ())"
            ]
      ok
        PIn
          { arg
          , hsType =
              let core = "V.Vector " <> parenIfSpaced g.ty
               in if isOptional then "Maybe " <> parenIfSpaced core else core
          , callExpr = "p_" <> arg
          , marshalStmts =
              if isOptional then
                [ "p_"
                    <> arg
                    <> " <- maybe (pure nullPtr) (\\v_ -> do { "
                    <> T.intercalate "; " (checks "v_" <> body "v_")
                    <> " }) "
                    <> arg
                ]
              else
                [ "p_"
                    <> arg
                    <> " <- do { "
                    <> T.intercalate "; " (checks arg <> body arg)
                    <> " }"
                ]
          , imports = g.imports
          , constraints = []
          }

    scalarPtrIn = do
      g <- scalarGen name p.typeRef p.name
      let (sz, al) = g.sizeAlign
      ok
        PIn
          { arg
          , hsType = (if isOptional then "Maybe " else "") <> parenIfSpaced g.ty
          , callExpr = "(castPtr p_" <> arg <> ")"
          , marshalStmts =
              if isOptional then
                [ "p_"
                    <> arg
                    <> " <- maybe (pure nullPtr) (\\v_ -> do { pv_ <- arenaBytes "
                    <> show sz
                    <> " "
                    <> show al
                    <> "; liftIO (pokeByteOff pv_ 0 "
                    <> parenIfSpaced (g.toWire "v_")
                    <> "); pure pv_ }) "
                    <> arg
                ]
              else
                [ "p_" <> arg <> " <- arenaBytes " <> show sz <> " " <> show al
                , "liftIO (pokeByteOff p_" <> arg <> " 0 " <> parenIfSpaced (g.toWire arg) <> ")"
                ]
          , imports = g.imports
          , constraints = []
          }

    stringIn =
      ok
        PIn
          { arg
          , hsType = if isOptional then "Maybe ByteString" else "ByteString"
          , callExpr = "p_" <> arg
          , marshalStmts =
              if isOptional then
                ["p_" <> arg <> " :: Ptr () <- maybe (pure nullPtr) (fmap castPtr . newCString) " <> arg]
              else
                ["p_" <> arg <> " :: Ptr () <- castPtr <$> newCString " <> arg]
          , imports = Set.empty
          , constraints = []
          }

    stringVectorIn = do
      let checks =
            [ lengthCheckAgainst b.bindName "V.length" arg
            | not isDriver
            , Just b <- [lenBindOf]
            ]
      ok
        PIn
          { arg
          , hsType = "V.Vector ByteString"
          , callExpr = "p_" <> arg
          , marshalStmts =
              checks <> ["p_" <> arg <> " :: Ptr () <- castPtr <$> newCStrings " <> arg]
          , imports = Set.empty
          , constraints = []
          }

    bytesIn = do
      let checks =
            [ lengthCheckAgainst b.bindName "BS.length" arg
            | not isDriver
            , Just b <- [lenBindOf]
            ]
      ok
        PIn
          { arg
          , hsType = "ByteString"
          , callExpr = "p_" <> arg
          , marshalStmts =
              checks <> ["p_" <> arg <> " :: Ptr () <- castPtr <$> newBytes " <> arg]
          , imports = Set.empty
          , constraints = []
          }

    outSingle = do
      o <- outGenOf name c idx p
      ok POut{out = o, dual = False}

    outVector isDual' = do
      bind <- case lenBindOf of
        Just b -> pure b.bindName
        Nothing
          | isDual', Just d <- dual -> pure d.bindName
          | otherwise ->
              failing
                CUnplannable
                  { command = forgetNamespace name
                  , param = p.name
                  , reason = "sized out array has no resolved count bind"
                  }
      o <- outVectorGenOf name c idx p bind
      ok POut{out = o, dual = isDual'}

  dimLits dims = [fromIntegral n :: Int | d <- dims, n <- dimLitInt d]

  -- ── scalar conversions (args and out peeks) ─────────────────────────

  scalarGen cmd ref pname = case ref.kind of
    RefEnum -> case Map.lookup ref.name registry.enums of
      Just block
        | block.kind == KindBitmask ->
            ( \minted ->
                ScalarGen
                  { ty = "Flags " <> minted
                  , toWire = ("(\\(Flags w) -> w) " <>)
                  , fromWire = ("Flags " <>)
                  , sizeAlign = case block.bitWidth of W32 -> (4, 4); W64 -> (8, 8)
                  , wireT = case block.bitWidth of W32 -> "Word32"; W64 -> "Word64"
                  , imports = enumImport ref.name
                  }
            )
              <$> mintedTypeOf cmd ref.name
      Just block ->
        let open = block.flow == FlowOut || block.flow == FlowBoth
         in ( \minted ->
                if open then
                  ScalarGen
                    { ty = "Open " <> minted
                    , toWire = ("openToWire " <>)
                    , fromWire = ("openFromWire " <>)
                    , sizeAlign = (4, 4)
                    , wireT = "Int32"
                    , imports = enumImport ref.name
                    }
                else
                  ScalarGen
                    { ty = minted
                    , toWire = ("toWire " <>)
                    , fromWire = ("unsafeFromWire " <>)
                    , sizeAlign = (4, 4)
                    , wireT = "Int32"
                    , imports = enumImport ref.name
                    }
            )
              <$> mintedTypeOf cmd ref.name
      Nothing -> failing CUnminted{command = forgetNamespace cmd, what = forgetNamespace ref.name}
    RefBitmask -> case Map.lookup ref.name registry.bitmasks of
      Just bm ->
        ( \minted ->
            ScalarGen
              { ty = minted
              , toWire = ("(\\(Flags w) -> w) " <>)
              , fromWire = ("Flags " <>)
              , sizeAlign = case bm.bitWidth of W32 -> (4, 4); W64 -> (8, 8)
              , wireT = case bm.bitWidth of W32 -> "Word32"; W64 -> "Word64"
              , imports = bitmaskImport ref.name
              }
        )
          <$> mintedTypeOf cmd ref.name
      Nothing -> failing CUnminted{command = forgetNamespace cmd, what = forgetNamespace ref.name}
    RefHandle -> case Map.lookup ref.name registry.handles of
      Just h
        | h.dispatchable ->
            ( \minted ->
                ScalarGen
                  { ty = minted
                  , toWire = \v -> "castPtr " <> v <> ".handle :: Ptr ()"
                  , fromWire = id
                  , sizeAlign = (8, 8)
                  , wireT = "Ptr ()"
                  , imports = handleImport ref.name
                  }
            )
              <$> mintedTypeOf cmd ref.name
        | otherwise ->
            ( \minted ->
                ScalarGen
                  { ty = minted
                  , toWire = \v -> "case " <> v <> " of " <> minted <> " w_ -> w_"
                  , fromWire = \v -> minted <> " " <> v
                  , sizeAlign = (8, 8)
                  , wireT = "Word64"
                  , imports = handleImport ref.name
                  }
            )
              <$> mintedTypeOf cmd ref.name
      Nothing -> failing CUnminted{command = forgetNamespace cmd, what = forgetNamespace ref.name}
    RefBasetype -> case forgetNamespace ref.name of
      "VkBool32" ->
        pure
          ScalarGen
            { ty = "Bool"
            , toWire = \v -> "if " <> v <> " then 1 else 0 :: Word32"
            , fromWire = \v -> "(" <> v <> " /= (0 :: Word32))"
            , sizeAlign = (4, 4)
            , wireT = "Word32"
            , imports = Set.empty
            }
      other -> pure (primScalar (basetypePrim other))
    RefExternal -> pure (primScalar (externalPrimTy (forgetNamespace ref.name)))
    RefFuncpointer ->
      pure
        ScalarGen
          { ty = "FunPtr ()"
          , toWire = id
          , fromWire = id
          , sizeAlign = (8, 8)
          , wireT = "FunPtr ()"
          , imports = Set.empty
          }
    _ ->
      failing
        CUnplannable
          { command = forgetNamespace cmd
          , param = pname
          , reason = "unloweable scalar reference"
          }

  -- Newtype prims cross the wire as their base words: the C-shape
  -- synonyms are raw, so DeviceSize/DeviceAddress/SampleMask convert via
  -- fromIntegral in both directions (pokes annotated with the wire type;
  -- peeks are annotated at the peek site).
  primScalar (t, sa) =
    ScalarGen
      { ty = t
      , toWire = castTo
      , fromWire = castFrom
      , sizeAlign = sa
      , wireT = wire
      , imports = primImport t
      }
   where
    wire = case t of
      "DeviceSize" -> "Word64"
      "DeviceAddress" -> "Word64"
      "SampleMask" -> "Word32"
      other -> other
    castTo v
      | wire /= t = "fromIntegral " <> v <> " :: " <> wire
      | otherwise = v
    castFrom v
      | wire /= t = "fromIntegral " <> v
      | otherwise = v
  basetypePrim = \case
    "VkDeviceSize" -> ("DeviceSize", (8, 8))
    "VkDeviceAddress" -> ("DeviceAddress", (8, 8))
    "VkSampleMask" -> ("SampleMask", (4, 4))
    _ -> ("Word64", (8, 8))
  externalPrimTy = \case
    "uint8_t" -> ("Word8", (1, 1))
    "uint16_t" -> ("Word16", (2, 2))
    "uint32_t" -> ("Word32", (4, 4))
    "uint64_t" -> ("Word64", (8, 8))
    "int32_t" -> ("Int32", (4, 4))
    "int64_t" -> ("Int64", (8, 8))
    "size_t" -> ("CSize", (8, 8))
    "float" -> ("Float", (4, 4))
    "double" -> ("Double", (8, 8))
    "int" -> ("Int32", (4, 4))
    "Display" -> ("Ptr ()", (8, 8))
    "xcb_connection_t" -> ("Ptr ()", (8, 8))
    "xcb_window_t" -> ("Word32", (4, 4))
    "xcb_visualid_t" -> ("Word32", (4, 4))
    "Window" -> ("Word64", (8, 8))
    "VisualID" -> ("Word64", (8, 8))
    "RROutput" -> ("Word64", (8, 8))
    "HANDLE" -> ("Ptr ()", (8, 8))
    "HMONITOR" -> ("Ptr ()", (8, 8))
    "DWORD" -> ("Word32", (4, 4))
    "LPCWSTR" -> ("Ptr ()", (8, 8))
    _ -> ("Word64", (8, 8))
  primImport t
    | t == "DeviceSize" || t == "DeviceAddress" || t == "SampleMask" =
        one "import Lithon.Core.BaseTypes (DeviceAddress (..), DeviceSize (..), SampleMask (..))"
    | otherwise = Set.empty
  enumImport t = moduleImp (Map.lookup t moduleMap.enumModules)
  bitmaskImport t = moduleImp (Map.lookup t moduleMap.bitmaskModules)
  handleImport t = moduleImp (Map.lookup t moduleMap.handleModules)
  moduleImp = maybe Set.empty (\m -> one ("import " <> Module.hsName m))

  -- ── out generators ──────────────────────────────────────────────────

  outGenOf cmd c idx p = do
    let bind = "o_" <> hungarianArg p.name
    case p.typeRef.kind of
      RefStruct -> outStructGen cmd c idx p bind
      RefUnion -> outStructGen cmd c idx p bind
      RefVoid ->
        pure
          OutGen
            { kind = OKPtr
            , bindName = bind
            , hsOutType = "Ptr ()"
            , allocStmts = ["p_" <> bind <> " <- arenaBytes 8 8"]
            , callExpr = "castPtr p_" <> bind
            , peekStmts = [bind <> " <- liftIO (peekByteOff p_" <> bind <> " 0)"]
            , imports = Set.empty
            , constraints = []
            }
      RefHandle -> outHandleGen cmd c p bind
      _ -> do
        g <- scalarGen cmd p.typeRef p.name
        let (sz, al) = g.sizeAlign
        pure
          OutGen
            { kind = OKScalar
            , bindName = bind
            , hsOutType = g.ty
            , allocStmts = ["p_" <> bind <> " <- arenaBytes " <> show sz <> " " <> show al]
            , callExpr = "castPtr p_" <> bind
            , peekStmts =
                [ "w_" <> bind <> " <- liftIO (peekByteOff p_" <> bind <> " 0 :: IO " <> parenIfSpaced g.wireT <> ")"
                , "let " <> bind <> " = " <> g.fromWire ("w_" <> bind)
                ]
            , imports = g.imports
            , constraints = []
            }

  outStructGen cmd _c idx p bind = do
    let t = p.typeRef.name
    minted <- mintedTypeOf cmd t
    let ext = isExtensible t
        esv = "es" <> show idx
    if ext then
      pure
        OutGen
          { kind = OKChainStruct
          , bindName = bind
          , hsOutType = minted <> " " <> esv
          , allocStmts =
              ["p_" <> bind <> " :: Ptr () <- castPtr <$> new (nil :: " <> minted <> " " <> esv <> ")"]
          , callExpr = "p_" <> bind
          , peekStmts =
              [bind <> " <- liftIO (peekCStruct (castPtr p_" <> bind <> "))"]
          , imports = structImport t
          , constraints =
              [ "AllExtends " <> minted <> " " <> esv
              , "PokeChain " <> esv
              , "PeekChain " <> esv
              , "NilChain " <> esv
              ]
          }
    else
      -- nil-poke, not bare bytes: the spec requires the app to initialize
      -- sType/pNext even on pure-output structs, and zeroed memory is
      -- still the wrong sType. Mirrors the vector path's per-element nil.
      pure
        OutGen
          { kind = OKStruct
          , bindName = bind
          , hsOutType = minted
          , allocStmts =
              ["p_" <> bind <> " :: Ptr () <- castPtr <$> new (nil :: " <> minted <> ")"]
          , callExpr = "p_" <> bind
          , peekStmts =
              [bind <> " <- liftIO (peekCStruct (castPtr p_" <> bind <> "))"]
          , imports = structImport t
          , constraints = []
          }

  outHandleGen cmd c p bind = do
    let t = p.typeRef.name
    minted <- mintedTypeOf cmd t
    case Map.lookup t registry.handles of
      Just h
        | h.dispatchable -> do
            wrap <- wrapDispatch cmd c minted ("hp_" <> bind) bind
            pure
              OutGen
                { kind = OKHandle
                , bindName = bind
                , hsOutType = minted
                , allocStmts = ["p_" <> bind <> " <- arenaBytes 8 8"]
                , callExpr = "castPtr p_" <> bind
                , peekStmts =
                    [ "hp_" <> bind <> " <- liftIO (peekByteOff p_" <> bind <> " 0 :: IO (Ptr ()))"
                    , wrap
                    ]
                , imports = handleImport t
                , constraints = []
                }
        | otherwise ->
            pure
              OutGen
                { kind = OKHandle
                , bindName = bind
                , hsOutType = minted
                , allocStmts = ["p_" <> bind <> " <- arenaBytes 8 8"]
                , callExpr = "castPtr p_" <> bind
                , peekStmts =
                    [ "w_" <> bind <> " <- liftIO (peekByteOff p_" <> bind <> " 0 :: IO Word64)"
                    , "let " <> bind <> " = " <> minted <> " w_" <> bind
                    ]
                , imports = handleImport t
                , constraints = []
                }
      Nothing -> failing CUnminted{command = forgetNamespace cmd, what = forgetNamespace t}

  -- How a freshly created dispatchable handle acquires its table. The
  -- peeked pointer is @Ptr ()@; the handle constructor wants @Ptr X_T@.
  wrapDispatch cmd c minted ptrVar bind = case minted of
    "Instance" ->
      pure
        ( bind
            <> " <- liftIO ("
            <> minted
            <> " (castPtr "
            <> ptrVar
            <> ") <$> initInstanceCmds "
            <> ptrVar
            <> ")"
        )
    "Device" -> do
      rcv <- receiverArgOf cmd c
      pure
        ( bind
            <> " <- liftIO ("
            <> minted
            <> " (castPtr "
            <> ptrVar
            <> ") <$> initDeviceCmds "
            <> rcv
            <> ".cmds "
            <> ptrVar
            <> ")"
        )
    _ -> do
      rcv <- receiverArgOf cmd c
      pure
        ( "let "
            <> bind
            <> " = "
            <> minted
            <> " (castPtr "
            <> ptrVar
            <> ") "
            <> rcv
            <> ".cmds"
        )

  outVectorGenOf cmd c idx p bindVar = do
    let bind = "o_" <> hungarianArg p.name
        t = p.typeRef.name
        esv = "es" <> show idx
    case p.typeRef.kind of
      RefStruct -> do
        minted <- mintedTypeOf cmd t
        let (sz, al) = structSizeAlign t
            ext = isExtensible t
            elemT = if ext then minted <> " " <> esv else minted
        pure
          OutGen
            { kind = if ext then OKChainStructVector else OKStructVector
            , bindName = bind
            , hsOutType = "V.Vector " <> parenIfSpaced elemT
            , allocStmts =
                [ "p_"
                    <> bind
                    <> " <- arenaBytes ("
                    <> show sz
                    <> " * max 1 (fromIntegral "
                    <> bindVar
                    <> ")) "
                    <> show al
                , "forM_ ([0 .. fromIntegral "
                    <> bindVar
                    <> " - 1] :: [Int]) (\\i -> pokeCStruct (castPtr (p_"
                    <> bind
                    <> " `plusPtr` (i * "
                    <> show sz
                    <> "))) (nil :: "
                    <> parenIfSpaced elemT
                    <> "))"
                ]
            , callExpr = "castPtr p_" <> bind
            , peekStmts =
                [ bind
                    <> " <- liftIO (peekElems (fromIntegral "
                    <> bindVar
                    <> "') (castPtr p_"
                    <> bind
                    <> "))"
                ]
            , imports = structImport t
            , constraints =
                if ext then
                  [ "AllExtends " <> minted <> " " <> esv
                  , "PokeChain " <> esv
                  , "PeekChain " <> esv
                  , "NilChain " <> esv
                  ]
                else
                  []
            }
      RefHandle -> do
        minted <- mintedTypeOf cmd t
        let disp = maybe False (.dispatchable) (Map.lookup t registry.handles)
        wrapE <-
          if disp then do
            rcv <- receiverArgOf cmd c
            pure
              ( "(\\hp -> "
                  <> minted
                  <> " (castPtr hp) "
                  <> rcv
                  <> ".cmds) <$> peekElemOff (castPtr p_"
                  <> bind
                  <> " :: Ptr (Ptr ())) i"
              )
          else
            pure
              ( minted
                  <> " <$> peekElemOff (castPtr p_"
                  <> bind
                  <> " :: Ptr Word64) i"
              )
        pure
          OutGen
            { kind = OKHandleVector
            , bindName = bind
            , hsOutType = "V.Vector " <> parenIfSpaced minted
            , allocStmts =
                ["p_" <> bind <> " <- arenaBytes (8 * max 1 (fromIntegral " <> bindVar <> ")) 8"]
            , callExpr = "castPtr p_" <> bind
            , peekStmts =
                [ bind
                    <> " <- liftIO (V.generateM (fromIntegral "
                    <> bindVar
                    <> "') (\\i -> "
                    <> wrapE
                    <> "))"
                ]
            , imports = handleImport t
            , constraints = []
            }
      RefVoid ->
        pure
          OutGen
            { kind = OKBytes
            , bindName = bind
            , hsOutType = "ByteString"
            , allocStmts =
                ["p_" <> bind <> " <- arenaBytes (max 1 (fromIntegral " <> bindVar <> ")) 8"]
            , callExpr = "castPtr p_" <> bind
            , peekStmts =
                [ bind
                    <> " <- liftIO (BS.packCStringLen (castPtr p_"
                    <> bind
                    <> ", fromIntegral "
                    <> bindVar
                    <> "'))"
                ]
            , imports = Set.empty
            , constraints = []
            }
      _ -> do
        g <- scalarGen cmd p.typeRef p.name
        let (sz, al) = g.sizeAlign
        pure
          OutGen
            { kind = OKScalarVector
            , bindName = bind
            , hsOutType = "V.Vector " <> parenIfSpaced g.ty
            , allocStmts =
                [ "p_"
                    <> bind
                    <> " <- arenaBytes ("
                    <> show sz
                    <> " * max 1 (fromIntegral "
                    <> bindVar
                    <> ")) "
                    <> show al
                ]
            , callExpr = "castPtr p_" <> bind
            , peekStmts =
                [ bind
                    <> " <- liftIO (V.generateM (fromIntegral "
                    <> bindVar
                    <> "') (\\i -> (\\w_ -> "
                    <> g.fromWire "w_"
                    <> ") <$> (peekByteOff p_"
                    <> bind
                    <> " (i * "
                    <> show sz
                    <> ") :: IO "
                    <> parenIfSpaced g.wireT
                    <> ")))"
                ]
            , imports = g.imports
            , constraints = []
            }

  -- ── return channel ──────────────────────────────────────────────────

  retKindOf name c
    | forgetNamespace c.returnType.name == "VkResult" = pure RetResult
    | forgetNamespace c.returnType.name == "void" = pure RetVoid
    | otherwise = do
        g <- scalarGen name c.returnType "<return>"
        pure RetScalar{ty = g.ty, expr = g.fromWire "retw_", imports = g.imports}

  -- ── shape classification (see 'CmdShape' for the priority order) ────

  shapeOf plans ret
    | any (\o -> o.kind == OKBytes) outs = ShapeBytesOut
    | any snd outPairs = ShapeDualCall
    | any (\o -> o.kind `elem` vectorKinds) outs = ShapeSizedOutArray
    | any (\o -> o.kind == OKChainStruct) outs = ShapeChainOut
    | not (null outs) = ShapeFixedOut
    | RetScalar{} <- ret = ShapeScalarRet
    | RetResult <- ret = ShapeResultOnly
    | otherwise = ShapeUnit
   where
    outPairs = [(o, d) | POut o d <- plans]
    outs = fmap fst outPairs
    vectorKinds = [OKScalarVector, OKStructVector, OKChainStructVector, OKHandleVector]

  -- ── shared helpers ──────────────────────────────────────────────────

  isExtensible t = case Map.lookup t registry.structs of
    Just s -> not (null s.extendedBy)
    Nothing -> False

  structSizeAlign t = case Map.lookup t layouts'.layouts of
    Just l -> (l.size, l.align)
    Nothing -> (8, 8)

  structImport t =
    maybe
      Set.empty
      (\m -> Set.fromList ["import " <> Module.hsName m])
      (Map.lookup t moduleMap.structModules)

  mintedTypeOf cmd t = case Map.lookup t names.typeNames of
    Just m -> pure m
    Nothing -> failing CUnminted{command = forgetNamespace cmd, what = forgetNamespace t}

  mintedCmdT n = Map.findWithDefault (forgetNamespace n) n names.commandNames

  wrapperBaseImports =
    Set.fromList
      [ "import Control.Monad (forM_, unless, when)"
      , "import Control.Monad.IO.Class (MonadIO, liftIO)"
      , "import Data.ByteString (ByteString)"
      , "import Data.ByteString qualified as BS"
      , "import Data.Int (Int32, Int64)"
      , "import Data.Vector qualified as V"
      , "import Data.Word (Word8, Word16, Word32, Word64)"
      , "import Foreign.C.Types (CSize (..))"
      , "import Foreign.Ptr (FunPtr, Ptr, castPtr, nullPtr, plusPtr)"
      , "import Foreign.Storable (peekByteOff, peekElemOff, pokeByteOff)"
      , "import Lithon.Core.Alloc (arenaBytes, newBytes, newCString, newCStrings, runAlloc, withArena)"
      , "import Lithon.Core.BaseTypes (Bool32 (..), toBool, pattern FALSE, pattern TRUE)"
      , "import Lithon.Core.CStruct (CStruct (..), Chainable (..), FromCStruct (..), Nil (..), new, newVector, peekElems)"
      , "import Lithon.Core.Chain (AllExtends, Chain, NilChain (..), PeekChain (..), PokeChain (..), SomeStruct (..), withSomeStruct)"
      , "import Lithon.Core.Flags (Flags (..))"
      , "import Lithon.Core.Loader (checkCommandPtr)"
      , "import Lithon.Core.Open (HasWire (..), Open (..), openFromWire, openToWire, unsafeFromWire)"
      , "import Lithon.Vk.Dispatch"
      , "import Lithon.Vk.Result (Outcome (..))"
      ]

  failing :: CmdsError -> Either (Errors CmdsError) a
  failing = Left . errors1

-- ── the render pass ─────────────────────────────────────────────────────

-- | Render @Lithon.Dispatch@ and every command wrapper from the plans.
renderCommands
  :: ( HasType ResolvedRegistry cxt
     , HasType Names cxt
     , HasType ModuleMap cxt
     , HasType DocsMap cxt
     , HasType CommandPlans cxt
     )
  => cxt
  -> Validation (Errors CmdsError) [CmdDecl]
renderCommands cxt =
  case vkResultWire registry "renderCommands" "VK_INCOMPLETE" of
    Left errs -> eitherToValidation (Left errs)
    Right incompleteW ->
      assemble
        <$> traverse (eitherToValidation . wrapperDecl incompleteW) (Map.elems cmdPlans.plans)
 where
  registry = getTyped @ResolvedRegistry cxt
  names = getTyped @Names cxt
  moduleMap = getTyped @ModuleMap cxt
  cmdPlans = getTyped @CommandPlans cxt
  docsMap = getTyped @DocsMap cxt
  withDocs k src = case Map.findWithDefault [] k docsMap.docs of
    [] -> src
    d -> T.intercalate "\n" (d <> [src])

  assemble wrappers = dispatchDecl : wrappers

  -- ── Lithon.Dispatch ─────────────────────────────────────────────────

  dispatchDecl =
    CmdDecl
      { site = dispatchModule
      , needs =
          Set.fromList
            [ "import Control.Monad.IO.Class (liftIO)"
            , "import Data.ByteString qualified as BS"
            , "import Data.Int (Int32, Int64)"
            , "import Data.Word (Word8, Word16, Word32, Word64)"
            , "import Foreign.C.Types (CSize (..))"
            , "import Foreign.Ptr (FunPtr, Ptr, castPtr, nullFunPtr, nullPtr)"
            , "import GHC.IO (unsafePerformIO)"
            , "import Lithon.Core.Loader (castCommandPtr, getFirstProcAddr, getProcAddr)"
            ]
      , exports =
          [ "GlobalCmds (..)"
          , "InstanceCmds (..)"
          , "DeviceCmds (..)"
          , "globalCmds"
          , "initGlobalCmds"
          , "initInstanceCmds"
          , "initDeviceCmds"
          ]
            <> ["mk" <> capitalize (minted c) | (_, c) <- allCmds]
      , source = dispatchSource
      }
   where
    minted c = Map.findWithDefault (forgetNamespace c.name) c.name names.commandNames

  allCmds :: [(CommandName, ResolvedCommand)]
  allCmds = Map.toList registry.commands

  byLevel lvl = [(n, c) | (n, c) <- allCmds, effectiveLevel n c == lvl]

  effectiveLevel n c
    | forgetNamespace n == "vkGetDeviceProcAddr" = DispatchInstance
    | otherwise = c.dispatch

  dispatchSource =
    T.unlines
      $ concatMap synAndImport allCmds
      <> tableSource "GlobalCmds" "initGlobalCmds" globalsPlus
      <> [ ""
         , "-- | The global commands, resolved once (the loader always exposes"
         , "-- them; no other global state exists in lithon)."
         , "globalCmds :: GlobalCmds"
         , "globalCmds = unsafePerformIO (initGlobalCmds ())"
         , "{-# NOINLINE globalCmds #-}"
         ]
      <> tableSource "InstanceCmds" "initInstanceCmds" instancePlus
      <> deviceTableSource (byLevel DispatchDevice)
   where
    globalsPlus = byLevel DispatchGlobal
    instancePlus = byLevel DispatchInstance

  -- one C-shape synonym + one dynamic importer per command
  synAndImport (name, c) =
    [ ""
    , "type C_" <> mintedCmdT name <> " ="
    , "  " <> T.intercalate " -> " (fmap ffiParamTy (V.toList c.params) <> [ffiRetTy c])
    , "foreign import ccall "
        <> (if Set.member (forgetNamespace name) safeList then "safe" else "unsafe")
        <> " \"dynamic\" mk"
        <> capitalize (mintedCmdT name)
        <> " :: FunPtr C_"
        <> mintedCmdT name
        <> " -> C_"
        <> mintedCmdT name
    ]
  mintedCmdT n = Map.findWithDefault (forgetNamespace n) n names.commandNames

  -- DeviceCmds: fields like the others, but the initializer resolves each
  -- entry point via the instance table's vkGetDeviceProcAddr (canonical,
  -- then aliases), which the loader dispatches per-device.
  deviceTableSource cmds' =
    [ ""
    , "data DeviceCmds = DeviceCmds"
    ]
      <> case cmds' of
        [] -> ["  {"]
        ((n0, _) : rest) ->
          ("  { p" <> capitalize (mintedCmdT n0) <> " :: FunPtr C_" <> mintedCmdT n0)
            : [ "  , p" <> capitalize (mintedCmdT n) <> " :: FunPtr C_" <> mintedCmdT n
              | (n, _) <- rest
              ]
      <> [ "  }"
         , ""
         , "initDeviceCmds :: InstanceCmds -> Ptr () -> IO DeviceCmds"
         , "initDeviceCmds icmds dev = do"
         , "  let gdpa nm = BS.useAsCString nm (mkGetDeviceProcAddr icmds.pGetDeviceProcAddr dev . castPtr)"
         , "      -- explicit signature: MonoLocalBinds would otherwise pin the"
         , "      -- table cast to the first field's C shape"
         , "      firstOf :: [BS.ByteString] -> IO (FunPtr a)"
         , "      firstOf [] = pure (castCommandPtr nullFunPtr)"
         , "      firstOf (nm : rest) = do"
         , "        fp <- gdpa nm"
         , "        if fp == nullFunPtr then firstOf rest else pure (castCommandPtr fp)"
         , "  DeviceCmds"
         ]
      <> [ "    "
             <> (if i == (0 :: Int) then "<$> " else "<*> ")
             <> "firstOf "
             <> spellingsOf n c
         | (i, (n, c)) <- zip [0 ..] cmds'
         ]
   where
    spellingsOf n c =
      "["
        <> T.intercalate
          ", "
          ( ("\"" <> forgetNamespace n <> "\"")
              : ["\"" <> display a.name <> "\"" | a <- V.toList c.aliases]
          )
        <> "]"

  tableSource tyName initName cmds' =
    [ ""
    , "data " <> tyName <> " = " <> tyName
    ]
      <> case cmds' of
        [] -> ["  {"]
        ((n0, _) : rest) ->
          ("  { p" <> capitalize (mintedCmdT n0) <> " :: FunPtr C_" <> mintedCmdT n0)
            : [ "  , p" <> capitalize (mintedCmdT n) <> " :: FunPtr C_" <> mintedCmdT n
              | (n, _) <- rest
              ]
      <> [ "  }"
         , ""
         , "-- | Resolve every "
             <> tyName
             <> " entry point (canonical spelling first,"
         , "-- then alias spellings for drivers predating promotion)."
         , initName <> " :: " <> initArg tyName <> " -> IO " <> tyName
         , initName <> " h ="
         , "  " <> tyName
         ]
      <> [ "    "
             <> (if i == (0 :: Int) then "<$> " else "<*> ")
             <> "(castCommandPtr <$> getFirstProcAddr "
             <> receiver tyName
             <> " "
             <> spellings n c
             <> ")"
         | (i, (n, c)) <- zip [0 ..] cmds'
         ]
   where
    initArg t = case t of
      "GlobalCmds" -> "()"
      _ -> "Ptr ()"
    receiver t = case t of
      "GlobalCmds" -> "(nullPtr :: Ptr ())"
      _ -> "h"
    spellings n c =
      "["
        <> T.intercalate
          ", "
          ( ("\"" <> forgetNamespace n <> "\"")
              : ["\"" <> display a.name <> "\"" | a <- V.toList c.aliases]
          )
        <> "]"

  -- ── FFI-level types (raw wire; self-contained) ──────────────────────

  ffiParamTy p
    | not (null p.pointers) = "Ptr ()"
    | not (null p.arrayDims) = "Ptr ()"
    | otherwise = ffiScalarTy p.typeRef
  ffiRetTy c
    | c.returnType.kind == RefFuncpointer = "IO (FunPtr ())"
    | forgetNamespace c.returnType.name == "void" = "IO ()"
    | otherwise = "IO " <> parenIfSpaced (ffiScalarTy c.returnType)
  ffiScalarTy ref = case ref.kind of
    RefHandle -> case Map.lookup ref.name registry.handles of
      Just h | h.dispatchable -> "Ptr ()"
      _ -> "Word64"
    -- FlagBits blocks used as bare scalar params wire as their mask width
    RefEnum -> case Map.lookup ref.name registry.enums of
      Just b | b.kind == KindBitmask -> case b.bitWidth of
        W32 -> "Word32"
        W64 -> "Word64"
      _ -> "Int32"
    RefBitmask -> case Map.lookup ref.name registry.bitmasks of
      Just bm | bm.bitWidth == W64 -> "Word64"
      _ -> "Word32"
    RefBasetype -> case forgetNamespace ref.name of
      "VkBool32" -> "Word32"
      "VkDeviceSize" -> "Word64"
      "VkDeviceAddress" -> "Word64"
      "VkSampleMask" -> "Word32"
      _ -> "Word64"
    RefExternal -> case forgetNamespace ref.name of
      "uint8_t" -> "Word8"
      "uint16_t" -> "Word16"
      "uint32_t" -> "Word32"
      "uint64_t" -> "Word64"
      "int32_t" -> "Int32"
      "int64_t" -> "Int64"
      "size_t" -> "CSize"
      "float" -> "Float"
      "double" -> "Double"
      "int" -> "Int32"
      "HANDLE" -> "Ptr ()"
      "HMONITOR" -> "Ptr ()"
      "DWORD" -> "Word32"
      "LPCWSTR" -> "Ptr ()"
      "Display" -> "Ptr ()"
      "Window" -> "Word64"
      "VisualID" -> "Word64"
      "RROutput" -> "Word64"
      "xcb_connection_t" -> "Ptr ()"
      "xcb_window_t" -> "Word32"
      "xcb_visualid_t" -> "Word32"
      _ -> "Word64"
    RefFuncpointer -> "FunPtr ()"
    _ -> "Word64"

  -- ── wrappers ────────────────────────────────────────────────────────

  wrapperDecl incompleteW plan = do
    site <- case Map.lookup plan.name moduleMap.commandModules of
      Just m -> pure m
      Nothing -> Left (errors1 CUnminted{command = forgetNamespace plan.name, what = "command module"})
    pure
      CmdDecl
        { site
        , needs = plan.imports <> maybe Set.empty bracketNeeds plan.bracket
        , exports = [plan.minted] <> maybe [] (\bp -> [bp.withName]) plan.bracket
        , source =
            T.intercalate
              "\n"
              ( withDocs (DocCommand plan.name) (fromMaybe (wrapperSource incompleteW plan) plan.overrideSource)
                  : maybe [] (\bp -> [bracketSource plan bp]) plan.bracket
              )
        }

  bracketNeeds bp =
    Set.fromList
      ( [ "import Control.Exception (bracket)"
        , "import Control.Monad.IO.Unlift (MonadUnliftIO, withRunInIO)"
        ]
          <> ["import Control.Monad (void)" | BPoolFree{freeReturnsResult = True} <- [bp.kind]]
          <> ["import " <> m | Just m <- [bp.destroyModule]]
      )

  -- \| @withX@: run the create, hand the continuation the 'Outcome' (always),
  -- destroy on @Ok@ only — exception-safe via 'bracket'.
  bracketSource plan bp = T.unlines (sig <> impl)
   where
    receiver = [r | r@PReceiver{} <- plan.params]
    ins = [i | i@PIn{} <- plan.params]
    outs = [o | POut o _ <- plan.params]
    rcvTy = case receiver of
      (PReceiver{handle} : _) ->
        [Map.findWithDefault (forgetNamespace handle) handle names.typeNames]
      _ -> []
    rcvArg = case receiver of
      (PReceiver{arg} : _) -> [arg]
      _ -> []
    esVars =
      ordNub
        ( concatMap
            ( \case
                PIn{constraints} -> mapMaybe esOfB constraints
                POut o _ -> mapMaybe esOfB o.constraints
                _ -> []
            )
            plan.params
        )
    esOfB cstr = case T.words cstr of
      [_, v] | "es" `T.isPrefixOf` v -> Just v
      [_, _, v] | "es" `T.isPrefixOf` v -> Just v
      _ -> Nothing
    constraints' =
      ordNub
        ( "MonadUnliftIO m"
            : concatMap
              ( \case
                  PIn{constraints} -> constraints
                  POut o _ -> o.constraints
                  _ -> []
              )
              plan.params
        )
    payloadTys = fmap (.hsOutType) outs
    payloadT = case payloadTys of
      [] -> "()"
      [t] -> t
      ts -> "(" <> T.intercalate ", " ts <> ")"
    argNames = rcvArg <> [arg | PIn{arg} <- plan.params]
    allocSuffix = maybe "" (" " <>) bp.allocatorExpr
    rcv = fromMaybe "" bp.rcvExpr
    cleanup = case bp.kind of
      BSelf -> bp.destroyMinted <> " h_" <> allocSuffix
      BSingle -> bp.destroyMinted <> " " <> rcv <> " h_" <> allocSuffix
      BVector ->
        "V.mapM_ (\\h1_ -> "
          <> bp.destroyMinted
          <> " "
          <> rcv
          <> " h1_"
          <> allocSuffix
          <> ") h_"
      BPoolFree{poolExpr, freeReturnsResult} ->
        (if freeReturnsResult then "void (" else "")
          <> bp.destroyMinted
          <> " "
          <> rcv
          <> " "
          <> poolExpr
          <> " h_"
          <> (if freeReturnsResult then ")" else "")
    sig =
      [ bp.withName <> " ::"
      , "  forall m r" <> mconcat [" " <> v | v <- esVars] <> "."
      , "  (" <> T.intercalate ", " constraints' <> ") =>"
      ]
        <> ["  " <> t <> " ->" | t <- rcvTy]
        <> ["  " <> i.hsType <> " ->" | i <- ins]
        <> [ "  (Outcome " <> parenIfSpaced payloadT <> " -> m r) ->"
           , "  m r"
           ]
    impl =
      [ bp.withName <> " " <> T.unwords argNames <> " cont_ ="
      , "  withRunInIO \\run_ ->"
      , "    bracket"
      , "      (run_ (" <> plan.minted <> " " <> T.unwords argNames <> "))"
      , "      (\\o_ -> case o_ of"
      , "          Ok _ h_ -> run_ (" <> cleanup <> ")"
      , "          Err _ -> pure ())"
      , "      (run_ . cont_)"
      ]

  wrapperSource incompleteW plan = T.unlines (sig <> impl)
   where
    plans = plan.params
    minted = plan.minted
    receiver = [r | r@PReceiver{} <- plans]
    ins = [i | i@PIn{} <- plans]
    outs = [o | POut o _ <- plans]
    dualOuts = [o | POut o True <- plans]
    nonDualOuts = [o | POut o False <- plans]
    isDual = isJust plan.dualCount
    returnsResult = plan.ret == RetResult

    -- VkResult policy (plan-materialized): positive error wires join the
    -- Err test; unwritten codes short-circuit to @Ok code Nothing@.
    posWires = maybe [] (.positiveErrWires) plan.resultPolicy
    unwrittenCodes' = maybe [] (.unwrittenCodes) plan.resultPolicy
    gated = not (null unwrittenCodes')
    errCond r = T.intercalate " || " ((r <> " < 0") : [r <> " == " <> show w | w <- posWires])
    unwrittenCond r = T.intercalate " || " [r <> " == " <> show w | (_, w) <- unwrittenCodes']

    -- The gated-payload container. Swap point if a strict Maybe is ever
    -- wanted: these three plus one wrapperBaseImports line.
    payloadWrapT t = "Maybe " <> parenIfSpaced t
    payloadJustE e = "Just " <> parenIfSpaced e
    payloadNothingE = "Nothing" :: Text

    rcvTy = case receiver of
      (PReceiver{handle} : _) ->
        [Map.findWithDefault (forgetNamespace handle) handle names.typeNames]
      _ -> []
    rcvArg = case receiver of
      (PReceiver{arg} : _) -> arg
      _ -> ""

    esVars =
      ordNub
        ( concatMap
            ( \case
                PIn{constraints} -> mapMaybe esOf constraints
                POut o _ -> mapMaybe esOf o.constraints
                _ -> []
            )
            plans
        )
    esOf cstr = case T.words cstr of
      [_, v] | "es" `T.isPrefixOf` v -> Just v
      [_, _, v] | "es" `T.isPrefixOf` v -> Just v
      _ -> Nothing
    allConstraints =
      ordNub
        ( "MonadIO m"
            : concatMap
              ( \case
                  PIn{constraints} -> constraints
                  POut o _ -> o.constraints
                  _ -> []
              )
              plans
        )

    payloadTys = fmap (.hsOutType) outs <> [t | RetScalar{ty = t} <- [plan.ret]]
    payloadT = case payloadTys of
      [] -> "()"
      [t] -> t
      ts -> "(" <> T.intercalate ", " ts <> ")"
    gatedPayloadT
      | gated = payloadWrapT payloadT
      | otherwise = payloadT
    retT
      | returnsResult = "m (Outcome " <> parenIfSpaced gatedPayloadT <> ")"
      | otherwise = "m " <> parenIfSpaced payloadT
    retDoc
      | gated =
          " -- ^ 'Nothing' when the driver returns "
            <> T.intercalate " \\/ " [n | (n, _) <- unwrittenCodes']
            <> " without writing the out params."
      | otherwise = ""

    sig =
      [ minted
          <> " ::"
      , "  forall m"
          <> mconcat [" " <> v | v <- esVars]
          <> "."
      , "  (" <> T.intercalate ", " allConstraints <> ") =>"
      ]
        <> ["  " <> t <> " ->" | t <- rcvTy]
        <> ["  " <> i.hsType <> " ->" | i <- ins]
        <> ["  " <> retT <> retDoc]

    argNames = [rcvArg | not (null rcvTy)] <> [arg | PIn{arg} <- plans]

    impl =
      [ minted <> " " <> T.unwords argNames <> " ="
      , if planNeedsArena plan then
          "  liftIO $ withArena \\arena_ -> runAlloc arena_ do"
        else
          "  liftIO do"
      ]
        <> indent 4 countBindLines
        <> indent 4 (concatMap marshalOf plans)
        <> indent 4 (concatMap (.allocStmts) nonDualOuts)
        <> indent 4 (if isDual then dualBody else straightBody)

    marshalOf = \case
      PIn{marshalStmts} -> marshalStmts
      _ -> []

    -- pre-call count values: every resolved bind, emitted before any
    -- marshalling so length checks can reference them. The primed
    -- post-call twin is only emitted when an out actually reads it.
    countBindLines =
      concat
        [ ("let " <> b.bindName <> " = " <> sourceExpr b <> " :: " <> b.wireTy)
            : [ "    " <> b.bindName <> "' = " <> b.bindName
              | primedUsed b
              ]
        | b <- plan.counts
        ]
    primedUsed b =
      any
        (\o -> any (T.isInfixOf (b.bindName <> "'")) o.peekStmts)
        outs
    sourceExpr b = case b.source of
      CSInVectorLen{arg, lenFn} -> "fromIntegral (" <> lenFn <> " " <> arg <> ")"
      CSRetainedField{arg, field} -> "fromIntegral " <> arg <> "." <> field
      CSAbsorbedVec{arg, vecField, scale}
        | scale == 1 -> "fromIntegral (V.length " <> arg <> "." <> vecField <> ")"
        | otherwise ->
            "fromIntegral (V.length " <> arg <> "." <> vecField <> " * " <> show scale <> ")"
      CSInScalar{arg} -> "fromIntegral " <> arg

    -- C-order call arguments (PIn.callExpr is parenthesized at
    -- construction; the others are built bare here)
    callArgs = fmap argOf plans
    argOf = \case
      PReceiver{arg} -> "(castPtr " <> arg <> ".handle)"
      PIn{callExpr} -> callExpr
      PCount{callExpr} -> parenIfSpaced callExpr
      POut o _ -> parenIfSpaced o.callExpr

    -- The table read is guarded: a command the loader never resolved
    -- throws a named MissingCommand instead of jumping to null.
    funPtr =
      "(checkCommandPtr \""
        <> forgetNamespace plan.name
        <> "\" "
        <> rawFunPtr
        <> ")"
    rawFunPtr = case receiver of
      (PReceiver{arg} : _) -> arg <> ".cmds.p" <> capitalize minted
      _ -> "globalCmds.p" <> capitalize minted
    callLine = "mk" <> capitalize minted <> " " <> funPtr <> " " <> T.unwords callArgs

    peekAll = concatMap (.peekStmts) outs
    payloadE = case fmap (.bindName) outs <> ["ret_" | RetScalar{} <- [plan.ret]] of
      [] -> "()"
      [b] -> b
      bs -> "(" <> T.intercalate ", " bs <> ")"

    straightBody = case plan.ret of
      RetResult
        | gated ->
            [ "r_ <- liftIO (" <> callLine <> ")"
            , "if " <> errCond "r_"
            , "  then pure (Err (openFromWire r_))"
            , "  else"
            , "    -- completed without writing the out params on these codes"
            , "    if " <> unwrittenCond "r_"
            , "      then pure (Ok (openFromWire r_) " <> payloadNothingE <> ")"
            , "      else do"
            ]
              <> indent
                8
                ( peekAll
                    <> ["pure (Ok (openFromWire r_) " <> parenIfSpaced (payloadJustE payloadE) <> ")"]
                )
        | otherwise ->
            [ "r_ <- liftIO (" <> callLine <> ")"
            , "if " <> errCond "r_"
            , "  then pure (Err (openFromWire r_))"
            , "  else do"
            ]
              <> indent 4 (peekAll <> ["pure (Ok (openFromWire r_) " <> parenIfSpaced payloadE <> ")"])
      RetVoid ->
        ["liftIO (" <> callLine <> ")"]
          <> peekAll
          <> ["pure " <> parenIfSpaced payloadE]
      RetScalar{expr} ->
        ["retw_ <- liftIO (" <> callLine <> ")"]
          <> peekAll
          <> ["let ret_ = " <> expr]
          <> ["pure " <> parenIfSpaced payloadE]

    -- dual-call: count query -> alloc -> fill, looping on VK_INCOMPLETE (5).
    -- Non-dual outs are peeked in the success path too (mixed shapes like
    -- vkGetPipelineBinaryDataKHR).
    dualBody =
      [ "p_n_ <- arenaBytes " <> show dualCountSize <> " " <> show dualCountSize
      , "liftIO (pokeByteOff p_n_ 0 (0 :: " <> dualCountTy <> "))"
      , "let goDual_ = do"
      ]
        <> indent 6 dualLoop
        <> ["goDual_"]
    dualLoop
      | returnsResult =
          [ "r1_ <- liftIO (" <> callWithNullData <> ")"
          , "if " <> errCond "r1_"
          , "  then pure (Err (openFromWire r1_))"
          , "  else do"
          ]
            <> indent
              4
              ( dualAllocAndFill "r2_ <- liftIO"
                  <> [ "if r2_ == " <> show incompleteW
                     , "  then goDual_"
                     , "  else"
                     , "    if " <> errCond "r2_"
                     , "      then pure (Err (openFromWire r2_))"
                     , "      else do"
                     ]
                  <> indent 8 (dualPeek <> ["pure (Ok (openFromWire r2_) " <> parenIfSpaced payloadE <> ")"])
              )
      | otherwise =
          ["_ <- liftIO (" <> callWithNullData <> ")"]
            <> dualAllocAndFill "_ <- liftIO"
            <> dualPeek
            <> ["pure " <> parenIfSpaced payloadE]
    dualAllocAndFill callBind =
      [ dualBindName <> " <- liftIO (peekByteOff p_n_ 0 :: IO " <> dualCountTy <> ")"
      ]
        <> concatMap (.allocStmts) dualOuts
        <> [ callBind <> " (" <> callLine <> ")"
           , dualBindName <> "' <- liftIO (peekByteOff p_n_ 0 :: IO " <> dualCountTy <> ")"
           ]
    dualPeek = concatMap (.peekStmts) dualOuts <> concatMap (.peekStmts) nonDualOuts
    callWithNullData =
      "mk"
        <> capitalize minted
        <> " "
        <> funPtr
        <> " "
        <> T.unwords (fmap nullDataArg plans)
    nullDataArg = \case
      POut _ True -> "nullPtr"
      other -> argOf other
    (dualCountTy, dualCountSize, dualBindName) = case plan.dualCount of
      Just d -> (d.wireTy, d.byteSize, d.bindName)
      Nothing -> ("Word32", 4 :: Int, "n_")

    indent n = fmap (T.replicate n " " <>)

-- ── plan-independent helpers ────────────────────────────────────────────

data ScalarGen = ScalarGen
  { ty :: Text
  , toWire :: Text -> Text
  , fromWire :: Text -> Text
  , sizeAlign :: (Int, Int)
  , wireT :: Text
  -- ^ The raw FFI-side type; peeks are annotated with it so @fromIntegral@
  -- conversions in generated code are never ambiguous.
  , imports :: Set Text
  }

paramOptional :: ResolvedParam -> Bool
paramOptional p = case p.isOptional of
  Just (o :| _) -> o
  _ -> False

-- | Platform connection pointers that are C-non-const but semantically
-- opaque inputs.
opaquePtrExternals :: Set Text
opaquePtrExternals =
  Set.fromList ["Display", "xcb_connection_t", "wl_display", "wl_surface", "CAMetalLayer"]

dimLitInt :: ResolvedDim -> [Integer]
dimLitInt = \case
  RDimLit n -> [n]
  RDimConst{size} -> [size]

-- ── text helpers ────────────────────────────────────────────────────────

hungarianArg :: Text -> Text
hungarianArg n
  | Just rest <- T.stripPrefix "pp" n, startsUpper rest = primeReserved (lowerFirst rest)
  | Just rest <- T.stripPrefix "p" n, startsUpper rest = primeReserved (lowerFirst rest)
  | otherwise = primeReserved n

-- | Count names appear inside generated identifiers; they are plain C
-- identifiers already, but reserved-word priming keeps @n_data'@-style
-- collisions impossible.
sanitizeBind :: Text -> Text
sanitizeBind = primeReserved

