FROM almalinux:8.6-minimal
#FROM tomcat:jre8

# Set this so systemd would know how to properly shut down container
ENV container=docker

LABEL maintainer="Marcin Woźniak <marcin.wozniak@atos.net>"

# Install java and diagnostics tools
RUN microdnf install -y java-1.8.0-openjdk 
# net-tools telnet-server telnet iproute
# Check if java was installed correctly
RUN echo $JAVA_HOME

# Set some Tomcat variables (alternativly add this to setenv.sh)
ENV CATALINA_HOME=/opt/eev/domibus
ENV CATALINA_TMPDIR=/opt/eev/domibus/temp
ENV JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8 –Xms128m –Xmx1024m -XX:MaxPermSize=256m"
ENV JAVA_OPTS="$JAVA_OPTS -Ddomibus.config.location=/opt/eev/domibus/conf/domibus"

COPY ./artifacts/domibus-distribution-5.0-tomcat-full/domibus/ /opt/eev/domibus/
# For Domibus Gateway 5.0 MySQL Connector version has to be >=8.0.23, most likly due to TimeZone handling changes
COPY ./artifacts/mysql-connector-java-8.0.30.jar /opt/eev/domibus/lib/
COPY ./artifacts/ojdbc8.jar /opt/eev/domibus/lib/
# MariaDB is not officially supported in Domibus Gateway 5.0
#ADD mariadb-connector-j.jar /opt/eev/domibus/lib/

#COPY ./artifacts
USER root
WORKDIR /opt/eev/domibus
RUN chmod u+x ./bin/*.sh
ENTRYPOINT [sh /opt/eev/domibus/bin/startup.sh]


#TODO
#modify activemq.xml
#add connector plugin
#check tmp or temp
#run on user not root