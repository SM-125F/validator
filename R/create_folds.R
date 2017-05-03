create_folds <- function (n, k = 10) {
  x <- sample(n)
  split(x, cut(seq_along(x), k, labels = FALSE))
}
