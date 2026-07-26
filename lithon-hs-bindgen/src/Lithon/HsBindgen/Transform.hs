{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NoFieldSelectors #-}
{-# LANGUAGE OverloadedStrings #-}

-- | AST-level transforms over translated (pre-render) modules.
--
-- Replaces post-render text surgery: passes target typed structure — a
-- foreign import's C stub matched by its C symbol — instead of rendered
-- lines, so a vendor render change cannot silently move the target. Every
-- pass still fails loudly when it matches nothing ('TransformError'), the
-- property the old text shims enforced with needle hit-counts.
--
-- The one deliberate exception: 'TextEdit' operates on rendered module
-- text, for edits the 'CWrapper' model cannot express (its renderer emits
-- all @#include@ lines before all bodies, so a define-before-include
-- prologue has no structural home). Keep that set small.
module Lithon.HsBindgen.Transform (
  -- * C-stub edits (typed, pre-render)
  StubEdit (..),
  replaceStubLine,
  applyStubEdits,

  -- * Rendered-text edits (the escape hatch)
  TextEdit (..),
  renderFamilyWith,

  -- * Failure
  TransformError (..),
) where

import Control.Monad (foldM)
import Data.Bifunctor (second)
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import Data.Text qualified as T

import HsBindgen.Backend.Hs.CallConv (CWrapper (..), CallConv (..))
import HsBindgen.Backend.HsModule.Render (render)
import HsBindgen.Backend.HsModule.Translation (HsModule (..))
import HsBindgen.Backend.SHs.AST (ForeignImport (..), SDecl (..))

-- | One targeted edit of a foreign import's C stub, keyed on the wrapped
-- C declaration ('CWrapper's @wraps@ field — the foreign import's own
-- @origName@ is the mangled wrapper symbol, not the C name). Selection is
-- fully typed; only the edit of the stub body itself is line-wise text,
-- because the vendor AST stores rendered C ('CWrapper.definition').
data StubEdit = StubEdit
  { label :: Text
  -- ^ Names the edit in the drift error.
  , symbol :: Maybe Text
  -- ^ The wrapped C declaration whose stubs are edited; 'Nothing' offers
  -- the edit to every wrapper in the family (the edit function still
  -- decides per stub).
  , target :: Text
  -- ^ Human-readable description of what the edit expects to find inside
  -- the stub (shown in the drift error alongside 'label').
  , edit :: [Text] -> Maybe [Text]
  -- ^ Line-wise rewrite of the stub body; 'Nothing' when the expected
  -- shape is absent (counts as a miss for that stub).
  }

-- | Replace one exact stub line with a block of lines, in every wrapper
-- of the given C declaration. The needle must match a whole line of the
-- wrapper's C source, byte-exact.
replaceStubLine :: Text -> Text -> Text -> [Text] -> StubEdit
replaceStubLine label symbol needle replacementLines =
  StubEdit
    { label
    , symbol = Just symbol
    , target = needle
    , edit = \ls ->
        if needle `elem` ls
          then Just (concatMap (\l -> if l == needle then replacementLines else [l]) ls)
          else Nothing
    }

data TransformError
  = -- | The stub edit landed on no wrapper in the family: label, wrapped
    -- C declaration, expected stub shape. Either the declaration is gone
    -- or its stub no longer has the expected line.
    StubEditMissed Text Text Text
  | -- | The rendered-text edit's needle appears nowhere in the family.
    TextEditMissed Text Text
  deriving stock (Eq, Show)

-- | Apply stub edits across a translated module family. Each edit must
-- land at least once across the family or the whole application fails.
--
-- 'HsModule' carries the wrapper set twice — per foreign import
-- ('CallConvUserlandCapi') and collected in @cWrappers@ — so after a
-- successful edit the module's @cWrappers@ are re-derived from its decls;
-- callers cannot desynchronize the two.
applyStubEdits
  :: [StubEdit]
  -> [(Text, HsModule)]
  -> Either TransformError [(Text, HsModule)]
applyStubEdits edits family = foldM applyOne family edits
 where
  applyOne
    :: [(Text, HsModule)]
    -> StubEdit
    -> Either TransformError [(Text, HsModule)]
  applyOne fam e =
    let edited = map (second (editModule e)) fam
        hits = sum [n | (_, (n, _)) <- edited]
     in if hits == (0 :: Int)
          then Left (StubEditMissed e.label (fromMaybe "<any wrapper>" e.symbol) e.target)
          else Right [(name, m) | (name, (_, m)) <- edited]

  editModule :: StubEdit -> HsModule -> (Int, HsModule)
  editModule e m =
    let (n, decls') = mapAccumEdit e m.decls
     in if n == 0
          then (0, m)
          else (n, m{decls = decls', cWrappers = wrappersOf decls'})

  mapAccumEdit :: StubEdit -> [SDecl] -> (Int, [SDecl])
  mapAccumEdit e = foldr step (0, [])
   where
    step d (n, ds) = case editDecl e d of
      Just d' -> (n + 1, d' : ds)
      Nothing -> (n, d : ds)

  editDecl :: StubEdit -> SDecl -> Maybe SDecl
  editDecl e = \case
    DForeignImport fi
      | CallConvUserlandCapi w <- fi.callConv
      , maybe True (w.wraps ==) e.symbol
      , Just ls' <- e.edit (T.splitOn "\n" (T.pack w.definition)) ->
          Just $
            DForeignImport
              fi{callConv = CallConvUserlandCapi w{definition = T.unpack (T.intercalate "\n" ls')}}
    _otherDecl -> Nothing

  -- Mirror of the collection the translator performs (SHs.Translation
  -- getCWrappers): every userland-capi import's wrapper, in decl order.
  wrappersOf ds = [w | DForeignImport fi <- ds, CallConvUserlandCapi w <- [fi.callConv]]

-- | One rendered-text rewrite (see module haddock for why this exists).
data TextEdit = TextEdit
  { label :: Text
  , needle :: Text
  , replacement :: Text
  }
  deriving stock (Eq, Show)

-- | Render a translated family and apply the text-level escape hatches,
-- each required to land at least once across the family.
renderFamilyWith
  :: [TextEdit]
  -> [(Text, HsModule)]
  -> Either TransformError [(Text, Text)]
renderFamilyWith edits family = foldM applyOne rendered edits
 where
  rendered = map (second (T.pack . render)) family

  applyOne fam e =
    let hits = sum (map (T.count e.needle . snd) fam)
     in if hits == 0
          then Left (TextEditMissed e.label e.needle)
          else Right (map (second (T.replace e.needle e.replacement)) fam)
