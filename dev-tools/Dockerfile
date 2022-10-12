ARG  FROM_IMAGE
FROM ${FROM_IMAGE}
MAINTAINER Yan Chirino <support@yanchirino.com>

USER root

RUN python3.9 -m pip install wdb==3.3.0
RUN python3.9 -m pip install watchdog==2.1.7
RUN python3.9 -m pip install web-pdb==1.5.7

USER odoo
