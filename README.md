# CompreFace-kubernetes

# Origin
Origin project for Docker-compose
https://github.com/exadel-inc/CompreFace

# Minikube
Fixed version 0.5.1 and enviroment variables

config and script in the folder minikube/

start-db.sh starts deployment for db

start-cf.sh starts deployments for CompreFace

For expose to network run on host
> minikube service compreface-ui

# TODO
- deployments on AWS-GCP-Azure
- enviroment variables
- helm chart
- scalling