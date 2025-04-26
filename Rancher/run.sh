# install rancher

sudo docker run --privileged -d --restart=unless-stopped -p 81:80 -p 444:443 rancher/rancher