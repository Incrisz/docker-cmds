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






## Advantages of NodePort:
Simple external access without requiring an Ingress controller or external load balancer.

## Limitations of NodePort:
Port range is limited to 30000-32767.
May not scale well for production environments with heavy traffic.


## shortcut
alias k=kubectl