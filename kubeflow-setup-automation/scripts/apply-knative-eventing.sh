#!/bin/bash
# Apply Knative Eventing using direct kubectl commands

set -e  # Exit immediately if a command exits with a non-zero status

echo "Installing Knative Eventing CRDs..."
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-crds.yaml

echo "Waiting for CRDs to be established..."
sleep 10

echo "Installing Knative Eventing Core components..."
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-core.yaml

echo "Knative Eventing installation complete!"