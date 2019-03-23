module WebApp.View.ArticleList where

import Control.Monad.State
import Data.Function
import Data.Text as T
import Prelude hiding (div, head, id)
import Text.Blaze.Html5
  ( Html
  , (!)
  , a
  , button
  , div
  , form
  , h1
  , input
  , label
  , option
  , p
  , select
  , string
  , stringValue
  , text
  , textValue
  )
import Text.Blaze.Html5.Attributes (action, class_, for, href, id, method, multiple, name, selected, type_, value)
import WebApp.Domain
import WebApp.LibUtils
import WebApp.View.Layout
import WebApp.View.Utils

articlesListView :: [Article] -> ActionM ()
articlesListView articles = do
  config <- get
  blaze $ do
    layout "Dummy page" $ do div ! class_ "container" $ do div ! class_ "jumbotron" $ do mapM_ articleContainer articles
  where
    articleContainer ar =
      div $ do
        h1 $ text $ ar & articleTitle
        p $ text $ ar & articleBody
        p $ string $ show $ ar & articleCreationDate
        form ! action "/article/delete" ! method "post" $ do
          input ! name "id" ! type_ "hidden" ! (value $ textValue $ ar & articleId & getArticleId)
          input ! type_ "submit" ! class_ "btn btn-default" ! value "Delete"
