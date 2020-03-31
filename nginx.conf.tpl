server {
        listen 80 default_server;
        # server_name voice.example.com;
        # ssl_certificate /etc/letsencrypt/live/voice.example.com/fullchain.pem;
        # ssl_certificate_key /etc/letsencrypt/live/voice.example.com/privkey.pem;

        location / {
                root /app/mumble-web-master/dist;
        }
        location /demo {
                proxy_pass http://localhost:64737;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection $connection_upgrade;
        }
}

map $http_upgrade $connection_upgrade {
        default upgrade;
        '' close;
}
