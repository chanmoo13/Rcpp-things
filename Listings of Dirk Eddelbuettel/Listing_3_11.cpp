#include <Rcpp.h>
#include <cmath>
using namespace Rcpp;
using namespace std;

// [[Rcpp::export]]
NumericMatrix sqrtc(NumericMatrix x) {
  NumericMatrix res = clone(x);
  transform(res.begin(), res.end(), res.begin(), ::sqrt);
  return res;
}
