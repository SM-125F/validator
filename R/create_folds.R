create_folds <- function (nsamples, k = 10) {
  x <- sample(nsamples)
  split(x, cut(seq_along(x), k, labels = FALSE))
}
