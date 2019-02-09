module Main where

import Data.Maybe
import System.Environment
import Text.Read
import Web.Scotty
import WebApp.Routes

main :: IO ()
main = do
  envPort <- (readMaybe =<<) <$> lookupEnv "Port"
  let port = fromMaybe 3000 envPort
  scotty port routes
