#include <math.h>
#include <Rcpp.h>
using namespace std;
using namespace Rcpp;

double norm(double x, double y){
  return sqrt( x*x + y*y );
}

RcppExport SEXP norm_wrapper(SEXP x_, SEXP y_){
  double x = as<double>(x_), y = as<double>(y_);
  double res = norm(x, y);
  return wrap(res);
}