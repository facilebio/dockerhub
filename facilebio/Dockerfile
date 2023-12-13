# syntax=docker/dockerfile:1
FROM facilebio/facilebio_base_extra:latest
LABEL maintainer="Steve Lianoglou (slianoglou@gmail.com)"

# Now that we've got the base packages here, we will want to update them
# every now and again without reinstalling all of them again, so we can
# do that here. Run a no-op command to flip this on/of/rerun
# RUN pwd
# RUN dat

RUN --mount=type=secret,id=GITHUB_PAT \
    GITHUB_PAT=$(cat /run/secrets/GITHUB_PAT) \
    Rscript -e "library(BiocManager); install(c(\
        'facilebio/FacileData', \
        'facilebio/FacileBiocData', \
        'facilebio/FacileViz', \
        'facilebio/FacileShine', \
        'facilebio/FacileAnalysis', \
        'facilebio/FacileAnalysisShine', \
        'facilebio/FacileIncubator' \
    ))" \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# RUN pwd
# RUN Rscript -e "library(BiocManager); install(update = TRUE, ask = FALSE)" \
#    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Init command for s6-overlay
CMD ["/init"]
