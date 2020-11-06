# Toy exercises in FP modelling 

Let's try to write some code on top of a simple usecase: age limit to purchase alcohol. We will start with a very simple function validating the minimum age of a user, and progressively we will expand on top. Along the jurney we will annotate some conceptually simple but powerful tips about domain modelling in FP. 

## Pure functions 

* Business logic is encoded in pure functions (as much as possible). 
* Inputs of the pure function will encode the necessary and sufficient input data that we need in order to express the business logic 
* Since we force ourselves to work with pure functions, the result of business logic is an output value. This might seem limitative, for those familiar with OOP, but surprisingly it will allow us to encode in the types a lot of information. Business logic here translates into "calculation of the output value"
* we don't care at this stage where the input data is coming from; we just express the fact that we must have such data in order to process (ie, evaluate) the business logic 


## Rules of thumb

We need to be careful in distinguishing 
* FP code
* code that uses FP concepts everywhere but that ultimately is still inspired by an imperative/OOP way of thinking

A lot can be encoded by usign just pure functions and ADTs. Instead, too often, FP code tends to abuse FP abstractions to achieve a design that suffers the same issues of imperative code. 

Examples:
* abstracting a clock behind a type class suffers the same problems of having an interface modelling your clock 
* if we use IO all over the place, that does not make our life easier in terms of managing side effects (although IO has superior ergonomics / compositional properties compared to impereative statements) 
* usage of Bool (and other basic types) instead of modelling our domain appropriately; particularly, abuse of wrapper types instead of constructive modeling

We should use type classes for ad-hoc polymorphism and algebraic lawful abstractions. We should push the usage of IO as much as possible towards the boundaries of our application because once we are in the IO context we can't leave it. We should work with pure functions as much as possible, and lift when needed, instead of writing functions in a already lifted signature; etc






