            #!/bin/bash
# Step 1: Install Docker (or another container runtime) on All Nodes
# Docker is commonly used, though you can use containerd as well.

# On all nodes (both master and workers):
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

# Step 2: Install kubeadm, kubelet, and kubectl on All Nodes
# You’ll install kubeadm, kubelet, and kubectl on the master node, but only kubeadm and kubelet are required on the worker nodes.


# Add the Kubernetes APT repository:
sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

# If the directory `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
# sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list




# Install the necessary packages on all nodes:
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo systemctl enable kubelet
sudo systemctl start kubelet

# Step 3: Initialize the Kubernetes Control Plane on the Master Node

# On the master node, you will initialize the control plane using kubeadm.
# Initialize the control plane:
# master node must use 2vcpu
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

# --pod-network-cidr=192.168.0.0/16 is used if you plan to use the Calico pod network, which is a common choice for Kubernetes networking. You can change the CIDR if using another network solution.



# To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

# Step 4: Install a Pod Network Add-On on the Master Node
# Kubernetes needs a networking solution to allow communication between pods across nodes.

# Install Calico (or another network add-on like Flannel, Weave, etc.):

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# This will set up the necessary network components for your cluster.

# Step 5: Join the Worker Nodes to the Cluster
# On each worker node, you’ll use kubeadm to join them to the master node.

# On the master node, after initializing Kubernetes, you should have seen a kubeadm join command. It will look something like this:


# Run this kubeadm join command on each worker node to join them to the cluster.

# Verify the nodes have joined the cluster: On the master node, run:

kubectl get nodes







sudo apt update
sudo apt install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc


sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo usermod -aG docker $USER
newgrp docker
docker --version

systemctl status docker