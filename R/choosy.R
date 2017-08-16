new_choosy <- function() {
  model <- list(
    coefs = NULL,
    formula = NULL,
    trained = FALSE
  )
  class(model) <- "choosy"
  model
}

# TODO: how to export generics
fit <- function(model, formula, data, ...) {
  UseMethod("fit")
}

predict_proba <- function(model, newdata) {
  UseMethod("predict_proba")
}

fit.choosy <- function(model, formula, data, learning_rate = 1e-3, reg = 1e-5,
                       num_iters = 100, batch_size = 200, verbose = TRUE) {

  X <- model.matrix(formula, data)
  flip <- as.formula(paste("~ 0 + ", deparse(rlang::f_lhs(formula))))
  y <- model.matrix(flip, data)

  num_classes <- dim(y)[2]
  num_feat <- dim(X)[2]

  coefs <- matrix(runif(num_classes * num_feat), ncol = num_classes)
  history <- numeric(num_iters)

  for (iter in 1:num_iters) {

    # TODO: mini-batches for stochastic gradient descent

    # TODO: implement loss and gradient functions or figure out how to call
    # softmax.py file

    loss <- softmax_loss(X, y, reg)
    grad <- softmax_grad(X, y, reg)

    history[iter] <- loss

    coefs <- coefs - learning_rate * grad

    if (verbose)
      print(glue::glue("iteration: {iter}/{num_iters}  loss: {loss}"))
  }

  model$trained <- TRUE
  model$coefs <- coefs
  model$formula <- formula
  model
}

predict_proba.choosy <- function(model, newdata) {
  if (!model$trained)
    warning("You must train a choosy model before generating predictions.",
            call. = FALSE)

  X <- model.matrix(model$formula, newdata)
  X %*% model$coefs
}

predict.choosy <- function(model, newdata) {
  probs <- predict_proba(model, newdata)
  apply(probs, 1, which.max)
}

print.choosy <- function(model) {
  # TODO: make this better
  print("A choosy object.")
}

summary.choosy <- function(model) {
  if (!model$trained)
    stop("Cannot summarize untrained model", call. = FALSE)

  # TODO: make this better
  print(model$coefs)
}