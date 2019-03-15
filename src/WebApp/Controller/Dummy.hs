{-# LANGUAGE OverloadedStrings #-}

module WebApp.Controller.Dummy where

import Control.Monad.IO.Class
import Data.RDF (Node(..), RDF, TList, triplesOf)
import Data.Text
import Data.Time.Clock
import Database.HSparql.Connection
import Database.HSparql.QueryGenerator
import Web.Scotty.Trans
import WebApp.Config.Sparql
import WebApp.LibUtils
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
  currentDate <- liftIO $ getCurrentTime
  liftIO $ print $ createUpdateQuery $ insertQuery currentDate
  result <- liftIO $ updateQuery endpoint $ insertQuery currentDate
  liftIO $ print result
  where
    insertQuery currentDate = do
      semjArticle <- prefix "article" (iriRef "semj://article/")
      let a = BNode "a"
      triples <-
        sequenceA
          [ updateTriple a (semjArticle .:. "title") ("Some title lol" :: Text)
          , updateTriple a (semjArticle .:. "text") ("text asdasdasd" :: Text)
          , updateTriple a (semjArticle .:. "creationDate") (pack $ show currentDate :: Text)
          , updateTriple a (semjArticle .:. "uuid") ("uuuuuiiidddd" :: Text)
          ]
      return UpdateQuery {queryUpdate = triples}
