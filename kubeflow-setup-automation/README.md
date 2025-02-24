# Kubeflow Setup Automation

Automatyzacja konfiguracji Kubeflow używając Kustomize. Doszło do redukcji około 36 manualnych kroków do 8 komend, zachowując oryginalną kolejność instalacji komponentów.

## Struktura projektu

```
.
├── CRD/                    # Custom Resource Definitions
│   └── kustomization.yaml
├── infrastructure/         # Komponenty infrastruktury
│   ├── base/              # cert-manager, istio, dex, oauth2-proxy
│   └── overlays/
│       └── nodeport/      # Konfiguracja NodePort dla istio-ingressgateway
├── core/                  # Podstawowe komponenty Kubeflow
│   └── kustomization.yaml  # namespace, roles, networkpolicies, dashboard
├── notebooks/            # Komponenty Jupyter
│   └── kustomization.yaml  # notebook-controller, web-app, volumes
├── https-config/          # Konfiguracja HTTPS
│   ├── base/
│   │   ├── cluster-issuer.yaml
│   │   └── kubeflow-certificate.yaml
│   └── overlays/
│       └── gateway-https/
├── knative/              # Knative Serving i Eventing
│   ├── base/
│   │   └── resources/
│   └── overlays/
│       └── default/
├── kserve/               # KServe i Model Serving
│   ├── base/
│   └── overlays/
│       └── default/
├── ml-components/        # ML komponenty (Katib, Training-operator)
│   └── kustomization.yaml
└── pipeline/            # Kubeflow Pipeline
    ├── base/
    │   └── resources/   # Konfiguracja minio
    └── overlays/
        └── ui-customization/  # Customizacja UI i metadata
```

## Kolejność instalacji (zgodna z oryginalną instrukcją manualną)

1. Instalacja CRDs:
```bash
kubectl apply -k CRD/
kubectl wait --for=condition=established --timeout=60s crd/gateways.networking.istio.io
```

2. Instalacja infrastruktury (cert-manager, istio, dex, oauth2-proxy):
```bash
kubectl apply -k infrastructure/overlays/nodeport/
kubectl wait --for=condition=Available --timeout=300s -n cert-manager deployment/cert-manager
kubectl wait --for=condition=Available --timeout=300s -n istio-system deployment/istiod
```

3. Instalacja core components:
```bash
kubectl apply -k core/
```

4. Instalacja komponentów notebooks:
```bash
kubectl apply -k notebooks/
```

5. Konfiguracja HTTPS:
```bash
kubectl apply -k https-config/overlays/gateway-https/
```

6. Instalacja Knative (wymagane dla KServe):
```bash
kubectl apply -k knative/overlays/default/
kubectl wait --for=condition=Available --timeout=300s -n knative-serving deployment/activator
```

7. Instalacja KServe i pozostałych komponentów ML:
```bash
kubectl apply -k kserve/overlays/default/
kubectl apply -k ml-components/
```

8. Instalacja pipeline z customizacją:
```bash
kubectl apply -k pipeline/overlays/ui-customization/
```

## Weryfikacja instalacji

1. Sprawdź stan podów w kluczowych namespace'ach:
```bash
for ns in kubeflow istio-system cert-manager knative-serving kserve; do
  echo "Checking namespace: $ns"
  kubectl get pods -n $ns
done
```

- HTTPS:
```bash
kubectl port-forward svc/istio-ingressgateway -n istio-system 8443:443
# Otwórz https://kubeflow.local:8443
```

## Stworzone overlays

- `infrastructure/overlays/nodeport/` - NodePort dla istio-ingressgateway
- `https-config/overlays/gateway-https/` - Konfiguracja HTTPS
- `knative/overlays/default/` - Podstawowa konfiguracja Knative
- `kserve/overlays/default/` - Podstawowa konfiguracja KServe
- `pipeline/overlays/ui-customization/` - Modyfikacje UI pipeline'u

## Uwagi

- Kolejność instalacji jest kluczowa i odzwierciedla oryginalną instrukcję manualną
- Patche i overlays są zorganizowane w sposób modularny dla łatwiejszego maintenancu
- Przed instalacją kolejnego komponentu upewnij się, że poprzedni jest w pełni gotowy
- Wszystkie ścieżki w kustomization.yaml są relatywne do głównego katalogu