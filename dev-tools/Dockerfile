ARG  FROM_IMAGE
FROM ${FROM_IMAGE}
MAINTAINER Yan Chirino <support@yanchirino.com>

USER root

RUN pip3 install wdb==3.3.0
RUN pip3 install watchdog==2.1.7
RUN pip3 install web-pdb==1.5.7

USER odoo
