compute_distance <- function (p, q) {
  dim_p <- length(p)
  dim_q <- length(q)

  if (dim_p != dim_q) {
    stop("Points should have the same dimension.")
  } else {
    partial <- 0
    for (i in 1:dim_p) {
      partial <- partial + ((p[i] - q[i]) ^ 2)
    }
  }
  sqrt(partial)
}
