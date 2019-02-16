{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module WebApp.Config where

import Control.Monad.State
import Data.Yaml
import Data.Yaml.Config
import Web.Scotty.Internal.Types
import Web.Scotty.Trans

data Config = Config
  { dummyOption :: String
  } deriving (Show)

instance FromJSON Config where
  parseJSON = withObject "Config" $ \v -> Config <$> (v .: "dummyOption")

loadConfig :: [FilePath] -> IO Config
loadConfig filePaths = loadYamlSettings filePaths [] useEnv

instance (MonadState s m, ScottyError e) => MonadState s (ActionT e m) where
  state = lift . state
