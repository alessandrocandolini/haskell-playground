module Lib where
import qualified Data.Text as T
-- data Todo = forall a . Ord a => Todo String a 
data Todo a = Todo T.Text a 

data Result = EmptyTitle | PastDueDate | Success 

x :: Todo Integer
x = Todo "hello" 5

f :: Ord a => Todo a -> Result
f (Todo "" _) = EmptyTitle
f (Todo _  _) = Success

