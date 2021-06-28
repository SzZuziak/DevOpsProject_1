minikube stop
$wait = 20
$pattern = "registry-(?!proxy)[a-z0-9]{5}"
$registryConf = "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:host.docker.internal:5000"

minikube start --driver=hyperv
Start-sleep -s $wait

$registryPodName = kubectl get pod -n kube-system | Select-String -Pattern $pattern  | foreach {$_.matches} | select value
Start-Job -ScriptBlock {kubectl port-forward $Using:registryPodName.Value --namespace kube-system 5000:5000}

Start-sleep -s $wait
docker run --rm -d --network=host -v K8sRegistry:/var/lib/registry alpine ash -c $registryConf
Start-sleep -s $wait