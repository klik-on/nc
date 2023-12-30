# https://help.nextcloud.com/t/howto-running-nextcloud-over-self-signed-https-ssl-tls-in-docker/101973  ==SSL
# $ mkdir -p etc/ssl/nextcloud/
# $ cp cert.pem ./etc/ssl/nextcloud/
# $ cp key.pem ./etc/ssl/nextcloud/

docker exec nc_app_1 bash -c 'apt-get update; apt-get install -y --no-install-recommends libbz2-dev'
docker exec nc_app_1 bash -c 'docker-php-ext-install bz2'

docker cp setssl.sh nc_app_1:/usr/local/bin/setssh.sh
docker exec nc_app_1 bash -c 'chown -R root:root /usr/local/bin/setssh.sh'
docker exec nc_app_1 bash -c 'chmod +x /usr/local/bin/setssh.sh'
docker exec nc_app_1 bash -c '/usr/local/bin/setssh.sh dbgis@menlhk.go.id dbgis.menlhk.go.id'

# Fix Log since
docker exec nc_app_1 bash -c "truncate /var/www/html/data/nextcloud.log --size 0"

# https://techoverflow.net/?s=nextcloud
# sudo -u www-data php occ config:system:set default_phone_region --type string --value="ID"
# docker-compose exec -u www-data nc_app_1 php occ config:system:set default_phone_region --type string --value="ID"
# nano /var/www/html/config/config.php
# 'default_phone_region' => 'ID',

docker restart nc_app_1
