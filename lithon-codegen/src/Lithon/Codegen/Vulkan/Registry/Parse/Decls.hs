{-# LANGUAGE OverloadedStrings #-}

-- | Decoders for the declaration-shaped elements shared between commands
-- and funcpointers: @\<proto\>@ and @\<param\>@.
module Lithon.Codegen.Vulkan.Registry.Parse.Decls (
  protoD,
  paramD,
) where

import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Registry.Micro.CDecl (decodeDeclaration)
import Lithon.Codegen.Vulkan.Registry.Micro.Common (rawEither)
import Lithon.Codegen.Vulkan.Registry.Micro.ExternSync (parseExternSync)
import Lithon.Codegen.Vulkan.Registry.Micro.Len (parseAltLen, parseLen)
import Lithon.Codegen.Vulkan.Registry.Parse.Common (apiAttr, boolListAttr, namesAttr)
import Lithon.Codegen.Vulkan.Registry.Types.Commands (Param (..), ProtoDecl (..))
import Lithon.Codegen.Vulkan.Xml.Decode (Decode, attrBool, attrOpt, attrOptWith, currentPos)

protoD :: Decode ProtoDecl
protoD = do
  pos <- currentPos
  (decl, body) <- decodeDeclaration
  pure ProtoDecl{decl, body, pos}

paramD :: Decode Param
paramD = do
  pos <- currentPos
  api <- apiAttr
  len <- attrOptWith "len" (rawEither parseLen)
  altLen <- attrOptWith "altlen" (rawEither parseAltLen)
  stride <- attrOpt "stride"
  externSync <- attrOptWith "externsync" (rawEither parseExternSync)
  isOptional <- boolListAttr "optional"
  selector <- attrOpt "selector"
  noAutoValidity <- attrBool "noautovalidity" False
  objectType <- attrOpt "objecttype"
  validStructs <- namesAttr "validstructs"
  (decl, body) <- decodeDeclaration
  pure Param{..}
