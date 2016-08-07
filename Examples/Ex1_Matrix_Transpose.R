library(Rcpp)


#### Example 1 : Matrix Transpose Using Rcpp ####


sourceCpp("transposeRcpp.cpp")

mat<-c(1,2,3,4,5,6,7,8,9,10,11,12)
dim(mat)<-c(3,4)
mat

tmat<-transposeC(mat)
tmat
