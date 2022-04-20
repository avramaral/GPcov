## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(GPcov)

## -----------------------------------------------------------------------------
x <- seq(from = 1, to = 30, by = 1)
y <- seq(from = 1, to = 30, by = 1)
z <- expand.grid(x, y)
print(class(z))
print(nrow(z))

## -----------------------------------------------------------------------------
C  <- compute_cov_matrix(points = z, cov_func = "matern_model", sig2 = 1, nu = 5, beta = 5)
print(C[1:5, 1:5])

## -----------------------------------------------------------------------------
library(MASS)
GP <- MASS::mvrnorm(n = 1, mu = rep(0, nrow(C)), Sigma = as.matrix(C))
GP <- matrix(data = GP, nrow = length(y), ncol = length(x), byrow = TRUE)

library(pheatmap)
pheatmap::pheatmap(GP, cluster_rows = FALSE, cluster_cols = FALSE)

