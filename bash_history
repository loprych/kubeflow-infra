kubectl get pods -A -w
cd manifests/apps/pipeline/
ls
cd upstream/
ls
cat gcp-workload-identity-setup.sh 
kubectl edit deployment ml-pipeline-ui -n kubeflow
kubectl rollout restart deployment ml-pipeline-ui -n kubeflow
kubectl get pods -A
kubectl get pods -A -f
kubectl get pods -A -w
kubectl get pods -A
/usr/bin/python3 /home/loprych/.vscode-server/extensions/ms-python.python-2024.22.2-linux-x64/python_files/printEnvVariablesToFile.py /home/loprych/.vscode-server/extensions/ms-python.python-2024.22.2-linux-x64/python_files/deactivate/bash/envVars.txt
kubectl get pods -n cert-manager
kubectl get pods -n istio-system
kubectl get pods -n auth
kubectl get pods -n knative-eventing
kubectl get pods -n knative-serving
kubectl get pods -n kubeflow
kubectl get pods -n kubeflow-user-example-com
cd mnist-deployment/
ls
tree
kubectl get pods -A
cd ..
git clone https://github.com/gbhasin0828/Kubeflow_Pipeline
cd Kubeflow_Pipeline/
ls
tree
mkdir components
mkdir pipelines
ls
mv mlops_complete_pipeline_file.yaml pipelines/
ls
mv train_model.yaml components/
mv train_test_split.yaml components/
mv preprocess_dataset_component.yaml components/
ls
mv download_dataset_component.yaml components/
ls
tree
kubectl get pods -A
exit
deactivate
deactivate
deactivate
df -hR
df -hT
free -h
df -hT
top
python mnist.py --learning-rate 0.01 --batch-size 128 --optimizer adam
cd test
python mnist.py --learning-rate 0.01 --batch-size 128 --optimizer adam
cd test
docker build -t mnist-katib:test .
sudo docker images
pip install torch
df -h
free -h
df -h
deactivate
deactivate
clear
kubectl get pods -A
ls
mkdir test
touch test/mnist.py
cd test
ls
code mnist.py 
touch Dockerfile
python mnist.py --learning-rate 0.01 --batch-size 128 --optimizer adam
pip install torch
clear
df -hT
kubectl get pods -A
kubectl describe pod -n kubeflow workflow-controller-784cfd9c97-66gtd
kubectl get pods -A
kubectl describe pod -n kubeflow ml-pipeline-bf9f88745-czbts
/bin/python3 /home/loprych/.vscode-server/extensions/ms-python.python-2024.22.2-linux-x64/python_files/printEnvVariablesToFile.py /home/loprych/.vscode-server/extensions/ms-python.python-2024.22.2-linux-x64/python_files/deactivate/bash/envVars.txt
kubectl get nodes
kubectl config view
kubectl edit svc minio-service -n kubeflow
kubectl get svc istio-ingressgateway -n istio-system
kubectl get svc minio-service -n kubeflow
kubectl edit svc minio-service -n kubeflow
kubectl patch svc minio-service -n kubeflow   -p '{"spec": {"type": "NodePort", "ports": [{"port": 9000, "targetPort": 9000, "nodePort": 30968}]}}'
kubectl get svc minio-service -n kubeflow
sudo ufw allow 30968/tcp
telnet 192.168.55.103 30968
sudo apt install telnet
telnet 192.168.55.103 30968
kubectl get pods -n kubeflow -l app=minio-service
kubectl get pods -n kubeflow
kubectl get endpoints minio-service -n kubeflow
kubectl get pods -n kubeflow minio-7c77bc59b8-82wx4
kubectl logs  -n kubeflow minio-7c77bc59b8-82wx4
sudo netstat -tuln | grep 30968
curl http://10.42.0.183:9000
curl http://localhost:9000
kubectl get secrets -n kubeflow
kubectl get secret minio-secret -n kubeflow -o yaml
kubectl get secret mlpipeline-minio-artifact -n kubeflow -o jsonpath="{.data.accesskey}" | base64 --
kubectl get secret mlpipeline-minio-artifact -n kubeflow -o jsonpath="{.data.secret}" | base64 --
kubectl get secret mlpipeline-minio-artifact -n kubeflow -o jsonpath="{.data.secretkey}" | base64 --
kubectl get secret mlpipeline-minio-artifact -n kubeflow -o jsonpath="{.data.secretkey}" | base64 --decode
kubectl get secret mlpipeline-minio-artifact -n kubeflow -o jsonpath="{.data.accesskey}" | base64 --decode
df -hT
sudo docker image prune -a
df -hT
free -h
top
kubectl get pods -A
kubectl get namespaces
kubectl get all -n kubeflow
kubectl get serviceaccount kfp-user -n kubeflow -o jsonpath='{.secrets[0].name}'
kubectl -n kubeflow get pods | grep "ml-pipeline"
ls
rm -rf Kubeflow_Pipeline/ test/
ls
df -hT
cd var
cd /var/
ls
cd run
ls
cd sendsigs.omit.d/
cd ..
cd k3s/
ls
sudo ls
ls
sudo cd containerd
cd ..
tree
ls
kubectl get pods -a
kubectl get pods -A
kubectl get all -n kubeflow
kubectl logs -n kubeflow pod/admission-webhook-deployment-5644dcc957-bzvnk
kubectl get poddefault -n my-profile
kubectl get pods -n cert-manager
kubectl get secret -n kubeflow kubeflow-webhook-server-cert
kubectl get pods -A
kubectl get poddefault -n kubeflow-user-example-com
kubectl get secret -n kubeflow kubeflow-webhook-server-cert
kubectl get mutatingwebhookconfiguration kubeflow-poddefaults-webhook-config -o yaml | grep -e "scope:" -e "service:"
kubectl get rolebinding -n kubeflow-user-example-com allow-kfp-access -o yaml
kubectl get svc ml-pipeline -n kubeflow
kubectl get nodes
free -h
df -h
top
kubectl get poddefault -n kubeflow-user-example-com
# Powinien być: access-ml-pipeline
kubectl get secret -n kubeflow kubeflow-webhook-server-cert
# Powinien istnieć i mieć typ `kubernetes.io/tls`
kubectl get mutatingwebhookconfiguration kubeflow-poddefaults-webhook-config -o yaml | grep -e "scope:" -e "service:"
# Sprawdź czy:
# - `scope: "*"`
# - `service.name: admission-webhook-service`
# - `service.namespace: kubeflow`
kubectl get rolebinding -n kubeflow-user-example-com allow-kfp-access -o yaml
# Sprawdź czy:
# - `roleRef.name: kubeflow-edit`
# - `subjects[0].name: default-editor`
ls
mkdir pipeline-config
cd pipeline-config/
code poddefault.yaml
kubectl apply -f poddefault.yaml -n kubeflow-user-example-com
kubectl get pods -A
cd /var/run
ls
kubectl get deployment ml-pipeline -n kubeflow -o jsonpath='{.spec.template.spec.containers[0].image}'
kubectl get pods -A
kubectl get pods -n kubeflow-user-example-com
kubectl get pods -n kubeflow-user-example-com -w
# Przykładowa nazwa: allow-kfp-access
kubectl describe rolebinding allow-kfp-access -n kubeflow-user-example-com
kubectl describe clusterrole kubeflow-edit
# Powinno zawierać uprawnienia do `pipelines.kubeflow.org` (np. tworzenie workflowów).
kubectl describe clusterrole kubeflow-edit
kubectl get rolebinding default-editor -n kubeflow-user-example-com -o yaml
kubectl describe clusterrole kubeflow-edit | grep "pipelines.kubeflow.org"
cd ~
kubectl get pods -A -w
kubectl get pods -A
kubectl get svc -n kubeflow
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
kubectl get secret mlpipeline-minio-artifact   -n kubeflow-user-example-com   -o yaml
echo "BASE64_TEKST_Z_ACCESSKEY" | base64 -d
echo "BASE64_TEKST_Z_SECRETKEY" | base64 -d
kubectl describe svc minio-service -n kubeflow
kubectl get deploy -n kubeflow | grep minio
kubectl edit deploy minio -n kubeflow
kubectl get pods -A -w
kubectl port-forward pod/minio-7c77bc59b8-82wx4 -n kubeflow 9000:9000 9001:9001
df -hT
free -h
top
cd pipeline-config/
cat poddefault.yaml 
cat minio-secret.yaml 
cat minio-service-account.yaml 
ls
cat minio-rbac.yaml 
kubectl get pods -A
kubectl apply -f minio-rbac.yaml 
kubectl get pods -A
kubectl exec -it notebook2601-0 -- curl http://minio-service.kubeflow:9000
kubectl exec -it mnist-tensorboard-1-5ffbd85c4b-ws59l -- curl http://minio-service.kubeflow:9000
kubectl apply -f poddefault.yaml 
kubectl get svc -n kubeflow | grep minio
kubectl get pods -A
kubectl logs -n kubeflow-user-example-com mnist-kubeflow-notebook-pipeline-hwj9r-system-container-impl-4266470247
kubectl describe pod -n kubeflow-user-example-com mnist-kubeflow-notebook-pipeline-hwj9r-system-container-impl-4266470247
kubectl describe pod -n kubeflow-user-example-com mnist-kubeflow-notebook-pipeline-hwj9r-system-container-impl-4266470247 | grep limits
kubectl get pods -A -w
cd pipeline-config/
code minio-sa.yaml
mv set-minio-kserve-secret.yaml minio-secret.yaml
kubectl apply -f minio-secret.yaml
kubectl apply -f minio-sa.yaml
kubectl get pods -A 
kubectl describe node pear | grep -A 5 Allocatable
touch minio-rbac.yaml
mv minio-sa.yaml minio-service-account.yaml
kubectl apply -f minio-secret.yaml
kubectl apply -f minio-service-account.yaml
kubectl apply -f minio-rbac.yaml
ls -l minio-rbac.yaml
cat minio-rbac.yaml
yamllint minio-rbac.yaml
kubectl apply -f minio-rbac.yaml
kubectl get role,rolebinding -n kubeflow-user-example-com | grep minio-access
kubectl describe serviceaccount sa-minio-kserve -n kubeflow-user-example-com
kubectl describe secret minio-kserve-secret -n kubeflow-user-example-com
kubectl describe role minio-access-role -n kubeflow-user-example-com
kubectl describe rolebinding minio-access-binding -n kubeflow-user-example-com
kubectl auth can-i create pods --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl auth can-i get secrets --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl delete role minio-access-role -n kubeflow-user-example-com
kubectl delete rolebinding minio-access-binding -n kubeflow-user-example-com
kubectl apply -f minio-rbac.yaml 
kubectl auth can-i create pods --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl auth can-i get secrets --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl logs -n kube-system kube-apiserver-master | grep -i "permission denied"
kubectl delete role minio-access-role -n kubeflow-user-example-com
kubectl delete rolebinding minio-access-binding -n kubeflow-user-example-com
kubectl apply -f minio-rbac.yaml 
kubectl get secret minio-kserve-secret -n kubeflow-user-example-com -o yaml
kubectl auth can-i create pods --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl auth can-i get secrets --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl get pods -A
kubectl delete role minio-access-role -n kubeflow-user-example-com
kubectl delete rolebinding minio-access-binding -n kubeflow-user-example-com
kubectl apply -f minio-rbac.yaml
kubectl auth can-i create pods --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl auth can-i get secrets --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl get pods -A
kubectl describe pod connection-0 -n kubeflow-user-example-com | grep -A 5 "Volumes"
cd ..
code test-pod.yaml
kubectl apply -f test-pod.yaml
kubectl get pods -A
kubectl get pods -A -w
kubectl exec -it test-pod -n kubeflow-user-example-com -- sh
kubectl get pods -A -w
kubectl apply -f test-pod.yaml
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com test-pod
kubectl get pods -A
kubectl apply -f test-pod.yaml
kubectl apply -f pipeline-config/minio-secret.yaml 
kubectl auth can-i create pods --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl auth can-i get secrets --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com test-pod
kubectl apply -n kubeflow-user-example-com -f poddefault.yaml
kubectl apply -n kubeflow-user-example-com -f minio-secret.yaml
kubectl apply -n kubeflow-user-example-com -f minio-service-account.yaml
kubectl apply -n kubeflow-user-example-com -f minio-rbac.yaml
cd pipeline-config/
kubectl apply -n kubeflow-user-example-com -f poddefault.yaml
kubectl apply -n kubeflow-user-example-com -f minio-secret.yaml
kubectl apply -n kubeflow-user-example-com -f minio-service-account.yaml
kubectl apply -n kubeflow-user-example-com -f minio-rbac.yaml
kubectl get poddefaults,sa,secrets,role,rolebinding -n kubeflow-user-example-com
kubectl auth can-i get secrets   --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve   -n kubeflow-user-example-com
kubectl auth can-i create pods --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl auth can-i get secrets --as=system:serviceaccount:kubeflow-user-example-com:sa-minio-kserve
kubectl apply -f poddefault.yaml -n kubeflow-user-example-com
kubectl version --client
kubectl logs -n kubeflow-user-example-com minio
kubectl get pods -A
kubectl logs -n kubeflow-user-example-com minio-7c77bc59b8-82wx4
kubectl logs -n kubeflow minio-7c77bc59b8-82wx4
kubectl get pods -n kubeflow | grep minio
kubectl describe rolebinding -n kubeflow-user-example-com | grep sa-minio-kserve
kubectl describe rolebinding -n kubeflow| grep sa-minio-kserve
kubectl describe rolebinding -n kubeflow | grep sa-minio-kserve
kubectl get pods -A
curl -k https://192.168.55.103:30967/pipeline/apis/v2beta1/healthz
kubectl get pods -A
kubectl get pods -n kubeflow-user-example-com
kubectl get svc -n kubeflow-user-example-com
kfp pipeline list
kubectl get pods -A
kubectl describe node
kubectl get svc -n kubeflow
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com hello-pipeline-888kn-system-container-driver-1031151334
kubectl delete pods -n kubeflow-user-example-com --field-selector=status.phase==Completed
kubectl delete pods -n kubeflow-user-example-com --field-selector=status.phase==Pending
kubectl delete pods -n kubeflow-user-example-com --field-selector=status.phase==Failed
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com net-tester-1737815523
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-qj9sh-system-container-impl-300414993
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-qj9sh-system-dag-driver-700280728
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-qj9sh-system-container-driver-3342884287
kubectl get pods -A
kubectl get inferenceservices -n kubeflow-user-example-com
cd pipeline-config/
kubectl apply -f set-minio-kserve-secret.yaml 
kubectl get pods -A
df -hT
free -h
top
kubectl get svc -n kubeflow minio-service
kubectl run -it --rm s3-test   --image=amazon/aws-cli   --serviceaccount=sa-minio-kserve   --namespace=kubeflow-user-example-com   --   aws --endpoint-url http://minio-service.kubeflow.svc.cluster.local:9000 s3 ls
kubectl run -it --rm s3-test   --image=amazon/aws-cli   --namespace=kubeflow-user-example-com   --overrides='{ "spec": { "serviceAccount": "sa-minio-kserve" } }'   --   aws --endpoint-url http://minio-service.kubeflow:9000 s3 ls
kubectl run -it --rm s3-test   --image=amazon/aws-cli   --namespace=kubeflow-user-example-com   --overrides='{ "spec": { "serviceAccount": "sa-minio-kserve" } }'   --   aws s3 --endpoint-url http://minio-service.kubeflow:9000 ls
kubectl run -it --rm mc-test   --image=minio/mc   --namespace=kubeflow-user-example-com   --overrides='{ "spec": { "serviceAccount": "sa-minio-kserve" } }'   --   mc alias set minio http://minio-service.kubeflow:9000 minio minio123 && mc ls minio
kubectl get role,rolebinding -n kubeflow-user-example-com | grep minio
kubectl run -it --rm network-test   --image=nicolaka/netshoot   --namespace=kubeflow-user-example-com   -- curl -v http://minio-service.kubeflow:9000
kubectl run -it --rm test-curl --image=curlimages/curl -n kubeflow-user-example-com -- curl -v http://minio-service.kubeflow:9000
kubectl describe secret minio-kserve-secret -n kubeflow-user-example-com
kubectl run -it --rm network-test   --image=nicolaka/netshoot   --namespace=kubeflow-user-example-com   -- curl -v http://minio-service.kubeflow:9000
kubectl get pods -A
free -h
ls
cd pipeline-config/
ls
code set-minio-kserve-secret.yaml
kubectl get pods -A
kubectl get pod -n kubeflow | grep minio
kubectl apply -f set-minio-kserve-secret.yaml 
kubectl get secret -n kubeflow-user-example-com minio-kserve-secret
kubectl get serviceaccount -n kubeflow-user-example-com sa-minio-kserve
kubectl run -it --rm s3-test --image=amazon/aws-cli --restart=Never -n kubeflow-user-example-com --   s3 --endpoint-url http://minio-service.kubeflow:9000 ls
kubectl get svc -A
kubectl get secret minio-kserve-secret -n kubeflow-user-example-com
kubectl describe sa sa-minio-kserve -n kubeflow-user-example-com
kubectl run -it --rm minio-tester --image=amazon/aws-cli --restart=Never -n kubeflow-user-example-com -- bash
# Wewnątrz kontenera wykonaj:
aws configure set aws_access_key_id minio
aws configure set aws_secret_access_key minio123
aws --endpoint-url http://minio-service.kubeflow:9000 s3 ls
aws configure set aws_access_key_id minio
kubectl run -it --rm net-tester --image=alpine/curl --restart=Never -n kubeflow-user-example-com -- sh
# Wewnątrz kontenera:
curl -v http://minio-service.kubeflow.svc.cluster.local:9000
kubectl run -it --rm net-tester --image=alpine/curl --restart=Never -n kubeflow-user-example-com -- sh
kubectl exec -it --rm net-tester --image=alpine/curl --restart=Never -n kubeflow-user-example-com -- sh
kubectl get pods -n kubeflow-user-example-com | grep net-tester
kubectl delete pod net-tester -n kubeflow-user-example-com --force
kubectl run -it --rm net-tester-$(date +%s) --image=alpine/curl --restart=Never -n kubeflow-user-example-com -- sh
kubectl exec -it -n kubeflow minio-7c77bc59b8-82wx4 -- mc admin user list minio
kubectl exec -it -n kubeflow minio-7c77bc59b8-82wx4 -- minio --version
kubectl get pods -A
kubectl logs -n kubeflow minio-7c77bc59b8-82wx4
curl http://127.0.0.1:9000
kubectl apply -f set-minio-kserve-secret.yaml
kubectl get secret minio-kserve-secret -n kubeflow-user-example-com -o yaml
kubectl get serviceaccount sa-minio-kserve -n kubeflow-user-example-com -o yaml
kubectl get service ml-pipeline-ui -n kubeflow
kubectl port-forward svc/ml-pipeline-ui -n kubeflow 8080:80
kubectl logs -n kubeflow-user-example-com mlops-pipeline-q7fqk-system-container-impl-2628370106
kubectl logs -n kubeflow-user-example-com mlops-pipeline-gt9cv-system-container-impl-3316237733 -f
df -hT
free -h
kubectl delete pod -n kubeflow-user-example-com hello-pipeline-bx2k4-system-container-driver-3806876684
kubectl delete pod -n kubeflow-user-example-com hello-pipeline-bx2k4-system-container-impl-222631650
kubectl delete pod -n kubeflow-user-example-com
kubectl delete pod -n kubeflow-user-example-com hello-pipeline-bx2k4-system-dag-driver-691342701
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-28nr8-system-dag-driver-278780857
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-6xn67-system-container-driver-538073364
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-6xn67-system-container-impl-1995417786
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-6xn67-system-dag-driver-3855262140
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-b9j9h-system-container-driver-1530387125
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-b9j9h-system-container-impl-3497210995
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-b9j9h-system-dag-driver-1995087011
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-l47qc-system-container-driver-3815058814
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-l47qc-system-dag-driver-3611591590
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-wd6hg-system-container-driver-1294432315
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-wd6hg-system-container-impl-745483917
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-wd6hg-system-dag-driver-1066334417
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-xnpc4-system-container-driver-2757665546
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-xnpc4-system-dag-driver-2410914210
kubectl delete pod -n kubeflow-user-example-com mnist-final-pipeline-xfnbn-system-container-driver-40453118
kubectl delete pod -n kubeflow-user-example-com mnist-final-pipeline-xfnbn-system-dag-driver-1924883034
kubectl delete pod -n kubeflow-user-example-com mnist-kubeflow-notebook-pipeline-hwj9r-system-container-driver-1580100521
kubectl delete pod -n kubeflow-user-example-com mnist-kubeflow-notebook-pipeline-hwj9r-system-container-impl-4266470247 mnist-kubeflow-notebook-pipeline-xb2dc-system-container-impl-24273706 mnist-pipeline-qj9sh-system-container-impl-29080778
kubectl delete pod -n kubeflow-user-example-com mnist-kubeflow-notebook-pipeline-hwj9r-system-dag-driver-4264157915 mnist-kubeflow-notebook-pipeline-hwj9r-system-dag-driver-4264157915  mnist-kubeflow-notebook-pipeline-xb2dc-system-container-driver-2355810916 mnist-kubeflow-notebook-pipeline-xb2dc-system-container-impl-24273706
kubectl delete pod -n kubeflow-user-example-com testowy-0
kubectl delete pod -n kubeflow-user-example-com mnist-training-pipeline-tvks7-system-container-driver-2775342211 mnist-training-pipeline-tvks7-system-container-impl-2496297797 mnist-training-pipeline-tvks7-system-dag-driver-1377595163
kubectl delete pod -n kubeflow-user-example-com mnist-kubeflow-notebook-pipeline-xb2dc-system-dag-driver-2806199896 mnist-pipeline-qj9sh-system-container-driver-2711743825 mnist-pipeline-qj9sh-system-container-driver-373859588 mnist-pipeline-qj9sh-system-container-impl-300414993 mnist-pipeline-qj9sh-system-container-impl-3084545823
kubectl delete pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543 mnist-training-pipeline-without-volumeop-wt7wq-system-container-driver-3090278195 mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957 mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957
kubectl delete pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-84wsw-system-container-driver-2645542950 mnist-training-pipeline-without-volumeop-84wsw-system-container-impl-3001991152  mnist-training-pipeline-without-volumeop-84wsw-system-dag-driver-1969704356 mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543 mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957 mnist-training-pipeline-without-volumeop-wt7wq-system-dag-driver-1495654539
kubectl delete pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543 mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957 mnist-training-pipeline-without-volumeopv2-85xqt-system-container-driver-2837060527 mnist-training-pipeline-without-volumeopv2-85xqt-system-container-driver-2858299429 mnist-training-pipeline-without-volumeopv2-85xqt-system-container-impl-871134113 mnist-training-pipeline-without-volumeopv2-85xqt-system-dag-driver-1598358239 mnist-training-pipeline-without-volumeopv2-cg9nc-system-container-driver-2152116545 mnist-training-pipeline-without-volumeopv2-cg9nc-system-dag-driver-1184662205
cd pip
cd pipeline-config/
cat poddefault.yaml 
cat minio-secret.yaml 
cat minio-service-account.yaml 
cat minio-rbac.yaml 
kubectl apply -f poddefault.yaml 
kubectl apply -f poddefault.yaml -n kubeflow-user-example-com
kubectl get poddefaults -n kubeflow-user-example-com
kubectl describe ns kubeflow-user-example-com
kubectl get pods -n kubeflow-user-example-com -o wide
kubectl describe pod notebook2601-0 -n kubeflow-user-example-com | grep -i "Service Account:"
kubectl describe pod testowy-0 -n kubeflow-user-example-com | grep -i "Service Account:"
df -hT
free -h
kubectl get pods -A -w
kubectl get pods -A 
kubectl logs -n kubeflow-user-example-com mnist-training-pipeline-cpfpt-system-container-impl-1085451943
kubectl describe pod notebook2601-0 -n kubeflow-user-example-com | grep -i "Service Account:"
kubectl get pods -A 
kubectl apply -f poddefault.yaml -n kubeflow-user-example-com
kubectl describe pod notebook2601-0 -n kubeflow-user-example-com | grep -i "Service Account:"
kubectl get pods -A 
kubectl logs -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543
kubectl describe pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com mnist-training-pipeline-cpfpt-system-container-driver-2531703017 mnist-training-pipeline-cpfpt-system-container-impl-1085451943  mnist-training-pipeline-cpfpt-system-dag-driver-1788185925 mnist-training-pipeline-without-volumeop-khhqz-system-container-driver-213594545  mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543 mnist-training-pipeline-without-volumeop-khhqz-system-dag-driver-808526893 
kubectl get pods -A
df -hT
free -h
kubectl get pods -A
kubectl describe pod -n kubeflow-user-example-com
kubectl describe pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543
kubectl get pods -A
kubectl logs -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957
kubectl describe pod  -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957
kubectl get pods -A
kubectl describe pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543
kubectl get pods -n kubeflow-user-example-con
kubectl get pods -n kubeflow-user-example-com
kubectl describe pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957
kubectl get pods -n kubeflow-user-example-con
kubectl get pods -n kubeflow-user-example-com
kubectl delete pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543 mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957 mnist-training-pipeline-without-volumeopv2-cg9nc-system-container-impl-1533984047
kubectl get pods -n kubeflow-user-example-com
kubectl describe pod -n mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543
kubectl describe pod -n kubeflow-user-example-con mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543
kubectl describe pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543
kubectl get pods -n kubeflow-user-example-com
kubectl describe pod -n kubeflow-example-com-user mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957
kubectl describe pod -n kubeflow-example-user-com mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957
kubectl get pods -n kubeflow-user-example-com
kubectl describe pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957
kubectl get pods -n kubeflow-user-example-com
kubectl get pods -A
kubectl logs -n kubeflow ml-pipeline-ui-648d574849-wbmtr
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeopv2-85xqt-system-container-impl-3403329859 mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957 mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com mnist-training-pipeline-without-volumeop-khhqz-system-container-impl-2391356543 mnist-training-pipeline-without-volumeop-wt7wq-system-container-impl-2965063957
kubectl get pods -A
kubectl describe pod -n kubeflow-user-example-com mlops-pipeline-b5shc-system-container-impl-2173680805
kubectl log -n kubeflow-user-example-com mlops-pipeline-b5shc-system-container-impl-2173680805
kubectl logs -n kubeflow-user-example-com mlops-pipeline-b5shc-system-container-impl-2173680805
kubectl get pods -A
kubectl delete pods -n kubeflow-user-example-com mlops-pipeline-b5shc-system-dag-driver-2842149944 mlops-pipeline-b5shc-system-container-impl-2173680805 mlops-pipeline-b5shc-system-container-driver-780697571 mlops-pipeline-7hhkn-system-dag-driver-2607205347 mlops-pipeline-7hhkn-system-container-impl-2860547016 mlops-pipeline-7hhkn-system-container-driver-1651824654 mlops-pipeline-5jkxm-system-dag-driver-772677648 mlops-pipeline-5jkxm-system-container-impl-1353793821 mlops-pipeline-5jkxm-system-container-driver-1624096747 
kubectl get pods -A -w
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
kubectl get svc -n kubeflow
kubectl describe svc minio-service -n kubeflow
apt-get update && apt-get install -y dnsutils
nslookup minio-service.kubeflow
apt-get install -y dnsutils
sudo apt-get install -y dnsutils
nslookup minio-service.kubeflow
kubectl get pods -A
kubectl logs -n kubeflow-user-example-com minio-integration-pipeline-l47qc-system-dag-driver-3611591590            
kubectl logs -n kubeflow-user-example-com minio-integration-pipeline-l47qc-system-container-driver-3815058814
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-28nr8-system-container-impl-3559925797
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline-28nr8-system-container-driver-931471203
kubectl delete pod -n kubeflow-user-example-com minio-integration-pipeline*
kubectl delete pods -n kubeflow-user-example-com minio-integration-pipeline*
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
free -h
df -hT
htop
top
htop
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-bxgps-system-container-impl-1732280418
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-v6dms-system-container-impl-1762033508
kubectl delete pods -n kubeflow-user-example-com mnist-pipeline-phzqj-system-dag-driver-359231536 mnist-pipeline-phzqj-system-container-driver-328517975 mnist-pipeline-76886-system-dag-driver-2464996364 mnist-pipeline-76886-system-container-driver-3008048507 mnist-pipeline-2khqs-system-dag-driver-2730114140 mnist-pipeline-2khqs-system-container-driver-893095275
df -hT
sudo docker images
docker system prune -f
df -hT
ls
cd https/
ls
cd ..
du -h / --max-depth=1 | sort -h
sudo apt clean
sudo apt autoremove
du -ah /home | sort -h | tail -n 20
rm -rf ~/.cache/pip
df -hT
rm -rf ~/.vscode-server
df -hT
rm -rf ~/yamllint-venv
df -hT
rm -rf ~/.cache/*
df -hT
du -ah /home | sort -h | tail -n 20
cd .keras
ls
cd ..
kubectl get pods -A
kubectl -n kubeflow get pods
kubectl -n kubeflow get poddefaults
cd ..
cd ~/pipeline-config/
ls
kubectl apply -f poddefault.yaml 
curl -k https://kubeflow.local:30967/jupyter/api/namespaces/kubeflow-user-example-com/poddefaults
kubectl get pods -A
kubectl logs -n kubeflow jupyter-web-app-deployment-7dbcd448fb-bx85d
kubectl -n kubeflow-user-example-com get poddefaults -o yaml
kubectl get pods -A
kubectl describe pod -n kubeflow mnist2801-0
kubectl get pods -A
kubectl -n kubeflow-user-example-com get pods --show-labels
mv poddefault.yaml poddefault_backup.yaml 
code poddefault.yaml
touch poddefault.yaml
code poddefault.yaml
kubectl apply -f poddefault.yaml
kubectl get pods -A
free -h
kubectl get pods -A -w
kubectl get pods -A 
kubectl describe nodes
kubectl describe nodes | grep Requests
kubectl describe nodes | grep Usage
kubectl get pods -A 
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-hdfcb-system-container-impl-895038919 
df -h
kubectl get pods -A 
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-hdfcb-system-container-driver-757897481 mnist-pipeline-hdfcb-system-dag-driver-2528868930
kubectl get events -A
kubectl get pods -A
nproc
sudo journalctl -u k3s | tail -n 50
kubectl get pods -A -w
kubectl get pods -A 
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-s4x8r-system-container-impl-2018888219
kubectl get pods -A 
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-s4x8r-system-container-driver-4076811469 mnist-pipeline-s4x8r-system-container-impl-2018888219  mnist-pipeline-s4x8r-system-dag-driver-1630112478
kubectl get pods -A 
kubectl get pods -A -w
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-bxgps-system-container-driver-3919331724 mnist-pipeline-bxgps-system-container-impl-1732280418 mnist-pipeline-bxgps-system-dag-driver-2227064795
kubectl get pods -A -w
kubectl describe node
kubectl get pods -A -o wide
kubectl describe pod mnist-pipeline-v6dms-system-container-impl-1762033508 -n kubeflow-user-example-com
kubectl describe node
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-v6dms-system-dag-driver-4006473105 mnist-pipeline-v6dms-system-container-driver-3431093130
kubectl get pods -A
kubectl get pods -A -w
kubectl get pods -A 
free -h
df -hT
kubectl get pods -A 
kubectl get pods -A -w
kubectl logs -n kubeflow $(kubectl get pod -n kubeflow -l app=ml-pipeline -o jsonpath="{.items[0].metadata.name}") -c ml-pipeline-api-server
kubectl get pods -n kubeflow
kubectl get pods -n kubeflow-user-example-com
kubectl logs -n kubeflow-user-example-com mnist-pipeline-phzqj-system-container-driver-328517975
kubectl logs -n kubeflow-user-example-com mnist-pipeline-phzqj-system-dag-driver-359231536
kubectl logs -n kubeflow-user-example-com mnist-pipeline-phzqj-system-container-driver-328517975
kubectl get pods -n kubeflow | grep minio
kubectl get configmap -n kubeflow-user-example-com
kubectl logs -n kubeflow $(kubectl get pods -n kubeflow -l app=ml-pipeline -o jsonpath="{.items[0].metadata.name}")
kubectl get pods -A -w
free -h
df -hT
kubectl describe node
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-nkpml-system-container-driver-3655384298 mnist-pipeline-nkpml-system-dag-driver-775652337
kubectl delete pod -n kubeflow-user-example-com mlops-pipeline-5bxhs-system-container-driver-1412600448 mlops-pipeline-5bxhs-system-container-driver-219446934 mlops-pipeline-5bxhs-system-dag-driver-434823643
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
kubectl get pods --all-namespaces
kubectl get configmaps --all-namespaces
kubectl get crd
etcdctl endpoint health
etcdctl --write-out=table endpoint status
ps aux | grep k3s
journalctl -u k3s.service -f
systemctl status k3s
top -p $(pgrep -d',' k3s)
kubectl top pods -n kube-system
kubectl get pods -n kube-system
cd /bom
cd /bin/
ls
cd ~
kubectl get pods -A -w
kubectl get pods -A 
cat /etc/systemd/system/k3s.service > k3s_service_config_backup.txt
ls
cat k3s_service_config_backup.txt 
free -h
nproc
df -hT
htop
kubectl describe limitrange -n kubeflow-user-example-com
kubectl describe resourcequota -n kubeflow-user-example-com
kubectl get pods -A 
kubectl get pvc -A
kubectl describe node
kubectl get pods -A 
kubectl get pods -A
kubectl get pods -A -w
kubectl get pods
kubectl get namespaces
kubectl -n kubeflow get pods
kubectl -n kubeflow rollout restart 
kubectl -n kubeflow rollout restart deployment.apps profiles-deployment
kubectl -n kubeflow get pods
kubectl -n kubeflow logs profiles-deployment-64c6fbdcf4-pbkfb
kubectl -n kube-system get svc
kubectl -n kubeflow get pods
kubectl -n kubeflow logs profiles-deployment-64c6fbdcf4-pbkfb
sudo systemctl restart k3s.service 
kubectl -n kubeflow get pods
systemctl status k3s.service 
kubectl -n kubeflow get pods
sudo cat /etc/rancher/k3s/k3s.yaml 
sudo cat /etc/rancher/k3s/k3s.yaml > ~/.kube/config
kubectl -n kubeflow get pods
kubectl get nodes
ls -al
kubectl 
kubectl get pods
exit
kubectl get pos
kubectl config use-context
echo $KUBECONFIG
export KUBECONFIG=$HOME/.kube/config 
kubectl -n kubeflow get pods
kubectl logs profiles-deployment-64c6fbdcf4-pbkfb
kubectl -n kubeflow logs profiles-deployment-64c6fbdcf4-pbkfb
kubectl -n kubeflow get deployment.apps
kubectl -n kubeflow rollout restart profiles-deployment
kubectl -n kubeflow rollout restart deployment.apps  profiles-deployment
kubectl -n kubeflow get pods
kubectl -n kubeflow logs profiles-deployment-56cbb58fb-mdrb2
kubectl -n kubeflow logs profiles-deployment-f69c5475f-vg6fl
kubectl -n kubeflow get pods
kubectl -n kubeflow delete pod profiles-deployment-56cbb58fb-mdrb2
kubectl -n kubeflow get pods
kubectl -n kubeflow delete pod f69c5475f-vg6fl
kubectl -n kubeflow delete pod profiles-deployment-f69c5475f-vg6fl
kubectl -n kubeflow get pods
kubectl -n istio get pods
kubectl get ns
kubectl -n istio-system get pods
kubectl -n istio-system delete pod istiod-844ccb9bc9-d6pjp
kubectl -n kubeflow get pods
kubectl -n istio-system get pod
kubectl -n istio-system stop pod istiod-844ccb9bc9-vftw9
kubectl -n kubeflow get pods
exit
kubectl logs -n kubeflow-user-example-com mnist-pipeline-kgqqj-system-container-impl-782644462
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-kgqqj-system-container-impl-782644462
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
kubectl port-forward -n oauth2-proxy svc/oauth2-proxy 8081:80
kubectl get svc istio-ingressgateway -n istio-system
kubectl exec -n auth deployment/dex -- curl http://127.0.0.1:5556/dex/keys
curl http://dex.auth.svc.cluster.local:5556/dex/keys
kubectl get svc -n auth dex
curl http://10.43.55.61:5556/dex/keys
kubectl get svc -n oauth2-proxy
kubectl get pods -A
kubectl logs -n kubeflow oauth2-proxy-75cc8f8677-j6vfv
kubectl logs -n oauth2-proxy oauth2-proxy-75cc8f8677-j6vfv
kubectl logs -n oauth2-proxy oauth2-proxy-75cc8f8677-kv8g4
kubectl get configmap -n oauth2-proxy oauth2-proxy -o yaml
kubectl get deployment -n oauth2-proxy oauth2-proxy -o yaml
kubectl get configmap -n oauth2-proxy oauth2-proxy-hk55gm96k4 -o yaml
kubectl get configmap -n oauth2-proxy oauth2-proxy-parameters-74659b6648 -o yaml
kubectl get secret -n oauth2-proxy oauth2-proxy-h675gf55ht -o yaml
curl http://dex.auth.svc.cluster.local:5556/dex/keys
curl http://10.43.55.61:5556/dex/keys
kubectl get pods -A
cd ~/manifests/apps/tensorboard/tensorboards-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A -w
kubectl get pods -A 
cd ~/manifests/apps/tensorboard/tensorboard-controller/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A -w
cd ~/manifests/apps/katib/upstream/installs/katib-with-kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A -w
kubectl get pods -A 
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/cluster-scoped-resources
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/platform-agnostic-multi-user
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A -w
kubectl get pods -A 
htop
free -h
df -hT
kubectl get pods -A -w
kubectl edit deployment ml-pipeline-ui -n kubeflow
kubectl rollout restart deployment ml-pipeline-ui -n kubeflow
kubectl get pods -A -w
kubectl get pods -n kubeflow
kubectl describe pod -n kubeflow ml-pipeline-bf9f88745-k7q2m 
kubectl logs -n kubeflow ml-pipeline-bf9f88745-k7q2m
kubectl exec -n kubeflow ml-pipeline-bf9f88745-k7q2m -- ulimit -n
kubectl rollout restart deployment -n kubeflow ml-pipeline
kubectl get pods -A -w
kubectl get pods -A 
cd ~/manifests/common/knative/knative-serving/overlays/gateways
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A 
kubectl get pods -A -w
kubectl get pods -A 
cd ~/manifests/common/istio-1-23/cluster-local-gateway/base
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A 
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-crds.yaml
kubectl get pods -A 
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-core.yaml
kubectl get pods -A 
cd ~/manifests/contrib/kserve/kserve
kubectl kustomize . | kubectl apply --server-side --force-conflicts -f -
kubectl get pods -A 
kubectl get pods -A -w
kubectl get pods -A 
cd ~/manifests/contrib/kserve/models-web-app/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A 
kubectl get pods -A -w
kubectl get pods -A 
cd ~/manifests/apps/training-operator/upstream/overlays/kubeflow 
kubectl kustomize . | kubectl apply -f -
kubect get svc -A
kubectl get svc -A
kubectl get svc istio-ingressgateway -n istio-system -o yaml
sudo apt install netstat
kubectl get pods -n istio-system
kubectl logs -n istio-system istio-ingressgateway-57c8b6474d-kblbz
kubectl get secret -n istio-system
kubectl get RequestAuthentication -n kubeflow -o yaml
kubectl get AuthorizationPolicy -n kubeflow -o yaml
kubectl get svc -A | grep 8443
kubectl get svc istio-ingressgateway -n istio-system -o yaml
kubectl get authorizationpolicy -n kubeflow -o yaml
kubectl get virtualservice -n kubeflow -o yaml
kubectl get gateway -A -o yaml
kubectl get svc centraldashboard -n kubeflow -o yaml
kubectl get virtualservice -n kubeflow centraldashboard -o yaml
kubectl get gateway -n kubeflow kubeflow-gateway -o yaml
kubectl get secret kubeflow-tls -n kubeflow
kubectl get secret kubeflow-tls -n istio-system
kubectl get clusterissuer selfsigned-cluster-issuer
kubectl get certificate kubeflow-tls -n istio-system
kubectl describe certificate kubeflow-tls -n istio-system
kubectl get gateway kubeflow-gateway -n kubeflow -o yaml
kubectl logs -n istio-system -l app=istio-ingressgateway
kubectl logs -n cert-manager -l app=cert-manager
kubectl get destinationrules -A
kubectl get virtualservice -A
kubectl get svc istio-ingressgateway -n istio-system -o yaml
cd ~/https/
ls
cat cluster-issuer.yaml 
cat kubeflow-certificate.yaml 
kubectl get svc istio-ingressgateway -n istio-system
kubectl apply -f cluster-issuer.yaml
kubectl apply -f kubeflow-certificate.yaml
kubectl get certificate -n istio-system
kubectl get secret kubeflow-tls -n istio-system
kubectl edit gateway kubeflow-gateway -n kubeflow
kubectl get pods -A
kubectl describe pod -n kubeflow training-operator-7f8bfd56f-cc5x5
kubectl delete pod -n kubeflow training-operator-7f8bfd56f-cc5x5
kubectl get pods -A
kubectl get crds | grep -E 'tfjob|pytorchjob|mpijob|xgboostjob'
kubectl get pods -A
kubectl logs -n kubeflow training-operator-7f8bfd56f-nxqlp
kubectl describe pod  -n kubeflow training-operator-7f8bfd56f-nxqlp
kubectl get secret -n kubeflow training-operator-webhook-cert
kubectl get pods -A
kubectl delete pod -n kubeflow training-operator-7f8bfd56f-nxqlp
kubectl get pods -A
kubectl get pods -A -w
kubectl describe pod -n kubeflow training-operator-7f8bfd56f-7dk2k
kubectl logs -n kubeflow training-operator-7f8bfd56f-7dk2k
cd ~/manifests/apps/training-operator/upstream/overlays/kubeflow 
kubectl kustomize . | kubectl delete -f -
kubectl get pods -A -w
kubectl get pods -A 
kubectl get pods -A -w
kubectl get pod -n kubeflow | grep metadata
kubectl get pods -A 
kubectl describe pod mnist-pipeline-sxclp-system-dag-driver-232522885 -n kubeflow
kubectl logs mnist-pipeline-sxclp-system-dag-driver-232522885 -n kubeflow -c init-container-name
kubectl get pods -A 
kubectl describe pod mnist-pipeline-sxclp-system-dag-driver-232522885 -n kubeflow
kubectl describe node
kubectl get events -A     --field-selector involvedObject.kind=Node,involvedObject.name=pear
kubectl get events -A
kubectl get pods -A 
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-sxclp-system-dag-driver-232522885
cd ~
ls
cd pipeline-config/
ls
cat minio-rbac.yaml 
cat minio-secret.yaml 
cat minio-service-account.yaml 
ls
cat poddefault.yaml 
touch ml-pipeline-minio-artifact
code ml-pipeline-minio-artifact 
mv ml-pipeline-minio-artifact ml-pipeline-minio-artifact.yaml
code ml-pipeline-minio-artifact.yaml 
mv ml-pipeline-minio-artifact.yaml minio-secret-mlpipeline.yaml
code minio-secret-mlpipeline.yaml 
kubectl apply -f minio-secret-mlpipeline.yaml
kubectl apply -f poddefault.yaml 
kubectl get pods -A
kubectl get pods -A -w
kubectl apply -f minio-secret-mlpipeline.yaml
kubectl get pods -A
kubectl logs -n kubeflow-user-example-com mnist-pipeline-sxclp-system-container-impl-2497969536 
kubectl delete pod -n kubeflow user-example-com mnist-pipeline-jqm2l-system-dag-driver-924396315 mnist-pipeline-sxclp-system-container-driver-1248729110 mnist-pipeline-sxclp-system-container-impl-2497969536 mnist-pipeline-sxclp-system-dag-driver-232522885
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-jqm2l-system-dag-driver-924396315 mnist-pipeline-sxclp-system-container-driver-1248729110 mnist-pipeline-sxclp-system-container-impl-2497969536 mnist-pipeline-sxclp-system-dag-driver-232522885
kubectl get pods -A
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-sxclp-system-container-impl-2497969536
kubectl get workflows -n kubeflow-user-example-com
kubectl get pipelineruns -n kubeflow-user-example-com
kubectl delete workflow mnist-pipeline-jqm2l -n kubeflow-user-example-com 
kubectl delete workflow mnist-pipeline-sxclp -n kubeflow-user-example-com 
kubectl get pipelineruns -n kubeflow-user-example-com
kubectl get workflows -n kubeflow-user-example-com
kubectl get pods -A
kubectl get pods -A -w
kubectl get workflows -n kubeflow-user-example-com
kubectl delete workflow mnist-pipeline-kgqqj -n kubeflow-user-example-com 
kubectl get workflows -n kubeflow-user-example-com
kubectl get pods -A
df -hT
free -h
kubectl get pods -A
kubectl logs -n kubeflow-user-example-com mnist-notebook-0
kubectl logs -n kubeflow-user-example-com mnist-notebook-0 -f
kubectl logs -n kubeflow-user-example-com mnist-notebook-0 
kubectl describe pod -n kubeflow-user-example-com mnist-notebook-0 
kubectl logs -n kubeflow-user-example-com mnist-notebook-0 
kubectl get pods -A - w
kubectl get pods -A -w
free -h
kubectl get pods -A
kubectl port-forward svc/istio-ingressgateway -n istio-system 8443:443
kubectl port-forward -n istio-system svc/istio-ingressgateway 8443:443
kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80
htop
kubectl get pods -A -w 
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-jqm2l-system-dag-driver-924396315
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-sxclp-system-dag-driver-232522885
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-t2spg-system-container-impl-2073226258
kubectl logs -n kubeflow-user-example-com mnist-pipeline-t2spg-system-container-impl-2073226258
kubectl get svc -n kubeflow
kubectl exec -n kubeflow-user-example-com -it ml-pipeline-669ddbd5f-d2wmg -- curl ml-pipeline.kubeflow:8887
kubectl exec -n kubeflow -it ml-pipeline-669ddbd5f-d2wmg -- curl ml-pipeline.kubeflow:8887
kubectl exec -n kubeflow -it ml-pipeline-669ddbd5f-d2wmg -- wget -qO- ml-pipeline.kubeflow:8887
kubectl exec -n kubeflow -it ml-pipeline-669ddbd5f-d2wmg -- sh -c "nc -zv ml-pipeline.kubeflow 8887"
curl ml-pipeline.kubeflow:8887
curl 10.43.113.236:8887
kubectl get pods -A
kubectl get svc -n kubeflow
kubectl describe svc ml-pipeline -n kubeflow
kubectl get pods -n kube-system -o wide | grep coredns
kubectl logs -n kubeflow ml-pipeline-669ddbd5f-d2wmg
kubectl logs -n kubeflow-user-example-com mnist-pipeline-t2spg-system-container-impl-2073226258
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-t2spg-system-container-impl-2073226258
kubectl logs -n kubeflow profiles-deployment-f69c5475f-rtcmq
curl -k https://10.43.0.1:443/healthz
kubectl get pod -n kube-system | grep api
kubectl get pods -n kube-system | grep coredns
kubectl auth can-i list rolebindings --as=system:serviceaccount:kubeflow:default
nproc
free -h
kubectl logs -n kubeflow profiles-deployment-f69c5475f-rtcmq
kubectl describe pod -n kubeflow profiles-deployment-f69c5475f-rtcmq
kubectl logs -n kubeflow profiles-deployment-f69c5475f-rtcmq
kubectl delete pod -n kubeflow profiles-deployment-f69c5475f-rtcmq
kubectl logs -n kubeflow profiles-deployment-f69c5475f-vg6fl
kubectl logs -n kubeflow profiles-deployment-5f46f7c9bb-8mql4
kubectl logs profiles-deployment-f69c5475f-vg6fl -n kubeflow -c manager
htop
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
htop
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-6r68j-system-dag-driver-3850112477 mnist-pipeline-6r68j-system-container-driver-2776766094
kubectl describe pod -n kubeflow profiles-deployment-5f46f7c9bb-8mql4
kubectl logs profiles-deployment-5f46f7c9bb-8mql4 -n kubeflow -c manager
kubectl get pod profiles-deployment-5f46f7c9bb-8mql4 -n kubeflow -o wide
kubectl edit deployment profiles-deployment -n kubeflow
kubectl rollout restart deployment profiles-deployment -n kubeflow
kubectl get pods -A -w
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
ls
kubectl get pods -A -w
kubectl get pods -A
kubectl get deployments -n kubeflow
kubectl get rs -n kubeflow | grep profiles-deployment
kubectl get deployment profiles-deployment -n kubeflow -o yaml
kubectl delete rs profiles-deployment-5f46f7c9bb -n kubeflow
kubectl delete rs profiles-deployment-64c6fbdcf4 -n kubeflow
kubectl delete rs profiles-deployment-f69c5475f -n kubeflow
kubectl get pods -A
kubectl logs profiles-deployment-56cbb58fb-gd6sd -n kubeflow
kubectl describe pod profiles-deployment-56cbb58fb-gd6sd -n kubeflow
kubectl get deployments -n kubeflow
kubectl get deployment profiles-deployment -n kubeflow -o yaml
cd ~/manifests/apps/profiles/upstream/overlays/kubeflow
kubectl get deployments -n kubeflow
kubectl logs -n kubeflow deployment/profiles-deployment
kubectl delete deployment profiles-deployment -n kubeflow
kubectl get rs -n kubeflow | grep profiles-deployment | awk '{print $1}' | xargs -I {} kubectl delete rs {} -n kubeflow
kubectl get pods -n kubeflow | grep profiles-deployment
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl logs -n kubeflow profiles-deployment-5f46f7c9bb-855nm
kubectl describe pod -n kubeflow profiles-deployment-5f46f7c9bb-855nm
curl -k https://10.43.0.1:443/healthz
kubectl get pods -n kube-system | grep apiserver
kubectl auth can-i list rolebindings --as=system:serviceaccount:kubeflow:default
curl -k https://10.43.0.1:443/healthz
kubectl auth can-i list rolebindings --as=system:serviceaccount:kubeflow:default
kubectl run testpod --image=busybox -n kubeflow -- sleep 3600
kubectl exec -it testpod -n kubeflow -- nslookup kubernetes.default.svc.cluster.local
kubectl get pods -A
kubectl exec -it testpod -n kubeflow -- nslookup kubernetes.default.svc.cluster.local
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: kubeflow-profiles-access
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: default
  namespace: kubeflow
EOF

kubectl auth can-i list rolebindings --as=system:serviceaccount:kubeflow:default
kubectl get pods -A
curl -k https://10.43.0.1:443/healthz
nslookup kubernetes.default.svc.cluster.loca
kubectl exec -it testpod -n kubeflow -- curl -k https://10.43.0.1:443/healthz
kubectl exec -it profiles-deployment-5f46f7c9bb-855nm -n kubeflow -- /bin/sh
kubectl get pods -A
kubectl rollout restart deployment profiles-deployment -n kubeflow
kubectl get pods -A
profiles-deployment-f8b8548cc-4hjw5
kuebctl logs -n kubeflow profiles-deployment-f8b8548cc-4hjw5
kubectl logs -n kubeflow profiles-deployment-f8b8548cc-4hjw5
df -hT
kubectl get pods -A
sudo /usr/local/bin/k3s-uninstall.sh
df -hT
sudo rm -rf /etc/rancher/k3s
sudo rm -rf /var/lib/rancher/k3s
sudo rm -rf /var/lib/kubelet
rm -rf ~/.kube
ls
cd ~
ls
rm -rf test-pod.yaml k3s_service_config_backup.txt 
ls
df -hT
free -h
htop
curl -sfL https://get.k3s.io | sh -
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
kubectl get nodes
kubectl get pods -A
cd ~/manifests/common/cert-manager/base 
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/cert-manager/kubeflow-issuer/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/istio-1-23/istio-crds/base 
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/istio-1-23/istio-namespace/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/istio-1-23/istio-install/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/oauth2-proxy/overlays/m2m-dex-and-kind
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/dex/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl logs -n auth dex-76d4d57d47-2v7j9
kubectl get pods -A
cd ~/manifests/common/kubeflow-namespace/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/networkpolicies/base 
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/kubeflow-roles/base
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/istio-1-23/kubeflow-istio-resources/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/centraldashboard/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/profiles/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl logs -n profiles-deployment-5f46f7c9bb-2dghr
kubectl logs -n kubeflow  profiles-deployment-5f46f7c9bb-2dghr
kubectl get pods -A
kubectl describe pod -n kubeflow profiles-deployment-5f46f7c9bb-2dghr
kubectl get pods -A
cd ~/manifests/common/user-namespace/base
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl patch svc istio-ingressgateway -n istio-system   -p '{"spec": {"type": "NodePort"}}'
kubectl get svc -A
kubectl get svc istio-ingressgateway -n istio-system -o yaml
kubectl get pods -n kubeflow
kubectl get pods -n istio-system
kubectl get svc -n istio-system
curl -k http://localhost:8080
netstat -tulnp | grep 8080
kubectl logs -n istio-system deployment/oauth2-proxy
kubectl get pods -A
kubectl logs -n kubeflow deployment/dex
kubectl get virtualservice -n kubeflow
kubectl logs -n oauth2-proxy -l app=oauth2-proxy
kubectl get all -n oauth2-proxy
kubctl logs -n oauth2-proxy oauth2-proxy-75cc8f8677-j6vfv
kubctl logs -n oauth2-proxy oauth2-proxy oauth2-proxy-75cc8f8677-j6vfv
kubectl logs -n oauth2-proxy oauth2-proxy oauth2-proxy-75cc8f8677-j6vfv
kubectl logs -n oauth2-proxy oauth2-proxy-75cc8f8677-kv8g4
kubectl get virtualservice -A
kubectl get svc istio-ingressgateway -n istio-system
kubectl get configmap dex -n auth -o yaml
kubectl get configmap oauth2-proxy -n oauth2-proxy -o yaml
kubectl get pods -A
cd ~/manifests/apps/jupyter/notebook-controller/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl get pods -A -w
kubectl get pods -A 
cd ~/manifests/apps/jupyter/jupyter-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A -w
cd ~/manifests/apps/pvcviewer-controller/upstream/base
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A -w
cd ~/manifests/apps/volumes-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A -w
cd ~/manifests/apps/admission-webhook/upstream/overlays/cert-manager
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A -w
kubectl get pods -A 
cd ~/https/
ls
cat cluster-issuer.yaml 
kubectl apply -f cluster-issuer.yaml
sudo mkdir -p /etc/ssl/certs/kubeflow
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048   -keyout /etc/ssl/certs/kubeflow/kubeflow.key   -out /etc/ssl/certs/kubeflow/kubeflow.crt   -subj "/CN=kubeflow.local"
sudo kubectl create secret tls kubeflow-tls   --cert=/etc/ssl/certs/kubeflow/kubeflow.crt   --key=/etc/ssl/certs/kubeflow/kubeflow.key   -n istio-system
kubectl get pods -A 
kubectl edit gateway kubeflow-gateway -n kubeflow
cat kubeflow-certificate.yaml 
kubectl apply -f kubeflow-certificate.yaml
kubectl get pods -A
kubectl logs -n kubeflow mnist-pipeline-t2spg-system-container-impl-2073226258
kubectl logs -n kubeflow-user-example-com mnist-pipeline-t2spg-system-container-impl-2073226258
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-t2spg-system-container-impl-2073226258
kubectl exec -n kubeflow-user-example-com -it mnist-pipeline-t2spg-system-container-impl-2073226258 -- /bin/bash
ping ml-pipeline.kubeflow
kubectl get services -n kubeflow
kubectl get pods -n kubeflow -l app=ml-pipeline
kubectl logs ml-pipeline-669ddbd5f-d2wmg -n kubeflow
kubectl exec -n kubeflow-user-example-com -it mnist-pipeline-t2spg-system-container-impl-2073226258 -- /bin/bash
kubectl edit deployment ml-pipeline-ui -n kubeflow
kubectl get pods -A
kubectl describe pod -n kubeflow ml-pipeline-669ddbd5f-d2wmg
kubectl get pods -A
kubectl get pods -n kubeflow | grep metadata-grpc
kubectl get svc -n kubeflow | grep metadata-grpc
kubectl logs -n kubeflow metadata-grpc-deployment-8496ffb98b-mnbqq
kubectl edit deployment ml-pipeline-ui -n kubeflow
kubectl get pods -n kubeflow | grep ml-pipeline-ui
kubectl describe pod -n kubeflow ml-pipeline-ui-84688697c7-whm67 
kubectl logs -n kubeflow metadata-grpc-deployment-8496ffb98b-mnbqq
kubectl get pods -n kubeflow
kubectl get pods -n kubeflow-user-example-com
ls
kubectl get pods -A
free -h
kubectl get pods -A
kubectl get svc -A
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
htop
kubectl get pods -A
kubectl logs -n kubeflow-user-example-com mnist-pipeline-xssc7-system-container-impl-2554271724'
kubectl logs -n kubeflow-user-example-com mnist-pipeline-xssc7-system-container-impl-2554271724
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-xssc7-system-container-impl-2554271724
free -h
kubectl logs -n kubeflow-user-example-com mnist-pipeline-xssc7-system-container-impl-2554271724
kubectl get pods -A
kubectl logs -n kubeflow ml-pipeline-669ddbd5f-d2wmg
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-xssc7-system-container-driver-2168780578 mnist-pipeline-xssc7-system-container-driver-2168780578 mnist-pipeline-xssc7-system-dag-driver-582793545 
reboot
kubectl get svc -n kubeflow
nslookup 10.43.113.236
kubectl edit svc ml-pipeline -n kubeflow
kubectl patch svc ml-pipeline -n kubeflow -p '{"spec": {"type": "LoadBalancer"}}'
kubectl edit svc ml-pipeline -n kubeflow
kubectl get svc ml-pipeline -n kubeflow
curl http://192.168.55.103:31369
curl http://192.168.55.103:32477
kubectl get pods -n kubeflow -l app=ml-pipeline
kubectl logs -n kubeflow ml-pipeline-669ddbd5f-d2wmg
sudo ufw status
sudo apt install ufw
sudo ufw status
sudo iptables -L -n
curl http://10.43.113.236:8888
kubectl get svc -n kubeflow
cd pipeline-config/
kubectl apply -f minio-rbac.yaml 
kubectl kubectl get pods -n kubeflow-user-example-com
kubectl get pods -n kubeflow-user-example-com
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-xssc7-system-container-impl-2554271724 
kubectl get pod mnist-notebook-0 -n kubeflow-user-example-com -o yaml
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com mnist-6c7d46c96b-bnhhw
kubectl get pods -A
kubectl get pods --all-namespaces | grep mnist-6c7d46c96b-8xdfg
kubectl describe pod mnist-6c7d46c96b-8xdfg -n kubeflow-user-example-com
kubectl get pods -A
kubectl logs -n kubeflow metadata-grpc-deployment-8496ffb98b-mnbqq
kubectl logs -n kubeflow admission-webhook-deployment-5644dcc957-w5dbz
systemctl list-units | grep apiserver
crontab -l
kubectl get pods -A
kubectl get secret ml-pipeline-minio-artifact -n kubeflow -o yaml
kubectl get secret -n kubeflow
kubectl get secret mlpipeline-minio-artifact -n kubeflow -o jsonpath="{.data.secretkey}" | base64 --decode
kubectl get secret mlpipeline-minio-artifact -n kubeflow -o jsonpath="{.data.accesskey}" | base64 --decode
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
kubectl logs istio-ingressgateway-57c8b6474d-kblbz -n istio-system
kubectl get pods -A
kubectl logs hello-pipeline-p75br-system-container-impl-726361504 -c istio-proxy -n kubeflow-user-example-com
kubectl get pod hello-pipeline-p75br-system-container-impl-726361504 -n kubeflow-user-example-com -o jsonpath='{.spec.containers[*].name}'
kubectl get pod hello-pipeline-p75br-system-container-impl-726361504 -n kubeflow-user-example-com -o yaml | grep 'sidecar.istio.io/inject'
kubectl get pod hello-0 -n kubeflow-user-example-com -o jsonpath='{.spec.containers[*].name}'
kubectl logs hello-0 -c istio-proxy -n kubeflow-user-example-com
kubectl get namespace kubeflow-user-example-com -o yaml | grep istio-injection
kubectl get pod hello-0 -n kubeflow-user-example-com -o jsonpath='{.spec.containers[*].name}'
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/platform-agnostic-multi-user
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
htop
kubectl delete pod -n kubeflow-user-example-com hello-pipeline-p75br-system-container-driver-2079025718 hello-pipeline-p75br-system-container-impl-726361504 hello-pipeline-p75br-system-dag-driver-3538633914
kubectl get pods -A
kubectl get pods -A -w
cd ~/pipeline-config/
ls
kubectl get pods -A -w
kubectl logs -n kubeflow-user-example-com hello-pipeline-p75br-system-container-impl-726361504
kubectl get deployment -o yaml ml-pipeline-ui-84688697c7-whm67 -n kubeflow
kubectl get authorizationpolicy --all-namespaces
kubectl get virtualservice,destinationrule -n kubeflow
kubectl run tmp-shell --rm -it --image=curlimages/curl -n kubeflow-user-example-com -- sh
kubectl get networkpolicy -n kubeflow
kubectl get networkpolicy -n kubeflow-user-example-com
kubectl run tmp-shell --rm -it --image=curlimages/curl -n kubeflow-user-example-com -- sh
kubectl logs -n kubeflow ml-pipeline-669ddbd5f-d2wmg
kubectl logs -n kubeflow ml-pipeline-669ddbd5f-d2wmg -w
kubectl logs -n kubeflow ml-pipeline-669ddbd5f-d2wmg -f
kubectl logs -n kubeflow-user-example-com hello-pipeline-4tvkf-system-container-impl-637517507
htop
top
htop
# Check the process tree to see what's spawning these
pstree -p | grep apiserver
# Check the systemd service status if it's managed by systemd
systemctl status apiserver
pstree -p | grep apiserver
journalctl -u apiserver
journalctl -u k3s
systemctl status k3s
sudo systemctl stop k3s
ulimit -n
cat /proc/sys/fs/inotify/max_user_watches
sudo sysctl -w fs.inotify.max_user_watches=524288
lsof | wc -l
# To see processes with most open files
lsof | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
cat /proc/sys/fs/inotify/max_user_watches
sudo sysctl -p
sudo systemctl daemon-reload
systemctl status k3s
sar -u -f /var/log/sa/sa$(date +%d)
journalctl -u apiserver --since "2 days ago" | grep -i error
sudo journalctl -u apiserver --since "2 days ago" | grep -i error
sudo grep apiserver /var/log/syslog
ps aux | grep apiserver
ps -p $(pgrep apiserver) -o pid,ppid,rss,vsz,pcpu,cmd
sudo pstree -p | grep apiserver
sudo apt-get install psmisc
ls -la /config
sudo kill 456498 456512
kubectl get pods -A
sudo systemctl restart k3s
kubectl get pods -A
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
kubectl get pods -A
kubectl get pods -A -w
kubectl get pods -n kubeflow-user-example-com
kubectl get svc -n kubeflow
kubectl logs -n kubeflow ml-pipeline-669ddbd5f-d2wmg
kubectl logs -n kubeflow ml-pipeline-ui-84688697c7-whm67
kubectl logs -n kubeflow ml-pipeline-669ddbd5f-d2wmg
kubectl get pods -n kubeflow
kubectl get pods -n kubeflow-user-example-com
kubectl describe pod -n kubeflow ml-pipeline-669ddbd5f-d2wmg
kubectl get pods -A -w
kubectl logs -n kubeflow-user-example-com hello-pipeline-sl86d-system-container-impl-3991493755
kubectl get svc -n kubeflow
kubectl describe svc ml-pipeline -n kubeflow
kubectl logs -n kubeflow metadata-grpc-deployment-8496ffb98b-mnbqq
kubectl logs -n kubeflow metadata-writer-7d7dfc5b8d-9ghhz
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com hello-pipeline-4tvkf-system-container-driver-2253529509 hello-pipeline-4tvkf-system-container-impl-637517507 hello-pipeline-4tvkf-system-dag-driver-134593189 hello-pipeline-sl86d-system-container-driver-4180942893 hello-pipeline-sl86d-system-container-impl-3991493755 hello-pipeline-sl86d-system-dag-driver-155976925 
kubectl get pods -A -w
kubectl get inferenceservices -n kubeflow-user-example-com
kubectl describe inferenceservices mnist-model-service -n kubeflow-user-example-com
df -hT
kubectl get inferenceservices -n kubeflow-user-example-com
kubectl describe inferenceservices mnist-model-service -n kubeflow-user-example-com
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
htop
kubectl get pods -A
kubectl logs -n kubeflow-user-example-com mnist-pipeline-pg5qn-system-container-impl-1059955799
kubectl get pods -A
df -hT
free -h
kubectl get pods -A
kubectl get pods -A -w
kubectl get pods -A 
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-nqnp2-system-dag-driver-457278314  mnist-pipeline-nqnp2-system-container-impl-740845663 mnist-pipeline-nqnp2-system-container-impl-593655081 mnist-pipeline-nqnp2-system-container-impl-2352845108 mnist-pipeline-nqnp2-system-container-driver-3427729297 mnist-pipeline-b886c-system-container-driver-2414832289 mnist-pipeline-b886c-system-container-driver-2724663193 mnist-pipeline-b886c-system-container-driver-2904860063 mnist-pipeline-b886c-system-container-driver-3343508023 mnist-pipeline-b886c-system-container-driver-979935692 mnist-pipeline-b886c-system-container-driver-979935692 mnist-pipeline-b886c-system-container-impl-1106825359 mnist-pipeline-b886c-system-container-impl-318067895 mnist-pipeline-b886c-system-container-impl-3267753378 mnist-pipeline-b886c-system-container-impl-3497387761 mnist-pipeline-b886c-system-dag-driver-891964944 mnist-pipeline-fb24q-system-container-driver-1830913827 mnist-pipeline-fb24q-system-container-driver-2679590005 mnist-pipeline-fb24q-system-container-driver-2868803877 mnist-pipeline-fb24q-system-container-driver-3873204856 mnist-pipeline-fb24q-system-container-driver-4286871315 mnist-pipeline-fb24q-system-container-impl-23241283 mnist-pipeline-fb24q-system-container-impl-2363736549 mnist-pipeline-fb24q-system-container-impl-3370819891 mnist-pipeline-fb24q-system-container-impl-4080498421 mnist-pipeline-fb24q-system-container-impl-591036110  mnist-pipeline-nqnp2-system-container-driver-206048071 mnist-pipeline-nqnp2-system-container-driver-270630207 mnist-pipeline-nqnp2-system-container-driver-288105914 
kubectl get pods -A 
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-fb24q-system-dag-driver-584215476
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-nqnp2-system-container-impl-2118181777
kubectl get pods -A 
kubectl get pods -A -w
kubectl get pods -A 
kubectl get pods -A -w
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-pg5qn-system-container-driver-175843129 mnist-pipeline-pg5qn-system-container-driver-2238649525 mnist-pipeline-pg5qn-system-container-driver-2619707486 mnist-pipeline-pg5qn-system-container-driver-4098663779 mnist-pipeline-pg5qn-system-container-driver-4236799075 mnist-pipeline-pg5qn-system-container-impl-1059955799 mnist-pipeline-pg5qn-system-dag-driver-1518316006 mnist-pipeline-qbzcl-system-container-driver-1009305716 mnist-pipeline-qbzcl-system-container-driver-1977669145 mnist-pipeline-qbzcl-system-container-driver-2119202290 mnist-pipeline-qbzcl-system-container-driver-2824941694 mnist-pipeline-qbzcl-system-container-driver-3587073098 mnist-pipeline-qbzcl-system-container-impl-1309328676 mnist-pipeline-qbzcl-system-dag-driver-3543332601
kubectl get pods -A
kubectl get pods -A -w
kubectl get pods -A 
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-jv6qj-system-container-driver-1232500019 mnist-pipeline-jv6qj-system-container-driver-1773971096 mnist-pipeline-jv6qj-system-container-driver-2484374725 mnist-pipeline-jv6qj-system-container-driver-2696690499 mnist-pipeline-jv6qj-system-container-driver-3688839189 mnist-pipeline-jv6qj-system-dag-driver-2565981396  
kubectl get pods -A -w
kubectl get pods -A
kubectl get inferenceservices -A
kubectl describe inferenceservice mnist-model-service -n kubeflow-user-example-com
kubectl -n knative-serving get cm config-domain -oyaml
kubectl -n istio-system get gateway
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
htop
kubectl get -A kubeflow service | grep minio
kubectl get -A kubeflow service 
kubectl get -A  service 
kubectl
kubectl get inferenceservice -A
kubectl get pods -A -w
htop
kubectl logs -n kubeflow-user-example-com mnist-pipeline-4n6zz-system-container-impl-1382711472
kubectl describe inferenceservice mnist-model-service -n kubeflow-user-example-com
kubectl logs -n kubeflow kserve-controller-manager-5f8c474f97-8w6qb
kubectl describe inferenceservice mnist-model-service -n kubeflow-user-example-com
kubectl get inferenceservice -A

kubectl get -n kubeflow inferenceservice -A
kubectl get -n kubeflow inferenceservice 
kubectl get pods -A
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-wqqxb-system-container-impl-1904319177
kubectl logs -n kubeflow-user-example-com mnist-pipeline-wqqxb-system-container-impl-1904319177
kubectl describe inferenceservice mnist-model-service -n kubeflow-user-example-com
kubectl get deployment -n kserve
kubectl get pods -A
kubectl describe deployment kserve-controller-manager-5f8c474f97-8w6qb -n kubeflow
kubectl get deployment kserve-controller-manager-5f8c474f97-8w6qb -n kubeflow -o yaml | grep "image:"
kubectl get pods -A
kubectl describe deployment kserve-controller-manager-5f8c474f97-8w6qb -n kubeflow
kubectl get deployment -n kubeflow
kubectl describe deployment kserve-controller-manager -n kubeflow
kubectl get pods -A -w
kubectl exec -it minio--7c77bc59b8-4tnd8 -n kubeflow -c minio -- /bin/sh
kubectl exec -it minio-7c77bc59b8-4tnd8 -n kubeflow -n kubeflow -c minio -- /bin/sh
sudo apt autoremove
sudo apt clean
du -sh /var/cache/apt
sudo du -sh /var/log/*
du -sh ~/.*
sudo du -sh /var/lib/docker /var/lib/rancher/k3s
docker system prune -a
sudo k3s crictl ps
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com yolo-training-pipeline-9699g-system-container-driver-1011750581 yolo-training-pipeline-9699g-system-container-impl-858378355 yolo-training-pipeline-9699g-system-dag-driver-215358438 yolo-training-pipeline-bgbhh-system-container-driver-2468919640 yolo-training-pipeline-bgbhh-system-container-impl-2718997678 yolo-training-pipeline-bgbhh-system-dag-driver-2038616703 yolo-training-pipeline-l67bs-system-container-driver-4152748551 yolo-training-pipeline-l67bs-system-container-impl-816213737 yolo-training-pipeline-l67bs-system-dag-driver-4228651136 yolo-training-pipeline-p4cpr-system-container-driver-2520428500 yolo-training-pipeline-p4cpr-system-container-impl-1310655610 yolo-training-pipeline-p4cpr-system-dag-driver-394965763 yolo-training-pipeline-pjhvp-system-container-driver-2697787755 yolo-training-pipeline-pjhvp-system-container-impl-2764494493 yolo-training-pipeline-pjhvp-system-dag-driver-3682945116 yolo-training-pipeline-sr95p-system-container-driver-420072382 yolo-training-pipeline-sr95p-system-container-impl-1579151640 yolo-training-pipeline-sr95p-system-dag-driver-933015597 yolo-training-pipeline-zv686-system-container-driver-3346558627 yolo-training-pipeline-zv686-system-dag-driver-2179741492 yolo-training-pipeline-zw9kj-system-container-driver-3578768404 yolo-training-pipeline-zw9kj-system-container-impl-2896475066 yolo-training-pipeline-zw9kj-system-dag-driver-3917992515
df -h
sudo systemctl restart k3s
sudo systemctl status k3s
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
kubectl get pods -A
df -h
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
kubectl logs -n kubeflow-user-example-com mnist-pipeline-8m4b6-system-container-impl-203165433
kubectl logs -n kubeflow-user-example-com yolo-training-pipeline-sr95p-system-container-impl-1579151640 -f
kubectl logs -n kubeflow-user-example-com yolo-training-pipeline-9699g-system-container-impl-858378355 -f
kubectl get inferenceservice -A
kubectl describe inferenceservice mnist-model-service
kubectl describe inferenceservice mnist-model-service -n kubeflow-user-example-com
kubectl logs -n kubeflow-user-example-com mnist-pipeline-8m4b6-system-container-impl-203165433
kubectl get pods -A | grep mnist-pipeline-8m4b6-system-container-impl-203165433
kubectl exec -it mnist-pipeline-8m4b6-system-container-impl-203165433 -n kubeflow-user-example-com -- /bin/bash
kubectl get pods -A
kubectl delete pods --selector=job-name=mnist-pipeline
kubectl delete pods --selector=job-name=mnist-pipeline --field-selector=status.phase=Failed
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-4n6zz-system-container-driver-1181086536 mnist-pipeline-4n6zz-system-container-driver-3206470874 mnist-pipeline-4n6zz-system-container-driver-3628072237 mnist-pipeline-4n6zz-system-container-driver-591207654 mnist-pipeline-4n6zz-system-container-driver-912727414 mnist-pipeline-4n6zz-system-container-impl-1128051796 mnist-pipeline-4n6zz-system-container-impl-1382711472 mnist-pipeline-4n6zz-system-dag-driver-606321637 mnist-pipeline-grxft-system-container-driver-1483630688 mnist-pipeline-grxft-system-container-driver-2896567101 mnist-pipeline-grxft-system-container-driver-4070707803 mnist-pipeline-grxft-system-container-impl-4226462854 mnist-pipeline-grxft-system-dag-driver-852626668 mnist-pipeline-gwqsb-system-container-driver-2041988758 mnist-pipeline-gwqsb-system-container-driver-2860855121 mnist-pipeline-gwqsb-system-container-driver-2882206618 mnist-pipeline-gwqsb-system-container-driver-3120557740 mnist-pipeline-gwqsb-system-container-driver-4156527490 mnist-pipeline-gwqsb-system-container-impl-2613125964 mnist-pipeline-gwqsb-system-dag-driver-1796049921 mnist-pipeline-n8bvj-system-container-driver-1019935546 mnist-pipeline-n8bvj-system-container-driver-1939212358 mnist-pipeline-n8bvj-system-container-driver-3461901352 mnist-pipeline-n8bvj-system-container-driver-3495467789 mnist-pipeline-n8bvj-system-container-driver-4267400790 mnist-pipeline-n8bvj-system-container-impl-3553281296 mnist-pipeline-n8bvj-system-dag-driver-1744363461 mnist-pipeline-q2h4g-system-container-driver-2588822498 mnist-pipeline-q2h4g-system-container-driver-3007489036 mnist-pipeline-q2h4g-system-container-driver-3086958897 mnist-pipeline-q2h4g-system-container-driver-884546422 mnist-pipeline-q2h4g-system-container-driver-94567418 mnist-pipeline-q2h4g-system-container-impl-762242732 mnist-pipeline-q2h4g-system-dag-driver-3068648545 mnist-pipeline-wff8h-system-container-driver-1521777456 mnist-pipeline-wff8h-system-container-driver-1703877469 mnist-pipeline-wff8h-system-container-driver-2557194605 mnist-pipeline-wff8h-system-container-driver-4263995147 mnist-pipeline-wff8h-system-container-impl-1667646859 mnist-pipeline-wff8h-system-container-impl-873317686 mnist-pipeline-wff8h-system-dag-driver-2659722108 mnist-pipeline-wsr4j-system-container-driver-2092716200 mnist-pipeline-wsr4j-system-container-driver-2925601110 mnist-pipeline-wsr4j-system-container-driver-562272131 mnist-pipeline-wsr4j-system-container-impl-1426418112 mnist-pipeline-wsr4j-system-container-impl-40873541 mnist-pipeline-wsr4j-system-container-impl-4245119774 mnist-pipeline-wsr4j-system-dag-driver-2952633839 mnist-pipeline-z4tdl-system-container-driver-1271017232 mnist-pipeline-z4tdl-system-container-driver-1308626612 mnist-pipeline-z4tdl-system-container-driver-2322666331 mnist-pipeline-z4tdl-system-container-driver-2458416270 mnist-pipeline-z4tdl-system-container-driver-918407600 mnist-pipeline-z4tdl-system-container-impl-2152200118 mnist-pipeline-z4tdl-system-container-impl-2569932717 mnist-pipeline-z4tdl-system-container-impl-3718137946 mnist-pipeline-z4tdl-system-container-impl-4095781960 mnist-pipeline-z4tdl-system-dag-driver-3311410007
kubectl get pods -A
kubectl get pods -A -w
kube
ksubcee
kubectl exec -it mnist-pipeline-kdfb6-system-container-impl-1178783167 -n kubeflow-user-example-com -- /bin/sh
kubectl describe pod -n kubeflow-user-example-com mnist-pipeline-kdfb6-system-container-impl-1178783167
kubectl get pods -A
kubectl logs -n kubeflow-user-example-com mnist-pipeline-j9rsb-system-container-impl-456337028
kubectl get pods -A
kubectl logs -n kubeflow kserve-controller-manager-5f8c474f97-8w6qb
kubectl get pods -A
df -h
free -h
htop
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com mnist-pipeline-58npr-system-container-driver-1609962994 mnist-pipeline-58npr-system-container-driver-1650986583 mnist-pipeline-58npr-system-container-driver-2870959685 mnist-pipeline-58npr-system-container-driver-601280409 mnist-pipeline-58npr-system-container-driver-622091359 mnist-pipeline-58npr-system-container-impl-2051885155 mnist-pipeline-58npr-system-container-impl-4167988913 mnist-pipeline-58npr-system-dag-driver-3054822130 mnist-pipeline-8m4b6-system-container-driver-1624076159 mnist-pipeline-8m4b6-system-container-driver-1949138073 mnist-pipeline-8m4b6-system-container-driver-213327940 mnist-pipeline-8m4b6-system-container-driver-3053240055 mnist-pipeline-8m4b6-system-container-driver-416676625 mnist-pipeline-8m4b6-system-container-impl-203165433 mnist-pipeline-8m4b6-system-dag-driver-3229813848 mnist-pipeline-j9rsb-system-container-driver-1988867498 mnist-pipeline-j9rsb-system-container-driver-2276933086 mnist-pipeline-j9rsb-system-container-driver-2500127442 mnist-pipeline-j9rsb-system-container-driver-2781306617 mnist-pipeline-j9rsb-system-container-driver-4100155860 mnist-pipeline-j9rsb-system-container-impl-456337028 mnist-pipeline-j9rsb-system-dag-driver-1197972441 mnist-pipeline-kdfb6-system-container-driver-1136521713 mnist-pipeline-kdfb6-system-container-driver-1602730461 mnist-pipeline-kdfb6-system-container-driver-2968829883 mnist-pipeline-kdfb6-system-container-driver-3704130902 mnist-pipeline-kdfb6-system-container-driver-371996251 mnist-pipeline-kdfb6-system-dag-driver-2377119758
kubectl get pods -A
kubectl logs -n kubeflow workflow-controller-784cfd9c97-6fg5t
kubectl get pods -A
kubectl logs -n kubeflow kserve-controller-manager-5f8c474f97-8w6qb
kubectl get pods -A
kubectl logs -n kubeflow pvcviewer-controller-manager-55f545dfc4-rmwsg
workflow-controller-784cfd9c97-6fg5t
kubectl get services -A
kubectl get pods -A
kubectl get pods -A -w
df -h
sudo docker image prune -A
sudo docker image prune -a
sudo docker prune -A
sudo du -ah / | sort -rh | head -20
kubectl logs -n kubeflow-user-example-com yolo-model-pipeline-9g2xl-system-container-impl-1261666631
kubectl logs -n kubeflow-user-example-com yolo-model-pipeline-9g2xl-system-container-impl-1261666631 -f
kubectl logs -n kubeflow-user-example-com yolo-model-pipeline-7j7kc-system-container-impl-2150995601 -f
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
kubectl describe pod -n kubeflow-user-example-com yolo-training-pipeline-2kp6d-system-container-impl-4203431039
df -h
htop
kubectl get pods -A 
free -h
df -h
free -h
kubectl describe pod -n kubeflow-user-example-com yolo1-0
df -h
free -h
watch -n 1 free -h
df -h
free -h
htop
kubectl get pods -A -w
kubectl get pods -A 
kubectl delete pod -n kubeflow-user-example-com yolo-training-pipeline-2kp6d-system-container-impl-4203431039
sudo systemctl restart k3s
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
kubectl get pods -A
df -h
kubectl delete -n yolo-training-pipeline-2kp6d-system-dag-driver-3973149735 yolo-training-pipeline-2kp6d-system-container-driver-2949300657
kubectl get pods -A
sudo systemctl restart k3s
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
kubectl get pods -A
sudo /usr/local/bin/k3s-uninstall.sh
sudo rm -rf /var/lib/rancher
sudo rm -rf /etc/rancher
ls
ls -la
rm -rf .keras .kube
rm -rf .dotnet/
df -h
free -h
cd ~/manifests/common/cert-manager/base 
kubectl kustomize . | kubectl apply -f -
curl -sfL https://get.k3s.io | sh -
sudo systemctl status k3s
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/cert-manager/kubeflow-issuer/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/istio-1-23/istio-crds/base 
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/istio-1-23/istio-namespace/base
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/istio-1-23/istio-install/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/oauth2-proxy/overlays/m2m-dex-and-kind
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/dex/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/kubeflow-namespace/base
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/networkpolicies/base 
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/kubeflow-roles/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/istio-1-23/kubeflow-istio-resources/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/centraldashboard/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/apps/profiles/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/user-namespace/base
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
kubectl patch svc istio-ingressgateway -n istio-system   -p '{"spec": {"type": "NodePort"}}'
kubectl get svc istio-ingressgateway -n istio-system -o yaml
cd ~/manifests/apps/jupyter/notebook-controller/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/apps/jupyter/jupyter-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/apps/pvcviewer-controller/upstream/base
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/apps/volumes-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/apps/admission-webhook/upstream/overlays/cert-manager
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~
ls
cd https/
ls
cat cluster-issuer.yaml 
kubectl apply -f cluster-issuer.yaml
sudo mkdir -p /etc/ssl/certs/kubeflow
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048   -keyout /etc/ssl/certs/kubeflow/kubeflow.key   -out /etc/ssl/certs/kubeflow/kubeflow.crt   -subj "/CN=kubeflow.local"
sudo kubectl create secret tls kubeflow-tls   --cert=/etc/ssl/certs/kubeflow/kubeflow.crt   --key=/etc/ssl/certs/kubeflow/kubeflow.key   -n istio-system
kubectl edit gateway kubeflow-gateway -n kubeflow
ls
cat kubeflow-certificate.yaml 
kubectl apply -f cluster-issuer.yaml
kubectl apply -f kubeflow-certificate.yaml
kubectl get svc istio-ingressgateway -n istio-system
cd ~/manifests/apps/tensorboard/tensorboards-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/apps/tensorboard/tensorboard-controller/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/apps/katib/upstream/installs/katib-with-kubeflow
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/cluster-scoped-resources
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/platform-agnostic-multi-user
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
df -h
free -h
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl edit deployment ml-pipeline-ui -n kubeflow
kubectl get pods -A
cd ~/manifests/common/knative/knative-serving/overlays/gateways
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/istio-1-23/cluster-local-gateway/base
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-crds.yaml
kubectl get pods -A
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-core.yaml
kubectl get pods -A
cd ~/manifests/contrib/kserve/kserve
kubectl kustomize . | kubectl apply --server-side --force-conflicts -f -
kubectl get pods -A
cd ~/manifests/contrib/kserve/models-web-app/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
df -h
free -h
cd ~
ls
cd pipeline-config/
ls
kubectl apply -f poddefault.yaml 
kubectl apply -f minio-secret-mlpipeline.yaml 
kubectl apply -f minio-rbac.yaml 
kubectl get pods -A
kubectl get pods -A -w
kubectl get pods -A 
cd ..
mkdir yolo-deployment\
mkdir yolo-deployment
ls
cd yolo-deployment/
kubectl get pods -A 
kubectl get pods -A -w
df -g
df -hT
kubectl get pods -A -w
kubectl get pods -A 
htop
kubectl get pods
vim .bashrc 
echo $KUBECONFIG
vim .bashrc
source .bash
source .bashrc 
kubectl get pods
vim .bashrc 
exit
kubectl get pods
systemctl status k3s.service 
cat /var/lib/rancher/k3s/server/token
sudo cat /var/lib/rancher/k3s/server/token
vim .kube/
sudo -i
kubectl get pdos
kubectl get pods
sudo apt-get install kubens
sudo apt-get install kubectx
kubens
kubens -
kubens
kubens kubeflow
ls -al .kube/
chown loprych:loprych .kube/config 
sudo chown loprych:loprych .kube/config 
kubens kubeflow
cat .kube/kubens/default 
kubens -
cat .kube/config 
kubens
kubens -
kubectl get pods
vim .bashrc 
exit
k get pods
htop
df -hT
echo 'source <(kubectl completion bash)' >>~/.bashrc
exut
exit
kubectl completion bash 
vim .bashrc 
exit
k get pods
k get pods -w
exit
kubectl get pods -A
k get pods -A
kubectl delete pod -n kubeflow ml-pipeline-bf9f88745-w449d
k delete pod -n kubeflow profiles-deployment-5f46f7c9bb-7s8km
ls
k get pods -A
df -hT
fdisk -l
parted /dev/sda print free
lsblk
sudo apt update
sudo apt install fdisk parted
lsblk
fdisk -l
parted /dev/sda print free
sudo fdisk /dev/sda
sudo resize2fs /dev/sda1
sudo parted /dev/sda
sudo parted /dev/sda print
sudo swapoff -a  # Wyłącz swap
sudo parted /dev/sda rm 2  # Usuń partycję swap
sudo parted /dev/sda print free
ls
df -hT
cat /proc/swaps
sudo swapon --show
cat /proc/swaps
sudo parted /dev/sda print free
sudo parted /dev/sda resizepart 1 137GB
df -hT
sudo resize2fs /dev/sda1
df -hT
ls
free -h
ls
sudo /usr/local/bin/k3s-uninstall.sh
systemctl list-units --type=service | grep k3s
sudo rm -rf /var/lib/rancher
sudo rm -rf /etc/rancher
sudo apt update && sudo apt upgrade -y
curl -sfL https://get.k3s.io | sh -
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
k get nodes
kubectl get pods -A
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl get pods -A
k get pods -A -w
kubectl get pods -A -w
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl get pods -A -w
kubectl get pods -A 
kubectl get svc -n kubeflow
kubectl get svc istio-ingressgateway -n istio-system
kubectl get pods -A -w
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A -w
htop
kubectl describe -n kubeflow-user-example-com minio-model-pipeline-ncgnr-system-container-impl-1812526172
kubectl describe pod -n kubeflow-user-example-com minio-model-pipeline-ncgnr-system-container-impl-1812526172
kubectl describe pod -n kubeflow-user-example-com minio-model-pipeline-ncgnr-system-container-impl-1812526172 -f
kubectl describe pod -n kubeflow-user-example-com minio-model-pipeline-ncgnr-system-container-impl-1812526172 -w
kubectl describe pod -n kubeflow-user-example-com minio-model-pipeline-ncgnr-system-container-impl-1812526172
kubectl logs -n kubeflow-user-example-com minio-model-pipeline-ncgnr-system-container-impl-1812526172
kubectl logs -n kubeflow pvcviewer-controller-manager-55f545dfc4-67ghw
kubectl logs -n kubeflow pvcviewer-controller-manager-55f545dfc4-67ghw --previous
kubectl logs -n kubeflow-user-example-com minio-model-pipeline-ncgnr-system-container-impl-1812526172
watch -n 1 df -hT
kubectl port-forward -n kubeflow svc/minio-service 9000:9000
df -hT
watch n -1 free -h
watch -n 1 free -h
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
htop
cat .bashrc 
export KUBECONFIG=$HOME/.kube/config
cat .bashrc 
kubectl get pods -A
sudo chmod 644 /etc/rancher/k3s/k3s.yaml 
kubectl get pods -A
kubectl get pods -A --insecure-skip-tls-verify=true
kubectl config view
echo $KUBECONFIG
export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl get pods -A
curl -k https://127.0.0.1:6443
cd /etc/kubernetes/admin.conf
cd .kube
ls
cd /etc
ls
kubectl auth can-i '*' '*' --all-namespaces
sudo systemctl restart kubelet
sudo systemctl status k3s
ls -l /etc/kubernetes/
sudo systemctl status kubelet
sudo systemctl status k3s
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl get pods -A
echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc
source ~/.bashrc
cat .bashrc
cd ~
cat .bashrc 
vim .bashrc
source ~/.bashrc
kubectl get pods -A
cat .bashrc
cd ~/manifests/common/cert-manager/base 
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/cert-manager/kubeflow-issuer/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/istio-1-23/istio-crds/base 
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/istio-1-23/istio-namespace/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/istio-1-23/istio-install/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/oauth2-proxy/overlays/m2m-dex-and-kind
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/dex/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/kubeflow-namespace/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/networkpolicies/base 
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/kubeflow-roles/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/istio-1-23/kubeflow-istio-resources/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/centraldashboard/overlays/oauth2-proxy
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/profiles/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/common/user-namespace/base
kubectl kustomize . | kubectl apply -f -
kubectl patch svc istio-ingressgateway -n istio-system   -p '{"spec": {"type": "NodePort"}}'
kubectl get svc -A
kubectl patch svc istio-ingressgateway -n istio-system   -p '{"spec": {"type": "NodePort"}}'
kubectl patch svc istio-ingressgateway -n istio-system -p '{"spec": {"type": "NodePort"}}'
cd ~/manifests/apps/jupyter/notebook-controller/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/jupyter/jupyter-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/pvcviewer-controller/upstream/base
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/volumes-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/admission-webhook/upstream/overlays/cert-manager
kubectl kustomize . | kubectl apply -f -
cd ~https
cd ~/https
cat cluster-issuer.yaml 
kubectl apply -f cluster-issuer.yaml
sudo mkdir -p /etc/ssl/certs/kubeflow
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048   -keyout /etc/ssl/certs/kubeflow/kubeflow.key   -out /etc/ssl/certs/kubeflow/kubeflow.crt   -subj "/CN=kubeflow.local"
sudo kubectl create secret tls kubeflow-tls   --cert=/etc/ssl/certs/kubeflow/kubeflow.crt   --key=/etc/ssl/certs/kubeflow/kubeflow.key   -n istio-system
kubectl edit gateway kubeflow-gateway -n kubeflow
ls
cat kubeflow-certificate.yaml 
kubectl apply -f kubeflow-certificate.yaml
kubectl get svc istio-ingressgateway -n istio-system
cd ~/manifests/apps/tensorboard/tensorboards-web-app/upstream/overlays/istio
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/tensorboard/tensorboard-controller/upstream/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/katib/upstream/installs/katib-with-kubeflow
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/cluster-scoped-resources
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/platform-agnostic-multi-user
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
free -h
df -hT
htop
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl delete pod -n metadata-grpc-deployment-8496ffb98b-qqzcl
kubectl delete pod -n kubeflow metadata-grpc-deployment-8496ffb98b-qqzcl
kubectl get pods -A
kubectl logs -n kubeflow metadata-grpc-deployment-8496ffb98b-bsq7r
kubectl logs -n kubeflow ml-pipeline-bf9f88745-rnbn2
kubectl logs -n kubeflow metadata-grpc-deployment-8496ffb98b-bsq7r
kubectl logs -n kubeflow mysql-758cd66576-sgfc4
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl logs -n kubeflow metadata-writer-7d7dfc5b8d-8w2qv
kubectl get pods -A
kubectl logs -n kubeflow metadata-writer-7d7dfc5b8d-8w2qv
kubectl get pods -A
kubectl logs -n kubeflow ml-pipeline-bf9f88745-rnbn2 
kubectl get pods -A
kubectl delete pod -n kubeflow ml-pipeline-bf9f88745-rnbn2
kubectl get pods -A
kubectl logs -n kubeflow ml-pipeline-bf9f88745-87bs8
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl logs -n kubeflow ml-pipeline-bf9f88745-87bs8
kubectl get pods -A
kubectl logs -n kubeflow ml-pipeline-bf9f88745-87bs8
kubectl exec -it -n kubeflow ml-pipeline-bf9f88745-87bs8 -- bash -c "ulimit -n"
kubectl get pod -n kubeflow ml-pipeline-bf9f88745-87bs8 -o jsonpath="{.spec.containers[*].name}"
kubectl exec -it -n kubeflow ml-pipeline-bf9f88745-87bs8 -c ml-pipeline-api-server -- bash -c "ulimit -n"
kubectl logs -n kubeflow ml-pipeline-bf9f88745-87bs8 -c istio-proxy
kubectl logs -n kubeflow ml-pipeline-bf9f88745-87bs8 -c ml-pipeline-api-server
kubectl exec -it -n kubeflow ml-pipeline-bf9f88745-87bs8 -c ml-pipeline-api-server -- bash -c "ulimit -n"
kubectl exec -it -n kubeflow ml-pipeline-bf9f88745-87bs8 -c ml-pipeline-api-server -- bash
kubectl delete pod -n kubeflow ml-pipeline-bf9f88745-87bs8
kubectl logs -n kubeflow ml-pipeline-bf9f88745-jmds4 -c ml-pipeline-api-server
kubectl describe pod -n kubeflow ml-pipeline-bf9f88745-jmds4
kubectl logs -n kubeflow ml-pipeline-bf9f88745-jmds4 -c ml-pipeline-api-server --previous
kubectl get pod -n kubeflow -o wide | grep ml-pipeline
ulimit -n
cat /proc/sys/fs/file-max
kubectl exec -it -n kubeflow ml-pipeline-bf9f88745-jmds4 -c ml-pipeline-api-server -- bash -c "ulimit -n"
kubectl edit deployment -n kubeflow ml-pipeline
kubectl rollout restart deployment -n kubeflow ml-pipeline
k get logs -n kubeflow ml-pipeline-7bb898cb74-rqrxm
k logs -n kubeflow ml-pipeline-7bb898cb74-rqrxm
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/cluster-scoped-resources
kubectl kustomize . | kubectl apply -f -
cd ~/manifests/apps/pipeline/upstream/env/cert-manager/platform-agnostic-multi-user
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl delete pod -n kubeflow ml-pipeline-7bb898cb74-rqrxm ml-pipeline-bf9f88745-jmds4 
kubectl get pods -A
kubectl get deployment -n kubeflow ml-pipeline -o yaml | grep replicas
kubectl edit deployment -n kubeflow ml-pipeline
kubectl kustomize . | kubectl delete -f -
kubectl get pods -A
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl logs -n kubeflow metadata-grpc-deployment-8496ffb98b-gjbgp
kubectl get pods -A
kubectl logs -n kubeflow ml-pipeline-bf9f88745-ljlrq
kubectl get pods -A
kubectl edit deployment ml-pipeline-ui -n kubeflow
kubectl get pods -A
cd ~/manifests/common/knative/knative-serving/overlays/gateways
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
cd ~/manifests/common/istio-1-23/cluster-local-gateway/base
kubectl kustomize . | kubectl apply -f -
kubectl get pods -A
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-crds.yaml
kubectl apply --filename https://github.com/knative/eventing/releases/download/knative-v1.16.1/eventing-core.yaml
cd ~/manifests/contrib/kserve/kserve
kubectl get pods -A
kubectl kustomize . | kubectl apply --server-side --force-conflicts -f -
kubectl get pods -A
cd ~/manifests/contrib/kserve/models-web-app/overlays/kubeflow
kubectl kustomize . | kubectl apply -f -
kubectl get svc -n kubeflow minio-service
kubectl patch svc minio-service -n kubeflow   -p '{"spec": {"type": "NodePort"}}'
kubectl get svc -n kubeflow minio-service
kubectl get pods -n kubeflow | grep minio
curl -v http://10.43.97.118:9000
curl -v http://192.168.55.103:32491
sudo netstat -tulnp | grep 32491
sudo ss -tulnp | grep 32491
nc -zv 192.168.55.103 32491
sudo ufw status
cd ~/pipeline-config/
ls
kubectl apply -f poddefault.yaml 
kubectl apply -f minio-secret-mlpipeline.yaml 
kubectl apply -f minio-rbac.yaml 
ls -la
kubectl apply -f minio-service.yaml 
kubectl apply -f minio-secret-mlpipeline.yaml 
kubectl get pods -A -w
kubectl get pods -A
kubectl describe node 
kubectl get svc -n kubeflow
curl http://minio.kubeflow.svc.cluster.local:9000
nslookup 10.43.97.118
curl http://minio-service:9000
curl http://localhost:9000
df -hT
kubectl get pods -A
df -hT
kubectl get pods -A -w
kubectl get pods -A
kubectl delete pod -n kubeflow-user-example-com minio-model-pipeline-ncgnr-system-container-driver-2199985458 minio-model-pipeline-ncgnr-system-container-impl-1812526172 minio-model-pipeline-ncgnr-system-dag-driver-1485423858 mnist-pipeline-t42f7-system-container-driver-1087279701 mnist-pipeline-t42f7-system-container-driver-1656738035 mnist-pipeline-t42f7-system-container-driver-2222486405 mnist-pipeline-t42f7-system-container-driver-880710696 mnist-pipeline-t42f7-system-container-impl-1994396318 mnist-pipeline-t42f7-system-container-impl-213821459 mnist-pipeline-t42f7-system-container-impl-4138050773 mnist-pipeline-t42f7-system-container-impl-4155358115 mnist-pipeline-t42f7-system-dag-driver-1323720676
kubectl get pods -A
