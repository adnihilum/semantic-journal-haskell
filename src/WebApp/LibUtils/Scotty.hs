module WebApp.LibUtils.Scotty where

import Control.Monad.State
import Data.Text.Lazy
import Network.Wai.Handler.Warp (Port)
import Web.Scotty.Trans hiding (get)
import qualified Web.Scotty.Trans as ST
import WebApp.Config

type WebAppT m = StateT Config m

type ScottyM a = ScottyT Text (WebAppT IO) a

type ActionM a = ActionT Text (WebAppT IO) a

scotty :: Port -> Config -> ScottyM () -> IO ()
scotty p config = scottyT p (flip evalStateT config)

get' :: RoutePattern -> ActionM () -> ScottyM ()
get' = ST.get
