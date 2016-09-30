library(inline)
library(Rcpp)
library(RcppArmadillo)
library(rbenchmark)


########## Listing 7.1, 7.2 ##########

dyn.load("Listing_7_1-2.so")
.Call("norm_wrapper", 3,4)


########## Listing 7.1, 7.2 ##########

dyn.load("Listing_7_3.so")
setClass("Uniform",
         representation( pointer = "externalptr" ))
Uniform_method <- function(name){
  paste("Uniform", name, sep = "_")
}
setMethod( "$", "Uniform", function(x, name){
  function(...) .Call(Uniform_method(name),
                      x@pointer, ...)
})
setMethod("initialize",
          "Uniform", function(.Object, ...){
            .Object@pointer <-
              .Call(Uniform_method("new"), ...)
            .Object
          })
u <- new("Uniform", 0, 10)
