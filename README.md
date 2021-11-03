# CompreFace-kubernetes

CompreFace Kubernetes repository contains scripts and instructions that help deploy [Exadel CompreFace](https://github.com/exadel-inc/CompreFace) face recognition system in Kubernetes cluster.

# Deployment on Minikube
This tutorial shows how to deploy CompreFace on Minikube

1. (optional) create namespace and switch context
```commandline
kubectl apply -f minikube/0-ns.yaml
```

```commandline
kubectl config set-context --current --namespace=compreface
```

2. Deploy db
```commandline
kubectl apply -f minikube/1-db.yaml
```

3. Deploy CompreFace modules
```commandline
kubectl apply -f minikube/2-core.yaml -f minikube/3-api.yaml -f minikube/4-admin.yaml -f minikube/5-fe.yaml
```

4. For expose to network run on host
```commandline
minikube service compreface-ui
```

# Helm Chart
This tutorial shows how to deploy CompreFace using Helm. To use helm you need to install it first, see the instructions [here](https://helm.sh/docs/intro/install/)

All necessary templates and values.yaml for helm chart you can find in the `helm-config` folder

1. Install compreface chart. It will deploy the whole CompreFace application
```commandline
helm install compreface-kubernetes ./helm-config --namespace compreface --create-namespace
```

2. Run minikube service for public access from your browser
```commandline
minikube service compreface-ui -n compreface
```

3. Delete compreface chart. It will terminate CompreFace application
```commandline
helm delete compreface-kubernetes -n compreface
```
# Deployment on AWS
This tutorial shows how to install face recognition system CompreFace on AWS EKS cluster.

1. Create EKS cluster (replace subnets from given aws account)
```commandline
eksctl create cluster --name test --version 1.21 --region eu-west-1 --nodegroup-name standard-node --node-type t2.large --nodes 1 --nodes-min 1 --nodes-max 1 --managed --vpc-public-subnets subnet-4aee0001,subnet-73207829,subnet-fee6f998
```

2. Deploy application
```commandline
helm install compreface-kubernetes ./helm-config --namespace compreface --create-namespace
```

3. Delete application
```commandline
helm delete compreface-kubernetes -n compreface
```

4. Delete EKS cluster
```commandline
eksctl delete cluster --name test
```
# CloudFormation
CompreFace yaml file can be used for deploying CompreFace solution based on predefined AMIs image with CompreFace application inside
In current template ImageId: ami-0d3846ebc1bd6748e (us-east-1). It contains CompreFace release 0.6.0

To create stack you need to pass the KeyPair parameter of existing SSH key.
Stack will create separate VPC, subnet, route table, security group, EC2 instance with running CompreFace application on 8000 port.
```commandline
aws cloudformation create-stack --stack-name myteststack --template-body file://CompreFace.yml --parameters ParameterKey=KeyName,ParameterValue=IharB
```
In the outputs section of stack you will see public ip of CompreFace application.

To delete stack and all recently created resources:
```commandline
aws cloudformation delete-stack --stack-name myteststack
```

# Contributing

We want to improve our open-source face recognition solution, so your contributions are welcome and greatly appreciated.

* Just use CompreFace kubernetes and [report](https://github.com/exadel-inc/compreface-kubernetes/issues) ideas and bugs on GitHub
* Share knowledge and experience via posting guides and articles, or just improve our [documentation](https://github.com/exadel-inc/compreface-kubernetes)
* Add other kubernetes configs and tutorials. We will add it to our documentation
* And last, but not least, you can just give a star to our facial recognition kubernetes repository

After creating your first contributing pull request, you will receive a request to sign our Contributor License Agreement by commenting your pull request with a special message.

### Report Bugs

Please report any bugs [here](https://github.com/exadel-inc/compreface-kubernetes/issues).

If you are reporting a bug, please specify:

- Your operating system name and version
- kubernetes version
- CompreFace version
- Any details about your local setup that might be helpful in troubleshooting
- Detailed steps to reproduce the bug


### Submit Feedback

The best way to send us feedback is to file an issue at https://github.com/exadel-inc/compreface-kubernetes/issues.

If you are proposing a feature, please:

- Explain in detail how it should work.
- Keep the scope as narrow as possible to make it easier to implement.


# License info

CompreFace Kubernetes is released under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0.html).