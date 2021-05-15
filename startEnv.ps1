$wait = 60
minikube start --driver=hyperv
Start-sleep -s $wait

Start-Job -ScriptBlock {kubectl port-forward --namespace kube-system 5000:5000}

Start-sleep -s 20
docker run --rm -d --network=host -v /mnt/registry:/var/lib/registry alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:host.docker.internal:5000"
Start-sleep -s $wait