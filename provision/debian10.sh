#!/bin/bash

apt update

apt install vim net-tools  mailutils tzdata  sysstat  traceroute iotop locales-all parted lvm2 curl dialog docker-compose docker.io -y

timedatectl set-timezone America/Sao_Paulo
