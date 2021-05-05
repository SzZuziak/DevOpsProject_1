# Stack:
- K8s 
- minikube project
- Docker
- Git
- Mongo
- ASP.Net Core

# Logic schema:

![Image of Yaktocat](/documentation/logicSchema.png)

# Local Docker registry:

### Link
http://localhost:5000/v2/_catalog

### Documentation
https://minikube.sigs.k8s.io/docs/handbook/registry/

### Instruction
1. minikube addons enable registry
1. Start-Job -ScriptBlock {kubectl port-forward --namespace kube-system <registry name> 5000:5000}

1. docker run --rm -d --network=host -v /mnt/registry:/var/lib/registry alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:host.docker.internal:5000"

### Interaction with repository
1. docker push localhost:5000/ubuntu
1. kubectl create deployment ubuntutest --image=localhost:5000/ubuntu


# Ingress
https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

- minikube addons enable ingress

# External K8s

- minikube tunnel

# Configmaps
### Create Configmap from file <3:
- kubectl create configmap api-mongo-configmap --from-file=appsettings.json --output yaml

### Update configMap:
- kubectl create configmap api-mongo-configmap --dry-run -o yaml  | kubectl apply -f -

### Open running pod
- kubectl exec -i -t mongodb-api-pod -- /bin/bash

# Deployments

### Scale:
- kubectl scale deploy/mongo-api --replicas 8

# Prometheus
- Prometheus installation:
~~~
helm install prometheus stable/prometheus-operator --namespace monitoring
~~~


# Helm
- Add repository for Helm:
~~~
helm repo add stable https://charts.helm.sh/stable
~~~
- Install Prometheus by Helm:
~~~
helm install prometheus stable/prometheus-operator
~~~

# Base of knowledge:
- How does Kubernetes create a Pod? https://www.youtube.com/watch?v=BgrQ16r84pM
### Volumes
- https://www.youtube.com/watch?v=0swOh5C3OVM
- https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/

### Logs
- K8s https://kubernetes.io/docs/concepts/cluster-administration/logging/
- Docker logging drivers https://docs.docker.com/config/containers/logging/configure/

### Namespaces
- https://www.youtube.com/watch?v=K3jNo4z5Jx8&t=6s

### Prometheus
- https://www.youtube.com/watch?v=h4Sl21AKiDg&t=359s

### Helm
- Installation Win https://medium.com/@JockDaRock/take-the-helm-with-kubernetes-on-windows-c2cd4373104b

