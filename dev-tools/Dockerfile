ARG  FROM_IMAGE
FROM ${FROM_IMAGE}
LABEL MAINTAINER Yan Chirino <support@yanchirino.com>

USER root

RUN pip install wdb==3.3.0
RUN pip install watchdog==2.1.7
RUN pip install web-pdb==1.5.7

USER odoo
