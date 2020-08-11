# haskell-playground

A tour of some basic topics in strongly statically-typed purely functional programming, illustrated using the Haskell programming language, particularly with emphasis on: 
* type-driven business and domain modelling (eg, through ADTs and pure functions, but not only), from a naive to a more structural type-informed approach
* strengths of polymorphic design (eg, theorems for free), including parametric, ad-hoc (via type classes) and structural (ie, the `generics` Haskell extension) polymorphism
* how to reason in terms of stronger specifications
* principled and lawful abstractions (eg, monadic laws, but not only)
* basics of type-level programming 

None of the above are by any means specific of Haskell particularly, or strongly statically typed FP in general; indeed, most of the ideas, ways of thinking and problem solving strategies described here can be ported (at least conceptually, at least to a certain degree) to other programming languages too. Well-designed strongly statically typed purely functional languages like Haskell are particularly suited to deal with those topics though (ie, the "ergonomics" is superior). Strongly statically typed FP is also well-suited for a number of increasingly in-demand approaches to software correctness, including (but not limited to): 
* property based testing (PBT)
* compiler as a mathematical verifier, to various degrees (from basic types to eg liquid Haskell)
* propositon as types, and formal proof of correctness 

The approach will try to bridge theory and practise. From a pragmatic viewpoint, most of the early benefits that can be achieved without an in-depth knowledge of the Haskell syntax are around "reasoning" about the code. Attempts to model the domain precisely in terms of types will force us to think carefully about the domain itself, will surface corner cases even before running the tests, will guide us to make impossible in the code scenarios that should never occur in reality but that a badly designed code might still make possible to happen for mistake at runtime. 

The repo will walk through a number of examples, some particularly trivial, some hopefully a bit more advanced, the material is meant to be quite introductory though.
Towards the final chapters, we will see how libraries like `servant` will allow us to design a fully-typed API contract (at the type level!) and generate server, client and documentation from that description. This will also allow us to use PBT (eg, `servant-quickcheck`) to proof strong properties of our server (eg, it should never return 500). 

 
## Motivations to FP

My assumption: 
* Writing correct software is hard, no matter what, even in simple cases. Correct here means software "that works" (tautology), ie, software that does what we were expecting it to do, software that behaves according to some expectations, based on some either formal or more often informal or unexisting specification. 
* Writing correct software in real life is even harder, where correctness has also to take into account limited resources, limited amount of time, speed on the marker, pre-existing legacy code, sync or async interation with other systems and/or 3rd party systems and/or libraries and frameworks, about whose behaviour we are not always sure, and where correctness might be trade for other business priorities (eg, we might need to build a system on top of existing code that is known to have issues in the backlog, or we might need to deliberately ignore certain known edge cases) 
* Writing correct software with in presence of failures it's even more harder, when you assume that every step could fail, that you might still want to fail gracefully, and protect any database state from remaining permanently in a corrupted state. 

At the same time, complexity of softare is growing and businesses and users are looking for higher standard of correctness. 

Imprecisely speaking, imperative programming is an approach of writing code that emphatise an operational thinking. The code resolves to a sequence of commands/actions/statements tp be executed. The behaviour of the software is encoded in a number of instructions, that once executed are supposed to produce the correct result in the end (not necessary in a given order; not necessarily sequentially; parallelism and concurrency are also possible). We tell the program exactly what to do, by defining steps: "do this", "do that" . Locally, the instructions can be easy, it's harder though to get the full picture. The operational nature of imperative programming makes us thinking about software in a operational way too. So, often to understand how the code works we need to follow the steps in our mind, and/or enable a debugger, and/or follow strictly the implementation details. Metaphorically, it's kind of preparing a pizza by following the steps in the recipe. Imperative programming is "GOTO" on stereoids. 

FP takes a different approach: use mathematics to model computer programs. This would allow us to use mathematics to reason about computer programs, to establish properties of computer programs, etc. This is not too far from the interplay between experimental and theoretical physics: ultimately, physics attempts at describing reality in some way, but intuition and visualisation have proven to be not always that successful in helping us doing this (quantum mechanics and general relativity being notorious examples of this failure) and ultimately it has turned out that mapping reality (whatever reality means here) to a mathematical model of it is an enabled to unlock new ways of thinking about it, and to establish new properties that can be later compare to results of actual experiments (ie, at runtime).  

Far from me advertising FP in a dogmatic way. FP does not pretend to be the panacea for all the problems of software engineering. 
As everything, FP has its own pros and cons. But i believe it's important to be exposed to such way of reasoning about computer systems, and have it in our toolkit of weapons for when we will face a problem for which FP is the winner. It's always good to be able to see the same problem for diffent angles. Anyone familiar with something like for example SQL should know the benefits of a declarative language that "hides" some of the implementation details and execution steps behind a higher level mathematically-inspired query language, as well as some of the pratical drawbacks of this (eg, trying to reverse engineering how the query optimiser is planning to run certain queries, and how to hammer a different behaviour when squeezing the performance for an ad-hoc scenario to the extreme becomes a must). 
