#!/bin/bash
sudo /usr/local/bin/k3s-uninstall.sh
sudo rm -rf /var/lib/rancher
sudo rm -rf /etc/rancher
echo "k3s uninstalled"