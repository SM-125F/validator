pack_results <- function(results) {
  if (!is.list(results)) {
    ret <- NA
  } else {
    test <- plyr::laply(results, function(x) { x$test })
    train <- plyr::laply(results, function(x) { x$train })
    ret <- list(test=test, train=train)
  }

  ret
}
