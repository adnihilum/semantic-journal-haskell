module WebApp.LibUtils.Scotty where

import Control.Monad.State
import Data.Text as T
import Data.Text.Lazy as LT
import qualified Data.UUID as UUID
import Data.UUID (UUID)
import Network.Wai.Handler.Warp (Port)
import Web.Scotty.Trans hiding (get)
import qualified Web.Scotty.Trans as ST
import WebApp.Config

type WebAppT m = StateT Config m

type ScottyM a = ScottyT LT.Text (WebAppT IO) a

type ActionM a = ActionT LT.Text (WebAppT IO) a

scotty :: Port -> Config -> ScottyM () -> IO ()
scotty p config = scottyT p (flip evalStateT config)

get' :: RoutePattern -> ActionM () -> ScottyM ()
get' = ST.get

instance Parsable UUID where
  parseParam text =
    case UUID.fromText $ LT.toStrict text of
      Just uuid -> Right uuid
      Nothing -> Left "bad uuid"
