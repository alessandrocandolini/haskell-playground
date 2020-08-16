module Spec2 where
import Test.Tasty
import Test.Tasty.QuickCheck 
import Test.Tasty.HUnit
import Lib

unit_myconcat = myconcat x y @?=  z where 
  x :: MyList Integer
  x = MyNonEmpty 2 MyEmpty
  y :: MyList Integer
  y = MyNonEmpty 1 MyEmpty
  z :: MyList Integer
  z = MyNonEmpty 2 (MyNonEmpty 1 MyEmpty)
