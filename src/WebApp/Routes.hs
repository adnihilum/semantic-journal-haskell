module WebApp.Routes where

import WebApp.Controller.ArticleList
import WebApp.Controller.Dummy as Controller.Dummy
import WebApp.LibUtils

routes :: ScottyM ()
routes = do
  get' "/" Controller.Dummy.actionDummy
  get' "/articles" WebApp.Controller.ArticleList.articlesListAction
