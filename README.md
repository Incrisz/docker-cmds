# docker


# Add install docker
sudo apt-get update
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update



sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo apt install docker-compose -y

sudo groupadd docker
sudo usermod -aG docker $USER

sudo usermod -aG docker ubuntu
sudo apt install make

sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

sudo docker restart portainer
## old one
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce





## mailcow - mailserver
https://github.com/christianlempa/videos/tree/main/mailcow-tutorial



# `docker cp` copies files/folders between container and local system.
# Format: docker cp <source-path> <container-id>:<destination-path>

# The following command copies 'file.txt' from local system to '/root/' in docker container with id 'f98a6b365e73'
docker cp /home/ubuntu/Autofixer-solution/coindlqo_mebany.sql a2c6d7f92dfd:/root/



















# you can use the docker commit command to create a new image from a container
docker commit 798295524bd4 08066298572/mebany:latest

# Then login
docker login

# then push to repo
docker push 08066298572/mebany:latest








# run cmds
docker-compose up

docker-compose down  
docker-compose build --no-cache  
docker-compose up -d



docker exec -it static-site /bin/bash

docker stop <container-name>
docker rm <container-name>

docker-compose up --build
docker-compose up --build service_name


alias de='docker exec -it'
de static-site /bin/bash




docker run -itd --name oc-app -p 8080:80 -p 444:443 ubuntu:latest


# Remove Docker image using image ID
docker rmi image_id

# Remove Docker image using image name
docker rmi image_name







https://platform.openai.com/api-keys












#### things to learn

kubernets networking
ECS
EKS 
brochure







ijeawele.online {
    reverse_proxy frontend:8080
}

auth.ijeawele.online {
    reverse_proxy auth-api:8081
}

todos.ijeawele.online {
    reverse_proxy todos-api:8082
}

users.ijeawele.online {
    reverse_proxy users-api:8083
}
# docker-cmds
