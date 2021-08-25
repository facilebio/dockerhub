FROM bioconductor/bioconductor_docker:RELEASE_3_13
LABEL maintainer="Steve Lianoglou (slianoglou@gmail.com)"

# We need to install the preview version of RStudio because the "release"
# version of RStudio that comes with the latest bioc images crashes when ggplot2
# is used due to some change in the R graphics engine in R 4.1.9
RUN wget -q "https://s3.amazonaws.com/rstudio-ide-build/server/bionic/amd64/rstudio-server-1.4.1717-amd64.deb" \
  && dpkg -i rstudio-server-*-amd64.deb \
  && rm rstudio-server-*-amd64.deb

# Newer versions of bioconductor_docker image sets options::repos to a
# frozen RSPM date. This is good for reproducibility at large, but I like
# to live on the edge/latest.
RUN sudo echo 'options(repos = c(CRAN = "https://packagemanager.rstudio.com/all/__linux__/bionic/latest"))' >> /usr/local/lib/R/etc/Rprofile.site

# Required for textshaping library
RUN sudo apt-get update -y
RUN sudo apt-get install -y \
  libfribidi-dev \
  libmagick++-dev \
  && sudo rm -rf \
    /var/lib/apt/lists/ \
    /tmp/downloaded_packages/ \
    /tmp/*.rds

ADD base-packages-install.R /tmp/
ADD base-packages.txt /tmp/

# Installation of 'foundational' compiled packages / language bridged packages
# can be wonky if we install the prepackaged stuff, so we (re)compile this
# by source as many of the downstream packages we end up relying on uses
# header libraries from here. So also this related note about pre-built packages
# and RSPM.
#   https://community.rstudio.com/t/package-manager-and-travis/73816
RUN Rscript -e "\
  install.packages(c(\
      'RApiSerialize', \
      'Rcpp', \
      'cpp11', \
      'RcppEigen', \
      'RcppAnnoy', \
      'RcppArmadillo', \
      'RcppHNSW', \
      'RcppParallel', \
      'igraph', \
      'magick', \
      'mclust', \
      'RANN', \
      'V8'), \
    repos = 'https://cran.rstudio.com', \
    type = 'source')"

# Use the default RSPM mojo to install the rest of the packages
RUN R -f /tmp/base-packages-install.R

# Now that we've got the base packages here, we will want to update them
# every now and again without reinstalling all of them again, so we can
# do that here. Run a no-op command to flip this on/of/rerun
# RUN pwd
RUN Rscript -e "options(repos = 'https://cran.rstudio.com/'); BiocManager::install(update = TRUE, ask = FALSE)" \
   && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Init command for s6-overlay
CMD ["/init"]
