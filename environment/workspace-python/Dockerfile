FROM python:3.7.10-stretch

RUN apt-get update && apt-get install -yq \
    git-core \
    unzip \
    mkdir -p /web \
    mkdir -p /var/log/fpm \
    && chmod 755 -R /var/log
