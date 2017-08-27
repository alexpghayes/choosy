# http://timvieira.github.io/blog/post/2017/04/21/how-to-test-gradient-implementations/

norm <- function(x) {
  sqrt(sum(x^2))
}

std_mvn <- function(n) {
  sample <- rnorm(n)
  sample / norm(sample)
}

fd_directional_deriv <- function(f, x, eps = 1e-5, direction, ...) {
  (f(x + eps * d, ...) - f(x - eps * d, ...)) / (2 * eps)
}

fd_check <- function(f, df, x, eps = 1e-5, num_checks = NULL, tol = 1e-6, ...) {

  dim <- length(x)

  if (is.null(num_checks))
    num_checks <- dim

  for (check in num_checks) {
    dir <- std_mvn(dim)

    fd <- fd_directional_deriv(f, x, eps, dir, ...)
    analytical <- sum(df(x, ...) * dir)              # dot prod

    diff <- fd - analytical
    rel_diff <- abs(diff) / abs(fd)

    # uhhhh, this needs to be better
    if (rel_diff > tol)
      warning("Issue.")
  }
}
