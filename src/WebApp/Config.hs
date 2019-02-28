module WebApp.Config where

import Control.Monad.State
import Data.Map
import Data.Yaml
import Data.Yaml.Config
import Web.Scotty.Internal.Types
import Web.Scotty.Trans

data Config = Config
  { getSparqlDb :: SparqlDbConfig
  } deriving (Show)

data SparqlDbConfig = SparqlDbConfig
  { getBaseUrl :: String
  , getEndpoints :: Map String String
  } deriving (Show)

instance FromJSON Config where
  parseJSON = withObject "Config" $ \v -> Config <$> (v .: "sparqlDb")

instance FromJSON SparqlDbConfig where
  parseJSON = withObject "SparqlDbConfig" $ \v -> SparqlDbConfig <$> (v .: "baseUrl") <*> (v .: "endpoints")

loadConfig :: [FilePath] -> IO Config
loadConfig filePaths = loadYamlSettings filePaths [] useEnv

instance (MonadState s m, ScottyError e) => MonadState s (ActionT e m) where
  state = lift . state
