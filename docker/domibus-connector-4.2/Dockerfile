FROM tomcat:8-jre8-alpine

ENV container=docker

LABEL org.label-schema.schema-version=1.0 org.label-schema.name="CentOS Base Image" org.label-schema.vendor=CentOS org.label-schema.license=GPLv2 org.label-schema.build-date=20200504 org.opencontainers.image.title="CentOS Base Image" org.opencontainers.image.vendor=CentOS org.opencontainers.image.licenses=GPL-2.0-only org.opencontainers.image.created="2020-05-04 00:00:00+01:00"

#RUN yum update -y && yum clean all && yum install java-1.8.0-openjdk-headless -y && (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); rm -f /lib/systemd/system/multi-user.target.wants/*;rm -f /etc/systemd/system/*.wants/*;rm -f /lib/systemd/system/local-fs.target.wants/*; rm -f /lib/systemd/system/sockets.target.wants/*udev*; rm -f /lib/systemd/system/sockets.target.wants/*initctl*; rm -f /lib/systemd/system/basic.target.wants/*;rm -f /lib/systemd/system/anaconda.target.wants/* &&

#RUN groupadd -r eev -g 1000 &&
#RUN useradd -u 1000 -r -g eev -m -d /opt/eev -s /sbin/nologin -c "EEV user" eev && chmod 755 /opt/eev

#USER eev

WORKDIR /opt/eev

LABEL maintainer = "Marcin Woźniak marcin.wozniak@atos.net"

COPY 4.2.16/ /opt/eev/domibusConnector

WORKDIR /opt/eev/domibusConnector
