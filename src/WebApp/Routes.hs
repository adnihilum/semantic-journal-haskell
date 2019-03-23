module WebApp.Routes where

import Web.Scotty.Trans
import WebApp.Controller.Articles
import WebApp.Controller.Dummy as Controller.Dummy
import WebApp.LibUtils

routes :: ScottyM ()
routes = do
  get' "/" Controller.Dummy.actionDummy
  get' "/articles" WebApp.Controller.Articles.articlesListAction
  get' "/article/create" WebApp.Controller.Articles.createArticlePageAction
  post "/article/create/post" WebApp.Controller.Articles.createArticleAction
  post "/article/delete" WebApp.Controller.Articles.deleteArticleAction
