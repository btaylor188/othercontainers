docker run -d \
--name-locast \
--restart=always \
-p 6077:6077 \
-p 1900:1900/udp \
-v /mnt/nvme/docker/locast/config.ini:/app/config/config.ini \
tgorg/locast2plex
