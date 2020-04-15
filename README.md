# Overview

We provide several docker images that make it easier to use and develop
facile.bio. These are built nightly and pushed to
[dockerhub/facilebio](https://hub.docker.com/u/facilebio) using GitHub Actions.

## facilebio_base

![.github/workflows/build-base.yaml](https://github.com/facilebio/dockerhub/workflows/.github/workflows/build-base.yaml/badge.svg)

The facilebio_base image builds the R environment upon which the facile.bio
ecosystem can be installed into.

It only installs the packages that are available from the official distribution
channels, like CRAN and Bioconductor.

## facilebio_base_extra

![.github/workflows/build-base-extra.yaml](https://github.com/facilebio/dockerhub/workflows/.github/workflows/build-base-extra.yaml/badge.svg)

Installs non-standard but required packages for facile.bio.

For now, this is just the multiGSEA suite of packages:

* lianos/msigdb.data
* lianos/multiGSEA
* lianos/multiGSEA.shiny

## facilebio

![.github/workflows/build-facilebio.yaml](https://github.com/facilebio/dockerhub/workflows/.github/workflows/build-facilebio.yaml/badge.svg)

Builds on `facilebio_base_extra` and provides all of the packages in the
facile.bio ecosystem.

End users want to use this image.
