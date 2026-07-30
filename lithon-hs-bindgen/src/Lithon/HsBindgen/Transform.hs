{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedLabels #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoFieldSelectors #-}

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
  RenderedHsModule (..),
  renderFamilyWith,

  -- * Failure
  TransformError (..),
) where

import Control.Lens (traverseOf)
import Control.Monad (foldM)
import Control.Monad.Writer.Strict
import Data.Function (applyWhen)
import Data.Maybe (fromMaybe)
import Data.Monoid (Any (Any))
import Data.Text (Text)
import Data.Text qualified as T
import HsBindgen.Backend.Hs.CallConv (CWrapper (..), CallConv (..))
import HsBindgen.Backend.HsModule.Render (render)
import HsBindgen.Backend.HsModule.Translation (HsModule (..))
import HsBindgen.Backend.SHs.AST (ForeignImport (..), SDecl (..))
import Lithon.Prelude (Display (..), From (..))

import Lithon.HsBindgen.Invoke (NameableModule (..))

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
        if needle `elem` ls then
          Just (concatMap (\l -> if l == needle then replacementLines else [l]) ls)
        else
          Nothing
    }

data TransformError
  = -- | The stub edit landed on no wrapper in the family: label, wrapped
    -- C declaration, expected stub shape. Either the declaration is gone
    -- or its stub no longer has the expected line.
    StubEditMissed {label :: Text, symbol :: Text, target :: Text}
  | -- | The rendered-text edit's needle appears nowhere in the family.
    TextEditMissed {label :: Text, needle :: Text}
  deriving stock (Eq, Show)

instance Display TransformError where
  displayBuilder = \case
    StubEditMissed{..} ->
      "stub edit '"
        <> from label
        <> "' for symbol '"
        <> from symbol
        <> "' with target '"
        <> from target
        <> "' did not land in at least one module"
    TextEditMissed{..} ->
      "text edit '"
        <> from label
        <> "' with needle '"
        <> from needle
        <> "' did not land in at least one module"

applyStubEdits
  :: [StubEdit]
  -> [NameableModule HsModule]
  -> Either TransformError [NameableModule HsModule]
applyStubEdits edits family = foldM step family edits
 where
  step fam e
    | changed = Right fam'
    | otherwise = Left $ StubEditMissed e.label (fromMaybe "<any wrapper>" e.symbol) e.target
   where
    (fam', Any changed) = runWriter (traverse (editModule e) fam)

  editModule e = traverseOf #hsModule \s -> do
    (decls', Any changed) <- listen (traverse (editDecl e) s.decls)
    pure $ applyWhen changed (\s' -> s'{decls = decls', cWrappers = wrappersOf decls'}) s

  editDecl e decl = case decl of
    DForeignImport fi
      | CallConvUserlandCapi w <- fi.callConv
      , maybe True (w.wraps ==) e.symbol
      , Just ls' <- e.edit (T.splitOn "\n" (T.pack w.definition)) -> do
          tell (Any True)
          pure $
            DForeignImport
              fi{callConv = CallConvUserlandCapi w{definition = T.unpack (T.intercalate "\n" ls')}}
    _otherDecl -> pure decl

  wrappersOf ds = [w | DForeignImport fi <- ds, CallConvUserlandCapi w <- [fi.callConv]]

-- | One rendered-text rewrite (see module haddock for why this exists).
data TextEdit = TextEdit
  { label :: Text
  , needle :: Text
  , replacement :: Text
  }
  deriving stock (Eq, Show)

newtype RenderedHsModule = RenderedHsModule
  {text :: Text}
  deriving stock (Show)

-- | Render a translated family and apply the text-level escape hatches,
-- each required to land at least once across the family.
renderFamilyWith
  :: [TextEdit]
  -> [NameableModule HsModule]
  -> Either TransformError [NameableModule RenderedHsModule]
renderFamilyWith edits family = map (fmap RenderedHsModule) <$> foldM step rendered edits
 where
  rendered :: [NameableModule Text]
  rendered = map (fmap (T.pack . render)) family

  step :: [NameableModule Text] -> TextEdit -> Either TransformError [NameableModule Text]
  step fam TextEdit{..}
    | hits == 0 = Left $ TextEditMissed{..}
    | otherwise = Right $ map (fmap (T.replace needle replacement)) fam
   where
    hits = sum (map (T.count needle . (.hsModule)) fam)
