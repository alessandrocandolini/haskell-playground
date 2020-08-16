module Lib where 

myIdentity :: a -> a
myIdentity a = a

data Option a = None | Some a  deriving (Eq,Show)

data MyList a = Empty | NonEmpty a (MyList a) deriving (Eq,Show)

mymap :: (a -> b) -> MyList a -> MyList b 
mymap _ Empty = Empty
mymap f (NonEmpty head tail) = NonEmpty (f head) (mymap f tail)


myfilter :: (a -> Bool) -> MyList a -> MyList a
myfilter p Empty = Empty
myfilter p (NonEmpty head tail) | p head = NonEmpty (p head) (myfilter p tail)
myfilter p (NonEmpty head tail) = myfilter p tail

