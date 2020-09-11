docker run \
  --name 7dtdserver \
  --restart unless-stopped \
  -v "/mnt/nvme/docker/7dtd:/home/sdtdserver/"\
  -p 26900:26900/tcp \
  -p 26900:26900/udp \
  -p 26901:26901/udp \
  -p 26902:26902/udp \
  -p 8080:8080/udp \
  -p 8081:8081/tcp \
  -p 8082:8082/tcp \
  -e START_MODE=1 \
  -e VERSION=stable \
  -e TEST_ALERT=YES \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TimeZone=America/Denver \
  vinanrra/7dtd-server
