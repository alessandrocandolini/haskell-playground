module Lib where
import Data.Char
import Data.Either.Extra
import Data.Time

newtype NonEmptyString = NonEmptyString String deriving (Show, Eq)
safeNonEmptyString :: String -> Maybe NonEmptyString
safeNonEmptyString s | s == "" = Nothing 
                     | otherwise = Just (NonEmptyString s)

newtype TodoTitle = TodoTitle NonEmptyString deriving (Eq,Show)

data Todo a = Todo {
   title :: TodoTitle, 
   dueDate :: Maybe a
   } deriving (Eq,Show)



{--
  A simple approach (runtime checks, no trim, monolytic function, ad hoc response type, etc) 
--}   

data AddTodoResult a = Notitle | PastDueDate | Success (Todo a) deriving (Eq,Show)

simpleAddTodo :: Ord a => String -> Maybe a -> a -> AddTodoResult a
simpleAddTodo "" _ _ = Notitle 
simpleAddTodo t a b | isDatePast a b = PastDueDate 
              | otherwise =  Success todo 
              where 
                   todo = Todo (TodoTitle (NonEmptyString t)) (Just b)  -- type-unsafe runtime promotion of string to nonemptystring 
                   isDatePast Nothing _ = False
                   isDatePast (Just x) y = x < y 


{--
  A bit more compositionality  (still not ideal)
--}   

wrongTrim :: String -> String 
wrongTrim = filter (/= ' ')

myDropWhile             :: (a -> Bool) -> [a] -> [a]
myDropWhile _ []        =  []
myDropWhile p (x:xs)
            | p x       =  myDropWhile p xs
            | otherwise =  (x:xs)

inefficientTrim = trimEnd . trimBeginning 
     where
       trimBeginning = myDropWhile isSpace
       trimEnd                          = reverse . trimBeginning . reverse                       

trim = inefficientTrim


data AddTodoValidation = ErrorTitle| ErrorDueDate deriving (Eq,Show)
type TodoValidationResult a = Either AddTodoValidation a 

basicCheckTitle    :: String -> TodoValidationResult NonEmptyString 
-- basicCheckTitle "" = Left ErrorTitle 
-- basicCheckTitle s  = Right s 
basicCheckTitle =  (maybeToEither ErrorTitle) . safeNonEmptyString

checkTitle = basicCheckTitle . trim

checkDueDate :: Ord a => Maybe a -> a -> TodoValidationResult (Maybe a)
checkDueDate (Just a) d | a < d = Left ErrorDueDate
                        | otherwise = Right (Just a)

addTodo2 :: Ord a => String -> Maybe a -> a -> TodoValidationResult (Todo a)
addTodo2 t a b = do 
   t' <- checkTitle t
   d' <- checkDueDate a b 
   return $ Todo (TodoTitle t') d'



-- Full program 

parseDate :: String -> Maybe ZonedTime  
parseDate = parseTimeM True defaultTimeLocale "%Y-%m-%d"

business :: String -> String -> IO String 
business rawTitle rawDate = do 
   now <- getZonedTime
   return "hello" 

program :: IO ()
program = do 
  putStrLn "insert title:"
  rawTitle <- getLine 
  putStrLn "insert date:" 
  rawDate <- getLine
  result <- business rawTitle rawDate 
  putStrLn result 

