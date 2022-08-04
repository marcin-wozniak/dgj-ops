FROM centos:7

ENV container docker

LABEL maintainer="Radoslaw BORECKI <radoslaw.borecki@atos.net>"


ENV CATALINA_HOME=/opt/eev/domibus
#ENV JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8 –Xms128m –Xmx1024m -XX:MaxPermSize=256m"
ENV JAVA_OPTS="-Ddomibus.config.location=/opt/eev/domibus/conf/domibus"


RUN yum install -y java-1.8.0-openjdk net-tools telnet-server telnet iproute

COPY domibus/ /opt/eev/domibus/

ADD mysql-connector-java-8.0.19.jar /opt/eev/domibus/lib/

USER root

#useradd eev
#run chown eev:eev /opt/eev -R
#user eev

#VOLUME [ "/sys/fs/cgroup" ]

# Set the working directory to gdcw' user home directory
WORKDIR /opt/eev/domibus
#CMD ["/opt/eev/domibus/bin/startup.sh"]
