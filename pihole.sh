#! /bin/bash
echo "Enter path for Docker data.  ie. /mnt/docker"
read DOCKERPATH

echo "Assign Unused Network IP"
read IP

cat > ./.env << EOF1
DOCKERPATH=$DOCKERPATH
IP=$IP
EOF1

sudo docker-compose -f pihole.yaml -p pihole up -d
rm ./.env