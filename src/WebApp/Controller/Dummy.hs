module WebApp.Controller.Dummy where

import Control.Monad.IO.Class
import qualified Data.RDF as RDF
import Data.RDF (RDF, TList, triplesOf)
import Data.RDF.Query
import Data.Text.Lazy
import Database.HSparql.Connection
import Database.HSparql.QueryGenerator
import Web.Scotty.Trans
import WebApp.Config.Sparql
import WebApp.Scotty
import WebApp.View.Dummy

actionDummy :: ActionM ()
actionDummy = do
  sparqlRequestExample
  viewDummy

sparqlRequestExample :: ActionM ()
sparqlRequestExample = do
  endpoint <- getSparqlEndpoint "query"
  result <- liftIO $ selectQuery endpoint simpleSelect
  liftIO $ print result

simpleSelect :: Query SelectQuery
simpleSelect = do
  a <- var
  b <- var
  c <- var
  triple_ a b c
  selectVars [a, b, c]
