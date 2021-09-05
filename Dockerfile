ARG  FROM_IMAGE
FROM ${FROM_IMAGE}
MAINTAINER Yan Chirino <support@yanchirino.com>

USER root

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    apt-utils \
    pkg-config \
    build-essential \
    libssl-dev \
    libxmlsec1-dev \
    libsasl2-dev \
    libldap2-dev \
    python3-dev \
    swig \
    wget \
    gnupg \
    software-properties-common \
    dirmngr \
    gnupg \
    xdg-utils \
    libpangocairo-1.0-0 \
    libgeoip-dev \
    memcached \
    libmemcached-tools

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    postgresql-client-12 \
    postgresql-client-13

COPY ./vendor                       /mnt/vendor-addons
COPY ./src                          /mnt/src-addons/src
COPY ./vendor/odoo/ce/addons        /var/lib/odoo/addons/13.0
COPY ./vendor/odoo/ce/odoo/addons   /usr/lib/python3/dist-packages/odoo/addons

USER odoo
