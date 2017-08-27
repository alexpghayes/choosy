new_choosy <- function() {
  model <- list(
    coefs = NULL,
    formula = NULL,
    trained = FALSE,
    objective = NULL
  )
  class(model) <- "choosy"
  model
}

fit <- function(model, formula, data, ...) {
  UseMethod("fit")
}

predict_proba <- function(model, newdata) {
  UseMethod("predict_proba")
}

# response should be 1-indexed integer

fit.choosy <- function(model, formula, data, learning_rate = 1e-3, reg = 1e-5,
                       num_iters = 100, batch_size = 200, verbose = TRUE) {

  response <- all.vars(formula)[1]
  y <- data[[response]]

  if (!is.integer(y))
    stop("Response variable must be integers 1...num_classes.", call. = FALSE)

  X <- model.matrix(formula, data)
  y <- y - 1                        # python zero indexed

  num_classes <- max(y) + 1
  num_feat <- dim(X)[2]

  coefs <- matrix(runif(num_classes * num_feat), ncol = num_classes)
  history <- numeric(num_iters)

  py_code <- py_run_file("./resources/softmax_grad_loss.py")

  for (iter in 1:num_iters) {

    # TODO: mini-batches for stochastic gradient descent

    loss_grad <- py_code$loss_grad(coefs, X, y, reg)

    loss <- loss_grad[[1]]
    grad <- loss_grad[[2]]

    history[iter] <- loss

    coefs <- coefs - learning_rate * grad

    if (verbose && iter %% 100 == 0)
      print(glue::glue("iteration: {iter}/{num_iters}  loss: {loss}"))
  }

  model$objective <- history
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

####################################################3

library(nnet)
data(iris)

fit <- multinom(Species ~ ., data = iris)

summary(fit)
predict(fit, iris)
predict(fit, iris, type = "prob")

mod <- fit(model, Species ~ ., data = iris, num_iters = 1000, learning_rate = 0.1)
obj <- mod$objective
plot(seq_along(obj), obj)
preds <- predict(mod, iris)
sum(preds == data$Species)
y
