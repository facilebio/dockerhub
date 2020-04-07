FROM bioconductor/bioconductor_docker:RELEASE_3_10
LABEL maintainer="Steve Lianoglou (slianoglou@gmail.com)"

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
