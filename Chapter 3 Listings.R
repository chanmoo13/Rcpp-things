library(inline)
library(Rcpp)
library(RcppArmadillo)
library(rbenchmark)



#### IntegerVector : Example 1 ####


########## Listing 3.1 ##########

src <- '
Rcpp::IntegerVector epn(4);
epn[0] = 6;
epn[1] = 14;
epn[2] = 496;
epn[3] = 8182;
return epn;
'

fun3_1 <- cxxfunction(signature(), src, plugin="Rcpp")

str(fun3_1())





#### IntegerVector : Example 2 ####


########## Listing 3.2 ##########

src <- '
Rcpp::IntegerVector vec(vx) ;                  //IntegerVector vec = as<IntegerVector>(vx)  <-- Same code
int prod = 1;
for (int i=0 ; i<vec.size() ; i++){
prod *= vec[i];
}
return Rcpp::wrap(prod);
'

fun3_2 <- cxxfunction(signature(vx = "integer"), src, plugin = "Rcpp")

fun3_2(1:10)

prod(1:10)



sourceCpp("ls3-2.cpp") ### using "sourceCpp" function and "// [[Rcpp::export]]"

fun3_2_rcpp(1:10)


########## Listing 3.3 ##########

src<-'
Rcpp::IntegerVector vec(vx);
int prod = std::accumulate(vec.begin(), vec.end(), 1, std::multiplies<int>());
return Rcpp::wrap(prod);
'

fun3_3 <- cxxfunction(signature(vx="integer"), src, plugin="Rcpp")
fun3_3(1:10)


########## prod function benchmark comparison ##########

benchmark(fun3_2(1:10), prod(1:10), fun3_2_rcpp(1:10), fun3_3(1:10),
          columns=c("test", "replications", "elapsed", "relative"), order="relative", replications = 10000)





#### NumericVector : Example 1 ####


########## Listing 3.6 ##########

src<-'
Rcpp::NumericVector vec(vx);                  // IntegerVector vec = as<IntegerVector>(vx);  <-- same code
double p = Rcpp::as<double>(dd);              // double p(dd);  <-- NOT the same code
double sum = 0.0;
for(int i=0 ; i<vec.size() ; i++){
sum += pow(vec[i], p);
}
return Rcpp::wrap(sum);
'
fun3_6 <- cxxfunction(signature(vx = "numeric", dd = "numeric"), src, plugin = "Rcpp")

fun3_6(1:4,2)


########## sum of square function benchmark comparison ##########

ss <- function(v,n){
  sum = 0
  k = length(v)
  for(i in 1:k){
    sum = sum+v[i]^n
  }
  return(sum)
}

benchmark(fun3_6(1:10000,2), ss(1:10000,2), 
          columns=c("test", "replications", "elapsed", "relative"), order="relative", replications = 10000)


sourceCpp("Listing_3_6.cpp")
ssc(1:4,2)

benchmark(ssc(1:10,2),fun(1:10,2), ss(1:10,2), columns=c("test", "replications", "elapsed", "relative"), order="relative", replications = 10000)


########## Listing 3.7 ##########

src<-'
Rcpp::NumericVector invec(vx);
Rcpp::NumericVector outvec(vx);
for(int i=0 ; i<invec.size() ; i++){
outvec[i] = log(invec[i]);
}
return outvec;
'

fun <- cxxfunction(signature(vx = "numeric"), src, plugin = "Rcpp")
x<-seq(1.0,3.0,by=1)

x
cbind(x,fun(x))


########## Listing 3.8 ##########

src<-'
Rcpp::NumericVector invec(vx) ;
Rcpp::NumericVector outvec = Rcpp::clone(vx) ;
for(int i=0 ; i<invec.size() ; i++){
outvec[i] = log(invec[i]) ;
}
return outvec;
'

fun <- cxxfunction(signature(vx = "numeric"), src, plugin = "Rcpp")
x <- seq(1.0, 3.0, by = 1)
cbind(x, fun(x))


########## Listing 3.9 ##########

src<-'
Rcpp::NumericVector invec(vx);
Rcpp::NumericVector outvec = log(invec);
return outvec;
'

fun<-cxxfunction(signature(vx = "numeric"), src, plugin = "Rcpp")
x <- seq(1.0, 3.0, by = 1)
cbind(x,fun(x))


########## Listing 3.11 ##########

src<-'
Rcpp::NumericMatrix mat = Rcpp::clone<Rcpp::NumericMatrix>(mx);
std::transform(mat.begin(), mat.end(), mat.begin(), ::sqrt);
return mat;
'

fun <- cxxfunction(signature(mx = "numeric"), src, plugin = "Rcpp")
orig <- matrix(1:9,3,3)
fun(orig)