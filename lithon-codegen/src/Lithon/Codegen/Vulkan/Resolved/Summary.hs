{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE StrictData #-}

-- | Table counts, breakdowns, and content digests for the resolved
-- registry — the drift overview and second golden layer.
module Lithon.Codegen.Vulkan.Resolved.Summary (
  ResolvedSummary (..),
  summarizeResolved,
  prettyResolvedSummary,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Prettyprinter (Doc, comma, hsep, indent, pretty, punctuate, vsep, (<+>))

import Lithon.Codegen.Backend.Json (canonicalJsonBytes, digestText)
import Lithon.Codegen.Prelude
import Lithon.Codegen.Vulkan.Resolved.Commands (DispatchLevel (..), ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Enums (EnumFlow (..), ResolvedEnumBlock (..))
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))

data ResolvedSummary = ResolvedSummary
  { headerVersion :: Int
  , tableCounts :: [(Text, Int)]
  , enumFlows :: [(Text, Int)]
  , dispatchLevels :: [(Text, Int)]
  , tableDigests :: [(Text, Text)]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

summarizeResolved :: ResolvedRegistry -> ResolvedSummary
summarizeResolved reg =
  ResolvedSummary
    { headerVersion = reg.headerVersion
    , tableCounts =
        [ ("constants", length reg.constants)
        , ("enum-blocks", length reg.enums)
        , ("enum-values", sum (fmap (length . (.items)) reg.enums))
        , ("bitmasks", length reg.bitmasks)
        , ("handles", length reg.handles)
        , ("structs", length reg.structs)
        , ("funcpointers", length reg.funcpointers)
        , ("basetypes", length reg.basetypes)
        , ("defines", length reg.defines)
        , ("externals", length reg.externals)
        , ("commands", length reg.commands)
        , ("features", length reg.features)
        , ("extensions", length reg.extensions)
        , ("formats", length reg.formats)
        , ("spirv-extensions", length reg.spirvExtensions)
        , ("spirv-capabilities", length reg.spirvCapabilities)
        ]
    , enumFlows =
        [ (label, length (Map.filter (\b -> b.flow == flow) reg.enums))
        | (flow, label) <-
            [ (FlowIn, "in")
            , (FlowOut, "out")
            , (FlowBoth, "both")
            , (FlowUnreferenced, "unreferenced")
            ]
        ]
    , dispatchLevels =
        [ (label, length (Map.filter (\c -> c.dispatch == lvl) reg.commands))
        | (lvl, label) <-
            [ (DispatchGlobal, "global")
            , (DispatchInstance, "instance")
            , (DispatchDevice, "device")
            ]
        ]
    , tableDigests =
        [ ("constants", digestOf reg.constants)
        , ("enums", digestOf reg.enums)
        , ("bitmasks", digestOf reg.bitmasks)
        , ("handles", digestOf reg.handles)
        , ("structs", digestOf reg.structs)
        , ("funcpointers", digestOf reg.funcpointers)
        , ("basetypes", digestOf reg.basetypes)
        , ("defines", digestOf reg.defines)
        , ("externals", digestOf reg.externals)
        , ("commands", digestOf reg.commands)
        , ("features", digestOf reg.features)
        , ("extensions", digestOf reg.extensions)
        ]
    }
 where
  digestOf :: (ToJSON a) => a -> Text
  digestOf = digestText . canonicalJsonBytes

-- | Returns an abstract document tree for terminal reporting.
prettyResolvedSummary :: ResolvedSummary -> Doc ann
prettyResolvedSummary s =
  vsep
    $ ("resolved registry (header version" <+> pretty s.headerVersion <> "):")
    : map
      (indent 2)
      ( [countLine name n | (name, n) <- s.tableCounts]
          <> [ "enum flow:" <+> breakdown s.enumFlows
             , "dispatch:" <+> breakdown s.dispatchLevels
             ]
      )
 where
  countLine name n = pretty name <> ":" <+> pretty n
  breakdown parts =
    hsep $ punctuate comma [pretty n <+> pretty label | (label, n) <- parts]
