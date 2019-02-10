module WebApp.Config where

import Data.Yaml
import Data.Yaml.Config

data Config = Config
  { dummyOption :: String
  } deriving Show

instance FromJSON Config where
  parseJSON = withObject "Config" $ \v -> Config <$> (v .: "dummyOption")

loadConfig :: [FilePath] -> IO Config
loadConfig filePaths = loadYamlSettings filePaths [] useEnv
