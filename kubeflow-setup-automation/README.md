# Kubeflow Setup Automation

## Struktura projektu

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
    └── generate-certs.sh
```

## Przygotowanie środowiska

1. Upewnij się, że masz zainstalowane wymagane narzędzia:
```bash
kubectl version
```

2. Przygotuj skrypty pomocnicze:
```bash
chmod +x scripts/generate-certs.sh
chmod +x scripts/apply-knative-eventing.sh
chmod +x scripts/apply-kserve.sh
```

## Kolejność instalacji

1. Instalacja CRDs:
```bash
cd ~/kubeflow-setup-automation

kubectl kustomize CRD/base | kubectl apply -f -

kubectl wait --for=condition=established --timeout=60s crd/gateways.networking.istio.io
kubectl wait --for=condition=established --timeout=60s crd/certificates.cert-manager.io
```

2. Instalacja infrastruktury:
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
```

4. Instalacja komponentów notebooks:
```bash
kubectl kustomize notebooks/base | kubectl apply -f -
```

5. Konfiguracja HTTPS:
```bash
./scripts/generate-certs.sh
kubectl kustomize https-config/overlays/gateway-https | kubectl apply -f -
kubectl wait --for=condition=Ready --timeout=300s -n istio-system certificate/kubeflow-tls
```

6. Instalacja komponentów ML:
```bash
kubectl kustomize ml-components/base | kubectl apply -f -
```

7. Instalacja pipeline z customizacją:
```bash
kubectl kustomize pipeline/base | kubectl apply -f -
# Możliwy potrzebny restart dla rozwiązania problemów z uruchomieniem
kubectl kustomize pipeline/base | kubectl delete -f -
kubectl kustomize pipeline/base | kubectl apply -f -

kubectl kustomize pipeline/overlays/ui-customization | kubectl apply -f -
```

8. Instalacja Knative:
```bash
# Instalacja Knative Serving
kubectl kustomize knative/base/components/serving | kubectl apply -f -

kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-crds.yaml

kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-core.yaml
```

9. Instalacja KServe:
```bash
kubectl kustomize kserve/base/components/core | kubectl apply --server-side --force-conflicts -f -

kubectl kustomize kserve/overlays/default/ | kubectl apply -f -
```

## Weryfikacja instalacji

1. Sprawdź stan podów w kluczowych namespace'ach:
```bash
for ns in kubeflow istio-system cert-manager auth; do
  echo "Checking namespace: $ns"
  kubectl get pods -n $ns
done
```

2. Sprawdź, czy certyfikaty zostały poprawnie utworzone:
```bash
kubectl get secrets -n istio-system kubeflow-tls
kubectl get certificate -n istio-system
```

3. Sprawdź stan komponentów Knative i KServe:
```bash
kubectl get pods -n knative-serving
kubectl get pods -n kubeflow | grep kserve
```
3. Dostęp do minIO
```bash
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
```
Otwórz https://localhost:9000

## Troubleshooting

1. Problemy z Knative:
```bash
# Sprawdź CRDs Knative
kubectl get crd | grep knative

# Sprawdź logi podów Knative
kubectl logs -n knative-serving -l app=controller
```

