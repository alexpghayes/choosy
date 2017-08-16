#include <RcppArmadillo.h>

// [[Rcpp::depends(RcppArmadillo)]]
// [[Rcpp::export]]
arma::mat softmax_grad(arma::mat coefs, arma::mat X, arma::mat y, float reg) {

  return coefs;

  // TODO

  // vectorized python looks like:

  //   prod_mat = X.dot(theta)
  //   max_by_row = np.amax(prod_mat, axis = 1)
  //   safe_exp = np.exp(prod_mat - max_by_row.reshape(-1, 1))
  //
  //   probs = safe_exp / np.sum(safe_exp, axis = 1).reshape(-1, 1)
  //
  //   grad = (-X.T.dot(one_hot - probs) + float(reg) * theta) / m
  //
  //   J = (np.trace(prod_mat[:,y]) - max_by_row.sum() - np.sum(np.log(np.sum(safe_exp, axis = 1)))) / -m + \
  //     0.5* reg / m * np.sum(theta * theta)
  //
  //   return coefs;
  // }

}