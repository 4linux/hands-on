#!/bin/bash

sudo apt update

apt-get install -y vim net-tools mailutils tzdata sysstat traceroute iotop locales-all parted lvm2 curl dialog docker-compose docker.io

sudo timedatectl set-timezone America/Sao_Paulo
