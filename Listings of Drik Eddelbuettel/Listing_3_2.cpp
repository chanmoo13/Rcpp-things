#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
int fun3_2_rcpp(IntegerVector x) {
  int prod = 1;
  for (int i = 0 ; i<x.size(); i++){
    prod *= x[i];
  }
  return prod;
}
