ARG  FROM_IMAGE
FROM ${FROM_IMAGE}
LABEL MAINTAINER Yan Chirino <support@yanchirino.com>

USER root

COPY ./vendor                       /mnt/vendor-addons
COPY ./src                          /mnt/src-addons/src

USER odoo
