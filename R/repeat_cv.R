#' @export
repeat_cv <- function(.fun, nsamples, nresample=1000, nfolds=5) {
  resultlist <- foreach::foreach(1:nresample) %dopar%
  {
    folds <- create_folds(strata, k=nfolds)

    estimates <- list()
    for(i in 1:nfolds)
    {
        testindex <- folds[[i]]
        trainindex <- which(!1:nsamples %in% testindex)

        statistics <- .fun(trainindex=trainindex, testindex=testindex)

        predtest <- statistics$test
        predtrain <- statistics$train

        if (is.na(predtest) || is.na(predtrain)) {
          estimates <- NA
          break
        }

        estimates[[i]] <- statistics
    }

    pack_results(estimates)
  }

  if (any(is.na(resultlist))) {
    warning("some (", sum(is.na(resultlist)), ") runs returned NA statistic, ",
            "dropping them from the result list")
  }

  resultlist[!is.na(resultlist)]
}
