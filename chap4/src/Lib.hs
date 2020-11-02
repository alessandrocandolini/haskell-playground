module Lib where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

newtype TodoTitle = TodoTitle String deriving (Eq,Show)

data Todo a = Todo {
   title :: TodoTitle, 
   dueDate :: Maybe a
   } deriving (Eq,Show)

data AddTodoResult a = Notitle | PastDueDate | Success (Todo a) deriving (Eq,Show)

-- addTodo :: Ord a => String -> Maybe a -> a -> AddTodoResult a
addTodo "" _ _ = Notitle 
addTodo t a b | isDatePast a b = PastDueDate 
              | otherwise =  Success todo where 
                   todo = Todo (TodoTitle t) (Just b) 


isDatePast :: Ord a => Maybe a -> a -> Bool                   
isDatePast Nothing _ = False
isDatePast (Just a) b = a < b 

