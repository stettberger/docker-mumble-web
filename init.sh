#!/bin/bash

mkdir -p /config /data

chown mumble /data

/context/tpl mumble-server.ini.tpl /config/mumble-server.ini

rm /etc/nginx/conf.d/default.conf
/context/tpl nginx.conf.tpl /etc/nginx/conf.d/default.conf

rm /app/mumble-web-master/dist/config.local.js
/context/tpl mumble-web.conf.js /app/mumble-web-master/dist/config.local.js

su mumble -c "/usr/sbin/murmurd -fg -ini /config/mumble-server.ini" &

# websockify --ssl-target 64737 localhost:64738 &
websockify 64737 localhost:64738 &

nginx -g "daemon off;"
