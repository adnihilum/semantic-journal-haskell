module WebApp.Controller.Articles where

import qualified WebApp.Hsparql.Request as Request

import WebApp.LibUtils
import WebApp.View.ArticleList
import WebApp.View.CreateArticle

import Data.Text.Lazy
import Web.Scotty.Trans

articlesListAction :: ActionM ()
articlesListAction = do
  articles <- Request.requestAllArticles
  articlesListView articles

createArticleAction :: ActionM ()
createArticleAction = do
  title <- param "title"
  body <- param "body"
  Request.createArticle title body
  redirect "/articles"

createArticlePageAction :: ActionM ()
createArticlePageAction = createArticleView
