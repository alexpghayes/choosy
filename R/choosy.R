# code skeleton stolen from Hadley's new chapter on S3

# internal constructor
new_factor <- function(x, levels) {
  stopifnot(is.integer(x))
  stopifnot(is.character(levels))

  structure(
    x,
    levels = levels,
    class = "factor"
  )
}

# object validator
validate_factor <- function(x) {
  values <- unclass(x)
  levels <- attr(x, "levels")

  if (!all(!is.na(values) & values > 0)) {
    stop(
      "All `x` values must be non-missing and greater than zero",
      call. = FALSE
    )
  }

  if (length(levels) < max(values)) {
    stop(
      "There must at least as many `levels` as possible values in `x`",
      call. = FALSE
    )
  }

  x
}

# convenience constructor
factor <- function(x, levels = unique(x)) {
  ind <- match(x, levels)
  validate_factor(new_factor(ind, levels))
}
