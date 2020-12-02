#!/bin/bash
#Script to create two new disks of 10GB in the VM centos8
vagrant halt centos8

VBoxManage showvminfo centos8| grep  "SATA Controller"
if [ $? -eq 0 ]
then
  echo "Sata Controller already exists"
else
  echo "Sata Controller does not exist"
  echo "Creating Sata Controller"
  VBoxManage storagectl centos8 --name "SATA Controller" --add sata --bootable on
fi

disk1="centos8_1.vdi"
if [ -f "$disk1" ]
then
	echo "$disk1 found."
  echo "Removing the old disk and creating disk centos8_1.vdi with size of 10GB"
  rm  centos8_1.vdi
  VBoxManage storageattach centos8 --storagectl "SATA Controller" --port 0 --device 0 --type hdd  --medium emptydrive
  vboxmanage closemedium disk centos8_1.vdi --delete
  VBoxManage createhd --filename ./centos8_1.vdi --size 10024
else
	echo "$disk1 not found."
  echo "Creating disk centos8_1.vdi with size of 10GB"
  VBoxManage createhd --filename ./centos8_1.vdi --size 10024
fi

disk2="centos8_2.vdi"
if [ -f "$disk2" ]
then
	echo "$disk2 found."
  echo "Removing the old disk and creating the new one"
  rm centos8_2.vdi
  VBoxManage storageattach centos8 --storagectl "SATA Controller" --port 1 --device 0 --type hdd  --medium emptydrive
  vboxmanage closemedium disk centos8_2.vdi --delete
  VBoxManage createhd --filename ./centos8_2.vdi --size 10024
else
	echo "$disk1 not found."
    echo "Creating disk centos8_2.vdi with size of 10GB"
  VBoxManage createhd --filename ./centos8_2.vdi --size 10024
fi

VBoxManage showvminfo centos8| egrep  "centos8.vdi"

if [ $? -eq 0 ]
then
  echo "VM Disks centos8 already exists"
else
  echo "VM Disks centos8 does not exist"
  VBoxManage storageattach centos8 --storagectl "SATA Controller" --port 0 --device 0 --type hdd  --medium ./centos8_1.vdi
  VBoxManage storageattach centos8 --storagectl "SATA Controller" --port 1 --device 0 --type hdd  --medium ./centos8_2.vdi
fi

echo "Starting VM CentOs 8"
vagrant up centos8
