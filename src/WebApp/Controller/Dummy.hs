module WebApp.Controller.Dummy where

import Data.Text.Lazy
import Web.Scotty.Trans
import WebApp.Scotty
import WebApp.View.Dummy

actionDummy :: ActionM ()
actionDummy = viewDummy
