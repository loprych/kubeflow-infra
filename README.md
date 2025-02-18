## install k3s
```bash
curl -sfL https://get.k3s.io | sh -
```
```bash
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
```
## cert-manager
```bash
cd ~/manifests/common/cert-manager/base 
kubectl kustomize . | kubectl apply -f -
```

## kubeflow-issuer
```bash
cd ~/manifests/common/cert-manager/kubeflow-issuer/base
kubectl kustomize . | kubectl apply -f -
```

## istio
```bash
cd ~/manifests/common/istio-1-23/istio-crds/base 
kubectl kustomize . | kubectl apply -f -

cd ~/manifests/common/istio-1-23/istio-namespace/base
kubectl kustomize . | kubectl apply -f -

cd ~/manifests/common/istio-1-23/istio-install/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
```
## oauth2-proxy
```bash
cd ~/manifests/common/oauth2-proxy/overlays/m2m-dex-and-kind
kubectl kustomize . | kubectl apply -f -
```

## dex
```bash
cd ~/manifests/common/dex/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
```
## kubeflow-namespace
```bash
cd ~/manifests/common/kubeflow-namespace/base
kubectl kustomize . | kubectl apply -f -
```

## networkpolicies
```bash
cd ~/manifests/common/networkpolicies/base 
kubectl kustomize . | kubectl apply -f -
```

## kubeflow-roles
```bash
cd ~/manifests/common/kubeflow-roles/base
kubectl kustomize . | kubectl apply -f -
```

## kubeflow-istio-resources
```bash
cd ~/manifests/common/istio-1-23/kubeflow-istio-resources/base
kubectl kustomize . | kubectl apply -f -
```

## apps/centraldashboard
```bash
cd ~/manifests/apps/centraldashboard/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
```

## profiles + kfam
```bash
cd ~/manifests/apps/profiles/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
```

## user-namespace
```bash
cd ~/manifests/common/user-namespace/base
kubectl kustomize . | kubectl apply -f -
```
```bash
kubectl patch svc istio-ingressgateway -n istio-system \
  -p '{"spec": {"type": "NodePort"}}'
```
```bash
kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80
```
# DASHBOARD DONE

# NOTEBOOKS

## notebooks 
```bash
cd ~/manifests/apps/jupyter/notebook-controller/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
```

## jupyter webapp
```bash
cd ~/manifests/apps/jupyter/jupyter-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
```

## pvc viewer-controller
```bash
cd ~/manifests/apps/pvcviewer-controller/upstream/base
kubectl kustomize . | kubectl apply -f -
```

## volumes webapp
```bash
cd ~/manifests/apps/volumes-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
```

## admission-webhook
```bash
cd ~/manifests/apps/admission-webhook/upstream/overlays/cert-manager
kubectl kustomize . | kubectl apply -f -
```

# NOTEBOOKS DONE

# https

## create file
```bash
touch ~/https/cluster-issuer.yaml
```

```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: selfsigned-cluster-issuer
spec:
  selfSigned: {}
```

```bash
kubectl apply -f cluster-issuer.yaml

sudo mkdir -p /etc/ssl/certs/kubeflow

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/certs/kubeflow/kubeflow.key \
  -out /etc/ssl/certs/kubeflow/kubeflow.crt \
  -subj "/CN=kubeflow.local"

sudo kubectl create secret tls kubeflow-tls \
  --cert=/etc/ssl/certs/kubeflow/kubeflow.crt \
  --key=/etc/ssl/certs/kubeflow/kubeflow.key \
  -n istio-system
```

```bash
kubectl edit gateway kubeflow-gateway -n kubeflow
```

```yaml
# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.
#
apiVersion: networking.istio.io/v1
kind: Gateway
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"networking.istio.io/v1alpha3","kind":"Gateway","metadata":{"annotations":{},"name":"kubeflow-gateway","namespace":"kubeflow"},"spec":{"selector":{"istio":"ingressgateway"},>
  creationTimestamp: "2025-01-16T14:55:17Z"
  generation: 1
  name: kubeflow-gateway
  namespace: kubeflow
  resourceVersion: "1548"
  uid: ede4216f-ff9d-45df-9637-99954b1865e6
spec:
  selector:
    istio: ingressgateway
  servers:
  - hosts:
    - '*'
    port:
      name: http
      number: 80
      protocol: HTTP
  - hosts:
    - '*' 
    port:
      name: https
      number: 443
      protocol: HTTPS
    tls:
      mode: SIMPLE
      credentialName: kubeflow-tls
```
## create file
```bash
~/https/kubeflow-certificate.yaml
```

```yaml
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: kubeflow-tls
  namespace: istio-system
spec:
  secretName: kubeflow-tls
  duration: 4320h
  renewBefore: 720h 
  issuerRef:
    name: selfsigned-cluster-issuer
    kind: ClusterIssuer
  dnsNames:
  - kubeflow.local
```
```bash
kubectl apply -f cluster-issuer.yaml

kubectl apply -f kubeflow-certificate.yaml

kubectl port-forward svc/istio-ingressgateway -n istio-system 8443:443
Forwarding from 127.0.0.1:8443 -> 8443
Forwarding from [::1]:8443 -> 8443
kubectl get svc istio-ingressgateway -n istio-system
```

https://kubeflow.local:<port-number>

# https done

# rest of apps
## tensorboard web app
```bash
cd ~/manifests/apps/tensorboard/tensorboards-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
```

## tensorboard controller
```bash
cd ~/manifests/apps/tensorboard/tensorboard-controller/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
```

## katib
```bash
cd ~/manifests/apps/katib/upstream/installs/katib-with-kubeflow
kubectl kustomize . | kubectl apply -f -
```

# kubeflow-pipelines second attempt

## crd
```bash
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/cluster-scoped-resources
kubectl kustomize . | kubectl apply -f -
```

## pipelines
```bash
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/platform-agnostic-multi-user
kubectl kustomize . | kubectl apply -f -
```

### fix pipeline pods startup fail
```bash
kubectl kustomize . | kubectl delete -f -
```
```bash
kubectl kustomize . | kubectl apply -f -
```

### fix metadata issue in pipelines
```bash
kubectl edit deployment ml-pipeline-ui -n kubeflow
```

```yaml
   - env:
        - name: DISABLE_GKE_METADATA
          value: "true"
        - name: ARGO_ARCHIVE_LOGS
          value: "true"
        - name: VIEWER_TENSORBOARD_POD_TEMPLATE_SPEC_PATH
          value: /etc/config/viewer-pod-template.json
        - name: DEPLOYMENT
          value: KUBEFLOW
```

```bash
kubectl rollout restart deployment ml-pipeline-ui -n kubeflow
```

## knative-serving

```bash
cd ~/manifests/common/knative/knative-serving/overlays/gateways
kubectl kustomize . | kubectl apply -f -
```

```bash
cd ~/manifests/common/istio-1-23/cluster-local-gateway/base
kubectl kustomize . | kubectl apply -f -
```

## knative-eventing
```bash
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-crds.yaml
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-core.yaml
```


## kserve
```bash
cd ~/manifests/contrib/kserve/kserve
kubectl kustomize . | kubectl apply --server-side --force-conflicts -f -
```

```bash
cd ~/manifests/contrib/kserve/models-web-app/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
```

## training-operator
```bash
cd ~/manifests/apps/training-operator/upstream/overlays/kubeflow 
kubectl kustomize . | kubectl apply -f -
```

## access minio
```bash
kubectl get secret mlpipeline-minio-artifact -n kubeflow -o jsonpath="{.data.secretkey}" | base64 --decode
minio123
kubectl get secret mlpipeline-minio-artifact -n kubeflow -o jsonpath="{.data.accesskey}" | base64 --decode
minio
```
```bash
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
```

## pipeline
```bash
kubectl apply -f poddefault.yaml -n kubeflow-user-example-com
```
```bash
kubectl patch svc ml-pipeline -n kubeflow -p '{"spec": {"type": "NodePort"}}'
```

# cheatsheet

## uninstall k3s
```bash
sudo /usr/local/bin/k3s-uninstall.sh
```
```bash
sudo rm -rf /var/lib/rancher
sudo rm -rf /etc/rancher
```


``bash
kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80

kubectl patch svc istio-ingressgateway -n istio-system \
  -p '{"spec": {"type": "NodePort"}}'

kubectl get svc istio-ingressgateway -n istio-system -o yaml
```
### check commands 
```bash
kubectl get svc istio-ingressgateway -n istio-system -o yaml
curl -v http://10.42.0.22:8081/kfam
kubectl logs -n kubeflow deployment/profiles-deployment
kubectl get svc -n kubeflow profiles-kfam
kubectl describe pod oauth2-proxy-75cc8f8677-j8jkg -n oauth2-proxy
kubectl logs -n auth -l app=dex
kubectl logs -n oauth2-proxy -l app.kubernetes.io/name=oauth2-proxy
kubectl logs -n kubeflow -l app=centraldashboard
kubectl get pods -A
```

### fix
cpu 300% 
```bash
ps aux | grep apiserver
```
```bash
sudo kill <process-number>
``
