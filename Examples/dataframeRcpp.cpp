#include <Rcpp.h>
using namespace Rcpp;
using namespace std;

// [[Rcpp::export]]
NumericVector dfex(DataFrame df) {
  
  Function max("max");
  Function mean("mean");
  
  NumericVector a = df["Sepal.Length"];
  NumericVector b = df["Sepal.Width"];
  NumericVector c = df["Petal.Length"];
  NumericVector d = df["Petal.Width"];
  
  double slmax = *max_element(a.begin(), a.end());
  double swmean = accumulate(b.begin(), b.end(), 0.0)/ b.size();
  
  double plmax = as<double>(max(c));
  double pwmean = as<double>(mean(d));

  NumericVector res = NumericVector::create(_["Sepal.Length.max"] = slmax, _["Sepal.Width.mean"] = swmean, _["Petal.Length.max"] = plmax, _["Petal.Width.mean"] = pwmean);
  return res;
}

