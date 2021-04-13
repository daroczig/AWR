#' Making the AWS Java SDK JAR classes available in R
#'
#' This R package makes the \code{jar} files of the AWS SDK for Java
#' available to be used in downstream R packages. Please note the
#' installation instructions for the System Requirements in the
#' \code{README.md}.
#' @references \url{https://aws.amazon.com/sdk-for-java}
#' @docType package
#' @importFrom rJava .jpackage .jcall
#' @name AWR-package
#' @examples \dontrun{
#' library(rJava)
#' client <- .jnew("com.amazonaws.services.s3.AmazonS3Client")
#' kc$getS3AccountOwner()$getDisplayName()
#' }
NULL

.onAttach <- function(libname, pkgname) {

    ## add the package-bundled jars to the Java classpath
    rJava::.jpackage(
        pkgname, lib.loc = libname,
        ## for devtools::load_all in the development environment
        morePaths = list.files(system.file('java', package = pkgname), full.names = TRUE))

}

.onLoad <- function(libname, pkgname) {

    ## check if AWS Java SDK was found
    jars <- rJava::.jcall('java/lang/System', 'S', 'getProperty', 'java.class.path')
    if (!grepl('aws-java-sdk', jars)) {
        packageStartupMessage(paste(
            'The AWS Java SDK was not found in the Java JAR class path,',
            'which means the AWR R package is not ready to be used yet!\n',
            'If you already have the AWS Java SDK jar files,',
            'you can use rJava::.jaddClassPath to reference those,',
            'otherwise you need to compile or download the JAR files',
            'as described in the README.md of the AWR package.',
            sep = '\n'
        ))
    }

}
