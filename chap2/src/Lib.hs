module Lib where 

myIdentity :: a -> a
myIdentity a = a

data Option a = None | Some a  deriving (Eq,Show)

data MyList a = MyEmpty | MyNonEmpty a (MyList a) deriving (Eq,Show)

mymap :: (a -> b) -> MyList a -> MyList b 
mymap _ MyEmpty = MyEmpty
mymap f (MyNonEmpty head tail) = MyNonEmpty (f head) (mymap f tail)

myfilter :: (a -> Bool) -> MyList a -> MyList a
myfilter _ MyEmpty = MyEmpty
myfilter p (MyNonEmpty head tail) 
  | p head = MyNonEmpty head (myfilter p tail) 
  | otherwise =  myfilter p tail


