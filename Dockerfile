FROM nginx
MAINTAINER Christian Dietrich <stettberger@dokucode.de>

# Mumble
RUN useradd -u 1000 mumble \
        && apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        dumb-init \
        procps \
        iproute2 \
        wget \
        unzip \
        npm \
        git \
        mumble-server \
        ca-certificates \
        python3-websockify \
        python3-jinja2 \
        websockify \
        && rm -rf /var/lib/apt/lists/*


# Webserver and Websocksify
RUN ln -sf /dev/stdout /var/log/nginx/static.log
RUN mkdir /app \
        && wget https://github.com/Johni0702/mumble-web/archive/master.zip -O /app/master.zip \
        && unzip /app/master.zip  -d /app \
        && rm /app/master.zip \
        && cd /app/mumble-web-master \
        && npm install \
        && npm run build
EXPOSE 80/tcp
EXPOSE 443/tcp


# Information to run the container
VOLUME ["/data"]
EXPOSE 64738/udp
EXPOSE 64738/tcp
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/context/init.sh"]

ADD . /context/
