{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}

module Data.Hash.RapidHash.Types (
  -- * Seeds
  RapidSeed (..),
  defaultSeed,

  -- * Hashes
  RapidHash (..),
  pattern RAPIDHASH_V3_PREFIX,
  pattern RAPIDHASH_V3_HEX_LENGTH,

  -- ** Serializing
  rapidHashTextBuilder,
  showRapidHashText,
  showRapidHashBS,
  showsRapidHash,

  -- ** Deserializing
  parseRapidHashText,
  parseRapidHashBS,
  readsRapidHash,
) where

import Control.Monad (when)
import Control.Monad.ST.Strict (ST)
import Data.Binary (Binary)
import Data.Binary qualified as Binary
import Data.Bits (Bits (shiftR, (.&.)))
import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Data.ByteString.Char8 qualified as BSC8
import Data.ByteString.Lex.Integral qualified as BS
import Data.Char (isSpace)
import Data.Foldable (for_, length)
import Data.Hashable (Hashable)
import Data.List qualified as L
import Data.Maybe (maybe)
import Data.String (IsString)
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.Array qualified as A
import Data.Text.Builder.Linear qualified as TB
import Data.Text.Builder.Linear.Buffer qualified as TBuff
import Data.Text.Builder.Linear.Core qualified as TB
import Data.Text.Read qualified as T
import Data.Word (Word64)
import GHC.Exts (Int (I#), (>#))
import GHC.Generics (Generic)
import Prelude (
  Applicative (pure),
  Either (Left, Right),
  Eq ((==)),
  MonadFail (fail),
  Num ((*), (+), (-)),
  Ord,
  Read (readsPrec),
  ReadS,
  Semigroup ((<>)),
  Show (show, showsPrec),
  ShowS,
  String,
  fromIntegral,
  otherwise,
  showString,
  ($),
  (.),
  (<$>),
  (||),
 )

-- $setup
-- >>> :set -XOverloadedStrings
-- >>> import Data.Text qualified as T

-- | Minimal wrapper around a rapidhash seed.
newtype RapidSeed = RapidSeed Word64
  deriving stock (Generic, Read, Show)
  deriving newtype (Eq, Num, Ord)

-- | rapidhash's default seed is 0 in the reference implementation
defaultSeed :: RapidSeed
defaultSeed = RapidSeed 0

-- | A rapidhash v3 digest.
--
-- The textual form is @rhv3:@ followed by exactly 16 hex digits, always
-- rendered lowercase. Parsing accepts either case (normalizing on
-- re-render), but rejects any other prefix, length, or stray characters.
-- The version tag makes stored digests self-describing: a future
-- rapidhash version bump (which changes outputs) can never be mistaken
-- for a v3 digest.
--
-- === __Examples__
-- >>> RapidHash 0xabc
-- rhv3:0000000000000abc
--
-- >>> Prelude.read "rhv3:0000000000000abc" :: RapidHash
-- rhv3:0000000000000abc
newtype RapidHash = RapidHash Word64
  deriving stock (Generic)
  deriving newtype (Eq, Hashable, Ord)

-- |
-- The prefix used during serialization and deserialization. This is not a universal
-- convention, but an identifier that should help prevent confusing these hashes
-- with others.
--
-- Exported for convenience.
pattern RAPIDHASH_V3_PREFIX :: (IsString a, Eq a) => a
pattern RAPIDHASH_V3_PREFIX = "rhv3:"

-- | The length of the hash part of a valid rapidhash.
--
-- Exported for convenience.
--
-- === __Total length__
--
-- >>> RAPIDHASH_V3_HEX_LENGTH + length (RAPIDHASH_V3_PREFIX :: String)
-- 21
pattern RAPIDHASH_V3_HEX_LENGTH :: (Num a, Eq a) => a
pattern RAPIDHASH_V3_HEX_LENGTH = 16

pattern ZERO_CHAR :: (Num a, Eq a) => a
pattern ZERO_CHAR = 0x30

prefixLen :: Int
prefixLen = length (RAPIDHASH_V3_PREFIX :: String)

instance Show RapidHash where
  showsPrec _ = showsRapidHash

-- |
--
-- === __Examples__
--
-- >>> Prelude.read (show (Prelude.Just (RapidHash 0x1234))) :: Prelude.Maybe RapidHash
-- Just rhv3:0000000000001234
instance Read RapidHash where
  readsPrec _ = readsRapidHash

-- |
-- Efficient binary serialization and deserialization, with a just-good-enough tag.
--
-- Encodes in 9 bytes: One byte for the tag, 8 for the 'Word64'.
instance Binary RapidHash where
  put (RapidHash h) = do
    Binary.putWord8 3
    Binary.put h
  {-# INLINE put #-}
  get = do
    tag <- Binary.getWord8
    case tag of
      3 -> RapidHash <$> Binary.get
      _ -> fail "did not find magic tag for rapidhash"
  {-# INLINE get #-}

----------------------------------------------------------------------------------------------------
-- Serializing
----------------------------------------------------------------------------------------------------

-- |
-- Efficiently render a 'RapidHash' as a 'TB.Builder'
--
-- === __Examples__
--
-- >>> rapidHashTextBuilder (RapidHash 0x0)
-- "rhv3:0000000000000000"
--
-- >>> rapidHashTextBuilder (RapidHash 0xabcd3)
-- "rhv3:00000000000abcd3"
--
-- >>> rapidHashTextBuilder (RapidHash 0xfffff2381)
-- "rhv3:0000000fffff2381"
--
-- === __Prefixing__
--
-- >>> RAPIDHASH_V3_PREFIX `T.isPrefixOf` showRapidHashText (RapidHash 0x0)
-- True
rapidHashTextBuilder :: RapidHash -> TB.Builder
rapidHashTextBuilder h = TB.Builder \b -> appendPaddedHashHexBuf (b TBuff.|># "rhv3:"#) h
{-# INLINEABLE rapidHashTextBuilder #-}

-- |
-- Efficiently render a 'RapidHash' as 'Text'.
--
-- Prefer 'rapidHashTextBuilder' when composing.
showRapidHashText :: RapidHash -> Text
showRapidHashText = TB.runBuilder . rapidHashTextBuilder
{-# INLINEABLE showRapidHashText #-}

-- |
-- Efficiently render a 'RapidHash' as 'ByteString'. If your text blob is utf-8, it may be worth
-- composing using 'TB.Builder' and extracting with 'TB.runBuilderBS' yourself.
--
-- The resulting 'ByteString' is utf-8 encoded, using 'TB.runBuilderBS'
--
-- See 'rapidHashTextBuilder'
showRapidHashBS :: RapidHash -> ByteString
showRapidHashBS = TB.runBuilderBS . rapidHashTextBuilder
{-# INLINEABLE showRapidHashBS #-}

-- |
-- Somewhat inefficiently render a 'RapidHash' as a 'String'.
--
-- Present for debugging purposes. Goes through 'rapidHashTextBuilder'
showsRapidHash :: RapidHash -> ShowS
showsRapidHash h = showString $ T.unpack (showRapidHashText h)

-- |
-- This is a specialized reimplementation of 'TBuff.|>&' from Andrew Lelechenko's
-- text-builder-linear that additionally pads with zeros.
appendPaddedHashHexBuf :: TBuff.Buffer %1 -> RapidHash -> TBuff.Buffer
appendPaddedHashHexBuf buffer (RapidHash h) =
  -- appendBounded function preallocates a given length, and takes a callback that
  -- mutates the array and returns how many characters it wrote.
  TB.appendBounded
    RAPIDHASH_V3_HEX_LENGTH
    ( \dst off -> do
        endOff <- unsafeAppendHexW64 dst (off + RAPIDHASH_V3_HEX_LENGTH - 1) h

        -- Core lowering here is consistently fused, but if there's a regression I'd
        -- look here first.
        for_ @[] [off .. endOff] \i ->
          A.unsafeWrite dst i ZERO_CHAR

        pure RAPIDHASH_V3_HEX_LENGTH
    )
    buffer
{-# INLINEABLE appendPaddedHashHexBuf #-}

unsafeAppendHexW64 :: A.MArray s -> Int -> Word64 -> ST s Int
unsafeAppendHexW64 marr = go
 where
  go !off = \case
    0 -> pure off
    m -> do
      let nibble = m .&. 0x0F
      A.unsafeWrite marr off $ hex (fromIntegral nibble)
      unsafeAppendHexW64 marr (off - 1) (m `shiftR` 4)

  -- Vendored from text-builder-linear - branchless conversion
  hex n@(I# n#) = fromIntegral $ ZERO_CHAR + n + I# (n# ># 9#) * (0x60 - 0x39)
{-# INLINEABLE unsafeAppendHexW64 #-}

----------------------------------------------------------------------------------------------------
-- Deserializing
----------------------------------------------------------------------------------------------------

-- |
-- Efficiently parse a 'RapidHash' from a 'Text'.
--
-- == __Examples__
--
-- >>> parseRapidHashText "rhv3:deadbeefdeadbeef"
-- Right rhv3:deadbeefdeadbeef
--
-- >>> parseRapidHashText "rhv3:abracadabratoomany"
-- Left "rapidhash hashes should have a length of exactly 16, but found length 18"
--
-- >>> parseRapidHashText "rhv3:nothexnothexnoth"
-- Left "input does not start with a hexadecimal digit"
--
-- >>> parseRapidHashText "rhv3:tooshort"
-- Left "rapidhash hashes should have a length of exactly 16, but found length 8"
--
-- >>> parseRapidHashText "noprefix"
-- Left "missing required prefix \"rhv3:\": \"noprefix\""
--
-- >>> parseRapidHashText "rhv3:abcdefabcdefabcg"
-- Left "leftovers after parsing hash: \"g\""
--
-- >>> parseRapidHashText "rhv3:0xadbeefdeadbeef"
-- Left "input does not start with a hexadecimal digit"
parseRapidHashText :: Text -> Either String RapidHash
parseRapidHashText t = do
  mhash <- guardPrefix (T.splitAt prefixLen t)
  guardLength (T.length mhash)
  -- T.hexadecimal helpfully strips 0x/0X, which is not so helpful for our purposes
  let pre = T.take 2 mhash
  when (pre == "0x" || pre == "0X") $ Left "input does not start with a hexadecimal digit"
  (hash, rest) <- T.hexadecimal mhash
  guardLeftovers rest
  pure $ RapidHash hash
{-# INLINEABLE parseRapidHashText #-}

-- |
-- Efficiently parse a 'RapidHash' from a 'ByteString'.
--
-- == __Examples__
--
-- >>> parseRapidHashBS "rhv3:deadbeefdeadbeef"
-- Right rhv3:deadbeefdeadbeef
--
-- >>> parseRapidHashBS "rhv3:abracadabratoomany"
-- Left "rapidhash hashes should have a length of exactly 16, but found length 18"
--
-- >>> parseRapidHashBS "rhv3:nothexnothexnoth"
-- Left "Could not parse hexadecimal from \"nothexnothexnoth\""
--
-- >>> parseRapidHashBS "rhv3:tooshort"
-- Left "rapidhash hashes should have a length of exactly 16, but found length 8"
--
-- >>> parseRapidHashBS "noprefix"
-- Left "missing required prefix \"rhv3:\": \"noprefix\""
--
-- >>> parseRapidHashBS "rhv3:abcdefabcdefabcg"
-- Left "leftovers after parsing hash: \"g\""
--
-- >>> parseRapidHashBS "rhv3:0xadbeefdeadbeef"
-- Left "leftovers after parsing hash: \"xadbeefdeadbeef\""
parseRapidHashBS :: ByteString -> Either String RapidHash
parseRapidHashBS b = do
  mhash <- guardPrefix (BS.splitAt prefixLen b)
  guardLength (BS.length mhash)
  (hash, rest) <- maybe (badHex mhash) Right (BS.readHexadecimal mhash)
  guardLeftovers rest
  pure $ RapidHash hash
 where
  badHex mhash = Left $ "Could not parse hexadecimal from \"" <> BSC8.unpack mhash <> "\""
{-# INLINEABLE parseRapidHashBS #-}

-- |
-- Somewhat inefficiently parse a 'RapidHash' from a 'String'.
--
-- Present for debugging purposes. Goes through 'parseRapidHashText'. Unlike the other
-- parse functions, this allows trailing characters.
--
-- === __Examples__
-- >>> readsRapidHash "rhv3:0000000000000abcdagk"
-- [(rhv3:0000000000000abc,"dagk")]
readsRapidHash :: ReadS RapidHash
readsRapidHash s =
  let (this, rest) = L.splitAt (prefixLen + RAPIDHASH_V3_HEX_LENGTH) (L.dropWhile isSpace s)
   in case parseRapidHashText (T.pack this) of
        Right parsed -> [(parsed, rest)]
        Left _ -> []

guardPrefix :: (IsString a, Show a, Semigroup a, Eq a) => (a, a) -> Either String a
guardPrefix = \case
  (RAPIDHASH_V3_PREFIX, mhash) -> Right mhash
  (pre, post) -> Left $ "missing required prefix \"" <> RAPIDHASH_V3_PREFIX <> "\": " <> show (pre <> post)

guardLength :: (Show a, Eq a, Num a) => a -> Either String ()
guardLength len
  | len == RAPIDHASH_V3_HEX_LENGTH = Right ()
  | otherwise = Left badLength
 where
  badLength =
    "rapidhash hashes should have a length of exactly "
      <> show @Int RAPIDHASH_V3_HEX_LENGTH
      <> ", but found length "
      <> show len

guardLeftovers :: (Show a, Eq a, IsString a) => a -> Either String ()
guardLeftovers = \case
  "" -> Right ()
  bad ->
    Left $
      "leftovers after parsing hash: "
        <> show bad
