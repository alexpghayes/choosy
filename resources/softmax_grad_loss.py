# A numpy implementation of the multinomial loss gradient from COMP 540

import numpy as np

def test(X, y):
  return np.dot(X, y)

def loss_grad(theta, X, y, reg):
    """
    Softmax loss function, vectorized version.
    Inputs and outputs are the same as softmax_loss_naive.
    """
    # Initialize the loss and gradient to zero.

    J = 0.0
    grad = np.zeros_like(theta)
    num_classes = theta.shape[1]
    m, dim = X.shape

    # one_hot = y

    one_hot = np.eye(num_classes)[y]

    prod_mat = X.dot(theta)
    max_by_row = np.amax(prod_mat, axis = 1)
    safe_exp = np.exp(prod_mat - max_by_row.reshape(-1, 1))

    probs = safe_exp / np.sum(safe_exp, axis = 1).reshape(-1, 1)

    # return(probs, one_hot)

    # print(probs)

    grad = (-X.T.dot(one_hot - probs) + float(reg) * theta) / m

    J = (np.trace(prod_mat[:,y]) - max_by_row.sum() - np.sum(np.log(np.sum(safe_exp, axis = 1)))) / -m + \
        0.5* reg / m * np.sum(theta * theta)

    return J, grad
