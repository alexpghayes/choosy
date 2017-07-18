# code skeleton stolen from Hadley's new chapter on S3

# internal constructor
new_choosy <- function(x) {

  object <- list()
  class(object) <- "choosy"
  object
}

# object validator
validate_choosy <- function(x) {
  .NotYetImplemented()
  x
}

# convenience constructor
factor <- function(needed) {
  validate_choosy(new_choosy(needed))
}
