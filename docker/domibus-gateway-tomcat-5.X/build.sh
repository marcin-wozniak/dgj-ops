#!/bin/bash
#wget https://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar ./mysql-connector-java.jar
#wget https://dlm.mariadb.com/2338690/Connectors/java/connector-java-3.0.6/mariadb-java-client-3.0.6.jar ./mariadb-connector-j.jar
docker build -t domibus-gateway-tomcat:5.0 .