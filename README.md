[![Simple Haskell](https://www.simplehaskell.org/badges/badge.svg)](https://www.simplehaskell.org)

# A taste of Haskell 

A touristic tour in the land of strongly statically-typed purely functional programming, using the Haskell programming language, with emphasis on: 
* the alchemy of types: Haskell is a furnace of types, it's a great laboratory to learna about type-driven development, how to do business, domain and system modelling through types, and how to use types to explore the resulting model and to reason about it (eg, through ADTs and pure functions, but not only)
* strengths of polymorphic design (eg, theorems for free), including parametric, ad-hoc (via type classes) and structural (ie, the `generics` Haskell extension) polymorphism
* how to reason in terms of stronger specifications
* principled and lawful abstractions (eg, monadic and other "category theory inspired" laws, but not only)
* having fun with type-level programming (moderately :D )
* practical advantages of modelling effects as values; description vs interpretation (aka runtime execution) of effects; challenges with implementing sequential effects in a lazy language and how to bake an IO monad and how to use is more generally to express side-effectful code in FP

None of the above are by any means specific of Haskell particularly, or strongly statically typed FP in general; indeed, most of the ideas, ways of thinking and problem solving strategies described here can be ported (at least conceptually, at least to a certain degree) to other programming languages too. Not just that: several of these ideas are (slowly) percolating to more mainstream, industrial, and primarily imperative languages (eg, kotlin, swift); even Java has started to adopt some functional concepts (although their realisation in Java is probably questionable from a more purist viewpoint). Well-designed strongly statically typed purely functional languages like Haskell are particularly suited to deal with those topics though (ie, the "ergonomics" is superior). Strongly statically typed FP is also well-suited for a number of increasingly in-demand approaches to software correctness, including (but not limited to): 
* property based testing (PBT)
* compiler as a mathematical verifier, to various degrees (from basic types to eg liquid Haskell)
* propositon as types, and formal proof of correctness (we are not gonna be talking about formal methods in this context, but if you are familiar with Scala you might be interested in this other playground https://github.com/alessandrocandolini/stainless-playground ) 

No previous knowledge of Haskell or FP is needed, the material is self-contained and starts from scratch. 
The approach is to try to bridge theory and practise. From a pragmatic viewpoint, most of the early benefits that can be achieved without an in-depth knowledge of the Haskell syntax are around "reasoning" about the code. Attempts to model the domain precisely in terms of types will force us to think carefully about the domain itself, will surface corner cases even before running the tests, will guide us to make impossible in the code scenarios that should never occur in reality but that a badly designed code might still make possible to happen for mistake at runtime (eg, making "illegal states unrepresentable", to use a phrase from Yaron Minsky, see https://blog.janestreet.com/effective-ml-revisited/)

The repo will walk through a number of examples, some particularly trivial, some hopefully a bit more advanced, the material is meant to be quite introductory though.
Towards the final chapters, we will see how libraries like `servant` will allow us to design a fully-typed API contract (at the type level!) and generate server, client and documentation from that description. This will also allow us to use PBT (eg, `servant-quickcheck`) to establish strong properties of our server (eg, it should never return 500). 

 
## Motivations to FP

Imprecisely speaking, imperative programming is an approach of writing code that emphatise an *operational* thinking. The code resolves to a sequence of commands/actions/statements to be executed. The behaviour of the software is encoded in a number of instructions, that once executed are supposed to produce the correct result. In other words, we tell the program exactly what to do, by defining steps: "do this", "do that" . 

If you look at each instruction individually, locally, the instruction typically make sense. The single instruction per se looks clear, easy to read, easy to implement, easy to understand what's going on, easy to code, easy to teach. 
The problem comes when we want/need to understand the non-local implications of the local choices. 
Operational thinking does not allow local reasoning. 
That's where the interpretation of the code becomes less trivial. 
Each local instruction has to be contextualise, you need to have  typically the steps that happened before and how this instruction will influence the steps after. 
It's complicated to get the full picture just by looking at the local instructions individually. 

The operational nature of imperative programming makes us thinking about software in a operational way too. In order to understand how the code works, often we find ourselves tracing the usages of methods with an IDE, jumping from one function to another trying to follow the path in the code, or trying to replicate the runtime behaviour by imagining the steps in our mind, and/or by enabling a debugger, etc. Metaphorically, it's kind of preparing a pizza by following the steps in the recipe, sometimes without even knowing what we are trying to cook until we see the final result (or until we manage to "calculate" the result by executing the code in our mind). Imperative programming as a whole is essentially just "GOTO" on stereoids (ie, despite goto being replaced by higher abstractions like for loops, and methods, and classes on top, the overall way of approaching code it's still foundamentally the same). Compare this instead to something like 2+2 = 4, which is true regardless of at which point in time this result gets calculated. The point of FP is to try to build entire programs on top of building blocks that behave in a safe, reliable, deterministic, predictable way like 2+2=4 (we will see that this property is called "referential transparency" and it unlocks powerful refactoring techniques and ways of reasoning about the code, like eg equational reasoning). 

More generally, FP takes a different approach: use mathematics to model computer programs. This would allow us to use mathematics to reason about computer programs, to establish properties of computer programs, etc. This is not too far from the interplay between experimental and theoretical physics: ultimately, physics attempts at describing reality in some way, but intuition and visualisation have proven to be not always that successful in helping us doing this (quantum mechanics and general relativity being notorious examples of this failure) and ultimately it has turned out that mapping reality (whatever reality means here) to a mathematical model of it is an enabled to unlock new ways of thinking about it, and to establish new properties that can be later compare to results of actual experiments (ie, at runtime).  

Far from me advertising FP in a dogmatic way. FP does not pretend to be the panacea for all the problems of software engineering. 
As everything, FP has its own pros and cons. But i believe it's important to be exposed to such way of reasoning about computer systems, and have it in our toolkit of weapons for when we will face a problem for which FP is the winner. It's always good to be able to see the same problem for diffent angles. Anyone familiar with something like for example SQL should know the benefits of a declarative language that "hides" some of the implementation details and execution steps behind a higher level mathematically-inspired query language, as well as some of the pratical drawbacks of this (eg, trying to reverse engineering how the query optimiser is planning to run certain queries, and how to hammer a different behaviour when squeezing the performance for an ad-hoc scenario to the extreme becomes a must). 

## A note on the Scala programming language 

I love Scala, I personally think it's a great, modern language. 
It has support for a lot of FP ideas, while offering at the same time the possibility to explore the interplay between FP and OOP (which IMO has yet to be fully understood and appreciated, and it's still a topic under active research both in academia and industry). Dotty/Scala3 comes with even more intriguing ideas to experiment with. Not to mention that, from a pragmatic viewpoint, the interoperability with Java might occasionally make your life easier, when it comes to reuse certain existing libraries, for which a production-ready Scala-first alternative is not available yet (TBH, the ecosystem has definitely grown a lot in the last decade or so, but sometimes it might still happen that a mature library for a particular task is missing). However, from the purpose of explaining the topics above, I think Haskell does a better job because of the superior type inference on parametric types, the syntax without noise, and in general because of its more purist viewpoint. 

OCaml etc are also valid alternatives, but here the focus is on Haskell. 
