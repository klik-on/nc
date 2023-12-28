FROM nextcloud:28.0

RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    libbz2-dev \
    ; \
    \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $fetchDeps; \
    rm -rf /var/lib/apt/lists/*
    
RUN docker-php-ext-install bz2
COPY setssl.sh /usr/local/bin/

RUN set -ex; \
    \
    chmod +x /usr/local/bin/setssl.sh; \
    /usr/local/bin/setssl.sh admin@ddns.net agsipsdh.ddns.net
