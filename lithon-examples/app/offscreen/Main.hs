-- | The gate binary: render, write @triangle.png@, probe pixels, exit
-- nonzero on any probe or validation failure.
module Main (main) where

import Codec.Picture (Image (..), PixelRGBA8, writePng)
import Control.Monad (forM_, unless)
import Data.ByteString qualified as BS
import Data.Vector.Storable qualified as VS
import System.Exit (exitFailure)

import Lithon.Examples.Triangle

size :: Int
size = 512

main :: IO ()
main = do
  frame <- renderTriangle size size
  let px x y =
        let o = (y * frame.width + x) * 4
            at k = BS.index frame.rgba (o + k)
         in (at 0, at 1, at 2, at 3)

  writePng "triangle.png" (toImage frame)
  putStrLn "wrote triangle.png"

  -- corners: the black clear color (generous tolerance)
  forM_ [(4, 4), (size - 5, 4), (4, size - 5), (size - 5, size - 5)] \(x, y) -> do
    let (r, g, b, _a) = px x y
    unless (r < 16 && g < 16 && b < 16) do
      putStrLn ("corner probe failed at " <> show (x, y) <> ": " <> show (r, g, b))
      exitFailure

  -- center: inside the triangle, decidedly not the clear color
  let (r, g, b, a) = px (size `div` 2) (size `div` 2)
  unless (fromIntegral r + fromIntegral g + fromIntegral b > (100 :: Int) && a == 255) do
    putStrLn ("center probe failed: " <> show (r, g, b, a))
    exitFailure

  putStrLn "triangle-offscreen: all probes passed"

toImage :: TriangleFrame -> Image PixelRGBA8
toImage frame =
  Image
    { imageWidth = frame.width
    , imageHeight = frame.height
    , imageData = VS.generate (BS.length frame.rgba) (BS.index frame.rgba)
    }
