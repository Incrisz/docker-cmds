### Components to Install on Master and Worker Nodes
### On the Master Node:
The master node (also known as the control plane) is responsible for managing the Kubernetes cluster, making decisions about the scheduling of pods, and responding to cluster events. The main components to install on the master node are:

kubeadm: This tool helps you to initialize and manage the Kubernetes cluster.
kubelet: The Kubernetes agent that runs on every node in the cluster, including the master. It ensures that containers are running in pods.
kubectl: The command-line tool to interact with the Kubernetes API. This is used for managing the cluster.
Container runtime (e.g., Docker or containerd): Needed to run containers.


### On Worker Nodes:
Worker nodes run the actual application workloads (pods). They require the following components:

kubeadm: For joining the node to the cluster.
kubelet: The agent that runs on the worker node and communicates with the control plane.
Container runtime (e.g., Docker or containerd): Needed to run containers.










## Steps to Deploy on Kubernetes (K8s)
To deploy an application on Kubernetes, you will typically need two main components:

### A Deployment YAML file:

The Deployment manages your application's lifecycle, including which Docker image to deploy, how many replicas (pods) to run, and how to handle updates.
This file specifies the instructions for deploying your application’s Docker image to the Kubernetes cluster.

## The key elements in a Deployment YAML file are:
Image: The containerized version of your application (from Docker Hub, private registry, etc.).
Replicas: How many instances of the app should be running.
Pods: Containers that run your application.

### A Service YAML file:

The Service allows communication between your application's pods and external users or other services.
It can expose your application using various service types, such as LoadBalancer (external traffic) or ClusterIP (internal communication).
The Service makes sure requests are load balanced across the running pods.


## Important Notes:
Docker Image Requirement:
Before you can deploy your application, it must be containerized into a Docker image and uploaded to a container registry (e.g., Docker Hub, Google Container Registry, Amazon ECR, or a private registry).
You will then reference this image in the Deployment YAML file, so Kubernetes knows which version of your app to pull and run.