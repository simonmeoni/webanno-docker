############################################################
# Dockerfile to build webanno container images
# Based on Ubuntu
############################################################

################## BEGIN INSTALLATION ######################
# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Simon Meoni

# Update the repository sources list
RUN apt-get update

# Dependencies
RUN apt-get install -y tomcat8-user authbind mysql-client openjdk-8-jdk

# Create directories & add file system

RUN cd /opt && tomcat8-instance-create -p 18080 -c 18005 webanno
RUN chown -R www-data /opt/webanno

ADD webanno /etc/init.d/webanno
RUN chmod +x /etc/init.d/webanno

ADD webanno-webapp-3.2.0.war /opt/webanno/webapps/webanno.war

RUN mkdir /srv/webanno
ADD settings.properties /srv/webanno/settings.properties

RUN chown -R www-data /srv/webanno
COPY entrypoint.sh /entrypoint.sh

##################### INSTALLATION END #####################

EXPOSE 18080
CMD /entrypoint.sh && sleep 30 && service webanno start && tail -F /opt/webanno/logs/*
