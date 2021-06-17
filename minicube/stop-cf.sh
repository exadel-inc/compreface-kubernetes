#!/bin/bash
kubectl delete -f 2-core.yaml -f 3-api.yaml -f 4-admin.yaml -f 5-fe.yaml
echo "Stoped!"
