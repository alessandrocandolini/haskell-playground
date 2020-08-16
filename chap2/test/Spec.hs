module Spec where
import Test.Tasty
import Test.Tasty.QuickCheck 
import Lib

prop_additionCommutative :: Int -> Int -> Bool
prop_additionCommutative a b = a + b == b + a

-- prop_mapIdentityLeaveTheListUnchanged :: MyList Int -> Bool
-- prop_mapIdentityLeaveTheListUnchanged l = mymap myIdentity l == l 

prop_filter_idempotent:: Fun Int Bool -> [Int] -> Bool
prop_filter_idempotent (Fun _ p) l = filter p (filter p l) == filter p l  

prop_filter_empty:: Fun Int Bool -> [Int] -> Bool
prop_filter_empty (Fun _ p) l = filter p (filter (not.p)  l) == []

prop_map_identity:: [Int] -> Bool
prop_map_identity l = map myIdentity l == l 

prop_map_length_preserving :: Fun Int String -> [Int] -> Bool
prop_map_length_preserving (Fun _ f) l = length (map f l) == length l
