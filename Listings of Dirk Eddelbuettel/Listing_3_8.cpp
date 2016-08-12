#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector logcpp(NumericVector x) {
  NumericVector res = clone(x);
  for(int i=0 ; i<x.size() ; i++){
    res[i] = log(x[i]);
  }
  return res;
}

