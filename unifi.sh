#! /bin/bash
echo "What is the domain name?"
read DOMAINNAME

echo "Enter path for Docker data.  ie. /mnt/docker"
read DOCKERPATH
cat > ./.env << EOF1
DOMAINNAME=$DOMAINNAME
DOCKERPATH=$DOCKERPATH
EOF1

sudo docker-compose -f unifi.yaml -p unifi up -d
rm ./.env