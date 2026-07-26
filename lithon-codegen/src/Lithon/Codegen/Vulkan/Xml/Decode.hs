{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

-- | Strict, position-aware decoding of the positioned XML tree.
--
-- The registry parser's strictness contract lives here:
--
-- * Everything must be consumed. When an element's decoder finishes, any
--   attribute or child it did not consume (and that is not on the
--   'IgnoreList') is recorded as an error — parsing continues, so one run
--   reports /all/ unknown constructs (the registry-drift workflow).
-- * Errors accumulate at element granularity. A decoder failure
--   ('abortWith') aborts only the innermost enclosing 'recover' scope —
--   collection combinators ('manyNext', 'dispatchRest') recover per item, so
--   one bad @\<member\>@ never hides its siblings' errors.
-- * Any recorded error makes the overall parse fail; partially decoded
--   values exist only to keep discovering more errors, and never escape.
--
-- Implementation: a newtype over a pure 'Eff' stack. @'State' 'Diagnostics'@
-- deliberately sits outside @'Error' 'DecodeAbort'@ and — because effectful's
-- static local state survives 'catchError' — diagnostics accumulate straight
-- through aborts, while 'Residual' rollback is handled explicitly by
-- 'inElement', the one place rollback is wanted.
module Lithon.Codegen.Vulkan.Xml.Decode (
  -- * Diagnostics
  ErrorKind (..),
  ParseError (..),
  Warning (..),

  -- * Ignore list
  IgnoreList (..),
  emptyIgnoreList,

  -- * The decoder monad
  Decode,
  runDecodeRoot,

  -- * Attributes
  attr,
  attrOpt,
  attrName,
  attrNameOpt,
  attrWith,
  attrOptWith,
  attrOptDefault,
  attrEnum,
  attrEnumOpt,
  attrEnumDefault,
  attrBool,

  -- * Children
  nextChild,
  optNextChild,
  manyNext,
  dispatchRest,

  -- * Content
  textOnly,
  mixedNodes,
  consumeEverything,

  -- * Diagnostics from decoders
  warn,
  abortWith,
  abortWithAt,
  currentPos,
  currentPath,

  -- * Recovery (for orchestrators)
  recover,
) where

import Data.Aeson (ToJSON)
import Data.DList qualified as DL
import Data.List (lookup)
import Data.Map.Strict qualified as Map
import Data.Set qualified as Set
import Data.Text qualified as T
import Data.Vector qualified as V
import Effectful (Eff, runPureEff)
import Effectful.Error.Static (Error, catchError, runErrorNoCallStack, throwError)
import Effectful.Reader.Static (Reader, ask, asks, local, runReader)
import Effectful.State.Static.Local (State, evalState, get, modify, put, runState)

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Xml.Types (
  PathSeg (..),
  Pos,
  XElement (..),
  XNode (..),
  XPath,
  emptyXPath,
  pushSeg,
 )

-- | What went wrong, structurally. Rendering is centralized in
-- 'renderErrorKind' so messages stay uniform — they are this tool's primary
-- UX when the registry drifts.
data ErrorKind
  = -- | Attribute (name, value) present but not consumed or ignored.
    UnknownAttribute !Text !Text
  | -- | Child element present but not consumed or ignored.
    UnknownElement !Text
  | -- | Non-whitespace text where no text was expected (truncated).
    UnexpectedText !Text
  | MissingAttribute !Text
  | -- | Expected child element missing; the payload names what was expected.
    MissingChild !Text
  | -- | An attribute value failed its micro-grammar.
    MalformedAttribute
      { attribute :: !Text
      , input :: !Text
      , message :: !Text
      }
  | -- | Element content (text/mixed body) failed to parse.
    MalformedBody !Text
  | CustomError !Text
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data ParseError = ParseError
  { path :: !XPath
  , pos :: !Pos
  , kind :: !ErrorKind
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

data Warning = Warning
  { path :: !XPath
  , pos :: !Pos
  , message :: !Text
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display ErrorKind where
  displayBuilder = \case
    UnknownAttribute k v -> "unknown attribute " <> displayBuilder k <> "=\"" <> displayBuilder (ellipsize v) <> "\""
    UnknownElement n -> "unknown element <" <> displayBuilder n <> ">"
    UnexpectedText t -> "unexpected text " <> displayBuilder (T.pack (show (ellipsize t)))
    MissingAttribute k -> "missing required attribute " <> displayBuilder k
    MissingChild n -> "missing required child <" <> displayBuilder n <> ">"
    MalformedAttribute k v msg ->
      "malformed attribute "
        <> displayBuilder k
        <> "=\""
        <> displayBuilder (ellipsize v)
        <> "\": "
        <> displayBuilder msg
    MalformedBody msg -> "malformed element content: " <> displayBuilder msg
    CustomError msg -> displayBuilder msg
   where
    ellipsize t
      | T.length t <= 48 = t
      | otherwise = T.take 47 t <> "…"

instance Display ParseError where
  displayBuilder e =
    displayBuilder e.path <> " @ " <> displayBuilder e.pos <> ": " <> displayBuilder e.kind

instance Display Warning where
  displayBuilder w =
    displayBuilder w.path <> " @ " <> displayBuilder w.pos <> ": " <> displayBuilder w.message

-- | Consciously-unmodeled corners, keyed by element name. Anything listed
-- here is skipped by the leftover check instead of reported. The canonical
-- registry value lives in "Lithon.Codegen.Vulkan.Registry.IgnoreList" (and starts
-- empty — the registry schema is fully modeled).
data IgnoreList = IgnoreList
  { attributes :: !(Map Text (Set Text))
  -- ^ element name -> attribute names to ignore
  , children :: !(Map Text (Set Text))
  -- ^ element name -> child element names to ignore
  }
  deriving stock (Eq, Show)

emptyIgnoreList :: IgnoreList
emptyIgnoreList = IgnoreList{attributes = Map.empty, children = Map.empty}

-- Internal machinery -------------------------------------------------------

data DecodeEnv = DecodeEnv
  { path :: XPath
  , pos :: Pos
  , element :: Text
  , ignore :: IgnoreList
  }

-- | The unconsumed remainder of the element currently being decoded.
-- 'childIndex' counts element children already consumed, so path segments
-- carry document-order indices.
data Residual = Residual
  { attrs :: Map Text Text
  , nodes :: [XNode]
  , childIndex :: Int
  }

data Diagnostics = Diagnostics
  { errors :: DList ParseError
  , warnings :: DList Warning
  }

-- Field names on 'Residual' collide with 'XElement' across record types, and
-- GHC ≥9.10 no longer type-directs ambiguous record updates — hence explicit
-- reconstruction helpers.
setNodes :: [XNode] -> Residual -> Residual
setNodes ns r = Residual{attrs = r.attrs, nodes = ns, childIndex = r.childIndex}

deleteAttr :: Text -> Residual -> Residual
deleteAttr k r = Residual{attrs = Map.delete k r.attrs, nodes = r.nodes, childIndex = r.childIndex}

data DecodeAbort = DecodeAbort
  deriving stock (Show)

type DecodeES =
  '[ Reader DecodeEnv
   , State Residual
   , Error DecodeAbort
   , State Diagnostics
   ]

-- | An element decoder. Opaque; build with the combinators below.
newtype Decode a = Decode (Eff DecodeES a)
  deriving newtype (Applicative, Functor, Monad)

-- | Run a decoder against a root element. Returns the decoded value (if the
-- root itself did not abort) alongside /all/ diagnostics. Callers must treat
-- a non-empty error list as failure regardless of the value.
runDecodeRoot :: IgnoreList -> Text -> Decode a -> XElement -> (Maybe a, [ParseError], [Warning])
runDecodeRoot ignore rootName (Decode body) el =
  ( result
  , toList diagnostics.errors
  , toList diagnostics.warnings
  )
 where
  env =
    DecodeEnv
      { path =
          pushSeg (PathSeg{element = el.name, index = 0, name = Map.lookup "name" el.attrs}) emptyXPath
      , pos = el.pos
      , element = el.name
      , ignore
      }
  checked = do
    Decode do
      rootEnv <- ask @DecodeEnv
      modify \d ->
        if el.name == rootName then
          d
        else
          addError
            (ParseError rootEnv.path rootEnv.pos (CustomError ("expected root element <" <> rootName <> ">")))
            d
    r <- Decode body
    Decode leftoverCheck
    pure r
  (result, diagnostics) =
    runPureEff
      . runState (Diagnostics DL.empty DL.empty)
      . fmap (either (const Nothing) Just)
      . runErrorNoCallStack @DecodeAbort
      . evalState (Residual{attrs = el.attrs, nodes = el.nodes, childIndex = 0})
      . runReader env
      $ let Decode m = checked in m

addError :: ParseError -> Diagnostics -> Diagnostics
addError e d = Diagnostics{errors = DL.snoc d.errors e, warnings = d.warnings}

addWarning :: Warning -> Diagnostics -> Diagnostics
addWarning w d = Diagnostics{errors = d.errors, warnings = DL.snoc d.warnings w}

recordHere :: ErrorKind -> Eff DecodeES ()
recordHere kind = do
  env <- ask @DecodeEnv
  modify (addError (ParseError env.path env.pos kind))

recordAt :: XPath -> Pos -> ErrorKind -> Eff DecodeES ()
recordAt path pos kind = modify (addError (ParseError path pos kind))

-- | Record an error at the current element and abort it. The abort is caught
-- by the innermost 'recover' (every collection combinator installs one).
abortWith :: ErrorKind -> Decode a
abortWith kind = Decode do
  recordHere kind
  throwError DecodeAbort

-- | Like 'abortWith', but at an explicit position (content-level failures
-- inside mixed bodies, where chunks carry finer positions than the element).
abortWithAt :: Pos -> ErrorKind -> Decode a
abortWithAt pos kind = Decode do
  env <- ask @DecodeEnv
  modify (addError (ParseError env.path pos kind))
  throwError DecodeAbort

-- | Record a warning at the current element; decoding continues and the
-- overall parse still succeeds.
warn :: Text -> Decode ()
warn message = Decode do
  env <- ask @DecodeEnv
  modify (addWarning (Warning env.path env.pos message))

currentPos :: Decode Pos
currentPos = Decode (asks @DecodeEnv (.pos))

currentPath :: Decode XPath
currentPath = Decode (asks @DecodeEnv (.path))

-- | Convert an abort into 'Nothing'; the error is already recorded. Exposed
-- for orchestrators that hand-roll recovery scopes.
recover :: Decode a -> Decode (Maybe a)
recover (Decode m) =
  Decode ((Just <$> m) `catchError` \_stack DecodeAbort -> pure Nothing)

-- Attributes ----------------------------------------------------------------

-- | Consume an optional attribute.
attrOpt :: Text -> Decode (Maybe Text)
attrOpt key = Decode do
  residual <- get @Residual
  case Map.lookup key residual.attrs of
    Nothing -> pure Nothing
    Just v -> do
      put (deleteAttr key residual)
      pure (Just v)

-- | Consume a required attribute.
attr :: Text -> Decode Text
attr key = attrOpt key >>= maybe (abortWith (MissingAttribute key)) pure

-- | Consume a required attribute as a typed registry name; the namespace
-- is inferred from the field the name fills.
attrName :: Text -> Decode (WithNS k)
attrName key = WithNS <$> attr key

-- | Consume an optional attribute as a typed registry name.
attrNameOpt :: Text -> Decode (Maybe (WithNS k))
attrNameOpt key = fmap WithNS <$> attrOpt key

-- | Consume a required attribute and run a value parser over it; a 'Left'
-- becomes a 'MalformedAttribute' error carrying the parser's message.
attrWith :: Text -> (Text -> Either Text a) -> Decode a
attrWith key parse = do
  raw <- attr key
  either (abortWith . MalformedAttribute key raw) pure (parse raw)

attrOptWith :: Text -> (Text -> Either Text a) -> Decode (Maybe a)
attrOptWith key parse =
  attrOpt key >>= \case
    Nothing -> pure Nothing
    Just raw ->
      either (abortWith . MalformedAttribute key raw) (pure . Just) (parse raw)

-- | Consume a required attribute whose value set is closed (per the RNC
-- schema). Unknown values are errors — that is the drift tripwire.
attrEnum :: Text -> [(Text, a)] -> Decode a
attrEnum key table = attrWith key (enumParser table)

attrEnumOpt :: Text -> [(Text, a)] -> Decode (Maybe a)
attrEnumOpt key table = attrOptWith key (enumParser table)

-- | Consume an optional attribute, substituting a default when absent.
attrOptDefault :: Text -> a -> (Text -> Either Text a) -> Decode a
attrOptDefault key d parse = fromMaybe d <$> attrOptWith key parse

attrEnumDefault :: Text -> a -> [(Text, a)] -> Decode a
attrEnumDefault key d table = attrOptDefault key d (enumParser table)

enumParser :: [(Text, a)] -> Text -> Either Text a
enumParser table raw =
  maybe (Left ("expected one of: " <> T.intercalate ", " (map fst table))) Right (lookup raw table)

-- | Consume an optional boolean attribute with a default (the registry's
-- @\"true\"@/@\"false\"@ convention, e.g. @returnedonly@, @provisional@).
attrBool :: Text -> Bool -> Decode Bool
attrBool key d = attrEnumDefault key d [("true", True), ("false", False)]

-- Children -------------------------------------------------------------------

-- | Drop leading whitespace-only text runs; record (and skip) non-whitespace
-- text found where child elements are expected.
peelText :: Eff DecodeES ()
peelText = do
  residual <- get @Residual
  case residual.nodes of
    XText t _ : rest
      | T.all isXmlSpace t -> put (setNodes rest residual) >> peelText
    XText t textPos : rest -> do
      env <- ask @DecodeEnv
      recordAt env.path textPos (UnexpectedText t)
      put (setNodes rest residual)
      peelText
    _ -> pure ()

-- | After 'peelText': the next child element, if any. Does not consume.
peekElem :: Eff DecodeES (Maybe XElement)
peekElem = do
  peelText
  residual <- get @Residual
  pure case residual.nodes of
    XElem e : _ -> Just e
    _ -> Nothing

-- | Consume the peeked element, returning its document-order index.
consumeElem :: Eff DecodeES (Int, XElement)
consumeElem = do
  residual <- get @Residual
  case residual.nodes of
    XElem e : rest -> do
      put Residual{attrs = residual.attrs, nodes = rest, childIndex = residual.childIndex + 1}
      pure (residual.childIndex, e)
    _ -> error "consumeElem: no element peeked (Decode internal invariant)"

-- | Run a sub-decoder scoped to a child element: fresh residual, extended
-- path, and — on success — the total-consumption leftover check. The parent's
-- residual is restored on both success and abort.
inElement :: Int -> XElement -> Decode a -> Decode a
inElement index el (Decode body) = Decode do
  saved <- get @Residual
  put Residual{attrs = el.attrs, nodes = el.nodes, childIndex = 0}
  let seg = PathSeg{element = el.name, index, name = Map.lookup "name" el.attrs}
      scoped env = env{path = pushSeg seg env.path, pos = el.pos, element = el.name}
      restoreAndRethrow _stack DecodeAbort = do
        put saved
        throwError DecodeAbort
  r <-
    local scoped (body <* leftoverCheck) `catchError` restoreAndRethrow
  put saved
  pure r

-- | Report everything left unconsumed in the current element (minus the
-- ignore list). Recording, not aborting: the element itself decoded fine,
-- and continuing maximizes how much one run discovers.
leftoverCheck :: Eff DecodeES ()
leftoverCheck = do
  env <- ask @DecodeEnv
  residual <- get @Residual
  let ignoredAttrs = fromMaybe Set.empty (Map.lookup env.element env.ignore.attributes)
      ignoredKids = fromMaybe Set.empty (Map.lookup env.element env.ignore.children)
  sequence_
    [ recordHere (UnknownAttribute k v)
    | (k, v) <- Map.toAscList residual.attrs
    , not (Set.member k ignoredAttrs)
    ]
  let walk _ [] = pure ()
      walk i (node : rest) = case node of
        XText t _
          | T.all isXmlSpace t -> walk i rest
        XText t textPos -> do
          recordAt env.path textPos (UnexpectedText t)
          walk i rest
        XElem e -> do
          if Set.member e.name ignoredKids then
            pure ()
          else
            recordAt
              (pushSeg (PathSeg{element = e.name, index = i, name = Map.lookup "name" e.attrs}) env.path)
              e.pos
              (UnknownElement e.name)
          walk (i + 1) rest
  walk residual.childIndex residual.nodes

-- | Consume exactly one child element named @name@ next in document order
-- (whitespace between children is fine). Anything else aborts.
nextChild :: Text -> Decode a -> Decode a
nextChild name sub =
  optNextChild name sub >>= maybe (abortWith (MissingChild name)) pure

-- | Consume one child element named @name@ if it is next; otherwise consume
-- nothing.
optNextChild :: Text -> Decode a -> Decode (Maybe a)
optNextChild name sub = do
  next <- Decode peekElem
  case next of
    Just e | e.name == name -> do
      (index, el) <- Decode consumeElem
      Just <$> inElement index el sub
    _ -> pure Nothing

-- | Consume the maximal run of children named @name@. Each item decodes in
-- its own recovery scope: a failed item is dropped (its errors recorded) and
-- its siblings still decode.
manyNext :: Text -> Decode a -> Decode (Vector a)
manyNext name sub = V.fromList . reverse <$> go []
 where
  go acc = do
    next <- Decode peekElem
    case next of
      Just e | e.name == name -> do
        (index, el) <- Decode consumeElem
        item <- recover (inElement index el sub)
        go (maybe acc (: acc) item)
      _ -> pure acc

-- | Consume all remaining children against a dispatch table, preserving
-- document order. Children with no table entry are recorded as
-- 'UnknownElement' (at their own position) and skipped; each known child
-- decodes in its own recovery scope.
dispatchRest :: [(Text, Decode a)] -> Decode (Vector a)
dispatchRest table = V.fromList . reverse <$> go []
 where
  go acc = do
    next <- Decode peekElem
    case next of
      Nothing -> pure acc
      Just _ -> do
        (index, el) <- Decode consumeElem
        case lookup el.name table of
          Nothing -> do
            Decode do
              env <- ask @DecodeEnv
              recordAt
                (pushSeg (PathSeg{element = el.name, index, name = Map.lookup "name" el.attrs}) env.path)
                el.pos
                (UnknownElement el.name)
            go acc
          Just sub -> do
            item <- recover (inElement index el sub)
            go (maybe acc (: acc) item)

-- Content --------------------------------------------------------------------

-- | Consume the element's entire content as text (concatenated runs; empty
-- content is @\"\"@). A child element aborts.
textOnly :: Decode Text
textOnly = Decode do
  residual <- get @Residual
  let grab acc = \case
        [] -> pure (Right (T.concat (reverse acc)))
        XText t _ : rest -> grab (t : acc) rest
        XElem e : _ -> pure (Left e.name)
  grab [] residual.nodes >>= \case
    Left offender -> do
      recordHere (CustomError ("expected text-only content, found <" <> offender <> ">"))
      throwError DecodeAbort
    Right t -> do
      put (setNodes [] residual)
      pure t

-- | Consume all remaining child nodes verbatim (mixed-content elements:
-- @\<member\>@, @\<param\>@, @\<proto\>@, define/basetype bodies). Higher
-- layers interpret the node list; see the CDecl machinery.
mixedNodes :: Decode [XNode]
mixedNodes = Decode do
  residual <- get @Residual
  put (setNodes [] residual)
  pure residual.nodes

-- | Consume the element wholesale — attributes and children alike — with no
-- checking. ONLY for orchestrator scaffolding while sections are being
-- brought up; the finished registry parser must not use this.
consumeEverything :: Decode ()
consumeEverything = Decode do
  residual <- get @Residual
  put Residual{attrs = Map.empty, nodes = [], childIndex = residual.childIndex}

isXmlSpace :: Char -> Bool
isXmlSpace c = c == ' ' || c == '\t' || c == '\n' || c == '\r'
