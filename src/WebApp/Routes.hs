module WebApp.Routes where

import Data.Text.Lazy
import Web.Scotty.Trans
import WebApp.Controller.Dummy as Controller.Dummy
import WebApp.Scotty

routes :: ScottyM ()
routes = do
  get "/" Controller.Dummy.actionDummy
