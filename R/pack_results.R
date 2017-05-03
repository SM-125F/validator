pack_results <- function(results) {
  if (!is.list(results)) {
    ret <- NA
  } else {
    test <- mean(plyr::laply(results, function(x) { x$test }))
    train <- mean(plyr::laply(results, function(x) { x$train }))
    misc <- plyr::llply(results, function(x) { x$misc })
    ret <- list(test=test, train=train, misc=misc)
  }

  ret
}
