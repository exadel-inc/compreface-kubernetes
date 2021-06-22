# CompreFace-kubernetes

### Origin project for Docker-compose
### https://github.com/exadel-inc/CompreFace
---
## Minikube
Fixed version 0.5.1 and enviroment variables

### Manual

1. (optional) create namespace and switch context
> kubectl apply -f minikube/0-ns.yaml

> kubectl config set-context --current --namespace=compreface

2. Deploy db
> kubectl apply -f minikube/1-db.yaml

3. Deploy CompreFace modules
> kubectl apply -f minikube/2-core.yaml -f minikube/3-api.yaml -f minikube/4-admin.yaml -f minikube/5-fe.yaml

4. For expose to network run on host
> minikube service compreface-ui

## TODO
- deployments on AWS-GCP-Azure
- enviroment variables
- helm chart
- scalling