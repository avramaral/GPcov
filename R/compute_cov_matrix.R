#' Compute covariance matrix for a Gaussian process
#'
#' @param points A data frame with `n` rows and `d` columns.
#' @param cov_func A covariance model. Options are `white_noise`, `brownian_motion`, `exponential`, and `matern_model`. For all functions (except for `brownian_motion`), one can provide `sig2`.
#' Also, for the `exponential` model, one has to provide the parameter `beta`, and for the `matern_model` model, the parameters `nu` and `beta`.
#' See \url{https://avramaral.github.io/GPcov/articles/introduction.html} for more details.
#' @param ... Additional parameters. See above.
#'
#' @return An `n` by `n` covariance matrix.
#' @export
#'
#' @examples
#' x <- seq(1, 10, 1)
#' y <- seq(1, 10, 1)
#' z <- expand.grid(x, y)
#' compute_cov_matrix(points = z, cov_func = "matern_model", sig2 = 1, nu = 1, beta = 10)
compute_cov_matrix <- function (points, cov_func, ...) {
  arg <- list(...)

  if (!is.data.frame(points)) {
    stop("'points' should be a data frame with 'n' rows and 'd' columns.")
  } else {
    n <- nrow(points)

    cov_matrix <- matrix(data = NA, nrow = n, ncol = n)
    for (i in 1:n) {
      for (j in i:n) {
        cov_matrix[i, j] <- compute_cov_function(p = unlist(as.vector(points[i, ])), q = unlist(points[j, ]), cov_func = cov_func, arg = arg)
        cov_matrix[j, i] <- cov_matrix[i, j]
      }
    }
  }
  cov_matrix
}
