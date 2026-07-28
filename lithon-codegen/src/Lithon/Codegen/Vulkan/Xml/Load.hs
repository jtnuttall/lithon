{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | Loads XML bytes into the positioned tree of "Lithon.Codegen.Vulkan.Xml.Types"
-- via xml-conduit's streaming parser (the DOM API drops source positions).
--
-- The loader is deliberately strict about anything the Vulkan registry never
-- contains — doctypes, processing instructions, namespaced names, unresolved
-- entities, duplicate attributes — so that surprises fail loudly with a
-- position instead of flowing into the decoder.
module Lithon.Codegen.Vulkan.Xml.Load (
  XmlLoadError (..),
  loadXmlBytes,
  loadXmlFile,
) where

import Conduit (ConduitT, await, runConduit, sourceFile, yield, (.|))
import Data.Conduit.Attoparsec (Position (posCol, posLine), PositionRange (posRangeStart))
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.XML.Types (Content (..), Event (..))
import Data.XML.Types qualified as XML
import Effectful (Eff, IOE, runPureEff, (:>))
import Effectful.Exception (try)
import Effectful.Resource (Resource)
import Lithon.Prelude
import Text.XML.Stream.Parse qualified as XP

import Lithon.Codegen.Vulkan.Xml.Types (Pos (..), XElement (..), XNode (..), noPos)

-- | Everything that can go wrong turning bytes into an 'XElement'. Positions
-- are best-effort ('noPos' when the parser reported none).
data XmlLoadError
  = -- | Malformed XML (or I/O failure), rendered from the underlying exception.
    XmlUnparseable Text
  | XmlDoctypeForbidden Pos
  | XmlInstructionForbidden Pos
  | -- | A namespaced or prefixed name; the registry uses plain local names only.
    XmlNamespacedName Text Pos
  | -- | An entity the parser could not resolve to text.
    XmlUnresolvedEntity Text Pos
  | XmlDuplicateAttribute Text Pos
  | XmlTextOutsideRoot Pos
  | XmlMultipleRoots Pos
  | XmlNoRootElement
  | -- | Defensive: the parser is expected to throw before these two arise.
    XmlUnbalancedEnd Pos
  | XmlUnclosedElement Text Pos
  deriving stock (Eq, Show)

instance Display XmlLoadError where
  displayBuilder =
    \case
      XmlUnparseable msg -> "unparseable XML: " <> from msg
      XmlDoctypeForbidden p -> at p "doctype declarations are not allowed"
      XmlInstructionForbidden p -> at p "processing instructions are not allowed"
      XmlNamespacedName n p -> at p ("namespaced name is not allowed: " <> from n)
      XmlUnresolvedEntity e p -> at p ("unresolved entity: &" <> from e <> ";")
      XmlDuplicateAttribute a p -> at p ("duplicate attribute: " <> from a)
      XmlTextOutsideRoot p -> at p "non-whitespace text outside the root element"
      XmlMultipleRoots p -> at p "multiple root elements"
      XmlNoRootElement -> "no root element"
      XmlUnbalancedEnd p -> at p "unbalanced end tag"
      XmlUnclosedElement n p -> at p ("unclosed element: " <> from n)
   where
    at p msg = from p <> ": " <> msg

-- | Load from in-memory bytes. Pure; meant for tests and small fixtures.
loadXmlBytes :: ByteString -> Either XmlLoadError XElement
loadXmlBytes bytes =
  runPureEff . runLoad $ yield bytes .| XP.parseBytesPos XP.def .| treeSink

-- | Load from a file, streaming. I/O failures surface as 'XmlUnparseable'.
loadXmlFile :: (Resource :> es, IOE :> es) => FilePath -> Eff es (Either XmlLoadError XElement)
loadXmlFile path =
  runLoad $ sourceFile path .| XP.parseBytesPos XP.def .| treeSink

-- | Run a loading conduit, folding exceptions thrown by the streaming parser
-- (malformed XML, I/O) into 'XmlUnparseable'.
runLoad
  :: ConduitT () Void (Eff es) (Either XmlLoadError XElement)
  -> Eff es (Either XmlLoadError XElement)
runLoad pipeline =
  either absorb id <$> try @SomeException (runConduit pipeline)
 where
  absorb = Left . XmlUnparseable . T.pack . displayException

-- | An element under construction: children accumulate in reverse.
data Frame = Frame
  { name :: Text
  , attrs :: Map Text Text
  , pos :: Pos
  , childrenRev :: [XNode]
  }

treeSink :: (Monad m) => ConduitT XP.EventPos Void m (Either XmlLoadError XElement)
treeSink = go [] Nothing
 where
  go stack root =
    await >>= \case
      Nothing -> pure case (stack, root) of
        ([], Just el) -> Right el
        ([], Nothing) -> Left XmlNoRootElement
        (f : _, _) -> Left (XmlUnclosedElement f.name f.pos)
      Just (mrange, event) -> step stack root (toPos mrange) event

  step stack root pos = \case
    EventBeginDocument -> go stack root
    EventEndDocument -> go stack root
    EventBeginDoctype{} -> pure (Left (XmlDoctypeForbidden pos))
    EventEndDoctype -> pure (Left (XmlDoctypeForbidden pos))
    EventInstruction{} -> pure (Left (XmlInstructionForbidden pos))
    EventComment _ -> go stack root
    EventBeginElement rawName rawAttrs
      | null stack, Just _ <- root -> pure (Left (XmlMultipleRoots pos))
      | otherwise -> case makeFrame pos rawName rawAttrs of
          Left err -> pure (Left err)
          Right frame -> go (frame : stack) root
    EventEndElement _ -> case stack of
      [] -> pure (Left (XmlUnbalancedEnd pos))
      frame : rest ->
        let el = closeFrame frame
         in case rest of
              [] -> go [] (Just el)
              parent : outer -> go (addChild (XElem el) parent : outer) root
    EventContent (ContentText t) -> text stack root pos t
    EventCDATA t -> text stack root pos t
    EventContent (ContentEntity e) -> pure (Left (XmlUnresolvedEntity e pos))

  text stack root pos t = case stack of
    frame : rest -> go (addText t pos frame : rest) root
    []
      | T.all isXmlSpace t -> go stack root
      | otherwise -> pure (Left (XmlTextOutsideRoot pos))

toPos :: Maybe PositionRange -> Pos
toPos = maybe noPos \range ->
  let start = posRangeStart range
   in Pos{line = posLine start, column = posCol start}

makeFrame :: Pos -> XML.Name -> [(XML.Name, [Content])] -> Either XmlLoadError Frame
makeFrame pos rawName rawAttrs = do
  name <- localName pos rawName
  attrs <- foldM insertAttr Map.empty rawAttrs
  pure Frame{name, attrs, pos, childrenRev = []}
 where
  insertAttr acc (attrName, contents) = do
    key <- localName pos attrName
    value <- T.concat <$> traverse contentText contents
    case Map.insertLookupWithKey (\_ new _ -> new) key value acc of
      (Just _, _) -> Left (XmlDuplicateAttribute key pos)
      (Nothing, acc') -> Right acc'
  contentText = \case
    ContentText t -> Right t
    ContentEntity e -> Left (XmlUnresolvedEntity e pos)

localName :: Pos -> XML.Name -> Either XmlLoadError Text
localName pos n
  | Nothing <- XML.nameNamespace n
  , Nothing <- XML.namePrefix n =
      Right (XML.nameLocalName n)
  | otherwise = Left (XmlNamespacedName (XML.nameLocalName n) pos)

-- | Append a child; adjacent text runs merge (comments and CDATA boundaries
-- must not fragment the C code text the registry embeds).
addChild :: XNode -> Frame -> Frame
addChild node frame = frame{childrenRev = node : frame.childrenRev}

addText :: Text -> Pos -> Frame -> Frame
addText t pos frame = case frame.childrenRev of
  XText t0 p0 : rest -> frame{childrenRev = XText (t0 <> t) p0 : rest}
  rest -> frame{childrenRev = XText t pos : rest}

closeFrame :: Frame -> XElement
closeFrame frame =
  XElement
    { name = frame.name
    , attrs = frame.attrs
    , nodes = reverse frame.childrenRev
    , pos = frame.pos
    }

isXmlSpace :: Char -> Bool
isXmlSpace c = c == ' ' || c == '\t' || c == '\n' || c == '\r'
