FROM bioconductor/bioconductor_docker:RELEASE_3_11
LABEL maintainer="Steve Lianoglou (slianoglou@gmail.com)"

# Newer versions of bioconductor_docker image freezes the CRAN repos to:
# https://packagemanager.rstudio.com/all/__linux__/bionic/291
# but we want /latest
RUN sudo echo 'options(repos = c(CRAN = "https://packagemanager.rstudio.com/all/__linux__/bionic/latest"))' >> /usr/local/lib/R/etc/Rprofile.site

# Start: Install newer git version ---------------------------------------------
# Default git version in RELEASE_3_11 is 2.17.1, but GitHub's
# actions/checkout@v2 action requires a new one.
#
# Thanks to @fellgernon for pointing out that an older git version could be
# a problem, and further for pointing out that using ppa would be a better way
# to install it than compiling it from source.
RUN sudo apt-get update -y
RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository -y ppa:git-core/candidate
RUN sudo apt-get -y update
RUN sudo apt-get install --only-upgrade -y git
RUN sudo apt-get clean \
  && sudo rm -rf \
    /var/lib/apt/lists/ \
    /tmp/downloaded_packages/ \
    /tmp/*.rds
# End: install newer git version -----------------------------------------------

ADD base-packages-install.R /tmp/
ADD base-packages.txt /tmp/

# As of 2020-09-15, installing a compiled Rcpp binary from the public RSPM can
# get wonky still, so we will install that first from source, then use RSPM
# binaries for the rest.
# https://community.rstudio.com/t/package-manager-and-travis/73816
RUN Rscript -e "options(repos = 'https://cran.rstudio.com/'); install.packages('Rcpp', type = 'source')"

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
