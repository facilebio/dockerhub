FROM bioconductor/bioconductor_docker:RELEASE_3_10
LABEL maintainer="Steve Lianoglou (slianoglou@gmail.com)"

# Start: Install newer git version ---------------------------------------------
# Default git version in RELEASE_3_11 is 2.17.1, but GitHub's
# actions/checkout@v2 action requires a new one.
#
# Thanks to @fellgernon for the tip in the bioconductor #containers slack
# channel.
RUN sudo apt-get update -y
RUN sudo apt-get install --no-install-recommends -y \
   make \
   libssl-dev \
   libghc-zlib-dev \
   libcurl4-gnutls-dev \
   libexpat1-dev \
   gettext \
   unzip \
  && apt-get clean
RUN wget -q https://github.com/git/git/archive/v2.26.2.zip -O git.zip \
   && unzip -qq git.zip
WORKDIR /git-2.26.2
RUN make prefix=/usr all \
  && sudo make prefix=/usr install
WORKDIR /
RUN sudo rm -rf /git* \
   /var/lib/apt/lists/ \
   /tmp/downloaded_packages/ \
   /tmp/*.rds
# End: install newer get versio ------------------------------------------------

ADD base-packages-install.R /tmp/
ADD base-packages.txt /tmp/

RUN R -f /tmp/base-packages-install.R

# Now that we've got the base packages here, we will want to update them
# every now and again without reinstalling all of them again, so we can
# do that here. Run a no-op command to flip this on/of/rerun
# RUN pwd
RUN Rscript -e "library(BiocManager); install(update = TRUE, ask = FALSE)" \
   && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# RUN pwd
# RUN Rscript -e "library(BiocManager); install(update = TRUE, ask = FALSE)" \
#    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Init command for s6-overlay
CMD ["/init"]
