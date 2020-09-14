#! /bin/bash
echo "Username?"
read USERNAME
echo "Password?"
read PASSWORD
echo "PIA Region?"
read REGION

docker run -d \
  --cap-add=NET_ADMIN \
  --name=pia \
  --restart=always \
  --dns 209.222.18.222 --dns 209.222.18.218 \
  -e REGION=$REGION \
  -e USERNAME=$USERNAME \
  -e PASSWORD=$PASSWORD \
  itsdaspecialk/pia-openvpn
