#!/bin/bash
#Download artifacts
#wget https://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/8.0.30/mysql-connector-java-8.0.30.jar ./artifacts/mysql-connector-java.jar
#wget https://dlm.mariadb.com/2338690/Connectors/java/connector-java-3.0.6/mariadb-java-client-3.0.6.jar ./artifacts/mariadb-connector-j.jar
#wget https://download.oracle.com/otn-pub/otn_software/jdbc/211/ojdbc8.jar ./artifacts/ojdbc8.jar
docker build -t domibus-gateway-tomcat:5.0 .