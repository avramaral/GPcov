compute_cov_function <- function (p, q, cov_func = "white_noise", arg) {
  if (is.null(arg[["sig2"]])) { sig2 <- 1 } else { sig2 <- arg[["sig2"]] }
  switch(EXPR = cov_func,
         white_noise = {
           cov_element <- white_noise(p = p, q = q, sig2 = sig2)
         }, brownian_motion = {
           cov_element <- brownian_motion(p = p, q = q)
         }, exponential = {
           cov_element <- exponential(p = p, q = q, sig2 = sig2, beta = arg[["beta"]])
         }, matern_model = {
           cov_element <- matern_model(p = p, q = q, sig2 = sig2, nu = arg[["nu"]], beta = arg[["beta"]])
         }, {
           stop("Select a valid covariance model.")
         })
  cov_element
}
