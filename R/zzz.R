#' Installing AWS SDK jars for R
#'
#' Downloads and installs the AWS SDK for Java jars from the \code{ARW.jars} packages, which also adds to the Java classpath to be easily used in other R packages.
#' @references \url{https://aws.amazon.com/sdk-for-java}
#' @docType package
#' @name AWR-package
NULL

.onLoad <- function(libname, pkgname) {
    if (suppressWarnings(require('AWR.jars', quietly = TRUE)) == FALSE) {
        warning('AWR.jars package not found, installing now...')
        install.packages('AWR.jars', repos = 'https://cardcorp.gitlab.io/AWR.jars')
    }
}
