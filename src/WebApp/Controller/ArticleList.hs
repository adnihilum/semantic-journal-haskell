module WebApp.Controller.ArticleList where

import Web.Scotty.Trans
import WebApp.LibUtils
import WebApp.Hsparql.Request

articlesListAction :: ActionM ()
articlesListAction = do
    articles <- requestAllArticles
    articlesListView articles

