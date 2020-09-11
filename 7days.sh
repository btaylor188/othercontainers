docker run -d -v /mnt/nvme/docker/7dtd/data:/data \
  --name 7dtd \
  --restart=always \
  -p 26900-26902:26900-26902 \
  -p 26900-26902:26900-26902/udp \
  zobees/7daystodie