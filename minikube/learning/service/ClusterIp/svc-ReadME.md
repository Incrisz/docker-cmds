## create
kubectl apply -f svc.yaml

## update
kubectl apply -f svc.yaml

## list 
kubectl get svc
kubectl get svc -o wide

## delete
kubectl delete svc <service-name>





## Types of Services

## ClusterIP (Default):
Exposes the service internally within the Kubernetes cluster.
Pods within the cluster can communicate with the service using its internal IP.
Example use case: Communication between backend and frontend Pods.

## NodePort:
Exposes the service on a static port on each node in the cluster.
External traffic can access the service using <NodeIP>:<NodePort>.
Example use case: Simple external access without using a load balancer.

## LoadBalancer:
Exposes the service externally using a cloud provider’s load balancer.
Example use case: Exposing an application to the internet on platforms 
like AWS, GCP, or Azure.


## ExternalName:
Maps the service to an external DNS name.
Example use case: Proxying Kubernetes requests to an external service.







## ervice with ClusterIP (Stable Communication):

1. A ClusterIP service provides a stable internal IP and DNS name for a group of pods.
2. Even if the pods are restarted, rescheduled, or their IPs change, the ClusterIP remains constant, ensuring uninterrupted communication.
3. The service handles the mapping between the stable ClusterIP and the dynamic pod IPs using Kubernetes endpoints.


## PODS-SVC COMMUNICATION using ClusterIp
kubectl apply -f nginx-pod.yaml
kubectl apply -f apache-pod.yaml

kubectl get svc -o wide


## Communication Between Pods:
Instead of using pod IPs, the nginx-pod can now communicate with the apache-pod using the service DNS names:
        apache-service for the Apache pod.
        nginx-service for the Nginx pod.

# run inside nginx pod
curl http://apache-service
