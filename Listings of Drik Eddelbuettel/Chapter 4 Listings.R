library(inline)
library(Rcpp)
library(RcppArmadillo)
library(rbenchmark)



#### Named Class ####


########## Listing 4.2 ##########

src<-'
Rcpp::NumericVector x = 
  Rcpp::NumericVector::create(
  Rcpp::Named("mean") = 1.23,
  Rcpp::Named("dim") = 42,
  Rcpp::Named("cnt") = 12);
return x;
'

fun4_2 <- cxxfunction(signature(), src, plugin = "Rcpp")
fun4_2()


########## Listing 4.3 ##########

src<-'
NumericVector x = NumericVector::create(
  _["mean"] = 1.23,
  _["dim"] = 42,
  _["cnt"] = 12
);
return x;
'

fun4_3 <- cxxfunction(signature(), src, plugin = "Rcpp")
fun4_3()





#### Named Class ####


########## Listing 4.6 ##########

src <- '
using namespace std;
IntegerVector v = IntegerVector::create(7,8,9);
vector<string> s(3);
s[0] = "x";
s[1] = "y";
s[2] = "z";
return DataFrame::create(_["a"] = v, _["b"] = s);

'
fun4_6 <- cxxfunction(signature(), src, plugin = "Rcpp")
fun4_6()


########## Listing 4.6 ##########

