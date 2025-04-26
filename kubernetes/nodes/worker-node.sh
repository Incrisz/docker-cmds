#!/bin/bash


# Update the package index
sudo apt update

# Install Docker
sudo apt install -y docker.io

# Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

# rename /etc/hostname content
echo -e "# $(cat /etc/hostname)\nNode-1" | sudo tee /etc/hostname > /dev/null


# Update the package index
sudo apt-get update

# Install required packages for Kubernetes
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

# Install the Kubernetes APT key
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add the Kubernetes APT repository
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update the package index again
sudo apt update

# Install kubelet and kubeadm (kubectl is optional on worker nodes)
sudo apt install -y kubelet kubeadm

kubeadm join 172.31.18.201:6443 --token o2tava.cbvuqepc9896riop \
        --discovery-token-ca-cert-hash sha256:04979323213e32d57c5aaa45801ebc1ce70b25b764518492968422a9d6cc0db3
# when unable to rejoin
# sudo kubeadm reset




