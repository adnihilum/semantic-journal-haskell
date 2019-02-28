{-# LANGUAGE FlexibleContexts #-}

module WebApp.Config.Sparql where

import Control.Monad.State
import Data.Function
import Data.Map
import WebApp.Config

getSparqlEndpoint :: (MonadState Config m) => String -> m String
getSparqlEndpoint name = do
  config <- get
  let sparqlConfig = config & getSparqlDb
  let endpoints = sparqlConfig & getEndpoints
  let baseUrl = sparqlConfig & getBaseUrl
  return $ baseUrl ++ endpoints ! name
