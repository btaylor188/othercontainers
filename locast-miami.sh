#! /bin/bash
echo "Username?"
read USERNAME
echo "Password?"
read PASSWORD



docker run -d \
  --cap-add=NET_ADMIN \
  --name=pia \
  --network=internal \
  --restart=always \
  --dns 209.222.18.222 --dns 209.222.18.218 \
  -p 6078:6077 \
  -e REGION="US Florida" \
  -e USERNAME=$USERNAME \
  -e PASSWORD=$PASSWORD \
  itsdaspecialk/pia-openvpn


docker run -d \
  --name=locast-miami \
  --net=container:pia \
  -v /mnt/nvme/docker/locast-miami:/app/config \
  tgorg/locast2plex

