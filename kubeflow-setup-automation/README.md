# Kubeflow Setup Automation

## Kustomization structure

```
.
├── core
│   ├── base
│   │   └── kustomization.yaml
│   └── overlays
│       └── default
│           └── kustomization.yaml
├── CRD
│   ├── base
│   │   └── kustomization.yaml
│   └── overlays
│       └── default
│           └── kustomization.yaml
├── https-config
│   ├── base
│   │   ├── cluster-issuer.yaml
│   │   ├── kubeflow-certificate.yaml
│   │   ├── kustomization.yaml
│   │   └── tls-secret.yaml
│   └── overlays
│       └── gateway-https
│           ├── kustomization.yaml
│           └── patches
│               └── gateway.yaml
├── infrastructure
│   ├── base
│   │   └── kustomization.yaml
│   └── overlays
│       └── nodeport
│           ├── kustomization.yaml
│           └── patches
│               └── ingressgateway-nodeport.yaml
├── knative
│   ├── base
│   │   ├── components
│   │   │   ├── eventing-core
│   │   │   │   └── kustomization.yaml
│   │   │   ├── eventing-crds
│   │   │   │   └── kustomization.yaml
│   │   │   └── serving
│   │   │       └── kustomization.yaml
│   │   └── kustomization.yaml
│   └── overlays
│       └── default
│           └── kustomization.yaml
├── kserve
│   ├── base
│   │   ├── components
│   │   │   ├── core
│   │   │   │   └── kustomization.yaml
│   │   │   └── models-web-app
│   │   │       └── kustomization.yaml
│   │   └── kustomization.yaml
│   └── overlays
│       └── default
│           └── kustomization.yaml
├── ml-components
│   ├── base
│   │   └── kustomization.yaml
│   └── overlays
│       └── default
│           └── kustomization.yaml
├── notebooks
│   └── base
│       ├── kustomization.yaml
│       └── overlays
│           └── default
│               └── kustomization.yaml
├── pipeline
│   ├── base
│   │   ├── kustomization.yaml
│   │   └── resources
│   │       ├── minio-rbac.yaml
│   │       ├── minio-secret-kserve.yaml
│   │       ├── minio-service.yaml
│   │       ├── mlpipeline-minio-artifact.yaml
│   │       └── poddefault.yaml
│   └── overlays
│       └── ui-customization
│           ├── kustomization.yaml
│           └── patches
│               └── ml-pipeline-ui-deployment.yaml
├── README.md
└── scripts
    ├── apply-knative-eventing.sh
    ├── apply-kserve.sh
    ├── generate-certs.sh
    ├── install-k3s.sh
    └── uninstall-k3s.sh

```

## Environment preparation

 Check kubectl:
```bash
kubectl version
```

## Installation

1. CRD install:
```bash
cd ~/kubeflow-setup-automation

kubectl kustomize CRD/base | kubectl apply -f -

kubectl wait --for=condition=established --timeout=60s crd/gateways.networking.istio.io
kubectl wait --for=condition=established --timeout=60s crd/certificates.cert-manager.io
```

2. Infra setup:
```bash
kubectl kustomize infrastructure/base | kubectl apply -f -


kubectl wait --for=condition=Available --timeout=300s -n cert-manager deployment/cert-manager
kubectl wait --for=condition=Available --timeout=300s -n istio-system deployment/istiod
kubectl wait --for=condition=Available --timeout=300s -n auth deployment/dex
kubectl wait --for=condition=Available --timeout=300s -n oauth2-proxy deployment/oauth2-proxy

kubectl kustomize infrastructure/overlays/nodeport/ | kubectl apply -f -
```

3. Instalacja core components:
```bash
kubectl kustomize core/base | kubectl apply -f -

kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/centraldashboard
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/profiles-deployment
```

4. HTTPS configuration:
```bash
./scripts/generate-certs.sh
kubectl kustomize https-config/overlays/gateway-https | kubectl apply -f -
kubectl wait --for=condition=Ready --timeout=300s -n istio-system certificate/kubeflow-tls
```

5. ML Components install:
```bash
kubectl kustomize ml-components/base | kubectl apply -f -

kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/admission-webhook-deployment
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/jupyter-web-app-deployment
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/katib-controller
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/katib-db-manager
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/katib-mysql
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/katib-ui
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/notebook-controller-deployment
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/profiles-deployment
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/pvcviewer-controller-manager
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/tensorboard-controller-deployment
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/tensorboards-web-app-deployment
kubectl wait --for=condition=Available --timeout=300s -n kubeflow deployment/volumes-web-app-deployment
```

6. Pipeline install and ml-pipeline-ui customization:
```bash
kubectl kustomize pipeline/base | kubectl apply -f -
# In case of issues with ml-pipeline pod crashloopback, reapply may be needed
kubectl kustomize pipeline/base | kubectl delete -f -
kubectl kustomize pipeline/base | kubectl apply -f -

kubectl kustomize pipeline/overlays/ui-customization | kubectl apply -f -
```

7. Knative install:
```bash
kubectl kustomize knative/base | kubectl apply -f -

kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-crds.yaml

kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-core.yaml
```

8. KServe install:
```bash
kubectl kustomize kserve/base/components/core | kubectl apply --server-side --force-conflicts -f -

kubectl kustomize kserve/overlays/default/ | kubectl apply -f -
```

## Verify installation

1. Check state of pods in key namespaces:
```bash
for ns in kubeflow istio-system cert-manager auth; do
  echo "Checking namespace: $ns"
  kubectl get pods -n $ns
done
```

2. Check if the secrets are created correctly:
```bash
kubectl get secrets -n istio-system kubeflow-tls
kubectl get certificate -n istio-system
```

3. Check KNative and KServe
```bash
kubectl get pods -n knative-serving
kubectl get pods -n kubeflow | grep kserve
```

4. MinIO access
```bash
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
```
Open https://localhost:9000


