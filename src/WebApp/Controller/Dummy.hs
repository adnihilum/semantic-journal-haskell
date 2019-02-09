module WebApp.Controller.Dummy where

import Web.Scotty
import WebApp.View.Dummy

actionDummy :: ActionM ()
actionDummy = do
  viewDummy
