# chap2

This chapter is mostly theoretical. It will build some concepts that we will leverage later: 
1. How to model optional types using parametrically polymorphic ADTs: the Maybe data type 
2. Simple functions on optional types (an exercise in pattern matching) 
2. Exaustive representation of the Json format specification using ADTs, as an example of recursive ADTs
2. Define a linked-list data structure using recursive (parametrically polymorphic) ADTs 
3. Simple (recursive) functions on lists 
4. The Haskell built-in list and some syntactic sugar 
5. Strings as [Char] 
6. More PBT on all these function properties (an exercise in looking for stronger properties and stronger specifications) 
7. Preview of what's next: lifting a function to a context and the Functor type class (but we have not discussed type classes yet, so this is just a preview of the directon we want to take)

## Parametrized ADTs

In the first chapter we have seen how to construct simple ADTs, for example purely additive ADTS
```
data Spin = Up | Down 
data Colour = Red | Green | Blue 
data CardinalPoints = North | South | East | West 
...
```

how to construct purely multiplicative types, eg 
```
data User = User String String 
```
(isomorphic to tuples, that are anonymous multiplicative types), and a mixed of them 
```
data Customer = User String String | Company String Int 
data ValidateUserResult = FirstNameMissing | LastNameMissing | InvalidAge | Success User 
```

This allows us to build types from other types. In all these examples, the types are built on top of existing, specific types. 

Here we are going to consider ADTS that are parametrically polymorphic, eg
```
data Optional a = None | Some a
```
where `a` is a type variable

