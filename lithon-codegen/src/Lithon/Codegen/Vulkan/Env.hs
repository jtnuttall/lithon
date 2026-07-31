{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fplugin=Effectful.Plugin #-}

module Lithon.Codegen.Vulkan.Env (
  VulkanResolutionError (..),
  VulkanDirs (..),
  resolveVulkanDirs,
  VulkanGen,
  getVulkanDirs,
  getVulkanXmlPath,
  runVulkanGen,
)
where

import Data.Aeson qualified as A
import Effectful
import Effectful.Dispatch.Dynamic
import Lithon.Effect.Error
import Lithon.Effect.FileSystem
import Lithon.Effect.Log
import Lithon.Prelude
import System.FilePath ((<.>), (</>))

import Lithon.Codegen.Backend.Env (DataDirError, targetDataDir)

data VulkanResolutionError
  = VkDataDirError DataDirError
  | VkDocsMissing FilePath
  | VkXmlMissing FilePath
  deriving stock (Generic, Show)
  deriving anyclass (A.ToJSON, Exception)

instance From DataDirError VulkanResolutionError where
  from = VkDataDirError

instance Display VulkanResolutionError where
  displayBuilder = \case
    VkDataDirError err -> displayBuilder err
    VkDocsMissing path -> missing "Vulkan-Docs directory" path
    VkXmlMissing path -> missing "vk.xml file" path
   where
    missing tag path = "Missing " <> tag <> ": " <> show path

data VulkanDirs = VulkanDirs
  { vulkanDataDir :: FilePath
  , vulkanDocsDir :: FilePath
  , vulkanXmlFile :: FilePath
  }
  deriving stock (Show)

resolveVulkanDirs
  :: (IOE :> es, FileSystem :> es, Error VulkanResolutionError :> es, Log :> es) => Eff es VulkanDirs
resolveVulkanDirs = do
  vulkanDataDir <- runErrorFrom @DataDirError $ targetDataDir "vulkan"

  logInfo $ "Loading vulkan docs" :# ["dataDir" .= vulkanDataDir]

  let vulkanDocsDir = vulkanDataDir </> "Vulkan-Docs"
      vulkanXmlFile = vulkanDocsDir </> "xml" </> "vk" <.> "xml"

  assertDirectoryExists vulkanDocsDir VkDocsMissing
  assertFileExists vulkanXmlFile VkXmlMissing

  pure VulkanDirs{..}

data VulkanGen :: Effect where
  GetVulkanDirs :: VulkanGen m VulkanDirs

type instance DispatchOf VulkanGen = Dynamic

getVulkanDirs :: (VulkanGen :> es) => Eff es VulkanDirs
getVulkanDirs = send GetVulkanDirs

getVulkanXmlPath :: (VulkanGen :> es) => Eff es FilePath
getVulkanXmlPath = (.vulkanXmlFile) <$> getVulkanDirs

runVulkanGen
  :: (IOE :> es, FileSystem :> es, Log :> es, Error VulkanResolutionError :> es)
  => Eff (VulkanGen : es) a -> Eff es a
runVulkanGen eff = do
  vulkanDirs <- resolveVulkanDirs
  interpret
    ( const \case
        GetVulkanDirs -> pure vulkanDirs
    )
    eff
