#! /bin/bash
echo "Enter path for Docker data.  ie. /mnt/docker"
read DOCKERPATH

echo "What is the domain name?"
read DOMAINNAME

docker run -d \
--name=homeassistant \
--restart=always \
--net=host \

-v /$DOCKERPATH/homeassistant:/config \
-v /etc/localtime:/etc/localtime:ro \
homeassistant/home-assistant:stable



