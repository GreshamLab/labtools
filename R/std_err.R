#' Compute the standard error for a vector of numbers.
#'
#' @param x a vector of values.
#' @return The standard error of \code{x}.
#' @examples
#' std_err(c(4,4,5,5,6,6))
#' std_err(rnorm(100))
#' @seealso \url{https://github.com/davidgresham/davidtools}

std_err <- function(x) {
  s <- sd(x)/sqrt(length(x))
  return(s)
}
