sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config

sudo setenforce 0

sudo yum  install chrony bind-utils net-tools tcpdump telnet vim epel-release  wget  mailx tzdata tzdata-java  sysstat  traceroute iotop langpacks-en glibc-all-langpacks bc openldap-clients lvm2 -y

sudo  systemctl disable firewalld

sudo  yum install network-scripts -y

sudo systemctl enable network

sudo touch /etc/sysconfig/disable-deprecation-warnings

sudo systemctl disable NetworkManager

sudo systemctl stop firewalld

sudo systemctl stop NetworkManager

sudo timedatectl set-timezone America/Sao_Paulo
