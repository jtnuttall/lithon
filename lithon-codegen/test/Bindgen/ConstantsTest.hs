{-# LANGUAGE OverloadedStrings #-}

-- | The constants registry's pure core: probe parsing, signed
-- interpretation, hosting across headers, and the @native@ rules. The
-- end-to-end rendering is pinned by "Bindgen.AliasRenderTest"; the
-- assertion TU by "Bindgen.AbiRenderTest".
module Bindgen.ConstantsTest where

import Data.ByteString.Lazy qualified as LBS
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Lithon.Prelude
import Test.Tasty.HUnit (assertBool, assertFailure, (@?=))

import Lithon.Codegen.Bindgen.Alias.Constants (
  Combine (..),
  ConstantError (..),
  ConstantGroup (..),
  ConstantGroupPlan (..),
  ConstantMember (..),
  ConstantTarget (..),
  ConstantsConfig (..),
  FamilyConstants (..),
  ProbeResult (..),
  ResolvedGroup (..),
  constantProbeInputs,
  decodeConstantsConfig,
  encodeConstantsConfig,
  macroHomes,
  parseProbeOutput,
  planConstants,
  renderProbeSource,
  resolveGroup,
 )
import Lithon.Codegen.Bindgen.Target (NativeScalar (..))
import Lithon.Codegen.Bindgen.Target.Sdl3 (sdl3)

{-------------------------------------------------------------------------------
  Fixtures
-------------------------------------------------------------------------------}

-- | The family declaring the types @T_I8@, @T_I64@, @T_U32@ and @T_Flags@.
base :: FamilyConstants
base =
  FamilyConstants
    { familyBase = "T.Sys.Bindgen.Base"
    , headerName = "t_base.h"
    , headerMacros =
        ["T_I8_MAX", "T_I8_MIN", "T_I64_MAX", "T_I64_MIN", "T_U32_NONE", "T_FLAG_A", "T_FLAG_B"]
    , newtypeConstrs =
        Map.fromList [("T_I8", "T_I8"), ("T_I64", "T_I64"), ("T_U32", "T_U32"), ("T_Flags", "T_Flags")]
    , takenNames = Set.fromList ["T_I8", "T_I64", "T_U32", "T_Flags"]
    }

-- | A later family: declares @T_Id@, plus macros of other types.
other :: FamilyConstants
other =
  FamilyConstants
    { familyBase = "T.Sys.Bindgen.Other"
    , headerName = "t_other.h"
    , headerMacros = ["T_OTHER_NONE", "T_FLAG_C", "T_SIZE_ERROR", "T_SIZE_AGAIN"]
    , newtypeConstrs = Map.fromList [("T_Id", "T_Id")]
    , takenNames = Set.fromList ["T_Id"]
    }

explicitGroup :: Combine -> [Text] -> ConstantGroup
explicitGroup combine names =
  ConstantGroup
    { combine
    , prefix = Nothing
    , suffix = Nothing
    , exclude = []
    , members = Just names
    , native = Nothing
    }

prefixGroup :: Combine -> Text -> ConstantGroup
prefixGroup combine p =
  ConstantGroup
    { combine
    , prefix = Just p
    , suffix = Nothing
    , exclude = []
    , members = Nothing
    , native = Nothing
    }

nativeGroup :: NativeScalar -> [Text] -> ConstantGroup
nativeGroup scalar names =
  ConstantGroup
    { combine = ValueSpace
    , prefix = Nothing
    , suffix = Nothing
    , exclude = []
    , members = Just names
    , native = Just scalar
    }

-- | A probe result: each type's @(bytes, signed)@ and each macro's image.
probe :: [(Text, (Int, Bool))] -> [(Text, Integer)] -> ProbeResult
probe types vals =
  ProbeResult
    { sizeofs = Map.fromList [(t, n) | (t, (n, _)) <- types]
    , signedness = Map.fromList [(t, s) | (t, (_, s)) <- types]
    , values = Map.fromList vals
    }

plan
  :: [(Text, ConstantGroup)]
  -> [FamilyConstants]
  -> ProbeResult
  -> Either [ConstantError] [ConstantGroupPlan]
plan groups families =
  first toList . planConstants ConstantsConfig{groups = Map.fromList groups} families

-- | The unsigned 64-bit image of a (possibly negative) C value, as the
-- probe prints it.
image :: Integer -> Integer
image v = v `mod` 2 ^ (64 :: Int)

planned :: Either [ConstantError] [ConstantGroupPlan] -> IO [ConstantGroupPlan]
planned = either (assertFailure . show) pure

onlyGroup :: Either [ConstantError] [ConstantGroupPlan] -> IO ConstantGroupPlan
onlyGroup r =
  planned r >>= \case
    [p] -> pure p
    ps -> assertFailure ("expected one group plan, got " <> show (length ps))

{-------------------------------------------------------------------------------
  The probe
-------------------------------------------------------------------------------}

unit_probeParsesSignedLines :: IO ()
unit_probeParsesSignedLines =
  parseProbeOutput
    ( T.unlines
        [ "sizeof:T_I8:1"
        , "signed:T_I8:1"
        , "sizeof:T_U32:4"
        , "signed:T_U32:0"
        , "value:T_I8_MIN:18446744073709551488"
        ]
    )
    @?= Right
      ProbeResult
        { sizeofs = Map.fromList [("T_I8", 1), ("T_U32", 4)]
        , signedness = Map.fromList [("T_I8", True), ("T_U32", False)]
        , values = Map.fromList [("T_I8_MIN", 18446744073709551488)]
        }

unit_probeRejectsMalformedSignedLines :: IO ()
unit_probeRejectsMalformedSignedLines = do
  for_ ["signed:T_I8:2", "signed:T_I8:-1", "signed:T_I8:", "signed:T_I8", "signed:T_I8:yes"] \line ->
    assertBool (toString line) (isLeft (parseProbeOutput line))

unit_probeSourceAsksForSignedness :: IO ()
unit_probeSourceAsksForSignedness = do
  let source = renderProbeSource sdl3 [("SDL_Toy", ["SDL_TOY_A"])]
      sizeofLine = "printf(\"sizeof:SDL_Toy:%llu\\n\""
      signedLine = "printf(\"signed:SDL_Toy:%d\\n\", (int)(((SDL_Toy) -1) < 0));"
  assertBool "the signed line" (signedLine `T.isInfixOf` source)
  assertBool "the sizeof line" (sizeofLine `T.isInfixOf` source)
  assertBool
    "signedness follows the sizeof line and precedes the values"
    ( let at needle = T.length (fst (T.breakOn needle source))
       in at sizeofLine < at signedLine && at signedLine < at "printf(\"value:SDL_TOY_A"
    )

{-------------------------------------------------------------------------------
  Signed types
-------------------------------------------------------------------------------}

unit_signedImageIsReinterpreted :: IO ()
unit_signedImageIsReinterpreted = do
  p <-
    onlyGroup
      $ plan
        [("T_I8", explicitGroup ValueSpace ["T_I8_MAX", "T_I8_MIN"])]
        [base]
        (probe [("T_I8", (1, True))] [("T_I8_MAX", 127), ("T_I8_MIN", image (-128))])
  [(m.cName, m.value) | m <- p.members] @?= [("T_I8_MAX", 127), ("T_I8_MIN", -128)]
  p.target @?= NewtypeTarget "T_I8"
  p.widthBits @?= 8

unit_signedTooNegativeIsTooWide :: IO ()
unit_signedTooNegativeIsTooWide =
  plan
    [("T_I8", explicitGroup ValueSpace ["T_I8_MIN"])]
    [base]
    (probe [("T_I8", (1, True))] [("T_I8_MIN", image (-129))])
    @?= Left [ConstantValueTooWide{typeName = "T_I8", cName = "T_I8_MIN", value = -129, widthBits = 8}]

unit_signedTooPositiveIsTooWide :: IO ()
unit_signedTooPositiveIsTooWide =
  plan
    [("T_I8", explicitGroup ValueSpace ["T_I8_MAX"])]
    [base]
    (probe [("T_I8", (1, True))] [("T_I8_MAX", 128)])
    @?= Left [ConstantValueTooWide{typeName = "T_I8", cName = "T_I8_MAX", value = 128, widthBits = 8}]

-- | A negative image means nothing to an unsigned type: it reads back as a
-- huge positive value and fails the width check.
unit_negativeImageOnUnsignedIsTooWide :: IO ()
unit_negativeImageOnUnsignedIsTooWide =
  plan
    [("T_U32", explicitGroup ValueSpace ["T_U32_NONE"])]
    [base]
    (probe [("T_U32", (4, False))] [("T_U32_NONE", image (-1))])
    @?= Left
      [ ConstantValueTooWide
          { typeName = "T_U32"
          , cName = "T_U32_NONE"
          , value = 18446744073709551615
          , widthBits = 32
          }
      ]

unit_unsignedBoundaryFits :: IO ()
unit_unsignedBoundaryFits = do
  p <-
    onlyGroup
      $ plan
        [("T_U32", explicitGroup ValueSpace ["T_U32_NONE"])]
        [base]
        (probe [("T_U32", (4, False))] [("T_U32_NONE", 4294967295)])
  map (.value) p.members @?= [4294967295]

unit_signedSixtyFourBitBoundaries :: IO ()
unit_signedSixtyFourBitBoundaries = do
  p <-
    onlyGroup
      $ plan
        [("T_I64", explicitGroup ValueSpace ["T_I64_MAX", "T_I64_MIN"])]
        [base]
        ( probe
            [("T_I64", (8, True))]
            [("T_I64_MAX", 2 ^ (63 :: Int) - 1), ("T_I64_MIN", 2 ^ (63 :: Int))]
        )
  map (.value) p.members @?= [2 ^ (63 :: Int) - 1, negate (2 ^ (63 :: Int))]

unit_bitmaskOnSignedIsRejected :: IO ()
unit_bitmaskOnSignedIsRejected =
  plan
    [("T_Flags", explicitGroup Bitmask ["T_FLAG_A"])]
    [base]
    (probe [("T_Flags", (4, True))] [("T_FLAG_A", 1)])
    @?= Left
      [ConstantRuleInvalid{typeName = "T_Flags", reason = "bitmask groups need an unsigned type"}]

unit_missingSignednessIsAProbeFailure :: IO ()
unit_missingSignednessIsAProbeFailure =
  plan
    [("T_U32", explicitGroup ValueSpace ["T_U32_NONE"])]
    [base]
    ( ProbeResult
        { sizeofs = Map.fromList [("T_U32", 4)]
        , signedness = mempty
        , values = Map.fromList [("T_U32_NONE", 1)]
        }
    )
    @?= Left [ConstantProbeMissing{probeName = "signed:T_U32"}]

{-------------------------------------------------------------------------------
  Hosting across headers
-------------------------------------------------------------------------------}

-- | @T_OTHER_NONE@ is declared in @t_other.h@ but is a @T_U32@ constant:
-- it is emitted with its type, and remembers where it came from.
unit_crossHeaderMemberIsHostedWithItsType :: IO ()
unit_crossHeaderMemberIsHostedWithItsType = do
  p <-
    onlyGroup
      $ plan
        [("T_U32", explicitGroup ValueSpace ["T_U32_NONE", "T_OTHER_NONE"])]
        [base, other]
        (probe [("T_U32", (4, False))] [("T_U32_NONE", 0), ("T_OTHER_NONE", 4294967295)])
  p.familyBase @?= base.familyBase
  p.headerName @?= "t_base.h"
  [(m.cName, m.declaredIn) | m <- p.members]
    @?= [("T_U32_NONE", "t_base.h"), ("T_OTHER_NONE", "t_other.h")]

-- | The reverse direction: a type of a later family takes a macro of an
-- earlier one.
unit_crossHeaderMemberFromAnEarlierHeader :: IO ()
unit_crossHeaderMemberFromAnEarlierHeader = do
  p <-
    onlyGroup
      $ plan
        [("T_Id", explicitGroup ValueSpace ["T_U32_NONE"])]
        [base, other]
        (probe [("T_Id", (4, False))] [("T_U32_NONE", 7)])
  p.familyBase @?= other.familyBase
  [m.declaredIn | m <- p.members] @?= ["t_base.h"]

-- | A macro declared by both the host and an earlier header is the host's:
-- @macroHomes@ alone would credit the earlier one.
unit_hostDeclaringAMacroOwnsIt :: IO ()
unit_hostDeclaringAMacroOwnsIt = do
  let shared = "T_SHARED"
      families =
        [ base{headerMacros = base.headerMacros <> [shared]}
        , other{headerMacros = other.headerMacros <> [shared]}
        ]
      homes = macroHomes families
      sharedGroup = explicitGroup ValueSpace [shared]
  fmap (.headerName) (Map.lookup shared homes) @?= Just "t_base.h"
  resolved <-
    either (assertFailure . show . toList) pure (resolveGroup families homes "T_Id" sharedGroup)
  resolved.host.headerName @?= "t_other.h"
  [(name, home.headerName) | (name, home) <- resolved.memberHomes] @?= [(shared, "t_other.h")]
  p <-
    onlyGroup
      $ plan [("T_Id", sharedGroup)] families (probe [("T_Id", (4, False))] [(shared, 1)])
  [m.declaredIn | m <- p.members] @?= ["t_other.h"]

unit_prefixRuleStaysInTheHostHeader :: IO ()
unit_prefixRuleStaysInTheHostHeader = do
  let families = [base, other]
      groups = Map.fromList [("T_Flags", prefixGroup Bitmask "T_FLAG_")]
  -- @T_FLAG_C@ matches the prefix but belongs to another header.
  constantProbeInputs ConstantsConfig{groups} families
    @?= [("T_Flags", ["T_FLAG_A", "T_FLAG_B"])]
  p <-
    onlyGroup
      $ plan
        (Map.toList groups)
        families
        (probe [("T_Flags", (4, False))] [("T_FLAG_A", 1), ("T_FLAG_B", 2), ("T_FLAG_C", 4)])
  map (.cName) p.members @?= ["T_FLAG_A", "T_FLAG_B"]

unit_unknownMemberIsUnknownToEveryHeader :: IO ()
unit_unknownMemberIsUnknownToEveryHeader =
  plan
    [("T_U32", explicitGroup ValueSpace ["T_NOWHERE"])]
    [base, other]
    (probe [("T_U32", (4, False))] [])
    @?= Left [ConstantMemberUnknown{typeName = "T_U32", cName = "T_NOWHERE"}]

-- | The umbrella re-exports every family, so a name another family already
-- exports is a collision wherever the pattern is hosted.
unit_collisionAcrossFamiliesIsDetected :: IO ()
unit_collisionAcrossFamiliesIsDetected =
  plan
    [("T_I8", explicitGroup ValueSpace ["T_I8_MAX"])]
    [base, other{takenNames = Set.fromList ["T_Id", "T_I8_MAX"]}]
    (probe [("T_I8", (1, True))] [("T_I8_MAX", 127)])
    @?= Left [ConstantNameCollision{typeName = "T_I8", cName = "T_I8_MAX"}]

unit_overlapAcrossHeadersIsDetected :: IO ()
unit_overlapAcrossHeadersIsDetected =
  plan
    [ ("T_U32", explicitGroup ValueSpace ["T_OTHER_NONE"])
    , ("T_Id", explicitGroup ValueSpace ["T_OTHER_NONE"])
    ]
    [base, other]
    (probe [("T_U32", (4, False)), ("T_Id", (4, False))] [("T_OTHER_NONE", 0)])
    @?= Left [ConstantOverlap{cName = "T_OTHER_NONE", groups = ["T_Id", "T_U32"]}]

unit_firstDeclaringFamilyOwnsAMacro :: IO ()
unit_firstDeclaringFamilyOwnsAMacro = do
  let redefining = other{headerMacros = "T_U32_NONE" : other.headerMacros}
  fmap (.familyBase) (Map.lookup "T_U32_NONE" (macroHomes [base, redefining]))
    @?= Just base.familyBase
  fmap (.familyBase) (Map.lookup "T_OTHER_NONE" (macroHomes [base, redefining]))
    @?= Just other.familyBase

{-------------------------------------------------------------------------------
  Native groups
-------------------------------------------------------------------------------}

unit_nativeGroupIsHostedAtItsMembersHeader :: IO ()
unit_nativeGroupIsHostedAtItsMembersHeader = do
  p <-
    onlyGroup
      $ plan
        [("size_t", nativeGroup NativeWord64 ["T_SIZE_ERROR", "T_SIZE_AGAIN"])]
        [base, other]
        (probe [("size_t", (8, False))] [("T_SIZE_ERROR", image (-1)), ("T_SIZE_AGAIN", image (-2))])
  p.target @?= NativeTarget NativeWord64
  p.familyBase @?= other.familyBase
  p.headerName @?= "t_other.h"
  p.widthBits @?= 64
  [(m.cName, m.value, m.declaredIn) | m <- p.members]
    @?= [ ("T_SIZE_ERROR", 18446744073709551615, "t_other.h")
        , ("T_SIZE_AGAIN", 18446744073709551614, "t_other.h")
        ]
  constantProbeInputs
    ConstantsConfig{groups = Map.fromList [("size_t", nativeGroup NativeWord64 ["T_SIZE_ERROR"])]}
    [base, other]
    @?= [("size_t", ["T_SIZE_ERROR"])]

unit_nativeGroupRejectsPrefix :: IO ()
unit_nativeGroupRejectsPrefix =
  plan
    [
      ( "size_t"
      , ConstantGroup
          { combine = ValueSpace
          , prefix = Just "T_SIZE_"
          , suffix = Nothing
          , exclude = []
          , members = Nothing
          , native = Just NativeWord64
          }
      )
    ]
    [base, other]
    (probe [("size_t", (8, False))] [])
    @?= Left
      [ ConstantRuleInvalid
          { typeName = "size_t"
          , reason = "native groups need an explicit members list"
          }
      ]

unit_nativeGroupRejectsMembersFromTwoHeaders :: IO ()
unit_nativeGroupRejectsMembersFromTwoHeaders =
  case plan
    [("size_t", nativeGroup NativeWord64 ["T_SIZE_ERROR", "T_U32_NONE"])]
    [base, other]
    (probe [("size_t", (8, False))] [("T_SIZE_ERROR", 1), ("T_U32_NONE", 2)]) of
    Left [ConstantRuleInvalid{typeName = "size_t", reason}] -> do
      assertBool (toString reason) ("exactly one header" `T.isInfixOf` reason)
      assertBool
        "names both headers"
        ("t_base.h" `T.isInfixOf` reason && "t_other.h" `T.isInfixOf` reason)
    other' -> assertFailure ("unexpected: " <> show other')

unit_nativeGroupWithoutMembersIsRejected :: IO ()
unit_nativeGroupWithoutMembersIsRejected =
  plan
    [("size_t", nativeGroup NativeWord64 [])]
    [base, other]
    (probe [("size_t", (8, False))] [])
    @?= Left
      [ ConstantRuleInvalid
          { typeName = "size_t"
          , reason = "native members must come from exactly one header, found none"
          }
      ]

unit_nativeWidthMismatch :: IO ()
unit_nativeWidthMismatch =
  plan
    [("size_t", nativeGroup NativeWord64 ["T_SIZE_ERROR"])]
    [base, other]
    (probe [("size_t", (4, False))] [("T_SIZE_ERROR", 4294967295)])
    @?= Left
      [ ConstantNativeMismatch
          { typeName = "size_t"
          , native = NativeWord64
          , widthBits = 32
          , signed = False
          }
      ]

unit_nativeSignednessMismatch :: IO ()
unit_nativeSignednessMismatch =
  plan
    [("size_t", nativeGroup NativeWord64 ["T_SIZE_ERROR"])]
    [base, other]
    (probe [("size_t", (8, True))] [("T_SIZE_ERROR", 1)])
    @?= Left
      [ ConstantNativeMismatch
          { typeName = "size_t"
          , native = NativeWord64
          , widthBits = 64
          , signed = True
          }
      ]

unit_nativeSignedGroupInterpretsNegatives :: IO ()
unit_nativeSignedGroupInterpretsNegatives = do
  p <-
    onlyGroup
      $ plan
        [("ptrdiff_t", nativeGroup NativeInt64 ["T_SIZE_ERROR"])]
        [base, other]
        (probe [("ptrdiff_t", (8, True))] [("T_SIZE_ERROR", image (-1))])
  map (.value) p.members @?= [-1]

{-------------------------------------------------------------------------------
  Error text and the codec
-------------------------------------------------------------------------------}

unit_errorTextsPointAtTheRemedy :: IO ()
unit_errorTextsPointAtTheRemedy = do
  assertBool
    "unknown type hints at native"
    ("set \"native\"" `T.isInfixOf` display (ConstantTypeUnknown{typeName = "size_t"}))
  assertBool
    "unknown member is unknown to every header"
    ( "is not an object-like macro of any bound header"
        `T.isInfixOf` display (ConstantMemberUnknown{typeName = "T_U32", cName = "T_X"})
    )

unit_nativeCodecAcceptsTheScalarNames :: IO ()
unit_nativeCodecAcceptsTheScalarNames =
  for_ [minBound .. maxBound :: NativeScalar] \scalar -> do
    let config = ConstantsConfig{groups = Map.fromList [("size_t", nativeGroup scalar ["T_SIZE_ERROR"])]}
    decodeConstantsConfig (encodeConstantsConfig config) @?= Right config

unit_nativeCodecDecodesWord64 :: IO ()
unit_nativeCodecDecodesWord64 =
  fmap
    (fmap (.native) . Map.lookup "size_t" . (.groups))
    ( decodeConstantsConfig
        "{\"groups\": {\"size_t\": {\"combine\": \"value\", \"members\": [\"X\"], \"native\": \"Word64\"}}}"
    )
    @?= Right (Just (Just NativeWord64))

unit_nativeCodecRejectsUnknownScalars :: IO ()
unit_nativeCodecRejectsUnknownScalars =
  for_ (["Word128", "word64", "Int", "null-ish"] :: [Text]) \name ->
    assertBool
      (toString name)
      ( isLeft
          ( decodeConstantsConfig
              ( "{\"groups\": {\"size_t\": {\"combine\": \"value\", \"members\": [\"X\"], \"native\": \""
                  <> LBS.fromStrict (encodeUtf8 name)
                  <> "\"}}}"
              )
          )
      )

unit_nativeFieldIsOptional :: IO ()
unit_nativeFieldIsOptional =
  fmap
    (fmap (.native) . Map.lookup "T_U32" . (.groups))
    ( decodeConstantsConfig
        "{\"groups\": {\"T_U32\": {\"combine\": \"value\", \"members\": [\"X\"]}}}"
    )
    @?= Right (Just Nothing)
