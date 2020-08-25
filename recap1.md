
# Brief recap of few strategies in typed FP 

We want to mathematically model types as sets (naively speaking). A type is just a "bag" of values. 

## How to bake ADTs. 

Additive ADTS, 
```
data Bool = True | False 
data Direction = Right | Left 
data Spin = Up | Down
data Colour = Red | Blue | Green 
```

Cardinality of types, ie, number of different values a type can have. Eg, Bool has cardinality 2, colour has cardinality 3, etc. 

Multiplicative types 
```
data User = User String String
```

More genrally 
```
data Result = Error String | Success User 
```

We can generalise this in various ways:
* parametric polymorphism and ADTs, ie, `
```
data Result a e = Error e | Success a 
data Maybe a = Nothing | Just a 
```
* they can be recursively defined 
```
data JsValue = JsNull | JsString String | JsNumber Double | JsBool Bool | JsArray [JsValue] | JsObject (Map String JsValue)
data List a = Empty | NonEmpty a (List a) 
```

## How polymorphism can help 

```
identity :: Integer -> Integer 
identity x = 0 -- wrong!!
identity x = x +1  -- wrong too!!

identity :: a -> a 
identity x = x 
```

Remeber the exercise with dates for another example of how polymorphism can help focusing on BL rather than implementation details. And you can capture your BL requirements into type constrains. 

We will expand on this later 

### Error handling 

Option -1: 

```
head :: [Int] -> Int

head [] = -1 -- very bad idea , using values to describe error / invalid scenarios , because there are indistinguishable from happy path cases  
head (head : _) = head 

```

If you turn on polymorphism you can eliminate option -1 

Option 0 : exceptions, ie, enriching the output set, but in a type unsafe way (exceptions are runtime behaviour) 

```
head :: [a] -> a

head [] = ??? -- throwing ?!
head (head : _) = head 

```

Option 1: 
realising that the signature is not appropriate, it's a lie, i can't pretend to always return a value of type `a` for every `[a]`
```
head :: [a] -> Maybe a 

head [] = Nothing 
head (head : _) = Just head 

```
This is type safe. 



Option 2: 
```
data NonEmptyList a = NonEmptyList a [a]

head :: NonEmptyList a -> a 
head (NonEmptyList h _) = h 

```
