FROM rocker/tidyverse:4.2.0

COPY scripts/ /app/

ENV CTAN_REPO=https://mirror.ctan.org/systems/texlive/tlnet
ENV PATH=$PATH:/usr/local/texlive/bin/x86_64-linux

RUN /app/install_verse.sh

COPY preamble.tex /home/rstudio
COPY texconfig.rmd /home/rstudio
COPY config.R /home/rstudio

RUN ["Rscript", "/home/rstudio/config.R"]