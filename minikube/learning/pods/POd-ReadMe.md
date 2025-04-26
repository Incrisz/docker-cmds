## create
kubectl apply -f pod.yaml

## view logs
kubectl logs nginx-pod
kubectl logs nginx-pod -c nginx-container

kubectl logs multi-container-pod -c nginx-container
kubectl logs multi-container-pod -c busybox-container


## open shell(terminal)
kubectl exec -it nginx-pod -- /bin/bash
kubectl exec -it nginx-pod -c <container-name> -- /bin/bash

## list 
kubectl get pods
kubectl get pods -o wide

## delete
kubectl delete pod nginx-pod
kubectl delete -f pod.yaml

## Attach pod to a running container 
kubectl attach -it nginx-pod
kubectl attach -it nginx-pod -c <container-name>

## scaling pods 
kubectl scale deployment <deployment-name> --replicas=<desired-number-of-replicas>

## copy files to and from a pod to a local machine

# Copy from Local Machine to Pod
kubectl cp /path/to/local/file nginx-pod:/path/in/pod

# Copy from Pod to Local Machine
kubectl cp nginx-pod:/path/in/pod /path/to/local/destination
