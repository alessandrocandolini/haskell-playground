# Toy exercises in FP modelling 

Let's try to write some code on top of a simple usecase: age limit to purchase alcohol. We will start with a very simple function validating the minimum age of a user, and progressively we will expand on top. Along the jurney we will annotate some conceptually simple but powerful tips about domain modelling in FP. 

## Pure functions 

* Business logic is encoded in pure functions (as much as possible). 
* Inputs of the pure function will encode the necessary and sufficient input data that we need in order to express the business logic 
* Since we force ourselves to work with pure functions, the result of business logic is an output value. This might seem limitative, for those familiar with OOP, but surprisingly it will allow us to encode in the types a lot of information. Business logic here translates into "calculation of the output value"
* we don't care at this stage where the input data is coming from; we just express the fact that we must have such data in order to process (ie, evaluate) the business logic 



