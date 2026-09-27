-- | Headless playback through the curated @Mpv.Sys@ layer: 'Mpv.create' a
-- player, switch off video, audio, and terminal output
-- ('Mpv.setOptionString'), load a one-second 64x64 lavfi test clip
-- ('Mpv.commandString'), and drain events with 'Mpv.waitEventSafe' until
-- the clip ends. Along the way it asserts that the baked
-- @MPV_CLIENT_API_VERSION@ macro (an @MPV_MAKE_VERSION@ expansion ending
-- in @| 0UL@, evaluated through the c-expr runtime) is at least client API
-- 2.0, that the loaded video is 64 pixels wide ('Mpv.getPropertyString'),
-- and that the end-file payload behind the event's untyped @data'@ pointer
-- reports EOF. The idioms are the package README's quick start:
-- 'ConstPtr'-wrapped 'withCString' arguments, @peek event.event_id@
-- through the generated field instances, and the @Safe@ flavor where the
-- registry recommends it ('Mpv.initializeSafe', 'Mpv.waitEventSafe',
-- 'Mpv.terminateDestroySafe'); no Haskell callback is registered, so the
-- unsuffixed unsafe aliases serve the rest. Exits non-zero on any failed
-- assertion or after a 15-second deadline — the mpv-bindgen-sys usability
-- gate.
module Main (main) where

import Control.Exception (finally)
import Control.Monad (unless, when)
import Data.Bits (shiftR, (.&.))
import Data.Int (Int32, Int64)
import Foreign.C.ConstPtr (ConstPtr (..))
import Foreign.C.String (peekCString, withCString)
import Foreign.C.Types (CInt, CULong)
import Foreign.Ptr (Ptr, castPtr, nullPtr)
import Foreign.Storable (peek)
import Mpv.Sys.Client qualified as Mpv
import System.Exit (die)
import System.IO (hPutStr, stderr)

main :: IO ()
main = do
  -- MPV_MAKE_VERSION(2, 5) baked at generation time, at the C type its
  -- expansion names (unsigned long, from the 0UL).
  let baked = Mpv.mPV_CLIENT_API_VERSION
  unless (baked >= Mpv.mPV_MAKE_VERSION (2 :: CInt) (0 :: CInt)) $
    die ("mpv-headless: baked MPV_CLIENT_API_VERSION " <> showApi baked <> " is below 2.0")

  mpv <- Mpv.create
  when (mpv == nullPtr) (die "mpv-headless: mpv_create returned NULL")
  summary <- play mpv `finally` Mpv.terminateDestroySafe mpv
  putStrLn ("mpv-headless: OK: bindings from client API " <> showApi baked <> ", " <> summary)

-- | One second of lavfi's @testsrc@ at 64x64: no media file needed.
clip :: String
clip = "av://lavfi:testsrc=duration=1:size=64x64:rate=30"

-- | Configure, start, and play the clip to its end; the summary of what
-- was asserted.
play :: Ptr Mpv.Mpv_handle -> IO String
play mpv = do
  setOption "vo" "null"
  setOption "ao" "null"
  setOption "terminal" "no"
  check "mpv_initialize" =<< Mpv.initializeSafe mpv
  -- Surface libmpv's own error lines, if any, next to a failure.
  check "mpv_request_log_messages"
    =<< withCString "error" (Mpv.requestLogMessages mpv . ConstPtr)
  player <- property mpv "mpv-version"
  check "loadfile" =<< withCString ("loadfile " <> clip) \cmd ->
    Mpv.commandString mpv (ConstPtr cmd)
  start <- Mpv.getTimeNs mpv
  (width, events) <- awaitEndFile mpv (start + 15 * 1000 * 1000 * 1000)
  pure (player <> ", width " <> width <> ", end-file EOF after " <> show events <> " events")
 where
  setOption name value =
    check ("option " <> name <> "=" <> value) =<< withCString name \n -> withCString value \v ->
      Mpv.setOptionString mpv (ConstPtr n) (ConstPtr v)

-- | Drain events until the clip ends, at most half a second per wait,
-- under an overall deadline on libmpv's own monotonic clock.
awaitEndFile :: Ptr Mpv.Mpv_handle -> Int64 -> IO (String, Int)
awaitEndFile mpv deadline = go Nothing 1
 where
  go width seen = do
    now <- Mpv.getTimeNs mpv
    when (now > deadline) (die "mpv-headless: timed out before the clip ended")
    event <- Mpv.waitEventSafe mpv 0.5
    eventId <- peek event.event_id
    case eventId of
      Mpv.MPV_EVENT_FILE_LOADED -> do
        loaded <- property mpv "width"
        unless (loaded == "64") (die ("mpv-headless: width is " <> loaded <> ", expected 64"))
        go (Just loaded) (seen + 1)
      Mpv.MPV_EVENT_END_FILE -> do
        -- The payload hides behind the untyped data' pointer; for this
        -- event it is an mpv_event_end_file.
        payload <- peek event.data'
        let endFile = castPtr payload :: Ptr Mpv.Mpv_event_end_file
        err <- peek endFile.error
        unless (err == 0) do
          msg <- errorText (fromIntegral err)
          die ("mpv-headless: playback failed: " <> msg)
        reason <- peek endFile.reason
        unless (reason == Mpv.MPV_END_FILE_REASON_EOF) $
          die ("mpv-headless: end-file reason " <> show reason <> ", expected EOF")
        case width of
          Nothing -> die "mpv-headless: the clip ended without MPV_EVENT_FILE_LOADED"
          Just loaded -> pure (loaded, seen)
      Mpv.MPV_EVENT_LOG_MESSAGE -> do
        relayLog event
        go width (seen + 1)
      Mpv.MPV_EVENT_SHUTDOWN -> die "mpv-headless: the player shut down"
      _ -> go width (seen + 1)

-- | A string property, copied out and freed ('Mpv.free' is libmpv's own
-- deallocator, which property strings require).
property :: Ptr Mpv.Mpv_handle -> String -> IO String
property mpv name = do
  value <- withCString name (Mpv.getPropertyString mpv . ConstPtr)
  when (value == nullPtr) (die ("mpv-headless: property " <> name <> " is unavailable"))
  peekCString value <* Mpv.free (castPtr value)

-- | Relay one log line (requested at level error, so a clean run has
-- none).
relayLog :: Ptr Mpv.Mpv_event -> IO ()
relayLog event = do
  payload <- peek event.data'
  let message = castPtr payload :: Ptr Mpv.Mpv_event_log_message
  prefix <- peekCString . unConstPtr =<< peek message.prefix
  text <- peekCString . unConstPtr =<< peek message.text
  hPutStr stderr ("mpv-headless: [" <> prefix <> "] " <> text)

-- | Fail with libmpv's description unless the status is a success.
check :: String -> Int32 -> IO ()
check what rc = unless (rc >= 0) do
  msg <- errorText rc
  die ("mpv-headless: " <> what <> " failed: " <> msg)

errorText :: Int32 -> IO String
errorText rc = peekCString . unConstPtr =<< Mpv.errorString rc

-- | MAJOR.MINOR of a client API version (16 bits each).
showApi :: CULong -> String
showApi v = show (v `shiftR` 16) <> "." <> show (v .&. 0xffff)
