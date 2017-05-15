#!/bin/bash

while [[ `mysql --user=$USER --password=$PASSWORD --host=$SQLHOST -e "SHOW DATABASES" 2> ./log | more ./log` =~ "ERROR" ]]
do
  sleep 6 | echo "wait db ..."
done
sed -i s/$\{PASSWORD\}/$PASSWORD/g /srv/webanno/settings.properties
sed -i s/$\{USER\}/$USER/g /srv/webanno/settings.properties
sed -i s/$\{SQLHOST\}/$SQLHOST/g /srv/webanno/settings.properties
service webanno start
tail -F /opt/webanno/logs/*
