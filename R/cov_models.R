white_noise <- function (p, q, sig2, a) {
  if (sum(p != q) == 0) {
    result <- sig2
  } else {
    result <- 0
  }
  result
}

brownian_motion <- function (p, q, sig2) {
  if (length(p) != 1) {
    stop("Brownian motion covariance function can only be computed for 'd = 1'.")
  } else {
    result <- sig2 * min(p, q)
  }
  result
}

exponential <- function (p, q, sig2, beta) {
  if (is.null(beta)) { beta <- 1 }
  (sig2 * exp(-1 * compute_distance(p, q) / beta))
}

matern_model <- function (p, q, sig2, nu, beta) {
  if (is.null(nu)) { nu <- 1 } # Whittle covariance function
  if (is.null(beta)) { beta  <- 1 }
  dist <- compute_distance(p, q)
  if (sum(p != q) == 0) {
    result <- sig2
  } else {
    result <- ((sig2 / ((2 ^ (nu - 1)) * gamma(nu))) * ((dist/ beta) ^ nu) * GPBayes::BesselK(nu = nu, z = (dist / beta)))
  }
  result
}
