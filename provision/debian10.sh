#!/bin/bash

apt-get update

apt-get install -y vim net-tools mailutils tzdata sysstat traceroute iotop locales-all parted lvm2 curl dialog

timedatectl set-timezone America/Sao_Paulo
