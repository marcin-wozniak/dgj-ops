#!/bin/bash

#include:
#domibus.properties
#keystores
#clientauthentication.xml
#server.xml
#setenv.sh

docker rm -f eev-acceptance-gw-xa;
docker volume rm eev-acceptance-gw-xa;

docker create   --name eev-acceptance-gw-xa \
                                --hostname=gw-xa.acceptance.eev.fsc.atos-services.net \
                                --network-alias=gw-site1 \
                                --network-alias=gw-xa \
                                --network-alias=gw-xa.acceptance.eev.fsc.atos-services.net \
                                --network eev-test-RI \
                                --ip=192.168.220.10 \
                                --add-host con-site1:192.168.220.11 \
                                --add-host ri-xa.acceptance.eev.fsc.atos-services.net:192.168.220.2 \
                                --add-host ccdb.acceptance.tech.ec.europa.eu:147.67.35.39 \
                                --add-host ccdb.tech.ec.europa.eu:147.67.35.25 \
                                --add-host mysql:192.168.220.3 \
                                --add-host site-xa.acceptance.eev.fsc.atos-services.net:127.0.0.1 \
                                --restart=always \
                                -p 8092:8443 \
                                -v /home/eev/cacerts_ri:/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.252.b09-2.el7_8.x86_64/jre/lib/security/cacerts:z \
                                -v /home/eev/DomibusGw/xa-conf/domibus/keystores:/opt/eev/domibus/conf/domibus/keystores:z \
                                -v /home/eev/DomibusGw/xa-conf/domibus/domibus.properties.full:/opt/eev/domibus/conf/domibus/domibus.properties:Z \
                                -v /home/eev/DomibusGw/xa-conf/domibus/clientauthentication.xml:/opt/eev/domibus/conf/domibus/clientauthentication.xml:Z\
                                -v /home/eev/DomibusGw/xa-conf/domibus/server.xml:/opt/eev/domibus/conf/server.xml:Z\
                                -v /etc/timezone:/etc/timezone:ro \
                                -v /etc/localtime:/etc/localtime:ro \
                                -v /home/a700740/inter.pem:/tmp/inter.pem:Z \
                                -v /home/eev/DomibusGw/xa-conf/setenv.sh:/opt/eev/domibus/bin/setenv.sh:ro \
                                -v eev-acceptance-gw-xa:/opt/eev/domibus \
                                -v /etc/resolv.conf:/etc/resolv.conf:z \
                                domibusgw:4.2.9 sh /opt/eev/domibus/bin/catalina.sh run;

docker start eev-acceptance-gw-xa;

docker logs -f eev-acceptance-gw-xa;

#-e CATALINA_OPTS="-Xmx2048m " \