server {
        {% if VIRTUAL_HOST %}
        server_name {{VIRTUAL_HOST}}
        {% endif %}
        
        {% if NGINX_SSL == "true" %}
        listen 443 default_server ssl;
        ssl_certificate {{ SSL_CERT_PATH }};
        ssl_certificate_key {{ SSL_KEY_PATH }};
        {% else %}
        listen 80 default_server;
        {% endif %}

        location / {
                root /app/mumble-web-master/dist;
        }
        location /mumble {
                proxy_pass http://localhost:{{WEBSOCKET_PORT}};
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection $connection_upgrade;
        }
}

map $http_upgrade $connection_upgrade {
        default upgrade;
        '' close;
}
