#!/bin/bash
#Script to add one new disk of 5GB in the VM centos8
disk3="centos8_3.vdi"
if [ -f "$disk3" ]
then
	echo "$disk3 found."
  echo "Removing the old disk and creating the new one"
  rm centos8_3.vdi
  VBoxManage storageattach centos8 --storagectl "SATA Controller" --port 2 --device 0 --type hdd  --medium emptydrive
  vboxmanage closemedium disk centos8_3.vdi --delete
  VBoxManage createhd --filename ./centos8_3.vdi --size 5128
else
	echo "$disk3 not found."
    echo "Creating disk centos8_3.vdi with size of 5GB"
  VBoxManage createhd --filename ./centos8_3.vdi --size 5128
fi

VBoxManage storageattach centos8 --storagectl "SATA Controller" --port 2 --device 0 --type hdd  --medium ./centos8_3.vdi
