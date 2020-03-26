# Overview

We provide several docker images that make it easier to use and develop
facile.bio.

## facilebio_base

The facilebio_base image builds the R environment upon which the facile.bio
ecosystem can be installed into.

It only installs the packages that are available from the official distribution
channels, like CRAN and Bioconductor.

## facilebio_base_extra

Installs non-standard but required packages for facile.bio.

For now, this is just the multiGSEA suite of packages:

* lianos/msigdb.data
* lianos/multiGSEA
* lianos/multiGSEA.shiny

## facilebio

Builds on `facilebio_base_extra` and provides all of the packages in the
facile.bio ecosystem.

End users want to use this image.
