{-# LANGUAGE OverloadedStrings #-}

module WebApp.Hsparql.Request where

import Control.Monad.Catch
import Control.Monad.IO.Class
import Data.RDF hiding (Query) --(Node(..), RDF, TList, triplesOf)
import Data.Text
import WebApp.Config.Sparql
import WebApp.Domain
import WebApp.LibUtils

instance Exception Text

requestAllArticles :: ActionM [Article]
requestAllArticles = do
  endpoint <- getSparqlEndpoint "query"
  result <- liftIO $ selectQuery endpoint request
  liftIO $ print $ createSelectQuery request
  liftIO $ print result
  case result of
    Just result' -> mapM parseRow result'
    Nothing -> throwM $ ("fail to read articles" :: Text)
  where
    parseRow :: (MonadIO m, MonadThrow m) => [BindingValue] -> m Article
    parseRow row =
      case [a | Bound (LNode a) <- row] of
        [PlainL title, PlainL text, PlainL creationDateString, PlainL uuid] -> do
          liftIO $ print [title, text, creationDateString, uuid]
          creationDate <-
            case readsPrec 10 (unpack creationDateString) of
              [(x, "")] -> return x
              _ -> throwM ("fail to parse creation Date" :: Text)
          return $
            Article
              { articleId = ArticleId uuid
              , articleBody = text
              , articleTitle = title
              , articleCreationDate = creationDate
              , articleReplyLinkFrom = []
              , articleReplyLinkTo = []
              }
        _ -> throwM ("fail to parse request response from the db" :: Text)
    request :: Query SelectQuery
    request = do
      semjArticle <- prefix "semj" (iriRef "semj://article/")
      a <- var
      title <- var
      text <- var
      creationDate <- var
      uuid <- var
      triple_ a (semjArticle .:. "title") title
      triple_ a (semjArticle .:. "text") text
      triple_ a (semjArticle .:. "creationDate") creationDate
      triple_ a (semjArticle .:. "uuid") uuid
      selectVars [title, text, creationDate, uuid]
