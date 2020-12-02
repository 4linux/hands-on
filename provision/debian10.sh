#!/bin/bash

BASEDIR='files/centos8'

#sudo cp "${BASEDIR}/locale" /etc/default/locale

sudo apt update

sudo apt install vim net-tools  mailutils tzdata  sysstat  traceroute iotop locales-all parted lvm2 curl docker-compose -y

sudo timedatectl set-timezone America/Sao_Paulo

curl -sSL https://get.docker.com/ | sh
