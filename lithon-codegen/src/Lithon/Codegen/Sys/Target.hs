{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TemplateHaskell #-}

-- | A bindgen-sys target as plain data: everything the generic pipeline
-- ("Lithon.Codegen.Sys") needs to know about one C library bound through
-- hs-bindgen — names, header universe, parse environment, version
-- spelling, gated-stub policy, target-owned shims, documentation hooks,
-- and authored prose.
--
-- Generic code never branches on which target it runs; it only reads
-- fields. Binding another library means one target value (a
-- @Lithon.Codegen.Sys.Target.*@ module), its data directory
-- (@lithon-codegen\/data\/\<key\>\/@), and its registration in
-- "Lithon.Codegen.Sys.Targets".
--
-- Deliberately not fields (the same contract for every target): the
-- three registries are required, @overrides.yaml@ is optional, record
-- fields omit their prefixes, the vendored runtime and facade set, the
-- flavor rules, emission and manifest mechanics, and probe compilation.
module Lithon.Codegen.Sys.Target (
  -- * The target record
  SysTarget (..),
  HeaderSpec (..),
  ParseEnv (..),
  CDefine (..),
  VersionScheme (..),
  GateStubs (..),
  WidthTypedefs (..),
  NativeScalar (..),
  DocHooks (..),
  Prose (..),
  PackageStatics (..),

  -- * Derived names
  bindgenNamespace,
  runtimeModule,
  includeArg,
  mainIncludeArgs,
  includeLine,
  projectHeaderUnder,
  registryDisplayPath,
  defineArg,
  defineLine,

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
import Lithon.Codegen.Bindgen (Passes)
import Lithon.Codegen.Sys.Version (AbiSince)

-- | One C library bound through the generic sys pipeline.
data SysTarget = SysTarget
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
  -- ^ Target-owned edits, composed before the generic version gates.
  , widthTypedefs :: Maybe WidthTypedefs
  , docs :: DocHooks
  , prose :: Prose
  , statics :: PackageStatics
  -- ^ The package's hand-written root files.
  , versionMetaKey :: Text
  -- ^ The manifest key recording the library version.
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
  { baseline :: AbiSince
  -- ^ The oldest supported release; nothing at or below it is gated.
  , atLeast :: AbiSince -> Text
  -- ^ The C condition (without @#if@) true at or above a version.
  , below :: AbiSince -> Text
  -- ^ Its negation, spelled by the target (operator precedence is the
  -- target's to get right).
  , guardIncludes :: [FilePath]
  -- ^ Basenames declaring the version macros, prepended to gated
  -- wrappers.
  , declSince :: C.DeclInfo C.Final -> Maybe AbiSince
  -- ^ A declaration's documented availability, if the docs state one.
  , fieldSince :: C.FieldInfo C.Final -> Maybe AbiSince
  -- ^ A struct member's documented availability.
  }

-- | What a version-gated wrapper does below its version: the call is
-- compiled out, arguments are silenced, and this reports the failure.
data GateStubs = GateStubs
  { includes :: [FilePath]
  -- ^ Basenames declaring what 'failure' calls.
  , failure :: Maybe (Text -> AbiSince -> Text)
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
  deriving stock (Bounded, Enum, Eq, Ord, Show)

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

-- | The generated package's hand-written root files: @package.yaml@,
-- @README.md@, @CHANGELOG.md@, and the library's license files.
data PackageStatics = PackageStatics
  { packageYaml :: Text
  , readme :: Text
  , changelog :: Text
  , licenses :: [(FilePath, Text)]
  }

-- | @SDL3.Sys.Bindgen@: the root of the raw families.
bindgenNamespace :: SysTarget -> Module.Meta
bindgenNamespace t = t.namespace <> $$(Module.metaLit ["Bindgen"])

-- | @SDL3.Sys.Runtime@: the curated bridge module.
runtimeModule :: SysTarget -> Module.Meta
runtimeModule t = t.namespace <> $$(Module.metaLit ["Runtime"])

-- | Basename -> the hash-include argument: @SDL_video.h@ ->
-- @SDL3\/SDL_video.h@.
includeArg :: SysTarget -> FilePath -> FilePath
includeArg t = (t.headers.includeRoot </>)

mainIncludeArgs :: SysTarget -> [FilePath]
mainIncludeArgs t = map (includeArg t) t.headers.mainIncludes

-- | Basename -> @#include \<SDL3\/SDL_version.h\>@.
includeLine :: SysTarget -> FilePath -> Text
includeLine t basename = "#include <" <> toText (includeArg t basename) <> ">"

-- | Include-graph source path -> public-header basename: @Just@ exactly
-- when the header's parent directory is the include root (libc, clang
-- builtins, and nested directories are out of scope).
projectHeaderUnder :: FilePath -> FilePath -> Maybe FilePath
projectHeaderUnder root path =
  case reverse (splitDirectories path) of
    basename : parent : _ | parent == root, not (null basename) -> Just basename
    _outOfScope -> Nothing

-- | A registry file as messages spell it:
-- @lithon-codegen\/data\/sdl3\/versions.json@.
registryDisplayPath :: SysTarget -> FilePath -> FilePath
registryDisplayPath t file = "lithon-codegen/data/" <> toString t.key <> "/" <> file

-- | The define as a compiler argument (hs-bindgen's @-D@): @NAME@ or
-- @NAME=VALUE@.
defineArg :: CDefine -> String
defineArg d = toString (d.name <> maybe "" ("=" <>) d.value)

-- | The define as a C source line.
defineLine :: CDefine -> Text
defineLine d = "#define " <> d.name <> maybe "" (" " <>) d.value

-- | Everything about one target that no type rules out. Run first by
-- 'Lithon.Codegen.Sys.runSys'.
validateTarget :: SysTarget -> Either [Text] ()
validateTarget t = case targetProblems t of
  [] -> Right ()
  problems -> Left problems

-- | 'validateTarget' over every target, plus what must be unique across
-- them.
validateTargets :: [SysTarget] -> Either [Text] ()
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

targetProblems :: SysTarget -> [Text]
targetProblems t =
  [ "key must match [a-z0-9-]+: " <> show t.key
  | T.null t.key || not (T.all (\c -> isAsciiLower c || isDigit c || c == '-') t.key)
  ]
    <> ["not a valid cabal package name: " <> show t.packageName | not (validPackageName t.packageName)]
    <> ["the function prefix is empty" | T.null t.functionPrefix]
    <> [ "the include root must be one directory component: " <> show root
       | null root || any isPathSeparator root || root `elem` [".", ".."]
       ]
    <> ["no main includes" | null t.headers.mainIncludes]
    <> [ "main includes are basenames under the include root: " <> show f
       | f <- t.headers.mainIncludes
       , null f || takeFileName f /= f
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
  lastSegment = T.takeWhileEnd (/= '.') (Module.hsName t.namespace)

-- | Cabal's rule: hyphen-separated ASCII-alphanumeric words, each with at
-- least one letter.
validPackageName :: Text -> Bool
validPackageName name = all validWord (T.splitOn "-" name)
 where
  validWord w =
    not (T.null w) && T.all (\c -> isAscii c && isAlphaNum c) w && T.any isAlpha w
