docker run \
  --name 7dtd \
  --restart unless-stopped \
  -v "/mnt/nvme/docker/7dtd/7DaysToDie:/home/sdtdserver/.local/share/7DaysToDie/" \
  -v "/mnt/nvme/docker/7dtd/ServerFiles:/home/sdtdserver/serverfiles/" \
  -v "/mnt/nvme/docker/7dtd/LogFolder:/home/sdtdserver/log/" \
  -p 26900:26900/tcp \
  -p 26900:26900/udp \
  -p 26901:26901/udp \
  -p 26902:26902/udp \
  -p 9080:9080/udp \
  -p 9023:9023/tcp \
  -e START_MODE=1 \
  -e VERSION=stable \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TimeZone=America/Denver \
  vinanrra/7dtd-server