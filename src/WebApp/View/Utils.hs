module WebApp.View.Utils
  ( blaze
  , pet
  ) where

import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 (Html)
import Text.Blaze.Internal (preEscapedText)
import Web.Scotty.Trans
import WebApp.LibUtils.Scotty

pet = preEscapedText

blaze :: Html -> ActionM ()
blaze = html . renderHtml
