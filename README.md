# AWR

This R package installs the [AWS SDK for Java](https://aws.amazon.com/sdk-for-java) `jar` files from [AWR.jars](https://gitlab.com/cardcorp/AWR.jars) to be used in downstream R packages.

## Why the name?

This is an R package bundling AWS jars, but S is so 1992.

## What is it good for?

The bundled SDK files are useful for R package developers working with AWS so that they can easily `depend` on this package to get the jar files in the Java classpath.
