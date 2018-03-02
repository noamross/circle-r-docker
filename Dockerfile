FROM rocker/r-ver:latest

RUN apt-get update && apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --no-install-recommends --no-upgrade \
  git wget libcairo2-dev libssl-dev libssh2-1-dev ssh libcurl4-openssl-dev libxml2-dev zlib1g-dev \
    && wget "https://travis-bin.yihui.name/texlive-local.deb" \
    && sudo dpkg -i texlive-local.deb \
    && rm texlive-local.deb \
    && wget -qO- "https://github.com/yihui/tinytex/raw/master/tools/install-unx.sh" | sh \
    && tlmgr install "inconsolata" "times" "tex" "helvetic" "dvips" \
    && tlmgr path add \
    && Rscript -e "source('https://install-github.me/yihui/tinytex'); tinytex::r_texmf()" \
    && apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --no-install-recommends --no-upgrade \
         texinfo qpdf pandoc pandoc-citeproc \
    && install2.r remotes devtools roxygen2 \
    && rm -rf /tmp/* \
    && apt-get remove --purge -y $BUILDDEPS \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*