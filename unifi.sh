#! /bin/bash
docker run -d \
--name=unifi \
--restart=always \
-v /mnt/docker/UniFi:/config \
-e PGID=1000 \
-e PGID=1000 \
-p 8080:8080 \
-p 8081:8081 \
-p 8443:8443 \
-p 8843:8843 \
-p 8880:8880  \
-p 3478:3478/udp \
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
-l "traefik.frontend.rule"="Host:unifi.$DOMAINNAME" \
-l "traefik.port"="8080" \
linuxserver/unifi
