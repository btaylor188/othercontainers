docker run -d \
--name=locast \
--restart=always \
-p 6077:6077 \
-v /mnt/nvme/docker/locast:/app/config \
tgorg/locast2plex
