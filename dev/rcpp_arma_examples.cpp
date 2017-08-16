#include <RcppArmadillo.h>

// [[Rcpp::depends(RcppArmadillo)]]
// [[Rcpp::export]]
arma::mat matrix_multiply(arma::mat X, arma::mat Y) {
  return X * Y;
}

//
// // [[Rcpp::depends(RcppArmadillo)]]
// // [[Rcpp::export]]
// arma::vec max_by_row(arma::mat X) {
//   // TODO
// }
//
// // [[Rcpp::depends(RcppArmadillo)]]
// // [[Rcpp::export]]
// arma::mat broadcast_subtraction_across_rows(arma::mat X, arma::vec v) {
//   // TODO
// }
//
// // [[Rcpp::depends(RcppArmadillo)]]
// // [[Rcpp::export]]
// arma::mat broadcast_division_across_rows(arma::mat X, arma::vec v) {
//   // TODO
// }

/*** R
X <- matrix(runif(20), ncol = 4)  # 5 by 4 matrix
Y <- matrix(runif(12), ncol = 3)  # 4 by 3 matrix

matrix_multiply(X, Y)  # expect this to be 5 by 3

# HA IT WORKS TAKE THAT RCPP HERE WE COME
*/
