# chap3 - Typeclasses

## Motivation: parametric vs ad-hoc polymorphism 

So far we have lenghtly discussed what is *parametric polymorphism*. To quickly recap, let's look again at definitions of data types like  
```
data Maybe a = Nothing | Just a 
```
or 
```
data List a = Empty | Cons a (List a)
```
or functions like 
```
length :: [a] -> Integer
map :: ( a -> b ) -> [a] -> [b]
filter :: ( a -> Bool ) -> [a] -> [a] 
```
Those definitions are parametrised over arbitrary type variables (eg, `a` , `b`, etc). It does not matter what the actual type will be, for all types the implementation will be exactly the same. We can define/implement it once, and apply it to any arbitrary type. The definition/implementation is shared across all the types. 

Consider instead functions like structural equality 
```
isEqual :: a -> a -> Bool 
```
or some "generic" function to serialise/deserialise to/from json 
```
fromJson :: Json -> Option[a]
toJson :: a -> Json 
```
Although the signature and the general idea of these functions can be stated for arbitrary types, the actual implementation differs for each actual type. This is called *ad hoc polymorphism*, because although the signature reads polymorphic, the actual implementation is custom for each specific type. 

For example, structural equality between `Bool`s, namely
```
isBoolEqual :: Bool -> Bool -> Bool 
isBoolEqual True True = True
isBoolEqual False False = True
isBoolEqual _ _ = False -- alternatively, we can match exaustively on the remaining two cases, to make the cases orthogonal and the pattern match would become order-insensitive 
```
is clearly not the same as structural equality between Chars, Integers etc 

In addition, there are types for which functions like `isEqual` don't have a meaningful implementation (not in Haskell at least), eg, what would be `isEqual` for a function type?

We need a way to link a polymorphic type signature to the actual implementation of that function for some specific type. We need to find a way to say that `isBoolEqual` provides an implementation of `isEqual` when the type is `Bool`. 

Conversely, sometimes we want to find a way to extract and express the fact that a moltitude of ad-hoc, monomorphic functions share a common structure (although the details of the implementation differs). For example, the following functions 
```
mapMaybe :: (a->b) -> Maybe a -> Maybe b 
mapMaybe _ Nothing = Nothing 
mapMaybe f (Maybe a) = Just (f a) 
```
and 
```
mapList :: (a->b) -> List a -> List b 
mapMaybe _ [] = [] 
mapMaybe f (head:tail) = (f head) : (mapList f tail) 
```
have clearly a common structure, they "lift" a fully polymorphic function `a->b` to a function `Maybe a -> Maybe b` and `List a -> List b` respectively. Is there a way in which we can "group together" under the same umbrella those two functions (and other ones following a similar structure/pattern)? Is there a way to highlight and encode the commonalities between these implementations? 

The general topic in OOP is typically addressed by using sub-typing and virtual functions dispatching: the method is added to a basic class, and all classes that inherits from it can provide their customised implementation (eg, if you are familiar with Java, every `Object` has a method `equals` and at runtime the one corresponding to the particular class is picked up). The downside of this approach is that it's not type safe. 

In Haskell, parametric polymorphism is deeply rooted in the Hindley-Milner type system (which gives astonishing, non-local type inference on generic types); ad-hoc polymorphism is achieved by extending the Hindley-Milner type system with **type classes**. 

## Syntax for type classes and basic examples (Eq, Show, etc) 

TBC 

## Contextual abstractions in other languages 

* Type classes vs Scala 2 implicits 
* Type classes vs Scala 3/dotty  built-in support for type classes (given/using syntax)
* The example of multiversal equality in dotty 
* Status of type classes proposal in Kotlin https://github.com/Kotlin/KEEP/pull/87 and usage of type classes in OOP to achieve compile-time automatic DI 


## Further readings 

The following section does not aim at being comprehensive. It's to suggest some readings that i find particularly inspiring. 

It's a pleasure to read the original paper from Philip Wadler & Stephen Blott "how to make ad-hoc polymorphism less ad hoc" (1998) where type classes where first proposed. It's a highly recommended superb paper, it's downloadable eg from: 
* https://people.csail.mit.edu/dnj/teaching/6898/papers/wadler88.pdf

The work of Simon Peyton Jones, Mark Jones and Erik Meijer (one of my heros!) in "Type Classes: An Exploration of the Design Space" (1997) is also quite inspirational despite being written more than 20 years ago: 
* https://www.researchgate.net/publication/2795043_Type_Classes_An_Exploration_of_the_Design_Space


## What's next?

* Functor hierarchy of type classes
* type classes for json serialization/deserialization
* automatic derivation of type classes using generics 
* etc






