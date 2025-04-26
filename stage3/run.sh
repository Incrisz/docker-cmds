apt update 

apt upgrade -y

curl -sfL https://get.k3s.io | sh -

k3s --version

apt install uvicorn -y

sudo systemctl enable --now k3s

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

kubectl get nodes


curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/


kubectl version --client

apt install python3-pip

# sudo apt update && sudo apt install -y python3.9 python3.9-venv python3.9-dev

python3.9 --version

pip install --upgrade pip -y



# Remove old Go version
sudo rm -rf /usr/local/go

# Download and install Go 1.22 (latest stable)
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
rm go1.22.0.linux-amd64.tar.gz

# Add Go to PATH
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Verify the new version
go version


git clone https://github.com/obiMadu/backend.im-infra
cd backend.im-infra



apt install python3.12-venv -y

python3 -m venv .venv
source .venv/bin/activate


pip install -r app/requirements.txt








cd app
uvicorn main:app --host 0.0.0.0 --port 8000 --reload


