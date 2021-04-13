Stack:
K8s - minikube project
Docker
Git

#######################
Local Docker registry:


http://localhost:5000/v2/_catalog

https://minikube.sigs.k8s.io/docs/handbook/registry/

1)minikube addons enable registry
2)Start-Job -ScriptBlock {kubectl port-forward --namespace kube-system <registry name> 5000:5000}
3)docker run --rm -d --network=host alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:host.docker.internal:5000"

docker push localhost:5000/ubuntu
kubectl create deployment ubuntutest --image=localhost:5000/ubuntu


########################
Ingress
https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

1)minikube addons enable ingress