{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- | Embedded file trees for hs-bindgen's runtime
module Lithon.HsBindgen.Runtime (
  hsBindgenRuntimeLicense,
  hsBindgenRuntimeTree,
  cexprRuntimeLicense,
  cexprRuntimeCoreTree,
  cexprRuntimeLibTree,
) where

import Data.FileEmbed (embedDir, embedFileRelative, makeRelativeToProject)
import Lithon.Prelude
import System.FilePath ((</>))

hsBindgenRuntimeLicense :: ByteString
hsBindgenRuntimeLicense = $(embedFileRelative ("vendor" </> "hs-bindgen" </> "hs-bindgen-runtime" </> "LICENSE"))

-- |
-- >>> take 5 (map fst hsBindgenRuntimeTree )
-- ["HsBindgen/Runtime/BitfieldPtr.hs","HsBindgen/Runtime/Block.hs","HsBindgen/Runtime/CBool.hs","HsBindgen/Runtime/CEnum.hs","HsBindgen/Runtime/ConstantArray.hs"]
hsBindgenRuntimeTree :: [(FilePath, ByteString)]
hsBindgenRuntimeTree =
  $(makeRelativeToProject ("vendor" </> "hs-bindgen" </> "hs-bindgen-runtime" </> "src") >>= embedDir)

cexprRuntimeLicense :: ByteString
cexprRuntimeLicense = $(embedFileRelative ("vendor" </> "c-expr" </> "c-expr-runtime" </> "LICENSE"))

-- |
-- >>> take 5 (map fst cexprRuntimeCoreTree)
-- ["C/Operator/Classes.hs","C/Operator/GenInstances.hs","C/Operator/Internal.hs","C/Operator/TH.hs","C/Operators.hs"]
cexprRuntimeCoreTree :: [(FilePath, ByteString)]
cexprRuntimeCoreTree = $(makeRelativeToProject ("vendor" </> "c-expr" </> "c-expr-runtime" </> "core") >>= embedDir)

-- |
-- >>> take 5 (map fst cexprRuntimeLibTree)
-- ["C/Expr/HostPlatform.hs","C/Expr/Posix32.hs","C/Expr/Posix64.hs","C/Expr/Win64.hs"]
cexprRuntimeLibTree :: [(FilePath, ByteString)]
cexprRuntimeLibTree = $(makeRelativeToProject ("vendor" </> "c-expr" </> "c-expr-runtime" </> "lib") >>= embedDir)
