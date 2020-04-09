#!/bin/bash

if [ -z "$MUMBLE_PORT" ]; then
    export MUMBLE_PORT=64738
fi

if [ -z "$WEBSOCKET_PORT" ]; then
    export WEBSOCKET_PORT=64737
fi


mkdir -p /config /data

chown mumble /data

/context/tpl mumble-server.ini.tpl /config/mumble-server.ini

rm /etc/nginx/conf.d/default.conf
/context/tpl nginx.conf.tpl /etc/nginx/conf.d/default.conf

rm /app/mumble-web-master/dist/config.local.js
/context/tpl mumble-web.conf.js /app/mumble-web-master/dist/config.local.js

su mumble -c "/usr/sbin/murmurd -fg -ini /config/mumble-server.ini" &

websockify --ssl-target ${WEBSOCKET_PORT} localhost:${MUMBLE_PORT} &

nginx -g "daemon off;"
