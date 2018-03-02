FROM rocker/verse:latest

RUN apt-get update && apt-get install -y --force-yes --no-install-recommends --no-upgrade \
  texinfo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/  \
    && installGithub.r MangoTheCat/goodpractice