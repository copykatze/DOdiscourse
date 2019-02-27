#!/usr/bin/env bash

echo 'if the folder this script is executed in contains a (pre-configured) app.yaml, it will be transferred to the droplet and used for the initial build.'
read -p 'Enter Droplet-IP: ' VAR_IP

scp app.yml root@$VAR_IP:/var/discourse/containers/
ssh $VAR_IP -l root -t "mv /var/lib/digitalocean/discourse.sh /var/lib/digitalocean/discourse.sh.bak"
scp DOdiscourse-DROPLET.sh root@$VAR_IP:~

echo "connecting to ${VAR_IP%/*}" 
ssh $VAR_IP -l root -t "bash ~/DOdiscourse-DROPLET.sh"
