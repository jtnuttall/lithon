-- | Raw-binding triangle: a vertex-colored triangle through SDL's own 2D
-- API (@SDL_RenderGeometry@), driven by the idiomatic @SDL3.Sys.*@ layer —
-- camel-segment aliases over the raw bindings ('createWindow',
-- 'renderGeometry'), types re-exported C-shaped (CString titles,
-- 'ConstPtr' vertex arrays, by-hand 'Storable' pokes), status results
-- bridged to 'Bool' and flag constants typed at their newtypes by the
-- curated layer. Unsuffixed aliases are the unsafe foreign imports;
-- this example registers no Haskell callbacks, so they are the right
-- default throughout. Windowed normally; headless with
-- @SDL_VIDEODRIVER=offscreen@ (the gate), where the final frame is
-- probe-asserted via 'renderReadPixels' + 'readSurfacePixel'.
module Main (main) where

import Control.Monad (unless, when, zipWithM_)
import Data.Int (Int32)
import Foreign.C.ConstPtr (ConstPtr (..))
import Foreign.C.String (peekCString, withCString)
import Foreign.Marshal.Alloc (alloca)
import Foreign.Marshal.Array (allocaArray)
import Foreign.Ptr (Ptr, castPtr, nullPtr)
import Foreign.Storable (peek, pokeElemOff)
import GHC.Records (getField)
import SDL3.Sys.Error (getError)
import SDL3.Sys.Events (
  SDL_Event,
  SDL_EventType,
  SDL_KeyboardEvent (..),
  pollEvent,
  pattern SDL_EVENT_KEY_DOWN,
  pattern SDL_EVENT_QUIT,
 )
import SDL3.Sys.Init (init, quit, pattern SDL_INIT_VIDEO)
import SDL3.Sys.Pixels (SDL_FColor (..))
import SDL3.Sys.Rect (SDL_FPoint (..))
import SDL3.Sys.Render (
  SDL_Renderer,
  SDL_Vertex (..),
  createRenderer,
  destroyRenderer,
  renderClear,
  renderGeometry,
  renderPresent,
  renderReadPixels,
  setRenderDrawColor,
 )
import SDL3.Sys.Stdinc (Uint8)
import SDL3.Sys.Surface (SDL_Surface, destroySurface, readSurfacePixel)
import SDL3.Sys.Version (getVersion)
import SDL3.Sys.Video (createWindow, destroyWindow)
import System.Environment (getArgs)
import System.Exit (exitFailure)
import Prelude hiding (init)

winW, winH :: Int32
winW = 640
winH = 360

main :: IO ()
main = do
  frames <- parseFrames <$> getArgs

  version <- getVersion
  let (major, rest) = fromIntegral version `divMod` (1000000 :: Int)
      (minor, micro) = rest `divMod` 1000
  putStrLn
    ( "sdl3-raw: linked against SDL "
        <> show major
        <> "."
        <> show minor
        <> "."
        <> show micro
    )

  -- The curated layer types the macro constant at the SDL_InitFlags
  -- newtype (the raw sDL_INIT_VIDEO CUInt stays available under
  -- SDL3.Sys.Bindgen.Init).
  ok <- init SDL_INIT_VIDEO
  unless ok (die "SDL_Init")

  window <- withCString "sdl3-raw" \title ->
    createWindow (ConstPtr title) winW winH 0
  when (window == nullPtr) (die "SDL_CreateWindow")

  -- NULL asks SDL for the best renderer for this window; if none binds
  -- (driver-dependent), fall back to the software renderer explicitly.
  renderer <- do
    preferred <- createRenderer window (ConstPtr nullPtr)
    if preferred /= nullPtr then
      pure preferred
    else do
      software <- withCString "software" (createRenderer window . ConstPtr)
      when (software == nullPtr) (die "SDL_CreateRenderer")
      pure software

  sawQuit <- pumpFrames renderer frames
  putStrLn
    ( "sdl3-raw: rendered "
        <> show frames
        <> " frames"
        <> (if sawQuit then " (quit event seen)" else "")
    )

  -- Probe the final frame: draw once more, read the backbuffer BEFORE
  -- presenting it (present leaves the backbuffer undefined).
  drawScene renderer
  probeScene renderer
  _ <- renderPresent renderer

  destroyRenderer renderer
  destroyWindow window
  quit
  putStrLn "sdl3-raw: OK"

-- | Clear to black and draw the vertex-colored triangle.
drawScene :: Ptr SDL_Renderer -> IO ()
drawScene renderer = do
  okColor <- setRenderDrawColor renderer 0 0 0 255
  unless okColor (die "SDL_SetRenderDrawColor")
  okClear <- renderClear renderer
  unless okClear (die "SDL_RenderClear")
  withVertices triangle \vertices -> do
    okGeom <-
      renderGeometry
        renderer
        nullPtr -- no texture
        vertices
        (fromIntegral (length triangle))
        (ConstPtr nullPtr) -- no index buffer
        0
    unless okGeom (die "SDL_RenderGeometry")

triangle :: [SDL_Vertex]
triangle =
  [ vertex 320 60 1 0 0
  , vertex 110 300 0 1 0
  , vertex 530 300 0 0 1
  ]
 where
  vertex px py cr cg cb =
    SDL_Vertex
      { position = SDL_FPoint{x = px, y = py}
      , color = SDL_FColor{r = cr, g = cg, b = cb, a = 1}
      , tex_coord = SDL_FPoint{x = 0, y = 0}
      }

withVertices :: [SDL_Vertex] -> (ConstPtr SDL_Vertex -> IO a) -> IO a
withVertices vs continue = allocaArray (length vs) \buf -> do
  zipWithM_ (pokeElemOff buf) [0 ..] vs
  continue (ConstPtr buf)

-- | Read the whole render target back and assert the triangle is there:
-- the centroid area carries interpolated vertex color, the top corners
-- stay at the clear color.
probeScene :: Ptr SDL_Renderer -> IO ()
probeScene renderer = do
  surface <- renderReadPixels renderer (ConstPtr nullPtr)
  when (surface == nullPtr) (die "SDL_RenderReadPixels")
  inside <- probePixel surface 320 220
  corner <- probePixel surface 16 16
  putStrLn ("sdl3-raw: probe inside=" <> show inside <> " corner=" <> show corner)
  let lum (pr, pg, pb) = pr + pg + pb
  unless (lum inside >= 60) (die "probe: triangle interior is not lit")
  unless (lum corner <= 24) (die "probe: background is not the clear color")
  _ <- destroySurface surface
  putStrLn "sdl3-raw: all probes passed"

probePixel :: Ptr SDL_Surface -> Int32 -> Int32 -> IO (Int, Int, Int)
probePixel surface px py =
  alloca \pr -> alloca \pg -> alloca \pb -> alloca \pa -> do
    ok <- readSurfacePixel surface px py pr pg pb pa
    unless ok (die "SDL_ReadSurfacePixel")
    red <- fromIntegral <$> peek @Uint8 pr
    green <- fromIntegral <$> peek @Uint8 pg
    blue <- fromIntegral <$> peek @Uint8 pb
    pure (red, green, blue)

-- | Draw + present once per frame, draining the event queue and reading
-- each event's type straight off the wire (the discriminant is the
-- union's first word).
pumpFrames :: Ptr SDL_Renderer -> Int -> IO Bool
pumpFrames renderer total = alloca @SDL_Event \event -> go event total False
 where
  go _ 0 sawQuit = pure sawQuit
  go event n sawQuit = do
    drawScene renderer
    _ <- renderPresent renderer
    quitNow <- drain event False
    go event (n - 1) (sawQuit || quitNow)
  drain event sawQuit = do
    pending <- pollEvent event
    if not pending then
      pure sawQuit
    else do
      eventType <- peek (castPtr event :: Ptr SDL_EventType)
      case eventType of
        SDL_EVENT_QUIT -> drain event True
        -- The union payload: peek the whole 128-byte event, then project
        -- the member for the discriminant just read.
        SDL_EVENT_KEY_DOWN -> do
          ev <- peek event
          let SDL_KeyboardEvent{scancode = sc} = getField @"key" ev
          putStrLn ("sdl3-raw: keydown scancode=" <> show sc)
          drain event sawQuit
        _ -> drain event sawQuit

parseFrames :: [String] -> Int
parseFrames = \case
  ["--frames", n] | Just parsed <- readMaybe n -> parsed
  _ -> 60
 where
  readMaybe s = case reads s of
    [(v, "")] -> Just v
    _ -> Nothing

die :: String -> IO a
die what = do
  err <- getError
  msg <- peekCString (unConstPtr err)
  putStrLn ("sdl3-raw: " <> what <> " failed: " <> msg)
  exitFailure
