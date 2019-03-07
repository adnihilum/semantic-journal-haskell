module WebApp.Domain where

import Data.RDF (Node(..))
import Data.Text
import Data.Time.Clock

newtype ArticleId = ArticleId
  { getArticleId :: Node
  }

data Article = Article
  { articleId :: ArticleId
  , articleTitle :: Text
  , articleBody :: Text
  , articleReplyLinkFrom :: [ArticleId]
  , articleReplyLinkTo :: [ArticleId]
  , articleCreationDate :: UTCTime
  }
