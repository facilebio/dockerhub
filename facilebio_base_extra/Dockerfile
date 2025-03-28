# syntax=docker/dockerfile:1
FROM facilebio/facilebio_base:latest
LABEL maintainer="Steve Lianoglou (slianoglou@gmail.com)"

# Installs R packages not available/released on the standard channels
# (bioconductor / CRAN)

# RUN --mount=type=secret,id=GITHUB_PAT \
#     GITHUB_PAT=$(cat /run/secrets/GITHUB_PAT) \
#     Rscript -e "library(BiocManager); install(c(\
#         'lianos/sparrow', \
#         'lianos/sparrow.shiny' \
#     ))" \
#     && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN --mount=type=secret,id=GITHUB_PAT \
    GITHUB_PAT=$(cat /run/secrets/GITHUB_PAT) \
    Rscript -e "pak::pkg_install(c(\
        'lianos/sparrow', \
        'lianos/sparrow.shiny' \
    ), upgrade = TRUE, ask = FALSE)" \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN Rscript -e \
    "install.packages(\
        'msigdbdf', \
        repos = c(\
            'https://igordot.r-universe.dev',\
            'https://cloud.r-project.org'\
        )\
    )" \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

    # Init command for s6-overlay
CMD ["/init"]
