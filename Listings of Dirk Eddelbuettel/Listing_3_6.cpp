#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double ssc(NumericVector x, double n) {
  double sum = 0.0;
  for(int i = 0 ; i<x.size() ; i++){
    sum += pow(x[i],n);
  }
  return sum;
}

