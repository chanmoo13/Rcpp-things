library(Rcpp)
library(rbenchmark)

#### Example 1 : Matrix Transpose Using Rcpp ####


sourceCpp("transposeRcpp.cpp")

mat<-rep(c(1,2,3,4,5,6,7,8,9,10,11,12),1000*1000)
dim(mat)<-c(3000,4000)
mat

tmat<-transposeC(mat)
tmat




#### Benchmark Comparison with          ####
#### R built-in function "t" and        ####
#### R user-made function "transposeR"  ####

transposeR <- function(x){  ### User-made transpose function ( same algorithm with "transposeC" ) ###
  n<-nrow(x)
  m<-ncol(x)
  tx<-matrix(nrow=m,ncol=n)
  for(i in 1:m){
    for(j in 1:n){
      tx[i,j] = x[j,i]
    }
  }
  return(tx)
}

benchmark(transposeC(mat),t(mat), transposeR(mat),
          columns=c("test", "replications", "elapsed", "relative"), order="relative", replications = 100)


