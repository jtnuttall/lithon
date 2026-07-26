{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

-- | The apecs Shmup, ported flat from gloss to the generated @SDL3.Sys@
-- layer. The world, components, and systems are the upstream example
-- verbatim (<https://github.com/jonascarpay/apecs/blob/master/examples/Shmup.md>,
-- minus its gloss @Camera@); the gloss @play@ loop becomes an explicit
-- fixed-1\/60-step SDL loop — 'SDL3.pollEvent' key edges for input (SDL's
-- synthesized key repeats are skipped; gloss only ever delivers edges),
-- 'SDL3.renderGeometry' triangles for the shapes, 'SDL3.renderLine'
-- particles, and 'SDL3.renderDebugText' for the score.
--
-- A real game by default: left\/right to move, space to shoot, escape or
-- closing the window to quit. With @--frames N@ (or under @CI@, where the
-- bound defaults to 60) it instead runs N unpaced steps with a seeded
-- RNG and no input — headless with @SDL_VIDEODRIVER=offscreen@ — and
-- probe-asserts the final frame like the @sdl3-raw@ gate.
--
-- This example models the qualified-umbrella import style;
-- @sdl3-raw@ models closed per-family import lists.
module Main (main) where

import Apecs
import Control.Monad (replicateM_, unless, void, when)
import Data.Int (Int32)
import Data.Word (Word64)
import Foreign.C.ConstPtr (ConstPtr (..))
import Foreign.C.String (peekCString, withCString)
import Foreign.C.Types (CInt)
import Foreign.Marshal.Alloc (alloca)
import Foreign.Marshal.Array (allocaArray)
import Foreign.Ptr (Ptr, castPtr, nullPtr)
import Foreign.Storable (peek, pokeElemOff)
import SDL3.Sys qualified as SDL3
import System.Environment (getArgs, lookupEnv)
import System.Exit (exitFailure)
import System.Random (mkStdGen, randomRIO, setStdGen)

-- * A pocket V2

-- The original leans on @linear@'s 'V2'; these few lines are all Shmup
-- actually uses, so the example stays at exactly three deps (apecs,
-- random, sdl3-bindgen-sys).

data V2 = V2 !Float !Float
  deriving stock (Show)

instance Num V2 where
  V2 ax ay + V2 bx by = V2 (ax + bx) (ay + by)
  V2 ax ay - V2 bx by = V2 (ax - bx) (ay - by)
  V2 ax ay * V2 bx by = V2 (ax * bx) (ay * by)
  abs (V2 x y) = V2 (abs x) (abs y)
  signum (V2 x y) = V2 (signum x) (signum y)
  fromInteger n = V2 (fromInteger n) (fromInteger n)

(*^) :: Float -> V2 -> V2
s *^ V2 x y = V2 (s * x) (s * y)

norm :: V2 -> Float
norm (V2 x y) = sqrt (x * x + y * y)

-- * Components and world (upstream, verbatim)

newtype Position = Position V2 deriving stock (Show)
instance Component Position where type Storage Position = Map Position

newtype Velocity = Velocity V2 deriving stock (Show)
instance Component Velocity where type Storage Velocity = Map Velocity

data Target = Target deriving stock (Show)
instance Component Target where type Storage Target = Map Target

data Bullet = Bullet deriving stock (Show)
instance Component Bullet where type Storage Bullet = Map Bullet

newtype Particle = Particle Float deriving stock (Show)
instance Component Particle where type Storage Particle = Map Particle

data Player = Player deriving stock (Show)
instance Component Player where type Storage Player = Unique Player

newtype Score = Score Int
  deriving stock (Show)
  deriving newtype (Num)
instance Semigroup Score where (<>) = (+)
instance Monoid Score where mempty = 0
instance Component Score where type Storage Score = Global Score

newtype Time = Time Float
  deriving stock (Show)
  deriving newtype (Num)
instance Semigroup Time where (<>) = (+)
instance Monoid Time where mempty = 0
instance Component Time where type Storage Time = Global Time

makeWorld
  "World"
  [''Position, ''Velocity, ''Player, ''Target, ''Bullet, ''Score, ''Time, ''Particle]

type System' a = System World a
type Kinetic = (Position, Velocity)

playerSpeed, bulletSpeed, enemySpeed, xmin, xmax :: Float
playerSpeed = 170
bulletSpeed = 500
enemySpeed = 80
xmin = -100
xmax = 100

hitBonus, missPenalty :: Int
hitBonus = 100
missPenalty = 40

playerPos, scorePos :: V2
playerPos = V2 0 (-120)
scorePos = V2 xmin (-170)

-- * Systems (upstream, verbatim)

initialize :: System' ()
initialize = void $ newEntity (Player, Position playerPos, Velocity 0)

stepPosition :: Float -> System' ()
stepPosition dT = cmap \(Position p, Velocity v) -> Position (p + dT *^ v)

clampPlayer :: System' ()
clampPlayer = cmap \(Player, Position (V2 x y)) ->
  Position (V2 (min xmax . max xmin $ x) y)

incrTime :: Float -> System' ()
incrTime dT = modify global \(Time t) -> Time (t + dT)

clearTargets :: System' ()
clearTargets = cmap \t@(Target, Position (V2 x _), Velocity _) ->
  if x < xmin || x > xmax then
    Nothing
  else
    Just t

stepParticles :: Float -> System' ()
stepParticles dT = cmap \(Particle t) ->
  if t < 0 then
    Right $ Not @(Particle, Kinetic)
  else
    Left $ Particle (t - dT)

clearBullets :: System' ()
clearBullets = cmap \(Bullet, Position (V2 _ y), Score s) ->
  if y > 170 then
    Right (Not @(Bullet, Kinetic), Score (s - missPenalty))
  else
    Left ()

handleCollisions :: System' ()
handleCollisions =
  cmapM_ \(Target, Position posT, etyT) ->
    cmapM_ \(Bullet, Position posB, etyB) ->
      when (norm (posT - posB) < 10) do
        destroy etyT (Proxy @(Target, Kinetic))
        destroy etyB (Proxy @(Bullet, Kinetic))
        spawnParticles 15 (Position posB) (-500, 500) (200, -50)
        modify global \(Score x) -> Score (x + hitBonus)

triggerEvery :: Float -> Float -> Float -> System' a -> System' ()
triggerEvery dT period phase sys = do
  Time t <- get global
  let t' = t + phase
      trigger = floor (t' / period) /= (floor ((t' + dT) / period) :: Int)
  when trigger $ void sys

spawnParticles :: Int -> Position -> (Float, Float) -> (Float, Float) -> System' ()
spawnParticles n pos dvx dvy = replicateM_ n do
  vx <- liftIO $ randomRIO dvx
  vy <- liftIO $ randomRIO dvy
  t <- liftIO $ randomRIO (0.02, 0.3)
  void $ newEntity (Particle t, pos, Velocity (V2 vx vy))

step :: Float -> System' ()
step dT = do
  incrTime dT
  stepPosition dT
  clampPlayer
  clearTargets
  clearBullets
  stepParticles dT
  handleCollisions
  triggerEvery dT 0.6 0 $
    newEntity (Target, Position (V2 xmin 80), Velocity (V2 enemySpeed 0))
  triggerEvery dT 0.6 0.3 $
    newEntity (Target, Position (V2 xmax 120), Velocity (V2 (negate enemySpeed) 0))

-- * Input: gloss 'EventKey' equations as SDL key edges

-- | Drain the poll queue, mirroring the upstream @handleEvent@ equation
-- for equation; returns whether quit was requested (escape keydown or
-- @SDL_EVENT_QUIT@). The discriminant is the union's first word; the
-- payload is projected with record-dot after peeking the full event.
drainEvents :: Ptr SDL3.SDL_Event -> System' Bool
drainEvents evPtr = go False
 where
  go quitSeen = do
    pending <- liftIO (SDL3.pollEvent evPtr)
    if not pending then
      pure quitSeen
    else do
      eventType <- liftIO (peek (castPtr evPtr :: Ptr SDL3.SDL_EventType))
      quitNow <- case eventType of
        SDL3.SDL_EVENT_QUIT -> pure True
        SDL3.SDL_EVENT_KEY_DOWN -> keyEdge evPtr True
        SDL3.SDL_EVENT_KEY_UP -> keyEdge evPtr False
        _other -> pure False
      go (quitSeen || quitNow)

keyEdge :: Ptr SDL3.SDL_Event -> Bool -> System' Bool
keyEdge evPtr isDown = do
  ev <- liftIO (peek evPtr)
  let kev = ev.key
  -- SDL synthesizes repeated KEY_DOWNs while a key is held; gloss only
  -- ever delivers edges. Without this guard the +=/-= velocity
  -- arithmetic drifts and space fires like a machine gun. The event's
  -- @repeat@ member is a struct field, so it keeps its C type — bridged
  -- with the curated 'SDL3.toBool'.
  if SDL3.toBool kev.repeat then
    pure False
  else case (kev.scancode, isDown) of
    (SDL3.SDL_SCANCODE_LEFT, True) -> steer (subtract playerSpeed)
    (SDL3.SDL_SCANCODE_LEFT, False) -> steer (+ playerSpeed)
    (SDL3.SDL_SCANCODE_RIGHT, True) -> steer (+ playerSpeed)
    (SDL3.SDL_SCANCODE_RIGHT, False) -> steer (subtract playerSpeed)
    (SDL3.SDL_SCANCODE_SPACE, True) -> do
      cmapM_ \(Player, pos) -> do
        void $ newEntity (Bullet, pos, Velocity (V2 0 bulletSpeed))
        spawnParticles 7 pos (-80, 80) (10, 100)
      pure False
    (SDL3.SDL_SCANCODE_ESCAPE, True) -> pure True
    _other -> pure False
 where
  steer f = do
    cmap \(Player, Velocity (V2 x _)) -> Velocity (V2 (f x) 0)
    pure False

-- * Drawing: gloss pictures as renderer primitives

winW, winH :: Int32
winW = 220
winH = 360

-- | World (center origin, y up — the gloss frame the systems reason in)
-- to screen (top-left origin, y down). Curated draw calls take 'Float'
-- directly; only struct fields ('SDL3.SDL_FPoint' inside a vertex) still
-- want 'CFloat'.
w2s :: V2 -> (Float, Float)
w2s (V2 x y) = (110 + x, 180 - y)

draw :: Ptr SDL3.SDL_Renderer -> System' ()
draw renderer = do
  liftIO do
    okColor <- SDL3.setRenderDrawColor renderer 0 0 0 255
    unless okColor (die "SDL_SetRenderDrawColor")
    okClear <- SDL3.renderClear renderer
    unless okClear (die "SDL_RenderClear")
  -- Player: gloss @scale 10 20 triangle@, white — apex on the position,
  -- base 20 world units below it.
  cmapM_ \(Player, Position pos) ->
    liftIO $ fillConvex renderer (triangleAt pos) (1, 1, 1)
  -- Targets and bullets: gloss @diamond@ at scale 10 (red) and 4 (yellow).
  cmapM_ \(Target, Position pos) ->
    liftIO $ fillConvex renderer (diamondAt 10 pos) (1, 0, 0)
  cmapM_ \(Bullet, Position pos) ->
    liftIO $ fillConvex renderer (diamondAt 4 pos) (1, 1, 0)
  -- Particles: gloss @Line [(0,0),(vx\/10,vy\/10)]@, orange.
  liftIO $ void (SDL3.setRenderDrawColor renderer 255 128 0 255)
  cmapM_ \(Particle _, Velocity (V2 vx vy), Position pos) ->
    liftIO do
      let (sx, sy) = w2s pos
          (ex, ey) = w2s (pos + V2 (vx / 10) (vy / 10))
      void (SDL3.renderLine renderer sx sy ex ey)
  -- Score: gloss white @Text@ at scorePos; SDL's fixed 8px debug font.
  Score s <- get global
  liftIO do
    void (SDL3.setRenderDrawColor renderer 255 255 255 255)
    let (sx, sy) = w2s scorePos
    okText <- withCString ("Score: " <> show s) \text ->
      SDL3.renderDebugText renderer sx sy (ConstPtr text)
    unless okText (die "SDL_RenderDebugText")

triangleAt :: V2 -> [(Float, Float)]
triangleAt pos = map (\d -> w2s (pos + d)) [V2 0 0, V2 (-5) (-20), V2 5 (-20)]

diamondAt :: Float -> V2 -> [(Float, Float)]
diamondAt s pos =
  map (\d -> w2s (pos + d)) [V2 (-s) 0, V2 0 (-s), V2 s 0, V2 0 s]

-- | Fill a convex polygon (3 or 4 points here) through
-- 'SDL3.renderGeometry', fanning indices from vertex 0.
fillConvex :: Ptr SDL3.SDL_Renderer -> [(Float, Float)] -> (Float, Float, Float) -> IO ()
fillConvex renderer points (r, g, b) =
  allocaArray n \vertices -> do
    let vertex (px, py) =
          -- Struct fields keep their C types: the vertex build is where
          -- Float crosses to CFloat (free at -O1+ via base's rules).
          SDL3.SDL_Vertex
            { position = SDL3.SDL_FPoint{x = realToFrac px, y = realToFrac py}
            , color = SDL3.SDL_FColor{r = realToFrac r, g = realToFrac g, b = realToFrac b, a = 1}
            , tex_coord = SDL3.SDL_FPoint{x = 0, y = 0}
            }
    mapM_ (\(i, p) -> pokeElemOff vertices i (vertex p)) (zip [0 ..] points)
    let fan = concat [[0, i, i + 1] | i <- [1 .. fromIntegral n - 2]] :: [CInt]
    allocaArray (length fan) \indices -> do
      mapM_ (uncurry (pokeElemOff indices)) (zip [0 ..] fan)
      ok <-
        SDL3.renderGeometry
          renderer
          nullPtr -- no texture
          (ConstPtr vertices)
          (fromIntegral n)
          (ConstPtr indices)
          (fromIntegral (length fan))
      unless ok (die "SDL_RenderGeometry")
 where
  n = length points

-- * The loop

-- | One fixed simulation step per rendered frame, matching gloss's
-- @play ... 60 ...@ in every mode: pacing (interactive only) never
-- changes what the systems compute.
fixedDT :: Float
fixedDT = 1 / 60

frameNS :: Word64
frameNS = 16_666_667

data Mode
  = -- | Windowed, paced to 60 Hz, runs until escape or window close.
    Interactive
  | -- | @--frames N@ or CI: N unpaced steps, seeded RNG, final-frame probe.
    Bounded Int

gameLoop :: World -> Ptr SDL3.SDL_Renderer -> Mode -> IO ()
gameLoop world renderer mode = alloca @SDL3.SDL_Event \evPtr ->
  case mode of
    Interactive -> paced evPtr
    Bounded n -> bounded evPtr n
 where
  frame evPtr = do
    quitRequested <- runWith world do
      quit' <- drainEvents evPtr
      step fixedDT
      draw renderer
      pure quit'
    _ <- SDL3.renderPresent renderer
    pure quitRequested

  paced evPtr = do
    before <- SDL3.getTicksNS
    quitRequested <- frame evPtr
    after <- SDL3.getTicksNS
    let elapsed = after - before
    when (elapsed < frameNS) (SDL3.delayNSSafe (frameNS - elapsed))
    unless quitRequested (paced evPtr)

  bounded _ 0 = pure ()
  bounded evPtr n = do
    quitRequested <- frame evPtr
    unless quitRequested (bounded evPtr (n - 1))

main :: IO ()
main = do
  mode <- resolveMode
  case mode of
    Bounded n -> do
      -- Reproducible smoke runs: with no input the simulation is already
      -- deterministic (nothing ever collides), the seed pins it even so.
      setStdGen (mkStdGen 1117)
      putStrLn ("shmup: bounded run, " <> show n <> " frames")
    Interactive ->
      putStrLn "shmup: left/right move, space shoots, escape quits"

  ok <- SDL3.init SDL3.SDL_INIT_VIDEO
  unless ok (die "SDL_Init")

  window <- withCString "Shmup" \title ->
    SDL3.createWindow (ConstPtr title) winW winH 0
  when (window == nullPtr) (die "SDL_CreateWindow")

  -- NULL asks SDL for the best renderer for this window; fall back to
  -- the software renderer if none binds (offscreen driver included).
  renderer <- do
    preferred <- SDL3.createRenderer window (ConstPtr nullPtr)
    if preferred /= nullPtr then
      pure preferred
    else do
      software <- withCString "software" (SDL3.createRenderer window . ConstPtr)
      when (software == nullPtr) (die "SDL_CreateRenderer")
      pure software

  world <- initWorld
  runWith world initialize
  gameLoop world renderer mode

  Score finalScore <- runWith world (get global)
  putStrLn ("shmup: final score " <> show finalScore)

  case mode of
    Bounded _ -> do
      -- Probe the final frame before presenting it (present leaves the
      -- backbuffer undefined), sdl3-raw style: the player never moves
      -- without input, so its triangle interior must be lit and a corner
      -- must still be the clear color.
      runWith world (draw renderer)
      probeScene renderer
      _ <- SDL3.renderPresent renderer
      pure ()
    Interactive -> pure ()

  SDL3.destroyRenderer renderer
  SDL3.destroyWindow window
  SDL3.quit
  putStrLn "shmup: OK"

-- | @--frames N@ wins; otherwise a set (non-false) @CI@ bounds the run
-- at 60 frames; otherwise it is a game.
resolveMode :: IO Mode
resolveMode =
  getArgs >>= \case
    ["--frames", n] | Just parsed <- readMaybe n -> pure (Bounded parsed)
    _noFlag -> do
      ci <- lookupEnv "CI"
      pure case ci of
        Just value | value /= "", value /= "false" -> Bounded 60
        _unset -> Interactive
 where
  readMaybe s = case reads s of
    [(v, "")] -> Just v
    _ -> Nothing

probeScene :: Ptr SDL3.SDL_Renderer -> IO ()
probeScene renderer = do
  surface <- SDL3.renderReadPixels renderer (ConstPtr nullPtr)
  when (surface == nullPtr) (die "SDL_RenderReadPixels")
  inside <- probePixel surface 110 310
  corner <- probePixel surface 5 5
  putStrLn ("shmup: probe inside=" <> show inside <> " corner=" <> show corner)
  let lum (pr, pg, pb) = pr + pg + pb
  unless (lum inside >= 60) (die "probe: player triangle is not lit")
  unless (lum corner <= 24) (die "probe: background is not the clear color")
  _ <- SDL3.destroySurface surface
  putStrLn "shmup: all probes passed"

probePixel :: Ptr SDL3.SDL_Surface -> Int32 -> Int32 -> IO (Int, Int, Int)
probePixel surface px py =
  alloca \pr -> alloca \pg -> alloca \pb -> alloca \pa -> do
    ok <- SDL3.readSurfacePixel surface px py pr pg pb pa
    unless ok (die "SDL_ReadSurfacePixel")
    red <- fromIntegral <$> peek @SDL3.Uint8 pr
    green <- fromIntegral <$> peek @SDL3.Uint8 pg
    blue <- fromIntegral <$> peek @SDL3.Uint8 pb
    pure (red, green, blue)

die :: String -> IO a
die what = do
  err <- SDL3.getError
  msg <- peekCString (unConstPtr err)
  putStrLn ("shmup: " <> what <> " failed: " <> msg)
  exitFailure
