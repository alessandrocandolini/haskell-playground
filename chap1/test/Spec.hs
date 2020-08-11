module Main where
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import Data.Text.Arbitrary
import Lib

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" 
   [ 
     testCase "if title is empty, return error" $ 
             validate (Event "" 2) 3 @?= EmptyTitle,

     testProperty "never return EmptyTitle error when the title is not the empty string " $ 
             \ x -> x /= "" ==> validate( Event x 3) 2 /= EmptyTitle,

     testProperty "if return EmptyTitle then title must be empty when the title is not the empty string " $ 
             \x -> validate (Event x 2 ) 3 /= EmptyTitle  ==> x /= ""
   ]


-- stack test --ta "-p <pattern>" 
