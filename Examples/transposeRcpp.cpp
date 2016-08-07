#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericMatrix transposeC(NumericMatrix x) {
  int m = x.nrow();
  int n = x.ncol();
  NumericMatrix tx(n,m);
  for (int i = 0; i < n ; i++){
    for (int j = 0; j < m ; j++){
      tx(i,j) = x(j,i);
    }
  }
  return tx;
}


