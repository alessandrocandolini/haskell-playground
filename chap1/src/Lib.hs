module Lib where
import Data.Text

-- data Event = forall a . Ord a => Event String a 
data Event a = Event Text a deriving (Show,Eq)

data Result = EmptyTitle | PastDueDate | Success deriving (Show,Eq)

validate :: Ord a => Event a -> a -> Result
validate (Event "" _ ) _ = EmptyTitle
validate (Event _  d ) current | d <=current = PastDueDate
validate _ _ = Success

