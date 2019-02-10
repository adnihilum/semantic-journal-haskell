module WebApp.View.Dummy
  ( viewDummy
  ) where

import Prelude hiding (div, head, id)

import Data.Text (Text, append)
import Text.Blaze.Html5
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
import Web.Scotty.Trans
import WebApp.Scotty
import WebApp.View.Layout
import WebApp.View.Utils

viewDummy :: ActionM ()
viewDummy =
  blaze $ do
    layout "Dummy page" $ do
      div ! class_ "container" $ do
        div ! class_ "jumbotron" $ do
          h1 "Dummy page"
          dummyForm

dummyForm :: Html
dummyForm = do
  form ! action "/" ! method "get" $ do
    div ! class_ "form-group" $ do
      label ! for "dummy_text_id" $ "Some dummy text"
      input ! name "dummy_text" ! type_ "text" ! class_ "form-control" ! id "dummy_text_id" ! value ""
      submitButton "Submit"
  where
    submitButton buttonLabel = input ! type_ "submit" ! class_ "btn btn-default" ! value buttonLabel
