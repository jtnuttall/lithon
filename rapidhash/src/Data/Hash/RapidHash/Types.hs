{-# LANGUAGE CPP #-}
{-# LANGUAGE LinearTypes #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}

module Data.Hash.RapidHash.Types (
  -- * Shared
  RapidSeed (..),
  defaultSeed,
  pattern RAPIDHASH_V3_HEX_LENGTH,

  -- * rapidhash
  RapidHash (..),
  pattern RAPIDHASH_V3_PREFIX,

  -- ** Serializing
  rapidHashTextBuilder,
  showRapidHashText,
  showRapidHashBS,
  showsRapidHash,

  -- ** Deserializing
  parseRapidHashText,
  parseRapidHashBS,
  readsRapidHash,

  -- * rapidhashMicro
  RapidHashMicro (..),
  pattern RAPIDHASH_MICRO_V3_PREFIX,

  -- ** Serializing
  rapidhashMicroTextBuilder,
  showRapidHashMicroText,
  showRapidHashMicroBS,
  showsRapidHashMicro,

  -- ** Deserializing
  parseRapidHashMicroText,
  parseRapidHashMicroBS,
  readsRapidHashMicro,
) where

import Control.DeepSeq (NFData)
import Control.Monad (when)
import Control.Monad.ST.Strict (ST)
import Data.Bifunctor (first)
import Data.Binary (Binary)
import Data.Binary qualified as Binary
import Data.Bits (Bits (shiftR, (.&.)))
import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Data.ByteString.Char8 qualified as BSC8
import Data.ByteString.Lex.Integral qualified as BS
import Data.Char (isSpace)
import Data.Foldable (for_)
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
import Data.Word (Word64, Word8)
import GHC.Exts (Addr#, Int (I#), (>#))
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
  map,
  otherwise,
  showString,
  ($),
  (<$>),
  (||),
 )

-- $setup
-- >>> :set -XOverloadedStrings
-- >>> import Data.Text qualified as T

-- | Minimal wrapper around a rapidhash seed.
newtype RapidSeed = RapidSeed Word64
  deriving stock (Generic, Read, Show)
  deriving newtype (Eq, NFData, Num, Ord)

-- | rapidhash's default seed is 0 in the reference implementation
defaultSeed :: RapidSeed
defaultSeed = RapidSeed 0

-- | The length of the hash part of a valid rapidhash.
--
-- Exported for convenience.
--
-- === __Total length__
--
-- >>> RAPIDHASH_V3_HEX_LENGTH + length (RAPIDHASH_V3_PREFIX :: String)
-- 21
--
-- >>> RAPIDHASH_V3_HEX_LENGTH + length (RAPIDHASH_MICRO_V3_PREFIX :: String)
-- 22
pattern RAPIDHASH_V3_HEX_LENGTH :: (Num a, Eq a) => a
pattern RAPIDHASH_V3_HEX_LENGTH = 16

pattern ZERO_CHAR :: (Num a, Eq a) => a
pattern ZERO_CHAR = 0x30

----------------------------------------------------------------------------------------------------
-- rapidhash
----------------------------------------------------------------------------------------------------

-- | A rapidhash v3 digest.
--
-- The textual form is @rhv3:@ followed by exactly 16 hex digits, always
-- rendered lowercase. Parsing accepts either case, but rejects any other prefix,
-- length, or stray characters.
--
-- === __Examples__
-- >>> RapidHash 0xabc
-- rhv3:0000000000000abc
--
-- >>> Prelude.read "rhv3:0000000000000abc" :: RapidHash
-- rhv3:0000000000000abc
newtype RapidHash = RapidHash Word64
  deriving stock (Generic)
  deriving newtype (Eq, Hashable, NFData, Ord)

-- |
-- The prefix used during serialization and deserialization. This is not a universal
-- convention, but an identifier that should help prevent confusing these hashes
-- with others.
--
-- Exported for convenience.
pattern RAPIDHASH_V3_PREFIX :: (IsString a, Eq a) => a
pattern RAPIDHASH_V3_PREFIX = "rhv3:"
#define RAPIDHASH_V3_PREFIX_ADDR "rhv3:"#

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

pattern RAPIDHASH_V3_MAGIC_TAG :: Word8
pattern RAPIDHASH_V3_MAGIC_TAG = 3

-- |
-- Efficient binary serialization and deserialization, with a just-good-enough tag.
--
-- Encodes in 9 bytes: One byte for the tag, 8 for the 'Word64'.
instance Binary RapidHash where
  put (RapidHash h) = do
    Binary.putWord8 RAPIDHASH_V3_MAGIC_TAG
    Binary.put h
  {-# INLINE put #-}
  get = do
    tag <- Binary.getWord8
    case tag of
      RAPIDHASH_V3_MAGIC_TAG -> RapidHash <$> Binary.get
      _ -> fail $ "did not find magic tag (" <> show RAPIDHASH_V3_MAGIC_TAG <> ") for rapidhash"
  {-# INLINE get #-}

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
rapidHashTextBuilder (RapidHash h) = hashTextBuilder RAPIDHASH_V3_PREFIX_ADDR h
{-# INLINE rapidHashTextBuilder #-}

-- |
-- Efficiently render a 'RapidHash' as 'Text'.
--
-- Prefer 'rapidHashTextBuilder' when composing.
showRapidHashText :: RapidHash -> Text
showRapidHashText (RapidHash h) = showHashText RAPIDHASH_V3_PREFIX_ADDR h
{-# INLINE showRapidHashText #-}

-- |
-- Efficiently render a 'RapidHash' as 'ByteString'. If your text blob is utf-8, it may be worth
-- composing using 'TB.Builder' and extracting with 'TB.runBuilderBS' yourself.
--
-- The resulting 'ByteString' is utf-8 encoded, using 'TB.runBuilderBS'
--
-- See 'rapidHashTextBuilder'
showRapidHashBS :: RapidHash -> ByteString
showRapidHashBS (RapidHash h) = showHashBS RAPIDHASH_V3_PREFIX_ADDR h
{-# INLINE showRapidHashBS #-}

-- |
-- Somewhat inefficiently render a 'RapidHash' as a 'String'.
--
-- Present for debugging purposes. Goes through 'rapidHashTextBuilder'
showsRapidHash :: RapidHash -> ShowS
showsRapidHash (RapidHash h) = showsHash RAPIDHASH_V3_PREFIX_ADDR h

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
parseRapidHashText t = RapidHash <$> parseHashText RAPIDHASH_V3_PREFIX t
{-# INLINE parseRapidHashText #-}

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
parseRapidHashBS b = RapidHash <$> parseHashBS RAPIDHASH_V3_PREFIX b
{-# INLINE parseRapidHashBS #-}

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
readsRapidHash s = map (first RapidHash) $ readsHash RAPIDHASH_V3_PREFIX s

----------------------------------------------------------------------------------------------------
-- rapidhashmicro
----------------------------------------------------------------------------------------------------

-- | A rapidhashMicro v3 digest.
--
-- rapidhashMicro is designed for speed on known-small keys. Results are identical to
-- 'RapidHash' for inputs of 80 bytes or fewer; from 81 bytes on they diverge, and
-- quality degrades.
--
-- The textual form is @rhmv3:@ followed by exactly 16 hex digits, always
-- rendered lowercase. Parsing accepts either case, but rejects any other prefix,
-- length, or stray characters.
--
-- === __Examples__
-- >>> RapidHashMicro 0xabc
-- rhmv3:0000000000000abc
--
-- >>> Prelude.read "rhmv3:0000000000000abc" :: RapidHashMicro
-- rhmv3:0000000000000abc
newtype RapidHashMicro = RapidHashMicro Word64
  deriving stock (Generic)
  deriving newtype (Eq, Hashable, NFData, Ord)

-- |
-- The prefix used during serialization and deserialization. This is not a universal
-- convention, but an identifier that should help prevent confusing these hashes
-- with others.
--
-- Exported for convenience.
pattern RAPIDHASH_MICRO_V3_PREFIX :: (IsString a, Eq a) => a
pattern RAPIDHASH_MICRO_V3_PREFIX = "rhmv3:"
#define RAPIDHASH_MICRO_V3_PREFIX_ADDR "rhmv3:"#

instance Show RapidHashMicro where
  showsPrec _ = showsRapidHashMicro

-- |
--
-- === __Examples__
--
-- >>> Prelude.read (show (Prelude.Just (RapidHashMicro 0x1234))) :: Prelude.Maybe RapidHashMicro
-- Just rhmv3:0000000000001234
instance Read RapidHashMicro where
  readsPrec _ = readsRapidHashMicro

pattern RAPIDHASH_MICRO_V3_MAGIC_TAG :: Word8
pattern RAPIDHASH_MICRO_V3_MAGIC_TAG = 31

-- |
-- Efficient binary serialization and deserialization, with a just-good-enough tag.
--
-- Encodes in 9 bytes: One byte for the tag, 8 for the 'Word64'.
instance Binary RapidHashMicro where
  put (RapidHashMicro h) = do
    Binary.putWord8 RAPIDHASH_MICRO_V3_MAGIC_TAG
    Binary.put h
  {-# INLINE put #-}
  get = do
    tag <- Binary.getWord8
    case tag of
      RAPIDHASH_MICRO_V3_MAGIC_TAG -> RapidHashMicro <$> Binary.get
      _ -> fail $ "did not find magic tag (" <> show RAPIDHASH_MICRO_V3_MAGIC_TAG <> ") for rapidhashMicro"
  {-# INLINE get #-}

-- |
-- Efficiently render a 'RapidHashMicro' as a 'TB.Builder'
--
-- === __Examples__
--
-- >>> rapidhashMicroTextBuilder (RapidHashMicro 0x0)
-- "rhmv3:0000000000000000"
--
-- >>> rapidhashMicroTextBuilder (RapidHashMicro 0xabcd3)
-- "rhmv3:00000000000abcd3"
--
-- >>> rapidhashMicroTextBuilder (RapidHashMicro 0xfffff2381)
-- "rhmv3:0000000fffff2381"
--
-- === __Prefixing__
--
-- >>> RAPIDHASH_MICRO_V3_PREFIX `T.isPrefixOf` showRapidHashMicroText (RapidHashMicro 0x0)
-- True
rapidhashMicroTextBuilder :: RapidHashMicro -> TB.Builder
rapidhashMicroTextBuilder (RapidHashMicro h) = hashTextBuilder RAPIDHASH_MICRO_V3_PREFIX_ADDR h
{-# INLINE rapidhashMicroTextBuilder #-}

-- |
-- Efficiently render a 'RapidHashMicro' as 'Text'.
--
-- Prefer 'rapidhashMicroTextBuilder' when composing.
showRapidHashMicroText :: RapidHashMicro -> Text
showRapidHashMicroText (RapidHashMicro h) = showHashText RAPIDHASH_MICRO_V3_PREFIX_ADDR h
{-# INLINE showRapidHashMicroText #-}

-- |
-- Efficiently render a 'RapidHashMicro' as 'ByteString'. If your text blob is utf-8, it may be worth
-- composing using 'TB.Builder' and extracting with 'TB.runBuilderBS' yourself.
--
-- The resulting 'ByteString' is utf-8 encoded, using 'TB.runBuilderBS'
--
-- See 'rapidhashMicroTextBuilder'
showRapidHashMicroBS :: RapidHashMicro -> ByteString
showRapidHashMicroBS (RapidHashMicro h) = showHashBS RAPIDHASH_MICRO_V3_PREFIX_ADDR h
{-# INLINE showRapidHashMicroBS #-}

-- |
-- Somewhat inefficiently render a 'RapidHashMicro' as a 'String'.
--
-- Present for debugging purposes. Goes through 'rapidhashMicroTextBuilder'
showsRapidHashMicro :: RapidHashMicro -> ShowS
showsRapidHashMicro (RapidHashMicro h) = showsHash RAPIDHASH_MICRO_V3_PREFIX_ADDR h

-- |
-- Efficiently parse a 'RapidHashMicro' from a 'Text'.
--
-- == __Examples__
--
-- >>> parseRapidHashMicroText "rhmv3:deadbeefdeadbeef"
-- Right rhmv3:deadbeefdeadbeef
--
-- >>> parseRapidHashMicroText "rhmv3:abracadabratoomany"
-- Left "rapidhash hashes should have a length of exactly 16, but found length 18"
--
-- >>> parseRapidHashMicroText "rhmv3:nothexnothexnoth"
-- Left "input does not start with a hexadecimal digit"
--
-- >>> parseRapidHashMicroText "rhmv3:tooshort"
-- Left "rapidhash hashes should have a length of exactly 16, but found length 8"
--
-- >>> parseRapidHashMicroText "noprefix"
-- Left "missing required prefix \"rhmv3:\": \"noprefix\""
--
-- >>> parseRapidHashMicroText "rhmv3:abcdefabcdefabcg"
-- Left "leftovers after parsing hash: \"g\""
--
-- >>> parseRapidHashMicroText "rhmv3:0xadbeefdeadbeef"
-- Left "input does not start with a hexadecimal digit"
parseRapidHashMicroText :: Text -> Either String RapidHashMicro
parseRapidHashMicroText t = RapidHashMicro <$> parseHashText RAPIDHASH_MICRO_V3_PREFIX t
{-# INLINE parseRapidHashMicroText #-}

-- |
-- Efficiently parse a 'RapidHashMicro' from a 'ByteString'.
--
-- == __Examples__
--
-- >>> parseRapidHashMicroBS "rhmv3:deadbeefdeadbeef"
-- Right rhmv3:deadbeefdeadbeef
--
-- >>> parseRapidHashMicroBS "rhmv3:abracadabratoomany"
-- Left "rapidhash hashes should have a length of exactly 16, but found length 18"
--
-- >>> parseRapidHashMicroBS "rhmv3:nothexnothexnoth"
-- Left "Could not parse hexadecimal from \"nothexnothexnoth\""
--
-- >>> parseRapidHashMicroBS "rhmv3:tooshort"
-- Left "rapidhash hashes should have a length of exactly 16, but found length 8"
--
-- >>> parseRapidHashMicroBS "noprefix"
-- Left "missing required prefix \"rhmv3:\": \"noprefix\""
--
-- >>> parseRapidHashMicroBS "rhmv3:abcdefabcdefabcg"
-- Left "leftovers after parsing hash: \"g\""
--
-- >>> parseRapidHashMicroBS "rhmv3:0xadbeefdeadbeef"
-- Left "leftovers after parsing hash: \"xadbeefdeadbeef\""
parseRapidHashMicroBS :: ByteString -> Either String RapidHashMicro
parseRapidHashMicroBS b = RapidHashMicro <$> parseHashBS RAPIDHASH_MICRO_V3_PREFIX b
{-# INLINE parseRapidHashMicroBS #-}

-- |
-- Somewhat inefficiently parse a 'RapidHashMicro' from a 'String'.
--
-- Present for debugging purposes. Goes through 'parseRapidHashMicroText'. Unlike the other
-- parse functions, this allows trailing characters.
--
-- === __Examples__
-- >>> readsRapidHashMicro "rhmv3:0000000000000abcdagk"
-- [(rhmv3:0000000000000abc,"dagk")]
readsRapidHashMicro :: ReadS RapidHashMicro
readsRapidHashMicro s = map (first RapidHashMicro) $ readsHash RAPIDHASH_MICRO_V3_PREFIX s

----------------------------------------------------------------------------------------------------
-- Hash-agnostic
----------------------------------------------------------------------------------------------------

-- | Efficiently render a hash as a 'TB.Builder'
hashTextBuilder :: Addr# -> Word64 -> TB.Builder
hashTextBuilder prefix h = TB.Builder \b -> appendPaddedHashHexBuf (b TBuff.|># prefix) h
{-# INLINEABLE hashTextBuilder #-}

-- | Efficiently render a hash as 'Text'.
showHashText :: Addr# -> Word64 -> Text
showHashText prefix h = TB.runBuilder (hashTextBuilder prefix h)
{-# INLINEABLE showHashText #-}

-- |
-- Efficiently render a hash as 'ByteString'.
--
-- The resulting 'ByteString' is utf-8 encoded, using 'TB.runBuilderBS'
showHashBS :: Addr# -> Word64 -> ByteString
showHashBS prefix h = TB.runBuilderBS (hashTextBuilder prefix h)
{-# INLINEABLE showHashBS #-}

-- |
-- Somewhat inefficiently render a hash as a 'String'.
--
-- Present for debugging purposes. Goes through 'hashTextBuilder'
showsHash :: Addr# -> Word64 -> ShowS
showsHash prefix h = showString $ T.unpack (showHashText prefix h)

-- |
-- This is a specialized reimplementation of 'TBuff.|>&' from Andrew Lelechenko's
-- text-builder-linear that additionally pads with zeros.
appendPaddedHashHexBuf :: TBuff.Buffer %1 -> Word64 -> TBuff.Buffer
appendPaddedHashHexBuf buffer h =
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

-- | Efficiently parse a hash from a 'Text'.
parseHashText :: Text -> Text -> Either String Word64
parseHashText prefix t = do
  mhash <- guardPrefix prefix (T.splitAt (T.length prefix) t)
  guardLength (T.length mhash)
  -- T.hexadecimal helpfully strips 0x/0X, which is not so helpful for our purposes
  let pre = T.take 2 mhash
  when (pre == "0x" || pre == "0X") $ Left "input does not start with a hexadecimal digit"
  (hash, rest) <- T.hexadecimal mhash
  guardLeftovers rest
  pure hash
{-# INLINEABLE parseHashText #-}

-- | Efficiently parse a hash from a 'ByteString'.
parseHashBS :: ByteString -> ByteString -> Either String Word64
parseHashBS prefix b = do
  mhash <- guardPrefix prefix (BS.splitAt (BS.length prefix) b)
  guardLength (BS.length mhash)
  (hash, rest) <- maybe (badHex mhash) Right (BS.readHexadecimal mhash)
  guardLeftovers rest
  pure hash
 where
  badHex mhash = Left $ "Could not parse hexadecimal from \"" <> BSC8.unpack mhash <> "\""
{-# INLINEABLE parseHashBS #-}

-- | Somewhat inefficiently parse a hash from a 'String'.
readsHash :: Text -> ReadS Word64
readsHash prefix s =
  let (this, rest) = L.splitAt (T.length prefix + RAPIDHASH_V3_HEX_LENGTH) (L.dropWhile isSpace s)
   in case parseHashText prefix (T.pack this) of
        Right parsed -> [(parsed, rest)]
        Left _ -> []

guardPrefix :: (Show a, Semigroup a, Eq a) => a -> (a, a) -> Either String a
guardPrefix prefix (prefixMay, hash)
  | prefixMay == prefix = Right hash
  | otherwise = Left $ "missing required prefix " <> show prefix <> ": " <> show (prefixMay <> hash)
{-# INLINE guardPrefix #-}

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
