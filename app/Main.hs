module Main where

import Control.Monad.State
import Data.Maybe
import System.Environment
import Text.Read
import Web.Scotty.Trans
import WebApp.Config
import WebApp.Routes
import WebApp.Scotty

main :: IO ()
main = do
  envPort <- (readMaybe =<<) <$> lookupEnv "Port"
  let port = fromMaybe 3000 envPort
  config <- loadConfig ["./config.yaml"]
  putStrLn $ "config: " ++ show config
  scotty port config routes
