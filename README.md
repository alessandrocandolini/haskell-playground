# haskell-playground

Collection of small projects to explore conceptually and practically a number of basic topics in Haskell, particularly: 
* type-driven business and domain modelling (eg, through ADTs and pure functions, but not only), from a naive to a more structural type-informed approach
* strengths of polymorphic design (eg, theorems for free), including both parametric as well as ad-hoc polymorphism (the latter via type classes)
* stronger specifications
* principled and lawful abstractions
* basics of type level programming 

None of the above are by any means specific of Haskell or strongly statically typed FP only, and most of the approaches, ways of thinking and problem solving strategies illustrated here can be (at least conceptually) ported (to some degree) to other languages too. Well-designed strongly statically typed purely functional languages like Haskell are particularly suitable to deal with those topics though (ie, the "ergonomics" is superior). Strongly statically typed FP is also well-suited for a number of increasingly in-demand approaches to software correctness, including (but not limited to): 
* property based testing (PBT)
* compiler as a mathematical verifier, to various degrees (from basic types to eg liquid Haskell)
* propositon as types, and formal proof of correctness 

The repo will walk through a number of examples, some particularly trivial, some hopefully a bit more advanced, the material is meant to be quite introductory though. 
