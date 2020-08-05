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

## Motivations to FP

My assumption: 
* Writing correct software is hard, no matter what, even in simple cases. Correct here means software "that works" (tautology), ie, software that does what we were expecting it to do, software that behaves according to some expectations, based on some either formal or more often informal or unexisting specification. 
* Writing correct software in real life is even harder, where correctness has also to take into account limited resources, limited amount of time, speed on the marker, pre-existing legacy code, sync or async interation with other systems and/or 3rd party systems and/or libraries and frameworks, about whose behaviour we are not always sure, and where correctness might be trade for other business priorities (eg, we might need to build a system on top of existing code that is known to have issues in the backlog, or we might need to deliberately ignore certain known edge cases) 
* Writing correct software with in presence of failures it's even more harder, when you assume that every step could fail, that you might still want to fail gracefully, and protect any database state from remaining permanently in a corrupted state. 

At the same time, complexity of softare is growing and businesses and users are looking for higher standard of correctness. 

Imprecisely speaking, imperative programming is an approach of writing code that emphatise an operational thinking. The code resolves to a sequence of commands/actions/statements tp be executed. The behaviour of the software is encoded in a number of instructions, that once executed are supposed to produce the correct result in the end (not necessary in a given order; not necessarily sequentially; parallelism and concurrency are also possible). We tell the program exactly what to do, by defining steps: "do this", "do that" . Locally, the instructions can be easy, it's harder though to get the full picture. The operational nature of imperative programming makes us thinking about software in a operational way too. So, often to understand how the code works we need to follow the steps in our mind, and/or enable a debugger, and/or follow strictly the implementation details. Metaphorically, it's kind of preparing a pizza by following the steps in the recipe. Imperative programming is "GOTO" on stereoids. 

FP takes a different approach: use mathematics to model computer programs. This would allow us to use mathematics to reason about computer programs, to establish properties of computer programs, etc. This is not too far from the interplay between experimental and theoretical physics: ultimately, physics attempts at describing reality in some way, but intuition and visualisation have proven to be not always that successful in helping us doing this (quantum mechanics and general relativity being notorious examples of this failure) and ultimately it has turned out that mapping reality (whatever reality means here) to a mathematical model of it is an enabled to unlock new ways of thinking about it, and to establish new properties that can be later compare to results of actual experiments (ie, at runtime).  

Far from me advertising FP in a dogmatic way. FP does not pretend to be the panacea for all the problems of software engineering. 
As everything, FP has its own pros and cons. But i believe it's important to be exposed to such way of reasoning about computer systems, and have it in our toolkit of weapons for when we will face a problem for which FP is the winner. It's always good to be able to see the same problem for diffent angles. Anyone familiar with something like for example SQL should know the benefits of a declarative language that "hides" some of the implementation details and execution steps behind a higher level mathematically-inspired query language, as well as some of the pratical drawbacks of this (eg, trying to reverse engineering how the query optimiser is planning to run certain queries, and how to hammer a different behaviour when squeezing the performance for an ad-hoc scenario to the extreme becomes a must). 
