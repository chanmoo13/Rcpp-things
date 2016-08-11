library(Rcpp)
library(rbenchmark)

#### Example 2 : Dataframe handling in Rcpp ####

data(iris)
sourceCpp("dataframeRcpp.cpp") ## Rcpp function ; calculating max value of Sepal.Length, Petal.length and  
                               ##                 mean value of Sepal.Width, Petal.Width    

cpp.res<-dfex(iris)
r.res<-c(max(iris$Sepal.Length),mean(iris$Sepal.Width),max(iris$Petal.Length), mean(iris$Petal.Width))

cpp.res==r.res   ## mean of Sepal.Width in Rcpp was calculated with "cumulate" function which are adding values sequentially
                 ## So the result is different with R built in function "mean"


sum=0                                    ## Now we know that two values with the same algorithm(sequential sum) are exactly same.
for(i in 1:length(iris$Sepal.Width)){
  sum=sum+iris$Sepal.Width[i]
}
seq.mean<-sum/length(iris$Sepal.Width)
seq.mean==cpp.res[2]
