test_that("verify if the computed covariance matrix is positive-definite", {
  z <- data.frame(seq(from = 1, to = 10, by = 1))
  expect_equal(matrixcalc::is.positive.semi.definite(x = compute_cov_matrix(points = z, cov_func = "white_noise")), TRUE)
  expect_equal(matrixcalc::is.positive.semi.definite(x = compute_cov_matrix(points = z, cov_func = "brownian_motion")), TRUE)
  expect_equal(matrixcalc::is.positive.semi.definite(x = compute_cov_matrix(points = z, cov_func = "exponential")), TRUE)
  expect_equal(matrixcalc::is.positive.semi.definite(x = compute_cov_matrix(points = z, cov_func = "matern_model")), TRUE)
})
