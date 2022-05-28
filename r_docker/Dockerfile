FROM rocker/tidyverse:4.2.0

COPY scripts /app/

ENV CTAN_REPO=https://mirror.ctan.org/systems/texlive/tlnet
ENV PATH=$PATH:/usr/local/texlive/bin/x86_64-linux

RUN /app/scripts/install_verse.sh
COPY tex/. /home/rstudio