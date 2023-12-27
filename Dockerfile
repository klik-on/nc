FROM nextcloud:28.0
RUN apt-get update && apt-get install -y libbz2-dev
RUN docker-php-ext-install bz2

COPY setssl.sh /usr/local/bin/
RUN /usr/local/bin/setssl.sh admin@ddns.net agsipsdh.ddns.net
