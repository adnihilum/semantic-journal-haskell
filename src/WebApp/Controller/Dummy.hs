{-# LANGUAGE OverloadedStrings #-}

module WebApp.Controller.Dummy where

import Control.Monad.IO.Class
import Data.RDF (Node(..), RDF, TList, triplesOf)
import Data.Text
import Database.HSparql.Connection
import Database.HSparql.QueryGenerator
import Web.Scotty.Trans
import WebApp.Config.Sparql
import WebApp.Hsparql
import WebApp.Scotty
import WebApp.View.Dummy

actionDummy :: ActionM ()
actionDummy = do
  sparqlTestInsertData
  sparqlRequestExample
  viewDummy

sparqlRequestExample :: ActionM ()
sparqlRequestExample = do
  endpoint <- getSparqlEndpoint "query"
  result <- liftIO $ selectQuery endpoint simpleSelect
  liftIO $ print result
  where
    simpleSelect :: Query SelectQuery
    simpleSelect = do
      a <- var
      b <- var
      c <- var
      triple_ a b c
      selectVars [a, b, c]

sparqlTestInsertData :: ActionM ()
sparqlTestInsertData = do
  endpoint <- getSparqlEndpoint "update"
  result <- liftIO $ updateQuery endpoint insertQuery
  liftIO $ print result
  where
    insertQuery = do
      prefix <- prefix "semantic_journal" (iriRef "semj://")
      a <- var
      triple <- updateTriple (BNode "a") (prefix .:. "asdasd") ("asdasd" :: Text)
      return UpdateQuery {queryUpdate = [triple]}
