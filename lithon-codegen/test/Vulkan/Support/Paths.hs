{-# LANGUAGE ImplicitParams #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Vulkan.Support.Paths (
  registryXmlPath,
) where

import Control.Exception (throwIO)
import Effectful
import Lithon.Effect.Error
import Lithon.Effect.FileSystem
import Lithon.Effect.Log
import Lithon.Prelude

import Lithon.Codegen.Vulkan.Env (VulkanDirs (..), resolveVulkanDirs)

registryXmlPath :: (HasCallStack) => IO FilePath
registryXmlPath =
  runEff . runLog "test" $ runFileSystem do
    r <- runError resolveVulkanDirs
    case r of
      Right a -> pure a.vulkanXmlFile
      Left (cs, e) -> do
        logError $ "Failed to resolve vulkan environment" :# ["error" .= show @Text e]
        let ?callStack = cs
        liftIO (throwIO e)
