#!/bin/bash

sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config

setenforce 0

yum -y install ntp net-snmp bind-utils net-tools tcpdump  telnet vim epel-release iftop wget  tzdata tzdata-java lsof
yum -y update
yum -y install open-vm-tools.x86_64 nmon sysstat htop traceroute iotop screen

systemctl stop firewalld && systemctl disable firewalld
systemctl stop NetworkManager && systemctl disable NetworkManager

timedatectl set-timezone America/Sao_Paulo
