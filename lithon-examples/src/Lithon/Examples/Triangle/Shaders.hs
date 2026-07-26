{-# LANGUAGE TemplateHaskell #-}

-- | The compiled SPIR-V blobs, embedded at build time, shared by the
-- offscreen and windowed triangles.
--
-- 'makeRelativeToProject' anchors the paths at the package root (the
-- directory holding @lithon-examples.cabal@) so the splices resolve
-- regardless of the compiler's working directory: @cabal build@
-- compiles from the package directory, but HLS drives a multi-repl
-- session (@multi-repl: True@) from the project root, where a bare
-- relative path does not exist.
module Lithon.Examples.Triangle.Shaders (
  vertSpv,
  fragSpv,
  spirvWords,
) where

import Data.Bits (shiftL, (.|.))
import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Data.FileEmbed (embedFile, makeRelativeToProject)
import Data.Vector qualified as V
import Data.Word (Word32)

vertSpv :: ByteString
vertSpv = $(makeRelativeToProject "shaders/triangle.vert.spv" >>= embedFile)

fragSpv :: ByteString
fragSpv = $(makeRelativeToProject "shaders/triangle.frag.spv" >>= embedFile)

-- | Repack SPIR-V bytes (little-endian) into the 'Word32' stream
-- 'Lithon.createShaderModule' expects.
spirvWords :: ByteString -> V.Vector Word32
spirvWords bs =
  V.generate (BS.length bs `div` 4) \i ->
    let b k = fromIntegral (BS.index bs (i * 4 + k)) :: Word32
     in b 0 .|. (b 1 `shiftL` 8) .|. (b 2 `shiftL` 16) .|. (b 3 `shiftL` 24)
