{-# LANGUAGE OverloadedStrings #-}

-- | Chunk extraction and declaration parsing for mixed-content C bodies.
--
-- Strategy: the XML markup already tokenizes the load-bearing parts
-- (@\<type\>@, @\<name\>@, @\<enum\>@), so we never flatten to text and
-- re-lex names. Only the interstitial text runs are lexed — their alphabet,
-- censused from the pinned registry, is exactly @const@, @struct@, @*@,
-- @[@, @]@, @:@, and integers — and a small LL(1) recursive descent runs
-- over the combined token stream. Every token carries the position of its
-- chunk, so failures point into vk.xml.
module Lithon.Codegen.Vulkan.Registry.Micro.CDecl (
  -- * Chunk extraction
  chunksFromNodes,

  -- * Declaration parsing
  parseDeclaration,

  -- * Decoder bridges
  decodeMixedBody,
  decodeDeclaration,
) where

import Data.Char (isAsciiLower, isAsciiUpper, isDigit)
import Data.Char qualified as Char
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Text.Read qualified as T
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Registry.Micro.Common (parseFeaturePath)
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (
  ArrayDim (..),
  Declaration (..),
  MixedBody (..),
  MixedChunk (..),
  NameAlias (..),
  PtrLayer (..),
  TypeRef (..),
  chunkPos,
  mkMixedBody,
 )
import Lithon.Codegen.Vulkan.Xml.Decode (
  Decode,
  ErrorKind (..),
  abortWithAt,
  mixedNodes,
 )
import Lithon.Codegen.Vulkan.Xml.Types (Pos, XElement (..), XNode (..), noPos)

-- | Interpret an element's nodes as mixed content. Strict: only @\<type\>@,
-- @\<name\>@ (with optional @alias@), @\<enum\>@, and @\<comment\>@ children
-- are legal, none may nest elements, and no other attributes are allowed.
chunksFromNodes :: [XNode] -> Either (Pos, ErrorKind) [MixedChunk]
chunksFromNodes = traverse chunkOf
 where
  chunkOf = \case
    XText t p -> Right (ChunkText t p)
    XElem el -> case el.name of
      "type" -> ChunkType <$> simple el <*> pure el.pos
      "enum" -> ChunkEnum <$> simple el <*> pure el.pos
      "comment" -> Right (ChunkComment (T.concat [t | XText t _ <- el.nodes]) el.pos)
      "name" -> do
        alias <- nameAlias el
        text <- content el
        pure (ChunkName text alias el.pos)
      other -> Left (el.pos, UnknownElement other)

  simple el = noAttrs el *> content el

  noAttrs el = case Map.toAscList el.attrs of
    [] -> Right ()
    (k, v) : _ -> Left (el.pos, UnknownAttribute k v)

  content el = do
    text <- case traverse textNode el.nodes of
      Nothing ->
        Left (el.pos, MalformedBody ("unexpected child element inside <" <> el.name <> ">"))
      Just ts -> Right (T.concat ts)
    if T.null text then
      Left (el.pos, MalformedBody ("empty <" <> el.name <> "> in mixed content"))
    else
      Right text
  textNode = \case
    XText t _ -> Just t
    XElem _ -> Nothing

  nameAlias el = case Map.toAscList el.attrs of
    [] -> Right Nothing
    [("alias", v)] -> case parseNameAlias v of
      Right a -> Right (Just a)
      Left msg -> Left (el.pos, MalformedAttribute "alias" v msg)
    (k, v) : _ | k /= "alias" -> Left (el.pos, UnknownAttribute k v)
    _ -> Left (el.pos, MalformedBody "unexpected attributes on <name>")

  -- Either a Struct::member feature path or a bare feature/extension name.
  parseNameAlias v
    | "::" `T.isInfixOf` v = NameAliasPath <$> parseFeaturePath v
    | not (T.null v)
    , T.all (\c -> c == '_' || Char.isAlphaNum c) v =
        Right (NameAliasName v)
    | otherwise = Left "expected Struct::member or a bare name"

-- Lexing ---------------------------------------------------------------------

data CTok
  = TokConst !Pos
  | TokStruct !Pos
  | TokStar !Pos
  | TokLBracket !Pos
  | TokRBracket !Pos
  | TokColon !Pos
  | TokInt !Integer !Pos
  | TokTypeRef !Text !Pos
  | TokNameDef !Text !(Maybe NameAlias) !Pos
  | TokEnumRef !Text !Pos

tokPos :: CTok -> Pos
tokPos = \case
  TokConst p -> p
  TokStruct p -> p
  TokStar p -> p
  TokLBracket p -> p
  TokRBracket p -> p
  TokColon p -> p
  TokInt _ p -> p
  TokTypeRef _ p -> p
  TokNameDef _ _ p -> p
  TokEnumRef _ p -> p

describeTok :: CTok -> Text
describeTok = \case
  TokConst _ -> "'const'"
  TokStruct _ -> "'struct'"
  TokStar _ -> "'*'"
  TokLBracket _ -> "'['"
  TokRBracket _ -> "']'"
  TokColon _ -> "':'"
  TokInt n _ -> "integer " <> show n
  TokTypeRef t _ -> "<type>" <> t <> "</type>"
  TokNameDef t _ _ -> "<name>" <> t <> "</name>"
  TokEnumRef t _ -> "<enum>" <> t <> "</enum>"

lexChunks :: [MixedChunk] -> Either (Pos, ErrorKind) [CTok]
lexChunks = fmap concat . traverse lexChunk
 where
  lexChunk = \case
    ChunkText t p -> lexText p t
    ChunkType t p -> Right [TokTypeRef t p]
    ChunkName t alias p -> Right [TokNameDef t alias p]
    ChunkEnum t p -> Right [TokEnumRef t p]
    ChunkComment _ _ -> Right []

lexText :: Pos -> Text -> Either (Pos, ErrorKind) [CTok]
lexText pos = go
 where
  go t = case T.uncons (T.stripStart t) of
    Nothing -> Right []
    Just (c, rest)
      | c == '*' -> (TokStar pos :) <$> go rest
      | c == '[' -> (TokLBracket pos :) <$> go rest
      | c == ']' -> (TokRBracket pos :) <$> go rest
      | c == ':' -> (TokColon pos :) <$> go rest
      | isDigit c -> do
          (digits, rest') <-
            first ((pos,) . MalformedBody . T.pack . ("Could not parse decimal: " <>)) $ T.decimal t
          (TokInt digits pos :) <$> go rest'
      | otherwise ->
          let stripped = T.stripStart t
           in case keyword stripped of
                Just (tok, rest') -> (tok :) <$> go rest'
                Nothing ->
                  Left
                    ( pos
                    , MalformedBody
                        ("unexpected token in C declaration text: " <> T.take 24 stripped)
                    )
  keyword t =
    case [(tok, rest) | (kw, tok) <- keywords, Just rest <- [wordPrefix kw t]] of
      (hit : _) -> Just hit
      [] -> Nothing
  keywords = [("const", TokConst pos), ("struct", TokStruct pos)]
  wordPrefix kw t = do
    rest <- T.stripPrefix kw t
    case T.uncons rest of
      Just (c, _) | isIdentChar c -> Nothing
      _ -> Just rest
  isIdentChar c = c == '_' || isDigit c || isAsciiLower c || isAsciiUpper c

-- Parsing --------------------------------------------------------------------

-- | Parse a declaration from a mixed body:
-- @const? struct? TYPE ('*' const?)* NAME (':' INT | ('[' dim ']')*)@.
parseDeclaration :: MixedBody -> Either (Pos, ErrorKind) Declaration
parseDeclaration body = do
  toks <- lexChunks (V.toList body.chunks)
  parseToks (maybe noPos chunkPos (body.chunks V.!? 0)) toks

parseToks :: Pos -> [CTok] -> Either (Pos, ErrorKind) Declaration
parseToks startPos toks0 = do
  let (baseConst, toks1) = flag isConstTok toks0
      (structKw, toks2) = flag isStructTok toks1
  (typeName, toks3) <- case toks2 of
    TokTypeRef t p : rest -> Right (TypeRef{name = WithNS t, pos = p}, rest)
    tok : _ -> Left (tokPos tok, expected "a <type> reference" tok)
    [] -> Left (startPos, MalformedBody "empty declaration (no <type>)")
  let (pointers, toks4) = ptrs toks3
  (name, nameAlias, namePos, toks5) <- case toks4 of
    TokNameDef n alias p : rest -> Right (n, alias, p, rest)
    tok : _ -> Left (tokPos tok, expected "the <name>" tok)
    [] -> Left (startPos, MalformedBody "declaration is missing its <name>")
  (arrayDims, bitfield, toks6) <- declSuffix toks5
  case toks6 of
    [] ->
      Right
        Declaration
          { name
          , nameAlias
          , typeName
          , baseConst
          , structKw
          , pointers
          , arrayDims
          , bitfield
          , pos = namePos
          }
    tok : _ -> Left (tokPos tok, expected "end of declaration" tok)
 where
  flag p = \case
    (tok : rest) | p tok -> (True, rest)
    rest -> (False, rest)
  isConstTok = \case TokConst _ -> True; _ -> False
  isStructTok = \case TokStruct _ -> True; _ -> False

  ptrs = \case
    TokStar _ : TokConst _ : rest -> consLayer PtrLayer{isConst = True} (ptrs rest)
    TokStar _ : rest -> consLayer PtrLayer{isConst = False} (ptrs rest)
    rest -> ([], rest)
  consLayer l (ls, rest) = (l : ls, rest)

  declSuffix = \case
    TokColon p : rest -> case rest of
      TokInt n _ : rest' -> Right ([], Just (fromInteger n), rest')
      tok : _ -> Left (tokPos tok, expected "a bitfield width" tok)
      [] -> Left (p, MalformedBody "expected a bitfield width after ':'")
    toks@(TokLBracket _ : _) -> do
      (dims, rest) <- dimensions toks
      Right (dims, Nothing, rest)
    toks -> Right ([], Nothing, toks)

  dimensions = \case
    TokLBracket p : rest -> do
      (dim, rest') <- case rest of
        TokInt n _ : r -> Right (DimLit n, r)
        TokEnumRef t ep : r -> Right (DimNamespace (WithNS t) ep, r)
        tok : _ -> Left (tokPos tok, expected "an array dimension" tok)
        [] -> Left (p, MalformedBody "unterminated array dimension")
      case rest' of
        TokRBracket _ : r -> do
          (dims, rest'') <- dimensions r
          Right (dim : dims, rest'')
        tok : _ -> Left (tokPos tok, expected "']'" tok)
        [] -> Left (p, MalformedBody "unterminated array dimension")
    toks -> Right ([], toks)

  expected what tok =
    MalformedBody ("expected " <> what <> ", found " <> describeTok tok)

-- Decoder bridges ------------------------------------------------------------

-- | Consume the current element's remaining nodes as a 'MixedBody'.
decodeMixedBody :: Decode MixedBody
decodeMixedBody = do
  nodes <- mixedNodes
  case chunksFromNodes nodes of
    Left (pos, kind) -> abortWithAt pos kind
    Right cs -> pure (mkMixedBody cs)

-- | Consume the current element's remaining nodes as a declaration (member,
-- param, proto), returning the structure alongside the preserved body.
decodeDeclaration :: Decode (Declaration, MixedBody)
decodeDeclaration = do
  body <- decodeMixedBody
  case parseDeclaration body of
    Left (pos, kind) -> abortWithAt pos kind
    Right decl -> pure (decl, body)
