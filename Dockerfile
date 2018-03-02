FROM rocker/r-ver:latest

RUN apt-get update && apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --no-install-recommends --no-upgrade \
  git wget libcairo2-dev libssl-dev libssh2-1-dev ssh texlive-latex-base texlive-fonts-recommended libcurl4-openssl-dev libxml2-dev zlib1g-dev texinfo pandoc pandoc-citeproc\
    && install2.r remotes  \
    && installGithub.r -d TRUE r-lib/devtools tidyverse/tidyverse MangoTheCat/goodpractice \
    && rm -rf /tmp/* \
    && apt-get remove --purge -y $BUILDDEPS \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*