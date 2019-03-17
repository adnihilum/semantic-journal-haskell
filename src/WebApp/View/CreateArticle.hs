module WebApp.View.CreateArticle where

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

createArticleView :: ActionM ()
createArticleView =
  blaze $
  layout "create article" $
  div ! class_ "container" $
  div ! class_ "jumbotron" $ do
    form ! action "/createArticlePost" ! method "post" $ do
      div ! class_ "form-group" $ do
        simpleInput "title" "form_title" "Title: " ""
        simpleInput "body" "form_body" "Body: " ""
        submitButton "Submit"
  where
    simpleInput inputName inputId inputLabel inputValue = do
      label ! for inputId $ inputLabel
      input ! name inputName ! type_ "text" ! class_ "form-control" ! id inputId ! value (stringValue inputValue)
    submitButton buttonLabel = input ! type_ "submit" ! class_ "btn btn-default" ! value buttonLabel
