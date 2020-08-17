# Chap2: parametric polymorphism and ADTs

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

## More general ADTs

### Polymorphic non recursive ADTs

In the first chapter we have seen how to construct arbitrary *monomorphic algebraic data types* (ie, ADTs), eg *additive* ADTs like 
```
data Spin = Up | Down 
data Colour = Red | Green | Blue 
data CardinalPoints = North | South | East | West 
...
```

or *multiplicative* ADTs (which are isomorphic to tuples, tuples are anonymous multiplicative types) like 
```
data User = User String String 
```
or the more general case like 
```
data Customer = User String String | Company String Int 
data ValidateUserResult = FirstNameMissing | LastNameMissing | InvalidAge | Success User 
```
I've omitted `deriving (Eq,Show) etc` from all the definitions of these types to remove noise, but at a practical level we almost always want to define them to be instance of `Eq` and `Show` type classes (so we can write tests for them)

ADTs are a powerful way to construct new types starting from other types. Notice that types like `Spin` above are *isomorphic* to `Bool`. Mathematically, they can "naively" be modelled by a set of two and only two distinct elements (ie, a set of cardinality 2)

In this chapter we are going to consider ADTS that are parametrically polymorphic, eg taking one or more type variables 
```
data Optional a = None | Some a
```
where `a` is a type variable. For each `a`, `Optional a` defined a different type (eg, `Optional Int` is a different type that `Optional String` or `Optional Bool`). `Optional` itself is NOT a type (it's a type constructor), for each type `a` it creates a new type called `Optional a`. 

### Monomorphic recursive ADTs

A simple monomorphic example of a recursively defined ADT is a type modelling the json format specification. A json value is defined to be either one of the four primitive json types (ie, bool, string, number and null) or one of two composite json types (ie, json object and json array, the former being a key-value map/dictionary of keys described by strings and values descrived by any json, the latter being an array of arbitrary json values). It can be represented as 
```
data JsValue = JsNull | JsBool Bool | JsString String | JsNumber Double | JsObject Map String JsValue | JsArray [JsValue] 
```

### Polymorphic recursive ADTs
The prototypical example of a polymorphic, recursively defined ADT is the list type
```
data MyList a = Empty | NonEmpty a (MyList a)
```

(Similar examples are : trees, stacks, etc)

