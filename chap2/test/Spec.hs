module Spec where
import Test.Tasty
import Test.Tasty.QuickCheck 
import Lib

prop_additionCommutative :: Int -> Int -> Bool
prop_additionCommutative a b = a + b == b + a

prop_mapIdentityLeaveTheListUnchanged :: MyList Int -> Bool
prop_mapIdentityLeaveTheListUnchanged l = mymap myIdentity l == l 

