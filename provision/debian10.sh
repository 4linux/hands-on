#!/bin/bash

sudo apt update

sudo apt install vim net-tools  mailutils tzdata  sysstat  traceroute iotop locales-all parted lvm2 curl dialog docker-compose docker.io -y

sudo timedatectl set-timezone America/Sao_Paulo
