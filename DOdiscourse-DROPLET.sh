#!/usr/bin/env bash

### create 2GB persistent SWAP with swampiness set to 10
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sysctl vm.swappiness=10
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
free -h
cat /proc/sys/vm/swappiness
echo 'DONE'

### execute discourse setup
bash /var/discourse/discourse-setup
