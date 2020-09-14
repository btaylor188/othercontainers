#! /bin/bash
echo "Username?"
read USERNAME
echo "Password?"
read PASSWORD
echo "PIA Region?"
read REGION

docker network create pia_network

docker run -d \
  --cap-add=NET_ADMIN \
  --name=pia \
  --network=pia_network \
  --restart=always \
  --dns 209.222.18.222 --dns 209.222.18.218 \
  -e REGION=$REGION \
  -e USERNAME=$USERNAME \
  -e PASSWORD=$PASSWORD \
  itsdaspecialk/pia-openvpn
