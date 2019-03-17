module WebApp.LibUtils.Hsparql
  ( module Database.HSparql.Connection
  , module Database.HSparql.QueryGenerator
  ) where

import Data.RDF (Node(..))
import Database.HSparql.Connection
import Database.HSparql.QueryGenerator hiding (regex)

instance SubjectTermLike Node
