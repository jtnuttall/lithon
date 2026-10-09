{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}

-- | A bindgen-sys target as plain data: everything the generic pipeline
-- ("Lithon.Codegen.Bindgen") needs to know about one C library bound through
-- hs-bindgen — names, header universe, parse environment, version
-- spelling, gated-stub policy, target-owned shims, documentation hooks,
-- and authored prose.
--
-- Generic code never branches on which target it runs; it only reads
-- fields. Binding another library means one target value (a
-- @Lithon.Codegen.Bindgen.Target.*@ module), its data directory
-- (@lithon-codegen\/data\/\<key\>\/@), and its registration in
-- "Lithon.Codegen.Bindgen.Targets".
--
-- Deliberately not fields (the same contract for every target): the
-- four registries are required, @overrides\/@ (one prescriptive spec per
-- header) is optional, the package statics live in @static\/@, record
-- fields omit their prefixes, the vendored runtime and facade set, the
-- flavor rules, emission and manifest mechanics, and probe compilation.
module Lithon.Codegen.Bindgen.Target (
  -- * The target record
  BindgenTarget (..),
  HeaderSpec (..),
  ParseEnv (..),
  CDefine (..),
  VersionScheme (..),
  GateStubs (..),
  WidthTypedefs (..),
  NativeScalar (..),
  nativeScalarName,
  nativeScalarBits,
  nativeScalarSigned,
  DocHooks (..),
  Prose (..),

  -- * Derived names
  bindgenNamespace,
  bindgenNamespaceText,
  runtimeModule,
  includeArg,
  mainIncludeArgs,
  includeLine,
  includeArgLine,
  projectHeaderUnder,
  registryDisplayPath,
  defineLine,
  defineMacro,

  -- * The header plan
  headerPlan,
  moduleFor,

  -- * Validation
  validateTarget,
  validateTargets,
) where

import Data.Char (isAlpha, isAlphaNum, isAscii, isAsciiLower, isDigit)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.Effect.ClangEnv (PkgName)
import Lithon.HsBindgen.C qualified as C
import Lithon.HsBindgen.HsDoc qualified as HsDoc
import Lithon.Prelude
import System.FilePath (isPathSeparator, splitDirectories, takeFileName, (</>))

import Lithon.Codegen.Backend.Hs.Module qualified as Module
import Lithon.Codegen.Bindgen.Driver (HeaderPlan (..), Passes, defaultSpecFileName)
import Lithon.Codegen.Bindgen.Version (Version, renderVersion, versionArity)

-- | One C library bound through the generic bindgen pipeline.
data BindgenTarget = BindgenTarget
  { key :: Text
  -- ^ The CLI subcommand, the data directory (@data\/\<key\>\/@), and the
  -- @(\<key\> generate)@ banners: @sdl3@.
  , packageName :: Text
  -- ^ The generated package: its directory, @--out@ default, scratch
  -- directory, and hs-bindgen @uniqueId@ (which seeds the wrapper symbol
  -- hashes, so a target's value never changes casually).
  , displayName :: Text
  -- ^ The library as prose names it: \"your SDL3 headers\", errors, CLI
  -- help.
  , versionLabel :: Text
  -- ^ The word before a version: \"generated from SDL 3.4.16\".
  , namespace :: Module.Meta
  -- ^ The curated root (@SDL3.Sys@); @.Bindgen@ and @.Runtime@ derive
  -- from it.
  , functionPrefix :: Text
  -- ^ Stripped when minting aliases; marks bare-text doc tokens: @SDL_@.
  , pkgConfig :: PkgName
  , headers :: HeaderSpec
  , parse :: ParseEnv
  , versioning :: VersionScheme
  , gateStubs :: GateStubs
  , shims :: Passes
  -- ^ Target-owned edits, composed before the retype prologue and the
  -- version gates.
  , widthTypedefs :: Maybe WidthTypedefs
  , docs :: DocHooks
  , prose :: Prose
  }

-- | The header universe.
data HeaderSpec = HeaderSpec
  { includeRoot :: FilePath
  -- ^ The single directory component the public headers live under
  -- (@SDL3@): the include argument's prefix and the include-graph scope.
  , mainIncludes :: [FilePath]
  -- ^ Basenames, in order: the preflight set, the ABI assertion TU's and
  -- the constants probe's includes.
  , excluded :: Set FilePath
  -- ^ Basenames never bound.
  , mangle :: Module.MangleOpts
  -- ^ Header basename -> family name; must yield a single segment.
  }

-- | What the headers are parsed under: the defines go to hs-bindgen and to
-- every C unit lithon renders (the ABI TU, the constants probe).
data ParseEnv = ParseEnv
  { defines :: [CDefine]
  , doxygenAliases :: [(Text, Text)]
  }

-- | @#define name value@.
data CDefine = CDefine
  { name :: Text
  , value :: Maybe Text
  }
  deriving stock (Eq, Show)

-- | How the library spells availability in its own C, and where its docs
-- state it.
data VersionScheme = VersionScheme
  { arity :: Int
  -- ^ The parts of every version (SDL: 3): the annotations' codec
  -- rejects any other count, and the doc readers pad to it.
  , baseline :: Version
  -- ^ The oldest supported release; nothing at or below it is gated.
  , atLeast :: Version -> Text
  -- ^ The C condition (without @#if@) true at or above a version.
  , below :: Version -> Text
  -- ^ Its negation, spelled by the target (operator precedence is the
  -- target's to get right).
  , guardIncludes :: [FilePath]
  -- ^ Basenames declaring the version macros, prepended to gated
  -- wrappers; they also head every retype prologue.
  , declSince :: C.DeclInfo C.Final -> Maybe Version
  -- ^ A declaration's documented availability, if the docs state one.
  , fieldSince :: C.FieldInfo C.Final -> Maybe Version
  -- ^ A struct member's documented availability.
  }

-- | What a version-gated wrapper does below its version: the call is
-- compiled out, arguments are silenced, and this reports the failure.
data GateStubs = GateStubs
  { includes :: [FilePath]
  -- ^ Basenames declaring what 'failure' calls.
  , failure :: Maybe (Text -> Version -> Text)
  -- ^ The C statement reporting a gated call (symbol, required version).
  }

-- | The library's own fixed-width integer typedefs, which the curated
-- layer bridges to native Haskell scalars like the @Foreign.C@ ones.
data WidthTypedefs = WidthTypedefs
  { family :: Text
  -- ^ The family segment declaring them (@Stdinc@).
  , natives :: Map Text NativeScalar
  -- ^ Typedef name -> its equal-width native.
  }

data NativeScalar
  = NativeWord8
  | NativeWord16
  | NativeWord32
  | NativeWord64
  | NativeInt8
  | NativeInt16
  | NativeInt32
  | NativeInt64
  deriving stock (Bounded, Enum, Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

-- | The scalar's name in "Data.Int" \/ "Data.Word" (and the runtime's
-- re-export of them): also the spelling the constants registry's
-- @native@ field uses.
nativeScalarName :: NativeScalar -> Text
nativeScalarName = \case
  NativeWord8 -> "Word8"
  NativeWord16 -> "Word16"
  NativeWord32 -> "Word32"
  NativeWord64 -> "Word64"
  NativeInt8 -> "Int8"
  NativeInt16 -> "Int16"
  NativeInt32 -> "Int32"
  NativeInt64 -> "Int64"

-- | The scalar's width in bits.
nativeScalarBits :: NativeScalar -> Int
nativeScalarBits = \case
  NativeWord8 -> 8
  NativeWord16 -> 16
  NativeWord32 -> 32
  NativeWord64 -> 64
  NativeInt8 -> 8
  NativeInt16 -> 16
  NativeInt32 -> 32
  NativeInt64 -> 64

-- | Whether the scalar is a signed integer.
nativeScalarSigned :: NativeScalar -> Bool
nativeScalarSigned = \case
  NativeWord8 -> False
  NativeWord16 -> False
  NativeWord32 -> False
  NativeWord64 -> False
  NativeInt8 -> True
  NativeInt16 -> True
  NativeInt32 -> True
  NativeInt64 -> True

-- | Rewrites applied to copied documentation.
data DocHooks = DocHooks
  { fixText :: Text -> Text
  -- ^ Over plain text (e.g. wiki-relative markdown links doxygen left).
  , fixLink :: Text -> Text
  -- ^ Over link targets.
  }

-- | The target's authored prose.
data Prose = Prose
  { familyOneLiners :: Map Text Text
  -- ^ Family segment -> index title, for families without an overview.
  , familyExtras :: Map Text HsDoc.Comment
  -- ^ Family segment -> usage guidance appended to its module header.
  , umbrellaDoc :: Text -> Text
  -- ^ The umbrella module's Haddock, given the rendered family index.
  , runtimeDoc :: Text
  -- ^ The Runtime bridge module's Haddock.
  , abiBanner :: [Text]
  -- ^ The body of the ABI assertion TU's banner comment, one line per
  -- element (rendered as @ * line@; an empty element as @ *@).
  }

-- | @SDL3.Sys.Bindgen@: the root of the raw families.
bindgenNamespace :: BindgenTarget -> Module.Meta
bindgenNamespace t = t.namespace <> $$(Module.metaLit ["Bindgen"])

-- | 'bindgenNamespace', dotted.
bindgenNamespaceText :: BindgenTarget -> Text
bindgenNamespaceText = Module.hsName . bindgenNamespace

-- | @SDL3.Sys.Runtime@: the curated bridge module.
runtimeModule :: BindgenTarget -> Module.Meta
runtimeModule t = t.namespace <> $$(Module.metaLit ["Runtime"])

-- | Basename -> the hash-include argument: @SDL_video.h@ ->
-- @SDL3\/SDL_video.h@.
includeArg :: BindgenTarget -> FilePath -> FilePath
includeArg t = (t.headers.includeRoot </>)

mainIncludeArgs :: BindgenTarget -> [FilePath]
mainIncludeArgs t = map (includeArg t) t.headers.mainIncludes

-- | Basename -> @#include \<SDL3\/SDL_version.h\>@.
includeLine :: BindgenTarget -> FilePath -> Text
includeLine t = includeArgLine . includeArg t

-- | An include argument as its line: @SDL3\/SDL.h@ -> @#include
-- \<SDL3\/SDL.h\>@.
includeArgLine :: FilePath -> Text
includeArgLine arg = "#include <" <> toText arg <> ">"

-- | Include-graph real path (canonical, symlink-resolved) -> public-header
-- basename: @Just@ exactly when the header's parent directory is the include
-- root (libc, clang builtins, and nested directories are out of scope).
projectHeaderUnder :: FilePath -> FilePath -> Maybe FilePath
projectHeaderUnder root path =
  case reverse (splitDirectories path) of
    basename : parent : _ | parent == root, not (null basename) -> Just basename
    _outOfScope -> Nothing

-- | A registry file as messages spell it:
-- @lithon-codegen\/data\/sdl3\/versions.json@.
registryDisplayPath :: BindgenTarget -> FilePath -> FilePath
registryDisplayPath t file = "lithon-codegen/data/" <> toString t.key <> "/" <> file

-- | The define as a C source line.
defineLine :: CDefine -> Text
defineLine d = "#define " <> d.name <> maybe "" (" " <>) d.value

-- | The define as the seam's @(name, body)@ pair for a root @#define@
-- (hs-bindgen's own type is @HashDefine@). An absent value is an empty body,
-- i.e. a bare @#define NAME@ (matching 'defineLine'), never the @-DNAME@
-- spelling's @NAME 1@.
defineMacro :: CDefine -> (Text, Text)
defineMacro d = (d.name, fromMaybe "" d.value)

-- | The target's header universe, as data.
headerPlan :: BindgenTarget -> HeaderPlan
headerPlan target =
  HeaderPlan
    { baseNamespace = bindgenNamespace target
    , mangle = target.headers.mangle
    , projectHeader = projectHeaderUnder target.headers.includeRoot
    , includeArg = includeArg target
    , excludedHeaders = target.headers.excluded
    , mainIncludes = mainIncludeArgs target
    , specFileName = defaultSpecFileName
    }

-- | The full module name for one public-header basename (the census
-- derives header->module rows through this, so it cannot drift from the
-- chain's own minting).
moduleFor :: BindgenTarget -> FilePath -> Either Module.MangleError Module.Meta
moduleFor target basename =
  (bindgenNamespace target <>)
    . view Module.metaL
    <$> Module.mangleHeader basename target.headers.mangle

-- | Everything about one target that no type rules out. Run first by
-- 'Lithon.Codegen.Bindgen.runBindgen'.
validateTarget :: BindgenTarget -> Either [Text] ()
validateTarget t = case targetProblems t of
  [] -> Right ()
  problems -> Left problems

-- | 'validateTarget' over every target, plus what must be unique across
-- them.
validateTargets :: [BindgenTarget] -> Either [Text] ()
validateTargets ts = case perTarget <> clashes of
  [] -> Right ()
  problems -> Left problems
 where
  perTarget = [t.key <> ": " <> problem | t <- ts, problem <- targetProblems t]
  clashes =
    [ what <> " " <> v <> " is claimed by more than one target"
    | (what, claims) <-
        [ ("key" :: Text, map (.key) ts)
        , ("package", map (.packageName) ts)
        , ("namespace", map (Module.hsName . (.namespace)) ts)
        ]
    , v <- toList (duplicates claims)
    ]

targetProblems :: BindgenTarget -> [Text]
targetProblems t =
  [ "key must match [a-z0-9-]+: " <> show t.key
  | T.null t.key || not (T.all (\c -> isAsciiLower c || isDigit c || c == '-') t.key)
  ]
    <> ["the key vulkan is the Vulkan generator's" | t.key == "vulkan"]
    <> ["not a valid cabal package name: " <> show t.packageName | not (validPackageName t.packageName)]
    <> ["the function prefix is empty" | T.null t.functionPrefix]
    <> [ "the include root must be one directory component: " <> show root
       | null root || any isPathSeparator root || root `elem` [".", ".."]
       ]
    <> ["no main includes" | null t.headers.mainIncludes]
    <> [ what <> " are basenames under the include root: " <> show f
       | (what, fs) <-
           [ ("main includes" :: Text, t.headers.mainIncludes)
           , ("guard includes", t.versioning.guardIncludes)
           , ("gate stub includes", t.gateStubs.includes)
           ]
       , f <- fs
       , null f || takeFileName f /= f || f `elem` [".", ".."]
       ]
    <> ["the version arity must be positive: " <> show scheme.arity | scheme.arity < 1]
    <> [ "the baseline "
           <> renderVersion scheme.baseline
           <> " has "
           <> show (versionArity scheme.baseline)
           <> " parts; the scheme's arity is "
           <> show scheme.arity
       | versionArity scheme.baseline /= scheme.arity
       ]
    <> [ "the namespace may not end in " <> lastSegment <> ": " <> Module.hsName t.namespace
       | lastSegment `elem` ["Bindgen", "Runtime" :: Text]
       ]
    <> [ what <> " key is not a module segment: " <> show k
       | (what, ks) <-
           [ ("family one-liner" :: Text, Map.keys t.prose.familyOneLiners)
           , ("family extra", Map.keys t.prose.familyExtras)
           , ("width typedef family", [w.family | Just w <- [t.widthTypedefs]])
           , ("width typedef", concat [Map.keys w.natives | Just w <- [t.widthTypedefs]])
           ]
       , k <- ks
       , isLeft (Module.fromSegments [k])
       ]
 where
  root = t.headers.includeRoot
  scheme = t.versioning
  lastSegment = T.takeWhileEnd (/= '.') (Module.hsName t.namespace)

-- | Cabal's rule: hyphen-separated ASCII-alphanumeric words, each with at
-- least one letter.
validPackageName :: Text -> Bool
validPackageName name = all validWord (T.splitOn "-" name)
 where
  validWord w =
    not (T.null w) && T.all (\c -> isAscii c && isAlphaNum c) w && T.any isAlpha w
