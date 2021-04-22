# Stack:
- K8s 
- minikube project
- Docker
- Git
- Mongo
- ASP.Net Core

# Local Docker registry:

## Link
http://localhost:5000/v2/_catalog

## Documentation
https://minikube.sigs.k8s.io/docs/handbook/registry/

## Instruction
1. minikube addons enable registry
1. Start-Job -ScriptBlock {kubectl port-forward --namespace kube-system <registry name> 5000:5000}

1. docker run --rm -d --network=host -v /mnt/registry:/var/lib/registry alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:host.docker.internal:5000"

## Interaction with repository
1. docker push localhost:5000/ubuntu
1. kubectl create deployment ubuntutest --image=localhost:5000/ubuntu


# Ingress
https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

- minikube addons enable ingress

# External K8s

- minikube tunnel

# Configmaps
## Create Configmap from file <3:
- kubectl create configmap api-mongo-configmap --from-file=appsettings.json --output yaml

## update configMap:
- kubectl create configmap api-mongo-configmap --dry-run -o yaml  | kubectl apply -f -

## Open running pod
- kubectl exec -i -t mongodb-api-pod -- /bin/bash

########################
# Deployments

## Scale:
- kubectl scale deploy/mongo-api --replicas 8