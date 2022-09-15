source ~/python_venv/bin/activate
az account set --subscription 7f44e8e4-6ddb-4247-8dff-7d8ef69c9e49
az aks get-credentials --resource-group rgk8s --name agk8s

USER_ID=$USER
echo $USER

#sudo snap install kubectl --classic

# Kubernetes  - PODs
# Get Worker Node Status
kubectl get nodes

# Get Worker Node Status with wide option
kubectl get nodes -o wide

### Create a Pod
#### Replace Pod Name, Container Image
kubectl run $USER_ID-first-pod --image atingupta2005/kubenginx:1.0.0

# List Pods
## List Pods
kubectl get pods

# Describe the Pod
kubectl describe pod $USER_ID-first-pod

# Delete Pod
kubectl delete pod $USER_ID-first-pod

# Expose Pod with a Service
# Create  a Pod
kubectl run $USER_ID-first-pod --image atingupta2005/kubenginx:1.0.0

# Expose Pod as a Service
kubectl expose pod $USER_ID-first-pod  --type=LoadBalancer --port=80 --name=$USER_ID-first-service

# Describe Service
kubectl describe service $USER_ID-first-service

SVC_PUB_IP=$(kubectl get svc $USER_ID-first-service -o json | jq .status.loadBalancer.ingress[0].ip)
SVC_PUB_IP2=${SVC_PUB_IP//\"}
echo $SVC_PUB_IP2

# Access Application
curl $SVC_PUB_IP2

# Stream pod logs and access application to see logs
kubectl logs $USER_ID-first-pod

# Get all Objects in default namespace
kubectl get all

# Delete Services
kubectl delete svc $USER_ID-first-service

# Delete Pod
kubectl delete pod $USER_ID-first-pod
