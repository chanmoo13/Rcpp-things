#include <Rcpp.h>
using namespace Rcpp;

double norm( double x, double y){
  return sqrt(x*x + y*y);
}

RCPP_MODULE(mod){
  function("norm", &norm);
}