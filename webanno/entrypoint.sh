#!/bin/sh
sed -i s/$\{PASSWORD\}/$PASSWORD/g /srv/webanno/settings.properties
sed -i s/$\{USER\}/$USER/g /srv/webanno/settings.properties
sed -i s/$\{SQLHOST\}/$SQLHOST/g /srv/webanno/settings.properties
