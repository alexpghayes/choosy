data(iris)

data <- iris
formula <- Species ~ .
model <- new_choosy()

learning_rate <- 1e-3
reg <- 1e-5
num_iters <- 100
batch_size <- 200
verbose <- TRUE

X <- model.matrix(formula, data)
flip <- as.formula(paste("~ 0 + ", deparse(rlang::f_lhs(formula))))
y <- model.matrix(flip, data)

num_classes <- dim(y)[2]
num_feat <- dim(X)[2]

coefs <- matrix(runif(num_classes * num_feat), ncol = num_classes)
history <- numeric(num_iters)

for (iter in 1:num_iters) {

  # mini-batch stuff
  loss <- softmax_loss(coefs, X, y, reg)
  grad <- softmax_grad(coefs, X, y, reg)

  history[iter] <- loss

  coefs <- coefs - learning_rate * grad

  if (verbose)
    print(glue::glue("iteration: {iter}/{num_iters}  loss: {loss}"))
}

model$trained <- TRUE
model$coefs <- coefs