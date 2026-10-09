{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoFieldSelectors #-}

-- | What one hs-bindgen invocation left unbound, in lithon-owned types.
--
-- hs-bindgen's select pass decides which of a run's selection roots (the
-- declarations of its main headers) it binds, and reports every one it
-- does not: a root whose own parse, macro translation, or name mangling
-- failed, a root that conflicts with a same-name declaration, and a root
-- whose transitive dependencies are unusable or unselected. The seam
-- collects those traces as the run emits them, whatever the run's
-- 'Lithon.HsBindgen.Invoke.Verbosity' prints (hs-bindgen reports most
-- macro failures at @Info@, below what a default run shows), and hands
-- them back as an 'InvocationReport' beside the run's result.
--
-- hs-bindgen's own trace types stay behind the seam: a vendor bump that
-- adds a failure breaks the seam's classification, not its consumers.
-- Free text ('ParseFailed', 'MacroParseFailed', …) is hs-bindgen's
-- rendering of the failure on one line, with every absolute path reduced
-- to its file name, so it is stable across machines.
module Lithon.HsBindgen.Skip (
  -- * The report
  InvocationReport (..),

  -- * Names and locations
  CName (..),
  Namespace (..),
  renderCName,
  SourceLoc (..),

  -- * Skips
  Skip (..),
  SkipReason (..),
  SkipFailure (..),
  SkipDependency (..),
  DependencyStatus (..),
) where

import Data.List.NonEmpty (NonEmpty)
import Data.Text (Text)
import GHC.Generics (Generic)

-- | One invocation's account of what it did not bind.
data InvocationReport = InvocationReport
  { skips :: [Skip]
  -- ^ Every selection root the run did not bind, in hs-bindgen's report
  -- order (include order, then line and column), one entry per name and
  -- location.
  , omitted :: [CName]
  -- ^ Declarations the run's prescriptive binding spec omitted.
  , overrideProblems :: [Text]
  -- ^ hs-bindgen's complaints about the run's prescriptive binding spec:
  -- an entry that applies to no declaration of the run, a module-name
  -- mismatch, an enum entry on a non-enum, an opaque entry on a kind that
  -- cannot be opaque.
  }
  deriving stock (Eq, Generic, Ord, Show)

-- | A C declaration's name as hs-bindgen identifies it: the text, which of
-- C's namespaces it lives in (with macros as their own), and whether
-- hs-bindgen minted it for an anonymous declaration.
data CName = CName
  { text :: Text
  , namespace :: Namespace
  , unnamed :: Bool
  }
  deriving stock (Eq, Generic, Ord, Show)

-- | The C namespace of a 'CName'.
data Namespace = Ordinary | Struct | Union | Enum | Macro
  deriving stock (Bounded, Eq, Generic, Ord, Show)

-- | hs-bindgen's own spelling of a declaration name (its binding specs
-- and traces use it): @SDL_Init@, @struct SDL_Rect@, @macro SDL_memcpy@,
-- and @\@@ before a minted name (@struct \@foo_bar@).
renderCName :: CName -> Text
renderCName n = prefix <> (if n.unnamed then "@" else "") <> n.text
 where
  prefix = case n.namespace of
    Ordinary -> ""
    Struct -> "struct "
    Union -> "union "
    Enum -> "enum "
    Macro -> "macro "

-- | A position in a header file.
data SourceLoc = SourceLoc
  { path :: FilePath
  -- ^ The header's canonical absolute path (symlinks resolved), as the
  -- include graph spells it.
  , line :: Int
  , column :: Int
  }
  deriving stock (Eq, Generic, Ord, Show)

-- | One selection root the run did not bind.
data Skip = Skip
  { name :: CName
  , loc :: Maybe SourceLoc
  -- ^ Where the declaration is ('Nothing' for one outside any header,
  -- such as a root directive). For a conflict, the smallest of the
  -- conflict's locations, which can be another header's.
  , reasons :: NonEmpty SkipReason
  -- ^ Usually one. A root can fail on its own and lack a dependency too.
  }
  deriving stock (Eq, Generic, Ord, Show)

-- | Why a root was not bound.
data SkipReason
  = -- | The declaration itself could not be used.
    SkipUnusable SkipFailure
  | -- | Same-name declarations collide (a function and a macro, say), and
    -- hs-bindgen drops all of them: the locations of every one.
    SkipConflict [SourceLoc]
  | -- | The declaration needs others the run cannot bind.
    SkipDependencyMissing (NonEmpty SkipDependency)
  deriving stock (Eq, Generic, Ord, Show)

-- | Why a declaration could not be used. The 'Text' is hs-bindgen's
-- account of the failure.
data SkipFailure
  = -- | A variadic function: the Haskell FFI has no varargs.
    UnsupportedVariadic
  | -- | The declaration did not parse (an unsupported type, builtin,
    -- linkage, …).
    ParseFailed Text
  | -- | The macro body did not parse.
    MacroParseFailed Text
  | -- | The macro body parsed but did not typecheck.
    MacroTypecheckFailed Text
  | -- | A name in the macro body did not resolve.
    MacroResolutionFailed Text
  | -- | No Haskell name could be minted for it.
    NameManglingFailed Text
  | -- | Clang marks the declaration unavailable on this platform.
    UnavailableOnPlatform
  | -- | The prescriptive binding spec omits it.
    OmittedByOverride
  deriving stock (Eq, Generic, Ord, Show)

-- | A dependency a skipped root needed.
data SkipDependency = SkipDependency
  { name :: CName
  , loc :: Maybe SourceLoc
  , status :: DependencyStatus
  }
  deriving stock (Eq, Generic, Ord, Show)

-- | Why a dependency was not there for its dependent.
data DependencyStatus
  = -- | The run does not select it, and no prior binding spec provides it
    -- (it lives in a header the run does not bind and no earlier run
    -- bound).
    DependencyNotSelected
  | -- | It could not be used.
    DependencyUnusable SkipFailure
  | -- | It conflicts with a same-name declaration.
    DependencyConflict
  deriving stock (Eq, Generic, Ord, Show)
