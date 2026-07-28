{-# LANGUAGE OverloadedStrings #-}

-- | Documentation synthesis (generate pass g8): one pre-escaped Haddock
-- block per emitted entity, assembled from the registry's own prose plus
-- everything the marshaller decided on the reader's behalf.
--
-- Per entity: the registry @comment@ · a spec man-page link · an
-- availability line ('AvailExpr') · alias provenance · deprecation ·
-- platform-guard notes · and for structs a members section spelling out
-- dropped\/derived members (@sType@\/@pNext@ automation, counts absorbed
-- into vector lengths, raw-pointer escapes).
--
-- Everything is escaped ONCE here ('escapeHaddock', property-tested);
-- renderers splice the lines verbatim. @cabal haddock lithon@ is the
-- downstream gate.
module Lithon.Codegen.Vulkan.Generate.Docs (
  DocKey (..),
  DocsMap (..),
  DocsError (..),
  synthesizeDocs,
  manPageUrl,
) where

import Data.Aeson (ToJSON)
import Data.Map.Strict qualified as Map
import Data.Text qualified as T
import Data.Vector qualified as V
import Lithon.Prelude

import Lithon.Codegen.Backend.Hs (escapeHaddock)
import Lithon.Codegen.Vulkan.Generate.Marshal (
  CountPlan (..),
  FieldPlan (..),
  StructPlan (..),
  StructPlans (..),
 )
import Lithon.Codegen.Vulkan.Names
import Lithon.Codegen.Vulkan.Resolved.Avail (
  AliasInfo (..),
  AvailExpr,
  DeprecationInfo (..),
  PlatformGuard (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Commands (ResolvedCommand (..))
import Lithon.Codegen.Vulkan.Resolved.Core (
  ResolvedFuncpointer (..),
  ResolvedHandle (..),
  ResolvedStruct (..),
 )
import Lithon.Codegen.Vulkan.Resolved.Enums (ResolvedEnumBlock (..))
import Lithon.Codegen.Vulkan.Resolved.Registry (ResolvedRegistry (..))

-- | What a doc block is attached to.
data DocKey
  = DocType !TypeName
  | DocCommand !CommandName
  deriving stock (Eq, Generic, Ord, Show)
  deriving anyclass (NFData)

-- | Finished @--@-prefixed Haddock lines per entity (already escaped).
newtype DocsMap = DocsMap
  { docs :: Map DocKey [Text]
  }
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData)

data DocsError = DocsError {what :: !Text}
  deriving stock (Eq, Generic, Show)
  deriving anyclass (NFData, ToJSON)

instance Display DocsError where
  displayBuilder e = "docs: " <> displayBuilder e.what

-- | The registry's canonical per-symbol reference.
manPageUrl :: Text -> Text
manPageUrl cname =
  "https://registry.khronos.org/vulkan/specs/latest/man/html/" <> cname <> ".html"

-- | Build the doc block for every curated type and command.
synthesizeDocs
  :: ( HasType ResolvedRegistry cxt
     , HasType StructPlans cxt
     )
  => cxt
  -> Validation (Errors DocsError) DocsMap
synthesizeDocs cxt =
  Success
    ( DocsMap
        . Map.fromList
        $ [ (DocType n, structDocs n s) | (n, s) <- Map.toList registry.structs
          ]
        <> [ (DocType n, blockDocs n b) | (n, b) <- Map.toList registry.enums
           ]
        <> [ (DocType n, handleDocs n h) | (n, h) <- Map.toList registry.handles
           ]
        <> [ (DocType n, fpDocs n f) | (n, f) <- Map.toList registry.funcpointers
           ]
        <> [ (DocCommand n, commandDocs n c) | (n, c) <- Map.toList registry.commands
           ]
    )
 where
  registry = getTyped @ResolvedRegistry cxt
  plans' = getTyped @StructPlans cxt

  structDocs n s =
    entityDocs
      (forgetNamespace n)
      s.comment
      s.availability
      (V.toList ((.name) <$> s.aliases))
      s.deprecation
      s.platformGuards
      <> memberNotes n

  blockDocs n b =
    entityDocs
      (forgetNamespace n)
      b.comment
      b.availability
      (V.toList ((.name) <$> b.aliases))
      Nothing
      []

  handleDocs n h =
    entityDocs
      (forgetNamespace n)
      h.comment
      h.availability
      (V.toList ((.name) <$> h.aliases))
      h.deprecation
      h.platformGuards

  fpDocs n f =
    entityDocs (forgetNamespace n) f.comment f.availability [] Nothing []

  commandDocs n c =
    entityDocs
      (forgetNamespace n)
      c.comment
      c.availability
      (V.toList ((.name) <$> c.aliases))
      c.deprecation
      c.platformGuards

  -- the shared block: prose · man link · availability · aliases ·
  -- deprecation · platform notes
  entityDocs
    :: Text
    -> Maybe Text
    -> Maybe AvailExpr
    -> [WithNS k]
    -> Maybe DeprecationInfo
    -> [PlatformGuard]
    -> [Text]
  entityDocs cname comment avail aliases deprecation guards =
    ["-- | " <> escapeHaddock c | Just c <- [comment], not (T.null c)]
      <> [ "-- "
             <> (if isNothing comment then "| " else "")
             <> "Registry: <"
             <> manPageUrl cname
             <> " "
             <> escapeHaddock cname
             <> ">"
         ]
      <> [ "-- Available: " <> escapeHaddock (display a)
         | Just a <- [avail]
         ]
      <> [ "-- Alias spellings: " <> escapeHaddock (T.intercalate ", " (fmap display aliases))
         | not (null aliases)
         ]
      <> [ "-- __Deprecated__" <> escapeHaddock (deprecationTail d)
         | Just d <- [deprecation]
         ]
      <> [ "-- Platform-specific (guarded by @"
             <> escapeHaddock g.protect
             <> "@ in C; emitted unconditionally here)."
         | g <- take 1 guards
         ]
  deprecationTail d = case d.supersededBy of
    Just s -> ": superseded by " <> s <> "."
    Nothing -> "."

  -- what the marshaller did to each interesting member
  memberNotes n = case Map.lookup n plans'.plans of
    Just MarshalPlan{fields, extensible} ->
      let notes =
            ["@sType@ is written automatically." | any isSType fields]
              <> ( if extensible then
                     ["@pNext@ is the typed @next :: Chain es@ field."]
                   else
                     ["@pNext@ is reserved and written as null." | any isPNextNull fields]
                 )
              <> concatMap countNote fields
              <> concatMap rawNote fields
       in if null notes then
            []
          else
            "--" : "-- Marshalling:" : [wrapNote t | t <- notes]
    _ -> []
  wrapNote t = "--   * " <> t
  isSType FSType{} = True
  isSType _ = False
  isPNextNull FPNextNull{} = True
  isPNextNull _ = False
  countNote = \case
    FVector{field, count = CountSibling{member, drives = True}} ->
      ["@" <> escapeHaddock member <> "@ is derived from @" <> escapeHaddock field <> "@'s length."]
    FVectorScalar{field, count = CountSibling{member, drives = True, scale}} ->
      [ "@"
          <> escapeHaddock member
          <> "@ is derived from @"
          <> escapeHaddock field
          <> "@'s length"
          <> (if scale /= 1 then " (×" <> T.show scale <> ")" else "")
          <> "."
      ]
    FStringVector{field, count = CountSibling{member, drives = True}} ->
      ["@" <> escapeHaddock member <> "@ is derived from @" <> escapeHaddock field <> "@'s length."]
    FBytes{field, count = CountSibling{member, drives = True}} ->
      ["@" <> escapeHaddock member <> "@ is derived from @" <> escapeHaddock field <> "@'s length."]
    _ -> []
  rawNote = \case
    FRawPtr{field} ->
      ["@" <> escapeHaddock field <> "@ is deliberately un-modelled (raw pointer); see the module notes."]
    _ -> []
