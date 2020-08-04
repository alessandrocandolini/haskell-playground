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
     testCase "if title is empty, return error" $ validate (Todo "" 2) @?= EmptyTitle,
     testProperty "if title is not empty, don't return empty title error" $ \x -> x /= "" ==> validate (Todo x 2) /= EmptyTitle

   ]


-- stack test --ta "-p <pattern>" 
