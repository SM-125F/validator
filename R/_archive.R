# functions that may be useful at some point

# random_name <- function(len=10, prefix='', suffix='') {
#   alpha <- c(letters, LETTERS, as.character(0:9))
#   string <- paste0(sample(alpha, len, replace = T), collapse='')
#   paste0(prefix,string,suffix, collapse='')
# }


# time_estimate <- function(experiment, nsamples, nfolds=5, nresample=1500) {
#   testindex <- 1:ceiling(nsamples/3)
#   trainindex <- (ceiling(nsamples/3)+1):nsamples
#   t <- system.time(experiment(testindex, trainindex)) + system.time(experiment(testindex, trainindex))
#   est <- (t*nresample*nfolds)/2
#   est*1.2
# }

# load_rdas <- function(folder) {
#   names <- dir(folder, pattern = "*.rda|*.RData")
#   names <- file.path(folder, names)
#   l <- list()
#
#   for (n in names) {
#     obj <- load(n)
#     l <- c(l, eval(as.name(obj)))
#   }
#
#   l
# }
