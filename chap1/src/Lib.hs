module Lib where
import Data.Text

-- data Todo = forall a . Ord a => Todo String a 
data Todo a = Todo Text a deriving (Show,Eq)

data Result = EmptyTitle | PastDueDate | Success deriving (Show,Eq)

validate :: Ord a => Todo a -> a -> Result
validate (Todo "" _ ) _ = EmptyTitle
validate (Todo _  d ) current | d <=current = PastDueDate
validate _ _ = Success

