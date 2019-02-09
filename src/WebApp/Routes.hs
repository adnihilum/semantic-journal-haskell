module WebApp.Routes where

import Web.Scotty
import WebApp.Controller.Dummy as Controller.Dummy

routes :: ScottyM ()
routes = do
  get "/" Controller.Dummy.actionDummy
