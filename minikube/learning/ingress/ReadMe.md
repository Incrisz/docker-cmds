## What is Ingress?
Ingress is a Kubernetes resource that manages external access to your services, typically over HTTP and HTTPS.

## Components of Ingress
## Ingress Resource:
This is a YAML configuration file where you define the rules for routing traffic.
## Ingress Controller:
A Kubernetes component that watches for Ingress resources and implements the routing rules.
## Examples include:
    1. NGINX Ingress Controller
    2. Traefik
    3. HAProxy
    4. AWS ALB Ingress Controller (specific to AWS).


## install nginx ingress controller
sudo snap install helm --classic