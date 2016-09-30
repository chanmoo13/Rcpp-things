#include <iostream>
#include <Rcpp.h>
using namespace std;
using namespace Rcpp;

class Uniform{
public:
  Uniform(double min_, double max_) :
    min(min_), max(max_) {}
  
  NumericVector draw(int n){
    RNGScope scope;
    return runif(n, min, max);
  }
private:
  double min, max;
};

RcppExport SEXP Uniform_new(SEXP min_, SEXP max_){
  double min = as<double>(min_), max = as<double>(max_);
  Rcpp::XPtr<Uniform> ptr(new Uniform(min, max), true);
  return ptr;
}

RcppExport SEXP Uniform_draw(SEXP xp, SEXP n_){
  Rcpp::XPtr<Uniform> ptr(xp);
  int n = as<int>(n_);
  NumericVector res = ptr->draw(n);
  return res;
}