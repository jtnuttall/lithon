{-# LANGUAGE OverloadedStrings #-}

-- | Decoders for the @\<types\>@ section.
module Lithon.Codegen.Vulkan.Registry.Parse.Types (
  TypesSection (..),
  typesSectionD,
  typeD,
  memberD,
) where

import Data.Vector qualified as V

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.CDecl (decodeDeclaration, decodeMixedBody)
import Lithon.Codegen.Vulkan.Registry.Micro.Common (rawEither)
import Lithon.Codegen.Vulkan.Registry.Micro.ExternSync (parseExternSync)
import Lithon.Codegen.Vulkan.Registry.Micro.Len (parseAltLen, parseLen)
import Lithon.Codegen.Vulkan.Registry.Parse.Common (
  apiAttr,
  boolListAttr,
  commentAttr,
  deprecatedAttr,
  nameListAttr,
  namesAttr,
  parseBoolText,
 )
import Lithon.Codegen.Vulkan.Registry.Parse.Decls (paramD, protoD)
import Lithon.Codegen.Vulkan.Registry.Types.CDecl (MixedBody (..), MixedChunk (..))
import Lithon.Codegen.Vulkan.Registry.Types.Core (
  AliasOr (..),
  BasetypeType (..),
  BitmaskDef (..),
  DefineType (..),
  EnumMarker (..),
  ExternalType (..),
  FuncpointerDef (..),
  HandleDef (..),
  IncludeType (..),
  Member (..),
  StructDef (..),
  TypeBody (..),
  TypeCommon (..),
  TypeDecl (..),
 )
import Lithon.Codegen.Vulkan.Xml.Decode (
  Decode,
  ErrorKind (..),
  abortWith,
  attrBool,
  attrName,
  attrNameOpt,
  attrOpt,
  attrOptWith,
  currentPos,
  dispatchRest,
  manyNext,
  nextChild,
  textOnly,
 )

-- | The whole @\<types\>@ section: declarations plus the @\<comment\>@
-- separators interleaved between them.
data TypesSection = TypesSection
  { types :: !(Vector TypeDecl)
  , comments :: !(Vector Text)
  }
  deriving stock (Generic)
  deriving anyclass (NFData)

typesSectionD :: Decode TypesSection
typesSectionD = do
  _sectionComment <- commentAttr
  items <-
    dispatchRest
      [ ("type", Left <$> typeD)
      , ("comment", Right <$> textOnly)
      ]
  let (types, comments) = partitionEithers (V.toList items)
  pure TypesSection{types = V.fromList types, comments = V.fromList comments}

typeD :: Decode TypeDecl
typeD = do
  pos <- currentPos
  api <- apiAttr
  requires <- attrOpt "requires"
  deprecated <- deprecatedAttr
  comment <- commentAttr
  category <- attrOpt "category"
  body <- case category of
    Nothing -> TExternal <$> externalD
    Just "include" -> TInclude <$> includeD
    Just "define" -> TDefine <$> defineD
    Just "basetype" -> TBasetype <$> basetypeD
    Just "bitmask" -> TBitmask <$> aliasOr bitmaskD
    Just "handle" -> THandle <$> aliasOr handleD
    Just "enum" -> TEnumDecl <$> aliasOr (EnumMarker <$> attrName "name")
    Just "funcpointer" -> TFuncpointer <$> funcpointerD
    Just "struct" -> TStruct <$> aliasOr structD
    Just "union" -> TUnion <$> aliasOr structD
    Just other -> abortWith (MalformedAttribute "category" other "unknown type category")
  pure TypeDecl{common = TypeCommon{api, requires, deprecated, comment, pos}, body}

-- | Every category admits an alias form: @\<type name=… alias=…\/\>@.
aliasOr :: Decode a -> Decode (AliasOr a)
aliasOr full =
  attrOpt "alias" >>= \case
    Just target -> AliasDef <$> attrName "name" <*> pure (WithNS target)
    Nothing -> FullDef <$> full

externalD :: Decode ExternalType
externalD = ExternalType <$> attrName "name"

includeD :: Decode IncludeType
includeD = IncludeType <$> attrName "name" <*> textOnly

defineD :: Decode DefineType
defineD = do
  nameAttr <- attrOpt "name"
  body <- decodeMixedBody
  name <- case nameAttr of
    Just n -> pure (WithNS n)
    Nothing -> WithNS <$> nameFromBody body
  pure DefineType{name, nameFromAttr = isJust nameAttr, body}

basetypeD :: Decode BasetypeType
basetypeD = do
  body <- decodeMixedBody
  name <- WithNS <$> nameFromBody body
  pure BasetypeType{name, body}

bitmaskD :: Decode BitmaskDef
bitmaskD = do
  bitvalues <- attrNameOpt "bitvalues"
  body <- decodeMixedBody
  name <- WithNS <$> nameFromBody body
  pure BitmaskDef{name, bitvalues, body}

handleD :: Decode HandleDef
handleD = do
  parent <- attrNameOpt "parent"
  objTypeEnum <- attrName "objtypeenum"
  body <- decodeMixedBody
  name <- WithNS <$> nameFromBody body
  pure HandleDef{name, parent, objTypeEnum, body}

funcpointerD :: Decode FuncpointerDef
funcpointerD = do
  proto <- nextChild "proto" protoD
  params <- manyNext "param" paramD
  pure FuncpointerDef{proto, params}

structD :: Decode StructDef
structD = do
  name <- attrName "name"
  returnedOnly <- attrBool "returnedonly" False
  structExtends <- namesAttr "structextends"
  allowDuplicate <- attrOptWith "allowduplicate" parseBoolText
  requiredLimitType <- attrBool "requiredlimittype" False
  items <-
    dispatchRest
      [ ("member", Left <$> memberD)
      , ("comment", Right <$> textOnly)
      ]
  let (members, comments) = partitionEithers (V.toList items)
  pure
    StructDef
      { name
      , returnedOnly
      , structExtends
      , allowDuplicate
      , requiredLimitType
      , members = V.fromList members
      , comments = V.fromList comments
      }

memberD :: Decode Member
memberD = do
  pos <- currentPos
  api <- apiAttr
  values <- namesAttr "values"
  len <- attrOptWith "len" (rawEither parseLen)
  altLen <- attrOptWith "altlen" (rawEither parseAltLen)
  stride <- attrOpt "stride"
  externSync <- attrOptWith "externsync" (rawEither parseExternSync)
  isOptional <- boolListAttr "optional"
  selector <- attrOpt "selector"
  selection <- nameListAttr "selection"
  noAutoValidity <- attrBool "noautovalidity" False
  limitType <- attrOpt "limittype"
  objectType <- attrOpt "objecttype"
  deprecated <- deprecatedAttr
  featureLink <- attrOpt "featurelink"
  flagsExtend <- attrOpt "flagsextend"
  flagsExtendMember <- attrOpt "flagsextendmember"
  (decl, body) <- decodeDeclaration
  let comment = firstComment body
  pure Member{..}
 where
  firstComment body =
    case [c | ChunkComment c _ <- V.toList body.chunks] of
      (c : _) -> Just c
      [] -> Nothing

-- | Pull the declared name out of a raw body's @\<name\>@ chunk (defines,
-- basetypes, bitmask\/handle typedef text).
nameFromBody :: MixedBody -> Decode Text
nameFromBody body =
  case [n | ChunkName n _ _ <- V.toList body.chunks] of
    (n : _) -> pure n
    [] -> abortWith (MalformedBody "expected a <name> in the type body")
