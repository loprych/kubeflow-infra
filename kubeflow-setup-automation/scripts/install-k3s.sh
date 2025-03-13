#!/bin/bash
curl -sfL https://get.k3s.io | sh -

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

sudo chmod 644 /etc/rancher/k3s/k3s.yaml

echo "k3s installed"
