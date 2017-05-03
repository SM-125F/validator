#' @export
repeat_cv <- function(.fun, n, repetitions=1000, k=5) {
  resultlist <- plyr::rlply(repetitions, function() {
    folds <- create_folds(n, k=k)

    estimates <- list()
    for(i in 1:k)
    {
        testindex <- folds[[i]]
        trainindex <- which(!1:n %in% testindex)

        statistics <- .fun(train_index=trainindex, test_index=testindex)

        predtest <- statistics$test
        predtrain <- statistics$train

        if (is.na(predtest) || is.na(predtrain)) {
          estimates <- NA
          break
        }

        estimates[[i]] <- statistics
    }

    pack_results(estimates)
  })

  if (any(is.na(resultlist))) {
    warning("some (", sum(is.na(resultlist)), ") runs returned NA statistic, ",
            "dropping them from the result list")
  }

  resultlist[!is.na(resultlist)]
}
