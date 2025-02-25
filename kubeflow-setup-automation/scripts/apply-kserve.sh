#!/bin/bash
# Apply KServe CRDs with server-side apply
echo "Applying KServe CRDs with server-side apply..."
cd ~/manifests/contrib/kserve/kserve
kubectl kustomize . | kubectl apply --server-side --force-conflicts -f -

# Apply remaining KServe components normally
echo "Applying KServe components..."
cd ~/kubeflow-setup-automation/kserve/overlays/default
kubectl kustomize . | kubectl apply -f -