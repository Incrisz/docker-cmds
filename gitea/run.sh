mkdir -p gitea/{data,config}
cd gitea

sudo chown 1000:1000 config/ data/

nano docker-compose.yml




# on my pc
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"

cat ~/.ssh/id_rsa.pub

# Also add it to your gitea ssh

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

ssh-add -l

sudo cp /root/.ssh/id_rsa /home/cloud/.ssh/id_rsa
sudo cp /root/.ssh/id_rsa.pub /home/cloud/.ssh/id_rsa.pub

sudo chown cloud:cloud /home/cloud/.ssh/id_rsa
sudo chmod 600 /home/cloud/.ssh/id_rsa


ssh -p 2222 -T git@18.133.235.67
