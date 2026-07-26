-- | The loader bootstrap: lithon's single static link seam.
--
-- Everything in Vulkan is reachable from @vkGetInstanceProcAddr@: global
-- commands via a null instance, instance-level commands via an instance, and
-- device-level commands via @vkGetDeviceProcAddr@ (itself loaded here).
-- lithon-core links @libvulkan@ (@vulkan-1@ on Windows) for exactly this one
-- symbol; every other entry point is resolved dynamically into the generated
-- command tables.
module Lithon.Core.Loader (
  getProcAddr,
  getFirstProcAddr,
  castCommandPtr,
  MissingCommand (..),
  checkCommandPtr,
) where

import Control.Exception (Exception (..), throw)
import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Foreign.C.String (CString)
import Foreign.Ptr (FunPtr, Ptr, castFunPtr, castPtr, nullFunPtr)

foreign import ccall unsafe "vkGetInstanceProcAddr"
  c_vkGetInstanceProcAddr :: Ptr () -> CString -> IO (FunPtr ())

-- | Resolve a command by name. Pass 'Foreign.Ptr.nullPtr' as the handle for
-- global commands (@vkCreateInstance@, @vkEnumerateInstance*@). Returns
-- 'nullFunPtr' when the loader/driver does not expose the name.
getProcAddr :: Ptr a -> ByteString -> IO (FunPtr ())
getProcAddr h name = BS.useAsCString name (c_vkGetInstanceProcAddr (castPtr h))

-- | Resolve the first available spelling of a command — the canonical name
-- first, then alias spellings (extension names of promoted commands), which
-- matters when running against drivers that only expose the extension
-- spelling. Returns 'nullFunPtr' when none resolve.
getFirstProcAddr :: Ptr a -> [ByteString] -> IO (FunPtr ())
getFirstProcAddr h = go
 where
  go [] = pure nullFunPtr
  go (n : ns) = do
    fp <- getProcAddr h n
    if fp == nullFunPtr then go ns else pure fp

-- | Cast a loader-resolved pointer to its concrete command type. The cast is
-- only sound for the command the name was resolved from — generated code is
-- the intended caller.
castCommandPtr :: FunPtr () -> FunPtr f
castCommandPtr = castFunPtr
{-# INLINE castCommandPtr #-}

-- | Thrown when a generated wrapper is called for a command the loader never
-- resolved: the extension or feature level providing it is not enabled on
-- this instance\/device, or the dispatch table predates it. A misuse guard,
-- not a @VkResult@ — wrapped-call outcomes still never throw.
newtype MissingCommand = MissingCommand
  { command :: String
  }
  deriving stock (Show)

instance Exception MissingCommand where
  displayException e =
    "lithon: "
      <> e.command
      <> ": command not available (null function pointer). The extension or"
      <> " feature that provides it is not enabled on this instance/device,"
      <> " or the dispatch table predates it."

-- | Guard a dispatch-table read: pass the resolved pointer through, or throw
-- 'MissingCommand' when it is null. Pure by design — generated call sites
-- wrap the table read inline, and the FFI application demands the pointer
-- strictly, so the imprecise exception surfaces at the call. One predicted
-- compare per call; a null table slot would otherwise be a jump to address
-- zero.
checkCommandPtr :: String -> FunPtr f -> FunPtr f
checkCommandPtr name fp
  | fp == nullFunPtr = throw MissingCommand{command = name}
  | otherwise = fp
{-# INLINE checkCommandPtr #-}
