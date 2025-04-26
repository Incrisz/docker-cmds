#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo swapoff -a
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


# Install the necessary packages on all nodes:
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo systemctl enable kubelet
sudo systemctl start kubelet


sudo sysctl net.ipv4.ip_forward=1
sudo sysctl -p


# MASTER NODE
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# OUTPUT
kubeadm join 172.31.19.2:6443 --token yz3bc0.gtxnmqwt9bcf8fab \
        --discovery-token-ca-cert-hash sha256:faf83ef8db681cb8d2374ecc4e95b3be98ab41e1fd235d316fec5d0b2cdd5f44


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

kubectl get nodes
kubectl get pods --all-namespaces





# WORKER NODE
nc -vz 18.130.55.135 6443

kubeadm join 172.31.19.2:6443 --token yz3bc0.gtxnmqwt9bcf8fab \
        --discovery-token-ca-cert-hash sha256:faf83ef8db681cb8d2374ecc4e95b3be98ab41e1fd235d316fec5d0b2cdd5f44

kubectl get nodes

# OPTIONAL
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
