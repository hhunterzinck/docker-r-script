FROM r-base:4.0.5

ENV RENV_VERSION 0.14.0

RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts

RUN R -e 'renv::restore()'

ENTRYPOINT ["Rscript", "script.R"]
