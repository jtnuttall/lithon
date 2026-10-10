{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | The previous render of the assertion TU, read back as the reference
-- the enum-history check
-- ('Lithon.Codegen.Bindgen.Abi.Validate.validateEnumHistory') compares a
-- regeneration against.
--
-- Enumerators never carry availability upstream (SDL documents no
-- @\\since@ on them), so a regeneration from newer headers bakes every
-- constant the library added or renumbered since the last one with no
-- floor unless the annotations already record it — and nothing in the
-- new headers says which constants those are. The committed
-- @cbits\/abi_assertions.c@ does: it names the library version it was
-- generated from and asserts every enum value that generation baked.
-- Both line shapes read here are the renderer's own
-- ('Lithon.Codegen.Bindgen.Abi.renderAbiAssertions');
-- "Bindgen.AbiRenderTest" pins the round trip.
module Lithon.Codegen.Bindgen.Abi.Previous (
  PreviousRender (..),
  abiAssertionsFile,
  parsePreviousRender,
) where

import Data.Char (isAlphaNum)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Lithon.Prelude

import Lithon.Codegen.Bindgen.Version (Version, parseVersionLoose)

-- | The assertion TU's path under the package root.
abiAssertionsFile :: FilePath
abiAssertionsFile = "cbits/abi_assertions.c"

-- | What an earlier generation asserted.
data PreviousRender = PreviousRender
  { path :: FilePath
  -- ^ As problem reports name it.
  , versionText :: Text
  -- ^ The library version its @LITHON_ABI_HELP@ line names, verbatim.
  , version :: Version
  -- ^ The same, parsed loosely: pkg-config's spelling, not necessarily
  -- the scheme's arity ('Lithon.Codegen.Bindgen.Version.fitArity').
  , enums :: Map Text (Map Text Integer)
  -- ^ Every asserted enum (C spelling: @enum SDL_GamepadType@) and the
  -- baked value of each of its asserted constants.
  }
  deriving stock (Eq, Generic, Show)

-- | Read a rendered TU back, given the target's version label (the words
-- between \"generated from\" and the version: @SDL@, @libmpv client
-- API@). 'Left' says what a hand-edited or foreign file lacks.
parsePreviousRender :: Text -> FilePath -> Text -> Either Text PreviousRender
parsePreviousRender label path contents = do
  versionText <- case mapMaybe helpVersion tuLines of
    ver : _ -> Right ver
    [] -> Left ("no \"generated from " <> label <> " <version>\" in a LITHON_ABI_HELP line")
  version <-
    first (\err -> "the generated-from version: " <> toText err) (parseVersionLoose versionText)
  pure
    PreviousRender
      { path
      , versionText
      , version
      , enums = snd (foldl' step (Nothing, Map.empty) tuLines)
      }
 where
  tuLines = map (T.strip . T.dropWhileEnd (== '\r')) (T.lines contents)
  marker = " was generated from " <> label <> " "
  helpVersion l = do
    guard ("#define LITHON_ABI_HELP" `T.isPrefixOf` l)
    let (_, found) = T.breakOn marker l
    guard (not (T.null found))
    let ver = T.takeWhile (/= ';') (T.drop (T.length marker) found)
    guard (not (T.null ver))
    pure ver
  -- The enum the next value asserts belong to: set by an enum's sizeof
  -- line, cleared by any other type's or by a section banner. The
  -- renderer puts an enum's constants right after its sizeof/alignof
  -- pair, so a constant is never attributed to the wrong enum.
  step (current, acc) l
    | "/* ---- " `T.isPrefixOf` l = (Nothing, acc)
    | Just rest <- T.stripPrefix "_Static_assert(sizeof(" l =
        let ty = T.takeWhile (/= ')') rest
         in if "enum " `T.isPrefixOf` ty then
              (Just ty, Map.insertWith (\_new old -> old) ty Map.empty acc)
            else
              (Nothing, acc)
    | Just enumName <- current
    , Just rest <- T.stripPrefix "_Static_assert((" l
    , (name, afterName) <- T.breakOn ") == (" rest
    , not (T.null name)
    , T.all (\c -> isAlphaNum c || c == '_') name
    , Just value <- readMaybe (toString (T.takeWhile (/= ')') (T.drop 6 afterName))) =
        (current, Map.adjust (Map.insert name value) enumName acc)
    | otherwise = (current, acc)
