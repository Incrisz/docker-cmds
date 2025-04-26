# traefik cert-manager let's encrypt


snap install helm --classic

helm version

kubectl create namespace traefik

helm repo add traefik https://helm.traefik.io/traefik

helm repo update

helm install --namespace=traefik traefik traefik/traefik --values=values.yaml






Documentation [here](https://technotim.live/posts/kube-traefik-cert-manager-le/)

Video [here](https://www.youtube.com/watch?v=G4CmbYL9UPg)
