#!/bin/bash

sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config

setenforce 0

dnf install -y chrony bind-utils net-tools tcpdump telnet vim epel-release  wget  mailx tzdata tzdata-java  sysstat  traceroute iotop langpacks-en glibc-all-langpacks bc openldap-clients lvm2 network-scripts

systemctl disable firewalld NetworkManager

systemctl enable network && > /etc/sysconfig/disable-deprecation-warnings

systemctl stop firewalld NetworkManager

timedatectl set-timezone America/Sao_Paulo
