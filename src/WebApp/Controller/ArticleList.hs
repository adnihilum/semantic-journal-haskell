module WebApp.Controller.ArticleList where

import WebApp.Hsparql.Request
import WebApp.LibUtils
import WebApp.View.ArticleList

articlesListAction :: ActionM ()
articlesListAction = do
  articles <- requestAllArticles
  articlesListView articles
