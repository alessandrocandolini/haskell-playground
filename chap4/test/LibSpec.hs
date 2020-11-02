module LibSpec where 

import Test.Hspec
import Test.Hspec.QuickCheck
import Lib

spec :: Spec
spec = do 
  describe "addTodo" $ do
    prop "returns no title whenever the title is empty" $ 
      \a -> \b -> (addTodo "" (a::Maybe Int) (b::Int)) == Notitle

    prop "never returns PastDueDate when the date is not present" $
      \t -> \a -> (addTodo t Nothing (a::Int)) /= PastDueDate
    
    prop "never returns PastDueDate when the date is in the future present" $
      \t -> \a -> (addTodo t (Just (a+1)) (a::Int)) /= PastDueDate

    it "true should be true" $
      True `shouldBe` True
