module LibSpec where 

import Test.Hspec
import Test.Hspec.QuickCheck
import Lib

spec :: Spec
spec = do 
  describe "LibSpec" $ do
    describe "simpleAddTodo" $ do
      prop "returns no title whenever the title is empty" $ 
        \a -> \b -> (simpleAddTodo "" (a::Maybe Int) (b::Int)) == Notitle

      prop "never returns PastDueDate when the date is not present" $
        \t -> \a -> (simpleAddTodo t Nothing (a::Int)) /= PastDueDate
    
      prop "never returns PastDueDate when the date is in the future present" $
        \t -> \a -> (simpleAddTodo t (Just (a+1)) (a::Int)) /= PastDueDate

    describe "wrongTrim" $ do 
       it "should remove all spaces from a string without other characters" $
         (wrongTrim "   ") `shouldBe` ""
    
       it "should leave empty string unchanged" $
         (wrongTrim "") `shouldBe` ""
    
       it "should leave strings with characters unchanged" $
         (wrongTrim "sss") `shouldBe` "sss"
       
       it "should remove empty spaces at the beginning and end of the string while leaving the rest of the string unchanged" $
         (wrongTrim " sss  ") `shouldBe` "sss"
       
       it "should leave strings with characters and spaces in the middle unchanged (the test here says shouldNOTbe to show there is an error)" $
         (wrongTrim "s ss") `shouldNotBe` "s ss"

    describe "inefficientTrim" $ do 
       it "should remove all spaces from a string without other characters" $
         (inefficientTrim "   ") `shouldBe` ""
    
       it "should leave empty string unchanged" $
         (inefficientTrim"") `shouldBe` ""
    
       it "should leave strings with characters unchanged" $
         (inefficientTrim"sss") `shouldBe` "sss"
       
       it "should leave strings with characters and spaces in the middle unchanged, but strip those at the end" $
         (inefficientTrim"  s s  s   ") `shouldBe` "s s  s"
    
    describe "myDropWhile" $ do 
       it "should return empty list if the condtiion is never met" $
         (myDropWhile even [2,4,6,7,9,11,12,13,14]) `shouldBe` [7,9,11,12,13,14]
    



    describe "test should work" $ do 
       it "true should be true" $
         True `shouldBe` True

    describe "test should work" $ do 
       it "true should be true" $
         True `shouldBe` True
