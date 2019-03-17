module WebApp.Routes where

import Web.Scotty.Trans
import WebApp.Controller.Articles
import WebApp.Controller.Dummy as Controller.Dummy
import WebApp.LibUtils

routes :: ScottyM ()
routes = do
  get' "/" Controller.Dummy.actionDummy
  get' "/articles" WebApp.Controller.Articles.articlesListAction
  get' "/createArticle" WebApp.Controller.Articles.createArticlePageAction
  post "/createArticlePost" WebApp.Controller.Articles.createArticleAction
