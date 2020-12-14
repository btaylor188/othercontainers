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
-l "traefik.enable"="true" \
-l "traefik.frontend.auth.forward.address"="http://oauth:4181" \
-l "traefik.frontend.headers.SSLHost"="$DOMAINNAME" \
-l "traefik.frontend.headers.SSLRedirect"="true" \
-l "traefik.frontend.headers.STSIncludeSubdomains"="true" \
-l "traefik.frontend.headers.STSPreload"="true" \
-l "traefik.frontend.headers.STSSeconds"="315360000" \
-l "traefik.frontend.headers.browserXSSFilter"="true" \
-l "traefik.frontend.headers.contentTypeNosniff"="true" \
-l "traefik.frontend.headers.customResponseHeaders"="X-Robots-Tag:noindex,nofollow,nosnippet,noarchive,notranslate,noimageindex" \
-l "traefik.frontend.headers.forceSTSHeader"="true" \
-l "traefik.frontend.rule"="Host:homeassistant.$DOMAINNAME" \
-l "traefik.port"="8123" \
homeassistant/home-assistant:stable



