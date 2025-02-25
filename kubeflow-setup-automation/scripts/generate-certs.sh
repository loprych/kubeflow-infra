#!/bin/bash

# Directory for certificates
sudo mkdir -p /etc/ssl/certs/kubeflow

# Generate certificates
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/certs/kubeflow/kubeflow.key \
  -out /etc/ssl/certs/kubeflow/kubeflow.crt \
  -subj "/CN=kubeflow.local"

# Generate base64 from certificates
CERT_B64=$(sudo base64 -w 0 /etc/ssl/certs/kubeflow/kubeflow.crt)
KEY_B64=$(sudo base64 -w 0 /etc/ssl/certs/kubeflow/kubeflow.key)

# Create tls-secret.yaml
cat > https-config/base/tls-secret.yaml << EOF
apiVersion: v1
kind: Secret
metadata:
  name: kubeflow-tls
  namespace: istio-system
type: kubernetes.io/tls
data:
  tls.crt: ${CERT_B64}
  tls.key: ${KEY_B64}
EOF