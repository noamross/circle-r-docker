FROM rocker/verse:latest

RUN RUN apt-get update && apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --no-install-recommends --no-upgrade \
  && texinfo \ 
  && installGithub.r MangoTheCat/goodpractice 
