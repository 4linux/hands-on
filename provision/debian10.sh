#!/bin/bash

BASEDIR='files/centos8'

#sudo cp "${BASEDIR}/locale" /etc/default/locale

apt-get update

apt-get install -y vim net-tools mailutils tzdata sysstat traceroute iotop locales-all parted lvm2 curl dialog docker-compose docker.io

sudo timedatectl set-timezone America/Sao_Paulo
