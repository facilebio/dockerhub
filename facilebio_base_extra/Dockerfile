FROM facilebio/facilebio_base:latest
LABEL maintainer="Steve Lianoglou (slianoglou@gmail.com)"

# Installs R packages not available/released on the standard channels
# (bioconductor / CRAN)

# RUN pwd
# RUN Rscript -e "library(BiocManager); install(update = TRUE, ask = FALSE)" \
#    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# multiGSEA not in bioconductor yet
RUN Rscript -e "library(BiocManager); install(c(\
    'lianos/msigdb.data', \
    'lianos/multiGSEA@develop', \
    'lianos/multiGSEA.shiny@develop' \
  ))" \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# RUN pwd
# RUN Rscript -e "library(BiocManager); install(update = TRUE, ask = FALSE)" \
#    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Init command for s6-overlay
CMD ["/init"]
