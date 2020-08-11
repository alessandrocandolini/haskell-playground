# chap1

Topics:

1. Setup a new project using stack (https://docs.haskellstack.org/en/stable/README/)
2. Intro to the project structure: cabal file, stanzas; `app`, `test` and `src` folders; short intro to Haskell modules (bare minimum to understand the strcuture of the generated project, for now)
3. Cabal: add libraries (eg, tasty for tests; Text for text) 
4. What are types? Toy model of types as mathematical sets (naive, imprecise model) 
   * cardinality of types 
   * examples of simple sets with finite cardinality (eg, set of 0 elements, set of 1 element, set of 2 elements, etc)
5. Functions between types as mathematical functions between sets; the set (ie, type) of all functions from (type/set) A to (type/set) B
6. Motivation to FP: 2+2 = 4. Pure functions and referential transparency. Equational reasoning and refactoring, locality. (For more info, read the main README.md of the repo) 
7. Few basic types (Int, Char, Bool)
8. How to assing a value to a "variable", notice that a "Variable" does not imply mutation here
9. Define simple functions in Haskell (eg, `square` or `min`, or `identity`) 
10. A note on type inference & polymorphism (Hindley-Milner type system) 
11. The `identity` function and a simple of example of the advantages of parametric polymorphism 
12. A note on curryied functions 
13. A note on constrained types, without going in depth for now (just to make sense of the type expressions) 
14. Types from other types, simple cases: additive types, multiplicative types and more general ADTs
15. A note on Haskell being not a nominal language
16. Pattern match and function definitions
17. A simple validation exercise 

The exercise will emphatise three points: 
* the role of polymorphism to delay until last minute certain implementation choices, and to emphatise exactly what kind of behaviour the business logic is relying on , via type constrains 
* usage of precise types to model the output of the function
* how IO is left out of the business logic, and the importance of distinguish the business logic/behaviour from the source of data; although at this stage this is largely due to some technical limitations around how to retrieve the system time in Haskell, even later this would force us to lift the function to an IO monad, and even at that point it's better to keep a pure business logic core 


