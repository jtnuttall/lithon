{-# LANGUAGE OverloadedStrings #-}

-- | Loader smoke: the one static symbol links and resolves global commands,
-- and the dispatch-table null guard behaves.
module Core.LoaderTest (
  unit_globalCommandResolves,
  unit_unknownNameIsNull,
  unit_aliasFallback,
  unit_checkCommandPtrPassesThrough,
  unit_checkCommandPtrThrowsNamed,
) where

import Control.Exception (evaluate, try)
import Foreign.Ptr (FunPtr, nullFunPtr, nullPtr)
import Test.Tasty.HUnit (Assertion, assertBool, assertEqual, assertFailure)

import Lithon.Core.Loader (MissingCommand (..), checkCommandPtr, getFirstProcAddr, getProcAddr)

-- | The loader always exposes the global commands, ICD or not.
unit_globalCommandResolves :: Assertion
unit_globalCommandResolves = do
  fp <- getProcAddr nullPtr "vkCreateInstance"
  assertBool "vkCreateInstance resolves" (fp /= nullFunPtr)

unit_unknownNameIsNull :: Assertion
unit_unknownNameIsNull = do
  fp <- getProcAddr nullPtr "vkDefinitelyNotACommand"
  assertEqual "unknown name yields null" nullFunPtr fp

-- | Fallback walks spellings in order and lands on the first that resolves.
unit_aliasFallback :: Assertion
unit_aliasFallback = do
  fp <- getFirstProcAddr nullPtr ["vkNotThisOne", "vkEnumerateInstanceVersion"]
  assertBool "alias fallback resolves second spelling" (fp /= nullFunPtr)

-- | The dispatch guard passes real pointers through untouched…
unit_checkCommandPtrPassesThrough :: Assertion
unit_checkCommandPtrPassesThrough = do
  fp <- getProcAddr nullPtr "vkCreateInstance"
  fp' <- evaluate (checkCommandPtr "vkCreateInstance" fp)
  assertEqual "non-null passes through" fp fp'

-- | …and throws a 'MissingCommand' that names the command on null.
unit_checkCommandPtrThrowsNamed :: Assertion
unit_checkCommandPtrThrowsNamed = do
  r <- try @MissingCommand (evaluate (checkCommandPtr "vkNotACommand" (nullFunPtr :: FunPtr ())))
  case r of
    Left e -> assertEqual "exception names the command" "vkNotACommand" e.command
    Right _ -> assertFailure "null pointer must throw MissingCommand"
