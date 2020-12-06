#!/bin/bash

apt update

apt-get install -y vim net-tools mailutils tzdata sysstat traceroute iotop locales-all parted lvm2 curl dialog docker-compose docker.io

timedatectl set-timezone America/Sao_Paulo

id devops
if [$? -ne 0]; then
    useradd -m -d /home/devops -s /bin/bash devops
fi
