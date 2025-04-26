
kubectl create namespace traefik

kubectl apply -f cloudflare-secret.yml


kubectl get ns


helm repo add traefik https://traefik.github.io/charts
helm repo update

snap install helm --classic

helm install traefik traefik/traefik --values=traefik-values.yml

# 🚨 When enabling persistence for certificates, permissions on acme.json can be
# lost when Traefik restarts. You can ensure correct permissions with an
# initContainer. See https://github.com/traefik/traefik-helm-chart/blob/master/EXAMPLES.md#use-traefik-native-lets-encrypt-integration-without-cert-manager
# for more info. 🚨

kubectl get all
kubectl get events


kubectl apply -f traefik-pv.yml

kubectl get pvc





kubectl create secret generic cloudflare-secret \
--from-literal=email=skylarmike101@gmail.com \
--from-literal=apiKey=08b46cab3701adc4bbea0a4b2ee94b99913b8
