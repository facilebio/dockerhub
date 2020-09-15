# Overview

<!-- badges: start -->
![.github/workflows/build-base.yaml](https://github.com/facilebio/dockerhub/workflows/.github/workflows/build-base.yaml/badge.svg)
![.github/workflows/build-base-extra.yaml](https://github.com/facilebio/dockerhub/workflows/.github/workflows/build-base-extra.yaml/badge.svg)
![.github/workflows/build-facilebio.yaml](https://github.com/facilebio/dockerhub/workflows/.github/workflows/build-facilebio.yaml/badge.svg)
<!-- badges: end -->

We provide several docker images in order to make the development and deployment
of facile.bio based workflows easier.

All of this images are built from the
[bioconductor/bioconductor_docker:RELEASE_3_11](https://hub.docker.com/r/bioconductor/bioconductor_docker).

These images are built nightly and pushed to
[dockerhub/facilebio](https://hub.docker.com/u/facilebio) using GitHub Actions.

End users and casual developers of facile.bio will most often only want to
use the [facilebio](https://hub.docker.com/r/facilebio/facilebio) image.

## facilebio_base

![.github/workflows/build-base.yaml](https://github.com/facilebio/dockerhub/workflows/.github/workflows/build-base.yaml/badge.svg)

The [facilebio_base](https://hub.docker.com/r/facilebio/facilebio_base) image
builds the R environment upon which the facile.bio ecosystem can be installed
into. It installs the R and all of the CRAN and Bioconductor packages that
the facile.bio packages depend on.

We provide this image so that building and rebuilding docker images, as well
as performing `R CMD check` testing functionality in the upstream facile.bio
packages is more efficient.

If the functionality of the upstream packages grows and that requires a new
package dependency, that package will eventually be installed into this image.

## facilebio_base_extra

![.github/workflows/build-base-extra.yaml](https://github.com/facilebio/dockerhub/workflows/.github/workflows/build-base-extra.yaml/badge.svg)

The [facilebio_base_extra](https://hub.docker.com/r/facilebio/facilebio_base_extra)
image inherits from `facilebio_base`, and installs packgages that are used by
the facile.bio ecosystem which have not found their way into CRAN or
Bioconductor yet.

For now, this is just the multiGSEA suite of packages:

* lianos/msigdb.data
* lianos/multiGSEA
* lianos/multiGSEA.shiny

## facilebio

![.github/workflows/build-facilebio.yaml](https://github.com/facilebio/dockerhub/workflows/.github/workflows/build-facilebio.yaml/badge.svg)

The [facilebio](https://hub.docker.com/r/facilebio/facilebio) image inherits
from `facilebio_base_extra`, and is the final layer.

All of the facile.bio packages are installed here.

End users want to use this image.
